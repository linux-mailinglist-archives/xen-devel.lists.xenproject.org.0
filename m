Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843A86A84AB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 15:54:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504983.777473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkJe-0007mN-DB; Thu, 02 Mar 2023 14:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504983.777473; Thu, 02 Mar 2023 14:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkJe-0007k7-AK; Thu, 02 Mar 2023 14:53:54 +0000
Received: by outflank-mailman (input) for mailman id 504983;
 Thu, 02 Mar 2023 14:53:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rfr=62=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXkJc-0007jz-OH
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 14:53:52 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c258645-b90a-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 15:53:52 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id g17so22480710lfv.4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 06:53:51 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 y18-20020ac24472000000b004b55075f813sm2154896lfl.227.2023.03.02.06.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 06:53:51 -0800 (PST)
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
X-Inumbo-ID: 0c258645-b90a-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677768831;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5SSUBnQqHZ5gnDJR6SbL7el1W56pgUBsPLQROqNCbBA=;
        b=kbum3z7UjiUCredUTmZLAy315pNhwnUDrVOjLuPLdh/E+LYzTWvapbsxwyHQf0tMlO
         70JHxlTejh9zFGAXgnNb00avPcPrzGPtDpEhNifl4W4w/UxFv3j52K73lElJNi79Pedq
         DH1f5W8flCWdU9uyslkS07kNWo/dXqFIxh6UycV3G5f8pyKpSRIkE/mT7aevktMiPLi9
         U3dh9PyGR3YuSUguJHaq9O0S2dzrMfxi6Y8kIsK199wELr1YAR7v5Kw/Nr+Y3FpsMAzc
         bOhc3458LdfEi852ALm6FiHFWagP7h1QZNxJyHTb6k7QwL3xMKF8H7ICl6C3YK58YMex
         v7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677768831;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5SSUBnQqHZ5gnDJR6SbL7el1W56pgUBsPLQROqNCbBA=;
        b=xVwfWQ/TIeigpCB9mjLa4/tKhzr6kwLfZ4weQc5gqfi3QtS1SOx+o6PMoew35XuquC
         a54TDI/6oV35GxVt7cLdSpBJWGtAImYASaKzqZJaXjLOHe9jrbZ0hCitgqjqnWeSifdk
         6ZB7tNxN6n+jaIDIDEJ9bJLkaBA9LXl/GH38dVy0Jmk04B+ausOnl2ZHZMzSNLsZawr/
         lAeGUf4OTiMlILnYlnQIODCZVUyaf9p3H9a2xHGs4kHFJ2Z4Zpmy8axU/iHn7lAH7YBQ
         QFrMjPySQC5HwiN/nIjLkT5MyFTtcWgvAGZLMhUHXn6eCm0Zoq/disEg2gsjAo0oPAby
         ouEg==
X-Gm-Message-State: AO0yUKWQYBQMExEDqTNg35Qc13wfQoHwTN0/dhFiV52xXp/1PWK0cLZx
	S2ElrP1rZG+/PANIRXD130I=
X-Google-Smtp-Source: AK7set+SlsYHw1yr+JIpv4Z7S22rTl2rUaj/2yv9etriWM0GIBdCQ/OOIJdt1+r3medPbcX+jv4afg==
X-Received: by 2002:ac2:520f:0:b0:4ca:98ec:7d9a with SMTP id a15-20020ac2520f000000b004ca98ec7d9amr2537707lfl.15.1677768831384;
        Thu, 02 Mar 2023 06:53:51 -0800 (PST)
Message-ID: <f0d1e5b78482639a25f1ef0cf878309344383e7e.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] xen/riscv: read/save hart_id and dtb_base passed
 by bootloader
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Thu, 02 Mar 2023 16:53:49 +0200
In-Reply-To: <881fd332-91c1-fea2-d1a2-3a5444a6f272@citrix.com>
References: <cover.1677762812.git.oleksii.kurochko@gmail.com>
	 <3edbb40e86e480b2b71d596ff61c05336004b14c.1677762812.git.oleksii.kurochko@gmail.com>
	 <881fd332-91c1-fea2-d1a2-3a5444a6f272@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-03-02 at 14:02 +0000, Andrew Cooper wrote:
> On 02/03/2023 1:23 pm, Oleksii Kurochko wrote:
> > diff --git a/xen/arch/riscv/riscv64/head.S
> > b/xen/arch/riscv/riscv64/head.S
> > index ffd95f9f89..851b4691a5 100644
> > --- a/xen/arch/riscv/riscv64/head.S
> > +++ b/xen/arch/riscv/riscv64/head.S
> > @@ -6,8 +7,31 @@ ENTRY(start)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Mask all interrupts=
 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csrw=C2=A0=C2=A0=C2=A0=
 CSR_SIE, zero
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Save HART ID and DTB bas=
e */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lla=C2=A0=C2=A0=C2=A0=C2=A0=
 a6, _bootcpu_id
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 a0, (a6)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lla=C2=A0=C2=A0=C2=A0=C2=A0=
 a6, _dtb_base
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 a1, (a6)
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 sp, cpu0_boot_stack
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 t0, STACK_SIZE
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=
=C2=A0 sp, sp, t0
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lla=C2=A0=C2=A0=C2=A0=C2=A0=
 a6, _bootcpu_id
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_L=C2=A0=C2=A0 a0, (a6)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lla=C2=A0=C2=A0=C2=A0=C2=A0=
 a6, _dtb_base
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_L=C2=A0=C2=A0 a1, (a6)
>=20
> This is overkill.
>=20
> Put a comment at start identifying which parameters are in which
> registers, and just make sure not to clobber them - RISCV has plenty
> of
> registers.
>=20
> Right now, we don't touch the a registers at all, which is why your
> v1
> patch worked.=C2=A0 (a0 and a1 still have the same value when we get into
> C).
>=20
> If we do need to start calling more complex things here (and I'm not
> sure that we do), we could either store the parameters in s2-11, or
> spill them onto the stack; both of which are preferable to spilling
> to
> global variables like this.
>=20
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tail=C2=A0=C2=A0=C2=A0=
 start_xen
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Boot cpu id is pass=
ed by a bootloader
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +_bootcpu_id:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RISCV_PTR 0x0
>=20
> Just a note (as you want to delete this anyway), this isn't a PTR,
> it's
> a LONG.
>=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * DTB base is passed =
by a bootloader
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +_dtb_base:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RISCV_PTR 0x0
> > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > index 1c87899e8e..d9723fe1c0 100644
> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -7,7 +7,8 @@
> > =C2=A0unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
> > =C2=A0=C2=A0=C2=A0=C2=A0 __aligned(STACK_SIZE);
> > =C2=A0
> > -void __init noreturn start_xen(void)
> > +void __init noreturn start_xen(unsigned long bootcpu_id,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long dtb_base)
>=20
> To be clear, this change should be this hunk exactly as it is, and a
> comment immediately ahead of ENTRY(start) describing the entry ABI.
>=20
> There is no need currently to change any of the asm code.
I think that I'll use s2 and s3 to save bootcpu_id.

But I am unsure I understand why the asm code shouldn't be changed.

I mean that a0-7 are used as function arguments, a0-1 are used for
return value so they are expected to be changed. That is why we have to
save them somewhere.

If I understand you correctly I can write in a comment ahead of
ENTRY(start) that a0, and a1 are reserved for hart_id and dtb_base
which are passed from a bootloader but it will work only if start_xen
will be only C function called from head.S.

I probably misunderstand you...

~ Oleksii


