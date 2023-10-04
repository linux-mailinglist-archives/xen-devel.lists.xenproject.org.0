Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C86547B8350
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 17:14:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612682.952727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3a2-0003bq-2l; Wed, 04 Oct 2023 15:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612682.952727; Wed, 04 Oct 2023 15:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3a1-0003ZH-VI; Wed, 04 Oct 2023 15:14:29 +0000
Received: by outflank-mailman (input) for mailman id 612682;
 Wed, 04 Oct 2023 15:14:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSqs=FS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qo3Kk-0003AF-HR
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 14:58:42 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e89::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 812b241e-62c6-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 16:58:40 +0200 (CEST)
Received: from MN2PR13CA0009.namprd13.prod.outlook.com (2603:10b6:208:160::22)
 by BL3PR12MB6425.namprd12.prod.outlook.com (2603:10b6:208:3b4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Wed, 4 Oct
 2023 14:58:37 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:160:cafe::34) by MN2PR13CA0009.outlook.office365.com
 (2603:10b6:208:160::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.25 via Frontend
 Transport; Wed, 4 Oct 2023 14:58:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 4 Oct 2023 14:58:37 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 09:58:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 07:58:36 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 4 Oct 2023 09:58:35 -0500
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
X-Inumbo-ID: 812b241e-62c6-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBTETkYOEh5TZwLSRJDrb3o4dzDYrGzMWdGO3Fbr7lVZPnOmUnCoSwC4xe4VGX23G2M7BwF+b11P0ebRNhF66uDiY8nS77KDwOwp42Lu11B6V9ni3JJOQ3SomoC7f84JcFJMEBU2yy4+NTEazfRP1RuilBcI3gPex9kV91o+GfT+elzgJZFDAx2FyBeL9vfFHbzF84TfTPuP/LQ5vk/czUn7i6wB9VanIJhc0uw5Kc/CGDVrxAui2UmtGfLqcDu1Tn6FUeZjDgO/tIK6/5RiiCuYA7vXtOTSLit58E5lVZ2crDzkF1cmWdIOhlLSmrJoAGbmK7aPNNirG08g+tRb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcZzxWC5M7L073e5FMa5m8xIIcBPGO6L/R79lySugSQ=;
 b=hUn7lEa6CYra7mimxTgVsbyJ91UdWM5Cu956p+G1GnwNkeRh3SiRbXXOfL6oAsrOSsSUF776MJWM1CMTrYy0tfNEKwXpVhhOV4TWTRGboLZ84IdgaCzLaGPAbzx0wC7zwas9Yvj9cX7kQxe62cGegEqoFQmCP4pGCV1AMhuFExiy2fBxRY7evjZLJaeKLl3hfnMDia4DDuIxLVQQYnhxq5EeGPBmVTr3fBgI3P2md4G/KWPDofHz3svnLWS2kavuYUDX8DsbqqcPwkH8EIN4+DhM8Zl21e130fne3DYqcaM2O5t3rYYxdB0TAXKIym8WtKMT8UdhsFoLd/3DjDFW6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcZzxWC5M7L073e5FMa5m8xIIcBPGO6L/R79lySugSQ=;
 b=w7Gzp4VZ15b7fBjmY+/JPCtSCadZVNQTEuSWbWBB84wzqT4WSpIg0JHx0xiyg5nZ8tlybqN7KtMS3C4d+/P42bUATA0J553ti8dBnewVu3YlonhYXD7NEJK6sFi0lHUYi+6yzXK0h6fqLYwMNBxgrKYmAHRX/5cFm0C3j/B2M4k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 9/9] xen/arm: Map ITS doorbell register to IOMMU page tables.
Date: Wed, 4 Oct 2023 10:55:53 -0400
Message-ID: <20231004145604.1085358-10-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|BL3PR12MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: 5400baaf-1102-4ba0-35ae-08dbc4ea636e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kOENid+jlVvIBC1GawRGYcoU0Jwb71e738VorDuATdJG7oevOKMbtqicKJhkhhOK6SnGY2LXCmRZPVpNJamCVwdl+7EbsIL0pntjp5s1+XPZfenyNd/ZV1yJo57UyYYEn0cAKv0mRGQZ3MxY0FX4t8/UcedDG3MSQVz1QUFFHYkqiU2u9BGrgyY+He8Y28h0XWC3PjWm7FXDL9i5A0HPuXUuvYx6IDkjh1nhD7GvXPwshSSJIthFBwCeUZan8cydWtcJMCarOVkHhlxn07Lbfpx/XHFvrce06AmTLXz5E/q0TpTA/R9nmXlhgieI2BEpfFTh5YyGnQdK3UI9NXEBKIHc7WMS13u2552SxGNCDgflXd9Yzqjd7GnTkwuRRHUrU2eIz7kf6Uw8M04Ietrf5iVMCK+FhDLSkwuW71V7XgXwsY6PXEnFeOvvSvYq/IGZvHNbW1ukPrcqPj2UWLs5nezk1XLAK++oHE0Jv1DnhYYvlkYbN4hBi1M6gCTWPFwyxVnPUJ8i20QqUend/QzpD0Y8kqLYmgMCOL/Hu+UrEozVLDzn7DR4be8kF77hkX8F5VGDkSm4ZltGUWJJtVf1zZQBsvoTPeBU+hUMbG0msgZx9YTRDJXeCELR/d37GUsFQwUYcCSTYQTsr2V+uceLcRHxGpDdRLT47xjQTKU1ZC7VW6maujNEsDtiwa6uoXZthuGpDYcnVSDymJLRJwuGgmbtfnaHPzcOBQUVQ598d6hOKI5nzec6baggCzQ79n8yINuEOAeHtCsF9d6fhOxw2g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(82310400011)(64100799003)(40470700004)(36840700001)(46966006)(4744005)(36756003)(41300700001)(70586007)(5660300002)(70206006)(316002)(2906002)(44832011)(40480700001)(4326008)(6916009)(54906003)(8676002)(8936002)(40460700003)(86362001)(82740400003)(356005)(2616005)(1076003)(26005)(6666004)(83380400001)(81166007)(336012)(426003)(36860700001)(47076005)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:58:37.2303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5400baaf-1102-4ba0-35ae-08dbc4ea636e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6425

From: Rahul Singh <rahul.singh@arm.com>

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
v4->v5:
* new patch
---
 xen/arch/arm/vgic-v3-its.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 05429030b539..df8f045198a3 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -682,6 +682,18 @@ static int its_handle_mapd(struct virt_its *its, uint64_t *cmdptr)
                                          BIT(size, UL), valid);
         if ( ret && valid )
             return ret;
+
+        if ( is_iommu_enabled(its->d) ) {
+            ret = map_mmio_regions(its->d, gaddr_to_gfn(its->doorbell_address),
+                           PFN_UP(ITS_DOORBELL_OFFSET),
+                           maddr_to_mfn(its->doorbell_address));
+            if ( ret < 0 )
+            {
+                printk(XENLOG_ERR "GICv3: Map ITS translation register d%d failed.\n",
+                        its->d->domain_id);
+                return ret;
+            }
+        }
     }
 
     spin_lock(&its->its_lock);
-- 
2.42.0


