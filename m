Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF07B1C58D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 14:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071705.1435111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujctU-0002tb-06; Wed, 06 Aug 2025 12:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071705.1435111; Wed, 06 Aug 2025 12:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujctT-0002r8-TM; Wed, 06 Aug 2025 12:05:19 +0000
Received: by outflank-mailman (input) for mailman id 1071705;
 Wed, 06 Aug 2025 12:05:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujctS-0002r2-LH
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 12:05:18 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d5aaafb-72bd-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 14:05:16 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61592ff5ebbso11477533a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 05:05:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f2d554sm9973029a12.27.2025.08.06.05.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 05:05:15 -0700 (PDT)
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
X-Inumbo-ID: 9d5aaafb-72bd-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754481916; x=1755086716; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sLCd4IaoE76twotR9S2hXs+L3Dc9CQcHVKB6velLhNs=;
        b=aIeh/bGTNtVch6LT+ZQezJISfnAKopPBSGWAO5LlmhQ7RZPjcB/iIzEF4lADfrN5wq
         TgltKHaSw5euZrFyYx8aarNdVUCHVQHluGq3B+wMCrETK2zGvj3QZ62nEJQ5jFPVupFN
         IpXcasrY+nAeF+7Vnxb9JXZbWiluspr1J82ofx6VLhEVoisUpJJ0Oi1WVoD1tA5w8PUp
         FGNAABMywNkkDAjaF1Hb9+rg/eS5gLR1VtEm7SQsY3l28HqpPM1UWBP6VTu3gFmZwFMj
         4cPANlMSQOqGaXl1QrHZoSaGS2eWxVBUtjQHIBhY7rWnKvpgQSTsMzmqRurBIqLDHO21
         QWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754481916; x=1755086716;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLCd4IaoE76twotR9S2hXs+L3Dc9CQcHVKB6velLhNs=;
        b=RM4kvpbsOfGM/hJ3yU/8zFHcviskEnB1K023gBfD8lSCtfysx1OjX0CxUCTTma+PoK
         Dysf+3GKmwUBVwwflB2TAjDh08sG45Cn83kr1Y5OVNsBEiWveI+vUAfh6UGWpb1Ck2gR
         c3K7m5HyFJKIB8s59KbSkpZQmWB9z6Nj+9ckxgJSdNBoM0PBMf2Goy2Eqdj1K69jmY49
         ndlnLEa3YEreOPJJrfqAFg3vxSKUOMeUdC7/fjCq2vEVAUY6Rk5wS3mbiy2UwjF6kz0u
         Mb5SXPZpsMyLG/JfgAs6yJFqRerVXnzxWO08NRXFYlvg+vdU5SqTpHuTWN7jqBIXrFMI
         CUmA==
X-Forwarded-Encrypted: i=1; AJvYcCXILtsDycblmHmLsEcnMJKdxT69/nPLhE2qd/3jQXm48vtcP6YO6v0PlY5Muj50wMgtMVBj9bT7FPs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywc8Znxg6y/kys6HlWxx9R7eB3ihtJywEG2pzguStqsTIjqJgPD
	sZudZLNiWRwognCAkx4tUMoZZ/uWwZ5jvAlJdH8AWox7IL62KS5ye9GV+f6XEys9Xw==
X-Gm-Gg: ASbGncvKnsy4IFt5UzabIHOiPbfdiD20Diur5XHMrQJcbkhHBAyA6Czzog9hub+EWV2
	GbFySdTdngjoHlTFqHhGp4Rrk2nyltYdpu092bJgD+fGJ27sSCOTEJrzbqGh3Ba1/Jd0ZuMIqkM
	oiwEGhqCldVjCzdwLtn9Fm5rFOl8CHUgkrw20dN3ohPYsm3NwmdroByV1hREhQJbPa3yyq2hdkb
	eEjhN72zkcTDgqWjORK56Zg/OxeuprQTiG5tWnvrPUrcQ1K0Hq0DXPde+h3HsBCKqtVYHHwH173
	5o9+qXcjFKG8myvpEgOwbVXICzjM+utlMAu6oOkW47P3JRlZUyYUkDRjEfYclFuYnjK3s6RMqFf
	4oykFmCoUA471UjlDOHLNWDT9ftKEwO1WqS24PtJbvaAeWydzTKJLWQnDPjWvdlHuQrkdBYfOt0
	l0a8WtLWs=
