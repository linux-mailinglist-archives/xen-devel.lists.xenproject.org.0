Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9916EAD46
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 16:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524618.815695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pprxF-00064X-8F; Fri, 21 Apr 2023 14:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524618.815695; Fri, 21 Apr 2023 14:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pprxF-00061r-5X; Fri, 21 Apr 2023 14:41:41 +0000
Received: by outflank-mailman (input) for mailman id 524618;
 Fri, 21 Apr 2023 14:41:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ncdX=AM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pprxD-00061l-AV
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 14:41:39 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e4732f0-e052-11ed-8611-37d641c3527e;
 Fri, 21 Apr 2023 16:41:36 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4ec81245ae1so1834962e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Apr 2023 07:41:36 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a056512388f00b004e96afb1e9asm581468lft.253.2023.04.21.07.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 07:41:35 -0700 (PDT)
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
X-Inumbo-ID: 9e4732f0-e052-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682088096; x=1684680096;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l7tgeVV3z4+i/UtlPpONUumuR4T7mPWZlDRk58b0LDc=;
        b=Nnnfq2pMVdvxd1j+b0qvRSguU7+xBWFdp8N4euwKrpzvJe0jwBD+3HDsYAGtZnhYo5
         W/6aHAEIhweoGqDqrkKAs2PK+pLIyH4S2KP3ygwmhLUtGbdmmBV+zbzJTlg5YqTl6zwa
         nT/8LITTqhYeLOoafhHMhS9EamnRl/q0QncmurojpKXZ6C5TalhD9dlJ/B++/zW/1LbL
         1On4Kolv74V4zxtlEVyFoXtdncmYySldbwMToK8l2AtZSl3/raaO/34loiBexfG6eUCW
         kXS0UEaJaFcf/T0MbuvEscWp6wO8PRqGzALOJCW0ftPQ37hyb6KGe5nsMn8hryhNRlW2
         PDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682088096; x=1684680096;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l7tgeVV3z4+i/UtlPpONUumuR4T7mPWZlDRk58b0LDc=;
        b=BDEBONJ4+XSm0jlJkdv4wl2riVvVu5CQDtr6CHUMhR5fBaJu7Rzl54kYf2LoIS9ZJd
         JF8G5PzQQDCN0tekct1x/Sm2fG5R/ceikTviDryhtRmmG0MztraU9Zjp78AN1+unydmk
         aLo4pcsvFSneplqhZxc0dIlU4DVTaajHeMDGvyNr9ubwSTxdX+1K13b5WvgnIUPqpfDs
         GA6OOTPaS9TmcfLAViz+dP2d0dS4Sa/xcOYugM5ao0Ajax+ET9LFcUlxzXromY6A1FVg
         CQSRxCvTmpuN1RrYICy+m7Wkzj4TMuYxZJChIXw+5Pvh3g4L88iE6o0iOEa0JMkHF0qo
         hNwA==
X-Gm-Message-State: AAQBX9e/Q4T9+7544jUmWUDlr9KAdPShS9jegJbxcNpWlV1j5+Wy8rPd
	D2cVLruN9wUtYvn7BE61mfw=
X-Google-Smtp-Source: AKy350YYQACaKoeJDxaUGgcpjh7ZXM/HQ1pXd0ox6xojf/cf+5lYxm88N+Z0Meuqe+uijCUHYSl5xg==
X-Received: by 2002:ac2:4c0c:0:b0:4a4:6af4:43b7 with SMTP id t12-20020ac24c0c000000b004a46af443b7mr1219644lfq.69.1682088095974;
        Fri, 21 Apr 2023 07:41:35 -0700 (PDT)
