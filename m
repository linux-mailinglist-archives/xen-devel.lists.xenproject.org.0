Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2347416830
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 00:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194613.346733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTXWz-0004nn-7J; Thu, 23 Sep 2021 22:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194613.346733; Thu, 23 Sep 2021 22:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTXWz-0004k1-3O; Thu, 23 Sep 2021 22:49:29 +0000
Received: by outflank-mailman (input) for mailman id 194613;
 Thu, 23 Sep 2021 22:49:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ES3T=ON=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mTXWx-0003lw-AF
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 22:49:27 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92a87372-4cd6-4740-8d81-20ee3df470ab;
 Thu, 23 Sep 2021 22:49:13 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id u8so31596482lff.9
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 15:49:13 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id q5sm230091lfd.17.2021.09.23.15.49.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Sep 2021 15:49:12 -0700 (PDT)
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
X-Inumbo-ID: 92a87372-4cd6-4740-8d81-20ee3df470ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jmLs0mTyD34ofMZzmrSjgVJC5wsYcw101jP+QWhYOH8=;
        b=YyI9IJzQrby7TiZ4wbGnS276SPS/+3GW73X0VIaNNHyW0IINUfUfR5fdfPdHIYmHdE
         Pi1iKR/eM0K2mVgfUSNNDCQXXcQcemn1EGUgCQbA2+G0SM2Yh6fGCKtDPg8QPZMjssJZ
         6EgKVxXgFrfoDP4stA4bjDId3/fGB4+Yqa+sDnfnP4i2NStC9oKG+L7jmp9aMUXO2JrL
         vkfI/J/op5MBTn0YKUCA5T01hfmRQae8Zr2+81vM4OoQjOyV7yEqStWkVhgq1IbpONcN
         q4mVERIpB0tSQR0YIYHS20mvae5ao7uElHuKIelHhPUrzUsTr7IjrAr7C58yvUt6eGyb
         Dtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jmLs0mTyD34ofMZzmrSjgVJC5wsYcw101jP+QWhYOH8=;
        b=rvsnhC2gef0mO0lJmXVQ+e/Y/CExtykuMg6zH38So+7xZNkQwTAAP55a1HZBbvpMIk
         UVkyvvBaRMeTQOg+Dd5tuT7qBM2GQxZyrE3RrthnokmT7c3vO+/9ogJswIuu3D3q1VTt
         qLkYcvcbns9E+K925kQ/A72XsNMN7Xi7nPtVk2BYX1JxMODNytNmiPCFhsr6l2tSrOQS
         t4kyw0g/vROfKljqVdJ+4j5dnsHj6JjxB1f5KPaKNotoMPeBRZSQK10jgViwotz7dubi
         Kc1ikg7+hoRx6lyz8sX2qY5jGtDvBfkYlzIDVI5tPGVMb8cLKebPp1Yh/1J9UWjeMhlc
         d6Kg==
X-Gm-Message-State: AOAM530BHfAtvojUnPDrFqXmN6/0rGVIOBMdhLlhjIaXbtOXNzZ+bMej
	CFdxGRU+tjDVPfyijWMPFonmka4pOyU=
