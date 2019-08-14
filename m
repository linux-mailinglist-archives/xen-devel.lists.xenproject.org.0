Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BE48C5D6
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 04:07:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxieL-0006PK-1S; Wed, 14 Aug 2019 02:04:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Whf=WK=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hxieJ-0006PF-Nu
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 02:04:27 +0000
X-Inumbo-ID: d660c4f0-be37-11e9-8e4c-bfe0d4bd7c6d
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d660c4f0-be37-11e9-8e4c-bfe0d4bd7c6d;
 Wed, 14 Aug 2019 02:04:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 90849ACD8;
 Wed, 14 Aug 2019 02:04:23 +0000 (UTC)
Message-ID: <71cbab87f4929766bf4293419e50425ab62e822a.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Date: Wed, 14 Aug 2019 04:04:21 +0200
In-Reply-To: <alpine.DEB.2.21.1908131413200.30179@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <f986544f59e1b2e9fddba5090fc3c706c38e1ad3.camel@suse.com>
 <alpine.DEB.2.21.1908091127080.7788@sstabellini-ThinkPad-T480s>
 <6bc0e21d79c4f02ad89c94fa732a32a57bdc8521.camel@suse.com>
 <alpine.DEB.2.21.1908131413200.30179@sstabellini-ThinkPad-T480s>
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
Content-Type: multipart/mixed; boundary="===============9058109407362489974=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============9058109407362489974==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-VuWOWmrEkY4K7HiUN7D/"


--=-VuWOWmrEkY4K7HiUN7D/
Content-Type: multipart/mixed; boundary="=-qzAWaUvFvJpK0CWsYj5G"


--=-qzAWaUvFvJpK0CWsYj5G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-08-13 at 14:14 -0700, Stefano Stabellini wrote:
> On Tue, 13 Aug 2019, Dario Faggioli wrote:
> >=20
> > I am attaching an updated debug patch, with an additional printk
> > when
> > we reach the point, within the null scheduler, when the vcpu would
> > wake
> > up (to check whether the problem is that we never reach that point,
> > or
> > something else).
>=20
> See attached.
>
Ok, so we're not missing an "online call" nor a wakeup.

As Julien has identified, we seem to be stuck in a loop.

Now, while staring at the code of that loop, I've seen that pick_cpu()
may mess up with the scratch cpumask for the CPU, which I don't think
is a good thing.

