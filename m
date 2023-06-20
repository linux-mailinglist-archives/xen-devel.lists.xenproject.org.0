Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 579C3736A37
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:03:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551623.861282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ8x-0007OC-Rc; Tue, 20 Jun 2023 11:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551623.861282; Tue, 20 Jun 2023 11:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZ8x-0007MB-Ox; Tue, 20 Jun 2023 11:03:27 +0000
Received: by outflank-mailman (input) for mailman id 551623;
 Tue, 20 Jun 2023 11:03:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBZ8w-0007LQ-Pm
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 11:03:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBZ8v-0003OI-Up; Tue, 20 Jun 2023 11:03:25 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.9.99])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBZ8v-0002xJ-Ol; Tue, 20 Jun 2023 11:03:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=mxHkokiF16o+DZNSN88oAS/ECGmB+43Snnz369s7gWI=; b=bJ3gyrb5bDrRzInqgeLHe5X4bT
	X3hkRFuUjmBlyXWvttZNls/D5I/2AJdGnqP8lFpuhkafqvJWkIag9sEfKmeHtDG+891cbe2DtDcsS
	TtgKL9zpvgwQKRjpk0dG1Nb55HayvntbY+9G5iQFzFrtWPSr0dgpnjaayAYZQp3wneCc=;
Message-ID: <16a4ff65-93ff-49fd-d3d3-215fd407b249@xen.org>
Date: Tue, 20 Jun 2023 12:03:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 04/13] xen/arm: fixed violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar <ayan.kumar.halder@amd.com>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <4d27e872f889f4080af42cc1ff2591ac56834e21.1687250177.git.gianluca.luparini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4d27e872f889f4080af42cc1ff2591ac56834e21.1687250177.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/06/2023 11:34, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>

Is this person the original author of this patch? If so...

> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
> "A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".
> 
> I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
> For homogeneity, I also added the "U" suffix in some cases that the tool didn't report as violations.

OOI, why would the tool not report all of them? And how did you decide 
when to add them?

> 

... the signed-off is missing here.

> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Yours should still be kept as you are sending the patch.

> ---
>   xen/arch/arm/domain_build.c              |  2 +-
>   xen/arch/arm/efi/efi-boot.h              |  2 +-
>   xen/arch/arm/gic-v2.c                    |  6 +++---
>   xen/arch/arm/include/asm/arm64/brk.h     |  2 +-
>   xen/arch/arm/include/asm/arm64/efibind.h | 10 +++++-----
>   xen/arch/arm/include/asm/arm64/insn.h    | 16 ++++++++--------
>   xen/arch/arm/include/asm/vreg.h          |  2 +-
>   xen/arch/arm/kernel.c                    |  2 +-
>   xen/arch/arm/traps.c                     |  4 ++--
>   xen/arch/arm/vgic-v2.c                   |  2 +-
>   xen/include/public/arch-arm/smccc.h      |  8 ++++----
>   11 files changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d0d6be922d..78261352a6 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3752,7 +3752,7 @@ static int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>            *...
>            */
>           regs->r0 = 0; /* SBZ */

Above, you said you want to be consistent when you use U. So I was 
expecting this would be 0U. Is this an oversight? If not, can you 
outline in which case 'U' can be ignored?

> -        regs->r1 = 0xffffffff; /* We use DTB therefore no machine id */
> +        regs->r1 = 0xffffffffU; /* We use DTB therefore no machine id */
>           regs->r2 = kinfo->dtb_paddr;
>       }
>   #ifdef CONFIG_ARM_64
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index bb64925d70..585332647d 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -46,7 +46,7 @@ static int get_module_file_index(const char *name, unsigned int name_len);
>   static void PrintMessage(const CHAR16 *s);
>   
>   #define DEVICE_TREE_GUID \
> -{0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0xe0}}
> +{0xb1b621d5U, 0xf19cU, 0x41a5U, {0x83U, 0x0bU, 0xd9U, 0x15U, 0x2cU, 0x69U, 0xaaU, 0xe0U}}
>   
>   static struct file __initdata dtbfile;
>   static void __initdata *fdt;
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index 6476ff4230..191c89b01b 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -386,9 +386,9 @@ static void gicv2_cpu_init(void)
>       /* The first 32 interrupts (PPI and SGI) are banked per-cpu, so
>        * even though they are controlled with GICD registers, they must
>        * be set up here with the other per-cpu state. */
> -    writel_gicd(0xffffffff, GICD_ICACTIVER); /* Diactivate PPIs and SGIs */
> -    writel_gicd(0xffff0000, GICD_ICENABLER); /* Disable all PPI */
> -    writel_gicd(0x0000ffff, GICD_ISENABLER); /* Enable all SGI */
> +    writel_gicd(0xffffffffU, GICD_ICACTIVER); /* Diactivate PPIs and SGIs */

