Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0138D50B3
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 19:13:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732871.1138908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCjKL-0002Va-Ai; Thu, 30 May 2024 17:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732871.1138908; Thu, 30 May 2024 17:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCjKL-0002Sw-7b; Thu, 30 May 2024 17:12:33 +0000
Received: by outflank-mailman (input) for mailman id 732871;
 Thu, 30 May 2024 17:12:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LA40=NB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCjKJ-0002Sq-9i
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 17:12:31 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbe210da-1ea7-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 19:12:30 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2e95abc7259so12279211fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 10:12:30 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91cc7cd3sm192111fa.92.2024.05.30.10.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 10:12:29 -0700 (PDT)
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
X-Inumbo-ID: cbe210da-1ea7-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717089150; x=1717693950; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HP/kXBIbTyyxkwl6LnojllrDDcfzOpLmHuatAwn4qkM=;
        b=hZb54Iyyln5+kyAX7C4KyKWEjwQBs83ZhJeoEa+ihgjGnt6GwNKl08tY4vz9Kx/A7D
         vGLLM0axMFuRfupitZduolRkJKGqmwGO75PHmN6TVOSNVP48562HwLIveWmbKT8wROM+
         Rnu5FatZ4kDgjxUIzDSmF2BEzabDBCiXsL6SS30Sh4XIQQwAG8bmndRcL1qyLNXzz3zk
         X9rJ00yTQRGaOyDK/0kyH0/J36YbkXDJYnWZle1JoWcwnt7RlZ7vd/R7QrvNmFVtfGAv
         LQwLDo3Pe80dZ66Aza3d/pR3XLxJh+CsZjbGMBukfziVMeoEJKGeoZfF3AxOc9z1KW8E
         c5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717089150; x=1717693950;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HP/kXBIbTyyxkwl6LnojllrDDcfzOpLmHuatAwn4qkM=;
        b=pW9pW76yEIF0g8ypbxVTSK0NCUQrMzf6dyxJe0fjToG4kysIEXHqtuOLya29lEOuIG
         PeMSHdxrTZhKh6PW9xdP3oWNL5FH9Aw8BDoYym1kFnr2/6NOeiW5QdQ//bEtT0y4xy+9
         QsS4/r9Tt9TSXo/LXCRqhS8/oqmRISAuERF0RULFWh4QVMHIy7kRfKLPgWx/dNuMTdUI
         81BkSiQ7I1MUxm/n7Y1vUcgWNTFTYhC6CNM7XiUuTlVEGGcWPco1yNGhe3Oh2i5wM66c
         g3R69pcqHRtkAFU6mZ6fjIthoM2wTCnIVSM3SZD0gk3MeZtbXttq+31v7ys/ipD6cA4v
         rUXw==
X-Forwarded-Encrypted: i=1; AJvYcCUR5EA2WMvQ+1rMCWcdIYX1+B3P2GYwRWlpi2n/7lFpyq4cSSeyGNoSZTmxKXg3dzY+kwQJPO3CgTbAhodG0moNB73uop7z51I4AsrCObA=
X-Gm-Message-State: AOJu0YyPYq760UcqaqkmMdx+edZtMdqjqY5WIJJePScEOfbSgS9YWvBZ
	PvPB4Jf7V7BUJgrSx7s/STWEYiXUwl+leeMPKV/aXhNBx1R+VU6W
X-Google-Smtp-Source: AGHT+IGoB0OFErXOjruUTHJOg7SsXp0E49xsEN4Kya0FnmUfSarzL16ACc+pqzveGsrWKwRZb9WjGQ==
X-Received: by 2002:a2e:9951:0:b0:2ea:59a1:2810 with SMTP id 38308e7fff4ca-2ea84849961mr16816421fa.48.1717089149385;
        Thu, 30 May 2024 10:12:29 -0700 (PDT)
Message-ID: <2747a20d490252c279dd051c41a9b8dc69fb4c3e.camel@gmail.com>
Subject: Re: [PATCH v12 7/8] xen/riscv: enable full Xen build
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Date: Thu, 30 May 2024 19:12:28 +0200
In-Reply-To: <1ecd7a2c-b7da-4c59-8ebd-c3841d5991f8@citrix.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
	 <1cea913117f771a5f3b4404d7bfb7e1329f3f38e.1717008161.git.oleksii.kurochko@gmail.com>
	 <1ecd7a2c-b7da-4c59-8ebd-c3841d5991f8@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-30 at 17:48 +0100, Andrew Cooper wrote:
> On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
> > diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> > index 8285bcffef..bda35fc347 100644
> > --- a/xen/arch/riscv/stubs.c
> > +++ b/xen/arch/riscv/stubs.c
> > @@ -24,12 +24,6 @@ DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t,
> > cpu_core_mask);
> > =C2=A0
> > =C2=A0nodemask_t __read_mostly node_online_map =3D { { [0] =3D 1UL } };
> > =C2=A0
> > -/*
> > - * max_page is defined in page_alloc.c which isn't complied for
> > now.
> > - * definition of max_page will be remove as soon as page_alloc is
> > built.
> > - */
> > -unsigned long __read_mostly max_page;
> > -
> > =C2=A0/* time.c */
> > =C2=A0
> > =C2=A0unsigned long __ro_after_init cpu_khz;=C2=A0 /* CPU clock frequen=
cy in
> > kHz. */
> > @@ -419,21 +413,3 @@ void __cpu_die(unsigned int cpu)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > =C2=A0}
> > -
> > -/*
> > - * The following functions are defined in common/irq.c, but
> > common/irq.c isn't
> > - * built for now. These changes will be removed there when
> > common/irq.c is
> > - * ready.
> > - */
> > -
> > -void cf_check irq_actor_none(struct irq_desc *desc)
> > -{
> > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > -}
> > -
> > -unsigned int cf_check irq_startup_none(struct irq_desc *desc)
> > -{
> > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > -
> > -=C2=A0=C2=A0=C2=A0 return 0;
> > -}
>=20
> All 3 of these are introduced in the previous patch and deleted again
> here.=C2=A0 Looks like a rebasing accident.
Not really.

This was done to avoid build failures for RISC-V. If the HEAD is on the
previous patch where these changes are introduced and then we just drop
them, it will lead to a linkage error because these functions are
defined in common/irq.c, which isn't built for RISC-V if the HEAD is on
the previous patch:
   /build/xen/arch/riscv/entry.S:86: undefined reference to `max_page'
   riscv64-linux-gnu-ld: prelink.o:(.rodata+0x8): undefined reference to
   `irq_startup_none'
   riscv64-linux-gnu-ld: prelink.o:(.rodata+0x10): undefined reference to
   `irq_actor_none'
   riscv64-linux-gnu-ld: prelink.o:(.rodata+0x18): undefined reference to
   `irq_actor_none'
   riscv64-linux-gnu-ld: prelink.o:(.rodata+0x20): undefined reference to
   `irq_actor_none'
   riscv64-linux-gnu-ld: xen-syms: hidden symbol `irq_actor_none' isn't
   defined

That is why these stubs were introduced in the previous patch (because
common/irq.c isn't built at that moment) and are removed in this patch
(since at the moment of this patch, common/irq.c is now being built).

~ Oleksii

>=20
> (This patch has to be the final one touching build related things, so
> I
> can't simply fix it on commit)
>=20
> ~Andrew


