Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30C0677EC5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:08:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483004.748869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyR7-0002wy-KF; Mon, 23 Jan 2023 15:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483004.748869; Mon, 23 Jan 2023 15:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyR7-0002v1-H8; Mon, 23 Jan 2023 15:08:41 +0000
Received: by outflank-mailman (input) for mailman id 483004;
 Mon, 23 Jan 2023 15:08:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJyR5-0002u3-T4
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:08:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2083.outbound.protection.outlook.com [40.107.6.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf1547f6-9b2f-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 16:08:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7632.eurprd04.prod.outlook.com (2603:10a6:102:e8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 15:08:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 15:08:34 +0000
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
X-Inumbo-ID: cf1547f6-9b2f-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESX0d6aZJWIALjANBH12ikQx4dBENLCoVvmkxA3gxLdOXDp9DGaDC9sAg0vjqyrxvfAZwoJLAF9IM5exGNavj5n9GSkB7Rh0GcrHwbuFIWPg2ujnQ7VaZUPX/vHLEaJsUtuptzd5oHB1oCLjv1ag2KWx4jUKENANqe/Rn+Nwf18/qxZQ46TrIECWyPu8o2hEd+xchNHjKYE9vDjmKlrmwwTnPywJW7jTn3XFY9FwRa/og7aOOVdfDTftOTXvaVtitFQHinS+KCCNdKZbo8NiqQZS/zQo+ScICoJXJhHtw9Sc+xjcWh9c8PF1tTK9T+eKUiHSZgHFRSHgrtYMACL1hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=to78vtEujlTxHh7jBRJbi5Ef8oA80nUnAGGqpIUa20Q=;
 b=NJT6apn/sFiVedrV0zqfUX196PQ1c8ENqGZFQqkQXKg/pdjzM0ysiTUjCcrtLkjK2wqw+Q6gFGn4fPaAZP7e2irtsd7WzuoLtSFtBadyPPxt8XHndnMS0NM72DGwsuSkmikt5/OE5PN+v0QefQgrzBNR1L4llBHTW1YvLX36zGOPGkd+P8KpbJU2U6N5y91lDAdDafdu/YvCp8/kIv+yK+6nyH+ViC8L8vXAKI7J11ofy5YwH+QdkBNCIaVRtCmIeJXRcZHQsGv2/TnWMqWlA072vV/zWM7v3VW0giPlUupERwSboLmTSy5tytTmVDPTuKa88df4gbyfgahRO4M/uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=to78vtEujlTxHh7jBRJbi5Ef8oA80nUnAGGqpIUa20Q=;
 b=h9x9QyN0fNtXJPKMyunzra1bfVpb4zhBRLxFWRlFwaXDd51S3I2dERrnc1+jh50DQcgkIC7ZRt5/CbR/j5lle8EQw4xv89BOWFjyLnfiqg2xFnc5Cmf6C5A9CiZDLZLeFU3WGF8N/pz0BwvYe3SF+qdxOuxtQxaAwSpRh7D6Npo7fNaC14+UX+BerO/SXljSIc8v5i10/pfKGxb89QGQS11sArYvl9AY5cpMBAbCvH5fW+O5U8IDyD1S92J/xIlsOOUhTi9Bo28IhozQFns9JQjUr7W+aDwwjDtthNVuO6Zs0FoaMkKRJK58AwLszFXltFrwi+fd7Er+QuaGykrLFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1d4848eb-4b99-1492-45d1-c0ce2b0ae6a6@suse.com>
Date: Mon, 23 Jan 2023 16:08:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] x86/shadow: move dm-mmio handling code in
 sh_page_fault()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <0e682cd4-3cc0-461d-ee53-13a894797f17@suse.com>
 <5d8a938e-cb4a-a989-1849-d702cd25d890@suse.com>
In-Reply-To: <5d8a938e-cb4a-a989-1849-d702cd25d890@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a474b0b-fb7f-48dd-e4bf-08dafd53b21f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JBpOhCLsUf7wlpSNvWLhUJvpl1D3L+ESfpdkImpbyldtcn6iJUEgwlKILtlX+L0mK1e1H4yWiGUhe0bm8XpyzOz0zlK/L+NLiIyb4NRZUTKgFQ8WLOptQFMJ4Ta/wnLcNYXCROIR1sUTyEt3/9mOaZCRSqBruetLBeXAtKQ3V/bGM1YbjtVMKwzj2nnVzmlu0JrXnmaWPwcG5cXmtbOejuKnoywEXR/66jq29jYAH30Cwv4SsCIN9EntBu0dq5vcQr2tWPYPfsJHTgZe7zVJYBhHzjHLUoOsEk7cAaZWArysW0+/ZP2lfobCA6NI4xF8UN1eRl5HrC/h3QJwlmkUq5ALJe8bAQtZizD9Zl59yUW/rLT/QQSPgR9GuEGePsScLrWHpBYFLuvR1oNtuwS74cxl185TfcrpfBnCakLKZPwcKU4hziGZBxqiiNTXzqkzh6cmOAXWDM92Kl14gkhGjEWZo7sJda8mEA9xH/Vi0EwORgO6zZc1j+Urx0ZPPkW1rqRv0jJJRb2fHK1/ZRe9OsRNCBPYZhgGdUvj7/xaFHMAc7Gog1y3ETV4MTUlgQ9cT3XumRmmZMRCQfVh3ziYG0+DM7PaNHjvJwWhGc5mPaHaG9RdfH/a8xaHcwyZc59LOtVwDZHrHyWBJpv4dY1q0LLYw9ihZLXm8Eq9cNRNZmR0HpDE5+qoX4B6gBeZ8WFPbrpvnFWfyDo5WTZOSbdlThO+xdr4VAf4JP6p7ZzSaFK7/uqZsXqAaQsW4vV0aDbjsHEBdJUVSwOXfvq1tZMbWHP1S8eNtcbi//cEnLE9TimOxiypNYv4up8pKjCicPOf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199015)(31686004)(2616005)(2906002)(38100700002)(41300700001)(31696002)(8936002)(5660300002)(8676002)(4326008)(6916009)(53546011)(6506007)(316002)(54906003)(36756003)(83380400001)(66476007)(66556008)(66946007)(86362001)(478600001)(6486002)(26005)(186003)(6512007)(45980500001)(43740500002)(473944003)(414714003)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVdVc0ttSVcrVnAzZ3d6QitIRDU0T1IyT2RHQnBKNURSakJVMXFVNDErcUNz?=
 =?utf-8?B?QUN0S3VQOE9jaEhOSEl3RkZibFpiNU9kUFlUNWdpY1BIazZzbEFyTXY3ZmV2?=
 =?utf-8?B?RkkyeTVLZXhLM2N2amJHdzdkQTNnOFhUd09FTkltRytYRGZZRGdVQ0xMbUFT?=
 =?utf-8?B?NjJLZWovMTZ5dXJkWEl5OFNhLytkbVF6M2RHa1VrVXlKVnlpajFRQzdtaDJx?=
 =?utf-8?B?ZmIwdTNJYWNQWGJ2NDJrTXRjOUxjaDV2WFBnb25NUVYybzJiUjFXbDNxVWFX?=
 =?utf-8?B?ZWJlSkNvMzlNeUNBbVMwZ3RoSUtCMFhtK3M1SWpRU2k4NUFXdm4xdXYxbGh2?=
 =?utf-8?B?VjRiVkVnUFlWRkZ3aVdNSWpYVkJiV2hjSkUyTnlZT2psUHdWSytOdkZVSGpF?=
 =?utf-8?B?YjY2OEpBbUpQRkJEZG5NWlBCeVBNWG1DMW44S2pzeGNFZDNsdXcvVWZ4M3E5?=
 =?utf-8?B?aThqaFZ1UTNvcnQ1RFB3a3ZUQTNCT215SkVFMm91YnZvN3FMMU4rNm5pa1Nt?=
 =?utf-8?B?ZUV5RFVQRUVObjJoRm1nS0NGL1lxU3RjdmYwMVZtZUw2b2pHY1FJMEF1alFw?=
 =?utf-8?B?M1JDc3Y1Uk4vcXY3Z2dJd3VRdEYvMFloejhMYjJrNGsvcVRwUHN2aUhBa1Fz?=
 =?utf-8?B?bEFOUmtVcnlUQ2Y2RW5jcHptUTZMNXpjKzVrUG9VRG9OUDRWdW50VXIzQ3Js?=
 =?utf-8?B?alhWL0ZzQjhWVDJFc3Z4L0kxZUFSYlA4ZnVnalA4WXAraWZocXo4YVdSd1pH?=
 =?utf-8?B?MkRCL21DTVByYjZYSXJKQloyU0xZY2krYUxLZXdJejRrQVl1TkJkYk14K05M?=
 =?utf-8?B?OFpoR2dkNnlYUnYralROVU1VeFYzV1dlS2IzNkthRDcwYXVsZkJXYzJMcGZR?=
 =?utf-8?B?ZnZCZE9hRmx1NnphejNjZXhvUHNSdHNJcHpmcXdSbXJ5ZFhjNTNMQnFLSHgx?=
 =?utf-8?B?VjZIdGNoZVNWM2ZreGRFbnZuMzZOVk9NM1l0dGpMczNKNUZiRDl0TlY5eFdT?=
 =?utf-8?B?SVVyQWVSOStCWmpMakNSSklTWWtWZDk3MjBoR0NuQ2J2WjJRbk1jMmhFNHlR?=
 =?utf-8?B?aEFIWGFjNi84Q0VmakFMa0RMUGpKd1VwK0hhbDV3TlZGQitqMmdFTmtSRS9z?=
 =?utf-8?B?bmJrRDF6YlFqRnU5ZysxaU1RT1k4bDY1YnNSby85Y3Frc0ZUM1c4aDJWc25J?=
 =?utf-8?B?a0tQclRncVlwNjFWdTRYb1FzNndyOEprSFdZYjdpd3RVM2lxenZrQml3eUlJ?=
 =?utf-8?B?RjU0cUZzbm53cUsvcUpiTDBmTlJtWVI4Qm44SGRqRkorbUhnOFV6M1BCSG12?=
 =?utf-8?B?WjM0b2RwU20vZUw2RTlSLzNmQWpBbnN6cTZ2TFJkSkxMSlVwL28zR0Vpa0pi?=
 =?utf-8?B?K2IxREx0d3FheXBQdHNESnJnNmFjQ0hBM2JLcWVzWTVDNkpRWmkzN0lwSUlP?=
 =?utf-8?B?VFZDaTd1WTVCYWNKMkFranhZRTRNa0NZcTAzb25KTVUvNm5ENjNoTFp3WlIz?=
 =?utf-8?B?enhMbHFlNVdxTkMwck9jazdjbFJBQkN6Vzk1Rktud1hXS2JMZGpOZG9WWVhn?=
 =?utf-8?B?TVNYNXBLd1ZxOEVVK0hRZ1c3cC9kLzlKd3VlT1prcGFMTU91SVhhaWJQRkE0?=
 =?utf-8?B?K3hXdmtPWFFaRStSQWJrbG81MVord3gzb0gwcm4ybWMrbnV1OGxtTEhzck5n?=
 =?utf-8?B?bkZSY0FWWHhFa3pVWlU5RVNxak9aUytQc1ZQbjF3ZzhSaURWMHEyUEphS0Vq?=
 =?utf-8?B?NzlFeUlUdzBONGpoeSs5dmhyT2xjSWU0U3phRHY1ckZlWWo3OWdtMjg2WmlY?=
 =?utf-8?B?Qll5aWgrNk5QM0V6NElHZGlKUE1pQ0g1NGR4WmlPZDJpSUR4Vk9iLzdWRlB6?=
 =?utf-8?B?NnoyV2k3SE0zS09JY1B6WkZTMVNRbE9mSmFvbWRGNlNoZTBRc2lTd01XemR4?=
 =?utf-8?B?VlVHNFhCeGdnWE5naGZPeDZRQ2ZMczFCM2EyQ0ZXM2xaUjh0WlFRT05nY09Y?=
 =?utf-8?B?U0VuTDRyUUZ0bnVMZlQraE9TOTUzMGFXNTBPamxhWGVNa2QvTk1lOWNScURl?=
 =?utf-8?B?ZjI3OG1uQkZvQW0vNEtnSHp1bUJPSmsyampBWXlkWkh0cEZHR1VWNElNV0Y4?=
 =?utf-8?Q?2p5G4O/A/tg5jsNAnRQnwMTZ8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a474b0b-fb7f-48dd-e4bf-08dafd53b21f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 15:08:34.0300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uv40RxCQCtWMcU7/DePnrE2QgohIhpFcom/aGXG7WMI4UerCAC2yHBZsRYlWMv3YnXq8EA+YJncUSQNnFLJDRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7632

On 23.01.2023 15:26, Jan Beulich wrote:
> Do away with the partly mis-named "mmio" label there, which really is
> only about emulated MMIO. Move the code to the place where the sole
> "goto" was. Re-order steps slightly: Assertion first, perfc increment
> outside of the locked region, and "gpa" calculation closer to the first
> use of the variable. Also make the HVM conditional cover the entire
> if(), as p2m_mmio_dm isn't applicable to PV; specifically get_gfn()
> won't ever return this type for PV domains.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: New.
> 
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c

I've sent a stale patch, I'm sorry. This further hunk is needed to keep
!HVM builds working:

@@ -2144,8 +2144,8 @@ static int cf_check sh_page_fault(
     gfn_t gfn = _gfn(0);
     mfn_t gmfn, sl1mfn = _mfn(0);
     shadow_l1e_t sl1e, *ptr_sl1e;
-    paddr_t gpa;
 #ifdef CONFIG_HVM
+    paddr_t gpa;
     struct sh_emulate_ctxt emul_ctxt;
     const struct x86_emulate_ops *emul_ops;
     int r;

Jan

> @@ -2588,13 +2588,33 @@ static int cf_check sh_page_fault(
>          goto emulate;
>      }
>  
> +#ifdef CONFIG_HVM
> +
>      /* Need to hand off device-model MMIO to the device model */
>      if ( p2mt == p2m_mmio_dm )
>      {
> +        ASSERT(is_hvm_vcpu(v));
> +        if ( !guest_mode(regs) )
> +            goto not_a_shadow_fault;
> +
> +        sh_audit_gw(v, &gw);
>          gpa = guest_walk_to_gpa(&gw);
> -        goto mmio;
> +        SHADOW_PRINTK("mmio %#"PRIpaddr"\n", gpa);
> +        shadow_audit_tables(v);
> +        sh_reset_early_unshadow(v);
> +
> +        paging_unlock(d);
> +        put_gfn(d, gfn_x(gfn));
> +
> +        perfc_incr(shadow_fault_mmio);
> +        trace_shadow_gen(TRC_SHADOW_MMIO, va);
> +
> +        return handle_mmio_with_translation(va, gpa >> PAGE_SHIFT, access)
> +               ? EXCRET_fault_fixed : 0;
>      }
>  
> +#endif /* CONFIG_HVM */
> +
>      /* Ignore attempts to write to read-only memory. */
>      if ( p2m_is_readonly(p2mt) && (ft == ft_demand_write) )
>          goto emulate_readonly; /* skip over the instruction */
> @@ -2867,25 +2887,6 @@ static int cf_check sh_page_fault(
>      return EXCRET_fault_fixed;
>  #endif /* CONFIG_HVM */
>  
> - mmio:
> -    if ( !guest_mode(regs) )
> -        goto not_a_shadow_fault;
> -#ifdef CONFIG_HVM
> -    ASSERT(is_hvm_vcpu(v));
> -    perfc_incr(shadow_fault_mmio);
> -    sh_audit_gw(v, &gw);
> -    SHADOW_PRINTK("mmio %#"PRIpaddr"\n", gpa);
> -    shadow_audit_tables(v);
> -    sh_reset_early_unshadow(v);
> -    paging_unlock(d);
> -    put_gfn(d, gfn_x(gfn));
> -    trace_shadow_gen(TRC_SHADOW_MMIO, va);
> -    return (handle_mmio_with_translation(va, gpa >> PAGE_SHIFT, access)
> -            ? EXCRET_fault_fixed : 0);
> -#else
> -    BUG();
> -#endif
> -
>   not_a_shadow_fault:
>      sh_audit_gw(v, &gw);
>      SHADOW_PRINTK("not a shadow fault\n");
> 
> 


