Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49BB5544CB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 11:13:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353610.580556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3wPb-0002PI-8C; Wed, 22 Jun 2022 09:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353610.580556; Wed, 22 Jun 2022 09:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3wPb-0002Mv-5V; Wed, 22 Jun 2022 09:12:35 +0000
Received: by outflank-mailman (input) for mailman id 353610;
 Wed, 22 Jun 2022 09:12:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3wPa-0002Mn-1n
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 09:12:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60055.outbound.protection.outlook.com [40.107.6.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72ca7c99-f20b-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 11:12:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6326.eurprd04.prod.outlook.com (2603:10a6:20b:be::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Wed, 22 Jun
 2022 09:12:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 09:12:31 +0000
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
X-Inumbo-ID: 72ca7c99-f20b-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGLJ4kgItSiZavQc4RSQbuCValLcEVgmFMT5ZaqJEICu3DCsZ9+XDM/1j8EtLZNmAzDELenZr3ztYdrs7yLnFZbmk5hdANlQIWjToWBMdEH3UsoH7aV24gJaZxb4S7zndOHCpxbo40YdIeQP9fTPOwomf6I9msoDBbJSBqdoPSlydrb4olw1vHa9uM70GYHlBC2CRkRbMYIiwsMCdo12N6OFmcmo31N29MUbaIwdDjgqI1CDQH0szWMfbHcAULQM7g78iblpvjCL5qTeEFbnLeBOgfhiI184jByNujaUEjL4E66WzH+S21EpUTmRIVi1SD9+B39dRI+0otGxWDk96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQ0EQNclJ8W/P8unN8Ie9ROq8PAoFEBXZZCngGJrLiM=;
 b=TY31veEGnvXjyWozDhOt6ldRS84HaFGde5bLhoa7RpuLfSYsxqiyqJ7+qVOmQOAnJZeAyTflycWyxrYVd63Hx78iMMTOgkZsRfsHgV2VSK7U3EhFnYegluAz3Go9G+sxmEcmS2wWqGIEralZ12C0CqUkxzWTuBvwxHOUXknSA1gIvbSvqh/OL0epL6V9+9oWWelkrvUx4ym/EAMJ/l5m+3G6ztzsBcugCBVhKF0y1tBCztxcoDQLmTvpWMnZQOKxV6QIFfGKv3I7YhjBJxa/1ggXisGBraozkjYSvz3Swqxk5R6zWYO4Bg/G9yzrKbxI1xtN+aio+xCaiUo0X/7niA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQ0EQNclJ8W/P8unN8Ie9ROq8PAoFEBXZZCngGJrLiM=;
 b=PmKsWOgIUIzl5tjE7Ic6SNyLB+pHgc+O70Kc4D5j6PJHVOk+JHuZpzf2E0cyRRCtuFyeSV6jE4L05qw3LwI9cavrV//IJB+gRW1jy5f8+B1qOjgd7n0NDvmZI6JNK+JCCutiSs51B5XxD7hbBU2ILSpx7iQHUm2iwY7KQz2Ao0Wr55eLpdR/WSXGkoS5e/Yyqvsm1gV9UmvIr9Sy2Hx5BbEoNGaBb2BCmcbfl+6b4gol4P6SHkcVlGNZOdwPuZLYZhkrb46DYvXsAUE32KxNNztR2Qxj6kn3VgwJkiQ4kK9MK5rq8DkvDJ4GFzs3veSr77crjPt69v6Zt7M02Tr/KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a410600f-0c33-effd-e4b5-43edb1eeb647@suse.com>
Date: Wed, 22 Jun 2022 11:12:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 6/9] xen/arm: introduce CDF_staticmem
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
 <20220620024408.203797-7-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220620024408.203797-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92392de2-bddd-416f-3028-08da542f55fd
X-MS-TrafficTypeDiagnostic: AM6PR04MB6326:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB632614236C11BD8D8BD14973B3B29@AM6PR04MB6326.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cxgQVEsObioBnVAuZF92WLYgKAbO2Q4imtv8HhW5CVPxQ09qfxVBZkNCaXGQr1TAFT5rijKnIxxZLEb8ZfXPAovuc1FmYfMJvodneZmF2FAcTS3hEJR+mXnXHBnYnKuDzamZlICfegUQRQZY2shPJfkvulat8E+y+nSvdr2AYFKpGuNkU01bZxKrDu+rdHiG4vPD+cQyE4GQ4FCqoF7/we6JP/X9MzUpBPRCaVQnqmHa8E2Srbgh7/vxxF5wniDLm7qCsJV+Nekwgp2iwwDd9gsOzAv2MQcE7s7QHJwRrvEx2i5wfoRQkuvqzbHTZwcoCHMPkf0/Dd/IqNXShd5F374/TEsGNZIqNUNMt8iUvpKLM/Afy8ACO2CgNCbJv+Me1rn2RKNZiAfJjEZjYcKm550r9AZoReepFiPeUqLc+qB0YKzoilRYCiom4RK0TDKPJEHXigPR3LDHD02Le4B+4FXR746JUrc0hEPfKx/AFECo68xtVEy2u4sd/7XYwRYhdZ+S7OFn9ZTscuX29dOsLEvAwCZiX/iJs6EageFYvq+lmphKyotcHn1cEyYpyUA0VAIx7AzxKz4s2QthKo1h2W5dPxifvlRFwDiV5zj5/OsM7hYEv62w/XCo7QnNRnyyUZrnhpqx5GV1p4HzzErqpXkZuJr7L4FC3VTaU1jCR+Q+VIQyDjJP6PR3na0gZl50jOvLvu3HZrjJ/5Q//diOwa+bLTQWDzg+eYQHzeRUd+8jOYkiKna/ANCM82C7Y4UWYuHhJMepGqvoqhiIxIXZThs2Xn0UBdC5sDz387BWrfw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(136003)(346002)(366004)(376002)(4744005)(38100700002)(2906002)(31686004)(8676002)(186003)(316002)(66556008)(66476007)(66946007)(36756003)(54906003)(6916009)(6506007)(4326008)(6486002)(31696002)(53546011)(2616005)(478600001)(5660300002)(7416002)(41300700001)(8936002)(6512007)(26005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEVyclA5Q2hnQm5pWi9HTFZBMmZ0Rm5KdmUrSG1MdlJmNUpNWG0vUU5pUTlX?=
 =?utf-8?B?bTBUdmpWWFFSZzZxTkNJaGpUTys0WjliV1FkVmhEM0ZUMjc1alh6YldBWXQw?=
 =?utf-8?B?RFFzeHZ5VkY3ZWE0S3dHRCtTL3FxbXRSV2NEM0E4ZW90RG5scjJIWWZRazhF?=
 =?utf-8?B?WmwrZUhJWi83dFhyZkJnZ2lBd2hJd0hWMG9FZzhaclNqeGNudE5LeFZVa0Ju?=
 =?utf-8?B?bmYxQ3I3c214UEsxb0tJY3V5Zm11SmdTRXNQRUlLa3ZacDdPSXgvRWgzSVRq?=
 =?utf-8?B?QTE5OUJwbzF5eTN6TUhVRnFsT2VMMGN5ZWMvVVFPQzA0b1FTbmtDVFBYamYy?=
 =?utf-8?B?ZFU4YkFTRWJ1SHE4Z3o3VVFQWVh3elczcUFCRUtBbU94R0NaY2hpRW9ZQkRa?=
 =?utf-8?B?bGJ2K2h3NjZTRFFibVgyVFBMTitDSjMvT3pOUE90MC9IQithMndvOTBvVkFy?=
 =?utf-8?B?dEZzRmJ1cmt6elVOeHN4ZzBJWU42c1VrTG9OcEpQSnN1OGVRZENlTzNOTzkw?=
 =?utf-8?B?bjZ5WkZaRnZtTW5BMzYzek9QSHlQREFURjcwd2JVZytpZnFJNHRLeWxZY0g4?=
 =?utf-8?B?Y1gwVHl4SURKbW5WSmo2TUxCaVF2OHRaV2VsNCswWmwxclJnNzBSczdadFRr?=
 =?utf-8?B?Mmw4WVBzTmpqbTN6eFg2azVBclRvOHhmNjZLS1dUaUdmanFNM3VQWTJBNXo5?=
 =?utf-8?B?bVFNcSs3bUtRSHhlbmpGWlZCLyt4MmZHT0NYampSdURLdXRWbW5IQ3hleVpJ?=
 =?utf-8?B?U2pzR3kwQUNxL3BYWWVYR09yTDRReGFRUTZBNUkxaVJQanc3Q1ZIRHBab1hK?=
 =?utf-8?B?aGZLUTdCSTRmalE0MGhFRVpDMlJGM1FycWhJQnN6V0VuSVlWTXhOTGNjOE1u?=
 =?utf-8?B?eWwxUy91SWlwdHdGRkdWVUxtdFo0ZXR0QnF4SkUxNExvakJHM1pSOVhpd0hW?=
 =?utf-8?B?MDJwUlJCWENYbFZyRVpwSkRpcjFFMlZCRUZ5ZU5PTFZZNlcwVjF5cmROVUMx?=
 =?utf-8?B?T3RCYTBjbFgrV1IzSUdXRkhHcVZVQU1LaDUyL3FJY0hySlBMdllqVlNHM05w?=
 =?utf-8?B?a2VocXJYelhRamtVckhSRG5TODZ2VGdVdmd3aTRzV0hlTmc1U0NXVGJjV0RB?=
 =?utf-8?B?L2VEMXBhcXM2b29tZ21WNi91Rkl6R1o4MGEzSk03VkFJbjNNTjIzUTljN0Qx?=
 =?utf-8?B?N1BZeVhXeHdUT1VjWU9kd1dzZWQ5OEtPamhxQU90QWZZRVZYOFRjbzJRY1VE?=
 =?utf-8?B?bm1oR2tyNVdyeUN1TG15MStmalZLenJzbnY5Vm44K0h6YWtqS1NsLytySmZK?=
 =?utf-8?B?S1hrLzRUcGtoNDNTTnFPeVoySzFCWUljTDJuczk2Nm9LNmFhUCtkNVg0YXh6?=
 =?utf-8?B?NGdQNEttTk41TVBZUjBvZ3g0ZWluanlscXFnVlJRcEQ4U2lHQ1dWVmhtMks1?=
 =?utf-8?B?cCszRUxsL2ZEZUtNcmFobGFGTEJlRmtvMWdkRnJzbUVGeHM5TnhCdFhzc1d4?=
 =?utf-8?B?cTJtYkYyR0twRFN4R3ZMRTVTMWZvTHpBdGJIL1VrTEhQaEZwbXpIWGNTZm9S?=
 =?utf-8?B?cy9aNlZrODBTVWVjdWswTHV2dDFIT2l2anFHcDZaQmpacGw2MnNxbGkwMkYv?=
 =?utf-8?B?eUpLZlNMblhBckxQUlRCZFNtOWFIZm1NRll6Q29FTUNvWTgra0c1UUQxbmNZ?=
 =?utf-8?B?TjhIVGQ5bzdySmgzU3o3OGpXamtlaENJQ0xwQVQwRnhjWUNLNk9NVFRDTVN6?=
 =?utf-8?B?aDdVVEhWUG1WWGtnTW0wY3J1MVdXY3hRYUx3ZTVZaCtFVnlJSC9Dd1lRcXRq?=
 =?utf-8?B?cHdNRms5aEFkZFZyQ3E1WW56a3E3ZEQyaDJHMERrWUdoMzZiQk1ZVitLQksx?=
 =?utf-8?B?dFpQbGp5QXUxdThTMEFna2U4Q0pJWU4vUW5hNDFISGRYRUdWSGlObmdsQmc4?=
 =?utf-8?B?VFZFY3JzRUoxRTIxQ3l1VGpiQSttSVQ1dXpSUTZJckZRSjkxOC9icHVTMVFE?=
 =?utf-8?B?blBPWEFPYU5EUGhndEhxYTNSS2tCZlhkei9FWE1iREdkR2s5dUQ3M2dKeDgz?=
 =?utf-8?B?QWlmamdlN2lhS1ZuWXIxRnVTQjU5M09XbHRPM1VQYitsNW82MlZwWFc3cTA2?=
 =?utf-8?B?LzBLK1RLd0E5WHY1SnlNUlE1NjBLWmtUNG9SQUo4RWtFMkQ1ZTJqQkxlR1Ir?=
 =?utf-8?B?ckRzcGRBWkNDUHp0TlVramFFQzRCbmNVVmU3TkNOOW55REphditNclhZRXNh?=
 =?utf-8?B?UWFFb1d0WlUrK3RNaUo1Z3N0aEFjRWZSTWEwMVg2Mm40MnNobStURHpNQ1lO?=
 =?utf-8?B?RUIrdmY5QlRIRkpPNkJ6MW13QmRtSmhlcGhiN21WaXV2UzFodFkzQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92392de2-bddd-416f-3028-08da542f55fd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 09:12:31.0605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euARPPukzRCMzRHpVfkudTgcYxc/lE7JwnYIxz3NSfq8616dwoS6bs1HYQx7fa0VaylaYydwOM22SmO7onRaFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6326

On 20.06.2022 04:44, Penny Zheng wrote:
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -35,6 +35,18 @@ void arch_get_domain_info(const struct domain *d,
>  /* Should domain memory be directly mapped? */
>  #define CDF_directmap            (1U << 1)
>  #endif
> +/* Is domain memory on static allocation? */
> +#ifdef CONFIG_STATIC_MEMORY
> +#define CDF_staticmem            (1U << 2)
> +#else
> +#define CDF_staticmem            0
> +#endif

With this do you really need ...

> +#ifdef CONFIG_STATIC_MEMORY
> +#define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
> +#else
> +#define is_domain_using_staticmem(d) ((void)(d), false)
> +#endif

... the #ifdef-ary here anymore?

Jan

