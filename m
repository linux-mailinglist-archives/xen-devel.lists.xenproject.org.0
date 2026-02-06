Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KCnOdwThmk1JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 609061001FA
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223513.1530997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVD-0006Sm-JM; Fri, 06 Feb 2026 16:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223513.1530997; Fri, 06 Feb 2026 16:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVD-0006Mk-Bl; Fri, 06 Feb 2026 16:16:15 +0000
Received: by outflank-mailman (input) for mailman id 1223513;
 Fri, 06 Feb 2026 16:16:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgBG=AK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1voOVB-0005HU-7T
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:16:13 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25279c69-0377-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 17:16:09 +0100 (CET)
Received: from SA1PR04CA0019.namprd04.prod.outlook.com (2603:10b6:806:2ce::26)
 by IA1PR12MB7592.namprd12.prod.outlook.com (2603:10b6:208:428::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 16:16:03 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::b4) by SA1PR04CA0019.outlook.office365.com
 (2603:10b6:806:2ce::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Fri,
 6 Feb 2026 16:16:01 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:16:02 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:16:01 -0600
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
X-Inumbo-ID: 25279c69-0377-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Darwn6Xe8Zm+HyJG9J0XxvNTqFTQwD6NdUiQ0l4F4oY/3EL6L6WJ6UXakfAFfS2vGR5qzQv4mgGxueYw/B4Iky8C/JWw0YoJy3FtXO6dwvOcVK2FyLsT8FSZ7nVG8GiaWCMUFXaI7L9Crqx0is0A07plQXUrQpfaXyfuzjCQzaHM3Z5r01hM87gXo6/vsDsVeufQpX2lgDai3lXFFppu8PgF9Kyvx7Oh+AjfC4ZZHZA0A23EUDZNBzN0RxP0KLMyzjNO3oOKW5U8KKO1oGmtkcJnQtTdg5nnPCWiSPW6C1qETSxZYo4HJuYEcZDlOBNj8q5Hn2t2rNIlxBO8d50JqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WzEwx3Opaugl9/DnwYYjCuWFXIdaNBvH15zMid2uSM=;
 b=cWDxe7tyvFLFW4R7UdO+pwvn68cAn4rooQofcExx56e+PijCJijaWHnnxUxvsWS2mwek0ywHyOJrtur+Ba9Vc/W9f96UY+2B/1m7jPEjc/HaymHDz6sc/Rb6gloFsU7Q9roj0z0PKBPPS4FgOVvN5Fb3TISkoaUKouv8L1mU0y/Ydi33KjOs7aji5hB7lhFKCi5EeFa//wNEw3WMA4s8RzZgrlwOWN4pmAPf5Aps5hTdp/bbHKKgKOKJeNwEjVffhsTn1nXRKi1pFZnwZxX+tspFsLkh0G+R/eZVFeEq8ite9urDBoOtYFPkxQLG5Lik94OqnoELFAHHhwDT8z11Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WzEwx3Opaugl9/DnwYYjCuWFXIdaNBvH15zMid2uSM=;
 b=MR4dMm/OXboALYquRCkfWxkq1xrS8XhKPUCBcl43AHwN72nXwMEDvD+GD2VSW/AkJng/t2miXqRrdp9nZ3tiw5yN08ZnKcZsDDn5U3z7bNNmmFPAfZCxpICkOfjMwUXVj8gKVgpRApBetfQI3kZTh66RSYOvonXBTvcROrFnVXI=
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
Subject: [PATCH 04/12] x86: Migrate MSR handler vendor checks to cpu_vendor()
Date: Fri, 6 Feb 2026 17:15:26 +0100
Message-ID: <20260206161539.209922-5-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|IA1PR12MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: 352d51fa-d1a8-419c-378c-08de659b0614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mWI2C8ZbBmEMqHFMe4usMFfd1oUOWKAQujrwjc2TFRruSrJlWE+1JKTN4XdS?=
 =?us-ascii?Q?WguFtGGYUTLvAIj2UqH4RGQYVxezC9MmZqKKrjDIVgUpqxgBFGTkYs41l7Is?=
 =?us-ascii?Q?2rxyfpJ0gKLw6DPiyFiaC4xjeG0c9aQPwOb4xv19/GI+2MlhaPI//Lycnumh?=
 =?us-ascii?Q?wyIdipnHv0T6o6DO5Xo7jWbFABaKEjQL8KiQnP5+fc9QIH5OhoMItidvxlhA?=
 =?us-ascii?Q?jQIuYiyli/U7D5inGPLTt04Zhk41fmhNH1LVzEF0uN3RBehAjjnRQq/Wajf+?=
 =?us-ascii?Q?QVkAhQDVaN92rPJ65fdeQ6KVfz1q/m7nsMqrkBFS0KHkKqs1DckXPoPbta1f?=
 =?us-ascii?Q?Fp7ioxFC2rZSL8tl5DHkWCI4+jvublKzzav7gzykL1wMEPEcXd2oc4GY1osC?=
 =?us-ascii?Q?R21iZrFAsi8wjTgpHxs9hBwA0UBRoGJaNFWU9oaxMKErutN5K9kNq1Zqsrb5?=
 =?us-ascii?Q?zY4iwWRQF5qoD/C1n3ouP9h6EW+zfrGl/cCbf8uQtGdbBIcOOLx8oDwpe+ok?=
 =?us-ascii?Q?wzRTvYTPBad4IoRl9O7TsWXXIVImKFqu5+2yjJnYvAHu/oLWNZF65vd1pGu3?=
 =?us-ascii?Q?eW46wAgL1hVaOVmFteUo9sxcU06C6biyHgIQwyoCYyVrg4bFJzwZHWsPbs/O?=
 =?us-ascii?Q?Q2Ve79SDDSKd6nzYG7d5D4ukonewBDKJ2n4u7PB3OEs3BdzRHd91hWUDyDeS?=
 =?us-ascii?Q?H2Us/D7JLcTUZ3k4Jy5C6UqiGCnmR0Y8yhigNAZKCFaC8mkxJUNEvAb1w3cT?=
 =?us-ascii?Q?T2uy++GjkpZXe0BWOUO0lxdwI95608pfzi/mY4Tnzirh94x0rJG2gO7nsRtW?=
 =?us-ascii?Q?Jc1wJyv7rFEBoZXE7Z/hif4mZXe5i9RIaLumz+4rbbeBcsS2quGdzJ7VF2ez?=
 =?us-ascii?Q?Ybb0LytaChLvhGT0Uc9O/+ueHtooX0TGJKGjaPaOJx9lCGhB1RnXgjVzN+rs?=
 =?us-ascii?Q?wJKKzAf+s9LVJDEq0xV3/hwIzRdq/zF4uagVVmNFY41RQxomegjkMNykt0r2?=
 =?us-ascii?Q?3Gj0kA0XJddVJkNUREj+WALFgepfLs0kmXcEo+nepnHSFSxNoqlKQiOvdssq?=
 =?us-ascii?Q?LNnv/xPyXSNbYKgW+sgMdge8Arsz6RlOBHvL+v+qpeFzKn/0KAyvHECYdTbI?=
 =?us-ascii?Q?TWk2CvmU1S6bZD9PbLDxWftmS4GqCopg6wo+d43jWWxyJPuQ8RqjjHK4QNj8?=
 =?us-ascii?Q?aHpgAq+1zEZJ3YTC2V+8al226+6+01DUMG+7TK8+Wrel2LU0FW5OkWM4qDst?=
 =?us-ascii?Q?cgQUQfE/R5akHGtg6Xygxfokkvj7Zq+a+KBBTPisT8ax1egPE3CCFouKwYAO?=
 =?us-ascii?Q?S/hduRJT00h/nu9z2SUGtBueo5qO3DMUzfiRoc6MYQe2Yx4OeIGVHWk6GL1e?=
 =?us-ascii?Q?ka+ui9/aKWveksGDClzSJJsboPmQ1pUTHvaOZ4BsCHUQWYr+eCTJUdrCbzWi?=
 =?us-ascii?Q?ilf/xdH/zOD/G61Dv16Ha0aqz4hyw6auldQsmMjwm9sjhuhy3aibuT1x9rOu?=
 =?us-ascii?Q?+Y/6ghNSpLQBU9pn6CM0To3Cu5MnsUVuxB7+dUEutN9ihk2rQLKYQ0Sbsl4C?=
 =?us-ascii?Q?gWqyrXxOg+yBAU0YQwHAhVqwwvm4DsN5vVfuG8TLD0+F5bJCN3C2HdUE1GTw?=
 =?us-ascii?Q?C3KzD2zcLECUgrQd3jA1xMxhH5oGK876uCk0nvH9h86+csaEIJxa0DmocDgL?=
 =?us-ascii?Q?vw+CRQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	M73vfP6zUQ6/q5afN4sd86CguFxwGltSgeXE771V8kufxzV7Tc+pw3G1GZi8oCBcTcBvoYcv1PnKEO0C7FhVxMHD+KKwiHmvy7fIHRZKi7jfXWvHi0MIqrNIMzy7q1VqopN/3rxe0MTeI70FZMYZKD+4v22KpUXpOdGSls31vtVSTHDhbBJJ+9wz78JNbZp+/gKzY3Hf3NPjN/9a5EEEZgkW2f7WMogbiU+02MVbSQLsFPUB1x5jzoYop3KdTCwGupVuNZxzUaVUb+roWCzzzVYKlgqToKyarl6mWdzh2altffTqhM0ruDT+lHwSbM4YSFCjVk7GJ1dIHfd7r9H1RU4kgKVlOHEpC5NuY5sdy2wtOp2kybGh7u8jeXu4c09PYqeVdlristXe12Yr62aZHX+WhwnACkswkwI4np3E5L2boynuavO+JZ15vUI7gYng
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:16:02.8807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 352d51fa-d1a8-419c-378c-08de659b0614
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7592
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,illumos.org:url];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 609061001FA
X-Rspamd-Action: no action

