Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9827CD13E57
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 17:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200665.1516526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKTE-0001X4-E3; Mon, 12 Jan 2026 16:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200665.1516526; Mon, 12 Jan 2026 16:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKTE-0001VW-BK; Mon, 12 Jan 2026 16:08:44 +0000
Received: by outflank-mailman (input) for mailman id 1200665;
 Mon, 12 Jan 2026 16:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfKTC-0001VQ-Qf
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 16:08:42 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4ef6df4-efd0-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 17:08:39 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47d182a8c6cso39025475e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 08:08:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f661a03sm376363985e9.13.2026.01.12.08.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 08:08:38 -0800 (PST)
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
X-Inumbo-ID: f4ef6df4-efd0-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768234118; x=1768838918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VKV6Ly1AzxRcAR3RvXMyZrr2y9yUwnfw167XiWvLG4s=;
        b=IaEzBl2pOZQCbK65df/CnOqgBxYhZvHkG+gLepih0Yqzb3Gzi2dyY6smk1q7y9bS8V
         PfgHKMNbfyHL1GlHeJeiUzOdhBkByPIJ37Udge4A1LCMnuiyCx+yjW8u2i+cG/SzeYnx
         Y9JTNvuIkDjgW9GSdaqRZ1xE3Josvs6yx9OHLuBH4Wwx/LLbRCJ9pO4kj7zVOmYovj25
         6/9mM3agp1ICNQ4UcA7aErteX33Dd4Gp44jkqoCMBpZIJlNhLpEOPx9QzNbQgzvdmNpg
         5w0OPMbb49XjE+oTovoTivYHp5Tmd/+pPg3GG/4+zIFIkfZZwAV3/rkw6bsTYJl1n+GB
         KS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768234118; x=1768838918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKV6Ly1AzxRcAR3RvXMyZrr2y9yUwnfw167XiWvLG4s=;
        b=KEQjaZpJ+Djzl2f0/MIjok/Wc1qHT/8c61OicKSmcgHTOfsDd1UfbAwuU7uu2idLWZ
         H/8uK5NEaaAXgxkOE94hs/nNtbtVy3ivEkT0nXktSt5BvG9Xek3avt3MiXCGgRkSqNdV
         wwTfR7z6Ic242VHIoGxblU1Kfef5MJJ4mqV6Sg/gB1SHxJYHdbdbnL+8dBJ+06M+hiro
         z8CfvBWoED/Iqxj+kms9ZGuqtKRiZz9F4qZNxFcifTrptsXOYY9WDQE2Hjt5FaB9LmWz
         3FqP0VTO9XzHPw6ek+1XPp8Z6jalEOaSoww2uNPlGDb63iTSmdPXSnuhDuPLieHOFoCw
         Viow==
X-Forwarded-Encrypted: i=1; AJvYcCWdhhHpsmJj2QLoPK/RE5F4DjqXQh2SWFe/D28P8uSSIKopMbhuM3ZK6wRtb0xXCQNrdLzEeIEcFCg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDYBfDXYgdHwcLx2CMX4/tepmyfx4VPV46jiQgP5ez76ptlAOV
	aL3PAtr6YRqTDElfILdA6+zmlm2zTUxAPn6tPM22teWVR4w909WOEQIP08rFLYMPag==
X-Gm-Gg: AY/fxX67koXhspRs1OJCNLC9W9IgbaemRdTmMXXGK0zmI82Svb+5tmYWrrPO2fGI/zn
	rVUESHvJuAm+tmSlTvUWz8ERYopqnXMoVeRr1dYlaFSNrMRSYg52YhQzan6q5F1W6ga6y5mWVJ0
	BsZT1HcGooQLqlrrAmihPUeHLpIyEicGduVfT5iEYgmT6XpJlxdrCZYgBEJ34i7XA+6nuVzUkKI
	9QsMG/UZsOFI7kleCDqHzlFo/HQ3QezqT8Pl+uHucGCWNmIEYlj0tGvotN9pfqJ/awyg0Xq4881
	gm9Zo8OyVEL7kaQpgH+iVoD+0HN/ldaf6gYNyaqQdRNq8aHTJLs+9yH5Qg68o49dckQ1tVMoaRv
	sd4SI4Hd9RnXpWm5RcJwFefchaAe7XfDlUMMFCmsyr5xIBoQz4pFqB+qHM5GHxwmP+TcAjCudNH
	vG+/1okfCx9gY7/V8z0fgs1Sfof7yjPC6Mfa2ZfV687nY7J99gXfhsi0++iDysiUJX3NLNY9Bsi
	5ayWX0OQJ2kmg==
