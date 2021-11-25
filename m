Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB2845D8D1
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:07:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230903.399288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCar-0002ZZ-3u; Thu, 25 Nov 2021 11:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230903.399288; Thu, 25 Nov 2021 11:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCar-0002X3-0n; Thu, 25 Nov 2021 11:07:09 +0000
Received: by outflank-mailman (input) for mailman id 230903;
 Thu, 25 Nov 2021 11:07:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqCap-0002Wa-Dq
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:07:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d314c2e5-4ddf-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 12:07:06 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-Ws-2NulVMRWTFSu6tBYi1g-1; Thu, 25 Nov 2021 12:07:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 25 Nov
 2021 11:07:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.027; Thu, 25 Nov 2021
 11:07:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0078.eurprd04.prod.outlook.com (2603:10a6:20b:48b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Thu, 25 Nov 2021 11:07:00 +0000
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
X-Inumbo-ID: d314c2e5-4ddf-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637838425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWuCeIqEXoG6zsGWy0nbE/i9plowKB5NsSYDTZwCQ2w=;
	b=cZSQMS+4Vyq/z71grEeYLVixT/7yx7QAb7nQcNsSArEIs49njn28wtrsAPHwQXdYlcQYwk
	D6cdG6BdBynblxgbWKd5rF49sgqA87ORInNj34NxgoZXElkjgQstE4dI3kaeYpkIetckZK
	9iAZo9fKHtN+fLJtKALAiF51AhVzkOU=
X-MC-Unique: Ws-2NulVMRWTFSu6tBYi1g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuTORUmHMfAr9kOgAdBKd3lr7QPMIVtdIwtyAp8YdXEAxvv8g5Da2SZ1BgbYIev6ijuvuGEHnCkqU088e5GL/kTy3D6sOQxIX8VHcge+E+OIHiAuyzZmg6sUnOwq0zHgyOuVTmmeGfd6aloLkptQEXOWVdpa4sJkJmTLiVGpM4k6+Bpe8RBxyNf14nI9Au8VDQAAuaBGOugoLL7BA3bB4V75lfs8Ig2Bvo/WPpC+8GzUNdsprqauqooUwcI5jT5JgEo1Fn/0qpYhOWXxyGrA1kD6NymZFJc7N24rco8MqQVdAA0ND7lbuNEfCN5ZGMBWjuhuZIQaLzZz9t3gq0n2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWuCeIqEXoG6zsGWy0nbE/i9plowKB5NsSYDTZwCQ2w=;
 b=ed/WSjYVfMGi0nbtSPaQcdh/Bk2jkcZ6blcfjw//KcjygfVgaz2JlAH6iVXRLnrx2Rz/i1hmyRW4ttLCaTiYGa5FQ8e6PtPb5thNdi2WzgDSusWfwGKcHQORORsowS49+kCE+1O4K8y0wQ1MI/G3GgJabQNuSuyxCfott2rRMrZqZSBQk0Uy7r//kzy3pb3SxqR6Hwx8kuGgWVWWTVSFleKo6Qrk+OzyvuRsF4HhmceIkMbt+GZkrC6c/9ZrR8LATm+Z8XTqIvapnL5EK1FJQou1vVqiedUHkA6Ys4Ni+5F6mbb07878ynQPXziQq4ef46ujqQ5vkeDfBLNW8wFOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <923a7838-b562-4dd3-839a-6c08bed3aa0a@suse.com>
Date: Thu, 25 Nov 2021 12:06:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v5 01/14] rangeset: add RANGESETF_no_print flag
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-2-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125110251.2877218-2-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0078.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cc05380-b02d-4e7b-546b-08d9b003b487
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB574260D499EF9836BE8A7815B3629@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I9hUnV9phk2Qh8sLg2qUksmcz6hfcW9iccShC3eT9CLcEP+mZK68GkIK8N0Fu+2nbxelj1NYaMlUKQm4YJtpV537BdHZ8Zw6L5NCdzdbV0l0McGjivZ0ZUhB2865jwPMcn86nztlyLMmDUJ8KN51NQSqDL0SR2bPHT78I5oFldEbyQeZe6AgYTnwAECF6bkjuZQHbHQJncvK6rtuhdfN8+IAUXD+K478cmsmlSSl31f3zfc1Ij/WnoLA9QJZ3/baWiE3cbV3pV3iVf+BFLPvQ38voYQespA7Y/D/Svvzn13odJYF3MDcv9GjEM6TGybHgXyNjlDsGqxlyOq0UAewQJ/EOk7oBgsRJtVqBzy1N4nJxq4buLj6cXn5/Cnr5LzQE/+uROrpYH8aY1tHuEM07EBwwy5zMm1B1Be5elNLhtOLn5kVByLbpU+UhcYoaK9rRnMdCtHYD053WnMXVmrQiByiU1X56m7OhQyNvPM/dgJBgQV/MvIH+Uf9V4+9pLbrgPQ/v0vDsVT6UNnNGrkwc8NYPq/kjroWzJruM2ZDHXo8NdMF4/5R2sAF4NXpJ9qZGUVKQ1rmiT2aRU2YUB0ypdYFZn8G05IFdqhtXABqJi2NRklvvr1geLc7AffAaAMFFPTgMyTwU7732VZQaweTbEz5yyeHVmMDn41amUJ75l7hFdHAI1hrrl81gb4cdNrgqmjrJnJhVzS3zxYVXU3R2LWDSS1J+UM1+KwmMUOa5mU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(38100700002)(16576012)(83380400001)(8936002)(5660300002)(4326008)(2616005)(6916009)(186003)(7416002)(31696002)(86362001)(66476007)(316002)(53546011)(508600001)(66556008)(66946007)(8676002)(31686004)(956004)(6486002)(36756003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFpJSVcvZWdDcnRpWENCdTVGdGgwVzJSUTVJeFdlWkJUSm0zRmYyRnRHRXNT?=
 =?utf-8?B?R1dlTlM3eWdqdzZpN1k1UHljNzhhTmpReG95TU1uSDA1TDF0VWRSenRrWlpR?=
 =?utf-8?B?OXMwa3h0cUY2TzdETUFTdkIxZ0wvTG5OUjRYa3BFZEkveWtQMkkxeHJPc01C?=
 =?utf-8?B?bFZZUWcwM3YwOEN2VDVpcE83ZGsyZVVZNGZiK2V2d0ZIUUFBbkpEdWRBMW1Z?=
 =?utf-8?B?dnFReE5od1ZUaWlYTnhacEd2ZHM4dnJ2NTZ0d3RlaTdOZ2cyVk1ta3NzVDVW?=
 =?utf-8?B?Q1d3eDZEbGxLeDU1TTlPb245NEdPM3M3M2VEYlJ3M0lFeGYvZ0lDRERibXFZ?=
 =?utf-8?B?SEJjR1BLMGJGb3k2ajdXWlZtc2dFdzIvaFV2dU8weERBem9ocVRsdW1yTkVZ?=
 =?utf-8?B?bXhXQllleW9wMnJZeTIwQm84MThhZ0FuWHlJQjhtSUlHdkhGdkZBMjU4MnI2?=
 =?utf-8?B?Z1FTaWYxVE9PMGZzTnFDRXFNWit5L2ZodHZRREtTVm9vUmhZVm9ZazM3ZFdw?=
 =?utf-8?B?WUdiN1E5dlpWdXRYT1NDSkhzL20xVXdwOEpQbHdHbGhha3d6UWt1T2V2YWdQ?=
 =?utf-8?B?ZGp2RUVoazZ4QnFaZ2ltdVdkcUFRQndZKytCQzE4TWRLajMzMnhVWVNGeXFI?=
 =?utf-8?B?RHpPVThGajlkNUQ4enJGdDJrL1oyNFZWd1RsMkVNLy94TThDbG9zK09tNXdO?=
 =?utf-8?B?SklscFdLNFIzajJ0TmQyTEJ5UXZMUWNyYlg3ZERaVzJJbzF6UXE4b1NjTE9p?=
 =?utf-8?B?UXJXaEhRTGZPSkE3Y2tQenkyaHlGQXJxdGJpOHNkK3paczhGTHNyYkZ5bWZl?=
 =?utf-8?B?b0s4Y0x3T0swczh4RWVtSndjQkp2S2JnNGNzcEJRT0F5N1hIcWVySWRoek4y?=
 =?utf-8?B?MUkxZTQ1YnpJZ01YaUhwbWlXaUNadVlVUFg2YkZJOTVPSEtodWxISkhveDhq?=
 =?utf-8?B?Z0JSWStRSHc1YkxVQXZnd2x6T3dEekp6WmVTZmwvdkJaSjhET3hxd0ErMGxh?=
 =?utf-8?B?cDEram1sYkdkMm9tNTZBZXNGZUt3bVU0Z0RuRXRZclRFR0VzZDdGWjRzazk1?=
 =?utf-8?B?d25CZHVqQkhVN1dCd2xWOFRnSElLemkzVHgxS0U2cllFemdRakYxby9aM29U?=
 =?utf-8?B?NTl6WXc4Mk9QVy9ZOUVydEhpZTF5Rkw4a1JYYXBLRmpMZGt0QXlUaHRlVHBn?=
 =?utf-8?B?aHZ1ZnR3R0FoVlJPSU1zVkZOM0pOMDh1c2dDbEQzbDlWUHArYVZpbi9kMFlz?=
 =?utf-8?B?bVVpc3I0anlnNmxLaUJLYWMrTURqK0p5eGppeW9qMURBL0pmcjdrTG90K3Va?=
 =?utf-8?B?aThzMlgwZisyckloUEZzQzJNelp5Z1VDYldVV3c5V0h6a1JxVFZSVHJtK0dq?=
 =?utf-8?B?YXl2SlhTVnM5N0NjaXJiOG9uTTg1bkpuSmozUzZjSk5pMWdtKzg1eVk5WTRx?=
 =?utf-8?B?QUtWRnMrRjJhc1BJL3gxNGRRQ3p1VFdFSnVWSkJZSmI2TTFHK3g4TEg2blY5?=
 =?utf-8?B?dVhOQVV4K0ZJcXY4Mm5ONkk3V3d5eVo5Q29XUTR3dk9QeU9uM0oyRlBoSjZI?=
 =?utf-8?B?MmlDZ2tSTk9uNDhQOTEzdldsQVVLbGNOZHEwNkU2Ti9EZU5EWmlGYjMyWDIr?=
 =?utf-8?B?WkdUeWgzZlN4MWdNS3cybTNZTGI5anRKNU4vNHdOY29sN01QL2I4U3A3UG00?=
 =?utf-8?B?VkFOM3NyMDEzdTQ2Zjd5U0hZRmxDZVVuTUpkZm14NW1hdTE2cGJCeVRBY2Zh?=
 =?utf-8?B?aGJZa3VqSm80VG1pc1VHSHUwZ3VtUlJOeUxoM0tvUGNWWm8wTURVMTNuNXl0?=
 =?utf-8?B?VGNESUVZUGFjQU1iZUpzMzRDWFVhNWc3M0RFNHFZd1ZMRThCdVpkSitjM042?=
 =?utf-8?B?YW9UaDErREU0T0xpTjVBZEJMTW1CNDFWNDIwM1k2ZzExdytLbWl1Rms5Y2Rj?=
 =?utf-8?B?ZnZVTnIwVVhFUkhjZXRzRFdGQ2JpUG95c3JTTFoxcVJnQ2loUmtnOC82OU5V?=
 =?utf-8?B?eW16Zi9CMzBaZUpzSnVuNHVQVmg1OElYTUpBcGVKRC9CV0sybEVHOVpxZjN1?=
 =?utf-8?B?YXpxVEpIMWxHQXR5emQzNG9TelVTbTBZK0w4TUF6R25KUXY5eUl3WXhNTCt3?=
 =?utf-8?B?N005N2gxZzNhQlh5cSttV2pJekRBV0xib1VvbkFNQmJ5K0ZXc1l6MFYvVFQ5?=
 =?utf-8?Q?sWIbu/qUe9H9yJPbJ8XPN7M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc05380-b02d-4e7b-546b-08d9b003b487
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 11:07:01.1263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0NYKYjqcDsaRia0FA78mkp6tp7dFKm6JNDfK7ZwRlp//9Y3HZUOCrOllB/Yi64Z4GrtXgDdspHGqcs9UFAlLfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

On 25.11.2021 12:02, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> There are range sets which should not be printed, so introduce a flag
> which allows marking those as such. Implement relevant logic to skip
> such entries while printing.
> 
> While at it also simplify the definition of the flags by directly
> defining those without helpers.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with a remark:

> --- a/xen/include/xen/rangeset.h
> +++ b/xen/include/xen/rangeset.h
> @@ -48,9 +48,10 @@ void rangeset_limit(
>      struct rangeset *r, unsigned int limit);
>  
>  /* Flags for passing to rangeset_new(). */
> - /* Pretty-print range limits in hexadecimal. */
> -#define _RANGESETF_prettyprint_hex 0
> -#define RANGESETF_prettyprint_hex  (1U << _RANGESETF_prettyprint_hex)
> +/* Pretty-print range limits in hexadecimal. */

I would guess this comment was intentionally indented by a blank,
to visually separate it from the comment covering all flags. I'd
prefer if that was kept and if the new comment you add followed
suit.

Jan


