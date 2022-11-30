Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E482863DA6F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 17:22:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449988.707072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0PqW-0003ti-5T; Wed, 30 Nov 2022 16:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449988.707072; Wed, 30 Nov 2022 16:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0PqW-0003r2-2W; Wed, 30 Nov 2022 16:22:04 +0000
Received: by outflank-mailman (input) for mailman id 449988;
 Wed, 30 Nov 2022 16:22:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJqx=36=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1p0PqU-0003qw-HN
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 16:22:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1df101fa-70cb-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 17:22:00 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55AEFD6E;
 Wed, 30 Nov 2022 08:22:06 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66FCC3F67D;
 Wed, 30 Nov 2022 08:21:58 -0800 (PST)
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
X-Inumbo-ID: 1df101fa-70cb-11ed-8fd2-01056ac49cbb
Date: Wed, 30 Nov 2022 16:21:56 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>, bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Rahul Singh
 <rahul.singh@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Julien
 Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: Arm: AArch32: Need suggestions to support 32 bit physical
 addresses
Message-ID: <20221130162156.28b51eb8@donnerap.cambridge.arm.com>
In-Reply-To: <4e84c85c-7e2f-38b1-a235-5323a77738e7@amd.com>
References: <70651dbc-085d-706d-17d0-a419086a0700@amd.com>
	<a352eb18-0ae6-a1f3-08e6-87f53494ad8a@xen.org>
	<65891843-db28-e5dd-6e9e-3fb003fcabc5@amd.com>
	<ddeb7a03-cab3-2a26-7f64-3a1b5f0882d6@xen.org>
	<105a0d45-5b3d-7986-92c1-9a13eb803bd8@amd.com>
	<22d28805-8889-25e9-6d18-c868bf5e51bb@suse.com>
	<20221130131316.13ebf9d1@donnerap.cambridge.arm.com>
	<4e84c85c-7e2f-38b1-a235-5323a77738e7@amd.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Nov 2022 15:39:56 +0000
Ayan Kumar Halder <ayankuma@amd.com> wrote:

Hi Ayan,

> On 30/11/2022 13:13, Andre Przywara wrote:
> > On Wed, 30 Nov 2022 08:09:53 +0100
> > Jan Beulich <jbeulich@suse.com> wrote:
> >
> > Hi Ayan, =20
> Hi Andre,
> > =20
> >> On 29.11.2022 19:18, Ayan Kumar Halder wrote: =20
> >>> On 29/11/2022 15:52, Julien Grall wrote: =20
> >>>> On 29/11/2022 16:23, Ayan Kumar Halder wrote: =20
> >>>>> On 29/11/2022 14:52, Julien Grall wrote: =20
> >>>>>> On 29/11/2022 14:57, Ayan Kumar Halder wrote: =20
> >>>>> --- a/xen/common/page_alloc.c
> >>>>> +++ b/xen/common/page_alloc.c
> >>>>> @@ -2245,7 +2245,9 @@ void __init xenheap_max_mfn(unsigned long mfn)
> >>>>>  =C2=A0=C2=A0{
> >>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(!first_node_initialised);
> >>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(!xenheap_bits);
> >>>>> +#ifndef CONFIG_AARCH32_V8R
> >>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(PADDR_BITS >=3D BITS_P=
ER_LONG);
> >>>>> +#endif =20
> >>>> BUILD_BUG_ON() are used to indicate that the code would fall over the
> >>>> check pass. I can't find the justification for this change in the
> >>>> commit message. =20
> >>> I had a look at the following commit which introduced this, but I
> >>> couldn't get the explaination for this.
> >>>
> >>> commit 88e3ed61642bb393458acc7a9bd2f96edc337190
> >>> Author: Jan Beulich <jbeulich@suse.com>
> >>> Date:=C2=A0=C2=A0 Tue Sep 1 14:02:57 2015 +0200
> >>>
> >>> @Jan :- Do you know why BUILD_BUG_ON() was introduced ? =20
> >> You've cut too much context - the next line explains this all by itsel=
f,
> >> I think:
> >>
> >>  =C2=A0=C2=A0=C2=A0=C2=A0xenheap_bits=C2=A0=3D=C2=A0min(flsl(mfn=C2=A0=
+=C2=A01)=C2=A0-=C2=A01=C2=A0+=C2=A0PAGE_SHIFT,=C2=A0PADDR_BITS);
> >>
> >> Clearly addresses used for the Xen heap need to be representable in an
> >> unsigned long (which we assume to be the same size as void *). =20
> > So I am wondering why you hit that code for your port in the first case?
> > If you check, then ARM32 won't pass this, because PADDR_BITS is 40, whi=
le
> > a long is still 32 bits. =20
>=20
> But, PADDR_BITS should be equal to 32 for R52.
>=20
> Refer Cortex R52 TRM, Section 2.2.12 "Memory Model"
> "...This is because the physical address is always the same as the
>  =C2=A0virtual address...The virtual and physical address can be treated =
as
>  =C2=A0synonyms for Cortex-R52."
>=20
>  From this, I understood that as virtual address is 32 bits for AArch32,=
=20
> so physical address will also be 32 bits.
>=20
> Please correct me if I am misunderstanding ?

This is correct, but it's also a big distraction, as no VMSA means that
most of the traditional Xen code becomes irrelevant, since you cannot map
anything anyways. You have to check how the v8-R64 code handles this, I
guess it uses separate code paths?

> If this is correct, then ...
>=20
> > So digging deeper this is code for the case when we want to map the ent=
ire
> > physical memory into Xen (the Xen heap, or direct map in Linux terms).
> > Which we cannot do for ARM32, and that's why the code is protected by
> > !CONFIG_SEPARATE_XENHEAP, which is forced to 1 for CONFIG_ARM_32 (in a
> > hacked up way, btw). =20
>=20
> we can map entire physical memory into Xen as VA =3D=3D PA.

We cannot map anything to begin with, since we have no tables. So without
mapping, indeed the whole physical memory naturally fits into the CPU
address space. But in any case you must not use this code, as this tries
to *map* something, which we do not support on R-class. Again check what
the v8-R64 code has to say on this topic.

Cheers,
Andre

> > So I think you must just force the same thing for your port, then this
> > code will never be compiled.
> >
> > Does that make sense?
> >
> > Cheers,
> > Andre
> > =20
> >> But I'm afraid there's further context missing for your question: Why
> >> would that construct be a problem in your case? Is it just that you'd
> >> need it to be > rather than the >=3D that's used presently? If so, why
> >> do you add an #ifdef rather than dealing with the (apparent) off-by-1?
> >> (I say "apparent" because I haven't checked whether the >=3D is really
> >> depended upon anywhere.)
> >>
> >> Jan =20


