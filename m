Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3C13F0565
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 15:55:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168260.307205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGM1N-0007Mb-UW; Wed, 18 Aug 2021 13:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168260.307205; Wed, 18 Aug 2021 13:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGM1N-0007JJ-QW; Wed, 18 Aug 2021 13:54:21 +0000
Received: by outflank-mailman (input) for mailman id 168260;
 Wed, 18 Aug 2021 13:54:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AKgd=NJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mGM1M-0007JD-Rb
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 13:54:20 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c891ee48-002b-11ec-a557-12813bfff9fa;
 Wed, 18 Aug 2021 13:54:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A6C1F22077;
 Wed, 18 Aug 2021 13:54:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 625E513DF8;
 Wed, 18 Aug 2021 13:54:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VEnsFQoRHWGBSQAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Wed, 18 Aug 2021 13:54:18 +0000
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
X-Inumbo-ID: c891ee48-002b-11ec-a557-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629294858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2YbY10+NGpKrGppmyiyZVAv5mvImyBr9mjnPtIxuXFE=;
	b=TqdCXERx6vUu7Ke6yX3lQX86UfqMnCziMNRSENygulLhoCmfFqaJFz6XGCoFfgNX+wPcQ/
	SBXnUXB6wA7RTCOJrRMsp/WXGzsb9N6P8TAo+E0jSTGQ3WH6O1VC+tx5jqoSesEhSDvXHC
	8zzu2PwPW9R0kampTjdfr1ddz+k5aSw=
Message-ID: <ee399fcbf01ac32a4b26cc9660f400b8d60148b1.camel@suse.com>
Subject: Re: [PATCH] xen/sched: fix get_cpu_idle_time() for smt=0
 suspend/resume
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Marek
	=?ISO-8859-1?Q?Marczykowski-G=F3recki?=
	 <marmarek@invisiblethingslab.com>, Jan Beulich <JBeulich@suse.com>
Date: Wed, 18 Aug 2021 15:54:17 +0200
In-Reply-To: <20210818102136.23797-1-jgross@suse.com>
References: <20210818102136.23797-1-jgross@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-fx8KqQmfsqiV4+IklIdZ"
User-Agent: Evolution 3.40.3 (by Flathub.org) 
MIME-Version: 1.0


--=-fx8KqQmfsqiV4+IklIdZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-08-18 at 12:21 +0200, Juergen Gross wrote:
> Fix that by letting get_cpu_idle_time() deal with this case.
>=20
> Fixes: 132cbe8f35632fb2 ("sched: fix get_cpu_idle_time() with core
> scheduling")
> Reported-by: Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Tested-by: Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com>
>
Mmm... This is an interesting one. In fact, this fix is not only
correct, it's also simple, effective and (I guess) easy enough to
backport.

Considering all these things together with the fact that we have an
open issue, I'm going to provide my:

Acked-by: Dario Faggioli <dfaggioli@suse.com>

(and this remains valid with Jan's proposed change done upon
committing.)

That said, in the long run...

> ---
> An alternative way to fix the issue would be to keep the
> sched_resource
> of offline cpus allocated like we already do with idle vcpus and
> units.
> This fix would be more intrusive, but it would avoid similar other
> bugs
> like this one.
>=20
... it would be probably interesting to go this route, as it looks both
more consistent and future proof (I mean implement it proactively,
independently of issues... when/if we have time, of course!)

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-fx8KqQmfsqiV4+IklIdZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmEdEQkACgkQFkJ4iaW4
c+474RAAqhfZ6gHj0oKXUOIy8ut9sDzthwfReOler5pKUVtOQpGxN2bTD/gBKoYB
ztV5evuKAfo0IG+k7FBDcIL3k7iz0yoZ2pkQcaegRWKEyCCxMn1Y9N/6seQWxufL
Vglisjnmh5uRlgm6/9qYEHzYz8rCvq5NwfNwDUXKTnPLzeUVvlacLSF3wy0+kLO0
CKrbWJKvkaDTzS2h2b9rSZsT8p/Zv5PY9pv/sDixD4nGFnki2E8z3g8y+K0QpX+q
FgeeZBP6XGfNiTShUrMhtJFsds0VCRswYWmJl1/cv2V0UlTj8HcO7B1zoX9uRFsy
g9lQ4pekcNhLTNklJ7Hp59i5sSqgj3O8PwWOeUeFKDl8M+76ZC+yLqfWlQencREE
WPdJOBZnm/9DfAj4/F3nwJU+wwS+58SKRXpX8n2+FG+vyqzJW1XhPxMsYlxwPhut
icaKgoPqewhaue2BX21Kdn523abFaxZkSW/4ifJ+GAdcEJc3PsLH9EpbOfm4twRv
Jrupf6lvwkK7YVWmFLLxCMnsFbV7TES930gYpZwqD8A4K8ZYa8u7ZNPr27vhiCpK
hYCNQZgOv+7m5fYPKPjKlBJvptySOCBvv8WHHB/euX43jfT+B7hL5SuGv+rVrarD
e9p7N98Xc7HP55zzJBpFO9U+YClQvk59zAp8QSS5vXKd0aSx0eI=
=4ZXL
-----END PGP SIGNATURE-----

--=-fx8KqQmfsqiV4+IklIdZ--


