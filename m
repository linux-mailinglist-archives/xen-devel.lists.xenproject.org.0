Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B606DE4B2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:20:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519884.807048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJXE-0003aH-LS; Tue, 11 Apr 2023 19:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519884.807048; Tue, 11 Apr 2023 19:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJXE-0003Qd-CX; Tue, 11 Apr 2023 19:20:08 +0000
Received: by outflank-mailman (input) for mailman id 519884;
 Tue, 11 Apr 2023 19:20:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUU-0004Ta-0J
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:18 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e88::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7825769c-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:15 +0200 (CEST)
Received: from BN9P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::32)
 by DM4PR12MB6541.namprd12.prod.outlook.com (2603:10b6:8:88::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Tue, 11 Apr
 2023 19:17:12 +0000
Received: from BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::f6) by BN9P221CA0020.outlook.office365.com
 (2603:10b6:408:10a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT113.mail.protection.outlook.com (10.13.176.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 19:17:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:11 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:11 -0500
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
X-Inumbo-ID: 7825769c-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nd9RHJF2398b5isOKaYdNprBPl/JNuJF6/ge3zT77zkGtEPFSzds6zzf69EGMJAgklQy0X2u3+v9EzkoUL8og3kVHQixgbWQ5Njigjp66elYLenh+J7QZEtnku2fMxbv6PBqSq6XIUj6sva/sCfwpP1PsxcwsbfWdY496muh8Z0FNB87I9udOfbP5c8smQ5H8CGbfH5c8V32AP2JJfi9boLHlUPpiFHk0Qj5HgGnWlTpfQLHfHGfKZoeheoD6EWHaF6sTHYHVSB6UxxLD5olg3jxzi0vdP4lQP8I1jTuxUMXF086TLemBhklKP1rC8U3EvYFa6TzY3yYcxuxpEoqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0odwSwlZEbTJvdLLf27PaAsLK4pjjIm+Jsb7s8Lqv7g=;
 b=K3LK6ruFsTA4TPqFt/ammZSl/L8ggQ6E16nomQr5n3ta6K0P+pc/IVT5pkNN8uKuBfN33CHrxT49q9EbSeedM+cJ9eBr5YKtjSRzUXAS3ki2vEzEcU272lsMobTIFxbZ35sDe9X5OMw0QP19LbdEUNveyReAdEinT6VGWtcOt+sjJ9t7O+TOqVZif8yPg+IlNbIbZP8MPBIDycowyRdg/OKXXvmcDnzoQccPxD8YtsQm4XyAdJ4AkjRQYTqVnIMebgRyjh176UgkFlaschPgOCAyq6aJPbs4nOJl6xueJtw7xLSbE+NNKhSn8K67xZDLZt4Q8tdSLM3GSuEmGpXf+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0odwSwlZEbTJvdLLf27PaAsLK4pjjIm+Jsb7s8Lqv7g=;
 b=udgPt9YgeXZs+lWeAZV5aVlBBUqHsJP0l5aFIU9sPSKpCRYAo6zY4oeKvcTzYBmDZyLZotUsv/O38LNzRY1kN4j00nm0f0Ez1qkF7ftHoqc3b5GBw/5Fn7K2kCVzTaM+aOmAX1jvjcawQ5Tu8Dbr5fDa5Ck2tJ50YmouDiOODDY=
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
Date: Tue, 11 Apr 2023 12:16:21 -0700
Message-ID: <20230411191636.26926-21-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT113:EE_|DM4PR12MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db08cfe-55db-45a7-8ea6-08db3ac15a73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1doF2RKmkOdJFbpJzZWghxFTAGAl514VARfqJ35cis52xR+3+oTUWV7ecTA9tKoXEKyGmv7DeTyTrn1VDEGDx/kRtGkMVfurLAzr3fmJ4pBmQdekjSGNIDH1N0cXBF6OUke7faWga+sa998uw4TOw3DoQ/ToBFwAdRYVw3ORW2bCw3CKqlDTkeWUTabLkD3nWScqZzDjja/4LTm64WuivS6yhyYd/Ii3uNNf5ro+GxpN6ZiodW8WCjVqwatrM/UVGv08GLDQdWwzL+F4hvaWnOcy/j3DB0hvzRM3jtIHUQuwsZgoWE+Rqh3A+urm8gt6jYpvjBOASs0e/IipHUuMt+O86Qj77dCQYN1slyKzUHekyTJeOlZVP81zPuFoeYm8SsS+mTyp2K7gjE8urSEac5HkMpLitJBbkq42mBPwi1T9xdWWPNEk2iCCQ3Ubw2GcoX91M+l+OLegeqjPAu5lfbcOYUV+qHO37OZgHoxDn9rrWJlrwi5QWNUyIHhImMeIW/LOAcTTPcioLXZhjat6OP1f3QkWaloNc8AqDPrW27sxOojetd31kuyEfyfDg83pkXVS/zg0wsA2MstlSabqI+yKf9vWvPk6pVX1MhUJPmwEsOpNJOnMZG6t8sLnWaFCWf3GlT7WDsP/jknupLlnu68GqnnzU3JPq+AEY4WHEzSCD/IlHew1+8I+3eiEp0NrYGUzGLLZIh3bJM3hbhbusjnEhQ1sqMouBCmmovcEbDM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199021)(46966006)(36840700001)(40470700004)(40480700001)(36860700001)(82740400003)(47076005)(336012)(426003)(83380400001)(8676002)(316002)(54906003)(478600001)(36756003)(1076003)(26005)(2616005)(6666004)(186003)(44832011)(4326008)(81166007)(5660300002)(2906002)(6916009)(40460700003)(356005)(70586007)(86362001)(70206006)(8936002)(82310400005)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:12.3366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db08cfe-55db-45a7-8ea6-08db3ac15a73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6541

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


