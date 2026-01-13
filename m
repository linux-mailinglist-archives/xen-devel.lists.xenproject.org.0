Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D992DD19C40
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 16:12:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201911.1517539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfg4T-0004w7-7s; Tue, 13 Jan 2026 15:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201911.1517539; Tue, 13 Jan 2026 15:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfg4T-0004uU-5D; Tue, 13 Jan 2026 15:12:37 +0000
Received: by outflank-mailman (input) for mailman id 1201911;
 Tue, 13 Jan 2026 15:12:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfg4R-0004uN-MO
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 15:12:35 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 491a87f7-f092-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 16:12:33 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47d3ffa5f33so34851195e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 07:12:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8384646fsm376030365e9.15.2026.01.13.07.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 07:12:32 -0800 (PST)
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
X-Inumbo-ID: 491a87f7-f092-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768317153; x=1768921953; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k+AX2P/aEwR6Jzik9nbZgyFYQIUWOTVqxYkfzWuPbRA=;
        b=aW6cQX5+UafDEWoz0Kyk1H8K+ckPHulJpR7C2mBHdGobZAqN1ZkeufJh77aPP1gTct
         xfSx0/V6d8aYWmSIUxpjlC4YlUStLgpGJq74bCfSYmZAvRZdYdv0KQ02Ra0OwqwYuDIs
         SHjV21ffILYGJyjVSK3QVDzAJc16Bf08tks9+x14+d+o5Ql+/FgIQ/ynxKjsiTemZo3g
         b6sMd6iB7zuMc82ZVNnbIn6brpNFF+iBLQet8S3kVxrHJaUXsqvQLW2CZlv7nN/bgBSa
         Vruwb/cIo2cxYmn5UzMH++lIzjSAoF2CtxlmpvHHEqgmkt85rR0CCp0pN4bTw6TFJdqv
         Qing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768317153; x=1768921953;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+AX2P/aEwR6Jzik9nbZgyFYQIUWOTVqxYkfzWuPbRA=;
        b=w6DuOpCVziqkPb5h2JypqQADavr8a3zCRBxKg145y4ajPLzsNVmQ+nMg/RnA0wXldX
         EUYFZmghHQNLFiCC76kcMrbBwcDu+qOwjBq0tNKRS5w6YPFiYCJ/4OtyCu++hyAR7JOu
         lO5i+RHo6llPZe7M2gooIif9d1cbcX+i8rke5abZxISDuUDxI+Gw4PxBlPyq2dVVHRET
         k00X7ltZnup/D6tp1Yq9otE5ahS2pCX0Uv+2fZUNiKIyK56G95bb5pSsSuAWbn3lllhv
         RJR3OtKhCdYvaWV3plKi9hLvK46kyEKVPOVr8LBLZhD8KNEMDCQJIPsRYnyXE5sVcSvH
         Z/mA==
X-Forwarded-Encrypted: i=1; AJvYcCVlyPYB0ecSVfXyp9bVhp7RPpdJrGPjCaaODe7YzWutbSEnmBWcy/qREGsfTyKtlYEG+KokL+ZhWoM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoaX8lkbkCnJoEsd5V++lmmb3ReWZSc/tcbK2xROyIAt2Ka/83
	2ks3KwLVS5VjySs6F5/2v4Z4RYG6WgqSf5yH4GfAQg+ADzCVlSGr/K+4v56TCFXq3A==
X-Gm-Gg: AY/fxX75865XdbghrbebHoAPfudrJhHHEVAhP3sgRxdIpVghwl+ojVCov/Aq5hmFO0a
	jaSEDu+GR5neuNcGz0UwoZeCdmBhvfr21EXVj9JhiZRqoBCL34GGpUJcljFXLug8P2nEfdxYXF5
	MwY+OEtsEW+kJdVrcaihm7jbwQZNRRu7NJsd0NmfeeRhEPOvA3CXquPwyHwRgXxg/3WtJmcKIuK
	daxyqQZMQZucleekXy51MbROvHMnKGrSq69J7k5jJh2RwlfKq7xzO7dWacqATyxMTmc6NZLomaG
	ouu1ivUj3RA0PG+v4yC54ISDGefxm11Rehhbpn4GzeD/mTrSuIgaBf3c1ylaGwZpATdorziU4QK
	CTDdjYAhIGjw7ylaPCZI/DXUc4Y9wdOETEDdLzWmMSgp3tUF4IHpkweClYgue3lscUhGC92pbeq
	sxvoEFMhplJv9V7ekj49OJQ/AHiKDJ08ZH7miMaYEircpC9fIifG2usB8Bzhkx3goKL0FMt3Dxr
	N4=
