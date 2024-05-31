Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B08A8D5B1A
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 09:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733310.1139472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCwHT-0004tU-Cp; Fri, 31 May 2024 07:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733310.1139472; Fri, 31 May 2024 07:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCwHT-0004rn-9M; Fri, 31 May 2024 07:02:27 +0000
Received: by outflank-mailman (input) for mailman id 733310;
 Fri, 31 May 2024 07:02:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCwHR-0004rg-O0
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 07:02:25 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bab90099-1f1b-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 09:02:22 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ea9386cde0so5926801fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 00:02:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31c6d4a0sm660261a12.77.2024.05.31.00.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 00:02:22 -0700 (PDT)
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
X-Inumbo-ID: bab90099-1f1b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717138942; x=1717743742; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bxmq4PUQqJEOSiOM3m0L/AXci6h8bSFL7LysBvNsQx8=;
        b=cFJu5GIV8DipEKoTJ4LgfCnr6WiRTCbtp1NzCCTONOlJTV3xrY6PDV+sCSkzbZ+Xw7
         cHC8KwIgFFm+Hx0RN4KeYhnHhAnRyjl0bgtZUKcCZoFlLtWROV9XB+hYIvTkb8yqfnAS
         SRMPslX3WdlfPFcd408ooSmpc1zgGDk4uN2WIT1e629a2RUC4dMMok7IyeYdTPP0d5ES
         15Krxmd1EO/BMPWhgxdSrlANQTPxzyjVoMliVCLCLjU6EbmcIFMFmoFjEtJb3/byE3hb
         SlvbX6wNkRwgiNs20SC2WllMvTmLtcH/EFQb3sICmyVhX8fOJc2fxBWtyuU7GizDy2E5
         u+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717138942; x=1717743742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bxmq4PUQqJEOSiOM3m0L/AXci6h8bSFL7LysBvNsQx8=;
        b=sC8rgIA7f61LqNhN6nOs7XyQvatjcT1akypo1LnuNqbbPj5NfSFV/L3Mrt02CwC84B
         j+ijbwTCZR5knUJoq03Es6xNP8XMGc5j1kkr2ayz2Q0pYpXl1uGrP6qb643XJqbvcBv0
         2+aG/FZZmp7yqlkT8bCTtaz7dUeyJwmrjSN4LhlR1iBPG4ecLT+mboLb0fhXarYiQr4y
         ugh0c34V5sMndTAb7xz9SP4vCZozJGWio1azErueQ/hhMdi+7druEP6tgJ6wKDWgBvDu
         G8KM6xlKBtSZv01Te7U05WDJrHO8nHtUoZcb0ez4ZWLnb5R/DNEVdRLT2HkWgOwhEt8C
         vxAw==
X-Forwarded-Encrypted: i=1; AJvYcCVOZ2OOteFLYYo6P0rkNZhCQqny6MszVcsY1f5HRF9jyUTXQyJUxVkVz+Dfs/Y+R+zfUW1HpO6CEP6ZPCL582jwIL8fQxJf67SbOrFspiQ=
X-Gm-Message-State: AOJu0Yz3HhamdodkwugdtvZdzzEsD9rzdHomzjc8l0Xb25gr0jukBvp6
	3VzhLujqypbFLX7KvEJNkH1qVfa4xzOK8j3EEbKKmH696nOLe2y2a0nJTH4Mrw==
X-Google-Smtp-Source: AGHT+IGwC+tSg9suj5VY3MS7ejlCHPdm5Nysm2Sjcr8LbL4XrQtprP00IoX+ksiP/h6BjXPazTyIgw==
X-Received: by 2002:a19:5e5d:0:b0:52a:622c:dae8 with SMTP id 2adb3069b0e04-52b89596635mr504443e87.20.1717138942252;
        Fri, 31 May 2024 00:02:22 -0700 (PDT)
