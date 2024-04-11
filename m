Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55CE8A177F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 16:39:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703968.1100011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruvaM-0000KW-Pd; Thu, 11 Apr 2024 14:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703968.1100011; Thu, 11 Apr 2024 14:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruvaM-0000IN-Mp; Thu, 11 Apr 2024 14:39:30 +0000
Received: by outflank-mailman (input) for mailman id 703968;
 Thu, 11 Apr 2024 14:39:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IPxQ=LQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ruvaK-0000I8-Gu
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 14:39:28 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c56b841-f811-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 16:39:27 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56e2e09fc27so1619977a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 07:39:27 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 cs9-20020a0564020c4900b005682a0e915fsm763462edb.76.2024.04.11.07.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 07:39:26 -0700 (PDT)
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
X-Inumbo-ID: 4c56b841-f811-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712846367; x=1713451167; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z0SRZLkRPtWDq1HCfaglWOVgX9DIgNcFUibF3GsNaMw=;
        b=bsO5NirGv67Q5+ieiIU5s8oOW2ebXpTDA+dolYzaIyX472zBekQeIm1akNGOllk3cF
         7T4TE1SVLbdycR8QdpDpiB4ELUBwqb5hI+yvsUBVJPsFNsEmNS0ZUOlrPKnW23KFxFkD
         cl+NYOK+O9AgkfceULod50tAFfvhG2ymo9u27pBwyDpgLp6oSD/+SozTBuZQZtaDfLUC
         n9ZQmwFVsFGK/ph9h2ntkOpJxH70F48HudT+Odm03lycLNBUEdGpeEr0VOKt/pmWZ8g5
         dINNv795OHjbwH/VRnWMJShjwomRpwL+TY9wbPW2PyTM4IxYjNk3AdSpzKZTdqVvkwcV
         IBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712846367; x=1713451167;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z0SRZLkRPtWDq1HCfaglWOVgX9DIgNcFUibF3GsNaMw=;
        b=UTtakdBEBFS9+mVkWnTwkFc7QUv1yc6m52XMCMhszKbkDGvrAPyDlWnibZRYFLhvFd
         p3lJZZvMHjz3Vg4TIODWihMwg5cWU1j4eUBKHO7FgB/0gB2y1ttCouTL6JsfkkKp7FVX
         ttEuFq5X9bV+aTxK/vkKrsuO+2VJYSB1Zyyhu7jhAUGOUgmV24wLSNOtoMbUw1L7tVaK
         7vEhVKO68Y/YAKFOxAVCRxrhF/R7G31pcKIaNtIyXv2YNdP1h5XCNR8V8uceSJi7uieH
         db/yPq0r74pHftHYsL0kM7ReADb506zME9PEx3LaGRGsAwVdeKc9nWQGARfdLu8NN0Y1
         nlBA==
X-Forwarded-Encrypted: i=1; AJvYcCWeWqbadtGZ3IAOxrkV84juuU2khbwzpkmJePjMmNXPSaXrYCnHPtDbNSEGcvl8bIxmENYr9y+CNvD0VXVqhFR9U69yOsS+V+CdUinkpk4=
X-Gm-Message-State: AOJu0Yxjgdsi0jHgFJVDpMhvxDwiamG0BUwotA2ZvwP/fVrfGwIJB01Y
	R8Ykc2HgyTUjD9C7OmNJ4to2m9EaLAvoOXcC++Cy+OcGRK3JvUtc
X-Google-Smtp-Source: AGHT+IG8Ih8mPgLUkb2WOS5W7ZOPc2P1MSItD+C3wFolzzsBDd3uMaW4YbnS7tHYUSgPboByD8AqHA==
X-Received: by 2002:a50:d71c:0:b0:56e:1dda:5c2a with SMTP id t28-20020a50d71c000000b0056e1dda5c2amr2447499edi.16.1712846366715;
        Thu, 11 Apr 2024 07:39:26 -0700 (PDT)
Message-ID: <1192836601da5f50db4ea9bb6ab818586e2f6872.camel@gmail.com>
Subject: Re: [PATCH v7 02/19] xen/riscv: disable unnecessary configs
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	 <sstabellini@kernel.org>, Alistair Francis <alistair.francis@wdc.com>, Bob
	Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, 
	xen-devel@lists.xenproject.org