X-Google-Smtp-Source: AGHT+IEBqwPmWu+w9Qbs/gXyTYdbneYNwW2IvBKbESiVQO6XyAdxIZkrUaTYseGC8XTuAljOeT6/FA==
X-Received: by 2002:a05:6402:520d:b0:612:b9bf:2a56 with SMTP id 4fb4d7f45d1cf-6179615fd59mr2205121a12.21.1754481915726;
        Wed, 06 Aug 2025 05:05:15 -0700 (PDT)
Message-ID: <6ddee574-6fe2-4de7-b000-a3af0b2c9d12@suse.com>
Date: Wed, 6 Aug 2025 14:05:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/20] xen/riscv: introduce VMID allocation and
 manegement
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <d61f5f831ac8045055a1775ee710d4f2fe8dcc26.1753973161.git.oleksii.kurochko@gmail.com>
 <cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com>
 <bcf4c3aa-5c09-4171-a4f5-85110d6e634f@gmail.com>
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
In-Reply-To: <bcf4c3aa-5c09-4171-a4f5-85110d6e634f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.08.2025 13:33, Oleksii Kurochko wrote:
> On 8/4/25 5:19 PM, Jan Beulich wrote:
>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>> @@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>>   
>>>       console_init_postirq();
>>>   
>>> +    vmid_init();
>> This lives here only temporarily, I assume? Every hart will need to execute
>> it, and hence (like we have it on x86) this may want to be a central place
>> elsewhere.
> 
> I haven’t checked how it is done on x86; I probably should.
> 
> I planned to call it for each hart separately during secondary hart bring-up,
> since accessing the|hgatp| register of a hart is required to detect|VMIDLEN|.
> Therefore,|vmid_init()| should be called for secondary harts when their
> initialization code starts executing.

But is this going to be the only per-hart thing that will need doing? Otherwise
the same larger "container" function may want calling instead.

>>> +static unsigned long vmidlen_detect(void)
>> __init ? Or wait, are you (deliberately) permitting different VMIDLEN
>> across harts?
> 
> All what I was able in RISC-V spec is that:
>    The number of VMID bits is UNSPECIFIED and may be zero. The number of
>    implemented VMID bits, termed VMIDLEN, may be determined by writing one
>    to every bit position in the VMID field, then reading back the value in
>    hgatp to see which bit positions in the VMID field hold a one. The least-
>    significant bits of VMID are implemented first: that is, if VMIDLEN > 0,
>    VMID[VMIDLEN-1:0] is writable. The maximal value of VMIDLEN, termed
>    VMIDMAX, is 7 for Sv32x4 or 14 for Sv39x4, Sv48x4, and Sv57x4..
> And I couldn't find explicitly that VMIDLEN will be the same across harts.
> 
> Therefore, IMO, while the specification doesn't guarantee VMID will be
> different, the "unspecified" nature and the per-hart discovery mechanism
> of VMIDLEN in the hgatp CSR allows for VMIDLEN to be different on
> different harts in an implementation without violating the
> RISC-V privileged specification.

Okay, since that's easily feasible with the present implementation, why not
keep it like that then.

