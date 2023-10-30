Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC66C7DC34F
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 00:54:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625431.974712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxc56-0002E9-NF; Mon, 30 Oct 2023 23:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625431.974712; Mon, 30 Oct 2023 23:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxc56-0002B3-Iv; Mon, 30 Oct 2023 23:54:04 +0000
Received: by outflank-mailman (input) for mailman id 625431;
 Mon, 30 Oct 2023 23:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j9+r=GM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qxc55-00009Y-A7
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 23:54:03 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98ec147e-777f-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 00:54:00 +0100 (CET)
Received: from BL0PR01CA0001.prod.exchangelabs.com (2603:10b6:208:71::14) by
 SA1PR12MB7319.namprd12.prod.outlook.com (2603:10b6:806:2b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24; Mon, 30 Oct
 2023 23:53:57 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::e) by BL0PR01CA0001.outlook.office365.com
 (2603:10b6:208:71::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28 via Frontend
 Transport; Mon, 30 Oct 2023 23:53:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.22 via Frontend Transport; Mon, 30 Oct 2023 23:53:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 30 Oct
 2023 18:53:55 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 30 Oct 2023 18:53:54 -0500
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
X-Inumbo-ID: 98ec147e-777f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfpWf7l70nhSaMpg85PxIlTl5R0YEKaPntc0JtUjLlnj/IBgF0Um8YSKVGbjMIoCEzgnlWNRAaDEDRgNTnf/BAReeiRJBr61bMjiwBMZSX8+zhECPmzlNfEhoffkeL5748onj7GLWLz8a+pv72Hj6dW+1A54AutVsR4ShPz4XRGsvLC5Jc9mR5CFAOXnerrn/uvnVq1nLnPtlCgcNJDp3/YHiG4beGlYoKbZ4jlC8v/L6VJ5rfGyHrNNjrZ8ERop5jn9bt8B3Xa23f9SVLD+7pIK4tA4/Qk6F4A12TNI2ksvgyyzg/8HSkFsem59Fkw2aaadDDeS+nuRdV2zSBTepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jS463M7ybXNAP2udLjwYqu5FXR0JgJvPA4yJkwmqw18=;
 b=kt0O3QHGST8XQ+CKYeCZqLvGDs3nSnvJ/XG36k5CgWshkzcdIgnF/hKx8PVX7ebbXcWMSU2b7cTde1fUrYe3HzRfVMzXTlP1ZgxjhySg8tybaUE1Sn2xYtEW5LZGFi2RKd2Bfff+xKCJT9x5B55QFKbsrCblp7RTkYJ/GbKIf+oX1EDstbC3zdxbnN/ExhevL8aiky8fEq5bOj2mFK1/IBATr3Cp8mp3AZUq2hlF5CWp4auiG8AogQh/SDh7tJd4SuiSkQvqc9jDR2PYA919TzTBik4oubmslFMOQhHMeyeRd5vdVCeaxKxYnQT6UONiU6/qikFURFI1LuCRr8/m5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jS463M7ybXNAP2udLjwYqu5FXR0JgJvPA4yJkwmqw18=;
 b=5NyQVFjKeYFR2+lKxiaO+KR8pj8vj4CiLfUoL4CqyOS/iOLr/RPD3umF3wGrkLdjNVt/mPl3qPqI/KfuHd2JuQNneGQ+opXds3oLsF+gU+OQXHPDNprRnWPTKVjf4L/7I2grwUhNpflmmYV5iBMdJFS82CEBxCnCAlGcMFXs0R0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Date: Mon, 30 Oct 2023 19:52:35 -0400
Message-ID: <20231030235240.106998-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030235240.106998-1-stewart.hildebrand@amd.com>
References: <20231030235240.106998-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|SA1PR12MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: c601a318-4e04-47ca-b523-08dbd9a37a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MGCSPsk9Z40HOTa+fbrIlVXoH1aaDfpA2DLrnsnS6K+5ItVGwlRwFssVrHxQQ/8t0XJs/0VLLWZotSZu1GgwUpxGvR7tvFecKOSpCCIaDiG6Hs7o4dRPGat7f3xrJeJPRcTJa+yZtVv3kleDhrAmVnEc/7co7PViVthfTq+ZdMdKY8PIkL/gi02qpfwa9go0/KZnCKvETEXdHn/WcWI9ZPR6hfRLzvvHpr1sxeXIMI9U9AHBAj8CXpEMuEujEsYuXZ9U8h0lRlnw1CRPZzGzDD5+t6Y/ph4dwCrHjAWInf11juNWnO2g92BFrevkNpmAWhI5HkhBMqncP04cvGNrE7owU21hbif2BBVk4O4uO2gxgXEbQ3vDyCqiSVcZ/VyGikxvVIc7ibBr0QvPFQJBWddhuwdiCDJbqwcIudYrFNF8SWKyKyFET1T3qjlCCEqw5btQRtriVMzzIpbskulC9ArrvJHPe2znnV+GCGrUIyJut2qC7W/lyyulQLwh0f5JlXOjUIq6xNumGS7ITxt9zMcPvIPnxXcTwLDVS48d5XRssMtbRMiFugGOEnZFSEs6tmMlcWVUJTK4b/A0CzliMEyoDlNOaD5R0NXsVUJV4SMLDQ8tRiE5MpyEKirc999Gg+oKuQAu6kyDgTgWZbzNeQT0k2Y2QyA0Lfbam2HZTxKr4SXS75OrfPPvE9GsgklKvbPIOqxoZK3NMuMsL2sbsL4fDOVpODnTnoB/y1+iKtWUnMk6NyVj3D7pMafuHPcVQy4Pwjb+HyAOwCqIUYwv3/CtR8YxLK33qv/0JtAwfhM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(136003)(346002)(230173577357003)(230273577357003)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799009)(46966006)(40470700004)(36840700001)(336012)(40480700001)(40460700003)(8676002)(36756003)(86362001)(8936002)(4326008)(356005)(47076005)(82740400003)(44832011)(81166007)(36860700001)(83380400001)(966005)(2616005)(478600001)(54906003)(6916009)(5660300002)(6666004)(70206006)(1076003)(316002)(41300700001)(26005)(2906002)(70586007)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 23:53:56.0478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c601a318-4e04-47ca-b523-08dbd9a37a7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7319

