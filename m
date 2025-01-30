Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE8FA22ED4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 15:15:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879611.1289829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdVKC-0001kX-7l; Thu, 30 Jan 2025 14:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879611.1289829; Thu, 30 Jan 2025 14:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdVKC-0001i4-4n; Thu, 30 Jan 2025 14:15:20 +0000
Received: by outflank-mailman (input) for mailman id 879611;
 Thu, 30 Jan 2025 14:15:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdVKA-0001hc-1M
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 14:15:18 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a07391d6-df14-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 15:15:15 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436341f575fso9647165e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 06:15:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7fd9sm127608866b.34.2025.01.30.06.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 06:15:14 -0800 (PST)
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
X-Inumbo-ID: a07391d6-df14-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738246515; x=1738851315; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=727D/DkoH5Aywyiyi7Z0Y6u9UAsi8e29CsiZ5+y2AQQ=;
        b=Gj0nsLeA0+ti0W2dHduj4w8WJemwgzBTKHfHAh9SeSS3rm4kRuSbo2ler43cHGrVQV
         hxUCtxsCLDUN5QAkm571ZBmiQoDXwAoakbRKqnROAAFX07TD1ixdSQQEBQQHq6dyGsoG
         FpG7ODZQIpFTlw+8+ARSKaT93nexDFhwCHxUAHiu5s2BEV6E9joDOuXcmYx5SuJqbdr+
         sEJ1iSQY3yXHlcpI0w9bRNiLLR/NQetHOs+oJaHx1Kuooe4Mf06//3pt5B34VMtwljsg
         ZbkGiOtvR3FdAshFvPhtBdAK0ReGZ+qFo7BqrZ3pFUWbw0OZvXfvxnoNOotNXepHJq+a
         7mPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738246515; x=1738851315;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=727D/DkoH5Aywyiyi7Z0Y6u9UAsi8e29CsiZ5+y2AQQ=;
        b=Bs79TLkfNzjf7Mu+hOIWLNHj5ti16LPthHBP2iLJc4+cAod/Qn4H2mzM5HAksdBBA7
         AxEBkUlOCTqMFjo/PA98Ufrf8GLouwyOVieNovkYXV5XX6c3Fcmbw1Ayb8EpvhErWKxd
         /6KOV3ci4B8FDeNByLb6rNQyKfcvMQ/WGQdnmrqrWFXiZ9/+wK4QUXuojx9JwP8BwOTI
         jl9Oamr5r6lDYj00dhN4zB1nS8fB5f+BAzlGjW6UiV2XrskWJbHMhvY+n8TVbhD6S+Wh
         E8gmSYz/xgUduH+L/aI8NiFIgAC11HGU0lyDkYwgI2w5i9PvC6bVfgVHoNWAQ5lgAm05
         YgvA==
X-Forwarded-Encrypted: i=1; AJvYcCWxOKQwBPdE3sT4HSpnZgTtfvufd7kwU6v8tvD2QNQZxQw0rB1ghFLIwRiXzXjiWVtt5HPjbHGDHpM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytT9W28ZP9t+4Zss4c3VdilUclUTDgWaQBfZkDeFy2hp7H35bl
	oe4WE95ZNXrjj7mapBIjeU06K2QjgZJZ6KDNsyHG0saFoHgTY5+GrMyyk7O/YQw5ewbcSwwkxUs
	=
X-Gm-Gg: ASbGncuVxaBK2mrIjN8opji5VXL6kHbMtlQl/iq4X1n4eBpIQAjOEqQPOwwFPtNn54W
	CJwK+kzffLRrWMJIEEvK0udcuq/M5hEaOK9Qr6Hmq+9DtvBOz1VU6q7LKGNqugNcp7OGg9b9oSi
	wWi6oQySfK5VthC09hnzgCwbU49IPUoeRNY8vC0KuET6QKufGstCsMYgSOvEc63qMzeqrO7z3f1
	Jp4Xbbww1BE/qWeqWcyhqW/iCzfDhifJV7e2/mostfWjrkBGjmmz+gqbBJ+S3VjUVbCjiTzEkN+
	fj832ens18/GbCp2XwBfRGU+RlZzZQqaO1RKdQq3eosWcvUSY18W6cBv4oXGJpl/Lc3X6fNtmZN
	V
X-Google-Smtp-Source: AGHT+IF3MDcjEx6HDfRoFPJ8fmeSpma+3suW0DJBdxl7Px92egDROwe7Wd8ZxZ4pszkBfsk9mQ0cVQ==
X-Received: by 2002:a05:6000:1548:b0:38c:3f12:64be with SMTP id ffacd0b85a97d-38c51f8a3camr8768835f8f.35.1738246515108;
        Thu, 30 Jan 2025 06:15:15 -0800 (PST)
