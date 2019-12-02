Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 454AC10EBB1
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 15:44:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibmrv-0001lY-JP; Mon, 02 Dec 2019 14:40:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CFGx=ZY=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ibmru-0001i5-1e
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 14:40:06 +0000
X-Inumbo-ID: a00bd986-1511-11ea-83b8-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.96]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a00bd986-1511-11ea-83b8-bc764e2007e4;
 Mon, 02 Dec 2019 14:40:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRXhLFrElDIoqQUP7nvXPdzkdnzgeCBOxBCqK4DqX7WE4klxTYnYC64hVzWqdZSwHTvJd/i+wZPDLNWASfgveUw0fkQbmvkjPrhFWIp/YFAKrq6SfYvtH9YU5JupiXLfTmHqC7qdIsI/u5FBd47IzDeVQxuXciZutNjEU+cPxKyHD7GA6hki0paYzc3CdWkgL+3SbZm5i6rB6/NhGTp6ErLkXNxwu+2EZltdZDOpkEkzS6NlpvqQLthCiXxx3I5HtpNsWEEsNdyCw3z8XusFEoXEBk+d+07DGypcyfNeO2A6ZwBEstVMBvOr8hHvVjfWOttNHvT7qBbFYaDK+Edy+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aAkil1R50+p5VP4XnYj+aOlvqSb7a9sPvNpQ6ZZqxs=;
 b=TkAPEaWHR90Z7aNMC/We9akqPD/nCtejIts/gIl9qrexu+C7U+i4ThBv7/pa6gkbN1p0zF5xpC3+ZMkHrWRf7J4Ub1+7MMapCMGVgTitW1BVtgwaTjyOYxdGGRCwt5OVmTUsSXc0tado3OKeVNo7zkuunCNUKHCqbQ6x72IIWgaZYVzF+SRyatVB3Netfs//cLOYh8mrHDoVPCtt7LmLqO0GKT1thJQVje/vYAOADqj1K4H3OUglbMXXj1E5wFpsHoX026dzrZAxHGjbo/HPb4qBFsoQ/9B3XSaLhs1b+T2pIqLuGBBNr0w9Ib3GU4kJ9aCXqj4BrdXpbHIVMMUApg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aAkil1R50+p5VP4XnYj+aOlvqSb7a9sPvNpQ6ZZqxs=;
 b=hZR6777FEL9ZDkzEvhWW8tFDm6nuKRGg3qlPSPLnClWhR2+05G7eXhWAgR0Eq+YS3/adYRfy/XogPAE0ffK6G0ExVKPtGIP0su48bSWuIMRJTurOn/Xq0ve6JQVj+UX6DRhtgI1lRSiaEj/cih0NA8viTxX0x09hCOORAyfc4U8=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5668.eurprd02.prod.outlook.com (10.255.28.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Mon, 2 Dec 2019 14:40:01 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 14:40:01 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V3 1/2] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVoHyqPG/1qImaik2u7wxoJD4v56eiEDwAgATriYA=
Date: Mon, 2 Dec 2019 14:40:00 +0000
Message-ID: <4ce33df5-81cf-5cf5-c799-bfda3d3ff48d@bitdefender.com>
References: <20191121150124.15865-1-aisaila@bitdefender.com>
 <f7de5e12-284f-11a8-97ee-b8cd12fa9037@suse.com>
