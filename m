Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F96691B37
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 10:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493182.762992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQPdN-00015Q-8h; Fri, 10 Feb 2023 09:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493182.762992; Fri, 10 Feb 2023 09:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQPdN-00012c-5e; Fri, 10 Feb 2023 09:23:57 +0000
Received: by outflank-mailman (input) for mailman id 493182;
 Fri, 10 Feb 2023 09:23:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/7BC=6G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pQPdL-00012W-0l
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 09:23:55 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1cb642c-a924-11ed-93b5-47a8fe42b414;
 Fri, 10 Feb 2023 10:23:51 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id m14so4356097wrg.13
 for <xen-devel@lists.xenproject.org>; Fri, 10 Feb 2023 01:23:51 -0800 (PST)
Received: from [192.168.8.199] (46.204.104.21.nat.umts.dynamic.t-mobile.pl.
 [46.204.104.21]) by smtp.gmail.com with ESMTPSA id
 l3-20020a5d6683000000b002bdf3809f59sm3163585wru.38.2023.02.10.01.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 01:23:50 -0800 (PST)
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
X-Inumbo-ID: a1cb642c-a924-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fF4hictUgKkFuGyL59Ei48VpWVLxxgngBHdigpfEiME=;
        b=duJ1DSMCfr7hlQl0TQVMdkDt3UZ+bNrrey6Yz+MtO8p7v+ABqBBRe6w5dHDr27ujlR
         SocaXsf4M4nUizkwGCDwYqpehIb+jUwAccjBGgVNhNO2sYqizyLQBF13ku4CDz1N3+Ad
         H7r/kBcXyQ59rZe7w26MgHMbJTwQMlmQQxwalmTB1KIGldjXl3OhLAYceM2G8QOYN/dX
         2oJcR+HyLqoSXKbL8YrbF1QbUiirDnc39jdP/2vdM1wDPq/KuX3yldHUlEXOgPL4k/vV
         dfi+oVHlPsK7435FBEEgWnVkWVZCOVdc8gSR7xj3yu0+UmIlMXaZyp25LuEhQIFLCpQl
         UO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fF4hictUgKkFuGyL59Ei48VpWVLxxgngBHdigpfEiME=;
        b=6s1MkXQwiTXJ9H+7u/4AFURDkQxLGBf63xPpwdVxdWXA4MRJbNXB8TlHhwRMi6dizG
         HyLIOrUBaibioYUYy71Eh93vR9r3i9n02LMz6dr7P9oK/23Ba8ulmxxZZjKu9fw7eW/a
         KxzDRLm0LvtezDZSW2pr4nxfSY81hcDQVzu3MBM6EX+iSV00FSlxmzwKdUp1UVjjuZnl
         4/YMWdlx85f4oYqRLGR29UzhXTig1VZZBjQqPutQc36bcusdSey+80mghGJ25mkxmrlx
         ZcfojL+IUdyJKzZtJij5hG0Su+6QEF+ED1ii3gKKt6wYeuG7MrxyTLNsV+W3420feBF5
         aEaQ==
X-Gm-Message-State: AO0yUKXWEb3+xMhfSlXDNHtG00bJmE9aP3o6xKH2cEGZvUuDeOI4T18d
	5VXJSKx8CYbNtQoGoZDcrSA=
X-Google-Smtp-Source: AK7set8BLx4nSmBaP4NS+B/ULkskAuTrLs2OXN6QKAoOwzOOQFkfsdcQHFzoD/zd9p/IT3CYDp4njw==
X-Received: by 2002:a5d:4c44:0:b0:2c3:e4f5:17f with SMTP id n4-20020a5d4c44000000b002c3e4f5017fmr15559606wrt.33.1676021031281;
        Fri, 10 Feb 2023 01:23:51 -0800 (PST)
Message-ID: <13c3a5fbf6528ce6232be5ed56c8449a90e5c3ad.camel@gmail.com>
Subject: Re: [PATCH v3 09/14] xen/riscv: introduce decode_cause() stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>
Date: Fri, 10 Feb 2023 11:23:48 +0200
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
Nice catch.
Thanks.
>=20
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


