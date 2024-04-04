Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F86898AA4
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 17:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700938.1094794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsOgI-0007yv-Cw; Thu, 04 Apr 2024 15:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700938.1094794; Thu, 04 Apr 2024 15:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsOgI-0007wt-9X; Thu, 04 Apr 2024 15:07:10 +0000
Received: by outflank-mailman (input) for mailman id 700938;
 Thu, 04 Apr 2024 15:07:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LwOm=LJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rsOgG-0007wl-P7
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 15:07:08 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01246b6e-f295-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 17:07:07 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-516a01c8490so2050120e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 08:07:07 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d14-20020ac24c8e000000b00516d2489f16sm7802lfl.260.2024.04.04.08.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 08:07:06 -0700 (PDT)
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
X-Inumbo-ID: 01246b6e-f295-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712243227; x=1712848027; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/VELRPKeMX1LdEAJc/Q0CO65ia3VxSP0pAr7oWHXSWU=;
        b=ZTcNXgvMUMkWI+636yLDCV54jN+NWqiY4Z7c/ZFA9skioz5dO58w6jqeZSOIral0WI
         NOOFa70pbkO9PfKD1B4j65Xbaq0ke67pv7IqwdniP33KMWhQc+FLQH8M4ZuFAvqMfyPs
         l1ML680KikjveX+FUIjdD2hpRvJZQO7KbRCzd+H6k2Sp5+VEIRwklgKQcAfAt830MBzp
         2jjOH0yHLoOQtQ0hs+TrbIzqcfdGEFuXK7QfMFZvt4jkcSLxpZam5nVHUPECu2lc9Sbc
         lkr5MKJb02+mWm9JMUsxi/eyC/M1oW3rJKN8wJci0pTKkrKyz5ly4Kee0feNfIcMN61x
         KHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712243227; x=1712848027;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/VELRPKeMX1LdEAJc/Q0CO65ia3VxSP0pAr7oWHXSWU=;
        b=QKYD0zWOUCNl6JtTNZ3Zh78kSUJytqaWZ1Tp9NzrHj78IekkiG16++KnVp7WKULNAW
         cRGK7Vj+b793klNIG+mM3tXn2PslQRXeTHGXl/t4ZVKS6V3Sj7CbIjjPkjpYhh3xZIF1
         CdDFnLV/a63ZyYMJJNJr8tdUUoVL7xB2m4Hg9FxOShFSTnM9DYO4zuU1uVfItD1mqNAa
         fmZKV3wfcW390wiilpSdx9OPj0Pp1kX0aIJREHWwbjBdOa3uTPDUuPVLpI6KMYb+AxLX
         08oSMov32DfphdxFzHVWzDJzopVC3+/wU7e5w5guzstfhFZfpUvaH6Em+X0vzi0fBDzR
         LQDA==
X-Forwarded-Encrypted: i=1; AJvYcCXuJbYkLcKQ6WPedr/LgGAbUfhpU7/cJdljphgjRxz4yzn0Qc1O5D9t4xQJElpox+Bz8AINWby63RWeMQlMSbpOLPt41AOlPZeq0cDiFcM=
X-Gm-Message-State: AOJu0YwdCw2tCoXKGKLhyRmEFqQgrL3X4Nnvbu08bbQnjxCUTC4rD1tK
	Z62+spC2A4BC4rSuBnXA/8sTCU0m1xoe3TUsMXfPyImLtrKirstP
X-Google-Smtp-Source: AGHT+IFypdC4qkWeDRte+kqVyH6BpFawDcgVa6DrCNTrviX2coEvinxl23Vz3e4lYK8lnEVlAT8hog==
X-Received: by 2002:a19:f716:0:b0:513:dd66:d5e9 with SMTP id z22-20020a19f716000000b00513dd66d5e9mr882880lfe.21.1712243226918;
        Thu, 04 Apr 2024 08:07:06 -0700 (PDT)
Message-ID: <c1161824532f24e39bcedf3a6f96c70ec8bc885c.camel@gmail.com>
Subject: Re: [PATCH v7 02/19] xen/riscv: disable unnecessary configs
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	 <sstabellini@kernel.org>, Alistair Francis <alistair.francis@wdc.com>, Bob
	Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, 
	xen-devel@lists.xenproject.org
Date: Thu, 04 Apr 2024 17:07:06 +0200
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
I'll look at where P2M header came from on x86 and Arm.

>=20
> For XSM I'm a little puzzled: Shouldn't RISC-V have
> HAS_DEVICE_TREE=3Dy?
> Then xsm_core_init() would have a caller.
It should, but I haven't add "select HAS_DEVICE_TREE" for RISC-V as no
device tree functionality hasn't been introduced yet.

~ Oleksii

