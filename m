Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B230A854875
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:34:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680606.1058616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDWz-0002f7-2X; Wed, 14 Feb 2024 11:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680606.1058616; Wed, 14 Feb 2024 11:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDWy-0002by-W5; Wed, 14 Feb 2024 11:34:24 +0000
Received: by outflank-mailman (input) for mailman id 680606;
 Wed, 14 Feb 2024 11:34:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raDWx-0002bs-63
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:34:23 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fede3ab4-cb2c-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 12:34:21 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-561587ce966so1233530a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:34:21 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a056402074500b005638caeff4bsm134737edy.22.2024.02.14.03.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:34:20 -0800 (PST)
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
X-Inumbo-ID: fede3ab4-cb2c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707910460; x=1708515260; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tPi62fcobDHUKuWkdKdit8MbEtdoP0CMKdDYvUv8Ruk=;
        b=FWILDKlrbfSDAkF7bVnzrets3XH6w5rb7stIGVtQRvpd+bpEWz4ACU/stu0xxvmlmm
         Tu3HTfHDAtBPiqvf9WeRLmSFq5cy0/2sYbXM9LRcaa6A8+yh3oEZBPd1v/GnUq4BgfN6
         W8CgD2ZspI1XSPRVZGtW6Pauzdp594DAkdMmM/UbomyPMjKj/RYqyOz9920CsCMMGqqb
         ZVI2iB8ZJ4WULLF0RJsEjMBRQSDsRzSL2LwuS/dFyPluB9lL83TFGrbI0ugZnPSC2lvs
         Nfi3530BKKtPv4ZFUSfAPk/gUxt64gIArtw2g2YgRp2TeiCEUkRsi7fXuecxIy8zERHO
         PbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707910460; x=1708515260;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPi62fcobDHUKuWkdKdit8MbEtdoP0CMKdDYvUv8Ruk=;
        b=XjzVEY+PWrZ4Ao7jMS/BwmChTcehSqi3+4fRn0ld6+cKRvs1rF1Pk5wSkszCW7bsVq
         LExFxBve27OCBW7tjMxLfBsAr+efND//EnD5wql68U9SDIGC9g/67R+D7OeESoMYLGr1
         DxbDvKKTWTrcDhbvq1nlNoOFjNQF8fURvYu7AXvJCSOG9LkkNCwCUOd+FfQC2h9YGvA3
         mxxuKw3kVIY5fI1TgbncsjtLjiZ3P1RBZr9hF69S4MYMgCNMj5oAmylBULgS13IoV0jz
         z7yhBgLo4TZdqBnS5OQehwkPROyUM50Dp4nqKrNHZSrCGgirQcVm2kjF1SsNHDgO+tpi
         dd/g==
X-Forwarded-Encrypted: i=1; AJvYcCU7SQ7h25DqIUeXfdLDYks6I9deoapbRGzs3r5nkK9pQTZ1m9EnmO0vM8Y9AjZHILUiMcjWBwdgdK+JNG/i619vU+lNW/P/3zru2dp9+TQ=
X-Gm-Message-State: AOJu0Yz/smJJp+DNCdw6iu7/CM2HmNasEm3EH5DCiMQN+1h1JE/cHeO8
	YY6O0v7MsjYySy3HD2+ZWVmmeKmu8qecVvCBtWtBaroYObFjJRSx
X-Google-Smtp-Source: AGHT+IGATqMdBmVHPZd4BquITBOSNOO+olDNRbN603USHMv1ECqd4FXOQrgi8E4A31B43xKgK3ZGfg==
X-Received: by 2002:a05:6402:c4f:b0:561:f2b1:a68 with SMTP id cs15-20020a0564020c4f00b00561f2b10a68mr1447174edb.20.1707910460411;
        Wed, 14 Feb 2024 03:34:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4CO0VlsdTuynp/FsKIqyTeeoE24v9VZNXvg/ZgaPWBVazpoEVB8zq9jeBGJyrDxIyNXG7qT6pUHPZjTb+wrL2Hkj09m1TSApwd+iL3R7NCyD/lfTpI8UOEJst4TGUuVwLhFtdCX5k/GC7MpHIDsfA3ZjwMoaHEX3wUnIJFDuIS7LoLCh3vhrURbEltxXVZhTFqacJn15BLSIhLBNJMY2RNzzLuS64NngsoPq7JESZfMiJBbBgkOoBD7ctCvglzDnhL3vJZEK/FFWvMoDmrXfqVG3Q8XYfL5Bktnw2/Kz3idDUizv9Wsw=
