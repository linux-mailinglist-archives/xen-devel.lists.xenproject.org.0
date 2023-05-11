Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566C76FF210
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 15:03:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533370.829980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px5wR-0004CO-VD; Thu, 11 May 2023 13:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533370.829980; Thu, 11 May 2023 13:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px5wR-00046X-Qz; Thu, 11 May 2023 13:02:43 +0000
Received: by outflank-mailman (input) for mailman id 533370;
 Thu, 11 May 2023 13:02:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/UO=BA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1px5wQ-00044h-Cn
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 13:02:42 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1af868ec-effc-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 15:02:39 +0200 (CEST)
Received: from MW4PR03CA0193.namprd03.prod.outlook.com (2603:10b6:303:b8::18)
 by DM4PR12MB5214.namprd12.prod.outlook.com (2603:10b6:5:395::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 13:02:30 +0000
Received: from CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::1b) by MW4PR03CA0193.outlook.office365.com
 (2603:10b6:303:b8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22 via Frontend
 Transport; Thu, 11 May 2023 13:02:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT090.mail.protection.outlook.com (10.13.175.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.22 via Frontend Transport; Thu, 11 May 2023 13:02:28 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 08:02:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 06:02:27 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 11 May 2023 08:02:25 -0500
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
X-Inumbo-ID: 1af868ec-effc-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IE3StwRwLf7uGbeD0OpAER5yj8HPvOhqilx4du5HCpKpb4PYOXh48VhTJPUEmDagZMuf6J8f3bckdoANVOa/AkgHNY/glqiGWUXwRU+VG29m8lGNZ0PwRGq+jjeEvz1+jThG0E1PSBQzITEvpzhBl5MtmB+wUxKigkVjKmQsV4orJAXkKgX6DM5pHfYPHqzD2iKBZtx3bSD1grdu+oZG6ipOKAVQbiO+Hd3YJvTKqFnnIj1f3LXp3ZiHSPJLwqEmsd2/Bm6+2giYnxaHwYZl3AqIpxOwkhpuh40DsHPPdidWJ46kUqU6aaWo/AfN+ZsX7l2Ix7uxp+gcucTtubYn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5it+s+Whb5mYuu1zowFBgJHBZo+jj7YCCm7iUuAZIM=;
 b=ZDMNMGoksvfWvBbzy6Pn3pyBMcOTDVKGyBO53i0BvCKxgr0xb58bT5eWw2PWcAv7BgY25VrkmtCAqBXeo47t5J5EgNou0iu34zoE+ws3qbAVUKF4RF5iOwn9lbe9mMzYdla99RxjX2dF8PHwop4a+R7EVaRKBXeduTkKE5CW0K8je7ixRhlDiWujfmQEJ7WmX2TxmOtB1Rdsu8/1PKOpzRm9NwzVe8bxJ2GFuupUr8XZBqo66rk/Tc/LGWrQPDKCWYLHOI4lI5TsugnjhgtmiqVlNxJ/LxMFiSGugZl99byjU1oroRUX+fz3QVb+S5GTZqPwlu2rNTV3vcw78twN7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5it+s+Whb5mYuu1zowFBgJHBZo+jj7YCCm7iUuAZIM=;
 b=1ea/uTyTX953Gtha9S+SmalDqGmbvpDiT9XVmDyREVWOPddoR9GU2MkUorrAcOAbbpurlZZMzFNONxzRkexQuixx63gltLsvL/Xu/YVrwVHMk0Cm19NTu5LLlj5C+FK8sHEXNuCBvI9t35DecrzMm9BLOzE/r4rt9rI5W3zkWRA=
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
Subject: [PATCH v2 1/2] xen/arm: domain_build: Propagate return code of map_irq_to_domain()
Date: Thu, 11 May 2023 15:02:17 +0200
Message-ID: <20230511130218.22606-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230511130218.22606-1-michal.orzel@amd.com>
References: <20230511130218.22606-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT090:EE_|DM4PR12MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc46db1-103b-4398-c552-08db521ff956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Odc0GW3fYHxlXubtCRRgDdgl/rX2iDo/QT3Wh33P2joVbRKsaVJqmNmONEx9VFT5tvm7lSVl4sLukACgPn/5fFs77q8VjjisuNReSmuokbZNoJri/X0ZBdeCUaMISqUBLdqdsFlCwuoSM7alSY1IAwD7ybb+eWmcgwXeGwqPjobNWXDqQW5oxR957inqwNSXOT+3VDh/80QDG7RbnOTRyHh/i+ZU7gCJHyKqRpoHGBvq1eqMbeta7FQgtPJsCIsNti+7OSHsTsVHBno9BYu4N0wrmIWOs08LlZ3lI0Ajzl7QDbwgUJ1PXp+tQvrCjESqYJvoW8YbFE0RJGoA9o3Xf2UIujbMKZYW+dVxNGV25n/av/FHzgC1evy1UZQ+24SlXO/pre5TEPSo4tZUIlppiJfjsbtF5CpehfJKkN9Y9ZPVXxsBu2V1XtmMzEpSQuBCxEbGOurTmPJWnhbXmYDzKSqJVw0Hb41rGH04zGnA6KChJhrbUT9jpxfkNHfk6CnM252H6NRZTk3cdSK2/juouhOgTWts0x2d+EFsSMtM90uvmdTA75dDH3uRHr3WmYEIyA8Td3mE8/REwAHjeKmyhsyScYypCStLegPRAFSgDqTHpXfSB0+QcR1Qa9Juy1hWOE7mfi03Y5bCx70stHWeFrS4IK/43CF/3tzodb8Xk5iV3km4PFxaUtEHsCEMoP3lkwO0s2Y+u/gwAqvu8fltQYw59aUzn8FghNKPBdtylG/mDEELgcVxeym8RbLfJLPMp+8G5Ge0UUY/u94E25ugRg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199021)(40470700004)(46966006)(36840700001)(70586007)(70206006)(81166007)(316002)(82740400003)(4326008)(6916009)(40460700003)(356005)(54906003)(82310400005)(478600001)(6666004)(86362001)(36756003)(186003)(40480700001)(26005)(1076003)(4744005)(426003)(336012)(2906002)(36860700001)(8936002)(8676002)(5660300002)(47076005)(83380400001)(44832011)(2616005)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 13:02:28.2171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc46db1-103b-4398-c552-08db521ff956
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5214

From map_dt_irq_to_domain() we are assigning a return code of
map_irq_to_domain() to a variable without checking it for an error.
Fix it by propagating the return code directly since this is the last
call.

Fixes: 467e5cbb2ffc ("xen: arm: consolidate mmio and irq mapping to dom0")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - split the patch so that a fix alone can be backported
---
 xen/arch/arm/domain_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f80fdd1af206..9dee1bb8f21c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2320,7 +2320,7 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
 
     res = map_irq_to_domain(d, irq, !mr_data->skip_mapping, dt_node_name(dev));
 
-    return 0;
+    return res;
 }
 
 int __init map_range_to_domain(const struct dt_device_node *dev,
-- 
2.25.1


