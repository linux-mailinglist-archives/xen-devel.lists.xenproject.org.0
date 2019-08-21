Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BFA9773B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 12:36:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Nvy-0000zN-6m; Wed, 21 Aug 2019 10:33:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DxGC=WR=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1i0Nvw-0000zI-Nf
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 10:33:40 +0000
X-Inumbo-ID: 22d3e868-c3ff-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22d3e868-c3ff-11e9-b95f-bc764e2007e4;
 Wed, 21 Aug 2019 10:33:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7C153AF80;
 Wed, 21 Aug 2019 10:33:37 +0000 (UTC)
Message-ID: <197c435e78f47b0deb376493911abdc0922863b4.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Date: Wed, 21 Aug 2019 12:33:36 +0200
In-Reply-To: <78072866796e1dedd9068e4298a13c58a30e74e7.camel@suse.com>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <f986544f59e1b2e9fddba5090fc3c706c38e1ad3.camel@suse.com>
 <alpine.DEB.2.21.1908091127080.7788@sstabellini-ThinkPad-T480s>
 <6bc0e21d79c4f02ad89c94fa732a32a57bdc8521.camel@suse.com>
 <alpine.DEB.2.21.1908131413200.30179@sstabellini-ThinkPad-T480s>
 <71cbab87f4929766bf4293419e50425ab62e822a.camel@suse.com>
 <alpine.DEB.2.21.1908140927100.8737@sstabellini-ThinkPad-T480s>
 <78072866796e1dedd9068e4298a13c58a30e74e7.camel@suse.com>
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
Content-Type: multipart/mixed; boundary="===============7442534022087275772=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7442534022087275772==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-tsZaiHGFETm/tnGSsSwu"


--=-tsZaiHGFETm/tnGSsSwu
Content-Type: multipart/mixed; boundary="=-XMmEssiYUWaESWgFcG8t"


--=-XMmEssiYUWaESWgFcG8t
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-08-14 at 19:35 +0200, Dario Faggioli wrote:
> On Wed, 2019-08-14 at 09:27 -0700, Stefano Stabellini wrote:
> > On Wed, 14 Aug 2019, Dario Faggioli wrote:
> > > On Tue, 2019-08-13 at 14:14 -0700, Stefano Stabellini wrote:
> > > Now, while staring at the code of that loop, I've seen that
> > > pick_cpu()
> > > may mess up with the scratch cpumask for the CPU, which I don't
> > > think
> > > is a good thing.
> > >=20
> > > So, can you also try this third debug-patch?
> >=20
> > Yep, see attached
> >=20
> Ok, thanks again. So, cpumask_scratch() being mishandled was part of
> the problem, but not the root-cause.
>=20
> Well, it was worth a shot. :-P
>=20
> I think we need to get rid of the loop in which we're stuck.=20
>
Hey, Stefano, Julien,

Here's another patch.

Rather than a debug patch, this is rather an actual "proposed
solution".

Can you give it a go? If it works, I'll spin it as a proper patch.

