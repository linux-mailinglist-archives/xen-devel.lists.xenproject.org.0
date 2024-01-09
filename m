Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640B0828856
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 15:40:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664671.1034747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNDGR-0008Vd-On; Tue, 09 Jan 2024 14:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664671.1034747; Tue, 09 Jan 2024 14:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNDGR-0008TL-Lt; Tue, 09 Jan 2024 14:39:35 +0000
Received: by outflank-mailman (input) for mailman id 664671;
 Tue, 09 Jan 2024 14:39:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTBC=IT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNDGP-0008Su-Ph
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 14:39:33 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6f608cc-aefc-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 15:39:32 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cd1232a2c7so35155411fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 06:39:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q4-20020a6bf204000000b007bbd0bb93f2sm535254ioh.21.2024.01.09.06.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 06:39:31 -0800 (PST)
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
X-Inumbo-ID: e6f608cc-aefc-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704811172; x=1705415972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7BfeE0WSFekNfWYs3J1x3hitUJUMPx40aPnP9S+VpFQ=;
        b=D1i8o6VMHC38jKy0mbRBti7V4MR/2JGvedqdLqo/spftsxr5LDYSYRl0X0p3TbXn14
         VWXUsOT3TEGzjS8z3Krcww6AJQJhgCRsp1ZhDnBO6wgup5QwjdwWIyl09W7tkSk/er9A
         3E2pBrd2Z91alImN6/PQojW4Jomv0KZiVEgGf2jx5jGt4tUySJKKJgpSPecvft4Uu2wd
         3moJ6kYvbqnewsU5O5lFm59wlr2t1TzByfcMjpOU/6E7Wvp+35Ga27jEB+UNqqpRnptZ
         kpxaKMYsxAKAfGPG1Qj6+pZzimRK2SQxiNLgBi76D8lD/ijb+dTFU5MnDmznTImzAK44
         KsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704811172; x=1705415972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7BfeE0WSFekNfWYs3J1x3hitUJUMPx40aPnP9S+VpFQ=;
        b=NX1OV9WMFRyaKC1fqbf94i3RVC4OYUt0sw6PbD5jyZ383Tli3/1rseavA86U8SlA/D
         jve3Qv1omlt0mfXDZqb5/HHnaAfS9yK4V72z0ZcuAvTin9EBE5NumNEBwZbPuyzhFwvX
         X3nbAvRL8fHDc5T6wchVix5h7FJzdyqq/cFT+EQOUpw6eXgso0eWZUb8Snk3watdV4MM
         KHKsBpzF6hECY3w9Oz30HaIM6+et3cHejqBqsscm9vJOsGgPm5BfcLM4QfqUYu+/WK3F
         DBxfxvQi6uFqvtzKwgfR3n/WkRf6/kJHlkS7cwt9Asm7LElRtni0WPziiFaL0EezJGP5
         XjTA==
X-Gm-Message-State: AOJu0YyNArdQo6EuaCU3UXAqZ/OdKEicog6Xn0Q+6Kztth/e2NDe/3xv
	f2vLjaLrIvFTpS+ek+WpqBhglQKQzgU9aJh/WOiXyEVDwg==
X-Google-Smtp-Source: AGHT+IErm26GPDZFAGpl4ZPKcW22UWjmwN6nr1FJ7VHy6ANAhifWqsC/1uiY0U9cDrppF6YK++rT3g==
X-Received: by 2002:a05:651c:19ac:b0:2cd:517a:21d4 with SMTP id bx44-20020a05651c19ac00b002cd517a21d4mr2089043ljb.103.1704811171970;
        Tue, 09 Jan 2024 06:39:31 -0800 (PST)
