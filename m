Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DD8A2295
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 19:41:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3OOC-0001Yn-Eq; Thu, 29 Aug 2019 17:39:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hG9s=WZ=gmail.com=yefremov.denis@srs-us1.protection.inumbo.net>)
 id 1i3Ndr-0006jA-1Y
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 16:51:23 +0000
X-Inumbo-ID: 3abf79a4-ca7d-11e9-ae71-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3abf79a4-ca7d-11e9-ae71-12813bfff9fa;
 Thu, 29 Aug 2019 16:51:22 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id d16so4551369wme.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2019 09:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YWO650+kQjgd0freSzG4GVYInuwUakQ2FRAAY/0z/rI=;
 b=TqnKbVJQNPkbmqyIgYF3tHv/dzOrxHPS8KlZ9sikmlCojkABPl6YjDXFrsKkLJzgXS
 PvCks7N2UcPUJ7YSA9LYQQbNBSn0oVp+MKO92WPMtKMC2dqRlaBljYoyQGRMfyv7Y9dx
 oYibrl2jXDH/tSEYunIdjTINPcELNpXsLVg6X061L6/ZRSsbkAaHhpXdeUnihGLE+zCZ
 TT056vFarqOYDTuTuF0aC7jnaHsD63KVP59ZVjnV7pkjvRmke/HQOMGQEuND4XGKnu0K
 yHNUnW+PuzIGJ8+1GRTHIryEaY4/XDCDE1MmMxoRQOeQKMHvXFUubhOBwRn7ZrZhJEPi
 MGcQ==
X-Gm-Message-State: APjAAAXcs1RZ6AbZQ7AlBv077o4AknVuGhLLcAH3zlGYxv7zOCz9BZCv
 qDkCWVl1DSBinrMxDCnwFaQ=
X-Google-Smtp-Source: APXvYqzoDiooG1fxgtlB90KCm2/ikDEZkuoKce/dvTUg9dkOr5UrMz18qNY8RMFolm7jcxa9qIDUiQ==
X-Received: by 2002:a7b:c195:: with SMTP id y21mr12562563wmi.16.1567097481381; 
 Thu, 29 Aug 2019 09:51:21 -0700 (PDT)
Received: from green.intra.ispras.ru (bran.ispras.ru. [83.149.199.196])
 by smtp.googlemail.com with ESMTPSA id o14sm8340770wrg.64.2019.08.29.09.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 09:51:21 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 29 Aug 2019 19:50:18 +0300
Message-Id: <20190829165025.15750-4-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829165025.15750-1-efremov@linux.com>
References: <20190829165025.15750-1-efremov@linux.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Aug 2019 17:39:14 +0000
Subject: [Xen-devel] [PATCH v3 04/11] xen/events: Remove unlikely() from
 WARN() condition
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
Cc: Juergen Gross <jgross@suse.com>, Denis Efremov <efremov@linux.com>,
 Joe Perches <joe@perches.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

InVubGlrZWx5KFdBUk4oeCkpIiBpcyBleGNlc3NpdmUuIFdBUk4oKSBhbHJlYWR5IHVzZXMgdW5s
aWtlbHkoKQppbnRlcm5hbGx5LgoKU2lnbmVkLW9mZi1ieTogRGVuaXMgRWZyZW1vdiA8ZWZyZW1v
dkBsaW51eC5jb20+CkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUu
Y29tPgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogSm9lIFBlcmNoZXMg
PGpvZUBwZXJjaGVzLmNvbT4KQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlv
bi5vcmc+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKLS0tCiBkcml2ZXJzL3hl
bi9ldmVudHMvZXZlbnRzX2Jhc2UuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVu
dHNfYmFzZS5jIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKaW5kZXggMmU4NTcw
YzA5Nzg5Li42Yzg4NDM5NjhhNTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVu
dHNfYmFzZS5jCisrKyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCkBAIC0yNDcs
NyArMjQ3LDcgQEAgc3RhdGljIHZvaWQgeGVuX2lycV9pbmZvX2NsZWFudXAoc3RydWN0IGlycV9p
bmZvICppbmZvKQogICovCiB1bnNpZ25lZCBpbnQgZXZ0Y2huX2Zyb21faXJxKHVuc2lnbmVkIGly
cSkKIHsKLQlpZiAodW5saWtlbHkoV0FSTihpcnEgPj0gbnJfaXJxcywgIkludmFsaWQgaXJxICVk
IVxuIiwgaXJxKSkpCisJaWYgKFdBUk4oaXJxID49IG5yX2lycXMsICJJbnZhbGlkIGlycSAlZCFc
biIsIGlycSkpCiAJCXJldHVybiAwOwogCiAJcmV0dXJuIGluZm9fZm9yX2lycShpcnEpLT5ldnRj
aG47Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
