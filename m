Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA67A8B3FB6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 20:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713056.1114023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0QgO-0004Ju-Ju; Fri, 26 Apr 2024 18:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713056.1114023; Fri, 26 Apr 2024 18:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0QgO-0004IC-H2; Fri, 26 Apr 2024 18:52:28 +0000
Received: by outflank-mailman (input) for mailman id 713056;
 Fri, 26 Apr 2024 18:52:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FKup=L7=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s0QgN-0004I4-FR
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 18:52:27 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e88::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e3bef3b-03fe-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 20:52:23 +0200 (CEST)
Received: from SA1P222CA0166.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::10)
 by SJ2PR12MB8883.namprd12.prod.outlook.com (2603:10b6:a03:538::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 18:52:20 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:3c3:cafe::65) by SA1P222CA0166.outlook.office365.com
 (2603:10b6:806:3c3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31 via Frontend
 Transport; Fri, 26 Apr 2024 18:52:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 18:52:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 13:52:19 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 26 Apr 2024 13:52:18 -0500
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
X-Inumbo-ID: 1e3bef3b-03fe-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlKxpDhWj/u60ASyPYqcaJcxELoSjAM+MKFFIiN8fYsfeK22pryt+Zsk6qXdGmnFd6lvEuqkNMXLkP+YcUrDenoiXCmqRUvE7xuCD3hEDe92o3A27JIwJhCdCE84NgsF4HMcH0fypfn9wmE84T09JzPP/sVTr/kywIO1GQfjv73KgH4HSbZAzJpFFuNPQgfX6BUwoFrewgIV4Vf1+m4g1XHWgH65ia62ffwAJeXqyeWnxF0DsbzpRmtsTDgihuN5aROb6KOsyMXQGttH7p/asmPV32tbe4V8z7ncb3DfnNBHmtKXxBj9q+IG3m+o1u4TD4W5Wf99OEgvwHdGs6mmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bnfh6kTNBKvodPE/EuC15aadkQqwaauyRyjK4Ktf/oU=;
 b=c6XFad3iK3RDfX3HAJXRy1xk8DlEXOKInDwwdHdFkzSNYwwxcbe6PZalkYjHPoxrHGEoAJE/rAbQTjb7jTsOCEUOBM5EDS0T9h82KtDV2wmMSsC9OH3/+0L0JcEXIuvT9W4PyhA0Z0vqXM10ulBa0CZmHux1ULuSU3JOgMCGCAunzaVBgSoI6q76Pqv1yGPttD0JoE0ts2uYN2jKIdvAS92Uey1eqFYa8qydYd08PKbJhTXGqryJ++Ze/h6CQkp81Azxs4f+2zvWMA7vlpGiO8mdMdg1OC/N6QjsCj4tJeEbeLtsoUbegdo1R4zBDaQ/CLk1mCz2W3fYdJjWYKBskg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bnfh6kTNBKvodPE/EuC15aadkQqwaauyRyjK4Ktf/oU=;
 b=UO7TjTkXJ21rdyRxp7iJXfLUSBgtRAcFhVyRkeqTm42dctp5DskRWMXksR0WIX0/h5n4I9zjlm5AHTg4e5D/NN+Fz0r0nczxYyWMknaP7IoiXgp0wO25jUedpEL2Pm4FPZHbx7YUPEPNkIonxImcpOzfmi1MpO4hZA9wY7FEM+0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] xen/xsm: Wire up get_dom0_console
