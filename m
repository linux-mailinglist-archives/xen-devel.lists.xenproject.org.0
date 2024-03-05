Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F48C8724AC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 17:47:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688869.1073570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhXw8-0004ne-IP; Tue, 05 Mar 2024 16:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688869.1073570; Tue, 05 Mar 2024 16:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhXw8-0004lE-FS; Tue, 05 Mar 2024 16:46:40 +0000
Received: by outflank-mailman (input) for mailman id 688869;
 Tue, 05 Mar 2024 16:46:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4c3Q=KL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rhXw7-0004l8-7L
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 16:46:39 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee47a4ae-db0f-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 17:46:37 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-563b7b3e3ecso8911477a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 08:46:36 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 i17-20020aa7c9d1000000b00567566227a5sm2304735edt.18.2024.03.05.08.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 08:46:35 -0800 (PST)
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
X-Inumbo-ID: ee47a4ae-db0f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709657196; x=1710261996; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v3/NMOHJDs30ug9FBLQJYBaiVg0bhu2Llz7x7XPvcms=;
        b=I0FrZrFmfa48QsEbsagvG2awhi4/vDOvaSbtGdDLudyFtUeqy7NIjd2mXgiMYkYbzb
         7N90QxxySsK4nTNwwdSt7ySjQR4sQfUt6lJYOqPqLXVXkUs59d5xq2Kll0Jm4qZWXn9G
         EP2QD5TJsSl/LxmxE1abfln2IrDi+wALQqdop1GuxlQQVsqQATTTit4wLZyjNw1JhNuN
         w+cDiRJ+CoviuUUV1w1aECjVd9fLl4Ed8lgAVnOdNwEfSGpNu1cXnc0FftSSYnRgzd5c
         bA0Fn/Wd7OFayTDoFsRZIuVxleh4eLrBL5EQZ72jvvx2NtKU3u151OM+HeBXESX4X7/D
         2B8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709657196; x=1710261996;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v3/NMOHJDs30ug9FBLQJYBaiVg0bhu2Llz7x7XPvcms=;
        b=TPJf95cUaOvwM9hrvMOk5I1Kaj5WLmWlvcR16IjhPumdOITzUYycSIqiXoy6cJ6PRe
         m1J6SST1mxWsz00KewoaGGlhREPt/G6Y6UoLxILiA0iUl/RqomdrQxdNl/fy8PuE5koT
         3GL59mhfES6KslkqsV/dzRI2m1PPg9ZLrWlHnpWGXkl1iZ2vARZRDNACLUijHGwUL2S5
         OL+eHgVv6bD1s5TMImHpko5CJCTnKgCnYmpZ511QB2Svg/D3rDsJZOsWjTbIs1I3qPYp
         cBoJ9DnZexlCNJry/fEYFOmkwDfQMqAOX+DMU6zFJydi05rv8ReFfwhpJ2/wQu91b0eV
         jArg==
X-Forwarded-Encrypted: i=1; AJvYcCUDnm4OUHA9cAh63Qb/xcbJp9TP3fDblnVicGmozS1QF35YtmOg+WTSU9QjfK7luheWgNVYQUYgxeWaowLUkdHwyx2i4WlnbhcRJKbDIuw=
X-Gm-Message-State: AOJu0YyXsm3pbqDaGxe6RYbQxTBez1Tm9jGrNFZ6NcxW4TY34jeATRWt
	m5J8uN6+OKddyJ3CSWDd3DXnUIkRIt9wfO4RCtBJVIUDcdHGnRjB
X-Google-Smtp-Source: AGHT+IFbvOra6kA+BjATWpVwUHHLlWB4Cfl0nQJXQi6pCQvnK6OHLA0fquX45PnWympXc1NodmyU6Q==
X-Received: by 2002:aa7:c944:0:b0:566:18ba:6b80 with SMTP id h4-20020aa7c944000000b0056618ba6b80mr10271037edt.31.1709657195719;
        Tue, 05 Mar 2024 08:46:35 -0800 (PST)
Message-ID: <5c83394e01f2c52ed14d5a7d2a21730c72e9f6cd.camel@gmail.com>
Subject: Re: [PATCH v5 19/23] xen/riscv: add minimal stuff to mm.h to build
 full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 05 Mar 2024 17:46:34 +0100
In-Reply-To: <1aef844e-4ea9-4651-bba7-9e665abb8892@suse.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <7f5d859b4dbc0593447ade0b221ece17eda68d1e.1708962629.git.oleksii.kurochko@gmail.com>
	 <1aef844e-4ea9-4651-bba7-9e665abb8892@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-03-05 at 09:17 +0100, Jan Beulich wrote:
> On 26.02.2024 18:39, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/mm.h
> > +++ b/xen/arch/riscv/include/asm/mm.h
> > @@ -3,11 +3,252 @@
> > =C2=A0#ifndef _ASM_RISCV_MM_H
> > =C2=A0#define _ASM_RISCV_MM_H
> > =C2=A0
> > +#include <public/xen.h>
> > +#include <xen/bug.h>
> > +#include <xen/mm-frame.h>
> > +#include <xen/pdx.h>
> > +#include <xen/types.h>
> > +
> > =C2=A0#include <asm/page-bits.h>
> > =C2=A0
> > =C2=A0#define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
> > =C2=A0#define paddr_to_pfn(pa)=C2=A0 ((unsigned long)((pa) >> PAGE_SHIF=
T))
> > =C2=A0
> > +#define paddr_to_pdx(pa)=C2=A0=C2=A0=C2=A0 mfn_to_pdx(maddr_to_mfn(pa)=
)
> > +#define gfn_to_gaddr(gfn)=C2=A0=C2=A0 pfn_to_paddr(gfn_x(gfn))
> > +#define gaddr_to_gfn(ga)=C2=A0=C2=A0=C2=A0 _gfn(paddr_to_pfn(ga))
> > +#define mfn_to_maddr(mfn)=C2=A0=C2=A0 pfn_to_paddr(mfn_x(mfn))
> > +#define maddr_to_mfn(ma)=C2=A0=C2=A0=C2=A0 _mfn(paddr_to_pfn(ma))
> > +#define vmap_to_mfn(va)=C2=A0=C2=A0=C2=A0=C2=A0
> > maddr_to_mfn(virt_to_maddr((vaddr_t)va))
>=20
> va needs parenthesizing here. Also why vaddr_t here but ...
>=20
> > +#define vmap_to_page(va)=C2=A0=C2=A0=C2=A0 mfn_to_page(vmap_to_mfn(va)=
)
> > +
> > +static inline unsigned long __virt_to_maddr(unsigned long va)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +static inline void *__maddr_to_virt(unsigned long ma)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > +=C2=A0=C2=A0=C2=A0 return NULL;
> > +}
> > +
> > +#define virt_to_maddr(va) __virt_to_maddr((unsigned long)(va))
> > +#define maddr_to_virt(pa) __maddr_to_virt((unsigned long)(pa))
>=20
> ... unsigned long here? In fact for __maddr_to_virt() I think there
> better wouldn't be any cast, such that the compiler can spot if, by
> mistake, a pointer type value was passed in. Or, wait, we can go
> yet further (also on x86): There are no uses of __maddr_to_virt()
> except here. Hence the symbol isn't needed (anymore?) in the first
> place.
I used 'unsigned long' only because I declared __virt_to_maddr() with
unsigned long argument, but I think it should should be vaddr_t as in
input argument is expected to be VA and for a cast should be used
vaddr_t too.

~ Oleksii

