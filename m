Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBBD4B1111
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 15:57:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269897.464051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIAsQ-00062g-H1; Thu, 10 Feb 2022 14:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269897.464051; Thu, 10 Feb 2022 14:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIAsQ-0005zl-Cu; Thu, 10 Feb 2022 14:56:54 +0000
Received: by outflank-mailman (input) for mailman id 269897;
 Thu, 10 Feb 2022 14:56:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4tMu=SZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nIAsP-00056E-0y
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 14:56:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae355fb3-8a81-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 15:56:52 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-BSB99X3_NP-Sbok7g9Ki-A-1; Thu, 10 Feb 2022 15:56:50 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7443.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Thu, 10 Feb
 2022 14:56:49 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84%3]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 14:56:49 +0000
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
X-Inumbo-ID: ae355fb3-8a81-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644505011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YE7MboGMkLZsy6AR5le9057gKgoWX82z397TyOpBdFU=;
	b=Yov7ixtt7IeInxiL3TTvftE02KhjVYLUYGIn1kcWGxlXiOJUfMrzPVfnbQof/jtY8OZS2R
	XUGOQsz2zBsdk7ynfv11OH9/+//fjH9VhQZB82Md1kvpGe8B+ScMlpbT+gx9S9TWxDej5M
	mfrR7eNyqFNaSA+1z1mtjBDgmbFoyYE=
X-MC-Unique: BSB99X3_NP-Sbok7g9Ki-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tx37mHSH6rJjrFrs4JidzYTpQr2mgPykYDtZvIVsOBz8xtZbfyKO1ovmbocif8StD1haRO2pEpK/PznN/uuSn0f+C19aWOsVreQoCG73nM+bdO4UwZwbjy66stLylc01XYZS8ZZHE2SuWjlfA7uQtUpS8Nc8p8KaOMBcup4IDCcIqX/u5iC08dknKpsCGPv/aNexTWmb0wYU9JeFXtZsYkZ7tA3qELx2hixTCGqitys91FQxrwY7E1keOS2TWW6FIdQG4K6V5vmI+6aGswP80A8o/NoFj3Bt5Qgn428o9zKOEFYH3vdzKjuhPqfAwJ7rcuEUTAvRT91gbI3HJ2WQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YE7MboGMkLZsy6AR5le9057gKgoWX82z397TyOpBdFU=;
 b=nyOJBSC9YcMJTzdZP3F6zKw11GrbvNW4ou1j7Ac1gKjSJNbrx7z/0u52utyq/RGjSr/YLhAMB3A/B+ziDTdqWNIZidJMg5+eSMrbvfQ5Uu9uMnMqT+8bSAUyHy5h5c9vlH8UaFrXY47q2JfvhmHRDztvbHuyUj3X/pox1JmhD3ziCMUfoiINaWAGro/IlPd9Lx7NhodUSEc94c5Xqu+2IxEmSmwsb1KvuQv2tuAHK/oWjZmC1AV6XmpuEwwbrfFoOlF99NTQV1aOwl1DueH1yQUYPUAWFu1oZPMxcXjydFiM87f7Wvj5AjVcoXS9NwEa8KzCA1wuEBXHRhruuvauog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58f81931-cb7d-1710-4f52-380c8f880156@suse.com>
