Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2622769F59
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:21:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573411.898085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWZz-00047V-3A; Mon, 31 Jul 2023 17:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573411.898085; Mon, 31 Jul 2023 17:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWZy-00044z-W5; Mon, 31 Jul 2023 17:21:10 +0000
Received: by outflank-mailman (input) for mailman id 573411;
 Mon, 31 Jul 2023 17:21:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SXid=DR=kernel.org=broonie@srs-se1.protection.inumbo.net>)
 id 1qQWZx-00044t-HO
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:21:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f9ee3ec-2fc6-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 19:21:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6234E6124B;
 Mon, 31 Jul 2023 17:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DD2C433C8;
 Mon, 31 Jul 2023 17:20:57 +0000 (UTC)
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
X-Inumbo-ID: 9f9ee3ec-2fc6-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690824060;
	bh=mftMsYiz9ZJ4o2udCBL/LK6NqmaRzMvUrLtaxc6+ExM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIuH/vWC0Z//bAHS2Y+ReRPL+XB6AshDM0VvyslpumMHkUh8btF1eBGmB+FVDNt2W
	 qm0tF94AwLtjbT/FtCTVDhM46eCHLOAXbsZYUTJtv7LyR/HrEWEphMZnZ7qKlGxkS0
	 1olJzc+vrxjV93iG+bTpCewIXkEnpr3fmc7cUV+zDrgq77F7ANAF1s+FHa8JxRJTQf
	 CrczT9BjPicytrwXkddCggE8BewLAKcejC+rpo1OwtcrZN13PtffSpA6r7b7VrYut0
	 PUhb+fLowx3LEBj6zKV+E8RhBYkBXxXGSeGYfN2RjgUK1+3pzQnmilsKv3Ax/zlPWN
	 1igMAnbI+UiIw==
Date: Mon, 31 Jul 2023 18:20:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-media@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/24] ALSA: Generic PCM copy ops using sockptr_t
Message-ID: <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qMccpUQ9T4oLw/AQ"
Content-Disposition: inline
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
X-Cookie: Single tasking: Just Say No.


--qMccpUQ9T4oLw/AQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2023 at 05:46:54PM +0200, Takashi Iwai wrote:

> this is a patch set to clean up the PCM copy ops using sockptr_t as a
> "universal" pointer, inspired by the recent patch from Andy
> Shevchenko:
>   https://lore.kernel.org/r/20230721100146.67293-1-andriy.shevchenko@linux.intel.com

> Even though it sounds a bit weird, sockptr_t is a generic type that is
> used already in wide ranges, and it can fit our purpose, too.  With
> sockptr_t, the former split of copy_user and copy_kernel PCM ops can
> be unified again gracefully.

It really feels like we ought to rename, or add an alias for, the type
if we're going to start using it more widely - it's not helping to make
the code clearer.

--qMccpUQ9T4oLw/AQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTH7XUACgkQJNaLcl1U
h9DwvAf+MAtXkGii5+gytkR+D3QTsuA6sY3aBk9dt1dWPILYWbXmsLkkIbGCtvq+
KIRLogTAKw9JbmzspD9GP/aj49lZi+dMH3wj9bfNKb9tJ1kfu5sSa8Bmr73fU/gy
tSYcApUWSN+uSIqVD6z7zDJj+BOa0gIUUQNbJxaPxp8YfsNTZAgCtB6forR7hI3h
OrPzmZkmMgkVjA1N/rHbWeubemc68OgSpUdUO1JF8wrGySsBmwXr/5VoVbBex+cK
Xg1f+g849RnopbiTFg1H7lfkp6wk1nQPWbtdq7y0Ws2HUkNqHS3Kmm4oVamjvlwP
ZmnL1wekh8FNsZS/jWPCv7xMdle/MQ==
=2oaj
-----END PGP SIGNATURE-----

--qMccpUQ9T4oLw/AQ--

