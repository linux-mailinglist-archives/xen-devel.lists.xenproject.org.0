Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B90476FA0D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576864.903492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoH8-0001sM-B7; Fri, 04 Aug 2023 06:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576864.903492; Fri, 04 Aug 2023 06:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoH8-0001ph-7Z; Fri, 04 Aug 2023 06:27:02 +0000
Received: by outflank-mailman (input) for mailman id 576864;
 Fri, 04 Aug 2023 06:27:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRoH6-0001p1-Cr
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:27:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea94aab1-328f-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 08:26:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 06:26:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:26:57 +0000
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
X-Inumbo-ID: ea94aab1-328f-11ee-b26a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkUsSQcGqfGM5ImwGHBLBeaFem9Blj4+3KnJwikvmv9DFAorPeQVi+qZhpCkUEgLVjy4QlaiKihI8JardikT6FJHOTc8fe1Vto9VZOPFYuV9eG927+upS1zvJgwiZB6tqUlP69KOWJmAbHaPSVS2C9+MxZw0H/73r0kxmhvo+ois22/sFDQ9XeJwbSCyYKto0+7zOBaYrFFje/cn5N5ZufU5zhdLUmWzme/9kPhZahVE+1gEwYJoxekeT57DcRNf7USMq4fEPPVmICFh0d1zoo2ZZUotxqLC/mN3ejyY7YLFc+gbp2vN34WLPWlFJKd1dUfmcX6mZ3eBPnM+MT7xuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoORKJUraSg+XV776ewByjof6hXH/BigXRIqZQuk5oA=;
 b=MvKG7HwTJnlX0gwUEXMsw5OmylQO6oGaPd3OMIh/alOT6yaqiaFGppCkMrZ/9A0R173sVvGEtw9qGWSUewIoTGkL3pBZG7nqpgcXzl9FnoSvcFTEL5o/Rb8GQH2POTKgdnHbSJdtf3kzoANVnvfrigOoV23NzlEsNHmX59/UGWEd98EpygmyAL6cWR0ilT7/qMDbohvgmEwm1kjUqjrygJSYPhCcV4ehvFG1Nja3oXPwmHetJykLt7ZKfepcllH3mCJc/cALwlttY6mL5KACpVqZPHG1QOGyh0wmLuJOuQMBUNTF+yCGmhFNFE1RIm2eAFsyPiX4XKeLBpfEH016Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoORKJUraSg+XV776ewByjof6hXH/BigXRIqZQuk5oA=;
 b=Qoir3ou1Vmj566cXB7U7EZ+EbkW8tCQcM7OteMWQojI4/G0F3gzBIU9qb21SO8DM5bM7CyQhTrRbNdMez2T9pCIUdCXTaCes2MH/Lcco6A8C/Jo8uPd1F7WkiaFo5YRbeSK5wDkTxJLrMXI9IWdWMe8y/M+YxCU5FmY8f6rgNUjRlvG8rFXtKl4izoPyGGf4WW0dN//UEzR5ihFi/nCOWLktzvt8dXfTv8wHdm00ua4YPoIMPaVwnHbyI5XwOYK6UmAttswtfVYH7/nRJZli9d54S93f1KfjhGVrPmYrUUachvgt+XBqC8BUSP0bBWHzf+KDJI4fT/ueq/h+0Mt53w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41f9f8e9-8eff-5e83-8730-1b7b7854336d@suse.com>
