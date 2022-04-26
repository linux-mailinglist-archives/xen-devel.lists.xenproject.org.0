Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D1550F704
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 11:11:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313592.531205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njHE9-000093-1H; Tue, 26 Apr 2022 09:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313592.531205; Tue, 26 Apr 2022 09:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njHE8-000075-Tf; Tue, 26 Apr 2022 09:11:20 +0000
Received: by outflank-mailman (input) for mailman id 313592;
 Tue, 26 Apr 2022 09:11:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njHE7-00006y-GR
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 09:11:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4cd3b6d-c540-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 11:11:18 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-_u4PrxltPMGBvvwVy1fedg-1; Tue, 26 Apr 2022 11:11:14 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VE1PR04MB6432.eurprd04.prod.outlook.com (2603:10a6:803:122::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 09:11:12 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 09:11:12 +0000
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
X-Inumbo-ID: d4cd3b6d-c540-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650964277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SbukDmSwJmoRBCLIetA2B8ev7EKGSo+vjX3+6kuuQ8A=;
	b=lXx5ITZXtke/8TCCHNvy3hAchaYbc4sXB7WPP+Ana5bH4ruetCmum/baz2wzQfc2a6mGTk
	qqDfeYHAjzL5WBADcpwyk3gCH8EQmk9c9J2ESv6R0hFPmyF9OSrD6qxc9A5d1K6iDkEKU5
	QBHx6ZOPNzxAsKpQBJkzDLt/7nM0az0=
X-MC-Unique: _u4PrxltPMGBvvwVy1fedg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TuVQp1BI8O0I/AMOyLPrRBFTdv+AqH22O8kqU+Ipi+j8KDxg+zcZIcoHHKsk0hvrHg21i3itUICml1KIja7QoUY/HqvKrsERVdwwvXrGwvymYAdKkn/qnLpWvs+CGExJHZNmhiX+1VXLJMIzEjwLzdTAVsoAtO6ZWT6quU/7/q289v9cM+E8vuFoXSok9r1JnRvSxHWHoUQtN6ajvpk4nh387AWh5DuwGSqgl43n7j5I4vmrUVOAtl+k07KnX00Ez1jXfApBehnQ1zD7GGbg//b015LQdBvYnG8lqMlb2Yq4NCchV+GuPZGG30JxdauOnH91PKHpH47MoCbxk732nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbukDmSwJmoRBCLIetA2B8ev7EKGSo+vjX3+6kuuQ8A=;
 b=jvt5FIKnZ8FFOrmDqDvlnhGg5ZpPiK5SAQnYK6JjAZ2YA0Fx9MXn99HOxPVQBClwvPI6uU0bg44mlt5hCWlVdYU4ASp3wZ1T3caz+frropuIoBfjlKQnHyhPx7PWO1RZE1pWZ/umVWJANMjb8Ie/DihIq2lcJtAW2XaNKuz5+jgXKb6p1F5k5hh7yG9SmLQ5GQvItvLKKxhoTuQ8ZT2WCck0/2C6yHX1tt8FJpuM4aVf6BboXk6OwgQbvNz6/IhipHN2UtwRMwUcLvHLodRIkI8EMS6wuYKK4ibcE4EvDRyeKNSJCVFqh5dXkCOR9HLbNICRrK7p6MBM6UVsLKfDFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a966300-e3a7-64db-b8dc-cb8386b2d11a@suse.com>
Date: Tue, 26 Apr 2022 11:11:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 09/10] xen/x86: use paddr_t for addresses in NUMA node
 structure
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-10-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220418090735.3940393-10-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0021.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc8b5dc0-58f2-496d-4a6e-08da2764b5a4
X-MS-TrafficTypeDiagnostic: VE1PR04MB6432:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB643263CDA6422523C4F4B4F9B3FB9@VE1PR04MB6432.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	37VHx37uJjxcgypKIkqC9BbCdnw+Xcd3iIEOGNDBWiYSGDgBpseqQ/tBVpCCiRxaQZgkHweNAXSbZb5bNTihN0C6Ee7xR5X/xpVSspaz+HHLzQxD5NS/6f3HNQTqv3E7Q/3eKDvvX0D1Cak9WE/qcmhWwrlL/l/9uCZJFWbr9740MCjqn0p5qJ+sSsmsS0XuBpLptMwoOVhq3ouIknxdRBki+aL4mq9eKahIHtAjTIC2lK08cXzX1FkoumUcLQTmDSygE043CSBjw9ILIaE/l72Ko+TXFmPbiFTg/YQUhh+JBnOELHQAj2pnPMoq9ZaTS6MqEFz8XfE3gHO+/X8l2dvzGzwXYYXDAei7B0dcnQfQiYMHNZIHmtFQA/uEXGuKlNozy2Kr45Cxkzc2+rP1cLXEi+MwCoQ4qLKNenjEES7YMQouYszKHHN2RnCjawU3DXSv5KtrFqRrAjk1fDmoGT6+vfU4e5AGKFWaQ+p7cmUu7euKzXan3+zXmh3og921ypJtWM2ZIqlWEYiBIsVFWxFA+VWVdxK5qJWgXIsspX2oZSK4+5ZcC+Xnr2QBM0NmThl88ejQrO1yx8ihIkLekAgDxCjDYKdr96fe12S1uM6NKv4ZGnMv3G5jlEwVNdveerdM/QJlQWl0r+gomdIg0wxKCyQsSmKk0E5cqwydKaeNNVvRyVDBAiWLvW7PUE1DGRuMxIFd5tZYxumK1dLS/eyJE5Ao0RYipi3CPQyKz7S/9Zq/buybtD+6j+0QZw7r
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(86362001)(2616005)(54906003)(508600001)(8936002)(2906002)(31686004)(5660300002)(4326008)(66946007)(66476007)(66556008)(186003)(8676002)(6506007)(26005)(6512007)(6916009)(316002)(53546011)(31696002)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGdXc0dtYkhETkhnWmErU3dtTENjd0lzR2ZVSXZtNlNOTkZGNTQyd09QK2R5?=
 =?utf-8?B?NFRDOWRxVStpc0ZtdXkyNGl5Q1lvMFlUWjREZlkrMkE5VVhaY3JKa3hlS0Fs?=
 =?utf-8?B?bmd2bUhYR0UzZi9VRmhLU1VmV1FCWjA5VTBDYmFsdjhzdEVyNnIvQnBMZFMz?=
 =?utf-8?B?YlQxOUdvTXRoNm91QmhzY1d1WWVQYkRMbDlDSGdBU2padUFYTm5GbFNwNWV2?=
 =?utf-8?B?dGtqWmE2RUhwcUlIc2FXSW9EVGNBVXpZc0ZLRnNQT3BFTmczY29mdXRyTERk?=
 =?utf-8?B?ZzMvVVR5ZHA1c3NUTEtsaERzNWVOWHY4WU1ZMU9ERllTdUxVTVlXN3I0YUZQ?=
 =?utf-8?B?M2pGSlR4dHFkaUNtalFMaVJFYVdSdGJKcFg3MVR5MHl2SDRoZDRpRWRXTktz?=
 =?utf-8?B?S0JpcVhTL0VSUkUrOUZlNUE0MURPaFRROGgvWDJQNy9xODlVZ0h6RExWNnVH?=
 =?utf-8?B?anZzcXBXcUtUdDNac1hmQW4xcy8zODVpMlZxYml0NmFBSDVHTnhyYWVzaTJH?=
 =?utf-8?B?dE5wcFZRNUlFbW5oaFkxRUZMZjZtdDFQdDA5ZzMyMllOOEZhOEpJTmxuM05k?=
 =?utf-8?B?QjA3dzFETmx6cGFCM09NZHdsYW50SytRRXdSS2lDVE81cnlpUkQvQlNUYzlI?=
 =?utf-8?B?UDl1UjFoa29iMUxWQWptR2FhZ2FuWmd6RExsaWlHQVgwUW9OQmE0S2pzdURr?=
 =?utf-8?B?eTBxeEFUWW10ajU4dVFFR1lSNkJYMHBJV2wxZ2Y0TUhDRkdROVJ6dmQ0anM0?=
 =?utf-8?B?OXJicHVlT2ZEWWFmUG5Bd1R5YkpWQzZlOThJcXcrNkVMUHdjUGt2Ky9tSFZr?=
 =?utf-8?B?UWNUMThESzRPdE5pL25nWWJ3MkM5WTFoM1JYVXoxd1BFbEdQZEhQZm1yenZa?=
 =?utf-8?B?NmtsYWxraEZyQVhTN2trUEliN2paV053OWc3VHFyU2RUQ29VWndldHdBOGlW?=
 =?utf-8?B?U2dUTjlFRkVYMVl5bmRsQTMzQnMrWmNiOWVKclpkUUZFcUo5dzZ2dm1nVDJH?=
 =?utf-8?B?TUFiaFFIeUlQcE9ESXZLOWdaaERyVDVxZU9aK053WGt4OGEwUW1ETHBPYzZQ?=
 =?utf-8?B?eGc0aXlVai96TjV0MjhVeG0yWVl5T2E3SEtvU0QrTUNHM3FWa1E4cGxxcXVn?=
 =?utf-8?B?dlN1Q2xtb1YzYjN0WlVJSkFnMzd4YUVnTjdMeXAyYTlzT1hGbFJCVkd0elk0?=
 =?utf-8?B?YitJZ3pKNTVSVktjVVE0MTRiUDlpQkFZQ0JWd0RSVTdJeEdJNjlRNXphOC9F?=
 =?utf-8?B?NVIvcFh5SVNGRElNOW1xM1l3alg3TExoNmN4VGFtaW45TlRaMEVCNjd4QTA0?=
 =?utf-8?B?ejZGVm1tWTd6TG5qbUU3bGtPM2JPRXFMK2lZZlFGcHBhL09CMU5HbVFETi9S?=
 =?utf-8?B?RUlBYllkYmNxRjM1bVQvNTNENHJldFRGcCtmazNUbXloMzZ0UkM4d2swQ3h2?=
 =?utf-8?B?SDZtZlpHTnZHeXE0anErcldHajFIQmk3RjRzSFBZSzE4TC81Rkk4V3NqSSt2?=
 =?utf-8?B?NDVJOGRxVEFNT0tKdEZJUnN4YkNSVCt2c3BzTHVEVk5ueit1R0xQbGlIaHA1?=
 =?utf-8?B?OVpkalNMNUJTN2NpT3V5emZXRTJtMlB3aWtPNnhWakV0cUF2cTRuUFJWc1Ry?=
 =?utf-8?B?bmIrVjNiUGlnbEorVU0vZmhmd2N1UE5QUDRuWlFDWkNlTnVzcW1rV1JLb2h4?=
 =?utf-8?B?NWxJdDdtc0RjQ1FGZ0tJMUF5QWlCd0NueU9lczVvaE1WeXF0NHhrU0YrWDBl?=
 =?utf-8?B?SjdUYmduVVgzdlJSaG1LYlZGdUdlUWNTU2FWZGJja2c4SEZDVlZuM1ptZWtS?=
 =?utf-8?B?bmRwVDlESUxncUlaeVQ3VlgyVGxTdlNUUXZMam0wRjRwcjRIcGFoempxT081?=
 =?utf-8?B?Y0hrUE9qejErdktLeGRpYVM3VWZPdWpxRnl3eE5kR3RNTUdBdG5kL0NORnRD?=
 =?utf-8?B?UHFuUTF2U1RSSG1rYXhXRmkzeUNSNzlBQ1k4cWhYYU5PcHkxVjBvNGN3Mk0r?=
 =?utf-8?B?S0lkT1dPVXBKaDUwdlNPY09taWhXOTJ0cHMrVm1rVSt5VTAvekc1RU9WS25D?=
 =?utf-8?B?S2pmMkZDalI3UTJOenRScDZZTVZyUWlNU2Rnend6MlRIS3FqMzBLcDRSTmRF?=
 =?utf-8?B?YzJxRTFsa3FmM2FQT2ZyRWhlVVZPRUUxQlBtUDE1Y3EwNUZNZUNnK1ZxNzBT?=
 =?utf-8?B?WjlRVE93WUtESXBSZ0czMFJ1djltTi9xNTcvVUpHSjlmUitVY0tRTktEem1l?=
 =?utf-8?B?QW5VVyt1ckNza0ZQTUhhTElrenF6WStCOGE0RFJhMy9jdTNuWHVmWnNRdVdp?=
 =?utf-8?B?Um5HbkxUVm1SRHpVU0lQRnBPTlpPUEZDTDBVaEgxWVZxWTVSSnZ3Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8b5dc0-58f2-496d-4a6e-08da2764b5a4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 09:11:12.5408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzTmK0IBD5j4t/7GPmcnN+lXdn1QSWr8UAJP9ShTWzl8NFxSb9t7iVyVVhaF+FVZX9FUXwQGNMzEkcdstogEXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6432

