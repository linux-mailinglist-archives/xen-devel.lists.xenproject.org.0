Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8128F6C476C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 11:20:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513292.794107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevZz-0006qx-US; Wed, 22 Mar 2023 10:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513292.794107; Wed, 22 Mar 2023 10:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevZz-0006pL-RU; Wed, 22 Mar 2023 10:20:27 +0000
Received: by outflank-mailman (input) for mailman id 513292;
 Wed, 22 Mar 2023 10:20:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhKM=7O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pevZx-0006pC-Sl
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 10:20:25 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28b31c16-c89b-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 11:20:24 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id t15so16422235wrz.7
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 03:20:24 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 q10-20020adff94a000000b002ca864b807csm13623977wrr.0.2023.03.22.03.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 03:20:24 -0700 (PDT)
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
X-Inumbo-ID: 28b31c16-c89b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679480424;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uYP3GJNE5TXci0njre8k809v2obyoyZ7BXKyOncTpuY=;
        b=aEwUJrIg3tc+DOgKwEm0w3srwDW2DlHO3Fk9nc5dZu5QpKkbEivN4w6rs1Aa7DCq3+
         gxhiE+F4MhL7x6jIMTRvsBAk472ukFarloEXP6ZBf4xJxi8yUeCn22CmJd3nANnoB1jd
         jVb2c4tv/vN4IfxNR158Dxt7PQilfsfE0SLzAXJhrOvwnfhZTiNtDr5Ic1ZkdhkRmbYV
         ZPLDYllXa6qxfI1umSzL1YBnZeggabwWCHmQRIYn6E4V/uPWiOwOMRkbE3WEpKmJaK3T
         J2omocHLCy8VnAUtYFZ8wm2U1yPfn8oVFxzkW0K2ns1DYmBOfN5wAvB8iisUlc23/OwP
         wAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679480424;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYP3GJNE5TXci0njre8k809v2obyoyZ7BXKyOncTpuY=;
        b=6Aqmuoj1SWos8Gu3CUCGkKQGiffLWgjzwzgs61vdQaE+ZaGzFWi7/rT/ZGwIC1ChWN
         A9y5A0iR6gezagTTJeCCGSGRBUudRoTIhjPdkpuXQt+7VP981ODCa2Baw6P7MLxZNdNK
         TvO4LLG4vQiyBsKlRe3k6WLG3zoHzMkvoC5vBSaJURT4Ue3dZ7ROZ7D8lgXjkb7c7ztj
         4Cb11ep/hfi6xUp1XpcADD8oebn5eSIe3TghFSJEPJwSMwKgYDF9Y2G9/zuDmQit8Knz
         O0iU8mrZERcwZEFYF7kLjhcM4VLqcUbfGxqM27dk8PPF7J2mnGil8GvYLhoEI+98dhp3
         c4uA==
X-Gm-Message-State: AO0yUKUkexwME24MyyASnyI8jvS0pHsKhGNofH+wiFUald49hrKlzdXB
	K/v46w3H37tonUijxzhPhS0=
X-Google-Smtp-Source: AK7set9+v0QUiU5bn8CanSJmXX/tVkh7RDSxx4/yCS2Y/CAsN24B2itmUd/fsm//QMawivDYfAWfVg==
X-Received: by 2002:adf:f241:0:b0:2c7:dad:5630 with SMTP id b1-20020adff241000000b002c70dad5630mr4971365wrp.27.1679480424322;
        Wed, 22 Mar 2023 03:20:24 -0700 (PDT)
Message-ID: <cf883a86eac88c11d02768eb64adb2b418c6ba2e.camel@gmail.com>
Subject: Re: [PATCH v5 4/7] xen/riscv: introduce decode_cause() stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Wed, 22 Mar 2023 12:20:22 +0200
In-Reply-To: <0b94be57-b8fb-6c38-9ed8-dc8482694153@xen.org>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
	 <8c7b4a5d328be8b1cd2aa99c8d9a7883e4969600.1678976127.git.oleksii.kurochko@gmail.com>
	 <0b94be57-b8fb-6c38-9ed8-dc8482694153@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