Many handlers are vendor-specific and are currently gated on runtime
checks. If we migrate those to cpu_vendor() they will effectively
cause the ellision of handling code for CPU vendors not compiled in.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/msr.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index ad75a2e108..34033c1982 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -157,8 +157,8 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
          * The MSR has existed on all Intel parts since before the 64bit days,
          * and is implemented by other vendors.
          */
-        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR |
-                                 X86_VENDOR_SHANGHAI)) )
+        if ( !(cpu_vendor() & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR |
+                               X86_VENDOR_SHANGHAI)) )
             goto gp_fault;
 
         *val = IA32_FEATURE_CONTROL_LOCK;
@@ -169,8 +169,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     case MSR_IA32_PLATFORM_ID:
-        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
-             !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
+        if ( !(cpu_vendor() & X86_VENDOR_INTEL) )
             goto gp_fault;
         rdmsrl(MSR_IA32_PLATFORM_ID, *val);
         break;
@@ -189,9 +188,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
          * from Xen's last microcode load, which can be forwarded straight to
          * the guest.
          */
-        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
-             !(boot_cpu_data.x86_vendor &
-               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
+        if ( !(cpu_vendor() & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
              rdmsr_safe(MSR_AMD_PATCHLEVEL, val) )
             goto gp_fault;
         break;
@@ -236,7 +233,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
          */
     case MSR_IA32_PERF_STATUS:
     case MSR_IA32_PERF_CTL:
-        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
+        if ( !(cpu_vendor() & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
             goto gp_fault;
 
         *val = 0;
@@ -245,7 +242,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         goto gp_fault;
 
     case MSR_IA32_THERM_STATUS:
-        if ( cp->x86_vendor != X86_VENDOR_INTEL )
+        if ( !(cpu_vendor() & X86_VENDOR_INTEL) )
             goto gp_fault;
         *val = 0;
         break;
@@ -302,7 +299,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     case MSR_K8_IORR_MASK1:
     case MSR_K8_TSEG_BASE:
     case MSR_K8_TSEG_MASK:
-        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        if ( !(cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
         if ( !is_hardware_domain(d) )
             return X86EMUL_UNHANDLEABLE;
@@ -314,14 +311,14 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     case MSR_K8_HWCR:
-        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        if ( !(cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
         *val = 0;
         break;
 
     case MSR_FAM10H_MMIO_CONF_BASE:
         if ( !is_hardware_domain(d) ||
-             !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
+             !(cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
              rdmsr_safe(msr, val) )
             goto gp_fault;
 
@@ -338,7 +335,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     case MSR_AMD64_DE_CFG:
-        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        if ( !(cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
         *val = AMD64_DE_CFG_LFENCE_SERIALISE;
         break;
@@ -461,7 +458,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * for backwards compatiblity, the OS should write 0 to it before
          * trying to access the current microcode version.
          */
-        if ( cp->x86_vendor != X86_VENDOR_INTEL || val != 0 )
+        if ( !(cpu_vendor() & X86_VENDOR_INTEL) || val != 0 )
             goto gp_fault;
         break;
 
@@ -470,8 +467,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * See note on MSR_IA32_UCODE_WRITE below, which may or may not apply
          * to AMD CPUs as well (at least the architectural/CPUID part does).
          */
-        if ( is_pv_domain(d) ||
-             cp->x86_vendor != X86_VENDOR_AMD )
+        if ( is_pv_domain(d) || !(cpu_vendor() & X86_VENDOR_AMD) )
             goto gp_fault;
         break;
 
@@ -482,8 +478,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * for such attempts. Also the MSR is architectural and not qualified
          * by any CPUID bit.
          */
-        if ( is_pv_domain(d) ||
-             cp->x86_vendor != X86_VENDOR_INTEL )
+        if ( is_pv_domain(d) || !(cpu_vendor() & X86_VENDOR_INTEL) )
             goto gp_fault;
         break;
 
@@ -553,7 +548,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * a cpufreq controller dom0 which has full access.
          */
     case MSR_IA32_PERF_CTL:
-        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
+        if ( !(cpu_vendor() & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
             goto gp_fault;
 
         if ( likely(!is_cpufreq_controller(d)) || wrmsr_safe(msr, val) == 0 )
@@ -663,7 +658,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
          * OpenBSD 6.7 will panic if writing to DE_CFG triggers a #GP:
          * https://www.illumos.org/issues/12998 - drop writes.
          */
-        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+        if ( !(cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
         break;
 
-- 
2.43.0


