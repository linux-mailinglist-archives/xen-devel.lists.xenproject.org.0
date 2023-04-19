Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218146E77AE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 12:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523327.813281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5K6-0006Fd-Fl; Wed, 19 Apr 2023 10:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523327.813281; Wed, 19 Apr 2023 10:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp5K6-0006DA-Cr; Wed, 19 Apr 2023 10:46:02 +0000
Received: by outflank-mailman (input) for mailman id 523327;
 Wed, 19 Apr 2023 10:46:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp5K4-0006CV-KF
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 10:46:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f2ec1c3-de9f-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 12:46:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 10:45:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 10:45:58 +0000
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
X-Inumbo-ID: 5f2ec1c3-de9f-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K125paLkDc1s2CPG5UUnfiMudzOIk6DAsR9/8y6vXMWj4SrmpQruwSVisRexo6Rlfpqoi2ftM0VcPgw8e0c5EhYe27UmlbSYuUpJgVlH1ymuORoN5WCgBA07W/3GWaQtoMlRcLTYobMnDIQUYtG+le5er0AVaJQvXBiwO3MlesnjnyUKSELZPeWGCTITiAKuyKbklQHA7LWByIjDxuWnh2/Y+InEOYFwQGGCjPa0tFVmPv1kVocBXqlprLOh4aa9OB38sEqK8XWhtkWiclX4xRhLPHmhe9vjl/5CNYNSYAf0XjH11XGd48w2S8L7GgBnZfuM9GeLF1UrarqxGOfFLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgoBtbMdStYg/E8daXMr1Bc+OTEzf/aiDaWtJfzyYEE=;
 b=cFWQUhPUAgwQh80aKGonFr6PpoQ+BcYVAeZT4kRUh1Zkg7m7M9pglpmrRqEwjLk9i8SzsVMtNgr+2w/qJhVySCMeVY8LrBqroKs/JKMKnvXfLcRWur8AavgbMJ6xtgJQJHtARiBeiITF34203/5cr0/ucpT95gO61GSK/i634uJCt+gEhlwC1s7KxFffGX8kMF0cWwKb4xJkC1UWJlqozQhPFfhW4qqdBB6yG5ke6q096W0+fyRoGlz/4mePbL+yTuhD1yai9w3BdteGSoe/+6OgmyKhSz6HdAEZ2ksfr6Vd3jP9l+I4yJLDOCmgAH4yj15uW9PXqW1ZnDmpXAFQzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgoBtbMdStYg/E8daXMr1Bc+OTEzf/aiDaWtJfzyYEE=;
 b=HfOc5E/a53WNqQkgSMWRVmuEMPw06FcsuRGCRyG3p7QKZ/+Jjd95OZqI/nU/n9AhWJPV/aUhIOMF3emA3OlMjuXS1DXISVMh6sIaucMMcRZC43LukVhbq02BVx3ccTWEELPDTjL36b82/udoXpj8dLSEhMuvZRKZRh/orrn7ol00us22eTUdB6IHyka7S0uGKFnev1M2YDO6ntXmTrvcVa72YspODTpa5aTflSkqga+R0Ar2Z6RXXHIU5yF0hj7sY3Ax1VsZkMs1SIFCAAHVbc6iGdLu2QUA6kDd5c8i2XkbLS1W8/JtQ/lOWhNch4C765OqLQFj6a9XRNY33idFyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0e60520c-d660-1a83-3f57-3466a0ad617b@suse.com>
