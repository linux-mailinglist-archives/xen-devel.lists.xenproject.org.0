Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDCEA03B13
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 10:27:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866192.1277502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5sB-0006qB-Ob; Tue, 07 Jan 2025 09:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866192.1277502; Tue, 07 Jan 2025 09:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5sB-0006m9-HW; Tue, 07 Jan 2025 09:27:39 +0000
Received: by outflank-mailman (input) for mailman id 866192;
 Tue, 07 Jan 2025 09:27:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FVI7=T7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tV5s9-0006GX-Jt
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 09:27:37 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [2a01:111:f403:2415::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0bcff22-ccd9-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 10:27:36 +0100 (CET)
Received: from SN4PR0501CA0106.namprd05.prod.outlook.com
 (2603:10b6:803:42::23) by PH7PR12MB8179.namprd12.prod.outlook.com
 (2603:10b6:510:2b8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 09:27:27 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:803:42:cafe::32) by SN4PR0501CA0106.outlook.office365.com
 (2603:10b6:803:42::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Tue, 7
 Jan 2025 09:27:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 09:27:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 03:27:26 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 7 Jan 2025 03:27:25 -0600
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
X-Inumbo-ID: a0bcff22-ccd9-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhPP9zOtuulcME7pU598ReNk6V/w1ONqA/juioyQ0i0NbZ77iybXwdQQTzsmh5p90UzhqranKLimMk4NxlcRzuApud1TUxs+4ivleFyfB8qkbd2eTdJCzIfMGX2YrKcllpWoPUwPUcBGN+kIB1SXTGzf0TSKtZ+IxUWVDN2pYw5daRfcfUiX4Pp7yoFK7T15mlIefvzX2Q+0/ZTzNqTde4+24yVGZVl9tkkZa9RzPZ2GiYR1qd6YmRm+1Y+ISRCqH6CzoVGx2dPTA5wNQSxdq+lv7pz2ls+YFBUGX4Li6QgWtcunTDe+ccMbmJRfcCWABl8kLBNeiQxDB2zxNWb6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwC+19C6KmOdNMx45oACNtAI5Dl8Ex+euKVyAOWXXBE=;
 b=sznEm9KC/AfJFNgUtx6u5e86U6y8I+KJXLJMAQvC/7SbCClzG31Uf4Wh2lbUgXXxyrMYEK6GIPoH0o3Wxf6QwOzgXM2PeZNyjDVOQAfUIabDWRN6uMm59+CzylYyhLKlq+qE+3BDSIun9FmvDCFsu+P2XtjxGcWBS/7XMul66I2UMCXvjSETKvxfisKBhTcaMjaOVqvB+I2+lrt58SHZGY6yTxkPc/YJYOfy1YdyKFCb5z9X45gZnUzbXrriKkQIPA1xvR+eqitXTGth98LFvtr4SA1kGou8D9zmNSKH3x+dR3YlCVX/Td3F+Mao8EWYs4g8vzVnzs/HwhMX8jT9bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwC+19C6KmOdNMx45oACNtAI5Dl8Ex+euKVyAOWXXBE=;
 b=BKtqm6+YAAOnOIQvUdHNt7vX51v+Ocr4NJHFn/+KlgXzmGBSyePREpHoYhsJu7/Wd8CftkC+5OBkkalQhpxzf0IZFcCgbYAzYiNnjYufWkw36xO9dkyyzhx22jA1F2H0QdmMz+H7yVgOy3YxhO9I5ccwLaaw6BZFhIeTLW3P/fU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Anthony PERARD <anthony.perard@vates.tech>,
	<oleksii.kurochko@gmail.com>
Subject: [for-4.20][PATCH 3/3] xen/flask: Wire up XEN_DOMCTL_set_llc_colors
Date: Tue, 7 Jan 2025 10:27:19 +0100
Message-ID: <20250107092719.26401-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107092719.26401-1-michal.orzel@amd.com>
References: <20250107092719.26401-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|PH7PR12MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: 507a51dd-1cd7-42f2-8d51-08dd2efd8094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yjKdFq81wP7xRgUL9b8lR42mmuO6gpHrrxwUB2GISz+YLGC6pQNQlUMwgflp?=
 =?us-ascii?Q?4UXf5QqFb1jC2wFCI2ntXQN7CUqQfLCXI+P4MXxQmfkS3/Q3In2nzJIdvewq?=
 =?us-ascii?Q?XUNwrd1ycuGj49erWzxMIvqxZdSexilnd2DbW9F3ETDQ+ojdXcNelmAx+3k8?=
 =?us-ascii?Q?xmBv/XvKNPqipz8dLoIGDC2ofWXO5Cn62ORYAUsnYZgwTsE0QQJxXWBxJ4F4?=
 =?us-ascii?Q?uMLcSSvbr2xGu3y3wLRrFOZwt5dPc5+GRv+uBR5NIGsPPIvJnlG5LCir97Hz?=
 =?us-ascii?Q?5JWTKzDrqnTi/GxtJgF3H8Jm3wkGgLAnOo3jrAQEf1Uqax5gVWCm8SQr4+W6?=
 =?us-ascii?Q?YnRhVPbQwXWwXJhZEoo16QIN7WRHXgfu8BjTajkoSEQkqfZ/umankoxQbk35?=
 =?us-ascii?Q?bR3iZfZIgUzrRIaI8MW9ysEbOwvpsYalJua5gm91rjMowvFv3kS0u2idOvdy?=
 =?us-ascii?Q?52sPmnixh3c7o2FgDbbqrwW3i+o1STCZmgkEb0ezx0pK9jeKSpkIDDSse7VH?=
 =?us-ascii?Q?VdqcTNSwYmKJAmYJCGk7M9tEdq7jllYwlgWS1B8nhaEW3k7jGOJOmg8CydVj?=
 =?us-ascii?Q?ZWzTHh1hiQv+ZsgF04V7zUz45sYCTzLOcd20hGwjSRaEzB0Ev5uILqvdgnRL?=
 =?us-ascii?Q?M+BZwQ6OQ9Q4QE4hqmkNlkjMM5U0Nw+k9v6LjhwFn7zBG8jS07WQoeZzky5u?=
 =?us-ascii?Q?DQrdDd4XKNKSTZLxrhjVLgsJX7yOlfhdINZs6BW/RBzXnRtnsGh7ajMS5pNU?=
 =?us-ascii?Q?ijtPsUQCsGo1Ak8NfDTQDzZl9qMZrg10Dy0Kz6ffTn07cTcDDL7YRw+9dBFY?=
 =?us-ascii?Q?za8qNnHonQXFukBuip2qdMxmZV9duxku49tZiY0FwkTqEZkrfTmJJ4RKnWx5?=
 =?us-ascii?Q?92E0oPW/ANl86sUsM8Vj/BL7asQJBARI2cVNkk+bLCCLg0JQ23r98nPfq4Ig?=
 =?us-ascii?Q?vpfFT1ouIQs2wIrODoxb0cJBEXFvIcwDiPnwGq7hUdBb0cvvqRa4EdErr3Dh?=
 =?us-ascii?Q?3HtwkFYHFdVn5mB1g/6bPd40IJg/QqwFIO7h/G0PsnUvc9J1yevZJ2m+lyiK?=
 =?us-ascii?Q?kW7An3PeTGv84rnoPMTM8uCMfCF0RiFqd4lYaZz3Dt1owoDmDrbqnkCqo6nl?=
 =?us-ascii?Q?Afpif41bpXRyRqTHQRso6PM8JnVGn76TUJQ2jgNfutHltISwIq+0Nd9MOB84?=
 =?us-ascii?Q?Ji86MfYdiCH+mOLEoXJltkC8P+k61VGn4CmSJCaxt0T+zKZRXkk+acybGDv9?=
 =?us-ascii?Q?Ml1IOl69anYhTiRSQII5TwlAaZg9Jfz59YNz7hNOksQQEvvlw37quvcQbpuU?=
 =?us-ascii?Q?mL3RYxGoQ3zCTobind4wzi6x1H91hzOXrCkimrlin3l2fnZGL7Kbtuw4a6L1?=
 =?us-ascii?Q?6zS8+fmqMqf6xDQh1CqUsF7cYKJ2eK1Lczs+yKt1bkTb8+nsftrFk2dQWqWD?=
 =?us-ascii?Q?xaALUSXNLmozE/MiC/uCC2Zf8f7fF206AnyOW/+zskdFOFlsRVUdpchHRvts?=
 =?us-ascii?Q?dmyBPRf9H6sJzvQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 09:27:27.4519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 507a51dd-1cd7-42f2-8d51-08dd2efd8094
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8179

Addition of FLASK permission for this hypercall was overlooked in the
original patch. Fix it. Setting LLC colors is only possible during domain
creation.

Fixes: 6985aa5e0c3c ("xen: extend domctl interface for cache coloring")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 tools/flask/policy/modules/xen.if   | 2 +-
 xen/xsm/flask/hooks.c               | 3 +++
 xen/xsm/flask/policy/access_vectors | 2 ++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index def60da88301..f7cf7c43c80b 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -54,7 +54,7 @@ define(`create_domain_common', `
 	allow $1 $2:domain2 { set_cpu_policy settsc setscheduler setclaim
 			set_vnumainfo get_vnumainfo cacheflush
 			psr_cmt_op psr_alloc soft_reset
-			resource_map get_cpu_policy vuart_op };
+			resource_map get_cpu_policy vuart_op set_llc_colors };
 	allow $1 $2:security check_context;
 	allow $1 $2:shadow enable;
 	allow $1 $2:mmu { map_read map_write adjust memorymap physmap pinpage mmuext_op updatemp };
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index e263e745d441..14d84df9cad6 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -847,6 +847,9 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     case XEN_DOMCTL_dt_overlay:
         return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__DT_OVERLAY);
 
+    case XEN_DOMCTL_set_llc_colors:
+        return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__SET_LLC_COLORS);
+
     default:
         return avc_unknown_permission("domctl", cmd);
     }
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index 78fe37583b18..320d77706dee 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -255,6 +255,8 @@ class domain2
     vuart_op
 # XEN_DOMCTL_dt_overlay
     dt_overlay
+# XEN_DOMCTL_set_llc_colors
+    set_llc_colors
 }
 
 # Similar to class domain, but primarily contains domctls related to HVM domains
-- 
2.25.1