X-Google-Smtp-Source: AGHT+IEBLZpeMjeUUF6BWX/ud2bEiNAeU5uwc3qkou6XLPsDMV8XJTFg3J+Idrh6K+MZP4pviQ0n7w==
X-Received: by 2002:a05:600c:3b90:b0:477:a02d:397a with SMTP id 5b1f17b1804b1-47d84b26cccmr232837135e9.2.1768317152576;
        Tue, 13 Jan 2026 07:12:32 -0800 (PST)
Message-ID: <f7a47af4-6523-4d92-9beb-0daf639f2f36@suse.com>
Date: Tue, 13 Jan 2026 16:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/15] xen/riscv: introduce vtimer_set_timer() and
 vtimer_expired()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <8cd3efa488b3da2a6751c92d20bbfeb87b3ba39a.1766595589.git.oleksii.kurochko@gmail.com>
 <f8808dd1-d571-49ea-8739-ed06dd6c79d1@suse.com>
 <4e18e4fc-de62-44fc-8ea0-517f6c7ef47f@gmail.com>
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
In-Reply-To: <4e18e4fc-de62-44fc-8ea0-517f6c7ef47f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.01.2026 15:44, Oleksii Kurochko wrote:
> On 1/8/26 11:28 AM, Jan Beulich wrote:
>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>> @@ -15,7 +17,9 @@ int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config)
>>>   
>>>   static void vtimer_expired(void *data)
>>>   {
>>> -    panic("%s: TBD\n", __func__);
>>> +    struct vtimer *t = data;
>> Pointer-to-const please.
>>
>>> @@ -37,3 +41,27 @@ void vcpu_timer_destroy(struct vcpu *v)
>>>   
>>>       kill_timer(&v->arch.vtimer.timer);
>>>   }
>>> +
>>> +void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
>>> +{
>>> +    s_time_t expires = ticks_to_ns(ticks - boot_clock_cycles);
>> boot_clock_cycles is known to just Xen. If the guest provided input is an
>> absolute value, how would that work across migration? Doesn't there need
>> to be a guest-specific bias instead?
> 
> I think that I don't understand fully your questions, but it sounds like it is a job
> for htimedelta register.

Ah yes. As said, still learning RISC-V while reviewing your work.

>>> +    vcpu_unset_interrupt(t->v, IRQ_VS_TIMER);
>>> +
>>> +    /*
>>> +     * According to the RISC-V sbi spec:
>>> +     *   If the supervisor wishes to clear the timer interrupt without
>>> +     *   scheduling the next timer event, it can either request a timer
>>> +     *   interrupt infinitely far into the future (i.e., (uint64_t)-1),
>>> +     *   or it can instead mask the timer interrupt by clearing sie.STIE CSR
>>> +     *   bit.
>>> +     */
>> And SBI is the only way to set the expiry value? No CSR access? (Question
>> also concerns the unconditional vcpu_unset_interrupt() above.)
> 
> If we don't have SSTC extension support then I suppose yes, as CSR_MI{E,P} could
> be accessed only from M-mode:

How do M-mode CSRs come into play here? My question was rather towards ...

>   (code from OpenSBI)
> void sbi_timer_event_start(u64 next_event)
> {
> 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_SET_TIMER);
> 
> 	/**
> 	 * Update the stimecmp directly if available. This allows
> 	 * the older software to leverage sstc extension on newer hardware.
> 	 */
> 	if (sbi_hart_has_extension(sbi_scratch_thishart_ptr(), SBI_HART_EXT_SSTC)) {
> #if __riscv_xlen == 32
> 		csr_write(CSR_STIMECMP, next_event & 0xFFFFFFFF);
> 		csr_write(CSR_STIMECMPH, next_event >> 32);
> #else
> 		csr_write(CSR_STIMECMP, next_event);
> #endif

... what if a guest did these CSR writes directly. Besides intercepting
access to them, you'd also need to synchronize both paths, I suppose.

>>> +    {
>>> +        stop_timer(&t->timer);
>>> +
>>> +        return;
>>> +    }
>>> +
>>> +    set_timer(&t->timer, expires);
>> See the handling of VCPUOP_set_singleshot_timer for what you may want to
>> do if the expiry asked for is (perhaps just very slightly) into the past.
> 
> I got an idea why we want to check if "expires" already expired, but ...
> 
>> There you'll also find a use of migrate_timer(), which you will want to
>> at least consider using here as well.
> 
> ... I don't get why we want to migrate timer before set_timer() here.
> Could you please explain that?

Didn't I see you use migrate_timer() in other patches (making me assume
you understand)? Having the timer tied to the pCPU where the vCPU runs
means the signalling to that vCPU will (commonly) be cheaper. Whether
that actually matters depends on what vtimer_expired() will eventually
contain. Hence why I said "consider using".

Jan