Message-ID: <83f266f1-c46b-4ace-9c29-b0b486f817a6@suse.com>
Date: Tue, 9 Jan 2024 15:39:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] VMX: convert vmx_basic_msr
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
 <d07fb86f-ef9c-4c2b-ba9a-f1e5c813d45d@suse.com>
 <e17d6e45-b03c-4906-9fb3-af4770aa3cf0@citrix.com>
 <beac1f7c-51cb-47a9-8e96-d09cb3ea6ab7@suse.com>
 <04992603-cb10-43ff-9eb3-b8f8f1dc765c@citrix.com>
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
In-Reply-To: <04992603-cb10-43ff-9eb3-b8f8f1dc765c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 18:29, Andrew Cooper wrote:
> On 27/11/2023 12:44 pm, Jan Beulich wrote:
>> On 24.11.2023 23:41, Andrew Cooper wrote:
>>> On 24/11/2023 8:41 am, Jan Beulich wrote:
>>>> ... to a struct field, which is then going to be accompanied by other
>>>> capability/control data presently living in individual variables. As
>>>> this structure isn't supposed to be altered post-boot, put it in
>>>> .data.ro_after_init right away.
>>>>
>>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> For (usable) nested virt, we're going to need the VMX MSRs, in their
>>> architectural form, in struct cpu_policy.  And just like CPUID features,
>>> I want it to end up with nice bitfields to use.
>>>
>>> Looking through the rest of this series, vmx_caps ends up almost in
>>> architectural form.
>>>
>>> Could I talk you into having a "struct vmx_msrs" (or similar - 'caps'
>>> doesn't feel quite right here) in the policy object, and also
>>> instantiating one instance of it for this purpose here?
>> I was actually wondering while doing the conversion. The main reason I
>> didn't go that route right away was that I wasn't really certain whether
>> what I'd put there would the really be the (largely) final shape it
>> wants to take there. (One thing you've likely noticed I didn't convert
>> is _vmx_misc_cap, which right now only exists as a local variable in
>> vmx_init_vmcs_config().)
>>
>>> AFAICT, it would only be a minor deviation to the latter half of this
>>> series, but it would be an excellent start to fixing nested virt - and
>>> getting this data in the policy really is the first task in getting the
>>> ball rolling on nested virt.
>> How much of a further change it would end up being (or where that change
>> would occur) depends on another aspect: When put in cpu-policy.h (and I
>> take it you mean the lib/ instance, not the asm/ one), it would seem
>> natural and perhaps even necessary to properly introduce bitfields for
>> each of the MSRs right away. That'll lead to a "raw" field as well. In
>> VMX code (mostly its cpu_has_* #define-s), I'd then either need to use
>> .raw (perhaps a little ugly here and there) or go with using the
>> individual bitfields right away (likely eliminating the need for many of
>> the constant #define-s), which increases the risk of inadvertent mistakes
>> (and their overlooking during review).
>>
>>> I don't mind about serialising/de-serialsing it - that still has a bit
>>> of userspace complexity to work out, and depends on some of the cleanup
>>> still needing a repost.
>>>
>>> If you don't want to take the added space in cpu_policy yet, how about
>>> having the declaration there and just forgo instantiating the subobject
>>> in the short term?
>> There's quite a bit of effectively dead space in the struct already; I
>> think I wouldn't mind instantiating the struct there right away. So long
>> as you're convinced it's going to be used there in not too distant a
>> future.
>>
>> But: If I go as far, why would I introduce a global instance of the new
>> struct? Wouldn't it then make more sense to use host_cpu_policy right
>> away? I probably would keep populating it in vmx_init_vmcs_config() to
>> limit churn for now, but consumers of the flags could then right away
>> use the host policy.
> 
> George has stated an intent to pick nested virt up imminently.  I'll
> have to defer to him on when this will actually start.
> 
> But, sorting out this data in the policies is the next step, whenever
> that occurs.
> 
> 
> If you fancy going all the way to use the raw/host policy then great,
> but I expect that would be a large amount of extra work, hence the
> suggestion to just use the "inner" struct in the short term.

Even the inner struct plan falls apart pretty quickly (or grows what
needs doing by too much for my taste, in the context right here):
While for basic_msr this works, and it would apparently also work
for vmfunc and tertiary exec control (the latter is itself only part
of a yet to be reviewed / approved patch), it doesn't for all the
others with split 0-setting and 1-setting halves. This is because
what VMX code wants are the calculated values to put in the VMCS,
whereas imo in the policy we'd want to store both halves (and what
exactly wants to be in the host policy there isn't really clear to
me). As a result I can't create a single uniform structure properly
serving both purposes. Nor could I have VMX code use the host
policy for most of its capability checks.

Thought / ideas?

Jan

> Conversion to bitfields would want to be separate patch anyway, at which
> point an A/B compile can confirm whether there was no resulting change.
> 
> I'm happy if you want to do all of this, but it's a lot of work, and
> simply having the data in plain architectural uint64_t in the host
> policy is something that I thought would be a very minor change to your
> current series, but with a useful step towards nested virt.
> 
> One open question, before we get too far into this, is still whether to
> express half of these as MSR-features like ARCH_CAPS.  Linux does, and
> there is a very complex set of dependencies between certain properties,
> although I have a sneaking suspicion that the dependency logic will
> needed at runtime as the L1 hypervisor changes the various controls.
> 
> ~Andrew


