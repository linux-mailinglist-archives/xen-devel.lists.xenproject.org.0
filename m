Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CCF7BF44
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 13:29:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsml7-0001z3-8S; Wed, 31 Jul 2019 11:27:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4LBZ=V4=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hsml5-0001yx-6x
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 11:27:03 +0000
X-Inumbo-ID: 1d2a7fd1-b386-11e9-8980-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::711])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1d2a7fd1-b386-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 11:27:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTuM1KtvOlfo42xyxQRjuOh4sPjo8ErmfCS//IaUaaRapipApBEbNl9BK6sk9JvaZC+vgDGQWfLnrRoo4m8tq9/3RgW2RM2nBemP3TMsO4/jppv+yFNk30iSsdOspW2tMzXRu9VcXKkjPcM32ANmKpDgOGbSwGFDU9pGi3x8xlwTv55NmcTq20xGTBLFDIRxgYO1JGPGB2BbeIntRHgtU6cXyJpT8/QlOCA/Cs0n8tJRadznwXol4T7f/B+ZfYazjq2ZPzVF12LFTqaqWo1sWUM8YztbN6RSWguWNLZC6dSufxnBpfYeLT8qiJvDZxbBtMHKX3scesl5CJgqGpzZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlNHGvqc4/2hPFa0TanRdaMKQ+3AHNBl7MwzC2Wyzgk=;
 b=ZOh9UpEMANTjYT0WBf6wNS57L+7HHp2H/0JCC7IWXBi+mHs4VCGIwWvAYyAMOYi5FpYgqfT+gM0AJnVmdWbBnBT/FA2BdcALi4yK1gmMAUd1jlTpG0DZJbHASMNxSoR8BPopYyaWuJ6C9jICWi1KkuMRcI9WNg77VvzKfBNq0vB8DFasES68lX7JdB1+W8e1YWMEnPPF5Wwjll2Cf+E0qD6FfFcQsS0Fj+2jO4az503jZ1loYVt/f+TxSvVtZmDYilq/dpWKECQjnXmQJlXKWHqagFObzwt0I3l2/IQvK2Mivil4BH7+AqYn9/MycFVx54ex26RHUH4Jh4VbGfNFUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlNHGvqc4/2hPFa0TanRdaMKQ+3AHNBl7MwzC2Wyzgk=;
 b=qWp+OZjlWaDBNLZM4kLs8oQEOkI++24CS/0Iu9ENbAtr5aZrKasMJe1dk4wY5GQuXmZbWWFPEQB/b9L8jQPw4Lb2Jm2VCPOplNEtvW1RQSjEMPT3M/5GJL6MOYpvbph2d6zh7ep+bUuSTOVQYyMJ3kzfmRrFQAi8G09oCCx1eFo=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3504.eurprd02.prod.outlook.com (52.134.18.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Wed, 31 Jul 2019 11:26:59 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::7967:e7:88e7:2c18]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::7967:e7:88e7:2c18%3]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 11:26:59 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] x86/HVM: correct hvmemul_map_linear_addr() for
 multi-page case
Thread-Index: AQHVR5LczOe7ndU+fkK5TPVTLddx3w==
Date: Wed, 31 Jul 2019 11:26:59 +0000
Message-ID: <e67b4dc1-472f-dcb0-9ce6-d1f44255249c@bitdefender.com>
References: <5B98D7CF02000078001E7AEA@prv1-mh.provo.novell.com>
 <5B9A381302000078001E81DC@prv1-mh.provo.novell.com>
In-Reply-To: <5B9A381302000078001E81DC@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::32)
 To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a097e6e5-61b7-47d2-2574-08d715aa003a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3504; 
