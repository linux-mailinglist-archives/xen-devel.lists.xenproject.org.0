Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8C380E2F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:53:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPJz-0003ix-7V; Sun, 04 Aug 2019 22:49:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPJx-0003gt-VY
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:49:46 +0000
X-Inumbo-ID: 275c99d9-b70a-11e9-8980-bc764e045a96
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 275c99d9-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:49:45 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id g2so38603367pfq.0
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kTcRkfjdEL9HxbTfItIV90QFm+wmUvO1k55I5bm4do4=;
 b=Ep9s674EttVY3vG9GU1V4CO0VAp8GtJx3E70Bw+ivefofNFR36jNbbRP9fe5FIQZE4
 umVMqO9egu8yEOZzzqqbwwV1I7DYNsWdtnMpjSDCOFHvVqNv36JvlrRHoOsRwSxTWTVP
 /zl1MVdDjGI3HP9tmkhM/nHneNlxFDUc/CIkN9kekhNbRfvwnuxQq6VAF9qYXEoT57y3
 qK7R3sgIPEBixUJFK2/dzWLhYDFU1YjPdLTEb28hPm7RM/mK7OCKl8gL81RQyvUkO6K/
 G7Yqf9jdy89IiWSIhZQ4nu37WAPJIhU0zlRaxZyxotIkxhGrgPKDGLU2Jo37XMi2DkW4
 GJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kTcRkfjdEL9HxbTfItIV90QFm+wmUvO1k55I5bm4do4=;
 b=cL5Uwln3DK5J38vI55ffvJ+wvyhFSJJs7bJZvE+yQc6iz8QS0XYy3McLcCF20aURjo
 i0BEEzh/ei9MS0M+VnLhCA3jIpNSZo1ybN64Jw0jjTX3+ingHfcbIp2UCSbhxtQzsCRd
 YZpOkuzG13ae+5uVmM2KEwz8PcsCErQsvPm5VfFROSuZ/QXRs6g20UZghnUpnQ173pfF
 cEvulY4zgG8foPJTn7rayt2KUZLzZF2VWvqGAd4LxCuYGh7SNF4/Mc4klQ9pg6aq4jHu
 df2uG97JyRRvAZ1cMAe9dfi9mnp5mS9DV1tYE7mjvSiNBg6pocKvS0ppMnrZp4rCibll
 2wSg==
X-Gm-Message-State: APjAAAXPbPq9Dv62H4V7Wb1W9E/CTxiXZ7WH2Yc13hDrB839SC6tDrWb
 0s/R4NdkcYBvZSFV132g9NA=
X-Google-Smtp-Source: APXvYqxK0LrtPmyfw6JWYh2YgP6+bfFhY9MmK0zn3g5ZQLaZJtrpA2Yd1v8gV+8lSuqs4iprBin/bw==
X-Received: by 2002:a63:c442:: with SMTP id m2mr4964322pgg.286.1564958984667; 
 Sun, 04 Aug 2019 15:49:44 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:44 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:48:57 -0700
Message-Id: <20190804224915.28669-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 16/34] drivers/tee: convert put_page() to
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
