Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D32677966
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 11:44:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482730.748393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJuIi-0001kY-3B; Mon, 23 Jan 2023 10:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482730.748393; Mon, 23 Jan 2023 10:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJuIi-0001he-0K; Mon, 23 Jan 2023 10:43:44 +0000
Received: by outflank-mailman (input) for mailman id 482730;
 Mon, 23 Jan 2023 10:43:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rv8W=5U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pJuIg-0001hY-JI
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 10:43:42 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd1788cf-9b0a-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 11:43:41 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so8200576wms.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 02:43:41 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 u3-20020a7bc043000000b003d1d5a83b2esm10155933wmc.35.2023.01.23.02.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 02:43:40 -0800 (PST)
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
X-Inumbo-ID: cd1788cf-9b0a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EaB41qFJIUZ2IiYsh0T1M6qGYN9xhaUM1hyOb/jSwQQ=;
        b=hqUrEgkvhrKD8jK0U8WtIlpPvMxjQ3vfPTLofwfOQZDOUBnLR7Ohqqld4MaSt8EOiw
         cTQ8D0n9wK4nJYCi2aom5HxzkfA+ix1Ci1bVtR3yhukMIKFERjcVNWHr8MA+4iMJL/sQ
         F4iT4CyrZX0j8xQTN0xTPIhjf/xiu0HDvL8Oq8ogDNPj6GfuzXEbyyswN0le3yAn9Zg7
         LVTTKo7VWrJXdk3SvqFYHOhvsRnDqdLWyYhFk8kzqiZppQo2BpuqW0wHA/FNtK5K7nl7
         qniijo5fP9BAqUqknfskbIWttHDGKCXgMhmhYMxmTw/f0utXCifTG3Oo/t9PrgDjyihu
         uvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EaB41qFJIUZ2IiYsh0T1M6qGYN9xhaUM1hyOb/jSwQQ=;
        b=L6UBRFqCzfVTJEmyqHrELMOkHmCn7kpPX2BrxC1FP33FnIrBW2rrZc/TbCS6MNC+2h
         Y8MdITM+QkYuRuP7OqZe3ISBYAOe0bKmweXg36xkoj4FeUb1bgzby5rrwy6j+20sJBqI
         M59Tfoexh40ItRqxwCewrw9eEUPVHHXQr03/orYcYl29NXTR0ytq4cUxcuItcIpTng2G
         ySCDwsZdd0PILS9lk7UR/ihXjkV/4u1Vu5D/usCwNlwlnoDIrsrWVvwj0D7X8eagi6i2
         v7DQn5koUFUE4hn2du6eKym2viEg8sF6xs/u8YGbYVBCmIJVdSK6A0u/ijzppo8Odzpx
         wwjg==
X-Gm-Message-State: AFqh2ko66E3cCRwFP4rSQSvxkly28a/0esLtiI8GD9YFdbSOfvOUdSJy
	HfYk520dx7PvSN0AcPeOQkc=
X-Google-Smtp-Source: AMrXdXtp4hacxzT/Rg4/n9tUFUxbWTSelR8WjJ2kUxCHX0amWX7eGTyhPcTHrPeveXwdq6NBDGLl6w==
X-Received: by 2002:a05:600c:539b:b0:3d9:f836:3728 with SMTP id hg27-20020a05600c539b00b003d9f8363728mr23704479wmb.11.1674470620984;
        Mon, 23 Jan 2023 02:43:40 -0800 (PST)
Message-ID: <d3e2c18e443439d18f8ece31c9419e30a19be8c5.camel@gmail.com>
Subject: Re: [PATCH v1 01/14] xen/riscv: add _zicsr to CFLAGS
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
	Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Mon, 23 Jan 2023 12:43:39 +0200
In-Reply-To: <d5d9a305-3501-cbc4-1c8a-1a62bd08d588@citrix.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
	 <3617dc882193166580ae7e5d122447e924cab524.1674226563.git.oleksii.kurochko@gmail.com>
	 <d5d9a305-3501-cbc4-1c8a-1a62bd08d588@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-01-20 at 15:29 +0000, Andrew Cooper wrote:
> On 20/01/2023 2:59 pm, Oleksii Kurochko wrote:
> > Work with some registers requires csr command which is part of
> > Zicsr.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/arch/riscv/arch.mk | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> > index 012dc677c3..95b41d9f3e 100644
> > --- a/xen/arch/riscv/arch.mk
> > +++ b/xen/arch/riscv/arch.mk
> > @@ -10,7 +10,7 @@ riscv-march-$(CONFIG_RISCV_ISA_C)=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 :=3D
> > $(riscv-march-y)c
> > =C2=A0# into the upper half _or_ the lower half of the address space.
> > =C2=A0# -mcmodel=3Dmedlow would force Xen into the lower half.
> > =C2=A0
> > -CFLAGS +=3D -march=3D$(riscv-march-y) -mstrict-align -mcmodel=3Dmedany
> > +CFLAGS +=3D -march=3D$(riscv-march-y)_zicsr -mstrict-align -
> > mcmodel=3Dmedany
>=20
> Should we just go straight for G, rather than bumping it along every
> time we make a tweak?
>=20
I didn't go straight for G as it represents the =E2=80=9CIMAFDZicsr Zifence=
i=E2=80=9D
base and extensions thereby it will be needed to add support for FPU
(at least it requires {save,restore}_fp_state) but I am not sure that
we need it in general.

Another one reason is that Linux kernel introduces _zicsr extenstion
separately (but I am not sure that it can be considered as a serious
argument):
https://elixir.bootlin.com/linux/latest/source/arch/riscv/Makefile#L58
https://lore.kernel.org/all/20221024113000.891820486@linuxfoundation.org/
=20
> ~Andrew
~Oleksii


