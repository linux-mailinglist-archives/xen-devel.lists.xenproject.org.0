Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8FC72C944
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 17:03:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547287.854587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8j4t-0005Fa-0j; Mon, 12 Jun 2023 15:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547287.854587; Mon, 12 Jun 2023 15:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8j4s-0005DN-U6; Mon, 12 Jun 2023 15:03:30 +0000
Received: by outflank-mailman (input) for mailman id 547287;
 Mon, 12 Jun 2023 15:03:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8j4r-0005DH-8g
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 15:03:29 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48887823-0932-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 17:03:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8889.eurprd04.prod.outlook.com (2603:10a6:20b:408::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.41; Mon, 12 Jun
 2023 15:03:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 15:03:23 +0000
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
X-Inumbo-ID: 48887823-0932-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRmgXruB8H8w5hhNdEyX9Ek6N/txZKdpKbhDxOvW7UAt2+ZQ5p14+j6oec0LpK37lzUwwqT2g1LqmekJpHousPa+RpnTHIYBoJkSiD4mCfoPEUCMbeC7zwNTECqBaaujVqfXS9EL1r4+sFeWG/F6hm1/T4rv8ubgEkw8R8zbuarLdxa8SUFKn46Q+WvT7DismxVjQ1mMJ39ljeZYMAueV4MeirbTHF+GTNl34IfT1XZuBda+0+4ir6du59+3lR3VcX4ria1X79PBo9Cp4DJ6Jsl5uOmkcwMP1V3DUR/xvYKAIxGoe1tkEQYiV7uolKmSn8D0nIul3ZcITGCzeHlFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksw4XH/LbdgL2gKyz7+BfWyLThYmYQ83bPe3RtvIEdY=;
 b=iv/XU8Kv3oINm7WUEZwkq5suwS93kYkqkEHPRinoJc+/ydHpor04mBJHqFKItwzy2yRTpPH+jqcJnfoitwN2dxhk2B4zIHWrF33+h5eMEAblHbyEMxURrLiV7rsTp8T0dPZyhO98Nro8lEiw3Z40LrUN+clUeX4QZE4nK7er8o346fQL+qXcmieFu+73tDmSAoQ42x3FsAfC1TfxmaS9YgvCnjCzKoNH0BA017Dp7n/jy5uQv82GuR1vA5pIiuLyO9bjr53R8bm1ri4P1pg82lGThLQy2AxRRnO+zfkfMpR1fGZwzBGeCQUt5e+zDv5Ik8qFegsrbh/bPwTnzNYcDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksw4XH/LbdgL2gKyz7+BfWyLThYmYQ83bPe3RtvIEdY=;
 b=BzRrc00EikTEZFNh7uUAhJmZbv156Sgi787YTiyc7+oG0LmG4J+K6+uAoIXj/mx+5Qjsp5pVBn4+dWDr0S9f4Vdd4RFL+8J+yzWR8XJcFKK/RdJSb9Ehx8Q4wjK8pdPl98fxYho80ZizPRNIWNsa+dE+jeDTr6xUvEw4vRLY0oBbwzbp437zjbE54TOWbfUYNnghpwA52WjXJyC/EzJgWCd/67AVWMDbJYnbzeMtHSP7INh5DCiuj+dM/3+R3x1ruOn+02koFf9N6ji7dxCpBcUrbBsX24bYCkWaoWEnEfhObbg8mKnr4+F9mypY3O7rfJeJUHPmMikOYIykxDH8GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c646d172-1c4e-c8dd-789a-8c0cd16a89c5@suse.com>
Date: Mon, 12 Jun 2023 17:03:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 4/4] maintainers: Add ppc64 maintainer
Content-Language: en-US
To: Shawn Anastasio <shawn@anastas.io>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1686580752.git.shawn@anastas.io>
 <b15baf2dfa8f9f525305ad03c9d58cec4f7775ea.1686580752.git.shawn@anastas.io>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b15baf2dfa8f9f525305ad03c9d58cec4f7775ea.1686580752.git.shawn@anastas.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: b753c8bb-71dd-44b9-f000-08db6b562ad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H1VazaXDkv4fv5tvHZtLUdiPJyQ7ZjlXaAE88j1F+/B5+eSYyVDMM6vWQJz+sikcskYa1dLGsCgbEvYj5QlAsCagMhcf+siUwwnFyZaNlqKOI6NXzwfxh1NoYEgCeA1gLksBKHTIl/Owqvo4Ez9P+iC2qMMXTbwHLSYMZw62IDZfmUzmLf9SEHtb78k44JAj4GFZqcWgqB3shXwb3RGZBBQL8+ei9uHWmik9Mub/ENYQibhZWYbrKMI8o86AIT3bHAgvIoqgPrYet4dRMcZ/Y88J2xZQJczZFCvJQu7OkstFFryRLOJwKQy+znp//RP+BvkALlH0xdS2BeSAAAT3wrtfxKCBOxGq24tYZpHJp7NFavS//0ue20JBZw2dQXjN7UnE9fhF88IwXvoTCAiC6Kr3xhiC5dbiUl3ah4iAj7/TJ8h66Ilu1gcAPdZbiU3oFPXBCkk81lCt1kp3Y5qspCNpDbeTFa54BMt6M6okZCVSNxX3NDz522PB26a7b0l7ewo3mJ0t/E0GtzBmkLpahhIfbPRqCaNIk4B77bLUU59Rmajs70+0vwojg29ZZJEZX5tlxx98qVTLdQuy3Tl1p7IYX/VfzA3kE5TwkpFH9L951QTYn/WqBg9BPH1g0vZqknNUwA8Qp7HhcSaWQNMkDUNcf7R3NgpihkaFBEtbf1xT4bB9IHj/t6sXxWSAm67Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199021)(53546011)(4744005)(2906002)(26005)(6512007)(6506007)(186003)(36756003)(31696002)(86362001)(38100700002)(2616005)(54906003)(478600001)(41300700001)(31686004)(316002)(66476007)(66556008)(66946007)(4326008)(6916009)(6486002)(8676002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUxnclhWa25ycytkMnRybnJhbU94T0t1UWpxTnM2dDcwQVAxdjVXbWkxL2tU?=
 =?utf-8?B?OGRSRDZ6U0Y4a2dPb3JjUXh1dmRQQ3VPQXZCNldEeUpoVCttRVlzNktjNkdv?=
 =?utf-8?B?dVBXd0RsWFlCZXUwVzE2VTMxL0hsQ0tOQ2VOenpRSFdublpDTGYxRUFFZ0lM?=
 =?utf-8?B?VldRZW1xdzM3cnhFeFliTkYzVXNsSHc4cjI2aWYrRk44NHdRZjRJMGdXQ0NI?=
 =?utf-8?B?ZmxiZWJENld6eEhYdGZPbjcyVXNtekR1TWhRYUJobWEyUXZDb3JleFMxQWVT?=
 =?utf-8?B?OVp0eUFKU0pVMmx0YmdxOUtxQ3ZnYzdYUjhhTHNTMmZXN050a1RHMUlWbzVJ?=
 =?utf-8?B?UzIvSWt4RXdCWUt5MUdhVVRuczJTVmltaHBkdlhsdmhVTlVRaU5NYnJnQlVH?=
 =?utf-8?B?N2tUaHJybXlwZVlyTDV3RWdGRkRQaVNIY1lyQWMvK09GOGE5YUZJcEhBN3hE?=
 =?utf-8?B?UWtrK3RFcEw3K1U4eXp4Mnh0b2NVbzF0M3pZU2VkcU5ZWHVLQnB4eVFOZS9a?=
 =?utf-8?B?OVU3ZWd2b3kyQUxmYU54RzlKMUhIUHJCTE5kci9aNDlOZEhZcm83bXBwWkdn?=
 =?utf-8?B?UHlTQTllN2lHbEJQeVltNUlacWZMOWFTV3dRYThMVUZ3RS9kMUtFc3dqR2ZF?=
 =?utf-8?B?ZzExMStJaWtacWV0QVZ3WlhJOGlJNjJWb3UvakkweVhTZjArdnF0bnM0TzJy?=
 =?utf-8?B?Y2xrNmZGTVV3Z0FqN1pYaE5UaHVOVS84dUg2RG9tMnJTeGNVaWFQS0x2OERu?=
 =?utf-8?B?czBrZkZXSmJJc0Foa3Q3cGNucGlmTFJQU0xXSGs4VHdKb3ZoQ1RGTUo3WG5o?=
 =?utf-8?B?SEc3ZmtYdjN1L2d2OEY2RmVrUERUaW1vTEtqS3M2QmlvcEJHNnZzZjlxbUtt?=
 =?utf-8?B?SUtVWkdxSWRuOW5wejliZHAzODQxYkxJOWRGcjhTUXpVbVRic0l0NXlwdkEw?=
 =?utf-8?B?emRpVVhuS1FhS1R3UG5EcnNoL1ZJcGU3SW5WOEZlaUpwclo1NEFnaHJDMXlO?=
 =?utf-8?B?Q3lzcm9LdDIrZkhPaGdkeHhXT09TbkNhSXNvQ0xIdWNzWmJmWjFPMVZTTmNK?=
 =?utf-8?B?dWZEcld6cGVJcFpJWUo0Q2grMXBoc21FYnhyMG5FV0JGZUI4WTVyU2luSEZE?=
 =?utf-8?B?bkZ3SEhzb2ZXOVNaQlRUNkZNSkVzT2FydFViYmRXdjBaQXBxbnRZeXlwMW8w?=
 =?utf-8?B?QXpwNXRjZnhtNzJhbS8vRWdsZm81UUNLTDFHOEUxNUFGcmJWT1ZtSks3VVV4?=
 =?utf-8?B?U29KK2xCd1I3ZzZtcGlSYjI4cm1PQmNCaW9DL3g5RGpCdDZSZWFKZjRQZnRj?=
 =?utf-8?B?YzcwN1VQc0FVOXdua0IwNVA2enFVb3VWR2ljbHE0NUlmNVp5SjRZWUFXYjlX?=
 =?utf-8?B?Y2tabUk2Z0JHUWZkNjh3R2k1ajU0SitscThiOGJGVHFLRWc1eXJkL1dWQlJL?=
 =?utf-8?B?NXloNHFRMmRoYk5kN1hwN3Z6bjFyQWpCUmQzbEREaFpOL1dES0NORE9QWGF4?=
 =?utf-8?B?cVg2QlNGRDZUZE5mVDk5ZDJjWjVRZU4rNTM2aUcwVm9rV3JZQVJSS0ZOSXJC?=
 =?utf-8?B?L2tCVVgxeXpuWXRSZGN5QTd1RjZ6cnpNTFA2SEI0Um9rSEtqcytkK3NXNW1T?=
 =?utf-8?B?Q1FVWmFIRUpGYTlDQjBBWkxqN2RqYkhsUGlDbVRsVWlDOXcydlM2aVMzS2tQ?=
 =?utf-8?B?VDlBWFF2R3lFVDkwQUE0VTRjTkczV1RZNWVUOG1DbkFTRHd2b0t1LzBCZThJ?=
 =?utf-8?B?bDhpbDh3L2I3SGtrRWdqTUZhbUxQdG5wKzIxYk5CTEg2dElqTzJwUi9VWEJu?=
 =?utf-8?B?Q0xFTmZBdnZVMEd2eTNTRDB4cER5cjVxNG0zMlhrckVqYzNjUkNXNGZ0Z2k5?=
 =?utf-8?B?a2tLRkpCb3YvdXZXMjhVaVhNUWpydzhmNFY5QnJ1ZzdzR3BmNzdWM1JZNzVJ?=
 =?utf-8?B?WWhGVTJXa0ZFSHBCR1JkUEVvbW9oTGNVVDI2VDJUOHdIZWNBbXJreTd3d1Vm?=
 =?utf-8?B?U0IxWDZ2c3poekUyRWJYb1RtUU5aTzJOcUpKYjlSeFkrWWF1RnhhVVZFN2VU?=
 =?utf-8?B?ZXZEcnAvcEUrU2E1ODR4Q1lCTVJiNEtPNWpETHBuN08vaXArNTdBcWRIL0Vh?=
 =?utf-8?Q?rl8hRuUVikVCbHIApaGYKrJJY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b753c8bb-71dd-44b9-f000-08db6b562ad6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 15:03:23.4816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBQkM0x/RAGnBmzGB7AOLVQEipUzfaBoQsNaQtB7meoJrrTjeSAR7jFiba6kc3A9Dn/F5zN7vZ/fQ7e4g0cuhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8889

On 12.06.2023 16:51, Shawn Anastasio wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -460,6 +460,10 @@ X:	xen/arch/x86/acpi/lib.c
>  F:	xen/drivers/cpufreq/
>  F:	xen/include/acpi/cpufreq/
>  
> +PPC64
> +M:	Shawn Anastasio <sanastasio@raptorengineering.com>
> +F:  xen/arch/ppc

I'm sorry, but two nits again: This lack a trailing slash, and
padding is done using spaces on the 2nd line instead of a tab.

Jan


