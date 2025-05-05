Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DB9AA8B39
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 05:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975789.1363128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBm4S-0004mv-MJ; Mon, 05 May 2025 03:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975789.1363128; Mon, 05 May 2025 03:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBm4S-0004lF-JT; Mon, 05 May 2025 03:00:44 +0000
Received: by outflank-mailman (input) for mailman id 975789;
 Mon, 05 May 2025 03:00:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LKXI=XV=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uBm1R-0000ZH-Cm
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 02:57:37 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2409::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b25f6222-295c-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 04:57:35 +0200 (CEST)
Received: from MW4PR04CA0330.namprd04.prod.outlook.com (2603:10b6:303:82::35)
 by PH7PR12MB6835.namprd12.prod.outlook.com (2603:10b6:510:1b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Mon, 5 May
 2025 02:57:28 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::11) by MW4PR04CA0330.outlook.office365.com
 (2603:10b6:303:82::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Mon,
 5 May 2025 02:57:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 02:57:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 4 May
 2025 21:57:27 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 4 May 2025 21:57:26 -0500
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
X-Inumbo-ID: b25f6222-295c-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJKJ3l2udGrbZe1eahSinKvUmmDC23VwffH2yLE7QK6X/mbVbfIfuRMWAvPJaI9OcxLf2DrxjdyaraRhw/+Cn72Zrr+NNySGHbJOXd28h+KORXUcj/5CNXLxsqs3jAjLkDdeUcwxbCjs1jSntXc9c2ObCN0vz+tYWqBZi7l6XOFAtNNG/YDEYmD1VYyCY+SHUXnYarE0xqZqAysstLsUl/Y7C/JuyIJs11ovnFWOLe8ZZvjOTw3YSRyYPHMZ64qt76Tk1SmI/r4wBPfeNsFW4cV5Gg2vbUHXqg+Pqs/7GmLNHbOMBPwVeSZg2+IVV2rISzWJ1rP6bT7F+idOj0ByFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vYNosH374LDHd8Qsbgs/FAQVGbH1a3F/WMoojDLEC8=;
 b=y04NkEporkXEWcPyrl8M5XKg4Z54rnIfrs1aV0EfGBUh1T9MvEgHCa9zG5jS3+mEs6sOKmxrxy1p3QKmWDe68+NaA2MAVuCN4T++MzeVRZVBD+dm8fNiy3C1sZ7XTHhO9koyziOYfw4qPPpI5OhAmBS0740YxaVZqwyDGmAG7AhkUnqOQcmeYE+IEVfpKu78/7R60jIiWovGLUQQxdNIGVDc61Wba1ktRTp4JV7bpN5/9HIVba323TzM9a5Dj5Lg1Lf6EqeIST1p9Lwc/IJa7rH3lWRHGKKB3yTItX/uTD7fFQ9OzfkU7Rr9NF45QxrSZAx3bShSyQODofIqLVDrLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vYNosH374LDHd8Qsbgs/FAQVGbH1a3F/WMoojDLEC8=;
 b=MdrM8Dpv6lFYFWKjTpzX2Lik8g+VRHslLl81VHysWb0IYT69nNmH1oKJMzqg+XvwYQCICjauaq2BjsCQ1tMNmaVssOar1eCRpFwN5CmSP1wmZeamY3EsU3rrG6Ee61IEHP77JNm23WP3aS5Uye7r2/9rsgrShGlpwvebgiqqKTU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/6] rangeset: introduce rangeset_subtract