So, can you also try this third debug-patch?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-qzAWaUvFvJpK0CWsYj5G
Content-Disposition: attachment; filename="xen-sched-null-vcpu-onoff-debug-v3.patch"
Content-Type: text/x-patch; name="xen-sched-null-vcpu-onoff-debug-v3.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jIGIveGVuL2NvbW1vbi9zY2hlZF9u
dWxsLmMKaW5kZXggMjZjNmYwZjEyOS4uZjkwYjE0NjIwOSAxMDA2NDQKLS0tIGEveGVuL2NvbW1v
bi9zY2hlZF9udWxsLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZF9udWxsLmMKQEAgLTQ1NSw2ICs0
NTUsNyBAQCBzdGF0aWMgdm9pZCBudWxsX3ZjcHVfaW5zZXJ0KGNvbnN0IHN0cnVjdCBzY2hlZHVs
ZXIgKm9wcywgc3RydWN0IHZjcHUgKnYpCiAKICAgICBpZiAoIHVubGlrZWx5KCFpc192Y3B1X29u
bGluZSh2KSkgKQogICAgIHsKKyAgICAgICAgZHByaW50ayhYRU5MT0dfR19JTkZPLCAiTm90IGlu
c2VydGluZyAlcHYgKG5vdCBvbmxpbmUhKVxuIiwgdik7CiAgICAgICAgIHZjcHVfc2NoZWR1bGVf
dW5sb2NrX2lycShsb2NrLCB2KTsKICAgICAgICAgcmV0dXJuOwogICAgIH0KQEAgLTUxNiw2ICs1
MTcsNyBAQCBzdGF0aWMgdm9pZCBudWxsX3ZjcHVfcmVtb3ZlKGNvbnN0IHN0cnVjdCBzY2hlZHVs
ZXIgKm9wcywgc3RydWN0IHZjcHUgKnYpCiAgICAgLyogSWYgb2ZmbGluZSwgdGhlIHZjcHUgc2hv
dWxkbid0IGJlIGFzc2lnbmVkLCBub3IgaW4gdGhlIHdhaXRxdWV1ZSAqLwogICAgIGlmICggdW5s
aWtlbHkoIWlzX3ZjcHVfb25saW5lKHYpKSApCiAgICAgeworICAgICAgICBkcHJpbnRrKFhFTkxP
R19HX0lORk8sICJOb3QgcmVtb3ZpbmcgJXB2ICh3YXNuJ3Qgb25saW5lISlcbiIsIHYpOwogICAg
ICAgICBBU1NFUlQocGVyX2NwdShucGMsIHYtPnByb2Nlc3NvcikudmNwdSAhPSB2KTsKICAgICAg
ICAgQVNTRVJUKGxpc3RfZW1wdHkoJm52Yy0+d2FpdHFfZWxlbSkpOwogICAgICAgICBnb3RvIG91
dDsKQEAgLTU3MSwxNCArNTczLDE3IEBAIHN0YXRpYyB2b2lkIG51bGxfdmNwdV93YWtlKGNvbnN0
IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHZjcHUgKnYpCiAgICAgICovCiAgICAgaWYg
KCB1bmxpa2VseShwZXJfY3B1KG5wYywgY3B1KS52Y3B1ICE9IHYgJiYgbGlzdF9lbXB0eSgmbnZj
LT53YWl0cV9lbGVtKSkgKQogICAgIHsKKyAgICAgICAgY3B1bWFza190IG1hc2s7CisKKyAgICAg
ICAgZHByaW50ayhYRU5MT0dfR19JTkZPLCAiJXB2IGlzIHdha2luZyB1cCBhZnRlciBoYXZpbmcg
YmVlbiBvZmZsaW5lXG4iLCB2KTsKICAgICAgICAgc3Bpbl9sb2NrKCZwcnYtPndhaXRxX2xvY2sp
OwogICAgICAgICBsaXN0X2FkZF90YWlsKCZudmMtPndhaXRxX2VsZW0sICZwcnYtPndhaXRxKTsK
ICAgICAgICAgc3Bpbl91bmxvY2soJnBydi0+d2FpdHFfbG9jayk7CiAKLSAgICAgICAgY3B1bWFz
a19hbmQoY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLCB2LT5jcHVfaGFyZF9hZmZpbml0eSwKKyAg
ICAgICAgY3B1bWFza19hbmQoJm1hc2ssIHYtPmNwdV9oYXJkX2FmZmluaXR5LAogICAgICAgICAg
ICAgICAgICAgICBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKHYtPmRvbWFpbikpOwogCi0gICAgICAg
IGlmICggIWNwdW1hc2tfaW50ZXJzZWN0cygmcHJ2LT5jcHVzX2ZyZWUsIGNwdW1hc2tfc2NyYXRj
aF9jcHUoY3B1KSkgKQorICAgICAgICBpZiAoICFjcHVtYXNrX2ludGVyc2VjdHMoJnBydi0+Y3B1
c19mcmVlLCAmbWFzaykgKQogICAgICAgICB7CiAgICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19H
X1dBUk5JTkcsICJXQVJOSU5HOiBkJWR2JWQgbm90IGFzc2lnbmVkIHRvIGFueSBDUFUhXG4iLAog
ICAgICAgICAgICAgICAgICAgICB2LT5kb21haW4tPmRvbWFpbl9pZCwgdi0+dmNwdV9pZCk7CkBA
IC01OTUsNyArNjAwLDcgQEAgc3RhdGljIHZvaWQgbnVsbF92Y3B1X3dha2UoY29uc3Qgc3RydWN0
IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3QgdmNwdSAqdikKICAgICAgICAgICogLSBpZiB3ZSdyZSBy
YWNpbmcgYWxyZWFkeSwgYW5kIGlmIHRoZXJlIHN0aWxsIGFyZSBmcmVlIGNwdXMsIHRyeQogICAg
ICAgICAgKiAgIGFnYWluLgogICAgICAgICAgKi8KLSAgICAgICAgd2hpbGUgKCBjcHVtYXNrX2lu
dGVyc2VjdHMoJnBydi0+Y3B1c19mcmVlLCBjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSkpICkKKyAg
ICAgICAgd2hpbGUgKCBjcHVtYXNrX2ludGVyc2VjdHMoJnBydi0+Y3B1c19mcmVlLCAmbWFzaykg
KQogICAgICAgICB7CiAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbmV3X2NwdSA9IHBpY2tfY3B1
KHBydiwgdik7CiAKQEAgLTYzNSw2ICs2NDAsOCBAQCBzdGF0aWMgdm9pZCBudWxsX3ZjcHVfc2xl
ZXAoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3QgdmNwdSAqdikKICAgICAgICAg
fQogICAgICAgICBlbHNlIGlmICggcGVyX2NwdShucGMsIGNwdSkudmNwdSA9PSB2ICkKICAgICAg
ICAgICAgIHRpY2tsZWQgPSB2Y3B1X2RlYXNzaWduKHBydiwgdik7CisKKyAgICAgICAgZHByaW50
ayhYRU5MT0dfR19JTkZPLCAiJXB2IGlzLCBhcHBhcmVudGx5LCBnb2luZyBvZmZsaW5lICh0aWNr
bGVkPSVkKVxuIiwgdiwgdGlja2xlZCk7CiAgICAgfQogCiAgICAgLyogSWYgdiBpcyBub3QgYXNz
aWduZWQgdG8gYSBwQ1BVLCBvciBpcyBub3QgcnVubmluZywgbm8gbmVlZCB0byBib3RoZXIgKi8K
QEAgLTY5Nyw2ICs3MDQsOCBAQCBzdGF0aWMgdm9pZCBudWxsX3ZjcHVfbWlncmF0ZShjb25zdCBz
dHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCB2Y3B1ICp2LAogICAgICAqLwogICAgIGlmICgg
dW5saWtlbHkoIWlzX3ZjcHVfb25saW5lKHYpKSApCiAgICAgeworICAgICAgICBkcHJpbnRrKFhF
TkxPR19HX0lORk8sICIlcHYgaXMsIGFwcGFyZW50bHksIGdvaW5nIG9mZmxpbmVcbiIsIHYpOwor
CiAgICAgICAgIHNwaW5fbG9jaygmcHJ2LT53YWl0cV9sb2NrKTsKICAgICAgICAgbGlzdF9kZWxf
aW5pdCgmbnZjLT53YWl0cV9lbGVtKTsKICAgICAgICAgc3Bpbl91bmxvY2soJnBydi0+d2FpdHFf
bG9jayk7Cg==


