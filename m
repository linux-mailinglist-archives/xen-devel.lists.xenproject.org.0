Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8196A3F21
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 11:07:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502321.774065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWaP5-00012f-HE; Mon, 27 Feb 2023 10:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502321.774065; Mon, 27 Feb 2023 10:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWaP5-00010M-EO; Mon, 27 Feb 2023 10:06:43 +0000
Received: by outflank-mailman (input) for mailman id 502321;
 Mon, 27 Feb 2023 10:06:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddEZ=6X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pWaP3-00010G-RX
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 10:06:41 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d612dcd-b686-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 11:06:39 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id j17so5793355ljq.11
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 02:06:39 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 e6-20020a05651c038600b002934ebf2f6asm670115ljp.73.2023.02.27.02.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:06:38 -0800 (PST)
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
X-Inumbo-ID: 6d612dcd-b686-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=treUYICgArfcv5NTJiKLwtwiypW1saXfGPcvwV2iSdo=;
        b=e3aEZriyaz3dBeUeg86QJHeawQVzj4/T94bs4iwpzE4lkqAO8bt1cqEC3bsupVWX/c
         ugbk7P6FByR197BoogVHPxBYnhwUgh7G4oQFLmOZP6ioKIcxE0YVxAw+xr+ybJ0LWNHo
         pVIaKk3pfbppg8NyqfSEuZ6VL138WdbLwIPJ7l20V6dX0AxN/ON5Db9K46cN/J08sa1P
         3Qc33ZLkUk/qFjnkYoQowU+RhF4bXkjA/zr05eSRKFSLVAmWFWI1pGHUgFV6djJGMkl7
         SFkSrIsosKTQk6kjxtL2H+gLwBbNpZeA9ZrQU5Zfgh5WM9EYhcAz0EUDIaYaDJ7gp7wB
         BBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=treUYICgArfcv5NTJiKLwtwiypW1saXfGPcvwV2iSdo=;
        b=M1csQG/1b1V0+7Ba+GbRamvGNgKTueupF9NNUGAotoOwdzBwraGLWzjyEmm7WM729F
         kqoiXYH4uRBugkRXgCaa2+jQnGJsXG1V7U/dpD2CaxW/pUXZqMrPwY7WgDm5EkRUX15/
         Euv8yO7ChCfC/RDCt5GA1/3FnK5OqSJzy+2RGXY2g+AJyg85K/8kmAWKyN3a/aLLETkN
         x3ghtax43NKRDOkBvs1TGcRuBXJycoGHM6fxk0tgaiWNl06uTnbs/+1KrzfTlTc5PZnD
         gKD1ikDwTu9fp4XkFcESETpVxSymMG7t35NgqJlaR2DHi+fG458OkzluFfJJ4klx5DJ4
         u7wA==
X-Gm-Message-State: AO0yUKWzSdwvPLjkVTwBV9aWJjFcMXv6YMjXiz3J0RFeVmNER5Y1i8fx
	NNAzU6G91PL3f+PatzSOTsE=
X-Google-Smtp-Source: AK7set9r5yiRGC8mrV6z8MG9ev1gGTlXmjtzc/yAP3xIoQmrP+DVo7ZRTg6FDNUIfBi/m76qm6b/qw==
X-Received: by 2002:a05:651c:211b:b0:295:9d32:a673 with SMTP id a27-20020a05651c211b00b002959d32a673mr6801088ljq.3.1677492398947;
        Mon, 27 Feb 2023 02:06:38 -0800 (PST)
Message-ID: <76fba853b0997db19b62839f2d2b1280c9820ffb.camel@gmail.com>
Subject: Re: [PATCH] xen/riscv: init bss section
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
	Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Mon, 27 Feb 2023 12:06:37 +0200
In-Reply-To: <349f4817-ab12-b648-a0d7-76ed4aaafc74@citrix.com>
References: 
	<134bf758ecd93deffc6623605a8c020a17f64be8.1677249688.git.oleksii.kurochko@gmail.com>
	 <349f4817-ab12-b648-a0d7-76ed4aaafc74@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-02-24 at 16:55 +0000, Andrew Cooper wrote:
> On 24/02/2023 2:48 pm, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/arch/riscv/setup.c | 14 ++++++++++++++
> > =C2=A01 file changed, 14 insertions(+)
> >=20
> > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > index 154bf3a0bc..593bb471a4 100644
> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -24,6 +24,18 @@ static void test_macros_from_bug_h(void)
> > =C2=A0=C2=A0=C2=A0=C2=A0 early_printk("WARN is most likely working\n");
> > =C2=A0}
> > =C2=A0
> > +static void __init init_bss(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 extern char __bss_start;
> > +=C2=A0=C2=A0=C2=A0 extern char __bss_end;
> > +=C2=A0=C2=A0=C2=A0 char *bss =3D &__bss_start;
> > +
> > +=C2=A0=C2=A0=C2=A0 while ( bss < &__bss_end ) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *bss =3D 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bss++;
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > =C2=A0void __init noreturn start_xen(void)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 /*
> > @@ -38,6 +50,8 @@ void __init noreturn start_xen(void)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 asm volatile( "mv %0, a1" : "=3Dr" (dtb_base) =
);
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 init_bss();
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 early_printk("Hello from C env\n");
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 trap_init();
>=20
> Zeroing the BSS needs to one of the earliest thing you do.=C2=A0 It reall=
y
> does need to be before entering C, and needs to be as close to the
> start
> of head.S as you can reasonably make it.
>=20
> I'd put it even before loading sp in start.
>=20
> Even like this, there are various things the compiler might do behind
> your back which expect a) the BSS to already be zeroed, and b) not
> change value unexpectedly.
>=20
>=20
> Also, note:
>=20
> arch/riscv/xen.lds.S-143-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D=
 ALIGN(POINTER_ALIGN);
> arch/riscv/xen.lds.S:144:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __bss=
_end =3D .;
>=20
> The POINTER_ALIGN there is specifically so you can depend on
> __bss_{start,end} being suitably aligned to use a register-width
> store,
> rather than using byte stores, which in 64bit means you've got 8x
> fewer
> iterations.
Thanks for the comments. I'll take them into account in the next
version of the patch.
>=20
> ~Andrew
~ Oleksii

