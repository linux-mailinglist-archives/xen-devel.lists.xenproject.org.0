Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6626932237
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 10:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759413.1169126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTdrD-00043w-3h; Tue, 16 Jul 2024 08:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759413.1169126; Tue, 16 Jul 2024 08:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTdrD-00040m-0Y; Tue, 16 Jul 2024 08:48:23 +0000
Received: by outflank-mailman (input) for mailman id 759413;
 Tue, 16 Jul 2024 08:48:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=POAR=OQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sTdrC-00040g-53
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 08:48:22 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20614.outbound.protection.outlook.com
 [2a01:111:f403:2009::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25e7a1dc-4350-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 10:48:19 +0200 (CEST)
Received: from BLAPR03CA0068.namprd03.prod.outlook.com (2603:10b6:208:329::13)
 by CY5PR12MB6480.namprd12.prod.outlook.com (2603:10b6:930:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Tue, 16 Jul
 2024 08:48:14 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::f9) by BLAPR03CA0068.outlook.office365.com
 (2603:10b6:208:329::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Tue, 16 Jul 2024 08:48:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 08:48:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 16 Jul
 2024 03:48:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 16 Jul
 2024 03:48:11 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 16 Jul 2024 03:48:11 -0500
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
X-Inumbo-ID: 25e7a1dc-4350-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVJAWxvQRgI+QcnoIK/WmcExmLppDMCrZAd5BkPO+sAw6iDEfy5WBgYoe0h1WZ8uN1CHUFcnQ6iIPLslI8zrY1QrlWXeLxrukFEKH0ABjaD9rSxUU/e+QcHntWjOcYotRnK/ZxnZQim6D05lBINLWR47mnpSoGU80glLliIXougd1N+Dx62K3blc7U5DPzOmJCDrXnwEgSCV6ipnnPP0M2nCl8yLXutT+1tZpikGNZOaARy8zZ1t5I9VUFUjA0EvQngqOgbp3c/71HLeW6QJSG6RIYggj97d1G7vGnYSNNk+b8sckzIzx5Hda57BFidd0k4XXR4lAjl0icQWMaTrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dTaxVqWvr20aPgF89ytjp6cwcQR8o6lIZitSUf3gOs=;
 b=FcGrnOtiWzc0uvUCniKqCSU4/zoziVNfAFpAD4fYMQa379p5/sQcGWYed1aMoYoWw1xP61urRnO3/wcYyN8d3D3IWzpoByiD89WK8InXa29paCtNr2jKpoJ/1WT9uTXVSUV80/+vYEdVhljLhzLwzdKj4SVacsKq8pRs+KxpxKPJibS+l40miKpiyuJaTXZ3AGPHTO9ljiWMmfbDMsJejhm6xPkno/nAivp38vFnJgnsKBnMarWRQez4KKHsd8RMGWnUWs9sLrV1ZnkHCS4c/I2fH30Yco5RaEaoBBJ5rDPzENSAqxHnjvm3nUZOtvJnanDWQOaRaRleKfdyRG3J8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dTaxVqWvr20aPgF89ytjp6cwcQR8o6lIZitSUf3gOs=;
 b=llMH242qgLiRoo1vm6uTRP1UhOG3illGkP7uCWcjKT1W6dAzqSyvaWjx72B1zeVzdjxHX3Hufh/8abe4kZI0k4H5uK/mySma2z1UI8/75O7wKMsdGN4+kbGGJ/t92dzO/kAZjBbH06zfo7UVnEBP0bRUQ2yru3EXrr/1dJsS7/0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder] Make 'bootefi' work again
Date: Tue, 16 Jul 2024 10:47:59 +0200
Message-ID: <20240716084759.62152-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|CY5PR12MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f9f717b-a23c-4acc-ee8e-08dca5740709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ikWb5J7RYWD/181q6CVdwCrcxcSPqGW8jMhASM2tLqsQCFebgHXGk+q+jsZJ?=
 =?us-ascii?Q?hF9LBKF9yJxoYwhSbp+bR/LLIcAZHo/pXpYeXMNoe8vV2cvgu8BH+XThAYtZ?=
 =?us-ascii?Q?Ed9QzMql20MC74cw8dWrd0nTFChHasKjYrK0sxpIz2153ENFi6wz1NfB8B4x?=
 =?us-ascii?Q?VAZY7XzCKiUN8gQ4sDspgoJqxTqsMUbMzJoB50gOIwFadfW3C/XF76SMbkLj?=
 =?us-ascii?Q?6I+9zLTMO+RLzpaBX7W1MSjSNcKAu95oP905w1H+yUEJOKF3KA4PCedmamIA?=
 =?us-ascii?Q?q+lDp+FlmD2bn6cGG8LhnkZyhZEX1rGXNOe+ueP4qFoHGjURssGGCsaOBTzY?=
 =?us-ascii?Q?XgYgmmt+TJXNMRP+RmcMe1RMGjZSRFPWMpUlrKBCxqm420Fg24dCi3Dz/dKu?=
 =?us-ascii?Q?BGF16TiqDOHIKYDcKo39tAqH9SIxxWQEtrp7twiAtmu7pSp6eryvK/NfRUv2?=
 =?us-ascii?Q?Ej5UWb5g/T3bHBvuLACmO1zHMclvweOjyaEilG6wB0BfbP6r1VkwJ8pNwwmJ?=
 =?us-ascii?Q?f6wYaH2MF80H977kjFpdeA+FCfD/266RozK/eTuV8i7Y1PsEt5SOjSjXE6mZ?=
 =?us-ascii?Q?GLuTukzSy7yS+WDlPLtReexVrpfj/NVL/4jZK5Wf1KVql+UnCC3toclocZp2?=
 =?us-ascii?Q?8pICYOpc8dwyZuI6ECV7p0QjKdD3FsEc/wYB39ZBw6IVX2qtthcQzvbm2+w8?=
 =?us-ascii?Q?Po33ZhDg275enqJmip9F9YvhUppIyAx4iu0g5/mMFS882sjlKu1zLgDVaKBB?=
 =?us-ascii?Q?6x1nFoV3lmRSwXQhGizBLlkwkBGUnnyYZwIECI627vju4HD2U2r/yumKwT2V?=
 =?us-ascii?Q?Ol2vAP2X/Y0pZq+ByRSTRWrJyZcMOkZp4oErPtXB+dkSAlRE7FwG2rDQs0Cq?=
 =?us-ascii?Q?JorB49scpf65h9I9/xoL0OpCD92qYRqN9C6pwm6/EMpeJeg3zKUm60U4tpG0?=
 =?us-ascii?Q?glFCN8aZiOvjS0o5zG6K03neDJF3y1cVkW25uAGl3+o1sdJg4Rpbn6E4ksbr?=
 =?us-ascii?Q?5i8S9x0fWEaJ+Qoh1cVaOSLEAEIqfn0XSjEssfVFv9AV+OcoFSnYndAlHbHt?=
 =?us-ascii?Q?GVJELxHt7u7NVnGfSNnQb81tin+PLBiD+qQypvYtJ1QqYiuAAY3D4OrMfU+4?=
 =?us-ascii?Q?y4ON2OM91ePEgE90LkYvgItOd+6wQQSR6SYNCkYMgsqkiSlEYFYf+n4d8hOk?=
 =?us-ascii?Q?Ej3nBJUtMLClvykt2uCihUww6/TbkJ7lqRUxuqpdxddh4adcTaBKvS/uFpba?=
 =?us-ascii?Q?IN2zqik9OmnpT033uPdYB+Tg01ByEQkoS5dUZLZpzkfoKYSIjISmYY9qRCbm?=
 =?us-ascii?Q?vE8RsyfPRFBloDCOkni6+0VucJASEVSPYnqMKSdZpP1A/+CLhzblhPk116YE?=
 =?us-ascii?Q?oGM3A0abL7Jxg1jkptSRaVJEmXTY/crvdwIKldMmRjLWItf7oilrVwSPeI9H?=
 =?us-ascii?Q?nZJqF+vUheiI8omtMh+3pMTyr/KTToEY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 08:48:13.1867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9f717b-a23c-4acc-ee8e-08dca5740709
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6480

When $BOOT_CMD is bootefi, there shall be no '-' between $kernel_addr
and $device_tree_addr.

Fixes: 3fa89f8f9853 ("Add support for BOOT_CMD")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Note: using this command would be a good opportunity for a Xen EFI boot CI test
on Arm64 when the stub is not responsible for loading modules.
---
 scripts/uboot-script-gen | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 8b664e711b10..f8a087b881ce 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -1391,7 +1391,7 @@ fi
 
 if [ "$BOOT_CMD" != "none" ]
 then
-    echo "$BOOT_CMD $kernel_addr - $device_tree_addr" >> $UBOOT_SOURCE
+    echo "$BOOT_CMD $kernel_addr $([ "$BOOT_CMD" = "bootefi" ] || echo '-') $device_tree_addr" >> $UBOOT_SOURCE
 else
     # skip boot command but store load addresses to be used later
     echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE
-- 
2.25.1


