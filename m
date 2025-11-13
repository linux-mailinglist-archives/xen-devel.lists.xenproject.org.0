Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DB1C598A9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 19:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162068.1489859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJcHs-0004Zm-J9; Thu, 13 Nov 2025 18:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162068.1489859; Thu, 13 Nov 2025 18:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJcHs-0004XZ-EJ; Thu, 13 Nov 2025 18:43:16 +0000
Received: by outflank-mailman (input) for mailman id 1162068;
 Thu, 13 Nov 2025 18:43:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25e8=5V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vJcHr-0004XT-Jd
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 18:43:15 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bb46672-c0c0-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 19:43:13 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 0C9A71D00313;
 Thu, 13 Nov 2025 13:43:12 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Thu, 13 Nov 2025 13:43:12 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Nov 2025 13:43:09 -0500 (EST)
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
X-Inumbo-ID: 9bb46672-c0c0-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763059391;
	 x=1763145791; bh=lXxLZsOxpREcR2HuC2Fg0UpqH2BHTtEmo6JxubieZyA=; b=
	KAOtBBApaFoXo1ev2sX81dEjpOwSx88xDiKvL17DK5xSVzR9tOrpSTH/LDKso1dE
	HygUFq4ywRQEYw8SwDZKXR1g+4GoO4l7GfvuiP5vYyjFdwcet9nB4JD9UwQzJNHd
	3VzVP8huy6E2TVOaU0B1LWLY2owM34eGxa3ZIHjhPb/HUuQBWKKxPLXLsug/CuGw
	lg1WzBfeOyY7EhojcnvRS/yvdr9FCxUzB+nqL2u7X5BJrgQEiYcCL8BfkKBKuDD2
	iM2SfPWznqdRoz5OxuhonR3UWo2YYO23ZMBLmXjw5uAp6kkkDi9LRswZc0JDzDFJ
	GFNMwa19WFedVK3SXXV/FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1763059391; x=1763145791; bh=lXxLZsOxpREcR2HuC2Fg0UpqH2BHTtEmo6J
	xubieZyA=; b=okJS8zZIk6KNPbQrqKWzVNt0s75dEtfV5QtmgKKaVKhFLkD6+/t
	1lrjxKCrCDB4ZDDprpNf+jR4QZx1w9r6LgoYezwARBetfnNaPWun4csiKshjXn6/
	xhOvLtRkDI3tEozbJ3E5PZss6q5UQ1/+OiJ0+mbDp1eqhQvj3dycQEKNAdQUrF/i
	naOhOszABdDE3OsqYWUkeokID4Oy0TcD5IZgF7aCoAKc89GGBt87qXEYqT+4O1lO
	nhmCtJ462psyqWGR2hmFrw9TK2S8Kb1DGsDXlJBZiLyzmYj8i1B8YyKZFxJnD1Zf
	1/rg9vQ6zmPJZdbzujYmFpDlnH1/AeCECkQ==
X-ME-Sender: <xms:viYWaflcrBwHFfi9H4DAVYlkWZTPuEf4PNzZShGPUAO7_-n_f5HvIg>
    <xme:viYWae1JL5W2mtFO8mr-uBCpLv-9GhtfaZT13kaNOhfxFFI800ON-ykEcuCfbEZzD
    P9LPmJmoapQJMx4jWIQ57kXDlKuZd9oQK-uau9SyZ58fPcMecE>
X-ME-Received: <xmr:viYWaX24zDD4Emr8zQXTEC4UQFRzLvK9og_DIq56jQcBNmere7U7BZ5XtEhbSNOdG_3JTGuvNXHmmRR10JS4m0BOsThlztgROMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdejieelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieeluddv
    keejueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhl
    ihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhlvghkshgrnhgurhgpthihsh
    hhtghhvghnkhhosegvphgrmhdrtghomhdprhgtphhtthhopehjihgrnhhgrdhpvghnghel
    seiithgvrdgtohhmrdgtnhdprhgtphhtthhopegthhgvnhhqihhujhhiieeiieesghhmrg
    hilhdrtghomhdprhgtphhtthhopehjrghsohhnrdgrnhgurhihuhhksegrmhgurdgtohhm
    pdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrd
    horhhg
