Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682619411B2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 14:20:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767708.1178404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlpu-0004xt-Jm; Tue, 30 Jul 2024 12:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767708.1178404; Tue, 30 Jul 2024 12:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlpu-0004vf-H8; Tue, 30 Jul 2024 12:20:14 +0000
Received: by outflank-mailman (input) for mailman id 767708;
 Tue, 30 Jul 2024 12:20:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYlpt-0004vZ-5R
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 12:20:13 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 110d2e23-4e6e-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 14:20:11 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5af6a1afa7bso4388850a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 05:20:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac631b0464sm7195767a12.4.2024.07.30.05.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 05:20:10 -0700 (PDT)
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
X-Inumbo-ID: 110d2e23-4e6e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722342011; x=1722946811; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yn8BgAw6Gp0DxNh8lZ3IYst5fC5UQL1IuYSVb6S5Xqo=;
        b=DKy3TxvFJmCLIJHw52OAG0328g1pOxzDxQrHZnjTVHjCiFrT+JFR5aMUNafvJnbXjB
         dsotdoRhEAOpP8bkqu4d8layjuc0ozrZ7iGWCPUk7o8iyoPvz/9UErRGcr/l2W/RVVso
         dgDBHcfJJFbQqwDIe79Soptgtpd2XghWbuhSgfXDRo/XhT+eSrxD3p6jDO9Fywjx8zC/
         8lgfyCkISOpeJ3PmmzTXuveetkvSrlZ7UcagzrD9NIVQtg9ekt/+cLDwgQeCfy1X4E4E
         ++smXvGmAmlBCmMYugMR1EzZGvxl4Zi34R43jQ9JOgOPd/NNhfwmDpl9CO4CAzKXDHxn
         LqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722342011; x=1722946811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yn8BgAw6Gp0DxNh8lZ3IYst5fC5UQL1IuYSVb6S5Xqo=;
        b=jToatbC9/g4wq2/j0BE+XUDYLKYejpc/sP3esuu3uUCUl/wYbO+Z2fGupux8Y7+xog
         NT8GC4ivXHeZFz0k6quKNXfVpS6ZqkWKd/iNwfyKkZfmciFiyD74HGOzyWKIzYvCs/7O
         vyTUiR8a8sqL6C/y3etuncm++IMQGMPH9Hqzn+e/DxEQ0lHAR+JEV8zlse2Nw2waxxNS
         q3OQHpWvP0R8zusFRgaUDyeW6kGwDLHKB8ELRdJH4o6hVkAryTA2V8vnGRv2WtMawpw8
         2A/VWLBU/Z3LCuWXz2PeFTwARAxUjMCa8K2et/6lVYEUydK16IGCN12x3wlbwbWRSkxQ
         2Vog==
X-Forwarded-Encrypted: i=1; AJvYcCW1Ab1Fcz66aE/CW01wXUfa8UYQPwFWGTi71nBRAI499o6DYgHVkIokknv4+vmOkic5NEZg1sACYSxlhRO0JOsdzf+lj48FyrTF+uzZGkU=
X-Gm-Message-State: AOJu0Yy8h1bFQhaQdJvnR7hARfvbTXzP2W3liDrwee5dW4Iuceuphntz
	ceDshvxySdlxihJzio4fm7I7YmYQFzGk7Gs8249/rQOCFmqCHIK+ZD2THSuFDJfsFBMEXu4iKE0
	=
X-Google-Smtp-Source: AGHT+IEJfO7kXee9CNwbHnfZoZnd22D74Dxe37p4Gi8LoR92LrXu2eYMeH3Pewnc5apCO5S4NhoOtA==
X-Received: by 2002:a50:c192:0:b0:5a4:622f:63c6 with SMTP id 4fb4d7f45d1cf-5b0205d5b5amr5760098a12.13.1722342010586;
        Tue, 30 Jul 2024 05:20:10 -0700 (PDT)
Message-ID: <404275f0-b7f7-4303-b6b9-88af9ccddc57@suse.com>
Date: Tue, 30 Jul 2024 14:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: Drop APIC_BASE and use fix_to_virt()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240730121749.637879-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240730121749.637879-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2024 14:17, Andrew Cooper wrote:
> Right now the apic_mem_*() helpers only compile because sizeof(void *) ==
> sizeof(long long).  Switch to using fix_to_virt() which is a void *type.
> 
> Also adjust the two places where the APIC/IO-APIC virtual address is rendered
> in a printk().
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
ideally ...

> --- a/xen/arch/x86/include/asm/apic.h
> +++ b/xen/arch/x86/include/asm/apic.h
> @@ -51,12 +51,16 @@ const struct genapic *apic_x2apic_probe(void);
>  
>  static inline void apic_mem_write(unsigned int reg, uint32_t v)
>  {
> -	*((volatile u32 *)(APIC_BASE+reg)) = v;
> +    volatile uint32_t *addr = fix_to_virt(FIX_APIC_BASE) + reg;
> +
> +    *addr = v;
>  }
>  
> -static inline u32 apic_mem_read(unsigned int reg)
> +static inline uint32_t apic_mem_read(unsigned int reg)
>  {
> -	return *((volatile u32 *)(APIC_BASE+reg));
> +    volatile uint32_t *addr = fix_to_virt(FIX_APIC_BASE) + reg;

... with const added here.

Jan

