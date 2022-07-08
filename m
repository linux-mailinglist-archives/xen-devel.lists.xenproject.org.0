Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0564D56BA1B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 14:54:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363403.593901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9nUO-000063-UI; Fri, 08 Jul 2022 12:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363403.593901; Fri, 08 Jul 2022 12:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9nUO-0008V9-QN; Fri, 08 Jul 2022 12:53:44 +0000
Received: by outflank-mailman (input) for mailman id 363403;
 Fri, 08 Jul 2022 12:53:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rYmb=XN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9nUO-0008V3-0r
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 12:53:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff06d395-febc-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 14:53:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5318.eurprd04.prod.outlook.com (2603:10a6:20b:7::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 12:53:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 12:53:41 +0000
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
X-Inumbo-ID: ff06d395-febc-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqLs1/tthdRETem1FhFPtcHO9pyhdWB2t+tVoqsWFCTLjDtn8ZH7XE92hQJoEx+bBRgKnjEg7V/dDgZq1a7OVhCQ7nHCIZmiXCMD+K6NdL1dfIl0ZXs8fc+lMd5t/zO/wApaepyOKzDyJAu0vy25Xe6c698IIukg8WXupE+/IFZr5YEReItbPDMcqDDFXyzZq1P8UgRekzRVBnE0QnhHC8oeLG33aTaNtITjaMCM8/da4EXImcTDLJxR0ZBgVIElL2cWLssoxWIuzSMmY3TCeGhbT/2vInKM4Lv+hYU48tQLwryxM0jTTLyWwDZsLmNilYg8r0niG8zdNTGWapIcZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2rZCp2R3TP1sJYg+Uu2b6y/aHhd5RupaI5lUf4TZ20=;
 b=ZSR/lfVzpN3rJPbxzx6D0ndzqdnFPUNsCNKqmyLZU0fWxfTccV+WD2yIr+4Fj5u8B09vOBWPr6hCpfow2qgrfJ1unKWKnf8J6NxV124WLH4yD7UUHGU+9aZMTX/PMhVOz5mhQxx/7Dsw6+rtUIcu6KLbchHPr+yxY1xqxrPCN8EZRxa2XPUMUWAe30giaxr7HFvEfUYkQMYI4eAL0XebPFUUIufNxbsHOzUupTc+KB0jFP6Ho8lvC7T6gcBAAODiBmEC23s/CMcSHq5fzdF5qpvi4A/FwwkVZHCw5la/ZfcdYJ/v4PUQj7xGcT7Ku3t4Q2rG7au/geoNXGUJYtZnNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2rZCp2R3TP1sJYg+Uu2b6y/aHhd5RupaI5lUf4TZ20=;
 b=1n0FfFFR34XJVeNuU+fgXEkpx3M/xAooxeFq4eFoXHnp2zBmrfsb0lxw4Sgvhz9D9425rZNX5djmrcXb5073dlT+Q7rDxcIrL2pLuzUFbv0wqcWZcIIrrDnEx+OvR1ZBkgF1yEXRcRO4Y8jlH5tbRqjAFW3gJzeJg7m0d+5v7NjxwYnC7LxPqv2NUUeUICOVtNV2VX/o2DGTNwpnjl2zwc9Xjo+ADNchjWA/un7yE78bt3T5L7uPcIPgvPrkbQRAunjsCUjln0Ta8I+4x5C+HtIc89EMAjQe0s4NzAmlSj7rLgNIRgHdYHl0PKS6qaF93ra/G+3YxLRvGBbLlkPE/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8be06889-1dd4-cc79-f2a3-0cd09cb1b735@suse.com>
Date: Fri, 8 Jul 2022 14:53:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 7/9] xen/arm: unpopulate memory when domain is static
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220707092244.485936-1-Penny.Zheng@arm.com>
 <20220707092244.485936-8-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220707092244.485936-8-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81760f55-3d7c-46b1-8ed5-08da60e0e223
