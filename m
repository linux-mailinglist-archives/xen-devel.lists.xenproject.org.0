Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A01E17513AB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 00:40:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562864.879607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJiTn-0005K1-UJ; Wed, 12 Jul 2023 22:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562864.879607; Wed, 12 Jul 2023 22:38:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJiTn-0005IJ-RJ; Wed, 12 Jul 2023 22:38:39 +0000
Received: by outflank-mailman (input) for mailman id 562864;
 Wed, 12 Jul 2023 22:38:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eU4r=C6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qJiTl-0005ID-Ng
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 22:38:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d58ce9c6-2104-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 00:38:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A027861902;
 Wed, 12 Jul 2023 22:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA31C433C7;
 Wed, 12 Jul 2023 22:38:31 +0000 (UTC)
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
X-Inumbo-ID: d58ce9c6-2104-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689201513;
	bh=uiYA0gJvZYY38nHKeQVfF4MalSJ4wLzvXYoPclMmc/k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QEF/zU59PVpazClmWppV7Mc+YgvDsmCbrx/mbX2O5kIvx17yV8VxNu1/1UrFkYi8W
	 1i1VDg/G9isiMQS7WksVqbATPYVSXEICi3QYWRVts2e1Slblocg35zimkgBi3idfy2
	 29n3Q2V5kJvQwwyMn/81eotiaApd5X1XfErUW07qsfW8DXtQoY+DhAtfpLJ1E9ZgwF
	 71yS8s82Vs6tmczrqtwceXwlEsi/MalRdBpuNWueEx0UPe5DpktGLREp1KlrCsbz5l
	 a5SzqQZlaGkNwmWZeFh+wT9LffPAy7ze2v2P3Dnh3IMQypr0l6CLaPvEvfrXijPM7k
	 FjedCSTxsGGeQ==
