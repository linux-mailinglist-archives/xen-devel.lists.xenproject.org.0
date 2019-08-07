Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F28083FD7
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 03:36:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvAqW-00019U-PF; Wed, 07 Aug 2019 01:34:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TALv=WD=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1hvAqU-000155-6L
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 01:34:30 +0000
X-Inumbo-ID: 7f3d384d-b8b3-11e9-8980-bc764e045a96
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7f3d384d-b8b3-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 01:34:28 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id u14so42516466pfn.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 18:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XDFswRI13oGzit66yuxshlgOj+nOKd4gwJhAdxr7MGM=;
 b=X+oC46vd7xsqyIlCfk9jfvvzV6KsruG8Ld3KbyZxbsoEi8/HO1GbnyS051djmD0t5e
 IHHS/+1UxUZwPEi5YIHD09i1hw+sYQFPMWL5MXVDvXn8jTsvyuss+94LZL/cM8p3bjpq
 d4b4EaFpAv2r0fuq82w4gX6G8xDhtpwliffNpgIRnaMzTN6SuMgZ7nNfOclK8ThivKOZ
 7xyX43NI19Uw1hhV+vBLTAkRAlmFP4cWwG7rBuQsdFHL+GJXdhmd4ykYSxe8XYPo9VdG
 z0ekXKuUssjo5Om7rTdk/VGJmbSK9hbVth13oi1xkOKAckGir4q2yshriVnE4uLo3fC5
 EABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XDFswRI13oGzit66yuxshlgOj+nOKd4gwJhAdxr7MGM=;
 b=cSXSxRr00nOcHkSRDjBnV2ywFKxei53SEUN8qyw3fP0teNcUjkrP/Qe5WMpuYibcCD
 r/W7UuuoeQRs+WI7DVQX/71l3HqhUvUm4+6pK8DZwVER6BB5zh27AVkJM8hiac3QW82I
 EjQE6xEGkfAYeRsNkkHsSyBz90hZO1j5VLPvkNbv7JWwHlMDpPG1J1/kttVDEEkxKr7C
 1pBimw5hQALddE9n+aAMyBwB+BlG0eA05nsNh9NjnJ0DMWxZ+4cayvfu1pu994RSsnVN
 P7TuxFUDh7WxTWE630KQcp2rs5WGI8Zfv+TofjKx/yU7qXVYKOkYRSwzg6Bb15+Cs23N
 PeQw==
X-Gm-Message-State: APjAAAWQ6PCP25n2dxHmpvg5FEPfspynI54ZGsB4nS5pIWVQUE5DUT0x
 3y58CxgTwDRXFciHS0vOZ+4=
X-Google-Smtp-Source: APXvYqyNVjxjb1rRFJ4zL7VZgTd8hKKqHIiZI2K7th6msFTgZFcONMzTsZWyvyMWu34CEbDocoskag==
X-Received: by 2002:a65:5202:: with SMTP id o2mr5279108pgp.29.1565141668202;
 Tue, 06 Aug 2019 18:34:28 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:27 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue,  6 Aug 2019 18:33:26 -0700
Message-Id: <20190807013340.9706-28-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v3 27/41] mm/frame_vector.c: convert put_page()
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
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mel Gorman <mgorman@suse.de>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogRGFuIFdp
bGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CkNjOiBKYW4gS2FyYSA8amFja0BzdXNl
LmN6PgpDYzogTWVsIEdvcm1hbiA8bWdvcm1hbkBzdXNlLmRlPgpDYzogVmxhc3RpbWlsIEJhYmth
IDx2YmFia2FAc3VzZS5jej4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgotLS0KIG1tL2ZyYW1lX3ZlY3Rvci5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vZnJhbWVf
dmVjdG9yLmMgYi9tbS9mcmFtZV92ZWN0b3IuYwppbmRleCBjNjRkY2E2ZTI3YzIuLmY1OTBiYWRh
Yzc3NiAxMDA2NDQKLS0tIGEvbW0vZnJhbWVfdmVjdG9yLmMKKysrIGIvbW0vZnJhbWVfdmVjdG9y
LmMKQEAgLTEyMCw3ICsxMjAsNiBAQCBFWFBPUlRfU1lNQk9MKGdldF92YWRkcl9mcmFtZXMpOwog
ICovCiB2b2lkIHB1dF92YWRkcl9mcmFtZXMoc3RydWN0IGZyYW1lX3ZlY3RvciAqdmVjKQogewot
CWludCBpOwogCXN0cnVjdCBwYWdlICoqcGFnZXM7CiAKIAlpZiAoIXZlYy0+Z290X3JlZikKQEAg
LTEzMyw4ICsxMzIsNyBAQCB2b2lkIHB1dF92YWRkcl9mcmFtZXMoc3RydWN0IGZyYW1lX3ZlY3Rv
ciAqdmVjKQogCSAqLwogCWlmIChXQVJOX09OKElTX0VSUihwYWdlcykpKQogCQlnb3RvIG91dDsK
LQlmb3IgKGkgPSAwOyBpIDwgdmVjLT5ucl9mcmFtZXM7IGkrKykKLQkJcHV0X3BhZ2UocGFnZXNb
aV0pOworCXB1dF91c2VyX3BhZ2VzKHBhZ2VzLCB2ZWMtPm5yX2ZyYW1lcyk7CiAJdmVjLT5nb3Rf
cmVmID0gZmFsc2U7CiBvdXQ6CiAJdmVjLT5ucl9mcmFtZXMgPSAwOwotLSAKMi4yMi4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
