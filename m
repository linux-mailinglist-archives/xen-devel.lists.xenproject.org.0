Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA63874A8A2
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 03:49:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560148.875820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHabV-0003E1-6l; Fri, 07 Jul 2023 01:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560148.875820; Fri, 07 Jul 2023 01:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHabV-0003CI-46; Fri, 07 Jul 2023 01:49:49 +0000
Received: by outflank-mailman (input) for mailman id 560148;
 Fri, 07 Jul 2023 01:49:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=40UB=CZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qHabU-0003C2-9k
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 01:49:48 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bb89ff7-1c68-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 03:49:45 +0200 (CEST)
Received: from DM6PR08CA0045.namprd08.prod.outlook.com (2603:10b6:5:1e0::19)
 by PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 01:49:42 +0000
Received: from DM6NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::e2) by DM6PR08CA0045.outlook.office365.com
 (2603:10b6:5:1e0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Fri, 7 Jul 2023 01:49:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT082.mail.protection.outlook.com (10.13.173.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Fri, 7 Jul 2023 01:49:41 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Jul
 2023 20:49:41 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Jul
 2023 18:49:36 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 6 Jul 2023 20:49:35 -0500
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
X-Inumbo-ID: 8bb89ff7-1c68-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0o+3lXWQeqZudrKIF62XdbSLShHKLVTmY2T+HZ5DItGyIPq6tniV5ISp1ThQrde3Bwkpfbbj/XhXUd2O6rK3ujP+lEAm0yV6gPN3wh2LtokMUMOwtvq7I6Un1R4F9SWqQbJg9LW4Wc/3nhOOtSE5Sw4lp7PgLQ7xkifa5x80DDTnslp8VXZX3/qoySsBoE+ktVRP/TNCgf0NDMoFE5iCSZWgRcHhJOfZVhXYPb9okuwgB/n54DkYOuV9dCyp+xUvp1fqdGp7u1Pl+Nk2WcBKf47wp2EqGT5s0UHwl4rtjNk6diX5zsYVvnLCszJrJfcRVKl0foaS6+ycM1/hS1gFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPCXqi/U65BB6VinNnJwgiyIk9hy9wUXqeK8zlTJAwY=;
 b=ax7iQYtkA+iEPNvKlrx+8RTlGPxMM4YF2RM8uz0FK238SmtAM1UorcJZVqBamTc4w26mP5Mg/vbl4mC4Whp+X+sH2f61vbF3xFrp+nVnLb5IO6+m1dftRVZRLssroWZaGkyEQQpQcDhs5Di7TWB2mmVixDP7eccxMFn2IkMQVnuFZobi+PS8cPBNNe1zpl339sDgC1cSGfWUN472WTFAnE//WysBESzCHmNC19D6IWvQakfzplJS6zNJ9X5K3FnqBXew3b35ztRkATQgvhaUQEfejkdzzPgG4ca9U5WGMbYNVVU+NpZ2i1xNzO7lWHSqXnVltghu2nSCnuLVE0qVFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPCXqi/U65BB6VinNnJwgiyIk9hy9wUXqeK8zlTJAwY=;
 b=UsKuO10iXzNIGr31hH0Q7/o5L542UE4hGK50yN2sNewqHIHzD5JarJAQNjoZO9APUDBu4DTcYDAL41kT81BNSbDk8rA1QTn6WA6GiPntnE4eUsJdyjuol8DiP/zA6SUP7K9n4KlxW6WDBvVZBPvXX3ZmDmUb5iPJFo94zlEkBmk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>
Subject: [PATCH v2 3/3] [FUTURE] xen/arm: enable vPCI for domUs
Date: Thu, 6 Jul 2023 21:47:50 -0400
Message-ID: <20230707014754.51333-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707014754.51333-1-stewart.hildebrand@amd.com>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT082:EE_|PH7PR12MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a0c01cc-2de7-442e-2f3d-08db7e8c6e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fa3m/Y+/11O8fiTmtpMmA6moCdDqlq8uf7vfPz+lWLACpLr/ODwmXlX2kDTapRTTrPIJ8EO6Hn76IUWQym+g8nQ6juy0Awk+L96gGPGmwr7SMGmNf18nB9Wz2l/z6npc+Sf2HwGWt29q3OD3ZcdjTh9pjUXDFwTTI8dQjKaHklxRo2Td8J1Kda9/35qRGVIbtRcT2i2ljXCL5qQsVDPMR/5d5H2iB14eIc/O4BNDJ4jSC089hqlDzTjgU7cv0C9CkdKIc9L24W9Ixcjep+acvpOLmr1Nx6M7INMFNyCMsCJXKUf/9FADgjntyHhiBm6ERj46nOCIFtzk3HnjGmwKKzvNHHCyHh74sPwMfha0TCRoKaUp6MGzAbDIqkFe9V+qNEdrZ46vA1z2giDWZbioOgIOPyFVzDPtujZVqBosDQTDh14MkgUVhGq6/2DNZRcUEFxtAhV9xGuYs4ZZSVtiNmsavb84Mqzq4Dhj+cbItQTqH/6Vy7Irnt/vOQ6Puuo0H1KneyVvWwpLz6TxBgg94cJh1q5XfUwt12noi7kINswDZdD9DaCUa3diYGll7z1AjfeL3Jjfqlg3uJSz3Hnqnyus6wmv+h/xd4xDXBJfcfDZkFOospelipOBCqUgd7jQdFwdG1qKMxa3rFE3aHDvCrK4Lk/0KfTtmTzdU0tkzZF735V4STczqitUKjb3TKVBVH3qwNOE9rIH2+kIj6f0uYzmaEFDoXKM4HOGsN9WL/ueigHeZSqJqF1MLlTJG3kqgE6dSVk/Z7KOwjk52iipBw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(5660300002)(2616005)(8676002)(40480700001)(86362001)(36860700001)(82740400003)(426003)(47076005)(83380400001)(40460700003)(8936002)(81166007)(54906003)(41300700001)(36756003)(316002)(6916009)(4326008)(70586007)(336012)(186003)(1076003)(6666004)(966005)(26005)(356005)(478600001)(2906002)(82310400005)(70206006)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 01:49:41.6953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0c01cc-2de7-442e-2f3d-08db7e8c6e84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6858

Remove is_hardware_domain check in has_vpci, and select HAS_VPCI_GUEST_SUPPORT
in Kconfig.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00863.html

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
As the tag implies, this patch is not intended to be merged (yet).

Note that CONFIG_HAS_VPCI_GUEST_SUPPORT is not currently used in the upstream
code base. It will be used by the vPCI series [1]. This patch is intended to be
merged as part of the vPCI series.

v1->v2:
* new patch
---
 xen/arch/arm/Kconfig              | 1 +
 xen/arch/arm/include/asm/domain.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 4e0cc421ad48..75dfa2f5a82d 100644
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
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 1a13965a26b8..6e016b00bae1 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -298,7 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
 
 #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
 
-#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })
+#define has_vpci(d)    ({ (void)(d); IS_ENABLED(CONFIG_HAS_VPCI); })
 
 struct arch_vcpu_io {
     struct instr_details dabt_instr; /* when the instruction is decoded */
-- 
2.41.0


