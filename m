Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 337A042960C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 19:49:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206422.362008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzQP-0002YQ-8e; Mon, 11 Oct 2021 17:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206422.362008; Mon, 11 Oct 2021 17:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzQP-0002Wt-4a; Mon, 11 Oct 2021 17:49:21 +0000
Received: by outflank-mailman (input) for mailman id 206422;
 Mon, 11 Oct 2021 17:49:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=obo4=O7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mZzQN-0001vo-HC
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 17:49:19 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01670e9f-3c57-4828-971e-693757756b4d;
 Mon, 11 Oct 2021 17:49:09 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id j5so77000296lfg.8
 for <xen-devel@lists.xenproject.org>; Mon, 11 Oct 2021 10:49:09 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h4sm789688lfk.193.2021.10.11.10.49.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Oct 2021 10:49:08 -0700 (PDT)
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
X-Inumbo-ID: 01670e9f-3c57-4828-971e-693757756b4d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wPDJEBVjrNdWVk2UD/ygEhxoYGrfSVfG9OQX/DRhwzc=;
        b=pHHlYvOZkJ0uIrrNuzHHPoUGuU4IdpYiw1zasAJOc1E5//KkqpCYk1wxHrtX90cd3I
         fW3bbb9Dj2+p65woTp9IMZVi6lPOgSXp42LMd5g1SK52SAOJOwzea135o57WGnQP52by
         t6dlFWpQXlNwDIKQqfEM3V8fVSHmYM4dWVGkAajEZZf/UcF+X6A0vJssxbJeb0o7EZA2
         IR1/EDstn00xSZUOGJTWOooPpd6CFiXJMfyFbsgPcSyBMZ+sM7TDEzyyx1AvawVqsEXH
         CA63l8CNpFaQ6bpYjBC3CP8uwdz2HJEUzPvXFT2Q8rWywdPxbQOY8kmPK+m1Y03WqG4x
         zNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wPDJEBVjrNdWVk2UD/ygEhxoYGrfSVfG9OQX/DRhwzc=;
        b=6w60YELR5zLqk65Ab//kMW9noMeMw9HmkKbnrJB9Q8MD26fPdkWbqYt5nnSFiFs8Nf
         tA+JjCxJRNJHX6RlAgnmiQfq+Qk+S1e4nGxs445V1QoQNv7rpueOsZ1sVwAdHgyEaMQ/
         rMSvrJnKQhdJYIUHy+aEQLMHwdQ5q9zlTYCHTt5icv0dO2jHkxmWJOB2poix2MvAwXes
         /jl0h/M54yZSSpyWo9zD+eTLkUg7t/ahZSZyRUGcRsyqlxVhVaIEAywaHaTzVQ31JwB0
         L1i8W8kdL6buN59iRbv0bW5rlvJ1EOfLH12d+d1Dol7Ii3JOXjrn60QULu+9XD1OhuvT
         n04A==
X-Gm-Message-State: AOAM5329VrdmnftuislXAsqZzKTBaF2sR/g98fm3BNC6J7XmJ5ECeXRj
	6abWwbmzC0eovY+RUGmi+DhKkwNgEx8=
X-Google-Smtp-Source: ABdhPJxCU5LhyJgoC5HOhFrjkKgfAyX+hjJ+nlEL7yWGHE2IdVB9mtvQwiBNJyKMKCGIniL4w/rBug==
X-Received: by 2002:a2e:1301:: with SMTP id 1mr1748772ljt.479.1633974548611;
        Mon, 11 Oct 2021 10:49:08 -0700 (PDT)
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
Subject: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for DomU
Date: Mon, 11 Oct 2021 20:48:59 +0300
Message-Id: <1633974539-7380-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>

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
---
 tools/libs/light/libxl_arm.c  | 76 ++++++++++++++++++++++++++++++++++++++++---
 xen/include/public/arch-arm.h |  2 ++
 2 files changed, 73 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e3140a6..c0e8415 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -598,9 +598,20 @@ static int make_timer_node(libxl__gc *gc, void *fdt,
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
+        bank1end, ramsize;
+    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+                  (GUEST_RAM_BANKS + 1)];
+    be32 *cells = &regs[0];
+    unsigned int i, len, nr_regions = 0;
+    libxl_dominfo info;
     int res;
     gic_interrupt intr;
 
@@ -615,9 +626,64 @@ static int make_hypervisor_node(libxl__gc *gc, void *fdt,
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
+    res = libxl_domain_info(CTX, &info, dom->guest_domid);
+    if (res) return res;
+
+    assert(info.gpaddr_bits >= 32 && info.gpaddr_bits <= 48);
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
+        region_base[0] = GUEST_RAM0_BASE + ALIGN_UP_TO_2MB(ramsize);
+        region_size[0] = GUEST_RAM0_SIZE - ALIGN_UP_TO_2MB(ramsize);
+        region_base[1] = GUEST_RAM1_BASE;
+    } else
+        region_base[1] = GUEST_RAM1_BASE +
+            ALIGN_UP_TO_2MB(ramsize - GUEST_RAM0_SIZE);
+
+    bank1end = min(1ULL << info.gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE);
+    if (bank1end > region_base[1])
+        region_size[1] = bank1end - region_base[1];
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
+        nr_regions++;
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
@@ -963,7 +1029,7 @@ next_resize:
         }
 
         FDT( make_timer_node(gc, fdt, ainfo, state->clock_frequency) );
-        FDT( make_hypervisor_node(gc, fdt, vers) );
+        FDT( make_hypervisor_node(gc, fdt, vers, info, dom) );
 
         if (info->arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART)
             FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index d46c61f..19ca2b0 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -451,6 +451,8 @@ typedef uint64_t xen_callback_t;
 #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
 #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
 
+#define GUEST_EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
+
 /* Current supported guest VCPUs */
 #define GUEST_MAX_VCPUS 128
 
-- 
2.7.4


