Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C07101F7B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 10:09:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWzRj-0004wY-6Z; Tue, 19 Nov 2019 09:05:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ADe+=ZL=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iWzRi-0004wT-1t
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 09:05:14 +0000
X-Inumbo-ID: b08e03a8-0aab-11ea-a2f8-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.103]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b08e03a8-0aab-11ea-a2f8-12813bfff9fa;
 Tue, 19 Nov 2019 09:05:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1wtb5Fm5y3xQAk37Joehmd61AnAaMHJ12vOTTM98UrmT8drLakdss9/XLdSfekSGKzAnNdeKkw8lqoGom/8kykbgiIGwN3B+OEo59oBhX6ODVt56iG+3ORPJv5QsalpDMI59oq1WqlLuorV1Z2cLj4Do2T/3U2c2TEHuYU/sPvM7vFBMBpugF/ihetG7BLfH09EK6HvWuSQIjDbus98HmPzwwyhVkDSx83J1vdGOn10UpohMKw9FzG2/wPXHRmI0UTog9fLYzg/uaKCPfG2eLMYeo3UQph/6jC7KcIo1LXl3ushAdimYFjQCgkECyRO9ib6tKra/TFCSJxjMkmrpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Dm8s2KgsVMQGZfcjarQeKII4vtEzyIFhYUfrMaDkIU=;
 b=kWBe0FhAJLo2ZWFeceXZHEHDnAmKaMmIJKE9jIcZXoD60vXL7fFIrjcf0IoOnIOKq4n5tpRw0AvZSvlC48K8PEWPWiFoqWSN9if6Od7O3sBK+G/GyES+spDNkfI7cD3eX3Lc9O0RBnr3U3bbw+nzMk7iI4ajXFdN7xO/FF9cbk0w4qjnOGHQnU0eINLDvebQ/l1NS5LjS9pCUQbm2nwyGfIRTt8WGmUKZjFug/imwQmsS+oF4a2aLOL1O9yKpzddR84jJDjZLp4PhAUrelr14r/aEy+ukNSanE1jQeZgwHdRSPTJurpGRofYnLtZDY955yorLATdShr2I/Iih7PC8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Dm8s2KgsVMQGZfcjarQeKII4vtEzyIFhYUfrMaDkIU=;
 b=rQOhBjyn9ZNQyoK4Cjc0CT2VJ+bEddJxS0RzBxIR/s/s79wsaWoXaOtayOTRkD63y5EPaQm2PRYMJf7eXQgNHXwOaDEkgvl4GKu+y4wS3vDRxgUHd5nqD5u4/VZPNzTtKt7z0ISP5KQwFlpWd6kHhGid22tKH/NEC6O0mq3zG/g=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5506.eurprd02.prod.outlook.com (10.255.30.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Tue, 19 Nov 2019 09:05:06 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::64a3:6278:eb96:26e0]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::64a3:6278:eb96:26e0%4]) with mapi id 15.20.2451.031; Tue, 19 Nov 2019
 09:05:06 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V2 1/2] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVnhoIoDKnH00r7U+BYd+Jg1p+RKeSNKgA
Date: Tue, 19 Nov 2019 09:05:06 +0000
Message-ID: <559c1807-2f5d-2267-c563-448c0bd88725@bitdefender.com>
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
 <8c928769-c0ea-8a48-3bda-aba7d17133ba@bitdefender.com>
 <9141e27c-edd4-301a-ee76-e3fcf5e787af@suse.com>
