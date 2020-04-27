Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3111BAA0F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 18:26:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT6Zz-0004Cl-I8; Mon, 27 Apr 2020 16:25:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTJa=6L=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jT6Zy-0004Cf-Gu
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 16:25:58 +0000
X-Inumbo-ID: c5ef3bf6-88a3-11ea-ae69-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5ef3bf6-88a3-11ea-ae69-bc764e2007e4;
 Mon, 27 Apr 2020 16:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588004757;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AaJel5qhef3WV4a7x6x4j2jvv6bUS3ZyIdHAUH1Bhds=;
 b=S0IiEuEIIXsntHtIXLBezzLRSwAw2wFEIORNbKvNWEJ0WcNLeiXto6/Q
 YYBovKqbPxKWBc+R8sgzUcGU1jTALKNrKU8Y6Sth1r5ETKorgShPVhHT1
 il/8JunVMvYVZ0y5IJllJIhFO9V5OmOXLECrYL7TB250J8of4nlMU+JOr A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qcUmMNUDSUxqpZoOPp4vszVcTszMM3sTpXQZ5BUEBKFF/Ad0juXEiUDxQkcG46IoHzEhtMnBIk
 4LocM6UEZAIjI6gyPoJki7ndUbOTjcm+sv1QsxXNUDf6rTqFWZquk+lU6u2SpEmHpnltvQT1Wf
 HKJy19HiUdElHQOgCfO1VFiL2JTI8yzMkeWU59W7a/aUaFrJpMJMUESBb/tArUluOzxqSi2LwU
 xR4wAFu8dNAlu8Vs33roilvk82xmgBsQAJHjI5xsNW7jZ0AtPWmpSAihCEkFgEpUCdFsiffMfQ
 g/g=
