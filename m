Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4781794AD70
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 17:55:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773603.1184044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbj08-00067t-Jw; Wed, 07 Aug 2024 15:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773603.1184044; Wed, 07 Aug 2024 15:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbj08-00065P-HI; Wed, 07 Aug 2024 15:55:00 +0000
Received: by outflank-mailman (input) for mailman id 773603;
 Wed, 07 Aug 2024 15:54:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YcC0=PG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sbj07-00065J-E6
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 15:54:59 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 657cd022-54d5-11ef-bc04-fd08da9f4363;
 Wed, 07 Aug 2024 17:54:58 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5a309d1a788so2187394a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 08:54:58 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83b82bf63sm7158115a12.75.2024.08.07.08.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 08:54:56 -0700 (PDT)
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
X-Inumbo-ID: 657cd022-54d5-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723046097; x=1723650897; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qRX8RVG4FEOsacXpgLDq2I3cLU9cm+hxNM7YEM968OE=;
        b=NA7cnjYssTfTsL60r2TbtuDke+YvQKngTg+21PNKeke2QZtx2Zs/n6SLSoR2hUkYnn
         k2jMD6ntjDl1mOMOhO8WjonF6EtuGnsruxOmJI5/vW1UqnE/AwDMJ1KC70bTZc44OR1/
         mdy8HX4cWYHaZByryHfkBRl6pE1T4CLMiHj5odwDTz06SZphqgfAb5Bd4tnkvQyelImB
         AL61XNn2Ar6FGXWuGpsecU6jVsvA5c7rShmCN2ku4LM4D6k9RA17jEru8GeMzprbxI/t
         gueq9SpaqEtUqCinYfdZnvP3a/sseYYCfnvswfvnCsuwWQ18q6eCRkfF3om1iLybjsF5
         xYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723046097; x=1723650897;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qRX8RVG4FEOsacXpgLDq2I3cLU9cm+hxNM7YEM968OE=;
        b=PjJU9T9nLO244ESM4dKNBIStwFoSakSsIg7AIz8aUZwagkPU028dOejEI1ReBcruyb
         5O7ZqDm2F64DJYvoEdhOteBedctp0fawAxmrloi20v+FkbnQQAEkiLcJA6tgJ2zGgTok
         lD/e1s7+PB5egeqAVq4BWgiV0lJa2ljU1+IPnHCiD2t08amE8Oirv4lMRToKiv8L82+j
         DZCiySeTD6T6WTR8ZkapQDvRvmCYQmB9jbP6r4qvoUAzw21VPJWoqzrOlVZwceCcgYlK
         eWn5i5mMfbbG1ej7Gufo3x5PsoVNNJTWPIOKj6cSSoGSlmuRrVnGb6B6P1rShNZBTCBO
         2yCg==
X-Forwarded-Encrypted: i=1; AJvYcCUFAnJ/YwECebVIa1D4BhfP1ykDiH+WW3sYh2yTUkLJMEKxqdBa61EBLoE7gPS1tsilEkyVnfPJfqsXKBURfpquWSTrlnzbYelIZCKXwXg=
X-Gm-Message-State: AOJu0YxX+WueUc9B8qz+6Of+5VpCHqogUqtna5LpezL8+b0YZKVWlxK8
	nyam9hyC/mOV/DiLpC2d+cK7eNgs3WFCwMDCluiUsL7nl7qi5VWs
X-Google-Smtp-Source: AGHT+IFjMrV0NJeyQxj1R2xI3QLqmUlC7KzJBSb8IhsDOX4MbKIh/D7av/2y4LjL7o2GIAvtGJUEaA==
X-Received: by 2002:a50:a6d4:0:b0:5b8:3cff:718b with SMTP id 4fb4d7f45d1cf-5b83cff72d6mr13073485a12.16.1723046097148;
        Wed, 07 Aug 2024 08:54:57 -0700 (PDT)
Message-ID: <541ad417f440744b2a4238f5a5c5d65deefe81f4.camel@gmail.com>
Subject: Re: [PATCH v13 1/2] xen/riscv: enable GENERIC_BUG_FRAME
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 07 Aug 2024 17:54:56 +0200
In-Reply-To: <714d14c9-cd5e-4456-84ac-379e736c31c1@suse.com>
References: <cover.1722960083.git.oleksii.kurochko@gmail.com>
	 <516ada36487fd57f7a784f9fb3fe328f5365bd85.1722960083.git.oleksii.kurochko@gmail.com>
	 <714d14c9-cd5e-4456-84ac-379e736c31c1@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-08-07 at 16:39 +0200, Jan Beulich wrote:
> On 06.08.2024 18:37, Oleksii Kurochko wrote:
> > Enable GENERIC_BUG_FRAME to support BUG(), WARN(), ASSERT,
> > and run_in_exception_handler().
> >=20
> > "UNIMP" is used for BUG_INSTR, which, when macros from <xen/bug.h>
> > are used, triggers an exception with the ILLEGAL_INSTRUCTION cause.
> > This instruction is encoded as a 2-byte instruction when
> > CONFIG_RISCV_ISA_C is enabled:
> > =C2=A0 ffffffffc0046ba0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0000=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unimp
> > and is encoded as a 4-byte instruction when CONFIG_RISCV_ISA_C
> > ins't enabled:
> > =C2=A0 ffffffffc005a460:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c0001073=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unimp
> >=20
> > Using 'ebreak' as BUG_INSTR does not guarantee proper handling of
> > macros
> > from <xen/bug.h>. If a debugger inserts a breakpoint (using the
> > 'ebreak'
> > instruction) at a location where Xen already uses 'ebreak', it
> > creates ambiguity. Xen cannot distinguish whether the 'ebreak'
> > instruction is inserted by the debugger or is part of Xen's own
> > code.
> >=20
> > Remove BUG_INSN_32 and BUG_INSN_16 macros as they encode the ebreak
> > instruction, which is no longer used for BUG_INSN.
> >=20
> > Update the comment above the definition of INS_LENGTH_MASK as
> > instead of
> > 'ebreak' instruction 'unimp' instruction is used.
> >=20
> > <xen/lib.h> is included for the reason that panic() and printk()
> > are
> > used in common/bug.c and RISC-V fails if it is not included.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
Thanks.

>=20
> Just one more (cosmetic) question:
>=20
> > --- a/xen/arch/riscv/include/asm/bug.h
> > +++ b/xen/arch/riscv/include/asm/bug.h
> > @@ -9,7 +9,7 @@
> > =C2=A0
> > =C2=A0#ifndef __ASSEMBLY__
> > =C2=A0
> > -#define BUG_INSTR "ebreak"
> > +#define BUG_INSTR "UNIMP"
>=20
> Deliberately all uppercase?
It could be lowercase without any issue. It was mentioned in uppercase
in RISC-V assembly manual:
```
To better diagnose situations where the program flow reaches an
unexpected
location, you might want to emit there an instruction that's known to
trap. You
can use an `UNIMP` pseudoinstruction, ...
```

~ Oleksii

