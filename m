Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EACC0979EED
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 12:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799391.1209378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq8dW-0003r3-9b; Mon, 16 Sep 2024 10:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799391.1209378; Mon, 16 Sep 2024 10:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq8dW-0003oG-6S; Mon, 16 Sep 2024 10:07:14 +0000
Received: by outflank-mailman (input) for mailman id 799391;
 Mon, 16 Sep 2024 10:07:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CfyS=QO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sq8dV-0003oA-Dn
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 10:07:13 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 713fb62b-7413-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 12:07:12 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53659867cbdso3752108e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 03:07:12 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870b42d8sm840734e87.263.2024.09.16.03.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 03:07:11 -0700 (PDT)
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
X-Inumbo-ID: 713fb62b-7413-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726481232; x=1727086032; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/bpvGYIe5l0MUvI4jRiCNVLdG+T6KbJ+eZEVBnwspHQ=;
        b=JW5yv6NNJ/XbEUtPxHFLtXq5xFkTtdWI2xpfgQEdUURTvf6K1MoBGAsMSeSNGhXnqx
         Vt2/IjqRHw7pVd6j+rtjF3SGaRkFxunz3Xn9oZs/V2ZNgKbY8Dn30lvJR/oIZPlqPtrP
         C8dyUMjwmyaKJ+CZ34bdhZ2m02ff2kbSsPAd9UrmGT839XIpYw6cAfzKkHYkC7TkeaRI
         e7zVvMqYtCesFhCb3+dF+OCfdIYMizxuyO9/JKxI9xnTrR4yFQcQN431X0vuPUzrAHiY
         0CnhAnhkkOTtzRv6vJHpTfwb8bB9NPyw4y4Sm31J3B4TjbkWyezfuXafCSZ/XfZy/Ygb
         NUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726481232; x=1727086032;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/bpvGYIe5l0MUvI4jRiCNVLdG+T6KbJ+eZEVBnwspHQ=;
        b=oC4w8s8kBfuMsXi2tn+vOnstwzqk2lCSxzeWDgfqkq8wlo6EGsxEzCaiKv/mHILStX
         bvGOmlnA1Djl4T6Q7ovp9AFnTnakjjP+PzfhXWy3c9FIRAaCXiuk21T5iSf6y0rhab0u
         J9RTC1KUs9+e4e+J9t9ONdM7yJlesWIRFTtU4z/vMD8JyVjgPQHNoLHiU4tq4+hiuYoQ
         YHB9br5YOelLphbXwZmcES1PKOZ7k4I/IegHbHM1TT8RvELcvJUtZAi8fJ+U37T4BdbV
         kKrVyhGhWdE7WPM47t6gZmqFXg4hmmlesNigHHQctSeINbBLD9EEOy1xb1l7mdh6BKt1
         PMug==
X-Forwarded-Encrypted: i=1; AJvYcCVeF3IAjWQygzReD/437vVz2kdxXovwbdvfotDgSzJNha+l/AI49wvYV1aCvefdNuNJcFX0m9WhMuQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxy4PuAynjNBr4/5KOrlQ1ciuX7phH+c1XgYWUW+A0jjQgdUHlE
	T6rPf+f9hxon0K4L2qPjfReCC22nfPElaNtfdxS5Vb9wzmU8yzW0
X-Google-Smtp-Source: AGHT+IGXw0IEjz8H0oQ9KuMhzJIVJ6dsZ3kU+7MaE8EGqEdslZ+fisNUHrVpaoOkB2zkrFX8VNJ8Kg==
X-Received: by 2002:a05:6512:6c9:b0:535:6951:9e1c with SMTP id 2adb3069b0e04-5367fec5553mr5888639e87.15.1726481231385;
        Mon, 16 Sep 2024 03:07:11 -0700 (PDT)
Message-ID: <aa193d25ef12815d2b75fb0cbb5ae50b596fb393.camel@gmail.com>
Subject: Re: [PATCH v7 5/8] xen/riscv: introduce functionality to work with
 CPU info
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 16 Sep 2024 12:07:10 +0200
In-Reply-To: <d0675928-3261-42cb-96d8-95b626e6552e@suse.com>
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
	 <461a246e3a54345578556821f2c7dbf01e348a05.1726242605.git.oleksii.kurochko@gmail.com>
	 <d0675928-3261-42cb-96d8-95b626e6552e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-09-16 at 08:48 +0200, Jan Beulich wrote:
> On 13.09.2024 17:57, Oleksii Kurochko wrote:
> > Introduce struct pcpu_info to store pCPU-related information.
> > Initially, it includes only processor_id and hart id, but it
> > will be extended to include guest CPU information and
> > temporary variables for saving/restoring vCPU registers.
> >=20
> > Add set_processor_id() function to set processor_id stored in
> > pcpu_info.
> >=20
> > Define smp_processor_id() to provide accurate information,
> > replacing the previous "dummy" value of 0.
> >=20
> > Initialize tp registers to point to pcpu_info[0].
> > Set processor_id to 0 for logical CPU 0 and store the physical
> > CPU ID in pcpu_info[0].
> >=20
> > Introduce helpers for getting hart_id ( physical CPU id in RISC-V
> > terms ) from Xen CPU id.
> >=20
> > Removing of <asm/processor.h> inclusion leads to the following
> > compilation error:
> > =C2=A0 common/keyhandler.c: In function 'dump_registers':
> > =C2=A0 common/keyhandler.c:200:13: error: implicit declaration of
> > function
> > =C2=A0=C2=A0=C2=A0=C2=A0 'cpu_relax' [-Werror=3Dimplicit-function-decla=
ration]
> > =C2=A0 200 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 cpu_relax();
>=20
> What is this paragraph about? It may be stale, or it may be lacking
> information / context on what it tries to explain.
When I moved pcpu_info[], set_processor_id(), and smp_processor_id() fromas=
m/processor.h to asm/current.h and began cleaning up the header
inclusions,
the mentioned compiler error appeared. The inclusion of
<asm/processor.h> isn=E2=80=99t
necessary anymore at the moment, but I assume it will be included
eventually, so
I decided to add this explanation to the commit message to clarify why
it wasn=E2=80=99t
dropped.
Initially, I marked it as a TODO in <asm/current.h>, but I realized
this comment
would be removed once something from <asm/processor.h> is required. So,
I opted to
document it in the commit message instead.

>=20
> > @@ -14,6 +16,22 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
> > =C2=A0 */
> > =C2=A0#define park_offline_cpus false
> > =C2=A0
> > +/*
> > + * Mapping between Xen logical cpu index and hartid.
> > + */
> > +static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return pcpu_info[cpuid].hart_id;
> > +}
> > +
> > +static inline void map_cpuid_to_hartid(unsigned long cpuid,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long hartid)
> > +{
> > +=C2=A0=C2=A0=C2=A0 pcpu_info[cpuid].hart_id =3D hartid;
> > +}
>=20
> "map" is ambiguous - it may mean both "get" or "set". May I ask that
> this become "set", just like for the processor-ID helper?
Sure, I will update that in the next patch series version.

~ Oleksii

