Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F23A1A4C3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 14:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876242.1286621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tax6b-0001vY-Ch; Thu, 23 Jan 2025 13:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876242.1286621; Thu, 23 Jan 2025 13:18:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tax6b-0001u5-9l; Thu, 23 Jan 2025 13:18:45 +0000
Received: by outflank-mailman (input) for mailman id 876242;
 Thu, 23 Jan 2025 13:18:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tax6a-0001ty-08
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 13:18:44 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9144c3a7-d98c-11ef-a0e5-8be0dac302b0;
 Thu, 23 Jan 2025 14:18:42 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-386329da1d9so482467f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 05:18:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf32151f1sm19534961f8f.14.2025.01.23.05.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 05:18:42 -0800 (PST)
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
X-Inumbo-ID: 9144c3a7-d98c-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737638322; x=1738243122; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sHEDMNPetKm/UfJaod/2s4iViLSNkUfQuWFOwKPC9L4=;
        b=YZFEBy0LsQVo0OoYe8mY9DGPcQl1EW3ayESpNC3YIa6o+9jv6U+e3RIjqRh3zXU+VJ
         lTCLWJhbWeSAIW3TvWrBT3z2aRB9uhVqRAerLMZsKsA0ngM3WwubBxrAfmaDzeZP6lLp
         bVzHq9jr/SJGCCsb/nLEf72kdIAOQC3rwEdJMZgAScAZsTd2brigOyI9ZoP3ffQRomae
         uOYsTMNI6h373ApVkcaxGWAvB+aJMT00lt4shQ3Q0BmmZgaVl7eAhKXwTeUkdOncjLzv
         D0at/w1vTcs3YOehUuv+H2dmrP8DE07SdhJrPHb7Ajva0khz9QBjYyWVFU2RGzQILd/t
         zF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638322; x=1738243122;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHEDMNPetKm/UfJaod/2s4iViLSNkUfQuWFOwKPC9L4=;
        b=t1BmdYUIXf3/IygjknPEW0jveuU9vDgzPlRYnJojxf8XiySiu6ttYrgKlsMOeVjFgZ
         0FINudpA0PpWN6v2CkZ55Uyn03KvPt0XhDXA6TA5dxytJn1DgoaWAjAfqxL2LXkqegmZ
         /IyAhHI/MAdxRXflD3UkeAcUHbEz19QGQKTmS0IaUb6G9LklLbTJZnK4H0fdu9HEEIE7
         +WvyQuqzafte0LdY9Yz6VODUPuRIyQPRcnT1AIZvArMrgp/UhHovJuKx/N0YLDGEUeiv
         0SysvOsNAlFkeOEfqJ8sGIU6dsXQ/Cr5/B81JeLrtH5Cv0AsK5nYrvWfZHPQMDPnAv/D
         XM8g==
X-Gm-Message-State: AOJu0Yz4gDSjFtDLy63LwWnGY3nQDSc9ss7DSDZtElHYxILW9eV5c8kH
	dPU6/Ji31y3pFxOMuoYBJNWhaBE4oh+ElF3P2ULNmuSVdQFzLwO0zPPVUWzVRg==
X-Gm-Gg: ASbGncu/3ZR45/DkJIPFmnOgnGZN2cCUEEV5WejoYBFyxdbyjWKd54pq23MtkiVg1PT
	RdxPGX71UH0oVKaGvZOVMnXzyS6HjAtgylJQ0gwq2Gi1yegUTSHZrq98x5VyDRWr9WpLqA3CUrn
	dLdLPmlBf4+faa2vQvWAF8UUOXP01XuwOlDnli+XbhuEBD4GnQ58ZiuahAoQkW2Lc/ok7loUeVw
	NHGW27tGBHQrnkbq0YfZ0kfSwZOy+NKOBrvHT+HzSXPB+94OAi/zJ4R1cjz8p8AVrHwm78SZAc4
	DYw+aoE8x1MFKF6kdQ7VCS2Vb6SKYKzqs3STNCk4cAgHHWcjn5BuQISW3rtz/d7wqQ==
X-Google-Smtp-Source: AGHT+IFXPz7rmqsiP+SNHu+vhNL3+N7/3rsFkXOo82FToxA2ZrFmMRcVo+GkNk/bmMEcwpagkK7onQ==
X-Received: by 2002:a5d:6d86:0:b0:38a:8e2e:9fcc with SMTP id ffacd0b85a97d-38bf57befa9mr24717162f8f.45.1737638322334;
        Thu, 23 Jan 2025 05:18:42 -0800 (PST)
Message-ID: <f0e2a3f3-3081-414d-824c-bf940134aece@suse.com>
Date: Thu, 23 Jan 2025 14:18:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] x86/HVM: improve CET-IBT pruning of ENDBR
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
 <537b0d9c-1936-4cf5-a012-d50b1097a22d@suse.com>
 <Z5I5D_uVxijLF6sK@macbook.local>
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
In-Reply-To: <Z5I5D_uVxijLF6sK@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2025 13:41, Roger Pau Monné wrote:
> On Mon, Feb 26, 2024 at 05:42:20PM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -161,10 +161,15 @@ static int __init cf_check hvm_enable(vo
>>      else if ( cpu_has_svm )
>>          fns = start_svm();
>>  
>> +    if ( fns )
>> +        hvm_funcs = *fns;
>> +
>> +    prune_vmx();
>> +    prune_svm();
> 
> Isn't it actually the opposite of pruning.  What the helpers do is
> fill all the pointers in the structure.

With the goal of their ENDBR to then be pruned. I agree though that the
functions don't do any pruning themselves. Yet
{svm,vmx}_prepare_for_cet_ibt_pruning() is a little awkward for my taste
(although it would properly document the purpose). Plus ...

>  I would rather name them {vmx,svm}_fill_hvm_funcs() or similar.

... while I can use those names (perhaps without the "hvm" infix), the
present names have the advantage that any other pruning that we may
find desirable could also be put there. Hence also why the cpu_has_*
checks live there.

>  And possibly pull the
> cpu_has_xen_ibt check outside the functions:
> 
> if ( cpu_has_xen_ibt )
> {
>     /*
>      * Now that svm_function_table was copied, populate all function pointers
>      * which may have been left at NULL, for __initdata_cf_clobber to have as
>      * much of an effect as possible.
>      */
>     vmx_fill_hvm_funcs();
>     svm_fill_hvm_funcs();
> }

Which would leave the SVM function entirely empty. The intention was for
that to not be the case, and also for the comment you have added above
to also live in the per-vendor functions.

> I would be nice to avoid directly exporting more vmx and smv specific
> helpers, as if we ever want to compile out vmx or svm it would be more
> churn to deal with those.  I however cannot think of any good way to
> do this here, so it's fine to export those functions.

It could be another hook, just that the hook pointer then would point
into .init.text (i.e. become stale once we purge .init.*). We could zap
it of course after invoking it ...

Note that the vendor function invocations have meanwhile, in the course
of re-basing, gained "if ( IS_ENABLED(CONFIG_...) )", so no extra
(future) churn for the (already available) option you talk about.

Jan

