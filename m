Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B562E63F508
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:17:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451016.708596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mFD-0002fe-0A; Thu, 01 Dec 2022 16:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451016.708596; Thu, 01 Dec 2022 16:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mFC-0002dK-TL; Thu, 01 Dec 2022 16:17:02 +0000
Received: by outflank-mailman (input) for mailman id 451016;
 Thu, 01 Dec 2022 16:17:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0mFB-0002cy-II
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:17:01 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 95b73105-7193-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 17:17:00 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6602D6E;
 Thu,  1 Dec 2022 08:17:06 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E6273F73B;
 Thu,  1 Dec 2022 08:16:59 -0800 (PST)
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
X-Inumbo-ID: 95b73105-7193-11ed-8fd2-01056ac49cbb
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH 16/21] arm/libxl: vsmmuv3: Emulated SMMUv3 device tree node in libxl
Date: Thu,  1 Dec 2022 16:02:40 +0000
Message-Id: <a4c1c42a60c4c7032d11c3ef7c034b2a2fbeb54e.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libxl will create an Emulated SMMUv3 device tree node in the device
tree to enable the guest OS to discover the virtual SMMUv3 during guest
boot.

Emulated SMMUv3 device tree node will only be created when
"viommu=smmuv3" is set in xl domain configuration.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 tools/libs/light/libxl_arm.c | 39 ++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index b8eff10a41..00fcbd466c 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -831,6 +831,36 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *fdt,
     return 0;
 }
 
+static int make_vsmmuv3_node(libxl__gc *gc, void *fdt,
+                             const struct arch_info *ainfo,
+                             struct xc_dom_image *dom)
+{
+    int res;
+    const char *name = GCSPRINTF("iommu@%llx", GUEST_VSMMUV3_BASE);
+
+    res = fdt_begin_node(fdt, name);
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, "arm,smmu-v3");
+    if (res) return res;
+
+    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+                            GUEST_ROOT_SIZE_CELLS, 1, GUEST_VSMMUV3_BASE,
+                            GUEST_VSMMUV3_SIZE);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_VSMMUV3);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "#iommu-cells", 1);
+    if (res) return res;
+
+    res = fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
 static int make_vpci_node(libxl__gc *gc, void *fdt,
                           const struct arch_info *ainfo,
                           struct xc_dom_image *dom)
@@ -872,6 +902,12 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
         GUEST_VPCI_PREFETCH_MEM_SIZE);
     if (res) return res;
 
+    if (res) return res;
+
+    res = fdt_property_values(gc, fdt, "iommu-map", 4, 0,
+                              GUEST_PHANDLE_VSMMUV3, 0, 0x10000);
+    if (res) return res;
+
     res = fdt_end_node(fdt);
     if (res) return res;
 
@@ -1251,6 +1287,9 @@ next_resize:
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
 
+        if (info->arch_arm.viommu_type == LIBXL_VIOMMU_TYPE_SMMUV3)
+            FDT( make_vsmmuv3_node(gc, fdt, ainfo, dom) );
+
         iommu_created = false;
         for (i = 0; i < d_config->num_disks; i++) {
             libxl_device_disk *disk = &d_config->disks[i];
-- 
2.25.1


