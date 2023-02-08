Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 158F168E982
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 09:03:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491619.760812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPfPf-0007nQ-K9; Wed, 08 Feb 2023 08:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491619.760812; Wed, 08 Feb 2023 08:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPfPf-0007lD-H2; Wed, 08 Feb 2023 08:02:43 +0000
Received: by outflank-mailman (input) for mailman id 491619;
 Wed, 08 Feb 2023 08:02:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPfPe-0007l7-Fh
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 08:02:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4ace4a3-a786-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 09:02:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7588.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Wed, 8 Feb
 2023 08:02:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 08:02:37 +0000
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
X-Inumbo-ID: f4ace4a3-a786-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4ALZ45AqEpW4QxJhE/AoKeGjdb8KyUFKd6Qimup+Sv5xNXtNno7f9b29uYk6semC5DgWISwR9zQzy/Pb18aG15LfQhth22wDjrZEg1ZZvmnvuv7o5iYusJgaaihIcowuDBZgTxcRXnpF7bNt5sLOv2OfaUYRgMcG7hLr0Kh3Ql3iaQ3Nm2evB9+zvjmGEdGlDIO3pr1PlOUCVdmZfIb1Z098p2LL8bpohML0s0XSAB8T/BA/rZzOPAEVQLBdAsMEgvB4glWlpIeyNJSl1Dq1z1er/bx1QQ4W/1OhMM1uYBNjPJeUR9VKwqGzDQCRedYMnJ4U0Ygux/c/o7VOsyoHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzPI/saA6KVcDXF5RleaoZ+pK0Fg6mAKbIgPAm4x9Ls=;
 b=TnFVLHzfaMU1O7ac5oM15UdOiedc3xZAnHRLpkX7qgo08TXSwhE70eOwTLJly8NknjTG2ZlbmoWYQBMn0qBc+hK+VoZN4cqPL58w/8ZYYDwP1kkyoT4kYroxGD4r2fO6D+E3rOyP4vDewGSXAti6qG5Z2DVjVOKVRVKQNsQ1gB3zC6ZekxmCBR7VWtROr0bD2IS/TztD+7n8CVTnV19gfjdOo/UYqIhYSZ2+87zRNkkpRUin8CrIVJKzUYwbGofVJPbL+amBP4k6WfAiR+A5BwOCwTrCrVj2p8of6FolRm2457auxSMiaoP5oh4ZT2wV4IXBvW6IpQpWva35CLaDAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzPI/saA6KVcDXF5RleaoZ+pK0Fg6mAKbIgPAm4x9Ls=;
 b=uCrnlSZDjQpYITVWQzorXnlcw2jKntQd81vBO9shOr2AFIwZuIfEtROl6t6NwE1MtpF7yUveky5hIq1Sy9+rHZ5Td/sFVUruXCFxZfWHbUX30B9In0ylNukVRo8HdtOIHO2vhGftBrWSah9LdrqlRChkQiMoRKKBN62zn00RnzxIX0D0UG8rPwvlniERoP3PggAekxn2xn5ZHuR1xewXaogChtFO2nBi/iTeszzNaFoGqQ/ryreg26qINwxy4y2pn8BFu8xM4iUxXrhxACgYL1X/NUqvevJ7RkqFMHwQ61kgGzn3R4910yc+IMISP5fgwy6Pq2uCDa6n5GmHPtuzgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e01f840-1d42-f31e-4471-ee06820b4b31@suse.com>
