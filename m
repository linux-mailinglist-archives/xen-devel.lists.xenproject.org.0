Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BB659DB05
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 13:57:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391935.629985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQSWB-0006ER-7S; Tue, 23 Aug 2022 11:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391935.629985; Tue, 23 Aug 2022 11:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQSWB-0006BA-4O; Tue, 23 Aug 2022 11:56:27 +0000
Received: by outflank-mailman (input) for mailman id 391935;
 Tue, 23 Aug 2022 11:56:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQSWA-0006B3-FI
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 11:56:26 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20074.outbound.protection.outlook.com [40.107.2.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cc68737-22da-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 13:56:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7981.eurprd04.prod.outlook.com (2603:10a6:102:c0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 11:56:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 11:56:23 +0000
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
X-Inumbo-ID: 9cc68737-22da-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjP/zssiNujN6Mxche6G6Vk4qi7Fa3FgQl/F+5Z3sEJOxGDxLtOl1bWVJ8iE7ieoijlnqVeiPs4SEbdg6bNf+0tWcXeXgSOdtghgU3yfC4IRdoP/UpQ5xO4Z3xCg8KWf7BoRfUxhruFwUHmXaztX7AeUx/e9zLzYLd10s8c1EZ9RyEXhPsFdeqk4YCalSUk12uR9GMq81XKXpbirqImwxpXVWAU+dMLZZvbtUCOyS1v/7FGIQsBJTY2o5RumELVvvkF/zV2FnUvng5B5Cnc5lxv7/0tuXTHebapn5Iwp6ttuue/DLVs30U7qOKT5zoA/6y2ifhmpm1g7EHRo10pREQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqN3T6iOsxYbIyGCZylcP8PAfJciQULqrU05iCLmnPU=;
 b=diahDOHrcwm9nzK5+jWEvZ+XCW5tzuV0CNVP39aj47Je3/UNHo9iIki1rIzc6F8D4v4UAxVuAFbJ1075Gm8lumDKArxMx960VGveok0MIabQ4ug5PX1dH38ntoi44AlIw0MGEy9T9XpNgOgEDMvl7gnDKX+T0J3rLxjuwuTvfvxQIaSvvZGtBWKMCgW4OKEapBZZMid2g9gASkm1+Svulv/M6Fshe/NxIJ/UMo4M+9pITqjv3DZfOoqGFYgxXD2f6Y5jlMO/5rOUoHk96fq71Pytv1xSmaBRMxh+0tBhVN759T38w4qui6/Om5w+6BBTlQbkwkbjv56aCeyKkAw88A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqN3T6iOsxYbIyGCZylcP8PAfJciQULqrU05iCLmnPU=;
 b=wKRsaaVOxkd9eimTVhb2qyaLvM+64H1Sq0Q59KTeDHnC6LMtyqYzbhth5mujZgFiHFgZW9/YvImwghikpT3oi8WIuA5Ti0E4tFC2Q+Awv5/fVJtLoU0UnkRpeRrQw+lzW38yqjx9pK9bnPYWJOLAOJ5Z5CyWzHlIqjaHs5Z0StrYyZQbkWoshq6VWzOlWB63fBXz4y1NW1K0KiqMXOUjisOrCzD/9xGW2s/S0Z2NKcISskVoSXgtUla8TCBiargpYnsDn0Tk2Dx0IRuOqw48+jUnYCNbWm2EL+c0w5+TGGmcHtAXtqiw/mtaYycKIN6WVz78m8sUyiKhck+YA1ivBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0e0b1859-e7f8-3f8d-2be8-e0069b116525@suse.com>
Date: Tue, 23 Aug 2022 13:56:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jane Malalane <jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PVH: restore VMX APIC assist for Dom0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a82e9015-fb5b-406e-0a76-08da84fe804a
X-MS-TrafficTypeDiagnostic: PA4PR04MB7981:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3uSfXwdkmIEiI4qMCeLb8c1+yi6u6wRXyikJii9daFBO6zdP5bmnNI2cEbjpQiUrGKhv4670jOJctaosp4/H7lXWA/DCW8Xy5/QZxXmyOlT279Pehk4H5/r+U52sS9wwXlmD/FUt4iNcgFdzdsk2FDMoCSbRMsBgJWY1JNg30bIBHQJRn+OR04jlrEqlbAJVoLFIrZtMY7xschFfQj3ooCq5Z+JZgd8fABO02vkDrsqYZ+CWYrjfjLhwM3d+AM6oR2CWFRG3sXNYwdMSSZ6XWwkI4NGxo9HtHdyikltATiRhNhIo96f+lj3OH/o4xATiz0nMz0f3LhCkmW7/MGs0Szsrs6xwwTRmrI/lyskl7OWJ9CO96jnWamigztl5+MLXWe7f6ODuqbUhSMsUak+C+nYFyGUhqT2MhmggX4oXEBoYElK8YYO113PJV7zDLTd+HTZV+L8dpWXf6uxtqa4HS4es1ioTHN/3OKZjXEdGKISFUCyV6t1r7WInORstN/zCeqQtFBzvdiY+RBUJlXva7vop3g0oPknIEeqo7bQMEzmhYhjdlIWbxQGMx17FILnxhjLFMs1Cf+SBXkbeMR33vVreX7z3qEKP6aUNz0QTjOv4GOpMldROrYvQ4T5PAaC9yVXxe4mpGB7IrQpmRWl8CQepcPjXrAlIx8TD874Nb94MxlRBriZm+XJ7oaAGtrLEqUjn1pOq+EZcBow5L/Rf7i8pRJPCmtfIssIbCoEHEEi8JPYAeLo41Wzh6UJROhRCwBq/SkTt4kqHhk5J8Z11wprg2W8T2XQJ4FsKG/lf9+E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(376002)(346002)(136003)(39860400002)(2616005)(4326008)(86362001)(66556008)(8676002)(66946007)(31686004)(31696002)(6916009)(54906003)(66476007)(36756003)(38100700002)(26005)(8936002)(6512007)(41300700001)(186003)(6506007)(6486002)(478600001)(316002)(83380400001)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXFIVDNZSmt1Y0E0U1dMRTJNd1UvZmxCc3RrZXdmWXloVzUrd3plUytQRjU4?=
 =?utf-8?B?djVmTy93emQ1Y3ZhZ2M4YmZnOGtRcVZESVp6bDlPT2tMWVNIanVVM0ttK01j?=
 =?utf-8?B?Nkd5T3hFNWtlWXhnRE91MVBBZGRKcmUzMDU2cGhhUUxJT1l3dXJ5UHoycjF1?=
 =?utf-8?B?eEI0U1ZyM1Rhb2UvZjArV2lvRXNFSGQ4TkVYVGEyeHB5b2Y3NGFUNHkzZG8w?=
 =?utf-8?B?eVNvNE1iclFjUTRaUmVZK2Q3ZXRTVnJ2am9RbFNkZGROZDJabVVGRHJwc2c1?=
 =?utf-8?B?RVhIWTZJMGhMdm5nZDlUbWlLMk9ON0xmYUY1WXQzcmpWSEtYK2hmdmhERTUv?=
 =?utf-8?B?Vy9WelVxOWRvY2xwWDcraVJIdzA1VldnS1lBY204QzMrZUY4NlEvbmlRRDVF?=
 =?utf-8?B?UW1NdENtTVM1aVZxS1BWemlMaDFTbnZ0SEszZko2a0trWWNtTjlhSTlncW9E?=
 =?utf-8?B?QTR1Zkl1NzYyL1U1ZmMrbDVDUmtYUGRWalU1ZUpFL3c2ZnNSRGRCRnRtZCtP?=
 =?utf-8?B?RElmR0w5UE10QkZBVzZWd0p3blNYdUhyR3hpL09vUUhwVEs3QTFBd1owY3dS?=
 =?utf-8?B?akE0azE1U1E5MjFBcytwazBJam5GK09VdUJnMExRb2pZUmVhVFNyLzRNRGcx?=
 =?utf-8?B?Z2NaRS9JeFdDa0pTdlZZVnZoYkRrSHFwRlJvRHUvL2cvQlgrcVRyMTRQSXlV?=
 =?utf-8?B?MnRrQkZNSytwbHhVcUMzRi9nTVl4elZ6a0piWHl1ZVNnNlV4VUtOQjJ5M3BZ?=
 =?utf-8?B?OXUzbUZrNWEvOFF1enl0Z1BJdUxlbHhINktqR21tRGRZZXhEeGNrT1FoRWc2?=
 =?utf-8?B?cXJuU01mU09FY1AyVVhCOE90N2dDZ0xzbkZ1c0lnUjd1SEFxR2pJT2J2SUlr?=
 =?utf-8?B?eFdmbTFyWlB1TmcxRVE1MlZETzYzeFYzNkJFSkFIZitqZitaWlNWRWZiZkNB?=
 =?utf-8?B?dVlVZGZLaXVNWnBCUlJ3a3VKazBKN2pMR1hTOVVIUFVNb1B4OStLZUduZ24r?=
 =?utf-8?B?MWcvWHdXdmsyS2Uya0l6dy9VY1hNdlFaVVVsZlpmeS9GRUljRjIydUZWdEFL?=
 =?utf-8?B?VXhFSTArNzhkOCsvZUh3L1ZDdi9qM0Y4SVFJRmJBRmZobE9nUFV4TjI0S2dx?=
 =?utf-8?B?L0tYS1BkL1hHczhnV3ZlbHdXQkV5R3VDbjlGeTY2b214UWNpUHZiSVgzL3Na?=
 =?utf-8?B?VlNZRDB0UmJiQnYzb2dxS2RVd3hIdXZwUTcwQnl0WUozV2JuMzBNVjFQdVQx?=
 =?utf-8?B?cm9vczhMSzRDY1RGZ1ZIYUJza0Fqelk1bnNBZXFKejRxZ0U1anBJVFlpMlha?=
 =?utf-8?B?UlZPOTdZYjhGN3VETThCTUMxT2g5aXo2TFBPaWNwODF1YWxJTmhkVTVIWHRX?=
 =?utf-8?B?NEI2SVdYYlE1YVo1NmxqcnNLOHdheUluSGF3d28zT3B2bXczcTBJZXBBL1FK?=
 =?utf-8?B?SXllV1RTSDE4SUdPOC9URVdKaFdtWUtxQ2JaY3l2MEEzcDdhdFNnSGtyOEFa?=
 =?utf-8?B?d3dOTUFiR0l5YWZCUzdlSzQrQnovR3VnUEtNQnZ0V055bmkxZ3R6ZVhLQi9x?=
 =?utf-8?B?Yy8zTHVObjdPRzdGTWlRUnFnb05JYVhocUN0ZzUzdkIzMHBRM050elJYVDFI?=
 =?utf-8?B?VEJQZUxYTCtFV3h6dis0M1Jsc243UnV5VjZHNEV5Q1BBc0RpUDljMmd4WDFk?=
 =?utf-8?B?eHNmMmhyNkhneEhpcTROK21aa3p0WkRwbmxtK093bUs3UXBESzdmSE9nZmhy?=
 =?utf-8?B?Q2VJZ256SERZU1hTNWxJYWZQSkFoVFJOYzV4eWcwdkVlRFQzTDVMbktYMThj?=
 =?utf-8?B?N1haQXMvZkZtVU83ZmRFbEtUUVNwOE5wem51Q1VqTW9hbGlNS0FCM2tzVEts?=
 =?utf-8?B?dVkzNHdyS3lsb1c0dnVROFpBcTFWenYzR3preWpiZHJFdW4wY3FJalJmVTZo?=
 =?utf-8?B?dkNuMnN5YnIwdXVjUFFqS1JUa25UT3FxNzdqeUJKS2dIWHdDWHFlMnVpNmdY?=
 =?utf-8?B?NGtyWGxhNG5RTnVhWGtFNzRrVTd5WTdpdm8yeVlST2tSem95blhmMWgvWU1I?=
 =?utf-8?B?UHNzY1YrWXJHWmtmUDB1aWdqK3AwWFQ2ZWJiZU05bm9SKzBERmtlR3hCRTg3?=
 =?utf-8?Q?dspJs9PFkWBDMenKvH54kwoCV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a82e9015-fb5b-406e-0a76-08da84fe804a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 11:56:23.6179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsHSsbdkbXtPoOzklC10HEHDhdUag0coGeg6dHtfjlv/F8Z8rfY6sNVhpVruAnT0C6318jatP2FCSXB+N9ZLwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7981

I don't expect it was intended to default PVH Dom0 to "no assist" mode.
Introduce command line (sub-)options allowing to suppress enabling of
the assists, paralleling the guest config settings for DomU, but restore
the defaulting to "enabled".

Fixes: 2ce11ce249a3 ("x86/HVM: allow per-domain usage of hardware virtualized APIC")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Besides the issue caused here (the manifestation of which appears to
correlate with the other fallout Andrew is trying to deal with) I'm
observing further warnings, but I guess these have been there for some
time (perhaps forever): When parsing AML and encountering the objects
describing the CPUs, Linux would find entries with the original APIC
IDs. If those don't match the ones we assign in pvh_setup_acpi_madt(),
the kernel will wrongly consider the entries to describe further CPUs,
which it therefore would deem hot-pluggable. This again results in
warnings, this time "NR_CPUS/possible_cpus limit of ... reached".

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -753,7 +753,8 @@ Specify the bit width of the DMA heap.
 
 ### dom0
     = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
-                cpuid-faulting=<bool>, msr-relaxed=<bool> ]
+                cpuid-faulting=<bool>, msr-relaxed=<bool>,
+                assisted-xapic=<bool>, assisted-x2apic=<bool> ]
 
     Applicability: x86
 
