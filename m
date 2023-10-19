Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489CD7CF3B6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:15:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619017.963481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtP7B-0000MS-I7; Thu, 19 Oct 2023 09:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619017.963481; Thu, 19 Oct 2023 09:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtP7B-0000Ki-FL; Thu, 19 Oct 2023 09:14:49 +0000
Received: by outflank-mailman (input) for mailman id 619017;
 Thu, 19 Oct 2023 09:14:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtP79-0000Kc-8v
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:14:47 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe13::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f23e11a1-6e5f-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 11:14:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7899.eurprd04.prod.outlook.com (2603:10a6:10:1e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 09:14:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 09:14:44 +0000
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
X-Inumbo-ID: f23e11a1-6e5f-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loCPZ1j7b7uDxTHr+QFhr/JGftfvughUG392jLL3AUM1WNZCkRfqLpNpAIY0mGwcEpue3+On0UFFwoEkV13F6zznfg7dcszdrNdBoXFv0oiApYJG0cmIIWX5dZqvBOvr+REvSaglonZ48Ksh/89Re56TeZ6/ENMmL5gVuJtmSvon3Idg6x6XjYUzdIA97x17tV6n8fLtPiN82DvdSWWHBFsxoJuUvTW+Ete9pwVplpd6+fe8F2CHDEGt4aX6TRgc0zO6zWMaquhOd78gjn9buZmu0zr0BiSk/wcWf1o6Uv9Hk/+VPOiPmRgpLsd/5vZ9gu/bjYjEi1b/hmLe76Oi1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r++V9lfQ29gh4CO7YslRm56X49EXxs5HjnB0TpT98Ds=;
 b=X7OQyaFT3mAlECStReTEsLaEFRxSYH+++wqNIxk3gqO5pn5mGzOSZRl/yXLqrB+QHP26A/O6AAZsArEGteoA8QseyFVZfkHzuDZ0d4eeX/er6Z7P/LM2bpAYP5xxoStXZvUE6r8ZHX+jDd0k2jBhbgt2ZfXLSRZsBYW9T3XD1qt0mTpW3wyTjjrYkUKU0IFCds0Eydth1Pulnh6jOIO9JtcN1e2GG1NryUCJTyxjYtDKp/yMpE9oOmVvxSpWrFktymxuO4zFoKklJNUWFRbxJex+nzfLk2Rd5EfE7HdfvdjXG4F9CmoDyL7muChkKo6Ms5X4ygBwSWZ8IJlD2T7EFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r++V9lfQ29gh4CO7YslRm56X49EXxs5HjnB0TpT98Ds=;
 b=08RKDupaf6Wz+WPnk8qELfGXWq4RljisH+v5MJz876W1KBc+QegUUJLZUEBNN4ZY0CB3YlFacsd8bVrP37LTfZLC1K9tULEOtSUMHc90O6brCy1ODhcWieP7An/Z6i9d4eotyTuZ216v4Xtc9rJgUvyeZc1YG9QzBh7Q1SskEijkgGR1OylNLwIdiGBCdbWDqxXwDhYFi9qfOyk5JkggpUZstKs8jlxwlGt+FTvuJo1gGSNRGqfmnl5AHCfFdFnGWm65zh+v+1cPqNs9TNF1FAE3iVVEgbuw/OJO7C1yKACjFHQKj5C57LDiq8QPiOJOyLJ8FEl5EiOz4ae8H668qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a20f5783-7ee3-6ed1-d4cf-379c30c64a12@suse.com>
Date: Thu, 19 Oct 2023 11:14:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 04/29] xen/asm-generic: introduce stub header device.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <3cc9ecc3abcd21c5ed7276b01bf5963e6a5fd5e0.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3cc9ecc3abcd21c5ed7276b01bf5963e6a5fd5e0.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1faa6b-1c07-4ef3-a854-08dbd083d54b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XZyflrlox+WVTDKsJzl4LLiKug26q4rvG+q7zvr1AX5G5cFj5BAImqdOWDnQbWo67KZ/Xjvh8cqA7AkkYYyBCEuHGJ94X/tYx8FynVZZ9nEPvh1ks7TAXgJLFZUejBe5MmWpBNzjSZ8PDwAXOHqZ0iIOxUS14WOysJwdDgn6U4xTsP7veBC5Rr/oQmyYR0ia79++5r8s/uJKZnlaF8ftXPJqfjTFaijmAsrB96bhou+e/QIAEdTumhX7pwNqurNujGdGhS3whztzuVMK4wTIyCveF3wN4FLs+pqehsix4Gej2IsXkj7pbI4I9zx6dso9uiBaRRqjtfTw6JoIp1CrPLmtoxjTbqScFo0TX9Tg5lpef7pS6rcNWe5+vs3XRSBbYRrwvb31NqJHSTCrKT/4tz+Qlr26daXDDsDbCwoqrxfdRhhZeMW+Ilxt4YoiqTDg0iuMosvwZ9NN3NvERUNU3w8RfQ9EwqPkZZwQJWbaAA94lyuCqElPBW8acephm8ogxvs9QQbVGijYmpuB2ktHaeAx0Z75swktq4zqgMS48N4Vpxtn1bqBKuYbRa9COhQ2lLSkaUMk7B3UG1LqVNtipxNVgtWQ0RrPGVAf2nspiCs8ZDoggfScog9DrptbUHQedcFMjDLU4QdXVEpcJDSUT+QhU1pNdc+V8o/3S0DZiDM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(136003)(396003)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(26005)(2616005)(53546011)(41300700001)(2906002)(4326008)(4744005)(86362001)(31686004)(36756003)(8676002)(31696002)(38100700002)(8936002)(6512007)(6486002)(66946007)(6506007)(6916009)(66476007)(66556008)(5660300002)(54906003)(316002)(6666004)(478600001)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUJ4QU4vam1iNWp2U0JpRlptRThrTDU2bUZrK0hpZTVaa2IwdUQyRmR5ZDN6?=
 =?utf-8?B?VUVhTFh2OFZwTFd4V0RUU1loMkZuOVdES3JSeWxhbkJ3UlN5dTF6WUU1ZjhX?=
 =?utf-8?B?RnVsbUE5WjFjQUN0TERNMThGVWpHb1NDTnhYaDQrOFMvSjdhYlRObGRVOEZl?=
 =?utf-8?B?T1BBT1ZzYUhJRFFOanJrMFJpSHh1Y0FLMCs1NEY2YVROUXMwMldlaHloRHVL?=
 =?utf-8?B?SmNtS2NjWUJmeElPZ1dYeHU3b1hXQWFuR3hHdUorbXFYc0V6WTdsQzhIck1T?=
 =?utf-8?B?dzVKTVV3SXVCcHBhbnNhVFdTa0pKRGlaMFFwTTBWU2N4QUt2NmFxWDhjTnRF?=
 =?utf-8?B?NytDQjZaTjVmakxtRmpZMUVINjdkV2U4R09qN1JLRW9jUFoydXh3Y3NOVCtx?=
 =?utf-8?B?MEJRaTR5QnpjTDI5aEF6WVhiRktXUmMwVnNabUdFZlF2NmpjTDZuTjlPQ25P?=
 =?utf-8?B?QlZSUFMzV3p4Q3VZNldYSWNscWRRbyt0RHhldW5mbzhTR2ZFVWRBTmVLTkFy?=
 =?utf-8?B?L1p3eCtlQ1M2aThaVXVXTmFXSW8yR1RtMnhzcHZhaTN5OTVYQVZsbjhPOXcx?=
 =?utf-8?B?TmVYdFZiSlk3dkFjcktRdjZzRThoYVFqQjhGeG45ZHdZaHFIS1JLeDZwa1ZZ?=
 =?utf-8?B?TDV6bU81MHNINUU3bkNodVhiTkpXZklUMUV5SmZCb2NEUlAwc0dmV1l1VEtS?=
 =?utf-8?B?dXZsSUh3YXoxbEtKTVgrRmt0NndmcFljYmYzb0xYelM5UnFURVQwVmdpQVRp?=
 =?utf-8?B?aWRWanBZT2w4SURBRmVHVTVYVHFGd3FCSE5zdGdFUDE4bExpL3NCQnNNNlcx?=
 =?utf-8?B?bm1Yc0pUQkkxUVl4a0d6M2J6RFdva2hSUlZqM0RoV281ai92Y3IyL0U4c1FI?=
 =?utf-8?B?d2NvMThiQVZrRUI5c0xCUGZDb1ZNaDc2bXdaeXhSTFZDaVZTcTBJSlhTQjQ4?=
 =?utf-8?B?dUNPWVI0QmpNYTlQRTEyOU5wV2xwd0NUaVB3S2xPa0tGK0Myb2x1dGg3QjFo?=
 =?utf-8?B?WmxsS3pKRFJQQ2ZiR2FaQm1XNmhYcWdvRWtRSXJJRERHb25QYmhzYXIwUjZ1?=
 =?utf-8?B?WGNTVXRxMjNsQXdWVG92c2pkQkhkQ2h5M1hDWlRwM01tc2JIajRhZ2JrUXh5?=
 =?utf-8?B?RHhBMDhTN09RL28xRDEySWM5NTg1a1FHcW1KQ1ZReXM1YTdKTDRGb3ZLMFFX?=
 =?utf-8?B?cndZaUs2cFhWU2ZYNU5nckw5T2dlbkNhMnBFV203ZGZWYjRkNzNvaGhtbldF?=
 =?utf-8?B?U2srOXVSeGZhV1dxQzhkbExCQVdmR3JUTnBEd3ZOeXFYS0kzMGhRWHpiVmc2?=
 =?utf-8?B?L0d2STRwdVo3T1pDKzR2Y1pZeFBBdy9PYTNWNnYwakpuY2tkNDJuSlMwQk0w?=
 =?utf-8?B?cWxOaHpCbHQwbUNSMXJZYUNmcUY4TFQ4OFR1dVM3ZVdGT1g0L2Z6T0RQNkNs?=
 =?utf-8?B?Um55Rk52L0ZDczQ1Z1JITDVuNzJMUXl0UXlZRjd3QXdBU2pCN0xJK2RBbUR0?=
 =?utf-8?B?QlRGcjRxL0V5M01kbGYwUEFWVHVDR2tCeDM5VWxUQXpIaDBhQmQyUFZjWUtt?=
 =?utf-8?B?SmpTcUM4ZzJPK09QaG0xbVlSSzQ4U25rTjNjU2gwUWdJeHh6bVBMMXJCaUZ4?=
 =?utf-8?B?cDhMeTY1Y1lzZmlwajNqNVhYbi9ub2poeVhDeS9FZHc5NS9pdEJ5cWlpTVJv?=
 =?utf-8?B?L0VnODE4QkpqL0dYMVdYZ1czVmxUUXBjMVNsRlBxbXVOVGFpTHBDS0ljbU5j?=
 =?utf-8?B?Ui8ydmFudGRZdm5kTS9OMUhrQUxDWTQ5UEIySUJWdUZsOGV2d2lMdHRpeStY?=
 =?utf-8?B?eVpVenN6c2xaNHVaQnBJYjd6VzRwSlZPMGZRT3RWSGVuT0VMMVE4Qk1IZjVQ?=
 =?utf-8?B?VDFVVGZzZmlHMkhBRGFlYy9UVmowQ1E3d0tlTFFwOTF2bjZjSVFhNzVWMjlk?=
 =?utf-8?B?T0hQOHZsWlowdEJKTUdvZzY3NXJQNWhiSVlObjEwNFEzYzNwenpZMzZ2RWVw?=
 =?utf-8?B?WXpGYnYrUTNxZWJZZGYvRFdBT2lZOURMV3VxZ1k2Q3oyemI4ZzF5Q0lBZUw4?=
 =?utf-8?B?Y010clpmYzM2Z1IvMGNhaXVKWUpKUlFBSHRHeVlIc2VrcUF0TGJuTkJENHNt?=
 =?utf-8?Q?8w2Xc7lw2tZU/L+19LSt08WzC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1faa6b-1c07-4ef3-a854-08dbd083d54b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:14:44.3344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVuIt304T48G+L1DCwjb1P1zlm/vtEnZ/N2C8/bemGsclZtBhh1V/VYdBoxWJuBXAPx6T1k2Ifq5UQQyaExEdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7899

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/device.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_DEVICE_H__
> +#define __ASM_GENERIC_DEVICE_H__
> +
> +struct dt_device_node;
> +
> +enum device_type
> +{
> +    DEV_DT,
> +    DEV_PCI,
> +};

Are both of these really generic?

> +struct device {
> +    enum device_type type;
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
> +#endif
> +};
> +
> +enum device_class
> +{
> +    DEVICE_SERIAL,
> +    DEVICE_IOMMU,
> +    DEVICE_GIC,

This one certainly is Arm-specific.

> +    DEVICE_PCI_HOSTBRIDGE,

And this one's PCI-specific.

Overall same question as before: Are you expecting that RISC-V is going to
get away without a customized header? I wouldn't think so.

Jan

