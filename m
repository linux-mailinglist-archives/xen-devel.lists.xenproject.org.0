Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79DF93FB60
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 18:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767032.1177595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYTN2-00079q-A0; Mon, 29 Jul 2024 16:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767032.1177595; Mon, 29 Jul 2024 16:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYTN2-00077o-7N; Mon, 29 Jul 2024 16:37:12 +0000
Received: by outflank-mailman (input) for mailman id 767032;
 Mon, 29 Jul 2024 16:37:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZrP=O5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sYTN1-0006xn-Lv
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 16:37:11 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd1585df-4dc8-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 18:37:10 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f0dfdc9e16so43396081fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 09:37:10 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac64eb399esm5955843a12.65.2024.07.29.09.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 09:37:08 -0700 (PDT)
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
X-Inumbo-ID: cd1585df-4dc8-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722271029; x=1722875829; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0erfytgjUyrrVAKxrWsImdEcQHX/DgiaLlPdBMMadMg=;
        b=OOrQz0W3CHD3MatqgW7K50cmvGM37dz7JjtjWc2zZRxsLZJSR3R/jrxH73tORURnDW
         W9eEq7/wjIkWpKJzO2VmQAHo5XO0O79eVqSlUN0/bEzlxHWUR6M9CAkSuTugeIVXCO0N
         2itiAoDLRe1oGYbF6O1eDyk2zjlMhrO4akpP6JJyL4pLUH8rU4V5ljcSinPgeJ2917OC
         gcgIsOlxXnZFFTgjbtQ8UH+dDpaIj4SoLPbxMC1QvfBZSpOzMtoXsjIfnetaUHIfW1fW
         ikmhhfiDcVQDSnlLNQZ1jn0BZ0nZXtMJPlfvtCUvsKk6vGxrRZ5F73w5EOaN6wj6uIVy
         Xq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722271029; x=1722875829;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0erfytgjUyrrVAKxrWsImdEcQHX/DgiaLlPdBMMadMg=;
        b=LFED/EJFb3vVm4595pB21nFA9Swad605ZEd3coftJgljkaxNNeARZPRRkE5Q+8N67e
         9sjtpzaRtDeTcu/XY2P/h6vtjQVHxEyjHA8/7PATM2iSPC2HKtIYyqcexpi3sG/h7IDB
         ELWB63/QIb8OplvVCOuxjsw2ZcPalXmDzTjxR5zYNOi+878RyIV7UIbdCAWRt8lc2RrH
         k4BcHvfJACq5Ft0DobHsMEf72y9KIbRobifrOYMs4/dXGZZcLzrS76HaV0Qol9MLD5Ju
         RmmuawdxoFSD1rfdvTFpJIgB0ywHhx7NgoauTvKR9V0nMg9vpO6vsvpU1+nL2n0O4NKK
         QK+A==
X-Gm-Message-State: AOJu0YxO5zxFXzoPQkFCOnjNDRGUlUhB0Rr12jPs8pQ9EIg3/ktpqubb
	zD/0eePN4vsrC3GEjXVaAvsTmCzSKjiDQKUi9FuZ73uAkDMAIZVXbTarYG8L
X-Google-Smtp-Source: AGHT+IG0NfwwivFaFYyBwUQ/63KGr8d+2KeYsqLVWNPiLN8s8FMo0R7OSVIU/9zHv9wuOWEme43L8g==
X-Received: by 2002:a2e:331a:0:b0:2ef:2dac:9078 with SMTP id 38308e7fff4ca-2f12ee04fbfmr49595011fa.16.1722271029210;
        Mon, 29 Jul 2024 09:37:09 -0700 (PDT)
Message-ID: <16a02674155acf49540d4cd23082a88ba0b9b4ff.camel@gmail.com>
Subject: Re: [PATCH v11 4/5] xen/riscv: enable GENERIC_BUG_FRAME
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Date: Mon, 29 Jul 2024 18:37:08 +0200
In-Reply-To: <7c03ed78-7c80-45bf-acf3-a916b7abb7d5@suse.com>
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
	 <b79bcfb9031564fc8d275af66fa94c1e82e54de2.1721731887.git.oleksii.kurochko@gmail.com>
	 <7c03ed78-7c80-45bf-acf3-a916b7abb7d5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-29 at 15:00 +0200, Jan Beulich wrote:
> On 24.07.2024 17:31, Oleksii Kurochko wrote:
> > To have working BUG(), WARN(), ASSERT, run_in_exception_handler()
> > it is needed to enable GENERIC_BUG_FRAME.
> >=20
> > ebreak is used as BUG_insn so when macros from <xen/bug.h> are
> > used, an exception with BREAKPOINT cause will be generated.
> >=20
> > ebreak triggers a debug trap, which starts in debug mode and is
> > then filtered by every mode. A debugger will first handle the
> > debug trap and check if ebreak was set by it or not. If not,
> > CAUSE_BREAKPOINT will be generated for the mode where the ebreak
> > instruction was executed.
>=20
> Here and in the similar code comment you talk about an external
> debugger, requiring debug mode, which is an optional feature. In
> my earlier comments what I was referring to was pure software
> debugging. I continue to fail to see how properly distinguishing
> ebreak uses for breakpoints from ebreak uses for e.g. BUG() and
> WARN() is going to be feasible.
I am using GDB now and everything working well.

>=20
> > @@ -103,7 +104,39 @@ static void do_unexpected_trap(const struct
> > cpu_user_regs *regs)
> > =C2=A0
> > =C2=A0void do_trap(struct cpu_user_regs *cpu_regs)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0 do_unexpected_trap(cpu_regs);
> > +=C2=A0=C2=A0=C2=A0 register_t pc =3D cpu_regs->sepc;
> > +=C2=A0=C2=A0=C2=A0 unsigned long cause =3D csr_read(CSR_SCAUSE);
> > +
> > +=C2=A0=C2=A0=C2=A0 switch ( cause )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * ebreak is used as BUG_insn so when macros f=
rom <xen/bug.h>
> > are
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * used, an exception with BREAKPOINT cause wi=
ll be generated.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * ebreak triggers a debug trap, which starts =
in debug mode
> > and is
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * then filtered by every mode. A debugger wil=
l first handle
> > the
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * debug trap and check if ebreak was set by i=
t or not. If
> > not,
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * CAUSE_BREAKPOINT will be generated for the =
mode where the
> > ebreak
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * instruction was executed.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 case CAUSE_BREAKPOINT:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( do_bug_frame(cpu_regs,=
 pc) >=3D 0 )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
( !(is_kernel_text(pc) || is_kernel_inittext(pc)) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 printk("Something wrong with PC: %#lx\n", pc);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 die();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu=
_regs->sepc +=3D GET_INSN_LENGTH(*(uint16_t *)pc);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>=20
> Wouldn't you better fall through here, with the "break" moved into
> the if()'s body?
It makes sense to me. Thanks.

~ Oleksii

