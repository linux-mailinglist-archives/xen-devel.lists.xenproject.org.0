Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51742AC015E
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 02:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992693.1376323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHtk1-0008Bn-Lv; Thu, 22 May 2025 00:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992693.1376323; Thu, 22 May 2025 00:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHtk1-00089T-Ik; Thu, 22 May 2025 00:24:57 +0000
Received: by outflank-mailman (input) for mailman id 992693;
 Thu, 22 May 2025 00:24:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=45pF=YG=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHtk0-00089N-Vl
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 00:24:56 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ecb0c06-36a3-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 02:24:54 +0200 (CEST)
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
X-Inumbo-ID: 2ecb0c06-36a3-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747873492; x=1748132692;
	bh=oRMZKwwLtE0DcPcKZiclDXzlGPmbErHhf3v77GZJy3M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Vi+RZARNYyc8RNMTKilB9DXXREtMiUFOTQ3HoJP1iwOtbm3rtsX9Vzy4bEW0iSvMs
	 Dqa7w77VIFZ+/UsX81J7HF28rWblWMvifoD5EWXgWtk9FKOI/RLAw81htEwdEuDqZG
	 RvoUe2tDsDgCar9z99X0uagC8u2RCw8M/MCtD3+9RITXQTrOty03omoFlwlj9zoD6L
	 aJoEklL2+R/1yj+C4WRl0fLq/3WgXP5YXm01x4m5fbMmWggtd5GppT6O5PvcVFn3kS
	 Of7TD+XbMSJBNt1Q7Qa0kuerXF08P91LAMDrC+2QynjFnhSDpz4DKFDGlBR6NrilOr
	 Egg0htz2WbuNg==
Date: Thu, 22 May 2025 00:24:45 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v8 1/3] xen/domain: unify domain ID allocation
Message-ID: <aC5uxzFLxpZrQdK1@kraken>
In-Reply-To: <675950c9-f48a-489e-9ca1-816d876fbcbb@suse.com>
References: <20250521000024.2944685-1-dmukhin@ford.com> <20250521000024.2944685-2-dmukhin@ford.com> <675950c9-f48a-489e-9ca1-816d876fbcbb@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 24fe2a01789c13baef5ffb7815e8a03ff70f2ce0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 10:02:52AM +0200, Jan Beulich wrote:
> On 21.05.2025 02:00, dmkhn@proton.me wrote:
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -66,6 +66,11 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
> >  static struct domain *domain_hash[DOMAIN_HASH_SIZE];
> >  struct domain *domain_list;
> >
> > +/* Non-system domain ID allocator. */
> > +static DEFINE_SPINLOCK(domid_lock);
> > +static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
> > +static domid_t domid_last;
>=20
> Please move this into the narrowest possible scope. No reason to expose
> it to the entire CU.

Will do.

>=20
> > @@ -2405,6 +2412,46 @@ domid_t get_initial_domain_id(void)
> >      return hardware_domid;
> >  }
> >
> > +domid_t domid_alloc(domid_t domid)
> > +{
> > +    spin_lock(&domid_lock);
> > +
> > +    if ( domid < DOMID_FIRST_RESERVED )
> > +    {
> > +        if ( __test_and_set_bit(domid, domid_bitmap) )
> > +            domid =3D DOMID_INVALID;
> > +    }
> > +    else
> > +    {
> > +        domid =3D find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVE=
D,
> > +                                   domid_last);
> > +
> > +        if ( domid =3D=3D DOMID_FIRST_RESERVED )
> > +            domid =3D find_next_zero_bit(domid_bitmap, DOMID_FIRST_RES=
ERVED, 0);
>=20
> Despite what the last sentence of the description says, there is a subtle
> behavioral change here: The original code would never return what was
> called "rover" there. If the most recently created domain went away, you
> would return its ID again here if no other ID is free (which is easier to
> run into with patch 3 in place, and MAX_DOMID set to a pretty low value).
> (Noticing only later: This could even occur without wrapping, as the last
> argument passed is just domid_last, without adding in 1.)

Thanks for spotting the problem!

>=20
> I agree it's debatable whether using the sole available ID instead of
> failing wouldn't be better(?) behavior in this specific case, but such
> definitely can't go silently.
>=20
> Furthermore you once again are potentially returning ID 0 here (after
> wrapping), when the original code specifically avoided that (irrespective
> of there actually being a Dom0, that is; i.e. covering both the dom0less
> case and the late-hwdom one).
>=20
> To be frank, being at v8 I find it problematic that there still are
> (unmentioned and potentially unwanted) behavioral changes here. This
> kind of supports my earlier raised question of whether we actually want
> this sort of a change.

I appreciate patience and the feedback for the series!

>=20
> Jan


