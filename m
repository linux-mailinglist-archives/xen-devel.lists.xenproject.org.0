Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C40402D7F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 19:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181249.328351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNebs-0004Ub-7R; Tue, 07 Sep 2021 17:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181249.328351; Tue, 07 Sep 2021 17:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNebs-0004R7-3M; Tue, 07 Sep 2021 17:10:12 +0000
Received: by outflank-mailman (input) for mailman id 181249;
 Tue, 07 Sep 2021 17:10:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjNB=N5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mNebq-0002hx-3l
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 17:10:10 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb19d5b4-180d-4792-9daf-20ca2f636c64;
 Tue, 07 Sep 2021 17:09:57 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z2so20891905lft.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Sep 2021 10:09:56 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t20sm1059533lfk.157.2021.09.07.10.09.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Sep 2021 10:09:55 -0700 (PDT)
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
X-Inumbo-ID: bb19d5b4-180d-4792-9daf-20ca2f636c64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ya0iv+xjtgk+KbWZdbpF+3/p23xC0vgD9QxwNHC4wzo=;
        b=ZYoki/JEJRYk82IEIOvaWK4Wj0RDoDRnDs+qMeGITnAE5fQOGPxG4YvHb7M1c0I7OH
         oPVly8GrZynKZArYCRdjo8IPiBJjR+CLFeOD09+d2NUboOq/CfC1wuJt9ppejFLN8UWm
         bsdZAwRr6DgLcNnOTa7ZrKfqpKfUQgu0FKuCnJg0JWXWVH6lwEgOTxzDIx77Zg9mOikR
         K6qGqqnWAHGg78fzStMheeIFFiOk2ckTMzbPXFCDWEnvRC7/sgZM13IWqiro3WFoRAM/
         kOLFWUEmQBxWND74h9uOKAMYYQC9WjSbbIzOWVYyXybx9w4HWmcRGxCLwwPt0Q8rpEzF
         qaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ya0iv+xjtgk+KbWZdbpF+3/p23xC0vgD9QxwNHC4wzo=;
        b=oRr+OmD5AGR8cJCunGAF3kO2Pjha8sWEd6+NODrX4aEEG1GfhkeiiPoFBZzuP7FN/U
         RrmsIL0xtf3Dxsf91JalZAiLrRzwO3Wfg2k5wEc86TVEKnGHP8QvqcmzV5CTyJS7HH+5
         QQVVLM6ip00j0g15voXyqNNmVFtMKPJgh/I5uV/j/srCY8GUNHJoVfPA/53CFxIYmOuI
         TfWU5BeVIKhLzxbmxzxkPNIEDl4AJOYluI3bS86NP4612Sx6aKaxc2d4h9AfLb0x01BO
         QY8sYjhX8ENPddfF/pRHSOYCF7ru3VzurjwwctJT84ZW1TPI9LgG1E5o7DtOC18oWvuS
         T72Q==
X-Gm-Message-State: AOAM530a5YI0YF41g+mrgWtUqw70YIX2TZRmOBAKOTZZidHPdsfkVtNq
	T1aPz82WvCNhKgiUjCu7rN1V+oIPPT8=
X-Google-Smtp-Source: ABdhPJxT0Q6VmD3LuyWEIxjpy/iZPkXyU7wuzlg78/XTigbVbBnOWhav/35Lhnf8aIy10QA2uNHfMg==
X-Received: by 2002:a05:6512:32c6:: with SMTP id f6mr13316789lfg.292.1631034595700;
        Tue, 07 Sep 2021 10:09:55 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [RFC PATCH 3/3] toolstack/arm: Add handling of extended regions for DomU
Date: Tue,  7 Sep 2021 20:09:38 +0300
Message-Id: <1631034578-12598-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631034578-12598-1-git-send-email-olekstysh@gmail.com>
References: <1631034578-12598-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The extended region (safe range) is a region of guest physical
address space which is unused and could be safely used to create
grant/foreign mappings instead of wasting real RAM pages from
the domain memory for establishing these mappings.

The extended regions are chosen at the domain creation time and
advertised to it via "reg" property under hypervisor node in
the guest device-tree. As region 0 is reserved for grant table
space, introduce new "extended-region" property to inform
domain about the presence of additional regions (1...N).
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
 tools/libs/light/libxl_arm.c | 92 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e3140a6..41cf017 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -615,9 +615,23 @@ static int make_hypervisor_node(libxl__gc *gc, void *fdt,
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
+    if (res) return res;
+
+    /*
+     * TODO: It would be correct to advertise that we provide the extended
+     * region after allocating it in finalise_ext_region(). The reason why we do
+     * this right now (in advance) is because we cannot insert a properly in
+     * finalise_ext_region(), but we have a mechanism to remove it there.
+     * So, if we are not able to allocate the region later on, we will remove
+     * the property.
+     */
+    res = fdt_property(fdt, "extended-region", NULL, 0);
     if (res) return res;
 
     /*
@@ -1069,6 +1083,78 @@ static void finalise_one_node(libxl__gc *gc, void *fdt, const char *uname,
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
+     * a second region. Otherwise, remove the property that advertises it.
+     */
+    set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+              GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
+    if (region_size > 0) {
+        LOG(DEBUG, "Extended region: %#"PRIx64"->%#"PRIx64"\n",
+            region_base, region_base + region_size);
+
+        set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                  region_base, region_size);
+    } else
+        fdt_nop_property(fdt, offset, "extended-region");
+
+    rc = fdt_setprop_inplace(fdt, offset, "reg", regs, sizeof(regs));
+    assert(!rc);
+}
+
 int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
                                                uint32_t domid,
                                                libxl_domain_config *d_config,
@@ -1109,6 +1195,8 @@ int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
 
     }
 
+    finalise_ext_region(gc, dom);
+
     for (i = 0; i < GUEST_RAM_BANKS; i++) {
         const uint64_t size = (uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT;
 
-- 
2.7.4


