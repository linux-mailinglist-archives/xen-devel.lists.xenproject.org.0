Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE787AD2F6A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 10:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010570.1388697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOtwO-0004hx-QZ; Tue, 10 Jun 2025 08:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010570.1388697; Tue, 10 Jun 2025 08:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOtwO-0004gR-Nr; Tue, 10 Jun 2025 08:02:40 +0000
Received: by outflank-mailman (input) for mailman id 1010570;
 Tue, 10 Jun 2025 08:02:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL97=YZ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uOtwN-0004gL-Bj
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 08:02:40 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 461b7680-45d1-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 10:02:37 +0200 (CEST)
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
X-Inumbo-ID: 461b7680-45d1-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749542556; x=1749801756;
	bh=ZtXzfZoeozoo2V76hlgC4XSea52A0MjKHciBMqaNKY4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=OFIOEbY4Y84bsinZt5hwgIEmi0nNU1S3arUWzATkG/eBwAYvs0ljB+3i5xluG80yx
	 qaCjlLcm1G7V4n5eDUYHz36DLV9Riq+d0Awp3aX6zS4K5fp8k8pLSVLtdQw5GC8TeH
	 q7EfceCi39nD6Ws+zxXYxgy8qND4D9sXNPajfOcAU+LQpKUls40TVwrwERAdhSSY0t
	 n6uJ+lrZFAwYgxzOBA/OHaBwhbZQpW/0doNZqUyvnFzsz0a/NvvUrfrdI537FV9pZY
	 RRkbNb40yOIRn9IkWCo6izA1yiNug1W7Y+fstMOlWSBUh3qH+vtRtE4uCjG0sLK/mm
	 xPs394oi6UmEg==
Date: Tue, 10 Jun 2025 08:02:30 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: Julien Grall <julien@xen.org>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/3] xen/domain: adjust domain ID allocation for Arm
Message-ID: <aEfmkMBW7r1KHuV0@kraken>
In-Reply-To: <30c01c78-5a5e-435f-9b1c-faca3af04a76@suse.com>
References: <20250528225030.2652166-1-dmukhin@ford.com> <20250528225030.2652166-3-dmukhin@ford.com> <63087c42-d709-4e53-a2c3-8b812f13190a@xen.org> <a4c860d7-1fa0-43f4-8ae1-af59b7c6506f@xen.org> <30c01c78-5a5e-435f-9b1c-faca3af04a76@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 18acf0b160f372eaa9111b20f5f605a10d3a0cf4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 08:53:12AM +0200, Jan Beulich wrote:
> On 06.06.2025 23:29, Julien Grall wrote:
> > Hi Denis,
> >
> > On 05/06/2025 23:05, Julien Grall wrote:
> >> Hi Denis,
> >>
> >> On 28/05/2025 23:50, dmkhn@proton.me wrote:
> >>> From: Denis Mukhin <dmkhn@proton.me>
> >>>
> >>> From: Denis Mukhin <dmukhin@ford.com>
> >>>
> >>> Remove the hardcoded domain ID 0 allocation for hardware domain and r=
eplace it
> >>> with a call to get_initial_domain_id() (returns the value of hardware=
_domid on
> >>> Arm).
> >>
> >> I am not entirely why this is done. Are you intending to pass a differ=
ent domain ID? If so...
> >>
> >>>
> >>> Update domid_alloc(DOMID_INVALID) case to ensure that get_initial_dom=
ain_id()
> >>> ID is skipped during domain ID allocation to cover domU case in dom0l=
ess
> >>> configuration. That also fixes a potential issue with re-using ID#0 f=
or domUs
> >>> when get_initial_domain_id() returns non-zero.
> >>>
> >>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >>> ---
> >>> Changes since v8:
> >>> - rebased
> >>> ---
> >>> =C2=A0 xen/arch/arm/domain_build.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> >>> =C2=A0 xen/common/device-tree/dom0less-build.c | 9 +++------
> >>> =C2=A0 xen/common/domain.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 4 ++--
> >>> =C2=A0 3 files changed, 7 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.=
c
> >>> index e9d563c269..0ad80b020a 100644
> >>> --- a/xen/arch/arm/domain_build.c
> >>> +++ b/xen/arch/arm/domain_build.c
> >>> @@ -2035,9 +2035,9 @@ void __init create_dom0(void)
> >>
> >> ... naming like create_dom0() probably wants to be renamed.
> >>
> >> That said, I am not convinced a domain other than 0 should have full p=
rivilege by default. So I would argue it should stay as ...
> >>
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !llc_coloring_enabled )
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags |=3D CDF=
_directmap;
> >>> -=C2=A0=C2=A0=C2=A0 domid =3D domid_alloc(0);
> >>> +=C2=A0=C2=A0=C2=A0 domid =3D domid_alloc(get_initial_domain_id());
> >>
> >> ... 0.
> >
> > Looking at the implementation of get_initial_domain_id(), I noticed the=
 behavior was changed for x86 by [1].
> >
> > Before, get_initial_domain_id() was returning 0 except for the PV shim.
> > But now, it would could return the domain ID specified on the command l=
ine (via hardware_dom).
> >
> > From my understanding, the goal of the command line was to create the h=
ardware domain *after* boot. So initially we create dom0 and then initializ=
e the hardware domain. With the patch below, this has changed.
> >
> > However, from the commit message, I don't understand why. It seems like=
 we broke late hwdom?
> >
> > For instance, late_hwdom_init() has the following assert:
> >
> > =C2=A0=C2=A0=C2=A0 dom0 =3D rcu_lock_domain_by_id(0);
> > =C2=A0=C2=A0=C2=A0 ASSERT(dom0 !=3D NULL);
> >
> > Jan, I saw you were involved in the review of the series. Any idea why =
this was changed?
>=20
> I simply overlooked this aspect when looking at the change. You're right,=
 things
> were broken there. Unless a simple and clean fix can be made relatively s=
oon, I
> think this simply needs reverting (which may mean to revert any later com=
mits
> that depend on that). I can't help noting that in this console rework the=
re were
> way too many issues, and I fear more than just this one may have slipped
> through. I therefore wonder whether taken as a whole this was/is worth bo=
th the
> submitter's and all the reviewers' time.

Yes, sorry, I overlooked late_hwdom_init() modification.

IMO, the clean fix would be adding another command line parameter
`control_domid` (with default value 0), make get_initial_domain_id() return=
 it
instead of current `hardware_domid` and update late_hwdom_init() to use
`control_domid` insted of open-coded 0.

That should align with the effort of splitting priveleged dom0 into control=
 and
hardware domains: control domain will be the first domain ID allocated,
followed by the hardware domain.

>=20
> Jan
>=20
> > [1] https://lore.kernel.org/all/20250306075819.154361-1-dmkhn@proton.me=
/
> >
>=20


