Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AA9577F2C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 12:00:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369475.600906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNY7-0006Kc-Gp; Mon, 18 Jul 2022 10:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369475.600906; Mon, 18 Jul 2022 10:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNY7-0006Io-Co; Mon, 18 Jul 2022 10:00:23 +0000
Received: by outflank-mailman (input) for mailman id 369475;
 Mon, 18 Jul 2022 10:00:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDNY5-0006Ii-Nr
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 10:00:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ed3d946-0680-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 12:00:20 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR0402MB3584.eurprd04.prod.outlook.com (2603:10a6:803:a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 10:00:19 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 10:00:19 +0000
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
X-Inumbo-ID: 6ed3d946-0680-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJlrxNSfDHw+VY+fQ4x5tYiRkRUonC+QApLypJglL+kvJDa5mQue4Z0U7fBZ5Bn7KQRvQcKnam4hkaEIEEFooroUdwHY0HP75Qm+JimyWSk23g54YJL0HJ4Sv6A7kd9hNmud+RLSPtIZiaeIPOB3aogvfeP6JbhQE1dkvyJ7e7OG+MXj01HZfKqzElm8hlrgri5KftlSMHELZmsVzV+G0TnnA+B/01n9K0xZr1rXcman44osg+2C1hqThi6/eSz/1cVNuXHIEfFXzMgyoW9u6bN3dFGBNWu7THCt07IC7uERhXn14+lBk+e8wNq2+UjdN/6ysYc616SfJN03jVio4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6RRE/7vyec7TCnmbMoT+grO3CN/b298eviZj9dRqUU=;
 b=WWcnDLQvmdKJtlgt15DYtQRPTFdxL9Z3WxonsbwpmK9Y5xK1euM6dtUfGoJySG8GI1R82hw9tSofG01LIIyuKLP+mtF85s1NPmaLbDYIdLPYdewfbz6zJtJqF0vUIExm1uaS6+RnC6rszyJqxEdM6EhzL9bmf08cynNcMa5v3Hz/Qnz1p7l7QJs/6+yq+G7dFXYG5bYKJtt76GRpxaSWR7N2rnI2rSlM+8cnjmwsMqC/8TNOD6LTg6Edj8dF8pr2UfKWIdGe33rJPJzdQEnC75iQs1dOvcWsNGmTCFfM2xiG0aQEYuf5sk2w+Qqtf/eUtaw9SGYF2OXzkCgNaRiD5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6RRE/7vyec7TCnmbMoT+grO3CN/b298eviZj9dRqUU=;
 b=SxLI49Yt9iktw8E+zApvFXPuRZF+HXp0pCbxKQvd3Eywa76rTAeISDVnpcQFrpoxHnXcd6nJzjPIMnOcJZ+g/2d+qjW3EtfbLCT9yingGeNAEaNXqVFRt1ruD29ez8yPrHEpxaxLoS2sJ/ybzMMos3FElY1zEtrc7YwtNPQxGjsY8RAf2y8nHp6kCEovYzVS6OlKurmRinUBUtswJsfbpBfrkNloeJj9bjzzbI+hdoPxuk7THtD/V5x6MxYm1GNyhNbevIYN7DvIFXAd4whChK3UVkUOsbogpzSM+t9EpHlnN1jhdgFpsiOfG0mq0lfDWVVw9dbjGNZPxWZfTnzV+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40b1ab24-5e94-ea2b-c9cc-6efa5418d283@suse.com>
Date: Mon, 18 Jul 2022 12:00:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] xen/wait: Extend the description of how this logic
 actually works
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
 <20220718071825.22113-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220718071825.22113-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::9) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d65cadc1-e7ca-43a9-cde9-08da68a45227
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3584:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QKV8HXsZP7qD8QKjEYzPPaR/jq2xgrQwQxBHCXU159DGzmanmE1Up2Gitx2Ec9//eJwjBnzCso1kAGMKwpJl4DxdZ3L02ZeA5hRkLTqCPFkV8ls23qePRCnCjYEDYm1s4UHiEk4etPid0nNwFgkzdhyFmI6q+PXCOeEd3DW1is2WPNenBjg5rKZkCKpqo/1RvGljr2IOZlQuriSh8uvkMe0Or9z0Lu2qFTT6XDKzbH1zQda4aO1B00pAX5vmn1H0n0fUK803T0B43Inw3CHmJf3RXC0eja4CPFXVDFsTfEemHwoB5RNrNEI+ktfVeDI1eCyv95XL2pkE0GrBTN2YXV3QKwFdr7rXMw6e7Ovg6BhpTwSQ0hQt/1Vk6LC+RmBzoohmNEK9y0hZ7Axtbc8irSc0hKnAlnMKA315bBzcw5J4ybuiLXC3+q7TrRc70cjGujfYlRT1CIrnCAHslchalrOX9NAkIlnLAGibxbNYmeNu24rw5IE8gHCR99bV6t1MDv/wFuxC1PcwgnJXRHpFk7UAYFqu90/78XDSoFnCVRqR3XK5oNaqC54f64tKDBkdA+hGOJZEVf6reipJaApDkuWbChPft+e+PZS7PHjD8/Yxd5vqPMBFNNibwcY22tn6McgzilH46mJyRLn2tWLzHr8jdKsCDMtCKEzAHT4KfQLk0quZq4yQSgLpdg4ADp29F0PdrLgTZILmqfTtJ80vaajLnDkmneqXd664w8PUlDLPSq0LYuXVc0zcPPrxtlqr0GwkxKkMY8Q/+QAIEpwNp3x9YS532Fgzb9N6RrbwRUoAlWBNYaQta80xrRg2p7NizT9TS0J+jUHwZS6K31vuJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(39850400004)(396003)(136003)(366004)(66946007)(2616005)(478600001)(41300700001)(6486002)(186003)(83380400001)(36756003)(31686004)(8676002)(4326008)(66476007)(66556008)(54906003)(6916009)(316002)(86362001)(8936002)(5660300002)(2906002)(31696002)(6512007)(38100700002)(53546011)(6506007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm9jc2lCTzdkRDV1UDlUeGx1cDhzbEJweEtuaFBFbU9KMHQ2NFlPRlZsb3Za?=
 =?utf-8?B?SmU0WkxXbllUNGIyTVcxeXVCZktOa0xDUVhNS1g5cUtIQnY4bjFIdnpFTmFD?=
 =?utf-8?B?T3FlNitJZERWN0cwZmpmTWhVT080Y1RjZ01MNDBVUGlwT1E3QmxYOVRWeVJn?=
 =?utf-8?B?Nlh2T0VmajhiRXRPSE1uNnFmOXFFeGtxSmY2NVh1emFsamtQWVByUWJ3d0gz?=
 =?utf-8?B?RUYvTWh3K0tCV1BzdDFteU5mVkl4RUp4akdJeXVva2ZPSWFvR2FtbkFxTVdP?=
 =?utf-8?B?YWY5YWxEdzhiZTJ2R2plZTdGZVpmVlFGYWRaMytwNk9TcTlucW1lQ05RY2My?=
 =?utf-8?B?dnN4L1dacWgweUFVZ0FxcHlLWDlXTjhienNpY3ZWRE9RV0JDVS9lTFAxSTc3?=
 =?utf-8?B?UWNCa3ZHT09MRDlxc0lWOTlGUUZjRTR3MUd1SWs1aGo3bE9jblcxcEhNN2lk?=
 =?utf-8?B?andQWVZSV21ZeWVnZldvZlpPZGlhOWZRRk4xWEFIcGsycjlnQTZmZjhsRzhw?=
 =?utf-8?B?WHJkKzJjZlVVYXp5NFhvSmcrTEE3S2R4ZkxySVFZZWhMRndQbGtBN29KYlJy?=
 =?utf-8?B?ZG93MThjUlBoVmlaWE9FSEZvOEREdHNKaStHejFxeWJWRzBEUlgvV2tLam1i?=
 =?utf-8?B?YURxbDQ5bnJWVmNiUUpqbkhUTytOSVJJL0MydmZSN0YwbUtGaGRzRm8xUlg0?=
 =?utf-8?B?TUlaRFhKM3JuNkN0MlBveWZlYUhLZVlJYlR2Zm9Tem05TGNvNGdrbGVNZlVF?=
 =?utf-8?B?YnVRSVowWVQ3c21ZRS9keWxiNmRiZjVTRjh2VDIrZk9TRHVTbVQ4WFRiSnpL?=
 =?utf-8?B?Z09NZ3dsTGJQS1FDMmprNVdiRit4QUtyams5cjE1ajhsbVBxcEhYdjZRdHF5?=
 =?utf-8?B?WEloL3NRZi8xZ2ViM0VWQTZEZkNlZVV2N0Q5azlpR0xUY0Z1ZEE0a3p5VFZW?=
 =?utf-8?B?MjVvSEt2VVp1cW1aVjFweERzQ01RNTNnVURPLzFmQWNXU0YrcXFTSEo3T0xD?=
 =?utf-8?B?RGZuQkNEcXpxSHdod3VKM2ptQURadnJOOTUvTTVVd0hWd1YzdWhLSklzczRa?=
 =?utf-8?B?bEMrTm1BQ09mZlk2djdRMHcwY2xuakxsdHhhNmt6ZmpJRCtaVTRJa1MxZFlB?=
 =?utf-8?B?TmZrR1FQN2ZtR2NVT1pXUG1JNGFiQXR5SFVsZDkyS0NpL2ZUZjBYVkdDSmQr?=
 =?utf-8?B?S2xySnJQaUJhQktZV1Rubi8rZXZyblBlSW9tQkxFU2Q1djFwZjFDNkRQQkxt?=
 =?utf-8?B?ekxKd0U2Rk9xR2tiQ2hUUWwreTM3RzhnbzZrOEEvM1NrUDRZb0JGVldPN3di?=
 =?utf-8?B?c0tGajg1UE5OK1kxTUZBQnRObXVlR2M2aGVObWxCV1MxYkdXOW43WU5YZDJC?=
 =?utf-8?B?bmNaNExIbk4zWmFtOGRoWkZQYmV4RTNGaFBQeTBLeDUrV1RzRUR0eHhRSG5F?=
 =?utf-8?B?VDE1UVBaTXVNeDk0MXJ5YXMvWVVCVWtrTHZaN3hsSnlKZFJwbGF5bkR6dVd0?=
 =?utf-8?B?T0J0QUU3V0lWRTRrazRPVDVoblI5L2JpVG9IZ2FGRWFPR01wbUQybDJnYW4x?=
 =?utf-8?B?OGs1ank4eng2T210SnZINU0zbC95S1V4TlVHVEdFajM3d1g5aVFOUlVuZ1RZ?=
 =?utf-8?B?NTVXakEwdEtUaDlDNzc1RC9zeU9XU21NT1laem1hSGFic3lBYkJrSUdOZUlx?=
 =?utf-8?B?WllqK2FQbUVoakRpYzYrOWVvUGhDMytYaFVGMUs2aEhXNmt1bXFjZHFjc0ph?=
 =?utf-8?B?ZkM2b2RyRjRpN0E1bHplbDVOd29tRWZLQ0JUemc2aU1BMWh2MWRHazdIb05B?=
 =?utf-8?B?ejIwSmhzUVk3YWI5czU4dHkwNk40Q2hLd1FsNTlTMmpyRWhFaVMwUEpLclFw?=
 =?utf-8?B?a05ISGdUVjRzSGh0TG5RVEJtQk9HdXpndEczYjNMd3JWTDJ6RFV4bzRORzBZ?=
 =?utf-8?B?TTlxRHlKUDB0Vk9xeWtzbnpZSHZrMzI1VmZyQWVQMVEySmVwSjkvOC9mRXI1?=
 =?utf-8?B?VnM2TDgzc0p5aW4rUm0rcFhMVkp1cmtXTDJpcS9tMVhMdDQwK0FJaGVVTzBI?=
 =?utf-8?B?NlRoeWt6eEFLbllYTThHbVdWQmRtR1NMcGNaRm1rQ1Q1bEpoMi9ZT3VKcGM5?=
 =?utf-8?Q?ln5cZ0bTEkXjVkJ+CXJCHiCPN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d65cadc1-e7ca-43a9-cde9-08da68a45227
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 10:00:18.9705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QXqoZNtZjYQSm7tFIVXUS3sEp5EAZxI6V5dnwRQysWEWCzx9CRjIIfKJTUbomAcUUQt+qFabBn/u/jW2oMmww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3584

On 18.07.2022 09:18, Andrew Cooper wrote:
> @@ -199,9 +211,18 @@ void check_wakeup_from_wait(void)
>      }
>  
>      /*
> -     * Hand-rolled longjmp().  Returns to __prepare_to_wait(), and lands on a
> -     * `rep movs` instruction.  All other GPRs are restored from the stack, so
> -     * are available for use here.
> +     * Hand-rolled longjmp().
> +     *
> +     * check_wakeup_from_wait() is always called with a shallow stack,
> +     * immediately after the vCPU has been rescheduled.
> +     *
> +     * Adjust %rsp to be the correct depth for the (deeper) stack we want to
> +     * restore, then prepare %rsi, %rdi and %rcx such that when we intercept
> +     * the rep movs in __prepare_to_wait(), it copies from wqv->stack over the
> +     * active stack.

I'm struggling with the use of "intercept" here, but I guess that's just
because I'm not a native speaker.

> +     * All other GPRs are available for use; they're either restored from
> +     * wqv->stack or explicitly clobbered.

You talking of "other GPRs" - there aren't any which are explicitly
clobbered. It's only the previously named ones which are. Hence I'd like
to ask that the respective parts of the sentence be dropped. Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

