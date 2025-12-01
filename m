Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85144C995DF
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 23:18:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175982.1500569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQCCQ-0000Rw-32; Mon, 01 Dec 2025 22:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175982.1500569; Mon, 01 Dec 2025 22:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQCCP-0000Q0-W8; Mon, 01 Dec 2025 22:16:50 +0000
Received: by outflank-mailman (input) for mailman id 1175982;
 Mon, 01 Dec 2025 22:16:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hgWx=6H=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vQCCO-0000Pu-3M
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 22:16:48 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68553641-cf03-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 23:16:39 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 9C02F140015F;
 Mon,  1 Dec 2025 17:16:38 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Mon, 01 Dec 2025 17:16:38 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Dec 2025 17:16:36 -0500 (EST)
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
X-Inumbo-ID: 68553641-cf03-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764627398;
	 x=1764713798; bh=J3qMW1OCZIlVxI0UekDVekbDTFyGGqilI0Pi5RQhmhY=; b=
	Gh83FDlI7RX03Dj3y6HaCsupq9S9+q0x4mT4ZEEqmcZYTf7KvPUlHCzLmo/Sohci
	QmpnE9KitImOm2lW30CkiYux3WwJwfQve/d8z6I1mcVA4FcATihWtIXqyWELb6EQ
	a19bZfvRfDBevecrb5609YHgeJrwprK3y31dC4juYq6O/7Y/WRFCxaQ4JYn4hRA2
	jaFjkDXI92zmiy0Wj/eWbtzBm2xSNeGF8BM0RIhPnNUWQKNeF6V6McIhGQcxV+OG
	DImGxLbBFlW2aQ51oEsyod8tK8kEuKJBJRKRv9BY+5RikrtLT1Wi4+71E/Q2tGbO
	ETfDTCGU2CiUV14puCnqeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1764627398; x=1764713798; bh=J3qMW1OCZIlVxI0UekDVekbDTFyGGqilI0P
	i5RQhmhY=; b=S3/GN4eafYOvnAB6vfwiP3zK7pYn28um3ZE93lJ+K7KRg0p08ki
	EIaIa7nFMFPhltQEumE8V7+McSHQRWhLMYjGzkh36AvvIA1XENf/quciGtLz4n0+
	Tvdc+c1sC7LUpOxGwi+0+K0SGhKAvL6nO5c2w13XdeZTky19l/l5yAK8DaVdg3aB
	aIP9RLB0Uu+yw/8ycssxzo8tsad2VQ89WECglqww5KTksQwvN7q4gmaPA9YoYfFF
	MMGZArjUbmmw2tSq8B5F5Q2YQaNjcZKxIJrfGS2SF41b65r5WuOFvzNaWXaveHyU
	16U3QGhy8suJxlWTJ73TsFuRjyYCUPVRpMg==
X-ME-Sender: <xms:xhMuaSJBoI0EtGG2AYWs7ANvdL8O5KwIP7X97D33LxAjSIThHKzLQQ>
    <xme:xhMuaa21x12pBLWKEx2g0619PqECa7Ce7oa1n8N8yhEB-Gzdxh_FEYjV6AnBRkjFo
    wKWMAzgo2DHoisKOzUPZqbzcYVlma2axYESvrzwxYvKIKw>
X-ME-Received: <xmr:xhMuaQ6dciQDrHIacg3uccVAt2qGiXXIQeZwaDO1oK0yblmpljgo_b5x8o0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvheekkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepffeiffej
    hfevvdegtedtgfelueeliedvvdeftdeuueeutdfffefhfedvhfejhfeunecuffhomhgrih
    hnpehgihhthhhusgdrtghomhdpthhhvghmrdhsrghvvgenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeejpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehjrghsohhnrdgrnhgurhihuhhksegrmhgurdgtohhmpd
    hrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdprhgtphhtthhopehsshhtrggs
    vghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeholhgvkhhsrghnughrpg
    hthihshhgthhgvnhhkohesvghprghmrdgtohhmpdhrtghpthhtohephigrnhhnrdhsihho
    nhhnvggruhesvhgrthgvshdrthgvtghhpdhrtghpthhtohepgigvnhdquggvvhgvlheslh
    hishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:xhMuab_SHL2L6CaoJAXIx0Nc7fRMolgYB4IoEPt9RdmtOGfAfo8oYQ>
    <xmx:xhMuafWwi8h-ygoLxMJYLaYOrLecMXmywqCgqfzqxraHidZejS6VRg>
    <xmx:xhMuaWpxuwrj5QE2XluWdVAyR3LAI2c-BK1wf_GJM6EEmrsFXKhCEw>
    <xmx:xhMuaRlE-QZ3gS0f7h5kEz9ETSajTBwEY7z9YxrKEMYVPA-kJzNOzA>
    <xmx:xhMuaXEUAR_jpfzXo2inJfGBhYeLbaZERlEOtNpKLnCohknKknFN3RAu>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 1 Dec 2025 23:16:35 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Yann Sionneau <yann.sionneau@vates.tech>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] xenbus: Use .freeze/.thaw to handle xenbus devices
