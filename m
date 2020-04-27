Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57E91BA832
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 17:41:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT5s4-0007PV-4U; Mon, 27 Apr 2020 15:40:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5iRA=6L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jT5s2-0007PQ-MB
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 15:40:34 +0000
X-Inumbo-ID: 6e679fbe-889d-11ea-97b2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e679fbe-889d-11ea-97b2-12813bfff9fa;
 Mon, 27 Apr 2020 15:40:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7DD4DACBD;
 Mon, 27 Apr 2020 15:40:31 +0000 (UTC)
Subject: Re: [PATCH v7 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-9-jgross@suse.com>
 <19f84540-6b49-f99d-805a-e07f56330f31@suse.com>
 <b9ddd1fb-d868-bb69-3b6b-27531beda2fa@suse.com>
 <f7d1f3aa-3a7e-fcb2-3163-5e67756e8452@suse.com>
 <17d65095-a51e-2e00-38ee-7c1c83d2bb99@suse.com>
 <51e0f0d2-f9ce-83fd-79fa-ae4805356612@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <31c7f4fe-847c-96f5-e598-dba99b0bb61a@suse.com>
Date: Mon, 27 Apr 2020 17:40:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <51e0f0d2-f9ce-83fd-79fa-ae4805356612@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Stefano,

On 06.04.20 14:29, Jan Beulich wrote:
> On 03.04.2020 17:45, Jürgen Groß wrote:
>> On 03.04.20 17:33, Jan Beulich wrote:
>>> On 03.04.2020 17:12, Jürgen Groß wrote:
>>>> On 03.04.20 16:31, Jan Beulich wrote:
>>>>> On 02.04.2020 17:46, Juergen Gross wrote:
>>>>>> --- a/xen/common/Kconfig
>>>>>> +++ b/xen/common/Kconfig
>>>>>> @@ -353,6 +353,16 @@ config DOM0_MEM
>>>>>>             Leave empty if you are not sure what to specify.
>>>>>>     +config HYPFS_CONFIG
>>>>>> +    bool "Provide hypervisor .config via hypfs entry"
>>>>>> +    default y
>>>>>
>>>>> My initial reaction was to ask for "depends on HYPFS", but then
>>>>> I noticed the earlier patch doesn't introduce such. Am I
>>>>> mis-remembering that it was agreed to make the whole thing
>>>>> possible to disable at least in EXPERT mode?
>>>>
>>>> No, I don't remember that agreement.
>>>>
>>>> And TBH I'm not sure this is a good idea, as that would at once make the
>>>> plan to replace at least some sysctl and/or domctl interfaces impossible
>>>> (like e.g. the last 3 patches of the series are doing already), or at
>>>> least would tie the related functionality to CONFIG_HYPFS.
>>>
>>> I think that would be fine - that's what config setting are for.
>>> Someone caring about space may not care about runtime setting of
>>> parameters.
>>
>> So right now it would start with a plain hypfs available or not.
>>
>> The next step would be in patch 12 to tell the user he will lose the
>> capability of setting runtime parameters.
>>
>> Another planned extension would be to control per-cpupool settings,
>> which would the go away (possibly functionality being unconditionally
>> available today).
>>
>> Next would be the lack of being able to control per-domain mitigations
>> like XPTI or L1TF, which I'd like to add.
>>
>> Another thing I wanted to add is some debugging stuff (e.g. to switch
>> lock profiling using hypfs).
>>
>> And the list will go on.
> 
> Understood.
> 
>> Does it really make sense to make a central control and information
>> interface conditional?
> 
> None of the above may be of interest to e.g. embedded use cases.
> 
>> I'd like at least a second opinion on that topic.
> 
> Yes, further opinions would surely help.

Any opinion on making hypfs configurable?

It would be quite some code churn and I want to avoid it in case you
see no benefit in configuring it out for embedded.


Juergen


