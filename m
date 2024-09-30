Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A6C98A93D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:56:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807533.1219066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIlK-0003ie-JZ; Mon, 30 Sep 2024 15:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807533.1219066; Mon, 30 Sep 2024 15:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIlK-0003gJ-GD; Mon, 30 Sep 2024 15:56:38 +0000
Received: by outflank-mailman (input) for mailman id 807533;
 Mon, 30 Sep 2024 15:56:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdoV=Q4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svIlJ-0003fO-F4
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:56:37 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91c4bbf0-7f44-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 17:56:35 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-539983beb19so1014321e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:56:35 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a043b060sm1264552e87.227.2024.09.30.08.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 08:56:34 -0700 (PDT)
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
X-Inumbo-ID: 91c4bbf0-7f44-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727711795; x=1728316595; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JkROBRCC5ErhOjs3w1OX2XSbAc4Hknna1bir6g8h5zk=;
        b=dgFqEPLmIngdtWb4osnwc5A9Atj6Q0UldmF1E4OoudhCfipV4HEoMJ7608y6LvwnRq
         0RS3uOkIgJ3ODeqh3DKug64E4mZifzb+PocyvvNvIqs7POLRPtHzGoUlNzjbg2l+apxH
         kolZOz2VFLuJYX5UnkrYjc5iCSEUh8cmfAwFxsU/QvcJ0+wWSgv6n49CcEEdLAgdFJ4J
         b1GdSf7f8/1t/HqC39Ff4wkJy/sz2jsmuIHAc6WVdYViviwt3IoY+6QA9SbgLMbskA1f
         aYt5F6qBp0SEiz2HbObVJkJVFo/NBnnt/kqENO36quA32si8ycxdBAzvz4TqUoIC7wIt
         FHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727711795; x=1728316595;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JkROBRCC5ErhOjs3w1OX2XSbAc4Hknna1bir6g8h5zk=;
        b=T/0UcEwzieXZuYf2vdkxMCnr6OHgXy+u/R4Viyf2Ov9IMyOvLZ7sBZQqDiy3QyiL9k
         VYIALMap6it3ciClC9rktjYcNLInzVOU4TDKJf5tgCVHoLwUy9cwW3UsJ4RxTAsvsbRC
         +1xBvqjn3dSQWdSDKK4DhtbrSPRJsca51OxfQ7XpmpdU+37ffj5EqviGfd7z+3wS0qGT
         uJbaDk1OIAlO99j9Fcj9miw/eozHru0L48LcoBzMYtyYZ0bEf1RREa2c66/YVcGkDr9o
         6P0oKGuAighQchWzZpcLbttinLP5GxtqRLaUzt5HomQiBNY3DKj98qUAp+JdYS/x4gYa
         5EgA==
X-Forwarded-Encrypted: i=1; AJvYcCXR2hUBoNKB3rY5yMP4KmcU8AlBYZH25kDBZiL66Sp/MWlV96/+fpoBdV4OEUtRtpcksIuL/XT/WEA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywg055PF5VDyjcyWChNdNJ9ZXpmhUCjATISpartMF+Rkh8NPfsL
	53skZIyLNUNIWQPoCRzeeZLINU/A0FUE57287Af4WqBWhJL22sPF
X-Google-Smtp-Source: AGHT+IF8i6G1xAn/U5LfaU2akVawGogTPvNOjslUliI7/SwJYpw7+DB87d5ehGH88Ra/J3ezCgdAfQ==
X-Received: by 2002:ac2:4e14:0:b0:52c:e054:4149 with SMTP id 2adb3069b0e04-5389fc3abe5mr6231811e87.15.1727711794344;
        Mon, 30 Sep 2024 08:56:34 -0700 (PDT)
Message-ID: <a8b3312987d8944b6720b66bd098fa36409b98ec.camel@gmail.com>
Subject: Re: [PATCH v3] xen: move per-cpu area management into common code
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Mon, 30 Sep 2024 17:56:33 +0200
In-Reply-To: <183f0be3788bd281067d32d35d7aedfe07bf84ab.camel@gmail.com>
References: 
	<d52cd7cddb09c3b87bc4c66458f619dbf7ac214f.1727365499.git.oleksii.kurochko@gmail.com>
	 <78a03796-e8b7-4ecc-935b-662304c7984d@suse.com>
	 <183f0be3788bd281067d32d35d7aedfe07bf84ab.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-09-30 at 17:50 +0200, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-09-30 at 15:25 +0200, Jan Beulich wrote:
> > On 26.09.2024 18:54, Oleksii Kurochko wrote:
> > > --- /dev/null
> > > +++ b/xen/arch/x86/include/asm/percpu.h
> > > @@ -0,0 +1,14 @@
> > > +#ifndef __X86_PERCPU_H__
> > > +#define __X86_PERCPU_H__
> > > +
> > > +#define PARK_OFFLINE_CPUS
> > > +
> > > +/*
> > > + * Force uses of per_cpu() with an invalid area to attempt to
> > > access the
> > > + * middle of the non-canonical address space resulting in a #GP,
> > > rather than a
> > > + * possible #PF at (NULL + a little) which has security
> > > implications in the
> > > + * context of PV guests.
> > > + */
> > > +#define INVALID_PERCPU_AREA (0x8000000000000000UL - (unsigned
> > > long)__per_cpu_start)
> > > +
> > > +#endif /* __X86_PERCPU_H__ */
> >=20
> > With this file appearing, doesn't arch/x86/include/asm/Makefile
> > want
> > the
> > respective line removed?
> For sure, it should be removed ( as it was done in previous patch
> series:
> https://lore.kernel.org/xen-devel/e573f9d46e7af0806381f6a41af00dc415bf87b=
b.1727185495.git.oleksii.kurochko@gmail.com/#Z31xen:arch:x86:include:asm:Ma=
kefile
> ).
Actually there is the same removing in this version:
https://lore.kernel.org/xen-devel/183f0be3788bd281067d32d35d7aedfe07bf84ab.=
camel@gmail.com/T/#Z2e.:..:d52cd7cddb09c3b87bc4c66458f619dbf7ac214f.1727365=
499.git.oleksii.kurochko::40gmail.com:1xen:arch:x86:include:asm:Makefile

~ Oleksii
>=20
> >=20
> > > --- /dev/null
> > > +++ b/xen/common/percpu.c
> > > @@ -0,0 +1,113 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> >=20
> > GPL-2.0-only
> >=20
> > > +#include <xen/percpu.h>
> > > +#include <xen/cpu.h>
> > > +#include <xen/init.h>
> > > +#include <xen/mm.h>
> > > +#include <xen/rcupdate.h>
> > > +
> > > +#ifndef INVALID_PERCPU_AREA
> > > +#define INVALID_PERCPU_AREA (-(long)__per_cpu_start)
> > > +#endif
> > > +
> > > +#define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end -
> > > __per_cpu_start)
> > > +
> > > +extern char __per_cpu_start[];
> > > +extern const char __per_cpu_data_end[];
> > > +
> > > +unsigned long __per_cpu_offset[NR_CPUS];
> >=20
> > Could this perhaps become __read_mostly while it's being moved
> > here?
> Sure, it makes sense to me. I'll add __read_mostly.
>=20
> >=20
> > > +void __init percpu_init_areas(void)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 unsigned int cpu;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 for ( cpu =3D 1; cpu < NR_CPUS; cpu++ )
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __per_cpu_offset[cpu] =3D=
 INVALID_PERCPU_AREA;
> > > +}
> > > +
> > > +static int init_percpu_area(unsigned int cpu)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 char *p;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 if ( __per_cpu_offset[cpu] !=3D INVALID_PERCPU_AR=
EA )
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return park_offline_cpus =
? 0 : -EBUSY;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 if ( (p =3D alloc_xenheap_pages(PERCPU_ORDER, 0))=
 =3D=3D NULL )
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 memset(p, 0, __per_cpu_data_end - __per_cpu_start=
);
> > > +=C2=A0=C2=A0=C2=A0 __per_cpu_offset[cpu] =3D p - __per_cpu_start;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +}
> > > +
> > > +struct free_info {
> > > +=C2=A0=C2=A0=C2=A0 unsigned int cpu;
> > > +=C2=A0=C2=A0=C2=A0 struct rcu_head rcu;
> > > +};
> > > +static DEFINE_PER_CPU(struct free_info, free_info);
> > > +
> > > +static void cf_check _free_percpu_area(struct rcu_head *head)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct free_info *info =3D container_of(head, str=
uct
> > > free_info,
> > > rcu);
> > > +=C2=A0=C2=A0=C2=A0 unsigned int cpu =3D info->cpu;
> > > +=C2=A0=C2=A0=C2=A0 char *p =3D __per_cpu_start + __per_cpu_offset[cp=
u];
> > > +
> > > +=C2=A0=C2=A0=C2=A0 free_xenheap_pages(p, PERCPU_ORDER);
> >=20
> > It's quite sad that just because of this __per_cpu_start[] can be
> > const-ified.
> >=20
> > > --- a/xen/include/xen/percpu.h
> > > +++ b/xen/include/xen/percpu.h
> > > @@ -29,6 +29,36 @@
> > > =C2=A0
> > > =C2=A0#include <asm/percpu.h>
> > > =C2=A0
> > > +#ifndef __ASSEMBLY__
> > > +
> > > +#include <xen/types.h>
> > > +#include <asm/current.h>
> > > +
> > > +#ifndef PARK_OFFLINE_CPUS
> > > +/*
> > > + * Do we, for platform reasons, need to actually keep CPUs
> > > online
> > > when we
> > > + * would otherwise prefer them to be off?
> > > + */
> > > +#define park_offline_cpus false
> > > +#endif
> >=20
> > In the (implicit) #else case the identifier is a variable, which
> > may
> > end up
> > being set to true or false. Therefore I consider PARK_OFFLINE_CPUS
> > somewhat
> > misleading: x86, #define-ing the variable, doesn't always mean to
> > park CPUs.
> > Perhaps MAYBE_PARK_OFFLINE_CPUS or PARK_OFFLINE_CPUS_VAR?
> IMO PARK_OFFLINE_CPUS_VAR describes better the occurrence of "#define
> park_offlince_cpus false". I will stick to it in the next patch
> version.
>=20
> Thanks.
>=20
> ~ Oleksii
>=20


