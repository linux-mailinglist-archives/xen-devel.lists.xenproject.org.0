Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F12AC016A
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 02:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992727.1376353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHtpk-0002PI-PY; Thu, 22 May 2025 00:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992727.1376353; Thu, 22 May 2025 00:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHtpk-0002Nr-Mh; Thu, 22 May 2025 00:30:52 +0000
Received: by outflank-mailman (input) for mailman id 992727;
 Thu, 22 May 2025 00:30:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=45pF=YG=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHtph-0001M8-Ib
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 00:30:50 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0167234b-36a4-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 02:30:47 +0200 (CEST)
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
X-Inumbo-ID: 0167234b-36a4-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=neon75zegzeq5j6jvwu6pe27eq.protonmail; t=1747873846; x=1748133046;
	bh=94+daJ7MKlQipotqSqi8+oFp836FlSzSm/WXpHSSQOs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=MpMdfOs5uSDuvqeYXu4cmIfJrxBMuMLuXuO6wvkn/18ca0Rbt1BRI2fuNQRBlPzgZ
	 x8Uj4gU92OchB68Sc/Sj4rUD/O90+J3/Je34hGEZb0+GY7zboISpdrIJlL0g1P+HLI
	 iV3bK8kewSKrTZCvq7p5JrsT4GusSufiIxRlW9rtPkClv1Z5FSXPxNLMqplbEJCMp6
	 37P66CmQHynTZslgZcgMcza9W8ln8ExiJh13joCLs27BYVk7gdjzXxLKbvdn04S5yv
	 ONPdIx1s5yGTmYnVWWTp4a3WPmKrTxMGR6QDal1NtoPkvCxKYFsHXXsF+mElFdnATG
	 yVe2uN0YB7M/g==
Date: Thu, 22 May 2025 00:30:39 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/5] xen/console: introduce console_get_domid()
Message-ID: <aC5wKu4k6gWvQbKl@kraken>
In-Reply-To: <a8423035-771d-4e55-a3c5-562cc67dbb26@suse.com>
References: <20250519201211.1366244-1-dmukhin@ford.com> <20250519201211.1366244-3-dmukhin@ford.com> <a8423035-771d-4e55-a3c5-562cc67dbb26@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 98508e00a38f1e2b49d380cfedf3a414229817ef
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 08:20:16AM +0200, Jan Beulich wrote:
> On 19.05.2025 22:12, dmkhn@proton.me wrote:
> > --- a/xen/arch/arm/vpl011.c
> > +++ b/xen/arch/arm/vpl011.c
> > @@ -78,12 +78,11 @@ static void vpl011_write_data_xen(struct domain *d,=
 uint8_t data)
> >      unsigned long flags;
> >      struct vpl011 *vpl011 =3D &d->arch.vpl011;
> >      struct vpl011_xen_backend *intf =3D vpl011->backend.xen;
> > -    struct domain *input =3D console_get_domain();
> >
> >      VPL011_LOCK(d, flags);
> >
> >      intf->out[intf->out_prod++] =3D data;
> > -    if ( d =3D=3D input )
> > +    if ( d->domain_id =3D=3D console_get_domid() )
>=20
> How do you know d isn't a domain different from the one that was the
> console "owner" prior to being destroyed? Original code guaranteed this
> up to ...
>=20
> > @@ -123,8 +122,6 @@ static void vpl011_write_data_xen(struct domain *d,=
 uint8_t data)
> >      vpl011_update_interrupt_status(d);
> >
> >      VPL011_UNLOCK(d, flags);
> > -
> > -    console_put_domain(input);
>=20
> ... here.

Agreed; I will drop the code change in the next iteration.
Thanks.

>=20
> Jan


