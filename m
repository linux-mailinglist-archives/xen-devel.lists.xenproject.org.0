Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9F3735B24
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 17:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551159.860533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBGpn-0002jn-7b; Mon, 19 Jun 2023 15:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551159.860533; Mon, 19 Jun 2023 15:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBGpn-0002h7-4H; Mon, 19 Jun 2023 15:30:27 +0000
Received: by outflank-mailman (input) for mailman id 551159;
 Mon, 19 Jun 2023 15:30:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBGpl-0002h1-Ij
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 15:30:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34935c15-0eb6-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 17:30:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7513.eurprd04.prod.outlook.com (2603:10a6:10:20a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 15:30:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 15:30:18 +0000
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
X-Inumbo-ID: 34935c15-0eb6-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDY0+stxNt+Hj9ieu9w4IS4dafkFuFMbrkoqqRBn+DU6i3cgzjKvvuX6lYfC4kwwVlUHiZ+FQ3QbmwM6X61nsex62HtyQdKprxyLZpUbAuEl49/hTekDeJ1zMrSM4UYvHl4E+z/bKzzwyleQL7Fhwtso/wgiDcG3U4iq9cPxgoDW1VxtJ4eOyKnyIiP3gnNUGkUtX9Qy7VM5e50I6nq9r+QMFCJNYKtW6IAYKcLm9p/GYmmjI1Yfhl+eojHVK0rLyWrhNUJgxGbjn4UsRVDwGYPRkUDbIPZ8nOroAbhUtqzFdaacgZapdq1Jn9aTVyCnyzB4fXc44sSh80pLsRXLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvHfrrnoyVSjGKh7R1x9wFrGs2e6/bnWsglZs5o6XjU=;
 b=DW03wr7tbgMHk9/K4MszwytFu5Xk06z/7tasmjRIUUjweH42bnyrhUy4eqno9kbt3vZkF8vul/rK8sMfdOLPbqfbe78tkNfZNxFOF7t8noUzpume6ICgfd/tQuClJWf9mpqMXVK1WgDhX+cPauFBLFlWYIAs/BEkK9rr9t/tc0F2fHamUcEDxDhBwyy/GgIN/xiUWb1oFckn058IKDktkxKlOuYn7PGuQIrR8nKBHJrGBLbADmWLWf9e/lsILUQY7+iXSyaKTQjCgJpNE2o0FxQmSeFfq5/5/4A0I+tkckSSsG5an5DEif0quDSfPB8ZQY3MJ2NfYusTMzkACU+8yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvHfrrnoyVSjGKh7R1x9wFrGs2e6/bnWsglZs5o6XjU=;
 b=3ZdIhCXuMlJBHIsHD8GtIQpHKrwbonQjzlGc7cPC4mb4MdypsDKizwn48ymxpznFJ3l5tFvlbGM0O+hnEo6hAhOJZ9DVMh7QhoaVUyVJa386wCqLTHuLxMVlx8b/zfHYFRxWHVlUu128HiM7lspWT+0kCBCANQMCYDnlQKADZgomc0WzSX4uBU1FEsvAVGoD8tfOukZ6FYKK5QwhVXNUoJMHwf8XL4S3tmR9uTRQYZak6J1jkevWBGnvOJPAKUlAx7p6pT6SexMMXnxXXVJlJuVFmndAAkRKmzmuKijg1XKtRjAicfetdwtdhOI7E+opoyE04gZk65nHsxfI8EXN8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <984e13ef-a73e-126c-0bf8-58bee9beb7b2@suse.com>
Date: Mon, 19 Jun 2023 17:30:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] mm/pdx: Add comments throughout the codebase for pdx
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230615162741.2008-1-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230615162741.2008-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: c99c232d-3b16-4b8e-6fc3-08db70da1667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oTHrn2BFPuqSUzGBvXJfiS0qtUR8X9Lhu+ZWfQEHZCZEjFypYitXDUwBIqn9bWnHU+3jyMb8EcGzTMVzPHRuZII1UZ1Fp3Zy/9MXYtkUVMY4fv9jMz5T4P4c/QEj2+xQzT37/dsNvu8OS8GJb30c0h9Jg/JSeu+YARj0ON1cKEReBLZiOBQEO31A34lzHs/uZDoTUrwS8pFZg2BbyeMsjUY58bZVR6gj6LPAfDMZg0zXsfdKB1vkvykT2kWtKt+pob8POkqx7XB1PIm0WkNf9OpL9zV8juHerNyU62qf5wSN840KkYSZlqHIHE92QBPr4uiK4uBcgbX9bLQr7hrg26EiWC3UEABVz1SFxZ9ji92I449D+q7kiKYwzpBtj621/FfHI31o5n0wLRm262eDXNm9R4FY0qW+X/mAflnR1LGs0zA6sB9LpIHpEGhMo5MRC5w447PUZv5Dl0U7hl2WjQwDqJeSQa9rJdQ5uDIYS1iCiBBXfDi6oEx0+4lDUEEpUdhCdtqH3UDvDBjaNo6Pt09Y/EnXdq5ZGCWrqrW3qIuA2XbEUAhj2TJlWhsgzN051413KmXtQkPwaCdppLd8jNwZGoMcMRbq6qKDcbFFj1PhYf2plCFON/yYY9EjntUMeGOwm6O2G3DloxuDNOv3zA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199021)(478600001)(31696002)(2906002)(66899021)(54906003)(6666004)(6486002)(2616005)(86362001)(36756003)(26005)(186003)(6506007)(6512007)(53546011)(8936002)(8676002)(66476007)(66556008)(66946007)(5660300002)(38100700002)(316002)(6916009)(4326008)(83380400001)(31686004)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnJBbWRzZVhnSE5JNkFuVTFZNDNzYmJoS2JmUTNIS3prZ01wbUFFbHRuUkRP?=
 =?utf-8?B?d28vdk9peGR5VjhPS2ttaklyREhCSUphOTZHcXovb1Z1cFc1SmJyWDRmNzZp?=
 =?utf-8?B?WWU4QlBvNnZYbDRtcmt6elpKaGg5OTdITUxwTGd4S3JJcUNBZy9PeWlORkh3?=
 =?utf-8?B?Z3VGK2o4QmhqM1Fuc0luRWE0R0Z0NlJiNFV6Ri9Qc0pCRDFiTy9hdHVhb0RV?=
 =?utf-8?B?c1UzL1FoeEV5R3Z0UnVNYlVjbEtxZDZYMWFJNzZLN2U2di92K24rc1kwMnI2?=
 =?utf-8?B?VU05S3diaWpaRVBxaHlLWkNJcmRYOCt4NUlKZTBCUFFmaURoSmtNWENjWkdQ?=
 =?utf-8?B?VW9WZ09KZHZWYmJjKytEL2JEYjh0bE1vMU5NWmxhRDZTZFFyM3ZScnBJakhn?=
 =?utf-8?B?S3NIeWZJRmpFSFN0Vm9VU2FLZDBXVjJFV1EyTVJyTU9aUVlud0hhbWpIQnNU?=
 =?utf-8?B?Rk5GYTdXb3BSY3BiYnJRVnh5TmZvZ05TKzlSSWJCclVnMzZBdkJmSzFQMTlJ?=
 =?utf-8?B?dTdLd2dySTVqbTNnR0QweUluZ1NJVTFzTHRsa2tGT0hzWWtNMlZ5ekxWdTA5?=
 =?utf-8?B?anFWOFBTV2RZWlEvRmlFSUN3NU85V2Vha0lGQ0drSU1GSHQwL0d1VlRDdjVV?=
 =?utf-8?B?MVRvNGc4Sks0VjlOMHNpN2llMWthZ3BrVFZjRlV0TXJFY202WWJ3OE9TVEJw?=
 =?utf-8?B?dHB3bU9DQ3lROXhtRmJ5Qk5XRElobWs4MnJGZUc3Q0YwY0N3NFFxSmx2QmMw?=
 =?utf-8?B?by9GWVNFMTN0WGQzdUo0Y1BKaWdHcU9nTkRCZHFTTG5CUXNHTVpPK0Y2MTBR?=
 =?utf-8?B?dWwxMjRad1lvSFlQQm1rQjZUTW8wci9ld3RsSWJ4QUxKVUNuVFRhSHVZY2Nv?=
 =?utf-8?B?Ui9zS1MzY1Qzb0hTTEhqMVo4Y0VTY0U2NEZDNkxSM24xZTdnU0pZOWxvY3lk?=
 =?utf-8?B?VzJKa3hxUERLV0ZBb1lkUXpSbmdvN1loeTYwK0phR29oWEx2YmU5OVNPMTR4?=
 =?utf-8?B?RWhPYTVFM09MQnl5Q3MzZWpZb0pyc3pBMnBKVnhiN3BUN2d5M3N4MTF4MnAy?=
 =?utf-8?B?RnBuU1VVcS92c1R1VFkrQldweE9MQ0xGd3FCeWtRNVFYeTJRa2s0R1N5NXA3?=
 =?utf-8?B?b2lMaVM1YytLL1lvamNnNjYrLzdpdnlPUVlxU0FpbTVzYzl3dFR4L05ub2hL?=
 =?utf-8?B?d1NleExTQXhueHp0YVhPcWRHKzIvZUtQZHNuV3NMczA0U0NUcGFUbDF2d1Vw?=
 =?utf-8?B?VndrSldwU1NaYzFhS05IN3V2a0ZNV2kyZzNjelRraGs0VitucmpCaHZqOXJJ?=
 =?utf-8?B?YVFBYnkrRzU0V2VBWnJRaUxITVBRV0huR0hjZFdGQlRJM1RLd0V6dUcrY09v?=
 =?utf-8?B?Z09KY3E3Yk5vV01SZW1pdDRwV1dYNGhMc3NVWklJb3dJQUZXTi9uaTZ1TGk4?=
 =?utf-8?B?aUI5QStoWG1JbUtUWDU2SXJuSUtEaWhxRGJjQjJjbWNKMWJaQzlYQlJSYnYv?=
 =?utf-8?B?WUZnSkhFTFlPbXZzanlCM0dlOGc2aWI3NVp6QmFMa01hQzdhNXRCeVBabHhH?=
 =?utf-8?B?dUNQWGF3WE9vU0VnVWZjdFVVL0h1TlhsMjFvR0lTSTBZOXlmd0sxa1daVWhk?=
 =?utf-8?B?dGpHMDdHVjAzUy9GU3o0RmhqUTlIMWFwNVc2dVRKaGgxQmdZY2lvK2oySnVX?=
 =?utf-8?B?UHBGOEJKV2Z4M3RQQ3BDcFpNWnNySTkxekR3b1hBU1N1OFAzVm9nKzJtY3ln?=
 =?utf-8?B?a3dVendFVkY4MGtDemNwUmRLdVJVRGpha3puY0xvYUdBN0pDdDUyWjF3ekpp?=
 =?utf-8?B?UXlJb0I4aFhHVlYrandxdVRkWDYyWGU2U2kvRUlaY2czbGxLcCtDTG5IaG42?=
 =?utf-8?B?SzV5M25qdUFZMGhLdVdHY0g2TFBacDFXbVpZMTcwaXVuNXMwLzdpbEduMmox?=
 =?utf-8?B?azd1VFFDSGhqMG56bytNVEhnazg4WHJPWEltQ0psM1RpUEZRVmtsM0dzVHNE?=
 =?utf-8?B?dHA4RWlrY1R3bGxFb0ZWVlBVMzEyUElXWUQ3TVhsbm1lV1ZYS3MxV2hRSTZ3?=
 =?utf-8?B?RS9MY3NCQjhsMVNOTDNuc2s3NTg3UkxINWpkK1g5N0VXaUtKdWJESEwwK05S?=
 =?utf-8?Q?eKO6DrM9tD7dUZ2T7+fYPP0v7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99c232d-3b16-4b8e-6fc3-08db70da1667
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 15:30:18.5839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpMuPPWgkFN9ZjCcP4YKxLSc27DU3CI5ohJtzPkIhy/kIjTXOJ3U06J4u+/OjwsipMT4NUln+fnGqPEUh2Akdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7513

