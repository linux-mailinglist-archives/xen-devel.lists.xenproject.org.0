Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F798618A8
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 18:01:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684916.1065149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdYub-0003NY-8S; Fri, 23 Feb 2024 17:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684916.1065149; Fri, 23 Feb 2024 17:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdYub-0003Lz-5D; Fri, 23 Feb 2024 17:00:37 +0000
Received: by outflank-mailman (input) for mailman id 684916;
 Fri, 23 Feb 2024 17:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/z8=KA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rdYuY-0003Ls-VW
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 17:00:35 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e3322de-d26d-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 18:00:34 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d269b2ff48so6745101fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 09:00:32 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a2e914e000000b002d0a8143f31sm2667879ljg.50.2024.02.23.09.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 09:00:31 -0800 (PST)
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
X-Inumbo-ID: 0e3322de-d26d-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708707632; x=1709312432; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xfcegJCkN+4l/qAbHquimEKw/cizmOVIAMbbX7WIHZw=;
        b=l+UAa1z0yHGaFNvbn7EFTdC+D5U7prJAlfdXRv2GYjRHDWo+PJfW33I/BmkpcWZe0Z
         DuZ0sOk83nXKErSL2IQUCtUQmOa4KJ1CCtcJe1DrpYuUTiHqvOjwOKRksdqnDXIutaLW
         E1u66G6Cc7dfOmG5zaiR8BI7Ao/iR+g7GxFp4CYHC5YfisSaMfIyOaujBoFf/6w43OIc
         h1nmL9pFpl6CgOeY4QvWOkFSwrFq8afa7fPeK+7tCV0ES09WMliJukjHeHIdIF/LWWqU
         v4Kvob2W90+NFl4XZmQZyvpxlWKtR5FTivVMqSK64Qis/GMroJ6WHnowRmkeIo3q1KO+
         5uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708707632; x=1709312432;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xfcegJCkN+4l/qAbHquimEKw/cizmOVIAMbbX7WIHZw=;
        b=tuYPi4jnfqhdT3IUeNa3FDEZwlnhEJz8/WMusw6qfMxzn1bMdlu+57tbDyMMm+QPfV
         RqdXxLiq1k5E3VzL6bG4S4NPAtG0gkqTKUGMys2dw2HxhAv+7FwFNLACg7zG4bj6650h
         sKef5a7i2srRSGJlm9JiRerkWdMKKYVmcos6EEdKa2CD93QQ/mBg5vZ4zmXmF18/qbW/
         QNxopdafy934uo5VsVp0GBboy1P60OOSpCAm0dvlR72B81jrrpaetlOHRvtfKb/S/zGX
         KwywdUXpunnqC7G0Zl4K5eUalcM+6Lx8uo8QnUFTvo4D0fOvQ04SdxilxE0OBcF+ZFGu
         JxzA==
X-Forwarded-Encrypted: i=1; AJvYcCU8pIvmsOB0pKYekDFreN7VJ0en9Uqm/rE5l3F2DgDfVxfxEjumO5GEGyC/JJfRlegBh/wWlXYTMLhFRdmT4XiSN7GwKzfYLpN7LixMHZU=
X-Gm-Message-State: AOJu0Yzk0S7s830Oqgz09HUbDE3UlJFVL4+/rwPkyESMuOsIUuh+4uXa
	A4ZzFm0FNJvtLbdRSIjr+i4bfBxNaiMMKs/TWnWTphvIWk38boLK
X-Google-Smtp-Source: AGHT+IEgTk+NxAELDXdrspIgiDNNJxy45Rj71Fb2P360WbueqQJxKy8e2bYfXC4ZUHpofIPjCB0crQ==
X-Received: by 2002:a2e:6a0d:0:b0:2d2:7580:e220 with SMTP id f13-20020a2e6a0d000000b002d27580e220mr251065ljc.15.1708707631792;
        Fri, 23 Feb 2024 09:00:31 -0800 (PST)
Message-ID: <6cd4d415ccf2163d9fdf690f29d898d61b077472.camel@gmail.com>
Subject: Re: [PATCH v4 25/30] xen/riscv: add minimal stuff to processor.h to
 build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Alistair Francis
 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Fri, 23 Feb 2024 18:00:30 +0100
