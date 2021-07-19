Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 982263CCF47
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 10:14:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158191.291324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5OPK-0001oR-1F; Mon, 19 Jul 2021 08:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158191.291324; Mon, 19 Jul 2021 08:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5OPJ-0001mn-U9; Mon, 19 Jul 2021 08:13:45 +0000
Received: by outflank-mailman (input) for mailman id 158191;
 Mon, 19 Jul 2021 08:13:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5OPI-0001mh-HA
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 08:13:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a8ba816-e869-11eb-8af0-12813bfff9fa;
 Mon, 19 Jul 2021 08:13:42 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-sAyLi2yVPs2F1FwM-fzhBg-1; Mon, 19 Jul 2021 10:13:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Mon, 19 Jul
 2021 08:13:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 08:13:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR08CA0010.eurprd08.prod.outlook.com (2603:10a6:208:d2::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 08:13:37 +0000
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
X-Inumbo-ID: 3a8ba816-e869-11eb-8af0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626682421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7wlrryVl5oMfC6OIKOxs/bZX6cHhJMtnOvHKqsGhxas=;
	b=i+TPrjOfpkW4cf16qmrXmxRv2WgtdAaJHXjRfbTfLhNWYrJX7jXMp44Pr4xvPrSkojSjyS
	L8+5PTjdMXcgafdRMO7fQBgD5ZgvyV/ADs/yw0/ACDQmA6L23oS79zu/iOMuBp4QsizH9X
	1i+2/LmR5oIeIC0t0r2FXIyepjHuE10=
X-MC-Unique: sAyLi2yVPs2F1FwM-fzhBg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jlx9H5j7n2J1hQyXllB3mtPc4whUSB2ulBPMHREtHdjAO+SY/sK/a+SA9KD9ltdFTPZ0R/rKqVgk1Juc+wsiwmdQWP4hXA77sdQX/l6TcWxYBZT4+j4XH+xrV4aNDnZTk4PpGyISIkrpZS9iUoC3WIu50L/BVds/Ag4tyWWiiHiTLwGMLXb/bNdp1zuTQ5XU8X+QlCsRm9CkTLjKcADc48EjBi9TGWEvn6qIN1R07ffjcdmBhKhvNeo58WDocakd0e+mrWgG/PcsbVGiGTRwEg4Ri+x4aklKlvKQncY4TO6d3S/GfTrJ15sutl8RIXq3I1A3YnmoNaXNNDt1L1hMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wlrryVl5oMfC6OIKOxs/bZX6cHhJMtnOvHKqsGhxas=;
 b=Ofdv5vZM/8VqscCvDZx3j0qWYhd2k0YJZGa6Z3C0d/MHbnGobn1SgFR76qenyv4Gwbvio/I+BI2hvhn74nt4ihvwhu39wWBCB6df3w15ApZimsnilWhzdjdnZqyw5PHGZYrhoGRZOl7sERAi7qsxcaFI3BH1RrAvfte5nDxnf9alCm0zKywQLteq6i+4PTdDHOci6paC3bFexXt+xulZ1BNWVfp7N097Qe7PB8FiAhdDzTE6NvLg9Bu4BchDagnmVzyGk1ZYLf698fAn3+lXIPFMKPIhC5+2mgWh+YrFgyYsXTRjAjhx3vIQ/mTGpC2weIg2K8leARB2N2gPi6kJOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH V3 04/10] xen: introduce mark_page_free
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210715051819.3073628-1-penny.zheng@arm.com>
 <20210715051819.3073628-5-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d6962e4d-4121-206a-a60c-00c9074d898f@suse.com>
