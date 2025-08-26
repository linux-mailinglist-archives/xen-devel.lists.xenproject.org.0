Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF82B35963
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 11:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094248.1449589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqqLX-0006QZ-TF; Tue, 26 Aug 2025 09:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094248.1449589; Tue, 26 Aug 2025 09:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqqLX-0006Nj-QQ; Tue, 26 Aug 2025 09:52:07 +0000
Received: by outflank-mailman (input) for mailman id 1094248;
 Tue, 26 Aug 2025 09:52:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vqZn=3G=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uqqLX-0006MN-36
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 09:52:07 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5263d15d-8262-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 11:52:05 +0200 (CEST)
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
X-Inumbo-ID: 5263d15d-8262-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1756201923; x=1756461123;
	bh=qlrjY5GnMadOaXSYmCF0DmY3GZ2EUT72mGX4VGyZIcA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dYcqGRO3oess9JVAx5Gpxl/EKh16q092+C1pAxPjHgGWzuyay6xcON7qpSkfEnd5w
	 lRoTVSx3r0DPOnv0fu7NxvLNd9q67kQCpgYIowsp4eo4ssjtb5Vz6806unNoQX1sr5
	 YScoVh/1i/8yGNDzRoxQqzwnkttgaDUR8yl97OEhFcxRnvMuzOjmDggdPl62ZlxIuT
	 3UDCGsY7wD+1CVh3PwfWrOUYmTwFmJDnux0gc8TrAWer4fVjS9gPh1rMOvhikAyXji
	 ltvfy8lK6DPcVH6JDQkyLm4NWnkFOym5QslVRgFBxL918Rd9mPoMeN+fyfnnmRttWD
	 v+AQHzRYcfj7g==
Date: Tue, 26 Aug 2025 09:52:00 +0000
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
From: dmkhn@proton.me
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v16 1/4] xen/domain: unify domain ID allocation
Message-ID: <aK2Du/ANa1QnlY3g@kraken>
In-Reply-To: <DC81ACV8TXQ1.17YID3PYUCKA5@amd.com>
References: <20250812223024.2364749-1-dmukhin@ford.com> <20250812223024.2364749-2-dmukhin@ford.com> <f85ae718-0243-4426-a555-327afffe7148@suse.com> <aKUPo+hRdfGlg+S8@kraken> <a5d91a6d-cde6-42fc-8497-f2c822e98174@suse.com> <DC81ACV8TXQ1.17YID3PYUCKA5@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a4b37eb2f29a6726f2391d5ec2e65029c0a643d0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 12:29:23PM +0200, Alejandro Vallejo wrote:
> On Thu Aug 21, 2025 at 9:16 AM CEST, Jan Beulich wrote:
> > On 20.08.2025 01:58, dmkhn@proton.me wrote:
> >> On Thu, Aug 14, 2025 at 09:11:11AM +0200, Jan Beulich wrote:
> >>> On 13.08.2025 00:30, dmkhn@proton.me wrote:
> >>>> From: Denis Mukhin <dmukhin@ford.com>
> >>>>
> >>>> Currently, there are two different domain ID allocation implementati=
ons:
> >>>>
> >>>>   1) Sequential IDs allocation in dom0less Arm code based on max_ini=
t_domid;
> >>>>
> >>>>   2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not =
use
> >>>>      max_init_domid (both Arm and x86).
> >>>>
> >>>> The domain ID allocation covers dom0 or late hwdom, predefined domai=
ns,
> >>>> post-boot domains, excluding Xen system domains (domid >=3D
> >>>> DOMID_FIRST_RESERVED).
> >>>>
> >>>> It makes sense to have a common helper code for such task across arc=
hitectures
> >>>> (Arm and x86) and between dom0less / toolstack domU allocation.
> >>>>
> >>>> Note, fixing dependency on max_init_domid is out of scope of this pa=
tch.
> >>>>
> >>>> Wrap the domain ID allocation as an arch-independent function domid_=
alloc() in
> >>>> new common/domid.c based on the bitmap.
> >>>>
> >>>> Allocation algorithm:
> >>>> - If an explicit domain ID is provided, verify its availability and =
use it if
> >>>>   ID is not used;
> >>>> - If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RES=
ERVED-1],
> >>>>   starting from the last used ID.
> >>>>   Implementation guarantees that two consecutive calls will never re=
turn the
> >>>>   same ID. ID#0 is reserved for the first boot domain (currently, do=
m0) and
> >>>>   excluded from the allocation range.
> >>>>
> >>>> Remove is_free_domid() helper as it is not needed now.
> >>>>
> >>>> No functional change intended.
> >>>>
> >>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
> >>>> Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >>>> ---
> >>>> Changes since v15:
> >>>> - fixup for check after the first pass in the bitarray in domid_allo=
c()
> >>>> - trivial renaming for the local variable in domid_alloc()
> >>>> - kept Julien's R-b, added Alejandro's R-b
> >>>
> >>> Just to mention: My take is that this kind of a fix ought to invalida=
te all
> >>> earlier R-b. It's not just a cosmetic change, after all.
> >>
> >> Sorry for the hiccup here, did not mean to overrule the review process=
.
> >>
> >> My bold assumption was that in case of small fixups like this it is
> >> satisfactory to carry over previous acks.
> >
> > Acks may be okay to keep, but imo R-b need dropping when an actual bug =
was
> > fixed.
>=20
> I don't know. Unless the bugfix involves a change in the code with wide r=
eaching
> consequences I'd say it's reasonable to keep them. But that's something f=
or you
> (the committers) to decide, and this just my .02 cents.
>=20
> > Irrespective of how severe the bug was.
>=20
> It's not so much about the severity (imo), as the behavioural differences
> involved in the fixup. In this case (afaics?) it's a straight s/=3D=3D/>=
=3D/, which is
> self-contained and has no wide-reaching side effects at all.
>=20
> >
> >> I asked (matrix) both Julien and Alejandro to re-review and confirm.
> >
> > While good to ask, that's of limited use. It'll be impossible later on =
to
> > figure whether such a confirmation was given. Decisions (and acks and a=
like
> > effectively fall into that category) need to be on the list, to be able=
 to
> > locate them later on.
> >
> > Jan
>=20
> He meant he reached out to ask for an in-list confirmation. As far as I'm
> concerned, my R-by still holds.

Thanks

>=20
> Cheers,
> Alejandro


