Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBxPGZO9iWmkBQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:57:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFAB10E6DB
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225172.1531660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOYc-0004Ro-7N; Mon, 09 Feb 2026 10:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225172.1531660; Mon, 09 Feb 2026 10:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOYc-0004QD-4H; Mon, 09 Feb 2026 10:31:54 +0000
Received: by outflank-mailman (input) for mailman id 1225172;
 Mon, 09 Feb 2026 10:31:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EeIc=AN=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpOYa-0004AI-VT
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 10:31:53 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b8bcd2c-05a2-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 11:31:51 +0100 (CET)
Received: from PH7PR17CA0057.namprd17.prod.outlook.com (2603:10b6:510:325::6)
 by LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 10:31:46 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:325:cafe::56) by PH7PR17CA0057.outlook.office365.com
 (2603:10b6:510:325::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.17 via Frontend Transport; Mon,
 9 Feb 2026 10:31:36 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 10:31:45 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 04:31:42 -0600
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
X-Inumbo-ID: 8b8bcd2c-05a2-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+JytafSwklHj7MW80gsBEId3sDiFrrlLYZLmr+NE6pJhNAkd3dYIXNHG6Q2VVucHLTW12Gtj5PAFVhOFxK7xQPS3OjWZ0E1xWxEdxRd89AQl/SuO2Zd7qlsZNyii8+3lI3rFVzWoKjvjY2vcsVn/pEfOsY35QnCrJ4ybwkBM5G0Y+m2TLV7yDCNM43lcoTlhzw7VCDNBlSbtjrcDP3hgUmCOW3Oz3IglziuEyXqV4AzaaxyLmdsQVaDHQ/n1bQm8wzp/9y6KaIAYJhl2MHBxDaG2njkCKpINazYRRlNmLCYgcLELvCXEEB+/V/lh3A/X7oOyYp/aRbXkGuG99/6qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qeeq1xMi1fi4C++dxIjciOIE3wFIWwG27Soi5ZlWspE=;
 b=J8rY+sR5is0tLuBgDvvHODc+gNE6zWbrH/kL7V+rHpNctSixh4BNVhvNRym2j2wnmPXwHYD5CSyC/KFznn2htk7HALKi2PPILoYWobSS7kc1IbeJjCY1gtVq5u1TT93ZDRfChuYxHPXQbmsgpXRp8AR4sP92jJbc8oPHiU92Clcg4tSFRF1AIAIUgZridmATDItEwTEOYgCnIzWtlC9rsYoOrf/j1RezwlKroCFa8Sdryhl+HvuE1HP/uQn7VXix0a/y1tS73cQsSXV2T5/5cmKiGzLUZP9gKmCRY79zS2o0g4/B661ohsenaFGS023ZgElXmhid2DOyfmfyGLZ5bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qeeq1xMi1fi4C++dxIjciOIE3wFIWwG27Soi5ZlWspE=;
 b=N7SGZmIp3cVr8O+jJToR0tvtbwmRysGKSGQi3+dYNAVPkfOeN+dQE/B3D5tOQsN0Ouhwe3JpaeyxGbfHnF5+WpidbnKrwBnNmyHrFiU4k+ZGsToJan+LWhsrmuZ8QCRpzWJI7Uf5QiqZ+Y3+HkK7KGpyMgPP/NbTPmGFUvek2vM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] x86: Add Kconfig option for log-dirty tracking
Date: Mon, 9 Feb 2026 11:31:15 +0100
Message-ID: <20260209103118.5885-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb08.amd.com
 (10.181.42.217)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|LV9PR12MB9829:EE_
