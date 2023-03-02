Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E176A85AE
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505213.777845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXlHB-0002ec-Tu; Thu, 02 Mar 2023 15:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505213.777845; Thu, 02 Mar 2023 15:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXlHB-0002cc-Qw; Thu, 02 Mar 2023 15:55:25 +0000
Received: by outflank-mailman (input) for mailman id 505213;
 Thu, 02 Mar 2023 15:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rfr=62=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXlHA-0002cU-Et
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:55:24 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3a32c0a-b912-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 16:55:22 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id by8so18078551ljb.7
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 07:55:22 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 z6-20020a05651c11c600b002959f20bcb8sm2161961ljo.47.2023.03.02.07.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 07:55:21 -0800 (PST)
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
X-Inumbo-ID: a3a32c0a-b912-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677772522;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y55sgdyG23gAS61fFj1guOE2Il3QBewTTX6Q3sh2g1I=;
        b=Qzgix45A/yPIbO+AAI6QpAWpoZyTANO6VP6tkW47v/8wt1nxdqrIc4/kpppkwIOthu
         0oLfd7rFQM8AQWwmOd5hwAWzztTqzev58pW26ORL+DbbFePwZtnULC5C61Y1sBF8J4xe
         qdWjH+brBQ3gV2Vw015oEu4+xQLKi8ESiCgrdXq06NzU9V3ftRL+watsuGTSF47vHH7x
         1YunAsg0Il9V+HVt7lkV70X2pV//H3v7oVOApepuiT8YKrQhhyPfydXdgwwkCtaDDPb6
         Efpk4JsP52EnHbcjE1uPXJKh3YaJd1T3AOkqhs3JTBxIdBD73vEOVcahUZ84b5XLeWLy
         Yvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677772522;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y55sgdyG23gAS61fFj1guOE2Il3QBewTTX6Q3sh2g1I=;
        b=SntG5ni/LpbF7VrgtCO95ZmB3uDlySC8e6pe9paWmUAJyiOJKgJDRPASULjwlJQ6dO
         SjRFWJRZ2Hv1kpW/h5NEcgRGGIxkZY5cJOfq53AtbJCgyH0FNht0xzmBUGOSYLCbmt21
         h0/3TViknRnqX06kz+UWH3uuaO7RLFuWaofCywCvOSNU+Fbl70lDcUoRhtJ90eimMfHh
         ySAqmo8FeajkNYygQiVbO1K+FSCqQDD3GiAkbqVcaEJg9Xg0suwcpdtrGv1aC77a+ktM
         eYLkVUsDaEsnICB9Whal8worSkyaFhrVnHXll9sroFFXdzaCrXT69a0dOCuhIhXar/fl
         k2Mw==
X-Gm-Message-State: AO0yUKUlWta1CGMH+h9Wi0pUhBwLkDbadpDmsGWOD4i+Hjr8qgMcw+da
	2FWdUGQSBRRLNbXbaq+Y3tSPpusmV4Q=
X-Google-Smtp-Source: AK7set+CDg8anBsXJuewhMycWPutVrC73nlRr61LifKVaopOAx7XAq1r5KPBZxGgtCoFRtvMmccSTg==
X-Received: by 2002:a2e:a58c:0:b0:295:d6c6:a0c3 with SMTP id m12-20020a2ea58c000000b00295d6c6a0c3mr2486376ljp.37.1677772521915;
        Thu, 02 Mar 2023 07:55:21 -0800 (PST)
Message-ID: <454a6452b2201b815979e7ca730949f7bb5fe4ef.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] xen/riscv: initialize .bss section
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Thu, 02 Mar 2023 17:55:19 +0200
In-Reply-To: <270118d9-0a7c-82c5-aaa8-437644017af4@suse.com>
References: <cover.1677762812.git.oleksii.kurochko@gmail.com>
	 <495bd1d7fc2becdd48bd00253c079971e2231e99.1677762812.git.oleksii.kurochko@gmail.com>
	 <270118d9-0a7c-82c5-aaa8-437644017af4@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-03-02 at 15:22 +0100, Jan Beulich wrote:
> On 02.03.2023 14:23, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/riscv64/head.S
> > +++ b/xen/arch/riscv/riscv64/head.S
> > @@ -13,6 +13,15 @@ ENTRY(start)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lla=C2=A0=C2=A0=C2=A0=
=C2=A0 a6, _dtb_base
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 a1, =
(a6)
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 a3, __bss_start
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 a4, __bss_end
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ble=C2=A0=C2=A0=C2=A0=C2=A0=
 a4, a3, clear_bss_done
>=20
> While it may be that .bss is indeed empty right now, even short term
> it won't be, and never will. I'd drop this conditional (and in
> particular the label), inserting a transient item into .bss for the
> time being. As soon as your patch introducing page tables has landed,
> there will be multiple pages worth of .bss.
If I understand you correctly you suggested declare some variable:
   int dummy_bss __attribute__((unused));

Then .bss won't be zero:
   $ riscv64-linux-gnu-objdump -x xen/xen-syms | grep -i dummy_bss   =20
   0000000080205000 g     O .bss   0000000000000004 .hidden dummy_bss

And when page tables will be ready it will be needed to remove
dummy_bss.

Another one option is to update linker script ( looks better then
previous one ):
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -140,6 +140,7 @@ SECTIONS
         . =3D ALIGN(SMP_CACHE_BYTES);
         __per_cpu_data_end =3D .;
         *(.bss .bss.*)
+        . =3D . + 1;
         . =3D ALIGN(POINTER_ALIGN);
         __bss_end =3D .;
     } :text

If one of the options is fine then to be honest I am not sure that I
understand why it is better than have 3 instructions which will be
unnecessary when first bss variable will be introduced. And actually
the same will be with item in bss, it will become unnecessary when
something from bss will be introduced.

I am OK with one of the mentioned above options but still would like
to understand what are advantages.

>=20
> Also are this and ...
>=20
> > +clear_bss:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 zero, (a3=
)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=C2=A0=
 a3, a3, RISCV_SZPTR
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 blt=C2=A0=C2=A0=C2=A0=C2=A0=
 a3, a4, clear_bss
>=20
> ... this branch actually the correct ones? I'd expect the unsigned
> flavors to be used when comparing addresses. It may not matter here
> and/or right now, but it'll set a bad precedent unless you expect
> to only ever work on addresses which have the sign bit clear.
I'll change blt to bltu.

~ Oleksii

