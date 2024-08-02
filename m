Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5223E945CB7
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 13:02:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770980.1181559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZq3G-00049q-0N; Fri, 02 Aug 2024 11:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770980.1181559; Fri, 02 Aug 2024 11:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZq3F-00047o-Sa; Fri, 02 Aug 2024 11:02:25 +0000
Received: by outflank-mailman (input) for mailman id 770980;
 Fri, 02 Aug 2024 11:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=14L3=PB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sZq3E-00047g-1a
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 11:02:24 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b151d455-50be-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 13:02:22 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2f15790b472so21287611fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 04:02:22 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba35a43sm193419e87.231.2024.08.02.04.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 04:02:20 -0700 (PDT)
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
X-Inumbo-ID: b151d455-50be-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722596541; x=1723201341; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QIeYc3VnZ5itKfrF+UwIjwjKtQd/VntST+I/E1lVRVk=;
        b=ZvFGWHXDR/xmPEjR6bRRKJwzfOpJ+rWZ63N4265xFZmycVuL5cX3P6tz+9ysFXPtKs
         hXbS8JxPKZioQzmvmm/wHuAaHxWoo0HJrkgahNGJoQ2WACOHNo9SDKKa8mcR3QMst7tQ
         RuU2fW4sg2Qr+GRH+qlU+gt/nU3FMX2PLnkisZ7s2izBK44Go7lWZnp/CDV40YnGY9n2
         z0Ct+Al+34SaJD12JaX6QBAMBGApVkuFONeqXUwzLOg/RFhBDlwUEd2btxMViCxnOcTW
         HFAo7R2gUsAjoJzdrZHdhCJrYkTvqzQmlV6fWrIduLnowl0fYysnS89B8+PBprPivTFX
         iAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722596541; x=1723201341;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QIeYc3VnZ5itKfrF+UwIjwjKtQd/VntST+I/E1lVRVk=;
        b=k5M00mKEpYMMhYUxjCy0+lNEyrvSiStDIUd53TxQYbN5qM+0tpNLODsDPFETFlI6/o
         hUHN8llxZzYv0QlGFh/9AmIPay3MBEc9Mli32ENLCw0Wil10FhA0YwUnXs5RlleT1Yyg
         /bZQSODeP9YFy6iC7uyER4ye3OAva7gMEOu6IU/TfItZhmAzZJJju/fXJON82Xkf28cL
         8v820QIpAN6r/5tbWIcy950oWCRYzRR07a5dyXsPSAexdFqabfbOKE8Widv7xFd2aWgj
         jNPvs5lHTZLjiIKK2s6tRPkY6g9qoDNRD5PTHkgUkij/yuLN9o2uVpn/jLnvPcfuREm2
         tdTQ==
X-Gm-Message-State: AOJu0YwV8YSW/FBo+OWPgXiSp0K+IREBLua9kRFSTWXiWbBQLcLjwdqB
	0aTWQ/mQEW7r+94ZGR6aBXpMAz3C85QLlxHW/hH1ZhiG5/uSWDHIPIzKhQ==
X-Google-Smtp-Source: AGHT+IGfwGu3S9iwCgrMQtk+HzYZePLedG8xfld/lb0xcpenCaMwDO90ls1OQ9MyQYQMSZJ/x5kD7w==
X-Received: by 2002:a05:6512:ac6:b0:52e:a60e:3a0a with SMTP id 2adb3069b0e04-530bb39d1dfmr1994060e87.2.1722596540783;
        Fri, 02 Aug 2024 04:02:20 -0700 (PDT)
Message-ID: <1b3aff2873f3e9a46b6dd7936717c32945ecf30f.camel@gmail.com>
Subject: Re: [PATCH v11 4/5] xen/riscv: enable GENERIC_BUG_FRAME
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Date: Fri, 02 Aug 2024 13:02:19 +0200
In-Reply-To: <1d3ef706-fa3d-4dee-818c-83904012ca35@suse.com>
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
	 <b79bcfb9031564fc8d275af66fa94c1e82e54de2.1721731887.git.oleksii.kurochko@gmail.com>
	 <7c03ed78-7c80-45bf-acf3-a916b7abb7d5@suse.com>
	 <6c379c6a0ac3e046c67647fa63d085a341906224.camel@gmail.com>
	 <83e20f26-ae59-4191-a12d-f31f779c91e2@suse.com>
	 <a16ac4cd3fe0143e40f8b5ec993cd6049d41ea3d.camel@gmail.com>
	 <1d3ef706-fa3d-4dee-818c-83904012ca35@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-08-02 at 12:30 +0200, Jan Beulich wrote:
