Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0447348C091
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 09:59:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256401.439955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ZT1-0000ED-My; Wed, 12 Jan 2022 08:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256401.439955; Wed, 12 Jan 2022 08:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ZT1-0000BZ-JC; Wed, 12 Jan 2022 08:58:51 +0000
Received: by outflank-mailman (input) for mailman id 256401;
 Wed, 12 Jan 2022 08:58:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7ZT0-0000BT-7z
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 08:58:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db6f004d-7385-11ec-81c1-a30af7de8005;
 Wed, 12 Jan 2022 09:58:49 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-nFagUA8zOtqKxmfUNr9d5Q-1; Wed, 12 Jan 2022 09:58:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 08:58:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 08:58:45 +0000
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
X-Inumbo-ID: db6f004d-7385-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641977929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qrDBjtlHNL0vZBboJ96Xxy8oNO05U40g4Flg56XKv7A=;
	b=OLfpwZUJzwEVGXC/ZM7uNrfidMJu/Xm7/TP9v6GlVMD0PyAyGRW/+UeH0oAFpUuCidr2sy
	7hZ+eDCtKq/Zu85Ok8u8KQp1g0X/pKjCR1sY3IX7mhsWM1iksc1uRYnFyp4LKTEfQ8Od7Y
	Ij+dslxkTPhf0tVlI74axrQMvENrt0w=
X-MC-Unique: nFagUA8zOtqKxmfUNr9d5Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWMISnPiQadW/kP1ke3K0Z23N3coa/GP+hYqIkGP5xb0qlDPm2w6RC+0RZNs2meZ5JVVs3v9H9/jXtnzAjIe5OBisOqAbiDuo+K0rrrKYd8CZA/KQhV60Pc/4JaCoEf6/NI5bvqxmGErvcZzs1zeS06zPRaEdIyGZd8xA7bCI2PEwHHnNaZg8gQkhxV/r0m5vtkHr0ZvewrCkFSCR08SITH0aYTncpioyhUTtRjgTjkDrpOq9+s1zj0ierVF69CNFts6NwhH8YUwigeDRFcXbAo/ZDHHFzKkMpKfgflXBailDwtkLV/t0BNKvFKsow7HCbVvYnjVF78eSpuKyfa/Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrDBjtlHNL0vZBboJ96Xxy8oNO05U40g4Flg56XKv7A=;
 b=AUuGJlw+kODXAL6oH0Is4YHK3153jpItpxyfkIeNWe+x7bbDLp2aMDBSQXkCQLJNMXUeGKx3GDJOK8xAlKqOBz3y18I8not3C6FFSbtswlNoWxvoQoU1XuBsrDmYp9aMQef6PDGLDPHWalO4jhr4M2dYtGYkDrbmB/I1XsgVAjBDkn5uuizUut7ExG7Zo1HPUuK6Izf+J5ndJ2W+dx4Do627FkAXgb/aV8Bb3jZMMEsKYbDEorOeJ4aTjO3nwHTHRs2QngUZr7Des+1FE97QC0qzwAY/NsrgwJcReXzHbsH0lXBt+LTWDn7pT4lE0BKOQP/nuaC9byTtgmLbKqwoiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87997f62-a6e2-1812-ccf5-d7d2e65fd50e@suse.com>
