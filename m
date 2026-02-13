Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id r+hWCEUpj2kPKwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:38:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907481366AF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230931.1536305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqtMw-0001hf-HO; Fri, 13 Feb 2026 13:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230931.1536305; Fri, 13 Feb 2026 13:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqtMw-0001fC-BJ; Fri, 13 Feb 2026 13:38:02 +0000
Received: by outflank-mailman (input) for mailman id 1230931;
 Fri, 13 Feb 2026 13:38:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FeGe=AR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqtMv-0001dN-5H
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 13:38:01 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34f37f2d-08e1-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 14:37:58 +0100 (CET)
Received: from BYAPR07CA0057.namprd07.prod.outlook.com (2603:10b6:a03:60::34)
 by CY3PR12MB9678.namprd12.prod.outlook.com (2603:10b6:930:101::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 13:37:51 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:60:cafe::1e) by BYAPR07CA0057.outlook.office365.com
 (2603:10b6:a03:60::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Fri,
 13 Feb 2026 13:37:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 13:37:51 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 07:37:49 -0600
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
X-Inumbo-ID: 34f37f2d-08e1-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhVkPyDXl7Z8VCbJjEt+oxoKIBCMT/ozco1rnnNTbQvAkFmFqVvOlw/8n6Bm2reZ6um6ZxLX5rgNxl8zvtwz2e5B32tgOwQwO4VXgz3eqn2IshZbRebgF2tYinB9nHhkjMv+fvT368/NlaiBjTpQTkpIC1bdRHEfAKnLy2GfPBzW+zyOL2R17Lv32Qylbr2ivhU+KrCfKg16SF7tSbFp2N2e/ikq/YhbRNkjRxmYtNePn/vh1FIYMBGqDgMaosyvXTDKX0neFHwRTGmyIdtZ0iO5qMWJqiHBqR7i+21oQU2L7f3vFGlUL6fEo2V/SqHUp9B4pl82YW7rhHTRito//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfExmNOBgyzV/W769nG2O1sMuHbppnbUF9pYKKsd9Bo=;
 b=laFjq7VPZRpck3q47GM9cPx9kfKw+R0qtkcGemVGFkTqXVOHypkUfyqSGBkhJgzS5MqFrF7cD7Q7Pi2Yx73y/nSzIu3R/CEQshgj9+EIgSwu60LOz5R1G+l9MOyKlruQS4hEadjr6SSv9iBvniicSZNpmXsKr9D1BuvBkIeW2yXC0MZChnGahHDvDe08wyEIoNNZnvOjlSgQeW9m1Abuc/QjqV6kY6dtPs28OW3I2Y8A8nAZDodNxbRNGsBmwZ9Z5AUDpHSxWyL7soSaXL+QMKVoUgQo/2/b4cV2Ftjez9qJvUOx5YHgiX+n4getAPo5tetFcCmFfd4iYeF66gG4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfExmNOBgyzV/W769nG2O1sMuHbppnbUF9pYKKsd9Bo=;
 b=Fs9MNQdiED4wvPDtIhLLyY0vPadZBz/WjwvFEz/kL4wBO28p40BcsPzID6a9zvI3tWCj0YGgIIqR9uHmOd8VSwT9EVUHdWJRA7cyt4hwqLacQMU367DXrdATbxsOFye6aAdOxrrBBySoxIPNS517+C8g1foFXGQLq4WygtSp72g=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/2] x86: Make hvm_enabled a constant unless both PV and HVM are both compiled
