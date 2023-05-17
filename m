Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456897063FF
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 11:21:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535837.833877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzDL0-0000Ot-Jt; Wed, 17 May 2023 09:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535837.833877; Wed, 17 May 2023 09:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzDL0-0000LU-GX; Wed, 17 May 2023 09:20:50 +0000
Received: by outflank-mailman (input) for mailman id 535837;
 Wed, 17 May 2023 09:20:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzDKz-0000LO-7C
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 09:20:49 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2045.outbound.protection.outlook.com [40.107.13.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b18923b-f494-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 11:20:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9638.eurprd04.prod.outlook.com (2603:10a6:102:273::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Wed, 17 May
 2023 09:20:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 09:20:16 +0000
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
X-Inumbo-ID: 1b18923b-f494-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJBTe2TMYKC1qsZKjNntHlIfGjTBaGp+HwLRsS6ovd1tkmvLsxaVVShNN5tDZUnOYHIOCFNbhIeDEnMIIMSsd8x2m+jD+F0N/oK+GwWnu2rnZXTqAOXTkhqmyp9ULVUslHGfmETRtlh5qLQ6JjTRz9QeqkMhwkLIA9x5R6d0S1Qs+Yy6Ux/w3o/IEFXcLdwSCO5ZCFC+E8jhmG6fLTd7f17ODhH1ppvGAnujpxDk2f9PoPT6Sj5mYsqzGdL7vxsgSe3+LDBdHI8muamRa8QLp4cCiaV+YALOptBa+xRux9AlspTHVWZOTgJqgCeIa8mWFaymA4WnHg8IVLQQVxA3dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGbu0+1oMNgp65PCtVCXEk10tNXbQ0sRu9AHOVhCyQA=;
 b=W18b2DxPyLpxpJHE2a1SQoYMQTc2vWAhRHeS2SOEBJ/6SxIM0mLzGiCNAKpRiOAvPxo0trMnpAeIsBl1f4eUOL4iV54nCNTPpz5voPigGKHLCRVdeOYKj/VnAOlzSgsZSdKubJEzOHKMek08e+y4Fc8qVIsHyaQegXHR3zudTFdj8TvkBUd+mUJVvM62eKbxOuIQzvHA8kFfcWQHTUyzocSC4mFOGjgPv1tPcnMqgKzrFoxh7l6bboouBlgnWFdVoUyy4Ip3oVQI1e2t4D9tFSgYOtBPpfCL+6LWaEUIY4hs8uRSHFzLIzaQ23QXBzkySxPoDlp1zr0MZymr4pRBoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGbu0+1oMNgp65PCtVCXEk10tNXbQ0sRu9AHOVhCyQA=;
 b=JnCcvppf3A/dzP0WpXZTO54Z559mwYq5mSQANx1SsHZCanzvSUr1hjdrSivYK/0937ovtLK9F2zj00D0gaVrVwbmOEK+SJb1dGJKR3T4GKkdoKyntzF/OZfMlg5pWqdX22vf5jWBeEIf2IlZ1Oh62b5Zz8soHTZG4kLu2ol95KyLCOcHiTghKEvTQEWNvYMa2AiZJiRlC+MHAKH0zrERbdrJtNAKL0eH5U7LbfUafRpH6tZ0u+NkWhCzKx5Q5JsiQa6kqNX8uyyYy9OMLYL4Z9vQnO1DtEVYUgiMsMSYjwle52XSrufv6tfhb2g/XJUjLg9RbJK9lQ8cw5FZRnPu2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a53a77e3-6dcd-2668-0f3c-282de93d8b04@suse.com>
Date: Wed, 17 May 2023 11:20:14 +0200
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
 <1bef2b0e-04e8-2ca0-cf03-f61cdae484a9@suse.com>
 <b1c56e56-90cc-0f37-4c8a-df1217339e59@citrix.com>
 <22a6bd70-887e-da72-ccff-16b3627463c3@suse.com>
 <54b35fa0-160e-3035-6c22-65a791ed2f84@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <54b35fa0-160e-3035-6c22-65a791ed2f84@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0243.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9638:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c96103-34e1-45e8-d6ec-08db56b7ed25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZaCvDjx1ADyGr+grh4I+rw8A0QJTQOlNtNMSFwi05/sVr8gctEmqQglfoVnpopYdP7UwhMomhlhSb+hbmIJEmQmSpHzL2ABtBwNN3EbTuqRXN9sSIxEy9qnh05fCcErSv+v5w7U+7jjDTQkMw4vnX+AZP+WC2V1uLvAwNKp/A18WGnNsgaO64ONZVXvTXanweMBNvF24cSfckAFseSMCUR0KHUeFimkCjmLAOXuxxIEKYGLOJOqyM0y23jgkRax4HTQBQ9C8G0emh3GQW+cAYWam3f923WiyXPhdTfBg4fFMsZDSM7TrXWQJ30nkPpUlSLNjG/Z2+qGNjExj1ZD8jne9A5EJ4MXY1hibC5lH5+eykOoX6QyaElmjHHUN8QOBOUTdZFgMGZdRgy63vSnIlp1sv/kCyqvnIdWQrYBn1DF3ppKNBkB5ZOrNbW9IMx1UweyzfexAXzv+nDD5N//+97hnZ/N6EkNV1Fijp+bOOhFQyHwYFTD5wb+SCzDlmUds1hf6BG6zWaiqLaGpHPOZUUwG5JTfpCHzmSHVdQZYukN9IKIdPV89LwJswFvf/LRw8tnF90XJ2OOtNbbDApy3tGbUCjNKxvb8KurQlu4RzRcfycqIUyx/iNR3LrBTSyvbGDllaOA7kuZ/M/Z8cZNeug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199021)(41300700001)(478600001)(186003)(26005)(6506007)(6512007)(53546011)(66946007)(4326008)(66476007)(54906003)(6916009)(83380400001)(2616005)(31686004)(6486002)(66556008)(86362001)(5660300002)(316002)(8936002)(8676002)(2906002)(38100700002)(31696002)(66899021)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0d4Nm5Gdlo0bHFTUms5bWVWVE0vRHVwa2xHWEpVQmtPS0VCb0RseFNXMzVv?=
 =?utf-8?B?U2cxS25ibjJzVy9oU1NYVk9GNE1KTnRvOWk0MEVBMFlTT1IydFdTQUxyMys5?=
 =?utf-8?B?aDg2MTJ5WVhCMkxPZ3VGSmRhY0JtUlo1UnErVWZXOExjTDkrSXd6VHNSYUth?=
 =?utf-8?B?YVhGckRSRm9NWXkvVGZuUiszTDNUdGZQNUFtVFBwaTRWUnhqcUoySmg1VDcz?=
 =?utf-8?B?SnVieXNCM0hOU3VlQk1nZnRlcWxxSXBDb2ZoR00zZlQzTDQvb3RMelNQNEVq?=
 =?utf-8?B?c1BGckVBYUdtREFJTWxCRGNhclNIaVRCdk5ZcmM2alhCRkY1QTdjRGZPUU9J?=
 =?utf-8?B?bjg3YmJoaHRyWTE1Z3lEY29tNjZvMS9lSGJ4ZmVPekw4TElOZnpSeUxYKy95?=
 =?utf-8?B?YXFvaFZBRytSWkpzSjNFeGFHNmdFYTZqUyt5cHM2Wkd0OXFrSGxKdG9uZ3k2?=
 =?utf-8?B?amRaRUQrS0pNWFkzYmt0bWRpRkVtRWhlRXU1eE51OUk4djBDZzFrSFdBNHM2?=
 =?utf-8?B?bWdYWngzcEY1MnRQdUp3czBBVTBKaGI2ZW56cmdsdUZ2OGVPTUx6MTZOcGZm?=
 =?utf-8?B?UUdPQXIxTExNajZUQkY4SUUrUmxyb1k4RCsvVHVuN1M0STh6Q2F6SEp4TkEr?=
 =?utf-8?B?OHJuRUt0UEI5UmFMK3pzQzU4TGVJN0FTZUJ0dzEvcWxacVdzNi9zUGFITTFI?=
 =?utf-8?B?Z0k1VHhHVElvRXRVMWVmZ1hzbFhTYlpXT2MzUjMwaUl5S3VHTkFFWlZpTy9j?=
 =?utf-8?B?dC8remRBUUZmRE04bHdTaTVyRkRjTXJPU0VaSDRMbDFuK082KzRMU1NoQnln?=
 =?utf-8?B?U25rTk8xVEh2YkVJemlDeFVkRGZuYncxdHN2bjdJYjhCVGszSjNuUEpMODlJ?=
 =?utf-8?B?UnNIcGo1ZFhnUDVkKzdNK1hlQk42YjVtbGVzazNaWUwyWWFKTm5LcGEydHh4?=
 =?utf-8?B?Ukd4UEFoVkFMbmhOQmxkMnhIalpldk00T3pRcXd2ajNyUGN6UFd0cmNtYzlK?=
 =?utf-8?B?L0lkOTFJQ0xpVG9YYWszWjdkaHdaM0FoTGVVamx1TmNyOGt0cGJibjV6MGla?=
 =?utf-8?B?cmhka2ZlRFZnN2FCRmVoSFZIbTJnbThGWEVhcE82NDR4VENPdmVtTjZRNXpx?=
 =?utf-8?B?bzFyd2RWeEJaNlhYVUkwYUt3bXUwcjQ3MUw5Y1JwRFUvOGhxdXAveGpJbi9s?=
 =?utf-8?B?eERiMytHbEUvQ3BhN3o0b2JEQUkzWGV4NHQ1bHJtN0NqdjlkRHVxT2wxTDBx?=
 =?utf-8?B?N0ppYVZFWS9IYXlKODgwQy9sa3BVR1RleGNVbUlUbU1WaDRhRStLVDJVbkUy?=
 =?utf-8?B?M0tZZnZiSE5DY2k4MG0ydmlCOElrbitiOE1uNXdUNmdDaExPbEVGVmVmNEUr?=
 =?utf-8?B?T1E3NVFoZFY3TGlkYkMrYVZidUpBMUhBNFV0MW5ONC9CQURWQVJpdXlKL2JM?=
 =?utf-8?B?Wm16U0J1ZjAxVE1KMjBNR2dkT1NRbXh2UmY5YlJXdFZiSHh1VzFiNmJWRC84?=
 =?utf-8?B?VVJseGRBNFFHMjJrYTRmTjFBZC9IN051bDNtUXRKTHRpdU9PWFJBM3cwTjdN?=
 =?utf-8?B?aGozRC9RaURNL0VId2tmQk03V0c4bFh6dUF2K3hJZC81WERRc0tkRGVjWWxW?=
 =?utf-8?B?Y2cvNktsUFFNQ1N6WlA4NzgwNGU1emJkZFA2dGtONEdleGN6Ry84MHBiWVpU?=
 =?utf-8?B?dm5ETUY0YmR4eHBLeG02MGNtUlAzbU5ySGthQlgwUU0zZVRGVlNTTEhadG5l?=
 =?utf-8?B?RDFBaFprNzYvSTRZa2pKSFFEQzFycjNmOTFpMFpRTkVTU0NoL2k2eEJzZWdk?=
 =?utf-8?B?VmdFc05BV1diWGVwZ21jK0tQSWVSZUErRHZCb0IxZzdxSFJSbS9aZ3VtR2dv?=
 =?utf-8?B?aGRWSnFlT0JpaWUxYjFpRkI0NmFCVWlkZXk4cHdYcUNMQjh3MWRvK0UrWGJz?=
 =?utf-8?B?eFdyYTQ2OTJpOEFCdHIrcXFuQXpMTTA4Yi9rU2ZGQWNlaVJwUWM3RnVUUjM3?=
 =?utf-8?B?UERpbDZraHZSUGt4a04xbzBkL1ZXb0dRS1NoblVuQ1IrcmsyOWVwUy9XZnA5?=
 =?utf-8?B?WE5WVE1zM013YWMzR0xyV091RGhlNlVZK1hVRTVxWEpCakxaY3JzTTRKcnZt?=
 =?utf-8?Q?/Vlr8QqO4/oDe9KdWpfb8tH7L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c96103-34e1-45e8-d6ec-08db56b7ed25
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 09:20:16.3008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yr4Qxnzj+mDUy5lRq8udPLtxj0lG/xOUoFd5sWyzr9HJsKVVfuhs01EriO/u2YaY0PNXUXKdpNLdd1kIkgpZng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9638

On 16.05.2023 21:31, Andrew Cooper wrote:
> On 16/05/2023 3:53 pm, Jan Beulich wrote:
>> On 16.05.2023 16:16, Andrew Cooper wrote:
>>> On 16/05/2023 3:06 pm, Jan Beulich wrote:
>>>> On 16.05.2023 15:51, Andrew Cooper wrote:
>>>>> On 16/05/2023 2:06 pm, Jan Beulich wrote:
>>>>>> On 15.05.2023 16:42, Andrew Cooper wrote:
>>>>>> Further is even just non-default exposure of all the various bits okay
>>>>>> to other than Dom0? IOW is there indeed no further adjustment necessary
>>>>>> to guest_rdmsr()?
>>>> With your reply further down also sufficiently clarifying things for
>>>> me (in particular pointing the one oversight of mine), the question
>>>> above is the sole part remaining before I'd be okay giving my R-b here.
>>> Oh sorry.  Yes, it is sufficient.  Because VMs (other than dom0) don't
>>> get the ARCH_CAPS CPUID bit, reads of MSR_ARCH_CAPS will #GP.
>>>
>>> Right now, you can set cpuid = "host:arch-caps" in an xl.cfg file.  If
>>> you do this, you get to keep both pieces, as you'll end up advertising
>>> the MSR but with a value of 0 because of the note in patch 4.  libxl
>>> still only understand the xend CPUID format and can't express any MSR
>>> data at all.
>> Hmm, so the CPUID bit being max only results in all the ARCH_CAPS bits
>> getting turned off in the default policy. That is, to enable anything
>> you need to not only enable the CPUID bit, but also the ARCH_CAPS bits
>> you want enabled (with no presents means to do so).
> 
> Correct.
> 
>> I guess that's no
>> different from other max-only features with dependents, but I wonder
>> whether that's good behavior.
> 
> It's not really something you get a choice over.
> 
> Default is always less than max, so however you choose to express these
> concepts, when you're opting-in you're always having to put information
> back in which was previously stripped out.

But my point is towards the amount of data you need to specify manually.
I would find it quite helpful if default-on sub-features became available
automatically once the top-level feature was turned on. I guess so far
we don't have many such cases, but here you add a whole bunch.

>> Wouldn't it make more sense for the
>> individual bits' exposure qualifiers to become meaningful one to
>> qualifying feature is enabled? I.e. here this would then mean that
>> some ARCH_CAPS bits may become available, while others may require
>> explicit turning on (assuming they weren't all 'A').
> 
> I'm afraid I don't follow.  You could make some bits of MSR_ARCH_CAPS
> itself 'a' vs 'A', and that would have the expected effect (for any VM
> where arch_caps was visible).

Visible by default, you mean. Whereas I'm considering the case where
the CPUID bit is default-off, and turning it on for a guest doesn't at
the same time turn on all the 'A' bits in ARCH_CAPS (which hardware
offers, or which we synthesize).

Something similar could be seen / utilized for AMX, where in my
pending series I set all the bits to 'a', requiring every individual
bit to be turned on along with turning on AMX-TILE. Yet it would be
more user friendly if only the top-level bit needed enabling manually,
with available sub-features then becoming available "automatically".

> The thing which is 99% of the complexity with MSR_ARCH_CAPS is getting
> RSBA/RRSBA right.  The moment we advertise MSR_ARCH_CAPS to guests,
> RSBA/RRSBA must be set appropriately for migrate or we're creating a
> security vulnerability in the guest.
> 
> If you're wondering about the block disable, that's because MSRs and
> CPUID are different.  With CPUID, we have
> x86_cpu_policy_clear_out_of_range_leaves() which uses the various
> max_leaf.  e.g. a feat.max_leaf=0 is what causes all of subleaf 1 and 2
> to be zeroed in a policy.
> 
> 
>> But irrespective of that (which is kind of orthogonal) my question was
>> rather with already considering the point in time when the CPUID bit
>> would become 'A'. IOW I was wondering whether at that point having all
>> the individual bits be 'A' is actually going to be correct.
> 
> I've chosen all 'A' for these bits because that is what I expect to be
> correct in due course.  They're all the simple "you're not vulnerable to
> $X" bits, plus eIBRS which in practice is just a qualifying statement on
> IBRS (already fully supported in guests).

Right, upon checking again I agree.

Jan

> The rest of MSR_ARCH_CAPS is pretty much a dumping ground for all of the
> controls we can't give to guests under any circumstance.  (FB_CLEAR_CTRL
> might be an exception - allegedly we might want to give it to guests
> which have passthrough and trust their userspace, but I'm unconvinced of
> this argument and going to insist on concrete numbers from anyone
> wanting to try and implement this usecase.)
> 
> But there certainly could be a feature in there in the future where we
> leave it at 'a' for a while...  It's just feature bitmap data in a
> non-CPUID form factor.
> 
> ~Andrew