Message-ID: <aS4Tw7hUJDw6Jt_9@mail-itl>
References: <20251119224731.61497-1-jason.andryuk@amd.com>
 <20251119224731.61497-2-jason.andryuk@amd.com>
 <aSul6qAYTSOSFJR3@mail-itl>
 <fb1e5c6f-cb0e-49d0-9e96-8e778573f49c@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7URB8WNuJVC0wZb9"
Content-Disposition: inline
In-Reply-To: <fb1e5c6f-cb0e-49d0-9e96-8e778573f49c@amd.com>


--7URB8WNuJVC0wZb9
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 1 Dec 2025 23:16:35 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Yann Sionneau <yann.sionneau@vates.tech>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] xenbus: Use .freeze/.thaw to handle xenbus devices

On Mon, Dec 01, 2025 at 01:20:40PM -0500, Jason Andryuk wrote:
> On 2025-11-29 21:03, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, Nov 19, 2025 at 05:47:29PM -0500, Jason Andryuk wrote:
> > > The goal is to fix s2idle and S3 for Xen PV devices.
> >=20
> > Can you give a little more context of this? We do have working S3 in
> > qubes with no need for such change. We trigger it via the toolstack (li=
bxl_domain_suspend_only()).
> > Are you talking about guest-initiated suspend here?
>=20
> This is intended to help domU s2idle/S3 and resume.  I guess that is what
> you mean by guest-initiated?  The domU can use 'echo mem > /sys/power/sta=
te'
> to enter s2idle/S3.  We also have the domU react to the ACPI sleep button
> from `xl trigger $dom sleep`.

Ok, so this is indeed a different path than we use in Qubes OS.

> AIUI, libxl_domain_suspend_only() triggers xenstore writes which Linux
> drivers/xen/manage.c:do_suspend() acts on.  `xl save/suspend/migrate` all
> use this path.
>=20
> The terminology gets confusing.  Xen uses "suspend" for
> save/suspend/migrate, but the Linux power management codes uses
> freeze/thaw/restore.  AIUI, Linux's PMSG_SUSPEND/.suspend is for runtime
> power management.

Indeed it gets confusing...

> When you call libxl_domain_suspend_only()/libxl_domain_resume(), you pass
> suspend_cancel=3D=3D1.
>  *  1. (fast=3D1) Resume the guest without resetting the domain
>        environment.
>  *     The guests's call to SCHEDOP_shutdown(SHUTDOWN_suspend) will
>        return 1.
>=20
> That ends up in Linux do_suspend() as si.cancelled =3D 1, which calls
> PMSG_THAW -> .thaw -> xenbus_dev_cancel() which is a no-op.  So it does n=
ot
> change the PV devices.
>=20
> We needed guest user space to perform actions before entering s2idle.
> libxl_domain_suspend_only() triggers the Linux kernel path which does not
> notify user space.  The ACPI power buttons let user space perform actions
> (lock and blank the screen) before entering the idle state.

I see. In our case, we have our own userspace hook that gets called
before (if relevant - in most cases it isn't).

> > We also have kinda working (host) s2idle. You may want to take a look a=
t this
> > work (some/most of it was posted upstream, but not all got
> > committed/reviewed):
> > https://github.com/QubesOS/qubes-issues/issues/6411#issuecomment-153808=
9344
> > https://github.com/QubesOS/qubes-linux-kernel/pull/910 (some patches
> > changed since that PR, see the current main too).
>=20
> This would not affect host s2idle - it changes PV frontend devices.
>=20
> Do you libxl_domain_suspend_only() all domUs and then put dom0 into s0ix?

Yes, exactly.

