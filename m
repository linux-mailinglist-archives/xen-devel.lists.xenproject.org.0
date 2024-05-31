Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D568D5CC4
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 10:34:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733449.1139712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxi8-0005mP-1T; Fri, 31 May 2024 08:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733449.1139712; Fri, 31 May 2024 08:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCxi7-0005kh-Ux; Fri, 31 May 2024 08:34:03 +0000
Received: by outflank-mailman (input) for mailman id 733449;
 Fri, 31 May 2024 08:34:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCxi7-0005kb-6e
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 08:34:03 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87c6d5f5-1f28-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 10:34:01 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a5dcb5a0db4so187108666b.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 01:34:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a67eb6214fcsm61579066b.224.2024.05.31.01.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 01:34:00 -0700 (PDT)
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
X-Inumbo-ID: 87c6d5f5-1f28-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717144440; x=1717749240; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv7P1b8LgUkd769Ez3yba/ErGOX7JkgtzCjTpafeiRU=;
        b=VGsN0GHrWjfvaTHxlowGBeZwy8kpbxUmvNuyy3vqs+uVu0LAnjM3wxlMp40aIw861l
         hrM/A+kMXvpH0xgzm1yfAMTDN3QhFnoeYLBNpamLo/0Hv+EnpDSJ/y4rqjkTEOlgRbIi
         +Zr5nWLPUnMVXVSUnT4XONIU+IcxEK8FJqNs0eno+WOtm1r8h90izbMCpvWdokZ0IwBH
         5KdY9KBBd2cKeGbBZLa6ar0R6EGeFY8GpsPVGb+jAbhFCOvKKBlERFa2gJwePOz8VR3w
         cDspOSszAVKy4eLmsZ+GV0vMRwcVtYFAu5W5g0gCXcIxOoOZf2z097ZhNwkjrdo7Vutk
         b9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717144440; x=1717749240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fv7P1b8LgUkd769Ez3yba/ErGOX7JkgtzCjTpafeiRU=;
        b=eHTY1TMO3XKiPhr2b83d366GrpLrXCGu+8LC8Id9A8ZK/kxuzjO655rLONU3XpY87P
         NkKGVbo3Y6fFwDLsG6hZgqF70xZlJjZ6UUYZS+m/g+87LB4/BzfLvuFx3ab9/BdHFbXc
         CpcCv6OH+e0kJ7mg4jTwyT2cfhmj3kRPR5SuAjY/mJfkMDTX5/BaWpVY4hiMbLK7ANIS
         nePLI7qHMwXvnvzGN2xxwYh/CDqJ64KcjE9otXt82MmFPlFDaD0pz4Ry8f4c+61CQNig
         GQKuPzgoES8XB7da8fm4x8rppq5eWP2fWnQgLtbskvYFVwgsmYyU7cqo+WyV6VV0UuHi
         asGw==
X-Forwarded-Encrypted: i=1; AJvYcCVlwEeyfQOlAhAeLJVlqhU1X1g51/9UNX4ySD1lNyVz1noICmnkuiAFiB+CFG+Hmb61nn3I+yCz+kpIA/Q0q8s1zQvPj1FYSAiII8m7ILg=
X-Gm-Message-State: AOJu0YzanB14sSVftOoCDcM95M7NKTWkCMeRTQVVDD8G6J4URjjJNuYF
	Xlhd9iBxP9KKvji++zb+zVAQ0LQRMmt7nLnphro0FkT5/VR++PCt28xn2kpnsg==
X-Google-Smtp-Source: AGHT+IEM4v+DjbOY8sH4CpBxHv0Ogs9ljDq3RaZTRruHWVxL/qOdiwzM80y+HIOp1mcerEDi+/1CZQ==
X-Received: by 2002:a17:906:600a:b0:a66:7b79:3572 with SMTP id a640c23a62f3a-a681fc5bfb9mr68101466b.15.1717144440367;
        Fri, 31 May 2024 01:34:00 -0700 (PDT)
