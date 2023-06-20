Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEE5736D64
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 15:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551871.861622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBbQQ-0007HV-0F; Tue, 20 Jun 2023 13:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551871.861622; Tue, 20 Jun 2023 13:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBbQP-0007F2-Sy; Tue, 20 Jun 2023 13:29:37 +0000
Received: by outflank-mailman (input) for mailman id 551871;
 Tue, 20 Jun 2023 13:29:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovpU=CI=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBbQO-0007Ew-4o
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 13:29:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cc435b8-0f6e-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 15:29:31 +0200 (CEST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by support.bugseng.com (Postfix) with ESMTPSA id B33BB4EE0744
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 15:29:30 +0200 (CEST)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-471658cc106so1282684e0c.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 06:29:30 -0700 (PDT)
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
X-Inumbo-ID: 7cc435b8-0f6e-11ee-8611-37d641c3527e
X-Gm-Message-State: AC+VfDxQDSaYx2AVMBDhcueETi1sqhQ0RPr1N6K3lpMbUGyoFG0lwdjl
	jtGh5ktvvRdysiytVk0ZC7DlD9QeCbKGxNE23pk=
X-Google-Smtp-Source: ACHHUZ7smzV34EbajeDwft4Pqx+L+9S70NjlIjBZmsZw9qYcJkwM89G/2uvyYprSySz8SCKigc2ais53tquEK6TaAvw=
X-Received: by 2002:a67:bb0d:0:b0:440:a760:dc9d with SMTP id
 m13-20020a67bb0d000000b00440a760dc9dmr4131094vsn.16.1687267769435; Tue, 20
 Jun 2023 06:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <4d27e872f889f4080af42cc1ff2591ac56834e21.1687250177.git.gianluca.luparini@bugseng.com>
 <16a4ff65-93ff-49fd-d3d3-215fd407b249@xen.org>
In-Reply-To: <16a4ff65-93ff-49fd-d3d3-215fd407b249@xen.org>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Tue, 20 Jun 2023 15:29:17 +0200
X-Gmail-Original-Message-ID: <CAFHJcJtMCQJy2H1irjH3VRFWN3-ckCqjsN7aO+2rDV5CizBNEA@mail.gmail.com>
Message-ID: <CAFHJcJtMCQJy2H1irjH3VRFWN3-ckCqjsN7aO+2rDV5CizBNEA@mail.gmail.com>
Subject: Re: [XEN PATCH 04/13] xen/arm: fixed violations of MISRA C:2012 Rule 7.2
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
	Gianluca Luparini <gianluca.luparini@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Michal Orzel <michal.orzel@amd.com>, Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
	Ayan Kumar <ayan.kumar.halder@amd.com>
Content-Type: multipart/alternative; boundary="00000000000009cce505fe8fa452"

--00000000000009cce505fe8fa452
Content-Type: text/plain; charset="UTF-8"

Hi,

Il giorno mar 20 giu 2023 alle ore 13:03 Julien Grall <julien@xen.org> ha
scritto:

> Hi,
>
> On 20/06/2023 11:34, Simone Ballarin wrote:
> > From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>
> Is this person the original author of this patch? If so...
>
> >
> > The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> > "A "u" or "U" suffix shall be applied to all integer constants that are
> represented in an unsigned type".
> >
> > I propose to use "U" as a suffix to explicitly state when an integer
> constant is represented in an unsigned type.
> > For homogeneity, I also added the "U" suffix in some cases that the tool
> didn't report as violations.
>
> OOI, why would the tool not report all of them? And how did you decide
> when to add them?
>

The MISRA rule asks for a U suffix only on integer literals that have
unsigned standard type.
This means that if the literal can be stored in a signed int there is no
violation.
You are right that the sentence was poorly formulated: it will be clearer
in v2 of the patch series.

Appending the U suffix to all positive integer literals is not safe in
general as it may change the semantics of the code.
For uniformity, we tried to put the suffix also on integers used in the
same contexts or near violations, when their positive
nature was immediately clear.

>
>
> ... the signed-off is missing here.
>

Copy. The next patches will also contain the missing signed-offs.


> > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>
> Yours should still be kept as you are sending the patch.
>
> > ---
> >   xen/arch/arm/domain_build.c              |  2 +-
> >   xen/arch/arm/efi/efi-boot.h              |  2 +-
> >   xen/arch/arm/gic-v2.c                    |  6 +++---
> >   xen/arch/arm/include/asm/arm64/brk.h     |  2 +-
> >   xen/arch/arm/include/asm/arm64/efibind.h | 10 +++++-----
> >   xen/arch/arm/include/asm/arm64/insn.h    | 16 ++++++++--------
> >   xen/arch/arm/include/asm/vreg.h          |  2 +-
> >   xen/arch/arm/kernel.c                    |  2 +-
> >   xen/arch/arm/traps.c                     |  4 ++--
> >   xen/arch/arm/vgic-v2.c                   |  2 +-
> >   xen/include/public/arch-arm/smccc.h      |  8 ++++----
> >   11 files changed, 28 insertions(+), 28 deletions(-)
> >
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index d0d6be922d..78261352a6 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -3752,7 +3752,7 @@ static int __init construct_domain(struct domain
> *d, struct kernel_info *kinfo)
> >            *...
> >            */
> >           regs->r0 = 0; /* SBZ */
>
> Above, you said you want to be consistent when you use U. So I was
> expecting this would be 0U. Is this an oversight? If not, can you
> outline in which case 'U' can be ignored?
>

According to the rule 'U' is required only if the literal has unsigned
standard type,
and this is not the case.
But, I agree with you that, in this case, for consistency, it should be
added.


>
> > -        regs->r1 = 0xffffffff; /* We use DTB therefore no machine id */
> > +        regs->r1 = 0xffffffffU; /* We use DTB therefore no machine id */
> >           regs->r2 = kinfo->dtb_paddr;
> >       }
> >   #ifdef CONFIG_ARM_64
> > diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> > index bb64925d70..585332647d 100644
> > --- a/xen/arch/arm/efi/efi-boot.h
> > +++ b/xen/arch/arm/efi/efi-boot.h
> > @@ -46,7 +46,7 @@ static int get_module_file_index(const char *name,
> unsigned int name_len);
> >   static void PrintMessage(const CHAR16 *s);
> >
> >   #define DEVICE_TREE_GUID \
> > -{0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa,
> 0xe0}}
> > +{0xb1b621d5U, 0xf19cU, 0x41a5U, {0x83U, 0x0bU, 0xd9U, 0x15U, 0x2cU,
> 0x69U, 0xaaU, 0xe0U}}
> >
> >   static struct file __initdata dtbfile;
> >   static void __initdata *fdt;
> > diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> > index 6476ff4230..191c89b01b 100644
> > --- a/xen/arch/arm/gic-v2.c
> > +++ b/xen/arch/arm/gic-v2.c
> > @@ -386,9 +386,9 @@ static void gicv2_cpu_init(void)
> >       /* The first 32 interrupts (PPI and SGI) are banked per-cpu, so
> >        * even though they are controlled with GICD registers, they must
> >        * be set up here with the other per-cpu state. */
> > -    writel_gicd(0xffffffff, GICD_ICACTIVER); /* Diactivate PPIs and
> SGIs */
> > -    writel_gicd(0xffff0000, GICD_ICENABLER); /* Disable all PPI */
> > -    writel_gicd(0x0000ffff, GICD_ISENABLER); /* Enable all SGI */
> > +    writel_gicd(0xffffffffU, GICD_ICACTIVER); /* Diactivate PPIs and
> SGIs */
>
> Can you take the opportunity to fix the typo s/Diactivate/De-activate/?
>

