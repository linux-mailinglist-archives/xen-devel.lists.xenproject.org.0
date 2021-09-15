Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD72440C6D6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 15:56:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187685.336636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVOR-0006xK-G9; Wed, 15 Sep 2021 13:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187685.336636; Wed, 15 Sep 2021 13:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVOR-0006vA-Cu; Wed, 15 Sep 2021 13:56:07 +0000
Received: by outflank-mailman (input) for mailman id 187685;
 Wed, 15 Sep 2021 13:56:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQVOQ-0006v4-44
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 13:56:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6c37c10-42ae-4150-826b-f337866888b9;
 Wed, 15 Sep 2021 13:56:03 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-FjwYToJlO8q0yGYTmiC_qQ-1; Wed, 15 Sep 2021 15:56:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 13:55:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 13:55:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0043.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16 via Frontend Transport; Wed, 15 Sep 2021 13:55:57 +0000
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
X-Inumbo-ID: d6c37c10-42ae-4150-826b-f337866888b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631714162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oxt6RGP8crOhaUnAUT/V9CXgreRWKNIJv8oqL111RmU=;
	b=Y7H96rZF384FpzlN/PWgh401L/p9l+XdHeVKk54P6cesL4AP0YesMqXh+NoMN4wr0zlwLJ
	Z79WlHMsvlKxHXjhlVlB719GPHWw9N/5cqXx4/Nh4QjoYxx9+a9OAnqLA5RwlpY4BmjXWo
	wyBtQ7a5YYUHFL/eI+3T1d76tt7f1FA=
X-MC-Unique: FjwYToJlO8q0yGYTmiC_qQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7enu7DvG4AO1JXpuiF+6XqBM2+PFZTqGMD4kNQPCMszLi3wWRlSTY3FMhuGXIXskNYu+Gk25w3hQ7LTRCY+PViboN0DJ2zuUXSr4vDpLnqN8N5QQxtlZC+r7odBB0m4TKcmn2TzricbpQxGiW1S54Fw1h+5R3tAzIxSnWfGVeXkrBqpxmQjlTon69OO862rdAuoImvPq6ndfTXb/DISFyHHf8BnfTSojzT9p/jkIJ+9fhKONOLyjtTt/2kwuXi9PFFWhL/FFnfJQFTjaVTitjTbVNDse/YqLYSq10ZG7ixB0iLQVgAlgXFM82PDo9pXAQtWWU90nJxqFiLimu5rGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oxt6RGP8crOhaUnAUT/V9CXgreRWKNIJv8oqL111RmU=;
 b=WjO7/wH1PMQPtv2L+fu+AnDLCjDWb12P+qB1JK0IL7fyI5uyfZAe1lk8ZdnWt1qb3EpfN7Y743t+0FeNrI+MbTODIcT5r6923gWy9Z8towtm/yvukraIvlD+yXB/1q0RV/q3KGGwUSsS6uRRmHbo68s7sR67EjbYV7fX6yq8TOMvCMOZuUV48Fb2migh7lpCYgcvsBHpyJEzDuIVBZQtnF5aUxTdP+ioUuSd1zigv3ja9qZ76ALyCv9n7Mb+FeUwJldrCt2aCtDGsv267aL4tuZ7iPrcgJMBVC5pJ3C8Om7LqtdQvWQOE1zt77GwOrIQXUU+F7COWnZze7W3EpT1sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v7 3/7] xen: introduce mark_page_free
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210910025215.1671073-1-penny.zheng@arm.com>
 <20210910025215.1671073-4-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cd1ba586-0613-8e12-97b7-7b4cc2577bb9@suse.com>
