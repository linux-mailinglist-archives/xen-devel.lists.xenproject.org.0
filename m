Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDA2898298
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 09:58:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700723.1094303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHyG-0008Hb-Jt; Thu, 04 Apr 2024 07:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700723.1094303; Thu, 04 Apr 2024 07:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHyG-0008Et-Gu; Thu, 04 Apr 2024 07:57:16 +0000
Received: by outflank-mailman (input) for mailman id 700723;
 Thu, 04 Apr 2024 07:57:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsHyE-0008El-QB
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 07:57:14 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1bf0a47-f258-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 09:57:12 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56e030624d1so1024645a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 00:57:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cn20-20020a0564020cb400b0056dfc8d12fasm2033320edb.21.2024.04.04.00.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 00:57:11 -0700 (PDT)
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
X-Inumbo-ID: f1bf0a47-f258-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712217432; x=1712822232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xTdDxoBhKgoT7PKe7ttJcZ25WYW5UlAapZHtOHQ6iC4=;
        b=SaE19tewJ4kqTPOJhQgtr5hFA2gaOmg+yhbF4QgOEGd8uH6rpkd0TJjhYqlOhTwoTo
         0kV2ul3UvJ6S+qCAhuN7sP8KsfX/JkVvPsQWCljT83ECI+9JP4l+SgtWW1ZCvwP4/Kez
         59moQVCpN33s368K3hGkKnYqAWHfZj0i4btsqRlCbq3wCRkisB/KbeUh3sjFSPaxyXfw
         EZwDMK8AK8RzwC1Dc9sZM5OTIOdhjEeqP8Ib+RGRsSbCw3X37dCn0X+bSSfyjp8lilfU
         ffcj3w9eKArgDhLwdC0cBBP4yi1CrWPXrZNUgNDviplI5ADQ3uL9h504zSAbhUawyysL
         zr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712217432; x=1712822232;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xTdDxoBhKgoT7PKe7ttJcZ25WYW5UlAapZHtOHQ6iC4=;
        b=cKZK7PDKxE64EPWUIDq7FZUhoO2LZQHsvmsQN/ht9yYVF02TG2xoXYWEeVmm9NhdOr
         TgsIdTfmiP/UsA4A31KqOK28A5KgI/pSv+tPMZ+iHJ9cGhfDwl+1tXd/iKS5TOLrDCY0
         IqFx9DwWM4KsPf3JnPm+IjyUUWsM1r9Qayl55Ve0AxCVL2dfnYKO4Rsqu76ku4PiRwdm
         1SDRp2zu6uUrJjQZElxOEHL6Qn4KpVpLN7tFWFYeahFacSCHmQtK8lUUkGK2XXh/BGxz
         HIC5OTxAiByATRZ43jGO+8OjR2tKMwZjsI1jzPIKPfsl4IADX1ansp7OesJ01EKpUf1B
         Jg4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXB3A4YcbcYvhRNCAxxr/pvqMt1jUVPbYy6iHSZUr+0Ye3Ckv4zLEvh9z06zj1sDVzzbDRjiFeSJq5+1/aG0EkiM8/LjMTRym11D4jbkTM=
X-Gm-Message-State: AOJu0Yyy3gxqT12IX5/CeBTYKalEs6lhJRiC8mwX0cg2p1HTbj1z1C9+
	UYRAs/4z0WJq6NjxMP0KktjufEuMhUpiDX9zlN+4DQXuJCR9tLj4WmfhOjXbng==
X-Google-Smtp-Source: AGHT+IHIl6DLIgAUU4FWk4aHa/2Uo7hDrz4fq0iRldv7tfasgATbS8y0pqL64bbkzY9xMiJt2qu4xQ==
X-Received: by 2002:a50:a69e:0:b0:56e:603:9fe3 with SMTP id e30-20020a50a69e000000b0056e06039fe3mr1413054edc.21.1712217431749;
        Thu, 04 Apr 2024 00:57:11 -0700 (PDT)
Message-ID: <95a5629f-0f16-45c7-b81f-ba5ae317b23b@suse.com>
Date: Thu, 4 Apr 2024 09:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
 <2df1e3ef-32c5-45c3-af1b-e9473a4e9120@apertussolutions.com>
 <d86e7a86-cd2a-4b0c-b269-6b4e9b2edff3@suse.com>
 <61945064-38ec-4ea5-9084-a82d3c252b2d@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <61945064-38ec-4ea5-9084-a82d3c252b2d@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 15:27, Daniel P. Smith wrote:
