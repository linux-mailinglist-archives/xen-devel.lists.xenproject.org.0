Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46472705030
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 16:06:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535217.832878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyvJm-0006OB-2H; Tue, 16 May 2023 14:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535217.832878; Tue, 16 May 2023 14:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyvJl-0006LC-Tb; Tue, 16 May 2023 14:06:21 +0000
Received: by outflank-mailman (input) for mailman id 535217;
 Tue, 16 May 2023 14:06:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pyvJk-0006L6-Hf
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 14:06:20 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3e4237c-f3f2-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 16:06:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7918.eurprd04.prod.outlook.com (2603:10a6:102:c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 14:06:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 14:06:16 +0000
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
X-Inumbo-ID: d3e4237c-f3f2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTmgq401PzgnvLSjHBo7HqQWs4AEALdvu4kGSNEGEntzXwt5o8v8Ye36c+nn8MfPwBhyjcDowL6UFfLEon9qtAjbyyDw1S5ySmgNPgz7VMh6kRPdTRaODfbcSmbCm7iaOPEQEguemHoh7FNnxxJGTx718E55aexNOwEhExV/s1upgzyN7u0zy7om93cQUfzRzU1itrnlqrBYf4v0K3Mto6p2nQM4Wk/M/hC6/p+iPMVPpN4K+USvV7H8EgTZcbw64U+8YcJjUhZeNjQaG79vxLTDSkTUqiDEEnlrLnKKknSCjWleh/SOsUhWGtoZD/s052g5Kj9/G4AT9XO3a0Lyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gL+cwAeZ+SJaQComw1l1OSjLzrSEIlC/Xi0oA8oOze8=;
 b=aabXWZnmUWwnFbdRHjJYztCQKsIYWqMyMvggCSf3+ejpGnQUIJ0BF1VGSV+Rzp4wF7oSKz/25+ZCkvfFFOAMdbN5vhntByAKxIqtIGiST8ltlmCYgK3dRIGI9auQ1zHOldzt0UUN+es1gHGrNSS+37w0kqe1XCDo1HIXBGM7Cj6YFVev26O3XardF0RejaRxB3GBzwcU+ZLpRNoMpP6tjkUrcaXJNQhPK4pCTxW5yxE5gxzUNESNETRPYxFw5A78Xn3yH0K2zGM2UwjijbTrOrA63FpPbeIxLMtyyyFNmlaBAHmaOFnXjzP1FnzqxNHxIaBgcYqRwKYlAbV9NQAteA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gL+cwAeZ+SJaQComw1l1OSjLzrSEIlC/Xi0oA8oOze8=;
 b=zw4ZGuWo0D+jtj8gyTD+uvQPS7TU26MOV8QFPgdpSWjqhQ8tNzEeKtzc9PuzAIurQBd/fHDFzcBaqnxEhMlJbrztx9yzABpK4qAnyDvMU7HckfLkaFT2DpjCvZcrjs3rbytsfl0nNnr38pHA/++0frbVNTgb45DeQFAIrtWlESoiKQnFfPOstOBOp56W9tY/O/b4z/BFS+BeoB64v1736mXsc0w8M1t4o0JVQm+GYAOxK5VvjBYFAjOuu8WJ9ONPxsJb/my4BIxX6GLIU0eBHU4vOY0HKFjKV+ZXJv2Yw0JkGdTxhCL6DzmpeQO4BCFLW7Anp3SpFoA4Y3qydA9G6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1bef2b0e-04e8-2ca0-cf03-f61cdae484a9@suse.com>
Date: Tue, 16 May 2023 16:06:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 6/6] x86/boot: Expose MSR_ARCH_CAPS data in guest max
 policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-7-andrew.cooper3@citrix.com>
 <a545a6c9-db48-9d91-c23b-59ea97def769@suse.com>
 <25421dbc-5889-a33c-37dd-d82476d56ce4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <25421dbc-5889-a33c-37dd-d82476d56ce4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c53c36-6352-4a9b-5d5c-08db5616b6be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gs7bkkZGtpe0dvUjgjGyeznaUcA9rVfbQkOtcgp5tI2aozvNGhbzwVmSOqA3irFj1C8ZIqTtNZ/+1ii3eph2GjVeTpx9D+XJOThq1YCpQ90VLyJRjwYSZTC9itYXQrH3BaVw8DmiEIwHCJPUdMo2Ifees0JsL1IcMZHzehKGiTzRklUVPzkALkQogq2R/Bok4W7nEFJLBSzV/fAXRpnIN7tqOxG940BEfVh2dDTyJNGhykuHXwkG9bXU+oJ2jlnE7XnjJzWn5ZaRmlz59an64catxtEWhhwRViun/Q3RKu8UrUNFCpFYZuf8VrlBA3Y59Q7zqaUAiF/L/lUZrUuvHEFkgIHZv8immtBD1mCjwMWs1nL+eagrl2mZ5Dssqste2iCKRpgjyvmjDGU9I+PQK4dxjy5H/rLVQLIC4F9xeK2TCFS9SdXdUZdqYEVgdg6oRE2SHxNwD9Zr31gi1R61gqn7JpqKyXckCs2JctV9sxsX8KspAQohBC8i+AG7qU7pUQYMEmQ2xKZuhKaLDPkAJlmDkQKIxU8amx/vsGBp8KxMif0CjBeXulRjr10a0JAdJsqIMklSjK8QMkiPadOv0clCEAGDX6aW/51XhajoHTVkl476FraSmlQ4tcYbh/HB9miglLb6PBH7cbAsTNpB3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(66556008)(66476007)(54906003)(6916009)(4326008)(478600001)(66946007)(6486002)(316002)(8676002)(8936002)(41300700001)(31696002)(2906002)(5660300002)(26005)(86362001)(2616005)(83380400001)(6512007)(186003)(53546011)(6506007)(38100700002)(36756003)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0NaMHRGVC9TL1p3eXZyWWgvOUdRSEJKdE43ODh0ZGVYK3h5RFRsK1JCcDJH?=
 =?utf-8?B?NzN0a1FyWWxlMTh3eTlvVCtkSkFCdUgwbFpObjVXRks1NGxDaDk2VWFUNXhU?=
 =?utf-8?B?QWpiVWcvYlM1QVlTcVkyRXRhY1pPT09jOENXS0h1SUJ3MUQ4WVUvaWdldkoz?=
 =?utf-8?B?T1BOMVhzaDEwc0lOdjUzVjhtQ3B5aDk1V2lQZkRnTUZDTXAwNW13SGxmcjhX?=
 =?utf-8?B?VmlKWFBLd3RRdllWQk9GSEJSUzNkRFBXT3doemtNMVRkczkyNzJJajBTMTU5?=
 =?utf-8?B?NEs2QlJVcnAyczIxU3hlbGJmTjYzUkR0QUdieDFFbE0wQlByaEJMdTRXZjBJ?=
 =?utf-8?B?UzJFdTVyUlNmTGdmTTdSeGJhRC8zTG5LbXVHTFFHWldqc3lOMEVjU2RhQ0FB?=
 =?utf-8?B?QlNtSEhlbDFmSFg3bXBCa0Q2VFFDZ215RzJTTzNXVjJjZms2MHFEcXZsWkRY?=
 =?utf-8?B?N1dpYnlOdUlPN2NvV0ZmM2Y3aXEyWStnZTJBU2lHaGdjY3lqMG5rWnhRbDJO?=
 =?utf-8?B?Y0hPczJQQjg2MEJkQmdPTDhyY1dPV0F3KzZ6bzFROHIwTEs1TDdkb3RUS3RP?=
 =?utf-8?B?aVFLZy81UTEwOEs1QjA1RFBucHV3cXhScVFUN09YK3FNRExOK1h4REVxK0Vi?=
 =?utf-8?B?M1dTWTRjemYwa0RhWm1EdHpKTm1MbkxOUVJ2cjFMSUprK3RmSzBHWExDMGJl?=
 =?utf-8?B?Nzc2ZTJpcnFnMTZybm5wRlVhOHNHUUVLYU1aMDA5OCtXMmhCMWMzcmxJVVdS?=
 =?utf-8?B?d2MxY0JDQmxKanQ1SnE1Vkwydm5IejNqekJEcytxSlV2ZStkNWNrNDRwWE9T?=
 =?utf-8?B?Y0VTYllOU1F3bjkrZjQ5MENqQ3dQbXR4TFJnWnRWRjJ2VWplWjNOais2VkdZ?=
 =?utf-8?B?M3dzKzlObktHcEhRUkM4d0Vyc3NPRXVkSVNNRjNIWld0bE9uRmVvVnRUZENI?=
 =?utf-8?B?OVIrLzBjbnZabGwvd0h5UEp2UzFOYzdaUFhUUDI5Wk8vM0NWT0ZoeldhYmtx?=
 =?utf-8?B?T3JyMG5sUU5uT0VqZnNmb0xpeGtWUlBnWHlaL3dlN0M1NlFPL0M0YUZTWm9O?=
 =?utf-8?B?dE1QUFlkMll5UStKeHlEU3dqanlUYWZSZXBpU2xDdktMci9lQkl0eGNvUjU4?=
 =?utf-8?B?UU9ObWE2UmprckxrUnZwdm02SlVjNm93K0lIV05TU2pZdTcrR3lpZ0Yxcjk3?=
 =?utf-8?B?SFlSL01ka2J1R2lud2tFZ1BuWUNPMXdudW5aQnRrbXE2MlBkUVJubzl4QXlM?=
 =?utf-8?B?Y0YremlJd0VQQnU2ZTJ0dkhEQjRPNDB5RVVoMXBUTS9vZ0RTQnY0dXcvRmI3?=
 =?utf-8?B?N1g3KytWaE5jYUJCUEJ4WmtwZVEzRjhVVnF1TEMyZUFFY1RCeGVCQUp2bmRq?=
 =?utf-8?B?N3VST0V5eVRKY05CVFo5QXlidnlMTGdtT2paRlp2R1ZFZmdweFMyK1ZTckd4?=
 =?utf-8?B?Vy9CdHlseGtVNWMvUnVOWWhja3pBZ3ZUdlBWR0ZSNkViUmxqcFZtU0ZSak16?=
 =?utf-8?B?ektTeXlmYXZIVFF2RUxMaXVSL2V2VFlzZlNxaXBaSkM2THM2ckNmb1FQa041?=
 =?utf-8?B?bDd5REJTaHRtalFJaGZOTEVQTGhlNTBtNmJoS2paNnBQSjNYOW53andLRmNx?=
 =?utf-8?B?a1FJczJvVm9mRmZMbEhQbWlGVG15bzBZV2NUYjEzdTdpNVFBdmx3UlZGV0NL?=
 =?utf-8?B?SFdkRE5sMVk5SW9JRHpLUXF3ZS9CK2hFZ2RZdE44VVZFRkJpaWNyM2xUTGtw?=
 =?utf-8?B?TkJ0WGlCNkg5VlI3aElCVnJ5Wmpza3R5aTNMODJRY2QrZ1hYbU5BL3lDbzd3?=
 =?utf-8?B?OHJYUjRSbE5wT0g1NWV4SzFwQzc2U1h5NlZvcFUreTV2YVNGbGZYdDhHUlF5?=
 =?utf-8?B?cEVvb0E2aUUxb3BwdmVTUnlMaEYyUStJdHJJU3JhN0dtMnoyc1hyc1ZudHRE?=
 =?utf-8?B?eVpVWDlIZHB3RG1NaVJ1QkFadlJnSVJZL2h5Wit1ZGczV2FiUnZ1dWNHNHVC?=
 =?utf-8?B?VG9DTmM2bDI5UXRmL2lmdDgxQzJJRUVhVVE0U0VsWVRwSHhCRWJLZFM2UFNm?=
 =?utf-8?B?OVdGMFZjeGlRQ1lrVmsrdVJkUUZQeWQ3MHo0SVZSQkFFMWgwazBiWW4vQWpj?=
 =?utf-8?Q?hmVqZy2eGqKeMcZ2t83vNrsKs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c53c36-6352-4a9b-5d5c-08db5616b6be
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:06:16.0714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0pEduz3pjQ+ovBh6emLT23HbhKg1k4LpRM8NHNovIfSQMMDxhmh1nwk0pbZsmrpcSrvg6DPbmPZ70tHE+2hFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7918

