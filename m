Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E720519E17
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 13:33:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320610.541434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmDFK-00011N-LQ; Wed, 04 May 2022 11:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320610.541434; Wed, 04 May 2022 11:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmDFK-0000ya-Hn; Wed, 04 May 2022 11:32:42 +0000
Received: by outflank-mailman (input) for mailman id 320610;
 Wed, 04 May 2022 11:32:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uvlq=VM=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nmDFJ-0000yU-3o
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 11:32:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id e743f4c6-cb9d-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 13:32:39 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C87C312FC;
 Wed,  4 May 2022 04:32:38 -0700 (PDT)
Received: from [10.57.2.7] (unknown [10.57.2.7])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 392E43FA50;
 Wed,  4 May 2022 04:32:36 -0700 (PDT)
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
X-Inumbo-ID: e743f4c6-cb9d-11ec-8fc4-03012f2f19d4
Message-ID: <bd3e9229-c41c-841b-104a-505446cdae3b@arm.com>
Date: Wed, 4 May 2022 13:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] xen/arm: gnttab: cast unused macro arguments to void
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
 <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20220428094625.382970-1-michal.orzel@arm.com>
 <074a5ae8-cade-3343-0c18-8122c85fecc3@xen.org>
 <87eb6f25-c940-8aa2-bab3-dea9bcf1760b@arm.com>
 <fe933877-b995-f3da-2701-ae25a73e49db@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <fe933877-b995-f3da-2701-ae25a73e49db@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 04.05.2022 10:13, Jan Beulich wrote:
> On 04.05.2022 08:41, Michal Orzel wrote:
>> On 03.05.2022 19:44, Julien Grall wrote:
>>> On 28/04/2022 10:46, Michal Orzel wrote:
>>>> @@ -89,10 +90,12 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>>>>   })
>>>>     #define gnttab_shared_gfn(d, t, i)                                       \
>>>> -    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
>>>> +    ((void)(d),                                                          \
>>>> +     ((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
>>>>   -#define gnttab_status_gfn(d, t, i)                                       \
>>>> -    (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
>>>> +#define gnttab_status_gfn(d, t, i)                                        \
>>>> +    ((void)(d),                                                           \
>>>> +     ((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
>>>
>>> I share Jan's opinion here. If we want to evaluate d, then we should make sure t and i should be also evaluated once. However, IIRC, they can't be turned to static inline because the type of t (struct grant_table) is not fully defined yet.
>>>
>> Then, we could do like this:
>>
>> #define gnttab_shared_gfn(d, t, i)                                       \
>>     ({                                                                   \
>>         const unsigned int _i = (i);                                     \
>>         const struct grant_table *_t = (t);                              \
>>         (void)(d);                                                       \
>>         (_i >= nr_grant_frames(_t)) ? INVALID_GFN                        \
>>                                     : _t->arch.shared_gfn[_i];           \
>>     })
> 
> Please avoid underscore-prefixed names here; we've started to use
> underscore-suffixed names in a few macros.
> 
> Additionally please consider using typeof() instead of spelling out
> types. This may help to avoid surprising behavior.
> 
> Finally, instead of merely casting d to void, please consider using it
> in e.g. ASSERT((d)->grant_table == t_), which ought to also take care
> of the unused variable warning. After all the explicit passing of t is
> only an (attempted) optimization here.
> 
>> However, if we start modifying the macros to evaluate args only once, shouldn't we also take care of the following macros in this file?:
>> gnttab_set_frame_gfn
>> gnttab_init_arch
>>
>> I'm ok to do these changes but I'm afriad we are losing the origin of this patch as we are focusing on macros not related to the issue.
> 
> Indeed - I'd leave further ones to a subsequent patch, or make
> conversion of all of the macros a prereq patch to the one you're after.
> 
> Jan
> 

Ok, so I will drop this patch and push a new series containing of 2 patches:
1. xen/arm: gnttab: use static inlines for gnttab_{release_}host_mapping*
2. xen/arm: gnttab: modify macros to evaluate all arguments and only once

Cheers,
Michal