Date: Wed, 12 Jul 2023 15:38:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH v3 04/15] xen/arm: fix violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <0e899828681c4c408ce223dcd03444a4c9039eab.1689152719.git.gianluca.luparini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307121538230.761183@ubuntu-linux-20-04-desktop>
References: <cover.1689152719.git.gianluca.luparini@bugseng.com> <0e899828681c4c408ce223dcd03444a4c9039eab.1689152719.git.gianluca.luparini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Jul 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type and also to other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3:
> - change 'Signed-off-by' ordering
> - add 'ULL' instead of 'U' in 'efibind.h' and 'vgic-v3.c'
> - remove excessive suffixes in 'efi-boot.h' and 'smccc.h'
> 
> Changes in v2:
> - minor change to commit title
> - change commit message
> - fix in 'domain_build.c' file for consistency
> - fix typo in 'gic-v2.c' file
> - fix in 'insn.h' file for consistency
> - add fixes in 'gic-v3.c', 'traps.c' and 'vgic-v3.c'
> ---
>  xen/arch/arm/domain_build.c              |  4 ++--
>  xen/arch/arm/efi/efi-boot.h              |  2 +-
>  xen/arch/arm/gic-v2.c                    |  6 +++---
>  xen/arch/arm/gic-v3.c                    | 10 +++++-----
>  xen/arch/arm/include/asm/arm64/brk.h     |  2 +-
>  xen/arch/arm/include/asm/arm64/efibind.h | 10 +++++-----
>  xen/arch/arm/include/asm/arm64/insn.h    | 16 ++++++++--------
>  xen/arch/arm/include/asm/vreg.h          |  2 +-
>  xen/arch/arm/kernel.c                    |  2 +-
>  xen/arch/arm/traps.c                     | 14 +++++++-------
>  xen/arch/arm/vgic-v2.c                   |  2 +-
>  xen/arch/arm/vgic-v3.c                   |  2 +-
>  xen/include/public/arch-arm/smccc.h      |  4 ++--
>  13 files changed, 38 insertions(+), 38 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d0d6be922d..d58604ef4a 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3751,8 +3751,8 @@ static int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>           * r1 = machine nr, r2 = atags or dtb pointer.
>           *...
>           */
> -        regs->r0 = 0; /* SBZ */
> -        regs->r1 = 0xffffffff; /* We use DTB therefore no machine id */
> +        regs->r0 = 0U; /* SBZ */
> +        regs->r1 = 0xffffffffU; /* We use DTB therefore no machine id */
>          regs->r2 = kinfo->dtb_paddr;
>      }
>  #ifdef CONFIG_ARM_64
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index bb64925d70..3daa63a40d 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -46,7 +46,7 @@ static int get_module_file_index(const char *name, unsigned int name_len);
>  static void PrintMessage(const CHAR16 *s);
>  
>  #define DEVICE_TREE_GUID \
> -{0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0xe0}}
> +{0xb1b621d5U, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0xe0}}
>  
>  static struct file __initdata dtbfile;
>  static void __initdata *fdt;
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index 6476ff4230..cf392bfd1c 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -386,9 +386,9 @@ static void gicv2_cpu_init(void)
>      /* The first 32 interrupts (PPI and SGI) are banked per-cpu, so
>       * even though they are controlled with GICD registers, they must
>       * be set up here with the other per-cpu state. */
> -    writel_gicd(0xffffffff, GICD_ICACTIVER); /* Diactivate PPIs and SGIs */
> -    writel_gicd(0xffff0000, GICD_ICENABLER); /* Disable all PPI */
> -    writel_gicd(0x0000ffff, GICD_ISENABLER); /* Enable all SGI */
> +    writel_gicd(0xffffffffU, GICD_ICACTIVER); /* De-activate PPIs and SGIs */
> +    writel_gicd(0xffff0000U, GICD_ICENABLER); /* Disable all PPI */
> +    writel_gicd(0x0000ffffU, GICD_ISENABLER); /* Enable all SGI */
>  
>      /* Set SGI priorities */
>      for ( i = 0; i < 16; i += 4 )
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 4e6c98bada..95e4f020fe 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -619,8 +619,8 @@ static void __init gicv3_dist_init(void)
>      /* Disable/deactivate all global interrupts */
>      for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i += 32 )
>      {
> -        writel_relaxed(0xffffffff, GICD + GICD_ICENABLER + (i / 32) * 4);
> -        writel_relaxed(0xffffffff, GICD + GICD_ICACTIVER + (i / 32) * 4);
> +        writel_relaxed(0xffffffffU, GICD + GICD_ICENABLER + (i / 32) * 4);
> +        writel_relaxed(0xffffffffU, GICD + GICD_ICACTIVER + (i / 32) * 4);
>      }
>  
>      /*
> @@ -832,13 +832,13 @@ static int gicv3_cpu_init(void)
>       * The activate state is unknown at boot, so make sure all
>       * SGIs and PPIs are de-activated.
>       */
> -    writel_relaxed(0xffffffff, GICD_RDIST_SGI_BASE + GICR_ICACTIVER0);
> +    writel_relaxed(0xffffffffU, GICD_RDIST_SGI_BASE + GICR_ICACTIVER0);
>      /*
>       * Disable all PPI interrupts, ensure all SGI interrupts are
>       * enabled.
>       */
> -    writel_relaxed(0xffff0000, GICD_RDIST_SGI_BASE + GICR_ICENABLER0);
> -    writel_relaxed(0x0000ffff, GICD_RDIST_SGI_BASE + GICR_ISENABLER0);
> +    writel_relaxed(0xffff0000U, GICD_RDIST_SGI_BASE + GICR_ICENABLER0);
> +    writel_relaxed(0x0000ffffU, GICD_RDIST_SGI_BASE + GICR_ISENABLER0);
>      /* Configure SGIs/PPIs as non-secure Group-1 */
>      writel_relaxed(GENMASK(31, 0), GICD_RDIST_SGI_BASE + GICR_IGROUPR0);
>  
> diff --git a/xen/arch/arm/include/asm/arm64/brk.h b/xen/arch/arm/include/asm/arm64/brk.h
> index 04442c4b9f..3af153a053 100644
> --- a/xen/arch/arm/include/asm/arm64/brk.h
> +++ b/xen/arch/arm/include/asm/arm64/brk.h
> @@ -21,7 +21,7 @@
>   * BRK instruction encoding
>   * The #imm16 value should be placed at bits[20:5] within BRK ins
>   */
> -#define AARCH64_BREAK_MON 0xd4200000
> +#define AARCH64_BREAK_MON 0xd4200000U
>  
>  /*
>   * BRK instruction for provoking a fault on purpose
> diff --git a/xen/arch/arm/include/asm/arm64/efibind.h b/xen/arch/arm/include/asm/arm64/efibind.h
> index 8b43bb8495..f13eadd4f0 100644
> --- a/xen/arch/arm/include/asm/arm64/efibind.h
> +++ b/xen/arch/arm/include/asm/arm64/efibind.h
> @@ -22,12 +22,12 @@ Revision History
>  #pragma pack()
>  #endif
>  
> -#define EFIERR(a)           (0x8000000000000000 | a)
> -#define EFI_ERROR_MASK      0x8000000000000000
> -#define EFIERR_OEM(a)       (0xc000000000000000 | a)
> +#define EFIERR(a)           (0x8000000000000000ULL | a)
> +#define EFI_ERROR_MASK      0x8000000000000000ULL
> +#define EFIERR_OEM(a)       (0xc000000000000000ULL | a)
>  
> -#define BAD_POINTER         0xFBFBFBFBFBFBFBFB
> -#define MAX_ADDRESS         0xFFFFFFFFFFFFFFFF
> +#define BAD_POINTER         0xFBFBFBFBFBFBFBFBULL
> +#define MAX_ADDRESS         0xFFFFFFFFFFFFFFFFULL
>  
>  #define EFI_STUB_ERROR      MAX_ADDRESS
>  
> diff --git a/xen/arch/arm/include/asm/arm64/insn.h b/xen/arch/arm/include/asm/arm64/insn.h
> index 4e0d364d41..6308959449 100644
> --- a/xen/arch/arm/include/asm/arm64/insn.h
> +++ b/xen/arch/arm/include/asm/arm64/insn.h
> @@ -60,14 +60,14 @@ static always_inline bool aarch64_insn_is_##abbr(u32 code) \
>  static always_inline u32 aarch64_insn_get_##abbr##_value(void) \
>  { return (val); }
>  
> -__AARCH64_INSN_FUNCS(b,		0xFC000000, 0x14000000)
> -__AARCH64_INSN_FUNCS(bl,	0xFC000000, 0x94000000)
> -__AARCH64_INSN_FUNCS(cbz,	0x7F000000, 0x34000000)
> -__AARCH64_INSN_FUNCS(cbnz,	0x7F000000, 0x35000000)
> -__AARCH64_INSN_FUNCS(tbz,	0x7F000000, 0x36000000)
> -__AARCH64_INSN_FUNCS(tbnz,	0x7F000000, 0x37000000)
> -__AARCH64_INSN_FUNCS(bcond,	0xFF000010, 0x54000000)
> -__AARCH64_INSN_FUNCS(hint,	0xFFFFF01F, 0xD503201F)
> +__AARCH64_INSN_FUNCS(b,		0xFC000000U, 0x14000000U)
> +__AARCH64_INSN_FUNCS(bl,	0xFC000000U, 0x94000000U)
> +__AARCH64_INSN_FUNCS(cbz,	0x7F000000U, 0x34000000U)
> +__AARCH64_INSN_FUNCS(cbnz,	0x7F000000U, 0x35000000U)
> +__AARCH64_INSN_FUNCS(tbz,	0x7F000000U, 0x36000000U)
> +__AARCH64_INSN_FUNCS(tbnz,	0x7F000000U, 0x37000000U)
> +__AARCH64_INSN_FUNCS(bcond,	0xFF000010U, 0x54000000U)
> +__AARCH64_INSN_FUNCS(hint,	0xFFFFF01FU, 0xD503201FU)
>  
>  bool aarch64_insn_is_branch_imm(u32 insn);
>  
> diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
> index bf945eebbd..387ce76e7e 100644
> --- a/xen/arch/arm/include/asm/vreg.h
> +++ b/xen/arch/arm/include/asm/vreg.h
> @@ -56,7 +56,7 @@ static inline bool vreg_emulate_cp64(struct cpu_user_regs *regs, union hsr hsr,
>  
>      if ( ret && cp64.read )
>      {
> -        set_user_reg(regs, cp64.reg1, x & 0xffffffff);
> +        set_user_reg(regs, cp64.reg1, x & 0xffffffffU);
>          set_user_reg(regs, cp64.reg2, x >> 32);
>      }
>  
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index ca5318515e..508c54824d 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -39,7 +39,7 @@ struct minimal_dtb_header {
>      /* There are other fields but we don't use them yet. */
>  };
>  
> -#define DTB_MAGIC 0xd00dfeed
> +#define DTB_MAGIC 0xd00dfeedU
>  
>  /**
>   * copy_from_paddr - copy data from a physical address
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index ef5c6a8195..d1ef787638 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -398,7 +398,7 @@ static vaddr_t exception_handler32(vaddr_t offset)
>      register_t sctlr = READ_SYSREG(SCTLR_EL1);
>  
>      if ( sctlr & SCTLR_A32_EL1_V )
> -        return 0xffff0000 + offset;
> +        return 0xffff0000U + offset;
>      else /* always have security exceptions */
>          return READ_SYSREG(VBAR_EL1) + offset;
>  }
> @@ -809,7 +809,7 @@ static void show_registers_32(const struct cpu_user_regs *regs,
>  #ifdef CONFIG_ARM_64
>                 (uint32_t)(ctxt->far >> 32),
>                 ctxt->ifsr32_el2,
> -               (uint32_t)(ctxt->far & 0xffffffff),
> +               (uint32_t)(ctxt->far & 0xffffffffU),
>                 ctxt->esr_el1
>  #else
>                 ctxt->ifar, ctxt->ifsr, ctxt->dfar, ctxt->dfsr
> @@ -1414,16 +1414,16 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>      {
>          /* Deliberately corrupt parameter regs used by this hypercall. */
>          switch ( hypercall_args[*nr] ) {
> -        case 5: HYPERCALL_ARG5(regs) = 0xDEADBEEF;
> -        case 4: HYPERCALL_ARG4(regs) = 0xDEADBEEF;
> -        case 3: HYPERCALL_ARG3(regs) = 0xDEADBEEF;
> -        case 2: HYPERCALL_ARG2(regs) = 0xDEADBEEF;
> +        case 5: HYPERCALL_ARG5(regs) = 0xDEADBEEFU;
> +        case 4: HYPERCALL_ARG4(regs) = 0xDEADBEEFU;
> +        case 3: HYPERCALL_ARG3(regs) = 0xDEADBEEFU;
> +        case 2: HYPERCALL_ARG2(regs) = 0xDEADBEEFU;
>          case 1: /* Don't clobber x0/r0 -- it's the return value */
>          case 0: /* -ENOSYS case */
>              break;
>          default: BUG();
>          }
> -        *nr = 0xDEADBEEF;
> +        *nr = 0xDEADBEEFU;
>      }
>  #endif
>  
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index 0b083c33e6..35363fee09 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -306,7 +306,7 @@ static int vgic_v2_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
>      case VREG32(GICD_SGIR):
>          if ( dabt.size != DABT_WORD ) goto bad_width;
>          /* Write only -- read unknown */
> -        *r = 0xdeadbeef;
> +        *r = 0xdeadbeefU;
>          return 1;
>  
>      case VRANGE32(0xF04, 0xF0C):
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 9c1fdcc3f8..1b7173da1e 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -354,7 +354,7 @@ read_reserved:
>      return 1;
>  
>  read_unknown:
> -    *r = vreg_reg64_extract(0xdeadbeafdeadbeaf, info);
> +    *r = vreg_reg64_extract(0xdeadbeafdeadbeafULL, info);
>      return 1;
>  }
>  
> diff --git a/xen/include/public/arch-arm/smccc.h b/xen/include/public/arch-arm/smccc.h
> index 802d800aad..8a9321ebed 100644
> --- a/xen/include/public/arch-arm/smccc.h
> +++ b/xen/include/public/arch-arm/smccc.h
> @@ -26,7 +26,7 @@
>  #define XEN_SMCCC_MINOR_REVISION 1
>  
>  /* Hypervisor Service UID. Randomly generated with uuidgen. */
> -#define XEN_SMCCC_UID XEN_DEFINE_UUID(0xa71812dc, 0xc698, 0x4369, 0x9acf, \
> +#define XEN_SMCCC_UID XEN_DEFINE_UUID(0xa71812dcU, 0xc698, 0x4369, 0x9acf, \
>                                        0x79, 0xd1, 0x8d, 0xde, 0xe6, 0x67)
>  
>  /* Standard Service Service Call version. */
> @@ -34,7 +34,7 @@
>  #define SSSC_SMCCC_MINOR_REVISION 1
>  
>  /* Standard Service Call UID. Randomly generated with uuidgen. */
> -#define SSSC_SMCCC_UID XEN_DEFINE_UUID(0xf863386f, 0x4b39, 0x4cbd, 0x9220,\
> +#define SSSC_SMCCC_UID XEN_DEFINE_UUID(0xf863386fU, 0x4b39, 0x4cbd, 0x9220,\
>                                         0xce, 0x16, 0x41, 0xe5, 0x9f, 0x6f)
>  
>  #endif /* __XEN_PUBLIC_ARCH_ARM_SMCCC_H__ */
> -- 
> 2.41.0
> 

