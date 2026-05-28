Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFgBO0OMF2o5IwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 02:28:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B695EB3D0
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 02:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320865.1587988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSObe-0007km-N2; Thu, 28 May 2026 00:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320865.1587988; Thu, 28 May 2026 00:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSObe-0007hq-JC; Thu, 28 May 2026 00:28:14 +0000
Received: by outflank-mailman (input) for mailman id 1320865;
 Thu, 28 May 2026 00:28:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wSObc-0007Hq-UH
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 00:28:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSObc-000CGb-Ac
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 02:28:12 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a178bd3-2eae-0a2a0a5409dd-0a2a45068b06-18
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 02:28:12 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a178c1c-7371-0a2a45060019-d155da32ed7b-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 02:28:12 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-bce386d5b85so1842002666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 17:28:12 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.69]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc5ece286sm655205266b.40.2026.05.27.17.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 17:28:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779928092; x=1780532892; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdjncDbrY3UNar+wQG0hF6uZxmjzXxeMKUR7WBbGASk=;
        b=YMDvnVDBPtJoplOHMb2+wFUi/+pkS+kqRPY/yY5MxJScCmoValPvq8CfQrts38EA6E
         J2RbtR8+aC0hoN9k2+dEmI+FOD9C1KqZrOBvK3o2tj/ip41jNn6IFakU4tcGJR6usdnt
         t99wGVD8gdd63h/sP3obtzvsfbtvUZ1lrjrx2uRvNMahHBZfSVZyPlSbP853Him+aqCO
         x8bKy47oQ/vhf7U+HjnleCGokbPKpT03mNjWqNNWqW7WQaELg5N3hENJ3i8rb6e3hAgw
         oz2pRdQ0KEmSwzmM40aotX3keRglTFBsvfPZuTHORNOegFR8X/DBBbMnPPiZQBR9h+nN
         gqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779928092; x=1780532892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qdjncDbrY3UNar+wQG0hF6uZxmjzXxeMKUR7WBbGASk=;
        b=Hd6RAf4sXwbnj2tCLj7EX93ABNcsXXCkLniw3PVdm7bxR2jgP7U18o/CU1CUqoKDbD
         4ZDrdvrlT+ptiOXoLllnReiL9DyEdcETnPmAq124qoD9J1Hk008jZLtx7fE511Ry0tmC
         rdir4dI59Umgu9Kr/MVEYtCYn+klCYDfp8ZwjI+qazOis2xxY7SFNGMuDzHmE6pFgKSt
         uA5whJJgl1loK+WFliuqlwVWnJPjQM2MKDAzLQN/y03mEqpuWrWg2J3M2pfJdYzC5mfD
         h5bCcexsQot7uUXGx6jyBdeRlf/X6/vy6hlN8kbttNy/kRYrHh+nBHlTj705VgdcgkJr
         5gEQ==
X-Gm-Message-State: AOJu0Yz1hQqHdW4VWjPJt8rxLh7g7ft5nlqpyABikm8HYSTX9EE3wGZC
	bDwXnnZ5AsGVpo2g7hdVg0wYYG8Vk7WFH6XayZc1u0NS2PnHVmAmT7xwXho6CQ==
X-Gm-Gg: Acq92OEEonm8TKLhMby5ZnyhqdZ407u9VvUSglbI/tyGAMnBjfY9mIG92qpFQjIL5af
	1kgT7cUpQ82pL0VGyZ/sIOqXQwnd5I6jgPJiIPbTb1TgHLFlSThsZ1eNRmVY4o9Z0qQYzAfUq0I
	i1042/eDq6xW6KHjiFy98mIkenoB4nLpdl/e9mY/D2dLDLqB0njxpEcUcR87WyoiyqU96+Qfurg
	cH2wlwm6tLTPTAz7F41tqawMqvoE5ig5lN4XMul34NMVl7MFdmoJHrjnTn8ylySG3l7E394xB2H
	cnZlnKYkaVPfjSVZg8KAGLB5zouAF47eR2+Zn3fyqVu5qWUhDSItSD+dp1p/WhS3Wx/YkwVTgzc
	hQwheZToMTNYfBn8wfUx1MeEfDX2MVdnts8sH0O4WT/b6J55RYqhxGuyTJuKX84YkVpj/na6l0x
	09RUDM3XBvSMiZSC8GUijqtMY1jPSvsqDhRq4k
