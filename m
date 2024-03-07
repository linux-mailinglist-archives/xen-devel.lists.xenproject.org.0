Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE01E87541A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 17:22:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689960.1075517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riGVF-0000oe-Ej; Thu, 07 Mar 2024 16:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689960.1075517; Thu, 07 Mar 2024 16:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riGVF-0000mW-Ay; Thu, 07 Mar 2024 16:21:53 +0000
Received: by outflank-mailman (input) for mailman id 689960;
 Thu, 07 Mar 2024 16:21:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqh0=KN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1riGVE-0000mQ-8S
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 16:21:52 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd642e44-dc9e-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 17:21:50 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a3f893ad5f4so156207166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 08:21:50 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a1709061c8600b00a458680f004sm3731236ejh.125.2024.03.07.08.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 08:21:49 -0800 (PST)
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
X-Inumbo-ID: cd642e44-dc9e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709828510; x=1710433310; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5r0TFK5eLLZbZ1q8qH9KlUkTT3jPePM5yfZWEG26zaU=;
        b=Oczn22wiF24aMgUwiNTP3wxWhN0P9PvQyzSSXTYpPJc3uwTrJTm39zEqYJeacqGnBd
         hJDSzpRgdho4dDraSUiSSS+UVyqjOSuV2+xrvGGLo2FJkKdUVt/JxLaQ9BPm7TeQ7TSe
         oWVYTm8KvHbFa7D5j01Apkjj8PhCSnEhImiOqU5Nq6KpJpTwUhm280ZcjDfZ/yTZXIm4
         OgmucZFxv8rNJVgXi/6LQW7QIXOW+UJtCcY9zu3qy6UlpSakjk/SzKPlliUVTyiTWPNH
         aVK9x7/BWvqwsySUMh0hqPxbULWE4R5bm2Se/jI6PfLgdKuOgXrKDCog1VAGb9IJhofr
         VTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709828510; x=1710433310;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5r0TFK5eLLZbZ1q8qH9KlUkTT3jPePM5yfZWEG26zaU=;
        b=qIEfuRD4l4mO8ADY0Q1XdJNdeW2P/ShIMAYq/7/wUvJZQ0JDKhsR0nwRB6g1I8k2z6
         vc9lvdW4Ip3kMEiC48LQp8QfpsKvnqoC833xnJx2APv3pUjhM8EYRugLD0ZXRXuieb93
         gqDzrJ9j2abkPzPWn4uNh+igmkR8XJe5KphtNozkLsRsxPlo8ZjJo3d5pKOKgkEae/Fw
         LiWvva2h5Y0kwyvDQoXSSTE3FZfVVLEqm/HQwdjqFvjbTUJ/lBJy9X31W9P5Q+YohwbW
         IUHScPXlK6t5XzpU80n9wl+/n5iX1yXretKGwfCT6muoV1pxP2A3eKnnVN+hzkvbc+hC
         16uw==
X-Forwarded-Encrypted: i=1; AJvYcCW/wF7GbEt/MxaSGzgcmiJpIz2LPMPeN7h6cT68w5dfAIMobtKCFBWZWV+QlX8KWs5d7wp/B3VC33fzSMc0facS66+1B9CnVk0MyDgbWsw=
X-Gm-Message-State: AOJu0YxJrLjk2vXX0QD1Egj0kKRjwL9auO8Ze+D5zSSFi1ePVv6HDT5N
	Z7KnbfXIEHVphO0/rawG9LRWjfFjvBx4238QyZHvNc01HD7+O/Ln
X-Google-Smtp-Source: AGHT+IH8vH/0ALBHbwvHWf02rrrVPOOBo0EiUFxMPjebCYUSmInsrG/dJtlQXA6p98gXszuZimRiuQ==
X-Received: by 2002:a17:906:1185:b0:a3e:da6:85f8 with SMTP id n5-20020a170906118500b00a3e0da685f8mr11522258eja.30.1709828509566;
        Thu, 07 Mar 2024 08:21:49 -0800 (PST)
