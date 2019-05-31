Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF26A30C8E
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 12:29:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWejp-0000kZ-CG; Fri, 31 May 2019 10:26:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nX14=T7=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hWejo-0000kT-0m
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:26:16 +0000
X-Inumbo-ID: 84b28278-838e-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 84b28278-838e-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 10:26:15 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: iW+8ZKheQ0MoFDtaGkJ7fSQdFeGazh47sRsTn9vTzHEX8RyJu/IstAQHvwkKJejcCtQPBYNJRP
 ggjEOQ7uxRCei9sCLhHbbhDztG4yBNTsTzcubJdJA3wV4a4+qiwVeI8icg3yprhA4MzXwvUOSo
 h41DsBAgJigmdBQohHKTNGkRVJnevCUoV+UVoLSds/FJXVU9UbGFG98FPqiOMSavIx5PHm/rWU
 tJZMHYIW349zq7dWwOk4A5qRKVRox+R76a8/m03OTmnjGUws0Iok5D9kZnhlMBXJWLwL3P1WvD
 Vks=
X-SBRS: 2.7
X-MesageID: 1152951
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,534,1549947600"; 
   d="scan'208";a="1152951"
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrii Anisov <andrii.anisov@gmail.com>
Thread-Topic: [PATCH v3] schedule: move last_run_time to the credit scheduler
 privates
Thread-Index: AQHVFvI6NjnplyMf+0eD/wwDS78Dc6aE5xsA
Date: Fri, 31 May 2019 10:26:10 +0000
Message-ID: <16B40EA2-7781-48E7-94CA-52B328CE197B@citrix.com>
References: <1559225751-30736-1-git-send-email-andrii.anisov@gmail.com>
In-Reply-To: <1559225751-30736-1-git-send-email-andrii.anisov@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <6AC3DEBC941E8643943D2E332EE11674@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3] schedule: move last_run_time to the
 credit scheduler privates
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Dario
 Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDMwLCAyMDE5LCBhdCAzOjE1IFBNLCBBbmRyaWkgQW5pc292IDxhbmRyaWku
YW5pc292QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBBbmRyaWkgQW5pc292IDxhbmRy
aWlfYW5pc292QGVwYW0uY29tPg0KPiANCj4gVGhlIHN0cnVjdHVyZSBtZW1iZXIgbGFzdF9ydW5f
dGltZSBpcyB1c2VkIGJ5IGNyZWRpdCBzY2hlZHVsZXIgb25seS4NCj4gU28gbW92ZSBpdCBmcm9t
IGEgZ2VuZXJpYyB2Y3B1IHN0cnVjdHVyZSB0byB0aGUgY3JlZGl0IHNjaGVkdWxlciBwcml2YXRl
DQo+IHZjcHUgZGVmaW5pdGlvbi4NCg0KVGhpcyBzZWVtcyBsaWtlIGEgdXNlZnVsIGNoYW5nZSwg
YW5kIHRoZSBjb21taXQgbWVzc2FnZSBoYXMgYSBsb3Qgb2YgZ29vZCBkZXRhaWwsIHRoYW5rcy4g
IEJ1dCBJ4oCZbSBsZWZ0IHdvbmRlcmluZzogSXMgdGhlIG1haW4gaWRlYSBoZXJlIGp1c3QgdG8g
Z2VuZXJhbGx5IHJlZHVjZSBjb2RlIGFuZCBkYXRhIHVzYWdlIHdoZW4gbm90IHJ1bm5pbmcgdGhl
IGNyZWRpdCBzY2hlZHVsZXIsIG9yIGlzIHRoZXJlIGFub3RoZXIgcmVhc29uPw0KDQpJZiBpdOKA
mXMgdGhlIGZpcnN0LCBhIHF1aWNrIG5vdGUgdG8gdGhhdCBlZmZlY3Qgd2lsbCBoZWxwIHB1dCBh
cmNoYWVvbG9naXN04oCZcyBtaW5kcyBhdCBlYXNlLiA6LSkgIFRoaXMgY291bGQgcHJvYmFibHkg
YmUgYWRkZWQgb24gY29tbWl0LiAgKEnigJlsbCBkbyBhIGZ1bGwgcmV2aWV3IGl0IGluIGEgZGF5
IG9yIHR3byBpZiBEYXJpbyBkb2VzbuKAmXQgYmVhdCBtZSB0byBpdC4pDQoNCiAtR2VvcmdlDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