Yes.


> > +    writel_gicd(0xffff0000U, GICD_ICENABLER); /* Disable all PPI */
> > +    writel_gicd(0x0000ffffU, GICD_ISENABLER); /* Enable all SGI */
> >
> >       /* Set SGI priorities */
> >       for ( i = 0; i < 16; i += 4 )
> > diff --git a/xen/arch/arm/include/asm/arm64/brk.h
> b/xen/arch/arm/include/asm/arm64/brk.h
> > index 04442c4b9f..3af153a053 100644
> > --- a/xen/arch/arm/include/asm/arm64/brk.h
> > +++ b/xen/arch/arm/include/asm/arm64/brk.h
> > @@ -21,7 +21,7 @@
> >    * BRK instruction encoding
> >    * The #imm16 value should be placed at bits[20:5] within BRK ins
> >    */
> > -#define AARCH64_BREAK_MON 0xd4200000
> > +#define AARCH64_BREAK_MON 0xd4200000U
> >
> >   /*
> >    * BRK instruction for provoking a fault on purpose
> > diff --git a/xen/arch/arm/include/asm/arm64/efibind.h
> b/xen/arch/arm/include/asm/arm64/efibind.h
> > index 8b43bb8495..0e890b666d 100644
> > --- a/xen/arch/arm/include/asm/arm64/efibind.h
> > +++ b/xen/arch/arm/include/asm/arm64/efibind.h
> > @@ -22,12 +22,12 @@ Revision History
> >   #pragma pack()
> >   #endif
> >
> > -#define EFIERR(a)           (0x8000000000000000 | a)
> > -#define EFI_ERROR_MASK      0x8000000000000000
> > -#define EFIERR_OEM(a)       (0xc000000000000000 | a)
> > +#define EFIERR(a)           (0x8000000000000000U | a)
> > +#define EFI_ERROR_MASK      0x8000000000000000U
> > +#define EFIERR_OEM(a)       (0xc000000000000000U | a)
> >
> > -#define BAD_POINTER         0xFBFBFBFBFBFBFBFB
> > -#define MAX_ADDRESS         0xFFFFFFFFFFFFFFFF
> > +#define BAD_POINTER         0xFBFBFBFBFBFBFBFBU
> > +#define MAX_ADDRESS         0xFFFFFFFFFFFFFFFFU
> >
> >   #define EFI_STUB_ERROR      MAX_ADDRESS
> >
> > diff --git a/xen/arch/arm/include/asm/arm64/insn.h
> b/xen/arch/arm/include/asm/arm64/insn.h
> > index 4e0d364d41..b522b07bf5 100644
> > --- a/xen/arch/arm/include/asm/arm64/insn.h
> > +++ b/xen/arch/arm/include/asm/arm64/insn.h
> > @@ -60,14 +60,14 @@ static always_inline bool aarch64_insn_is_##abbr(u32
> code) \
> >   static always_inline u32 aarch64_insn_get_##abbr##_value(void) \
> >   { return (val); }
> >
> > -__AARCH64_INSN_FUNCS(b,              0xFC000000, 0x14000000)
> > -__AARCH64_INSN_FUNCS(bl,     0xFC000000, 0x94000000)
> > -__AARCH64_INSN_FUNCS(cbz,    0x7F000000, 0x34000000)
> > -__AARCH64_INSN_FUNCS(cbnz,   0x7F000000, 0x35000000)
> > -__AARCH64_INSN_FUNCS(tbz,    0x7F000000, 0x36000000)
> > -__AARCH64_INSN_FUNCS(tbnz,   0x7F000000, 0x37000000)
> > -__AARCH64_INSN_FUNCS(bcond,  0xFF000010, 0x54000000)
> > -__AARCH64_INSN_FUNCS(hint,   0xFFFFF01F, 0xD503201F)
> > +__AARCH64_INSN_FUNCS(b,              0xFC000000U, 0x14000000)
>
> I am guessing you are only adding the U when the top bit is '1' so it
> could be misinterpreted. But really, we should use 'U' everywhere a
> value is meant to be interpreted as an unsigned value as this is easier
> to apply for a contributor.
>

In the next patch, I will put 'U' on all the calls above.


>
> In any case, I think your approach should be outline in the commit
> message because I would consider your approach not homogenous as this is
> claimed in the commit message.
>
>
Yes, I will do it.


> > +__AARCH64_INSN_FUNCS(bl,     0xFC000000U, 0x94000000U)
> > +__AARCH64_INSN_FUNCS(cbz,    0x7F000000U, 0x34000000)
> > +__AARCH64_INSN_FUNCS(cbnz,   0x7F000000U, 0x35000000)
> > +__AARCH64_INSN_FUNCS(tbz,    0x7F000000U, 0x36000000)
> > +__AARCH64_INSN_FUNCS(tbnz,   0x7F000000U, 0x37000000)
> > +__AARCH64_INSN_FUNCS(bcond,  0xFF000010U, 0x54000000)
> > +__AARCH64_INSN_FUNCS(hint,   0xFFFFF01FU, 0xD503201FU)
> >
> >   bool aarch64_insn_is_branch_imm(u32 insn);
> >
> > diff --git a/xen/arch/arm/include/asm/vreg.h
> b/xen/arch/arm/include/asm/vreg.h
> > index bf945eebbd..387ce76e7e 100644
> > --- a/xen/arch/arm/include/asm/vreg.h
> > +++ b/xen/arch/arm/include/asm/vreg.h
> > @@ -56,7 +56,7 @@ static inline bool vreg_emulate_cp64(struct
> cpu_user_regs *regs, union hsr hsr,
> >
> >       if ( ret && cp64.read )
> >       {
> > -        set_user_reg(regs, cp64.reg1, x & 0xffffffff);
> > +        set_user_reg(regs, cp64.reg1, x & 0xffffffffU);
> >           set_user_reg(regs, cp64.reg2, x >> 32);
> >       }
> >
> > diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> > index ca5318515e..508c54824d 100644
> > --- a/xen/arch/arm/kernel.c
> > +++ b/xen/arch/arm/kernel.c
> > @@ -39,7 +39,7 @@ struct minimal_dtb_header {
> >       /* There are other fields but we don't use them yet. */
> >   };
> >
> > -#define DTB_MAGIC 0xd00dfeed
> > +#define DTB_MAGIC 0xd00dfeedU
> >
> >   /**
> >    * copy_from_paddr - copy data from a physical address
> > diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> > index ef5c6a8195..def92fafae 100644
> > --- a/xen/arch/arm/traps.c
> > +++ b/xen/arch/arm/traps.c
> > @@ -398,7 +398,7 @@ static vaddr_t exception_handler32(vaddr_t offset)
> >       register_t sctlr = READ_SYSREG(SCTLR_EL1);
> >
> >       if ( sctlr & SCTLR_A32_EL1_V )
> > -        return 0xffff0000 + offset;
> > +        return 0xffff0000U + offset;
> >       else /* always have security exceptions */
> >           return READ_SYSREG(VBAR_EL1) + offset;
> >   }
> > @@ -809,7 +809,7 @@ static void show_registers_32(const struct
> cpu_user_regs *regs,
> >   #ifdef CONFIG_ARM_64
> >                  (uint32_t)(ctxt->far >> 32),
> >                  ctxt->ifsr32_el2,
> > -               (uint32_t)(ctxt->far & 0xffffffff),
> > +               (uint32_t)(ctxt->far & 0xffffffffU),
> >                  ctxt->esr_el1
> >   #else
> >                  ctxt->ifar, ctxt->ifsr, ctxt->dfar, ctxt->dfsr
> > diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> > index 0b083c33e6..35363fee09 100644
> > --- a/xen/arch/arm/vgic-v2.c
> > +++ b/xen/arch/arm/vgic-v2.c
> > @@ -306,7 +306,7 @@ static int vgic_v2_distr_mmio_read(struct vcpu *v,
> mmio_info_t *info,
> >       case VREG32(GICD_SGIR):
> >           if ( dabt.size != DABT_WORD ) goto bad_width;
> >           /* Write only -- read unknown */
> > -        *r = 0xdeadbeef;
> > +        *r = 0xdeadbeefU;
> >           return 1;
> >
> >       case VRANGE32(0xF04, 0xF0C):
> > diff --git a/xen/include/public/arch-arm/smccc.h
> b/xen/include/public/arch-arm/smccc.h
> > index 802d800aad..8553f2f39e 100644
> > --- a/xen/include/public/arch-arm/smccc.h
> > +++ b/xen/include/public/arch-arm/smccc.h
> > @@ -26,16 +26,16 @@
> >   #define XEN_SMCCC_MINOR_REVISION 1
> >
> >   /* Hypervisor Service UID. Randomly generated with uuidgen. */
> > -#define XEN_SMCCC_UID XEN_DEFINE_UUID(0xa71812dc, 0xc698, 0x4369,
> 0x9acf, \
> > -                                      0x79, 0xd1, 0x8d, 0xde, 0xe6,
> 0x67)
> > +#define XEN_SMCCC_UID XEN_DEFINE_UUID(0xa71812dcU, 0xc698U, 0x4369U,
> 0x9acfU, \
> > +                                      0x79U, 0xd1U, 0x8dU, 0xdeU,
> 0xe6U, 0x67U)
> >
> >   /* Standard Service Service Call version. */
> >   #define SSSC_SMCCC_MAJOR_REVISION 0
> >   #define SSSC_SMCCC_MINOR_REVISION 1
> >
> >   /* Standard Service Call UID. Randomly generated with uuidgen. */
> > -#define SSSC_SMCCC_UID XEN_DEFINE_UUID(0xf863386f, 0x4b39, 0x4cbd,
> 0x9220,\
> > -                                       0xce, 0x16, 0x41, 0xe5, 0x9f,
> 0x6f)
> > +#define SSSC_SMCCC_UID XEN_DEFINE_UUID(0xf863386fU, 0x4b39U, 0x4cbdU,
> 0x9220U,\
> > +                                       0xceU, 0x16U, 0x41U, 0xe5U,
> 0x9fU, 0x6fU)
> >
> >   #endif /* __XEN_PUBLIC_ARCH_ARM_SMCCC_H__ */
> >
>
> Cheers,
> --
> Julien Grall
>


