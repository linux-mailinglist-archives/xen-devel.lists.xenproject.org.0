Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C77C6D17D5
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 08:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516944.801872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pi8cC-0005oo-DI; Fri, 31 Mar 2023 06:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516944.801872; Fri, 31 Mar 2023 06:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pi8cC-0005lv-A3; Fri, 31 Mar 2023 06:52:00 +0000
Received: by outflank-mailman (input) for mailman id 516944;
 Fri, 31 Mar 2023 06:51:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XLms=7X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pi8cA-0005lp-RV
 for xen-devel@lists.xenproject.org; Fri, 31 Mar 2023 06:51:59 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe16::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84cf8920-cf90-11ed-b464-930f4c7d94ae;
 Fri, 31 Mar 2023 08:51:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7102.eurprd04.prod.outlook.com (2603:10a6:800:124::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 06:51:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Fri, 31 Mar 2023
 06:51:48 +0000
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
X-Inumbo-ID: 84cf8920-cf90-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJQTRMiPuYZhCH1kh9+ACJ/VZmDGliGJT+URu9x9w3FcxyPxggTiXHWIVi+IyFDycxG3R0aA6sjOdNZobw3FKbS+tmzGfhw7J7be+dAub4cxaX9LipkoAis02E2X/fhilt5nm0VcxjNGSc5U7TKRpFlC7/9ctQbO1LaAwKr4Bgp+zf0ciyuFh0klDnbCg2etUZfoffp+bCi3SbUOYs488KMmWAvYfggKcgOEk08e7Z88UwCjovdASEP00TtWZOyleIKHoDOQ043szuh6IPomRFomdpsfuyg3tcEJOY3tskqrzlh2Y9xXFDI3kYRX8pME7tAljS/TAbqlXx57nQ0pvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6trnKtko8ZbHqiRaYgoPgjyTwZDnxJcvnhRnJ+ZYDA=;
 b=HSauT+VIjF7Rm3Vs5nR/a7Ls8mhyb2pH9cMxkJnsjxs1xr4JWw9EkMH2JagFVt306pt6j3hUz7p/WVj7MC2B+jTKZi0F0JomPq+pZQSA1VKhyrGPPTUkONQuKVbodIUHuWFSuHeWAplWXxsa6BxOjiZ6g+rJ5H3XDuYbzWesFJH00cdsjdWPDO+vGXzGgPz5Kcjv6vOrQyvwM5MqP4nv8E6RMQynM1gevDzx3QBerKz6rDMN4bwDxwyK+kcdQuMoJ8JLB1XAwB+AFRRflb6DZlcxag/lvKD2fv5xIVZx6blxMejaUL3bfOWpl17jHuA2+bR1UXD1T8zNRcQ1gzGcFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6trnKtko8ZbHqiRaYgoPgjyTwZDnxJcvnhRnJ+ZYDA=;
 b=JlJZwnO3vA0KZwpLX2xVbGUwpplAK9ye9Pzn1sOS8xGsmM0iXJV2tALc6t+fa24B0LwS/B13uQsS1vAZYmYxGLHwwg24vM6oRYLv2kix6Ym17liRIq+KFB4pu/3qKOfOActVqoJh3sPk1WptycNlF9ufJuTM1VpGRcYfwHyANA7JTpAUbkAv1xUsrhg5wUfviC8sjH0Eqpd2eseJTC+IF5jYreqx2bxLfH0XYqMxdyELkBWYicDaMXJJYHSRnerrfft5BXLxJAo863aO3Q+L5M8kdd0EPvaJDL+86Lc/VnfTj7+qbYRluXz6Z0NGHr0FovxVJHfs9xIOEpv5WqTZAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6dcc187a-5e81-2f36-4104-d9caac148cdd@suse.com>
Date: Fri, 31 Mar 2023 08:51:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] efi: only set a console mode if the current one is
 invalid
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: marmarek@invisiblethingslab.com, xen-devel@lists.xenproject.org
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-3-roger.pau@citrix.com>
 <c62446e1-8e47-5fa9-1c7b-a441d38711e6@suse.com>
 <ZCWuYjP7L4obvXt9@Air-de-Roger>
 <50fe2ff9-9633-1cbb-4afb-b577778d3edd@suse.com>
 <ZCW2IHKP4GHNmBuk@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCW2IHKP4GHNmBuk@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: f82b17d1-a3c8-42c7-75d1-08db31b4660a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vdaf+hxC/BpkKOZw7G9okviQP/7r2tZ5d5nvFwbYUU0rnvPU1LThbuSqV/Zq6Qy5zOCrg5DB3VBe6rmGl3G2ZaGurGNz1g0nBAPNSLIgMetmGqZHksl4CLT9Zp+QotfrsDLpfh7+fufIKqSaAXyUqsV14b+8qz83nJMuDsuWO8gy5HTDwz5uV8UHSOH/269CaytFvYX3fTjb2oRi7PkNqr44UB+XzTi/FeQEZp98MbXdYvoAc741bShTmWnDbHkMZ7jknVWgyVIojjvJqHEXbdO09Vv03H2poU+jsgz+OmTe95LSIkIGqpahswAPDa8q81V+Zakacl1kckdg38tiDiHfUzxOE/RVZXeghvVTroKhh42zAcEAqkj6cFdEPCBa0pA+W1X14PsgZvXciNOW3lgJvMegNyNdZJno/drbRLDPd2hA4RLaN/tgTahukBMem1KNB7Rvv/9SsEaho2Dqb0vqhnZqRLWg+OXJ+bj1FdOIxrcLgtq2dvAQd+hNUfuMJrbdkwi8yLRAijnkqansOWSirileLsja9tdLIcBSXJ31RuQzuILjkuYvS8/KGg0BlEGoKT//Iw6hW8ogiKTujITMzQfNREx/q3EoLwKkn2cUEVOabulkUpnlr0yQS36rjqAt4Q/uS1JZOEjpetnVNQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(366004)(396003)(346002)(376002)(136003)(451199021)(83380400001)(186003)(36756003)(6506007)(6512007)(53546011)(31686004)(66946007)(66476007)(66556008)(4326008)(6916009)(478600001)(41300700001)(8676002)(8936002)(5660300002)(38100700002)(2906002)(6486002)(26005)(2616005)(316002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWkrcWpDNXU1KzNOa1RDdU1HcmFTMmdzZGoxeHd0U2RJTThXaTZ3cU1SRGwx?=
 =?utf-8?B?WS94REQ3WUt4VmFsaG92dkhvTmhhbkV0T2ZvREN6aXlRUTcybmlQWUt4YU1K?=
 =?utf-8?B?ZDAwcUJObGkzdndZWUc5eUlXdk9VWHQyWkYyUUlIUjdDdEcwU0xOZ3RkbGUz?=
 =?utf-8?B?cE13WXVYbTR3RXdOL1FJendObUt4U3ZFeXZXRXIyV1dlM2E0TTI2S3NISFB6?=
 =?utf-8?B?TC9CcHJzRUFtdFFFcTYyVFVCMm5icEFrREF0WjgzUXVSR1drNGlRTVFlS0Vv?=
 =?utf-8?B?RSt0WUZCVEVhUmszZGdnM1grL08wVDExWEVhT1I3Z3NQQ3lFVXpBM1NkdnN0?=
 =?utf-8?B?V0dPc2l1M1ZLQUErYVB3SHNYenJLcWxiMk9FcjlYbHBsdzZOa2hiOUhCQk5m?=
 =?utf-8?B?RlZ2T3NFMXhrck0vaFYyWW9OK1F2ZzZWSW1paVZLV1ZQZFlRM043S2VvSVFa?=
 =?utf-8?B?NlRONk9ob0dGd2xKOHhNRU4xWHFaRmhqQSszYUxyU0xTSjFkYWtxcmppY29Y?=
 =?utf-8?B?TGkzS0JaMElLNko2Rk5lYkRHNjZETUsxbmE2R2JUemw5bEw3TlJpNUlhUW53?=
 =?utf-8?B?b3JJeTVlN0dPakxpQnk3Vk9LZG1seTVQQ01WNHpIUW96eU8xc3dUZXh2THZr?=
 =?utf-8?B?S056OFAvUzI1ZjA3eHpjN2k3V2RrYlZPNHc3WHJiZENpVnFkQm1MS0hLNWln?=
 =?utf-8?B?YUpoYTJjNnNhY24yMHZBSytwQXJ1M292T01FZUlEWEpjZ2lYS1FUL0x0M3cx?=
 =?utf-8?B?OWppbENaZXJ6cTF4cWZpdTQyZUkyQXdoMGJhNHc5Q3NlMkVuWUFwWCtFMnV6?=
 =?utf-8?B?VHNzMDZLWWIxdzZ5VXBXYlBwZ0p5YzlWVEpkeGdyNkc0VVE4NWNLVlRER2U0?=
 =?utf-8?B?VkZiaGN5ZzgxNDNBcDBRWElGd2dzMVhORUhiWVRQVjErd1VZdVQ4VVN3dUFo?=
 =?utf-8?B?UUZ1SzBjUlVKQmtVTXBSdllObGFqTjNkOHBzdGZ3Ymx2YmdDK3d4TTlwMkQ5?=
 =?utf-8?B?dVNvVndsWVJTVk9uOEd4Z01lejJOSFc3Wm9yV2k4SE5BdW9VZFNKZjNaVWNq?=
 =?utf-8?B?VTBWa0hKcmxIV3RyaEt3U1poNWF0MWF2akN5dCs0R1RKVERaLzM4cXg1Y2Zn?=
 =?utf-8?B?cFJxRWh4Q1FiNVZKREsyRE9Uei9lMFJ0VHloc05ISGZJWmhuZHF3KzJFUG5a?=
 =?utf-8?B?RnhvTmNUajAxbnFnNkplMUZSQ2xiMVBiY2JIbHZWbUhFc1cxbDYyblZwR0dz?=
 =?utf-8?B?Y2Y0bDJ6ZmhQNlYxa3ZOL0VZTXg1QXcxTGtkNWJVV3JocWcwYTc4dFdUb0JZ?=
 =?utf-8?B?L3RZelYybmFUTmg4dmE2RzJyVEdsZVFkcHVTeFNWbC82MmFRTkFHRjgzYisr?=
 =?utf-8?B?OFpSUUhGRFVZWnNHVTM1NXU0S2creVo1MXVIK1NxRVVNTFhCSjdTWHVwUWVl?=
 =?utf-8?B?aXNNa2kyTVo1NzBwU0JtSm9SVEhVbzkvS1d5OUN6YUNYeDBXTTIvYW44alZx?=
 =?utf-8?B?dnNKV0xSTVZpTFB4R3pzdUltMVpMQjQxOWxtOXU5Q3d6eXlKUXVNVkk2OFJH?=
 =?utf-8?B?QVV6RDM1NHNmejEvdkpTUG1Na3VPc0NDSG9SRGxUV1VyanhENjF3N2pLeHNM?=
 =?utf-8?B?SWdUQU1YNUZmOXpYUXdueWdva29lWHJKK2xhSEgzeVowU1hFWlEwU0pQc0Nm?=
 =?utf-8?B?dE9WSDVZc0QvV1RBN01DNFdhT1JGeUhuNENwem4zdWd3VmFUR1NBSE1iMVFh?=
 =?utf-8?B?c0pFeTZjQ0FBb21sa245enVldWNxeVl6dVZpQkczaUtha3ZSY1FLMHdBb0ty?=
 =?utf-8?B?MHhROEppeHNpWURCT0ZLZFN0ZzdwYVJ0SlhtZVFBYUp2UVBNc1NaV0FKQTZ5?=
 =?utf-8?B?Q1VudFdtelNDL1pNV3JjVUQ5N0hDZ1BiMCtVdlVBK0NYdXh5dFFmdXJxMjd1?=
 =?utf-8?B?WGZkdWtYclRuTm1RaDlmTlg4THE4NjB4UzNRZmZMR1pDYzBZQzI0M3h6UVZ3?=
 =?utf-8?B?dmh2TmVmU1d6Lzkvb3crUFNUaVZEK09pL1phSFpuOUhoU2w5cktpQ3NXSE9G?=
 =?utf-8?B?RTlMWGpPVHVOSVJzcHNMakJSUVB4V2ZCMFdkWXpRVnE5QjZCOTFBelJvS1or?=
 =?utf-8?Q?jgu8sHng5QtYXO5EZDJmiRafo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f82b17d1-a3c8-42c7-75d1-08db31b4660a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 06:51:48.0719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: En/otVuu92nVmi09xbvWpzhKkhzw+y7HJ4Ejq9edRUWtVmRSG4K5gEwDOPoOMOsgCkRZR0aPXP8YTE7QuJtbhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7102

