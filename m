Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F5287BAB0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 10:49:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693084.1080825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkhhq-0005bk-0r; Thu, 14 Mar 2024 09:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693084.1080825; Thu, 14 Mar 2024 09:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkhhp-0005ZN-UP; Thu, 14 Mar 2024 09:48:57 +0000
Received: by outflank-mailman (input) for mailman id 693084;
 Thu, 14 Mar 2024 09:48:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P774=KU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rkhho-0005ZH-OI
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 09:48:56 +0000
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [2607:f8b0:4864:20::834])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 123a64e9-e1e8-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 10:48:55 +0100 (CET)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-430a65e973bso262661cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 02:48:55 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 o23-20020ac872d7000000b00430a67b3437sm34478qtp.17.2024.03.14.02.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 02:48:54 -0700 (PDT)
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
X-Inumbo-ID: 123a64e9-e1e8-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710409734; x=1711014534; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xxDAwbG8nOc3eyKo8MEb496Icb3PY8Fs08zpqF7laFI=;
        b=lfoNlz46eQA94+hRzQVXQTferfiGnGmwnMI+Fw/ncvkMi1OVZviLl39UTtvjpX0Ooa
         E6SY2zNu+6rnBzxbj/nLMPxCWbh8CjOi2dAfA5F7J6k323q1D1kUI2ytfOh8RO/gVeYY
         B01E2fyVna4N4aE5bRue+hx65w0B4Cu8FaJhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710409734; x=1711014534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxDAwbG8nOc3eyKo8MEb496Icb3PY8Fs08zpqF7laFI=;
        b=uoNOdPx1UQwwGbAVGMZG7MOIYmERHG1cMMqieL+4663L8X3plkx/mfWcaSHq94yNSy
         aw7C6YwNU5+nXB4Xa++CMa8kryytWAIiUDa65eDzMXdPpsGMDamRWCsm9BG5oSP+TUkG
         qXRXJPiFb1FILKbuRaHUld5YMux6IbR9rCVfygvl7E7IyadNMSQnFbctBr6pQY/Kvkob
         a8Gwivz7a6TowG3jtBKrCaiPIX8eHYG0sJmigKdFy+L2XNbphSNTjx+5qRb+60EZGcIE
         pNqG3nQN+niNl+JXATX5/HQ7GVyMiHWzvpKGe/KPQUN5mtw5AWucepL/dEbMP/eD1gYS
         N2tA==
X-Gm-Message-State: AOJu0YxczbvC1S1yfXGeUSPGBzUWQQ+12xJRlZMjaUB//vNLOBmPosFV
	t8t2lNu61wYq8IoW/ELjl2zGg/VByi9XeX5aHNzhCGDAjZ6XwSoTVhsDVvA+XYY=
X-Google-Smtp-Source: AGHT+IHYbyVum+dbjN89JJGy65DnYrTUioGEYAbQox9ZBiOGX1K+vilFfRFDKBHSLsNi/pJlen+gAQ==
X-Received: by 2002:ac8:7dc2:0:b0:42e:cf0d:c9e7 with SMTP id c2-20020ac87dc2000000b0042ecf0dc9e7mr1405129qte.44.1710409734329;
        Thu, 14 Mar 2024 02:48:54 -0700 (PDT)
Date: Thu, 14 Mar 2024 10:48:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Message-ID: <ZfLIBHTbcbGqFAhY@macbook>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313193021.241764-4-jason.andryuk@amd.com>