In-Reply-To: <9141e27c-edd4-301a-ee76-e3fcf5e787af@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:e6::20) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee50c28c-94c9-406d-48bb-08d76ccf9248
x-ms-traffictypediagnostic: AM0PR02MB5506:|AM0PR02MB5506:|AM0PR02MB5506:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB550652734399A0A51B5989A9AB4C0@AM0PR02MB5506.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(396003)(136003)(376002)(346002)(199004)(189003)(4326008)(76176011)(7736002)(386003)(6506007)(53546011)(52116002)(2616005)(6246003)(486006)(99286004)(7416002)(11346002)(476003)(446003)(478600001)(71200400001)(71190400001)(14454004)(305945005)(14444005)(66066001)(256004)(8676002)(6486002)(86362001)(229853002)(6436002)(31696002)(102836004)(25786009)(6916009)(186003)(81156014)(81166006)(6512007)(8936002)(26005)(66476007)(66446008)(5660300002)(36756003)(2906002)(31686004)(316002)(66556008)(66946007)(64756008)(6116002)(3846002)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5506;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IhJmUC3xLoyhX1hbnwt0V/HXar80dYXEhFuveSnhtpoe1k1CWEC5rFueazSxvrkE7xoL+d8yaYFuwd5jJ/Et1XsGg6qlNvJI5Ru3S16RPHG4eVXhoG2bWSr48t2PdtsYIHj8iDjwK9X2i3mvuDtRgZVWA3usoDsgU6v1aMAkY4afg/5Fxe/UiD6iPXIsVdnzpcjTARNduU7ZZKVRjSWSkIccFTLFVTDYopqCr7JeJ2iwkpkdl8EbwCqqYYqqdTde+cPA85n7z+RQo9AE8ZRTulJpGNRTpo8Keth/aUV1oL1Wg8V5AxnWKRGLR0p0rTNxIOsL5wgJdF926eOJf+KAbviia51R8qRU7ZkluVMhBHxOXgbf3nQpK12fGefaUW44wDXhm7uFb+aQpElADotWc01pnoI+16cH5u05CmLEGXCSsjHnhogSDfsXCFOZkZ32
Content-ID: <D76A6BB85030BD47A13AE569A1B608BA@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee50c28c-94c9-406d-48bb-08d76ccf9248
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 09:05:06.6294 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhvE3Q35phAjLeuIfqyolwVv9jivJjuskZsjsZJO9UZnTrenv6Rb816DZxHALbjmXVkivVpDnLFAdPyZ+4iXBinb4ImjNdg4it1aIwF+dHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5506
Subject: Re: [Xen-devel] [PATCH V2 1/2] x86/altp2m: Add hypercall to set a
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
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "julien@xen.org" <julien@xen.org>,
 "wl@xen.org" <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE4LjExLjIwMTkgMTY6MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOC4xMS4y
