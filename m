Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A8AD46FB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 01:47:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011212.1389564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8gv-0001nc-Tx; Tue, 10 Jun 2025 23:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011212.1389564; Tue, 10 Jun 2025 23:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8gv-0001kp-R8; Tue, 10 Jun 2025 23:47:41 +0000
Received: by outflank-mailman (input) for mailman id 1011212;
 Tue, 10 Jun 2025 23:47:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL97=YZ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uP8gu-0001kj-TS
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 23:47:40 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a9cba35-4655-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 01:47:38 +0200 (CEST)
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
X-Inumbo-ID: 4a9cba35-4655-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749599258; x=1749858458;
	bh=Jnoru+0NdFyzc26qHA6MrPvOFCqa1RKSJbFWI5l/B1k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=iGPjm2Nu0JeNsZMZBuIQo7WjTn+IxGWCuwQEgfWp4PZM2R+gTVVjJj/A6dMKODSaL
	 VFUam0OwZ1Q1QWDhjK65P0rGnanaROfJpfw4k3wtdIK4F+ijjVEFfhyF/o/H/8mrmW
	 CmJvcTRiFi3rzBHZKEQeadqQpvjyxMQ9zZtzF3LiLhLrWyDyatphGp1X1jZVo2jfhG
	 YbegwJ1EvnUearxJqcwvgbkw2jJmCkapPnLa6oSNk/80/75xmeQb0BgAAadunHIhYv
	 l3/Q/7EjwSwPfQKZYdzGu5FFd+fTkidYXhAJqS4hlMhCl24nwJO1F05pnuuaqE+n/9
	 UHbWjh3y7sBoQ==
Date: Tue, 10 Jun 2025 23:47:33 +0000
To: Julien Grall <julien@xen.org>
From: dmkhn@proton.me
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/3] xen/domain: adjust domain ID allocation for Arm
Message-ID: <aEjED6Ndry9yhPp2@kraken>
In-Reply-To: <61e2ae99-041b-4c8c-81bb-c86b5cee936e@xen.org>
References: <20250528225030.2652166-1-dmukhin@ford.com> <20250528225030.2652166-3-dmukhin@ford.com> <63087c42-d709-4e53-a2c3-8b812f13190a@xen.org> <a4c860d7-1fa0-43f4-8ae1-af59b7c6506f@xen.org> <30c01c78-5a5e-435f-9b1c-faca3af04a76@suse.com> <aEfmkMBW7r1KHuV0@kraken> <11ea9475-d963-473d-a85b-d1c461e7b213@suse.com> <aEf1Hw+x35Yci/FS@kraken> <61e2ae99-041b-4c8c-81bb-c86b5cee936e@xen.org>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 696d34da7c1bd6e31aced50a61f9aadb69ace82b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 10:44:39AM +0100, Julien Grall wrote:
> Hi Denis,
>=20
> On 10/06/2025 10:04, dmkhn@proton.me wrote:
> > On Tue, Jun 10, 2025 at 10:26:22AM +0200, Jan Beulich wrote:
> >> On 10.06.2025 10:02, dmkhn@proton.me wrote:
> >>> On Tue, Jun 10, 2025 at 08:53:12AM +0200, Jan Beulich wrote:
> >>>> On 06.06.2025 23:29, Julien Grall wrote:
> >>>>> Hi Denis,
> >>>>>
> >>>>> On 05/06/2025 23:05, Julien Grall wrote:
> >>>>>> Hi Denis,
> >>>>>>
> >>>>>> On 28/05/2025 23:50, dmkhn@proton.me wrote:
> >>>>>>> From: Denis Mukhin <dmkhn@proton.me>
> >>>>>>>
> >>>>>>> From: Denis Mukhin <dmukhin@ford.com>
> >>>>>>>
> >>>>>>> Remove the hardcoded domain ID 0 allocation for hardware domain a=
nd replace it
> >>>>>>> with a call to get_initial_domain_id() (returns the value of hard=
ware_domid on
> >>>>>>> Arm).
> >>>>>>
> >>>>>> I am not entirely why this is done. Are you intending to pass a di=
fferent domain ID? If so...
> >>>>>>
> >>>>>>>
> >>>>>>> Update domid_alloc(DOMID_INVALID) case to ensure that get_initial=
_domain_id()
> >>>>>>> ID is skipped during domain ID allocation to cover domU case in d=
om0less
> >>>>>>> configuration. That also fixes a potential issue with re-using ID=
#0 for domUs
> >>>>>>> when get_initial_domain_id() returns non-zero.
> >>>>>>>
> >>>>>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >>>>>>> ---
> >>>>>>> Changes since v8:
> >>>>>>> - rebased
> >>>>>>> ---
> >>>>>>>  =C2=A0 xen/arch/arm/domain_build.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> >>>>>>>  =C2=A0 xen/common/device-tree/dom0less-build.c | 9 +++------
> >>>>>>>  =C2=A0 xen/common/domain.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 4 ++--
> >>>>>>>  =C2=A0 3 files changed, 7 insertions(+), 10 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_bu=
ild.c
> >>>>>>> index e9d563c269..0ad80b020a 100644
> >>>>>>> --- a/xen/arch/arm/domain_build.c
> >>>>>>> +++ b/xen/arch/arm/domain_build.c
> >>>>>>> @@ -2035,9 +2035,9 @@ void __init create_dom0(void)
> >>>>>>
> >>>>>> ... naming like create_dom0() probably wants to be renamed.
> >>>>>>
> >>>>>> That said, I am not convinced a domain other than 0 should have fu=
ll privilege by default. So I would argue it should stay as ...
> >>>>>>
> >>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !llc_coloring_enabled )
> >>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags |=
=3D CDF_directmap;
> >>>>>>> -=C2=A0=C2=A0=C2=A0 domid =3D domid_alloc(0);
> >>>>>>> +=C2=A0=C2=A0=C2=A0 domid =3D domid_alloc(get_initial_domain_id()=
);
> >>>>>>
> >>>>>> ... 0.
> >>>>>
> >>>>> Looking at the implementation of get_initial_domain_id(), I noticed=
 the behavior was changed for x86 by [1].
