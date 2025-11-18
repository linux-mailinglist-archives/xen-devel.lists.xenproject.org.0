Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B08C680FE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 08:50:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164473.1491428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLGT5-0000Nv-Ns; Tue, 18 Nov 2025 07:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164473.1491428; Tue, 18 Nov 2025 07:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLGT5-0000LH-Kj; Tue, 18 Nov 2025 07:49:39 +0000
Received: by outflank-mailman (input) for mailman id 1164473;
 Tue, 18 Nov 2025 07:49:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLGT4-0000LB-CX
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 07:49:38 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20bfded4-c453-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 08:49:36 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42bb288c219so2166914f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 23:49:36 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a80:314a:d80f:dc29:6f97?
 (p200300cab70c6a80314ad80fdc296f97.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a80:314a:d80f:dc29:6f97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7ae2dsm30934514f8f.5.2025.11.17.23.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 23:49:35 -0800 (PST)
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
X-Inumbo-ID: 20bfded4-c453-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763452175; x=1764056975; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KvHZgK67t9j8wAD0C2OSsJWTDJqxvteDTZ/ZUCakB9Y=;
        b=G8iR6SgSD/8bgbfrYP/kPYVdkvjEcB/z5QgaBZsi5+y6EHskJPxgyD5WNYjLtWqH/M
         ElVlW+6Pi+zLFgB06ZU4MRdwBD0LpzXh4IQAC3hsT3au41qPMaoMEuaKq7VsqsaA40Q8
         5ZFPj3imuytIitcCOI8ddk5nIvzP7ouAYxIdFmjtfglyAfJIOzGT8S3ctywEDIuAjLsA
         NtAeoAHJaQCmrHTPEIPoYOAox2KAX0gilYxCIx9sjg/rI0nJk72D+8r3pAjMtXA19LC9
         p52Vha9B9046HoPf2O9TnxqO0OlL5kiABKy59aG90t608HDffMKtTQ8ja7LucJ4qCGxe
         L9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763452175; x=1764056975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvHZgK67t9j8wAD0C2OSsJWTDJqxvteDTZ/ZUCakB9Y=;
        b=oW9jzJUnrX6OApNTI8/sbePODqqc1HFsyvm6sj9UiRe74SN5jja2omO1A5iGBs7wdI
         uSnjIqHYP/X0VBLB1c/QXkm0r91w1VNt9GtPSG5JVMQWvU8BNFwVSY3zfUbQbWp5NZhf
         vPdjCzw97WNGa89hrkbmWPXQebABCtlaUcsWGB8cgfvSD15vIibzZIu9OGoFvpnwWT5r
         Rul5SOBL2IrmN3l4mghXWdjjOkXDeOhrj3b/wmYR4IerbXjpZ1LQDvRbEd8NDOjKwy9v
         lXt7toGh3WtZHOAkaEub94YoIOAguKfGlxjfhnSUm1QP3MIRq2yze9Qk4FDAJKQqn2Eu
         ypIg==
X-Forwarded-Encrypted: i=1; AJvYcCXUBVgejnRRSlJKH7915AI8Se0ZguXOWAn6WThIQQFZ6eKPXmMYiOIIDlok5nCv00O3qmajW7KFxe4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTW10aRp0rEVUb26bKh570i46O6D2mmSygK1mm+aUa40eUEorB
	X4w/ewZ5elaCZfs+df9cxSaeklRSH2l1n1jAxisa/88pKcGqOn18RssQTAyfPM13EQ==
X-Gm-Gg: ASbGncvWS4kjztxv+U/7YFbwkw/jeu/BSOGqxrAImxsE+Zz6fu2aeGX4WGPr1MDtk0B
	vZwLEoYssxH3sZmN3lOgEGXNvW6po5LFjj9FKQMy2ycdHd3REZ6qq73e848lZaCYQVHbI1FQbzX
	d05/1B1rz8KaWxdtf4yzrciRq+2TLX12vQMWaZ8JeNhzq3sZRJocCNlLL+siwNVQP0UVU5T2TNK
	zogI3IexFPCD1bgTSSZumX3Q9p4S/4vPF1msHEIPEvffhUT/09TQ7Of5gDcf09VrC2xemBM+pOU
	1NdyKn4eAklSjzcrsbiV6XeCBi2K4ZRrP61YBLMwzG0LRkFvxcxMDun3VoTYSgFhCseHRK7Xy06
	nzYadJa/ZSReIQFYs+RylhNO3H+Fs4WFaB9CF8x+e96L9YaABJOMiLBPUv4pmTYmeTYALUv3CW6
	gvgh54SaN0lidZHaF1jQfKc2cOMimYQm3m4FnVlVjdDqhyRjjIj8EHX/N/acQxpjMrGfmXaU2ZY
	XZG/uGXoqYVvc10OI5R+punpviYTy5L19o/v66wRREGiuskOHiWpQUY5B4=
X-Google-Smtp-Source: AGHT+IG3cPl9rCeC+K77bqv0F6TXm3o3yd3U4g1lHyRxzALXzWi1600KEG4uLrU0JQPB0yTu5UMTqg==
X-Received: by 2002:a5d:5885:0:b0:42b:3701:c4c0 with SMTP id ffacd0b85a97d-42b5933e285mr14711146f8f.5.1763452175459;
        Mon, 17 Nov 2025 23:49:35 -0800 (PST)
Message-ID: <52b13a38-f037-4235-8ea2-70b0d8a4b470@suse.com>
Date: Tue, 18 Nov 2025 08:49:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/ucode: Fix error handling during parallel ucode
 load
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251117222120.473451-1-andrew.cooper3@citrix.com>
 <20251117222120.473451-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251117222120.473451-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.11.2025 23:21, Andrew Cooper wrote:
> wait_for_state() returns false on encountering LOADING_EXIT.
> control_thread_fn() can move directly to this state in the case of an early
> error.  It is not an error condition for APs, but right now the latest write
> into stopmachine_data.fn_result wins, causing the real error, -EIO, to get
> clobbered with -EBUSY.  e.g.:
> 
>   # xen-ucode /lib/firmware/amd-ucode/microcode_amd_fam17h.bin --force
>   Failed to update microcode. (err: Device or resource busy)
> 
>   (XEN) 256 cores are to update their microcode
>   (XEN) microcode: CPU0 update rev 0x830107d to 0x830107c failed, result 0x830107d
>   (XEN) Late loading aborted: CPU0 failed to update ucode: -5
> 
> Drop all the -EBUSY's, and treat hitting LOADING_EXIT as a success case.  This
> causes only a single error to be returned through stop_machine_run().  e.g.:

Why "single"? stop_machine_run() can't return multiple ones, having only a
scalar return type? Or do you mean "a single, consistent" or some such?

>   # xen-ucode /lib/firmware/amd-ucode/microcode_amd_fam17h.bin --force
>   Failed to update microcode. (err: Input/output error)
> 
>   (XEN) 256 cores are to update their microcode
>   (XEN) microcode: CPU0 update rev 0x830107d to 0x830107c failed, result 0x830107d
>   (XEN) Late loading aborted: CPU0 failed to update ucode: -5

The sole difference being which specific error is observed, which looks to
support the above interpretation. What I don't quite understand is ...

> Fixes: 5ed12565aa32 ("microcode: rendezvous CPUs in NMI handler and load ucode")

... this and the specific indication that this needs backporting: Why is
the particular error code this important here?

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -260,7 +260,9 @@ static int secondary_nmi_work(void)
>  {
>      cpumask_set_cpu(smp_processor_id(), &cpu_callin_map);
>  
> -    return wait_for_state(LOADING_EXIT) ? 0 : -EBUSY;
> +    wait_for_state(LOADING_EXIT);
> +
> +    return 0;
>  }

At which point the function could as well return void? Preferably with this
adjustment (and the knock-on one at the call site) and with the slight
clarification to the description
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -271,7 +273,7 @@ static int primary_thread_work(const struct microcode_patch *patch,
>      cpumask_set_cpu(smp_processor_id(), &cpu_callin_map);
>  
>      if ( !wait_for_state(LOADING_ENTER) )
> -        return -EBUSY;
> +        return 0;
>  
>      ret = alternative_call(ucode_ops.apply_microcode, patch, flags);
>      if ( !ret )
> @@ -313,7 +315,7 @@ static int cf_check microcode_nmi_callback(
>  static int secondary_thread_fn(void)
>  {
>      if ( !wait_for_state(LOADING_CALLIN) )
> -        return -EBUSY;
> +        return 0;
>  
>      self_nmi();
>  
> @@ -336,7 +338,7 @@ static int primary_thread_fn(const struct microcode_patch *patch,
>                               unsigned int flags)
>  {
>      if ( !wait_for_state(LOADING_CALLIN) )
> -        return -EBUSY;
> +        return 0;
>  
>      if ( ucode_in_nmi )
>      {

Vaguely recalling the original intentions, these changes looked wrong to me at
the first glance. But yes, an exit indication from the control thread isn't
really a separate error condition.

Jan

