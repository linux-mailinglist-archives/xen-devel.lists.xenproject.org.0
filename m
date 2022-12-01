Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0849763F51C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451038.708640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mHm-0004sX-5g; Thu, 01 Dec 2022 16:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451038.708640; Thu, 01 Dec 2022 16:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mHm-0004py-2q; Thu, 01 Dec 2022 16:19:42 +0000
Received: by outflank-mailman (input) for mailman id 451038;
 Thu, 01 Dec 2022 16:19:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0mHk-0003Vx-Od
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:19:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f4a24343-7193-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 17:19:39 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05FDAD6E;
 Thu,  1 Dec 2022 08:19:46 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1F5E3F73B;
 Thu,  1 Dec 2022 08:19:38 -0800 (PST)
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
X-Inumbo-ID: f4a24343-7193-11ed-8fd2-01056ac49cbb
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH 20/21] libxl/arm: vIOMMU: Modify the partial device tree for iommus
Date: Thu,  1 Dec 2022 16:02:44 +0000
Message-Id: <45ac5b639319b7282086bac609329ca3c5a411bf.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To configure IOMMU in guest for passthrough devices, user will need to
copy the unmodified "iommus" property from host device tree to partial
device tree. To enable the dom0 linux kernel to confiure the IOMMU
correctly replace the phandle in partial device tree with virtual
IOMMU phandle when "iommus" property is set.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 tools/libs/light/libxl_arm.c | 47 +++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index f2bb7d40dc..16d068404f 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1167,6 +1167,41 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt, void *pfdt)
     return 0;
 }
 
+static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+{
+    int nodeoff, proplen, i, r;
+    const fdt32_t *prop;
+    fdt32_t *prop_c;
+
+    nodeoff = fdt_path_offset(pfdt, "/passthrough");
+    if (nodeoff < 0)
+        return nodeoff;
+
+    for (nodeoff = fdt_first_subnode(pfdt, nodeoff);
+         nodeoff >= 0;
+         nodeoff = fdt_next_subnode(pfdt, nodeoff)) {
+
+        prop = fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
+        if (!prop)
+            continue;
+
+        prop_c = libxl__zalloc(gc, proplen);
+
+        for (i = 0; i < proplen / 8; ++i) {
+            prop_c[i * 2] = cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
+            prop_c[i * 2 + 1] = prop[i * 2 + 1];
+        }
+
+        r = fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
+        if (r) {
+            LOG(ERROR, "Can't set the iommus property in partial FDT");
+            return r;
+        }
+    }
+
+    return 0;
+}
+
 #else
 
 static int check_partial_fdt(libxl__gc *gc, void *fdt, size_t size)
@@ -1185,6 +1220,13 @@ static int copy_partial_fdt(libxl__gc *gc, void *fdt, void *pfdt)
     return -FDT_ERR_INTERNAL;
 }
 
+static int modify_partial_fdt(libxl__gc *gc, void *pfdt)
+{
+    LOG(ERROR, "partial device tree not supported");
+
+    return ERROR_FAIL;
+}
+
 #endif /* ENABLE_PARTIAL_DEVICE_TREE */
 
 #define FDT_MAX_SIZE (1<<20)
@@ -1307,8 +1349,11 @@ next_resize:
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
 
-        if (info->arch_arm.viommu_type == LIBXL_VIOMMU_TYPE_SMMUV3)
+        if (info->arch_arm.viommu_type == LIBXL_VIOMMU_TYPE_SMMUV3) {
             FDT( make_vsmmuv3_node(gc, fdt, ainfo, dom) );
+            if (pfdt)
+                FDT( modify_partial_fdt(gc, pfdt) );
+        }
 
         iommu_created = false;
         for (i = 0; i < d_config->num_disks; i++) {
-- 
2.25.1


