Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2084A03B14
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 10:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866191.1277497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5sB-0006lh-Du; Tue, 07 Jan 2025 09:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866191.1277497; Tue, 07 Jan 2025 09:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5sB-0006kV-9L; Tue, 07 Jan 2025 09:27:39 +0000
Received: by outflank-mailman (input) for mailman id 866191;
 Tue, 07 Jan 2025 09:27:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FVI7=T7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tV5s9-0006GX-B0
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 09:27:37 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20621.outbound.protection.outlook.com
 [2a01:111:f403:200a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1268978-ccd9-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 10:27:35 +0100 (CET)
Received: from BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::8)
 by IA0PR12MB7577.namprd12.prod.outlook.com (2603:10b6:208:43e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 09:27:26 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::c) by BY1P220CA0012.outlook.office365.com
 (2603:10b6:a03:59d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Tue,
 7 Jan 2025 09:27:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 09:27:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 03:27:25 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 03:27:25 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 7 Jan 2025 03:27:24 -0600
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
X-Inumbo-ID: a1268978-ccd9-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXpJhHZ5Aa7nEUxxcttXY9P8C7Y6SzPiDE64Mv8li7JmV82VR6jV67qVC7qjZAy+xvYBQrqEGfLRMC2tnFrPlSPp/22Ti00Qjk6zKhy/o2gGt7myrSGNjuEFs9IGItRUGz4QILKCWSvY0NWaMt4bAkxUWFgaH3O3wqbaImP+1CRIWhT275sCSxKeV+xpU/VFSSqPrHhWAkuSoum0tW1ysgOPOldnX/DWko28PnT9Xm6B+lK/Ub1CZ4yDNXH+HAB62AzYQzv/NIkrrSZfVmYV+byumFOpcLD78VgNYxChU6YYhJh0yF987SL0s+mvCu9oA4eupi/4ohFCbHGcrdtD6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70MCCoZKVTF+PJ0//NYA+xBhWbE0DzeYXdUvfh/3Myg=;
 b=zJFbMUNKwsMvrQHeteHLsYR4b60q/r7EURIOPdWiUWfTEZqkdmEA/g2SF9XifS8a0/HJGxEi5K7WCYb6nwXItAnk0Z5HLUgnwRi0GB749tvIaqUuV+8AqCgc5FGLhbW1aAULrniG6qf2aYIROW7WRacTuOKMlttbIDHgdMdVbrktmH+0X33Mndq3HbKQgXLLbfRMTNehEvvqurFCCZ+rQn8TzmPZrk7PHX8DlEuEgMRvl39cZiip9VEYrUqbJCsJMOzv2efEnwqFGdSE8hUzOVgITGbuz5qjCzQ/NQjL3IbG0aa/8XGuLasa/pHnGhpDy7M2eo+kcSsF4tToYj1zrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70MCCoZKVTF+PJ0//NYA+xBhWbE0DzeYXdUvfh/3Myg=;
 b=Ok7Ye5xewkXJgdAgFpbO1ohZWA1orConmveBIJ9W1YST15cwlDO/fs1pFSEXGwNvDCdYjaqBfLahY9CQS3h+waq37dIz4pIS33+BiKUD3gqhHzu52y6uHX3AJZuaQKMRYS3rLl0VDdeFqrmI54ma01ASH6Ezkxje0VLtHXDcUv4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Anthony PERARD <anthony.perard@vates.tech>,
	<oleksii.kurochko@gmail.com>
Subject: [for-4.20][PATCH 2/3] xen/flask: Wire up XEN_DOMCTL_dt_overlay
Date: Tue, 7 Jan 2025 10:27:18 +0100
Message-ID: <20250107092719.26401-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107092719.26401-1-michal.orzel@amd.com>
References: <20250107092719.26401-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|IA0PR12MB7577:EE_
X-MS-Office365-Filtering-Correlation-Id: 9194685e-b576-40ea-ad24-08dd2efd7fde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Yn/c+bYDx+NpBQoqNPDfRoF4Jctqplg7ZZMDpq4odjb/VVZreMvcwNbUS7+?=
 =?us-ascii?Q?7XnzTwj6ap/ZnzlIHYqS3xkUK40BP1Nde7f8tWUW3+p54Na8+BevEl0uWbJb?=
 =?us-ascii?Q?uNErUq9YZQ01ok17gbXIgPfh39OdQ25YmsECJ5VE6JlHrEFOFoR9xeojon+F?=
 =?us-ascii?Q?WHqctwk6c3Zmb6INOnRcdv4j0ZeCyaUrs5+6BigRfnRgKqeZvk1L7xMuK9nB?=
 =?us-ascii?Q?Dsu9jMG05NO5EhZyz9Uit9oELtRDUmjpkH8mCdhMPmo6z1iWh7XeVmyzrjsY?=
 =?us-ascii?Q?WHvGSF/26uf/Hk6Mg8T6CdGfQS53/JryqIkyX9OXG3AxOda74nRyH+FSc9HA?=
 =?us-ascii?Q?UVpaAHoWECHf5BzWQcEkusY4BRAcfQ6xmox57agr561sVL1D14JqFxC/Wcz0?=
 =?us-ascii?Q?qNKrrOXcKMhrmLO/pNCil6/+sc3EOcN4Oa7u/9QhqTi0PsU9XU+yaRlT+S9C?=
 =?us-ascii?Q?LyAoPV/FYoUgYpGR/63E3Uoi0zmLbe1QxzXHSP2J5hxRnAYP03uRlE8rDPqq?=
 =?us-ascii?Q?JPf0xi3P2ZcY7o+USfjFB358t5DoJLs8ibqOBCeIdS2sEmEyo4Nsv+aas3F6?=
 =?us-ascii?Q?10t3lBkQdxudRJ5Rm/AHcdwT/XhywLeQ9I7n+ENlQZb/WGR7wT+OdG2OrEJy?=
 =?us-ascii?Q?PB5qogGLkBgYJt1ulT1J9AhruAbzxbUZsG1SCm5S4JlwzpF5gxSFTdw7VWiM?=
 =?us-ascii?Q?lNAQ4SlfRpNhB5ixDYQBEdQWvAnlbIvnTsFhVc1hA6mVyxGqV51D67maUf+9?=
 =?us-ascii?Q?Ta+uSNoTLiZ5LV+prdJJWDYn9uEJeXmuDGfHSKj3jyr0kB3Axe5rZUtde+y8?=
 =?us-ascii?Q?zSRgjbFXRtkUsJx2RJRjTrU9TbUecPfbyevCgH2+yXmfjtB0SPJpwFmFp3ZQ?=
 =?us-ascii?Q?YQ0SRCrhbfeqRBmToIKuiRoVYBBrpeIr74uQ+lujyPyJahsxh128YTyL0Swz?=
 =?us-ascii?Q?yL4nvMg6E5I5Qcm+fA3xNm65/51coJOfvjQ86DxNkxqboh3eooObTHF5NlPn?=
 =?us-ascii?Q?rZHUShi1UK0Ji6GNn0E82YK9Lfa6+QK8bYQUUy3DEB2+83rXIaoApPaw/O37?=
 =?us-ascii?Q?8aKFnmwf7xEs3hJiWdp101RsFT7U81AdUcGjGtIIjPWxp8zOO8vCr9U1Xf/e?=
 =?us-ascii?Q?jHlXofyUrOaqvMzlGQ30aP39XKc5P5rV6298JYedagm2vduVifNdDRViPtZk?=
 =?us-ascii?Q?nxmqNvck6X48d2lkx6ejcvQ2vfEMB6JSpzaFS1P/PlZIYCBf1cvRS+1YcIIF?=
 =?us-ascii?Q?gvRKy8/9V6+RHn2fs2qT/nhJwiCKIElHGR3S74pDMSccRba+9o/aUYBdMm1Q?=
 =?us-ascii?Q?f+Ug3T9Um9mGw0kPpl9D4UxuINVTa/VE6S4ra/xMH3BWSew81o2Wyaxuhx6a?=
 =?us-ascii?Q?KQfOafG5cycgl9iW9lzxrw5iU9pLiol9BSgmuzdMklbKxbEdL9eRi3WAVGmS?=
 =?us-ascii?Q?n8HF/toDMYpUk1MnUS8tayhRXCNtr3QS3uglmix7PjkMqMISVKxrezmpiusO?=
 =?us-ascii?Q?2+5QMBRLXqKw7CI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 09:27:26.1819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9194685e-b576-40ea-ad24-08dd2efd7fde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7577

Addition of FLASK permission for this hypercall was overlooked in the
original patch. Fix it. The only dt overlay operation is attaching that can
happen only after the domain is created. Dom0 can attach overlay to itself
as well.

Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 tools/flask/policy/modules/dom0.te  | 2 +-
 tools/flask/policy/modules/xen.if   | 2 +-
 xen/xsm/flask/hooks.c               | 3 +++
 xen/xsm/flask/policy/access_vectors | 2 ++
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index 16b8c9646d1b..f148bfbf274e 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -40,7 +40,7 @@ allow dom0_t dom0_t:domain {
 };
 allow dom0_t dom0_t:domain2 {
 	set_cpu_policy gettsc settsc setscheduler set_vnumainfo
-	get_vnumainfo psr_cmt_op psr_alloc get_cpu_policy
+	get_vnumainfo psr_cmt_op psr_alloc get_cpu_policy dt_overlay
 };
 allow dom0_t dom0_t:resource { add remove };
 
diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index ba9e91d30201..def60da88301 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -94,7 +94,7 @@ define(`manage_domain', `
 			getaddrsize pause unpause trigger shutdown destroy
 			setaffinity setdomainmaxmem getscheduler resume
 			setpodtarget getpodtarget getpagingmempool setpagingmempool };
-    allow $1 $2:domain2 set_vnumainfo;
+    allow $1 $2:domain2 { set_vnumainfo dt_overlay };
 ')
 
 # migrate_domain_out(priv, target)
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 5118f86cf030..e263e745d441 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -844,6 +844,9 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     case XEN_DOMCTL_set_paging_mempool_size:
         return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__SETPAGINGMEMPOOL);
 
+    case XEN_DOMCTL_dt_overlay:
+        return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__DT_OVERLAY);
+
     default:
         return avc_unknown_permission("domctl", cmd);
     }
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index 7cbdb7ea6408..78fe37583b18 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -253,6 +253,8 @@ class domain2
     get_cpu_policy
 # XEN_DOMCTL_vuart_op
     vuart_op
+# XEN_DOMCTL_dt_overlay
+    dt_overlay
 }
 
 # Similar to class domain, but primarily contains domctls related to HVM domains
-- 
2.25.1


