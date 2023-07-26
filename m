Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B1F763EB8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 20:41:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570687.892754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOjQN-0006Li-HO; Wed, 26 Jul 2023 18:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570687.892754; Wed, 26 Jul 2023 18:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOjQN-0006J0-Eb; Wed, 26 Jul 2023 18:39:51 +0000
Received: by outflank-mailman (input) for mailman id 570687;
 Wed, 26 Jul 2023 18:39:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEth=DM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qOjQM-0006Iu-9y
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 18:39:50 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc720c75-2be3-11ee-b243-6b7b168915f2;
 Wed, 26 Jul 2023 20:39:48 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fde022de07so169967e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 11:39:48 -0700 (PDT)
Received: from [192.168.202.116] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h4-20020ac25964000000b004fe142afd1esm217505lfp.152.2023.07.26.11.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 11:39:47 -0700 (PDT)
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
X-Inumbo-ID: cc720c75-2be3-11ee-b243-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690396788; x=1691001588;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M74KkJWeLhXF7Leg8AJ/X7+H++Tcs2iotik08Z3CZAk=;
        b=Hj32TAUfFhWjCbyFr/FTlDfQTedJcHxshSt3fLNptNH/miHbAVGTQX2mgK9gIH0w4N
         uRsZVMFDtImOarr0nlS4jSbULvhhxjNZ0chSQmpuEcqxNSTpuvaPqibKcq6US0jcP3nh
         JVfZyst93Nj5utKGUR7ujeowZ8EG0Bgym/Bq/TkA0vtMrMFOIAvKEJSDu8MwZxgKX3fE
         cRZoSEbX/wLD2fJp5Fu6OIM+0KCBnTf+A0GIbtcnrB7SYXrsQgcr3SnoOjRLr5ayvJdE
         /7OPVEEGq6CbLaZTBHDrRdW+VNsdcCvJtiQH7Swtl1BCHh8z+bNJwAP8Gzynywass7dl
         vc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690396788; x=1691001588;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M74KkJWeLhXF7Leg8AJ/X7+H++Tcs2iotik08Z3CZAk=;
        b=ZJYAot+IO7z1w7LWdGhMbtMd4uyJx3PP/1WCqeKS2uuUPXJbnZz0xBT+wl7us8P9cZ
         siMQcfdHHqr5wGRplaCDen8oxhwKzCmx1cXuak0XmNAJ9+UpBMxaW5XJJJEA5cR3uQHN
         FLIY1YvkS80u49ti9uOzc9EIDh7oLDmXdSZZgsCThdRinZyfvjLuwgfjlaUVaPcTy9uF
         jTMQJPU1zG7gMBdkiPabcMmVGRNJG9F0Ydb7sDglWcHGW0fHPgzbXDwO7RXeylDVP7OX
         PlEgLlKG0J2cxG1mo7nV2Xr33T6O8ux+F6TGGGYSdS16SSg2HkpzefkyM2y3dZ7pChdV
         GYCQ==
X-Gm-Message-State: ABy/qLbVDs5Kmxn0fUsxh+kxvzwSuvm3XOyTHqE/KQKrSLdn2BqTT8dw
	BeSMrMBKinUVCG7AtdE67b4=
X-Google-Smtp-Source: APBJJlHJvbo9x7CqkCFgI2JGqDCqQMih7Q65Mz9B1ICJ8Qp5BZ+r5qca8DTC7sbM2aSjXjINQA37Xw==
X-Received: by 2002:a05:6512:1146:b0:4fb:a990:bb28 with SMTP id m6-20020a056512114600b004fba990bb28mr17697lfg.18.1690396787456;
        Wed, 26 Jul 2023 11:39:47 -0700 (PDT)
Message-ID: <b219699f928b9e86a3b0af9656bfe0e083d3cfdc.camel@gmail.com>
Subject: Re: [PATCH v4 2/2] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 26 Jul 2023 21:39:46 +0300
In-Reply-To: <79b20131-46c2-9e54-e615-18a346b83b8d@suse.com>
References: <cover.1690191480.git.oleksii.kurochko@gmail.com>
	 <a8ab1829ab718dda869db3df3348ded211e81967.1690191480.git.oleksii.kurochko@gmail.com>
	 <a370548e30aaa8c1160ecd5f2eccfcc10002a8f9.camel@gmail.com>
	 <6675f535-7cf7-dd55-4ebe-82ba486029f7@suse.com>
	 <4deb8c44cf639af66ad7f5b9b42180554e08d5cf.camel@gmail.com>
	 <5a40abd4-edc2-0de0-99ed-d23174940d66@suse.com>
	 <dee3624525f9530aaf3252c6c4fa6eb5262e76cd.camel@gmail.com>
	 <79b20131-46c2-9e54-e615-18a346b83b8d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-07-26 at 17:59 +0200, Jan Beulich wrote:
