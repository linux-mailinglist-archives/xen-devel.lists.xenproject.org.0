Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F857DE73B
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 22:08:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626654.977091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyIRS-0004Yb-40; Wed, 01 Nov 2023 21:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626654.977091; Wed, 01 Nov 2023 21:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyIRS-0004Vs-0u; Wed, 01 Nov 2023 21:07:58 +0000
Received: by outflank-mailman (input) for mailman id 626654;
 Wed, 01 Nov 2023 21:07:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UCHO=GO=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qyIRQ-0004Vm-BX
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 21:07:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8a0a4d7-78fa-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 22:07:53 +0100 (CET)
Received: from DM5PR08CA0025.namprd08.prod.outlook.com (2603:10b6:4:60::14) by
 SA1PR12MB7319.namprd12.prod.outlook.com (2603:10b6:806:2b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Wed, 1 Nov
 2023 21:07:48 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::c9) by DM5PR08CA0025.outlook.office365.com
 (2603:10b6:4:60::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 21:07:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 21:07:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 1 Nov
 2023 16:07:46 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 1 Nov 2023 16:07:45 -0500
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
X-Inumbo-ID: b8a0a4d7-78fa-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnqNDVOJHo9nyT5TWxoEv3b3BqC7Cdc4DDbPKis+fWyBRSwlrNp+7avdhwy3K4RrGujfNStm2qT68mLQEFRU7eAZMXhhAhnEHCBeZFW1AqHmIRXVfhGCnFSa+l71PJhFwRNyO3/IbG6IBp7pYWa563QYMP0CD9ZpMOp080/faITGGPZbpbHDPpHyQsd/EaleHfP2Q6akWMY4cRVdBQIQpezaiZZeXZALNI5F59DTPT/ZP3AwcisTUcVGOfSKLG+/hYMkD2NlQieW9cVmn8NW6rg3VVstf5r9rdLKKZWA3I9LcUp1rXZ+7hJR9/DM60qWV3FTcXBV4vdizdMzAVErlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Moa0axuF7omkDierUjBunbHH6SOVyOt/e+07ff+jXW8=;
 b=cYfJnGIffe1bg5gm0rMfDLu/SksgTkACSpjf/LCF7p0RBM/cBjLuztMTsCIvCw+lIvaGML3q5P3K3G3sf9pyjnJHQzt6FmB3Qbt4b1daKTpgEPkBwQo6YyVGouo4haVPGuPd2345wUQx1U2l82NbRtFBgt/Uy/Ji8rzFnFKcp9UYGQueCFZVo8d5Lbeg5KW2q4G+TJe8348563uCh0XoKUUOAAv9GLu1nZZ6qzdikkBr9SnPpB3ZsDYFPP+/8p+oTkOcu3U8mBAZN7M4c1Os2fRzhTatGwi6kQCpAC7fkV41Z172+LeQreMqpZneF7I8UIV38+Y2kuo86EI0tVfqzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Moa0axuF7omkDierUjBunbHH6SOVyOt/e+07ff+jXW8=;
 b=ITfdo05dO4E37SNkOBKGGGxkvio+2lm4/kJS1/lscm9QhCEFI2/Lh4ujBFFSM7f0TnPhlpZpNtSS9xMfSIFRl5b1hX+eyLPKSlabxAT1zvYRA7B3N6+5Zcvq2LnELbelJa1fhlXeuWK8lVdwCyyFYVkaHW4UtZMgKQb5zjXVsL0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>, Peter Maydell
	<peter.maydell@linaro.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: [QEMU][PATCH v1] Xen: Fix xen_set_irq() and xendevicemodel_set_irq_level()
Date: Wed, 1 Nov 2023 14:07:23 -0700
Message-ID: <20231101210724.27263-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SA1PR12MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a46221-23b1-4320-e7fe-08dbdb1e99d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1FjwNtzkfSY35JT5UXB11fIvap/I6B8BCWkMfj6c0bwcb/JAOUbUMwKWGe4j0BKYt+U82cDMDVQxWXrT9ebv2C1FvsX8tC2OZJPYQwHCxy7Z8D/lOmArAo0BQV4eQrKpuj+QuBzB/tm8px4LDbgnwnfyUIfHQ4X7lrRKf+e6akxr/2sxoZ+y7HPUONNS3aj7xZWjzUZVy81tdcAarrn6UNMJxl4tP4D3dHSj3m0wxbbqqp5sWu+sicWAtbFfyqYSNvGTbfIr3ZCEVA7ZU+Kqtx+7RIoyjM/xTT49mEm+bBJ1J3gQKqWDRMh1v6Gt7hExyaVAuBZSP2iZHfoB5dFZ4EPORwFAK8DOiJUvFTHomxFTvhXe+eI+PeyAFxYcRLQ1ezQfMd/MsWyt4tPkXZGUnw4dD/JMhkYH9tQWRITWWnu1v8RKaIr/SDa4rcU91+x6Jm8f4qQSWbI5k+RtZafyxsoFe4REhBHJKhxi0PzMixaz3K7IJcB2bGx5F73s7OAaPfHpeVZOxwq+VKUc8t3Ic5qnlqX40syKwwwCeSVBqI0NSPVTOiUInMriPtHZScJlgwiCZNgsrkQuHBH7ICRksAa5iGUEZcyact1KST0NAyZvsbcRlI0YiMrlATCOCtwL/X+w64/NRTocxSZJE8xpVKcueKgAHOaliK2XHhLhcTLdEoJgWluTiEwRo98qA3bf7kq62NrNnREuS/Op0mfozfTCANqzuy1QYULhwN3wFHpvoVsnwG8S+BVanY6BiIg1bqtt3q5nCBYVzqnOPR3R0A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(64100799003)(186009)(82310400011)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(8676002)(4326008)(8936002)(44832011)(1076003)(6916009)(54906003)(316002)(478600001)(26005)(41300700001)(6666004)(5660300002)(336012)(2616005)(426003)(2906002)(83380400001)(40480700001)(36860700001)(47076005)(70586007)(70206006)(82740400003)(356005)(81166007)(86362001)(40460700003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 21:07:47.6482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a46221-23b1-4320-e7fe-08dbdb1e99d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7319

Remove '=' from 'if CONFIG_XEN_CTRL_INTERFACE_VERSION <= 41500'.
Because xendevicemodel_set_irq_level() was introduced in 4.15 version.

Also, update xendevicemodel_set_irq_level() to return -1 for older versions.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 hw/arm/xen_arm.c            | 4 +++-
 include/hw/xen/xen_native.h | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index f83b983ec5..a5631529d0 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -75,7 +75,9 @@ static MemoryRegion ram_lo, ram_hi;
 
 static void xen_set_irq(void *opaque, int irq, int level)
 {
-    xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level);
+    if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
+        error_report("xendevicemodel_set_irq_level failed");
+    }
 }
 
 static void xen_create_virtio_mmio_devices(XenArmState *xam)
diff --git a/include/hw/xen/xen_native.h b/include/hw/xen/xen_native.h
index 5d2718261f..6f09c48823 100644
--- a/include/hw/xen/xen_native.h
+++ b/include/hw/xen/xen_native.h
@@ -523,12 +523,12 @@ static inline int xen_set_ioreq_server_state(domid_t dom,
                                                  enable);
 }
 
-#if CONFIG_XEN_CTRL_INTERFACE_VERSION <= 41500
+#if CONFIG_XEN_CTRL_INTERFACE_VERSION < 41500
 static inline int xendevicemodel_set_irq_level(xendevicemodel_handle *dmod,
                                                domid_t domid, uint32_t irq,
                                                unsigned int level)
 {
-    return 0;
+    return -1;
 }
 #endif
 
-- 
2.17.1


