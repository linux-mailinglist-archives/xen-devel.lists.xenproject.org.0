Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5C38761AF
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 11:15:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690186.1075977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riXF8-0002JS-13; Fri, 08 Mar 2024 10:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690186.1075977; Fri, 08 Mar 2024 10:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riXF7-0002HL-Uf; Fri, 08 Mar 2024 10:14:21 +0000
Received: by outflank-mailman (input) for mailman id 690186;
 Fri, 08 Mar 2024 10:14:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=41Qb=KO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1riXF6-0002HF-DM
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 10:14:20 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fb8ebf4-dd34-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 11:14:18 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56647babfe6so913861a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 02:14:18 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f27-20020a170906085b00b00a44ef54b6b6sm6715591ejd.58.2024.03.08.02.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 02:14:17 -0800 (PST)
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
X-Inumbo-ID: 9fb8ebf4-dd34-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709892858; x=1710497658; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hRQ6Jn+GB5bFeLy1drOwXVbCMQkuPuur8nXU6OgB4M8=;
        b=YPrTcYzGySGPLfubMGMvIoHJU3ezQMsCytfKa5U4jxyMSg7tno7tlsEYQejxEZnxYE
         ZpokT3MtN/U78ETivqAtIcan+l9roGQFdbFamNIKohGy5pGGY1k7IQu0Ct/ET3L1vgsb
         KsPQ4IuM5eInIEzYGhIFDBK8aGtqZOvB9KhiT0pGkF2zY/SgiAl4XjyMEgGXMI953YQE
         +Zp/p20gARWqf4frKhP0aUh/ZPtG7ybc6Ntai6VNZ/byIQbl8QK4rNylBd7eUws2E/m7
         As2qgYRNOo4rHEevI+DehbmnYpEe96QDuJ5D8DmVDfUjUFJWXaXJPg0ejhDjuK+fgIiW
         87Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709892858; x=1710497658;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRQ6Jn+GB5bFeLy1drOwXVbCMQkuPuur8nXU6OgB4M8=;
        b=av0WPuh6EWz052FO4gHwUnzMUagJkxuPYk+G3XAWFqQgL8bKG4r962DAotF1NiK40z
         TTWLwTMHzFoChqCa0m9c7JChm+j4JJZDsACJc5oKO+i1FkqTfNkG87afpFsZDKKBbxiL
         VUgVfKdlKCeduNzkBFSG7mTGWKzd454e2oMluy7DmCWpq+htxMw52D2TQf7blg9xtecG
         aIbDTqfasw38RitBZrS9wCF3d3pCfBpyYawt6iO/dQF1HAucCSQ/GKYQLmgoZN5PPMvi
         OENk43N3S0sjcT4snisdAx2leZyFptximIjnRXCdp6sqoqy3Ay0IwWp0ApI7tA55RhOv
         XNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3lRJuFb1CYzoUv06RNIpbHPErTN+1eHNyaGJlkF361g1D9gKKiI1bMmHdokb8qhSbRmhIw/UkYzfQGSSVFCvPOEUzBGSc/i325AGbQPY=
X-Gm-Message-State: AOJu0Ywa311/L0AyxVNPiCdjUWl0kZk3ho1a5n07ATeaGbKyJS7vT1i/
	eyHqJpBeiISO2IAOke+OYBSpVypL1+urWx1tm/q/yMnmWtRBOAJG
X-Google-Smtp-Source: AGHT+IEZPM49OF6HYMrpuvD4RCAYg5eXoujFXBZeT826+b0JWAoRM+elpa/zZ+SSG6Y3hSUiETLnFA==
X-Received: by 2002:a17:906:4712:b0:a45:84e7:b265 with SMTP id y18-20020a170906471200b00a4584e7b265mr8632868ejq.7.1709892857406;
        Fri, 08 Mar 2024 02:14:17 -0800 (PST)
