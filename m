Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE43952B65
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 12:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777957.1188024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seXHP-00084X-KE; Thu, 15 Aug 2024 10:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777957.1188024; Thu, 15 Aug 2024 10:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seXHP-00082P-Fz; Thu, 15 Aug 2024 10:00:27 +0000
Received: by outflank-mailman (input) for mailman id 777957;
 Thu, 15 Aug 2024 10:00:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQtD=PO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1seXHO-00082J-AQ
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 10:00:26 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30463ed4-5aed-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 12:00:23 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ef2cb7d562so9907261fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 03:00:23 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f3b746cd19sm1586201fa.24.2024.08.15.03.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 03:00:22 -0700 (PDT)
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
X-Inumbo-ID: 30463ed4-5aed-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723716023; x=1724320823; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x1TWozIkPnj7zjENZ/yfuGdZRU6BVRmhcSV3R0ftWQc=;
        b=bbvvnP3QKGnpBIBtiOKUgOBQOWRlmQCJsYd8oy2I8pvW24iCXsXzMZgYoxyfDXDoVn
         lPHoWFNxDoxx8VjZomydy+/Cijgnno/brpBo5JQ8+tz8Gq3AkFg+AW2l/EPcYNIPhmnD
         Htyif5S8JTqNOGEzTOYIr3rYIpYjhDoOjOcw9kqDOF/0N0uyB7BoPi+6n1XhrE2r70OI
         OmvAspHTCgpwcokK5gy0AdlcuV7zCj4C1zzfAuitdc3w3S8ycjKiHer7zPedR+D3Yf2i
         3PuZ3ICH0CT7eGByEDHv7t09jG8H/uaAkPvuUQ/rgIn7maBUsk+o/U6GSYpmge8fSbHI
         hMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723716023; x=1724320823;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x1TWozIkPnj7zjENZ/yfuGdZRU6BVRmhcSV3R0ftWQc=;
        b=TzAdUO/tHQwmJVL/Sl93iarpqnWWe45867CUVXBiR0plUoiAq9QkIl99vxQUBnbzU7
         MfCOHEbTG8A82KvEzvaDFLtYYq5O9iHLBGCqE7SciXQCNaLsQFd6tEUc41Sd9IAQTuMR
         xBZ4dXo5w8E6NvekiUIEOOmATzj7EW0wMGwrNZ87KIUlU/FtCriOn3ynS47U3BrZbh7i
         W/pQAFUoVndHcggcPB9A53qnLiLbwGDTJMOWLI223lsN6+HyuHKKUOX/rQraDZjZWSxE
         CosVSP/KXQ/e6uK71xq1Jsq+58RAWhIuPZ8czPMR9jP2wz08B/O9AW+7+/uqQJp1QGo6
         ss9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVG7vJH6RARoCGAVK7+m+EwJA6q0frIoRdE8c5Kxw6gTus6/7g3ErJFstFuJpw9skMpClfnQHtsM/AeHnMhEPpCBeisFg9fMdizqHtQK1A=
X-Gm-Message-State: AOJu0YynIopYPDZk1klBjXlW52dZJ+a5zu8w/RlDtTYqr3VabnHGQ2s5
	/HW6UT/yvLCDRNkMiNgsQdn9XzoQt4BMgPBXisWpJ2D/OGVY7qpx
X-Google-Smtp-Source: AGHT+IFpLQOpCKgS3Os0xrAzU9u+ro/Hgw9Z3WbqwaN5max879pMF5Am0ATtFzo8nhvs0W15uiYQ7w==
X-Received: by 2002:a2e:b895:0:b0:2ee:5ec1:1838 with SMTP id 38308e7fff4ca-2f3aa1de8b9mr44243591fa.30.1723716022574;
        Thu, 15 Aug 2024 03:00:22 -0700 (PDT)
Message-ID: <f23aadf93c41b6045cfc5879b5b287ada7c9ef7b.camel@gmail.com>
Subject: Re: [PATCH v4 5/7] xen/riscv: introduce and initialize SBI RFENCE
 extension
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2024 12:00:21 +0200
In-Reply-To: <959f33b6-3649-45b3-8f31-ec494e60fd80@suse.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
	 <1a863d06866f86761d23e6da3f4a6ee58c474473.1723214540.git.oleksii.kurochko@gmail.com>
	 <77ff59d1-b158-4603-bdbd-67c079ce87c9@suse.com>
	 <34cbaff323d9619f8d4cb1d2b8ed12584037ee0d.camel@gmail.com>
	 <959f33b6-3649-45b3-8f31-ec494e60fd80@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-08-14 at 17:53 +0200, Jan Beulich wrote:
