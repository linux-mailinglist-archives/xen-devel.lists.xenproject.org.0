Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6660F464C66
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 12:12:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235891.409164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNWo-0007Gr-Va; Wed, 01 Dec 2021 11:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235891.409164; Wed, 01 Dec 2021 11:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNWo-0007Em-SH; Wed, 01 Dec 2021 11:11:58 +0000
Received: by outflank-mailman (input) for mailman id 235891;
 Wed, 01 Dec 2021 11:11:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46ns=QS=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1msNWo-0007Eg-7R
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 11:11:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f1d1849c-5295-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 12:00:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 811B011B3;
 Wed,  1 Dec 2021 03:11:54 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 653543F694;
 Wed,  1 Dec 2021 03:11:53 -0800 (PST)
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
X-Inumbo-ID: f1d1849c-5295-11ec-b945-1df2895da90e
Date: Wed, 1 Dec 2021 11:11:49 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "stefanos@xilinx.com"
 <stefanos@xilinx.com>, "julien@xen.org" <julien@xen.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Subject: Re: [XEN v2] xen/arm64: io: Decode 32-bit ldr/str post-indexing
 instructions
Message-ID: <20211201111149.08c0ae90@donnerap.cambridge.arm.com>
In-Reply-To: <D8811539-65F2-4D40-BFEF-CE72EA8E902A@arm.com>
References: <20211129191638.19877-1-ayankuma@xilinx.com>
	<20211130094950.1bf368d6@donnerap.cambridge.arm.com>
	<a69d41f1-7b57-c127-ae73-2de5a581dddd@xilinx.com>
	<D8811539-65F2-4D40-BFEF-CE72EA8E902A@arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Dec 2021 08:41:13 +0000
Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:

Hi,

> > On 30 Nov 2021, at 19:13, Ayan Kumar Halder <ayan.kumar.halder@xilinx.c=
om> wrote:
> >
> > Hi Andre,
> >
> > Thanks for your comments. They are useful.
> >
> > On 30/11/2021 09:49, Andre Przywara wrote: =20
> >> On Mon, 29 Nov 2021 19:16:38 +0000
> >> Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
> >> Hi, =20
> >>> At the moment, Xen is only handling data abort with valid syndrome (i=
.e.
> >>> ISV=3D0). Unfortunately, this doesn't cover all the instructions a do=
main
> >>> could use to access MMIO regions.
> >>>
> >>> For instance, Xilinx baremetal OS will use:
> >>>
> >>>         volatile u32 *LocalAddr =3D (volatile u32 *)Addr;
> >>>         *LocalAddr =3D Value;
> >>>
> >>> This leave the compiler to decide which store instructions to use. =20
> >> As mentioned in the other email, this is wrong, if this points to MMIO:
> >> don't let the compiler do MMIO accesses. If a stage 2 fault isn't in
> >> an MMIO area, you should not see traps that you cannot handle already.
> >> So I don't think it's a good idea to use that as an example. And since
> >> this patch only seems to address this use case, I would doubt its
> >> usefulness in general. =20
> > Yes, I should have fixed the comment.
> >
> > Currently, I am testing with baremetal app which uses inline assembly c=
ode with post indexing instructions, to access the MMIO.
> >
> > ATM, I am testing with 32 bit MMIO only.
> >
> > On the usefulness, I am kind of torn as it is legitimate for post index=
ing instructions to be used in an inline-assembly code for accessing MMIO. =
However, that may not be something commonly seen.
> >
> > @Stefano/Bertrand/Julien/Volodymyr :- As you are the Arm mantainers, ca=
n you comment if we should have decoding logic or not ? =20
>=20
> Andre gave you the official statement from Arm and there is nothing more =
I can say.
> I will leave this decision to Stefano and Julien.

Well, I gave some statement about what the architecture says, and about
the problems for letting a compiler generate MMIO accesses.
That doesn't prevent anyone from emulating those instructions, but I
wonder if this is doing more harm than good (little tested code in
a sensitive code path of the HV), given the use cases. If this is
only to cover the (illegitimate) use case at hand, it's certainly not
worth it, IMHO.

