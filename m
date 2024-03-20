Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D97168812CE
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 15:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695930.1086263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwUm-0002xy-PK; Wed, 20 Mar 2024 14:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695930.1086263; Wed, 20 Mar 2024 14:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwUm-0002vc-MV; Wed, 20 Mar 2024 14:00:44 +0000
Received: by outflank-mailman (input) for mailman id 695930;
 Wed, 20 Mar 2024 14:00:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmwUl-0002vW-0m
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 14:00:43 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c83ffb9-e6c2-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 15:00:40 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5684db9147dso8720267a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 07:00:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l24-20020aa7cad8000000b005697d77570dsm3546299edt.66.2024.03.20.07.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 07:00:40 -0700 (PDT)
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
X-Inumbo-ID: 3c83ffb9-e6c2-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710943240; x=1711548040; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7WfiZPg0fiMsbRlSXl6V4uqaiczIERho6c3psa+Xwvk=;
        b=bsdQryda8KsbgAX9XBERwLVb7p2tB/syBwEPW7r07GiqXXOWLELTAjQRAarbnALCRY
         k84U4XAOcGDm9PLdKP4zl4C9/DIKBAg/c1OsSds9XLEefKLti3PpKQo3sf1dojBIvD77
         +44JViGSYIZzaAUP1vr1WFCZb9wSGmtZjiws5argxhH62Fagnu+iqlAUFrNjM3aAdU8B
         hY37s/kqyTUk0FzPwiHoBCmf02FJq4N6gVP54xYnboFwpDR/AJTb7ABz8w05rEZ12YSP
         4Vn6n7dv3nSxV1pIw2X9TilHHEszB0Y7zEhM8eKuGbl9w3fxY+nV0WOdDyqghMh8oCYo
         ePcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710943240; x=1711548040;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7WfiZPg0fiMsbRlSXl6V4uqaiczIERho6c3psa+Xwvk=;
        b=hnp/ZRo9Yfpb+71iEEmvXTx7AD3hbS1N2EI6CRQKxnVjLHdm4wO7dUIDlhd6QxKtwO
         a6t8txjmGPmmf+AvXxj3w8DpZjTuF1TUpoiXUlyJSBP1veXq09uTTtzgLJOyEPkGkJBb
         YMWOXZMd0G9mYLp6zNOgZxfDgARrCZu5L7j/x0+9D4Bmh6jrPuHpGsfJAHXkU1qSQ3xM
         GGxBlJ9I1exNxhJaVAqFcJBaFDLGGnAnGcd3disJHWW5HnDQRGHCdVpUoU+B0dyrMibB
         jYr5bIt3ROSR5UnY+UtaZGjg9S7gxR+HCZ0epBejqYehqhZVO7+c+/ZatRxSsdn1dW/S
         IgHA==
X-Forwarded-Encrypted: i=1; AJvYcCUx3GIP7kLoCsuOFCwAy3rWS7+KvZSzfvKExM3ygR/5RNN2NpIp9fxTCXNATztR9svtsHxugz/aGOf+y8xXkJLlXZdfVkSDHBJvOyfzZoY=
X-Gm-Message-State: AOJu0YznQK+ftFXkoxOco+TeD+/MOm3rJ0s3kIXHzumRmf2g6hGj4q10
	DLrbtGoIhwYG4vIBQlXSlHqlOB+ZH7QaDtCucEZSqNFKZs7GPhfrUy4m4rMgWA==
X-Google-Smtp-Source: AGHT+IE5BbuaofE+vNMhzJlaLRkaRxbjmAL9+iQGAbLAhngBCrZ5fpK140/Y/0brJPrDOgqL51yhWg==
X-Received: by 2002:a05:6402:c50:b0:568:7c01:a4a2 with SMTP id cs16-20020a0564020c5000b005687c01a4a2mr14069314edb.13.1710943240321;
        Wed, 20 Mar 2024 07:00:40 -0700 (PDT)
