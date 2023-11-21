Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 978027F33CA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638036.994264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TfN-0004SR-Sz; Tue, 21 Nov 2023 16:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638036.994264; Tue, 21 Nov 2023 16:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TfN-0004Qd-Pv; Tue, 21 Nov 2023 16:32:01 +0000
Received: by outflank-mailman (input) for mailman id 638036;
 Tue, 21 Nov 2023 16:32:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFE0=HC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r5TfM-0004P2-Ky
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:32:00 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7da9337e-888b-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 17:31:58 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507bd64814fso8099128e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 08:31:58 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a056512211600b005030cef433esm1547994lfr.94.2023.11.21.08.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 08:31:57 -0800 (PST)
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
X-Inumbo-ID: 7da9337e-888b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700584318; x=1701189118; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s8qc/XsNcpf3RUepejICQGWg9KVaFo8U2oIctRmpP70=;
        b=E6mxZ23cNVSU57RhFWtyGi86ZuwlIfXTll+aP2tRyA+JCJtfO1pCgRZyGX+J6Ll4xk
         FCdy/okhrsodKhnQSIQhS1bf74EHFp0oHgjYxwGH/0pV8chtLt6snyLCShwzaytLMfoq
         2PTjzoBTjsDpVKV2i2qxCvSbQZabe8jL5YnpKApwVVp5CoNXyR1F/pkrHS8PSa+OaaZi
         3P350gM6gN8KaYtShpNceVMSnYxqAg7BGpFmj8K5K4WHsH9lOyEyJb9WqaHqtE8Gf5Vs
         QqmXHcz4ztI2QvM5fUdGdBgM9MPFEtl8EGfFQYXaJe7unohQZsyBK9GL0aofOmr6dRep
         zMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700584318; x=1701189118;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s8qc/XsNcpf3RUepejICQGWg9KVaFo8U2oIctRmpP70=;
        b=qjtpMD8ZpyTs/hlESFLYBA4QCB3Q07O9FtvyzzgFWnSNKusqzHa6lFtS/Qrzoh8Glj
         aBlWBKqklh0GUAw4iBhZuupBpuaokar0Ke0tBZ8u4nsfHvPK/dELrKklpJV96UAhVgwG
         8CAZF7hiDw5vGFLN/jXxM3LnJsn06vhJT5EXQouNxofY08GCSV3X0MXkVK/vOSAbkcnv
         oEIWPgajTdc2ThBtBgniIq5SIeCUhFkPJ4a0/A/QdmWIW4JIygd98sLezWNaLGD1WG7a
         uVtQvMDY+tlC2Qib5QpMe6LrBurFd9lY5ZmwCspdUjScevGfCIUaNmKec4dntQP4ACYy
         Mq4Q==
X-Gm-Message-State: AOJu0Yw1m3EsjL/8MHhyHF5hr/Eo611CxEiitcyJmCILrog6J7w7ZpCz
	bGglZyS5YJ9glEeFOHfNwz0=
X-Google-Smtp-Source: AGHT+IGHxqpWT3tQQ2TYrUCftLcmUge+wMfsJCTvHVBYkUwuHy+FAMRJko/U8AoKnznZJJAFg3vEjg==
X-Received: by 2002:ac2:5bc7:0:b0:509:fc7:884a with SMTP id u7-20020ac25bc7000000b005090fc7884amr7430145lfn.19.1700584317846;
        Tue, 21 Nov 2023 08:31:57 -0800 (PST)
Message-ID: <c7e3617894a5482c95dc4bfa53fa44966b2b22cd.camel@gmail.com>
Subject: Re: [PATCH v3 06/14] xen/asm-generic: introduce generic header
 percpu.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Date: Tue, 21 Nov 2023 18:31:48 +0200
In-Reply-To: <dcad55a5-2582-41df-a2bf-6e83ddfbc0a3@suse.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
	 <51ce486a825a1654998db01c4e07c127e4b1b38b.1700221559.git.oleksii.kurochko@gmail.com>
	 <dcad55a5-2582-41df-a2bf-6e83ddfbc0a3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-11-21 at 16:56 +0100, Jan Beulich wrote:
