Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 921DFAFBF19
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 02:07:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035889.1408311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYvs2-0000Vt-Mr; Tue, 08 Jul 2025 00:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035889.1408311; Tue, 08 Jul 2025 00:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYvs2-0000S6-JN; Tue, 08 Jul 2025 00:07:38 +0000
Received: by outflank-mailman (input) for mailman id 1035889;
 Tue, 08 Jul 2025 00:07:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y4zX=ZV=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uYvs1-0008Ok-Ov
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 00:07:37 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2415::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d10c3f9-5b8f-11f0-a316-13f23c93f187;
 Tue, 08 Jul 2025 02:07:36 +0200 (CEST)
Received: from MN0PR02CA0013.namprd02.prod.outlook.com (2603:10b6:208:530::27)
 by IA0PPFAF4999BF6.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::be0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Tue, 8 Jul
 2025 00:07:33 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:208:530:cafe::87) by MN0PR02CA0013.outlook.office365.com
 (2603:10b6:208:530::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Tue,
 8 Jul 2025 00:07:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.1 via Frontend Transport; Tue, 8 Jul 2025 00:07:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 19:07:32 -0500
Received: from SATLEXMB04.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Jul 2025 19:07:31 -0500
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
X-Inumbo-ID: 8d10c3f9-5b8f-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uS9zJjH3uFVE54H7XHJTTuOCvkIsAHLdIVCnHXAcfI5kxgx65U9zbKz/kq95h2SXkVI5beSlPTazE4ftlWyT+6auex/mp5qaKIkztmotVpouInzJ37KbGw8WYKHYuJplkiIc5OplOzTX5FsOkUtjT6P/4vxgb+mg2cfMagQ2MVN5qu2VGxEZKsoIFFCCmPjiP0rCNt0dNjRLGRIVc4XvSPCjqJGbypQKBGryt3so33SRxToSGbC0QmSwWIzGfhOGPE+Dte1Gv2XrzyyaxBkWbilZO3ZteBaEyKIEsIrf9vrTGW8N4jjY+haWT2sXm9Pj62pRulm4MEu1ignDhzOvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjdDcpF4uZJflG+MGFMZAeJiMlRA1hyVfZUbE4nEhwE=;
 b=YaPnvYu+cC3T/RfXTijA1Eo7s+P4VsglvGKtNI9zppg4vZlX0VkKgJP5aFQrYBOwKOc9Ru0bTVKjlTvkLR43b4KnEeefGbY5dU2JhqXNKtCkYadgd4TWNj59kyIzrRunXrRMNGTUHlH3TXyx0Gun57f21Ta1Jf8lFBk90cKKXoc2jDD633azjY/k4BhlNvPUquQ6A4ktp9BL20iXKCFpQkiIMTb1b7zb1zRUskIoQzaMdcdiAQoxijkaehjYwr8BK/nfqCxsJ3KhMM5Lazu2/Bz4GlYgAm7CxZ1wiRNwFpo/Rr4jkJFN5WcE3rnjSy2Wrq+yyQmDaXcEZoyXsfLw+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjdDcpF4uZJflG+MGFMZAeJiMlRA1hyVfZUbE4nEhwE=;
 b=vQpNeysXsz0gy34E3kG9A78nxXjocTAHxEXe3Krb/Fnbkwm20HaRjfRSQr5kExlSMmn332pGl4d7D9P69QXo7MznoVTLwNQWW4rH2Zd1npsOcxvpNwo88gbI3IFYVOSX0o7Jj+NayWVRVEjDJ3KgEr14Pxm923QjanjDBlRxh9g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<stefano.stabellini@amd.com>, <Xenia.Ragiadakou@amd.com>,
	<alejandro.garciavallejo@amd.com>, <Jason.Andryuk@amd.com>
Subject: [PATCH 2/2] xen/x86: introduce AMD_MCE_NONFATAL
Date: Mon, 7 Jul 2025 17:07:12 -0700
Message-ID: <20250708000712.2731666-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|IA0PPFAF4999BF6:EE_
X-MS-Office365-Filtering-Correlation-Id: 27fc646e-75e7-4932-8f18-08ddbdb36fcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WudmQNBATdOWQSuTOsNieIp5WhyKNCm8yNUitG2lrJUXGeCJTiqt/a9pIarI?=
 =?us-ascii?Q?kMQTf9S6UTZjbgvYuj1yzvESPtJWUw+Xm+ANaR9ccMNGHybfl51/6hoDegCL?=
 =?us-ascii?Q?6aZnga6psJM1roET4QtDMTB3eNbyedyX2DvCCtPVG6HcLHnarL4qfAYAMmI+?=
 =?us-ascii?Q?udyTvvf4qxnRmZMHaAZoct7dH+rlCEvFMHx1bSf2S+wSJtOe0JQ9f7EoPCK6?=
 =?us-ascii?Q?z/B1V3a+4viJMOMWt9bQ14VA6ZC83whQYfbFaYGYnsHivJhFFPiqWQXP5uJL?=
 =?us-ascii?Q?H88VcFRh4hMD7/yr7BhujsTQ5lfY4yajPgahIs/XEdjXOdioSjCGkpgXL4UA?=
 =?us-ascii?Q?nSihJ+FhSmMBh7h/ecnEt0nBGh+6lkMIPkub9t6o1mYk7arbZRVeKXJb3nWS?=
 =?us-ascii?Q?HvPEWyfx2DsNdMOIabU656vMJk90cS1GqEdS3joVA7HXgNSZZ4Umz6eTlbpO?=
 =?us-ascii?Q?6PwMF2rvtxXmOG8DsE4llDi4GUhfZrlDDQqe9fbN0AphbhCK4E05iTHtdRGU?=
 =?us-ascii?Q?JC3Tt03/cRUxeOmv3Wp9t3VsNiC95UELp0RWvwLECql7wlCUAs4+l4/w8z69?=
 =?us-ascii?Q?si5+qUnJwgCMe9xfN9uUvf5TOdMzbnTfr9euKzG+AAAxypDsetk0qY1sEyUW?=
 =?us-ascii?Q?Xd2+iUNnv/YGrrnrrTsH7L/eIeku79u/4P9+y3jGC8bIf79P2ZNNLRsNpovm?=
 =?us-ascii?Q?vUO2yTcAoDAxYlSpNLKmoNXV/fPd+N+9zniCa16gnM3jENHkChwehfiz/0pP?=
 =?us-ascii?Q?MaSe7CnBXNauhxcWxCmbJEFqpRZ8LgPJP+9zmxU9RzBeBUzCQvey54ISpENX?=
 =?us-ascii?Q?dVDEsqN6knImvcKqtMTrw09ElSSn6R4LoQ7rm2awZ21bIJBy4YPzGGYEjP+w?=
 =?us-ascii?Q?tOlheym+Ldoj122stjVHGCYhhPtQBJJVuI+PqdQFu07DzPCPuNi32G0rnq8C?=
 =?us-ascii?Q?5UDUuJuMJMjhTWZZHxHhW2F70Fk9CtSG4mpxCO3sv5vToKFkc/u5csUutZC/?=
 =?us-ascii?Q?SKz4lAx4yu68msJ0OdD9Oac67GqopOCz49y16iXLviHyuZ+XBMgd7TLIRn91?=
 =?us-ascii?Q?oGN+SZUitv6adXHckGpeugs8WeOUNg6/ZLKw2IzFMjdRb3poSrASCX923/gV?=
 =?us-ascii?Q?wKWRvyX4aPdowQhHEkYitG73CmdGRxQQAw6tnaHQ+35lN+2VwKAg9ULtus2r?=
 =?us-ascii?Q?UiGlqG3AIcCN3fCjB5sjCXjsZp4ta1npIZJ2lOlsHHYoD2Wf3jr1dYCM9c6M?=
 =?us-ascii?Q?cVyDfhltLzJDb+69i78qyaLJcf3+uTiV1M+kQnJyBX6F+g8iUUS5IlD13Gxz?=
 =?us-ascii?Q?yChnYF1zVH9dzc7BRnUkDnZMyYHQZvBGMBAxIsoC9ko71dVHr0m0JLN1mior?=
 =?us-ascii?Q?kq9PN6192EoAjVI+/H49CiCcCE2ipJ/njunkQeQE5lRaaBL6vhqEvpNt54qS?=
 =?us-ascii?Q?0/t0fzu9U08BAJXXfcOuk+eEDcUg1uqt5GLtFL9Cecj6zv0KslGF5pEXT6n7?=
 =?us-ascii?Q?QjGo3nVidSF2MiTbDGlFYkI4SV9OTvwaFL3t?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 00:07:32.8728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27fc646e-75e7-4932-8f18-08ddbdb36fcf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFAF4999BF6

Today, checking for non-fatal MCE errors on ARM is very invasive: it
involves a periodic timer interrupting the physical CPU execution at
regular intervals. Moreover, when the timer fires, the handler sends an
IPI to all physical CPUs.

Both these actions are disruptive in terms of latency and deterministic
execution times for real-time workloads. They might miss a deadline due
to one of these IPIs. Make it possible to disable non-fatal MCE errors
checking with a new Kconfig option (AMD_MCE_NONFATAL).

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
RFC. I couldn't find a better way to do this.
---
 xen/arch/x86/Kconfig.cpu               | 15 +++++++++++++++
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c |  3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
index 5fb18db1aa..14e20ad19d 100644
--- a/xen/arch/x86/Kconfig.cpu
+++ b/xen/arch/x86/Kconfig.cpu
@@ -10,6 +10,21 @@ config AMD
 	  May be turned off in builds targetting other vendors.  Otherwise,
 	  must be enabled for Xen to work suitably on AMD platforms.
 
+config AMD_MCE_NONFATAL
+	bool "Check for non-fatal MCEs on AMD CPUs"
+	default y
+	depends on AMD
+	help
+	  Check for non-fatal MCE errors.
+
+	  When this option is on (default), Xen regularly checks for
+	  non-fatal MCEs potentially occurring on all physical CPUs. The
+	  checking is done via timers and IPI interrupts, which is
+	  acceptable in most configurations, but not for real-time.
+
+	  Turn this option off if you plan on deploying real-time workloads
+	  on Xen.
+
 config INTEL
 	bool "Support Intel CPUs"
 	default y
diff --git a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
index 7d48c9ab5f..812e18f612 100644
--- a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
+++ b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
@@ -191,7 +191,8 @@ static void cf_check mce_amd_work_fn(void *data)
 
 void __init amd_nonfatal_mcheck_init(struct cpuinfo_x86 *c)
 {
-	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
+	if ( !IS_ENABLED(CONFIG_AMD_MCE_NONFATAL) ||
+	     (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON))) )
 		return;
 
 	/* Assume we are on K8 or newer AMD or Hygon CPU here */
-- 
2.25.1


