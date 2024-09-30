Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1742B98A90A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807515.1219036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIfY-0001uc-El; Mon, 30 Sep 2024 15:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807515.1219036; Mon, 30 Sep 2024 15:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svIfY-0001rz-BC; Mon, 30 Sep 2024 15:50:40 +0000
Received: by outflank-mailman (input) for mailman id 807515;
 Mon, 30 Sep 2024 15:50:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdoV=Q4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svIfX-0001rt-FA
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:50:39 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd22b565-7f43-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 17:50:38 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5398fb1a871so1822378e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:50:38 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5389fd5f2f5sm1279459e87.91.2024.09.30.08.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 08:50:37 -0700 (PDT)
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
X-Inumbo-ID: bd22b565-7f43-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727711438; x=1728316238; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zdWREQhX7XQ0NaANVsqKwwyLbnNLpTvowPzwgCRfexQ=;
        b=OjWFrbIVDpgD+q5E+yF+5dTBbh4Bbckg2dWSHfuJ3M81m3IcWRCLHhYIoCaGx9xtQh
         PIQK66PBBs3Hwj+El4ppsCWEukm60H9NZr1PD1USHqllO02AA7c1mp1i0Uftan1uMqu/
         CUjj/Q8AkBXGi+ym8o0E6OvFs++dZGhhMTIiFw2zPTqT2Ywd2T5lQFZZESnj0LIKQoLD
         L/EG/KLO45+AbcYqajynj4T2qTWah3d6wMRfuk0feoJAaYnK6kCRBFHyCJrnmYsswJrK
         Vy/PpcGRNqKQnhuSJ6XAPhBnK44W3CKnYO1mesUzIC6vuYyrQfa7wWET7BTdUx+CJP9N
         mPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727711438; x=1728316238;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zdWREQhX7XQ0NaANVsqKwwyLbnNLpTvowPzwgCRfexQ=;
        b=cH5q3KSIW23U2zp1/9j3vx9vH4MPjvk4GzRFTVbtVq39jSQN1aLrb0O1fwBG0yHLW4
         KLKbwueCZhwx2KL+GtI7Lebd460KAl2WBWwp0WKjYuPlj3Y8QD1UQhAfgbDw5s8oIeCG
         r4sUT2sKNNwq1Ab/3GQ+mwi57X931vvMVQp5jYcpNP2tbYTgkCpyj1LHQJ2xHAFGduis
         zvrDOi+rduqqH37zPTHJis/Y54KBtVXdY3M3v7Hki9AlKQ2dWPooOIS8D4wq7E/zhTVo
         FpNrwyI1fhn8Q8ZG6kLf7Si5YkIgovLNulrtqreXzaumhNbvCcSZgGTBVcijZ9pSVr/s
         qOKg==
X-Forwarded-Encrypted: i=1; AJvYcCX2qyClLAz3qWPkCi7TfD77xP7uwyzH19bjEc3Ye+uAgL8JsoLwhqYJKx24fNOsNUWXo/V0K9uxLGk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiHF61x4hPgu/ubVmTGNOK+QGb86bb9kPxn6/k1SFVUDhv21nE
	SeLljeqbhR1+ZJJrdLyAfbZxV9BjK0nkmdfBjPriV5KGj65JatWF
X-Google-Smtp-Source: AGHT+IEyqZJYJtfTtd2x70GiWO5AEFmJ4DQ1vjkDROltGQO7Y2ytpa3Jwcf8VZNR0sQraNOAXu7zvw==
X-Received: by 2002:a05:6512:3b9b:b0:52e:f99e:5dd1 with SMTP id 2adb3069b0e04-5389fc70e17mr5982695e87.47.1727711437662;
        Mon, 30 Sep 2024 08:50:37 -0700 (PDT)
Message-ID: <183f0be3788bd281067d32d35d7aedfe07bf84ab.camel@gmail.com>
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
Date: Mon, 30 Sep 2024 17:50:36 +0200
In-Reply-To: <78a03796-e8b7-4ecc-935b-662304c7984d@suse.com>
References: 
	<d52cd7cddb09c3b87bc4c66458f619dbf7ac214f.1727365499.git.oleksii.kurochko@gmail.com>
	 <78a03796-e8b7-4ecc-935b-662304c7984d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-09-30 at 15:25 +0200, Jan Beulich wrote:
> On 26.09.2024 18:54, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/x86/include/asm/percpu.h
> > @@ -0,0 +1,14 @@
> > +#ifndef __X86_PERCPU_H__
> > +#define __X86_PERCPU_H__
> > +
> > +#define PARK_OFFLINE_CPUS
> > +
> > +/*
> > + * Force uses of per_cpu() with an invalid area to attempt to
> > access the
> > + * middle of the non-canonical address space resulting in a #GP,
> > rather than a
> > + * possible #PF at (NULL + a little) which has security
> > implications in the
> > + * context of PV guests.
> > + */
> > +#define INVALID_PERCPU_AREA (0x8000000000000000UL - (unsigned
> > long)__per_cpu_start)
> > +
> > +#endif /* __X86_PERCPU_H__ */
>=20
> With this file appearing, doesn't arch/x86/include/asm/Makefile want
> the
> respective line removed?
For sure, it should be removed ( as it was done in previous patch
series:
https://lore.kernel.org/xen-devel/e573f9d46e7af0806381f6a41af00dc415bf87bb.=
1727185495.git.oleksii.kurochko@gmail.com/#Z31xen:arch:x86:include:asm:Make=
file
).

>=20
> > --- /dev/null
> > +++ b/xen/common/percpu.c
> > @@ -0,0 +1,113 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
>=20
> GPL-2.0-only
>=20
> > +#include <xen/percpu.h>
> > +#include <xen/cpu.h>
> > +#include <xen/init.h>
> > +#include <xen/mm.h>
> > +#include <xen/rcupdate.h>
> > +
> > +#ifndef INVALID_PERCPU_AREA
> > +#define INVALID_PERCPU_AREA (-(long)__per_cpu_start)
> > +#endif
> > +
> > +#define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end -
> > __per_cpu_start)
> > +
> > +extern char __per_cpu_start[];
> > +extern const char __per_cpu_data_end[];
> > +
> > +unsigned long __per_cpu_offset[NR_CPUS];
>=20
> Could this perhaps become __read_mostly while it's being moved here?
Sure, it makes sense to me. I'll add __read_mostly.

>=20
> > +void __init percpu_init_areas(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned int cpu;
> > +
> > +=C2=A0=C2=A0=C2=A0 for ( cpu =3D 1; cpu < NR_CPUS; cpu++ )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __per_cpu_offset[cpu] =3D I=
NVALID_PERCPU_AREA;
> > +}
> > +
> > +static int init_percpu_area(unsigned int cpu)
> > +{
> > +=C2=A0=C2=A0=C2=A0 char *p;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( __per_cpu_offset[cpu] !=3D INVALID_PERCPU_AREA=
 )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return park_offline_cpus ? =
0 : -EBUSY;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( (p =3D alloc_xenheap_pages(PERCPU_ORDER, 0)) =
=3D=3D NULL )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
> > +
> > +=C2=A0=C2=A0=C2=A0 memset(p, 0, __per_cpu_data_end - __per_cpu_start);
> > +=C2=A0=C2=A0=C2=A0 __per_cpu_offset[cpu] =3D p - __per_cpu_start;
> > +
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +struct free_info {
> > +=C2=A0=C2=A0=C2=A0 unsigned int cpu;
> > +=C2=A0=C2=A0=C2=A0 struct rcu_head rcu;
> > +};
> > +static DEFINE_PER_CPU(struct free_info, free_info);
> > +
> > +static void cf_check _free_percpu_area(struct rcu_head *head)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct free_info *info =3D container_of(head, struc=
t free_info,
> > rcu);
> > +=C2=A0=C2=A0=C2=A0 unsigned int cpu =3D info->cpu;
> > +=C2=A0=C2=A0=C2=A0 char *p =3D __per_cpu_start + __per_cpu_offset[cpu]=
;
> > +
> > +=C2=A0=C2=A0=C2=A0 free_xenheap_pages(p, PERCPU_ORDER);
>=20
> It's quite sad that just because of this __per_cpu_start[] can be
> const-ified.
>=20
> > --- a/xen/include/xen/percpu.h
> > +++ b/xen/include/xen/percpu.h
> > @@ -29,6 +29,36 @@
> > =C2=A0
> > =C2=A0#include <asm/percpu.h>
> > =C2=A0
> > +#ifndef __ASSEMBLY__
> > +
> > +#include <xen/types.h>
> > +#include <asm/current.h>
> > +
> > +#ifndef PARK_OFFLINE_CPUS
> > +/*
> > + * Do we, for platform reasons, need to actually keep CPUs online
> > when we
> > + * would otherwise prefer them to be off?
> > + */
> > +#define park_offline_cpus false
> > +#endif
>=20
> In the (implicit) #else case the identifier is a variable, which may
> end up
> being set to true or false. Therefore I consider PARK_OFFLINE_CPUS
> somewhat
> misleading: x86, #define-ing the variable, doesn't always mean to
> park CPUs.
> Perhaps MAYBE_PARK_OFFLINE_CPUS or PARK_OFFLINE_CPUS_VAR?
IMO PARK_OFFLINE_CPUS_VAR describes better the occurrence of "#define
park_offlince_cpus false". I will stick to it in the next patch
version.

Thanks.

~ Oleksii