> On 17.11.2023 13:24, Oleksii Kurochko wrote:
> > --- a/xen/arch/ppc/include/asm/current.h
> > +++ b/xen/arch/ppc/include/asm/current.h
> > @@ -4,6 +4,8 @@
> > =C2=A0
> > =C2=A0#include <xen/percpu.h>
> > =C2=A0
> > +#include <asm/processor.h>
> > +
> > =C2=A0#ifndef __ASSEMBLY__
> > =C2=A0
> > =C2=A0struct vcpu;
> > @@ -38,6 +40,10 @@ static inline struct cpu_info
> > *get_cpu_info(void)
> > =C2=A0
> > =C2=A0#define guest_cpu_user_regs() (&get_cpu_info()-
> > >guest_cpu_user_regs)
> > =C2=A0
> > +#define smp_processor_id()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 /* TODO: Fi=
x this */
> > +
> > +#define get_per_cpu_offset()=C2=A0=C2=A0=C2=A0 smp_processor_id()
>=20
> This 2nd item can't be quite right either, so likely also wants a
> FIXME comment.
> Shawn will have the ultimate say here anyway.
I did so because it is how percpu stuff was implemented before
get_per_cpu_offset was introduced.

>=20
> > --- a/xen/include/xen/percpu.h
> > +++ b/xen/include/xen/percpu.h
> > @@ -1,8 +1,6 @@
> > =C2=A0#ifndef __XEN_PERCPU_H__
> > =C2=A0#define __XEN_PERCPU_H__
> > =C2=A0
> > -#include <asm/percpu.h>
> > -
> > =C2=A0#define DECLARE_PER_CPU(type, name) \
> > =C2=A0=C2=A0=C2=A0=C2=A0 extern __typeof__(type) per_cpu__ ## name
> > =C2=A0
> > @@ -29,6 +27,8 @@
> > =C2=A0
> > =C2=A0#define get_per_cpu_var(var)=C2=A0 (per_cpu__##var)
> > =C2=A0
> > +#include <asm/percpu.h>
> > +
> > =C2=A0/* Linux compatibility. */
> > =C2=A0#define get_cpu_var(var) this_cpu(var)
> > =C2=A0#define put_cpu_var(var)
>=20
> While you explain the reason for this movement, it still feels a
> little
> fragile to me.

The reason for that is #include <asm/processor.h> was added to
<asm/percpu.h>. <asm/processor.h> uses DECLARE_PER_CPU(...) so it
should be defined before inclusion of <asm/percpu.h>. Otherwise the
following error will occur:
./arch/riscv/include/asm/current.h:13:32: error: unknown type name
'curr_vcpu'
   13 | DECLARE_PER_CPU(struct vcpu *, curr_vcpu);                   =20
      |                                ^~~~~~~~~       =20
In file included from ././include/xen/config.h:17,
                 from <command-line>:                             =20
./include/xen/sched.h: In function 'rcu_unlock_domain':
./include/asm-generic/percpu.h:19:19: error: 'per_cpu__curr_vcpu'
undeclared (first use in this function)
   19 |     (*RELOC_HIDE(&per_cpu__##var, get_per_cpu_offset()))
      |                   ^~~~~~~~~                                  =20
./include/xen/compiler.h:146:37: note: in definition of macro
'RELOC_HIDE'
  146 |     __asm__ ("" : "=3Dr"(__ptr) : "0"(ptr));      \
      |                                     ^~~                      =20
./arch/riscv/include/asm/current.h:15:29: note: in expansion of macro
'this_cpu'
   15 | #define current            (this_cpu(curr_vcpu))
      |                             ^~~~~~~~                         =20
./include/xen/sched.h:726:15: note: in expansion of macro 'current'
  726 |     if ( d !=3D current->domain )    =20
      |               ^~~~~~~                                     =20
./include/asm-generic/percpu.h:19:19: note: each undeclared identifier
is reported only once for each function it appears in
   19 |     (*RELOC_HIDE(&per_cpu__##var, get_per_cpu_offset()))
      |                   ^~~~~~~~~             =20
./include/xen/compiler.h:146:37: note: in definition of macro
'RELOC_HIDE'
  146 |     __asm__ ("" : "=3Dr"(__ptr) : "0"(ptr));      \
      |                                     ^~~
./arch/riscv/include/asm/current.h:15:29: note: in expansion of macro
'this_cpu'
   15 | #define current            (this_cpu(curr_vcpu))
      |                             ^~~~~~~~
./include/xen/sched.h:726:15: note: in expansion of macro 'current'
  726 |     if ( d !=3D current->domain )

~ Oleksii


