Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BB184061
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:38:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAqO-0000vd-VS; Wed, 07 Aug 2019 01:34:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAqN-0000tL-90
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:23 +0000
X-Inumbo-ID: 7b988a5c-b8b3-11e9-8980-bc764e045a96
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7b988a5c-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:34:22 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id u17so42543891pgi.6
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6GC3vp7Kgk6wrS2t1aIFSliRmKpmpPmHRVTf1Sq+2hE=;
 b=NDRrGTHqLYH0GVc6uMIRr4mVyV40WfAqYn7w+X7B2+KxadDpBkUoDH1692sptrKq4y
 C2b84L9+UrVSHeZfQfv6N2zieXkMMjWSuutP0ntWCNqq+OA3nS79IQYMOR/Bean1Ukkm
 w7u/RLKab4ibriFSyZKOgsWuNa5tCFv8C2bD6EQGHf8xo4i0ZMfxDnYEz3SYXrEQ1CAQ
 ph6xeZb31fEX0ILajRxBkvT5tnY8c7uU4gyqYPRAJWZF0hsMvVjXdHAtEuwcqejfTPc4
 Etr29q0fUGsdTj13fryfrujh6CCSRKTL9s9VWAxoxYETeOz9px/+oFZuuGBV9dnVGiqV
 vySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6GC3vp7Kgk6wrS2t1aIFSliRmKpmpPmHRVTf1Sq+2hE=;
 b=IC4MLlXctUMULVZfrA3ZOTYqJDqalo1v5Ub/3pVsuDsCWd57puieYXb/Wsvo3WKYIF
 6CnWbkwtOoR5sUU5JsiljjAN7CRxIBjMqjgZiXS6Z0ODKdsXb6j0KHtYPASI4X3NzNGu
 zfSfS+1hMmPeG5HJeWCq4AhLLmMdjRZ/8U2otcwaRXRMZ1ifHZjYd+HWvC9tU31lsP7t
 T/XzsZlbBVSRt8rid8SUVsE5+LaCAoJLZKc1Mn/xwUb14ixJk7OaXAzqy/Sa4csbdKgk
 iinYVe4dAI5aS/pia50f8oaawzt5SE9tXyAXG9sNaATWL8dYQw2cfLbea5pu6lIECHsd
 2VxA==
X-Gm-Message-State: APjAAAXvOPAMQYTo3j2Hz308W3uMm/duieCUznc3bmeQzdcWIzMdyEn1
 PkuDHhO9Tjh1VqsVW5qXUyQ=
X-Google-Smtp-Source: APXvYqwBJlH3d0L/1BSxFnL+vLT8aQU3g2pJmlFcXlcqO/GjIhh0NRs5+pZNe4h8FrEWDwW4ivgjRA==
X-Received: by 2002:a63:124a:: with SMTP id 10mr5554258pgs.254.1565141661706; 
 Tue, 06 Aug 2019 18:34:21 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:21 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:22 -0700
Message-Id: <20190807013340.9706-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 23/41] fs/exec.c: convert put_page() to
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
