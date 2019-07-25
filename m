Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4710750A5
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 16:11:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqePU-0003qS-Cm; Thu, 25 Jul 2019 14:07:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XezG=VW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqePT-0003qL-28
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 14:07:55 +0000
X-Inumbo-ID: 98397154-aee5-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 98397154-aee5-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 14:07:54 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ofAUMlIHTqGb4jcl7WBAyBMaPMI15JNn6P6Sjk1XA3GYRKiQZVClDSIy+mNO161gGGWTM/pvE8
 CQASNLSBT0txACdtgRD0dB7naB2+9IxED1GgMjY1KC2zX1itrGUTh4i+sg8Ccwiuekz/qOsBmu
 JGaLK46Alvg84lgoIPZ43zGaIFXlSeb049qrlEk+5B4OEdlW9R2eK4uPEbhHpD0uuBhwJWRSwB
 iQj0vNgtMXoNnGivNBuCPDpZduj6GEvuZTfJAxvUFfISojzFaZ/7Fc56If72MSNhrRybB8Clxo
 Bu0=
X-SBRS: 2.7
X-MesageID: 3441433
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3441433"
Date: Thu, 25 Jul 2019 16:07:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190725140744.cds7lzqrbozfj66y@Air-de-Roger>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <cc9a1959af91dc812553b700fee308573c5dea5d.camel@savoirfairelinux.com>
 <20190724154118.ourqzsecc6cylypd@Air-de-Roger>
 <40f51e942a4ce5d2f0aa6c557090cba1f0fccb16.camel@savoirfairelinux.com>
 <b9807309-6785-72ae-0a95-998f795fc51b@suse.com>
 <20190725131346.kve55aazhwls2rtb@Air-de-Roger>
 <b2e44583-8969-7a61-0458-a8ceea245792@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2e44583-8969-7a61-0458-a8ceea245792@suse.com>
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

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDE6NDM6MzRQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjUuMDcuMjAxOSAxNToxMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUaHUsIEp1bCAyNSwgMjAxOSBhdCAxMjo1NDo0NlBNICswMDAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAyNS4wNy4yMDE5IDE0OjQ0LCAgRnJlZHkgUC4gIHdyb3RlOgo+ID4+PiBPbiBX
ZWQsIDIwMTktMDctMjQgYXQgMTc6NDEgKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4g
Pj4+Pj4+IFdoYXQgaGFyZHdhcmUgaW50ZXJmYWNlIGRvZXMgdGhlcm1hbGQgKG9yIHRoZSBkcml2
ZXIgaW4gTGludXggaWYKPiA+Pj4+Pj4gdGhlcmUncyBvbmUpIHVzZSB0byBnZXQgdGhlIHRlbXBl
cmF0dXJlIGRhdGE/Cj4gPj4+Cj4gPj4+IEluIG91ciBpbml0aWFsIFBPQyB1c2luZyBYZW4gNC44
Lnggd2Ugd2hlcmUgdXNpbmcgTGludXggY29yZXRlbXAgZHJpdmVyCj4gPj4+IHJlYWRpbmcgYnkg
ZXhhbXBsZSAvY2xhc3Mvc3lzL2h3bW9uL2h3bW9uMC90ZW1wM19pbnB1dCBidXQgaXQgZ290Cj4g
Pj4+IGRlcHJlY2F0ZWQgYXQgY29tbWl0IDcyZTAzODQ1MGQzZDVkZTFhMzlmMGNmYTJkMmIwZjli
M2Q0M2M2YzYKPiA+Pgo+ID4+IEhtbSwgSSB3b3VsZG4ndCBjYWxsIHRoaXMgZGVwcmVjYXRpb24s
IGJ1dCBhIHJlZ3Jlc3Npb24uIEkgd291bGQKPiA+PiBzYXkgd2Ugd2FudCB0byByZS1leHBvc2Ug
dGhpcyBsZWFmIHRvIERvbTAsIHRoZSBtb3JlIHRoYXQgdGhlCj4gPj4gY29tbWl0IGFsc28gb25s
eSBtZW50aW9ucyB1bnByaXZpbGVnZWQgZG9tYWlucy4gQW5kcmV3Pwo+ID4gCj4gPiBBRkFJQ1Qg
ZnJvbSB0aGUgZG9jdW1lbnRzIHByb3ZpZGVkIGJ5IEZyZWR5IHRoZSB0ZW1wZXJhdHVyZSBpcyBy
ZWFkCj4gPiBmcm9tIGEgTVNSIHRoYXQgcmVwb3J0cyB0aGUgY3VycmVudCB0ZW1wZXJhdHVyZSBv
ZiB0aGUgY29yZSBvbiB3aGljaAo+ID4gdGhlIE1TUiBpcyByZWFkIGZyb20uIFdoZW4gcnVubmlu
ZyBvbiBYZW4gdGhpcyB3aWxsIG9ubHkgd29yawo+ID4gY29ycmVjdGx5IGlmIGRvbTAgaXMgZ2l2
ZW4gdGhlIHNhbWUgdkNQVXMgYXMgcENQVXMgYW5kIHRob3NlIGFyZQo+ID4gaWRlbnRpdHkgcGlu
bmVkLgo+ID4gCj4gPiBOb3Qgc3VyZSBob3cgY29tbW9uIHRoaXMgTVNSIGludGVyZmFjZSBpcyBp
biBvcmRlciB0byByZWFkIHRoZXJtYWwKPiA+IHZhbHVlcywgaWYgdGhlIGludGVyZmFjZSBpdCdz
IGNvbW1vbiBtYXliZSBpdCdzIHNvbWV0aGluZyB0aGF0IGNvdWxkCj4gPiBiZSBpbXBsZW1lbnRl
ZCBpbiBYZW4sIGFuZCBleHBvcnRlZCBzb21laG93IHRvIGRvbTAsIG1heWJlIHVzaW5nCj4gPiBz
eXNjdGw/Cj4gPiAKPiA+IE9yIGVsc2UgaGF2aW5nIGFuIGh5cGVyY2FsbCB0aGF0IGFsbG93cyBk
b20wIHRvIHJlcXVlc3QgWGVuIHRvIGV4ZWN1dGUKPiA+IE1TUiByZWFkL3dyaXRlcyBvbiBhIGdp
dmVuIHBDUFUuCj4gCj4gVGhpcyB3b3VsZCBsb29rIHRvIHJlcXVpcmUganVzdCBhIHNtYWxsIGV4
dGVuc2lvbiB0bwo+IFhFTl9SRVNPVVJDRV9PUF9NU1JfUkVBRC4gUXVlc3Rpb24gaXMgd2hldGhl
ciB0aGUgTGludXggZHJpdmVyCj4gbWFpbnRhaW5lcnMgd291bGQgYWNjZXB0IGEgY2hhbmdlIHVz
aW5nIHRoaXMgWGVuLXNwZWNpZmljCj4gYWx0ZXJuYXRpdmUgYWNjZXNzIG1lY2hhbmlzbSAoaW4g
d2hhdGV2ZXIgc2hhcGUpLgoKUmlnaHQsIHRoZXJlJ3MgYWxzbyB0aGUgZmFjdCB0aGF0IGFsbCBw
Q1BVcyBzaG91bGQgYmUgcmVwb3J0ZWQgaW4gdGhlCnRoZXJtYWwgZHJpdmVyLCB3aGlsZSBkb20w
IG1pZ2h0IGhhdmUgbGVzcyB2Q1BVcyB0aGFuIHBDUFVzIG9uIHRoZQpzeXN0ZW0uCgpEbyB5b3Ug
dGhpbmsgeW91IGNhbiB0YWtlIGEgbG9vayBpbnRvIHRoaXMgRnJlZHk/CgpJdCB3aWxsIGludm9s
dmUgbG9va2luZyBpbnRvIHRoZSBMaW51eCBkcml2ZXIgaW4gb3JkZXIgdG8gbWFrZSB1c2Ugb2YK
YW4gaHlwZXJjYWxsIGluc3RlYWQgb2YgYSByZG1zci4gSSB0aGluayBpdCBzaG91bGQgYmUgZmlu
ZSB0byBleHBvc2UKdGhlIENQVUlEIGxlYWYgdG8gZG9tMCBhcyBsb25nIGFzIHJlYWRzIGFyZSBw
ZXJmb3JtZWQgZnJvbSB0aGUKaHlwZXJjYWxsLCBpbiBvcmRlciB0byBhc3N1cmUgdGhhdCBMaW51
eCBnZXRzIGNvbnNpc3RlbnQgdmFsdWVzLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
