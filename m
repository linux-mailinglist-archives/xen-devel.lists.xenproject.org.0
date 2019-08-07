Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9739E84029
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:37:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAqH-0000ju-7P; Wed, 07 Aug 2019 01:34:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAqF-0000hV-GF
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:15 +0000
X-Inumbo-ID: 76936ede-b8b3-11e9-8980-bc764e045a96
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 76936ede-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:34:14 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id az7so38558352plb.5
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kTcRkfjdEL9HxbTfItIV90QFm+wmUvO1k55I5bm4do4=;
 b=KDwx8fQCZQ/Suzu3VWi1DDiS9f3wTi5qeR5KhjjsQerQ6jWb9Bppmpi69n/V7tCxcC
 9V2HGmZDwg97QSRgi6Hzl0GWRBp4H3fcCqkNmUDvJ7PxDk1fQHC9lxTEdaxbxQEHg95+
 fmJWsxqnzJxJ030LBsGzIkf3pk8sgU5o1+lx7X7ZwO38eZaDsEUDZZ+Gf9yjWoGjqdBb
 oE7CxyrW2H4Sq40LC5GKmO3wadn0xgnPrP2IQTLB/VxU0JkFqP6vTrlLsm15L7ZnAf7Z
 6nnOQfF4c4+DtdbQKQz7daub11+4pw4UtoY7fINHO6b6C0kllebTtI7UQsSaNXpquZs/
 z2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kTcRkfjdEL9HxbTfItIV90QFm+wmUvO1k55I5bm4do4=;
 b=ZpxIi/kmP9SEHh3j14XlDeilaT5yqAgZp8Aw6qkn7dlCC2FHSU4Tda7iY7ZiIfmwoz
 EDaF276qxB/JKvwYXi4utYlRgFVxS4KAvrcF5JFv2OGR5Bk9i8KQEfplFiuFcm7A1mkL
 pEGsnjUt+XXw0ln1Cdiugs6SvfJaeAuT6dZwz3yIJ/UPMKQmtb+A/LbtpHfiC8Qa2EeJ
 OCPITs711eELCKH63FBYPaWLPh4S+pu6SaYcTWNc5faJY9XVNy8wsoxBFPS7YW/tisBN
 yrSnRV5UzEPjzPA6AIgKTq5ZQl8HJcSATNtC1iwGSuagy1DNjUpx9yvNmOgaTPlUnRFQ
 JJEw==
X-Gm-Message-State: APjAAAUUM4hedg64cNcSV9KIKoAtvxCrH66Ax9dj/CCF+Bj3S8TI3eoI
 BTt6C17WHW4CBRggeFm5cLI=
X-Google-Smtp-Source: APXvYqzTT0+13248qiTrSGNvS1mzJ345uGp41Ak44ir6kC277kEDTytzqOp0Yto6oZ69oylCJdvvLQ==
X-Received: by 2002:a17:902:f204:: with SMTP id
 gn4mr5916565plb.3.1565141653735; 
 Tue, 06 Aug 2019 18:34:13 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:13 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:17 -0700
Message-Id: <20190807013340.9706-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 18/41] drivers/tee: convert put_page() to
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
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jens Wiklander <jens.wiklander@linaro.org>
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
SmVucyBXaWtsYW5kZXIgPGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6
IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL3RlZS90ZWVf
c2htLmMgfCAxMCArKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGVlL3RlZV9zaG0uYyBiL2RyaXZl
cnMvdGVlL3RlZV9zaG0uYwppbmRleCAyZGEwMjZmZDEyYzkuLmM5NjdkMDQyMGI2NyAxMDA2NDQK
LS0tIGEvZHJpdmVycy90ZWUvdGVlX3NobS5jCisrKyBiL2RyaXZlcnMvdGVlL3RlZV9zaG0uYwpA
QCAtMzEsMTYgKzMxLDEzIEBAIHN0YXRpYyB2b2lkIHRlZV9zaG1fcmVsZWFzZShzdHJ1Y3QgdGVl
X3NobSAqc2htKQogCiAJCXBvb2xtLT5vcHMtPmZyZWUocG9vbG0sIHNobSk7CiAJfSBlbHNlIGlm
IChzaG0tPmZsYWdzICYgVEVFX1NITV9SRUdJU1RFUikgewotCQlzaXplX3QgbjsKIAkJaW50IHJj
ID0gdGVlZGV2LT5kZXNjLT5vcHMtPnNobV91bnJlZ2lzdGVyKHNobS0+Y3R4LCBzaG0pOwogCiAJ
CWlmIChyYykKIAkJCWRldl9lcnIodGVlZGV2LT5kZXYucGFyZW50LAogCQkJCSJ1bnJlZ2lzdGVy
IHNobSAlcCBmYWlsZWQ6ICVkIiwgc2htLCByYyk7CiAKLQkJZm9yIChuID0gMDsgbiA8IHNobS0+
bnVtX3BhZ2VzOyBuKyspCi0JCQlwdXRfcGFnZShzaG0tPnBhZ2VzW25dKTsKLQorCQlwdXRfdXNl
cl9wYWdlcyhzaG0tPnBhZ2VzLCBzaG0tPm51bV9wYWdlcyk7CiAJCWtmcmVlKHNobS0+cGFnZXMp
OwogCX0KIApAQCAtMzEzLDE2ICszMTAsMTMgQEAgc3RydWN0IHRlZV9zaG0gKnRlZV9zaG1fcmVn
aXN0ZXIoc3RydWN0IHRlZV9jb250ZXh0ICpjdHgsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAlyZXR1
cm4gc2htOwogZXJyOgogCWlmIChzaG0pIHsKLQkJc2l6ZV90IG47Ci0KIAkJaWYgKHNobS0+aWQg
Pj0gMCkgewogCQkJbXV0ZXhfbG9jaygmdGVlZGV2LT5tdXRleCk7CiAJCQlpZHJfcmVtb3ZlKCZ0
ZWVkZXYtPmlkciwgc2htLT5pZCk7CiAJCQltdXRleF91bmxvY2soJnRlZWRldi0+bXV0ZXgpOwog
CQl9CiAJCWlmIChzaG0tPnBhZ2VzKSB7Ci0JCQlmb3IgKG4gPSAwOyBuIDwgc2htLT5udW1fcGFn
ZXM7IG4rKykKLQkJCQlwdXRfcGFnZShzaG0tPnBhZ2VzW25dKTsKKwkJCXB1dF91c2VyX3BhZ2Vz
KHNobS0+cGFnZXMsIHNobS0+bnVtX3BhZ2VzKTsKIAkJCWtmcmVlKHNobS0+cGFnZXMpOwogCQl9
CiAJfQotLSAKMi4yMi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