Message-ID: <c390cfc4b2993befc5ef5cd5f41fe34a7c85eda4.camel@gmail.com>
Subject: Re: [PATCH v4 13/30] xen/riscv: introduce io.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 14 Feb 2024 12:34:19 +0100
In-Reply-To: <5508296c-2721-43e4-83d3-2603ce31d010@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <64afc021f680e55d486f8429c02513bc9bf4b9ea.1707146506.git.oleksii.kurochko@gmail.com>
	 <5508296c-2721-43e4-83d3-2603ce31d010@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-02-13 at 12:05 +0100, Jan Beulich wrote:
> On 05.02.2024 16:32, Oleksii Kurochko wrote:
> > The header taken form Linux 6.4.0-rc1 and is based on
> > arch/riscv/include/asm/mmio.h.
> >=20
> > Addionally, to the header was added definions of ioremap_*().
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V4:
> > =C2=A0- delete inner parentheses in macros.
> > =C2=A0- s/u<N>/uint<N>.
> > ---
> > Changes in V3:
> > =C2=A0- re-sync with linux kernel
> > =C2=A0- update the commit message
> > ---
> > Changes in V2:
> > =C2=A0- Nothing changed. Only rebase.
> > ---
> > =C2=A0xen/arch/riscv/include/asm/io.h | 142
> > ++++++++++++++++++++++++++++++++
> > =C2=A01 file changed, 142 insertions(+)
> > =C2=A0create mode 100644 xen/arch/riscv/include/asm/io.h
> >=20
> > diff --git a/xen/arch/riscv/include/asm/io.h
> > b/xen/arch/riscv/include/asm/io.h
> > new file mode 100644
> > index 0000000000..1e61a40522
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/io.h
> > @@ -0,0 +1,142 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * {read,write}{b,w,l,q} based on arch/arm64/include/asm/io.h
> > + *=C2=A0=C2=A0 which was based on arch/arm/include/io.h
> > + *
> > + * Copyright (C) 1996-2000 Russell King
> > + * Copyright (C) 2012 ARM Ltd.
> > + * Copyright (C) 2014 Regents of the University of California
> > + */
> > +
> > +
> > +#ifndef _ASM_RISCV_IO_H
> > +#define _ASM_RISCV_IO_H
> > +
> > +#include <asm/byteorder.h>
> > +
> > +/*
> > + * The RISC-V ISA doesn't yet specify how to query or modify PMAs,
> > so we can't
> > + * change the properties of memory regions.=C2=A0 This should be fixed
> > by the
> > + * upcoming platform spec.
> > + */
> > +#define ioremap_nocache(addr, size) ioremap(addr, size)
> > +#define ioremap_wc(addr, size) ioremap(addr, size)
> > +#define ioremap_wt(addr, size) ioremap(addr, size)
> > +
> > +/* Generic IO read/write.=C2=A0 These perform native-endian accesses.
> > */
> > +#define __raw_writeb __raw_writeb
>=20
> What use are this and the similar other #define-s?
I don't know specific reason for that, this file fully based on Linux's
arch/riscv/include/asm/mmio.h, so we can drop such defines.

>=20
> > +static inline void __raw_writeb(uint8_t val, volatile void __iomem
> > *addr)
> > +{
> > +	asm volatile("sb %0, 0(%1)" : : "r" (val), "r" (addr));
>=20
> Nit (throughout): Missing blanks. Or wait - is this file intended to
> be Linux style? If so, it's just one blank that's missing.
I started to update the code style, so I am OK to add missing blanks.
Thanks.
>=20
> > +/*
> > + * Unordered I/O memory access primitives.=C2=A0 These are even more
> > relaxed than
> > + * the relaxed versions, as they don't even order accesses between
> > successive
> > + * operations to the I/O regions.
> > + */
> > +#define readb_cpu(c)		({ uint8_t=C2=A0 __r =3D __raw_readb(c);
> > __r; })
> > +#define readw_cpu(c)		({ uint16_t __r =3D
> > le16_to_cpu((__force __le16)__raw_readw(c)); __r; })
> > +#define readl_cpu(c)		({ uint32_t __r =3D
> > le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
>=20
> Didn't we settle on the little-endian stuff to be dropped from here?
> No matter what CPU endianness, what endianness a particular device
> (and hence its MMIO region(s)) is using is entirely independent.
> Hence
> conversion, where necessary, needs to occur at a layer up.
Yes, just missed to remove that.

