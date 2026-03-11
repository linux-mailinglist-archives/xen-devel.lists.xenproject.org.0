Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFmWCJghsWkOrQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 09:02:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786A825E5A0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 09:02:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250810.1548167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0EVJ-0001f5-8U; Wed, 11 Mar 2026 08:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250810.1548167; Wed, 11 Mar 2026 08:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0EVJ-0001dg-5e; Wed, 11 Mar 2026 08:01:17 +0000
Received: by outflank-mailman (input) for mailman id 1250810;
 Wed, 11 Mar 2026 08:01:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0EVI-0001da-B3
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 08:01:16 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79ead6ab-1d20-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 09:01:14 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-439f59dfda2so1028878f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 01:01:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f821e32csm4375761f8f.35.2026.03.11.01.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 01:01:13 -0700 (PDT)
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
X-Inumbo-ID: 79ead6ab-1d20-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773216074; x=1773820874; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oRTAnGYYsAovvMfRW9G1obKwSv/FK+Ba49eC5EWIi1A=;
        b=ewJCKMJpdTy+LAKbOsX9lC7HE3QztlFAviMyxVAVjhN3VEjf9Jd93/7Wf5NdTp74Fm
         iX4Hx1oX44MiU3uDCAI5MqUnYo6+q/0rmRhjh8JSODy+iSswp9RYVKznkdClIvgF4nlE
         0k3DULclgmcPu7XCnW++9ZOQfNDnSwK6xOMYvmjfXz/xnP10cU4qQYaXAgALk0Wwv5gQ
         5xiX+eSLXobeYOBNReUb/1g82tMuZ9U7RLk3lVauokQ4fdfDncrxGE0SZQSNE7nS6q0N
         xGPyOyemLjFWNwbc0EAMXswr1cj/Y1f9fFlbib5GfnwcB+acuKzUGYHUgFUGu+Kol4UY
         vm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773216074; x=1773820874;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRTAnGYYsAovvMfRW9G1obKwSv/FK+Ba49eC5EWIi1A=;
        b=WLP9NRXQ/YKt6aS9oqFfk30qpwRXjKNpN39JUTS97/VNyPwhup7SfZZVFTJf/OQi00
         xzArDiMA4Gm6TJ7AecltTwODM9JWRlcjWZnGW72MILwKf8mD3UR0Jp6eVU/r1E8R+SI5
         PyNAvjcgrOao58wx7X364x7TqSTZFMw7fuOrfc7i5NLh40szT4/gZXb+dndP3ffgW3S8
         2cF+lJqUp7F/F0I4P1Cr8sDNrkoSzXAipPb5+LUeQo4VwpKUI22gPZ+x7Gvo8VSMv5Zq
         ut5F/3OCOOe/YBqgT75auAyWsGpJs3SgiwM8x7e+KvaNdO+2QPueglV/l4T7Ib3bpoLs
         AX+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWimZf+fNCkAt4/AChsWtVyOXqHPsFwqTO+qGWzY+kSJvxI2tdi8KUQGkRGWCZ8LN1TO/XTcSsZtHE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yys+z/w3s8PgkHwwR/jQO11ssztsTpZbk79qxkAY0emTf/43fmK
	I8LjVzBGsI50LsRcMiqsMI+mVOCRjwGKydUg3gyjTbkBbZosJhxHGuo1O9dxfUaazjuTyYp0dCP
	wM0w=
X-Gm-Gg: ATEYQzwk/UuF+x8hYOEBDn11wuLnb/wd43ISxB3Wq4EpeE92l6fBvN0wEEym4uEPfrJ
	YfchoSHLyHdoijzUN223VkmlTLQ0XewbRmPHW19KAZIn5+qPX/djC30D7L0NOtuQz/mNA/y3eZM
	mLsDTjh8jOgMI8tNLRy642Cio8BvBPPFsc1mZ/sTCLizXsPpfwOv5SNgmlNTc/OgxWQDQggc4tL
	uNVyu8Pttbw1reX+ZAiAzoOM5cAtTw3rDly9dM1Cs7aq+ZOJc+MnSCwAf45mPPrgtPp1lbmQ9H3
	NicHei/iNigJM9hh+6fr86Zt7MASvkgzJFbg8yiygGIC5hcHifR4hPrk7JqPKytGCo2JRabKUVM
	gWqhs8yX1yXVzqjjr5b7RkkwO3D6sQ+qBQsFVkNDLRqrr/amrpSvgLYqkGOSm7h5Bw94lPluPfU
	iliKiRVCzZwP1oBprwulXXgQhVKB0suVXbIEh2+4d6GPdmx/qfYL6AucT39G4vF2kP+0TSpr6CW
	lcs4sPMcGKONkfMVyRCMLgFgw==
