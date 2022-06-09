Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F4167544B75
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 14:13:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345240.570898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzH2Z-0001wW-2a; Thu, 09 Jun 2022 12:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345240.570898; Thu, 09 Jun 2022 12:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzH2Y-0001u7-Vb; Thu, 09 Jun 2022 12:13:30 +0000
Received: by outflank-mailman (input) for mailman id 345240;
 Thu, 09 Jun 2022 12:13:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzGyy-00071T-5T
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 12:09:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dce25b0-e7ed-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 14:09:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR0402MB3400.eurprd04.prod.outlook.com (2603:10a6:209:3::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 12:09:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 12:09:44 +0000
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
X-Inumbo-ID: 0dce25b0-e7ed-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBFGrSZeGtSvVB9Kkwwc1gcbx26zXq/Rt17WuaJcmBDIbwNBpU1+2Ev/5YorVBCYVM85H5np5VF3WcsxtLqShe8bE/2O7fByCfKEGpdNYLLcsiOm0ZmOKd7HiAusXDV11g7LdLfkx/oRCsNzHKziE0vCWD2KIVHrcET3R7biqoGIMxkEvg590fyTgBtlgNlaGk0JNjeIRaD2oR8RNrdo3viLSFkfg2oUoh1dLR8ZjaR7nJHIW17aktl+C1/3PtJUsnDDk+q8PdgmGRe3gajJrs6RI08oBs42MXHRklT/tK9RFMuS7fgiWSikDGKHlWDjtBj2dj4DD8ivEBfIuWA0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWd0Ppr0HmI+sfytjX9c5Kw53gfy43AairUd+Ma993Q=;
 b=iKtQFjh91SknX4ncOuNL83SZLf4uTuER5H6UbCr2W3qBAxgWs2ti4gyNm7AYk+jliUylqBYzupcuFG9PuOksEKbbm2Yk3aPc0Vjl48BW3/t55M8LdBlifGrmcQzQQqxOEFJzjcqMX5sQrnNqymiWLxnGi/a4WHc/0WgenwLbpKAkC3RZlawemhxp2kH0eO69kmIq9ogghWf3Ewr+bbzjemA3UyiJfPtki6HWbNvpgJknmHmvH2j03aOLpkj72XYl7VoD1bdj/dp2OUV8WA39HVncafX6Hk0ccLejEtpwo/BYrS3jSlYBdfwDYxz0c5NjGOCtjXXu2JwuiOuue2dKZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWd0Ppr0HmI+sfytjX9c5Kw53gfy43AairUd+Ma993Q=;
 b=P49FKdBkblcvqXncOnTfXjbduOO2p+h2ns18ef0OCMu38h8DyyHAS1JuIXamO5mOuIBQL/SQJBVYSQ3WT18mRN6A2mnWHsfVZVJ/zKSCSHysCLZYLGS9Bfwp5E+d+52shkXPAtRp2DiezmArj2eFuhyq6Ojht4OL0W4XriCZ8sHjAdFv2OiNdFjW8bq3J6w4lQHy3QLR0V3TnnZc1H/AhZZRP4n2TRebB+DY8tgoR6LyiOoecU0tvCa9bKoweaPXhvgM6FJeU+6b3zAkP71Ra1KEeuardyn/pqIRz54sfQoqllpDBE13mhhNnCd6GY1nd3tgGkQs2DD6uD6TRCwB+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23552ac7-7548-9dad-fe41-7dc581c78585@suse.com>
Date: Thu, 9 Jun 2022 14:09:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] xen/heap: Split init_heap_pages() in two
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220609083039.76667-1-julien@xen.org>
 <20220609083039.76667-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220609083039.76667-2-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0031.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e6366d9-7f99-40c6-d8af-08da4a10f0a7
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3400:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB34007EC47B59BE0FA3B95104B3A79@AM6PR0402MB3400.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B13dEGlOaHjmwwbEO7yj/dtjbpxqreAAYp6zvfjJe2Cgt7Fi3ut7TKOcxjRnBO+9tGkPTKqWHcmk89MW7LhJ/DZApuAf1piRRP9I7jx6pXCvNyYW8wfRaX7dnN5eumn2QDmQX9rHxKyZZKo+mGDDNDbmiNE7D0tU0KczReL/LgshQUjdNtI4IIuoAPoPDV6vXKakNUp8E0VBTRzESxqc2SFUi/wSZKGHFI0Ys9PwYN/dgXAFTmCZW8rru7a2TU9Kon/Q3/XSFkpKZc0IOVHTTiAtNr0SZ4nQAEklbNOkgXfS86lxwhiuDBkaWFnHtyAI4turiFDyMjkrnc62ozKmB6vo5xomJBTM7wzxAv+uFpg3372nT5I14ZYXYSQWp78VhVLE8RPHZ+pYLFdhD4DGqdlplUv5dT5PNC+NBM63Sfkh68qIMeIfqo1iGCJAWfGtZwHf6xAlY0NZS/vXZFGaPVNP/8B9E6FYDTyZRLrJK/Ez4vMs1n5wA5j/pJ1dwIPs7PuKKqevlXMskmaBGUbJ64Fb7OgYL/cR0qRE3mDfHhc6SsuxQuMJ+o6Hcth1afQihZVMXwL/1R16IiaL90ecsBzO6eLrme6k0jJFgjMb5+Hs3V8IcXXE2LNKyKh4SLbF3+Sw3LL6NKE9ESnp/y+D36w4PIjZKQc8ll8Uevq7hJW2hMT+HgzDXBWKKubmNNd3TY7QjhUe4EEpj2jjjgP6Xpl+iWVzgm6cuTtkIdoIQQE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(186003)(31686004)(2616005)(508600001)(54906003)(8936002)(38100700002)(66946007)(66556008)(66476007)(8676002)(4326008)(5660300002)(2906002)(316002)(83380400001)(6486002)(31696002)(26005)(6512007)(6506007)(86362001)(53546011)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWEwYjQwUlB2OXEwWjNaYlhyQTg4Z09mSndocHJuUTgwSzJuRFhhRUwwNUV0?=
 =?utf-8?B?amY3UUZBRlBQK1I5VTlTRmxYMFkzSFNaY2tQWk8xOFVwU0x6K3h3THpEbTZK?=
 =?utf-8?B?akY5bGd1Sy9QbTI0VXZUdWZVamxXblZUb3Z3MklNNEJVdDROOUs3VXg3WEZC?=
 =?utf-8?B?c2F4dU9QcXRXT05jcEZMRkMrUkNOMGFwbmtEU2g3U09DOHlxR1dmaEtxM2JF?=
 =?utf-8?B?N3I3K2pidERCYTh4Z1FvdzhORWJ5eGlwek1EV2w3TzBHd3lkQ0w5bGxZWDMr?=
 =?utf-8?B?SVZlVEhaWXR1VWZzdVQxeEZqK1h4Y1dybHByek9VOTUvcXhFTkhZTTNsL0Fs?=
 =?utf-8?B?VUtNczI5WHBxWDR2TEl2TnhYYWFkekxRN2VUQVF0c2VqWmcvOVZyZWw0Wmps?=
 =?utf-8?B?MjlTekE3emg4RWpOckRBOWU0NmF6KzNBVEQrMEVGRjlMYnpQSTBXWUxIdER1?=
 =?utf-8?B?cTJVc3JGSFRMV1JYZ3VXU2locXdtSVF5N1dxdkt3cXp6eEVtRXYzUzdNUkxu?=
 =?utf-8?B?VGROdnBweWlWVlNXaWF5UkxLTHd5c0pOVGRqODZZbjZBOFovWU9CQ1U4SFNp?=
 =?utf-8?B?Y1dobXU4eElQMEFlUWptTXo3anZVdTFrZllKS2M1OEtscmR3Z0s3bVYzS1VJ?=
 =?utf-8?B?SzFCdm10UEM0Vk1WbVdqaEM5L0xMVXNVSTFuQmhwSDhLUzNNS3dSbVBKM0Fk?=
 =?utf-8?B?K0NrN0RmRjJUSHBjM2xNVkRXQVhRdy9vSk05TWFnMkRWUjlHQk5zMXZOZVZi?=
 =?utf-8?B?NG9kaUxFSFV5NzVxTmsva2lsVlh3UVZZdWNCUkQ4VWdydmZrTElQNExjTlpl?=
 =?utf-8?B?NC9FOGNoMERzL1p5U3dPTjkwb2NCbFRVbUl1T0dJaDhMR3BtYWI5eS9QeS80?=
 =?utf-8?B?OFA3V2RyQjVGN1FoUGtBSlowd3FLZ2NiZ1NhMzVSdVlYOW1uSGhRUTJwQkxC?=
 =?utf-8?B?WW82ZGxINGdqNEVidHowR1diakgrVWl0U1kvSndocVFLOUZZSFZuMElMd0FC?=
 =?utf-8?B?UXlscFRDS1BuVHcvdUs0VnFpT2srZXgwMlJpdnhOTWdhYklodFlkT3dwcmFt?=
 =?utf-8?B?UjlTUjBtT0dUMUF6K2orUWhTQ3hPa1QyK2c1VDVHNUYxbnU1MWZBb3E5dGl1?=
 =?utf-8?B?UkNnR0VDeEpweGRBTWJDMGhwbzE0d3lGb2VuUXVRU3l2TFhUOEJpZ1oyei8w?=
 =?utf-8?B?U0ZpZXNacFYvU05yUUJrZjRhOXYyN3RGRXpGVlUvTGZuaG03eEJYZkV3c3Z2?=
 =?utf-8?B?YldrREw3aWlTcDVBR01FcXd4RGhCR1lzdkNhT1BCeVVUNzYwR1RKdHc3emlK?=
 =?utf-8?B?TVAxTVBsRnIzV0Q2ckVnaEMyMHAvUS9tOEZZdExFUGxsUjRYV1A2SytLcmxP?=
 =?utf-8?B?bzR1U0ltTnJMQmlVb2hKcWsreS9BdzlhTU5rKzdUVDlFQk1VdUUyaGJKbGht?=
 =?utf-8?B?S2tNRWpkT1A4dUdrUGhpZ3pDVDhoQXpJcjRGZkp2RDBaOG5GMEtQdDFCd0NF?=
 =?utf-8?B?bHJreFhKMGQxMEhWOWJTWENoRC9ZMnN0OENGbXpNbENBVEE2SStrbXBhdVps?=
 =?utf-8?B?WWxJT3h2U21IZkc5V0x5ZGFDR2M3QXR1TW4zY0YvRnRQTE5EWHRMUllyNFpF?=
 =?utf-8?B?ZnVKNGUrLyttWWhqNnFnZFpRNHE5aEFXWUxMUnNIdFFrdDhJUnZnQllXbmxM?=
 =?utf-8?B?N1JUM3FCa3dGVjUxbzZxKzFobDJMVm9UTHhvM1cwdTM1RDc1NUgrMWs1a1Y2?=
 =?utf-8?B?UXdXMDR6SU9wY0pFN1lQTmVJN3hXdTdITVZHdXc3QnVMeHVHbWpSeWRHSmRW?=
 =?utf-8?B?c0RHU1VpWXNSK1FvU3ZCV084WlZ4OWpwN0dmNEFnMkhyYzNhQk5SWkNpSGRP?=
 =?utf-8?B?aVZrMFVxbDJaOGt6ZmplWWlWeVlEZUZrUXN4ZldXcW9vbTFjV296MTBkRm9i?=
 =?utf-8?B?QS9seUpudHl5cHE0alA2WXVmbURNaUhRb2tHMGRpenkvQUsrZ01MdnNmVzVG?=
 =?utf-8?B?TjBCZGxvOUYxc2phQ2NsMDZlb3ZOVWVsODBodzMycWVGWEhXckNBUkFFcktw?=
 =?utf-8?B?MkhDVFFjdWhHT3lQb25leXNOV0FHK0xYQ3hFMFM5MlZsSWV6WTQ0VmllSnow?=
 =?utf-8?B?NGdKN3dTS0dodXZhNFUyZUVOQThsWnVsVG1DYnFNVHVQbldkTVJZRURhRWxM?=
 =?utf-8?B?SktUNUt1Yk1raVRWelc1d0VSdGNVR0tEM1NyVCtxRmYvUTdvVERXVGhpWW5v?=
 =?utf-8?B?VTA2ZUs1bC9GOWk4MWZlYWZjbk1ycnBQZ2sxQTR6dUh2YWE1ZlduNno1Nzdu?=
 =?utf-8?B?WFMrd3Q5azcxQkZDOE5CZUt5WGFER3RDM2tPTmFGeDArRjhiWm5Odz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6366d9-7f99-40c6-d8af-08da4a10f0a7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 12:09:44.5060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sC26MOG2SCPFS+dvMWC+OqngvUSICd3PIg6uNfwMEmTvXSUK57RiQS/QB4LwQIIzO5m/KXXiuTsa00KvKWreGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3400