X-Received: by 2002:a17:907:72d2:b0:bdb:4cf3:7035 with SMTP id a640c23a62f3a-bdd253390b1mr1374526266b.4.1779928091403;
        Wed, 27 May 2026 17:28:11 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/4] xen/arm: its: separate ITS and host LPI quirk scopes
Date: Thu, 28 May 2026 03:25:50 +0300
Message-ID: <5edcb9ec3e643133d115f009d0d942869ffb6955.1779922874.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779922874.git.mykola_kvach@epam.com>
References: <cover.1779922874.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1779928092-8FB93D75-D9199EAC/0/0
X-purgate-type: clean
X-purgate-size: 18511
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:luca.fancellu@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:mid,epam.com:email];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 88B695EB3D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

ITS quirks can impose restrictions on memory accessed by the ITS itself and
on shared host LPI/Redistributor state. These scopes are not identical, so
a single global ITS quirk state makes the host LPI policy depend implicitly
on the quirks seen while initializing host ITSes.

Add per-ITS quirk_flags to struct host_its and keep a separate
host_lpi_flags state in the LPI code. The quirk table now records the
ITS-private and host LPI scopes explicitly through its_flags and lpi_flags.
The R-Car Gen4 quirk applies the same memory-related restrictions to both
scopes, preserving the existing behavior without relying on an implicit
aggregation step.

This also removes the old assumption that all host ITSes must expose the
same quirk state. Host LPI restrictions are accumulated only from quirk
entries that explicitly set lpi_flags.

Use per-ITS quirk_flags for GITS_CBASER, GITS_BASER<n> and ITT allocations.
Use host_lpi_flags directly in gic-v3-lpi.c for GICR_PROPBASER and
GICR_PENDBASER setup. Memory-related quirk bits are named GICV3_QUIRK_MEM_*
and are translated by shared gicv3_mem_get_*() helpers.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- Replace v1's single global ITS quirk flags and same-quirk validation with
  explicit per-ITS and host LPI quirk scopes.
- Drop the v1 ITS pre-initialization approach from this patch; host LPI
  allocation ordering is fixed separately by moving it after ITS init.
- Drop DT dma-noncoherent handling from this patch; firmware-provided
  non-coherency is handled separately with explicit ITS-node and GIC-node
  scopes.
- Keep host_lpi_flags owned by gic-v3-lpi.c and update it only with quirk
  flags that explicitly apply to host LPI/Redistributor state.
- Rename the current memory-related bits to GICV3_QUIRK_MEM_* and use
  shared gicv3_mem_get_*() helpers for register attributes and allocation
  flags.
---
 xen/arch/arm/gic-v3-its.c             | 113 ++++++++++++--------------
 xen/arch/arm/gic-v3-lpi.c             |  44 ++++++++--
 xen/arch/arm/include/asm/gic_v3_its.h |  19 +++--
 3 files changed, 101 insertions(+), 75 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 7560d46c6d..dc48a84789 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -51,99 +51,81 @@ struct its_device {
     struct pending_irq *pend_irqs;      /* One struct per event */
 };
 
-/*
- * It is unlikely that a platform implements ITSes with different quirks,
- * so assume they all share the same.
- */
 struct its_quirk {
     const char *desc;
-    bool (*init)(struct host_its *hw_its);
     uint32_t iidr;
     uint32_t mask;
+    uint32_t its_flags;
+    /*
+     * lpi_flags are ORed into the global host LPI policy and must only
+     * contain additive restrictions. Non-additive LPI quirks need explicit
+     * handling.
+     */
+    uint32_t lpi_flags;
 };
 
-static uint32_t __ro_after_init its_quirk_flags;
-
-static bool gicv3_its_enable_quirk_gen4(struct host_its *hw_its)
-{
-    its_quirk_flags |= HOST_ITS_WORKAROUND_NC_NS |
-        HOST_ITS_WORKAROUND_32BIT_ADDR;
-
-    return true;
-}
-
 static const struct its_quirk its_quirks[] = {
     {
         .desc	= "R-Car Gen4",
         .iidr	= 0x0201743b,
         .mask	= 0xffffffffU,
-        .init	= gicv3_its_enable_quirk_gen4,
+        .its_flags = GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADDR,
+        .lpi_flags = GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADDR,
     },
     {
         /* Sentinel. */
     }
 };
 
