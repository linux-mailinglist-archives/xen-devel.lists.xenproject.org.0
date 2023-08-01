Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F976B6B9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 16:05:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574244.899515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpzT-00046L-4d; Tue, 01 Aug 2023 14:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574244.899515; Tue, 01 Aug 2023 14:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQpzT-00044h-1d; Tue, 01 Aug 2023 14:04:47 +0000
Received: by outflank-mailman (input) for mailman id 574244;
 Tue, 01 Aug 2023 14:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ewA3=DS=kernel.org=broonie@srs-se1.protection.inumbo.net>)
 id 1qQpzR-00044b-HR
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 14:04:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cefeb77-3074-11ee-b25c-6b7b168915f2;
 Tue, 01 Aug 2023 16:04:43 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 47857615B4;
 Tue,  1 Aug 2023 14:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7D0C433C7;
 Tue,  1 Aug 2023 14:04:37 +0000 (UTC)
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
X-Inumbo-ID: 5cefeb77-3074-11ee-b25c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690898681;
	bh=lI3n00luUKNfopH9HotLexiOPOuMEZpaKLOmB06ooZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEIpwVYkDq+meyS+F0NrjUec5s/e0v8SK2Iox7Y/zdkxJGa9HYCY+Qqv7P4WEfWkA
	 kAoMlWAh+2te7rC1NLxY/R2kSiuXFh8wAvmYJibLgpADDbLlPyB16g5LTBMwjlEn1a
	 G7PJjbM8fcOMRLDsi16jWNwGtrtbOMeTtKdLWHh8mu10k+SjrM2XtaV5pAZ4wWEZs7
	 c9odn6bRGk8znCKs/8LH6xAP+wHnp1AXA5K2jOPPBq43w9OqfSl9oJB/cc8ZMmTL21
	 1GOld3yySZ0K5npTLbN0VCfgXuNIqRPpImE/uS3azcZEP9z1QH5rL1s+UctXocUCsK
	 NCSFJqIkD2kfQ==
Date: Tue, 1 Aug 2023 15:04:34 +0100
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
Message-ID: <f4cee7c8-4399-41b2-bb3f-5d5dcac37ca8@sirena.org.uk>
References: <20230731154718.31048-1-tiwai@suse.de>
 <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
 <87h6pjj2ui.wl-tiwai@suse.de>
 <a02cf5c3-1fac-4ec6-9d9c-f8e8d0c067e0@sirena.org.uk>
 <87leeugbxm.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VsD3ApJSux4lzU26"
Content-Disposition: inline
In-Reply-To: <87leeugbxm.wl-tiwai@suse.de>
X-Cookie: I thought YOU silenced the guard!


--VsD3ApJSux4lzU26
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 01, 2023 at 02:54:45PM +0200, Takashi Iwai wrote:

> That's true.  The question is how more widely it'll be used, then.

Indeed.

> Is something like below what you had in mind, too?

Yes, or Andy's suggestion of just copying without trying to put a
redirect in works for me too.  I imagine there might be some
bikeshedding of the name, your proposal seems fine to me.

--VsD3ApJSux4lzU26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTJEPIACgkQJNaLcl1U
h9A8iAf/VmHGSowoYOko6J42O7KZJk6ZjskuMxi0WOqbX1goKvceOkJwETo8Cfzm
MrLOBWuTXcN5avbnlMHgH9HUEXcDXBFq+IUj/thURpKG+qdVrdqIwhKMzUcobR5T
DwqVPa45MfFzLxWBZwtl1nYXit0CAgTpar2lRq9GCWfHv3dwMGLNmvI67USOGHN0
3F8lmVRbVBzlZwOU+CTq+VBey5YGevoARVwdbbjdCnZwGYFWsO8OSRX+L207+mGa
LUEf7DHkkhqnQn8YNjYJmQD9al7Yp1DWBPA9P33bVWXXD22WlsbTDX5ofbJUOVrx
roVhdFa8eRp+iqemnmwT0/1rr0LHoA==
=qtD0
-----END PGP SIGNATURE-----

--VsD3ApJSux4lzU26--

