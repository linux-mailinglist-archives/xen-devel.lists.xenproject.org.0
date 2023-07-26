Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ACB763BAC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 17:54:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570575.892483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgqN-0008CN-JN; Wed, 26 Jul 2023 15:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570575.892483; Wed, 26 Jul 2023 15:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOgqN-0008AH-GU; Wed, 26 Jul 2023 15:54:31 +0000
Received: by outflank-mailman (input) for mailman id 570575;
 Wed, 26 Jul 2023 15:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oEth=DM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qOgqM-0008A9-Gf
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 15:54:30 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4184d45-2bcc-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 17:54:29 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fdd14c1fbfso10924640e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 08:54:29 -0700 (PDT)
Received: from [192.168.202.116] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a19f510000000b004fb964d48e6sm3366507lfb.95.2023.07.26.08.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 08:54:27 -0700 (PDT)
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
X-Inumbo-ID: b4184d45-2bcc-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690386868; x=1690991668;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fDaekb2eZKhs05UpY7NvEXKQr60RjhtMKkrszbB5REE=;
        b=opFDl23ijlVnlrQbaptVD7/2ee4gDTmZ8TWIuOfD4vg9+vI8Zi9REOA5IFNoFnCyy4
         KNfPblirDYaqThukkdxPp65DpUATgMBoZbPcfCHXjS10NYEBxS5R7DVJlAA3TH+pIEc0
         /O4L65DbpfJ49ys2shrb9Q0w+uzGLGUWQze5RIpogwCwA3TZLfaJ8QSJ8MQHOYB3CaBc
         MJgUExdH8dQGWtA5sDg7GbqLpuG5YTvHc/Lbg3ohc2Zcha2U8GIKTAcC9sB8l68sEuQH
         8hx9J2meTS8Iy+dzpZXtJ2lG6Mgy6w4wG9Jhjklas8/psGVe5kJa84oivcxizAjx2PXT
         gMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690386868; x=1690991668;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fDaekb2eZKhs05UpY7NvEXKQr60RjhtMKkrszbB5REE=;
        b=jlfkgA1pDptaVgj/WnChCXk422mz+cvPAmxkHxrsqcRGhr2r9ZAOA0i/8RBiEO/H4q
         P8EnUQ97kDPvI/hd0jzl5ARRrjR5Zu/xr0itETlxNIVGd5OPSObBFsaV+cJJL7lnf7Y1
         0olrhBgeph++bkPT/J/Waj3w6bbLC4P2v4Cszt/AEOr9BKihCMHfcan8hLPAuQTiJG+X
         F/xjATV0OEkg9pn/8PQs1lPePESOR9ArFNtW+AOMbYszyIY23QGE/ckQi1+Wf+HcmIuH
         rBZ6WTiT8aAtVozPcKt7p8Qgn9DV+N+xgzaG9msv2mi9YNZ+U+5aOSr2eBPb7ltoTBou
         fhjQ==
X-Gm-Message-State: ABy/qLZNBCEJ0uh0Q3ftz/+q8O8RelmjdYe/5/qbmvYDSUT5n7eDHqTO
	BmD9FWMiPR/dPdN3vOlpV94=
X-Google-Smtp-Source: APBJJlGT9Q7CuaS5SG770G3TudrQQz9JgJObA8PUdlrA9XzulO8Rud/L8vqhPLPvzWace/wGm0aSZQ==
X-Received: by 2002:a05:6512:6c4:b0:4f8:77db:1d9e with SMTP id u4-20020a05651206c400b004f877db1d9emr1667151lff.12.1690386868195;
        Wed, 26 Jul 2023 08:54:28 -0700 (PDT)
