Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CFF75ECF6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 09:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568449.887756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqT5-0002S3-Sg; Mon, 24 Jul 2023 07:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568449.887756; Mon, 24 Jul 2023 07:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqT5-0002PD-PQ; Mon, 24 Jul 2023 07:58:59 +0000
Received: by outflank-mailman (input) for mailman id 568449;
 Mon, 24 Jul 2023 07:58:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNqT4-0002P5-Cs
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 07:58:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f01cf6b9-29f7-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 09:58:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 07:58:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 07:58:53 +0000
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
X-Inumbo-ID: f01cf6b9-29f7-11ee-8612-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WK4xZKRn0jGB5hYodtgi5okDVSTqs+rxKfpM0PqTvMffpa3ptuNzut6+hGD09hS5f6uigd1P08z49mlPcjgWcfsQI8Hb3Eax1X0clNQtCuAQMf1d6KjHFASAG/7ZOVHpUHRAPMXkrd0NPbGGxWJJt2RUjCDbg9WBTk3spg9csNxq1OaAzNbNBPGFxW3Mv41xOAtO5BlgXSbUmJnNQb6AxfAuNSXrXIrQZshvk8BdV36kjFcy/xLWWiGEJTQww/EoLSz6g4b5Wh5l3feqY/55n1hclR0hLSnn+BEWeu9Wc5HLPRjeHl25SzRbWw+koxH56B5Ji7XciQloPibVA9wIyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cN3Jw4oiH4w+BEpS9e/0FrURZq8qnYMOGOW8nATvJxY=;
 b=b5xHTQG5VMbg2l879Xp03x5tfVhJ/FyYU9Ymgu1mJZLfbT7ffHc+qyq1Xz9WNPcCW18aMOB4L81Yw+ZE/zl1+uih79i0IL802T1+GzoDqUJjr3HfQlRSLKiE3iHv+ijzBC/L/7+0CVA5UzwtVmeCcNeCBIsuwNNEfhhxQKfGbtNgFfcvKE8+bq8V5HruHw3iQg0Gyfqc+o5Df65SUZnPmZQ9AA06PdRqK7pEF/K022ur5WsNiIq/Xn9KaVaCv6e1OUHNtrKKHq4aLkifEFIjby0LPb7MUl7rESssQc8ZxbWzza50LqSXAYMfwRUibIGk0TZdSDMXd+QHaDAXL3QqYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cN3Jw4oiH4w+BEpS9e/0FrURZq8qnYMOGOW8nATvJxY=;
 b=WmGecoBvvf8JtEe0g7unaIbjt6NE7IrKtB7hlyi5/MEuUJoL8LHnj+Oj4CR5N2gvlFaIi75uJiRddP9gXL354zyG7+SkFP95TqDtwAI6kVhhi/o+BYCmdhE+T9docixbk1+htUa8HaHkUEJEqtxkC1y6PWLahGSIkHTA5DcqKlUEOJJjatJxz+X6tB7HaI3rvgnNuDSaFOVJ5C0sgzK/pe/e1YnjRkQNSVhWT7CUZPklg+b7Ywxml8V8wn31WZdbL/xVkDiy4KCH0vUFm4RyAysl4NnJ0gcqtq8kZrHwM5LVkG1YCbgRKDGSxXkd/Ss0lF0IQtEB9rrlLuHZ9/TroA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e079bb85-deb4-41a6-53fb-117e64f75340@suse.com>
