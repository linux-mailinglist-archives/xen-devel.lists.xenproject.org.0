Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 869AA7F9E4C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 12:14:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641972.1001004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ZZM-0002Ef-Dd; Mon, 27 Nov 2023 11:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641972.1001004; Mon, 27 Nov 2023 11:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ZZM-0002CZ-AN; Mon, 27 Nov 2023 11:14:28 +0000
Received: by outflank-mailman (input) for mailman id 641972;
 Mon, 27 Nov 2023 11:14:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7ZZK-0002CR-3V
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 11:14:26 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e7a20af-8d16-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 12:14:23 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-507be298d2aso5508234e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 03:14:23 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a29-20020a19ca1d000000b0050aa9e8e26asm1469738lfg.5.2023.11.27.03.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 03:14:22 -0800 (PST)
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
X-Inumbo-ID: 1e7a20af-8d16-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701083663; x=1701688463; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hWjzXLoagQT/SZypkFh4gYCxdo8PooTKKzIaG1UEEJY=;
        b=bD08LHHK35vdaVejZWfWLSoz8hM2lldcwO64zQ8vIDcXFj1DzwzJIu4JM/qvm+VpFq
         zQ4W0DWRh9O24jOM5xbyw8Pa82s0rVO6M9bEiOD6cL4iE87I+uMlTJ8mDpy3A7/3jgj/
         YYvCMEKOI2nhyYgAAP9GVBaHcCaslyQQB9J3H2XrrcsIJuwqHXgHHk/6wg3J1m4QkTEu
         R7m+WVRpbgrrYeAbmJi7VDx7jZFpm1bfeLLdflUswhMVOXp3IDbxYOaC/1Q7sRVdW1Y8
         77dMi/bp73gQaKOx7j0MkhHV1RAMTdCJKW26wcAQCNTtfC+vLGrnER6I0dDk25Q4BnpF
         ntxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701083663; x=1701688463;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWjzXLoagQT/SZypkFh4gYCxdo8PooTKKzIaG1UEEJY=;
        b=dnv/gkaQUTVpVbXaOO1l6mx4PnDmUxcU8unl+v9/EkxHVE7eK+Nf+WM4U3GGVT6Iqx
         vkubxR9ew7CWxRD1pN1eyPVUqrb3uxj+YPmuLTo65KAlbZrLaH33kvqtbw9H7xhmTxiQ
         /1UdtvEpm0oYw5UPcB9DwBy+XGgS6oh2+tdBz43/KTHbu9bCTNaM+Oj4BxmI/ImTRYtg
         3d0YULQZKT/wZJJ360O0eizzJKHaPKjdLU4uXWk92rAcUuOQAIWdw0W14iQtbwyWFAE4
         sqfGsEAzdbCFTzGHZggaKVm9oXfeKINj6oM5HWTp6fL0X1va8Jt0Qkz2wxneBhZj+FIq
         MgbA==
X-Gm-Message-State: AOJu0YzAoBMcdxf9r0JOixtQ8uqjeW0yX6HEEnanUrbXqWuguV/LprqR
	v15jItznGQBDgnWeDF44mzc=
X-Google-Smtp-Source: AGHT+IE3kJ5RmUTsHLuLcKwGyR0qJGCslid1ixDTDppbKTrKyJol5/O9OEdFfE1AC/T4AlQmuVEgVw==
X-Received: by 2002:a19:5f5e:0:b0:503:2555:d1e7 with SMTP id a30-20020a195f5e000000b005032555d1e7mr6539967lfj.45.1701083663114;
        Mon, 27 Nov 2023 03:14:23 -0800 (PST)
Message-ID: <80246724de22a23b35f70b5b47ebb886f47f5dfd.camel@gmail.com>
Subject: Re: [PATCH v3 11/14] xen/asm-generic: introduce stub header numa.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Mon, 27 Nov 2023 13:14:22 +0200
In-Reply-To: <c728ba04-8cbd-45d5-af2c-eefcdf3f7afd@amd.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
	 <7ae3b2dbdb8e711b2462af511e1f64c2700113d7.1700221559.git.oleksii.kurochko@gmail.com>
	 <c728ba04-8cbd-45d5-af2c-eefcdf3f7afd@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

Hello Michal,

