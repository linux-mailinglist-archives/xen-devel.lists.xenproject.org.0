Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C089C5B8185
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 08:36:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406768.649135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYM0K-0000tG-5V; Wed, 14 Sep 2022 06:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406768.649135; Wed, 14 Sep 2022 06:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYM0K-0000qu-2g; Wed, 14 Sep 2022 06:36:12 +0000
Received: by outflank-mailman (input) for mailman id 406768;
 Wed, 14 Sep 2022 06:36:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYM0I-0000qo-N4
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 06:36:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8238a1ca-33f7-11ed-9761-273f2230c3a0;
 Wed, 14 Sep 2022 08:36:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9056.eurprd04.prod.outlook.com (2603:10a6:150:1f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Wed, 14 Sep
 2022 06:36:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 06:36:04 +0000
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
X-Inumbo-ID: 8238a1ca-33f7-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiVXfZTxJ0mLOmrWlEhA9DwainaDbclgwpx3XMs976KLC85JrprKOaD5VA6JIREQnd2BRy1RrRUmDTwFE27Haw6NPfi40Bd2URcn7vuQ3/lf4w01rjO8o8bmSMh1YPmiIopTZ6L0G7XBLCzJpxhNgwEvdztNRmLCLh1AfNF7nxbGG/8vV31KpThGu5TolnGSlVEZfXxjJrcRfdp4zSu/qNoytLbzaG7uYJP1/mwBBJzNXLTevesYnsf2gqY1Tf/sCVKEPpMH2THEoZi7R9kVyl0TCsFbp6lXFzrDpz0xRXkT9wLM7IMHjAog5yZKmF4dPYZMMOrE8AjfoDhoPd5X5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8zMGW22NDvpi1glwglzXZuSQ6YwiL37WMVMl2GTCPk=;
 b=UbHjm+8mLu6y6ujQFdPdjN3R5G6YRShBi3zsOSuTHLt17t4AyIZnoJ45PBz02haaW7umRmZrTzxJ5sAm1tcRFJ5o3oIex7JRMUHhqlSgjG0VN56jXHs0oncMiVnCbg7Nxry0p4b+9zcM9X4PRSExEKfB5rXytAnXFDXQIpvUSIq2hU2KJwVeSRRgIhSDGMG1VJzXFP3TNmClfpSQU3zxwqx5BRA0x7xgNSCSh1hvkI5mNSwWOm4vlwfkGsiLJ8wLNgFRt5ChcNYd//gnNHZ2PklbSJvXDzRar/SU4jBPfYBSEUKZLEXsoZCxEGesqlk+CpowrjevrDAPzvzxsi6NrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8zMGW22NDvpi1glwglzXZuSQ6YwiL37WMVMl2GTCPk=;
 b=CARlDPpw6fGTEh0BUMYhi1eaQkGHFNOSrZ9eCt2F/M9PjpGWsVTO1ZEGqiOngvm0dFuXN79zBq9sKIf6EIn8hYUcB2/aHwqvV5YxhpWqJ4Xiv/SuNVzYMe32S24nl4VAB5DTBNhUDZcMsQALMCv/4a5b3h7o1hUTFfpqU+CIikWLIxtNNoI17QeF5jgA9qIc6d05F2676EqNXDY6juAjIKi+40pkfOSDEN1wQ+Lg3CX9y2k2RDG7tGT8SldiOf+oc8u60wnLJIm11cv4IumGe223KLBUK+TQkr4TgnmntBB2zilPNR0FWgY5TUSjanjD+JksbKoGGP/OIc1wTns1qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <61f083c8-34c7-563b-b010-8d8d0286da6a@suse.com>
Date: Wed, 14 Sep 2022 08:36:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Setting constant-time mode CPU flag
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <YxFk2GaIQVCAFsyi@itl-email>
 <1d7b9e30-975b-b49f-fe09-e2aeda9e2af6@suse.com>
 <1b85702f-7efd-b13f-40d4-615750e20f4c@citrix.com>
 <YyCSIxyH4hDmTXIh@itl-email> <037151d0-0920-5d99-9932-df044729c00a@suse.com>
 <YyC8PMxsQyRp07vW@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YyC8PMxsQyRp07vW@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0264.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9056:EE_
X-MS-Office365-Filtering-Correlation-Id: bc7bcfcd-657b-4ac6-a517-08da961b6599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kkPCR2a38o8evTUKRDsHPBtxCUkTMfFn7LYkYQ7YQ2U/fbhh37GwhYMTeE9eR2u54B5ixoa8qUjuPQBM6b/9btmSbkK9dVfoZDNgnHo07RmbPvgJk0mJudoGFasZHb64SZReobeQ3MbRt8n45gQaU6Tdb4rFqSu6CaOSdQrDgtMQDtkCvFzS1Pg/XabSC8zPbSCSWabUti2T5i445HBZstabno3+qJsP84wI/r1PAdG3K9eVRdUDfADOIG6arwcqyozsV2LaWtjGVeT7v+0X7TP3nUV79kAuqMEBcXcv3v57GLzO8IeOX8N/A2TjMvnjXaBFmBqFFhUZfakTwM7UY1RK5U7LH7YY3hdBVemp393rYjNZEQfRNPoOxMDWh0RJrCQW27EF9c0FfBjXCQVvgkF1ewZWonIKOMcRBdj7haNdES9UP6Z9Vcx4YPV8pT74+YbHtudU/C0Qo/0oolD4w4bWJtSLy+0GJhT85vw57DIkII8tZkkPdW3s5bSxdpMR6Ky2704lYZUu2w5+UB3BF6Q+CbibbfcNUq7p8HoS5U+Z4yDhzHsgnurED2tBnWbKnqQ+0JkOCB7V1dTkGId3Ms/7j4BZJMnnFBF+Z88Z1wmiJgDYQoSDPgMpIJjxQh/8ZuKf8+vE6zn/F+E1LctSD2TB9Z++AK1tc5dN4i8bBg24+0TrLPW55aGh/HDZBH4bYEX1Cbuj2DiOPj+Rbs+MGGpaoPwzgVWiaNzyMMn2vm9ilyq3wIlvT2tHCKi2LGFTHQqVJqgpdnAbscVGbf1PHEM/uQNwOOc+vLYyJWpd680ZK+SwGrsPK5x/Mm6WoFD6gkmMmovqz/Kr/sZw4rl01A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199015)(53546011)(86362001)(966005)(66946007)(2616005)(83380400001)(5660300002)(6512007)(6506007)(316002)(4326008)(6916009)(54906003)(478600001)(26005)(8676002)(41300700001)(186003)(38100700002)(31696002)(31686004)(66476007)(8936002)(66556008)(36756003)(6486002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTA3ckVOQUlISVQ5b1prc24yb1VJWVpndzBvMHZvUFcyMjRLMkFiK3EvUEVZ?=
 =?utf-8?B?MVZheU1EUGFLQ0xxa0dJcWhrZUFCZlZMaFgvVTBqbDF0ZXRZZzAwWjIrZ250?=
 =?utf-8?B?Q1NNUkEvWU05czFzbS9NNSt6d3FGSTYxVHpkdHZRWTNDbFZVK0wvWXFVR2NE?=
 =?utf-8?B?d0VaZE81NDIvSkNKdUNyZDlYWTBPdlRlSWdJTWdQbGdwbUtFS2cvTDFkaEU1?=
 =?utf-8?B?MnJCNXZyK0M3N1VrWTkyRlNqUEVPZG9jNE93OUdaWlBWRTZETFRMeXc3N0VR?=
 =?utf-8?B?YVg0V25JUHNvNnJ0eTdDdWFDZlRrWENaV2xaL3o5anRpL01YWGdycXE1aCtK?=
 =?utf-8?B?TmZOam1wTktUTFVYS2J0aTc4TDhFd2FhWWdDWHBuZFBEOFhGdWR2dDJ6NE5G?=
 =?utf-8?B?WFFFdnN4dThhWkpuaVhjMVp1VGw5c3Q0WmlCWWIzQ2hHM2V1R1AwR3F6eEdn?=
 =?utf-8?B?QUNLUnkxQWhNNk1JdGx5NzJHbzF2dXBucGYrZmMrQytOb2d1bTA1RENDblpN?=
 =?utf-8?B?ZEx5amI5SXlGYmlmbW8wNnl5VmtEQ1RlaVRwRGZONDZ1NXMrUEt0cUhrWnFQ?=
 =?utf-8?B?S3lCSDNHeHVrOUxHNUhZNUIwdnoyVERGcnVYRExzckhkNFBVTzU3QWV1NllD?=
 =?utf-8?B?QnlwYW82b3ROK1EySTlxTGxhbk1JYlVtY1NiUEdtQytlNkExN2VuTENPTXNl?=
 =?utf-8?B?YVhTbUpCOWRJNnd4YnpzQkw3U3pRNytzR1NQWHFoaEFtK3hnUjF4ZjEzNVN0?=
 =?utf-8?B?bzA0bnVMc3FlL1luT0dxYzVSUHhSMzhYcjFsVmpWTW1jdi9uUUR3UjE4Y3Mz?=
 =?utf-8?B?aEE5aVZkaEI0KzFUVzBSSjZGL1MzS2FKSWJhbEpUMHo4VGdIYTVQTy9NK3Ru?=
 =?utf-8?B?cElUSm5VbTJDdGk4Mmt3ZzlMWW9IVko0MFhwbFVoK0dCTkdEWHVwdWptOU9Z?=
 =?utf-8?B?OHpNcThSekpxN2lHc0FDeW5ScGFJSnFTK1E3ZnJUWGdsbjVwRmZ5cFdZelF4?=
 =?utf-8?B?NDErNm1EeXg4SXFwWUNoSENkd2syUndRbVBmcGtvcHpYNFhMZmk0VFNwVEh5?=
 =?utf-8?B?Vjd0VkRRRkNSaTRkNjZUMTdsbS8yOUVabnZFak9PbTZGY0xIRkpHL0tHQUxt?=
 =?utf-8?B?bnQ5eHIrOG5mMjd5YThZaUhnR1hwZWdRa3lpWkU5Wkxhb3dVQ2JSNUdORUJN?=
 =?utf-8?B?ZUxSM0QzMW5rM3UxcEo4MW5BcjNTR1RVbHh3ckxhdHRRVStpNkx4dThrR0J2?=
 =?utf-8?B?dWZKaUw2MHZHTGV5SWpQZE5INCtvWE9wS294NFhZOTFWZHIxb3h1NFFMaldX?=
 =?utf-8?B?c3ZjK2VCdE9aUDhoN1pacHN3SlpKOTQ1bjZMZU5KWHUxdzNLclo4K290cTh2?=
 =?utf-8?B?R2xMM3pGdXZ0Ti80WkJzQ2dKZlViZ0NpR01ua205clJ0d3JsYnpHVWwySS9E?=
 =?utf-8?B?VEdBZTZsZjVvUjFrYTh1Q3BRZEFTeWRyUTJGWUZCYkswVlI2UHV3NnNYTW54?=
 =?utf-8?B?RE5mVFM4bHR5ZVBTUnF5TTNKRUhDd3VMZnEyUytEQWhieHNoL2xsYklpM0V4?=
 =?utf-8?B?NkdMeFhsMndZbDN2WW1KN2lKTlJTeEs3bmdENStSY1UxekhLbEM0UXZXam9p?=
 =?utf-8?B?N3h5SDRnYVVVbGo5VmJmbm03Tm0rckpnMDFmM3BKYnM2TGxKQmUvUjBEbmJR?=
 =?utf-8?B?eVpweXVLc3ZWWVp0NytkYUJuQm5oTWIwWW9ZamxqTUhVdHJmc3M0cStCNzNY?=
 =?utf-8?B?VVN5cUphNEJVNEYyN3daMExMd2Y4NUU1dzBZS0tMUGJDN1pzakE3WURxcnNu?=
 =?utf-8?B?bkVZZUU0UnlGZWYzYVFacEFXanZNM1ZHakxzOGQveDgvYks2YVhkV1lqREFz?=
 =?utf-8?B?QjJiY0VsZHlkTHpKelVjbGs3SGhuOXNSSEpianFOVXVPSzBGUkFGLytWTkpG?=
 =?utf-8?B?eThLdE9NYTY5Uy9NZUJ0MC84dDlTU1lXcDU1UC9YUkVRSCtIRDcwekxzY1Y0?=
 =?utf-8?B?Z2pNamdEMHIwd1NjNmhpaWdLb0dIdFBOOEx6YWhxbnMwT2tVaUt1SjVtUHR2?=
 =?utf-8?B?NFZMYTNzYlRMRUJ5TStCRVNiaDJRaGZDUURWSENKVWZHM2wrTldnZ3k5QS85?=
 =?utf-8?Q?zCGEz0BZDkLG+tVn434shHnj3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7bcfcd-657b-4ac6-a517-08da961b6599
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 06:36:04.0760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2+jaoHqwDAHvs681p6oyfiIjA61/IE+M8f+yHxtmyhsQ0yYKuwf7iBzZzuDBQKdja+Si6+Ip5s/3ulB/s1mhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9056

On 13.09.2022 19:22, Demi Marie Obenour wrote:
> On Tue, Sep 13, 2022 at 04:47:24PM +0200, Jan Beulich wrote:
>> On 13.09.2022 16:22, Demi Marie Obenour wrote:
>>> On Tue, Sep 06, 2022 at 10:01:00AM +0000, Andrew Cooper wrote:
>>>> On 06/09/2022 10:52, Jan Beulich wrote:
>>>>> On 02.09.2022 04:05, Demi Marie Obenour wrote:
>>>>>> On Intel chips (Ice Lake and later) and ARM64, a bit needs to be set in
>>>>>> a CPU register to enforce constant-time execution.  Linux plans to set
>>>>>> this bit by default; Xen should do the same.  See
>>>>>> https://lore.kernel.org/lkml/YwgCrqutxmX0W72r@gmail.com/T/ for details.
>>>>>> I recommend setting the bit unconditionally and ignoring guest attempts
>>>>>> to change it.
>>>>> I don't think we ought to set it by default; I can see reasons why kernels
>>>>> may want to set it by default (providing a way to turn it off). In Xen
>>>>> what I think we need is exposure of the bit to be guest-controllable.
>>>>
>>>> We absolutely should not have it set by default.  It's a substantial
>>>> overhead for something that is only applicable to code which otherwise
>>>> crafted to be constant-time.
>>>
>>> Either Xen needs to set the bit by default, or guests need to both know
>>> the bit needs to be set and be able set it.  Otherwise code that *is*
>>> intended to be constant-time has no way to protect itself.
>>>
>>>> As for why Xen doesn't enumerate/virtualise it, that's because
>>>> virtualising MSR_ARCH_CAPS for guests is still not working yet, so the
>>>> feature can't be enumerated yet even if we did support context switching it.
>>>
>>> Intel and ARM64 guarantee that CPUs that do not enumerate this flag
>>> behave as if it is set unconditionally.
>>
>> I'm not qualified to talk about the Arm side, but may I ask what you've
>> derived this statement from for Intel? The doc page referenced by the
>> link you did provide (still in context above) specifically further links
>> to a page listing instruction with data operand independent timing. All
>> other instructions, as I conclude, have variable timing unless the bit
>> in ARCH_CAPS enumerates DOITM and then the new MSR bit (of the same name)
>> is set.
> 
> My understanding is that only instructions in the constant-time subset
> are ever guaranteed to be constant time.

Hmm, yes, I did overlook respective wording in the doc.

>  On architectures where DOITM
> is not enumerated, this guarantee is unconditional.

I have to admit I'm suspicious of this "guarantee".

>  On architectures
> where DOITM is enumerated, this guarantee only holds when DOITM is set.
> Therefore, it is critical that on CPUs that enumerate DOITM, Xen does
> one of the following:
> 
> - Ensure that all vCPUs enumerate DOITM, and virtualize the DOITM MSR
>   bit for use by guests.
> 
> - Set DOITM by default.
> 
> Since Xen does not support virtualizing MSR_ARCH_CAPS, vCPUs cannot
> enumerate DOITM.  Therefore, the only secure option is to set DOITM by
> default, so that guests do not need to be aware of it.

I can see where you're coming from, but I also agree with Andrew that
the resulting loss of performance is a counter-indication to making
this the (universal) default. What I could see us doing is make this
both Kconfig and command line controllable.

Jan

