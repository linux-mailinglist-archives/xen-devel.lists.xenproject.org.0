Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 498A888137A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 15:39:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695953.1086324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmx67-0003SU-SA; Wed, 20 Mar 2024 14:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695953.1086324; Wed, 20 Mar 2024 14:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmx67-0003Qf-P4; Wed, 20 Mar 2024 14:39:19 +0000
Received: by outflank-mailman (input) for mailman id 695953;
 Wed, 20 Mar 2024 14:39:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmx65-0003QZ-W0
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 14:39:18 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a075daf1-e6c7-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 15:39:16 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56bb8f3227aso519181a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 07:39:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 my10-20020a1709065a4a00b00a4663d3b2bfsm7354785ejc.217.2024.03.20.07.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 07:39:15 -0700 (PDT)
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
X-Inumbo-ID: a075daf1-e6c7-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710945555; x=1711550355; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EoKlxf9sOHi4JkbA9q5u0OspUWK75YnLeNcXbtSLkdk=;
        b=B1WPY6zsgh3NPQBGqcIiDtdUSBOMQVCrVJ17SyUA06YXnTgPdds8ZfeQDho/CcChiz
         6/3vlq0Pa0Y5OxyJmbgo1SSjZ+amPRMKG9wfg5Z4kwySO9ggAlbJQG3VzyQuT3g5NxWP
         Llr2qwsPwAz2U6+ip8kWYydZ29CUEkyRGi2IFfwb2ddliAt9PXsyFTHWcoEc7vDY+Ao7
         BTTznVgiKtI1q2fL8AAeSceFKAHaaLyRNfDp88/PynTtH1uwJzK/O3NdMg7pE6i2AYx0
         sX/KmMhpMVu/0EBi+So7VOHBz+4t7iDDISrMv2Tko6s467JjmnesX+GWSGQMekxmLNnz
         L1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710945555; x=1711550355;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EoKlxf9sOHi4JkbA9q5u0OspUWK75YnLeNcXbtSLkdk=;
        b=Io1RJx3q3OT4cIvcTln4Fe/Q3u/zS4ejU8sKZPlzO4uphvGU5Q+derezl39v5Cmbzi
         X/0H2tqcRCACyPbb/+bknbZnvYeN3XWjgZjZGf//kryKLyejLoCwtFf7vmwhCuhUaK7e
         XqiVvgO/d43+VJs3bcplQ8UDeeCWeInhxd9rwbqnmvmWQ0kabOLnFziJcTYpwRZov9FG
         5yfXEsHud3j1P8w5BhpmpL6Q2Ra5OTwSDS0RoSZtRxOe36jcpm8m+dXWqZvt1el7/+Dv
         rLa/zlzw+okIJnnlq1zmCHX23r9x5s/0t+TkzwPcQsTDvcC+6MI6rKpm8tGkYAyvk3U0
         3t9w==
X-Forwarded-Encrypted: i=1; AJvYcCWiFr9eUFuoi0CQLc+JleK+SOIPDEYaTByjF2PeCcwWoGnnUTGLFnqiyZO1SYo/ZL4zspDrCsN0HoRXxwVs2bKh9tLKBkR3IfUEku0707Q=
X-Gm-Message-State: AOJu0Yz4zyqpTQ6Kt6I+NInrVLDlderO9+1w6hHI3Gz5gKpUjV7n4il7
	+r8tvI9W3CVFfxOQrTn9rulo7+OKApZNlM2DoeDJLP1+gnwop6RXp/Mn/hVBdQ==
X-Google-Smtp-Source: AGHT+IHaYqyDYAqfMBJNZ1Qy/3bSNEUHdA5KsPW8/r+3QjV5TOS8PYPxdFexCPwOTUzwgBJaSC7UFg==
X-Received: by 2002:a17:906:1949:b0:a45:ff13:3626 with SMTP id b9-20020a170906194900b00a45ff133626mr9404711eje.25.1710945555577;
        Wed, 20 Mar 2024 07:39:15 -0700 (PDT)
