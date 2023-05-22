Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4420A70B5FC
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 09:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537766.837260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0zh9-00017m-G9; Mon, 22 May 2023 07:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537766.837260; Mon, 22 May 2023 07:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0zh9-00015K-Ak; Mon, 22 May 2023 07:11:03 +0000
Received: by outflank-mailman (input) for mailman id 537766;
 Mon, 22 May 2023 07:11:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q0zh7-00015E-Ne
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 07:11:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdc48339-f86f-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 09:10:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8879.eurprd04.prod.outlook.com (2603:10a6:102:20e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 07:10:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 07:10:29 +0000
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
X-Inumbo-ID: cdc48339-f86f-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlccuHh8rAaiZiaAoVBeQvI2zAht4UYBMvUb0DQScLgpq6KJLZEGxv6/hnlSZptGzkvfsZgbIZrrB5mQt+nDJLRI7QohFaCBFzcPyufKBZuDRoHsR/E1wcvR3swxEIjoW/DIUmeKtoSUcc8IrXwNLbseUv4xfSeobjNJDk//RRZGoZ1jXbeUmJklbjpE9P7qff/Qd3WKz39zbuHn3d/eundMCMwXWmbEUYUU480AeGWPzodom5TQSSQQlCvvWJiJ3Zhk4SX0O+LyVRcDbkueZNDgo0qb7E29RG5gQBvEDVOCdQBFsXvoCKEmZSGaXXB+mjEBzRnwsut8BaT2NSiLMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUMvqFL4iMCDcp5HMfniT+gD/ju1GWE6oPi/bHszLQw=;
 b=OKBnMFAcarvGCw8LXb2ktliP8dQloqApTFljT+gAM2LRwUuc40PLBsB22EE8AsN5xxLCXQx1kAOZTFei4IdVhSStw+zj0ygp1o9WtYR9z1qbVnnF6+MgdZaKpwO2nPCsFTGxl1pRZDeCUUtV8uWcrmhXgW0gdL7zE2Y6davcmmODlQqact66+3kGRLUO0lVvZhUzYbJ2Gz8WtR8sGotDijC6OXzE6tQ+/H8FwCL6W0GhZDVWs9Zc3sG5kEpKvOlZCS6swBb59c5dOtUnfybXc51s+5xzB2heevlsiRX2CKAB1dyOImv4Vta5YFzbF0raZJrWMKoF2/MzN/swfc3xwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUMvqFL4iMCDcp5HMfniT+gD/ju1GWE6oPi/bHszLQw=;
 b=FILn5AMahbPEYX2OAnG3f5IMI10ETCIVUfBFfwjcfMn6+yUbvr3nlhn39Qx+pCDLneGU3dLs8S1CbafW+MRYVIuzo/Xpe+Bk47fwsRFpwW7z4cDBjE4om+DkRDjkkl4AxIAZD+MOX4r+PbS0ysfoMq6l17D0dgD+vKar7P1lxAE5Avt1t71Np3U1Dabgl5GknA9DYWpD1ky24idpqtEUoyLyay1XWZvdxczajJVh0Bv8XADwCBokpTfXid+y9kVTQ/3vJiUdP57o6y93A7hO3ywcUjx23RItP1HI3SKtl4gQCf9uNG5upgFL15nZ9wUt65/9Ta0m1BEER2tmEi6lRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <678e997a-0e3e-a6b3-1bba-5e66ff74de48@suse.com>
Date: Mon, 22 May 2023 09:10:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/4] x86/spec-ctrl: Remove opencoded MSR_ARCH_CAPS check
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
 <20230516145334.1271347-5-andrew.cooper3@citrix.com>
 <1d06869b-1633-7794-c5c9-92d9c0885f19@suse.com>
 <42cd2479-1eba-11c7-26d8-441045c230ed@citrix.com>
 <fb95d033-7a71-7cc1-bb8f-ee2a74d1c5cf@suse.com>
 <a8013bb5-b0bb-6e42-85de-2e12d7b6f83c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a8013bb5-b0bb-6e42-85de-2e12d7b6f83c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8879:EE_
