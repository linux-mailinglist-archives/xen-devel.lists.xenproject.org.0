Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E4877BD91
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 18:04:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583734.914029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVa36-0006Qj-B5; Mon, 14 Aug 2023 16:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583734.914029; Mon, 14 Aug 2023 16:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVa36-0006NV-7x; Mon, 14 Aug 2023 16:04:08 +0000
Received: by outflank-mailman (input) for mailman id 583734;
 Mon, 14 Aug 2023 16:04:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVa34-0006NN-BN
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 16:04:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7d00::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30faf24e-3abc-11ee-b289-6b7b168915f2;
 Mon, 14 Aug 2023 18:04:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6977.eurprd04.prod.outlook.com (2603:10a6:208:189::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 16:04:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 16:04:02 +0000
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
X-Inumbo-ID: 30faf24e-3abc-11ee-b289-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RndI78nORcTtcFA8hEXu2XJlAoaMSRdzpweLh1er5zSBUZS9vwnI3mb33VQG8aRBvff6fitH92C3SmXaNPz7cTrVJP1PY/05ydjwGRM4twCRBKyY8wz1lyuvPQ21xtRstI4SzAxZPqHC7V9My5IV3Q1xVaeES4Uhj2Bgx68cscV0imLsvcQbghoLyCfuQGckJDyNvKsqwDfDVq7N9boUKbASKqR2L527q65ES1K3kpyS28wQQVHZEJDwABwuavp+/WnCkg7Ig/NkQbdVhZ6Oi81jwOo1dcUsHaLvou5JKFyt0/VZ+se5avJPFO1XPvbOPBZmR9GgSlv4KlaFLDGaGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BBVelKimRRMdQ8LroyMFV401PUeug8LMS7ukMvyyqw=;
 b=b9Xqxgilw8kh/qbpPY/KXsNOHAAvlThY3xjMYmenGPgficwFr1OiBjGUZIGp4lShJSHzIvQuCwc3vQS6QoPNUfLmeeEZar3OGN6qqUTKRbPMhOs5j8w9dn4jRSlWk15p03uaVjekbv1wWjFgDKiM3aopLnGtThCK3J9+ddisCEx6tlkis7ylZt6PSMwaUyNvTduaAww4xy2gftpuHtGoI/kqZNmzpZazdkWHgseti1emF2KNxXDPisdsKwMIFQlfWXvgStHJ4kL9WIPAvEQI3Q/mkG8yBwmTz2YXHUng25JbGvGAChLOA7NnslGJErB/EL2u8u8o7ykC1ZMtrPsEqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BBVelKimRRMdQ8LroyMFV401PUeug8LMS7ukMvyyqw=;
 b=dCtH3uIt/eoJU2Am2Q7cAXEG8wS+EIxVrb4uDVVRicf72FN69wUZaaParuYSw4dkR2y0z6KwDC9k7OMgSDZ77hWhccqKtdd0Ajcoj05iynoi6qfIfwKyzct8YK23Fqzzk55RJMUqPpszHy67tXXjf5KSYDH4+D120CQT11LpoInfIpe/g3PwuKN1LZ1hLuO3bPRjG/ct3WrB1AmedlOZYHG6Fkok3AZMmopgh5j5Z4jbKccmrLhXfFvtGT8dem2nSJbVvIZ1kkoD3wWBp89Hq+BDzuVdJVcLNoR7hlee7ftn+h7RUTqaUB1asqfy8PY24SYhiQLsima7bopzDfpSNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa3faf14-84e8-5fdf-8cf9-a5960a16beab@suse.com>
Date: Mon, 14 Aug 2023 18:04:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Build errors with fuzz/x86_instruction_emulator harness
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <d4826ecd-fabc-03e9-2ec3-788877a560b1@citrix.com>
 <7c99ef09-cde3-e35c-f9f0-00c06b754786@suse.com>
 <13be7a9c-0619-b691-a364-b5aa7a110fb0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <13be7a9c-0619-b691-a364-b5aa7a110fb0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd4ec2f-baaa-46b1-d7ba-08db9ce01404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O5R3f7kNAwRepZBQD3Sk5Z8CnOElgMeYD+OwubDTAHX2VZ6A6aaonqr181/Pl8xUOnArwPlvj9sthomfJucdEUr09JhES++FT5oFRPzf+lblqXa37MKgVtsQv+satv8IF2obwmOC0X30vNMkNAFKjFPbN8LCd4zZC807Wg51tJGi9hlnnpsrjYHP9fwnsyLYaiOdj5Gl9LA7WlmdQ8ZSCuhEb2qx+4sRmdNfLpmuru6uS/PABCvQrWwm5e93I8s+sKfisxE/UfpLVTPrPPhlWJ5p8RL1zSYwuJw0J4LrXrXHJGf2+gcEHBOkYBaMfjcCk58XpmGxjW1c4xP/h2nXbTcxIjXq547WLnkhlCHBY9GedV0nSxs0KhW8nHy7APfMhgKoujCg8LkbCciMSD/fluD2B+GojlkyuEE3iGWpsB/BQRIL9OaZHx+R/+BOTfmYsbGSvVGYasDxKEo0kaDgpY+Mxl4Itlh6VV42699UfTAJpljIiToGFI1qeJeQgpjTrOSJ+hQ4ElkAvTry0XGam+CK5+MuOZWnJt+lGt1CCQoaoiNVADYhhPRFaby9UxKhJaC1NmHkhCvqTQ+PDw5ph9orYs14AgFn2cX9gjD7o5pjDgBGOlFDO1JsssE6EvSgFqst3iEqHXv2BKSwbQ0AWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(376002)(136003)(396003)(1800799006)(186006)(451199021)(41300700001)(8936002)(66476007)(66556008)(66946007)(8676002)(316002)(6512007)(31686004)(2616005)(53546011)(26005)(6506007)(6486002)(54906003)(478600001)(38100700002)(31696002)(36756003)(86362001)(6916009)(4326008)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDlYNFV0MnhjY3JBMENkSGtYWVZ5b0ZIK05HdzM0UW11Zmt1T1NUQjFKcG1G?=
 =?utf-8?B?OWtoTFJVSjhuYUxZSUZ5TzhEejlPclNsT1ZCcVprMTdoVGt1U3A4NnZHUTF6?=
 =?utf-8?B?RWtob0s2TEQ2UXFnd1NnYUdOSWdHTlJORHpsVGFDblM2MjJEUW9wYnluZ1dV?=
 =?utf-8?B?VHY1ZCtUbnBydnNka1YzeEVkS3hFbGljZllaZWlxRmFFdDhrVEIwSHdOaWJi?=
 =?utf-8?B?WEVMK1VyUkxSeDE0M1RkSXEzTXNqMmZvN2pUc3Z3S3I2V3UxbDBPczRBMEpl?=
 =?utf-8?B?M29hbkE5Q0dFVjUxNzhoTGllOHdnU1NBVldyeHR1R2MrSWg2MzhPRVcydGZw?=
 =?utf-8?B?U2NucERtVlFibHNzZ3JhelRJTVpOWFpKWmhHZzVZL2YxNWJVa3lweUJ4UlFR?=
 =?utf-8?B?OUdaNWtJR1JpdE1RMUxwTUpIc1FDMldWUWkxOGd5RmdmZy85UGF0Q21nTkxw?=
 =?utf-8?B?eU1aWW51TGoyVW0wZUo2WmJkNy9LWENlbFRWaXR3a0MrTnhBbVpiM1RJMHJo?=
 =?utf-8?B?K1hqaG4xMHlIdzVPK0lkRWdVRlF3NHVPQmcwZmlUQ2svTWxMbVV2V3E3dEV2?=
 =?utf-8?B?R25ZZTVvSkcyaHFXZUxyZ2hocE1CeWhPMm11WW1oeEZ3RE5GZDVpU0drTjhI?=
 =?utf-8?B?Zkc5Y2R4ODdUUXhQZmdYenMyL0xkclZPNFRSS3NHRnNaTnBIcEhaWi9sTlhB?=
 =?utf-8?B?Y1hKZzhjeDlPUnJjcFZiWXNGanp0M2pNWTNaR0tMQTlXVWdPRFFwalBudW5U?=
 =?utf-8?B?dzc0emQ5NFplTWZRbW5VUXhKTGcrMnhXbWl0SzRHeSsxTzA0RzhyWE9hTm4x?=
 =?utf-8?B?a2swVzRqMVlSWlNMbXd6Wm1oVkpESXpKSWR5RmtPZUlDb1pvSFpwYmI3VkNs?=
 =?utf-8?B?S095ZmRXV09lelVZT0dxZDBZaUFwZFJ6VmlDLzN4TVQwUFlYeFkxSTdMT212?=
 =?utf-8?B?UlVRbXU3eW8yTHRDRGJxaG54OG5ocW5iL1JXREdqZ20xREc3Njh1OURmbnYy?=
 =?utf-8?B?dnpjQ0JLSERZNGg1WmZLMDJ4R3lENnloVzZLUy90SWMrWDVmclNuenBnMG5l?=
 =?utf-8?B?Z3dDaWJya29NUDd5WFlGY3JDek41NWxPVFpEL0RXNWFXaVo4aFRBMDhyVGdR?=
 =?utf-8?B?ZkVXbERUZTFiZE1KVndlSHNUTE9SOFU5TGZuMllKWmh5eDk5QmNvbnpoMjRi?=
 =?utf-8?B?NmRaTkRHQlRNWE9ycGxtQjN6VEZEa1JnR2RobjRYZUthTU4xd2tlSGJOcTNk?=
 =?utf-8?B?ZzkzNmx5T2N0c0ZZUU5lU2tvejNQYkNRWmNSQXRxU2ZkREUzWmRxb2RTMHJH?=
 =?utf-8?B?eVFGZEh5U2RGQ2ZVU2ZXRmtOa1g3Lzk5ejVtQzY3NnhESXd1ajhuWU9PWERw?=
 =?utf-8?B?V0lkWHJjZ1ErWlc3SnF6d3Q3bmI0Z3pubVdaMC9KSWh4ZFRyVXpvSDRVakZm?=
 =?utf-8?B?VzFzVEpCUDdKVzlud2M2M0tZSHpuVDZ3djl6TGdOOXZVbERDVDhtWUdZcURB?=
 =?utf-8?B?ZVlzUHEwR2JKekoxUU85UGQ0K3F6OXcwR0hVZzd5WllNQitON2hmdTU3U0cz?=
 =?utf-8?B?SGFBWWZkSHlFdGdYOUVVK256VkttYTNRMkZhTElCdndYczN2VGpKbXN5M2wy?=
 =?utf-8?B?byt3N1BOcXZ0UWZwV2RkNDRXOGN3SWs5ZklNbWFCNjBGYWt6Z3JTbFpwTzJi?=
 =?utf-8?B?U1YzN3pWb05TS2htc3RLTHpaVWtRcndzWTM0SmpQZENRaGR1dEdZa3FhRmFT?=
 =?utf-8?B?bzhLaE1IdmhzVlJjVDJoNUM5aER6RUw4WUVhTk41Z2JKWE9sajdNbWdOWFJT?=
 =?utf-8?B?TVF2T29rVytxRlo1eEdORWhwWVZkTmMyMy9ZTnlpRHVodkZWbWxNR0FqMjVs?=
 =?utf-8?B?N3ZnZ2tsc21qbW55ZUcxSUN0QkZjSzFta1pTS0h5MHgzOWVTWGwyNDJJQjJa?=
 =?utf-8?B?QkdDWFpudVlZOXJUUlY0Z3IwWnRSbFpsUHh6dWZCN2NHNlRLZCtGcXJObHY1?=
 =?utf-8?B?NDZScnF4STlhcGhnM1ZaUCsxRmFyd0tmYUNKQ2pPbktzNFJhVUR5NldBYWsw?=
 =?utf-8?B?NXFVWXg3YmxsSm1veFhBWEh5WW05OUgyS1VtbmVVLzVqeTQvbFlLZHAyUHQ0?=
 =?utf-8?Q?SRlnN11oVpO8+F/5QFHOPYvT3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd4ec2f-baaa-46b1-d7ba-08db9ce01404
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 16:04:02.6866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7oR3cehCv+m3Jl7tGW6P8Zr04lkTXc4WJC4jCVf425pNZjJMw7ncJVP9a6LV7uo7sWqmLsyw0hAFUbaDU0lBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6977

On 14.08.2023 17:34, Andrew Cooper wrote:
> On 14/08/2023 4:21 pm, Jan Beulich wrote:
>> Question therefore is whether we can find a way of effecting the needed
>> overrides (including for compiler generated calls) without resorting to
>> emitting .equ (or alike), and hence without doing it fully behind the
>> compiler's back.
> 
> --wrap= each symbol, except when compiling wrappers.c ?
> 
> This seems to be the normal way to mock out functions including malloc()
> and friends.

What is --wrap= ?

I was thinking along the lines of

void*memcpy(void*, const void*, size_t) __asm__("emul_memcpy");
void*memset(void*, int, size_t) __asm__("emul_memset");

This looks to work at least for explicit __builtin_mem*() invocations,
without LTO. Inspecting the LTO object, though, doesn't show any sign
of "memcpy" in any of the strings it embeds (custom functions are
recorded with strings one can recognize), so I fear this wouldn't work
there either. (But if indeed so, I'd wonder if this wasn't a compiler
bug, as then we don't do things behind the compiler's back anymore.)

Jan