Thanks!
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-XMmEssiYUWaESWgFcG8t
Content-Disposition: attachment; filename="xen-sched-null-vcpu-onoff.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="xen-sched-null-vcpu-onoff.patch"; charset="UTF-8"

ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jIGIveGVuL2NvbW1vbi9zY2hlZF9u
dWxsLmMKaW5kZXggMjZjNmYwZjEyOS4uNGZjNmYzYTNjNSAxMDA2NDQKLS0tIGEveGVuL2NvbW1v
bi9zY2hlZF9udWxsLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZF9udWxsLmMKQEAgLTU2NSw1MCAr
NTY1LDUyIEBAIHN0YXRpYyB2b2lkIG51bGxfdmNwdV93YWtlKGNvbnN0IHN0cnVjdCBzY2hlZHVs
ZXIgKm9wcywgc3RydWN0IHZjcHUgKnYpCiAgICAgZWxzZQogICAgICAgICBTQ0hFRF9TVEFUX0NS
QU5LKHZjcHVfd2FrZV9ub3RfcnVubmFibGUpOwogCisgICAgaWYgKCBsaWtlbHkocGVyX2NwdShu
cGMsIGNwdSkudmNwdSA9PSB2KSApCisgICAgeworICAgICAgICBjcHVfcmFpc2Vfc29mdGlycShj
cHUsIFNDSEVEVUxFX1NPRlRJUlEpOworICAgICAgICByZXR1cm47CisgICAgfQorCiAgICAgLyoK
ICAgICAgKiBJZiBhIHZjcHUgaXMgbmVpdGhlciBvbiBhIHBDUFUgbm9yIGluIHRoZSB3YWl0cXVl
dWUsIGl0IG1lYW5zIGl0IHdhcwotICAgICAqIG9mZmxpbmUsIGFuZCB0aGF0IGl0IGlzIG5vdyBj
b21pbmcgYmFjayBiZWluZyBvbmxpbmUuCisgICAgICogb2ZmbGluZSwgYW5kIHRoYXQgaXQgaXMg
bm93IGNvbWluZyBiYWNrIGJlaW5nIG9ubGluZS4gSWYgd2UncmUgbHVja3ksCisgICAgICogYW5k
IHYtPnByb2Nlc3NvciBpcyBmcmVlIChhbmQgYWZmaW5pdGllcyBtYXRjaCksIHdlIGNhbiBqdXN0
IGFzc2lnbgorICAgICAqIHRoZSB2Y3B1IHRvIGl0ICh3ZSBvd24gdGhlIHByb3BlciBsb2NrIGFs
cmVhZHkpIGFuZCBiZSBkb25lLgogICAgICAqLwotICAgIGlmICggdW5saWtlbHkocGVyX2NwdShu
cGMsIGNwdSkudmNwdSAhPSB2ICYmIGxpc3RfZW1wdHkoJm52Yy0+d2FpdHFfZWxlbSkpICkKKyAg
ICBpZiAoIHBlcl9jcHUobnBjLCBjcHUpLnZjcHUgPT0gTlVMTCAmJgorICAgICAgICAgdmNwdV9j
aGVja19hZmZpbml0eSh2LCBjcHUsIEJBTEFOQ0VfSEFSRF9BRkZJTklUWSkgKQogICAgIHsKLSAg
ICAgICAgc3Bpbl9sb2NrKCZwcnYtPndhaXRxX2xvY2spOwotICAgICAgICBsaXN0X2FkZF90YWls
KCZudmMtPndhaXRxX2VsZW0sICZwcnYtPndhaXRxKTsKLSAgICAgICAgc3Bpbl91bmxvY2soJnBy
di0+d2FpdHFfbG9jayk7Ci0KLSAgICAgICAgY3B1bWFza19hbmQoY3B1bWFza19zY3JhdGNoX2Nw
dShjcHUpLCB2LT5jcHVfaGFyZF9hZmZpbml0eSwKLSAgICAgICAgICAgICAgICAgICAgY3B1cG9v
bF9kb21haW5fY3B1bWFzayh2LT5kb21haW4pKTsKLQotICAgICAgICBpZiAoICFjcHVtYXNrX2lu
dGVyc2VjdHMoJnBydi0+Y3B1c19mcmVlLCBjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSkpICkKKyAg
ICAgICAgaWYgKCAhaGFzX3NvZnRfYWZmaW5pdHkodikgfHwKKyAgICAgICAgICAgICB2Y3B1X2No
ZWNrX2FmZmluaXR5KHYsIGNwdSwgQkFMQU5DRV9TT0ZUX0FGRklOSVRZKSApCiAgICAgICAgIHsK
LSAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0dfV0FSTklORywgIldBUk5JTkc6IGQlZHYlZCBu
b3QgYXNzaWduZWQgdG8gYW55IENQVSFcbiIsCi0gICAgICAgICAgICAgICAgICAgIHYtPmRvbWFp
bi0+ZG9tYWluX2lkLCB2LT52Y3B1X2lkKTsKKyAgICAgICAgICAgIHZjcHVfYXNzaWduKHBydiwg
diwgY3B1KTsKKyAgICAgICAgICAgIGNwdV9yYWlzZV9zb2Z0aXJxKGNwdSwgU0NIRURVTEVfU09G
VElSUSk7CiAgICAgICAgICAgICByZXR1cm47CiAgICAgICAgIH0KKyAgICB9CiAKLSAgICAgICAg
LyoKLSAgICAgICAgICogTm93IHdlIHdvdWxkIHdhbnQgdG8gYXNzaWduIHRoZSB2Y3B1IHRvIGNw
dSwgYnV0IHdlIGNhbid0LCBiZWNhdXNlCi0gICAgICAgICAqIHdlIGRvbid0IGhhdmUgdGhlIGxv
Y2suIFNvLCBsZXQncyBkbyB0aGUgZm9sbG93aW5nOgotICAgICAgICAgKiAtIHRyeSB0byByZW1v
dmUgY3B1IGZyb20gdGhlIGxpc3Qgb2YgZnJlZSBjcHVzLCB0byBhdm9pZCByYWNlcyB3aXRoCi0g
ICAgICAgICAqICAgb3RoZXIgb25saW5pbmcsIGluc2VydGluZyBvciBtaWdyYXRpbmcgb3BlcmF0
aW9uczsKLSAgICAgICAgICogLSB0aWNrbGUgdGhlIGNwdSwgd2hpY2ggd2lsbCBwaWNrdXAgd29y
ayBmcm9tIHRoZSB3YWl0cXVldWUsIGFuZAotICAgICAgICAgKiAgIGFzc2lnbiBpdCB0byBpdHNl
bGY7Ci0gICAgICAgICAqIC0gaWYgd2UncmUgcmFjaW5nIGFscmVhZHksIGFuZCBpZiB0aGVyZSBz
dGlsbCBhcmUgZnJlZSBjcHVzLCB0cnkKLSAgICAgICAgICogICBhZ2Fpbi4KLSAgICAgICAgICov
Ci0gICAgICAgIHdoaWxlICggY3B1bWFza19pbnRlcnNlY3RzKCZwcnYtPmNwdXNfZnJlZSwgY3B1
bWFza19zY3JhdGNoX2NwdShjcHUpKSApCi0gICAgICAgIHsKLSAgICAgICAgICAgIHVuc2lnbmVk
IGludCBuZXdfY3B1ID0gcGlja19jcHUocHJ2LCB2KTsKKyAgICAvKgorICAgICAqIElmIHYtPnBy
b2Nlc3NvciBpcyBub3QgZnJlZSAob3IgYWZmaW5pdGllcyBkbyBub3QgbWF0Y2gpIHdlIG5lZWQK
KyAgICAgKiB0byBhc3NpZ24gdiB0byBzb21lIG90aGVyIENQVSwgYnV0IHdlIGNhbid0IGRvIGl0
IGhlcmUsIGFzOgorICAgICAqIC0gd2UgZG9uJ3Qgb3duICB0aGUgcHJvcGVyIGxvY2ssCisgICAg
ICogLSB3ZSBjYW4ndCBjaGFuZ2Ugdi0+cHJvY2Vzc29yIHVuZGVyIHZjcHVfd2FrZSgpJ3MgZmVl
dC4KKyAgICAgKiBTbyB3ZSBhZGQgaXQgdG8gdGhlIHdhaXRxdWV1ZSwgYW5kIHRpY2tsZSBhbGwg
dGhlIGZyZWUgQ1BVcyAoaWYgYW55KQorICAgICAqIG9uIHdoaWNoIHYgY2FuIHJ1bi4gVGhlIGZp
cnN0IG9uZSB0aGF0IHNjaGVkdWxlcyB3aWxsIHBpY2sgaXQgdXAuCisgICAgICovCisgICAgc3Bp
bl9sb2NrKCZwcnYtPndhaXRxX2xvY2spOworICAgIGxpc3RfYWRkX3RhaWwoJm52Yy0+d2FpdHFf
ZWxlbSwgJnBydi0+d2FpdHEpOworICAgIHNwaW5fdW5sb2NrKCZwcnYtPndhaXRxX2xvY2spOwog
Ci0gICAgICAgICAgICBpZiAoIHRlc3RfYW5kX2NsZWFyX2JpdChuZXdfY3B1LCAmcHJ2LT5jcHVz
X2ZyZWUpICkKLSAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBjcHVfcmFpc2Vfc29mdGly
cShuZXdfY3B1LCBTQ0hFRFVMRV9TT0ZUSVJRKTsKLSAgICAgICAgICAgICAgICByZXR1cm47Ci0g
ICAgICAgICAgICB9Ci0gICAgICAgIH0KLSAgICB9CisgICAgY3B1bWFza19hbmQoY3B1bWFza19z
Y3JhdGNoX2NwdShjcHUpLCB2LT5jcHVfaGFyZF9hZmZpbml0eSwKKyAgICAgICAgICAgICAgICBj
cHVwb29sX2RvbWFpbl9jcHVtYXNrKHYtPmRvbWFpbikpOworICAgIGNwdW1hc2tfYW5kKGNwdW1h
c2tfc2NyYXRjaF9jcHUoY3B1KSwgY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLAorICAgICAgICAg
ICAgICAgICZwcnYtPmNwdXNfZnJlZSk7CiAKLSAgICAvKiBOb3RlIHRoYXQgd2UgZ2V0IGhlcmUg
b25seSBmb3IgdkNQVXMgYXNzaWduZWQgdG8gYSBwQ1BVICovCi0gICAgY3B1X3JhaXNlX3NvZnRp
cnEodi0+cHJvY2Vzc29yLCBTQ0hFRFVMRV9TT0ZUSVJRKTsKKyAgICBpZiAoIGNwdW1hc2tfZW1w
dHkoY3B1bWFza19zY3JhdGNoX2NwdShjcHUpKSApCisgICAgICAgIGRwcmludGsoWEVOTE9HX0df
V0FSTklORywgIldBUk5JTkc6IGQlZHYlZCBub3QgYXNzaWduZWQgdG8gYW55IENQVSFcbiIsCisg
ICAgICAgICAgICAgICAgdi0+ZG9tYWluLT5kb21haW5faWQsIHYtPnZjcHVfaWQpOworICAgIGVs
c2UKKyAgICAgICAgY3B1bWFza19yYWlzZV9zb2Z0aXJxKGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1
KSwgU0NIRURVTEVfU09GVElSUSk7CiB9CiAKIHN0YXRpYyB2b2lkIG51bGxfdmNwdV9zbGVlcChj
b25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCB2Y3B1ICp2KQpAQCAtODIyLDYgKzgy
NCw4IEBAIHN0YXRpYyBzdHJ1Y3QgdGFza19zbGljZSBudWxsX3NjaGVkdWxlKGNvbnN0IHN0cnVj
dCBzY2hlZHVsZXIgKm9wcywKICAgICAgKi8KICAgICBpZiAoIHVubGlrZWx5KHJldC50YXNrID09
IE5VTEwpICkKICAgICB7CisgICAgICAgIGJvb2wgdmNwdV9mb3VuZDsKKwogICAgICAgICBzcGlu
X2xvY2soJnBydi0+d2FpdHFfbG9jayk7CiAKICAgICAgICAgaWYgKCBsaXN0X2VtcHR5KCZwcnYt
PndhaXRxKSApCkBAIC04MzQsNiArODM4LDcgQEAgc3RhdGljIHN0cnVjdCB0YXNrX3NsaWNlIG51
bGxfc2NoZWR1bGUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLAogICAgICAgICAgKiBpdCBv
bmx5IGluIGNhc2VzIHdoZXJlIGEgcGNwdSBoYXMgbm8gdmNwdSBhc3NvY2lhdGVkIChlLmcuLCBh
cwogICAgICAgICAgKiBzYWlkIGFib3ZlLCB0aGUgY3B1IGhhcyBqdXN0IGpvaW5lZCBhIGNwdXBv
b2wpLgogICAgICAgICAgKi8KKyAgICAgICAgdmNwdV9mb3VuZCA9IGZhbHNlOwogICAgICAgICBm
b3JfZWFjaF9hZmZpbml0eV9iYWxhbmNlX3N0ZXAoIGJzICkKICAgICAgICAgewogICAgICAgICAg
ICAgbGlzdF9mb3JfZWFjaF9lbnRyeSggd3ZjLCAmcHJ2LT53YWl0cSwgd2FpdHFfZWxlbSApCkBA
IC04NDQsMTMgKzg0OSw0NCBAQCBzdGF0aWMgc3RydWN0IHRhc2tfc2xpY2UgbnVsbF9zY2hlZHVs
ZShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsCiAKICAgICAgICAgICAgICAgICBpZiAoIHZj
cHVfY2hlY2tfYWZmaW5pdHkod3ZjLT52Y3B1LCBjcHUsIGJzKSApCiAgICAgICAgICAgICAgICAg
ewotICAgICAgICAgICAgICAgICAgICB2Y3B1X2Fzc2lnbihwcnYsIHd2Yy0+dmNwdSwgY3B1KTsK
LSAgICAgICAgICAgICAgICAgICAgbGlzdF9kZWxfaW5pdCgmd3ZjLT53YWl0cV9lbGVtKTsKLSAg
ICAgICAgICAgICAgICAgICAgcmV0LnRhc2sgPSB3dmMtPnZjcHU7Ci0gICAgICAgICAgICAgICAg
ICAgIGdvdG8gdW5sb2NrOworICAgICAgICAgICAgICAgICAgICBzcGlubG9ja190ICpsb2NrOwor
CisgICAgICAgICAgICAgICAgICAgIHZjcHVfZm91bmQgPSB0cnVlOworCisgICAgICAgICAgICAg
ICAgICAgIC8qCisgICAgICAgICAgICAgICAgICAgICAqIElmIHRoZSB2Y3B1IGluIHRoZSB3YWl0
cXVldWUgaGFzIGp1c3QgY29tZSB1cCBvbmxpbmUsCisgICAgICAgICAgICAgICAgICAgICAqIHdl
IHJpc2sgcmFjaW5nIHdpdGggdmNwdV93YWtlKCkuIFRvIGF2b2lkIHRoaXMsIHN5bmMKKyAgICAg
ICAgICAgICAgICAgICAgICogb24gdGhlIHNwaW5sb2NrIHRoYXQgdmNwdV93YWtlKCkgaG9sZHMs
IHdoaWxlIHdha2luZyB1cAorICAgICAgICAgICAgICAgICAgICAgKiB0aGlzIHZjcHUgKGJ1dCBv
bmx5IHdpdGggdHJ5bG9jaywgb3Igd2UgbWF5IGRlYWRsb2NrKS4KKyAgICAgICAgICAgICAgICAg
ICAgICovCisgICAgICAgICAgICAgICAgICAgIGxvY2sgPSBwY3B1X3NjaGVkdWxlX3RyeWxvY2so
d3ZjLT52Y3B1LT5wcm9jZXNzb3IpOworCisgICAgICAgICAgICAgICAgICAgIC8qCisgICAgICAg
ICAgICAgICAgICAgICAqIFdlIGtub3cgdGhlIHZjcHUncyBsb2NrIGlzIG5vdCB0aGlzIGNwdSdz
IGxvY2suIEluCisgICAgICAgICAgICAgICAgICAgICAqIGZhY3QsIGlmIGl0IHdlcmUsIHNpbmNl
IHRoaXMgY3B1IGlzIGZyZWUsIHZjcHVfd2FrZSgpCisgICAgICAgICAgICAgICAgICAgICAqIHdv
dWxkIGhhdmUgYXNzaWduZWQgdGhlIHZjcHUgdG8gdGhpcyBjcHUgZGlyZWN0bHkuCisgICAgICAg
ICAgICAgICAgICAgICAqLworICAgICAgICAgICAgICAgICAgICBBU1NFUlQobG9jayAhPSBwZXJf
Y3B1KHNjaGVkdWxlX2RhdGEsIGNwdSkuc2NoZWR1bGVfbG9jayk7CisKKyAgICAgICAgICAgICAg
ICAgICAgaWYgKCBsb2NrICkgeworICAgICAgICAgICAgICAgICAgICAgICAgdmNwdV9hc3NpZ24o
cHJ2LCB3dmMtPnZjcHUsIGNwdSk7CisgICAgICAgICAgICAgICAgICAgICAgICBsaXN0X2RlbF9p
bml0KCZ3dmMtPndhaXRxX2VsZW0pOworICAgICAgICAgICAgICAgICAgICAgICAgcmV0LnRhc2sg
PSB3dmMtPnZjcHU7CisgICAgICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9jayhsb2NrKTsK
KyAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gdW5sb2NrOworICAgICAgICAgICAgICAgICAg
ICB9CiAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgfQogICAgICAgICB9CisgICAgICAg
IC8qCisgICAgICAgICAqIElmIHdlIGRpZCBmaW5kIGEgdmNwdSB3aXRoIHN1aXRhYmxlIGFmZmlu
aXR5IGluIHRoZSB3YWl0cXVldWUsIGJ1dAorICAgICAgICAgKiB3ZSBjb3VsZCBub3QgcGljayBp
dCB1cCAoZHVlIHRvIGxvY2sgY29udGVudGlvbiksIGFuZCBoZW5jZSB3ZSBhcmUKKyAgICAgICAg
ICogc3RpbGwgZnJlZSwgcGxhbiBmb3IgYW5vdGhlciB0cnkuIEluIGZhY3QsIHdlIGRvbid0IHdh
bnQgc3VjaCB2Y3B1CisgICAgICAgICAqIHRvIGJlIHN0dWNrIGluIHRoZSB3YWl0cXVldWUsIHdo
ZW4gdGhlcmUgYXJlIGZyZWUgY3B1cyB3aGVyZSBpdAorICAgICAgICAgKiBjb3VsZCBydW4uCisg
ICAgICAgICAqLworICAgICAgICBpZiAoIHVubGlrZWx5KCB2Y3B1X2ZvdW5kICYmIHJldC50YXNr
ID09IE5VTEwgJiYgIWxpc3RfZW1wdHkoJnBydi0+d2FpdHEpKSApCisgICAgICAgICAgICBjcHVf
cmFpc2Vfc29mdGlycShjcHUsIFNDSEVEVUxFX1NPRlRJUlEpOwogIHVubG9jazoKICAgICAgICAg
c3Bpbl91bmxvY2soJnBydi0+d2FpdHFfbG9jayk7CiAK


