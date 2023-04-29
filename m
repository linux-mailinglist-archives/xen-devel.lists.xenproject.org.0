Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D9D6F2417
	for <lists+xen-devel@lfdr.de>; Sat, 29 Apr 2023 12:06:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527578.820268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pshSd-0007cp-EV; Sat, 29 Apr 2023 10:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527578.820268; Sat, 29 Apr 2023 10:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pshSd-0007Zp-BW; Sat, 29 Apr 2023 10:05:47 +0000
Received: by outflank-mailman (input) for mailman id 527578;
 Sat, 29 Apr 2023 10:05:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NroF=AU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pshSb-0007Zj-NY
 for xen-devel@lists.xenproject.org; Sat, 29 Apr 2023 10:05:45 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66123d41-e675-11ed-b225-6b7b168915f2;
 Sat, 29 Apr 2023 12:05:41 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4edcdfa8638so963080e87.2
 for <xen-devel@lists.xenproject.org>; Sat, 29 Apr 2023 03:05:41 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f12-20020ac2532c000000b004eb0dcc52ddsm3690891lfh.41.2023.04.29.03.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 03:05:40 -0700 (PDT)
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
X-Inumbo-ID: 66123d41-e675-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682762741; x=1685354741;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qd7fTbCml8yhI5ilGvALDKsOLdO6KOdtx4cyQfkrzpU=;
        b=nbXCnd6Y7yjeA8IQ6HOg4ayKBn8S2DiRzyprTC4bwUSix5NN9DXyyUAkLyRvCLMy5x
         SU+/9jKRy3VOGc6jwDBLaod1wCJLNgA7wTrENUrn8R5ifRxMYLyo8lQwIlF3V2sdeGQS
         bf351Lx7jaBwUrlKgzt4yajLvV3mKnlR1SADjsf7sAN3QbZxk5+S1Efth7Rj8AcmaEc5
         fcEMrHuksXYG3Wy7EjwJoIXWEfadPMIH2YwCVfGkIVNKL7+ZVZf/3BD6l9ih7GyeW4Ff
         Sq71S97/h0eRn66AMKEGTNx+EyX1rliII7h1PhivdhiWff7x5Js74idekhCKdAqX5qwI
         CG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682762741; x=1685354741;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qd7fTbCml8yhI5ilGvALDKsOLdO6KOdtx4cyQfkrzpU=;
        b=CQs04d9oXznU9xQqLHszYMbyKabaB+s1iysFGM9o9CdWkaRZ2P0NIJBOwAVT7MxDrM
         UOMZ5cumJrYFGQeykwsUukQ7FV9obE0Sci/cV+iAmoWsvaIef6r1u1BufNRaGbrv4ip3
         3zOU530/4/JZ6XxP5eKiRnhGW9hd3fEVTJ2Q8vlul31FZPxYMUVvCHf+ndSjMMdMOmQU
         +a1/G4M2FW4Xp1ynhWgApnXbfFGL1StfzCk0WomXi8wLdMU+6cu/C5eZkwJtB0f3ZWrE
         3cCSxdMKGJo5TX/oPv+PBLUIEq7PVKP4TE/68b5ZfAqYfuXSQrl+bGg4TMJaDZDdjkBH
         1niw==
X-Gm-Message-State: AC+VfDytTuTpHaeFNPfxwB0XsbEz6NT1aMlqD2GkLHCXIbosXglpsmFW
	3bdDRIjaP5t/i4aixcoVenA=
X-Google-Smtp-Source: ACHHUZ5RhWJRxhYkvatJGvgS1bNo0jV+DNqkvg2UjDGE3y9yKGRmyGemb0beF6vaC4oGBqrCrIMgOA==
X-Received: by 2002:a05:6512:20a:b0:4dd:9ddc:4463 with SMTP id a10-20020a056512020a00b004dd9ddc4463mr2246783lfo.5.1682762740929;
        Sat, 29 Apr 2023 03:05:40 -0700 (PDT)
Message-ID: <016a95e8cc1be45ce1821aba0570ff87973c4c35.camel@gmail.com>
Subject: Re: [PATCH v5 1/4] xen/riscv: add VM space layout
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Gianluca Guida
	 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
	Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Date: Sat, 29 Apr 2023 13:05:39 +0300
In-Reply-To: <5176b0bc-3727-e939-9776-ee4bfd732e32@xen.org>
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
	 <f1b5ee8652a20b2043965a4de5c2c64f662724bb.1681918194.git.oleksii.kurochko@gmail.com>
	 <34f032df-cbfc-7a97-9a1f-2fa1ce574281@suse.com>
	 <f2978c2ddc1872025f4d939187775c21fd90f074.camel@gmail.com>
	 <509ba3a2-0b85-d758-6915-7975d31a3437@suse.com>
	 <db3a9b3b-63db-89d1-5386-57eb7044b317@xen.org>
	 <d157b1e2-cfc5-f7b7-9443-16d1db9a4311@suse.com>
	 <5176b0bc-3727-e939-9776-ee4bfd732e32@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0

Hi Julien,=20
On Mon, 2023-04-24 at 12:08 +0100, Julien Grall wrote:
> > > > > > On 19.04.2023 17:42, Oleksii Kurochko wrote:
> > > > > > > + *
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > + *=C2=A0=C2=A0=C2=A0 Start addr=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 End addr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 Size=C2=A0 |=
 VM
