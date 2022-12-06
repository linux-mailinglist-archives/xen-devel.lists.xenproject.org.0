Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F3D6442D4
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 13:02:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454777.712319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Wdi-00019L-9e; Tue, 06 Dec 2022 12:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454777.712319; Tue, 06 Dec 2022 12:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Wdi-000179-6l; Tue, 06 Dec 2022 12:01:34 +0000
Received: by outflank-mailman (input) for mailman id 454777;
 Tue, 06 Dec 2022 12:01:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2Wdf-000171-TZ
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 12:01:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5509867-755d-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 13:01:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8160.eurprd04.prod.outlook.com (2603:10a6:102:1cb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Tue, 6 Dec
 2022 12:01:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 12:01:25 +0000
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
X-Inumbo-ID: b5509867-755d-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDTkH4X5dNfTJqq6IaT9SUXQDcmClyMKLvrT9Ew+wTNTDuVleITFd37L+4g/ybhJb0hKc4bSfS94W2q+stuxUCll0eMWfZGMO50BrH6u80SMiVidhYZumyFb8ZbyXpkQF/hTom82JHpDW/bgZs6P2XMbS+0e8+w11KYv8zv8L728Vw5a0wipqsiRqbWHAPP1s5+Uo/G0DtBDVIvGDNNnvUw15snAV8Ss47+F3GBLkWfntZRGvy/J9WXawZeXO2jFvqdKxrQbh2gM/874hVVGKxgiRsDlKWwLHHFiNKz1z/eFTR6EJHOJGiw/5e+EtEYvmXtznzKObgJxhHoa8AgL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoY87jEFrRBVuQpgbqbODO6pHjU/qO2mO0O8WFa5o50=;
 b=Dr9a507KWxqMzpFvrJVTPSRO0bdrUDAWJOen0ch0LxSu0hKXLMPtsC3/7lf7WvbETZmY7zBjUFwCdpXGV4zJKZlFq9XPBdRUDVaWY+Lx3HDCQY15BygOf45ApOlU/OE1DtkODTRDt0jzzSBhP7Gmmfk5tR4CpXyBH/yhXkjBb7iTPgpAps+excVQQCLz4vkmc89RsPC/Qw+o2paBbsDOqmqBuC/SQEulDCsig+Xy3M6YmM9065i0NExmWIqOL3Z9BU+8IkfWx5rP6ns+zY2/QIpJqADe3z+7wducURSCK8k75IPdGkLahYwNItDYgqkS2MCmw9O3TJevy5Wm6t+E+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoY87jEFrRBVuQpgbqbODO6pHjU/qO2mO0O8WFa5o50=;
 b=wZzJjv+AGbqosmb5t+QOAhT1ecY3kXZLnHEWoRfjTTJRaReWk18LddM+CJ2eh5b6oVTpQKz2bl2enrST71xwNe3TKSvyBlBWha+YeqOz23Dh3Zap9eM3fNr4uOaP6/3HNe61bYgCoHQtPFHOsoef7MMF6trEkjQjUCnfosKT/S4UdrNGAQSkMLZvr8mrDLvglQYcuGw5ht+idrJDqnIgXMPXXwZNEjY7DJY3zQoTFs8iSrUpTXLmPMWlXP/l0l+HPR/staDbzeo7B85HDeIrqILBIRHInaFidvHzUhvwM01pGgzV6APlrBI/IfWrYJuuHm9S4PAQ62V5XRg2ozr9WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <32ca18e0-273e-8410-22e9-1a3016d23f0b@suse.com>
Date: Tue, 6 Dec 2022 13:01:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 7/8] x86/mm: make code robust to future PAT changes
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <33f3896ba4cdf50ceb0377f071682ac5d3f576c4.1670300446.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <33f3896ba4cdf50ceb0377f071682ac5d3f576c4.1670300446.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f98a3fb-3de5-40c2-d9ba-08dad78199bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VRHeDDsTDGzYXkXCHExstgFEwSbMf2P+YrCEiWC0Pljs8ObFB5hqXq/IUNVp5YbV13tka8D75TDdL2XngbDgLsWGhLX8C00dXz98vVpFty+fSoOES5Eqw2mkiCDKqMRbOe/f4IT65pw6neHnTg7rNjQUKuLbNJwGyZ9OmYlcP66srTXkCcULmpT9nwbKjd5oHHQu9f8CLKUzbRkjbLo5FBGXlFhcTUvXMIOpIMLdkmHtGTV/K9TPgWv36OvRNJRyUVYJ6txRqE/G1LfcxRK7/ZNzPfpEGX2zZz9Yi+5W5s6RBLMb8z1SJ1Hf5MSPPM+1D2Im0JNbMcgmrrHnZlXrnUz54Pu1QfZ6igSbiaW4HZ/+oN5rORGtDkm5KrHOWHAGqewehcd0cDO7f48anejr83eVJUcPN1K7N1bspY+2B+Yj7aQqrcS2qF+9fHBVfcSCIbAv3dMaJIBMvkF7I948eo8i5EKyWOvbYr3q6KCEN5ffdypwwUie5wogabvpcxn/h84s3NFF8m5iCd3RU3u/39soUyQiqzTshRwXcr0tOMSkmY9VyP6yrDSfCBW8oxTDpg6qJa+8AyZXtYMptsaQPt3n6Bw2acJpXm0w2RoZBdkHhWg7RIME7A9A1eEW57O3QlpkzQwU+6wLMZZpFlLnezQd+urBEocKdLgkXTA+b3YtBod+k89/IBJ9pJXNRJAx5nwEGXeKzr1kbdBdjBEgugaPZrCc7yty/TZ/zrLHv+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199015)(31686004)(31696002)(86362001)(6506007)(53546011)(6486002)(478600001)(36756003)(38100700002)(186003)(83380400001)(2616005)(5660300002)(8936002)(4326008)(26005)(8676002)(41300700001)(6512007)(66946007)(66556008)(66476007)(6916009)(316002)(54906003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3BONkYrcC8wS21IRGoybE4xL1V5emF1SWd2N2dSN2FFMGkxUWVXYWNQVEln?=
 =?utf-8?B?ZmxpQjcvcUlwRkhJbXdxelJLT29vWjdqNGZTZ0xFR0x5OHdiS0Z3blVQWmk3?=
 =?utf-8?B?R1M0ZS9MSWVBbzlDRjRXR1lYY1BzdnNqcWRtYXNjK05na0VETlppeGFBektK?=
 =?utf-8?B?eEovSS9vcmxHbFNiK2xaZ1pTVkVYVEtjLzFZbGRBRG85ZWRxczZ1RmRneGg2?=
 =?utf-8?B?ZHBDUm8zTDVhSU14N1I3M3FYOGlrL25TaWJCV2pRYnhwcXdMTmZJamNvczlI?=
 =?utf-8?B?SU9laUo5YnZUbUYybWJocGJBQkhKWGdJNUxyUGdiSXlaYXZ6QXNzbzZjWmxk?=
 =?utf-8?B?N09oY0JXZ2hHR0ZqcmJEb2dBUFUrcy84QXdNR3pmMzNiSDZtZkdVYkdwdWoy?=
 =?utf-8?B?UjVhYnliRHBvZlRPNHpTazJ0MXhhVUpNcDEvZWZQUHpmUlJNQkRQSVE3NTNM?=
 =?utf-8?B?VmpaQ1haVUVrTTlKbG1sQUUwOXYzUm5DNmdkMVZDc2JHeFdCVHVoOEpteWov?=
 =?utf-8?B?Z1lZRlVidkEvOU5qV2JlSTd0NWl1c2JiZmU3d1JQTElWN3BMUGtXRGZoZHIy?=
 =?utf-8?B?MTQrdkdxVXJWTjNROFdxbDdKZ0Z5RnRDL0w4QmcyRUZRYzFHeEVLVlRiVzFC?=
 =?utf-8?B?VU1sTUpQRFRaTURtWGN1bHpUaEZSSGtXYlA2YjRaYnhNWWtuUWhUUzNFTUt6?=
 =?utf-8?B?VUdTNlJMRVpieWsyNnNoNmg2ckkyMG5KbFhmM25ySkFpRVlYdHRoSFB0VktO?=
 =?utf-8?B?T09ySjZETFN4cXFsVjRraExjMGZUV0lodVhYUHZLYWxIRk9FeEFySUg4MXZq?=
 =?utf-8?B?WFkwc2s4NXVaMjJaRmM2bThHTEVQZThqaGFEdXdEeG02U1VUSGlxQW8xVWNG?=
 =?utf-8?B?dlN1TTNETjE1NFp4UGliODVZZjhHT09OTjFjU242UHJRMmI0RHV2bkFxZ2xj?=
 =?utf-8?B?elh2TGZDaDdZUVlkdE81alBUTjJRVngwc1NSYmdqZ2RqVmZVVVBaQTZ3dTFu?=
 =?utf-8?B?SmdHS1hVdHQ3SHV0OHpvSXBYVEFvak9vSm1TM2hha3RkNEJoSngvTEhJcFMv?=
 =?utf-8?B?YXFaOUNyVXJWUFd1ZWl2NkRBWHZIeHRCMHdhTW00cUVRajVvMHAreFpPMkVV?=
 =?utf-8?B?aUpHMS9uR0NlbTBPemk0RitUcTBkMjJ6M0Q4N0JuSWQxa1NOR1lURnN4dUgr?=
 =?utf-8?B?NFpxaTRudm9aZ0hBM1FhZ1p3SFhVZnFGR01NUmpVY1BoK0dEYW55eXFCMWxG?=
 =?utf-8?B?NDlCY3JzOGVMNGU3RlJKUy9OY0M1RDBRVFNSYm5GSjhDOVZDTEJNdHZ2aS9j?=
 =?utf-8?B?eFZCbmdCbUl3aEc0azBxcW5EeklzUDNORlZGd0tuOEJ1WlZheUd5ZDNlUEpU?=
 =?utf-8?B?b0U5RXZITkN2MW45RWR3RUJTUnNOMmJtdDI1WGJGWFZlMUlWdDJqTGpsYVRF?=
 =?utf-8?B?RGF4VTFuMVIyL3QzTjZJVlBjMEpsdkl5WjdMcUNQd0NwRC82a0RQNkNjUXo0?=
 =?utf-8?B?RjVJV2pURGlpNGNqSUo1dXpER1Rna1h2b3NTQmxka3NWTXNGeDY0MzRtRzBx?=
 =?utf-8?B?bWdFODRVVmp4cWtvM1ZtMG1OQmdzZDN4anhqM25zK1REcThqd3BUaHpwVys0?=
 =?utf-8?B?bFM2cUJyTDcrQlJDRytaT2kvZGRaMXNSVCtXUDYzMkZEQ2dLdk5GczA4NjhT?=
 =?utf-8?B?c2xtZm1TSDRQRE02N2pvMk10KzcxK1BFd0txZnpxWlgxa0p6RXhMUjNMeUhL?=
 =?utf-8?B?TUFwcWx1cVcrM0F6VW1wQVNFdTR6eXBUcnVlc29Ta2ZrN2RTQUcvM1pjb3E4?=
 =?utf-8?B?eFRFNU5lcGpkRTBDYU9WWElvTjZ1UW5BR0RqSFpvQjkvdE1kVitFbzZoOHNF?=
 =?utf-8?B?VXUrelJlOUdYeFVpdnZGWnhOY2kwdHZtNzNvMlhPNFR1TmREWi9LVEVkZ1FJ?=
 =?utf-8?B?UWREN2lnSy84c0I4OGlkQnVycmFKdi9kUTF5QVB6clp0VERobnJreHc2MFNV?=
 =?utf-8?B?VmY3RC9ZaVBWMXdObExiMGc1ckxhV0JhaHNicFY3TWF4YWhTZHk3VloreHp3?=
 =?utf-8?B?L1lsZ0RuTFhhOEphc0g5djMwRVMyRGtsRXN4cXA0WGQwUUY0VHZoV2VRQWhL?=
 =?utf-8?Q?QgnCuY9sYhc+y3rCS3jtNhR4s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f98a3fb-3de5-40c2-d9ba-08dad78199bd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 12:01:25.7549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ej7ITl2D81zphzT//msvZ/DJ6UHYaQFfKjGZD1PIWFeHs3V8dPzgQ4zjdEDjgYknlQDj8AqnUK0NB78GMgwXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8160

On 06.12.2022 05:33, Demi Marie Obenour wrote:
> It may be desirable to change Xen's PAT for various reasons.  This
> requires changes to several _PAGE_* macros as well.  Add static
> assertions to check that XEN_MSR_PAT is consistent with the _PAGE_*
> macros.
> 
> Additionally, Xen has two unused entries in the PAT.  Currently these
> are UC, but this will change if the hardware ever supports additional
> memory types.  To avoid future problems, this adds a check in debug
> builds that injects #GP into a guest that tries to use one of these

I realize we already have a case of injecting of #GP from a hypercall
handling path, but I'm afraid this isn't really sane. _If_ #GP was
possible at all for any hypercall, it should imo be raised on the
syscall instruction (or the int $0x82 for compat guests), not on the
instruction following it. Plus, as a major difference, in the
existing case there's no other means to return an error indication.

> entries, along with returning -EINVAL from the hypercall.  Future
> versions of Xen will refuse to use these entries even in release builds.

Mind me asking where you're taking "will" from? (I might view "may" as
appropriate here.)

> @@ -961,13 +1000,24 @@ get_page_from_l1e(
>  
>          switch ( l1f & PAGE_CACHE_ATTRS )
>          {
> -        case _PAGE_WB:
> +        default:
> +#ifndef NDEBUG
> +            printk(XENLOG_G_WARNING
> +                   "d%d: Guest tried to use bad cachability attribute %u for MFN %lx\n",
> +                   l1e_owner->domain_id, l1f & PAGE_CACHE_ATTRS, mfn);
> +            pv_inject_hw_exception(TRAP_gp_fault, 0);
> +            return -EINVAL;
> +#endif
>          case _PAGE_WT:
>          case _PAGE_WP:
> -            flip |= (l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC;
> +        case _PAGE_WB:
> +            /* Force this to be uncachable */
> +            return flip | ( (l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC );
> +        case _PAGE_WC:
> +        case _PAGE_UC:
> +        case _PAGE_UCM:
> +            return flip;
>          }
> -
> -        return flip;
>      }

May I ask that you leave the basic structure here as is, merely adding
the default block you care about and the three case labels which you
need to add to compensate? Also please use %pd in new code logging
domain IDs. I'm also not convinced l1e_owner is the most appropriate
domain to actually blame here, at least with the wording you've chosen
to use.

Jan

