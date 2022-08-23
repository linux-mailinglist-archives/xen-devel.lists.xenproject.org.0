Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0798859DEEE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 14:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391950.630007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQT5t-00031s-Ez; Tue, 23 Aug 2022 12:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391950.630007; Tue, 23 Aug 2022 12:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQT5t-0002zm-BD; Tue, 23 Aug 2022 12:33:21 +0000
Received: by outflank-mailman (input) for mailman id 391950;
 Tue, 23 Aug 2022 12:33:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQT5r-0002zg-Uw
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 12:33:19 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50072.outbound.protection.outlook.com [40.107.5.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c46209da-22df-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 14:33:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7443.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 23 Aug
 2022 12:33:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 12:33:17 +0000
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
X-Inumbo-ID: c46209da-22df-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kL2lGsHljRNqlNGu6+9qbZJAIOY4Msc0qsZa5x1rfs1OcHBIEyV/VGPapVg99G+Ejo5kuyW8Q/MMZzaThT+0jmN9ZBj7PdhQPvT17wjZqAPnok+Qg9+5fGL5eUCunKCPw/AtpK5dPJuPMkJ4DmdppRBdxfRZukl4214B7+P/5YzRSA5hyyufNNXlFy4nZ+mK00rBjoK3Ykt0CrFQZxDmsHf2JuoseHuVYKbd8gVDJvme30TdSbbCK5r7OIOdbB/OhGmtiqyRdWJtvhDk6hzOLrikJYTERYYieVEUk4aPRiEcgC39ps5/9+VU6gmb0ADCdqiiIFJOgajIKI023nl5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZC21d2UKwl60HwtjYbvxIJEqLnRq62qF2C6F92afBw=;
 b=ScLfTvcNb0tz4jPRdUTRepWfQCjJgogLUHx3MmMM0JrBM2tzxJO/5YBhFNaiFAv2Xa0h/8/q75eTClI+E1yTVQNIIOi2D29MGTzbfu0rycP+PfRnk/1GCYjXhcrvjcWEZ4U8s3Dhz5FRNlSpDDtKzF2LoScMGVNKLRYYnvkHniCzEfvIz3UQov40B28gLhcd8nbr1NuuHolPZcngW9Hw59lZfEo9clw2KaolLqZ+EMnU9c9CEEVXNXHjubTwBwElkIz3FuIiLffJVNat4CfWYix3SOYEDkeAlVjsWLy4qSrgovRUvRWa4xv1dW4DqozrJEShpuogwQDl8pG6ZKELeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZC21d2UKwl60HwtjYbvxIJEqLnRq62qF2C6F92afBw=;
 b=dj7g1Z44YVKxU1B5IS4LzwQTTwiNSc7c2u8admC7YpVkaFDP76Xab8p82uADplz+yuwhkL0ozq5mhFBS8iKBGCBymKFhjQPGsZun30CicGofxsXoNjdlLHaNYJj3m83HbJ8GGfNs6vI9bvbjv83urqFMQXwINWwoFBPbRhPI0H/fuY9PxiALUQxKNaywvPNDIZ1V3OkMXbxUf+HaZYemXKG4XxNYMsDhz4tN72hFUD2sJ8u2Jxi3Xy1IRcS5xuJS/MuUjDPyRDPAVlbF1khVp34uvaVI9wkBQYvgwDKZ5K3KiPciKt/tvhtG89W/jJU8sdZ9OPM4UnGE5+BwYu1q3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <844e0164-96b1-8a56-a9c0-0f432b9e648a@suse.com>
Date: Tue, 23 Aug 2022 14:33:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH] libacpi: Fix cross building x86 on arm
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: sstabellini@kernel.org, julien@xen.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <c3d431217010f669de809a76c2f1c15a0313ae53.1661246753.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c3d431217010f669de809a76c2f1c15a0313ae53.1661246753.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9aaa2bf1-a434-467f-b7e1-08da8503a799
X-MS-TrafficTypeDiagnostic: AM8PR04MB7443:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m5PmOBo+WkzO5iK3WODznPK8srL0ww+QRok+91eKiwNuoBBwBMGKCSDVuK9cLnzFC1YHXIfBPR9Ki8/2YUpCEiU+4QCOdsvZz4m+HaB4DHpeI8WOqUNhLlKQzpPjW3dzlg3OK58BGSYRWwEPgVmlbIYrUQseGs1uafS5xMLQ/Wawp9Zb1UBl6vx0fal/v6ikphEolLinRfhe2V7wXNl5FTKtAypvua9G20zVKVlFAiCTiXXCWysZSD9Z12E5fCBNvT6qg7qMbChbGY84GRROZyfKTNS6Vom6u/ZeQqk0We55AdoRpb8TxgBa2HnOV/sXIPncQidz/skovvF4osI1lUk49zxe2BPQVoSFCCmvnwnAQUc3IOewU0C8Ypl8IDvb2D9lM3VGLQleOaA40Uqil3zDtq9Rix7wU2wZ6lG8gPwDHluditLUWlMr0m8kuVyT/StydYqiz8UYXi+izhaJi0JH2eUhK2zV0JfRzJQKfYC8B/Sc9XybyeLC4bgEuyiZ19zPZ8bSKvheRksGl7VmbjEfyVFaqCYCfYsobk1mrsu+8sOpRnMBjMKFVyt7rV7etGow/Qp4N/6xiTKUp7X9AjilhQ2InpgpMwdtT8sWCUx25Pm4uq6JFGIavW0wjOESrXZVf7QG6DyRTUENLSrF5vypJv0C1/0MloV7zkD3b0tz34tHbn9hXdy9b4C7GKAlqL22D43DDZX77h93hAfSKuCsnHyxzVpftlqRSDy76t29RhlWlicF1wqhkMwwyiatL4EWAnX19OybaC0h5DxRwkaxQp5+6Ifv1u+3Ja4uaac=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(376002)(366004)(396003)(136003)(2616005)(86362001)(31696002)(186003)(83380400001)(4326008)(31686004)(38100700002)(66476007)(66946007)(8676002)(66556008)(316002)(6916009)(36756003)(8936002)(5660300002)(54906003)(2906002)(41300700001)(53546011)(6506007)(6512007)(26005)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVFDbng1bjlIbEkvQmc5TWlkMmdKYnBzYVcweXZTSWVScGl0M2g4eFFRb3NW?=
 =?utf-8?B?NjdWNXFHKzlWMFJ4S240V2wyZk9OdjNBN2tVYWJ0NDZDQ2dadWhGUEVLWHpK?=
 =?utf-8?B?VHlha1I1dDVFTjVMWVBUVDlJZTNkZEdKbGNmTVN4d3owZDBrWHpTdUxFQXlr?=
 =?utf-8?B?NUNrd2pQK0RoWmhCTnR4c2Vma1NiM1dTQi9NQ1hGSFczS2xKMXVPc1Q5RDBD?=
 =?utf-8?B?aEI3MkpCdytaUVJwZTd6WWl3eG1GdG1JOGJaQ1lLQktsempSVzA1T2t2dXVk?=
 =?utf-8?B?YnV1VUk2UHBjcGZ1T0dYTStiemwzZTR1bHB0RGg5N2pZMUNIbTlYc0dBT1U2?=
 =?utf-8?B?RmQ2bi9BTm1HRHBTTXpIQnVNL3BrdzRUNlNuQVNQcDNqaXA0TVVtWXNkeUI4?=
 =?utf-8?B?UEZKV09PK05uMCtFeVJQeUdxYk9YdVVpUk9zLzdWRVZaTE9GazQrUHlUcUN6?=
 =?utf-8?B?U2NhYWtZeXI3TEdmQyt5VEJpeVpXVjRmeStUeTBZUU9FajEzczR1S1BqaTc3?=
 =?utf-8?B?OWJxTFprMC8yU2cvMHZsOHRXVVdDWG5vczBsSTlSbzBoSzZsZWNjeUE5Lytn?=
 =?utf-8?B?VDc1MGpuRXdXMC9IQkVOMWZqMUNSREpHandPOHNyTEUxNkhLM1AySW9FQzFX?=
 =?utf-8?B?eE1TT1ZqQUdRSUo2aGVOc0R4YVJZSGgwQ01hOTE1U1E0VVhjRkQyVm01Z3RU?=
 =?utf-8?B?eG5zOE5kb212cGk2d2VvRThJQ3NLNkhZTk5nOVM1U01yVkZCNTN4aUVSOG4w?=
 =?utf-8?B?Rm9vN2hxVnc3c1VxZkx4aXh1cEplaXlVc01ZN3RRYjZnN1ErdVRvT1AvNldD?=
 =?utf-8?B?UFlTYlFudlpqd2xlakJtSnBHRkdMbFdUWi9PTE94Q1N5S3p0NG4rc3BQY3Q5?=
 =?utf-8?B?dnd0blNCdTIrenJrVGFnL0h1RS9Hd1A5dFdPSWcxRGtNL0hLSEN1dEk4b1BH?=
 =?utf-8?B?Yko0aU1hUlhPZXRTZkxCYjF5SVJLWlN2ZERucDA3Yktnem9QbkxJOWNqYlo4?=
 =?utf-8?B?em40SXJORHF1UFR6WGd1aGxHRHpWM0I5U3B6TkxLQWtPNENGcFZ1NjBzSEVC?=
 =?utf-8?B?ZGp3ZWdJYkRVMlo4aTl1U3ZReWpMaGFma01kWDhwYUtZZGZ5ZzRDYUZPZi94?=
 =?utf-8?B?RTFWdXRqS1pmdmpXT0tvZWxCanlrV1RQanV6V09LNDZFYzVLK29lTmVkT3Zy?=
 =?utf-8?B?cXlQL1ZYelNBUW81YUtWUmQ5WGc3VVFNOHVtck9YUU1wMk1iaCsxZkNNL0lN?=
 =?utf-8?B?S3g4dmMzSVkrWnVPSmEzeHNLbjR0cVJrZCtQb0M3V05JbEJxSXM2RVVnZWgw?=
 =?utf-8?B?OEZnOG1JM2Y1RTRsKzUxUXZJd2EzdllmcDloR0dXQWhheWZmaFVndG4wUXNk?=
 =?utf-8?B?cnUzekJBTjBydGZBYm1YVHUxb3F4aitscXBpeTZpbVJpZFNSZkFNWlo3MWRY?=
 =?utf-8?B?VTVjSjgzaWIraHBCalI3d3ZxYUd1V1BRdE5sS2FKVE4vaVZMUENqTGZkTDBQ?=
 =?utf-8?B?OEtTaXQ5ZSs5VFIwY01LM2cybWdIQXZsbXVxdEJHMU44SDY4RHdWdk1vLzA2?=
 =?utf-8?B?UkExaUxOYkhYWkhuR1BLNCtaQ2FMbVJqTGpKWFgzY251NXdWQXU3Y21PaFFv?=
 =?utf-8?B?d2pOSnpBckpYUHN4ZW1RUk1XeURscVVTZGRYWisrc2grOEdYNVJ2M1g2bG5Q?=
 =?utf-8?B?bWZpU3N2elloOWZ5OXRDbzlxZlNEeTV1KzZWMHlJd1B5bEM5OWVMZ0pxNkU3?=
 =?utf-8?B?UVlwWFBEeWF3aDBtTytrMGVuMDVKT2hwUDhUN0d3cUxTbmlsVjA1MTJjSmNv?=
 =?utf-8?B?QkpqY1NKQ2ZBK2l3d2kzR0pDSTlpeVcvenZTTHlFMTNEVklNS0U4a05oS0kr?=
 =?utf-8?B?VDdFandVayt5TjgweFF3RHhTSFNSV3h0U2xoQVhTeWtXQ3l5b0wzRjZHb1NZ?=
 =?utf-8?B?TG50dW5DTXFvdnRjQWFmbTVJRTF2SXA3V3N5a252WmtBL3o4d1FjZThqVStG?=
 =?utf-8?B?M3MyQTZrSE53aWxrQlRzVmE3QmJMMFFQRnozRkZtVHNYT2NwSzdaREpxT2d2?=
 =?utf-8?B?K1FReldlQ2VXeTdtSm9TVi9HaDlqREpWRW1RRUo3VzlMVkRqMG1VM1JzQ2tY?=
 =?utf-8?Q?rVvUEHhwzcGDPxIB2sLfq7gA0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aaa2bf1-a434-467f-b7e1-08da8503a799
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 12:33:17.0549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Dl6nMNKzBGTtuoksKcvfo+1GUetPatc5bQcPvygWOVS7EiSZ2d0rcE3UzKaxMxLT1liO/EDGz7qdJ05+DMfLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7443