Date: Wed, 19 Apr 2023 12:45:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH 3/5] x86/PV: restrict guest-induced WBINVD (or alike) to cache
 writeback
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
In-Reply-To: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 42850444-faec-4451-0e09-08db40c3428a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mlAYDtB9+UlHT5sxw06Ju+CZj7eD0ICRjgu9Z4vP1bvZQcfedeQ3LRZ69/XD5T9bp6IGB66vxcuxXA8MgEu/wKReVSkGBu1nOgB3YNfXeuKgI5wvfKcSV/RcZy30bKkFTr4pjS2a2NJ6L4hzKlm7v/UNkmO7qxuukUpbzQZdxIphGPYL5RTWnUxu4CqR7WDbqWi9V3gVdFxdsqdNbm8GBFOYDo+tAc2esESg2l2+rjetyksNNHbHIeAv9bibtGxXI1bMMmMcYHfdE50FFG3NOHpJwaho0hYoQcUwqvKKVO85Ra57gl/RtIGCZv+hQ3IyxBgPntLM69oVupQsU3eK47SUI1GpkTFbBMlXsVyZOCO1dRpcyx0BO8yEmB92FBBEm//Rqeq2xg3cRZp+62wLuYQNSDEbt8mqGoFMVd7upirhpzOtxldSrcwF6dm3zpHGtPOzTxC+Nxp0IGHP07pgXgm2qWp4s9QsvKotENsSDdBnC8VeHzUhPJghXw1JiZJgM+ULKtE2etOrxHsN+qlggIpwSRDpghoqnDjmF/e1txT7swaRdzXQYU0wHLQFDhRGtUN+yEiwM4XSPcIGF/MQJ3ivp6MqtLwonW1+3/6werlfyxnMYceLbBtNWC2epnKLIOVDRo2amZ0QbWztnhC0KA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39850400004)(396003)(346002)(376002)(366004)(451199021)(5660300002)(86362001)(2616005)(83380400001)(31696002)(6512007)(186003)(6506007)(26005)(38100700002)(8676002)(8936002)(54906003)(478600001)(6486002)(316002)(41300700001)(36756003)(4326008)(6916009)(66946007)(66556008)(31686004)(66476007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDlsdlFsQTRPQ0d2TDBkL2JCRCthUWh0a0ljY2g5NURYYkVsMWtycFlDTy8x?=
 =?utf-8?B?RDFnZnM4bnJLYW51YUd2QWFlblpKa3JJem9TdGI1bkkwc2RaNnE3WGJMMU5C?=
 =?utf-8?B?cFkxL1lsbVNIdERIaWhRL0xZbG9QdXBDZ0ptQUw4ZEtOUFJwcmM3UVpqMTJR?=
 =?utf-8?B?djRLejZXOWRXclJ4L3hyNkJaVlpBS0p5SFg2SkdmWlVMTG8yaE9XRC9GdVZB?=
 =?utf-8?B?NVNvU2pRMmhtUE9JRG5hcVREeDc2MHkyWFNMOXQvTG1MMFBheEdkSno2WnU1?=
 =?utf-8?B?YUtYUUFvcW4yc0RBaG9kMkcya2tJajhXNytyVElRQk1KOWE0WGpENWF3K0RR?=
 =?utf-8?B?WHFNMkFuZkwrWXBjaFVWM0RtMXBHa1RRMGFucDBMdC9mbWxRRHY4UXBqcGdX?=
 =?utf-8?B?Mkg5TjVlY2NBUFRaamlHRXU2bjhVM2JMdEpYbTBXQkNlVW95SGVFay8vajU1?=
 =?utf-8?B?eXF1cVYyYk9XbnJVMVdpbDJYWFpNTVovOGRNN09rLzdMYTlIQlZRUXhEMTE5?=
 =?utf-8?B?a09MSkhpTkI0cFFRRFVDMEdoYksreHdSWlladVFTNFRMWDNkaUprNnp2OENy?=
 =?utf-8?B?eThkNVdHVUxBVlNhTGdXRHh3cUN4Wjh6VTY2NjBBc1IzSFJSblhEeW1mTzE3?=
 =?utf-8?B?T3FxeXUrVk43VlZKR01TTmpOTUhvODdjVzJqcUFhbk9BMFRnTW9uTTZIeVQx?=
 =?utf-8?B?aEY5eHNwcWZQSWgxTi9PQ3laVFdscm5NYjFtbmt5VTAyMkpTRzFIcU83eUtX?=
 =?utf-8?B?UkhoNU1PbWpSMnEvbUxJRVN5ZkRkRFJrWlpZeXhsN1cvblBTNkVGblVpREtY?=
 =?utf-8?B?NVNHRWpHbGU3cnV0bnFibkpvRlhCS0dQT0ZVTk56NWYrR0JpZEx1YzNPUVFr?=
 =?utf-8?B?UVpZWmdETE9MSi9wK3NEM2puYU8xQ3dHdGt3ZThUVEhrUWd6c3pscVhPUjZ5?=
 =?utf-8?B?RG5zNkZxL0tJMFhiT0xKb1VpU0xvMmZOYUtsc1dGKzVFL1RZWGdCd3B3ZC9u?=
 =?utf-8?B?ZFZiZ2tkZ0JzSWl0SSs0enp2cDlsNGw5cllkaytsSjZYY2xtemlLWW1TVVFG?=
 =?utf-8?B?dlh1bUM0cHpUYS9xNjFuMU5PemVVVytJRFlsWnBIMkZGdFArT3J2MEYwamJz?=
 =?utf-8?B?TFYwckFrbUZFWEttNUhLU0UyM0wrZTNVVVBSOUdoSUZWeHR3T0pDeU9HNWhi?=
 =?utf-8?B?eC9OVXJSRUhqa3paSjU2Y0JCQVNkSWlPMzRxMmJzZklsM0J5V1pMMmZyUDly?=
 =?utf-8?B?NWdMZGh6eFJybUN6cHYzbFpQVDVOZVBFMFN1NnlCbDQ0Mm1ETzRKejR6b1Yw?=
 =?utf-8?B?ZTl6K3J0VEFMUGl2TWNOSy9ZOVBMK1p6YnpJVGYxaG5qYjBrMUdKakJJRXhq?=
 =?utf-8?B?QldTc0VlV04yU25LZmhYcmpibjhKeDA1bVRJUTNUN1hJdkZjbnM4OENNZG1j?=
 =?utf-8?B?TWRtWit6aEVWcmJ3eXZ6RXBaQXlHQ3MxOVIzdUNQUFVqdDNJcW5YOUR5UCta?=
 =?utf-8?B?SE81dndCYTIzMU50eUZoaWJUeDlHcGhOY2M2WWVUM3ZuVGo1R0VWVU1wS203?=
 =?utf-8?B?dnJzSGlJalZudk5zb2FwYUZHSEMxZFJqV2tvU0dHdzMrWFFDd1JVeXZXTGZJ?=
 =?utf-8?B?M0pKb2JIN1JnblowaENQTnhsL1ltRmVJcU0rSlJyY3BPOFI4Nzdxb3dTSHh2?=
 =?utf-8?B?N1ZpbHVmUjhHSnpFanU3QkYyRnovNWluTjFjZHEzTkd0a1dSbmJ2QUNyc05t?=
 =?utf-8?B?Vk5nTFNFZkFHKytiSzRiTHZmOVZpNDB1cVkzVjdqZHRNZ3F0cnJxRHJrUzk4?=
 =?utf-8?B?UjZPNFlVUGk4b0d3N0RPcHJWMERMbzNjTXdxTjFEM3VHaW5KUGtjKzNnUmpB?=
 =?utf-8?B?d0VkU3M5WThsdVROUWFsTjlzY2IzSkpBVmNOdlVSMExHYzZTRlZmaU0yTDgr?=
 =?utf-8?B?dVFjS0c2WUwxRGVqQWp0Y3AzS1RtTEQ0aTcwbGRZbm1nTFkycmlMWkdHOC8x?=
 =?utf-8?B?cGk5MVBZOGFvWDh2U044c2dnenNEQnRpNmpxTVVLMnoveXN6V2xzZURIYlJU?=
 =?utf-8?B?cXE2b2RQWkdiSHNRUjlrRUZDQU16bkM3bDBvZlJpbkt4ajEzRHhKMHJXUWt0?=
 =?utf-8?Q?lxKS/aiDK5pKQUZtthSOp8CCP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42850444-faec-4451-0e09-08db40c3428a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 10:45:58.3667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNvkjVHBMHpDudxfPFXpZAdYoLCYQK3QRGnGWg/QY0szfAO0j1Zh5Nch+1tZgUMVV+ryjclHgQl+xTY6pKZxrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013

