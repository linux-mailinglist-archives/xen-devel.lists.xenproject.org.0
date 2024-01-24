Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD2E83A672
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 11:12:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670871.1043950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSaEq-0006yc-Fe; Wed, 24 Jan 2024 10:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670871.1043950; Wed, 24 Jan 2024 10:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSaEq-0006wo-Cj; Wed, 24 Jan 2024 10:12:08 +0000
Received: by outflank-mailman (input) for mailman id 670871;
 Wed, 24 Jan 2024 10:12:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k9jB=JC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSaEo-0006wb-ND
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 10:12:06 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05e03193-baa1-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 11:12:04 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so4694190a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 02:12:04 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 vq7-20020a170907a4c700b00a2cf537042asm13555299ejc.192.2024.01.24.02.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 02:12:03 -0800 (PST)
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
X-Inumbo-ID: 05e03193-baa1-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706091124; x=1706695924; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5S1d5nGLnkvwjU2iypUDNHqS2WDMTAXYy+547mpozjA=;
        b=iNpLg9J53WDJlE8iufuAhPEtqspLmv4129e2tzh+3lHUjyGcZx6+Mo9p0ccjJ62MPm
         Irrff/EfHxTpATH0xmocb1PwhUOfQU4RITxlVdKihHDRbOB9hwD6tW3DhArr5Qa6Xsak
         YQVgQV03nsmxCs966GpPxz8Mh6hlXrHD9vqDaELAzrOg0MbAmAnkMfe0f3bP2MsC/V7G
         Sn+fWCwf2vyvCfTlpgMZfC+CKMx6TjW3aQsEUWOFP1iRpJ8fuCVlcuZhcYsbXsu1/10N
         K8C5Oc2FL7tjqhRCpRo04OxHIwAmz09M17rd2rEv9AjeBdVvgjBzudhhlaquun/jijWu
         lQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706091124; x=1706695924;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5S1d5nGLnkvwjU2iypUDNHqS2WDMTAXYy+547mpozjA=;
        b=YyF2KjL1FCc0MT8yr0emuWyHOUJsSeXhKRbJaOdcSuNLAcd38XBKMgfWjH5rFkRwUj
         vrBeuFyZQ811qdCnJNAr7I8DxF9NMrkDhX5wISTz4AILwRyx2pr0viXH8uTE0GVppTJW
         TS6Seq6fdIe032wvAYg9S9BYqInmJzGs6NO4CvDjzbOlrvI7Z9kBL9Nufx9tVg4518/D
         TjIDn2uyfKTMI8f+oNTmuOxqI26fbRlm7NWH/ZHghhXNq7KDgSf+6mmQ6R4jHIMgDrtk
         J30yfuauCfX8xA99K8tlBGCfY8PgY2uGGyTApXN8zyB2WhZYut0EiuZh2ME38J1sj2pw
         AVaw==
X-Gm-Message-State: AOJu0Yyj8e/04vwLwzZaRANQpfQ9DDmYWwAbPGgadVRTrivdU1PYWYI6
	Q6euWxaPIp+zoh3qTgwUuhglhNghHMdK5/8RuYIGs3vxbNWpl02e
X-Google-Smtp-Source: AGHT+IEr/9jk6Pq1XUiE/jtR/DQ7IfPSE9sdidH6+SB1Nvt29yX2AGj1YoV7QkVWRuA+sG+oLKphYQ==
X-Received: by 2002:a17:906:899:b0:a2c:2437:101c with SMTP id n25-20020a170906089900b00a2c2437101cmr655535eje.13.1706091124020;
        Wed, 24 Jan 2024 02:12:04 -0800 (PST)
Message-ID: <22a0c2444201262202cd60d6d5a1cdff62c236bf.camel@gmail.com>
Subject: Re: [PATCH v3 30/34] xen/riscv: add minimal stuff to processor.h to
 build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 24 Jan 2024 12:12:02 +0200
In-Reply-To: <b8f47c93-43c4-4c61-a569-7d07e811c6ab@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <5bd7c5db6638f09dabdc13a6e12f0b204eacb234.1703255175.git.oleksii.kurochko@gmail.com>
	 <aa4d18c5-a8e0-44a6-ae7e-16fd9cd029b4@suse.com>
	 <5f8291916b01a2b29a16bd1345fc20e3d4f29cab.camel@gmail.com>
	 <b8f47c93-43c4-4c61-a569-7d07e811c6ab@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-01-24 at 09:19 +0100, Jan Beulich wrote:
> On 23.01.2024 18:08, Oleksii wrote:
> > On Tue, 2024-01-23 at 12:39 +0100, Jan Beulich wrote:
> > > On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > Changes in V3:
> > > > =C2=A0- Update the commit message
> > >=20
> > > ??? (again)
> > The same as with previous. asm/processor.h was changed to
> > processor.h
> >=20
> > >=20
> > > > @@ -53,6 +56,18 @@ struct cpu_user_regs
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pregs;
> > > > =C2=A0};
> > > > =C2=A0
> > > > +/* TODO: need to implement */
> > > > +#define cpu_to_core(cpu)=C2=A0=C2=A0 (0)
> > > > +#define cpu_to_socket(cpu) (0)
> > > > +
> > > > +static inline void cpu_relax(void)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 /* Encoding of the pause instruction */
> > > > +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ ( ".insn 0x100000F" );
> > >=20
> > > binutils 2.40 knows "pause" - why use .insn then?
> > I thought that for this instruction it is needed to have extension
> > ZIHINTPAUSE ( according to Linux Kernel source code [1] ) and to
> > cover
> > older version.
>=20
> Well, of course you'll need to enable the extension then for gas. But
> as long as you use the insn unconditionally, that's all fine and
> natural. Another thing would be if you meant to also run on systems
> not supporting the extension: Then the above use of .insn would need
> to become conditional anyway.
Then it makes sense to use "pause".=C2=A0
Let's assume that for now we are running only on systems which support
the extension until we won't face compilation issue for some system.

>=20
> > > > +=C2=A0=C2=A0=C2=A0 barrier();
> > >=20
> > > Why?
> > Just to be aligned with Linux kernel implemetation from where this
> > function was taken.
>=20
> Hmm, looking more closely we have an (open-coded) barrier even on
> x86.
> So I suppose it's really wanted (to keep the compiler from moving
> memory accesses around this construct), but then you may want to
> consider using
>=20
> =C2=A0=C2=A0=C2=A0 __asm__ __volatile__ ( "pause" ::: "memory" );
>=20
> here. First and foremost because at least in the general case two
> separate asm()s aren't the same as one combined one (volatile ones
> are more restricted, but I'd always err on the safe side, even if
> just to avoid giving bad examples which later on may be taken as a
> basis for deriving other code).
It makes sense, I'll update inline assembler line code.

Thanks.

~ Oleksii


