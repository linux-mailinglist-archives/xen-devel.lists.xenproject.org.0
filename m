Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DAF42D85A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 13:41:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209272.365696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maz6g-0004XH-Dy; Thu, 14 Oct 2021 11:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209272.365696; Thu, 14 Oct 2021 11:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maz6g-0004UI-Ac; Thu, 14 Oct 2021 11:41:06 +0000
Received: by outflank-mailman (input) for mailman id 209272;
 Thu, 14 Oct 2021 11:41:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gDO=PC=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1maz6f-0003sA-DJ
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 11:41:05 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9551d57-bc7a-46de-8928-39baa3a9b465;
 Thu, 14 Oct 2021 11:40:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v17so18451044wrv.9
 for <xen-devel@lists.xenproject.org>; Thu, 14 Oct 2021 04:40:56 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id g16sm2151359wrs.90.2021.10.14.04.40.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Oct 2021 04:40:54 -0700 (PDT)
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
X-Inumbo-ID: f9551d57-bc7a-46de-8928-39baa3a9b465
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Yln6hFneHIgQFQr2b5P60hP5dg/JMVV2z46PXzpOS0o=;
        b=pUkBeqkbJ+eMhj8JY/S1b8V+nnJBQ+6i+EDDceXOeM2MAcoXNmU9A6+1dHo3KJDCIh
         s6zUNDoE3LXMcZ/alCtY2UT0vPeCL0TUNMfKvrXeje3QLuKsBh/PCnZAzuohwMKcxU5Q
         QaFFCE7Hlo9gJLSSWMwW5C+WiXBCi7qSIgnCIJLNwXkY6qBFkH2a0FJza1LrPZbcjAUv
         2oMFSnbd0nYBP5A1x8sPAYOoy9uTo/m2yMwcW3yCvZkCBZDXxVGWhI0USbVxxV5r3Lbz
         NMVCmVv5Xut/fn3CsSr0d6ZKubw+VBeu49Vs4gi8mUCrNPFX8JLmoo4d8F5fFnTNqBGO
         ZN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Yln6hFneHIgQFQr2b5P60hP5dg/JMVV2z46PXzpOS0o=;
        b=vJhk1+nMM4Qyqsdekzl8lGZQzxXsZRNhkIrf3CdCFvQygsFCFRmwfxEt7J1gONa29c
         M5votEOOKFLheTtMnzC2qTVOZEwXl5eHuhCKJJ+AReJEAHVrk8eMgpsB83fQMU7FkX/C
         i9H3pvsDPiWhcdp/PsMRo0ssC5PEJTVoXgYAIZ8b1CnTwBJH6RQ2cT+MGybha85SCiNz
         gvd7CV9qpxII0OVK3xZxD2s0Di2VaDjMgos0pi1voUVQaaeK29JQlDvFsvCXs23NjoLJ
         mVJ0LG8JvUr8NQsKKA9nJEIK38P6qeqoz9zWDeYYb13kT7czrEGyi3tc0WWlNqmOTy6w
         w53w==
X-Gm-Message-State: AOAM531JH7x0LFt2CeNhJ5B5cBqGoQR1dj9SAab8D+A/QFjWJ+prupuX
	lPYj+NlQ9sYVZOv5c7eMSBZzXXRHSio=
X-Google-Smtp-Source: ABdhPJwY0ei55WTSDmfM4KYpGUJU3eL2E3JZen741BVb8G77S6AhSAxyDcMpOH29/YHetO5xLb04vw==
X-Received: by 2002:a5d:64c9:: with SMTP id f9mr6006399wri.284.1634211655280;
        Thu, 14 Oct 2021 04:40:55 -0700 (PDT)
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
Subject: [PATCH V7 2/2] libxl/arm: Add handling of extended regions for DomU
Date: Thu, 14 Oct 2021 14:40:45 +0300
Message-Id: <1634211645-26912-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634211645-26912-1-git-send-email-olekstysh@gmail.com>
References: <1634211645-26912-1-git-send-email-olekstysh@gmail.com>

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

Please note, we introduce fdt_property_reg_placeholder helper which
purpose is to create N ranges that are zeroed. The interesting fact
is that libfdt already has fdt_property_placeholder(). But this was
introduced only in 2017, so there is a risk that some distros may not
ship the last libfdt version. This is why we implement our own light
variant for now.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
! Stefano, Ian I dropped your A-b/R-b again as the patch has changed
significantly !

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

Change V5 -> V6:
   - reflect changes done in previous patch to pass gpaddr_bits
     via getdomaininfo domctl (struct xen_domctl_getdomaininfo)
   - reduce the number of local variables, rework calculations

Change V6 -> V7:
   - return finalize_*() back and put all logic there with re-using
     fdt_setprop() to update placeholders
   - introduce fdt_property_reg_placeholder() helper
   - rework regions calculation to not rely on the fact that Bank 0
     is always below 4GB
   - drop check for 32-bit domain and assert for invalid gpaddr_bits
   - change a formula to calculate bankend value
   - move EXT_REGION_MIN_SIZE definition from the public header to
     libxl_arm.c
   - do not use asserts for the return values, propagate errors to
     the callers
   - add a comment in public header
---
 tools/libs/light/libxl_arm.c  | 106 ++++++++++++++++++++++++++++++++++++++++--
 xen/include/public/arch-arm.h |   5 ++
 2 files changed, 106 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e3140a6..a780155 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -269,6 +269,21 @@ static int fdt_property_regs(libxl__gc *gc, void *fdt,
     return fdt_property(fdt, "reg", regs, sizeof(regs));
 }
 