X-Received: by 2002:a5d:5f82:0:b0:439:f55c:b574 with SMTP id ffacd0b85a97d-439f81f3c13mr2973735f8f.12.1773216073968;
        Wed, 11 Mar 2026 01:01:13 -0700 (PDT)
Message-ID: <9b54666a-c61e-4cae-8234-f67ac8802947@suse.com>
Date: Wed, 11 Mar 2026 09:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] x86/ioreq: Extend ioreq server to support multiple
 ioreq pages
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260305130434.635276-1-julian.vetter@vates.tech>
 <20260305130434.635276-2-julian.vetter@vates.tech>
 <c73afb52-e39c-48c8-bf2c-41b509ca0dd0@suse.com>
 <a05e2d6c-5ba7-4651-b9d1-c1b502be0e7b@vates.tech>
 <5724bdb3-bec5-4159-a4f4-9bdad39acd7b@suse.com>
 <4509bc57-ea36-4208-b76b-465d15b25a09@vates.tech>
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
In-Reply-To: <4509bc57-ea36-4208-b76b-465d15b25a09@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 786A825E5A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 10.03.2026 21:56, Julian Vetter wrote:
> On 3/10/26 17:09, Jan Beulich wrote:
>> On 10.03.2026 16:56, Julian Vetter wrote:
>>> On 3/10/26 16:36, Jan Beulich wrote:
>>>> On 05.03.2026 14:04, Julian Vetter wrote:
>>>>> @@ -45,7 +52,8 @@ struct ioreq_server {
>>>>>        /* Lock to serialize toolstack modifications */
>>>>>        spinlock_t             lock;
>>>>>    
>>>>> -    struct ioreq_page      ioreq;
>>>>> +    ioreq_t                *ioreq;
>>>>> +    gfn_t                  ioreq_gfn;
>>>>>        struct list_head       ioreq_vcpu_list;
>>>>>        struct ioreq_page      bufioreq;
>>>>
>>>> This change in data arrangement should in principle be independent of the
>>>> step to supporting multiple pages. Hence it should be possible to separate
>>>> out. Problem being that just by looking here and at hvm_{,un}map_ioreq_gfn()
>>>> I can't conclude how you get away without the "page" field that struct
>>>> ioreq_page had. If you can get away without, it's not quite clear why the
>>>> field exists in the first place. If it's not needed, dropping it would be
>>>> yet another separate, prereq change. At which point the remaining pair of
>>>> fields could continue to be used, i.e. the change above then wouldn't be
>>>> needed; va could be renamed if need be, and its type changed.
>>>
>>> Thank you again Jan for your feedback! I don't need the page anymore.
>>> When I use vmap(), I don't need to keep track of it, because during
>>> teardown, I can recover it via vmap_to_page(). Currently it's necessary
>>> because in destroy_ring_for_helper we need the page, to be destroyed.
>>> But I see now, on X86 the map_domain_page_global called from
>>> prepare_ring_for_helper actually does vmap(&mfn, 1). So the page is also
>>> from the vmap range. So for the teardown I assume a vmap_to_page() could
>>> be used as well. But I also see there is a special case, if NDEBUG=1,
>>> map_domain_page_global short-circuits to mfn_to_virt() for low MFNs
>>> (putting the VA in the directmap range) and bypassing vmap. In that case
>>>
>>> vmap_to_page() would not work. So, this would be really messy. I would
>>> rather switch the bufioreq also to an explicitly vmap()'ed page, then we
>>> could remove the page pointer and both cases would be aligned again.
>>
>> That's an option. Yet are you aware of domain_page_map_to_mfn()? Perhaps
>> that's what you want to switch to using in the patch removing the "page"
>> field. To then, conditionally or uniformly, switch to vmap_to_{mfn,page}()
>> when doing the multi-page work in the subsequent patch.
> 
> Yes, thank you. I saw this function, but I was wondering whether it's a 
> good idea to wrap the va in two translation functions like:
> 
> struct page_info *page = mfn_to_page(domain_page_map_to_mfn(va));

There's no fundamental problem with that (we have similar constructs elsewhere,
I think), but ...

> and then calling destroy_ring_for_helper() with it. But I will have a 
> look, and this way we would be again aligned between the two cases. So, 
> maybe it's the cleanest way.

... does destroy_ring_for_helper() actually need to have the page passed in?
It's prepare_ring_for_helper() which calls __map_domain_page_global(), so
destroy_ring_for_helper() could well obtain the MFN / page itself (using
the above construct). VM event and vPL011 code also only ever use the page
pointer supplied by prepare_ring_for_helper() to pass into
destroy_ring_for_helper().

Jan

