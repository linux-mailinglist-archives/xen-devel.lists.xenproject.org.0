Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22028878FC3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 09:33:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691706.1077959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjxZG-0005q6-1B; Tue, 12 Mar 2024 08:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691706.1077959; Tue, 12 Mar 2024 08:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjxZF-0005nd-Uf; Tue, 12 Mar 2024 08:33:01 +0000
Received: by outflank-mailman (input) for mailman id 691706;
 Tue, 12 Mar 2024 08:33:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjxZE-0005nX-IC
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 08:33:00 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22086d77-e04b-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 09:32:59 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a45c006ab82so608221866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 01:32:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dv18-20020a170906b81200b00a456a97faaesm3587517ejb.86.2024.03.12.01.32.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 01:32:58 -0700 (PDT)
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
X-Inumbo-ID: 22086d77-e04b-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710232379; x=1710837179; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nyEh0rQYJE6Jec/uxVqP64Ftm28yLZ08FcTzjd6KJ+M=;
        b=ZExSEvH7ntyB+UKAucN9E1n8StLXvrybQPTcqloJEELSnemWAe4w87geA4pM0eP+gE
         2KCHIVieYYc6wTb1mOsF4kKReGuUFxj5riBRtLr2buEEZXe2a2psT9YYl/QyqY6xWRPL
         FjMJOiSUglAQUOo2MxoI8XZbBWC1pWxnd5OqpBbJysvfl3cgsGVd6onvwMFQrR1ehAOv
         P+43p5C6Y/r2JAWZcF93et8JqG7fFoZ3QvBHTki+37XO9y4P5lxp5z0kl6tkPz/XeuSV
         Vx3flC7jLTihsTZjzP7uQHLKNANMBk7B1xWG3lqZHOE5oSAWm+dCBA5ztLkySGrUvLrW
         EYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710232379; x=1710837179;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nyEh0rQYJE6Jec/uxVqP64Ftm28yLZ08FcTzjd6KJ+M=;
        b=M8rxFWvRf+S8d7QZXEA53dMij2hxA+dsdwbzw/l26KjhVG7vcG0mDqmEDgspEhIVmb
         626ZxAfA1sqZaYtFUDr6BS1rK474oJ+2KOr99kgmdXXak7ej/FSk+fyn0zBwrAPE/Aft
         e/5zkreJUCZaoYTabf6/zqTLQyEwy2a7eeWoqCGACeSczazm3nwJQxqduauO18ioZiVZ
         9xC8K/IFInhKXrFBJ6vG6+OhS1DUEsl85t4rCcVQDY5kSRH0DSVeC6GHQSurZSHaxFX0
         GpYftIgBhiYOmwceVAHUH+3MxEqGr7NbIt+8vL8syygZ9Ex/cT/QaSyxwuM7fKzh/PQH
         lEXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8tA+fzBPjyPluX7C4mkLDNWnLLERBhwHy+rSuKYRm2R4mll1PbpAvuyA7UkN32VNBJ2CNuOxPq07VCgZgHch+pPMImjG5rpzpqMfXddc=
X-Gm-Message-State: AOJu0YzAgpQ5iYDC0dOwi9Rveia95AcfjfHfPCvTpz7JrJxnNdGKMW3N
	pqUEngmsf9Rk/nUrpmK6hClvjSLU1FpNzLrhHww4C4wAhKpstXcIQd3Fj/0lGQ==
X-Google-Smtp-Source: AGHT+IFdZEXZ4dDepLONAj9MsyQZPoh/SWEdgXRy6Ic73JdAEwCJejRKx+gzCSWmKpzDHi5J66+PbQ==
X-Received: by 2002:a17:907:c315:b0:a45:547a:49e1 with SMTP id tl21-20020a170907c31500b00a45547a49e1mr2460285ejc.3.1710232378975;
        Tue, 12 Mar 2024 01:32:58 -0700 (PDT)