X-Google-Smtp-Source: ABdhPJzJ4gywKT2GPnBQZNU6Z/TJttX8q3HxdBvVA2xr556u3bBX1MO96LSCIMBzAnreZJrKPrii7A==
X-Received: by 2002:ac2:5fe7:: with SMTP id s7mr6504634lfg.666.1632437352352;
        Thu, 23 Sep 2021 15:49:12 -0700 (PDT)
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
Subject: [PATCH V3 3/3] libxl/arm: Add handling of extended regions for DomU
Date: Fri, 24 Sep 2021 01:48:54 +0300
Message-Id: <1632437334-12015-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632437334-12015-1-git-send-email-olekstysh@gmail.com>
References: <1632437334-12015-1-git-send-email-olekstysh@gmail.com>

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
Dom0. As we have a lot of unused space above 4GB, provide single
2MB-aligned region from the second RAM bank taking into the account
the maximum supported guest address space size and the amount of
memory assigned to the guest. The maximum size of the region is 128GB.
The minimum size is 64MB.

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
---
 tools/libs/light/libxl_arm.c  | 70 +++++++++++++++++++++++++++++++++++++++----
 xen/include/public/arch-arm.h |  3 ++
 2 files changed, 68 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e3140a6..a67b68e 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -598,9 +598,17 @@ static int make_timer_node(libxl__gc *gc, void *fdt,
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
+    uint64_t region_size = 0, region_base, ramsize, bank1size,
+        bank1end_align, bank1end_max;
+    uint8_t gpaddr_bits;
+    libxl_physinfo physinfo;
     int res;
     gic_interrupt intr;
 
@@ -615,9 +623,61 @@ static int make_hypervisor_node(libxl__gc *gc, void *fdt,
                               "xen,xen");
     if (res) return res;
 
-    /* reg 0 is grant table space */
-    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
+    if (strcmp(dom->guest_type, "xen-3.0-aarch64")) {
+        LOG(DEBUG, "The extended regions are only supported for 64-bit guest currently");
+        goto out;
+    }
+
+    res = libxl_get_physinfo(CTX, &physinfo);
+    assert(!res);
+
+    gpaddr_bits = physinfo.gpaddr_bits;
+    assert(gpaddr_bits >= 32 && gpaddr_bits <= 48);
+
+    /*
+     * Try to allocate single 2MB-aligned extended region from the second RAM
+     * bank (above 4GB) taking into the account the maximum supported guest
+     * address space size and the amount of memory assigned to the guest.
+     * As the guest memory layout is not populated yet we cannot rely on
+     * dom->rambank_size[1], so calculate the actual size of the second bank
+     * using "max_memkb" value.
+     */
+    bank1end_max = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE);
+    ramsize = b_info->max_memkb * 1024;
+    if (ramsize <= GUEST_RAM0_SIZE)
+        bank1size = 0;
+    else
+        bank1size = ramsize - GUEST_RAM0_SIZE;
+    bank1end_align = GUEST_RAM1_BASE + ALIGN_UP_TO_2MB(bank1size);
+
+    if (bank1end_max <= bank1end_align) {
+        LOG(WARN, "The extended region cannot be allocated, not enough space");
+        goto out;
+    }
+
+    if (bank1end_max - bank1end_align > GUEST_EXT_REGION_MAX_SIZE) {
+        region_base = bank1end_max - GUEST_EXT_REGION_MAX_SIZE;
+        region_size = GUEST_EXT_REGION_MAX_SIZE;
+    } else {
+        region_base = bank1end_align;
+        region_size = bank1end_max - bank1end_align;
+    }
+
+out:
+    /*
+     * The region 0 for grant table space must be always present. If we managed
+     * to allocate the extended region then insert it as region 1.
+     */
+    if (region_size >= GUEST_EXT_REGION_MIN_SIZE) {
+        LOG(DEBUG, "Extended region: %#"PRIx64"->%#"PRIx64"\n",
+            region_base, region_base + region_size);
+
+        res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                                2, GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE,
+                                region_base, region_size);
+    } else
+        res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                                1, GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
     if (res) return res;
 
     /*
@@ -963,7 +1023,7 @@ next_resize:
         }
 
         FDT( make_timer_node(gc, fdt, ainfo, state->clock_frequency) );
-        FDT( make_hypervisor_node(gc, fdt, vers) );
+        FDT( make_hypervisor_node(gc, fdt, vers, info, dom) );
 
         if (info->arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART)
             FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 6b5a5f8..df59933 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -449,6 +449,9 @@ typedef uint64_t xen_callback_t;
 #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
 #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
 
+#define GUEST_EXT_REGION_MAX_SIZE   xen_mk_ullong(0x2000000000) /* 128GB */
+#define GUEST_EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
+
 /* Current supported guest VCPUs */
 #define GUEST_MAX_VCPUS 128
 
-- 
2.7.4