On 18.04.2022 11:07, Wei Chen wrote:
> v1 ->v2:
> 1. Drop useless cast.
> 2. Use initializers of the variables.

Would have been nice if this was extended to ...

> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
> index 680b7d9002..2b3a51afd0 100644
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -162,12 +162,12 @@ int __init compute_hash_shift(struct node *nodes, int numnodes,
>      return shift;
>  }
>  /* initialize NODE_DATA given nodeid and start/end */
> -void __init setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end)
> -{ 
> +void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
> +{
>      unsigned long start_pfn, end_pfn;
>  
> -    start_pfn = start >> PAGE_SHIFT;
> -    end_pfn = end >> PAGE_SHIFT;
> +    start_pfn = paddr_to_pfn(start);
> +    end_pfn = paddr_to_pfn(end);

... these as well.

> @@ -218,9 +219,9 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
>      memset(&nodes,0,sizeof(nodes));
>      for ( i = 0; i < numa_fake; i++ )
>      {
> -        nodes[i].start = (start_pfn<<PAGE_SHIFT) + i*sz;
> +        nodes[i].start = pfn_to_paddr(start_pfn) + i*sz;

Please add the missing blanks around * while touching this line.

> @@ -489,7 +489,8 @@ int __init acpi_scan_nodes(u64 start, u64 end)
>  	/* Finally register nodes */
>  	for_each_node_mask(i, all_nodes_parsed)
>  	{
> -		u64 size = nodes[i].end - nodes[i].start;
> +		paddr_t size = nodes[i].end - nodes[i].start;

In numa_emulation() you use uint64_t for a size; here you use paddr_t.
Please be consistent.

Jan


