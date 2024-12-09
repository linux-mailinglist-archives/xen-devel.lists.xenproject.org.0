Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9339E8D4A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 09:24:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851032.1265189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKZ3f-0003RN-2b; Mon, 09 Dec 2024 08:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851032.1265189; Mon, 09 Dec 2024 08:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKZ3e-0003Ps-V6; Mon, 09 Dec 2024 08:23:58 +0000
Received: by outflank-mailman (input) for mailman id 851032;
 Mon, 09 Dec 2024 08:23:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKZ3d-0003Pm-Uc
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 08:23:57 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee3dbb26-b606-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 09:23:55 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-434a736518eso43555235e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 00:23:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd35331cf8sm3781898a12.44.2024.12.09.00.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 00:23:54 -0800 (PST)
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
X-Inumbo-ID: ee3dbb26-b606-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733732635; x=1734337435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6eRBZmuTMo1Tl+si5QD9VHBzq6N8KEMy+nnbBobucyc=;
        b=LuXozQ0PrZFVG5u0GiCx+uXFx2sXzFJa5TmdA0IoSkEWp0MjmohFi1NMj79ADexs3y
         zde2NdqK3RXvIo5Nm9p2Hn58sj52g9gVT9JoqMli5t+npRulObEP2XwT7nF/3olhD7+G
         tHgjMzhVLYFan+aKq8CqmtT90TRhZYY2R7A8ePIKl7TfAbwe56VTk3F+u+Y528HUCK1M
         4TSjZ5PeeS1G83TOyFJNHXQDe7d2Rtdbs8bjKKjzo+alNb36YL1vSv8/P84V4niaBS/U
         0NhgJZ3euvvjvyJrtc+YzvVu20wc2LQzHTO2j3Plt1bFFPxnQY9JZ79N8OVoSBfuXeUI
         hO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733732635; x=1734337435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eRBZmuTMo1Tl+si5QD9VHBzq6N8KEMy+nnbBobucyc=;
        b=rkSH3+28O0MmSqpRRHy2yWmteoS4XB1jUlej13pPLG4KHy4VjAxIjuZErGJIKyfaQq
         gyysosZGfH+aMZ/6np1ZB9HgRIvAvhD0RfvyXOClSEIrgGfpe6y404yvN7comNs2eW9i
         EjexhdDN1TIH2DefcK4hqCTNWEGjwwbveD9+ILIVOjsdTEOe52pwQoxvTMxBieSpHLNf
         6Qa/8m/IS8F27gHAX+DUdpRNkmEZwpMqeD44vwKmeRDqBZdBPM+qr7+ygOoCo/q9Opcw
         CFDeoit5ob/s5Br8wn30RDSqxn0eO1SGVSO6I5lKcxkYkS9RcfAG4VySk1NX2EzQbiiP
         wQUw==
X-Forwarded-Encrypted: i=1; AJvYcCXZM9CENpZHFVgf3R6pEiuPwSPxX9n/n2qo+YV0ts3M1mYiONZ/UxJLg2eU0JQ6dBU03EKSMJexYB0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxL+sE0wN+nUwzhe+mYdm+DCiStydURg5jq6HSzCNtxtGn9+YqJ
	IktUfYgJR29L5MgqTdwSh6OfJmLKOEDCLPykgUAXZpAEeDKBT0hdGRie6wbGaA==
X-Gm-Gg: ASbGncu2zaiZSwxAdOTPipSMTHFXAzN4wJWsM1/bhGA4aV6i/BL71IIFGJBBgGmGBTV
	47uY3nrwfNGJ1LiPq5J3HhMLJB+jpKsx457Cqr4b40fHPdHZgKi0n70HKJOUwCRSP33QbaSZ5sI
	OeGsc5hOJaCtd1o4YLOMwGvuXaK13JjBibdaN4aliccqwds4eihV/qT45ev8xOvarruZ2zyL3gn
	3MdJcLlSqK+p3rYXhJGDl2NSEUQ65gXr5eiykcng74gorvCVihvTn5KqjFjmbtsPpr4GgJ1xp1A
	YXP1SvW+2jFpTrmv1kyipPTo5zk1trdzbIY=
X-Google-Smtp-Source: AGHT+IH9mChw61TwLtghbLmdbx+LyTaSYUllE11L5hN30/kToRSrLAVtNL0tqbLwcZJ9baqnP84fCw==
X-Received: by 2002:a05:600c:4592:b0:430:57e8:3c7e with SMTP id 5b1f17b1804b1-434ddee10b6mr78521775e9.28.1733732634952;
        Mon, 09 Dec 2024 00:23:54 -0800 (PST)
