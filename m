Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED256FF1A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 13:58:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpWtN-0000qx-Fk; Mon, 22 Jul 2019 11:54:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+VRc=VT=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hpWtM-0000qr-4I
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 11:54:08 +0000
X-Inumbo-ID: 668eebb0-ac77-11e9-bd87-bf2012a841c4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 668eebb0-ac77-11e9-bd87-bf2012a841c4;
 Mon, 22 Jul 2019 11:54:03 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Cu+aY+l3dRdqoyy0iJOXbxW45ugj7hZ7NIdyGVgdcns+pjE+f1mZvXer69RlM6abrFWxFF6hAE
 YXY/MS31512LFNVvCUautKXST/K4XgZ7GlQ36Q6O67LabM+f8yMrDVnUGqOPIxnNxKJEWSymOs
 Jnkp8LL/XmQBxwFHIlfVI0Rv+o9ejftkpDJEWZkaz+F7iQjVO09/EXqzhjqlTgf7/Bx11YYJIp
 y9Sbh9Tx7n98J0MWmAvoPn8zqAL9MWESygIGdoyuzC8EcRaPS3m24nLbx1Dflm7SailSWt7rsI
 nwI=
X-SBRS: 2.7
X-MesageID: 3371376
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,294,1559534400"; 
   d="scan'208";a="3371376"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, 'Roman Shaposhnik'
 <roman@zededa.com>
Thread-Topic: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
Thread-Index: AQHVPmzkQranvSB3QkuFJWZsoolqxKbWTmUwgAAaH4CAACIW8A==
Date: Mon, 22 Jul 2019 11:54:00 +0000
Message-ID: <9238bf1a297c42f38dccc1cfb50bd144@AMSPEX02CL03.citrite.net>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <CAMmSBy8CcG08-+-F6fvwmH1oEKpsV8OGEco94g04dZcyyFWKbw@mail.gmail.com>
 <b2e4ed0b178e41ebbc8f1db622ecae95@AMSPEX02CL03.citrite.net>
 <20190722114859.dtm4w5ff75uedu24@Air-de-Roger>
