Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4749E78C6EB
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 16:09:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592283.924959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazOe-0001xl-CD; Tue, 29 Aug 2023 14:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592283.924959; Tue, 29 Aug 2023 14:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazOe-0001vY-9U; Tue, 29 Aug 2023 14:08:44 +0000
Received: by outflank-mailman (input) for mailman id 592283;
 Tue, 29 Aug 2023 14:08:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qazOd-0001vS-Oy
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 14:08:43 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe02::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8df765fa-4675-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 16:08:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8713.eurprd04.prod.outlook.com (2603:10a6:20b:43c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 14:08:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 14:08:37 +0000
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
X-Inumbo-ID: 8df765fa-4675-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SijxzM99UPe6gXd76b0TG/2Hl6W9EApSTV0KgXI8smAKC65rTP5mvs3ZwfeSdwFLN8BCijN1hlJ7OoEsnuXIuX0+djw3kJneUdkqeGzghjclitLIfcjfV+dj7gNFkhVstsfHbUwfZktkyIJbJbSGuj4TdYi0VcbPeNuiYS9UBsSp6mlg9puYfbXNHIYQvI5YFcZyaZwF87eylU3flUOa4m3swYgiL8MzMRBeFI2y0vvS7A3dx1ULWMVhNptgQFDiqtY6sv1iDqVt5DTfX17U7MO3mCEU+xuH02SKoKU/GR2zVHEV/dhW6k7d2LH0w1Z2zQLvzx5xp1aocJYxxb5f2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBjWMeAXAUbp7nsm3VsY1tiOf3/AotUMYZW5z3l6Sss=;
 b=YQjICOIlzEkz5tSzIBtXCzEh2Q4z/3zIrm75kxnNYBt5Wrqpg+3cv9rhgDU3Mo50tBB2Rxv2ZbS2LJ1DO94WIbjKF4CwJnuwJWOUlTh8S3oLtuac1wOzdXvPUqp1ImX4ia1aD1Z1uGQEOUCX7fO3XzX5RKZ2f/V4FIGGdTjaz3yWMVrKQPkagB8setTi9iJUchwNJg2j150vqG5FmCMkf4ArQ1gfukXNMxJDloNTz/DOUTbRF15Nsoc4g2JEXyW9zbc+X2itY0wfq7djZRHvAHF05wi22arqRnobrmCoUXl87LYG5eT7BT/IakRQGM1oK5koevgie2sFieeB8FyO6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBjWMeAXAUbp7nsm3VsY1tiOf3/AotUMYZW5z3l6Sss=;
 b=aJb5f91v4bfHTpXXaXKjwH8uxEQO2NX3dxI59+C20wWOEkuwdej1mMo9fM5tnh0dQDsl0djg5A8ruElX/s8fGq4AeHRcGIaGQ+bu93oSFRXAnhA8gWfnebfq7Oo3VfDh9pAGwigMl94Q6RWsUhC+pnaMS7PKQi15WnfpnxVMbj58ttjFsuvk/JPqKY01zCQa/j3qBNSUkI2Kt3l4MB64+ElDcUvoX8KJXZzhk3aCRRdM8ujFVEKQF7ODneJDEjF4rNDEuAvZ7V9GB1LspPURTqegieSeeJrHpTefaDpmYEJ5PtcuFniaB3B0+z4oBsi5P78LeQ7tZH7Qoh05orLhnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6217ca42-d5bb-40a0-53f0-ec543c8297a6@suse.com>
Date: Tue, 29 Aug 2023 16:08:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] x86: Reject bad %dr6/%dr7 values when loading guest
 state
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
 <20230829134333.3551243-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230829134333.3551243-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9560dc-6f30-4338-3b56-08dba899708e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	98x4zJH5jO9bMEwGqTONxOjNrPhjSdVgb0X1pB9L3U/eg5paX/gQCeOzL8WXpGbhCzDpQJrdn7bCFJDkLVhWovFeWgDVD2iNVjoTm7oMZmH4Xh1fMHztOLYFPlKTRqa2OWDfPiciNWWvhqogbAGZA+qgX3bD3j0KikQ5tYF34HY2UoCwZlC1aANixlWWXK/PnZ5km6iGeoUpbFIF9EwTbT7QkYC7rqGfbfoJlvUA1o5SDg68WV+p0EOVQ+iPD+/QLHf3o6jfPQQHBMiHijuKScGlHrdEzDaw6+BP3QNVNEqMqMaKj/LtiAIADzEwOCDaKJQ16i114NOvX5No2FVUiLFVYmB3W3Zn3WbCBs0+ASe0ZdSIeJZwTajA9Uk29azw75pIQdjxmkkpW2YNsh723pHYFl3M95RkXm3DEJRtpRXFJMdtZjKzOv6r4mtOnbqCw5rTF3HEToCuyymmSs7WsZWUxYULjA0vuh4ymTBSRBbrXLAoslJ6+2RXzW1NY4IkPBsFJu8Wt2GC3kAxnGXIWQ9wa8QbbQwACbJpzCpVp1umGPdniLT9BRutvlzrsQm9Z7mBQszHpJEhYObuTqEOmBMaI0m0vqIpajZqKWuYvHuB8MRoYDWMZ46HOFLjKzhxXsYxXw3wijdzNIZppkdBYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(396003)(366004)(376002)(136003)(1800799009)(186009)(451199024)(31686004)(6512007)(6506007)(6486002)(36756003)(86362001)(38100700002)(31696002)(478600001)(83380400001)(4744005)(2906002)(26005)(53546011)(8936002)(41300700001)(66556008)(66476007)(66946007)(8676002)(4326008)(5660300002)(6916009)(54906003)(2616005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zjh2UXpFSUdCM3E4Q05GenM3ZXh3TW5md3NrVklQRzVCdEkzWk11TXlISGli?=
 =?utf-8?B?TEczOUs4d0pjaFZIR2NuQXhOWVZyUHhuaWhjWENBckdzZGdsYVVhcHVuNnVU?=
 =?utf-8?B?bDNUMURRZ1lOb09tWVp3aEdvb3YxajJFRHMzaGNoUU5DRFlrd0Z3dUlEOXFR?=
 =?utf-8?B?em96VTAxN29YeXZFZVRCb1FCbC9HYjdwN3NQbUV1STFOeVpmQXRUTmxxbUk1?=
 =?utf-8?B?Y1V6MDR0bmFEbVBJV09VZEtKYnhZSThaOHNWSnArQWRGczIvdW8xYU1xYUhF?=
 =?utf-8?B?SHdHZEgxS1lmUm5xMm4zeWM1eVlXNlZVMDRHbEp6d3JnVVNTYnpZZnFDMGZr?=
 =?utf-8?B?L003eU5iVDEwZW9JM3QwM1hmSlNvSitYMEQxc2dGclBGOWVCdi9lOEhZa0RZ?=
 =?utf-8?B?ZDBvcDlFcVI3ajdaem43WnZyR0pRVnVTSkRPMUhJRmk1WmdkZ1hJN3BkcDRm?=
 =?utf-8?B?NGtpZ3VBZjkvZUpnbmtTQ3pseFM1SXRjSkxTRDJlNUxtMTVSTVFYMXI5bCtu?=
 =?utf-8?B?Qmp0ZnE1Qjg1VGE0UmFlWko3aURDaDVSZC9sd242dEJsUU0xS1ArWVZvQWlB?=
 =?utf-8?B?S0hCS3lmSXgvTzB1Ky82ZDl3YXgzS2pRTVd2UkV3QTNyUUNxYTl5OUVLNndi?=
 =?utf-8?B?cFRqS3JGbjFHaVBsdzhPRkdhdUF3YjJSM1lEcTdvN3I4SE1HUHFSWnBMQU1o?=
 =?utf-8?B?N1ZYUjBJTUtNSUlDRytzSGhBZmFLVlpodTE3ZVNVUVBzMnAxUGRDTjZONzhm?=
 =?utf-8?B?Q20vSGJqU0JCWUZGcDBWcGU5TCtkR2Z4UFl5Q202YWtYNGh1cHp0OTd3cnVE?=
 =?utf-8?B?Zk9KM2xrYjRLeTVGb1d4czlxV1Q0U2RkZWVrSEpCWjhnZkZlbHp4YjJQZWwy?=
 =?utf-8?B?WnBrb2N5Mjg2UGYrSmlUOU1aMUpZTjZQUzVvdG9od0JxN1JRekZGZ1FZV1dv?=
 =?utf-8?B?cDZxSjBwZUV3c0QyZGkzN2lNeFpjd09qQW5xaGR1S2hrMEZHdnlRamgzQlc1?=
 =?utf-8?B?M29pb0J5V2tnbXZTTFdka1lyYWZqeHJROW02dWVGQUptcmVKNENTYWl4OXFi?=
 =?utf-8?B?TE9ybS83dkNIbFYxMTdMdzVHNmcwTDl2T0lnNE9XNkdWV2E1OUpWb3gwZ3N1?=
 =?utf-8?B?cVo4a3hPUlhpSk5LSG9PWGRDL3Y3Z2NJWE5JWmgzZHlDNkZrQkhMc1NyNjZo?=
 =?utf-8?B?YmNGNDdZY3BENlY5UCtqbEV2MHhnNjloNloweGhpMlh5dmpWSHloUFBxOWNL?=
 =?utf-8?B?RlZ6QVhVcWxTbDlKSFluV0d4aUxkeHNCeU1GVEhxM3BFWDJWY0tmcHRxcHN4?=
 =?utf-8?B?Tng5NXNma3A2SW1ZcEpsTTVKaVp0Y2xXcHVkM3FrL0hLRVFwbUQ1TGFBdktP?=
 =?utf-8?B?N0RzWk1BVXN5LzhYVlN0bkxyRG5xK0pMUUx6d05taDVMOTV6eVlYVGZCKzkx?=
 =?utf-8?B?MU41TWkwWVFvTUJ0c2ZLS1RmTmUyb2tON0VYSy9jZWt5RWxCNFZQY21XMnRr?=
 =?utf-8?B?Ry9HR2tSSW1ueTErRWkwaGlDc3RjMS9TMUljRkZIY2NSNG9aOVNvY0syK0NN?=
 =?utf-8?B?dHJMbWw5V1dvYWpNY1JFcGNFOWJXaWloRVorOS9JczkwWlA0aUc0NzYrbUV5?=
 =?utf-8?B?VS91TDZsZERrVkZnZVlxQ01nVkRtN0g2eXlXS1VxbUl3dG9LYXlLQUVxL3Zq?=
 =?utf-8?B?QXFCeVZZNDdhcWFLZlUvTmJQV1FmMHg0NXdDOE1OY0hQQU5KN1JiSUFYNTMr?=
 =?utf-8?B?M3NtcWdKNlMwaTU5ZXdCazVKOTI5YUdyS2hOL3JGTWViRjhISGo0ak9Ud21n?=
 =?utf-8?B?Mng5VVZUcEl2R1B1U21GSi9BcE9zN1NQQllHMmxHVG1QNHdkR08xcG00OTJP?=
 =?utf-8?B?OUZTUDRZOGU2QWNZcjFaVmFESXorYU1LdnYwZThFbS82WUxPUENwemJiL0xI?=
 =?utf-8?B?c0NCUE0yYzI0eXF2S05Zc1BQTHJyNC9KZGNqQWEwMHpyUzNjakZFLzMzZy9p?=
 =?utf-8?B?OVc4MzJDem5BYzkvWWxYMCtNU1hwY2pUdWU1djU1eU8vOW9RZTh0V0Y0cVBV?=
 =?utf-8?B?dDFxc3Q5bTdvTE1CY0Q3d0pzM3B6QmFZT0lId2dYcExsSnZ5ME5JdTgxMXhE?=
 =?utf-8?Q?2TZN2REZIGwrT90/9QBZk+Z2r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9560dc-6f30-4338-3b56-08dba899708e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 14:08:37.8202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vge29Ny/l9l6LP+uiS3wAjl4sKJqhgNbK+aorIB/e/V1WIngjvINxqPb/poo2ltcAfGiILpNaVxJkTVMSNtx3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8713

On 29.08.2023 15:43, Andrew Cooper wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1074,8 +1074,27 @@ int arch_set_info_guest(
>  #endif
>      flags = c(flags);
>  
> +    if ( !compat )
> +    {
> +        if ( c(debugreg[6]) != (uint32_t)c(debugreg[6]) ||
> +             c(debugreg[7]) != (uint32_t)c(debugreg[7]) )
> +            return -EINVAL;
> +    }
> +
>      if ( is_pv_domain(d) )
>      {
> +        /*
> +         * Prior to Xen 4.11, dr5 was used to hold the emulated-only
> +         * subset of dr7, and dr4 was unused.
> +         *
> +         * In Xen 4.11 and later, dr4/5 are written as zero, ignored for
> +         * backwards compatibility, and dr7 emulation is handled
> +         * internally.
> +         */
> +        for ( i = 0; i < ARRAY_SIZE(v->arch.dr); i++ )
> +            if ( !access_ok(c(debugreg[i]), sizeof(long)) )

Don't you mean __addr_ok() here, i.e. not including the
is_compat_arg_xlat_range() check? (Else I would have asked why
sizeof(long), but that question resolves itself with using the other
macro.)

Jan