x-ms-traffictypediagnostic: VI1PR0202MB3504:|VI1PR0202MB3504:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR0202MB3504A21C489EFF3EBDB3678CABDF0@VI1PR0202MB3504.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(136003)(346002)(39860400002)(366004)(189003)(199004)(110136005)(54906003)(305945005)(66946007)(478600001)(99286004)(256004)(68736007)(86362001)(36756003)(31686004)(64756008)(66556008)(66446008)(316002)(6436002)(6246003)(66476007)(14444005)(31696002)(76176011)(52116002)(4326008)(71190400001)(966005)(71200400001)(2616005)(186003)(53546011)(8676002)(7736002)(6512007)(6506007)(81156014)(8936002)(11346002)(102836004)(386003)(6116002)(53936002)(2906002)(81166006)(229853002)(5660300002)(3846002)(25786009)(446003)(6306002)(66066001)(6486002)(486006)(476003)(14454004)(26005)(309714004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3504;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NVm+/sxU4Lcn6PcpbfeY9Xy3WGphO4cOHpH4x5raxsnuhDHqprZ/YIxm6qcyo6KAIYU2iPLLptCXk7OOYoxYLNXoTwiRW6+32RAf6kXKU89OyRKxYcndRI8YUlEqoIlObNOkfT4UGhkI8XIVXSoCXV5AWI7QjJR4IlXq6asozmHbb/+Y5KPE6no02N487IvhY2PrXpLxJaHMtt6fX8/jpEv4SvNmIlaUtkC6xLTugtjkztJn5xc2ZezCgiPO0Y/eC8u2IvXXL+REpGp8fTA914PYhih7aWGJODlmFAHb9RnfU2n7VKqtmNb3LQWGKvlAbFcXuW2wNcpovILuLFqmpyjrfDj8x+Yh0spRtf8dmL1yH/04IEcg40J3jR3tCRMa7CNPmNeeiCmKCrWWzWBrFhhTZuanGDJOq4lEzYVqOkc=
Content-ID: <2A7C43632F83AB4081196694A35353B6@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a097e6e5-61b7-47d2-2574-08d715aa003a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 11:26:59.0910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3504
Subject: Re: [Xen-devel] [PATCH v2] x86/HVM: correct
 hvmemul_map_linear_addr() for multi-page case
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDEzLjA5LjIwMTggMTM6MTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBUaGUgZnVuY3Rp
b24gZG9lcyB0d28gdHJhbnNsYXRpb25zIGluIG9uZSBnbyBmb3IgYSBzaW5nbGUgZ3Vlc3QgYWNj
ZXNzLg0KPiBBbnkgZmFpbHVyZSBvZiB0aGUgZmlyc3QgdHJhbnNsYXRpb24gc3RlcCAoZ3Vlc3Qg
bGluZWFyIC0+IGd1ZXN0DQo+IHBoeXNpY2FsKSwgcmVzdWx0aW5nIGluICNQRiwgb3VnaHQgdG8g
dGFrZSBwcmVjZWRlbmNlIG92ZXIgYW55IGZhaWx1cmUNCj4gb2YgdGhlIHNlY29uZCBzdGVwIChn
dWVzdCBwaHlzaWNhbCAtPiBob3N0IHBoeXNpY2FsKS4gQmFpbCBvdXQgb2YgdGhlDQo+IGxvb3Ag
ZWFybHkgc29sZWx5IHdoZW4gdHJhbnNsYXRpb24gcHJvZHVjZXMgSFZNVFJBTlNfYmFkX2xpbmVh
cl90b19nZm4sDQo+IGFuZCByZWNvcmQgdGhlIG1vc3QgcmVsZXZhbnQgb2YgcGVyaGFwcyBtdWx0
aXBsZSBkaWZmZXJlbnQgZXJyb3JzDQo+IG90aGVyd2lzZS4gKFRoZSBjaG9pY2Ugb2YgWkVST19C
TE9DS19QVFIgYXMgc2VudGluZWwgaXMgYXJiaXRyYXJ5LikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KVGhpcyBpcyB1c2VmdWwgZm9yIGFk
ZGluZyBuZXcgZnVuY3Rpb25hbGl0eSB0byBodm1lbXVsX21hcF9saW5lYXJfYWRkcigpDQoNClJl
dmlld2VkLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4NCg0K
PiAtLS0NCj4gdjI6IEFkZCBjb21tZW50IChtYXBwaW5nIHRhYmxlKSBhbmQgYWRqdXN0IHVwZGF0
ZV9tYXBfZXJyKCkNCj4gICAgICBhY2NvcmRpbmdseS4NCj4gDQo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vZW11bGF0ZS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jDQo+IEBA
IC01MzIsNiArNTMyLDM2IEBAIHN0YXRpYyBpbnQgaHZtZW11bF9kb19tbWlvX2FkZHIocGFkZHJf
dA0KPiAgIH0NCj4gICANCj4gICAvKg0KPiArICogSW50ZW5kZWQgbWFwcGluZywgaW1wbGVtZW50
ZWQgd2l0aG91dCB0YWJsZSBsb29rdXA6DQo+ICsgKg0KPiArICogLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gKyAqIHwgXCBuZXcgfCAgICAgICB8ICAgICAgIHwg
ICAgICAgfCAgICAgICB8DQo+ICsgKiB8ICAgXCAgIHwgT0tBWSAgfCBOVUxMICB8IFJFVFJZIHwg
VU5ITkQgfA0KPiArICogfCBlcnIgXCB8ICAgICAgIHwgICAgICAgfCAgICAgICB8ICAgICAgIHwN
Cj4gKyAqIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICsgKiB8
IE9LQVkgIHwgT0tBWSAgfCBOVUxMICB8IFJFVFJZIHwgVU5ITkQgfA0KPiArICogLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gKyAqIHwgTlVMTCAgfCBOVUxMICB8
IE5VTEwgIHwgUkVUUlkgfCBVTkhORCB8DQo+ICsgKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KPiArICogfCBSRVRSWSB8IFJFVFJZIHwgUkVUUlkgfCBSRVRSWSB8
IFVOSE5EIHwNCj4gKyAqIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+ICsgKiB8IFVOSE5EIHwgVU5ITkQgfCBVTkhORCB8IFVOSE5EIHwgVU5ITkQgfA0KPiArICog
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gKyAqLw0KPiArc3Rh
dGljIHZvaWQgKnVwZGF0ZV9tYXBfZXJyKHZvaWQgKmVyciwgdm9pZCAqbmV3KQ0KPiArew0KPiAr
ICAgIGlmICggZXJyID09IFpFUk9fQkxPQ0tfUFRSIHx8IGVyciA9PSBFUlJfUFRSKH5YODZFTVVM
X09LQVkpIHx8DQo+ICsgICAgICAgICBuZXcgPT0gRVJSX1BUUih+WDg2RU1VTF9VTkhBTkRMRUFC
TEUpICkNCj4gKyAgICAgICAgcmV0dXJuIG5ldzsNCj4gKw0KPiArICAgIGlmICggbmV3ID09IEVS
Ul9QVFIoflg4NkVNVUxfT0tBWSkgfHwNCj4gKyAgICAgICAgIGVyciA9PSBFUlJfUFRSKH5YODZF
TVVMX1VOSEFORExFQUJMRSkgKQ0KPiArICAgICAgICByZXR1cm4gZXJyOw0KPiArDQo+ICsgICAg
cmV0dXJuIGVyciA/OiBuZXc7DQo+ICt9DQo+ICsNCj4gKy8qDQo+ICAgICogTWFwIHRoZSBmcmFt
ZShzKSBjb3ZlcmluZyBhbiBpbmRpdmlkdWFsIGxpbmVhciBhY2Nlc3MsIGZvciB3cml0ZWFibGUN
Cj4gICAgKiBhY2Nlc3MuICBNYXkgcmV0dXJuIE5VTEwgZm9yIE1NSU8sIG9yIEVSUl9QVFIoflg4
NkVNVUxfKikgZm9yIG90aGVyIGVycm9ycw0KPiAgICAqIGluY2x1ZGluZyBFUlJfUFRSKH5YODZF
TVVMX09LQVkpIGZvciB3cml0ZS1kaXNjYXJkIG1hcHBpbmdzLg0KPiBAQCAtNTQ0LDcgKzU3NCw3
IEBAIHN0YXRpYyB2b2lkICpodm1lbXVsX21hcF9saW5lYXJfYWRkcigNCj4gICAgICAgc3RydWN0
IGh2bV9lbXVsYXRlX2N0eHQgKmh2bWVtdWxfY3R4dCkNCj4gICB7DQo+ICAgICAgIHN0cnVjdCB2
Y3B1ICpjdXJyID0gY3VycmVudDsNCj4gLSAgICB2b2lkICplcnIsICptYXBwaW5nOw0KPiArICAg
IHZvaWQgKmVyciA9IFpFUk9fQkxPQ0tfUFRSLCAqbWFwcGluZzsNCj4gICAgICAgdW5zaWduZWQg
aW50IG5yX2ZyYW1lcyA9ICgobGluZWFyICsgYnl0ZXMgLSAhIWJ5dGVzKSA+PiBQQUdFX1NISUZU
KSAtDQo+ICAgICAgICAgICAobGluZWFyID4+IFBBR0VfU0hJRlQpICsgMTsNCj4gICAgICAgdW5z
aWduZWQgaW50IGk7DQo+IEBAIC02MDAsMjcgKzYzMCwyOCBAQCBzdGF0aWMgdm9pZCAqaHZtZW11
bF9tYXBfbGluZWFyX2FkZHIoDQo+ICAgICAgICAgICAgICAgZ290byBvdXQ7DQo+ICAgDQo+ICAg
ICAgICAgICBjYXNlIEhWTVRSQU5TX2JhZF9nZm5fdG9fbWZuOg0KPiAtICAgICAgICAgICAgZXJy
ID0gTlVMTDsNCj4gLSAgICAgICAgICAgIGdvdG8gb3V0Ow0KPiArICAgICAgICAgICAgZXJyID0g
dXBkYXRlX21hcF9lcnIoZXJyLCBOVUxMKTsNCj4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0KPiAg
IA0KPiAgICAgICAgICAgY2FzZSBIVk1UUkFOU19nZm5fcGFnZWRfb3V0Og0KPiAgICAgICAgICAg
Y2FzZSBIVk1UUkFOU19nZm5fc2hhcmVkOg0KPiAtICAgICAgICAgICAgZXJyID0gRVJSX1BUUih+
WDg2RU1VTF9SRVRSWSk7DQo+IC0gICAgICAgICAgICBnb3RvIG91dDsNCj4gKyAgICAgICAgICAg
IGVyciA9IHVwZGF0ZV9tYXBfZXJyKGVyciwgRVJSX1BUUih+WDg2RU1VTF9SRVRSWSkpOw0KPiAr
ICAgICAgICAgICAgY29udGludWU7DQo+ICAgDQo+ICAgICAgICAgICBkZWZhdWx0Og0KPiAtICAg
ICAgICAgICAgZ290byB1bmhhbmRsZWFibGU7DQo+ICsgICAgICAgICAgICBlcnIgPSB1cGRhdGVf
bWFwX2VycihlcnIsIEVSUl9QVFIoflg4NkVNVUxfVU5IQU5ETEVBQkxFKSk7DQo+ICsgICAgICAg
ICAgICBjb250aW51ZTsNCj4gICAgICAgICAgIH0NCj4gICANCj4gICAgICAgICAgICptZm4rKyA9
IHBhZ2VfdG9fbWZuKHBhZ2UpOw0KPiAgIA0KPiAgICAgICAgICAgaWYgKCBwMm1faXNfZGlzY2Fy
ZF93cml0ZShwMm10KSApDQo+IC0gICAgICAgIHsNCj4gLSAgICAgICAgICAgIGVyciA9IEVSUl9Q
VFIoflg4NkVNVUxfT0tBWSk7DQo+IC0gICAgICAgICAgICBnb3RvIG91dDsNCj4gLSAgICAgICAg
fQ0KPiArICAgICAgICAgICAgZXJyID0gdXBkYXRlX21hcF9lcnIoZXJyLCBFUlJfUFRSKH5YODZF
TVVMX09LQVkpKTsNCj4gICAgICAgfQ0KPiAgIA0KPiArICAgIGlmICggZXJyICE9IFpFUk9fQkxP
Q0tfUFRSICkNCj4gKyAgICAgICAgZ290byBvdXQ7DQo+ICsNCj4gICAgICAgLyogRW50aXJlIGFj
Y2VzcyB3aXRoaW4gYSBzaW5nbGUgZnJhbWU/ICovDQo+ICAgICAgIGlmICggbnJfZnJhbWVzID09
IDEgKQ0KPiAgICAgICAgICAgbWFwcGluZyA9IG1hcF9kb21haW5fcGFnZShodm1lbXVsX2N0eHQt
Pm1mblswXSk7DQo+IEBAIC02MzksNiArNjcwLDcgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFw
X2xpbmVhcl9hZGRyKA0KPiAgICAgICByZXR1cm4gbWFwcGluZyArIChsaW5lYXIgJiB+UEFHRV9N
QVNLKTsNCj4gICANCj4gICAgdW5oYW5kbGVhYmxlOg0KPiArICAgIEFTU0VSVChlcnIgPT0gWkVS
T19CTE9DS19QVFIpOw0KPiAgICAgICBlcnIgPSBFUlJfUFRSKH5YODZFTVVMX1VOSEFORExFQUJM
RSk7DQo+ICAgDQo+ICAgIG91dDoNCj4gDQo+IA0KPiANCj4gDQo+IA0KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0DQo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsDQo+IA0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
