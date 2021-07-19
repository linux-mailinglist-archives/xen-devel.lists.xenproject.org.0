Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA613CCF6D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 10:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158210.291361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5OqI-0006T4-SF; Mon, 19 Jul 2021 08:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158210.291361; Mon, 19 Jul 2021 08:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5OqI-0006R7-OC; Mon, 19 Jul 2021 08:41:38 +0000
Received: by outflank-mailman (input) for mailman id 158210;
 Mon, 19 Jul 2021 08:41:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5OqG-0006Qz-TT
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 08:41:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fce0114-e86d-11eb-8af1-12813bfff9fa;
 Mon, 19 Jul 2021 08:41:35 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-1YW5ktqZMvCco4VXeK6vJw-1; Mon, 19 Jul 2021 10:41:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Mon, 19 Jul
 2021 08:41:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 08:41:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0002.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend
 Transport; Mon, 19 Jul 2021 08:41:31 +0000
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
X-Inumbo-ID: 1fce0114-e86d-11eb-8af1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626684094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Y275R2fWmI3oRSMRO9W7BLYHf1eDW1xwtRUm+FDLsk=;
	b=F5V7S+qLJ5Ug2jbXv+PJQuyTzx4QweQxRDmXNYbi2zUWuAfyRbJiLM5Zq0V05W8IlITf84
	oZarcMdArVPAIYoYlj3Ub3kg6kGNMm4I9Idst5fF9x5ttlR94Aez+fL4Z9qAbEMuaWROG8
	v11k1+6cbgolwPv95boXmA6g5MLD3VQ=
X-MC-Unique: 1YW5ktqZMvCco4VXeK6vJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYHlHz01rv8Ly10XfrQUB83o/Q4mybDj1ja9fKvUin+qDqMx3wFOpzeNsTaedh1xjPWD9JcDkyqXzQGtaa4y4xnRko5wd5/OyHkNSJRytXE6SZcF8HEX0zmbInhCdXmCOY4dDbMinN9WXTZSil322YFCGJ1arAIJ5XPWQpkEz97nkhD4eOeutm4Yo243gKrUEgOUBEurHHkKCfUeWbcMrLlKlZ+t4fKNJyZfjkoBotE9zMd9Ibp91vWvIrvI0U1QDJ2BQXChv1duawp48uKDGevb2JDVV+4EhnBQbqNtn1d2ptMy9Jvo6QiEjhOhimLhx6pSK766ZGOze1uM2eiyLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Y275R2fWmI3oRSMRO9W7BLYHf1eDW1xwtRUm+FDLsk=;
 b=SnYM7gUrvGb078ecQyBb1IQNCHXmKVH0xdx5iILtNmLI7fE4pmYR28R65r+2jHyLTL8sUMZP0t5mx5yskN/YXGkdYSPeZaTj/YdnVsjkjBm7HdD5RyjTWvEKcHhDR02IQZp5RB5j3UXpOpelHAKcrZMgQgpHYstZigOiTP+QGxjM6fu6IH7Um0F20TcYyUtHPNcTcuYhyUY/zi7h+dBXQtIyaZpMIs7cQlrdftvIyUtJwaH8gXjaps1kfPBQJ2BpCSXwxel92zDW9tgIIskc7/dlTkfwBGA437dm6qkLXT3OtlXluLhFw3IXV9Ia32A/hdfbydto678D/zc55u0SqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH V3 07/10] xen: re-define assign_pages and introduce
 assign_page
To: Penny Zheng <penny.zheng@arm.com>, julien@xen.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
References: <20210715051819.3073628-1-penny.zheng@arm.com>
 <20210715051819.3073628-8-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b2ece197-a9fe-71bc-2480-ea1db83acaee@suse.com>
