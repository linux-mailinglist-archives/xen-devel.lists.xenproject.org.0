Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D1282F14E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 16:21:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667836.1039498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPlEo-0004x2-VN; Tue, 16 Jan 2024 15:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667836.1039498; Tue, 16 Jan 2024 15:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPlEo-0004uO-Rq; Tue, 16 Jan 2024 15:20:26 +0000
Received: by outflank-mailman (input) for mailman id 667836;
 Tue, 16 Jan 2024 15:20:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvQ1=I2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rPlEm-0004u2-On
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 15:20:24 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3bb9188-b482-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 16:20:22 +0100 (CET)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6db786df38dso2001337b3a.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 07:20:22 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t127-20020a628185000000b006d9e76be7cesm9828802pfd.73.2024.01.16.07.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 07:20:20 -0800 (PST)
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
X-Inumbo-ID: c3bb9188-b482-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705418421; x=1706023221; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jZpKFwwpBrhvycx+ha8v2vVH1CyrajMWlfvF4EL0DT8=;
        b=PG9jW7MnYHbOMMSlLoomUd7gMNyIHYKmAwsIEXEpT4LsLCDT0bLwrj4gFcfKC/mOql
         wuDrs9NixLASdVLu9awV0PcYBw/+XNH1ym6uJj6G8yLhNIq5hxgDzeYd+dXQGXEMj+0d
         XacHvM4LUNpW4+FHBoPtx874egqpR69e6kODtzstXLSwBpqgZnQRRu2f8GbnCDGBPuaN
         PMBEoxBcrtSqKsNlpwFx6vf1QXj8CPXe4v5ADkw1fa19I/1OtVpe+J8E6GvH/CQ9KFQW
         8iDIbiXjvz9u0kfIweBS72oZthJeqQiE6kfxeKXbAoV8D87KqyAWYlAqiWWrwaLjWtAL
         9KZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705418421; x=1706023221;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jZpKFwwpBrhvycx+ha8v2vVH1CyrajMWlfvF4EL0DT8=;
        b=usJEkyhUQLkPox5BubR4t0ONyBMtg9TAKQE3x1y8a7A15W8f9bLSCxw5M5KdBDGe52
         LdokOXisMR33IpVmX/y9eTvAZfRh8nqBl7qQJ/dA1BK1JKcyLfmiptRb/MHrcaN4R0gl
         6jhw4wCMWIiZQZo+E6NT04xLcOuG9isQB5NGI8IRvDeub93llk8Pl0m5sp+eYiVWbr6b
         jbh4MbbpC/JshfGszYe9secSfBOqKYjX9KDSNsdpcC4AgZxj6yAVaubgZPQln8P4GItL
         8tkwQdN1ogkqmwplNO79gk0jU/60cri34wwKB7KUVBIbmTQO9VG2x4EKktvrj7RVogEr
         f6Ow==
X-Gm-Message-State: AOJu0YxwF876kr8EUvvQIgkjUwYOiWl81Z3L9qFNdnilxDcevQLvL5Cw
	E90me/E6igU8rxvJqM0VaV0=
X-Google-Smtp-Source: AGHT+IHdL/t/cGp/GWE6xqhUKgw3ODn9ebk/Azji7lstakhgPyX1SxTdyra7iK292Nbv4lFNUeLUNQ==
X-Received: by 2002:a05:6a20:2d99:b0:19a:3451:14dd with SMTP id bf25-20020a056a202d9900b0019a345114ddmr6320030pzb.60.1705418421027;
        Tue, 16 Jan 2024 07:20:21 -0800 (PST)
Message-ID: <c9977188e834f15e84d785e6cc1dc51d49da63d2.camel@gmail.com>
Subject: Re: [PATCH v3 14/34] xen/riscv: introduce io.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 16 Jan 2024 17:20:13 +0200
In-Reply-To: <895a60ba-547c-4064-9e4b-4ebf07dea5fb@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <5d2c032481792a3fe5bd5f1cae42d95f6e9b54b1.1703255175.git.oleksii.kurochko@gmail.com>
	 <895a60ba-547c-4064-9e4b-4ebf07dea5fb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-01-15 at 17:57 +0100, Jan Beulich wrote:
