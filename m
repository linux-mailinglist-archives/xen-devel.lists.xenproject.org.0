Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48397B0A02
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 10:16:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8KEh-0000MK-OQ; Thu, 12 Sep 2019 08:13:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uvwM=XH=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1i8KEg-0000MF-El
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 08:13:50 +0000
X-Inumbo-ID: 3fc24cca-d535-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fc24cca-d535-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 08:13:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5AE61AFF4;
 Thu, 12 Sep 2019 08:13:48 +0000 (UTC)
Message-ID: <64d99c4bbcf29a8549a76a9d9131d27a4c6806ed.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 12 Sep 2019 10:13:46 +0200
In-Reply-To: <20190809145833.1020-29-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-29-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 28/48] xen/sched: move struct task_slice
 into struct sched_unit
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============2704984306842036084=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2704984306842036084==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-O0k+JT4NP4zY8Ti9W+HU"


--=-O0k+JT4NP4zY8Ti9W+HU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-09 at 16:58 +0200, Juergen Gross wrote:
> In order to prepare for multiple vcpus per schedule unit move struct
> task_slice in schedule() from the local stack into struct sched_unit
> of the currently running unit. To make access easier for the single
> schedulers add the pointer of the currently running unit as a
> parameter
> of do_schedule().
>=20
> While at it switch the tasklet_work_scheduled parameter of
> do_schedule() from bool_t to bool.
>=20
> As struct task_slice is only ever modified with the local schedule
> lock held it is safe to directly set the different units in struct
> sched_unit instead of using an on-stack copy for returning the data.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>=20
> diff --git a/xen/common/schedule.c b/xen/common/schedule.c
> index e4d0dd4b65..d2fc89d983 100644
> --- a/xen/common/schedule.c
> +++ b/xen/common/schedule.c
> @@ -1751,9 +1749,7 @@ static void schedule(void)
>          TRACE_4D(TRC_SCHED_SWITCH_INFCONT,
>                   next->domain->domain_id, next->unit_id,
>                   now - prev->state_entry_time,
> -                 next_slice.time);
> -        trace_continue_running(next->vcpu_list);
> -        return continue_running(prev->vcpu_list);
> +                 prev->next_time);
>      }
> =20
Mmm... I'm sorry, but I'm not sure I understand what is going on here.

Do you mind explaining why we're not calling continue_running() any
longer (and why this happens in this patch)?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-O0k+JT4NP4zY8Ti9W+HU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl15/joACgkQFkJ4iaW4
c+7T4g//apLcPduQjZy/KrfxmO2yxR9Mjd0EGYYFn089hsRvoEiRpvIzuR444m9f
oSi0KGLGqec1NqWMs5fFZVwy38Nm0ePMQR94KAfHvo7WkT8JglT1vwbN/UAnHS0J
C0BtZuy0s1kxwbLJh1dLl6RUYszWIbIaL5So6Lj7GUXVUpWPIZLtaLNVggumSnBO
Z6X7n7w6Uo0xvjCkfPb60o8ukRffZ0bwjifEMZ2rHqo9IqENQ40CLhJsPgybo5hg
gXGj5MCZTzuL5bNL+EpEN5UfxJeYtBHeH/k83M9EowxqlTNuirErbcarLhqE5g6g
ERNgadYjFs1U1ku8BiEcstGdvTQkSEMcMOFf4Kp0qWnQzjSIeTb7kcTkyLFSUh3y
hACJgxVSXFI6YkqzM+iSV5tp9zpvyLw2lHinAG1eK9EKTI+Wt1zlCZbhq+oYJA6a
L0Q/gH55tH3OnV3mapcM1Ej7OZIkboIM65dwW6v9wTPmFHzkWWCtpgG7adCmkaJJ
JvCrkIJMhhRLlBbEBTAlivx3P4jJKG9HgRi9SDae7QWwqLES8NiUx+EjQD7CTVFH
dWZ8EKimS/edsIH+QLzmWx0Jp/Iv+MaRyTrUBqURztzmOKaZe6mNL0N4jrKH5cxn
rK3aPrvlJum90B5wn+a38yrSqYNeEfwwgMYQTNlmWgA74PfXb3w=
=bi0f
-----END PGP SIGNATURE-----

--=-O0k+JT4NP4zY8Ti9W+HU--



--===============2704984306842036084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2704984306842036084==--