Can you take the opportunity to fix the typo s/Diactivate/De-activate/?

> +    writel_gicd(0xffff0000U, GICD_ICENABLER); /* Disable all PPI */
> +    writel_gicd(0x0000ffffU, GICD_ISENABLER); /* Enable all SGI */
>   
>       /* Set SGI priorities */
>       for ( i = 0; i < 16; i += 4 )
> diff --git a/xen/arch/arm/include/asm/arm64/brk.h b/xen/arch/arm/include/asm/arm64/brk.h
> index 04442c4b9f..3af153a053 100644
> --- a/xen/arch/arm/include/asm/arm64/brk.h
> +++ b/xen/arch/arm/include/asm/arm64/brk.h
> @@ -21,7 +21,7 @@
>    * BRK instruction encoding
>    * The #imm16 value should be placed at bits[20:5] within BRK ins
>    */
> -#define AARCH64_BREAK_MON 0xd4200000
> +#define AARCH64_BREAK_MON 0xd4200000U
>   
>   /*
>    * BRK instruction for provoking a fault on purpose
> diff --git a/xen/arch/arm/include/asm/arm64/efibind.h b/xen/arch/arm/include/asm/arm64/efibind.h
> index 8b43bb8495..0e890b666d 100644
> --- a/xen/arch/arm/include/asm/arm64/efibind.h
> +++ b/xen/arch/arm/include/asm/arm64/efibind.h
> @@ -22,12 +22,12 @@ Revision History
>   #pragma pack()
>   #endif
>   
> -#define EFIERR(a)           (0x8000000000000000 | a)
> -#define EFI_ERROR_MASK      0x8000000000000000
> -#define EFIERR_OEM(a)       (0xc000000000000000 | a)
> +#define EFIERR(a)           (0x8000000000000000U | a)
> +#define EFI_ERROR_MASK      0x8000000000000000U
> +#define EFIERR_OEM(a)       (0xc000000000000000U | a)
>   
> -#define BAD_POINTER         0xFBFBFBFBFBFBFBFB
> -#define MAX_ADDRESS         0xFFFFFFFFFFFFFFFF
> +#define BAD_POINTER         0xFBFBFBFBFBFBFBFBU
> +#define MAX_ADDRESS         0xFFFFFFFFFFFFFFFFU
>   
>   #define EFI_STUB_ERROR      MAX_ADDRESS
>   
> diff --git a/xen/arch/arm/include/asm/arm64/insn.h b/xen/arch/arm/include/asm/arm64/insn.h
> index 4e0d364d41..b522b07bf5 100644
> --- a/xen/arch/arm/include/asm/arm64/insn.h
> +++ b/xen/arch/arm/include/asm/arm64/insn.h
> @@ -60,14 +60,14 @@ static always_inline bool aarch64_insn_is_##abbr(u32 code) \
>   static always_inline u32 aarch64_insn_get_##abbr##_value(void) \
>   { return (val); }
>   
> -__AARCH64_INSN_FUNCS(b,		0xFC000000, 0x14000000)
> -__AARCH64_INSN_FUNCS(bl,	0xFC000000, 0x94000000)
> -__AARCH64_INSN_FUNCS(cbz,	0x7F000000, 0x34000000)
> -__AARCH64_INSN_FUNCS(cbnz,	0x7F000000, 0x35000000)
> -__AARCH64_INSN_FUNCS(tbz,	0x7F000000, 0x36000000)
> -__AARCH64_INSN_FUNCS(tbnz,	0x7F000000, 0x37000000)
> -__AARCH64_INSN_FUNCS(bcond,	0xFF000010, 0x54000000)
> -__AARCH64_INSN_FUNCS(hint,	0xFFFFF01F, 0xD503201F)
> +__AARCH64_INSN_FUNCS(b,		0xFC000000U, 0x14000000)

I am guessing you are only adding the U when the top bit is '1' so it 
could be misinterpreted. But really, we should use 'U' everywhere a 
value is meant to be interpreted as an unsigned value as this is easier 
to apply for a contributor.

In any case, I think your approach should be outline in the commit 
message because I would consider your approach not homogenous as this is 
claimed in the commit message.

> +__AARCH64_INSN_FUNCS(bl,	0xFC000000U, 0x94000000U)
> +__AARCH64_INSN_FUNCS(cbz,	0x7F000000U, 0x34000000)
> +__AARCH64_INSN_FUNCS(cbnz,	0x7F000000U, 0x35000000)
> +__AARCH64_INSN_FUNCS(tbz,	0x7F000000U, 0x36000000)
> +__AARCH64_INSN_FUNCS(tbnz,	0x7F000000U, 0x37000000)
> +__AARCH64_INSN_FUNCS(bcond,	0xFF000010U, 0x54000000)
> +__AARCH64_INSN_FUNCS(hint,	0xFFFFF01FU, 0xD503201FU)
>   
>   bool aarch64_insn_is_branch_imm(u32 insn);
>   
> diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
> index bf945eebbd..387ce76e7e 100644
> --- a/xen/arch/arm/include/asm/vreg.h
> +++ b/xen/arch/arm/include/asm/vreg.h
> @@ -56,7 +56,7 @@ static inline bool vreg_emulate_cp64(struct cpu_user_regs *regs, union hsr hsr,
>   
>       if ( ret && cp64.read )
>       {
> -        set_user_reg(regs, cp64.reg1, x & 0xffffffff);
> +        set_user_reg(regs, cp64.reg1, x & 0xffffffffU);
>           set_user_reg(regs, cp64.reg2, x >> 32);
>       }
>   
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index ca5318515e..508c54824d 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -39,7 +39,7 @@ struct minimal_dtb_header {
>       /* There are other fields but we don't use them yet. */
>   };
>   
> -#define DTB_MAGIC 0xd00dfeed
> +#define DTB_MAGIC 0xd00dfeedU
>   
>   /**
>    * copy_from_paddr - copy data from a physical address
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index ef5c6a8195..def92fafae 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -398,7 +398,7 @@ static vaddr_t exception_handler32(vaddr_t offset)
>       register_t sctlr = READ_SYSREG(SCTLR_EL1);
>   
>       if ( sctlr & SCTLR_A32_EL1_V )
> -        return 0xffff0000 + offset;
> +        return 0xffff0000U + offset;
>       else /* always have security exceptions */
>           return READ_SYSREG(VBAR_EL1) + offset;
>   }
> @@ -809,7 +809,7 @@ static void show_registers_32(const struct cpu_user_regs *regs,
>   #ifdef CONFIG_ARM_64
>                  (uint32_t)(ctxt->far >> 32),
>                  ctxt->ifsr32_el2,
> -               (uint32_t)(ctxt->far & 0xffffffff),
> +               (uint32_t)(ctxt->far & 0xffffffffU),
>                  ctxt->esr_el1
>   #else
>                  ctxt->ifar, ctxt->ifsr, ctxt->dfar, ctxt->dfsr
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index 0b083c33e6..35363fee09 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -306,7 +306,7 @@ static int vgic_v2_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
>       case VREG32(GICD_SGIR):
>           if ( dabt.size != DABT_WORD ) goto bad_width;
>           /* Write only -- read unknown */
> -        *r = 0xdeadbeef;
> +        *r = 0xdeadbeefU;
>           return 1;
>   
>       case VRANGE32(0xF04, 0xF0C):
> diff --git a/xen/include/public/arch-arm/smccc.h b/xen/include/public/arch-arm/smccc.h
> index 802d800aad..8553f2f39e 100644
> --- a/xen/include/public/arch-arm/smccc.h
> +++ b/xen/include/public/arch-arm/smccc.h
> @@ -26,16 +26,16 @@
>   #define XEN_SMCCC_MINOR_REVISION 1
>   
>   /* Hypervisor Service UID. Randomly generated with uuidgen. */
> -#define XEN_SMCCC_UID XEN_DEFINE_UUID(0xa71812dc, 0xc698, 0x4369, 0x9acf, \
> -                                      0x79, 0xd1, 0x8d, 0xde, 0xe6, 0x67)
> +#define XEN_SMCCC_UID XEN_DEFINE_UUID(0xa71812dcU, 0xc698U, 0x4369U, 0x9acfU, \
> +                                      0x79U, 0xd1U, 0x8dU, 0xdeU, 0xe6U, 0x67U)
>   
>   /* Standard Service Service Call version. */
>   #define SSSC_SMCCC_MAJOR_REVISION 0
>   #define SSSC_SMCCC_MINOR_REVISION 1
>   
>   /* Standard Service Call UID. Randomly generated with uuidgen. */
> -#define SSSC_SMCCC_UID XEN_DEFINE_UUID(0xf863386f, 0x4b39, 0x4cbd, 0x9220,\
> -                                       0xce, 0x16, 0x41, 0xe5, 0x9f, 0x6f)
> +#define SSSC_SMCCC_UID XEN_DEFINE_UUID(0xf863386fU, 0x4b39U, 0x4cbdU, 0x9220U,\
> +                                       0xceU, 0x16U, 0x41U, 0xe5U, 0x9fU, 0x6fU)
>   
>   #endif /* __XEN_PUBLIC_ARCH_ARM_SMCCC_H__ */
>   

Cheers,
-- 
Julien Grall

