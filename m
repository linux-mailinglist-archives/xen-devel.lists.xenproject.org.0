Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EF180E3B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:53:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPJy-0003hf-Lt; Sun, 04 Aug 2019 22:49:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPJw-0003em-JJ
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:49:44 +0000
X-Inumbo-ID: 26784098-b70a-11e9-8980-bc764e045a96
Received: from mail-pf1-x443.google.com (unknown [2607:f8b0:4864:20::443])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 26784098-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:49:43 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id m30so38608299pff.8
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JsaN0a6ImilSblrGqgWWjtVL4aaUVqoBD3LMggUShuU=;
 b=JnEMIs3nTK87TbKIsk78nYiw0PTY0ejtc4/1iVy6auz4dRHpNyRxFRwH1QA1daWzTN
 aXj9jYYTXz8+AYgGcMfTPEBfeFGtB4kpRaO8Pk0E6cwtra6dbEcp5zLBIuE/7ypkwlfT
 SpsJZfWDoouD9Zux+JSra/B270Q5FO6OQn2iMY62H9YA77q4YnCIt/dO49LC8oE1+DV3
 b+TloTS62XLmGXLlvmUrAcvGMvg3D8t/Jyb83QK6eNN0dmLM2VXZUouulBv1uv5lB+bU
 bCC0pVKtYc9eHNJ+luk9voAPhlxcPRRn3LwajJw/0mnVI63KipX9TSVsdQUN1tD1p56o
 UI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JsaN0a6ImilSblrGqgWWjtVL4aaUVqoBD3LMggUShuU=;
 b=Wn8QTbUWl8N4C+UaeBjdj5BGpPEaW+a5uiznpmJUFfcNpv3nTZMwWuQY7WaLX4EivD
 xZv/++lJu/v0K5DujrcRTbgbUzVJnOOZ1sGQjgCF0xP0O0t2Uxo2CJSq/+C0bHFOM/XO
 G6g9PdFR7iVT75AUqwmvFAOC2KSth0mBGM/DUnO7NN29lCC4V0iZ7oqcBCFqNMoDm6Ju
 KbD4cPtSpI/KKa1lusxyOl6rUek2hJkcq4C6degvtH++QbREC6F1ff7nJJkY9KHOJOgZ
 TXuqCCOoLUb+pLiPJibsGSKY+1RQ9GKlsQ4hC+WdhJebCxi4Fl3QqwbarrcK8JCDU0ly
 6j3Q==
X-Gm-Message-State: APjAAAWLtC7PLq1E8LEUAFD8K4xPyqUzeF99jXyzCGUWcGsW7nIDcPzw
 HA0mqac0l41jmsPTVK8ZLCA=
X-Google-Smtp-Source: APXvYqyPw77rNCbZJ7kQ+m4UN8hP7cU/4bhOvRnVoHevKNRjma2a+EIazJKEeGo0aqshVanFUuFV/w==
X-Received: by 2002:aa7:8acb:: with SMTP id b11mr67847354pfd.109.1564958983244; 
 Sun, 04 Aug 2019 15:49:43 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:42 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:48:56 -0700
