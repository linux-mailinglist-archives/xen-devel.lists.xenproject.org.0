Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D280B07F7F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045785.1416073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aI-0001ch-L7; Wed, 16 Jul 2025 21:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045785.1416073; Wed, 16 Jul 2025 21:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aI-0001Tw-61; Wed, 16 Jul 2025 21:22:38 +0000
Received: by outflank-mailman (input) for mailman id 1045785;
 Wed, 16 Jul 2025 21:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9aD-0007F7-Tq
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:33 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20618.outbound.protection.outlook.com
 [2a01:111:f403:2405::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa4b727b-628a-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 23:22:30 +0200 (CEST)
Received: from DM6PR07CA0101.namprd07.prod.outlook.com (2603:10b6:5:337::34)
 by IA0PR12MB9047.namprd12.prod.outlook.com (2603:10b6:208:402::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 21:22:25 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:5:337:cafe::b3) by DM6PR07CA0101.outlook.office365.com
 (2603:10b6:5:337::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 21:22:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:19 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:18 -0500
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
X-Inumbo-ID: fa4b727b-628a-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=is3S6P/bC8kRH0yAFaEmbqu9z09yckOIRo4e0MQfkuQHPgF6a5KMtSm4U/1mGjAkzczSaX+TqmrQiGENqSdGxTnGlcl+auJC/TDVZXCXR1MhbDbJ1/BBjiqbm6wmqVqHfKK8yvdLXMWNbS+tvKMVMsq8Uy6FGHcwW+jqJXVwSCzd9x1USYQ/LoHXmZOnzSJEzY7MJHPr9+ikGyuv2IAh/hQsgIFOMPWfmP0JO7ZaIuDaTKP4iHZtkHMdcSmzRMXn2tjsY9e3upKQ0e/tVAZBzZghBuCDgqfqtJAavuwCQ9rrN1+Q+pTufzBaJ6FxV4xhM3WVKZnCtbKQm2nawc/46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXtpVXAytLx8JwHV5FurFJ6G8JTrFaKMclbVblfR9J4=;
 b=Zu/Es54DIwW+yxyuo1ZNQRE2rFh/OjYpWngK/DRjrd8x09YA7mganBNLq8S6oeu8L51dE7Y/DdwKBeKOipNSSxbf8wfhdx+W41UCx91B/5YhfyajI8nLF3lDdLFk0ODHxr4hZTsf4z4MNDjv30Mm4V9EHbWbqV2l40oulI45eFzV4g0P4IGxvdj2BlbkS5dBQL40KY1JkAheRPKqOR+6p5f2mrSVWExtP5d/yVcAD4TPTdCsFoWQsLNHDCKsfdPDCl9oQLSfig/G+BJlTgSI87RumJxAftOD3SuG2ZBqnWM1M1emxu4tedqTQjUjffE/cNi9vNC/6/9tXGUr4LQb4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXtpVXAytLx8JwHV5FurFJ6G8JTrFaKMclbVblfR9J4=;
 b=F/qy9YyiB7HcSaDyIxoGGrN+aQC7FWLN5NU5qM99+cJYqDu/od3rV9yZzOFatp7FyJK8CZUXP4wPVfC1uEzzS/XIwPYkCqFSs/ePJJUzxhST6nPx2I0ocS5JYjeAOU92guAGmo/DRs+Dn8NNWWODVx3jvmb3IMmZ4hImXBvk4dk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 11/17] xen: Add capabilities to get_domain_state
Date: Wed, 16 Jul 2025 17:14:58 -0400
Message-ID: <20250716211504.291104-12-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716211504.291104-1-jason.andryuk@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|IA0PR12MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f33946-0cab-4f1e-ed74-08ddc4aedba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xVDddR4KLzFR7je5+RmSi4D8N5Ne1zywZV9bs6VMFz8aLL/7g2CzU0dE6pu4?=
 =?us-ascii?Q?QSy/7GSj8jEl2Q3ozUoz4fr2qEGBSDdrNxxwd6urh2ti6Lv1VUinEHgTYhCI?=
 =?us-ascii?Q?mr7+qjTdU+lYEr58lYr1HyDA2kd3ANC/hd+3mgCSO9AAw46rYHTLWGU1CK2l?=
 =?us-ascii?Q?YJs9vvXQtuupmcMalwAK5gy4fvOKRw/9P/+lKBp4M9Y7uV7loTeKa3e5I5G1?=
 =?us-ascii?Q?MMfo8cWjBW0hc+4W3O6YsBC3sqh/urlGaAElarZJWCVjDmP1cSQM3bw2+ViM?=
 =?us-ascii?Q?L5oakJ93FBaFfBKuY77guMdsEYjY6a3I/se56MAmQfCdOJCbL8IexrDco9Yg?=
 =?us-ascii?Q?WbUqy4djU/5jOhp8hSOVniSaH4F0xelI3WRkyolRln43ijl2VoZgcTBgoMeZ?=
 =?us-ascii?Q?3ru9gkJkMSpY0QB9tFyN+lAtltg2RJQ8WCFkkPOBLzVUrNHmjry06McSnBp1?=
 =?us-ascii?Q?gnJH0ohMVIQjftL6z7BeZ49Er/cg2Zn4KHr06VC28wVzWkOCve1R0Yg8mWFK?=
 =?us-ascii?Q?PdrsjFxJAl1qLkmxKH4rxQ+Dj4h5RlNahs2ILb0XFg0uj6dHwG5qy6cyOAEw?=
 =?us-ascii?Q?olLQQb1fYxOTIfdMeC84RJScYVWMBi0QfncXdgiNT7uJLYsw4saFy3sf0z91?=
 =?us-ascii?Q?o6caKj8sAUVQr0qOcKyyyA5O1SEbGeo+2g1ZoMgfqvMgB0ZNsghK/s0aA+nT?=
 =?us-ascii?Q?z/BGzroxgLd+MCwItMPgG2BmcGCObyK/a5BH2+Ea5wksE3L7VbvXUxDLg/vI?=
 =?us-ascii?Q?QvhtXTkvkgtltPmFZJeQbNgUWnvpytufbue+/M5YWwfT4LQf+0pOfNcs1L/T?=
 =?us-ascii?Q?cQavq0BYLyIHsD2hzamcKlgoSQ5ZfHO18YYiilYviodXYzp2vpL0qKlA2aTC?=
 =?us-ascii?Q?1Gz5pt9zEZeyHTlhbs5XHFly8pTqVu97OHiehQAmu4z9WzpEHOXmEBVxPMXo?=
 =?us-ascii?Q?MIVhMsqVjiZZ6xGBaTJscVR1DcmJBy2Er74iOipOZHZ/74T+ztn///Tjnbtf?=
 =?us-ascii?Q?dQ312bU4UetdEDUMd+8qzYAjVWqahzz20qJwfO0TgByTq1ZvZhIiX08W7X87?=
 =?us-ascii?Q?ZaXcpJbXOOEFGhfX3llR9+mEq2ozhHgCZ/l0eUPWBQFYVaidOAcKqlueSCGI?=
 =?us-ascii?Q?mx7CrdKlRy9qPYxZlvDMkIcooNk3pRSzdEgOq/nOl8EZutSsAPSXqQXLpZlc?=
 =?us-ascii?Q?5w3BQq8ZBWuCqpHWD2y8mgUCfH5TqDwYFnYg/+Xrm9HB1rkZKLEaP3mRcR9/?=
 =?us-ascii?Q?mwHM726xbdCX+5wvt0JBA2/RWqqjbCeI5WU5BHG9snT/865AtJsEtDFhQHBG?=
 =?us-ascii?Q?2U81GosGLYHzYaJbSNzv27YUVTzkyB8REwGbPOmzznRhfa16d19dtH3qi6XL?=
 =?us-ascii?Q?FFb22kKm0DjasR1LewQ9BD3klF5r690sVHmozbUq6tzLAc6Fh3wk0pIMxkuR?=
 =?us-ascii?Q?5suJmliqjHsQF4Fc2yrBdTpy8+grjmi3nTk+vvA220e11k6PD+GaoxFlES7s?=
 =?us-ascii?Q?pVPWY0eiPcXOpy1G08VmnduU4M9hiLodD995?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:24.3982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f33946-0cab-4f1e-ed74-08ddc4aedba4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9047

Expose a domain's capabilities - control, hardware or xenstore - through
stable get domain state hypercall.

The xenstore domain can use this information to assign appropriate
permissions on connections.

Repurpose the 16bit pad field for this purpose.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/common/domain.c         | 8 +++++++-
 xen/include/public/domctl.h | 7 +++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index c347de4335..8b0151a8f7 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -195,6 +195,12 @@ static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
         info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;
     if ( d->is_dying == DOMDYING_dead )
         info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DEAD;
+    if ( is_control_domain(d) )
+        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_CONTROL;
+    if ( is_hardware_domain(d) )
+        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_HARDWARE;
+    if ( is_xenstore_domain(d) )
+        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_XENSTORE;
     info->unique_id = d->unique_id;
 }
 
