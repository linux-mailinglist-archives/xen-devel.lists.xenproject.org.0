Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B590BCA00
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:18:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClaV-0006f9-QM; Tue, 24 Sep 2019 14:14:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OCa0=XT=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iClaU-0006ev-0v
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:14:42 +0000
X-Inumbo-ID: a5f3d050-ded5-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id a5f3d050-ded5-11e9-8628-bc764e2007e4;
 Tue, 24 Sep 2019 14:14:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EF064ACA5;
 Tue, 24 Sep 2019 14:14:39 +0000 (UTC)
Message-ID: <2b764dc0bb33da125423042e7a59bb8e03d95ea4.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 16:14:38 +0200
In-Reply-To: <20190914051944.21409-3-jgross@suse.com>
References: <20190914051944.21409-1-jgross@suse.com>
 <20190914051944.21409-3-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 2/4] xen/sched: remove cpu from pool0
 before removing it
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============7965391237782979236=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7965391237782979236==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-SfVF0XFNgk1q7/GEpawK"


--=-SfVF0XFNgk1q7/GEpawK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 07:19 +0200, Juergen Gross wrote:
> Today a cpu which is removed from the system is taken directly from
> Pool0 to the offline state. This will conflict with the new idle
> scheduler, so remove it from Pool0 first. Additionally accept
> removing
> a free cpu instead of requiring it to be in Pool0.
>=20
> For the resume failed case we need to call the scheduler code for
> that
> situation after the cpupool handling, so move the scheduler code into
> a function and call it from cpupool_cpu_remove_forced() and remove
> the
> CPU_RESUME_FAILED case from cpu_schedule_callback().
>=20
> Note that we are calling now schedule_cpu_switch() in stop_machine
> context so we need to switch from spinlock_irq to spinlock_irqsave.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2: rename cpupool_unassign_cpu_[epi|pro]logue() (Dario Faggioli)
> V4: fix bug when unassigning cpu not in pool
>
Reviewed-and-Tested-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-SfVF0XFNgk1q7/GEpawK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2KJM4ACgkQFkJ4iaW4
c+6ZdQ//e6PIL28hcbDzB265aglBZP8Sr7zYS4jl5Q7NkRa4HIGZjgfyaVCZ6Nrz
I4otpgxe2egStrHX+F1dEcrVckBl+MyolfY+mWhUnmNoidnKrEk4JaRe+QrxoSrY
m7MxzQktgqa/wTvMoWa4ocMnKnWIuGVbb0vCFX8kRLgx6w0e9fnVZmjafGf+vyi4
m2nowat3YGKDeJdMNxKpmnfDOgJMRVbfQv+ih0c+NWS1n3WsUl2IUdjeCYrVZDo+
aIqmHpsE+XzyinVH9F/HBuohj0EZNZyfhccC3EbEUvdCTHfU1MSQasGuFb2noAEG
bOEE4pvDcjxmPokWT0njX/aAT89dbReyRF6MyoX/EvFcB6TcoJp0F0qSkI9j3VGk
HCHqiDlYh5FH4kxf3QTS7A88B20NRKMlyrv28ynN4GPo4efihx5FWkyhusFpHrOn
5d1kFJzwS/x1XiO2UfNgrogwZQbe17Y883lU2yrpU8wo4QLo9eoE9IcDd2hdA00K
KD7BkjvFILE9TgKEDTlX+y3HgfTUJ6H0q6FNzSwtqhhhgotKScEHZRgHdAW0i6IU
tsQscwjRXtkO7MlyMKaMYWcYkhTdwH3JHliVDJGScVfDvPFp/gKrSRcusbFqQXRH
NjF3/AWfeLyD40n/afohs/VVNqDDov45N9KzJsV0ql/LnV0ixo4=
=TrGE
-----END PGP SIGNATURE-----

--=-SfVF0XFNgk1q7/GEpawK--



--===============7965391237782979236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7965391237782979236==--


