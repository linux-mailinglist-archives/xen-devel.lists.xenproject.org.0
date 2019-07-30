Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660B87AAAE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 16:15:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsSrU-0008Hd-6j; Tue, 30 Jul 2019 14:12:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NuEK=V3=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hsSrS-0008HY-8P
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 14:12:18 +0000
X-Inumbo-ID: 088cb3aa-b2d4-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::724])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 088cb3aa-b2d4-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 14:12:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ja09r696wUffTWA/Mq4GMC3eJs2lFPJfUb9pqGpgXP8qFaecpMqveFMy/VIbA2RG6cxh+ixNnj/ey9qIAGkaoz3hD6SDUjP5/VPBObr4vRCS2WAG01VvhUbmEIp7uKlrzu6WM9mppEoCTGxITiSafT37BesoqbVx7S+zAm2hbTG11WJSDwWXS9JkrH0ROxuZLN6XWSboA3kYetHt+ZNqXA7CYOruY2nM3WMtrCEkdCI5eTiuLtRdD2xRttm94vqfCP2xMhy/Q2U+rQZXnNqCWPvj6K55de52woXSllO0og5JdPVIefM0d1Xb5L7mtXVJx8/YJ2+tf3v/vvLTkBbJUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVFXQDxACIlvTEKjhpzBrpyQW6xDyE9yBeyU2TPzlqA=;
 b=eau7cz+Hmi9i5VKnuxvWzaU8Wz6d9THqPYekfcp7wHxcA9BUdTERSumlOWEtvedNI6n/sTs6ffSrHA2I9MGVFxtxCk1xSmyWZl1BNogtXoiNnIjh2m55YFeMtjZN9+gkXg6Vg8z06NhGSTSLDkMsu8RtEA5EIE144BYR663bAL1NXYi7BExTybbAGdgo7WTLo1j9VpZ+IqsiAbT04kedCtiZYy4NalvV8CoAn54Aq5m3b4xCYkgVwi02g1amxr3fS65z1b5QSKYITVh5DQt8J+KHto6wNifIQrWXHJMeFS6kJpUfpPsiatLB05gQma2FW6LihOooBiACkJj585S+3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVFXQDxACIlvTEKjhpzBrpyQW6xDyE9yBeyU2TPzlqA=;
 b=KPfGofpPU7f9mex0zIXbOavelHw3waN7IU5MpX5JzL8IwgV271ho8qliV78fK54Mi3oHJbFC0GJGNtMZMRz1l8/0P2AwKNch3Lw25fC7VatTz+3ZcksW1M8CdmayYrTHspXbdHyRXxEwXaZ2DJrFTyFlObrLvJxkdlUkNqltOfk=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3373.eurprd02.prod.outlook.com (52.134.16.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 14:12:13 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::7967:e7:88e7:2c18]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::7967:e7:88e7:2c18%3]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 14:12:13 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMY4Gmux1Y/IiSU2ZKtKyOfOCuKbQbceAgAG+GQD//9nvgIAEjgaAgAzeDYD//9/xAIAADJ4A
Date: Tue, 30 Jul 2019 14:12:13 +0000
Message-ID: <c7060d91-851a-ba04-56c3-90f1aed65913@bitdefender.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <7a4c824d-3ccd-b289-3e8e-ff94ea916b3e@suse.com>
 <0d1ab92f-171b-98d9-a69e-5aa7cfbe0d85@bitdefender.com>
 <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
 <23cebb01-38fc-ba49-5a71-e6129152e488@bitdefender.com>
 <1bdaee7b-a01f-7be8-426f-fe6c678c2859@bitdefender.com>
 <60651ad5-f0bd-caad-77f6-5f8fb71a8319@suse.com>
