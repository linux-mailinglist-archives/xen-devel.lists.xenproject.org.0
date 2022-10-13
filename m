Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0FE5FDC7B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 16:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422241.668127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oizQe-0003H0-Mu; Thu, 13 Oct 2022 14:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422241.668127; Thu, 13 Oct 2022 14:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oizQe-0003Em-Io; Thu, 13 Oct 2022 14:43:20 +0000
Received: by outflank-mailman (input) for mailman id 422241;
 Thu, 13 Oct 2022 14:43:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0LZ=2O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oizQd-0003Eg-NX
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 14:43:19 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2045.outbound.protection.outlook.com [40.107.249.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60041091-4b05-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 16:43:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7277.eurprd04.prod.outlook.com (2603:10a6:800:1b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 14:43:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 14:43:16 +0000
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
X-Inumbo-ID: 60041091-4b05-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B++1GW0yvL1nbw0v4lJcmRBdpjDdeLAzgRe+w3kN0r+S4qieg+SFybG/htdi8qHi3kAFQ3JTuquJKuNCo8qBvWGS7dQizBQBteiK12DJWSaDg169KfFLqS6Mc+JVoTCpn0F0oArKMo8qKkBZOpa48UtaJzoxiJaZc0ZInxo7bo+/bteoV8Bcj3YTNVamGJgx7Yzx+4ElIsA0fYsItCCNockp1SrLPJiT4IEQiJ+AX/9bS7k2A070t8XFqM5MOGbDgaPQNOSx8kK5cSnD0mSpoxnVlwEC+4F0D797FVN3NX2fkBIq9HybWwOgM7WGzOqHQ8W6iPp2k67xobIJmxcOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hq+G0iSYkV+qrVAVCsOyKXcfo+N7nJBx4VPKuCQI7D4=;
 b=lNpPcqxbGvNEmSzc+1p5QM0wAjXM9VejGbzpVgugpEDoqtgAQkcXbYax8lU7WpHlp6NkwKJI546ZWk/BKw4rsMq5Y1YqSdB3lOehN5E5t/+j/p3pRkJLLO5g+5bYbQQ+MeeMmEI1WCaeN6hST9YrI/9R66IZUXyaSJUnpc11n1PHsuNSSaL9d9rtMkh0gDg4LpiEBu0xNJGA6YIUv3B+LD6P8s6rZsiUp0b9i2kbywxOJvXB7bdYvcmdwB2L0f4bRmPFDukhB1MWDaJCa1Mh+a3cJ6UfUUdNNOjpJ0Fs/9Mg5vobUhf0+f+OM5pNWmpr2wjxwqn4N1Innp/QJeTjrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hq+G0iSYkV+qrVAVCsOyKXcfo+N7nJBx4VPKuCQI7D4=;
 b=wz97EVmZardeukdOnenVCIT2ug2WD3VkKGMKSb1XodGTuUUsq2PtXLBkxzN5moeAn8I1/TIKBmcmqa2nmjWgLxPcQaoWtTza9pj0TZNxTGIJq4dB7aU8LqqTCbS4BDuYAVU4VUWyL9OREjS46+oXI3wsGOLzoJOKIAB9Me0nbfytaMJKDeJWjFxj7XRaLX6UIrf3fh6WOaIZvmg4qwWY7vD6G+1BT158yGs60C1lEUQvzVmnhliXe/4FjLq+8YSpOvytK1pZP8dSG3Nk+4I4/VNFKgiUcL1f7ASZmMP9weJDJQ/mdZJO6XX7cXKamKN1sTIpDTPPQfzG7BVQQ+Ihpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bcb70302-cc88-0867-9920-2567dad96dce@suse.com>
Date: Thu, 13 Oct 2022 16:43:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 4/4] amd/virt_ssbd: add to max HVM policy when SSB_NO is
 available
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221011160245.56735-1-roger.pau@citrix.com>
 <20221011160245.56735-5-roger.pau@citrix.com>
 <1f70c472-1b62-7c79-dc31-65fca8040cfa@suse.com>
 <Y0gbfCi5kp2qBxuv@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y0gbfCi5kp2qBxuv@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c81409c-de46-4868-3347-08daad29437d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r6oRAuCCJCpXAegcib5vNPmQIih1xl9GkkqbFun6FDyVKpVXYD0QgyS1PzKv8gsKdM2xFsyx0ys/Az/WQ5YcCnGNhhNChKpXo0wOicNO0KBtBKmy05YSPc4+7YQYJBBNg6AopXSu3dFY3BL4jJzbAFdcVxLpqtVFEVG2E22QZKZaT//Gfw1ktmsribuZWEUX5QCfCHkb47PhX0pAZFRoB56aIVBKv8fchrC9r2Vo8VjPU9UD5hCFXSSk7XAnwYKPfjaIQ6O/4YG6FdHnUrqy5ns8YLhxTIW8ePmDenXiFhzmpastQSkW2zjXGqafrvLocAN+o/YHo+DzVftnNdbfd9MYUNUVD8C7YRhNKofvSwRHA/c4Tvt5coZpZTrPnCZcRYXh+GYIlL8RDSIc3j9l7EZ/rsp3MZOnAok2+gr3GxiRy2k/ALHiFkamARRJ27OKmaUoChIv68Ln5yvz5Yg5vhx1FDn+Nv3XGU3LQgb/9jUd8nhBzYtKz3ZjBILJNRlugCfoLur+2pyJHFMHJUFrDo5jwKKVlntFacy7oWQT1iMUxpeotQv8E41ccveWYfzQw/V1KPDynQP48QwV0tr5RCwUcKb2PyVwCRd4uapf9fQ+skXc3CuvqZlnwW8mDU9pVbF7pSRvbschbHloCtWUa0Jn7WjSXtNi/RycKnrqyTwld40AAMvBV8JE49W3cZ2pxIF/sLH/8N/ZNGuKJUACX30vzCvmpeih3IfxAwNFZlKKevAjACTcuG6fRMi3bnvc5Bp9plre2sb0nI4FkV6wUfQL2DI/BIGNVA7J25Qs2Ok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(346002)(396003)(376002)(136003)(366004)(451199015)(38100700002)(5660300002)(31686004)(53546011)(6486002)(478600001)(4326008)(8676002)(66946007)(54906003)(316002)(6916009)(66476007)(66556008)(6506007)(26005)(41300700001)(86362001)(186003)(6512007)(2906002)(8936002)(2616005)(31696002)(36756003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVoycnBuaGl6TXdGaW9UdFpUZm9FSm4vcHRhZEFMSGhFc2hLWWo1SDBKSXlv?=
 =?utf-8?B?Q0M1amhiaDBEamF0dXIwNS81VHJlR2drUTQ2NzRNVFJqTlh6MnhRWkwwdm4y?=
 =?utf-8?B?Q2ZqcktCc2ZDVVZTVmFsaU9uMVllcld1M3pWcWIwOFI5WTgvYWdPT3R0ek5G?=
 =?utf-8?B?VmpmQU4waW5PTjMyenM4WDdKOVB2Y3VoL1JLYXRMRUdsUHBSUk5SSkVyQ2lW?=
 =?utf-8?B?bXZIQVNWUTRZbXRzNWxwclo1VFI0VmhjU3ZuZ1p3Wlc2Szhsd0pDQnQ3L2pk?=
 =?utf-8?B?WFpGN0JEajlLa056KzR4TDBZQzV3SStzRWY2dHBoVEhyOWxhT2Y5OERJTzBW?=
 =?utf-8?B?eGhHL0xkWTZNdmE4T08zOU8xbDMxQmJDSTRmNlJWR3M1TnU2WHd3eUVjRXhC?=
 =?utf-8?B?TnUxYUNyejRoSDBaTkRIeHdlRE9Ka1NONGVIMDYzMkJmZHBLR1lrY2RLcGND?=
 =?utf-8?B?NjZSMUI3TkhjK0xZSjhyMkFvdGZZQ2Jyd2w4dzkydWFQYUFBWUR4RVRHdFZY?=
 =?utf-8?B?dzJvR2xqNkZHdmhaNDlZRVZGNW5mbzJLTVJIajZsWnd3bEVWVEJSMlNFRHkr?=
 =?utf-8?B?clY4OUREZ1pjYXB0S3Q3bW5ydGlsL0hwNmJEZ3FpbUhZcVk3L0paUDZDN21p?=
 =?utf-8?B?OGZBUUJoNWM3b3UyTUxDaDVpQnZ4VW9FMk5TMFU5eVVTK0JIY1FCV2x5b2RU?=
 =?utf-8?B?L1Z1eGJPSW1sb0hxYWtpRUZDeG1DNE0zdTE3WG94NzYweFVWa1dLL3FkV0dO?=
 =?utf-8?B?aE82eWRmSkhtWCtrWFBJdmd4UDZTcWx2SkdOVkxlbXBBbGFad3lpWFQxTGlt?=
 =?utf-8?B?akE3NDdROXlDYXZhMzFBZm5iTlMwWTg3bjEzeHFMQVJrNmhNSE5lYmRIRk1s?=
 =?utf-8?B?Mi8rZVcyOWdpdHV1d09Ud1JIcThXTDJPZ2I2NDU4ZmVTaVk2alU0S096a0xD?=
 =?utf-8?B?MkZ4cXJLcE1Zd1hsNUgzRm96WmU5aXZXNWFMTUZYM3BrdDdjSk94a1ZmV2FQ?=
 =?utf-8?B?NTBJaWdYUDRRRGxkN05sWjRyQldvamNKQ2hnTnAzNmtrbjkwS0pyK3h3Zm9B?=
 =?utf-8?B?R0YyaWFkUTdyQi84NmZab2Z2Q1owdVNqYitPN05kZWVvUWQ1Vm1EMkc3QXhI?=
 =?utf-8?B?eWhlZGZ5L3hXOGk1MWZqK1IzbXJnWk10ZzcvS1lqdjU0T2h5dVV1M2o4YUp6?=
 =?utf-8?B?TmJjNjM2NmVXM2Nhbk15NE1icCtXZ0wwWkswLy80QTFDV3lPeWU1K3JTMUI5?=
 =?utf-8?B?bllHRXozMjhVZDZaU2RmVGZnaXdSY0hCeUxWbkh1dTRLYUlRby9YeU5VSEQx?=
 =?utf-8?B?WHJvUlR5YXpLTUdWSlJsZW9KSFhLQlZITGRRR0poMlpMcVB0ZnV4NDRGNXYw?=
 =?utf-8?B?NkJodGhwbkFWa3Y0U1RGRldYOSsxV2Q3amVSTWtUVXQwUThtcjJJZ01kS3pQ?=
 =?utf-8?B?Y3Z0Zy9hRUxxK21LWHkrZFRmVGFjNWRSYmt4K0EvYmVGNlBvaysvcVAzZkJ2?=
 =?utf-8?B?Wms4RnFLNkpDZllxdVBkZzUwTlR6RGxKamR3U0dNYUdHWGVBMFhPKzlhSmFV?=
 =?utf-8?B?SVIxbVJqY2JRMlEwZm8xZFNhN3JqZ1lUTXUxei9qKytDdTZZMzlHZDFBZzRw?=
 =?utf-8?B?R2tTMjR3cEd4Rkg5b2N2UHE1SHd1QjNmbzNQbkNxS25vOXZXUVh0WXFXSU9Q?=
 =?utf-8?B?dTVSZjJjVm9VL0kwWTgvTkJ0N0FvR3NVZERLSTJGcHdlay9xZkF0bU5kZHJ6?=
 =?utf-8?B?dEEyWjBYN3NZVit2V3QvdUVRc0xTNmNoakl4ZFZjT0pRQzgxb2k3R1FXYUJU?=
 =?utf-8?B?OHhxWkpBajU1L1ZwV3VsMlRhWjJzdkdab1hGcW1LRFZuOGFFdzltbmlQUHUx?=
 =?utf-8?B?RWFsUVUxRGdod0xXWFBQNFdZQnUwL3VvQzRxcmJLMG94amZneHM1dldjNVg5?=
 =?utf-8?B?VFpZeGg0MGVIRUxzRUs0bzZPSHJlUG1vVzk1NFhGdFhzYlE5MEl2MStBcjlU?=
 =?utf-8?B?K2VDQ0FDZ3I1N0tadStpS0FQYWZrb28vUU5oakhmeU9IbnJuWUJ4TWd6cXpp?=
 =?utf-8?B?OE4yb3FlRTg5YnZvME55SkUyWHUvcWE5WElwUWxoMXNEYWtzNk9CZSsxNWI2?=
 =?utf-8?Q?m9FHXfNmxYHmwmylMlNit6D1B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c81409c-de46-4868-3347-08daad29437d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 14:43:16.4983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9ANqUSF3Wu1psaHHtOdKQfX1emHy+epeFtPKkcLCrpDD6Z7Nl5flOu6qPWgtt8L2Et6Zo1lMH9g2q3QuqpEfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7277

On 13.10.2022 16:06, Roger Pau Monné wrote:
> On Wed, Oct 12, 2022 at 10:36:57AM +0200, Jan Beulich wrote:
>> On 11.10.2022 18:02, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/cpu/amd.c
>>> +++ b/xen/arch/x86/cpu/amd.c
>>> @@ -814,7 +814,9 @@ void amd_set_ssbd(bool enable)
>>>  		wrmsr(MSR_VIRT_SPEC_CTRL, enable ? SPEC_CTRL_SSBD : 0, 0);
>>>  	else if ( amd_legacy_ssbd )
>>>  		core_set_legacy_ssbd(enable);
>>> -	else
>>> +	else if ( cpu_has_ssb_no ) {
>>
>> Nit: While already an issue in patch 1, it is actually the combination
>> of inner blanks and brace placement which made me spot the style issue
>> here.
> 
> Oh, indeed, extra spaces.
> 
>>> +		/* Nothing to do. */
>>
>> How is the late placement here in line with ...
>>
>>> --- a/xen/arch/x86/cpuid.c
>>> +++ b/xen/arch/x86/cpuid.c
>>> @@ -558,11 +558,16 @@ static void __init calculate_hvm_max_policy(void)
>>>          __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
>>>          __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
>>>      }
>>> -    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) )
>>> +    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) ||
>>> +              boot_cpu_has(X86_FEATURE_SSB_NO) )
>>>          /*
>>>           * If SPEC_CTRL.SSBD is available VIRT_SPEC_CTRL.SSBD can be exposed
>>>           * and implemented using the former. Expose in the max policy only as
>>>           * the preference is for guests to use SPEC_CTRL.SSBD if available.
>>> +         *
>>> +         * Allow VIRT_SSBD in the max policy if SSB_NO is exposed for migration
>>> +         * compatibility reasons.  If SSB_NO is present setting
>>> +         * VIRT_SPEC_CTRL.SSBD is a no-op.
>>>           */
>>>          __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
>>
>> ... this comment addition talking about "no-op"?
> 
> We need the empty `else if ...` body in order to avoid hitting the
> ASSERT, but a guest setting VIRT_SPEC_CTRl.SSBD on a system that has
> SSB_NO will not result in any setting being propagated to the
> hardware.  I can make that clearer.

I guess my question was more towards: Shouldn't that check in
amd_set_ssbd() move ahead?

As an aside I notice you use cpu_has_ssb_no there but not here. I
might guess this is because of the adjacent existing
boot_cpu_has(), but it still strikes me as a little odd (as in:
undue open-coding).

Jan

