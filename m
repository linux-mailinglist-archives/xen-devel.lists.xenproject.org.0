Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A93952AF3
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 10:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777907.1187966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seWGr-0001eo-Sm; Thu, 15 Aug 2024 08:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777907.1187966; Thu, 15 Aug 2024 08:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seWGr-0001bf-PF; Thu, 15 Aug 2024 08:55:49 +0000
Received: by outflank-mailman (input) for mailman id 777907;
 Thu, 15 Aug 2024 08:55:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQtD=PO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1seWGq-0001bR-K5
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 08:55:48 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2907367a-5ae4-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 10:55:46 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ef25511ba9so14255111fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 01:55:46 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f3b7703301sm1396101fa.87.2024.08.15.01.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 01:55:44 -0700 (PDT)
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
X-Inumbo-ID: 2907367a-5ae4-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723712145; x=1724316945; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7mrSkYK4uXXwog8EAyCTl9aZpwWR0PwqYgBxBBHzYDY=;
        b=ktscVWr85kFoAFPK4SBK24R6rJ2NTGsBw3kAHqQUtyT/Z8I+jO3IV1oLYd2CSWJ0BK
         Kn9kvQuWaLh7NBhaRJq/MIGQTMTAjC1XBxtYzkd+/PEAFVluL3l3diNg3T2WpMWwintG
         0SdwrDg1epQkEiEqge9fNiYAyq1qwT5dVAzGdTblwrj973d/btD0mEwnOEDMp9evD3+D
         tIFhJPzsVVE7HYrqxb9cMWk1UDZyokf5kHDP12OyUExfgM26bI+xjWMA65SMZhDQ+qR/
         3crAeyhUh2wbUB6dphVkkIkGt9asNZzqq8J0gZJqB4TzHHmr9h2Vnm+wz76rT0/gskFJ
         G/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723712145; x=1724316945;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7mrSkYK4uXXwog8EAyCTl9aZpwWR0PwqYgBxBBHzYDY=;
        b=Vl9YvBrZOJwcgG8+WwDTEYTKkN3+DlWx570zso89nQsr+Il4+KJLq8j9KZnzci1HAl
         2uZHeHDFzi5oJKZRWu5dTbvYqmnJ+oxUyLpNyzl0VkW+dILgaFHdKQvjGZklRaJI8Q2D
         kJ3X2yWeSUNQsX17p8uPNK3qew4xm4cyw8KfKZPmfeFrkRHnS8SqBn7YT3e1lv8hvHR1
         6BE7MjGUsdEkGk+7JI33gsFTTh3CsrGYrrRTZQ3lolqW11fXqiobQYod5Ek4gNEDJyfZ
         IQUPBIEho3U0pt+yuovKPbJGl2HJnuh2d1YDyMo9oSt8i41vPDlc8i5EPywWWU4Qpsqe
         dv1A==
X-Forwarded-Encrypted: i=1; AJvYcCXurcSuy+MCsJar4vQ8qYufibClZ0NR3tX7a81GcJoPZq5lutb6eUW0Is16J4oluGjAxOXUmN8HZqJpx4pRZfRqnanGNOZrWfEALiZDh3Y=
X-Gm-Message-State: AOJu0YznF7qPmzWzjy48oo8ugaRBNMRjj2LaYap4mOsT37JecN7xrTlg
	GG7NJpeMjQbma6UTJ+NGPLAm/TW03NdkiMGYvhBCSQDw6Pdom352
X-Google-Smtp-Source: AGHT+IEur516owWdc+SxJJlq88vE9ubJzz0Fq7XFmfR3i7do9BVSq+cSmeeohvSi5DXz9VMH16T3kw==
X-Received: by 2002:a05:651c:b29:b0:2ef:2fa1:954f with SMTP id 38308e7fff4ca-2f3b3bc2361mr6590911fa.18.1723712145113;
        Thu, 15 Aug 2024 01:55:45 -0700 (PDT)
Message-ID: <2184097c00f84f707fabadff240f977827a3c927.camel@gmail.com>
Subject: Re: [PATCH v4 4/7] xen/riscv: introduce functionality to work with
 CPU info
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2024 10:55:43 +0200
In-Reply-To: <dfb4678f-0b2d-4d1c-be02-10c4720e57b2@suse.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
	 <452e2960d1f064a2e3abcaae1ac354f48aafd24c.1723214540.git.oleksii.kurochko@gmail.com>
	 <e0285026-40c5-4316-8129-d07801a9c233@suse.com>
	 <ee3a2e61435e860f1ddb6022fbb712a8d890ae3e.camel@gmail.com>
	 <dfb4678f-0b2d-4d1c-be02-10c4720e57b2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-08-14 at 17:22 +0200, Jan Beulich wrote:
