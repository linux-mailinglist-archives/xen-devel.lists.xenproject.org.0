Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C457EB36
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:18:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxX-0005qr-47; Fri, 02 Aug 2019 04:14:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNB9-00074Q-Ui
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:23 +0000
X-Inumbo-ID: 14fab264-b4cc-11e9-8980-bc764e045a96
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 14fab264-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:23 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t14so32989959plr.11
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o2GwgSJoRuvPfZ2J7Awdgxw+WyrY01QvDnyFb1fV9Xk=;
 b=JHrYMRfeJbxJPRvVu2mUWlOPSRz5X9TsMoYGj7w11YGTme72BLb2VCmJtiT1crMj8E
 WFW+MhbnbkJpTwkrKMzEtbVI7vTqXv+SI+hFx6FZWh0IsKOr81DSRZrT3ou0zge/dnd5
 EXgsdat7mGxiPUC4r8AnIJEtDvOIZL+G3eepAaSt906tZ2zy13M8CWEIWzA2V9xqXZwe
 3r8aKK6oVTx9NMfrfbSmVNdddYS2ismfu/I+qiVZNMv3LWt0KFKP68hGnbZ9FH7YXxJX
 ux6o95ZiuMx2wtoGxh0CwNNs1fyU+QkDE3uHv/C0GSypFYyOdTrFbpn3G312jKYOi/u7
 rhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2GwgSJoRuvPfZ2J7Awdgxw+WyrY01QvDnyFb1fV9Xk=;
 b=jipe7J6iN6l0heFniKAXjkaMk62qg2qEBnmPbOhQfgB+9XitL3WpBRl+Lq4hZYuIIp
 graBe8++cyNMsIGmEtG9+h/gAy+X1Vic9RRozSkMR1nlIn1fz3X4XYyotwh21jCwFpBC
 dIfAvk/uqKy2cIQa4p7sPt1GmVWvw3HCEhcXWZ8rAZAfdOLCHCwap6Ftmr091yepJ9In
 DTFBnvjn/vNzr9yfR8HrTkuaR2UCmOH+Tbo55/iGHSbzbZRmXBqIut2FZ2IA6iQCDTjD
 eNI4FYBQM9M1tSX2/6cb5FzefayDrPtH+gp+Ge0TDIdNfrzETAUXAyDVrVImnyLYurhG
 gkxQ==
X-Gm-Message-State: APjAAAUfofc3bZlg1ej8/Z2WwzOJR60Qf7N7Dq4HRbIeF0uD2aXtgnMV
 8gYQXcp4QaMarQ23u11j2AU=
X-Google-Smtp-Source: APXvYqzAaZbEuJQ23N6QFJdC6uFCaO+rLm14VcZtE9+tOy9uyfg9aPHBipIj9sgNkOpEwRVfN6Xk3w==
X-Received: by 2002:a17:902:9688:: with SMTP id
 n8mr126124101plp.227.1564712422766; 
 Thu, 01 Aug 2019 19:20:22 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:22 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:38 -0700
Message-Id: <20190802022005.5117-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 07/34] drm/radeon: convert put_page() to
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