X-ME-Proxy: <xmx:viYWaYq72mAbLE6ZjHOIexKo5CBfw5XhM-X8ivyjDyycQKzAVXdNww>
    <xmx:viYWabiq9dfFJCgJNel92GabUZMqPSE0uMT3D2yUSVQR3P-x7Mvvqg>
    <xmx:viYWac-1J6roKTKpn4zsuYd58CvB4D6-PQIoNUj571oenr_wTchgMA>
    <xmx:viYWafWSlL5Tb8_48cWM70HjW6QP0nZRK0CpZAjSSnK_slG9toGbWA>
    <xmx:vyYWac8fLx6NH354UureVdHrvxp2BRJzEP9yIXe4imP6SXmX4CqXqFro>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 13 Nov 2025 19:43:07 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Peng Jiang <jiang.peng9@zte.com.cn>,
	Qiu-ji Chen <chenqiuji666@gmail.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/xenbus: better handle backend crash
Message-ID: <aRYmuwW5rShXqMj1@mail-itl>
References: <20251102032105.772670-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oRemhD1n1wZhbvYq"
Content-Disposition: inline
In-Reply-To: <20251102032105.772670-1-marmarek@invisiblethingslab.com>


--oRemhD1n1wZhbvYq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Nov 2025 19:43:07 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Peng Jiang <jiang.peng9@zte.com.cn>,
	Qiu-ji Chen <chenqiuji666@gmail.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/xenbus: better handle backend crash

Ping?

