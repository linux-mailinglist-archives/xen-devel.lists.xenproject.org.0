Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643B674D0A4
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 10:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561099.877424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImed-0006wS-Uq; Mon, 10 Jul 2023 08:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561099.877424; Mon, 10 Jul 2023 08:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImed-0006tf-RS; Mon, 10 Jul 2023 08:53:59 +0000
Received: by outflank-mailman (input) for mailman id 561099;
 Mon, 10 Jul 2023 08:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qImec-0006t6-AK
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 08:53:58 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dd87f37-1eff-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 10:53:57 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DU2PR04MB9051.eurprd04.prod.outlook.com (2603:10a6:10:2e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 08:53:54 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 08:53:54 +0000
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
X-Inumbo-ID: 4dd87f37-1eff-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKcM6lj5xgrKkCGO/e1BI5hhk93ZzWSVDp6J0acdonOzXnKUJn6EFVTkv8IHxHYkNNQo157/Ws3SfXva3HPe8fkuubN1L0E5ghtRpCFFcIXiUDePGig2Nd07xarI3Fuybk9QuvdKpKT3EtVoXQTwIWhhvEvjseTMXgOjOxYB7Ww5Z5OuDPVbLcvuDMzgewtITqLQdDdiXoVJ9LR5rHW6HRebePHv2w9SdSZJljj/tc3Gf+s2U7zEO2HOF548ZtWedwtNK31IfznZM/23tU6wzh2JNqRqLsq4n6YAIf2BJn0K8eCK0QvzUshy3Wym+eHmRmXo0wRZgnuRDsMj5dc/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwE2DaHJIT8yUh1v7GuvfaHzm8FBrIyxUnyTwmDfL0E=;
 b=OXcZDMCtRc1NDCuEG/G+RGHseDhYwrki6Y6qDc7Yq3UyFZMK20rVxvOzrd854hM74PLZrU8/B7MO+/ztdYEW9pCIj+eSOCmucVau+YhU/QvNIqFsRoDNT/D5Kh0/4JQI/gaVBFLZti3Yqhst4uHVQjPajHVMXB8np5SfaaM6gQ32D/tIhQeTU/UNo69kYxB6/IXbGE6DSIcWwCjhLRuzULGPVOATgIn2oktPhubRjOnNSUHgW/t06yQrpUynnLoYklfPVf0ZhV7pO+gYkzy+Od2fu3sfd65m45TVKpoxIMjpUWdcuWjrXbciazm3VbEt+WEQs6vKJSS4g/qqHsEKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwE2DaHJIT8yUh1v7GuvfaHzm8FBrIyxUnyTwmDfL0E=;
 b=bZlxfdQnvYYyqm370ANX9c+7xrp6+VTU39DWjdM0eXJH01VOU/89+MZtEOFcZFv5julM2UrpK/+c+MIn0EcUOjRFrd/exyCYMC6TG4QGMdjc4rfRyK5ECLpIHQu2DzOQNv17dZfU4YDwhC8G0bI/ESy4RLzj9znEWVgkacvJghfTCyeGXe+H3Crd3toB1fRCln0lxAmNTR8XshSV+xuPvIpC/bg8o8S4GMGWqcJJJGa5e/z004KIXn7zF7IwF176MM8gYNMPmQIrCtV/1oGiWY13pT95XngYrckOTUQdIQx+XsefFpyBXBqLpdO3G2CFTaQIMQJPv5TOt3IY4xFd+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fcca07b2-8af3-625f-54b4-763532afec50@suse.com>
Date: Mon, 10 Jul 2023 10:53:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 3/8] x86: annotate entry points with type and size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
In-Reply-To: <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DU2PR04MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ac6bcd-6d4e-4aed-f69e-08db812330c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gepJeBp3vSConBujNck6eS4elbRpcimWZXgDLG8GIUebYd768+v6UPASyv+4smgrFyf81S4EEmpjEjnC7Ru/CmtqSyINPYIqeJL65bgZTdi2JnyahUbLIbJoSnHjOvvcBXydYtR9pTE6ElYLClDIa9a2rNPyEUPAdTADlO+l4ddw3Ixy5Cgpn3Ghlpf37V11le+wl3jpRnpvn7w1RhMfwC5kMxiGNShJugKb3h8kCQktL3hqzwfR+259JV4knQbSkCQLurDF/kh5g/05BLxqmsMiqLf2gerhcAKte20MXfslrRXHlDLU0Z/t0+Hz4D1ksTJAyTFXYmDhg1hIkkks0gs0bMwrfuGWkMbxqnp6WNBhk2GE+44tbukhUh+9EtBAERNyG8ZrLtzLaSQWO1SHZ1iM3RGQhlLWkl8cEdmzOvtO5Lgpa0vAudZCvtYnJbKV0/nSFrizjeUvy5P2mY6N1G1HO8HOAlmEDmvxHz2L/U6+ZLcKbK0SGGHPNUasEOkn3LnjPlX8Trn1N1FROAA06OPAgjPemptqfHFyO/z3lp8LIAFKcL8gjL2ecHqI9qb/cbG8sqEvLgTuP1PXqyi2Lp6FSF65yB++WSAI7ITTA9eoBkBkQ10oi0oB6U8wEmAA5+6R0SJUs9yQQxuYGmdq9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(376002)(136003)(346002)(396003)(366004)(451199021)(186003)(26005)(6506007)(2616005)(6512007)(83380400001)(41300700001)(30864003)(4326008)(6916009)(2906002)(66556008)(316002)(5660300002)(66476007)(8676002)(8936002)(478600001)(66946007)(6486002)(54906003)(36756003)(38100700002)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0NqV3BpejZhSlRURmhvdGg4UE9RQjF6a0xZQWF5UHAxRHFrTlV1eGJtM0ty?=
 =?utf-8?B?bWEwTHdKU2tHc0dMVzhNNjIyRjNBUW11RWFzaHRTWGIxWFJFM0JlZll1VkQ2?=
 =?utf-8?B?WHZsMUJCN1JLK1Qyb3NTclhFMkNRck12b3VEcTBZanMvTHlUUGt3bmYycFV4?=
 =?utf-8?B?U3hReEpNNmhTWThOa0xTVElJbDNXbko0RGFockxjTFJ1TmUyVnJWb3g2bHJz?=
 =?utf-8?B?UUhrSVFHdFN2eEVvSHhLSHNMT3plVm1DOVVVMTVFRExWeGVKSGtRTU5pcjdB?=
 =?utf-8?B?YkNyQ1dpeHh4cmhPMmNRS0NIdDRKOGlTc0tpMmExTVRtaGNFUklZWnR0RXNz?=
 =?utf-8?B?NmlDN3lSaDJVLzEweEpkSFZLR29nT090T2dHSGdGeThybEpVc1pNTnVGc3dx?=
 =?utf-8?B?Z0xzTFB3T0YzMi9XVkNtVkMxMFFDclFoZncySi9vYVg0aUlRcjg4ZjNxbVQv?=
 =?utf-8?B?ditjYTBhTkI1a1d0TGEwQzZ1TWpiZGZnNW80MXpNVUdDNkphbVZZS2sycm0w?=
 =?utf-8?B?RVdFOG5FSmpoNUZOcUJNS1p2YzdCMnBBcGZiT1hpRGRjQmNTQzdqMU1QUUI3?=
 =?utf-8?B?NXBDY0dacFVnMDNVMlJPWUJUZ2ZhQWJKQWwxa1hDa2ZCQ0VnWjliN0RqS2xj?=
 =?utf-8?B?a3lOWmtFWDIzNEo1Ymp6WlNWeG1Dc0pURmdHM1J6NmFnQVNoQzVzZHZTRFlZ?=
 =?utf-8?B?akQxZkdyMExjL3hBdUFSa2FSb1E1MVFRV0V4V0JvR2d6djdUMllnL29kT3hM?=
 =?utf-8?B?T01lSC9QMWFnNkRDYlRSZVpaK1RrVW5Kb1hkSVZ5am0rWHJIbnJkdk9NSGNS?=
 =?utf-8?B?eGF2L2tqQ1FXV2s4ZHEyQXpYb3c2eTVKTUMxeXdvRFpkalRseDBUeERlUU5G?=
 =?utf-8?B?eXRYNlFHNVpjRzB6YlpabW1ESndFWGFrcUpjVCtOTElIbEJZQzllckRKOU4z?=
 =?utf-8?B?WnVSY3lKUnJ5Znp3U2xjSzR1U1FiaDdVM1IwZGZsMXZZNlFHbkR1NEJDUFhV?=
 =?utf-8?B?TXp3TjIyQzB3L3FhOE8vb1ZrbWhCZ3EzZFczL1g4UUI2RlEweWFGRDVTc0I4?=
 =?utf-8?B?WEN3VmNRcStEek5SUUdWaDdRQXlHbnBWL1BGRHRlWVRBTUwwK0h3Y3VjUWJI?=
 =?utf-8?B?UUxBcjU1L0xJVHNDUUZPVDRqUWliU1kxa1BXMDdid3lFdWNnaUxRdE1ZU0lo?=
 =?utf-8?B?MWx0SmdtREJFVzltSjJMVHV5aXBSUWZCcmcrUXNraStoKzlxbURCZ2Jmb2FG?=
 =?utf-8?B?a0tRMHFYR3VKN3RZMjc5Wk9RbEc1NlJROGtiaXdoMUxBdkpsK0RDb1BvdXJF?=
 =?utf-8?B?d0FvcEg0M3BHVTFHTWdUZ0RJQXpjaWE0SjhQTW5oUVBMc3I2SHZYd21oOENr?=
 =?utf-8?B?WFZBbW8zYnhtcDN3Ync5SFpnY1Y4MW0yMDUyMXF3K0I2b1owN3c3YU5sTzlh?=
 =?utf-8?B?VEFtT1huZGZYUXZseFYwZERhN0x5S3VaSU9uRVM5aFlhOEIxQklERHRtWTZr?=
 =?utf-8?B?V2VyT0p4TnVzaFdYZFR5aWJOWnIrTi90Z3l4RXkvWWRFODd5RFJkSlhlNXJX?=
 =?utf-8?B?ekJOZkgvUkI2RnVBczdHMHhlSk91UWFHTHdPNnArN1dTbU5tcU95V2d5YUxD?=
 =?utf-8?B?azhwZXZFbDNLZndsanZ4c1VFcGxLR2xaaElyOXJNU09DaTRnanQ3aUN5cnhQ?=
 =?utf-8?B?LzV1ejFrL25heW1qd3RtNnY3T3VXUmtmaE8zUklYR0Mrc0JaRVYxTEJWSEVi?=
 =?utf-8?B?MXhaUTFxMjhzdnJNR1JpdEZYa3hEVXY2R1FpaFViaTBhVkRvVTJ1YnAvNldP?=
 =?utf-8?B?dWhCMU5vcjI5UWo1Ym1rT1lqbHJ3dlR1eTBZZjlUalkvdVNtTHpDdkZMenBJ?=
 =?utf-8?B?aTRMR04vNnk5WFNCY0VjZ2lmNElwU2NLajZTSS84anI3elc1UFFPQ1RrWFRW?=
 =?utf-8?B?UE9qMHFGNUMwSzdlRlJKV2dKUjAybGw1ZmxxdFpRcUQrODZzTHIyM0dtQnVN?=
 =?utf-8?B?MitVOSt2UGwxdGcyZjBUNUxYOFdxT0JCZXNpc0tDMjl1QzVmNGlraG12aTJI?=
 =?utf-8?B?eFN1VjIwa0ErZXVhbENRemp2VC9IVWZFMXRFK2FWYzFaNzRsUWMralcweE9O?=
 =?utf-8?Q?BVjiZcOuV4F3WDkU0QqYdFXhz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ac6bcd-6d4e-4aed-f69e-08db812330c7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:53:54.6463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28zBy9h3pnI9bjrTnkleCuiZqEekbw2ZFukAiTRfQfPqBQFgrfqfdbFiJwohlFs3iKdNdrpX+3Kiddeor1dO5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9051

