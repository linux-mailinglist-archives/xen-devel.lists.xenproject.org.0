Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AD980E54
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:53:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPKF-0004HJ-VB; Sun, 04 Aug 2019 22:50:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPKD-00046k-Rs
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:50:01 +0000
X-Inumbo-ID: 30e12c6e-b70a-11e9-8980-bc764e045a96
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 30e12c6e-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:50:01 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id k8so35702112plt.3
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uQGOdku7Vl3REPvOJ8nTMNJxS9zoi9IIquO7PYdcYIA=;
 b=oIs58MXEzvjiKDUeW9Xx92JohiWAGomnLQHItXPj3gpTBXaBLirgbU7J3jjvMstF5d
 BR9zwxRQqnHrZHmC+32LB+Dm9++A3dYw7Z2gJLbUoT9k9Up7ZxFGUG2x0WkDD/8qau+X
 8ICuV69VxIrVLbwg5iBoAnxA83TGhAb0DJKf1XP2ErlJJVcbhXrO4o1FNI28ciyGEPgV
 qFlJ/47uB+ONPIryHewnPf7OnXpaPBMbJVHPddHFRguTyQ/cP/UdMYVUDXMppTee+whc
 a4C30SWihk27rz0hGEMgPT9159ZIY9uL4Q4yGaDE4CFFho6QVBfddU7eeA74Zc4mT+ns
 u84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uQGOdku7Vl3REPvOJ8nTMNJxS9zoi9IIquO7PYdcYIA=;
 b=Z5p8YD3K4UAOrxoKicziY4lMGzpQYszB0sSXleUZLPXDqsh7UFLsdjIJ0G7n0GuT1Y
 ONpBIGFX/p/WiVAm0nnh9s1dt3rzVV00qNC7dG4mer3Bmj/aaiULs25g2XNftsjIvg74
 BCDB1p/ytlc60llVLeVhJcqLH2R/XiYr+To4yZdOQ8C8t6QtBhgslYTfy7yPg6rBPcaE
 aikF/mAEyrnAEWxrDyDWarN8Br1yC8YQahvjJgYlUyTZc77fUhqK4NZyzr0WIHuz20nn
 qhRmPO9lL+Q3xJaq7FeUvcmnWayD7TMUCgZfyeTBSR1+HRXgLnbZEEgQeuHtkolE49Ri
 JjtQ==
X-Gm-Message-State: APjAAAXVpqsrjyFWKBt4ib28HX0b0+p6ff39rBFbKcYx/+qj0hweFZHL
 Pa+3gADQFRUJZeGV0VnNbDE=
X-Google-Smtp-Source: APXvYqw3vCtbIdRevAqGeALSRYvYtlE73TuMq0puGfIkY6Ze8a3qg+Hme5vTx4BKBMgk8zaLu9jyhw==
X-Received: by 2002:a17:902:2b8a:: with SMTP id
 l10mr141386929plb.283.1564959000721; 
 Sun, 04 Aug 2019 15:50:00 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:00 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:49:07 -0700
Message-Id: <20190804224915.28669-27-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 26/34] mm/gup_benchmark.c: convert put_page()
 to put_user_page*()
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, Keith Busch <keith.busch@intel.com>,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 YueHaibing <yuehaibing@huawei.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpSZXZpZXdlZC1i
eTogS2VpdGggQnVzY2ggPGtlaXRoLmJ1c2NoQGludGVsLmNvbT4KCkNjOiBEYW4gQ2FycGVudGVy
IDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPgpDYzogS2VpdGggQnVzY2ggPGtlaXRoLmJ1c2NoQGludGVs
LmNvbT4KQ2M6IEtpcmlsbCBBLiBTaHV0ZW1vdiA8a2lyaWxsLnNodXRlbW92QGxpbnV4LmludGVs
LmNvbT4KQ2M6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+CkNjOiBZdWVIYWli
aW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8
amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9ndXBfYmVuY2htYXJrLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9t
bS9ndXBfYmVuY2htYXJrLmMgYi9tbS9ndXBfYmVuY2htYXJrLmMKaW5kZXggN2RkNjAyZDdmOGRi
Li41MTVhYzhlZWI2ZWUgMTAwNjQ0Ci0tLSBhL21tL2d1cF9iZW5jaG1hcmsuYworKysgYi9tbS9n
dXBfYmVuY2htYXJrLmMKQEAgLTc5LDcgKzc5LDcgQEAgc3RhdGljIGludCBfX2d1cF9iZW5jaG1h
cmtfaW9jdGwodW5zaWduZWQgaW50IGNtZCwKIAlmb3IgKGkgPSAwOyBpIDwgbnJfcGFnZXM7IGkr
KykgewogCQlpZiAoIXBhZ2VzW2ldKQogCQkJYnJlYWs7Ci0JCXB1dF9wYWdlKHBhZ2VzW2ldKTsK
KwkJcHV0X3VzZXJfcGFnZShwYWdlc1tpXSk7CiAJfQogCWVuZF90aW1lID0ga3RpbWVfZ2V0KCk7
CiAJZ3VwLT5wdXRfZGVsdGFfdXNlYyA9IGt0aW1lX3VzX2RlbHRhKGVuZF90aW1lLCBzdGFydF90
aW1lKTsKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
