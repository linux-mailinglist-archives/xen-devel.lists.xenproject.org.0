Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93449764941
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 09:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570814.893012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvjb-0003jg-2s; Thu, 27 Jul 2023 07:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570814.893012; Thu, 27 Jul 2023 07:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvja-0003gQ-Vz; Thu, 27 Jul 2023 07:48:30 +0000
Received: by outflank-mailman (input) for mailman id 570814;
 Thu, 27 Jul 2023 07:48:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SoSB=DN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qOvjZ-0003gK-HT
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 07:48:29 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f89849ec-2c51-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 09:48:27 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so3981890a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 00:48:27 -0700 (PDT)
Received: from [192.168.202.116] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a17090634d300b009890e402a6bsm440946ejb.221.2023.07.27.00.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 00:48:25 -0700 (PDT)
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
X-Inumbo-ID: f89849ec-2c51-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690444106; x=1691048906;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U8NLpW781GKymwKVOk2qo+XyaFk+izYC0ZOXPVUGqDM=;
        b=mL1HeQ6tPfav0tGwbDdw999A+NhFmPi0sRew7Vhv5Y2UcXaRn0ED3N4fYEb6YWLqL8
         Fdbqff4U9w4EBB9v6hTLLCX/+FHR4tP6HUtQp5vDZJ1DgUAZoIrP+7QtL18LHeK4wGod
         JwTtmN4Rf0JqBccoxs1EYddyxOkXjci/Ffp+F88PiRr85PHGiQuFkHgw8RUDoCCdmUcr
         8Akpprmlqrjasy4mtZDl+s0hrFGCAr5v+RbFKnbFPIYkspweeePkj25cCKpofbNc0EUS
         Mc+/YH5nVMNeUR0y1bxMKzkTHMdoIesIPSh70sssvCfTg2Na7sRd+2HRtzCoD2AUK9OK
         6YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690444106; x=1691048906;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U8NLpW781GKymwKVOk2qo+XyaFk+izYC0ZOXPVUGqDM=;
        b=dFkq6B/5DrhD+TIp8VoFTigdcojBCaQv0soTVyBwFygF2lUKMD9tPX/svqK0iKgMgk
         JisFIQO1wcfYQTtPxUFGQLgMjZKOth+TYquHpqungI0uhbU7tbweiKa7A1+UxnMjs6XH
         IvbeiWc/6zwqt3oWHFtpSrretu3G7PuAa9BUffqz6b7RaXrVmMLV3H3J2MNudiyyUqeN
         7Jvci8Ezt8QIdlYUZP/ECi3zBnVSrxyHZHrL56zvQVUlV1I9zChm1mwqog43D0DzF6G6
         k7G3vtyYl4hAvZ3+STpLEWV3JecTdE16xgPhAVZrkrDRTdEIIaVhsNaHTAQH42dycJHf
         kaGQ==
X-Gm-Message-State: ABy/qLZCu9zHBZi3dauptaG7NkuzTOgvrxIvjHKawDAwVDnExDmDcRUy
	cXCVtOhZYGAR1bg+Xb5i4QQ=
X-Google-Smtp-Source: APBJJlHm4qASaXxX5+tYRp4+0LkF1r/Lv0BpJWvZPj/BleMR5MwSQlAHgbNhWXQlaz/HnCMUiI3aiw==
X-Received: by 2002:a17:907:a407:b0:993:da5f:5a9b with SMTP id sg7-20020a170907a40700b00993da5f5a9bmr1574971ejc.8.1690444106274;
        Thu, 27 Jul 2023 00:48:26 -0700 (PDT)
Message-ID: <87318bad13fc380dc6de502b290f7263085729db.camel@gmail.com>
Subject: Re: [PATCH v4 2/2] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Thu, 27 Jul 2023 10:48:25 +0300
In-Reply-To: <53dc4f15-cdff-100e-eeff-f7bad24436a2@suse.com>
References: <cover.1690191480.git.oleksii.kurochko@gmail.com>
	 <a8ab1829ab718dda869db3df3348ded211e81967.1690191480.git.oleksii.kurochko@gmail.com>
	 <a370548e30aaa8c1160ecd5f2eccfcc10002a8f9.camel@gmail.com>
	 <6675f535-7cf7-dd55-4ebe-82ba486029f7@suse.com>
	 <4deb8c44cf639af66ad7f5b9b42180554e08d5cf.camel@gmail.com>
	 <5a40abd4-edc2-0de0-99ed-d23174940d66@suse.com>
	 <dee3624525f9530aaf3252c6c4fa6eb5262e76cd.camel@gmail.com>
	 <79b20131-46c2-9e54-e615-18a346b83b8d@suse.com>
	 <b219699f928b9e86a3b0af9656bfe0e083d3cfdc.camel@gmail.com>
	 <53dc4f15-cdff-100e-eeff-f7bad24436a2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-07-27 at 09:25 +0200, Jan Beulich wrote:
