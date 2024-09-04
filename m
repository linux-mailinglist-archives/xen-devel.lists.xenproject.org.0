Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA36896B1FB
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 08:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789806.1199462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljgX-00025d-BJ; Wed, 04 Sep 2024 06:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789806.1199462; Wed, 04 Sep 2024 06:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sljgX-00023j-8S; Wed, 04 Sep 2024 06:40:09 +0000
Received: by outflank-mailman (input) for mailman id 789806;
 Wed, 04 Sep 2024 06:40:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sljgW-00023d-J5
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 06:40:08 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8638451d-6a88-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 08:40:07 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a866d3ae692so356543466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 23:40:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccff4bsm7301044a12.70.2024.09.03.23.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 23:40:06 -0700 (PDT)
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
X-Inumbo-ID: 8638451d-6a88-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725432007; x=1726036807; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ukVfa9S5LIjLJs8ouvufMJpr6kMT2Vnlw3cC0CRgFys=;
        b=W9a3GDPGFenxMHPovJ/M8Ahc1XPoFlH80/Y8AZPA0aOlH3SScgjHYXJsW+9U+5X+pl
         Ph6sipCAR/JJWlh/6W0vafoah+MCFPct5Z7qtSOWPtxWsUUCt9WUwEacqKM0aibu6zmk
         opaCIsRJsPSF2LkGTqRWY6Db+hU/w20zWY4ulOXdvIvAa6QjqUaniBh+Cx8XqfMr6Kab
         HPXIs8s7ELSi0wqA3dJFx1+XgyxV0ODAG4mx5sY+VLWHAiWXJpFBIEvZJRZZAiPcgS3E
         XeU4GMm7sygejE1q1N15kxYopYe2UJtSdwIrYY5eScxGsekYRe02hS1uzfnEvp00mOat
         jCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725432007; x=1726036807;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukVfa9S5LIjLJs8ouvufMJpr6kMT2Vnlw3cC0CRgFys=;
        b=I1mRxAQNetSjhQw6CIOzBRiNsoIQctdbLNfxGOh1MDZzRzd9hSc33G1lmuBnqpvwtb
         0r08qtwaBF/MZ4o/VAxpyJHUEP5yJrZIqj0Rjo+LiX08/UI64XolkHYZOttpDNcN96x3
         SjDwy8DnkqHCbzkQujkkItutTTmg6GImPOtKHNfCVvc8Oz7XLOaipVnT6zLPpHuLgPd9
         yYCD2f3rzaiqnq4J7oKNw/ZjFUGC3Lhcnzj8cOs6NWPcRzsfXkQiOorz+3iPp3k3u3Yx
         gvTDL3mdMUfBljXucANzTh59GZo8TkqeRFK/ajjk2RL0LqRAPBUSnQ1m3DR+lRpPfCol
         LuWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9DD2ZRDwj1MS1l9beARZMZKsBv7ZlND/QUAYHP6SOzyawXBTVElkXl2IX9OI6JbAIqisvi+T6tGE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxET3VuERku/XRRi+mrVm3cfiwDFg6iKQZ3Vkca/Rp+BbKmWuTs
	4BZ/eJWLNK60SmTPhOtRgSZN40UUu/NGjIw8oYCgdBe+CKh1gl9I5w+OV6c1xQ==
X-Google-Smtp-Source: AGHT+IFkIyYUVsJZqqsEJGeITbuLEJWvy3UlYNJQ1s2bO7P3NbOby8cczUnObaqJrAOwfXWhuxeF/Q==
X-Received: by 2002:a05:6402:5512:b0:5be:d687:9e6c with SMTP id 4fb4d7f45d1cf-5c21eda0f51mr17816631a12.36.1725432006913;
        Tue, 03 Sep 2024 23:40:06 -0700 (PDT)
Message-ID: <f6c938b4-3c28-4dc8-bc3a-3becb3a0c2cd@suse.com>
Date: Wed, 4 Sep 2024 08:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/44] x86/boot: convert consider_modules to struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-7-dpsmith@apertussolutions.com>
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
In-Reply-To: <20240830214730.1621-7-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2024 23:46, Daniel P. Smith wrote:
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -632,7 +632,7 @@ static void __init noinline move_xen(void)
>  #undef BOOTSTRAP_MAP_LIMIT
>  
>  static uint64_t __init consider_modules(
> -    uint64_t s, uint64_t e, uint32_t size, const module_t *mod,
> +    uint64_t s, uint64_t e, uint32_t size, const struct boot_module *mods,

As an array is meant, may I ask to switch to mods[] at this occasion?

> @@ -642,20 +642,20 @@ static uint64_t __init consider_modules(
>  
>      for ( i = 0; i < nr_mods ; ++i )
>      {
> -        uint64_t start = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
> -        uint64_t end = start + PAGE_ALIGN(mod[i].mod_end);
> +        uint64_t start = (uint64_t)mods[i].early_mod->mod_start << PAGE_SHIFT;

Similarly, may I ask to stop open-coding {,__}pfn_to_paddr() while
transforming this?

> @@ -1447,7 +1447,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>          {
>              /* Don't overlap with modules. */
>              end = consider_modules(s, e, reloc_size + mask,
> -                                   mod, boot_info->nr_mods, -1);
> +                                   boot_info->mods, boot_info->nr_mods, -1);
>              end &= ~mask;
>          }
>          else
> @@ -1482,7 +1482,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>                  continue;
>  
>              /* Don't overlap with other modules (or Xen itself). */
> -            end = consider_modules(s, e, size, mod,
> +            end = consider_modules(s, e, size, boot_info->mods,
>                                     boot_info->nr_mods + relocated, j);
>  
>              if ( highmem_start && end > highmem_start )
> @@ -1509,7 +1509,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>          while ( !kexec_crash_area.start )
>          {
>              /* Don't overlap with modules (or Xen itself). */
> -            e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size), mod,
> +            e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size), boot_info->mods,
>                                   boot_info->nr_mods + relocated, -1);

All of these show a meaningful increase of line lengths, up to the point of
ending up with too long a line here. I really wonder if the variable name
"boot_info" isn't too long for something that's going to be used quite
frequently. Just "bi" maybe?

Jan