On 15.06.2023 18:27, Alejandro Vallejo wrote:
> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -20,13 +20,55 @@
>  #include <xen/bitops.h>
>  #include <xen/nospec.h>
>  
> -/* Parameters for PFN/MADDR compression. */
> +/*
> + * Diagram to make sense of the following variables. The masks and shifts
> + * are done on mfn values in order to convert to/from pdx:
> + *
> + *                      pfn_hole_mask
> + *                      pfn_pdx_hole_shift (mask bitsize)
> + *                      |
> + *                 |---------|
> + *                 |         |
> + *                 V         V
> + *         --------------------------
> + *         |HHHHHHH|000000000|LLLLLL| <--- mfn
> + *         --------------------------
> + *         ^       ^         ^      ^
> + *         |       |         |------|
> + *         |       |             |
> + *         |       |             pfn_pdx_bottom_mask
> + *         |       |
> + *         |-------|
> + *             |
> + *             pfn_top_mask
> + *
> + * ma_{top,bottom}_mask is simply a shifted pfn_{top,pdx_bottom}_mask where the
> + * bottom one shifts in 1s rather than 0s.
> + */

Nit: That 2nd bottom variable is ma_va_bottom_mask.

> @@ -57,9 +99,25 @@ uint64_t __init pdx_init_mask(uint64_t base_addr)
>                           (uint64_t)1 << (MAX_ORDER + PAGE_SHIFT)) - 1);
>  }
>  
> -u64 __init pdx_region_mask(u64 base, u64 len)
> +uint64_t __init pdx_region_mask(uint64_t base, uint64_t len)
>  {
> -    return fill_mask(base ^ (base + len - 1));
> +    uint64_t last = base + len - 1;
> +    /*
> +     * The only bit that matters in base^last is the MSB. There are 2 cases.
> +     *
> +     * case msb(base) < msb(last):
> +     *     then fill_mask(base^last) == fill_mask(last). This is non
> +     *     compressible.
> +     * case msb(base) == msb(last):
> +     *     This means that there _may_ be a sequence of compressible zeroes
> +     *     for all addresses between `base` and `last` iff `base` has enough
> +     *     trailing zeroes. That is, it's compressible when
> +     *     fill_mask(base^last) < fill_mask(last)
> +     *
> +     * The resulting mask is effectively the moving bits between `base` and
> +     * `last`
> +     */
> +    return fill_mask(base ^ last);
>  }

