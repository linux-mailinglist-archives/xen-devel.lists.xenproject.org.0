Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9F3B29E76
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 11:54:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085831.1444106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unwYm-00078u-N2; Mon, 18 Aug 2025 09:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085831.1444106; Mon, 18 Aug 2025 09:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unwYm-00077R-KE; Mon, 18 Aug 2025 09:53:48 +0000
Received: by outflank-mailman (input) for mailman id 1085831;
 Mon, 18 Aug 2025 09:53:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unwYl-00077L-6L
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 09:53:47 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b5285e2-7c19-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 11:53:46 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad681so5524531a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 02:53:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618b01b5fa1sm6673819a12.46.2025.08.18.02.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 02:53:45 -0700 (PDT)
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
X-Inumbo-ID: 3b5285e2-7c19-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755510825; x=1756115625; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vQZa7geI1qq4OuK6YHyfTAofVg2d2sJB1o+R7NMB0LY=;
        b=BNFwsLxJ2KSjSZxvPO/q0lyQ8mjHd7pz27ENCjQsJCrFJaDqM/GS88rAmEuji7RJGx
         ohPBEKNhaWjWTV7NdDzXsjtjcLVC5kluX0GhMakF1//FLIhC5fi0hRjJISlxJZOxja8Y
         H7MS7o/kvfMUFDz4U/vZAV6+M+vCIIeMYm5XnD10S1lHy4gm+RcmQMNA3pSneYw7sMQq
         /wtEhW4d3MKBknioASUScJ+vMdnQtbZiyEfe/DjylftCMpqRwU7B0vwVpPkx7ikS3SVl
         8u+9c60JZTpEFb3790+cxpT8nS2G8rUbqUzHcsrjl8LzjgC04B6LG0pb1xY5gM1tmsDh
         X8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755510825; x=1756115625;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQZa7geI1qq4OuK6YHyfTAofVg2d2sJB1o+R7NMB0LY=;
        b=d2hM7IrsxGAVW8EFrTiva/FXuvLOsqKZOUbltvf/YDsmLiILb85AG1pbJFkhfkrLYK
         Pjo5ZfdZd5B76Mpu3XGx23j0Y5dWTy+/Vg+U+9KdlJZPHQvsAcRMOS4SOTH/aAx77ThH
         lszCVBadjXUvqhMKQuvAqTb/Fij0jKqLOjwFZIBTtCPbAhurl200ePXP0MbtzbrR5DZp
         t3qZjCju+NNhvePWGuKP+2tzZww/YgBLXef1RILn8zUiXMRO37XIJQ5cM4SNH7aYKt4x
         pBJhaVI4KmuNMBO4bt7bXHqtJN/3K/Qy1o/+V5Ew50H1KaMszqx5pebHRvQ0auGLK6pY
         0lvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiMEwSF/DzlD/7vOe75Vl0FVxEB7k7SwNG5b1+KsHTWg+VwVPqnXTyEtRH0kG5hg0aY/+5T7tE4Nw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3iqBkld+yYbTz9Up993L06lLhZ+bXEbfo7miEUPIKJXC/7n3r
	+gSHoFbVeG1hwScSPYk7JYM7nVIzKYtNCqpzNBYFDMvfSEmnxtmR+y52Tv8ep1Lp/w==
X-Gm-Gg: ASbGncul7zY0SYkGCL4fBxSoMMx6fx2BHTM9a710ZjOik0+aDZFg5/RXagrsf3zBs+l
	ryHj9KTvzHyvRx30SqCncORRKY8oAwaX7C7h7311PvZNfLE56/KY5REqibd5skot3tV5B34sDyC
	mmogk4UA1q2jbYMFGXM7Ww3d6udSaGMIpzSGquGx8jlioXsU/0v2sbger8xQYBcLfpDlNPG0AW3
	btggZIpY8AjoFJLRgxzNHIDOqAXTx01xzOuZqN2IexBQyDQrs151vsVXA6uU9MrHgRU3gl5x/Sg
	gZQRX+AvoaIm/tzCa8/q5UHRO6+tu8SOEc6VQkR72S8XsPfd33roFtzk1FDvRzKjeOwNPzcQ5NM
	wC6uaOoEex+5xJp+CrVZsxILTrKtKov5hrLy8DQmOrux7I5v7LOuBh78kOrneYwrCnj7cYrH3bJ
	FWeU6Y+/nj6JiZMilgmg==