> On 14.08.2024 17:41, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-08-13 at 11:34 +0200, Jan Beulich wrote:
> > > On 09.08.2024 18:19, Oleksii Kurochko wrote:
> > > > +static unsigned long sbi_major_version(void)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 return (sbi_spec_version >> SBI_SPEC_VERSION_MA=
JOR_SHIFT)
> > > > &
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SBI_SPEC_VERSION_MAJOR_=
MASK;
> > > > +}
> > >=20
> > > Can you use MASK_EXTR() here, allowing to even drop the separate
> > > SBI_SPEC_VERSION_MAJOR_SHIFT?
> > I am not sure that:
> > (sbi_spec_version >> SBI_SPEC_VERSION_MAJOR_SHIFT) &=20
> > SBI_SPEC_VERSION_MAJOR_MASK =3D=3D MASK_EXTR(sbi_spec_version,
> > SBI_SPEC_VERSION_MAJOR_MASK)
>=20
> How come you're not sure? That's precisely what MASK_EXTR() is for.
As the order matter here. First should be shift then applying
SBI_SPEC_VERSION_MAJOR_MASK, as SBI_SPEC_VERSION_MAJOR_MASK is defined
now as 7f. If SBI_SPEC_VERSION_MAJOR_MASK set to 0x7F000000 then it
will work.

>=20
> > > > +static long sbi_ext_base_func(long fid)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 struct sbiret ret;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 ret =3D sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0=
, 0, 0);
> > > > +=C2=A0=C2=A0=C2=A0 if ( !ret.error )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret.value;
> > > > +=C2=A0=C2=A0=C2=A0 else
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret.error;
> > >=20
> > > With the folding of two distinct values, how is the caller going
> > > to
> > > tell failure from success?
> > By checking if the return value is < 0.
> > According to the SBI spec [
> > https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/binary-e=
ncoding.adoc?plain=3D1#L32
> > ] ret.error can be or 0 ( which means success ) or something < 0 if
> > it
> > was a failure.
>=20
> Right. And what if ret.error was 0, but ret.value was negative?
I wasn't able to find a case in the SBI spec where sbiret.value could
be negative. Unfortunately, the spec does not specify the possible
values of sbiret.value, but based on the description of the SBI
function, it only returns a negative value in the case of an error.
Otherwise, ret.value is always greater than or equal to 0.

>=20
> > > > +int sbi_remote_sfence_vma(cpumask_t *cpu_mask,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long start_addr,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long size)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENC=
E_VMA,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp=
u_mask, start_addr, size, 0, 0);
> > >=20
> > > No check (not even an assertion) here for __sbi_rfence still
> > > being
> > > NULL?
> > I thought that it would be enough to have BUG_ON() in sbi_init()
> > but
> > then probably would be better to update the message inside
> > BUG_ON():
> > =C2=A0=C2=A0 int __init sbi_init(void)
> > =C2=A0=C2=A0 {
> > =C2=A0=C2=A0 ....
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !sbi_has_rfence() )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("At=
 the moment flush_xen_tlb_range_va() uses SBI
> > rfence
> > =C2=A0=C2=A0 to "
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "flush TLB for all CPUS!");
>=20
> I never really liked this kind of BUG_ON(). I leave it uncommented in
> code which clearly is only temporary. Plus imo such BUG_ON()s want to
> be next to where the risk is, i.e. in this case ahead of the possible
> NULL deref. Then again, without PV guests and without anything mapped
> at VA 0, you'll crash cleanly anyway. So perhaps my request to add a
> check went too far.
But then there is not big difference whether BUG_ON() or ASSERT()
inside sbi_remote_sfence_vma() is present. Even none of the check
present it will be a crash anyway.

And the other reason why I thought it would be better to have BUG_ON()
in sbi_init() as it will be need only one BUG_ON() instead of having
ASSERT() in each function which will use __sbi_rfence().

And according to coding-best-practices.pandoc:
```
 * Programmers can use ASSERT(), which will cause the check to be
   executed in DEBUG builds, and cause the hypervisor to crash if it's
   violated
 * Programmers can use BUG_ON(), which will cause the check to be
   executed in both DEBUG and non-DEBUG builds, and cause the
hypervisor
   to crash if it's violated.
```
The difference between them is only the check is working only in DEBUG
build or both in DEBUG and non-DEBUG.

~ Oleksii

