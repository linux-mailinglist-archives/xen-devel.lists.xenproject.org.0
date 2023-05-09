Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6EA6FC94D
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 16:42:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532262.828374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOXM-0005G4-6p; Tue, 09 May 2023 14:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532262.828374; Tue, 09 May 2023 14:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOXM-0005Dq-3M; Tue, 09 May 2023 14:41:56 +0000
Received: by outflank-mailman (input) for mailman id 532262;
 Tue, 09 May 2023 14:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwOXK-0005Dj-Kf
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 14:41:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a39f8a35-ee77-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 16:41:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8423.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:41:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 14:41:51 +0000
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
X-Inumbo-ID: a39f8a35-ee77-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVarJC5A4tZcks8d7RXFqdYItQjc9VjaNXOkJsJu2Qyqlq/Oipuck5XZWoRaN9swapJUu8Bmfg2AJyUpGfCBBVlW9V6OOqaZVr5aCgCg4X+KQtqLqQLGrgyS8pUv53WqpEqToW8ufItgHmBpjmDnNaBh7bfNGSiyZR2tV8B5/PcXBH+KV5gC0QthYneB891SXm9/fc/lGJIJLxL49Sv1sXKAFwBEnzj0AKlgqJx6LD8DggxTNamQwwlcHDQeZtVIVAnCTW9/n7aENA+0wg3WsSZEyo7zSRprSjqlxbX0MVlsF6ElpNXxlcNSixNWjt13Cu/PKN0CG4Ffat8AXbBQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlMsGqj00J+Fvd5BspK73zAJsW0hxZEdfb+xg962teA=;
 b=lLOvKYeuVoPgJZLyS5+0Jj8BjIarqiyB3ynDnqpk4eV/aoMX9t0c/F9KyhJLqA+ydk3a0NiYb7Kyp7kQVgoNjwHrfhADAW8xSCCMM2PzYFa/swzLv3J0GinzFDRLVEKbdsA7y4i/oWz3e0HICMalOctnLGcMQJeWQdYyQJVteTVEOnjtzmIw1w17xQzqguVaO6uFTcBCAql6Klmhbv+PEjvZmW/zGH47F+OJu42aIKn8IIGKQM+0LkXR37ao4arRWzuy2KR5NHIIF/bQY8f/ea/BYRgHLqS3qbwtA/3UtsI0qEe53FK4sPCtIYLV+HoaUCTh02M8CmD9aC4m1vGM7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlMsGqj00J+Fvd5BspK73zAJsW0hxZEdfb+xg962teA=;
 b=cb7nJSyj3bM+iLaUD0z+folVqkM/qgwinIf79seHSPDZIlLH+pE2VDTlnePhCWAfpFatn5hnxHwIuPGV2CNqsvxqGCmUaVgwvo+uyACzQaAxF4zXlfF04g7Ecci0ESawE8PFiANZIxNNcHEr49j3Dq9Boo9LnR3vTacenpqP8Clq4g9SzbFLdlHJ/aVpqlKo8jUCA2u9mQlQUSGp3jssympy/UQMPL+UIkdzM52yKg3wuTXsKdHwCVThAVBkQQyHGR6LvBMU0X3H5iAAe5LxSmatDo1G/yoCtvUXlBGQZhLHuHpmJGRXbHiDBGs4XGls6ZGBS/3/pnOTWthd6xcpAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b8e8132e-0cd7-8d1e-308a-afb1963d6b2a@suse.com>
