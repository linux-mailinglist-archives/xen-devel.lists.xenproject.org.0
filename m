Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9177FC01BA
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 11:04:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDm8Y-0005sK-PH; Fri, 27 Sep 2019 09:02:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R7hV=XW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iDm8X-0005rw-5h
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 09:02:01 +0000
X-Inumbo-ID: 76e88184-e105-11e9-b588-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 76e88184-e105-11e9-b588-bc764e2007e4;
 Fri, 27 Sep 2019 09:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569574920;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PEOYeW2PWZaQFPKSTucTzD0mJYfAxQExnAt/bd9XGOg=;
 b=EbzU2wrWyExox20Oe1458yu6K4FP7LaaPsi9kbKodhVNyLhUjGsEuJju
 CW7GCElNANOEKVLL+6fabB8TofcojrAytAqc352nn4z9aSNruX/+ljkRx
 fmfvS1J/kiDHI5waxliO9AM0IUaAJ1bW3Izgt9ByEEJY12T/TjC1QlmEy w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CDwYCfuRSlq2rZe217Z4f7n2kAUQ7t/nbiEm+BilY+xD6ha+hL/qdITR5k+sVjoe5hcAnYY0dX
 DrmEy+His0UpkoZa+6q9wJppwN6pHMeId0JjQDAZwGKtvisHaCEUVLwsd83ZOl2leHfSieSCud
 LMJUUpb10r+LLmVOruXomnQUwgJCr3vbrwOsBm1E1++P1DR+fs4NcaxD3hT+xMJVhPAdQsCOCH
 rVepfqihVYK55QMf9lhU3RBqBB6qhaJPAaIYV1bADMGDaW0q9vSG++lVqfhOtOOZWhTKK5ySRN
 MP8=
X-SBRS: 2.7
X-MesageID: 6228173
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,554,1559534400"; 
   d="scan'208";a="6228173"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH v2 09/11] vpci: register as an internal ioreq server
Thread-Index: AQHVYnK8hUfF0kaT/ky4pZpKfF2AZqck9OXggBkc2wCAAUHNcP//5eoAgAAkKAA=
Date: Fri, 27 Sep 2019 09:01:39 +0000
Message-ID: <54a96879442b4db798a8140f12f32d2c@AMSPEX02CL03.citrite.net>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-10-roger.pau@citrix.com>
 <8b2ae16a846a4e88bf264a8d5a768a37@AMSPEX02CL03.citrite.net>
 <20190926150718.omalmgpxuxsezbov@Air-de-Roger>
 <75f89532a65446cb92a72b31aed96d5e@AMSPEX02CL03.citrite.net>
 <20190927084542.yggl5mxomuntieel@Air-de-Roger>