Use the generic framework in xen/linkage.h.

For switch_to_kernel() and restore_all_guest() so far implicit alignment
(from being first in their respective sections) is being made explicit
(as in: using FUNC() without 2nd argument). Whereas for
{,compat}create_bounce_frame() and autogen_entrypoints[] alignment is
newly arranged for.

Except for the added/adjusted alignment padding (including their
knock-on effects) no change in generated code/data. Note that the basis
for support of weak definitions is added despite them not having any use
right now.

Note that ASM_INT() is switched to DATA(), not DATA_LOCAL(), as the only
use site wants the symbol global anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: !PV variant of ret_from_intr is local. Introduction of macros split
    off to separate patch. Also adjust ASM_INT(). Re-base.
v2: Full rework.
---
Only two of the assembly files are being converted for now. More could
be done right here or as follow-on in separate patches.

Note that the FB-label in autogen_stubs() cannot be converted just yet:
Such labels cannot be used with .type. We could further diverge from
Linux'es model and avoid setting STT_NOTYPE explicitly (that's the type
labels get by default anyway).

The ASM_INT() redundancy of .global will be eliminated by a subsequent
patch.

I didn't think that I should make CODE_FILL evaluate to 0xCC right here;
IMO that wants to be a separate patch.

--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -13,6 +13,7 @@
 #include <asm/alternative.h>
 
 #ifdef __ASSEMBLY__
