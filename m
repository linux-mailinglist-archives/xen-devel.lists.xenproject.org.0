Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2FF951D9C
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 16:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777409.1187563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seFGG-0008Kn-Mz; Wed, 14 Aug 2024 14:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777409.1187563; Wed, 14 Aug 2024 14:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seFGG-0008IV-Jc; Wed, 14 Aug 2024 14:46:04 +0000
Received: by outflank-mailman (input) for mailman id 777409;
 Wed, 14 Aug 2024 14:46:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0xrl=PN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1seFGE-0008IN-Sc
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 14:46:02 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed010192-5a4b-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 16:46:01 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52efe4c7c16so3406904e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 07:46:01 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53200f124f4sm1338296e87.123.2024.08.14.07.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 07:46:00 -0700 (PDT)
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
X-Inumbo-ID: ed010192-5a4b-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723646761; x=1724251561; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iyk8oPomjymhHSTmmcIRzawLy1Pqsm4WoNBz95bfB1c=;
        b=L7v3S4ZU/EpsB92p0Qagc91WTxYrkXRthPmOPhTPFyO11Bt4gJXaHbPkYRJQ2sZ8Y3
         ODfQgStHRBryRYO+JF8oCGUiXg/Z47OGPKS5arr+F7TWGhCte3PgP1OtHXK43WFbxgng
         usIcYganV74r4iUQu8HMVhudXs3FZJu9k4MlpW01ow3wvaYAx3LmOn/Is2HBMC5Zu4dv
         QF5hpxOFxKldvFuMVMwh9Jep8hlnobTGSVMaZ1rNAhcKQaqQbu9eZLhgNeC9hdmWsNUc
         aqLa9AnyX/zzu+HKEpvRATYa6SZfnTPRXP3FsbeOYSJBl69Zt5rOmastxW/w78dFMXGa
         R3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723646761; x=1724251561;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iyk8oPomjymhHSTmmcIRzawLy1Pqsm4WoNBz95bfB1c=;
        b=aZ1q9SBEeXgukItcpSeceUxKu8bE1f/Fr32k0ZfyBpfrTEA4sScOz1imThlFOMWuWy
         gl3ECa7qOGHSsRY3UJAIDrpuciYQriTNXBpNeePWjUqYBEm9cHnzB+uD4wCq6xHnJyCp
         v4RAQXRGl8yGPm4wKaZ1worvY6Vag3mFajoexf/7i1t8JGfKhDC4TIV3euf1Bft+BMS8
         lCts2HLUvPSUwXv8fh3GeWZ0YQP8ttyK1O8yAuwYuxHsBW6nzTST+B5FUheCGYh/d40C
         9x0W6LQY0Fs/PZPhY+pM6TgIKUbvR8AJuUqaR5bu8UHZ7vIAGbywo+6uZlYKvNIXSf1/
         Yy4A==
X-Forwarded-Encrypted: i=1; AJvYcCW1ipinraXV1uh0WroUqkhXn+Iw4qP16be+Qi3IdYyyhNDVU2kOSyay5wI1fRT5cYKimOF2o17lb+Vcgv7JIKNl1gZjpHZRa7mXGX7s8R8=
X-Gm-Message-State: AOJu0YxNFVngiRg8KVTrrOXJeqqeBqEc9s9Ej564SxwGb3H/IXp6Mslf
	4FHhWnhByd3Yjbrz4qH1jeWV99IgINmTb+0G73L3RZT/te48xqbq
X-Google-Smtp-Source: AGHT+IF1mnIvpZhUMzQLgRyVrOl7HyZeDW2wfQf7p1lnBVPmW55E6rvHu8aldajqrsA1qkO0xndhug==
X-Received: by 2002:a05:6512:2216:b0:52c:cc2e:1c45 with SMTP id 2adb3069b0e04-532eda6bda2mr1992359e87.15.1723646760863;
        Wed, 14 Aug 2024 07:46:00 -0700 (PDT)
Message-ID: <ee3a2e61435e860f1ddb6022fbb712a8d890ae3e.camel@gmail.com>
Subject: Re: [PATCH v4 4/7] xen/riscv: introduce functionality to work with
 CPU info
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 14 Aug 2024 16:45:59 +0200
In-Reply-To: <e0285026-40c5-4316-8129-d07801a9c233@suse.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
	 <452e2960d1f064a2e3abcaae1ac354f48aafd24c.1723214540.git.oleksii.kurochko@gmail.com>
	 <e0285026-40c5-4316-8129-d07801a9c233@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-08-13 at 10:54 +0200, Jan Beulich wrote:
> On 09.08.2024 18:19, Oleksii Kurochko wrote:
> > Introduce struct pcpu_info to store pCPU-related information.
> > Initially, it includes only processor_id, but it will be extended
> > to include guest CPU information and temporary variables for
> > saving/restoring vCPU registers.
> >=20
> > Add set_processor_id() and get_processor_id() functions to set
> > and retrieve the processor_id stored in pcpu_info.
> >=20
> > Introduce cpuid_to_hartid_map[NR_CPUS] to map Xen logical CPUs to
> > hart IDs (physical CPU IDs). Add auxiliary macros cpuid_to_hartid()
> > for convenient access to this mapping.
> >=20
> > Define smp_processor_id() to provide accurate information,
> > replacing the previous "dummy" value of 0.
> >=20
> > Initialize tp registers to point to pcpu_info[0].
> > Set processor_id to 0 for logical CPU 0 and store the physical CPU
> > ID
> > for the current logical CPU in cpuid_to_hartid_map[].
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V4:
> > =C2=A0- wrap id with () inside set_processor_id().
> > =C2=A0- code style fixes
> > =C2=A0- update BUG_ON(id > NR_CPUS) in smp_processor_id() and drop the
> > comment
> > =C2=A0=C2=A0 above BUG_ON().
> > =C2=A0- s/__cpuid_to_hartid_map/cpuid_to_hartid_map
> > =C2=A0- s/cpuid_to_hartid_map/cpuid_to_harti ( here cpuid_to_hartid_map
> > is the name
> > =C2=A0=C2=A0 of the macros ).
> > =C2=A0- update the commit message above the code of TP register
> > initialization in
> > =C2=A0=C2=A0 start_xen().
>=20
> I guess that's once again "comment", not "commit message"?
Yes, sorry for confusion. It should be comment.