X-MS-Office365-Filtering-Correlation-Id: 3613ac6b-03ef-4da8-f455-08de67c66c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RE4UcandWHDe4SGeorw+LULNVJa3B5iSFq4XJ8ZnvIurNWg2kSujDJPxEbus?=
 =?us-ascii?Q?o33tuCSqWnOuOjBfsFyJIzgbuCpGY5WDybJDy6uZiNTxfln+I18VZ6p5PFf3?=
 =?us-ascii?Q?lrJo3ggIoJc5xRWImzwLA/J/+mjhi9iCL9CsFSjjEEKV7smtFjhjWO5e4y6z?=
 =?us-ascii?Q?tx7NRkgHfX2heavx28+nbCKm7u1LX9/kBvqBsQKMkMBi2lgIgUlr5lI5SPr4?=
 =?us-ascii?Q?SrHuT/D7+TvlfMrb2Ssx4cqafhfDBu3dc4sXGWUz7F0soxeuk5sJXeoGQo7O?=
 =?us-ascii?Q?SDwXVMKKUBivUPMapTeAeMEi0uIdQbL4YYF4cWJ7oSRGBUc86KGXvHlXp3kA?=
 =?us-ascii?Q?p0njNUaAUET9EuY0STT6ez2kUAfWdPe8UNwCSYW/gwEVBUJxvhUTir+a2LtE?=
 =?us-ascii?Q?sVYupeN6EfqmcHxNf5Xlewqv7DWqU30cMIGV6wBOiIc4p5GlzXKUTwgMuuj7?=
 =?us-ascii?Q?ZGimRG8qz6bfAMQdLiB16Q5LulnHwq1WGwfbLjrlT7MC9gmazq6UPL7wGlsf?=
 =?us-ascii?Q?A8IEB60+9EbjBu6+Hv8w5G8Pd86wehjiibG/cCiqUjzfKmGmkzS5je7YuS6S?=
 =?us-ascii?Q?snNz0KsJzGQa1zZ6ezeHQCBb9NQWjDPjLaTcPb+22ZYRXCtS5PExneoONyx+?=
 =?us-ascii?Q?1TtMjYorAwk41MCII2B2AsUq5I/qpv2b1F3ITMEgmqqi1q8HCE8u0JjbUwcn?=
 =?us-ascii?Q?S2aJltWYIZwKZ0HJz/zYM+3ojQgw2BA8PxVxio9owDnuUw+L+giYL+jk05hU?=
 =?us-ascii?Q?Y0B5nfuiWGV2skBg/cCf8DKInTuUt4AHHt0jqhXtEw/6aP+B6uhRyeXKwZSm?=
 =?us-ascii?Q?nOpnAfKg22TufhvL+30hFU1rkUKSX1gzfnARNWPPLwsGfNO6GJwzV6okQtLv?=
 =?us-ascii?Q?ThTEY8xaZH/CUaxJjq+ry9wDd5nC0FhCl9Xy1s6c2tDM+gvWrJaFwxPBJ3/N?=
 =?us-ascii?Q?tUGpQmOVRHKxKGIbAEKKvSymAk52hJQTLlIKhQsVIGPstwKDpQ/F/jpZ4Q+B?=
 =?us-ascii?Q?sJeG1IQD3l04Y0ujMYSTohVq+/5zfs/FT1XCdeK3SYl0BVZ427yzNOomEkeJ?=
 =?us-ascii?Q?vPnAcW/kFhQK0Nx6Zsc1oz7G+ZJ/EMAP3PqGYwzyeuNqIO60UMBNd8CIYcnO?=
 =?us-ascii?Q?8mk0ntZ2kfDjV6cw0n52v9hSoOi5uAwKPILiJ6TIveOBWTJXKJ07xu1vvRym?=
 =?us-ascii?Q?8WnpTZNurnZIiLWu+Wop/V3QCIYvk5DSYS1GcQDeAdzAnLONzdtfK4LMFLfJ?=
 =?us-ascii?Q?a1RX+5tX12q5YqjWETQygHVtob0aRJU66G43mCD2eQPyzXaMIC4vFFRUtmkT?=
 =?us-ascii?Q?nEXPBlDJmgoNJ3j6zOCkiDxnvvY8waJIERLQPzErMBFohnRQX8pp28Bg8hYi?=
 =?us-ascii?Q?3fa5h3GG+XAX+SXYkFrqv5ZZepYkM9Y7rft/JYcp+wRLaDdq60hTuIO+hpUK?=
 =?us-ascii?Q?dPbqydBLz03LrRY25BAxqjlExCT/OOzS4raeoRtI3w1jHerWDp9xn07Eje88?=
 =?us-ascii?Q?ImZadr6emK80TCqAQIw76+nUxItAZuzIZSrLDsUMvwW1CW+Jr6XomJVD1xsV?=
 =?us-ascii?Q?EkkRLu0Ol2g+rNd8xBSPTOYBvfoL3wm5KnbqGby+kGcOaq7x92ut93Ct0d9X?=
 =?us-ascii?Q?EDEpt9VcZr39optmb2i7l3JLH9FQ/xd4MiyiD0BdsYehd3TjkcMcdXdN5eIP?=
 =?us-ascii?Q?tmNk5g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rt1AgFp4OTa4RZOsY4azbK6Iy3tcOmMt4RxB3CPAkRZm71IyRi8kRfoiO/smerqQ5m8OHJ1f2XzlgKN61aGZ+Nnf3gjGbPyYn/hGVeh1oLVLyUvAqVWrdhBzfk4Tj33HvDDngObUceo3E2sOVv58waX0rGUuYRlWFBgQgfTgPTY/6Sql/dkh3t/0EoPRPjqBzKXIYIWTGwXixKr70g15KY0q+MoQ+YbHY4aYtxnM4EBxU6K6aiDY382SVswRI7y2bac3dyxc1wXD6k/DtGfBC2fQP67QohoHsmYou81GanPTRHTIX0W9GhV636/bDIBnTWEz2R69LAg8UkexuMtfXgUC7LVEZgSNIbJThC9eIALKl0IM0RH8cTu/a2qKTz19lbt8lNJokGuOfvo/FXVvXznaVFQEO5aTW1tJPheyOSY8GrCd0pIksQsyIBXWQolC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:31:45.0759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3613ac6b-03ef-4da8-f455-08de67c66c51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9829
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9DFAB10E6DB
X-Rspamd-Action: no action