Date: Wed, 12 Jan 2022 09:58:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/time: switch platform timer hooks to altcall
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0006.eurprd05.prod.outlook.com
 (2603:10a6:203:91::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76a2fd9b-6f5b-4697-a537-08d9d5a9bd7b
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3120FC0DEE94440A27F87248B3529@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G/dLdwGca5tehNe199ydyGEe8OkeKm7mkwTQtZzCYVx5MJraaavjqcGOGKPNxEnMJYPhwO5O2LdKgg3Utd/H0Bj4WB7NwKikW8yD7dVduCeDTytHZWXe+PlidTejpf8VrSumlo6YwBXbT0ms/ynUnWa65obdCzyjgS1gLM3xqkCJqZlt9lMM63vc3Ik888IUxdgnnq9HvX2S2hkIMxcJO6F6MZKZrAnphkaHMHLioktRI9LyFjUMuxtbTB1/sCq3WSiFJumymbUA0Cj3a5fNybL1M8zKC7kHfkNZ60zafAHNIWfv/pz+4OmJI2g/iQ6frM/yZ9gDmRNT/7PlP89Frkseaexnl4Vvqi7HpyA/Ph1hR3FSyPDgTCWskaPqfa3sdaT4iJK2NVZyzR4BVyUSfmc1Da/nhrNnJfk/DlhMSpxaFHeO2zvezU34f8SaOerds8tf+uPsq8o81JfVU+zHjDfyz1r53WxcpkSZe5jzTCLRTHytWLH7X3RAijDxSAlMyCJ0ut77XWtcbz6olcTRSjNERWx6OZpumPGPwOEMeK1+87YgcbDjn5AOwnlQAC0OcJDwPJdp9dcZEpai/X6bNm7jbv6MuE0fqpR1R2gGaLyyQUJeQAShVdK7AcEcB9ZrFRMwryOMiQRAVBlE9fpHqQCx2b0yHSuQgkk5i0x8qYS/2JltF9niB+Zt1SQokyfZgOCUHW+QAvKlAE7f0J3fw6cnp3kVrGRCrOm4WUpVvwg+3on1u5KhLQ97rTMVjHeU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(31696002)(66476007)(6916009)(2906002)(186003)(26005)(66946007)(66556008)(316002)(86362001)(6506007)(54906003)(5660300002)(36756003)(8676002)(8936002)(31686004)(38100700002)(6512007)(4326008)(508600001)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akl4MHE2QWhDM0pRNVdsckdMRUk4UU9tVURITFR5OWtZY01vTng3OFJ6Sndn?=
 =?utf-8?B?VVJtb2ptVjdaNEt3OUdmZ0J5VzQ2RUljbWhJbkVnNkpPVWxGRXpqWUJqY25y?=
 =?utf-8?B?ODlTeXVqTEpZNHdNdlBRM1pFaXlhSnBlMk9NSGpkOWhBdWNMb0l0c2Vya2Fs?=
 =?utf-8?B?Z1dmQWZCVWRwQjRzQ3dCZk82dHZpR0YzWlBRS00zVi9GUGlnejFjVmtyTnRm?=
 =?utf-8?B?bTlaMXI5ZThZRjR1NUo3d0xkdVhLcFJKQlN4cGFmYW1JRHA1VmljSmFZM0sx?=
 =?utf-8?B?UzlhcStrTUExTmhWazRzOHlTZWlXWkZoVlI5K0N2UjBNMlJXYUYvKy8xNnVJ?=
 =?utf-8?B?WjlzRWg2N2wzMmpibjlHLysxdG4vTFJnRHVzelAwU1FVczN1WFVLZzc5djkx?=
 =?utf-8?B?cmQrWDhtL3BmUWY2WWFhYVNDNEowZ0QrZ2p0Ukx5ZytxWDl3R1NybDE4RzY4?=
 =?utf-8?B?R052S05RaFdsUXc5K1pZQklaRkxUT0VKeEVmdktwUlZGbFRMaWxzYkxLdmRH?=
 =?utf-8?B?Y3ExbDI4ZzBMbWljQXFLdFI2eDdJRjFoWHZncTNiRm1RYVRzMmZqYit3RVJG?=
 =?utf-8?B?MHUvMnZoL1A4aWo4UUNGc0dtZmZFREV0eTRkRUMvZ3NjSE8yb3k2aTMzTmRa?=
 =?utf-8?B?dDhqek1meXk2OG1kMWFOMFo2cW1LVENqVnpUOHcvbXM4RUhOb1B4ck9HRkh4?=
 =?utf-8?B?Y3p1UDllV2JYaFdkOWJCa1pwSmVNR2lnUkxrd1RSRVArZzBneU50VW5RMDdY?=
 =?utf-8?B?YTVQZmVLV1dMdDZ1eENGemFtYmJmMWpFNlMxZng2L2d4WkVYd0NDQUtGY2hq?=
 =?utf-8?B?ZlBmakloZEN0dUhyZ2V0SGp6NDV1VTBmWUNQSGhrdk5Zd1lOZDJBY1lyVUNZ?=
 =?utf-8?B?M0NNRy8yaFYzWHZnc2wwcktweGdzdGw5QnAwbU11RGJFcnJIVDNIUTQxOXVj?=
 =?utf-8?B?cU5uS1hHczFZaUhIRmNoTHBpc29HWTZTSFpteGdpRFhUUk5FSDZOVnM0SWRB?=
 =?utf-8?B?QlNNcWxWWGY0YkhqTU9QSEJGYnc4bzhyb2ZuN2V0N2NkNzNUOGtSQjFtTUJr?=
 =?utf-8?B?dTlpVUtKT0hkazgzeVVXL3VCMTBaR2o3Tk0xWExBVnhzR0hibFBNMlpXTjNr?=
 =?utf-8?B?N0JBZXdtVjY0bkdJc1hnaWtzN1FjcTBSNWRtcHFSa2pmZGhJZG9LTzJTYVhZ?=
 =?utf-8?B?MDJZSjljMko3UFhZY1MzaHhiQTc1Y0Qva1R5R1piUWhYcEJ2T05udnpXYmJX?=
 =?utf-8?B?NGVMQnoxdmxPOERDbVpzRUx3TWhrMUovOTI1TklpMjhCeU93QTMvSnJTTzgy?=
 =?utf-8?B?Y3hRQUVhSDVEbDJNNURQSmdlcnI0eE1ITktYcXU2YjdYbFVvSGxiZlJqR2VU?=
 =?utf-8?B?SjlubUZLWThCL3VyQ3o3cnZucXh4OU1NSS90VkdoZUlWcnE1U21GaFVFVXl5?=
 =?utf-8?B?TDJITjFnZ2dZbzdib2VaM3plWWx3N2xvOGFwaWNFUWE2TG5Lam0rWFBRMHV6?=
 =?utf-8?B?QzVKdVpmZjJqb0Z0UEpkVm41SEk4R1R5djZ6bUxzNC92L3RHeVExQzdMSWh4?=
 =?utf-8?B?d09uakxXMGVncmd4K2kyUUZDV1M3YnVIZFUzazdWb2pxNzR1aVNMcDJ3UFNN?=
 =?utf-8?B?UlcwU2JYck91WWVGSGtybEg3MGRXWTF0L05ZVTU0Ujg5ZHVBUTB3Nk9GSlRr?=
 =?utf-8?B?UU9yQWFrOGptckY0Z3RLMHIvOWFCSms4K1ZrS3NxVTFqcHRDYlBYTG4zbXBG?=
 =?utf-8?B?akRzWlE0dWdlY0c1ZVRjZHVPTFFRNWpFbDU0VjBEc0RsSGpteDcrSkdUcjVT?=
 =?utf-8?B?andhMXpqRzFEK3E5dW5MSHlNdzdNZTNKendkc0xFWVlqa1ppNFB0eUg4NWw1?=
 =?utf-8?B?aXNjQllySU42cTc4ekdVb0o4akp1SzJKc3dOOGFWOFFqTXFnTjJyZ3ZCblFr?=
 =?utf-8?B?RmlicHRqaXlvYlVER3RCR0xjWGthS0Myb1c0dEsyRENtS3B5bVVOc3J3cmdG?=
 =?utf-8?B?dVdUcXhMOGJ2eXlPSFFYclQzaXYxMWQvdW9IaWZlMU5NTjRRa1BmTWZYMGlL?=
 =?utf-8?B?MHZCenl5bVlaRzM5MmdBc0Zya1dpNUpjaVpGd3FPMy9YSWVma1MvVU02MU9n?=
 =?utf-8?B?V0lSNDkzRkpCMnFmYnRVT0EyM1d2TGc0QVlmRDBZZVpsREtEZ2VqQVVGU2wx?=
 =?utf-8?Q?gaDlQw06i+BTtAkKxUHlOP0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a2fd9b-6f5b-4697-a537-08d9d5a9bd7b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 08:58:45.6301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ToOV6vv2QoqusBX3F99X3p/2VHA9ozMcYLc1Fv44jwgZxevP3S04radoQeTbeMOUw9IZWq+agZY5HwmOedVWQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

Except in the "clocksource=tsc" case we can replace the indirect calls
involved in accessing the platform timers by direct ones, as they get
established once and never changed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Sort of RFC, for both the whether and the how aspects.

TBD: Overriding X86_FEATURE_ALWAYS is somewhat dangerous; there's only
     no issue with e.g. hvm_set_tsc_offset() used later in time.c
     because that's an inline function which did already "latch" the
     usual value of the macro. But the alternative of introducing an
     alternative_call() variant allowing to specify the controlling
     feature also doesn't look overly nice to me either. Then again the
     .resume hook invocation could be patched unconditionally, as the
     TSC clocksource leaves this hook set to NULL.

--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -268,8 +268,7 @@ static void init_or_livepatch _apply_alt
              * point the branch destination is still NULL, insert "UD2; UD0"
              * (for ease of recognition) instead of CALL/JMP.
              */
-            if ( a->cpuid == X86_FEATURE_ALWAYS &&
-                 *(int32_t *)(buf + 1) == -5 &&
+            if ( *(int32_t *)(buf + 1) == -5 &&
                  a->orig_len >= 6 &&
                  orig[0] == 0xff &&
                  orig[1] == (*buf & 1 ? 0x25 : 0x15) )
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -24,7 +24,7 @@ XEN_CPUFEATURE(APERFMPERF,        X86_SY
 XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
 XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
 XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */
-/* Bit 12 - unused. */
+XEN_CPUFEATURE(CS_NOT_TSC,        X86_SYNTH(12)) /* Clocksource is not TSC */
 XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
 XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
 XEN_CPUFEATURE(SC_NO_BRANCH_HARDEN, X86_SYNTH(15)) /* (Disable) Conditional branch hardening */
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -786,6 +786,14 @@ static struct platform_timesource __init
  * GENERIC PLATFORM TIMER INFRASTRUCTURE
  */
 
+/*
+ * Override for alternative call patching: Since "clocksource=tsc" is honored
+ * only after all CPUs have been brought up, we can't patch indirect calls in
+ * that case.
+ */
+#undef X86_FEATURE_ALWAYS
+#define X86_FEATURE_ALWAYS X86_FEATURE_CS_NOT_TSC
+
 /* details of chosen timesource */
 static struct platform_timesource __read_mostly plt_src;
 /* hardware-width mask */
@@ -818,7 +826,7 @@ static void plt_overflow(void *unused)
 
     spin_lock_irq(&platform_timer_lock);
 
-    count = plt_src.read_counter();
+    count = alternative_call(plt_src.read_counter);
     plt_stamp64 += (count - plt_stamp) & plt_mask;
     plt_stamp = count;
 
@@ -854,7 +862,7 @@ static s_time_t read_platform_stime(u64
     ASSERT(!local_irq_is_enabled());
 
     spin_lock(&platform_timer_lock);
-    plt_counter = plt_src.read_counter();
+    plt_counter = alternative_call(plt_src.read_counter);
     count = plt_stamp64 + ((plt_counter - plt_stamp) & plt_mask);
     stime = __read_platform_stime(count);
     spin_unlock(&platform_timer_lock);
@@ -872,7 +880,8 @@ static void platform_time_calibration(vo
     unsigned long flags;
 
     spin_lock_irqsave(&platform_timer_lock, flags);
-    count = plt_stamp64 + ((plt_src.read_counter() - plt_stamp) & plt_mask);
+    count = plt_stamp64 + ((alternative_call(plt_src.read_counter) -
+                            plt_stamp) & plt_mask);
     stamp = __read_platform_stime(count);
     stime_platform_stamp = stamp;
     platform_timer_stamp = count;
@@ -883,10 +892,10 @@ static void resume_platform_timer(void)
 {
     /* Timer source can be reset when backing from S3 to S0 */
     if ( plt_src.resume )
-        plt_src.resume(&plt_src);
+        alternative_vcall(plt_src.resume, &plt_src);
 
     plt_stamp64 = platform_timer_stamp;
-    plt_stamp = plt_src.read_counter();
+    plt_stamp = alternative_call(plt_src.read_counter);
 }
 
 static void __init reset_platform_timer(void)
@@ -975,6 +984,10 @@ static u64 __init init_platform_timer(vo
     printk("Platform timer is %s %s\n",
            freq_string(pts->frequency), pts->name);
 
+    if ( strcmp(opt_clocksource, "tsc") ||
+         !boot_cpu_has(X86_FEATURE_TSC_RELIABLE) )
+        setup_force_cpu_cap(X86_FEATURE_CS_NOT_TSC);
+
     return rc;
 }
 


