Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A3490C34
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 17:11:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258199.444406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Uaq-0006Xk-LJ; Mon, 17 Jan 2022 16:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258199.444406; Mon, 17 Jan 2022 16:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Uaq-0006Vs-ID; Mon, 17 Jan 2022 16:10:52 +0000
Received: by outflank-mailman (input) for mailman id 258199;
 Mon, 17 Jan 2022 16:10:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9Uap-0006Vm-T5
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 16:10:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09b38788-77b0-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 17:10:50 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-SfwTZ9wlNVmC6PY6cT1YCw-1; Mon, 17 Jan 2022 17:10:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3868.eurprd04.prod.outlook.com (2603:10a6:8:f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 16:10:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 16:10:46 +0000
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
X-Inumbo-ID: 09b38788-77b0-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642435850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u1amZc2Q3D4e8l4yc7etdJ/t6PaP+XFOxFFp4mWKjl4=;
	b=Z9/G+QSRK5OWqnhr5VjV5YyRN0FjQ0ossa+7koZhN9qvTJc+n31ndL7YO1x9v85rZFHGn1
	e30gxOP213sxNfHDAEbCk3W5tS/c3bweqTPp5AfCFpOVJ4ToNMWO2Dz4mRxQQOAIpof9Im
	tXHX7Y1r2QQUrPiPEvKg3cXjLxBgXC0=
X-MC-Unique: SfwTZ9wlNVmC6PY6cT1YCw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yabpt0KQoleTKRjd1VOMCfpXctx0v2SNIF+6ENtw1P56DaTpewsgtvhoQNk7Gq1ZnnDhQ744mnyhlSVJITUlHf8cIJQHVRGxcn+LH5ypfEShPcSUJJSLr4UB3SBI0tUBbW6uB05U3ay1Xv4cfMoujFM5WasKdogH3QdkQz4RF4C5QGoW25th8jew0MFWkMFJFTBy1xqtCeF0jHo4MmyQBVCeUVX+RqdkQ4vBoTCAZetGuAqmeoyEG7ao7/Kh665ngmgOZLlSxgioVEFShHKirk517f7FAWZaSYLoTLu1tMkzBcsj39MB7W7q4Anw/NEHsXU5aI7ZK+zlRup7nAz4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1amZc2Q3D4e8l4yc7etdJ/t6PaP+XFOxFFp4mWKjl4=;
 b=ZxmJxo/k+JowZ0GXGl/8MKvORKJM05iez8wzS0FxD337+B8CbeFl6sljx/cFHmb9MM/2V8Jik4SK+X8rIwFEePOChLhU0d0vUT1a82YkdXyA0S0MJO/brvugTDZfVAOzrCpl4RuBgK3AkET2BLIB5C2RbABl2B0AmzoNSxh7NJChDMlhB+fM0o6vzD3tsgDAfYFPPGpJZ8gUkhWLqYstrVARVfPeBPpFoVJGCbFVTNJRUYL6HtIpKHt+xxKkTYXQeYz5IfM1U5XP4E+AqG0Y0YjrPZaFVM7nF0Bys+lu+FYXzgiM5S81EtMpkPDScaH9qmPrdG8UzuPvdVd4Mtofkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <345944c4-78dd-8009-6f64-f9c7901a5497@suse.com>
Date: Mon, 17 Jan 2022 17:10:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/37] xen: introduce an arch helper for default dma zone
 status
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-5-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210923120236.3692135-5-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0417.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fe36c93-0d3a-4ae8-1e10-08d9d9d3eb3d
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3868:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB38683B70E324C8D190A16F30B3579@DB3PR0402MB3868.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yFUF8m59m+YmCf7xo1cFLsH4o3/I69fejEQNIM9gAlJ1tFzFf42yhswhGCCuaFl7gAksPjBNPhcgtc+b9ZAlh4NHSNP59/z+tZ4faV6n8NWjIleUN2LWdslBWkrNzsARKE8XWMoLPTavi3NT+Ho1tQ5x6IJsSIibpcl1ZgcvIyJmgQl57XtV5pS68/aQsg8t+Yi5BFDukHEg3Hw3bSF8+m4RzPL4qC5tkqLPIrIwM6cA81QxFG2euNs9sypwRNtHft3qUN2uFiEYVYnhbBbes1n4XaG33ZnycNn0jTQkkDyyAhLD2Sl6GKLLHSoAghw5tAyj71tsxhOHnTeJtH1a0RxypSGfwf9EnYgKp2rUNkTlDG3Yib97WET7UkMvbESJgsSyEG737qoXl+JqNvchdioebkpEoMrqeaW6ejOpUMt8pWMWEF2mvBEfTnQSKIPNLGEHMXjki7kLan9TsDoRe3psBcFAgatrv17Ghzo/tQqZ+xTHmOaK/Q8q5xAODGOinyQLfGf8WS0F0kTOHMMvGIoBpHz24dY1k0ZyFsjcqDNdfkFz9sRJpHFriqXHDTZ6o+k5e1QelzmDjp8qFH5aFLyPNnvln5UuXZJgkNlElbhTt90c4Strl0aR5+iL2BVuKgbSGHhrBKvLiJ9lykqzlOZvd1BwgnzjFr1gUvXMsdoq8p+tCnz6pVxtD8usca08ZGMjH/7IMduAJ0+/pHYWaP+3YbdaS3dUT4ttzTQMNOloWKqhvix/DIz5A9mHfis2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(5660300002)(66556008)(31686004)(186003)(38100700002)(26005)(86362001)(508600001)(6486002)(8676002)(8936002)(31696002)(36756003)(66476007)(4326008)(6506007)(6512007)(2616005)(2906002)(6916009)(83380400001)(6666004)(53546011)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFkwejdKYkNKSU1aU2tjejVsbkVRRktUeUJkWGdEZTk0SS9SYjVkZjhwN0pY?=
 =?utf-8?B?STdnWk1tNXZjVUJqa0NMY3c4TWlGVWdMWGltcEhURHQwTXJhcmlIdXRvU20z?=
 =?utf-8?B?NkZUMmlqWE9MR2oyQ1lUNy9ZNng3RlBEckdnaEdKRUxRZlhDSDZBb2p0dGR6?=
 =?utf-8?B?TURxUnJuanZLbE5BajV4VlROYXJwajZXNVdUUEN0VHF4Q1hvNUl0SWVUU0ZH?=
 =?utf-8?B?bU5UZ0tRd3RDam9uM0NRZ3JvM0dxMlJ6Mitld2hLbk9zS1ZLdlY5dW5XcHJH?=
 =?utf-8?B?aDZmN2lkaEJkYTlVQWRLTDBHU1dDRVRaazA4Y3NNeFp1QTU1NVgrTGcvcHFh?=
 =?utf-8?B?VUp2ejRlRHhqOWhzbDZkMVJHZll0YzRaaWRaTmVUU3Q4QVBHVFVTbmx2SHYv?=
 =?utf-8?B?Sm1YbXYwK1dxS1lkdWNJVjFRZGpmQlNSV2JLMDZQcVNTcWtCSS9lYXlidSs5?=
 =?utf-8?B?OVhjeVhhVEdxVzRlamN6bUZqaS9WTE1aU3VFZ3ZuOGJyL0ZqM3RaaGh0TmVU?=
 =?utf-8?B?Wk1JRERxQjU2eFlVNU43UGFQN1FZVWZKWFpGYzB6Rm54ZnNnMFJDaXgxSklY?=
 =?utf-8?B?WGxZa2dyVEtEK1ZmVWp5WmtxMDd2Qy9oK2ZvVGY5S3N3Uk4vRWFPU1J5NmM1?=
 =?utf-8?B?TU9ZRk1VdlJIc0VkMDRpNjh0aVJIRlRBNzNaOWFNLzU0R0lCSjN2V1lyUUt2?=
 =?utf-8?B?dlpMbHA2TjZkQXNUbXZDQzFpa2J6WkdRVDlQbHd1RmZhZTJ3NXFjaEZSTllG?=
 =?utf-8?B?YjlLV1dNRGNZcCtTSFlaMEo1NEVSNnFmQ2Z2L2QwNGtWZjhjQVVycXhzcjEz?=
 =?utf-8?B?TEhvSXNML21yS1BLL0dCRGJNNmI3SmxUWDRUWEsvMXhOREFTTXIzQkNGWTdL?=
 =?utf-8?B?QTBEYjFRY1BCK3EvbWgvM0xKL0FHUTJhWlZhaTdML1ptbVhXcHZuOGtzWUJa?=
 =?utf-8?B?cWtrbzJYT1Rpd1orVGhReWtlUDBFQUsySjZrODlKSndiZjFjb21WM3hJcFFN?=
 =?utf-8?B?L1dRQmVid0VidEtTcWl6bWIySG9XQk5LZ0R6cGxyOHV6dElGYStoUDdpZjdl?=
 =?utf-8?B?QStreTRDT1JLRkVuM2NQaElWdEthYVNycmlDKytMaDlIckx1dytQYkZKSFVh?=
 =?utf-8?B?NHJ0YmhISTZCSE5mSEtJN2NhSkg5cHFnWllpN3V0emZSTXI4T3NJRUo2WkFO?=
 =?utf-8?B?dHlJNkdIRUJTVERabHVSOEhlVDJsS0tVbnNjcjR6cDJKdkZRWlptZ0FORlBh?=
 =?utf-8?B?VzB4OWY4b2NLRnNLdHVaRlBuLzNwVHhWQlRzK1pZYkNGV2tkU2dMSWNvU0hU?=
 =?utf-8?B?V2FmM040S1hUOXFyVitmelRYOURKMHc2Sm9tU25MK0hwUGpBUTBiVGFINlh1?=
 =?utf-8?B?MnhMZEFQcVUyK2wxc3lPdVFXR2VkRnlvemtqMi91QndvVmFyQlZ6Zzd0TVI1?=
 =?utf-8?B?ek9OUkYrYnVXVytHMnJSMDZOWitUSlVaMUk1WU55Q25MNnBZdXhaUS9nTnFP?=
 =?utf-8?B?YU91U3ExQzBqdGU1d2NvTlhPRWVyVVhSeEtDdmEzVlAxWWY5TmJOWFVYZGFJ?=
 =?utf-8?B?WDFHb20vajg4U1l6WE1HMGgrUjBBSU9WK2Q4ZDRCN0Fuem1CbnRlU2o2NFly?=
 =?utf-8?B?VnA0WGRtdVExWnpjdTB2L3pSL0ZrNS9HRm9oNks1R2lIR3k0UXI2Ui80aHNy?=
 =?utf-8?B?SFYwUjRwMzBwZU1haURHV0h4ak1WOVE4NkZXa1hYK2wwSzIvazNjdng4cUtF?=
 =?utf-8?B?SGZxTkZ1VmZDRm9oRWViOHhpMklVcHRIS0xYYUg3bE1IeG9oQzhRckNTNXZv?=
 =?utf-8?B?UURJYWFjSUVLK3dFMnJIUjMxOWx6UkM3TVJ5V1ZXRDFrWGw0eTNVckJwL3E4?=
 =?utf-8?B?NFdNU1doQWF1bkVIWkRXUnM4ZHZMaDhXbmlLb09odmFXYjZVU1FrdXF4MUNS?=
 =?utf-8?B?L2l3RlV6bHhFNllDS21GbEZNWGZQZVB2NllZODlLQnRjSldiZHZUampGTnRr?=
 =?utf-8?B?YmI1eHdGV054QkcvaWp5Tm5vdzVRUU9nWXNmeWN3bGUyUmY4WFcyVDBQQWFt?=
 =?utf-8?B?VldjUlZiYmJiblhEYTNCRWlEV05tNkFWaTE0aUt2ZEdmNWFqRGFTOTdCYnU2?=
 =?utf-8?B?MFA5TXk1amlEKzdKQ1ZGN1kzREZWOEZEYmFmL2Y5UkVBdG4yR2Q2WDdjcTJ2?=
 =?utf-8?Q?ilTYhUv39fDJrK6ix5UnkJ0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe36c93-0d3a-4ae8-1e10-08d9d9d3eb3d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 16:10:45.9262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9OYRM6M+sXnBennHk/0SmHKyOx3CLmtWh1RXYVPBYz50X7K5iRTk24xuMrA1dOtmdoGYVr7muLDE4oDuxYgJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3868

