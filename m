Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A126A56209D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 18:55:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358622.587906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6xR6-0005CR-VT; Thu, 30 Jun 2022 16:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358622.587906; Thu, 30 Jun 2022 16:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6xR6-00059n-S5; Thu, 30 Jun 2022 16:54:36 +0000
Received: by outflank-mailman (input) for mailman id 358622;
 Thu, 30 Jun 2022 16:54:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YJdO=XF=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1o6xR4-00059h-NM
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 16:54:35 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e9968d0-f895-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 18:54:31 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1199D3200A98;
 Thu, 30 Jun 2022 12:54:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 30 Jun 2022 12:54:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 12:54:26 -0400 (EDT)
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
X-Inumbo-ID: 4e9968d0-f895-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1656608067; x=
	1656694467; bh=PZ8y2SwjdybeYE5ENCPmmaaRYCWssikjiQNKImz8H0Q=; b=W
	B+IGWwmOeWWrmLajypGH9ua5TQlFYQnRJfR2hMe/I67Ke0BNSTVuYE3Z7KLPdp/J
	ZZ/bV4pOk/eFixVsBvQvOAO4KvmiCyvgju2S1s5tjlTv3qQKmZwEDacJwI4EohI9
	fhDhA0qbmD8qX2DHBThx6+dUXrcycHKEYLyJWnpkNq2q8CEeTwl68FyPTpVdiyOl
	DcmOrKNHASJtZOZXuHafgopGBgXOkhl9BAaVUIF3BEMgcam5wvIjo6NCXmynXvNP
	d2zhVsjptTQYqy0ZUcgYG95bXZi8KCZL/BrYNBwtWvNUxHlisDFvvYPRNq9RgvAU
	PLda5bFNMeLM5bWiq6wWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1656608067; x=1656694467; bh=PZ8y2SwjdybeYE5ENCPmmaaRYCWs
	sikjiQNKImz8H0Q=; b=RImnPROhbhyLe3jkqRzkBOjro5OiuIirdkHqLdF3BDGv
	VeSK0UA92HHQs0VL/TXKuXaujNyUmdg8MOdi19WCbFoCmuGdNPjTYv9remNwgurv
	QtuuBP+9k2sKTzA0mxNTeYZDArwdsp4c1KlBdwjB2AJGV7DKjHl5ZV17aCSsDpaw
	XunoVpAlGheSLlnIUuXt7tCHK2ikC9noG3ErI+jhaXVNMgr47bhuN2sBHUJPsqf1
	sZepebWiHrS8BzYinOgmmjKf21K7+dNfiYvnpYxmlNgXnyscayOyco9OVJikRxPw
	LGk5H+UV1Ff/O3MKMdmr8spRNRJuuYfZ2EanzF2W1w==
X-ME-Sender: <xms:Q9W9YmIhm0RcWi9PNc2UXpn9EGjRNisis_R7HxlmayWWsVv2cFcA7g>
    <xme:Q9W9YuJeWaBWUR0wzNQjw2vHqNVZP_yOPK1eTVpCwB979vu7un1-VeZNsOGIh7Fxy
    dgpPik5LRpuCtg>
X-ME-Received: <xmr:Q9W9YmvKBP1VGD6BSlDBUrCh9v_O3D3tkOO_7WlKx8PKe-ocRgzrNCkPAZ6R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehuddguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeugefgkeelffetkedtieekfffh
    udeutddufefgieeiuefgledvheegvdefteevtdenucffohhmrghinhepghhithhhuhgsrd
    gtohhmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:Q9W9Yra9bbJxz5PRgtapApQg3i6E3xcw07QOGe-SKjCdJZ4gFL4fUA>
    <xmx:Q9W9YtYON4UApqWc2dNnjZN9U7wQGDuNco3O1xiZvUR9uxZ5q_MOmg>
    <xmx:Q9W9YnAx9PHoTymym5gWQ-23QMpVz5q5GQjtaDh9RDpIaVx7aE3zaw>
    <xmx:Q9W9YsyJnrmXxR4L3pmDt2OCKvym_nZmYqmdVbBwnuGwgUpIkOfuuw>
Feedback-ID: iac594737:Fastmail
Date: Thu, 30 Jun 2022 12:54:02 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5.10] xen/gntdev: Avoid blocking in unmap_grant_pages()
Message-ID: <Yr3VQaM0NBcIV2Kl@itl-email>
Mail-Followup-To: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>,
	Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
	Xen developer discussion <xen-devel@lists.xenproject.org>
References: <20220627181006.1954-1-demi@invisiblethingslab.com>
 <Yr2KKpWSiuzOQr7v@kroah.com>
 <5136812e-e296-4acb-cafd-f189c4013ed3@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v8yNNVwv2qS6pEHy"
Content-Disposition: inline
In-Reply-To: <5136812e-e296-4acb-cafd-f189c4013ed3@suse.com>


--v8yNNVwv2qS6pEHy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jun 2022 12:54:02 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5.10] xen/gntdev: Avoid blocking in unmap_grant_pages()

