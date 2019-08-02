Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666567EB34
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:18:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxb-0005tf-8a; Fri, 02 Aug 2019 04:14:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBW-00078t-2u
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:46 +0000
X-Inumbo-ID: 2220759f-b4cc-11e9-8980-bc764e045a96
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2220759f-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:45 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id i18so35237203pgl.11
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6GC3vp7Kgk6wrS2t1aIFSliRmKpmpPmHRVTf1Sq+2hE=;
 b=p2jdLnF+o2jszv2jswOdGKVlOI6oap0/O8UoWJ6UXd1vWJ7ZTNuGXBJzfbZP+U3/qi
 otCtgNo0FYJGbVJMagQHVxCjJNv9DsL+tAgpbtcseuLRjx2D2oJRJvb8QUEovItoJ4yu
 tqM1+sKVNJqdRAOn+U29/OmuIVN0dCZaqyMULYrLeNzvWGSINvgRw2ctCEPTtpJHvG4Y
 9Lt1J9Pu4o6vmxc1Dlj1+fWckvxFMkS2v0xzgYEyRXbpmL6oLpAd8HeumDihMK2pn/qS
 boIjYLobOad+m+G9IYsoBFXJgOFcyiWgGfoj3yVWjcIkFyKdq3aTzC8VwLjAVimMrt3Q
 7cZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6GC3vp7Kgk6wrS2t1aIFSliRmKpmpPmHRVTf1Sq+2hE=;
 b=j2pgT3tl3dG5hwpyw+IVXrCDNMLYwucLEpzAwHwkdqm/4oPqOjn91rVNlzYtoUXBqJ
 0LK5KT48smygxms/LAmJcWc5MCSdosA68+PUtP4pQgXpKA5taOKP5ZETilLYT8bU1he5
 mN3EAlaDJkbi0RBhFHc5ykiFHij/Zq6xHypeW0uOwlSYfnPXRGBBSdrDiB2FZIOcGkr4
 jD7ffSHiAnWy/UtyvP2loaEjpKMf607N3Nilb1LLTVkdTy+nfeCWUGBEhwh0GnTfbEJI
 EUN1lf0aZ9p0icEKVeN7iCfgdgmvjMMl4kIM5zKm/xZ6HnqVOFNJxVUChZ5CiYXHnv8k
 o1MQ==
X-Gm-Message-State: APjAAAXAtzTECQDjcR0Axwil9U/Q3wWHA9cxlU3S69FUvz15KM/XrsS0
 WBpuHhMNWdIsjGWH17XMaN0=
X-Google-Smtp-Source: APXvYqyrk8OHD0K9x3jg/zl4sLls8epCiHibtZqTP4ohZ230SxHbnF+YASroUXHGf8XghjTINYs0fA==
X-Received: by 2002:a17:90a:b394:: with SMTP id
 e20mr1897367pjr.76.1564712444816; 
 Thu, 01 Aug 2019 19:20:44 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:44 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:52 -0700
Message-Id: <20190802022005.5117-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 21/34] fs/exec.c: convert put_page() to
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
 linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQWxleGFu
ZGVyIFZpcm8gPHZpcm9AemVuaXYubGludXgub3JnLnVrPgpDYzogbGludXgtZnNkZXZlbEB2Z2Vy
Lmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEu
Y29tPgotLS0KIGZzL2V4ZWMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2ZzL2V4ZWMuYyBiL2ZzL2V4ZWMuYwppbmRl
eCBmN2Y2YTE0MDg1NmEuLmVlNDQyMTUxNTgyZiAxMDA2NDQKLS0tIGEvZnMvZXhlYy5jCisrKyBi
L2ZzL2V4ZWMuYwpAQCAtMjI3LDcgKzIyNyw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAqZ2V0X2Fy
Z19wYWdlKHN0cnVjdCBsaW51eF9iaW5wcm0gKmJwcm0sIHVuc2lnbmVkIGxvbmcgcG9zLAogCiBz
dGF0aWMgdm9pZCBwdXRfYXJnX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCiB7Ci0JcHV0X3BhZ2Uo
cGFnZSk7CisJcHV0X3VzZXJfcGFnZShwYWdlKTsKIH0KIAogc3RhdGljIHZvaWQgZnJlZV9hcmdf
cGFnZXMoc3RydWN0IGxpbnV4X2JpbnBybSAqYnBybSkKLS0gCjIuMjIuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
