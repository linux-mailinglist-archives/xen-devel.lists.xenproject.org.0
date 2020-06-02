Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAE91EBD02
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 15:22:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6rT-0006L6-VH; Tue, 02 Jun 2020 13:21:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg6rS-0006L1-V9
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 13:21:46 +0000
X-Inumbo-ID: 01786ad4-a4d4-11ea-9947-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01786ad4-a4d4-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 13:21:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 18356AF7F;
 Tue,  2 Jun 2020 13:21:47 +0000 (UTC)
Subject: Re: [PATCH v2] tools/libxl: make default of max event channels
 dependant on vcpus [and 1 more messages]
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200406082704.13994-1-jgross@suse.com>
 <afc7e988-3b51-bbee-cba8-af30a7605dc4@xen.org>
 <d1b095db-064e-bccf-b55d-d85fecb3045a@suse.com>
 <24203.2251.628483.557280@mariner.uk.xensource.com>
 <fd09220a-7470-4679-ce16-f4553579171b@xen.org>
 <26161282-7bad-5888-16c9-634647e6fde8@xen.org>
 <8a6f6e41-9395-6c68-eae9-4c1aeb7d96e2@suse.com>
 <24203.2546.728186.463143@mariner.uk.xensource.com>
 <24203.2996.819908.965198@mariner.uk.xensource.com>
 <799396b3-0304-e149-cc3f-45c5a46c7c0c@suse.com>
 <c85e15d2-3d3f-7d7f-eb7a-af5270df2e2d@suse.com>
 <b769c6e8-586f-7d3b-1e5d-d5c948ac7971@suse.com>
 <715f6143-38b3-3f70-b9e3-1ac4a240282f@suse.com>
 <08eff8dd-59b2-9f3e-9664-ff126eecd123@suse.com>
 <01ff5111-d5bf-f4ba-6fba-a156b89eaf85@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9e55d7b3-8e5a-49f2-9ed0-059073d63eb2@suse.com>
Date: Tue, 2 Jun 2020 15:21:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <01ff5111-d5bf-f4ba-6fba-a156b89eaf85@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.06.2020 13:23, Jürgen Groß wrote:
> On 02.06.20 13:12, Jan Beulich wrote:
>> On 02.06.2020 13:06, Jürgen Groß wrote:
>>> On 06.04.20 14:09, Jan Beulich wrote:
>>>> On 06.04.2020 13:54, Jürgen Groß wrote:
>>>>> On 06.04.20 13:11, Jan Beulich wrote:
>>>>>> On 06.04.2020 13:00, Ian Jackson wrote:
>>>>>>> Julien Grall writes ("Re: [PATCH v2] tools/libxl: make default of max event channels dependant on vcpus"):
>>>>>>>> There are no correlation between event channels and vCPUs. The number of
>>>>>>>> event channels only depends on the number of frontend you have in your
>>>>>>>> guest. So...
>>>>>>>>
>>>>>>>> Hi Ian,
>>>>>>>>
>>>>>>>> On 06/04/2020 11:47, Ian Jackson wrote:
>>>>>>>>> If ARM folks want to have a different formula for the default then
>>>>>>>>> that is of course fine but I wonder whether this might do ARMk more
>>>>>>>>> harm than good in this case.
>>>>>>>>
>>>>>>>> ... 1023 event channels is going to be plenty enough for most of the use
>>>>>>>> cases.
>>>>>>>
>>>>>>> OK, thanks for the quick reply.
>>>>>>>
>>>>>>> So, Jürgen, I think everyone will be happy with this:
>>>>>>
>>>>>> I don't think I will be - my prior comment still holds on there not
>>>>>> being any grounds to use a specific OS kernel's (and to be precise
>>>>>> a specific OS kernel version's) requirements for determining
>>>>>> defaults. If there was to be such a dependency, then OS kernel
>>>>>> [variant] should be part of the inputs to such a (set of) formula(s).
>>>>>
>>>>> IMO this kind of trying to be perfect will completely block a sane
>>>>> heuristic for being able to boot large guests at all.
>>>>
>>>> This isn't about being perfect - I'm suggesting to leave the
>>>> default alone, not to improve the calculation, not the least
>>>> because I've been implying ...
>>>>
>>>>> The patch isn't about to find an as stringent as possible upper
>>>>> boundary for huge guests, but a sane value being able to boot most of
>>>>> those.
>>>>>
>>>>> And how should Xen know the OS kernel needs exactly after all?
>>>>
>>>> ... the answer of "It can#t" to this question.
>>>>
>>>>> And it is not that we talking about megabytes of additional memory. A
>>>>> guest with 256 vcpus will just be able to use additional 36 memory
>>>>> pages. The maximum non-PV domain (the probably only relevant case
>>>>> of another OS than Linux being used) with 128 vcpus would "waste"
>>>>> 32 kB. In case the guest misbehaves.
>>>>
>>>> Any extra page counts, or else - where do you draw the line? Any
>>>> single page may decide between Xen (not) being out of memory,
>>>> and hence also not being able to fulfill certain other requests.
>>>>
>>>>> The alternative would be to do nothing and having to let the user
>>>>> experience a somewhat cryptic guest crash. He could google for a
>>>>> possible solution which would probably end in a rather high static
>>>>> limit resulting in wasting even more memory.
>>>>
>>>> I realize this. Otoh more people running into this will improve
>>>> the chances of later ones finding useful suggestions. Of course
>>>> there's also nothing wrong with trying to make the error less
>>>> cryptic.
>>>
>>> Reviving this discussion.
>>>
>>> I strongly disagree with your reasoning.
>>>
>>> Rejecting to modify tools defaults for large guests to make them boot
>>> is a bad move IMO. We are driving more people away from Xen this way.
>>>
>>> The fear of a misbehaving guest of that size to use a few additional
>>> pages on a machine with at least 100 cpus is fine from the academical
>>> point of view, but should not be weighed higher than the usability
>>> aspect in this case IMO.
>>
>> Very simple question then: Where do you draw the boundary if you don't
>> want this to be a pure "is permitted" or "is not permitted" underlying
>> rule? If we had a model where _all_ resources consumed by a guest were
>> accounted against its tool stack requested allocation, things would be
>> easier.
> 
> I'd say it should be allowed in case the additional resource use is much
> smaller than the already used implicit resources for such a guest (e.g.
> less than an additional 1% of implicitly used memory).
> 
> In cases like this, where a very small subset of guests is affected, and
> the additional need of resources will apply only in very extreme cases
> (I'm considering this case as extreme, as only non-Linux guests with
> huge numbers of vcpus _and_ which are misbehaving will need additional
> resources) I'd even accept higher margins like 5%.

IOW if we had 20 such cases, doubling resource consumption would be
okay to you? Not to me...

FAOD: If I'm the (almost?) only one to object here, I'll be okay to
be outvoted. But I'd like people agreeing with the change to
explicitly ack that they're fine with the unwanted (as I'd call it)
side effects.

Jan

