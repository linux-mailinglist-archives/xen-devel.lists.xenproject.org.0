Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CBC63F51D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:20:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451043.708651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mI6-0005UM-FI; Thu, 01 Dec 2022 16:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451043.708651; Thu, 01 Dec 2022 16:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mI6-0005QP-BZ; Thu, 01 Dec 2022 16:20:02 +0000
Received: by outflank-mailman (input) for mailman id 451043;
 Thu, 01 Dec 2022 16:20:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0mI5-00056N-1n
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:20:01 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 00b98bdb-7194-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 17:20:00 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47ED4D6E;
 Thu,  1 Dec 2022 08:20:06 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D95343F73B;
 Thu,  1 Dec 2022 08:19:58 -0800 (PST)
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
X-Inumbo-ID: 00b98bdb-7194-11ed-91b6-6bf2151ebd3b
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 21/21] xen/arm: vIOMMU: Modify the partial device tree for dom0less
Date: Thu,  1 Dec 2022 16:02:45 +0000
Message-Id: <127da5a0d4300e083b8840a4f3a0d2d63bde5b6f.1669888522.git.rahul.singh@arm.com>
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
 xen/arch/arm/domain_build.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7cd99a6771..afb3e76409 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3235,7 +3235,35 @@ static int __init handle_prop_pfdt(struct kernel_info *kinfo,
     return ( propoff != -FDT_ERR_NOTFOUND ) ? propoff : 0;
 }
 
-static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
+static void modify_pfdt_node(void *pfdt, int nodeoff)
+{
+    int proplen, i, rc;
+    const fdt32_t *prop;
+    fdt32_t *prop_c;
+
+    prop = fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
+    if ( !prop )
+        return;
+
+    prop_c = xzalloc_bytes(proplen);
+
+    for ( i = 0; i < proplen / 8; ++i )
+    {
+        prop_c[i * 2] = cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
+        prop_c[i * 2 + 1] = prop[i * 2 + 1];
+    }
+
+    rc = fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR, "Can't set the iommus property in partial FDT");
+        return;
+    }
+
+    return;
+}
+
+static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
                                  int nodeoff,
                                  uint32_t address_cells, uint32_t size_cells,
                                  bool scan_passthrough_prop)
@@ -3261,6 +3289,7 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
     node_next = fdt_first_subnode(pfdt, nodeoff);
     while ( node_next > 0 )
     {
+        modify_pfdt_node(pfdt, node_next);
         scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
                        scan_passthrough_prop);
         node_next = fdt_next_subnode(pfdt, node_next);
-- 
2.25.1


