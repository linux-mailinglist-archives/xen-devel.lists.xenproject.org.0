Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E216419F1BB
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 10:41:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLNJF-0004lj-Pb; Mon, 06 Apr 2020 08:40:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QfxX=5W=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jLNJD-0004ld-VS
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 08:40:43 +0000
X-Inumbo-ID: 4d029390-77e2-11ea-bfdb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d029390-77e2-11ea-bfdb-12813bfff9fa;
 Mon, 06 Apr 2020 08:40:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 92FE7AB8F;
 Mon,  6 Apr 2020 08:40:41 +0000 (UTC)
Message-ID: <53c972a1b3efddcefe458fc6ddbd0e973e3107a4.camel@suse.com>
Subject: Re: [PATCH v2 2/2] xen: credit2: fix credit reset happening too few
 times
From: Dario Faggioli <dfaggioli@suse.com>
To: George Dunlap <George.Dunlap@citrix.com>
Date: Mon, 06 Apr 2020 10:40:39 +0200
In-Reply-To: <5C3A27CD-E237-4490-8942-2F82D0C20DCC@citrix.com>
References: <158457508246.11355.6457403441669388939.stgit@Palanthas>
 <158457672023.11355.16720240521867328301.stgit@Palanthas>
 <5C3A27CD-E237-4490-8942-2F82D0C20DCC@citrix.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-6ZGUQcKLXzS2s+iTp0Cu"
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
Cc: Juergen Gross <jgross@suse.com>, Charles Arnold <carnold@suse.com>,
 Jan Beulich <jbeulich@suse.com>, Glen <glenbarney@gmail.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Sarah Newman <srn@prgmr.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-6ZGUQcKLXzS2s+iTp0Cu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-04-02 at 18:32 +0000, George Dunlap wrote:
> > On Mar 19, 2020, at 12:12 AM, Dario Faggioli <dfaggioli@suse.com>
> > wrote:
> >=20
> > There is a bug in commit 5e4b4199667b9 ("xen: credit2: only reset
> > credit on reset condition"). In fact, the aim of that commit was to
> > make sure that we do not perform too many credit reset operations
> > (which are not super cheap, and in an hot-path). But the check used
> > to determine whether a reset is necessary was the wrong one.
> >=20
> > In fact, knowing just that some vCPUs have been skipped, while
> > traversing the runqueue (in runq_candidate()), is not enough. We
> > need to check explicitly whether the first vCPU in the runqueue
> > has a negative amount of credit.
>=20
> Oh, so if the top of the runqueue has negative credit, but it=E2=80=99s n=
ot
> chosen, then the one we *do* run has even lower credit.  Still not
> quite sure how that leads to a situation where credit resets don=E2=80=99=
t
> happen for long periods of time.  But anyway...
>=20
Fact is, without this patch, we wouldn't call reset_credit() if we
"skipped" a vcpu/unit.

That means we skip all the times we did not pick the head of the
runqueue, even if the one we picked also have negative credits (as the
check for 'skipped_units =3D=3D 0' was the first condition of the '&&').

That's what was making us skip resets. :-)

> Acked-by: George Dunlap <george.dunlap@citrix.com>
>=20
Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-6ZGUQcKLXzS2s+iTp0Cu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl6K6wgACgkQFkJ4iaW4
c+73Vg/+KrLZmRstE268vLvy2M9bKUw3Pr9FGzRXAypRR/DddFHkwd7pIUg/ZyHf
vlduSMrieInj7KRbx5C5mS0al5TUe8jdAswbAmbrQPCViTDnmajJIN4/QO/ySMz7
gTUCpoO0hytAdPxZk/sra+vmJvaeIKusZstTjoj3QUekhxJ1Zll4ZlkL/fEyswv8
XGFql5Ek4FmGemnHVP4ltYitlV4UpvmCCiDgj3Ok72TkqZZCVTf/wfe4KSVP6YHu
AMRnvky31an6fC7tb/KOiOCCApaIGZQnxgxKyH9kC7RW+n93mMFbG2GYbKxtPnJm
uG4JdtzrjW+h+xjT8o1wypks/dEXygFE4qHAOElIRzYBbI1n0T0RdoDQyN4BN+oP
1iFqlzV3qHpjvr8OM9fPJsJTah6qY6TXZS/jNWO6a+Lev5LFiBwCmznDI/1CQ2bO
tJJ37p0FcEvpgpaF0tloIJKcp3DNntjiMlXZuncCuieh/gnzwRhBrCNrGU3+/vxJ
wN3Kdrnhtp921ujnomDw5lO64BEhFES7YJPAI/6wacSLXM1jjHT+XfKZw6LmzO8F
GIGPXevVH5vcHSctUo4d1D46g0qT8gfGDIm12K03dyhZR5V5vh861cgUwE0xqtxd
0+OrtDz2dV94U598qHZyf6PjgTqTc8C/2uRan8KcYoZMqm8+v48=
=9+8d
-----END PGP SIGNATURE-----

--=-6ZGUQcKLXzS2s+iTp0Cu--


