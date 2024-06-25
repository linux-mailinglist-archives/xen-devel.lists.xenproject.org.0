Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B7916FE7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 20:10:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747998.1155540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMAbt-0005CT-KI; Tue, 25 Jun 2024 18:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747998.1155540; Tue, 25 Jun 2024 18:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMAbt-0005Ai-HV; Tue, 25 Jun 2024 18:09:41 +0000
Received: by outflank-mailman (input) for mailman id 747998;
 Tue, 25 Jun 2024 18:09:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMAbs-0005Ac-AC
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 18:09:40 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15bdf799-331e-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 20:09:38 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57d07f07a27so6696245a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 11:09:38 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d3040f003sm6168969a12.29.2024.06.25.11.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:09:36 -0700 (PDT)
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
X-Inumbo-ID: 15bdf799-331e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719338977; x=1719943777; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EdfsJBqq8rFcxW6phT73vAfGcA3f4b9eV+5Tw0DeNj4=;
        b=c3sL0HrMrFdIaUKx0W0Seju8Px4ubx6dkXm7tZ6lUdfHHb8lwtnp/H7gVYufojXltB
         i34lPqnnGtP7TJboOCw1HNR6X3t7h0NFa6L5RxIkEsDgJ09FEJCpgFHL1jol6OiKzVHK
         01gqmBD7acbfS4OaiIGCXex41LHVVLaQemOuGpLt6Gz8fYwgwqRrJhGuK3HHABlLvYh/
         K9TAqoLLwmT2LX/bjE7uN/zDSCNHByWGrQnYmOpgH0wPlyTMHXjWfuJtEkISMD+5rkg0
         bsyl5Pxc6aRBdnH7AnMxrjlEuN3JFoMNZRZPXXUmC2HcB6DHTJFO1lsbLXoIZII59S7n
         jHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719338977; x=1719943777;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EdfsJBqq8rFcxW6phT73vAfGcA3f4b9eV+5Tw0DeNj4=;
        b=M5+0xByOrXOILiKkZCREDPbG9X/+U9YgK6cIdaJC/E23eqnDIWUUaIcXVwTNwsHPOr
         ixE8vV6OEsvUWen4mTCgfbkOsF/uYJIgpx03lzVGVVNIdXhZor5BfsuLy5zLIAFU7A6n
         3EgIvsVay9xd+DmmNh4u3+PmVvH2RL6ZDgyHkpySF+3JVeFCMJJ+wEoycO1e4KPgyFUN
         u+lZAi7V9NZYCTDjZ0PvG3O1X95omEkjexPUSGTwrIaSNP/G1Cls1Wl0HNz3A3tJvzUX
         zcDStuR3EsVQCZ36R2k5qdRFqtCPmXMIb9f+QN2Wvnxe79YvW7nLp8lsfV6Tsf2a1WW/
         33/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXI64GJKu93j6qtIbc/YFirCnDDi+lRz9VBQDlL/Szgp6BjrF6FQbcgQjGw4xAFajoz3hLXdkK522BxNjDBhTN2Lx9R2Gwx/HNIlyJoU84=
X-Gm-Message-State: AOJu0Yywy6lxNXIuNJVzWgw+j1jAIMZjMsf3z3oF0XxgZXObaDENILgX
	wccyDbZ/0AFRG0iWOeOhLPQ3mfzckW+wnvE36bhM2h+19q9RcDY4
X-Google-Smtp-Source: AGHT+IG7MJcVzptHcjqrtZKExE5iFng54JmEeiy6GqbWZcborJLoCBJiM+QteVd/gxxd/a7tWFZdmA==
X-Received: by 2002:a50:cd9e:0:b0:57d:785:7cc2 with SMTP id 4fb4d7f45d1cf-57d4bdcc05bmr5171698a12.28.1719338976986;
        Tue, 25 Jun 2024 11:09:36 -0700 (PDT)
Message-ID: <9de5a3235f2bce8e7ab5c5dd5faf36e1774c97a7.camel@gmail.com>
Subject: Re: [PATCH v13 08/10] xen/riscv: change .insn to .byte in
 cpu_relax()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 25 Jun 2024 20:09:35 +0200
In-Reply-To: <8be2c7c0-0aa0-44e0-b3d3-d422fecc29b6@suse.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
	 <b5ccb3850cbfc0c84d2feea35a971351395fa974.1719319093.git.oleksii.kurochko@gmail.com>
	 <8be2c7c0-0aa0-44e0-b3d3-d422fecc29b6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-06-25 at 16:45 +0200, Jan Beulich wrote:
> On 25.06.2024 15:51, Oleksii Kurochko wrote:
> > The .insn directive appears to check that the byte pattern is a
> > known
> > extension, where .4byte doesn't.
>=20
> Support for specifying "raw" insns was added only in 2.38. Moving
> away
> from .insn has other downsides (which may or may not matter here, but
> that would want discussing). But: Do we really need to move away?
> Can't
> you use .insn with operands that the older gas supports, e.g.
>=20
> 	.insn r MISC_MEM, 0, 0, x0, x0, x16
>=20
> ? I'm sorry, the oldest RISC-V gas I have to hand is 2.39, so I
> couldn't
> double check that 2.35 would grok this. From checking sources it
> should,
> though.
We can do in this way too. I checked on https://godbolt.org/ even with
RISC-V ( 64 bits ) gcc 8.2.0 the suggested option with .insn compiles
well.

>=20
> > The following compilation error occurs:
> > =C2=A0 ./arch/riscv/include/asm/processor.h: Assembler messages:
> > =C2=A0 ./arch/riscv/include/asm/processor.h:70: Error: unrecognized
> > opcode `0x0100000F'
> > In case of the following Binutils:
> > =C2=A0 $ riscv64-linux-gnu-as --version
> > =C2=A0 GNU assembler (GNU Binutils for Debian) 2.35.2
>=20
> In patch 6 you say 2.39. Why is 2.35.2 suddenly becoming of interest?
Andrew has (or had) an older version of binutils and started to face
the issues mentioned in this patch and the next one. As a result, some
changes were suggested.

The version in the README wasn't changed because, in my opinion, this
requires a separate CI job with a prebuilt or fixed toolchain version.
At the moment, it is supported only the version mentioned in README and
that one I have on my machine.

>=20
> > --- a/xen/arch/riscv/include/asm/processor.h
> > +++ b/xen/arch/riscv/include/asm/processor.h
> > @@ -67,7 +67,7 @@ static inline void cpu_relax(void)
> > =C2=A0=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ ( "pause" );
> > =C2=A0#else
> > =C2=A0=C2=A0=C2=A0=C2=A0 /* Encoding of the pause instruction */
> > -=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ ( ".insn 0x0100000F" );
> > +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ ( ".byte 0x0100000F" );
> > =C2=A0#endif
>=20
> In the description you (correctly) say .4byte; why is it .byte here?
> Does this build at all?
Yes, it is a typo. Should be .4byte and it is built, but with warning:
	value 0x100000f truncated to 0xf


~ Oleksii

