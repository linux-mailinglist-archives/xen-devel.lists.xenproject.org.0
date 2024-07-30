Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EF3940C13
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 10:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767372.1177983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYiTX-0000LH-Us; Tue, 30 Jul 2024 08:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767372.1177983; Tue, 30 Jul 2024 08:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYiTX-0000Iv-Rc; Tue, 30 Jul 2024 08:44:55 +0000
Received: by outflank-mailman (input) for mailman id 767372;
 Tue, 30 Jul 2024 08:44:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3FYA=O6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sYiTW-0000IK-LI
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 08:44:54 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fceb3578-4e4f-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 10:44:52 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso400809066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 01:44:52 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab235fesm615910466b.36.2024.07.30.01.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 01:44:51 -0700 (PDT)
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
X-Inumbo-ID: fceb3578-4e4f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722329092; x=1722933892; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6I/dVUGdVTQaJjNIE9OK2jT6xxy9qmocb7jXgDWAWH0=;
        b=XcTRhAgx3c3Dnqk1u+N/51HfkSXQXAcqjlA+2KoOGMaIu2pcXv4itwGSC6Afhf2DZO
         Rw4d4PSMdpLVR1COhxhrI2CRJY/GBwu2XrDafURmozuGxXD3lUKMNnysjfX03+/aW7sv
         aqLX+YzFkqLYG/dU62TIsED4F21ChGUw/F270taPuUr7bMeQv7T30vQsw4X8QzLztyGO
         jJzVQMkGcD7DnLlMZ8Ni8Ongna5ZZ4NouRsL271rRH+KTeVjg8H3Mwk3D00xnusaArSQ
         R8Mr2IlXTh4bnPmdXZwQmyX4N9+zXHeC8xx0H+1c5t2En5qNADmeKhmtvpAEYHrEQ1sl
         WN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722329092; x=1722933892;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6I/dVUGdVTQaJjNIE9OK2jT6xxy9qmocb7jXgDWAWH0=;
        b=uGLS00cfxCH0M/8Q/BZniozC9HclP9fxvr/wbcDjObKhEjUV5HqZKDb+apD41zAilq
         GbDP1qUQH0X1KdzNHVabx6Ux4DHDEROtXyyIuJahoagPoAWldBp/tmYhRe7chTDGWzvm
         GQG/6ylAR0TORngWX/d0bBqJPAAbD9F3HWKS8235QNvWA/FFZOLrz5xxoKnI1+iqjmOu
         409BRYtVY1VBm7PKNbOO30iIrQlKFO92NeZOAe4eiAb87hBfmrl0dtCoOA2jz3E8/u8T
         DVshCvhdJvwA3oXHHk1cJPfzC9L6oBZKgCXuWJCTxzaWIXH+X0+WDrC9pY9kjK7Xlt20
         0cpw==
X-Forwarded-Encrypted: i=1; AJvYcCWTm6AipFo3YgyWmavsnC2uwK53PDH6HMYdiEGutG3mDTkz4RUOGS/kcbRbFzFC6H07tv3LeYPIktnbASQJwQOmoKI+2H5RH007YFqfAM8=
X-Gm-Message-State: AOJu0Ywy0cTDqJMWdqCrY2WABhv2Qzi9q9SW55Xm6VLcWJHUQj8EEJUA
	FKum3bgz4hgI0iw9uYg+WFIvmhPVM4cgL0Mm9Spiy44/uDbtIeB/
X-Google-Smtp-Source: AGHT+IEQuiP2uWEAEATirapGpowcEdMQMAhbDxgqdyDNslDa3XjcQ9LNfKnICKFftNiJNQEgXOgmFg==
X-Received: by 2002:a17:907:874c:b0:a7a:a138:dbd4 with SMTP id a640c23a62f3a-a7d401916bbmr740303966b.64.1722329091692;
        Tue, 30 Jul 2024 01:44:51 -0700 (PDT)
Message-ID: <b7433d25bb3ca7a0f4e54f561b450b5724fb46dc.camel@gmail.com>
Subject: Re: [PATCH v3 7/9] xen/riscv: introduce and init SBI RFENCE
 extension
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 30 Jul 2024 10:44:50 +0200
In-Reply-To: <49d3a181-0830-4f55-83a4-c6c9fd54eb17@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <fb2d24731f870378d79077be39b1bc19cc655327.1721834549.git.oleksii.kurochko@gmail.com>
	 <49d3a181-0830-4f55-83a4-c6c9fd54eb17@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-29 at 17:52 +0200, Jan Beulich wrote:
> On 24.07.2024 17:31, Oleksii Kurochko wrote:
>=20
>=20
> > +/*
> > + * Send SFENCE_VMA to a set of target HARTs.
> > + *
> > + * @param hart_mask mask representing set of target HARTs
> > + * @param start virtual address start
> > + * @param size virtual address size
>=20
> Are these really virtual addresses, not somehow a bias and a number
> of bits (CPUs) or elements? From the rest of the patch I can't deduce
> what these two parameters express.
According to SBI doc start is an virtual address:
https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-rfence.a=
doc?plain=3D1#L44

and hart_mask is:
=E2=80=A2 unsigned long hart_mask is a scalar bit-vector containing hartids


>=20
> > + */
> > +void sbi_remote_sfence_vma(const unsigned long *hart_mask,
>=20
> Maybe better hart_mask[]? It's not clear to me though what the upper
> bound of the array is.
Theoretically it is ULONGMAX but we don't looking more then
CONFIG_NR_CPUS.

>=20
> > +
> > +static void sbi_cpumask_to_hartmask(const struct cpumask *cmask,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct cpumask *hmask)
>=20
> I doubt it is valud to re-use struct cpumask for hart maps.
Why not? Would it be better to use unsigned long *hmask?

>=20
> > +{
> > +=C2=A0=C2=A0=C2=A0 u32 cpu;
>=20
> uint32_t or yet better unsigned int please.
>=20
> > +=C2=A0=C2=A0=C2=A0 unsigned long hart =3D INVALID_HARTID;
> > +
> > +=C2=A0=C2=A0=C2=A0 if (!cmask || !hmask)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > +
> > +=C2=A0=C2=A0=C2=A0 cpumask_clear(hmask);
> > +=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cmask)
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( CONFIG_NR_CPUS <=3D cp=
u )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pri=
ntk(XENLOG_ERR "SBI: invalid hart=3D%lu for
> > cpu=3D%d\n",
>=20
> %u for the CPU please.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hart, cpu);
>=20
> "hart" wasn't set yet and hence is invalid or at least misleading to
> log.
That why it will print INVALID_HARTID which user will identify as
invalid hartid.
Do you mean that there is no any sense to message "invalid hart=3D%lu" as
it is obviously invalid?

>=20
> Nit: Indentation.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
tinue;
>=20
>=20
> Can you really sensibly continue in such a case?
I think yes, the worst thing we will have is that the "bad" CPU won't
be used.
But it might be better to switch to BUG_ON() as if we are inised the
"if CONFIG_NR_CPUS <=3D cpu" then it could tell us that something went
wrong.


>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hart =3D cpuid_to_hartid_ma=
p(pcpu_info[cpu].processor_id);
>=20
> What does "_map" in the function/macro name signify?
It is interconnections/correllation between Xen's CPU id and Hart's id.


~ Oleksii