In-Reply-To: <20190927084542.yggl5mxomuntieel@Air-de-Roger>
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
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMjcgU2VwdGVtYmVyIDIwMTkgMDk6NDYKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47
IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcKPiBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBKYW4g
QmV1bGljaAo+IDxqYmV1bGljaEBzdXNlLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPiA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFRpbSAoWGVu
Lm9yZykgPHRpbUB4ZW4ub3JnPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDkvMTFdIHZwY2k6
IHJlZ2lzdGVyIGFzIGFuIGludGVybmFsIGlvcmVxIHNlcnZlcgo+IAo+IE9uIEZyaSwgU2VwIDI3
LCAyMDE5IGF0IDEwOjI5OjIxQU0gKzAyMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gRnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPiA+ID4gU2VudDogMjYgU2VwdGVtYmVyIDIwMTkgMTY6MDcKPiA+
ID4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPiA+IENjOiB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBj
aXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47Cj4gQW5kcmV3Cj4gPiA+IENvb3BlciA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBA
Y2l0cml4LmNvbT47IEphbiBCZXVsaWNoCj4gPiA+IDxqYmV1bGljaEBzdXNlLmNvbT47IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPiA+
ID4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz4KPiA+ID4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MiAwOS8xMV0gdnBjaTogcmVnaXN0ZXIgYXMgYW4gaW50ZXJuYWwgaW9y
ZXEgc2VydmVyCj4gPiA+Cj4gPiA+IE9uIFR1ZSwgU2VwIDEwLCAyMDE5IGF0IDAzOjQ5OjQxUE0g
KzAyMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCj4gPiA+ID4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+ID4gPiA+ID4gU2VudDogMDMgU2VwdGVtYmVyIDIwMTkgMTc6MTQKPiA+ID4gPiA+IFRv
OiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiA+ID4gPiA+IENjOiBSb2dlciBQYXUg
TW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNp
dHJpeC5jb20+OyBXZWkgTGl1Cj4gPiA+ID4gPiA8d2xAeGVuLm9yZz47IEFuZHJldyBDb29wZXIg
PEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwCj4gPEdlb3JnZS5EdW5s
YXBAY2l0cml4LmNvbT47Cj4gPiA+IEphbgo+ID4gPiA+ID4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgS29ucmFkIFJ6ZXN6
dXRlayBXaWxrCj4gPiA+ID4gPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFRpbSAoWGVuLm9yZykKPiA+ID4gPHRp
bUB4ZW4ub3JnPjsKPiA+ID4gPiA+IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5j
b20+Cj4gPiA+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMDkvMTFdIHZwY2k6IHJlZ2lzdGVyIGFz
IGFuIGludGVybmFsIGlvcmVxIHNlcnZlcgo+ID4gPiA+ID4gQEAgLTQ3OCw2ICs0ODAsNjcgQEAg
dm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywgdW5zaWdu
ZWQgaW50IHNpemUsCj4gPiA+ID4gPiAgICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpLT5sb2Nr
KTsKPiA+ID4gPiA+ICB9Cj4gPiA+ID4gPgo+ID4gPiA+ID4gKyNpZmRlZiBfX1hFTl9fCj4gPiA+
ID4gPiArc3RhdGljIGludCBpb3JlcV9oYW5kbGVyKHN0cnVjdCB2Y3B1ICp2LCBpb3JlcV90ICpy
ZXEsIHZvaWQgKmRhdGEpCj4gPiA+ID4gPiArewo+ID4gPiA+ID4gKyAgICBwY2lfc2JkZl90IHNi
ZGY7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgIGlmICggcmVxLT50eXBlID09IElPUkVRX1RZ
UEVfSU5WQUxJREFURSApCj4gPiA+ID4gPiArICAgICAgICAvKgo+ID4gPiA+ID4gKyAgICAgICAg
ICogSWdub3JlIGludmFsaWRhdGUgcmVxdWVzdHMsIHRob3NlIGNhbiBiZSByZWNlaXZlZCBldmVu
IHdpdGhvdXQKPiA+ID4gPiA+ICsgICAgICAgICAqIGhhdmluZyBhbnkgbWVtb3J5IHJhbmdlcyBy
ZWdpc3RlcmVkLCBzZWUgc2VuZF9pbnZhbGlkYXRlX3JlcS4KPiA+ID4gPiA+ICsgICAgICAgICAq
Lwo+ID4gPiA+ID4gKyAgICAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKPiA+ID4gPgo+ID4gPiA+
IEluIGdlbmVyYWwsIEkgd29uZGVyIHdoZXRoZXIgaW50ZXJuYWwgc2VydmVycyB3aWxsIGV2ZXIg
bmVlZCB0byBkZWFsIHdpdGggaW52YWxpZGF0ZT8gVGhlIGNvZGUKPiBvbmx5Cj4gPiA+IGV4aXN0
cyB0byBnZXQgUUVNVSB0byBkcm9wIGl0cyBtYXAgY2FjaGUgYWZ0ZXIgYSBkZWNyZWFzZV9yZXNl
cnZhdGlvbiBzbyB0aGF0IHRoZSBwYWdlIHJlZnMgZ2V0Cj4gPiA+IGRyb3BwZWQuCj4gPiA+Cj4g
PiA+IEkgdGhpbmsgdGhlIGJlc3Qgc29sdXRpb24gaGVyZSBpcyB0byByZW5hbWUgaHZtX2Jyb2Fk
Y2FzdF9pb3JlcSB0bwo+ID4gPiBodm1fYnJvYWRjYXN0X2lvcmVxX2V4dGVybmFsIGFuZCBzd2l0
Y2ggaXQncyBjYWxsZXJzLiBCb3RoCj4gPiA+IHNlbmRfdGltZW9mZnNldF9yZXEgYW5kIHNlbmRf
aW52YWxpZGF0ZV9yZXEgc2VlbSBvbmx5IHJlbGV2YW50IHRvCj4gPiA+IGV4dGVybmFsIGlvcmVx
IHNlcnZlcnMuCj4gPgo+ID4gc2VuZF90aW1lb2Zmc2V0X3JlcSgpIGlzIHJlbGljIHdoaWNoIG91
Z2h0IHRvIGJlIHJlcGxhY2VkIHdpdGggYW5vdGhlciBtZWNoYW5pc20gSU1PLi4uCj4gPgo+ID4g
V2hlbiBhbiBIVk0gZ3Vlc3Qgd3JpdGVzIGl0cyBSVEMsIGEgbmV3ICd0aW1lb2Zmc2V0JyB2YWx1
ZSAob2Zmc2V0IG9mIFJUQyBmcm9tIGhvc3QgdGltZSkgaXMKPiBjYWxjdWxhdGVkIChhbHNvIGFw
cGxpZWQgdG8gdGhlIFBWIHdhbGxjbG9jaykgYW5kIGFkdmVydGlzZWQgdmlhIHRoaXMgaW9yZXEu
IEluIFhlblNlcnZlciwgdGhpcyBpcwo+IHBpY2tlZCB1cCBieSBRRU1VLCBmb3J3YXJkZWQgdmlh
IFFNUCB0byBYQVBJIGFuZCB0aGVuIHdyaXR0ZW4gaW50byB0aGUgVk0gbWV0YS1kYXRhICh3aGlj
aCB0aGFuIGNhdXNlcwo+IGl0IHRvIGJlIHdyaXR0ZW4gaW50byB4ZW5zdG9yZSB0b28pLiBBbGwg
dGhpcyBpcyBzbyB0aGF0IHRoYXQgZ3Vlc3QncyBSVEMgY2FuIGJlIHNldCBjb3JyZWN0bHkgd2hl
biBpdAo+IGlzIHJlYm9vdGVkLi4uIFRoZXJlIGhhcyB0byBiZSBhIGJldHRlciB3YXkgKGUuZy4g
ZXh0cmFjdGluZyBSVEMgdmlhIGh2bSBjb250ZXh0IGFuZCBzYXZpbmcgaXQgYmVmb3JlCj4gY2xl
YW5pbmcgdXAgdGhlIGRvbWFpbikuCj4gPgo+ID4gc2VuZF9pbnZhbGlkYXRlX3JlcSgpIGlzIHJl
bGV2YW50IGZvciBhbnkgZW11bGF0b3IgbWFpbnRhaW5pbmcgYSBjYWNoZSBvZiBndWVzdC0+aG9z
dCBtZW1vcnkKPiBtYXBwaW5ncyB3aGljaCwgSSBndWVzcywgY291bGQgaW5jbHVkZSBpbnRlcm5h
bCBlbXVsYXRvcnMgZXZlbiBpZiB0aGlzIGlzIG5vdCB0aGUgY2FzZSBhdCB0aGUgbW9tZW50Lgo+
IAo+IE1heWJlLCBidXQgSSB3b3VsZCBleHBlY3QgYW4gaW50ZXJuYWwgZW11bGF0b3IgdG8gZ2V0
IGEgcmVmZXJlbmNlIG9uCj4gdGhlIGdmbiBpZiBpdCBkb2VzIG5lZWQgdG8ga2VlcCBpdCBpbiBz
b21lIGtpbmQgb2YgY2FjaGUsIG9yIGVsc2UgSQo+IGRvbid0IHRoaW5rIGNvZGUgaW4gdGhlIGh5
cGVydmlzb3Igc2hvdWxkIGJlIGtlZXBpbmcgc3VjaCByZWZlcmVuY2VzLgoKT2ggaW5kZWVkLCBi
dXQgdGhhdCdzIG5vdCB0aGUgaXNzdWUuIFRoZSBpc3N1ZSBpcyB3aGVuIHRvIGRyb3AgdGhvc2Ug
cmVmcy4uLiBJZiB0aGUgZ3Vlc3QgZG9lcyBhIGRlY3JlYXNlX3Jlc2VydmF0aW9uIG9uIGEgZ2Zu
IGNhY2hlZCBieSB0aGUgZW11bGF0b3IgdGhlbiB0aGUgZW11bGF0b3IgbmVlZHMgdG8gZHJvcCBp
dHMgcmVmIHRvIGFsbG93IHRoZSBwYWdlIHRvIGJlIGZyZWVkLgoKICBQYXVsCgo+IElNTyBJIHdv
dWxkIHN0YXJ0IGJ5IG5vdCBmb3J3YXJkaW5nIGludmFsaWRhdGUgcmVxdWVzdHMgdG8gaW50ZXJu
YWwKPiBlbXVsYXRvcnMuIFdlIGNhbiBhbHdheXMgY2hhbmdlIHRoaXMgaW4gdGhlIGZ1dHVyZSBp
ZiB3ZSBjb21lIHVwIHdpdGgKPiBhIHVzZS1jYXNlcyB0aGF0IG5lZWRzIGl0Lgo+IAo+IFRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