> On 14.08.2024 16:45, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-08-13 at 10:54 +0200, Jan Beulich wrote:
> > > On 09.08.2024 18:19, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/riscv/include/asm/smp.h
> > > > +++ b/xen/arch/riscv/include/asm/smp.h
> > > > @@ -5,6 +5,8 @@
> > > > =C2=A0#include <xen/cpumask.h>
> > > > =C2=A0#include <xen/percpu.h>
> > > > =C2=A0
> > > > +#define INVALID_HARTID UINT_MAX
> > > > +
> > > > =C2=A0DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
> > > > =C2=A0DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
> > > > =C2=A0
> > > > @@ -14,6 +16,14 @@ DECLARE_PER_CPU(cpumask_var_t,
> > > > cpu_core_mask);
> > > > =C2=A0 */
> > > > =C2=A0#define park_offline_cpus false
> > > > =C2=A0
> > > > +void smp_set_bootcpu_id(unsigned long boot_cpu_hartid);
> > > > +
> > > > +/*
> > > > + * Mapping between linux logical cpu index and hartid.
> > > > + */
> > > > +extern unsigned long cpuid_to_hartid_map[NR_CPUS];
> > > > +#define cpuid_to_hartid(cpu) cpuid_to_hartid_map[cpu]
> > >=20
> > > How wide can hart IDs be? Wider than 32 bits? If not, why
> > > unsigned
> > > long?
> > According to the spec:
> > ```
> > The mhartid CSR is an MXLEN-bit read-only register containing the
> > integer ID of the hardware thread running the code
> > ```
> > where MXLEN can bit 32 and 64.
>=20
> Hmm, okay. If the full MXLEN bits can be used, then using unsigned
> long
> is indeed the right thing here.
>=20
> > > > @@ -40,6 +41,19 @@ void __init noreturn start_xen(unsigned long
> > > > bootcpu_id,
> > > > =C2=A0{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 remove_identity_mapping();
> > > > =C2=A0
> > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * tp register contains an address of phys=
ical cpu
> > > > information.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * So write physical CPU info of boot cpu =
to tp register
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * It will be used later by get_processor_=
id() ( look at
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * <asm/processor.h> ):
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 #define get_processor_id()=
=C2=A0=C2=A0=C2=A0 (tp->processor_id)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 asm volatile ( "mv tp, %0" : : "r"((unsigned
> > > > long)&pcpu_info[0]) );
> > >=20
> > > Perhaps be on the safe side and also add a memory barrier?
> > Do you mean compiler barrier? ( asm volatile ( "..." :: ... :
> > "memory"
> > )? )
>=20
> Yes.
>=20
> > > Perhaps be on the safe side and do this absolutely first in the
> > > function,
> > > or even in assembly (such that initializers of future variables
> > > declared
> > > at the top of the function end up safe, too)?
> > I am not sure that I am following your part related to put this
> > code in
> > assembler ( instructions in assembly code still code be re-ordered
> > what
> > can affect a time when tp will be set with correct value )
>=20
> I'm afraid I don't understand this. Instructions can be re-ordered,
> sure,
> but later instructions are guaranteed to observe the effects on
> register
> state that earlier instructions caused.
>=20
> > and what do
> > you mean by "initializers of future variables declared at the top
> > of
> > the function end up safe"
>=20
> With
>=20
> void start_xen()
> {
> =C2=A0=C2=A0=C2=A0 int var =3D func();
>=20
> =C2=A0=C2=A0=C2=A0 asm volatile ( "mv tp, %0" :: ...);
> =C2=A0=C2=A0=C2=A0 ...
>=20
> you end up with the requirement that func() must not use anything
> that
> depends on tp being set. In this simple example it may be easy to say
> "don't use an initializer and call the function afterwards". But that
> is
> going to be a risky game to play. Look at x86'es __start_xen(). An
> insertion into such a big set of declarations may not pay attention
> to
> tp not being set yet, when _all_ other C code may reasonably assume
> tp
> is set.
Thanks for the clarification. I missed the possibility that someone
might accidentally use tp before it is set. In this case, I agree that
it would be better to create a setup_tp() function and call it before
start_xen().

>=20
> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/smp.c
> > > > @@ -0,0 +1,4 @@
> > > > +#include <xen/smp.h>
> > > > +
> > > > +/* tp points to one of these per cpu */
> > > > +struct pcpu_info pcpu_info[NR_CPUS];
> > >=20
> > > And they all need setting up statically? Is there a plan to make
> > > this
> > > dynamic (which could be recorded in a "fixme" in the comment)?
> > I didn't plan to make allocation of this array dynamic. I don't
> > expect
> > that NR_CPUS will be big.
>=20
> What is this expectation of yours based on? Other architectures
> permit
> systems with hundreds or even thousands of CPUs; why would RISC-V be
> different there?
Based on available dev boards. ( what isn't really strong argument )

I checked other architectures and they are using static allocation too:
   struct cpuinfo_x86 cpu_data[NR_CPUS];
  =20
   u32 x86_cpu_to_apicid[NR_CPUS] __read_mostly =3D
   	{ [0 ... NR_CPUS-1] =3D BAD_APICID };
  =20
   ... /* Arm */
  =20
   struct cpuinfo_arm cpu_data[NR_CPUS];

I wanted to check to understand which one API should be used to
allocate this array dynamically. xmalloc?

And I am curious how I can use xmalloc() at this stage if page
allocator (?) should be initialized what isn't true now.
Or just to allocate pcpu_info only for boot cpu and for other then use
xmalloc()?

>=20
> > I can add "fixme" but I am not really
> > understand what will be advantages if pcpu_info[] will be allocated
> > dynamically.
>=20
> Where possible it's better to avoid static allocations, of which on
> some systems only a very small part may be used. Even if you put
> yourself
> on the position that many take - memory being cheap - you then still
> waste cache and TLB bandwidth. Furthermore as long as struct
> pcpu_info
> isn't big enough (and properly aligned) for two successive array
> entries
> to not share cache lines, you may end up playing cacheline ping-pong
> when a CPU writes to its own array slot.
Why the mentioned issues aren't work for dynamic memory? We still
allocating memory for sizeof(pcpu_info) * NR_CPUS and when this
allocated memory access it will go to cache, CPU/MMU still will use TLB
for address translation for this region and without a proper alignment
of pcpu_info size it still could be an issue with cache line sharing.

~ Oleksii