In-Reply-To: <20190722114859.dtm4w5ff75uedu24@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMjIgSnVseSAyMDE5IDEyOjQ5Cj4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyAnUm9tYW4gU2hhcG9zaG5paycgPHJv
bWFuQHplZGVkYS5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgamdy
b3NzQHN1c2UuY29tOyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsK
PiBib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbTsgamJldWxpY2hAc3VzZS5jb20KPiBTdWJqZWN0
OiBSZTogW1hlbi1kZXZlbF0gW0JVR10gQWZ0ZXIgdXBncmFkZSB0byBYZW4gNC4xMi4wIGlvbW11
PW5vLWlnZngKPiAKPiBPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAwODoyMDozNkFNICswMDAwLCBQ
YXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBb
c25pcF0KPiA+ID4gPiAoWEVOKSBEb21haW4gaGVhcCBpbml0aWFsaXNlZAo+ID4gPiA+IChYRU4p
IEFDUEk6IDMyLzY0WCBGQUNTIGFkZHJlc3MgbWlzbWF0Y2ggaW4gRkFEVCAtCj4gPiA+ID4gOGNl
OGVmODAvMDAwMDAwMDAwMDAwMDAwMCwgdXNpbmcgMzIKPiA+ID4gPiAoWEVOKSBJT0FQSUNbMF06
IGFwaWNfaWQgMiwgdmVyc2lvbiAzMiwgYWRkcmVzcyAweGZlYzAwMDAwLCBHU0kgMC0xMTkKPiA+
ID4gPiAoWEVOKSBFbmFibGluZyBBUElDIG1vZGU6ICBGbGF0LiAgVXNpbmcgMSBJL08gQVBJQ3MK
PiA+ID4gPiAoWEVOKSBbVlQtRF0gIFJNUlIgYWRkcmVzcyByYW5nZSA4ZDgwMDAwMC4uOGZmZmZm
ZmYgbm90IGluIHJlc2VydmVkCj4gPiA+ID4gbWVtb3J5OyBuZWVkICJpb21tdV9pbmNsdXNpdmVf
bWFwcGluZz0xIj8KPiA+Cj4gPiBUaGlzIGlzIHlvdXIgcHJvYmxlbS4gSW4gdmVyc2lvbnMgcHJp
b3IgdG8gNC4xMSAoSSB0aGluaywgYW5kIGNlcnRhaW5seSA0LjEyKQo+IGlvbW11X2luY2x1c2l2
ZV9tYXBwaW5nIHVzZWQgdG8gZGVmYXVsdCBvbiwgd2hlcmVhcyBub3cgaXQgYXBwZWFycyB0byBk
ZWZhdWx0IG9mZi4gSW4gbW9zdAo+IGNpcmN1bXN0YW5jZXMgdGhpcyBpcyBmaW5lIGJlY2F1c2Ug
dGhlcmUgaXMgYSBuZXcgZmxhZywgaW9tbXVfaHdkb21fcmVzZXJ2ZWQsIHdoaWNoIGRlZmF1bHRz
IG9uIGFuZAo+IHRoaXMgbWFrZXMgc3VyZSB0aGF0IGFsbCBlODIwIHJlc2VydmVkIHJlZ2lvbnMg
YXJlIGlkZW50aXR5IG1hcHBlZCAod2hpY2ggdXN1YWxseSBjb3ZlcnMgdW5kZWNsYXJlZAo+IFJN
UlJzKS4gWW91IGhhdmUgdGhlIG9wcG9zaXRlIHByb2JsZW0uLi4gYSBkZWNsYXJlZCBSTVJSIHdo
aWNoIGlzIG5vdCByZXNlcnZlZCwgc28geW91IHdpbGwgbmVlZAo+IGlvbW11X2luY2x1c2l2ZV9t
YXBwaW5nLgo+IAo+IEkgdGhpbmsgdGhlcmUncyBhIGJ1ZyBpbiB0aGUgaW5pdGlhbGl6YXRpb24g
b2YgaW9tbXUgZm9yIGEgUFYgZG9tMCwKPiB3aGljaCBsZWF2ZXMgZG9tMCB3aXRob3V0IHJtcnIg
ZW50cmllcy4gQ2FuIHlvdSB0cnkgdGhlIHBhdGNoIGJlbG93Cj4gYW5kIHJlcG9ydCB3aGV0aGVy
IGl0IHNvbHZlcyB5b3VyIGlzc3VlPwo+IAo+IFRoYW5rcywgUm9nZXIuCj4gLS0tODwtLS0KPiBk
aWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2lvbW11LmMKPiBpbmRleCA3OWVjNjcxOWY1Li45ZDkxZjBkNjMzIDEwMDY0
NAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiArKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gQEAgLTE4NSw3ICsxODUsNyBAQCB2b2lkIF9faHdk
b21faW5pdCBpb21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21haW4gKmQpCj4gICAgICByZWdpc3Rl
cl9rZXloYW5kbGVyKCdvJywgJmlvbW11X2R1bXBfcDJtX3RhYmxlLCAiZHVtcCBpb21tdSBwMm0g
dGFibGUiLCAwKTsKPiAKPiAgICAgIGhkLT5zdGF0dXMgPSBJT01NVV9TVEFUVVNfaW5pdGlhbGl6
aW5nOwo+IC0gICAgaGQtPm5lZWRfc3luYyA9IGlvbW11X2h3ZG9tX3N0cmljdCAmJiAhaW9tbXVf
dXNlX2hhcF9wdChkKTsKPiArICAgIGhkLT5uZWVkX3N5bmMgPSAhaW9tbXVfdXNlX2hhcF9wdChk
KTsKCkJ1dCB0aGlzIGlzIGdvaW5nIHRvIG1lYW4gdGhlIGlmKCkgYmVsb3cgaXMgdHJ1ZSBmb3Ig
bm9uLXN0cmljdCBkb20wLCB3aGljaCBtZWFucyBpdCBwb2ludGxlc3NseSBtYXBzIHRoZSBkb20w
IHBhZ2UgbGlzdCB3aGVuIGh3ZG9tX2lvbW11X21hcCgpIHNob3VsZCBoYXZlIGFscmVhZHkgbWFw
cGVkIGFsbCBjb252ZW50aW9uYWwgUkFNLgoKICBQYXVsCgo+ICAgICAgaWYgKCBuZWVkX2lvbW11
X3B0X3N5bmMoZCkgKQo+ICAgICAgewo+ICAgICAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
