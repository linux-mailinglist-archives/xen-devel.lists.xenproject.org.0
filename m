Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED985816B65
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655850.1023691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFB7U-00005M-7t; Mon, 18 Dec 2023 10:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655850.1023691; Mon, 18 Dec 2023 10:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFB7U-0008U8-4z; Mon, 18 Dec 2023 10:45:08 +0000
Received: by outflank-mailman (input) for mailman id 655850;
 Mon, 18 Dec 2023 10:45:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFB7T-0008U2-59
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:45:07 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81c49e3a-9d92-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 11:45:06 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50e0d1f9fe6so3239715e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 02:45:06 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k14-20020ac257ce000000b0050e3464b390sm414349lfo.234.2023.12.18.02.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 02:45:05 -0800 (PST)
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
X-Inumbo-ID: 81c49e3a-9d92-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702896306; x=1703501106; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6ApyRgxr82IK8huQazKMS4Grkj8EA18c6hdKN81ovao=;
        b=iUQQM+uFai0R4uK55m6eU3fU+gqA/zI2+REMUvuRljRhVO24p+Ogqy4atApYidPt2W
         6FD8bfEyypwfu/VS0L+bBjiWIuDhSrgRWTc+IXJ7+LmzgfGbeMiuJ7kRUklitWZYK2Tm
         yQvWpsGnZcSJcpFSQuX2BNVXvzhm5svTDZ+EA3v6GWxNGVqdtV5xzvy/daGLmj+E3hx1
         DznEkXwYXvB9sA+9Iv4jHladyIWLdm6mPC1J0VfSI7TGCCoQIMhT8A68VqJMSh1QhTyR
         Op/nLi7trSZI9r+u6EXicCBUPBKRsTFd9la04SqQWXrHebKPokpJk64YcqhQB1qUH1OG
         1Exw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702896306; x=1703501106;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ApyRgxr82IK8huQazKMS4Grkj8EA18c6hdKN81ovao=;
        b=HfD4c5A+3VC3Ba5DJxG8OcSFmtz9Hgjo4ofulkNo1VQl139GAM0Y9pI4FCsigD2Qqp
         R37ihsSrJ/DGyj3bC1LdzdUeAvi5I87dT+CPJt/lQQiELZCBudaBCmscz+Y4Ud8JBtAG
         9SGQM01OZ/1KoR+OTyh/L9qDhqFLJzIizADDUofAzFHwpkldUUo6a/NLBee5Lp/OzpPv
         M3apPPU+jtNAsjqCZAOjo8ishiM/4Ka0FNfPDd9oM8lYiUTpQN/Xh6PvV8VmUN7mEQMx
         MgqmDAEl0ZbJoOPuXzn7czEFQaIdUKzLIS8BWu5dIwKpCzKhuXJ2uq2ol+TPHwCB/ObF
         vOhg==
X-Gm-Message-State: AOJu0Yw6ESLoj15G/KRj9L/Hn0iXWIyP9IbKB6lMxMSe1SaGOYUhXRxK
	fXVBhd49kqSR3l0+2fj6bno=
X-Google-Smtp-Source: AGHT+IGtnK0MXifLyXtE9BFwj1U3KvEgE9X7i7UF8jkxhXzdYAVgsbyS5Comfc6AlF1vXQYXFZobFw==
X-Received: by 2002:a05:6512:518:b0:50c:1280:8506 with SMTP id o24-20020a056512051800b0050c12808506mr7148036lfb.42.1702896305790;
        Mon, 18 Dec 2023 02:45:05 -0800 (PST)
Message-ID: <c0ae5654e6be1eb10282a3d95fb419d5c975e98b.camel@gmail.com>
Subject: Re: [PATCH v2 32/39] xen/riscv: add minimal stuff to asm/page.h to
 build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 12:45:04 +0200
In-Reply-To: <ccef1adc-af39-43b2-8f97-ed3895e8809d@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <34a4bc023eb50e1d1cf70fa149825c51f2f4555f.1700761381.git.oleksii.kurochko@gmail.com>
	 <ccef1adc-af39-43b2-8f97-ed3895e8809d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-14 at 16:57 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> I wonder though ...
>=20
> > --- a/xen/arch/riscv/include/asm/page.h
> > +++ b/xen/arch/riscv/include/asm/page.h
> > @@ -6,6 +6,7 @@
> > =C2=A0#ifndef __ASSEMBLY__
> > =C2=A0
> > =C2=A0#include <xen/const.h>
> > +#include <xen/bug.h>
> > =C2=A0#include <xen/types.h>
> > =C2=A0
> > =C2=A0#include <asm/mm.h>
> > @@ -32,6 +33,9 @@
> > =C2=A0#define PTE_LEAF_DEFAULT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (PTE_VALID | PTE_READABLE |
> > PTE_WRITABLE)
> > =C2=A0#define PTE_TABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (PTE_VALID)
> > =C2=A0
> > +/* TODO */
> > +#define PAGE_HYPERVISOR 0
>=20
> ... whether this couldn't be defined properly right away.
It can be introduced now but it requires some additional defines to be
introduced in the same time:

#define _PAGE_W_BIT     2
#define _PAGE_XN_BIT    3
#define _PAGE_RO_BIT    1
#define _PAGE_XN        (1U << _PAGE_XN_BIT)
#define _PAGE_RO        (1U << _PAGE_RO_BIT)
#define _PAGE_W         (1U << _PAGE_W_BIT)

...
/*
 * _PAGE_DEVICE and _PAGE_NORMAL are convenience defines. They are not
 * meant to be used outside of this header.
 */
// #define _PAGE_DEVICE    _PAGE_XN
#define _PAGE_NORMAL    _PAGE_PRESENT

#define PAGE_HYPERVISOR_RW      (_PAGE_NORMAL | _PAGE_RO | _PAGE_XN |
_PAGE_W)

#define PAGE_HYPERVISOR         PAGE_HYPERVISOR_RW

And _PAGE_PRESENT in pgtbl-bits.h:

#define _PAGE_PRESENT   (1 << 0)

I prefer to introduce all this things when it will be really used.

~ Oleksii


