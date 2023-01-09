Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 306856620E6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 10:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473417.734005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEo4a-0003Jq-Td; Mon, 09 Jan 2023 09:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473417.734005; Mon, 09 Jan 2023 09:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEo4a-0003Hh-QJ; Mon, 09 Jan 2023 09:04:04 +0000
Received: by outflank-mailman (input) for mailman id 473417;
 Mon, 09 Jan 2023 09:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEo4Z-0003Hb-I9
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 09:04:03 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fdc65aa-8ffc-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 10:04:02 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id q2so8174328ljp.6
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 01:04:02 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 bj36-20020a2eaaa4000000b0027ff2fabcb5sm800824ljb.104.2023.01.09.01.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 01:04:01 -0800 (PST)
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
X-Inumbo-ID: 8fdc65aa-8ffc-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XwOSHtC2Z1W6QBgrGVhCWI9Of2uz2+3UV4UHU0xmC2E=;
        b=VAJfE9vScem/y8hG5SFrPdtZ6BN+ZrlnvdkAyO3EzxZ2ONwJ21XfqOrIL/9HMOBAj2
         UmXT+9mmUAlr4puFqdD2r7LDGOYEJEyCPfqNXdeFPTLda5FLoEkAxlttTaVGruO9PJ7O
         TmVjZu6rCMHmUJT0d8C7x0lUOPss04TSwBrhW1Z41Y3xr0Ns6sXzVau+Ir+XQGBAPKgS
         9GPCmdoNySDAEaJY6debV3W1qBmhpnA61kUZweHpPZoW9IZa6+TsEHPjxvFY3DGgOOpR
         p5PAP5DHOAbxwBEKPG4Pe2Xr4PrQz9ZVVdkQ5Y6srgoRIyH5Jq7fBfCjdfGFfpGqgU0b
         M7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwOSHtC2Z1W6QBgrGVhCWI9Of2uz2+3UV4UHU0xmC2E=;
        b=U5gequm/iOWv8n65Lz0G7gAOkreTmHtbODemZyVp4mFevd+WRAFHo499fhUhR8xC6G
         Fvd625bvvSJ0jZEWqanvuZW7DMIRGIOOruBalcZVq8o6hR33Xfg9TLU/gWoIwVINoRdS
         s2p3K6qMrTH4BpKqqKa01j9BdouKh7xWJRdTLHwQ1HL6kfWlk/E0eaav+2Hfe9iLbwEa
         NcyhQCXvGtn/owRolFVu0bnQAf4WaSoxH5UEPF7/RBWR8x4TCr+D1a6wd63US/+ctB0G
         FHJaJhcL39KcdTG8ObEQFOsa272CqUaSvOl6Xcfgh268f7JRvEH8vzCnUabdsGSju5qd
         sXeg==
X-Gm-Message-State: AFqh2kr/bRHCsVcEGQq/PFgvR3XDO0vrWSiM6K0G+bWIoOFImGRvrbUE
	Gf2YnHl/1J6O69FwO2VFfVE=
X-Google-Smtp-Source: AMrXdXtrEt8Zl7w+6S+A8Zrb1+1m71MEWc5BL3xoM7vK53fbLXYeQAmr+bVCVxBp8jSu05s830AlWQ==
X-Received: by 2002:a2e:8882:0:b0:27f:ed3e:8c70 with SMTP id k2-20020a2e8882000000b0027fed3e8c70mr7521295lji.34.1673255042163;
        Mon, 09 Jan 2023 01:04:02 -0800 (PST)
Message-ID: <0475c058d0655f5b7b245f19b20c5ef0f14b3618.camel@gmail.com>
Subject: Re: [PATCH v1 4/8] xen/riscv: introduce sbi call to putchar to
 console
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>
Date: Mon, 09 Jan 2023 11:04:00 +0200
In-Reply-To: <d77e7617-5263-0072-4786-ba6144247a4b@xen.org>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
	 <09da5a3184242152af6af060720a007738a55d6e.1673009740.git.oleksii.kurochko@gmail.com>
	 <d77e7617-5263-0072-4786-ba6144247a4b@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

Hi,

On Fri, 2023-01-06 at 13:40 +0000, Julien Grall wrote:
> Hi,
>=20
> On 06/01/2023 13:14, Oleksii Kurochko wrote:
> > The patch introduce sbi_putchar() SBI call which is necessary
> > to implement initial early_printk
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0 xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 xen/arch/riscv/include/asm/sbi.h | 34 ++++++++++++++++++++++++
> > =C2=A0 xen/arch/riscv/sbi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 44
> > ++++++++++++++++++++++++++++++++
>=20
> IMHO, it would be better to implement sbi.c in assembly so you can
> use=20
> print in the console before you jump to C world.
>=20
I thought that we can live with C version as we set up stack from the
start and then we can call early_printk() from assembly code too.
Is it bad approach?

> > =C2=A0 3 files changed, 79 insertions(+)
> > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/sbi.h
> > =C2=A0 create mode 100644 xen/arch/riscv/sbi.c
> >=20
> > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> > index 5a67a3f493..60db415654 100644
> > --- a/xen/arch/riscv/Makefile
> > +++ b/xen/arch/riscv/Makefile
> > @@ -1,5 +1,6 @@
> > =C2=A0 obj-$(CONFIG_RISCV_64) +=3D riscv64/
> > =C2=A0 obj-y +=3D setup.o
> > +obj-y +=3D sbi.o
>=20
> Please order the filename alphabetically.
>=20
> Cheers,
>=20


