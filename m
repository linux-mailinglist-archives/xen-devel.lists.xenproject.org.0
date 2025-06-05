Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEE1ACEC9C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 11:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006427.1385600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN6aA-0002cV-Qv; Thu, 05 Jun 2025 09:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006427.1385600; Thu, 05 Jun 2025 09:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN6aA-0002aR-Ne; Thu, 05 Jun 2025 09:08:18 +0000
Received: by outflank-mailman (input) for mailman id 1006427;
 Thu, 05 Jun 2025 09:08:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uN6aA-0002aJ-4o
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 09:08:18 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bbd48fc-41ec-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 11:08:13 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-450cfb6a794so4434015e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 02:08:13 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451f9924a6esm17429905e9.38.2025.06.05.02.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 02:08:11 -0700 (PDT)
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
X-Inumbo-ID: 9bbd48fc-41ec-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749114492; x=1749719292; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AoJYmVxtW7cGEG7rMfpyZImktfoY0IXrysF4/eA/RGM=;
        b=PNRrOgfN1sJmFFu6PxyjqrWq5sYN/eg396gOmcYaLiMfk4bNvEaLF4kHk75Q7AybK3
         YpXxwixJgXVDz6Ki8VcqhSoIuDTNoSt/4xviMkIQJqLF4kPyL0Q01ouksZm9ZppH2vE5
         O93HupH1Xig39HHFdHZDYQVtcp6gLNpUlXPa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749114492; x=1749719292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoJYmVxtW7cGEG7rMfpyZImktfoY0IXrysF4/eA/RGM=;
        b=idSXzX4BKPzBrtFWvTf8XTZ3Y8Y2+oI3UGxH6H8g4wPVy6SHDJpHjyMR7ytHd7ZoGg
         HryZHcQalm9jkwkHQvScm2mb4oz9FBv73KyDNs930N1vCWQspyiVkYiCVq7uEaCKXTPt
         DhiGON8AMH+bHMWjioE6WYx3lh916Y0lnEW8KmSjRILuKYRQuNk1bEeVsr+0kOPY6oLa
         oh7hG257bQWfDkcQgpdPOifsBbzqrLhL/pohtlwt1ecXVuE2xCsMYbqJ4rLBlQlaz0u3
         QFMLz8rNo0rCNMMGlL8RrZABLNCicFjoJdRODA9rkbsuXopad/4QvIFCwsU6CYh1eMxH
         tTQQ==
X-Gm-Message-State: AOJu0YyyVKvNEACFJnmDUKPPKM1KUvysLQR9DEaLtUEd0dLyCvDly8rh
	YlDVY3aXkx/0v4sUf01qIvxCJlnYdvXmYsMlBB1pKCSTHM+47jLLJ2u6tVaccSyrxr4=
X-Gm-Gg: ASbGncssS9w3SHfmPCSod/nLe7Qo9QOgc9o5KqNY+olcLK6S8XRXYzgnllaObcgzxNS
	1MhZ87VzwzJnJBfGS2K8CStVfpKKUY1/m2na9eJf4+W+lxSSuupZynyZCjK8DMII3c9lfY7/UHW
	u7c82ARXoN4Dza0qBjbUZ1P8ZSOwsZyT4ebvLvcoX/HAIgDTKQczLaRqEfa+78SlpiNlANnwtO1
	bq5xNds1WP5tCiz9JTLa6J9WdxPoipGUmKEEoAXmrqUDIElyVvk/xdMdwAUK3AmTdc1RiYEygTs
	H7LXUAHcIjhdQnuKMaulO3keaB/CyzcuXR40oHTf8dLoQVlxDUeiQTf/EK+rGzMMkq2Ew0NkEeB
	EoD3Fh1PHDIsvNYVW6RfYVQY1GzifMg==
X-Google-Smtp-Source: AGHT+IEg0DIfzLxM5cKvMgFPiSd02lGWi6OuYsDwuyWUt1JcmS6+6Ik6cigTW4NGlPiwd/a2S1DDpw==
X-Received: by 2002:a05:600c:4446:b0:441:ac58:ead5 with SMTP id 5b1f17b1804b1-451f0b3e164mr63095975e9.31.1749114492322;
        Thu, 05 Jun 2025 02:08:12 -0700 (PDT)
Date: Thu, 5 Jun 2025 11:08:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org,
	teddy.astie@vates.tech, dmukhin@ford.com
Subject: Re: [PATCH v5 1/2] xen/domain: introduce common hardware emulation
 flags
Message-ID: <aEFed_4esi3J_Tw-@macbook.local>
References: <20250602191717.148361-1-dmukhin@ford.com>
 <20250602191717.148361-2-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602191717.148361-2-dmukhin@ford.com>