> On 26.07.2023 20:39, Oleksii wrote:
> > On Wed, 2023-07-26 at 17:59 +0200, Jan Beulich wrote:
> > > On 26.07.2023 17:54, Oleksii wrote:
> > > > On Wed, 2023-07-26 at 17:00 +0200, Jan Beulich wrote:
> > > > > On 26.07.2023 15:12, Oleksii wrote:
> > > > > > On Wed, 2023-07-26 at 13:58 +0200, Jan Beulich wrote:
> > > > > > > On 26.07.2023 13:23, Oleksii wrote:
> > > > > > > > I would like to ask for advice on whether it would be
> > > > > > > > easier,
> > > > > > > > less
> > > > > > > > bug-
> > > > > > > > provoking ( during identity mapping to remove of whole
> > > > > > > > Xen
> > > > > > > > ) to
> > > > > > > > have a
> > > > > > > > separate identity section that won't be more than
> > > > > > > > PAGE_SIZE.
> > > > > > >=20
> > > > > > > I'm afraid you can't safely do this in C, or at least not
> > > > > > > without
> > > > > > > further checking on what the compiler actually did.
> > > > > > >=20
> > > > > > > > @@ -264,6 +268,19 @@ void __init enable_mmu(void)
> > > > > > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RV_S=
TAGE1_MODE << SATP_MODE_SHIFT);
> > > > > > > > =C2=A0}
> > > > > > > > =C2=A0
> > > > > > > > +void __attribute__((naked)) __section(".ident")
> > > > > > > > turn_on_mmu(unsigned
> > > > > > > > long ra)
> > > > > > >=20
> > > > > > > Did you read what gcc doc says about "naked"? Extended
> > > > > > > asm()
> > > > > > > isn't
> > > > > > > supported there. Since ...
> > > > > > >=20
> > > > > > > > +{
> > > > > > > > + =C2=A0 =C2=A0/* Ensure page table writes precede loading =
the
> > > > > > > > SATP
> > > > > > > > */
> > > > > > > > + =C2=A0 =C2=A0sfence_vma();
> > > > > > > > +
> > > > > > > > + =C2=A0 =C2=A0/* Enable the MMU and load the new pagetable=
 for
> > > > > > > > Xen
> > > > > > > > */
> > > > > > > > + =C2=A0 =C2=A0csr_write(CSR_SATP,
> > > > > > > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PFN_DOWN(=
(unsigned
> > > > > > > > long)stage1_pgtbl_root) |
> > > > > > > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RV_STAGE1=
_MODE << SATP_MODE_SHIFT);
> > > > > > > > +
> > > > > > > > + =C2=A0 =C2=A0asm volatile( "jr %0\n" : : "r"(ra) );
> > > > > > > > +}
> > > > > > >=20
> > > > > > > ... none of this really requires C, I think we're at the
> > > > > > > point
> > > > > > > where
> > > > > > > (iirc) Andrew's and my suggestion wants following, moving
> > > > > > > this to
> > > > > > > assembly code (at which point it doesn't need to be a
> > > > > > > separate
> > > > > > > function). You can still build page tables in C, of
> > > > > > > course.
> > > > > > > (Likely
> > > > > > > you then also won't need a separate section; some minimal
> > > > > > > alignment
> > > > > > > guarantees ought to suffice to make sure the critical
> > > > > > > code is
> > > > > > > confined to a single page.)
> > > > > >=20
> > > > > > Thanks. I'll move all of this to assembly code.
> > > > > > Regarding alignment it is needed alignment on start and end
> > > > > > of
> > > > > > function:
> > > > > > =C2=A0=C2=A0=C2=A0 .balign PAGE_SIZE
> > > > > > =C2=A0=C2=A0=C2=A0 GLOBAL(turn_on_mmu)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> > > > > > =C2=A0=C2=A0=C2=A0 .balign PAGE_SIZE
> > > > > > =C2=A0=C2=A0=C2=A0 ENDPROC(turn_on_mmu)
> > > > > >=20
> > > > > > Does the better way exist?
> > > > >=20
> > > > > The function is only going to be a handful of instructions.
> > > > > Its
> > > > > alignment doesn't need to be larger than the next power of 2.
> > > > > I
> > > > > expect you'll be good with 64-byte alignment. (In no case do
> > > > > you
> > > > > need to align the end of the function: Putting other stuff
> > > > > there
> > > > > is not a problem at all.) What you want in any event is a
> > > > > build
> > > > > time check that the within-a-page constraint is met.
> > > > But shouldn't be an address be aligned to a boundary equal to
> > > > page
> > > > size?
> > > >=20
> > > > According to the RISC-V privileged spec:
> > > > Any level of PTE may be a leaf PTE, so in addition to 4 KiB
> > > > pages,
> > > > Sv39
> > > > supports 2 MiB megapages
> > > > and 1 GiB gigapages, each of which must be virtually and
> > > > physically
> > > > aligned to a boundary equal
> > > > to its size. A page-fault exception is raised if the physical
> > > > address
> > > > is insufficiently aligned.
> > >=20
> > > You'd simply map the page containing the chunk, i.e. masking off
> > > the
> > > low 12 bits. If far enough away from the Xen virtual range, you
> > > could
> > > as well map a 2M page masking off the low 21 bits, or a 1G page
> > > with
> > > the low 30 bits of the address cleared.
> > Agree, then it will work.
> >=20
> > But still it doesn't clear what to do if turn_on_mmu will be bigger
> > then 64 ( ASSERT( (turn_on_mmu_end - turn_on_mmu) <=3D 64 ) somewhere
> > in
> > xen.lds.S ). Right now turn_on_mmu() function is 0x22 bytes and it
> > is
> > enough ( we are sure that we don't cross 4k boundary ) to be 64-
> > byte
> > aligned. But if the size will be more then 64 bytes then the
> > alignment
> > need to be changed to 0x128.
> > Am i right?
>=20
> Well, to 128 (without 0x), but yes. That function isn't very likely
> to
> change much, though.
Thanks.

~ Oleksii