X-MS-Office365-Filtering-Correlation-Id: b352edec-d440-4d5c-ee0d-08db5a939fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WGIWSuvGGvtRov2NiGPjYwkL0U6f3nYXL8fdE1pPaJqAvsyHo98uXVYf4KkO6G7xGopfVsmNGCMhN6kOg2p1QDwxfVtlvU33hpOnkomERlvBoWw0ZsJZ6hhHieU5iTF8ItRlw3kFq999ahd8be9B0kq57gQt8brgx6iEBl3cV9tGydHiVXHPd2Juv+qIo1vG3e6NIeIavxol7vst3CAsZ1ccSu8n2vPvWAN5A/v+ptGSKultLK5JHRbRF6GdZjUDLehOGj/AD5Wky7RVtUKKZVkj2JWUv9+e/8Qbg3Mdh2FsnNaeJ5MW8bZW5b8LsZqbtHGevYMWM+H9nny3YvBTugcfPzU8+U/714mB0h9e0aK9KU+r6tsDP6eMRcACtpQ4S65UhzYQf44aek3dSjZ5Xy1UuSo5mTF2hH8VsNhPhhsZ4EZZSi5h9qgrnxw614d9kikeW9y3Ejj4+PAxDEohX4jX/Jy5jGPWDbDrQkw0bWJ+YxU8VpQ4uOJk//0n4ycFOQYxKhJzwOgrmnkseVXFVxJ/b6YC3woC3FFWh3HHHdGfxPuAMa38D8E1BIgJtwMg9kxucvo/0uzY5hIZVenSrvXqBQpTAq2b3nXF9+yyHqtFY1mDobOfY+WsVVHzdn1DhKhZG5jfC+lP2ANY8K4yAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199021)(38100700002)(31696002)(86362001)(36756003)(53546011)(6512007)(6506007)(8676002)(8936002)(2616005)(2906002)(31686004)(54906003)(478600001)(186003)(316002)(4326008)(6916009)(26005)(41300700001)(5660300002)(66476007)(6486002)(966005)(66556008)(66946007)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnllZWc5cFdxaE1YMitnam5DQVBvSklOMWc2M3pZcU1pTkRRVURpOG1QTGsz?=
 =?utf-8?B?ZUdKSW11bEtuSHV4a3pKRmVFdTFmYjRPc0JDMlpoMjR3amtrbFRzWGI4WXpC?=
 =?utf-8?B?Nks5ckxma212WWxlTDBTRzM0S3R4RC8wN3lNZzhWcllpRVBRbkNLQnY3SWNX?=
 =?utf-8?B?WklhNW1LVmpoYlVIbDBBalVZRlpPMVlCVlhHcEJsWkk0aHAra3pYTm9OZUR0?=
 =?utf-8?B?VHFNTjhOZHpvalZHMHV0aVVWcTFkRytwNlMvZ2dJOTFCSzJwQU0wU00zNnh0?=
 =?utf-8?B?SFpwOTFLOVhObHJoRDJPc0FXKzVPc1BybVBPQkY4V2hvMkticFdOZ2Jwdksx?=
 =?utf-8?B?QnFYOUxsV3lLU0k4WFAvQ1dXTk9EaVluV3BFYW5NVmJ2R2JTbnpQRENkaUVt?=
 =?utf-8?B?eXBYTllQMFZNQUtWVG5TRVZ4WVl2dmNrMkxodURYa0FuMmpyKzVaaFMwTXJI?=
 =?utf-8?B?VnpqSnMzWkRaWFp6eW1CbHBaV25aeVlnb2FwODI5cTVKSmFrc01ycSs1RSs3?=
 =?utf-8?B?NDR0NEtyUEFLUmJkcmtuVjFLWndEWldiVGx0bDJibnpLelRQL2JKQ0RTRm1R?=
 =?utf-8?B?RW13MXRzTVdicVB6T1pBQVpvdTRsZlB2dzRoWjdZUmxVTnN5akhaNDhpYlJJ?=
 =?utf-8?B?a09RT29raDFZRVpPYWJ3TzNoUTloTU5YcGdZUy9LMlJtcHRpbnNGbUFUaTBZ?=
 =?utf-8?B?b2czUjAyKzZERGRuR2ZHcGduSG8zYWFzTmpwQ0VuS284SGlMTUs3eWFEMnVL?=
 =?utf-8?B?UitkQkc1SXg2clo5YlB3QXpaL3BRR1FmaHNCZ1NNOEU3WURKNnowQUF4SE4z?=
 =?utf-8?B?UC9BbXQ3NXFxcms5WGVCcmtpZmpxZ3E3Z2l0azN4bHZPR2pEak5CNHlSM3Fu?=
 =?utf-8?B?SGpDZWtjOTYrdUYwem1GcjhZMnJFMXRWaStLZkVqekFBc3M1MXViSmlmRnM4?=
 =?utf-8?B?YVNnUzQvL3RuVDlIRnFXMGZYbGRkMUQ3aWR5SlY3U1lVZmRUbFdIRk9aSmp6?=
 =?utf-8?B?cjdMY2Q2aGlNMy9iWkN1ZDNYd00zRFZMYmdUL1dxdnlFYVVaQXpURmxvMDho?=
 =?utf-8?B?bHRhQU9KdWlkWmpISVVyN3o3S2cxcXFtNzJOcDRXUDVhN0tLY3R4bTBPVjJq?=
 =?utf-8?B?bVI4N0tJcGNxcVhYeThCNDErWnlHNzNZeU5hK1BjdGFXVllCSjlVQkoxbGdH?=
 =?utf-8?B?NGVWdUNVTXlHYk1GMEp1ZHJNR05ZS0RvYmVjR2ovcUUzeVlrR3dWUXJLREVv?=
 =?utf-8?B?d3Z6bzBVOUNtRzBhYWNlNW51aGtTdkVaY3IzSFAyVjV3dHhsUnFaL2tsRUpT?=
 =?utf-8?B?YWpsbGdOTmpWb09UQk1MQ3BnMlZaVkwwcnhXZWFDVHYzL0dIbExXc1grZ2hW?=
 =?utf-8?B?K0lST214d1VkOEEreU0vTG9FZnZoUGZ4U1RWSjlSU2taWUhkcjcyd2Y0dllq?=
 =?utf-8?B?UEVwTmxVT2RySjJubFJEaWRVSGIxbFVYUlBpVEZEVk1MTUZsVjExeHBCS1NI?=
 =?utf-8?B?ODhzM0ZGMlk2NnI0UDhUdlI0SWZQMzVsRzRjLzJhalJWa0wxRUlLTkZXOSti?=
 =?utf-8?B?eTk0K0tOSXJoZE5vQ3RIT3cra2JCSFVPRHE1UWFDSitsaDRGWGdUY0NndEJQ?=
 =?utf-8?B?NmdNTlJwWXlVUVRjLzdZWWlLT1BFRVdPc1l2UUpYWjRSaXlXZS84TUsvOVpk?=
 =?utf-8?B?Rm5NQ3JGNHBDaW4yRWJ5aE9XRXRza3lJZWd5QXRyTk16akZVZjBCMmcwMlRx?=
 =?utf-8?B?c3liUFMxWXVZYlVmNVJvT0NMZkRLQ0ZWQjdqcEEvaXJFOVMyVytQdEYyNmdT?=
 =?utf-8?B?cXRQd1gvcUVmSlNaQUo0MTIwMmQyLzllRkJENFhVS25XRHcxRC90ZkRUVjQ4?=
 =?utf-8?B?alY5V1ZobXg3YWpCeXpjdWZtVGJCNTlqTDB6bGtHUEpQdlM3N1JzVlIyZ3dV?=
 =?utf-8?B?SmJVcUVudTVqcFJYc2VidmVsb2lhSVQ3OW8zWlZaQmZCQ2NlWmx4Z3BuUWtZ?=
 =?utf-8?B?VDhmU3JCQVMyVEpEd2dOejNrSVVzSyt5Z1laeitOUlhCU3U3S0FweHpWbEFB?=
 =?utf-8?B?d2g2VHRoMDZmTGZNcitWNVFEWjNoc2lmU2w1Z1lzM1ZTV0JUeVhFUFdSazFB?=
 =?utf-8?Q?reBifacJOXXXlpEvZSUAnPHB5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b352edec-d440-4d5c-ee0d-08db5a939fe0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 07:10:29.4183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2IvTW2kjrr39g1A3fmdAY6xvAp0YPbBUsyY2a4qVqJ2P1CZrMMwAg/JGi5TP85LjA+IG24MApKxdSOihEsh3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8879

