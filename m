Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91055B35970
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 11:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094277.1449611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqqNI-0007kz-JL; Tue, 26 Aug 2025 09:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094277.1449611; Tue, 26 Aug 2025 09:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqqNI-0007iM-FF; Tue, 26 Aug 2025 09:53:56 +0000
Received: by outflank-mailman (input) for mailman id 1094277;
 Tue, 26 Aug 2025 09:53:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vqZn=3G=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uqqNG-0007T3-U5
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 09:53:54 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9359838a-8262-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 11:53:54 +0200 (CEST)
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
X-Inumbo-ID: 9359838a-8262-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1756202033; x=1756461233;
	bh=vYyVPvXN/PeOCvzaFbT3dEQ6Lf+NJ7rZxRppNEJIXrU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JtK+peJ5/TnXziCTHCKPwLUieOwAoKjmodxfYB1Oys0L/bgbLxy9BqKXw2anPz/5H
	 iNYdhNg8uaXawEW4jONUqXXHUesCixYGG7pcOdFeNKQMmPvFlwto0KKvEcccpLDWRY
	 +DC596ofez3yCC2UPowx+upObU6IY6i6JEmW1omGuV0qXZY+SOb7cQij63zKYL7+Y4
	 RuszQZxkGud0NOGA7+pQkaMU8Smw90sp+9mFxX19D71LelQjlE7Uz/8pOlZp8iJ8Ml
	 JxbIiBQbGA84Bi5zLc/JB/NLbct7+c5H11H0z0NWtP60Y+BXo4U/r0hmLppjN6DjKl
	 jNm7+XVABKBeA==
Date: Tue, 26 Aug 2025 09:53:48 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Julien Grall <jgrall@amazon.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v16 1/4] xen/domain: unify domain ID allocation
Message-ID: <aK2EKGIE11sUiqds@kraken>
In-Reply-To: <a5d91a6d-cde6-42fc-8497-f2c822e98174@suse.com>
References: <20250812223024.2364749-1-dmukhin@ford.com> <20250812223024.2364749-2-dmukhin@ford.com> <f85ae718-0243-4426-a555-327afffe7148@suse.com> <aKUPo+hRdfGlg+S8@kraken> <a5d91a6d-cde6-42fc-8497-f2c822e98174@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 3f6ffe6e445b4fb1b0774af95ac09a010db03340
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 09:16:16AM +0200, Jan Beulich wrote:
> On 20.08.2025 01:58, dmkhn@proton.me wrote:
> > On Thu, Aug 14, 2025 at 09:11:11AM +0200, Jan Beulich wrote:
> >> On 13.08.2025 00:30, dmkhn@proton.me wrote:
> >>> From: Denis Mukhin <dmukhin@ford.com>
> >>>
> >>> Currently, there are two different domain ID allocation implementatio=
ns:
> >>>
> >>>   1) Sequential IDs allocation in dom0less Arm code based on max_init=
_domid;
> >>>
> >>>   2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not u=
se
> >>>      max_init_domid (both Arm and x86).
> >>>
> >>> The domain ID allocation covers dom0 or late hwdom, predefined domain=
s,
> >>> post-boot domains, excluding Xen system domains (domid >=3D
> >>> DOMID_FIRST_RESERVED).
> >>>
> >>> It makes sense to have a common helper code for such task across arch=
itectures
> >>> (Arm and x86) and between dom0less / toolstack domU allocation.
> >>>
> >>> Note, fixing dependency on max_init_domid is out of scope of this pat=
ch.
> >>>
> >>> Wrap the domain ID allocation as an arch-independent function domid_a=
lloc() in
> >>> new common/domid.c based on the bitmap.
> >>>
> >>> Allocation algorithm:
> >>> - If an explicit domain ID is provided, verify its availability and u=
se it if
> >>>   ID is not used;
> >>> - If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RESE=
RVED-1],
> >>>   starting from the last used ID.
> >>>   Implementation guarantees that two consecutive calls will never ret=
urn the
> >>>   same ID. ID#0 is reserved for the first boot domain (currently, dom=
0) and
> >>>   excluded from the allocation range.
> >>>
> >>> Remove is_free_domid() helper as it is not needed now.
> >>>
> >>> No functional change intended.
> >>>
> >>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >>> Reviewed-by: Julien Grall <jgrall@amazon.com>
> >>> Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >>> ---
> >>> Changes since v15:
> >>> - fixup for check after the first pass in the bitarray in domid_alloc=
()
> >>> - trivial renaming for the local variable in domid_alloc()
> >>> - kept Julien's R-b, added Alejandro's R-b
> >>
> >> Just to mention: My take is that this kind of a fix ought to invalidat=
e all
> >> earlier R-b. It's not just a cosmetic change, after all.
> >
> > Sorry for the hiccup here, did not mean to overrule the review process.
> >
> > My bold assumption was that in case of small fixups like this it is
> > satisfactory to carry over previous acks.
>=20
> Acks may be okay to keep, but imo R-b need dropping when an actual bug wa=
s
> fixed. Irrespective of how severe the bug was.
>=20
> > I asked (matrix) both Julien and Alejandro to re-review and confirm.
>=20
> While good to ask, that's of limited use. It'll be impossible later on to
> figure whether such a confirmation was given. Decisions (and acks and ali=
ke
> effectively fall into that category) need to be on the list, to be able t=
o
> locate them later on.

Got it, thanks.

>=20
> Jan
>=20


