Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CC4876428
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 13:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690275.1076127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riZAZ-0003iz-Fi; Fri, 08 Mar 2024 12:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690275.1076127; Fri, 08 Mar 2024 12:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riZAZ-0003h3-D5; Fri, 08 Mar 2024 12:17:47 +0000
Received: by outflank-mailman (input) for mailman id 690275;
 Fri, 08 Mar 2024 12:17:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=41Qb=KO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1riZAY-0003gx-K7
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 12:17:46 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deda2cba-dd45-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 13:17:45 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso2271439a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 04:17:45 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 i20-20020a170906445400b00a44e3c8423dsm6980537ejp.24.2024.03.08.04.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 04:17:44 -0800 (PST)
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
X-Inumbo-ID: deda2cba-dd45-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709900265; x=1710505065; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wiotCRCj8UweM4PWlXFTcPM6v+tuqzpfj8w2t1hCxOw=;
        b=GHj+bsYTgtT7rviNg1FlMog8//W57PvSK2wMtnHRU2m7QKDf2We3ywKb5X7oxKIDuO
         QsneNWO7tUdqD47uUMgw8glqgBztK5jscfO50dCZJ0t83aEdKD1Cpq3nTy1HpAnAROgs
         tFWdDBrA975kER6wGNCp00kbDVotUCDb3CY8HuG1g2CkKEtWH370wb6wQEYJuJMm1Vcl
         XSFomxVhT3azdFI7mvzaaovbI7EWUmcfMId0adMpbec44sPiuKCQV6EuQLYvpx8HLrRU
         UjHGuaBxNrQi5LDe7eOMHYVd4IID++EUseiLQlHia4Fj90VtkHHFb2BebRfaF1cLKnI5
         3Axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709900265; x=1710505065;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wiotCRCj8UweM4PWlXFTcPM6v+tuqzpfj8w2t1hCxOw=;
        b=HSa5erNtgMd0mIMDS1+svA3T7daV7RoHV2BeCkjHarFRI7W5+blbj3wBWyjkf1HmXD
         cyZC/5JjvWPxM8dvfMsHTZjjOo8DkCMzBRwoX3UDQo55chMIwfbZu1ykvtMnJ1KtNKJL
         uVwn+ZFjQFa25gfL2vqeQ23pnFnOdfWurqLG0p/sKl8FW1lmRmHFuNcaST00Co2/v4VV
         yOOnkjXy/skrG7/uvCDHk/FhPCY4HKBCnmYpcl3z/6SQilhFRJfg9J5hs431fgFvxtQw
         qBCeB1jTMeLva8va+v7IqQDjanfl7Mc3Py8PSXRldnaFcicaSO4wEqcuhx+BmVALPVLb
         3smg==
X-Forwarded-Encrypted: i=1; AJvYcCUOfBgswH4kerKiwz4jpI3/JG6jy8q1IdAOeSf4s0qnjCNay0wGEgDedoPGteSQB0UNa9brdBbZQvTD4ITcECmsCdpmyYXfaEHQmGKEyGY=
X-Gm-Message-State: AOJu0YzEpIbFGLTOXe1XqFvUQAFQC8bUN1ooLe0Zv365Eph+ZdeSQrfi
	S+QMDA0eWXJvELRUEDxUXq++3fOAxc01TFnQzlzWs/u1LB2Euvv6
X-Google-Smtp-Source: AGHT+IE/6gUmlk+T09zXf4+7mjCyI9x0mdCe75XjPcdm6HgbO1FV28YxVk+Y42PNXcg6/RpMvwLJ2w==
X-Received: by 2002:a17:907:c283:b0:a45:f24a:7dfb with SMTP id tk3-20020a170907c28300b00a45f24a7dfbmr1055696ejc.60.1709900265012;
        Fri, 08 Mar 2024 04:17:45 -0800 (PST)
