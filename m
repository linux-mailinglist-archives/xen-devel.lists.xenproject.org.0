Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3066FC8DD
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 16:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532242.828334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOGu-00018g-Vg; Tue, 09 May 2023 14:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532242.828334; Tue, 09 May 2023 14:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOGu-00015s-Si; Tue, 09 May 2023 14:24:56 +0000
Received: by outflank-mailman (input) for mailman id 532242;
 Tue, 09 May 2023 14:24:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwOGt-00015m-He
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 14:24:55 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 441ac25e-ee75-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 16:24:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB10068.eurprd04.prod.outlook.com (2603:10a6:10:4c9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:24:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 14:24:52 +0000
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
X-Inumbo-ID: 441ac25e-ee75-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mD7++gYq4r9QjVb0eqMVsUkdjzIlwbeDjujvf7TFqigxSet0xSwGbyHiGVMoiOTD24XxAuUQ3IbUO7NGP7QU+U/1psdqsMLzt1WFWHItxBLoy7XddhrnlYWXzNdIe8D3Eh0TULcs5Cx4L7tdPf/Wz320Ue9IaobDio3JCGPzVdOZ6M+MqTO6uMCyU2INED/SsiHTaGgvq46UR4xdddl3kbi5PMWKK699tGHL5RZksnM8o4GnVHAwFiMfTyY4pEoW9xCgpkS8R098JYSioZXZBlM9FkvlHrgtSBIB0gR+j8JoqdeYSIrTPtPSElLh+3XjGWGbkmAdciKsyDCou77dlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYViuhHHCw/s8dVOtM2HJgk/OVqgQ5grkC3l1JOWhaU=;
 b=QynP3YenebGKenXnV3jwm5hcQhmwpnM9cyV6c6ESEERSTWqmjoEBx1ToENa7+BCJFNVgt+kZ0mMSYv0htBQLcf/L4lynTKTlbsuhjkuJcuzMdu7SMM7kFknwzzIQq+EA4YNWoJH+EyPTboCHlkBtmSNae1eAsGfkKTAU8ZP0QBzTMhfnQzn+F4+1j/JHagSx7Pqlh2Lc9b8TWJWce7vcsyjChEWi4TPmmM4i3tQPTri6AEuf0XHWAL+QnahoM0cW442Jb+NZrrYG7KovtRyQ+LKg/EywdVcaNj5JlBT2UnHrct6TbrRgfmdBs0/Wr5C2bTeT+C8jc5FMjR1patrlbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYViuhHHCw/s8dVOtM2HJgk/OVqgQ5grkC3l1JOWhaU=;
 b=0dqVVwz0dvEG4Qo70/0fwahl1dwP8QCG3Bzne4ZTt6ucSC67cJGm6LMpDY/SXggSVehfOzBuIvM8VXeyV+XS5x5P5ch0uTUa/+Iv96ALY1rslcFksxQD5sR3dqlDg52/VEljTJJvzH/GfU7gY/sZiTiwBLqngM6lSJXEMDBN9tij37dcb0zpE8Qgh6kbLrxv+OMzu0zYaDAR1X6TJwAGwyaCbXdewrtWHx9Z0VPK0MruOP/Ygj9Zk1z46tcQxkIXTz1HW4pCjrPUbzGRAnHYFNy6mbCITwq0xX/WGVaAYPAZLSKL3XyKhfM9fhb1erMWzJ5L2g/mHHcBkxopxkfo1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f09c9127-1cc4-1ed9-0348-be12c0c999e8@suse.com>
Date: Tue, 9 May 2023 16:24:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 5/6] x86/cpu-policy: Disentangle X86_NR_FEAT and
 FEATURESET_NR_ENTRIES
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
 <20230504193924.3305496-6-andrew.cooper3@citrix.com>
 <9613df3b-c49f-6034-ff99-7a6ea9286f0f@suse.com>
 <e888dc16-66bf-fc15-9ddd-f10879b79a5d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e888dc16-66bf-fc15-9ddd-f10879b79a5d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB10068:EE_