-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--00000000000009cce505fe8fa452
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno mar 20 giu 2023 alle ore=
 13:03 Julien Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a=
>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi,<br>
<br>
On 20/06/2023 11:34, Simone Ballarin wrote:<br>
&gt; From: Gianluca Luparini &lt;<a href=3D"mailto:gianluca.luparini@bugsen=
g.com" target=3D"_blank">gianluca.luparini@bugseng.com</a>&gt;<br>
<br>
Is this person the original author of this patch? If so...<br>
<br>
&gt; <br>
&gt; The xen sources contains violations of MISRA C:2012 Rule 7.2 whose hea=
dline states:<br>
&gt; &quot;A &quot;u&quot; or &quot;U&quot; suffix shall be applied to all =
integer constants that are represented in an unsigned type&quot;.<br>
&gt; <br>
&gt; I propose to use &quot;U&quot; as a suffix to explicitly state when an=
 integer constant is represented in an unsigned type.<br>
&gt; For homogeneity, I also added the &quot;U&quot; suffix in some cases t=
hat the tool didn&#39;t report as violations.<br>
<br>
OOI, why would the tool not report all of them? And how did you decide <br>
when to add them?<br></blockquote><div>=C2=A0</div>The MISRA rule asks for =
a U suffix only on integer literals that have unsigned standard type.</div>=
<div class=3D"gmail_quote">This means that if the literal can be stored in =
a signed int there is no violation. <br></div><div class=3D"gmail_quote">Yo=
u are right that the sentence was poorly formulated: it will be clearer in =
v2 of the patch series.<br><br>Appending the U suffix to all positive integ=
er literals is not safe in general as it may change the semantics of the co=
de.</div><div class=3D"gmail_quote">For uniformity, we tried to put the suf=
fix also on integers used in the same contexts or near violations, when the=
ir positive</div><div class=3D"gmail_quote">nature was immediately clear.<d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
<br>
... the signed-off is missing here.<br></blockquote><div>=C2=A0</div><div>C=
opy. The next patches will also contain the missing signed-offs. <br></div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Signed-off-by: Simone Ballarin &lt;<a href=3D"mailto:simone.ballarin@b=
ugseng.com" target=3D"_blank">simone.ballarin@bugseng.com</a>&gt;<br>
<br>
Yours should still be kept as you are sending the patch.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/domain_build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/efi/efi-boot.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/gic-v2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/include/asm/arm64/brk.h=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/include/asm/arm64/efibind.h | 10 +++++-----<b=
r>
&gt;=C2=A0 =C2=A0xen/arch/arm/include/asm/arm64/insn.h=C2=A0 =C2=A0 | 16 ++=
++++++--------<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/include/asm/vreg.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/kernel.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/traps.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/vgic-v2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0xen/include/public/arch-arm/smccc.h=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 8 ++++----<br>
&gt;=C2=A0 =C2=A011 files changed, 28 insertions(+), 28 deletions(-)<br>
&gt; <br>
&gt; diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c=
<br>
&gt; index d0d6be922d..78261352a6 100644<br>
&gt; --- a/xen/arch/arm/domain_build.c<br>
&gt; +++ b/xen/arch/arm/domain_build.c<br>
&gt; @@ -3752,7 +3752,7 @@ static int __init construct_domain(struct domain=
 *d, struct kernel_info *kinfo)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regs-&gt;r0 =3D 0; /* SBZ */<b=
