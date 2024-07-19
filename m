Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C7C9375A9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 11:24:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760948.1170916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUjqa-0003SU-PF; Fri, 19 Jul 2024 09:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760948.1170916; Fri, 19 Jul 2024 09:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUjqa-0003Qb-MP; Fri, 19 Jul 2024 09:24:16 +0000
Received: by outflank-mailman (input) for mailman id 760948;
 Fri, 19 Jul 2024 09:24:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUjqZ-0003QV-U4
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 09:24:15 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a95c3bf9-45b0-11ef-8776-851b0ebba9a2;
 Fri, 19 Jul 2024 11:24:13 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2eefeab807dso22944971fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2024 02:24:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f290eedsm432465ad.93.2024.07.19.02.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 02:24:11 -0700 (PDT)
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
X-Inumbo-ID: a95c3bf9-45b0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721381052; x=1721985852; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FQfjmugfI8Len1jWT99nCNmm4UQ0R02Y32QP/u8hiN4=;
        b=DEVT2Z5zUnkb4k+uU4930+4SeIWYp3kRozk+JGS71sQnxNJWFmz5yGdjeXY8k+0Id4
         AYopufCpfBHFAM8duJhNtCvRiIvym60De66mNTLxGGgODb+T7ICHAzJ63NdDhXrNFd9x
         zB0in3PLFKneS3eisd7eOloPALLNSLFoLCH/0LCHkpDbBjKJgPZQWqI+Y33gok1elUGE
         i7mfxj/ycKKtB3RfiIs4nVSrKiR6UJHty65gpx2EBwCDAdjVYhrjZ3M0bbz+mckFu8HR
         bEuTOZYmF9AYuHpdcIw9zFpMAJ5Ic/g32qZ2Cenv6RZzz4Qi/qQqQSdx2fjLpBOaGM+J
         PzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721381052; x=1721985852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQfjmugfI8Len1jWT99nCNmm4UQ0R02Y32QP/u8hiN4=;
        b=cFlNOa8Bqsz+50d6+WrkuKUBBl+u9ZpJuXjnibdvB7EgqJQXppMlTpe7AfqZwMZLOs
         Q5YpQo5Ui2K5DiDULwm6KY59YOFSA5NX5YxgKWzXAQD09asM822yatZEqWGqDaPNKhmT
         eCPlfLrVds7e9hoMxU9xL8zPobSgt0SQ74Df4Bh1yXHKZ9FP62Lu1kTjNMq0XVsOFGn8
         8OgUopWcLbZNhNBss2uXrTbDx3fFnKKwCm1Vt0ydj/iDyTPwhcgTspg9i4CQ9Oha8403
         gBeMhL5pcxzOoPQ+ELWRQXEw6STiRP1MdVo1GOKKubYkd1h1fMnSOihI+yF7zHXgCpE2
         CM/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU782yTJo2Ucz/jvkHHdfmb0veOgY2qPIpmV4kdJeB4ApxWBTb3O8bdKpSo3hsdm5Xe5L4hK9hYXFXYo0vxFUUmYLEoMnTCZE+bT23yX8Q=
X-Gm-Message-State: AOJu0Ywre76gRmR6S3G9BUvmuf66cr8W57aAUGExTWpXTGiNr3bRumQn
	N+TFYRA4pF1VTZz9M7BwyszdzG09tzcI2uc54k5lYDIJFmwZE1LxMTbJH+YiaA==
X-Google-Smtp-Source: AGHT+IEftYCarYzKyy8bIaH4vG7QrL57a8wqm5jUbQFiKzBpSyLc8ryVCkuL5W7tbHCcbSIsCZfCdQ==
X-Received: by 2002:a05:651c:b0a:b0:2ec:1708:4db2 with SMTP id 38308e7fff4ca-2ef05d604cdmr39479631fa.47.1721381052442;
        Fri, 19 Jul 2024 02:24:12 -0700 (PDT)