We allow its use for writeback purposes only anyway, so let's also carry
these out that way on capable hardware.

We can then also expose the WBNOINVD feature, as there's no difference
to WBINVD anymore. Note that respective emulation logic has already been
in place since ad3abc47dd23 ("x86emul: support WBNOINVD").

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3772,7 +3772,7 @@ long do_mmuext_op(
             else if ( unlikely(!cache_flush_permitted(currd)) )
                 rc = -EACCES;
             else
-                wbinvd();
+                wbnoinvd();
             break;
 
         case MMUEXT_FLUSH_CACHE_GLOBAL:
@@ -3788,7 +3788,7 @@ long do_mmuext_op(
                     if ( !cpumask_intersects(mask,
                                              per_cpu(cpu_sibling_mask, cpu)) )
                         __cpumask_set_cpu(cpu, mask);
-                flush_mask(mask, FLUSH_CACHE);
+                flush_mask(mask, FLUSH_WRITEBACK);
             }
             else
                 rc = -EINVAL;
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1196,10 +1196,8 @@ static int cf_check cache_op(
          * newer linux uses this in some start-of-day timing loops.
          */
         ;
-    else if ( op == x86emul_wbnoinvd /* && cpu_has_wbnoinvd */ )
-        wbnoinvd();
     else
-        wbinvd();
+        wbnoinvd();
 
     return X86EMUL_OKAY;
 }
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -238,7 +238,7 @@ XEN_CPUFEATURE(EFRO,          7*32+10) /
 /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
 XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
 XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
-XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*S  WBNOINVD instruction */
+XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*A  WBNOINVD instruction */
 XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */
 XEN_CPUFEATURE(IBRS,          8*32+14) /*S  MSR_SPEC_CTRL.IBRS */
 XEN_CPUFEATURE(AMD_STIBP,     8*32+15) /*S  MSR_SPEC_CTRL.STIBP */