r>
<br>
Above, you said you want to be consistent when you use U. So I was <br>
expecting this would be 0U. Is this an oversight? If not, can you <br>
outline in which case &#39;U&#39; can be ignored?<br></blockquote><div><br>=
</div><div>According to the rule &#39;U&#39; is required only if the litera=
l has unsigned standard type,</div><div>and this is not the case.<br></div>=
<div>But, I agree with you that, in this case, for consistency, it should b=
e added.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 regs-&gt;r1 =3D 0xffffffff; /* We use DTB=
 therefore no machine id */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 regs-&gt;r1 =3D 0xffffffffU; /* We use DT=
B therefore no machine id */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regs-&gt;r2 =3D kinfo-&gt;dtb_=
paddr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0#ifdef CONFIG_ARM_64<br>
&gt; diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h=
<br>
&gt; index bb64925d70..585332647d 100644<br>
&gt; --- a/xen/arch/arm/efi/efi-boot.h<br>
&gt; +++ b/xen/arch/arm/efi/efi-boot.h<br>
&gt; @@ -46,7 +46,7 @@ static int get_module_file_index(const char *name, u=
nsigned int name_len);<br>
&gt;=C2=A0 =C2=A0static void PrintMessage(const CHAR16 *s);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#define DEVICE_TREE_GUID \<br>
&gt; -{0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xa=
a, 0xe0}}<br>
&gt; +{0xb1b621d5U, 0xf19cU, 0x41a5U, {0x83U, 0x0bU, 0xd9U, 0x15U, 0x2cU, 0=
x69U, 0xaaU, 0xe0U}}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static struct file __initdata dtbfile;<br>
&gt;=C2=A0 =C2=A0static void __initdata *fdt;<br>
&gt; diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c<br>
&gt; index 6476ff4230..191c89b01b 100644<br>
&gt; --- a/xen/arch/arm/gic-v2.c<br>
&gt; +++ b/xen/arch/arm/gic-v2.c<br>
&gt; @@ -386,9 +386,9 @@ static void gicv2_cpu_init(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The first 32 interrupts (PPI and SGI) are=
 banked per-cpu, so<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * even though they are controlled with GICD=
 registers, they must<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * be set up here with the other per-cpu sta=
te. */<br>
&gt; -=C2=A0 =C2=A0 writel_gicd(0xffffffff, GICD_ICACTIVER); /* Diactivate =
PPIs and SGIs */<br>
&gt; -=C2=A0 =C2=A0 writel_gicd(0xffff0000, GICD_ICENABLER); /* Disable all=
 PPI */<br>
&gt; -=C2=A0 =C2=A0 writel_gicd(0x0000ffff, GICD_ISENABLER); /* Enable all =
SGI */<br>
&gt; +=C2=A0 =C2=A0 writel_gicd(0xffffffffU, GICD_ICACTIVER); /* Diactivate=
 PPIs and SGIs */<br>
<br>
Can you take the opportunity to fix the typo s/Diactivate/De-activate/?<br>=
</blockquote><div><br></div><div>Yes.</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 writel_gicd(0xffff0000U, GICD_ICENABLER); /* Disable al=
l PPI */<br>
&gt; +=C2=A0 =C2=A0 writel_gicd(0x0000ffffU, GICD_ISENABLER); /* Enable all=
 SGI */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set SGI priorities */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for ( i =3D 0; i &lt; 16; i +=3D 4 )<br>
&gt; diff --git a/xen/arch/arm/include/asm/arm64/brk.h b/xen/arch/arm/inclu=
de/asm/arm64/brk.h<br>
&gt; index 04442c4b9f..3af153a053 100644<br>
&gt; --- a/xen/arch/arm/include/asm/arm64/brk.h<br>
&gt; +++ b/xen/arch/arm/include/asm/arm64/brk.h<br>
&gt; @@ -21,7 +21,7 @@<br>
&gt;=C2=A0 =C2=A0 * BRK instruction encoding<br>
&gt;=C2=A0 =C2=A0 * The #imm16 value should be placed at bits[20:5] within =
BRK ins<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt; -#define AARCH64_BREAK_MON 0xd4200000<br>
&gt; +#define AARCH64_BREAK_MON 0xd4200000U<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 * BRK instruction for provoking a fault on purpose<br>
&gt; diff --git a/xen/arch/arm/include/asm/arm64/efibind.h b/xen/arch/arm/i=
nclude/asm/arm64/efibind.h<br>
&gt; index 8b43bb8495..0e890b666d 100644<br>
&gt; --- a/xen/arch/arm/include/asm/arm64/efibind.h<br>
&gt; +++ b/xen/arch/arm/include/asm/arm64/efibind.h<br>
&gt; @@ -22,12 +22,12 @@ Revision History<br>
&gt;=C2=A0 =C2=A0#pragma pack()<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -#define EFIERR(a)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x80000000=
00000000 | a)<br>
&gt; -#define EFI_ERROR_MASK=C2=A0 =C2=A0 =C2=A0 0x8000000000000000<br>
&gt; -#define EFIERR_OEM(a)=C2=A0 =C2=A0 =C2=A0 =C2=A0(0xc000000000000000 |=
 a)<br>