On Wed, Mar 13, 2024 at 03:30:21PM -0400, Jason Andryuk wrote:
> Xen tries to load a PVH dom0 kernel at the fixed guest physical address
> from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
> it can be configured.
> 
> Unfortunately there exist firmwares that have reserved regions at this
> address, so Xen fails to load the dom0 kernel since it's not RAM.
> 
> The PVH entry code is not relocatable - it loads from absolute
> addresses, which fail when the kernel is loaded at a different address.
> With a suitably modified kernel, a reloctable entry point is possible.
> 
> Add XEN_ELFNOTE_PVH_RELOCATION which specifies the minimum, maximum and
> alignment needed for the kernel.  The presence of the NOTE indicates the
> kernel supports a relocatable entry path.
> 
> Change the loading to check for an acceptable load address.  If the
> kernel is relocatable, support finding an alternate load address.
> 
> Link: https://gitlab.com/xen-project/xen/-/issues/180
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> ELF Note printing looks like:
> (XEN) ELF: note: PVH_RELOCATION = min: 0x1000000 max: 0xffffffff align: 0x200000
> 
> v2:
> Use elfnote for min, max & align - use 64bit values.
> Print original and relocated memory addresses
> Use check_and_adjust_load_address() name
> Return relocated base instead of offset
> Use PAGE_ALIGN
> Don't load above max_phys (expected to be 4GB in kernel elf note)
> Use single line comments
> Exit check_load_address loop earlier
> Add __init to find_kernel_memory()
> ---
>  xen/arch/x86/hvm/dom0_build.c      | 108 +++++++++++++++++++++++++++++
>  xen/common/libelf/libelf-dominfo.c |  13 ++++
>  xen/include/public/elfnote.h       |  11 +++
>  xen/include/xen/libelf.h           |   3 +
>  4 files changed, 135 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 0ceda4140b..5c6c0d2db3 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -537,6 +537,108 @@ static paddr_t __init find_memory(
>      return INVALID_PADDR;
>  }
>  
> +static bool __init check_load_address(
> +    const struct domain *d, const struct elf_binary *elf)
> +{
> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;

Are you sure this is correct?  If a program header specifies a non-4K
aligned load address we should still try to honor it.  I think this is
very unlikely, but still we shouldn't apply non-requested alignments
to addresses coming from the ELF headers.

> +    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
> +    unsigned int i;
> +
> +    /*
> +     * The memory map is sorted and all RAM regions starts and sizes are
> +     * aligned to page boundaries.

Relying on sizes to be page aligned seems fragile: it might work now
because of the order in which pvh_setup_vmx_realmode_helpers() first
reserves memory for the TSS and afterwards for the identity page
tables, but it's not a property this code should assume.

> +     */
> +    for ( i = 0; i < d->arch.nr_e820; i++ )
> +    {
> +        paddr_t start = d->arch.e820[i].addr;
> +        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
> +
> +        if ( start >= kernel_end )
> +            return false;
> +
> +        if ( start <= kernel_start &&
> +             end >= kernel_end &&
> +             d->arch.e820[i].type == E820_RAM )

Nit: I would maybe do the type check before the boundary ones, as it's
pointless to do boundary checking on a region of a non-RAM type.  But
I guess you could also see it the other way around.

> +            return true;
> +    }
> +
> +    return false;
> +}
> +
> +/* Find an e820 RAM region that fits the kernel at a suitable alignment. */
> +static paddr_t __init find_kernel_memory(
> +    const struct domain *d, struct elf_binary *elf,

const for elf also.

> +    const struct elf_dom_parms *parms)
> +{
> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
> +    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
> +    paddr_t kernel_size = kernel_end - kernel_start;

Hm, I'm again unsure about the alignments applied here.

I think if anything we want to assert that dest_base is aligned to phys_align.

> +    unsigned int i;
> +
> +    /*
> +     * The memory map is sorted and all RAM regions starts and sizes are
> +     * aligned to page boundaries.
> +     */
> +    for ( i = 0; i < d->arch.nr_e820; i++ )
> +    {
> +        paddr_t start = d->arch.e820[i].addr;
> +        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
> +        paddr_t kstart, kend;
> +
> +        if ( d->arch.e820[i].type != E820_RAM )
> +            continue;
> +
> +        if ( d->arch.e820[i].size < kernel_size )
> +            continue;

You can unify both checks in a single condition.

> +
> +        kstart = ROUNDUP(start, parms->phys_align);
> +        kstart = kstart < parms->phys_min ? parms->phys_min : kstart;
> +        kend = kstart + kernel_size;
> +
> +        if ( kend > parms->phys_max )
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
> +    if ( parms->phys_align == UNSET_ADDR )
> +    {
> +        printk("Address conflict and %pd kernel is not relocatable\n", d);
> +        return false;
> +    }
> +
> +    reloc_base = find_kernel_memory(d, elf, parms);
> +    if ( reloc_base == 0 )
> +    {
> +        printk("Failed find a load address for the kernel\n");

Since you print the domain in the error message prior to this one, I
would consider also printing it here (or not printing it in both
cases).

> +        return false;
> +    }
> +
> +    if ( opt_dom0_verbose )
> +        printk("Relocating kernel from [%lx, %lx] -> [%lx, %lx]\n",
> +               (paddr_t)elf->dest_base,
> +               (paddr_t)elf->dest_base + elf->dest_size,
> +               reloc_base, reloc_base + elf->dest_size);

I think you need `- 1` for the end calculation if you use inclusive
ranges [, ].  Otherwise [, ) should be used.

> +
> +    parms->phys_entry += (reloc_base - (paddr_t)elf->dest_base);

This seems to assume that the image is always relocated at a higher
address that the original one?

parms->phys_entry = reloc_base + (parms->phys_entry - elf->dest_base);

> +    elf->dest_base = (char *)reloc_base;
> +
> +    return true;
> +}
> +
>  static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>                                    unsigned long image_headroom,
>                                    module_t *initrd, void *image_base,
> @@ -585,6 +687,12 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>      elf.dest_base = (void *)(parms.virt_kstart - parms.virt_base);
>      elf.dest_size = parms.virt_kend - parms.virt_kstart;
>  
> +    if ( !check_and_adjust_load_address(d, &elf, &parms) )
> +    {
> +        printk("Unable to load kernel\n");

check_and_adjust_load_address() already prints an error message,
probably no need to print another message.

> +        return -ENOMEM;
> +    }
> +
>      elf_set_vcpu(&elf, v);
>      rc = elf_load_binary(&elf);
>      if ( rc < 0 )
> diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
> index 7cc7b18a51..837a1b0f21 100644
> --- a/xen/common/libelf/libelf-dominfo.c
> +++ b/xen/common/libelf/libelf-dominfo.c
> @@ -125,6 +125,7 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>          [XEN_ELFNOTE_SUSPEND_CANCEL] = { "SUSPEND_CANCEL", ELFNOTE_INT },
>          [XEN_ELFNOTE_MOD_START_PFN] = { "MOD_START_PFN", ELFNOTE_INT },
>          [XEN_ELFNOTE_PHYS32_ENTRY] = { "PHYS32_ENTRY", ELFNOTE_INT },
> +        [XEN_ELFNOTE_PVH_RELOCATION] = { "PVH_RELOCATION", ELFNOTE_OTHER },
>      };
>  /* *INDENT-ON* */
>  
> @@ -234,6 +235,17 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>                  elf_note_numeric_array(elf, note, 8, 0),
>                  elf_note_numeric_array(elf, note, 8, 1));
>          break;
> +
> +    case XEN_ELFNOTE_PVH_RELOCATION:
> +        if ( elf_uval(elf, note, descsz) != 3 * sizeof(uint64_t) )
> +            return -1;
> +
> +        parms->phys_min = elf_note_numeric_array(elf, note, 8, 0);
> +        parms->phys_max = elf_note_numeric_array(elf, note, 8, 1);
> +        parms->phys_align = elf_note_numeric_array(elf, note, 8, 2);

Size for those needs to be 4 (32bits) as the entry point is in 32bit
mode?  I don't see how we can start past the 4GB boundary.

> +        elf_msg(elf, "min: %#"PRIx64" max: %#"PRIx64" align: %#"PRIx64"\n",
> +                parms->phys_min, parms->phys_max, parms->phys_align);
> +        break;
>      }
>      return 0;
>  }
> @@ -545,6 +557,7 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
>      parms->p2m_base = UNSET_ADDR;
>      parms->elf_paddr_offset = UNSET_ADDR;
>      parms->phys_entry = UNSET_ADDR32;
> +    parms->phys_align = UNSET_ADDR;

For correctness I would also init phys_{min,max}.

Thanks, Roger.