Creates a CONFIG_LOG_DIRTY Kconfig option with the following effects
when disabled:

  * paging_domctl{,_cont} return -EOPNOTSUPP (XEN_DOMCTL_shadow_op).
  * VRAM tracking via DMOP returns EOPNOTSUPP.

And compiles out all log-dirty tracking infra.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
RFC for the Kconfig help message.
---
 xen/arch/x86/Kconfig              |  9 +++++++++
 xen/arch/x86/domctl.c             |  8 ++++----
 xen/arch/x86/hvm/dm.c             |  3 +++
 xen/arch/x86/include/asm/domain.h |  2 ++
 xen/arch/x86/include/asm/p2m.h    |  2 ++
 xen/arch/x86/include/asm/paging.h |  8 +++-----
 xen/arch/x86/mm/hap/hap.c         | 22 +++++++++++++---------
 xen/arch/x86/mm/p2m.c             |  2 ++
 xen/arch/x86/mm/paging.c          |  2 ++
 xen/include/hypercall-defs.c      |  4 ++--
 10 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 61f58aa829..fbf044aa4d 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -146,6 +146,7 @@ config XEN_IBT
 config SHADOW_PAGING
 	bool "Shadow Paging"
 	default !PV_SHIM_EXCLUSIVE
+	select LOG_DIRTY
 	depends on PV || HVM
 	help
 
@@ -166,6 +167,14 @@ config SHADOW_PAGING
 config PAGING
 	def_bool HVM || SHADOW_PAGING
 
+config LOG_DIRTY
+	bool "Log-dirty page tracking" if EXPERT
+	depends on PAGING
+	default !PV_SHIM_EXCLUSIVE
+	help
+	  Enable log-dirty infrastructure so Xen can track domain memory writes and
+	  the dirty state of VRAM for device models and live migrations.
+
 config BIGMEM
 	bool "big memory support"
 	default n
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index d9521808dc..61d43a21d0 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -220,15 +220,15 @@ long arch_do_domctl(
     {
 
     case XEN_DOMCTL_shadow_op:
-#ifdef CONFIG_PAGING
+        ret = -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_LOG_DIRTY) )
+            break;
+
         ret = paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
         if ( ret == -ERESTART )
             return hypercall_create_continuation(
                        __HYPERVISOR_paging_domctl_cont, "h", u_domctl);
         copyback = true;
