Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0588846303F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 10:50:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234944.407659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrzlv-00055z-M7; Tue, 30 Nov 2021 09:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234944.407659; Tue, 30 Nov 2021 09:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrzlv-00054C-IP; Tue, 30 Nov 2021 09:49:59 +0000
Received: by outflank-mailman (input) for mailman id 234944;
 Tue, 30 Nov 2021 09:49:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nk0L=QR=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1mrzlu-000546-4b
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 09:49:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id df370343-51c2-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 10:49:55 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0FBD1063;
 Tue, 30 Nov 2021 01:49:54 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 891773F694;
 Tue, 30 Nov 2021 01:49:53 -0800 (PST)
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
X-Inumbo-ID: df370343-51c2-11ec-976b-d102b41d0961
Date: Tue, 30 Nov 2021 09:49:50 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <stefanos@xilinx.com>, <julien@xen.org>, <Volodymyr_Babchuk@epam.com>,
 <bertrand.marquis@arm.com>, <jbeulich@suse.com>, Ayan Kumar Halder
 <ayankuma@xilinx.com>
Subject: Re: [XEN v2] xen/arm64: io: Decode 32-bit ldr/str post-indexing
 instructions
Message-ID: <20211130094950.1bf368d6@donnerap.cambridge.arm.com>
In-Reply-To: <20211129191638.19877-1-ayankuma@xilinx.com>
References: <20211129191638.19877-1-ayankuma@xilinx.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Nov 2021 19:16:38 +0000
Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:

Hi,

> At the moment, Xen is only handling data abort with valid syndrome (i.e.
> ISV=3D0). Unfortunately, this doesn't cover all the instructions a domain
> could use to access MMIO regions.
>=20
> For instance, Xilinx baremetal OS will use:
>=20
>         volatile u32 *LocalAddr =3D (volatile u32 *)Addr;
>         *LocalAddr =3D Value;
>=20
> This leave the compiler to decide which store instructions to use.

As mentioned in the other email, this is wrong, if this points to MMIO:
don't let the compiler do MMIO accesses. If a stage 2 fault isn't in
an MMIO area, you should not see traps that you cannot handle already.

So I don't think it's a good idea to use that as an example. And since
this patch only seems to address this use case, I would doubt its
usefulness in general.

> This
> may be a post-index store instruction where the HW will not provide a
> valid syndrome.
>=20
> In order to handle post-indexing store/load instructions, Xen will need
> to fetch and decode the instruction.
>=20
> This patch only cover post-index store/load instructions from AArch64
> mode. For now, this is left unimplemented for trap from AArch32 mode.
>=20
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> ---
>=20
> Changelog :-
>=20
> v2 :- 1. Updated the rn register after reading from it. (Pointed by
> Julien, Stefano)
> 2. Used a union to represent the instruction opcode (Suggestd by
> Bertrand) 3. Fixed coding style issues (Pointed by Julien)
> 4. In the previous patch, I was updating dabt->sign based on the
> signedness of imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI
> 0487G.b, Page 3221, SSE indicates the signedness of the data item
> loaded. In our case, the data item loaded is always unsigned.
>=20
> This has been tested for the following cases :-
> ldr x2, [x1], #4

As Jan already mentioned: this is a bad example. First, this is a 64-bit
access, which you don't emulate below. And second, you want to keep the
pointer aligned. Unaligned accesses to device memory always trap, as per
the architecture, even on bare metal.

>=20
> ldr w2, [x1], #-4
>=20
> str x2, [x1], #4

Same as above.

> str w2, [x1], #-4
>=20
> The reason being  I am testing on 32bit MMIO registers only. I don't see
> a 8bit or 16bit MMIO register.

Where did you look? There are plenty of examples out there, even the GIC
allows 8-bit accesses to certain registers (grep for "VGIC_ACCESS_"), and
the Linux GIC driver is using them (but with proper accessors, of course).
Also GICv3 supports 64-bit accesses to some registers. Some PL011 UARTs use
16-bit MMIO accesses.

>  xen/arch/arm/decode.c     | 68 ++++++++++++++++++++++++++++++++++++++-
>  xen/arch/arm/decode.h     |  3 +-
>  xen/arch/arm/io.c         | 40 +++++++++++++++++++----
>  xen/include/asm-arm/hsr.h | 26 +++++++++++++++
>  4 files changed, 129 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> index 792c2e92a7..0b3e8fcbc6 100644
> --- a/xen/arch/arm/decode.c
> +++ b/xen/arch/arm/decode.c
> @@ -84,6 +84,66 @@ bad_thumb2:
>      return 1;
>  }
> =20
> +static int decode_32bit_loadstore_postindexing(register_t pc,
> +                                               struct hsr_dabt *dabt,
> +                                               union ldr_str_instr_class=
 *instr)
