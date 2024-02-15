Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A54856620
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 15:40:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681837.1060809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1racuF-0004hb-Kz; Thu, 15 Feb 2024 14:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681837.1060809; Thu, 15 Feb 2024 14:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1racuF-0004g0-I7; Thu, 15 Feb 2024 14:40:07 +0000
Received: by outflank-mailman (input) for mailman id 681837;
 Thu, 15 Feb 2024 14:40:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DeW9=JY=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1racuE-0004au-G7
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 14:40:06 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ae3f8d3-cc10-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 15:40:05 +0100 (CET)
Received: from SN7P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::17)
 by CH2PR12MB4954.namprd12.prod.outlook.com (2603:10b6:610:63::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.13; Thu, 15 Feb
 2024 14:39:57 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:124:cafe::77) by SN7P222CA0007.outlook.office365.com
 (2603:10b6:806:124::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Thu, 15 Feb 2024 14:39:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 15 Feb 2024 14:39:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 15 Feb
 2024 08:39:56 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 15 Feb
 2024 08:39:55 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Thu, 15 Feb 2024 08:39:54 -0600
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
X-Inumbo-ID: 1ae3f8d3-cc10-11ee-8a4d-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjhH/jlyyn7lsM2hFEjAOIX6unOKhMynQ4B46QFz7KXkAfu6Im87S4RDAfDgVQLECefJ3PwN/DYw0q/4CdTIJAFGB62TXmk2cPEtZ4UjMY1kTJhT05wsSguy0kXXpN2o6ITx9qg+lc87ur6OhGgMbfNOYdW4l/t4AQ7toHn4KRPuG7xNdCoU62ne3BnxwxeZmClOh63aU5bYAHXHHhM9fd7yVX4Zjm5hWMT+xG9+pxmQZCtOb4ksZc2BpnCa+AdCRNaRVeQBWcXy97uzchUPIoIs5oToYjRToeTHFCgu3bzGsDQTTpXlhpcOldTgMYulBHD2Rvqi92pdeMkkCvtePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pl/4LzIa0JB2UM6kwdo2VC2cy7AYS5i7obHhz//bLcM=;
 b=Jh0uqMVEWT2XJBlg8wx9V9wS8MYk9ODjvxwIB4WYvsWdWhU1aJqXfJqLsEhjyjHU0OTY1KcLLk7IPTepu/ZeF+GAC0H8zSMBwfkphkl3Sk+ijHUMwtTcpmPV98cXlQxDJzWWRwbVUOJK9y7Ag1JTXYFgKxQB9TlBLFQCzIzXW4a7Oinc8/S1u4TRTTpzwZu9m4EDmPR3+g1/CkG7cL4sKGQgEgfgnVGPmMk/aGm2atmxFnsq7N4m8IEcSfcBdFqU/hqQYzWUXbPkyVCEyK0pw2WLjpduF9a0brHsrnEfsCcdB+j8Cx7TFG1Q85ETNrm5EvlpPUg2s03YQWF86Izq8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pl/4LzIa0JB2UM6kwdo2VC2cy7AYS5i7obHhz//bLcM=;
 b=eUCrg4TieD9GaxGA3DpGKYaqW9l5K9nU9n9UDVXbbwk5TInbPS/NaN1gR5tsWzpmk86HibynKexHawAhVAFnf80IV6LHMRVS2s7JKbBLyi0MU5hW4W7WkbN7yK9geKzaJeTq/uSGel6xUZj1nNRG9DHu7K/zEjKQUY2zDDmRJsw=
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
Subject: [PATCH] xen/arm: Make hwdom vUART optional feature
Date: Thu, 15 Feb 2024 15:39:47 +0100
Message-ID: <20240215143947.90073-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|CH2PR12MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: 461a0367-1a68-4871-5623-08dc2e33fac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P1mNhxAUVHQhaap/eN0S3ZyOWqBJrPoJsZ6cssaCaa3IiWKvd83FOEXWk5kNHSz/r4MFfImCyiurE+WNhvTeuL0LcYJoflNr2DxSIfkY3RnAcKWan5R57nHRl6m8ZYeMi2GNWqlnP8Dh2Tk74SZpC4prcRe/BcFnEuXrADEuJXWI1uUgmHTzB6GelCNpL+D9n1SM9igU89Um0X7CrTMZTTRCc5ghkjpaxYdmoSo8IAUgB0WoyokS/rJUF4RpaeJ6WCuSK/T0bk9GbLuEY4KmXix64Dqj+gjBojP5PluDi9flZcStpfeqnDThFLu6ayd6QVp0IzN5Nxo60MpkVsxFr5ykIooW5xEBS76o7r4gZV/LSbdl3G9sXABcMQQwn2ZY+aaHqMEf1cm3FtMJYXrSZaDvNgkJUphxMiEvj3Osou7xL3JN31TkBeS7oeMTgDjKiEALn6dq2up7M14/td9MaUcdPhpgB2jMZlE74SLtJpJ+4EzxVeH6oI+b3fJ/qD1CMq+r73S8yKhq9jIlbfscHl2gM+ImfCxMI9dNXpn2EsXKQr9hAC0q5awayQaBcobCbhu04rrJg2nqVayMCkHf791ocImCjOKfmDtVhJTK4cY6qk7C81r2SWcbwNDq6f1rrbtehOm0M002f9pO7nDf2EK8SPbBC9CYVsjvFskT6jE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(451199024)(1800799012)(82310400011)(64100799003)(186009)(36860700004)(46966006)(40470700004)(5660300002)(44832011)(316002)(54906003)(41300700001)(2906002)(426003)(83380400001)(26005)(1076003)(2616005)(336012)(81166007)(356005)(86362001)(82740400003)(36756003)(6666004)(6916009)(8936002)(70206006)(70586007)(4326008)(8676002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 14:39:56.4785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 461a0367-1a68-4871-5623-08dc2e33fac8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4954

At the moment, the hardware domain vUART is always compiled in. In the
spirit of fine granular configuration, make it optional so that the
feature can be disabled if not needed. This UART is not exposed (e.g.
via device tree) to a domain and is mostly used to support special use
cases like Linux early printk, prints from the decompressor code, etc.

Introduce Kconfig option CONFIG_HWDOM_VUART, enabled by default (to keep
the current behavior) and use it to protect the vUART related code.
Provide stubs for domain_vuart_{init,free}() in case the feature is
disabled. Take the opportunity to add a struct domain forward declaration
to vuart.h, so that the header is self contained.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/Kconfig              |  8 ++++++++
 xen/arch/arm/Makefile             |  2 +-
 xen/arch/arm/include/asm/domain.h |  2 ++
 xen/arch/arm/vuart.h              | 15 +++++++++++++++
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 50e9bfae1ac8..72af329564b7 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -150,6 +150,14 @@ config SBSA_VUART_CONSOLE
 	  Allows a guest to use SBSA Generic UART as a console. The
 	  SBSA Generic UART implements a subset of ARM PL011 UART.
 
+config HWDOM_VUART
+	bool "Emulated UART for hardware domain"
+	default y
+	help
+	  Allows a hardware domain to use a minimalistic UART (single transmit
+	  and status register) which takes information from dtuart. Note that this
+	  UART is not intended to be exposed (e.g. via device-tree) to a domain.
+
 config ARM_SSBD
 	bool "Speculative Store Bypass Disable" if EXPERT
 	depends on HAS_ALTERNATIVE
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 33c677672fe6..7b1350e2ef0a 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -71,7 +71,7 @@ obj-y += vtimer.o
 obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
 obj-y += vsmc.o
 obj-y += vpsci.o
-obj-y += vuart.o
+obj-$(CONFIG_HWDOM_VUART) += vuart.o
 
 extra-y += xen.lds
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 5fb8cd79c01a..8218afb8626a 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -91,6 +91,7 @@ struct arch_domain
 
     struct vgic_dist vgic;
 
+#ifdef CONFIG_HWDOM_VUART
     struct vuart {
 #define VUART_BUF_SIZE 128
         char                        *buf;
@@ -98,6 +99,7 @@ struct arch_domain
         const struct vuart_info     *info;
         spinlock_t                  lock;
     } vuart;
+#endif
 
     unsigned int evtchn_irq;
 #ifdef CONFIG_ACPI
diff --git a/xen/arch/arm/vuart.h b/xen/arch/arm/vuart.h
index bd23bd92f631..36658b4a8c7f 100644
--- a/xen/arch/arm/vuart.h
+++ b/xen/arch/arm/vuart.h
@@ -20,9 +20,24 @@
 #ifndef __ARCH_ARM_VUART_H__
 #define __ARCH_ARM_VUART_H__
 
+struct domain;
+
+#ifdef CONFIG_HWDOM_VUART
+
 int domain_vuart_init(struct domain *d);
 void domain_vuart_free(struct domain *d);
 
+#else
+
+static inline int domain_vuart_init(struct domain *d)
+{
+    return 0;
+}
+
+static inline void domain_vuart_free(struct domain *d) {};
+
+#endif /* CONFIG_HWDOM_VUART */
+
 #endif /* __ARCH_ARM_VUART_H__ */
 
 /*
-- 
2.25.1


