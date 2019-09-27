Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B67C0133
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 10:32:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDld2-0000wL-LP; Fri, 27 Sep 2019 08:29:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R7hV=XW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iDld0-0000wC-JU
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 08:29:26 +0000
X-Inumbo-ID: e9ea33c6-e100-11e9-bf31-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id e9ea33c6-e100-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 08:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569572966;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Us/FHkbF6fPbjcqSTYmPOTFL6o97EPbvGKGUdvBBn0Y=;
 b=NIItyqmdaOjfPeB/4knH7+7HYXX4Fgvz2UVZbtkOnfAE1ntvhv87Bc1z
 5gl74LNlhA1NS8MYit0zblrxTuW5bwYh+EajKnklkB9qKol3Ciw6HgfCv
 9G1YzlPhAOsyHFe83vWKoiIviXDc5vTi9+uU3IE5UJQUrPC8vmBwOwNtL s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4mSBQhUEcP8xpOQDamfSffvFcldg9a3TJVbgOxglLkT3vBIwTmwiLl4szC3ZpbhM+h8GrOXKTC
 IvfcLNFocQBr49+wOWSE46+v0Yqy3r77KbWnxHZ62ge2GGIkjj+ujRk5Z9SjeD0FPpU4wZprSX
 FBtTlraLtv5d+XXz3vFRH8N6wptqrtEIUNmqwhjqy+inTHNbAdZvjyB5wj+owP4jwcBTtv59qC
 g05iLmOkI56uAhzFH1yws9uXs2mWAespF7Yh+AE8Z9SrvAxGiU5rKfSCcEZWL9iowaiXnFTPCl
 iPs=
X-SBRS: 2.7
X-MesageID: 6164251
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,554,1559534400"; 
   d="scan'208";a="6164251"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH v2 09/11] vpci: register as an internal ioreq server
Thread-Index: AQHVYnK8hUfF0kaT/ky4pZpKfF2AZqck9OXggBkc2wCAAUHNcA==
Date: Fri, 27 Sep 2019 08:29:21 +0000
Message-ID: <75f89532a65446cb92a72b31aed96d5e@AMSPEX02CL03.citrite.net>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-10-roger.pau@citrix.com>
 <8b2ae16a846a4e88bf264a8d5a768a37@AMSPEX02CL03.citrite.net>
 <20190926150718.omalmgpxuxsezbov@Air-de-Roger>
