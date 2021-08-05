Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 733D73E180F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 17:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164417.300709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBfL5-0002zj-A8; Thu, 05 Aug 2021 15:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164417.300709; Thu, 05 Aug 2021 15:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBfL5-0002wi-6M; Thu, 05 Aug 2021 15:31:19 +0000
Received: by outflank-mailman (input) for mailman id 164417;
 Thu, 05 Aug 2021 15:31:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1FJ0=M4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mBfL2-0002wc-Qx
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 15:31:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46e9873c-8ed0-48ef-87d0-094a60684e98;
 Thu, 05 Aug 2021 15:31:15 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-anFD85stOd234iTHsI2YaA-1; Thu, 05 Aug 2021 17:31:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4944.eurprd04.prod.outlook.com (2603:10a6:803:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Thu, 5 Aug
 2021 15:31:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 15:31:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0259.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 15:31:10 +0000
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
X-Inumbo-ID: 46e9873c-8ed0-48ef-87d0-094a60684e98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628177474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b8lAwj2+rhV6+WzErBY96C69wzTTuWdoISGT1wZHX/s=;
	b=ieRDev9Ub7qlTK3/pbIYQbehqw4uC3CMbW3kJNUWZjQ7F5eyMkBzz1tmJr+myyn1zJydA0
	qzQkYfZNKb9QUKfe/oG63SBCOMGlgZMxM+D/84VqoGwxQVA6fjtbY+0wh1InyFB3Koh43T
	ZkWF0dHJZeBG+jDWFMlfosVC52iIPr0=
X-MC-Unique: anFD85stOd234iTHsI2YaA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9QhxFQA5awx/8hgySe/4t+HTf6u363pePZE4ZaNb6VXxJIV8ky4ztvigTCnJeQ41a9rN4G+fH4IdIQonNSFaqQU+57CLbX0MdeK/gL88soKUyI7XZz+l7eTq9zsGPdQIRnY/NDplr6WkxclG4+uvzHDam47RXM8D8twz3b/UoU/L1YZVTWOy+4/QBlZULtt8U0pnaFHAwo2kZGPxCT2zwDASd2kVT8IY8MAtdOiSICso7XVYxEkjVtBtPq3F4MmnXRDDQGpkXOEN7XTa/O0ZjD43+vLcL6PF4LohyV+hlAnFRCyC2tiF85YcalIJIK1X6CU5FpKk5PuEJoA4MbXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8lAwj2+rhV6+WzErBY96C69wzTTuWdoISGT1wZHX/s=;
 b=I1/87OpSU677xP3rjv/UbaGdIxEZQ7+BYsdtuKdYmupTYngULnqNEWdvsQ8uAb/VQUe2DbYTgMWlR5g2QZyDu+0i2a9pmV9mc8ghBjLKJlioC1fCediCYc80bxbNkDV4iSyzoTknhL+gPA/l2kxnCZY19mpXQ0ap25jxNislTMQaOEe7pSzUYMm88RnImgRd2AWkTKRQjL0tq2PuK7F0PFY0p4eHUISIS743MNsilAh7PeUn+3divjG9LKcTscWEkHO5zw/JRAB2dlmEbTuOJUfn4jvyj6RvVfuKL6aTvhx3uVArsYpD/vTbt4JdUtj/fFnNhoZNLYs2vkDwb5nObg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 1/7] xen: Implement xen/alternative-call.h for use in
 common code
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <29da4332-35c6-82ed-d839-a13477daac14@suse.com>
Date: Thu, 5 Aug 2021 17:31:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210805140644.357-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0259.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::31)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60507b50-e1eb-447d-3651-08d958260dce
X-MS-TrafficTypeDiagnostic: VI1PR04MB4944:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB49440BCFD51BE949BFF661CEB3F29@VI1PR04MB4944.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e0I8966NQvkLJM8y3yubuzUaO19r9Ztl7HnoJUx9pcrA7CK2NL50YqseEhIVgQK9Y0K2oSXt9eS5xcStNzGj7ik39Y8ZhZJTogJrjhR04yYqVeY5FTKwhxRTUdhoTmuFgM2AJYFH/lrygBdmKAnU/UEy48FJ0WykzFI0AwCusrddY8i8SAUVxWTuzZHFfnjmeWWuLIFxD4tT7X3DzyiXFJr5GKdBT+EIebNoFDponOTae72DLSx2eN0MX278fpZl6lss9nmxzmqkA3UbDI35R6tJ1sUXqpomAC9dxVDyEkySOVQGAw0F7evpraJq9W/Hgn9Giy/qhSKtesc0trMO3MnX9x2lYczB7i50vqLKoTlNGoMZMQXlnmQcs979jf4KpEvptTNlPMK/OXZ3Js0Xoqk62eoE33Ney+OZwVovpwgxW0hHrZ8Umqyq0MHIsOzM+2JXecy6JCPQc+H5THQWVPYWEyzBtr+FdzlvT2ArNEWnAbuNFT7sKi4Zn/p1MXkPhJI3duHV8h7wHGCU+qpghuaFnpnGNPuSpdLM10e81DZXiNNnx3hegRlZFB7+KkahQcjd9+vmAK5Rwc+Bo7e7R/FByzzY6TzAiNLZCHoAFbyFTUjZ2Lee8gPjDy27Lk6SVotIEraIUMEuNTtiHpIm5GGVbl4TRGLYIMvh6R1UgMU5d2473yVfQHe2oS+CjyfboqvZR+Mnms5K8Md1UXr8vMLKxpVYVeUrzttDwd4rgEM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(39850400004)(346002)(136003)(376002)(54906003)(38100700002)(16576012)(53546011)(86362001)(316002)(26005)(31686004)(110136005)(186003)(7416002)(2906002)(5660300002)(478600001)(4326008)(956004)(2616005)(31696002)(6486002)(66476007)(8936002)(66946007)(66556008)(36756003)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ky9ET1IvTExjZTR5S1NhNDhUNTVwcVNQeHJGQU5sZ3U2TUszd00vN1JjZnpY?=
 =?utf-8?B?enVnWjhya0lJc3NFY0phWC9ad2xkVjNCZmlheFBheCs0bXA0L2xHcVVvN2RN?=
 =?utf-8?B?a05CemJxWGkzUU1OSDhKZVg0OGptTkJOdUZFZXFidnNtTkRzd2FET1p4SjNm?=
 =?utf-8?B?bEdRU2ZrTFVJakM5alV2MC9nS0hLVGxDTml4RzFkS1NNZVVIdmhyc3ExTmh1?=
 =?utf-8?B?RkVmalE5VnpPQ1FjM29LWS9kRlFJdzFjOHNQUGh0MEVSS29xdUJWQk9BU1J3?=
 =?utf-8?B?R3dGK3pXS0oyS3k4Z2kxQWppRCtENXdqYnRsOWxHVjVmVmxFV2pKYlFPSXFu?=
 =?utf-8?B?U2Jxd2hGVmJOdXhIQ2lta0tFcXR3WUtyeUhwdWpwdjNsd21DREpOMm1VeFlp?=
 =?utf-8?B?UTc0VTg0cjBOMkJIWklPc0xvOFJuaWtkSVF0a2hlM2FCTjg2Y2hxNmJpRzBS?=
 =?utf-8?B?OEpCMVBuRXVtVlBtK1FsT1UyUzhXbjE5Qzh0NDY4SnEydm5YcnhIdklaNlVI?=
 =?utf-8?B?TUN6MXBQM3FwNExLV3I2MWxJdDkwWkZoMTgydVhISm1XeHhqS2hjclE1OE1y?=
 =?utf-8?B?TVhwZnBCYm40NU9Lako2RHA4czlCZ2tmQXRyTlJUM1I4Z0xBTnBETkFaY2Vi?=
 =?utf-8?B?MTF0Z2UzL3A2eVNSb3U3dWhXcjR3VWZnRHJ4bi9zZTNneUM1SkFqQklOaWk1?=
 =?utf-8?B?aVgyMzVqMnQxaE1zUFRodS8wcjlLaU5rL2JtUXZHaHB5K2Q0Unc4Z05FNTZG?=
 =?utf-8?B?K1pmOUNKVmloNUd2cDhmOEIrVDQwWGVyaktVREIzQzk2Sk5oRk4reVVVUTdG?=
 =?utf-8?B?NEkrVW5iRnJJcjV6dENWdElGY09IN1BqNUdIOElvSmxXK24vSHFHVkxBOTNY?=
 =?utf-8?B?a3g0TzZNLzBRWm12VjlvVElzcjFKbHdlSXdVSjdUMmN3c1RzNU1JTWpicklz?=
 =?utf-8?B?THVsSjB2WklVQVlaeHE4MTRwOHA3d05vWnY1ZnZoZUJPaWRzd2xiOXlYV1Yr?=
 =?utf-8?B?dUl1NWwvY0o1YzJ0K0ZLeUQ2TmQ3U3hWTTZqV3pBQm9rdHhBSXZrSW1iQmE0?=
 =?utf-8?B?Uk5pRktBNGorSFArZGc2cWVGRXNyL3VTdGxZdHVLMm1JRldDck1YVTlKbFIw?=
 =?utf-8?B?dHFMYmROdFZUZW1IN0ptQllzYTU2RnJLaUJKRFpKNVJWMUFkYXZXRUdkaFZv?=
 =?utf-8?B?K0hvOFhGZmxDOHdBVThISUFZajVPNlZaUmZLczhOTUtZL1NSd2tCd255Z0xS?=
 =?utf-8?B?K1J1cm16S0lJdmJ5T1BCTXlaRFF6Sk9kMGdELytEZlJ2aVRmWHM5ZE5EbG51?=
 =?utf-8?B?ZE9acGlNL0NjRUFsOHdOWlIrTkMwSG9BREk3QVN5ck03aVlMSXVHaG1Wd2FX?=
 =?utf-8?B?amcwLzFWYmRldVNQOW9Zc0NmSzNvQ3I5MXozYlRQK0MxckJ3L2lxLy9kMk1n?=
 =?utf-8?B?S0s0Y1ZWS1haL3BxbkNwUkJSSXRwSkNlQlFoc1BhZGE1QzQ4eHlOcmltU1Rz?=
 =?utf-8?B?QkhBdFM4dkczdldrS1VOVnBaOXVldWJtdzMveHNhcmg3VEJVTTlSa2p5MlNk?=
 =?utf-8?B?bG50REp2UzlYbFlpQjMzaHRudHc2SHJsTnZ5VU5zQkZnV01tczVFS2NvS0Q0?=
 =?utf-8?B?alZNVGh1TUVhck1JVlJPcGpCdG9YeHBGSTlmRjZwYm9ZbVVHZ1pLOEZtQkt2?=
 =?utf-8?B?OHF5aHBMdUcxeDVlTm5xemJrMklBR0p4bDI5dEJvVytGakEvcGVNQWl6MEcr?=
 =?utf-8?Q?tsQGIsJoV1VfV2CRIgJQ8A6gRsBzh9sSZaxpZRq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60507b50-e1eb-447d-3651-08d958260dce
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 15:31:11.4504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drm/ZRapCDEoSEuFWrC1zqSFXBPWGb5mhFCvqMmv+j65B52UMaj0J77U9DMhrgFGDyJn5xTzb8BtxY3do3zR5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4944

