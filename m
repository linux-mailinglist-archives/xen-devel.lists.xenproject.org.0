Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1AD59D69F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 11:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391820.629801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQQC4-0006m1-57; Tue, 23 Aug 2022 09:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391820.629801; Tue, 23 Aug 2022 09:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQQC4-0006jE-1q; Tue, 23 Aug 2022 09:27:32 +0000
Received: by outflank-mailman (input) for mailman id 391820;
 Tue, 23 Aug 2022 09:27:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQQC3-0006j4-33
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 09:27:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80041.outbound.protection.outlook.com [40.107.8.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf1f4a83-22c5-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 11:27:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8843.eurprd04.prod.outlook.com (2603:10a6:20b:40a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.24; Tue, 23 Aug
 2022 09:27:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 09:27:28 +0000
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
X-Inumbo-ID: cf1f4a83-22c5-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMxdJmTiAeQwcV8MINO/6uf2blMjA1cLDJ1bC2izschZ0OwRShgt5xSJIzfXYQGSQhXkUrCsEVesQ5tbIcybRhzrVFRkicFp9sUaLS6n+4mrqfiSAPNENTA6uWzP82kaZn9e7tXMTUGSzWdYAmu99d+vqV6N5CLqKAQKfAIWK1kgh3hFYlpFVFCnsNExt4dY5y6y0xtNfRpThw9RmdXk4TGGoPilj4aC0GKtpw0MSmme2xRYGfdL5D7C5lNYpxpb2zFWrqGXlAbJbi7AX4UtRZRtTm5YlE+RXZNFawWW1x3QFo0cUiTXeNur81vle8mRsC9okKi86QeFi0VDo9PdAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KT/NClg/JrUHI5t63Tgchx2OHa9Vy1iB9q1xhQuHpaM=;
 b=dvV/pkQ95sYOxaQpn1FznnESCkdQMqig//1LOCItbwx4hn4rZ/uzmbYgMAeTiFrqsT946PZ7yIHrjZgojDV50pJB92cq8W/CMXRoIEsfkp+eUdxU/cTuyFgAhA3yDPCPg6avyxobHs539dkZVR04AakaNpMVZGRF/9X/i6DdMxEIDmjvJ+lM/FGyDp8aENFdMHoPuATeGl8YqPElNkNm8Jwr2fqDEYyw3gCLTrs6zJc7OxrkkeBC/k9SGrluJzZeL7Pevjay5LVrqWF9/eerUPpEbWHMGFWfjbJZDOb3wvpmYxoXW+uM7su2MhbboKu6nKqVcPrT+9c4zr34If/MoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT/NClg/JrUHI5t63Tgchx2OHa9Vy1iB9q1xhQuHpaM=;
 b=G7Tsu9i48Uhu+d+5AIGjIFMAL1mQnl4GmCtr78XWRCzKggehZXzp1mjA/OBKNslvQcANwijHgl2vmo537vsv7c+kWeLWd325Fb5fAbXtlrRCMCm+9q35ZpLMxgm1JFMXLd1fypOEOn5z2vWXzDDNTdc8DrpDqGayQNdB4OsOpQzM1fkza+Kv9mi5peFsHiWYcTtZaWM1XTFbdu4wiOsExHwvO/cFLzcUvqQRjEp2TXWlf8Uf66HwtzCDRN1Gh9HVM5J3mp7iPxNXPCXH5eVsnVvr9SFNdp4E+mZvfLWXKrhL4Dcak2VmpXusVW6xOP2W2+h9polCjz18eK99WdaJxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3873ba1-f2f5-2f64-9bf6-d819f614019d@suse.com>
Date: Tue, 23 Aug 2022 11:27:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] x86/CPUID: surface suitable value in EBX of XSTATE
 subleaf 1
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Thomas Gleixner <tglx@linutronix.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a4ec41e6-16cd-4452-19c1-5d6d9e3bddf8@suse.com>
 <27f97ef0-148d-a0c3-ae13-0ed4d640a10c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <27f97ef0-148d-a0c3-ae13-0ed4d640a10c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::43) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8074081a-a927-4ce1-9f4f-08da84e9b264
