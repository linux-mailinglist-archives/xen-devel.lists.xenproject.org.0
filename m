Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD7F2AF443
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 15:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25007.52553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcraS-0005Us-0v; Wed, 11 Nov 2020 14:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25007.52553; Wed, 11 Nov 2020 14:59:03 +0000
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
	id 1kcraR-0005UT-U7; Wed, 11 Nov 2020 14:59:03 +0000
Received: by outflank-mailman (input) for mailman id 25007;
 Wed, 11 Nov 2020 14:59:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MbyH=ER=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kcraQ-0005UO-Gs
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:59:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d22b90c7-4e80-4be6-bcf0-320df311ce6c;
 Wed, 11 Nov 2020 14:59:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86A87ACB5;
 Wed, 11 Nov 2020 14:59:00 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MbyH=ER=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kcraQ-0005UO-Gs
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:59:02 +0000
X-Inumbo-ID: d22b90c7-4e80-4be6-bcf0-320df311ce6c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d22b90c7-4e80-4be6-bcf0-320df311ce6c;
	Wed, 11 Nov 2020 14:59:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605106740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D3/Zq17neIFpSSH5k12guAKQYUSdcYEQKVSHAdgq8t8=;
	b=dn4upLqIUtfzxPhEu3B6PGexhiT4tm6bZVF0ytY65876hLX3oiZhg9w+sJxsvWfB6t5cwr
	bTSQCJzcOfgt9HgIK146ZPvVEPLFNmADoFNcaVmZ67iO49GHsgC5IDAteXQ9EtutR8/zXK
	SIDyM2qgkpfwX5rzwNyV4K6JtnNnm90=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 86A87ACB5;
	Wed, 11 Nov 2020 14:59:00 +0000 (UTC)
Message-ID: <5f1f99784b91f1d44bb1907889191ca631261f3f.camel@suse.com>
Subject: Re: [PATCH 10/12] xen/hypfs: add cpupool directories
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, 
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	 <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Wed, 11 Nov 2020 15:58:59 +0100
In-Reply-To: <ef89463b-f93c-c098-4829-0fc430fc650a@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
	 <20201026091316.25680-11-jgross@suse.com>
	 <c5b12f33b4e3feb0d6f6bc51d5474b36fa42d881.camel@suse.com>
	 <ef89463b-f93c-c098-4829-0fc430fc650a@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-1dZlH0eB9hY5nPmF3yQd"
User-Agent: Evolution 3.38.1 (by Flathub.org) 
MIME-Version: 1.0


--=-1dZlH0eB9hY5nPmF3yQd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-11-11 at 15:56 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 11.11.20 15:51, Dario Faggioli wrote:
> >=20
> > What would you think about doing this in an helper function
> > (hypfs_cpupool_init() ?), implemented inside the above #ifdef and
> > as an
> > empty stub if !CONFIG_HYPFS ?
> >=20
> > That will save us from having the #ifdef-s again here.
> >=20
> > I'm asking because it's certainly not critical and I don't have a
> > too
> > strong opinion about it. But I do think the code would look better.
>=20
> I'm fine either way.
>=20
> In case nobody objects I'll change it.
>=20
Ok, cool. If you do that and resend, and that's the only change, you
can add:

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-1dZlH0eB9hY5nPmF3yQd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+r/DMACgkQFkJ4iaW4
c+7wrA//QnxRaExx3sJoXmefB6DbdcjWzuCo3MAVTTZNOVni61y3dRTmmxLVsUsH
v83QbM4uIt3irFyT4YXPl+dr6B5AttppaxDjkphyYfKVP2GUgjy1hAO2y/2GZRkP
kDX5jWIrqDBN/t3bkYYtW2D9g52NbnXuYOLspAlP567rzzTJrvGApfTL6qhMh0Yr
K1LOTTKDmDswTC2YTiCUJFitaB5UwMm0+rSk5ZFRx9h+rH/zdXbF9J1RsibH0IG8
+PV0q+93jdBLLPmuqAiYcrrMFKUKwfihu4C5R3TcG4//Au8Q7OQfJ//I4p38HrhR
mI5U86Yip8kJqGJejs164GfZm402MGeFQmzkAIgu5Dz7cPgPK3VrMNfiGRmoiEsq
EdP6VTw0tXEfpBY9w8U3fsqEucSJqePVTXx1CnL05dpGHtS5r6wFmtEzl92ssefR
2yxbNXRUhUkA4e9eza83ugApq+lt5u5lALQR9T+ufpLPM7OlinFwjcvqni4ybSrx
2vk7P9J5LkWezRtNI0td98nWvtMKtIRjsQVKxeIYpixV4iGAGrkSSxAFTK+2ns24
iWuaEytHJItcdRpYaTVcNTEWMXZVY+GbhNuQ+9c4IqczjEV+iPMyiu1drlXpQPHB
Qgs+OFOcHxlZCGECLnrYqGEb3d9wU3Or334gRXRFMD5GrsuxVGU=
=pOLf
-----END PGP SIGNATURE-----

--=-1dZlH0eB9hY5nPmF3yQd--


