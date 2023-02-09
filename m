Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F01E69020F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 09:24:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492221.761663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ2Dg-0006GS-Ed; Thu, 09 Feb 2023 08:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492221.761663; Thu, 09 Feb 2023 08:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ2Dg-0006ED-BP; Thu, 09 Feb 2023 08:23:52 +0000
Received: by outflank-mailman (input) for mailman id 492221;
 Thu, 09 Feb 2023 08:23:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ2De-0006E7-Cm
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 08:23:50 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12e294f3-a853-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 09:23:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7415.eurprd04.prod.outlook.com (2603:10a6:10:1aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 08:23:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 08:23:45 +0000
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
X-Inumbo-ID: 12e294f3-a853-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgiMCKGz8LMNIXI0+nAQBUVH488RTAPjgc7T9KVqoGipERBegv20iWr1YuMhZyIv9FKM+d6yrk8WorxWYQREW81tb/RPy1hmPLsUt9A8P/RuEGJkSyF81ZlQHUSv2w9J1UpwQkX5GvieK4P6S/IVf1GE7PSGOXQnLz7+R5tcfFsyVB/W8c7HTH8lZM47swJYx9mNw3bfTzOPmfg338oUSZjbmtggePWxe5cq/ZJ8eiiDVbIQc1kC4lC49Z7hhA05d0djISboJOkO7qxeNjwo5vNfjV2/8DAL7R7Rqi8JrmdJ54zL7Zq2WoQYId59aWRXGpViT7wpdJS9F6R/GUyPsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MSLTr5bJCc0vZPXbtdi9LRKuhnsxihgxdpYrsAZF5s=;
 b=R1zdywdUPgnkqE56gNH+VVk8VSe/lRRQHHT9JKEbkGJ6hqYpf6bSpyN3ksUCYGXhjE+EvHXoXNcH5MbcM+Xca4P/7JHTTBjU4GjHE3hjmjn5piUq3O9URudf3EgAHiD7UGLYKh/JAodkpBhfTsQR/nstroT6YGCHWPE3ZGL4/nPxMmxRBP5dBoS2mRsy1QZN/UDNgMHNmlI5PXhlDIXoVCkAHE37kYefjWuw67fl0GogmVsRVv8FDpGgLJNSnRJfYLGEtqV7t6MdQ//V9DFUpB6/ZKZ6IlGjoSXMQm7wQxSP2ss0pSBWd6GOvimSgZ44pciBRkbGnobDWNzkAwX10w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MSLTr5bJCc0vZPXbtdi9LRKuhnsxihgxdpYrsAZF5s=;
 b=liDxfVMwnyNOd/2rzqF5/IPj5DT/u97jdcpkOjE4m3WHV64Qb8EXNb1tkwf8dq4t/pwHs9m+BUHSz6fmv+2jxWUsDr7TFlg5SucWXpufEEvGZO0g2Y/fUN71K7tBd8TakkVSwyASXi+vB8nuC6CNnRiE++m62XuPSiKvmPCEf3b026U6mppS1pqQjxF1iOsytO7i3D5tNwMq5V41hx5ONhCcOLgSsFoP8/1K1N9mpONh/y2e2P+bIXSSRVG44Hu7Ufffjuv7HZPdFz99wFjk90J/g+eJTpG7H+P2U9Tony4WLB0Zw3CUbf4aNPzDR9k5tzifGK6jN4NIHlSne2tI8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16bf6ab7-6130-a851-2546-7bea5b64ee57@suse.com>
Date: Thu, 9 Feb 2023 09:23:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH] tools: Have flex and bison mandatory
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20230207160948.3169-1-anthony.perard@citrix.com>
 <a11b962e-7422-a197-4ff4-fcac9963364d@suse.com>
 <Y+KSRY+5SmrNYpJ/@perard.uk.xensource.com>
 <7e01f840-1d42-f31e-4471-ee06820b4b31@suse.com>
 <Y+PvFfDQU5GXV57m@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y+PvFfDQU5GXV57m@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: d83cbc81-b93d-4c54-8b39-08db0a76f63a
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EzNNV+9UHTFf3uo9a0Hsc/2Z8qX5CWo7SMVWZbKggXpm3iDhOEY+K5V6bLbwmz41aWuHrr9zVfiwCLSRBg5rO031Im1ZKnMrTvP5tbES1fqeapJVDibQCr86FJqQEXUvn78SKzC3LzPFngGM4S+b5gN3nzTLj45ZVBvwdzBtAmr7AHYuVuDth9chrMeJAcXIZteteaIa6PBZ7V12dUmJSeLKbbKanGeD7VNbNhIg64NYbe62BlgYukEI5kR2N7yNlSPh/ccg2aplylHFGYnTeRZOjefz3h++YTatFve8u6rNiTFPcmqumCUiEBttuudTF+lzTRnZiNn5jgNF3XOtGgFz/p4Wecu8KVgD0GLxwxvbUdZPU58rIUpO+NZOWuUbRvvoqMK+s4A4MaelmKVUFgKKhPP6h02Y7H7rQdb81zXittv7qO3hljOQaLr3TSaCxbMbyk5SvBdhcabYtPtojnoltRRjEW+ItUjfeGZaKHeJ1HTPLeqEDDqOsCwBJvF3QffciBeSPU4/RcnrY0oMW05aXKo5ezj6yUQgzTFPRJ0OGPys9CmpNg7TsuDWcMwDHxLwIet9j5TPQKU6iZT+BQZpHqTor3dmteIThDGfjSlaSIHOdo7xrEOoiDtR3Rv+HUfuWLSZaDWyG032jONfxmIdIJ6fehRJ4QjvEvvmDOVtWdxnX4UDlDwpfGMrlWsMO9hUB4ta7S18cagE+RAECuZee2afSUD0rPX+X89D3Tc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(136003)(366004)(346002)(39850400004)(451199018)(6512007)(186003)(2906002)(53546011)(6506007)(26005)(36756003)(5660300002)(478600001)(31686004)(6486002)(8936002)(41300700001)(2616005)(66899018)(8676002)(66946007)(4326008)(66476007)(83380400001)(66556008)(86362001)(31696002)(54906003)(316002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1dDdExyZGxwWnFGUm80dzhjTjBDQlh1eThKcFdlaEhoVEI5NE00RDArVjBh?=
 =?utf-8?B?ZHNtVTk3YVhEdElMWUQ3NzdlZ09Fb2I3N1dTNW1abWxzenBVc0YzV2Q4REU2?=
 =?utf-8?B?L3k5WFhmdUd4d0g1ckxlVFo0Y1hsMFJraUIzMnNOR1AwdnVRa0ZNeFRncUk5?=
 =?utf-8?B?RVA4OTdSMEptYWZlTElwNWwraUZRVWJCeVp1ajlQTjNpNi9hNHA5VWx3SkVm?=
 =?utf-8?B?ODBlVU0wWE5zb2szVGFoWFcwdUpNMDVVTERMaElMdzc3bFdCS2o4L1k1SjM1?=
 =?utf-8?B?YkpuNkl2V05tc0ZVN0c2YWRhZkErdm9wRnZQWmJRRXRYWmdFajZUeXVLM3RQ?=
 =?utf-8?B?MWpjTm5ZVHM5ek5JYmFjWnY0clR3YWVjSWRzYXZPdmpMeFJmSFNCZFJNK2dU?=
 =?utf-8?B?SnVYd0hwUm1ldXp6VlpNaXlJVS9DM2FvNk1KOEZNZHZhTGUxY2pSd0ZaWjF6?=
 =?utf-8?B?OG1ic3pRK3VYNXduSWdtVlNOVFJ0UFNkbDAzcFp4OVhXQ3B4bFJybmU4Y1Vq?=
 =?utf-8?B?MVZ0RTRERnBDOVUzYlZPbEoxV0UvbDFJQTduSDI1UDNaZHhmNm56Y25tSFRB?=
 =?utf-8?B?aEsyVFMxRUVWazloQkR4OWV2ckZ0blIyUDdCTzlBQVRJd2tZMC9OMGhKMjR4?=
 =?utf-8?B?SEcwNitST3RGY004RENTeEVYYU1OVU8rZ0RzQytiNVA3YWNrbnArK2U5QW1O?=
 =?utf-8?B?STQvT1RUVWJHWHowd3E2WUQvSFBwc3NzK1ZndFo4eUZybGg3REtiaElCbVZi?=
 =?utf-8?B?THN3cTZueVNLWEZLd0s3NmtXVmtPRUJSRUprVEVobkRUWUp0YjR1czRqa1FB?=
 =?utf-8?B?am5FcUJsNDFhY1gwU3JLNkdIOHB4UVdVY1RnTS9Iak43TUFRb0ZwS0NrSzk5?=
 =?utf-8?B?VmtBeWJKdElBUmlwQVhwd1JhZHBVTlJJMWJ0Vmxwbk1ibFJPS1RqbXpSTnM3?=
 =?utf-8?B?MFh1eEs3QU84aXJlajg5QXBtZkw1QnNnZTNWN1pqaTZOL09BN294SmJXNURI?=
 =?utf-8?B?dkxRWlJ1a2pTeHBwUnQvS2Y4MXVFNngrVlVmeUlTcXlPWHdJWDlYUURacGRM?=
 =?utf-8?B?K1Z4TWU3dWVlV0orNWdEaTdqcXphbWR2RkgvL0FjSXJ5K1RiQjA2Sm1WdWth?=
 =?utf-8?B?REJwNWhlMUVHV3JqUWdkT1pad2JYdUM3V0RhZ083dXkwY0ZFM0tCOWl0STdm?=
 =?utf-8?B?eVVGaXN6eWc3eVZvOU90ZE1SOXI5M0JBWS9WSjdwWVorMXJEQ3k3QlRCNFNm?=
 =?utf-8?B?dmtZV3hkeWgwRnozbGhuMFVzNFFxenpURG1BbW9lbEFZNkx6Q0cvUFllMEtl?=
 =?utf-8?B?eGRqKzhROU1oMTQxdjBZa1JIYm03UTAvRmtyRysrNXB0c0pTQkVOeHRDdE9r?=
 =?utf-8?B?RVJMZ2xnRUZka1VKZ3YzbVFKbjJuZWJVNStKS2IzdkhIYWJkWGdNdTQrM0ZM?=
 =?utf-8?B?RHlPeldLZ1Y1ckREZUVWeGlTQ0x3K1A5Ym42NExIS3JEbHhNd05yTTl2QmdL?=
 =?utf-8?B?b0tObnVnSjRMQm9Za0F4dEwwdWVRMjVTbVpYbDBDZ0xGbk9GUkZQb082MVAy?=
 =?utf-8?B?cVhmZGZYamZiaXp0MW5XQkJxV1hHM0k2NURTRlg1NUVic1l0Ukd5dXBZZUVh?=
 =?utf-8?B?djRVZC9FOW53eEEyY2E0aWMxYmhpSExGNUpkUzZTaWFlSTRRZTBZcGFWNG1V?=
 =?utf-8?B?OHhPT2dOZDVSbzNIc2xnckJJaXNoOFMxNmk4RElNSkFCK2R4M3V4N213WG5J?=
 =?utf-8?B?ZkNYVEpDRWRZSHkxMlo3U1FaZlhwaitPcmU3eGhLbWR1UlpWR3hHSCt4ZUxJ?=
 =?utf-8?B?eGxIUENYS0grYnpvT2NhNUIyaWZPSWVWOUE2V1ZDVUFRZExMU2VtNzFXSDQ1?=
 =?utf-8?B?Um5IcGQ5WEw3VkRiQ2tRWTdTcUVyS1VWOHNaUThvNEFkNlhJc2xjb25ObHIz?=
 =?utf-8?B?VTVIY2xZTW5BTW1IaHR1T0RaMmxTSkZGbmxYQU9OTitORU0wT2JpRUl5cVdr?=
 =?utf-8?B?SnRucnZzUllmSWVqNHprSGllM1pLVndlU09DeDJGRWd0NVdNMHR2NWMrQTk4?=
 =?utf-8?B?WTRQOVY4R2x2NXgzVVl1Z1JIRy9qRWFCSktQM05qWjVqKzhyb2FvazN2M0Uv?=
 =?utf-8?Q?ZDigUug/+RJLWuR2ebr3KO6a3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d83cbc81-b93d-4c54-8b39-08db0a76f63a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 08:23:45.8382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /RiGHgnvar2EHZ9wyXXM0GNWmGfuikxzryPX+ZyI4975cCtJ6EF4ewZCUXCNUVhZKHvpnIl473KksqkquFV4kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7415

On 08.02.2023 19:51, Elliott Mitchell wrote:
> On Wed, Feb 08, 2023 at 09:02:35AM +0100, Jan Beulich wrote:
>> On 07.02.2023 19:02, Anthony PERARD wrote:
>>>
>>> I think the issue that Andrew saw in the CI with "libxlu_cfg_y.o"
>>> failing to build while "libxlu_cfg_l.[ch]" are been regenerated is
>>> probably because make doesn't consider "libxlu_cfg_l.[ch]" as a group of
>>> targets.
>>>
>>> If for some reason we have:
>>>     libxlu_cfg_l.h newer than libxlu_cfg_l.l newer than libxlu_cfg_l.c
>>>
>>> Then make seems to take two parallel decision:
>>>     When building libxlu_cfg_y.o:
>>>         libxlu_cfg_l.h is newer than libxlu_cfg_l.l
>>>         -> libxlu_cfg_l.h is up-to-date, start building libxlu_cfg_y.o
>>>     When building libxlu_cfg_l.o:
>>>         libxlu_cfg_l.c is older than libxlu_cfg_l.l
>>>         -> we need to generate libxlu_cfg_l.c first
>>> Then, libxlu_cfg_y.o fails to build because libxlu_cfg_l.h is been
>>> updated do to the parallel build of libxlu_cfg_l.o.
>>>
>>> I can easily reproduce the issue with:
>>>     touch libxlu_cfg_l.c; sleep .1; touch libxlu_cfg_l.l; sleep .1;
>>>     touch libxlu_cfg_l.h; sleep .1; make -j
>>> And having "sleep 1" in "%.c %.h: %.l" recipe, between `rm` and `flex`.
>>
>> Interesting. In my somewhat similar experiments I found that an issue
>> exists only when one of the .c files is missing. Things looked to work
>> properly when both were there, but one was outdated. Clearly that's
>> yet more surprising behavior than, as you appear to observe, the issue
>> simply being tied too "needs updating".
> 
> The actual problem is flex and bison output both files at the same time.
> One process sees all of its prerequisites are up to do and therefore
> proceeds to the next step.  A second process sees an out of date
> prerequisite, and starts to run flex which wipes out the prerequisite of
> the first process.
> 
> 
> Crucially libxlu_cfg_y.o does NOT depend on libxlu_cfg_l.c, therefore GNU
> Make is allowed to proceed with building libxlu_cfg_y.o even if
> libxlu_cfg_l.c is out of date.
> 
> The problem is the rule to update libxlu_cfg_l.c ALSO updates
> libxlu_cfg_l.h as a side-effect.
> 
> 
> As such libxlu_cfg_y.o needs an order-only dependency (assuming GNU Make
> syntax is allowed) on libxlu_cfg_l.c, so the two rules DON'T run in
> parallel and cause havoc.

Since you keep referring to this: Yes, GNU make syntax is allowed. We
use pattern rules, which themselves are an extension of the original
suffix rules. The issue is that we can't (unconditionally) use stuff
which was added only in newer versions of GNU make. (See ./README
both for a statement on us requiring GNU make as well as one on the
minimum version we expect to be in use.)

According to my reading, an order-only prereq isn't what would help
us here: "Occasionally you may want to ensure that a prerequisite is
built before a target, but without forcing the target to be updated
if the prerequisite is updated." This isn't the situation we're
dealing with, I would say. We want the prereq updating to occur and
the building of the dependent target to be deferred until all the
prereqs were updated.

>>> I don't know how to properly fix this yet.
>>> Event writing "%.c %.h &: %.l" doesn't work, with make 4.3, which is
>>> supposed to be grouped targets. But that's is maybe fixed in 4.4.
>>
>> Well, in my tests while 4.4 has fixed one issue with intermediate files
>> affecting the behavior here, the issue we're possibly running into is
>> still there. I've sent an inquiry to bug-make@gnu.org.
> 
> I do not believe this is a bug in GNU Make.  Merely double-output rules
> cause precisely this sort of trouble in Make when run in parallel.

I suppose it can be viewed both ways: Make has all information to know
that the file _is_ going to be touched, so it _could_ order operations
accordingly.

Jan