@@ -205,7 +211,7 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
     int rc = -ENOENT;
     struct domain *hdl;
 
-    if ( info->pad0 || info->pad1 )
+    if ( info->pad0 )
         return -EINVAL;
 
     if ( d )
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index f1f6f96bc2..879343b21d 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1269,8 +1269,11 @@ struct xen_domctl_get_domain_state {
 #define XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN  0x0002  /* Shutdown finished. */
 #define XEN_DOMCTL_GETDOMSTATE_STATE_DYING     0x0004  /* Domain dying. */
 #define XEN_DOMCTL_GETDOMSTATE_STATE_DEAD      0x0008  /* Domain dead. */
-    uint16_t pad0;           /* Must be 0 on input, returned as 0. */
-    uint32_t pad1;           /* Must be 0 on input, returned as 0. */
+    uint16_t caps;           /* Must be 0 on input, returned as 0. */
+#define XEN_DOMCTL_GETDOMSTATE_CAP_CONTROL     0x0001  /* Control domain. */
+#define XEN_DOMCTL_GETDOMSTATE_CAP_HARDWARE    0x0002  /* Hardware domain. */
+#define XEN_DOMCTL_GETDOMSTATE_CAP_XENSTORE    0x0004  /* Xenstore domain. */
+    uint32_t pad0;           /* Must be 0 on input, returned as 0. */
     uint64_t unique_id;      /* Unique domain identifier. */
 };
 
-- 
2.50.0


