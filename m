Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B9393FB35
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 18:32:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767017.1177586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYTIT-0005wb-QY; Mon, 29 Jul 2024 16:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767017.1177586; Mon, 29 Jul 2024 16:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYTIT-0005tP-NA; Mon, 29 Jul 2024 16:32:29 +0000
Received: by outflank-mailman (input) for mailman id 767017;
 Mon, 29 Jul 2024 16:32:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZrP=O5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sYTIR-0005sp-V1
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 16:32:27 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 240127f1-4dc8-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 18:32:26 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52ed9b802ceso4452390e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 09:32:26 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c19aaesm1554442e87.185.2024.07.29.09.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 09:32:25 -0700 (PDT)
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
X-Inumbo-ID: 240127f1-4dc8-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722270746; x=1722875546; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1WmRZqnnBctnsmGuHbBlHpFp7XEp/UwX4oCLiQS8AvM=;
        b=Fiui5DIlr1AtIeq7FYbBE/r7gURN6HwS2gaCM/yT+4hf9J8+xL9QRol+y/fFICUJjO
         ikPqWJ90P8iYhuYERtzzHjmT6KS9o6Kt5PL95899iC7QP06bA68TyQ71HH4tZnw7eLxq
         uL4ZIfEAhP/2r+NkLKtpOHtKt6yc7PYVKVFfMzP95hlvL1jpVxq1jOtIc2W8PYZ/uGiB
         v+GNCm6yncvE38N5qxsrzn9JfqgHUSotbUBpJMWW9Y3281XSziBnoh5+QX6b/jAbJ0t5
         JugOBLgdWTxp9B116iHZZ2u/2mysh5eLX4cAwtEKp/DlqaO9hDHJjWI2m0iFNRc5F4dU
         ejtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722270746; x=1722875546;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WmRZqnnBctnsmGuHbBlHpFp7XEp/UwX4oCLiQS8AvM=;
        b=PUcCAOom07TESqIwMD15ydubQyuhjV3fIX+TIG8U0S0mHz3pJNm2ec1odkqoq/mppP
         Ik0+lmFVVea0FLlLPgIwLoi8nOaABBQW8a59SpP8SbE9ruCDFnyZ14GIKwCHFUxixCny
         CnGcAbjAw5dlkn1Kznp+zq5Qy5NjU8fhQTbHXcySE+xElHucDU3fasAolGrZmyqFe5pP
         VCnPtMPBaY6BxnXcG4bgq4qrmY7UOmhcN5MEiKS5CYyc9aqr/0of5VDh3n5hs3V/QcFM
         Tp6DoAazOamPzb2M3lqgz1ieBuRo/XEmrNcyFo80gNeJtet5qaE0Kq6nzPgSNtOkVggJ
         2a8A==
X-Forwarded-Encrypted: i=1; AJvYcCUrEGwWb9XrxMKthl4gCV1d+2/e2zigOqHvS7KvxNbpnPbcqtZmBsM1sm/q/4rkFACCPqYrsmb5gVRMU+kHRZq7tCrmGfG9zPd+bgElRDQ=
X-Gm-Message-State: AOJu0Yw0+dd3dqYzBit39jn9QfxUcGU5ObrWXaK1sf2RKSLMC/vvl7dq
	DAlK74xLR4kj95zIUpExNiYkSq48Ka0ZV71BU7GWv1ZSj8QLpx3O
X-Google-Smtp-Source: AGHT+IHfLqgai3Y8lol/ByCT1xwt1Jle6NBA5r02y4m9CZ1J1VnTs90N96ViIVfCcy3Fct6jlY/NNA==
X-Received: by 2002:ac2:4db6:0:b0:52f:cd03:a850 with SMTP id 2adb3069b0e04-5309b27d44fmr5844414e87.32.1722270745468;
        Mon, 29 Jul 2024 09:32:25 -0700 (PDT)
