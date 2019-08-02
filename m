Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A277EB23
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:17:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxZ-0005sj-QR; Fri, 02 Aug 2019 04:14:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBO-00077E-Pk
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:38 +0000
X-Inumbo-ID: 1dc61328-b4cc-11e9-8980-bc764e045a96
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1dc61328-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:38 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id r22so7632304pgk.10
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CBO3xGCo70BH915jG2N5Cwh2jdAxvuNp3xf6kgL3BUo=;
 b=ICzJUrYTaIdsry/DtrBHUvha+R1kZxiR3TimqNDYFmB7o5jfa7m5UsfpaX/zpz7gqG
 QDNhfomKE98We8ADhaaApqL24L4GLju/2Iqw8fB/Gdc8zIwCPKElMlCmrcylshjiY6HA
 Wpq/jdgFFEI2UXPzsw4kiY3k+2UuXyC1t4Wgx970D5YK3PPwUf+ffB7bQXfIs3z5ka8f
 jIxsm6PzFlXfLaS3w/r9zrOwtEfiVXxBJ3zPq4sXYknfWxx8T3YIHBMUaH+laDDR6clX
 EbIaZCmFhhDYcIMZgiNQmuBlXcj32bO5TFJ498KeDHFEPtpyis1t2GqB2XiuUnW1fIm6
 uMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CBO3xGCo70BH915jG2N5Cwh2jdAxvuNp3xf6kgL3BUo=;
 b=rRSDhUPq2jbF0co81UjT8IyOaQPyu59bV6l0w6p6/rQqZzOPVqxRWpjEwFKS6/7hN+
 Ya71ZSPRt9k5Jk8myPQbm/V0V5kGJdJaw+MKK7QMEqIEB0sSOdb2WY+9VS7P/YVV9Phx
 +414Itl9NwlL/pf4O2ebhMaDcxekj6QcCYY80ryRIzdVjkloajy6DlKo3ASZVXE/cyxI
 qdq6qzdUjhPcUYQ7IzyTEv8FJ7faNpyTtso4Sj4Ewo0EkvQRabCD1aAV9jHEI1gtMI76
 4ZFwqleyxDbGAnXJ1mQJ8UHa8oOGpJ13Xillzw+kS0QUp+FFeJ6YVt7d389sKZDtGI/c
 Romg==
X-Gm-Message-State: APjAAAX8Jax4SKQKr6FF58RlQZF7Gl+VrWh2J0d5uK1kE/t2/7eadeRt
 eqE+nRKuD86rGwHG1dq1Pec=
X-Google-Smtp-Source: APXvYqxkmOrmri+Wx3FPhMPhDHr4oTLl0gd58UJ9/zI2U5cFZ+LG43cVChESIiZ/iGIXbamewPD5YA==
X-Received: by 2002:a65:51c1:: with SMTP id i1mr101132075pgq.417.1564712437381; 
 Thu, 01 Aug 2019 19:20:37 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:36 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:47 -0700
Message-Id: <20190802022005.5117-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 16/34] drivers/tee: convert put_page() to
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogSmVucyBX
aWtsYW5kZXIgPGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IEpvaG4g
SHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL3RlZS90ZWVfc2htLmMg
fCAxMCArKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGVlL3RlZV9zaG0uYyBiL2RyaXZlcnMvdGVl
L3RlZV9zaG0uYwppbmRleCAyZGEwMjZmZDEyYzkuLmM5NjdkMDQyMGI2NyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy90ZWUvdGVlX3NobS5jCisrKyBiL2RyaXZlcnMvdGVlL3RlZV9zaG0uYwpAQCAtMzEs
MTYgKzMxLDEzIEBAIHN0YXRpYyB2b2lkIHRlZV9zaG1fcmVsZWFzZShzdHJ1Y3QgdGVlX3NobSAq
c2htKQogCiAJCXBvb2xtLT5vcHMtPmZyZWUocG9vbG0sIHNobSk7CiAJfSBlbHNlIGlmIChzaG0t
PmZsYWdzICYgVEVFX1NITV9SRUdJU1RFUikgewotCQlzaXplX3QgbjsKIAkJaW50IHJjID0gdGVl
ZGV2LT5kZXNjLT5vcHMtPnNobV91bnJlZ2lzdGVyKHNobS0+Y3R4LCBzaG0pOwogCiAJCWlmIChy
YykKIAkJCWRldl9lcnIodGVlZGV2LT5kZXYucGFyZW50LAogCQkJCSJ1bnJlZ2lzdGVyIHNobSAl
cCBmYWlsZWQ6ICVkIiwgc2htLCByYyk7CiAKLQkJZm9yIChuID0gMDsgbiA8IHNobS0+bnVtX3Bh
Z2VzOyBuKyspCi0JCQlwdXRfcGFnZShzaG0tPnBhZ2VzW25dKTsKLQorCQlwdXRfdXNlcl9wYWdl
cyhzaG0tPnBhZ2VzLCBzaG0tPm51bV9wYWdlcyk7CiAJCWtmcmVlKHNobS0+cGFnZXMpOwogCX0K
IApAQCAtMzEzLDE2ICszMTAsMTMgQEAgc3RydWN0IHRlZV9zaG0gKnRlZV9zaG1fcmVnaXN0ZXIo
c3RydWN0IHRlZV9jb250ZXh0ICpjdHgsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAlyZXR1cm4gc2ht
OwogZXJyOgogCWlmIChzaG0pIHsKLQkJc2l6ZV90IG47Ci0KIAkJaWYgKHNobS0+aWQgPj0gMCkg
ewogCQkJbXV0ZXhfbG9jaygmdGVlZGV2LT5tdXRleCk7CiAJCQlpZHJfcmVtb3ZlKCZ0ZWVkZXYt
Pmlkciwgc2htLT5pZCk7CiAJCQltdXRleF91bmxvY2soJnRlZWRldi0+bXV0ZXgpOwogCQl9CiAJ
CWlmIChzaG0tPnBhZ2VzKSB7Ci0JCQlmb3IgKG4gPSAwOyBuIDwgc2htLT5udW1fcGFnZXM7IG4r
KykKLQkJCQlwdXRfcGFnZShzaG0tPnBhZ2VzW25dKTsKKwkJCXB1dF91c2VyX3BhZ2VzKHNobS0+
cGFnZXMsIHNobS0+bnVtX3BhZ2VzKTsKIAkJCWtmcmVlKHNobS0+cGFnZXMpOwogCQl9CiAJfQot
LSAKMi4yMi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