Thanks,
Andre

>=20
> Regards
> Bertrand
>=20
> > =20
> >>> This
> >>> may be a post-index store instruction where the HW will not provide a
> >>> valid syndrome.
> >>>
> >>> In order to handle post-indexing store/load instructions, Xen will ne=
ed
> >>> to fetch and decode the instruction.
> >>>
> >>> This patch only cover post-index store/load instructions from AArch64
> >>> mode. For now, this is left unimplemented for trap from AArch32 mode.
> >>>
> >>> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
> >>> ---
> >>>
> >>> Changelog :-
> >>>
> >>> v2 :- 1. Updated the rn register after reading from it. (Pointed by
> >>> Julien, Stefano)
> >>> 2. Used a union to represent the instruction opcode (Suggestd by
> >>> Bertrand) 3. Fixed coding style issues (Pointed by Julien)
> >>> 4. In the previous patch, I was updating dabt->sign based on the
> >>> signedness of imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI
> >>> 0487G.b, Page 3221, SSE indicates the signedness of the data item
> >>> loaded. In our case, the data item loaded is always unsigned.
> >>>
> >>> This has been tested for the following cases :-
> >>> ldr x2, [x1], #4 =20
> >> As Jan already mentioned: this is a bad example. First, this is a 64-b=
it
> >> access, which you don't emulate below. And second, you want to keep the
> >> pointer aligned. Unaligned accesses to device memory always trap, as p=
er
> >> the architecture, even on bare metal. =20
> >>>
> >>> ldr w2, [x1], #-4
> >>>
> >>> str x2, [x1], #4 =20
> >> Same as above. =20
> >>> str w2, [x1], #-4
> >>>
> >>> The reason being  I am testing on 32bit MMIO registers only. I don't =
see
> >>> a 8bit or 16bit MMIO register. =20
> >> Where did you look? There are plenty of examples out there, even the G=
IC
> >> allows 8-bit accesses to certain registers (grep for "VGIC_ACCESS_"), =
and
> >> the Linux GIC driver is using them (but with proper accessors, of cour=
se).
> >> Also GICv3 supports 64-bit accesses to some registers. Some PL011 UART=
s use
> >> 16-bit MMIO accesses. =20
> > Yes, sorry I see them now. GICD_IPRIORITYR can be accessed with 8 bits.
> > Unfortunately, I have GIC-v2 on my hardware system. So, probably I can'=
t test 64 bit access.
> > =20
> >>>  xen/arch/arm/decode.c     | 68 +++++++++++++++++++++++++++++++++++++=
+-
> >>>  xen/arch/arm/decode.h     |  3 +-
> >>>  xen/arch/arm/io.c         | 40 +++++++++++++++++++----
> >>>  xen/include/asm-arm/hsr.h | 26 +++++++++++++++
> >>>  4 files changed, 129 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
> >>> index 792c2e92a7..0b3e8fcbc6 100644
> >>> --- a/xen/arch/arm/decode.c
> >>> +++ b/xen/arch/arm/decode.c
> >>> @@ -84,6 +84,66 @@ bad_thumb2:
> >>>      return 1;
> >>>  }
> >>>  +static int decode_32bit_loadstore_postindexing(register_t pc,
> >>> +                                               struct hsr_dabt *dabt,
> >>> +                                               union ldr_str_instr_c=
lass *instr)
> >>> +{
> >>> +    if ( raw_copy_from_guest(&instr->value, (void * __user)pc, sizeo=
f (instr)) )
> >>> +        return -EFAULT;
> >>> +
> >>> +    /* First, let's check for the fixed values */
> >>> +    if ( !((instr->code.fixed1 =3D=3D 1) && (instr->code.fixed2 =3D=
=3D 0) &&
> >>> +         (instr->code.fixed3 =3D=3D 0) && (instr->code.fixed4 =3D=3D=
 7)) )
> >>> +    {
> >>> +        gprintk(XENLOG_ERR, "Decoding not supported for instructions=
 other than"
> >>> +            " ldr/str post indexing\n");
> >>> +        goto bad_32bit_loadstore;
> >>> +    }
> >>> +
> >>> +    if ( instr->code.size !=3D 2 ) =20
> >> I don't see a good reason for this limitation. If you are going to dis=
sect
> >> the instruction, why not just support at least all access widths, so
> >> 64-bits, but also {ldr,str}{b,w}? I think the framework does the heavy
> >> lifting for you already? =20
> >
> > I see your point. My intention was to test first with the restricted in=
struction set (ie ldr/str - 32 bit access with post indexing only) and get =
an opinion from the community. If the patch looks sane, then this can be ex=
tended with other variants as well.
> > =20
> >> Same for the restriction to post-index above, supporting pre-index as =
well
> >> should be easy. =20
> > For Pre-indexing instruction, the ISS is valid. So I am not sure what i=
s to be done here?
> >
> > AFAIU, if the ISS is valid, there is no need to explicitly decode the i=
nstructions. =20
> >> To me this has the bitter taste for being a one trick pony to work aro=
und
> >> your particular (broken!) use case. =20
> >>> +    {
> >>> +        gprintk(XENLOG_ERR,
> >>> +            "ldr/str post indexing is supported for 32 bit variant o=
nly\n");
> >>> +        goto bad_32bit_loadstore;
> >>> +    }
> >>> +
> >>> +    if ( instr->code.v !=3D 0 )
> >>> +    {
> >>> +        gprintk(XENLOG_ERR,
> >>> +            "ldr/str post indexing for vector types are not supporte=
d\n");
> >>> +        goto bad_32bit_loadstore;
> >>> +    }
> >>> +
> >>> +    /* Check for STR (immediate) - 32 bit variant */
> >>> +    if ( instr->code.opc =3D=3D 0 )
> >>> +    {
> >>> +        dabt->write =3D 1;
> >>> +    }
> >>> +    /* Check for LDR (immediate) - 32 bit variant */
> >>> +    else if ( instr->code.opc =3D=3D 1 )
> >>> +    {
> >>> +        dabt->write =3D 0;
> >>> +    }
> >>> +    else
> >>> +    {
> >>> +        gprintk(XENLOG_ERR,
> >>> +            "Decoding ldr/str post indexing is not supported for thi=
s variant\n");
> >>> +        goto bad_32bit_loadstore;
> >>> +    }
> >>> +
> >>> +    gprintk(XENLOG_INFO,
> >>> +        "instr->code.rt =3D 0x%x, instr->code.size =3D 0x%x, instr->=
code.imm9 =3D %d\n",
> >>> +        instr->code.rt, instr->code.size, instr->code.imm9);
> >>> +
> >>> +    update_dabt(dabt, instr->code.rt, instr->code.size, false);
> >>> +    dabt->valid =3D 1;
> >>> +
> >>> +    return 0;
> >>> +bad_32bit_loadstore:
> >>> +    gprintk(XENLOG_ERR, "unhandled 32bit Arm instruction 0x%x\n", in=
str->value);
> >>> +    return 1;
> >>> +}
> >>> +
> >>>  static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
> >>>  {
> >>>      uint16_t instr;
> >>> @@ -150,11 +210,17 @@ bad_thumb:
> >>>      return 1;
> >>>  }
> >>>  -int decode_instruction(const struct cpu_user_regs *regs, struct hsr=
_dabt *dabt)
> >>> +int decode_instruction(const struct cpu_user_regs *regs, struct hsr_=
dabt *dabt,
> >>> +                       union ldr_str_instr_class *instr)
> >>>  {
> >>>      if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
> >>>          return decode_thumb(regs->pc, dabt);
> >>>  +    if ( (is_64bit_domain(current->domain) && !psr_mode_is_32bit(re=
gs)) )
> >>> +    {
> >>> +        return decode_32bit_loadstore_postindexing(regs->pc, dabt, i=
nstr);
> >>> +    }
> >>> +
> >>>      /* TODO: Handle ARM instruction */
> >>>      gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
> >>>  diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
> >>> index 4613763bdb..d82fc4a0f6 100644
> >>> --- a/xen/arch/arm/decode.h
> >>> +++ b/xen/arch/arm/decode.h
> >>> @@ -35,7 +35,8 @@
> >>>   */
> >>>    int decode_instruction(const struct cpu_user_regs *regs,
> >>> -                       struct hsr_dabt *dabt);
> >>> +                       struct hsr_dabt *dabt,
> >>> +                       union ldr_str_instr_class *instr);
> >>>    #endif /* __ARCH_ARM_DECODE_H_ */
> >>>  diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> >>> index 729287e37c..0d60754bc4 100644
> >>> --- a/xen/arch/arm/io.c
> >>> +++ b/xen/arch/arm/io.c
> >>> @@ -65,6 +65,16 @@ static enum io_state handle_write(const struct
> >>> mmio_handler *handler, return ret ? IO_HANDLED : IO_ABORT;
> >>>  }
> >>>  +static void post_incremenet_register(union ldr_str_instr_class *ins=
tr)
> >>> +{
> >>> +    struct cpu_user_regs *regs =3D guest_cpu_user_regs();
> >>> +    unsigned int val;
> >>> +
> >>> +    val =3D get_user_reg(regs, instr->code.rn);
> >>> +    val +=3D instr->code.imm9;
> >>> +    set_user_reg(regs, instr->code.rn, val);
> >>> +}
> >>> +
> >>>  /* This function assumes that mmio regions are not overlapped */
> >>>  static int cmp_mmio_handler(const void *key, const void *elem)
> >>>  {
> >>> @@ -106,14 +116,26 @@ enum io_state try_handle_mmio(struct cpu_user_r=
egs
> >>> *regs, .gpa =3D gpa,
> >>>          .dabt =3D dabt
> >>>      };
> >>> +    int rc;
> >>> +    union ldr_str_instr_class instr =3D {0};
> >>>        ASSERT(hsr.ec =3D=3D HSR_EC_DATA_ABORT_LOWER_EL);
> >>>  +    /*
> >>> +     * Armv8 processor does not provide a valid syndrome for post-in=
dexing
> >>> +     * ldr/str instructions. So in order to process these instructio=
ns,
> >>> +     * Xen must decode them.
> >>> +     */
> >>> +    if ( !info.dabt.valid )
> >>> +    {
> >>> +        rc =3D decode_instruction(regs, &info.dabt, &instr);
> >>> +        if ( rc )
> >>> +            return IO_ABORT;
> >>> +    }
> >>> +
> >>>      handler =3D find_mmio_handler(v->domain, info.gpa);
> >>>      if ( !handler )
> >>>      {
> >>> -        int rc;
> >>> -
> >>>          rc =3D try_fwd_ioserv(regs, v, &info);
> >>>          if ( rc =3D=3D IO_HANDLED )
> >>>              return handle_ioserv(regs, v);
> >>> @@ -122,7 +144,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs
> >>> *regs, }
> >>>        /* All the instructions used on emulated MMIO region should be
> >>> valid */
> >>> -    if ( !dabt.valid )
> >>> +    if ( !info.dabt.valid )
> >>>          return IO_ABORT;
> >>>        /*
> >>> @@ -134,7 +156,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs
> >>> *regs, {
> >>>          int rc;
> >>>  -        rc =3D decode_instruction(regs, &info.dabt);
> >>> +        rc =3D decode_instruction(regs, &info.dabt, NULL);
> >>>          if ( rc )
> >>>          {
> >>>              gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
> >>> @@ -143,9 +165,15 @@ enum io_state try_handle_mmio(struct cpu_user_re=
gs
> >>> *regs, }
> >>>        if ( info.dabt.write )
> >>> -        return handle_write(handler, v, &info);
> >>> +        rc =3D handle_write(handler, v, &info);
> >>>      else
> >>> -        return handle_read(handler, v, &info);
> >>> +        rc =3D handle_read(handler, v, &info);
> >>> +
> >>> +    if ( instr.value !=3D 0 )
> >>> +    {
> >>> +        post_incremenet_register(&instr);
> >>> +    }
> >>> +    return rc;
> >>>  }
> >>>    void register_mmio_handler(struct domain *d,
> >>> diff --git a/xen/include/asm-arm/hsr.h b/xen/include/asm-arm/hsr.h
> >>> index 9b91b28c48..72d67d2801 100644
> >>> --- a/xen/include/asm-arm/hsr.h
> >>> +++ b/xen/include/asm-arm/hsr.h
> >>> @@ -15,6 +15,32 @@ enum dabt_size {
> >>>      DABT_DOUBLE_WORD =3D 3,
> >>>  };
> >>>  +/*
> >>> + * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and St=
ores
> >>> + * Page 318 specifies the following bit pattern for
> >>> + * "load/store register (immediate post-indexed)".
> >>> + *
> >>> + * 31 30 29  27 26 25  23   21 20              11   9         4     =
  0
> >>> + * _________________________________________________________________=
__
> >>> + * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt =
  |
> >>> + * |____|______|__|____|____|__|_______________|____|_________|_____=
__|
> >>> + */
> >>> +union ldr_str_instr_class {
> >>> +    uint32_t value;
> >>> +    struct ldr_str {
> >>> +        unsigned int rt:5;     /* Rt register */ =20
> >> I don't think it's a particular good idea to use a bit-field here, if =
that
> >> is expected to mimic a certain hardware provided bit pattern.
> >> It works in practise (TM), but the C standard does not guarantee the o=
rder
> >> the bits are allocated (ISO/IEC 9899:201x =C2=A76.7.2.1, stanza 11).
> >> Since you are *reading* only from the instruction word, you should get=
 away
> >> with accessor macros to extract the bits you need. For instance for
> >> filtering the opcode, you could use: ((insn & 0x3fe00c00) =3D=3D 0x384=
00400) =20
> >
> > Yes, this is a very good point. I will use bitmasks to access the bits =
from the register.
> >
> > I saw the same logic (ie using bitfields) is used for some other regist=
ers as well. For eg hsr_dabt, hsr_iabt in xen/include/asm-arm/hsr.h. May be=
 that needs fixing as well for some other time. :)

Well, there is no easy and clear answer as to whether to use bit-fields in
those occasions or not. From a practical point of view, it works (TM), and
has some advantages, like saving you from fiddling around with a 9-bit
sign extension, for instance.
But the Linux kernel discourages those works-for-me solutions, one killer
problem here is endianess, which is not a problem for Xen, IIRC.
I personally prefer robust code: but not relying on certain implementation
specifics (and be they very obvious or wide-spread), there will be less
surprises in the future.

So I'd leave this up to the maintainers to decide, IIUC the original
suggestion came from Bertrand?

Cheers,
Andre


> >
> > - Ayan =20
> >> Cheers,
> >> Andre =20
> >>> +        unsigned int rn:5;     /* Rn register */
> >>> +        unsigned int fixed1:2; /* value =3D=3D 01b */
> >>> +        int imm9:9;            /* imm9 */
> >>> +        unsigned int fixed2:1; /* value =3D=3D 0b */
> >>> +        unsigned int opc:2;    /* opc */
> >>> +        unsigned int fixed3:2; /* value =3D=3D 00b */
> >>> +        unsigned int v:1;      /* vector */
> >>> +        unsigned int fixed4:3; /* value =3D=3D 111b */
> >>> +        unsigned int size:2;   /* size */
> >>> +    } code;
> >>> +};
> >>> +
> >>>  union hsr {
> >>>      register_t bits;
> >>>      struct { =20
>=20