Hi Julien,

On Tue, 2023-03-21 at 17:33 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 16/03/2023 14:39, Oleksii Kurochko wrote:
> > The patch introduces stuff needed to decode a reason of an
> > exception.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V5:
> > =C2=A0=C2=A0 - Remove <xen/error.h> from riscv/traps/c as nothing would
> > require
> > =C2=A0=C2=A0=C2=A0=C2=A0 inclusion.
> > =C2=A0=C2=A0 - decode_reserved_interrupt_cause(), decode_interrupt_caus=
e(),
> > decode_cause, do_unexpected_trap()
> > =C2=A0=C2=A0=C2=A0=C2=A0 were made as static they are expected to be us=
ed only in
> > traps.c
> > =C2=A0=C2=A0 - use LINK_TO_LOAD() for addresses which can be linker tim=
e
> > relative.
> > ---
> > Changes in V4:
> > =C2=A0=C2=A0 - fix string in decode_reserved_interrupt_cause()
> > ---
> > Changes in V3:
> > =C2=A0=C2=A0 - Nothing changed
> > ---
> > Changes in V2:
> > =C2=A0=C2=A0 - Make decode_trap_cause() more optimization friendly.
> > =C2=A0=C2=A0 - Merge the pathc which introduces do_unexpected_trap() to=
 the
> > current one.
> > ---
> > =C2=A0 xen/arch/riscv/traps.c | 87
> > +++++++++++++++++++++++++++++++++++++++++-
> > =C2=A0 1 file changed, 86 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> > index ccd3593f5a..8a1529e0c5 100644
> > --- a/xen/arch/riscv/traps.c
> > +++ b/xen/arch/riscv/traps.c
> > @@ -4,10 +4,95 @@
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * RISC-V Trap handlers
> > =C2=A0=C2=A0 */
> > +
> > +#include <xen/lib.h>
> > +
> > +#include <asm/boot-info.h>
> > +#include <asm/csr.h>
> > +#include <asm/early_printk.h>
> > =C2=A0 #include <asm/processor.h>
> > =C2=A0 #include <asm/traps.h>
> > =C2=A0=20
> > -void do_trap(struct cpu_user_regs *cpu_regs)
> > +static const char *decode_trap_cause(unsigned long cause)
> > +{
> > +=C2=A0=C2=A0=C2=A0 static const char *const trap_causes[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_MISALIGNED_FETCH] =
=3D "Instruction Address
> > Misaligned",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_FETCH_ACCESS] =3D "I=
nstruction Access Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_ILLEGAL_INSTRUCTION]=
 =3D "Illegal Instruction",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_BREAKPOINT] =3D "Bre=
akpoint",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_MISALIGNED_LOAD] =3D=
 "Load Address Misaligned",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_LOAD_ACCESS] =3D "Lo=
ad Access Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_MISALIGNED_STORE] =
=3D "Store/AMO Address Misaligned",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_STORE_ACCESS] =3D "S=
tore/AMO Access Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_USER_ECALL] =3D "Env=
ironment Call from U-Mode",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_SUPERVISOR_ECALL] =
=3D "Environment Call from S-Mode",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_MACHINE_ECALL] =3D "=
Environment Call from M-Mode",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_FETCH_PAGE_FAULT] =
=3D "Instruction Page Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_LOAD_PAGE_FAULT] =3D=
 "Load Page Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_STORE_PAGE_FAULT] =
