Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB079700A6D
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 16:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533845.830807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxTs9-0000A0-Pb; Fri, 12 May 2023 14:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533845.830807; Fri, 12 May 2023 14:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxTs9-0008Sl-Li; Fri, 12 May 2023 14:35:53 +0000
Received: by outflank-mailman (input) for mailman id 533845;
 Fri, 12 May 2023 14:35:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iM5+=BB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pxTs7-0008Qm-Ig
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 14:35:51 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4929d9d5-f0d2-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 16:35:49 +0200 (CEST)
Received: from MW4P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::28)
 by DS0PR12MB7945.namprd12.prod.outlook.com (2603:10b6:8:153::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22; Fri, 12 May
 2023 14:35:46 +0000
Received: from CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::5c) by MW4P222CA0023.outlook.office365.com
 (2603:10b6:303:114::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24 via Frontend
 Transport; Fri, 12 May 2023 14:35:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT085.mail.protection.outlook.com (10.13.174.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.25 via Frontend Transport; Fri, 12 May 2023 14:35:45 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 May
 2023 09:35:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 May
 2023 07:35:44 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 12 May 2023 09:35:42 -0500
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
X-Inumbo-ID: 4929d9d5-f0d2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcUfNV3Eu4n4M078M5k5Wi7ZiitlFG6x6XAU+yZ7CH+xOcYeQ4kNzOkCL0HZw1EP1vcLvx4ZH7yuvBNmvVu8ySqXp2/NHfAx0rexXLnwvzoSnnZAG9Qs7yHqgF2k2y1+LxBCqXvpxjfzyk8YyiBJ2GOuo8OEwR+W87O5iN5hpiCloDeQJdvBPZBQP9D0jBNB7HA4f2O/5kvrmJUoGAJ0n8cgc7Mxno4NGhcJsqCGwHyWjUV2MwJrroDWHdiyEVnLWCTb7WapYP+ACn8M5J47H3/CCUBNtgBC7/cfS5/Xmu2Cf98V9HoDaEEuEQS0Qkgg6xi5S1r9rK+IX8jWPA/MMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EOFf57ukdpYkZPaaSySVqh3AqlVA38LGW3V5B/W0s8=;
 b=LQ5UIiKWIIa58EokrfDNQ9Fkmgmvi24rhB5YhqgBV8ZSmjVkmMBZaJLlUGEOY3cP2XQMKetq+TMa1KiuNQ7ee67t1aUif62dcZrNMdvSXqCtY/kMTKNS3XNXVbpwZD7jJgXhQKeGHlaLxJNu3NRRNvmFg/YPoStAt5DATst6svh9ySY+XuP28ULUIC2KsuViI86xlRCgKEPmlNFZHAIWTXUjViBMjTMG1BygVwpaB2xB8bPHbh0k5SGOUWFM4laJBj3VpbOAVFX3GoSNMG1I65dZuMHn1J3d6c96v5nPNVc83xJm1NLeRhuxxFD1mKkZOkI46RNsveFtlFrk+daD0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EOFf57ukdpYkZPaaSySVqh3AqlVA38LGW3V5B/W0s8=;
 b=h5pVzONiBlb8V2QyBzTIUel81nDn+a5fEN+PLBpxE2wo8zMd/H/0lu1G9AGBXk6qdFD1KtDQe8KlT30EvpqTPvxqhh5oLRVlDViOWTkZt5jLvlBAruN+7x6gkggBwbTPlWcjfa/jaOkzUwVt85jNuJpfHt7jOCJwELCWZ/wVeS8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/arm: smmuv3: Constify arm_smmu_get_by_dev() parameter
Date: Fri, 12 May 2023 16:35:34 +0200
Message-ID: <20230512143535.29679-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512143535.29679-1-michal.orzel@amd.com>
References: <20230512143535.29679-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT085:EE_|DS0PR12MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db70770-7d3a-4302-02a7-08db52f62bea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x+XFmjcKupki8ViUA15LmCEOxre/e1uaatk2wjD+GZyo9L9EkZ/j3HQWkNK37KDdGrK5tp2B7zHDVozEhAjE34rXGPsLKzakY3CC9Z9WxMtdrY411j4lG0uYTVVj1V3gS8cSHeh3WDaqTHGPhnyQ3u/3IHJP2ym54K3UezfU0qQRRFTV2Gl+/ohIm0c0TK4hKMyTlwOGvqihSlXoA7Xjfg0Z+uZ7Zz/Z4rlI+LW3ADhj6eLTZosRjqBDh7XTEKwYOeOg118+z0aF5Ifpmml5zO5SdSdZ1YqJ2Wt2cMq5l7hKkSDknxvRQ917QftdOgVBZq3Bf6+5WrhupNHzj9Kez2dmNngnQao7YTa/ak+sEtg6jlt8VDrJpeTJOkOyjnBUwtUqHMLghPLpasQNSiS0nCj4Kterh5KU23Squ3WKJALqAoEHek5qQWZgEOTGA/64IlQyjbMxmKqMPy4LSYjftVawilH/f9yeSPe3YXwtXd0Ymi8ykj5FqVw2HBdGw12dRl3GRScUH0m/XG27O0Wf9yhBSJVRO6wFa87Q9/GoowZ3c3jI2bysFWfH1BiKNCn+wUCTkxXfiOX20KDFQRo4oQ9D5v+4dKe4njpcqArLeJYVK2osnkgjdmn4sB80XGU/PWpRG7zS4fY8MmviuGYYObGa4CLN7+UpT0877g2NOYS6YOfPvmCl5RsQJJIjsj/bAkFsK9cHY5vlUgyFCy/x8NwGj03r8tyMTgVhKAnYiI5F0HazLHBnEafhsPzbmKAyOZj2FR83mqkqh2hMBBrgow==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(54906003)(86362001)(82310400005)(82740400003)(478600001)(316002)(4326008)(6916009)(70206006)(70586007)(6666004)(356005)(5660300002)(41300700001)(81166007)(44832011)(40460700003)(26005)(8676002)(336012)(1076003)(8936002)(36756003)(186003)(426003)(83380400001)(47076005)(2906002)(2616005)(36860700001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 14:35:45.3683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db70770-7d3a-4302-02a7-08db52f62bea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7945

This function does not modify its parameter 'dev' and it is not supposed
to do it. Therefore, constify it.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index bfdb62b395ad..bf053cdb6d5c 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1468,7 +1468,7 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
 	return sid < limit;
 }
 /* Forward declaration */
-static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev);
+static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *dev);
 
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
@@ -2556,7 +2556,7 @@ static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t dfn,
 	return arm_smmu_iotlb_flush_all(d);
 }
 
-static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev)
+static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *dev)
 {
 	struct arm_smmu_device *smmu = NULL;
 
-- 
2.25.1