Message-ID: <791f9f14-e329-4cc4-9065-cdb84b6907ce@suse.com>
Date: Thu, 30 Jan 2025 15:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] x86/boot: add cmdline to struct boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-4-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241226165740.29812-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.2024 17:57, Daniel P. Smith wrote:
> @@ -759,9 +758,10 @@ static int __init pvh_load_kernel(
>      /* Free temporary buffers. */
>      free_boot_modules();
>  
> -    if ( cmdline != NULL )
> +    if ( bd->cmdline != NULL )
>      {
> -        rc = hvm_copy_to_guest_phys(last_addr, cmdline, strlen(cmdline) + 1, v);
> +        rc = hvm_copy_to_guest_phys(
> +                last_addr, bd->cmdline, strlen(bd->cmdline) + 1, v);

Nit: Indentation. The anchor point for this kind of increased indentation
is the function name being called, so you want to add one more blank. (It
is not N times the usual indentation of 4, until "it looks okay".)

> --- a/xen/arch/x86/include/asm/bootdomain.h
> +++ b/xen/arch/x86/include/asm/bootdomain.h
> @@ -11,6 +11,8 @@
>  #define __XEN_X86_BOOTDOMAIN_H__
>  
>  struct boot_domain {
> +    const char *cmdline;
> +
>      domid_t domid;
>  
>      struct boot_module *kernel;

I can see why in the earlier patch you added domid at the top. But cmdline?

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -975,10 +975,29 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
>      return n;
>  }
>  
> -static struct domain *__init create_dom0(struct boot_info *bi)
> +static size_t __init domain_cmdline_size(
> +    struct boot_info *bi, struct boot_domain *bd)
>  {
> -    static char __initdata cmdline[MAX_GUEST_CMDLINE];
> +    size_t s = bi->kextra ? strlen(bi->kextra) : 0;
> +
> +    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
> +
> +    if ( s == 0 )
> +        return s;
> +
> +    /*
> +     * Certain parameters from the Xen command line may be added to the dom0
> +     * command line. Add additional space for the possible cases along with one
> +     * extra char to hold \0.
> +     */
> +    s += strlen(" noapic") + strlen(" acpi=") + sizeof(acpi_param) + 1;

See below; I question this all being necessary for PVH Dom0.

> @@ -1018,39 +1037,52 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>          panic("Error creating d%uv0\n", bd->domid);
>  
>      /* Grab the DOM0 command line. */
> -    if ( bd->kernel->cmdline_pa || bi->kextra )
> +    if ( (bd->kernel->cmdline_pa &&
> +          ((char *)__va(bd->kernel->cmdline_pa))[0]) ||
> +         bi->kextra )
>      {
> -        if ( bd->kernel->cmdline_pa )
> -            safe_strcpy(cmdline,
> -                        cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader));
> +        size_t cmdline_size = domain_cmdline_size(bi, bd);
> +
> +        if ( cmdline_size )
> +        {
> +            if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
> +                panic("Error allocating cmdline buffer for %pd\n", d);
>  
> -        if ( bi->kextra )
> -            /* kextra always includes exactly one leading space. */
> -            safe_strcat(cmdline, bi->kextra);
> +            if ( bd->kernel->cmdline_pa )
> +                strlcpy(cmdline,
> +                        cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
> +                        cmdline_size);
>  
> -        /* Append any extra parameters. */
> -        if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
> -            safe_strcat(cmdline, " noapic");
> +            if ( bi->kextra )
> +                /* kextra always includes exactly one leading space. */
> +                strlcat(cmdline, bi->kextra, cmdline_size);
>  
> -        if ( (strlen(acpi_param) == 0) && acpi_disabled )
> -        {
> -            printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
> -            safe_strcpy(acpi_param, "off");
> -        }
> +            /* Append any extra parameters. */
> +            if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
> +                strlcat(cmdline, " noapic", cmdline_size);

Roger - this isn't going to work very well with PVH Dom0, is it?

> -        if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
> -        {
> -            safe_strcat(cmdline, " acpi=");
> -            safe_strcat(cmdline, acpi_param);
> -        }
> +            if ( (strlen(acpi_param) == 0) && acpi_disabled )

Not sure whether the compiler will do that transformation anyway, but this
check looks odd to me. Why not simply check whether the first char is the
nul one?

> +            {
> +                printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
> +                safe_strcpy(acpi_param, "off");
> +            }

Here I'm doubtful, too, when it comes to PVH Dom0. If Xen's even works in
this mode anymore at all, I don't think we can sensibly start a PVH Dom0
then.

(This is leaving aside that all of this is Linux-centric anyway.)

> -        bd->kernel->cmdline_pa = __pa(cmdline);
> +            if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
> +            {
> +                strlcat(cmdline, " acpi=", cmdline_size);
> +                strlcat(cmdline, acpi_param, cmdline_size);
> +            }

(This, btw, won't work quite well when acpi= is specified more than once
on the command line.)

> +            bd->kernel->cmdline_pa = 0;
> +            bd->cmdline = cmdline;
> +        }
>      }
>  
>      bd->d = d;
>      if ( construct_dom0(bd) != 0 )
>          panic("Could not construct domain 0\n");
>  
> +    xfree(cmdline);

Leaving bd->cmdline dangling?

Jan

