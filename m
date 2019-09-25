Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F4107BDE5F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 14:55:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD6l8-0006Xj-N1; Wed, 25 Sep 2019 12:51:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvtg=XU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iD6l7-0006Xe-AQ
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 12:51:05 +0000
X-Inumbo-ID: 215f382a-df93-11e9-9630-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 215f382a-df93-11e9-9630-12813bfff9fa;
 Wed, 25 Sep 2019 12:51:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 13376B152;
 Wed, 25 Sep 2019 12:51:02 +0000 (UTC)
Message-ID: <2fbb8e0bf1b18efd5b2de9a328c821e556b34f50.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 14:51:00 +0200
In-Reply-To: <20190914085251.18816-15-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-15-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 14/47] xen/sched: make null scheduler
 vcpu agnostic.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============8591071010724427659=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8591071010724427659==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-o+HZUYlxvDVyWICCm5NM"


--=-o+HZUYlxvDVyWICCm5NM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Switch null scheduler completely from vcpu to sched_unit usage.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

With, if possible, all the occurrences of 'item' in comments actually
replaced with 'unit'.

Like, for instance, these...

> diff --git a/xen/common/sched_null.c b/xen/common/sched_null.c
> index 63ee1f5439..c3666c9f56 100644
> --- a/xen/common/sched_null.c
> +++ b/xen/common/sched_null.c
> @@ -18,10 +18,10 @@
> =20
>  /*
>   * The 'null' scheduler always choose to run, on each pCPU, either
> nothing
> - * (i.e., the pCPU stays idle) or always the same vCPU.
> + * (i.e., the pCPU stays idle) or always the same Item.
>   *
>   * It is aimed at supporting static scenarios, where there always
> are
> - * less vCPUs than pCPUs (and the vCPUs don't need to move among
> pCPUs
> + * less Items than pCPUs (and the Items don't need to move among
> pCPUs
>   * for any reason) with the least possible overhead.
>   *
>   * Typical usecase are embedded applications, but also HPC,
> especially
>=20
...

> @@ -77,25 +77,25 @@
>  struct null_private {
>      spinlock_t lock;        /* scheduler lock; nests inside
> cpupool_lock */
>      struct list_head ndom;  /* Domains of this
> scheduler                 */
> -    struct list_head waitq; /* vCPUs not assigned to any
> pCPU            */
> +    struct list_head waitq; /* Items not assigned to any
> pCPU            */
>      spinlock_t waitq_lock;  /* serializes waitq; nests inside runq
> locks */
> -    cpumask_t cpus_free;    /* CPUs without a vCPU associated to
> them    */
> +    cpumask_t cpus_free;    /* CPUs without a Item associated to
> them    */
>  };
>
Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-o+HZUYlxvDVyWICCm5NM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2LYrUACgkQFkJ4iaW4
c+5Y0g//RCCNzq0FaVxM+ikLWUGTEL+sDf5IRRW3R6VjDSBmjpKWOZGmDQSd3it3
pWprPymjLBAEmxSfyomhlxHcLvv7AmwNlhWBfpmpCetKaNxHajGUjgOVgOzHynr8
eZQaUIA6HDwzJTT+KbqsMTwLx3u04PQd3YT2DddRUyKdpC3/lHU/c9IYdr6SLe4N
ySiiRz5nA0seVvoIZ6Ly3hryygCmit1jAzf0GuNsO1p605gARuJtaiQjP0j6/XZN
9ShoWXY+KJ+WIGXXAmZIA068c0lNxvX7kidHdu63+d0umr2WH9N6YYYYConsaSem
H9GQkzqpXGxD0Lot3+skddPK26wk0HAIhYrbg456qfyfslxhxylt99vsDGGWN+AO
zAACtR4VhAtC2JrK7wifI+6YJ95MF9jW7STkMwvN79suRAwpf0l1x8Z6f8+jP9gK
jR+9Qs1RplI6FpgdEzM+RnSsqQR9B7RRSQEe5ETvskvXxX5YYP7HyHFfsKJbl5Mq
ZhPhDMauR/Dv18OtZxCMb8XD9vaKtLU3K43c9HyOz/bskz/Nu9EtIXV1Xj/gTdMi
AV/SCXhG269YBOpfKyRXNP2cuG+/sjgHYKec2z1rEsD0ORHLhmX+5l19k+72l8jI
g5auCL6UFidJWGXur4qqn73BKgjE/UB/AAklsMmCNrBv9rycCbY=
=uK6f
-----END PGP SIGNATURE-----

--=-o+HZUYlxvDVyWICCm5NM--



--===============8591071010724427659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8591071010724427659==--