Message-ID: <e51500581bb71ef9cc2879050e2577802a5dd14c.camel@gmail.com>
Subject: Re: [PATCH v5 12/23] xen/riscv: introduce io.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 07 Mar 2024 17:21:48 +0100
In-Reply-To: <2a05c233-b3c5-417c-bd6b-8b1c21f03c3d@suse.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <dd7c95b5197dfd0cca0edf9c0ada631336eb60d7.1708962629.git.oleksii.kurochko@gmail.com>
	 <807c31d5-0c5a-4646-ba90-2f284289069f@suse.com>
	 <d047c0956f804f7191f91b1d690650e220ec0fe4.camel@gmail.com>
	 <a164230f-2054-47e9-b72c-51f4a5955fe0@suse.com>
	 <2a3e49bf94332c17b50e4f0f745e4b28b16dceb1.camel@gmail.com>
	 <2a05c233-b3c5-417c-bd6b-8b1c21f03c3d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-03-07 at 16:32 +0100, Jan Beulich wrote:
> On 07.03.2024 14:44, Oleksii wrote:
> > On Thu, 2024-03-07 at 14:24 +0100, Jan Beulich wrote:
> > > On 07.03.2024 14:01, Oleksii wrote:
> > > > On Wed, 2024-03-06 at 15:13 +0100, Jan Beulich wrote:
> > > > > > +/* Generic IO read/write.=C2=A0 These perform native-endian
> > > > > > accesses.
> > > > > > */
> > > > > > +static inline void __raw_writeb(uint8_t val, volatile void
> > > > > > __iomem
> > > > > > *addr)
> > > > > > +{
> > > > > > +=C2=A0=C2=A0=C2=A0 asm volatile ( "sb %0, 0(%1)" : : "r" (val)=
, "r"
> > > > > > (addr) );
> > > > > > +}
> > > > >=20
> > > > > I realize this is like Linux has it, but how is the compiler
> > > > > to
> > > > > know
> > > > > that
> > > > > *addr is being access here?=C2=A0
> > > > Assembler syntax told compiler that. 0(%1) - means that the
> > > > memory
> > > > location pointed to by the address in register %1.
> > >=20
> > > No, the compiler doesn't decompose the string to figure how
> > > operands
> > > are used. That's what the constraints are for. The only two
> > > things
> > > the
> > > compiler does with the string is replace % operators and count
> > > line
> > > separators.
> > It looks like I am missing something.
> >=20
> > addr -> a some register ( because of "r" contraint ).
> > val -> is also register ( because of "r" contraint ).
> >=20
> > So the compiler will update instert an instruction:
> > =C2=A0sb reg1, 0(reg2)
> >=20
> > what means *(uint_8 *)reg2 =3D (uint8_t)reg1.
> >=20
> > What am I missing?
>=20
> The fact that the compiler will not know that *(uint_8 *)reg2
> actually
> changes across this asm(). It may therefore continue to hold a cached
> value in a register, without knowing that its contents went stale.
Then it makes sense to me. Thanks. It explains why it is needed +Q, but
I don't understand why constraint 'o' isn't used for __raw_writew, but
was used for __raw_writeb:

   static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
   {
           asm volatile("strb %1, %0"
                        : "+Qo" (*(volatile u8 __force *)addr)
                        : "r" (val));
   }
  =20
   static inline void __raw_writew(u16 val, volatile void __iomem *addr)
   {
           asm volatile("strh %1, %0"
                        : "+Q" (*(volatile u16 __force *)addr)
                        : "r" (val));
   }=20
  =20
If I understand correctly 'o' that the address is offsettable, so why
addr can not be offsettable for everyone case?

And one more thing, in Xen constraint "+" is used, but in Linux it was
dropped:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/1426958753-2690=
3-1-git-send-email-peter@hurleysoftware.com/

To me it looks like constraints should be always "+Qo".

~ Oleksii