On 19.05.2023 16:38, Andrew Cooper wrote:
> On 19/05/2023 7:00 am, Jan Beulich wrote:
>> On 17.05.2023 18:35, Andrew Cooper wrote:
>>> On 17/05/2023 3:47 pm, Jan Beulich wrote:
>>>> On 16.05.2023 16:53, Andrew Cooper wrote:
>>>>> @@ -401,6 +400,8 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
>>>>>          cpuid_count(7, 2, &tmp, &tmp, &tmp, &_7d2);
>>>>>      if ( boot_cpu_data.extended_cpuid_level >= 0x80000008 )
>>>>>          cpuid(0x80000008, &tmp, &e8b, &tmp, &tmp);
>>>>> +    if ( cpu_has_arch_caps )
>>>>> +        rdmsrl(MSR_ARCH_CAPABILITIES, caps);
>>>> Why do you read the MSR again? I would have expected this to come out
>>>> of raw_cpu_policy now (and incrementally the CPUID pieces as well,
>>>> later on).
>>> Consistency with the surrounding logic.
>> I view this as relevant only when the code invoking CPUID directly is
>> intended to stay.
> 
> Quite the contrary.  It stays because this patch, and changing the
> semantics of the print block are unrelated things and should not be
> mixed together.

Hmm. On one hand I can see your point, yet otoh we move things in a longer
term intended direction in other cases where we need to touch code anyway.
While I'm not going to refuse to ack this change just because of this, I
don't fell like you've answered the original question. In particular I
don't see how taking the value from a memory location we've already cached
it in is changing any semantics here. While some masking may apply even to
the raw policy (to zap unknown bits), this should be meaningless here. No
bit used here should be unmentioned in the policy.

>>> Also because the raw and host policies don't get sorted until much later
>>> in boot.
>> identify_cpu(), which invokes init_host_cpu_policies(), is called
>> ahead of init_speculation_mitigations(), isn't it?
> 
> What is init_host_cpu_policies() ?

Oops. I did use my own tree as reference during review. See the long
pending "x86/xstate: drop xstate_offsets[] and xstate_sizes[]" [1]. Maybe
you simply didn't tell me yet ...

> I have a plan for what it's going to be if prior MSR work hadn't ground
> to a halt, but it's a bit too late for that now.
> 
> (To answer the question properly, no the policies aren't set up until
> just before building dom0, and that's not something that is trivial to
> change.)

... that what I'm doing there is too simplistic?

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2021-04/msg01335.html

