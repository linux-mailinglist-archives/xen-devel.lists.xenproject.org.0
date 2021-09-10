Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4664070D6
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 20:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184711.333451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOl7m-0004DC-J6; Fri, 10 Sep 2021 18:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184711.333451; Fri, 10 Sep 2021 18:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOl7m-00049A-DE; Fri, 10 Sep 2021 18:19:42 +0000
Received: by outflank-mailman (input) for mailman id 184711;
 Fri, 10 Sep 2021 18:19:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ConJ=OA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mOl7k-0003AT-WD
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 18:19:41 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6dc5f12d-6d91-4378-a5aa-df471a9af16a;
 Fri, 10 Sep 2021 18:19:27 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id f18so5751061lfk.12
 for <xen-devel@lists.xenproject.org>; Fri, 10 Sep 2021 11:19:27 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a7sm625045lfi.15.2021.09.10.11.19.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Sep 2021 11:19:25 -0700 (PDT)
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
X-Inumbo-ID: 6dc5f12d-6d91-4378-a5aa-df471a9af16a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Eoy+Pchg4s0QithVevz+IoMG+lYh7VneYRIDbLe6C1s=;
        b=UBYQf8hSPuukUyAYT2w/QXM9jAPllIyX8yIQsyPXp3C0DClgZqz8w6lhVCJYdGYnsg
         wXWf7hb9DsR5gTB2nuJUaciQJW83S1ORICEsJeiI3s2gWGy5sHJcfM760Pfu5BxXZWwY
         zVhW2B/xUXLj1mz3cK9S/Oz+bFkBeI6Nxk+477wBEjNFL6ddowBMUTJX8LIE2syddjON
         bAWPyXbL7Q3ErzNrgElyqWjxOrx3z2U/yH4DkNRSn8blmVr7HP4IJuL6OzRUTCaoNoWl
         QX3v+SnDSIKzIWsoApkuzxXWq460TtXoC6QB9ns/00b6eUr9AhW/DFpAGexKypebWoDs
         bEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Eoy+Pchg4s0QithVevz+IoMG+lYh7VneYRIDbLe6C1s=;
        b=NNsRaqZ57i/xucuXn7Nib4Azc+aKg80qLuAlJQ0N4jm5RxRbT6Z7JD3bGx8fT8FGbq
         q6EvfEWdbH1adwVGDsMQf9zjeCBOtoVZXVzUieK+IK0jetjfxBKa9MG4bN5r3ue4LWKL
         Yq5W3YHSwVZXewTFTeX0gA0Tq5xye2JzvvuLJI2WwcR+wFhgFgmoqiS+/Un406MBYS9i
         F/ITYv9pnyP5gpST1DV2FTL+4MSty4AEouE8flPbiNB7nHMK+wU1hS3dfQRwrLCGyMA3
         d33fmovu/Ld/Ulu8elT0aIM2jIBHvjVUvytiyoFiqx91DtH99rilNNSz2oyCjJQvpHEf
         kySA==
X-Gm-Message-State: AOAM530/XDZyjhjqzRa2Vigy0MVY8nC0ME1avj2rcf/w7PyqJFo61gGb
	CxKNKHa3rlqIjE7vzBxecfJsiwXng9M=
X-Google-Smtp-Source: ABdhPJwE934eD6zKOi3fkeOuf9eSpR3/Gy5RT+rR/hMXdjN1ibo7klQLCDOl4lFOQ2K23gVgWM1y7g==
X-Received: by 2002:a19:480c:: with SMTP id v12mr4779180lfa.60.1631297966164;
        Fri, 10 Sep 2021 11:19:26 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH V2 3/3] libxl/arm: Add handling of extended regions for DomU
Date: Fri, 10 Sep 2021 21:18:44 +0300
Message-Id: <1631297924-8658-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>

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
- The extended region feature is only supported for 64-bit domain.
- The ACPI case is not covered.

***

The algorithm to choose extended regions for non-direct mapped
DomU is simpler in comparison with the algorithm for direct mapped
Dom0. As we have a lot of unused space above 4GB, provide single
1GB-aligned region from the second RAM bank taking into the account
the maximum supported guest address space size and the amount of
memory assigned to the guest. The maximum size of the region is 128GB.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes since RFC:
   - update patch description
   - drop uneeded "extended-region" DT property
   - clear reg array in finalise_ext_region() and add a TODO
