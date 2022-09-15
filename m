Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4295B9BA4
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 15:13:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407371.649869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYogP-0006rE-Dp; Thu, 15 Sep 2022 13:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407371.649869; Thu, 15 Sep 2022 13:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYogP-0006nV-AY; Thu, 15 Sep 2022 13:13:33 +0000
Received: by outflank-mailman (input) for mailman id 407371;
 Thu, 15 Sep 2022 13:13:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EMZS=ZS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYogN-0006nK-Mn
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 13:13:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 314432ce-34f8-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 15:13:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7192.eurprd04.prod.outlook.com (2603:10a6:20b:11e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 13:13:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 13:13:23 +0000
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
X-Inumbo-ID: 314432ce-34f8-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuOtlH9sTMEGPkT0lwyWdv0SobSNYvOZGaUuTSLhxzFZ/xdPlG2F03SygYlAb0rR5k7xw8HCuYuoc37rd5+ANmjwzC9oPUXd+zY/GS3Sm5T2OYpk0W7b+tJGOebAVSFf0lTR9WLeTevUWxiCA1iev1YJwnC9npzo/9JCc6i2MndoLr5RE47SFSs8GH3a4QisiBLnbjliaxjXQsOilzZ2fATo1b09GH9IEquTDV1Tkrs7ZYyhayytRi85RhO+AQyoTCaUFj2GEq2cI7pTFVbd13sDviZccQilzHUmZkthPWgePRuoF7MuHkkQnsli8XXeQYxJGxnOE6ffe0YxeDC7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7ZW9IxP6fqgA/H2tgkcIDfG1a5VZJISiz6xJOiojI4=;
 b=T0By0PupOxDpbOkWhS7O3qV19QKOwzFUMZZ2giCuFzSxHIllWb4lYuZht/OR7AUKFRJPAl08StwJ+0jxot8BJIFhPJTVs7+E9wqNg5G4G/4lOF8jodTf7WrYkndw4WQK21pxCIpsXWe2SEZTb48Xu55gTxWnF29MKMe/5UdjZ2Vr6V5C13bCrnEwtbS13PuSl0rLJWNBc01EGajGI5pQmwbige8iBrZGQJJZc1iFQUBEILAzk2QtHtL83w4ErB99nELfBuflcOXT3NQBvd7vZ0przCdIWczXTmW0n1c/h9uLBqj9knzoI06wN1rV4RAcqy5bIxxmaiQ1ltV0J4vBuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7ZW9IxP6fqgA/H2tgkcIDfG1a5VZJISiz6xJOiojI4=;
 b=C2uKF5PXB8iqzC1vKVWhdVKnPb+7I9VII0eN8rNhwiqanXrr80N6wNwhIdtedeHipX2BD0H3KE0FJKbzGph43VX1b6w7QWAbeKhFKSbkfSZwgAEDPM0Zs/iS0y4k9dThDL6uzBx9+pbZctqbZVJuF0r0binm2zwRuyreR1TR2yDtaYCuiwJq7/2XMZLJhrqZaUAm9aOXoxDA8RY14DMsRy7xInVN5mMT6ywHCSyytfYG7bCW4lvWn1pVejIlbJ2h/bsFnONe635fi37mb38FbzhLNbeYamjrxGfXwf2mMs5tOA3gFJIW0r41a+jo2ZPdMvBkW1PI5OPx/QvDv/q/Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <32e2a752-975f-baa6-8d6c-ba27cf516c64@suse.com>
Date: Thu, 15 Sep 2022 15:13:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 06/12] xen/common: add cache coloring allocator for
 domains
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-7-carlo.nonato@minervasys.tech>
Content-Language: en-US
In-Reply-To: <20220826125111.152261-7-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb39b80-5594-4074-69a5-08da971c1119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YFesr92YERj85zDCi3n9Vd/wVwR0fGCKzu7b0dYnzIgZGm3IWd0tb09FJKThujqMHvTKqtYLMhWFGyrYCOy4k1yZK6d2iQF9uCvzG4zJXjKfka7mN/SH9jYDf0gx7/vbXutGhLob5Cy2rkUu/MHL63uYc7ZjCHEv1gQVg6pfLKqEQBFY6pJA5D9l+EN+IPSH8jPh21Bwxhe3webZI8EJ9XjvBlpesbVfz8c2gIIdS9Q7Qkbe0W7WNTsOrk46OBNOziNHq4jGj6rAZePG3/Z5LRmTreiL25rrOwGKzlIVTa12JMZbKZ25m1sV/zEshhTHu6ZpiqN2iF57xYNbuCIM8d8B7kjDq6FaRvIOBdhjwuNFoAt/kypIMF6WddDstfAnyj1xf004Sw4NJZl273a2NIARb2B9H48dnBVnD0RLm75lBpvgncBOteEJAyi+DpZdURE2fmMT9sl9/G37D9FJxb5YGxTwpqi/9J6395YS3naKtbx5QA8F3ZzryFTVNdKKurW0UDpu5VAhrVxDQBnfyiHMjai1aKCc2aWrsDqBohc7aaRpmBL9MdQV1IHH5LtHZydvzEMGuyVENYZT32EVhtYTbpq9j75x/o4OyQ/43jRadXHnBXunMj/6jymSFG7JVXsHL6Z47W3AbZBCfjRDkY3Wfc8Dw1JbA2uyGrU+BlQJh5ka2rds4RNfkn/7QhNljeMXy+r/pyJ6w/R5wQLd2aL2sD+4Na+ZtM63IeqLTBfWaaGFyTVTQ/t03ZgkwZ48i/MwdnSUKwjI/HPSOR/CsGZ5tQjJcf6rj8dwqM1V3Zg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199015)(31686004)(478600001)(6916009)(54906003)(316002)(8676002)(66476007)(66556008)(8936002)(66946007)(36756003)(186003)(6506007)(53546011)(41300700001)(86362001)(38100700002)(31696002)(2906002)(7416002)(2616005)(6486002)(4326008)(83380400001)(5660300002)(6512007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDBRdDZzTVZZM0M3eExYWTFCam15UlEyL25obi9JRm04U29tSk9tUnZjM1pJ?=
 =?utf-8?B?YjcvNG4yMFJvSTdFUHZsTXZOTjZoZVhQcEhyeXlMd1FTQ1RDQWduVll4eGg3?=
 =?utf-8?B?MFlDSmxSUFZpeGRNdFFlVVpjL1FuMFAvcCt6Mlp5Q3lGSno0Szk1WXp2cW5l?=
 =?utf-8?B?TUplMklGdUJHeDJlTFdJbVFCYmJMREhKWmQzR1QwZ25PWlFaK25WRDFqL1lR?=
 =?utf-8?B?Z0NFeVZkNUtrRng4QnByOTNVTE5SWGlWa09Ca05LN3V2QUNoRGF6Mkd3L3V6?=
 =?utf-8?B?NTJ2dExWR1VuMWNiMGE2OUpBVmVOdzNudElVOG1rVGNsS3JxVms5dUx4bnZi?=
 =?utf-8?B?NFFmZGw1RkxRU0ljVHVUdFpNdzFIaU5lM1YzR1E0LzdveER3MDdpMFhoVzZm?=
 =?utf-8?B?QXBJWFRIVlVMOFlIck9UR1V2WmlYbTdwNHI2THFtN25pZzZOM3FOanZXeUpT?=
 =?utf-8?B?eU5yMXVNcGZGNjl1OEUrNjdiUG8yaDFLMDR0NTkyUTlsRlRHNXlGUFQxNHds?=
 =?utf-8?B?aXN1REd4MjNOM3cyam1nbFlBZFJ0YWtzQ0RlQlRRUWhBZ1ZVejZZSHQxdFFR?=
 =?utf-8?B?WWoxS3FyTXBvYUlXeXcycGNZZVZIRVAzR2tiMjJVMmNSOHkwR1h5UVFFbzQw?=
 =?utf-8?B?SncyYWNDWnpWZXo4dXFLNWl3dm4zaWVMSjBEUWJMUTBLQ3hTWFMydFlQTmhk?=
 =?utf-8?B?Rm1IM0VwMEowMGpxQnB6YjJPRS9NN1p1UTg1Y05TTUJTSjBpYklJaFRaZm5o?=
 =?utf-8?B?QzZ0ZTVNNzRqckZKQWpCbkdFdkxrWTBtL1U2S0tkQ1JaZjFmVjFyM3R6Ykxr?=
 =?utf-8?B?T2MyTDZaalVKWnlVT25EMURDaTFZZ0VBc1F4cDBPVWdCaDBjVUVQbzBlSE84?=
 =?utf-8?B?Y2puZDNreFhxdHFjYzBscEFjWFVFVGpXNnNQSjFtS0xnNHJVQTUrRWw4a09Q?=
 =?utf-8?B?a0xENEhudk1nejJXQzJTYXZYSGdONUUvOGM0aGpGUXVvSDRoSWE0S2o0bU9W?=
 =?utf-8?B?U3JBTFhnVWZXL0paWTJmb3U3Z3lyR2JaalRXOUNDekRyeW9KMWJXY2J4QjVp?=
 =?utf-8?B?T0xDb3YwWmdSRHJEd0xBaEtrVjZ0OEkvMFFORFpwTS9DaGlsbVdaK0g1c25B?=
 =?utf-8?B?cXlMQ3V1bHYyRlZDMUM3WEhtZkFibHg5Wm9rcHVHaFovTTBBVXdlb2ozdzNs?=
 =?utf-8?B?b0x3VHhEK2hZWElqeTZ6QlU3REZiZ3VxQWNIMTRGTko1THBFcjNmWnFrd00w?=
 =?utf-8?B?WkRmcEd6TTNKN2JwandkbGJhcStWNVJ1WThQUFo5bExvZG14UW8rQnFINjQz?=
 =?utf-8?B?ZVhiQ1N5aGY0TUxGOFhvM2VzaVRod1FmNG9GbmhyTUxvSW5FVXpiTFcvb2N2?=
 =?utf-8?B?V2d2Z2RPS2hobVRLN3F3MWQ3N1I5NEVpNzBZcG0zdFdzZktmRi9lOGdyWUhU?=
 =?utf-8?B?WitVVnFWVXM3Umd1NHlHdnNSTDBsa3RpNjRkaTBnK3BPOUFGUVJsdE9MdFFH?=
 =?utf-8?B?am1vV1ZWMlM2NUhwSnZBS2QrR0VhQU9JSlA1NkkwQVVnSXF0c3hsVnVYajlq?=
 =?utf-8?B?djJGT3JUcnVOUXRvakJUVVZ3TitYMEZ0YzdlOUJTak0yOCt6SDBQZHBXaGl6?=
 =?utf-8?B?U2syelM5ZVZEMTBWN2Q4ajdoZThtb1Npa2RpQisrYi85aE1SMUVYeG5iNDEx?=
 =?utf-8?B?SmFUYmM1NUtUNUJDbFJlb2t4a0plUHo5dGRnMERzMkJoK29YNkRKbHdoMlVk?=
 =?utf-8?B?YWZ4ZjExNUtYbzZobXZScnpQMzROOVNYTTB6TkU2cEU1MFVyK3c1UDQwL2RV?=
 =?utf-8?B?N016U2E3YmYyNzh0M2dPY2RweER1U291Zm56bUtYSCt6T2o3c3RUa3VDcnVW?=
 =?utf-8?B?TW9ObG1PekZQMDJ3dlRHRVN0b0RHaWROcXlIOHIxZVhLUWhicVA2eW16N3lv?=
 =?utf-8?B?ZW4xamtBZC9nbk9iTmxRRmNQU3hpL24yUSs4NGUwdUYzUWMrbXVQRjFQU1pC?=
 =?utf-8?B?eHRIRVJ2UmhzbHdMZTlxMWtTR2laRVd2cUo0dmJqRHIyNy92RXNGK3J1TWxy?=
 =?utf-8?B?SlhkRThndFZHK3hJYlQ2M1RVeU1qUUFkcmN5aUQ3TmVGVVFQaDA5OHJ4QUNs?=
 =?utf-8?Q?dWWEXXFo45h9b1VK8l1izpe+W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb39b80-5594-4074-69a5-08da971c1119
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 13:13:22.9509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4egZEabrcUCsXhljTa/kg13Z/h3vOVXcmYPohK0jtAd7BlqXDpq+W3edAL+FthxSNJn2qk3cXzMuC3PwLUuezA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7192

On 26.08.2022 14:51, Carlo Nonato wrote:
> This commit adds a new memory page allocator that implements the cache
> coloring mechanism. The allocation algorithm follows the given color
> configuration of the domain and maximizes contiguity in the page selection.
> 
> Pages are stored in a color-indexed data structure of lists, sorted by their
> machine addresses, that are collectively called the colored heap. A simple
> initialization function computes the color of any available page and inserts
> it in the corresponding list. When a domain requests a page, the allocator
> takes one from the subset of lists whose colors equals the domain
> configuration. It chooses the page with the highest machine address such that
> contiguous pages are sequentially allocated, if this is made possible by a
> color assignment which includes adjacent colors.
> 
> The allocator can handle only requests with order equals to 0 since the
> single color granularity is represented in memory by one page.

In the earlier paragraph you talk about contiguous pages using contiguous
colors. This paragraph then appears to say the opposite, i.e. that
contiguous multi-page allocations aren't possible. Which of the two is it?

> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -147,6 +147,18 @@ config MAX_CACHE_COLORS
>  	  colors at boot. Note that if, at any time, a color configuration with more
>  	  colors than the maximum will be employed an error will be produced.
>  
> +config BUDDY_ALLOCATOR_SIZE
> +	string "Buddy allocator reserved memory size" if CACHE_COLORING
> +	default "64M" if CACHE_COLORING
> +	default "0M" if !CACHE_COLORING

I don't understand the purpose of this last line, nor the two earlier
"if". Why not simply

config BUDDY_ALLOCATOR_SIZE
	string "Buddy allocator reserved memory size"
	depend on CACHE_COLORING
	default "64M"

? Also does this really need to be a string, rather than a number (which
then doesn't need parsing) with e.g. MiB granularity?

Finally - how much of this is really Arm-specific? Shouldn't this be a
common config option, perhaps merely restricted to Arm by the top level
option (CACHE_COLORING?) depending on a further HAS_CACHE_COLORING,
which only Arm would select?

> --- a/xen/arch/arm/coloring.c
> +++ b/xen/arch/arm/coloring.c
> @@ -300,6 +300,16 @@ void prepare_color_domain_config(struct xen_arch_domainconfig *config,
>      config->num_colors = (uint16_t)num;
>  }
>  
> +unsigned int page_to_color(struct page_info *pg)

The parameter will want to be pointer-to-const and I wonder whether ...

> +{
> +    return addr_to_color(page_to_maddr(pg));
> +}

... the function as a whole wouldn't be a good candidate for being an
inline one (requiring addr_to_color() to be available in outside of
this file, of course).

> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -143,6 +143,9 @@ struct page_info
>  #define PGC_count_width   PG_shift(10)
>  #define PGC_count_mask    ((1UL<<PGC_count_width)-1)
>  
> +#define _PGC_colored      PG_shift(11)
> +#define PGC_colored       PG_mask(1, 11)

I don't think this can work - you can't use bits already covered by
the count. You'll need to shift up PGC_count_{width,mask} by one and
insert your bit between PGC_extra and that. Or you could use one of
the lower unused ones, between PGC_static and PGC_broken.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -150,6 +150,9 @@
>  #define p2m_pod_offline_or_broken_hit(pg) 0
>  #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
>  #endif
> +#ifdef CONFIG_CACHE_COLORING
> +#include <asm/coloring.h>
> +#endif
>  
>  #ifndef PGC_static
>  #define PGC_static 0
> @@ -231,6 +234,9 @@ static bool __read_mostly scrub_debug;
>  #define scrub_debug    false
>  #endif
>  
> +/* Memory required for buddy allocator to work with colored one */
> +static unsigned long __initdata buddy_alloc_size;
> +
>  /*
>   * Bit width of the DMA heap -- used to override NUMA-node-first.
>   * allocation strategy, which can otherwise exhaust low memory.
> @@ -440,7 +446,172 @@ mfn_t __init alloc_boot_pages(unsigned long nr_pfns, unsigned long pfn_align)
>      BUG();
>  }
>  
> +static DEFINE_SPINLOCK(heap_lock);
>  
> +/* Initialise fields which have other uses for free pages. */
> +static void init_free_page_fields(struct page_info *pg)
> +{
> +    pg->u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
> +    page_set_owner(pg, NULL);
> +}
> +
> +static bool is_page_colored(struct page_info *pg)
> +{
> +    return pg->count_info & PGC_colored;
> +}
> +
> +#ifdef CONFIG_CACHE_COLORING
> +/*************************
> + * COLORED SIDE-ALLOCATOR
> + *
> + * Pages are stored by their color in separate lists. Each list defines a color
> + * and it is initialized during end_boot_allocator, where each page's color
> + * is calculated and the page itself is put in the correct list.
> + * After initialization there will be N lists where N is the number of maximum
> + * available colors on the platform.
> + */

Nit: Perhaps either "maximum number of colors" or "number of available
colors"?

> +typedef struct page_list_head colored_pages_t;
> +static colored_pages_t __ro_after_init *color_heap;

Please place the attribute at its canonical slot:

static colored_pages_t *__ro_after_init color_heap;

It applies to the variable, not to the pointed-to type.

> +#define colored_pages(color) &color_heap[(color)]

The parentheses want to move:

#define colored_pages(color) (&color_heap[color])

> +static void color_heap_insert_page(struct page_info *pg)
> +{
> +    struct page_info *pos;
> +    struct page_list_head *head = colored_pages(page_to_color(pg));
> +
> +    pg->count_info |= PGC_colored;

The function isn't marked __init, so runtime correctness as to the
(non-atomic) update here wants clarifying.

> +    /* Insert page in list in ascending machine address order */

Isn't is descending order that you actually use, also seeing that
you take the first page of a list when allocating (further down)?

> +    page_list_for_each( pos, head )
> +    {
> +        if ( page_to_maddr(pos) < page_to_maddr(pg) )
> +        {
> +            head = &pos->list;
> +            break;
> +        }
> +    }

Wait - a linear search for every single page insertion? How well
is that going to perform on a multi-terabyte system?

> +    page_list_add_tail(pg, head);

page_list_head and page_list_entry are generally different things,
so I'm afraid this isn't correct in the common case, and you're
getting away with it only because only Arm currently enables this
code.

> +}
> +
> +static void color_heap_remove_page(struct page_info *pg)
> +{
> +    page_list_del(pg, colored_pages(page_to_color(pg)));
> +}
> +
> +static void __init init_col_heap_pages(struct page_info *pg,
> +                                       unsigned long nr_pages)
> +{
> +    unsigned int i;
> +
> +    if ( !color_heap )
> +    {
> +        unsigned int max_colors = get_max_colors();
> +        color_heap = xmalloc_array(colored_pages_t, max_colors);

Nit: Please always have a blank line between declaration(s) and
statement(s).

> +        BUG_ON(!color_heap);
> +
> +        for ( i = 0; i < max_colors; i++ )
> +            INIT_PAGE_LIST_HEAD(colored_pages(i));
> +
> +        if ( !buddy_alloc_size )
> +            buddy_alloc_size = parse_size_and_unit(CONFIG_BUDDY_ALLOCATOR_SIZE,
> +                                                   NULL);
> +    }
> +
> +    printk(XENLOG_INFO "Init color heap with %lu pages\n", nr_pages);
> +    printk(XENLOG_INFO "Paging starting from: 0x%"PRIx64"\n",
> +           page_to_maddr(pg));

"Paging"? And please prefer %# over 0x% for hex formatting, as we do
elsewhere.

> +    for ( i = 0; i < nr_pages; i++ )
> +        color_heap_insert_page(pg++);
> +}
> +
> +/* Alloc one page based on domain color configuration */
> +static struct page_info *alloc_col_heap_page(unsigned int memflags,
> +                                             const unsigned int *colors,
> +                                             unsigned int num_colors)

Array instead of pointer notation would better reflect the purpose.

> +{
> +    struct page_info *pg = NULL;
> +    unsigned int i;
> +    bool need_tlbflush = false;
> +    uint32_t tlbflush_timestamp = 0;
> +
> +    spin_lock(&heap_lock);
> +
> +    for ( i = 0; i < num_colors; i++ )
> +    {
> +        struct page_info *tmp;
> +
> +        if ( page_list_empty(colored_pages(colors[i])) )
> +            continue;
> +
> +        tmp = page_list_first(colored_pages(colors[i]));
> +        if ( !pg || page_to_maddr(tmp) > page_to_maddr(pg) )
> +            pg = tmp;
> +    }
> +
> +    if ( !pg )
> +    {
> +        spin_unlock(&heap_lock);
> +        return NULL;
> +    }
> +
> +    pg->count_info = PGC_state_inuse;

Aren't you losing PGC_colored here?

> +static struct page_info *alloc_col_domheap_page(struct domain *d,
> +                                                unsigned int memflags)
> +{
> +    struct page_info *pg;
> +
> +    ASSERT(!in_irq());

ASSERT_ALLOC_CONTEXT()? Albeit that's redundant then with the sole caller.

> +#else
> +static void free_col_domheap_page(struct page_info *pg)
> +{
> +    return;
> +}

No need for "return" here.

> @@ -1939,11 +2107,24 @@ void __init end_boot_allocator(void)
>              break;
>          }
>      }
> -    for ( i = nr_bootmem_regions; i-- > 0; )
> +
> +    for ( i = 0; i < nr_bootmem_regions; i++ )

I'm afraid you can't simply go and invert the direction this loop works
without any justification. It's not even clear why you need to work
forwards in the colored case.

Jan

