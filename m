Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751FE6A9302
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 09:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505637.778504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY15f-0002se-Uz; Fri, 03 Mar 2023 08:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505637.778504; Fri, 03 Mar 2023 08:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY15f-0002qq-Qu; Fri, 03 Mar 2023 08:48:35 +0000
Received: by outflank-mailman (input) for mailman id 505637;
 Fri, 03 Mar 2023 08:48:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y5Qx=63=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pY15e-0002qk-Cl
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 08:48:34 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d85c998-b9a0-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 09:48:33 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id s20so2606589lfb.11
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 00:48:32 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 l14-20020ac24a8e000000b004db2978e330sm298107lfp.258.2023.03.03.00.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:48:31 -0800 (PST)
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
X-Inumbo-ID: 2d85c998-b9a0-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677833312;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2FGrBAHURnCZZKaPwZ4cr+YuUZofoFmKMIWJce3ineM=;
        b=B/cn1lTLPBDeE/7/7Lm9OCh/a7uGqbzMVoQSdPHd7AMqylRC9jdZmBVC11daJEcdbb
         S3/vPCA5nEGKKiOYuAP9OPk6LDOJgoZqqh9TWjpLLPyomp/XxQy6AVMnMPhMhrH5UeWu
         QP4xN979f5jgo9QNkLSJarBgF0GJq9McFeaiAjyoMMLqv6DXb4BkL2nGi3JN57X1A1TF
         odEmt6Pdt25u5tuv3wrlsedKRwquIovxHDb1nuEWfhnn69hXjvxpgUwFIJtzh7EcaAPU
         d/iDUVos/Lya5YFU5DtHIHDqJeVxlkbhdshzWTED4NlueDB/a9of8N+bAlkUHtMW+Ivf
         vqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677833312;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2FGrBAHURnCZZKaPwZ4cr+YuUZofoFmKMIWJce3ineM=;
        b=Hpc/MFi8zHVsAANTNApy+/10PK3vhD1COrluhf/Vi7IrVLtSZHEiUEr/kqjj3sGaRd
         71hW2FrUbkqVXDodW/mCOb0J7lxFAAsfkg5ekmrahCAgXh4phtq2w3pokcue4ymsvOPp
         IRfocaWsl1COXntY/BWVD7/rT3MeCFidz71NwjNIZ6SYvbqPKgi0uy6WsZNLGfjeoYiR
         yw/yf3jTEE0KlpypSjay8YS33qUS/scirMn76vht1y3uhp6Vl1w1cCLE1oyf52QmbaYC
         9zLb4yi0wpmv7Cqxgw0QMyylowMZrpHXYNqUXm485QPD2ldBbhm/CScxQNiNlxTNNDCs
         yowg==
X-Gm-Message-State: AO0yUKX7JvDh3uD3kb8F9Di7wxDddA+s6ArLmKCeA14DH4UgT9Tpwnd8
	OcAcLaEX13D6e135CUSp5+4=
X-Google-Smtp-Source: AK7set/i/XOalLJSRrSZbYjcdhPQSNFYNF4Oh04M5iditK6DQfna84nFFI3NYfMnJF2gbA3es8sO/w==
X-Received: by 2002:a05:6512:66:b0:4d8:51e7:9f23 with SMTP id i6-20020a056512006600b004d851e79f23mr248405lfo.34.1677833312026;
        Fri, 03 Mar 2023 00:48:32 -0800 (PST)
Message-ID: <80fa0668427a4ff1faf93d4d235a54a2bee23134.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] xen/riscv: read/save hart_id and dtb_base passed
 by bootloader
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Fri, 03 Mar 2023 10:48:30 +0200
In-Reply-To: <24941ed0-56c6-167b-b101-ad1e1c06d907@citrix.com>
References: <cover.1677762812.git.oleksii.kurochko@gmail.com>
	 <3edbb40e86e480b2b71d596ff61c05336004b14c.1677762812.git.oleksii.kurochko@gmail.com>
	 <881fd332-91c1-fea2-d1a2-3a5444a6f272@citrix.com>
	 <f0d1e5b78482639a25f1ef0cf878309344383e7e.camel@gmail.com>
	 <24941ed0-56c6-167b-b101-ad1e1c06d907@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-03-02 at 18:58 +0000, Andrew Cooper wrote:
> On 02/03/2023 2:53 pm, Oleksii wrote:
> > On Thu, 2023-03-02 at 14:02 +0000, Andrew Cooper wrote:
> > > On 02/03/2023 1:23 pm, Oleksii Kurochko wrote:
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * DTB base is pas=
sed by a bootloader
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +_dtb_base:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RISCV_PTR 0x0
> > > > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > > > index 1c87899e8e..d9723fe1c0 100644
> > > > --- a/xen/arch/riscv/setup.c
> > > > +++ b/xen/arch/riscv/setup.c
> > > > @@ -7,7 +7,8 @@
> > > > =C2=A0unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 __aligned(STACK_SIZE);
> > > > =C2=A0
> > > > -void __init noreturn start_xen(void)
> > > > +void __init noreturn start_xen(unsigned long bootcpu_id,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long dtb_base)
> > > To be clear, this change should be this hunk exactly as it is,
> > > and a
> > > comment immediately ahead of ENTRY(start) describing the entry
> > > ABI.
> > >=20
> > > There is no need currently to change any of the asm code.
> > I think that I'll use s2 and s3 to save bootcpu_id.
> >=20
> > But I am unsure I understand why the asm code shouldn't be changed.
>=20
> Because nothing in the asm code (right now) touches any of the a
> registers.
>=20
> Therefore the parameters that OpenSBI prepared for start() (i.e. a0
> and
> a1 here) are still correct for start_xen().
>=20
> If, and only if, we need to modify a* for other reasons in start() do
> we
> need to preserve their values somehow.
>=20
> > If I understand you correctly I can write in a comment ahead of
> > ENTRY(start) that a0, and a1 are reserved for hart_id and dtb_base
> > which are passed from a bootloader but it will work only if
> > start_xen
> > will be only C function called from head.S.
>=20
> Not quite.=C2=A0 You want a comment explaining what the OpenSBI -> start(=
)
> ABI is.=C2=A0 So people know what a0/etc is at ENTRY(start).
>=20
> Here is an example from a different project:
> https://github.com/TrenchBoot/secure-kernel-loader/blob/master/head.S#L52=
-L68
>=20
>=20
> There is no need to do unnecessary work (i.e. preserving them right
> now), until you find a reason to need to spill them.=C2=A0 Right now,
> there's
> not need, and this isn't obviously going to change in the short term.
>=20
Thanks for clarification.

I will document ABI for start and that's it for now
~ Oleksii


