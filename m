Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILv0Od4Thmm9JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347B6100237
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223517.1531026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVJ-0007Os-Ah; Fri, 06 Feb 2026 16:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223517.1531026; Fri, 06 Feb 2026 16:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVJ-0007Lq-6F; Fri, 06 Feb 2026 16:16:21 +0000
Received: by outflank-mailman (input) for mailman id 1223517;
 Fri, 06 Feb 2026 16:16:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgBG=AK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1voOVI-0005HU-Ew
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:16:20 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ac786d0-0377-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 17:16:19 +0100 (CET)
Received: from PH7PR10CA0018.namprd10.prod.outlook.com (2603:10b6:510:23d::15)
 by PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 16:16:15 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::9c) by PH7PR10CA0018.outlook.office365.com
 (2603:10b6:510:23d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 16:16:08 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:16:14 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:16:07 -0600
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
X-Inumbo-ID: 2ac786d0-0377-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1KGCckWNilrQm4RVGaI03hP1mulUcxcFZILjkXzmV+rHb4q5ioMybYP1r5ZHvL8hXc4MUi3bBhmN/fz5KAEg9t4mMytkTDS6SmVwqFh21GKNM4s61YHKjCYJIFMTRaZRJ6zmD9DiCQM3GHVj3RWKBX5yESeEeZN1niLRwrHUjVGHIxmKTdz18BA+MOGhNbtOk8D+YifQ6dHhxyBayM5WB/Ym402xSzi863RckFYGTutqLyDI2lmY/P8bEk/j5ZZYDFkzRl8d6xMhguohT9L2xDkbZWnt8HgJOH5H67PwfnwSXjzaqNSwi1gnoRn4ozRn2GayA894DygtjpHswR+EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyC8/f2nPCFmUAAOBRxbvkfjjyjt5TErAPO2zi2zHVU=;
 b=JDipnWztcSch+OwxLIdWCgYD6M16lCmQ+SxQA9NCAPCQIs4GGeIQ8lzXDhtG8HL+DCdtlxfYCHjFF54HuwTWOfq1v1IRAbunp/42PVV6GkxbA67njtO8w2UKYdgCt+je3oHaHLY7xUtDJEqbZ5ZE7UmNi2nglGfEnxkRuHwVi+sP3Bdb0FPSRsjH6XHyb0W7k+zGnomVAanrnG7jPlxueiXrmndP8UVXS24Np/9XkGTwKfCLtMOnpfu7tW4El5dB3hw6bhOZ97P0C54IaSt0dvk7/kLhCBzRi3l2Ihhq8fMYhrKa7YhU1mQUwhNVuCaEqVt95921OrLvFft9+uEyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyC8/f2nPCFmUAAOBRxbvkfjjyjt5TErAPO2zi2zHVU=;
 b=0FmnseOIWwSIrtCV77BdzPTJXFE3giUkSaYYRtrnIwaOqeNMFuALXxAlX2bTY335QV3rWfsSMWdK2TC2clKQHNq79AcITXc7zjo1D6HiVUfkDUCwgL8rhTHOIFgTR/oBUR1NfS+yLevZSRmNQ4MsQ79hGTOcNiu7eVhUhXTKmT0=
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
Subject: [PATCH 08/12] x86/acpi: Migrate vendor checks to cpu_vendor()
Date: Fri, 6 Feb 2026 17:15:31 +0100
Message-ID: <20260206161539.209922-10-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ff0173-367a-4829-443f-08de659b0d31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QG6d2kZYWehmAi8WsAKvhZsqzItvDq+a/czCUFGLV7ggBmFXlc4qt6WPYx5p?=
 =?us-ascii?Q?IzrqIH70Y5r6c/X3eUtYC13aeMbEzTcxQahasDIYnwC0AZvc+T2CG6UT5cI1?=
 =?us-ascii?Q?Pmt01xLfYrnmFalOSHbOAd79oZxWAXnuJ5p5vg6zU3/PsGmdUvMwnkJaIEz2?=
 =?us-ascii?Q?ERDcZYJT6w+6xPsrLShBvWg9Zx1LKaBPHYg/F13BfUMGMQjFAEMf1/dkNPCk?=
 =?us-ascii?Q?dLfXlqcHltctOIDbOlI5oYtWti5NzzXB8Z00Flt4v90YjcaLwgDDC1EPJv8T?=
 =?us-ascii?Q?yxBX73thl5tlSek/UMCJILKXZQK/zzUK2ajVZ+pcpoNnTyGLTZYPgtrESx92?=
 =?us-ascii?Q?3/j630RQVq9VyBp3AYPYaz/omxnaMf2PM+bggpW+LF88jZvOBsxoDYww6VRW?=
 =?us-ascii?Q?6TyuXbsNkt+SEWxr56ENIIHn3yJynKCQ0WJ279FllojaBo+e81emeJMfxR7A?=
 =?us-ascii?Q?uqsJemaPRz4SH2eetxAZU6R660d14iHhJbcnPWsZ4xhA80rHk9cqECD91p2a?=
 =?us-ascii?Q?AhlU1fCvAv4eRVpjgVvbPypmRPulPtZRalkG6GJzVsfzSbcyuEZ/QZaHeTg3?=
 =?us-ascii?Q?QLC2nUzf3szHqBlzFrulHIAb2soUB49uN7hREec1CBPxxDiT3BO0YL9FFV8q?=
 =?us-ascii?Q?e3KlfjtyrfHpPocOjGctFa+LQLtEHrbEGGWNQDlOTuptVnvwl6gbk9t16ciu?=
 =?us-ascii?Q?ocEevujc7+r4qA6mUO4RJQtjd0jh9tN6hYecuSIYJODxXJGuptFiBe0hijAr?=
 =?us-ascii?Q?NzBuM0tgJULFuPhvd77Kti0P25bql7IO6+jTJNHSJOqLPFYsUDu6APWUQ4KA?=
 =?us-ascii?Q?ul8TqqvkxwiV+DMdVeT4X1FLQ4aOKBo1BFvjuSi5e3/BLrpAwJeg06dYgxrM?=
 =?us-ascii?Q?PfcsSUakUhlKsFma9dvffv4SaijjWEl3g+FEfdr6j3Zkf2YZ+FjnEXxWsNSd?=
 =?us-ascii?Q?Gw+6CNXJ5n1Fhf+cKWRsOqmLvr7z45k/rqw4aUk6lk5Z7lL/I5145jgS/7T6?=
 =?us-ascii?Q?oR1fnW0p7DjQabNI64fvc7QdMXSRdC80eUdmIe7fgk9xUGwMEyhoMsAg/bBP?=
 =?us-ascii?Q?7dCNKJr+s+2jtW/BpysDPZZPG8wEpI3JPdaRw3ehQ1IxE3yNIW5Sfb7jhF6Q?=
 =?us-ascii?Q?64iO3nEIpLxFo7U8045Sjh4YKYaWyiUVjF4Nvu6QM/Yee6c4xUE71E/euZdD?=
 =?us-ascii?Q?pgPrna/fLvokHFkwqvQHVf7RK9XPGxFASmMJ+WYcoLf8ARB6to3+udKEx/T3?=
 =?us-ascii?Q?riS8KMCzX+4iJLg2eMhYm+MHYJYevIdzLoij782pE1aAEhsaI6iJccFZ34ZR?=
 =?us-ascii?Q?JshuhMoptDKeXOh0AHlqyVgo/9xW8OGmWaPr37avBRHFfXKH3OF3sbYs4PW/?=
 =?us-ascii?Q?aL7Bwi1enRCCyEPdWYcFLsF2h6D1e04mLJRJ3PcSx9yoXbHRxM4OEcmusg/A?=
 =?us-ascii?Q?bbpTUw+6smXSGlMJy8BqE4UYlrkIcL0SwiGecLfxLT90S1Sd/SupNcHw9UqZ?=
 =?us-ascii?Q?F87tVVSZZs9VCbqvaJuXh7W22zBFIIxR3j/mJB7na9IeuqTk9qKh5bRL7zGj?=
 =?us-ascii?Q?TNcdZjWR4gI2MfPbzHB9PlZFjT3cf9voK6I2wy9Dx/EeORReuCAEIxX2b7Qo?=
 =?us-ascii?Q?O52842iLtO0FDPmbDH19TGOQr9tps1x+EwPhdD8if6r7oTpNuCZlACi0F9dp?=
 =?us-ascii?Q?Im7MMQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	idIp1cbIE7EaO73ieWsyVyhSx0ETrPq//IgIaaIupINO8eL5QkdzltnJ0Hq7BfR5/if4sQxHHsz21QhGRk8qmPu9WMvkcWXRYaRZL0rSdSnynFagnYEnI8Wc/9ytb3OLu1yhxHHbbo3laUBrGaqhYI4t6OmRJvObCwuGC63F08FOG0uh1wDDhViVffCBr7ufBo4U4GfQgzFXJoWX6sQ56VzMlrB4HX1kyg4cxhpd6DBo5FRQYuMI/zN8tuhA79ohDkN218hOUdi6+i/AGTO5ZJnIyO0zZFG2/6BZ/gwjel16yblWcfYWJtF/hQpiJErd+Gb1yH9kj5QUX4WOQuCibLiOVtKnNg94i+iF499H2t4H3z68jEdfKLfRL216MZ6Punxe8E7DadmyTdY3RQYRGMNFnQQlt/bBWL/2rKPqQO7O/PesL75ZW/NUvm5er2gU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:16:14.8060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ff0173-367a-4829-443f-08de659b0d31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489
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
X-Rspamd-Queue-Id: 347B6100237
X-Rspamd-Action: no action

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/acpi/cpu_idle.c        | 16 +++++++---------
 xen/arch/x86/acpi/cpufreq/acpi.c    |  2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c |  3 +--
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 0b3d0631dd..0a49b2730b 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -178,7 +178,7 @@ static void cf_check do_get_hw_residencies(void *arg)
     struct cpuinfo_x86 *c = &current_cpu_data;
     struct hw_residencies *hw_res = arg;
 
-    if ( c->x86_vendor != X86_VENDOR_INTEL || c->x86 != 6 )
+    if ( !(cpu_vendor() & X86_VENDOR_INTEL) || c->x86 != 6 )
         return;
 
     switch ( c->x86_model )
@@ -915,8 +915,7 @@ void cf_check acpi_dead_idle(void)
             mwait(cx->address, 0);
         }
     }
