Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 164AB881DC
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 19:59:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw99B-0001l9-Bo; Fri, 09 Aug 2019 17:57:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XXK4=WF=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hw999-0001l3-EF
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 17:57:47 +0000
X-Inumbo-ID: 3070cf06-bacf-11e9-bd37-2bd803a537ec
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3070cf06-bacf-11e9-bd37-2bd803a537ec;
 Fri, 09 Aug 2019 17:57:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 15197ACB8;
 Fri,  9 Aug 2019 17:57:44 +0000 (UTC)
Message-ID: <f986544f59e1b2e9fddba5090fc3c706c38e1ad3.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>, George.Dunlap@eu.citrix.com
Date: Fri, 09 Aug 2019 19:57:42 +0200
In-Reply-To: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============1458659847466802726=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1458659847466802726==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-5SO6QXfD2KLGT1Aw+tOO"


--=-5SO6QXfD2KLGT1Aw+tOO
Content-Type: multipart/mixed; boundary="=-+0fbhjmsm3lEOPSzruEP"


--=-+0fbhjmsm3lEOPSzruEP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-08-07 at 11:22 -0700, Stefano Stabellini wrote:
> Hi Dario, George,
>=20
> Dom0less with sched=3Dnull is broken on staging, it simply hangs soon
> after Xen is finished loading things. My impression is that vcpus are
> not actually started. I did a git bisection and it pointed to:
>=20
> commit d545f1d6c2519a183ed631cfca7aff0baf29fde5 (refs/bisect/bad)
> Author: Dario Faggioli <dfaggioli@suse.com>
> Date:   Mon Aug 5 11:50:55 2019 +0100
>=20
>     xen: sched: deal with vCPUs being or becoming online or offline
>    =20
> Any ideas?
>=20
Ok, I've done some basic testing, and inspected the code again, and
honestly I am not finding anything really suspicious.

Of course, I'm not really testing dom0less, and I'm not sure I can
easily do that.

Can you help me with this, e.g., by providing some more info and, if
possible, logs?

E.g., you say boot stops after Xen loading. Is there a bootlog that we
can see (ideally from a debug build, and with "loglvl=3Dall
guest_loglvl=3Dall")?

Does the system respond to debug-keys? If yes, the log after triggering
the 'r' debug-key would be useful.

These patches are about vcpus going offline and online... does dom0less
play with vcpu onffline/online in any way?

I've put together a debug patch (attached), focusing on what the
mentioned commit does, but it's nothing more than a shot in the dark,
for now...

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-+0fbhjmsm3lEOPSzruEP
Content-Disposition: attachment; filename="xen-sched-null-vcpu-onoff-debug.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="xen-sched-null-vcpu-onoff-debug.patch";
	charset="UTF-8"

ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jIGIveGVuL2NvbW1vbi9zY2hlZF9u
dWxsLmMKaW5kZXggMjZjNmYwZjEyOS4uYWZkNDJlNTUyZiAxMDA2NDQKLS0tIGEveGVuL2NvbW1v
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
dDsKQEAgLTYzNSw2ICs2MzcsOCBAQCBzdGF0aWMgdm9pZCBudWxsX3ZjcHVfc2xlZXAoY29uc3Qg
c3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3QgdmNwdSAqdikKICAgICAgICAgfQogICAgICAg
ICBlbHNlIGlmICggcGVyX2NwdShucGMsIGNwdSkudmNwdSA9PSB2ICkKICAgICAgICAgICAgIHRp
Y2tsZWQgPSB2Y3B1X2RlYXNzaWduKHBydiwgdik7CisKKyAgICAgICAgZHByaW50ayhYRU5MT0df
R19JTkZPLCAiJXB2IGlzLCBhcHBhcmVudGx5LCBnb2luZyBvZmZsaW5lICh0aWNrbGVkPSVkKVxu
IiwgdiwgdGlja2xlZCk7CiAgICAgfQogCiAgICAgLyogSWYgdiBpcyBub3QgYXNzaWduZWQgdG8g
YSBwQ1BVLCBvciBpcyBub3QgcnVubmluZywgbm8gbmVlZCB0byBib3RoZXIgKi8KQEAgLTY5Nyw2
ICs3MDEsOCBAQCBzdGF0aWMgdm9pZCBudWxsX3ZjcHVfbWlncmF0ZShjb25zdCBzdHJ1Y3Qgc2No
ZWR1bGVyICpvcHMsIHN0cnVjdCB2Y3B1ICp2LAogICAgICAqLwogICAgIGlmICggdW5saWtlbHko
IWlzX3ZjcHVfb25saW5lKHYpKSApCiAgICAgeworICAgICAgICBkcHJpbnRrKFhFTkxPR19HX0lO
Rk8sICIlcHYgaXMsIGFwcGFyZW50bHksIGdvaW5nIG9mZmxpbmVcbiIsIHYpOworCiAgICAgICAg
IHNwaW5fbG9jaygmcHJ2LT53YWl0cV9sb2NrKTsKICAgICAgICAgbGlzdF9kZWxfaW5pdCgmbnZj
LT53YWl0cV9lbGVtKTsKICAgICAgICAgc3Bpbl91bmxvY2soJnBydi0+d2FpdHFfbG9jayk7Cg==


--=-+0fbhjmsm3lEOPSzruEP--

--=-5SO6QXfD2KLGT1Aw+tOO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1NtBcACgkQFkJ4iaW4
c+4oWBAAyarmu5ze4X5+wcuEvSLOCRCWcoAHZkzaeJFBLz5tpsvjiHY+9G4mjMnR
403YUkg7OIr6bG9aDq61Wqe3/ptnFIDadnpT4wMyybG3b847JArjcz+fJG4um8GC
lNTEki0qYQllFOvZ63tp3dCN1gXArKa6hNcdVKPOegHgPWeqkWvkld0tMZnQSVtI
y3p6gK5VX847dStbf6fWsi7/hBFqwDBKm/n57+F2k0VkVNQF9GC5opAUNMsqf+0a
kK/jhu5P9ZmJetwIEqZiiZmPosWOZXJCrwB0tfDjBXxvpSSWaS2bxpc3JAr4/V8q
lL42goaUQDP+Yg57elJqmvlaLu0Jv8kMKJUINYypBbZLC8/28ipqIZFa0in5uVLP
zFir4GWQB01gKd1lHZjgpQwniu62EMGbyzr1v6oJS6u7AIz0yV/kEDqyZCzjRkt1
kemMsCUe7aP4qQGxCfMNrDA+FxQ15x7XKpmP5kqvOWMaTya5nqXLWAZf2ZHdh9CL
MqAOdYrxiY4p0pzzoJH0g8Ykde5nVigmpzc2aoT5P+yKGYcaff3QjRYhn2PTVyTD
GnMmaaeEsxJYvzzXKtx8rxtkpR8W72maBB6dGMrkGqaJF4IPf68jyh0XbSVlpbJ7
r6rxUkaejYhIqgyED+klQB6uLKDJaJa/P6g0SowC/pHDkl95LOs=
=8cNb
-----END PGP SIGNATURE-----

--=-5SO6QXfD2KLGT1Aw+tOO--



--===============1458659847466802726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1458659847466802726==--


