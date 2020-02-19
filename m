Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C5E1643D7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 13:03:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4O2j-0006Bz-VV; Wed, 19 Feb 2020 12:01:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NMhh=4H=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j4O2i-0006Bt-64
 for xen-devel@lists.xen.org; Wed, 19 Feb 2020 12:01:28 +0000
X-Inumbo-ID: 8e52f8be-530f-11ea-aa99-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e52f8be-530f-11ea-aa99-bc764e2007e4;
 Wed, 19 Feb 2020 12:01:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D8876BAB5;
 Wed, 19 Feb 2020 12:01:25 +0000 (UTC)
Message-ID: <e32fbeb736236f7dd03521710ad3ce9312bf618f.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Sarah Newman <srn@prgmr.com>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>
Date: Wed, 19 Feb 2020 13:01:24 +0100
In-Reply-To: <4e71d68f-2e64-363d-349b-33571a63eab2@prgmr.com>
References: <51dcae60df3a1ce7eaf51cbd5c51184645d51f53.camel@memset.com>
 <4e71d68f-2e64-363d-349b-33571a63eab2@prgmr.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] CPU Lockup bug with the credit2 scheduler
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
Cc: Alastair Browne <alastair.browne@memset.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Glen <glenbarney@gmail.com>,
 PGNet Dev <pgnet.dev@gmail.com>
Content-Type: multipart/mixed; boundary="===============7655788788505762341=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7655788788505762341==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-EgM+MSBJi0XSahdXePix"


--=-EgM+MSBJi0XSahdXePix
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-02-17 at 11:58 -0800, Sarah Newman wrote:
> On 1/7/20 6:25 AM, Alastair Browne wrote:
> >=20
> > After the tests, we decided to stick with 4.9.0.9 kernel and 4.12
> > Xen
> > for production use running credit1 as the default scheduler.
>=20
> One person CC'ed appears to be having the same experience, where the
> credit2 scheduler leads to lockups (in this case in the domU, not the
> dom0) under=20
> relatively heavy load. It seems possible they may have the same root
> cause.
>=20
Yeah, well, if booting with `sched=3Dcredit` makes the problem disappear,
whatever the real root cause really is, it seems related to Credit2.

> I don't think there are, but have there been any patches since the
> 4.13.0 release which might have fixed problems with credit 2
> scheduler? If not,=20
> what would the next step be to isolating the problem - a debug build
> of Xen or something else?
>=20
Yes, having a debug build of Xen running and providing, for instance,
the info that Juergen is asking for later in this thread, i.e.:

xl vcpu-list
/usr/lib/xen/bin/xenctx -C -S -s <domu-system-map> <domid>

And I'd add myself:

xl debug-keys r ; xl dmesg

And, in general, hypervisor logs when the problem occurs (I've gone
through the threads, and I don't think I have seen any, but maybe I
missed something?).

xentop

is also another way to have a look, from Dom0, at whether (and if yes,
which ones and how much) the vCPUs are busy.


> If there are no merged or proposed fixes soon, it may be worth
> considering making the credit scheduler the default again until
> problems with the=20
> credit2 scheduler are resolved.
>=20
Nothing similar to what is being described has happened in our testing
(or we wouldn't have switched to Credit2, of course! :-D).

I will see about trying to reproduce this myself, but this may take a
little bit. In the meantime, if you help us by sending more logs, we're
happy to try diagnosing and fixing things.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-EgM+MSBJi0XSahdXePix
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5NI5QACgkQFkJ4iaW4
c+5yexAA0mqib+9ZT5tKggF4bUTrdv6nPz1Z/MavCx6a25/bUi+iwjLKSs2Wcr8A
mPF9Lb91BTQBgi4S2r3+CZUVGswwi4/LEFBCUiMZA0UHrQhVgxKkyH1PbaWlUssb
1p3tlDt+Q3NLclPCGiiYMk2L0lDCecFLuwH9giz3RgfURz5dGvLCFqwoU9umgv5Q
NSfNYGT2TdKukuF1/QrRz0U8frvP/xK4VV8KKibr9Uds8HR04OfHQXHB3pnpH23T
Y6DRyMqgMD0Xscys+GBRwfx59Hkxm54ziRdN4OXw7SMAetMGqZjdGpm85hxuGkiy
6le27em5QtvJl3UbGVvql/8FMDXc3n5oHCXPpROzaC3TvB7EH0yTS5EvX7szm4HE
VU6SHv/b1qNOzU7MUCS6B8RWLjwNpG7t1nJsGGCVxfpkaIsPDqKSH95yM7o0ggn4
PQ3xH8aXf8JvU6BnfM4D9XF4trmUAoT2T4ceD4L2c2ZRusEluIbusUBlGgjQnBqC
0YZY1gwkORM8y6/9Aa4ysRW9vhbX7S4Pz290v8SIGChJ0cFx6VvCijIJnOD6yeT1
CRBK1ToAYgiRB1sOQMTipRt6vVI/2B3JhxSvUDfRNisWzHvUThROL1f5rb45YJlk
+pf+WR8rJrOQUNag7OHKc90N1oR9NFp5bnK4lwUQuG0whk1B6DQ=
=5mQS
-----END PGP SIGNATURE-----

--=-EgM+MSBJi0XSahdXePix--



--===============7655788788505762341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7655788788505762341==--


