Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9886C45F7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:15:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513199.793861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuXr-0001r2-VW; Wed, 22 Mar 2023 09:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513199.793861; Wed, 22 Mar 2023 09:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuXr-0001om-SX; Wed, 22 Mar 2023 09:14:11 +0000
Received: by outflank-mailman (input) for mailman id 513199;
 Wed, 22 Mar 2023 09:14:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhKM=7O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1peuXq-0001og-Bw
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:14:10 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e52ac10b-c891-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 10:14:06 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id d17so7782837wrb.11
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 02:14:06 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 a6-20020a056000100600b002c8ed82c56csm13381170wrx.116.2023.03.22.02.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 02:14:05 -0700 (PDT)
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
X-Inumbo-ID: e52ac10b-c891-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679476445;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r0hejRiLXI+YUCS+m6+xaR+/dGB2HICt4bgjq4brH8k=;
        b=mIMMfBb9rSvAusCNtkWGInAAOj6baEAyZdYJXFo7GxO9Lt+vXxzGoCmyqDgCkZw/Qk
         JWFzXawjcdjIodD8ulAwOEmpf5sLZiaeq4aWXW5M0agcSLbyEvfQ1mQbw22+ETm/LJAC
         IccwBz2kBk1l1wYr30y1UM0lfC102EXRBagaDJrrm68wDPBiCpSLOZ4MV2LJgWtk2mIG
         fjO7+v+kGmOm0MpVy3OHWftDVysKlUXYdCy6e59Y9f3kTJeRMIYrDOgCztLG5GMjLtJ9
         klgEUsQCzi08KhvZgmUPnyIPvoBU411K5IwHVYVWMQ9jaPtla4s49fizKeRc86Ylq0i7
         /irA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679476445;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r0hejRiLXI+YUCS+m6+xaR+/dGB2HICt4bgjq4brH8k=;
        b=caqcJ8w8klho+uNKbH+1jHkfmQSCjdmW4AQb+1Ld8bGJ7JWt3mAWBX+4xCFJXLOJzc
         6yOsaNpXKo8ZDcT1KkB6xEQGJ8HiLFjVjYN8MLRZ2ersEtkPaD63aXJa490wHAtgU3if
         v52MA7qzI3vJA5dscVQwBi34MsXKrbAZOEhY2fNzhnb/6a/cJQ3L4WYiso/RNLStYj+H
         GMDL60eJTGAVvxdkAhUpWglEQRCydyrIqS45vK17+UbZWhg+UrCyJNx25jJ5dB+2sA3c
         5mNTGLTxrAshmVFvFbhRpo+7crHCERowM+gqzWvF2N2Vxg2Z7jVbJ/ud9V/NcfrKPfW1
         w0mg==
X-Gm-Message-State: AO0yUKVVkd5Hw73k8ok55jd1vOLIoef7J6uj29frnGJiQoKPf9BP0yFH
	U61B8z9YOldhPWhgJ0kwOUc=
X-Google-Smtp-Source: AK7set8IA0C689XNhczCRONguLJH4Jse3bsqmYbipFVr4C9HKiNrzyXhyALSSOK+R9HPXzA4O0n4UA==
X-Received: by 2002:adf:e50e:0:b0:2d4:99f:6701 with SMTP id j14-20020adfe50e000000b002d4099f6701mr4599606wrm.58.1679476445395;
        Wed, 22 Mar 2023 02:14:05 -0700 (PDT)
Message-ID: <01180d39d049c55d24a16ec385e4c4733e5e64a9.camel@gmail.com>
Subject: Re: [PATCH v1 1/3] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>
Date: Wed, 22 Mar 2023 11:14:00 +0200
In-Reply-To: <07088184-3aa4-0e1f-2794-60219c358283@xen.org>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
	 <a145fbbfb166d9f6bd4859b669d23a1f52004b2b.1677250203.git.oleksii.kurochko@gmail.com>
	 <fca300ad-0fd1-70ed-4cd4-82e89f5c3351@xen.org>
	 <a0f3f1ca4277c1f8aeeaf6531d90c5b04c244af9.camel@gmail.com>
	 <98d45f93-b611-1016-45b5-3d7487af261f@xen.org>
	 <e0722b2323c78478f8fd07b515bb607ef168ef1e.camel@gmail.com>
	 <07088184-3aa4-0e1f-2794-60219c358283@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

Hi Julien,