MDE5IDE0OjM5LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IE9uIDEyLjExLjIw
MTkgMTM6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA2LjExLjIwMTkgMTY6MzUsIEFs
ZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+PiBAQCAtNDY5Myw4ICs0Njk0LDIzIEBA
IHN0YXRpYyBpbnQgZG9fYWx0cDJtX29wKA0KPj4+PiAgICAgICAgICAgIH0NCj4+Pj4gICAgICAg
ICAgICBicmVhazsNCj4+Pj4gICAgDQo+Pj4+ICsgICAgY2FzZSBIVk1PUF9hbHRwMm1fc2V0X3N1
cHByZXNzX3ZlX211bHRpOg0KPj4+PiArICAgICAgICBpZiAoIGEudS5zdXBwcmVzc192ZS5wYWQx
IHx8ICFhLnUuc3VwcHJlc3NfdmUubnIgKQ0KPj4+DQo+Pj4gQSBjb3VudCBvZiB6ZXJvIHR5cGlj
YWxseSBpcyB0YWtlbiBhcyBhIG5vLW9wLCBub3QgYW4gZXJyb3IuDQo+Pg0KPj4gSSB3aWxsIHJl
dHVybiAtRVBFUk0gZm9yICFuci4NCj4gDQo+IEhvdyBpcyAtRVBFUk0gYmV0dGVyIHRoYW4gLi4u
DQo+IA0KPj4+PiArICAgICAgICAgICAgcmMgPSAtRUlOVkFMOw0KPiANCj4gLi4uIHRoaXMsIGFu
ZCBoZW5jZSBob3cgaXMgaXQgYWRkcmVzc2luZyBteSByZW1hcms/DQo+IA0KPj4+PiArICAgICAg
ICBlbHNlDQo+Pj4+ICsgICAgICAgIHsNCj4+Pj4gKyAgICAgICAgICAgIHJjID0gcDJtX3NldF9z
dXBwcmVzc192ZV9tdWx0aShkLCAmYS51LnN1cHByZXNzX3ZlKTsNCj4+Pj4gKw0KPj4+PiArICAg
ICAgICAgICAgaWYgKCByYyA9PSAtRVJFU1RBUlQgKQ0KPj4+PiArICAgICAgICAgICAgICAgIGlm
ICggX19jb3B5X2ZpZWxkX3RvX2d1ZXN0KGd1ZXN0X2hhbmRsZV9jYXN0KGFyZywNCj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4ZW5faHZtX2FsdHAybV9v
cF90KSwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
YSwgdS5zdXBwcmVzc192ZS5vcGFxdWUpICkNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgcmMg
PSAtRUZBVUxUOw0KPj4+DQo+Pj4gSWYgdGhlIG9wZXJhdGlvbiBpcyBiZXN0IGVmZm9ydCwgX3Nv
bWVfIGluZGljYXRpb24gb2YgZmFpbHVyZSBzaG91bGQNCj4+PiBzdGlsbCBiZSBoYW5kZWQgYmFj
ayB0byB0aGUgY2FsbGVyLiBXaGV0aGVyIHRoYXQncyB0aHJvdWdoIHRoZSBvcGFxdWUNCj4+PiBm
aWVsZCBvciBieSBzb21lIG90aGVyIG1lYW5zIGlzIHNlY29uZGFyeS4gSWYgbm90IHZpYSB0aGF0
IGZpZWxkDQo+Pj4gKHdoaWNoIHdvdWxkIG1ha2UgdGhlIG91dGVyIG9mIHRoZSB0d28gaWYoKS1z
IGRpc2FwcGVhciksIHBsZWFzZSBmb2xkDQo+Pj4gdGhlIGlmKCktcy4NCj4+DQo+PiBUaGlzIGNh
biBiZSBzb2x2ZWQgYnkgaGF2aW5nIGEgaW50IGVycm9yX2xpc3QgdGhhdCB3aWxsIGdldA0KPj4g
ImNvcHlfdG9fZ3Vlc3Rfb2Zmc2V0KCkiIGF0IHRoZSBlbmQuDQo+IA0KPiBJIHdhcyBhY3R1YWxs
eSBub3QgbWVhbmluZyB0byBzdWdnZXN0IHRvIGdvIF90aGF0XyBmYXIsIGJ1dCBJDQo+IHdvdWxk
bid0IG1pbmQgc3VjaCBhIGZ1bGwgc29sdXRpb24uIFNpbmNlIHRoZXJlJ3MgYSAiZ2V0Ig0KPiBj
b3VudGVycGFydCwgSSB3YXMgcmF0aGVyIHRoaW5raW5nIHRoYXQgYW4gaW5kaWNhdGlvbiBvZiAi
dGhlcmUNCj4gd2FzIF9zb21lXyBlcnJvciIgbWlnaHQgc3VmZmljZSwgc3VnZ2VzdGluZyB0byB0
aGUgY2FsbGVyIHRvDQo+IGluc3BlY3Qgd2hpY2ggc2V0dGluZ3MgYWN0dWFsbHkgdG9vayBlZmZl
Y3QuIFN1Y2ggYW4gaW5kaWNhdGlvbg0KPiBjb3VsZCBlLmcuIGJlIGFuIGluZGV4IHZhbHVlIGlk
ZW50aWZ5aW5nIHRoZSBmaXJzdCBmYWlsZWQNCj4gb3BlcmF0aW9uLg0KDQpUaGlzIHNvdW5kIGdv
b2QsIEkgY2FuIHVzZSB0aGUgcmV0dXJuIGZvciB0aGlzIG9yIGhhdmUgYSBzZXBhcmF0ZSBmaWVs
ZCANCmluIHRoZSBzdHJ1Y3R1cmUuDQoNCj4gDQo+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9odm0vaHZtX29wLmgNCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3Au
aA0KPj4+PiBAQCAtNDIsOCArNDIsOSBAQCBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc3VwcHJlc3Nf
dmUgew0KPj4+PiAgICAgICAgdWludDE2X3QgdmlldzsNCj4+Pj4gICAgICAgIHVpbnQ4X3Qgc3Vw
cHJlc3NfdmU7IC8qIEJvb2xlYW4gdHlwZS4gKi8NCj4+Pj4gICAgICAgIHVpbnQ4X3QgcGFkMTsN
Cj4+Pj4gLSAgICB1aW50MzJfdCBwYWQyOw0KPj4+PiArICAgIHVpbnQzMl90IG5yOw0KPj4+PiAg
ICAgICAgdWludDY0X3QgZ2ZuOw0KPj4+PiArICAgIHVpbnQ2NF90IG9wYXF1ZTsNCj4+Pj4gICAg
fTsNCj4+Pg0KPj4+IEhvdyBpcyB0aGlzIGFkZGl0aW9uIG9mIGEgZmllbGQgZ29pbmcgdG8gd29y
ayBjb21wYXRpYmx5IHdpdGggb2xkDQo+Pj4gYW5kIG5ldyBjYWxsZXJzIG9uIG9sZCBhbmQgbmV3
IGh5cGVydmlzb3JzPyBSZWNhbGwgaW4gcGFydGljdWxhcg0KPj4+IHRoYXQgdGhlc2Ugb3BlcmF0
aW9ucyBhcmUgKGFsbW9zdD8pIGFsbCBwb3RlbnRpYWxseSB1c2FibGUgYnkgdGhlDQo+Pj4gZ3Vl
c3QgaXRzZWxmLg0KPj4NCj4+IEZvciB0aGlzIEhWTU9QX0FMVFAyTV9JTlRFUkZBQ0VfVkVSU0lP
TiBzaG91dCBiZSBpbmNyZWFzZWQuIEkgd2lsbCBsZWF2ZQ0KPj4gaXQgdG8gVGFtYXMgdG8gZGVj
aWRlIGlmIHdlIHdpbGwgbmVlZCBhIGRpZmZlcmVudCBzdHJ1Y3R1cmUgZm9yDQo+PiB4ZW5faHZt
X2FsdHAybV9zdXBwcmVzc192ZV9tdWx0aSB0byBrZWVwIHRoZSBjb21wYXRpYmlsaXR5Lg0KPiAN
Cj4gV2Fzbid0IGlzIHRoYXQgZHVlIHRvIHRoZSBwb3NzaWJsZSBndWVzdCBleHBvc3VyZSBpdCB3
YXMgZGVjaWRlZA0KPiB0aGF0IHRoZSBpbnRlcmZhY2UgdmVyc2lvbiBhcHByb2FjaCB3YXMgbm90
IHN1aXRhYmxlIGhlcmUsIGFuZCBoZW5jZQ0KPiBpdCBzaG91bGRuJ3QgYmUgYnVtcGVkIGFueSBm
dXJ0aGVyPw0KPiANCg0KVGhhdCBpcyBjb3JyZWN0IGJ1dCB0aGVyZSB3YXMgYWxzbyByZXF1ZXN0
ZWQgdG8gYWRkIHRoZSBuZXcgb3BhcXVlIGZpZWxkIA0Kc28gSSBkb24ndCBrbm93IGhvdyB0byBo
YXZlIHRoYXQgYW4gc3RpbGwga2VlcCB0aGUgc2FtZSB2ZXJzaW9uLg0KDQpBbGV4DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
