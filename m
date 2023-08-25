Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BDC7888CC
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 15:40:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590918.923277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZX33-0004bR-PZ; Fri, 25 Aug 2023 13:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590918.923277; Fri, 25 Aug 2023 13:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZX33-0004YY-Ma; Fri, 25 Aug 2023 13:40:25 +0000
Received: by outflank-mailman (input) for mailman id 590918;
 Fri, 25 Aug 2023 13:40:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gnt3=EK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qZX32-0004YR-44
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 13:40:24 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe02::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee38c0e9-434c-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 15:40:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8617.eurprd04.prod.outlook.com (2603:10a6:20b:438::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 13:40:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 13:40:17 +0000
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
X-Inumbo-ID: ee38c0e9-434c-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXj/D1FW9LCIs0SUaLsnqC/BmKocRnVFiXYmb6MWRAArWvcT/xozhdL6Dulrof3FwiKgSWGpQPj8FTPhx7h/UxUpsbs83mMp8anfVwIp6PEZhCUFkbb0wXMBWCu7RmsNhNrVF5dIZ88zaoW0m1S0goCMAGkq2dh9Z/H+OFuQtAonKe5T0BRRRD2Vz69dc4bZQrWWoGAiEAkkACepVonpXL9JMrB24H+JG0LwhtaJsfU8VLo0b/QaNa42DSSvC+4g+sZu2VBhSCadsQcdJiepv2bmjRmJINSufJAtxAfe8ObYhCxI3HoBkclHefrleiOR8oUzcC8nlMlmzNvb1KOtNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCvwl3+TYsgomQ7wnBMhIBqRSDn30ax0l9gVfd4YzMk=;
 b=c29c/jpIUyt8/R017jbENjFvHvl74eec9TS0QO/bp0pipqzIQOXCfM3MRPq2o5ILbS5VtISV2Gw0lVkDhBWtkdH76wrGTRRFIDhef7v69QkCjgyoKNoetRQNBDEZpQD8AN/BxTqdIzHBYx4LgJMkhdskrv1pVx/++9fR1+mUziraP+ocKF1ZYCdCiQpTqg9rY3CCjk7yaGoxmRuvEGemrHFNbrqMP2g/XFeSVrcUzuRYymRwHDz075xBfBnq0XjEORlcbt0VumyXVS2DrYqOP3hZoqls4bsokL+JQBgoqhwNVM4NbK2faydzfq3utKYJXQQUuSmKZRgMA7m0NxTpAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCvwl3+TYsgomQ7wnBMhIBqRSDn30ax0l9gVfd4YzMk=;
 b=vcCWjSB3U7pcUppinWxyzbUiD0RGjIvPHMylmYWee5cXhjnkeV8S592iXsAc6oYgXU8i9uKQJVXVqhDMnM4HqaAKyglkp5LAFarvQccW9FPIoFjtoUTTJcGyiVmIR4qJQljnLF9cOLJLpVb+w/5pGoMSYkIuqFti6KAuPMhs9bExxHRDxBoXlcGyzeX1mfK2Ss+htDG33Gr/pzpfGB63J2BgcnJ4bNu8y/CMiYGkYcPVRyLnN9Uh7/UJ75QfPZL3X/zSF1ENkb/gzjYIWPS0xi8qqROzpHfhelCPAfcToRqhS25ism+SXzUkfpoDSHYGV0KEIB4dF7H7hEVzckyBrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4cf3053a-504e-514d-e940-a47e9498b1c4@suse.com>
Date: Fri, 25 Aug 2023 15:40:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] docs/misra: add rules 10.1 10.2 10.3 10.4
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 nicola.vetrini@bugseng.com, roberto.bagnara@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230823231451.2989262-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230823231451.2989262-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0226.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8617:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a11925-f50c-4e73-a1f9-08dba570d151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5UGMkXc4/ZaUkYS+t4ehlh5asf7MU+HbgYub1reRJ6KpDcd/Aho7fjv1Ul3GQrst+eGxn7abf0uEnyFeygSW9I9iBvDvCdqMlf2KCzMyyeUuGveCO3c3Q2znpEggsKTTMfipRSYrAahJ2peuFqAVcFg/BSErSeVEcDvZAlUiSKmpfWs8WY3TYL76ff3FWvtTSls7M9c1ujskH5LMuleGpTtDwJzkpLvPtWVMZ5LwsvUvj+HL6+dU13VmeQffTxE4Lux1mlD6KZMu4V3rRGRPtf0dmpccAAfcs5Wvp+zgD9wdecSg5rUQnF9kZT01T9maQ36HP1XruFPvZviGjXcGw71O4zxxo2NXRvxLOX9DPrxyNvXf80nZaEdRcEeaOS6+UmQ30CQthO7IFWowxPoRsjGjzMwRYwy7QRUmrUeXDOQJwTcAJVIo6T1c5zYHkemcIWtEXx359qYApqymNz2q77ZUSgN6SgWLVNCE59C3RKpNmo7U5qmNiwsoA/aF1+RH7LRl42S98YNfrkdNSIvVd6eqtebxvuFYLuV3jnRC9cytMg62mo3tRF9NgmOpVl+qUgb6GGj/Mhm6D1P1iOJPWbRlGGJTHhuav+VTg8sBAdJdUF9aLuUtkYwy4AzIbKky6b6niCPbclZwwPDcTfPIQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(366004)(39860400002)(376002)(1800799009)(451199024)(186009)(7416002)(83380400001)(6512007)(478600001)(26005)(2616005)(5660300002)(31686004)(2906002)(8676002)(8936002)(4326008)(38100700002)(66556008)(66946007)(66476007)(6916009)(86362001)(41300700001)(31696002)(53546011)(6486002)(36756003)(6666004)(316002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkpyelEwNFhXUlhXZ3dYZ3B1MGF4T1BLeVIzZUV6RGxXNzF2bGQ5VGFVVFJJ?=
 =?utf-8?B?akVTTHhoMlB3RGVLN1J3MVBWaHkyaXk3dFN1ZEJUeU85eUNmaERIcmVPcGtj?=
 =?utf-8?B?bVNtRVR0NXBSWjhNWTJuMzB6RXNIckt1ZGhPNHJFVmZyMC96dVBqckRqVG5W?=
 =?utf-8?B?dnE1d2tPajRWRWJ4UForVFVWazViS0Z6MDZPSnNCdm90KzJzcTQ2VmRRdGVI?=
 =?utf-8?B?TmYzNkFwSGM2dlVrZnBhenJVR2cxVmI0dityWWZianN0ZC9zL0pUYkFFVlVP?=
 =?utf-8?B?dDNNQVdOcGJUT0FxelRhQ2tVaEFKZGtHa3NMUTFXZXduWitGSWFoSDZJdVhL?=
 =?utf-8?B?dzlKWFhxWkx3R0orZkJnL3JjRmkvUnZHTFA4WEl4dWtxL0gybzlmaVl2dGg4?=
 =?utf-8?B?V3NybUN6T2RLLzc2WXlTMll5TTRJaDhudHVLUERZMUZ3Zm5wMUlrcVFLY0JN?=
 =?utf-8?B?bjNXMFkyRk50aXE5ZHJKWTdEWkN3VUdOck5Jek91MFlldjZqUUdwSDdMSWd2?=
 =?utf-8?B?cHErNStlUGN3QUxzK1dJQ2Qza3Q0MkhwMlNEVUFKaUZLNmJ2S0twUVpxOTh3?=
 =?utf-8?B?eGVXOGt4VEpET3M3aHE5ODFnaUUzUUhqcDlqYWh6bC85ZzgzQ2xhd2MxSmhu?=
 =?utf-8?B?ZHczN3VSY21yMGtoYTR3ZXhSWDhNUTY1bHk4QTdCWnUzU045YXJIMWRoRzR1?=
 =?utf-8?B?VWFVdmp2TFVXbUc2NDNBT2RrY0JFWjI1U2VXN1UwL3RhSWs2WjN4WlFibW9C?=
 =?utf-8?B?NnA4M0tCQnlNY2dHdTBFV2oyTHZzYTdKV2ZzNyt5dFFqNEs1a1pVRjZLL0Vp?=
 =?utf-8?B?RGZuMFZEVWpqYTUxbDV4cXQyT0RsZ1dFZnRTMHNkSFQxdkI5cDJCQUo3eVNX?=
 =?utf-8?B?MCtBVFdxbHo0MjZlcVFZL1MrK2tkVzRPL0FWNm56bUpIcWNnRkdpL1hrV1dv?=
 =?utf-8?B?WVA0aFJ4M09aejdhcStJVE84bEZVaXgrYVBKZ1h1QThTb0UrRk5Wd1JQK0Fi?=
 =?utf-8?B?NjF1cU9kVnkrTkozSmFVZkpvUVMwZ1lNQXZxTFFySXpEM2Q4aHZ2aHVLSGUr?=
 =?utf-8?B?clFvUldyWU1BeVJwbWErSUc0c3VZT1FyeXMyWHYxbks0Q1NuUmNRd0Z1T1Zl?=
 =?utf-8?B?WnRZVmtzblJtMDd0VGVsVllBZThHUlpjRTc3STEyOXhQbmdndHcyZmk5UEN0?=
 =?utf-8?B?bHEvTWtDWTM1Ui9Ta0w0T3k1RWNUOFhBTkN2VkhtL0hpT09ET0RINFhxc3gy?=
 =?utf-8?B?TWxJSGduUjZITXRLYUNpYmJrRXNsZUlUZDBnazJlaDJ5K1ZJQmZhZE0xOU1m?=
 =?utf-8?B?cG82SGo0Rk4zY2NrYklZR1Vtb0VBVlVFcUtyeDZNcHkrM1BjeFBIL1NtTmps?=
 =?utf-8?B?WmE2VFNmYVRsdHo4OFlFTUFTbERvczdwcmhNUjZVNXpHZzBsWVl3OXdqbnVT?=
 =?utf-8?B?Q1lXOVpZV1RlUUhiZDBjSFpWdFZnNFhEVFc5OEwvVTAxSFprdS9hRmVMSmJJ?=
 =?utf-8?B?RHZqRmM5L1pidWV0OG52a0lZS1FNS0FsMnJ0L0tJUXQ4eUgydkppZkRrMlFZ?=
 =?utf-8?B?OE5MWCt4VTVjcHJGVE4zUysrdjZZYm1RckVZRjNTR200VUs2WHA5ek5leEhJ?=
 =?utf-8?B?WUc0ODJZTnVDVXBJVkhqWTNPRU1LZXhuSmFWSkZLU2o1UmNIM1JsM1VMMkZj?=
 =?utf-8?B?WDBjaGFVanJIYmxaWXhuOGR2bm1rTkp3clRtZWpVNjgvaEdhWnZjVldqd1FN?=
 =?utf-8?B?bEk2WFhxNldqNFk0N3dScjYyUGJnQzdTRXVFaXNtdEdGMXgvRUk1T25NeStp?=
 =?utf-8?B?U0ZCbVNkcjkzOTkvZjhRUElCdnZLL3Y0NE1wbHNZSUM5T3p2UzlvbG1IOTNx?=
 =?utf-8?B?cmN0cHB6UkppVFJZUWlKODhqNndFVTY2aHhZWnRtNExLK2VPcXducjREK0RW?=
 =?utf-8?B?eUFCaTkwVDV2U01ONHBiZzVhZ2V1aXpOM0t4UE92a1B6Q1hUd3pBWTNUSU5m?=
 =?utf-8?B?NXozVGZHRnFMRWpSSkxJQlpZSXlDMlBDZEJjUldCZ2xkVXEwWGwzRklmZFhj?=
 =?utf-8?B?SXRkNkM2N3FMQXEzVjVQK3YyR3QwdWhBM0tVMzM4Sy9JR2Y0QkxDYUx2M3pj?=
 =?utf-8?Q?6GKQpuHW1NFsE6pSCMwIlFBQ9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a11925-f50c-4e73-a1f9-08dba570d151
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 13:40:17.1148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkOMYrFvYkwgciAad5mGyRCHyLYjjrSmIJJ3yP/OlaRnJQnV/nvt3YGKRE2B4Vdp1oNevWsnYlR4FnV8Y5jwvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8617

On 24.08.2023 01:14, Stefano Stabellini wrote:
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -318,6 +318,58 @@ maintainers if you want to suggest a change.
>       - An element of an object shall not be initialized more than once
>       -
>  
> +   * - `Rule 10.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_10_01.c>`_
> +     - Required
> +     - Operands shall not be of an inappropriate essential type
> +     - The following are allowed:
> +         - Value-preserving conversions of integer constants
> +         - Bitwise and, or, xor, one's complement, bitwise and assignment,
> +           bitwise or assignment, bitwise xor assignment (bitwise and, or, xor
> +           are safe on non-negative integers; also Xen assumes two's complement
> +           representation)
> +         - Left shift, right shift, left shift assignment, right shift
> +           assignment (see C-language-toolchain.rst for assumptions on
> +           compilers' extensions)

Is "assumptions" the right term here? We don't just assume these are there,
we actually checked their doc and behavior. Maybe simply "uses of" instead?

> +         - Implicit conversions to boolean for logical operators' arguments

What is "logical operators" here? Perhaps this wants to be "conditionals"
instead, to cover all of ?:, if(), while(), for() (did I forget any?), of
which only the first is an operator?

> +   * - `Rule 10.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_10_03.c>`_
> +     - Required
> +     - The value of an expression shall not be assigned to an object
> +       with a narrower essential type or of a dierent essential type

Nit: ff missing?

> +       category
> +     - Please beware that this rule has many violations in the Xen
> +       codebase today, and its adoption is aspirational. However, when
> +       submitting new patches please try to decrease the number of
> +       violations when possible.
> +
> +       gcc has a helpful warning that can help you spot and remove
> +       violations of this kind: conversion. For instance, you can use
> +       it as follows:
> +
> +       cd xen; CFLAGS="-Wconversion -Wno-error=sign-conversion -Wno-error=conversion" make

Maybe slightly shorter as

CFLAGS="-Wconversion -Wno-error=sign-conversion -Wno-error=conversion" make -C xen

?

Jan