On 30.03.2023 18:17, Roger Pau Monné wrote:
> On Thu, Mar 30, 2023 at 06:07:57PM +0200, Jan Beulich wrote:
>> On 30.03.2023 17:44, Roger Pau Monné wrote:
>>> I guess I'm slightly confused by the usage of both GOP and StdOut, I
>>> would assume if we have a gop, and can correctly initialize it there's
>>> no need to fiddle with StdOut also?
>>
>> Setting the GOP mode is done last before exiting boot services; this
>> may be a graphics mode which doesn't support a text output protocol.
> 
> Right, that's what I was missing.  I assumed that all modes available
> in GOP would be compatible with the ConOut mode.
> 
> Would you be OK with leaving StdOut as-is when booted from multiboot2,
> or there's a chance of things not being properly setup?

On modern UEFI it may be unlikely, but I think it's not impossible (see
below).

> IMO it's not very friendly to change the StdOut mode if not explicitly
> requested, as in the multiboot2 case that gets setup by the
> bootloader.

May get set up, that is. If it was set up, then yes, we probably should
leave it alone unless told to use another mode. I.e. no vga= or
vga=current should minimally result in no further mode change. Aiui we
can't easily honor vga=gfx-... in that case, so leaving the mode alone
there may also be better than trying to guess a mode. The only time
where I would think it would be nice to switch by default even in the
xen.gz case is if the boot loader handed us the screen in some text
mode.

Jan