In-Reply-To: <5de8f721-461c-4a0e-a11d-63aa7c93a742@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <9efbc232f64b6192cf83f865b8987846fe082720.1707146506.git.oleksii.kurochko@gmail.com>
	 <6be5102a-624c-463a-9821-c618d110ce7a@suse.com>
	 <095b8031eaaa5324cdae9fee75f9521a795feb46.camel@gmail.com>
	 <2f1e4d2d-5b33-47ff-912b-c4693744d0e9@suse.com>
	 <0bafef389b30251bc9898bb61604aa3efaabe48c.camel@gmail.com>
	 <5de8f721-461c-4a0e-a11d-63aa7c93a742@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-19 at 09:06 +0100, Jan Beulich wrote:
> On 16.02.2024 12:16, Oleksii wrote:
> > On Thu, 2024-02-15 at 17:43 +0100, Jan Beulich wrote:
> > > On 15.02.2024 17:38, Oleksii wrote:
> > > > On Tue, 2024-02-13 at 14:33 +0100, Jan Beulich wrote:
> > > > > On 05.02.2024 16:32, Oleksii Kurochko wrote:
> > > > > > +	depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D
> > > > > > 23600
> > > > >=20
> > > > > What's the linker dependency here? Depending on the answer I
> > > > > might
> > > > > further
> > > > > ask why "TOOLCHAIN" when elsewhere we use CC_HAS_ or HAS_CC_
> > > > > or
> > > > > HAS_AS_.
> > > > I missed to introduce {L}LLD_VERSION config. It should output
> > > > from
> > > > the
> > > > command:
> > > > =C2=A0 riscv64-linux-gnu-ld --version
> > >=20
> > > Doesn't answer my question though where the linker version
> > > matters
> > > here.
> > Then I misinterpreted your initial question.
> > Could you please provide further clarification or rephrase it for
> > better understanding?
> >=20
> > Probably, your question was about why linker dependency is needed
> > here,
> > then
> > it is not sufficient to check if a toolchain supports a particular=C2=
=A0
> > extension without checking if the linker supports that extension=C2=A0=
=C2=A0=20
> > too.
> > For example, Clang 15 supports Zihintpause but GNU bintutils
> > 2.35.2 does not, leading build errors like so:
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0 riscv64-linux-gnu-ld: -march=3Drv64i_zihintpause2p0: Inval=
id or
> > =C2=A0=C2=A0 unknown z ISA extension: 'zihintpause'
>=20
> Hmm, that's certainly "interesting" behavior of the RISC-V linker.
> Yet
> isn't the linker capability expected to be tied to that of gas? I
> would
> find it far more natural if a gas dependency existed here. If such a
> connection cannot be taken for granted, I'm pretty sure you'd need to
> probe both then anyway.

Wouldn't it be enough in this case instead of introducing of new
configs and etc, just to do the following:
   +ifeq ($(CONFIG_RISCV_64),y)
   +has_zihintpause =3D $(call as-insn,$(CC) -mabi=3Dlp64 -
   march=3Drv64i_zihintpause, "pause",_zihintpause,)
   +else
   +has_zihintpause =3D $(call as-insn,$(CC) -mabi=3Dilp32 -
   march=3Drv32i_zihintpause, "pause",_zihintpause,)
   +endif
   +
    riscv-march-$(CONFIG_RISCV_ISA_RV64G) :=3D rv64g
    riscv-march-$(CONFIG_RISCV_ISA_C)       :=3D $(riscv-march-y)c
   -riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) :=3D $(riscv-march-
   y)_zihintpause
   =20
    # Note that -mcmodel=3Dmedany is used so that Xen can be mapped
    # into the upper half _or_ the lower half of the address space.
    # -mcmodel=3Dmedlow would force Xen into the lower half.
   =20
   -CFLAGS +=3D -march=3D$(riscv-march-y) -mstrict-align -mcmodel=3Dmedany
   +CFLAGS +=3D -march=3D$(riscv-march-y)$(has_zihintpause) -mstrict-align
   -
   mcmodel=3Dmedany

Probably, it would be better:
   ...
   +CFLAGS +=3D -march=3D$(riscv-march-y)$(call or,$(has_zihintpause)) -
   mstrict-align -
   mcmodel=3Dmedany


~ Oleksii

