Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821099C6CB6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 11:20:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835277.1251131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBATv-0006Tf-Bs; Wed, 13 Nov 2024 10:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835277.1251131; Wed, 13 Nov 2024 10:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBATv-0006Qt-7q; Wed, 13 Nov 2024 10:20:15 +0000
Received: by outflank-mailman (input) for mailman id 835277;
 Wed, 13 Nov 2024 10:20:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBATt-00051q-Cx
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 10:20:13 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc4be819-a1a8-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 11:20:09 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43193678216so63916155e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 02:20:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d54f7105sm19238865e9.13.2024.11.13.02.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 02:20:08 -0800 (PST)
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
X-Inumbo-ID: dc4be819-a1a8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmEiLCJoZWxvIjoibWFpbC13bTEteDMyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRjNGJlODE5LWExYTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDkzMjA5LjYzMjA0Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731493209; x=1732098009; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TD5npga+YVniGyfpUiI0Tvj73sA8fJ+KJi16pH5mACE=;
        b=OxwjG/4hakHBs+dpyj8dklvZMpkB/2Hiih3Yy0jVKhJdjLRYG0gzsdbp5TgKnTcgpR
         iDmhNWvf+v7fDognixYCpuq4G6t+qJosVlQV56sRRCR8l2eFyAhbwEd4vaNSHDugElQH
         6L24RXdd/alMRvNmPyPryI0DB2xAsvSHhs1v9aALugWlskZfQzU7D1dofsc4viA+Q2l8
         lPVxh0xQ/DswW6Bt8csqhcHkgha8ELXcpJJHoV7NmoDfxN6MsG5/a1xBeD8fX5Igk1z7
         2B2h7c3qGz95K/QuNuI2JFSTKBLro3KfldhFqk8SXw6s84ey8DNitbbYFwToVkZhG/tU
         kdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731493209; x=1732098009;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TD5npga+YVniGyfpUiI0Tvj73sA8fJ+KJi16pH5mACE=;
        b=uBzgqb4JyBGLbSGpPOb2pLtGJ8PAPgVYWZHqCOTF3f14DljVKFTv8VyQvNNeZzhs8s
         XZMFM4YgitnuTzqnXbpetCdKmJOTdqXPSX9yP6YOtycd9ezHVA4mV9XFGgfgMpg0sIg+
         vmzPm7DW008AjYAedzkbG2U8pR5h5xtoXddgmBpWGvXV2Bgn9vKKznLFA7hxxkdOJdop
         xw/vps0gTpyqPjyi4lh7wtmuGCdUXMiUokBw3qac3logbw17MQcjPh0eKOM6bvPSwqUv
         RktVDjY3HOpWD9xNaCA6Bem7eSSzTaGpOijADDNBbAaXunaOgNwMCL/o0ApjdCmujNtA
         E0sA==
X-Forwarded-Encrypted: i=1; AJvYcCWJAdG2g7vPbRJShPeqLm8/oxzXpwbgvvBxYd3dX4FBtyoWb3Xd4WAp0uBMZyeuChELiTvDIzbq1ZI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuucE+bGIQeXK9FcdrqW5XInOSVnl1XbUvsshrKeviValt0hUU
	7YBIaVCcSkZa21U/nEHI5XI/ZWB9XrNMpJml/fdA7AaAvETLnR6AvD8KgYvJOw==
X-Google-Smtp-Source: AGHT+IEd7Nu3wG+gEyNktKpQRY/QD/DJFQRsQkF/hWieQJL0eX2d0XaWXx7dD4xg+90VtKU6NlNv5A==
X-Received: by 2002:a05:600c:3b9e:b0:431:3927:d1bc with SMTP id 5b1f17b1804b1-432b74fcb02mr171490155e9.2.1731493209023;
        Wed, 13 Nov 2024 02:20:09 -0800 (PST)