---
 tools/libs/light/libxl_arm.c | 89 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e3140a6..8c1d9d7 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -615,9 +615,12 @@ static int make_hypervisor_node(libxl__gc *gc, void *fdt,
                               "xen,xen");
     if (res) return res;
 
-    /* reg 0 is grant table space */
+    /*
+     * reg 0 is a placeholder for grant table space, reg 1 is a placeholder
+     * for the extended region.
+     */
     res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
+                            2, 0, 0, 0, 0);
     if (res) return res;
 
     /*
@@ -1069,6 +1072,86 @@ static void finalise_one_node(libxl__gc *gc, void *fdt, const char *uname,
     }
 }
 
+#define ALIGN_UP_TO_GB(x)   (((x) + GB(1) - 1) & (~(GB(1) - 1)))
+
+#define EXT_REGION_SIZE   GB(128)
+
+static void finalise_ext_region(libxl__gc *gc, struct xc_dom_image *dom)
+{
+    void *fdt = dom->devicetree_blob;
+    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
+    be32 *cells = &regs[0];
+    uint64_t region_size = 0, region_base, bank1end_align, bank1end_max;
+    uint32_t gpaddr_bits;
+    libxl_physinfo info;
+    int offset, rc;
+
+    offset = fdt_path_offset(fdt, "/hypervisor");
+    assert(offset > 0);
+
+    if (strcmp(dom->guest_type, "xen-3.0-aarch64")) {
+        LOG(WARN, "The extended region is only supported for 64-bit guest");
+        goto out;
+    }
+
+    rc = libxl_get_physinfo(CTX, &info);
+    assert(!rc);
+
+    gpaddr_bits = info.gpaddr_bits;
+    assert(gpaddr_bits >= 32 && gpaddr_bits <= 48);
+
+    /*
+     * Try to allocate single 1GB-aligned extended region from the second RAM
+     * bank (above 4GB) taking into the account the maximum supported guest
+     * address space size and the amount of memory assigned to the guest.
+     * The maximum size of the region is 128GB.
+     */
+    bank1end_max = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE);
+    bank1end_align = GUEST_RAM1_BASE +
+        ALIGN_UP_TO_GB((uint64_t)dom->rambank_size[1] << XC_PAGE_SHIFT);
+
+    if (bank1end_max <= bank1end_align) {
+        LOG(WARN, "The extended region cannot be allocated, not enough space");
+        goto out;
+    }
+
+    if (bank1end_max - bank1end_align > EXT_REGION_SIZE) {
+        region_base = bank1end_max - EXT_REGION_SIZE;
+        region_size = EXT_REGION_SIZE;
+    } else {
+        region_base = bank1end_align;
+        region_size = bank1end_max - bank1end_align;
+    }
+
+out:
+    /*
+     * The first region for grant table space must be always present.
+     * If we managed to allocate the extended region then insert it as
+     * a second region.
+     * TODO If we failed to allocate the region, we end up inserting
+     * zero-sized region. This is because we don't know in advance when
+     * creating hypervisor node whether it would be possible to allocate
+     * a region, but we have to create a placeholder anyway. The Linux driver
+     * is able to deal with by checking the region size. We cannot choose
+     * a region when creating hypervisor node because the guest memory layout
+     * is not know at that moment (and dom->rambank_size[1] is empty).
+     * We need to find a way not to expose invalid regions.
+     */
+    memset(regs, 0, sizeof(regs));
+    set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+              GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
+    if (region_size > 0) {
+        LOG(DEBUG, "Extended region: %#"PRIx64"->%#"PRIx64"\n",
+            region_base, region_base + region_size);
+
+        set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                  region_base, region_size);
+    }
+
+    rc = fdt_setprop_inplace(fdt, offset, "reg", regs, sizeof(regs));
+    assert(!rc);
+}
+
 int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
                                                uint32_t domid,
                                                libxl_domain_config *d_config,
@@ -1109,6 +1192,8 @@ int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
 
     }
 
+    finalise_ext_region(gc, dom);
+
     for (i = 0; i < GUEST_RAM_BANKS; i++) {
         const uint64_t size = (uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT;
 
-- 
2.7.4


