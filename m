Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F233A6628
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 11:59:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i55Wg-000886-FA; Tue, 03 Sep 2019 09:55:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4NVN=W6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i55We-000881-F6
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 09:55:00 +0000
X-Inumbo-ID: e36217fe-ce30-11e9-ab8c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e36217fe-ce30-11e9-ab8c-12813bfff9fa;
 Tue, 03 Sep 2019 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567504498;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HE8Y9vAn9/fSa+C+Zk/GQWbrv7R18SaEHPKN582caE0=;
 b=SlWAp3k8dgQOEhjgZJgD+KxznMCmbjUGmvrugynUKjCIeLuAdnHxT8B3
 9McA3G6nxmIIddNBcl6SpYEnNmIrPUwUjuar69Z24JHb9PS1AXnWeO4Dm
 cmpZDoUN57oBoS+m4n1iMds5jqOKgf8STq4H5utGqeWPITeeDM/3JE9Nv k=;
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
IronPort-SDR: +Rub3mNgDoMKkdlrJqmucwPPmyRLygvBZlNQotS0CDab8HFqtDB1DNAQ8cP7DYBE4DG1Cb7OcU
 zfWc88n/7dAeLC0ToPIaupa3sKnDLISKDGn9bwHJRmcH3QzQt0gKuWiAMkdNzSZSbZNI1mbZmQ
 lrgA1C3onpjXaDqHNvs9FDmprJAJhU7MhOgG7Cva742NrE+xYzV8/Q1mp4flwK92OYlDH4yELm
 +qOI3hvZ9KSD2jI+Vtr+2oqGWazMzstHXLKWpDgK99KXzLh9I7LS4wlz9dIjo21PXiJzd/hrlf
 oBE=
X-SBRS: 2.7
X-MesageID: 5057697
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,462,1559534400"; 
   d="scan'208";a="5057697"
Date: Tue, 3 Sep 2019 11:54:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190903095446.5zwuirhertfhu6f3@Air-de-Roger>
References: <20190902153037.99845-1-roger.pau@citrix.com>
 <773670ce-53bb-0677-8e07-69c84531847a@suse.com>
 <20190903092803.p5o33gl5ctnmue64@Air-de-Roger>
 <b17f112a-22f7-b361-069d-9351139a1a0c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b17f112a-22f7-b361-069d-9351139a1a0c@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] vpci: honor read-only devices
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
 Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMTE6NDg6MTlBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDMuMDkuMjAxOSAxMToyOCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUdWUsIFNlcCAwMywgMjAxOSBhdCAxMTowOTowOUFNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAwMi4wOS4yMDE5IDE3OjMwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4+
IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCj4gPj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Zw
Y2kvdnBjaS5jCj4gPj4+IEBAIC00MTgsMTMgKzQxOCwyMSBAQCB2b2lkIHZwY2lfd3JpdGUocGNp
X3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSwKPiA+Pj4g
ICAgICAgICAgcmV0dXJuOwo+ID4+PiAgICAgIH0KPiA+Pj4gIAo+ID4+PiAtICAgIC8qCj4gPj4+
IC0gICAgICogRmluZCB0aGUgUENJIGRldiBtYXRjaGluZyB0aGUgYWRkcmVzcy4KPiA+Pj4gLSAg
ICAgKiBQYXNzdGhyb3VnaCBldmVyeXRoaW5nIHRoYXQncyBub3QgdHJhcHBlZC4KPiA+Pj4gLSAg
ICAgKi8KPiA+Pj4gKyAgICAvKiBGaW5kIHRoZSBQQ0kgZGV2IG1hdGNoaW5nIHRoZSBhZGRyZXNz
LiAqLwo+ID4+PiAgICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXZfYnlfZG9tYWluKGQsIHNiZGYuc2Vn
LCBzYmRmLmJ1cywgc2JkZi5kZXZmbik7Cj4gPj4+ICAgICAgaWYgKCAhcGRldiApCj4gPj4+ICAg
ICAgewo+ID4+PiArICAgICAgICBjb25zdCB1bnNpZ25lZCBsb25nICpyb19tYXAgPSBwY2lfZ2V0
X3JvX21hcChzYmRmLnNlZyk7Cj4gPj4+ICsKPiA+Pj4gKyAgICAgICAgaWYgKCByb19tYXAgJiYg
dGVzdF9iaXQoc2JkZi5iZGYsIHJvX21hcCkgKQo+ID4+PiArICAgICAgICAgICAgLyogSWdub3Jl
IHdyaXRlcyB0byByZWFkLW9ubHkgZGV2aWNlcy4gKi8KPiA+Pj4gKyAgICAgICAgICAgIHJldHVy
bjsKPiA+Pj4gKwo+ID4+PiArICAgICAgICAvKgo+ID4+PiArICAgICAgICAgKiBMZXQgdGhlIGhh
cmR3YXJlIGRvbWFpbiBhY2Nlc3MgY29uZmlnIHNwYWNlIHJlZ2lvbnMgZm9yIG5vbi1leGlzdGVu
dAo+ID4+PiArICAgICAgICAgKiBkZXZpY2VzLgo+ID4+PiArICAgICAgICAgKiBUT0RPOiByZXZp
c2l0IGZvciBkb21VIHN1cHBvcnQuCj4gPj4+ICsgICAgICAgICAqLwo+ID4+PiAgICAgICAgICB2
cGNpX3dyaXRlX2h3KHNiZGYsIHJlZywgc2l6ZSwgZGF0YSk7Cj4gPj4+ICAgICAgICAgIHJldHVy
bjsKPiA+Pj4gICAgICB9Cj4gPj4+Cj4gPj4KPiA+PiBJbiBwcmluY2lwbGUgSSdtIG9rYXkgd2l0
aCB0aGUgY2hhbmdlLCBidXQgSSBoYXZlIHR3byBtb3JlIHRoaW5ncwo+ID4+IHRvIGJlIGNvbnNp
ZGVyZWQ6Cj4gPj4KPiA+PiAxKSBJJ2QgcHJlZmVyIGlmIHRoZSBjaGVjayB3YXMgaW5kZXBlbmRl
bnQgb2YgdGhlIHJldHVybiB2YWx1ZSBvZgo+ID4+IHBjaV9nZXRfcGRldl9ieV9kb21haW4oKSwg
dG8gYmUgbW9yZSByb2J1c3QgYWdhaW5zdCB0aGUgci9vIG1hcAo+ID4+IGhhdmluZyBnb3QgdXBk
YXRlZCBidXQgdGhlIG93bmVyIHN0aWxsIGJlaW5nIGh3ZG9tLgo+ID4gCj4gPiBTbyB0aGUgUk8g
Y2hlY2sgd291bGQgYmUgZG9uZSBhaGVhZCBvZiB0aGUgb3duZXIgY2hlY2s/Cj4gPiAKPiA+IEkg
Y2FuIGRvIHRoYXQsIGJ1dCBpdCBzZWVtcyBsaWtlIGEgYm9kZ2UgZm9yIHRoZSBsb2NraW5nIGlz
c3VlcyAob3IKPiA+IGxhY2sgb2YgaXQpIHdlIGhhdmUgaW4gdGhlIGhhbmRsaW5nIG9mIFBDSSBk
ZXZpY2VzLiBJIGFzc3VtZSBoYXZpbmcgYQo+ID4gUk8gZGV2aWNlIGFzc2lnbmVkIHRvIGEgZG9t
YWluIGRpZmZlcmVudCB0aGFuIGRvbV94ZW4gaXMgbm90IHBvc3NpYmxlLgo+IAo+IEl0IG91Z2h0
IG5vdCBiZSBwb3NzaWJsZS4gSGVuY2UgbWUgc2F5aW5nICJtb3JlIHJvYnVzdCIgKGkuZS4gaW4K
PiBjYXNlIHRoZSAib3VnaHQgbm90IiBzb21laG93IGdldHMgYnJva2VuKS4gQW5kIG5vLCB0aGUg
Y29tbWVudAo+IHdhc24ndCByZWFsbHkgcmVsYXRlZCB0byB0aGUgKGxhY2sgb2YpIGxvY2tpbmcg
aGVyZSAtIHRoYXQncyBhbgo+IG9ydGhvZ29uYWwgaXNzdWUuCgpBY2ssIEkgaGF2ZSB0byBzZW5k
IHYzIGFueXdheSBzaW5jZSBJIHdhcyBtaXNzaW5nIHNvbWUgY2hhbmdlcyB0byB0aGUKdlBDSSB0
ZXN0IGhhcm5lc3MgYW55d2F5LgoKPiA+PiAyKSBXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gbW92
ZSB0aGUgY2hlY2sgaW50byB0aGUgY2FsbGVycyBvZgo+ID4+IHZwY2lfd3JpdGUoKSwgdG8gYXZv
aWQgdGhlIGR1cGxpY2F0ZSBsb29rdXAgaW4gdGhlIHF3b3JkLU1DRkctCj4gPj4gd3JpdGUgY2Fz
ZT8gVGhlIG1haW4gcXVlc3Rpb25hYmxlIHBvaW50IGhlcmUgaXMgd2hlcmUsIGZvciBEb21VCj4g
Pj4gc3VwcG9ydCwgdGhlIFNCREYgdHJhbnNsYXRpb24gaXMgZ29pbmcgdG8gbGl2ZS4KPiA+IAo+
ID4gU28gSSBoYXZlIGEgc2VyaWVzIEknbSBnb2luZyB0byBzZW5kIHF1aXRlIHNvb24gaW4gb3Jk
ZXIgdG8gaW50ZWdyYXRlCj4gPiB2UENJIHdpdGggaW9yZXEsIGFzIGEgZmlyc3Qgc3RlcCBpbiBv
cmRlciB0byBtYWtlIGl0IGF2YWlsYWJsZSB0bwo+ID4gZG9tVXMuCj4gPiAKPiA+IFRoZSBTQkRG
IHRyYW5zbGF0aW9uIHRoZXJlIGlzIGdvaW5nIHRvIGJlIHBlcmZvcm1lZCBieSB0aGUgaW9yZXEg
Y29kZQo+ID4gKGllOiBodm1fc2VsZWN0X2lvcmVxX3NlcnZlciksIGJ1dCBjaGVja2luZyBhZ2Fp
bnN0IHRoZSBSTyBtYXAgdGhlcmUKPiA+IHdvdWxkIGJlIHdyb25nLCBhcyBpb3JlcSBkb2Vzbid0
IGtub3cgd2hldGhlciB0aGUgdW5kZXJseWluZyBoYW5kbGVyCj4gPiBpcyBmb3IgYW4gZW11bGF0
ZWQgZGV2aWNlIG9yIGZvciBhIHBhc3N0aHJvdWdoIG9uZS4gSSB0aGluayB0aGUgUk8KPiA+IGNo
ZWNrIG5lZWRzIHRvIGJlIGluIHRoZSB2UENJIGNvZGUgaXRzZWxmLgo+IAo+IE9oLCBzdXJlLiBU
aGUgcXVlc3Rpb24gdGhlbiBzaW1wbHkgY29udmVydHMgdG8gIldoZXJlIGNhbiBpdCBiZSBkb25l
Cj4gdGhlIGVhcmxpZXN0PyIgSS5lLiB3aGVuL3doZXJlIGRvIHdlIGhhdmUgdGhlIHBoeXNpY2Fs
IFNCREYgaW4gb3VyCj4gaGFuZHM/CgpJJ20gZ29pbmcgdG8gaW50cm9kdWNlIGEgdlBDSSBpb3Jl
cSBoYW5kbGVyIHRoYXQgd2lsbCBmb3J3YXJkIGFjY2Vzc2VzCnRvIHZwY2lfe3JlYWQvd3JpdGV9
LCBidXQgdGhhdCdzIG5vdCBoZXJlIHlldCwgYW5kIGluIGFueSBjYXNlIGl0J3MKbm90IGdvaW5n
IHRvIG1ha2UgbXVjaCBvZiBhIGRpZmZlcmVuY2UgSU1PLgoKSSB0aGluayBhdCBsZWFzdCBBVE0g
dGhlIGJlc3QgcGxhY2UgdG8gcHV0IHRoZSBjaGVjayBpcyBpbiB2cGNpX3dyaXRlLApsYXRlciBv
biB3ZSBjYW4gc2VlIGFib3V0IG1vdmluZyBpdCwgdGhlcmUncyBhIFRPRE8gbmV4dCB0byBpdCB3
aGljaAp3aWxsIGhlbHAgaWRlbnRpZnkgdGhpcy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
