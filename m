Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806424C2F2
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 23:27:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdi4D-0000YO-TF; Wed, 19 Jun 2019 21:24:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5u+K=US=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hdi4B-0000YG-GQ
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 21:24:27 +0000
X-Inumbo-ID: 9d45540c-92d8-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9d45540c-92d8-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 21:24:26 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50C862084A;
 Wed, 19 Jun 2019 21:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560979465;
 bh=Gzyth5lRQK1tPGkua1aysnLFOiU6aZzeObMkukRBdMg=;
 h=Date:From:To:cc:Subject:From;
 b=AnCLeHYQnjdb3UyrafkXZ26PO2NrNt5P3v2owT+UlmS6WQ3xtenRGWMorELuDsxCD
 gQ0yo43TlLZQ+b820IDtMxyiSYCbI2W5PFr5fx8conx7+bxGV3RzctjTd6nNvDGF94
 45ji4/mB3b4wioXr0Js5xlhhiYaOKenQZXJUOuaY=
Date: Wed, 19 Jun 2019 14:24:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1906191422170.2072@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2091205902-1560979400=:2072"
Content-ID: <alpine.DEB.2.21.1906191423240.2072@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH] xen/arm: fix build after 2e35cdf
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
Cc: andrew.cooper3@citrix.com, julien.grall@arm.com, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2091205902-1560979400=:2072
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1906191423241.2072@sstabellini-ThinkPad-T480s>

Optee breaks the build with:

optee.c: In function ‘translate_noncontig.isra.4’:
optee.c:743:38: error: ‘xen_data’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
             xen_data->next_page_data = page_to_maddr(xen_pgs + 1);
                                      ^
optee.c:732:71: error: ‘guest_data’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
         page = get_domain_ram_page(gaddr_to_gfn(guest_data->pages_list[idx]));
                                                                       ^
optee.c:750:21: error: ‘guest_pg’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
             put_page(guest_pg);
                     ^
cc1: all warnings being treated as errors

Fix it by initializing xen_data, guest_data, guest_pg to NULL. Also set
xen_pgs to NULL for consistency.

Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>

diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
index 28d34360fc..4825cc5410 100644
--- a/xen/arch/arm/tee/optee.c
+++ b/xen/arch/arm/tee/optee.c
@@ -663,7 +663,7 @@ static int translate_noncontig(struct optee_domain *ctx,
     unsigned int order;
     unsigned int idx = 0;
     gfn_t gfn;
-    struct page_info *guest_pg, *xen_pgs;
+    struct page_info *guest_pg = NULL, *xen_pgs = NULL;
     struct optee_shm_buf *optee_shm_buf;
     /*
      * This is memory layout for page list. Basically list consists of 4k pages,
@@ -675,7 +675,7 @@ static int translate_noncontig(struct optee_domain *ctx,
     struct {
         uint64_t pages_list[PAGELIST_ENTRIES_PER_PAGE];
         uint64_t next_page_data;
-    } *guest_data, *xen_data;
+    } *guest_data = NULL, *xen_data = NULL;
 
     /* Offset of user buffer withing OPTEE_MSG_NONCONTIG_PAGE_SIZE-sized page */
     offset = param->u.tmem.buf_ptr & (OPTEE_MSG_NONCONTIG_PAGE_SIZE - 1);
--8323329-2091205902-1560979400=:2072
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2091205902-1560979400=:2072--