> On 26.07.2023 17:54, Oleksii wrote:
> > On Wed, 2023-07-26 at 17:00 +0200, Jan Beulich wrote:
> > > On 26.07.2023 15:12, Oleksii wrote:
> > > > On Wed, 2023-07-26 at 13:58 +0200, Jan Beulich wrote:
> > > > > On 26.07.2023 13:23, Oleksii wrote:
> > > > > > I would like to ask for advice on whether it would be
> > > > > > easier,
> > > > > > less
> > > > > > bug-
> > > > > > provoking ( during identity mapping to remove of whole Xen
> > > > > > ) to
> > > > > > have a
> > > > > > separate identity section that won't be more than
> > > > > > PAGE_SIZE.
> > > > >=20
> > > > > I'm afraid you can't safely do this in C, or at least not
> > > > > without
> > > > > further checking on what the compiler actually did.
> > > > >=20
> > > > > > @@ -264,6 +268,19 @@ void __init enable_mmu(void)
> > > > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RV_STAGE=
1_MODE << SATP_MODE_SHIFT);
> > > > > > =C2=A0}
> > > > > > =C2=A0
> > > > > > +void __attribute__((naked)) __section(".ident")
> > > > > > turn_on_mmu(unsigned
> > > > > > long ra)
> > > > >=20
> > > > > Did you read what gcc doc says about "naked"? Extended asm()
> > > > > isn't
> > > > > supported there. Since ...
> > > > >=20
> > > > > > +{
> > > > > > + =C2=A0 =C2=A0/* Ensure page table writes precede loading the =
SATP
> > > > > > */
> > > > > > + =C2=A0 =C2=A0sfence_vma();
> > > > > > +
> > > > > > + =C2=A0 =C2=A0/* Enable the MMU and load the new pagetable for=
 Xen
> > > > > > */
> > > > > > + =C2=A0 =C2=A0csr_write(CSR_SATP,
> > > > > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PFN_DOWN((uns=
igned long)stage1_pgtbl_root) |
> > > > > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RV_STAGE1_MOD=
E << SATP_MODE_SHIFT);
> > > > > > +
> > > > > > + =C2=A0 =C2=A0asm volatile( "jr %0\n" : : "r"(ra) );
> > > > > > +}
> > > > >=20
> > > > > ... none of this really requires C, I think we're at the
> > > > > point
> > > > > where
> > > > > (iirc) Andrew's and my suggestion wants following, moving
> > > > > this to
> > > > > assembly code (at which point it doesn't need to be a
> > > > > separate
> > > > > function). You can still build page tables in C, of course.
> > > > > (Likely
> > > > > you then also won't need a separate section; some minimal
> > > > > alignment
> > > > > guarantees ought to suffice to make sure the critical code is
> > > > > confined to a single page.)
> > > >=20
> > > > Thanks. I'll move all of this to assembly code.
> > > > Regarding alignment it is needed alignment on start and end of
> > > > function:
> > > > =C2=A0=C2=A0=C2=A0 .balign PAGE_SIZE
> > > > =C2=A0=C2=A0=C2=A0 GLOBAL(turn_on_mmu)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> > > > =C2=A0=C2=A0=C2=A0 .balign PAGE_SIZE
> > > > =C2=A0=C2=A0=C2=A0 ENDPROC(turn_on_mmu)
> > > >=20
> > > > Does the better way exist?
> > >=20
> > > The function is only going to be a handful of instructions. Its
> > > alignment doesn't need to be larger than the next power of 2. I
> > > expect you'll be good with 64-byte alignment. (In no case do you
> > > need to align the end of the function: Putting other stuff there
> > > is not a problem at all.) What you want in any event is a build
> > > time check that the within-a-page constraint is met.
> > But shouldn't be an address be aligned to a boundary equal to page
> > size?
> >=20
> > According to the RISC-V privileged spec:
> > Any level of PTE may be a leaf PTE, so in addition to 4 KiB pages,
> > Sv39
> > supports 2 MiB megapages
> > and 1 GiB gigapages, each of which must be virtually and physically
> > aligned to a boundary equal
> > to its size. A page-fault exception is raised if the physical
> > address
> > is insufficiently aligned.
>=20
> You'd simply map the page containing the chunk, i.e. masking off the
> low 12 bits. If far enough away from the Xen virtual range, you could
> as well map a 2M page masking off the low 21 bits, or a 1G page with
> the low 30 bits of the address cleared.
Agree, then it will work.

But still it doesn't clear what to do if turn_on_mmu will be bigger
then 64 ( ASSERT( (turn_on_mmu_end - turn_on_mmu) <=3D 64 ) somewhere in
xen.lds.S ). Right now turn_on_mmu() function is 0x22 bytes and it is
enough ( we are sure that we don't cross 4k boundary ) to be 64-byte
aligned. But if the size will be more then 64 bytes then the alignment
need to be changed to 0x128.
Am i right?


~ Oleksii

