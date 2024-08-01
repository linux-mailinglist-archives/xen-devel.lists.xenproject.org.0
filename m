Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1FC9453A2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 22:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769972.1180837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZc2r-0007Tk-S4; Thu, 01 Aug 2024 20:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769972.1180837; Thu, 01 Aug 2024 20:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZc2r-0007RW-Od; Thu, 01 Aug 2024 20:05:05 +0000
Received: by outflank-mailman (input) for mailman id 769972;
 Thu, 01 Aug 2024 20:05:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dsN4=PA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sZc2q-0007RQ-Jc
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 20:05:04 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56fc9b15-5041-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 22:05:03 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52f04150796so12073232e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 13:05:03 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba3cf41sm40204e87.273.2024.08.01.13.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 13:05:02 -0700 (PDT)
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
X-Inumbo-ID: 56fc9b15-5041-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722542703; x=1723147503; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yk2/GIZCwX7qe2mUxKHcAH5HcO+UJV5KC/QZwaX/E7c=;
        b=DBeNa0b16xa0i3LZNEdrvm121Pr2pAidtgsiARKtYtrAhpX9LS6F8vX6Mz5FzEj+/3
         PjhIFs8c+0M8n6yXlKym1wnMmSxZ3M1D2K0j5mM66xDeQ19Vdq2o2B1uRe8oFGp7qgHS
         Vqk7tSTZVJYHCp9eXZcsmapbvGC0agAzXL/eGNgLXF5aVbcC3v0h5PqEPknS9HFD4wQq
         87UpL4GMjHbUaKrTH+wacxAN5707lXCtfkbu/83p9c46VriXZrHOqK99lQOlmbwKaPbQ
         cIgOzzVZKOEpifO1fk6jB4G8r6U1DRIv1ssO3GKEPbM2Ctr8OU8Uf+S3t+KpxP1WEvd9
         SBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722542703; x=1723147503;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yk2/GIZCwX7qe2mUxKHcAH5HcO+UJV5KC/QZwaX/E7c=;
        b=KIrQc9k3BDVgivIPko5KOtKOvZ12ggZlUTKQhJa5Ndu4y1vWg+gL73OZBE6zO6MJan
         V1d1pzm+slE7Nv1LG1LHu4Mrw+Gnw/fpnuK236EYhDUe2VZQUwrsyQ7DGljLw0y+3LUJ
         Z9hw4DtQdzMshYgbGkPFfL7LbYTMMsNjItBb0UVYcgA+pC4ORTfWsP1F/4+90LHRTJYU
         W8SL0Ivr+R8dWUfBScFqpqpGnoYYcyId9zJTxTE+JsZNO6nPLI1XMEHJwokLWInZDi4M
         EI8CUqDQm0BKIlqUYayuNOB4cJ8Ywl/LzTgbNbabntbFkaiAi0OiQNAtiafxyihXknSt
         3JFg==
X-Forwarded-Encrypted: i=1; AJvYcCXTBDu0wE5SY0+rVPiviD2rNDCMbyiyZNTPOc1a8xFINcVwYNo9QJM+Z/rg4pcIpL3mR5BNKVi69Us9JbdkuDroMygTIlZdQzKvFvm1nTo=
X-Gm-Message-State: AOJu0YzfBWzlOkNKJUXhMQiJTs6giyvk8iwmpRAzWw90CVGVhYtxp7UI
	THyqhYditqidxXLuNkgBRbY0k7BkOsKusuyuMQKRiMM8BVUzofkL
X-Google-Smtp-Source: AGHT+IHqfp49U1/oHmyDDBw0EJX7GPzN+gcPaHRXlFCCJ7k0cHPpzdXy0U1iMdj0bS6EHBlzdB4o/w==
X-Received: by 2002:a05:6512:3da6:b0:52c:9725:b32b with SMTP id 2adb3069b0e04-530bb36f8ddmr701399e87.17.1722542702545;
        Thu, 01 Aug 2024 13:05:02 -0700 (PDT)
Message-ID: <44b01293f3e318b6f4d1c3aff3f1b38349676bc0.camel@gmail.com>
Subject: Re: [PATCH v11 2/5] xen/riscv: introduce decode_cause() stuff
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
	xen-devel@lists.xenproject.org