Message-ID: <4b6c9458efc85a57c14c6b6147d47245fece1f88.camel@gmail.com>
Subject: Re: [PATCH v5 12/23] xen/riscv: introduce io.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 08 Mar 2024 11:14:15 +0100
In-Reply-To: <82375df2-f7fd-43a1-9183-f4823fe791ec@suse.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <dd7c95b5197dfd0cca0edf9c0ada631336eb60d7.1708962629.git.oleksii.kurochko@gmail.com>
	 <807c31d5-0c5a-4646-ba90-2f284289069f@suse.com>
	 <d047c0956f804f7191f91b1d690650e220ec0fe4.camel@gmail.com>
	 <a164230f-2054-47e9-b72c-51f4a5955fe0@suse.com>
	 <2a3e49bf94332c17b50e4f0f745e4b28b16dceb1.camel@gmail.com>
	 <2a05c233-b3c5-417c-bd6b-8b1c21f03c3d@suse.com>
	 <e51500581bb71ef9cc2879050e2577802a5dd14c.camel@gmail.com>
	 <bbd4ea96-565a-4843-a4fe-fbbc714ddbf6@suse.com>
	 <9ec718f3bba178d437035add3c7467011fc3ffc0.camel@gmail.com>
	 <d3eabf773211defb2f8a9a22545fca5c7cf3eca1.camel@gmail.com>
	 <82375df2-f7fd-43a1-9183-f4823fe791ec@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Fri, 2024-03-08 at 08:26 +0100, Jan Beulich wrote:
> On 07.03.2024 21:54, Oleksii wrote:
> > On Thu, 2024-03-07 at 21:49 +0100, Oleksii wrote:
> > > On Thu, 2024-03-07 at 18:14 +0100, Jan Beulich wrote:
> > > > For plain writes it should at least be "=3DQo" then, yes.
> > > Constraints Q is a machine specific constraint, and I am not sure
> > > that
> > > it makes sense to use "=3Do" only and probably it is a reason why
> > > it is
> > > enough only "r". Does it make sense?
> > Probably for RISC-V can be used:
> > RISC-V=E2=80=94config/riscv/constraints.md
> > =C2=A0=C2=A0 ...
> > =C2=A0=C2=A0 A
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 An address that is held in a gener=
al-purpose register.
> > =C2=A0=C2=A0 ...
>=20
> Just from the description I would have said no, but looking at what
> "A"
> actually expands to it is indeed RISC-V's counterpart of Arm's "Q".
> So
> yes, this looks like what amo* want to use, and then as a real
> operand,
> not just a fake one.
I am not sure that I know how to check correctly how "A" expands, but I
tried to look at code which will be generated with and without
constraints and it is the same:
   // static inline void __raw_writel(uint32_t val, volatile void
   __iomem *addr)
   // {
   //     asm volatile ( "sw %0, 0(%1)" : : "r" (val), "r"(addr) );
   // }
  =20
   static inline void __raw_writel(uint32_t val, volatile void __iomem
   *addr)
   {
       asm volatile ( "sw %0, %1" : : "r" (val), "Ao" (*(volatile
   uint32_t __force *)addr) );
   }
  =20
   ffffffffc003d774:       aabbd7b7                lui     a5,0xaabbd
   ffffffffc003d778:       cdd78793                add     a5,a5,-803 #
   ffffffffaabbccdd <start-0x15443323>
   ffffffffc003d77c:       f8f42423                sw      a5,-120(s0)
   ffffffffc003d780:       0140000f                fence   w,o
  =20

>=20
> > AArch64 family=E2=80=94config/aarch64/constraints.md:
> > =C2=A0=C2=A0 ...
> > =C2=A0=C2=A0 Q
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 A memory address which uses a sing=
le base register with no
> > =C2=A0=C2=A0 offset
> > =C2=A0=C2=A0 ...
> > Also 'no offset' explains why it was added 'o' constraint for Arm
> > additionally.
>=20
> I don't think it does.
>=20
> Jan


