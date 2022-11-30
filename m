Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCBC63D661
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 14:13:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449895.706921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Mtx-0008B5-Bj; Wed, 30 Nov 2022 13:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449895.706921; Wed, 30 Nov 2022 13:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Mtx-00087q-8C; Wed, 30 Nov 2022 13:13:25 +0000
Received: by outflank-mailman (input) for mailman id 449895;
 Wed, 30 Nov 2022 13:13:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJqx=36=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1p0Mtv-00087k-Nn
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 13:13:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c0aa23b9-70b0-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 14:13:17 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC101D6E;
 Wed, 30 Nov 2022 05:13:27 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0FDE3F73D;
 Wed, 30 Nov 2022 05:13:19 -0800 (PST)
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
X-Inumbo-ID: c0aa23b9-70b0-11ed-8fd2-01056ac49cbb
Date: Wed, 30 Nov 2022 13:13:16 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ayan Kumar Halder <ayankuma@amd.com>, Stefano Stabellini
 <sstabellini@kernel.org>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>, bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Rahul Singh
 <rahul.singh@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Julien
 Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: Arm: AArch32: Need suggestions to support 32 bit physical
 addresses
Message-ID: <20221130131316.13ebf9d1@donnerap.cambridge.arm.com>
In-Reply-To: <22d28805-8889-25e9-6d18-c868bf5e51bb@suse.com>
References: <70651dbc-085d-706d-17d0-a419086a0700@amd.com>
	<a352eb18-0ae6-a1f3-08e6-87f53494ad8a@xen.org>
	<65891843-db28-e5dd-6e9e-3fb003fcabc5@amd.com>
	<ddeb7a03-cab3-2a26-7f64-3a1b5f0882d6@xen.org>
	<105a0d45-5b3d-7986-92c1-9a13eb803bd8@amd.com>
	<22d28805-8889-25e9-6d18-c868bf5e51bb@suse.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Nov 2022 08:09:53 +0100
Jan Beulich <jbeulich@suse.com> wrote:

Hi Ayan,

> On 29.11.2022 19:18, Ayan Kumar Halder wrote:
> > On 29/11/2022 15:52, Julien Grall wrote: =20
> >> On 29/11/2022 16:23, Ayan Kumar Halder wrote: =20
> >>> On 29/11/2022 14:52, Julien Grall wrote: =20
> >>>> On 29/11/2022 14:57, Ayan Kumar Halder wrote: =20
> >>> --- a/xen/common/page_alloc.c
> >>> +++ b/xen/common/page_alloc.c
> >>> @@ -2245,7 +2245,9 @@ void __init xenheap_max_mfn(unsigned long mfn)
> >>> =C2=A0=C2=A0{
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(!first_node_initialised);
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(!xenheap_bits);
> >>> +#ifndef CONFIG_AARCH32_V8R
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(PADDR_BITS >=3D BITS_PER_=
LONG);
> >>> +#endif =20
> >>
> >> BUILD_BUG_ON() are used to indicate that the code would fall over the=
=20
> >> check pass. I can't find the justification for this change in the=20
> >> commit message. =20
> >=20
> > I had a look at the following commit which introduced this, but I=20
> > couldn't get the explaination for this.
> >=20
> > commit 88e3ed61642bb393458acc7a9bd2f96edc337190
> > Author: Jan Beulich <jbeulich@suse.com>
> > Date:=C2=A0=C2=A0 Tue Sep 1 14:02:57 2015 +0200
> >=20
> > @Jan :- Do you know why BUILD_BUG_ON() was introduced ? =20
>=20
> You've cut too much context - the next line explains this all by itself,
> I think:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0xenheap_bits=C2=A0=3D=C2=A0min(flsl(mfn=C2=A0+=C2=
=A01)=C2=A0-=C2=A01=C2=A0+=C2=A0PAGE_SHIFT,=C2=A0PADDR_BITS);
>=20
> Clearly addresses used for the Xen heap need to be representable in an
> unsigned long (which we assume to be the same size as void *).

So I am wondering why you hit that code for your port in the first case?
If you check, then ARM32 won't pass this, because PADDR_BITS is 40, while
a long is still 32 bits.
So digging deeper this is code for the case when we want to map the entire
physical memory into Xen (the Xen heap, or direct map in Linux terms).
Which we cannot do for ARM32, and that's why the code is protected by
!CONFIG_SEPARATE_XENHEAP, which is forced to 1 for CONFIG_ARM_32 (in a
hacked up way, btw).

So I think you must just force the same thing for your port, then this
code will never be compiled.

Does that make sense?

Cheers,
Andre

> But I'm afraid there's further context missing for your question: Why
> would that construct be a problem in your case? Is it just that you'd
> need it to be > rather than the >=3D that's used presently? If so, why
> do you add an #ifdef rather than dealing with the (apparent) off-by-1?
> (I say "apparent" because I haven't checked whether the >=3D is really
> depended upon anywhere.)
>=20
> Jan