X-MS-TrafficTypeDiagnostic: AM6PR04MB5318:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	18V5GkUO8IuwaGhFOzs1eMPChyYja4fSbdedk7ccHygsoOmGfqVn23pAEKoYxgZGJHcGUcr5L4PbdVXI0YUQrYVJdzvzRrNsrQ3jyr6jQSkGRHMrpr/1dlbDpCdQvvFCmNx5FzPuuvnyCHLIDQ/6QmyO8coEUrbgkyKzDXjwFcfVZ7EHlMn6MYcr2Pz9QzVGNoGoP6kgOWNZU/ZQztKpzGR2AeuWYo2D6Zh2F7R1U00lD9Tkn0SMs1Qw3qiTSxHnGUdheXxp4KbkJytWc+61ZN3t9XqIz7iDhTSoZmT7SMj4isxc15DGsVxZEdRkl/heY/6OOlfq6z8IfyIPX1zU7JghZ0SOQzbpQ0UQqhMQZM2ylSHKdJXjyNaspFViIfFzT4fHDHn0NJEsbp8p9Uh2jCJ3qWygbbez+wZRCIWmYcNhAohABRubRvtEVp1TAmqJS8yVujztM6K50KDyzJo6WYfCkdsPEyvkbqiEjA23+OkhNYoWLsIdB4WeJ1+EPvejepAXvP8M7skcdVJwIm3ogoxE3Mm/JI+DWOqXMJTEFPeenhLvnUpW7WDbq1mi4jiFz7m6+8F1+PBq3gNgxny5YjRWeCXMD6byQDwrc3ng3u28gEOjif1an/9MJszAUNWQy0dmVd3/zdkNNar31kE9dN97PYcrWZ7OmXCVJ8ez/XRp8MRgeL7N9Xe0y/jZMvQ+odJfi3fgh6y0LCycwclO4ygaixKYEGNpAB6k0tO6KcFU5eP9qc3KFU/rDqExGJJIrMr0qz/Ai9Ap7+/oc8PCdeUakeekLmi2Du7O4JFLSyoDY79lS0CcR7RsdhU5sMfQNB9nIMIadJZH2l2pwMrWzV04TSb3BB9cjKFS3PLbXPs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(366004)(376002)(396003)(39860400002)(8936002)(5660300002)(2906002)(54906003)(6916009)(478600001)(8676002)(316002)(41300700001)(6506007)(26005)(66946007)(31686004)(4326008)(6486002)(6512007)(53546011)(186003)(36756003)(2616005)(66556008)(66476007)(86362001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVFqYXRvUHRIUWRHeFYwRm16ZzI4UFVwYmtkaWxSamdrYzdaaFdFMkZ6aDUz?=
 =?utf-8?B?eU5iNzhJM3RPeGdvL3BmSUNVaFZDb2pmQjRzcnNyYlNyUThTL0lYT0VDUjNI?=
 =?utf-8?B?RVdTNFlnanp5R2E0RmlvaEpoc3gvWDUxK0g5QitiaWlNd0VFaUl4RTZzVm8y?=
 =?utf-8?B?WkZBeGEvbUZ1R2JDQkM0SnpzUDNRbVpYb3h6KzZpeWRDRkZxYzRoWUt2ZDNh?=
 =?utf-8?B?SktncldzSVdFQ2wxcVRKNzkxbXZyU1gva2I2dnlSN2wrRGd3b2g0cU9UbHF5?=
 =?utf-8?B?TkVJSGJLYXF6aHNXMVBkWmZuUEZZanIxbkVoOVZYdVFJNGZPTVM5WW9yUk1I?=
 =?utf-8?B?U0xnSGtoVmJsVHBobjNrWlNPc1lSVHcreDdIU0RPUmNoRnhKS2lPY0tnSlIx?=
 =?utf-8?B?QVc1WEtJU3NtWEFVZnBaVVpJdGtkc0p5bE9Uc2FUTTQ1cy94eHpMS1EvaC9Q?=
 =?utf-8?B?OFhyNmxvdWtNUDRXOTlYQ1lYWmd6LzJIYXFTRzU3bWVIb3p3UlowSUhwMWZF?=
 =?utf-8?B?aEViY1JoUWM5elJKRUVBalB5cnNtOWxaSVJwdjl1OFFEK1IwMitRSWFWZmJ1?=
 =?utf-8?B?MUJYOEF6QjdUUUtIMEErWlM3L082cU1IdW11Qk5oSUovSzNUYjVmVW9UMkU2?=
 =?utf-8?B?RHl5WUFuZVV0c0tFcWg4WEM5eWVVYjVia0lXSUdKNVFMK0FCNDBsM0xWS0t5?=
 =?utf-8?B?QUo4ZUc1Znl4UitDRXRtTE5tM1N5TDBXbjM5UlRsd3o1Q0QxQXRONGFhejB6?=
 =?utf-8?B?VEJ6S0NXODdEdElqS2kwYVl0ck9VazcwNWJzUzRvc2l3RDRqa0RhZ2tTbjNR?=
 =?utf-8?B?cVd2N0pNaTUza0ZNdldnN3NUaGdvNTc0UmdxcGtpeWhmMmdnNHp1eGQ0T1ZS?=
 =?utf-8?B?dDc4dHNSU01aOVEwUVpIbk93RFRYaG9qQzhZL3E0UlZ3QzNaMGxQUFI4a0Y4?=
 =?utf-8?B?ZGNFek1EeVlTU3VVT2JBZFRmU3BueWhVSGhBSmRtbmVqbjdjRVYrOWZ6c3Jq?=
 =?utf-8?B?QVV2cGFjMUNSMFB1QUFMYm1NbzlpczhsYXVTTFFDeC9FRlF5R0ZUakRLbWtP?=
 =?utf-8?B?NzFlcW8yM2V6cENFYnJxakt0aSt3NmNNRGljL0NVcnYwSWt6M2dpQ1A2Z01z?=
 =?utf-8?B?NHp6U2ZZT2J6bkd4SFdUbVEwYzlWb09BaEx4alF4TUUwVy9ObzFHQzY3RjFU?=
 =?utf-8?B?V0h6aUw1WEVhYldOcUM2WVY5cUd5WGVGdUJjQnhTTjBaKzB4NitrMXZpTHlH?=
 =?utf-8?B?MlR1Q0ZxczR2SUs2YUxOdy96Ry9vNWxFOXd0SGNobHJRcGcrTVR6YUdoYmxy?=
 =?utf-8?B?LzRrNUZ6OWlyUzludTJFR09uZnJPb3V4VEw5QmFOS2hRQkx0cVNTd2Q2d2ZQ?=
 =?utf-8?B?VWFzMUtoQ1l5aTdxcmozY3NZcmtkeVFKaUZESDFtQVFlQ2pTcmZrQW5jTEJt?=
 =?utf-8?B?dWJZbnNhNVA0VisyalgvamVycnp5RkJZSEt3MWN0bk5LcEsweHZZcXY3VDJu?=
 =?utf-8?B?NGswYkRrTlVaRHRadXEvUEJpU1ozVkVSa3FxZ3R5dGpIOW84M0JSSFd2ZDJP?=
 =?utf-8?B?aXM3ZkFGVWEwUlNUTmJoQVJ4Tk9JMEx5L0JMc3E4bjdTaGJVR1lZazBjZFcv?=
 =?utf-8?B?d2Ivekk4T2duRTA5RkRQR2FYK0Z3SkZRdkc5czN0VDdVRHFiMjBkRjJtMlBQ?=
 =?utf-8?B?WXJFNm81MVNnK3FPT3hlWWt4c2VHdmhlYVdvOXI4R3pseW1uZU9XTkFLNlA5?=
 =?utf-8?B?TFN1Z08wQWduWTBXUENkdGpvOHlxZ0NkRmpIaG9tanduYytpWTRRdGJGcHpY?=
 =?utf-8?B?V2MvN3plTzV6V3FXelE5UFN4d3d6NHVWcEFYLzBMdzRTUzhuVFJBUWRUcnJS?=
 =?utf-8?B?eGxEaE1Fb0I4b3Z4dzJkeTVzNENPcHpWcC93WU9ZT01MMEdMMGZCRXRMd1ZI?=
 =?utf-8?B?NDdZeXRDTitJVDVGSi9TUE4zQnpmV3BMYU9sbkt6UGt0TEZtYkx3UTFlbXdZ?=
 =?utf-8?B?b0pFU3hkTk54SCsxYXJ6QzgvalI1RmUyRmVBZDBXNGhPWWxIejNjcG81S2or?=
 =?utf-8?B?NjMzeGhGVG5RME1GZERyNHNjbTR1QnV3dHpBRCtpQnlpZnBiTHZnOHErVWpV?=
 =?utf-8?Q?k8MNy7gVwe5Z0EEX3S2yTpFwj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81760f55-3d7c-46b1-8ed5-08da60e0e223
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 12:53:41.5049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTgFwwspxxsJOmqmzERqPnzqYHxNji3wunqjrDrObbgkea8jRLyb649lSJxq1waB30yh8TxzN2TD9Xa8DdDjOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5318

On 07.07.2022 11:22, Penny Zheng wrote:
> @@ -2692,6 +2690,14 @@ void free_domstatic_page(struct page_info *page)
>  
>      free_staticmem_pages(page, 1, need_scrub);
>  
> +    if ( likely(d) )
> +    {
> +        /* Add page on the resv_page_list *after* it has been freed. */
> +        if ( !drop_dom_ref )
> +            put_static_page(d, page);

I'm not happy about this name - it suggests similarity with put_page(),
but is entirely different. But: Do we really need an helper macro here
in the first place? This is static-mem specific code and hence ...

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -91,6 +91,12 @@ void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>  void free_domstatic_page(struct page_info *page);
>  int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
>                              unsigned int memflags);
> +#ifdef CONFIG_STATIC_MEMORY
> +#define put_static_page(d, page) \
> +    page_list_add_tail((page), &(d)->resv_page_list)

... this can live right at the use site since ...

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -381,6 +381,9 @@ struct domain
>      struct page_list_head page_list;  /* linked list */
>      struct page_list_head extra_page_list; /* linked list (size extra_pages) */
>      struct page_list_head xenpage_list; /* linked list (size xenheap_pages) */
> +#ifdef CONFIG_STATIC_MEMORY
> +    struct page_list_head resv_page_list; /* linked list */
> +#endif

... this field is consistently available (i.e. it's all the same config
option that controls things).

Otherwise a nit on the macro: While the parentheses around d are needed,
the ones around page are not.

Jan

