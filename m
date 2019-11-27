Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C57210B3D7
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 17:50:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia0Sl-0000hf-5V; Wed, 27 Nov 2019 16:46:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J2FP=ZT=amazon.com=prvs=227ebe4de=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ia0Sj-0000hX-I8
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 16:46:45 +0000
X-Inumbo-ID: 7e914e07-1135-11ea-a3b9-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e914e07-1135-11ea-a3b9-12813bfff9fa;
 Wed, 27 Nov 2019 16:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574873205; x=1606409205;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0CmStnPYcSEWWorjbpI5PaZo9HwTfm/Yd1R4MvM329A=;
 b=eflEndXVKsRECl41FCbYiAporBm9rubAt3u5Wx22Vk4kH22Xq2bTJPJX
 c9e0rQpMXhwt0kQpUSrdTnBU6DejtxS55wbVlmTElj7SZynRAjgCKDvEf
 BBvoLnva3NzQgRaD3sBFvfADs9o+fbFk1Ewy/t1aJiTmgwjsXuky0OLOj I=;
IronPort-SDR: Xvpc2zY9BnRcl3rgTJjJEZKWxfd2BfUeGLGfl69fE6dHCPha9uwdQ2OOiefhuUS/Ezn1Rt8w+G
 DQPJ7f1gDATQ==
X-IronPort-AV: E=Sophos;i="5.69,250,1571702400"; 
   d="scan'208";a="6108237"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 27 Nov 2019 16:46:40 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id EF296A202D; Wed, 27 Nov 2019 16:46:39 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 16:46:39 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 16:46:38 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 27 Nov 2019 16:46:38 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [PATCH v2] xen/x86: vpmu: Unmap per-vCPU PMU page when the
 domain is destroyed
Thread-Index: AQHVpRpRyxiG+5Xi1Em6OapEOJI8fqefKPCAgAANRoCAAANxYA==
Date: Wed, 27 Nov 2019 16:46:38 +0000
Message-ID: <3d758b7945134cdc9f5e4f2a7051011e@EX13D32EUC003.ant.amazon.com>
References: <20191127120046.1246-1-pdurrant@amazon.com>
 <f847a83d-ce95-5fd4-3cdd-d74f45dcadd6@suse.com>
 <7dcd5d27-d368-4242-68bc-17f3bb4d1eaf@oracle.com>
In-Reply-To: <7dcd5d27-d368-4242-68bc-17f3bb4d1eaf@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: vpmu: Unmap per-vCPU PMU page
 when the domain is destroyed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, "Grall, Julien" <jgrall@amazon.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3JpcyBPc3Ryb3Zza3kgPGJv
cmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPg0KPiBTZW50OiAyNyBOb3ZlbWJlciAyMDE5IDE2OjMy
DQo+IFRvOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBEdXJyYW50LCBQYXVsIDxw
ZHVycmFudEBhbWF6b24uY29tPg0KPiBDYzogR3JhbGwsIEp1bGllbiA8amdyYWxsQGFtYXpvbi5j
b20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBKdW4NCj4gTmFrYWppbWEgPGp1bi5u
YWthamltYUBpbnRlbC5jb20+OyBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT47IFdl
aQ0KPiBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2Ml0geGVuL3g4NjogdnBtdTogVW5tYXAgcGVyLXZDUFUgUE1V
IHBhZ2Ugd2hlbiB0aGUNCj4gZG9tYWluIGlzIGRlc3Ryb3llZA0KPiANCj4gT24gMTEvMjcvMTkg
MTA6NDQgQU0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+IE9uIDI3LjExLjIwMTkgMTM6MDAsIFBh
dWwgRHVycmFudCB3cm90ZToNCj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS92cG11LmMNCj4g
Pj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS92cG11LmMNCj4gPj4gQEAgLTQ3OSw2ICs0NzksOCBA
QCBzdGF0aWMgaW50IHZwbXVfYXJjaF9pbml0aWFsaXNlKHN0cnVjdCB2Y3B1ICp2KQ0KPiA+Pg0K
PiA+PiAgICAgIGlmICggcmV0ICkNCj4gPj4gICAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5J
TkcgIlZQTVU6IEluaXRpYWxpemF0aW9uIGZhaWxlZCBmb3INCj4gJXB2XG4iLCB2KTsNCj4gPj4g
KyAgICBlbHNlDQo+ID4+ICsgICAgICAgIHZwbXVfc2V0KHZwbXUsIFZQTVVfQ09OVEVYVF9BTExP
Q0FURUQpOw0KPiANCj4gVGhhdCB3b24ndCB3b3JrIEkgdGhpbmsuDQo+IA0KPiBPbiBJbnRlbCB0
aGUgY29udGV4dCBpcyBhbGxvY2F0ZWQgbGF6aWx5IGZvciBIVk0vUFZIIGd1ZXN0cyBkdXJpbmcg
dGhlDQo+IGZpcnN0IE1TUiBhY2Nlc3MuIEZvciBleGFtcGxlOg0KPiANCj4gY29yZTJfdnBtdV9k
b193cm1zcigpIC0+DQo+IMKgwqDCoCBjb3JlMl92cG11X21zcl9jb21tb25fY2hlY2soKSk6DQo+
IMKgwqDCoCDCoMKgwqAgaWYgKCB1bmxpa2VseSghdnBtdV9pc19zZXQodnBtdSwgVlBNVV9DT05U
RVhUX0FMTE9DQVRFRCkpICYmDQo+IMKgwqDCoCDCoMKgwqDCoMKgwqDCoMKgICFjb3JlMl92cG11
X2FsbG9jX3Jlc291cmNlKGN1cnJlbnQpICkNCj4gwqDCoMKgIMKgwqAgwqDCoMKgIMKgIMKgwqAg
cmV0dXJuIDA7DQo+IA0KPiBGb3IgUFYgZ3Vlc3RzIHRoZSBjb250ZXh0ICppcyogYWxsb2NhdGVk
IGZyb20gdm14X3ZwbXVfaW5pdGlhbGlzZSgpLg0KPiANCj4gSSBkb24ndCByZW1lbWJlciB3aHkg
b25seSBQViBkb2VzIGVhZ2VyIGFsbG9jYXRpb24gYnV0IEkgdGhpbmsgZG9pbmcgaXQNCj4gZm9y
IGFsbCBndWVzdHMgd291bGQgbWFrZSBjb2RlIG11Y2ggc2ltcGxlciBhbmQgdGhlbiB0aGlzIHBh
dGNoIHdpbGwgYmUNCj4gY29ycmVjdC4NCj4gDQoNCk9rLiBTaW1wbGVyIGlmIEkgbGVhdmUgc2V0
dGluZyB0aGUgZmxhZyBpbiB0aGUgaW1wbGVtZW50YXRpb24gY29kZS4gSSB0aGluayBjbGVhcmlu
ZyBpdCBpbiB2Y3B1X2FyY2hfZGVzdHJveSgpIHdvdWxkIHN0aWxsIGJlIGNvcnJlY3QgaW4gYWxs
IGNhc2VzLg0KDQogIFBhdWwNCg0KPiAtYm9yaXMNCj4gDQo+IA0KPiA+Pg0KPiA+PiAgICAgIHJl
dHVybiByZXQ7DQo+ID4+ICB9DQo+ID4+IEBAIC01NzYsMTEgKzU3OCwzNiBAQCBzdGF0aWMgdm9p
ZCB2cG11X2FyY2hfZGVzdHJveShzdHJ1Y3QgdmNwdSAqdikNCj4gPj4NCj4gPj4gICAgICAgICAg
IHZwbXUtPmFyY2hfdnBtdV9vcHMtPmFyY2hfdnBtdV9kZXN0cm95KHYpOw0KPiA+PiAgICAgIH0N
Cj4gPj4gKw0KPiA+PiArICAgIHZwbXVfcmVzZXQodnBtdSwgVlBNVV9DT05URVhUX0FMTE9DQVRF
RCk7DQo+ID4+ICB9DQo+ID4gQm9yaXMsDQo+ID4NCj4gPiBJJ2QgbGlrZSB0byBhc2sgdGhhdCB5
b3UgY29tbWVudCBvbiB0aGlzIHBhcnQgb2YgdGhlIGNoYW5nZSBhdA0KPiA+IGxlYXN0LCBhcyBJ
IHNlZW0gdG8gdmFndWVseSByZWNhbGwgdGhhdCB0aGluZ3Mgd2VyZSBpbnRlbnRpb25hbGx5DQo+
ID4gbm90IGRvbmUgdGhpcyB3YXkgb3JpZ2luYWxseS4NCj4gPg0KPiA+IFBhdWwsDQo+ID4NCj4g
PiBldmVyeXRoaW5nIGVsc2UgbG9va3MgZ29kIHRvIG1lIG5vdy4NCj4gPg0KPiA+IEphbg0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