Message-ID: <c8990ecc-fdee-4b52-b247-246fade7b2c9@suse.com>
Date: Mon, 9 Dec 2024 09:23:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] SYSCTL_numainfo.memsize: Switch spanned to present
 memory
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <10466e8c29b5f69774915bcf6562985c75e98bb7.1733224306.git.bernhard.kaindl@cloud.com>
 <0299582c-7261-4947-a2ac-bf3d62ccac14@suse.com>
 <3f527685-e1bf-4a87-8986-2b9620d14646@cloud.com>
Content-Language: en-US
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
In-Reply-To: <3f527685-e1bf-4a87-8986-2b9620d14646@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2024 11:55, Bernhard Kaindl wrote:
> On 03/12/2024 12:37, Jan Beulich wrote:
>> On 03.12.2024 12:12, Bernhard Kaindl wrote:
>>> This the 2nd part of my submission to fix the NUMA node memsize
>>> retured in xen_sysctl_meminfo[].memsize by the XEN_SYSCTL_numainfo
>>> hypercall to not count MMIO memory holes etc but only memory pages.
>>>
>>> For this, we introduced NODE_DATA->node_present_pages as a prereq.
>>> With the prereq merged in master, I send this 2nd part for review:
>>>
>>> This RFC is for changing the value of xen_sysctl_meminfo[]->memsize
>>> from NODE_DATA->node_spanned_pages << PAGE_SHIFT
>>>    to NODE_DATA->node_present_pages << PAGE_SHIFT
>>> for returing total present NUMA node memory instead of spanned range.
>>>
>>> Sample of struct xen_sysctl_meminfo[].* as presented by in xl info -n:
>>>
>>> xl info -n:
>>> [...]
>>> node:    memsize    memfree    distances
>>>     0:  -> 67584 <-   60672      10,21
>>>     1:     65536      60958      21,10
>>>
>>> The -> memsize <- marked here is the value that we'd like to fix:
>>> The current value based node_spanned_pages is often 2TB too large.
>>>
>>> We're currently not using these often false memsize values in XenServer
>>> according to my code review and and Andrew seemed to confirm this as well.
>>>
>>> I think that the same is likely true for other Xen toolstacks, but of course
>>> to review this change or propose an alternaive is the purpose of this RFC.
>>>
>>> Thanks,
>>> Bernhard
>>
>> All of the above reads like a cover letter. What's missing is a patch
>> description, part of which would be to clarify whether the field is
>> indeed unused except for display purposes, or why respective users would
>> at least not regress from this change. What's also unclear is what
>> comments you're actually after (i.e. what question(s) you want to have
>> answered), seeing this is tagged RFC.
> [...]
>> Jan
> 
> Hi Jan!
> 
> The answer I'm looking for is which users to check, or to check with.
> 
> For example, I know that Xapi can use xen_sysctl_meminfo[].memfree to
> get a preference about the NUMA node use use when creating a domain
> (when the new mode `numa_affinity_policy.best_effort` is enabled):
> https://xapi-project.github.io/new-docs/toolstack/features/NUMA/
> 
> A potential use of xen_sysctl_meminfo.memsize in Xen toolstacks is
> less clear to me:
> 
> The only potential use would be if some Xen toolstack would not like
> to solely rely on [nid].memfree for NUMA placement.
> 
> The question is if there are other NUMA aware toolstacks besides Xapi,
> that would try to use it for e.g. planning the placement of domains.
> 
> My in the Xapi and Xen repos only turned up a debug printf() in
> xen-api's xen-api/xenopsd and in xen only the output of xl info -n.
> 
> It seems questionable to me that any other toolstacks would rely on it,
> especially as the value it returns currently is offset even 2GB on some
> machines. I'd expect that this bug would have affected code using it.
> 
> The answers I am looking for are acknowledgements of that or references 
> which users might use .memsize currently (that could be affected).

IOW all questions to respective toolstack people.

> Alternatively, I'd hope to get an idea what would be the method to 
> create a new revision of the numainfo hypercall:
> 
> I guess it would be to add a new #define XEN_SYSCTL_numainfo_v2,
> and if v2 is called, return [].memsize using [nid].node_present_pages 
> instead?

That's a last resort, yes. Since sysctls aren't stable (yet), changing
existing interfaces generally is an option. We merely want to figure
how careful we need to be. It may be fine to do the change "silently",
as you do now. A middle option might be to rename the field which has
its meaning changed, such that anyone using the field will notice that
they need to update their code, hopefully resulting in them checking
what changed and hence what they may need to change.

Jan

