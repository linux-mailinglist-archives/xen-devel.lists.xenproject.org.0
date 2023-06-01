Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FDB71F337
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 21:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542723.846909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4oKu-0008SB-1X; Thu, 01 Jun 2023 19:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542723.846909; Thu, 01 Jun 2023 19:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4oKt-0008Pk-VC; Thu, 01 Jun 2023 19:51:51 +0000
Received: by outflank-mailman (input) for mailman id 542723;
 Thu, 01 Jun 2023 19:51:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hsem=BV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q4oKs-0008Pe-8R
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 19:51:50 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id befbe5d9-00b5-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 21:51:48 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2af20198f20so18067351fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 12:51:48 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a2e9184000000b002adbe01cd69sm3891398ljg.9.2023.06.01.12.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 12:51:47 -0700 (PDT)
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
X-Inumbo-ID: befbe5d9-00b5-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685649108; x=1688241108;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vD9QOCW+QqdE5WxU03QUm5j26ZrZ70ogCEnRpo6RCHs=;
        b=d7hkl7LvWYJgQ8emAn7HAL/gBGhdlcDF7Z7vN7MNGYr9jq8XxH7Yf8BMfXGW9Gc29T
         bLvqKArrgsr2rxZ4F/QYRJFEKpsFj8gndeNiosMGSpcaV8p3HzN3zPSlJn8X/jls/0Zk
         nDrFdORh8Cztz294ZsXcemwgGVlP+kH5P6lxaMcRTT+e9xrVZ+bGWLsTpPwAkDCclc37
         m9xxi4Uhv00o99S02Emqd9xbLyMtf9jBjk7VoUR0pU8bz0tLnTswBmRUipQFE/B2WTmU
         TpEEGYubkueM/m9lO3tqmYLbjsGN4ARgxOsuyj53Ptv8M4gJY2oxDFZrihZ/4xpVq9pl
         jPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685649108; x=1688241108;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vD9QOCW+QqdE5WxU03QUm5j26ZrZ70ogCEnRpo6RCHs=;
        b=F//rpJJT8e0kTa/9DWw7tz/wZJdK2T3aS08SJOyzyA2VsRZ6oDAqO6RoNycJX3Uoew
         imQKS6Kc+VZ6u138W5v8CJ7JhDCKfICs9NleFvyW6gMLsPiJTWXxcShysgZtSQbRYGGE
         giCq2KVoyh4U3dHt09Jy5LhZ4/bCVwZFrjL8M027fSIo/EYULAncfMhk0bfqWYxZD7O7
         lB4BQEN4iXJ+M9fYVIHY9tvbgaljFRMs/pi9wctzPTRu4DxDsn37YEFudhRJJtaa8lhf
         xtygMxTIERzPrh9tD1YVltxck2N7WdxizZyi3Ukj3/EeYxXnD712mk4cO/Et473LYiwZ
         PuFA==
X-Gm-Message-State: AC+VfDw2k8K6B58yxclnn1juXmonOzZyiK1que7FZVB92OeGURFvj4bC
	pTqt0U3gO/0HdFQd8EqnloA=
X-Google-Smtp-Source: ACHHUZ4CMB42TKWJCFKCGKzc5OjSm3l6S7MNugJ3bVMf+vlcxaJxylYoQsOJ2EUDKQdXUmwO+u95RA==
X-Received: by 2002:a2e:b0e8:0:b0:2ac:8402:2eca with SMTP id h8-20020a2eb0e8000000b002ac84022ecamr265967ljl.28.1685649108068;
        Thu, 01 Jun 2023 12:51:48 -0700 (PDT)
Message-ID: <320af8556c4c93ac9c4840ea30c071a9d4f5d206.camel@gmail.com>
Subject: Re: [PATCH v6 5/6] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
 xen-devel@lists.xenproject.org
Date: Thu, 01 Jun 2023 22:51:46 +0300
In-Reply-To: <eff59de3-d4f6-4f0a-7670-4223ac6f8f3e@suse.com>
References: <cover.1685359848.git.oleksii.kurochko@gmail.com>
	 <bd2dd42c778714f25e7e98f74ff5e98eee1cd0a5.1685359848.git.oleksii.kurochko@gmail.com>
	 <92580a6f-e97a-c4a9-435c-bd95a84d4306@suse.com>
	 <4073258b3a3c6a0cb19843f02941d1e62e6f882d.camel@gmail.com>
	 <eff59de3-d4f6-4f0a-7670-4223ac6f8f3e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.2 (3.48.2-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-06-01 at 09:59 +0200, Jan Beulich wrote:
> On 31.05.2023 22:06, Oleksii wrote:
> > On Tue, 2023-05-30 at 18:00 +0200, Jan Beulich wrote:
> > > > +static uint32_t read_instr(unsigned long pc)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 uint16_t instr16 =3D *(uint16_t *)pc;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( GET_INSN_LENGTH(instr16) =3D=3D 2 )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (uint32_t)instr1=
6;
> > > > +=C2=A0=C2=A0=C2=A0 else
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return *(uint32_t *)pc;
> > > > +}
> > >=20
> > > As long as this function is only used on Xen code, it's kind of
> > > okay.
> > > There you/we control whether code can change behind our backs.
> > > But as
> > > soon as you might use this on guest code, the double read is
> > > going to
> > > be a problem
> > Will it be enough to add a comment that read_instr() should be used
> > only on Xen code? Or it is needed to introduce some lock?
>=20
> A comment will do for now. A lock would be problematic: It won't help
> when the function is used on non-Xen code, and since you use this in
> exception handling you may deadlock unless you carefully use a
> recursive lock.
Then I'll add a comment.

>=20
> > > (I think; I wonder how hardware is supposed to deal with
> > > the situation: Maybe they indeed fetch in 16-bit quantities?).
> > I thought that it reads amount of bytes corresponded to i-cache
> > size
> > and then the pipeline tracks whether an instruction is 16=C2=A0 or 32
> > bit.
>=20
> And what if an insn spans a cacheline boundary?
I think it is CPU specific, but your original assumption ( about 16-bit
fetching ) was probably right.

In RISC-V ISA doc [1] I found the following in chapter 1.2:
 The base RISC-V ISA has fixed-length 32-bit instructions that must be
naturally aligned on 32-bit boundaries. However, the standard RISC-V=20
encoding scheme is designed to support ISA extensions with variable-
length instructions, where each instruction can be any number of 16-bit
instruction parcels in length, and parcels are naturally aligned on 16-
bit boundaries. The standard compressed ISA extension described in=20
Chapter 12 reduces code size by providing compressed 16-bit
instructions and relaxes the alignment constraints to allow all
instructions (16 bit and 32 bit) to be aligned on any 16-bit boundary
to improve code density.

It sounds like h/w reads 16-bit and then based on the first bits
decides if it is needed to read more 16-bit parcels.

[1] https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf

