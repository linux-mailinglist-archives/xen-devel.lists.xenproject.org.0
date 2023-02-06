Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF60268BCCC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 13:31:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490332.758966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0eh-0002K9-7X; Mon, 06 Feb 2023 12:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490332.758966; Mon, 06 Feb 2023 12:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0eh-0002Hk-4b; Mon, 06 Feb 2023 12:31:31 +0000
Received: by outflank-mailman (input) for mailman id 490332;
 Mon, 06 Feb 2023 12:31:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pP0ef-0002He-Gr
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 12:31:29 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c5ff440-a61a-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 13:31:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8553.eurprd04.prod.outlook.com (2603:10a6:20b:434::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 12:31:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 12:31:24 +0000
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
X-Inumbo-ID: 2c5ff440-a61a-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8NayQFp5KFcDVU8DDhsazdfj1truTFvURGmoO1s7XzVuTZUrGS3Edq4Qf0Hq0+ztPtOBet8U7k187fH8drp1cSyivs7UIszpdIt0BtiDEiHav2GDka3wKFEptJnp3HY2WVQuV4pmqMmB+V0+r0avsHyS/WXIlcoSOcFS4GOISSlzD969xZas5oR0pLtlSMAsR20VNcM0xyim1tr69ScOQ8k+7OrQ51vij/Z24VPfbYsKXzRDfj7oske0+wcO2M0q87LDK7B4dxqET98VM6PDQTgwR4RBrbS+8x1k7LpKMDIgp5Bju6INYY2/Mi62p+vqrj4qHJa2Yd+hImk5usIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut/YifaKxztSMJt+03Xs/uH6xYHPVthbAnNTIuGGt2Q=;
 b=mFr1sWS55kwe6+Bvokn4xGsSlPDoTHRkrtEEWDp5ZkhdPyy72qWr5/OeCWbcTDd7yvhvIO4W+jDRuXtH0Ohlc2vs1+aHRura9wV9AwsYd/OOndeET2Olxgw+PL+Be3QoRQRMCVbyVUcGQy3/gY+vUuSpS190hfXxmwEth8PEISOSWhjphB/MYdWIG+U7gWw1OdjRfsL3DFoUiq38sT+lyHGP1NwXFRrgzMISx0vdqefZoDYB59gFPqaYZ4nSCBowApQbGZKQTozg0jW8r+n1yeRhzzzO6+eIBTAwbOF5Sh/w/8LjNDiPI0271VfV6ylXkWuYOyIMLuwKTa9co0uuVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ut/YifaKxztSMJt+03Xs/uH6xYHPVthbAnNTIuGGt2Q=;
 b=Q49gu4dpEHKdLlfW41K27GD3ipUSVXXJADDEjBX6VhsA+EIifgLn0TWRLIE7bFnkmsXBpCLLUIV0b9TBWTYMMlRjz5p7Tmd5nZS8wPgVpoRGkbCogm9KwyK+NnSSmxEM8SABHBZiaJ29sK7skDgm74rud0MNsp+VuuEGc7FsSQlLMrRQD3mqKPo0garhCZQ5FG2NyKRtTjJkgX3mYqaLpwtO9KrJ6RE+DK9H6wbaIQcldeFz2r5+Ui7r2fvDjHZG9oB7e2wj6Q/Nev89Z+SbC/EbdlahP+5Z15LXh41uoEgMcztYTWW8ctD/h8TX9q/5HEE00wUWucvxdEJJ+ZuI5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74fb4738-b5bd-ddbe-e376-eeabc84a28be@suse.com>
Date: Mon, 6 Feb 2023 13:31:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/time: use public interface TSC mode definitions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: 4135fffc-5556-49a3-4515-08db083e0f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tqa3YyYJBo8GhLKfrDI6uQMJvOPVNT2IGsSOsotFzIklO4hLBSxv91Z8THMAVFXPq3LJY4iHC1DvrsWPmxp+/uU2W4dmVuNXo9+qUGA8ibAvxZGLYItH7R/CSb/jFrO9MRjraTT/glXcW8JdSH+UV/S52rnUD0JCfIrQWZ2E8fDWFG0X/+lODGRa0AFFXqi0ylNO3o0t0TVwkB1wmLvNXDp9g8KVk+UZlTkbt1+GI7pCyn/0XmajZFXFk63erJG43SZs3vPDRosHu4Yd1aPAxv3wIMENoa+0AjvU00X4QXg6AyO487IN2/4OFyPQw7CvwnP5+N1x9FoxDnVr07B7UTPkaWmjWyaehflJER81nKFIB+eMqI1pEXl58ZEgNGK97/DNEI67vtH/H2NWAeisro4V5xVKquZ6v1kftUpfDnFLC6okrQvj5ry9wcOB/46SzE8AIJRnV+pGpNBexIQScNYemlEcQd72u1VKxioHS9sGZ1qM20wuAe6tuSw+ubwMaIVYp7lk6A8ZKfi9QmAjY0mox/xgWRfxFxvoHcQNGW9CvczS3jlu5T/QFNxrGQMqkMTJaYhSyPniOpAL0JX/S8dRpQ89h2lnBObmbunWCPDpmaOT2jVd9rIfahJdHlZSo9Jm1hD5OzzS5tbQYqcfXAFKlnX9Fk3hravDl4CWPqE4JcFc4GPnOIPMnsPgGHmrLVfsRleCiMQ15T1ylrZnwlpIJFJVHRJcvDhPw72b+vg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199018)(31686004)(83380400001)(36756003)(31696002)(86362001)(66476007)(66556008)(6916009)(38100700002)(66946007)(4326008)(8676002)(2616005)(6512007)(6486002)(6506007)(478600001)(186003)(26005)(54906003)(8936002)(316002)(5660300002)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHBmamNrV3ZVdWlFNXlKVmIrcnVtZ01CQlFoOXM3ck1Sd0dFWWhteDhvN3lR?=
 =?utf-8?B?b0Rra2Zrei9yWHFwaUNiUEpGVHc4TzNoam03aS8zam44ZzlWeVBmemg2WXdM?=
 =?utf-8?B?MTJuVFd6MWE3eEJkNmVhVDBqNlozYzJlTGkrdFFTeTg1WkRCaFZpdE9NZ0hr?=
 =?utf-8?B?bm9rOWZwdXFtQU9xTFE0eHdqMkVMSnpsVlk5RnNqSVVKaDgzaTJmczlGSnRQ?=
 =?utf-8?B?Q0IxZVh4S0tUNGZSdXJXdmFibWRKemE3N1gwNU9Bck9EUjk5a0plWG5xVi92?=
 =?utf-8?B?SHFKUm9PSDROaG4wUVlDbTZySmRsdUpaNTlMa1EyUTFoNW13K2VPL3RHalhZ?=
 =?utf-8?B?ZnJ5NS81VklEWDN3STF3am9ObEpYM2p4VVVGUTJZSzdzVGxXbmc0eVFtd3VL?=
 =?utf-8?B?WGJzSXQzdVZiTlhZcHVtbGdRVGROamhONDNQd05qS3ZYSWJVbnA1QzJPbGEz?=
 =?utf-8?B?aUxZMkptMGhsamRjVTU5SmI3TXNxRW0rS1dsbkZENStVbnU1dUx4RTUzZUVB?=
 =?utf-8?B?NUg4T2tmYjRIM1ByemI4R3VUSnFHZ3NzUjJwdnFBcVJQclRzdTNqQmV5TmFv?=
 =?utf-8?B?Z1pFMEREdVZtanpmeGdHMDRIdzlsbktVSkhFQnZIY1hzV0lDd3R4SHRSbVRp?=
 =?utf-8?B?cEhBdlQxNzFVZURJanorNVRJd2JTYlBUZFFNRlRQd1VJZnBpdEl0bXJ0VCt5?=
 =?utf-8?B?ckhlYVE2RkRqODNPL0hrRURtVFcwTWxMdnc4c0VMeFFrbEljc2R5VWIwcHJz?=
 =?utf-8?B?amRLNVpyR2ZSdGVMaEw2M00xNS9XZlVTLzY0RnpvR25oMGJnMHNZdmNYMmlR?=
 =?utf-8?B?Zzl0QlJGazZhZ0ZueVFPNlBIMHBtamVXSFI5MCt6S2ZaQlZnV1AvMHc5U0lr?=
 =?utf-8?B?RURGTVVIdkUxWWtIdG1JeUdqdXZyU2Y5UXVCWTg5d0RYV0hrUEFoOTB1ODVk?=
 =?utf-8?B?ak9Yek40RFJGMUhMRkRDd0N6dWNtU3VEQ0xVbFU2eXlwSWlnN0ZEamF1ZVR4?=
 =?utf-8?B?MlZTcjU2T0RhQ1dtUk5qcHdzZ1NJS0RhS0ZLNHorZXNVanE3dElaRzdENFps?=
 =?utf-8?B?VGdYSGZEelM4MS82UWhiRkFYOXdGcmx6Yk1qbGhSSDRCTmVROXdOQkcxWElq?=
 =?utf-8?B?d3Y5T09hNTMwejRqeFN0U01uYVJRRmp2U2RGaThuRHdncEM3VFRZTHJnd0o4?=
 =?utf-8?B?UkZGVytpQ3dRdzQzb1ZGN3hpa1MzaWZaWGk0TEg2OTVlUnlCbzVSeFFVR1ZB?=
 =?utf-8?B?ZkRkMG96VXA5LzgrOGlmKzNXN3BvTWpGRlRzQzF3V3RibWZxeG52K3hOTUIy?=
 =?utf-8?B?TDR3Q3A1aHNPL2lZUG8rNXdmcGxhbjVxTHZIMmE1emhTTnBWTUN4TWxDQnVU?=
 =?utf-8?B?ZXlzN3Y2aURtK2t1T0lmSW9zb3cwbHloOUhIZHV2K3BIZVJsUWIvVFJJKy9I?=
 =?utf-8?B?MFNaam9TdVBpQ2p2SUhCUmQxeWV2b3RuZVVHNElPL2V1dW9KSHVxeVh0ekkx?=
 =?utf-8?B?OHZtSzV6citkRVd1L2huWDRVMnhQWUl1VTJ1ZlE0ZGY3MEpTU25jOE9VcHhw?=
 =?utf-8?B?aUNMZGczRW5Ed1lLY0xEekYzWGtUSGpxZFR3NnAydHlCcHhDSmcxZzBxZFly?=
 =?utf-8?B?dWxnYzkycnhmYXA4a2dudmJpQ3RKYmt4MjJHY2dZcmw0ZTBxS2FQT3J6Sjg3?=
 =?utf-8?B?WG91SzVMcFliZ2hqWUswek1XQkVrWjRralYyN21TcnpzeDJOa2lxNTJNSTZm?=
 =?utf-8?B?VkM5bCt2M3ZpVUg2bW5tYlM2QjJFN0kxdUdIWnBXRFlJUUF1QS9zUE5rYTNR?=
 =?utf-8?B?bU5aWmZQQ1JhVGFJUHRLMDlmRzVxVnhWaUtnU2FBUW9oNlgyNUwyWXBVRk5S?=
 =?utf-8?B?RDhqZDFQNUhyY0xOUmt2QXEvbHR2cDRhanZYTVNjcFQ5aWJFbEVVMWI3UGlM?=
 =?utf-8?B?WWlKTE5qbXorL21JNFNudUMvODZMN3hXT1FyME5ka2wzdU9SdG9weXdMKzgw?=
 =?utf-8?B?dXc0VnZybFU4dTZBL0pJOUsvbWJJSU1QTmt1SFZ4NDdMNHFYc0x5eFhoMDFH?=
 =?utf-8?B?dUtjZ0oyVCsyVHVvM2NCM0Z0dlV3MDUxL0g2bk5RRGpURjdpK1BReFozdkd4?=
 =?utf-8?Q?est0n1pFpMDLMK8sDfJdLw07T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4135fffc-5556-49a3-4515-08db083e0f8d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 12:31:24.6374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCfIfeZMVgLXdbP3QwiHziisTcrbogwaMiApEvh2LdDgIEbDbw8kYLNUWz75eWJHox4WWEr8vKuIcR5110/bcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8553