Message-ID: <40dffd72-0362-42bc-b4c8-9a26804fed68@suse.com>
Date: Tue, 12 Mar 2024 09:32:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 10/16] x86/asm: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <1e44047e767431c32621ae44d3121bc2152b3cb5.1710145041.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <1e44047e767431c32621ae44d3121bc2152b3cb5.1710145041.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 09:59, Simone Ballarin wrote:
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -52,6 +52,14 @@
>          },
>          {
>              "id": "SAF-6-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.D4.10"
> +            },
> +            "name": "Dir 4.10: file intended for multiple inclusion",
> +            "text": "Files intended for multiple inclusion are not supposed to comply with D4.10."
> +        },

There's an overlap with SAF-3-safe as added by patch 01. What's the reason
separate entries are needed?

> --- a/xen/arch/x86/include/asm/compat.h
> +++ b/xen/arch/x86/include/asm/compat.h
> @@ -2,6 +2,9 @@
>   * compat.h
>   */
>  
> +#ifndef ASM_X86_COMPAT_H
> +#define ASM_X86_COMPAT_H
> +
>  #ifdef CONFIG_COMPAT
>  
>  #define COMPAT_BITS_PER_LONG 32
> @@ -18,3 +21,5 @@ int switch_compat(struct domain *);
>  #include <xen/errno.h>
>  static inline int switch_compat(struct domain *d) { return -EOPNOTSUPP; }
>  #endif
> +
> +#endif /* ASM_X86_COMPAT_H */

I'd be happy to ack this change; once again an indication that dissimilar
changes would better not be munged in a single patch. Such a patch, btw,
also shouldn't come with "x86/asm:" as a subject prefix - there's nothing
assembly-ish here; asm/ as a directory name is Linux heritage, without
that being a "component" in any way.

> --- a/xen/arch/x86/include/asm/cpufeatures.h
> +++ b/xen/arch/x86/include/asm/cpufeatures.h
> @@ -1,7 +1,4 @@
> -/*
> - * Explicitly intended for multiple inclusion.
> - */
> -
> +/* SAF-6-safe file intended for multiple inclusion */
>  #include <xen/lib/x86/cpuid-autogen.h>

With the blank line removed the comment, by convention of how these
comments are placed, applies to the #include directive, which is wrong.

> --- a/xen/arch/x86/include/asm/efibind.h
> +++ b/xen/arch/x86/include/asm/efibind.h
> @@ -1,2 +1,7 @@
> +#ifndef ASM_X86_EFIBIND_H
> +#define ASM_X86_EFIBIND_H
> +
>  #include <xen/types.h>
>  #include <asm/x86_64/efibind.h>
> +
> +#endif /* ASM_X86_EFIBIND_H */

This could go with the compat.h change above.

> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -104,10 +104,16 @@ $(obj)/compat/.xlat/%.lst: $(srcdir)/xlat.lst FORCE
>  xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(srcdir)/xlat.lst | uniq)
>  xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
>  
> +ARCHDIR = $(shell echo $(SRCARCH) | tr a-z A-Z)

Didn't the earlier patch introduce ARCHDIR already, just elsewhere? This
would better be done once in a central place then, maybe in
scripts/Kbuild.include.

>  quiet_cmd_xlat_h = GEN     $@
> -cmd_xlat_h = \
> -	cat $(filter %.h,$^) >$@.new; \
> +define cmd_xlat_h
> +	echo "#ifndef ASM_$(ARCHDIR)_COMPAT_XLAT_H" > $@.new; \
> +	echo "#define ASM_$(ARCHDIR)_COMPAT_XLAT_H" >> $@.new; \
> +	cat $(filter %.h,$^) >> $@.new; \
> +	echo "#endif /* ASM_$(ARCHDIR)_COMPAT_XLAT_H */" >> $@.new; \
>  	mv -f $@.new $@
> +endef

I'm unclear about the move from "=" to "define". Readability isn't really
helped, is it?

Jan

