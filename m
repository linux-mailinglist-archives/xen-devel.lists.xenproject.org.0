Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A6C8C815A
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 09:25:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723869.1129006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7rxW-0003ew-0U; Fri, 17 May 2024 07:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723869.1129006; Fri, 17 May 2024 07:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7rxV-0003d5-Tv; Fri, 17 May 2024 07:24:53 +0000
Received: by outflank-mailman (input) for mailman id 723869;
 Fri, 17 May 2024 07:24:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bw27=MU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7rxU-0003cz-58
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 07:24:52 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b5b2cb7-141e-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 09:24:49 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56e1baf0380so4583308a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 00:24:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bea6a36sm11579286a12.12.2024.05.17.00.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 00:24:48 -0700 (PDT)
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
X-Inumbo-ID: 8b5b2cb7-141e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715930689; x=1716535489; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JWTMGb4mIkptzaQIDdkzMZJueZLkF8jZhw5X5fOzFjA=;
        b=LmDFyGJ39YR+cCvSMsqorMdj3aLmUSnNMUV0oQsiwmt7UusOguknLpI0ZCs58H+YuV
         QYKmAVWFyUxzFA0C1jUq99wotXkplOk/z8pND1iyu8PI0+LUzHzt8oatWLhtOhMS6VDp
         hXv9asyDxh6Z/7pGfq4VTtu0Lp+ModJzDHIsy8ulSvKIfyjtZtTxwTSezhZHY+rYSLWh
         /5+ywoMnm2buRNtjU3j5ylsA0SeBRdDohM1FHFIHKlHrqfAEiRV9Wpus4sJPDzrJ8gme
         QzAEI74gNaAgMSsFVcr9I1E57ZKfl2rbb6pkHLyc0fJF7l5FVQNLJdde3c/LVrpAWP2a
         I2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715930689; x=1716535489;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JWTMGb4mIkptzaQIDdkzMZJueZLkF8jZhw5X5fOzFjA=;
        b=Xs2XI3khQZTDedWVpHQPB21bXZjTGAV8nuNtyTBhQmGGHJicMNAJeDadIrg2FsncKj
         kT9S+O5FDZpotdV2vJGb/QOPXt8YiooTPcbsSc/NyEXkkQ3ymhBO7uzWZBEHD9Wwu7w0
         0g0TnRjUDavO78iihQBA/L4MFKRMr5VojiUYRseu9aOCcSaKTN1X9J0AAqIEuD9UlWNd
         WJ/zYwnz9cfnxKcqn0JU2wjrzB8O0L2bRhnrEr4Ow7Sz/O4Mzcn2DFL7CcRk5DagCi2+
         VMN6xqt7AgpmfHrJDWiOTySW5JxuKH8RnzXZBYC0+NSyQeN0OMTn11CdvyJ15CO4vBKE
         ClZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/62G3KtZU3zxhe3JtGn9jwO31iKZkhKod6DkxQqMGaAS4CnEMFaP/XQET2mzf02g+jJOa/yDY1FKdok1FLxQCb/T/ozXnMj64HzvGo9g=
X-Gm-Message-State: AOJu0YwAJMqmlEs7d0sv3ifzMO94uL68GpEKTzYUFSxsyp2KmGww86Mk
	I4hJv2tmMLSsFOMYmco0wn7jlHmRJ4NFl70aSVqCSb1NHCRt0VOFCIWpj9Ca9g==
X-Google-Smtp-Source: AGHT+IEveJxLI6McjLFCEBGWi/iUSeAOGqdRvEF6QVYZx5DR0p2QEOdLkn6+dKzBkxhtj+hXC8qQSw==
X-Received: by 2002:a50:8a84:0:b0:56e:2c34:cfec with SMTP id 4fb4d7f45d1cf-5734d59043dmr16306577a12.7.1715930688941;
        Fri, 17 May 2024 00:24:48 -0700 (PDT)
