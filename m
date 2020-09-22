Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF88F27497F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 21:51:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKoJa-0001ey-Bk; Tue, 22 Sep 2020 19:51:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKoJY-0001en-Jv
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 19:51:00 +0000
X-Inumbo-ID: 48b91d4b-ddeb-4c40-8ab3-32b1c5c5c4be
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48b91d4b-ddeb-4c40-8ab3-32b1c5c5c4be;
 Tue, 22 Sep 2020 19:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600804258;
 h=from:subject:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=aJ9V1VUtrI37FiyR5VuZZVJohz4gYpSfU2kUB4HDJRQ=;
 b=WHeY9Q9/S2oVnQOIXT8PdSG34Btt/sSmLkFbppEfX4glOkifKXC6GQ3H
 vRyVRjfNoLQjrYJ4be70Gv8eKlV9NOvv0iim9kjP7reOk20bW+NmpYS5v
 C9gqosT/TAlzoexU0+WQR4tpwjPVNF3+XvU+HR15wwA6sOkUoj1OVIC3G k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3IlLHUj8sE+3HMVGKzsZAwq+eakMh990WNKCIJwutCRMzHaqhr8Fc0r4zSsY1gRDJWbj9wU425
 BDQPdeT50MaRCEICvvng+4h42XPygedQnxKTjRDgVRSbG7Zp99cMvwTLYZW9y41NHzu/LM/u+/
 kqD10KIl1sS6L6J9xPGL84MT+KUMEKDqJPQSqiJQrFA8X/lXHzPD9SgDZHqxnWoEpTZYsVzlUR
 8J5/6R/fEkotQpt1g9XzakF19+b2kcL8s3bQaCHyrFOnyA+gPSkt5Q2gOhYQ8sltYb1tph76W8
 m5s=
X-SBRS: 2.7
X-MesageID: 27590159
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27590159"
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>, Dario Faggioli
 <dfaggioli@suse.com>, Stewart Hildebrand
 <Stewart.Hildebrand@dornerworks.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: xen-devel <xen-devel@dornerworks.com>, Josh Whitehead
 <Josh.Whitehead@dornerworks.com>, George Dunlap <george.dunlap@citrix.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
 <d2973002-86b5-17b7-cbfa-ba235af75ba3@suse.com>
 <CY1P110MB055125447405A5DA2202BF028C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <5b758105ee47638c36ef19eb3804b76ee19020a8.camel@suse.com>
 <CY1P110MB0551518BC91E77341A9A37718C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <960f5e3b5a27326cd18ecb44a96f22bcf94f2498.camel@suse.com>
 <16401afe-9dfc-48d6-1fd5-bcfb519417ad@dornerworks.com>
Message-ID: <200acc10-e907-b271-120d-9778351bf700@citrix.com>
Date: Tue, 22 Sep 2020 20:50:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <16401afe-9dfc-48d6-1fd5-bcfb519417ad@dornerworks.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18/09/2020 21:03, Jeff Kubascik wrote:
> On 9/17/2020 1:30 PM, Dario Faggioli wrote:
>> On Thu, 2020-09-17 at 15:59 +0000, Stewart Hildebrand wrote:
>>> On Thursday, September 17, 2020 11:20 AM, Dario Faggioli wrote:
>>>> On Thu, 2020-09-17 at 15:10 +0000, Stewart Hildebrand wrote:
>>>>>> It might be worth to consider using just the core scheduling
>>>>>> framework
>>>>>> in order to achive this. Using a sched_granularity with the
>>>>>> number
>>>>>> of
>>>>>> cpus in the cpupool running ARINC653 scheduler should already
>>>>>> do
>>>>>> the
>>>>>> trick. There should be no further midification of ARINC653
>>>>>> scheduler
>>>>>> required.
>>>>>>
>>>>> This CAST-32A multicore patch series allows you to have a
>>>>> different
>>>>> number of vCPUs (UNITs, I guess) assigned to domUs.
>>>>>
>>>> And if you have domain A with 1 vCPU and domain B with 2 vCPUs,
>>>> with
>>>> sched-gran=core:
>>>> - when the vCPU of domain A is scheduled on a pCPU of a core, no
>>>> vCPU
>>>>  from domain B can be scheduled on the same core;
>>>> - when one of the vCPUs of domain B is scheduled on a pCPU of a
>>>> core,
>>>>  no other vCPUs, except the other vCPU of domain B can run on the
>>>>  same core.
>>> Fascinating. Very cool, thanks for the insight. My understanding is
>>> that core scheduling is not currently enabled on arm. This series
>>> allows us to have multicore ARINC 653 on arm today without chasing
>>> down potential issues with core scheduling on arm...
>>>
>> Yeah, but at the cost of quite a bit of churn, and of a lot more code
>> in arinc653.c, basically duplicating the functionality.
>>
>> I appreciate how crude and inaccurate this is, but arinc653.c is
>> currently 740 LOCs, and this patch is adding 601 and removing 204.
>>
>> Add to this the fact that the architecture specific part of core-
>> scheduling should be limited to the handling of the context switches
>> (and that it may even work already, as what we weren't able to do was
>> proper testing).
>>
>> If I can cite an anecdote, back in the days where core-scheduling was
>> being developed, I sent my own series implementing, for both credit1
>> and credit2. It had its issues, of course, but I think it had some
>> merits, even if compared with the current implementation we have
>> upstream (e.g., more flexibility, as core-scheduling could have been
>> enabled on a per-domain basis).
>>
>> At least for me, a very big plus of the other approach that Juergen
>> suggested and then also implemented, was the fact that we would get the
>> feature for all the schedulers at once. And this (i.e., the fact that
>> it probably can be used for this purpose as well, without major changes
>> necessary inside ARINC653) seems to me to be a further confirmation
>> that it was the good way forward.
>>
>> And don't think only to the need of writing the code (as you kind of
>> have it already), but also to testing. As in, the vast majority of the
>> core-scheduling logic and code is scheduler independent, and hence has
>> been stressed and tested already, even by people using schedulers
>> different than ARINC.
> When is core scheduling expected to be available for ARM platforms? My
> understanding is that this only works for Intel.

x86, but the real answer is "any architecture which has some knowledge
of the thread/core/socket" topology of its CPUs.  ARM currently lacks
this information.

The actual implementation is totally architecture agnostic, and
implemented within the scheduler interface itself.

> With core scheduling, is the pinning of vCPUs to pCPUs configurable? Or can the
> scheduler change it at will? One advantage of this patch is that you can
> explicitly pin a vCPU to a pCPU. This is a desirable feature for systems where
> you are looking for determinism.

All schedulers, including ARINC, now operate on sched_item's (previously
vCPUs) and sched_resource's (previously pCPUs), by virtue of the change
to the common scheduler interface.

The default case (== thread scheduling), there is a granularity of 1,
and a single sched_item maps to a single vCPU, and a single
sched_resource maps to a single pCPU. 

For the "core" case, we interrogate hardware to see how many threads per
core there are.  There may be 1 (no SMT), 2 (common case) or 4 (Knights
Landing/Corner HPC systems).  This becomes the granularity under the hood.

Therefore, a single sched_resource maps to a single core, which is 1, 2,
or 4 threads.  A single sched_item maps to the same number of vCPUs
(currently taken sequentially from the domain's vcpu list.  Any gaps
filled by the idle vcpus).

The scheduling decision of when and where a sched_item runs is still up
to the scheduler.  Pinning is also now expressed at the sched_item =>
sched_resource level.

~Andrew

