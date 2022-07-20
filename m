Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3086857B277
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 10:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371454.603378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE4pg-0007md-8N; Wed, 20 Jul 2022 08:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371454.603378; Wed, 20 Jul 2022 08:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE4pg-0007km-4X; Wed, 20 Jul 2022 08:13:24 +0000
Received: by outflank-mailman (input) for mailman id 371454;
 Wed, 20 Jul 2022 08:13:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H1QO=XZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oE4pe-0007ka-Qb
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 08:13:22 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150057.outbound.protection.outlook.com [40.107.15.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1b5f7df-0803-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 10:13:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4604.eurprd04.prod.outlook.com (2603:10a6:5:35::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Wed, 20 Jul
 2022 08:13:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 08:13:19 +0000
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
X-Inumbo-ID: d1b5f7df-0803-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbOCLNZ1K5fYKiflplWu6O5jiTOg1iurQ7rXgdmRRo3/gUVfHTeMsKv6eDR2uxgT5LDBr/SZhtr46OHF07YYZChV62GTU0tNR60lRxpQVkH5g2QjNwX4H7y9lDB5rnHMkp9WsXfx091lYSF//VakGEbapACDG5o+pkFG4vpMiLnm5ekfzugkp2UNFL+WeL8xa/9KYo2uqksB9x+MB/uyZ/cjdfdsk3WvI22KiSpDST/J65KjYfB9M+ZhpfZMMs2kZi9Cz4yFJgJz7b0eHjlQ2MTWwt1GU6NqUisLecMQeefxG4T1dMa1iJzuWJoNwJHLVyxOO/XrMDPEqFEUr596wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cA4PTsQ2pD7JPY5I47hxY4AHLn1jSjqv2mSGN20nFq0=;
 b=iHfG48mHnYC8EbQL4lnk67Nv2VBvsJVBDrMN/z6UM54KbsoCJGYy+pKOtptdMDq961GYLDFAg2OdO4ZvCQsh1h5vMJRUVMxPpDGGrwDDYtS5WAwGJvADzwDtrrKZ+ku4gPvy1oESHlvg30i418NZ101FdNj6v/xq7NCGeYjRi4W1hyO3b/6D1ucr+YQwBT0i5XKXdNo/0In36uHjRrGhuO0tZsHIdQZjwYn08NheyooEeeYhXBH1jJhjBC9Uqc4UiPt2Ib/fg37HUQjcJRY39iciI6+hFio+I9mOuJM1yLJAZaPJg5/1glV28adUSji599FuWSdyXzeQLIiXC7Prgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA4PTsQ2pD7JPY5I47hxY4AHLn1jSjqv2mSGN20nFq0=;
 b=VieNTRFh9zNelzwWraKMS+el2+ZC2Rqjk6zEpBwohvd/xqgsgf2rYIiMLb9tN8staY5ayMMLWr1nPOZeQGBT/T762i6cdeNDBSPlSDMynWMIQUNiKUBZNgmE/Y9Zjo78rMZVE9bu7ZN7gvfYVu7Z3KQZzZ6aUMTxwY7lrEXBM/PHg2dRp/SemI9g943RvLcNlioJqoj8KAKAoPBlXHy22ObhzDkf5IjFKpf6hog3hivN5WT4PJ1r1duS85g00UCxAphozAMQizL41rH6m5CUg7f9hLebw5zPy2B1DGEC4TmhhYZd7QqbAkcbCGyADf24au4zFKFnSh7awEyj9yfDXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a485f128-6caf-4f4a-3d61-423e2ee67121@suse.com>
Date: Wed, 20 Jul 2022 10:13:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Ryzen 6000 (Mobile)
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
 <4c3976aa-dad4-2707-2852-9b26593692d0@citrix.com>
 <pDQL7BhwlO49buWymLE-VFEZJim7qNeMmAeThZgHF9qzcbNbQ6ZoSXktgD14I_HYpsdxqfCugrNoJ227u5DLCWEEXk_h9c7bf4iKdgoQbQ8=@protonmail.com>
 <b3e00f33-527e-e29c-87fb-0773344aa1f6@suse.com>
In-Reply-To: <b3e00f33-527e-e29c-87fb-0773344aa1f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c50d7c5c-39d8-44f2-f744-08da6a27b4ce
X-MS-TrafficTypeDiagnostic: DB7PR04MB4604:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RaDqZMBx0i6w7lh1Z6dgFVu7LyHFzUmL6Vn8fK+NwZkM/YrWH9bNTllO9jzAywlhRar1jLEBH3PXCuGq9WyZdNmbW4j+XYNoAWQ3mbwemc5K2O27C0LFXdZaQVrFMLRuKFxeWR6aYRP2pWl+bcBjMRWWbyyM5tUPYbXgQmyfQHHssZR6ii4zoES05JAVGTxYj0m5cvsRtpLBCt1u74fOeIQcohk6vUB/DbRv9Q/PxH0vWZ6vUtEbwVfgw35QVqpi/8sRlttyg04aLikRH+buz/8nVmwgIqKOwOoM/9ENYYQgeRYi2JIju4AoM7pJ4Rmj0uAL6Q02jBirjFAxy91jDwBUsf+9iXxlNXF0Yg02tto5v+6BJoigGr7Tu6FkOgJcF9C5N8TPY6ZVMRXRNmT61v9XpwkQNO2dGWXWQY6O1n0XRYYQm/uL/2vQPdnVBcd//owu5q0QH5HrgGUjZMUrHT0CuWzCaPUlepqXbEn2kFIX+55gGxrkfpPGZx6Ihl6zvIJEBDDXTAa2hv9+psZ/MhXdNwc1ZkObqN7prznQu8GJ9dNkIx8ZO8KyjKfJgKPEQwjIEI0wNABW6QubpGjbriFl/acYSNCSAGtp7LEgTW6Yj9s4miBlENzZKuwYd+9QzSPNPQBjGFBWwT3uhlNhjqDMn5ido401Xaz4wEL79U+V4Dbi/5fm4dDgksNmBkr9m67fuxj9zygTKpJcwqhHwevhvMy+kdIbaIgmuxXWw+GDE28U/flN9W/5ipQlPnaTlhu6DDxguTnUX8M5BsmG4rgK0q3PjyuB2g1FvwTIE/rmisPrxfMVOk6r+FOgpZ3sc991KQIJSVD7FYgg1kmrPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(346002)(376002)(366004)(396003)(6512007)(6506007)(66574015)(2616005)(26005)(66946007)(86362001)(6486002)(36756003)(478600001)(53546011)(186003)(41300700001)(5660300002)(54906003)(6916009)(316002)(38100700002)(8676002)(66476007)(2906002)(31686004)(4326008)(66556008)(8936002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UW1pZURVQk14K1FlVnR5bHRwbHV6OC9yc0E4bmM4clV3Zm10bzJIaVNjZ2FV?=
 =?utf-8?B?cm9yNmpCYmc0K0lOS3gxc0YwT3RSSmlFNnhLUWswcWpBbTFpWDg1cU50S0VW?=
 =?utf-8?B?UlBxYlpxUlVBaFExeHVOaUY1akNGUU8wWHM2L0RHczRHUlcwTlZ2N25UUjhE?=
 =?utf-8?B?QWYzN0F1VDkzTU1STzRxcTZxYWd2TUluK2wxdU5aTEVvOTNsQlo2M2FtTUdX?=
 =?utf-8?B?YWk0S2FnZ3NXNUQ3TUpvcVBMaUttaWtob1pGZzVSeTdzYlJaNjBxOExDZ04y?=
 =?utf-8?B?WFY2UGh3TDJRNzc0dGdIcGxVK1BRdkJWdjVwSVlUdnZncVpUU3FaYTkwdmM2?=
 =?utf-8?B?ODBaSWIxek84djJPckU4ZUxIYTJMdHJDMlI4cE8zem1xVDBXTTBiUithdmps?=
 =?utf-8?B?cXNaUXl2MzlBT09neUdWaTJEUzQyYUlCSzZvRmE3RWFoRDlzOWltV05kUUlE?=
 =?utf-8?B?V0lydDFJV1VINUtsYmNmRkNmc0p5eG5sVzZuU3RwSGF3cFd5QnRaVFNUUnlx?=
 =?utf-8?B?bDNVMkhhSmFpSnVjZEVWZ2VhOFhDMGN0dVByVkF3blU2V0QreDRLMXgwZ09v?=
 =?utf-8?B?SEF3WkFhcTVCcFl1bDF0dC9NTGEvZ1dNeHprNURqZHBBbHFmcFgvOWRrVTdI?=
 =?utf-8?B?emUxby82bXRVckJWaERQVmxCZHJJcnZzbDhoOTJBK2RGclQzb1BVK3FZQ080?=
 =?utf-8?B?ZElvbzF0NlN3d2pEVjQweHhQdUM3ei91cjlwYjNmQ2Q4dVRQakU2QXVDOEl3?=
 =?utf-8?B?ZFdzeUNuRlNRYlZ2QzlxZFBsNXlha3NNci9nSXlPQkN4K2IrR2M4OHdudlB3?=
 =?utf-8?B?S2EwSHRxaEd4akhGelIxOFRZUUp4b2lyK2IxRFJySVRPR1BiUGhBS3RqbzI0?=
 =?utf-8?B?YjJjdzdrZlpCT0FYVWdRYXEzYmVUMVF2YXZIUkpIdWFMVjUvNmRWcW9XWklX?=
 =?utf-8?B?bVRYNlRSNi9HdjBBOW5PSmNxRG40MmJoNXVlT3Vuc2M3K2lNOC9ZOHp5MXR3?=
 =?utf-8?B?R1dma055NWVWa2Vra05ubExJdkNNS0NxSmN5MVZjbzAxZkJaWS9sZWYrZXJB?=
 =?utf-8?B?RThneml2VnlRNHJEQnNhWnY5VmpDaDRuU0JMLzVLMnBxZFpHVnVzOHV1MGd6?=
 =?utf-8?B?aitBS0luSElYcEVsSWhZYjlDd2N5TE1CUG05OXdtaXplVnhpYXVGNDZSem5J?=
 =?utf-8?B?d0FhZ2Y3a3J5bVdqakNXZ2R1UnZKK2FKWi9OajA0bklhTEVXMlZCa0JJVFkx?=
 =?utf-8?B?bzkyVmE5Z3hpNWI2RnVLU2FDamhmeS9xU1NURHlKTWx1Tzhxck1acWN1MjA5?=
 =?utf-8?B?bjlIa2tISFRCbm92dlA5ZVhvakZlQkpUNDh1Rld2TGhnUnhBQVEybzB0VTlU?=
 =?utf-8?B?bUlhd2tCemhsenUzODM4d0hRWFhidHphOUZNWFFCN2o1VDNSV0paRlcrR0JP?=
 =?utf-8?B?OGp3VkQ4VWdLbVN2Y0oyemIzY3VxZ0ovOWFRTHVla1BVVjlwdSt6WHMzUTBC?=
 =?utf-8?B?TlZZTmxOWEl4MmY4TFFHMTI5S0VublJnMElOYy9LRXZ6b0U4cmt4eTRGNGZ5?=
 =?utf-8?B?Tmh4TFB5cnR0YjE3MjZlMWwxRnV2anZ1bm1ZWVowajEvUVRxK3dVMExXNDRE?=
 =?utf-8?B?TWNQclJHdnhveXNOd1dDVWdrQXhlSnVqektQODlNeXN6OFR2c2dKbCtabkly?=
 =?utf-8?B?eFRiRHF5dUVTSkswT2pLcDVEdElmWUJ5TWpTaE5vbWdxdmtBcGt3blRDbnFY?=
 =?utf-8?B?bnd1UHMzQnFTbEF0VWxoajlrRjJpb0NWT3V2QzdUb1lLMVNuM1dVSDVjYThz?=
 =?utf-8?B?VnE3QkxVUXhRZE1xeS92TEowS0Q1U0E5MDVNdktNSzNoKzBLeVV2UG9JTDdT?=
 =?utf-8?B?bjZFVE9TbFhOU0ZrWjVUZndWblY3TXNHL0JMS21xa2JjVnZDZmVyRkpGTVk2?=
 =?utf-8?B?Q3psL1hPZXo3b2l4OXp2eDJtRWhMWXViZ0dueFVMb3RmOTRKbC9lcE5pRE1F?=
 =?utf-8?B?OTd4eWphYXcwNG5ZcDZiSWU2MCtKV0Q0S3RXT2lLQ291WEVKR1A5L2RlOW5s?=
 =?utf-8?B?eG1UVitqVzdDdWtteGh1SG1VTy8xRnhRaWNyeXZQcHAzOUtZVytaelJoK2Ja?=
 =?utf-8?Q?rFqYvt+9cVXnhG6iY+yr0GMoC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c50d7c5c-39d8-44f2-f744-08da6a27b4ce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 08:13:19.7171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+xVtX0n4CLg7xVcWnUDwezjc0Tq3+LE8dFq/r2boLINwmUn0zGvCxQAgr58tt9EC3YSOxLHQW1FT0uxehiVNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4604

On 20.07.2022 10:11, Jan Beulich wrote:
> On 20.07.2022 02:33, Dylanger Daly wrote:
>>> I'd focus on the booting issues first. And I guess you can take a video
>>> of that (assuming that a single screenshot likely isn't going to be
>>> enough), possibly with "vga=keep" in place (albeit that introduces
>>> extra slowness)?
>>>
>>> There's also the option of using an EHCI debug port for the serial
>>> console, but this requires (a) a special cable and (b) the system
>>> designers not having inserted any hubs between the controller andthe connector.
>>
>> Do you know if it's possible to have `console=vga vga=keep` and specify a secondary monitor? This would be very useful if I could have Xen log via a secondary monitor,
> 
> No, if anything it could be the other way around. Xen wants to use the
> (sole) VGAish thing in the system; Dom0 kernel and Dom0 userspace (X)
> may be happy to use any secondary (non-VGA) graphics card. On EFI it
> might in principle be possible, but that would require (perhaps quite
> a bit of) work in Xen.

Oh - and then likely still only when there are two gfx cards in the
system. Otherwise we'd likely get into card-specific-driver territory.

Jan

