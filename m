Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B5231A5C4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 21:02:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84433.158364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAedm-0002hz-Dq; Fri, 12 Feb 2021 20:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84433.158364; Fri, 12 Feb 2021 20:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAedm-0002ha-AQ; Fri, 12 Feb 2021 20:02:10 +0000
Received: by outflank-mailman (input) for mailman id 84433;
 Fri, 12 Feb 2021 20:02:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAedl-0002hV-Ez
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 20:02:09 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id acbcb1ba-be5d-4367-898a-fee14ba32728;
 Fri, 12 Feb 2021 20:02:07 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: acbcb1ba-be5d-4367-898a-fee14ba32728
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613160127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=VdsXABp7VUh6OG8RFFA9bEJy3dHargOx/0u9ZIwHPNw=;
  b=ZhLDYYhrqSk9B6ZfJ6tLHtoZgZvFGfdfVl7BwMCrMUNuBVrP2idRp04C
   29BGl5ENFIdmw+rXrB+6voPrJDbzbkA8V13tpl1YDqWEEJ5Cs/NflhgpC
   WCzf+bk8yFpuvtEdCIX0dF5NCPVJnKac/IQeAA1Kb9dxUiBOS5Iu8v0vI
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LWEkUM+oXQstXv+mNowpsf79ZzHXf6KklcwLD47XRLOrOjuZsJBDy3hl9drAHJhg4Ix0B/GRwr
 DNikCgEvPFa8tyAwj7DFH9H/ztDxJczet4QS287Ko+GrTzX3gZUf37isbkYeg9tLzUby7xus3Q
 CEX+qJ2JqlDgWBzkBaHx+pxIY8KZC0bhSHy/gWXpwyUrj3jlkR3gQ5mtZ+Bmscv4i7NohnGWbF
 7ah8Pu3P8ItK8RxMPEzl9lBU7pz7f4RScR/gMRONOGWO+uw6grY1Toz+KcTlpHpVO3ghO9SiG3
 UZE=
X-SBRS: 5.2
X-MesageID: 37165914
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="37165914"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: [PATCH v1.1 03/10] tools/libxg: Drop stale p2m logic from ARM's meminit()
Date: Fri, 12 Feb 2021 20:01:39 +0000
Message-ID: <20210212200139.26911-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210212153953.4582-4-andrew.cooper3@citrix.com>
References: <20210212153953.4582-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Various version of gcc, when compiling with -Og, complain:

  xg_dom_arm.c: In function 'meminit':
  xg_dom_arm.c:420:19: error: 'p2m_size' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    420 |     dom->p2m_size = p2m_size;
        |     ~~~~~~~~~~~~~~^~~~~~~~~~

This is actually entirely stale code since ee21f10d70^..97e34ad22d which
removed the 1:1 identity p2m for translated domains.

Drop the write of d->p2m_size, and the p2m_size local variable.  Reposition
the p2m_size field in struct xc_dom_image and correct some stale
documentation.

This change really ought to have been part of the original cleanup series.

No actual change to how ARM domains are constructed.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>

v2:
 * Delete stale p2m_size infrastructure.
---
 tools/include/xenguest.h      | 5 ++---
 tools/libs/guest/xg_dom_arm.c | 5 -----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 775cf34c04..217022b6e7 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -145,6 +145,7 @@ struct xc_dom_image {
      * eventually copied into guest context.
      */
     xen_pfn_t *pv_p2m;
+    xen_pfn_t p2m_size;         /* number of pfns covered by pv_p2m */
 
     /* physical memory
      *
@@ -154,12 +155,10 @@ struct xc_dom_image {
      *
      * An ARM guest has GUEST_RAM_BANKS regions of RAM, with
      * rambank_size[i] pages in each. The lowest RAM address
-     * (corresponding to the base of the p2m arrays above) is stored
-     * in rambase_pfn.
+     * is stored in rambase_pfn.
      */
     xen_pfn_t rambase_pfn;
     xen_pfn_t total_pages;
-    xen_pfn_t p2m_size;         /* number of pfns covered by p2m */
     struct xc_dom_phys *phys_pages;
 #if defined (__arm__) || defined(__aarch64__)
     xen_pfn_t rambank_size[GUEST_RAM_BANKS];
diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index 94948d2b20..b4c24f15fb 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -373,7 +373,6 @@ static int meminit(struct xc_dom_image *dom)
     const uint64_t modsize = dtb_size + ramdisk_size;
     const uint64_t ram128mb = bankbase[0] + (128<<20);
 
-    xen_pfn_t p2m_size;
     uint64_t bank0end;
 
     assert(dom->rambase_pfn << XC_PAGE_SHIFT == bankbase[0]);
@@ -409,16 +408,12 @@ static int meminit(struct xc_dom_image *dom)
 
         ramsize -= banksize;
 
-        p2m_size = ( bankbase[i] + banksize - bankbase[0] ) >> XC_PAGE_SHIFT;
-
         dom->rambank_size[i] = banksize >> XC_PAGE_SHIFT;
     }
 
     assert(dom->rambank_size[0] != 0);
     assert(ramsize == 0); /* Too much RAM is rejected above */
 
-    dom->p2m_size = p2m_size;
-
     /* setup initial p2m and allocate guest memory */
     for ( i = 0; i < GUEST_RAM_BANKS && dom->rambank_size[i]; i++ )
     {
-- 
2.11.0