On Tue, 2023-03-21 at 16:25 +0000, Julien Grall wrote:
>=20
>=20
> On 05/03/2023 16:25, Oleksii wrote:
> > Hi Julien,
>=20
> Hi,
>=20
> Sorry for the late answer. I was away for the past couple of weeks.
>=20
> > On Mon, 2023-02-27 at 17:36 +0000, Julien Grall wrote:
> > > Hi Oleksii,
> > >=20
> > > On 27/02/2023 16:52, Oleksii wrote:
> > > > On Sat, 2023-02-25 at 17:53 +0000, Julien Grall wrote:
> > > > > > +/*
> > > > > > + * WARNING: load_addr() and linker_addr() are to be called
> > > > > > only
> > > > > > when the MMU is
> > > > > > + * disabled and only when executed by the primary CPU.=C2=A0
> > > > > > They
> > > > > > cannot refer to
> > > > > > + * any global variable or functions.
> > > > >=20
> > > > > I find interesting you are saying when
> > > > > _setup_initial_pagetables() is
> > > > > called from setup_initial_pagetables(). Would you be able to
> > > > > explain
> > > > > how
> > > > > this is different?
> > > > I am not sure that I understand your question correctly but
> > > > _setup_initial_pagetables() was introduced to map some
> > > > addresses
> > > > with
> > > > write/read flag. Probably I have to rename it to something that
> > > > is
> > > > more
> > > > clear.
> > >=20
> > > So the comment suggests that you code cannot refer to global
> > > functions/variables when the MMU is off. So I have multiple
> > > questions:
> > > =C2=A0=C2=A0=C2=A0 * Why only global? IOW, why static would be OK?
> > > =C2=A0=C2=A0=C2=A0 * setup_initial_pagetables() has a call to
> > > _setup_initial_pagetables() (IOW referring to another function).
> > > Why
> > > is
> > > it fine?
> > > =C2=A0=C2=A0=C2=A0 * You have code in the next patch referring to glo=
bal
> > > variables
> > > (mainly _start and _end). How is this different?
> > >=20
> > > > >=20
> > > > > > + */
> > > > > > +
> > > > > > +/*
> > > > > > + * Convert an addressed layed out at link time to the
> > > > > > address
> > > > > > where it was loaded
> > > > >=20
> > > > > Typo: s/addressed/address/ ?
> > > > Yes, it should be address. and 'layed out' should be changed to
> > > > 'laid
> > > > out'...
> > > > >=20
> > > > > > + * by the bootloader.
> > > > > > + */
> > > > >=20
> > > > > Looking at the implementation, you seem to consider that any
> > > > > address
> > > > > not
> > > > > in the range [linker_addr_start, linker_addr_end[ will have a
> > > > > 1:1
> > > > > mappings.
> > > > >=20
> > > > > I am not sure this is what you want. So I would consider to
> > > > > throw
> > > > > an
> > > > > error if such address is passed.
> > > > I thought that at this stage and if no relocation was done it
> > > > is
> > > > 1:1
> > > > except the case when load_addr_start !=3D linker_addr_start.
> > >=20
> > > The problem is what you try to map one to one may clash with the
> > > linked
> > > region for Xen. So it is not always possible to map the region
> > > 1:1.
> > >=20
> > > Therefore, I don't see any use for the else part here.
> > Got it. Thanks.
> >=20
> > I am curious than what is the correct approach in general to handle
> > this situation?
> There are multiple approach to handle it and I don't know which one=20
> would be best :). Relocation is one...
>=20
> > I mean that throw an error it is one option but if I would like to
> > do
> > that w/o throwing an error. Should it done some relocation in that
> > case?
> ... solution. For Arm, I decided to avoid relocation it requires more
> work in assembly.
>=20
> Let me describe what we did and you can decide what you want to do in
> RISC-V.
>=20
> For Arm64, as we have plenty of virtual address space, I decided to=20
> reshuffle the layout so Xen is running a very high address (so it is=20
> unlikely to clash).
I thought about running Xen very high address.
Thanks. I think it is a nice option to do the same for RISC-V64.

>=20
> For Arm32, we have a smaller address space (4GB) so instead we are
> going=20
> through a temporary area to enable the MMU when the load and runtime=20
> region clash. The sequence is:
>=20
> =C2=A0=C2=A0 1) Map Xen to a temporary area
> =C2=A0=C2=A0 2) Enable the MMU and jump to the temporary area
> =C2=A0=C2=A0 3) Map Xen to the runtime area
> =C2=A0=C2=A0 4) Jump to the runtime area
> =C2=A0=C2=A0 5) Remove the temporary area
>=20
It is the same for RV32. As we don't support RV32 I will use:
  #error "Add support of MMU for RV32"
> [...]
>=20
> > > > > Hmmm... I would actually expect the address to be properly
> > > > > aligned
> > > > > and
> > > > > therefore not require an alignment here.
> > > > >=20
> > > > > Otherwise, this raise the question of what happen if you have
> > > > > region
> > > > > using the same page?
> > > > That map_start &=3D=C2=A0 ZEROETH_MAP_MASK is needed to page number=
 of
> > > > address
> > > > w/o page offset.
> > >=20
> > > My point is why would the page offset be non-zero?
> > I checked a linker script and addresses that passed to
> > setup_initial_mapping() and they are really always aligned so there
> > is
> > no any sense in additional alignment.
>=20
> Ok. I would suggest to add some ASSERT()/BUG_ON() in order to confirm
> this is always the case.
>=20
> [...]
>=20
> > > > >=20
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Create a mapping of the load time a=
ddress range
> > > > > > to...
> > > > > > the
> > > > > > load time address range.
> > > > >=20
> > > > > Same about the line length here.
> > > > >=20
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * This mapping is used at boot time o=
nly.
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > +=C2=A0=C2=A0=C2=A0 _setup_initial_pagetables(second, first, ze=
roeth,
> > > > >=20
> > > > > This can only work if Xen is loaded at its linked address. So
> > > > > you
> > > > > need a
> > > > > separate set of L0, L1 tables for the identity mapping.
> > > > >=20
> > > > > That said, this would not be sufficient because:
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 1) Xen may not be loaded at a 2M boundar=
y (you can
> > > > > control
> > > > > with
> > > > > U-boot, but not with EFI). So this may cross a boundary and
> > > > > therefore
> > > > > need multiple pages.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 2) The load region may overlap the link =
address
> > > > >=20
> > > > > While I think it would be good to handle those cases from the
> > > > > start,
> > > > > I
> > > > > would understand why are not easy to solve. So I think the
> > > > > minimum is
> > > > > to
> > > > > throw some errors if you are in a case you can't support.
> > > > Do you mean to throw some error in load_addr()/linkder_addr()?
> > >=20
> > > In this case, I meant to check if load_addr !=3D linker_addr, then
> > > throw
> > > an error.
> > I am not sure that it is needed now and it is easier to throw an
> > error
> > but is option exist to handler situation when load_addr !=3D
> > linker_addr
> > except throwing an error? relocate?
>=20
> I believe I answered this above.
Yeah, you answered my question completely. Thank you very much.

~ Oleksii

