Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614E5A677B9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:27:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919285.1323776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYpk-0006kL-P9; Tue, 18 Mar 2025 15:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919285.1323776; Tue, 18 Mar 2025 15:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYpk-0006hX-MZ; Tue, 18 Mar 2025 15:26:24 +0000
Received: by outflank-mailman (input) for mailman id 919285;
 Tue, 18 Mar 2025 15:26:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuYpj-0006hR-DY
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:26:23 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57a8210b-040d-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 16:26:20 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-399676b7c41so1485348f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 08:26:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df385bsm18184041f8f.4.2025.03.18.08.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 08:26:19 -0700 (PDT)
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
X-Inumbo-ID: 57a8210b-040d-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742311579; x=1742916379; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lg8P9AcoLEXM6/4Oi0kkFaWHmYnmZxjHy1PqQ8BzuK8=;
        b=eqhgE1EmtqFTMShAHNU+Shcre1BxBcC3aYheXWk/vw2knVXDtJAYkhOIZovKTO1tHK
         rxtzPiNh1VHDfIUmq5664SwWWPNa4qDKqdx/+5H2MHlszMVADO5kZHzVSIo7UEoM6JRp
         yhoAM7drYWE+Zg7r2uxuJWSeI6mIRysJaw+ZY1OWFON00QPdBJbZ2iOAhTEDWR+CYy4d
         +Fl6b7ZonUrGsw1TzQmtLOVhHc3WlT+fWhsj2eeh/qwsI58BF9Ls05I9teQO2H1eVLw5
         IZr1dlh9WcXrEkb1il7yQTtfpLz+o1mPjoL4K489h76e2FCwfj6vhUI0zANCIt3MN3YT
         MaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311579; x=1742916379;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lg8P9AcoLEXM6/4Oi0kkFaWHmYnmZxjHy1PqQ8BzuK8=;
        b=ucr1S+KoZtdPaH685DZAmDFu4JOmQLC7HzVnbujgp+9SIbtmMc0gomInhS09uWVNML
         YSK4ZD4rZoE8TuJS7YKyzs//a3xJADp77+hU6WPNpPesyjF296WAUPfIh+VaGTdPyyu9
         GmJPgS5qIDymKRFl709VCqSCdGxprNG2mzz9H5lOeGXVfrzf7U/Jsu9w+kHwHIk4wESF
         mgbXxvu7b6lbjF+TwcYxAx2XF0SJuTBPYow/5ZBX2n9nwH0iRJtIGusWoZrA5cdmu54v
         haONLhwm73AQGMQwaVuoD5bdzCk8Go7KoJofHGZysrTqH9SIt36f4NAaphY8PWQeZyaW
         elOw==
X-Forwarded-Encrypted: i=1; AJvYcCVVB6EL+BjrqIOm43hkS8PIEcmEN8akTWv4JOucaKca+U6v83KtDypWRn5w5Xlq+ETgDO1l7DcA454=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxijdC/lWE5jXDLXri4mv4GxSbydVQyQozNFLhsRjNBoFrFh3pa
	+UYAQ0qLDkM1uPwWwfnrKDHAzBBjUOfB3SYA+iJ9WvHmovX6KIw00mbzfNHR5A==
X-Gm-Gg: ASbGnctR802wDVsFcB7KalmhXPFrHzdwxLlReUHuprmaEi2E2F2CE0256jmiwbiUtG0
	dA3fbrtarnSHE5egKN71jwaJ5Gq7nfxhNJh3k/vs6L0KTGDTIFAUn1CbmIFuCnVl6VSterPiaZR
	iJUfxu7b2wVVbsNQWtwvSPkITV3EFwVfeUU3wzJGaZVYTmxmgEpIYgbO7k5p2ZjFGf/dbMoNWL/
	sIjGMlgeg9mGsZeACqtE3i/pnB+3zxp8qyX6cY1yGqh/qgKjNHZ+wIKrVDyDuomWeYe1z8HLOuJ
	BC3P0CkzuLn1ver2lp4s//ohHD3cXBfw8x04o4ItzWounp+l22UwDeQi3MUdAaZCM1KWbnHGLCv
	GuegTmUuPG8G6/AwQNeLJwqPhEdddPw==
X-Google-Smtp-Source: AGHT+IFOet8HGtSEJ/wziSNDnJziZMfJ43jUnhwMNmCCXy387YOQPk8IMuq1yT/hcA0814pqN3Tr6g==
X-Received: by 2002:a05:6000:1fa7:b0:390:e85b:a8ee with SMTP id ffacd0b85a97d-3971d03ee30mr13885775f8f.1.1742311579592;
        Tue, 18 Mar 2025 08:26:19 -0700 (PDT)
Message-ID: <801007e0-2c02-48f8-856d-8f06eb698fb5@suse.com>
Date: Tue, 18 Mar 2025 16:26:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/traps: Introduce early_traps_init() and simplify
 setup
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250317192023.568432-1-andrew.cooper3@citrix.com>
 <20250317192023.568432-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250317192023.568432-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.03.2025 20:20, Andrew Cooper wrote:
> Something I overlooked when last cleaning up exception handling is that a TSS
> is not necessary if IST isn't configured, and IST isn't necessary until we're
> running guest code.
> 
> Introduce early_traps_init() which is far more minimal than init_idt_traps();
> bsp_ist[] is constructed without IST settings, so all early_traps_init() needs
> to do is load the IDT, and invalidate TR/LDTR.
> 
> Put the remaining logic into traps_init(), later on boot.  Note that
> load_system_tables() already contains enable_each_ist(), so the call is simply
> dropped.
> 
> This removes some complexity prior to having exception support, and lays the
> groundwork to not even allocate a TSS when using FRED.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Given the present state of thing:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
What worries me slightly is that ...

> @@ -63,6 +88,13 @@ void __init traps_init(void)
>      /* Replace early pagefault with real pagefault handler. */
>      _update_gate_addr_lower(&bsp_idt[X86_EXC_PF], entry_PF);
>  
> +    this_cpu(idt) = bsp_idt;
> +    this_cpu(gdt) = boot_gdt;
> +    if ( IS_ENABLED(CONFIG_PV32) )
> +        this_cpu(compat_gdt) = boot_compat_gdt;

... this being done later now requires more care with e.g. play_dead().
Yet if and when needed, this setting up could of course be moved earlier
again. It's not entirely clear to me why you specifically want it here
and not in early_traps_init(). The sole dependency is percpu_init_areas(),
which runs - as even visible from patch context here - ahead of
early_traps_init(). My take is - the earlier we do things that can be
done easily, the less we have to worry about ordering and dependencies.

Jan

