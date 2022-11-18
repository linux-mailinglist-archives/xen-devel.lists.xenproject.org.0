Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05E462F3F6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 12:47:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445618.700876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovzpc-00011Y-DS; Fri, 18 Nov 2022 11:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445618.700876; Fri, 18 Nov 2022 11:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovzpc-0000yD-92; Fri, 18 Nov 2022 11:46:52 +0000
Received: by outflank-mailman (input) for mailman id 445618;
 Fri, 18 Nov 2022 11:46:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jn0n=3S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovzpa-0000h4-Us
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 11:46:51 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa95d275-6736-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 12:46:42 +0100 (CET)
Received: from BN9PR03CA0169.namprd03.prod.outlook.com (2603:10b6:408:f4::24)
 by PH8PR12MB6723.namprd12.prod.outlook.com (2603:10b6:510:1ce::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Fri, 18 Nov
 2022 11:46:46 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::3e) by BN9PR03CA0169.outlook.office365.com
 (2603:10b6:408:f4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 11:46:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 11:46:45 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 05:46:44 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 03:46:37 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 18 Nov 2022 05:46:36 -0600
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
X-Inumbo-ID: aa95d275-6736-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7e/q7N9E6KrBG5KRZAtP6ajhNCSnEA4vVie7Hlrdc2UWhAw8MQPaWBLGElTjN3xtTNU8sTdm6STP0af5/H1Z+QWzWlf+68CZxpoUsE0Q8QW7GP60lb+MyluSOFzWFJsleuXPZf9RvZSEyBPDGjm+1x5giW3rqkDU0rCOl4Tx9umeKDY0Ffuwr5imntY6EmLBEbhoLbd+G68s6S2GsSFtP2xd8ihnIdQEgMrv4bZExAEHwP7dOM9rUD7FCTwDe9XYzSHhakmIEe6PMwSj5Gd8y9kOK2/ByaU6ZiEgu5KnBj4LgYW/J1MZO9+TfUcPmmpgM4xwjIAuZEkwmWOd6IAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mljmr6w6YFyY1nsQNJffwUBvk7mfAY2MBuN66UsplmA=;
 b=H+B5SP9mUXEGN2H3I5nuKPdAmfxdPGdoy5ctMx0l+g3EATDWezeQdu/JlR9DjW4eYybzBPpm+yEJhkBPrbe4fBUD/v3JRZIqflmjupys8eWUcoxEP5srzIEKdYkYWrAvuzKmL4PAJm57xBosuRQuEgW785BPek907f8tfkR93DQxeX3fVMJW5OnSWlajV6P9yQSD+SJ98feFUIPB+SacWQmCf4SkDX7z+xcQOOF06Qd/wwqDnmX61sGaDaUO9G3xKSeU8mtOSwiMNnWvWlHSrJOkNuK1V135ofnrI7UrxJGSzbKN0g0zZ6K3sSKEoOSrmNGSohxnyutxcejiz8OHdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mljmr6w6YFyY1nsQNJffwUBvk7mfAY2MBuN66UsplmA=;
 b=G1/1bZRrUg+ZI7LpOY5FGIENu03rkRW5bJSZp2WBl/Fx328p0hjTpLT6nVfuRQ3IjFiGl1EQYEgx17lw0LzyUOxd0JI2AYWc1lx4S6DGI+fI3U4Uu+EauOuXB+BPYBrQ6jggnz2x2/vmAvLtEcVBMc5J7LE41K4JNj65xxvR4lU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/3] xen/arm: Drop early_uart_init macro from debug-meson.inc
Date: Fri, 18 Nov 2022 12:46:16 +0100
Message-ID: <20221118114618.20754-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118114618.20754-1-michal.orzel@amd.com>
References: <20221118114618.20754-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT005:EE_|PH8PR12MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f6f17a-6641-4e71-4d5c-08dac95a91c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HSsOzed7LukJXNSRm1HmxGogaM08uhyORH4nUeb7I+okBxTtuGbnJfNJhJOOJGvUG3tGFR1xxYRkOBpV2QPBZOwu461Yo6e2mS+lhNGuoawskSH4/j0lekoSgFJ9/k4pEaYEV77ZHp6kr4CjqlJ2hI+lRWBclyZXMkg1ddcbjFqeBsZ5cHdKPIlnWOyCZ/IA9WTG9+jlyy5X74i6ucsKW8oZ+ZpVzJLLK3symBflX8n6au4KhfRKllrlJ2wI1psDeNHI+syq6ScHNggRfkw7F1yczoggy++tOX/XaXp45hUtQ9En2G/rr6JBdnk6L+mmO2cUaILY4MNiZrosCXYahccSOrI0shw3eoGS9NnTQNiaiRfATo58i9wqvXeS5DXCqcXcTEa0A5mGpOw2d0U+GI7tWyI9uRITrckF6px8CnVJTFYRQHCe+WaK3l1lLFa55sMH41MIBabQuc/kVv8wMcTlS4R4HeUiLD0aSo2+grA5Gyrct7SXUjq0hTv0vJApx1jE80ptMANxVk1d6y9j0/KjhKhZKglFGunHwhmhfLX/3sxxijQ3zY5eNrRxgWoDe/GcQolSbJHg7n8J3aKM+lkOYZROjVqN5HfoXGEbWGtjd68jkPZj1jWJBTw9lvlvf0lvqQj109mA5G/THWjsRMkEvHgUv2gvAUGwFhHmP+DqS6Z6R+DBSNUlCp1n0iJdK83P6tsJ3pXCRROretVOUwDEal0QyIDqDLtUQfxr/bE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(40480700001)(86362001)(36756003)(40460700003)(81166007)(356005)(82740400003)(82310400005)(26005)(6666004)(6916009)(54906003)(44832011)(4744005)(8936002)(336012)(47076005)(186003)(1076003)(5660300002)(83380400001)(426003)(2906002)(8676002)(4326008)(70586007)(316002)(478600001)(2616005)(70206006)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 11:46:45.5875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f6f17a-6641-4e71-4d5c-08dac95a91c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6723

early_uart_init macro is only used if CONFIG_EARLY_UART_INIT is set.
This config option depends on EARLY_UART_PL011, so there is no point
in defining it for MESON, especially if it is empty. Remove it and adapt
the existing comment.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm64/debug-meson.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/arm64/debug-meson.inc b/xen/arch/arm/arm64/debug-meson.inc
index e1a8fa8ab9c4..e65e1ccde482 100644
--- a/xen/arch/arm/arm64/debug-meson.inc
+++ b/xen/arch/arm/arm64/debug-meson.inc
@@ -23,9 +23,10 @@
 
 #define AML_UART_TX_FIFO_FULL   21
 
-.macro early_uart_init xb, c
-/* Uart has already been initialized by Firmware, for instance by TF-A */
-.endm
+/*
+ * No need for early_uart_init, as UART has already been initialized
+ * by Firmware, for instance by TF-A.
+ */
 
 /*
  * MESON UART wait UART to be ready to transmit
-- 
2.25.1