In-Reply-To: <60651ad5-f0bd-caad-77f6-5f8fb71a8319@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2P264CA0044.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::32) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a0f99fd-7bc0-4f08-2147-08d714f7eb08
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3373; 
x-ms-traffictypediagnostic: VI1PR0202MB3373:|VI1PR0202MB3373:
x-microsoft-antispam-prvs: <VI1PR0202MB33732B5A92FE5CB8B4A67500ABDC0@VI1PR0202MB3373.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(376002)(346002)(136003)(39860400002)(199004)(189003)(6916009)(446003)(316002)(66476007)(66946007)(64756008)(66446008)(66556008)(256004)(486006)(71190400001)(31686004)(4326008)(71200400001)(8936002)(478600001)(31696002)(476003)(6246003)(66066001)(54906003)(14454004)(86362001)(6116002)(3846002)(53546011)(6512007)(53936002)(186003)(6436002)(8676002)(229853002)(52116002)(7736002)(6486002)(2616005)(68736007)(102836004)(2906002)(36756003)(5660300002)(25786009)(26005)(305945005)(99286004)(6506007)(386003)(14444005)(81166006)(76176011)(81156014)(11346002)(309714004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3373;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gmuQJxFb4WcXfPDWEduSQbcw/wWfHTp0k+65XIBkLvSbvd+zf0EdDFnONK/TzyQfjKMeubi7KvK14vsigXq+97QnEVvgTa+h4QnDBNVs7ddC/SLKXVTKIHk4Y4I3UydD7G0aVc+E1fIQ7UmnFNoqmwIWkeDZfhwasfPZOQkYJa1j7GL6VnAxLBcJNJowDhGSug9kPFS6Vng636mQDHUxnp0Li2tMnveOzzFkb6i8TOkvEW4eibRNkDTB9dQ2DC2EJgtp99eQ61rmV6QUZfMyN/2CFrCWa9gGbjFvT8JV211R0T6rVwbFAfv49LfkNO5XJy4j4HVDy8Q9VgTLG5Azn5//96kZJPK80VosgcOTkJmrj4ahG4jlhlJ6CCmmkS6yDdtXVFW4wM2i02wSAbW+qDC4sHGE9eW1VU/63ij8zMQ=
Content-ID: <FDD50E29B65E8D4C97013290F601F046@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0f99fd-7bc0-4f08-2147-08d714f7eb08
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 14:12:13.0922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3373
Subject: Re: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
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
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDMwLjA3LjIwMTkgMTY6MjcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wNy4y
MDE5IDE0OjIxLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+DQo+Pj4+Pj4+IEBA
IC02MjksNiArNjk3LDE0IEBAIHN0YXRpYyB2b2lkICpodm1lbXVsX21hcF9saW5lYXJfYWRkcigN
Cj4+Pj4+Pj4gICAgICAgICANCj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICBBU1NFUlQocDJt
dCA9PSBwMm1fcmFtX2xvZ2RpcnR5IHx8ICFwMm1faXNfcmVhZG9ubHkocDJtdCkpOw0KPj4+Pj4+
PiAgICAgICAgICAgICAgICAgfQ0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICsgICAgICAgIGlmICggY3Vy
ci0+YXJjaC52bV9ldmVudCAmJg0KPj4+Pj4+PiArICAgICAgICAgICAgY3Vyci0+YXJjaC52bV9l
dmVudC0+c2VuZF9ldmVudCAmJg0KPj4+Pj4+PiArICAgICAgICAgICAgaHZtX2VtdWxhdGVfc2Vu
ZF92bV9ldmVudChhZGRyLCBnZm4sIHBmZWMpICkNCj4+Pj4+Pj4gKyAgICAgICAgew0KPj4+Pj4+
PiArICAgICAgICAgICAgZXJyID0gRVJSX1BUUih+WDg2RU1VTF9SRVRSWSk7DQo+Pj4+Pj4+ICsg
ICAgICAgICAgICBnb3RvIG91dDsNCj4+Pj4+Pj4gKyAgICAgICAgfQ0KPj4+Pj4+DQo+Pj4+Pj4g
RGlkIHlvdSBub3RpY2UgdGhhdCB0aGVyZSdzIGFuIGltbWVkaWF0ZSBleGl0IGZyb20gdGhlIGxv
b3Agb25seQ0KPj4+Pj4+IGluIGNhc2UgdGhlIGxpbmVhciAtPiBwaHlzaWNhbCB0cmFuc2xhdGlv
biBmYWlscz8gVGhpcyBpcw0KPj4+Pj4+IHJlbGV2YW50IGZvciBwYWdlIGZhdWx0IGRlbGl2ZXJ5
IGNvcnJlY3RuZXNzIGZvciBhY2Nlc3Nlcw0KPj4+Pj4+IGNyb3NzaW5nIHBhZ2UgYm91bmRhcmll
cy4gSSB0aGluayB5b3Ugd2FudCB0byB1c2UNCj4+Pj4+PiB1cGRhdGVfbWFwX2VycigpIGFuZCBk
cm9wIHRoZSAiZ290byBvdXQiLiBJIGNhbid0IHJlYWxseSBtYWtlIHVwDQo+Pj4+Pg0KPj4+Pj4g
QnkgdXBkYXRlX21hcF9lcnIoKSBhcmUgeW91IHNheWluZyB0byBoYXZlIHRoZSBlcnIgdmFyIGFz
c2lnbmVkIGFuZCB0aGVuDQo+Pj4+PiBkcm9wICJnb3RvIG91dCI/IElmIHNvIGhvdyBkbyBJIGtl
ZXAgdGhlIGVyciBmcm9tIG15IGFjY2VzcyB2aW9sYXRpb24NCj4+Pj4+IHdpdGhvdXQgZXhpdGlu
ZyBmcm9tIHRoZSBsb29wPw0KPj4+Pg0KPj4+PiBDb3VudGVyIHF1ZXN0aW9uOiBXaHkgZG8geW91
IF9uZWVkXyB0byBrZWVwICJ5b3VyIiB2YWx1ZSBvZiBlcnI/DQo+Pj4+IElmLCBqdXN0IGFzIGFu
IGV4YW1wbGUsIHRoZXJlJ3MgZ29pbmcgdG8gYmUgYSAjUEYgb24gdGhlIG90aGVyDQo+Pj4+IGhh
bGYgb2YgdGhlIGFjY2VzcywgdGhlbiAieW91ciIgYWNjZXNzIHZpb2xhdGlvbiBpcyBvZiBubyBp
bnRlcmVzdA0KPj4+PiBhdCBhbGwuDQo+Pj4NCj4+PiBZb3UgYXJlIHJpZ2h0LCB0aGVyZSBpcyBu
byBuZWVkIHRvIGtlZXAgdGhlICJnb3RvIG91dCIgaGVyZS4gSXQgd2FzIGp1c3QNCj4+PiBmb3Ig
b3B0aW1pemF0aW9uIGluIHRoZSBpZGVhIHRoYXQgdGhlcmUgaXMgbm8gbmVlZCB0byBkbyBmdXJ0
aGVyIHN0ZXBzDQo+Pj4gYnV0IEkgY2FuIGRyb3AgdGhlICJnb3RvIG91dCIgYW5kIHRoZSBjb2Rl
IHdpbGwgd29yayB0aGUgc2FtZS4NCj4+Pg0KPj4NCj4+IFRoZXJlIGlzIGEgcHJvYmxlbSB3aXRo
IGRyb3BwaW5nIHRoZSAiZ290byBvdXQiLiBJZiBldmVyeXRoaW5nIGdvZXMgZmluZQ0KPj4gdGhl
biBpdCB3aWxsIHJldHVybiB0aGUgbWFwcGluZyBhbmQgSSBkb24ndCB3YW50IHRoYXQuIFRoaXMg
Y2FuIGJlDQo+PiBzdG9wcGVkIGJ5IGNoZWNraW5nIGlmICggZXJyICkgYWZ0ZXIgdGhlIGxvb3Ag
YW5kIGl0IGlzIG5vdCBudWxsIHRoZW4NCj4+IGdvdG8gb3V0LiBBbmQgZ29pbmcgd2l0aCB0aGlz
IGlkZWEgSSBjYW4gaW5pdCAqZXJyID0gTlVMTCBhbmQgZHJvcCB0aGUNCj4+IGVyciA9IE5VTEwg
ZnJvbSBodm1lbXVsX21hcF9saW5lYXJfYWRkcigpLiBJcyB0aGlzIG9rIGZvciB0aGUgbmV4dCB2
ZXJzaW9uPw0KPiANCj4gSSdkIHByZWZlciB0byBzZWUgdGhlIGNvZGUgdG8gZGVjaWRlLiBJZiB5
b3Ugd2FudCB0aGlzIHNldHRsZWQgYmVmb3JlDQo+IHNlbmRpbmcgdGhlIG5leHQgZnVsbCB2ZXJz
aW9uLCB0aGVuIHBsZWFzZSBzZW5kIGF0IGxlYXN0IHRoZSByZXN1bHRpbmcNCj4gcGF0Y2ggaHVu
ayhzKS4NCj4gDQoNCkhlcmUgaXMgYSBkaWZmIGZvciBodm1lbXVsX21hcF9saW5lYXJfYWRkcigp
Og0KDQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2VtdWxhdGUuYyBiL3hlbi9hcmNo
L3g4Ni9odm0vZW11bGF0ZS5jDQppbmRleCBkNzVkM2U2ZmQ2Li40OWRiZmE3MzBjIDEwMDY0NA0K
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0v
ZW11bGF0ZS5jDQpAQCAtNTQzLDEwICs1NDMsMTEgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFw
X2xpbmVhcl9hZGRyKA0KICAgICAgc3RydWN0IGh2bV9lbXVsYXRlX2N0eHQgKmh2bWVtdWxfY3R4
dCkNCiAgew0KICAgICAgc3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50Ow0KLSAgICB2b2lkICpl
cnIsICptYXBwaW5nOw0KKyAgICB2b2lkICplcnIgPSBOVUxMLCAqbWFwcGluZzsNCiAgICAgIHVu
c2lnbmVkIGludCBucl9mcmFtZXMgPSAoKGxpbmVhciArIGJ5dGVzIC0gISFieXRlcykgPj4gUEFH
RV9TSElGVCkgLQ0KICAgICAgICAgIChsaW5lYXIgPj4gUEFHRV9TSElGVCkgKyAxOw0KICAgICAg
dW5zaWduZWQgaW50IGk7DQorICAgIGdmbl90IGdmbjsNCg0KICAgICAgLyoNCiAgICAgICAqIG1m
biBwb2ludHMgdG8gdGhlIG5leHQgZnJlZSBzbG90LiAgQWxsIHVzZWQgc2xvdHMgaGF2ZSBhIHBh
Z2UgDQpyZWZlcmVuY2UNCkBAIC01ODUsNyArNTg2LDcgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxf
bWFwX2xpbmVhcl9hZGRyKA0KICAgICAgICAgIEFTU0VSVChtZm5feCgqbWZuKSA9PSAwKTsNCg0K
ICAgICAgICAgIHJlcyA9IGh2bV90cmFuc2xhdGVfZ2V0X3BhZ2UoY3VyciwgYWRkciwgdHJ1ZSwg
cGZlYywNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnBmaW5mbywgJnBh
Z2UsIE5VTEwsICZwMm10KTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
JnBmaW5mbywgJnBhZ2UsIGdmbiwgJnAybXQpOw0KDQogICAgICAgICAgc3dpdGNoICggcmVzICkN
CiAgICAgICAgICB7DQpAQCAtNTk5LDcgKzYwMCw2IEBAIHN0YXRpYyB2b2lkICpodm1lbXVsX21h
cF9saW5lYXJfYWRkcigNCiAgICAgICAgICAgICAgZ290byBvdXQ7DQoNCiAgICAgICAgICBjYXNl
IEhWTVRSQU5TX2JhZF9nZm5fdG9fbWZuOg0KLSAgICAgICAgICAgIGVyciA9IE5VTEw7DQogICAg
ICAgICAgICAgIGdvdG8gb3V0Ow0KDQogICAgICAgICAgY2FzZSBIVk1UUkFOU19nZm5fcGFnZWRf
b3V0Og0KQEAgLTYyMiwxNCArNjIyLDIyIEBAIHN0YXRpYyB2b2lkICpodm1lbXVsX21hcF9saW5l
YXJfYWRkcigNCiAgICAgICAgICAgICAgfQ0KDQogICAgICAgICAgICAgIGlmICggcDJtdCA9PSBw
Mm1faW9yZXFfc2VydmVyICkNCi0gICAgICAgICAgICB7DQotICAgICAgICAgICAgICAgIGVyciA9
IE5VTEw7DQogICAgICAgICAgICAgICAgICBnb3RvIG91dDsNCi0gICAgICAgICAgICB9DQoNCiAg
ICAgICAgICAgICAgQVNTRVJUKHAybXQgPT0gcDJtX3JhbV9sb2dkaXJ0eSB8fCAhcDJtX2lzX3Jl
YWRvbmx5KHAybXQpKTsNCisNCisgICAgICAgICAgICBpZiAoIGN1cnItPmFyY2gudm1fZXZlbnQg
JiYNCisgICAgICAgICAgICAgICAgIGN1cnItPmFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQgJiYN
CisgICAgICAgICAgICAgICAgIGh2bV9lbXVsYXRlX3NlbmRfdm1fZXZlbnQoYWRkciwgZ2ZuLCBw
ZmVjKSApDQorICAgICAgICAgICAgICAgIGVyciA9IEVSUl9QVFIoflg4NkVNVUxfUkVUUlkpOw0K
ICAgICAgICAgIH0NCiAgICAgIH0NCisgICAgLyogQ2hlY2sgaWYgYW55IHZtX2V2ZW50IHdhcyBz
ZW50ICovDQorICAgIGlmICggZXJyICkNCisgICAgICAgIGdvdG8gb3V0Ow0KDQogICAgICAvKiBF
bnRpcmUgYWNjZXNzIHdpdGhpbiBhIHNpbmdsZSBmcmFtZT8gKi8NCiAgICAgIGlmICggbnJfZnJh
bWVzID09IDEgKQ0KDQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