X-MS-TrafficTypeDiagnostic: AM9PR04MB8843:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2Og1lx8aNcIOodYVQVYjfwOeFUBs0wbtOzmS8N9YnFL8kvTCUWtWvJiaQBo+MilYwHJkN1c/ElqwtjgfNYCBwsh4O2hNR/wUdnbBZBI8XbQCgfYmD7A3H5xO67oqitOmv2I9Hf1193Pgyhsx1B9gVIvDChDCJrE72IxHyKvgTBUPffAnUon5tCsXEGnNCNe5n4+aYo0Q1cJ/yCYeaf2fpxlOIwEeUlvN//HZDKjSTmaeLEiBhGYfHitlnHGjqczuoZmHIuni5N8xBLAYloul1v0JLGwqoxXc0M/OVh/BtvgNYpxec8btYpr4VoNvVdkB0w59W3PNL8Bg8td87L+2VAq8oG/HoXQBJf8LP54OSfeXv6E+48ICTS8/MAICop3nQYhQEDyzUBoAwrZ4lZKeoQAiXNmsEpKutI75z7vbxxX+J+ei4HO9XMVbS35272tzgNRFVNK3DwiOyYnPudL3NHWneCnIFnvxKYOiB3NvdeV18Kqwm4u9kcgg/efC8LmV+tJOW6VlH2Zg7Uhc/MImBoDU8qeyC1dxTL7MCr32Ca+RM6JT910keq8Q8OaqCvzOmoA2NKwjtXxMt7r+ljO23ZqfIpTeGK5fNJtejyqHTQlgv5LjEH2GCd1pBa5nmc3Mmo1XKqWnfro0thegtsy3k/GwdWHC9LYKlXxOrWVGYFMt3+Z0b6Vw6DCood1sH5QzCCpvqSsRe4VzkeUEfA4WoJecvbpO/Km0tmqoEKKAi736736Zb8wO5w/gm4OOKk8nOUaBIvNsUTxvdIJ8+mEyHHJLl4wiaSzSS/jUBDXPx0GJsTJqHoSZfJqOR30f0yRfEAymPV4h6VkgaLB0EBmZ4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(136003)(39860400002)(376002)(346002)(83380400001)(186003)(2616005)(54906003)(66476007)(36756003)(31686004)(6916009)(8676002)(66556008)(316002)(66946007)(4326008)(53546011)(2906002)(31696002)(26005)(6512007)(6506007)(5660300002)(41300700001)(478600001)(6486002)(966005)(8936002)(38100700002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3QxcGRtK3g0T2RNdVN3OWdtUDJoN0pQWVZCdCtoTnMrQkI4NnRyaVVsWjly?=
 =?utf-8?B?YlhmT1k3ZjRFNzVKY1crcTFnTjEzRHlBYUpGR1puRXJBSGtrdk84VmtlR0RK?=
 =?utf-8?B?N2t5TEhQRysxWW5acHBOZ1BDSnI0a3p2TG8vWE9jZUtDUWQ1N2dNMUp6SmZG?=
 =?utf-8?B?TXczK281NU83VnpKT3ZaMXFwbWhCY1FWK1dLVVFYeW5BdGRKTE5qY3RmeEZa?=
 =?utf-8?B?aEFMajJUbFg4UnZVcXcrNUUva25xZE9xWk9TdTVBWkFlbXJDWmxOTVR5NTVE?=
 =?utf-8?B?UUxycW5OVWcySHNsSVpCbytGQW5FUEFKVlkrZVQ5cUxxUlFkM2NEVE5Fcmxx?=
 =?utf-8?B?cGJkSUp4c29pdVN4RDFnOUszdC9Fa2ZNZm1pYk5LWG12TVE5d0huWHQxZEFV?=
 =?utf-8?B?dzQvSzFCaStkLzdQazEyd05LRzF3WVRqZ0lhNjNkZlE4ZXVKdXF2QUh6bGIx?=
 =?utf-8?B?d09FMHZSRFJCenpKdnJKeGJGaGdjdTBEVURyQ3RJVWdIcmRwbGhrZDFmV0x3?=
 =?utf-8?B?NnpwSDFjV2JPajNvaHExbUJRSkpqNUJHRXJEaENBWVo1VjRTRVZxNmh3SE9M?=
 =?utf-8?B?dzhrOC9RRUhtQ0dtL0pyeW5uTVdoR041S2lRcEJLNndjUktHOWVyMyswU0hQ?=
 =?utf-8?B?TjMwYVJyaEhRa25CS1dnVHR5YTJRVTdCMllwV0FUUjh5RXJqUVlJVEgyN0lP?=
 =?utf-8?B?YlkwaWlPVkRoUjJHSWh1ZHJ4a0NrditSV09LSmNseDNhZGpnODkycU1PaEwz?=
 =?utf-8?B?V25SRFI0dFFoMkdpUkp3bFRYeDhlNjduM3lYZnhEWEdienQwd3V2VzkwRHQy?=
 =?utf-8?B?V3RyL202WmtTWkdNWVZJQlM2SjhNV0psMUZqMUdUb2lyT3BvUURmWDZYcmIw?=
 =?utf-8?B?bVZrZlk3cExJUHMrNERQdGFYdnVvcWFIMHRRdFMrT3ZxRWR1Ym1JeC9CeTdT?=
 =?utf-8?B?OFU2Q0wrcWRHVzZFZlpqUU9sVVpaNHlBRFRIY1pwYVVnU3Y1OG9IaVptaEhu?=
 =?utf-8?B?cmtWOFNPOUdkektOM0xtYW9wRWp0NklqTURCV3k3a0FjZHRBOFpaV0xvV09K?=
 =?utf-8?B?NFhJNTB1MFBtUm5leUtLSFU0MWp0eHNZWlhRUXI2M0Q4RytzamhVdDhQRG1p?=
 =?utf-8?B?bnBDcmRtaEdyODVGc3FDZ2JUZk9UODdCMVpNbFdOMGJhbUMrNDhpRFNNU0Fi?=
 =?utf-8?B?TmRxZGQzM2F4ZmJwVEZxRDFCYmxJSDlZdFBoTEZtRzZQUUo0d2F0ODI0R3l3?=
 =?utf-8?B?ZmFYSmRqcUQ3VlFoNklUdXlwdFFMRUI5TE1lNWM3UWhyOFJwK0Z5RGVwZTh4?=
 =?utf-8?B?U1pCS2g4OENqUEQ1V3F5amE4Z1E0KzFySndiNHhjZjFnNitPRTNGTk5zT09N?=
 =?utf-8?B?UFFpUnROSzhIRUkvRGpOUUwzMGRPek5LMGMvODA2ek5vMjJLQnBqTmRUdHBN?=
 =?utf-8?B?ajhYRnZQQnJQTmdCdFcvTFFWd2RoWjBucitucjZoSi9WVUM1UjUySjBnQXpQ?=
 =?utf-8?B?OEtnZFBmWWVUdFB4TW1GaFJlVnVRT2I2WmltR2Z5RlRJVDdIRmY2djlldTZX?=
 =?utf-8?B?SWJCRVNtU2RUMzFSK1c4RlpRMW5scUpQaW5Wd01HS3QxcVRrSGlhaDh4dllr?=
 =?utf-8?B?Z21aTTQvT2Y2R3FHMkpaZ29xaWJmZ2FmK3hWWUZHZ21RNlJ4ZUtiVFJBaVA1?=
 =?utf-8?B?bytNNzFBN0Nua3ZJZisveXZ2WEJLWlN0NVpRaHlhT2hhQTkyR3puUTBya3ZZ?=
 =?utf-8?B?NktJRjZRYU1BTXZVU3ZPRjNVVjlpWE4zNktsSUJ2LzA4QkJTQks4djR2dlBY?=
 =?utf-8?B?UGpGS1k3UW5aOFp4enJhaVI3Wk1JWXdDOEJPUDNEbmVTRGordVhla1VOV2pl?=
 =?utf-8?B?eGR6eElLWVJxSjZ0RENNTEROeWFpcjVPSkx0R1hXRFc2d1NXWE1SNG9yV1hL?=
 =?utf-8?B?VEhmNG95RWFaS0c3R2tzRWdPalZBd2RqZFZXYjN3bjY1S1k0R2MxakxDbndQ?=
 =?utf-8?B?RllSR3kwcXVoOWl1Zk5FVVNWcVpXSjVqeHVEWW9yczk5SDl0bG52eDhFUWNx?=
 =?utf-8?B?WVZ2SmRCK3EzcjdYVE1UNDQzaUdoWDl1WTRhaVpuMGg5S0RvMDB2eVg4RUJ0?=
 =?utf-8?Q?IbvIO5xoB244bdPkHXu2e228x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8074081a-a927-4ce1-9f4f-08da84e9b264
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:27:28.2781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0Cd1MQtzNHnApDPvBzbNFDdoCTAt4csElw/bz0RtgDh9ZDp0WdNUFdZ13w3NpIM7E+WS4zLPzJVmFj2pbhxdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8843