Date: Fri, 13 Feb 2026 14:37:29 +0100
Message-ID: <20260213133732.132326-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213133732.132326-1-alejandro.garciavallejo@amd.com>
References: <20260213133732.132326-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|CY3PR12MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: d3256332-3642-49f9-565a-08de6b051598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Edc0dVF5fTqqm9QHL3dyyrnMBvysRlRMAZYG/vSoYOUC6n207G8/eJbqmczn?=
 =?us-ascii?Q?3EO6O0GasuFwpAZIIuFSEDYfCKHi1IaesqGzVTuV2xOpfLZ9TBJz43gjvz9X?=
 =?us-ascii?Q?9QqgBcG14ei+nUt88hDSb/xen+IY3fJhMPcLaQ86I9oIMY3xVu1QBvhMt0wm?=
 =?us-ascii?Q?hN7Z5nTH1dPbY1GTgd6gGwjCh3tXm0cD2x3v4tFRU0iZDBA7kiM+btW0EJww?=
 =?us-ascii?Q?Fo+nQz2qhGhOw6RT1T7S6jYpXCu70uT8T0V+3Ar8DYO8KD9LvFH+F1gB5aHY?=
 =?us-ascii?Q?C68+xoypE2TMnTGf/63y4BGXWE8b8eIJ5L3DIVmvbLyw9676GaFuv4ekVY95?=
 =?us-ascii?Q?/NfZogT64wnJfeRbT3GBYrQaibr5SOjxl+QcZJSZa+IJ6h6RIzeImr6GWBnq?=
 =?us-ascii?Q?LBNIf2q+FTld375A/WqnZppnaYZo/1EvpmIiVRYWu5Gn2db3J2thtrb1PvCw?=
 =?us-ascii?Q?AZtJ2X1iigYk0B0+0rvqBXlSaiSAs0vesEsUfg5n1yF/ykdaFBCNBxExhYD2?=
 =?us-ascii?Q?DKiL0CYuCWojFQx3U71BHlxp47sOF1D8iS38VJ+hkhhyMum0IgV2lZ+3NDox?=
 =?us-ascii?Q?nYjy9WkLVWUeDKChe63SDjXfkZZiXTyNklAy/Cmmv7mbgCSkKjxwUInXhfMJ?=
 =?us-ascii?Q?knMwauWyF4qWkuYI8Vcl/7BZ2+qtWeiwOEr2kcr/N9VpfAgr2ANIk+asBBgI?=
 =?us-ascii?Q?0r4h/56xMOS2UsFVQKTUbKZx48iLOGfo9aAGWJOUjYy5+hcR2AwQVOuSmxy3?=
 =?us-ascii?Q?ZWii88+GcE/waYNGtoyIuGlqUqsgxzsYGRoXQX6jyTVZtb6TPOJPZqdISZVp?=
 =?us-ascii?Q?H5kKDqYmTwo7LgODTh/gFxkShdvYs1I7p9t76NYTaTjNVLvi2X1aOJe0giA9?=
 =?us-ascii?Q?nYSca/1oTM6lBpBIGmSvIMDOBZd3IVJfMSMn4Vi/UJ3L5uoU+izk6kOLyJyt?=
 =?us-ascii?Q?2kSTrVY1I0pAdfS058DY8jUL/ss0L4tRO6kMKrI8NaQWivmAKhuZOSZp7RHG?=
 =?us-ascii?Q?1eUA0oG2u1BFqQ9oueU9n1Sij7rT34ETS9BtK6RUTTj0bAL/FJrv2eQkBFgC?=
 =?us-ascii?Q?SL1HD1aMkhs9tbxK5kQkHykk2IrotmRup39FDXpV6lSI85QfXVF8ygtFSTa9?=
 =?us-ascii?Q?dLvxPijLNqOSzry4ZjbNIOxqR3HmhbI8temuPzdyLMz5V9onu5smtL5+qeTC?=
 =?us-ascii?Q?F4bOWGPStV0Zme6PEH4DXHh7lmn6NG5sCSE80yC5gOspzUOoG5IF40GMa4hu?=
 =?us-ascii?Q?9IzhlHvKWMMA6lFT1yy+sGTxQcrQ6V9ZwrCWfvJKhkqWB0F7iPY1wxG5S+6S?=
 =?us-ascii?Q?REu3Ustg53MiakvXpZgOH0FRqVuykLioYl24fFD1DEAbs+UG6Bh/kz3KzFU3?=
 =?us-ascii?Q?YVyaF+Lcx5uHypTejjAFaa+plLkyx/nEFAGQ9ECIiB9wiPsjtGaJpZGjMvar?=
 =?us-ascii?Q?WcjuApMhaJwMh1dGwxYNAY9hvSn0rRe7ozBmo9kpv3FlqTExozWcSxM/Ux4a?=
 =?us-ascii?Q?dOYnax6BEMHpz57suRom+VgEtRJ1uQQ9HEYJlNLHW6GqPrtg6xdobC9CXTZG?=
 =?us-ascii?Q?pEezTAijZ44wElGaOyhP1OaEnSSwsQm83mOk+hyjmwQHJ2s/k44OfWG6wH/m?=
 =?us-ascii?Q?rxizI19X82w6+Fea+7KMwtyq3Jt2PRGf2GbI/+r4HK4NCn+4iUb7xK7UU4tt?=
 =?us-ascii?Q?HDAfHg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7TwNE+HKVD7l5k2VWCJVXoRqRca5fcPyb2vsTcJ3VUdEqtzLsH5rcpOnGLho5oioYL0NlBugB5MwNbgvU49u3rW2cA/uPBT2TnMiDYlftndc43ImpFgztOSNxm5Ea6rPQ5uzDKNjind62RzjN6YdgDxfP/kN5sgpoentNTo+SdeanPgJ4mX2aI+lEpA/tUpOOpKoB+vMw7GErBpnIPMLkNp5xp7eUdN/3R2aKXfn01F8AN2gAMtVU8p53teRtuxB5f3nbjHsdJvq42W1ZyIRPLdVTirwH8gdzy2Z75s+FtzGdSoLUgg7cfCL4BZrAYshlEVTzVr2DK0iOJi32WJ+LFys+ztQkNwYzF3so1pIG2GClWHuUvIRWEXetAtidHLTlOzSkSVCnldjTU+YBsNkgYRTJTdGJNN7ZVhJbZAVFnqJS51apBuTXSFGsLls3cdo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 13:37:51.3166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3256332-3642-49f9-565a-08de6b051598
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9678
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	URIBL_MULTI_FAIL(0.00)[lists.xenproject.org:server fail,amd.com:server fail];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 907481366AF
X-Rspamd-Action: no action