Message-ID: <5f58dda2-1619-4416-b711-c600367d6f47@suse.com>
Date: Wed, 13 Nov 2024 11:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/trampoline: Document how the trampoline is laid
 out
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241113093058.1562447-1-andrew.cooper3@citrix.com>
 <20241113093058.1562447-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241113093058.1562447-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.11.2024 10:30, Andrew Cooper wrote:
> This is, to the best of my knowledge, accurate.  I am providing no comment on
> how sane I believe it to be.
> 
> At the time of writing, the sizes of the regions are:
> 
>           offset  size
>   AP:     0x0000  0x00b0
>   S3:     0x00b0  0x0140
>   Boot:   0x01f0  0x1780
>   Heap:   0x1970  0xe690
>   Stack:  0xf000  0x1000
> 
> and wakeup_stack overlays boot_edd_info.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  xen/arch/x86/include/asm/trampoline.h | 55 ++++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include/asm/trampoline.h
> index 8c1e0b48c2c9..d801bea400dc 100644
> --- a/xen/arch/x86/include/asm/trampoline.h
> +++ b/xen/arch/x86/include/asm/trampoline.h
> @@ -37,12 +37,63 @@
>   * manually as part of placement.
>   */
>  
> +/*
> + * Layout of the trampoline.  Logical areas, in ascending order:
> + *
> + * 1) AP boot:
> + *
> + *    The INIT-SIPI-SIPI entrypoint.  This logic is stack-less so the identity
> + *    mapping (which must be executable) can at least be Read Only.
> + *
> + * 2) S3 resume:
> + *
> + *    The S3 wakeup logic may need to interact with the BIOS, so needs a
> + *    stack.  The stack pointer is set to trampoline_phys + 4k and clobbers an
> + *    undefined part of the the boot trampoline.  The stack is only used with
> + *    paging disabled.
> + *
> + * 3) Boot trampoline:
> + *
> + *    This region houses various data used by the AP/S3 paths too.

This is confusing to have here - isn't the boot part (that isn't in the
same page as the tail of the AP/S3 region) being boot-time only, and hence
unavailable for S3 and post-boot AP bringup? Both here and with the numbers
in the description - what position did you use as separator between 2) and
3)?

Then again it may be just me who is confused: Didn't we, at some point, limit
the resident trampoline to just one page? Was that only a plan, or a patch
that never was committed?

>  The boot
> + *    trampoline collects data from the BIOS (E820/EDD/EDID/etc), so needs a
> + *    stack.  The stack pointer is set to trampoline_phys + 64k and has 4k
> + *    space reserved.
> + *
> + * 4) Heap space:
> + *
> + *    The first 1k of heap space is statically allocated for VESA information.
> + *
> + *    The remainder of the heap is used by reloc(), logic which is otherwise
> + *    outside of the trampoline, to collect the bootloader metadata (cmdline,
> + *    module list, etc).  It does so with a bump allocator starting from the
> + *    end of the heap and allocating backwards.
> + *
> + * 5) Boot stack:
> + *
> + *    4k of space is reserved for the boot stack, at trampoline_phys + 64k.

Perhaps add "ending" to clarify it doesn't go beyond +64k? It's being expressed
...

> + * Therefore, when placed, it looks somewhat like this:
> + *
> + *    +--- trampoline_phys
> + *    v
> + *    |<-------------------------------64K------------------------------->|
> + *    |<-----4K----->|                                         |<---4K--->|
> + *    +----+----+----+-+---------------------------------------+----------+
> + *    | AP | S3 | Boot | Heap                                  |    Stack |
> + *    +----+----+------+---------------------------------------+----------+
> + *    ^           <~~^ ^                                    <~~^       <~~^
> + *    |              | +- trampoline_end[]                     |          |
> + *    |              +--- S3 Stack          reloc() allocator -+          |
> + *    +------------------ trampoline_start[]       Boot Stack ------------+
> + */

... by this scheme, but could still do with being made explicit, just to avoid
ambiguity or suspicion of things have gone stale again.

Jan

