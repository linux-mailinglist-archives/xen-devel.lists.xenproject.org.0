Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107266DE496
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519767.806722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUF-0004Vo-Rt; Tue, 11 Apr 2023 19:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519767.806722; Tue, 11 Apr 2023 19:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUF-0004Tx-OC; Tue, 11 Apr 2023 19:17:03 +0000
Received: by outflank-mailman (input) for mailman id 519767;
 Tue, 11 Apr 2023 19:17:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUE-0004Ta-U4
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:02 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e83::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e0c351d-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:00 +0200 (CEST)
Received: from BN9PR03CA0604.namprd03.prod.outlook.com (2603:10b6:408:106::9)
 by MW4PR12MB5601.namprd12.prod.outlook.com (2603:10b6:303:168::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 19:16:56 +0000
Received: from BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::3) by BN9PR03CA0604.outlook.office365.com
 (2603:10b6:408:106::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Tue, 11 Apr 2023 19:16:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT052.mail.protection.outlook.com (10.13.177.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 19:16:55 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:16:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:16:55 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:16:54 -0500
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
X-Inumbo-ID: 6e0c351d-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5odVlwbleoZs5wA2Fen6R9qmt+TiYhz/GpyppkIzbqswKQkuXyCbkxlQkjB8nSBOC20onufEscuNKm8vNm/j8yfswu3WLAnPgPOmNfR0T9GpLsMwbeW08oSzC1XnlUtEyHEDQlWFwA0VgmbcWHu+8ImpdPqQNNPYJVB9kGOgqahApezPnCwhGAVm6Fk/gJlRBBaxRQU2dbVZQlrSGqFNw5ze+hpUvgkOqmrl0qa67NkZZzimM2in0Ulk6CErHvk43d48O/zoqDAx/6h/d2jN/HJ5cMTC0cdC4wsTytksf5KinwvIQS5rOH9t2nsVXBKrTq1ZGqTcEvHCDNupHfXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0odwSwlZEbTJvdLLf27PaAsLK4pjjIm+Jsb7s8Lqv7g=;
 b=fR7WKLv54LP01SNa8MUepB3sId6Q718wi+GEOAuTATUVrbm5NmItXz521gJfoVce67ZdtDj3uDs+G6apBoBxTE+lCnDL+cIRrkpbDo+X29siGtAjog02PguifLjPmmhd8qYgMAvhHaDsn8UsmECzWKFzzUOhiLt4WhPPrKmffXvzcNBvFlzv6jZzite09ifNwof4EuwxN2kq2I3KKwQJaK/2yK/LxpPm5tIOOFf7NE7Y3kRp1BxBnxe34Tr9Stx0nbskob0ru6CJZf1I/vEDbXoZTHIrcEC4b542tPSX1IKI1PJ3H4zpeOLcL8feazxofP/zOOuTgyJ/MLkR38YXNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0odwSwlZEbTJvdLLf27PaAsLK4pjjIm+Jsb7s8Lqv7g=;
 b=Md5NgPnF/dZc6LSjpF9zQvCHu3SnY1fZQYKEa4Ctv2VO6o6TW+wqH6xsxLNdN88/nIjeb8ZQwPcGMwej8/143x3pPhkp5fPtJvG1Ou/G/K/OCJj1pfKEpnGaKFb417l4ClhSo/MkCvoC3HbxphnPRiypyMP4AOyNZm/zoYvzbgI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>
Subject: [XEN][PATCH v5 02/17] common/device_tree: change __unflatten_device_tree()
Date: Tue, 11 Apr 2023 12:16:03 -0700
Message-ID: <20230411191636.26926-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT052:EE_|MW4PR12MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a55ab8b-09ca-432d-daf6-08db3ac15098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tRF8rJuNDr5YAn1IKIgQmYgV4Xg3sb4+bNUMt0OUvk/7+9ZimF1PYMvu+V9AR319u1kO/w+2FZjcOha9YM1YSyz8nG5g9SE5swyVF/F+bEKokoJeyZlCGBUMjnmu0lJE4JbCc3xzHtHKY5Ms/JgGqNJAt5aPewk/of/WaAL4Lj20+TsmvONcyw99ZcJdonUU5JqIXalTOBeCU6LUDFk2QU1Asw0Vm304GjCHVxWrqTSHrYN0E/jLVwB3f/+YW/1sPJuZeQNFvstg22Jw0OXhnltLLL2MXutboZ3A2s/JUu4+O14c7+3ikq0T0o1Vkeysarod4OYoIVZJaexZXZcmgJ3HapzUw5MVMbTil7/FvNupjYSq4qin63K9Xg/L/zSZqk5ZbWdqZTUCGXxCmlsIme6PMcpMpTSb1rJ73dYjHhzrz0da2vQtGwplOitZCAQm608CDDedenQ66kEZ+Bp31uBouNN4Ysj1zBuMIbCjBzgWSF5zGisvcxfBdidoqHKji3INiI+kzIbrWYl1yUso8UkOxMe+3AwCpH1jx0nxOTOxLi2WV3jUmxGgFs1fCcABD+iXeskYnd9CSFppMreCQiqmZixCd0zBtyd4oMmPL992mXabbPY4c872k51Exb4Q5U+9QvpVvdNU8vuDKrQsP4jufjckzAgiCd21astDPcag/QPqJbpZI2BGHExZBL57fhM9FJWIEbmXcPSsn+fF9vs/Emc8/qMF2RqBHC2Wlhc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(40470700004)(46966006)(36840700001)(36860700001)(54906003)(2616005)(47076005)(478600001)(26005)(1076003)(6666004)(81166007)(82740400003)(356005)(41300700001)(316002)(4326008)(6916009)(186003)(336012)(83380400001)(426003)(70206006)(70586007)(2906002)(5660300002)(44832011)(36756003)(82310400005)(40460700003)(86362001)(40480700001)(8676002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:16:55.7882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a55ab8b-09ca-432d-daf6-08db3ac15098
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5601

Following changes are done to __unflatten_device_tree():
    1. __unflatten_device_tree() is renamed to unflatten_device_tree().
    2. Remove static function type.
    3. Add handling of memory allocation. This will be useful in dynamic node
        programming when we unflatten the dt during runtime memory allocation
        can fail.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/common/device_tree.c      | 10 ++++++----
 xen/include/xen/device_tree.h |  5 +++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index aed38ff63c..bf847b2584 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2047,7 +2047,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
 }
 
 /**
- * __unflatten_device_tree - create tree of device_nodes from flat blob
+ * unflatten_device_tree - create tree of device_nodes from flat blob
  *
  * unflattens a device-tree, creating the
  * tree of struct device_node. It also fills the "name" and "type"
@@ -2056,8 +2056,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
  * @fdt: The fdt to expand
  * @mynodes: The device_node tree created by the call
  */
-static void __unflatten_device_tree(const void *fdt,
-                                    struct dt_device_node **mynodes)
+void unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
 {
     unsigned long start, mem, size;
     struct dt_device_node **allnextp = mynodes;
@@ -2079,6 +2078,9 @@ static void __unflatten_device_tree(const void *fdt,
     /* Allocate memory for the expanded device tree */
     mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
 
+    if ( !mem )
+        panic("Cannot allocate memory for unflatten device tree\n");
+
     ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
 
     dt_dprintk("  unflattening %lx...\n", mem);
@@ -2179,7 +2181,7 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
 void __init dt_unflatten_host_device_tree(void)
 {
-    __unflatten_device_tree(device_tree_flattened, &dt_host);
+    unflatten_device_tree(device_tree_flattened, &dt_host);
     dt_alias_scan();
 }
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 19a74909ce..58ac12abe3 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -178,6 +178,11 @@ int device_tree_for_each_node(const void *fdt, int node,
  */
 void dt_unflatten_host_device_tree(void);
 
+/**
+ * unflatten any device tree.
+ */
+void unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes);
+
 /**
  * IRQ translation callback
  * TODO: For the moment we assume that we only have ONE
-- 
2.17.1