Message-ID: <7f3a075c-1e0e-4a3c-a1f6-08d057914d9f@suse.com>
Date: Wed, 20 Mar 2024 15:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] libelf: Expand ELF note printing
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240319205849.115884-1-jason.andryuk@amd.com>
 <20240319205849.115884-3-jason.andryuk@amd.com>
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
In-Reply-To: <20240319205849.115884-3-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2024 21:58, Jason Andryuk wrote:
> --- a/xen/common/libelf/libelf-dominfo.c
> +++ b/xen/common/libelf/libelf-dominfo.c
> @@ -101,26 +101,30 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>  /* *INDENT-OFF* */
>      static const struct {
>          const char *name;
> -        bool str;
> +        enum {
> +            ELFNOTE_INT,
> +            ELFNOTE_STRING,
> +            ELFNOTE_NAME,

This last on could do with a comment, as there are two possible (but
distinct) purposes: Notes where the mere presence matters vs ones where
printing of the value(s) would simply be cumbersome.

> +        } type;
>      } note_desc[] = {
> -        [XEN_ELFNOTE_ENTRY] = { "ENTRY", 0},
> -        [XEN_ELFNOTE_HYPERCALL_PAGE] = { "HYPERCALL_PAGE", 0},
> -        [XEN_ELFNOTE_VIRT_BASE] = { "VIRT_BASE", 0},
> -        [XEN_ELFNOTE_INIT_P2M] = { "INIT_P2M", 0},
> -        [XEN_ELFNOTE_PADDR_OFFSET] = { "PADDR_OFFSET", 0},
> -        [XEN_ELFNOTE_HV_START_LOW] = { "HV_START_LOW", 0},
> -        [XEN_ELFNOTE_XEN_VERSION] = { "XEN_VERSION", 1},
> -        [XEN_ELFNOTE_GUEST_OS] = { "GUEST_OS", 1},
> -        [XEN_ELFNOTE_GUEST_VERSION] = { "GUEST_VERSION", 1},
> -        [XEN_ELFNOTE_LOADER] = { "LOADER", 1},
> -        [XEN_ELFNOTE_PAE_MODE] = { "PAE_MODE", 1},
> -        [XEN_ELFNOTE_FEATURES] = { "FEATURES", 1},
> -        [XEN_ELFNOTE_SUPPORTED_FEATURES] = { "SUPPORTED_FEATURES", 0},
> -        [XEN_ELFNOTE_BSD_SYMTAB] = { "BSD_SYMTAB", 1},
> -        [XEN_ELFNOTE_L1_MFN_VALID] = { "L1_MFN_VALID", false },
> -        [XEN_ELFNOTE_SUSPEND_CANCEL] = { "SUSPEND_CANCEL", 0 },
> -        [XEN_ELFNOTE_MOD_START_PFN] = { "MOD_START_PFN", 0 },
> -        [XEN_ELFNOTE_PHYS32_ENTRY] = { "PHYS32_ENTRY", 0 },
> +        [XEN_ELFNOTE_ENTRY] = { "ENTRY", ELFNOTE_INT },
> +        [XEN_ELFNOTE_HYPERCALL_PAGE] = { "HYPERCALL_PAGE", ELFNOTE_INT },
> +        [XEN_ELFNOTE_VIRT_BASE] = { "VIRT_BASE", ELFNOTE_INT },
> +        [XEN_ELFNOTE_INIT_P2M] = { "INIT_P2M", ELFNOTE_INT },
> +        [XEN_ELFNOTE_PADDR_OFFSET] = { "PADDR_OFFSET", ELFNOTE_INT },
> +        [XEN_ELFNOTE_HV_START_LOW] = { "HV_START_LOW", ELFNOTE_INT },
> +        [XEN_ELFNOTE_XEN_VERSION] = { "XEN_VERSION", ELFNOTE_STRING },
> +        [XEN_ELFNOTE_GUEST_OS] = { "GUEST_OS", ELFNOTE_STRING },
> +        [XEN_ELFNOTE_GUEST_VERSION] = { "GUEST_VERSION", ELFNOTE_STRING },
> +        [XEN_ELFNOTE_LOADER] = { "LOADER", ELFNOTE_STRING },
> +        [XEN_ELFNOTE_PAE_MODE] = { "PAE_MODE", ELFNOTE_STRING },
> +        [XEN_ELFNOTE_FEATURES] = { "FEATURES", ELFNOTE_STRING },
> +        [XEN_ELFNOTE_SUPPORTED_FEATURES] = { "SUPPORTED_FEATURES", ELFNOTE_INT },
> +        [XEN_ELFNOTE_BSD_SYMTAB] = { "BSD_SYMTAB", ELFNOTE_STRING },
> +        [XEN_ELFNOTE_L1_MFN_VALID] = { "L1_MFN_VALID", ELFNOTE_NAME },
> +        [XEN_ELFNOTE_SUSPEND_CANCEL] = { "SUSPEND_CANCEL", ELFNOTE_INT },
> +        [XEN_ELFNOTE_MOD_START_PFN] = { "MOD_START_PFN", ELFNOTE_INT },
> +        [XEN_ELFNOTE_PHYS32_ENTRY] = { "PHYS32_ENTRY", ELFNOTE_INT },
>      };
>  /* *INDENT-ON* */
>  
> @@ -136,7 +140,7 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>          return 0;
>      }
>  
> -    if ( note_desc[type].str )
> +    if ( note_desc[type].type == ELFNOTE_STRING )
>      {
>          str = elf_strval(elf, elf_note_desc(elf, note));
>          if (str == NULL)
> @@ -146,13 +150,17 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>          parms->elf_notes[type].type = XEN_ENT_STR;
>          parms->elf_notes[type].data.str = str;
>      }
> -    else
> +    else if ( note_desc[type].type == ELFNOTE_INT )
>      {
>          val = elf_note_numeric(elf, note);
>          elf_msg(elf, "ELF: note: %s = %#" PRIx64 "\n", note_desc[type].name, val);
>          parms->elf_notes[type].type = XEN_ENT_LONG;
>          parms->elf_notes[type].data.num = val;
>      }
> +    else if ( note_desc[type].type == ELFNOTE_NAME )
> +    {
> +        elf_msg(elf, "ELF: note: %s\n", note_desc[type].name);
> +    }

Imo this would better be expressed as (default-less) switch() now. That
would also save me from commenting on the excess braces in the last
"else if". I guess I wouldn't mind making both adjustments while
committing, so long as you agree. With them in place
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

