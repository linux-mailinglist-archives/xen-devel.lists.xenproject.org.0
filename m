Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED278AFFC6
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711026.1110668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTQD-0004Of-Eb; Wed, 24 Apr 2024 03:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711026.1110668; Wed, 24 Apr 2024 03:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTQD-0004Lu-BS; Wed, 24 Apr 2024 03:35:49 +0000
Received: by outflank-mailman (input) for mailman id 711026;
 Wed, 24 Apr 2024 03:35:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTQC-0003iy-19
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:35:48 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bce454dc-01eb-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 05:35:47 +0200 (CEST)
Received: from MN2PR20CA0014.namprd20.prod.outlook.com (2603:10b6:208:e8::27)
 by MW4PR12MB6780.namprd12.prod.outlook.com (2603:10b6:303:20e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 03:35:44 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:e8:cafe::34) by MN2PR20CA0014.outlook.office365.com
 (2603:10b6:208:e8::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Wed, 24 Apr 2024 03:35:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:35:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:35:42 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:35:07 -0500
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
X-Inumbo-ID: bce454dc-01eb-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnJNKrP5ZUBD6jx8Qxxh4v8Hw6TdkyXdxAKHvCK1sKALL5L/wsfuuLR9wc/86LYc/imdJwtVqjcEqzu+GpkvevXfz7XkfyjPM+CaiO7X2Pirnycd00NypQ7qWHSO15bCENg2Rq/GsgXaveXqlVja5Y/YIIhFPgxAPbEguylTL03mQ0AoFd/NbRFKHfd5BpTb9c+JyuWYsmMNjtPXyCmAif5hlL5u9sTGnPIMfV8v6EIdIq+FMmH2CIspekwA5W4S/vvwj9GuWC1KDqlIaIXhmLm/EaG3k8SuXB9kLRC2wztJnQcmGsqWHidzALruMkOQs5hDyR90raKkidBuzsugdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0iAu2KLuWONYe8oojEyCYpFwDMZMJe4duy+fEUGegc=;
 b=ajOlT1d5RiqGy5SNcLlFmedWUXYoedWwb6m5K7ajTeJ3UA6zSA2yJR1MroDIqCKXGOx00Gryem5ekYnaHqU4/GGDZ2q1TbZR/BZNlMcvfNg2HZ07xROfAEANZok6O4b9ZHMDknLot75gFuCqMQBdWTACMLwgTwNwAGYzetV4sB60o4BB3eYRsHsed92x3YP1F9cYVrcWmf9Pg9EaqZRlr1l4DDv/F8lwmVEsMkNVrshe/D2O+dgzkgqoxgU5O1ebvmTwh6zxsgINN3tMhEAr6wPqCG5G/RSeVkWpEANNVSglC7TKBJTcg22dtFAjXVLerBtuTmxebyhUNTTjM4YMCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0iAu2KLuWONYe8oojEyCYpFwDMZMJe4duy+fEUGegc=;
 b=sPJE5A5QXx8bLUDbBLFG/J0Nj9QvE3wi1XbuZLd2JvUfdy6JKbarABBoSgdHonEUIp/a6IU5ZNkb9lctsqD/n6Ou4Rpkhy9uxxQsGGi1F+IF0oJo4G1IvBkMwgNcdm7ngnaOuUs0iwbKcs4NFtsQ68JpN0Ys2jJ9hwQb3HReyNM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Henry Wang
	<xin.wang2@amd.com>
Subject: [PATCH 04/15] tools/libs/light: Always enable IOMMU
Date: Wed, 24 Apr 2024 11:34:38 +0800
Message-ID: <20240424033449.168398-5-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|MW4PR12MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 15fca0d2-4893-443b-e846-08dc640f9eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f5BKQ8vMDfA2eVgbv3A6UtLPJmTiKI7B+OQ9n6LakatVv8nLopf/Zfzt4K9o?=
 =?us-ascii?Q?riV6dL72Mi4fL/zvfwmib0vjagqotIWExXm8YHVvda4p/GcRNSZ8+/SmTcdh?=
 =?us-ascii?Q?31E6SdcuoqoReJyzB8Ap6Af64r3vfO90EMa6T8DdkQlLt5il/WnShTDSjZLx?=
 =?us-ascii?Q?DtZD3i2IJWDZSc4h4RCNyIqGXK7VIKk0Xovdkyx5poH8D14L14LojalEQmzy?=
 =?us-ascii?Q?DG+neG2LwPZOW8qviyziwEihMJBNZbXiDYauLQZ5gKGU1YzB/Nt9e3WXAHPx?=
 =?us-ascii?Q?FoaSeAjVXkXp7Tzl8wOFalOu1mtgtIzyrruLeGKuVS1MqipQ2jn9arPo7KLK?=
 =?us-ascii?Q?esQC9LJPYmeRAJcn3oiy0eW32RsQS/uuqd78rGAcyLBii67MexS7O7T22Jfd?=
 =?us-ascii?Q?AJFF+93onNRUBOBHIg2OnqHiGkoIyuC8OmWR1czWXjmsmO1qFdKWI5ffhra8?=
 =?us-ascii?Q?ig913Jy0wVKd2NgeX+cHOnIvZad5Ahxx106G/VWsxITj3+3Ap7DJMYsP+IFg?=
 =?us-ascii?Q?0GnJda8b3XOiiCUxCj444MQJaS8QQEz+BjlYYXAgs5eu3q4SbQD1tPFPpA/c?=
 =?us-ascii?Q?3jjQzUBoKsDji05KTIiqMjqyRDA10jB5nXQlZOGq4ApUdM2nFPkGXqIIDt2I?=
 =?us-ascii?Q?diCVmtVhFvJeApCqkj+OhdcTAQDa97tzqKdQyH8wEmquTe2j/o3vBbCBUfW9?=
 =?us-ascii?Q?XB8XPXxCanu9e5bnk/zv2z60XcWRSA+/WvxUYzd6HZCVlaeI3kB1SH6uiawv?=
 =?us-ascii?Q?tXQdEYJOYcWbXiakMAKyr763IeoxZti3ZDRJifxa4pxuRMgQjKm+aQaZGILv?=
 =?us-ascii?Q?oHlyooA2rGwj2ZfS4ZR0C8UuUiA0z3spSoGNAgTdbq3o7UnCGmyl6Z+z5TwK?=
 =?us-ascii?Q?CO8VzJ/KbZrkkVS0yzQhLyh2hdn0QUJpJgFEkIbJqDuWCCHibIy8418iuzbq?=
 =?us-ascii?Q?cFajG41F9BnabEGbG7Ojkxx9EMafywYgybTWEV2Cwfw0cpM8LsAyPbO2Yqd/?=
 =?us-ascii?Q?Z/+mtZGFNHjZPkVnrm9ICb+ZXrqAAHE+2rc4IUOW7rcCwl8xv359FwGTOBom?=
 =?us-ascii?Q?nj/PghvVwqRHca8i5DiqumOPnPC+yMchggW3xSyU8jYVVW74JToWlevl8SbY?=
 =?us-ascii?Q?kkEfW9vq5m6jxE+77YzVP4WszuFDrcNfmClgzklZB6aX6DKzuLCDKJ1Ek1S8?=
 =?us-ascii?Q?GK/Ca6ach8HA+ft45iNBKNh8Tgy5ZBcEp8zy+Q+zQ546ejjbuGz2hUKJC/yJ?=
 =?us-ascii?Q?uDWX3WHp6yTVXmYj9YWEOEXdDKwZdGb+d3S+kXf478ONyOPYY1Nz6jaFr+rN?=
 =?us-ascii?Q?YwENT8mAmcO8zgQKovGMbpaUm3N4VcvwnDmMLO3Jz0whML+PPpe/RMsqBFWn?=
 =?us-ascii?Q?jLq2e8bZhVddCg4vEi5UUTjaYI8j?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:35:43.2912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15fca0d2-4893-443b-e846-08dc640f9eec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6780

From: Vikram Garhwal <fnu.vikram@xilinx.com>

For overlay with iommu functionality to work with running VMs, we need
to enable IOMMU when iomem presents for the domains.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 tools/libs/light/libxl_arm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 1cb89fa584..dd5c9f4917 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -222,6 +222,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
     }
 
+#ifdef LIBXL_HAVE_DT_OVERLAY
+    if (d_config->b_info.num_iomem) {
+        config->flags |= XEN_DOMCTL_CDF_iommu;
+    }
+#endif
+
     return 0;
 }
 
-- 
2.34.1