Date: Mon, 19 Jul 2021 10:13:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210715051819.3073628-5-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR08CA0010.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07d72968-420e-43d1-4dac-08d94a8d1c52
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3934752462C4F1A9A17EEDCEB3E19@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D9/nSpyAGBMiJfk7dHErUnKs6Lcq29Xx+5zE1FlTjI0EbNO+cAu7drJIHHi3fVYVVzrX+BZlILW35wF02ylFEVL+n7eCewjPYUXvTvEaam8ILlRPKhkRvAOK4bhZWVOd4+5LdJ3mfqUCHF6MgYlONzoarG6JYSs6cOezTtP6TYrIyhGQvs9a3I3+4jJTQjsc+EEQ8Y6AFAbpHRt66fR6dqWRjwIAbfIPRxHeQYC+vQFuZ4553CDO1tQKy3BUnQKxrQQ+G8OlxlOe5HkEKU+94UBcTsHW5tZwtiwjPGb7cUPLfQDATvcZLRDBCb+wtMiMjFlnzgGzJZdQpkPt2mpM1fLKiVt1ZBu3Z8ndY3oSWmDDtjdAF+nSbmPC6S88hj5ktmFflTMcLTGJYFTOyYV1mNLZhfkQkck5WaJTlZ5T7Y2wVUWAfeLzobzNDdkXQuF4of/gTq9EuL2DZJFFygZfjr1OLqWqMxzv0GivqwIAqw44Xwnjri0z47UiZRVp4N/CPywyaxuWw2Wl/X0DZE6dZPWXS6ZInfi6sgQNJ4KIcKegVPEx+fnGhf72meuoQ1a9HK2ngZknwdVS2PKinFpM8IeEJAEW9OmpGO9JFBu+V8T+DHcj1TuK5SvAXGzG56EBrkIOvWCdivS9FvjD0LXZvtp3LrCT+aXlx9lYGp0HBAWEoHWVCILotNN+eQO2T6PdRSpAgoCsvENu2W5cDI+A+dMe0rVMGvMDfe0V6sOsbzw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(39860400002)(396003)(136003)(66556008)(66476007)(6916009)(2906002)(31686004)(4326008)(38100700002)(5660300002)(53546011)(16576012)(26005)(186003)(66946007)(956004)(2616005)(316002)(36756003)(8936002)(478600001)(86362001)(83380400001)(8676002)(31696002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnpZWUU5bEFvQ1VOQkJ4M0pHOTdFUlF1b2d3NDhXanpVWElxTDBXT3gyUU45?=
 =?utf-8?B?SEFwRkx1VTlpd0t3bnFoSXZWOXlrYzh2K3NjRGxuSFFBUno4aTFwMUlUYWZy?=
 =?utf-8?B?VVc1WHVmcWVxQ0tmOGhRQ3U1cjRESFhxYXkwSWVDVlNmUVZlNzIrTHROcGw5?=
 =?utf-8?B?OEpZUTRmWDJYYjhGRU44aTRHU2JJMnlyZEhSenY1VDJrS29hL2JqcC9tYnJl?=
 =?utf-8?B?K3RCWi80d0NmcmUya2JKdkN0NCtBVDJsaWJTWlNsL2tZMDJ3ZVRXa0RDVkxO?=
 =?utf-8?B?MUNEQkdVcUhMWmtGZURIdkN1b25pTURYRXlFRlJaeThjMEk0MHhUdGYyenNz?=
 =?utf-8?B?ZUZYSzgyeXRuZDQ4QndhUlNPZmI2aytuTjVtSFdrUldSRW0wMjRCZWxYMjlL?=
 =?utf-8?B?bmlaZVlKazQwRTJlRUtPZmVvK2Z0R1JtMktxYVkrSkhBb0M0cUJDOHltUlVp?=
 =?utf-8?B?eEhWYVRVM1ZMdXg3VGdmVHlydEw5NytYUzNiVzgwUjZua2Q4YzNQdDhnUWlv?=
 =?utf-8?B?Q094c0RSR0VwNkZjc2wyWHE2UHhROTMxZlI3RUJsZlkvUm1nbE1wZlZYUlov?=
 =?utf-8?B?OTkzMkNXYm1lV0xHUzVWMElDU2szams2ZjgwMGlvQmV4N1JGRFVVOTZrVFhp?=
 =?utf-8?B?TDNkTUIwTi9TWW01UXlzbkRaanNFYytwSzdOQ2EvTVNCVXpXTjVtamgzWTdp?=
 =?utf-8?B?bDVpMXNyOW53OElNanFpTU0zcXlyazhRODBCanFrSWs1TEl2ZjREQklpbWNI?=
 =?utf-8?B?bjE1bHdzc0lyOEV6dEdCL2JnT0dHME0rdHc2QlIwbHVkbFFyU3lRVUcyZ2J2?=
 =?utf-8?B?eEV2V1dRWVZsWDBhUkZOUkN0QWZ2aGtXM0M2dy9FRldUSFBUSzZtcXlRL1pk?=
 =?utf-8?B?aUZsUFJkczBoa1l4QjNnYVY5QUoybUl4ZTRpUVRuNWQ5SGxIaVpheUhGOUZh?=
 =?utf-8?B?djRsS1UwS2dUY3NsVDVkT3BpRHVMd1lGNUd6aEdPaUVwV2xyNE1JbDAxckxm?=
 =?utf-8?B?VDNTU0FPUUc0Ui9HZkdXY0dSa1BVV3llelk0WGREaWNPelBON3BldW9pQm55?=
 =?utf-8?B?eWlRQ05MNUpxSVppNmFmZGRCcnIvbDdic3BFTWNScGNwWit3UnIvMmYyRE5E?=
 =?utf-8?B?T3k0NjhuRGlFVHNwL2o4OXNxeTNFNWRvd3p0UHcxWmRlMmZUbElxWFF4a1pM?=
 =?utf-8?B?V29WMjBmamR4bXhNTTBrTjQxVWFudmJqVUhuM3JtcGdVTHczN3Z0RVcydGIy?=
 =?utf-8?B?K2Qwb1N5N1lERm9mVDBobGd3a0tzMG15czBWWU9uTk9VS3A4cjdFTmZrNVAv?=
 =?utf-8?B?RHJXTUpzQ2piRXRJNklWSVFJRXlSdXF3Njd5N1R2MkJqREhSbHoxSGVEL2ov?=
 =?utf-8?B?ZG9jUjZXWWZ6bVRoZzZLR1ZMQllEWHNoOHdzVFBNMGVFSEl3ODZFSnZwMFBz?=
 =?utf-8?B?WEFENkhCQWJEVHVYUDJuZXZ2ZWdIY29pRHV6Z1dqTG9kbXNKVVUxUTd3cWlY?=
 =?utf-8?B?c1lkKytPSFlIYldBZCtRU1F2M2VDVlVMNG1KcjJlY0JicHoxdGNxb1dndVhk?=
 =?utf-8?B?NmxVTXB6bHBiSy9BblpLbStGRmVQdjRGL3RWbWpsY2dyR1dONW1wT2IvKzQ5?=
 =?utf-8?B?b2NEcVZWVnVFbHpsYUtWRC94S3BnalEwVjNXY1JpVXZvZjdJWitoL3Nzdi96?=
 =?utf-8?B?VzFFd3B1aXdyU0JTaFV4c1JwckUyQzdzZ3VXRmI0T0s1K3JBNUwwOUJoNGhU?=
 =?utf-8?Q?7I1wwEHeLIJCTejbE6/wLSsuTyARuFXfu1br24w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d72968-420e-43d1-4dac-08d94a8d1c52
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 08:13:37.6725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQn/dR7KudD4EP2F6od9/DvhFguxBs2V4f7dSXfa8yqHJAA4DAd2IrvJFGqirnWM0Y2WOe2ix6ziQc31Bi9CMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

On 15.07.2021 07:18, Penny Zheng wrote:
> This commit defines a new helper mark_page_free to extract common code,
> like following the same cache/TLB coherency policy, between free_heap_pages
> and the new function free_staticmem_pages, which will be introduced later.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

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
> +                           PGC_state_offlined;

... indentation here not screwed up (it was correct originally).

> +        tainted = 1;
> +        break;
> +
> +    default:
> +        printk(XENLOG_ERR
> +               "pg MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
> +               mfn_x(mfn),
> +               pg->count_info, pg->v.free.order,
> +               pg->u.free.val, pg->tlbflush_timestamp);

Just as a remark: Let's hope that the lost piece of information here
(the caller's induction variable) won't cause us trouble later on.

Jan


