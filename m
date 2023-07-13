Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68E475264E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 17:13:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563217.880325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJxzO-0008I1-Ou; Thu, 13 Jul 2023 15:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563217.880325; Thu, 13 Jul 2023 15:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJxzO-0008GM-Lz; Thu, 13 Jul 2023 15:12:18 +0000
Received: by outflank-mailman (input) for mailman id 563217;
 Thu, 13 Jul 2023 15:12:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJxzN-0008GG-8q
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 15:12:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6225f8a-218f-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 17:12:15 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by VI1PR04MB9763.eurprd04.prod.outlook.com (2603:10a6:800:1d3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.36; Thu, 13 Jul
 2023 15:12:11 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Thu, 13 Jul 2023
 15:12:11 +0000
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
X-Inumbo-ID: a6225f8a-218f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCWJdIlf1DwTh1hvTDnce5o38nhPTLWbQxWV4oIfcdH0qL6Ka6n/RiJZT7cdcaCUv6j3BAD6vANIQoT3EBxWZv5ATCiDqkbJGNO7l0NwTBFWKZTpJiu0pvuAh4Mtx1qNJRjggCkndaST6/ADofm9EetyLeIdLtNmy5VgbbyVzy7r7DF+m3CgSXK70acuOCED7aUwDbS0aiFKAyl/P9gg5TsGbXqBFP/JElxr4CS/pmwzqReIwm5fOntUwfv6bqXfw1IEX6xFbTGyQ3qAoelrG9vR5miiBx+CTX0wXMjvp7Zf0odYcDcR9NFO+xMbtQGHiFLVxsjr4yIa/qXVrZGCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7GEpxG8plrcHkZLC6LAHA131sajozL3jMElLXf1qww=;
 b=kLwn/R085xqmNob4Y7zJKHRC6e+ZZ+M4Cn48k2EoHUCm9KlZiwdHR0ARksyh6DO57JXsKGNphMGxhDe1LbuILFlICTpNG5HguVpqeZ1ydE9YDs/t+p283uovDiJsrRJ2dQyNK73eP6VTknvsAzfDHODt4JkzPPRhAF7soFkg0zzeHDqNpyaguvb7c+ewZKFvx47rnUAECUWHOCMSX8yrfI4ntMvbOd9+Q1MA631t8Mp2KNU8NCD1rF0FJqsdc3gFGEFn0sWrkOU1tfCOoVgJfSAS/VjjP+UVKEXLLcGUkCPjcrDHoaTbN8WQxOuivexMMgtPGjh2Z+ojpoHwB4Nl1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7GEpxG8plrcHkZLC6LAHA131sajozL3jMElLXf1qww=;
 b=m5ZXFp8Pkyvq46DD93v/lbKhsezM2w2cbfDD06wHg7MhE4YN9xfQMy11HPVK8JitLhoaICYFJqJbltJRz7bYy2EyrUOn6Mpnpdz3i0VuJfG1YenYZ/SvzWtMf7HaJQfEspc9Hf1jhsloBFsCmYw97l2RMbiOr4L1YWkVvGrNTXNqMPTN3xSfELkmdkfXFud3rMdy9BboAPE0Fs5xvvqba0mw/OQCWxJUGA/yk2Q9/dFI2R1xuMCcN+NneO29BkM/1i/zL2lALH1TQ00hmZu5uYWkZiOQJhYcPniWwhE+WaMShsQ2FhAPs+RPrD+Z0Nzlmud+18sgpNgNYcqJWd6gsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <646ce8b8-7a8c-88c1-2b1e-76a721e6f164@suse.com>
Date: Thu, 13 Jul 2023 17:12:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] mm/pdx: Add comments throughout the codebase for pdx
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230707160759.12132-1-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230707160759.12132-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|VI1PR04MB9763:EE_
X-MS-Office365-Filtering-Correlation-Id: 5200a549-eb49-4576-ffe1-08db83b38869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5iFRgDEjwXhZYtkKoaQX434Mi3bkXwjuiRXI/WOSmjTyls+GqeZODZXpCMeRLFcPPuxSUeXShVmZrcxZt2dxc87XvIOlw/Nd0r7And4FMwNoNE47NZic8UglZCDzmYH3hVnAeV6SfUoraLeL75eAWlzLij88y6KNN2//EtaSBCf9rM02kr7doHZR+CNYbQkDNMgCuPo1KIAEmyjxdE9Jp4Z8XyxZPTi9rOUjYW0TLzvKiGL9mnoxxla9SZ8/gKFvFLsWwcuc+vzMTxBWiTr2BHNKdY80N9xc5RKTVUR9m/Enk6qiuslu8O0MJV8jG2cIVzSQ8kah5YwWkX9EU+si7dhIUrkX5DWrVmEGh/ZOrRp+DF34FCc9cOuhbj8gCLe7W6yqfl0zljSxk5iW7vDtsrMuuCToOaLQTLnQbmAZzgT72bWyZhWqZhF4miX4K/iy+7Bar0KbpEsZmx7H7QXOrvSkoJJp5xXqLXkaAEN08fHQqUVYyF8Sux7GORXCIq9JxLsBb/DQU1qy4AV/volajX0QFPGud9m0xvLxvoQihq8zMF6WEFOfH0VyrRVOza9SJ0kBLIzaqFm/IuyMMdnzvW2QSEg9PtHm+OwP+t+rwIkLbiq73+KSCGC35kJUs7+x1LAPn+OBGYr4q05Oo+okkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199021)(31696002)(36756003)(86362001)(38100700002)(478600001)(2906002)(6486002)(6506007)(53546011)(6512007)(26005)(8676002)(8936002)(316002)(41300700001)(66556008)(66476007)(66946007)(5660300002)(6916009)(54906003)(31686004)(4326008)(66899021)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U21UdGdsMExJRGVmOGZKYWo5cmc0aHY3b1ZFeE5xeW4xYnI2dmx1WlhGS05B?=
 =?utf-8?B?VkNIb2I1L1R1dUpnYVZPTmRLRStIWkRQeFZxT1lSNjJUMGJwN1c0eWRmWmxu?=
 =?utf-8?B?RWxJNFJ4VTJEZk1rM2tzWTd1YzZnREJIMjRNTWZDdEFYWVBjaUN6bGVJbDB6?=
 =?utf-8?B?UEFyNkNJYkUxMTVPU3NUeFFNWE9BMkNyV3lFMFpyWUlGbFNWdVZOUmFRWUN2?=
 =?utf-8?B?N2RSM1NsMElFMEprVUVKZjhHT3VzMnBiMWNyU2NuSkFlWDV1VUhWUVFNL2tQ?=
 =?utf-8?B?di80MENrNmx0UUZNUkdKaGxTMWZMcE1makJWejc0dU03RHB4WjdORlNUcTAy?=
 =?utf-8?B?TFNWakREVkhId1Y3TFVYbFNNSk1MSmFHRXRaRmI5SFlONmVETHpZWkY0WFpz?=
 =?utf-8?B?RkthT050MGd5OHM1K1FYdjNnaFEyMEJ5NllZbERla0ErOXV4WUVsK00vdjI2?=
 =?utf-8?B?VWhIcWNVQjhFNWhwN05CdVdPWFVhQzdtUG56eEVodEFYVG5oS2JCZ3JnQ0Fj?=
 =?utf-8?B?eXkvcTlMZW9TQU1wTTRsK1JWNlo0Nm4zZ05MVVlBUWRZZ28zbWtrSHVXclY4?=
 =?utf-8?B?VDdVOXBuS2xvMmhIMSsza1JKaVQ2UzlvL0dxNko3U0dzdGNpRW81NzMxcC84?=
 =?utf-8?B?OG45Mi9PaklVOWNLM0EzMWV5cTI4b1FKVDV5VXM3S2RHNm1MRDM0dGJobWFz?=
 =?utf-8?B?a2tHNHBPUWZ4QUpXSXZ1MWVTMW5QODd0SnNwSEpERmZGN2xNckR1MDVud080?=
 =?utf-8?B?QXZDa2l4c1lDRjgxU0VySWhLWVBHdzdiSG9JRXJoVktpY3ZqemI4cWM4TXNx?=
 =?utf-8?B?YTFtMHdFUFlEaWhrZHlvdTFVaXkzQlg4bFFEMDE2NXB3b3BjeXFKZDRFS3JV?=
 =?utf-8?B?WHk4T2NDTUs3dzFQbGtvNVNzK200aXp2SzVtcFVMZHJSQjRkTG1qL2tJYWJT?=
 =?utf-8?B?cU90MTdNY1BFcmh0cmErN0YvUEYzbmVRcFdTSWU4RlppUU5sY2VSKzlyZWY3?=
 =?utf-8?B?SDc0NTlMRGtzWFU4MXpLTW4rZTlkNUFuWUdoZzVBQ2hJTUtFZmhNTzZhZFlD?=
 =?utf-8?B?bkpZU0wvbXpmZUxxSk9MUThjVEl6VXBtQUZid0ZpeHV3dTFybUN0aC9UTzdy?=
 =?utf-8?B?TDBhd1B4TzlXVmhZbjQvSDNtdkJLUTg1dE96OHpSeVgxVXN0dTBkLzFqcXBl?=
 =?utf-8?B?SXVTcUVSSERpMTZwN1dVQ3Fzd1pKRmlwcmh2UHdzZnRQdGEyZU9BU1ZFcEdM?=
 =?utf-8?B?TTltM1h4YkNFY3hiRkowcHMvOXpwUVdoNzc3Z0NRWCs1eGF2OHg0cFpiTUFS?=
 =?utf-8?B?T3REZ0h2SkJQSlVBM3d6UlpQWnRrbVRxaS80NTNQemVxWW5uNHgySmxmWTNO?=
 =?utf-8?B?SXBiVFVUK3ZzN1BlaFpzZjZaVlZKR3lYUG1UNzNGejdVVWJ1TDd3aUU0UXpU?=
 =?utf-8?B?eS9rYVFySXpKUk05MzNQWWxObXhyUHZUU1c0K0ZuSFBjeEdJeXlrTHFnL3Jw?=
 =?utf-8?B?NzBEWTBvWkxobUZpdE9OTkh4dk9zSG5GZkU2UG16bmJseTM2N1ZJRFAvaHVR?=
 =?utf-8?B?bWFiU2ZNMHMrOUJnVnNmOW0wMUpmT3h5MEE5MVIwN1U5NnFlYUs1d2tVMzNS?=
 =?utf-8?B?WXd6U0tpUE82YWRobEh4RVRvcDZOOHBwVWplSDIrOWJ5eVRBdHY4NWtEUlpu?=
 =?utf-8?B?Zi8vd1Vhd29DTjJCRkxaNUJSRDgxMW9DOXFCWnVEa0JmM0xJVjZlaHlJNzg5?=
 =?utf-8?B?NzVGY09OWnVxWGpRWXRLVGQyakpjSkczYVVZZzI5T1J1TEVJbU5rY2w3b3hQ?=
 =?utf-8?B?aC9ER3E5OXZwWkQzSWxRVHl1MUQwUGp4ZEcxekErMUFBZ2ZrUytKMVJraTJ4?=
 =?utf-8?B?eTlQUjV5ZzFNczY1NjZhZ2pkSmtkSlBnK2pYRThwLzhMTE44OWdiaXJWUVZR?=
 =?utf-8?B?bktCbFpDb2RsU2RyRzVnaytqbkRJRHJmY1NkQzlxU2lPSmdzMXZPSjJHWjls?=
 =?utf-8?B?cWRrTU80bFJiL3hvQWkrdFBhd2pGZGtQcFZzWStGNHRMTW5YZU91ZUc5bVk3?=
 =?utf-8?B?UThKeUR3SmtkTmplbXd6WExUVnh0cExuRmh1MDJuMTNwUEw5RUo5SFFoV3RH?=
 =?utf-8?Q?GfXPu8dght3UJ43Z7IYWMI3fu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5200a549-eb49-4576-ffe1-08db83b38869
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 15:12:11.5135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69227qSZBWUbKxDh/LdgMjISD5aQDIOKgzBqTmq91cnb5iUEv/CmjItD7OQv27tMvkpsZ9XrhjYjz7dlfnW3VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9763

