Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FB2B01357
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 08:11:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040472.1411909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua6yO-0000cD-Hz; Fri, 11 Jul 2025 06:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040472.1411909; Fri, 11 Jul 2025 06:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua6yO-0000am-Ef; Fri, 11 Jul 2025 06:11:04 +0000
Received: by outflank-mailman (input) for mailman id 1040472;
 Fri, 11 Jul 2025 06:11:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw5d=ZY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ua6yM-0000ZO-R8
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 06:11:02 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d12c8cd9-5e1d-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 08:11:00 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so1015224f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 23:11:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e07facsm4565048b3a.68.2025.07.10.23.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 23:10:59 -0700 (PDT)
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
X-Inumbo-ID: d12c8cd9-5e1d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752214260; x=1752819060; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k9imKEu0ihBoK4xFSf7T8shxaqwZEcWMDX85OoiFQoE=;
        b=b4Yqtn8jM8ChI0RYfPjH56cwcto+8mpHQFx3WJceJs6jZ4eInnCxAHV1KgCwZ8RuNW
         98WWBonBsCQmnaSaR2hWXETy4ijXGBeLHwqFT/7ez11+rKt8uNLR49hoGxQU7scy69dx
         7fUNAxaI1XKQK29CAoM7oGP9ZzX0ssd9Fgztr7XjDdHgEgifrb0J9rwj7ea9P5x0+2WR
         V873Q2BnHLTyZtPUngctp/xgliaa6sW+2bHG2sTatY95bvSBEViFNY/sK6F1fsVGDaQ4
         tUBIzRxjAbr6ohhGklqRnPlMfLsJTPAWkmkhoMfhNSjl229R13iUoguU0j0d+95Uss/b
         r/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752214260; x=1752819060;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9imKEu0ihBoK4xFSf7T8shxaqwZEcWMDX85OoiFQoE=;
        b=OkDJRx9q1CsyYrSzEzwz2Woe11SrOPlxdI6PRGase4dWDoGmQheJ7+RKH4JqEu2Of/
         nKqT0xAx7eZiRoEnp4yW6czCfaPsE0NPOGUwa8zkYic+7BzqtDfPy/4FbhL6/i7j3xqI
         CAXK9eEosr9ooN16hM08zrPzhzlZNqVeufv412dhzLSZO+/nFheXE43qnUtf25TD9wDE
         MbP3hQcbcpszDQFrkcRrdjoDYa6IvEF7utzUP1vW5kZvnMk2VbHLwlowbkzrH3oBJoAv
         KY2lLbFuX/mTsbgDmfJAknoAhiEkRcD4U986ywqmRNlLbJn9zrHacVRkVGf9jKWVcjQm
         OXeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWttGFG+Wa75BKx50HCyiCeqQ6T1X1hkt3tFwneswrW84GnesUBY+OAme79/xHLRH+UMsy949f5iU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHyXlmW+tBaCPJg2KIq/BabxBZJajvuHeIriJT2OXcso6FMjI9
	bq3rucvuKQRYMHuHdRzJ7N5GC76cIUHy+Wgvztg5sUxik9FlJKki2kEcFfA87pq7Hw==
X-Gm-Gg: ASbGnctNCiFfqBISQ07YYzNOF0ydy3AIzWaifDy1DHaJIKHN6HfmvMsSw7VxRcjNE3K
	cj98ZB3F5cJ0Q2s2MyGSsI1KeVOC95q+cmYbuLxOu0G/gA1Me9jkrDX2Gm2vJGyZINnMvG7fODa
	LN1j+a1SvCn88L44DS3Yi3HLI1zPa39FeMXu8Y0U7OHhW6Vs47fgp/TTkzY019tokQ7IBYqytZk
	T6poqsZYW09ypJG4sH66xI/8tEuhYwS4v9NnJ/nBiHijXiC76uOry8sfgvEX4vrhwbUZpFd/STa
	KXO274T8TqSykRuT0QVvi5qbi1vUKmCwckEz/QcrZBB/X4r4hzhUTQIB0bAzOqT1MCqXJR+zfSk
	1Fhqesefo3rRFlY3SbJ1ZReU5BgaxkHzHGsFbSG13Cgo+KGQPiSyZ6/DAWQcUq+vv8vVgPyWBaR
	7DMpq3D5o=
X-Google-Smtp-Source: AGHT+IG8+ptkuaP+Y47u4at7rghlY0Xc/lmadl6SgU1mL8abNs2ygiy45CI5tqtFlIa50oWcw2i9Ow==
X-Received: by 2002:a05:6000:21c9:b0:3a5:2b1e:c49b with SMTP id ffacd0b85a97d-3b5e7f4356fmr3486353f8f.29.1752214259920;
        Thu, 10 Jul 2025 23:10:59 -0700 (PDT)
Message-ID: <fd9c8f98-d59a-4fbe-b661-abafd54caad7@suse.com>
Date: Fri, 11 Jul 2025 08:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/x86: don't send IPI to sync TSC when it is
 reliable
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Xenia.Ragiadakou@amd.com,
 alejandro.garciavallejo@amd.com, Jason.Andryuk@amd.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2507081131060.605088@ubuntu-linux-20-04-desktop>
 <20250708183238.3104638-1-stefano.stabellini@amd.com>
 <5f6df28e-8f67-486d-b227-23b3d173b06d@suse.com>
 <alpine.DEB.2.22.394.2507101808040.605088@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507101808040.605088@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 03:34, Stefano Stabellini wrote:
