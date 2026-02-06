Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OTQIN0Thmk1JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3593010021C
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223518.1531037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVK-0007hy-PA; Fri, 06 Feb 2026 16:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223518.1531037; Fri, 06 Feb 2026 16:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVK-0007c1-Jm; Fri, 06 Feb 2026 16:16:22 +0000
Received: by outflank-mailman (input) for mailman id 1223518;
 Fri, 06 Feb 2026 16:16:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgBG=AK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1voOVI-0005HV-P9
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:16:20 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b34ac77-0377-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 17:16:20 +0100 (CET)
Received: from PH7PR10CA0009.namprd10.prod.outlook.com (2603:10b6:510:23d::29)
 by PH8PR12MB7134.namprd12.prod.outlook.com (2603:10b6:510:22d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 16:16:13 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::10) by PH7PR10CA0009.outlook.office365.com
 (2603:10b6:510:23d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 16:16:08 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:16:10 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:16:06 -0600
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
X-Inumbo-ID: 2b34ac77-0377-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izP9oK2J4DMFiOFY5a56QNBEog9cSEpiu768GoEa0XgRENYbWqD77G7FMi8S+V3uq282wbv/+AwQMtE3VX9kXvXpPXVOIQ0DIpONsoX0RnKDkTrtnXy2aWvsiF+Ua3xy1T8lltDJzcLEQWaoVGY/gRejtK21lJdfltFcFR8nbje0edvkwdCgqe0pO6QKDwjhY4zG8FhKGkM29w8+E0/NSOqQ9rbCDnvi2lr8AszOu7Uj4MZJ0DztmMTFE4v32EXNGcud6kwNZNY4MGg0V+VQvz8UdYBSx89kihCCRvKChja5ksUzJbmdyLT0ApfL6VuC67oEms4ZtGHHUV1cF97Afg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+acfGxRyaaJDoExPDPojLHYDy13h9jJLSyZO4Cf1eQ=;
 b=O4P3DV4QpjmDOSPOtYhSoyzpCrPnva5bGfbbgASKkmT1i+CeWEXNQQ/f3SLDPvObuNWNguTn67qLrd+qEO5eJl4jiImzUkbdk36k+QYPWy38mC206+hTx8ZpxylTGBZQuuHTwkt/sbqo7O07RPRsamPI/HQWg4TE2NfvFb7x4BzwnL9uHAlJsfoRVls+zxnusOnVU230RyTHNXLrODMoc+C3U0RGdoX0mCcFU4bn5n380pSlXqZHHFzTOk0mDg6W/Qa8NlahQlqc9MwOeB3HTWOxkGv2DvRPGlKI6eSTS8xVaBBg5MQQ1uoyILU4DN8POd7JyiETfcQ/1awz2W9TTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+acfGxRyaaJDoExPDPojLHYDy13h9jJLSyZO4Cf1eQ=;
 b=ZVv+y4Po8q8/qMMJghD34jftU8npjXDRRoeVZ10a+H6rHAvfz9/NUGMVH3sx8nqAEI4/0w/E1Udl3GIzz4JpqLtWVOtRRdGKYkC2lOrgjmMphsFVZSIVqJtpF2s5oOEiR+cmF61D1qtrM0HR4h9itUwXUr7pDcylsDhoy9XUPg4=
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
Subject: [PATCH 07/12] x86: Migrate x86_emulate/ to use cpu_vendor()
Date: Fri, 6 Feb 2026 17:15:30 +0100
Message-ID: <20260206161539.209922-9-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|PH8PR12MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c258cd-a416-45ba-29d4-08de659b0b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+eBPA5U5licDCP/zOgvmX02RaBianYb1r/2/MFr+sRX7b2XFSlh+3701+N3y?=
 =?us-ascii?Q?8qfnUKD6nly7D141hWP556pcBt8eQeIi6WrVqWmfP/dUAV4FpSVLnHiIm18h?=
 =?us-ascii?Q?0KiC2ZvQQ5rVV85Z/Ko7EUzFImTLKyaPc5p0RRTxcxDx8hfU+CoaCk05vysv?=
 =?us-ascii?Q?squKLd7Eadyq5cSCWrDwgvh1VAclTsmXn7X/kmDphUO2UAvpiAN9YthISUVv?=
 =?us-ascii?Q?FYCdMX6GY3M0OLWz4fThpV3jiiiJeVoHVfHy/RwSWUbWIli6+9/8XUfQJNnL?=
 =?us-ascii?Q?R7P67luer3QZ707Wb3DDDrDNxSVF7Fs8bU6E96F6C0TlAqFzFtt4WN5lyRhE?=
 =?us-ascii?Q?rTlxDAzI4qwGWR3fEE3eewMW+R7bEM/2O8MvOAGuS9PuJL3valci44s1W53V?=
 =?us-ascii?Q?H4tkfR6TW/Z2coe3rBgu3UKuh+IFTCuSYmoulUDf4tCapvwVqg8zCxjCfriE?=
 =?us-ascii?Q?QVlsIGW766PGu14QEz3WvD8ywBnLB3iAuXInXTjJulPnyBUz+YPsmhKMQTS1?=
 =?us-ascii?Q?bKeyeuuaGwFwwQuLZKma3vgFSqn64T5vWFxqcHZtNQqkLaZWO6AccjCHAwkZ?=
 =?us-ascii?Q?lvNkU0N6Vsv5eXjM28HSz8cpJSrlEOErgYBLzBEHaQncQ8mg7iydJY6MdJjp?=
 =?us-ascii?Q?vq2IG4uVPQv6TE0CLEz2I5mutjM1dVJnJbjxUmEESaeXJNlF44vyzAFGujAZ?=
 =?us-ascii?Q?C/ff7by9gvacwGpOp6I/I1+gUAnvtH5Dy8BCoHinxEvYpJravAp51sURDEZd?=
 =?us-ascii?Q?lCTtPajOiTJq8eXSTH6TICWZVGScvnckEgegRhsDDJ8/i7zrS+CiETa2s05l?=
 =?us-ascii?Q?8hbySMocta1dTtoRcLmiqVdsGjsASXF4WqVHFZrRPnIfNXt/NCzadsA20OXP?=
 =?us-ascii?Q?WkY9feuZFUZeLWv6uUuMiohTwyiCGGreCHvCq804np+htzS9/2s/D3MwFOMD?=
 =?us-ascii?Q?qKfol49PssSalG3KC+hayLNQJCS2lufs3DG+HvHiZOD8QBwWylcbCf/566nU?=
 =?us-ascii?Q?ZO3/vo0msZpxm4lByWTHFH8McAnBxb0Yuxu0/ZuBsQtICOaWLVuRm4Ep7Chv?=
 =?us-ascii?Q?OFEgp8vQiE2i66vdogzWwb9XAMnTFuNBUWCNvGiIvnpFsOeBiTDFMN11DJWe?=
 =?us-ascii?Q?7wGHC6uiMQVp/lI3qm4sC177F+rlu+B0JDK5jLDmyOmJEvNKQdi/iY/xAd2l?=
 =?us-ascii?Q?gU1zqex6dFCkQesGvTpabpY7ziwlOv+MYhO1DyESaR2rmnKe1a2rxp/cY6/c?=
 =?us-ascii?Q?358IDa9cfBWwM3u9XFV/5ajAQOOD7Yb4aMwRXgGH4CENrKMxd11hiTYjJJU+?=
 =?us-ascii?Q?SI7Tm23+5phk+YPyv8cNAC4RXUraXiWB7/2a0AvtqeZv7GajM85OfMBiUZhb?=
 =?us-ascii?Q?UaX5rR5D6bCwk1epzHBWcKxDqyDM7v++bbT1I9dmtNrK7B0g9UKt0p6gPZrx?=
 =?us-ascii?Q?r6uQ4Cln+nRcI7YyY83dxK8FqY8hbF+wV1zB/wZ1xzutlJJR+C4mXUs4rIDd?=
 =?us-ascii?Q?a0CtfsD+oxbpwybSR3ES8rkvKaUco1bH6XBfROg987ZPKWkW+DPqD1ujUezV?=
 =?us-ascii?Q?QbyruG7wJXyGd9cc6grMmTqCoVyZK6q5HwgpS/H0SNFohnzb/ivfpolGey0/?=
 =?us-ascii?Q?zpO9qPzBzOgH26tfqnEhiMSEanXsW2ao0OucZjvngLGYhhDs982UEL7ofIl5?=
 =?us-ascii?Q?CPuxkg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xEWEVsDR1O0WomhyqARWSkcxVb7YvGxGUvZv3ocQAruUdKkPhkti2g6CD60bx3DwDH9nzWPe/1cfE9QrlnEELErnQSdSDfg86kgdAOmFiZ+Y7eSdN+Pv5kaFQSqOxXWimCjfMvhmhO29nZ/14+xdfhdP+r5nyQ9sB6QmqldBe+wFqthYijs13DSp0jQ6aUdtfyi6T8aQRCRD2LngrIUNZdHMGXJkJxEiDecxNUQjH2n7nosANGJHDxXPcp5Pdtgo4ko3HgFzXqrs+/yRupHswmaiP3iE4ds/Q2QWUIKy2Rp/nXysSehhNP3vR2zwqe5V1dabscRvnNf1qdWUKkd/JRPWygox21KC0vZ8RjHAdMDrE9EXuBk7LpI8LTXgeinHrJOn91J64R1erU4kPOVdPgqVCU5uoRnhTurvbJ3KdnvnIElItt0osKLSbsggvGeU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:16:10.9231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c258cd-a416-45ba-29d4-08de659b0b15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7134
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
	NEURAL_HAM(-0.00)[-0.967];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3593010021C
X-Rspamd-Action: no action

... but keep the current behaviour of using the policy vendor when
compiled for userspace, where cross-vendor configurations are expected.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/x86_emulate/private.h     | 6 +++++-
 xen/arch/x86/x86_emulate/x86_emulate.c | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index 24c79c4e8f..1b6fc48ab6 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -15,6 +15,7 @@
 # include <xen/kernel.h>
 
 # include <asm/cpu-user-regs.h>
+# include <asm/cpufeature.h>
 # include <asm/endbr.h>
 # include <asm/msr-index.h>
 # include <asm/stubs.h>
@@ -30,8 +31,11 @@ void BUG(void);
 #  define X86EMUL_NO_SIMD
 # endif
 
+# define x86emul_cpu(cp) ({ (void)(cp); cpu_vendor(); })
+
 #else /* !__XEN__ */
 # include "x86-emulate.h"
+# define x86emul_cpu(cp) ((cp)->x86_vendor)
 #endif
 
 #ifdef __i386__
@@ -520,7 +524,7 @@ in_protmode(
 static inline bool
 _amd_like(const struct cpu_policy *cp)
 {
-    return cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON);
+    return x86emul_cpu(cp) & (X86_VENDOR_AMD | X86_VENDOR_HYGON);
 }
 
 static inline bool
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 7751a67130..fcd8cbccc9 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3104,7 +3104,7 @@ x86_emulate(
          * in fact risking to make guest OSes vulnerable to the equivalent of
          * XSA-7 (CVE-2012-0217).
          */
-        generate_exception_if(cp->x86_vendor == X86_VENDOR_INTEL &&
+        generate_exception_if((x86emul_cpu(cp) == X86_VENDOR_INTEL) &&
                               op_bytes == 8 && !is_canonical_address(_regs.rcx),
                               X86_EXC_GP, 0);
 #endif
-- 
2.43.0


