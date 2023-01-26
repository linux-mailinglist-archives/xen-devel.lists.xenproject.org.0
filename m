Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A716C67D19E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 17:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485117.752102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL58G-0006FQ-AD; Thu, 26 Jan 2023 16:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485117.752102; Thu, 26 Jan 2023 16:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL58G-0006DB-5Y; Thu, 26 Jan 2023 16:29:48 +0000
Received: by outflank-mailman (input) for mailman id 485117;
 Thu, 26 Jan 2023 16:29:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pL58F-0006D3-Dq
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 16:29:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2054.outbound.protection.outlook.com [40.107.8.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3ee31af-9d96-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 17:29:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8896.eurprd04.prod.outlook.com (2603:10a6:102:20f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 16:29:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 16:29:41 +0000
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
X-Inumbo-ID: a3ee31af-9d96-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGv5P8Dak0c+5vWajkX1NtDIcNDgqk32ZBuapNcrrlX82wd0bBmFMBx3M7FEIoO3qIof3dCJaagMJth7PFtEpb0vQUP9dGGDeWJgAiSGedql+YkZathOIvWnQGkifqOOX2oaXi+/DhweQZrMuz9/s5zBTmQ6AhGMP6YEaRMTYGMxkqJ/3laZhwq4i+KzV69KCIhCxNlvKaDGp+/K9+eUZcWMmg6ETu/uHgyZ5qBxfh2Dro0fImxXCbBHXxCHVkDGqgYHLbSAdX75TNEFmfuP/QsXjRpjyTOgWDKvFkg8Phd8lBtgw0zrH6zI4i8188zpCtSFjbcuggDm3hSpMGyJjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNvLVdm6rkdShMT+NhHdgNyJY1Z/V0L0khdGqzMkUZg=;
 b=oaJgk8DMdKciK1JtyyEVws7NKaJXNfUTWxdGqKzyFRtfS9rNnfeO0xgN1jacHGIQG15aNaEldd+1Oo9qKpkZYVeO6zpNb++lnQlQL1zHIr8xssliLVeN+N5YuefbtY20kuG4BfWfQm1Ri1KPL9PAr46Y4DMN/vtC+JQfgkQZeVLMJ1f8Z8dG3BV7ezd8Kd4CazMfSR49reWbeuzPnsc2Toc8zQBW+hOoZXM7hFvQeqDXr8iK6t4TuG0lBJnZK5YZ1Fj4ee8Nr/d6APMe8AL1JoUuIJc0MicdqHnNI7k1fM3y/VrqRV9v5Lsp213ML3XATklThEPu8UDlF6nZW9X4EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNvLVdm6rkdShMT+NhHdgNyJY1Z/V0L0khdGqzMkUZg=;
 b=FWqxCSFbTr8LZ5iSGlEgk85YVxgaubjw6U9lbEaXTo1So7YMVexrxvF93h0C0FcGXcS++UVH+6cdycLlo1H382Pk90b4Vtoq+FdADm0cZzqSrgBNdZ9kcIKKvyY+9CmTzHfWb7uEIddlq6i9TWoEzFtvBmAE3d1+AlVE/zO8WQKhneGWfVcIp+Ov/lJ+EJFAoFdZPDhVuzJU2zbgnR7xFnp9jSRvWgfJwGG+SdxbiqgO6NmXHz+QIr7lj/V0Uf00DWk/r7ypB5wHavRG/2qHW2EOhe0Fl78kLYQZhjhn6pOmt8qxbipu+sfELU6kPXRyx9QTm4z1e8JhYZGQhbMziw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21f1e368-5d44-b689-0bb7-164a53e5ffd7@suse.com>
Date: Thu, 26 Jan 2023 17:29:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 07/11] xen: add cache coloring allocator for domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-8-carlo.nonato@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230123154735.74832-8-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d109836-5f0c-42f5-b384-08daffba869b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TFTSmXhh8cex01dyobuo2VtaJmtOV4GGciE7nuSjCiLcSnyDSnh5NJvFjL8kfZXdY5RQIJvtZ0FTcTcI42hNicWd5q4xv3CI1WRGyQMJfStELNEXGb1z61S06xrmqHN4aQ1dzn+iDmOB8bNu1RHZBN3B0+1S11Cpn2fuLzA6HOQnkB0ntYa9hsXIkCIbzRp3E973pa4WgKG9tM1XQJ+I6etVFZ3PPUZLeqV2CAzd8DpfX75d+NABCTnF6H/UAfpkaCekwj6oefqe/hBDmGWzEQ+jVQYQvZHeRBOYkTbfZ0RQ7mqQVMg3r93+mh0bIrRb4SvocIVs1r28Zmk9Xzz2lrz2F+cUOn1/HnHH+Kz0sX2fccm90gqKaVq+JgGy3GMHCFQBdWhxBY2OT5N87St3j/G09lmZ0DvepolPw3HGkUek81dfhLm1FYYQgP6Ft14U90mFBUiwNyB0zVKuVx7lOdLyR7YjoOMDuQ77z0Yil4cYmkd22TsG9P+nvNmIy4VK0mjuV8MAZ4Nmoi4Aw/5r9HWhHWKzL1RusuocIu6raskOYPjBjnSMSM3JhzDStnTXNCHpczquYst5ZRtwg7dzkdbxc5mETKinUkl+E/5U+cCCquOkpYwNjrD+jbN52QHTHOpVd1f8E/XdVKLk2tezWmvW1KMs8cXBP/P/x1pUmnZUmoOfNSFywIIzzSkEm/YdYD6UNwXQaYD8hAxr307L808lmjOUikO5iH8KyCFi7Go=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199018)(7416002)(30864003)(316002)(5660300002)(54906003)(66556008)(8936002)(41300700001)(66946007)(36756003)(86362001)(8676002)(6916009)(66476007)(4326008)(31696002)(38100700002)(478600001)(6486002)(2616005)(31686004)(83380400001)(2906002)(53546011)(6506007)(186003)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzRNWFUrMFdVKy9hYVlIV0x3M0ltMjAwT1dlYU53OExtdStBeURraTVtWWkz?=
 =?utf-8?B?aUNCOXA5d3B3dnBKVFptRU4ybkdmTGErVlN6LzRIa1pDWHFjZHdJVDdlOFcy?=
 =?utf-8?B?RytDS3RuUDMxMWRHK3NlbUhqT2JWVjBaQ3NlSHdTUUFlNHpHMExXQzgvazVB?=
 =?utf-8?B?NnBEK0lqemEvNm4vUjRvN0NzN0RsSGg4cDZXOXhJeC8rT2RLcExDUjVJQjRU?=
 =?utf-8?B?SGUwYlZuRWQvMjM1OGNaUklKZmJuVWVzampyOVBCR3J5M3BRSXFCeVJwdVNU?=
 =?utf-8?B?SSs2SGozMjdMTHpvUWc2ZFdLUTI2SURkYlE5NkNHQ3Nxb1BYc3YwYVUyMzBB?=
 =?utf-8?B?bDZxVG1HUm5vVzljcUdIdncxeXRvVzlUcXdOS0l4YXlZd0VHckp5L3B4RDd1?=
 =?utf-8?B?RU0xUjhRSFVNUWEwTlB1N0lYeUtDOW5iZ0hRakkrMDAwV2lSYmNHaW8yaG12?=
 =?utf-8?B?WlJlemM1ejRYSDBNR1JJUFdrVkd0eXpPUGsxNjlaeXdoeGM1d3JMWkE5R0Nn?=
 =?utf-8?B?Y0Zsbm9XYVpxcEFYTU5ZVi90MFhHa2lNb1hFSG5Dbk16WFQ3eENVWitTR3Nk?=
 =?utf-8?B?RmppUSsvZHY3bW5tUVZtWExRYmlmZHpBUEVsWFZqTUdKd0RwdUcrbGVKSm0v?=
 =?utf-8?B?bmZFazBEeDluNmtGc1Z4U2RKSzdkU2JEeXVKSk9DMldYOVhUZVZtRUV5UnB4?=
 =?utf-8?B?Z2pReXZRK3hpSUxtbXhRNkpzVytMaFcwa1dGVFJSR09WTE9RbitpU2o1MVN3?=
 =?utf-8?B?TWM5RnZNWVZDY050SXlIcHBCUGtBenV6bDJ5bWxXK2twV3lyREt2MzB4ZjdW?=
 =?utf-8?B?eGkyMWlEK2trUVVwK0VMWFBEb0lWSStybGxzWlNsUHlBSTB6WUJ4MU1xYlBJ?=
 =?utf-8?B?a3RkZXVZYnpiREdESFZDa1FqUnEvYVYvZC9qV1JLc3hoWWxyUDF0MjF5aHdp?=
 =?utf-8?B?Rk5OZm16WGJOMnhVZ2txcnhCbE5sb2pYR3kwUkZRbTVuakhpeDdaR3c2N1FQ?=
 =?utf-8?B?akg1V0lYbiswemx2Q0ZoZjZzNWhhQzFNS3h6YlgxWnpYNVRlRzRHcjBWUXBI?=
 =?utf-8?B?cWhGS1J0d1hQN01VbVZoNHI2dXVCVERTUjg3d2puclU4N3FSMEFMRkw3enZ1?=
 =?utf-8?B?SnpqazZicG1sR1h1SE4vM2M5NkdHVnlSZVBNeU1LeGxyeHJwSGtjRXBJMERP?=
 =?utf-8?B?SDFpUGtXbW5ETkZRd0Jkc0N5UU5ic0ZmbVQ2T1V2SFBkVUNkQjBzUFFVNU43?=
 =?utf-8?B?SXc5THpzcVVLYnB3V2Z2QkVZRTZCd0VTa2FIM1U2cXZhQTlheW5SYmtDOG4v?=
 =?utf-8?B?cWplSVlHbXV2bnJrcWhTcTRKYlZJdDhvVHQ4M1RIaWxINlpVWUV0a09nZW5L?=
 =?utf-8?B?SDkrdFNrd3pBc05RMDNtRG1kNENOTitOVGxXRG54U0RnN2JJMTBRRThZcUdv?=
 =?utf-8?B?VFE2T3REMlBId05IbXJNMXlHclI3VnRnZ25XLzJLcS8vRDNMd3ZYc25oTWVo?=
 =?utf-8?B?bnplZWhDZ0h4eGFvKzVuRmpyWkJTL1NSVWlwMHFXM1VpMUd3bVBEMXp5WmdF?=
 =?utf-8?B?M1F1OXRMd2EyTElxb3ZyRXNPdkFrOFNRSlNoLzUzbEg5R3BBNVU2VXg5dkFr?=
 =?utf-8?B?YUFEUEE4elZSR0hIWi82K29lODNQWFF4WS85QzRIdW5TQ2o2UmVhMlp2Y056?=
 =?utf-8?B?RE85bXNlSFEvRmFZTVhKOE1NVUgxYjBEVmpRNjR0NUUrY2k5RDdTU2xac2VI?=
 =?utf-8?B?SHppdUo4a2R3TUFEWEIwRFR4dFM4THVySzBtbzJvMmdmS0NJenF6eTFHbDZG?=
 =?utf-8?B?RUc2OFNucGdrZ0NlWEtxbkp0U2QwengrZnJyanNWbXVIQWFnbnJBd1dhZFJs?=
 =?utf-8?B?Y2UvVTBLa2RrVnpJZ1pzb1JPUG1rWGtTRUJUek1pOXlySW1qaSttenpCNHhV?=
 =?utf-8?B?NU9sY1ZSUjlFVHhpWUFPUkkwTGEzelE2dGpFd3FDUDZaS2I2M0lKanNiUEYr?=
 =?utf-8?B?dFVLRkRzM1JaWXhxa3JheURLWkZRWTkyWUp2cm5qcDFiSnF2NHM0dFZuU1Ft?=
 =?utf-8?B?QVBUVXlZZWE0Q1VPUGFBTnd3MGhNK2I5cksxNTNweWZYYXozSmNHTDZpYUlq?=
 =?utf-8?Q?ASs7B5etY0l762L4yKp96J+wk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d109836-5f0c-42f5-b384-08daffba869b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 16:29:41.6822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeooxKG6TWandFeaCmfL3l8dCyelZSQLkhwUdEv59GfjobJdJgdrAfXXwpa2Kijo9f0JSGLBJLLLtRmVKKbTFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8896

