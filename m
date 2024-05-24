Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225938CEC5C
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:17:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729891.1135239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDk-0000GK-FP; Fri, 24 May 2024 22:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729891.1135239; Fri, 24 May 2024 22:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDk-0000AD-5J; Fri, 24 May 2024 22:17:04 +0000
Received: by outflank-mailman (input) for mailman id 729891;
 Fri, 24 May 2024 22:17:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAdDi-0007Iy-SM
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:17:02 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56dc309d-1a1b-11ef-90a1-e314d9c70b13;
 Sat, 25 May 2024 00:17:00 +0200 (CEST)
Received: from DM5PR08CA0034.namprd08.prod.outlook.com (2603:10b6:4:60::23) by
 CY5PR12MB6179.namprd12.prod.outlook.com (2603:10b6:930:24::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.26; Fri, 24 May 2024 22:16:55 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::75) by DM5PR08CA0034.outlook.office365.com
 (2603:10b6:4:60::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.25 via Frontend
 Transport; Fri, 24 May 2024 22:16:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 22:16:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:16:53 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 24 May 2024 17:16:53 -0500
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
X-Inumbo-ID: 56dc309d-1a1b-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1WOooZrS4FH+fyJ4SSehSaqtVvNVnbUijGatl/DGrn68l53YfnP8aBy6pCVotcgP0MzVC5O5aCfGywTSoEGYgvSGDDyM2WFbIpsj9s4+ib1Rd1agRBHvfvoWzcu6tOAgYH58Dp8Z+KTDoKA4cYZ8xXOTP4v2gRhiKuCeYoDQCf9RCDf8OC6xzuJHRoTMLwbeFL9JuL2DWXoFrWccFuCAaJKrU+obhl88HaGrK7oXDqarXx5ysV4SIq3wUgJ2bsDh935baZGdhgDYnZZy7xEtAYhAQZlJz6PgckpIb7lwwXaBtiiBYnslEfv04elBYo9rhM+H794tfh+DVAP53PbOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3jJMlOrEINeOqECOvhj7YrjOfi6yjCyyFlom/2lhcc=;
 b=AHLzFVxfdmPKSLY1YtAaJiQufbIrNc+5WpangG7AxgdIT1xQptvcjPMsifLBQzvZk46sJHhsUZltDuNJ3g/PxePAd+KfbP3H7tBlO91bOLIAtdXjIksoxZ0jX8kEU9jP5fH9Y8KqgTjodQ27a2/sFcojoYtoJXq1Vr/cFfj2UmNwsTe9ggceC3CvDmm+1ShCmqW4LKoByT4CHhntNcFFqr85367OSRg/FGObT3zsBq1NmjQ+urdPL/5hS6AGd9kmeohveRRwhW/DiwTa28szsngWFZ46MMHwT0ssiIMNiCs2ue/AyMQT0zjcXIG4yNgb9tqzjBJK2Nvd2cRo5Jm+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3jJMlOrEINeOqECOvhj7YrjOfi6yjCyyFlom/2lhcc=;
 b=FDgOXMKihEKrR3R36cgnYUEr4THgczch2FnwFnc1Zi3ZExA01ySutsrcWZB01iybLOrd2MkfqlYi6cdxRj6ivpmRJPEVz/XoVCvS1sYyMlFPa8eyhX06LlOXGcNzfnMKDOQ+EVnYr5pVw1oF71zLAHZ/IhB2k8GdCnLIT8yghNs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <anthony@xenproject.org>, <sstabellini@kernel.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
	"Stefano Stabellini" <stefano.stabellini@xilinx.com>, Henry Wang
	<xin.wang2@amd.com>
Subject: [PATCH v6 7/7] docs: Add device tree overlay documentation
Date: Fri, 24 May 2024 15:16:47 -0700
Message-ID: <20240524221647.2860711-7-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|CY5PR12MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: cc71ca9e-005e-4f8d-eef1-08dc7c3f3851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?deCGLzX/V1y8E1Tqx8Fh3fF2X4SFWVIXBAZZTwvkHrIvwzSx9AcJYK+dzWOX?=
 =?us-ascii?Q?+QriQOY6UE4ri6HE0WpZWblf64Skvx23+4xd0KlJHy63+jfTGXoRBz0L94CM?=
 =?us-ascii?Q?vU/pXAX5kHCjV0QEl8+b5BKr8iJLY1+Wk924OcjWwo6Q4OnCyf6e8eeljC7A?=
 =?us-ascii?Q?43WlawRJQwIzzEBQxSFU0/WohKSfq1dk5og8URauTXAeiCkGBsqDAXavhWcs?=
 =?us-ascii?Q?iB5lRm62iQ7CB7ZEMwS3x4PIrVGsL0EcaE0ts4vwZENa7BYIA2D7zQpQwEaL?=
 =?us-ascii?Q?mQ3DjfrujikEg/ajUmzBNbdAoi+kWc2ndWKFl0EQAiB8DVo6RIhYC8GH7qXt?=
 =?us-ascii?Q?Fw4n/iuyAX+3TacF1tiA0s9Ro6xqns3PmDqWBXZXz0wyb8gn1oWmwIjnD/CI?=
 =?us-ascii?Q?bnOgzZ/p3M/eNgm5hvWvn/0CI198tBUMAmwMrA/qYTGtFWWLebWagMq+jreL?=
 =?us-ascii?Q?m+6xIQKdgwDePDicDePYGXm+L4Aio8qagKHInO9S8IpQ1P/grvLT5BtaOgo4?=
 =?us-ascii?Q?07H9nKOPiqC3PhLFG/OvxT9ggf2hUT5fbIg7QdYnU4hnkf1Tig0Hi1gI6D1Z?=
 =?us-ascii?Q?f1WzSfpsS1qGXreJvhXQjbwKPKd1nFCxJCugqozB9fiGtFlaxtluS+VxQCDa?=
 =?us-ascii?Q?f6zKFyygE1Ajtt5nhhX0WYAFBTyj1XSONKqstknPmpIMHAeBimJH+FY9ZPQ9?=
 =?us-ascii?Q?7MELPM9j9EPB391ByY91WelFad13kl9UopNCfLqxxLnjGHy+W02gaaUyKVAf?=
 =?us-ascii?Q?OhVcfYjlLaIgEhoQtPPZs3coeW8vOsaSrdeoVOm7nVrd49afc/9z86h6BJ4E?=
 =?us-ascii?Q?tCjYTNp2N6i45czoGbFc7CudCpNhyb9TZbgKKuFuH1t1mAWh0UV/6Oa9I0Z0?=
 =?us-ascii?Q?4PgqgplJmOHYOBQDQrNMHKVaNoH1XVqd8wDXo6QUbjohM8d5KnWEEvMRaDNC?=
 =?us-ascii?Q?UhT4FvuesX5j44SFxHIk3I6diVlpOFkbY4C3UYlkMyf5MACHphLtd6/ZhodE?=
 =?us-ascii?Q?6d9t1F8n2eRZbFcPhgecu6qZ5VPeNnVuhxCEfNNgkhtgYmT1adIYYaOmGmKr?=
 =?us-ascii?Q?HvFuheVTbHYFwuP1htWGVS4IasF2F6XChpS5rhIfRVi4mXpD9tHAiCp2i8Ny?=
 =?us-ascii?Q?41ynCKbmhCxv1WuVMtgcN6WWRZB81PmlVkA3pILVy/no/QjAQMZokTAvpuxv?=
 =?us-ascii?Q?FG0qCsVbPb1sjj14KYFtG0BIWzbUz9hPn2BsePcm7ieitz81SpoWXcjiX0ns?=
 =?us-ascii?Q?+/yw7UaWyZn6eiAd9HufssvZURQ8vG51dNVWfYivAxq/juPb8noNfTfC76NV?=
 =?us-ascii?Q?PCbcHvffcem74FQ/46HeJidN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 22:16:54.8195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc71ca9e-005e-4f8d-eef1-08dc7c3f3851
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6179

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 docs/misc/arm/overlay.txt | 82 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 docs/misc/arm/overlay.txt

diff --git a/docs/misc/arm/overlay.txt b/docs/misc/arm/overlay.txt
new file mode 100644
index 0000000000..ef3ef792f7
--- /dev/null
+++ b/docs/misc/arm/overlay.txt
@@ -0,0 +1,82 @@
+# Device Tree Overlays support in Xen
+
+Xen experimentally supports dynamic device assignment to running
+domains, i.e. adding/removing nodes (using .dtbo) to/from Xen device
+tree, and attaching them to a running domain with given $domid.
+
+Dynamic node assignment works in two steps:
+
+## Add/Remove device tree overlay to/from Xen device tree
+
+1. Xen tools check the dtbo given and parse all other user provided arguments
+2. Xen tools pass the dtbo to Xen hypervisor via hypercall.
+3. Xen hypervisor applies/removes the dtbo to/from Xen device tree.
+
+## Attach device from the DT overlay to domain
+
+1. Xen tools check the dtbo given and parse all other user provided arguments
+2. Xen tools pass the dtbo to Xen hypervisor via hypercall.
+3. Xen hypervisor attach the device to the user-provided $domid by
+   mapping node resources in the DT overlay.
+
+# Examples
+
+Here are a few examples on how to use it.
+
+## Dom0 device add
+
+For assigning a device tree overlay to Dom0, user should firstly properly
+prepare the DT overlay. More information about device tree overlays can be
+found in [1]. Then, in Dom0, enter the following:
+
+    (dom0) xl dt-overlay add overlay.dtbo
+
+This will allocate the devices mentioned in overlay.dtbo to Xen device tree.
+
+To assign the newly added device from the dtbo to Dom0:
+
+    (dom0) xl dt-overlay attach overlay.dtbo 0
+
+Next, if the user wants to add the same device tree overlay to dom0
+Linux, execute the following:
+
+    (dom0) mkdir -p /sys/kernel/config/device-tree/overlays/new_overlay
+    (dom0) cat overlay.dtbo > /sys/kernel/config/device-tree/overlays/new_overlay/dtbo
+
+Finally if needed, the relevant Linux kernel drive can be loaded using:
+
+    (dom0) modprobe module_name.ko
+
+## DomU device add/remove
+
+All the nodes in dtbo will be assigned to one domain. The user will need
+to prepare a different dtbo for the domU. For example, the
+`interrupt-parent` property of the DomU overlay should be changed to the
+Xen hardcoded value `0xfde8` and the xen,reg property should be added to
+specify the address mappings. If the domain is not 1:1 mapped, xen,reg
+must be present. See the xen,reg format description in
+docs/misc/arm/passthrough.txt. Below assumes the properly written DomU
+dtbo is `overlay_domu.dtbo`.
+
+You need to set the `passthrough` property in the xl config file if you
+plan to use DT overlay and devices requiring an IOMMU.
+
+User will also need to modprobe the relevant drivers. For already
+running domains, the user can use the xl dt-overlay attach command,
+example:
+
+    (dom0) xl dt-overlay add overlay.dtbo            # If not executed before
+    (dom0) xl dt-overlay attach overlay_domu.dtbo $domid
+    (dom0) xl console $domid                         # To access $domid console
+
+Next, if the user needs to modify/prepare the overlay.dtbo suitable for
+the domU:
+
+    (domU) mkdir -p /sys/kernel/config/device-tree/overlays/new_overlay
+    (domU) cat overlay_domu.dtbo > /sys/kernel/config/device-tree/overlays/new_overlay/dtbo
+
+Finally, if needed, the relevant Linux kernel drive can be probed:
+
+    (domU) modprobe module_name.ko
+
+[1] https://www.kernel.org/doc/Documentation/devicetree/overlay-notes.txt
-- 
2.25.1