Date: Mon, 19 Jul 2021 10:41:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210715051819.3073628-8-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0002.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4e4abba-9c6e-47e9-1449-08d94a910219
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038A17D0767ABF107939167B3E19@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ndyB+vVCFNq8f6z7aZ/2IyTY+LrI5ijZcPkKXgvS27u+I20qL03sX8Unog4onqCzyOjWhipgiDLx6WHzPftPb4k61Zm715ifHa6KxxHMWHK1gR0SQk+cjr9yuMSmBaG5eKTeb+wFXpfUM+kujBLJs5DXtiPGVjzH0BeX6strOhcEnmqspCO6EMeHZQUkQjPxACGvSy1ahbtJyz6F8Z8/YzczNxZVoBHTVA6maChKVe+hIppecI6fuj7zMmMVkBM57TYUx4eYkOHOptskDg51xvS5vPZnzKnNT3Y6IV8xdbPUsBwJKgZ2lwPoIji8kDOlPudM6Bdriflr+lgN+DLH9iWP2p/yE8I3cEzJIcpwXKB+h+IBqal+3tITWULHN088hxe2/ruSuPlfFZpCAcuEclCxfsq9J9GHHWRo26WNl8G+5DI6MU8/uOZgg1MeMRjLlZQIkfru6yCO4LGFrZE+dqDMBHQh3kIply6QTiT0ZVDvPnVR+RHLIzc/hSp/BiHHdyzjxKpuIjcfH2jFF6vXIVIT+StFMBw8pPXB7va/8dfhsyAwMNtOZhvZubZuWqctpdmDV7M647d5S1I+ZXOxegJe55nQBnmEqMWoJ5Q7dBdVVuFuYeR2nVK2DJXhh22ycLtthBO0Wc+fyRpxqTOWz9+XQzBEqm4Y9rMN8FUg89CjEDuoHjQzwH5D0ody9a4XLQ+CYMp+Ut1tuEIc/MGArtCTnDAP8B1GlekfYQgyISs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(39840400004)(396003)(366004)(2906002)(478600001)(83380400001)(8936002)(31696002)(6486002)(66946007)(66476007)(66556008)(86362001)(31686004)(4326008)(186003)(956004)(16576012)(26005)(36756003)(53546011)(38100700002)(2616005)(8676002)(316002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmZ5NXlWMmtaTkU3OTk5MVVIcGZqZ1lPeGcrWk5UeUJQM01MaUhHdHcxYVdt?=
 =?utf-8?B?bWZ3NlJoY0JUaDY5azBTbkMwc1BVYjIxMm1XR0dNdktrdHMydjBIOUtLVEUz?=
 =?utf-8?B?aDYxNUlTcVJ2MnhLZVNhYjg2UEE3cnBieGo4UnkySy9ZQjdDWjdqUVJYTnAy?=
 =?utf-8?B?TExtdFp6cWZhaFIrb1ZFR0k0ZG5KeVpxZ1poeWtNOHBxanJxVmp4V2h0NTJh?=
 =?utf-8?B?V2UyL2t1TUJNVmx6RnJhQ0oxaUJ4UUNwSE5iS0FDbzd4cnJNbVFJcWtPWExw?=
 =?utf-8?B?QkZJMlBwaVVXME83UjFsSWNHbW1YRzhFUWRJam8xZGl3NllVdDJpOVJaVUdS?=
 =?utf-8?B?Nk9RL1NTYlpUcjRJQUZzYkMrUlo0cS80eTdHRXErdVRVcUdoVjh1ZCt3ZEJ6?=
 =?utf-8?B?eTlhNkZZTy95V2NXNEcwOGNTM21BOHdmVGhPUUEzWmFJZ3kxVDdISlBvNTRy?=
 =?utf-8?B?TzNpd3JUZ0RPb0tucEZMRUl0WFgxZUI5SHVzdkN6eEFDWk9wZEx0VGM1b2ZO?=
 =?utf-8?B?Y2lMc096VWQxNTd5R3V1VW9KL1VPeTFGNEhQN2lFUi9aU2RCbVA2Z0JZTjgr?=
 =?utf-8?B?a3BlNmhZWkg3WVFzK25CZy8rRU95bUtRREhtQUZmb05NS2Yrc3d5NGZMb0NG?=
 =?utf-8?B?Z2phcDNqWGMySXZyY2p1V2dpN05jOXpZN3ZYVFRYdTdvOXJUZUZBNVdRaitH?=
 =?utf-8?B?K0VmWXRUUkREa3dsQWhrY2Zxc1NvY1JuT3BONHZjb0FlN1JkYTIweDFncUlr?=
 =?utf-8?B?WlE1SllXWHhFeFltWXpsSjRNWmpqa3o3Y0RWTUxCN2VhMzd1NUFPUFRGV1JK?=
 =?utf-8?B?V0FkRjQ3azBYZ0VkYTczWTJQbGhlT2tZZG1lVlNEQnR5KzdBY2tCYnlzZkFY?=
 =?utf-8?B?ZTIzTi9Wb0NCLytzWDB4MzU4dHZvS2xFNE5kKzFRVml1em9hMmZLOUVwVkpu?=
 =?utf-8?B?Z1Q5cUtpZUhjS3RPYXhiRmd1S3hrZ0N4QjRjK2tXT0VxRVA1eVR2eDZ4Q2hP?=
 =?utf-8?B?V3dBdGIyRGVRdE1qZDJETUVaZkJ2N0krU2ZsdlhLdkNrZmRaUGhkcjJMa1JV?=
 =?utf-8?B?L2pxY3NwMU9TYzlBY2VjWjVmbFBkbGNEeWd6L2pIbE4xQnVYbitteTBVY0No?=
 =?utf-8?B?eEkreGZhTnFCSE5HWkRFUWhRbmZXeWtGNFYyVndGRzhVM0sxWWFqQkJ5K3lu?=
 =?utf-8?B?azJvUU1qUEpxNGhIRVBBQ2dlTUE5OUdqU1pVOCt2VHJIU3lRZjNSRUY1Z0x2?=
 =?utf-8?B?UXdIMWN2dVo0UGlWTENDalNLanQwOWMzVWhQa09lSFptTk1QbTVBRU96ek4w?=
 =?utf-8?B?bWNudUpxc200MUdGbStTL1hiSTBBR2ZFU05EVno5b0d2NkYzTjNPWCtRSHV3?=
 =?utf-8?B?Q1hsNTAyQzhXcFErd3V3S0F2c0FBWmlTeFZnMG5rL3RqRmJqZEJPYWhPUTdr?=
 =?utf-8?B?bkdlNmNwVmRnRUJraWVRamRydkE5cFlnTTZSWXlMTWwzYU5sLysybzNNR1c2?=
 =?utf-8?B?MVh5Z1NSYmVlVXpUQ20yU0ZRSUxwdUZUUXBZNzluWUJ3ZlZ6cGZMcGFKZGJt?=
 =?utf-8?B?UE54NGFtVlk4Z203cytxRzFWSGZEVDJISmp6eU43NEVmYUxjeUZGNDI0aWJ0?=
 =?utf-8?B?Tzg5MVZaeHNZVmR0cXVHS25hZnhtUEpoeHprSXU1dGpKNDBWQUx5eFVTekRB?=
 =?utf-8?B?RzF2WjFRdXFEK3grNEVIMjRaNHVqQzVsV2ZORFNDajI3YnV6cW5Tb3AyaDNM?=
 =?utf-8?Q?/XEyNZh1pcd/F8lgXtd7JC2xxVa+d0vksIQ/Y2M?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e4abba-9c6e-47e9-1449-08d94a910219
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 08:41:31.6756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCs8rln0nlP8AgAJ4/pl3pZHxEBzKoRXP2usROSLXpg0CzPRJyrRWO40Xag1b0OUH2IqorvX40Tr77Xhj9CeoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 15.07.2021 07:18, Penny Zheng wrote:
> In order to deal with the trouble of count-to-order conversion when page number
> is not in a power-of-two, this commit re-define assign_pages for nr pages and
> assign_page for original page with a single order.
> 
> Backporting confusion could be helped by altering the order of assign_pages
> parameters, such that the compiler would point out that adjustments at call
> sites are needed.

Back on the initial form of this patch Julien said:

"However, I think I would prefer if we introduce a new interface (maybe 
 assign_pages_nr()) rather than change the meaning of the field. This is 
 for two reasons:
    1) We limit the risk to make mistake when backporting a patch touch 
 assign_pages().
    2) Adding (1UL << order) for pretty much all the caller is not nice."

