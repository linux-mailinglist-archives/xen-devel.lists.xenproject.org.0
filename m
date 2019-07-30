Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18E7B210
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 20:36:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsWvc-00053N-4M; Tue, 30 Jul 2019 18:32:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7rz3=V3=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1hsWva-00053I-Ok
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 18:32:50 +0000
X-Inumbo-ID: 6ebb428b-b2f8-11e9-8980-bc764e045a96
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6ebb428b-b2f8-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 18:32:49 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id i70so19758623pgd.4
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2019 11:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6fCIBt83Qg0xm9/csFeyeLFWARKqAMvTELcBmphTpo0=;
 b=JUA9FbUPr0F6xNgBd5J9MHwHtCHrMpBJuNDTvZBzKBZeCmNsbohHado2HBbGTi0It9
 yThD+OL5Bkf6Da9wJnEKF7n1ZuYfE+RCaAChBqmkI/jmB2QhloDai+ucTPidoKT2u6UQ
 29UC6QoAyrEf4tN2GNQniwXjZkr83rJH4ak6SFrbJFSb15jmyMBIWZiHh1EgvVH6j48q
 cZKmuIlqPfwxsnRzt4ye0SXQ2NpyGAmqO03R0RsRzNRYkzGXP/3U1W6hIGXqsFMnjHXR
 g7Xo3I2gA+uPgrVqyPZw3rp948eNJFIjP60aR0GcG/CsRV9BR7dafhIdCpB5PUi2sogn
 ixHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6fCIBt83Qg0xm9/csFeyeLFWARKqAMvTELcBmphTpo0=;
 b=aza+YUpQeZ0J/kE1BHMi0XkVKFD2GccFNHk1VfR1/k8pUvYR1NisYnzwGXprk1jZjB
 o/0ccjHOsNNxC3yuXFyjk0E/+ReO53B+Vh2g3mpBc+4oDB06PlzVWIBzU0o+JgXmrKSi
 YioNI019PsKypVju0du2I3qJdv+KMvgwD9QK51O01QEvn4J5vlkK+68Sxx53d45fkcF7
 jwIRnQRJbl/c4jO4sL+xTJS4sYfbecTKKopXKybCeYqv1xBhQTsAK7P/QcDkUuTXY94t
 xLm8yk3RKpg2sUQATe8GvHCcQ/viMfWnABr2mie15YP2PzvYxVbi5pjTX1TTrZzYLkUA
 ZBiw==
X-Gm-Message-State: APjAAAVNM4kMXjUt6KmI96LSkBsDHhbMP+pmmT+DqWH2iRaCa628Qkix
 zUnF7hj/oHG9FyWaveJB8ZE=
X-Google-Smtp-Source: APXvYqz3TKO5CR8bm9L/zAhw0K/5mmOOXYnkeug29AHRYcKaRz4UPuCN4Qa7WYzWXEa+PlUkZGXEBw==
X-Received: by 2002:a62:754d:: with SMTP id q74mr42050335pfc.211.1564511568653; 
 Tue, 30 Jul 2019 11:32:48 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([106.51.16.0])
 by smtp.gmail.com with ESMTPSA id j5sm57328671pgp.59.2019.07.30.11.32.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 30 Jul 2019 11:32:47 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 marmarek@invisiblethingslab.com
Date: Wed, 31 Jul 2019 00:04:56 +0530
Message-Id: <1564511696-4044-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/gntdev.c: Replace vm_map_pages() with
 vm_map_pages_zero()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 willy@infradead.org, linux@armlinux.org.uk, linux-mm@kvack.org,
 stable@vger.kernel.org, xen-devel@lists.xenproject.org,
 akpm@linux-foundation.org, Souptick Joarder <jrdr.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

