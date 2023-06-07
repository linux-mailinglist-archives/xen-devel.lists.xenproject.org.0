Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D74725B5B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 12:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544661.850589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qCk-0002LM-0u; Wed, 07 Jun 2023 10:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544661.850589; Wed, 07 Jun 2023 10:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qCj-0002It-TL; Wed, 07 Jun 2023 10:15:49 +0000
Received: by outflank-mailman (input) for mailman id 544661;
 Wed, 07 Jun 2023 10:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dr0h=B3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q6qCi-0002Ig-PW
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 10:15:48 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4552720f-051c-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 12:15:47 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so8913126e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jun 2023 03:15:47 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 p22-20020ac246d6000000b004f37b88eacfsm1770328lfo.187.2023.06.07.03.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 03:15:46 -0700 (PDT)
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
X-Inumbo-ID: 4552720f-051c-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686132947; x=1688724947;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E5lxxK/xMpqofr08SFrgsXPsNcUoNAtV4pO/43/mWz0=;
        b=OaFSNwiKY9qpGYmwLRnwh3akWNUriM8AKUI//tVmJIV++Wyzsf2J2OfxfpNR6JkEIV
         1gpTlxAud+b3irQez+wdYhCr2G5R76Pnj1EAVs7OVBAATvGvecPwuTch4r8QpFPFezVO
         I0ztHzW/gvYGNTsLhQ0FPXQLabuHS5LB+e1WkpQsdaiHG/4aHj4lI95k4k5cx8QhY9ql
         JzbJ9lz5J1AZ+cj1iP7t7Q991LQ+LTQntHu4Br/76Z3Qyqu/cHz0A46TFZUrTXyFQtWg
         c41HAZYe2VYh2H2X7tpMp17rAbbZc6JR9dlXjJ+QztXtkUG09Lk48Xx1XpUA+wyyP7Mn
         q19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686132947; x=1688724947;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E5lxxK/xMpqofr08SFrgsXPsNcUoNAtV4pO/43/mWz0=;
        b=S35r9Rdt8M3h3lcSRQ+DfjmNMigO6CoAN/jJrhVTGIh5gpZNHLV0y7yYVTzkSLP3mQ
         inKKpW3/sanRzvazDn+F3lAmzd4TivFpGj6BbQH5wghgMYTEo56wx0Qe62c0BBzjqDo8
         rRsmMK6JETeNXJdPKVTFjqnQa6ii5VdXW/Lli2yBQCK1CiE/uAuYwq+AkZQHLPkoz7F0
         1g6SkwyGoEOuZUo+bPhG6w9C6ibl0rlwjkRsMfNzlw1sjhi62Vlz8OJQzc8tzdRZcc+N
         WctnGcJrjdiX4MsYDx/4xy9BEankaBvVUpUuhl3bcYxRkXeQUmq7gRC4JUjXMmiNXUYq
         iNTA==
X-Gm-Message-State: AC+VfDwmh0lZiIinL9RCa37Vnd1wRAP1Ghz35lOb3RDmrr2KyCKvhnFq
	mK4J40pas33nrfZoZKmyBgg=
X-Google-Smtp-Source: ACHHUZ5zDivWkYsuCppYNux00zVDtguDXRp5DgCISFRqH1dn5mNI9Eau2iDH23nBCjb3xUJjm7d33Q==
X-Received: by 2002:ac2:4479:0:b0:4f3:afcc:e1bb with SMTP id y25-20020ac24479000000b004f3afcce1bbmr2072881lfl.1.1686132946711;
        Wed, 07 Jun 2023 03:15:46 -0700 (PDT)
Message-ID: <799c7cfeca4787ce86451b2b8dfb9315310fa3e9.camel@gmail.com>
Subject: Re: [PATCH v1 0/8] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 07 Jun 2023 13:15:45 +0300
In-Reply-To: <e3e3f8ef-fbf6-76b8-4883-219d67e5db4e@suse.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
	 <e3e3f8ef-fbf6-76b8-4883-219d67e5db4e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.2 (3.48.2-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-06-07 at 09:49 +0200, Jan Beulich wrote:
> On 06.06.2023 21:55, Oleksii Kurochko wrote:
> > The patch series introduces things necessary to implement identity
> > mapping:
> > =C2=A0 1. Make identity mapping for _start and stack.
> > =C2=A0 2. Enable MMU.
> > =C2=A0 3. Jump to the virtual address world
> > =C2=A0 4. Remove identity mapping for _start and stack.
> >=20
> > Also current patch series introduces the calculation of physical
> > offset before
> > MMU is enabled as access to physical offset will be calculated
> > wrong after
> > MMU will be enabled because access to phys_off variable is PC-
> > relative and
> > in the case when linker address !=3D load address, it will cause MMU
> > fault.
> >=20
> > One more thing that was done is:
> > =C2=A0 * Added SPDX tags.
> > =C2=A0 * Added __ASSEMBLY__ guards.
>=20
> These are are, aiui, a response to a comment from Andrew. Hence I
> think
> this wants expressing by a {Requested,Suggested,Reported}-by: tag in
> the
> respective patch.
Thanks for a remark.

~ Oleksii

> > =C2=A0 * move extern of cpu0_boot_stack to a header.
> >=20
> > The reason for this patch series can be found here:
> > https://lore.kernel.org/xen-devel/4e336121-fc0c-b007-bf7b-430352563d55@=
citrix.com/
> >=20
> > Oleksii Kurochko (8):
> > =C2=A0 xen/riscv: make sure that identity mapping isn't bigger then pag=
e
> > size
> > =C2=A0 xen/riscv: add .sbss section to .bss
> > =C2=A0 xen/riscv: introduce reset_stack() function
> > =C2=A0 xen/riscv: introduce function for physical offset calculation
> > =C2=A0 xen/riscv: introduce identity mapping
> > =C2=A0 xen/riscv: add SPDX tags
> > =C2=A0 xen/riscv: add __ASSEMBLY__ guards
> > =C2=A0 xen/riscv: move extern of cpu0_boot_stack to header
> >=20
> > =C2=A0xen/arch/riscv/include/asm/config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0xen/arch/riscv/include/asm/current.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0xen/arch/riscv/include/asm/early_printk.h |=C2=A0=C2=A0 2 +
> > =C2=A0xen/arch/riscv/include/asm/mm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> > =C2=A0xen/arch/riscv/include/asm/page-bits.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 2 +
> > =C2=A0xen/arch/riscv/include/asm/page.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 ++
> > =C2=A0xen/arch/riscv/include/asm/traps.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0xen/arch/riscv/include/asm/types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 119 +++++++++++++++---
> > ----
> > =C2=A0xen/arch/riscv/riscv64/head.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 40 +++++++-
> > =C2=A0xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 16 +--
> > =C2=A0xen/arch/riscv/xen.lds.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 =
+-
> > =C2=A012 files changed, 160 insertions(+), 53 deletions(-)
> >=20
>=20


