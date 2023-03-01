Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C66A6979
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 10:08:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503893.776282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXIRQ-0005HM-II; Wed, 01 Mar 2023 09:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503893.776282; Wed, 01 Mar 2023 09:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXIRQ-0005F0-El; Wed, 01 Mar 2023 09:08:04 +0000
Received: by outflank-mailman (input) for mailman id 503893;
 Wed, 01 Mar 2023 09:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXIRO-000586-RM
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 09:08:03 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91dfa84d-b810-11ed-969f-2f268f93b82a;
 Wed, 01 Mar 2023 10:08:02 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id j17so13173155ljq.11
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 01:08:02 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 h18-20020a05651c125200b002934ed148afsm1578962ljh.52.2023.03.01.01.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:08:01 -0800 (PST)
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
X-Inumbo-ID: 91dfa84d-b810-11ed-969f-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677661682;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2/4cqLZQbcZiDcOA7dToF9acxAizVJMcFFqNfd/cKRQ=;
        b=q1CAItK/f5EzZnjIBquC1g1RWf+sFcl1ubHOrs4Sy1BhDZm4J+rt4uxtAasZJb0iKN
         yYvoIyRjpZ66xdHkGYhvDXVvwMp6XBMnbtsWxFuaOeURMSBFG9ExSle6emiq0IeJJX8i
         /Uq2BgLz/UryIVNFLZKjk/vMvVC21q8s8tORw4zL3fI6OfM6IWzm13+n94kTatJtj/Wx
         +gynWmr/cD0RJQqJvlNwNE+PmWdg2j5/G1pDQSRmBc+PIMMgjxX2Ub7E1Mcda7Rk03bj
         NacRZNnX3CXIOUPMB2NJJ1G6n5l3HX79U5KKrMBkPJRRCVUpc9y6oc+G4YyQw3HO7Y+X
         Lk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677661682;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/4cqLZQbcZiDcOA7dToF9acxAizVJMcFFqNfd/cKRQ=;
        b=SQ60U79VHn9bYeEgL44czU8qh3mFFHj3/OIjxo2ilvc6o/ymGforpVDFp3gAGhEEZ2
         u0WahIbwB8un9o8LEuneVH7uN9SFN/vl/qn+nThrp2jwdvqwJXWeZ1bidYj1jRXSrnxL
         ChpPoVxu8+fAGtK55+36TwtpkpOTlIGrJ9niocFoEyle4Esxm1nrZtPInbVcZelT6eUU
         iJdr8kHAusbdUzTnv9dfOEbH3wJw/zIOjQ9ouPQbrsa7AxF5dVIDWBX6XR4X5P3AxvNG
         +EkQ2gPdyJo8q7iAzveug6II5tms/bIXaZ6FYY5F4Ob/Y91wU0kiyeSngbKtqM9ameC+
         GQvg==
X-Gm-Message-State: AO0yUKUd3tG1yvE/Q1A4NHbbXurHqSbFBdks1ekfotSFNdYGpDpWhbmU
	aroRsqWrudvB92dFpG9+Vfw=
X-Google-Smtp-Source: AK7set/lZW90ieEXOypfLDeewWiVYhVrMo5vHW+NZ5kA9khNCwItjoyKjLVMADcbzjHI1VkznjpJ/w==
X-Received: by 2002:a2e:9617:0:b0:295:b29f:a661 with SMTP id v23-20020a2e9617000000b00295b29fa661mr1820103ljh.4.1677661681650;
        Wed, 01 Mar 2023 01:08:01 -0800 (PST)
Message-ID: <ac416c016cfc8549560a15a25ee5cb771bcc75f3.camel@gmail.com>
Subject: Re: [PATCH v4 1/5] xen/riscv: introduce decode_cause() stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 01 Mar 2023 11:07:58 +0200
In-Reply-To: <2fb6e5ad-9e25-9c63-7f01-8a3d55297cf7@suse.com>
References: <cover.1677237653.git.oleksii.kurochko@gmail.com>
	 <397e6741438a8b125dc53945a74a58246fac4faf.1677237653.git.oleksii.kurochko@gmail.com>
	 <2fb6e5ad-9e25-9c63-7f01-8a3d55297cf7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-02-27 at 13:48 +0100, Jan Beulich wrote:
> On 24.02.2023 12:35, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/traps.c
> > +++ b/xen/arch/riscv/traps.c
> > @@ -4,10 +4,95 @@
> > =C2=A0 *
> > =C2=A0 * RISC-V Trap handlers
> > =C2=A0 */
> > +
> > +#include <xen/errno.h>
>=20
> I couldn't spot anything in the file which would require this
> inclusion.
Sure. It can be removed.
>=20
> > +#include <xen/lib.h>
> > +
> > +#include <asm/csr.h>
> > +#include <asm/early_printk.h>
> > =C2=A0#include <asm/processor.h>
> > =C2=A0#include <asm/traps.h>
> > =C2=A0
> > -void do_trap(struct cpu_user_regs *cpu_regs)
> > +static const char *decode_trap_cause(unsigned long cause)
> > +{
> > +=C2=A0=C2=A0=C2=A0 static const char *const trap_causes[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_MISALIGNED_FETCH] =
=3D "Instruction Address
> > Misaligned",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_FETCH_ACCESS] =3D "I=
nstruction Access Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_ILLEGAL_INSTRUCTION]=
 =3D "Illegal Instruction",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_BREAKPOINT] =3D "Bre=
akpoint",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_MISALIGNED_LOAD] =3D=
 "Load Address Misaligned",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_LOAD_ACCESS] =3D "Lo=
ad Access Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_MISALIGNED_STORE] =
=3D "Store/AMO Address Misaligned",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_STORE_ACCESS] =3D "S=
tore/AMO Access Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_USER_ECALL] =3D "Env=
ironment Call from U-Mode",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_SUPERVISOR_ECALL] =
=3D "Environment Call from S-Mode",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_MACHINE_ECALL] =3D "=
Environment Call from M-Mode",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_FETCH_PAGE_FAULT] =
=3D "Instruction Page Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_LOAD_PAGE_FAULT] =3D=
 "Load Page Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_STORE_PAGE_FAULT] =
=3D "Store/AMO Page Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_FETCH_GUEST_PAGE_FAU=
LT] =3D "Instruction Guest Page
> > Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_LOAD_GUEST_PAGE_FAUL=
T] =3D "Load Guest Page Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_VIRTUAL_INST_FAULT] =
=3D "Virtualized Instruction
> > Fault",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CAUSE_STORE_GUEST_PAGE_FAU=
LT] =3D "Guest Store/AMO Page
> > Fault",
> > +=C2=A0=C2=A0=C2=A0 };
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( cause < ARRAY_SIZE(trap_causes) && trap_causes=
[cause] )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return trap_causes[cause];
> > +=C2=A0=C2=A0=C2=A0 return "UNKNOWN";
> > +}
> > +
> > +const char *decode_reserved_interrupt_cause(unsigned long
> > irq_cause)
>=20
> For any non-static function that you add you will need a declaration
> in a header, which the defining C file then includes. I understand
> that during initial bringup functions without (external) callers may
> want to (temporarily) exist, but briefly clarifying what the future
> expectation regarding external uses might help. Any function that's
> not expected to gain external callers should be static.
Thanks. For explanation. I'll make them static.

~ Oleksii