> >>>>>
> >>>>> Before, get_initial_domain_id() was returning 0 except for the PV s=
him.
> >>>>> But now, it would could return the domain ID specified on the comma=
nd line (via hardware_dom).
> >>>>>
> >>>>>  From my understanding, the goal of the command line was to create =
the hardware domain *after* boot. So initially we create dom0 and then init=
ialize the hardware domain. With the patch below, this has changed.
> >>>>>
> >>>>> However, from the commit message, I don't understand why. It seems =
like we broke late hwdom?
> >>>>>
> >>>>> For instance, late_hwdom_init() has the following assert:
> >>>>>
> >>>>>  =C2=A0=C2=A0=C2=A0 dom0 =3D rcu_lock_domain_by_id(0);
> >>>>>  =C2=A0=C2=A0=C2=A0 ASSERT(dom0 !=3D NULL);
> >>>>>
> >>>>> Jan, I saw you were involved in the review of the series. Any idea =
why this was changed?
> >>>>
> >>>> I simply overlooked this aspect when looking at the change. You're r=
ight, things
> >>>> were broken there. Unless a simple and clean fix can be made relativ=
ely soon, I
> >>>> think this simply needs reverting (which may mean to revert any late=
r commits
> >>>> that depend on that). I can't help noting that in this console rewor=
k there were
> >>>> way too many issues, and I fear more than just this one may have sli=
pped
> >>>> through. I therefore wonder whether taken as a whole this was/is wor=
th both the
> >>>> submitter's and all the reviewers' time.
> >>>
> >>> Yes, sorry, I overlooked late_hwdom_init() modification.
> >>>
> >>> IMO, the clean fix would be adding another command line parameter
> >>> `control_domid` (with default value 0), make get_initial_domain_id() =
return it
> >>> instead of current `hardware_domid` and update late_hwdom_init() to u=
se
> >>> `control_domid` insted of open-coded 0.
> >>
> >> No, no new command line option will address this. Original behavior ne=
eds to be
> >> restored (either by correcting the earlier change or, as said, be reve=
rting).
> >
> > Correction of the earlier change:
> >
> >    https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/b7f194650=
307a08a9e6da5aa9fdd1f8a9afd67eb
> >
> > re: command line option: I meant something like this:
> >
> >    https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/51a519de6=
ea73ff3b650fd9bd4f3c5c63f64c069
>=20
> I am with Jan here. This used to work before without "control_domid", so
> we ought to keep the same.

OK, thanks for the feedback!
I will post the correction of the earlier change.

>=20
> But even if we are ok to break compatibility, I don't see the value of
> "control_domid". The implication of setting "hardware_domid" is you will
> have a separate control domain. At which point, why would it matter to
> specify the domain ID?

I thought there's a plan to use symbols in the ongoing hyperlauch reworks, =
but
as later Jason explains, this is not the case.

>=20
> Cheers,
>=20
> --
> Julien Grall
>=20


