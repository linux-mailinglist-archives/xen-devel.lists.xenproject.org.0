Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D333B7EB2B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:17:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxc-0005uI-JO; Fri, 02 Aug 2019 04:14:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBc-00079z-V5
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:53 +0000
X-Inumbo-ID: 25b99340-b4cc-11e9-8980-bc764e045a96
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 25b99340-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:51 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q10so35138547pff.9
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XDFswRI13oGzit66yuxshlgOj+nOKd4gwJhAdxr7MGM=;
 b=hP1EduyKMG+yuXrF7KrLXpEWytv06HPkyhEngT/TxypVjl15UFdBSQ01HK831DacB6
 y18d2lzANesimTaq9XDZY67ictckhnVqIa+djvmZG+RwwqwovWVosZPm2hXdPP8mZbc0
 0yKrCu+VZPWp1BX7LdN24uYM7pD4/H1JhmD/G5vWAzU3HcQxPlc6uryb9qFNED1nmvuy
 vlc0Xyq/DfVAu1bkczBpbXVhlvoDYp/Xx1PasljpvjsnXilMO1dGN5gCe8VOPhx84A7a
 m7JqyBz4DRJG/5S/1NCOJ5bKHp9eLh6RG6N9nPftC1UPm2sven5C2Ciggp1fXGl7R4y9
 0EuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XDFswRI13oGzit66yuxshlgOj+nOKd4gwJhAdxr7MGM=;
 b=rgyQfXUq8xwIPcQXWSlM3PZJ7HW0k8zDpxdjsJ0kRm9oCTm7F2ZwP3laZPIzB4W6Jo
 3G5MXOHeOJke0OJvnlceQWwcNuAM072NqWS9Az1tt9/Ch6EXBr8rgI4XmBYDD1ZA/ta4
 yYL83OEruGdp9DEoYzLRFIctTSmeYGP7BpUd1n5zbHBa9uQvCmDrl9fxUrpNSZ7iEfQD
 ZJS0GetASooaqXbH2MqNcG++HoJfKgvPfeiSlX38ndyRM72bTiwkOGuapTUt4udWzUnK
 Uq5gwukCu0/UbLRiG7woeO35UGUXYiWu8LXOSBu8jRSZcCFgjav4BsUnDsTGK/PgbOAD
 2PDg==
X-Gm-Message-State: APjAAAUy1Vu4pyj03jiv7vhW5Jchv62eNYjG1ulafOlWPKw9HJ7FmGfx
 7wCbeJHfWpjAQrm35x8Lo5I=
X-Google-Smtp-Source: APXvYqxrGBxtmn7yAK9mdNxfQbE+IWGBlk1o9qGDinrparVfdT4goa6Xy1ipLTWrwKQoX2yj/q+h8w==
X-Received: by 2002:aa7:8218:: with SMTP id k24mr54831158pfi.221.1564712450876; 
 Thu, 01 Aug 2019 19:20:50 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:50 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:56 -0700
Message-Id: <20190802022005.5117-26-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 25/34] mm/frame_vector.c: convert put_page() to
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
