Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C87AB9F639
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 14:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130505.1470033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1lYk-0008B9-LD; Thu, 25 Sep 2025 12:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130505.1470033; Thu, 25 Sep 2025 12:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1lYk-00089g-IH; Thu, 25 Sep 2025 12:58:54 +0000
Received: by outflank-mailman (input) for mailman id 1130505;
 Thu, 25 Sep 2025 12:58:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1lYi-00089a-VB
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 12:58:52 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62387fd3-9a0f-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 14:58:51 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b256c8ca246so182570966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Sep 2025 05:58:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353f86f478sm162128066b.39.2025.09.25.05.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 05:58:50 -0700 (PDT)
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
X-Inumbo-ID: 62387fd3-9a0f-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758805131; x=1759409931; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o6dI5yisvnmQTqPx86XiW79Jlw8g8mW4bVsbS4Do1S8=;
        b=QtIBeet4OCB02LCSXqfgDmDziyF1S/cyMKcFLxIVkHvnKbnO3vi4CZVu5g7BDblWaz
         46r5N8fEpbdtOSmoqeULXIoBZSsyRzjSebP55LjM0zWVQIVUBlcTfbJFTBoO5WMMXj3L
         IfGhUYfNuaLqW0k9CANCl8+07p8oqHBKYaBZWohMWMwTVGFn+kgy06vcMlQ8+JPzFQnV
         kjNer7b5rHZBAjaGgkoyVuTUMDaI6UfO/GkPy1w1xMQApXzL7nidrwIHOYxdAVk2e+Y5
         qQZr38OlaiQehAK/p0nbkCunsTOAQ8KugjKrSLubI6BN23w36eg0DV/Y/IFUZRuZ/7L9
         PHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758805131; x=1759409931;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6dI5yisvnmQTqPx86XiW79Jlw8g8mW4bVsbS4Do1S8=;
        b=PY5llx1+z5e74Ac7tuA19MoP+BZ7gvWg5SJj/QZ/M5IE9zfpmomS2kv+cqScmtgVr+
         5OlVS4vLGWYEL50swTdn/D/dWe1u3PjI4FDfIcJG4xLDpxDsuSzK4M7S5TOZENv5iFFq
         iZCMpRNKKOKN/hCj2vP9OTwBEeZFumhgOgJ/asefZs5YA85GEuHm6cpwX5b307VOxa1a
         78a9NZ7Z7ZrQqdfCA194/Gmc3Y19ZEcFr7cRa+yb9lD7MAx74z/l8FbkIKFzSB8sAdar
         +/PBLPXJwgSAL98SMVqco27Kx6nwiu8v2fwIPV2sqAMc17zNlplIiEDT4ppGUEV7ziwS
         6vqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2yWSjlMzIBt8OR4n4kTPew0N29fmgcb3I8Im1zm/ylrpXh/Og6msckj/RBEwPD7LzBeYOZ5uC5Rk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAeAJRFWvQ29AVQGLmDZDTsaSTPFd70eHXgoOuSa6TvEleBBYg
	KLIQ9mKX9xqOde5QGpw/O1APkQO6ve02AXfY5Ydtrpe3EvxVkBEEpxH9XiE0jmuZSw==
X-Gm-Gg: ASbGncs4cGmX1q0NH38Ici+ZtKmGZ5pTRLseGOalSnMQzqP2Wlttk+tBy/bLD83XEsu
	Q39Is+SnDnGxruCiKVdQSsNRNPFG3vtUiPrU7vCnukwNZvxpBSSdIPxp3GWt2ryQwIVVe08HiUn
	Iinj6j/5bBl0BAQj2EIPcHV0uIYRKAtTuRgbF642z6bCwVfiU+Jsacocea1JhoYn7yhwXxj1G7T
	mIgn3myF9wR9NLM8wYumbxnFPQKhdowgAS2C8MtBNaeCvQPcGsVE4RgCtIS8lFAvRxrA42Eu0A6
	Vxg8cHIjnI9lGzExt9sbAeFwlovsmBlDv39UGFAO//9WGtiU6niWTXHqIG8btmCgRKax8PEcmaK
	mT2FfBI1Rds6zrai/tu5yxgXY3C7MeIw1US8RW70FNMEmuPS8FyRULeGqhWmrFIHCPwvyYNt5yd
	OAFFnHwJc=
X-Google-Smtp-Source: AGHT+IExMvGCmJOJ6D0XNS07MRffiRvQdhPyELUfDztBhs28uoshG+Y39+3MNJO8FBiamtsR1daHQw==
X-Received: by 2002:a17:907:3f1c:b0:b04:3f35:9761 with SMTP id a640c23a62f3a-b34ba147a6bmr309492666b.1.1758805130756;
        Thu, 25 Sep 2025 05:58:50 -0700 (PDT)
Message-ID: <446909d8-f446-42f0-a236-47d5d64ea908@suse.com>
Date: Thu, 25 Sep 2025 14:58:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 1/2] x86/AMD: avoid REP MOVSB for Zen3/4
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <6bcaa5b7-4e34-40c9-85e6-48a0a5869b86@suse.com>
 <485889ed-2820-4bb3-b450-88553dbb719e@vates.tech>
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
In-Reply-To: <485889ed-2820-4bb3-b450-88553dbb719e@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2025 14:18, Teddy Astie wrote:
> Le 25/09/2025 à 12:48, Jan Beulich a écrit :
>> Along with Zen2 (which doesn't expose ERMS), both families reportedly
>> suffer from sub-optimal aliasing detection when deciding whether REP MOVSB
>> can actually be carried out the accelerated way. Therefore we want to
>> avoid its use in the common case (memset(), copy_page_hot()).
> 
> s/memset/memcpy (memset probably uses rep stosb which is not affected IIUC)

Oops, yes.

>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Question is whether merely avoiding REP MOVSB (but not REP MOVSQ) is going
>> to be good enough.
> 
> This probably wants to be checked with benchmarks of rep movsb vs rep 
> movsq+b (current non-ERMS algorithm). If the issue also occurs with rep 
> movsq, it may be preferable to keep rep movsb even considering this issue.

Why? Then REP MOVSB is 8 times slower than REP MOVSQ.

>> --- a/xen/arch/x86/cpu/amd.c
>> +++ b/xen/arch/x86/cpu/amd.c
>> @@ -1386,6 +1386,10 @@ static void cf_check init_amd(struct cpu
>>   
>>   	check_syscfg_dram_mod_en();
>>   
>> +	if (c == &boot_cpu_data && cpu_has(c, X86_FEATURE_ERMS)
>> +	    && c->family != 0x19 /* Zen3/4 */)
>> +		setup_force_cpu_cap(X86_FEATURE_XEN_REP_MOVSB);
>> +
> 
> May it be fixed through a (future ?) microcode update, especially since 
> rep movs is microcoded on these archs ?

I don't know, but I also don't expect that to happen.

Jan

