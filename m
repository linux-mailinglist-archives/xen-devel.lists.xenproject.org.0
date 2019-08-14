Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B86C8DC0C
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 19:38:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxxBm-0003xV-GG; Wed, 14 Aug 2019 17:35:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Whf=WK=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hxxBl-0003xN-C3
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 17:35:57 +0000
X-Inumbo-ID: f6cf6c8c-beb9-11e9-8b94-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6cf6c8c-beb9-11e9-8b94-12813bfff9fa;
 Wed, 14 Aug 2019 17:35:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AEBF7ADEC;
 Wed, 14 Aug 2019 17:35:51 +0000 (UTC)
Message-ID: <78072866796e1dedd9068e4298a13c58a30e74e7.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Date: Wed, 14 Aug 2019 19:35:50 +0200
In-Reply-To: <alpine.DEB.2.21.1908140927100.8737@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <f986544f59e1b2e9fddba5090fc3c706c38e1ad3.camel@suse.com>
 <alpine.DEB.2.21.1908091127080.7788@sstabellini-ThinkPad-T480s>
 <6bc0e21d79c4f02ad89c94fa732a32a57bdc8521.camel@suse.com>
 <alpine.DEB.2.21.1908131413200.30179@sstabellini-ThinkPad-T480s>
 <71cbab87f4929766bf4293419e50425ab62e822a.camel@suse.com>
 <alpine.DEB.2.21.1908140927100.8737@sstabellini-ThinkPad-T480s>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] dom0less + sched=null => broken in staging
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
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: multipart/mixed; boundary="===============9021966609663433831=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============9021966609663433831==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-OSWapfDeJlKjSX8GFWXn"


--=-OSWapfDeJlKjSX8GFWXn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-08-14 at 09:27 -0700, Stefano Stabellini wrote:
> On Wed, 14 Aug 2019, Dario Faggioli wrote:
> > On Tue, 2019-08-13 at 14:14 -0700, Stefano Stabellini wrote:
> > >=20
> > Now, while staring at the code of that loop, I've seen that
> > pick_cpu()
> > may mess up with the scratch cpumask for the CPU, which I don't
> > think
> > is a good thing.
> >=20
> > So, can you also try this third debug-patch?
>=20
> Yep, see attached
>
Ok, thanks again. So, cpumask_scratch() being mishandled was part of
the problem, but not the root-cause.

Well, it was worth a shot. :-P

I think we need to get rid of the loop in which we're stuck. I have in
mind a way to do this... I'll craft a patch later, or on Friday.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-OSWapfDeJlKjSX8GFWXn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1URnYACgkQFkJ4iaW4
c+7qfw//Ux1GcZEa3naKPSbqLM/S3JkQ3vJ1N7pBZGtx5O83fd2LLmRe3Lbtg312
KzywBVl1BYKHSPFsXV6UwT0aYW6SSoFSjGr0v4AjKrreVhijpizouQnCEpFZ6YC/
JT//gMg0J+zPLm0lbKwzgfIuvtdwPWaiW8O+CSVlFu96oXOqFb+Dh1EhTsVvi13b
uE85VQBEgNWjhukRNglV7Y+vHsq1hzRrNc4Mpy6+UMl+/QWEzyAU0WhtivNtyqxI
hmzdBWY7Md8/eduSAA1NmpYseogB6RjR4quRGHu6wagewwA7chP8Qhqiblj0taHF
+SQsemZSzzX66pRLHawLX0htP2X6kXVIVakYhnv3K8MwRfKmfwAeXhF9rnTbzPSL
giUP5XSyJKcq5KdXLLPh3Lp8AEANA/kFzRX7NkokBlKoVMXCISeo7GQyX6f84r3F
nmDqsm0Aamx6D/mVl3ZY5Rmt9Dn55BuxII3ImbmmT8mFQHNxDb62Ak6127s3J/TP
/U1mo9x/LJC+lE80GxJKm4tFKQEaVox9ExSdCPRKQHPfnN7DtyGRu9/XcmDg+I50
21LFItiSGH6T92O9ra05WK/Up2Ng3I6pvFMUNu/SoHOdo9jy8qSwg/AZLt9vJiY5
CojxGWnptG7v5YtXt6rs9c+PhNGZLK4CO2MGY9CIRUXqAI+5h38=
=124G
-----END PGP SIGNATURE-----

--=-OSWapfDeJlKjSX8GFWXn--



--===============9021966609663433831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9021966609663433831==--


