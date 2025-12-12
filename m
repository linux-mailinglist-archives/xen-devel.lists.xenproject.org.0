Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F5CCB99FC
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 20:10:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185742.1507755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8Wz-0006X9-9B; Fri, 12 Dec 2025 19:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185742.1507755; Fri, 12 Dec 2025 19:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8Wz-0006Ux-5A; Fri, 12 Dec 2025 19:10:21 +0000
Received: by outflank-mailman (input) for mailman id 1185742;
 Fri, 12 Dec 2025 19:10:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tg47=6S=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1vU8Wx-0006Gb-Li
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 19:10:19 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f3c2ba0-d78e-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 20:10:13 +0100 (CET)
Received: from BN9PR03CA0801.namprd03.prod.outlook.com (2603:10b6:408:13f::26)
 by SJ2PR12MB9116.namprd12.prod.outlook.com (2603:10b6:a03:557::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 19:10:07 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:13f:cafe::57) by BN9PR03CA0801.outlook.office365.com
 (2603:10b6:408:13f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.11 via Frontend Transport; Fri,
 12 Dec 2025 19:10:07 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Fri, 12 Dec 2025 19:10:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 12 Dec
 2025 13:10:07 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Dec
 2025 13:10:06 -0600
Received: from xsjvictlira01-ubuntu-0.mshome.net (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Dec 2025 11:10:06 -0800
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
X-Inumbo-ID: 2f3c2ba0-d78e-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzapfaXFRGmbGGMwqm67bzxY/yWUYVUh03KW3aAt/qYiW2v04G3IZFDUjg9x2zyGaFQd1pFH3YJOsk8KHp6d6sI7qnL2hEIT/AhSw0rA9pD9DHwrA98ZMX6eu6FFOA/ixSn4VImfv+/6m/kO0lOmCMA2PEecO4eFiJ2qEs5kit7L71PFHBGd3m+lSnctaOcWWYCZ05R5HllcnGSaTKdAgKy1X/Y1o9EpTACck1TqAVBGiHacL42ZIz+DG74GsGsi09csPCABWgxHB32JLilDr37QpD2Y17P9PmrjaVv21aza7gSwZrh8gIpH33unv6y5VR4bxk8IZKSa5rIqEbHiwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5tuI9cTDNV2ao972PUUR5cIDDmH4wbVtD/kZ/f3hR4=;
 b=rGkpBCAeAP3o8IBmSusxvWFlrIv68S8U0MlqE1jItbNvSnITKp2HWoPk8MzgkfSlEncnA+tEgyZmfDywPvCbp44WS/+jfFOdOyW7TwUISBKg/zxmbDFEE3GSgZtEyJeCFbfE/houtJ2mHeOn1AYN45Zykdp6xzcJwffLReiaFImVYhF3tiXgdBpkzjZxS3KE5sUG50q5vth5Lzaa3kiU9c2NguxrxlWHoo1eAfxM3AffQmyLI9OYaZnrGzhjcqUUtsxvWcGIZjni08arJQK/W5KB548rr5hCHApp0PbORy3ZWR+2l4OacKwtMssmqdCHRSwCY50SH8zgWrZE1fc5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5tuI9cTDNV2ao972PUUR5cIDDmH4wbVtD/kZ/f3hR4=;
 b=f+z1T0y6brIe4vpgLLZk/SwyXgwCGlA2b72kDoEwGFFQtIVYSYQUMoQ19WUySq/ozsuGeFMqJUEfCTjh0mHhPRxF1DPq3KLEC2AxfFcfzmWFJZ1ItY02byEsYph3Fsf7D0xuTVGEafb2Q8IisRm/hb9xPt3HWBkZ97HxSPs0CCc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Victor Lira <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH v1] automation: prevent eclair-ARM64-amd from running by mistake
Date: Fri, 12 Dec 2025 19:08:49 +0000
Message-ID: <20251212190850.1357779-1-victorm.lira@amd.com>
X-Mailer: git-send-email 2.51.GIT
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|SJ2PR12MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: b38e9510-0f75-4f2d-fa7e-08de39b21046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TDo30LIlwOWNHMhTgQPRO646Jsp8FxRwj4g80W99/cN3ipWTDek+fJy+FpHo?=
 =?us-ascii?Q?256YkPouGPvH4NAZLTHBNlqyBw3heHCkuTQz9Lt0zPS3HtrVEIZIzF2swEwO?=
 =?us-ascii?Q?CJKr+HZkual7+8E6D2ZETMA/yzXErWkIIKqTm5DZNoj6JDkG3PT5JRX5hRPE?=
 =?us-ascii?Q?4GxvkZco5RWwQaO/N6/dFFnKRUqtdZHCqkIwkZR2OHaKmx2xyEJ4WVOBroSH?=
 =?us-ascii?Q?mvIcIPEFQklEi50NM+o/owyPGW6r/n8oeNRz+3HW+Zc+8OS80lX70Ui7colI?=
 =?us-ascii?Q?HMjELaMxg3N4Ca0ZYHVOzOphWiWH3yslxxNlLxa/3bHrYWSSeoDAtF+O10Y+?=
 =?us-ascii?Q?Hj+EsgdniOZwp8c7Lq4ICTMSLgTYFAWnn0l86gFM1oLl2pX9Q30S5ZgQaqOr?=
 =?us-ascii?Q?lYNE7nD8IjlBCCpa4C5ybYMSdIvTS63cuSZaGd2jESM7IrQvAYh+jFx8vFU4?=
 =?us-ascii?Q?Wm3TcJiSpZBNr4Nkx88M7pWSY5oxOaC37LZ5MnRqVoLFbPu/CN95ihKiyzg0?=
 =?us-ascii?Q?nSVXve8ly+0LCnZKV8zntaIy6oTEjv86NjIBOGIbr2BM57njbDvJdsfvJpNa?=
 =?us-ascii?Q?omApmXcrwO2/qwueUVT0eXkIFX88z6hCznnGNVI1AdptJFZE/rF8US9ypmFm?=
 =?us-ascii?Q?/+9yU7U6PCax1OwfvrSDGuU7CllMggf2h5pI8RkUSUx/czcKaqO47KeHDwAW?=
 =?us-ascii?Q?YYtE8eXvBGI+2euOLX2wvRYjI3Jr/+kIX4XF5mqiYkaqR5W5J4pmO6VEObMZ?=
 =?us-ascii?Q?4bSADsIK0xp+7YMhGc+q6z1kR3LodhnSkikKz4W3LKH8U6BsWteuZ58uufrT?=
 =?us-ascii?Q?bYClKBFyjtieZh7Vr2M0QpimgTRBG4+a0t0Qd/5FYiunbsBobWqFMDcMoMc5?=
 =?us-ascii?Q?51IwlEqnaradZu8sIscHHL0+YAI1MBxZUe5yIZSjdbYoyoh8l03Ym4nXUFG8?=
 =?us-ascii?Q?GIEJlJUrS3jezhB6Lfenn+dsz+XWOaHKJYzFq1N+W1PwKqWIPHIm4Vqr8so6?=
 =?us-ascii?Q?LOy1lTBYdC72c5QsOiO2Y9RUXmZmZxsKm2t6f5lzMr0WqP8+7/ku5mZU2HLG?=
 =?us-ascii?Q?SQ9HLtIES03yg6CNE2hPhNpHn9NgPCYKD4DDlXTpZQcl7ihZwNW9cA7OeC7w?=
 =?us-ascii?Q?9qBKvCU8PUIkbijya63cOiY1toqhDNPtlzAxKk2qTgN+SAd6XD05igsPfkCK?=
 =?us-ascii?Q?Pt9BsfFs/mVnmAIj9S3bHpcwhzSKiindpWGYvxLfYkJtkGtDyEc5dhSdwj2w?=
 =?us-ascii?Q?Po2Lu/Kov2S5uOJlfnyoRIGg35epe3AFqQlIo1Lvu+p1pJvvz1dBI0qYhSZT?=
 =?us-ascii?Q?DUK5UBTJLRYjJORkAOQJ3vPcN/LM1Dbxy8p3mDWYB+1pcp/fvSVytqAV/6yv?=
 =?us-ascii?Q?R44l8XhMKmEO0h9pEyRC477JqW5z0bQth/kBJiLRFUNmOiVozRzxO0HBQ06W?=
 =?us-ascii?Q?/hOgv1W6I3/S4WutsI9ORJ2rnzWsaYfCVY/1WGg0Dd7diwfJVTZlyo1nhoPl?=
 =?us-ascii?Q?wl42ZZ8hIU2aemqPPC5dxMoiEAkdgGKto4ocuPQBm9gsjXs4/dwUCep3fj8J?=
 =?us-ascii?Q?ppOXCqWZBmCgG93OyeU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 19:10:07.2812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b38e9510-0f75-4f2d-fa7e-08de39b21046
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9116

It seems unintentional that this job references .eclair-analysis
instead of .eclair-analysis:triggered which does not apply the rules
from that template. One effect is that it runs always instead of
manually in my xen-project/people repo.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/gitlab-ci/analyze.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 286faffeb3..e9a8f9d544 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -165,7 +165,7 @@ eclair-ARM64-amd:
   rules:
     - if: $ECLAIR_SAFETY
       when: always
-    - !reference [.eclair-analysis, rules]
+    - !reference [.eclair-analysis:triggered, rules]

 .eclair-analysis:on-schedule:
   extends: .eclair-analysis
--
2.51.GIT

