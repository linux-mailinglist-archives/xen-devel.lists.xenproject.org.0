Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 617302650B7
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:26:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT9J-0005I8-3a; Thu, 10 Sep 2020 20:26:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT6D-0004JK-Tr
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:23:17 +0000
X-Inumbo-ID: 990c3b5d-edac-40e4-8ae9-b0a74ea99e0e
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 990c3b5d-edac-40e4-8ae9-b0a74ea99e0e;
 Thu, 10 Sep 2020 20:22:42 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id k25so9836122ljg.9
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yxgZFLntZkraDf9xLCHvPwNiW2e9Dwj0UjwcNkgA0sQ=;
 b=Akun53CWZb6BBO5kJrsAqNY/zZ5Laqym5XCZd0+LlPvURtDOBgvCMsDK9lJqmxJE1i
 W0YEb8daD3TwMJgsuxLl7RQVBGi2yUnC2TWuOiCMclcL/49LRsk8banvIe95LBsydupw
 daVS/DNt4jjKbwai+KQC7uP4WvqLt2RJHxHccIO2YnlFvQisDv2ZNe9nee83KW9HHJNR
 W+7UDKGTpGhyNAV4uMEicgsNLJMLclw5WYglydei8wwsUp5qQUiRsAe2yReoCAruvMDB
 hpxbnMT2cPhMjZRqMVJKoKibolPasc9mO7kAz4kWU+BJ0BERHbBW0LcGVpfEM2EC+Wxm
 lY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yxgZFLntZkraDf9xLCHvPwNiW2e9Dwj0UjwcNkgA0sQ=;
 b=TGbxDfmXMWE8kVbnb/V+xouxL3FbXEBrG25ePcwrN+PshzGYwDi1iUzmx9/F2MXOFF
 CEnuKgyX+VLysP+1DKw1HylcHx1d9lOU1OTC5+Ylbpp4ekypHSVU4VYwwbYDWMo6Fq1l
 EDEP47tyhy9hRQkeGjXO3e89n6BPPfJU2DbKRLk5Qq2Min/XBMI7ZqUVyUqNnwJI31rB
 9j5kcC4wLLsObJgoZmKdRLGzCGL3bVgrs5uznE4BIi/e995NZYk6omTOBrJLAd4BXe4R
 MUpraDZjjZSZW7fMDEdFKko6jzhzS740twhfHC7QW3XKKe4yuBaU6CW+bdDxAfVFtg7C
 NDOA==
X-Gm-Message-State: AOAM531gDzGdGXOMZy4JBqiZhNpkF8B4DyF8yIrIWlFBAfApZCuKX3QL
 ChzvH+kFjBzmXMfHIQcP/rvrqo2aRRflbg==
X-Google-Smtp-Source: ABdhPJzUiir/GYZesZdfpkEiBhXiAqO7zdE/BrOF0S8yL5Jw0rnc3Ir9R+2SKVJxxarKl1BV6QaaHg==
X-Received: by 2002:a2e:a588:: with SMTP id m8mr5240675ljp.210.1599769361044; 
 Thu, 10 Sep 2020 13:22:41 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:39 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien.grall@arm.com>
Subject: [PATCH V1 10/16] xen/mm: Handle properly reference in
 set_foreign_p2m_entry() on Arm
Date: Thu, 10 Sep 2020 23:22:04 +0300
Message-Id: <1599769330-17656-11-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch implements reference counting of foreign entries in
in set_foreign_p2m_entry() on Arm. This is a mandatory action if
we want to run emulator (IOREQ server) in other than dom0 domain,
as we can't trust it to do the right thing if it is not running
in dom0. So we need to grab a reference on the page to avoid it
disappearing.

It was tested with IOREQ feature to confirm that all the pages given
to this function belong to a domain, so we can use the same approach
as for XENMAPSPACE_gmfn_foreign handling in xenmem_add_to_physmap_one().

This involves adding an extra parameter for the foreign domain to
set_foreign_p2m_entry().

Also remove restriction for the hardware domain in the common code
if we run on Arm.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch, was split from:
     "[RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for IOREQ/DM features"
   - rewrite a logic to handle properly reference in set_foreign_p2m_entry()
     instead of treating foreign entries as p2m_ram_rw
---
---
 xen/arch/arm/p2m.c        | 16 ++++++++++++++++
 xen/arch/x86/mm/p2m.c     |  5 +++--
 xen/common/memory.c       |  4 +++-
 xen/include/asm-arm/p2m.h | 11 ++---------
 xen/include/asm-x86/p2m.h |  3 ++-
 5 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index ce59f2b..cb64fc5 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1385,6 +1385,22 @@ int guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
     return p2m_remove_mapping(d, gfn, (1 << page_order), mfn);
 }
 