Date: Thu, 10 Feb 2022 15:56:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: [PATCH 3/3] x86/Intel: also display CPU freq for family 0xf
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5d275d7a-7751-af19-db4f-d91e3592d30f@suse.com>
In-Reply-To: <5d275d7a-7751-af19-db4f-d91e3592d30f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0111.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::16) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 664c832b-1a7d-414c-e86d-08d9eca590e8
X-MS-TrafficTypeDiagnostic: AM8PR04MB7443:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7443D1EA1FE6E922CC7C9EEFB32F9@AM8PR04MB7443.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iv9j8AQpWROW4F5d3J0s56Mjd+r1qrI6MP1pHdceWzS8tUyGXtxkPXu+gWC6OzTJ4LrZFk38TVYxjgp03YjCqo1EFvb4dDTUjI7DwQPZqpxgT6cLE/08GksVv40k8KEvxGY8j8DKyphuIqug9d1Zt0qxfKEv985b2RRmh7U8+p+QFkKcM4IF7NM9l1tCRcEeg0FGM3+j+Nv76HdHh+UPekEmx2I8Kw25dkQ6N+ty5/FUFtllFWqdR+LNY12v5CVjHLq3RCocVCeyov8wBVIXRrTKIKH0AqkkRGyAEcrbhp8xV5SKWr00HT0390N0HlgAfHGNg2qOeDYEfCkUGfCHpOruGscPrNl/VAMHeA1QpoOxDjxdk02xWKWjNJywHytJ9px3KWVXo1L3VkJWhC2aIVTPKKXdC6krHeBGhn3vVjVrnPrcbuPfxl1Z4zlO6elgKOqZ2bKZWqL4wZUcVzC3vzAUl012d7z8MYscr6sVuuazC6FEwIrbasUoG0pEvIoR47TBNm46KdLpoUZXjlwD0wAD1CYf63EygeiBRynh46iVR8W9BvMnCC/JruLV1blGtLhcm3O0eTWnqRKmNhToh0LPIOr4gsgCSoMP923qbRtthYb2svdna7NLP3cjyHdsEdgvsQWDO7ulj9iTfFkxSnTjrw2bAsZnupHasNv0dGEFfR8EMIQ/Zh2ZfthM8YFNqZQKLsVbm3XS3aGx6hAyqP+5kYXDZe5Gvho9TYz13dM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(6486002)(186003)(2616005)(31686004)(26005)(6512007)(508600001)(5660300002)(6506007)(8676002)(31696002)(36756003)(8936002)(66556008)(6916009)(66476007)(66946007)(54906003)(316002)(86362001)(38100700002)(2906002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFFTVGt0QmdFU0N1eGxqRVg5dnhSaHpqeFp0eEZkbUltWFdKRS9CSm1kNTUw?=
 =?utf-8?B?ZHphTTRRTzRDMjZINGQ3b0FBVFhKT0txeG5pRkV6UXBHR3V6ZVdON2xYQmxo?=
 =?utf-8?B?SldmMldxSzFjcmQ1RGY4RXV3VTlHOXNFZGRzWjhEbGo0cjdqRzNUQjVPcVNY?=
 =?utf-8?B?WnVPd210TVIxMWZ4T3FFOHJlbFZ3UDRIdXV2R3A0OWwyTGJPNlg4SUNOaU1I?=
 =?utf-8?B?OExzMVVlTnI4TW9QRXR2Z3ZWMDJDa3VHVmxzbGw1N1BPUHdlM2FUZlJSS2VO?=
 =?utf-8?B?dFNVR1JJbUZsbFBReEROTG5yWGYvUEF2bTFIS1pveTI3Z2FUYm9WbmRheWlX?=
 =?utf-8?B?Q25xeit2SjNDRVhWVEkyeEJPeVdtT0ZjSHQyUCtBTmYvbXl3RGd0YXhFd0NW?=
 =?utf-8?B?d3ZmMXQ2WDhvNjhPQUE2T1o4K1FGbjJ1RWNBU1Z3bVQybkFXRU8vSmlibEZN?=
 =?utf-8?B?RXJhcHAyQXFQODNtdiswUE1ERHpwelMyUG9sRXdBeXVoTEUzUFU3Vm5US1hL?=
 =?utf-8?B?VG56cWpOaUZrbVpyRU4wRHFBRWh5US9pZStRSWkvMTcwN0pKK25JMm9Vclcz?=
 =?utf-8?B?Vk83MDFQazhjN3daS3hGbXFIaGtNOG5vSjZjVjIyd05zckFRL0EySy9DZHhX?=
 =?utf-8?B?MmcvSXArZHduUHRlbXdIWGxrVW03M08vY0ZCbis2Mmo5YmhzWTFYV0k5Uk1k?=
 =?utf-8?B?cWx2cTV5Z1F2SWZPOFZmaEg4K2JZVVFiWU5zTDZVUFJUSnZwbEI1dDdlL2RR?=
 =?utf-8?B?Y0FXbThFdFV1WW9nS2lLOEVHenJVVkpnSDdWbE5EanpqM0pUUnVmekUxdnhi?=
 =?utf-8?B?T1NPdmc4R1ZoOHVXSm9SRXJTcGRlT21Ud1lzNFN0ZWxMU29qcTNUQjVxV3Vx?=
 =?utf-8?B?RTR0cEVrOEtjSis1V3ZqM0N3Zm9lUUdRbFVFemVyOWlhR3ExcDdaelZkOTBs?=
 =?utf-8?B?WEFnS2o3TVIyWUo2MzRmVm1CcXpIRWRWckZFZ2NvWTFqbFFiLzFkdDU3MWxI?=
 =?utf-8?B?WnlaYXNsSjlmOCtUQndSVkJ6ck5yeVZzYjlNR1dDRkw3RE9XWkRPRXdKT2tO?=
 =?utf-8?B?Ym9iS2ZEdU9qenM3RjhQeEx1d0VPSDVFS3JPL1h6VzlUZjFMNmZ6bTN1WWFs?=
 =?utf-8?B?Y3JRSHJORElKN3NtT3Jjcm1sL2c2VURtSHlnMlJMK3RVNlZGemcxbkY5T0xz?=
 =?utf-8?B?L1FaczNEY3BmTjRVTG9TZEorZFUvLytRbDdNWFJEc2wwYU9FeUowYzJpbitD?=
 =?utf-8?B?V1hlb0w0VlVWeG5XVFlxMklCb2NoTm81OStTVjY4RHVVbkJTWGNLcUc4Z0kw?=
 =?utf-8?B?NXZ1ZkU0TlI4aUtSVVVFSkRnRXN5Z05HU2Vmb1NmS1pwNFRRR3BmcU5rN2hN?=
 =?utf-8?B?QUprek9hZGZ2NURab2Znb1czZlhrczdkMUt4VUR1ZGp5RUdvbGY2c3lZQkg4?=
 =?utf-8?B?N0xSZ0tDNEl1TS9uZ3p2N3lmNWowdG9VRXdLZmtFaXdNdTV0bUszUjFVeGVT?=
 =?utf-8?B?d09EYk9jMGpRYTJmZDZHVXROR2VjUnYwcDZNUlh1RHl1QmN3VkhHT1dWNm5W?=
 =?utf-8?B?b3p3TVFTM251Um55SnhsaE1hOHdIM3ViNFFxYndtOG52dmhTTmQ1RHlZOVFH?=
 =?utf-8?B?c2sxYzZaakFhcnVLYjMrekE3TjF6YmtxM2FHTmVhOTFTUFFvT3VRRGtraGI2?=
 =?utf-8?B?YzBoYU5tQWRraW56U1ppb1VXY204ZjlWU2dIMEcvdjEvU044a1V2cUhVN3FV?=
 =?utf-8?B?dTZFOUVySUVKZit0T3VLdUJsaG1vQzJnRzFXdWF0VUovNjl4VEdzVWd6dmR1?=
 =?utf-8?B?REdkaXo5bTY4V0xpV1VZbndzem1QcHBmM3JwQmRBREhNc3BrSmc1bE9mNkhM?=
 =?utf-8?B?ejZmRkdzR2xuLzhpNFlyaDdJOTNOSFVYTWd2M0h1WEllVEpaTTUvbnFVeDZ6?=
 =?utf-8?B?d3hBU0pWYnhpR0VaWHE5V243RkFTSHV0WjFkKzUzdkpPWlM2cmVZY2x2KzAz?=
 =?utf-8?B?Q0h5RE5mdGpEL2Z2SWQyeVVDODNGRmhpcFlrWmxsb2pqd2FPeUZFWE9XRGdz?=
 =?utf-8?B?bXlSNS9xdHozdzl6MDJRODFoRE9hUVBIR0RsbXRYR2tPK2pLdzFOL1NGZmJq?=
 =?utf-8?B?a1FlVVdLQ0xocDFCeWF3Z0VCVXpHY3ZDTkNMZ05JdnRMMnVxZHE2eUU1MUNJ?=
 =?utf-8?Q?CaqY7FbtW2oswzXngqTZ84c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664c832b-1a7d-414c-e86d-08d9eca590e8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 14:56:49.5827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QPH8e2BnbSa4y9aeIPY3FNnb2/h4I7tNmUYA38ltNL/DJzNjd91bIZwRMwBJcmA7+qwsh7753kY95qbVhuy0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7443

Actually we can do better than simply bailing for there not being any
PLATFORM_INFO MSR on these. The "max" part of the information is
available in another MSR, alongside the scaling factor (which is
encoded in similar ways to Core/Core2, and hence the decoding table can
be shared).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The inner switch() is left indented one level too much (and with an
extra pair of braces) to limit the diff. I'd prefer to make a follow-up
patch reducing the indentation, unless I'm told to do so right here.

--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -412,9 +412,9 @@ static int num_cpu_cores(struct cpuinfo_
 
 static void intel_log_freq(const struct cpuinfo_x86 *c)
 {
-    unsigned int eax, ebx, ecx, edx;
+    unsigned int eax, ebx, ecx, edx, factor;
     uint64_t msrval;
-    uint8_t max_ratio;
+    uint8_t max_ratio, min_ratio;
 
     if ( c->cpuid_level >= 0x15 )
     {
@@ -455,21 +455,22 @@ static void intel_log_freq(const struct
         }
     }
 
-    if ( c->x86 == 0xf || rdmsr_safe(MSR_INTEL_PLATFORM_INFO, msrval) )
-        return;
-    max_ratio = msrval >> 8;
-
-    if ( max_ratio )
+    switch ( c->x86 )
     {
-        unsigned int factor = 10000;
-        uint8_t min_ratio = msrval >> 40;
+        static const unsigned short core_factors[] =
+            { 26667, 13333, 20000, 16667, 33333, 10000, 40000 };
+
+    case 6:
+        if ( rdmsr_safe(MSR_INTEL_PLATFORM_INFO, msrval) )
+            return;
+        max_ratio = msrval >> 8;
+        min_ratio = msrval >> 40;
+        if ( !max_ratio )
+            return;
 
-        if ( c->x86 == 6 )
+        {
             switch ( c->x86_model )
             {
-                static const unsigned short core_factors[] =
-                    { 26667, 13333, 20000, 16667, 33333, 10000, 40000 };
-
             case 0x0e: /* Core */
             case 0x0f: case 0x16: case 0x17: case 0x1d: /* Core2 */
                 /*
@@ -491,13 +492,33 @@ static void intel_log_freq(const struct
             case 0x25: case 0x2c: case 0x2f: /* Westmere */
                 factor = 13333;
                 break;
+
+            default:
+                factor = 10000;
+                break;
             }
+        }
+        break;
+
+    case 0xf:
+        if ( rdmsr_safe(MSR_IA32_EBC_FREQUENCY_ID, msrval) )
+            return;
+        max_ratio = msrval >> 24;
+        min_ratio = 0;
+        msrval >>= 16;
+        if ( (msrval &= 7) > 4 )
+            return;
+        factor = core_factors[msrval];
+        break;
 
-        printk("CPU%u: ", smp_processor_id());
-        if ( min_ratio )
-            printk("%u ... ", (factor * min_ratio + 50) / 100);
-        printk("%u MHz\n", (factor * max_ratio + 50) / 100);
+    default:
+        return;
     }
+
+    printk("CPU%u: ", smp_processor_id());
+    if ( min_ratio )
+        printk("%u ... ", (factor * min_ratio + 50) / 100);
+    printk("%u MHz\n", (factor * max_ratio + 50) / 100);
 }
 
 static void init_intel(struct cpuinfo_x86 *c)


