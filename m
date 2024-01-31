Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408EA84462F
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 18:31:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674126.1048862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVEPy-0000us-7y; Wed, 31 Jan 2024 17:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674126.1048862; Wed, 31 Jan 2024 17:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVEPy-0000tJ-4M; Wed, 31 Jan 2024 17:30:34 +0000
Received: by outflank-mailman (input) for mailman id 674126;
 Wed, 31 Jan 2024 17:30:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oHYx=JJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rVEPv-0000tC-Uq
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 17:30:32 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6defef74-c05e-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 18:30:30 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cf1288097aso1100951fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 09:30:30 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y29-20020a2ebb9d000000b002d0524ec71asm1017649lje.43.2024.01.31.09.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 09:30:28 -0800 (PST)
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
X-Inumbo-ID: 6defef74-c05e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706722229; x=1707327029; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5NRpAYNkcmI6zfM+1+lknVIORzgtVzHVuv2kmSJBoUA=;
        b=LEWZVGkBPW2/O6x1hBKmffigFKALZLo74eJaq8xZMsXQCRE/CGsJVDuaBxQ0ZX9vH+
         F2rXCqeBEIfMvL6avcX5ZuSYetfraU2uWiJ0rVCp0V+5VJ1IxvjbQuH9HaSPCNjLkhCQ
         IU5L+bH6NbrBoVSO5XU5ulwZ2LR+aIL/5yhDRFdimTaeuM6Gdi2u81DRYDh+SjVo18YW
         rzw17ZrNvLyXM86Ogs2H2JY/hy8KtoSHn6q5PhWs+X+J5x+twBrwwKA+bY7DmPWlD7Ah
         lhIOiJpbylC8M4RNIPqxOSlB1wn1bu647uunkxX/LcXMNZrh7ZZbzOwvILD49XYH4SXo
         mF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706722229; x=1707327029;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5NRpAYNkcmI6zfM+1+lknVIORzgtVzHVuv2kmSJBoUA=;
        b=vD0Y+2nBYNdwfqbMp+lyhwRmwDYDF3y0KJFhOAOfKeyGhiWS9F/kyezydfUqEBvIz7
         wWaPNl6JLZv8XrgJWvai2A44SrAW5l8tSDpxAzjX+RsJxohIHMvEUbMAfm389GPKZFD7
         myp/8nOzwOM49TdIMdZua3EF9iG/hsTHD/xrKX9ycDFnRagXvxvhUa3LH1jsVNUUM9by
         3IIy68FU+/2KrGw6nusrQA3GIDrsUKJrUOAdedDUOUe2laoaz2WmDHaZicWBeL7pa/uH
         IPRJnAp/fHUwSqj5EbpcTkL74/moocw4ADRjv9Qu5QAHlDebP7piTpcmtKdy6gFJT+8Q
         Y10w==
X-Gm-Message-State: AOJu0Yy632IwCglgSzKUx4kOziJ0Y7COCA2P5CJtebEJojmv/GyjkTbY
	n4Qo1bRMgtO5bFIGNpkyQNZDXb0Sn28qEeNAeMbLucCbY6gDVzqq
X-Google-Smtp-Source: AGHT+IH49fMXlowlRm7E/E9NCh/WCMaYDQNKBIYcMb7tL6xL+I0bv7IClIUzEeGzBCsf1KjYUCyjnw==
X-Received: by 2002:a2e:934c:0:b0:2cf:12af:dc09 with SMTP id m12-20020a2e934c000000b002cf12afdc09mr1720751ljh.43.1706722229076;
        Wed, 31 Jan 2024 09:30:29 -0800 (PST)