Message-ID: <370588e93fe59acb0ae1f26416541290004e593b.camel@gmail.com>
Subject: Re: [PATCH v3 6/9] xen/riscv: introduce functionality to work with
 cpu info
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 29 Jul 2024 18:32:24 +0200
In-Reply-To: <113b9d4a-d31c-4491-bf8c-96ac97d98f45@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <4ea9005d4209e24df9b30a7b3c282276084a3cf1.1721834549.git.oleksii.kurochko@gmail.com>
	 <113b9d4a-d31c-4491-bf8c-96ac97d98f45@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-29 at 17:28 +0200, Jan Beulich wrote:
> On 24.07.2024 17:31, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/processor.h
> > +++ b/xen/arch/riscv/include/asm/processor.h
> > @@ -12,8 +12,39 @@
> > =C2=A0
> > =C2=A0#ifndef __ASSEMBLY__
> > =C2=A0
> > -/* TODO: need to be implemeted */
> > -#define smp_processor_id() 0
> > +#include <xen/bug.h>
> > +#include <xen/types.h>
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
> > +=C2=A0=C2=A0=C2=A0 tp->processor_id =3D id;=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>=20
> Nit: Parentheses around id please.
>=20
> > +} while(0)
>=20
> While often we omit the blanks inside the parentheses for such
> constructs, the one ahead of the opening paren should still be there.
>=20
> > +static inline unsigned int smp_processor_id(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned int id;
> > +
> > +=C2=A0=C2=A0=C2=A0 id =3D get_processor_id();
> > +
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * Technically the hartid can be greater than =
what a uint can
> > hold.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * If such a system were to exist, we will nee=
d to change
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * the smp_processor_id() API to be unsigned l=
ong instead of
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * unsigned int.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 BUG_ON(id > UINT_MAX);
>=20
> Compilers may complaing about this condition being always false. But:
> Why
> do you check against UINT_MAX, not against NR_CPUS?=C2=A0
Because HART id theoretically could be greater then what unsigned int
can provide thereby NR_CPUS could be also greater then unsigned int (
or it can't ? ).
Generally I agree it would be better to compare it with NR_CPUS.

> It's not the hart ID
> your retrieving get_processor_id(), but Xen's, isn't it?
You are right it is Xen's CPU id.


>  Even if I'm
> missing something here, ...
>=20
> > --- a/xen/arch/riscv/include/asm/smp.h
> > +++ b/xen/arch/riscv/include/asm/smp.h
> > @@ -5,6 +5,8 @@
> > =C2=A0#include <xen/cpumask.h>
> > =C2=A0#include <xen/percpu.h>
> > =C2=A0
> > +#define INVALID_HARTID UINT_MAX
>=20
> ... this implies that the check above would need to use >=3D.
>=20
> > @@ -14,6 +16,14 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
> > =C2=A0 */
> > =C2=A0#define park_offline_cpus false
> > =C2=A0
> > +void smp_setup_processor_id(unsigned long boot_cpu_hartid);
> > +
> > +/*
> > + * Mapping between linux logical cpu index and hartid.
> > + */
> > +extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
> > +#define cpuid_to_hartid_map(cpu) __cpuid_to_hartid_map[cpu]
>=20
> May I please ask that there be no new variables with double
> underscores
> at the front or any other namespacing violations?
I just couldn't come up with better naming for __cpuid_to_hartid_map[]
to show that it is private array. I will update the namings here.

> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -40,6 +40,19 @@ void __init noreturn start_xen(unsigned long
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
 to get
> > process_id ( look at
>=20
> process_id?
I meant processor_id here.

>=20
>=20
> > +};
> > +
> > +void __init smp_setup_processor_id(unsigned long boot_cpu_hartid)
> > +{
> > +=C2=A0=C2=A0=C2=A0 cpuid_to_hartid_map(0) =3D boot_cpu_hartid;
> > +}
>=20
> The function name suggests this can be used for all CPUs, but the
> code is pretty clear abut this being for the boot CPU only.
Then I will rename it to setup_bootcpu_id(...).

Thanks.

~ Oleksii