> On Thu, 10 Jul 2025, Jan Beulich wrote:
>> - the function being a timer handler, it would be preferable if the timer
>>   wasn't ever activated in this mode (at which point rather than returning
>>   early, the code above could simply be purged, maybe replaced by e.g. an
>>   assertion),
> 
> I see your point about the timer not being activated in the first place.
> 
> But if we want to make the code more reliable we should keep the if
> (clocksource_is_tsc()) return; in time_calibration. That way, in case of
> mistakes elsewhere, still the desired behavior is obtained.
> 
> I'll add the changes to cpu_frequency_change and local_time_calibration.
> I'll append an incremental patch to clarify my intent.
> 
> 
>> - the above in particular requires dealing with cpu_frequency_change() (the
>>   other of the two places where the timer is actually activated).
>>
>> Some care may be needed in all of this taking into consideration that the
>> platform timer change to TSC happens late. Albeit commit f954a1bf5f74
>> ("x86/time: change initiation of the calibration timer") has imo eliminated
>> the main concern here.
>>
>> As to skipping the rendezvous: Besides invoking the calibration softirq,
>> time_calibration_nop_rendezvous() also updates the per-CPU cpu_calibration
>> fields. There would thus need to be a pretty formal proof that calculations
>> involving ->local_stime or ->local_tsc can't possibly degrade or even
>> degenerate when they remain at their boot-time values. (As to
>> ->master_stime, afaict the field simply isn't used at all in that mode,
>> which is a fair part of the reason why the code change above is okay _if_
>> the rendezvous itself can be eliminated. The justification for that could
>> also do with extending some, considering that much of the involved code is
>> pretty subtle.) Alternatively, if such a proof turned out impossible,
>> another way of updating the fields every once in a while would need adding.
> 
> Do you mean a formal proof that the TSC is actually stable from a
> hardware perspective? The software algorithm is the same no matter the
> number of updates.

No, I really mean what I said - as the deltas are going to get larger that
are used as inputs to the calculations, it is (at least to me) not entirely
obvious that the calculations using those deltas can't degrade.

>> Finally, what you do here isn't entirely reliable as to your apparent end
>> goal: "clocksource=tsc" is respected only when tsc_check_reliability()
>> completes with an acceptable outcome. There's certainly some variability in
>> this across multiple runs, i.e. if things went extremely bad, once in blue
>> moon you may end up with the TSC being rejected for use as platform timer.
>  
> That is interesting! One option is to change the code so that
> clocksource=tsc is always respected. I have appended the change on top
> of this patch. Please let me know if you have other suggestions.
> 
> 
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index d72e640f72..d29266086d 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1877,7 +1877,7 @@ int cpu_frequency_change(u64 freq)
>      update_vcpu_system_time(current);
>  
>      /* A full epoch should pass before we check for deviation. */
> -    if ( smp_processor_id() == 0 )
> +    if ( smp_processor_id() == 0 && !clocksource_is_tsc() )
>      {
>          set_timer(&calibration_timer, NOW() + EPOCH);
>          platform_time_calibration();
> @@ -2024,7 +2024,7 @@ static void cf_check local_time_calibration(void)
>      update_vcpu_system_time(current);
>  
>   out:
> -    if ( smp_processor_id() == 0 )
> +    if ( smp_processor_id() == 0 && !clocksource_is_tsc() )
>      {
>          set_timer(&calibration_timer, NOW() + EPOCH);
>          platform_time_calibration();

Is this necessary? In this mode we won't make it into this function anymore,
will we? Hence if anything an early-out would be applicable.

> @@ -2271,22 +2271,6 @@ static void cf_check time_calibration_std_rendezvous(void *_r)
>      time_calibration_rendezvous_tail(r, 0, rdtsc_ordered());
>  }
>  
> -/*
> - * Rendezvous function used when clocksource is TSC and
> - * no CPU hotplug will be performed.
> - */
> -static void cf_check time_calibration_nop_rendezvous(void *rv)
> -{
> -    const struct calibration_rendezvous *r = rv;
> -    struct cpu_time_stamp *c = &this_cpu(cpu_calibration);
> -
> -    c->local_tsc    = r->master_tsc_stamp;
> -    c->local_stime  = r->master_stime;
> -    c->master_stime = r->master_stime;
> -
> -    raise_softirq(TIME_CALIBRATE_SOFTIRQ);
> -}
> -
>  static void (*time_calibration_rendezvous_fn)(void *) =
>      time_calibration_std_rendezvous;
>  
> @@ -2488,7 +2472,7 @@ static int __init cf_check verify_tsc_reliability(void)
>           * CPUs are booted.
>           */
>          tsc_check_reliability();
> -        if ( tsc_max_warp )
> +        if ( tsc_max_warp && strcmp(opt_clocksource, "tsc") )
>          {
>              printk("TSC warp detected, disabling TSC_RELIABLE\n");
>              setup_clear_cpu_cap(X86_FEATURE_TSC_RELIABLE);
> @@ -2506,21 +2490,12 @@ static int __init cf_check verify_tsc_reliability(void)
>               */
>              on_selected_cpus(&cpu_online_map, reset_percpu_time, NULL, 1);
>  
> -            /*
> -             * We won't do CPU Hotplug and TSC clocksource is being used which
> -             * means we have a reliable TSC, plus we don't sync with any other
> -             * clocksource so no need for rendezvous.
> -             */
> -            time_calibration_rendezvous_fn = time_calibration_nop_rendezvous;

Much like you prefer to leave a safeguard in time_calibration(), I think you
want to either leave a safeguard in the rendezvous handler now "used" instead,
or you want to poison this pointer. Any of such safeguards then imo want to
include ASSERT_UNREACHABLE().

Plus of course I hope it goes without saying that much also depends on the
(to be extended) patch description.

Jan

