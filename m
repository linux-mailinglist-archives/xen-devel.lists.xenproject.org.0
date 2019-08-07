Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB9983FCC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:36:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAq7-0000Uj-6s; Wed, 07 Aug 2019 01:34:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAq5-0000Sv-0w
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:05 +0000
X-Inumbo-ID: 709a1501-b8b3-11e9-8980-bc764e045a96
Received: from mail-pl1-x643.google.com (unknown [2607:f8b0:4864:20::643])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 709a1501-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:34:04 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id b7so38639924pls.6
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wKnEf1dGeTf0vHOLp5WCTJvqak8NT8hcLNnzrVdQpMI=;
 b=K8d7XfBVJ8I/mb7D/So0s6zKV29K6nxqxOt+bscjBjWDfj0QC4+NZ8AYd4oczxdsUX
 7wYPGKgQnoRkCSwDEzT5rYkfZH7JJhJa6zaR/ydsa7uoMZJ2HjI2/BwiodCRxy0cgQ7K
 XR5LIHl94MzAJMcKyHWewTAlNkEf03nHhilsBgX1FcYreTK5la4X960fbNds2SN0gwIm
 bKXQLrcvXV5StThdICG212KTTY6r0QHSstMpGRVtwfJea1D8uaBa/9MN3hrGQMnPOq1P
 vjikEXBKeoKeYn0bHuTZu93yS1xwpaeL4dzZeJbSwqGj8iWMWHA9ZukGsRqP3BMDHZZx
 L72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wKnEf1dGeTf0vHOLp5WCTJvqak8NT8hcLNnzrVdQpMI=;
 b=e4HqFJXOoNT8r030lO+EDa7AleZt0c9u4+8uEniKYdvbTXiH29FfWSRozOikoj4Uxz
 5Lcf2Ows3dbi3ClpJggR2eTfhqH/0EQajbAsVP0HPczGUGVmGVWj4muCTp2WoSNk6PL/
 toQHm4/mfAff+9vyUaCYvtvBVSK5Deut9cBVLYAH3HccWv0wOMD4U52RtzOGMVQfeifP
 wHJviHxUeOHQGTQbWK6PVRQsN8uoGtYw33I5tmB0R7pmSr5asLwDSV25iJIMqLbgA+4q
 P+tBSvlf/3NF4fMzRL8UpFRshUz3k5myGnm4DKSWmSNnuWjzww0SwlVYhckQpSwfyX35
 6ifg==
X-Gm-Message-State: APjAAAVSD+VNXOaI+uXlA5oFlu19lRRgLStYVqtBcvArV2rd0cKGlqbU
 StO0fkaVIAa6Ny/5jSfOXhM=
X-Google-Smtp-Source: APXvYqyq3BsS9DZUg5HbsH/cxAQFP71mzzuud27zN7KWsFT/18m4ES12yBRl2dAxm3nkOU3YhT47jw==
X-Received: by 2002:a17:902:e30b:: with SMTP id
 cg11mr5920567plb.335.1565141643695; 
 Tue, 06 Aug 2019 18:34:03 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:03 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:11 -0700