Select HAS_VPCI_GUEST_SUPPORT in Kconfig for enabling vPCI support for
domUs.

Add checks to fail guest creation if the configuration is invalid.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
As the tag implies, this patch is not intended to be merged (yet).

Note that CONFIG_HAS_VPCI_GUEST_SUPPORT is not currently used in the upstream
code base. It will be used by the vPCI series [1]. This patch is intended to be
merged as part of the vPCI series. I'll coordinate with Volodymyr to include
this in the vPCI series or resend afterwards. Meanwhile, I'll include it here
until the Kconfig and xen_arch_domainconfig prerequisites have been committed.

v3->v4:
* refuse to create domain if configuration is invalid
* split toolstack change into separate patch

v2->v3:
* set pci flags in toolstack

v1->v2:
* new patch

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html
---
 xen/arch/arm/Kconfig          |  1 +
 xen/arch/arm/vpci.c           |  8 ++++++++
 xen/drivers/passthrough/pci.c | 10 ++++++++++
 3 files changed, 19 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5ff68e5d5979..3845b238a33f 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -195,6 +195,7 @@ config PCI_PASSTHROUGH
 	depends on ARM_64
 	select HAS_PCI
 	select HAS_VPCI
+	select HAS_VPCI_GUEST_SUPPORT
 	default n
 	help
 	  This option enables PCI device passthrough
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3bc4bb55082a..61e0edcedea9 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -2,6 +2,7 @@
 /*
  * xen/arch/arm/vpci.c
  */
+#include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/vpci.h>
 
@@ -90,8 +91,15 @@ int domain_vpci_init(struct domain *d)
             return ret;
     }
     else
+    {
+        if ( !IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )
+        {
+            gdprintk(XENLOG_ERR, "vPCI requested but guest support not enabled\n");
+            return -EINVAL;
+        }
         register_mmio_handler(d, &vpci_mmio_handler,
                               GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
+    }
 
     return 0;
 }
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 04d00c7c37df..bbdc926eda2c 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1618,6 +1618,16 @@ int iommu_do_pci_domctl(
         bus = PCI_BUS(machine_sbdf);
         devfn = PCI_DEVFN(machine_sbdf);
 
+        if ( IS_ENABLED(CONFIG_ARM) &&
+             !is_hardware_domain(d) &&
+             !is_system_domain(d) &&
+             (!IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) || !has_vpci(d)) )
+        {
+            printk(XENLOG_G_WARNING "Cannot assign %pp to %pd: vPCI support not enabled\n",
+                   &PCI_SBDF(seg, bus, devfn), d);
+            break;
+        }
+
         pcidevs_lock();
         ret = device_assigned(seg, bus, devfn);
         if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
-- 
2.42.0