>=20
> Also, what good do the __r variables do here? If they weren't here,
> we also wouldn't need to discuss their naming.
I don't see to much sense in __r, so it could be dropped.

>=20
> > +#define writeb_cpu(v,c)		((void)__raw_writeb(v,c))
> > +#define
> > writew_cpu(v,c)		((void)__raw_writew((__force uint16_t)cpu_to_le16(v),c=
))
> > +#define
> > writel_cpu(v,c)		((void)__raw_writel((__force uint32_t)cpu_to_le32(v),c=
))
>=20
> Nit: Blanks after commas please (also again further down).
Thanks, I'll update that.

>=20
> > +#ifdef CONFIG_64BIT
> > +#define readq_cpu(c)		({ u64 __r =3D le64_to_cpu((__force
> > __le64)__raw_readq(c)); __r; })
> > +#define
> > writeq_cpu(v,c)		((void)__raw_writeq((__force u64)cpu_to_le64(v),c))
>=20
> uint64_t (twice)
>=20
> > +#endif
> > +
> > +/*
> > + * I/O memory access primitives. Reads are ordered relative to any
> > + * following Normal memory access. Writes are ordered relative to
> > any prior
> > + * Normal memory access.=C2=A0 The memory barriers here are necessary
> > as RISC-V
> > + * doesn't define any ordering between the memory space and the
> > I/O space.
> > + */
> > +#define __io_br()	do {} while (0)
>=20
> Nit: This and ...
>=20
> > +#define __io_ar(v)	__asm__ __volatile__ ("fence i,r" : : :
> > "memory");
> > +#define __io_bw()	__asm__ __volatile__ ("fence w,o" : : :
> > "memory");
> > +#define __io_aw()	do { } while (0)
>=20
> ... this want to be spelled exactly the same.
Oh, overlooked that. Thanks.

>=20
> Also, why does __io_ar() have a parameter (which it then doesn't
> use)?
In case of Xen and RISC-V, it can be droped. in case of Linux,
__io_ar() is also defined, at least, for Arm where this parameter is
used, so I assume that intention was to have the same API for
__io_ar().

>=20
> Finally at least within a single file please be consistent about
> asm()
> vs __asm__() use.
>=20
> > +#define readb(c)	({ uint8_t=C2=A0 __v; __io_br(); __v =3D
> > readb_cpu(c); __io_ar(__v); __v; })
> > +#define readw(c)	({ uint16_t __v; __io_br(); __v =3D
> > readw_cpu(c); __io_ar(__v); __v; })
> > +#define readl(c)	({ uint32_t __v; __io_br(); __v =3D
> > readl_cpu(c); __io_ar(__v); __v; })
>=20
> Here the local variables are surely needed. Still they would
> preferably
> not have any underscores as prefixes.
Thanks. This header was left untouched as it was mostly just copy of
Linux's mmio.h, but I'll update it according to Xen code style. Thanks.

>=20
> > +#define writeb(v,c)	({ __io_bw(); writeb_cpu(v,c); __io_aw();
> > })
> > +#define writew(v,c)	({ __io_bw(); writew_cpu(v,c); __io_aw();
> > })
> > +#define writel(v,c)	({ __io_bw(); writel_cpu(v,c); __io_aw();
> > })
> > +
> > +#ifdef CONFIG_64BIT
> > +#define readq(c)	({ u64 __v; __io_br(); __v =3D readq_cpu(c);
> > __io_ar(__v); __v; })
>=20
> uint64_t again
Thanks. I'll update that too.

>=20
> > +#define writeq(v,c)	({ __io_bw(); writeq_cpu((v),(c));
> > __io_aw(); })
>=20
> Inner parentheses still left?
Overlooked. Thanks, I'll update that in the next patch version.

~ Oleksii