> On 02.08.2024 12:22, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Fri, 2024-08-02 at 11:21 +0200, Jan Beulich wrote:
> > > On 02.08.2024 11:14, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > On Mon, 2024-07-29 at 15:00 +0200, Jan Beulich wrote:
> > > > > > To have working BUG(), WARN(), ASSERT,
> > > > > > run_in_exception_handler()
> > > > > > it is needed to enable GENERIC_BUG_FRAME.
> > > > > >=20
> > > > > > ebreak is used as BUG_insn so when macros from <xen/bug.h>
> > > > > > are
> > > > > > used, an exception with BREAKPOINT cause will be generated.
> > > > > >=20
> > > > > > ebreak triggers a debug trap, which starts in debug mode
> > > > > > and is
> > > > > > then filtered by every mode. A debugger will first handle
> > > > > > the
> > > > > > debug trap and check if ebreak was set by it or not. If
> > > > > > not,
> > > > > > CAUSE_BREAKPOINT will be generated for the mode where the
> > > > > > ebreak
> > > > > > instruction was executed.
> > > > >=20
> > > > > Here and in the similar code comment you talk about an
> > > > > external
> > > > > debugger, requiring debug mode, which is an optional feature.
> > > > > In
> > > > > my earlier comments what I was referring to was pure software
> > > > > debugging. I continue to fail to see how properly
> > > > > distinguishing
> > > > > ebreak uses for breakpoints from ebreak uses for e.g. BUG()
> > > > > and
> > > > > WARN() is going to be feasible.
> > > > GDB keeps track of what addresses it has breakpoints at.
> > >=20
> > > Of course it does. But in Xen how do you decide whether to
> > > trigger
> > > the debugger when you've hit an ebreak? (Just to repeat, my
> > > question
> > > is about the purely software debugging case; no hardware
> > > debugging
> > > extensions. In such a case, aiui, Xen gains control first and
> > > then
> > > decides whether to trigger the debugger, or whether to handle the
> > > exception internally. Sure, none of this infrastructure is in
> > > place
> > > right now, but imo it wants taking into consideration.)
> > Well, then something like KGDB is needed for Xen and mechanism to
> > notify guests to something similar to:
> >=20
> > Right now Xen detects that 'ebreak' is inserted by using the
> > function
> > do_bug_frame():
> > ```
> > =C2=A0=C2=A0=C2=A0 case CAUSE_BREAKPOINT:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( do_bug_frame(cpu_regs, =
pc) >=3D 0 )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
 !(is_kernel_text(pc) || is_kernel_inittext(pc)) )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 printk("Something wrong with PC: %#lx\n", pc);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 die();
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_=
regs->sepc +=3D GET_INSN_LENGTH(*(uint16_t *)pc);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > ```
> >=20
> > So if do_bug_frame() return < 0 then it should be ebreak inserted
> > by
> > the debugger so need to notify GDB that he should handle that.
> > At the moment I think we can add():
> > ```
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( do_bug_frame(cpu_regs, =
pc) >=3D 0 )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > 		...
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_=
regs->sepc +=3D GET_INSN_LENGTH(*(uint16_t *)pc);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > 	else
> > 	{
> > 	=C2=A0=C2=A0=C2=A0 printk("this is not Xen's ebreak\n");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 die(=
);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > ```
>=20
> Except that, as previously said, this will break if the debugger
> inserted
> a breakpoint where Xen already has an ebreak. That's where we started
> from
> in this discussion. Recall that my question was how the use of ebreak
> can
> be correct / reliable here. It is for a reason that on x86 we do not
> use
> the shorter INT3 instruction, but the longer UD2 one for BUG() etc.
Okay, in this case it will be an issue but only in case if the debugger
really will insert ebreak instruction but not something else. I wasn't
able to find a case when it is really inserted ebreak in case of RISC-
V.

However I agree that it would be safer to use something like UD2 but
RISC-V doesn't have such instruction ( at least I don't see such in a
spec).

There is something what we need is mentioned here:
https://github.com/riscv-non-isa/riscv-asm-manual/blob/main/riscv-asm.md#in=
struction-aliases
But the problem is that is "de-facto" standard, but not really standard
instruction. Anyway, I will update the patch to use (C0001073) instead
of ebreak.

~ Oleksii



