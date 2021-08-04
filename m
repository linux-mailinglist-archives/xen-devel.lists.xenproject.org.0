Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFF83E06FD
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 19:53:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163812.299947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBL59-0007lX-Hb; Wed, 04 Aug 2021 17:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163812.299947; Wed, 04 Aug 2021 17:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBL59-0007in-Cj; Wed, 04 Aug 2021 17:53:31 +0000
Received: by outflank-mailman (input) for mailman id 163812;
 Wed, 04 Aug 2021 17:53:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RR6J=M3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mBL57-0007id-7X
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 17:53:29 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dee28458-f54c-11eb-9b8d-12813bfff9fa;
 Wed, 04 Aug 2021 17:53:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C2F45222E2;
 Wed,  4 Aug 2021 17:53:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E1D013C39;
 Wed,  4 Aug 2021 17:53:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6jg5HBbUCmEwKwAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Wed, 04 Aug 2021 17:53:26 +0000
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
X-Inumbo-ID: dee28458-f54c-11eb-9b8d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1628099606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BbiZWIdalbCJ5Uth/1zWf+jPJMER/nr4Pi2HURLzJUM=;
	b=faW+xHGzjwppgvE1IJeFisrdQy/2WIqdw7TXIJTae8fIev8XM3H9WvpKxdh5q2792aFc7w
	DctcpgFzlmrwb0lVmUROpF4Ih6BqS54SMoROrY3aTaJq7/F3NVKvubquB3vfJQVAb0L0Db
	arWhm47OmahOk/gQDHao5syIY/PWRPE=
Message-ID: <ff69b9f42d732a012c9c8c1b91eb266568885fc1.camel@suse.com>
Subject: Re: [PATCH] Xen: credit2: avoid picking a spurious idle unit when
 caps are used
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 04 Aug 2021 19:53:25 +0200
In-Reply-To: <96a43429-798e-1bb9-7718-9ccf02d7dfeb@suse.com>
References: <162801221667.955.3439735419862661383.stgit@Wayrath>
	 <d8c821f4-8cdf-8d77-90cb-5149a70c7741@suse.com>
	 <dc1f7b4c18e46d1cdadedc9db2fcab516ad4cc81.camel@suse.com>
	 <96a43429-798e-1bb9-7718-9ccf02d7dfeb@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-+YNZwO6VqKyxhXikzfCv"
User-Agent: Evolution 3.40.3 (by Flathub.org) 
MIME-Version: 1.0


--=-+YNZwO6VqKyxhXikzfCv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-08-04 at 17:13 +0200, Jan Beulich wrote:
> On 04.08.2021 15:28, Dario Faggioli wrote:
> >=20
> > So, was it this you were asking about and, if yes, does this answer
> > your concerns?
>=20
> Yes, it does.=C2=A0
>
Ok, great. :-)

> I continue to think though that the "yield" variable
> could do with either a comment along the lines of what you've
> explained, or with it getting set to true in more cases (as
> indicated), as the interaction with the credit comparisons isn't
> very obvious right now (to me at least).
>=20
Fine. This is not for this patch, of course. But I'll make a note about
it, and think how to restructure the code to make it easier to
understand, in a followup patch.

> > With either my code or above the suggested form, we don't, but we
> > may
> > have to do at least the priority check for all the elements of the
> > runqueue. This was something I knew, and as a matter of fact, it
> > should
> > be quick enough (and comparable with doing expensive checks even on
> > just 1 vCPU). But still, it's ugly.
> >=20
> > However, we know that the runqueue is sorted by credits!
>=20
> Oh - I was first thinking it might be, but seeing all the logic I
> (wrongly, as you now tell me) inferred it's unsorted.
>=20
Yeah, it certainly wasn't evident, from how the patch was done.

Thanks for your comment, that actually made it realize that I could do
things like that, and indeed with even so much less code churn!

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-+YNZwO6VqKyxhXikzfCv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmEK1BUACgkQFkJ4iaW4
c+6FBw/+Pg/BfdaJi9QTzVTLLvU8weDhTHtdn6hPHG3au//c3lOJ/ZBn+tQxgO9y
NMNYKgYIDoKWw3Uwd/7neaFDHNZ//f5RHd7AGC1+6Ow/e4s+51D/38/V1jF/Zz45
pd8XbJjKNa48YiJrs4RoZBvdlmfdGJyf7latqCpqSNVcefk5W+zBKRjkmeoHWnkG
+dnGLsHkcqPILqnQLMnY+9xTghqcds9g7L/1RW7U3c2dyjRKtPhso7s06e60487Z
DSUvPDnSoO/wryYwlYvYHsqs8WS3eAmNtHNEp/zWa+3jv4KuLetoiusjazRePp1M
rUe7q7zA6bOmMLaPfmytD2nNd6QWVWDUGNvknwu8MTSREjLiyh821ywT0VJhdNOf
BYcUzLAMHmlG8IkCBoULC4Xtjw2ytQpr0CZoX80Q9BH7o6DYi3JTY5jezp9Rk+w9
c0Rr9oQwkj8kc+CBLWFG8IzQ5gI9UJrgYZtFOfNpX8KOKJidzXOz2V/1P2ca3oGn
e2tY1JqbZaF+xi3j1cEY4kIPmiKlvekZQBhIrbNK79xwi3lodQ/9LMxkXdi97HDq
b1pMt110q96KlWtYVXnd5aeJ+ZaCwo4I4DMFvNLzc+rlf2TyvdlCnpFzGNftmRrp
THEmdXAev7Eoo8xv58Pnkd6TZ7RcTaB1NIzJqjkhR45HxiA22fg=
=6FQv
-----END PGP SIGNATURE-----

--=-+YNZwO6VqKyxhXikzfCv--