Message-ID: <686e58b4-cced-46d4-9a88-5a3c00180268@suse.com>
Date: Fri, 17 May 2024 09:24:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
 <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com>
 <b3695ec1-b9e6-4db6-a242-5dfa11bc00b6@suse.com>
 <5059a536-2495-4121-8aba-5a2542ff9987@apertussolutions.com>
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
In-Reply-To: <5059a536-2495-4121-8aba-5a2542ff9987@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.2024 03:22, Daniel P. Smith wrote:
> On 5/16/24 02:41, Jan Beulich wrote:
>> On 14.05.2024 11:25, Jan Beulich wrote:
>>> On 03.04.2024 08:16, Jan Beulich wrote:
>>>> On 02.04.2024 19:06, Andrew Cooper wrote:
>>>>> The commit makes a claim without any kind of justification.
>>>>
>>>> Well, what does "have no business" leave open?
>>>>
>>>>> The claim is false, and the commit broke lsevtchn in dom0.
>>>>
>>>> Or alternatively lsevtchn was doing something that was never meant to work
>>>> (from Xen's perspective).
>>>>
>>>>>   It is also quite
>>>>> obvious from XSM_TARGET that it has broken device model stubdoms too.
>>>>
>>>> Why would that be "obvious"? What business would a stubdom have to look at
>>>> Xen's side of an evtchn?
>>>>
>>>>> Whether to return information about a xen-owned evtchn is a matter of policy,
>>>>> and it's not acceptable to short circuit the XSM on the matter.
>>>>
>>>> I can certainly accept this as one possible view point. As in so many cases
>>>> I'm afraid I dislike you putting it as if it was the only possible one.
>>>>
>>>> In summary: The supposed justification you claim is missing in the original
>>>> change is imo also missing here then: What business would any entity in the
>>>> system have to look at Xen's side of an event channel? Back at the time, 3
>>>> people agreed that it's "none".
>>>
>>> You've never responded to this reply of mine, or its follow-up. You also
>>> didn't chime in on the discussion Daniel and I were having. I consider my
>>> objections unaddressed, and in fact I continue to consider the change to
>>> be wrong. Therefore it was inappropriate for you to commit it; it needs
>>> reverting asap. If you're not going to do so, I will.
>>
>> For the record: With Andrew having clarified that in his revert's
>> description:
>>
>> "The claim is false; it broke lsevtchn in dom0, a debugging utility which
>>   absolutely does care about all of the domain's event channels."
>>
>> "all of the domain's event channels" means to include event channels Xen
>> uses for its own, and merely puts in the domain's table for ease of
>> handling, I've agreed that - in the absence of any better debugging
>> means - the revert may stay in place. For context, my prior understanding
>> of the issue was that lsevtchn simply stops probing further channels when
>> getting back any kind of error from EVTCHNOP_status (which I continue to
>> think wants addressing there, by a future version of a patch that was
>> already sent). However, there are follow-on concerns I have:
>>
>> 1) In the discussion George claimed that exposing status information in
>> an uncontrolled manner is okay. I'm afraid I have to disagree, seeing
>> how a similar assumption by CPU designers has led to a flood of
>> vulnerabilities over the last 6+ years. Information exposure imo is never
>> okay, unless it can be _proven_ that absolutely nothing "useful" can be
>> inferred from it. (I'm having difficulty seeing how such a proof might
>> look like.)
> 
> Jan, I would agree with you that any resources exposed to the guest, 
> even if that resource is status information, should be behind an XSM 
> check. I would, however, have to disagree the position over proving 
> absolutely nothing "useful" can be inferred. Prior to spectre becoming 
> commonly aware, no one considered proving there needed to be protections 
> against out-of-order instruction execution being used to bypass branch 
> conditions.

Interesting perspective.

> Predicting the future will more often than not fail, but 
> with an XSM check in place, the dummy/default policy can just be updated 
> with the general safe decision and others can use FLASK to provide fine 
> grain access.

