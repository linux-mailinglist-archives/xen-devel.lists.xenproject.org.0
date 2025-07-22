Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A7DB0E72C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 01:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053072.1421824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMLH-0001Iv-2v; Tue, 22 Jul 2025 23:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053072.1421824; Tue, 22 Jul 2025 23:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMLG-0001Gg-Vp; Tue, 22 Jul 2025 23:24:14 +0000
Received: by outflank-mailman (input) for mailman id 1053072;
 Tue, 22 Jul 2025 23:24:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=an6O=2D=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ueMLF-0001Ga-P8
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 23:24:13 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f775167e-6752-11f0-b894-0df219b8e170;
 Wed, 23 Jul 2025 01:24:08 +0200 (CEST)
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
X-Inumbo-ID: f775167e-6752-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=5zgoic46sjanvc7wbyydl3mzhy.protonmail; t=1753226647; x=1753485847;
	bh=0GY5Tbp7uYgbSr2+en1qBPy8MtwQIMl8vEHvF1rPM5c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KxVN39eXxPe20ZxdsS+ZjVamabJwvgwAimwon0OKRrLDBF1/i0D5tWW9j0LmY1rbG
	 J05crhVHEqvSyJJVYtHORVwZEZ7Z94Q69foCbpxqHG3d7tQL56n4zAQyPwe5NPE1hi
	 3clCJF/SbcURNIhC8XyNm00tSwDlH6ZURDgP/qjJ9x6kGlGH4Az/nTJEEIq6Bze/K9
	 znFbdG3Pl/MDaQt9ViaGioN3+07sSREMqKVc1wTVVnDIBFJNcVMeKXgaWyCGA5+EV9
	 QJK52vzczhO2alZ9EaG8+IHsmIaKG5Imzuhgc8+FfC2RVJYYBGXthbJbD2VRRuKlw8
	 Snjpk21ImRmSA==
Date: Tue, 22 Jul 2025 23:24:05 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v10 3/3] xen/domain: use get_initial_domain_id() instead of open-coded 0
Message-ID: <aIAdkbaKyDPO1WWg@kraken>
In-Reply-To: <93080cb5-d00d-4c58-9efd-c377343eb165@suse.com>
References: <20250623182721.194238-1-dmukhin@ford.com> <20250623182721.194238-4-dmukhin@ford.com> <93080cb5-d00d-4c58-9efd-c377343eb165@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f166a3c44454c36e18c30d6e4599686629a8b32e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 08:07:55AM +0200, Jan Beulich wrote:
> On 23.06.2025 20:28, dmkhn@proton.me wrote:
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -492,7 +492,7 @@ static int late_hwdom_init(struct domain *d)
> >      struct domain *dom0;
> >      int rv;
> >
> > -    if ( d !=3D hardware_domain || d->domain_id =3D=3D 0 )
> > +    if ( d !=3D hardware_domain || d->domain_id =3D=3D get_initial_dom=
ain_id() )
> >          return 0;
> >
> >      rv =3D xsm_init_hardware_domain(XSM_HOOK, d);
> > @@ -501,7 +501,7 @@ static int late_hwdom_init(struct domain *d)
> >
> >      printk("Initialising hardware domain %d\n", hardware_domid);
> >
> > -    dom0 =3D rcu_lock_domain_by_id(0);
> > +    dom0 =3D rcu_lock_domain_by_id(get_initial_domain_id());
> >      ASSERT(dom0 !=3D NULL);
>=20
> For both changes above you're introducing a subtle (largely theoretical)
> behavioral change: In shim mode, this assertion, if we somehow made it
> here, would suddenly not trigger anymore. Similarly for the earlier
> change the return path may wrongly be taken then.

Thanks.

>=20
> > @@ -2479,7 +2479,7 @@ domid_t domid_alloc(domid_t domid)
> >          if ( domid =3D=3D DOMID_FIRST_RESERVED )
> >              domid =3D find_next_zero_bit(domid_bitmap,
> >                                         DOMID_FIRST_RESERVED,
> > -                                       1);
> > +                                       get_initial_domain_id() + 1);
>=20
> This imo is the worst of the changes. get_initial_domain_id() can return
> non-zero. In that case we still would (in principle) want to re-start
> from 1 here.

Thanks.

I will postpone this patch until the split of dom0 into control/hardware
settles.

>=20
> Jan


