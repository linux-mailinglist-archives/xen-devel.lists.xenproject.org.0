Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B3091796E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 09:14:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748403.1156109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMMqu-0001cL-VP; Wed, 26 Jun 2024 07:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748403.1156109; Wed, 26 Jun 2024 07:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMMqu-0001Zb-Sf; Wed, 26 Jun 2024 07:14:00 +0000
Received: by outflank-mailman (input) for mailman id 748403;
 Wed, 26 Jun 2024 07:13:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=evFT=N4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMMqt-0001ZV-1m
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 07:13:59 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7da68e3-338b-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 09:13:58 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a72517e6225so419791766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 00:13:58 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72494294a0sm351460466b.182.2024.06.26.00.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 00:13:56 -0700 (PDT)
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
X-Inumbo-ID: a7da68e3-338b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719386037; x=1719990837; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cD8d/TgBD9fNS2sLEz7g7R5TN3ZPE/J0Id6vGaCm4oI=;
        b=Ai7iKp64Frpv+BBPUUyi6f2DPXrpboun2xkGJVGFNR9Cd8ec5a0K3IuFmYSM1ZPyDt
         HqIC2jDF+S4EKIsiEh6Fafmz2S+zZ/9cRNf8kRvy0dfXApzufqylFCFwm5s7pCp3Msjn
         ncdmb2c5pNBH8QbDJ/b7nujXN2nJuhWC1pxSng8YJtGkB/OrbkyGLloIuGUtr4TC8Wzi
         8+nuCXWcPdgTZZnnH10+TjPwaebxytDAZzNXqdhtQpgqtjmit3oX2PTzfkw2DQc3y7Pi
         MTSbZg13y/YRghtCTUxa50CJv8EX2qKpvd2bF1dDpbuW88K2t9ez8qT6gtr2ChsKVM+g
         DyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719386037; x=1719990837;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cD8d/TgBD9fNS2sLEz7g7R5TN3ZPE/J0Id6vGaCm4oI=;
        b=bl4kb5HdJaE7g7QTuwDIiezco3qTVTyP8Vi1H7FvXV/nw9rdSmj2sIQyUBd7b626R2
         lbTzsJANZswu/1RoDTNmrnTRTu3ueQbTlSuvKGU3zgVJo8xgeoPxxqEOaqV4siHpxuNq
         B7mYQ0CHzsaNkEN3cO0T2yjLmCWweBfczevdXmLLaJ1/ZLlDH0IacVD4gFC0hy6bf5A0
         ZJ/ssbGYk1VnZWamQTeXlsCarnwOwrKQVRf5tdn2Iar1CKlJyy93uipgiZlRX1TPd6ZR
         OslGWndV+5F7nGvlFJ7CmDTqTuHpaX1TVhVrivBmV3+RoXiqeFs01ocYW5RpPqWgykJ+
         o/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCV0iiS5BR6RiFBE4P6U43o2ITfHyWHVGSgr+83Lbu34vd1+ict84wE0Fm4pa3lVyi13XoCrBuM08RUEBZNwwkwOzoFZDhKJiWx7NEla5BI=
X-Gm-Message-State: AOJu0YwHPklsyZX7zNut865pf6ZUPSu0bIfrLG1V2XFEs8T4Xyu/0m69
	WniQUx+7neBan9GLNhKN05ZEth3Lb66Vvl2fcPp5kZ/B2ItCdYMD
X-Google-Smtp-Source: AGHT+IF/vDIGBBNXl1oT0rPFKa2Roxpn4s1+0DcNzjtD88W3PcvJIXfKyzHZcSVXTPwZxKPXIGSJtA==
X-Received: by 2002:a17:907:cbc2:b0:a72:7d5c:ace0 with SMTP id a640c23a62f3a-a727d5cae14mr202153366b.11.1719386037208;
        Wed, 26 Jun 2024 00:13:57 -0700 (PDT)
Message-ID: <6aedc34eb248ec9adba921593782a43f0cf0a8bf.camel@gmail.com>
Subject: Re: [PATCH v13 09/10] xen/riscv: introduce ANDN_INSN
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 26 Jun 2024 09:13:56 +0200
In-Reply-To: <b638c5f8-20e9-43bb-a47b-e24cb1b1b821@citrix.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
	 <b0d2ff2cecf6cb324e43b9c14c87f47f3f199613.1719319093.git.oleksii.kurochko@gmail.com>
	 <95f64eba-13b9-404a-8318-7a3fc77ea560@suse.com>
	 <b638c5f8-20e9-43bb-a47b-e24cb1b1b821@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-06-25 at 22:10 +0100, Andrew Cooper wrote:
> On 25/06/2024 3:49 pm, Jan Beulich wrote:
> > On 25.06.2024 15:51, Oleksii Kurochko wrote:
> > > --- a/xen/arch/riscv/include/asm/cmpxchg.h
> > > +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> > > @@ -18,6 +18,20 @@
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (new) \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory" );
> > > =C2=A0
> > > +/*
> > > + * Binutils < 2.37 doesn't understand ANDN.=C2=A0 If the toolchain i=
s
> > > too
> > > +ld, form
> > Same question: Why's 2.37 suddenly of interest?
>=20
> You deleted the commit message which explains why:
>=20
> > RISC-V does a conditional toolchain test for the Zbb extension
> > (xen/arch/riscv/rules.mk), but unconditionally uses the ANDN
> > instruction in emulate_xchg_1_2().
>=20
> Either Zbb needs to be mandatory (both in the toolchain and the board
> running Xen), or emulate_xchg_1_2() needs to not use the ANDN
> instruction.
But we can't go without Zbb there are some things in <xen/bitops.h>
which now requires this extension. At the current state of development
it is mandatory.

~ Oleksii

>=20
> I opted for the latter.
>=20
> ~Andrew