Message-ID: <e70806679c7d03b9e5947509205be9ab0e543c51.camel@gmail.com>
Subject: Re: [PATCH v5 12/23] xen/riscv: introduce io.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 08 Mar 2024 13:17:43 +0100
In-Reply-To: <c64f693d-fdb2-44ca-9e24-097e34c07236@suse.com>
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
	 <4b6c9458efc85a57c14c6b6147d47245fece1f88.camel@gmail.com>
	 <d3c8618f-133a-48ca-a648-611250a8c334@suse.com>
	 <c64f693d-fdb2-44ca-9e24-097e34c07236@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Fri, 2024-03-08 at 12:52 +0100, Jan Beulich wrote:
> On 08.03.2024 12:49, Jan Beulich wrote:
> > On 08.03.2024 11:14, Oleksii wrote:
> > > On Fri, 2024-03-08 at 08:26 +0100, Jan Beulich wrote:
> > > > On 07.03.2024 21:54, Oleksii wrote:
> > > > > On Thu, 2024-03-07 at 21:49 +0100, Oleksii wrote:
> > > > > > On Thu, 2024-03-07 at 18:14 +0100, Jan Beulich wrote:
> > > > > > > For plain writes it should at least be "=3DQo" then, yes.
> > > > > > Constraints Q is a machine specific constraint, and I am
> > > > > > not sure
> > > > > > that
> > > > > > it makes sense to use "=3Do" only and probably it is a reason
> > > > > > why
> > > > > > it is
> > > > > > enough only "r". Does it make sense?
> > > > > Probably for RISC-V can be used:
> > > > > RISC-V=E2=80=94config/riscv/constraints.md
> > > > > =C2=A0=C2=A0 ...
> > > > > =C2=A0=C2=A0 A
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 An address that is held in a=
 general-purpose register.
> > > > > =C2=A0=C2=A0 ...
> > > >=20
> > > > Just from the description I would have said no, but looking at
> > > > what
> > > > "A"
> > > > actually expands to it is indeed RISC-V's counterpart of Arm's
> > > > "Q".
> > > > So
> > > > yes, this looks like what amo* want to use, and then as a real
> > > > operand,
> > > > not just a fake one.
> > > I am not sure that I know how to check correctly how "A" expands,
> > > but I
> > > tried to look at code which will be generated with and without
> > > constraints and it is the same:
> >=20
> > As expected.
But if it is epxected and generated code is the same, do we really need
constraints then?

> >=20
> > > =C2=A0=C2=A0 // static inline void __raw_writel(uint32_t val, volatil=
e void
> > > =C2=A0=C2=A0 __iomem *addr)
> > > =C2=A0=C2=A0 // {
> > > =C2=A0=C2=A0 //=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ( "sw %0, 0(%1)"=
 : : "r" (val), "r"(addr)
> > > );
> > > =C2=A0=C2=A0 // }
> > > =C2=A0=C2=A0=20
> > > =C2=A0=C2=A0 static inline void __raw_writel(uint32_t val, volatile v=
oid
> > > __iomem
> > > =C2=A0=C2=A0 *addr)
> > > =C2=A0=C2=A0 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ( "sw %0, %1" : : "=
r" (val), "Ao" (*(volatile
> > > =C2=A0=C2=A0 uint32_t __force *)addr) );
> >=20
> > You want just "A" here though; adding an offset (as "o" permits)
> > would
> > yield an insn which the assembler would reject.
>=20
> Wait - this is plain SW, so can't it even be the more generic "m"
> then?
> (As said, I'm uncertain about "o"; in general I think it's risky to
> use.)
What do you mean by "plain SW"?

Are you suggesting changing 'm' to 'o' so that the final result will be
"Am"? Based on the descriptions of 'A' and 'm', it seems to me that we
can just use 'A' alone because both constraints indicate that the
operand is in memory, and 'A' specifically denotes that an address is
held in a register.
>=20
>=20
> > Also just to remind
> > you: In write functions you need "=3DA" (and in amo ones "+A"), i.e.
> > the
> > memory operand then needs to be an output, not an input.
Could you please clarify about which one amo you are speaking? That one
who are defined by ATOMIC_OP and ATOMIC_FETCH_OP? They are already
using +A constraints:
    __asm__ __volatile__ (                                          \
        "   amo" #asm_op "." #asm_type " %1, %2, %0"                \
        : "+A" (v->counter), "=3Dr" (ret)                             \
        : "r" (I)                                                   \
        : "memory" );                                               \

~ Oleksii