&gt; +#define EFIERR(a)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x80000000=
00000000U | a)<br>
&gt; +#define EFI_ERROR_MASK=C2=A0 =C2=A0 =C2=A0 0x8000000000000000U<br>
&gt; +#define EFIERR_OEM(a)=C2=A0 =C2=A0 =C2=A0 =C2=A0(0xc000000000000000U =
| a)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -#define BAD_POINTER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFBFBFBFBFBFBFB=
FB<br>
&gt; -#define MAX_ADDRESS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFFFFFFFFFFFFFF=
FF<br>
&gt; +#define BAD_POINTER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFBFBFBFBFBFBFB=
FBU<br>
&gt; +#define MAX_ADDRESS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFFFFFFFFFFFFFF=
FFU<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#define EFI_STUB_ERROR=C2=A0 =C2=A0 =C2=A0 MAX_ADDRESS<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/xen/arch/arm/include/asm/arm64/insn.h b/xen/arch/arm/incl=
ude/asm/arm64/insn.h<br>
&gt; index 4e0d364d41..b522b07bf5 100644<br>
&gt; --- a/xen/arch/arm/include/asm/arm64/insn.h<br>
&gt; +++ b/xen/arch/arm/include/asm/arm64/insn.h<br>
&gt; @@ -60,14 +60,14 @@ static always_inline bool aarch64_insn_is_##abbr(u=
32 code) \<br>
&gt;=C2=A0 =C2=A0static always_inline u32 aarch64_insn_get_##abbr##_value(v=
oid) \<br>
&gt;=C2=A0 =C2=A0{ return (val); }<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -__AARCH64_INSN_FUNCS(b,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0xFC000000, 0x14000000)<br>
&gt; -__AARCH64_INSN_FUNCS(bl,=C2=A0 =C2=A0 =C2=A00xFC000000, 0x94000000)<b=
r>
&gt; -__AARCH64_INSN_FUNCS(cbz,=C2=A0 =C2=A0 0x7F000000, 0x34000000)<br>
&gt; -__AARCH64_INSN_FUNCS(cbnz,=C2=A0 =C2=A00x7F000000, 0x35000000)<br>
&gt; -__AARCH64_INSN_FUNCS(tbz,=C2=A0 =C2=A0 0x7F000000, 0x36000000)<br>
&gt; -__AARCH64_INSN_FUNCS(tbnz,=C2=A0 =C2=A00x7F000000, 0x37000000)<br>
&gt; -__AARCH64_INSN_FUNCS(bcond,=C2=A0 0xFF000010, 0x54000000)<br>
&gt; -__AARCH64_INSN_FUNCS(hint,=C2=A0 =C2=A00xFFFFF01F, 0xD503201F)<br>
&gt; +__AARCH64_INSN_FUNCS(b,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0xFC000000U, 0x14000000)<br>
<br>
I am guessing you are only adding the U when the top bit is &#39;1&#39; so =
it <br>
could be misinterpreted. But really, we should use &#39;U&#39; everywhere a=
 <br>
