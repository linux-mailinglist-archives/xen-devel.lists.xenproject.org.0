Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5039B4B8E0F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 17:32:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274320.469757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKNE5-0007gr-Q2; Wed, 16 Feb 2022 16:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274320.469757; Wed, 16 Feb 2022 16:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKNE5-0007f1-Mw; Wed, 16 Feb 2022 16:32:21 +0000
Received: by outflank-mailman (input) for mailman id 274320;
 Wed, 16 Feb 2022 16:32:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQkk=S7=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1nKNE4-0007ev-97
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 16:32:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0226424e-8f46-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 17:32:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9061D212B8;
 Wed, 16 Feb 2022 16:32:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE5EE13B2C;
 Wed, 16 Feb 2022 16:32:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EuTtNxEnDWJ5UgAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Wed, 16 Feb 2022 16:32:17 +0000
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
X-Inumbo-ID: 0226424e-8f46-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645029138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aMka9Y/6KEIZBAn6n4bu9PNATEQAbTULlP3Q5H1nAU4=;
	b=QdZ4d+IkNJE14oaghbws7Xq5eUXMKfCfohOiS4wzzATsICH7eJLKSWemhVyCOCTOVIrsB4
	b3augip1tjYeAwNp9P5fBZ8i40FPE+zIGwEfVY4kj5yS2ZAtBZgh+TruKpK9OvfyxqgByo
	RKuSyb0vTWPGbSob1PFKoSaLEuxAPvw=
Message-ID: <7b30027945ef9c545fa607f957d8f4cbbe871a52.camel@suse.com>
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
From: Dario Faggioli <dfaggioli@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>, Juergen Gross <jgross@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <wei.chen@arm.com>,
  Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,  Bertrand
 Marquis <bertrand.marquis@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Date: Wed, 16 Feb 2022 17:32:17 +0100
In-Reply-To: <E99BEEA5-863A-4780-95D0-C22A12263737@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
	 <20220215101551.23101-5-luca.fancellu@arm.com>
	 <d6f36774-ecb5-15f4-b0c0-6114724060e6@suse.com>
	 <AC1B6659-FDCF-49A0-AB6E-EF2196C46D8C@arm.com>
	 <779968b4-5985-06bc-be35-ce5b0b719930@suse.com>
	 <E99BEEA5-863A-4780-95D0-C22A12263737@arm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7JisVB2CEqinCKN1eCl0"
User-Agent: Evolution 3.42.4 (by Flathub.org)) 
MIME-Version: 1.0


--=-7JisVB2CEqinCKN1eCl0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-02-16 at 12:37 +0000, Luca Fancellu wrote:
> > On 16 Feb 2022, at 06:18, Juergen Gross <jgross@suse.com> wrote:
> > On 15.02.22 18:56, Luca Fancellu wrote:
> > > >=20
> > > Yes, however I think the parser to handle everything by command
> > > line would
> > > be huge due to input sanitisation and not easy enough as the DT,
> > > however
> > > I see Hyperlaunch has plans to use DT on x86 so I guess it would
> > > be ok to make
> > > this feature common once the DT is available also on x86.
> >=20
> > Everything not being explicitly specific to Arm should be in common
> > code. Think of the work in progress for Risc-V.
>=20
> Ok I will put it in common and I will make the feature depend on
> HAS_DEVICE_TREE.
>=20
Can't we split the DT parsing logic & code, which is fine to be either
ARM or HAS_DEVICE_TREE specific, and the actual core logic, which can
be common and not gated by any particular condition?

This way, if one wants to add boot-time cpupool to x86 via command
line, he/she would have to implement "only" the command line parsing.

I've looked at the code, and I appreciate that it's not trivial and
that it's probably impossible to achieve 100% decoupling (at least not
without adding a lot more complexity)... But any step we can make in
that direction would be, IMO, a good investment.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-7JisVB2CEqinCKN1eCl0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmINJxEACgkQFkJ4iaW4
c+7MVhAArBW43S7YcpSTI7+sTjANnNlVjHkEzmwTXq+Yvp2AeLX3GkmfqLFYWma2
SREUtQzWu9ZtypX35BYMbGXjl8J99H9VcJvSozqsIjSxlVVqpzL2gWmTLyBWrsZe
d/cbZibye0BBHSSN4kEkwWuFFRxQWLOsFdtnbJQZ3UeSjzu4YDeErZuoFvn+BhJF
IFxTgDepF+6xWg7EVcoRwlcjkUC7oTgpk95knVpjTy4Ulb/UdtophFSvlclNIl9b
EPt+pEBlm+QGkn4mGwwKxAsTK2ax27HGq1b0uN/rrGEZNmkppE18hrhpWYY61wYh
mjzJDGsMTrNDqlcJ9/MHHfnIOCTESMOOSdqKPiT4362O/hQGyUz6XvRx4OoFhltJ
iwk4HXxHtYFMMD+cvyoOAvXPug0mYEddzA849XY03sHgm3JgpVAZabqhmyeN+T8T
xtuTOwCQLjrKBNDSJQoxB7nVvyv9cNuc5rAugaZv7AOup39c9SQuOQH/mc1UzbIr
a9uqdbmIdXTonzrZCCHaPSkaifk+p+3V3KVwSWXGdOOkTxbiQJ1wncoCAzrKVb60
priXzepF8abyQR5o29kdEsS/o0O1POcEJt3EyA7w9vzYS/hQQqN2MXiUp2B6SFWR
UBkyx6tDMs9aBwA1s2jAbed0q9sTmIZI1Jjbi22KZ3AUS4tV9O8=
=Ve2y
-----END PGP SIGNATURE-----

--=-7JisVB2CEqinCKN1eCl0--

