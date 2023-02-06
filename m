Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5780368C452
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 18:13:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490663.759468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP53P-0006Eq-Hj; Mon, 06 Feb 2023 17:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490663.759468; Mon, 06 Feb 2023 17:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP53P-0006Ca-Dg; Mon, 06 Feb 2023 17:13:19 +0000
Received: by outflank-mailman (input) for mailman id 490663;
 Mon, 06 Feb 2023 17:13:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K59t=6C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pP53O-0006CU-EA
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 17:13:18 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b88d504-a641-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 18:13:17 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so7905785wms.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Feb 2023 09:13:16 -0800 (PST)
Received: from [192.168.8.199] (46.204.109.85.nat.umts.dynamic.t-mobile.pl.
 [46.204.109.85]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c468900b003dc53217e07sm12482471wmo.16.2023.02.06.09.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 09:13:15 -0800 (PST)
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
X-Inumbo-ID: 8b88d504-a641-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8kJeWBeBEEkZinRTqUdpXBM4KBY2GKR9YUxlAybjLNA=;
        b=DCKQXUbgOF0XysgbQpYCGzMDUy3A9NCJzbo2yGZ5p83xhpEK/p78lWjgnmsFjTLebi
         XOXaE8wgntZca8pasdB/5tQe7EsSNo6kGNbNfmqQeHppwrTwuyqG6ZA0Hk+knIT0bTgw
         357/3JnzjHbvs4ChnV9wUPr3p6mfRXEOu0x1dHhivW774oEWp/aT3CcGQjK2Mldo/WNx
         Tkf2xFYN9w4IwsEZCb5sV/vnedHvQ3qXQZu1s7kG3VkGp5kAeR+2Bc78786hpDKUVIth
         bmgC8HhOe2yJzGL5gASruhOkizSud+uo/t2A+xgxSFwMbRwJKa4t60IsTxRNvC+DUy0u
         eRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8kJeWBeBEEkZinRTqUdpXBM4KBY2GKR9YUxlAybjLNA=;
        b=ArZozIa5bhHkxXmee0XHVmmGL9vFVPeTDf/1ClOLiioTYXctZazjFirqJs4AZoCYJQ
         JfXq3DueCqUEYsq30R1dbmnulOI76z6Ly3Gn357Fk2ryZeypm22+eOQNvPQLMY3EoMel
         9DAqzIW5TeVgnjBWje3VRzj/T9Glu61fk7lrM8VJ1jdg42s+LhMrZgoUAnwtYm49fzeh
         vw8MxtSoq492CWD9jTK10dDVwZc2XOZDddWJY6vRbK48gHkWkv9LVRzIs43oxbOBzlsh
         EH92p61Y+3ZTl+g5Ubqp/QndN+bK6es56baetra2znGK/kfllQAVGC4Zo53icc9IH1fS
         DmIQ==
X-Gm-Message-State: AO0yUKUC1/sxxoP0WrSUV5gfoEHipdKFsW/I6DnK+HCXbm0AkEO0FboI
	YMjgAF3fu9/bYuM/K1PlCPCJQ9Hy2TU=
X-Google-Smtp-Source: AK7set+OrE4llkvGByt9rua/P84tDUWUxYHxTfZJepBHfWufbFF/B/A9giEHcpoirsR4Ay1/CtRuaQ==
X-Received: by 2002:a05:600c:704:b0:3df:d8c5:ec18 with SMTP id i4-20020a05600c070400b003dfd8c5ec18mr437977wmn.13.1675703595862;
        Mon, 06 Feb 2023 09:13:15 -0800 (PST)
Message-ID: <21617e45dd4efea7b1779650cd063d054ed0e309.camel@gmail.com>
Subject: Re: [PATCH v2 07/14] xen/riscv: introduce exception context
From: Oleksii <oleksii.kurochko@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Bobby
 Eshleman <bobby.eshleman@gmail.com>, xen-devel@lists.xenproject.org
Date: Mon, 06 Feb 2023 19:13:13 +0200
In-Reply-To: <alpine.DEB.2.22.394.2301311719490.132504@ubuntu-linux-20-04-desktop>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
	 <652289358975cf869e4bc0a6a70e3aba7bd2fbf6.1674818705.git.oleksii.kurochko@gmail.com>
	 <75328420-0fbd-92ae-40c7-9fee1c31c907@suse.com>
	 <792bc4533d3604acd4321b4b15965adec22431a4.camel@gmail.com>
	 <bdb8c6a8-a677-9bef-c819-904bd944e6da@suse.com>
	 <alpine.DEB.2.22.394.2301311719490.132504@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-01-31 at 17:30 -0800, Stefano Stabellini wrote:
> On Mon, 30 Jan 2023, Jan Beulich wrote:
> > On 30.01.2023 12:54, Oleksii wrote:
> > > Hi Jan,
> > >=20
> > > On Fri, 2023-01-27 at 15:24 +0100, Jan Beulich wrote:
> > > > On 27.01.2023 14:59, Oleksii Kurochko wrote:
> > > > > --- /dev/null
> > > > > +++ b/xen/arch/riscv/include/asm/processor.h
> > > > > @@ -0,0 +1,82 @@
> > > > > +/* SPDX-License-Identifier: MIT */
> > > > > +/***********************************************************
> > > > > ******
> > > > > *************
> > > > > + *
> > > > > + * Copyright 2019 (C) Alistair Francis
> > > > > <alistair.francis@wdc.com>
> > > > > + * Copyright 2021 (C) Bobby Eshleman
> > > > > <bobby.eshleman@gmail.com>
> > > > > + * Copyright 2023 (C) Vates
> > > > > + *
> > > > > + */
> > > > > +
> > > > > +#ifndef _ASM_RISCV_PROCESSOR_H
> > > > > +#define _ASM_RISCV_PROCESSOR_H
> > > > > +
> > > > > +#ifndef __ASSEMBLY__
> > > > > +
> > > > > +/* On stack VCPU state */
> > > > > +struct cpu_user_regs
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long zero;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long ra;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long sp;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long gp;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long tp;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long t0;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long t1;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long t2;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long s0;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long s1;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long a0;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long a1;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long a2;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long a3;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long a4;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long a5;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long a6;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long a7;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long s2;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long s3;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long s4;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long s5;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long s6;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long s7;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long s8;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long s9;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long s10;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long s11;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long t3;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long t4;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long t5;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long t6;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long sepc;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long sstatus;
> > > > > +=C2=A0=C2=A0=C2=A0 /* pointer to previous stack_cpu_regs */
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long pregs;
> > > > > +};
> > > >=20
> > > > Just to restate what I said on the earlier version: We have a
> > > > struct
> > > > of
> > > > this name in the public interface for x86. Besides to confusion
> > > > about
> > > > re-using the name for something private, I'd still like to
> > > > understand
> > > > what the public interface plans are. This is specifically
> > > > because I
> > > > think it would be better to re-use suitable public interface
> > > > structs
> > > > internally where possible. But that of course requires spelling
> > > > out
> > > > such parts of the public interface first.
> > > >=20
> > > I am not sure that I get you here.
> > > I greped a little bit and found out that each architecture
> > > declares
> > > this structure inside arch-specific folder.
> > >=20
> > > Mostly the usage of the cpu_user_regs is to save/restore current
> > > state
> > > of CPU during traps ( exceptions/interrupts ) and
> > > context_switch().
> >=20
> > Arm effectively duplicates the public interface struct
> > vcpu_guest_core_regs
> > and the internal struct cpu_user_regs (and this goes as far as also
> > duplicating the __DECL_REG() helper). Personally I find such
> > duplication
> > odd at the first glance at least; maybe there is a specific reason
> > for this
> > in Arm. But whether the public interface struct can be re-used can
> > likely
> > only be known once it was spelled out.
>=20
> struct vcpu_guest_core_regs is used as part of struct
> vcpu_guest_context, which is used for VCPUOP_initialise, which is not
> used on ARM and RISC-V (we use a standard firmware interface
> instead),
> and for save/restore, which also is not going to work any time soon
> on
> ARM and RISC-V.
>=20
> This is to say that we are probably not going to need the public
> interface for the next year or two, so it is difficult to tell at
> this
> stage if it aligns well with struct cpu_user_regs. I think we'll have
> to
> cross that bridge when we come to it.
>=20
Agree that it will be better to return to the public interface later.
So I'll this part of the patch series as is now.
>=20
> > > Also some registers are modified during construction of a domain.
> > > Thereby I prefer here to see the arch-specific register names
> > > instead
> > > of common.
> >=20
> > Not sure what meaning of "common" you imply here. Surely register
> > names
> > want to be arch-specific, and hence can't be "common" with other
> > arch-es.
>=20
> I think Oleksii misunderstood your request and believed you were
> asking
> him to make struct cpu_user_regs common across arches.
Yeah, that's what I thought at first...

~ Oleksii

