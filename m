Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5C8423C98
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 13:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202815.357858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY50X-0002Ph-7W; Wed, 06 Oct 2021 11:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202815.357858; Wed, 06 Oct 2021 11:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY50X-0002N4-3J; Wed, 06 Oct 2021 11:22:45 +0000
Received: by outflank-mailman (input) for mailman id 202815;
 Wed, 06 Oct 2021 11:22:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZr5=O2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mY50V-0001im-Hz
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:22:43 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8ddf3c1-ae3e-44dd-8455-ddf57fe55064;
 Wed, 06 Oct 2021 11:22:34 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id b20so9015986lfv.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Oct 2021 04:22:34 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l14sm1002101lfe.124.2021.10.06.04.22.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Oct 2021 04:22:32 -0700 (PDT)
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
X-Inumbo-ID: f8ddf3c1-ae3e-44dd-8455-ddf57fe55064
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rkR+rU5Y9+3oI0Oc5L3i/ut7iAcwGRf2f4nUZ2wYcHI=;
        b=ZapKta8DabGOllyBOfBN3LVjVOXwV0ftilSu1LyvVMh0+/2iVhbrDx2+Y2W6T+PlIL
         XQR4e0y580xgswyBht/LxLT7mUw134nR9Jn6ljpcMrqaFbN+PVhQpaAaOJIlzUhABKWu
         iCqUtecgUJdQQ2HTt4gac/WMU5wRuyVLbQJ/kjFpBJC4XtC1tHLJkxhrvnQVG+GLhP8g
         p+FtzfGF2aRUtao6q2H4EseWtOWg5BIXKDkEpdZ7g/fE+/VT6UBM4Qpb0DUlKgnyqvRr
         wLExOGK0bu03BqTDsI7ifNYLoYvNtHW/em/nXv6RGWVEMNqENAlUq7c55pnIDwgSAxdk
         7oEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rkR+rU5Y9+3oI0Oc5L3i/ut7iAcwGRf2f4nUZ2wYcHI=;
        b=x/TSueLz7T7i8I2gLhnfO1Fyv5UB3hXU/F/Ay0frVt+iBskScwVr2BhVJTpQ1iu31B
         wy+lxFzRln3hEUCqMdt0p07porTulaiF+BfHp+HnxHxeRy+Trjzis96K0Fda9zfkgPLl
         KsuL1O+SIvXycmaDsGjfYyluTiUQs5TiXrYjje1LNEdpttNX3/63SVINeQPjj+B1kfHl
         26yGtsTPnXu8Ql2HdKVwXwKqA8JVqi9e8cYJjTuJz9Ap86ejiQO/o1sawhpBYjPJwbqX
         ReEcMEnYtapJlyM7JlC598HNlPqtxYnAFBHMrqDkw0+mvL+f7Fb4l8c/qEVT4qXqFqns
         GnJQ==
X-Gm-Message-State: AOAM5306mZ/T45YSyP1sw9DpWm2IQPFC5L8+1peLK5U30sFQwBTmi1d2
	BwSSvf2Dil05J9bi7F5q50iYdX8RwV8=
X-Google-Smtp-Source: ABdhPJyA/+wXOBOZGX+gKm18/Y9VPDF1xOB/UR1RkCk7zbNGgSkXV6zNyaSIdSWvtScElmAMn325yA==
X-Received: by 2002:a2e:9b98:: with SMTP id z24mr27491363lji.339.1633519353096;
        Wed, 06 Oct 2021 04:22:33 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH V5 2/3] libxl/arm: Add handling of extended regions for DomU
Date: Wed,  6 Oct 2021 14:22:25 +0300
Message-Id: <1633519346-3686-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The extended region (safe range) is a region of guest physical
address space which is unused and could be safely used to create
grant/foreign mappings instead of wasting real RAM pages from
the domain memory for establishing these mappings.

The extended regions are chosen at the domain creation time and
advertised to it via "reg" property under hypervisor node in
the guest device-tree. As region 0 is reserved for grant table
space (always present), the indexes for extended regions are 1...N.
If extended regions could not be allocated for some reason,
Xen doesn't fail and behaves as usual, so only inserts region 0.

Please note the following limitations:
- The extended region feature is only supported for 64-bit domain
  currently.
- The ACPI case is not covered.

***

The algorithm to choose extended regions for non-direct mapped
DomU is simpler in comparison with the algorithm for direct mapped
Dom0. We usually have a lot of unused space above 4GB, and might
have some unused space below 4GB (depends on guest memory size).
Try to allocate separate 2MB-aligned extended regions from the first
(below 4GB) and second (above 4GB) RAM banks taking into the account
the maximum supported guest physical address space size and the amount
of memory assigned to the guest. The minimum size of extended region
the same as for Dom0 (64MB).

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
! Stefano, Ian, Michal I dropped your A-b/R-b. I decided to change patch
to make it more functional !

Changes RFC -> V2:
   - update patch description
   - drop uneeded "extended-region" DT property
   - clear reg array in finalise_ext_region() and add a TODO