I don't see a need for you to actually change the code here. You can
as well introduce "last" as shorthand just for the comment. What I
dislike in your way of putting it is the use of fill_mask(last) when
such a call never occurs in code. Starting from the first sentence,
can't you explain things just in terms of said MSB (where the two
cases are "set" and "clear")?

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -31,6 +31,22 @@
>   *   (i.e. all devices assigned to) a guest share a single DMA address space
>   *   and, by default, Xen will ensure dfn == pfn.
>   *
> + * pdx: Page InDeX
> + *   Indices into the frame table holding the per-page's book-keeping
> + *   metadata. A compression scheme is used and there's a non-identity
> + *   mapping between valid(mfn) <-> valid(pdx) See the comments in pdx.c
> + *   for an in-depth explanation of that mapping.

The mapping may very well be (and on x86 typically is) an identity
one. IOW you want to describe not only the compression case, but also
the "no compression possible" one.

PDXes also aren't just indexes to the frame table, but also to the
direct mapping.

> + * maddr: Machine Address
> + *   The physical address that corresponds to an mfn
> + *
> + * vaddr: Xen Virtual Address
> + *   A virtual address of memory accesible to Xen. It is typically either
> + *   an address into the direct map or to Xen's own code/data. The direct
> + *   map implements several compression tricks to save memory, so an offset
> + *   into it does _not_ necessarily correspond to an maddr due to pdx
> + *   compression.

