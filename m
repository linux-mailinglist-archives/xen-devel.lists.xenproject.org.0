Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B5DAC8508
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 01:36:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000261.1380599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKmnL-0000nk-Mh; Thu, 29 May 2025 23:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000261.1380599; Thu, 29 May 2025 23:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKmnL-0000kg-Je; Thu, 29 May 2025 23:36:19 +0000
Received: by outflank-mailman (input) for mailman id 1000261;
 Thu, 29 May 2025 23:36:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lP5k=YN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uKmnK-0000ka-VL
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 23:36:18 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b518cad6-3ce5-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 01:36:13 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ABAB5614BA;
 Thu, 29 May 2025 23:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F465C4CEEE;
 Thu, 29 May 2025 23:36:11 +0000 (UTC)
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
X-Inumbo-ID: b518cad6-3ce5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748561772;
	bh=X+RXe1a1/XeaL0wDzjF38o/ft4ck/X3z761JJ7tOUjM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MTip0EQkRwOT8K4w2HFACLXCclt7GsgCE+LETy/Kq3uFFtk3NcU0VSZqayS5ds50i
	 5sVpD1l4bzLEldyG/f6SECqf2AHpG7SvzmjXeWkvnLgzU6ASUjKWlxs613nD0oRdqt
	 lzaDbOIVZL+B5skEbfBDZ58/ju2G4QGh7y2iJC0RVQEkXuqfhwti1g6gRG6CnPJhd5
	 9P6AqQJ2zgYmqaYrbZUpBRty/99rHEfmE14AJbaMkwCYv2BZ50dfp6BbiREop0eYfL
	 rLaMrkeTjSOVVusd++sb8Guw68j+nehoPOhQ57mRON5F72r7ORyLythFhbtroeXu8j
	 HT94p7TsQyBoQ==
Date: Thu, 29 May 2025 16:36:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Denis Mukhin <dmkhn@proton.me>
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v3 1/2] xen/domain: introduce common hardware emulation
 flags
In-Reply-To: <20250528210139.2572609-2-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2505291629140.135336@ubuntu-linux-20-04-desktop>
References: <20250528210139.2572609-1-dmukhin@ford.com> <20250528210139.2572609-2-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 May 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add common emulation_flags for configuring domain emulation features.
> 
> Print d->emulation_flags from 'q' keyhandler for better traceability while
> debugging.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v2:
> - move emulation_flags to common domain struct
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
>  
>          arch_dump_domain_info(d);
>  
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 559d201e0c..dc4f917664 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -651,6 +651,8 @@ struct domain
>      unsigned int num_llc_colors;
>      const unsigned int *llc_colors;
>  #endif
> +
> +    uint32_t emulation_flags;

I think it is a good idea to move emulation_flags to common and I think
we can make use of them on ARM too because we have a choice of emulators
on ARM as well (pl011, gicv2, gicv3, etc.). I think it makes sense to
move at least kinfo->arch.vpl011 to be an emulation_flags instead.

I was going to ask to add an #ifdef CONFIG_X86 around the
emulation_flags field as it is currently still unused on other
architectures, but then it would break the compilation of keyhandler.c.

So maybe it is OK this way.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  } __aligned(PAGE_SIZE);
>  
>  static inline struct page_list_head *page_to_list(
> -- 
> 2.34.1
> 
> 

