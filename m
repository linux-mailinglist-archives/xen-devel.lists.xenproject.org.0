Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E02B587BDF
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 13:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379278.612597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIqY5-0007TP-L8; Tue, 02 Aug 2022 11:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379278.612597; Tue, 02 Aug 2022 11:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIqY5-0007RB-Hz; Tue, 02 Aug 2022 11:58:57 +0000
Received: by outflank-mailman (input) for mailman id 379278;
 Tue, 02 Aug 2022 11:58:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oIqY4-0007R5-2W
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 11:58:56 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80041.outbound.protection.outlook.com [40.107.8.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b4c898f-125a-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 13:58:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB5707.eurprd04.prod.outlook.com (2603:10a6:10:a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 2 Aug
 2022 11:58:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 11:58:52 +0000
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
X-Inumbo-ID: 7b4c898f-125a-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Erdpbjagjm7TVtT8Lk2R5W/usd/9ghGFtyDJSlrFIrNkoH5yO7fxoK6z5sKdYMLdrdMQeMYqxd6j5sGIORY7tHNZIbGm5WxmDf+mBciv3kz+6jRHTxkch+4tITl24fbgX3+dH17aPfA7HyeYm+NND9DsLpASkDwZn5yScyV0MHVHIYp1BnyPVNDYPiFET8MtvuD3NM9zbU521es5cAs9nFC6UUNsfUZ19tvyw9gn8ATf4nxb9+kybPbztRPStvShBPsf26bvSPehpLir1VpFbISZoAmTm1eZeiUZP0SM629VNdbywFLcg8BnVWQZiDzFlypiEqfTt644GCfqRBNPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykHvslcbLjhvOfik3wfqAtqR9v6yDseQUZNGdFn02SE=;
 b=ntsrrzAHICYv3AcQHGaI/dNbTZc9EgqnfJkAfe48wafKwVEFxyZdxhG5r7GkPYJV4lFge28WCTXGHB5J2fNIAF2b424frcjUuLA8cuChov9MjwIZOg6y816ubgNskZP9ldBEoq6eTn92eQSRl5gYIeWnD1LZCjzymrUqSHpr9WAkAdw1pqt46aVT0rEDOHE8TmXL3TYJJPtQcWFZSAA1uQnk3lhmmcoKQUGeQDyinGl1wj4Id461TKJDgy2djANIyjxvBwA+fJ9EJxUPXk32po5cIiNF4AU9P5gmrDXCvz3ZY4GYGRh2hsSmW76UDYVf4MwExpJMD0bAIay+CB9LgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykHvslcbLjhvOfik3wfqAtqR9v6yDseQUZNGdFn02SE=;
 b=oM1Dy8ci7m5MUugtFLTONR36F/Ruh0RUIX4Q0lmhxZ1xyAXVwqgMT5APFQTT6iRoNzy//optbkfW5LWQOINopcW/JbkrG08n8AbtUpxAVtdJtoqNR39a1QfS0pa79rFtzFL7lp/AhJ2UZrxMiQZ+p6TRDp2cqMTXX/aHxnxMGXnUMuKpKe0BOQEGsURMGgySTIMV1Yda2aW0GCm7kl03Ji7D/QaUi28VAgiWbD74UoFdHOciJvI9FToFtjIlJJp+U4rPHpy6JVo1UvPTANmptTC1tIfuLl/yLOnofevpONSilO7tObSxrMRtqwVzRGNwtPjSiEWOCSPBhQ+trupidw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e78d64a-c700-5846-f046-a1b0f2c98ea3@suse.com>
Date: Tue, 2 Aug 2022 13:58:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/char: imx-lpuart: Fix MISRA C 2012 Rule 20.7
 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220802075433.1748035-1-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220802075433.1748035-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ee7d79c-8046-43c6-9334-08da747e5e67
X-MS-TrafficTypeDiagnostic: DB8PR04MB5707:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s0lQNDEXGJW1M/lK7R3u+qsTxuc3bC4FG0Ohqo9jBB8TrvqdBMjWna/NlI2f/jtXr63Sb6vIOZ792K5YVIwuR/GWkHPz153b7mn3QhQW2Kax5CYUGUgdnaIyUDE+vt0gAbuMaE/fk2G8sqZZovkbI8VtESyY1A5uxwzdHHHAmyV/zplOARDeB93i7MiGJg5YjuyxoIfHd7WIOien6c2dt9QacBW25zF9rzAdBicxge9v1RRWHN2AnyghrIP3QEYtni6xK+t/HoAEnR5jFarGBPKpWMe5eSHBOEsVpAc23GKaWmoJ4wpix9OOMRxaMrAqUrzGPHwTvnVoYeDiUL7uQbvKxHbBEWaqGayYD8SKdfhzWz+UwcETczY2RTUAS3fMspkOKE1HCl2rMTJqxxCozOoaTLd4mZFCnNxoZy/4hWlYaFO2FPYSGp7RdF5Zp6FnitLiVj+cKURgBRa4d7y7MoO2jjl5zePmX0BGEWt3lpliIMvrHvYf/f9cV+ZsRbtTgrxzgLln0X6jpOk3DfnQGwyJjBgPmQhiEtDxp6Z6Z7b2N82+l8VYFt6HQZYnR2fCw+vfWCxD/2cu9asyEQ7Rti5oW1YIgey5uOkaJ003wIwl30uA9BxiPEwa+gTdxP8BM5jXsfsRALM9q1W7H0patjkacl9GqWMNpI+dfVQY3qoLOsKLKCwgT86nJvBRH6rY+TbFxbWE77pJ6tbHqOCZWy8iTGQaGlQTclsl827n7HN1cNZoLzCr3bs82y9S9pbF8p3FQ+0Da5dMlfgICvMWfuPqHo8ZTbjhwwZm522JFMkkilN+YiDyiuqF6GLeEu8tRrg2tQfkUbkL06f+63NDOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(366004)(396003)(346002)(136003)(36756003)(8676002)(4326008)(6486002)(4744005)(6512007)(8936002)(38100700002)(6916009)(54906003)(31686004)(186003)(5660300002)(53546011)(66556008)(66476007)(6506007)(66946007)(478600001)(31696002)(41300700001)(86362001)(316002)(2906002)(2616005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE12aCtSY0U1NHhXbG9Ja3dpS3BsVUdYRE9KYTFmUjJFZTE4NFZDVFVGZnhQ?=
 =?utf-8?B?SVZqWjVJeEJnKzE3cFFaN21ZWEVPelNOeXNWZ040S3pKOHMySGg1eUdCZXo0?=
 =?utf-8?B?V2t1VkcvL1BwWmphZmFrbEkyR2FCcGxIcnZ6VGJZZDFpN1UxbnlxYm9tVkd2?=
 =?utf-8?B?UW9vUFE0NitTbmpyVk5RZkVpRmZTRFgzbW5KaisvOFBqR2t5Mkt2YkJXVE45?=
 =?utf-8?B?ckdMMmp2ckR0SldIbzlTU3BTN1RYTXRIVWJFQVNwS3QwYklBN05EcjVHTlRI?=
 =?utf-8?B?QnNteW1LRFdIUTNoTnJYR2xqemxjeGg4WnVXdlRyY3JLUWU0ZlUvdDVPSVpL?=
 =?utf-8?B?Nm1xb2lTQmNqS3BuMHVIQzVhWjQ1TGV6ZUdLRlVMblNuYkxnNEhZZzZLZzFW?=
 =?utf-8?B?a010U2lpUkMvcUxzcXo1dStlWi9zQTRPQWQySlRDZitaaWJ1OTFxdmxVVUNu?=
 =?utf-8?B?TDNSQjJudnJHMnhWaHBqRUgwYWZQTDZGV004Q1MxM0M4TlFjT1BtY2NIZU9D?=
 =?utf-8?B?YXRzbFIxQU1ZWWF3dzN5eVNmRGVJQ2ZnRXYzYVMrcEsyQmdUbXQ0TGIzVnd5?=
 =?utf-8?B?RHNKNGVtbGs3Q1l0dFhrUzJDV0pCYWRmS3VreCttMjlxalk3Y2JNVERTbW1F?=
 =?utf-8?B?Ny9lTHhnWGkwM21KeGpIeFBsWjRtbGphK0h2eFpPQU9mcjFNcFcwdmNSRkI5?=
 =?utf-8?B?bVZqZ1VkZnovYVl0K1JtbDVNMXkzUnNjWDFLa2N6UmdhSnVicnRzMU9FUk5h?=
 =?utf-8?B?QUpneGlybk8vblR5VUlXcFJ6RG0zUjJ5Lzlnc2ROY21Qa296eW8vc2hOUFZY?=
 =?utf-8?B?VHhDdHdmd0M2dEdkT3B0YWErY0EwWUlGc1VQSWUwazVSSWliZUZDUmdpOXRU?=
 =?utf-8?B?YUZwNWN0L3VXSGJUYkQ2UDVRdXg1TitSajFuckpLUk9MZ1doZlZpeFRqQkM1?=
 =?utf-8?B?WmN1U3QvMldDdUFjSTlrNW51d09aMVlZaE13Zk9Nc2M4Y3ZHOGhqR01PMy9P?=
 =?utf-8?B?ZDV1WUV2UXhmOFRNMnlNUHNOZFBMM2E3N1A0NUMxSy80YS9RUUpuc0p4NWp6?=
 =?utf-8?B?eW5JVU5JSkhRNDhUSVEyY3NjdUY4bFBETHVqY2ttNExWOURzMkgrdy93a0JE?=
 =?utf-8?B?a0JRUDl5QWkyMS9RTnE4MFdUY2lBUVM2VUtpdlU0MmpPai9WNDlwNC9lcnpU?=
 =?utf-8?B?RDdVMTErS2hmQ1l6dVkxc1d3SUZmdVp1QnVpcS9QY1BDVXg2SFkyV3d0R0FE?=
 =?utf-8?B?UExyQVVMRENhNGdicmltbTlwcEZMOWE5S3pZakE0OWhjSDZJZzJkcW9FZjRQ?=
 =?utf-8?B?amtFcStPV0tkeVlkYVk5YmZUSGJwektydGs0aVlaMytBajA0SGU2NFpMN2pV?=
 =?utf-8?B?Qm1VQ2k2ZHZUbVBaTDV6b0lZMDMya1pmWm1VelVDbktwbmF6QlN6b0ViWC9w?=
 =?utf-8?B?LzNQZ0hBd0RyN0RJalQvK3MwdC9wT2VlNm5kUXd1MDRmMlREdmI0Sk9kdkEz?=
 =?utf-8?B?L1BhbURib1BDemhGL0l4Z3A4bS9TWklTLzJUZUlqelMyWEpjQndLQzNQTnd1?=
 =?utf-8?B?WjZzME1QVy9YNWpSU1J5SENuTFJkNnp4U0FUQU0wTzJpYUdlUEgweElsNkpK?=
 =?utf-8?B?Um9vS1NhTklhZmo1dGVLeVY3b0lXWThid2JOdkVEcnFERXlvK0lHd3hoMGxN?=
 =?utf-8?B?RHl4VU5zdGhFd2NFdUd6NFZzYzU0SW9GbGIxOFBEV2tzWnlTbmUrNDVlK1FT?=
 =?utf-8?B?WjZLSmg1Vjl1bkxkTCtzT0c1MHg1YUhOaUhZRi8zLzFaTkxCMExKdDU3ZFFM?=
 =?utf-8?B?QmhWRVZ5TFdiMCt6YXhDK2Zxc3hXTmFabHFycCtyUVV6UW15ZUZTeW5EZy8r?=
 =?utf-8?B?NS9yUHh4QmRCekVZc1UzTTlxRkxVaVlSNVZ3aTk1YmNZUTNQSzlCUmtWbEVZ?=
 =?utf-8?B?WUxnMkRPaGNZWlFKMVpsaW1MNTJUNm9LcDZwNEdqSUVZdWNqV0JXR2pFcEl3?=
 =?utf-8?B?d2xhNXd3SWQwSUFmeXlWNTM2UCt3c0xzRVgzaHFETDBhU29GK3B1TVVKSU9N?=
 =?utf-8?B?b1RKUXJnR3BtcGt2UEhNMlNDYkc5N2czLzNWNTdIVWN2eEFFNVYraFZpd2sr?=
 =?utf-8?Q?F4ustPheHJuAoZxQvkps0Z7HF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee7d79c-8046-43c6-9334-08da747e5e67
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 11:58:52.6456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nxd00ylPDCB0nptd1tzotFSpqnHY5dyNpF9WZsicvH0kpkIuDyXi9DuP7Spdo/96xdFI1+QbTmirMeBskmYkAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5707

On 02.08.2022 09:54, Xenia Ragiadakou wrote:
> --- a/xen/drivers/char/imx-lpuart.c
> +++ b/xen/drivers/char/imx-lpuart.c
> @@ -26,8 +26,8 @@
>  #include <asm/imx-lpuart.h>
>  #include <asm/io.h>
>  
> -#define imx_lpuart_read(uart, off)       readl((uart)->regs + off)
> -#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + off)
> +#define imx_lpuart_read(uart, off)       readl((uart)->regs + (off))
> +#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + (off))

As elsewhere before I think at the same time you want to drop the
parentheses from the single use of "val".

Jan