Message-ID: <e39c9e0c-2596-483f-a82d-86d424717081@suse.com>
Date: Fri, 31 May 2024 10:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 3/9] xen/cpu: ensure get_cpu_maps() returns false
 if CPU operations are underway
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-4-roger.pau@citrix.com>
 <597b0bf9-8949-41f3-a630-18937c219d8b@suse.com> <ZldDvH8GhhQcu5NX@macbook>
 <3ccdfec3-924a-4ef0-bf8d-653b6019aecb@suse.com> <ZldUgJRJvytRsjhu@macbook>
 <075168de-1a3f-4f23-a445-8ba74082fb8f@suse.com> <Zll8xQJiM83EZhTd@macbook>
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
In-Reply-To: <Zll8xQJiM83EZhTd@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.05.2024 09:31, Roger Pau Monné wrote:
> On Fri, May 31, 2024 at 09:02:20AM +0200, Jan Beulich wrote:
>> On 29.05.2024 18:14, Roger Pau Monné wrote:
>>> On Wed, May 29, 2024 at 05:49:48PM +0200, Jan Beulich wrote:
>>>> On 29.05.2024 17:03, Roger Pau Monné wrote:
>>>>> On Wed, May 29, 2024 at 03:35:04PM +0200, Jan Beulich wrote:
>>>>>> On 29.05.2024 11:01, Roger Pau Monne wrote:
>>>>>>> Due to the current rwlock logic, if the CPU calling get_cpu_maps() does so from
>>>>>>> a cpu_hotplug_{begin,done}() region the function will still return success,
>>>>>>> because a CPU taking the rwlock in read mode after having taken it in write
>>>>>>> mode is allowed.  Such behavior however defeats the purpose of get_cpu_maps(),
>>>>>>> as it should always return false when called with a CPU hot{,un}plug operation
>>>>>>> is in progress.
>>>>>>
>>>>>> I'm not sure I can agree with this. The CPU doing said operation ought to be
>>>>>> aware of what it is itself doing. And all other CPUs will get back false from
>>>>>> get_cpu_maps().
>>>>>
>>>>> Well, the CPU is aware in the context of cpu_{up,down}(), but not in
>>>>> the interrupts that might be handled while that operation is in
>>>>> progress, see below for a concrete example.
>>>>>
>>>>>>>  Otherwise the logic in send_IPI_mask() for example is wrong,
>>>>>>> as it could decide to use the shorthand even when a CPU operation is in
>>>>>>> progress.
>>>>>>
>>>>>> It's also not becoming clear what's wrong there: As long as a CPU isn't
>>>>>> offline enough to not be in cpu_online_map anymore, it may well need to still
>>>>>> be the target of IPIs, and targeting it with a shorthand then is still fine.
>>>>>
>>>>> The issue is in the online path: there's a window where the CPU is
>>>>> online (and the lapic active), but cpu_online_map hasn't been updated
>>>>> yet.  A specific example would be time_calibration() being executed on
>>>>> the CPU that is running cpu_up().  That could result in a shorthand
>>>>> IPI being used, but the mask in r.cpu_calibration_map not containing
>>>>> the CPU that's being brought up online because it's not yet added to
>>>>> cpu_online_map.  Then the number of CPUs actually running
>>>>> time_calibration_rendezvous_fn won't match the weight of the cpumask
>>>>> in r.cpu_calibration_map.
>>>>
>>>> I see, but maybe only partly. Prior to the CPU having its bit set in
>>>> cpu_online_map, can it really take interrupts already? Shouldn't it be
>>>> running with IRQs off until later, thus preventing it from making it
>>>> into the rendezvous function in the first place? But yes, I can see
>>>> how the IRQ (IPI) then being delivered later (once IRQs are enabled)
>>>> might cause problems, too.
>>>
>>> The interrupt will get set in IRR and handled when interrupts are
>>> enabled.
>>>
>>>>
>>>> Plus, with how the rendezvous function is invoked (via
>>>> on_selected_cpus() with the mask copied from cpu_online_map), the
>>>> first check in smp_call_function_interrupt() ought to prevent the
>>>> function from being called on the CPU being onlined. A problem would
>>>> arise though if the IPI arrived later and call_data was already
>>>> (partly or fully) overwritten with the next request.
>>>
>>> Yeah, there's a small window where the fields in call_data are out of
>>> sync.
>>>
>>>>>> In any event this would again affect only the CPU leading the CPU operation,
>>>>>> which should clearly know at which point(s) it is okay to send IPIs. Are we
>>>>>> actually sending any IPIs from within CPU-online or CPU-offline paths?
>>>>>
>>>>> Yes, I've seen the time rendezvous happening while in the middle of a
>>>>> hotplug operation, and the CPU coordinating the rendezvous being the
>>>>> one doing the CPU hotplug operation, so get_cpu_maps() returning true.
>>>>
>>>> Right, yet together with ...
>>>>
>>>>>> Together with the earlier paragraph the critical window would be between the
>>>>>> CPU being taken off of cpu_online_map and the CPU actually going "dead" (i.e.
>>>>>> on x86: its LAPIC becoming unresponsive to other than INIT/SIPI). And even
>>>>>> then the question would be what bad, if any, would happen to that CPU if an
>>>>>> IPI was still targeted at it by way of using the shorthand. I'm pretty sure
>>>>>> it runs with IRQs off at that time, so no ordinary IRQ could be delivered.
>>>>>>
>>>>>>> Adjust the logic in get_cpu_maps() to return false when the CPUs lock is
>>>>>>> already hold in write mode by the current CPU, as read_trylock() would
>>>>>>> otherwise return true.
>>>>>>>
>>>>>>> Fixes: 868a01021c6f ('rwlock: allow recursive read locking when already locked in write mode')
>>>>>>
>>>>>> I'm puzzled by this as well: Prior to that and the change referenced by its
>>>>>> Fixes: tag, recursive spin locks were used. For the purposes here that's the
>>>>>> same as permitting read locking even when the write lock is already held by
>>>>>> the local CPU.
>>>>>
>>>>> I see, so the Fixes should be:
>>>>>
>>>>> x86/smp: use APIC ALLBUT destination shorthand when possible
>>>>>
>>>>> Instead, which is the commit that started using get_cpu_maps() in
>>>>> send_IPI_mask().
>>>>
>>>> ... this I then wonder whether it's really only the condition in
>>>> send_IPI_mask() which needs further amending, rather than fiddling with
>>>> get_cpu_maps().
>>>
>>> That the other option, but I have impression it's more fragile to
>>> adjust the condition in send_IPI_mask() rather than fiddle with
>>> get_cpu_maps().
>>>
>>> However if that's the preference I can adjust.
>>
>> I guess we need other REST input here then. The two of us clearly disagree on
>> what use of get_cpu_maps() is meant to guarantee. And I deem fiddling with
>> common code here more risky (and more intrusive - the other change would be
>> a single-line code change afaict, plus extending the related comment).
> 
> How do you envision that other change to be done?  Adding an extra
> variable and toggling it in cpu_hotplug_{begin,done}() to signal
> whether a CPU hotplug is in progress?

I was thinking of an is-write-locked-by-me check on cpu_add_remove_lock.

Jan