On 23.01.2023 16:47, Carlo Nonato wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -299,6 +299,20 @@ can be maintained with the pv-shim mechanism.
>      cause Xen not to use Indirect Branch Tracking even when support is
>      available in hardware.
>  
> +### buddy-alloc-size (arm64)

I can't find where such a command line option would be processed.

> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -128,6 +128,9 @@ struct page_info
>  #else
>  #define PGC_static     0
>  #endif
> +/* Page is cache colored */
> +#define _PGC_colored      PG_shift(4)
> +#define PGC_colored       PG_mask(1, 4)

Is there a reason you don't follow the conditional approach we've taken
for PGC_static?

Thinking of which - what are the planned interactions with the static
allocator? If the two are exclusive of one another, I guess that would
need expressing somehow.

> --- a/xen/arch/arm/llc_coloring.c
> +++ b/xen/arch/arm/llc_coloring.c
> @@ -33,6 +33,8 @@ static paddr_t __ro_after_init addr_col_mask;
>  static unsigned int __ro_after_init dom0_colors[CONFIG_NR_LLC_COLORS];
>  static unsigned int __ro_after_init dom0_num_colors;
>  
> +#define addr_to_color(addr) (((addr) & addr_col_mask) >> PAGE_SHIFT)

You're shifting right by PAGE_SHIFT here just to ...

