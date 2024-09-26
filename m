Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23139986FBE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 11:15:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805070.1216094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stkbC-0007wE-FX; Thu, 26 Sep 2024 09:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805070.1216094; Thu, 26 Sep 2024 09:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stkbC-0007uR-CI; Thu, 26 Sep 2024 09:15:46 +0000
Received: by outflank-mailman (input) for mailman id 805070;
 Thu, 26 Sep 2024 09:15:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukdd=QY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1stkbA-0007od-Mo
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 09:15:44 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7e22987-7be7-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 11:15:43 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-536a2759f0eso1251257e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 02:15:43 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f346f6sm327016966b.44.2024.09.26.02.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 02:15:41 -0700 (PDT)
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
X-Inumbo-ID: e7e22987-7be7-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727342142; x=1727946942; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bz+Paslzm+oDtzRzrU/+0ti5cLlFksM+sMp9RRxtfpk=;
        b=DHn3T6yfY64ch8F2a3HosXR+NjBqfwxCdMMBAyBdyz6uUU9JkmkVX2HpxGBZYuqqAO
         VYPtMUa7zEbiYwzvmF18pxoXtPOPCsHrst7mOcxJVMC1LO8nbCuEavLthZizzJ0W2hWA
         XoL2ABDNs7t07ZGWRKpgSxgwY0aqvQk7iulhBXyVXVOTgCw7c6F7RrkK6jPMAYoG5tfS
         H5c4huIn71zlct1w/MyKLiGjMenZqKz0fXhF+41SpZ560aoLzGaFrj20Se8fXQDHv8+f
         mNM+RYeoh08BipuoxTOJUIyfgywqry1C5O8hP2ZYNPjJoIQsFxrVqHVGAoTbEvvVnTyo
         0sOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727342142; x=1727946942;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bz+Paslzm+oDtzRzrU/+0ti5cLlFksM+sMp9RRxtfpk=;
        b=YB7eeiR+pi8SW2Zazr4jOigJHVaj3zyOSCcOR5YEVnDBZVpahUJsqeaOdZCJ+4GEmY
         gFXn+TwS7teErvErQVdEjfHTacq0DnFJqgli9lUjaWJaLCtX9T+B0gWrx3+MDmXt7iL+
         AKXWoX7/gVXWGM14npucbRgnHdykYNcARU8sRSe9i6FwS+TP/FTJbJU2zZUwFZ8LMg8Z
         OKMH6GnfQuoAQTVi+SsFvp/gtQ2Hk7fJZk8QLKO7X+7+SfWy7dWjXIWCAXAOEqbdMz1i
         MT0/ajoMFCyDc3o/cg/rrgN6na1nCaHQqLjH96Jbg3+m6uR8Yq2nwe3LHQvIUojG4CET
         Q82Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZLCtTjU3XPpY+nIb1NQwYrIhZgMLhRf1jxZdhHA0eWwFxobqvia2dUTM/TT58t46ML97peYZ4onc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNV1LBtLLNkSTzvwl+qBjIr+ExDmKPLwwzI5YzBCShq+GG3me3
	9hBzqhTpPhhll54chRLYRp/Pn9cYVDoj7H/wlyPDqC9qJZzmdWbi
X-Google-Smtp-Source: AGHT+IEWbOeepKoFWzdUfJTxIZUM6er4fgqA1HWbsYZM/Uucs7lM5OYyFtU1wNRFSD6nmHzGBPFFGQ==
X-Received: by 2002:a05:6512:3d86:b0:536:581c:9d9f with SMTP id 2adb3069b0e04-53877530f8bmr3752865e87.24.1727342142024;
        Thu, 26 Sep 2024 02:15:42 -0700 (PDT)