On Fri, 2023-11-24 at 14:03 +0100, Michal Orzel wrote:
>=20
> On 17/11/2023 13:24, Oleksii Kurochko wrote:
> >=20
> >=20
> > <asm/numa.h> is common through some archs so it is moved
> > to asm-generic.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V3:
> > =C2=A0- Remove old header inclusion in asm-generic numa.h and include
> > =C2=A0=C2=A0 <xen/mm-frame.h> and <xen/stdint.h>
> > =C2=A0- Drop Arm and PPC's numa.h and use asm-generic version instead.
> > ---
> > Changes in V2:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - update the commit message.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - change u8 to uint8_t.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - add ifnded CONFIG_NUMA.
> > ---
> > =C2=A0xen/arch/arm/include/asm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0xen/arch/ppc/include/asm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0xen/arch/ppc/include/asm/numa.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 26 ---------------
> > ----
> > =C2=A0.../asm =3D> include/asm-generic}/numa.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 13 ++++++----
> > =C2=A04 files changed, 10 insertions(+), 31 deletions(-)
> > =C2=A0delete mode 100644 xen/arch/ppc/include/asm/numa.h
> > =C2=A0rename xen/{arch/arm/include/asm =3D> include/asm-generic}/numa.h
> > (75%)
> >=20
> > diff --git a/xen/arch/arm/include/asm/Makefile
> > b/xen/arch/arm/include/asm/Makefile
> > index 8221429c2c..0c855a798a 100644
> > --- a/xen/arch/arm/include/asm/Makefile
> > +++ b/xen/arch/arm/include/asm/Makefile
> > @@ -2,6 +2,7 @@
> > =C2=A0generic-y +=3D altp2m.h
> > =C2=A0generic-y +=3D hardirq.h
> > =C2=A0generic-y +=3D iocap.h
> > +generic-y +=3D numa.h
> > =C2=A0generic-y +=3D paging.h
> > =C2=A0generic-y +=3D percpu.h
> > =C2=A0generic-y +=3D random.h
> > diff --git a/xen/arch/ppc/include/asm/Makefile
> > b/xen/arch/ppc/include/asm/Makefile
> > index 9bbae4cec8..d5a94bc718 100644
> > --- a/xen/arch/ppc/include/asm/Makefile
> > +++ b/xen/arch/ppc/include/asm/Makefile
> > @@ -5,6 +5,7 @@ generic-y +=3D hardirq.h
> > =C2=A0generic-y +=3D hypercall.h
> > =C2=A0generic-y +=3D iocap.h
> > =C2=A0generic-y +=3D monitor.h
> > +generic-y +=3D numa.h
> > =C2=A0generic-y +=3D paging.h
> > =C2=A0generic-y +=3D percpu.h
> > =C2=A0generic-y +=3D random.h
> > diff --git a/xen/arch/ppc/include/asm/numa.h
> > b/xen/arch/ppc/include/asm/numa.h
> > deleted file mode 100644
> > index 7fdf66c3da..0000000000
> > --- a/xen/arch/ppc/include/asm/numa.h
> > +++ /dev/null
> > @@ -1,26 +0,0 @@
> > -#ifndef __ASM_PPC_NUMA_H__
> > -#define __ASM_PPC_NUMA_H__
> > -
> > -#include <xen/types.h>
> > -#include <xen/mm.h>
> > -
> > -typedef uint8_t nodeid_t;
> > -
> > -/* Fake one node for now. See also node_online_map. */
> > -#define cpu_to_node(cpu) 0
> > -#define node_to_cpumask(node)=C2=A0=C2=A0 (cpu_online_map)
> > -
> > -/*
> > - * TODO: make first_valid_mfn static when NUMA is supported on
> > PPC, this
> > - * is required because the dummy helpers are using it.
> > - */
> > -extern mfn_t first_valid_mfn;
> > -
> > -/* XXX: implement NUMA support */
> > -#define node_spanned_pages(nid) (max_page -
> > mfn_x(first_valid_mfn))
> > -#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> > -#define __node_distance(a, b) (20)
> > -
> > -#define arch_want_default_dmazone() (false)
> > -
> > -#endif /* __ASM_PPC_NUMA_H__ */
> > diff --git a/xen/arch/arm/include/asm/numa.h b/xen/include/asm-
> > generic/numa.h
> > similarity index 75%
> > rename from xen/arch/arm/include/asm/numa.h
> > rename to xen/include/asm-generic/numa.h
> > index e2bee2bd82..c5b522dee8 100644
> > --- a/xen/arch/arm/include/asm/numa.h
> > +++ b/xen/include/asm-generic/numa.h
> > @@ -1,9 +1,11 @@
> > -#ifndef __ARCH_ARM_NUMA_H
> > -#define __ARCH_ARM_NUMA_H
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ARCH_GENERIC_NUMA_H
> > +#define __ARCH_GENERIC_NUMA_H
> ASM_GENERIC ?
Thanks. I'll rename the guard.
>=20
> >=20
> > -#include <xen/mm.h>
> > +#include <xen/mm-frame.h>
> If this is for mfn_t, shouldn't this inclusion be moved under #ifndef
> ?
It would be better. I'll update that in the next patch series.

>=20
> Apart from that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>


~ Oleksii