> > > > > > > area
> > > > > > > description
> > > > > > > + *
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > + * FFFFFFFFC0000000 |=C2=A0 FFFFFFFFC0200000 |=C2=A0 2 MB=C2=
=A0 | Xen
> > > > > > > + * FFFFFFFFC0200000 |=C2=A0 FFFFFFFFC0600000 |=C2=A0 4 MB=C2=
=A0 | FDT
> > > > > > > + * FFFFFFFFC0600000 |=C2=A0 FFFFFFFFC0800000 |=C2=A0 2 MB=C2=
=A0 |
> > > > > > > Fixmap
> > > > > >=20
> > > > > > These are all L2 slot 511 aiui, which may be worth
> > > > > > mentioning
> > > > > > especially since
> > > > > > the top bits don't match the top bits further down in the
> > > > > > table
> > > > > > (because of the
> > > > > > aliasing).
> > > > >=20
> > > > > Than I'll add one more column where I'll put slot number
> > > > >=20
> > > > > >=20
> > > > > > > + *=C2=A0=C2=A0=C2=A0=C2=A0 .................. unused .......=
...........
> > > > > >=20
> > > > > > This is covering slot 510, which again may be worth
> > > > > > mentioning.
> > > > > >=20
> > > > > > > + * 0000003200000000 |=C2=A0 0000007f40000000 | 331 GB |
> > > > > > > Direct map(L2
> > > > > > > slot: 200-509)
> > > > > > > + * 0000003100000000 |=C2=A0 0000003140000000 |=C2=A0 1 GB=C2=
=A0 |
> > > > > > > Frametable(L2
> > > > > > > slot: 196-197)
> > > > > >=20
> > > > > > 1Gb is, if I'm not mistaken, a single L2 slot.
> > > > > Yeah, it can be misunderstood. I meant [196, 197), so 197
> > > > > isn't
> > > > > included. I'll update the table.
> > > > >=20
> > > > > >=20
> > > > > > Also assuming a 32-byte struct page_info (I don't think
> > > > > > you'll get
> > > > > > away with
> > > > > > less than that, when even Arm32 requires this much),
> > > > > > there's a
> > > > > > mismatch
> > > > > > between direct map and frame table size: With 4k pages, the
> > > > > > scaling
> > > > > > factor
> > > > > > would be 128 if I'm not mistaken. So perhaps you really
> > > > > > mean 3Gb here
> > > > > > to
> > > > > > cover for (slightly more than) the 331Gb of memory you mean
> > > > > > to be
> > > > > > able to
> > > > > > map?
> > > > > For RV64 page_info size will be 56-byte and 32-byte for RV32
> > > > > but you
> > > > > are right it should 3 Gb in that case what will be enough (
> > > > > taking into
> > > > > account both available sizes of page_info structure ).
> > > >=20
> > > > As to the plan to it being 56 bytes (i.e. like on Arm): Arm
> > > > forever has
> > > > had a 64-bit padding field at the end. My best guess is that
> > > > the field
> > > > was introduced to have a 32-byte struct on Arm32.
> > >=20
> > > I can't exactly remember. But I would like to rework the struct
> > > page_info on Arm64 because...
> > >=20
> > > But then why
> > > > artificially increase the struct from 48 to 56 bytes on Arm64?
> > > > And hence
> > > > why have the same oddity on RV64?
> > >=20
> > >=20
> > > ... with 56 bytes, some struct page_info may cross a cache
> > > boundary.
> >=20
> > I guess that's going to be challenging, unless you mean to go
> > further up
> > to 64 bytes?
>=20
> Yes.
>=20
> >=20
> > > For
> > > RISC-V, I would recommend to make sure the struct page_info will
> > > never
> > > cross a cache boundary.
Do you mean that size(struct page_info) <=3D cache line size?

> >=20
> > Since going up to 64 bytes is wasteful,=20
>=20
> Well yes. But this is a trade-off between performance and memory
> usage.=20
> With the current situation, you may have to pull two cache lines for=20
> struct page_info.
Just for my understanding.

stuct page_info will consume two cache lines (it happens in case of 3
consecutive which exceed the size of the cache line) if they are not
aligned on 64 bytes boundary as cache line size on ARM is 128 ( if
believe to ARM's asm/cache.h ).

Shouldn't alignment ( by adding empty fields inside page_info ) fix an
issue? It looks like if the size of page_info will not be aligned that
it will be always performance issue.

>=20
> I suspect you might see some slow down when using the grant. But I
> don't=20
> have any concrete numbers.
>=20
> > and going down to 32 bytes likely
> > isn't going to be easy, sticking to 48 bytes for now would seem
> > reasonable
> > to me.
>=20
> It may be more difficult to argue for an increase (if we notice any=20
> performance degradation) in the future because this would reduce the=20
> memory usable for every users.
>=20
> Anyway, I haven't fully explore the problem on Arm yet and it is=20
> possible we could deal with any performance degradation differently=20
> (e.g. re-order the field and/or slightly increasing/decreasing the
> size).
>=20
> I thought I would point it out just in case the RISC-V folks care
> about it.
I think it will be useful as RISC-V uses the same page_info structure.

~ Oleksii