We need to be careful here: If I'm not mistaken at least Arm uses vaddr
also for guest addresses. In fact I'm not sure vaddr (and perhaps even
maddr) need explaining here, the more that nothing in this header uses
either term.

> --- a/xen/include/xen/pdx.h
> +++ b/xen/include/xen/pdx.h
> @@ -1,6 +1,62 @@
>  #ifndef __XEN_PDX_H__
>  #define __XEN_PDX_H__
>  
> +/*
> + * PDX (Page inDeX)
> + *
> + * This file deals with optimisations pertaining frame table indexing,
> + * A pdx is an index into the frame table. However, having an identity
> + * relationship between mfn and pdx could waste copious amounts of memory
> + * in empty frame table entries. There are some techniques to bring memory
> + * wastage down.
> + *
> + * ## PDX grouping
> + *
> + * The frame table may have some sparsity even on systems where the memory
> + * banks are tightly packed. This is due to system quirks (like the PCI
> + * hole) which might introduce several GiB of unused page frame numbers
> + * that uselessly waste memory in the frame table. PDX grouping addresses
> + * this by keeping a bitmap of the ranges in the frame table containing
> + * invalid entries and not allocating backing memory for them.
> + *
> + * ## PDX compression
> + *
> + * This is a technique to avoid wasting memory on machines known to have
> + * split their machine address space in two big discontinuous and highly
> + * disjoint chunks.

Why two? There can be any number, and in fact on the system I originally
had data from for reference (when first writing this code) iirc there
were 8 nodes, each with a chunk of memory far away from the other chunks.
The compression scheme used merely requires that some "inner" bits are
unused (always zero) in all of those ranges.

> + * In its uncompressed form the frame table must have book-keeping metadata
> + * structures for every page between [0, max_mfn) (whether they exist or

s/they exist/there is RAM/ ?

> + * not), and a similar condition exists for the direct map. We know some
> + * architectures, however, that have some sparsity in their address space,
> + * leading to a lot of wastage in the form of unused frame table entries.

Hmm, "architectures" suggests e.g. Arm might have such, but x86 won't.
Perhaps "systems", "designs", or "system designs"?

> @@ -13,22 +69,77 @@ extern unsigned long pfn_top_mask, ma_top_mask;
>                           (sizeof(*frame_table) & -sizeof(*frame_table)))
>  extern unsigned long pdx_group_valid[];
>  
> -extern uint64_t pdx_init_mask(u64 base_addr);
> -extern u64 pdx_region_mask(u64 base, u64 len);
> +/**
> + * Calculates a mask covering "moving" bits of all addresses of a region
> + *
> + * e.g:
> + *       base=0x1B00000000
> + *   len+base=0x1B0008200;
> + *
> + *   ought to return 0x00000FFFFF;
> + *
> + * @param base Base address of the region
> + * @param len  Size in octets of the region
> + * @return Mask of moving bits at the bottom of all the region addresses
> + */