Message-ID: <6800a465792d27de0ea4943df9c7e2b5ac3b39d2.camel@gmail.com>
Subject: Re: [PATCH v3 1/5] xen: define ACPI and DT device info sections
 macros
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Date: Thu, 26 Sep 2024 11:15:40 +0200
In-Reply-To: <540a900e-9bff-40d0-8ace-6b443bbfca41@suse.com>
References: <cover.1727193766.git.oleksii.kurochko@gmail.com>
	 <7521839bd265e0520fc448adf50361d18dfe53df.1727193766.git.oleksii.kurochko@gmail.com>
	 <82125953-99b5-4fde-83b8-51643cce793b@suse.com>
	 <81b676ae5958d93ecbc3a552c1c0a208dfa2d18a.camel@gmail.com>
	 <540a900e-9bff-40d0-8ace-6b443bbfca41@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-09-26 at 08:23 +0200, Jan Beulich wrote:
> On 25.09.2024 18:08, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Wed, 2024-09-25 at 10:36 +0200, Jan Beulich wrote:
> > > PPC's desire to use DECL_SECTION() can certainly be covered by
> > > providing
> > > a (trivial) DECL_SECTION() also for Arm and RISC-V. Seeing that
> > > even
> > > x86
> > > overrides the default to the trivial form for building xen.efi,
> > > I'm
> > > inclined to suggest we should actually have a way for an arch to
> > > indicate
> > > to xen.lds.h that it wants just the trivial form (avoiding a
> > > later
> > > #undef).
> > If to go with what I suggested before then x86 will look like:
> >=20
> > diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> > index d48de67cfd..911585541e 100644
> > --- a/xen/arch/x86/xen.lds.S
> > +++ b/xen/arch/x86/xen.lds.S
> > @@ -3,6 +3,10 @@
> > =C2=A0
> > =C2=A0#include <xen/cache.h>
> > =C2=A0#include <xen/lib.h>
> > +
> > +#ifdef EFI
> > +#define SIMPLE_DECL_SECTION
> > +#endif
> > =C2=A0#include <xen/xen.lds.h>
> > =C2=A0#include <asm/page.h>
> > =C2=A0#undef ENTRY
> > @@ -12,9 +16,7 @@
> > =C2=A0
> > =C2=A0#define FORMAT "pei-x86-64"
> > =C2=A0#undef __XEN_VIRT_START
> > -#undef DECL_SECTION
> > =C2=A0#define __XEN_VIRT_START __image_base__
> > -#define DECL_SECTION(x) x :
> > =C2=A0
> > =C2=A0ENTRY(efi_start)
> > =C2=A0
> > diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> > index a17810bb28..fb11ba7357 100644
> > --- a/xen/include/xen/xen.lds.h
> > +++ b/xen/include/xen/xen.lds.h
> > @@ -5,6 +5,8 @@
> > =C2=A0 * Common macros to be used in architecture specific linker
> > scripts.
> > =C2=A0 */
> > =C2=A0
> > +#ifdef SIMPLE_DECL_SECTION
>=20
> #ifndef I guess?
>=20
> > @@ -15,6 +17,10 @@
> > =C2=A0# define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
> > =C2=A0#endif
> > =C2=A0
> > +#else /* SIMPLE_DECL_SECION */
> > +# define DECL_SECTION(x) x :
> > +#endif
> > +
> > =C2=A0/*
> > =C2=A0 * To avoid any confusion, please note that the EFI macro does no=
t
> > correspond
> > =C2=A0 * to EFI support and is used when linking a native EFI (i.e.
> > PE/COFF)
> > binary,
> >=20
> > Does it make sense? Or it would be better to follow way for each
> > architecture:
> > =C2=A0=C2=A0 #undef DECL_SECTION
> > =C2=A0=C2=A0 #define DECL_SECTION(x) x :
>=20
> Hard to tell which one's better; I was asking myself that same
> question
> when writing an earlier reply. I'm slightly in favor of the form you
> have
> now.
Do you mean moving only a content of section without secname and laddr
( in case of x86 and PPC ), and alignment to xen.lds.h ?

~ Oleksii