@@ -814,6 +815,10 @@ Controls for how dom0 is constructed on
 
     If using this option is necessary to fix an issue, please report a bug.
 
+*   The `assisted-xapic` and `assisted-x2apic` options, defaulting to true,
+    allow disabling of the respective hardware assists.  These are applicable
+    to PVH Dom0 only, and their effect is limited to VT-x.
+
 ### dom0-cpuid
     = List of comma separated booleans
 
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -293,6 +293,12 @@ static int __init cf_check parse_dom0_pa
             opt_dom0_cpuid_faulting = val;
         else if ( (val = parse_boolean("msr-relaxed", s, ss)) >= 0 )
             opt_dom0_msr_relaxed = val;
+#ifdef CONFIG_HVM
+        else if ( (val = parse_boolean("assisted-xapic", s, ss)) >= 0 )
+            opt_dom0_assisted_xapic = val;
+        else if ( (val = parse_boolean("assisted-x2apic", s, ss)) >= 0 )
+            opt_dom0_assisted_x2apic = val;
+#endif
         else
             rc = -EINVAL;
 
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -55,6 +55,9 @@
  */
 #define HVM_VM86_TSS_SIZE 265
 
+bool __initdata opt_dom0_assisted_xapic = true;
+bool __initdata opt_dom0_assisted_x2apic = true;
+
 static unsigned int __initdata acpi_intr_overrides;
 static struct acpi_madt_interrupt_override __initdata *intsrcovr;
 
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -68,6 +68,14 @@ extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
 extern bool opt_dom0_msr_relaxed;
 
+#ifdef CONFIG_HVM
+extern bool opt_dom0_assisted_xapic;
+extern bool opt_dom0_assisted_x2apic;
+#else
+#define opt_dom0_assisted_xapic false
+#define opt_dom0_assisted_x2apic false
+#endif
+
 #define max_init_domid (0)
 
 #endif
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -784,6 +784,11 @@ static struct domain *__init create_dom0
 
         dom0_cfg.arch.emulation_flags |=
             XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
+
+        if ( opt_dom0_assisted_xapic )
+            dom0_cfg.arch.misc_flags |= XEN_X86_ASSISTED_XAPIC;
+        if ( opt_dom0_assisted_x2apic )
+            dom0_cfg.arch.misc_flags |= XEN_X86_ASSISTED_X2APIC;
     }
 
     if ( iommu_enabled )