This looks to be a copy-and-paste of pdx_region_mask()'s comment, when
the function has neither a "base" parameter, nor a and one at all.

> +uint64_t pdx_init_mask(u64 base_addr);

No u64 -> uint64_t here?

> -extern void set_pdx_range(unsigned long smfn, unsigned long emfn);
> +/**
> + * Calculates a mask covering "moving" bits of all addresses of a region
> + *
> + * e.g:
> + *       base=0x1B00000000
> + *   len+base=0x1B0008200;
> + *
> + *   ought to return 0x00000FFFFF;

I think it would help if you actually said how the return value actually
derives. The term "moving" may be understood differently be different
people, and hence such an explanation actually would also clarify what
"moving" means.

I also thing there's a 0 missing in the len+base value, without which
the result would be quite a bit different.

> + * @param base Base address of the region
> + * @param len  Size in octets of the region
> + * @return Mask of moving bits at the bottom of all the region addresses
> + */
> +uint64_t pdx_region_mask(uint64_t base, uint64_t len);
> +
> +/**
> + * Mark range between smfn and emfn is allocatable in the frame table
> + *
> + * @param smfn Start mfn
> + * @param emfn End mfn
> + */
> +void set_pdx_range(unsigned long smfn, unsigned long emfn);

This could do with mathematically expressing the range in the comment,
such that (in|ex)clusiveness of, in particular, emfn is clarified.

>  #define page_to_pdx(pg)  ((pg) - frame_table)
>  #define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
>  
> +/**
> + * Invoked to determine if an mfn maps to a legal pdx

I wouldn't use "pdx" here, but refer to frame_table[] instead.

> + * In order for it to be legal it must pass bounds, grouping and
> + * compression sanity checks.
> + *
> + * @param smfn Start mfn
> + * @param emfn End mfn
> + * @return True iff all checks pass
> + */
>  bool __mfn_valid(unsigned long mfn);

Comment again mentions inapplicable parameters.

> @@ -38,7 +149,16 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
>  #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
>  #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
>  
> -extern void pfn_pdx_hole_setup(unsigned long);
> +/**
> + * Initializes global variables with information about the compressible
> + * range of the current memory regions.
> + *
> + * @param mask This mask is the biggest pdx_mask of every region in the
> + *             system ORed with all base addresses of every region in the
> + *             system. The result is a mask where every sequence of zeroes
> + *             surrounded by ones is compressible.
> + */
> +void pfn_pdx_hole_setup(unsigned long mask);

With the function returning void, I find "The result" problematic. How about
"This results in ..."?

Btw, "surrounded by ones" isn't really necessary. We could compress shorter
sequences of zeros, so this may want re-wording a little to be as precise
as possible.

Jan