Message-ID: <f2978c2ddc1872025f4d939187775c21fd90f074.camel@gmail.com>
Subject: Re: [PATCH v5 1/4] xen/riscv: add VM space layout
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Fri, 21 Apr 2023 17:41:13 +0300
In-Reply-To: <34f032df-cbfc-7a97-9a1f-2fa1ce574281@suse.com>
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
	 <f1b5ee8652a20b2043965a4de5c2c64f662724bb.1681918194.git.oleksii.kurochko@gmail.com>
	 <34f032df-cbfc-7a97-9a1f-2fa1ce574281@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0 (3.48.0-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-04-20 at 14:58 +0200, Jan Beulich wrote:
> On 19.04.2023 17:42, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -4,6 +4,37 @@
> > =C2=A0#include <xen/const.h>
> > =C2=A0#include <xen/page-size.h>
> > =C2=A0
> > +/*
> > + * RISC-V64 Layout:
> > + *
> > + * From the riscv-privileged doc:
> > + *=C2=A0=C2=A0 When mapping between narrower and wider addresses,
> > + *=C2=A0=C2=A0 RISC-V zero-extends a narrower physical address to a wi=
der
> > size.
> > + *=C2=A0=C2=A0 The mapping between 64-bit virtual addresses and the 39=
-bit
> > usable
> > + *=C2=A0=C2=A0 address space of Sv39 is not based on zero-extension bu=
t
> > instead
> > + *=C2=A0=C2=A0 follows an entrenched convention that allows an OS to u=
se one
> > or
> > + *=C2=A0=C2=A0 a few of the most-significant bits of a full-size (64-b=
it)
> > virtual
> > + *=C2=A0=C2=A0 address to quickly distinguish user and supervisor addr=
ess
> > regions.
> > + *
> > + * It means that:
> > + *=C2=A0=C2=A0 top VA bits are simply ignored for the purpose of trans=
lating
> > to PA.
> > + *
> > + * The similar is true for other Sv{32, 39, 48, 57}.
>=20
> Personally I find it odd that Sv32 is mentioned here (there's no
> truncation /
> aliasing there aiui), and that Sv39 is mentioned here again (when
> that's what
> the earlier paragraph talks about).
It looks that I wrote bad explanation.

I meant that all the mentioned above ( that usable address space isn't
based on zero-extension ) works for Sv{39, 48, 57} except size of
usable address space ( 39-bit, 48-bit and 57-bit usable address space
of 64-bit virtual address space ).

And I agree that this is not for Sv32 as it covers full 32-bit virtual
address space

>=20
> > + *
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > + *=C2=A0=C2=A0=C2=A0 Start addr=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 End ad=
dr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 Size=C2=A0 | VM area
> > description
> > + *
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > + * FFFFFFFFC0000000 |=C2=A0 FFFFFFFFC0200000 |=C2=A0 2 MB=C2=A0 | Xen
> > + * FFFFFFFFC0200000 |=C2=A0 FFFFFFFFC0600000 |=C2=A0 4 MB=C2=A0 | FDT
> > + * FFFFFFFFC0600000 |=C2=A0 FFFFFFFFC0800000 |=C2=A0 2 MB=C2=A0 | Fixm=
ap
>=20
> These are all L2 slot 511 aiui, which may be worth mentioning
> especially since
> the top bits don't match the top bits further down in the table
> (because of the
> aliasing).

Than I'll add one more column where I'll put slot number

>=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 .................. unused .................=
.
>=20
> This is covering slot 510, which again may be worth mentioning.
>=20
> > + * 0000003200000000 |=C2=A0 0000007f40000000 | 331 GB | Direct map(L2
> > slot: 200-509)
> > + * 0000003100000000 |=C2=A0 0000003140000000 |=C2=A0 1 GB=C2=A0 | Fram=
etable(L2
> > slot: 196-197)
>=20
> 1Gb is, if I'm not mistaken, a single L2 slot.
Yeah, it can be misunderstood. I meant [196, 197), so 197 isn't
included. I'll update the table.

>=20
> Also assuming a 32-byte struct page_info (I don't think you'll get
> away with
> less than that, when even Arm32 requires this much), there's a
> mismatch
> between direct map and frame table size: With 4k pages, the scaling
> factor
> would be 128 if I'm not mistaken. So perhaps you really mean 3Gb here
> to
> cover for (slightly more than) the 331Gb of memory you mean to be
> able to
> map?
For RV64 page_info size will be 56-byte and 32-byte for RV32 but you
are right it should 3 Gb in that case what will be enough ( taking into
account both available sizes of page_info structure ).
Thanks for the catch.
>=20
> > + * 0000003080000000 |=C2=A0 00000030c0000000 |=C2=A0 1 GB=C2=A0 | VMAP=
 (L2 slot:
> > 194-195)
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 .................. unused .................=
.
>=20
> There are further unused regions between these three entries, while
> imo will
> want making explicit (for the avoidance of doubt, if nothing else).
Yeah, there are some. I'll add them explicitly.


~ Oleksii