> On 22.12.2023 16:12, Oleksii Kurochko wrote:
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
> > +#define ioremap_nocache(addr, size) ioremap((addr), (size))
> > +#define ioremap_wc(addr, size) ioremap((addr), (size))
> > +#define ioremap_wt(addr, size) ioremap((addr), (size))
>=20
> Nit: No need for the inner parentheses.
Thanks. I'll update that place.

>=20
> > +/* Generic IO read/write.=C2=A0 These perform native-endian accesses.
> > */
> > +#define __raw_writeb __raw_writeb
> > +static inline void __raw_writeb(u8 val, volatile void __iomem
> > *addr)
> > +{
> > +	asm volatile("sb %0, 0(%1)" : : "r" (val), "r" (addr));
> > +}
> > +
> > +#define __raw_writew __raw_writew
> > +static inline void __raw_writew(u16 val, volatile void __iomem
> > *addr)
> > +{
> > +	asm volatile("sh %0, 0(%1)" : : "r" (val), "r" (addr));
> > +}
> > +
> > +#define __raw_writel __raw_writel
> > +static inline void __raw_writel(u32 val, volatile void __iomem
> > *addr)
> > +{
> > +	asm volatile("sw %0, 0(%1)" : : "r" (val), "r" (addr));
> > +}
> > +
> > +#ifdef CONFIG_64BIT
> > +#define __raw_writeq __raw_writeq
> > +static inline void __raw_writeq(u64 val, volatile void __iomem
> > *addr)
> > +{
> > +	asm volatile("sd %0, 0(%1)" : : "r" (val), "r" (addr));
> > +}
> > +#endif
> > +
> > +#define __raw_readb __raw_readb
> > +static inline u8 __raw_readb(const volatile void __iomem *addr)
> > +{
> > +	u8 val;
> > +
> > +	asm volatile("lb %0, 0(%1)" : "=3Dr" (val) : "r" (addr));
> > +	return val;
> > +}
> > +
> > +#define __raw_readw __raw_readw
> > +static inline u16 __raw_readw(const volatile void __iomem *addr)
> > +{
> > +	u16 val;
> > +
> > +	asm volatile("lh %0, 0(%1)" : "=3Dr" (val) : "r" (addr));
> > +	return val;
> > +}
> > +
> > +#define __raw_readl __raw_readl
> > +static inline u32 __raw_readl(const volatile void __iomem *addr)
> > +{
> > +	u32 val;
> > +
> > +	asm volatile("lw %0, 0(%1)" : "=3Dr" (val) : "r" (addr));
> > +	return val;
> > +}
> > +
> > +#ifdef CONFIG_64BIT
> > +#define __raw_readq __raw_readq
> > +static inline u64 __raw_readq(const volatile void __iomem *addr)
> > +{
> > +	u64 val;
> > +
> > +	asm volatile("ld %0, 0(%1)" : "=3Dr" (val) : "r" (addr));
> > +	return val;
> > +}
> > +#endif
> > +
> > +/*
> > + * Unordered I/O memory access primitives.=C2=A0 These are even more
> > relaxed than
> > + * the relaxed versions, as they don't even order accesses between
> > successive
> > + * operations to the I/O regions.
> > + */
> > +#define readb_cpu(c)		({ u8=C2=A0 __r =3D __raw_readb(c); __r;
> > })
> > +#define readw_cpu(c)		({ u16 __r =3D le16_to_cpu((__force
> > __le16)__raw_readw(c)); __r; })
> > +#define readl_cpu(c)		({ u32 __r =3D le32_to_cpu((__force
> > __le32)__raw_readl(c)); __r; })
> > +
> > +#define
> > writeb_cpu(v,c)		((void)__raw_writeb((v),(c)))
> > +#define
> > writew_cpu(v,c)		((void)__raw_writew((__force u16)cpu_to_le16(v),(c)))
> > +#define
> > writel_cpu(v,c)		((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
> > +
> > +#ifdef CONFIG_64BIT
> > +#define readq_cpu(c)		({ u64 __r =3D le64_to_cpu((__force
> > __le64)__raw_readq(c)); __r; })
> > +#define
> > writeq_cpu(v,c)		((void)__raw_writeq((__force u64)cpu_to_le64(v),(c)))
> > +#endif
>=20
> How come there are endianness assumptions here on the MMIO accessed?
It is a hard story.