--=-XMmEssiYUWaESWgFcG8t--

--=-tsZaiHGFETm/tnGSsSwu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1dHgAACgkQFkJ4iaW4
c+52hRAAklyvTw8NdBcvQcGMKXx49PZufmH2Az+yJOlOd0VyEaDKpjLMGSBaEV9z
xKzMqsimcKZnyJOvGbfkPnteOOc+AEsNeRtAbC7cpssKxgVMk9DzFAFKwxrekwyD
+wc67yXWYiXXfxTRzmgFubuZuHFkU0EJaSv+CrROKXu0rgnrAgOZ66bhSJv1cxFw
v083lyFEIa+4tS/HUroG4WcRtUvAYNXk3yvdl1SdjOAEApCjf5z1e6hF0Uk5RrxV
vdkJNSicYnAkWpPcWoIhDLA9sWThv3LnG8BD7pDn7Qvl6DhwzIsJIpF7HHZ1+Si2
fsAFTS6NckLUQsGu+g+3cHoJD0Kvx/yhKYj1eTbYWGAbGc35Sh8kaW36QtzAA9ja
fNdCmuPS1oh11I+IIXrkByGKR1jfVlvLUMEWu0EuTlIxeK4VnIUik/GkkleAtV6s
eqHQYjMToMwI0r+9qW1PeaVPmwRSVYycinWx/XIl6go2jGIRR6sJff4rvtRpfmn4
mBR8ThHQRe3xDrSzS3Sm3Wf/BfHwaM2U7r1hX5zXMYLrhCr4CV4YpyLQsUhT3I3+
qKiIP9xKQ2xvVt7ONjyuB6Ao4Dcs4d1EOYvDzgE/irmq0pXF6qhqKlmvda/8+9VE
cZKhTOAjRh10sAnVYFflkCzqS8+B1sWdHlvGOoc2NgKoiVMiS3s=
=rSiA
-----END PGP SIGNATURE-----

--=-tsZaiHGFETm/tnGSsSwu--



--===============7442534022087275772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7442534022087275772==--