Date: Wed, 8 Feb 2023 09:02:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH] tools: Have flex and bison mandatory
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20230207160948.3169-1-anthony.perard@citrix.com>
 <a11b962e-7422-a197-4ff4-fcac9963364d@suse.com>
 <Y+KSRY+5SmrNYpJ/@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y+KSRY+5SmrNYpJ/@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: 65ff4528-34bb-4349-acfe-08db09aad7c2
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NTsSTlqnxk6KtvNmLx3RHkVYJwQp6cyIjf2e8gBs7XZ56yIO7lD/mizNZnvFlhWWj0D74Cl8iAZHwNwIMxzVN+kdtr+wvJhxvUj0F32B6UjRbP1S2SpCw8WLDXd6Ni6Z3ZO5j9OUs9DlreNt7xnacqX9plB9eSm62LJAnEGH0wjk/R7pnB6EqZ4k7i7cWEueeH2zRuGNiYx0tLxosvE7CBmXB26UJo/yY+N0kH3NpFKBARHQqM/mLT5NNFfbACri6lP/BT+WJgDUYfFgLXhM4BVi7hm2qjNmh5PeoKH1x4Ta8DgUXI81hQfjQUIcEFiuWlClH7CNniLJaE0pnXUwQUz3VKjzVRrCLXZ2v43q1EWc2vdgEiVghKMUeI/GxyyL8lfOCcrQ3TRRUhhpoJo5ehZ1aqK8dBlSbvejkMiQtqovE4e4p64+Tr6BvN3kVfpVOnnYi/q0zJiWojRSOyIUhM7E34O9+VdnpPHX8APhDOAxKGmtAqP04lgbZzn7CZ9iAIVpL5w6sAQDSbWiRra6t/0HF2//CXaVlLzQyvMrfjirzyVFXerVa+t1GQYXb9bcTv0B8EBv0cx2GSGpBJVOY7GNxK6q3ysEBL3536o74LBVf7DCg00DJFUQrVskoE4sLaDGF7Tv2JeWtKeHjT4BZ5nL2IeR46FuD1G5LmZGOfcWgvbIbgMES3CbSyvGTqTb0qVvhBg0WDMKyMZfR1wmU4Ojnq+o7GK+2WtBFLH1kLM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199018)(83380400001)(38100700002)(316002)(478600001)(54906003)(31696002)(6506007)(53546011)(4326008)(36756003)(2906002)(26005)(6512007)(86362001)(2616005)(186003)(8676002)(5660300002)(8936002)(66946007)(66556008)(66476007)(6916009)(6486002)(31686004)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0h1eDlkL1psL05ZcGpKOTJ3cTFhdnpDK0pkWngrRUx1aU45NzV1QnRqaXpX?=
 =?utf-8?B?WEo0eUlrQ3RwS2I5SDdFazBmV000R29ud0ZqTmZMRThoclBaUzI3enlVb2h3?=
 =?utf-8?B?V2p6L2lDeVQ1RmtMTVE5bFRDeTg3ZXIxelpndjcyNmNjWDdtN0wyNXF4SHZB?=
 =?utf-8?B?c0xxOXdIQjljTEZHS1ZRNHlhS1YwRFVxVCt4ZVJCc1JnaVZ5dGNnbHRYdjJ2?=
 =?utf-8?B?dkJiMytlR0lQNDlCc1FYRWh0SHhSSzNTcWYveXIvL3M1a3gvUGhtUi9yOEFW?=
 =?utf-8?B?Tnc3dzRtZ2JySm44RVVpR1V2TjFpSlUxVTlvWHlJVEZ2S1luL3VsRER6ZDc5?=
 =?utf-8?B?SXVxRFpKdXhUN1ZlMEFCUnF1WXlpbVVsR3NoT0EzdW5ubXpoWFN2K1JtTHM0?=
 =?utf-8?B?WWgzekFqMHRIMTNjYUZiWmZaNjBNZGo4UzdCTGZCTy80OGJoYnZXNDVtaDNH?=
 =?utf-8?B?YlF1NEpHY2RCcUYwYzZWR3RKQWpjanZVY1hxSER1b0t5QUhLRWdyYWtGZTJn?=
 =?utf-8?B?dGczWTE3Y1pXNG5pZ2xyTENWekd5THJCQ3RibjVKR3B0dHNMclBKWU5CbldU?=
 =?utf-8?B?Y25KSHYzSFQzQkNTdExwS1QzdS9nSytOOTVBNjA3QWV4NHZTNFBMbm9NQkFQ?=
 =?utf-8?B?TnZJZ2FmMkdaWDFMT2JMNTJsOWJWYTJGek9rVjkyTS9VbWVmMEZqWW43RHVn?=
 =?utf-8?B?N3BQSTJxd1VqT29NTHRIMEZlZWNvWkZsMUY5d1d4R3AwazhZVzV5UGVCMk5v?=
 =?utf-8?B?NE1LeWs4aktLMk1obmpWTlpOY043YWZaME42TlFrN1E4ZWdYYXZnY1NyRm1N?=
 =?utf-8?B?NGZtc2JFN1gwcUpranBEekc5WTVtV2ZyZk5FREZYdkpUTlJvaFp5aWFQelF4?=
 =?utf-8?B?MkRLSlNyRU5zZHk2YmdtVTFtL0diTmFVdGdaNEtjcmhIRnRpNy9HZ0w4WHFN?=
 =?utf-8?B?blV5MUNtL2x1UU9mcU13NXhVbjZDSXFvVHBXZHRXNi9La2g1TTJSZExWUmZi?=
 =?utf-8?B?RG44VTdSSjBoTXFKSTZDYjEwa2k4d2d5bWZ0NFlmb2lYOUdFM3lSalVndmhi?=
 =?utf-8?B?dVdUd3JNMkFDVkx2ZVNQaG1FSG1ZdCs2azlLQjJ2QU1tNFgxUk96NUw1aHlx?=
 =?utf-8?B?QVRYMEV3aVU1ZlU4QzdvR0Q2SDMyQ0JMUUhvaEtsdGdObk1DNjVpc1dVNFov?=
 =?utf-8?B?Q1RKeFJkSXpJZi9hSnExbUFzRmVySkhTenQvL3Nkd0JiT0tUNS83SlNxSkRn?=
 =?utf-8?B?bGsvUHlBTWlIQTI2b1Bzd3B0WWVwQVdvajlnejVaaEprNmlhK0ZZK0hURTdD?=
 =?utf-8?B?bnJkS2dzVytVNDRxSENnc3JPYjN4Rmw3VGl3Q1Z6WjRJSEx4RzBHbEt4MVk1?=
 =?utf-8?B?NkhxM1NmWEZVL29QcTVzYmJTdEdyL0djTTRVNUlIUlpXeTlFVXRISERFOHh1?=
 =?utf-8?B?cFV1MWI1REhLL0pxTWhqK0FCRGl3aHlGanB4U0JCeGM4SW9qVk5FMjY2ZGk1?=
 =?utf-8?B?azBEbkVwRWgxaGVja01QTE5hc29qRTJOd21mbkFud3ZiOUxoYmpFQTI4Rm1I?=
 =?utf-8?B?RVhLcGpjS1NrUnpuaXZlRk1EWWgyWGZZSDd3ZG81K0NxTzFMNFAxT0RybnlX?=
 =?utf-8?B?aWxuQVRzNmo2aFJNUVdOSFA3eHFGTnoxY3ZRMXdUYUxQK09HY3hwUUYySk01?=
 =?utf-8?B?MmFSM00wS2dJejFBL29NTFJJcHlMamM3dURPUkdKUkFYUE5yVGExRFdVWjJi?=
 =?utf-8?B?TE4zc0lLVmIzZEoybEVWdFdMZzlhQUxTellxQzY3MTZwVFdEN0d6OVNPQnJt?=
 =?utf-8?B?V2pubTQ4WGVTRy9pZUVzem1GQ0cwd3lUeWwvSnZNTHN4WmFNZUZ3Zjc0dVBF?=
 =?utf-8?B?Q2pIT1ZsL3dkNE42UXVWa0JaajgzU2ZDQmJlZldPUnJ2L21LaDNub29aNjBv?=
 =?utf-8?B?dHdZN29PMzBkMyt0MUNVNm5TUVNKRitVSFhPa2IvblNXS3NTNWNJcTFBRDFs?=
 =?utf-8?B?VlFCdnlmMkRROFlhUDg1bzZNa0djaHowMGJvd3pjdWpyU3NqQitPMndjclNa?=
 =?utf-8?B?cTJhVitycFV2QTBNeW5zWERmRFBMQWMzcXdLTzc4S28vUlRFYWlaZy9FZWxB?=
 =?utf-8?Q?MiGu/2qXL5iGjcYqyNwHzdUqW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ff4528-34bb-4349-acfe-08db09aad7c2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 08:02:37.4038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j29YJr7Qn4qG9ltSAgX0eiD4qfepgD0KXu3NiNNrQ90GiDBD9UaWTuj/8+oycc3gYjyenYlgYkmpW93DJsa85Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7588

