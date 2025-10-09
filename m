Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8E4BC7B2D
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 09:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140335.1475254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6l3W-0006u5-De; Thu, 09 Oct 2025 07:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140335.1475254; Thu, 09 Oct 2025 07:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6l3W-0006ro-AU; Thu, 09 Oct 2025 07:27:18 +0000
Received: by outflank-mailman (input) for mailman id 1140335;
 Thu, 09 Oct 2025 07:27:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6l3U-0006pg-W4
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 07:27:16 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 611bd8e6-a4e1-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 09:27:15 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-639102bba31so1160251a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 00:27:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-639f4109046sm1733483a12.44.2025.10.09.00.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 00:27:14 -0700 (PDT)
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
X-Inumbo-ID: 611bd8e6-a4e1-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759994835; x=1760599635; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J1SMvY42099/y0YZyGh2OdTCy85Qkgsn475WQMbtqas=;
        b=SUvutOYrhONr8nJ/kU9/c7r2vu0g8mdITCZFWX8D9SMmEgAaN5IqqDodOVL9PpKov4
         HkvcXdcmgFWZF/gqmhLNP/OHreBQHDZPJTVMoDBqapQqKWVtFBD40PsrLVbVwlGs3EFq
         btXXfR+KTpRZZd2E7ywk+3lUMqM1vTmKeDWcH/Hr9X4TFJJau1xcIQ9nsqW5Tew7uY1o
         axFStYBdEzAlWepiqVT00OhvJvQlcCL4QTfiAm3HrvQkIOr7FertIhq6GWeCzcR6i/yv
         bqhns7XsuF/mE7HhzSbEzAcYZo35r1hkBYP9CrXn+B0GLcN0ja+pDbgfCo5Mqxr2J8bQ
         qSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759994835; x=1760599635;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1SMvY42099/y0YZyGh2OdTCy85Qkgsn475WQMbtqas=;
        b=Zs0ct2QYQ7j6SOJn5VO81LI//Hp+pEzLwKuTEqR3G48AOim3ovcgHy1K57FpE6aUT0
         W+Vy/ikG7QcZjpC4fuAd8P+rI2GtfJVVRgBlrDMG93QqfNF8dP1OFIhhoEIzIVdAOzIM
         3CvB21+aFMTn96b63HcZz8LZ2117MDoW1pVS/UTc9mdLcMFaUkSREO9bIizeUPDe8gU+
         juHO2s+4uwBVVmUWS0x99/oE1FpX6MfEl9+Jozt/PuyxfHcoxROsmx5rohD1qhChpqKg
         apPiYxf5E7IgpwfbM+o4Lk2spBb3+ODEx4rN6r026qreqhLJ3vCwsWoE4ZUd8sVQEEz1
         NfXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8q5QaP7jd4rWaDF/suKyzqN7IG42gFp9iksZiOB1tghduNY4HC9dYN/jaZ6rfN6XwnHjyIK/lNYA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKxKcg/+Ur4HAYa00+FjAv72vFeOyuJnePQMKcowUWTV5rdDYW
	CBJdlYuKxF+cP/K+6EdfKZ5el4yKB0a2ZpPognGNqgWRCEPHw6BcjQCMckkCSFx1pjZ2Zs8L9e3
	gYkU=
X-Gm-Gg: ASbGncs0r3bLZS22V+YRdj4PFhZtHsm3bmFaMAdf+Tl1BPmJaz07Wc4iIqYS7sKcRRZ
	RE3GByx6IiGWl+fkBjHcUzFEyupJNTdEMIwKkDpybLGKAMMuACHqI3/dexHrLCZbrVm7cJzvML8
	+hG/cQe8lcNv0N5sTmjl0zc4Hp5LQ9rgStncuDOiZMCQarM62tyBSNk2C+qa+CkubOp3c0GIXBm
	l3TnWivWpfBt8haBqANSokG/5nxPMnZpI6Jv0YIG9C/tN03l+1vkxviKOm7avZxyU0gGm5qmet5
	eytNw9PtfheSDQ21p5QfG0c9FCt3bMISB6aTuRyFcNitX4m26qD63Mh6EhQZACGzva3VHfleAmz
	TiFm1UlWtk7zh5lxNs/1c2hARvpbnSkrlzXHAwIvu632MzhNbDQfE1QmAVOymDpeashsNdxpp9Y
	99TUncozia1lk2PZzh6xfqNlhuGw7+KZr6H3q/ZS5TKQ==
X-Google-Smtp-Source: AGHT+IFrGSqUM19oN9BbWX+X1OLID+3qzhS0nLTeV/IUqDE19E6TpJNMzuNjTH5nk1bOWTE9ey9swQ==
X-Received: by 2002:a05:6402:35ce:b0:637:ef27:c659 with SMTP id 4fb4d7f45d1cf-639d5b57917mr5423587a12.4.1759994834768;
        Thu, 09 Oct 2025 00:27:14 -0700 (PDT)
Message-ID: <6e02a475-4c80-4d4c-a247-0166591e3696@suse.com>
Date: Thu, 9 Oct 2025 09:27:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 1/2] x86/AMD: avoid REP MOVSB for Zen3/4
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <6bcaa5b7-4e34-40c9-85e6-48a0a5869b86@suse.com>
 <f35a2153-a7f7-4d52-bffb-f2e0232a0b73@citrix.com>
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
In-Reply-To: <f35a2153-a7f7-4d52-bffb-f2e0232a0b73@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.10.2025 18:33, Andrew Cooper wrote:
> On 25/09/2025 11:46 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/copy_page.S
>> +++ b/xen/arch/x86/copy_page.S
>> @@ -57,6 +57,6 @@ END(copy_page_cold)
>>          .endm
>>  
>>  FUNC(copy_page_hot)
>> -        ALTERNATIVE copy_page_movsq, copy_page_movsb, X86_FEATURE_ERMS
>> +        ALTERNATIVE copy_page_movsq, copy_page_movsb, X86_FEATURE_XEN_REP_MOVSB
>>          RET
>>  END(copy_page_hot)
> 
> Hmm.
> 
> Overall I think this patch is an improvement.
> 
> But, for any copy_page variants, we know both pointers are 4k aligned,
> so will not tickle the problem case.

Then I fear I still haven't understood the bad "may overlap" condition.
I thought that with the low 12 bits all identical in a page-copy, this
case would _specifically_ trigger the bad behavior.

> This does mess with the naming of the synthetic feature.

Short of better naming suggestions, I would keep it as is.

>> --- a/xen/arch/x86/cpu/amd.c
>> +++ b/xen/arch/x86/cpu/amd.c
>> @@ -1386,6 +1386,10 @@ static void cf_check init_amd(struct cpu
>>  
>>  	check_syscfg_dram_mod_en();
>>  
>> +	if (c == &boot_cpu_data && cpu_has(c, X86_FEATURE_ERMS)
>> +	    && c->family != 0x19 /* Zen3/4 */)
> 
> Even if this is Linux style, && on the previous line please.

No, precisely because it is Linux style. If and when we change the file
to Xen style (which probably we should), such operators would move.

Jan

