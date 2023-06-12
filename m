Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC0E72B8AC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 09:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546882.853973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8c3O-00029k-9D; Mon, 12 Jun 2023 07:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546882.853973; Mon, 12 Jun 2023 07:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8c3O-000270-5j; Mon, 12 Jun 2023 07:33:30 +0000
Received: by outflank-mailman (input) for mailman id 546882;
 Mon, 12 Jun 2023 07:33:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8c3N-00026u-Er
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 07:33:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6befc1d8-08f3-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 09:33:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB9840.eurprd04.prod.outlook.com (2603:10a6:102:387::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.42; Mon, 12 Jun
 2023 07:33:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 07:33:24 +0000
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
X-Inumbo-ID: 6befc1d8-08f3-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJYM/Gj1jsF/4j8psxNClogJuOSaMnuy7RVaWoGulwaOxNLPQpgFQjvqD8LbWX1FUtS9xrpajLmjVQfNl2KZD5xBpVuwPHvOqAhf8QNw34APJV0rU4YsZ5oMOnx2bW8s5eIVmHFxC8Aq8T9QVG3gHmZJXPBmMdvwvWFbLMf0/g82Ia8r7yRQkVrCQBBrfpHxgxJCdOzQdkke/9MelEH9Qu+ZRfoAsg5TVPP9uOoE6FaFrmolkk7MBHK/JJg/ZRUm4YKkXY/CUyU9KOLuylKtHBUdOdilgaDSVmxJxzEju/tqmls6OfCsuJf8PFB9lye2Diy2t7qhjnl2cGP66wQQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYuIqNwdinNyLWneghhdDOqgXZoEXvbEJbWjwAar1WY=;
 b=lDiCZ9ypWwxatCl0hyrkMgi9g4DeEmZ8q5B7lNuIbGpTne2Xl8GMLl+UqaYBPuvWBcPM7xjvSMvMmlbwANdgizb/rfyN/aC1o842IXQPW+ISlhNlvIamFk6O73FyA8K+agN6y4NNBqy43r5mXqIl4s3XhxKocIzhY47ubkkHD7dgXgtOmTklZLiZGGssrv8V5Eyz04AEJAWhvxtOfwRJ7sXIr374QFTE2G2I9K5aenl3h7N5g9QXtD+flytkhhVjpnIsI3VgaI0eggYAOS+ea/lV/7nl41u1osdeWQI/JyPtWtk1D7mmgRUgacEPPBCdeWK06OEOhoLwm1or3/nDsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYuIqNwdinNyLWneghhdDOqgXZoEXvbEJbWjwAar1WY=;
 b=gGfPZRZsGBLrB5AKVlmC7ygIVCw7hWTBMcMwyCReaYQl9APpwocTkkmVSHxitQQMPCJUn+Q1CKO/a+Xc4CM1uVzuKZbIpLxiDzbqd6mSiqUuAaFa8IHpfQMRClHEtLnzHGCRR9zoGCH6Yt4HaMEyr4kE+uNWMlL57JcozxPKECxlH7DnZJthMT+5xoRt8Zd1/tPXqysJe/sO8BjxZicrrPnyCZG8mAi3XHwksyDqF9VFbP2iRw/WJnbp1dCq9kd9HcYFU7O2Gylt+3ZCGDxATeGl1ZUi5UASRWGhWcrUIWMNdSNAPeREg4WvbSpwMsPbtqQ08OIJ2HM2wV6VJ2892w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a3229436-c714-ab2d-27f9-eac1455d3943@suse.com>
Date: Mon, 12 Jun 2023 09:33:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] docs/misra: new rules addition
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, roberto.bagnara@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230609174543.4067574-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230609174543.4067574-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 123ef1f9-4914-42ff-497a-08db6b174de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	faGsnwpza+89flsfSAVXZG+fLFzA/2MVNxUnOmqKwEMd2kCEZIZ2WPuV9Bn/yP3THFWMSbpOuIodPecBThxP8qTE1verXedipUszZFYl3FcF01LW9nPeAxqW5qcReLoR5Gk3YogrO41o3E+d8WZZbR7Y360aXl5VJYyLlMeeqKx5zVyOjBvBkmELoB1tnL5G9SdW8BNYMcCEJeiAo/MYGZUlRPrddmg9MK1ugImszXFpXkGmrv2C0ZN+WfpqYD1+5EsKTDZNjeEI/R4ZBtEukOYU2itjXO8T3KG7BezZyEzMNf2aNwvGIBxGKGjOjSHkyFRYRBnbAS9INwPd7bfLQfSbHuq8Ak3cad0wPnWcpdmdZuAYaU91QNAUiHgIgoIjW0aro/XjKj+XlcArU0uGwXWUwDdf1Z1f82s2yDdklljeF47CqEYNnPrtYHCNEp/Rc/aFd/ArydGT+Hb5wGR/UKxYsDeA69MZ0U4EEd+kMv2+otoDKyGpbgOtKoxU3RdKcQkfsZM66+afwiGxcSMCCDWeYoyezxIEEFGQchCLcb9kySOkyD7tRlSmthhMsu12Q6ryJOyUhBUCtnxfWn8FVTOZSVlS1W20KVn+drTL2647KB2mrSZ6Nku+jURAIyuZZf81sEa5B3WeZ/SyrkxLQUmdbEaeoshzKYAI01P5ESLa/V4w/v8u3LyFZTzKdMQ1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199021)(478600001)(8936002)(8676002)(316002)(4326008)(66476007)(66556008)(66946007)(41300700001)(2616005)(38100700002)(6916009)(186003)(6486002)(5660300002)(6512007)(6506007)(53546011)(26005)(86362001)(31696002)(2906002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akNEWTBMZWFWektwS0ZQYS9DTHg3WUlyd05FYTlZOSs1WjNQMzQ5b1Rjdzc2?=
 =?utf-8?B?YWFSdGNEaE5VV20zUWNUN3RGWkQwUVg1S3J6SDBpaEJjcUU0Sk9yZVJkUEZC?=
 =?utf-8?B?cWlIay94aWhJMVVFODhEN0E5YzlqUzkrbWFYQi9tZ0hHV0RNbkF5NXdqampj?=
 =?utf-8?B?cWQ2UUs0S2FGWE5QejM4SWtCTXMrUUhIY3NzMmZXdEhPTkZ3dVZ4R2oxM2VV?=
 =?utf-8?B?UHI2QUM4ZytBMlJXRE1sa2dZcDRSbW44ZnlaR3lMZERPbThDWnNhUDI2RmVI?=
 =?utf-8?B?ZEFCZlJaUVF3OXhYTTB3akZVSHZpS3Y5N0Y0UUd4TWZoUEZBaHY0MDUxWDVD?=
 =?utf-8?B?WFZ2RGtJMzdqQmV1NlBFamFwdEdWMXlMTm45by9PcngxTlFCalZ2RFpvNnhH?=
 =?utf-8?B?V3lBUWNScE5BemRLbFZTTG9BZitlK3M0eUs0WmZxbkZzMWZ3Ynp3a3pyS0pP?=
 =?utf-8?B?SWdNN3FVeXRFWUFlK1dqWmgrMGVPb1dWdGNlYSt0U0Y4NUV4MU8yU3hiemFK?=
 =?utf-8?B?QmZRcFpKMzdVQVVvMkxLSGQzaDJvbDFFQ3RVWUVBdVFTWjlIYndDRWxWUUQx?=
 =?utf-8?B?MUdRakxVVFM1bmFGSVR3bEs3YVJ5U0lMY2RyUHBBM0JROVRBKzZIMHNyN1da?=
 =?utf-8?B?bm5GM1FGVGg1VWFHVGJUaWkvcGpVTHExLzVERGc3Ymx6OVJLWklXYzhIUkpI?=
 =?utf-8?B?ZWVHOEU3clJjUmRNckJDN3FzaHhreFBVZkZ1eHpBeWt4NVhaMm4wQnNUV1Bv?=
 =?utf-8?B?TzNhejFkSUpmaGM5MXE0eWlRdGk5cm9aWEtZMFdhSkVSTmVvVjdiWEZuMEoy?=
 =?utf-8?B?d0FUNGYrQjJIcFNsV3FxNlZ2b1IrZWs1Ylh2bGEwSzVqMVNTR3RtTzVxR3Zp?=
 =?utf-8?B?bndUSlBDRDlXTUE2QmRaMUpkK2d5NUR3S1djWmdCOWtzaDdOV2JZY21yOStL?=
 =?utf-8?B?cXdQczQwOTZCQ1c0VHN6U29sTmJ6anhZRjNoWE5MbFJFYWgrbHVKUE9uR25z?=
 =?utf-8?B?ZTlPMklLZGowNm5XZ3lBc1BydXlLdXhuMUJmRUpKQTFwRHN4WUlqYnR4UkJo?=
 =?utf-8?B?aFNLK3V1cnBQRE0reDc4WnlQOFJ2R0JCQVh2OERsVmxJSnBzUnNrQU5PKzEx?=
 =?utf-8?B?Q0grVmtoNWs4aE45UEZxNEV0Z2RpWnovZjlGSXpjcjlqS0t1eE5RVzB0Nys2?=
 =?utf-8?B?eFpTZ3QwVk52azlkdHErSWVLMkZueE9DZmRuUWcrY2tYNFgyNDRsZVpiUCs0?=
 =?utf-8?B?RE5SNldENEhsSm9GNGE3RDRhc0Q0RGRDNndlUjVwSDRjMEk0anhMM3FUK1V0?=
 =?utf-8?B?MHVKUTljaWR1d2Nhd0IvUWpPRWU3ZXVVamdTbkhiN1RKMDBLVjlKMGZPSGV0?=
 =?utf-8?B?bnlxRGhhNWFjSEp5MEdKYlhHaUpaa05iamxxdnpPeDkyZUZIaEdwSE9iZi9R?=
 =?utf-8?B?b1RIOUJDcXV4SCtpT2RGTUYwQWwzd2d0bXIvZzVoMUdLajlaUWtUMVFhL1N4?=
 =?utf-8?B?YzBYUVVreXRFdmx1R2kxUHIzSnh6ekdTWkU3TTVnd2U3b3VEcVNNMllXWlBT?=
 =?utf-8?B?TzN2d0cxNkFxUDZWcFYxa3ZJWW5nZUYybGRnNUtKY3JyMW9TSUczb3hkT0tz?=
 =?utf-8?B?dVNNL1pVS3ZaVnlkM2dwNm0wbGVtS1RVUnNKSzdFT2Flc3BWQ1hvR2lWbzgw?=
 =?utf-8?B?NVZoWGJhTHo5aEowaWx6QlBnSUZ5bThTem5MTTYzWkZXa0FSd3RQV2FNcTdT?=
 =?utf-8?B?R3FxMXhZUjVLTzB1UFI0ZnBsb0ZvaEgxSzJnTUh2b0tZd25BWEFRZVlnckpW?=
 =?utf-8?B?SEZHQmFXWXB0T2VML0tkWnpOTVhoSWZwaThwdzgxUUEyVXdHWndyeFhFY2hS?=
 =?utf-8?B?UEs1eVgrNFo3cUlTdTlreUxTeGFjWmh4S2haR1NYVVY2cWhHQkFOTkxUOUhE?=
 =?utf-8?B?cmR6dUhYNm1GMjI4Zk56ZHdSOHh1bVdKUnE0VkZWbjEva1ZMWnVhTW9hZVkw?=
 =?utf-8?B?MEt1cDVjOTZMWUZpcGhGNFIvekNuY2JiTGRpV1YyeTRNVGMwTlc1eGtTZm5J?=
 =?utf-8?B?eEh2YklDd1lOT3JuSUI0R0dYNDJLcU1UZEN1cnY0bGNWRkFQbk5XQTBmY3NN?=
 =?utf-8?Q?AwXvdz2IoLkt9J7Y7uK0FfPL7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 123ef1f9-4914-42ff-497a-08db6b174de7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 07:33:23.9622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6h65E+pK71G0b1BhTZDRdHH27vXGhaP7YbrfUKgSxHNYQrfIfviGmb8gc0cqMWBDmXzvtQ1+iakS3sB6DePyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9840

On 09.06.2023 19:45, Stefano Stabellini wrote:
> @@ -133,6 +146,13 @@ existing codebase are work-in-progress.
>         headers (xen/include/public/) are allowed to retain longer
>         identifiers for backward compatibility.
>  
> +   * - `Rule 6.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_01.c>`_
> +     - Required
> +     - Bit-fields shall only be declared with an appropriate type
> +     - In addition to the C99 types, we also consider appropriate types:
> +       unsigned char, unsigned short, unsigned long, unsigned long long,
> +       enum.

What about their signed equivalents? I'm surprised that I found only very
few uses (in Arm insn decoding afaict), but they generally have a purpose.
Are the uses we have (and new ones which may appear) intended to become
deviations?

> @@ -143,6 +163,12 @@ existing codebase are work-in-progress.
>       - Octal constants shall not be used
>       -
>  
> +   * - `Rule 7.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_02.c>`_
> +     - Required
> +     - A "u" or "U" suffix shall be applied to all integer constants
> +       that are represented in an unsigned type
> +     -

I continue to consider "represented in" problematic here without
further qualification.

> @@ -314,6 +340,11 @@ existing codebase are work-in-progress.
>         used following a subsequent call to the same function
>       -
>  
> +   * - Rule 21.21
> +     - Required
> +     - The Standard Library function system of <stdlib.h> shall not be used
> +     -

Still no "inapplicable" note (whichever way it would be worded to also
please Roberto)?

Jan