Message-ID: <dee3624525f9530aaf3252c6c4fa6eb5262e76cd.camel@gmail.com>
Subject: Re: [PATCH v4 2/2] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 26 Jul 2023 18:54:27 +0300
In-Reply-To: <5a40abd4-edc2-0de0-99ed-d23174940d66@suse.com>
References: <cover.1690191480.git.oleksii.kurochko@gmail.com>
	 <a8ab1829ab718dda869db3df3348ded211e81967.1690191480.git.oleksii.kurochko@gmail.com>
	 <a370548e30aaa8c1160ecd5f2eccfcc10002a8f9.camel@gmail.com>
	 <6675f535-7cf7-dd55-4ebe-82ba486029f7@suse.com>
	 <4deb8c44cf639af66ad7f5b9b42180554e08d5cf.camel@gmail.com>
	 <5a40abd4-edc2-0de0-99ed-d23174940d66@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-07-26 at 17:00 +0200, Jan Beulich wrote:
> On 26.07.2023 15:12, Oleksii wrote:
> > On Wed, 2023-07-26 at 13:58 +0200, Jan Beulich wrote:
> > > On 26.07.2023 13:23, Oleksii wrote:
> > > > I would like to ask for advice on whether it would be easier,
> > > > less
> > > > bug-
> > > > provoking ( during identity mapping to remove of whole Xen ) to
> > > > have a
> > > > separate identity section that won't be more than PAGE_SIZE.
> > >=20
> > > I'm afraid you can't safely do this in C, or at least not without
> > > further checking on what the compiler actually did.
> > >=20
> > > > @@ -264,6 +268,19 @@ void __init enable_mmu(void)
> > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RV_STAGE1_MO=
DE << SATP_MODE_SHIFT);
> > > > =C2=A0}
> > > > =C2=A0
> > > > +void __attribute__((naked)) __section(".ident")
> > > > turn_on_mmu(unsigned
> > > > long ra)
> > >=20
> > > Did you read what gcc doc says about "naked"? Extended asm()
> > > isn't
> > > supported there. Since ...
> > >=20
> > > > +{
> > > > + =C2=A0 =C2=A0/* Ensure page table writes precede loading the SATP=
 */
> > > > + =C2=A0 =C2=A0sfence_vma();
> > > > +
> > > > + =C2=A0 =C2=A0/* Enable the MMU and load the new pagetable for Xen=
 */
> > > > + =C2=A0 =C2=A0csr_write(CSR_SATP,
> > > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PFN_DOWN((unsigne=
d long)stage1_pgtbl_root) |
> > > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RV_STAGE1_MODE <<=
 SATP_MODE_SHIFT);
> > > > +
> > > > + =C2=A0 =C2=A0asm volatile( "jr %0\n" : : "r"(ra) );
> > > > +}
> > >=20
> > > ... none of this really requires C, I think we're at the point
> > > where
> > > (iirc) Andrew's and my suggestion wants following, moving this to
> > > assembly code (at which point it doesn't need to be a separate
> > > function). You can still build page tables in C, of course.
> > > (Likely
> > > you then also won't need a separate section; some minimal
> > > alignment
> > > guarantees ought to suffice to make sure the critical code is
> > > confined to a single page.)
> >=20
> > Thanks. I'll move all of this to assembly code.
> > Regarding alignment it is needed alignment on start and end of
> > function:
> > =C2=A0=C2=A0=C2=A0 .balign PAGE_SIZE
> > =C2=A0=C2=A0=C2=A0 GLOBAL(turn_on_mmu)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> > =C2=A0=C2=A0=C2=A0 .balign PAGE_SIZE
> > =C2=A0=C2=A0=C2=A0 ENDPROC(turn_on_mmu)
> >=20
> > Does the better way exist?
>=20
> The function is only going to be a handful of instructions. Its
> alignment doesn't need to be larger than the next power of 2. I
> expect you'll be good with 64-byte alignment. (In no case do you
> need to align the end of the function: Putting other stuff there
> is not a problem at all.) What you want in any event is a build
> time check that the within-a-page constraint is met.
But shouldn't be an address be aligned to a boundary equal to page
size?

According to the RISC-V privileged spec:
Any level of PTE may be a leaf PTE, so in addition to 4 KiB pages, Sv39
supports 2 MiB megapages
and 1 GiB gigapages, each of which must be virtually and physically
aligned to a boundary equal
to its size. A page-fault exception is raised if the physical address
is insufficiently aligned.

~ Oleksii