-static struct its_quirk* gicv3_its_find_quirk(uint32_t iidr)
+static const struct its_quirk *__init gicv3_its_find_quirk(uint32_t iidr)
 {
     const struct its_quirk *quirks = its_quirks;
 
+    /*
+     * The first matching quirk wins. More specific quirks must be listed
+     * before broader IIDR-only entries.
+     */
     for ( ; quirks->desc; quirks++ )
     {
         if ( quirks->iidr == (quirks->mask & iidr) )
-            return (struct its_quirk *)quirks;
+            return quirks;
     }
 
     return NULL;
 }
 
-static void gicv3_its_enable_quirks(struct host_its *hw_its)
+static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
 {
     uint32_t iidr = readl_relaxed(hw_its->its_base + GITS_IIDR);
     const struct its_quirk *quirk = gicv3_its_find_quirk(iidr);
 
-    if ( quirk && quirk->init(hw_its) )
-        printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
-}
-
-static void gicv3_its_validate_quirks(void)
-{
-    const struct its_quirk *quirk = NULL, *prev = NULL;
-    const struct host_its *hw_its;
-
-    if ( list_empty(&host_its_list) )
-        return;
-
-    hw_its = list_first_entry(&host_its_list, struct host_its, entry);
-    prev = gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GITS_IIDR));
-
-    list_for_each_entry(hw_its, &host_its_list, entry)
+    if ( quirk )
     {
-        quirk = gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GITS_IIDR));
-        BUG_ON(quirk != prev);
-        prev = quirk;
+        hw_its->quirk_flags |= quirk->its_flags;
+        gicv3_lpi_update_host_flags(quirk->lpi_flags);
+        printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
     }
 }
 
-uint64_t gicv3_its_get_cacheability(void)
+uint64_t gicv3_mem_get_cacheability(uint32_t flags)
 {
-    if ( its_quirk_flags & HOST_ITS_WORKAROUND_NC_NS )
+    if ( flags & GICV3_QUIRK_MEM_NC_NS )
         return GIC_BASER_CACHE_nC;
 
     return GIC_BASER_CACHE_RaWaWb;
 }
 
-uint64_t gicv3_its_get_shareability(void)
+uint64_t gicv3_mem_get_shareability(uint32_t flags)
 {
-    if ( its_quirk_flags & HOST_ITS_WORKAROUND_NC_NS )
+    if ( flags & GICV3_QUIRK_MEM_NC_NS )
         return GIC_BASER_NonShareable;
 
     return GIC_BASER_InnerShareable;
 }
 
