Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3764D962552
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 12:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784687.1194070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjGLk-0004av-VN; Wed, 28 Aug 2024 10:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784687.1194070; Wed, 28 Aug 2024 10:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjGLk-0004Yx-Sb; Wed, 28 Aug 2024 10:56:28 +0000
Received: by outflank-mailman (input) for mailman id 784687;
 Wed, 28 Aug 2024 10:56:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3BgB=P3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sjGLi-0004Td-UM
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 10:56:26 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b30c350-652c-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 12:56:25 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5334adf7249so7785207e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 03:56:25 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334ea36a17sm2106591e87.95.2024.08.28.03.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 03:56:23 -0700 (PDT)
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
X-Inumbo-ID: 2b30c350-652c-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724842584; x=1725447384; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9b4N4oGt0bxH+CCXjlFKEAXH981ACmRGX5u+yhg76/Y=;
        b=fTFpHRthDYlbTwBof8yRqKooh4zwz5VmmsghHyWvxIj5MksnUcJlHtDMovvMtF5RPe
         PPV8hs2wNW8L2KaX4tA8tdv0eV85c57haf2swAE9OGNxl+kTMEq/NOIuwe2Pv3GcCcAQ
         KAL2o1ZIhdpUTXdmUNhTVovLSl4O6hBjF33+xC6ajK7UwnWMcCtb8ogC6Pnqh1nG/433
         3X6HoSWMP7O7TUxZI7MgSrjqPwS64+v4CP12B0oINLphNdMYLXMe9Pu97F4lH+u88A2k
         x3tWyRb3YfLOeSpsEuWU6vubMZhH0GBHO3HPLPln+Ah/Pit9zdvRtWqxkdMkLiGzq53O
         03Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724842584; x=1725447384;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9b4N4oGt0bxH+CCXjlFKEAXH981ACmRGX5u+yhg76/Y=;
        b=lhyQJAqI6I8YOReS4aaxG5XZTUHQ8UutRXv0lI7swqtJmOflipINBOe4OCyluNefTQ
         IaUeWmJ1gvMAw2iYG/xi8EmbJEaJTE/Duchfx/P0Kvkiws1vLFw5351XdMnTcqAwDfuF
         rigC0csC9/eQMXq0MOn4f5AP95ubG26WqVdlDmU41cDiuiiLgF4zNTxS9bTOaphC05fG
         /LqtM0Hf+2uy8IjtKZi8S+MBuFwGqw+dVclb+dKFgjE7737W15/rzPKFEqRoMx7CNMw0
         Vchm9m0aiX4Rs9vZCgpLG9FC48IP4HUsIRDn+58Zq4OPoEEuIPXeIpAwrAhdPMZefW6z
         bgyw==
X-Forwarded-Encrypted: i=1; AJvYcCVPHLwbsREdrvcHkRcx3c0rcH08icViN45AgbAZgqbNIYAp599YOq2HLF2wkkgk8B+V0DyHe8r6Yt8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9PRR87fyiPQeRMMbhgDUyG+ixlUXBq1xCurb9M/+DAHlzQZ1f
	IGQMZu9v2lSIhHtDWqkkmc5Q6VYKrVUqTF6p1GlOmLTnCo2MehnD
X-Google-Smtp-Source: AGHT+IEwe32BCxbbMbVYptW0bJtu0II+e4d3ITPihawHRicYxNi0hZVtoItAEuBacwxXa6gZ7I8hJA==
X-Received: by 2002:a05:6512:33cd:b0:533:48c9:754d with SMTP id 2adb3069b0e04-5346c622a69mr1035142e87.34.1724842583718;
        Wed, 28 Aug 2024 03:56:23 -0700 (PDT)
Message-ID: <d5c6b74609d18a18ef789e795d6ce72469bff277.camel@gmail.com>
Subject: Re: [PATCH v5 4/7] xen/riscv: introduce functionality to work with
 CPU info
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 28 Aug 2024 12:56:22 +0200
In-Reply-To: <8f01fffa-ff7e-4a08-b707-7bf5175b461e@suse.com>
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
	 <03a703996ae7300a9eda54283711b19c42a7d116.1724256027.git.oleksii.kurochko@gmail.com>
	 <8f01fffa-ff7e-4a08-b707-7bf5175b461e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-08-27 at 15:44 +0200, Jan Beulich wrote:
> On 21.08.2024 18:06, Oleksii Kurochko wrote:

>=20
> > --- a/xen/arch/riscv/include/asm/smp.h
> > +++ b/xen/arch/riscv/include/asm/smp.h
> > @@ -5,6 +5,10 @@
> > =C2=A0#include <xen/cpumask.h>
> > =C2=A0#include <xen/percpu.h>
> > =C2=A0
> > +#include <asm/processor.h>
> > +
> > +#define INVALID_HARTID ULONG_MAX
>=20
> So what if the firmware report this value for one of the harts?
It could be an issue, but in my opinion, there is a small chance that
the firmware will use such a high number. I can add a BUG_ON() in
start_xen() to check that bootcpu_id is not equal to INVALID_HARTID to
ensure that the firmware does not report this value. Otherwise, we
would need to add a 'bool valid;' to struct pcpu_info and use it
instead of INVALID_HARTID.

> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -8,6 +8,7 @@
> > =C2=A0#include <public/version.h>
> > =C2=A0
> > =C2=A0#include <asm/early_printk.h>
> > +#include <asm/smp.h>
> > =C2=A0#include <asm/traps.h>
> > =C2=A0
> > =C2=A0void arch_get_xen_caps(xen_capabilities_info_t *info)
> > @@ -40,6 +41,10 @@ void __init noreturn start_xen(unsigned long
> > bootcpu_id,
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 remove_identity_mapping();
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 set_processor_id(0);
>=20
> This isn't really needed, is it? The pcpu_info[] initializer already
> installs the necessary 0. Another thing would be if the initializer
> set the field to, say, NR_CPUS.
>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/smp.c
> > @@ -0,0 +1,21 @@
> > +#include <xen/smp.h>
> > +
> > +/*
> > + * FIXME: make pcpu_info[] dynamically allocated when necessary
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 functionality will be rea=
dy
> > + */
> > +/* tp points to one of these per cpu */
> > +struct pcpu_info pcpu_info[NR_CPUS] =3D { { 0, INVALID_HARTID } };
>=20
> As to the initializer - what about CPUs other than CPU0? Would they
> better all have hart_id set to invalid?
I thought about that, but I decided that if we have INVALID_HARTID as
hart_id and the hart_id is checked in the appropriate places, then it
doesn't really matter what the processor_id member of struct pcpu_info
is. For clarity, it might be better to set it to an invalid value, but
it doesn't clear which value we should choose as invalid. I assume that
NR_CPUS is a good candidate for that?

>=20
> Also, as a pretty strong suggestion to avoid excessive churn going
> forward: Please consider using dedicated initializers here. IOW
> perhaps
>=20
> struct pcpu_info pcpu_info[NR_CPUS] =3D { [0 ... NR_CPUS - 1] =3D {
> =C2=A0=C2=A0=C2=A0 .hart_id =3D INVALID_HARTID,
> }};
>=20
> Yet as said earlier - in addition you likely want to make sure no
> two CPUs have (part of) their struct instance in the same cache line.
> That won't matter right now, as you have no fields you alter at
> runtime, but I expect such fields will appear.
Is my understanding correct that adding __cacheline_aligned will be
sufficient:
   struct pcpu_info {
   ...
   } __cacheline_aligned;


>=20
> > +void setup_tp(unsigned int cpuid)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * tp register contains an address of physical=
 cpu
> > information.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * So write physical CPU info of cpuid to tp r=
egister.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * It will be used later by get_processor_id()=
 ( look at
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * <asm/processor.h> ):
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 #define get_processor_id()=C2=
=A0=C2=A0=C2=A0 (tp->processor_id)
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 asm volatile ( "mv tp, %0"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :: "r" ((unsigned long)&pcpu_info[c=
puid]) :
> > "memory" );
> > +}
>=20
> So you've opted to still do this in C. Which means there's still a
> residual risk of the compiler assuming it can already to tp. What's
> the problem with doing this properly in assembly?
There is no problem and to be on the safe side I will re-write it to
assembly.

>=20
> As to the memory clobber - in an isolated, non-inline function its
> significance is reduced mostly to the case of LTO (which I'm not
> sure you even target). Nevertheless probably worth keeping, even if
> mainly for documentation purposes. Provided of course this C function
> is to remain.
>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/smpboot.c
> > @@ -0,0 +1,8 @@
> > +#include <xen/init.h>
> > +#include <xen/sections.h>
> > +#include <xen/smp.h>
> > +
> > +void __init smp_set_bootcpu_id(unsigned long boot_cpu_hartid)
> > +{
> > +=C2=A0=C2=A0=C2=A0 cpuid_to_hartid(0) =3D boot_cpu_hartid;
> > +}
>=20
> Does this really need its own function?
No, there is no such need. I will drop it.

Thanks.

~ Oleksii

