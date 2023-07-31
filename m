Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C772176A169
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 21:41:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573448.898155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQYkr-0004x8-HS; Mon, 31 Jul 2023 19:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573448.898155; Mon, 31 Jul 2023 19:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQYkr-0004vU-Dv; Mon, 31 Jul 2023 19:40:33 +0000
Received: by outflank-mailman (input) for mailman id 573448;
 Mon, 31 Jul 2023 19:40:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SXid=DR=kernel.org=broonie@srs-se1.protection.inumbo.net>)
 id 1qQYkp-0004vO-Nc
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 19:40:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a7ad81e-2fda-11ee-b256-6b7b168915f2;
 Mon, 31 Jul 2023 21:40:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21202612A4;
 Mon, 31 Jul 2023 19:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B911C433C8;
 Mon, 31 Jul 2023 19:40:23 +0000 (UTC)
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
X-Inumbo-ID: 1a7ad81e-2fda-11ee-b256-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690832427;
	bh=cECi6X2ci0DniQ5oeatUmvY4BynKLN24yIpTW2oqPUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pu9Dt3cSyPkYegGJ9c3RcGLOHMiyjYlxy/c+dwSkik3hsSr6ii0UfV6pPXMzZSw29
	 fNPgqyOvrwfliVIKt5AJGy9mdsQbq2/YtSbIgqQrylUNJRxumy+84RfsQmE4Dw5kIF
	 jE0dvSuBEn8+vMUiwPMxmECNCKPjy6HouNQ0BIEvdwkJur+8uYFtYjgVvSnIKWzQdM
	 DDHosgDyhiqhIGv4zx2nbjuiMqJIOMvgMg3B1WrnybC49P4DpFjq9Uo8HNWIZo+caz
	 wxxRfmO6DVmxgkHaE5PiQMgBuzVfh8Ofd2/8j1UG5oO7efcMiHxz3k5Js6tEMzyyfc
	 PmqH1QqxTbzQg==
Date: Mon, 31 Jul 2023 20:40:20 +0100
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
Message-ID: <a02cf5c3-1fac-4ec6-9d9c-f8e8d0c067e0@sirena.org.uk>
References: <20230731154718.31048-1-tiwai@suse.de>
 <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
 <87h6pjj2ui.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MD/Kb6s/g3sL17i7"
Content-Disposition: inline
In-Reply-To: <87h6pjj2ui.wl-tiwai@suse.de>
X-Cookie: Single tasking: Just Say No.


--MD/Kb6s/g3sL17i7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2023 at 09:30:29PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > It really feels like we ought to rename, or add an alias for, the type
> > if we're going to start using it more widely - it's not helping to make
> > the code clearer.

> That was my very first impression, too, but I changed my mind after
> seeing the already used code.  An alias might work, either typedef or
> define genptr_t or such as sockptr_t.  But we'll need to copy the
> bunch of helper functions, too...

I would predict that if the type becomes more widely used that'll happen
eventually and the longer it's left the more work it'll be.

--MD/Kb6s/g3sL17i7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTIDiMACgkQJNaLcl1U
h9AUpgf+MRJ3Ppt4G8lH1I84wnMH5JXZKHV/vI1aV9xjjvXIKtZE/+CSYf6550C7
PPTHfzwnBYOTWVgfWpHzHkq4xz7gabS1iz+uA8zxlWUAANI55/958s9gfaUZuSaT
Iepv46KwktU7+VbRzRMDAmgONLI5mwne+8NxLW50eigUKQI9f+oP9W8xpmdP2d22
oGEIbn/BHmGWoQ6RPfY3HT2g3FVmr8i63MfkUTWDuJJ28/NrYttI78uMnxTIQ6sD
iGPaAtosS7XVd0iLf5CX4pxb+YoTNLQvC1dUX7PJ6bqZ5d140yXESPgyw3Lp8Q8l
WoEQ/BSZ7E+q6JpVPksvRB7XC1vkAA==
=VfqI
-----END PGP SIGNATURE-----

--MD/Kb6s/g3sL17i7--

