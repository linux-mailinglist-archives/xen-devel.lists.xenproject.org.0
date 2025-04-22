Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5694EA97B21
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 01:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963757.1354692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7NBi-0005Se-57; Tue, 22 Apr 2025 23:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963757.1354692; Tue, 22 Apr 2025 23:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7NBi-0005RC-20; Tue, 22 Apr 2025 23:38:02 +0000
Received: by outflank-mailman (input) for mailman id 963757;
 Tue, 22 Apr 2025 23:37:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8D33=XI=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u7NBe-0005Qx-SE
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 23:37:59 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ceee8035-1fd2-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 01:37:52 +0200 (CEST)
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
X-Inumbo-ID: ceee8035-1fd2-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745365071; x=1745624271;
	bh=gjP3EGsNseK5YgTfoovawhW3/3/7Cydu7Tdbrr6oyyM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=U3oqeeKG/76KKbeo6YmzGawBvGgEQXtVxT//g42Dy2tAlXWWhFQSXyDsOQuZJ4Lj0
	 nzvk8e//BVhsdIGBcl45NID6eO8/BDIYeiWazyI7/2zGaHuYP6VZuE8G+LQQgArFmF
	 PryNLv+JtaELOkiRNRlhZCLK7r7fEMV/Nxa/DhPds5Z3IcE+KVRXk6btjPnKTG7hYI
	 B05LYcMyizrIOZ1hlDabaH564S0yDEkVI8CGoI7Y3Ox9QZGUBQ5Ne3ep2XeBnlGlpE
	 waghD6SftzkS2SxDlKG4m3WH3vX1lD5QeAfSR/GOqk1BH4ugSrh5/qzWl7f0bPihc7
	 4S91dsr/ZD1yg==
Date: Tue, 22 Apr 2025 23:37:47 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 3/3] xen/domain: rewrite emulation_flags_ok()
Message-ID: <aAgoSHWRDE1cE2LB@starscream>
In-Reply-To: <c14efb79-54c1-438d-813e-15f635813ccc@suse.com>
References: <20250401005224.461325-1-dmukhin@ford.com> <20250401005224.461325-4-dmukhin@ford.com> <c14efb79-54c1-438d-813e-15f635813ccc@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2aa787f89394c56eb03097064500c86b97510a8e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2025 at 05:34:27PM +0200, Jan Beulich wrote:
> On 01.04.2025 02:52, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Rewrite emulation_flags_ok() using XEN_X86_EMU_{OPTIONAL,BASELINE}
> > to simplify future modifications.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Came in the context of NS16550 emulator v3 series:
> >   https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d36=
b31d66c@ford.com/
> >
> > After modifying emulation_flags_ok() with a new NS16550 vUART
> > configuration switch passed from the toolstack for the HVM
> > case, I decided to look into how to improve emulation_flags_ok().
> > ---
> >  xen/arch/x86/domain.c | 29 +++++++++++------------------
> >  1 file changed, 11 insertions(+), 18 deletions(-)
>=20
> There is a readability win, yes.
>=20
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -750,25 +750,18 @@ static bool emulation_flags_ok(const struct domai=
n *d, uint32_t emflags)
> >      BUILD_BUG_ON(X86_EMU_ALL !=3D XEN_X86_EMU_ALL);
> >  #endif
> >
> > -    if ( is_hvm_domain(d) )
> > -    {
> > -        if ( is_hardware_domain(d) &&
> > -             emflags !=3D (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAP=
IC) )
> > -            return false;
> > -        if ( !is_hardware_domain(d) &&
> > -             /* HVM PIRQ feature is user-selectable. */
> > -             (emflags & ~X86_EMU_USE_PIRQ) !=3D
> > -             (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
> > -             emflags !=3D X86_EMU_LAPIC )
> > -            return false;
> > -    }
> > -    else if ( emflags !=3D 0 && emflags !=3D X86_EMU_PIT )
> > -    {
> > -        /* PV or classic PVH. */
> > -        return false;
> > -    }
> > +    /* PV or classic PVH */
> > +    if ( !is_hvm_domain(d) )
> > +        return emflags =3D=3D 0 || emflags =3D=3D XEN_X86_EMU_PIT;
>=20
> What's "classic PVH" here? This got to be PVHv1, which is dead. As you to=
uch /
> move such a comment, you want to adjust it so it's at least no longer sta=
le.

Looks like the comment should say "PV".

>=20
> > -    return true;
> > +    /* HVM */
> > +    if ( is_hardware_domain(d) )
> > +        return emflags =3D=3D (XEN_X86_EMU_LAPIC |
> > +                           XEN_X86_EMU_IOAPIC |
> > +                           XEN_X86_EMU_VPCI);
> > +
> > +    return (emflags & ~XEN_X86_EMU_OPTIONAL) =3D=3D XEN_X86_EMU_BASELI=
NE ||
> > +            emflags =3D=3D XEN_X86_EMU_LAPIC;
>=20
> There was a comment about X86_EMU_USE_PIRQ being optional, which you've l=
ost
> together with (only) that (i.e. not at the same time including vPCI) opti=
onality.
>=20
> Furthermore you move from X86_EMU_* namespace to XEN_X86_EMU_* one withou=
t even
> mentioning that (and the reason to do so) in the description. Aiui the fu=
nction
> deliberately uses the internal names, not the public interface ones.
>=20
> Jan