Message-Id: <20190804224915.28669-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 15/34] staging/vc04_services: convert
 put_page() to put_user_page*()
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Suniel Mahesh <sunil.m@techveda.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mihaela Muraru <mihaela.muraru21@gmail.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Kishore KP <kishore.p@techveda.org>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Sidong Yang <realwakka@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, Eric Anholt <eric@anholt.net>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpBY2tlZC1ieTog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KCkNjOiBFcmlj
IEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpDYzogU3RlZmFuIFdhaHJlbiA8c3RlZmFuLndhaHJl
bkBpMnNlLmNvbT4KQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+CkNjOiBNaWhhZWxhIE11cmFydSA8bWloYWVsYS5tdXJhcnUyMUBnbWFpbC5jb20+CkNj
OiBTdW5pZWwgTWFoZXNoIDxzdW5pbC5tQHRlY2h2ZWRhLm9yZz4KQ2M6IEFsIFZpcm8gPHZpcm9A
emVuaXYubGludXgub3JnLnVrPgpDYzogU2lkb25nIFlhbmcgPHJlYWx3YWtrYUBnbWFpbC5jb20+
CkNjOiBLaXNob3JlIEtQIDxraXNob3JlLnBAdGVjaHZlZGEub3JnPgpDYzogbGludXgtcnBpLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKQ2M6IGRldmVsQGRyaXZlcmRldi5vc3Vvc2wub3JnClNpZ25lZC1vZmYtYnk6IEpv
aG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiAuLi4vdmMwNF9zZXJ2aWNlcy9p
bnRlcmZhY2UvdmNoaXFfYXJtL3ZjaGlxXzI4MzVfYXJtLmMgfCAxMCArKy0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc3RhZ2luZy92YzA0X3NlcnZpY2VzL2ludGVyZmFjZS92Y2hpcV9hcm0vdmNoaXFf
MjgzNV9hcm0uYyBiL2RyaXZlcnMvc3RhZ2luZy92YzA0X3NlcnZpY2VzL2ludGVyZmFjZS92Y2hp
cV9hcm0vdmNoaXFfMjgzNV9hcm0uYwppbmRleCA2MWM2OWYzNTNjZGIuLmVjOTJiNGM1MGU5NSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3ZjMDRfc2VydmljZXMvaW50ZXJmYWNlL3ZjaGlx
X2FybS92Y2hpcV8yODM1X2FybS5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy92YzA0X3NlcnZpY2Vz
L2ludGVyZmFjZS92Y2hpcV9hcm0vdmNoaXFfMjgzNV9hcm0uYwpAQCAtMzM2LDEwICszMzYsNyBA
QCBjbGVhbnVwX3BhZ2VsaXN0aW5mbyhzdHJ1Y3QgdmNoaXFfcGFnZWxpc3RfaW5mbyAqcGFnZWxp
c3RpbmZvKQogCX0KIAogCWlmIChwYWdlbGlzdGluZm8tPnBhZ2VzX25lZWRfcmVsZWFzZSkgewot
CQl1bnNpZ25lZCBpbnQgaTsKLQotCQlmb3IgKGkgPSAwOyBpIDwgcGFnZWxpc3RpbmZvLT5udW1f
cGFnZXM7IGkrKykKLQkJCXB1dF9wYWdlKHBhZ2VsaXN0aW5mby0+cGFnZXNbaV0pOworCQlwdXRf
dXNlcl9wYWdlcyhwYWdlbGlzdGluZm8tPnBhZ2VzLCBwYWdlbGlzdGluZm8tPm51bV9wYWdlcyk7
CiAJfQogCiAJZG1hX2ZyZWVfY29oZXJlbnQoZ19kZXYsIHBhZ2VsaXN0aW5mby0+cGFnZWxpc3Rf
YnVmZmVyX3NpemUsCkBAIC00NTQsMTAgKzQ1MSw3IEBAIGNyZWF0ZV9wYWdlbGlzdChjaGFyIF9f
dXNlciAqYnVmLCBzaXplX3QgY291bnQsIHVuc2lnbmVkIHNob3J0IHR5cGUpCiAJCQkJICAgICAg
IF9fZnVuY19fLCBhY3R1YWxfcGFnZXMsIG51bV9wYWdlcyk7CiAKIAkJCS8qIFRoaXMgaXMgcHJv
YmFibHkgZHVlIHRvIHRoZSBwcm9jZXNzIGJlaW5nIGtpbGxlZCAqLwotCQkJd2hpbGUgKGFjdHVh
bF9wYWdlcyA+IDApIHsKLQkJCQlhY3R1YWxfcGFnZXMtLTsKLQkJCQlwdXRfcGFnZShwYWdlc1th
Y3R1YWxfcGFnZXNdKTsKLQkJCX0KKwkJCXB1dF91c2VyX3BhZ2VzKHBhZ2VzLCBhY3R1YWxfcGFn
ZXMpOwogCQkJY2xlYW51cF9wYWdlbGlzdGluZm8ocGFnZWxpc3RpbmZvKTsKIAkJCXJldHVybiBO
VUxMOwogCQl9Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