X-Google-Smtp-Source: AGHT+IF0iM7iUtg0HndeA1tTiOpRGnM2AQSkvbNJ/6EUubgubAzYd8iJEXLCRvjM+eFZUBJq2dX4Fg==
X-Received: by 2002:a17:907:a44:b0:af9:d6c1:155a with SMTP id a640c23a62f3a-afceae135ffmr737344266b.44.1755510825482;
        Mon, 18 Aug 2025 02:53:45 -0700 (PDT)
Message-ID: <c1a719af-1e56-479f-8a1d-ac6628f855b4@suse.com>
Date: Mon, 18 Aug 2025 11:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/22] x86/traps: Enable FRED when requested
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-23-andrew.cooper3@citrix.com>
 <1d6494f6-fbef-436f-a379-a98e02b20710@suse.com>
 <17fd42cf-ce42-4757-afce-0b7c4d13de25@citrix.com>
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
In-Reply-To: <17fd42cf-ce42-4757-afce-0b7c4d13de25@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.08.2025 11:47, Andrew Cooper wrote:
> On 18/08/2025 10:35 am, Jan Beulich wrote:
>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>> With the shadow stack and exception handling adjustements in place, we can now
>>> activate FRED when appropriate.  Note that opt_fred is still disabled by
>>> default.
>>>
>>> Introduce init_fred() to set up all the MSRs relevant for FRED.  FRED uses
>>> MSR_STAR (entries from Ring3 only), and MSR_FRED_SSP_SL0 aliases MSR_PL0_SSP
>>> when CET-SS is active.  Otherwise, they're all new MSRs.
>>>
>>> With init_fred() existing, load_system_tables() and legacy_syscall_init()
>>> should only be used when setting up IDT delivery.  Insert ASSERT()s to this
>>> effect, and adjust the various *_init() functions to make this property true.
>>>
>>> Per the documentation, ap_early_traps_init() is responsible for switching off
>>> the boot GDT, which needs doing even in FRED mode.
>>>
>>> Finally, set CR4.FRED in {bsp,ap}_early_traps_init().
>> Probably you've done that already, but these last two paragraphs will need
>> updating following patch 08 v1.1.
> 
> It's on my list, but not done yet.
> 
>>
>>> Xen can now boot in FRED mode up until starting a PV guest, where it faults
>>> because IRET is not permitted to change privilege.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks, but I fear this patch has changed too much.  I'll take a
> decision when I've cleaned up the integration of the PV work.
> 
>>
>>> @@ -274,6 +279,44 @@ static void __init init_ler(void)
>>>      setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
>>>  }
>>>  
>>> +/*
>>> + * Set up all MSRs relevant for FRED event delivery.
>>> + *
>>> + * Xen does not use any of the optional config in MSR_FRED_CONFIG, so all that
>>> + * is needed is the entrypoint.
>>> + *
>>> + * Because FRED always provides a good stack, NMI and #DB do not need any
>>> + * special treatment.  Only #DF needs another stack level, and #MC for the
>>> + * offchance that Xen's main stack suffers an uncorrectable error.
>>> + *
>>> + * FRED reuses MSR_STAR to provide the segment selector values to load on
>>> + * entry from Ring3.  Entry from Ring0 leave %cs and %ss unmodified.
>>> + */
>>> +static void init_fred(void)
>>> +{
>>> +    unsigned long stack_top = get_stack_bottom() & ~(STACK_SIZE - 1);
>>> +
>>> +    ASSERT(opt_fred == 1);
>>> +
>>> +    wrmsrns(MSR_STAR, XEN_MSR_STAR);
>>> +    wrmsrns(MSR_FRED_CONFIG, (unsigned long)entry_FRED_R3);
>>> +
>>> +    wrmsrns(MSR_FRED_RSP_SL0, (unsigned long)(&get_cpu_info()->_fred + 1));
>>> +    wrmsrns(MSR_FRED_RSP_SL1, 0);
>> In the event of a bug somewhere causing this slot to be accessed, is the
>> wrapping behavior well-defined, resulting in an attempt to write to the
>> top end of VA space? (Then again, if the wrapping itself caused a fault,
>> the overall effect would be largely the same - in many cases #DF.)
> 
> The wrapping is well defined - like other cases, it goes to the top of
> address space, but that's owned by PV guests.  SMAP ought to mitigate
> what would otherwise be a priv-esc.
> 
> With IDT, we poisoned the unused pointers with non-canonical addresses,
> but that's not possible here, as they're MSRs and checked at this point,
> rather than when they're used.
> 
> I suspect the best we can do is reuse the #DB or NMI stacks, and
> intentionally reverse the regular and shadow stack pointers, meaning
> that any attempt to use SL1 will hit a guard page and escalate to #DF.

I was wondering whether to store the upper end of zero_page[]. Or else
point into entirely unmapped space.

Jan

