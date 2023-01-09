Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFA46620CC
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 10:01:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473411.733994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEo1a-0002jj-EY; Mon, 09 Jan 2023 09:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473411.733994; Mon, 09 Jan 2023 09:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEo1a-0002gf-Bs; Mon, 09 Jan 2023 09:00:58 +0000
Received: by outflank-mailman (input) for mailman id 473411;
 Mon, 09 Jan 2023 09:00:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEo1Y-0002gX-FL
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 09:00:56 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f51d740-8ffc-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 10:00:53 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id f34so11879769lfv.10
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 01:00:53 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 a14-20020ac25e6e000000b004cb0cf701bfsm1502848lfr.56.2023.01.09.01.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 01:00:53 -0800 (PST)
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
X-Inumbo-ID: 1f51d740-8ffc-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OkSnczKg8DyifVN5v5YKXWTt1W4XmuFXNXvw+DyBKU0=;
        b=XDj9h2i19rAfolCNFCazX7w+18ZgxLxJS59w/t1gv/T28YR9U6aAjJEStqyTP9uM5R
         QmloYJA5WwDndpGqq3drWQ/MkUGuD1VZHCe/PUOkzV9UntQSftoKSkbEHE4CPpzephpb
         j6hwXavwY/qnkzEKwIcjAPbYVsTVOQO+XRvkfti+BHmsLg6Zt/BdA7dwAw5Loo9I8KyX
         hBJVHceUVONhV39V9jOwbNRmR/+saXFGkFZgecN90idMY8+dJxUZiZKLkj0T1Y4VzTM1
         /rYCAg256LzQTexIfkD7YgXkQAc3q7q9z/UA+lYG+/5oQN5HlgoiR7WokiZ0hQtdBT6n
         9mOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OkSnczKg8DyifVN5v5YKXWTt1W4XmuFXNXvw+DyBKU0=;
        b=UrUmpqH7A3X215JVtaIL6CFJUIvi1UpOYG+MXiRaEgCqPlL21EVZpLavawEYQoXDxp
         eOQO62wFNvXYhAj+Cp3IC25du4Lxab+XBT3wfMUIjW3CdzS8DfqbTqZfdkw2q/eS1Sy/
         ZLDJAPfkSjc+WfdWGz4vpEykjjevRWE3hNlMH86kj5ThK2g9sYTDKNkJ1d2nv+F+4+ey
         YbMpSbZgq3sepb5O9jJ1rF5HdCgv+yv8LdRL4Zl0dafXgWISHOJjxLYst3UR4YHimBR6
         67uS3GBWlaZ3rdGnbgGZs33dv94pv4rEju3iqf/XjO+Er2qEBlrzV2Tw3lWuY8GYhhdS
         S5Jg==
X-Gm-Message-State: AFqh2krNDZHRDIlBQTq21I1NFwYXmPsjhYa6HlnKLfbluKy81oKw7GT3
	iuYhgOQA5rEEDsogd3dWaKM=
X-Google-Smtp-Source: AMrXdXsSM0oFwJAP0FmpVn2BirfgZuTFma7hq5cErRpJJkZAP2wZrZnPHoZ5sCpaUAuZNx6pBfNRcw==
X-Received: by 2002:a05:6512:3588:b0:4cb:1189:285a with SMTP id m8-20020a056512358800b004cb1189285amr12548844lfr.5.1673254853553;
        Mon, 09 Jan 2023 01:00:53 -0800 (PST)
Message-ID: <53c3402164304ddc0b27d82aa6c1716cb99c4ccf.camel@gmail.com>
Subject: Re: [PATCH v1 3/8] xen/riscv: introduce stack stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>
Date: Mon, 09 Jan 2023 11:00:47 +0200
In-Reply-To: <4e577d78-ff2f-3258-99d6-712af3b6330d@xen.org>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
	 <e8f65c43d20ebdaba61738200360b14152531321.1673009740.git.oleksii.kurochko@gmail.com>
	 <4e577d78-ff2f-3258-99d6-712af3b6330d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

Hi,

On Fri, 2023-01-06 at 13:54 +0000, Julien Grall wrote:
> Hi,
>=20
> On 06/01/2023 13:14, Oleksii Kurochko wrote:
> > The patch introduces and sets up a stack in order to go to C
> > environment
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0 xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 =
+
> > =C2=A0 xen/arch/riscv/riscv64/head.S | 8 +++++++-
> > =C2=A0 xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 6 ++++++
> > =C2=A0 3 files changed, 14 insertions(+), 1 deletion(-)
> > =C2=A0 create mode 100644 xen/arch/riscv/setup.c
> >=20
> > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> > index 248f2cbb3e..5a67a3f493 100644
> > --- a/xen/arch/riscv/Makefile
> > +++ b/xen/arch/riscv/Makefile
> > @@ -1,4 +1,5 @@
> > =C2=A0 obj-$(CONFIG_RISCV_64) +=3D riscv64/
> > +obj-y +=3D setup.o
> > =C2=A0=20
> > =C2=A0 $(TARGET): $(TARGET)-syms
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(OBJCOPY) -O binary -S=
 $< $@
> > diff --git a/xen/arch/riscv/riscv64/head.S
> > b/xen/arch/riscv/riscv64/head.S
> > index 990edb70a0..ddc7104701 100644
> > --- a/xen/arch/riscv/riscv64/head.S
> > +++ b/xen/arch/riscv/riscv64/head.S
> > @@ -1,4 +1,10 @@
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .section .text.h=
eader, "ax", %progbits
> > =C2=A0=20
> > =C2=A0 ENTRY(start)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j=C2=A0 start
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 sp, cpu0_boot_stack
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 t0, PAGE_SIZE
>=20
> I would recommend to a define STACK_SIZE. So you don't make
> assumption=20
> on the size in the code and it is easier to update.
>=20
Thanks. I decied to not define STACK_SIZE because it is used now only
once and the STACK_SIZE that was introduced in Bobby's patch series was
too big at least for current purpose.

Any way it probably makes sensne to intrdouce STACK_SIZE from the start
so will take it into account during a work at new patch series.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=C2=A0=
 sp, sp, t0
> > +
> > +_start_hang:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wfi
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j=C2=A0 _start_hang
> > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > new file mode 100644
> > index 0000000000..2c7dca1daa
> > --- /dev/null
> > +++ b/xen/arch/riscv/setup.c
> > @@ -0,0 +1,6 @@
> > +#include <xen/init.h>
> > +#include <xen/compile.h>
> > +
> > +/* Xen stack for bringing up the first CPU. */
> > +unsigned char __initdata cpu0_boot_stack[PAGE_SIZE]
> > +=C2=A0=C2=A0=C2=A0 __aligned(PAGE_SIZE);
>=20
> Cheers,
>=20