Date: Sun, 4 May 2025 22:56:27 -0400
Message-ID: <20250505025631.207529-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505025631.207529-1-stewart.hildebrand@amd.com>
References: <20250505025631.207529-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|PH7PR12MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: c38d09a6-0714-4a27-5d2e-08dd8b80926d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UZb1mmPA4CUZ1fcJdmgSxmy8YP0/vRlFTORt6xmO/UQNs0XkDnlmBUmYaptv?=
 =?us-ascii?Q?xAb04U9Vh95zZMSg7s/hEFSlcZilRfaQRH3RxQGGNEYtb8Zr31NWM0jCfh6N?=
 =?us-ascii?Q?0boEyTh2GRXilHcahfvl7DJd3ITWvHg203CQQOXkHlPH7vVyQSb0eXJeMBwm?=
 =?us-ascii?Q?WehfDY7ltLFhusvFLF3Q0MES3bQetK0VydYpgfm+jp68Js4PB0vroqT8zEPb?=
 =?us-ascii?Q?aSgpe8/hl//d0QkTxWUWyesB4rj784SYMg6gpYK2S78YUAEUh0dEYaxdUpXF?=
 =?us-ascii?Q?Z6GYCRUo8JsXgR/Mu6poE1tlJORPc8KeMCQWfeSPyzPZLnyxLzrLpIEGlpEj?=
 =?us-ascii?Q?UxLqEwKmcJKj+X27Ok+QEYbx8c+TIsWZJssyzcQSUip4cGK4OAWe3p/8k9L8?=
 =?us-ascii?Q?DMH6ytUsVzMGY+qK/6+pONOB837L811nZ95j/Jq6rYN2R+1cvJuHznAvD6Qu?=
 =?us-ascii?Q?gyg4kUxCkTkKmTM0vAS7Yn8LILbqn2HU54Ibt54P28iZi+Ue28nRJmPHXSzM?=
 =?us-ascii?Q?thPIyMgLix5z+HuDeDZAff2rrV7h7fct18/h8Ec96UPpJSpQK7ODmoRrEeVy?=
 =?us-ascii?Q?S9rujGURU8gWglLjhixyAYxaJFcNrHhINxL6UeUYejdlA3q6m/8bs1nwbDuk?=
 =?us-ascii?Q?SGquz2D5CFRnYDyorVpQR+ksl3nWtUC0GOoNKHvI8O5vVtMQDRVhbYq1dZi4?=
 =?us-ascii?Q?5p8LSq61sCteUx3LPUEh/JqqSuupFB9RbHCrXTd+ZVjRElLH5dUFP5CQ1nrj?=
 =?us-ascii?Q?2kyQjauQmREWPYiI+Mwrx6MVCMphTA1jvhUIfoodjBEUetNZjuee7lxJXrP7?=
 =?us-ascii?Q?gGLVvPds0xqT2GxuCuwLWqMILM41Dym9BkKyO+/C1q9hxniihULbwa5o7YNy?=
 =?us-ascii?Q?e2HPkAPb1S/N+AvBfcr0cE701NcuDHROxzY3/i87UI3vdiZq2+HKe9V6kpHO?=
 =?us-ascii?Q?ogfjHZI+gSvSducWJHkNIGpmel2M1CfBOnOkK4rF8IT0xLWlLlIbpOr0frof?=
 =?us-ascii?Q?zWJ2KV6O2tl6JxzjLtRgU1AsRTv+S0LvkKUZWoLcPo0EN8iA3M1AfPvck5Vl?=
 =?us-ascii?Q?ccchfylqJCP9d6gyKBNwP4nR4KyAbHzkkE/kJInY1sb88h1roW6fdCNzocuR?=
 =?us-ascii?Q?4Jn40dTxPPnFbyfSlrdWHNIijTOl9F77IxWagIkDFcRPeyGeyVs5HrBChGOg?=
 =?us-ascii?Q?+GpEG8LF4TSSks+pqu0Ni0Xje5I/aNUe8qjnUDDzsTRMOpQbH1bHJw/Jdr2F?=
 =?us-ascii?Q?U6EJxgcTb0USq+eYYnCYuqv/YsbWK9zEpNjzjIsj6tkfF1lES50XKFv8JpBc?=
 =?us-ascii?Q?5YFnRkKeRxucOrzvoBQj2KWxn/yemZ9Vb0eTNMhABs4JGEscJ61Sr3adNZdk?=
 =?us-ascii?Q?XogDAYjtYkVNr0igYKH5833hAK+nHhFKCGMnjcvon5HaZJAeTcjnAVul15Eh?=
 =?us-ascii?Q?Dx2/GMX9Fmc6dFl1upzygc1+tcNQTuCiIElWcoUf225iLfNbpv8KSDSPQvw2?=
 =?us-ascii?Q?f1q6+7Q09gDn3hhyoW2s+hYprA3eQI9CJR3b?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 02:57:28.3791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c38d09a6-0714-4a27-5d2e-08dd8b80926d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6835

Introduce rangeset_subtract() to remove regions in r2 from r1.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/common/rangeset.c      | 12 ++++++++++++
 xen/include/xen/rangeset.h |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index e75871039087..b9e8912fb1c3 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -397,6 +397,18 @@ int rangeset_merge(struct rangeset *r1, struct rangeset *r2)
     return rangeset_report_ranges(r2, 0, ~0UL, merge, r1);
 }
 
+static int cf_check subtract(unsigned long s, unsigned long e, void *data)
+{
+    struct rangeset *r = data;
+
+    return rangeset_remove_range(r, s, e);
+}
+
+int rangeset_subtract(struct rangeset *r1, struct rangeset *r2)
+{
+    return rangeset_report_ranges(r2, 0, ~0UL, subtract, r1);
+}
+
 int rangeset_add_singleton(
     struct rangeset *r, unsigned long s)
 {
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 96c918082501..817505badf6f 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -85,6 +85,9 @@ int rangeset_consume_ranges(struct rangeset *r,
 /* Merge rangeset r2 into rangeset r1. */
 int __must_check rangeset_merge(struct rangeset *r1, struct rangeset *r2);
 
+/* Subtract rangeset r2 from rangeset r1. */
+int __must_check rangeset_subtract(struct rangeset *r1, struct rangeset *r2);
+
 /* Add/remove/query a single number. */
 int __must_check rangeset_add_singleton(
     struct rangeset *r, unsigned long s);
-- 
2.49.0