value is meant to be interpreted as an unsigned value as this is easier <br=
>
to apply for a contributor.<br></blockquote><div><br></div>In the next patc=
h, I will put &#39;U&#39; on all the calls above.<br><div>=C2=A0<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
In any case, I think your approach should be outline in the commit <br>
message because I would consider your approach not homogenous as this is <b=
r>
claimed in the commit message.<br>
<br></blockquote><div><br></div><div>Yes, I will do it.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +__AARCH64_INSN_FUNCS(bl,=C2=A0 =C2=A0 =C2=A00xFC000000U, 0x94000000U)=
<br>
&gt; +__AARCH64_INSN_FUNCS(cbz,=C2=A0 =C2=A0 0x7F000000U, 0x34000000)<br>
&gt; +__AARCH64_INSN_FUNCS(cbnz,=C2=A0 =C2=A00x7F000000U, 0x35000000)<br>
&gt; +__AARCH64_INSN_FUNCS(tbz,=C2=A0 =C2=A0 0x7F000000U, 0x36000000)<br>
&gt; +__AARCH64_INSN_FUNCS(tbnz,=C2=A0 =C2=A00x7F000000U, 0x37000000)<br>
&gt; +__AARCH64_INSN_FUNCS(bcond,=C2=A0 0xFF000010U, 0x54000000)<br>
&gt; +__AARCH64_INSN_FUNCS(hint,=C2=A0 =C2=A00xFFFFF01FU, 0xD503201FU)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0bool aarch64_insn_is_branch_imm(u32 insn);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/as=
m/vreg.h<br>
&gt; index bf945eebbd..387ce76e7e 100644<br>
&gt; --- a/xen/arch/arm/include/asm/vreg.h<br>
&gt; +++ b/xen/arch/arm/include/asm/vreg.h<br>
&gt; @@ -56,7 +56,7 @@ static inline bool vreg_emulate_cp64(struct cpu_user=
_regs *regs, union hsr hsr,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if ( ret &amp;&amp; cp64.read )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_user_reg(regs, cp64.reg1, x &amp; 0xf=
fffffff);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_user_reg(regs, cp64.reg1, x &amp; 0xf=
fffffffU);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_user_reg(regs, cp64.reg2, =
x &gt;&gt; 32);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c<br>
&gt; index ca5318515e..508c54824d 100644<br>
&gt; --- a/xen/arch/arm/kernel.c<br>
&gt; +++ b/xen/arch/arm/kernel.c<br>
&gt; @@ -39,7 +39,7 @@ struct minimal_dtb_header {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* There are other fields but we don&#39;t u=
se them yet. */<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -#define DTB_MAGIC 0xd00dfeed<br>
&gt; +#define DTB_MAGIC 0xd00dfeedU<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 * copy_from_paddr - copy data from a physical address<br>
&gt; diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c<br>
&gt; index ef5c6a8195..def92fafae 100644<br>
&gt; --- a/xen/arch/arm/traps.c<br>
&gt; +++ b/xen/arch/arm/traps.c<br>
&gt; @@ -398,7 +398,7 @@ static vaddr_t exception_handler32(vaddr_t offset)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0register_t sctlr =3D READ_SYSREG(SCTLR_EL1);=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if ( sctlr &amp; SCTLR_A32_EL1_V )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0xffff0000 + offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0xffff0000U + offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else /* always have security exceptions */<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return READ_SYSREG(VBAR_EL1) +=
 offset;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; @@ -809,7 +809,7 @@ static void show_registers_32(const struct cpu_use=
r_regs *regs,<br>
&gt;=C2=A0 =C2=A0#ifdef CONFIG_ARM_64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (uint32_=
t)(ctxt-&gt;far &gt;&gt; 32),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctxt-&gt=
;ifsr32_el2,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uint32_t)(ctx=
t-&gt;far &amp; 0xffffffff),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uint32_t)(ctx=
t-&gt;far &amp; 0xffffffffU),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctxt-&gt=
;esr_el1<br>
&gt;=C2=A0 =C2=A0#else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctxt-&gt=
;ifar, ctxt-&gt;ifsr, ctxt-&gt;dfar, ctxt-&gt;dfsr<br>
&gt; diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c<br>
&gt; index 0b083c33e6..35363fee09 100644<br>
&gt; --- a/xen/arch/arm/vgic-v2.c<br>
&gt; +++ b/xen/arch/arm/vgic-v2.c<br>
&gt; @@ -306,7 +306,7 @@ static int vgic_v2_distr_mmio_read(struct vcpu *v,=
 mmio_info_t *info,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case VREG32(GICD_SGIR):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( dabt.size !=3D DABT_WORD =
) goto bad_width;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Write only -- read unknown =
*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *r =3D 0xdeadbeef;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *r =3D 0xdeadbeefU;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case VRANGE32(0xF04, 0xF0C):<br>
&gt; diff --git a/xen/include/public/arch-arm/smccc.h b/xen/include/public/=
arch-arm/smccc.h<br>
&gt; index 802d800aad..8553f2f39e 100644<br>
&gt; --- a/xen/include/public/arch-arm/smccc.h<br>
&gt; +++ b/xen/include/public/arch-arm/smccc.h<br>
&gt; @@ -26,16 +26,16 @@<br>
&gt;=C2=A0 =C2=A0#define XEN_SMCCC_MINOR_REVISION 1<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* Hypervisor Service UID. Randomly generated with uuidgen=
. */<br>
&gt; -#define XEN_SMCCC_UID XEN_DEFINE_UUID(0xa71812dc, 0xc698, 0x4369, 0x9=
acf, \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x79, 0xd1,=
 0x8d, 0xde, 0xe6, 0x67)<br>
