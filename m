Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1751C607AD0
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 17:35:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427787.677213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu3K-0006c2-6A; Fri, 21 Oct 2022 15:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427787.677213; Fri, 21 Oct 2022 15:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu3K-0006VY-1q; Fri, 21 Oct 2022 15:35:18 +0000
Received: by outflank-mailman (input) for mailman id 427787;
 Fri, 21 Oct 2022 15:35:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJ2K=2W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1olu0s-0000nK-KO
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 15:32:46 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b7cbddc-5155-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 17:32:45 +0200 (CEST)
Received: from BN9PR03CA0133.namprd03.prod.outlook.com (2603:10b6:408:fe::18)
 by BY5PR12MB4934.namprd12.prod.outlook.com (2603:10b6:a03:1db::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 15:32:41 +0000
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::26) by BN9PR03CA0133.outlook.office365.com
 (2603:10b6:408:fe::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 15:32:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT019.mail.protection.outlook.com (10.13.176.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 15:32:38 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:32:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 08:32:38 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 21 Oct 2022 10:32:37 -0500
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
X-Inumbo-ID: 9b7cbddc-5155-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRxhGPFbxYDRO9zMl/lx+SHV4PWR848MqNciroSK5XAX6916Je4ksQVOcQP0oMqoH2mZ7QKo6lyUY8B3bCv+gV8LQRCJV00Il1s/zlH1jPuokASA7FH68fP/51T3tEI3qF42/URSe5s4vVg2CIdSmJIJ+LhHxDSMkDAJQ/NM+nbD5+OIy11XrM+zI2CoGoDNfNuK+yTR9kvA85SYqyEEzx5h+t8leO9+SqlOEQUIkO+/Hz20vDk+ww/45sqApa/73HlCSFfKeTZGof30KzEHbApCvkYQIkUmLbYRnWMfvYgoHP55H/hQb6VA7I3mE2PvtHlkZ/Mmfr+FSta8ZxlJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaPWf9DnJA/XGQug9i0zfhmL9v2rXPG9m6XEPCJ3yPc=;
 b=a7nbptSvZlhIMjiGWh2f1p2yR9lp83s/nO17HLYwrN+W8Mgy1M6gvrQIDj3XsYOrFGykD5eW3HiUL0AS5ZVFlkqPuZC2O/DE74uolm+M7uwHZoEr148RzjUYfuFgOi8OiAuvfPplEQj80RB2DZ9TWxCq24iR0X4hPVaZfV8se/2AZmmq5rhGZ/buQ4rW5y68nTwroVW0+F3r2Z15dYMRtMLXZyObFEIRDSY9LUVYQbe1jgEv6wMcJK50uWeGl8cpNnk0+maKlyUyouAleywaDQJ3x3WntHo+YIoJvOvObOe1k2u5OF6X06Lpug5jRQ4PaopQca4PwUnj72wWgi+LsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaPWf9DnJA/XGQug9i0zfhmL9v2rXPG9m6XEPCJ3yPc=;
 b=GPEVX+OhZAS3Dd4dNkt9pND2oXYMgO6EYNzKmHRX5930F4hN/6OzoF8xKw9zq6eS8OVL0EsLNjs5VCx3LyOra8cPdUqJlvmhAYH5UAFYfAE+o9e8l+MJkW+00cRZriMJHNFDBkag4HtHFN/2+kFC1AEzwKHZPJyW/eflnLbSh2s=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: [RFC PATCH v1 12/12] Arm: GICv3: Enable GICv3 for AArch32
Date: Fri, 21 Oct 2022 16:31:28 +0100
Message-ID: <20221021153128.44226-13-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021153128.44226-1-ayankuma@amd.com>
References: <20221021153128.44226-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT019:EE_|BY5PR12MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: a17336cc-1fcf-465b-2cc7-08dab3797cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bIBS/nvJCZDQrv5kEfuB4dPzwawjRwZ6mX4nruadHaHCHWGJxT0dWFV3+1oiS4IP48GhJpq3D7RjFrVy8Tm24OPLoshfAcbhn7Dv3o3PCk6sCYYpW+BuovZO1kcjcQ4BH47pnXNjX8cETiCfoSk6khKrHJN1IOCsKZrr3WvCcJEsBei6QpOBBSmL2NbTqliYHljnlUHwJdm6c32V2/zX71I6Wh1JZ1AsZqBiB1GnJnIA1l55vQc4TMHalIZq1g81dC4KuwHvg0kGuwwDbZyvl5ABqRLXMfU6j+zXSiIjXiOya1NbnCw6HG3tj3nEPC73peLmwzlBGxsyY2uxJ6dXnNZ3qgsXV1n+XTAeoFlYQvZoOqRUzfi8fEUjcpenmibdsK10wnkYFajp+ETjvqOB0q4TvW+OdXQGJgU8B3iwjNnfnpEprkkukT8WrGQQAcshGejDaC3IqyT1ipoLvZ0d6Oqdfp4WsfzXNANU0FAev9r2C9fT6TXxPQvyaEetqZdpft1OQVJllBF2GTqKU9luiMR7laSVzbjfKvvg4wMAciSiknVoE2cvzNnsLyZyc6BC8Lx2eiDA/TLjMzAQYU13f3Ya0Gh9kDlFqcg/+FvYCPVlAyKOLIdviITxSfL6kno6Ei2FtGsTk2gl6WYtxOe2iQewo9k4CxqJL8OQ4bQuR0dymT+fekO8IFjPau2ZvT7YwXt3QyJtxcNLsz6EzhPj0UDteoy8sS97C59MdSfDj238hlSbAGdwux+3LZzVMArTGJYzviALOEawnKlt9Gh+HB73kcQ+SHOUI+08m5bexcM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(1076003)(426003)(186003)(47076005)(2616005)(6666004)(63350400001)(26005)(336012)(40460700003)(83380400001)(5660300002)(40480700001)(36860700001)(2906002)(82310400005)(316002)(41300700001)(54906003)(478600001)(8936002)(8676002)(6916009)(4326008)(70586007)(70206006)(63370400001)(36756003)(356005)(82740400003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:32:38.9885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a17336cc-1fcf-465b-2cc7-08dab3797cab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4934

Refer ARM DDI 0487G.b ID072021,
D13.2.86 -
ID_PFR1_EL1, AArch32 Processor Feature Register 1

GIC, bits[31:28] == 0b0001 for GIC3.0 on Aarch32

One can now enable GICv3 on AArch32 systems.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---
 xen/arch/arm/Kconfig                  | 2 +-
 xen/arch/arm/include/asm/cpufeature.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 1fe5faf847..5eaf21b8e0 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -41,7 +41,7 @@ config ARM_EFI
 
 config GICV3
 	bool "GICv3 driver"
-	depends on ARM_64 && !NEW_VGIC
+	depends on (ARM_64 || ARM_32) && !NEW_VGIC
 	default y
 	---help---
 
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index c86a2e7f29..c8ca09d1c3 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -31,6 +31,7 @@
 #define cpu_has_jazelle   (boot_cpu_feature32(jazelle) > 0)
 #define cpu_has_thumbee   (boot_cpu_feature32(thumbee) == 1)
 #define cpu_has_aarch32   (cpu_has_arm || cpu_has_thumb)
+#define cpu_has_gicv3     (boot_cpu_feature32(gic) >= 1)
 
 #ifdef CONFIG_ARM_32
 #define cpu_has_gentimer  (boot_cpu_feature32(gentimer) == 1)
-- 
2.17.1


