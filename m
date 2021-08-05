Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEA33E1078
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 10:40:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164203.300442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBYu9-0004tx-U7; Thu, 05 Aug 2021 08:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164203.300442; Thu, 05 Aug 2021 08:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBYu9-0004s9-QZ; Thu, 05 Aug 2021 08:39:05 +0000
Received: by outflank-mailman (input) for mailman id 164203;
 Thu, 05 Aug 2021 08:39:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q9OU=M4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mBYu8-0004s3-Jk
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 08:39:04 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fcb7e43-9f05-4cb4-92f5-0491d8cc6231;
 Thu, 05 Aug 2021 08:39:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A69B01FE39;
 Thu,  5 Aug 2021 08:39:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 635F513D33;
 Thu,  5 Aug 2021 08:39:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WFilFKajC2FYAQAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Thu, 05 Aug 2021 08:39:02 +0000
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
X-Inumbo-ID: 1fcb7e43-9f05-4cb4-92f5-0491d8cc6231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1628152742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ainCgkBlMfr6C24hoyzgSI3SYghaiNOtJtsHtoGOWlc=;
	b=MfyE+YJ40rYGh/qFTWO4RCq61cyfgK4BBxObYW7e0uQIwk0VilkWqiUKs4dqBeSMHOazIN
	JBlnhfuj8yMM4QpjNpwaH5zcqkPArvBJPAYUZXXnSz+0+5fGViIvEIWbI14MOEnaMcUwr8
	w2ewgWQeGFx683DfnKDOvV+SfjoZaKc=
Message-ID: <9a2cf3c6c5cea079834bf3de6923304f1e54c885.camel@suse.com>
Subject: Re: [PATCH v2] Xen: credit2: avoid picking a spurious idle unit
 when caps are used
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Date: Thu, 05 Aug 2021 10:39:01 +0200
In-Reply-To: <2d0b4209-3eb7-8e55-804a-00f13bd97ddb@suse.com>
References: <162809973863.23114.6885532925742864556.stgit@Wayrath>
	 <2d0b4209-3eb7-8e55-804a-00f13bd97ddb@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Oz+MvnH6LCXp6Cbz00qx"
User-Agent: Evolution 3.40.3 (by Flathub.org) 
MIME-Version: 1.0


--=-Oz+MvnH6LCXp6Cbz00qx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-08-05 at 08:31 +0200, Jan Beulich wrote:
> On 04.08.2021 19:55, Dario Faggioli wrote:
> >=20
> > Suggested-by: George Dunlap <george.dunlap@citrix.com>
> > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
>=20
> In part based on your explanation in response to my v1 comments:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
Cool! Thank you very much again.

> > @@ -3494,16 +3503,25 @@ runq_candidate(struct csched2_runqueue_data
> > *rqd,
> >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Note that budget av=
ailability must be the very last
> > check that
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * we, in this loop, d=
ue to the side effects that
> > unit_grab_budget().
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * causes.
>=20
> The sentence looks broken to me: I think you either want to delete
> "that
> we," or add "do" before the 1st or after the 2nd comma. If you agree,
> or
> if you have another suggestion, I'd be happy to apply the adjustment
> (let me know of your preference, if any) while committing.
>=20
Yes, absolutely!

Also, I am fine with either of the two variants you propose (adding a
"do" is what I slightly prefer, but it really is the same), and I am
fine with this being done when committing.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-Oz+MvnH6LCXp6Cbz00qx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmELo6UACgkQFkJ4iaW4
c+65ZxAAzLCUzFiKoeqos9KaxonAYT36A5qe/rgDpAkMU4A1J7y8vcFf9YXiOflC
HAGreuRvMwxZbz7PI8fdhgUTAD6YV8asMy6EbIS4EWawtWQcbbJxmfsUVyGbAxiU
l7Fv2j9PuYIQEczv+bxxStP9VAxQLgbnT123tz6+PD3WjYw+lM8EsERIb3H7i2VL
ia/JhhKnwDGC8zRC1plCSWBzdFax9IzHAhyGUFnDygB00WglefK2TSkPyGhoANWI
NFYGD88fWaf8jgQTstdoA1Vskmxem/zDoOyUYAvwbNaHjWDlsH1VuNyoZ5ciKyYM
8ePkETmYfI85TWhJqMlZhZ+B4kC1Sv7KBKgKsTrvJNkVwy/dWkbahaA05TkXKiHw
lgl4LaludVgvQp8LkFYaE5ZllPRTKM3sK6tlL7VX1nun27L6NeUWlcam6Y3EYrJc
yHtEHDHTVyoDRe4YhS5eYKplKTmsZGACdMz4HFKUdIeoDb8dIQ5RQQk2v4PU+gZZ
BgeJbRMYxLfTKgr2dFBXcNihuEdBYAxAWfCxxe3vSMDLk3FcQBToBMrCMqNAkWtZ
RoJv8PjQB8EpanRBU73ol78YtJhjo5os87vnGoAObqGApUTjdrj+/HAVqLBTc9Mt
mYbLT5CWe3bQnkgbgceGJyqlFIGSEDkblRzIo6eiY1xsd89nHnA=
=dtVL
-----END PGP SIGNATURE-----

--=-Oz+MvnH6LCXp6Cbz00qx--