--=-qzAWaUvFvJpK0CWsYj5G--

--=-VuWOWmrEkY4K7HiUN7D/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1TbCYACgkQFkJ4iaW4
c+7KpxAAy8A3ct3UvDPHpZXSPjE+lbAJWHczy4plS1efIpTiqhfuXM6sRWIvdQVG
kl2iBELyBuMbIuwv54VOWD3yyJlZPFWbxdD7QF/tPuKqNQwKSliMHADXdbquSu2k
pCg4SCAewVRfsYU7xudA/F0rconwH3oAslOc5AIsHkwoxsoESGbYFG+3oC5UrO0v
Fhzqo/wmlbqQ//AnJbj+eddkOcmHd/oy/shDmhHwLkmfAT4kvy7nreg8DYN5Mze1
l99x+VyLRyTE1HVFAWI0A0b9woabei74IKqDKredO9+cdW7V4IutuO037GouyWus
3ckhQ+A91yPDsxFrLglrZAGJ7cxZCaNcG6/if6jr4VGgTerFUK86xmip+LvNeMdH
XijvAMIe6v/PKAx8Th0YpVMzvGC2kZN07rj5frELIjCp3VIS2kB7Sd91ETJel3Zl
lzDzkFijKXql3f7UWHr6f/KwK+SKpwgQrtIIiSm3WFxgmRH5z2lswIYD4s4XBRd7
8u1P4IYwB5LkFi9Vfu1WtbZpyIHEjhUKVREgMRzHyOcvKqTmbZtT/iAwxcJy5SEr
J8Kj2CWzhNb6bS3ufmZXD7OBZc+POJyTuRN0Y2duQlFIgO5FVE4D8ZVEQjyLZwx+
cdHIAWEltQLBgku+h8Y00htlMwX9UHepOGAYWgv4NHhLA+SoehQ=
=segL
-----END PGP SIGNATURE-----

--=-VuWOWmrEkY4K7HiUN7D/--



--===============9058109407362489974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9058109407362489974==--