On 09.06.2022 10:30, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, init_heap_pages() will call free_heap_pages() page
> by page. To reduce the time to initialize the heap, we will want
> to provide multiple pages at the same time.
> 
> init_heap_pages() is now split in two parts:
>     - init_heap_pages(): will break down the range in multiple set
>       of contiguous pages. For now, the criteria is the pages should
>       belong to the same NUMA node.
>     - init_contig_pages(): will initialize a set of contiguous pages.
>       For now the pages are still passed one by one to free_heap_pages().

Hmm, the common use of "contiguous" is to describe address correlation.
Therefore I'm afraid I'd like to see "contig" avoided when you mean
"same node". Perhaps init_node_pages()?

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1778,16 +1778,55 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
>  }
>  
>  /*
> - * Hand the specified arbitrary page range to the specified heap zone
> - * checking the node_id of the previous page.  If they differ and the
> - * latter is not on a MAX_ORDER boundary, then we reserve the page by
> - * not freeing it to the buddy allocator.
> + * init_contig_heap_pages() is intended to only take pages from the same
> + * NUMA node.
>   */
> +static bool is_contig_page(struct page_info *pg, unsigned int nid)
> +{
> +    return (nid == (phys_to_nid(page_to_maddr(pg))));
> +}

If such a helper is indeed needed, then I think it absolutely wants
pg to be pointer-to-const. And imo it would also help readability if
the extra pair of parentheses around the nested function calls was
omitted. Given the naming concern, though, I wonder whether this
wouldn't better be open-coded in the one place it is used. Actually
naming is quite odd here beyond what I'd said further up: "Is this
page contiguous?" Such a question requires two pages, i.e. "Are these
two pages contiguous?" What you want to know is "Is this page on the
given node?"