Date: Thu, 11 Apr 2024 16:39:25 +0200
In-Reply-To: <7593c2e7-57ee-42eb-8d38-a3aa177d3420@suse.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <c2ba247adce76c69ecd6400d791db36495b85b75.1712137031.git.oleksii.kurochko@gmail.com>
	 <e3da3546-f2a7-4eab-b157-51b6570dcbf9@suse.com>
	 <77d63eccd4906ebbb3a5add624490cc25b2cba0c.camel@gmail.com>
	 <7593c2e7-57ee-42eb-8d38-a3aa177d3420@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-04-03 at 13:53 +0200, Jan Beulich wrote:
> On 03.04.2024 12:54, Oleksii wrote:
> > On Wed, 2024-04-03 at 12:28 +0200, Jan Beulich wrote:
> > > On 03.04.2024 12:19, Oleksii Kurochko wrote:
> > > > This patch disables unnecessary configs for two cases:
> > > > 1. By utilizing EXTRA_FIXED_RANDCONFIG for randconfig builds
> > > > (GitLab CI jobs).
> > > > 2. By using tiny64_defconfig for non-randconfig builds.
> > > >=20
> > > > Only configs which lead to compilation issues were disabled.
> > > >=20
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > Changes in V7:
> > > > =C2=A0- Disable only configs which cause compilation issues.
> > >=20
> > > Since the description doesn't go into details: While I can see
> > > that
> > > PERF_COUNTERS and LIVEPATCH may require (a little / some more)
> > > extra
> > > work, are HYPFS, ARGO, and XSM really causing issues?
> > For Argo, I recieved the following compilation errors:
> > =C2=A0=C2=A0 common/argo.c:1416:5: error: unknown type name 'p2m_type_t=
'; did
> > you
> > =C2=A0=C2=A0 mean 'hvmmem_type_t'?
> > =C2=A0=C2=A0=C2=A0 1416 |=C2=A0=C2=A0=C2=A0=C2=A0 p2m_type_t p2mt;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0 ^~~~~~~~~~
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0 hvmmem_type_t
> > =C2=A0=C2=A0 common/argo.c:1419:11: error: implicit declaration of func=
tion
> > =C2=A0=C2=A0 'check_get_page_from_gfn' [-Werror=3Dimplicit-function-
> > declaration]
> > =C2=A0=C2=A0=C2=A0 1419 |=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D check_get_pag=
e_from_gfn(d, gfn, false, &p2mt,
> > &page);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~
> > =C2=A0=C2=A0 common/argo.c:1427:10: error: 'p2m_ram_rw' undeclared (fir=
st use
> > in
> > =C2=A0=C2=A0 this function)
> > =C2=A0=C2=A0=C2=A0 1427 |=C2=A0=C2=A0=C2=A0=C2=A0 case p2m_ram_rw:
> > =C2=A0=C2=A0=20
> > It seems it should be included xen/p2m-common.h and asm/p2m.h in
> > common/argo.c.
> >=20
> > For CONFIG_HYPFS_CONFIG ( there is no issue with CONFIG_HYPFS,
> > overlooked that ):
> > =C2=A0=C2=A0 common/config_data.S:1:10: fatal error: asm/asm_defns.h: N=
o such
> > file
> > =C2=A0=C2=A0 or directory
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 | #include <asm/asm_defns.h>
> > =C2=A0=C2=A0=20
> >=20
> > For XSM, I recieved the following error:
> >=20
> > =C2=A0=C2=A0 xsm/xsm_core.c:79:19: error: 'xsm_core_init' defined but n=
ot
> > used [-
> > =C2=A0=C2=A0 Werror=3Dunused-function]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 79 | static int __init xsm_core_init(con=
st void
> > *policy_buffer,
> > =C2=A0=C2=A0 size_t policy_size)
> >=20
> > I'll add an information with compilation errors to the commit
> > message.
>=20
> No need to quote full compiler diagnostics, but a hint at the
> problems
> at least. That said, perhaps we want to rather sort the issues than
> disable building stuff that sooner or later you will want to build
> anyway. For hypfs we look to have an approach already. For Argo what
> you suggest makes sense to me; it might be nice to understand where
> the P2M headers needed are coming from on x86 and Arm. Ideally common
> code .c files wouldn't include asm/*.h.
It seems to me that p2m.h comes for Arm from argo.c -> xen/domain.h ->
asm/domain.h and for x86 from argo.c -> xen/guest_access.h -> #include
<asm/hvm/support.h> -> asm/p2m.h.

So I can include asm/p2m.h to asm/domain.h as p2m will be used anyway
in asm/domain.h header and drop disablement of ARGO config from
*_defconfig and build.yaml for CI. Does it make sense?

~ Oleksii
>=20
> For XSM I'm a little puzzled: Shouldn't RISC-V have
> HAS_DEVICE_TREE=3Dy?
> Then xsm_core_init() would have a caller.
>=20
> Jan