On 05.08.2021 16:06, Daniel P. Smith wrote:
> --- /dev/null
> +++ b/xen/include/xen/alternative-call.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef XEN_ALTERNATIVE_CALL
> +#define XEN_ALTERNATIVE_CALL
> +
> +/*
> + * Some subsystems in Xen may have multiple implementions, which can be
> + * resolved to a single implementation at boot time.  By default, this will
> + * result in the use of function pointers.
> + *
> + * Some architectures may have mechanisms for dynamically modifying .text.
> + * Using this mechnaism, function pointers can be converted to direct calls
> + * which are typically more efficient at runtime.
> + *
> + * For architectures to support:
> + *
> + * - Implement alternative_{,v}call() in asm/alternative.h.  Code generation
> + *   requirements are to emit a function pointer call at build time, and stash
> + *   enough metadata to simplify the call at boot once the implementation has
> + *   been resolved.
> + * - Select ALTERNATIVE_CALL in Kconfig.
> + *
> + * To use:
> + *
> + * Consider the following simplified example.
> + *
> + *  1) struct foo_ops __alt_call_maybe_initdata ops;
> + *
> + *  2) const struct foo_ops __initconst foo_a_ops = { ... };
> + *     const struct foo_ops __initconst foo_b_ops = { ... };
> + *
> + *     void foo_init(void)
> + *     {
> + *         ...
> + *         if ( use_impl_a )
> + *             ops = *foo_a_ops;
> + *         else if ( use_impl_b )
> + *             ops = *foo_b_ops;
> + *         ...
> + *     }
> + *
> + *  3) alternative_call(ops.bar, ...);
> + *
> + * There needs to a single ops object (1) which will eventually contain the
> + * function pointers.  This should be populated in foo's init() function (2)
> + * by one of the available implementations.  To call functions, use
> + * alternative_{,v}call() referencing the main ops object (3).
> + */
> +
> +#ifdef CONFIG_ALTERNATIVE_CALL
> +
> +#include <asm/alternative.h>
> +
> +#define __alt_call_maybe_initdata __initdata

I think it wants (needs) clarifying that this may only be used if
the ops object is used exclusively in alternative_{,v}call()
instances (besides the original assignments to it, of course).

> +#else
> +
> +#define alternative_call(func, args...)  (func)(args)
> +#define alternative_vcall(func, args...) (func)(args)
> +
> +#define __alt_call_maybe_initdata

Wouldn't this want to resolve to __read_mostly?

Jan