> +/*
> + * This function should only be called with valid pages from the same NUMA
> + * node.
> + *
> + * Callers should use is_contig_page() first to check if all the pages
> + * in a range are contiguous.
> + */
> +static void init_contig_heap_pages(struct page_info *pg, unsigned long nr_pages,

const again?

> +                                   bool need_scrub)
> +{
> +    unsigned long s, e;
> +    unsigned int nid = phys_to_nid(page_to_maddr(pg));
> +
> +    s = mfn_x(page_to_mfn(pg));
> +    e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
> +    if ( unlikely(!avail[nid]) )
> +    {
> +        bool use_tail = !(s & ((1UL << MAX_ORDER) - 1)) &&

IS_ALIGNED(s, 1UL << MAX_ORDER) to "describe" what's meant?

> +                        (find_first_set_bit(e) <= find_first_set_bit(s));
> +        unsigned long n;
> +
> +        n = init_node_heap(nid, s, nr_pages, &use_tail);
> +        BUG_ON(n > nr_pages);
> +        if ( use_tail )
> +            e -= n;
> +        else
> +            s += n;
> +    }
> +
> +    while ( s < e )
> +    {
> +        free_heap_pages(mfn_to_page(_mfn(s)), 0, need_scrub);
> +        s += 1UL;

Nit (I realize the next patch will replace this anyway): Just ++s? Or
at least a plain 1 without UL suffix?

> @@ -1812,35 +1851,24 @@ static void init_heap_pages(
>      spin_unlock(&heap_lock);
>  
>      if ( system_state < SYS_STATE_active && opt_bootscrub == BOOTSCRUB_IDLE )
> -        idle_scrub = true;
> +        need_scrub = true;
>  
> -    for ( i = 0; i < nr_pages; i++ )
> +    for ( i = 0; i < nr_pages; )
>      {
> -        unsigned int nid = phys_to_nid(page_to_maddr(pg+i));
> +        unsigned int nid = phys_to_nid(page_to_maddr(pg));
> +        unsigned long left = nr_pages - i;
> +        unsigned long contig_pages;
>  
> -        if ( unlikely(!avail[nid]) )
> +        for ( contig_pages = 1; contig_pages < left; contig_pages++ )
>          {
> -            unsigned long s = mfn_x(page_to_mfn(pg + i));
> -            unsigned long e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
> -            bool use_tail = (nid == phys_to_nid(pfn_to_paddr(e - 1))) &&
> -                            !(s & ((1UL << MAX_ORDER) - 1)) &&
> -                            (find_first_set_bit(e) <= find_first_set_bit(s));
> -            unsigned long n;
> -
> -            n = init_node_heap(nid, mfn_x(page_to_mfn(pg + i)), nr_pages - i,
> -                               &use_tail);
> -            BUG_ON(i + n > nr_pages);
> -            if ( n && !use_tail )
> -            {
> -                i += n - 1;
> -                continue;
> -            }
> -            if ( i + n == nr_pages )
> +            if ( !is_contig_page(pg + contig_pages, nid) )
>                  break;
> -            nr_pages -= n;
>          }

Isn't doing this page by page in a loop quite inefficient? Can't you
simply obtain the end of the node's range covering the first page, and
then adjust "left" accordingly? I even wonder whether the admittedly
lax original check's assumption couldn't be leveraged alternatively,
by effectively bisecting to the end address on the node of interest
(where the assumption is that nodes aren't interleaved - see Wei's
NUMA series dealing with precisely that situation).

Jan

