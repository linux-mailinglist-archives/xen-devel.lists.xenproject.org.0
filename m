Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6412DC5BD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 18:53:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55536.96651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpaz2-0007PR-NZ; Wed, 16 Dec 2020 17:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55536.96651; Wed, 16 Dec 2020 17:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpaz2-0007P2-K1; Wed, 16 Dec 2020 17:53:04 +0000
Received: by outflank-mailman (input) for mailman id 55536;
 Wed, 16 Dec 2020 17:53:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZVlt=FU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kpaz0-0007Ox-TU
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 17:53:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7375f2b-113e-4f62-93b3-8fb0bffdeade;
 Wed, 16 Dec 2020 17:53:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C174DAE63;
 Wed, 16 Dec 2020 17:53:00 +0000 (UTC)
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
X-Inumbo-ID: b7375f2b-113e-4f62-93b3-8fb0bffdeade
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608141180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lm0OOb2o7t7i6S+Vw6olTaWMMNamPMPZeCRhd93YYeE=;
	b=RmGcVc78z8et4uCOwfbdelYoOd9eWeRsIv+UqdnNpfF/ULUEgdzYq90cJHyE/ZedyfJp9A
	OdQ8b27eKanF/vowfpEXeSBDCyZvhmB98632aPSbe4B+MR1D1H9lhQlxba4rqI/EyspWwv
	qKKdzxv6aEdlKJ+m/Lh10hsF1wSGsew=
Message-ID: <a22954117d8dd36fc0e1b9470efb72c5b80ad393.camel@suse.com>
Subject: Re: [PATCH v3 1/8] xen/cpupool: support moving domain between
 cpupools with different granularity
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>
Date: Wed, 16 Dec 2020 18:52:59 +0100
In-Reply-To: <20201209160956.32456-2-jgross@suse.com>
References: <20201209160956.32456-1-jgross@suse.com>
	 <20201209160956.32456-2-jgross@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-mUbumSaun4tYjl6nss8L"
User-Agent: Evolution 3.38.2 (by Flathub.org) 
MIME-Version: 1.0


--=-mUbumSaun4tYjl6nss8L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-12-09 at 17:09 +0100, Juergen Gross wrote:
> When moving a domain between cpupools with different scheduling
> granularity the sched_units of the domain need to be adjusted.
>=20
> Do that by allocating new sched_units and throwing away the old ones
> in sched_move_domain().
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
This looks fine, and can have:

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

I would only have one request. It's not a huge deal, and probably not
worth a resend only for that, but if either you or the committer are up
for complying with that in whatever way you find the most suitable,
that would be great.

I.e., can we...
> ---
> =C2=A0xen/common/sched/core.c | 121 ++++++++++++++++++++++++++++++-------=
-
> --
> =C2=A01 file changed, 90 insertions(+), 31 deletions(-)
>=20
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index a429fc7640..2a61c879b3 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
>=20
> [...]
> -=C2=A0=C2=A0=C2=A0 old_ops =3D dom_scheduler(d);
> =C2=A0=C2=A0=C2=A0=C2=A0 old_domdata =3D d->sched_priv;
>=20
Move *here* (i.e., above this new call to cpumask_first()) the comment
that is currently inside the loop?
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 new_p =3D cpumask_first(d->cpupool->cpu_valid);
> =C2=A0=C2=A0=C2=A0=C2=A0 for_each_sched_unit ( d, unit )
> =C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spinlock_t *lock;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Temporarily move all =
units to same processor to make
> locking
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * easier when moving th=
e new units to the new processors.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>
This one here, basically ^^^

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock =3D unit_schedule_lock_i=
rq(unit);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched_set_res(unit, get_sched=
_res(new_p));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irq(lock);
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched_remove_unit(old_op=
s, unit);
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0
Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-mUbumSaun4tYjl6nss8L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl/aSXsACgkQFkJ4iaW4
c+4koQ/9HYzg3JwMedeReU7rrLIb4LnarY4OLpheup0QOxeRooM3dkVcOUTCMR5q
aS9V5kYCyKY4IqpScYQlZjUxLLYdPFx7FDOs5ulgeDzdhFu9ZswZAHtuFSdg0Tx5
Z6BhmjRjanD4kqCiIq81aAVg8g+D896mkFVPqoGX10xVZ+87Jjz3n+euV1+Fuulv
pjR7qfoQYLYY+XXbGIxrYF+b99k0TM5W7C7xD7kHQXSY9fHrqy2T5l9zNSXjDg21
7lKqLlKGc5OqFqOfaE/+jL3z+Cw5uf1YV08P1hl2dJXAerhLz3jyEX/x1k/R4CdB
qm4Fd/FQWO85Vkx7HZQ54yH2FIipcf55943gKrh1lhljc0qzNov3hjwRrXLEeimE
5sPh3mJx8sZdGcz87tFvbXaj4ezA5EVA63pHuSfguFLiwJBe9B7lZAQHJWbX47Zm
d3NBNEFKZX13VAQaXb+tBRvPcB8qw+M76FuLFkH8xkTylRe8TWHAN0oyNrTNkJZB
MsoCgL+KiL6D7EWFwp/y47oWO6Yn92lb4qJ4Oi9YJYmSeF9R32+5S3QUivXtfZS+
DbJMgrjRgrjJfNhm1NUteQDEgIeOJuUCERqfkRZLQjJYdZxuuY7u8iM/EJ1/8XD4
pX29foW5UTYEX32nnZoPrDX4bvA85b8hf2OmWLJcDyFrY2j1cNQ=
=vWTY
-----END PGP SIGNATURE-----

--=-mUbumSaun4tYjl6nss8L--


