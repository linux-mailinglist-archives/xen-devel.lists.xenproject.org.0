Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D589F1ACDAE
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 18:29:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP7NW-00023I-Ci; Thu, 16 Apr 2020 16:28:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04wr=6A=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jP7NU-00023D-Se
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 16:28:36 +0000
X-Inumbo-ID: 51e768e8-7fff-11ea-8bc7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51e768e8-7fff-11ea-8bc7-12813bfff9fa;
 Thu, 16 Apr 2020 16:28:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A09CDABCF;
 Thu, 16 Apr 2020 16:28:34 +0000 (UTC)
Message-ID: <ca19a888e95d00ce664b9d777510e366547327cc.camel@suse.com>
Subject: Re: [PATCH OSSTEST 2/2] make-flight: add a core scheduling job
From: Dario Faggioli <dfaggioli@suse.com>
To: Ian Jackson <ian.jackson@citrix.com>, Roger Pau Monne
 <roger.pau@citrix.com>
Date: Thu, 16 Apr 2020 18:28:33 +0200
In-Reply-To: <24215.1729.892903.300149@mariner.uk.xensource.com>
References: <20200415085246.7945-1-roger.pau@citrix.com>
 <20200415085246.7945-2-roger.pau@citrix.com>
 <24215.1729.892903.300149@mariner.uk.xensource.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-P8akR4LN9whvqAkNCJY3"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-P8akR4LN9whvqAkNCJY3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-04-15 at 14:06 +0100, Ian Jackson wrote:
> Roger Pau Monne writes ("[PATCH OSSTEST 2/2] make-flight: add a core
> scheduling job"):
> > Run a simple core scheduling tests on a host that has SMT support.
> > This is only enabled for Xen >=3D 4.13.
> ...
> > +  # Core-scheduling tests are x86 only
> > +  if [ x$test_coresched =3D xy -a $xenarch =3D amd64 ]; then
> > +    job_create_test test-$xenarch$kern-coresched-$dom0arch-xl \
> > +                    test-debian xl $xenarch $dom0arch
> > $debian_runvars \
> > +                    all_hostflags=3D$most_hostflags,smt \
> > +                    xen_boot_append=3D'sched-gran=3Dcore'
> > +
> > +  fi
>=20
> This seems fine as far as it goes, but all it does is check that
> things still work if sched-gran=3Dcore is passed.=20
>
Yep, and that's enough for enabling and starting using ore-scheduling.
So, doing like this, core-scheduling should get the same amount and
kind of testing that scheduling in general gets.

>  I'm not sure whether
> anything more sophisticated is needed, and in any case this is a step
> in the right direction, so:
>=20
Indeed.

One question, as my OSSTest-fu is a bit rusty... does this create
"sched-gran=3Dcore" tests for all the schedulers? Or just one of them for
th default scheduler?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-P8akR4LN9whvqAkNCJY3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl6Yh7EACgkQFkJ4iaW4
c+6ZVhAAlmHtoJuiTRf7r77pF/CPJ5qO8wCpgXGqa/k2K+utONe0Vy3Ow12yqKK6
ijUP1QagNoqiqh2plo3w/qf1TpiRfK/8gp19ZnfxdlLtQMfR4pl6IrkRxlrl7SHz
HdiaM8fSpvAieHMwAsYZELyTvXCs/xaLOBXGwrhYWnGSMH45QooasqS9BGno+C4R
iLtI0xYfhka+6UxmrSTtt6q3XtvGml34zp+t/HXH+ZobvFWpLwKamXljMTEx4HMB
3rG8VZVD8pYS4wBTzCCuNJMfGENjaNJTrSiw4U1dAEP1E6rpWuyTMXP3NhXPIDF8
3lIt9iuojw6rC2ZVu0Y4/kpme/bIxGu/PriFp1793ZqWRMaQ6+NiqcHle0EcZfND
+9XiKtBvrW6byVmvhkfjmmStgf7xTkEqB/NMHdD+XqntMOrIb/cQhoHE5xOoXL7D
z0VdGXVQYDK8X4S3i7O4SP5pM5U2SY57zFbvy3YFm11oqzUxfQHhyuu0kxxRwyVp
1/E3pRtcYn1b9emewk6qAb0R8P7N/6XsCLiFj6EUA2VZEVo3ee3beJMpU54NXDan
ndgaBaLtEkhMkwwoRPcmFTmueF2Jquu89IxDH6cuKnJpzTVh+ic9+nyKjO5lgVKc
3d0Ovjy9FImVMSSSNTZfdR/5kttaYDXVArrCcZqj+zavQ1gZsBs=
=ykJc
-----END PGP SIGNATURE-----

--=-P8akR4LN9whvqAkNCJY3--