> > > A domain resuming
> > > from s3 or s2idle disconnects its PV devices during resume.  The
> > > backends are not expecting this and do not reconnect.
> > >=20
> > > b3e96c0c7562 ("xen: use freeze/restore/thaw PM events for suspend/
> > > resume/chkpt") changed xen_suspend()/do_suspend() from
> > > PMSG_SUSPEND/PMSG_RESUME to PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE, but t=
he
> > > suspend/resume callbacks remained.
> > >=20
> > > .freeze/restore are used with hiberation where Linux restarts in a new
> > > place in the future.  .suspend/resume are useful for runtime power
> > > management for the duration of a boot.
> > >=20
> > > The current behavior of the callbacks works for an xl save/restore or
> > > live migration where the domain is restored/migrated to a new location
> > > and connecting to a not-already-connected backend.
> > >=20
> > > Change xenbus_pm_ops to use .freeze/thaw/restore and drop the
> > > .suspend/resume hook.  This matches the use in drivers/xen/manage.c f=
or
> > > save/restore and live migration.  With .suspend/resume empty, PV devi=
ces
> > > are left connected during s2idle and s3, so PV devices are not changed
> > > and work after resume.
> >=20
> > Is that intended? While it might work for suspend by a chance(*), I'm
> > pretty sure not disconnecting + re-reconnecting PV devices across
> > save/restore/live migration will break them.
>=20
> save/restore/live migration keep using .freeze/thaw/restore, which
> disconnects and reconnects today.  Nothing changes there as
> xen_suspend()/do_suspend() call the power management code with
> PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE.
>=20
> This patches makes .suspend/resume no-ops for PMSG_SUSPEND/PMSG_RESUME. W=
hen
> a domU goes into s2idle/S3, the backend state remains connected. With this
> patch, when the domU wakes up, the frontends do nothing and remain
> connected.

This explanation makes sense.

> > (*) and even that I'm not sure - with driver domains, depending on
> > suspend order this feels like might result in a deadlock...
>=20
> I'm not sure.  I don't think this patch changes anything with respect to
> them.
>=20
> Thanks for testing.
>=20
> Maybe the commit messages should change to highlight this is for domU PV
> devices?  struct xen_bus_type xenbus_backend does not define dev_pm_ops.

Good idea.

> Regards,
> Jason
>=20
> > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > > ---
> > >   drivers/xen/xenbus/xenbus_probe_frontend.c | 4 +---
> > >   1 file changed, 1 insertion(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen=
/xenbus/xenbus_probe_frontend.c
> > > index 6d1819269cbe..199917b6f77c 100644
> > > --- a/drivers/xen/xenbus/xenbus_probe_frontend.c
> > > +++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
> > > @@ -148,11 +148,9 @@ static void xenbus_frontend_dev_shutdown(struct =
device *_dev)
> > >   }
> > >   static const struct dev_pm_ops xenbus_pm_ops =3D {
> > > -	.suspend	=3D xenbus_dev_suspend,
> > > -	.resume		=3D xenbus_frontend_dev_resume,
> > >   	.freeze		=3D xenbus_dev_suspend,
> > >   	.thaw		=3D xenbus_dev_cancel,
> > > -	.restore	=3D xenbus_dev_resume,
> > > +	.restore	=3D xenbus_frontend_dev_resume,
> > >   };
> > >   static struct xen_bus_type xenbus_frontend =3D {
> > > --=20
> > > 2.34.1
> > >=20
> > >=20
> >=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--7URB8WNuJVC0wZb9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkuE8MACgkQ24/THMrX
1yyP5AgAkhl+NBtcgDULHljQUhGByww8Twt2ETkimFzpUKzLC2CcIvuEGf4vqjUm
gK+pc+lmtnIsTua+PJb86Ko5hOb1VLHtcx0zPLfHtF/zwngMIvZyOuCah+86ZjgF
3vEUkV6n56X10uMMY0J8VgPKERzF7mNelu06anIS0KphMHkp6IPeBVQ+KcSQZKFM
RjPmmiFVMFcVRybubrWmDquy+VbXxrarEVS/h6BZjyafrC35rlwSrLXhUhNjaBOF
sZ8MlEkXphgOG5Si4WZ2PrqNXPkGcBadfzjW19gWKah5HeNujr96iu+flQB5ndC1
6Dph+gWq07LKdJkcUCEpi4luOlsgSA==
=aTHl
-----END PGP SIGNATURE-----

--7URB8WNuJVC0wZb9--

