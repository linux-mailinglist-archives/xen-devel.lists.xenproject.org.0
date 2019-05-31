Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DFA311A9
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 17:54:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWjpp-0005OU-R3; Fri, 31 May 2019 15:52:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=agGR=T7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hWjpo-0005OG-48
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 15:52:48 +0000
X-Inumbo-ID: 21be4d98-83bc-11e9-8ab2-dbabe6b7ec32
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21be4d98-83bc-11e9-8ab2-dbabe6b7ec32;
 Fri, 31 May 2019 15:52:46 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Fri, 31 May 2019 17:52:44 +0200
Received: from [192.168.0.36] (nwb-a10-snat.microfocus.com [10.120.13.201])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Fri, 31 May 2019 16:52:22 +0100
Message-ID: <0c912c719f7fe4fcfcc329f90303b7c985c43c34.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 31 May 2019 17:52:21 +0200
In-Reply-To: <20190528103313.1343-55-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-55-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 54/60] xen/sched: add minimalistic idle
 scheduler for free cpus
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============5884021104420686429=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5884021104420686429==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-kNvBcORzXAKwl5qWUjaS"


--=-kNvBcORzXAKwl5qWUjaS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 12:33 +0200, Juergen Gross wrote:
> Instead of having a full blown scheduler running for the free cpus
> add a very minimalistic scheduler for that purpose only ever
> scheduling
> the related idle vcpu. This has the big advantage of not needing any
> per-cpu, per-domain or per-scheduling unit data for free cpus and in
> turn simplifying moving cpus to and from cpupools a lot.
>=20
> As this new scheduler is not user selectable don't register it as an
> official scheduler, but just include it in schedule.c.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V1: new patch
> ---

> --- a/xen/common/schedule.c
> +++ b/xen/common/schedule.c
> @@ -83,6 +83,57 @@ extern const struct scheduler
> *__start_schedulers_array[], *__end_schedulers_arr
> =20
>  static struct scheduler __read_mostly ops;
> =20
> [...]
>
> +static void *
> +sched_idle_alloc_vdata(const struct scheduler *ops, struct
> sched_unit *unit,
> +                       void *dd)
> +{
> +    /* Any non-NULL pointer is fine here. */
> +    return (void *)1UL;
> +}
> +
I think the proper thing to do, here, would be to convert alloc_vdata()
to PTR_ERR() & IS_ERR().

That's another patch, of course, and given that this series is rather
big already, I'm not sure about asking for it to be done in the context
of this work.

I can do it myself, either right now or after this series is merged
(for the sake of not making rebasing 60 patches more complicated than
it must be already, for you :-D).

Let me know what you think.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-kNvBcORzXAKwl5qWUjaS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzxTbUACgkQFkJ4iaW4
c+4DRQ//doxD5a2Lvp/xjTiWd58ngE0fgSJE8xS2BWfjXZ5zD85kbQ+50Iny2QCj
et2yzbDJGQQ7yOOoJua/z/U2jU9cmDS7FNcewg8fJV+FS+F1DoSLLSvqHV1njSW+
l0+FjZx0DIdoIudGFks4MirTQofR9VKP63TTBP8ukvOC8+nyHn5H9e6KB7yMFANh
AbDOoPWf64Lbnfa/klDlNwSNqViwzYH10rmATrbqQ/myFvR539ynypEgU9dMtTzX
zPm85q9K0fKgbmt05NgE8x7oOuOPFhMKjxyKfnPCUrOmgQBsCF1BHcu/oqB5hiI6
W72IQlb5GgS6uZ5UJHQPj5miCeAs0O63SGoVP0zojE7Ck/gK19jBA6hHtIGXjGcp
7gu+XBJweR/Dr+DnTS8WsOK5lD3VvrzNX9K6DG+bLrZbpXbr7eo/fWM9xAdOVIXx
rO9HErKh/udQzuiepi3BAayVdErAJd0T6/VPDmCgg/hQcskyVVc3ifAauzgdos6d
OfZsYQjGYWlk8D0u8x0Qal87mDMML+wyNOjkW1Aepd7SnVH1xUJfY67fx1itg7is
PJLiouFwXZoiaLx3PE9Zkd1paxGc3z1zWlgnFU2KFM8ULFBQov8TAZ2cKj5ZcZVo
7ovjgDETn15SQmy899mYlVvJIQl0qlpROvJS9FjilVDFfOjDeo8=
=hiT5
-----END PGP SIGNATURE-----

--=-kNvBcORzXAKwl5qWUjaS--



--===============5884021104420686429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5884021104420686429==--


