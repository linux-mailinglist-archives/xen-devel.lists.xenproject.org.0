Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C46A81AB0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 03:45:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943284.1342082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2KUa-0003Iy-Qs; Wed, 09 Apr 2025 01:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943284.1342082; Wed, 09 Apr 2025 01:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2KUa-0003GM-M6; Wed, 09 Apr 2025 01:44:40 +0000
Received: by outflank-mailman (input) for mailman id 943284;
 Wed, 09 Apr 2025 01:44:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ywx6=W3=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u2KUY-0003GG-1F
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 01:44:39 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30779c2f-14e4-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 03:44:35 +0200 (CEST)
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
X-Inumbo-ID: 30779c2f-14e4-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744163073; x=1744422273;
	bh=io2VXQI5T9Mt2gr1Vhw8LRnxkxkaGSQljWXaswdn3X8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=EJMJN0fWZatwDZ6ufdi4DAqpzL8igp1QaKwMGqJurV1V98GE55OeajLqu0qF8Wnod
	 /Oz66pBVMSskd2eQ2KqpdAgB1h9FFaiHjgVMgqCNnOOCar2+QOdJL6YSsAYlFi2DHs
	 owfLzO1YD/W1vjwC1hTgDiv3TEevNcKjeFQgPeISvA4ZAw73NcXOvzkhSQPdYJqLC5
	 g+QtEeUN755rRteyVsK5Ig8B7zZ58kHfRuDIvtEeyZ6UUy2yzaXJFPB02voaQMQXGn
	 mur+KzVFTupVHeUczxUXGWwmYhy2j8UYpdaBefPugt9UIVuriYHWzsLP91YvmbgXou
	 MKqOdnZ7gryMQ==
Date: Wed, 09 Apr 2025 01:44:23 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/7] xen/domain: introduce domid_alloc()
Message-ID: <Y8GhEKf3_4HeHTMCpwHkIF1k7ESinA0tL_jlCQsxKamzi8wEc7vSK3DtzXb22qF6xzFbS2yDtP0EGUqvCBVcHn9ggIxwKcES4sdyOpVAoos=@proton.me>
In-Reply-To: <32a01662-3f34-4670-b38f-7d660acd3d2c@suse.com>
References: <20250331230508.440198-1-dmukhin@ford.com> <20250331230508.440198-3-dmukhin@ford.com> <32a01662-3f34-4670-b38f-7d660acd3d2c@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 64c60b09260bfc3fbe04515760d415fe73a9458c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, April 8th, 2025 at 7:26 AM, Jan Beulich <jbeulich@suse.com> wro=
te:

>=20
>=20
> On 01.04.2025 01:05, dmkhn@proton.me wrote:
>=20
> > From: Denis Mukhin dmukhin@ford.com
> >=20
> > Move domain ID allocation during domain creation to a dedicated
> > function domid_alloc().
> >=20
> > Allocation algorithm:
> > - If an explicit domain ID is provided, verify its availability and
> > use it if ID is unused;
> > - Otherwise, perform an exhaustive search for the first available ID
> > within the [0..DOMID_FIRST_RESERVED) range, excluding hardware_domid.
> >=20
> > This minimizes the use of max_init_domid in the code and, thus, is a
> > prerequisite change for enabling console input rotation across domains
> > with console input permission on x86 platforms (which currently is
> > limited to dom0, PV shim and Xen).
>=20
>=20
> By removing the updating of max_init_domid you do - afaict - break the
> remaining use site(s) of the variable.

Unfortunately, this patch should go together with the next patch in
this series:
  xen/domain: introduce domid_top()

I mentioned dependency in the cover letter.

>=20
> > @@ -1003,6 +1004,12 @@ static struct domain *__init create_dom0(struct =
boot_info *bi)
> >=20
> > image =3D &bi->mods[idx];
> >=20
> > + rc =3D domid_alloc(get_initial_domain_id());
> > + if ( rc < 0 )
> > + panic("Cannot use domain ID %d (rc =3D %d)\n",
> > + get_initial_domain_id(), rc);
> > + domid =3D rc;
> > +
> > if ( opt_dom0_pvh )
> > {
> > dom0_cfg.flags |=3D (XEN_DOMCTL_CDF_hvm |
>=20
>=20
> Why does this need to move up, ...
>=20
> > @@ -1017,7 +1024,6 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
> > dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
> >=20
> > /* Create initial domain. Not d0 for pvshim. */
> > - domid =3D get_initial_domain_id();
>=20
>=20
> ... disconnecting the logic from the comment that is relevant there, ...
>=20
> > d =3D domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
>=20
>=20
> ... and not so much here?

So that in case domid_alloc() fails, create_dom0() will reach error state
quickly. I will re-group it as suggested.

>=20
> > --- a/xen/include/xen/domain.h
> > +++ b/xen/include/xen/domain.h
> > @@ -37,6 +37,9 @@ void arch_get_domain_info(const struct domain *d,
> >=20
> > domid_t get_initial_domain_id(void);
> >=20
> > +#define DOMID_AUTO (-1)
> > +int domid_alloc(int hint);
>=20
>=20
> Imo it would be better to use e.g. DOMID_INVALID as the "give me whatever
> is available" indicator, allowing the function parameter to properly be
> domid_t.

Ack.

>=20
> But first of all - can we please take a step back and re-evaluate whether
> all of this re-arrangement that you're doing (not just in the patch here)
> is really needed? It seems to me that it must be possible to do whatever
> you ultimately want to do without re-writing quite a few pretty central
> pieces that have been serving us fine for a long time. That is, rather
> than make our code fit your desires, make your plans fit within the code
> base we have.

Thanks for the review and feedback!

My plan is to deliver the NS16550 emulator for x86 because that saves some
time during bring up of an embedded system.

Current xen console driver allows physical input pass-through to the domain=
.

This is implemented differently between arm and x86. Currently, the logic
of switching input depends on the global variable `max_init_domid`, which i=
s
advanced on arm only (and never decreased, which makes sense for embedded
designs).

One of the planned emulator features is allowing guest OS to accept
physical input over the emulated UART. On x86, that includes dom0,
PV shim and, with emulator in place, also includes all domains with
NS16550 emulator enabled.

So I need to solve the problem of switching console input to another domain
on x86.

I see there are two ways to solve it:

  (a) iterate through the list of known domains and check "UART emulator
      present" property. AFAIU, that will require maintaining "current cons=
ole
      domain" pointer for a domain list walk.

  (b) calculate the max known domain ID and then check whether domain ID
      corresponds to a domain with "UART emulator present" property by iter=
ating
      through the range of domain IDs. This is current approach in the code=
.

So, this patch series solves problem of switching console input to another =
domain
on x86 using (b); as looked as less changes to me comparing to maintaining =
a
domain pointer.

re: code re-arrangements: while working on the emulator, getting more feedb=
ack,
this and other console-related cleanup series appeared and I think the code=
 which
served fine for a long time, got a bit cleaner, easier to follow and, I hop=
e,
a bit easier to maintain.

>=20
> Jan

Thanks,
Denis