Date: Mon, 24 Jul 2023 09:58:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86/cpu-policy: address violations of MISRA C:2012
 Rule 8.3 on parameter names
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <912cfe8f5b043bddc80cbf9f75cc0b35e02a6ecd.1689929894.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2307211539000.3118466@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307211539000.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: 5627a191-d392-45e4-4ec1-08db8c1bd2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SkS/QVmd35lGBsZmLoUTLavPU8d1KbSGTuuIK4nd35CxXFyAyIXXllJbROEtocR9XojUkkF1Sp4DSj4/iMI9vRvhwjsmCSusuw5qsoeyU5o5KScJIzz+FXbR9DaGA4FJyZ/1xhf0pXAb+DVJq9P9ekcDmYFplD/5TPCc7VBzOcAFyvSxEP3UrWjhG9LCc7QHQR4IgZ7kBVXh9hqtDHtatGXbw4pDKbum6mEUrEfAC5L592m8SKA2nKvDRDspF5mFQQlgxmC3m7ms0WmzpfzBMO135CzkLptxJtvX/WIR7+vKPwiwoZmxCH8x2vdD/T3SC6fODKikQHT4fACBrtp0r7d3tiGd42Yjy730Z8WSSMYiKsxnGkZIZIQb0nKWwPaBuUCVJUAXZ+Qkt1Gh56j+42OAuc12ehSLGJI+mQE6r3QFgwKnmNifiWHyzNwG9UxVGIT1vXkzK6z/s7TvQFQQVxzKVocBKfnvw5ko0znpAdu09JOMoQvG+4q3EZXePS9WXWRb2YJdntKpaUfC81PZ3w6kD6aVFBG5O5ah8hx831VWa4h6XP2Ugx5pocsWauZJiFfohHopk3CGfNwgYan0hJjaGt9aG0+AQD2FQo76NDhFL1Vj6llw7SsnsB0Om02abpFeyFukDnSzfo1qLEu/uw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199021)(38100700002)(36756003)(53546011)(2616005)(7416002)(8936002)(8676002)(5660300002)(110136005)(54906003)(478600001)(66556008)(66476007)(4326008)(316002)(66946007)(41300700001)(186003)(26005)(6506007)(6512007)(6486002)(2906002)(4744005)(31696002)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXN2T1VoT216T0ErVDByVFlsenZyVkZTQ0l4dVptOVcrd0hSWmRnN3dwVllR?=
 =?utf-8?B?REkyajJqcVdMRkw0VHJwVEJyMW1HcWh4UGJqL2lIT1RDenViM21GeW04a29G?=
 =?utf-8?B?eXZRa0o2MGJRcFhoTkdPWi82Z29mbUg0bE4ycWx6M0dXUGpTY1J5Sk1jejAv?=
 =?utf-8?B?QUZjNmRYRzErZFJnL09ZRlJrdFZ0N2xTT0IrUENsSklORnV2eFZ2QU5qb0F0?=
 =?utf-8?B?cmlITldiS1I2L0l4eld3WVJMdjB6blc0RUxJQU4zeW1kUGZ6NnFEVDRJUjNQ?=
 =?utf-8?B?YjBDMGx0dVN1U2liVVBRdEhvR0tSMzZSbllNT3dXdWRSRjcycGRSaE42TXpl?=
 =?utf-8?B?cFQvVWp2MVYwRmhKZS81UnQxOHVLcm55bThGL3AxTEoxWlFwS0JJaDUyQzVq?=
 =?utf-8?B?NkhXS1M4aEh3V1pSRG9pN1gvTmN6SzY5WG1NSndvd3V2MURGdlZqMi92VjZL?=
 =?utf-8?B?M0YxVzA1UlhIV0VpaTRNVTNhRWJ3NXVjOU1pZEVSdkkzMGFQUitpeW9VU2ph?=
 =?utf-8?B?N09vQkVNcHJWdW1aNGVYSzA2TENrSEt3OTlNY0dQQ3lCNWMxRnptREpkSys3?=
 =?utf-8?B?QlY0RUJ3TWxvcWFwSzVSZTdsY0tlRVFkM01GWm9zcEFXZjNwVlZLek9NTnRQ?=
 =?utf-8?B?TWx0SEcvbXBqVWxDK2FFNUV4N05aaTNzVHRZMndmSFBnSmllSy9nL2xQdWpv?=
 =?utf-8?B?TWluYitZWW1IZmo0YnZIT0NyNGdQRmNXNHlMdUFiUnFzS3l1emdPWVJmaUtP?=
 =?utf-8?B?M3FlT3NmRUgzVG5uV215bzZUTHd0cTNyTFlEVHJ0aEdPT3FvK2ZvajBqdFZT?=
 =?utf-8?B?RWxDNWZrOExLMkg4SzR5b0JFSHZtUk5Ld2dnNHlYWXBMQ2hLazBSa1FVOGNN?=
 =?utf-8?B?OS9CVzdINXBBVFNmcUo2NzgwbFRYYXE0MVdXcEdUVGNBNFRZaGRYbXI3UVAy?=
 =?utf-8?B?c05YVzFpMXR6M2pvTUJ0M2drcTlteUorekNhTzRvWXkrM0htdkRZNm02MFlU?=
 =?utf-8?B?MEJMZVhOWnEzZWsyY3lxZ1lOUVNvODJLMjFyakRzS3F0OGxuRzVpSDF1bkJN?=
 =?utf-8?B?WDduczN4MlRjUUZENGhGKzAweUlLWmlmM2VMRTVDbHQrM2VSRzc5Qi96M1Fm?=
 =?utf-8?B?dk9TL2txRUlGNkdONS9mV3NWOEMrQmIrSHAxTVZ0dHY1WHp6TzIwNDJxY3N1?=
 =?utf-8?B?WmZFdkRHVSthczFHY1hlZG8wMGVGZ3ZpOUlzcmtNR3Y4YjJhYll5SXUyQmIw?=
 =?utf-8?B?ekd3cDlWMEliL2hOYnBjeXNHa2wvSGMxa0hsWWc5ZzZvVW5EKzViR1o2Vm1K?=
 =?utf-8?B?Z2l2OEwyLzY0SEVZY3lUZmlLUlZOeWRsRnN1NVNXTVJWT0o5eXhDaTdxcUtn?=
 =?utf-8?B?UTRjamNUR1NOSHI3OFBpbTY3SG1SQ3VmRnpMVHY2ZTdqYVlDNVErdEg4NVdS?=
 =?utf-8?B?RlhpSjJtbnNTMTBsMSs3UkhxRjdCaENURjI0cVRwOUc3a0drQzc5Mi9MazFk?=
 =?utf-8?B?TDhzc1pCTmE0SWRFWmUyUjNRdjZSUEFQZE55ejRIZXZaQ2hSM3lsNXZHZURE?=
 =?utf-8?B?WmJtaWxkN3hESjNYSFJPbm5zSGtDQmhrYXJBVmp6SUxEa1J0ai9VcmVxa1dS?=
 =?utf-8?B?QW9QU1EvRVppdFpQaVJ3aVlIV1JDb3R0aW52QzZLa2dqRDBZYTRDN1JiQXVY?=
 =?utf-8?B?azgyTTdPWExpdXppd1BjdGFLMUhaMCtBRXAwcWcwbGw1TVM4L1MwampEQjEv?=
 =?utf-8?B?NDV5QkFBSW1LNHNabnp3T1IwbjJWdVZ5Z1BQcHVFZm0rd0pNbEtnQmtpSkNh?=
 =?utf-8?B?bmg2dGlpUm1pOGJRYnlFZ0R5SnNCZzI1OUUyNmRLMVdSOVIrbUhFeUxYTmFn?=
 =?utf-8?B?dWF3TGM1cUxZK05uOFFzbU52RDgxVWVqU1FGd0xoQW5tL0xnL0FGMEkyaDBy?=
 =?utf-8?B?UzIyYTlGakR1N2xzMzZlbyt2dlFnQUQ4aXUrM2R5ZjRHTWhZb042eGxCWWVS?=
 =?utf-8?B?SWpQaEE2MEgva3R5dlljbkZzRGVqK24zSXV6S2FLUWZzRzNHYkJvM1dFT0dR?=
 =?utf-8?B?bnBzbGY5UVVjRHRVeE10MjJtR21EM0Njdms5V3hFTzBOODdEOUNmT1hYaWhL?=
 =?utf-8?Q?nZ3/OUOLnxfNzJmlOy/yMujUn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5627a191-d392-45e4-4ec1-08db8c1bd2ed
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 07:58:53.4904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Gri2fmBFyHNCdEB/NtgoXk9b0Ve3bsfZoF1kuI04942Ujxg/EQiG32sH3vzLiJTEPQkEQhWm5+lM6KUDqUMCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7779

On 22.07.2023 00:39, Stefano Stabellini wrote:
> On Fri, 21 Jul 2023, Federico Serafini wrote:
>> Change parameter names in function declarations to be consistent with
>> the ones used in the correponding definitions, thus addressing
>> violations of MISRA C:2012 Rule 8.3: "All declarations of an object or
>> function shall use the same names and type qualifiers".
>>
>> No functional changes.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



