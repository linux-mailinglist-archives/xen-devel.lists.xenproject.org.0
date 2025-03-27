Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CAEA73224
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 13:17:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929155.1331769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmAg-0006KA-TF; Thu, 27 Mar 2025 12:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929155.1331769; Thu, 27 Mar 2025 12:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmAg-0006Ii-Pn; Thu, 27 Mar 2025 12:17:18 +0000
Received: by outflank-mailman (input) for mailman id 929155;
 Thu, 27 Mar 2025 12:17:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txmAf-0006Ic-FQ
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 12:17:17 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6950afb8-0b05-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 13:17:12 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso711905f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 05:17:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39abafed528sm16199241f8f.27.2025.03.27.05.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 05:17:10 -0700 (PDT)
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
X-Inumbo-ID: 6950afb8-0b05-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743077831; x=1743682631; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lciVHSnJ9d9cRCSWSicO851nIS+prWDgqVGwy1ZtNSs=;
        b=GgL8PLkGDrxTdJz/bjlBqZ5qSlUa7ygwtD0oxBpv3B5+TnYxhRxomrOETZvBsuIDLq
         wHn6/RTu+wHOJrwPz28qs9BJIVp7DZi9KR7uZFxbqbSmw3dyQfxG5ZuQD2bnF7VDy2VY
         fcEj275Ojiep//HMsqG6Na92TLV0YNgchUjhI059lqszl5l0iKStOuWf8R+ZZhri/lw4
         6CvtDxACetVUpCZBKB6ZIRsjYudgfWAcbGk4L/cIxcYtVmR1Ehknq2Zid0rnOY9Rio/T
         iIbzN2wAKnYKGyHRHyniQj823/smY/69rXDU1Vxg3ArJxLvvYV4mE9nqpasfVsbquEkY
         76lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743077831; x=1743682631;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lciVHSnJ9d9cRCSWSicO851nIS+prWDgqVGwy1ZtNSs=;
        b=M67ckd5RPxD9nSEFtlaoLzOH4Emk1CV/4eY5f5Bt1sGB5wadfIiY18M+jAXVMcPoB/
         Wl+YmNNNH54BGEMvgjQ7jNiHMnqYnuCICTrLFd0PE5diFPzPBv1gTmhz7ld70rvnp9sH
         yF9WwwR7HSESgYddyJ7aIQAydyL79yj2gLnQYD6Dg5KPidlx1kdG9YV8pxVWZmyK+SkA
         d/4LLWu7Vsllv0rakYIl6Wca8htBPucuynvf1J+9P0CvIy+vLUlKtCh9pj2Oy/rWNIM8
         s/ny5htLqONCIbk5iEMcrzn4MCCW6U4j2xDzqK4daivePN0JHi1tSq3wq2EaggkdLuKW
         m6HA==
X-Gm-Message-State: AOJu0YyfXj419Fhjo1jGHNnOqceqvnEgBMgcmYpO/l94GypeTmBsefz1
	AHJHxUjSMldZyYQPP7vrQi1vgDB9CHm8/Eom2bWegxlVB+O37cQQ3O/jzh2fNw==
X-Gm-Gg: ASbGncudwYmcr2L88jSoDpVHeWgQVM/mgHmtvm6oeEAd/vUTeZI8FO0NdADBTQPVuHp
	SMlQ6Xx5R/iTRfAFJh9KPGzBIFuRqOpGKjghifSc/ikPkvr2zsf67LnH00uur69MzVTLMwSrXF6
	pQ79yVcubC9VwXz/WhdQhCPhW2O2cceqj6NwRd2bwE+ZoLgKTseQbpYqdZSro88EZ0ZhqqvHqr2
	7fE1lKrBXL1GQO6kBLWMtF8Lu7wCdubjMv0iD6HLa7JRO86cbO/HulXcubyXW8MU8R/Jmd/OMCp
	62fIfdx1avuzz/sG6+LXdKnXZscqmlWFE586ZfSyIkYYV3gLEAsAKDKx+fTg7EuuXT4+WxictWW
	0I7cvPySE5kRlaan9rQqU14wYxLgLHcwWytO3Wv1l