Message-ID: <2b0665cf-8205-4cf4-ad88-17aaa667045a@suse.com>
Date: Fri, 19 Jul 2024 11:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 4/4] x86/fpu: Split fpu_setup_fpu() in two
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1720538832.git.alejandro.vallejo@cloud.com>
 <da30dedcfa68d7c30375b96c85424e13ec6d458b.1720538832.git.alejandro.vallejo@cloud.com>
 <c311ef0f-7d86-4a2b-b056-9bfa0665113e@suse.com>
 <D2SU9MKGLSB7.1J9TBL8HPU4AP@cloud.com>
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
In-Reply-To: <D2SU9MKGLSB7.1J9TBL8HPU4AP@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2024 19:25, Alejandro Vallejo wrote:
> On Thu Jul 18, 2024 at 1:19 PM BST, Jan Beulich wrote:
>> On 09.07.2024 17:52, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/i387.c
>>> +++ b/xen/arch/x86/i387.c
>>> @@ -310,41 +310,25 @@ int vcpu_init_fpu(struct vcpu *v)
>>>      return xstate_alloc_save_area(v);
>>>  }
>>>  
>>> -void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
>>> -                    const void *data, unsigned int fcw_default)
>>> +void vcpu_reset_fpu(struct vcpu *v, uint16_t fcw)
>>>  {
>>> -    fpusse_t *fpu_sse = &v->arch.xsave_area->fpu_sse;
>>> -
>>> -    ASSERT(!xsave_area || xsave_area == v->arch.xsave_area);
>>> -
>>> -    v->fpu_initialised = !!data;
>>> -
>>> -    if ( data )
>>> -    {
>>> -        memcpy(fpu_sse, data, sizeof(*fpu_sse));
>>> -        if ( xsave_area )
>>> -            xsave_area->xsave_hdr.xstate_bv = XSTATE_FP_SSE;
>>> -    }
>>> -    else if ( xsave_area && fcw_default == FCW_DEFAULT )
>>> -    {
>>> -        xsave_area->xsave_hdr.xstate_bv = 0;
>>> -        fpu_sse->mxcsr = MXCSR_DEFAULT;
>>> -    }
>>> -    else
>>> -    {
>>> -        memset(fpu_sse, 0, sizeof(*fpu_sse));
>>> -        fpu_sse->fcw = fcw_default;
>>> -        fpu_sse->mxcsr = MXCSR_DEFAULT;
>>> -        if ( v->arch.xsave_area )
>>> -        {
>>> -            v->arch.xsave_area->xsave_hdr.xstate_bv &= ~XSTATE_FP_SSE;
>>> -            if ( fcw_default != FCW_DEFAULT )
>>> -                v->arch.xsave_area->xsave_hdr.xstate_bv |= X86_XCR0_X87;
>>> -        }
>>> -    }
>>> +    v->fpu_initialised = false;
>>> +    *v->arch.xsave_area = (struct xsave_struct) {
>>> +        .fpu_sse = {
>>> +            .mxcsr = MXCSR_DEFAULT,
>>> +            .fcw = fcw,
>>> +        },
>>> +        .xsave_hdr.xstate_bv = fcw == FCW_RESET ? X86_XCR0_X87 : 0,
>>> +    };
>>> +}
>>
>> Old code checked against FCW_DEFAULT uniformly. You switching to checking
>> against FCW_RESET is no functional change only because all callers pass
>> either of the two values. I wonder whether the new function's parameter
>> wouldn't want to be a boolean (reset vs init).
> 
> I agree, and It's effectively what it is. The problem with the boolean is that
> it's utterly unreadable at the call sites.
> 
>     vcpu_reset_fpu(v, true); /* Is this reset or set-to-default? */

    vcpu_reset_fpu(v, true /* reset */);

and

    vcpu_reset_fpu(v, false /* init */);

would be an option. But I get your point.

>     vcpu_reset_fpu(v, FCW_RESET); /* Clear to be a reset */
> 
> I could also split it in 2, so we end up with these:
> 
>   * vcpu_setup_fpu(v, data): Copies x87/SSE state
>   * vcpu_reset_fpu(v): Reset to power-on state
>   * vcpu_set_default_fpu(v): Reset to default state
> 
> Thinking about it, I kind of prefer this second approach. Thoughts?

I'd be okay with that seeing how small the two functions would end up
being, albeit I don't like the "set_default" part of the name very much.
If I could talk you into using "init" instead ...

Jan

