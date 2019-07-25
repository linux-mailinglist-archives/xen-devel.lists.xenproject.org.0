Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD59752ED
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 17:39:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqfmV-0001kc-3Z; Thu, 25 Jul 2019 15:35:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XezG=VW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqfmT-0001kX-Ke
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 15:35:45 +0000
X-Inumbo-ID: dbd557de-aef1-11e9-830f-af2f3666ece5
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbd557de-aef1-11e9-830f-af2f3666ece5;
 Thu, 25 Jul 2019 15:35:41 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ApVx70pxEDHdv9RMQ0DLTD82RfIAw3zF/dVeEwfhiPPPRmRaeQIh+udmLv6v15ETv0v93GQuoE
 3vPETwe+3ud+l98MzEXfs8apoAnSpb0Lr+yR7kIKOhJQ5FhX2Jmhuve3jyhS3Q5gyjqw8iOehY
 Xz58GsvPOzBXs9rowAfRKXYEszxB4U6Eps+Eama/pTVWqUQv7BYJUsH5UQIeI6FfvpQFxpsr67
 task/9HDIrIkXsBUfEiaBtYHs5OcVFv/WrmjbJs0gy0kV9//suicMy2rWTcfysk0q5osgozB/a
 3Qo=
X-SBRS: 2.7
X-MesageID: 3467737
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,307,1559534400"; 
   d="scan'208";a="3467737"