I realize this series has been pending for a long time, but I don't
recall any indication that it would have been dropped. Hence as a
first try, a few comments on this relatively simple change. I'm
sorry it to have taken so long to get to it.

On 23.09.2021 14:02, Wei Chen wrote:
> In current code, when Xen is running in a multiple nodes NUMA
> system, it will set dma_bitsize in end_boot_allocator to reserve
> some low address memory for DMA.
> 
> There are some x86 implications in current implementation. Becuase
> on x86, memory starts from 0. On a multiple nodes NUMA system, if
> a single node contains the majority or all of the DMA memory. x86
> prefer to give out memory from non-local allocations rather than
> exhausting the DMA memory ranges. Hence x86 use dma_bitsize to set
> aside some largely arbitrary amount memory for DMA memory ranges.
> The allocations from these memory ranges would happen only after
> exhausting all other nodes' memory.
> 
> But the implications are not shared across all architectures. For
> example, Arm doesn't have these implications. So in this patch, we
> introduce an arch_have_default_dmazone helper for arch to determine
> that it need to set dma_bitsize for reserve DMA allocations or not.

How would Arm guarantee availability of memory below a certain
boundary for limited-capability devices? Or is there no need
because there's an assumption that I/O for such devices would
always pass through an IOMMU, lifting address size restrictions?
(I guess in a !PV build on x86 we could also get rid of such a
reservation.)

> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -371,6 +371,11 @@ unsigned int __init arch_get_dma_bitsize(void)
>                   + PAGE_SHIFT, 32);
>  }
>  
> +unsigned int arch_have_default_dmazone(void)
> +{
> +    return ( num_online_nodes() > 1 ) ? 1 : 0;
> +}

According to the expression and ...

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1889,7 +1889,7 @@ void __init end_boot_allocator(void)
>      }
>      nr_bootmem_regions = 0;
>  
> -    if ( !dma_bitsize && (num_online_nodes() > 1) )
> +    if ( !dma_bitsize && arch_have_default_dmazone() )
>          dma_bitsize = arch_get_dma_bitsize();

... the use site, you mean the function to return boolean. Please
indicate so by making it have a return type of "bool". Independent
of that you don't need a conditional expression above, nor
(malformed) use of parentheses. I further wonder whether ...

> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -25,6 +25,11 @@ extern mfn_t first_valid_mfn;
>  #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
>  #define __node_distance(a, b) (20)
>  
> +static inline unsigned int arch_have_default_dmazone(void)
> +{
> +    return 0;
> +}

... like this one, x86'es couldn't be inline as well. If indeed
it can't be, making it a macro may still be better (and avoid a
further comment regarding the lack of __init).

Jan