Date: Wed, 15 Sep 2021 15:55:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210910025215.1671073-4-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0043.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 492552e4-4474-400f-cce8-08d978508ba6
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2336EF6D53F0D7F3B7EEFDFBB3DB9@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uIxzLKN/UykCMKOCwyOxF+ugXif855lFBIGXwKiExEBXl94RLGm3MlzknjqQdXifib1tJqmcY34Scr4odxph3JhyakApZ4cT4hQW7tbdlKxiCAIFOcLtC1RFlB+kAOGw8CuwMnAK7khWYr0lWp1RyEr7VqpPdkT2ohyFd3cinmD4lkVu0Lj1KlT9J0es6hqDLDehG2/cWUaY76uAn2g3vAFw7HlCukQzI6nyKyi1//DkLufVX+kqML/dY/czudOO3RQrJaPxHblf6b28/fPJO+ZlH6CJupORqZzTEaw83WOZby8gAuRHWmIJrL/XaxgrDon6uxshuM2VGI4IFgyGTALu6MNHWymCEDmhCmN5mIQ5/N6HwBTnjjqUUQuEpKKvq91C4vbhPknQeh0KDasDz++Ljb+cYSRpwTvcj6PeC7ZoHUcMJvrYMPIIR5cNCpnFRm2+IjSBN6A8xG7v7z/ErknqsO57BbwjN4OgL61Wp35wSiWkTU6VW3aTL/avsK+8lTFjkscLWNEnTjzkVUAu1KaPJXVqz56w4BW97Vlt21U5Lny3I5sDyborJ2Yv3dBD+EfUU02acQuRycmPSwhM/WRfiJhEUSSFfAdwmXpp0X5zW87ihnQ4s63QzfYf/J+ZCFOIZqmPysHbGv/whUpx5Bqrd3k1c9Fz7D9I+1jnie3Q9v1rLlUh/mMTgKJOHQogb2WYurzVaBjp9Hl0a7EbyopZ9vO+tWMhv3gm8NgeipM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(346002)(376002)(366004)(39860400002)(4326008)(478600001)(86362001)(38100700002)(83380400001)(2906002)(2616005)(16576012)(31686004)(31696002)(316002)(36756003)(6486002)(6916009)(5660300002)(956004)(186003)(66556008)(66476007)(8936002)(66946007)(8676002)(53546011)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qm5RTUlYNFU4WHBmaS9GSm1xQ2p2Z0FIbThLY2FtZUlKUEduNUMvYkpDcStG?=
 =?utf-8?B?SE1NVU5IM0VMYlZTQUlZcGl5bGU2VkZjZVZhRnJyb0krcXhLWEZvWGRvWkxh?=
 =?utf-8?B?WENGWnJ0anhxVDJQY3A3dkthdXVuVm1hVXkwV01sd0FpU3hEa2R5N3FHVjJq?=
 =?utf-8?B?REdkb0VvUy8xMGd5eW0wR0RkS2JsdGk2YWJUUXJyeVltYzlTVUZvNGlLY1hs?=
 =?utf-8?B?ZnVZYVNEaEpQT1pEK3B1WUw1azc1QnYyWTdoR2FwSnRXNFRBT09TTFRhWDVB?=
 =?utf-8?B?eG5HY20wN3NlUStPSDFIbm50c2F2RFZlcXY4VEwrb1VnNnp1TmdPdTVqNmE1?=
 =?utf-8?B?S2RUYzJwbjFZNzhlcFJkbDUwZFgwY1hJRytJQlRWUnVPbGhWbHQ0Vnd3YUtE?=
 =?utf-8?B?SGpmcU1YZURWdUszSDZCQ1FOU3JTSnZ0ejBDejdxblJOQVhMWHRNck11bUJn?=
 =?utf-8?B?TW5tQUhVejhXN2ptYXdPTStJdFRmNzRJN0dQRVJCWlhXTEZTa2tLQXNnV3N4?=
 =?utf-8?B?UjNqYjBTSXZkYXY3ZWpWQTYxcm9oZWtSY0hIRHU4Yk1DNFRYdkkrcGRlZVd4?=
 =?utf-8?B?QUFGU3ZQdlFWZ2pRMm1FR0FvMU04WXJraDBIQ3J6WDl4TEtqeVlNNVNQaHcw?=
 =?utf-8?B?aGs1RDU3bEtHdElSTXY5VkptQ01vYVhyb2hja2Yxa2lJYm13M2J2U0RmUDdZ?=
 =?utf-8?B?WWc3RW1FV1B6ZzdvWS9qVDljN09sczdBZ0FhVFh2aGV0ZDJxZFZjTC81aUg2?=
 =?utf-8?B?bjJ5NGR5V2taL2xGQVVxTy9heXJIUFNLR2h1WVZqempuLzZ4ZGYvTHowak1R?=
 =?utf-8?B?OXY5ODFtM2lOVExqQ21nS3FLWHkzSmE2Vm5XdnA2dmsyb1puK3pNUGFBZG0y?=
 =?utf-8?B?R3cxL3IxajF6a0dBbzByTW9vWTdnT2hhUldhTWpFZng1WlRYbnNKVGY4ZmU3?=
 =?utf-8?B?dWYwNTNBRTQwVU8zSU5EZ0RzQ3orT3dJL1NRUms2VVNEWmlNeGozRXV2Z2J0?=
 =?utf-8?B?SW9NQkM0Yk04UW5iME9seUVRbUZZOVp0aWd4TkRCUUxDVWtMNEFORUdkU2dW?=
 =?utf-8?B?VkQ0NHB5MFdDM0Jkc21ZSEJtUkhacHZ4YllMekFtWWNad1FXeDFuUlNkQjJo?=
 =?utf-8?B?VnIwVllXdk5jMXJLZU5OWHJUSm1pcEtURk82bFNFWGgzcmkxdWZWOFRkUWJn?=
 =?utf-8?B?NlpxeFRhdloxbFYxMVBLVHA5Z3MxU1pqL3dVK2NJMXlhR1cvWGsyQnRCTWR4?=
 =?utf-8?B?ZzJKeVQ0NFIxUFZTMllTdU9CTnBxZEdnMlBmSmVjbFhDYmhsRldJZDRNOXRt?=
 =?utf-8?B?a2FnVExqOU5ZRDdwWjRLUVF3M1FJM1R2S2RnQUJXWGR2UVFsdmJTd25wckVI?=
 =?utf-8?B?bS92WHFwbWtkWTVQbFJyc1hOaVVJQm0xcDdFL1hKdCttaVVyVlF5aWZqN3Jr?=
 =?utf-8?B?cWYvSldRM0FQNi9ZUDd1cm44TGlRdW9CU1IrVStIUElqWUdDR0U1SW9waVZt?=
 =?utf-8?B?Rm5lL1E4eitTb3RRL0VpVXZhdDJmSVRvU2tMN0cva3hVOEJnVk93d0gvM3Vy?=
 =?utf-8?B?OG5vaml1cmZwdXZpcDVURzU0eU9palcrSEhSdXJWQkhsMERkS0o2b1ZwVlpH?=
 =?utf-8?B?N2VnR0VLVUlvUmNvV2t5VFBsNnI3dmJCZ0YzMFkxSVZzcDZMcEdlSit1dyt3?=
 =?utf-8?B?S0pWTEgwWGJDWmUrN1JCQXg5N24vY2JEMG53bitsZTRGZmRxQzJ3NFRyZVNH?=
 =?utf-8?Q?uSJQj29/iXJaYColmHBhgtiIzv/jdP36ru+vAjs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492552e4-4474-400f-cce8-08d978508ba6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 13:55:58.6126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ki/LMNJEqlq9shejZV46H4BfvI/+/2Q7jF8CaY1BZgObbWdhsFoUfsJChYr3+Eoe0lfhb/oeN/OjqJCU139CIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