> +{
> +    if ( raw_copy_from_guest(&instr->value, (void * __user)pc, sizeof (i=
nstr)) )
> +        return -EFAULT;
> +
> +    /* First, let's check for the fixed values */
> +    if ( !((instr->code.fixed1 =3D=3D 1) && (instr->code.fixed2 =3D=3D 0=
) &&
> +         (instr->code.fixed3 =3D=3D 0) && (instr->code.fixed4 =3D=3D 7))=
 )
> +    {
> +        gprintk(XENLOG_ERR, "Decoding not supported for instructions oth=
er than"
> +            " ldr/str post indexing\n");
> +        goto bad_32bit_loadstore;
> +    }
> +
> +    if ( instr->code.size !=3D 2 )

I don't see a good reason for this limitation. If you are going to dissect
the instruction, why not just support at least all access widths, so
64-bits, but also {ldr,str}{b,w}? I think the framework does the heavy
lifting for you already?
Same for the restriction to post-index above, supporting pre-index as well
should be easy.

To me this has the bitter taste for being a one trick pony to work around
your particular (broken!) use case.

> +    {
> +        gprintk(XENLOG_ERR,
> +            "ldr/str post indexing is supported for 32 bit variant only\=
n");
> +        goto bad_32bit_loadstore;
> +    }
> +
> +    if ( instr->code.v !=3D 0 )
> +    {
> +        gprintk(XENLOG_ERR,
> +            "ldr/str post indexing for vector types are not supported\n"=
);
> +        goto bad_32bit_loadstore;
> +    }
> +
> +    /* Check for STR (immediate) - 32 bit variant */
> +    if ( instr->code.opc =3D=3D 0 )
> +    {
> +        dabt->write =3D 1;
> +    }
> +    /* Check for LDR (immediate) - 32 bit variant */
> +    else if ( instr->code.opc =3D=3D 1 )
> +    {
> +        dabt->write =3D 0;
> +    }
> +    else
> +    {
> +        gprintk(XENLOG_ERR,
> +            "Decoding ldr/str post indexing is not supported for this va=
riant\n");
> +        goto bad_32bit_loadstore;
> +    }
> +
> +    gprintk(XENLOG_INFO,
> +        "instr->code.rt =3D 0x%x, instr->code.size =3D 0x%x, instr->code=
.imm9 =3D %d\n",
> +        instr->code.rt, instr->code.size, instr->code.imm9);
> +
> +    update_dabt(dabt, instr->code.rt, instr->code.size, false);
> +    dabt->valid =3D 1;
> +
> +    return 0;
> +bad_32bit_loadstore:
> +    gprintk(XENLOG_ERR, "unhandled 32bit Arm instruction 0x%x\n", instr-=
>value);
> +    return 1;
> +}
> +
>  static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
>  {
>      uint16_t instr;
> @@ -150,11 +210,17 @@ bad_thumb:
>      return 1;
>  }
> =20
> -int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt=
 *dabt)
> +int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt=
 *dabt,
> +                       union ldr_str_instr_class *instr)
>  {
>      if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
>          return decode_thumb(regs->pc, dabt);
> =20
> +    if ( (is_64bit_domain(current->domain) && !psr_mode_is_32bit(regs)) )
> +    {
> +        return decode_32bit_loadstore_postindexing(regs->pc, dabt, instr=
);
> +    }
> +
>      /* TODO: Handle ARM instruction */
>      gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
> =20
> diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
> index 4613763bdb..d82fc4a0f6 100644
> --- a/xen/arch/arm/decode.h
> +++ b/xen/arch/arm/decode.h
> @@ -35,7 +35,8 @@
>   */
> =20
>  int decode_instruction(const struct cpu_user_regs *regs,
> -                       struct hsr_dabt *dabt);
> +                       struct hsr_dabt *dabt,
> +                       union ldr_str_instr_class *instr);
> =20
>  #endif /* __ARCH_ARM_DECODE_H_ */
> =20
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 729287e37c..0d60754bc4 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -65,6 +65,16 @@ static enum io_state handle_write(const struct
> mmio_handler *handler, return ret ? IO_HANDLED : IO_ABORT;
>  }
> =20
> +static void post_incremenet_register(union ldr_str_instr_class *instr)
> +{
> +    struct cpu_user_regs *regs =3D guest_cpu_user_regs();
> +    unsigned int val;
> +
> +    val =3D get_user_reg(regs, instr->code.rn);
> +    val +=3D instr->code.imm9;
> +    set_user_reg(regs, instr->code.rn, val);
> +}
> +
>  /* This function assumes that mmio regions are not overlapped */
>  static int cmp_mmio_handler(const void *key, const void *elem)
>  {
> @@ -106,14 +116,26 @@ enum io_state try_handle_mmio(struct cpu_user_regs
> *regs, .gpa =3D gpa,
>          .dabt =3D dabt
>      };
> +    int rc;
> +    union ldr_str_instr_class instr =3D {0};
> =20
>      ASSERT(hsr.ec =3D=3D HSR_EC_DATA_ABORT_LOWER_EL);
> =20
> +    /*
> +     * Armv8 processor does not provide a valid syndrome for post-indexi=
ng
> +     * ldr/str instructions. So in order to process these instructions,
> +     * Xen must decode them.
> +     */
> +    if ( !info.dabt.valid )
> +    {
> +        rc =3D decode_instruction(regs, &info.dabt, &instr);
> +        if ( rc )
> +            return IO_ABORT;
> +    }
> +
>      handler =3D find_mmio_handler(v->domain, info.gpa);
>      if ( !handler )
>      {
> -        int rc;
> -
>          rc =3D try_fwd_ioserv(regs, v, &info);
>          if ( rc =3D=3D IO_HANDLED )
>              return handle_ioserv(regs, v);
> @@ -122,7 +144,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs
> *regs, }
> =20
>      /* All the instructions used on emulated MMIO region should be
> valid */
> -    if ( !dabt.valid )
> +    if ( !info.dabt.valid )
>          return IO_ABORT;
> =20
>      /*
> @@ -134,7 +156,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs
> *regs, {
>          int rc;
> =20
> -        rc =3D decode_instruction(regs, &info.dabt);
> +        rc =3D decode_instruction(regs, &info.dabt, NULL);
>          if ( rc )
>          {
>              gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> @@ -143,9 +165,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs
> *regs, }
> =20
>      if ( info.dabt.write )
> -        return handle_write(handler, v, &info);
> +        rc =3D handle_write(handler, v, &info);
>      else
> -        return handle_read(handler, v, &info);
> +        rc =3D handle_read(handler, v, &info);
> +
> +    if ( instr.value !=3D 0 )
> +    {
> +        post_incremenet_register(&instr);
> +    }
> +    return rc;
>  }
> =20
>  void register_mmio_handler(struct domain *d,
> diff --git a/xen/include/asm-arm/hsr.h b/xen/include/asm-arm/hsr.h
> index 9b91b28c48..72d67d2801 100644
> --- a/xen/include/asm-arm/hsr.h
> +++ b/xen/include/asm-arm/hsr.h
> @@ -15,6 +15,32 @@ enum dabt_size {
>      DABT_DOUBLE_WORD =3D 3,
>  };
> =20
> +/*
> + * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
> + * Page 318 specifies the following bit pattern for
> + * "load/store register (immediate post-indexed)".
> + *
> + * 31 30 29  27 26 25  23   21 20              11   9         4       0
> + * ___________________________________________________________________
> + * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
> + * |____|______|__|____|____|__|_______________|____|_________|_______|
> + */
> +union ldr_str_instr_class {
> +    uint32_t value;
> +    struct ldr_str {
> +        unsigned int rt:5;     /* Rt register */

I don't think it's a particular good idea to use a bit-field here, if that
is expected to mimic a certain hardware provided bit pattern.
It works in practise (TM), but the C standard does not guarantee the order
the bits are allocated (ISO/IEC 9899:201x =C2=A76.7.2.1, stanza 11).
Since you are *reading* only from the instruction word, you should get away
with accessor macros to extract the bits you need. For instance for
filtering the opcode, you could use: ((insn & 0x3fe00c00) =3D=3D 0x38400400)

Cheers,
Andre

> +        unsigned int rn:5;     /* Rn register */
> +        unsigned int fixed1:2; /* value =3D=3D 01b */
> +        int imm9:9;            /* imm9 */
> +        unsigned int fixed2:1; /* value =3D=3D 0b */
> +        unsigned int opc:2;    /* opc */
> +        unsigned int fixed3:2; /* value =3D=3D 00b */
> +        unsigned int v:1;      /* vector */
> +        unsigned int fixed4:3; /* value =3D=3D 111b */
> +        unsigned int size:2;   /* size */
> +    } code;
> +};
> +
>  union hsr {
>      register_t bits;
>      struct {