Message-ID: <075168de-1a3f-4f23-a445-8ba74082fb8f@suse.com>
Date: Fri, 31 May 2024 09:02:20 +0200
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
In-Reply-To: <ZldUgJRJvytRsjhu@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.05.2024 18:14, Roger Pau Monné wrote:
> On Wed, May 29, 2024 at 05:49:48PM +0200, Jan Beulich wrote:
>> On 29.05.2024 17:03, Roger Pau Monné wrote:
>>> On Wed, May 29, 2024 at 03:35:04PM +0200, Jan Beulich wrote:
>>>> On 29.05.2024 11:01, Roger Pau Monne wrote:
>>>>> Due to the current rwlock logic, if the CPU calling get_cpu_maps() does so from
>>>>> a cpu_hotplug_{begin,done}() region the function will still return success,
>>>>> because a CPU taking the rwlock in read mode after having taken it in write
>>>>> mode is allowed.  Such behavior however defeats the purpose of get_cpu_maps(),
>>>>> as it should always return false when called with a CPU hot{,un}plug operation
>>>>> is in progress.
>>>>
>>>> I'm not sure I can agree with this. The CPU doing said operation ought to be
>>>> aware of what it is itself doing. And all other CPUs will get back false from
>>>> get_cpu_maps().
>>>
>>> Well, the CPU is aware in the context of cpu_{up,down}(), but not in
>>> the interrupts that might be handled while that operation is in
>>> progress, see below for a concrete example.
>>>
>>>>>  Otherwise the logic in send_IPI_mask() for example is wrong,
>>>>> as it could decide to use the shorthand even when a CPU operation is in
>>>>> progress.
>>>>
>>>> It's also not becoming clear what's wrong there: As long as a CPU isn't
>>>> offline enough to not be in cpu_online_map anymore, it may well need to still
>>>> be the target of IPIs, and targeting it with a shorthand then is still fine.
>>>
>>> The issue is in the online path: there's a window where the CPU is
>>> online (and the lapic active), but cpu_online_map hasn't been updated
>>> yet.  A specific example would be time_calibration() being executed on
>>> the CPU that is running cpu_up().  That could result in a shorthand
>>> IPI being used, but the mask in r.cpu_calibration_map not containing
>>> the CPU that's being brought up online because it's not yet added to
>>> cpu_online_map.  Then the number of CPUs actually running
>>> time_calibration_rendezvous_fn won't match the weight of the cpumask
>>> in r.cpu_calibration_map.
>>
>> I see, but maybe only partly. Prior to the CPU having its bit set in
>> cpu_online_map, can it really take interrupts already? Shouldn't it be
>> running with IRQs off until later, thus preventing it from making it
>> into the rendezvous function in the first place? But yes, I can see
>> how the IRQ (IPI) then being delivered later (once IRQs are enabled)
>> might cause problems, too.
> 
> The interrupt will get set in IRR and handled when interrupts are
> enabled.
> 
>>
>> Plus, with how the rendezvous function is invoked (via
>> on_selected_cpus() with the mask copied from cpu_online_map), the
>> first check in smp_call_function_interrupt() ought to prevent the
>> function from being called on the CPU being onlined. A problem would
>> arise though if the IPI arrived later and call_data was already
>> (partly or fully) overwritten with the next request.
> 
> Yeah, there's a small window where the fields in call_data are out of
> sync.
> 
>>>> In any event this would again affect only the CPU leading the CPU operation,
>>>> which should clearly know at which point(s) it is okay to send IPIs. Are we
>>>> actually sending any IPIs from within CPU-online or CPU-offline paths?
>>>
>>> Yes, I've seen the time rendezvous happening while in the middle of a
>>> hotplug operation, and the CPU coordinating the rendezvous being the
>>> one doing the CPU hotplug operation, so get_cpu_maps() returning true.
>>
>> Right, yet together with ...
>>
>>>> Together with the earlier paragraph the critical window would be between the
>>>> CPU being taken off of cpu_online_map and the CPU actually going "dead" (i.e.
>>>> on x86: its LAPIC becoming unresponsive to other than INIT/SIPI). And even
>>>> then the question would be what bad, if any, would happen to that CPU if an
>>>> IPI was still targeted at it by way of using the shorthand. I'm pretty sure
>>>> it runs with IRQs off at that time, so no ordinary IRQ could be delivered.
>>>>
>>>>> Adjust the logic in get_cpu_maps() to return false when the CPUs lock is
>>>>> already hold in write mode by the current CPU, as read_trylock() would
>>>>> otherwise return true.
>>>>>
>>>>> Fixes: 868a01021c6f ('rwlock: allow recursive read locking when already locked in write mode')
>>>>
>>>> I'm puzzled by this as well: Prior to that and the change referenced by its
>>>> Fixes: tag, recursive spin locks were used. For the purposes here that's the
>>>> same as permitting read locking even when the write lock is already held by
>>>> the local CPU.
>>>
>>> I see, so the Fixes should be:
>>>
>>> x86/smp: use APIC ALLBUT destination shorthand when possible
>>>
>>> Instead, which is the commit that started using get_cpu_maps() in
>>> send_IPI_mask().
>>
>> ... this I then wonder whether it's really only the condition in
>> send_IPI_mask() which needs further amending, rather than fiddling with
>> get_cpu_maps().
> 
> That the other option, but I have impression it's more fragile to
> adjust the condition in send_IPI_mask() rather than fiddle with
> get_cpu_maps().
> 
> However if that's the preference I can adjust.

I guess we need other REST input here then. The two of us clearly disagree on
what use of get_cpu_maps() is meant to guarantee. And I deem fiddling with
common code here more risky (and more intrusive - the other change would be
a single-line code change afaict, plus extending the related comment).

Jan

