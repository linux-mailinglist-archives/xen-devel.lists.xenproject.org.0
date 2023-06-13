Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277CD72DB02
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 09:32:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547850.855479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8yVp-0003nm-E6; Tue, 13 Jun 2023 07:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547850.855479; Tue, 13 Jun 2023 07:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8yVp-0003ks-Ad; Tue, 13 Jun 2023 07:32:21 +0000
Received: by outflank-mailman (input) for mailman id 547850;
 Tue, 13 Jun 2023 07:32:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8yVn-0003km-UG
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 07:32:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d37af9f-09bc-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 09:32:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7444.eurprd04.prod.outlook.com (2603:10a6:20b:1de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 07:31:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 07:31:49 +0000
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
X-Inumbo-ID: 6d37af9f-09bc-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KB595KedDClevGbgX2bzwKX4H+c5GKNIrWlRlHifA/eGYs4HuZoUO/CZKjhKIVQY2OYQb1zPamMpRExalH4nGld9U0yvOb/wwuDgIQUf9OIWtdvaUrk8X1Sh8PsoDoNe/kvhh86+gNxRii/S9sklvnIvf7Q2S+0CaDq1J5CP2Jl8MK9CEhAOaJJdA77BXo74UGfbCaiXfngslxR6lcBNcs2f4aHs0MKZvmPSBew1WZZfWxGS5dVWIDK0iPR1sVwQIxRDHff775wq6Ve/cbZpMoUON+9d7goAMGHD+JnyzcISvFM/KMlOBa04DxT5w96vIFdraAS3VlF/30GLq3zNzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1pUrtbblts4fDfKa1wal2X24sd24GLC4UFvG/Zmklo=;
 b=kNOk6mmieeFKZvV/e4ad3xtDsCabwDssN2XDfQByh1rH3VYhYnAr1bEKpDpZz1ad7FV1Lub49gZNVNxZyhLn5hWH/A0DqJZweu5oFpeGVBrSf8//oi3O2t8zWgbUfEXLLxYP665UbaA3fOu0nt+mq3JQNVUM+5k9zK06Awix5An2WLQPyxd78/z2dGm9B6UPU04PAxwq2u6Z8RTkXZ7fRNAkzRvVg/NAhOjEb/UKhytDJX3mYqNokyvtWQqa5weAB355YSDF0hCivSaaVsjzMtICt/MR5hLP71x8uvbJeIyJHUIHtQw7aKlDvViSNC/ZABEQpHbdgqp3UBripUbugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1pUrtbblts4fDfKa1wal2X24sd24GLC4UFvG/Zmklo=;
 b=nb5OBeOeHVl/W1ruc9/fLuSg/VaUTAewBuUmwEGywxjQKuQcDVUS3ELlUdR0pyrU4sVqwv9vgVUFfQ+DQErD7NYiEy1ieBxpsQvHqBb0euF5Svyck9x89Xs56egijjhWl2nLyIl+t/82GzsSCx64gWPxCzSlBNc1WeuXGYBgcfmRghTSXel3mQG0wCMRUsGLAxWQuRaDPBIJDI/qgII1HhKlCa13815634vUUl4MOGDLj2teQXSp5qVkTpfgVmSs+ipneXNvA/31rJ4jD7HvMIuARB6GT6pHZqaEN9jt6BbYJsIHtuZW/xDUi7UbHZfznlC1iX1uWnFngYu2GFOiCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a0773e3-450c-4744-ad2b-689102ccc890@suse.com>
Date: Tue, 13 Jun 2023 09:31:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3] docs/misra: new rules addition
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, roberto.bagnara@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230613034456.701654-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230613034456.701654-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: 5791c3ab-6bbe-425b-6df9-08db6be0403a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oYdcAQq97rUC4lKt2r2D7ed3ejHd7xP2+H/M3AsgU1bZZkwnwKYMqxCahgfcq8eB7vhLqdqaxdHILH6soYOlaF4ZdGPPZkUloxKAIQ3CE2w6EMOvzQwIR0nPx3qpW5jMlob8cHXzgULDply5J3LyPuC0521RFo2LWiLtDTT1HSq9eDPYEYX3qzgkgMa6xFKv58o0jm+bRBkiBLdWJHcja6tBUDK+XdeY6HeB5/I5RBkxeCX10gzZLc3/7fabr4jOxZ8NudwBwHBrL7nqdoHECfzUvShPsZZvatSvPKmSDxJBWNMiyfDIF6XTSz8mztv8SJCbjFQH1JyINhsletfO61fJFmi4i/ZdtDyYKeHbieAaPdMTxXaBL2hFfwEY5QmsZHAvrFXzvwY98seMS4AUDu8JNTVRPSNl5ntMXSU6Ju4sZ+6piiikuDJsSdOxKmtBasioBTkxP+Udna0/w9niX9UwA/IRHhOsupy9BXNYP6kzEebGYUiGfxbh24/6SB6+EbIHLTfabnY/EYrk3HNZSOAETHQqIXXT7L9oz0eB7PVdyTMZIJYtO0K65HAhkzu2TS438sirjNOKQYf0Y9naerC0ZIl6i4bUGjwP3f+EvJ/nVIpuvI+PsD09MpF1MuIP67VZvdO5b93+DXJ+XXjSuvMMqU7MGdeurogCCZkNKd2Hw1jQjuXlUgDEB2sYTKjW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199021)(86362001)(31696002)(6486002)(316002)(8676002)(41300700001)(5660300002)(83380400001)(26005)(6512007)(38100700002)(53546011)(6506007)(8936002)(66476007)(36756003)(66556008)(66946007)(6916009)(4326008)(478600001)(186003)(31686004)(2906002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEJQMFBKaGpVOWJvRjc5VHljOTk3elB6bWhxUTJPeWtWVC9rbUZpeFZXNHpv?=
 =?utf-8?B?b3E5enk1V2krQ3BOb3g0VDludmJPbmpFZnMwcmlTUnpvK20vdDNMZDlTVWhJ?=
 =?utf-8?B?Yk44N0F2NDhXUDArd0lXbDd6N2thaEU0eWRSMUxvR3JZc1d0TVlyS0RQanlJ?=
 =?utf-8?B?Y0wzT2pJdjJGZUd2c0tJeTF2cDVvcFF6ZUxHaGdMWXhweE43YjZkZnJ4S3lI?=
 =?utf-8?B?dEJaZmxGSk04SmFEN3RTZVdTR2hhdnJxQkszVG5rWmpyWWVSaVB4T1ZHQmRD?=
 =?utf-8?B?NDhyRy9kaFhMRnY3RTFCM2RWdnowbnJYQmdybU13S1I3WStnSmlKeW5uUGdF?=
 =?utf-8?B?TEJ1a1UwaEdNQlR0ektoUGcrZ1dQOFM2OFdNR21lRDlpT1hDdFBCMjZKbGU0?=
 =?utf-8?B?NlIrS3UzMVduM2ROL3pvV1FNeU9UUzV3ZEg5YUF3R081OE8xK0VPS0NFQWpV?=
 =?utf-8?B?Ym9NRG1SbkZaWUNMQW90dHJlSURrR3lsbnlqSm1oOUNvb2RzV3YrSE9nUHh4?=
 =?utf-8?B?YkdTUENNQlJFYlFWOHNzbGdndlJTeVV1ZCs4UStVRXBtbFk4dko5YUZwQ1Vk?=
 =?utf-8?B?bFBuclhhQnFnT0lLNmoyYnFrWjM1RUFtQ2F5eGYrL0xhdzJ0cEZQVjlVeVJ1?=
 =?utf-8?B?dThGWGJFem9FMkFYU29sL045b2R1SWVOT2pVMEttYThDTnlQWFlJUm8vcW9G?=
 =?utf-8?B?VElreFhJOEkvSW53bjgzSWVhekF1emQ3Z3p6cjJ3M1d1MDRKU1VLcFBjSGJt?=
 =?utf-8?B?bkREVkpPb2g0T2w3STFNSFVYN0w0TVA0UGVVM3VEaXhCTlRjZDZWdzdVbG43?=
 =?utf-8?B?L0plak9ZZ3VQSlFSekN5OHZRNzJSTUxsVVZEY1BQci9iZlpRZHl3UnNXQnBP?=
 =?utf-8?B?cWFYWWh5aThpU1ZuckhHNGlGZjhwYkRxY1EwOWVlNENnWm00ZlYrMkE3MEc4?=
 =?utf-8?B?MTgrZnUwN0RjUHhzOHBNaG1EV2pTRDFFVkVhQVozWGFoK1lQVGZHUFV2cmtt?=
 =?utf-8?B?TlgwSEkyZkMrNHRidnVGTDM0aFpXSHZLMGI4aTRCd1BKZU5kUmYrajN4SU5Q?=
 =?utf-8?B?bWxvaVpNWk1oQmNlRWRqSVVmTGx3S2k1VzhMUkRkdmNDVjVSTlRwV0tuUFFB?=
 =?utf-8?B?NE5GM3pMdU5oL0VjcHZkRVBMMnFwYnR0WEc2VXhjVlNxTzFKZXEvbTViY2Yv?=
 =?utf-8?B?YXR3UllhZnJCZVMzbDB4QlhWd3ovWTRLVlhmUVRka2hzMTFlRDg5aUdRYURB?=
 =?utf-8?B?UmRKZSsrWFI4SExrT2VLQTRNVXFwNTkrclhkWnpFRXcrOUVkaTdhanFZcVFY?=
 =?utf-8?B?MmZVWDV6VlNIYm0zUC9LZzFicnpBa2liTnRaak56UWxrUVpKQmFnbHNobUh5?=
 =?utf-8?B?d3VBSGZJTUR5Y3QraEhZZXZVM2xXT2xVRjlWSHNNNnp2SnJjcGQvWDg1aTdD?=
 =?utf-8?B?K3RTQmpBeC8zQnZFQ2d4VEhyS1JQcWhmT0ZaenZCVXJRcDBSRU1raE5naDJ1?=
 =?utf-8?B?cFJRb3pFOTlzeVAxamF2b1pUQjBiZGlvNksySkNPalp5MVEvenRIQ0lmcUZy?=
 =?utf-8?B?Ump4dXF2WnBFU1pWMGRGWGtqSzFZL1B3Q2ZsbzEzOFdZbmpHbDczNzBTUWd6?=
 =?utf-8?B?TUxBSVRtTHBlUXZJNmpOTzZPNDZlVXk0UmNaclZkakRKMVYzMmlxbHA2ak4z?=
 =?utf-8?B?MmFvR2w4eVViTy9hZmdLQ3ZFSjAwekJQVnN2Z1plL1FVcnRraVhUQUYwbDNz?=
 =?utf-8?B?N1lEY3NhTUc4NVZobldFd1YyWFZNd0tpKzh2VFNDNWlyZVBydEVHTGdTaDJB?=
 =?utf-8?B?ZEtyRmg0eXRMQzdvWUJlbTJ3T1Z2MVNCczFESjRIK1JacUkyRjcwY0dBNXpH?=
 =?utf-8?B?T2ZSM1I1ZjVXZ1dUamZKaEUzRW5nSUpyQVBLUHZVaEdPQUhuWEdVNUQ3ZjMx?=
 =?utf-8?B?b2pZb2FPcmFrZkZ4OHp3VU1pak1Wd2F2VkljK01sa0d6enJ0MkFQM0Q4MC9o?=
 =?utf-8?B?R0dKMFFVcldnUkh4T2d6eDM5N3hZeTFlV09VUFF3bmgvUnR2VURLVUt5dmVV?=
 =?utf-8?B?dU15L2E5ZmRKMlFDbWRsbEJTdDc0cXlVd2ErTytFRXdOSno2ZjFqWURKd3Z2?=
 =?utf-8?Q?rDYwDGKzKXThVVY/PsvUefUy4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5791c3ab-6bbe-425b-6df9-08db6be0403a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 07:31:49.8791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNqpWXErmQKvxq8W9DjQOc26nYTLuAPkPUk4COUtsLBpYPIhSDW+X0p8apXka51H7+Cim3WlOVISZrTKKudDwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7444

On 13.06.2023 05:44, Stefano Stabellini wrote:
> @@ -133,6 +146,13 @@ existing codebase are work-in-progress.
>         headers (xen/include/public/) are allowed to retain longer
>         identifiers for backward compatibility.
>  
> +   * - `Rule 6.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_01.c>`_
> +     - Required
> +     - Bit-fields shall only be declared with an appropriate type
> +     - In addition to the C99 types, we also consider appropriate types:
> +       unsigned char, unsigned short, unsigned long, unsigned long long,
> +       enum, and all explicitly signed integer types.

If I was to read this without the earlier discussion in mind, I would wonder
why the unsigned types are explicitly enumerated, but the signed ones are
described in more general terms. Can't it simply be "all explicitly unsigned
/ signed integer types", which then also covers e.g. uint32_t?

> @@ -143,6 +163,32 @@ existing codebase are work-in-progress.
>       - Octal constants shall not be used
>       -
>  
> +   * - `Rule 7.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_02.c>`_
> +     - Required
> +     - A "u" or "U" suffix shall be applied to all integer constants
> +       that are represented in an unsigned type
> +     - The rule asks that any integer literal that is implicitly
> +       unsigned is made explicitly unsigned by using one of the
> +       indicated suffixes.  As an example, on a machine where the int
> +       type is 32-bit wide, 0x77777777 is signed whereas 0x80000000 is
> +       (implicitly) unsigned. In order to comply with the rule, the
> +       latter should be rewritten as either 0x80000000u or 0x80000000U.
> +       Consistency considerations may suggest using the same suffix even
> +       when not required by the rule. For instance, if one has:
> +
> +       Original: f(0x77777777); f(0x80000000);
> +
> +       one might prefer
> +
> +       Solution 1: f(0x77777777U); f(0x80000000U);
> +
> +       over
> +
> +       Solution 2: f(0x77777777); f(0x80000000U);
> +
> +       after having ascertained that "Solution 1" is compatible with the
> +       intended semantics.

I think we should state here what we want people to do, not what "one
might prefer". That aspect aside, I'm not convinced the added text
(matching what Roberto did suggest) really addresses my concerns. Yet
I'm not going to pursue this any further - we'll see how this ends up
working in practice.

Jan

