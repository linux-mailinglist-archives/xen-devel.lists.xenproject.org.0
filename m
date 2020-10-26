Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAFB2992B1
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 17:43:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12459.32441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX5aC-0008Qy-AO; Mon, 26 Oct 2020 16:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12459.32441; Mon, 26 Oct 2020 16:42:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX5aC-0008Qc-7C; Mon, 26 Oct 2020 16:42:56 +0000
Received: by outflank-mailman (input) for mailman id 12459;
 Mon, 26 Oct 2020 16:42:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wDZ8=EB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kX5aA-0008QW-1L
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:42:54 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.162])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4fbb5e75-b3de-4330-a118-c32a467ee0b2;
 Mon, 26 Oct 2020 16:42:53 +0000 (UTC)
Received: from aepfle.de by smtp.strato.de (RZmta 47.2.2 DYNA|AUTH)
 with ESMTPSA id R05874w9QGgi0nh
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 26 Oct 2020 17:42:44 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wDZ8=EB=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kX5aA-0008QW-1L
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:42:54 +0000
X-Inumbo-ID: 4fbb5e75-b3de-4330-a118-c32a467ee0b2
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.162])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4fbb5e75-b3de-4330-a118-c32a467ee0b2;
	Mon, 26 Oct 2020 16:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603730572;
	s=strato-dkim-0002; d=aepfle.de;
	h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=9XWjZUFzV7jHF8vOdUmxwfJm+gEsibSLLwGolDofJks=;
	b=be12kLkFMAoMXc1XC1BPXLm3nNMDRm79Th73F4PL35rEmPMGsJpYHCqd+Cpud/Hp2S
	dSjDJmq8zkpqwrxijVTTY5gWb8YYcfcLY5NR+G05DA6n+qwW+OsGYcST04sDFufIp9Y2
	mkkc3lHZtRLySXutP0dhapvjgSPGXuZzo7Y7b2weayLUHn/0+pAdjzXiPoGfaOkgcrct
	oIXI3LpyCS6tkERCqjdF8viVPx6Vc9YFAyUn7tIXz0XLe6FlB84sS8Xvo4KIb+2guJeW
	8glsRb+6Qh3o4DkciOvrYhkBTNzEkDaC5BATRFgl9cd2EruPAhYDDFFh6eg2wDac/evo
	S6qg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from aepfle.de
	by smtp.strato.de (RZmta 47.2.2 DYNA|AUTH)
	with ESMTPSA id R05874w9QGgi0nh
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
	Mon, 26 Oct 2020 17:42:44 +0100 (CET)
Date: Mon, 26 Oct 2020 17:42:39 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@citrix.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v7 01/11] libxl: Offer API
 versions 0x040700 and 0x040800
Message-ID: <20201026164239.GA27498@aepfle.de>
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
 <20191023130013.32382-2-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <20191023130013.32382-2-ian.jackson@eu.citrix.com>


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 23, Ian Jackson wrote:

> 0x040700 was introduced in 304400459ef0 (aka 4.7.0-rc1~481)
> 0x040800 was introduced in 57f8b13c7240 (aka 4.8.0-rc1~437)

> Anyway, in the meantime, we should fix it.  Backporting this is
> probably a good idea: it won't change the behaviour for existing
> callers but it will avoid errors for some older correct uses.

> +    LIBXL_API_VERSION != 0x040700 && LIBXL_API_VERSION != 0x040800 && \


Why was this never backported to staging-4.12 and older?
Please backport it to assist libvirt.

Olaf

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl+W/HoACgkQ86SN7mm1
DoDE+Q//ax8kFL5cwKFA/vjvEd0wkNIWx302HyvX9vblP0EmpVN/7YujOTWwcjsh
+UN2nZe0x5OuVH0R66j/IiRYGXUlt8TFLfiaOd0UT9G+yYgzA4rGWWWdgYPWmuAz
/4PH8RmQ+U1qA1bN5rdtxKnQ/LqBmfY7xgW6hJxmHGi2h7q0Rwheuo7NvkqpY2Al
d7+Px8THGw9Ny///Rpq3PPHs3GuZG7VWiCRI5zjHQ6zDny3z7KKW96UFrjJT4/Hh
t1hnxoZr0yQEAJPckA2oLIj9Jv/MbIYrEMIxGHGDBWbTVnHAGJh6A3gB9R07gjqG
Qwz317yr65arja/MffPSxaBLDmjxzD44BVEi/PbdmvbOlFzvCtv0U9Yzg59wAJ3K
jcmEAEcIop+0FECEPHbVZbNXzgopFDqo4fdh7/6giSWQsa7aRCIsfRypxyqKJMEa
uISme/qtMZ5YEFaGbJY/QxcFaDs5R1SAvS8COgmAombrssOEJVNBSAOVknDhYAJJ
O0EoJJJotQRVIuOAQ0Y1an+gHDtB4exjV8qL7CyoGir7pUCD0+u6F7j71pWT8lX9
Hpou/fSceC9MgrWDfRJ8nq4sOQY4oqcnnWiYrp7NR2ZN/aUFkwiNoxIQEhQxLnnD
uYR55pNFXQlzxO0F1RIwknJIUIEm5Cys81bWkp55Ocn87N43lw8=
=oIf3
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--