On Thu, Jun 30, 2022 at 03:16:41PM +0200, Juergen Gross wrote:
> On 30.06.22 13:34, Greg KH wrote:
> > On Mon, Jun 27, 2022 at 02:10:02PM -0400, Demi Marie Obenour wrote:
> > > commit dbe97cff7dd9f0f75c524afdd55ad46be3d15295 upstream
> > >=20
> > > unmap_grant_pages() currently waits for the pages to no longer be use=
d.
> > > In https://github.com/QubesOS/qubes-issues/issues/7481, this lead to a
> > > deadlock against i915: i915 was waiting for gntdev's MMU notifier to
> > > finish, while gntdev was waiting for i915 to free its pages.  I also
> > > believe this is responsible for various deadlocks I have experienced =
in
> > > the past.
> > >=20
> > > Avoid these problems by making unmap_grant_pages async.  This requires
> > > making it return void, as any errors will not be available when the
> > > function returns.  Fortunately, the only use of the return value is a
> > > WARN_ON(), which can be replaced by a WARN_ON when the error is
> > > detected.  Additionally, a failed call will not prevent further calls
> > > from being made, but this is harmless.
> > >=20
> > > Because unmap_grant_pages is now async, the grant handle will be sent=
 to
> > > INVALID_GRANT_HANDLE too late to prevent multiple unmaps of the same
> > > handle.  Instead, a separate bool array is allocated for this purpose.
> > > This wastes memory, but stuffing this information in padding bytes is
> > > too fragile.  Furthermore, it is necessary to grab a reference to the
> > > map before making the asynchronous call, and release the reference wh=
en
> > > the call returns.
> > >=20
> > > It is also necessary to guard against reentrancy in gntdev_map_put(),
> > > and to handle the case where userspace tries to map a mapping whose
> > > contents have not all been freed yet.
> > >=20
> > > Fixes: 745282256c75 ("xen/gntdev: safely unmap grants in case they ar=
e still in use")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > > Reviewed-by: Juergen Gross <jgross@suse.com>
> > > Link: https://lore.kernel.org/r/20220622022726.2538-1-demi@invisiblet=
hingslab.com
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > ---
> > >   drivers/xen/gntdev-common.h |   7 ++
> > >   drivers/xen/gntdev.c        | 142 +++++++++++++++++++++++++--------=
---
> > >   2 files changed, 106 insertions(+), 43 deletions(-)
> >=20
> > All now queued up, thanks.
>=20
> Sorry, but I think at least the version for 5.10 is fishy, as it removes
> the tests for successful allocations of add->map_ops and add->unmap_ops.

That is definitely a bug; I will send another version (without your
Reviewed-by).

> I need to do a thorough review of the patches (the "Reviewed-by:" tag in
> the patches is the one for the upstream patch).

Yeah, that was my fault, sorry.

> Greg, can you please wait for my explicit "okay" for the backports?

Confirming that these patches do need review before they can be applied.
Juergen, would you mind making sure that the upstream patch was also
correct for 5.15 and 5.18?  It applied cleanly, but that is no guarantee
of correctness.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--v8yNNVwv2qS6pEHy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmK91UAACgkQsoi1X/+c
IsEvbhAAoIh6HQPIqGcjNkAeHjeZvnp4b9AHyj3CipQPoMRwmIKuJULrQcOsSeIi
gCuGuYudZkaM6OpX1AbRSD3g6TTxLIBatb6juCYOtFwDdA8Ujjh4DtKrSocRlUJX
GG5t05QJJAf59FPo6YjKRCr5WpOseqI9a2QkQyq4mF9xxNh3ngUHGnF3RXSJfYHe
vPBIqICFcvKNw+K/rfBNttGMohMdLYtizUf3SaXpleujAXrORFcKwxdNwWO2WRiE
rBJk9KXVDN05blJXYj7HWboDFq7oZ32pL6S5XJBS+8c1diFsajLK2bbO0znWZM7e
uc5ubK9PZ+wE6aqo/f2Hr5SFzZfz6dL1mQKSOJmPXcwullmhQGsiOwJZchrXnioW
OjONnxOYPHki2ml5MTNo9CQddZBJFT5JkyJaWkAED5c0++0bmQ1YXWP4N8l4ae7A
wve63nv5EjnKI2hFHmo3Tsq1eenpyyytk3NxJr0tdqpF9rdTMHV60Fftt4wGjnqG
FycnOfp7RRCiEeRluzV+Z16T9jDrqvt4fVJ0cLhG6/Fc2NVXEx95V5HbjQlsv2Cu
Rq1eLE/uHy3789bWIAAkyNANRkMKoLuws42XDZKrRd6BVfoOReT24MQPAU5KPAA1
mQG4mRyr1ELyCZRhAoiLDlCWOklRX1ZI0RmhPpgUK3EnamIBk8s=
=KbAB
-----END PGP SIGNATURE-----

--v8yNNVwv2qS6pEHy--