+#include <xen/linkage.h>
 #include <asm/asm-defns.h>
 #ifndef CONFIG_INDIRECT_THUNK
 .equ CONFIG_INDIRECT_THUNK, 0
@@ -343,10 +344,7 @@ static always_inline void stac(void)
     .popsection
 
 #define ASM_INT(label, val)                 \
-    .p2align 2;                             \
-label: .long (val);                         \
-    .size label, . - label;                 \
-    .type label, @object
+    DATA(label, 4) .long (val); END(label)
 
 #define ASM_CONSTANT(name, value)                \
     asm ( ".equ " #name ", %P0; .global " #name  \
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -43,7 +43,9 @@
 
 /* Linkage for x86 */
 #ifdef __ASSEMBLY__
-#define ALIGN .align 16,0x90
+#define CODE_ALIGN 16
+#define CODE_FILL 0x90
+#define ALIGN .align CODE_ALIGN, CODE_FILL
 #define ENTRY(name)                             \
   .globl name;                                  \
   ALIGN;                                        \
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -11,7 +11,7 @@
 #include <public/xen.h>
 #include <irq_vectors.h>
 
-ENTRY(entry_int82)
+FUNC(entry_int82)
         ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
@@ -27,9 +27,10 @@ ENTRY(entry_int82)
 
         mov   %rsp, %rdi
         call  do_entry_int82
+END(entry_int82)
 
 /* %rbx: struct vcpu */
-ENTRY(compat_test_all_events)
+FUNC(compat_test_all_events)
         ASSERT_NOT_IN_ATOMIC
         cli                             # tests must not race interrupts
 /*compat_test_softirqs:*/
@@ -66,24 +67,21 @@ compat_test_guest_events:
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
 
-        ALIGN
 /* %rbx: struct vcpu */
-compat_process_softirqs:
+LABEL_LOCAL(compat_process_softirqs)
         sti
         call  do_softirq
         jmp   compat_test_all_events
 
-        ALIGN
 /* %rbx: struct vcpu, %rdx: struct trap_bounce */
-.Lcompat_process_trapbounce:
+LABEL_LOCAL(.Lcompat_process_trapbounce)
         sti
 .Lcompat_bounce_exception:
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
 
-	ALIGN
 /* %rbx: struct vcpu */
-compat_process_mce:
+LABEL_LOCAL(compat_process_mce)
         testb $1 << VCPU_TRAP_MCE,VCPU_async_exception_mask(%rbx)
         jnz   .Lcompat_test_guest_nmi
         sti
@@ -97,9 +95,8 @@ compat_process_mce:
         movb %dl,VCPU_async_exception_mask(%rbx)
         jmp   compat_process_trap
 
-	ALIGN
 /* %rbx: struct vcpu */
-compat_process_nmi:
+LABEL_LOCAL(compat_process_nmi)
         testb $1 << VCPU_TRAP_NMI,VCPU_async_exception_mask(%rbx)
         jnz   compat_test_guest_events
         sti
@@ -116,9 +113,10 @@ compat_process_trap:
         leaq  VCPU_trap_bounce(%rbx),%rdx
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
+END(compat_test_all_events)
 
 /* %rbx: struct vcpu, interrupts disabled */
-ENTRY(compat_restore_all_guest)
+FUNC(compat_restore_all_guest)
         ASSERT_INTERRUPTS_DISABLED
         mov   $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11d
         and   UREGS_eflags(%rsp),%r11d
@@ -161,9 +159,10 @@ ENTRY(compat_restore_all_guest)
         RESTORE_ALL adj=8 compat=1
 .Lft0:  iretq
         _ASM_PRE_EXTABLE(.Lft0, handle_exception)
+END(compat_restore_all_guest)
 
 /* This mustn't modify registers other than %rax. */
-ENTRY(cr4_pv32_restore)
+FUNC(cr4_pv32_restore)
         push  %rdx
         GET_CPUINFO_FIELD(cr4, dx)
         mov   (%rdx), %rax
@@ -193,8 +192,9 @@ ENTRY(cr4_pv32_restore)
         pop   %rdx
         xor   %eax, %eax
         ret
+END(cr4_pv32_restore)
 
-ENTRY(compat_syscall)
+FUNC(compat_syscall)
         /* Fix up reported %cs/%ss for compat domains. */
         movl  $FLAT_COMPAT_USER_SS, UREGS_ss(%rsp)
         movl  $FLAT_COMPAT_USER_CS, UREGS_cs(%rsp)
@@ -222,8 +222,9 @@ UNLIKELY_END(compat_syscall_gpf)
         movw  %si,TRAPBOUNCE_cs(%rdx)
         movb  %cl,TRAPBOUNCE_flags(%rdx)
         jmp   .Lcompat_bounce_exception
+END(compat_syscall)
 
-ENTRY(compat_sysenter)
+FUNC(compat_sysenter)
         CR4_PV32_RESTORE
         movq  VCPU_trap_ctxt(%rbx),%rcx
         cmpb  $X86_EXC_GP, UREGS_entry_vector(%rsp)
@@ -236,17 +237,19 @@ ENTRY(compat_sysenter)
         movw  %ax,TRAPBOUNCE_cs(%rdx)
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
+END(compat_sysenter)
 
-ENTRY(compat_int80_direct_trap)
+FUNC(compat_int80_direct_trap)
         CR4_PV32_RESTORE
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
+END(compat_int80_direct_trap)
 
 /* CREATE A BASIC EXCEPTION FRAME ON GUEST OS (RING-1) STACK:            */
 /*   {[ERRCODE,] EIP, CS, EFLAGS, [ESP, SS]}                             */
 /* %rdx: trap_bounce, %rbx: struct vcpu                                  */
 /* On return only %rbx and %rdx are guaranteed non-clobbered.            */
-compat_create_bounce_frame:
+FUNC_LOCAL(compat_create_bounce_frame)
         ASSERT_INTERRUPTS_ENABLED
         mov   %fs,%edi
         ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
@@ -352,3 +355,4 @@ compat_crash_page_fault:
         jmp   .Lft14
 .previous
         _ASM_EXTABLE(.Lft14, .Lfx14)
+END(compat_create_bounce_frame)
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -24,7 +24,7 @@
 
 #ifdef CONFIG_PV
 /* %rbx: struct vcpu */
-switch_to_kernel:
+FUNC_LOCAL(switch_to_kernel)
         leaq  VCPU_trap_bounce(%rbx),%rdx
 
         /* TB_eip = 32-bit syscall ? syscall32_addr : syscall_addr */
@@ -89,24 +89,21 @@ test_guest_events:
         call  create_bounce_frame
         jmp   test_all_events
 
-        ALIGN
 /* %rbx: struct vcpu */
-process_softirqs:
+LABEL_LOCAL(process_softirqs)
         sti
         call do_softirq
         jmp  test_all_events
 
-        ALIGN
 /* %rbx: struct vcpu, %rdx struct trap_bounce */
-.Lprocess_trapbounce:
+LABEL_LOCAL(.Lprocess_trapbounce)
         sti
 .Lbounce_exception:
         call  create_bounce_frame
         jmp   test_all_events
 
-        ALIGN
 /* %rbx: struct vcpu */
-process_mce:
+LABEL_LOCAL(process_mce)
         testb $1 << VCPU_TRAP_MCE, VCPU_async_exception_mask(%rbx)
         jnz  .Ltest_guest_nmi
         sti
@@ -120,9 +117,8 @@ process_mce:
         movb %dl, VCPU_async_exception_mask(%rbx)
         jmp  process_trap
 
-        ALIGN
 /* %rbx: struct vcpu */
-process_nmi:
+LABEL_LOCAL(process_nmi)
         testb $1 << VCPU_TRAP_NMI, VCPU_async_exception_mask(%rbx)
         jnz  test_guest_events
         sti
@@ -139,11 +135,12 @@ process_trap:
         leaq VCPU_trap_bounce(%rbx), %rdx
         call create_bounce_frame
         jmp  test_all_events
+END(switch_to_kernel)
 
         .section .text.entry, "ax", @progbits
 
 /* %rbx: struct vcpu, interrupts disabled */
-restore_all_guest:
+FUNC_LOCAL(restore_all_guest)
         ASSERT_INTERRUPTS_DISABLED
 
         /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
@@ -220,8 +217,7 @@ restore_all_guest:
         sysretq
 1:      sysretl
 
-        ALIGN
-.Lrestore_rcx_iret_exit_to_guest:
+LABEL_LOCAL(.Lrestore_rcx_iret_exit_to_guest)
         movq  8(%rsp), %rcx           # RIP
 /* No special register assumptions. */
 iret_exit_to_guest:
@@ -230,6 +226,7 @@ iret_exit_to_guest:
         addq  $8,%rsp
 .Lft0:  iretq
         _ASM_PRE_EXTABLE(.Lft0, handle_exception)
+END(restore_all_guest)
 
 /*
  * When entering SYSCALL from kernel mode:
@@ -246,7 +243,7 @@ iret_exit_to_guest:
  *  - Guest %rsp stored in %rax
  *  - Xen stack loaded, pointing at the %ss slot
  */
-ENTRY(lstar_enter)
+FUNC(lstar_enter)
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
@@ -281,9 +278,10 @@ ENTRY(lstar_enter)
         mov   %rsp, %rdi
         call  pv_hypercall
         jmp   test_all_events
+END(lstar_enter)
 
 /* See lstar_enter for entry register state. */
-ENTRY(cstar_enter)
+FUNC(cstar_enter)
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
@@ -321,8 +319,9 @@ ENTRY(cstar_enter)
         jne   compat_syscall
 #endif
         jmp   switch_to_kernel
+END(cstar_enter)
 
-ENTRY(sysenter_entry)
+FUNC(sysenter_entry)
         ENDBR64
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
@@ -331,7 +330,7 @@ ENTRY(sysenter_entry)
         pushq $FLAT_USER_SS
         pushq $0
         pushfq
-GLOBAL(sysenter_eflags_saved)
+LABEL(sysenter_eflags_saved, 0)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $3 /* ring 3 null cs */
         pushq $0 /* null rip */
@@ -385,8 +384,9 @@ UNLIKELY_END(sysenter_gpf)
         jne   compat_sysenter
 #endif
         jmp   .Lbounce_exception
+END(sysenter_entry)
 
-ENTRY(int80_direct_trap)
+FUNC(int80_direct_trap)
         ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
@@ -474,6 +474,7 @@ int80_slow_path:
          */
         GET_STACK_END(14)
         jmp   handle_exception_saved
+END(int80_direct_trap)
 
         /* create_bounce_frame & helpers don't need to be in .text.entry */
         .text
@@ -482,7 +483,7 @@ int80_slow_path:
 /*   { RCX, R11, [ERRCODE,] RIP, CS, RFLAGS, RSP, SS }                   */
 /* %rdx: trap_bounce, %rbx: struct vcpu                                  */
 /* On return only %rbx and %rdx are guaranteed non-clobbered.            */
-create_bounce_frame:
+FUNC_LOCAL(create_bounce_frame)
         ASSERT_INTERRUPTS_ENABLED
         testb $TF_kernel_mode,VCPU_thread_flags(%rbx)
         jnz   1f
@@ -618,6 +619,7 @@ ENTRY(dom_crash_sync_extable)
         xorl  %edi,%edi
         jmp   asm_domain_crash_synchronous /* Does not return */
         .popsection
+END(create_bounce_frame)
 #endif /* CONFIG_PV */
 
 /* --- CODE BELOW THIS LINE (MOSTLY) NOT GUEST RELATED --- */
@@ -626,7 +628,7 @@ ENTRY(dom_crash_sync_extable)
 
 /* No special register assumptions. */
 #ifdef CONFIG_PV
-ENTRY(continue_pv_domain)
+FUNC(continue_pv_domain)
         ENDBR64
         call  check_wakeup_from_wait
 ret_from_intr:
@@ -641,26 +643,28 @@ ret_from_intr:
 #else
         jmp   test_all_events
 #endif
+END(continue_pv_domain)
 #else
-ret_from_intr:
+FUNC_LOCAL(ret_from_intr, 0)
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
+END(ret_from_intr)
 #endif
 
         .section .init.text, "ax", @progbits
-ENTRY(early_page_fault)
+FUNC(early_page_fault)
         ENDBR64
         movl  $X86_EXC_PF, 4(%rsp)
         SAVE_ALL
         movq  %rsp, %rdi
         call  do_early_page_fault
         jmp   restore_all_xen
+END(early_page_fault)
 
         .section .text.entry, "ax", @progbits
 
-        ALIGN
 /* No special register assumptions. */
-restore_all_xen:
+FUNC_LOCAL(restore_all_xen)
         /*
          * Check whether we need to switch to the per-CPU page tables, in
          * case we return to late PV exit code (from an NMI or #MC).
@@ -677,8 +681,9 @@ UNLIKELY_END(exit_cr3)
 
         RESTORE_ALL adj=8
         iretq
+END(restore_all_xen)
 
-ENTRY(common_interrupt)
+FUNC(common_interrupt)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
 
@@ -707,12 +712,14 @@ ENTRY(common_interrupt)
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
         mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
         jmp ret_from_intr
+END(common_interrupt)
 
-ENTRY(page_fault)
+FUNC(page_fault)
         ENDBR64
         movl  $X86_EXC_PF, 4(%rsp)
+END(page_fault)
 /* No special register assumptions. */
-GLOBAL(handle_exception)
+FUNC(handle_exception, 0)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
 
@@ -880,92 +887,108 @@ FATAL_exception_with_ints_disabled:
         xorl  %esi,%esi
         movq  %rsp,%rdi
         tailcall fatal_trap
+END(handle_exception)
 
-ENTRY(divide_error)
+FUNC(divide_error)
         ENDBR64
         pushq $0
         movl  $X86_EXC_DE, 4(%rsp)
         jmp   handle_exception
+END(divide_error)
 
-ENTRY(coprocessor_error)
+FUNC(coprocessor_error)
         ENDBR64
         pushq $0
         movl  $X86_EXC_MF, 4(%rsp)
         jmp   handle_exception
+END(coprocessor_error)
 
-ENTRY(simd_coprocessor_error)
+FUNC(simd_coprocessor_error)
         ENDBR64
         pushq $0
         movl  $X86_EXC_XM, 4(%rsp)
         jmp   handle_exception
+END(coprocessor_error)
 
-ENTRY(device_not_available)
+FUNC(device_not_available)
         ENDBR64
         pushq $0
         movl  $X86_EXC_NM, 4(%rsp)
         jmp   handle_exception
+END(device_not_available)
 
-ENTRY(debug)
+FUNC(debug)
         ENDBR64
         pushq $0
         movl  $X86_EXC_DB, 4(%rsp)
         jmp   handle_ist_exception
+END(debug)
 
-ENTRY(int3)
+FUNC(int3)
         ENDBR64
         pushq $0
         movl  $X86_EXC_BP, 4(%rsp)
         jmp   handle_exception
+END(int3)
 
-ENTRY(overflow)
+FUNC(overflow)
         ENDBR64
         pushq $0
         movl  $X86_EXC_OF, 4(%rsp)
         jmp   handle_exception
+END(overflow)
 
-ENTRY(bounds)
+FUNC(bounds)
         ENDBR64
         pushq $0
         movl  $X86_EXC_BR, 4(%rsp)
         jmp   handle_exception
+END(bounds)
 
-ENTRY(invalid_op)
+FUNC(invalid_op)
         ENDBR64
         pushq $0
         movl  $X86_EXC_UD, 4(%rsp)
         jmp   handle_exception
+END(invalid_op)
 
-ENTRY(invalid_TSS)
+FUNC(invalid_TSS)
         ENDBR64
         movl  $X86_EXC_TS, 4(%rsp)
         jmp   handle_exception
+END(invalid_TSS)
 
-ENTRY(segment_not_present)
+FUNC(segment_not_present)
         ENDBR64
         movl  $X86_EXC_NP, 4(%rsp)
         jmp   handle_exception
+END(segment_not_present)
 
-ENTRY(stack_segment)
+FUNC(stack_segment)
         ENDBR64
         movl  $X86_EXC_SS, 4(%rsp)
         jmp   handle_exception
+END(stack_segment)
 
-ENTRY(general_protection)
+FUNC(general_protection)
         ENDBR64
         movl  $X86_EXC_GP, 4(%rsp)
         jmp   handle_exception
+END(general_protection)
 
-ENTRY(alignment_check)
+FUNC(alignment_check)
         ENDBR64
         movl  $X86_EXC_AC, 4(%rsp)
         jmp   handle_exception
+END(alignment_check)
 
-ENTRY(entry_CP)
+FUNC(entry_CP)
         ENDBR64
         movl  $X86_EXC_CP, 4(%rsp)
         jmp   handle_exception
+END(entry_CP)
 
-ENTRY(double_fault)
+FUNC(double_fault)
         ENDBR64
         movl  $X86_EXC_DF, 4(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
@@ -988,8 +1011,9 @@ ENTRY(double_fault)
 
         movq  %rsp,%rdi
         tailcall do_double_fault
+END(double_fault)
 
-ENTRY(nmi)
+FUNC(nmi)
         ENDBR64
         pushq $0
         movl  $X86_EXC_NMI, 4(%rsp)
@@ -1116,21 +1140,24 @@ handle_ist_exception:
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
 #endif
+END(nmi)
 
-ENTRY(machine_check)
+FUNC(machine_check)
         ENDBR64
         pushq $0
         movl  $X86_EXC_MC, 4(%rsp)
         jmp   handle_ist_exception
+END(machine_check)
 
 /* No op trap handler.  Required for kexec crash path. */
-GLOBAL(trap_nop)
+FUNC(trap_nop, 0)
         ENDBR64
         iretq
+END(trap_nop)
 
 /* Table of automatically generated entry points.  One per vector. */
         .pushsection .init.rodata, "a", @progbits
-GLOBAL(autogen_entrypoints)
+DATA(autogen_entrypoints, 8)
         /* pop into the .init.rodata section and record an entry point. */
         .macro entrypoint ent
         .pushsection .init.rodata, "a", @progbits
@@ -1139,7 +1166,7 @@ GLOBAL(autogen_entrypoints)
         .endm
 
         .popsection
-autogen_stubs: /* Automatically generated stubs. */
+FUNC_LOCAL(autogen_stubs, 0) /* Automatically generated stubs. */
 
         vec = 0
         .rept X86_NR_VECTORS
@@ -1183,6 +1210,7 @@ autogen_stubs: /* Automatically generate
 
         vec = vec + 1
         .endr
+END(autogen_stubs)
 
         .section .init.rodata, "a", @progbits
-        .size autogen_entrypoints, . - autogen_entrypoints
+END(autogen_entrypoints)