Date: Fri, 26 Apr 2024 00:04:32 -0400
Message-ID: <20240426040432.51910-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|SJ2PR12MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: e7aa0760-bae1-47fd-c6ae-08dc6622005c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wYAzEABuOGavI1pAUIA+7sz3Y5xHgNP1oUVgrNhSFy5MAVuMZJYxugY7KECX?=
 =?us-ascii?Q?rGWoxFQAcEwyJ6qyEM2meIdX85bq4Ijj28tziiQdKFt928a9dOy8wnevHen5?=
 =?us-ascii?Q?YJfcar5rqqIIy4HixH58JvUiSUzvgwH9WJoScX7Wv05PFepiYZYlrhnbWUZT?=
 =?us-ascii?Q?wkU41qXVslUMEUsMAnxKo7QMXvExFLj6XCPQDshbwabKyaSLbfU4apxeTTw5?=
 =?us-ascii?Q?d591/K1+kt1hIVbVTDXDk6iA4XAO6C/OhtwNQOJIL9rZ2dxWFKpfk7kZk+At?=
 =?us-ascii?Q?gPMSIO/KphAkGKV1/nPQlmgiVkcfGNkSo8BBwJrxvTVOB0gpsSmhtZflmruj?=
 =?us-ascii?Q?EhcV281uH2NAJWXMGIZthlICOr05uzCDVTOzOz6lEG44+khqCGQ3cOmHtIl5?=
 =?us-ascii?Q?1DYO/VdXSM2Do54ZTKJecdqVyTsdo6E0s7RQRkWlQ6p2dyi2lwv1lDPz+AAW?=
 =?us-ascii?Q?SW8ig3Ks6VWG17DOPcR0eehffpY7hys6hQjO5Le1fOOh8qKejUFFr6igICoM?=
 =?us-ascii?Q?E0qb0o0yogPqMpoO1IGIrXTfoNix18E+Tzxok3BoQCzOBPYrWIRXVecG0Tp6?=
 =?us-ascii?Q?nTGhs03gRGdPENfGTlM3b5HmcImFEAR/apwU8zjh6o90xhC6dpIeEVD41AJp?=
 =?us-ascii?Q?j8PxAlxQoPfRVOlCDSTnjsshxUPzFAJLjSWO3swvIIZkwRxQ+9Zv8xuAKrJh?=
 =?us-ascii?Q?doUuyW8RzR09yYuS1pnzJhSeGZZqo9aRo7z/LCibKOhYpW8JBwy1l5sPKuAM?=
 =?us-ascii?Q?D4cvgxUxL0A4n9TOXb9QZrjQ7A6gW1dtU6nBFIzHVfQOpsuVbWva7AuGP9m7?=
 =?us-ascii?Q?RobN8FZEwJxYM/mG80/clm5lXR6wZ+tbWzwQpfLYUVjzF5W1OWUT7T5aReCn?=
 =?us-ascii?Q?uRsvwsqShFPKRI1udDjatea6g4VlkS7Q+ctCYnndyCLH3BRaIHBOslEhut1k?=
 =?us-ascii?Q?ff2n20sHfL7QaDQ5U3lbmIAlbcvjkeQfa3l8BgCccKbfb+5xM1Dykn06qvJ8?=
 =?us-ascii?Q?zJFfw05CZwJe+VW0LizjcEt0qfPO4srL3WNc5I8x2Pf8ppGH4WSKQCCogJS7?=
 =?us-ascii?Q?b/Y3QSbAbQrsxdYGTj9ibx6Kwi6b8DpTDfcn17dbiTg8aX6t8qRSiBS5CGkE?=
 =?us-ascii?Q?zpqRVfBXShLhKgGf7t/xJZUSWGsrdiiqAx5wGoZkX8AnpOyRR5EGdngBcK4x?=
 =?us-ascii?Q?IHPsXnf5Y3hJn49Zlk8MG7FhIZQZUF1ZCvYIKpWJ0aL4/rxvkBrsbPBP6QnC?=
 =?us-ascii?Q?ITqmHilDOFkEW/HI9HAXKd+BLwxlLOuhfjoxGogz4bBwVQciTOCxdhclHWiv?=
 =?us-ascii?Q?f0ijJlJHpTKK5VsQVjSxN3CUJzbtM576L/c5kuC6MYokQvib4A7SKGl5H+xW?=
 =?us-ascii?Q?AQF2U9PuEyrLZpKls2mHzQH0akc8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 18:52:19.9831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7aa0760-bae1-47fd-c6ae-08dc6622005c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8883

An XSM hook for get_dom0_console is currently missing.  Using XSM with
a PVH dom0 shows:
(XEN) FLASK: Denying unknown platform_op: 64.

Wire up the hook, and allow it for dom0.

Fixes: 4dd160583c ("x86/platform: introduce hypercall to get initial video console settings")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/flask/policy/modules/dom0.te  | 2 +-
 xen/xsm/flask/hooks.c               | 4 ++++
 xen/xsm/flask/policy/access_vectors | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index f1dcff48e2..16b8c9646d 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -16,7 +16,7 @@ allow dom0_t xen_t:xen {
 allow dom0_t xen_t:xen2 {
 	resource_op psr_cmt_op psr_alloc pmu_ctrl get_symbol
 	get_cpu_levelling_caps get_cpu_featureset livepatch_op
-	coverage_op
+	coverage_op get_dom0_console
 };
 
 # Allow dom0 to use all XENVER_ subops that have checks.
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 78225f68c1..5e88c71b8e 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1558,6 +1558,10 @@ static int cf_check flask_platform_op(uint32_t op)
         return avc_has_perm(domain_sid(current->domain), SECINITSID_XEN,
                             SECCLASS_XEN2, XEN2__GET_SYMBOL, NULL);
 
+    case XENPF_get_dom0_console:
+        return avc_has_perm(domain_sid(current->domain), SECINITSID_XEN,
+                            SECCLASS_XEN2, XEN2__GET_DOM0_CONSOLE, NULL);
+
     default:
         return avc_unknown_permission("platform_op", op);
     }
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index 4e6710a63e..a35e3d4c51 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -99,6 +99,8 @@ class xen2
     livepatch_op
 # XEN_SYSCTL_coverage_op
     coverage_op
+# XENPF_get_dom0_console
+    get_dom0_console
 }
 
 # Classes domain and domain2 consist of operations that a domain performs on
-- 
2.44.0


