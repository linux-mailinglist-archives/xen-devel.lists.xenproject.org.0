Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF437A18115
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 16:23:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875491.1285938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taG5t-000154-1O; Tue, 21 Jan 2025 15:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875491.1285938; Tue, 21 Jan 2025 15:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taG5s-00013b-UH; Tue, 21 Jan 2025 15:23:08 +0000
Received: by outflank-mailman (input) for mailman id 875491;
 Tue, 21 Jan 2025 15:23:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQWO=UN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1taG5s-00013V-1O
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 15:23:08 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ca21e3f-d80b-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 16:23:05 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-385deda28b3so3659417f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 07:23:05 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327e024sm13375672f8f.88.2025.01.21.07.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 07:23:03 -0800 (PST)
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
X-Inumbo-ID: 9ca21e3f-d80b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737472985; x=1738077785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oEIlm5ePJ0nksZRQlQPghhrfweIrmTE/Nq0MrDDvxd8=;
        b=s+mgwQfc+oKm5KZM7TH8YLBSOmT+MpPS6eH+raLJETGpAhD69WdzWkB8C3Qgt7/8Sv
         uE3FBv+kXxWfFFN2H6uxfmzBlo9Y7cfEAE7LOLueKxagWMyPHWKdErQ5YWLfRx53Ehcl
         C22oKncN6Ina1i3YIE1hFIrP9pe4m/NgF9cfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737472985; x=1738077785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEIlm5ePJ0nksZRQlQPghhrfweIrmTE/Nq0MrDDvxd8=;
        b=ZgySn4crtxY3/IRUz4xx6h5/YnpHsdGyd0HaLY5b6CU9+GBz0YHaknSHNkN56+YZlO
         9ZepssjdWEnvOQPksu8Ze6euiUTo7prw40aR+xJ6a7ysI+5bu6MTiHjEDbAq9QTirXvD
         00iK/YPQDD4aB4JLBEgIZdJNg+hcrwWqZkJv416z1xL/4lC2ptF9gHUdvkZvnZY8jw0V
         Dg1RGs4QoBbrIZTctJ/A5ez3SGP+eyDmukTrmT56DenvjZBmo+8JEOkt7FFnKgLf9InM
         tnbr4A17J/RIX9UtCJqcaNBhBWQUuWUuC3DoxUIMZV5pN2oxTOtSXjhTXJtMZY2DrbV7
         8Z8w==
X-Forwarded-Encrypted: i=1; AJvYcCXSps/Ica1k/YkZbLzyi9E8nlC1Vb4qxVKRc0zZ1WQrXkqY7sbz3ZvJNVphqAUBpHG/dFHnO8O9YtQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5VUhPKgHPlVowxUaaGGrAx8rVSNgTPZcc9COY0MVo7GWwfytG
	JhxGdh6DbauxFmr4eiAY6lvTdigtOKodptyZv/qP1XDItAiFNhEUB1orW/Nx3Jo=
X-Gm-Gg: ASbGnct8PQ6Q/iVvz/6HKuUGhY4JZDp8Rdu0KcY4mz264Q1VN+dyvssX8I97+RvjiFz
	iL938GlTGgJgoh/TosjB0Wrv9bSiZyga6NzbpITEMydCkVFIt2Q/369XiAsOviglTqeu0yLim3q
	nM1boCyMq5nEFhEwpiuZJPfVwXeRVgRcr5kjbGcVRqJMfvM1sRku9JbBdzhOD9F91ovytLtZ5Fy
	kTSRIGNpvcFmjz/EOn62ac4qcDQSxPv6JyMVSPhtIfvFgDdTV9gG9i5ZSPuJMk/U5FeMfiYENAa
	8KOxSBiwVtW8Zcy9jwPx0F9lbIsdtAu1aA==
X-Google-Smtp-Source: AGHT+IGe49Z3ty2pUyKl+Rf7PRVyYl0ukJY5JlQ6y74BWTG1cnQWVUmQ/sD0ZbIAbDb2Hj9bLfjtew==
X-Received: by 2002:adf:ef04:0:b0:385:f23a:2fe1 with SMTP id ffacd0b85a97d-38bf566f7c9mr12437027f8f.26.1737472983519;
        Tue, 21 Jan 2025 07:23:03 -0800 (PST)
Message-ID: <ae54889d-ae82-4df3-a35f-ea09f3972eec@citrix.com>
Date: Tue, 21 Jan 2025 15:23:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/intel: Fix PERF_GLOBAL fixup when
 virtualised