+static int fdt_property_reg_placeholder(libxl__gc *gc, void *fdt,
+                                        unsigned int addr_cells,
+                                        unsigned int size_cells,
+                                        unsigned int num_regs)
+{
+    uint32_t regs[num_regs * (addr_cells + size_cells)];
+    be32 *cells = &regs[0];
+    unsigned int i;
+
+    for (i = 0; i < num_regs; i++)
+        set_range(&cells, addr_cells, size_cells, 0, 0);
+
+    return fdt_property(fdt, "reg", regs, sizeof(regs));
+}
+
 static int make_root_properties(libxl__gc *gc,
                                 const libxl_version_info *vers,
                                 void *fdt)
@@ -615,9 +630,13 @@ static int make_hypervisor_node(libxl__gc *gc, void *fdt,
                               "xen,xen");
     if (res) return res;
 
-    /* reg 0 is grant table space */
-    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
+    /*
+     * reg 0 is a placeholder for grant table space, reg 1...N are
+     * the placeholders for extended regions.
+     */
+    res = fdt_property_reg_placeholder(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+                                       GUEST_ROOT_SIZE_CELLS,
+                                       GUEST_RAM_BANKS + 1);
     if (res) return res;
 
     /*
@@ -1069,20 +1088,93 @@ static void finalise_one_node(libxl__gc *gc, void *fdt, const char *uname,
     }
 }
 
+#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
+
+#define EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
+
+static int finalize_hypervisor_node(libxl__gc *gc, struct xc_dom_image *dom)
+{
+    void *fdt = dom->devicetree_blob;
+    uint64_t region_size[GUEST_RAM_BANKS] = {0}, region_base[GUEST_RAM_BANKS],
+        bankend[GUEST_RAM_BANKS];
+    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+                  (GUEST_RAM_BANKS + 1)];
+    be32 *cells = &regs[0];
+    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
+    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
+    unsigned int i, len, nr_regions = 0;
+    libxl_dominfo info;
+    int offset, rc;
+
+    offset = fdt_path_offset(fdt, "/hypervisor");
+    if (offset < 0)
+        return offset;
+
+    rc = libxl_domain_info(CTX, &info, dom->guest_domid);
+    if (rc)
+        return rc;
+
+    if (info.gpaddr_bits > 64)
+        return ERROR_INVAL;
+
+    /*
+     * Try to allocate separate 2MB-aligned extended regions from the first
+     * and second RAM banks taking into the account the maximum supported
+     * guest physical address space size and the amount of memory assigned
+     * to the guest.
+     */
+    for (i = 0; i < GUEST_RAM_BANKS; i++) {
+        region_base[i] = bankbase[i] +
+            ALIGN_UP_TO_2MB((uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT);
+
+        bankend[i] = ~0ULL >> (64 - info.gpaddr_bits);
+        bankend[i] = min(bankend[i], bankbase[i] + banksize[i] - 1);
+        if (bankend[i] > region_base[i])
+            region_size[i] = bankend[i] - region_base[i] + 1;
+    }
+
+    /*
+     * The region 0 for grant table space must be always present. If we managed
+     * to allocate the extended regions then insert them as regions 1...N.
+     */
+    set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+              GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
+
+    for (i = 0; i < GUEST_RAM_BANKS; i++) {
+        if (region_size[i] < EXT_REGION_MIN_SIZE)
+            continue;
+
+        LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"",
+            nr_regions, region_base[i], region_base[i] + region_size[i]);
+
+        set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                  region_base[i], region_size[i]);
+        nr_regions++;
+    }
+
+    if (!nr_regions)
+        LOG(WARN, "The extended regions cannot be allocated, not enough space");
+
+    len = sizeof(regs[0]) * (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+        (nr_regions + 1);
+
+    return fdt_setprop(fdt, offset, "reg", regs, len);
+}
+
 int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
                                                uint32_t domid,
                                                libxl_domain_config *d_config,
                                                struct xc_dom_image *dom)
 {
     void *fdt = dom->devicetree_blob;
-    int i;
+    int i, res;
     const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
 
     const struct xc_dom_seg *ramdisk = dom->modules[0].blob ?
         &dom->modules[0].seg : NULL;
 
     if (ramdisk) {
-        int chosen, res;
+        int chosen;
         uint64_t val;
 
         /* Neither the fdt_path_offset() nor either of the
@@ -1109,6 +1201,10 @@ int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
 
     }
 
+    res = finalize_hypervisor_node(gc, dom);
+    if (res)
+        return res;
+
     for (i = 0; i < GUEST_RAM_BANKS; i++) {
         const uint64_t size = (uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT;
 
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index d46c61f..96ead3d 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -438,6 +438,11 @@ typedef uint64_t xen_callback_t;
 
 #define GUEST_RAM_BANKS   2
 
+/*
+ * The way to find the extended regions (to be exposed to the guest as unused
+ * address space) relies on the fact that the regions reserved for the RAM
+ * below are big enough to also accommodate such regions.
+ */
 #define GUEST_RAM0_BASE   xen_mk_ullong(0x40000000) /* 3GB of low RAM @ 1GB */
 #define GUEST_RAM0_SIZE   xen_mk_ullong(0xc0000000)
 
-- 
2.7.4