Changes V2 -> V3:
   - update patch description, comments in code
   - only pick up regions with size >= 64MB
   - move the region calculation to make_hypervisor_node() and drop
     finalise_ext_region()
   - extend the list of arguments for make_hypervisor_node()
   - do not show warning for 32-bit domain
   - change the region alignment from 1GB to 2MB
   - move EXT_REGION_SIZE to public/arch-arm.h

Changes V3 -> V4:
   - add R-b, A-b and T-b

Changes V4 -> V5:
   - update patch description and comments in code
   - reflect changes done in previous patch to pass gpaddr_bits
     via createdomain domctl (struct xen_arch_domainconfig)
   - drop R-b, A-b and T-b
   - drop limit for maximum extended region size (128GB)
   - try to also allocate region below 4GB, optimize code
     for calculating extended regions
---
 tools/libs/light/libxl_arm.c  | 80 ++++++++++++++++++++++++++++++++++++++++---
 xen/include/public/arch-arm.h |  2 ++
 2 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 45e0386..cd743f7 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -600,9 +600,21 @@ static int make_timer_node(libxl__gc *gc, void *fdt,
     return 0;
 }
 
+#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
+
 static int make_hypervisor_node(libxl__gc *gc, void *fdt,
-                                const libxl_version_info *vers)
+                                const libxl_version_info *vers,
+                                const libxl_domain_build_info *b_info,
+                                const struct xc_dom_image *dom)
 {
+    uint64_t region_size[GUEST_RAM_BANKS] = {0}, region_base[GUEST_RAM_BANKS],
+        banksize[GUEST_RAM_BANKS], bankend[GUEST_RAM_BANKS], ramsize;
+    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+                  (GUEST_RAM_BANKS + 1)];
+    be32 *cells = &regs[0];
+    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
+    unsigned int i, len, nr_regions = 0;
+    uint8_t gpaddr_bits;
     int res;
     gic_interrupt intr;
 
@@ -617,9 +629,67 @@ static int make_hypervisor_node(libxl__gc *gc, void *fdt,
                               "xen,xen");
     if (res) return res;
 
-    /* reg 0 is grant table space */
-    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
+    if (strcmp(dom->guest_type, "xen-3.0-aarch64")) {
+        LOG(WARN, "The extended regions are only supported for 64-bit guest currently");
+        goto out;
+    }
+
+    gpaddr_bits = b_info->arch_arm.gpaddr_bits;
+    assert(gpaddr_bits >= 32 && gpaddr_bits <= 48);
+
+    /*
+     * Try to allocate separate 2MB-aligned extended regions from the first
+     * (below 4GB) and second (above 4GB) RAM banks taking into the account
+     * the maximum supported guest physical address space size and the amount
+     * of memory assigned to the guest.
+     * As the guest memory layout is not populated yet we cannot rely on
+     * dom->rambank_size[], so calculate the actual size of both banks using
+     * "max_memkb" value.
+     */
+    ramsize = b_info->max_memkb * 1024;
+    if (ramsize <= GUEST_RAM0_SIZE) {
+        banksize[0] = ramsize;
+        banksize[1] = 0;
+    } else {
+        banksize[0] = GUEST_RAM0_SIZE;
+        banksize[1] = ramsize - GUEST_RAM0_SIZE;
+    }
+
+    bankend[0] = GUEST_RAM0_BASE + GUEST_RAM0_SIZE;
+    bankend[1] = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE);
+
+    for (i = 0; i < GUEST_RAM_BANKS; i++) {
+        region_base[i] = bankbase[i] + ALIGN_UP_TO_2MB(banksize[i]);
+        if (bankend[i] > region_base[i])
+            region_size[i] = bankend[i] - region_base[i];
+    }
+
+out:
+    /*
+     * The region 0 for grant table space must be always present. If we managed
+     * to allocate the extended regions then insert them as regions 1...N.
+     */
+    set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+              GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
+
+    for (i = 0; i < GUEST_RAM_BANKS; i++) {
+        if (region_size[i] < GUEST_EXT_REGION_MIN_SIZE)
+            continue;
+
+        LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"\n",
+            nr_regions, region_base[i], region_base[i] + region_size[i]);
+
+        set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                  region_base[i], region_size[i]);
+        nr_regions ++;
+    }
+
+    if (!nr_regions)
+        LOG(WARN, "The extended regions cannot be allocated, not enough space");
+
+    len = sizeof(regs[0]) * (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+        (nr_regions + 1);
+    res = fdt_property(fdt, "reg", regs, len);
     if (res) return res;
 
     /*
@@ -965,7 +1035,7 @@ next_resize:
         }
 
         FDT( make_timer_node(gc, fdt, ainfo, state->clock_frequency) );
-        FDT( make_hypervisor_node(gc, fdt, vers) );
+        FDT( make_hypervisor_node(gc, fdt, vers, info, dom) );
 
         if (info->arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART)
             FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 4a01f8b..f74cc0b 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -454,6 +454,8 @@ typedef uint64_t xen_callback_t;
 #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
 #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
 
+#define GUEST_EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
+
 /* Current supported guest VCPUs */
 #define GUEST_MAX_VCPUS 128
 
-- 
2.7.4


