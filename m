Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F51688015C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 17:04:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695483.1085281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbwB-0002v8-9Z; Tue, 19 Mar 2024 16:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695483.1085281; Tue, 19 Mar 2024 16:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbwB-0002tS-6r; Tue, 19 Mar 2024 16:03:39 +0000
Received: by outflank-mailman (input) for mailman id 695483;
 Tue, 19 Mar 2024 16:03:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmbw9-0002tK-NM
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 16:03:37 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e5ca587-e60a-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 17:03:36 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56b857bac38so973233a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 09:03:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ek20-20020a056402371400b0056b9754fa1fsm782402edb.60.2024.03.19.09.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 09:03:35 -0700 (PDT)
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
X-Inumbo-ID: 3e5ca587-e60a-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710864216; x=1711469016; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EtHfdTvgfTJgk7m9Ttz2PcO/AOctE+1IurGzbgNC7xs=;
        b=bskAAJ6aSqRRDfG1aw0B02gDrNWbqoL0S/72Iw4KdgIe/meDUp+1zZpnewkjBV0pUP
         Pr/y+lMioiWr16nUUQpK2JDeE/UT4ucwQGpukTwSjy1nbdxxuHDZcHFEt/5fbsz5Kr2g
         2ZvUNrDn3w3bK41PT/Duaw9UhHC8Z9WOSIXXa80lMfN0VxsufuwTrE0tO1/OGTtsumf+
         /HbTDeU2PNLssS8E8DLS+Mixmp6kjBuSPszQSMSGbZGqrPdERMl+kktAgw1hCRnFjsvX
         fvkjI8qUyzZHOALcvOezPPGAzOvg0yShrDEa2SVqlDqm0FJvjHKhkDAy+SX1n+prn4tP
         +Zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864216; x=1711469016;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EtHfdTvgfTJgk7m9Ttz2PcO/AOctE+1IurGzbgNC7xs=;
        b=qkUX+Ur9mNOavJLB8NRM6Bfg/WxW/bbmsiuhqkwhBG+VESsfWhWi2G7KoSY4fp7bIg
         Rl7TJUdRk/egnY/zjst4q7l0s4k4sw9KFXXxebcJHy8vvioRCL79uhtYR6CYlrrSVj3T
         KeUmE9stl6cWMFE9QUJHFSItBmleeJARj6z4aCk/TmbDbPy78qnEJdiqf1mlEn60T2zW
         LOm1YaHGUJr5d7Bo4Uaf/QgoKf3W8rPbivGADgD/j/C3u8VVI4WFtU86RuWQKvDUNq2Z
         0DR7Q29t+LWT/rGadB8E/8idrDljPqttjwKHsQhKrCC/VR66lZSqj65zqC/Yg/CkFg+1
         6mpg==
X-Forwarded-Encrypted: i=1; AJvYcCWbCXStQk4wY+FWp1t9ol0paw7c3G8kyV2SC9bjzPDx+9fjPudmrImDO2csBISavDnSjWYkjzcv6A40Mt/p3SquKYpKpaU/AgLGXCSr6Lw=
X-Gm-Message-State: AOJu0Yywwb8tYX6YT0V8AUbdKik88zTkL3XcMPWCf7+s6B5TP8LbSDHQ
	7lzGeqvUPLFWsG2rdmaPLBy2LfneEJmPrI4hA+JxVCmwnKnUNanmuehJR3tGgPJT3JSPY3eV8LU
	=
X-Google-Smtp-Source: AGHT+IFkrW6OEWqYCE+I9uzhw2wyuVwG249wD7+3krzcAduz+Y37v03UC3sNPxCPkpm6y55IMZZ8Qw==
X-Received: by 2002:a05:6402:1f08:b0:565:f7c7:f23c with SMTP id b8-20020a0564021f0800b00565f7c7f23cmr8216926edb.3.1710864216190;
        Tue, 19 Mar 2024 09:03:36 -0700 (PDT)
Message-ID: <9dfd1629-e69f-40a9-a027-9e36add0a48f@suse.com>
Date: Tue, 19 Mar 2024 17:03:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/14] xen/arm: add cache coloring support for Xen
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-15-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240315105902.160047-15-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 11:59, Carlo Nonato wrote:
> @@ -62,7 +63,67 @@ unsigned int __init get_llc_way_size(void)
>      return line_size * num_sets;
>  }
>  
> -void __init arch_llc_coloring_init(void) {}

Btw, doing things this way isn't very nice. I was about to ask ...

> +/**
> + * get_xen_paddr - get physical address to relocate Xen to
> + *
> + * Xen is relocated to as near to the top of RAM as possible and
> + * aligned to a XEN_PADDR_ALIGN boundary.
> + */
> +static paddr_t __init get_xen_paddr(paddr_t xen_size)
> +{
> +    const struct meminfo *mi = &bootinfo.mem;
> +    paddr_t min_size;
> +    paddr_t paddr = 0;
> +    unsigned int i;
> +
> +    min_size = (xen_size + (XEN_PADDR_ALIGN-1)) & ~(XEN_PADDR_ALIGN-1);
> +
> +    /* Find the highest bank with enough space. */
> +    for ( i = 0; i < mi->nr_banks; i++ )
> +    {
> +        const struct membank *bank = &mi->bank[i];
> +        paddr_t s, e;
> +
> +        if ( bank->size >= min_size )
> +        {
> +            e = consider_modules(bank->start, bank->start + bank->size,
> +                                 min_size, XEN_PADDR_ALIGN, 0);
> +            if ( !e )
> +                continue;
> +
> +#ifdef CONFIG_ARM_32
> +            /* Xen must be under 4GB */
> +            if ( e > GB(4) )
> +                e = GB(4);
> +            if ( e < bank->start )
> +                continue;
> +#endif
> +
> +            s = e - min_size;
> +
> +            if ( s > paddr )
> +                paddr = s;
> +        }
> +    }
> +
> +    if ( !paddr )
> +        panic("Not enough memory to relocate Xen\n");
> +
> +    printk("Placing Xen at 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
> +           paddr, paddr + min_size);
> +
> +    return paddr;
> +}
> +
> +void __init arch_llc_coloring_init(void)
> +{
> +    struct bootmodule *xen_bootmodule = boot_module_find_by_kind(BOOTMOD_XEN);
> +
> +    BUG_ON(!xen_bootmodule);
> +
> +    xen_bootmodule->size = xen_colored_map_size();
> +    xen_bootmodule->start = get_xen_paddr(xen_bootmodule->size);
> +}

... whether the build wouldn't have been broken until this function
is added. Since you know the function is going to gain a non-empty
body, please introduce it in the earlier patch as

void __init arch_llc_coloring_init(void)
{
}

instead.

Jan

