Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C3E7F4139
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 10:07:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638549.995226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jC8-0007r0-Tf; Wed, 22 Nov 2023 09:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638549.995226; Wed, 22 Nov 2023 09:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jC8-0007oU-Pn; Wed, 22 Nov 2023 09:06:52 +0000
Received: by outflank-mailman (input) for mailman id 638549;
 Wed, 22 Nov 2023 09:06:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5jC6-0007Sw-LZ
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 09:06:50 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77dd52f6-8916-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 10:06:49 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9260.eurprd04.prod.outlook.com (2603:10a6:10:370::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 09:06:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 09:06:46 +0000
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
X-Inumbo-ID: 77dd52f6-8916-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ae/7qzrfX+JzabHXTH1w+0BzuH4yqSjCP2jSOFe4cDLpXhPbwChUYJknVnV2CVnI1GGh7YnGhMewW8Dc+VVDJ6yv4mqFUaO7UNZI8R0YSTk76gDxwau2IVvShGX77IxsDwlsf6Nk36PNNO7NwBOXmZP1oxZWny24XyxuAwYoS0VC8l4pehIj1W8e7k7TLSzRil4Vn/09StMmyGaRogxm2FeViOnNNcNzUR6Y27/26ybAC61LKiSFFt0iwi3DCm1kL6sTeDg+I3ID7a7KR5nX4+5Yfd0D7XaWI4fZGVGW3n674Umsxm6wc3Cw9gPxrQkEN+tP7B5q3FY2D01RIERykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bx690dq/FPkK0bJJxOX335H5TKt2xHffKz7ZCxII3kk=;
 b=YBFuiNvhGw4iYRqBWEGRc6rtBjE9vnxs1ThxIh01F4BcsiGA4DSVGlQu8avvzVk8yIm8T/m5C508eWjPuxjHPlTRnSY3iZM/19lJ1aX89/C8pRpj0JAEHt8rhvTBkCfXCPWLVgyZCcLJEIfdMQPf2HGORPWBcZCSWhBigA6e+xnfntN2fB9hjxhd/xWVQoKuPPSOxTMYULmzRxE01XL/ztwmyj/XqxsIRWx9Yvq92otcvO/s1ztB4B5BsLKZ2SqBgPS6DkTaZdQJ5O6K6k0FnyKDOtoTXpJgKFlfTKAiJnSUNupUb4gWj/kKcsAkrWFXUQQV0gl6aHFtuzwTJkAcIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bx690dq/FPkK0bJJxOX335H5TKt2xHffKz7ZCxII3kk=;
 b=5atYRrBqTEITuquJ9381SnMk+z75ndhCSHTiUmhSjEWn1sfEUn6oIetsHigPdyMZri7hJ6txNeOgMqtcfsXX9Ik9AzXfMOuvwKQJQoCnumrcgMs0aSURN+JkQWAA/OTQC1gmNxx6KlD7lJHFAhzaYMdHu6zT8xFtCilqDkseoYHgdsZtwhNnR5BBGg4dBU46DQgnOMHXm2A+XYn6SJe0hiEiXInvHCW2mdpPY4UI3PaAnFG2Pg3l3jt53/UE66obMaWKUf1MPa1NIj2kOaeQsUT7F9YRIMAPpvIeQ2VdKUDPJH4mUfGhvUR4RyRXWhO1kUN6fFDRSuge27863Bj/Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <211e3b07-0018-414e-a950-4984109d1702@suse.com>
Date: Wed, 22 Nov 2023 10:06:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] x86/setup: Rework cmdline_cook() to be compatible
 with -Wwrite-strings
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
 <20231121201540.1528161-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20231121201540.1528161-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: 08fdfed4-257a-4ae8-241d-08dbeb3a5a84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wo++yWT/faQDojDQeax0zBCD5Vx0Pyww7IU2ROvRy2SayDPC0TLAyJIEJYWN+77tahaiihFM2gkNhYFMqDDUoMCtrBufltEobu6EHcgMQMvZ71LhaxmkAuXi7UGa44roHrB2QjQfFOda8chl509bHsfnfo1EGRWjHxD7Z07GpJjtKX6+OWdUF1/Y1XR2XMb+1/clb60YG6CUqT8dBgb5E+Z6JhH1TN06JYgSR12f+xOmzvCegbyX8L6oWcSiJlGnYvjFfVQLgtq2Wh4aNa1vHmL6E2sbpdBM+6+3HDoIzm1wnyOVPybnSEDovJdhDCjhRIdz11MfR06RLSKMN2/cg6o0ZNXJh2XRarqkE1ftuBQ9XHL9Q14B+iM24Fx6Q/9D0CX9om6xAW6foSEYCdwCi5pxr8OUsbvxRy7VQFk+kjC70SnXPS/XdA7GQWzCvpaPbbo47rBkBHOJKbK8gW46aG6GsSSPS2UlNGuIuFYM0LdyIXb/OHHmQ6kFeE8CzzCZSSKxB8wcQnz+C7GILsSB9nWY73j2AE20DVpN74IsOlGMMukXzGgte+V64OllI9yyEeP24P4lG8nma9PVARaPQUvqaTxso21vQofcyQmDAPlKHlWXcStQYHk6BxuZLLlptqkrYz3lhqE4yP6RchQteQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(376002)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(31686004)(2616005)(31696002)(5660300002)(7416002)(36756003)(2906002)(4744005)(86362001)(41300700001)(66476007)(38100700002)(8936002)(4326008)(8676002)(316002)(6486002)(54906003)(6916009)(6512007)(26005)(66946007)(83380400001)(6506007)(66556008)(478600001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1NUVjhKUXN6dUhuaVNFd3g4b2RTRDkxYXNteE9ZRTduRWFlRll5S1g2NWJD?=
 =?utf-8?B?UnJnV0N3VWgrbVhvV210Wnd6bWhGcjQ0bHlVaXBtYTRBRWNTRnV5TTlLL3NC?=
 =?utf-8?B?TUFHOER0Zno4SVYxU2plTXVuWXBldEJBZU0vTW1KazgvR00yMWMzeG5LYnFC?=
 =?utf-8?B?NmlGUVFaOWE2Y1dwTkhMeC9lak56RFgxL3I2aWlJbXIvUEQvTEFRYnNoWEFv?=
 =?utf-8?B?UityRGM2TGJvMFZUbUd4MTlJQStCbU9Ed0Z3a1FPc0NKNTBGOGprb2xOL2xP?=
 =?utf-8?B?L1FQd0lRd21hMUgvZnczaVFWZkxxNXNjeFM0MEFIdmdOb25DUjRsaEJjSGh6?=
 =?utf-8?B?djBMZEhDeFN2VVUyUGtkNFZZUldpcEU2YlJVbktmT1pDWjVZejkreG03Yitq?=
 =?utf-8?B?ZUJXUklYRlBhcmtTeUdINWJpS2pRK2ZIQW9MUExrdWRWTGdpYTF5Z3RRMitw?=
 =?utf-8?B?cUpmbEJLZHR2OVhzVEFqSEs2STJna0tWeVora21rd01BeGhQWGowZzM0RDAv?=
 =?utf-8?B?SXpyZ3J2Wk92YTIxV2RhblNvL1VFN2NvZHh5UFVjODlsKy9WcHVWVkJabUhn?=
 =?utf-8?B?OUJrR01xalRlaDFLb0RlYytsT2g4R0lpZmdGTU1JeGoraThDY3BKbWxDUkZt?=
 =?utf-8?B?MVFZaEtGb290ZTZlRDFVZC9VVW9TZzNDSnJFaUhUMm13YUlCYTRGK1RjeEda?=
 =?utf-8?B?OXlKbG90WjNTNisxSTB2T0xjZXpBd3BoVFFLMXl6U0pqVERNOUxVSi9uTitI?=
 =?utf-8?B?d0NtNUloeVF1ay9tdkdwaW9mSHRCcm1hclc2M0dCRXFUU0xNRlJ5R29BYUJx?=
 =?utf-8?B?V2J4OTdqZkpKMTNoUVMyOWJzUDRrSnhlc3lrd3IwRFNJcnRBMjRWV3YycWdD?=
 =?utf-8?B?VHV6dHhGYUVaOUorWFhQS1QrQ0RCczlrRlgzM3R3QXEwMUp1Ujg4bDkvREJ1?=
 =?utf-8?B?a3dvQjR2NFV3SmlKV3JJUkx1SDZuTEJtaU54dU5SWUphMnNlbVRDaFljb3VV?=
 =?utf-8?B?NUczR2hLbVAwenNURVlFY0NsNnZxSDJUUlRWZnVzdzNiVkRoTXQ5UHF3cUpz?=
 =?utf-8?B?MVRmd2U0VWhodkVHaTd6MEhmbUd2NDBpdXlBU2t2Z05sN0NIMENDY2FRdk1z?=
 =?utf-8?B?ZmJqNVBHSmhCTWltbUFNOXp1R2wzdkxtblhqdmRzS1lMRCt2MzRFcGZGUm94?=
 =?utf-8?B?SlJnSFBJVE43ZW96YWZMTEhoNktNdEJpRUFoSS9JRk5CZkZCUEJ1NmlHb2dR?=
 =?utf-8?B?SVk0WkEyUzVlUmIwdVJJZHM0Wm9sdHpFbW1rUmJnd016c2pBbndwYmhieTN1?=
 =?utf-8?B?bVowOFgxYzVubExyZlBYblBtQkYzbFFvWEhmMnNFUkdFQ2JWcUZRNHZvTmlO?=
 =?utf-8?B?cVV2aWJsblRDcUFZalEyaTh4ZEJHWm5telArZjBNNEphZXRGRzdrcW1IUWVp?=
 =?utf-8?B?N20zam9TVVFPeG15UmNCZ2RKOFA5Umw4WldCQjdTYmFnR3p6NnZ1eGIrTkVO?=
 =?utf-8?B?d1ZiZjVtVnhiWUtlQi9NOXBsTjFZSHBxanRqNVc4Q2hYUGR0M3J6M3oyaEdR?=
 =?utf-8?B?WHZEb3JKR052blhVNHd5MlgrVys0Q04xVVBjWGlDby9SQXVjYlBWUEFMQ1hB?=
 =?utf-8?B?Nm5jZ051Q2taU21MelRXbzdqRmQ4Qzd1T1FDblNybXZ1alZEMEU5ZG9BUDFa?=
 =?utf-8?B?YXZkc3puaFpoSm1yWDdoTHNReGg2cThLdkEzZjlEL0dsUWwyNlhiMjd6cXBL?=
 =?utf-8?B?aTlrRHhWWDAzVG9hTnQyeS8zTGxETS9SZGlWZ1UvbG8xSFlzTE1LdHd2U3pm?=
 =?utf-8?B?MEtRRVQra3FlQXBjUm9WTUZXa1d2dmZvZkIzdzlOdHdaSGpDZ2ljNHM4eVpu?=
 =?utf-8?B?TTVmSk9PTEhBNkJ2elV3OHhmeWpCeTBhaGlrbnJGamhrUy8rK29WQVBGS3c1?=
 =?utf-8?B?MDJOZWUrWmtGMUlMNlNQK3ExN05Md0lkNDJCUG8wN1FkLzhZQVpvNlR4M25R?=
 =?utf-8?B?aFBBbGdJUmg2WnQ5TVFodFhwZXVrVDJqSHNuQkpQcitNOExFUGc1K0lGc2lD?=
 =?utf-8?B?VVVQMkk5azdZcS9PVlZLYW5lQW1NZ2kzUURtUEVTeVNzSWNjUE5acGp4TDRm?=
 =?utf-8?Q?I6BUuqbyiMtCKaQyGHJVFxSIl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fdfed4-257a-4ae8-241d-08dbeb3a5a84
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 09:06:46.3458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLokne/gQkx9KMDyq5/a4j2/Ex1iDvn/0QxvPA9E3AQn+RMT4DqllTEaPF7zoZSgcs7pFCDUbyk+a20KWG/Qvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9260

On 21.11.2023 21:15, Andrew Cooper wrote:
> Rework the logic in __start_xen() to not potentially pass NULL into
> cmdline_cook().  This makes the logic easier to follow too, and the rest of
> __start_xen() is safe when initialising cmdline to the empty string.
> 
> Update cmdline_cook() to take and return const pointers, and write a
> description of what it does.  It now requires a non-NULL input and guarentees
> to return a pointer somewhere in the 'p' string.
> 
> Note this only compiles because strstr() launders the const off the pointer
> when assigning to the mutable kextra, but that logic only mutates the
> mbi->cmdline buffer.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