On Mon, Jun 02, 2025 at 07:17:30PM +0000, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add common emulation_flags for configuring domain emulation features.
> 
> Print d->emulation_flags from 'q' keyhandler for better traceability while
> debugging.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes since v4:
> - kept Stefano's R-b
> ---
>  xen/arch/x86/domain.c             |  2 +-
>  xen/arch/x86/domctl.c             |  2 +-
>  xen/arch/x86/include/asm/domain.h | 25 +++++++++++--------------
>  xen/common/keyhandler.c           |  1 +
>  xen/include/xen/sched.h           |  2 ++
>  5 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 7536b6c871..0363ccb384 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -831,7 +831,7 @@ int arch_domain_create(struct domain *d,
>                 emflags);
>          return -EOPNOTSUPP;
>      }
> -    d->arch.emulation_flags = emflags;
> +    d->emulation_flags = emflags;
>  
>  #ifdef CONFIG_PV32
>      HYPERVISOR_COMPAT_VIRT_START(d) =
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 3044f706de..37d848f683 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -144,7 +144,7 @@ void arch_get_domain_info(const struct domain *d,
>      if ( paging_mode_hap(d) )
>          info->flags |= XEN_DOMINF_hap;
>  
> -    info->arch_config.emulation_flags = d->arch.emulation_flags;
> +    info->arch_config.emulation_flags = d->emulation_flags;
>      info->gpaddr_bits = hap_paddr_bits;
>  }
>  
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index 8c0dea12a5..eafd5cfc90 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -455,9 +455,6 @@ struct arch_domain
>  
>      /* Don't unconditionally inject #GP for unhandled MSRs. */
>      bool msr_relaxed;
> -
> -    /* Emulated devices enabled bitmap. */
> -    uint32_t emulation_flags;
>  } __cacheline_aligned;
>  
>  #ifdef CONFIG_HVM
> @@ -494,17 +491,17 @@ struct arch_domain
>                                   X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
>                                   X86_EMU_VPCI)
>  
> -#define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
> -#define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPET))
> -#define has_vpm(d)         (!!((d)->arch.emulation_flags & X86_EMU_PM))
> -#define has_vrtc(d)        (!!((d)->arch.emulation_flags & X86_EMU_RTC))
> -#define has_vioapic(d)     (!!((d)->arch.emulation_flags & X86_EMU_IOAPIC))
> -#define has_vpic(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIC))
> -#define has_vvga(d)        (!!((d)->arch.emulation_flags & X86_EMU_VGA))
> -#define has_viommu(d)      (!!((d)->arch.emulation_flags & X86_EMU_IOMMU))
> -#define has_vpit(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIT))
> -#define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
> -#define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
> +#define has_vlapic(d)      (!!((d)->emulation_flags & X86_EMU_LAPIC))
> +#define has_vhpet(d)       (!!((d)->emulation_flags & X86_EMU_HPET))
> +#define has_vpm(d)         (!!((d)->emulation_flags & X86_EMU_PM))
> +#define has_vrtc(d)        (!!((d)->emulation_flags & X86_EMU_RTC))
> +#define has_vioapic(d)     (!!((d)->emulation_flags & X86_EMU_IOAPIC))
> +#define has_vpic(d)        (!!((d)->emulation_flags & X86_EMU_PIC))
> +#define has_vvga(d)        (!!((d)->emulation_flags & X86_EMU_VGA))
> +#define has_viommu(d)      (!!((d)->emulation_flags & X86_EMU_IOMMU))
> +#define has_vpit(d)        (!!((d)->emulation_flags & X86_EMU_PIT))
> +#define has_pirq(d)        (!!((d)->emulation_flags & X86_EMU_USE_PIRQ))
> +#define has_vpci(d)        (!!((d)->emulation_flags & X86_EMU_VPCI))
>  
>  #define gdt_ldt_pt_idx(v) \
>        ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
> diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> index 0bb842ec00..cd731452ba 100644
> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -306,6 +306,7 @@ static void cf_check dump_domains(unsigned char key)
>              if ( test_bit(i, &d->watchdog_inuse_map) )
>                  printk("    watchdog %d expires in %d seconds\n",
>                         i, (u32)((d->watchdog_timer[i].expires - NOW()) >> 30));
> +        printk("    emulation_flags %#x\n", d->emulation_flags);

No strong opinion, but my preference would be to print those as
strings if possible, ie:

printk("    emulation_flags: %s%s%s...(%#x)\n",
       !d->emulation_flags ? "none " : "",
       has_vlapic(d) ? "vlapic " : "",
       has_vhpet(d) ? "hpet " : "",
       ...,
       d->emulation_flags);

Thanks, Roger.