Now that they're properly represented in the public interface, let's do
away with our private #define-s.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -36,6 +36,7 @@
 #include <xen/wait.h>
 #include <xen/guest_access.h>
 #include <xen/livepatch.h>
+#include <public/arch-x86/cpuid.h>
 #include <public/sysctl.h>
 #include <public/hvm/hvm_vcpu.h>
 #include <asm/regs.h>
@@ -844,7 +845,7 @@ int arch_domain_create(struct domain *d,
     else
         ASSERT_UNREACHABLE(); /* Not HVM and not PV? */
 
-    if ( (rc = tsc_set_info(d, TSC_MODE_DEFAULT, 0, 0, 0)) != 0 )
+    if ( (rc = tsc_set_info(d, XEN_CPUID_TSC_MODE_DEFAULT, 0, 0, 0)) != 0 )
     {
         ASSERT_UNREACHABLE();
         goto fail;
--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -4,20 +4,6 @@
 
 #include <asm/msr.h>
 
-/*
- *  PV TSC emulation modes:
- *    0 = guest rdtsc/p executed natively when monotonicity can be guaranteed
- *         and emulated otherwise (with frequency scaled if necessary)
- *    1 = guest rdtsc/p always emulated at 1GHz (kernel and user)
- *    2 = guest rdtsc always executed natively (no monotonicity/frequency
- *         guarantees); guest rdtscp emulated at native frequency if
- *         unsupported by h/w, else executed natively
- *    3 = Removed, was PVRDTSCP.
- */
-#define TSC_MODE_DEFAULT          0
-#define TSC_MODE_ALWAYS_EMULATE   1
-#define TSC_MODE_NEVER_EMULATE    2
-
 typedef u64 cycles_t;
 
 extern bool disable_tsc_sync;
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2545,13 +2545,13 @@ void tsc_get_info(struct domain *d, uint
     {
         uint64_t tsc;
 
-    case TSC_MODE_NEVER_EMULATE:
+    case XEN_CPUID_TSC_MODE_NEVER_EMULATE:
         *elapsed_nsec = *gtsc_khz = 0;
         break;
-    case TSC_MODE_DEFAULT:
+    case XEN_CPUID_TSC_MODE_DEFAULT:
         if ( d->arch.vtsc )
         {
-    case TSC_MODE_ALWAYS_EMULATE:
+    case XEN_CPUID_TSC_MODE_ALWAYS_EMULATE:
             *elapsed_nsec = get_s_time() - d->arch.vtsc_offset;
             *gtsc_khz = d->arch.tsc_khz;
             break;
@@ -2588,8 +2588,8 @@ int tsc_set_info(struct domain *d,
 
     switch ( tsc_mode )
     {
-    case TSC_MODE_DEFAULT:
-    case TSC_MODE_ALWAYS_EMULATE:
+    case XEN_CPUID_TSC_MODE_DEFAULT:
+    case XEN_CPUID_TSC_MODE_ALWAYS_EMULATE:
         d->arch.vtsc_offset = get_s_time() - elapsed_nsec;
         d->arch.tsc_khz = gtsc_khz ?: cpu_khz;
         set_time_scale(&d->arch.vtsc_to_ns, d->arch.tsc_khz * 1000UL);
@@ -2601,12 +2601,12 @@ int tsc_set_info(struct domain *d,
          * When a guest is created, gtsc_khz is passed in as zero, making
          * d->arch.tsc_khz == cpu_khz. Thus no need to check incarnation.
          */
-        if ( tsc_mode == TSC_MODE_DEFAULT && host_tsc_is_safe() &&
+        if ( tsc_mode == XEN_CPUID_TSC_MODE_DEFAULT && host_tsc_is_safe() &&
              (d->arch.tsc_khz == cpu_khz ||
               (is_hvm_domain(d) &&
                hvm_get_tsc_scaling_ratio(d->arch.tsc_khz))) )
         {
-    case TSC_MODE_NEVER_EMULATE:
+    case XEN_CPUID_TSC_MODE_NEVER_EMULATE:
             d->arch.vtsc = 0;
             break;
         }
@@ -2674,7 +2674,8 @@ static void cf_check dump_softtsc(unsign
 
     for_each_domain ( d )
     {
-        if ( is_hardware_domain(d) && d->arch.tsc_mode == TSC_MODE_DEFAULT )
+        if ( is_hardware_domain(d) &&
+             d->arch.tsc_mode == XEN_CPUID_TSC_MODE_DEFAULT )
             continue;
         printk("dom%u%s: mode=%d",d->domain_id,
                 is_hvm_domain(d) ? "(hvm)" : "", d->arch.tsc_mode);

