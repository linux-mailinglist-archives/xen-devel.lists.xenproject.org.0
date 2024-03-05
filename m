Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D6F871902
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 10:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688645.1073077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhQki-0005NL-9I; Tue, 05 Mar 2024 09:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688645.1073077; Tue, 05 Mar 2024 09:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhQki-0005Lo-6R; Tue, 05 Mar 2024 09:06:24 +0000
Received: by outflank-mailman (input) for mailman id 688645;
 Tue, 05 Mar 2024 09:06:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhQkg-0005Lg-Kp
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 09:06:22 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a114a4ce-dacf-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 10:06:19 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-564fd9eea75so531120a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 01:06:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o7-20020a1709062e8700b00a4558314ea0sm1934513eji.15.2024.03.05.01.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 01:06:18 -0800 (PST)
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
X-Inumbo-ID: a114a4ce-dacf-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709629578; x=1710234378; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b6myWXNcLURR9kBWEqO1eQi9eE7cOZznv0bO4f4eOv4=;
        b=KNOkQVAYEZQFrxEJTZ/rrwhGLcj3EL6Mhl8won8qRhocC1Lu65A7PRQO6pAdfsV08F
         f5lc6ddJTtBGfNHn/XvKdsYkl483ivBXlFmi0A5wD7YFkcNm78l1S2ylhdsh+Gq89MKa
         7tb6n9v1qOcgG3tMMO+/nwcSAJ8IR0Ay/fxPvJNyAfqns0yj2Zx1faSIbH6UIh6R49IZ
         rV07JDy4dgLEEiZGyL9lzADINrJUbzxsAvkpVo+kgmmi1JUhvxNXxXzev6xDCSgu4+sT
         i99VvjHWemRBAuHVPnmasLgtDKXjVYxg68Ex0liUOXfhY/PUAOIBJJpvrcRnRU8a5fNl
         fQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709629579; x=1710234379;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6myWXNcLURR9kBWEqO1eQi9eE7cOZznv0bO4f4eOv4=;
        b=GeT5jlW6ytZqpVk9ccaVwxc4l9DzoN2IBbDzitXwGnlOjsborrL8y9y1fi5DVBW1+F
         fMYcI2K0jJI08KKUexcvo6KV+EZ2/S8xq6UH7F/+ZcfcrGFP3u9ihj3XdfepK2rP3Nfm
         U6x1k/N7R10rjb6Pp4hEGrymwR+AKk0jZkFiHuUqNyldYgd2B1CtC+f++c8U7sX5nQF3
         EfL5O00DCjaxiXcspux7k/Rw3Fap7+DE3BLTiiOgklpK9ghwbQTBNIyq7rdABdEaGlP1
         0ACm/VQrKp5sloshrQa6/CNRVxFyzVkp3if86ApUTQP7XtP8MoinALpf8hsI31qy9BOZ
         0Skw==
X-Forwarded-Encrypted: i=1; AJvYcCXPJjKXz91R/q+1BbQ3FNycOgZpmboAJoR+ylq53SDuXgNI4MzhDdXSRWb829EQ0Hl+1RmZMZBY5poRumASe7+Zg5b1oKF7/U4z1cNIm2A=
X-Gm-Message-State: AOJu0YxT2cYtG94DwK4AYtrZiJOQGbB1NE80oZIX48jb5aNcLMd4HRTO
	OS7BUfNg8yFANIIJiHgSZF592VVvrSTW6eVukt0aO0VjaI40nLKG1A0Spfeoog==
X-Google-Smtp-Source: AGHT+IG+rJAItN1CrtcfXKfRD6gl22xYC2wANjGL9X48Ej1ez9dPed87kz9uNrm5dGZdQN3eiwMdfQ==
X-Received: by 2002:a17:906:c7d0:b0:a44:8caf:a2e0 with SMTP id dc16-20020a170906c7d000b00a448cafa2e0mr9038850ejb.74.1709629578618;
        Tue, 05 Mar 2024 01:06:18 -0800 (PST)
Message-ID: <d2e6e522-216b-4bcf-a75d-2bbc8e1563ce@suse.com>
Date: Tue, 5 Mar 2024 10:06:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86: introduce xstate_zero
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240304091307.2295344-1-fouad.hilly@cloud.com>
 <20240304091307.2295344-3-fouad.hilly@cloud.com>
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
In-Reply-To: <20240304091307.2295344-3-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.03.2024 10:13, Fouad Hilly wrote:
> +void xstate_zero(uint64_t mask)
> +{
> +    bool ok;
> +    struct xsave_struct tmp;
> +
> +    tmp.fpu_sse.mxcsr = MXCSR_DEFAULT;

This is a clear indication that the function name is wrong. Perhaps it is
"reset" that was meant?

> +    tmp.xsave_hdr.xstate_bv = 0;
> +    tmp.xsave_hdr.xcomp_bv = 0;
> +    memset(tmp.xsave_hdr.reserved, 0, sizeof(tmp.xsave_hdr.reserved));
> +
> +    ok = xrstor__(&tmp, mask, mask);

There's a lot of "tmp" that is left uninitialized, which would introduce
a leak of (stack) data. I think "tmp" instead wants to have an initializer
(consisting of just the explicit setting of MXCSR, leaving everything else
to be default, i.e. zero-initialized).

> +    ASSERT(ok);
>  }
>  
>  bool xsave_enabled(const struct vcpu *v)
> @@ -731,6 +753,9 @@ int handle_xsetbv(u32 index, u64 new_bv)
>      if ( (new_bv & ~xcr0_max) || !valid_xcr0(new_bv) )
>          return -EINVAL;
>  
> +    /* Zero state components before writing new XCR0 */
> +    xstate_zero(get_xcr0());

This change isn't explained in the description, doesn't fit the subject
(i.e. mechanical and functional change likely want splitting), and is
imo wrong: Why would XSETBV gain this kind of side effect, when processed
(emulated) in Xen? What I can see may want clearing are state components
which were never enabled before by a vCPU. That would then need doing
after writing the new XCR0 value, though. And it looks like that's
already in place - is there something wrong with that code?

Or is this about clearing in hardware state components about to be turned
off? If so, it would again need to be only the delta of components that's
reset here, and their state would need saving first. Upon re-enabling of
a component, that state would then need to be available for restoring.
This need for saving of state would then also explain why what's presently
named xstate_zero() can't very well use the vCPU's ->arch.xsave_area, but
needs to have a (relatively big) on-stack variable instead.

Jan