-unsigned int gicv3_its_get_memflags(void)
+unsigned int gicv3_mem_get_alloc_flags(uint32_t flags)
 {
-    if ( its_quirk_flags & HOST_ITS_WORKAROUND_32BIT_ADDR )
+    if ( flags & GICV3_QUIRK_MEM_32BIT_ADDR )
         return MEMF_bits(32);
 
     return 0;
@@ -390,13 +372,17 @@ static void *its_map_cbaser(struct host_its *its)
     uint64_t reg;
     unsigned int order;
     void *buffer;
+    uint64_t cacheability = gicv3_mem_get_cacheability(its->quirk_flags);
+    uint64_t shareability = gicv3_mem_get_shareability(its->quirk_flags);
+    unsigned int memflags = gicv3_mem_get_alloc_flags(its->quirk_flags);
 
-    reg  = gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHIFT;
-    reg |= GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILITY_SHIFT;
-    reg |= gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILITY_SHIFT;
+    reg  = MASK_INSR(shareability, GITS_BASER_SHAREABILITY_MASK);
+    reg |= MASK_INSR(GIC_BASER_CACHE_SameAsInner,
+                     GITS_BASER_OUTER_CACHEABILITY_MASK);
+    reg |= MASK_INSR(cacheability, GITS_BASER_INNER_CACHEABILITY_MASK);
 
     order = get_order_from_bytes(max(ITS_CMD_QUEUE_SZ, SZ_64K));
-    buffer = alloc_xenheap_pages(order, gicv3_its_get_memflags());
+    buffer = alloc_xenheap_pages(order, memflags);
     if ( !buffer )
         return NULL;
 
@@ -437,8 +423,8 @@ static void *its_map_cbaser(struct host_its *its)
 /* The ITS BASE registers work with page sizes of 4K, 16K or 64K. */
 #define BASER_PAGE_BITS(sz) ((sz) * 2 + 12)
 
-static int its_map_baser(void __iomem *basereg, uint64_t regc,
-                         unsigned int nr_items)
+static int its_map_baser(struct host_its *its, void __iomem *basereg,
+                         uint64_t regc, unsigned int nr_items)
 {
     uint64_t attr, reg;
     unsigned int entry_size = GITS_BASER_ENTRY_SIZE(regc);
@@ -446,10 +432,14 @@ static int its_map_baser(void __iomem *basereg, uint64_t regc,
     unsigned int table_size;
     unsigned int order;
     void *buffer;
+    uint64_t cacheability = gicv3_mem_get_cacheability(its->quirk_flags);
+    uint64_t shareability = gicv3_mem_get_shareability(its->quirk_flags);
+    unsigned int memflags = gicv3_mem_get_alloc_flags(its->quirk_flags);
 
-    attr  = gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHIFT;
-    attr |= GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILITY_SHIFT;
-    attr |= gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILITY_SHIFT;
+    attr  = MASK_INSR(shareability, GITS_BASER_SHAREABILITY_MASK);
+    attr |= MASK_INSR(GIC_BASER_CACHE_SameAsInner,
+                      GITS_BASER_OUTER_CACHEABILITY_MASK);
+    attr |= MASK_INSR(cacheability, GITS_BASER_INNER_CACHEABILITY_MASK);
 
     /*
      * Setup the BASE register with the attributes that we like. Then read
@@ -463,7 +453,7 @@ retry:
     table_size = min(table_size, 256U << BASER_PAGE_BITS(pagesz));
 
     order = get_order_from_bytes(max(table_size, BIT(BASER_PAGE_BITS(pagesz), U)));
-    buffer = alloc_xenheap_pages(order, gicv3_its_get_memflags());
+    buffer = alloc_xenheap_pages(order, memflags);
     if ( !buffer )
         return -ENOMEM;
 
@@ -562,7 +552,7 @@ static int gicv3_its_init_single_its(struct host_its *hw_its)
     if ( ret )
         return ret;
 
-    gicv3_its_enable_quirks(hw_its);
+    gicv3_its_collect_quirks(hw_its);
 
     reg = readq_relaxed(hw_its->its_base + GITS_TYPER);
     hw_its->devid_bits = GITS_TYPER_DEVICE_ID_BITS(reg);
@@ -584,18 +574,19 @@ static int gicv3_its_init_single_its(struct host_its *hw_its)
         case GITS_BASER_TYPE_NONE:
             continue;
         case GITS_BASER_TYPE_DEVICE:
-            ret = its_map_baser(basereg, reg, BIT(hw_its->devid_bits, UL));
+            ret = its_map_baser(hw_its, basereg, reg,
+                                BIT(hw_its->devid_bits, UL));
             if ( ret )
                 return ret;
             break;
         case GITS_BASER_TYPE_COLLECTION:
-            ret = its_map_baser(basereg, reg, num_possible_cpus());
+            ret = its_map_baser(hw_its, basereg, reg, num_possible_cpus());
             if ( ret )
                 return ret;
             break;
         /* In case this is a GICv4, provide a (dummy) vPE table as well. */
         case GITS_BASER_TYPE_VCPU:
-            ret = its_map_baser(basereg, reg, 1);
+            ret = its_map_baser(hw_its, basereg, reg, 1);
             if ( ret )
                 return ret;
             break;
@@ -730,6 +721,7 @@ int gicv3_its_map_guest_device(struct domain *d,
     struct its_device *dev = NULL;
     struct rb_node **new = &d->arch.vgic.its_devices.rb_node, *parent = NULL;
     int i, ret = -ENOENT;      /* "i" must be signed to check for >= 0 below. */
+    unsigned int memflags;
     unsigned int order;
 
     hw_its = gicv3_its_find_by_doorbell(host_doorbell);
@@ -793,8 +785,9 @@ int gicv3_its_map_guest_device(struct domain *d,
     ret = -ENOMEM;
 
     /* An Interrupt Translation Table needs to be 256-byte aligned. */
+    memflags = gicv3_mem_get_alloc_flags(hw_its->quirk_flags);
     order = get_order_from_bytes(max(nr_events * hw_its->itte_size, 256UL));
-    itt_addr = alloc_xenheap_pages(order, gicv3_its_get_memflags());
+    itt_addr = alloc_xenheap_pages(order, memflags);
     if ( !itt_addr )
         goto out_unlock;
 
@@ -1206,8 +1199,6 @@ int gicv3_its_init(void)
             return ret;
     }
 
-    gicv3_its_validate_quirks();
-
     return 0;
 }
 
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 9ee338edc2..35f93e4756 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -78,9 +78,29 @@ struct lpi_redist_data {
 
 static DEFINE_PER_CPU(struct lpi_redist_data, lpi_redist);
 
+/*
+ * Host LPI flags are scoped to shared LPI/Redistributor state, not to an
+ * ITS instance. Arm IHI 0069H.b section 5.1.1 says "LPI configuration is
+ * global". Section 12.11.33 (GICR_PROPBASER) makes mismatched values
+ * UNPREDICTABLE for Redistributors that share an LPI Configuration table
+ * while GICR_CTLR.EnableLPIs == 1. Section 12.11.32 (GICR_PENDBASER)
+ * similarly makes mismatched OuterCache, Shareability or InnerCache values
+ * across Redistributors UNPREDICTABLE while GICR_CTLR.EnableLPIs == 1.
+ *
+ * Keep this policy in the LPI code and accumulate only explicit LPI/RD
+ * restrictions into it. Per-ITS restrictions stay in host_its::quirk_flags
+ * for GITS_CBASER, GITS_BASER<n> and ITT memory.
+ */
+static uint32_t __ro_after_init host_lpi_flags;
+
 #define MAX_NR_HOST_LPIS   (lpi_data.max_host_lpi_ids - LPI_OFFSET)
 #define HOST_LPIS_PER_PAGE      (PAGE_SIZE / sizeof(union host_lpi))
 
+void __init gicv3_lpi_update_host_flags(uint32_t flags)
+{
+    host_lpi_flags |= flags;
+}
+
 static union host_lpi *gic_get_host_lpi(uint32_t plpi)
 {
     union host_lpi *block;
@@ -228,6 +248,7 @@ static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
 {
     void *pendtable;
     unsigned int order;
+    unsigned int memflags = gicv3_mem_get_alloc_flags(host_lpi_flags);
 
     if ( per_cpu(lpi_redist, cpu).pending_table )
         return -EBUSY;
@@ -239,7 +260,7 @@ static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
      * physically contiguous memory.
      */
     order = get_order_from_bytes(max(lpi_data.max_host_lpi_ids / 8, (unsigned long)SZ_64K));
-    pendtable = alloc_xenheap_pages(order, gicv3_its_get_memflags());
+    pendtable = alloc_xenheap_pages(order, memflags);
     if ( !pendtable )
         return -ENOMEM;
 
@@ -262,6 +283,8 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
 {
     const void *pendtable = this_cpu(lpi_redist).pending_table;
     uint64_t val;
+    uint64_t cacheability = gicv3_mem_get_cacheability(host_lpi_flags);
+    uint64_t shareability = gicv3_mem_get_shareability(host_lpi_flags);
 
     /*
      * The memory should have been allocated while preparing the CPU (or
@@ -275,9 +298,10 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
 
     ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK(51, 16)));
 
-    val  = gicv3_its_get_cacheability() << GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
-    val |= GIC_BASER_CACHE_SameAsInner << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT;
-    val |= gicv3_its_get_shareability() << GICR_PENDBASER_SHAREABILITY_SHIFT;
+    val  = MASK_INSR(cacheability, GICR_PENDBASER_INNER_CACHEABILITY_MASK);
+    val |= MASK_INSR(GIC_BASER_CACHE_SameAsInner,
+                     GICR_PENDBASER_OUTER_CACHEABILITY_MASK);
+    val |= MASK_INSR(shareability, GICR_PENDBASER_SHAREABILITY_MASK);
     val |= GICR_PENDBASER_PTZ;
     val |= virt_to_maddr(pendtable);
 
@@ -304,10 +328,13 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
 {
     uint64_t reg;
     unsigned int order;
+    uint64_t cacheability = gicv3_mem_get_cacheability(host_lpi_flags);
+    uint64_t shareability = gicv3_mem_get_shareability(host_lpi_flags);
 
-    reg  = gicv3_its_get_cacheability() << GICR_PROPBASER_INNER_CACHEABILITY_SHIFT;
-    reg |= GIC_BASER_CACHE_SameAsInner << GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT;
-    reg |= gicv3_its_get_shareability() << GICR_PROPBASER_SHAREABILITY_SHIFT;
+    reg  = MASK_INSR(cacheability, GICR_PROPBASER_INNER_CACHEABILITY_MASK);
+    reg |= MASK_INSR(GIC_BASER_CACHE_SameAsInner,
+                     GICR_PROPBASER_OUTER_CACHEABILITY_MASK);
+    reg |= MASK_INSR(shareability, GICR_PROPBASER_SHAREABILITY_MASK);
 
     /*
      * The property table is shared across all redistributors, so allocate
@@ -317,9 +344,10 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
     {
         /* The property table holds one byte per LPI. */
         void *table;
+        unsigned int memflags = gicv3_mem_get_alloc_flags(host_lpi_flags);
 
         order = get_order_from_bytes(max(lpi_data.max_host_lpi_ids, (unsigned long)SZ_4K));
-        table = alloc_xenheap_pages(order, gicv3_its_get_memflags());
+        table = alloc_xenheap_pages(order, memflags);
 
         if ( !table )
             return -ENOMEM;
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index fc5a84892c..3e8dcc4ae9 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -105,13 +105,15 @@
 #define GICV3_ITS_SIZE                  SZ_128K
 
 #include <xen/device_tree.h>
+#include <xen/init.h>
 #include <xen/rbtree.h>
 
 #define HOST_ITS_FLUSH_CMD_QUEUE        (1U << 0)
 #define HOST_ITS_USES_PTA               (1U << 1)
 
-#define HOST_ITS_WORKAROUND_NC_NS       (1U << 0)
-#define HOST_ITS_WORKAROUND_32BIT_ADDR  (1U << 1)
+/* GICv3 memory-related quirk flags. */
+#define GICV3_QUIRK_MEM_NC_NS           (1U << 0)
+#define GICV3_QUIRK_MEM_32BIT_ADDR      (1U << 1)
 
 /* We allocate LPIs on the hosts in chunks of 32 to reduce handling overhead. */
 #define LPI_BLOCK                       32U
@@ -128,6 +130,11 @@ struct host_its {
     unsigned int itte_size;
     spinlock_t cmd_lock;
     void *cmd_buf;
+    /*
+     * Workaround flags scoped to this ITS instance, including memory
+     * accessed through GITS_CBASER, GITS_BASER<n> and ITT memory.
+     */
+    uint32_t quirk_flags;
     unsigned int flags;
 };
 
@@ -157,6 +164,7 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base);
 /* Initialize the host structures for LPIs and the host ITSes. */
 int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits);
 int gicv3_its_init(void);
+void __init gicv3_lpi_update_host_flags(uint32_t flags);
 
 /* Store the physical address and ID for each redistributor as read from DT. */
 void gicv3_set_redist_address(paddr_t address, unsigned int redist_id);
@@ -199,10 +207,9 @@ struct pending_irq *gicv3_assign_guest_event(struct domain *d,
 void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
                                  uint32_t virt_lpi);
 
-/* ITS quirks handling. */
-uint64_t gicv3_its_get_cacheability(void);
-uint64_t gicv3_its_get_shareability(void);
-unsigned int gicv3_its_get_memflags(void);
+uint64_t gicv3_mem_get_cacheability(uint32_t flags);
+uint64_t gicv3_mem_get_shareability(uint32_t flags);
+unsigned int gicv3_mem_get_alloc_flags(uint32_t flags);
 
 #else
 
-- 
2.43.0


