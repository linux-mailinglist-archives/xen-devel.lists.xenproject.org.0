Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBA13FE983
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176912.322084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYq-0004rs-Pn; Thu, 02 Sep 2021 06:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176912.322084; Thu, 02 Sep 2021 06:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYq-0004l5-Jx; Thu, 02 Sep 2021 06:50:56 +0000
Received: by outflank-mailman (input) for mailman id 176912;
 Thu, 02 Sep 2021 06:07:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=393g=NY=xilinx.com=fnuv@srs-us1.protection.inumbo.net>)
 id 1mLfsO-0004aE-Nu
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:07:04 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (unknown
 [40.107.236.63]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd80c276-0bb3-11ec-ae3e-12813bfff9fa;
 Thu, 02 Sep 2021 06:07:02 +0000 (UTC)
Received: from DM3PR12CA0089.namprd12.prod.outlook.com (2603:10b6:0:57::33) by
 BN7PR02MB4211.namprd02.prod.outlook.com (2603:10b6:406:fc::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.23; Thu, 2 Sep 2021 06:06:59 +0000
Received: from DM3NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:57:cafe::58) by DM3PR12CA0089.outlook.office365.com
 (2603:10b6:0:57::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Thu, 2 Sep 2021 06:06:59 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT042.mail.protection.outlook.com (10.13.4.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 06:06:58 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 23:06:56 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 23:06:56 -0700
Received: from [172.19.2.115] (port=56596 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mLfsG-000F6q-6V; Wed, 01 Sep 2021 23:06:56 -0700
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
X-Inumbo-ID: fd80c276-0bb3-11ec-ae3e-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6Vc4VFGnNuCCjRMR92oBl1bAZff2gHkQsaMvWJXlyY7ssCfoaZvdezkRw+D+7ISyeq/qMDSjl7kbYmvkJzBkz9SdCRIJwyPEe/NjbMCZ9veKiS1a5mJYM2wkeS/RdoA+Hapri/rlW/dwjOYfbA7Q1aNIsJi82YWAflviuIxk2K4r0XAaR/ECDp/MxCXtPNHwOphzdcG8lj60/Ir862yHzu+nj3KRU+LT8AsbDpS3dBRcV/2gE0Vw3mg3Lms/odAE2WpZBOpPpjfpFIjRY6HbXHOLoF2ry7/Nl6Eolf/EC3+iEwf1FXuoc5oqxHiO+NAtj/9lRmp2l0nRbp7Y+CH0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBIDlGqTHEriiyE7H+BVFfcsrCknmNO0E31FG6ZulT4=;
 b=Sun1v8s7rdBMypKl7wq30b8gHJPwCCBjAd+LZIlTy5RKSVCuQ+JFQUIrpkfuO3iPgIKo06YrM7jJcPj6d+htlJ5SBc8kZ4l9awvjC5pJy7PWXsQzPDiwIJS3CPH3h7BRc7FnaIDyA/ioFmpXjRIDCL68LDNSE/xzeq1fwhyxLf1q5rLqT/8DR2U57jvH2ZBl+RkXaFPK6vxPToe/YimCwGOBmc/hQYvwFQgc+BO+/LViin+qP14BwoDINaaBOfeUOuwlDJddA/WK+bNzaD5IGBpuXUCu9+VFwADGytv7ARragyJwe0gb7GxbyyCT0aDt1geqC2C/NwMo+70THM5xPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBIDlGqTHEriiyE7H+BVFfcsrCknmNO0E31FG6ZulT4=;
 b=FLUVpOfTD/W41h3mRIDt6XCQPHQ/wBHdw8Bikj2+6WL57PbHWKTUgLJ0gE0kEgvb3ankE03JYrvY2bsnHXLb5TTv0dYxcGvRPbOa/v1jI/zZneHcpAM+rFK5HCWkhfPQX54SPftiqiT0jO6BbNS3PpGYAC6o71QPgXc6+kOZuMU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>
Subject: [XEN][RFC PATCH 03/13] libfdt: import fdt_overlay from Linux
Date: Wed, 1 Sep 2021 23:05:53 -0700
Message-ID: <1630562763-390068-4-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89b30686-b128-471c-dc4a-08d96dd7df9f
X-MS-TrafficTypeDiagnostic: BN7PR02MB4211:
X-Microsoft-Antispam-PRVS:
	<BN7PR02MB4211B8938F72DEDCCA422090BCCE9@BN7PR02MB4211.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:130;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yjqvN7lSYivxzQcNipLCYLIXc4ae1BOoYUmYeHnmYIX8DTF6TSc1F/EjcJYyBj0RClsoXswFmP1pYPOntxMIa/Hf38w7L2LRjfd2YgMKITmooPwKbBANrmeAuC0fkkRDfcfVwwbQvDcXxUTsj965VFj/Q2uqV81ebBusq/wlnH9iL0WjRpyGzDBhwriBTlENWG0K5/o5C3p/q6OKvCSn/euwvLHrcuTeO8WN8zruf2HbHEUqAEJvVmerEGAJ5Qv0z/TbdVRWZk/fZ9aybpC7SoXTUeZo4+VpqC79c14An8H1XdVyphz3f0uhjdBezhfsuQ+nyqd1YiftQQfhtaf3N9BIWJVoZfnwid0IshabO6fhIhhPDdr5dcnF8rr7DB13AJz3fasHb3l2+msrHuU1piCpLfe+Z3uEhCK0TfEmAuucqXUDPet+OUf19iAlx2lgDlF4oAtThVTbj4k8V/yDUOUmxsA88S+WMwxTqKJEyJcJDF4x/6SRG/gdHPNIr/PTmSDoeubHZw2q6jbIz4Qo/ADLGEFxyMyJVgMw6cv42042qrUvMuMNaKZhVYR3ElLt/FPUX7lhiiFYMXkjuOjfpGtp/6/GvTIpbNCBo7zfeDx98cB2lLvbSDu9z57yFzfWocbGA5/sP2Pjxw+lradx5EOpTiXWEZabxIYujNTRt2mKwALw27u1neemjh8bKWA9E62myncgQcz75B9GOfuoc1mpn+DgoKdKIZrBYp6LA84=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(83380400001)(2906002)(426003)(186003)(82310400003)(54906003)(508600001)(7636003)(6916009)(7696005)(30864003)(70206006)(5660300002)(316002)(47076005)(36906005)(36860700001)(9786002)(8676002)(2616005)(70586007)(336012)(4326008)(8936002)(356005)(6666004)(26005)(36756003)(107886003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:06:58.5918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b30686-b128-471c-dc4a-08d96dd7df9f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT042.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4211

Xen is missing fdt overlay functionalities. FDT overlay is required for changing
the device tree nodes during run-time.

fdt_overlay.c file is copied from Linux tree's following patch:
commit: 6e9c9686d826564f44c93cdd6f111b1c0a9dc224
scripts/dtc: Update to upstream version v1.6.0-31-gcbca977ea121

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/libfdt/fdt_overlay.c | 882 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 882 insertions(+)
 create mode 100644 xen/common/libfdt/fdt_overlay.c

diff --git a/xen/common/libfdt/fdt_overlay.c b/xen/common/libfdt/fdt_overlay.c
new file mode 100644
index 0000000..d217e79
--- /dev/null
+++ b/xen/common/libfdt/fdt_overlay.c
@@ -0,0 +1,882 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * libfdt - Flat Device Tree manipulation
+ * Copyright (C) 2016 Free Electrons
+ * Copyright (C) 2016 NextThing Co.
+ */
+#include "libfdt_env.h"
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "libfdt_internal.h"
+
+/**
+ * overlay_get_target_phandle - retrieves the target phandle of a fragment
+ * @fdto: pointer to the device tree overlay blob
+ * @fragment: node offset of the fragment in the overlay
+ *
+ * overlay_get_target_phandle() retrieves the target phandle of an
+ * overlay fragment when that fragment uses a phandle (target
+ * property) instead of a path (target-path property).
+ *
+ * returns:
+ *      the phandle pointed by the target property
+ *      0, if the phandle was not found
+ *	-1, if the phandle was malformed
+ */
+static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
+{
+	const fdt32_t *val;
+	int len;
+
+	val = fdt_getprop(fdto, fragment, "target", &len);
+	if (!val)
+		return 0;
+
+	if ((len != sizeof(*val)) || (fdt32_to_cpu(*val) == (uint32_t)-1))
+		return (uint32_t)-1;
+
+	return fdt32_to_cpu(*val);
+}
+
+/**
+ * overlay_get_target - retrieves the offset of a fragment's target
+ * @fdt: Base device tree blob
+ * @fdto: Device tree overlay blob
+ * @fragment: node offset of the fragment in the overlay
+ * @pathp: pointer which receives the path of the target (or NULL)
+ *
+ * overlay_get_target() retrieves the target offset in the base
+ * device tree of a fragment, no matter how the actual targeting is
+ * done (through a phandle or a path)
+ *
+ * returns:
+ *      the targeted node offset in the base device tree
+ *      Negative error code on error
+ */
+static int overlay_get_target(const void *fdt, const void *fdto,
+			      int fragment, char const **pathp)
+{
+	uint32_t phandle;
+	const char *path = NULL;
+	int path_len = 0, ret;
+
+	/* Try first to do a phandle based lookup */
+	phandle = overlay_get_target_phandle(fdto, fragment);
+	if (phandle == (uint32_t)-1)
+		return -FDT_ERR_BADPHANDLE;
+
+	/* no phandle, try path */
+	if (!phandle) {
+		/* And then a path based lookup */
+		path = fdt_getprop(fdto, fragment, "target-path", &path_len);
+		if (path)
+			ret = fdt_path_offset(fdt, path);
+		else
+			ret = path_len;
+	} else
+		ret = fdt_node_offset_by_phandle(fdt, phandle);
+
+	/*
+	* If we haven't found either a target or a
+	* target-path property in a node that contains a
+	* __overlay__ subnode (we wouldn't be called
+	* otherwise), consider it a improperly written
+	* overlay
+	*/
+	if (ret < 0 && path_len == -FDT_ERR_NOTFOUND)
+		ret = -FDT_ERR_BADOVERLAY;
+
+	/* return on error */
+	if (ret < 0)
+		return ret;
+
+	/* return pointer to path (if available) */
+	if (pathp)
+		*pathp = path ? path : NULL;
+
+	return ret;
+}
+
+/**
+ * overlay_phandle_add_offset - Increases a phandle by an offset
+ * @fdt: Base device tree blob
+ * @node: Device tree overlay blob
+ * @name: Name of the property to modify (phandle or linux,phandle)
+ * @delta: offset to apply
+ *
+ * overlay_phandle_add_offset() increments a node phandle by a given
+ * offset.
+ *
+ * returns:
+ *      0 on success.
+ *      Negative error code on error
+ */
+static int overlay_phandle_add_offset(void *fdt, int node,
+				      const char *name, uint32_t delta)
+{
+	const fdt32_t *val;
+	uint32_t adj_val;
+	int len;
+
+	val = fdt_getprop(fdt, node, name, &len);
+	if (!val)
+		return len;
+
+	if (len != sizeof(*val))
+		return -FDT_ERR_BADPHANDLE;
+
+	adj_val = fdt32_to_cpu(*val);
+	if ((adj_val + delta) < adj_val)
+		return -FDT_ERR_NOPHANDLES;
+
+	adj_val += delta;
+	if (adj_val == (uint32_t)-1)
+		return -FDT_ERR_NOPHANDLES;
+
+	return fdt_setprop_inplace_u32(fdt, node, name, adj_val);
+}
+
+/**
+ * overlay_adjust_node_phandles - Offsets the phandles of a node
+ * @fdto: Device tree overlay blob
+ * @node: Offset of the node we want to adjust
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_adjust_node_phandles() adds a constant to all the phandles
+ * of a given node. This is mainly use as part of the overlay
+ * application process, when we want to update all the overlay
+ * phandles to not conflict with the overlays of the base device tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_adjust_node_phandles(void *fdto, int node,
+					uint32_t delta)
+{
+	int child;
+	int ret;
+
+	ret = overlay_phandle_add_offset(fdto, node, "phandle", delta);
+	if (ret && ret != -FDT_ERR_NOTFOUND)
+		return ret;
+
+	ret = overlay_phandle_add_offset(fdto, node, "linux,phandle", delta);
+	if (ret && ret != -FDT_ERR_NOTFOUND)
+		return ret;
+
+	fdt_for_each_subnode(child, fdto, node) {
+		ret = overlay_adjust_node_phandles(fdto, child, delta);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_adjust_local_phandles - Adjust the phandles of a whole overlay
+ * @fdto: Device tree overlay blob
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_adjust_local_phandles() adds a constant to all the
+ * phandles of an overlay. This is mainly use as part of the overlay
+ * application process, when we want to update all the overlay
+ * phandles to not conflict with the overlays of the base device tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_adjust_local_phandles(void *fdto, uint32_t delta)
+{
+	/*
+	 * Start adjusting the phandles from the overlay root
+	 */
+	return overlay_adjust_node_phandles(fdto, 0, delta);
+}
+
+/**
+ * overlay_update_local_node_references - Adjust the overlay references
+ * @fdto: Device tree overlay blob
+ * @tree_node: Node offset of the node to operate on
+ * @fixup_node: Node offset of the matching local fixups node
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_update_local_nodes_references() update the phandles
+ * pointing to a node within the device tree overlay by adding a
+ * constant delta.
+ *
+ * This is mainly used as part of a device tree application process,
+ * where you want the device tree overlays phandles to not conflict
+ * with the ones from the base device tree before merging them.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_update_local_node_references(void *fdto,
+						int tree_node,
+						int fixup_node,
+						uint32_t delta)
+{
+	int fixup_prop;
+	int fixup_child;
+	int ret;
+
+	fdt_for_each_property_offset(fixup_prop, fdto, fixup_node) {
+		const fdt32_t *fixup_val;
+		const char *tree_val;
+		const char *name;
+		int fixup_len;
+		int tree_len;
+		int i;
+
+		fixup_val = fdt_getprop_by_offset(fdto, fixup_prop,
+						  &name, &fixup_len);
+		if (!fixup_val)
+			return fixup_len;
+
+		if (fixup_len % sizeof(uint32_t))
+			return -FDT_ERR_BADOVERLAY;
+		fixup_len /= sizeof(uint32_t);
+
+		tree_val = fdt_getprop(fdto, tree_node, name, &tree_len);
+		if (!tree_val) {
+			if (tree_len == -FDT_ERR_NOTFOUND)
+				return -FDT_ERR_BADOVERLAY;
+
+			return tree_len;
+		}
+
+		for (i = 0; i < fixup_len; i++) {
+			fdt32_t adj_val;
+			uint32_t poffset;
+
+			poffset = fdt32_to_cpu(fixup_val[i]);
+
+			/*
+			 * phandles to fixup can be unaligned.
+			 *
+			 * Use a memcpy for the architectures that do
+			 * not support unaligned accesses.
+			 */
+			memcpy(&adj_val, tree_val + poffset, sizeof(adj_val));
+
+			adj_val = cpu_to_fdt32(fdt32_to_cpu(adj_val) + delta);
+
+			ret = fdt_setprop_inplace_namelen_partial(fdto,
+								  tree_node,
+								  name,
+								  strlen(name),
+								  poffset,
+								  &adj_val,
+								  sizeof(adj_val));
+			if (ret == -FDT_ERR_NOSPACE)
+				return -FDT_ERR_BADOVERLAY;
+
+			if (ret)
+				return ret;
+		}
+	}
+
+	fdt_for_each_subnode(fixup_child, fdto, fixup_node) {
+		const char *fixup_child_name = fdt_get_name(fdto, fixup_child,
+							    NULL);
+		int tree_child;
+
+		tree_child = fdt_subnode_offset(fdto, tree_node,
+						fixup_child_name);
+		if (tree_child == -FDT_ERR_NOTFOUND)
+			return -FDT_ERR_BADOVERLAY;
+		if (tree_child < 0)
+			return tree_child;
+
+		ret = overlay_update_local_node_references(fdto,
+							   tree_child,
+							   fixup_child,
+							   delta);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_update_local_references - Adjust the overlay references
+ * @fdto: Device tree overlay blob
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_update_local_references() update all the phandles pointing
+ * to a node within the device tree overlay by adding a constant
+ * delta to not conflict with the base overlay.
+ *
+ * This is mainly used as part of a device tree application process,
+ * where you want the device tree overlays phandles to not conflict
+ * with the ones from the base device tree before merging them.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_update_local_references(void *fdto, uint32_t delta)
+{
+	int fixups;
+
+	fixups = fdt_path_offset(fdto, "/__local_fixups__");
+	if (fixups < 0) {
+		/* There's no local phandles to adjust, bail out */
+		if (fixups == -FDT_ERR_NOTFOUND)
+			return 0;
+
+		return fixups;
+	}
+
+	/*
+	 * Update our local references from the root of the tree
+	 */
+	return overlay_update_local_node_references(fdto, 0, fixups,
+						    delta);
+}
+
+/**
+ * overlay_fixup_one_phandle - Set an overlay phandle to the base one
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @symbols_off: Node offset of the symbols node in the base device tree
+ * @path: Path to a node holding a phandle in the overlay
+ * @path_len: number of path characters to consider
+ * @name: Name of the property holding the phandle reference in the overlay
+ * @name_len: number of name characters to consider
+ * @poffset: Offset within the overlay property where the phandle is stored
+ * @label: Label of the node referenced by the phandle
+ *
+ * overlay_fixup_one_phandle() resolves an overlay phandle pointing to
+ * a node in the base device tree.
+ *
+ * This is part of the device tree overlay application process, when
+ * you want all the phandles in the overlay to point to the actual
+ * base dt nodes.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_fixup_one_phandle(void *fdt, void *fdto,
+				     int symbols_off,
+				     const char *path, uint32_t path_len,
+				     const char *name, uint32_t name_len,
+				     int poffset, const char *label)
+{
+	const char *symbol_path;
+	uint32_t phandle;
+	fdt32_t phandle_prop;
+	int symbol_off, fixup_off;
+	int prop_len;
+
+	if (symbols_off < 0)
+		return symbols_off;
+
+	symbol_path = fdt_getprop(fdt, symbols_off, label,
+				  &prop_len);
+	if (!symbol_path)
+		return prop_len;
+
+	symbol_off = fdt_path_offset(fdt, symbol_path);
+	if (symbol_off < 0)
+		return symbol_off;
+
+	phandle = fdt_get_phandle(fdt, symbol_off);
+	if (!phandle)
+		return -FDT_ERR_NOTFOUND;
+
+	fixup_off = fdt_path_offset_namelen(fdto, path, path_len);
+	if (fixup_off == -FDT_ERR_NOTFOUND)
+		return -FDT_ERR_BADOVERLAY;
+	if (fixup_off < 0)
+		return fixup_off;
+
+	phandle_prop = cpu_to_fdt32(phandle);
+	return fdt_setprop_inplace_namelen_partial(fdto, fixup_off,
+						   name, name_len, poffset,
+						   &phandle_prop,
+						   sizeof(phandle_prop));
+};
+
+/**
+ * overlay_fixup_phandle - Set an overlay phandle to the base one
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @symbols_off: Node offset of the symbols node in the base device tree
+ * @property: Property offset in the overlay holding the list of fixups
+ *
+ * overlay_fixup_phandle() resolves all the overlay phandles pointed
+ * to in a __fixups__ property, and updates them to match the phandles
+ * in use in the base device tree.
+ *
+ * This is part of the device tree overlay application process, when
+ * you want all the phandles in the overlay to point to the actual
+ * base dt nodes.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
+				 int property)
+{
+	const char *value;
+	const char *label;
+	int len;
+
+	value = fdt_getprop_by_offset(fdto, property,
+				      &label, &len);
+	if (!value) {
+		if (len == -FDT_ERR_NOTFOUND)
+			return -FDT_ERR_INTERNAL;
+
+		return len;
+	}
+
+	do {
+		const char *path, *name, *fixup_end;
+		const char *fixup_str = value;
+		uint32_t path_len, name_len;
+		uint32_t fixup_len;
+		char *sep, *endptr;
+		int poffset, ret;
+
+		fixup_end = memchr(value, '\0', len);
+		if (!fixup_end)
+			return -FDT_ERR_BADOVERLAY;
+		fixup_len = fixup_end - fixup_str;
+
+		len -= fixup_len + 1;
+		value += fixup_len + 1;
+
+		path = fixup_str;
+		sep = memchr(fixup_str, ':', fixup_len);
+		if (!sep || *sep != ':')
+			return -FDT_ERR_BADOVERLAY;
+
+		path_len = sep - path;
+		if (path_len == (fixup_len - 1))
+			return -FDT_ERR_BADOVERLAY;
+
+		fixup_len -= path_len + 1;
+		name = sep + 1;
+		sep = memchr(name, ':', fixup_len);
+		if (!sep || *sep != ':')
+			return -FDT_ERR_BADOVERLAY;
+
+		name_len = sep - name;
+		if (!name_len)
+			return -FDT_ERR_BADOVERLAY;
+
+		poffset = strtoul(sep + 1, &endptr, 10);
+		if ((*endptr != '\0') || (endptr <= (sep + 1)))
+			return -FDT_ERR_BADOVERLAY;
+
+		ret = overlay_fixup_one_phandle(fdt, fdto, symbols_off,
+						path, path_len, name, name_len,
+						poffset, label);
+		if (ret)
+			return ret;
+	} while (len > 0);
+
+	return 0;
+}
+
+/**
+ * overlay_fixup_phandles - Resolve the overlay phandles to the base
+ *                          device tree
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ *
+ * overlay_fixup_phandles() resolves all the overlay phandles pointing
+ * to nodes in the base device tree.
+ *
+ * This is one of the steps of the device tree overlay application
+ * process, when you want all the phandles in the overlay to point to
+ * the actual base dt nodes.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_fixup_phandles(void *fdt, void *fdto)
+{
+	int fixups_off, symbols_off;
+	int property;
+
+	/* We can have overlays without any fixups */
+	fixups_off = fdt_path_offset(fdto, "/__fixups__");
+	if (fixups_off == -FDT_ERR_NOTFOUND)
+		return 0; /* nothing to do */
+	if (fixups_off < 0)
+		return fixups_off;
+
+	/* And base DTs without symbols */
+	symbols_off = fdt_path_offset(fdt, "/__symbols__");
+	if ((symbols_off < 0 && (symbols_off != -FDT_ERR_NOTFOUND)))
+		return symbols_off;
+
+	fdt_for_each_property_offset(property, fdto, fixups_off) {
+		int ret;
+
+		ret = overlay_fixup_phandle(fdt, fdto, symbols_off, property);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_apply_node - Merges a node into the base device tree
+ * @fdt: Base Device Tree blob
+ * @target: Node offset in the base device tree to apply the fragment to
+ * @fdto: Device tree overlay blob
+ * @node: Node offset in the overlay holding the changes to merge
+ *
+ * overlay_apply_node() merges a node into a target base device tree
+ * node pointed.
+ *
+ * This is part of the final step in the device tree overlay
+ * application process, when all the phandles have been adjusted and
+ * resolved and you just have to merge overlay into the base device
+ * tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_apply_node(void *fdt, int target,
+			      void *fdto, int node)
+{
+	int property;
+	int subnode;
+
+	fdt_for_each_property_offset(property, fdto, node) {
+		const char *name;
+		const void *prop;
+		int prop_len;
+		int ret;
+
+		prop = fdt_getprop_by_offset(fdto, property, &name,
+					     &prop_len);
+		if (prop_len == -FDT_ERR_NOTFOUND)
+			return -FDT_ERR_INTERNAL;
+		if (prop_len < 0)
+			return prop_len;
+
+		ret = fdt_setprop(fdt, target, name, prop, prop_len);
+		if (ret)
+			return ret;
+	}
+
+	fdt_for_each_subnode(subnode, fdto, node) {
+		const char *name = fdt_get_name(fdto, subnode, NULL);
+		int nnode;
+		int ret;
+
+		nnode = fdt_add_subnode(fdt, target, name);
+		if (nnode == -FDT_ERR_EXISTS) {
+			nnode = fdt_subnode_offset(fdt, target, name);
+			if (nnode == -FDT_ERR_NOTFOUND)
+				return -FDT_ERR_INTERNAL;
+		}
+
+		if (nnode < 0)
+			return nnode;
+
+		ret = overlay_apply_node(fdt, nnode, fdto, subnode);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_merge - Merge an overlay into its base device tree
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ *
+ * overlay_merge() merges an overlay into its base device tree.
+ *
+ * This is the next to last step in the device tree overlay application
+ * process, when all the phandles have been adjusted and resolved and
+ * you just have to merge overlay into the base device tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_merge(void *fdt, void *fdto)
+{
+	int fragment;
+
+	fdt_for_each_subnode(fragment, fdto, 0) {
+		int overlay;
+		int target;
+		int ret;
+
+		/*
+		 * Each fragments will have an __overlay__ node. If
+		 * they don't, it's not supposed to be merged
+		 */
+		overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
+		if (overlay == -FDT_ERR_NOTFOUND)
+			continue;
+
+		if (overlay < 0)
+			return overlay;
+
+		target = overlay_get_target(fdt, fdto, fragment, NULL);
+		if (target < 0)
+			return target;
+
+		ret = overlay_apply_node(fdt, target, fdto, overlay);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int get_path_len(const void *fdt, int nodeoffset)
+{
+	int len = 0, namelen;
+	const char *name;
+
+	FDT_RO_PROBE(fdt);
+
+	for (;;) {
+		name = fdt_get_name(fdt, nodeoffset, &namelen);
+		if (!name)
+			return namelen;
+
+		/* root? we're done */
+		if (namelen == 0)
+			break;
+
+		nodeoffset = fdt_parent_offset(fdt, nodeoffset);
+		if (nodeoffset < 0)
+			return nodeoffset;
+		len += namelen + 1;
+	}
+
+	/* in case of root pretend it's "/" */
+	if (len == 0)
+		len++;
+	return len;
+}
+
+/**
+ * overlay_symbol_update - Update the symbols of base tree after a merge
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ *
+ * overlay_symbol_update() updates the symbols of the base tree with the
+ * symbols of the applied overlay
+ *
+ * This is the last step in the device tree overlay application
+ * process, allowing the reference of overlay symbols by subsequent
+ * overlay operations.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_symbol_update(void *fdt, void *fdto)
+{
+	int root_sym, ov_sym, prop, path_len, fragment, target;
+	int len, frag_name_len, ret, rel_path_len;
+	const char *s, *e;
+	const char *path;
+	const char *name;
+	const char *frag_name;
+	const char *rel_path;
+	const char *target_path;
+	char *buf;
+	void *p;
+
+	ov_sym = fdt_subnode_offset(fdto, 0, "__symbols__");
+
+	/* if no overlay symbols exist no problem */
+	if (ov_sym < 0)
+		return 0;
+
+	root_sym = fdt_subnode_offset(fdt, 0, "__symbols__");
+
+	/* it no root symbols exist we should create them */
+	if (root_sym == -FDT_ERR_NOTFOUND)
+		root_sym = fdt_add_subnode(fdt, 0, "__symbols__");
+
+	/* any error is fatal now */
+	if (root_sym < 0)
+		return root_sym;
+
+	/* iterate over each overlay symbol */
+	fdt_for_each_property_offset(prop, fdto, ov_sym) {
+		path = fdt_getprop_by_offset(fdto, prop, &name, &path_len);
+		if (!path)
+			return path_len;
+
+		/* verify it's a string property (terminated by a single \0) */
+		if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
+			return -FDT_ERR_BADVALUE;
+
+		/* keep end marker to avoid strlen() */
+		e = path + path_len;
+
+		if (*path != '/')
+			return -FDT_ERR_BADVALUE;
+
+		/* get fragment name first */
+		s = strchr(path + 1, '/');
+		if (!s) {
+			/* Symbol refers to something that won't end
+			 * up in the target tree */
+			continue;
+		}
+
+		frag_name = path + 1;
+		frag_name_len = s - path - 1;
+
+		/* verify format; safe since "s" lies in \0 terminated prop */
+		len = sizeof("/__overlay__/") - 1;
+		if ((e - s) > len && (memcmp(s, "/__overlay__/", len) == 0)) {
+			/* /<fragment-name>/__overlay__/<relative-subnode-path> */
+			rel_path = s + len;
+			rel_path_len = e - rel_path - 1;
+		} else if ((e - s) == len
+			   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
+			/* /<fragment-name>/__overlay__ */
+			rel_path = "";
+			rel_path_len = 0;
+		} else {
+			/* Symbol refers to something that won't end
+			 * up in the target tree */
+			continue;
+		}
+
+		/* find the fragment index in which the symbol lies */
+		ret = fdt_subnode_offset_namelen(fdto, 0, frag_name,
+					       frag_name_len);
+		/* not found? */
+		if (ret < 0)
+			return -FDT_ERR_BADOVERLAY;
+		fragment = ret;
+
+		/* an __overlay__ subnode must exist */
+		ret = fdt_subnode_offset(fdto, fragment, "__overlay__");
+		if (ret < 0)
+			return -FDT_ERR_BADOVERLAY;
+
+		/* get the target of the fragment */
+		ret = overlay_get_target(fdt, fdto, fragment, &target_path);
+		if (ret < 0)
+			return ret;
+		target = ret;
+
+		/* if we have a target path use */
+		if (!target_path) {
+			ret = get_path_len(fdt, target);
+			if (ret < 0)
+				return ret;
+			len = ret;
+		} else {
+			len = strlen(target_path);
+		}
+
+		ret = fdt_setprop_placeholder(fdt, root_sym, name,
+				len + (len > 1) + rel_path_len + 1, &p);
+		if (ret < 0)
+			return ret;
+
+		if (!target_path) {
+			/* again in case setprop_placeholder changed it */
+			ret = overlay_get_target(fdt, fdto, fragment, &target_path);
+			if (ret < 0)
+				return ret;
+			target = ret;
+		}
+
+		buf = p;
+		if (len > 1) { /* target is not root */
+			if (!target_path) {
+				ret = fdt_get_path(fdt, target, buf, len + 1);
+				if (ret < 0)
+					return ret;
+			} else
+				memcpy(buf, target_path, len + 1);
+
+		} else
+			len--;
+
+		buf[len] = '/';
+		memcpy(buf + len + 1, rel_path, rel_path_len);
+		buf[len + 1 + rel_path_len] = '\0';
+	}
+
+	return 0;
+}
+
+int fdt_overlay_apply(void *fdt, void *fdto)
+{
+	uint32_t delta;
+	int ret;
+
+	FDT_RO_PROBE(fdt);
+	FDT_RO_PROBE(fdto);
+
+	ret = fdt_find_max_phandle(fdt, &delta);
+	if (ret)
+		goto err;
+
+	ret = overlay_adjust_local_phandles(fdto, delta);
+	if (ret)
+		goto err;
+
+	ret = overlay_update_local_references(fdto, delta);
+	if (ret)
+		goto err;
+
+	ret = overlay_fixup_phandles(fdt, fdto);
+	if (ret)
+		goto err;
+
+	ret = overlay_merge(fdt, fdto);
+	if (ret)
+		goto err;
+
+	ret = overlay_symbol_update(fdt, fdto);
+	if (ret)
+		goto err;
+
+	/*
+	 * The overlay has been damaged, erase its magic.
+	 */
+	fdt_set_magic(fdto, ~0);
+
+	return 0;
+
+err:
+	/*
+	 * The overlay might have been damaged, erase its magic.
+	 */
+	fdt_set_magic(fdto, ~0);
+
+	/*
+	 * The base device tree might have been damaged, erase its
+	 * magic.
+	 */
+	fdt_set_magic(fdt, ~0);
+
+	return ret;
+}
-- 
2.7.4


