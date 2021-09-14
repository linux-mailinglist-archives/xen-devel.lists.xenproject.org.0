Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1189640BAE2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 00:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187032.335767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQGT1-0005gM-Mk; Tue, 14 Sep 2021 21:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187032.335767; Tue, 14 Sep 2021 21:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQGT1-0005eX-JI; Tue, 14 Sep 2021 21:59:51 +0000
Received: by outflank-mailman (input) for mailman id 187032;
 Tue, 14 Sep 2021 21:59:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H4Zq=OE=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mQGSz-0005eR-Hw
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 21:59:49 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13eefe68-15a7-11ec-b47c-12813bfff9fa;
 Tue, 14 Sep 2021 21:59:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A4A70220D6;
 Tue, 14 Sep 2021 21:59:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 556AB13B49;
 Tue, 14 Sep 2021 21:59:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A3ynEVMbQWErRQAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Tue, 14 Sep 2021 21:59:47 +0000
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
X-Inumbo-ID: 13eefe68-15a7-11ec-b47c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631656787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DT2mo4YQXCWOZfAQDx5c+qpw2Ym6EeOsdPLQJRc1VzY=;
	b=hXZBP/SmVpzFNB8Uxt3WoFP2AMF7Nt+PLzYKQ2qsefBF/yx1/7LFLCLIvVNVWH7xIQKFSp
	/szUW80UpMLTg2vZ+si3PbEpgRqTvagBDIfKIoYoXvpW+AxG+Z9p5SdJYPLYhkVG69rhNm
	Mas2DRWCCTUpuQXKU0pIUonoIRWBk6E=
Message-ID: <3ec7f4bc4859f18aa6514634640ef343e21d9f08.camel@suse.com>
Subject: Re: [PATCH v2] xen/sched: fix sched_move_domain() for domain
 without vcpus
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Bertrand Marquis
	 <bertrand.marquis@arm.com>
Date: Tue, 14 Sep 2021 23:59:46 +0200
In-Reply-To: <20210908130440.24605-1-jgross@suse.com>
References: <20210908130440.24605-1-jgross@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-3wODEDxs4cxVYALalTL0"
User-Agent: Evolution 3.40.3 (by Flathub.org) 
MIME-Version: 1.0


--=-3wODEDxs4cxVYALalTL0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-09-08 at 15:04 +0200, Juergen Gross wrote:
> In case a domain is created with a cpupool other than Pool-0
> specified
> it will be moved to that cpupool before any vcpus are allocated.
>=20
> This will lead to a NULL pointer dereference in sched_move_domain().
>=20
> Fix that by tolerating vcpus not being allocated yet.
>=20
> Fixes: 70fadc41635b9b6 ("xen/cpupool: support moving domain between
> cpupools with different granularity")
> Reported-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-3wODEDxs4cxVYALalTL0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmFBG1IACgkQFkJ4iaW4
c+7d4BAAzaro6gaPS24vkVSea4BZAp8J0v3MUm5CkdKJJ8yyYAIoaawwRKtYeziN
RGDWfp1fP5dLwwohmZAACdxsfidid7qVhmOQxtwId1McMpdwsL6OjEveEvHT8rwQ
KXz2pBTopQk7qiErSkVvUCMxvvN5fg9AIjNrz9+8Pxc7LAMu6NtLS/V6yE8xhh+W
CLsvZrDqU/34z9Bm0hm1SgNxROxrYb2Kt7VKUbqz6peic6/rTkd1LctS0G613BZ5
/L+DTQJ+4ILyjfReGNMyCg4HzbXgpVFfs3A3fock/2z8hH/gOybsnZUxJf7IkwuZ
bVceVxSnEJqPLRzK+dOmnsKf5gfXrYMlOwVdu954TEq/yOzEuDPdmv4kAWoB0wqn
ohDbTm13RF+YZUTPMxEpdXIY3JKEECUGIP31tQVs0CGXp9IYHeNJAxCu1WA3iGwJ
Pahr9qQEZ2fKQ++ER7eABR7hS9VEr7An9qq2pVo3S7qKia/k5l+daQ0KGPYgonFY
Y6Ngs5CrAMUcfFzHYrdqCpSux8k1DYSsXAxg+3+d02v7gHYRVbrNmqvLkE6+2qOL
DFGtUjf/12+tYn6ecHcPD+hCg/QoeaF7hKd9MLg+CgorQhe8UNLIT77M/NssZ5YA
kTEZ0lXhQfUuDq3RfMKnH3tRHEwufFTDZ2m/RYBXtfA7Lew3fy0=
=qpA8
-----END PGP SIGNATURE-----

--=-3wODEDxs4cxVYALalTL0--


