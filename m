Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 393A1A39AB0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 12:25:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891298.1300361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLiy-0003KC-V3; Tue, 18 Feb 2025 11:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891298.1300361; Tue, 18 Feb 2025 11:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLiy-0003Hc-Rg; Tue, 18 Feb 2025 11:25:12 +0000
Received: by outflank-mailman (input) for mailman id 891298;
 Tue, 18 Feb 2025 11:25:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkLix-0003HW-8L
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 11:25:11 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0320bbfe-edeb-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 12:25:09 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-abbae92be71so142688066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 03:25:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1d354bsm8671273a12.45.2025.02.18.03.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 03:25:09 -0800 (PST)
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
X-Inumbo-ID: 0320bbfe-edeb-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739877909; x=1740482709; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8tudUaU8dYAATPJvT/x5yvyh34+Toyj54VNuehLi+HA=;
        b=JC8n3qIsFEVRnjYi1o0KGfL2GjW4hk/S/k+Yb3q4V56VYNdiqDDtkKZnQzorDs8rjn
         Iyfviwf5JVLcyUDNTPo/NGkvXV4IerbEebD+LbubfSdv/iDdXjzfwG4vgjnoj1AoYKSW
         tszuhJ0MxomaD5jBFxIC7AJfLg3jRuSSeT+e8LIG0apctnsLIigp10DekqK+lpD8qxs8
         OnjjoCYn9UPDa1H9q1x471OlqtYtMN0VXqBAk4T2ZqCd9r3IbCXMpLBLuyRjTwdXGoBT
         UEiyyqYWQwS7jd6udR1I+LvI5MhndNXqSDFMm0ZWwOtfGs5TDDQioIsSZE9jooOCKtFA
         0ctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739877909; x=1740482709;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tudUaU8dYAATPJvT/x5yvyh34+Toyj54VNuehLi+HA=;
        b=n6lZLlvyAUQY2XHAQx8GqnPTQwWIvcrY85zbLn0EiJ+s+a1lc8LL+rFLW6vA4haQ/Y
         vEwYIAP/x2JdDnccbgchSdzCmjNqzED23W3/hiX9Kl1IT1WoJmuYpz/CNp0SGk1iggJ8
         VcfnzHbtD9FlyH0IysdaeTp7Az1VrohJ5aeWFulJrnDdzY7bEEfyYLVdXAWHvI54o+Gz
         VrPdJmHXTYAVQKiX3cfrmzEHIOTeMSc+rW9L62+E/qosKL/g0+0ai7+f3sNKYTdir1c4
         q63PlWX5K27+ya0LQENz/3GMhY8BtGJJ9jnvaUN83yGoPlwwl6FV28QtHhpWk5ZLxXTk
         kOcA==
X-Forwarded-Encrypted: i=1; AJvYcCWZr9u2Mb7Q8Ub6lOB3dCmZ9WPcCrGE9fy14nMCRwBR1HXQGrcw9Ohb1RoCljyTPI7P/bIONbDZ3Bw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfXqjwTHDfsQAjbKCM7v5DcMulvx4HGpIbhjGmNnRMzeew/zVX
	dfPZKKU6RojYScSgU0N3QBa79MZgaLi/e6ZjPyx8xGKx75pMZegKe0dJNd9XrC5qfEpAQwRNncM
	=
X-Gm-Gg: ASbGnctj9Z8dhqI0iyC6p4mHjavIBpuWCG+BCEOF3GD8BaZruFnfCuybevnEn9bCYRF
	FGYkpRYMM9FrtS5r0W5FpG538xyEQHJMu4AR/GKdYHefIaybZ4XafAVWVoJ21HUVLb6Rodbkt7x
	hKzn2/bVXpRUUIbpz0yRex3In8lko6sQioiwu6Xwe+kh1P8EBkBVf1tfsWAsmS4Y7ton8NnSs4r
	JvanoEJyLteibolDdpzBPKncEcRBwmG6qaGICGGewWoPLwWhGFjWgHkfzIprg1s5zYGIrhnMaRR
	U8HOaUbDF2eZPKJCng2CPugiF+jDDZ/u4eDdepI70AoZ1HQq5fpiq0GUWtQtWSrM7/3zr0dwrza
	T
X-Google-Smtp-Source: AGHT+IG/W8tTjO+cBLvtCQ3JJEWeS2NisdgsYbx1d1HQ0GM2mieTlIMvKsr2GfvM9L362QeKOZtRZA==
X-Received: by 2002:a05:6402:5253:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5e036139caamr28465235a12.23.1739877909506;
        Tue, 18 Feb 2025 03:25:09 -0800 (PST)
Message-ID: <960870ad-3c72-4075-a97d-6504e0cad548@suse.com>
Date: Tue, 18 Feb 2025 12:25:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Separate STI and VMRUN instructions in
 svm_asm_do_resume()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250217161241.537168-1-andrew.cooper3@citrix.com>
 <7763e57c-a2d2-4642-b613-8628ae4c55da@suse.com>
 <8edb290a-ed47-42c5-b809-5ec73fb2bd3e@citrix.com>
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
In-Reply-To: <8edb290a-ed47-42c5-b809-5ec73fb2bd3e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.02.2025 18:40, Andrew Cooper wrote:
> On 17/02/2025 4:51 pm, Jan Beulich wrote:
>> On 17.02.2025 17:12, Andrew Cooper wrote:
>>> There is a corner case in the VMRUN instruction where its INTR_SHADOW state
>>> leaks into guest state if a VMExit occurs before the VMRUN is complete.  An
>>> example of this could be taking #NPF due to event injection.
>> Ouch.
> 
> Yeah.  Intel go out of their way to make VM{LAUNCH,RESUME} fail if
> they're executed in a shadow.
> 
>>
>>> --- a/xen/arch/x86/hvm/svm/entry.S
>>> +++ b/xen/arch/x86/hvm/svm/entry.S
>>> @@ -57,6 +57,14 @@ __UNLIKELY_END(nsvm_hap)
>>>  
>>>          clgi
>>>  
>>> +        /*
>>> +         * Set EFLAGS.IF, after CLGI covers us from real interrupts, but not
>>> +         * immediately prior to VMRUN.  AMD CPUs leak Xen's INTR_SHADOW from
>>> +         * the STI into guest state if a VMExit occurs during VMEntry
>>> +         * (e.g. taking #NPF during event injecting.)
>>> +         */
>>> +        sti
>>> +
>>>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
>>>          /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
>>>          .macro svm_vmentry_spec_ctrl
>> I'm mildly worried to see it moved this high up. Any exception taken in
>> this exit code would consider the system to have interrupts enabled, when
>> we have more restrictive handling for the IF=0 case. Could we meet in the
>> middle and have STI before we start popping registers off the stack, but
>> after all the speculation machinery?
> 
> Any exception taken here is fatal, and going to fail in weird ways. 
> e.g. we don't clean up GIF before entering the crash kernel.
> 
> But yes, we probably should take steps to avoid the interrupted context
> from looking even more weird than usual.
> 
> I'll put it above the line of pops.  They're going to turn into a single
> macro when I can dust off that series.

Then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

