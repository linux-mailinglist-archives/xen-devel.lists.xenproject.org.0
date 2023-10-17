Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8647CC8C2
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 18:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618297.961764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsmuD-0005v9-Mm; Tue, 17 Oct 2023 16:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618297.961764; Tue, 17 Oct 2023 16:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsmuD-0005sl-Ju; Tue, 17 Oct 2023 16:26:53 +0000
Received: by outflank-mailman (input) for mailman id 618297;
 Tue, 17 Oct 2023 16:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ibp0=F7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsmuB-0005sd-Et
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 16:26:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f851705a-6d09-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 18:26:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9663.eurprd04.prod.outlook.com (2603:10a6:102:261::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 16:26:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 16:26:45 +0000
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
X-Inumbo-ID: f851705a-6d09-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SV7KEE9FhGI9f7MCAFgBbu8KaoxHct0RZ6vOf5zRG0LLGhBl+ao5cb338iQ4nkGIFRWFlr+ecVGuTNAelHILnwP93kYKTnjyfvnMnW7u7yBwk061krzeS+fBmvHEDF9C2fNXFLdXiB+yyeh8bHuKp0QvM3MmwOc5379F466Ws3XCs09sAVC6IK8myMOrMFVQhNAH6lt7KMef/X6V7+PEelkPM19qWOf3AQ7qNcDNwb60dJ2CxoYDSG1rPDVLco5kehijcyOFRwYDB9wTvub9x7Ks5iuIbpKzGw6nriYAq+3fPX5Q9FUbE/90qod1+6I24EZYHe/tE00/wKFLQhVuqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TMuQPdeHWRt01YLH5bBA9qWnp0bjMJGeIk7GIBDYKc=;
 b=P4HhvHq6R9pB+JarKLRZedIQcX6++S/2/KRvoFUNgBDrWmVUS61U8/a31/wyfteIdv2XZj/tziI+ryf7AKMZEgcs+1rwfa5SgfP0+YBplVNeGaAA0d1v9E8ojFYF66r5UlzbJeBSanIpT9XQj2dJL0QGK2ZMI39hSx89V65OaxuyKf42eGVgsszIrAxOWqsDJUpJRRkd6gE29+zmDrjURfGBEeaX2lypbNfYgr0pA/Eag0bvLFxdF4EKYxBoXE7QG8zKY4o2zrvtL2UyR/iLqNG/dhAFp4eovNyxTM111ADa31FHtSpwDMlxwxGXrW0pBAScRnPBJfZc2QaKCOgngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TMuQPdeHWRt01YLH5bBA9qWnp0bjMJGeIk7GIBDYKc=;
 b=Dfu6t0YNpwre8+e31HXu1+kuVuacUE5CwFuWKsJLkJTLm2SvL1zg2edPU0pDpIMHpfgt36poDc+1Y7EP4TdmgPMgfmj290R2ZU7ezC9uh5v5GHuUdL5zD4kmeAyYa79r7OfiJfFs1qt5sZZFGt+YghhGL82AVBvaGyoyDpx5a42kYhV1ezjRllEkPWCx7ayRgojarNcloocZ23JA6C2K7LAIU3/y7aNO/LvWJ6ASUNZTEB1em9wSPJu/vhGYWydbJ1aot4DO8TuKYUWjqKW1F0GVSfKPYsWCK3OxsXq5F6atG+lW7A9sUSMTds93BMNKfr5CGPAfQTUzvDB6xhH0sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ed66744c-5e80-7050-eae8-06afa4d060c1@suse.com>
Date: Tue, 17 Oct 2023 18:26:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v2 6/7] xen/console: make function static
 inline
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <6ca7d9834079b7824f9432799cce2308aa88d159.1696833629.git.nicola.vetrini@bugseng.com>
 <5cad5cef-27b7-58ef-42f1-8c4a83497f4b@suse.com>
 <1dd47c07730ae143963891d79148e8f0@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1dd47c07730ae143963891d79148e8f0@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9663:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a334a91-9553-4659-899a-08dbcf2ddaf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S7pROlV2qA7o+mNO8PgylMcpyZA5kTob/tGeLEgcgyVw/bg1m+cGwVW0tlUSfRs52k41UV12nHlx8kbgYMQ3v81wmBO22HAztPLyGBCBGIt78XQCgCvwjRoT6p5NlXfPrVSJSzefVFZjboYhmukXqh4hfyC2Vi+LCZ3VWreqswAiBd0hPpSR7lnXeF/8Jki5zN3aP6iyx+RxQa4Bn0HaeDZNZJkumE6KTfOlQUn8mCaA0oEi2tV2xszMz7rcIot029UYtw4ohzpmCEKmLQYh/+yP75HidWHyLs6gSy927jN4KoHj0uiK3QMkMQimY8wUKyYdOzVpfbfCb5rpb2HA7j4JLMa5YmXUc3RlcF/FuBP6okMqarWyylpxOUExUzLgJxFfx/+q+3UV6h3dngoHMCDNExXUu0N72FbyZeNBouBzBx+pIb+WBAySYuojr2r9xMMQrTpxFU4HnGtLWrtzZaK7D9EqA14m75Yvjtdpb7mn6cuUHmbdgnAOeTrgB6JpS0F0Iw3+3I8tMEMzFIh7THaJqI5dl5kAgGoSVvqbkP1PYFr2dNuJ4+FkvQ0/wloTjjpRjwEFT9SqRFxfxIIRDOxSFiOaesXHN04VcfJWXS+2r124+ddZ1JZOcFWGqJpsfoocG/rAVLbQ0o2q2U8ObQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(366004)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(316002)(8936002)(2616005)(4744005)(6512007)(7416002)(6916009)(8676002)(66556008)(66476007)(66946007)(4326008)(54906003)(6506007)(53546011)(41300700001)(5660300002)(478600001)(2906002)(6486002)(6666004)(38100700002)(31696002)(86362001)(36756003)(31686004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VklYdmJNcHozQlVzOFRJWGJCRW5zMm0xMGpyTjlSYXBnZkZLa0x3ZFBpTWhG?=
 =?utf-8?B?aVNmZzIvSFhCaEZqZmFiblAzN09KZ0I2M3picFc4M1huQ3ExWWFoWWdDNHA3?=
 =?utf-8?B?d21yUHFybDNoNzFPQ2V4dUMwNzBvVXdnK2pvd3dzMmQ1aUZ0NjlSV0N5ajlN?=
 =?utf-8?B?aDVHR3Z3Z2NROHJEQThKc0JFc1lYVGRUOXVoWEFJY0JYNGpXT2Z4UTlhNUxK?=
 =?utf-8?B?c1BrVXFLdnQvUVR1WkZ0Q3NuR090Yjl6ZUlMZEE1cnNPMWtGaXRhWjJERzNT?=
 =?utf-8?B?SzV5Nzd0RGJ4a2FQTDdYejRIM2pTMmFZYm9CV0FPbjZCTmFEMmxjcjRlYkV1?=
 =?utf-8?B?aXpnZ1k3SWdNeVNGMGduYWZNZktVM1k4eXFjOCt2eitDZWRyVVppQ3Y5eDda?=
 =?utf-8?B?RFlINFZ2dmd1Vk5CUkxYVzNmaTByRzhsczJuYkZiN3AydFZoK0F4cTA3QzIw?=
 =?utf-8?B?d2xMOTR5V0VPcGQwN005L21uTGYwWm1XUmRwZE00N25zUG43ME82Rkg5bENV?=
 =?utf-8?B?T1pkWkx5TDdNMGtlTy9lZGRobDZuM3MzSXBuaThqK1M4eWxhRjhCS3Y1bldS?=
 =?utf-8?B?eW5meWROUHhFTVV4ZFBtOUZyS1dlNW5qd0x4aTZRZS96ZkYxRkRhSGl3cTNu?=
 =?utf-8?B?ZFZ4bGxuQldrQWVxbnkxcm4xMmpIeEsrclZJK3VCN1J0dGpmMG1tT1djS3g5?=
 =?utf-8?B?ZUd5ZEN0WFh0cDg2S2o0YW0vMVJTUlpmTzJMeUFDZjFNblVWUzVqbzBUeHFu?=
 =?utf-8?B?cUYrVnVscTdNUUp1eFhLWjNuVHdaNi9wL3g5ZVFFNUg5QXNDTHFhSUZjbHFz?=
 =?utf-8?B?UXZUanRoWDlQMkZIVG1qWWdkWVI4VHlJNkI5dlhEcDRXZllNRkZGbURFTEx5?=
 =?utf-8?B?clBYaERJUjd5c2FDWmo5WVkyZGtZZ1NaUnUvTGNnVjBScHBXYVlsQkxPQy9k?=
 =?utf-8?B?b1JaeUJSK3ZLcnRlRWxmdEczUFBjR01xRHdwcDdDc2xIVURudENMR2czY3RX?=
 =?utf-8?B?V0d1dTJkQXlqY1A1TFQxSTJsQzZuaFdETUwrRE8zdWVQMHpxdjNOdU9WeHhE?=
 =?utf-8?B?MlhlelI4dFJvcFlFTkFFbzBOS0F0ZGRsM3Q2S1FWRkhEa0llcER0YjZLN2RE?=
 =?utf-8?B?d0c5WTB1cm5QSC9GRURoRllrckRPQ05CTlJqNUpoWTdUSnkwSEkrcGxhbDAy?=
 =?utf-8?B?d3laUGtvaGF5d0xlekJTcitJbHovZ2ljSDJWRGpXWSt5RForZStmOStjS3Zr?=
 =?utf-8?B?ZC9hL3ZUUklyNlVzYm41Q3A2WWk2d2liMHZkNW1wNlhwaXo3UEhlUUVQT2ls?=
 =?utf-8?B?NTlSTnJ3TWs3ekpOSGFkSTUvMWF3NE5nMWZPUVlUQkg3S1drRXRRcUtKL2x3?=
 =?utf-8?B?Y0FHaWlmNVQ3dENNVmEyNTRCNWs3NEc3QW5mRmZvZFEyWXpIUmFIQ1U0cHdv?=
 =?utf-8?B?eEdWcG5rd3BKQmYyQ0YvR0VpdXRWV21MaURlU1hjN0FRUC9MUTNDd3FMdk5C?=
 =?utf-8?B?Q3IxUGFkTi9zdlRGaFhta01QaVBFQWlsd1I3WWNCSFhJdUprUUdWRjJsKzVJ?=
 =?utf-8?B?VHVSK3ludEl1dCtybWEveWE2c2pWaHBpWWloTVVoOURNNkpnVHptYkRmbXJm?=
 =?utf-8?B?UTN5SzJvQ0hlWGZ6QmEvSHlBQWRuMjdrQW1IL3p2d3k3dVVCZGplMEpXM0Zs?=
 =?utf-8?B?TzhTdnNNL0xhMDdRN1huUUtsbVdhOSsyVzd4RGp3UlQzeWczQjIxZ0RPVkJX?=
 =?utf-8?B?Y0VORzUvT3lmcDBmSFVjUU94VHppYmNuUG51a1N3UmxHNXVlWC9aaDdpUnpV?=
 =?utf-8?B?cm5tV0ZHWFJrOUFxWDBicTBtd3V0bWFiNkliZklLa2RNOVFaYko5TU11bHZU?=
 =?utf-8?B?MXJzZHlMeUZRb2ZNSGlyWjM4M21qL1BRNVJhOXJNREtGMmVjODdab0VZQk9y?=
 =?utf-8?B?WlQ5K1lwd21CbmhqTDdwZGE5RzVqNUNXZkdCdkUwWDVES1Zpd2V5R2ZDdTlY?=
 =?utf-8?B?cnE1MFBFcERGZnBCaVE1cXlIZTc0QU56SlQ2ejdjL1VBR0lva1A0WnB5dUFk?=
 =?utf-8?B?TDF1R1dubUZwVVJWSU9EcndCUVUyUG1HLzFkLzZTS3c0K3hlNFVIanNQTHBC?=
 =?utf-8?Q?5RMWCPQ5Z9PX5CnSmd1dyg3Vs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a334a91-9553-4659-899a-08dbcf2ddaf6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 16:26:45.8914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEeLfWmSvGDcaZRfvQx63wHSfBB4w/YfySDFg1OTOoG6rIQRTdvcWa/00cJWZ+AbhlqXo5oZErDGu9eIOoTGCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9663

On 17.10.2023 17:24, Nicola Vetrini wrote:
> On 16/10/2023 16:52, Jan Beulich wrote:
>> On 09.10.2023 08:54, Nicola Vetrini wrote:
>>> --- a/xen/include/xen/consoled.h
>>> +++ b/xen/include/xen/consoled.h
>>> @@ -12,7 +12,7 @@ size_t consoled_guest_tx(char c);
>>>
>>>  #else
>>>
>>> -size_t consoled_guest_tx(char c) { return 0; }
>>> +static inline size_t consoled_guest_tx(char c) { return 0; }
>>
>> Why inline? We do so in headers, but we generally avoid "inline" in
>> .c files.
> 
> Yes. The file modified is in fact an header.

Hmm, how did I not pay attention? Yet then a different question arises:
Without the "static inline" I'd expect this to result in a build error
from any two .c files including this header. Yet we aren't aware of
such a build issue, so I wonder whether the stub is needed in the first
place.

Jan