>>> +{
>>> +    unsigned long vmid_bits;
>> Why "long" (also for the function return type)?
> 
> Because csr_read() returns unsigned long as HGATP register has
> 'unsigned long' length.

Oh, right, I should have commented on the function return type only.
Yet then I also can't resist stating that this kind of use of a variable,
which initially is assigned a value that doesn't really fit its name, is
easily misleading towards giving such comments.

> But it could be done in this way:
>      csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
>      vmid_bits =  MASK_EXTR(csr_read(CSR_HGATP), HGATP_VMID_MASK);
>      vmid_bits = ffs_g(vmid_bits);
>      csr_write(CSR_HGATP, old);
> And then use uint16_t for vmid_bits and use uin16_t as a return type.

Please check ./CODING_STYLE again as to the use of fixed-width types.

>>> +    unsigned long old;
>>> +
>>> +    /* Figure-out number of VMID bits in HW */
>>> +    old = csr_read(CSR_HGATP);
>>> +
>>> +    csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
>>> +    vmid_bits = csr_read(CSR_HGATP);
>>> +    vmid_bits =  MASK_EXTR(vmid_bits, HGATP_VMID_MASK);
>> Nit: Stray blank.
>>
>>> +    vmid_bits = flsl(vmid_bits);
>>> +    csr_write(CSR_HGATP, old);
>>> +
>>> +    /*
>>> +     * We polluted local TLB so flush all guest TLB as
>>> +     * a speculative access can happen at any time.
>>> +     */
>>> +    local_hfence_gvma_all();
>> There's no guest running. If you wrote hgat.MODE as zero, as per my
>> understanding now new TLB entries could even purely theoretically appear.
> 
> It could be an issue (or, at least, it is recommended) when hgatp.MODE is
> changed:
>   If hgatp.MODE is changed for a given VMID, an HFENCE.GVMA with rs1=x0
>   (and rs2 set to either x0 or the VMID) must be executed to order subsequent
>   guest translations with the MODE change—even if the old MODE or new MODE
>   is Bare.
> On other hand it is guaranteed that, at least, on Reset (and so I assume
> for power on) that:
>   If the hypervisor extension is implemented, the hgatp.MODE and vsatp.MODE
>   fields are reset to 0.
> 
> So it seems like if no guest is ran then there is no need even to write
> hgatp.MODE as zero, but it might be sense to do that explicitly just to
> be sure.
> 
> I thought it was possible to have a running guest and perform a CPU hotplug.

But that guest will run on another hart.

> In that case, I expect that during the hotplug,|vmidlen_detect()| will be
> called and return the|vmid_bits| value, which is used as the active VMID.
> At that moment, the local TLB could be speculatively polluted, I think.
> Likely, it makes sense to call vmidlen_detect() only once for each hart
> during initial bringup.

That may bring you more problems than it solves. You'd need to stash away
the value originally read somewhere. And that somewhere isn't per-CPU data.

>> In fact, with no guest running (yet) I'm having a hard time seeing why
>> you shouldn't be able to simply write the register with just
>> HGATP_VMID_MASK, i.e. without OR-ing in "old". It's even questionable
>> whether "old" needs restoring; writing plain zero afterwards ought to
>> suffice. You're in charcge of the register, after all.
> 
> It make sense (but I don't know if it is a possible case) to be sure that
> HGATP.MODE remains the same, so there is no need to have TLB flush. If
> HGATP.MODE is changed then it will be needed to do TLB flush as I mentioned
> above.
> 
> If we agreed to keep local_hfence_gvma_all() then I think it isn't really
> any sense to restore 'old' or OR-ing it with HGATP_VMID_MASK.
> 
> Generally if 'old' is guaranteed to be zero (and, probably, it makes sense
> to check that in vmidlen_detect() and panic if it isn't zero) and if
> vmidlen_detect() function will be called before any guest domain(s) will
> be ran then I could agree that we don't need local_hfence_gvma_all() here.
> 
> As an option we can do local_hfence_gvma_all() only if 'old' value wasn't
> set to zero.
> 
> Does it make sense?

Well - I'd like the pre-conditions to be understood better. For example, can
a hart really speculate into guest mode, when the hart is only in the
process of being brought up?

>>> +    data->max_vmid = BIT(vmid_len, U) - 1;
>>> +    data->disabled = !opt_vmid_enabled || (vmid_len <= 1);
>> Actually, what exactly does it mean that "VMIDs are disabled"? There's
>> no enable bit that I could find anywhere. Isn't it rather that in this
>> case you need to arrange to flush always on VM entry (or always after a
>> P2M change, depending how the TLB is split between guest and host use)?
> 
> "VMIDs are disabled" here means that TLB flush will happen each time p2m
> is changed.

That's better described as "VMIDs aren't used" then?

>>> +    if ( g_disabled != data->disabled )
>>> +    {
>>> +        printk("%s: VMIDs %sabled.\n", __func__,
>>> +               data->disabled ? "dis" : "en");
>>> +        if ( !g_disabled )
>>> +            g_disabled = data->disabled;
>> This doesn't match x86 code. g_disabled is a tristate there, which only
>> the boot CPU would ever write to.
> 
> Why g_disabled is written only by boot CPU? Does x86 have only two options
> or VMIDs are enabled for all CPUs or it is disabled for all of them?

Did you look at the x86 code again, or the patch that I sent for it?

> For RISC-V as I mentioned above it is needed to check all harts as the spec.
> doesn't explicitly mention that VMIDLEN is equal for all harts...

Even if in practice x86 systems are symmetric in this regard, you will
have seen that we support varying values there as well. Up to and
including ASIDs being in use on some CPUs, but not on others. So that
code can serve as a reference for you, I think.

>> A clear shortcoming of the x86 code (that you copied) is that the log
>> message doesn't identify the CPU in question. A sequence of "disabled"
>> and "enabled" could thus result, without the last one (or in fact any
>> one) making clear what the overall state is. I think you want to avoid
>> this from the beginning.
> 
> ... Thereby it seems like declaration of g_disabled should be moved outside
> vmid_init() function and add a new function which will return g_disabled
> value (or just make g_disabled not static and rename to something like
> g_vmids_disabled).

No, why? While I didn't Cc you on my patch submission, I specifically
replied to it with you (alone) on the To: list, just so you can look
there first before suggesting (sorry) odd things.

Jan