On 23.08.2022 10:59, Andrew Cooper wrote:
> On 23/08/2022 07:42, Jan Beulich wrote:
>> While the SDM isn't very clear about this, our present behavior make
>> Linux 5.19 unhappy. As of commit 8ad7e8f69695 ("x86/fpu/xsave: Support
>> XSAVEC in the kernel") they're using this CPUID output also to size
>> the compacted area used by XSAVEC. Getting back zero there isn't really
>> liked, yet fpr PV that's the default on capable hardware: XSAVES isn't
> 
> for.
> 
>> exposed to PV domains.
>>
>> Considering that the size reported is that of the compacted save area,
>> I view Linux'es assumption as appropriate (short of the SDM properly
>> considering the case). Therefore we need to populate the field also when
>> only XSAVEC is supported for a guest.
> 
> This is a mess.  The SDM is fairly clear (but only in Vol1) that this
> leaf is specific to XSAVES.

The way it's written my assumption is that they simply didn't care about
XSAVEC when writing this, or they were assuming that both features would
always be supported together (yet even if they are in Intel's hardware,
the architecture should spell out things as if both were entirely
independent, or it should specify that one takes the other as a prereq).

>  The APM has only an equation, which shows
> it as the compacted size without reference to instructions.
> 
> Ideally I'd like the opinion from some architects and a clarification to
> the SDM...