On 07.07.2023 18:07, Alejandro Vallejo wrote:
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -31,6 +31,17 @@
>   *   (i.e. all devices assigned to) a guest share a single DMA address space
>   *   and, by default, Xen will ensure dfn == pfn.
>   *
> + * pdx: Page InDeX
> + *   Indices into the frame table holding the per-page's book-keeping
> + *   metadata. A compression scheme may be used, so there's a possibly non
> + *   identity mapping between valid(mfn) <-> valid(pdx). See the comments
> + *   in pdx.c for an in-depth explanation of that mapping. This also has a
> + *   knock-on effect on the directmap, as "compressed" pfns have no
> + *   corresponding mapped frames.

Didn't you mean to keep the directmap part optional, which would call for
saying "may" here (twice)? Yet then ...

> --- a/xen/include/xen/pdx.h
> +++ b/xen/include/xen/pdx.h
> @@ -1,6 +1,73 @@
>  #ifndef __XEN_PDX_H__
>  #define __XEN_PDX_H__
>  
> +/*
> + * PDX (Page inDeX)
> + *
> + * This file deals with optimisations pertaining to frame table and
> + * directmap indexing, A pdx is an index into the frame table, which
> + * typically also means an index into the directmap[1]. However, having an
> + * identity relationship between mfn and pdx could waste copious amounts of
> + * memory in empty frame table entries and page tables. There are some
> + * techniques to bring memory wastage down.
> + *
> + * [1] Some ports apply further modifications to a pdx before indexing the
> + *     directmap. This doesn't change the fact that the same compression
> + *     present in the frame table is also present in the directmap
> + *     whenever said map is present.

.. you mention it here as non-optional as well. Didn't you tell me that
Arm doesn't use compressed indexes into the directmap?

Jan

