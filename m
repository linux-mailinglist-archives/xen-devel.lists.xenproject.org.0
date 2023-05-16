Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C357046D5
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 09:47:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535016.832598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypPE-0002tj-87; Tue, 16 May 2023 07:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535016.832598; Tue, 16 May 2023 07:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypPE-0002q5-2u; Tue, 16 May 2023 07:47:36 +0000
Received: by outflank-mailman (input) for mailman id 535016;
 Tue, 16 May 2023 07:47:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pypJS-0006iO-0N
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 07:41:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15c9742b-f3bd-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 09:41:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8988.eurprd04.prod.outlook.com (2603:10a6:20b:40b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 07:41:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 07:41:34 +0000
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
X-Inumbo-ID: 15c9742b-f3bd-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwDP8lrmopysT0jkBOYL0tQU94M6nwMe8EquTAPdA1iqQfaU6m6YcLwbqCGph5G/apICtXr9I7Tn69iSa3MZrXIA7TAaq+7w6ZhKyloeeN40qX5cwC0V9c+f30VL56UCYuI/vjp6B8aUWPtDGN5iCP47a6zIk+vrIl/pUOXxf0l5DKnm4APnYKkG2tWQ71X37mL17I4Oo2xOicpPWo5A/MqIVjlk/rMmAhWhrTP9pIcIjRa32N7G6AvG8KrME05dlsi6xnG92+FOjweqLas8usYupryxqMZ73TiJH+WXQ6qy7KbPffpOE9FnywZwo9HqlLP4sFTe2Vwapz8Kj7MVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=na5tx/nGh+nhBImZ7UOWh0/j40yoMt2VPnfqJBakobc=;
 b=XcBJ7ClmZcu1ydINascp1KnXejJrfp/lVqwDLUUJOhWY217WAQeMAOvxnYAuKA2jbL9J7iB/zYq5THWxosZbVLcZ0O7PMuh6hV7tA/RtMQdYstaNr3OmxOsLI4XRGeagBUnwjneLWDh7YExVh2JpLQxPCoHRlYr2UNwNXKRFs9It7sDjDlJE7REhB12aKcFevdo9t84Euj7W8lGcDsi2HIQ41CV46+M9PpaTyneipb8qUsCw5LrIg2fNRYXlj+7hOyZSPi5ga57P5V2AxugAP+H4oy3etocLdIVnPKgAh8uoN+M/BDZmF97KjxaMw9sBZRob8K/rQVViUb94qQjCHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=na5tx/nGh+nhBImZ7UOWh0/j40yoMt2VPnfqJBakobc=;
 b=wM1wxf5OxHc2RXF8KC9nHn+JU/BG1mahSDHGEAwof2o84juFhwgemRaqdGPJey7FgmGr+eulSQCmziYRdV9XSO1mmQrK0cyOi+rmhbpQiq1hwc8yKLHYVLgiZkFF3vk1DWnSMOLpr0NkuRN78ySNM/fhtyndSq9pleKjNTCH3XmBp+niuMAy9nWKrx09X+dVujSoSGiIgeSN83ngNLRsz1qNzVr5KhKiKtFd4H1tBtQR8AZn2112xZZHnflnFLRyVFc9iT27dLNP2DC/FkdhFowRZFSMaM0d61UnYYnoc19ByjVhKZvhQ+qZnKyS3TbZFZseOqv2IYd7MXEAd7Egwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ebf7a96c-8529-b238-f9bf-750cf42312f9@suse.com>
Date: Tue, 16 May 2023 09:41:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 09/12] x86/shadow: drop is_hvm_...() where easily possible
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
In-Reply-To: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 38651a2e-22ff-4734-1efa-08db55e0f957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ofPcZp4K2huLoi7lv7vcziDK1iQXGEATSCK6xSN3p8B1xhq2U5Lh11QXilyG7gtH+c3jOB35/YXnY2J8m6UM5o8/5Vo1DB1GuUT1r2PPP+JCV5TNRV9MynCPiz6EvjAitCTHe6V7qOnxYE939AX4JPgOj2MBvgu070/JJkH1+DeNEc1Gb/U5sCMyhELRocjtByaRDY7/VI11Ncb85MPEMdUSAtNHZEhBwiGGuNtJ16JckSshbYjTXmhyUCaUv+W+LScteWZz02Km1JUjslh4KfjXfxMp2MfmLf4NPNhGDZqbyDQCX7S5+b6Dnxm73kCz9IDGwZSEnUvw4VOdizJEdYBheI4Ht1YptAsGI8Dx9v4FfGVrlR8KOskPPad0fi50MA1nl2Unt3zmHd+lu2DAYHSAGsgHBbD1AZPmgQHisKIPcyvAxpHvqNGtsCEAwU7zXg11VLcITdcIzfT9hxVfh1x0+GhdXNXiEiCORhJDD426QcqoJ619L93q35YpEprgLlTuA6axz1FqxbFmZwDzq+gYbjzyzXu2uzHyCb1ZPREqp4twPL2hH/dnRjjZaT9lyDKuYiuY+zozTe5cInhV20KOodgIsWT8L1UOtIGj5eEcVMsxZorgR4pBV5W6WvVt2xB/W6Hcui5DNy2fL16CpA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(2906002)(316002)(6916009)(31686004)(66946007)(4326008)(8676002)(5660300002)(8936002)(66556008)(66476007)(41300700001)(86362001)(2616005)(478600001)(54906003)(6486002)(36756003)(6506007)(186003)(31696002)(83380400001)(6512007)(26005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejZzTTJVYVNGdE13cjZqL0Y5UjdxSVBZenpSdEVFY3pwWk54QzFidFZ3Q1dt?=
 =?utf-8?B?NHZXYTc2SXZ4OEVWUTUyTURwdVFwM25RU0I2R2VLeklRRlVGeHkrTGNpNm5t?=
 =?utf-8?B?ckpFaEpwU0kxOVVPUm9waGtqNkxaL1VSWUlCVUFqVUlwaWRnZkFGZVFVQ2NM?=
 =?utf-8?B?WkRwZTV1YzlYcmZNeFRlOVNBRzhWREp6TTN4Qy9JbFU1cklaZzZONmNsZnd5?=
 =?utf-8?B?Y2dsSE9Rc3Zubng5R3Z6T1U4MkxYTTFCemlrc2JMMHF2VU1XTkxuYWpOaWlj?=
 =?utf-8?B?OEkralVaU3RFYWgwbUJ2N25rU3kvbENTRFlPd2JjM1piTkQ0eVpRZkhzVmNk?=
 =?utf-8?B?OFgxZmNiemlsamtPRUpsdzRlWXYvcitCYlRhdi9kUzdLN2t5eHlxOE8zT2Nx?=
 =?utf-8?B?R3Fmd0NaMDFuWVUrSjAzOXVPdXRwU2Q1aCtJSE94eDkwMGlua0RKSDl6eFgz?=
 =?utf-8?B?YXdQVm4xWWZyOTVJMXg2VGJ0bkNmRHFLaGZjMDhhaGZCQWJXQy81OFd6TWd4?=
 =?utf-8?B?ZDdRT1NZd083SzR6MlFOYStkczdZeVhNbUtCRVRBc2hKckZRb21xRkVHcTBJ?=
 =?utf-8?B?bEdzdThMMXMxaEo0Q3QxUitMRmdjSnBwMU1hYkhYWXlwU0tqRHZpVWplT0ho?=
 =?utf-8?B?c2J4SDhhNlZNYXN4RjlUVG5jU1dpY2x1SzROakJCWjVaQWtWUXEwWlM3QWlx?=
 =?utf-8?B?Qy91blV3NDJUbjRGcitCQTkrQm1xT2k2bnFid1FWYk0vNTE4WW44Q3dQRnhV?=
 =?utf-8?B?QWxmM2pKYTNsc0FpajhFV1JNb2VOejVOOFluc2sxTHRHRTFlSUtiK1pudDVn?=
 =?utf-8?B?bEI3NjErTEJ5ckZsWVJxZlN0ZUdKRzRlQWFYcmJ2NDExRVMzR2c2dC9XL1Qz?=
 =?utf-8?B?enZJVzNKK1o4UTlaWDdId1NLZDU4djU3WGRJWWVzdUozV2gxWTBkNzBZMCtC?=
 =?utf-8?B?TkxxS0ZJZXdTZkNVQS96aytrZHFOTUZjUStDL3NLWmxibDBRY1Y4UXMybm50?=
 =?utf-8?B?OFVzSk55eUxFaDYyQVowU3I5bys4eXJvbGlCN0JOR3BVQWFVb3hBcm9KdFVs?=
 =?utf-8?B?MjFORndDa2EwcHNtMWxob3RYZWFWS01PRTgwOFBGc0lGcUkrbDZuN1Iva0Nl?=
 =?utf-8?B?aUFBQ3dwQW5UcGhNM2N1TExNOUNHQ3VuYUg5YlNnR3BJczVuSkRYZXZPYTEw?=
 =?utf-8?B?VkdqZm1KSnp5YmgwNHNVY2x3dFVINjlmbjBES3pQa1BLOUxRMG5VdEJnNEp4?=
 =?utf-8?B?K2hjVk8wMkJQR1lrZmJ5NVcwd2F4NDd1c3R4b3NxYXVHRFRURHRjWlJqTlht?=
 =?utf-8?B?cUdjTWZmYzNYTjEyRVk1Y3RWWVgvcnRmeFV5RWVNKzF5TXhYdGduY0h2Qldj?=
 =?utf-8?B?UzBScGhrem9LTGYwQlNMaFo4WE04bEI0WVd0QlFZb05GVThxUzdrV3lHdDRk?=
 =?utf-8?B?dFhKT3lRdndqdDkyeWtZaVloalg1bE95cEYvRjFFTXNsazlodEFnaVRhSGI0?=
 =?utf-8?B?LzJPRTFVMVM1Zll0SXkyMklDQmFWcWxkWHJXQkFkalNuQjJTRG10aC9xU1RM?=
 =?utf-8?B?aDFoSHlDQVdlT3ZjRCt5OHhJVkg3ODRpaGwraXlrRlBMWm5ESzN5UFFiQXY5?=
 =?utf-8?B?S0FuU05CQnM1MGNRei9UUjFDT1pLWURVbzkvaG53RDQrWnU2NXIxOEdVaUJQ?=
 =?utf-8?B?Nm9IUitYSkdaUFJKMnUzUCswUGJOajdYc0h4WVVtQTl6RytqV01zcDlEekV5?=
 =?utf-8?B?a3JkSXpCbkVpOTVNLzdrVWI0Mnh2WmZhQTNHdHpiUFVvWmlpbDBVTkhjMjJR?=
 =?utf-8?B?VnIwbXJXMWcxc0wraEl6dmVFVWxXbXdaN1Mxa0VlT3VJd25pb1JjeFp4cFho?=
 =?utf-8?B?NjQ3ZGVkWDI1NGY0R3UwV1U3eUs3N0FmOTV0ZFNYSllTV003KzZ2dk5oU1Fa?=
 =?utf-8?B?RTk0MCtDUGRLNHJVeHViTUx5QUFWekxkOUFUWWJmMUdxcWNrUi9aVTVScFNI?=
 =?utf-8?B?bzd1dXJqYU9lZjl3Q2t4KzlXY0YvaWtxaVZQQTc2K09Oc3VIYlVKTE51SXV6?=
 =?utf-8?B?NDZSaFBtclVKT2hpQklyUkcrQWR1QW5VL1A0RktsQ0hSOW5zWmJBYzFlL0Ni?=
 =?utf-8?Q?kuZjesH/7s+N9SrgaqI+yWj08?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38651a2e-22ff-4734-1efa-08db55e0f957
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:41:34.8465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyu7/ceSWDdvQ2hEl1prD0BjH15Yjtj40PB5h+bINJPhC2bXnkNUByte1RLAghvjRESPoDQWEjqh0ew5JRrojw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8988

Emulation related functions are involved in HVM handling only, and in
some cases they even invoke such checks after having already done things
which are valid for HVM domains only. OOS active also implies HVM. In
sh_remove_all_mappings() one of the two checks is redundant with an
earlier paging_mode_external() one (the other, however, needs to stay).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over changes/additions earlier in the series.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1511,7 +1511,7 @@ int sh_remove_all_mappings(struct domain
                && (page->count_info & PGC_count_mask) <= 3
                && ((page->u.inuse.type_info & PGT_count_mask)
                    == (is_special_page(page) ||
-                       (is_hvm_domain(d) && is_ioreq_server_page(d, page))))) )
+                       is_ioreq_server_page(d, page)))) )
             printk(XENLOG_G_ERR "can't find all mappings of mfn %"PRI_mfn
                    " (gfn %"PRI_gfn"): c=%lx t=%lx s=%d i=%d\n",
                    mfn_x(gmfn), gfn_x(gfn),
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -192,10 +192,6 @@ hvm_emulate_write(enum x86_segment seg,
     if ( rc || !bytes )
         return rc;
 
-    /* Unaligned writes are only acceptable on HVM */
-    if ( (addr & (bytes - 1)) && !is_hvm_vcpu(v)  )
-        return X86EMUL_UNHANDLEABLE;
-
     ptr = sh_emulate_map_dest(v, addr, bytes, sh_ctxt);
     if ( IS_ERR(ptr) )
         return ~PTR_ERR(ptr);
@@ -246,10 +242,6 @@ hvm_emulate_cmpxchg(enum x86_segment seg
     if ( rc )
         return rc;
 
-    /* Unaligned writes are only acceptable on HVM */
-    if ( (addr & (bytes - 1)) && !is_hvm_vcpu(v)  )
-        return X86EMUL_UNHANDLEABLE;
-
     ptr = sh_emulate_map_dest(v, addr, bytes, sh_ctxt);
     if ( IS_ERR(ptr) )
         return ~PTR_ERR(ptr);
@@ -445,8 +437,7 @@ static void *sh_emulate_map_dest(struct
 
 #ifndef NDEBUG
     /* We don't emulate user-mode writes to page tables. */
-    if ( is_hvm_domain(d) ? hvm_get_cpl(v) == 3
-                          : !guest_kernel_mode(v, guest_cpu_user_regs()) )
+    if ( hvm_get_cpl(v) == 3 )
     {
         gdprintk(XENLOG_DEBUG, "User-mode write to pagetable reached "
                  "emulate_map_dest(). This should never happen!\n");
@@ -475,15 +466,6 @@ static void *sh_emulate_map_dest(struct
         sh_ctxt->mfn[1] = INVALID_MFN;
         map = map_domain_page(sh_ctxt->mfn[0]) + (vaddr & ~PAGE_MASK);
     }
-    else if ( !is_hvm_domain(d) )
-    {
-        /*
-         * Cross-page emulated writes are only supported for HVM guests;
-         * PV guests ought to know better.
-         */
-        put_page(mfn_to_page(sh_ctxt->mfn[0]));
-        return MAPPING_UNHANDLEABLE;
-    }
     else
     {
         /* This write crosses a page boundary. Translate the second page. */
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3426,7 +3426,7 @@ int sh_rm_write_access_from_sl1p(struct
     ASSERT(mfn_valid(smfn));
 
     /* Remember if we've been told that this process is being torn down */
-    if ( curr->domain == d && is_hvm_domain(d) )
+    if ( curr->domain == d )
         curr->arch.paging.shadow.pagetable_dying
             = mfn_to_page(gmfn)->pagetable_dying;
 
--- a/xen/arch/x86/mm/shadow/oos.c
+++ b/xen/arch/x86/mm/shadow/oos.c
@@ -577,7 +577,6 @@ int sh_unsync(struct vcpu *v, mfn_t gmfn
     if ( (pg->shadow_flags &
           ((SHF_page_type_mask & ~SHF_L1_ANY) | SHF_out_of_sync)) ||
          sh_page_has_multiple_shadows(pg) ||
-         !is_hvm_vcpu(v) ||
          !v->domain->arch.paging.shadow.oos_active )
         return 0;
 


