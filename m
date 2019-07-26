Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4272976B9F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:29:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1BT-0003j8-Fx; Fri, 26 Jul 2019 14:26:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PDV5=VX=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hr1BS-0003j2-3B
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:26:58 +0000
X-Inumbo-ID: 6ba28581-afb1-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6ba28581-afb1-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:26:56 +0000 (UTC)
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
IronPort-SDR: fv4H0/qBV7MzjKUxfNAtpp1bA87gcI/hUJcGN9nsrj0nGnWp8a+VE4mwUQLsn27Zp2LQ7ACeJ1
 Ch9sZs3nxV/gxn9ulD5UIqJYQP8ARAOjuryymxKMONboFDBZQ9V5AueH7x6yad75IDPgxXTwON
 isGFKT06w29IscS0UNtNM/D3eLfaKrgsloopIzIfVE7L4L4WPpd2RrirNx92rvDW3YRVQ9JJ4e
 VocIq6hO+pTwt/QhEa1iNBq/b8jKLinQtDvEfDhdbV5e9ykZM/UhFHBOM5rjV5NLN8slJXoyzM
 lTc=
X-SBRS: 2.7
X-MesageID: 3516984
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,311,1559534400"; 
   d="scan'208";a="3516984"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [Xen-devel] per-domain passthrough/iommu options
Thread-Index: AdVDqy2gdS3slVvQRuCN/iB10JmJ2gABnjsAAAD6vMAAAUXLgAAASpcA
Date: Fri, 26 Jul 2019 14:26:53 +0000
Message-ID: <fa7e8a34bedc43de8a62d8a8480d171e@AMSPEX02CL03.citrite.net>
References: <a65d176f8912458c8576367597613de9@AMSPEX02CL03.citrite.net>
 <8fff2485-bf0a-5b98-dfbc-4679c39b9ed0@suse.com>
 <3cd2057e69bc4bdbb87f53c97ffe765c@AMSPEX02CL03.citrite.net>
 <82fc3e28-353a-44fb-0d6b-ec2913610c2f@suse.com>
In-Reply-To: <82fc3e28-353a-44fb-0d6b-ec2913610c2f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] per-domain passthrough/iommu options
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
Cc: "xen-devel \(xen-devel@lists.xenproject.org\)"
 <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI2IEp1bHkgMjAxOSAxNTowMg0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbCAoeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnKSA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPg0K
PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gcGVyLWRvbWFpbiBwYXNzdGhyb3VnaC9pb21tdSBv
cHRpb25zDQo+IA0KPiBPbiAyNi4wNy4yMDE5IDE1OjM5LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
ID4gTm90IHN1cmUgaG93ICdvbicgd291bGQgY28tZXhpc3Qgd2l0aCAndmlvbW11Jy4uLiB0aGUg
Y3J1Y2lhbCBkaWZmZXJlbmNlIGlzIHdoZXRoZXIgdGhlIHAybSBpcw0KPiBzaGFyZWQgb3Igbm90
IGFuZCB0aGUgY3VycmVudGx5IHRoZSBvbmx5IG9wdGlvbiBpbiB0aGUgbm9uLXNoYXJlZCBjYXNl
LCBiZWNhdXNlIHdlIGxhY2sgYSB2aW9tbXUsIGlzDQo+IHRvIGtlZXAgdGhlIElPTU1VIG1hcHBp
bmdzIGluIHN5bmMgd2l0aCB0aGUgUDJNIHdoZW5ldmVyIHRoZSBsYXR0ZXIgaXMgdXBkYXRlZC4g
U28sIGhvdyBhYm91dDoNCj4gPg0KPiA+IHBhc3N0aHJvdWdoID0gb2ZmfHN5bmMtcHR8c2hhcmUt
cHR8dmlvbW11DQo+ID4NCj4gPiA/IEkgZG9uJ3QgdGhpbmsgJ3ByaXZhdGUtcHQnIG9yICdzZXBh
cmF0ZS1wdCcgcmVhbGx5IGNhcHR1cmUgdGhlIGZhY3QgdGhhdCB0aGUgcGFnZSB0YWJsZXMgbWF0
Y2ggdGhlDQo+IFAyTS4gVGhleSBjb3VsZCBqdXN0IGFzIGVhc2lseSBiZSB0YWtlbiB0byBtZWFu
IHRoYXQgdGhleSBhcmUgcG9wdWxhdGVkIHVzaW5nIHNvbWUgb3RoZXIgcG9saWN5Lg0KPiANCj4g
QnV0IGhhdmVuJ3Qgd2UgcmVjZW50bHkgc2VlbiB0aGF0IHRoaXMgZnVsbHkgbG9jay1zdGVwIHBv
cHVsYXRpb24NCj4gb2YgcGFnZSB0YWJsZXMgaXNuJ3QgYWx3YXlzIGNvcnJlY3QgKG9yIGF0IGxl
YXN0IGRlc2lyYWJsZSk/IEkNCj4gdmFndWVseSByZWNhbGwgb3RoZXIgY29tbWVudHMgdG8gdGhh
dCBlZmZlY3QgdG9vLCBmcm9tIGxvbmcgYWdvLg0KPiBJJ2Qgc3BlY2lmaWNhbGx5IHdhbnQgdG8g
YXZvaWQgZW5jb2RpbmcgaW50byB0aGUgaW50ZXJmYWNlIGhlcmUNCj4gdGhhdCB0aGUgdHdvIGFy
ZSBleGFjdCBtaXJyb3JzIG9mIG9uZSBhbm90aGVyLCBub3cgYW5kIGZvcmV2ZXIuDQoNCkhvdyBk
byB5b3UgdGhpbmsgd2Ugc2hvdWxkIGV4cHJlc3MgaXQuIEkgYWdyZWUgdGhhdCBpdCdzIGEgYml0
IGF3a3dhcmQgYmVjYXVzZSBvZiB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIEhWTSBhbmQgUFYgZG9t
YWlucywgYnV0IGFsbCB3ZSBjYW4gZG8gdGhlcmUgcmVhbGx5IGlzIGRvY3VtZW50IGl0IEkgdGhp
bmssIHNvIHBlcmhhcHMgdGhlIG1hbnBhZ2UgY291bGQgaGF2ZSBzb21ldGhpbmcgbGlrZToNCg0K
J29mZicNCg0KSU9NTVUgbWFwcGluZ3MgYXJlIGRpc2FibGVkIGZvciB0aGUgZG9tYWluIGFuZCBz
byBoYXJkd2FyZSBtYXkgbm90IGJlIHBhc3NlZCB0aHJvdWdoLg0KDQonc3luYy1wdCcNCg0KRm9y
IGEgUFYgZG9tYWluLCBhbGwgd3JpdGFibGUgcGFnZXMgYXNzaWduZWQgdG8gdGhlIGRvbWFpbiBh
cmUgaWRlbnRpdHkgbWFwcGVkIGJ5IE1GTiBpbiB0aGUgSU9NTVUgcGFnZSB0YWJsZXMuIFRodXMg
YSBkZXZpY2UgZHJpdmVyIHJ1bm5pbmcgaW4gdGhlIGRvbWFpbiBtYXkgcHJvZ3JhbSBwYXNzdGhy
b3VnaCBoYXJkd2FyZSBmb3IgRE1BIHVzaW5nIE1GTiB2YWx1ZXMgKGkuZS4gaG9zdC9tYWNoaW5l
IGZyYW1lIG51bWJlcnMpIGxvb2tlZCB1cCBpbiBpdHMgUDJNLg0KRm9yIGFuIEhWTSBkb21haW4s
IGFsbCBub24tZm9yZWlnbiBSQU0gcGFnZXMgcHJlc2VudCBpbiB0aGUgUDJNIHdpbGwgYmUgaWRl
bnRpdHkgbWFwcGVkIGJ5IEdGTiBpbiB0aGUgSU9NTVUgcGFnZSB0YWJsZXMuIFRodXMgYSBkZXZp
Y2UgZHJpdmVyIHJ1bm5pbmcgaW4gdGhlIGRvbWFpbiBtYXkgcHJvZ3JhbSBwYXNzdGhyb3VnaCBo
YXJkd2FyZSB1c2luZyBHRk4gdmFsdWVzIChpLmUuIGd1ZXN0IHBoeXNpY2FsIGZyYW1lIG51bWJl
cnMpIHdpdGhvdXQgYW55IGZ1cnRoZXIgdHJhbnNsYXRpb24uDQoNCidzaGFyZS1wdCcNCg0KVGhp
cyBpcyB1bmF2YWlsYWJsZSBmb3IgYSBQViBkb21haW4uIEZvciBhbiBIVk0gZG9tYWluLCB0aGlz
IG9wdGlvbiBtZWFucyB0aGF0IHRoZSBJT01NVSB3aWxsIGJlIHByb2dyYW1tZWQgdG8gZGlyZWN0
bHkgcmVmZXJlbmNlIHRoZSBQMk0gYXMgaXRzIHBhZ2UgdGFibGVzLiBUaGlzIGF2YWlsYWJpbGl0
eSBvZiB0aGlzIG9wdGlvbiBpcyBoYXJkd2FyZSBzcGVjaWZpYyBhbmQgdGh1cywgaWYgaXQgaXMg
c3BlY2lmaWVkIGZvciBhIGRvbWFpbiBydW5uaW5nIG9uIGhhcmR3YXJlIHRoYXQgZG9lcyBub3Qg
YWxsb3cgaXQsICdzeW5jLXB0JyB3aWxsIGJlIHVzZWQgaW5zdGVhZC4NCg0KPw0KDQogIFBhdWwN
Cg0KPiANCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