On Sun, Nov 02, 2025 at 04:20:12AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> When the backend domain crashes, coordinated device cleanup is not
> possible (as it involves waiting for the backend state change). In that
> case, toolstack forcefully removes frontend xenstore entries.
> xenbus_dev_changed() handles this case, and triggers device cleanup.
> It's possible that toolstack manages to connect new device in that
> place, before xenbus_dev_changed() notices the old one is missing. If
> that happens, new one won't be probed and will forever remain in
> XenbusStateInitialising.
>=20
> Fix this by checking backend-id and if it changes, consider it
> unplug+plug operation. It's important that cleanup on such unplug
> doesn't modify xenstore entries (especially the "state" key) as it
> belong to the new device to be probed - changing it would derail
> establishing connection to the new backend (most likely, closing the
> device before it was even connected). Handle this case by setting new
> xenbus_device->vanished flag to true, and check it before changing state
> entry.
>=20
> And even if xenbus_dev_changed() correctly detects the device was
> forcefully removed, the cleanup handling is still racy. Since this whole
> handling doesn't happend in a single xenstore transaction, it's possible
> that toolstack might put a new device there already. Avoid re-creating
> the state key (which in the case of loosing the race would actually
> close newly attached device).
>=20
> The problem does not apply to frontend domain crash, as this case
> involves coordinated cleanup.
>=20
> Problem originally reported at
> https://lore.kernel.org/xen-devel/aOZvivyZ9YhVWDLN@mail-itl/T/#t,
> including reproduction steps.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> ---
> I considered re-using one of existing fields instead of a new
> xenbus_device->vanished, but I wasn't sure if that would work better.
> Setting xenbus_device->nodename to NULL would prevent few other places
> using it (including some log messages). Setting xenbus_device->otherend
> might have less unintentional impact, but logically it doesn't feel
> correct.
>=20
> With this patch applied, I cannot reproduce the issue anymore - neither
> with the simplified reproducer script, nor with the full test suite.
> ---
>  drivers/xen/xenbus/xenbus_client.c |  2 ++
>  drivers/xen/xenbus/xenbus_probe.c  | 25 +++++++++++++++++++++++++
>  include/xen/xenbus.h               |  1 +
>  3 files changed, 28 insertions(+)
>=20
> diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenb=
us_client.c
> index e73ec225d4a61..ce2f49d9aa4ad 100644
> --- a/drivers/xen/xenbus/xenbus_client.c
> +++ b/drivers/xen/xenbus/xenbus_client.c
> @@ -275,6 +275,8 @@ __xenbus_switch_state(struct xenbus_device *dev,
>   */
>  int xenbus_switch_state(struct xenbus_device *dev, enum xenbus_state sta=
te)
>  {
> +	if (dev->vanished)
> +		return 0;
>  	return __xenbus_switch_state(dev, state, 0);
>  }
> =20
> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbu=
s_probe.c
> index 86fe6e7790566..3c3e56b544976 100644
> --- a/drivers/xen/xenbus/xenbus_probe.c
> +++ b/drivers/xen/xenbus/xenbus_probe.c
> @@ -444,6 +444,9 @@ static void xenbus_cleanup_devices(const char *path, =
struct bus_type *bus)
>  		info.dev =3D NULL;
>  		bus_for_each_dev(bus, NULL, &info, cleanup_dev);
>  		if (info.dev) {
> +			dev_warn(&info.dev->dev,
> +			         "device forcefully removed from xenstore\n");
> +			info.dev->vanished =3D true;
>  			device_unregister(&info.dev->dev);
>  			put_device(&info.dev->dev);
>  		}
> @@ -659,6 +662,28 @@ void xenbus_dev_changed(const char *node, struct xen=
_bus_type *bus)
>  		return;
> =20
>  	dev =3D xenbus_device_find(root, &bus->bus);
> +	/* Backend domain crash results in not coordinated frontend removal,
> +	 * without going through XenbusStateClosing. Check if the device
> +	 * wasn't replaced to point at another backend in the meantime.
> +	 */
> +	if (dev && !strncmp(node, "device/", sizeof("device/")-1)) {
> +		int backend_id;
> +		int err =3D xenbus_gather(XBT_NIL, root,
> +				        "backend-id", "%i", &backend_id,
> +					NULL);
> +		if (!err && backend_id !=3D dev->otherend_id) {
> +			/* It isn't the same device, assume the old one
> +			 * vanished and new one needs to be probed.
> +			 */
> +			dev_warn(&dev->dev,
> +				 "backend-id mismatch (%d !=3D %d), reconnecting\n",
> +				 backend_id, dev->otherend_id);
> +			dev->vanished =3D true;
> +			device_unregister(&dev->dev);
> +			put_device(&dev->dev);
> +			dev =3D NULL;
> +		}
> +	}
>  	if (!dev)
>  		xenbus_probe_node(bus, type, root);
>  	else
> diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
> index 7dab04cf4a36c..43a5335f1d5a3 100644
> --- a/include/xen/xenbus.h
> +++ b/include/xen/xenbus.h
> @@ -87,6 +87,7 @@ struct xenbus_device {
>  	struct completion down;
>  	struct work_struct work;
>  	struct semaphore reclaim_sem;
> +	bool vanished;
> =20
>  	/* Event channel based statistics and settings. */
>  	atomic_t event_channels;
> --=20
> 2.51.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--oRemhD1n1wZhbvYq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkWJrsACgkQ24/THMrX
1ywbfAgAmQnHHJlmbMTOX3RtNPXxgqaSefI2mnhv5lYA7X74m8OZxYA6RV/AIkU/
yAVUPQmOahNBjJnSGhkTTV2aFgyf+r5O63Hr9eFGgbGY6TH416bgXLj/dJ/cfLgL
OWxAhSF9TphGmIu1Aqm/JmkM7dic8yTNoL72eKdHY2oKie6dqtX6NfmJEwxrQYwP
iw1pP1A2tWDR+mzfvm4p+camWTAxlYc59CgA5VKOGcb9XsC6PxPXteIkG70bz/iv
d1FywMWsOTb4buaLMRGAGATEOhrK5BY5nPO3uYRogL0EB8zBVUJOIIlLlOYma8GV
G21Rrxa+gQvJtJM73m47Tj0cq8O+TQ==
=/ugj
-----END PGP SIGNATURE-----

--oRemhD1n1wZhbvYq--