On 16.05.2023 15:51, Andrew Cooper wrote:
> On 16/05/2023 2:06 pm, Jan Beulich wrote:
>> On 15.05.2023 16:42, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu-policy.c
>>> +++ b/xen/arch/x86/cpu-policy.c
>>> @@ -408,6 +408,25 @@ static void __init calculate_host_policy(void)
>>>      p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
>>>  }
>>>  
>>> +static void __init guest_common_max_feature_adjustments(uint32_t *fs)
>>> +{
>>> +    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
>>> +    {
>>> +        /*
>>> +         * MSR_ARCH_CAPS is just feature data, and we can offer it to guests
>>> +         * unconditionally, although limit it to Intel systems as it is highly
>>> +         * uarch-specific.
>>> +         *
>>> +         * In particular, the RSBA and RRSBA bits mean "you might migrate to a
>>> +         * system where RSB underflow uses alternative predictors (a.k.a
>>> +         * Retpoline not safe)", so these need to be visible to a guest in all
>>> +         * cases, even when it's only some other server in the pool which
>>> +         * suffers the identified behaviour.
>>> +         */
>>> +        __set_bit(X86_FEATURE_ARCH_CAPS, fs);
>>> +    }
>>> +}
>> The comment reads as if it wasn't applying to "max" only, but rather to
>> "default". Reading this I'm therefore now (and perhaps even more so in
>> the future, when coming across it) wondering whether it's misplaced, or
>> and hence whether the commented code is also misplaced and/or wrong.
> 
> On migrate-in, we (well - toolstacks that understand multiple hosts)
> check the cpu policy the VM saw against the appropriate PV/HVM max
> policy to determine whether it can safely run.
> 
> So this is very intentionally for the max policy.  We need (I think -
> still pending an clarification from Intel because there's pending work
> still not published) to set RSBA unconditionally, and RRSBA conditional
> on EIBRS being available, in max even on pre-Skylake hardware such that
> we can migrate-in a VM which previously ran on Skylake or later hardware.
> 
> Activating this by default for VMs is just a case of swapping the CPUID
> ARCH_CAPS bit from 'a' to 'A', without any adjustment to this logic.