+int set_foreign_p2m_entry(struct domain *d, struct domain *fd,
+                          unsigned long gfn, mfn_t mfn)
+{
+    struct page_info *page = mfn_to_page(mfn);
+    int rc;
+
+    if ( !get_page(page, fd) )
+        return -EINVAL;
+
+    rc = guest_physmap_add_entry(d, _gfn(gfn), mfn, 0, p2m_map_foreign_rw);
+    if ( rc )
+        put_page(page);
+
+    return 0;
+}
+
 static struct page_info *p2m_allocate_root(void)
 {
     struct page_info *page;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index db7bde0..f27f8a4 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1320,7 +1320,8 @@ static int set_typed_p2m_entry(struct domain *d, unsigned long gfn_l,
 }
 
 /* Set foreign mfn in the given guest's p2m table. */
-int set_foreign_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn)
+int set_foreign_p2m_entry(struct domain *d, struct domain *fd,
+                          unsigned long gfn, mfn_t mfn)
 {
     return set_typed_p2m_entry(d, gfn, mfn, PAGE_ORDER_4K, p2m_map_foreign,
                                p2m_get_hostp2m(d)->default_access);
@@ -2619,7 +2620,7 @@ int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
      * will update the m2p table which will result in  mfn -> gpfn of dom0
      * and not fgfn of domU.
      */
-    rc = set_foreign_p2m_entry(tdom, gpfn, mfn);
+    rc = set_foreign_p2m_entry(tdom, fdom, gpfn, mfn);
     if ( rc )
         gdprintk(XENLOG_WARNING, "set_foreign_p2m_entry failed. "
                  "gpfn:%lx mfn:%lx fgfn:%lx td:%d fd:%d\n",
diff --git a/xen/common/memory.c b/xen/common/memory.c
index e551fa6..78781f1 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1155,6 +1155,7 @@ static int acquire_resource(
         xen_pfn_t gfn_list[ARRAY_SIZE(mfn_list)];
         unsigned int i;
 
+#ifndef CONFIG_ARM
         /*
          * FIXME: Until foreign pages inserted into the P2M are properly
          *        reference counted, it is unsafe to allow mapping of
@@ -1162,13 +1163,14 @@ static int acquire_resource(
          */
         if ( !is_hardware_domain(currd) )
             return -EACCES;
+#endif
 
         if ( copy_from_guest(gfn_list, xmar.frame_list, xmar.nr_frames) )
             rc = -EFAULT;
 
         for ( i = 0; !rc && i < xmar.nr_frames; i++ )
         {
-            rc = set_foreign_p2m_entry(currd, gfn_list[i],
+            rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
                                        _mfn(mfn_list[i]));
             /* rc should be -EIO for any iteration other than the first */
             if ( rc && i )
diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
index 5fdb6e8..53ce373 100644
--- a/xen/include/asm-arm/p2m.h
+++ b/xen/include/asm-arm/p2m.h
@@ -381,15 +381,8 @@ static inline gfn_t gfn_next_boundary(gfn_t gfn, unsigned int order)
     return gfn_add(gfn, 1UL << order);
 }
 
-static inline int set_foreign_p2m_entry(struct domain *d, unsigned long gfn,
-                                        mfn_t mfn)
-{
-    /*
-     * NOTE: If this is implemented then proper reference counting of
-     *       foreign entries will need to be implemented.
-     */
-    return -EOPNOTSUPP;
-}
+int set_foreign_p2m_entry(struct domain *d, struct domain *fd,
+                          unsigned long gfn,  mfn_t mfn);
 
 /*
  * A vCPU has cache enabled only when the MMU is enabled and data cache
diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h
index 8abae34..23bdca1 100644
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -635,7 +635,8 @@ int p2m_is_logdirty_range(struct p2m_domain *, unsigned long start,
                           unsigned long end);
 
 /* Set foreign entry in the p2m table (for priv-mapping) */
-int set_foreign_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn);
+int set_foreign_p2m_entry(struct domain *d, struct domain *fd,
+                          unsigned long gfn, mfn_t mfn);
 
 /* Set mmio addresses in the p2m table (for pass-through) */
 int set_mmio_p2m_entry(struct domain *d, gfn_t gfn, mfn_t mfn,
-- 
2.7.4