I have to admit I have difficulty seeing how one would adjust dummy to do
restrict things by default, at least as long as XSM_TARGET is used.

>> 2) Me pointing out that the XSM hook might similarly get in the way of
>> debugging, Andrew suggested that this is not an issue because any sensible
>> XSM policy used in such an environment would grant sufficient privilege to
>> Dom0. Yet that then still doesn't cover why DomU-s also can obtain status
>> for Xen-internal event channels. The debugging argument then becomes weak,
>> as in that case the XSM hook is possibly going to get in the way.
> 
> And this is where we have a fundamental difference. Event channels are 
> XSM labeled objects that are always connected to a guest. If they were 
> truly Xen-internal, then a guest would have no way to get 
> access/reference them.

And that's what I'd like to achieve. The fact that Xen puts these event
channels in the guest's table is a mere implementation detail. They could
as well be kept elsewhere, just that handling then would (likely) be more
cumbersome.

> Again, I never disagreed with whether the guest 
> should or should not be able to access them. I did ask for a better 
> explanation than, "has no business", which is a statement of opinion not 
> of fact or reason. The point is these event channels are a resource 
> attached to the guest

As per above - not really, they merely appear like that.

> and access control decisions to them should be 
> made under XSM. Injecting a hard-coded access control in front of the 
> XSM check subverted/invalidated rules in the existing FLASK policy.

I'd agree if these were truly guest resources. Elsewhere I pointed at
the equivalent in memory management: Xen-internal memory also isn't
protected by XSM checks. It's inaccessible for entirely different reasons.

>> 3) In the discussion Andrew further gave the impression that evtchn_send()
>> had no XSM check. Yet it has; the difference to evtchn_status() is that
>> the latter uses XSM_TARGET while the former uses XSM_HOOK. (Much like
>> evtchn_status() may indeed be useful for debugging, evtchn_send() may be
>> similarly useful to allow getting a stuck channel unstuck.)
> 
> A more appropriate default might be XSM_OTHER with conditions with in 
> the hook  as to whether the policy should be XSM_HOOK, XSM_TARGET or 
> flat denial.

That you mean for send, status, or both?

>> In summary I continue to think that an outright revert was inappropriate.
>> DomU-s should continue to be denied status information on Xen-internal
>> event channels, unconditionally and independent of whether dummy, silo, or
>> Flask is in use.
> 
> Any guest facing resources, regardless if the backing end is the 
> hypervisor, should be protected with XSM. This allows the maintainers to 
> codify what they believe is a sane policy in the dummy policy and the 
> end user can use FLASK to enforce what they believe is acceptable.

I continue to be under the impression that either I don't look at things
correctly, or you don't. What's "guest facing" here? Xen-internal channels
aren't guest facing aiui. Their remote end is, in Dom0 or a stubdom. The
Xen side of it isn't guest facing at all; it's merely a vehicle to ease
handling that they're put in the guest's table.

>> Plus, as stated before, evtchn_send() would better remain in sync in this
>> regard with evtchn_status(). The situation is less clear for evtchn_close()
>> and evtchn_bind_vcpu(): Those indeed have no XSM checks while they do deny
>> operation on Xen-internal channels. It is likely more far fetched to
>> assume permitting them for debugging purposes might in fact help in rare
>> situations. Yet it may still be a matter of consistency to keep them in
>> sync with the other two. (Note that there's also evtchn_usable(), which
>> might then also need tweaking itself or at the use sites.)
> 
> Just because that is how it was, doesn't mean it was correct. I had a 
> discussion with one of the original authors of FLASK before taking up 
> the maintainership and he felt there were likely more XSM checks that 
> should have been in place originally. He considered it a first order 
> approximation of what should be protected.

I'm afraid it's not really clear to me what to take from this. Are you
suggesting that further XSM checks may be wanted? If so, where, and who
would take care of adding them?

Jan