Message-ID: <ad5ef9ee-d509-435d-943c-8d7005c823d2@suse.com>
Date: Wed, 20 Mar 2024 15:39:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240319205849.115884-1-jason.andryuk@amd.com>
 <20240319205849.115884-4-jason.andryuk@amd.com>
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
In-Reply-To: <20240319205849.115884-4-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2024 21:58, Jason Andryuk wrote:
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -537,6 +537,97 @@ static paddr_t __init find_memory(
>      return INVALID_PADDR;
>  }
>  
> +static bool __init check_load_address(
> +    const struct domain *d, const struct elf_binary *elf)
> +{
> +    paddr_t kernel_start = (paddr_t)elf->dest_base;

As before I think it is illegitimate to cast a pointer to paddr_t. The
variable type wants to remain such, but the cast wants to be to
unsigned long or uintptr_t (or else at least a comment wants adding).

> +    paddr_t kernel_end = kernel_start + elf->dest_size;
> +    unsigned int i;
> +
> +    /* Relies on a sorted memory map. */
> +    for ( i = 0; i < d->arch.nr_e820; i++ )
> +    {
> +        paddr_t start = d->arch.e820[i].addr;
> +        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;

Nit: Shorter if you use "start" here (also again in the other function).

> +        if ( start >= kernel_end )
> +            return false;
> +
> +        if ( d->arch.e820[i].type == E820_RAM  &&

Nit: Excess blank before &&.

> +             start <= kernel_start &&
> +             end >= kernel_end )
> +            return true;

As to the comment ahead of the function: This further relies on adjacent
entries of the same type having got merged.

> +    }
> +
> +    return false;
> +}
> +
> +/* Find an e820 RAM region that fits the kernel at a suitable alignment. */
> +static paddr_t __init find_kernel_memory(
> +    const struct domain *d, struct elf_binary *elf,
> +    const struct elf_dom_parms *parms)
> +{
> +    paddr_t kernel_size = elf->dest_size;
> +    unsigned int i;
> +
> +    for ( i = 0; i < d->arch.nr_e820; i++ )
> +    {
> +        paddr_t start = d->arch.e820[i].addr;
> +        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
> +        paddr_t kstart, kend;
> +
> +        if ( d->arch.e820[i].type != E820_RAM ||
> +             d->arch.e820[i].size < kernel_size )
> +            continue;
> +
> +        kstart = ROUNDUP(start, parms->phys_align);
> +        kstart = max_t(paddr_t, kstart, parms->phys_min);

I'd generally try to avoid max_t(), but I cannot think of any good way
of expressing this without using it.

> +        kend = kstart + kernel_size;
> +
> +        if ( kend > parms->phys_max )

So despite its default phys_max is exclusive aiui. Otherwise with
kend being exclusive too, this would look to be off by one.

> +            return 0;
> +
> +        if ( kend <= end )
> +            return kstart;
> +    }
> +
> +    return 0;
> +}
> +
> +/* Check the kernel load address, and adjust if necessary and possible. */
> +static bool __init check_and_adjust_load_address(
> +    const struct domain *d, struct elf_binary *elf, struct elf_dom_parms *parms)
> +{
> +    paddr_t reloc_base;
> +
> +    if ( check_load_address(d, elf) )
> +        return true;
> +
> +    if ( !parms->phys_reloc )
> +    {
> +        printk("%pd kernel: Address conflict and not relocatable\n", d);
> +        return false;

This better wouldn't result in -ENOMEM in the caller. Then again reasons
are logged, so the specific error code perhaos doesn't matter that much.

> +    }
> +
> +    reloc_base = find_kernel_memory(d, elf, parms);
> +    if ( reloc_base == 0 )

With ! used above please be consistent and do so here, too.

> +    {
> +        printk("%pd kernel: Failed find a load address\n", d);
> +        return false;
> +    }
> +
> +    if ( opt_dom0_verbose )
> +        printk("%pd kernel: Moving [%p, %p] -> [%"PRIpaddr", %"PRIpaddr"]\n", d,
> +               elf->dest_base, elf->dest_base + elf->dest_size - 1,
> +               reloc_base, reloc_base + elf->dest_size - 1);
> +
> +    parms->phys_entry = reloc_base +
> +                            (parms->phys_entry - (paddr_t)elf->dest_base);
> +    elf->dest_base = (char *)reloc_base;

Just as a remark, no request to change anything: We're not dealing with
strings here. Hence char * isn't quite right, just that "dest_base" is
of that type (for whatever reason).

> @@ -161,6 +164,10 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>      {
>          elf_msg(elf, "ELF: note: %s\n", note_desc[type].name);
>      }
> +    else if ( note_desc[type].type == ELFNOTE_CUSTOM )
> +    {
> +        elf_msg(elf, "ELF: note: %s", note_desc[type].name);
> +    }

This could do with a brief comment, to make clear the \n isn't accidentally
missing here.

> @@ -225,6 +232,28 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>      case XEN_ELFNOTE_PHYS32_ENTRY:
>          parms->phys_entry = val;
>          break;
> +
> +    case XEN_ELFNOTE_PHYS32_RELOC:
> +        parms->phys_reloc = true;
> +
> +        if ( descsz >= 4 )
> +        {
> +            parms->phys_max = elf_note_numeric_array(elf, note, 4, 0);
> +            elf_msg(elf, " = max: %#"PRIx32, parms->phys_max);
> +        }
> +        if ( descsz >= 8 )
> +        {
> +            parms->phys_min = elf_note_numeric_array(elf, note, 4, 1);
> +            elf_msg(elf, " min: %#"PRIx32, parms->phys_min);
> +        }
> +        if ( descsz >= 12 )
> +        {
> +            parms->phys_align = elf_note_numeric_array(elf, note, 4, 2);
> +            elf_msg(elf, " align: %#"PRIx32, parms->phys_align);
> +        }
> +
> +        elf_msg(elf, "\n");

Imo the newline wants adding outside of the switch(), for everything
set to ELFNOTE_CUSTOM. In fact with that I think ELFNOTE_CUSTOM and
ELFNOTE_NAME could be folded (with what's NAME right now simply
printing nothing in the switch here). Which suggests that I may
better not commit the (slightly adjusted) earlier patch, yet.

> @@ -536,6 +565,10 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
>      parms->p2m_base = UNSET_ADDR;
>      parms->elf_paddr_offset = UNSET_ADDR;
>      parms->phys_entry = UNSET_ADDR32;
> +    parms->phys_min = 0;
> +    parms->phys_max = 0xffffffff;
> +    parms->phys_align = 0x200000;

I think this wants to be MB(2) (requiring a pre-patch to centralize MB()
in the tool stack to tools/include/xen-tools/common-macros.h). And I
further think this needs to be an arch-specific constant, even if right
now the note is expected to be present only for x86. Which then also
needs saying ...

> --- a/xen/include/public/elfnote.h
> +++ b/xen/include/public/elfnote.h
> @@ -194,10 +194,26 @@
>   */
>  #define XEN_ELFNOTE_PHYS32_ENTRY 18
>  
> +/*
> + * Physical loading constraints for PVH kernels
> + *
> + * Used to place constraints on the guest physical loading addresses and
> + * alignment for a PVH kernel.
> + *
> + * The presence of this note indicates the kernel supports relocating itself.
> + *
> + * The note may include up to three 32bit values in the following order:
> + *  - a maximum address for the entire image to be loaded below (default
> + *      0xffffffff)
> + *  - a minimum address for the start of the image (default 0)
> + *  - a required start alignment (default 0x200000)
> + */
> +#define XEN_ELFNOTE_PHYS32_RELOC 19

... in the comment here. The reasoning behind not (intermediately) falling
back to the alignment in the ELF headers also wants adding to the patch
description (or a code comment, albeit there's no really good place to put
it, imo).

Additionally I think the pieces of the comment want re-ordering. The primary
purpose is indicating relocatability; when not relocating, the constraints
aren't applied in any way.

Jan