Message-ID: <2b64af14620135893720bcdb036b9e2656101407.camel@gmail.com>
Subject: Re: [PATCH v3 14/34] xen/riscv: introduce io.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 31 Jan 2024 19:30:27 +0200
In-Reply-To: <39c97d1e-05f5-46b1-a242-7fc8d5639af5@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <5d2c032481792a3fe5bd5f1cae42d95f6e9b54b1.1703255175.git.oleksii.kurochko@gmail.com>
	 <895a60ba-547c-4064-9e4b-4ebf07dea5fb@suse.com>
	 <c9977188e834f15e84d785e6cc1dc51d49da63d2.camel@gmail.com>
	 <39c97d1e-05f5-46b1-a242-7fc8d5639af5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-16 at 17:09 +0100, Jan Beulich wrote:
> On 16.01.2024 16:20, Oleksii wrote:
> > On Mon, 2024-01-15 at 17:57 +0100, Jan Beulich wrote:
> > > On 22.12.2023 16:12, Oleksii Kurochko wrote:
> > > > +/*
> > > > + * Unordered I/O memory access primitives.=C2=A0 These are even
> > > > more
> > > > relaxed than
> > > > + * the relaxed versions, as they don't even order accesses
> > > > between
> > > > successive
> > > > + * operations to the I/O regions.
> > > > + */
> > > > +#define readb_cpu(c)		({ u8=C2=A0 __r =3D __raw_readb(c);
> > > > __r;
> > > > })
> > > > +#define readw_cpu(c)		({ u16 __r =3D
> > > > le16_to_cpu((__force
> > > > __le16)__raw_readw(c)); __r; })
> > > > +#define readl_cpu(c)		({ u32 __r =3D
> > > > le32_to_cpu((__force
> > > > __le32)__raw_readl(c)); __r; })
> > > > +
> > > > +#define
> > > > writeb_cpu(v,c)		((void)__raw_writeb((v),(c)))
> > > > +#define
> > > > writew_cpu(v,c)		((void)__raw_writew((__force
> > > > u16)cpu_to_le16(v),(c)))
> > > > +#define
> > > > writel_cpu(v,c)		((void)__raw_writel((__force
> > > > u32)cpu_to_le32(v),(c)))
> > > > +
> > > > +#ifdef CONFIG_64BIT
> > > > +#define readq_cpu(c)		({ u64 __r =3D
> > > > le64_to_cpu((__force
> > > > __le64)__raw_readq(c)); __r; })
> > > > +#define
> > > > writeq_cpu(v,c)		((void)__raw_writeq((__force
> > > > u64)cpu_to_le64(v),(c)))
> > > > +#endif
> > >=20
> > > How come there are endianness assumptions here on the MMIO
> > > accessed?
> > It is a hard story.
> >=20
> > As you might expect it was copy from Linux Kernel where it was
> > decided
> > to follow only LE way:
> > https://patchwork.kernel.org/project/linux-riscv/patch/20190411115623.5=
749-3-hch@lst.de/
> > One of the answers of the author of the commit:
> > =C2=A0=C2=A0=C2=A0 And we don't know if Linux will be around if that ev=
er changes.
> > =C2=A0=C2=A0=C2=A0 The point is:
> > =C2=A0=C2=A0=C2=A0=C2=A0 a) the current RISC-V spec is LE only
> > =C2=A0=C2=A0=C2=A0=C2=A0 b) the current linux port is LE only except fo=
r this little
> > bit
> > =C2=A0=C2=A0=C2=A0 There is no point in leaving just this bitrotting co=
de around.=C2=A0
> > It
> > =C2=A0=C2=A0=C2=A0 just confuses developers, (very very slightly) slows=
 down
> > compiles
> > =C2=A0=C2=A0=C2=A0 and will bitrot.=C2=A0 It also won't be any signific=
ant help to a
> > future
> > =C2=A0=C2=A0=C2=A0 developer down the road doing a hypothetical BE RISC=
-V Linux
> > port.
>=20
> Reads to me like a justification to _omit_ the cpu_to_le<N>().
Looks like we can omit cpu_to_le<N>(). Even docs say that memory system
is little-endian except:
   However, certain application areas, such as IP networking, operate
   on big-endian data structures, and certain legacy code bases have
   been built assuming big-endian
   processors, so we expect that future specifications will describe
   big-endian or bi-endian variants
   of RISC-V.
  =20
~ Oleksii