> On 4/3/24 08:05, Jan Beulich wrote:
>> On 03.04.2024 13:10, Daniel P. Smith wrote:
>>> On 4/3/24 02:16, Jan Beulich wrote:
>>>> On 02.04.2024 19:06, Andrew Cooper wrote:
>>>>> The commit makes a claim without any kind of justification.
>>>>
>>>> Well, what does "have no business" leave open?
>>>
>>> Why does it not have any business? Why should a domain that creates an
>>> event channel not be able to inquire about its status?
>>
>> Event channels we talk about here are created via
>> alloc_unbound_xen_event_channel(). IOW it's not any domain creating them.
>> Once connected, the respective domain is of course fine to query its end
>> of the channel.
> 
> I would disagree, for instance alloc_unbound_xen_event_channel() is used 
> in response to XEN_DOMCTL_vuart_op:XEN_DOMCTL_VUART_OP_INIT and 
> XEN_DOMCTL_VM_EVENT_OP_PAGING:XEN_VM_EVENT_ENABLE, which are hypercalls 
> by a domain and not something initiated by the hypervisor.

Those ports, aiui, aren't supposed to be used by the caller for other
than connecting an inter-domain port to the other side.

>>>>> The claim is false, and the commit broke lsevtchn in dom0.
>>>>
>>>> Or alternatively lsevtchn was doing something that was never meant to work
>>>> (from Xen's perspective).
>>>
>>> Again, you have not said why this is a problem. What concern does it
>>> create? Does it open the door for access elevation, resource
>>> deprivation, or some other malicious behaviors?
>>
>> It exposes information that perhaps better wouldn't be exposed. Imo if
>> Xen owned resource state is of interest, it would want exposing via
>> hypfs.
> 
> You didn't answer why, just again expressed your opinion that it is not 
> better exposed.

I'm sorry, but "better wouldn't be exposed" includes the "why" part
already imo: Information should simply not be exposed unduly. For
every bit of exposed information, there ought to be a reason (and
then the right vehicle used for exposure).

>>>>>    It is also quite
>>>>> obvious from XSM_TARGET that it has broken device model stubdoms too.
>>>>
>>>> Why would that be "obvious"? What business would a stubdom have to look at
>>>> Xen's side of an evtchn?
>>>
>>> Again, you have not expressed why it shouldn't be able to do so.
>>
>> See above - not its resource, nor its guest's.
> 
> It is a resource provided to a domain that the domain can send/raise an 
> event to and a backing domain that can bind to it, ie. the two 
> parameters that must be passed to the allocation call.

I don't think so: As per above (my understanding may be wrong), it's only
the other side of the connection which is available for use by a domain.
Over night I was pretty close to admitting a mistake there, but upon re-
checking of the sources I could only find this view of mine supported.
Which doesn't mean I'm viewing things correctly; please point out my
mistake if there is any.

>>>>> Whether to return information about a xen-owned evtchn is a matter of policy,
>>>>> and it's not acceptable to short circuit the XSM on the matter.
>>>>
>>>> I can certainly accept this as one possible view point. As in so many cases
>>>> I'm afraid I dislike you putting it as if it was the only possible one.
>>>
>>> In fact, this commit is in violation of the XSM. It hard-codes a
>>> resource access check outside XSM, thus breaking the fine-grained access
>>> control of FLASK.
>>
>> Perhaps; see below and see the question raised in the subsequent reply
>> to the patch.
>>
>>>> In summary: The supposed justification you claim is missing in the original
>>>> change is imo also missing here then: What business would any entity in the
>>>> system have to look at Xen's side of an event channel? Back at the time, 3
>>>> people agreed that it's "none".
>>>
>>> As stated, you provided no reason or justification for "has no business"
>>> and by face value is an opinion that a few people agreed with. As for
>>> why, there could be a myriad number of reasons a domain may want to
>>> check the status of an interface it has with the hypervisor. From just
>>> logging its state for debug to throttling attempts at sending an event.
>>> So why, from a security/access control decision, does this access have
>>> to absolutely blocked, even from FLASK?
>>
>> I didn't say it absolutely needs to be blocked. I'm okay to become
>> convinced otherwise. But in the description complaining about lack of
>> reasons in the 3-4 year old change, just to then again not provide any
>> reasons looks "interesting" to me. (And no, just to take that example,
>> lsevtchn not working anymore on such channels is not on its own a
>> reason. As indicated, it may well be that conceptually it was never
>> supposed to be able to have access to this information. The latest not
>> anymore when hypfs was introduced.)
> 
> This broke an existing behavior, whether that behavior is correct can 
> always be questioned, does not justify leaving an incorrect 
> implementation. And it is incorrect because as again you have not 
> articulated why the lsevtchn behavior is wrong and thus whether this is 
> the valid corrective action.

Again - if lsevtchn is supposed to be able to access Xen-internal
resources, _that_ is what needs justifying. Otherwise my take is that
it is supposed to only access domain resources.

Jan