On 23.08.2022 12:24, Bertrand Marquis wrote:
> --- a/tools/libacpi/mk_dsdt.c
> +++ b/tools/libacpi/mk_dsdt.c
> @@ -18,6 +18,16 @@
>  #include <stdlib.h>
>  #include <stdbool.h>
>  #if defined(CONFIG_X86)
> +/*
> + * When building on non x86 host, arch-x86/xen.h will include xen.h which will
> + * try to include the arch xen.h (for example if built on arm, x86/xen.h will
> + * include xen.h which will include arch-arm.h).
> + * To prevent this effect, define x86 to have the proper sub arch included when
> + * the compiler does not define it.
> + */
> +#if !(defined(__i386__) || defined(__x86_64__))
> +#define __x86_64__
> +#endif

Besides being confusing this depends on the order of checks in xen.h.

>  #include <xen/arch-x86/xen.h>
>  #include <xen/hvm/hvm_info_table.h>
>  #elif defined(CONFIG_ARM_64)

At the very least you will want to #undef the auxiliary define as soon
as practically possible.

But I think a different solution will want finding. Did you check what
the #include is needed for, really? I've glanced through the file
without being able to spot anything ... After all this is a build tool,
which generally can't correctly use many of the things declared in the
header.

> diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
> index 58a1e87ee971..ea33a56eb6a0 100644
> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -24,6 +24,7 @@
>   * Copyright (c) 2004-2006, K A Fraser
>   */
>  
> +/* TODO: when cross building, this will include the wrong arch header */
>  #include "../xen.h"

I'm firmly against adding such a comment in a public header, the more
that it's misleading: Cross-building of Xen, for example, works quite
fine. The issue is limited to HOSTCC != CC (or yet more precisely the
target architecture of each), afaict.

Jan