X-SBRS: 2.7
X-MesageID: 17002825
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="17002825"
From: George Dunlap <George.Dunlap@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v7 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
Thread-Topic: [PATCH v7 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
Thread-Index: AQHWCQXiBGUb+wr760WOfoEenUG4zahnVWoAgAALjICAAAX/gIAAAzMAgASARQCAITZdgIAADK2A
Date: Mon, 27 Apr 2020 16:25:53 +0000
Message-ID: <085E1F72-EC22-43D6-8F7E-EDC132CC787D@citrix.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-9-jgross@suse.com>
 <19f84540-6b49-f99d-805a-e07f56330f31@suse.com>
 <b9ddd1fb-d868-bb69-3b6b-27531beda2fa@suse.com>
 <f7d1f3aa-3a7e-fcb2-3163-5e67756e8452@suse.com>
 <17d65095-a51e-2e00-38ee-7c1c83d2bb99@suse.com>
 <51e0f0d2-f9ce-83fd-79fa-ae4805356612@suse.com>
 <31c7f4fe-847c-96f5-e598-dba99b0bb61a@suse.com>
In-Reply-To: <31c7f4fe-847c-96f5-e598-dba99b0bb61a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FA018FB7608324CA306BCC9EAAD71C2@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDI3LCAyMDIwLCBhdCA0OjQwIFBNLCBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gU3RlZmFubywNCj4gDQo+IE9uIDA2LjA0LjIwIDE0OjI5
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDAzLjA0LjIwMjAgMTc6NDUsIErDvHJnZW4gR3Jv
w58gd3JvdGU6DQo+Pj4gT24gMDMuMDQuMjAgMTc6MzMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+
PiBPbiAwMy4wNC4yMDIwIDE3OjEyLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4+Pj4gT24gMDMu
MDQuMjAgMTY6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+IE9uIDAyLjA0LjIwMjAgMTc6
NDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+Pj4+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZp
Zw0KPj4+Pj4+PiArKysgYi94ZW4vY29tbW9uL0tjb25maWcNCj4+Pj4+Pj4gQEAgLTM1Myw2ICsz
NTMsMTYgQEAgY29uZmlnIERPTTBfTUVNDQo+Pj4+Pj4+ICAgICAgICAgICAgTGVhdmUgZW1wdHkg
aWYgeW91IGFyZSBub3Qgc3VyZSB3aGF0IHRvIHNwZWNpZnkuDQo+Pj4+Pj4+ICAgICtjb25maWcg
SFlQRlNfQ09ORklHDQo+Pj4+Pj4+ICsgICAgYm9vbCAiUHJvdmlkZSBoeXBlcnZpc29yIC5jb25m
aWcgdmlhIGh5cGZzIGVudHJ5Ig0KPj4+Pj4+PiArICAgIGRlZmF1bHQgeQ0KPj4+Pj4+IA0KPj4+
Pj4+IE15IGluaXRpYWwgcmVhY3Rpb24gd2FzIHRvIGFzayBmb3IgImRlcGVuZHMgb24gSFlQRlMi
LCBidXQgdGhlbg0KPj4+Pj4+IEkgbm90aWNlZCB0aGUgZWFybGllciBwYXRjaCBkb2Vzbid0IGlu
dHJvZHVjZSBzdWNoLiBBbSBJDQo+Pj4+Pj4gbWlzLXJlbWVtYmVyaW5nIHRoYXQgaXQgd2FzIGFn
cmVlZCB0byBtYWtlIHRoZSB3aG9sZSB0aGluZw0KPj4+Pj4+IHBvc3NpYmxlIHRvIGRpc2FibGUg
YXQgbGVhc3QgaW4gRVhQRVJUIG1vZGU/DQo+Pj4+PiANCj4+Pj4+IE5vLCBJIGRvbid0IHJlbWVt
YmVyIHRoYXQgYWdyZWVtZW50Lg0KPj4+Pj4gDQo+Pj4+PiBBbmQgVEJIIEknbSBub3Qgc3VyZSB0
aGlzIGlzIGEgZ29vZCBpZGVhLCBhcyB0aGF0IHdvdWxkIGF0IG9uY2UgbWFrZSB0aGUNCj4+Pj4+
IHBsYW4gdG8gcmVwbGFjZSBhdCBsZWFzdCBzb21lIHN5c2N0bCBhbmQvb3IgZG9tY3RsIGludGVy
ZmFjZXMgaW1wb3NzaWJsZQ0KPj4+Pj4gKGxpa2UgZS5nLiB0aGUgbGFzdCAzIHBhdGNoZXMgb2Yg
dGhlIHNlcmllcyBhcmUgZG9pbmcgYWxyZWFkeSksIG9yIGF0DQo+Pj4+PiBsZWFzdCB3b3VsZCB0
aWUgdGhlIHJlbGF0ZWQgZnVuY3Rpb25hbGl0eSB0byBDT05GSUdfSFlQRlMuDQo+Pj4+IA0KPj4+
PiBJIHRoaW5rIHRoYXQgd291bGQgYmUgZmluZSAtIHRoYXQncyB3aGF0IGNvbmZpZyBzZXR0aW5n
IGFyZSBmb3IuDQo+Pj4+IFNvbWVvbmUgY2FyaW5nIGFib3V0IHNwYWNlIG1heSBub3QgY2FyZSBh
Ym91dCBydW50aW1lIHNldHRpbmcgb2YNCj4+Pj4gcGFyYW1ldGVycy4NCj4+PiANCj4+PiBTbyBy
aWdodCBub3cgaXQgd291bGQgc3RhcnQgd2l0aCBhIHBsYWluIGh5cGZzIGF2YWlsYWJsZSBvciBu
b3QuDQo+Pj4gDQo+Pj4gVGhlIG5leHQgc3RlcCB3b3VsZCBiZSBpbiBwYXRjaCAxMiB0byB0ZWxs
IHRoZSB1c2VyIGhlIHdpbGwgbG9zZSB0aGUNCj4+PiBjYXBhYmlsaXR5IG9mIHNldHRpbmcgcnVu
dGltZSBwYXJhbWV0ZXJzLg0KPj4+IA0KPj4+IEFub3RoZXIgcGxhbm5lZCBleHRlbnNpb24gd291
bGQgYmUgdG8gY29udHJvbCBwZXItY3B1cG9vbCBzZXR0aW5ncywNCj4+PiB3aGljaCB3b3VsZCB0
aGUgZ28gYXdheSAocG9zc2libHkgZnVuY3Rpb25hbGl0eSBiZWluZyB1bmNvbmRpdGlvbmFsbHkN
Cj4+PiBhdmFpbGFibGUgdG9kYXkpLg0KPj4+IA0KPj4+IE5leHQgd291bGQgYmUgdGhlIGxhY2sg
b2YgYmVpbmcgYWJsZSB0byBjb250cm9sIHBlci1kb21haW4gbWl0aWdhdGlvbnMNCj4+PiBsaWtl
IFhQVEkgb3IgTDFURiwgd2hpY2ggSSdkIGxpa2UgdG8gYWRkLg0KPj4+IA0KPj4+IEFub3RoZXIg
dGhpbmcgSSB3YW50ZWQgdG8gYWRkIGlzIHNvbWUgZGVidWdnaW5nIHN0dWZmIChlLmcuIHRvIHN3
aXRjaA0KPj4+IGxvY2sgcHJvZmlsaW5nIHVzaW5nIGh5cGZzKS4NCj4+PiANCj4+PiBBbmQgdGhl
IGxpc3Qgd2lsbCBnbyBvbi4NCj4+IFVuZGVyc3Rvb2QuDQo+Pj4gRG9lcyBpdCByZWFsbHkgbWFr
ZSBzZW5zZSB0byBtYWtlIGEgY2VudHJhbCBjb250cm9sIGFuZCBpbmZvcm1hdGlvbg0KPj4+IGlu
dGVyZmFjZSBjb25kaXRpb25hbD8NCj4+IE5vbmUgb2YgdGhlIGFib3ZlIG1heSBiZSBvZiBpbnRl
cmVzdCB0byBlLmcuIGVtYmVkZGVkIHVzZSBjYXNlcy4NCj4+PiBJJ2QgbGlrZSBhdCBsZWFzdCBh
IHNlY29uZCBvcGluaW9uIG9uIHRoYXQgdG9waWMuDQo+PiBZZXMsIGZ1cnRoZXIgb3BpbmlvbnMg
d291bGQgc3VyZWx5IGhlbHAuDQo+IA0KPiBBbnkgb3BpbmlvbiBvbiBtYWtpbmcgaHlwZnMgY29u
ZmlndXJhYmxlPw0KPiANCj4gSXQgd291bGQgYmUgcXVpdGUgc29tZSBjb2RlIGNodXJuIGFuZCBJ
IHdhbnQgdG8gYXZvaWQgaXQgaW4gY2FzZSB5b3UNCj4gc2VlIG5vIGJlbmVmaXQgaW4gY29uZmln
dXJpbmcgaXQgb3V0IGZvciBlbWJlZGRlZC4NCg0KSnVzdCB0byByZXBseSB3aXRoIHdoYXQgSSBz
YWlkIG9uIElSQzoNCg0KRmlyc3Qgb2YgYWxsLCBpZiBpdCB3ZXJlIGZyZWUsIEkgdGhpbmsgdGhh
dCBoYXZpbmcgQ09ORklHX0hZUEZTIHdvdWxkIGJlIHZhbHVhYmxlLiAgU3ViLW9wdGlvbnMgc2hv
dWxkIGJlIG1hZGUgYXZhaWxhYmxlIG9uIGEgY2FzZS1ieS1jYXNlIGJhc2lzOyBJIHRoaW5rIENP
TkZJR19IWVBGU19DT05GSUcgd291bGQgYmUgdmFsdWFibGUsIGJ1dCBJIGRvbuKAmXQgc2VlIGFu
eSBwb2ludCBpbiBoYXZpbmcgQ09ORklHX0hZUEZTX1JVTlRJTUVfUEFSQU1FVEVSLg0KDQpIb3dl
dmVyLCAgSnVlcmdlbiBzZWVtcyB0byB0aGluayBpdCB3b3VsZCByZXF1aXJlIGEgbG90IG9mIGNo
dXJuIHRvIHRoZSBjdXJyZW50IHNlcmllcy4gIEkgZG9u4oCZdCBxdWl0ZSB1bmRlcnN0YW5kIHdo
eTsgYnV0IHN1cHBvc2luZyB0aGF04oCZcyBzbzogSW4gZ2VuZXJhbCwgdGhlIHBlb3BsZSB3aG8g
d2FudCBhIGZlYXR1cmUgc2hvdWxkIGJlIHRoZSBvbmVzIHdobyBkbyB0aGUgd29yayB0byBtYWtl
IGl0LiAgSSB0aGluayBpdCB3b3VsZCBiZSBwZXJmZWN0bHkgcmVhc29uYWJsZSBmb3IgSnVlcmdl
biB0byBzYXksIOKAnFRoaXMgaXMgYSBsb3Qgb2Ygd29yayB0aGF0IEkgZG9u4oCZdCBoYXZlIHRp
bWUgdG8gZG8gYmVmb3JlIHRoZSA0LjE0IHJlbGVhc2U7IGlmIHBlb3BsZSB3YW50IHRvIGJlIGFi
bGUgdG8gZGlzYWJsZSB0aGlzIGZlYXR1cmUsIHRoZXkgY2FuIHBvc3QgdGhlaXIgb3duIHBhdGNo
ZXMu4oCdICAoSXTigJlzIGFsc28gcGVyZmVjdGx5IHJlYXNvbmFibGUgZm9yIGhpbSB0byBkbyB0
aGUgd29yayBoaW1zZWxmIGp1c3QgdG8gYmUgaGVscGZ1bC4pDQoNClRoZSBkaXNjdXNzaW9uIGFi
b3V0IENPTkZJR19FWFBFUlQgaXMgc29ydCBvZiB0aGUgc2FtZS4gIElmIHdlIGhhdmUgQ09ORklH
X0hZUEZTLCBpdCB3b3VsZCBvYnZpb3VzbHkgYmUgbW9yZSB2YWx1YWJsZSBpZiBpdCB3ZXJlICpu
b3QqIGluIENPTkZJR19FWFBFUlQsIHNvIHRoYXQgcGVvcGxlIGNvdWxkIGNoYW5nZSBpdCB3aGls
ZSBzdGlsbCBiZWluZyBzZWN1cml0eSBzdXBwb3J0ZWQuDQoNCklmIEphbiBpcyBPSyB3aXRoIGl0
IHNpbXBseSBiZWluZyBvdXRzaWRlIENPTkZJR19FWFBFUlQsIHRoZW4gZ3JlYXQuICBCdXQgaWYg
aGUgaW5zaXN0cyBvbiBzb21lIGtpbmQgb2YgdGVzdGluZyBmb3IgaXQgdG8gYmUgb3V0c2lkZSBv
ZiBDT05GSUdfRVhQRVJULCB0aGVuIGFnYWluLCB0aGUgcGVvcGxlIHdobyB3YW50IGl0IHRvIGJl
IHNlY3VyaXR5IHN1cHBvcnRlZCBzaG91bGQgYmUgdGhlIG9uZXMgd2hvIGRvIHRoZSB3b3JrIHRv
IG1ha2UgaXQgaGFwcGVuLg0KDQpIb3BlIHRoYXQgbWFrZXMgc2Vuc2UuIDotKQ0KDQogLUdlb3Jn
ZQ==