X-Google-Smtp-Source: AGHT+IENv/6LW/BwnLUiUwxT4OyGxaG0IJGfIZM5Apin9+l9xagiwdP3JcCkVrhZarXh1T07bmrZsw==
X-Received: by 2002:a05:6000:1a8a:b0:391:1213:9475 with SMTP id ffacd0b85a97d-39ad1749fb7mr2604233f8f.24.1743077831338;
        Thu, 27 Mar 2025 05:17:11 -0700 (PDT)
Message-ID: <b504eb3b-af06-4799-b9c4-40e53d4ea762@suse.com>
Date: Thu, 27 Mar 2025 13:17:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/percpu: don't initialize percpu on resume
To: Mykola Kvach <xakep.amatop@gmail.com>
References: <7c3fece57a28462ae0c071c1cf72eb32541f1b91.1743074241.git.mykola_kvach@epam.com>
 <CAGeoDV8LFsJEgZSYcUowTZ95hu6AQro92cQOZ8409ccAvHjTSQ@mail.gmail.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <CAGeoDV8LFsJEgZSYcUowTZ95hu6AQro92cQOZ8409ccAvHjTSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 12:37, Mykola Kvach wrote:
> On Thu, Mar 27, 2025 at 1:32 PM Mykola Kvach <xakep.amatop@gmail.com> wrote:
>>
> 
> Hmm, looks like this line...
> 
>> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> ...shouldn't be here

And instead it should be "From: Mykyta Poturai <mykyta_poturai@epam.com>", to
match ...

>> Invocation of the CPU_UP_PREPARE notification
>> on ARM64 during resume causes a crash:
>>
>> (XEN) [  315.807606] Error bringing CPU1 up: -16
>> (XEN) [  315.811926] Xen BUG at common/cpu.c:258
>> [...]
>> (XEN) [  316.142765] Xen call trace:
>> (XEN) [  316.146048]    [<00000a0000202264>] enable_nonboot_cpus+0x128/0x1ac (PC)
>> (XEN) [  316.153219]    [<00000a000020225c>] enable_nonboot_cpus+0x120/0x1ac (LR)
>> (XEN) [  316.160391]    [<00000a0000278180>] suspend.c#system_suspend+0x4c/0x1a0
>> (XEN) [  316.167476]    [<00000a0000206b70>] domain.c#continue_hypercall_tasklet_handler+0x54/0xd0
>> (XEN) [  316.176117]    [<00000a0000226538>] tasklet.c#do_tasklet_work+0xb8/0x100
>> (XEN) [  316.183288]    [<00000a0000226920>] do_tasklet+0x68/0xb0
>> (XEN) [  316.189077]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0x194
>> (XEN) [  316.195644]    [<00000a0000277638>] shutdown.c#halt_this_cpu+0/0x14
>> (XEN) [  316.202383]    [<0000000000000008>] 0000000000000008
>>
>> Freeing per-CPU areas and setting __per_cpu_offset to INVALID_PERCPU_AREA
>> only occur when !park_offline_cpus and system_state is not SYS_STATE_suspend.
>> On ARM64, park_offline_cpus is always false, so setting __per_cpu_offset to
>> INVALID_PERCPU_AREA depends solely on the system state.
>>
>> If the system is suspended, this area is not freed, and during resume, an error
>> occurs in init_percpu_area, causing a crash because INVALID_PERCPU_AREA is not
>> set and park_offline_cpus remains 0:
>>
>>     if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
>>         return park_offline_cpus ? 0 : -EBUSY;
>>
>> The same crash can occur on x86 if park_offline_cpus is set
>> to 0 during Xen resume.
>>
>> Fixes: f75780d26b2f ("xen: move per-cpu area management into common code")
>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

... the first S-o-b?

>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Changes introduced in V2:
>>  - cosmetic fixes after review
>>  - chnages in a commit message: add "Fixes"
>> ---
>>  xen/common/percpu.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/common/percpu.c b/xen/common/percpu.c
>> index e4e8b7bcab..b20f0460fc 100644
>> --- a/xen/common/percpu.c
>> +++ b/xen/common/percpu.c
>> @@ -30,7 +30,9 @@ static int init_percpu_area(unsigned int cpu)
>>      char *p;
>>
>>      if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
>> -        return park_offline_cpus ? 0 : -EBUSY;
>> +        return park_offline_cpus || system_state == SYS_STATE_resume
>> +            ? 0
>> +            : -EBUSY;

Nit: That's not quite the indentation I suggested to use, I think?

Jan