>=20
> > --- a/xen/arch/riscv/include/asm/processor.h
> > +++ b/xen/arch/riscv/include/asm/processor.h
> > @@ -12,8 +12,32 @@
> > =C2=A0
> > =C2=A0#ifndef __ASSEMBLY__
> > =C2=A0
> > -/* TODO: need to be implemeted */
> > -#define smp_processor_id() 0
> > +#include <xen/bug.h>
> > +
> > +register struct pcpu_info *tp asm ("tp");
> > +
> > +struct pcpu_info {
> > +=C2=A0=C2=A0=C2=A0 unsigned int processor_id;
> > +};
> > +
> > +/* tp points to one of these */
> > +extern struct pcpu_info pcpu_info[NR_CPUS];
> > +
> > +#define get_processor_id()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (tp->processo=
r_id)
> > +#define set_processor_id(id)=C2=A0=C2=A0=C2=A0 do { \
> > +=C2=A0=C2=A0=C2=A0 tp->processor_id =3D (id);=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +} while (0)
> > +
> > +static inline unsigned int smp_processor_id(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned int id;
> > +
> > +=C2=A0=C2=A0=C2=A0 id =3D get_processor_id();
> > +
> > +=C2=A0=C2=A0=C2=A0 BUG_ON(id > NR_CPUS);
>=20
> > =3D ?
>=20
> > --- a/xen/arch/riscv/include/asm/smp.h
> > +++ b/xen/arch/riscv/include/asm/smp.h
> > @@ -5,6 +5,8 @@
> > =C2=A0#include <xen/cpumask.h>
> > =C2=A0#include <xen/percpu.h>
> > =C2=A0
> > +#define INVALID_HARTID UINT_MAX
> > +
> > =C2=A0DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
> > =C2=A0DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
> > =C2=A0
> > @@ -14,6 +16,14 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
> > =C2=A0 */
> > =C2=A0#define park_offline_cpus false
> > =C2=A0
> > +void smp_set_bootcpu_id(unsigned long boot_cpu_hartid);
> > +
> > +/*
> > + * Mapping between linux logical cpu index and hartid.
> > + */
> > +extern unsigned long cpuid_to_hartid_map[NR_CPUS];
> > +#define cpuid_to_hartid(cpu) cpuid_to_hartid_map[cpu]
>=20
> How wide can hart IDs be? Wider than 32 bits? If not, why unsigned
> long?
According to the spec:
```
The mhartid CSR is an MXLEN-bit read-only register containing the
integer ID of the hardware thread running the code
```
where MXLEN can bit 32 and 64.

> If so, what about RV32 (which generally you at least try cover where
> easily possible)?
On RV32 MXLEN will be 32 and unsigned long will be 32-bit too.

>=20
> Is there a reason this needs to be a separate array, rather than
> being
> part of struct pcpu_info?
>=20
> > @@ -40,6 +41,19 @@ void __init noreturn start_xen(unsigned long
> > bootcpu_id,
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 remove_identity_mapping();
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * tp register contains an address of physical=
 cpu
> > information.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * So write physical CPU info of boot cpu to t=
p register
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * It will be used later by get_processor_id()=
 ( look at
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * <asm/processor.h> ):
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 #define get_processor_id()=C2=
=A0=C2=A0=C2=A0 (tp->processor_id)
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 asm volatile ( "mv tp, %0" : : "r"((unsigned
> > long)&pcpu_info[0]) );
>=20
> Perhaps be on the safe side and also add a memory barrier?
Do you mean compiler barrier? ( asm volatile ( "..." :: ... : "memory"
)? )

>=20
> Perhaps be on the safe side and do this absolutely first in the
> function,
> or even in assembly (such that initializers of future variables
> declared
> at the top of the function end up safe, too)?
I am not sure that I am following your part related to put this code in
assembler ( instructions in assembly code still code be re-ordered what
can affect a time when tp will be set with correct value ) and what do
you mean by "initializers of future variables declared at the top of
the function end up safe"
>=20
> Also nit: Blank please between closing quote and opening parenthesis.
> (Otoh you could omit the blank between the two colons.)
>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/smp.c
> > @@ -0,0 +1,4 @@
> > +#include <xen/smp.h>
> > +
> > +/* tp points to one of these per cpu */
> > +struct pcpu_info pcpu_info[NR_CPUS];
>=20
> And they all need setting up statically? Is there a plan to make this
> dynamic (which could be recorded in a "fixme" in the comment)?
I didn't plan to make allocation of this array dynamic. I don't expect
that NR_CPUS will be big. I can add "fixme" but I am not really
understand what will be advantages if pcpu_info[] will be allocated
dynamically.

~ Oleksii

