Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D1E6719EA
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 12:08:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480492.744941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6IT-000788-Hk; Wed, 18 Jan 2023 11:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480492.744941; Wed, 18 Jan 2023 11:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6IT-00074i-Ew; Wed, 18 Jan 2023 11:08:01 +0000
Received: by outflank-mailman (input) for mailman id 480492;
 Wed, 18 Jan 2023 11:08:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Njh=5P=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pI6IR-00074c-UG
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 11:07:59 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d12d4a8-9720-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 12:07:57 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id b7so7549851wrt.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jan 2023 03:07:57 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 v11-20020a5d678b000000b0029e1aa67fd2sm13252944wru.115.2023.01.18.03.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 03:07:56 -0800 (PST)
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
X-Inumbo-ID: 5d12d4a8-9720-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9LuFo2/WKeMOeOKp72YzVpDSENQ724G+WuPmC4Yaz5w=;
        b=WXmNLhDQl/BmaHPahkpbHgotmJC3Vpp4Zzzyys5TAS4LnbiZElcfDFdst9Nli1SwQ9
         rRiGj6Hv7cDWelX8QKY2C8E7qBogXzaWaMcwCrY7WXajXcR+XyDhRlSc+6SW6+dm1O+K
         gVfn3U8Cu8iXzzkoEUbsXlX1fuTHiJ6K46/u23EAnppBJUeLxmGHw89xgIwKUwJtnYDo
         hWQwIC0M2JL8N6TSBRwD86nyAFLazzYBGD70DOeAcHuFF1nZanf66ceHESGwRFfhFh3k
         pRcbbyX3eB+pzLqXI7qhDpZ/XUEEdhrajVvSNtT8ef1+cWvWGpCwRXEhGdOhstSjSuU+
         7rUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9LuFo2/WKeMOeOKp72YzVpDSENQ724G+WuPmC4Yaz5w=;
        b=ZH22g1gBSA9K+DxdB8r/Gg/3TUvER+egG4KVbb6xHw8GjEW7KkSaRuFXSc4Xdi6JG2
         0vOURuljTlxTLE5RBgJMhgdTsaZgBAQlEjsqQ9C00Iiq4ZbTp9czGy+WR2As7BdcM/Yl
         eg85z9LlLw51LJP4XqApG0cl04YMEX/ABlh/sXYmxpPwHQr0DpPm4j1isBtvbKvouu7Z
         ComXDQoirhvQglq0ahEHJ4yz1UbNnip4c7mTmQ9qNipIDC9UDTA+8AtXdvK+a+OTIn4O
         /iBx3vtFQlI0ajVvdr+GOVYXgDv9tokmw1fp/pvTlyhUvaMqtd7KavTkCU1ioKp4x8AH
         WIhg==
X-Gm-Message-State: AFqh2krsWMew1+/Ma8nUR2V5NSooDfnChFST7bEU0JBc395dyQdEU/Et
	ojoWS/IgKrYT/Hb1RY6c7Is=
X-Google-Smtp-Source: AMrXdXtycVJxaz2q8PdarV8lvWoEm6Cbeb8+Bj1ajDwafFstXBnU/CWtY7j5VrxjTlSDHByjNiwIZg==
X-Received: by 2002:a5d:5451:0:b0:2ba:4ee8:d708 with SMTP id w17-20020a5d5451000000b002ba4ee8d708mr5824622wrv.32.1674040077034;
        Wed, 18 Jan 2023 03:07:57 -0800 (PST)
Message-ID: <e7d325b0005dd22d59ad1be442df9c9524275cd6.camel@gmail.com>
Subject: Re: [PATCH v4 3/4] xen/riscv: introduce early_printk basic stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>
Date: Wed, 18 Jan 2023 13:07:55 +0200
In-Reply-To: <d0cabe82-315e-408c-7364-33e2b5093ee6@citrix.com>
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
	 <915bd184c6648a1a3bf0ac6a79b5274972bb33dd.1673877778.git.oleksii.kurochko@gmail.com>
	 <d0cabe82-315e-408c-7364-33e2b5093ee6@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-01-17 at 23:57 +0000, Andrew Cooper wrote:
> On 16/01/2023 2:39 pm, Oleksii Kurochko wrote:
> > diff --git a/xen/arch/riscv/Kconfig.debug
> > b/xen/arch/riscv/Kconfig.debug
> > index e69de29bb2..e139e44873 100644
> > --- a/xen/arch/riscv/Kconfig.debug
> > +++ b/xen/arch/riscv/Kconfig.debug
> > @@ -0,0 +1,6 @@
> > +config EARLY_PRINTK
> > +=C2=A0=C2=A0=C2=A0 bool "Enable early printk"
> > +=C2=A0=C2=A0=C2=A0 default DEBUG
> > +=C2=A0=C2=A0=C2=A0 help
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enables early printk debug messages
>=20
> Kconfig indentation is a little hard to get used to.
>=20
> It's one tab for the main block, and one tab + 2 spaces for the help
> text.
>=20
> Also, drop the blank line after help.
>=20
> > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> > index fd916e1004..1a4f1a6015 100644
> > --- a/xen/arch/riscv/Makefile
> > +++ b/xen/arch/riscv/Makefile
> > @@ -1,3 +1,4 @@
> > +obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
> > =C2=A0obj-$(CONFIG_RISCV_64) +=3D riscv64/
> > =C2=A0obj-y +=3D sbi.o
> > =C2=A0obj-y +=3D setup.o
> > diff --git a/xen/arch/riscv/early_printk.c
> > b/xen/arch/riscv/early_printk.c
> > new file mode 100644
> > index 0000000000..6bc29a1942
> > --- /dev/null
> > +++ b/xen/arch/riscv/early_printk.c
> > @@ -0,0 +1,45 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * RISC-V early printk using SBI
> > + *
> > + * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
> > + */
> > +#include <asm/early_printk.h>
> > +#include <asm/sbi.h>
> > +
> > +/*
> > + * early_*() can be called from head.S with MMU-off.
> > + *
> > + * The following requiremets should be honoured for early_*() to
> > + * work correctly:
> > + *=C2=A0=C2=A0=C2=A0 It should use PC-relative addressing for accessin=
g symbols.
> > + *=C2=A0=C2=A0=C2=A0 To achieve that GCC cmodel=3Dmedany should be use=
d.
> > + */
> > +#ifndef __riscv_cmodel_medany
> > +#error "early_*() can be called from head.S before relocate so it
> > should not use absolute addressing."
> > +#endif
>=20
> This is incorrect.
>=20
> What *this* file is compiled with has no bearing on how head.S calls
> us.=C2=A0 The RISC-V documentation explaining __riscv_cmodel_medany vs
> __riscv_cmodel_medlow calls this point out specifically.=C2=A0 There's
> nothing you can put here to check that head.S gets compiled with
> medany.
>=20
> Right now, there's nothing in this file dependent on either mode, and
> it's not liable to change in the short term.=C2=A0 Furthermore, Xen isn't
> doing any relocation in the first place.
>=20
> We will want to support XIP in due course, and that will be compiled
> __riscv_cmodel_medlow, which is a fine and legitimate usecase.
>=20
>=20
> The build system sets the model up consistently.=C2=A0 All you are doing
> by
> putting this in is creating work that someone is going to have to
> delete
> for legitimate reasons in the future.
>=20
> > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > index 13e24e2fe1..9c9412152a 100644
> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -1,13 +1,17 @@
> > =C2=A0#include <xen/compile.h>
> > =C2=A0#include <xen/init.h>
> > =C2=A0
> > +#include <asm/early_printk.h>
> > +
> > =C2=A0/* Xen stack for bringing up the first CPU. */
> > =C2=A0unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
> > =C2=A0=C2=A0=C2=A0=C2=A0 __aligned(STACK_SIZE);
> > =C2=A0
> > =C2=A0void __init noreturn start_xen(void)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0 for ( ;; )
> > +=C2=A0=C2=A0=C2=A0 early_printk("Hello from C env\n");
> > +
> > +=C2=A0=C2=A0=C2=A0 for ( ; ; )
>=20
> Rebasing error?
>=20
If you are not speaking about adding of the space between "; ;" than it
is rebasing error. I will double-check it during work on new version of
the patch series.
> ~Andrew
~Oleksii

