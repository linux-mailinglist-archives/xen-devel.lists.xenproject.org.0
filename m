Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D27679F30
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 17:51:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483648.749929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKMVK-0000m1-8D; Tue, 24 Jan 2023 16:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483648.749929; Tue, 24 Jan 2023 16:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKMVK-0000jI-5A; Tue, 24 Jan 2023 16:50:38 +0000
Received: by outflank-mailman (input) for mailman id 483648;
 Tue, 24 Jan 2023 16:50:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKMVJ-0000jC-9K
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 16:50:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38e8d463-9c07-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 17:50:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8318.eurprd04.prod.outlook.com (2603:10a6:102:1c0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 16:50:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 16:50:34 +0000
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
X-Inumbo-ID: 38e8d463-9c07-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0b8LG/XPKh9qDfmONdxeiEIazWoA5Iypz4/1tiN0ChxSAIOwO9siaq9sqcQ+y/ESLN6Hi3LUoiCt6MIjteMU1BTOgpSizJLZJ3qP21eu6J3xfmyX3/2T/I/OOdxLLUSGmr29TnAAwfN2X15LKpNPLaxgJrny2s9KUUlGyWfK9gmMeUGxha3ORsPrjXSkWbzcdtvxVL4sH8FVVX6nwXKlKlkk8lpLhFj9YxkL+QF1AHJ9vFF266n7ubeDbmZJJtF/GwcGumIMmwVt40Gy0y/ml8EeORioBGtPQx5Ts2ABvXflAf+ciBcJB5nFkKqKh9WLDnJWkigV9r7FOovtgkwwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1SDZM9HfMDUigcz3g1sserzlTschR/KNnXVvv9LD/U=;
 b=X0ZDOs/bjPWHLNVchvU2wrEGkCZHrU57vlkLzvPA2bZiQ59pIiGXsEnzcXDZaleOsAYKFdNe4FwVzETkfCe1QLrOEnWOJY/bB2Wdwxo+nPoYWK8ha5YSGEzADqjVYa6j+f4er/CVj+Xhd4tUPJms3knEXxhB31LL2HNVdkSDipROW1ZmcNouo2KFahRHuKO6uGqCkGrcwFTxrgCoFWaTa36UvkyqV59uOXwxc5vNf/lj1mZLCnNMytJdMyM7UmOXimhfNd4TxShaTlK0Pw0fmKWJw9HbxD7CM9+kIwLqh9jKEHiVp8zBlYy23YJGBn5dUcSS8i5LF+WL9PUbDvJgWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1SDZM9HfMDUigcz3g1sserzlTschR/KNnXVvv9LD/U=;
 b=Tz0RpLbbCUHhybWnYfSRp9Jrfs9+VA0eBNbz7k/Veuf80vH9EcIJ/NAVviBg+mehk08goNfsXUN4iwvo3LWrM2zv0JAuh/Jp6Z8kQpfvFmX4XuZYrCwUGdRTEJOL8qk01sMy0cz0teqK1BJZFncRKPqt/360OWcdRZcUPvJnya4XYGDMGquozbXTCJl6pXQS0S90T7wd4DILg6Mc/0Eqqqgb6FeYg6j+YWgt/qfuP0WrLICpWsAeMI/X1tFDWgu1pEfdi3ADRTaeOZyBtj4pSryUw8JMN2OGavQ94M0EuIlPUcjwJv+G7EfMpOCClnjBa5DGy/FI3CAVeBZI5ImbCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a74381ce-d204-1f40-7ccc-2be3bbc3ebd1@suse.com>
Date: Tue, 24 Jan 2023 17:50:31 +0100
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
X-ClientProxiedBy: FR3P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: de8dd231-9134-4871-7d30-08dafe2b1c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Co7+iHAHWusnADd/W5wNICs5YmP+/oxlNxK1AhfXEeZGqOO/m6V1SX3j3hHma/krLpyGss8yZDD1L6+KGQyqUtBGg0C+WwNCya9QxO4QLfd+Gf/qGbhyulKL9iy4ZTCd0XVFbQ3yrqP4gPTpj1xegBaVteQTROFkVVzQ6tVQaAlkLEJ5pYYuSWx5pyvlbOsVkGGv0JuznGuiuC+Iy6cAsuX1JTPaHm4cobvGnrKObG8hjgXOOBpWmALDHmbz13Yq4IYORU8/WINlkf5UJT/YK+ffFVLjPlUOFX/0Np50gAxXK0hTEZCQWp4ZHp3BkMTyGp6akwlCELtDFtaLj+uQeo50+FxJHkKeH8aylShvvbiYUWFvOO61HKEdIhIgdyLwpIFJE11AEpf9PxWBvVZbwv4sqM9IUzkyzSRF+LE5J3cBVnu0wHWWPi9geOuHwzZ0Qn+CqXKtjvilPBv9ipErcC/wN3xWCsdTyM4nWsF+Gi0aIw7nj3qmciyiMbmpFgw4FXkMAJ0TT90i8kIeNvmZYvcJxA9MQxbcVqEY3RrnZJRYC8Tyv2KDXUC2RpH6MEcN/FNjA6jVpLAXcuLqC70aM7M6lD/J5EKFb69gbtUNhGcK+0uO0ieUYpk3TGgTBgW780Ut9Wp/WfRfi+aOVQtjCwUgVxNOtJYHjSF58yXypAkd1FNGmJ56t0QXy9gTpuRweonrNU+7Qhg8TmKPgMrMvy/pZEPVGPjUMoy0btJU94s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199015)(38100700002)(36756003)(31696002)(86362001)(478600001)(316002)(66556008)(8676002)(6916009)(4326008)(66476007)(6486002)(2616005)(54906003)(31686004)(2906002)(6506007)(53546011)(83380400001)(66946007)(6666004)(6512007)(5660300002)(41300700001)(26005)(186003)(7416002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWNDVkI4ZGZGZXRXbFNCMkJIK0RUNk41YmZXUjhQNDcya3kyUU83Rklsakw2?=
 =?utf-8?B?NmpXcGZpeUFKY2EzMmU4bStoV3J4NlFjTFdMMGIyZm9YOUxOWWJ6NkRNcFJS?=
 =?utf-8?B?V1pMckwxdTVDRWhjVk00dVpCbWdGR0wvdWZZTExUZW5wNnNPQ0FxTCtFUGdK?=
 =?utf-8?B?ZC9CWDRxUE5DczZEMGdOWlZUbTN6emxNaXpiTjQ2Qjg1dDRGdkJYSVhmaW1G?=
 =?utf-8?B?OE5tVThQald6cWYxVXVxcVFLNHlmNis3SmxCU2lmSEt6YnVEZDRjSnhjVENM?=
 =?utf-8?B?U1FTZ3dhRHVHWUtHenJxZy9jK0FER2s3VzFwTzVhQ0M3M2dlQk4xMS9SbXdI?=
 =?utf-8?B?REdIV2lSWDgxUURLOUdjQ2dQZTJrYkRNTU1nS0FDRVNCd29IVDZWbittME5w?=
 =?utf-8?B?eGw4VHZKTU50OU5raTZadFhxTGxkTE8yNlpwcWYvNjJzUWZNdnRYZlVMUklp?=
 =?utf-8?B?Zkhqdm1MN0dRVXBsdHpmQjNMRVRpR25UWWc5RUVlV3pPQUFwRmsrUkFySkUz?=
 =?utf-8?B?cXpISHZXR3FaTVJqa2hiTE5oaG9lUGRSOEtva2NZNEMzWkdQRlZITGNTbjhh?=
 =?utf-8?B?NW5NcWpUR0xVckZETllyV1hDbkt5Nms5NFg1WVI3M1YxRTdNbU1sNnBER0Jy?=
 =?utf-8?B?cEM0bEtka3RJR0wwcW1jbGFyZmtzeTU0bCtLTUw0MnpWNkFsT1lGbzhOVXJa?=
 =?utf-8?B?cW95cG9zdFRuc2hTU2tZQThzZGg3VlB4dlRQakRkSmxDZW5odXYxNllmVkph?=
 =?utf-8?B?NllpM0JnVGFDVnV6TjdpYVFLa3BscWplN2o1M05ib1lVc3MwV3ZyWnEvU1Nw?=
 =?utf-8?B?VEFBK2Z0R1FyV3VrTG1hTnB3ekdtSmVmTDhmMENGd0x1Q1g0N2R3RHptVGtr?=
 =?utf-8?B?M3RlZi9UcWdFSjMzTTJvZkpOVFhOTjFzTmk0Nm56dTNOSU1qbEREOU1HcEJ1?=
 =?utf-8?B?d3hYVTRVaStCOFNXeTRsSmpFdk11akZxR3ZxeUdDQ1JGYjQ2N2lQd01iWkR2?=
 =?utf-8?B?Y0pib2RTMEJyZEFzOFdXQUpJdE9ZVCtUbVEzenRzb1ZDbkVhZDhENUVoNW14?=
 =?utf-8?B?N2tCYm9USVhtTTI1ckZtTTRUQzJBaXkvMXQ4REVjalFydXFRV2hyQzU3TlRt?=
 =?utf-8?B?K0ZNU1hKRWhUVG9WZUtlSEh5aHhDcUxwTlRKQmVxdEpQY1RGejFOZVMyQW11?=
 =?utf-8?B?ZXY0UXNwS0d4OUk0MGpLS1JnN1NYcjNhOTFJVUVrZWtqcUloQmF5SjluZ1VK?=
 =?utf-8?B?RmMvR0hKZ25FSHJuMlBvVTVKbUl3K2V3c0s3UWFjNEZPSlprNm9jb3F1TFFy?=
 =?utf-8?B?TjZlTnZzVXBkYjNVbzI4NEZxcmltKzdHbGo4bXRjdUdtdis0YksxVTlVM0FB?=
 =?utf-8?B?V1NhMWdINzVrZld2SENtRWF1ZzREVE9sZnYza0FNT25CN1IwaG1QUzNmSERv?=
 =?utf-8?B?bVRtVTJsdklwRy95TXd0M2QyMENmcFE1Snl2Nisyb05paVZnTC9oMkRVM21k?=
 =?utf-8?B?cXJEYTk2V210ZC9DZ0pKUWdCU3EvbEhXOTNkbitWSUZTOTJHdzFSem9ZNTB4?=
 =?utf-8?B?LzJveG8wak1uTERVWWlBeVRYQmlpNDl6Zkdla2FMejBVTlgrc2lCVm0rNW9R?=
 =?utf-8?B?YW50Y3IzWVE0bFJtZFErcUFJTDhNd1NqZlpQOFBuTjVMNk5WeDFqUkRhKzBE?=
 =?utf-8?B?UzJvRkdJZGkzbzFiQWE2c3RLNE9hUG9DUnRCeHQzNjdOMEl0bmJiV0xLUld6?=
 =?utf-8?B?cC9JMmxLMDlxY0huU3VPM2ZMVEsyajJHV2s3RHNmNXZrS0RZcjV1YUpjWWtZ?=
 =?utf-8?B?MTNNNUVvWXl5czlaRnF2R3VpWnJ4eHJoV2ErZUZSb1BYU3luR3pqNkF4MEp5?=
 =?utf-8?B?WU93ZGprclhSNEY1bkR1dWRMRmJuOGtPOTR6UFNVdDJKRjhiNWMzZlNIZlpo?=
 =?utf-8?B?ZHJBUWtabXZMWk5tRWpnT2hPNERJRnhMemhqbndnVC9jcUhSbTZsNDhVR3dF?=
 =?utf-8?B?ZFF4YSs2WEViWWtiSkVLU244bDVZYy9PUjcwcGtOd2NGRm16aGtXdmtid2Nh?=
 =?utf-8?B?RkRoeWZCR01WRkRTbkZnVitOUDdGYnEvQ0Z5Wm1wK0NBc1BoODg4SC8zSE4y?=
 =?utf-8?Q?YBeR50BZ69UidavTusiHuimEx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de8dd231-9134-4871-7d30-08dafe2b1c2c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 16:50:33.8104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5b0qTpkwSIFqAaPVSY/y+rNvNSZQc04iAAPo4ubGMFflUKjhtlRspv2SDSE2JiC6d/GYoLTWnnwYb26JRAEJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8318

On 23.01.2023 16:47, Carlo Nonato wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> This commit adds a new memory page allocator that implements the cache
> coloring mechanism. The allocation algorithm follows the given domain color
> configuration and maximizes contiguity in the page selection of multiple
> subsequent requests.
> 
> Pages are stored in a color-indexed array of lists, each one sorted by
> machine address, that is referred to as "colored heap". Those lists are
> filled by a simple init function which computes the color of each page.
> When a domain requests a page, the allocator takes one from those lists
> whose colors equals the domain configuration. It chooses the page with the
> lowest machine address such that contiguous pages are sequentially
> allocated if this is made possible by a color assignment which includes
> adjacent colors.

What use is this with ...

> The allocator can handle only requests with order equal to 0 since the
> single color granularity is represented in memory by one page.

... this restriction? Plus aiui there's no guarantee of contiguous pages
coming back in any event (because things depend on what may have been
allocated / freed earlier on), so why even give the impression of there
being a way to obtain contiguous pages?

Jan