Date: Thu, 01 Aug 2024 22:05:01 +0200
In-Reply-To: <a2ad6557-8162-4f06-84c6-b79c049cb326@suse.com>
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
	 <335b0b49720b3524b6c89c5ce62d3377a4bb1fb8.1721731887.git.oleksii.kurochko@gmail.com>
	 <a2ad6557-8162-4f06-84c6-b79c049cb326@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-08-01 at 13:44 +0200, Jan Beulich wrote:
> On 24.07.2024 17:31, Oleksii Kurochko wrote:
> > The patch introduces stuff needed to decode a reason of an
> > exception.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Changes in V11:
> > =C2=A0- Nothing changed. Only rebase.
> > ---
> > Changes in V10:
> > =C2=A0- add Acked-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Changes in V9:
> > =C2=A0- This patch was reverted as breaks both release and randconfig
> > builds.
> > =C2=A0=C2=A0 I don't see the failures now. ( probably it was because of
> > printk usage
> > =C2=A0=C2=A0 which was not ready at that moment ).
> > =C2=A0- drop inclusion of <asm/csr.h> and <asm/early_printk.h>
> > =C2=A0- add <asm/riscv_encoding.h> for CAUSE_* in decode_trap_cause().
> > ---
> > Changes in V8:
> > =C2=A0 - fix typo in return string from decode_reserved_interrupt_cause
> > =C2=A0 - add Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> > Changes in V7:
> > =C2=A0- Nothing changed. Only rebase.
> > ---
> > Changes in V6:
> > =C2=A0- Remove usage of LINK_TO_LOAD() due to the MMU being enabled
> > first.
> > =C2=A0- Change early_printk() to printk()
> > ---
> > Changes in V5:
> > =C2=A0 - Remove <xen/error.h> from riscv/traps/c as nothing would
> > require
> > =C2=A0=C2=A0=C2=A0 inclusion.
> > =C2=A0 - decode_reserved_interrupt_cause(), decode_interrupt_cause(),
> > decode_cause, do_unexpected_trap()
> > =C2=A0=C2=A0=C2=A0 were made as static they are expected to be used onl=
y in
> > traps.c
> > =C2=A0 - use LINK_TO_LOAD() for addresses which can be linker time
> > relative.
> > ---
> > Changes in V4:
> > =C2=A0 - fix string in decode_reserved_interrupt_cause()
> > ---
> > Changes in V3:
> > =C2=A0 - Nothing changed
> > ---
> > Changes in V2:
> > =C2=A0 - Make decode_trap_cause() more optimization friendly.
> > =C2=A0 - Merge the pathc which introduces do_unexpected_trap() to the
> > current one.
> > ---
> > =C2=A0xen/arch/riscv/traps.c | 80
> > +++++++++++++++++++++++++++++++++++++++++-
> > =C2=A01 file changed, 79 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> > index 5415cf8d90..37cec40dfa 100644
> > --- a/xen/arch/riscv/traps.c
> > +++ b/xen/arch/riscv/traps.c
> > @@ -9,13 +9,91 @@
> > =C2=A0#include <xen/sched.h>
> > =C2=A0
> > =C2=A0#include <asm/processor.h>
> > +#include <asm/riscv_encoding.h>
> > =C2=A0#include <asm/traps.h>
> > =C2=A0
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
>=20
> While I committed this as-is, two more points: First, as soon any any
> such array access becomes potentially reachable because of guest
> activity, it wants to use array_access_nospec() or alike.
Could you please explain why ( specifically ) guest activity affects if
array access becomes potentially reachable?=20

>  Second, and
> somewhat related, it may be desirable to avoid such double accesses.
> Hopefully the compiler will do that for you. But
>=20
> =C2=A0=C2=A0=C2=A0 const char *res =3D cause < ARRAY_SIZE(trap_causes) ?
> trap_causes[cause]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 : NULL;
>=20
> =C2=A0=C2=A0=C2=A0 return res ?: "UNKNOWN";
>=20
> might be worthwhile anyway.

Thanks.
I will apply this suggestion in the next version of this patch series.



~ Oleksii