In-Reply-To: <20190926150718.omalmgpxuxsezbov@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 09/11] vpci: register as an internal
 ioreq server
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMjYgU2VwdGVtYmVyIDIwMTkgMTY6MDcKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47
IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcKPiBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBKYW4g
QmV1bGljaAo+IDxqYmV1bGljaEBzdXNlLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPiA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFRpbSAoWGVu
Lm9yZykgPHRpbUB4ZW4ub3JnPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDkvMTFdIHZwY2k6
IHJlZ2lzdGVyIGFzIGFuIGludGVybmFsIGlvcmVxIHNlcnZlcgo+IAo+IE9uIFR1ZSwgU2VwIDEw
LCAyMDE5IGF0IDAzOjQ5OjQxUE0gKzAyMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gRnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPiA+ID4gU2VudDogMDMgU2VwdGVtYmVyIDIwMTkgMTc6MTQKPiA+
ID4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gPiBDYzogUm9nZXIgUGF1
IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBj
aXRyaXguY29tPjsgV2VpIExpdQo+ID4gPiA8d2xAeGVuLm9yZz47IEFuZHJldyBDb29wZXIgPEFu
ZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNp
dHJpeC5jb20+Owo+IEphbgo+ID4gPiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPiA+
ID4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+OyBUaW0gKFhlbi5vcmcpCj4gPHRpbUB4ZW4ub3JnPjsKPiA+ID4gUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiA+ID4gU3ViamVjdDogW1BBVENI
IHYyIDA5LzExXSB2cGNpOiByZWdpc3RlciBhcyBhbiBpbnRlcm5hbCBpb3JlcSBzZXJ2ZXIKPiA+
ID4gQEAgLTQ3OCw2ICs0ODAsNjcgQEAgdm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwg
dW5zaWduZWQgaW50IHJlZywgdW5zaWduZWQgaW50IHNpemUsCj4gPiA+ICAgICAgc3Bpbl91bmxv
Y2soJnBkZXYtPnZwY2ktPmxvY2spOwo+ID4gPiAgfQo+ID4gPgo+ID4gPiArI2lmZGVmIF9fWEVO
X18KPiA+ID4gK3N0YXRpYyBpbnQgaW9yZXFfaGFuZGxlcihzdHJ1Y3QgdmNwdSAqdiwgaW9yZXFf
dCAqcmVxLCB2b2lkICpkYXRhKQo+ID4gPiArewo+ID4gPiArICAgIHBjaV9zYmRmX3Qgc2JkZjsK
PiA+ID4gKwo+ID4gPiArICAgIGlmICggcmVxLT50eXBlID09IElPUkVRX1RZUEVfSU5WQUxJREFU
RSApCj4gPiA+ICsgICAgICAgIC8qCj4gPiA+ICsgICAgICAgICAqIElnbm9yZSBpbnZhbGlkYXRl
IHJlcXVlc3RzLCB0aG9zZSBjYW4gYmUgcmVjZWl2ZWQgZXZlbiB3aXRob3V0Cj4gPiA+ICsgICAg
ICAgICAqIGhhdmluZyBhbnkgbWVtb3J5IHJhbmdlcyByZWdpc3RlcmVkLCBzZWUgc2VuZF9pbnZh
bGlkYXRlX3JlcS4KPiA+ID4gKyAgICAgICAgICovCj4gPiA+ICsgICAgICAgIHJldHVybiBYODZF
TVVMX09LQVk7Cj4gPgo+ID4gSW4gZ2VuZXJhbCwgSSB3b25kZXIgd2hldGhlciBpbnRlcm5hbCBz
ZXJ2ZXJzIHdpbGwgZXZlciBuZWVkIHRvIGRlYWwgd2l0aCBpbnZhbGlkYXRlPyBUaGUgY29kZSBv
bmx5Cj4gZXhpc3RzIHRvIGdldCBRRU1VIHRvIGRyb3AgaXRzIG1hcCBjYWNoZSBhZnRlciBhIGRl
Y3JlYXNlX3Jlc2VydmF0aW9uIHNvIHRoYXQgdGhlIHBhZ2UgcmVmcyBnZXQKPiBkcm9wcGVkLgo+
IAo+IEkgdGhpbmsgdGhlIGJlc3Qgc29sdXRpb24gaGVyZSBpcyB0byByZW5hbWUgaHZtX2Jyb2Fk
Y2FzdF9pb3JlcSB0bwo+IGh2bV9icm9hZGNhc3RfaW9yZXFfZXh0ZXJuYWwgYW5kIHN3aXRjaCBp
dCdzIGNhbGxlcnMuIEJvdGgKPiBzZW5kX3RpbWVvZmZzZXRfcmVxIGFuZCBzZW5kX2ludmFsaWRh
dGVfcmVxIHNlZW0gb25seSByZWxldmFudCB0bwo+IGV4dGVybmFsIGlvcmVxIHNlcnZlcnMuCgpz
ZW5kX3RpbWVvZmZzZXRfcmVxKCkgaXMgcmVsaWMgd2hpY2ggb3VnaHQgdG8gYmUgcmVwbGFjZWQg
d2l0aCBhbm90aGVyIG1lY2hhbmlzbSBJTU8uLi4KCldoZW4gYW4gSFZNIGd1ZXN0IHdyaXRlcyBp
dHMgUlRDLCBhIG5ldyAndGltZW9mZnNldCcgdmFsdWUgKG9mZnNldCBvZiBSVEMgZnJvbSBob3N0
IHRpbWUpIGlzIGNhbGN1bGF0ZWQgKGFsc28gYXBwbGllZCB0byB0aGUgUFYgd2FsbGNsb2NrKSBh
bmQgYWR2ZXJ0aXNlZCB2aWEgdGhpcyBpb3JlcS4gSW4gWGVuU2VydmVyLCB0aGlzIGlzIHBpY2tl
ZCB1cCBieSBRRU1VLCBmb3J3YXJkZWQgdmlhIFFNUCB0byBYQVBJIGFuZCB0aGVuIHdyaXR0ZW4g
aW50byB0aGUgVk0gbWV0YS1kYXRhICh3aGljaCB0aGFuIGNhdXNlcyBpdCB0byBiZSB3cml0dGVu
IGludG8geGVuc3RvcmUgdG9vKS4gQWxsIHRoaXMgaXMgc28gdGhhdCB0aGF0IGd1ZXN0J3MgUlRD
IGNhbiBiZSBzZXQgY29ycmVjdGx5IHdoZW4gaXQgaXMgcmVib290ZWQuLi4gVGhlcmUgaGFzIHRv
IGJlIGEgYmV0dGVyIHdheSAoZS5nLiBleHRyYWN0aW5nIFJUQyB2aWEgaHZtIGNvbnRleHQgYW5k
IHNhdmluZyBpdCBiZWZvcmUgY2xlYW5pbmcgdXAgdGhlIGRvbWFpbikuCgpzZW5kX2ludmFsaWRh
dGVfcmVxKCkgaXMgcmVsZXZhbnQgZm9yIGFueSBlbXVsYXRvciBtYWludGFpbmluZyBhIGNhY2hl
IG9mIGd1ZXN0LT5ob3N0IG1lbW9yeSBtYXBwaW5ncyB3aGljaCwgSSBndWVzcywgY291bGQgaW5j
bHVkZSBpbnRlcm5hbCBlbXVsYXRvcnMgZXZlbiBpZiB0aGlzIGlzIG5vdCB0aGUgY2FzZSBhdCB0
aGUgbW9tZW50LgoKICBQYXVsCgo+IAo+IFRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