=3D "Store/AMO Page Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_FETCH_GUEST_PAGE_FAU=
LT] =3D "Instruction Guest Page
> > Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_LOAD_GUEST_PAGE_FAUL=
T] =3D "Load Guest Page Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_VIRTUAL_INST_FAULT] =
=3D "Virtualized Instruction
> > Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_STORE_GUEST_PAGE_FAU=
LT] =3D "Guest Store/AMO Page
> > Fault",
> > +=C2=A0=C2=A0=C2=A0 };
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( cause < ARRAY_SIZE(trap_causes) && trap_causes=
[cause] )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return trap_causes[cause];
> > +=C2=A0=C2=A0=C2=A0 return "UNKNOWN";
> > +}
> > +
> > +static const char *decode_reserved_interrupt_cause(unsigned long
> > irq_cause)
> > +{
> > +=C2=A0=C2=A0=C2=A0 switch ( irq_cause )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0 case IRQ_M_SOFT:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "M-mode Software Int=
errupt";
> > +=C2=A0=C2=A0=C2=A0 case IRQ_M_TIMER:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "M-mode TIMER Interr=
upt";
> > +=C2=A0=C2=A0=C2=A0 case IRQ_M_EXT:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "M-mode External Int=
errupt";
> > +=C2=A0=C2=A0=C2=A0 default:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "UNKNOWN IRQ type";
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +static const char *decode_interrupt_cause(unsigned long cause)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned long irq_cause =3D cause & ~CAUSE_IRQ_FLAG=
;
> > +
> > +=C2=A0=C2=A0=C2=A0 switch ( irq_cause )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0 case IRQ_S_SOFT:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "Supervisor Software=
 Interrupt";
> > +=C2=A0=C2=A0=C2=A0 case IRQ_S_TIMER:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "Supervisor Timer In=
terrupt";
> > +=C2=A0=C2=A0=C2=A0 case IRQ_S_EXT:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "Supervisor External=
 Interrupt";
> > +=C2=A0=C2=A0=C2=A0 default:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return decode_reserved_inte=
rrupt_cause(irq_cause);
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +static const char *decode_cause(unsigned long cause)
> > +{
> > +=C2=A0=C2=A0=C2=A0 if ( cause & CAUSE_IRQ_FLAG )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return decode_interrupt_cau=
se(cause);
> > +
> > +=C2=A0=C2=A0=C2=A0 return decode_trap_cause(cause);
> > +}
> > +
> > +static void do_unexpected_trap(const struct cpu_user_regs *regs)
> > =C2=A0 {
> > +=C2=A0=C2=A0=C2=A0 unsigned long cause =3D csr_read(CSR_SCAUSE);
> > +
> > +=C2=A0=C2=A0=C2=A0 early_printk("Unhandled exception: ");
> > +=C2=A0=C2=A0=C2=A0 early_printk(LINK_TO_LOAD(decode_cause(cause)));
>=20
> The use of LINK_TO_LOAD is the sort of things that is worth
> documenting=20
> because this would raise quite a few questions.
>=20
> The comment on top of LINK_TO_LOAD suggests the macro can only be
> used=20
> while the MMU is off. But I would expect do_unexpected_trap() to be
> used=20
> also after the MMU is on. Isn't it going to be the case?
Yes, you are right. it will be an issue now. It was not an issue before
when it was used 1:1 mapping. So I have to add a check 'if (
is_mmu_enabled ) ... ' inside LINK_TO_LOAD macros.
>=20
> Furthermore, AFAICT LINK_TO_LOAD() assumes that a runtime address is=20
> given. While I believe this could be true for pointer returned by=20
> decode_trap_cause() (I remember seen on Arm that an array of string=20
> would store the runtime address), I am not convinced this is the case
> for pointer returned by decode_interrupt_cause().
It might be an issue. I'll double check what will be returned from
decode_interrupt_cause().
>=20
> Lastly, I think you will want to document what functions can be used=20
> when the MMU is off and possibly splitting the code. So it is easier
> for=20
> someone to figure out in which context the function and if this is
> safe=20
> to use.
It make sense.

Thanks a lot for the comments.

~ Oleksii



