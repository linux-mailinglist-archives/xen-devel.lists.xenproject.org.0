Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C913A6FFA06
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 21:21:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533563.830353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBqg-0007vU-AL; Thu, 11 May 2023 19:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533563.830353; Thu, 11 May 2023 19:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBqg-0007si-7V; Thu, 11 May 2023 19:21:10 +0000
Received: by outflank-mailman (input) for mailman id 533563;
 Thu, 11 May 2023 19:21:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWxp=BA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pxBqf-0007sN-33
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 19:21:09 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e88::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa77328d-f030-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 21:21:08 +0200 (CEST)
Received: from DS7PR03CA0128.namprd03.prod.outlook.com (2603:10b6:5:3b4::13)
 by SJ2PR12MB8884.namprd12.prod.outlook.com (2603:10b6:a03:547::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 19:21:01 +0000
Received: from DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::e) by DS7PR03CA0128.outlook.office365.com
 (2603:10b6:5:3b4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22 via Frontend
 Transport; Thu, 11 May 2023 19:21:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT109.mail.protection.outlook.com (10.13.173.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.22 via Frontend Transport; Thu, 11 May 2023 19:21:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 14:21:00 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 11 May 2023 14:20:58 -0500
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
X-Inumbo-ID: fa77328d-f030-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQAw7w0st9xKb6p8aeneQt9eobiV7QsJIVBkAMup4rxrPMIehdZSrz4jKmTkHHuMw7nRfACVKXjwC7BAz4Gd3MbiI/phHO+K7tw0tbWE9h9WP7mPxpzKzmnVT0ZeTLkg8Dk1gEiqwaWw8rfv1ccgdqMZn2LcX0F/3ZM/fzZrLna5ZfbeWuiCsglANvkBTXeIdWSJCM6mEFL9eB189hwxY21+MjQZEWjqo0/C7WhKjHUGWIZzkf9C3lpqn82IIKZrpf6paQzSbPUiEgnTjC5t7HR1NYrdsjNSRXKiwkJgIQK2LMhpwAePKG1oQcc2vTMl2fBgP//mEiGgM7e7h6KFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjAtPrq7Zr2LNV7JB6qbwRaGGVcDQHrRJHlX0JDBPbY=;
 b=mcP4s4F3g55OB3UvRSMRgfTjj1CuPGatFt3t5L5B2hSsR9cFyPoQmHp54Ngma4t3MzY1Vxt3pw9xHyhce0AVjsSNioEurVg2QoyD424VeMyRvPyb//wvaLnDWACn32HaT3/udMeFYhBYvIUgid/d470IOmFMpW9ZuN7yf2k1AGJAedL0OSa0bs6pcI1EjnPeImFHgBrchpA/XU7rK4itP3i4Y9S0A94WmPWTYr4tEqRVZuwaPMa9ia4TGp7O9Ykrwu6b7rTJIw++KJA8fLsUEjgV8x+ZGL5dKjve2WqEnSrzWlBLHH9BVHcM8PgKRjKy8KGr5shCRnkPg9zOJKb8uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjAtPrq7Zr2LNV7JB6qbwRaGGVcDQHrRJHlX0JDBPbY=;
 b=Wgq07Ka0qPjcMhcQXk04uu/i+6q+C+xpj/lQgAQh77IOJ/iWVtAzwLGj9krMS4DfTW0wJQOzThxFO8XB+zb7iRnLfFxpD7Mm2pQep6ovJYAASzZ3wKzB8rppR3DA2JNL4IHXv9nmvFJZ/55a7x967feqW2jvOY1EJD2EquVTwhU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v2 6/8] pci/arm: don't do iommu call for phantom functions
Date: Thu, 11 May 2023 15:16:52 -0400
Message-ID: <20230511191654.400720-7-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511191654.400720-1-stewart.hildebrand@amd.com>
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT109:EE_|SJ2PR12MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: ff383d8c-2656-4bb3-7375-08db5254db40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XEYm88fTWcuzOiKkobw4GSBwO2PuLjnE7oNBdzPsN8fxEnbpAsswhruMw+xQjn1YpIRlLY5M7uhq5WUzm+cgKip2CEyCST/uQsvrBF+9N8JohRFagw2rj1mRTh3hFGBlWqGS7vg9PcC3WW4Dwq5AhomUyPEMQ71H6mtbNY6OEzr4X4kfFaT1wJmgSyeKNi0LuQpK1qCQglKkJTMIdutP0689SxKMQ9WcxT69/mSVB2AV5a0j0m6Sn2b9awDi1drJxLXpjOq0Kc/ROePQhx7HOL8DAUTHIZU/FNV0xucHUBmilVfhY4SnDwxLEldmBaJqjk6b22Zfyv0KfvI5N68CagtkmnkASY0buvnszvpO/+6L1PzYvQROK+NiY0jRRAEq4FJPSC6WqLA1DnyV612j2KjyFB/D8a6DcYHYm855pPZL1qLzlXMKjB4hLZGgbMSLNHLAdZgPLhWVsIKGjqvi/HaRZEQDj6iKgaOU8W36ZazL7ij865i6DF1onY22OczlCFWNdXppIMcOYeRysUO8YvHAL/Zb0Htzc4D+xCd8bOgcp6hxtSzV1d0520B4zggRDD6pB16hmTxxa0wLh0yZ5bnnnhhT4h5HQtbEgpTzMpYiroanK8GR123Rew1d1hGlf57IkCmh0DcfY6EQ7XdfJwx3IRipCw7wNFgbAqq20Wyevz6H78RfIwSyJJsXa6KGLOfe65ntek4RRhrwj8CKIOm4oCV3w9vvg8X0wUez9JCMjpNquEhrKYprtGrhaJ7QDnQDdL8Cn8R9paMFkOdoAA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(186003)(26005)(1076003)(356005)(81166007)(2906002)(41300700001)(4326008)(316002)(6916009)(82740400003)(47076005)(83380400001)(36860700001)(36756003)(86362001)(8676002)(2616005)(44832011)(336012)(426003)(8936002)(5660300002)(40480700001)(54906003)(478600001)(82310400005)(6666004)(40460700003)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 19:21:01.1440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff383d8c-2656-4bb3-7375-08db5254db40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8884

It's not necessary to add/remove/assign/deassign pci phantom functions
for the ARM SMMU drivers. All associated AXI stream IDs are added during
the iommu call for the base PCI device/function.

However, the ARM SMMU drivers can cope with the extra/unnecessary calls just
fine, so this patch is RFC as it's not strictly required.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
I'm aware the indentation is wrong. I just wanted to keep the diffstat small
while this particular patch is RFC.

v1->v2:
* new patch
---
 xen/drivers/passthrough/pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 6dbaae682773..3823edf096eb 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -871,6 +871,7 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     else
         target = hardware_domain;
 
+    if ( !IS_ENABLED(CONFIG_HAS_DEVICE_TREE) )
     while ( pdev->phantom_stride )
     {
         devfn += pdev->phantom_stride;
@@ -1335,7 +1336,7 @@ static int iommu_add_device(struct pci_dev *pdev)
         return 0;
 
     rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
-    if ( rc || !pdev->phantom_stride )
+    if ( rc || !pdev->phantom_stride || IS_ENABLED(CONFIG_HAS_DEVICE_TREE) )
         return rc;
 
     for ( ; ; )
@@ -1379,6 +1380,7 @@ static int iommu_remove_device(struct pci_dev *pdev)
     if ( !is_iommu_enabled(pdev->domain) )
         return 0;
 
+    if ( !IS_ENABLED(CONFIG_HAS_DEVICE_TREE) )
     for ( devfn = pdev->devfn ; pdev->phantom_stride; )
     {
         int rc;
@@ -1464,6 +1466,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
                           pci_to_dev(pdev), flag)) )
         goto done;
 
+    if ( !IS_ENABLED(CONFIG_HAS_DEVICE_TREE) )
     for ( ; pdev->phantom_stride; rc = 0 )
     {
         devfn += pdev->phantom_stride;
-- 
2.40.1


