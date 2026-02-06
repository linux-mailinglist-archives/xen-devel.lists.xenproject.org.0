Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGdXKd0Thmk1JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097CF10021B
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223510.1530963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVA-0005bV-HE; Fri, 06 Feb 2026 16:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223510.1530963; Fri, 06 Feb 2026 16:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVA-0005Xt-Bn; Fri, 06 Feb 2026 16:16:12 +0000
Received: by outflank-mailman (input) for mailman id 1223510;
 Fri, 06 Feb 2026 16:16:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgBG=AK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1voOV8-0005HV-Ac
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:16:10 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25aefbdc-0377-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 17:16:09 +0100 (CET)
Received: from SA1PR04CA0011.namprd04.prod.outlook.com (2603:10b6:806:2ce::18)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 16:16:04 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::d6) by SA1PR04CA0011.outlook.office365.com
 (2603:10b6:806:2ce::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 16:16:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:16:04 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:16:02 -0600
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
X-Inumbo-ID: 25aefbdc-0377-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFPY+Yq2iuGVCGcFbOJuvZxJKLYGvnkyKu68D+b+vvLOCysMYFzx/5i1T7HjP4snkEAVIUBvtGuUHtzGNk8F5NK+jZjhjt8s5R5lxSd6w9x/Cb8NAUdG/1XU92/FLSylmGJul9uguBFJmcFlt28KgjqKLhIz8xvPGfQNo+xZ/hhAVfGU60iBETa7gSm3Z0WI38R8Z8vKPCo8GwWhBDHfXD5aTflcRVDyKh+pEkvoNl6N0v93MzWQJKwKUhe4yiDQDoqI1+xGN1PjbZnq2Fc38mfa/E/8+SfBCA+HLoktSusw1jtkXFmZR0mKec4J4FcIo7R1eDpmbycDRbWh9TnL4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YP+tIwhw5jxaGWVsbf50GL1A5iL5JpmAlXqycfYObto=;
 b=LhTWEkJh8xyDTS/LnbtrUYh8I0s0s28pRZ0owrd250r68bHEcTvdEIGAUBvilwYVm/JxKTJ071O6J4EL3vw6CZfwP3h1YzTaWHZn5m8pliSRh33RcSrk1Lfq4ajN8WMprwsFtvFIlPZ53am4PDt4W5dvAvwONxCiGsSl3G6kFCiOXAWHi6xtvOgJ+MeEP6OzjPzs3SkBn1qsrAAxX10KZfbUL3YUPyoDIkyV3Ll4qI7mw1kO6m+yX5USbI+FEjvbN4MVz/x7NObNmPRd1Cpv7z9L0G8zh3/K8PvfPhUmYcB4sR7npcoshV4r/HaOvbaupUuDJrbaeQuc8NdBM4MVtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YP+tIwhw5jxaGWVsbf50GL1A5iL5JpmAlXqycfYObto=;
 b=hy7KN+A9z15EfVPw8vx/K1qQ8AhP84qr7X0Dc6aSdpOoFVsp5yNgxzxfkhSQ0M5oe+qs5E4RRh4lHoTgNe4y1WwImqW0QTOBCMi+S/AFHLqIzjZbWnyo8oa+jij8TXGBUKBeF5CDiIi4y4SlM5kfUSXvv9PXv/j5FiBxK6f9RkM=
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
Subject: [PATCH 05/12] x86: Migrate spec_ctrl vendor checks to cpu_vendor()
Date: Fri, 6 Feb 2026 17:15:27 +0100
Message-ID: <20260206161539.209922-6-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c72a1d6-961c-4d98-fe78-08de659b06c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XwxmNnIoYzGPImCyyC+6VqnvgczSz/ktuISLVf6Ouz/iWn1TD8i1wBkN9DLq?=
 =?us-ascii?Q?MQbJka8jnmCliLuUGb0Lo9StNv6aRx9R2rG1PCm6b9GcsDA64e4G/mfjSBD3?=
 =?us-ascii?Q?dzWwQg6z1B5ZHqLhnEggj+2DDbGSWywproXQ7II0ur1/7EPXXVz8OnxV4WSz?=
 =?us-ascii?Q?FTxS63Sz8YE/MsckXFHG42bqm3zEZ+btl9EgLKb2xt/SWhzT8PkUSgi3+MLy?=
 =?us-ascii?Q?kkaAhDt8nmk7o4O/pYeSVdqg38WbwU74fXTOuBh2eYDI0KXgMkDIz7KiQEFM?=
 =?us-ascii?Q?sHPlX3/8rNJPdOdTPusez3U+g2pyEfjMndoQD3Zq1lW6QPyx4VR0yPGSNs3D?=
 =?us-ascii?Q?efrRmAQTB8+m8UHXP+UImcjCqve4OMgfbxO/sD40XpOLYN/2BlUb5f99qvbo?=
 =?us-ascii?Q?9VaDSj2eTAOLqCF2JbhvYCLapWid0Xeo8JkspGR5bXuBckZBGBo783dGnHGn?=
 =?us-ascii?Q?1VJdXXPRZ8rXjXcHkv45CV93Hgdy6+O0+C5voPz1dMWhOqjb+Iy43+wQjFz1?=
 =?us-ascii?Q?iAFNq3XwCj6J6Ra5SEfYe391RJxZua7DcDBsaOinbUh2s7arC++ADb/32PTy?=
 =?us-ascii?Q?gmBTpBAcNGdlq+RALJG6bUv4qCGTgWyM2xE2oNFXOs946BomUbjlKqYyUzwk?=
 =?us-ascii?Q?9eVezztFnq+nwmMQYLpvOc0Pllh1cZBGfsterDn8RVZOJvpCPIex0k80RTDF?=
 =?us-ascii?Q?sn6GCjTehGL4ZjnW1Aacm9+kDQsbsy3d2a7kPQR/9HK5U9vdsO2kKqfDw8X+?=
 =?us-ascii?Q?hOAv8olp7WsTexdwb+RQeJHu80opXywuPZQqNjc2Uy+mNYPG7KMN74aqOXii?=
 =?us-ascii?Q?a7OhnJryTGIjJSQo7eAwbnfQ98AJ+xESRB0vKuXgGYGGZ9B5NZOEV+bBhrVB?=
 =?us-ascii?Q?dEfmx9moPe6GiBhPDsTugqYl3kIUvT/og44XSXClyu8ZngTk1r6O2S68zkPq?=
 =?us-ascii?Q?7pf+Hkh1dSgvyD6N8LkIIrtDB3b09uXJe0sI0f4/G/ZhMWlvV04Y6ftUl5m8?=
 =?us-ascii?Q?Uc17vymN+2lV+z/vQVAqEOuS/oi5CBwbTuuCoOUTO4Y453kAR7C9zjlM513j?=
 =?us-ascii?Q?O/Cir9Jvs7uD1EL1PhpWLD4yeGEcNZ8EuP+QabnF9fhPjFHQgWDAEeGCe1Ee?=
 =?us-ascii?Q?d4+8gxMlNv+m41HwsgdoN9McJf6Uqki30Z2ep31vS5fDjBQ+gJiGrfAPvif0?=
 =?us-ascii?Q?oZxv9GgiEBKk3Cwy370mMXWfzL1xdeL/PhwfLf+/A4qlasHNrqg62/FCg8rX?=
 =?us-ascii?Q?5FeCA52RE/huV7E0W0Lw0pTmrnqEfRRys5oYd0qN6jAVOMzjjWMsHANQT/XZ?=
 =?us-ascii?Q?ODicbSpb2JfEyeGxTuurX7TUgTTt8PbmXRGIxKk0HY0Im8IQqWgzjWQYQ43Z?=
 =?us-ascii?Q?A+BCLfSFnXaR2y23TXEf1dFtbsuXBVhQzT8+8EJaDFuRcK34OSrdeoAMouHU?=
 =?us-ascii?Q?R/9DcCMU3BWbAkIXIKF8yn8xcCvxNWu1YGa7QQGBmi9xY72b/Ks0kwhf5Xdl?=
 =?us-ascii?Q?1rUACWDq7m1tuqSAMBJmoSt8y+g6954GlgbbR0NSIn/aUPfZLoucsmFE2Sud?=
 =?us-ascii?Q?pYp7N+Sq7fNZoZl1lTawV3CpTmhlgvMLFXd8oPd+8rdiBzOuIQkhUX0AMozv?=
 =?us-ascii?Q?5dpzWBQmaRyBwFi6hq8yrWMycrhiA/89xE2K/uqqnUjUC6jqC9azLjMZQs6I?=
 =?us-ascii?Q?t9/ZjA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mq8xoaZmAGblaIWjy9T6IzYe0RdEQVSP/o6xT6+StldA+OfQw30jYq7Hixz6X4mjYLBOONJmU70iOr75/G9sqc9Trfkl9/Z9NsD/JhD/nk3m3r09ORsBFMyf8rI1vJ82EcZcoCPIBifZUDKdYBMtm7FCUILgBQIrpcfGhJfCM7Noca/Kgnxzl80+ASs8Eg26a+YZKXYSHRGx7H0DPfCNtOS+8YdmeEQDLiJ9a2q5vUZK9QY8P7ywYbqO8NkvtNk01e/ciPOtkin4su3zsNkBOY6aJdRCxKfqwyfnbQAzFDrL0fXLqiUGXw2I/D4pBrkg/9SGCHOQ9hGZUg1iWWXNHeJWiPD7LYxRClbj5I1UrQxUBL0Sxr4aU+vigGga5WRSK93gzqmXlzEK8gHStqe9P4F9Z2wZeHAx60mA6lQEX7mP/8+izds2hTB66LuCp47h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:16:04.0467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c72a1d6-961c-4d98-fe78-08de659b06c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726
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
	NEURAL_HAM(-0.00)[-0.988];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 097CF10021B
X-Rspamd-Action: no action

This is the file with the most dramatic effect in terms of DCE, so
single it out here.

On an AMD-only build:

  add/remove: 0/1 grow/shrink: 0/5 up/down: 0/-2968 (-2968)
  Function                                     old     new   delta
  opt_gds_mit                                    1       -      -1
  symbols_offsets                            30776   30772      -4
  symbols_sorted_offsets                     60712   60704      -8
  parse_spec_ctrl                             2321    2307     -14
  symbols_names                             108031  108016     -15
  init_speculation_mitigations                9714    6788   -2926
  Total: Before=3876849, After=3873881, chg -0.08%

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/spec_ctrl.c | 42 ++++++++++++++++------------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index dd0413e1fc..246d8895f1 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -388,7 +388,7 @@ int8_t __ro_after_init opt_xpti_domu = -1;
 
 static __init void xpti_init_default(void)
 {
-    if ( (boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
+    if ( (cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
          cpu_has_rdcl_no )
     {
         if ( opt_xpti_hwdom < 0 )
@@ -712,7 +712,7 @@ static bool __init check_smt_enabled(void)
      * At the time of writing, it is almost completely undocumented, so isn't
      * virtualised reliably.
      */
-    if ( boot_cpu_data.vendor == X86_VENDOR_INTEL &&
+    if ( (cpu_vendor() & X86_VENDOR_INTEL) &&
          boot_cpu_data.family != 0xf && !cpu_has_hypervisor &&
          !rdmsr_safe(MSR_INTEL_CORE_THREAD_COUNT, &val) )
         return (MASK_EXTR(val, MSR_CTC_CORE_MASK) !=
@@ -738,11 +738,10 @@ static bool __init retpoline_calculations(void)
     unsigned int ucode_rev = this_cpu(cpu_sig).rev;
     bool safe = false;
 
-    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    if ( cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
         return true;
 
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.family != 6 )
+    if ( !(cpu_vendor() & X86_VENDOR_INTEL) || boot_cpu_data.family != 6 )
         return false;
 
     /*
@@ -938,8 +937,7 @@ static bool __init retpoline_calculations(void)
  */
 static bool __init rsb_is_full_width(void)
 {
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.family != 6 )
+    if ( !(cpu_vendor() & X86_VENDOR_INTEL) || boot_cpu_data.family != 6 )
         return true;
 
     switch ( boot_cpu_data.model )
@@ -966,8 +964,7 @@ static bool __init should_use_eager_fpu(void)
      * Assume all unrecognised processors are ok.  This is only known to
      * affect Intel Family 6 processors.
      */
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.family != 6 )
+    if ( !(cpu_vendor() & X86_VENDOR_INTEL) || boot_cpu_data.family != 6 )
         return false;
 
     switch ( boot_cpu_data.model )
@@ -1033,7 +1030,7 @@ static bool __init should_use_eager_fpu(void)
  */
 static void __init srso_calculations(bool hw_smt_enabled)
 {
-    if ( !(boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+    if ( !(cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
         return;
 
     /*
@@ -1099,7 +1096,7 @@ static void __init srso_calculations(bool hw_smt_enabled)
  */
 static bool __init has_div_vuln(void)
 {
-    if ( !(boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+    if ( !(cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
         return false;
 
     if ( boot_cpu_data.family != 0x17 && boot_cpu_data.family != 0x18 )
@@ -1137,7 +1134,7 @@ static void __init ibpb_calculations(void)
         return;
     }
 
-    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    if ( cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
     {
         /*
          * AMD/Hygon CPUs to date (June 2022) don't flush the RAS.  Future
@@ -1222,8 +1219,7 @@ static __init void l1tf_calculations(void)
     l1d_maxphysaddr = paddr_bits;
 
     /* L1TF is only known to affect Intel Family 6 processors at this time. */
-    if ( boot_cpu_data.vendor == X86_VENDOR_INTEL &&
-         boot_cpu_data.family == 6 )
+    if ( (cpu_vendor() & X86_VENDOR_INTEL) && boot_cpu_data.family == 6 )
     {
         switch ( boot_cpu_data.model )
         {
@@ -1358,8 +1354,7 @@ static __init void l1tf_calculations(void)
 static __init void mds_calculations(void)
 {
     /* MDS is only known to affect Intel Family 6 processors at this time. */
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.family != 6 )
+    if ( !(cpu_vendor() & X86_VENDOR_INTEL) || boot_cpu_data.family != 6 )
         return;
 
     /* Any processor advertising MDS_NO should be not vulnerable to MDS. */
@@ -1469,8 +1464,7 @@ static __init void mds_calculations(void)
 static void __init rfds_calculations(void)
 {
     /* RFDS is only known to affect Intel Family 6 processors at this time. */
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.family != 6 )
+    if ( !(cpu_vendor() & X86_VENDOR_INTEL) || boot_cpu_data.family != 6 )
         return;
 
     /*
@@ -1535,7 +1529,7 @@ static void __init tsa_calculations(void)
     unsigned int curr_rev, min_rev;
 
     /* TSA is only known to affect AMD processors at this time. */
-    if ( boot_cpu_data.vendor != X86_VENDOR_AMD )
+    if ( !(cpu_vendor() & X86_VENDOR_AMD) )
         return;
 
     /* If we're virtualised, don't attempt to synthesise anything. */
@@ -1659,8 +1653,7 @@ static void __init gds_calculations(void)
     bool cpu_has_bug_gds, mitigated = false;
 
     /* GDS is only known to affect Intel Family 6 processors at this time. */
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.family != 6 )
+    if ( !(cpu_vendor() & X86_VENDOR_INTEL) || boot_cpu_data.family != 6 )
         return;
 
     cpu_has_bug_gds = cpu_has_gds();
@@ -1754,8 +1747,7 @@ static void __init gds_calculations(void)
 static bool __init cpu_has_bug_bhi(void)
 {
     /* BHI is only known to affect Intel Family 6 processors at this time. */
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.family != 6 )
+    if ( !(cpu_vendor() & X86_VENDOR_INTEL) || boot_cpu_data.family != 6 )
         return false;
 
     if ( boot_cpu_has(X86_FEATURE_BHI_NO) )
@@ -1878,7 +1870,7 @@ static void __init its_calculations(void)
         return;
 
     /* ITS is only known to affect Intel processors at this time. */
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL )
+    if ( !(cpu_vendor() & X86_VENDOR_INTEL) )
         return;
 
     /*
@@ -2181,7 +2173,7 @@ void __init init_speculation_mitigations(void)
          * before going idle is less overhead than flushing on PV entry.
          */
         if ( !opt_rsb_pv && hw_smt_enabled &&
-             (boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
+             (cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
              (boot_cpu_data.family == 0x17 || boot_cpu_data.family == 0x18) )
             setup_force_cpu_cap(X86_FEATURE_SC_RSB_IDLE);
     }
-- 
2.43.0