Date: Tue, 9 May 2023 16:41:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/3] x86: Use CpuidUserDis if an AMD HVM guest toggles
 CPUID faulting
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
 <20230505175705.18098-4-alejandro.vallejo@cloud.com>
 <d8c9728b-b615-7229-2e76-106d81802a20@suse.com>
 <d0794e7d-604e-044f-000e-3a0bde126425@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d0794e7d-604e-044f-000e-3a0bde126425@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: e191654c-04f7-46bf-bcac-08db509b867f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SQGIU4HWVOUBm61F7nPvwDVLU5iFFNl96sc4AQMPTA0RlhZiz3KjQVnX2dAvSHhZBEUTnAm8Ep3auVs1YP3SY8/+4ojzkk/jSX/hk2o/LFBGrYIkvMpPHrnGmzo4scODc+/0TP/LNTAFrlXnn7Yg2vciVRD3OOhGJF2eDUOfxM+JA+w5Eev+9j4S82jcgiOHp8E+okaTZK85mUT62gpDYPH4SenSyDSwOEq00l/Jb7SsBrPb+UWS5rfYNHJmaSN5B8uPP3kq+Feednvmia+twO9pLeUTIDIfEU4VY0NSfqbepkWhJzSM4WuHlyIx4oHmGMEUL5+TYWZSyfbuvlw2bTlhkc2kix1OC8ZYLiWcupRpGtB7AxGVimPBDJ9kO6GLaev0gm0Hp16KOpRPUFKd7uy5DJkQNWuMWj03kBky5jyG4wypKaljy6pVtaIQJNM7q1hpDy6blcBBYvdvqh2FGy0K5npzg0yLJoWNB+rqvOgHEEhndgiMfiLOaDdg9O2Yf+lJ6lBoXkMAuJDIp97+O4KCzJlLgQv+BoSbwLczrBGisMEbu9MYVQbZjGZE3KyKjJvaec8+SwyYYCd8e8DrvYLWxjRmwcwkeZg7ANeWeBBG+Af+PXZjiVRTrXW4XV7+DNVICWe/ziOw0f8NRgmdUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199021)(31686004)(316002)(41300700001)(110136005)(54906003)(31696002)(478600001)(36756003)(38100700002)(6486002)(4326008)(86362001)(66556008)(26005)(83380400001)(2616005)(6506007)(53546011)(186003)(6512007)(5660300002)(8676002)(8936002)(2906002)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1hzWWhya1AvaXZxUDMyNnhhcFJZM3NRWGFQZG5DZEtVK0tHWWZncVI0M2Ni?=
 =?utf-8?B?cFVIVFQ4R0RzTWJVZWhaT1BRWDBwSGFGVS9hc3JORUpkQ25YTjRNVHhHNFJ0?=
 =?utf-8?B?aENwOFo5bUJGano3cEpJWVU3czJseXIyOWg4NHZCa3k5R1A4QlhuS0lmZlFY?=
 =?utf-8?B?MjYxL2ZMWCtFWVV4SXJSWWNLaGFzQkpFaDdCSC96RkRLbjQ4SXJvWDNHeHlJ?=
 =?utf-8?B?bHBXcGd5M1Bwd3RRZHVlUDRrTzk2QU91aUZBaFo1UUVkbnh0LzFwRG1RTWQ5?=
 =?utf-8?B?VjEwMDFRdFFhSDBtRW1PQzIyZG9UbTduN0E0bC9CUTlucVUxOWVGclVKQ3lw?=
 =?utf-8?B?UHJXUm9oaUVxUGRpaC8vSDBvNmNmY2xuQ3U3SWoyVm41ZGNtSkxwdkRpTlFD?=
 =?utf-8?B?VGI2VFVrV0xWWFlranVlMHk2Y2lZRlM0TXRzYzJNVzB3SzBkZldRcWROeVZJ?=
 =?utf-8?B?NE5CRkpKQmdoQUlxbFBZM1FVVnZaY2h3R0llM2hXSkNZZGlmYmtHYnJqMGZy?=
 =?utf-8?B?eFhHUVNOM3RyVGVGZnZDVk1kSi9Lc1VoUzdsV3dNMnVrd0orSUVPWmJUcStV?=
 =?utf-8?B?VWtNN2hHMWw3Z0JWSEo3OWFzamE4SXFHS01xcENBdGt6bFdIN045WG9VbWFq?=
 =?utf-8?B?YSs0SEI4THJPVHV5M2paWDBEK2pHZktHZTlkSnQyZGo5V3JDNVQ5ZFlTTUM1?=
 =?utf-8?B?ekJwWmVrZGVZR0xGTkswaXUxYld0NVZpWUc3UERUV2NrbGNUMGJlaUxWVE1m?=
 =?utf-8?B?eWdxVE9FQ1A5Qk53Uk5kZXpFZTdmeUw3WFBSOE8ySHdRMTFqMS92aTFUaWNK?=
 =?utf-8?B?Y0RPRG1XcS95blZhZGYwaVY4VksvOTlzR3N0OFptcnF4Yi95WC8wbGQxVUwx?=
 =?utf-8?B?S1lLRElteVUvR1JkUWI4eEhUTmdCcWtkMTF6a2ttTC9aaWVJODFCUHZHRTRt?=
 =?utf-8?B?bTBTRnhYWHlRUG4rbll6bnFXTEN4ZXpFSkQ4L054bG9LVFUybTVWWTVOREIv?=
 =?utf-8?B?TXZGcU1NZG54UXFIeWVWSm5Bb0VBenJXcXQ0YlNPQ2dkUjBkTGx5TFozRU9o?=
 =?utf-8?B?L1laRzdUTW5pbG9hakxLd0p2SkZYWUhLM0lyRkYrS05zeTBxZnRFUXROczNK?=
 =?utf-8?B?VVRSMlNGVjVwY1FWaWVKS2JFUTBxbk4yMWRtVnJXbG9pYnc4UklaSW45aHBs?=
 =?utf-8?B?dFZWcnJUdXE4KzUzdS9XWm4zTVZVNkluRHBKSmUxQjY3RlFVMXhjUlVad3lJ?=
 =?utf-8?B?eUlGL2YyTHAxZ2tvcmd5MXBQcmxSNC9GTnJVa3RBdnZ6S0dVVXZFMjA1Nkpp?=
 =?utf-8?B?WFNYNFdiZnliSVNac2JnM3oxUHlDYnlXeGYzZ1M5SklFYnBCQVFrU01jRmdy?=
 =?utf-8?B?eTRBQVpTYkpxUVl3MG45T3oyZEpsVUlIQUtNbjdPaE9TbjE2aXQzK3lvbXk3?=
 =?utf-8?B?NWFaVGI3T2NPUWFSaTQxdi93SVR0dk1SLzNqUll2VUQwT0Q1MENTZXVYZDZ4?=
 =?utf-8?B?dVRMeEEvb2dxTitWL0RVY2dTOEhYQTFmSTVYU0htWlJ2cDdnMFRjTEV1MmNm?=
 =?utf-8?B?cHh0ZDVqOVAyUHpGTE5aekVyZGlSelloYk95ejRjMHp2UDFJVXVJYURjZXF5?=
 =?utf-8?B?dms3VDkycVgrTy9KZlBCbTUzRThUVHFzbjF6Y2MxVlVad2dKYUJWWFI2cGJr?=
 =?utf-8?B?U0RCRjVPNENhNEVkZUZranh4eHd1dE5FOGxkRThTZSsybllIM0xVVlV1My9C?=
 =?utf-8?B?OVpzcUY5cms1QWpUVGVhNFo4d2JnendVMFRWK0VuRUhadkhTVkM4anpTSWpl?=
 =?utf-8?B?R3ROV1ViUWx1Qlc2VUdhQVkzVjFUVjh0MmVHSGZXNk9oRldjQk1ZWlM5QnRT?=
 =?utf-8?B?T0VNMy9rRXV3eFRGYzQrM3cyWVlYVGQ5Nm40Zi9BV0JHa0xFTVFaMVNOMEhy?=
 =?utf-8?B?ZnJSeTcxM2l5MDI0U3BPT0dHd0NlcHhJKzdreHZDNlVWTDR5WlZzMnNZZTlh?=
 =?utf-8?B?S040bU1VSllyR2M0K044ZXU2NU9MSWFLVnFCdSt0Z2hoSmtQcVRxbHZ0SERG?=
 =?utf-8?B?eVJlWHZBSkV5b2VET3VjdE55Qk9XT25HYXk1YzRvKzZ5WFFPMW8xeitRTVVU?=
 =?utf-8?Q?wM18D/pXlNtKzxincdn0/0W5h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e191654c-04f7-46bf-bcac-08db509b867f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:41:51.1508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nw74ovqB3zwZ6yEAFqcybWjyhhbNmI+tirszdC5MJk9qJ1M7Bw41p4yQhK1Htca30hj/hr9izVtgfrk/zRqSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8423

On 09.05.2023 12:05, Andrew Cooper wrote:
> On 08/05/2023 2:18 pm, Jan Beulich wrote:
>> On 05.05.2023 19:57, Alejandro Vallejo wrote:
>>> This is in order to aid guests of AMD hardware that we have exposed
>>> CPUID faulting to. If they try to modify the Intel MSR that enables
>>> the feature, trigger levelling so AMD's version of it (CpuidUserDis)
>>> is used instead.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>> ---
>>>  xen/arch/x86/msr.c | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>> Don't you also need to update cpu-policy.c:calculate_host_policy()
>> for the guest to actually know it can use the functionality? Which
>> in turn would appear to require some form of adjustment to
>> lib/x86/policy.c:x86_cpu_policies_are_compatible().
> 
> I asked Alejandro to do it like this.
> 
> Advertising this to guests requires plumbing another MSR into the
> infrastructure which isn't quite set up properly let, and is in flux
> from my work.
> 
> For now, this just lets Xen enforce the policy over PV guests, which is
> an improvement in and of itself.

But as per the title this patch is about HVM guests (aiui the PV aspect
is taken care of already without the patch here). In any event - if the
omissions are intentional (for the time being), then I think that wants
mentioning in the description.

Jan

