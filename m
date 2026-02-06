Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HCRGdwThmk1JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CD61001F9
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223512.1530981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVC-000643-3s; Fri, 06 Feb 2026 16:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223512.1530981; Fri, 06 Feb 2026 16:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVB-0005zu-Va; Fri, 06 Feb 2026 16:16:13 +0000
Received: by outflank-mailman (input) for mailman id 1223512;
 Fri, 06 Feb 2026 16:16:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgBG=AK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1voOVA-0005HU-7H
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:16:12 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24ffcf26-0377-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 17:16:09 +0100 (CET)
Received: from SA1PR04CA0005.namprd04.prod.outlook.com (2603:10b6:806:2ce::14)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 16:16:01 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::e6) by SA1PR04CA0005.outlook.office365.com
 (2603:10b6:806:2ce::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 16:16:00 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:16:00 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:15:58 -0600
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
X-Inumbo-ID: 24ffcf26-0377-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9BY5tQwZsNpcXfl6ExoSMbCGHiP6/s6cUSwDJmeltiOQvEMjcr2JlFAejwkt8K+mqw2qBmi5pwxKm2GBJHHwStqiuhjEJKjNFgbrMBB3JPp31I5Jfa7O5AweyHHaPm7HdfKruwQWCM6opd31bO7amdJ8064fQwIe+ACVLcmTmNJS/nfBOGsAPMCoJr/UAozaoAXLV8S7hvtuaDACrsz6iJsVuAQRXJqralQnlsk/IC5ddTZSkWWsP2YgkbPHhimsW7gJ3HOT5H5hfn8zsxn/az8YXFxRwN7s8LMgZbwQYmschka63Y/PUgsgM7batIw6Q2YMj9rsqmh6IUVX0N+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOhbQwb+qNaHaDSvXmZVl68QN/9CpRrOxtwZQK4VBCk=;
 b=QwRcO5WlU/zsKn7ShgRXdN0dTzRn3kQjVE1hLKo7rOXfmbyQLtERNSGa1vMibk6mvFxINZyP6t80zpNCxy7D9iFXLmhk+VYsN6JIzWtqpwj8LS9slGZKt/mXa4VuAsMNzE37PqrTyLIttfu/PQgZeNc3bI2oJgYpNX5HTO+KLyC/tGeY4s6aZISTGEycQlr+RUPGuhiwScbXtHUOUO0LfTLuq6GKHTTPeBpqjix/qTEWh015QSFaIstrHgeLSsF9JIPUavbXN+s3yOTabcoMq/uzrJAf3JJZMNsmBWgPyH1veDGjhJyhnd181/RO6CE0xiRmD9nZqOLAeJ34M1h11A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOhbQwb+qNaHaDSvXmZVl68QN/9CpRrOxtwZQK4VBCk=;
 b=jjnKdtnQBlmdtBvARc8qjHmCU0NGlTHjB4sU3Y+6OuFppZkSIF9qSQr80QRy3bBkMgMYrZHsttpgbfLZrcpwJmqOo0dvJCvYCsaU+7TmGg1hGFsIhiCxLptAuZPpFc6k0PaFJOjXXAEBKsfGRr8nBJOvuWNvA2//F+N5AaIu86k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH 02/12] x86: Add more granularity to the vendors in Kconfig
Date: Fri, 6 Feb 2026 17:15:24 +0100
Message-ID: <20260206161539.209922-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|BL1PR12MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 19df79fb-40a1-4c05-7243-08de659b0489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qTZUjAX3HWTuSJRaXlb5exbR8cfpPfzKkabqqJI+dcGggA3z8b68nFExkYkp?=
 =?us-ascii?Q?cHCqL5Mm9UYvoZT2ZTM7F8b6WL9IlJQJCGmFYicwlAXVjj8PmlyW4nyirlAt?=
 =?us-ascii?Q?GKTyE5NpZxOPjfK3lKXACzv7KYK0N3SYx9HXBwp86Oc3eHOVIIwrRLzMSBJ0?=
 =?us-ascii?Q?OTTgO3w0mPv5/jL8sFWaKFqtt/V9SDftzF8UgO1nW5fjZiQe0IPaFKW6chgS?=
 =?us-ascii?Q?R9ceQIgyDFhEdz5rp8S8+QZMiAjtdTVIxy4dM5m/YgKd6SAPF3KIwzfDXArM?=
 =?us-ascii?Q?VgF6MLUVU6W/+7skJtMUz5GnpH7tSM+jFJbYZ1LzH4YApcAEnTMacFyiphax?=
 =?us-ascii?Q?JCEqWPdSCni4EzbAM7AyRk2dWbv9WfebS4M2s1p1JzsbnvHEIlRnHvEfaYe0?=
 =?us-ascii?Q?KSGS1miIXEsGbJRnPiJ7JAeNhu4Sksh/I1krD4vnoBG9c8MNG+amOpXyBzvT?=
 =?us-ascii?Q?ILAs8N2X96wIvOeoXGkChAbdhGFkzUoMmNCI5a9sUEi344eRZVB2cS2VVMRd?=
 =?us-ascii?Q?r5+BndVNW/94Azo/O2BGXh0PvGMhnuVPSYGOPw9KhYymzy1MUvqghkqEbZmR?=
 =?us-ascii?Q?Px4MhJjBIuRgghyYnbnSSDSHabKsgfcFNUiSY7oA82lMyX45dRGUu3nceOm0?=
 =?us-ascii?Q?1dOHMgHxhquEBlOEUNOhZFZDETfHdu5a9Ng1fYQPZ1JZiExS5+Djze403FF2?=
 =?us-ascii?Q?R3yY/7imieR4h9DP/j7NwadrjlWQMbsoOGphbYrDuc9f0C415O64A77s95D3?=
 =?us-ascii?Q?v7ho24x0hmidf9XfTZ1Q7bjVlw1UI1NxJwUsWattz6AZtM8hD6uKy6v+fPHQ?=
 =?us-ascii?Q?bf2FWGgh/3LtoBHX7npPLILpqDhNjeMu8mPs8Mu2h8hCn/3rroiyMNIFrUG6?=
 =?us-ascii?Q?xgpzLAqKKFFmxhD6dTUbH/ppLX8jS9XaxThmOLz0KBrSl3J3NXpBtmzYbi5q?=
 =?us-ascii?Q?f8WjyqESisqdCDcc/H4/tavp/Zg1zUU5dyfYcZukF+Kx4oMYFZI1I8C4IZ50?=
 =?us-ascii?Q?lzywEFImDnTmLuM97ucKO3djnNpWV8eKAs2k8K8bJ7AnZjoh5WlDJQ/1u50g?=
 =?us-ascii?Q?nyfRAhZ9W8op71N4OU1OISlojzeP+99NmLcNGq7UwWxvTi4TZNTy/DTpwmQm?=
 =?us-ascii?Q?Etz/BEpF49ZEqCL927sibmKS0syU+nKqPqFvBCiJ34piLehHso/WcaYiWfs1?=
 =?us-ascii?Q?54YnmxL2VR8iXM0eaQ9ogtXxsCxjxrMclPZXW814/xJSjwGG0M/U0+B6XHH4?=
 =?us-ascii?Q?hdMvZE9wbOCXQhaNHaObc576VX6N6Raf2n+P0vkOkR4YlcLIPgTXDgw2udcx?=
 =?us-ascii?Q?EIyDcrfu6a2HcxquLll9lRZpBPqy9zPixpBl7vOE8kH7aW78kY/K4y87E02O?=
 =?us-ascii?Q?12JmEvoyhiNo/urfp2+cUC8KGxNRr0XR+qmiEFiZN3dpEWZWR7TJX7y9pgSA?=
 =?us-ascii?Q?AMoNNhv9eN4e1+PWRoBtCGVJgzyyjRlgIAs56qexWC/ImBEid5I1moeu/pnc?=
 =?us-ascii?Q?yGI4i03vW6xP2PNx6oDa0LV8HTKPLTYGqpLEefS761R32vIHCqx4H6M9Wie3?=
 =?us-ascii?Q?qgIHot2N5W47tSD3TCdxyMlbvDYVBwA4gBGnZxPXvOjMlKMC7HwuMHxyzMjC?=
 =?us-ascii?Q?Mwxh0MIvKGPaqHU3kjD92KRtRCIzPBvevmuGND2uNdv9u4HT9rNfltGMyWn9?=
 =?us-ascii?Q?vNaXUA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mOU8ZwLOiXMTD2OVkMiNAWKQkftY535OQ7s87e+nde3u0cGDzRtrdsBZ3bpPekaVtk3iBIrfINvnP5Yvk2z27W2dU4CeUc9yPsylieu9BxrRAU6HqQ++sd61PQqE+FOzK9L0xDCKChxH3ZjCJJEDhggkXki03MthGzehztIjXZsi10eQTCVCVpT3TSwiOoQ/vgjpGic2OCJucmpEixvAywrII063HfI5u4g+GOYx/JnXQt16NiXZH66eWaF8+ugjzyRcWJc4No36AyRL3F7/tX0E++uFBXDM8V64rbXFIh9zjvDDosG5NA/AL7RHjkKCIhswhYvMBq1Q5Xrk5LXTb2sd0WZTj1vi9bi6ZuIBjR+rG0aJWG86NBNbqHER4fdQX4sRJxZ0hgVxaTfQwhdgdyk1M0nGZIYJzx0Jo85d1fEGJRmYWQlB4scsZuClcQyo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:16:00.2937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19df79fb-40a1-4c05-7243-08de659b0489
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 00CD61001F9
X-Rspamd-Action: no action

This enables very aggressive DCE passes on single-vendor builds in later
patches, as it will allow most vendor checks to become statically chosen
branches. A lot of statics go away and a lot more inlining will be allowed.

A prerequisite for such optimisation is to expand Kconfig to have the
full set of vendors. Adds Hygon, Centaur, Shanghai and the unknown-vendor
path. Have Hygon select AMD, and Centaur|Shanghai select Intel.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
rfc -> v1:
  * s/depends on/select/
  * s/UNKNOWN_CPU/UNKNOWN_CPU_VENDOR/
  * Removed "if unsure, say Y"
---
 xen/arch/x86/Kconfig.cpu  | 43 +++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/cpu/Makefile |  6 +++---
 2 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
index 5fb18db1aa..f895cfe97a 100644
--- a/xen/arch/x86/Kconfig.cpu
+++ b/xen/arch/x86/Kconfig.cpu
@@ -19,4 +19,47 @@ config INTEL
 	  May be turned off in builds targetting other vendors.  Otherwise,
 	  must be enabled for Xen to work suitably on Intel platforms.
 
+config HYGON
+	bool "Support Hygon CPUs"
+	select AMD
+	default y
+	help
+	  Detection, tunings and quirks for Hygon platforms.
+
+	  May be turned off in builds targetting other vendors.  Otherwise,
+	  must be enabled for Xen to work suitably on Hygon platforms.
+
+
+config CENTAUR
+	bool "Support Centaur CPUs"
+	select INTEL
+	default y
+	help
+	  Detection, tunings and quirks for Centaur platforms.
+
+	  May be turned off in builds targetting other vendors.  Otherwise,
+	  must be enabled for Xen to work suitably on Centaur platforms.
+
+config SHANGHAI
+	bool "Support Shanghai CPUs"
+	select INTEL
+	default y
+	help
+	  Detection, tunings and quirks for Shanghai platforms.
+
+	  May be turned off in builds targetting other vendors.  Otherwise,
+	  must be enabled for Xen to work suitably on Shanghai platforms.
+
+config UNKNOWN_CPU_VENDOR
+	bool "Support unknown CPU vendors"
+	default y
+	help
+	  This option prevents a panic on boot when the host CPU vendor isn't
+	  supported by going into a legacy compatibility mode and not applying
+	  any relevant tunings or quirks.
+
+	  Not selecting this options while selecting multiple vendors doesn't have
+	  any major effect on code size, but selecting a single vendor with this
+	  option cleared produces a much smaller build.
+
 endmenu
diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
index 7cfe28b7ec..84b060aa41 100644
--- a/xen/arch/x86/cpu/Makefile
+++ b/xen/arch/x86/cpu/Makefile
@@ -3,13 +3,13 @@ obj-y += microcode/
 obj-y += mtrr/
 
 obj-y += amd.o
-obj-y += centaur.o
+obj-$(CONFIG_CENTAUR) += centaur.o
 obj-y += common.o
-obj-y += hygon.o
 obj-y += intel.o
+obj-$(CONFIG_HYGON) += hygon.o
 obj-y += intel_cacheinfo.o
 obj-$(CONFIG_INTEL) += mwait-idle.o
-obj-y += shanghai.o
+obj-$(CONFIG_SHANGHAI) += shanghai.o
 obj-y += vpmu.o
 obj-$(CONFIG_AMD) += vpmu_amd.o
 obj-$(CONFIG_INTEL) += vpmu_intel.o
-- 
2.43.0