On 10.09.2021 04:52, Penny Zheng wrote:
> This commit defines a new helper mark_page_free to extract common code,
> like following the same cache/TLB coherency policy, between free_heap_pages
> and the new function free_staticmem_pages, which will be introduced later.
> 
> The PDX compression makes that conversion between the MFN and the page can
> be potentially non-trivial. As the function is internal, pass the MFN and
> the page. They are both expected to match.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/common/page_alloc.c | 89 ++++++++++++++++++++++-------------------
>  1 file changed, 48 insertions(+), 41 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 958ba0cd92..a3ee5eca9e 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1376,6 +1376,53 @@ bool scrub_free_pages(void)
>      return node_to_scrub(false) != NUMA_NO_NODE;
>  }
>  
> +static void mark_page_free(struct page_info *pg, mfn_t mfn)
> +{
> +    ASSERT(mfn_x(mfn) == mfn_x(page_to_mfn(pg)));
> +
> +    /*
> +     * Cannot assume that count_info == 0, as there are some corner cases
> +     * where it isn't the case and yet it isn't a bug:
> +     *  1. page_get_owner() is NULL
> +     *  2. page_get_owner() is a domain that was never accessible by
> +     *     its domid (e.g., failed to fully construct the domain).
> +     *  3. page was never addressable by the guest (e.g., it's an
> +     *     auto-translate-physmap guest and the page was never included
> +     *     in its pseudophysical address space).
> +     * In all the above cases there can be no guest mappings of this page.
> +     */
> +    switch ( pg->count_info & PGC_state )
> +    {
> +    case PGC_state_inuse:
> +        BUG_ON(pg->count_info & PGC_broken);
> +        pg->count_info = PGC_state_free;
> +        break;
> +
> +    case PGC_state_offlining:
> +        pg->count_info = (pg->count_info & PGC_broken) |
> +                         PGC_state_offlined;
> +        tainted = 1;

You've broken two things at the same time here: You write to the global
variable of this name now, while ...

> @@ -1392,47 +1439,7 @@ static void free_heap_pages(
>  
>      for ( i = 0; i < (1 << order); i++ )
>      {
> -        /*
> -         * Cannot assume that count_info == 0, as there are some corner cases
> -         * where it isn't the case and yet it isn't a bug:
> -         *  1. page_get_owner() is NULL
> -         *  2. page_get_owner() is a domain that was never accessible by
> -         *     its domid (e.g., failed to fully construct the domain).
> -         *  3. page was never addressable by the guest (e.g., it's an
> -         *     auto-translate-physmap guest and the page was never included
> -         *     in its pseudophysical address space).
> -         * In all the above cases there can be no guest mappings of this page.
> -         */
> -        switch ( pg[i].count_info & PGC_state )
> -        {
> -        case PGC_state_inuse:
> -            BUG_ON(pg[i].count_info & PGC_broken);
> -            pg[i].count_info = PGC_state_free;
> -            break;
> -
> -        case PGC_state_offlining:
> -            pg[i].count_info = (pg[i].count_info & PGC_broken) |
> -                               PGC_state_offlined;
> -            tainted = 1;

... the local variable here doesn't get written anymore. Which Coverity
was kind enough to point out - please reference Coverity ID 1491872 in
the fix that I hope you will be able to provide quickly. (The easiest
change would seem to be to make mark_page_free() return bool, and set
"tainted" to 1 here accordingly.)

I understand that the two variables having the same name isn't very
helpful. I certainly wouldn't mind if you renamed the local one
suitably.

Jan