> @@ -299,6 +301,16 @@ unsigned int *llc_colors_from_str(const char *str, unsigned int *num_colors)
>      return colors;
>  }
>  
> +unsigned int page_to_llc_color(const struct page_info *pg)
> +{
> +    return addr_to_color(page_to_maddr(pg));

... undo the corresponding left shift in page_to_maddr(). Depending
on other uses of addr_col_mask it may be worthwhile to either change
that to or accompany it by a mask to operate on frame numbers.

> @@ -924,6 +929,13 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
>      }
>  }
>  
> +/* Initialise fields which have other uses for free pages. */
> +static void init_free_page_fields(struct page_info *pg)
> +{
> +    pg->u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
> +    page_set_owner(pg, NULL);
> +}

To limit the size of the functional change, abstracting out this function
could helpfully be a separate patch (and could then also likely go in ahead
of time, simplifying things slightly for you as well).

> @@ -1488,7 +1497,7 @@ static void free_heap_pages(
>              /* Merge with predecessor block? */
>              if ( !mfn_valid(page_to_mfn(predecessor)) ||
>                   !page_state_is(predecessor, free) ||
> -                 (predecessor->count_info & PGC_static) ||
> +                 (predecessor->count_info & (PGC_static | PGC_colored)) ||
>                   (PFN_ORDER(predecessor) != order) ||
>                   (page_to_nid(predecessor) != node) )
>                  break;
> @@ -1512,7 +1521,7 @@ static void free_heap_pages(
>              /* Merge with successor block? */
>              if ( !mfn_valid(page_to_mfn(successor)) ||
>                   !page_state_is(successor, free) ||
> -                 (successor->count_info & PGC_static) ||
> +                 (successor->count_info & (PGC_static | PGC_colored)) ||
>                   (PFN_ORDER(successor) != order) ||
>                   (page_to_nid(successor) != node) )
>                  break;

This, especially without being mentioned in the description (only in the
revision log), could likely also be split out (and then also be properly
justified).

> @@ -1928,6 +1937,182 @@ static unsigned long avail_heap_pages(
>      return free_pages;
>  }
>  
> +#ifdef CONFIG_LLC_COLORING
> +/*************************
> + * COLORED SIDE-ALLOCATOR
> + *
> + * Pages are grouped by LLC color in lists which are globally referred to as the
> + * color heap. Lists are populated in end_boot_allocator().
> + * After initialization there will be N lists where N is the number of
> + * available colors on the platform.
> + */
> +typedef struct page_list_head colored_pages_t;

To me this type rather hides information, so I think I would prefer if
you dropped it.

> +static colored_pages_t *__ro_after_init _color_heap;
> +static unsigned long *__ro_after_init free_colored_pages;
> +
> +/* Memory required for buddy allocator to work with colored one */
> +static unsigned long __initdata buddy_alloc_size =
> +    CONFIG_BUDDY_ALLOCATOR_SIZE << 20;

Please don't open-code MB().

> +#define color_heap(color) (&_color_heap[color])
> +
> +static bool is_free_colored_page(struct page_info *page)

const please (and wherever applicable throughout the series)

> +{
> +    return page && (page->count_info & PGC_state_free) &&
> +                   (page->count_info & PGC_colored);
> +}
> +
> +/*
> + * The {free|alloc}_color_heap_page overwrite pg->count_info, but they do it in
> + * the same way as the buddy allocator corresponding functions do:
> + * protecting the access with a critical section using heap_lock.
> + */

I think such a comment would only be useful if you did things differently,
even if just slightly. And indeed I think you do, e.g. by ORing in
PGC_colored below (albeit that's still similar to unprepare_staticmem_pages(),
so perhaps fine without further explanation). Differences are what may need
commenting on (such that the safety thereof can be judged upon).

> +static void free_color_heap_page(struct page_info *pg)
> +{
> +    unsigned int color = page_to_llc_color(pg), nr_colors = get_nr_llc_colors();
> +    unsigned long pdx = page_to_pdx(pg);
> +    colored_pages_t *head = color_heap(color);
> +    struct page_info *prev = pdx >= nr_colors ? pg - nr_colors : NULL;
> +    struct page_info *next = pdx + nr_colors < FRAMETABLE_NR ? pg + nr_colors
> +                                                             : NULL;

Are these two calculations safe? At least on x86 parts of frame_table[] may
not be populated, so de-referencing prev and/or next might fault.

> +    spin_lock(&heap_lock);
> +
> +    if ( is_free_colored_page(prev) )
> +        next = page_list_next(prev, head);
> +    else if ( !is_free_colored_page(next) )
> +    {
> +        /*
> +         * FIXME: linear search is slow, but also note that the frametable is
> +         * used to find free pages in the immediate neighborhood of pg in
> +         * constant time. When freeing contiguous pages, the insert position of
> +         * most of them is found without the linear search.
> +         */
> +        page_list_for_each( next, head )
> +        {
> +            if ( page_to_maddr(next) > page_to_maddr(pg) )
> +                break;
> +        }
> +    }
> +
> +    mark_page_free(pg, page_to_mfn(pg));
> +    pg->count_info |= PGC_colored;
> +    free_colored_pages[color]++;
> +    page_list_add_prev(pg, next, head);
> +
> +    spin_unlock(&heap_lock);
> +}

There's no scrubbing here at all, and no mention of the lack thereof in
the description.

> +static void __init init_color_heap_pages(struct page_info *pg,
> +                                         unsigned long nr_pages)
> +{
> +    unsigned int i;
> +
> +    if ( buddy_alloc_size )
> +    {
> +        unsigned long buddy_pages = min(PFN_DOWN(buddy_alloc_size), nr_pages);
> +
> +        init_heap_pages(pg, buddy_pages);
> +        nr_pages -= buddy_pages;
> +        buddy_alloc_size -= buddy_pages << PAGE_SHIFT;
> +        pg += buddy_pages;
> +    }

I think you want to bail here if nr_pages is now zero, not the least to avoid
crashing ...

> +    if ( !_color_heap )
> +    {
> +        unsigned int nr_colors = get_nr_llc_colors();
> +
> +        _color_heap = xmalloc_array(colored_pages_t, nr_colors);
> +        BUG_ON(!_color_heap);
> +        free_colored_pages = xzalloc_array(unsigned long, nr_colors);
> +        BUG_ON(!free_colored_pages);

... here in case the amount that was freed was really tiny.

> +        for ( i = 0; i < nr_colors; i++ )
> +            INIT_PAGE_LIST_HEAD(color_heap(i));
> +    }
> +
> +    printk(XENLOG_DEBUG
> +           "Init color heap with %lu pages starting from: %#"PRIx64"\n",
> +           nr_pages, page_to_maddr(pg));
> +
> +    for ( i = 0; i < nr_pages; i++ )
> +        free_color_heap_page(&pg[i]);
> +}
> +
> +static void dump_color_heap(void)
> +{
> +    unsigned int color;
> +
> +    printk("Dumping color heap info\n");
> +    for ( color = 0; color < get_nr_llc_colors(); color++ )
> +        printk("Color heap[%u]: %lu pages\n", color, free_colored_pages[color]);

When there are many colors and most memory is used, you may produce a
lot of output here for just displaying zeros. May I suggest that you
log only non-zero values?

> +}
> +
> +#else /* !CONFIG_LLC_COLORING */
> +
> +static void free_color_heap_page(struct page_info *pg) {}
> +static void __init init_color_heap_pages(struct page_info *pg,
> +                                         unsigned long nr_pages) {}
> +static struct page_info *alloc_color_heap_page(unsigned int memflags,
> +                                               struct domain *d)
> +{
> +    return NULL;
> +}
> +static void dump_color_heap(void) {}

As said elsewhere (albeit for a slightly different reason): It may be
worthwhile to try to omit these stubs and instead expose the normal
code to the compiler unconditionally, relying on DCE. That'll reduce
the risk of people breaking the coloring code without noticing, when
build-testing only other configurations.

> @@ -1936,12 +2121,19 @@ void __init end_boot_allocator(void)
>      for ( i = 0; i < nr_bootmem_regions; i++ )
>      {
>          struct bootmem_region *r = &bootmem_region_list[i];
> -        if ( (r->s < r->e) &&
> -             (mfn_to_nid(_mfn(r->s)) == cpu_to_node(0)) )
> +        if ( r->s < r->e )
>          {
> -            init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> -            r->e = r->s;
> -            break;
> +            if ( llc_coloring_enabled )
> +            {
> +                init_color_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> +                r->e = r->s;
> +            }
> +            else if ( mfn_to_nid(_mfn(r->s)) == cpu_to_node(0) )
> +            {
> +                init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> +                r->e = r->s;
> +                break;
> +            }

I think the coloring part here deserves a comment, or else it can easily
look as if there was a missing "break" (or it was placed in the wrong
scope). I also think it might help to restructure your change a little,
both to reduce the diff and to keep indentation bounded:

  if ( r->s >= r->e )
    continue;

  if ( llc_coloring_enabled )
    ...

Also please take the opportunity to add the missing blank lines between
declaration and statements.

> @@ -2332,6 +2524,7 @@ int assign_pages(
>  {
>      int rc = 0;
>      unsigned int i;
> +    unsigned long allowed_flags = (PGC_extra | PGC_static | PGC_colored);

This is one of the few cases where I think "const" would be helpful even
on a not-pointed-to type. There's also not really any need for parentheses
here. As to the name, ...

> @@ -2349,7 +2542,7 @@ int assign_pages(
>  
>          for ( i = 0; i < nr; i++ )
>          {
> -            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
> +            ASSERT(!(pg[i].count_info & ~allowed_flags));

... while "allowed" may be fine for this use, it really isn't ...

> @@ -2408,8 +2601,8 @@ int assign_pages(
>          ASSERT(page_get_owner(&pg[i]) == NULL);
>          page_set_owner(&pg[i], d);
>          smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
> -        pg[i].count_info =
> -            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
> +        pg[i].count_info = (pg[i].count_info & allowed_flags) |
> +                           PGC_allocated | 1;

... here. Maybe "preserved_flags" (or just "preserved")?

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -299,6 +299,33 @@ page_list_add_tail(struct page_info *page, struct page_list_head *head)
>      }
>      head->tail = page;
>  }
> +static inline void
> +_page_list_add(struct page_info *page, struct page_info *prev,
> +               struct page_info *next)
> +{
> +    page->list.prev = page_to_pdx(prev);
> +    page->list.next = page_to_pdx(next);
> +    prev->list.next = page_to_pdx(page);
> +    next->list.prev = page_to_pdx(page);
> +}
> +static inline void
> +page_list_add_prev(struct page_info *page, struct page_info *next,
> +                   struct page_list_head *head)
> +{
> +    struct page_info *prev;
> +
> +    if ( !next )
> +    {
> +        page_list_add_tail(page, head);
> +        return;
> +    }

!next is ambiguous in its meaning, so a comment towards the intended
behavior here would be helpful. It could be that the tail insertion is
necessary behavior, but it also could be that insertion anywhere would
actually be okay, and tail insertion is merely the variant you ended up
picking.

Then again ...

> +    prev = page_list_prev(next, head);
> +    if ( !prev )
> +        page_list_add(page, head);
> +    else
> +        _page_list_add(page, prev, next);
> +}
>  static inline bool_t
>  __page_list_del_head(struct page_info *page, struct page_list_head *head,
>                       struct page_info *next, struct page_info *prev)
> @@ -451,6 +478,12 @@ page_list_add_tail(struct page_info *page, struct page_list_head *head)
>      list_add_tail(&page->list, head);
>  }
>  static inline void
> +page_list_add_prev(struct page_info *page, struct page_info *next,
> +                   struct page_list_head *head)
> +{
> +    list_add_tail(&page->list, &next->list);

... you don't care about !next here at all?

Jan

