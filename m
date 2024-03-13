Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2499887A1BA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 03:44:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692252.1079180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkEbM-00037n-GM; Wed, 13 Mar 2024 02:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692252.1079180; Wed, 13 Mar 2024 02:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkEbM-00034b-DD; Wed, 13 Mar 2024 02:44:20 +0000
Received: by outflank-mailman (input) for mailman id 692252;
 Wed, 13 Mar 2024 02:44:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PiNH=KT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1rkEbL-00034P-6n
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 02:44:19 +0000
Received: from fhigh6-smtp.messagingengine.com
 (fhigh6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94fe4cff-e0e3-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 03:44:16 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 47D2511400FD;
 Tue, 12 Mar 2024 22:44:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 12 Mar 2024 22:44:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Mar 2024 22:44:14 -0400 (EDT)
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
X-Inumbo-ID: 94fe4cff-e0e3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710297855;
	 x=1710384255; bh=GYRJqn4KcCLAurk+uRzEiVbVlEzim2rxDqmQhCSXp/g=; b=
	VaGCdqb/GObr7WitHItIIUzVUEBR7M9NBf6HrsPOoNKhWH+HmchRBhRTSyvpFc8q
	Gdh3TBH5h5D4DdokskzYnQFUaqIOlsKVlMyPkMEBBHrr7CmZ0bJ4yqd+QMuiRvIG
	Vh0Sq02fRyULoJ2rfIAPhMzNXk15pReWZ4em1NGA8AQBzkW+7I/SxH0yJiqANH7V
	W8V2sGGHP9nd7xBLKay0Dfux+epG8Jkuyy3PpvWQlfwuEZrx8gTraHSbPf3Bw/Kf
	N13Y47onWpE9IrQNnNJcWDM6+6DfZRsfyaaDkUyjv8SURmKntXo5qVHl8qmMTY6r
	8vaOqYaLtrvLsNtjputFWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710297855; x=1710384255; bh=GYRJqn4KcCLAurk+uRzEiVbVlEzi
	m2rxDqmQhCSXp/g=; b=mkoKLWefoEJIvbcv4FuLjTYq0gAIfk02MOcNiGa4Nsgv
	bGUISszENXOg/3T5OZ8gxKj2Yardx3zCwWEslnz1RdaPRVUwbRLBd1fGLYBq5bdB
	bIsCcFz1OYaWXDRlJCbH2zduXNPQI+SDX8uLv9cZye0F/CqazVheUgjtogEtaQNy
	T/pRYSrWSb3QTYUNg3gsl9wVyoQNwNOnD+UZdcwEAYWAROt6rLmYG1hqk9crdkM4
	V0Q75itz/1Tq//IJUllWGVB20SVNzGsNTczEWdBy86CVEjcGkrsljshZWqDGx19Y
	g4EzQq7QrBHNbu6jVHVP6tkeLu0PUfpYcQRBpW0izA==
X-ME-Sender: <xms:_hLxZarsanzDsYitmExmS53VwTZjAP5N8YfKCwabcCIC3Ag_NtPqkw>
    <xme:_hLxZYqc1ep4ZUBUKCmDy2GVen57VEIlqz0qUndesHthAeU0QJ_TOmacpsUZHKtJr
    B3WtBjTlz4sGf0>
X-ME-Received: <xmr:_hLxZfP6L9rweHHADSO97aaQ61hcD9IJ33nIlrgaMDJiGejvqwl10sRmGd8ZcZOrwQhj_O7QSpIjmJ1YtfkfMbOOhKZnnlMYdq38BeUd_lpWgtDi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeeggdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnheptdettdeuiedvfeeiudfgjedtuedtleef
    vdeukeeltddugeejvdeiudekfefhueetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:_xLxZZ6Xy1gRcxXwCfW-JNzokTbfrpvpoGr14Emrj_NrDxpv0bdV4w>
    <xmx:_xLxZZ5G074zaOf6k4R48zpQtKyYmCNDMDaflRe6z86kZWRq8RfnsA>
    <xmx:_xLxZZih9a8Yu0ZGKLlLVA3D0BtD6PobVoZSXu56iGmVWPhoAvk84A>
    <xmx:_xLxZT7vgdUon03UFsa-5NE4yP7BImIo10zP8s6eQcFCU9iG1l_g8g>
    <xmx:_xLxZTmip-bckz5aJWBduD6u5TGwiM5gxTHQbwbEAlJ8n5t01YorAA>
Feedback-ID: iac594737:Fastmail
Date: Tue, 12 Mar 2024 22:43:59 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.7-rc1+: WARNING at drivers/xen/evtchn.c:167
 evtchn_interrupt
Message-ID: <ZfES_eMFFSYVz8pG@itl-email>
References: <ZWf0sWey05VnpH7X@mail-itl>
 <644eda4c-ca1b-4a1b-bd13-c847df2f4c8e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M/79ak0UuVLDckIn"
Content-Disposition: inline
In-Reply-To: <644eda4c-ca1b-4a1b-bd13-c847df2f4c8e@suse.com>


--M/79ak0UuVLDckIn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Mar 2024 22:43:59 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.7-rc1+: WARNING at drivers/xen/evtchn.c:167
 evtchn_interrupt

On Tue, Mar 12, 2024 at 02:10:02PM +0100, Juergen Gross wrote:
> On 30.11.23 03:34, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > While testing 6.7-rc3 on Qubes OS I found several warning like in the
> > subject in dom0 log. I see them when running 6.7-rc1 too. I'm not sure
> > what exactly triggers the issue, but my guess would be unbinding an
> > event channel from userspace (closing vchan connection).
> >=20
> > Specific message:
> >=20
> > [   83.973377] ------------[ cut here ]------------
> > [   83.975523] Interrupt for port 77, but apparently not enabled; per-u=
ser 00000000a0e9f1d1
>=20
> Finally I think I have a fix (thanks to Demi for finding the problematic =
patch
> through bisecting).
>=20
> Could you please try the attached patch? It is based on current upstream,=
 but
> I think it should apply to 6.7 or stable 6.6, too.
>=20
>=20
> Juergen

> From 9d673c37b2d0c9aa274c53f619c4e9e43a419f41 Mon Sep 17 00:00:00 2001
> From: Juergen Gross <jgross@suse.com>
> To: linux-kernel@vger.kernel.org
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Cc: xen-devel@lists.xenproject.org
> Date: Tue, 12 Mar 2024 13:52:24 +0100
> Subject: [PATCH] xen/evtchn: avoid WARN() when unbinding an event channel
>=20
> When unbinding a user event channel, the related handler might be
> called a last time in case the kernel was built with
> CONFIG_DEBUG_SHIRQ. This might cause a WARN() in the handler.
>=20
> Avoid that by adding an "unbinding" flag to struct user_event which
> will short circuit the handler.
>=20
> Fixes: 9e90e58c11b7 ("xen: evtchn: Allow shared registration of IRQ hande=
rs")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/xen/evtchn.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
> index 59717628ca42..f6a2216c2c87 100644
> --- a/drivers/xen/evtchn.c
> +++ b/drivers/xen/evtchn.c
> @@ -85,6 +85,7 @@ struct user_evtchn {
>  	struct per_user_data *user;
>  	evtchn_port_t port;
>  	bool enabled;
> +	bool unbinding;
>  };
> =20
>  static void evtchn_free_ring(evtchn_port_t *ring)
> @@ -164,6 +165,10 @@ static irqreturn_t evtchn_interrupt(int irq, void *d=
ata)
>  	struct per_user_data *u =3D evtchn->user;
>  	unsigned int prod, cons;
> =20
> +	/* Handler might be called when tearing down the IRQ. */
> +	if (evtchn->unbinding)
> +		return IRQ_HANDLED;
> +
>  	WARN(!evtchn->enabled,
>  	     "Interrupt for port %u, but apparently not enabled; per-user %p\n",
>  	     evtchn->port, u);
> @@ -421,6 +426,7 @@ static void evtchn_unbind_from_user(struct per_user_d=
ata *u,
> =20
>  	BUG_ON(irq < 0);
> =20
> +	evtchn->unbinding =3D true;
>  	unbind_from_irqhandler(irq, evtchn);
> =20
>  	del_evtchn(u, evtchn);
> --=20
> 2.35.3

That fixes the problem, thanks!  Code looks good to me.

Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Tested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--M/79ak0UuVLDckIn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmXxEvwACgkQsoi1X/+c
IsEtYxAA0m0IK++qZ9W5goz39fvkwpoUlZ152rvGM/FEffgXsKIKzWs8vmaqD3tI
+flfjc0daq7ZxBqkRkqpL0J19pKsp7ih6lZc9/Av60v4YLHfNzMky+j4LiwpAgpf
swIDruBY43aqnI0ma0DxJY00nsAn30rGvn/h+45ulGN7VVXFborXEwPF1RnWxtWj
wBCAEVIEY6AMP06QmzeFp/sHlhlf0+K9kSeilAj/mb3yYRrWP//2ANJ8a9W0+LUc
O/g7iFuzj7nm6swCuMUe6fuFj0+x+yGTNgsa28gGusDw7jaExfYUnMJZzcfix7Uv
FkzcVggyf9T1HuKlvkTQItZbvVdj4EIrXnj7tRtNlIZBgshqENQ+2bGk5FYwQcs5
QswpDRg2aFrksHBnwRgSmzh/6SOsoSpvnGBMCRVl1df2w8BF47zEGo0vezHAghiA
c1QkKb2dtyLrX5fOzC7M/KE5zoRevO5Ka3WkzQZQcKAI7qW+XYydj6hGAuxxNbZv
URrZUZtzTocvGUeybEdMptkMukqGPFMkMuULKWHLOymfNwrW9R2pHN6gkVkp5DQO
g+o888tk/i8DlJUw59N+ctk48gP2FpPCyeENviGif/5MJGMj/fReZDNBHXmMH2uq
OGn8LiWbyK9CPK5Fjs7MxE9LQZtJc5ra6iBJgtozw8eyPtKGwCg=
=Qwf8
-----END PGP SIGNATURE-----

--M/79ak0UuVLDckIn--