Message-Id: <20190807013340.9706-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 12/41] genwqe: convert put_page() to
 put_user_page*()
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
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 "Guilherme G . Piccoli" <gpiccoli@linux.vnet.ibm.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 Frank Haverkamp <haver@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpUaGlzIGNoYW5n
ZXMgdGhlIHJlbGVhc2UgY29kZSBzbGlnaHRseSwgYmVjYXVzZSBlYWNoIHBhZ2Ugc2xvdCBpbiB0
aGUKcGFnZV9saXN0W10gYXJyYXkgaXMgbm8gbG9uZ2VyIGNoZWNrZWQgZm9yIE5VTEwuIEhvd2V2
ZXIsIHRoYXQgY2hlY2sKd2FzIHdyb25nIGFueXdheSwgYmVjYXVzZSB0aGUgZ2V0X3VzZXJfcGFn
ZXMoKSBwYXR0ZXJuIG9mIHVzYWdlIGhlcmUKbmV2ZXIgYWxsb3dlZCBmb3IgTlVMTCBlbnRyaWVz
IHdpdGhpbiBhIHJhbmdlIG9mIHBpbm5lZCBwYWdlcy4KCkFja2VkLWJ5OiBHcmVnIEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgoKQ2M6IEZyYW5rIEhhdmVya2FtcCA8
aGF2ZXJAbGludXgudm5ldC5pYm0uY29tPgpDYzogR3VpbGhlcm1lIEcuIFBpY2NvbGkgPGdwaWNj
b2xpQGxpbnV4LnZuZXQuaWJtLmNvbT4KQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVy
cy9taXNjL2dlbndxZS9jYXJkX3V0aWxzLmMgfCAxNyArKystLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9taXNjL2dlbndxZS9jYXJkX3V0aWxzLmMgYi9kcml2ZXJzL21pc2MvZ2Vud3FlL2Nh
cmRfdXRpbHMuYwppbmRleCAyZTFjNGQyOTA1ZTguLjJhODg4ZjMxZDJjNSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9taXNjL2dlbndxZS9jYXJkX3V0aWxzLmMKKysrIGIvZHJpdmVycy9taXNjL2dlbndx
ZS9jYXJkX3V0aWxzLmMKQEAgLTUxNywyNCArNTE3LDEzIEBAIGludCBnZW53cWVfZnJlZV9zeW5j
X3NnbChzdHJ1Y3QgZ2Vud3FlX2RldiAqY2QsIHN0cnVjdCBnZW53cWVfc2dsICpzZ2wpCiAvKioK
ICAqIGdlbndxZV9mcmVlX3VzZXJfcGFnZXMoKSAtIEdpdmUgcGlubmVkIHBhZ2VzIGJhY2sKICAq
Ci0gKiBEb2N1bWVudGF0aW9uIG9mIGdldF91c2VyX3BhZ2VzIGlzIGluIG1tL2d1cC5jOgotICoK
LSAqIElmIHRoZSBwYWdlIGlzIHdyaXR0ZW4gdG8sIHNldF9wYWdlX2RpcnR5IChvciBzZXRfcGFn
ZV9kaXJ0eV9sb2NrLAotICogYXMgYXBwcm9wcmlhdGUpIG11c3QgYmUgY2FsbGVkIGFmdGVyIHRo
ZSBwYWdlIGlzIGZpbmlzaGVkIHdpdGgsIGFuZAotICogYmVmb3JlIHB1dF9wYWdlIGlzIGNhbGxl
ZC4KKyAqIFRoZSBwYWdlcyBtYXkgaGF2ZSBiZWVuIHdyaXR0ZW4gdG8sIHNvIHdlIGNhbGwgcHV0
X3VzZXJfcGFnZXNfZGlydHlfbG9jaygpLAorICogcmF0aGVyIHRoYW4gcHV0X3VzZXJfcGFnZXMo
KS4KICAqLwogc3RhdGljIGludCBnZW53cWVfZnJlZV91c2VyX3BhZ2VzKHN0cnVjdCBwYWdlICoq
cGFnZV9saXN0LAogCQkJdW5zaWduZWQgaW50IG5yX3BhZ2VzLCBpbnQgZGlydHkpCiB7Ci0JdW5z
aWduZWQgaW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBpIDwgbnJfcGFnZXM7IGkrKykgewotCQlpZiAo
cGFnZV9saXN0W2ldICE9IE5VTEwpIHsKLQkJCWlmIChkaXJ0eSkKLQkJCQlzZXRfcGFnZV9kaXJ0
eV9sb2NrKHBhZ2VfbGlzdFtpXSk7Ci0JCQlwdXRfcGFnZShwYWdlX2xpc3RbaV0pOwotCQl9Ci0J
fQorCXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2socGFnZV9saXN0LCBucl9wYWdlcywgZGlydHkp
OwogCXJldHVybiAwOwogfQogCi0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