X-Google-Smtp-Source: AGHT+IHCfUfEz0zjGeBNkTaQI9T8adA8nx2ruT58ln2fWEMITMGBHDYY6qhIlsTtG3dK+9dCOOqXxA==
X-Received: by 2002:a05:600c:1991:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-47d84b4119amr192870345e9.32.1768234118459;
        Mon, 12 Jan 2026 08:08:38 -0800 (PST)
Message-ID: <b70e2c0e-7e8d-41d8-97da-5b975ad0ed47@suse.com>
Date: Mon, 12 Jan 2026 17:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in
 get_s_time_fixed()
To: Anton Markov <akmarkov45@gmail.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com>
 <4a6b6307-9014-4c4c-8c23-3673efa2d1b1@gmail.com>
 <794c382b-3b20-4d2a-ab70-b24d7fdf88ae@suse.com>
 <CACQYvN-fiATs2dtdboYxCreF8kF5RsgoH-zgWtQ59iVNOT_wVg@mail.gmail.com>
 <CACQYvN_JbPs9TAs4GYO3myVbehwU9Zz_BhQqj1jVT2Sfg30qUQ@mail.gmail.com>
 <4b03cf36-d2d8-420c-82df-55d6a9ac9d68@suse.com>
 <CACQYvN9cLwXy=rtYgEyTUsqxCYvP0-qFsEW=y8B3Fo9mauNx-g@mail.gmail.com>
 <6ea436ce-6ecb-47f8-8d8a-98b0badeb14e@suse.com>
 <CACQYvN_dZxXmvhBd8pZ41Kws_n_TXcwp5mMQ=H0Vu89Px8M+PA@mail.gmail.com>
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
In-Reply-To: <CACQYvN_dZxXmvhBd8pZ41Kws_n_TXcwp5mMQ=H0Vu89Px8M+PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2026 15:51, Anton Markov wrote:
> That's if IPIs are sent sequentially. In the most common case, they aren't,
>> though - we use the all-but-self shorthand.
> 
> Actually, even if IPIs are sent sequentially, I can't see where you spot
>> this effect: Both callers of time_calibration_rendezvous_tail() signal all
>> secondary CPUs to continue at the same time. Hence they'll all execute
>> time_calibration_rendezvous_tail() in parallel.
> 
> In parallel, but with a slight delay.
> 
> Are they? I fear I don't know which part of the code you're talking about.
> 
> In the function "time_calibration" (xen/arch/x86/time.c) Sorry, I don't
> take into account that you don't stay in context, being distracted by other
> threads.

That calls on_selected_cpus(), but send_IPI_mask() may then still resort to
all-but-self. In that case all IPIs are sent in one go.

Plus as said, how IPIs are sent doesn't matter for the invocation of
time_calibration_rendezvous_tail(). They'll all run at the same time, not
one after the other.

Since further down you build upon that "IPI lag", I fear we first need to
settle on this aspect of your theory.

Jan