J2NvbW1pdCBkZjliZGUwMTVhNzIgKCJ4ZW4vZ250ZGV2LmM6IGNvbnZlcnQgdG8gdXNlIHZtX21h
cF9wYWdlcygpIiknCmJyZWFrcyBnbnRkZXYgZHJpdmVyLiBJZiB2bWEtPnZtX3Bnb2ZmID4gMCwg
dm1fbWFwX3BhZ2VzKCkKd2lsbDoKIC0gdXNlIG1hcC0+cGFnZXMgc3RhcnRpbmcgYXQgdm1hLT52
bV9wZ29mZiBpbnN0ZWFkIG9mIDAKIC0gdmVyaWZ5IG1hcC0+Y291bnQgYWdhaW5zdCB2bWFfcGFn
ZXMoKSt2bWEtPnZtX3Bnb2ZmIGluc3RlYWQgb2YganVzdAogICB2bWFfcGFnZXMoKS4KCkluIHBy
YWN0aWNlLCB0aGlzIGJyZWFrcyB1c2luZyBhIHNpbmdsZSBnbnRkZXYgRkQgZm9yIG1hcHBpbmcg
bXVsdGlwbGUKZ3JhbnRzLgoKcmVsZXZhbnQgc3RyYWNlIG91dHB1dDoKW3BpZCAgIDg1N10gaW9j
dGwoNywgSU9DVExfR05UREVWX01BUF9HUkFOVF9SRUYsIDB4N2ZmZDM0MDdiNmQwKSA9IDAKW3Bp
ZCAgIDg1N10gbW1hcChOVUxMLCA0MDk2LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1NIQVJF
RCwgNywgMCkgPQoweDc3N2YxMjExYjAwMApbcGlkICAgODU3XSBpb2N0bCg3LCBJT0NUTF9HTlRE
RVZfU0VUX1VOTUFQX05PVElGWSwgMHg3ZmZkMzQwN2I3MTApID0gMApbcGlkICAgODU3XSBpb2N0
bCg3LCBJT0NUTF9HTlRERVZfTUFQX0dSQU5UX1JFRiwgMHg3ZmZkMzQwN2I2ZDApID0gMApbcGlk
ICAgODU3XSBtbWFwKE5VTEwsIDQwOTYsIFBST1RfUkVBRHxQUk9UX1dSSVRFLCBNQVBfU0hBUkVE
LCA3LAoweDEwMDApID0gLTEgRU5YSU8gKE5vIHN1Y2ggZGV2aWNlIG9yIGFkZHJlc3MpCgpkZXRh
aWxzIGhlcmU6Cmh0dHBzOi8vZ2l0aHViLmNvbS9RdWJlc09TL3F1YmVzLWlzc3Vlcy9pc3N1ZXMv
NTE5OQoKVGhlIHJlYXNvbiBpcyAtPiAoIGNvcHlpbmcgTWFyZWsncyB3b3JkIGZyb20gZGlzY3Vz
c2lvbikKCnZtYS0+dm1fcGdvZmYgaXMgdXNlZCBhcyBpbmRleCBwYXNzZWQgdG8gZ250ZGV2X2Zp
bmRfbWFwX2luZGV4LiBJdCdzCmJhc2ljYWxseSB1c2luZyB0aGlzIHBhcmFtZXRlciBmb3IgIndo
aWNoIGdyYW50IHJlZmVyZW5jZSB0byBtYXAiLgptYXAgc3RydWN0IHJldHVybmVkIGJ5IGdudGRl
dl9maW5kX21hcF9pbmRleCgpIGRlc2NyaWJlcyBqdXN0IHRoZSBwYWdlcwp0byBiZSBtYXBwZWQu
IFNwZWNpZmljYWxseSBtYXAtPnBhZ2VzWzBdIHNob3VsZCBiZSBtYXBwZWQgYXQKdm1hLT52bV9z
dGFydCwgbm90IHZtYS0+dm1fc3RhcnQrdm1hLT52bV9wZ29mZipQQUdFX1NJWkUuCgpXaGVuIHRy
eWluZyB0byBtYXAgZ3JhbnQgd2l0aCBpbmRleCAoYWthIHZtYS0+dm1fcGdvZmYpID4gMSwKX192
bV9tYXBfcGFnZXMoKSB3aWxsIHJlZnVzZSB0byBtYXAgaXQgYmVjYXVzZSBpdCB3aWxsIGV4cGVj
dCBtYXAtPmNvdW50CnRvIGJlIGF0IGxlYXN0IHZtYV9wYWdlcyh2bWEpK3ZtYS0+dm1fcGdvZmYs
IHdoaWxlIGl0IGlzIGV4YWN0bHkKdm1hX3BhZ2VzKHZtYSkuCgpDb252ZXJ0aW5nIHZtX21hcF9w
YWdlcygpIHRvIHVzZSB2bV9tYXBfcGFnZXNfemVybygpIHdpbGwgZml4IHRoZQpwcm9ibGVtLgoK
TWFyZWsgaGFzIHRlc3RlZCBhbmQgY29uZmlybWVkIHRoZSBzYW1lLgoKUmVwb3J0ZWQtYnk6IE1h
cmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4KU2lnbmVkLW9mZi1ieTogU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+
ClRlc3RlZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2li
bGV0aGluZ3NsYWIuY29tPgotLS0KIGRyaXZlcnMveGVuL2dudGRldi5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy94ZW4vZ250ZGV2LmMgYi9kcml2ZXJzL3hlbi9nbnRkZXYuYwppbmRleCA0YzMzOWM3Li5h
NDQ2YTcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9nbnRkZXYuYworKysgYi9kcml2ZXJzL3hl
bi9nbnRkZXYuYwpAQCAtMTE0Myw3ICsxMTQzLDcgQEAgc3RhdGljIGludCBnbnRkZXZfbW1hcChz
dHJ1Y3QgZmlsZSAqZmxpcCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiAJCWdvdG8gb3V0
X3B1dF9tYXA7CiAKIAlpZiAoIXVzZV9wdGVtb2QpIHsKLQkJZXJyID0gdm1fbWFwX3BhZ2VzKHZt
YSwgbWFwLT5wYWdlcywgbWFwLT5jb3VudCk7CisJCWVyciA9IHZtX21hcF9wYWdlc196ZXJvKHZt
YSwgbWFwLT5wYWdlcywgbWFwLT5jb3VudCk7CiAJCWlmIChlcnIpCiAJCQlnb3RvIG91dF9wdXRf
bWFwOwogCX0gZWxzZSB7Ci0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
