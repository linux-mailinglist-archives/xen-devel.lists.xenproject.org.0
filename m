Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F79089B938
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 09:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701783.1096279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtjmB-0007zT-EY; Mon, 08 Apr 2024 07:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701783.1096279; Mon, 08 Apr 2024 07:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtjmB-0007xv-Bp; Mon, 08 Apr 2024 07:50:47 +0000
Received: by outflank-mailman (input) for mailman id 701783;
 Mon, 08 Apr 2024 07:50:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtjm9-0007xp-UD
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 07:50:45 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b44f21af-f57c-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 09:50:44 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41551639550so28826805e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 00:50:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c35d300b004163345d2b4sm9500418wmq.36.2024.04.08.00.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 00:50:43 -0700 (PDT)
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
X-Inumbo-ID: b44f21af-f57c-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712562644; x=1713167444; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l6lFDHxYYkesm3ngbzVnGoO1XXgWZXAbqTWegLuXYd4=;
        b=RQCHvl/GWgoCcE6DDBBdXm5NDSKWcirTeVsLjQV7FrG493YqSfHeu44yEI0ULGl/8e
         y6Rup9mjzydUYcWJbLUmRpESWFY4IApaR2QPY8xE1qXEAsfc+RY8EYj18MFfoFQnD5WI
         6QrZPRu5WInwOq6SJ6eAFC/yfojv8cIS+araX9SgWaZ0fLWn2sPF9v+Er3rxoA48gpFS
         TCJEQVRZf3G+M9r0eZywCV+b69tAUcVj4HubYZunrsqntKYFFLKemOmD/SN1dSIxRqaS
         AsUdOhNYEyIwhtfQeF5ndzpRkfpFocyRxLWkoh9Nx1HwarLtpg5Bt4jpOXcma1bofaqL
         uWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712562644; x=1713167444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l6lFDHxYYkesm3ngbzVnGoO1XXgWZXAbqTWegLuXYd4=;
        b=a9MApxeK99mOQMLJc3pD5dKqTP8esIIwFs11JYZuWSNvVIhE4ljoSoBh2pejwurKkv
         gM1rWavGXwD8VWaQtjGh0ycqpWg3gS+zu5evFWvVkSyGjHKspHKUHcS2+TAPDfF3tF3F
         lbR5pn5LUJPBUBUzzILNe4mIcDJ3MZ60TXFoAkS8MxLczQXxdMZsoyIq1VARVLk2pdnL
         MY/xwfBcn3Uej1IzaeqQtBSKKnIldwiwawQs7YvvMuTTO2QjBN9C5PfrV9nipo0GW68Y
         aAIIOv4jtmHK9vvXvRtgbYPD/rcds3upPq968EG3nVFw8fd4BDwgBYRu7KHgzlclLN5K
         0OoA==
X-Forwarded-Encrypted: i=1; AJvYcCX6GDVWBqItObcbYSXjrDlDAD3EgiU9xsjcBbDHFYOOnMmJ3tasvIWflz4zEo2YBJz/aJ1lVnIw7GAkGG54pEAG3KDyGwJh0EJ1DHicciA=
X-Gm-Message-State: AOJu0YzefNhXqE5uTfPFYok/Y5pohuhzVbkcr+xZIPfz6s9auTiuX5uV
	sdPcyp1MsaMOBmqJYTmQUUzMkVeNaQwvOkTjryQ09UxXchAGnChvOrqRB0VOcw==
X-Google-Smtp-Source: AGHT+IF9gZ0YiSem5b7FjtP69EGN12SeeX40O7H5yqqbZT9qMDFGeYM+x02KikTHONfrFJjJZeRQHQ==
X-Received: by 2002:a05:600c:470d:b0:416:6b95:fc89 with SMTP id v13-20020a05600c470d00b004166b95fc89mr1858677wmo.1.1712562643963;
        Mon, 08 Apr 2024 00:50:43 -0700 (PDT)
Message-ID: <48caee9c-ef6d-4109-a6aa-f18d57cefb81@suse.com>
Date: Mon, 8 Apr 2024 09:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 4/9] x86/efi: tidy switch statement and address
 MISRA violation
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <acbf40ba94a5ef7a8a429498765932b801e42a0a.1712305581.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <acbf40ba94a5ef7a8a429498765932b801e42a0a.1712305581.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 11:14, Nicola Vetrini wrote:
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -169,20 +169,22 @@ static void __init efi_arch_process_memory_map(EFI_SYSTEM_TABLE *SystemTable,
>  
>          switch ( desc->Type )
>          {
> +        default:
> +            type = E820_RESERVED;
> +            break;

This one I guess is tolerable duplication-wise, and I might guess others would
even have preferred it like that from the beginning. A blank line below here
would be nice, though (and at some point ahead of and between the two ACPI-
related case labels blank lines would want adding, too).

However, ...

>          case EfiBootServicesCode:
>          case EfiBootServicesData:
>              if ( map_bs )
>              {
> -        default:
>                  type = E820_RESERVED;
>                  break;
>              }
> -            /* fall through */
> +            fallthrough;
>          case EfiConventionalMemory:
>              if ( !trampoline_phys && desc->PhysicalStart + len <= 0x100000 &&
>                   len >= cfg.size && desc->PhysicalStart + len > cfg.addr )
>                  cfg.addr = (desc->PhysicalStart + len - cfg.size) & PAGE_MASK;
> -            /* fall through */
> +            fallthrough;
>          case EfiLoaderCode:
>          case EfiLoaderData:
>              if ( desc->Attribute & EFI_MEMORY_RUNTIME )

... below here there is

            else
        case EfiUnusableMemory:
                type = E820_UNUSABLE;
            break;

I understand there are no figure braces here, and hence be the letter this
isn't an issue with the Misra rule. But (a) some (e.g. Andrew, I guess)
would likely argue for there wanting to be braces and (b) we don't want to
be leaving this as is, when the spirit of the rule still suggests it should
be done differently.

Jan

