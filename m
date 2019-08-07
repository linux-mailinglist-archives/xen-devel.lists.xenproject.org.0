Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D780683FEE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:36:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAq2-0000R8-20; Wed, 07 Aug 2019 01:34:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAq0-0000QN-Et
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:00 +0000
X-Inumbo-ID: 6dbb06fb-b8b3-11e9-8980-bc764e045a96
Received: from mail-pf1-x443.google.com (unknown [2607:f8b0:4864:20::443])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6dbb06fb-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:33:59 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id g2so42501811pfq.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o2GwgSJoRuvPfZ2J7Awdgxw+WyrY01QvDnyFb1fV9Xk=;
 b=DBS4QEOYd7JEbPuapIEybK6yPbT9yH436NCQH6rDrbBzuYucty6BaNvhoi5hH6v0CL
 JtOgJ70gNZTF533IB2dCY0X/unBQS7PQHTF2oj+dliPmRRfT3OJ5pHnotZJGhHxVZbfq
 YQRB/9ot1828nW5dFsiXI0WjJ5tnCXQL7Z7DBkE4dxbfbAjeZHXxEyOO1PgLYGM0R/tb
 bQj3p4j+QH0APLbNBrYDCK8UA7Rjj5eJjYvOiTQSaFgxud4esYtpeLsQ7vEEpZptaSxw
 yfJ/AgnnMUJmxUFLjnK1nFuoz+yKZ9OxcxA/Lu5XV7Z6R3lgOiOVPkE/r0yTZn6GHACF
 KMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2GwgSJoRuvPfZ2J7Awdgxw+WyrY01QvDnyFb1fV9Xk=;
 b=bsioZFW6KrFCXUcldBhCBLaso+TVleKUi1wKEovfqxZhu/jfFWk4X893bhQ0gkU+DR
 NKjbWV9majl4sCeNH5gkLpFiNGwJPTbhMtzLLqzTTL7WNHb+VReW3vLL3U4+hvB8zGCF
 HV6LOIC3T8+FyKiQ5GJyF2DHLj5KQGyH3PwHPqL3V0TtrmJwH6mK22bRmaj5BlvnR4/d
 9M5WfRRJOj6zNl/7x86zf3yQ0AeAxMU1YUdO58sAh1W/kaELuagchLCP4l+/yKNXtGuw
 Rlw4oMom3xMmBJlrm2UG2ESmGR9abMnP8SmrfN4cvI1gTA5H+4GYYkVxMVT/8hFB1zs5
 XHpw==
X-Gm-Message-State: APjAAAWQ/xI3cx4OLzKyYkFWEUrKsD9B2hKtd68ZPKWbboQi7h1qqqzy
 hiByzWY5MxUWVg95m/LFUzg=
X-Google-Smtp-Source: APXvYqy30p2NohP2KIU0EnEWVyTf80c7khXPPY91tyi1XYk0o5oiq5Uprgt54o6LNZgppKd61nE9YQ==
X-Received: by 2002:a17:90a:6097:: with SMTP id
 z23mr6014303pji.75.1565141638870; 
 Tue, 06 Aug 2019 18:33:58 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.33.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:33:58 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:08 -0700
Message-Id: <20190807013340.9706-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 09/41] drm/radeon: convert put_page() to
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, David Zhou <David1.Zhou@amd.com>,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgKENodW5NaW5nKSBaaG91IDxEYXZp
ZDEuWmhvdUBhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl90dG0uYwppbmRleCBmYjM2OTZiYzYxNmQuLjRjOTk0M2ZhMTBkZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKQEAgLTU0MCw3ICs1NDAsNyBAQCBzdGF0aWMgaW50IHJh
ZGVvbl90dG1fdHRfcGluX3VzZXJwdHIoc3RydWN0IHR0bV90dCAqdHRtKQogCWtmcmVlKHR0bS0+
c2cpOwogCiByZWxlYXNlX3BhZ2VzOgotCXJlbGVhc2VfcGFnZXModHRtLT5wYWdlcywgcGlubmVk
KTsKKwlwdXRfdXNlcl9wYWdlcyh0dG0tPnBhZ2VzLCBwaW5uZWQpOwogCXJldHVybiByOwogfQog
Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