Date: Fri, 4 Aug 2023 08:26:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: [PATCH v4 2/8] x86: annotate entry points with type and size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
In-Reply-To: <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a473e54-1e6c-4192-e1a0-08db94b3cdf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	78J1Pok1vRUT0bZCDkJluMssb8/BYm7aLj/84RvrdhEqyis4aE31uPDLp2SZ93n8zhX/8m4xbjXEG/Hlgb+JGmu2QEXJwRSYIeymdiRlXFzt2hQiqO6i/+twtLF/2KclCjDZLcfEyTcElB4YA6FCVExUU2jjaowRu9W/hUyN946vzz2VnXA6tV8pHPe1XnVxZKveS4WQ69mrYetUgRxuMKck5AQB1IY/H/4iL7MqQFKpZH7DCbpg4ahiQwG5r2ibIjKtGJ/tMIPK32Llcaxa7V9oJ30O3v0D2oMuGyxoSYIYXtzRBjPHy9zN4m9mcDZv1wfoAaOnI+vrTg45cg+8r5Jak0vUnx1VY9lAjU/Af0H7GW1TD357+sHGpS1G5x/lAVwMBYRnlOSSVrLVO1WArzBISbB6q48YCfrfiExRsKvkWeDyjJRmh/5ldcWJR5PUDBwPFMCkXZdzEhHDC+aoEzdaMYjwedy0t69wANY6cNO0bC7mOeRH8og5O55qy63o9kuFHWqovXFkuqxiGxy5LoUMiP1inCz0P2Ve+iE3gSOLzmB5G1ZABjY02uNr306/5HPNQrwg/xZVLGJFTj5Gm8Wt8RdsitPYwZgRHBo08kH1oRIvXiX89F9RXQFPuGuOVSvdI99stguCqfu+l9grhg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(1800799003)(186006)(4326008)(6916009)(316002)(2616005)(66946007)(66476007)(66556008)(5660300002)(26005)(41300700001)(6506007)(8676002)(8936002)(31696002)(54906003)(6512007)(6486002)(478600001)(31686004)(38100700002)(30864003)(2906002)(86362001)(36756003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NllRZWhTTXlDWDhiNGpkZUJ3a053dmpyRkE2Wkh0cUMwMUp2YnJTWnpxWC8z?=
 =?utf-8?B?UDNzQ0o1ay9iUDBENXV6WmVKZjBNYWwwMm9YQjhhOUsyZEkrZkFBWTNoWjRP?=
 =?utf-8?B?eHhYaG1mRXQrT3hQK1FFT09JbEgwVjdsVUxraWlOQW5pZjl3ZDBJVVJhUE5P?=
 =?utf-8?B?SGJwZEhUSmwrTGF0dXlBcUtyL2RCNmM1RmhvOG9icWpFUXhaTWV0WVRGSHph?=
 =?utf-8?B?dmVWZ1NOQ3BtalJEaWxOcWFPd3dGNEphQ0Rwck0xdVlRS3pucE1KaWxMdkhW?=
 =?utf-8?B?ZTRrTEZvdE5DaWxZVVdNaW9HVEFsdmtnRlpZYTBFK2FqYkMxd2M4K00rYmJi?=
 =?utf-8?B?RnFoemxyMTBuekc1Q2xjZmJWbXQ3QWZxNG5vMDkybmNQT0l6TWdabHdsVDNF?=
 =?utf-8?B?N1dMNndRRUx6M1RaQVpTZVFaTy9ybWlVWEdZQmI1cXRyOU8vTTBNc3dPL3U3?=
 =?utf-8?B?NCtTQURqbi82am9UU3VTRndrSTFjUmxzWXJWeDZxRHlHOGludUpVZXNrcHJ2?=
 =?utf-8?B?ZW5iem5YUUhVa1F3ZU1hemE3eXNmekJOMXdISmpDTDZTSkU5TS9wVXlRaWht?=
 =?utf-8?B?ZEdMZXZGMzFrelE4ME95bGEyd1F0NnRIcVRiM2JxWVNFUXlaV2ltRTlickEx?=
 =?utf-8?B?OXZoTGpOSG81TTlxaUVibDU5czFzV2Z5d2lLc3R2S3JhaWZCbk1HL0ZCTkUx?=
 =?utf-8?B?bTI4WW1RcHpGLy9zWXNya1U3aG83YkVSS1BaVkNGVU0zbCtUNnoyZXhxTG44?=
 =?utf-8?B?RVE2YWxsVyttY2hFb0FQeEo2azZ2U1hQT0Zwb3FKcVpEYmNKWUJVQXBZVlU2?=
 =?utf-8?B?bzU2SEJVeXM5akd6UVBxYURLOTFmSW5FaGRKTnRGNDNNdU1JS2dTSXd1ZWw4?=
 =?utf-8?B?dDd1VEtMVlRTTFJYS1o4R0xVMVByaDBnMFZHN2RaNmhqVHVuM25vOVpCcHFm?=
 =?utf-8?B?YTJBS3dtaHh1bEl0MERkQitBaXdIaU9oZU9QZFd3VElJUjBaNms4TlhrU2hN?=
 =?utf-8?B?L1M2YTBXeHpaWm81VjBuMjBNa0RwRjZSQ2srUEt3ZUN4UkVDczNMRHMybTcv?=
 =?utf-8?B?L3NlUXdneUVCcEhnQlZZMGFoUmpEeStkbUJGVmxvbmNrandiM0dtb1VDRzlw?=
 =?utf-8?B?OHhZbllHM0ZhVWxNd3VodDdqWmJ6VE1BbUxWeWxvWDVmRFRoYkk3bEd1SXZY?=
 =?utf-8?B?YWE4S004YzNKY1B3YVdDbWVlSzg2VjA0elYrOVBzS2w0a3NKSDJKaWtOZ2g2?=
 =?utf-8?B?bEZ5djhEWlNPdmJ0N2I3MTZJVFFFRXZSUnRpZFdQYi9zODV0QzdBdFBnNnl6?=
 =?utf-8?B?anZLdlhYK3FhcFNaU21WcWNIUHRKdjI5Y1ZjbHZKd3plMXV2TSt0SThzWWN3?=
 =?utf-8?B?OWJXKzRqUWNkazdtZE9IQkc1UnUwOXJyM2pWKzN6WGN0OUN5V2ljNGNLanox?=
 =?utf-8?B?b28vS21IcFF0WGdsYytEVTQrdmdVMzhMd3gxc3lvN2NkQzJrODMvQ0g3QlVP?=
 =?utf-8?B?My9JeEVjK2FqcnZsdmEzWTNXZGhOVmlCeXNtM2FFeXp4TmhhdW80OUZtbnR6?=
 =?utf-8?B?T25HbXhlajFiUUtFVERBNDI5dGdRdkdZZUtWcVlTNHpkUEkzdFMxTFR6UUlQ?=
 =?utf-8?B?Y3g5UXR3MytZWXkrTFQwL3RWZndxMkphMkErbDlKSmVXL3RQbUtldi83S3g0?=
 =?utf-8?B?STR1OHlSMWNUS0xkdE4xQmg0anlIWmtqYm1CN05EVmtla3ViYkJrRTlBMXdN?=
 =?utf-8?B?bkRGZlVweDQ5bk5GTTQ2MS84aklUZTh1bDRpcm41eWFGY2FXM1pJSVJDZWxq?=
 =?utf-8?B?WGFtQTdQOW1FVHpKWk1saXRzUktDNW00Vjk1QU9yZlduS0R4ZCt2RGxtNllH?=
 =?utf-8?B?dUpEdXVDUk0zcGlaUGl1bjRqYWQzcWM1TWxyVEdoa2N0SFZvSnFvZ0VMNnpp?=
 =?utf-8?B?Wng0WFErTHJRQU4zQlQ1ME9Kc2Z6Zlo3S0VrY1VzZEVoR0ZiVkl1SVFTRTZF?=
 =?utf-8?B?bVdnMzhWeE5Na1A3a3dSQzVscmpMQXQ2M1E5N2JqNkxHajNnMklJZnlLWjEx?=
 =?utf-8?B?NURTZWxkcVlqL0ZVK3g3dG5lSS94SGVHRENWaU1iemtFVkRpUFJCK3NmWkx5?=
 =?utf-8?Q?Nc+UR6OCUWAG43yZbODaC0X9N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a473e54-1e6c-4192-e1a0-08db94b3cdf0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:26:57.9302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9izG5Q4PInDjAPyZ0+MCUnPPdsZ27WEC2Kiffup4dqv9ow1mslKszH6snaiAqwVAkeTy9LMa7QfX1W7CCnIqcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

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
v4: Correct simd_coprocessor_error's (now entry_XM) END(). Re-base.
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
 
-ENTRY(entry_PF)
+FUNC(entry_PF)
         ENDBR64
         movl  $X86_EXC_PF, 4(%rsp)
+END(entry_PF)
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
 
-ENTRY(entry_DE)
+FUNC(entry_DE)
         ENDBR64
         pushq $0
         movl  $X86_EXC_DE, 4(%rsp)
         jmp   handle_exception
+END(entry_DE)
 
-ENTRY(entry_MF)
+FUNC(entry_MF)
         ENDBR64
         pushq $0
         movl  $X86_EXC_MF, 4(%rsp)
         jmp   handle_exception
+END(entry_MF)
 
-ENTRY(entry_XM)
+FUNC(entry_XM)
         ENDBR64
         pushq $0
         movl  $X86_EXC_XM, 4(%rsp)
         jmp   handle_exception
+END(entry_XM)
 
-ENTRY(entry_NM)
+FUNC(entry_NM)
         ENDBR64
         pushq $0
         movl  $X86_EXC_NM, 4(%rsp)
         jmp   handle_exception
+END(entry_NM)
 
-ENTRY(entry_DB)
+FUNC(entry_DB)
         ENDBR64
         pushq $0
         movl  $X86_EXC_DB, 4(%rsp)
         jmp   handle_ist_exception
+END(entry_DB)
 
-ENTRY(entry_BP)
+FUNC(entry_BP)
         ENDBR64
         pushq $0
         movl  $X86_EXC_BP, 4(%rsp)
         jmp   handle_exception
+END(entry_BP)
 
-ENTRY(entry_OF)
+FUNC(entry_OF)
         ENDBR64
         pushq $0
         movl  $X86_EXC_OF, 4(%rsp)
         jmp   handle_exception
+END(entry_OF)
 
-ENTRY(entry_BR)
+FUNC(entry_BR)
         ENDBR64
         pushq $0
         movl  $X86_EXC_BR, 4(%rsp)
         jmp   handle_exception
+END(entry_BR)
 
-ENTRY(entry_UD)
+FUNC(entry_UD)
         ENDBR64
         pushq $0
         movl  $X86_EXC_UD, 4(%rsp)
         jmp   handle_exception
+END(entry_UD)
 
-ENTRY(entry_TS)
+FUNC(entry_TS)
         ENDBR64
         movl  $X86_EXC_TS, 4(%rsp)
         jmp   handle_exception
+END(entry_TS)
 
-ENTRY(entry_NP)
+FUNC(entry_NP)
         ENDBR64
         movl  $X86_EXC_NP, 4(%rsp)
         jmp   handle_exception
+END(entry_NP)
 
-ENTRY(entry_SS)
+FUNC(entry_SS)
         ENDBR64
         movl  $X86_EXC_SS, 4(%rsp)
         jmp   handle_exception
+END(entry_SS)
 
-ENTRY(entry_GP)
+FUNC(entry_GP)
         ENDBR64
         movl  $X86_EXC_GP, 4(%rsp)
         jmp   handle_exception
+END(entry_GP)
 
-ENTRY(entry_AC)
+FUNC(entry_AC)
         ENDBR64
         movl  $X86_EXC_AC, 4(%rsp)
         jmp   handle_exception
+END(entry_AC)
 
-ENTRY(entry_CP)
+FUNC(entry_CP)
         ENDBR64
         movl  $X86_EXC_CP, 4(%rsp)
         jmp   handle_exception
+END(entry_CP)
 
-ENTRY(entry_DF)
+FUNC(entry_DF)
         ENDBR64
         movl  $X86_EXC_DF, 4(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
@@ -988,8 +1011,9 @@ ENTRY(entry_DF)
 
         movq  %rsp,%rdi
         tailcall do_double_fault
+END(entry_DF)
 
-ENTRY(entry_NMI)
+FUNC(entry_NMI)
         ENDBR64
         pushq $0
         movl  $X86_EXC_NMI, 4(%rsp)
@@ -1116,21 +1140,24 @@ handle_ist_exception:
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
 #endif
+END(entry_NMI)
 
-ENTRY(entry_MC)
+FUNC(entry_MC)
         ENDBR64
         pushq $0
         movl  $X86_EXC_MC, 4(%rsp)
         jmp   handle_ist_exception
+END(entry_MC)
 
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


