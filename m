Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 158F2663B10
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:29:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474414.735579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFA0V-00026U-6R; Tue, 10 Jan 2023 08:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474414.735579; Tue, 10 Jan 2023 08:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFA0V-00023c-2l; Tue, 10 Jan 2023 08:29:19 +0000
Received: by outflank-mailman (input) for mailman id 474414;
 Tue, 10 Jan 2023 08:29:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek+I=5H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pFA0T-00023U-Lz
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:29:17 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de2bb332-90c0-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 09:29:15 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id cf18so20261186ejb.5
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 00:29:15 -0800 (PST)
Received: from 2a02.2378.1014.d6d9.ip.kyivstar.net
 ([2a02:2378:1014:d6d9:98bb:6889:a785:5d8c])
 by smtp.gmail.com with ESMTPSA id
 y19-20020a1709060a9300b0084debc351b3sm1401014ejf.20.2023.01.10.00.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 00:29:14 -0800 (PST)
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
X-Inumbo-ID: de2bb332-90c0-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PbwEnvP28IXrNyfma1R9wMCLoHMIHS4QeFEg6V+6yGo=;
        b=HwwzIy2qZCXgfhG6Zms6XS2miKZBCfF+vA5UbZQe6jrpYzPELMhVCS2S9/5t/GSikF
         YNr8RWmA/SEfq6phnuEtsmczXXi6VG7qnnbRodVUYjiGO9OQOx3s64MA49Nua4P10vrc
         3NZSdoGpebwIaMOiayIjProyULY4jlnBhEoEq5MbjhrzLrqiSd42fM720v5IG7paulZ3
         4+3pIPtX8f9z/TpcVu0DYLelq2J9aKan5WgqgcKRLbO7UuUZ+yoivn8/PSy0wmcGTC9i
         Osq4chsk4lG8mK+MkFckl4cq2xcn/Gl21PBTCX5/rrLoJxTZbRqn1bV4C/DAfsCQQmav
         9ykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PbwEnvP28IXrNyfma1R9wMCLoHMIHS4QeFEg6V+6yGo=;
        b=GqmyAfgxYxcWvhqbkw4dHDD+rYxV86vVUtCFfic1o7WHjesuSRZgjR10tZq9tQhRqN
         5Gkgy3/fv4fCK4JcWaelDK1qkvJ7PqQZXSs58uPCPDybdxWVMmtHKRn4ZSZVljDSH6/v
         HkRCQ+t4zbT7hw7Z3+2StE/LEZpFaE228TV2RM17hoxr+6dlknQ/nNqQD9NfwxLGCp+y
         GcRjLcWgTEgkspw8NG8lbvyXYPsLjfYOT3gV5mHArM5GeGIUBDj3oTfW/F1Pn8uKwNgW
         VfOd/wIuKJz7ZKl8vwZEDeF+csSoWflCKE5FUr96rik3qj6kGqi7HExYSgtKPuJQILr5
         FqFA==
X-Gm-Message-State: AFqh2krRW2T/OdHRECHUg1STQc/AuqRTeYE0T/gL+3GVaR9E0cKgVZvW
	6OhBG01k0wKmYtsM4hcBCU0=
X-Google-Smtp-Source: AMrXdXscl0HAHCTAtCsYQF87Oc/mdzKLVYF1+arZzHCjbrD7bhBYyixaaxHPTwrSVEe7Qjngd4Fjag==
X-Received: by 2002:a17:906:700f:b0:7c0:b79c:7d5f with SMTP id n15-20020a170906700f00b007c0b79c7d5fmr74184064ejj.68.1673339355096;
        Tue, 10 Jan 2023 00:29:15 -0800 (PST)
Message-ID: <13d7161756f1eb4cd359f2fb7694eb398814235b.camel@gmail.com>
Subject: Re: [PATCH v2 3/8] xen/riscv: introduce stack stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Tue, 10 Jan 2023 10:29:13 +0200
In-Reply-To: <e5ecc23f-4d4b-fa21-bd71-68cefcde644f@xen.org>
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
	 <b253e61bebbc029c94b89389d81643f9587200b7.1673278109.git.oleksii.kurochko@gmail.com>
	 <e5ecc23f-4d4b-fa21-bd71-68cefcde644f@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-01-09 at 16:11 +0000, Julien Grall wrote:
> Hi,
>=20
> On 09/01/2023 15:46, Oleksii Kurochko wrote:
> > The patch introduces and sets up a stack in order to go to C
> > environment
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> It looks like the comments from Andrew were missed.
>=20
I will double check which one.
Thanks.
> > ---
> > Changes in V2:
> > =C2=A0=C2=A0=C2=A0=C2=A0 - introduce STACK_SIZE define.
> > =C2=A0=C2=A0=C2=A0=C2=A0 - use consistent padding between instruction m=
nemonic and
> > operand(s)
> > ---
> > =C2=A0 xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A0 xen/arch/riscv/include/asm/config.h | 2 ++
> > =C2=A0 xen/arch/riscv/riscv64/head.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 8 +++++++-
> > =C2=A0 xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 ++++++
> > =C2=A0 4 files changed, 16 insertions(+), 1 deletion(-)
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
> > diff --git a/xen/arch/riscv/include/asm/config.h
> > b/xen/arch/riscv/include/asm/config.h
> > index 0370f865f3..bdd2237f01 100644
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -43,6 +43,8 @@
> > =C2=A0=20
> > =C2=A0 #define SMP_CACHE_BYTES (1 << 6)
> > =C2=A0=20
> > +#define STACK_SIZE (PAGE_SIZE)
> > +
> > =C2=A0 #endif /* __RISCV_CONFIG_H__ */
> > =C2=A0 /*
> > =C2=A0=C2=A0 * Local variables:
> > diff --git a/xen/arch/riscv/riscv64/head.S
> > b/xen/arch/riscv/riscv64/head.S
> > index 990edb70a0..c1f33a1934 100644
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
=C2=A0 t0, STACK_SIZE
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=C2=A0=
 sp, sp, t0
> > +
> > +_start_hang:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wfi
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 _start_hang
> > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > new file mode 100644
> > index 0000000000..41ef4912bd
> > --- /dev/null
> > +++ b/xen/arch/riscv/setup.c
> > @@ -0,0 +1,6 @@
> > +#include <xen/init.h>
> > +#include <xen/compile.h>
>=20
> Why do you need to include <xen/compile.h>?
>=20
It is needed to use __aligned define which looks better then
__attribute__((__aligned__(SOMETHING)))=20
> In any case, please order the include alphabetically. I haven't look
> at=20
Thanks. I didn't now that headers should be in alphabetic order too.
> the rest of the series. But please go through the series and check
> that=20
> generic comments (like this one) are addressed everywhere.
>=20
> Cheers,
>=20
~Oleksii


