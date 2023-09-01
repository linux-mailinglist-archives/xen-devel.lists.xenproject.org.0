Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AD978F7C5
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:00:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594216.927478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwGU-0003T3-LZ; Fri, 01 Sep 2023 05:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594216.927478; Fri, 01 Sep 2023 05:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwGU-0003Qf-Hc; Fri, 01 Sep 2023 05:00:14 +0000
Received: by outflank-mailman (input) for mailman id 594216;
 Fri, 01 Sep 2023 05:00:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGS-0001Hn-ES
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:12 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e88::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cde6eb5-4884-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 07:00:10 +0200 (CEST)
Received: from CY8PR10CA0035.namprd10.prod.outlook.com (2603:10b6:930:4b::20)
 by PH7PR12MB8425.namprd12.prod.outlook.com (2603:10b6:510:240::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Fri, 1 Sep
 2023 05:00:07 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:4b:cafe::27) by CY8PR10CA0035.outlook.office365.com
 (2603:10b6:930:4b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.25 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Fri, 1 Sep 2023 05:00:07 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 22:00:05 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:05 -0500
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
X-Inumbo-ID: 6cde6eb5-4884-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khGLwmFWZ7/CYopEgb7toFEB4nDktaUmMbocRTHbVkAdv06dcDeM9GF7Hjh1G/cnCXaCFr0EdFbbEFzrZ4gmVq4s16LQAfNOLJ0GzfjNs6olwbhNdYiXAWa/JPRuWs+d5ZCbbkRw9UpZC/f7WXpRO/nWi2xW4CIhL6xW9plm+bubcpzPvsM0vUKjQV3C5ZdrWxYCBbAunpE5KQfLX8niAT1957HyDC2vzrpN4pmAUEscx1H1QXAjhvaOcPSAKKXlf79PAWrfmDeLnt8WrpWRVGMeuSAnz6mSKozRWXrl2R4lOh8eaEs1kiRp1upEyrG31COj6Q8P+s8h+mk72wCRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N48gpSlC0ul9Dgr5X4IgXaGnFeuJhzDtng9Ayqa//1E=;
 b=Abc+rUFK2fnnFV6CGoiXJe5fSKWVPnWhTqWzod/O6n3m7/PcE45wnYpoSn0Y/qPmTXZgwOHX1QRtMaG8co2zcjf2qR16kjkIJpnIvy0lNveScXfHD3OMKduM7mT6EIRgSZW7Fc+ILEsDWDO88JQ2b4dbJuL0IAYfpdduTmxKKucqVQ+TnpLWak+xJJO+pm9uTctQmieRLLZVEEBdaNN3GkAPoPQZ9rRdRrr+0vEzQRsR/+nZsfRki4o1WX7oiv3M17nqAIxawU/QmRKTk0iSYIGKrpXhSvxnPBhDEOcKUyEDUferbBrUL8RlVxjMxp9pblR57/CJIIkZSOyVfay3ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N48gpSlC0ul9Dgr5X4IgXaGnFeuJhzDtng9Ayqa//1E=;
 b=MYmmcPeLu+hSFXuMqC7KptfLXacjjBlenjK8/D7dzEileYMcRJ4q7FI56uKtC4XZdwuh15vvVZUSMWwpyj3oIZAz6TyYgcN+GkrNYPnSQhk4ECpJLzRjUMFbbgFxkMhw8R8PgsEUVManZWpmRGuOws/Q5tWKwdrZ0MHoU+cMqcc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>
Subject: [XEN][PATCH v11 04/20] common/device_tree: Export __unflatten_device_tree()
Date: Thu, 31 Aug 2023 21:59:31 -0700
Message-ID: <20230901045947.32351-5-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|PH7PR12MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: c7213844-8e55-40ef-7f25-08dbaaa84fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rNjol1fFpIq8bEXkGh1N1j41ypf469TxtlaxMskCR+47C45Kbd61wVPj/dWUcnK/y5XZ1eflRemPqQcWKO0ERU3AQDbKOfzsNM34m9nBIHzmuuzFfn1bw7tBEZZBCgZBAA/hjVeorxukW/7wiUtvfDPe74kRd3048Rt0XMSfJlvEVgyPjkidgF0NpbpeQNsA9DWjfFYgD1W4LQT7gYUKoRnqYXqX3ySfE/HyqvrQkaGUSf53nFYYPXowjLoxInl07Cd4GMd0e4IaBmW53ZUhfLj6H5mRdVgBlQVVM8qeUdwht6JsmxoMCNCF1u1f0q99cRsdVcVIDUjNSOXnQ2O0p/GogYphrOupo9jZVptagRqaHf4LLFI8qCQHyY6QM4ZGeegKzZVPsCSz9ygAcNyZ5uuD4s6FTwwcgEyhpPrS4FzrtubV87MNCCI9nljBVG/H8YlD7YCEmgpGZFrCHqbGppXbMHPcU2sT/Frevpqwzk1oRlBOGeJOm9vLz2yezjxLjsFHv366diC+FCxC5B3xXf1UqA8RGr4kZtVCv/pL2Jo/dcQgpkxYpLZCfzBr+/0OQyRK6pp4fsaBdVWKN/rFSDixWhWxKj+vA7EEoXf02fpc0OGlTiAozU1+ifyq7AxBed5QIjTBc8B/ssAjIXqVpnC0tlRENGk5chTCWsWAvxfEOiH/OwDBpPH+nuGqacpp75dbdcE4cA+5V2zKIYGLwV0q4JLHOv4Bu16FPUzSeZCdcToXi5MFlDw7JxyKDR4N5qFxgCOPWNkwA4uDcMH9Fw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(82740400003)(356005)(6666004)(40460700003)(36756003)(86362001)(81166007)(36860700001)(40480700001)(47076005)(2616005)(1076003)(2906002)(426003)(336012)(26005)(83380400001)(478600001)(8936002)(70586007)(70206006)(54906003)(8676002)(4326008)(44832011)(5660300002)(41300700001)(6916009)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:07.0878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7213844-8e55-40ef-7f25-08dbaaa84fbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8425

Following changes are done to __unflatten_device_tree():
    1. __unflatten_device_tree() is renamed to unflatten_device_tree().
    2. Remove __init and static function type.

The changes are done to make this function useable for dynamic node programming
where new device tree overlay nodes are added to fdt and further unflattend to
update xen device tree during runtime.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes from v7:
    Update the commit with why unflatten_device_tree() is changed.
    Move function documentation to device_tree.h
---
---
 xen/common/device_tree.c      | 19 +++----------------
 xen/include/xen/device_tree.h | 14 ++++++++++++++
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index fccf98f94e..b8ef1c7ae2 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2082,20 +2082,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
     return mem;
 }
 