PV-shim already has hvm_enabled optimised to false, but there's no
reason HVM-only builds can't benefit from the same optimisation as long
as we add a boot-time panic in case HVM support is missed. Many branches
go away, some in the potentially hot switch_cr3_cr4.

HVM-only:
  add/remove: 0/1 grow/shrink: 1/9 up/down: 1/-162 (-161)
  Function                                     old     new   delta
  arch_do_physinfo                              79      80      +1
  hvm_enabled                                    1       -      -1
  symbols_offsets                            30732   30728      -4
  symbols_names                             108029  108022      -7
  symbols_sorted_offsets                     60656   60648      -8
  flush_area_local                             571     562      -9
  switch_cr3_cr4                               311     300     -11
  init_xen_cap_info                             62      43     -19
  arch_sanitise_domain_config                  885     863     -22
  init_guest_cpu_policies                     1270    1247     -23
  hvm_domain_initialise                       1127    1069     -58
  Total: Before=3797004, After=3796843, chg -0.00%

With hvm_enabled const-ified, it's fine to take hvm_flush_guest_tlbs()
outside the CONFIG_HVM ifdef and remove the stub. They compile to the
same code after DCE.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/hvm/hvm.c             |  9 +++++++++
 xen/arch/x86/include/asm/hvm/hvm.h | 30 +++++++++++++++---------------
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4d37a93c57..da56944e74 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -72,7 +72,9 @@
 
 #include <compat/hvm/hvm_op.h>
 
+#ifdef CONFIG_PV
 bool __read_mostly hvm_enabled;
+#endif /* CONFIG_PV */
 
 #ifdef DBG_LEVEL_0
 unsigned int opt_hvm_debug_level __read_mostly;
@@ -173,9 +175,16 @@ static int __init cf_check hvm_enable(void)
         svm_fill_funcs();
 
     if ( fns == NULL )
+    {
+        if ( !IS_ENABLED(CONFIG_PV) )
+            panic("HVM support not detected and PV compiled-out\n");
+
         return 0;
+    }
 
+#ifdef CONFIG_PV
     hvm_enabled = 1;
+#endif /* CONFIG_PV */
 
     printk("HVM: %s enabled\n", fns->name);
     if ( !hap_supported(&hvm_funcs) )
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 7d9774df59..dc609bf4cb 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -261,7 +261,11 @@ struct hvm_function_table {
 };
 
 extern struct hvm_function_table hvm_funcs;
+#if defined(CONFIG_PV) && defined(CONFIG_HVM)
 extern bool hvm_enabled;
+#else
+#define hvm_enabled IS_ENABLED(CONFIG_HVM)
+#endif
 extern int8_t hvm_port80_allowed;
 
 extern const struct hvm_function_table *start_svm(void);
@@ -399,6 +403,17 @@ static inline bool using_svm(void)
 #define hvm_is_in_uc_mode(d) \
     (using_vmx() && (d)->arch.hvm.vmx.in_uc_mode)
 
+/*
+ * Called to ensure than all guest-specific mappings in a tagged TLB are
+ * flushed; does *not* flush Xen's TLB entries, and on processors without a
+ * tagged TLB it will be a noop.
+ */
+static inline void hvm_flush_guest_tlbs(void)
+{
+    if ( hvm_enabled )
+        hvm_asid_flush_core();
+}
+
 #ifdef CONFIG_HVM
 
 #define hvm_get_guest_tsc(v) hvm_get_guest_tsc_fixed(v, 0)
@@ -498,17 +513,6 @@ static inline void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset)
     alternative_vcall(hvm_funcs.set_tsc_offset, v, offset);
 }
 
-/*
- * Called to ensure than all guest-specific mappings in a tagged TLB are 
- * flushed; does *not* flush Xen's TLB entries, and on processors without a 
- * tagged TLB it will be a noop.
- */
-static inline void hvm_flush_guest_tlbs(void)
-{
-    if ( hvm_enabled )
-        hvm_asid_flush_core();
-}
-
 static inline unsigned int
 hvm_get_cpl(struct vcpu *v)
 {
@@ -854,8 +858,6 @@ static inline void hvm_sync_pir_to_irr(struct vcpu *v)
 
 #else  /* CONFIG_HVM */
 
-#define hvm_enabled false
-
 /*
  * List of inline functions above, of which only declarations are
  * needed because DCE will kick in.
@@ -902,8 +904,6 @@ static inline int hvm_cpu_up(void)
 
 static inline void hvm_cpu_down(void) {}
 
-static inline void hvm_flush_guest_tlbs(void) {}
-
 static inline void hvm_invlpg(const struct vcpu *v, unsigned long linear)
 {
     ASSERT_UNREACHABLE();
-- 
2.43.0


