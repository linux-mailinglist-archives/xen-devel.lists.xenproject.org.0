Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBFC665E1A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 15:35:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475419.737134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcBv-0007EY-CP; Wed, 11 Jan 2023 14:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475419.737134; Wed, 11 Jan 2023 14:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcBv-0007CO-9Q; Wed, 11 Jan 2023 14:34:59 +0000
Received: by outflank-mailman (input) for mailman id 475419;
 Wed, 11 Jan 2023 14:34:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFcBt-0007CI-1I
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 14:34:57 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2044.outbound.protection.outlook.com [40.107.247.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d53642d-91bd-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 15:34:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8551.eurprd04.prod.outlook.com (2603:10a6:10:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 14:34:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 14:34:53 +0000
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
X-Inumbo-ID: 1d53642d-91bd-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDxzQTkjy38BmcIoA4oe5Udj98+Z3b33bjT+lxvxs88ws5BhmE72rTD5RMvrnHbmRLEBLWQXHvdyMqeQ5LaSNdtJNC9Hql3xUAuZdk+MJudBz6TDetN/zx1fgSG4AexF86oka3If8UlHncsgwBII1u+/rZqEEPg/nROW0ZzuOyqAvVgRTcmEHXB54oUpKdQWf14vIuxvNW3dZY5eV9MaAwgMszecy5BkCypg68BrqRr5uubAZqc1auecC8VP7IQkelsvGuM2tYPV0ph58DCNn1h2+yItahtqa6+fH6BoUPn1NCXP/PqflofKbRAuyFqBDqBWAH8xrD99unKEI9ZoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mwZanp8D+FPIIeYcPrZURlT8a36AzCP0jEaVSmpmQc=;
 b=YLqsLxRhOPEq0HvQHskybO9Q6CNnON+udnmV/iR4gJtRy657XiF7iYLUFK4lJGP0fEsXnjbyFxjfJJ+bz2osEVBGJXAwDbFqJT9ZVtUOD9tt8vuHdjcXmPBie9qzIic8Y3uZCr6lHWPNsnSLvBv6NJJ2ZMD3XgZnsp+Mt0jHAkkTJcWfU9/bNGHecvSEHNi/hg2AKwTNchWWC+SqcEejY7XMc5E/6baZvcTf6UeXg3hcwuzEUd+S0V3WS2DdtXuiIp1j13PImLtzL5e9d87CeS+QJ9L++lxWIhcs22/R1234M3PBXeydaa3IUy02Iu7u5F5yQwjjAiOHsNYBblLFdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mwZanp8D+FPIIeYcPrZURlT8a36AzCP0jEaVSmpmQc=;
 b=0gD+XDQwekBSXjPtDpALB5pryxSDApFdH7Plm6Hz7skleE8EHMnNF4jNQKXdLm8dhe1oq1xkuQ1ptrU9i1y8yiMKvu7qUy8D8UnjLJ08gFRBsZtk9rKVdAIcvAumSenZtz8w15kmxkZ9Z4Fm9tM+fZxRljSB1giKcyItEpbfv22DaCO6tdR7pdQpeoFd60Km1UqC50pUoUncUeWSjBLQoGUr/0LBeU2VknQfQ7QSMXDI0Oew6/zp1Za/sti6uSB3Jncrz7f3PdJST8bKpWZaJYO/RTZieTQzXfC57WAfsWJSymCylWHBYth8He7SbuTsBGuS10PifHKjGpu0SRDx/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <75a3787f-7fc0-8586-8a96-1eb2e94cf523@suse.com>
Date: Wed, 11 Jan 2023 15:34:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 16/22] x86/setup: leave early boot slightly earlier
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-17-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-17-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: 95409bce-a927-4bda-1185-08daf3e100bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zryfzpD2urRK8pZM8bXKqmYVkTh6z2mU3fpocJz7wR4HsHtsRevduBoGowtCuDJi98/JmaU36YApUXO+haKaP7+55Mb7dqGUo/0nmYQrxTRgF93up76xs3D95djZMLEdPJWk4e47jLOUKjs9RCqGucMuOGGsPd6pwk0rejhSbn/8czNlEChpr06MWeVLLYuVqiJxmP3yoDCC34heQ9d0Y5LlNJtmV8Q8USr8/lUzK0rRXcgBxXpiyMhbFmGQybMvXwPigf3JlopW6Sm55Tl1IDIEbvhsQyRkrJPsVXPfgMgaRDiCRhMUh+ApnzzZp3SkGM4YutXncrED9gaidEkpTIyKmPwAOFXNSJ2YWBCZBp57zHgGkaIiDyj+n18uYYUsqASEolnjleoXFSv5NJKb1FJjp9/Q18ZKicEnUQ4C+VLfx5qt58XK90gfvRs/PCyr8BRKXLicoXtOnNw7zr65kqU7IB7occrXCCmFhehQjI+/Z9iGJhDDHjRGPPtoul1qDbL3/KUt0mz+P264RupRFJ+9ujvlcOCWvLMz4RL8/9jYRYE2DAW+j8jpQgnXNZ8BpWKx5P4dVLGwHsfPOgO5QngWF1JpD5pzyfahhi7K8XM56CHtfanTfGeH3q+hBcB8rSL+MLuh4wscETTNoUcfAhAIaGho1yrQlIvzXMnc36XPgjXfe6oF9d5meoiAdDfSZGAOl63b1aNMpoXViQzGNIM/EERkQQuUVO66ABdbLQI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(8936002)(2906002)(5660300002)(41300700001)(316002)(4326008)(66556008)(8676002)(6916009)(66476007)(66946007)(54906003)(26005)(6512007)(38100700002)(2616005)(31686004)(86362001)(186003)(31696002)(83380400001)(53546011)(36756003)(6506007)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3k3Y3JiZWtXMnJFYXNhTWd2Y3VCVE5Ud20zWUV3OVZnZnB0bmhWeUtESERu?=
 =?utf-8?B?OWR5bEg2L3ZyUTMwQzVWeE5JZDdCdXFtbnI2b3BxTUtGbnFHRjJtVmdBMkZL?=
 =?utf-8?B?aEcveU1neXFrKzJJQ3RJYUk2ZXc3c0o4OFdkYjQ3ZlEzbU9aOXAwK1dpUDZa?=
 =?utf-8?B?Ymo0QWJWQ0IxbU5xZnBXNFk0V3FubWlEZHVwa0ZhSjVlUmhvM2FGbXBuUzU1?=
 =?utf-8?B?MUVYN2EvOVJ6WFdRZTRsek52OVpjVFhPN2J3TjlNT0pHblcrM2ZMNVcyaVE4?=
 =?utf-8?B?ZG5YRXNMUkdiVzFkKzRNRFJJYy8rbVVrN3JBL3ZPY3ZPQi9GWVExcjRZczdv?=
 =?utf-8?B?WWpZdlMzRzdpU0FEcFBCSzZuNEQ5MXRrbllsbHAwaFhOYmNKaDRaa01XV1JV?=
 =?utf-8?B?WmZKMHduVTIxamdvcEJSbCtLdEQxMlhNcVh3L0piM2xsS3BHRXA4LzVmOXRn?=
 =?utf-8?B?Tk4xaUtqL1lXK3lINXUwbzRid0p0ZnFUNlkxYXdwQ09EZGV1bTRLblBNNzBK?=
 =?utf-8?B?TGxOSlhPdzRrYmRFb2R6Ulp6TjU1UGx5eUhHR08yZXR5THBGemJ1T2RnbC9Q?=
 =?utf-8?B?bXE0alJwcnNic2JxZ09sQ3l6aXVVYVV4MEpncitKQkd2eXVQK0RsaHBoY3JV?=
 =?utf-8?B?dG1ieFZLZGpsZU9vWk5lSG12NTBjTTV4ZDczMGJheS90V0ZCNkRjOGh5dDlS?=
 =?utf-8?B?d0MwRG93UTVLeXpUUG1UNnFuNlMxWWVPRUVtbkRIaWNlTk1ia2wrSXJ6Tmtz?=
 =?utf-8?B?aVY1M3g4a0ZISm9kNmc0TGNIMnRDVzF5UExwYUJ1QW1aZnNuVnVGL01vNktM?=
 =?utf-8?B?MmdxbHl6cGY3bnJHVzliVGZtRlRPbXdSS3RqUUs0OTBvdURMd3QxdU1sMzlJ?=
 =?utf-8?B?bURyajBEdm1lZWNiZFgrdmxBSkpGTGl1VFdnbVhadFNjUy8xenJxZjNxREYr?=
 =?utf-8?B?bytwNldpd2N0aGo1QkVIUnViUXVETC9nSzdxc3JuRGhXaXRwUWdYS0k1ZDhI?=
 =?utf-8?B?NzVHLzVhbWV2NEg5Z2Vwcmpud1BWMjBsaitBbHgvR0M4d0FXVDlPOHAwNTBl?=
 =?utf-8?B?RXhwd0hmSlZaSklweDZnV0VYM3hMRU1PZFJYN2oxTVFiUjl4Y21WWFRSV1Yx?=
 =?utf-8?B?OHRaOVFVUVpyZDFXb2hHVTc5di9VTzZ2a2VSOFBLa2RmK0xKMFFEdCtYQmxX?=
 =?utf-8?B?R2dTR1ZxWDZyTi9FVDV5a1NKNk9yYTRhcUgwOG4xbkgzWSszN3RLU0t1aksr?=
 =?utf-8?B?SDYrMXdadDhxVHRPTzI2QVJUaElMQVFweHhXQlViZHkvbm1MaDVQc09XMWg3?=
 =?utf-8?B?TUtaeDlQNFVtRTRIeGE5VFdVamg3TEpyS2E3S2s0cGkwTWhWb2k2bDV3OGlv?=
 =?utf-8?B?d0ZmdGhiSkUxMG9uWDhPS0k4alBTWWZxbEdURE5HOXdNYUJ6eHlqc0RJaXJw?=
 =?utf-8?B?MHd0d241VERpRDlCZE9uaUJDcmNEQmZiRWF0ckdBMThWU1ZoVmY3Szd1ZUlD?=
 =?utf-8?B?RkVKSUlzeVNhNW5VUi9ZMjU5amhPd2hnazE1dUVNVU15bnd5c0dTUVo0SGlj?=
 =?utf-8?B?STcremNNRS9xU1c0bXdBQ2dyM2taNmhJTW85WTNmTzlPdzJJbWVUV3JsUVJK?=
 =?utf-8?B?V3hWcTB6OXNIYU1vdnhMRzM5ZDBRSXNqeFAxY0hCU3hyRllQRThEYzYvU3cx?=
 =?utf-8?B?TUtlR0lhdG5TVXpJTkhKRm9yT0pUd0J2SUo1OUZwOWNpcGJhdm5lckx4TnRV?=
 =?utf-8?B?amg1U2dLdy96UDNsdTNNK0VrbkRJYUIyYnFvWlR6T1h1U0dkSzFIcmpJS0dk?=
 =?utf-8?B?ZFdIZzJGVUFGbG9WNkh2aXlvQlQ1ZXFvZDlyTFpiOGZpU2h1YzBucUoxdjg3?=
 =?utf-8?B?WXpQQ3BrMWlQM0ltcEtnYWdHQVNCemFpWERHRWVGeDZHZkZPUnpwTDg0QTlm?=
 =?utf-8?B?VUgvdEQrcXg5dFllNUp5UnVoZzZRL1dKYUtiY3VyM204MUV4MDhUTlQ4U0FS?=
 =?utf-8?B?WHpzc082bzF3L3NoK01wbmFSOXJ2bEtjRlo3UWVldkwyRXFPdnJUTHg3dSt4?=
 =?utf-8?B?bElSc1V5UzFYZWplSFZobzE0TFpzL2tKV3JnSjJJTEZJdVh4ZEZ2LzRCL3dm?=
 =?utf-8?Q?THafqjgIf5VdLxMHoCUWmnfnY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95409bce-a927-4bda-1185-08daf3e100bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 14:34:53.2956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bz/zDgtsONFgN/kYUWxLokQhF/JN4Q9gOQhohN9qOxXxdFwQGd8jGduQmHACp0RFC4r04V1PSTB2LZAvZHsEgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8551

On 16.12.2022 12:48, Julien Grall wrote:
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1648,6 +1648,22 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>  
>      numa_initmem_init(0, raw_max_page);
>  
> +    /*
> +     * When we do not have a direct map, memory for metadata of heap nodes in
> +     * init_node_heap() is allocated from xenheap, which needs to be mapped and
> +     * unmapped on demand. However, we cannot just take memory from the boot
> +     * allocator to create the PTEs while we are passing memory to the heap
> +     * allocator during end_boot_allocator().
> +     *
> +     * To solve this race, we need to leave early boot before
> +     * end_boot_allocator() so that Xen PTE pages are allocated from the heap
> +     * instead of the boot allocator. We can do this because the metadata for
> +     * the 1st node is statically allocated, and by the time we need memory to
> +     * create mappings for the 2nd node, we already have enough memory in the
> +     * heap allocator in the 1st node.
> +     */

Is this "enough" guaranteed, or merely a hope (and true in the common case,
but maybe not when the 1st node ends up having very little memory)?

> +    system_state = SYS_STATE_boot;
> +
>      if ( max_page - 1 > virt_to_mfn(HYPERVISOR_VIRT_END - 1) )
>      {
>          unsigned long limit = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
> @@ -1677,8 +1693,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>      else
>          end_boot_allocator();
>  
> -    system_state = SYS_STATE_boot;

I'm afraid I don't view this as viable - there are assumptions not just in
the page table allocation functions that SYS_STATE_boot (or higher) means
that end_boot_allocator() has run (e.g. acpi_os_map_memory()). You also do
this for x86 only. I think system_state wants leaving alone here, and an
arch specific approach wants creating for the page table allocation you
talk of.

Jan