On 07.02.2023 19:02, Anthony PERARD wrote:
> On Tue, Feb 07, 2023 at 06:03:12PM +0100, Jan Beulich wrote:
>> On 07.02.2023 17:09, Anthony PERARD wrote:
>>> Both are already mandatory to build the hypervisor.
>>
>> I'm not sure this is sufficient as a justification. From all we can
>> tell even pretty old tool versions are okay for kconfig's purposes.
>> However, pretty recently I've learned that some linker script language
>> construct used for GNU ld runs into a bug in certain (old) versions of
>> flex. Use of that construct will then cause an (almost?) infinite loop
>> in ld. Therefore the question is whether libxlu's uses are immune to
>> such issues (along the lines of kconfig apparently being).
>>
>> That said - I'm happy about the change in principle; if so desired we
>> could simply see if anyone ever runs into an issue, and revert if need
>> be. Nevertheless I'm not convinced it'll address the problem Andrew
>> had noticed in CI (and where the consideration to remove the generated
> 
> Indeed, it won't fix the issue.
> 
>> files originated). It is likely to mask the issue in CI (simply
>> because, aiui, there are no incremental builds done there), but that
>> won't prevent people running into it on other occasions.
> 
> 
>>> This will help avoid cases where the *.y or *.l files are been updated
>>> but flex and bison aren't available.
>>
>> This is odd: How will this "help"? Right now the build ought to fail
>> (it doesn't, there's merely a warning, which might be easily missed).
>> With your change configure will fail when the tools aren't there.
> 
> The scenario I was thinking about is when someone edit the *.l source
> file, and try to rebuild without flex been installed. It might take
> sometime to find-out that the reason change aren't taken into account is
> because flex is missing. At least there's a warning, but it is buried
> within the rest of the build log.