-/**
- * __unflatten_device_tree - create tree of device_nodes from flat blob
- *
- * unflattens a device-tree, creating the
- * tree of struct device_node. It also fills the "name" and "type"
- * pointers of the nodes so the normal device-tree walking functions
- * can be used.
- * @fdt: The fdt to expand
- * @mynodes: The device_node tree created by the call
- *
- * Returns 0 on success and a negative number on error
- */
-static int __init __unflatten_device_tree(const void *fdt,
-                                          struct dt_device_node **mynodes)
+int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
 {
     unsigned long start, mem, size;
     struct dt_device_node **allnextp = mynodes;
@@ -2234,10 +2221,10 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
 void __init dt_unflatten_host_device_tree(void)
 {
-    int error = __unflatten_device_tree(device_tree_flattened, &dt_host);
+    int error = unflatten_device_tree(device_tree_flattened, &dt_host);
 
     if ( error )
-        panic("__unflatten_device_tree failed with error %d\n", error);
+        panic("unflatten_device_tree failed with error %d\n", error);
 
     dt_alias_scan();
 }
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 1d79e23b28..a518310a62 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -178,6 +178,20 @@ int device_tree_for_each_node(const void *fdt, int node,
  */
 void dt_unflatten_host_device_tree(void);
 
+/**
+ * unflatten_device_tree - create tree of device_nodes from flat blob
+ *
+ * unflattens a device-tree, creating the
+ * tree of struct device_node. It also fills the "name" and "type"
+ * pointers of the nodes so the normal device-tree walking functions
+ * can be used.
+ * @fdt: The fdt to expand
+ * @mynodes: The device_node tree created by the call
+ *
+ * Returns 0 on success and a negative number on error
+ */
+int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes);
+
 /**
  * IRQ translation callback
  * TODO: For the moment we assume that we only have ONE
-- 
2.17.1