-    else if ( (current_cpu_data.x86_vendor &
-               (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
+    else if ( cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON) &&
               cx->entry_method == ACPI_CSTATE_EM_SYSIO )
     {
         /* Intel prefers not to use SYSIO */
@@ -1042,8 +1041,8 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
     flags->bm_check = 0;
     if ( num_online_cpus() == 1 )
         flags->bm_check = 1;
-    else if ( (c->x86_vendor == X86_VENDOR_INTEL) ||
-              ((c->x86_vendor == X86_VENDOR_AMD) && (c->x86 == 0x15)) )
+    else if ( (cpu_vendor() & X86_VENDOR_INTEL) ||
+              ((cpu_vendor() & X86_VENDOR_AMD) && c->x86 == 0x15) )
     {
         /*
          * Today all MP CPUs that support C3 share cache.
@@ -1059,7 +1058,7 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
      * is not required while entering C3 type state on
      * P4, Core and beyond CPUs
      */
-    if ( c->x86_vendor == X86_VENDOR_INTEL &&
+    if ( (cpu_vendor() & X86_VENDOR_INTEL) &&
         (c->x86 > 0x6 || (c->x86 == 6 && c->x86_model >= 14)) )
             flags->bm_control = 0;
 }
@@ -1421,7 +1420,7 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
     case 0x1a:
     case 0x19:
     case 0x18:
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_HYGON )
+        if ( !(cpu_vendor() & X86_VENDOR_HYGON) )
         {
     default:
             vendor_override = -1;
@@ -1648,8 +1647,7 @@ static int cf_check cpu_callback(
         break;
 
     case CPU_ONLINE:
-        if ( (boot_cpu_data.x86_vendor &
-              (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
+        if ( cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON) &&
              processor_powers[cpu] )
             amd_cpuidle_init(processor_powers[cpu]);
         break;
diff --git a/xen/arch/x86/acpi/cpufreq/acpi.c b/xen/arch/x86/acpi/cpufreq/acpi.c
index d0ca660db1..a5e5c223b3 100644
--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -454,7 +454,7 @@ static int cf_check acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
     /* Check for APERF/MPERF support in hardware
      * also check for boost support */
-    if (c->x86_vendor == X86_VENDOR_INTEL && c->cpuid_level >= 6)
+    if ((cpu_vendor() & X86_VENDOR_INTEL) && c->cpuid_level >= 6)
         on_selected_cpus(cpumask_of(cpu), feature_detect, policy, 1);
 
     /*
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 4ee03ecc65..d731a21644 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -246,8 +246,7 @@ __initcall(cpufreq_driver_late_init);
 int cpufreq_cpu_init(unsigned int cpu)
 {
     /* Currently we only handle Intel, AMD and Hygon processor */
-    if ( boot_cpu_data.x86_vendor &
-         (X86_VENDOR_INTEL | X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    if ( cpu_vendor() & (X86_VENDOR_INTEL | X86_VENDOR_AMD | X86_VENDOR_HYGON) )
         return cpufreq_add_cpu(cpu);
 
     return -EOPNOTSUPP;
-- 
2.43.0


