Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EEA54859B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 15:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348317.574598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0kYw-0002yp-Nh; Mon, 13 Jun 2022 13:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348317.574598; Mon, 13 Jun 2022 13:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0kYw-0002wK-JB; Mon, 13 Jun 2022 13:57:02 +0000
Received: by outflank-mailman (input) for mailman id 348317;
 Mon, 13 Jun 2022 13:57:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o0kYu-0002wE-DY
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 13:57:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7d00::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b10aade3-eb20-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 15:56:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4553.eurprd04.prod.outlook.com (2603:10a6:5:34::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.19; Mon, 13 Jun
 2022 13:56:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 13:56:56 +0000
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
X-Inumbo-ID: b10aade3-eb20-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cM8z/FSazvYBRf3CZcb8j0NPkcSV51cnwis0ily+EyJo1wgS061MKjXHO3DtYMxOg9UzjV6lGYNwA8N5KTJnoq145ZiPNwbTwtZgXRroE6lHcZafxhapBjhIgv/wGxxjZNUwyUVqtt0eFBbXHH/7OqTmywDM/Agb5r8B9apKS/+1jjEk9dtTa3CiQA6P7uc9VH6eOKvybDxotaAqrYwF3wvWOvr/l+MgX8l17KP/8vU5oSGAGeh3OQSfSpGv5nzN1tI/Z7hFPxA6mOTJWKlyLHxqJO++mud1dSkVWMREPMu191hB9hQP58SykBhtCYBeiplE14J0WU+9E/P9BtnzvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2B4RI8nq4GUpDrzZ2p5ayGYF78++kTMBMVg6RMNvwCU=;
 b=clZGghL3P+mRTQxPFFLAdDTzBXXVJrkPul5OE2NJFWYXvBDuVvyVM8Fra59ztCCCqiHao2JappdvgtA0OQvUw4DfzI+XXqcreAqRgSJda5SFYjcRw2oqKLejTapM2oMO0InPhZtVh29reGZoDSqum73nu2srMHyxMbYBpVtEhm3KI4OxPnSrjauEvsROPfSUpSSveSmBLH9OAqPg+s4IW3uiRPdaxmB4xCVKXEVoxj69SkDzQqW4DF/LJ0XM+OtverEkli/9jpOPU8ajJ00NJ9il6p28iAIfK9sUzNRmhqwrt9adIIxWpV2dKByw8roinz6zIUqABcY0AoMB2wNrmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2B4RI8nq4GUpDrzZ2p5ayGYF78++kTMBMVg6RMNvwCU=;
 b=zPqumvESrDgsd0F+MWFBcH/LGaTqk1OXDl4JbphFbo3uZ92NENZCpKV2AVBkP8qRlUcmgbxwYeboWp0Ieqop34Kn/8+a2U+xEAf+Qb9qkDNej0xH6Bdf2oIuWbogYK85tpL3y5t8Cd6sx7MbVOhc/XxX+7rmIPs7wiA0a877gLbTof08cJ2aRLNEcNX1vdaLNaQS+PJv5+FPQ0ha60rgjZ/ahmBolWnne74OjIio2FQAO4XBMthRbk1ylqlkxTF1LZUYdugQ8M8TYOCQgz+hVOb+4csdmH2ESubAjFAo9fySXINq9t91gdicYzFa6UHNNgpoHO7+9mo6TK9bHX6tsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f0f87e99-282b-6df7-7e57-3a6c73029519@suse.com>
Date: Mon, 13 Jun 2022 15:56:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220610150651.29933-1-roger.pau@citrix.com>
 <3a462021-1802-4764-3547-6d0a02cd092f@suse.com>
 <YqbziQGizoNX7YFr@Air-de-Roger>
 <3d0d74d8-55a9-cdb6-0c5e-616ddd47bbc0@suse.com>
 <Yqb9gKUMokLAots7@Air-de-Roger>
 <afa0a9e3-fd35-be38-427e-3389f4c3ca26@suse.com>
 <YqcuTUJUgXcO3iYE@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YqcuTUJUgXcO3iYE@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0150.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbd4aee8-7e2d-4d90-7ede-08da4d449412
X-MS-TrafficTypeDiagnostic: DB7PR04MB4553:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB45536B4030D5282C6F7E26C1B3AB9@DB7PR04MB4553.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S/fnFVoVGJC9nY2JF8GHd/WxHz7BZm2sLHU1tTf1BviynnsSshcTRytOOnrbzlDZlr07WpV+HR6/kCakugcGEL4zCJoYCrFHCGNsSyNVXHzQy93ImF3f8zh3un304Rwp8eStOa5hPGCQWRM8NRvG3Y+SNi0C6+ErHP5g4sv0onPJFTFM7ldzV4GE8hNFu3jBmiTdqINbvs1Nj0//KCj1fiERaCvfrILfjfHFXyWKddAZJc8XZFZNEKEyRZh+Hd7cHIi3n1fam1UNG/DSa8aZs/V+5664sshX3J3F3dk9lYnugHDfVF/m4SjkEDD3gyBJbHFv6+VFamSbc1Z/jA08Xbp8kRd6PevIB9BEN4a3IUPhgCk3nF9i7YI6DYyBNsZDb9KS8I+7ECKScD3JdE8Jz+BmxQyTG+f2Csh9rqbNd84nBG6mDyWx8DBUbpMhnwF11qaKDQdrxxSNOM8wTNVzzmSQ8WJ1fjwVqDgDkA1GOetwWxAdh9Fs2rp4Um4SCRxguE0/R9pDdYpREGMNhKP91pgRX6hRw/Hnq0D9yMB281pJzA14/PwKcAwAB1Wev48Hgxnx3F5mkxE7m/ndDHZQaOAlsvzvGezJt0tyixPMRPqURWt91wraXXlgkquHVcqsLSRvrSBZL34dOV8PnWS3e4lInwoDBzATdeCuIl9GlM01xc3UEtufLR5ARxyrii/6mGhKnCobRdp9wQlX6yeg4M2a+pUTnvKZvfCd2UhIHWvDvZ+FXocBLJI7cWZj59Pg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(83380400001)(54906003)(5660300002)(86362001)(31696002)(4326008)(2906002)(508600001)(53546011)(186003)(26005)(6512007)(6506007)(38100700002)(8676002)(31686004)(6916009)(36756003)(316002)(2616005)(66476007)(8936002)(66556008)(66946007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3RTU09wLzlkbFBOUGRjMWdINEZpVmF4V0k0aEhGYVdTQWI3S0ZtQnl3cHRD?=
 =?utf-8?B?ZHZJU0djMFdweTZGZjl0eDlrWlhCNS8vRTFXM2x6Y2o2MW03M28yOWRjaGtW?=
 =?utf-8?B?VUt4QU5lc3I0VGVOVGpRQXF3UWdWVzYzVnBjK0tpeWxibzRVQzE1amZOSkN3?=
 =?utf-8?B?K0Y3STJBcFBUQkJ0SE5PUmc0NjVnNlQyaDNqZVZwZXZGeGhySTFyTWxvcDV5?=
 =?utf-8?B?c2NnTTBrZWl4bVlVdWtneGFzNlM1dm4vNmNLWUlTeHhTdlJqc2hBcStEMGdY?=
 =?utf-8?B?bzI3emZoaGw5alcxWXBuTWllcnVwRFczS3diZmZMM1EwWGVrRjdPQ3R0Vlg5?=
 =?utf-8?B?d0VML25mNksxT2pyRUI5WlhDQU00dUx5QW9QQ1ZaSlRSZmMxV2lHVyszQm1M?=
 =?utf-8?B?Mm9FU1JIL2t2LzhwSlQ4RjlCMmRIQy9uQjRObUlTeGUwaXlmVmtFTkRYczRw?=
 =?utf-8?B?NExDWjQ3U2hTK1VIVEgwWFdSRE4wUEdoY0JISE9pRE1zb29KV25qZVYySllG?=
 =?utf-8?B?Y2FRWURXdzk0ajdJOGRWaFErZDVRR1hGSjVlSTIvNXI2NlRWRmtmQk9vWG5Z?=
 =?utf-8?B?VVYxRVJJSHNhNEtPQkRJV3o2ZHFiWHRhZlh3cGFhOHlnMHNIN3Z1QWtoRklX?=
 =?utf-8?B?cW9vaURuZ0gxU3V1SlV3TitWM29HZytSRVhzOGlWNkF6QkEwU3BOa0d2UERY?=
 =?utf-8?B?cE93M0NYa2hxS2Fza2VvZGMzdDN6eVFOa1JCVTkzMjRqRjZFdllTWldzaXBE?=
 =?utf-8?B?OEE3VVZZVitkajltNTVGUjFyaGd3aENuU0RiTytQSjE1alZPZ3FBQ3ppSGtl?=
 =?utf-8?B?NDcvZlRXTlRFVlRieVp6ZC9GbG5LclNDYmRrMGdTaER6K3p5VDhqMmZ6SGIx?=
 =?utf-8?B?aXRKOU0yeWRtd3VyYktISlpyTXRyYklIRGZ1YW54RkFMTnhHc3VDdEdwZGRo?=
 =?utf-8?B?c0syd3IzK2pPSll1c3J4QktPOWdXU1VZRldEc0ZNVi9MMXptTXQxL1E5d1RU?=
 =?utf-8?B?dk5jQWJjbEt3ZXBpOEFqUTBPZWJEYkJHcWs4bkFJVFc4WFFRdkI0Z0hsWlVZ?=
 =?utf-8?B?NmovSnVSL3ZnazdlZ3l2L3A1dllkSlRiS3IyWnBNN0h6Q1k3YzRTZlBXQVd5?=
 =?utf-8?B?c2xFK0dqL0NibTk5NXo4Y05oL2tHZEJQTHhEV0hhemI4d2Z1dEtnb09UdkFk?=
 =?utf-8?B?UUtuVmtiTFZiQTViQlN2M3BUcmhSbzliazRBY01WdHN2VDdxVitzWkcwdVFG?=
 =?utf-8?B?bGpxc1pXREpmckd3UWRQWGVwZkQwVkx4ZTlNRnY0S2NtdEdoQ0NUM2FCS2NJ?=
 =?utf-8?B?OGpubENvZm5JNWU2RHdXMlU1dUlVczhjL2cwdUZsTG9YV2NVNFMvdG5ob3Zq?=
 =?utf-8?B?ZnJSbnh4SFdyNmxjQjVHNGJiSGNRVEVDZjZvN3BFeENRRHRqVy8vQUY3b2Jz?=
 =?utf-8?B?N1R0S3ArRHcvVXUvYkNpcTh2RzdPNVN1bzg1a05yYTNVZS9BcVkxRk9EM3BQ?=
 =?utf-8?B?U0dYRjIrdDRQVkFLNm1wV1pDS0lsU1FCc1REbFlrQnpWOFVsS0hTd3RnS3Jj?=
 =?utf-8?B?K0EraXhxWjNqU0N1NTFrWCtuS0xpVGFSV01oWU5lWGpzN1hDK0N6QXFEUEJa?=
 =?utf-8?B?dzBSRXlrVXlLS2pIdVdaaGkxeXJIL1FGcStNNjlGRmpvc0VRdzliQ3B1YXd4?=
 =?utf-8?B?Vkw1ZGVVb2hLWkVYSVVBa0ZWbG1vcDlualNtVFl1Q1hqRCtwTXJvOWFCbjRj?=
 =?utf-8?B?b1UxUUJpb05KMlVqMnRPMG42bUpvL1VWeVBtTnRzZGQ5V0hFMHBMSkxLVmZk?=
 =?utf-8?B?TDlUUy9aNHUySW9NOGdGNFNQSkt5aTlCMGtKK3FybXIwRUZiL0xuQnFub2xV?=
 =?utf-8?B?VXp6UjQ5b0p2WGxUTDFNelp4ZUI0MzFKZGhCYVVqcXd2b0QwalZZaE5POEZi?=
 =?utf-8?B?R3JvdUhYU0NnZ2R1T2FrWjdobVNjVVladisxZlFocllBUlpDWGNORTdEUjZG?=
 =?utf-8?B?cmhHb21JVTBaTEQxVmsvcFhLSmRGRy9wNDVRbnZZczBsWXVjKzBPd3IvWkdM?=
 =?utf-8?B?MkZINXF4RmxHeENSaWRPY0RRelNtTUs4dHRUYlJaWHFEcjZxbWQwbi9UY3RI?=
 =?utf-8?B?NFdYcUdYdEVWWTFjQ2YxUXNLSlZraE50VmU4ck9uUkFXU3FWYUNGaWgxbFpl?=
 =?utf-8?B?Y0d2NlRxVlMwQ1ZxdUJlRzdRcHRmSjRnNFJUWE1MTzYwYVRSN3NhY1JnenI5?=
 =?utf-8?B?M2JCUUozUDFSRnJ2Z0YrYzF2TlUvUXV3d3ZvRlJGSDdZRzl1YmtteERHTkJG?=
 =?utf-8?B?NUg2ZzNxeDJWdndjMGxqbUkvTzdLMDlYLyticDdrQWhUTGlZTmtNUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd4aee8-7e2d-4d90-7ede-08da4d449412
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 13:56:56.5263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ocXOG51dJ8BMgaJGk9TIPEY2SNhwsYUF8OWbOgdXXoE/jstWEA5BiU4N2W3l/fIe6BeqL7ObH6yc2UKNw3GtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4553

On 13.06.2022 14:32, Roger Pau Monné wrote:
> On Mon, Jun 13, 2022 at 11:18:49AM +0200, Jan Beulich wrote:
>> On 13.06.2022 11:04, Roger Pau Monné wrote:
>>> On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
>>>> On 13.06.2022 10:21, Roger Pau Monné wrote:
>>>>> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
>>>>>> On 10.06.2022 17:06, Roger Pau Monne wrote:
>>>>>>> Prevent dropping console output from the hardware domain, since it's
>>>>>>> likely important to have all the output if the boot fails without
>>>>>>> having to resort to sync_console (which also affects the output from
>>>>>>> other guests).
>>>>>>>
>>>>>>> Do so by pairing the console_serial_puts() with
>>>>>>> serial_{start,end}_log_everything(), so that no output is dropped.
>>>>>>
>>>>>> While I can see the goal, why would Dom0 output be (effectively) more
>>>>>> important than Xen's own one (which isn't "forced")? And with this
>>>>>> aiming at boot output only, wouldn't you want to stop the overriding
>>>>>> once boot has completed (of which, if I'm not mistaken, we don't
>>>>>> really have any signal coming from Dom0)? And even during boot I'm
>>>>>> not convinced we'd want to let through everything, but perhaps just
>>>>>> Dom0's kernel messages?
>>>>>
>>>>> I normally use sync_console on all the boxes I'm doing dev work, so
>>>>> this request is something that come up internally.
>>>>>
>>>>> Didn't realize Xen output wasn't forced, since we already have rate
>>>>> limiting based on log levels I was assuming that non-ratelimited
>>>>> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
>>>>> triggered) output shouldn't be rate limited either.
>>>>
>>>> Which would raise the question of why we have log levels for non-guest
>>>> messages.
>>>
>>> Hm, maybe I'm confused, but I don't see a direct relation between log
>>> levels and rate limiting.  If I set log level to WARNING I would
>>> expect to not loose _any_ non-guest log messages with level WARNING or
>>> above.  It's still useful to have log levels for non-guest messages,
>>> since user might want to filter out DEBUG non-guest messages for
>>> example.
>>
>> It was me who was confused, because of the two log-everything variants
>> we have (console and serial). You're right that your change is unrelated
>> to log levels. However, when there are e.g. many warnings or when an
>> admin has lowered the log level, what you (would) do is effectively
>> force sync_console mode transiently (for a subset of messages, but
>> that's secondary, especially because the "forced" output would still
>> be waiting for earlier output to make it out).
> 
> Right, it would have to wait for any previous output on the buffer to
> go out first.  In any case we can guarantee that no more output will
> be added to the buffer while Xen waits for it to be flushed.
> 
> So for the hardware domain it might make sense to wait for the TX
> buffers to be half empty (the current tx_quench logic) by preempting
> the hypercall.  That however could cause issues if guests manage to
> keep filling the buffer while the hardware domain is being preempted.
> 
> Alternatively we could always reserve half of the buffer for the
> hardware domain, and allow it to be preempted while waiting for space
> (since it's guaranteed non hardware domains won't be able to steal the
> allocation from the hardware domain).

Getting complicated it seems. I have to admit that I wonder whether we
wouldn't be better off leaving the current logic as is.

> For Xen it's not trivial to prevent messages from being dropped. At
> least during Xen boot (system_state < SYS_STATE_active) we could also
> active the sync mode and make the spin wait in __serial_putc process
> softirqs.

Yeah, that would seem doable _and_ safe (enough).

Jan