To: Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jonathan Katz <jonathan.katz@aptar.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250121142510.358996-1-andrew.cooper3@citrix.com>
 <2b36d54d-88fb-4ad4-b0e4-cfa837872b14@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2b36d54d-88fb-4ad4-b0e4-cfa837872b14@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/01/2025 3:03 pm, Jan Beulich wrote:
> On 21.01.2025 15:25, Andrew Cooper wrote:
>> Logic using performance counters needs to look at
>> MSR_MISC_ENABLE.PERF_AVAILABLE before touching any other resources.
>>
>> When virtualised under ESX, Xen dies with a #GP fault trying to read
>> MSR_CORE_PERF_GLOBAL_CTRL.
>>
>> Factor this logic out into a separate function (it's already too squashed to
>> the RHS), and insert a check of MSR_MISC_ENABLE.PERF_AVAILABLE.
>>
>> This also limits setting X86_FEATURE_ARCH_PERFMON, although oprofile (the only
>> consumer of this flag) cross-checks too.

Fixes: 6bdb965178bb ("x86/intel: ensure Global Performance Counter
Control is setup correctly")

(fixed up locally).

>> Reported-by: Jonathan Katz <jonathan.katz@aptar.com>
>> Link: https://xcp-ng.org/forum/topic/10286/nesting-xcp-ng-on-esx-8
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> Untested, but this is the same pattern used by oprofile and watchdog setup.
> Wow, in the oprofile case with pretty bad open-coding.
>
>> I've intentionally stopped using Intel style.  This file is already mixed (as
>> visible even in context), and it doesn't remotely resemble it's Linux origin
>> any more.
> I guess you mean s/Intel/Linux/ here? (Yes, I'm entirely fine with using Xen
> style there.)

Oops yes.

>
>> --- a/xen/arch/x86/cpu/intel.c
>> +++ b/xen/arch/x86/cpu/intel.c
>> @@ -535,39 +535,49 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
>>      printk("%u MHz\n", (factor * max_ratio + 50) / 100);
>>  }
>>  
>> +static void init_intel_perf(struct cpuinfo_x86 *c)
>> +{
>> +    uint64_t val;
>> +    unsigned int eax, ver, nr_cnt;
>> +
>> +    if ( c->cpuid_level <= 9 ||
>> +         rdmsr_safe(MSR_IA32_MISC_ENABLE, val) ||
> In e.g. intel_unlock_cpuid_leaves() and early_init_intel() and in particular
> also in boot/head.S we access this MSR without recovery attached. Is there a
> reason rdmsr_safe() needs using here?

Abundance of caution.  cpufreq/hwp.c uses a safe accessor.

Given the regular NMI path works, I doubt we need the _safe() here.

As future work, it's accessed loads of times, so I'm highly tempted to
have the BSP sanitise it once, and have the APs copy the "global" value.

>
>> +         !(val & MSR_IA32_MISC_ENABLE_PERF_AVAIL) )
>> +        return;
>> +
>> +    eax = cpuid_eax(10);
>> +    ver = eax & 0xff;
>> +    nr_cnt = (eax >> 8) & 0xff;
>> +
>> +    if ( ver && nr_cnt > 1 && nr_cnt <= 32 )
>> +    {
>> +        unsigned int cnt_mask = (1UL << nr_cnt) - 1;
>> +
>> +        /*
>> +         * On (some?) Sapphire/Emerald Rapids platforms each package-BSP
>> +         * starts with all the enable bits for the general-purpose PMCs
>> +         * cleared.  Adjust so counters can be enabled from EVNTSEL.
>> +         */
>> +        rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, val);
>> +
>> +        if ( (val & cnt_mask) != cnt_mask )
>> +        {
>> +            printk("FIRMWARE BUG: CPU%u invalid PERF_GLOBAL_CTRL: %#"PRIx64" adjusting to %#"PRIx64"\n",
>> +                   smp_processor_id(), val, val | cnt_mask);
>> +            wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, val | cnt_mask);
>> +        }
>> +    }
>> +
>> +    __set_bit(X86_FEATURE_ARCH_PERFMON, c->x86_capability);
> This moved, without the description suggesting the move is intentional.
> It did live at the end of the earlier scope before, ...

Final paragraph of the commit message?

If PERF_AVAIL is clear, we don't have ARCH_PERFMON, whatever the CPUID
leaves say.

OTOH, this bit really doesn't serve much value.  Given oprofile
cross-checks everything anyway, I think it can be dropped.

~Andrew