Date: Thu, 25 Jul 2019 17:34:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190725153431.nc4wibss7ivvjvye@Air-de-Roger>
References: <cc9a1959af91dc812553b700fee308573c5dea5d.camel@savoirfairelinux.com>
 <20190724154118.ourqzsecc6cylypd@Air-de-Roger>
 <40f51e942a4ce5d2f0aa6c557090cba1f0fccb16.camel@savoirfairelinux.com>
 <b9807309-6785-72ae-0a95-998f795fc51b@suse.com>
 <20190725131346.kve55aazhwls2rtb@Air-de-Roger>
 <7e05469ebe82e4564ed3cca3182e7bad41a3f2ed.camel@savoirfairelinux.com>
 <20190725134750.d5hw6dsxjowk4ann@Air-de-Roger>
 <0f520921-51a5-22c3-bd5d-7774f26bac30@suse.com>
 <20190725141734.tkgdcg5zrbefuwzz@Air-de-Roger>
 <659529bf-beb8-2a11-b21a-03069a66d530@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <659529bf-beb8-2a11-b21a-03069a66d530@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] CPU frequency throttling based on the temperature
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
Cc: "Fredy P." <fredy.pulido@savoirfairelinux.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDI6MzE6NDBQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjUuMDcuMjAxOSAxNjoxNywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUaHUsIEp1bCAyNSwgMjAxOSBhdCAwMTo1OToyMlBNICswMDAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAyNS4wNy4yMDE5IDE1OjQ3LCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToKPiA+
Pj4gT24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDk6Mjk6MDFBTSAtMDQwMCwgRnJlZHkgUC4gd3Jv
dGU6Cj4gPj4+PiBPbiBUaHUsIDIwMTktMDctMjUgYXQgMTU6MTMgKzAyMDAsIFJvZ2VyIFBhdSBN
b25uw6kgd3JvdGU6Cj4gPj4+Pj4gT24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMTI6NTQ6NDZQTSAr
MDAwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+Pj4+IE9uIDI1LjA3LjIwMTkgMTQ6NDQsICBG
cmVkeSBQLiAgd3JvdGU6Cj4gPj4+Pj4+PiBPbiBXZWQsIDIwMTktMDctMjQgYXQgMTc6NDEgKzAy
MDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+Pj4+Pj4+PiBXaGF0IGhhcmR3YXJlIGlu
dGVyZmFjZSBkb2VzIHRoZXJtYWxkIChvciB0aGUgZHJpdmVyIGluCj4gPj4+Pj4+Pj4+PiBMaW51
eCBpZgo+ID4+Pj4+Pj4+Pj4gdGhlcmUncyBvbmUpIHVzZSB0byBnZXQgdGhlIHRlbXBlcmF0dXJl
IGRhdGE/Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gSW4gb3VyIGluaXRpYWwgUE9DIHVzaW5nIFhlbiA0
LjgueCB3ZSB3aGVyZSB1c2luZyBMaW51eCBjb3JldGVtcAo+ID4+Pj4+Pj4gZHJpdmVyCj4gPj4+
Pj4+PiByZWFkaW5nIGJ5IGV4YW1wbGUgL2NsYXNzL3N5cy9od21vbi9od21vbjAvdGVtcDNfaW5w
dXQgYnV0IGl0IGdvdAo+ID4+Pj4+Pj4gZGVwcmVjYXRlZCBhdCBjb21taXQgNzJlMDM4NDUwZDNk
NWRlMWEzOWYwY2ZhMmQyYjBmOWIzZDQzYzZjNgo+ID4+Pj4+Pgo+ID4+Pj4+PiBIbW0sIEkgd291
bGRuJ3QgY2FsbCB0aGlzIGRlcHJlY2F0aW9uLCBidXQgYSByZWdyZXNzaW9uLiBJIHdvdWxkCj4g
Pj4+Pj4+IHNheSB3ZSB3YW50IHRvIHJlLWV4cG9zZSB0aGlzIGxlYWYgdG8gRG9tMCwgdGhlIG1v
cmUgdGhhdCB0aGUKPiA+Pj4+Pj4gY29tbWl0IGFsc28gb25seSBtZW50aW9ucyB1bnByaXZpbGVn
ZWQgZG9tYWlucy4gQW5kcmV3Pwo+ID4+Pj4+Cj4gPj4+Pj4gQUZBSUNUIGZyb20gdGhlIGRvY3Vt
ZW50cyBwcm92aWRlZCBieSBGcmVkeSB0aGUgdGVtcGVyYXR1cmUgaXMgcmVhZAo+ID4+Pj4+IGZy
b20gYSBNU1IgdGhhdCByZXBvcnRzIHRoZSBjdXJyZW50IHRlbXBlcmF0dXJlIG9mIHRoZSBjb3Jl
IG9uIHdoaWNoCj4gPj4+Pj4gdGhlIE1TUiBpcyByZWFkIGZyb20uIFdoZW4gcnVubmluZyBvbiBY
ZW4gdGhpcyB3aWxsIG9ubHkgd29yawo+ID4+Pj4+IGNvcnJlY3RseSBpZiBkb20wIGlzIGdpdmVu
IHRoZSBzYW1lIHZDUFVzIGFzIHBDUFVzIGFuZCB0aG9zZSBhcmUKPiA+Pj4+PiBpZGVudGl0eSBw
aW5uZWQuCj4gPj4+Pgo+ID4+Pj4gSSBqdXN0IHdhbnQgdG8gYmUgc3VyZSBJIGdvdCBpdCBjb3Jy
ZWN0bHksIGJ5IHNheWluZyAiV2hlbiBydW5uaW5nIG9uCj4gPj4+PiBYZW4gdGhpcyB3aWxsIG9u
bHkgd29yayBjb3JyZWN0bHkgaWYgLi4uIiBtZWFucyBpbiBhIGZ1dHVyZQo+ID4+Pj4gaW1wbGVt
ZW50YXRpb24gb3IgdGhhdCByaWdodCBub3cgY291bGQgd29yayBpZiBJIHBpbiB0aGlzIHYvcENQ
VVM/Cj4gPj4+Cj4gPj4+IE5vLCByaWdodCBub3cgdGhlcmUncyBubyB3YXkgdG8gZ2V0IHRoaXMg
ZGF0YSBmcm9tIGRvbTAsIHJlZ2FyZGxlc3Mgb2YKPiA+Pj4gdGhlIHBpbm5pbmcuCj4gPj4KPiA+
PiBPZiBjb3Vyc2UgeW91IGNhbiwgdXNpbmcgdGhlIE1TUiAiZGV2aWNlIiBMaW51eCBvcHRpb25h
bGx5Cj4gPj4gcHJvdmlkZXMgKHBsdXMgcGVyaGFwcyB0aGUgcmRtc3IgdXRpbGl0eSBmcm9tIHRo
ZSBtc3ItdG9vbHMKPiA+PiBwYWNrYWdlKS4KPiA+IAo+ID4gQnV0IHlvdSB3b24ndCBnZXQgY29o
ZXJlbnQgcmVzdWx0cywgc2luY2UgdGhlIHZDUFUgbWlnaHQgYmUganVtcGluZwo+ID4gZnJvbSBw
Q1BVIHRvIHBDUFUsIHRodXMgcmV0dXJuaW5nIHZhbHVlcyBmcm9tIG11bHRpcGxlIGRpZmZlcmVu
dCBwQ1BVcwo+ID4gcmVnYXJkbGVzcyBvZiB3aGV0aGVyIGFsbCByZG1zciBoYXZlIGJlZW4gZXhl
Y3V0ZWQgZnJvbSB0aGUgc2FtZSB2Q1BVCj4gPiBmcm9tIGRvbTAgUG9WLgo+IAo+IEkgZG9uJ3Qg
dW5kZXJzdGFuZC4gRWFybGllciB5b3Ugc2FpZCAicmVnYXJkbGVzcyBvZiB0aGUgcGlubmluZyIu
Cj4gVGhhdCdzIHdoYXQgbXkgcmVzcG9uc2Ugd2FzIHRvLCBpLmUuIEkgd2FzIGltcGx5aW5nIHZD
UFUtcyB0byBiZQo+IHBpbm5lZC4KCk9oIHNvcnJ5LCB0aGF0IHdhcyBtZSBub3QgdGFraW5nIGlu
dG8gYWNjb3VudCB0aGUgZWFybGllciBjb250ZXh0LCB5b3UKYXJlIHJpZ2h0LiBUbyBzdW1tYXJp
emUgYW5kIG1ha2UgdGhpbmdzIGVhc2llciBmb3IgRnJlZHkgSSB0aGluayB0aGUKb3B0aW9ucyBh
cmU6CgogLSBDcmVhdGUgZG9tMCB3aXRoIHZDUFVzID09IHBDUFVzIGFuZCBpZGVudGl0eSBwaW4g
dGhlbS4gVGhlbiB5b3UKICAgKmNvdWxkKiBleHBvc2UgQ1BVSUQgbGVhZiA2IHRvIGRvbTAgYW5k
IHRoaW5ncyBzaG91bGQgYmUgT0sgSU1PLAogICBlaXRoZXIgd2hlbiB1c2luZyB0aGUgTGludXgg
ZHJpdmVyIG9yIHdoZW4gcmVhZGluZyB2YWx1ZXMgZGlyZWN0bHkKICAgZnJvbSB1c2VyLXNwYWNl
IHVzaW5nIHRoZSBNU1IgZGV2aWNlIHBvaW50ZWQgb3V0IGJ5IEphbi4KCiAtIE1vZGlmeSB0aGUg
TGludXggdGhlcm1hbCBkcml2ZXIgdG8gcmVwb3J0IHRoZSB0ZW1wZXJhdHVyZSBmb3IgYWxsCiAg
IHBDUFVzICh3aGljaCBtaWdodCBiZSBkaWZmZXJlbnQgdGhhbiBkb20wIHZDUFVzKSB1c2luZwog
ICBYRU5QRl9yZXNvdXJjZV9vcCBhbmQgWEVOX1JFU09VUkNFX09QX01TUl9SRUFELiBBRkFJQ1Qg
eW91IHdpbGwKICAgYWxzbyBuZWVkIHRvIGV4cG9zZSBDUFVJRCBsZWFmIDYgdG8gZG9tMCBzbyB0
aGF0IHRoZSB0aGVybWFsIGRyaXZlcgogICBhdHRhY2hlcy4KCiAtIEltcG9ydCBhIHRoZXJtYWwg
ZHJpdmVyIGludG8gWGVuIGFuZCBleHBvc2UgdGhlIHRoZXJtYWwgZGF0YQogICBzb21ld2hlcmUs
IGllOiBhIFhFTlBGIGh5cGVyY2FsbCBtYXliZS4KCk1heWJlIHNvbWVvbmUgY2FuIGNvbWUgdXAg
d2l0aCBtb3JlIGlkZWFzLCBidXQgdGhlcmUncyBsaWtlbHkgc29tZQpjb2RpbmcgdG8gYmUgZG9u
ZSBpbiBvcmRlciB0byBnZXQgdGhpcyB3b3JraW5nLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