-#else
-        ret = -EOPNOTSUPP;
-#endif
         break;
 
     case XEN_DOMCTL_ioport_permission:
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 3b53471af0..94216aecc2 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -48,6 +48,9 @@ static int track_dirty_vram(struct domain *d, xen_pfn_t first_pfn,
                             unsigned int nr_frames,
                             const struct xen_dm_op_buf *buf)
 {
+    if ( !IS_ENABLED(CONFIG_LOG_DIRTY) )
+        return -EOPNOTSUPP;
+
     if ( nr_frames > (GB(1) >> PAGE_SHIFT) )
         return -EINVAL;
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 94b0cf7f1d..f09c13909f 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -226,7 +226,9 @@ struct paging_domain {
     unsigned int            p2m_pages;    /* number of pages allocated to p2m */
 
     /* log dirty support */
+#ifdef CONFIG_LOG_DIRTY
     struct log_dirty_domain log_dirty;
+#endif /* CONFIG_LOG_DIRTY */
 
     /* preemption handling */
     struct {
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 9016e88411..3c2dcacfa5 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -253,9 +253,11 @@ struct p2m_domain {
                                     bool *sve);
     int                (*recalc)(struct p2m_domain *p2m,
                                  unsigned long gfn);
+#ifdef CONFIG_LOG_DIRTY
     void               (*enable_hardware_log_dirty)(struct p2m_domain *p2m);
     void               (*disable_hardware_log_dirty)(struct p2m_domain *p2m);
     void               (*flush_hardware_cached_dirty)(struct p2m_domain *p2m);
+#endif /* CONFIG_LOG_DIRTY */
     void               (*change_entry_type_global)(struct p2m_domain *p2m,
                                                    p2m_type_t ot,
                                                    p2m_type_t nt);
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 291ab386e8..980cdfa455 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -55,12 +55,9 @@
 #define PG_translate   0
 #define PG_external    0
 #endif
-#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 /* Enable log dirty mode */
-#define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
-#else
-#define PG_log_dirty   0
-#endif
+#define PG_log_dirty   IS_ENABLED(CONFIG_LOG_DIRTY) * \
+                       (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
 
 /* All paging modes. */
 #define PG_MASK (PG_refcounts | PG_log_dirty | PG_translate | PG_external)
@@ -174,6 +171,7 @@ static inline void paging_log_dirty_init(struct domain *d,
                                          const struct log_dirty_ops *ops) {}
 static inline void paging_mark_dirty(struct domain *d, mfn_t gmfn) {}
 static inline void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn) {}
+static inline void paging_mark_pfn_clean(struct domain *d, pfn_t pfn) {}
 static inline bool paging_mfn_is_dirty(struct domain *d, mfn_t gmfn) { return false; }
 
 #endif /* PG_log_dirty */
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index a337752bf4..21672db011 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -50,7 +50,7 @@ struct hap_dirty_vram {
  * calling p2m_log_dirty_range(), which interrogates each vram
  * page's p2m type looking for pages that have been made writable.
  */
-
+#ifdef CONFIG_LOG_DIRTY
 int hap_track_dirty_vram(struct domain *d,
                          unsigned long begin_pfn,
                          unsigned int nr_frames,
@@ -161,6 +161,7 @@ out:
 
     return rc;
 }
+#endif /* CONFIG_LOG_DIRTY */
 
 /************************************************/
 /*            HAP LOG DIRTY SUPPORT             */
@@ -440,14 +441,17 @@ static bool cf_check flush_tlb(const unsigned long *vcpu_bitmap);
 
 void hap_domain_init(struct domain *d)
 {
-    static const struct log_dirty_ops hap_ops = {
-        .enable  = hap_enable_log_dirty,
-        .disable = hap_disable_log_dirty,
-        .clean   = hap_clean_dirty_bitmap,
-    };
-
-    /* Use HAP logdirty mechanism. */
-    paging_log_dirty_init(d, &hap_ops);
+    if ( IS_ENABLED(CONFIG_LOG_DIRTY) )
+    {
+        static const struct log_dirty_ops hap_ops = {
+            .enable  = hap_enable_log_dirty,
+            .disable = hap_disable_log_dirty,
+            .clean   = hap_clean_dirty_bitmap,
+        };
+
+        /* Use HAP logdirty mechanism. */
+        paging_log_dirty_init(d, &hap_ops);
+    }
 
     d->arch.paging.update_paging_modes = hap_update_paging_modes;
     d->arch.paging.flush_tlb           = flush_tlb;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index e915da26a8..373382c28c 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -236,6 +236,7 @@ struct ioreq_server *p2m_get_ioreq_server(struct domain *d,
     return s;
 }
 
+#ifdef CONFIG_LOG_DIRTY
 void p2m_enable_hardware_log_dirty(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
@@ -263,6 +264,7 @@ void p2m_flush_hardware_cached_dirty(struct domain *d)
         p2m_unlock(p2m);
     }
 }
+#endif /* CONFIG_LOG_DIRTY */
 
 /*
  * Force a synchronous P2M TLB flush if a deferred flush is pending.
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 2396f81ad5..13ee137db9 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -623,10 +623,12 @@ int paging_domain_init(struct domain *d)
     INIT_PAGE_LIST_HEAD(&d->arch.paging.freelist);
     mm_lock_init(&d->arch.paging.lock);
 
+#ifdef CONFIG_LOG_DIRTY
     /* This must be initialized separately from the rest of the
      * log-dirty init code as that can be called more than once and we
      * don't want to leak any active log-dirty bitmaps */
     d->arch.paging.log_dirty.top = INVALID_MFN;
+#endif /* CONFIG_LOG_DIRTY */
 
     /*
      * Shadow pagetables are the default, but we will use
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 63755bb8df..be7ed832be 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -194,7 +194,7 @@ dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #ifdef CONFIG_SYSCTL
 sysctl(xen_sysctl_t *u_sysctl)
 #endif
-#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
+#if defined(CONFIG_LOG_DIRTY)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
@@ -292,7 +292,7 @@ dm_op                              compat   do       compat   do       do
 hypfs_op                           do       do       do       do       do
 #endif
 mca                                do       do       -        -        -
-#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
+#if defined(CONFIG_LOG_DIRTY)
 paging_domctl_cont                 do       do       do       do       -
 #endif
 

base-commit: 1ee8b11c1106dca6b8fe0d54c0e79146bb6545f0
-- 
2.43.0