As you might expect it was copy from Linux Kernel where it was decided
to follow only LE way:
https://patchwork.kernel.org/project/linux-riscv/patch/20190411115623.5749-=
3-hch@lst.de/
One of the answers of the author of the commit:
    And we don't know if Linux will be around if that ever changes.
    The point is:
     a) the current RISC-V spec is LE only
     b) the current linux port is LE only except for this little bit
    There is no point in leaving just this bitrotting code around.  It
    just confuses developers, (very very slightly) slows down compiles
    and will bitrot.  It also won't be any significant help to a future
    developer down the road doing a hypothetical BE RISC-V Linux port.

From the specs [1, p.5 ] it is mentioned that:
   The base ISA has been defined to have a little-endian memory system,=20
   with big-endian or bi-endian as non-standard variants.

And in [3, p.6]:
   RISC-V base ISAs have either little-endian or big-endian memory=20
   systems, with the privileged architecture further defining bi-endian=20
   operation. Instructions are stored in memory as a sequence of 16-bit=20
   little-endian parcels, regardless of memory system endianness. Parcels
   forming one instruction are stored at increasing halfword addresses,=20
   with the lowest-addressed parcel holding the lowest-numbered bits in=20
   the instruction specification.
  =20
    We originally chose little-endian byte ordering for the RISC-V memory
   system because little-endian systems are currently dominant=20
   commercially (all x86 systems; iOS, Android, and Windows for ARM). A=20
   minor point is that we have also found little-endian memory systems to
   be more natural for hardware designers. However, certain application=20
   areas, such as IP networking, operate on big-endian data structures,=20
   and certain legacy code bases have been built assuming big-endian=20
   processors, so we have defined big-endian and bi-endian variants of=20
   RISC-V.
  =20
    We have to fix the order in which instruction parcels are stored in=20
   memory, independent of memory system endianness, to ensure that the=20
   length-encoding bits always appear first in halfword address order.=20
   This allows the length of a variable-length instruction to be quickly=
=20
   determined by an instruction-fetch unit by examining only the first few
   bits of the first 16-bit instruction parcel.

[ this part is from source [2] which I can't find in [3] for some
uknown reason ]
   We further make the instruction parcels themselves little-endian to
   decouple the instruction encoding from the memory system endianness
   altogether. This design benefits both software tooling and bi-endian
   hardware. Otherwise, for instance, a RISC-V assembler or disassembler
   would always need to know the intended active endianness, despite that
   in bi-endian systems, the endianness mode might change dynamically
   during execution. In contrast, by giving instructions a fixed
   endianness, it is sometimes possible for carefully written software to
   be endianness-agnostic even in binary form, much like position-
   independent code.
  =20
   The choice to have instructions be only little-endian does have
   consequences, however, for RISC-V software that encodes or decodes
   machine instructions. Big-endian JIT compilers, for example, must swap
   the byte order when storing to instruction memory.
  =20
   Once we had decided to fix on a little-endian instruction encoding,
   this naturally led to placing the length-encoding bits in the LSB
   positions of the instruction format to avoid breaking up opcode fields.


[1] https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf
[2] https://five-embeddev.com/riscv-isa-manual/latest/intro.html
[3] https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf
>=20
> As a file-wide remark: While I don't mind you using u<N> here for
> now,
> presumably to stay close to Linux, eventually - as we make progress
> with
> the conversion to uint<N>_t - this will need to diverge anyway.
Then I'll use uint<N>_t everywhere from the start. I am pretty sure
this file doesn't require sync often, so we can use  Xen style instead
of Linux.

>=20
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
> Nit: Why are this and ...
>=20
> > +#define __io_ar(v)	__asm__ __volatile__ ("fence i,r" : : :
> > "memory");
> > +#define __io_bw()	__asm__ __volatile__ ("fence w,o" : : :
> > "memory");
> > +#define __io_aw()	do { } while (0)
>=20
> ... this not expanding exactly the same?
I don't know the specific reason, it was done so in Linux kernel in
case when CONFIG_MMIOWB isn't supported:
https://elixir.bootlin.com/linux/latest/source/include/asm-generic/mmiowb.h=
#L61

https://elixir.bootlin.com/linux/latest/source/arch/riscv/include/asm/mmio.=
h#L136



~ Oleksii