Right, as said - imo this should be (have been) an error. In that sense
your change of course helps because it makes the issue more apparent.

>>> This also remove the way the missing binaries are been handled, with
>>> double-column-rules, which might be an issue sometime.
>>
>> These double-colon rules should never have been introduced. Double
>> colons have a different meaning ("terminal rule") for pattern rules.
>> In fact they were my initial suspects when looking into that odd build
>> failure in CI.
> 
> After some more investigation, I don't think anymore the double-colon
> rules here is an issue.
> 
> I think the issue that Andrew saw in the CI with "libxlu_cfg_y.o"
> failing to build while "libxlu_cfg_l.[ch]" are been regenerated is
> probably because make doesn't consider "libxlu_cfg_l.[ch]" as a group of
> targets.
> 
> If for some reason we have:
>     libxlu_cfg_l.h newer than libxlu_cfg_l.l newer than libxlu_cfg_l.c
> 
> Then make seems to take two parallel decision:
>     When building libxlu_cfg_y.o:
>         libxlu_cfg_l.h is newer than libxlu_cfg_l.l
>         -> libxlu_cfg_l.h is up-to-date, start building libxlu_cfg_y.o
>     When building libxlu_cfg_l.o:
>         libxlu_cfg_l.c is older than libxlu_cfg_l.l
>         -> we need to generate libxlu_cfg_l.c first
> Then, libxlu_cfg_y.o fails to build because libxlu_cfg_l.h is been
> updated do to the parallel build of libxlu_cfg_l.o.
> 
> I can easily reproduce the issue with:
>     touch libxlu_cfg_l.c; sleep .1; touch libxlu_cfg_l.l; sleep .1;
>     touch libxlu_cfg_l.h; sleep .1; make -j
> And having "sleep 1" in "%.c %.h: %.l" recipe, between `rm` and `flex`.

Interesting. In my somewhat similar experiments I found that an issue
exists only when one of the .c files is missing. Things looked to work
properly when both were there, but one was outdated. Clearly that's
yet more surprising behavior than, as you appear to observe, the issue
simply being tied too "needs updating".

> I don't know how to properly fix this yet.
> Event writing "%.c %.h &: %.l" doesn't work, with make 4.3, which is
> supposed to be grouped targets. But that's is maybe fixed in 4.4.

Well, in my tests while 4.4 has fixed one issue with intermediate files
affecting the behavior here, the issue we're possibly running into is
still there. I've sent an inquiry to bug-make@gnu.org.

Jan