Hmm, I see. Not very intuitive, but I think I follow.

>> Further is even just non-default exposure of all the various bits okay
>> to other than Dom0? IOW is there indeed no further adjustment necessary
>> to guest_rdmsr()?

With your reply further down also sufficiently clarifying things for
me (in particular pointing the one oversight of mine), the question
above is the sole part remaining before I'd be okay giving my R-b here.

Jan

>>> @@ -828,7 +845,10 @@ void __init init_dom0_cpuid_policy(struct domain *d)
>>>       * domain policy logic gains a better understanding of MSRs.
>>>       */
>>>      if ( is_hardware_domain(d) && cpu_has_arch_caps )
>>> +    {
>>>          p->feat.arch_caps = true;
>>> +        p->arch_caps.raw = host_cpu_policy.arch_caps.raw;
>>> +    }
>> Doesn't this expose all the bits, irrespective of their exposure
>> annotations in the public header?
> 
> No, because of ...
> 
>>  I.e. even more than just the two
>> bits that become 'A' in patch 4, but weren't ...
>>
>>> @@ -858,20 +878,6 @@ void __init init_dom0_cpuid_policy(struct domain *d)
>>>          p->platform_info.cpuid_faulting = false;
>>>  
>>>      recalculate_cpuid_policy(d);
> 
> ... this recalculate_cpuid_policy() (which was moved in patch 1), which
> applies the appropriate pv/hvm max mask over the inherited bits.
> 
> 
> More generally, this is how *all* opting-into-non-default features needs
> to work when it's more than just turning on a single feature bit.  It's
> also why doing full-policy levelling in the toolstack is much harder
> than it appears on paper.
> 
> All domains get the default policy, so zero out all non-default
> information.  It has to be recovered from somewhere.  Generally that
> would be the appropriate max policy, but the host policy here is fine
> because there's nothing to do other than applying the appropriate max mask.
> 
> When arch-caps becomes default, the full block feeding arch caps back
> into dom0 will be dropped, but there's still a lot of work to do first.
> 
> ~Andrew


