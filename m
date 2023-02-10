Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF141691B8B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 10:36:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493192.763003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQPog-00030S-94; Fri, 10 Feb 2023 09:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493192.763003; Fri, 10 Feb 2023 09:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQPog-0002yk-63; Fri, 10 Feb 2023 09:35:38 +0000
Received: by outflank-mailman (input) for mailman id 493192;
 Fri, 10 Feb 2023 09:35:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/7BC=6G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pQPoe-0002ye-NS
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 09:35:36 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44eec9a1-a926-11ed-933c-83870f6b2ba8;
 Fri, 10 Feb 2023 10:35:35 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so5831260wma.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Feb 2023 01:35:35 -0800 (PST)
Received: from [192.168.8.199] (46.204.104.21.nat.umts.dynamic.t-mobile.pl.
 [46.204.104.21]) by smtp.gmail.com with ESMTPSA id
 p1-20020a1c7401000000b003cfa622a18asm7803974wmc.3.2023.02.10.01.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 01:35:34 -0800 (PST)
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
X-Inumbo-ID: 44eec9a1-a926-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pB+VdG7PJklnLwo9yvMgFdwLNlutsCER1KpWKkOLKiE=;
        b=g4hj8VC4JVfC6FFFGnc7d4IczlKZCpoy5eEzIXeyggcB6JyyEHq4G0xF0+yta6fysJ
         ODrjsWNH7rRRW6Rvouui7xzXXMPz/8pSJpyyk5kpGJFblo/4hU3cKVLKCZylFJYEGyly
         2dX14MGqZ0XilQOT10nneKCMxCtBZ5a00f8Oi7jo3G2jp37hDRKeBthfiLcLinhQyC4D
         LJSR1HEHmss7ZSFoXKI5f01zOpdfpTsRQB6TMW+y+BX44MSe9nDkKdYzdc0D7eurD46Y
         PWu4sk7aSYZnstV/AwLi+yBa4L24ShRfDfHOGzTiJVmYCb1JCMT3ySBvVqYwliWU1Ze0
         +JIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pB+VdG7PJklnLwo9yvMgFdwLNlutsCER1KpWKkOLKiE=;
        b=vCYhaCzw6q/Ld34vlXuO7DXm5nL/D/T52f164ECUFtZysdnrt1ctrdQyZhkwlurgac
         MbuKcUZdb3EQYxbleRkYfwR3B6BZARa/6EqHgNJx19No7CMGyKB6TSWhSSh/RuSBsl0f
         1lQE+7s54rt0sNmN6LzTuk3pKz1PpA9dkugrIx+F0ZuFuc9QeyPFXdf+PVTj7D9p+m/r
         EWISaA8S1LY55+djampI21vpw1EenVf+oX1vnQjtMMUV8v9JtSgEgbUzSGSLe5Qu54St
         3H4x83plng50fawnAzFkycOEs9rs1r4z4ifkC1VbsNR6/Bpg/ObkV0sl5FOX5AwbuxdW
         5BVQ==
X-Gm-Message-State: AO0yUKVvEdG9RIZQHYUvqDX08u+vdAsteZ9G4/7uRc48RLygSuQjoMEg
	OcSIe0jF58HGVW4ycHtLEjc=
X-Google-Smtp-Source: AK7set9Vw8pAgwCIMJgTkdtevj3haVyWnyEoOxgdVL8UvOLH2TJE1XajRXPSTD12GZsunv+T97Srqw==
X-Received: by 2002:a05:600c:1713:b0:3dc:5b88:e6dd with SMTP id c19-20020a05600c171300b003dc5b88e6ddmr13890439wmn.10.1676021734919;
        Fri, 10 Feb 2023 01:35:34 -0800 (PST)
Message-ID: <448b79128a0f010af40f9f063a341cbdca17f206.camel@gmail.com>
Subject: Re: [PATCH v3 09/14] xen/riscv: introduce decode_cause() stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>
Date: Fri, 10 Feb 2023 11:35:32 +0200
In-Reply-To: <CAKmqyKNDZgrXZrXg9ttqFdxP8aZKAfiAEcNHn-VjqWhqDqUhpQ@mail.gmail.com>
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
	 <0198e2a5b572b9031eafe7cd1c85c6f9537b704c.1675779308.git.oleksii.kurochko@gmail.com>
	 <CAKmqyKNDZgrXZrXg9ttqFdxP8aZKAfiAEcNHn-VjqWhqDqUhpQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-02-10 at 12:00 +1000, Alistair Francis wrote:
> On Wed, Feb 8, 2023 at 12:48 AM Oleksii Kurochko
> <oleksii.kurochko@gmail.com> wrote:
> >=20
> > The patch introduces stuff needed to decode a reason of an
> > exception.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V3:
> > =C2=A0 - Nothing changed
> > ---
> > Changes in V2:
> > =C2=A0 - Make decode_trap_cause() more optimization friendly.
> > =C2=A0 - Merge the pathc which introduces do_unexpected_trap() to the
> > current one.
> > ---
> > =C2=A0xen/arch/riscv/traps.c | 85
> > +++++++++++++++++++++++++++++++++++++++++-
> > =C2=A01 file changed, 84 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> > index ccd3593f5a..f2a1e1ffcf 100644
> > --- a/xen/arch/riscv/traps.c
> > +++ b/xen/arch/riscv/traps.c
> > @@ -4,10 +4,93 @@
> > =C2=A0 *
> > =C2=A0 * RISC-V Trap handlers
> > =C2=A0 */
> > +#include <asm/csr.h>
> > +#include <asm/early_printk.h>
> > =C2=A0#include <asm/processor.h>
> > =C2=A0#include <asm/traps.h>
> > +#include <xen/errno.h>
> > +#include <xen/lib.h>
> >=20
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
> > +const char *decode_reserved_interrupt_cause(unsigned long
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
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "M-mode TIMER Interr=
upt";
>=20
> Wrong string here
>=20
> Alistair
>=20
Nice catch.
Thanks a lot.
> > +=C2=A0=C2=A0=C2=A0 default:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return "UNKNOWN IRQ type";
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +const char *decode_interrupt_cause(unsigned long cause)
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
> > +const char *decode_cause(unsigned long cause)
> > +{
> > +=C2=A0=C2=A0=C2=A0 if ( cause & CAUSE_IRQ_FLAG )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return decode_interrupt_cau=
se(cause);
> > +
> > +=C2=A0=C2=A0=C2=A0 return decode_trap_cause(cause);
> > +}
> > +
> > +static void do_unexpected_trap(const struct cpu_user_regs *regs)
> > =C2=A0{
> > +=C2=A0=C2=A0=C2=A0 unsigned long cause =3D csr_read(CSR_SCAUSE);
> > +
> > +=C2=A0=C2=A0=C2=A0 early_printk("Unhandled exception: ");
> > +=C2=A0=C2=A0=C2=A0 early_printk(decode_cause(cause));
> > +=C2=A0=C2=A0=C2=A0 early_printk("\n");
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 die();
> > =C2=A0}
> > +
> > +void do_trap(struct cpu_user_regs *cpu_regs)
> > +{
> > +=C2=A0=C2=A0=C2=A0 do_unexpected_trap(cpu_regs);
> > +}
> > --
> > 2.39.0
> >=20
> >=20


