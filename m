Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA9EAD3126
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 11:05:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010628.1388778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOuum-0008L8-0V; Tue, 10 Jun 2025 09:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010628.1388778; Tue, 10 Jun 2025 09:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOuul-0008Ij-TF; Tue, 10 Jun 2025 09:05:03 +0000
Received: by outflank-mailman (input) for mailman id 1010628;
 Tue, 10 Jun 2025 09:05:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL97=YZ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uOuuj-0008Ib-BA
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 09:05:02 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5fa4735-45d9-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 11:04:48 +0200 (CEST)
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
X-Inumbo-ID: f5fa4735-45d9-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749546286; x=1749805486;
	bh=DIwHNIyJyDO2o6+soXYNXKpHOxv4wPgpvvjVZmBInwA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=KKTzLnmrUVGXTQLVJhYCYy+JVFtn1ihpGMuvFMUfDwwGq2qZlSW5fmD4JEjEytq15
	 I1Vr4jYT8q+nqelg71H+3pErM2gmngwoytJZ0xevbZDxr3yoOVUCA31gFZPy46g5ie
	 Ml3AhFCMpihsLae/LcTq+G31MIAC66eLpqcCgRf/BurNaCgkVme+GUAWFoXBD6SLnP
	 U1HfGrqCfWLYYR8i0q4w9PoATgwKaS8IAhxy6opMKAiN5fdzvMGElLivH1BQWBw8mk
	 w6zeG2bkpIXkC5mzwLWUrLN06YGYkj/1bWpkPT/3vXBisS9H4qs1dj6Vdi4ZwxK88g
	 itgIRYE7g+pdA==
Date: Tue, 10 Jun 2025 09:04:38 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: Julien Grall <julien@xen.org>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/3] xen/domain: adjust domain ID allocation for Arm
Message-ID: <aEf1Hw+x35Yci/FS@kraken>
In-Reply-To: <11ea9475-d963-473d-a85b-d1c461e7b213@suse.com>
References: <20250528225030.2652166-1-dmukhin@ford.com> <20250528225030.2652166-3-dmukhin@ford.com> <63087c42-d709-4e53-a2c3-8b812f13190a@xen.org> <a4c860d7-1fa0-43f4-8ae1-af59b7c6506f@xen.org> <30c01c78-5a5e-435f-9b1c-faca3af04a76@suse.com> <aEfmkMBW7r1KHuV0@kraken> <11ea9475-d963-473d-a85b-d1c461e7b213@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 31c2b238e99ddfa0cd44fb470db9b5c8f139185d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 10:26:22AM +0200, Jan Beulich wrote:
> On 10.06.2025 10:02, dmkhn@proton.me wrote:
> > On Tue, Jun 10, 2025 at 08:53:12AM +0200, Jan Beulich wrote:
> >> On 06.06.2025 23:29, Julien Grall wrote:
> >>> Hi Denis,
> >>>
> >>> On 05/06/2025 23:05, Julien Grall wrote:
> >>>> Hi Denis,
> >>>>
> >>>> On 28/05/2025 23:50, dmkhn@proton.me wrote:
> >>>>> From: Denis Mukhin <dmkhn@proton.me>
> >>>>>
> >>>>> From: Denis Mukhin <dmukhin@ford.com>
> >>>>>
> >>>>> Remove the hardcoded domain ID 0 allocation for hardware domain and=
 replace it
> >>>>> with a call to get_initial_domain_id() (returns the value of hardwa=
re_domid on
> >>>>> Arm).
> >>>>
> >>>> I am not entirely why this is done. Are you intending to pass a diff=
erent domain ID? If so...
> >>>>
> >>>>>
> >>>>> Update domid_alloc(DOMID_INVALID) case to ensure that get_initial_d=
omain_id()
> >>>>> ID is skipped during domain ID allocation to cover domU case in dom=
0less
> >>>>> configuration. That also fixes a potential issue with re-using ID#0=
 for domUs
> >>>>> when get_initial_domain_id() returns non-zero.
> >>>>>
> >>>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >>>>> ---
> >>>>> Changes since v8:
> >>>>> - rebased
> >>>>> ---
> >>>>> =C2=A0 xen/arch/arm/domain_build.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> >>>>> =C2=A0 xen/common/device-tree/dom0less-build.c | 9 +++------
> >>>>> =C2=A0 xen/common/domain.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 4 ++--
> >>>>> =C2=A0 3 files changed, 7 insertions(+), 10 deletions(-)
> >>>>>
> >>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_buil=
d.c
> >>>>> index e9d563c269..0ad80b020a 100644
> >>>>> --- a/xen/arch/arm/domain_build.c
> >>>>> +++ b/xen/arch/arm/domain_build.c
> >>>>> @@ -2035,9 +2035,9 @@ void __init create_dom0(void)
> >>>>
> >>>> ... naming like create_dom0() probably wants to be renamed.
> >>>>
> >>>> That said, I am not convinced a domain other than 0 should have full=
 privilege by default. So I would argue it should stay as ...
> >>>>
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !llc_coloring_enabled )
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags |=3D C=
DF_directmap;
> >>>>> -=C2=A0=C2=A0=C2=A0 domid =3D domid_alloc(0);
> >>>>> +=C2=A0=C2=A0=C2=A0 domid =3D domid_alloc(get_initial_domain_id());
> >>>>
> >>>> ... 0.
> >>>
> >>> Looking at the implementation of get_initial_domain_id(), I noticed t=
he behavior was changed for x86 by [1].
> >>>
> >>> Before, get_initial_domain_id() was returning 0 except for the PV shi=
m.
> >>> But now, it would could return the domain ID specified on the command=
 line (via hardware_dom).
> >>>
> >>> From my understanding, the goal of the command line was to create the=
 hardware domain *after* boot. So initially we create dom0 and then initial=
ize the hardware domain. With the patch below, this has changed.
> >>>
> >>> However, from the commit message, I don't understand why. It seems li=
ke we broke late hwdom?
> >>>
> >>> For instance, late_hwdom_init() has the following assert:
> >>>
> >>> =C2=A0=C2=A0=C2=A0 dom0 =3D rcu_lock_domain_by_id(0);
> >>> =C2=A0=C2=A0=C2=A0 ASSERT(dom0 !=3D NULL);
> >>>
> >>> Jan, I saw you were involved in the review of the series. Any idea wh=
y this was changed?
> >>
> >> I simply overlooked this aspect when looking at the change. You're rig=
ht, things
> >> were broken there. Unless a simple and clean fix can be made relativel=
y soon, I
> >> think this simply needs reverting (which may mean to revert any later =
commits
> >> that depend on that). I can't help noting that in this console rework =
there were
> >> way too many issues, and I fear more than just this one may have slipp=
ed
> >> through. I therefore wonder whether taken as a whole this was/is worth=
 both the
> >> submitter's and all the reviewers' time.
> >
> > Yes, sorry, I overlooked late_hwdom_init() modification.
> >
> > IMO, the clean fix would be adding another command line parameter
> > `control_domid` (with default value 0), make get_initial_domain_id() re=
turn it
> > instead of current `hardware_domid` and update late_hwdom_init() to use
> > `control_domid` insted of open-coded 0.
>=20
> No, no new command line option will address this. Original behavior needs=
 to be
> restored (either by correcting the earlier change or, as said, be reverti=
ng).

Correction of the earlier change:

  https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/b7f194650307a0=
8a9e6da5aa9fdd1f8a9afd67eb

re: command line option: I meant something like this:

  https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/51a519de6ea73f=
f3b650fd9bd4f3c5c63f64c069

>=20
> Jan