> One of the reasons we (iirc) don't do that is that since the scaling factor
>> is also slightly imprecise, we'd prefer to avoid scaling very big values.
>> IOW by changing as you suggest we'd trade one accumulating error for
>> another.
> 
> As I wrote above, there will be an error when using scale_delta, but it
> won't accumulate between calls to time_calibration_rendezvous_tail. In the
> current version, the old error (ipi lag + rounding error) persists due to
> the use of the old local_stime in the get_s_time_fixed function, and it's
> added to the new error and accumulates with each call.
> If
> 
> c->local_stime = get_s_time_fixed(old_tsc ?: new_tsc);
> 
> replaced with:
> 
> c->local_stime = scale_delta(old_tsc ?: new_tsc);
> 
> Then we'll only be dealing with the error due to the current ipi lag and
> rough rounding, within a single call.
> 
> If I understand you correctly, you fixed the rough rounding of scale_delta
> by reducing the values using get_s_time_fixed . But the problem is, that
> didn't help. The error now accumulates gradually because we're relying on
> old calculations. Furthermore, while the old rounding error was limited,
> now the error accumulates infinitely, albeit very slowly. If this is so,
> then the solution to the problem becomes less obvious.
> 
> Roughly speaking, my servers start to go crazy after a week of continuous
> operation, as the time lag between cores reaches 1 millisecond or more.
> 
> On Mon, Jan 12, 2026 at 5:13 PM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 12.01.2026 13:49, Anton Markov wrote:
>>>> Btw, your prior response was too hard to properly read, due to excess
>> blank
>>>> lines with at the same time squashed leading blanks. Together with your
>>>> apparent inability to avoid top-posting, I think you really want to
>> adjust
>>>> your mail program's configuration.
>>>
>>> I suggest we skip the discussion of formatting and the number of spaces
>> in
>>> messages and instead focus on the topic of the thread. I have a very
>>> difficult time troubleshooting difficult-to-reproduce bugs, and the fact
>>> that their descriptions are difficult to read due to the number of spaces
>>> is probably the least of the difficulties.
>>
>> Perhaps, yet it still makes dealing with things more difficult.
>>
>>> That invocation of get_s_time_fixed() reduces to scale_delta() (without
>>>> further rdtsc_ordered()), as non-zero at_tsc is passed in all cases. IOW
>>>> it's not quite clear to me what change you are suggesting (that would
>>>> actually make a functional difference).
>>>
>>> Replacing get_s_time_fixed with scale_delta will remove the calculation
>>> dependency on the previous local_stime value, which accumulates lag
>> between
>>> cores. This is because: rdtsc_ordered is not called synchronously on the
>>> cores, but by the difference offset by the ipi speed. Therefore, we get:
>>>
>>> core0: current_rdtsc;
>>> core1: current_rdtsc + ipi speed;
>>> coreN: current_rdtsc + ipi speed * N;
>>
>> That's if IPIs are sent sequentially. In the most common case, they aren't,
>> though - we use the all-but-self shorthand.
>>
>> Actually, even if IPIs are sent sequentially, I can't see where you spot
>> this effect: Both callers of time_calibration_rendezvous_tail() signal all
>> secondary CPUs to continue at the same time. Hence they'll all execute
>> time_calibration_rendezvous_tail() in parallel.
>>
>>> Since ipi values are sent alternately in a loop to core0,
>>
>> Are they? I fear I don't know which part of the code you're talking about.
>>
>>> in the version
>>> with get_s_time_fixed, we get the following local_stime calculation
>> format.
>>>
>>> coreN: local_stime = local_stime + scale_delta((current_rdtsc +
>> (ipi_speed
>>> * N)) – local_rdtsc);
>>
>> One of the reasons we (iirc) don't do that is that since the scaling factor
>> is also slightly imprecise, we'd prefer to avoid scaling very big values.
>> IOW by changing as you suggest we'd trade one accumulating error for
>> another.
>>
>> Jan
>>
>>> This means the time on each core will differ by ipi_speed * N. And since
>>> we're using the values of the previous local_stime, the difference will
>>> accumulate because the previous local_stime was also offset. In the
>> version
>>> with scale_delta, we get:
>>>
>>> coreN: local_stime = scale_delta(current_rdtsc + (ipi_speed * N));
>>>
>>> This means there will still be a difference, but it won't accumulate, and
>>> the offsets will remain within normal limits.
>>>
>>> If it's still unclear: If your local_stime in get_s_time_fixed is offset
>>> relative to other cores, then the fact that rdtsc_ordered and local_tsc
>> are
>>> not offset doesn't change anything, since you're using the delta relative
>>> to local_stime.
>>>
>>> core0_local_stime + (rdtsc_ordered() - local_tsc) != core1_local_stime +
>>> (rdtsc_ordered() - local_tsc); // Even if rdtsc_ordered() and local_tsc
>> are
>>> equal across cores.
>>>
>>> On 96-core configurations, up to a millisecond of latency can accumulate
>> in
>>> local_stime over a week of operation, and this is a significant
>>> difference. This
>>> is due to the fact that I use cpufreq=xen:performance max_cstate=1 ,
>>> meaning that in my configuration, local_stime is never overwritten by
>>> master_stime.
>>>
>>> Thanks.
>>
> 