1) is taken care of here anyway (albeit see the remark below), and of the
callers only some would really need "1UL <<" added (others could simply
convert their literal 0 to literal 1). Julien - do you still think 2) is
pretty important to avoid at the, overall, 2 places that would be left?

> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -556,7 +556,7 @@ int __init dom0_construct_pv(struct domain *d,
>          else
>          {
>              while ( count-- )
> -                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 0, 0) )
> +                if ( assign_page(d, mfn_to_page(_mfn(mfn++)), 0, 0) )

I think in all cases where order-0 pages get passed, you'd rather want
to call assign_pages() directly (if, as per above, we'll keep both
functions in the first place).

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2283,8 +2283,8 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
>  
>  int assign_pages(
>      struct domain *d,
> +    unsigned long nr,
>      struct page_info *pg,
> -    unsigned int order,
>      unsigned int memflags)
>  {

I'm afraid I consider putting "nr" ahead of "pg" unusual (considering
the rest of our code base). How about

int assign_pages(
    struct page_info *pg,
    unsigned long nr,
    struct domain *d,
    unsigned int memflags)
{

?

> @@ -2354,6 +2354,11 @@ int assign_pages(
>      return rc;
>  }
>  
> +int assign_page(struct domain *d, struct page_info *pg, unsigned int order,
> +                unsigned int memflags)
> +{
> +    return assign_pages(d, (1UL << order), pg, memflags);

May I ask that you omit the unnecessary parentheses?

Jan