In-Reply-To: <f7de5e12-284f-11a8-97ee-b8cd12fa9037@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0136.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::41) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a554eba3-5415-4e35-b671-08d7773582cf
x-ms-traffictypediagnostic: AM0PR02MB5668:|AM0PR02MB5668:|AM0PR02MB5668:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB5668C840948ED4BF2FDCCB93AB430@AM0PR02MB5668.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(376002)(136003)(366004)(396003)(189003)(199004)(76176011)(102836004)(478600001)(229853002)(31696002)(86362001)(6436002)(25786009)(186003)(6486002)(6246003)(54906003)(7416002)(4326008)(8676002)(81156014)(81166006)(66446008)(66946007)(64756008)(66476007)(316002)(26005)(31686004)(66556008)(2906002)(71190400001)(66066001)(305945005)(14444005)(71200400001)(8936002)(11346002)(6916009)(7736002)(6512007)(14454004)(5660300002)(52116002)(256004)(36756003)(53546011)(386003)(99286004)(6506007)(3846002)(6116002)(2616005)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5668;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EQCL9o4lnozRiw6sLD7j9UArUa+JVjdKBtgWch2Lg3/I0lhtFbQLF6Rhdav0leWpqI2Psxr1b4WG5krSbwYP7iJP6wVRNvonX+oBfWI2WGf1gC4g/iU1im8IaVf8rmmQTTz/y/rZGQqGA+8laWDr0TXr8oxu1YbswE+l2ZPDruV/mADJULbLE/MCuWUuRcLj42PDeEJlm6MLqxAtDploEg4wJjMKaIuywjSv80WRQaXKvPCjzilAZgrlfBJC89t54i09JpReuKQ2+UoC1R0iyvCx+UwZcHBUSjOpBWhKO1DwqcStk67s7clt/glkP8nXtna7DROTB14MFiwgoKEd7lragftWQ7CjNy10eTkEyQx76trPFGCWqtPzj5cBR2kJZbxmsgXrbpZIQBzwLnBvbhHEx9vtfHwr7AoxDLfwyVU6Av9Pila5/4ErzW5SCb4S
Content-ID: <709EEF79E090E5479C364095F18D8CE8@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a554eba3-5415-4e35-b671-08d7773582cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 14:40:00.9316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lenpEOAWfVRKNKl3kCkiz1SKbG754c8rjhZJvnKLwK0DKMwXMQOUznntM1Ymh1Pwe+tPEUCWk6hg9Op/GiG99fRicTvOA30igq7/yHHyG3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5668
Subject: Re: [Xen-devel] [PATCH V3 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI5LjExLjIwMTkgMTM6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4xMS4y
MDE5IDE2OjAyLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IENoYW5nZXMgc2lu
Y2UgVjI6DQo+PiAJLSBBZGQgYSBuZXcgc3RydWN0dXJlICJ4ZW5faHZtX2FsdHAybV9zdXBwcmVz
c192ZV9tdWx0aSINCj4+IAktIENvcHkgdGhlIGdmbiBvZiB0aGUgZmlyc3QgZXJyb3IgdG8gdGhl
IGNhbGxlcg0KPj4gCS0gUmV2ZXJ0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlDQo+PiAJLSBB
ZGQgYSBtZWNoYW5pc20gdG8gc2F2ZSB0aGUgZmlyc3QgZXJyb3IuDQo+IA0KPiBBbmQgSSBndWVz
cyB5b3Ugd2FudCB0byBhZGp1c3QgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIGNvdmVyIHRoaXMNCj4g
ZmFjdC4NCg0KSSB3aWxsIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNCj4gDQo+PiBAQCAt
NDcxMSw2ICs0NzEyLDE4IEBAIHN0YXRpYyBpbnQgZG9fYWx0cDJtX29wKA0KPj4gICAgICAgICAg
IH0NCj4+ICAgICAgICAgICBicmVhazsNCj4+ICAgDQo+PiArICAgIGNhc2UgSFZNT1BfYWx0cDJt
X3NldF9zdXBwcmVzc192ZV9tdWx0aToNCj4+ICsgICAgICAgIGlmICggYS51LnN1cHByZXNzX3Zl
X211bHRpLnBhZDEgfHwgIWEudS5zdXBwcmVzc192ZV9tdWx0aS5wYWQyICkNCj4+ICsgICAgICAg
ICAgICByYyA9IC1FSU5WQUw7DQo+PiArICAgICAgICBlbHNlDQo+PiArICAgICAgICB7DQo+PiAr
ICAgICAgICAgICAgcmMgPSBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKGQsICZhLnUuc3VwcHJl
c3NfdmVfbXVsdGkpOw0KPj4gKw0KPj4gKyAgICAgICAgICAgIGlmICggX19jb3B5X3RvX2d1ZXN0
KGFyZywgJmEsIDEpICkNCj4+ICsgICAgICAgICAgICAgICAgcmMgPSAtRUZBVUxUOw0KPiANCj4g
RG8geW91IHJlYWxseSB3YW50IHRvIHJlcGxhY2UgYSBwb3NzaWJsZSBwcmlvciBlcnJvciBoZXJl
Pw0KDQpJIHRob3VnaHQgYWJvdXQgdGhpcyBhbmQgdGhlIG9ubHkgZXJyb3IgdGhhdCBjYW4gYmUg
cmVwbGFjZWQgaGVyZSBpcyANCkVJTlZBTC4gQSBlcnJvciBvbiBfX2NvcHlfdG9fZ3Vlc3QgaGFz
IGEgZ3JhdGVyIGltcG9ydGFuY2UgaWYgdGhpcyBmYWlscy4NCg0KPiANCj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS9wMm0uYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jDQo+PiBAQCAt
MzA1OSw2ICszMDU5LDY2IEBAIG91dDoNCj4+ICAgICAgIHJldHVybiByYzsNCj4+ICAgfQ0KPj4g
ICANCj4+ICsvKg0KPj4gKyAqIFNldC9jbGVhciB0aGUgI1ZFIHN1cHByZXNzIGJpdCBmb3IgbXVs
dGlwbGUgcGFnZXMuICBPbmx5IGF2YWlsYWJsZSBvbiBWTVguDQo+PiArICovDQo+PiAraW50IHAy
bV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkoc3RydWN0IGRvbWFpbiAqZCwNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc3VwcHJlc3NfdmVfbXVs
dGkgKnN2ZSkNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpob3N0X3AybSA9IHAy
bV9nZXRfaG9zdHAybShkKTsNCj4+ICsgICAgc3RydWN0IHAybV9kb21haW4gKmFwMm0gPSBOVUxM
Ow0KPj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtOw0KPj4gKyAgICB1aW50NjRfdCBzdGFy
dCA9IHN2ZS0+b3BhcXVlID86IHN2ZS0+Zmlyc3RfZ2ZuOw0KPj4gKyAgICBpbnQgcmMgPSAwOw0K
Pj4gKw0KPj4gKyAgICBpZiAoIHN2ZS0+dmlldyA+IDAgKQ0KPj4gKyAgICB7DQo+PiArICAgICAg
ICBpZiAoIHN2ZS0+dmlldyA+PSBNQVhfQUxUUDJNIHx8DQo+PiArICAgICAgICAgICAgIGQtPmFy
Y2guYWx0cDJtX2VwdHBbc3ZlLT52aWV3XSA9PSBtZm5feChJTlZBTElEX01GTikgKQ0KPj4gKyAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gKw0KPj4gKyAgICAgICAgcDJtID0gYXAybSA9
IGQtPmFyY2guYWx0cDJtX3AybVtzdmUtPnZpZXddOw0KPiANCj4gVGhlc2Ugd2FudCBhcnJheV9p
bmRleF9ub3NwZWMoKSBvciBhbGlrZSB1c2VkIChhbmQgdGhlIHByZS1leGlzdGluZw0KPiBzaW1p
bGFyIHVzZXMgdGFrZW4gY2FyZSBvZiBpbiBhIHNlcGFyYXRlIHBhdGNoKS4NCg0KU3VyZSwgdGhp
cyBjYW4gY2hhbmdlIHRvIHAybSA9IGFwMm0gPSANCmQtPmFyY2guYWx0cDJtX3AybVthcnJheV9p
bmRleF9ub3NwZWMoc3ZlLT52aWV3LCBNQVhfQUxUUDJNKS4NCg0KQnV0IHdoYXQgcHJlZXhpc3Rp
bmcgdXNlcyBhcmUgeW91IHRhbGtpbmcgYWJvdXQ/IEFsbCB0aGUgcGxhY2VzIHdoZXJlIA0KZC0+
YXJjaC5hbHRwMm1fcDJtW2lkeF0gaXMgdXNlZD8gSWYgc28sIHRoZXJlIHdpbGwgYmUgYSBoYW5k
ZnVsIG9mIA0KY2hhbmdlcyBpbiB0aGF0IG5ldyBwYXRjaC4NCg0KPiANCj4+ICsgICAgfQ0KPj4g
KyAgICBlbHNlDQo+PiArICAgICAgICBwMm0gPSBob3N0X3AybTsNCj4gDQo+IEVhY2ggdGltZSBJ
IHNlZSB5ZXQgYW5vdGhlciBpbnN0YW5jZSBvZiB0aGlzIHBhdHRlcm4gYXBwZWFyLCBJDQo+IHdv
bmRlciB3aHkgdGhpcyBpcy4gVXNlIChvciBub3QpIG9mIGluaXRpYWxpemVycyBzaG91bGQgYmUN
Cj4gY29uc2lzdGVudCBhdCBsZWFzdCB3aXRoaW4gaW5kaXZpZHVhbCBmdW5jdGlvbnMuIEkuZS4g
ZWl0aGVyDQo+IHlvdSBpbml0aWFsaXplIGJvdGggYXAybSBhbmQgcDJtIGluIHRoZWlyIGRlY2xh
cmF0aW9uLCBvciB5b3UNCj4gZG8gc28gZm9yIG5laXRoZXIgb2YgdGhlbS4NCg0KVGhlIG9ubHkg
cmVhc29uIEkgY2FuIHNlZSBmb3IgdGhpcyBwYXR0ZXJuIGlzIHRoYXQgcDJtIHdpbGwgYmUgYXNz
aWduZWQgDQphIHZhbHVlIGJ1dCBhcDJtIGNhbiBuZXZlciBnZXQgYSB2YWx1ZS4gQnV0IEkgYWdy
ZWUgd2l0aCB5b3UgYW5kIEkgd2lsbCANCmhhdmUgdGhlbSBib3RoIGluaXRpYWxpemVkIHdpdGgg
TlVMTC4NCg0KPiANCj4+ICsgICAgcDJtX2xvY2soaG9zdF9wMm0pOw0KPj4gKw0KPj4gKyAgICBp
ZiAoIGFwMm0gKQ0KPj4gKyAgICAgICAgcDJtX2xvY2soYXAybSk7DQo+PiArDQo+PiArDQo+IA0K
PiBQbGVhc2Ugbm8gdHdvIGJsYW5rIGxpbmVzIG5leHQgdG8gb25lIGFub3RoZXIuDQo+IA0KPj4g
KyAgICB3aGlsZSAoIHN2ZS0+bGFzdF9nZm4gPj0gc3RhcnQgKQ0KPiANCj4gVGhlcmUgYXJlIG5v
IGNoZWNrcyBvbiAtPmxhc3RfZ2ZuLCAtPmZpcnN0X2dmbiwgb3IgLT5vcGFxdWUuDQo+IEF0IHRo
ZSB2ZXJ5IGxlYXN0IGEgYm9ndXMgLT5vcGFxdWUgc2hvdWxkIHJlc3VsdCBpbiBhbiBlcnJvci4N
Cj4gSSB3b25kZXIgdGhvdWdoIHdoeSB5b3UgZG9uJ3Qgc2ltcGx5IHVwZGF0ZSAtPmZpcnN0X2dm
biwNCj4gb21pdHRpbmcgdGhlIG5lZWQgZm9yIC0+b3BhcXVlLiBBbGwgdGhpcyB3b3VsZCBuZWVk
IGlzIGENCj4gY29tbWVudCBpbiB0aGUgcHVibGljIGhlYWRlciBjbGFyaWZ5aW5nIHRoYXQgY2Fs
bGVycyBzaG91bGQNCj4gZXhwZWN0IHRoZSB2YWx1ZXMgdG8gY2hhbmdlLg0KDQpJIHdhcyBmb2xs
b3dpbmcgdGhlIHBhdHRlcm4gZnJvbSByYW5nZV9zaGFyZSgpIGFmdGVyIFRhbWFzIHJlcXVlc3Rl
ZCB0aGUgDQpvcGFxdWUgZmllbGQuIEkgYWdyZWUgdGhhdCBpdCB3b3VsZCBiZSBzaW1wbGVyIHRv
IGhhdmUgLT5maXJzdF9nZm4gDQp1cGRhdGUgYW5kIEkgY2FuIGNoYW5nZSB0byB0aGF0IGluIHRo
ZSBuZXh0IHZlcnNpb24uDQoNCj4gDQo+IEZ1cnRoZXJtb3JlIEkgdGhpbmsgaXQgd291bGQgYmUg
aGVscGZ1bCB0byBiYWlsIG9uIGVudGlyZWx5DQo+IG91dCBvZiByYW5nZSAtPmZpcnN0X2dmbi4g
VGhpcyBiZWluZyBhIDY0LWJpdCBmaWVsZCwgb25seQ0KPiA0MCBvZiB0aGUgYml0cyBhcmUgYWN0
dWFsbHkgdXNhYmxlIGZyb20gYW4gYXJjaGl0ZWN0dXJlIHBvdg0KPiAoaW4gcmVhbGl0eSBpdCBt
YXkgYmUgZXZlbiBsZXNzKS4gT3RoZXJ3aXNlIHlvdSBwb3RlbnRpYWxseQ0KPiBpbnZva2UgcDJt
X2VwdF9zZXRfZW50cnkoKSBwZXJoYXBzIHRyaWxsaW9ucyBvZiB0aW1lcyBqdXN0DQo+IGZvciBp
dCB0byByZXR1cm4gLUVJTlZBTCBmcm9tIGl0cyBmaXJzdCBpZigpLg0KDQpEbyB5b3UgbWVhbiB0
byBjaGVjayAtPmZpcnN0X2dmbih0aGF0IHdpbGwgYmUgdXBkYXRlZCBpbiB0aGUgbmV4dCANCnZl
cnNpb24pIGFnYWluc3QgZG9tYWluX2dldF9tYXhpbXVtX2dwZm4oKSBhbmQgYmFpbCBhZnRlciB0
aGF0IHJhbmdlPw0KDQo+IA0KPj4gKyAgICB7DQo+PiArICAgICAgICBwMm1fYWNjZXNzX3QgYTsN
Cj4+ICsgICAgICAgIHAybV90eXBlX3QgdDsNCj4+ICsgICAgICAgIG1mbl90IG1mbjsNCj4+ICsN
Cj4+ICsgICAgICAgIGlmICggYWx0cDJtX2dldF9lZmZlY3RpdmVfZW50cnkocDJtLCBfZ2ZuKHN0
YXJ0KSwgJm1mbiwgJnQsICZhLCBBUDJNR0VUX3F1ZXJ5KSApDQo+PiArICAgICAgICAgICAgYSA9
IHAybS0+ZGVmYXVsdF9hY2Nlc3M7DQo+PiArDQo+PiArICAgICAgICBpZiAoIHAybS0+c2V0X2Vu
dHJ5KHAybSwgX2dmbihzdGFydCksIG1mbiwgUEFHRV9PUkRFUl80SywgdCwgYSwNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3ZlLT5zdXBwcmVzc192ZSkgJiYgIXN2ZS0+Zmlyc3Rf
ZXJyb3IgKQ0KPj4gKyAgICAgICAgICAgIHN2ZS0+Zmlyc3RfZXJyb3IgPSBzdGFydDsgLyogU2F2
ZSB0aGUgZ2ZuIGZyb20gb2YgdGhlIGZpcnN0IGVycm9yICovDQo+IA0KPiBEcm9wIGVpdGhlciAi
ZnJvbSIgb3IgIm9mIj8NCj4gDQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9v
cC5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oDQo+PiBAQCAtNDYs
NiArNDYsMTcgQEAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlIHsNCj4+ICAgICAg
IHVpbnQ2NF90IGdmbjsNCj4+ICAgfTsNCj4+ICAgDQo+PiArc3RydWN0IHhlbl9odm1fYWx0cDJt
X3N1cHByZXNzX3ZlX211bHRpIHsNCj4+ICsgICAgdWludDE2X3QgdmlldzsNCj4+ICsgICAgdWlu
dDhfdCBzdXBwcmVzc192ZTsgLyogQm9vbGVhbiB0eXBlLiAqLw0KPj4gKyAgICB1aW50OF90IHBh
ZDE7DQo+PiArICAgIHVpbnQzMl90IHBhZDI7DQo+IA0KPiBQZXJoYXBzIHVzZSB0aGlzIGZpZWxk
IHRvIHJlcG9ydCB0aGUgZXJyb3IgY29kZSBvZiB0aGUgZmlyc3QNCj4gZXJyb3IgZW5jb3VudGVy
ZWQ/DQoNClRoYXQgc291bmQgZ29vZC4NCg0KPiANCj4+ICsgICAgdWludDY0X3QgZmlyc3RfZ2Zu
Ow0KPj4gKyAgICB1aW50NjRfdCBsYXN0X2dmbjsNCj4+ICsgICAgdWludDY0X3Qgb3BhcXVlOw0K
PiANCj4gQWZhaWNzIHRoZXJlJ3MgYSByZXF1aXJlbWVudCB0aGF0IHRoZSBjYWxsZXIgcHV0IHpl
cm8gaW4gaGVyZQ0KPiBmb3IgdGhlIGluaXRpYWwgaW52b2NhdGlvbi4gVGhpcyBzaG91bGQgYmUg
bm90ZWQgaW4gYSBjb21tZW50Lg0KPiANCj4+ICsgICAgdWludDY0X3QgZmlyc3RfZXJyb3I7IC8q
IEdmbiBvZiB0aGUgZmlyc3QgZXJyb3IuICovDQo+IA0KPiBBY3R1YWxseSB0aGUgc2FtZSBhcHBl
YXJzIHRvIGFwcGx5IHRvIHRoaXMgb25lLg0KDQpJIHdpbGwgdXBkYXRlIHRoZSBjb21tZW50cy4N
Cg0KVGhhbmtzLA0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