X-MS-Office365-Filtering-Correlation-Id: 455a3764-b113-42df-01c1-08db509926e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P7cCIODMHw6d2bTcv5HZWFDsFlul8udr5O/T+KpQCocp9c8bwEFiC8JAUREzFd3xx7LWPvdhwNOVjovYp4Dbt5lLHMGvYZqtMjUuCCtj5h8eVzKMtp0Ni1fIqTrb6AK3QyPRSEtJPoUrxjdokfSHoSw6o96LhysrFm0QcV6XVkYkLKKTHlqsMavmuGDt35rkOoVerr5HsZxN4PIsYyR4tNiVnN8f/tDNHC9bvMJuPRhd+shomFAJ4qHiXNFFlV1+7ihFFXGdWcEQKT0fluwLY3A/1c12sfpDThdYh8uziDQ58cjYnkVW3/s80rBNXvAwwi6IEqzW6TYRVhAeQHT8M2TkGivf9QyOHrpYUuxVjWBaBm2SnDNCLKtxaW7nki/A5zIjAt3lzCyuAiPF4cxviRuTx3aeLxgKMh2yMx1T9OoqSuPEcCvLEfNycf2YAnuK2fXIFF+tsafWak3P82sX3hUm6YS+qvo5jaHOv5gOJeU4YLxPIrkAYPA91vJ+P8YnB9IZ7Oq9GeuLZSKyqex1+wa+YMHz1QoTSG/yLqtdXD+KHWKEReqWdGu80i0EyvFOg0L8fdqWU3pGuOQd+DttZd4T3DfFYCNGJA8yaNKckf31lALIZel+6CnrHcgXL0x+dGvpGg8BG9mXlG8/1Bgxxo498wwBI1AWGGuCrKGcBus=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199021)(2906002)(316002)(8676002)(8936002)(41300700001)(66476007)(478600001)(6916009)(5660300002)(31686004)(4326008)(54906003)(66899021)(6666004)(66556008)(66946007)(966005)(6486002)(6512007)(6506007)(26005)(53546011)(186003)(36756003)(2616005)(83380400001)(38100700002)(31696002)(86362001)(522954003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWlIRkwwL1FwcmFKbGN1SThwWFFoQlg0NG5QbzIyVk1iVGhSUGF3VzdWdFpG?=
 =?utf-8?B?NFZ5K05SdU01SkpQYVhUQlM4cjZmQ2paeVN3ekp4aXRkTnFneFlPbTYyT2Nr?=
 =?utf-8?B?NlF3TXVHQy9hbHZCVnV2d25UN29rdXROVDBOeS9WMEcrQk1WVkhaU0x2TGVt?=
 =?utf-8?B?cDB2U0RaSkV6dG81K1BhSFFUd3I1WVlXdVNabXdsSzBzMS9GOEhYa0pTNk1G?=
 =?utf-8?B?UGJaL1ZFRFZYMit4UWVmWTFLSDN4UlE5N0IxVm41eGMydlFGbHpWWUg3eEdH?=
 =?utf-8?B?d0lpZlU2V1ZKOXNjQ29NWXpPK2pwZnE4MU1wYW82MGxwZnVLUlRhaTB0aU0x?=
 =?utf-8?B?blVJWHFYeFJKeXB4MXlFS1hBRzN3NWhPNkF1dzY1cXRaOEJVUkxESk9NUDE2?=
 =?utf-8?B?dkxoRTBUK2pVZytqN1RncVJGYjVQRkhNckI3cVFYTVdaRG5LMUJKM0YxZndk?=
 =?utf-8?B?WkVkaDdnYjlDbUkwS2tvNmFOdGJtajlvbE5udzJGSEJnZjd4N2YzSjBhbkt4?=
 =?utf-8?B?a0g5N25oQVFJbExWTnBzZVJPSk9yUmFzTFE2czlINXVNaUhPRTI1MVAzU3lQ?=
 =?utf-8?B?L2kzSGpIRUE3cEE3MWY3NWdpNDF6M2lCRHl4MzdXWDV5NzhnbHI5T05TZ3p3?=
 =?utf-8?B?YnZsK0E0dm01cWtkaFNRRjlQR3F1UE1kVC9jU3NLbTZUdHVDK0d4a2ZSdTVT?=
 =?utf-8?B?d3BBZTkvaThjNGx6c2RTUEJiRUpuZUV6c0NZck5rY3k5QnJwcVBiOU10Mzdj?=
 =?utf-8?B?WExwNlYxQUVQaURsVlRWaTBqQjZOd0U5ak8wL1Z4OWhIb2JEQTlLOVVHc2R5?=
 =?utf-8?B?a3V4aXdQNGg3TFRCdFFkOFVwS01iTWw5R1Nrd1c3UHNzdk9ITHdzZWZ5Q1Ja?=
 =?utf-8?B?RmZJdkE4c2kwWVdxQ2JMSnl6YlhJcFRpQlA1Y1VHZ1Y1ZjB3Vy9Pam1tQ2g4?=
 =?utf-8?B?YlkyeHluTnYrNEVEaExaZ0UwaCt5blVxWll4aXc4cnp1a1JHQkwwbmRFSjdG?=
 =?utf-8?B?Q0dhNC9TWUdPYmpyQWxOMFZMY29xV2ZGRW0rcjNnWXcvNmlNRXpGZkt0MVRr?=
 =?utf-8?B?aFEycnR5a2VyN0RsbVQ4cTZMK2QxWDFGSzhKa0EwUzB6c0wrT3RCL3dPZU54?=
 =?utf-8?B?SkVjbUVMdHZibXNlUDBhaU9EcEM5RjhDdENCeFpXQTdFY3VmOW5iVzEvZFhh?=
 =?utf-8?B?cU55SzI1RjFVbmFKeXloSmx5cTV4Y0EyMXpKSnFVSkFOMldPNVRkOVdjZlkw?=
 =?utf-8?B?TFF3MkpheSsrdExlNlVPSTdDTUdnTkkzMU1JQzVUR2hOanpid1NSWWxSQ2ph?=
 =?utf-8?B?UzljUGV5K3c3c0x0UjFjTTkyVmhkcUE4VzRhUWQvRlNYYTQxN3poa2M4dVRs?=
 =?utf-8?B?Ukp1aExGNzVvV3h3eUZJN1A0V0QrRDBhQ2RWeFFyVFpKQytURHBTb25qaGtX?=
 =?utf-8?B?QkNidDJuNC9WV1BiNWVhb20wNGozZHBMUHM1WlE5TFhNcVdpNWxzdTRnZ05B?=
 =?utf-8?B?ZEhhVy9FYmhjWEwwcSthcy9EZUNlWkRoVWdWSUVEK1ZzVFR3RnlCVWpOaVVE?=
 =?utf-8?B?anRmTnJmZWpDdENoZ1hKOHhJSFp3SWxqZzdwWFhzQVhjNTlPWlJ4N3lqMS9n?=
 =?utf-8?B?c2ZMcFBndlRZVU4ydDkzM3hoOWo0aVcyVzc4NFVENkhxbFdqc1BLdnppTHpC?=
 =?utf-8?B?N3lLV0VpVHB5UzdqbjNiek9qYUVBNE40U1oxK3RZS2FnamY5dml0dkVuZGJy?=
 =?utf-8?B?OVhzVUsyOHI3SGpnTGZXYjUvWUxiWitJVG1vVE9JTjJEOEs1OVJWRlV0MlhU?=
 =?utf-8?B?Y3BlaktSamJqVnhoT0ZpTXNDUXBvT3ZXYkhWOFJxRmJNckJUVTlRN1dmM3Fu?=
 =?utf-8?B?QUV1dHV4ODZGQ0tzcEdaM3RuUGQySDRrWTVGWnpuMTRpR0JROVFTL2ZUMXkr?=
 =?utf-8?B?dkJKVEovNThHVm15UVdicDFOcHdiTWkxUnZzZXBxV0VSempJckZXSmhMQU5r?=
 =?utf-8?B?RmR5VUFRS0JtTzZCbVdBZnJVcExKK1N3bk9FSUlFRmZBNW9LZ3NLTVNqd1Jx?=
 =?utf-8?B?cmxqWk1EcFMwTDdyU3dBbzBUWnE2MFZGSkRpeUUxa2NPQ0o4aDhtWE9EUW4y?=
 =?utf-8?Q?C1voZqRNJACEEPI0byWGo8RWS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 455a3764-b113-42df-01c1-08db509926e3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:24:52.0047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFmB50uOVYL2FwM1TporCyVL5nNVRDTaJq4K/2yDCgX6u3NIyBvkqSnII0zCCsgiC2PF6j/fuxWV71Fnryl6pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10068

On 09.05.2023 16:03, Andrew Cooper wrote:
> On 08/05/2023 8:45 am, Jan Beulich wrote:
>> On 04.05.2023 21:39, Andrew Cooper wrote:
>>> When adding new words to a featureset, there is a reasonable amount of
>>> boilerplate and it is preforable to split the addition into multiple patches.
>>>
>>> GCC 12 spotted a real (transient) error which occurs when splitting additions
>>> like this.  Right now, FEATURESET_NR_ENTRIES is dynamically generated from the
>>> highest numeric XEN_CPUFEATURE() value, and can be less than what the
>>> FEATURESET_* constants suggest the length of a featureset bitmap ought to be.
>>>
>>> This causes the policy <-> featureset converters to genuinely access
>>> out-of-bounds on the featureset array.
>>>
>>> Rework X86_NR_FEAT to be related to FEATURESET_* alone, allowing it
>>> specifically to grow larger than FEATURESET_NR_ENTRIES.
>>>
>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> While, like you, I could live with the previous patch even if I don't
>> particularly like it, I'm not convinced of the route you take here.
> 
> It's the route you tentatively agreed to in
> https://lore.kernel.org/xen-devel/a282c338-98ab-6c3f-314b-267a5a82bad1@suse.com/

Right. Yet I deliberately said "may be the best" there, as something
better might turn up. And getting the two numbers to always agree, as
suggested, might end up being better.

>> Can't
>> we instead improve build-time checking, so the issue spotted late in the
>> build by gcc12 can be spotted earlier and/or be connected better to the
>> underlying reason?
> 
> I don't understand what you mean by this.  For the transient period of
> time, Xen's idea of a featureset *is* longer the autogen idea, hence the
> work in this patch to decouple the two.

Well, this part of my reply was just aiming at diagnosing the issue
as early as possible and as clearly as possible, such that one can
easily and quickly adjust whatever is missing in a change being worked
on. The main goal of course needs to be that this can't easily go
entirely unnoticed (as had happened, which has prompted this attempt
of yours of addressing the issue). I.e. diagnosing late is still far
better than failing to (without the compiler spotting it) altogether.

>> One idea I have would deal with another aspect I don't like about our
>> present XEN_CPUFEATURE() as well: The *32 that's there in every use of
>> the macro. How about
>>
>> XEN_CPUFEATURE(FSRCS,        10, 12) /*A  Fast Short REP CMPSB/SCASB */
>>
>> as the common use and e.g.
>>
>> XEN_CPUFEATURE(16)
>>
>> or (if that ends up easier in gen-cpuid-py and/or the public header)
>> something like
>>
>> XEN_CPUFEATURE(, 16, )
>>
>> as the placeholder required for (at least trailing) unpopulated slots? Of
>> course the macro used may also be one of a different name, which may even
>> be necessary to keep the public header reasonably simple; maybe as much
>> as avoiding use of compiler extensions there. (This would then mean to
>> leave alone XEN_CPUFEATURE(), and my secondary adjustment would perhaps
>> become an independent change to make.)
> 
> Honestly, I don't want to hide the *32 part of the expression.  This
> logic is already magic enough.

Well, I certainly wouldn't insist, but to me it looks pretty odd to have
it on all the lines.

> If we were to do something like this, I don't see what's wrong with just
> having the value as a regular define at the end anyway.
> 
> One way or another with this approach, something needs updating in the
> tail of cpufeatureset.h, and gen-cpuid.py can easily parse for a
> specific named constant, and it will be less magic than overloading
> XEN_CPUFEATURE().

If less overloading is deemed better - fine with me. Looking at the
script I wasn't sure hunting for an entirely different construct would
end up being more tidy.

What isn't really clear to me from your reply: Are you okay with trying
such an alternative approach? Or are you opposed to it? Or something in
the middle, like you being okay, but only if it's not you to actually
try it out?

>>> To preempt what I expect will be the first review question, no FEATURESET_*
>>> can't become an enumeration, because the constants undergo token concatination
>>> in the preprocess as part of making DECL_BITFIELD() work.
>> Just as a remark: I had trouble understanding this. Which was a result of
>> you referring to token concatenation being the problem (which is fine when
>> the results are enumerators), when really the issue is with the result of
>> the concatenation wanting to be expanded to a literal number.
>>
>> Then again - do CPUID_BITFIELD_<n> really need to be named that way?
>> Couldn't they equally well be CPUID_BITFIELD_1d, CPUID_BITFIELD_e1c, and
>> alike, thus removing the need for intermediate macro expansion?
> 
> gen-cpuid.py doesn't know the short names; only Xen does, which is why
> the expansion needs to know the name->word mapping.
> 
> I suppose this can be fixed, but it will require more magic comments and
> more parsing to achieve.

Okay, let's leave this entire aspect aside for now. It started from a
not-to-be-committed remark only anyway.

Jan