&gt; +#define XEN_SMCCC_UID XEN_DEFINE_UUID(0xa71812dcU, 0xc698U, 0x4369U, =
0x9acfU, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x79U, 0xd1=
U, 0x8dU, 0xdeU, 0xe6U, 0x67U)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* Standard Service Service Call version. */<br>
&gt;=C2=A0 =C2=A0#define SSSC_SMCCC_MAJOR_REVISION 0<br>
&gt;=C2=A0 =C2=A0#define SSSC_SMCCC_MINOR_REVISION 1<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* Standard Service Call UID. Randomly generated with uuid=
gen. */<br>
&gt; -#define SSSC_SMCCC_UID XEN_DEFINE_UUID(0xf863386f, 0x4b39, 0x4cbd, 0x=
9220,\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xce,=
 0x16, 0x41, 0xe5, 0x9f, 0x6f)<br>
&gt; +#define SSSC_SMCCC_UID XEN_DEFINE_UUID(0xf863386fU, 0x4b39U, 0x4cbdU,=
 0x9220U,\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xceU=
, 0x16U, 0x41U, 0xe5U, 0x9fU, 0x6fU)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#endif /* __XEN_PUBLIC_ARCH_ARM_SMCCC_H__ */<br>
&gt;=C2=A0 =C2=A0<br>
<br>
Cheers,<br>
-- <br>
Julien Grall<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">Simone Ballarin, M.Sc.<br><br><div>Field Application Engineer, BUGSENG =
(<a href=3D"http://bugseng.com" target=3D"_blank">https://bugseng.com</a>)<=
/div></div></div></div>

--00000000000009cce505fe8fa452--