I've made a request through my contact, but of course there's little
hope for a quick technical reply.

>> Fixes: 460b9a4b3630 ("x86/xsaves: enable xsaves/xrstors for hvm guest")
>> Fixes: 8d050ed1097c ("x86: don't expose XSAVES capability to PV guests")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> CC Marek.  Looks like Jan has found the issue you reported on IRC.
> 
> Jan: Be aware that I submitted
> https://lore.kernel.org/lkml/20220810221909.12768-1-andrew.cooper3@citrix.com/
> to Linux to correct some of the diagnostics.
> 
>> ---
>> I actually wonder why we surface the XSAVES feature bit to HVM domains,
>> when we don't support any of the features.
> 
> Because that's what was originally accepted into Xen, and I couldn't
> retract it when fixing CPUID handling at first because it would regress
> across migrate to a newer Xen.  With CPUID data now in the migration
> stream, we could in principle fix it, but at this point it's definitely
> not worth the complexity or risk to adjust.

Hmm.

>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -1142,7 +1142,7 @@ void guest_cpuid(const struct vcpu *v, u
>>          switch ( subleaf )
>>          {
>>          case 1:
>> -            if ( p->xstate.xsaves )
>> +            if ( p->xstate.xsavec || p->xstate.xsaves )
> 
> If we're doing this, then it wants to be xsavec only, with the comment
> being extended to explain why.

Why would that be? Both insns use compacted format, and neither is
dependent upon the other in terms of being supported. IOW XSAVES alone
and XSAVEC alone enabled for a domain should still lead through this
path.

> But this is going to further complicate my several-year-old series
> trying to get Xen's XSTATE handling into a position where we can start
> to offer supervisor states.

Where do you see further complication? The necessary fiddling with XSS
here would of course be dependent upon p->xstate.xsaves alone (or,
maybe better, on the set of enabled features in XSS being non-empty),
but that's simply another (inner) if().

As an aside, I actually wonder what use the supplied size is to user
mode code when any XSS-controlled feature is enabled: They'd allocate
a needlessly large block of memory, as they would only be able to use
XSAVEC.

Jan

