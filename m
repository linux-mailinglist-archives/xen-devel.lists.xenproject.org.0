Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A33555B951
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 12:48:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhtnw-0005pG-0v; Mon, 01 Jul 2019 10:45:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uHYc=U6=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hhtnu-0005pB-KN
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 10:44:58 +0000
X-Inumbo-ID: 43d69619-9bed-11e9-8980-bc764e045a96
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::627])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 43d69619-9bed-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9Tdrv8pQhnofgu8TumUjeqVnfULeKSTve+/GdjBwV8=;
 b=OdqFrEqy8RBJLsWtEKiIH75nqn0j/Jq8JTfxV0U6EpHSxWD9ElHGe6rdiLZrL297b96TyXGTMcuuldz//9mjHUd/Z8TmHU/SPpE8Ef627nvlBPSvoO2gv5cjaBr8HSkqKFGn910Jj44a/dbVZVnbLTpn+Q9YA0UjmnGOX2fVISbkNOeD0ly0+vSxmXVg/bL2neCWuCZNr0ayGLGvyGze0luT8LGQOcvmOQ5mCq3fDU/ielutqC+Rb6qFxx3p2kGzjonX7fEl31kQBor3yUfK1ahtUEAFh3+AGCIWVRCdyPF++zRss6Fe/6eqhdDtRfB4+Uw0edzwgEm1oV/KUaS9oQ==
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com (20.177.32.75) by
 AM6PR03MB4008.eurprd03.prod.outlook.com (20.177.38.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 10:44:54 +0000
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::24cd:dc66:cc1b:ac70]) by AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::24cd:dc66:cc1b:ac70%3]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 10:44:54 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] arm/optee: Fix arm32 build
Thread-Index: AQHVLbP638mJy0ck3UyL5AGuFAdKA6a1mJ+A
Date: Mon, 1 Jul 2019 10:44:54 +0000
Message-ID: <87y31irq3e.fsf@epam.com>
References: <20190628131821.19690-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190628131821.19690-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61d0fa2e-f205-416b-6b18-08d6fe11271d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR03MB4008; 
x-ms-traffictypediagnostic: AM6PR03MB4008:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR03MB4008A7D463A86B4A876651CCE6F90@AM6PR03MB4008.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(199004)(189003)(478600001)(53936002)(86362001)(966005)(81156014)(68736007)(81166006)(6306002)(80792005)(6512007)(6916009)(8676002)(71200400001)(256004)(14444005)(107886003)(71190400001)(25786009)(99286004)(4326008)(14454004)(5660300002)(2906002)(8936002)(6506007)(316002)(76116006)(26005)(76176011)(54906003)(72206003)(6486002)(66946007)(66556008)(64756008)(66446008)(73956011)(66476007)(229853002)(446003)(6436002)(11346002)(476003)(66066001)(55236004)(2616005)(6116002)(186003)(102836004)(36756003)(486006)(3846002)(7736002)(305945005)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB4008;
 H:AM6PR03MB4150.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vyR4p9UBTkBpaDsvoOYYB4Z1a/qfsE+B8GHN4mwA2jIgaG3bqONrVfiojrTMTz5Y+BBYkPnqivadir/mZVQqG+HZJ31lrHUs0zXBusuURPbOJ5GvlPCz2fhlgj1dD5TF7cURorL0wvRF1sb95AYJQJvYJ/VESIYhMaFYCXDldM+RU6h0HEWJu5zm5nNumz/0Bx5MXLmeXRAnT4vHMj27a5smvAPs+NnhlKYFAvxwrgTtKp6s6mUDAtoUb1uyOmX1SgyzGpPz/B0IDWLCcj6pJPHobXhHHpT4mxP2fBQDhXh+Il+50cYfJd3M2aUbskmLKWiefD+rxxKVxT0zRe5Z/V5JJ7q4MbjE9gUgOvPKH9rNeD4NlRFRn8bwsDSN1fc9AOBTd9tuynwbzU5784N+81zSQzMVIJUgsjkIQHmA9oU=
Content-ID: <48CB74AEDE3A5046814A9F5237794622@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d0fa2e-f205-416b-6b18-08d6fe11271d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 10:44:54.2622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4008
Subject: Re: [Xen-devel] [PATCH] arm/optee: Fix arm32 build
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpIaSBBbmRyZXcsDQoNCkFuZHJldyBDb29wZXIgd3JpdGVzOg0KDQo+IEEgVHJhdmlzIHJhbmRj
b25maWcgYnVpbGQgbm90aWNlczoNCj4NCj4gb3B0ZWUuYzogSW4gZnVuY3Rpb24g4oCYYWxsb2Nh
dGVfYW5kX3Bpbl9zaG1fcnBj4oCZOg0KPiBvcHRlZS5jOjM4MzoxMzogZXJyb3I6IGZvcm1hdCDi
gJglbHjigJkgZXhwZWN0cyBhcmd1bWVudCBvZiB0eXBlDQo+ICAgIOKAmGxvbmcgdW5zaWduZWQg
aW504oCZLCBidXQgYXJndW1lbnQgNSBoYXMgdHlwZSDigJh1aW50NjRfdOKAmSBbLVdlcnJvcj1m
b3JtYXQ9XQ0KPiAgICAgZ2RwcmludGsoWEVOTE9HX1dBUk5JTkcsICJHdWVzdCB0cmllcyB0byB1
c2UgdGhlIHNhbWUgUlBDIFNITSBjb29raWUgJWx4XG4iLA0KPiAgICAgICAgICAgICAgXg0KPg0K
PiBVc2UgUFJJeDY0IGluc3RlYWQgb2YgJWx4DQo+DQo+IEZ1bGwgbG9ncyBodHRwczovL3RyYXZp
cy1jaS5vcmcvYW5keWhocC94ZW4vam9icy81NTE3NTQyNTMNCj4NCj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCkFja2VkLWJ5OiBWb2xv
ZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+DQoNCj4gLS0tDQo+IEND
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IENDOiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPiBDQzogVm9sb2R5bXlyIEJhYmNodWsg
PFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiAtLS0NCj4gIHhlbi9hcmNoL2FybS90ZWUv
b3B0ZWUuYyB8IDE4ICsrKysrKysrKysrKy0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vdGVlL29wdGVlLmMgYi94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMNCj4gaW5kZXggNjEwMjk4
NTVkNC4uMWQ3OWMyYzE1OSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5j
DQo+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYw0KPiBAQCAtMzgwLDcgKzM4MCw4IEBA
IHN0YXRpYyBzdHJ1Y3Qgc2htX3JwYyAqYWxsb2NhdGVfYW5kX3Bpbl9zaG1fcnBjKHN0cnVjdCBv
cHRlZV9kb21haW4gKmN0eCwNCj4gICAgICAgICAgaWYgKCBzaG1fcnBjX3RtcC0+Y29va2llID09
IGNvb2tpZSApDQo+ICAgICAgICAgIHsNCj4gICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZjdHgt
PmxvY2spOw0KPiAtICAgICAgICAgICAgZ2RwcmludGsoWEVOTE9HX1dBUk5JTkcsICJHdWVzdCB0
cmllcyB0byB1c2UgdGhlIHNhbWUgUlBDIFNITSBjb29raWUgJWx4XG4iLA0KPiArICAgICAgICAg
ICAgZ2RwcmludGsoWEVOTE9HX1dBUk5JTkcsDQo+ICsgICAgICAgICAgICAgICAgICAgICAiR3Vl
c3QgdHJpZXMgdG8gdXNlIHRoZSBzYW1lIFJQQyBTSE0gY29va2llICUiUFJJeDY0IlxuIiwNCj4g
ICAgICAgICAgICAgICAgICAgICAgIGNvb2tpZSk7DQo+ICAgICAgICAgICAgICBnb3RvIGVycjsN
Cj4gICAgICAgICAgfQ0KPiBAQCAtNDkzLDcgKzQ5NCw4IEBAIHN0YXRpYyBzdHJ1Y3Qgb3B0ZWVf
c2htX2J1ZiAqYWxsb2NhdGVfb3B0ZWVfc2htX2J1ZihzdHJ1Y3Qgb3B0ZWVfZG9tYWluICpjdHgs
DQo+ICAgICAgICAgIGlmICggb3B0ZWVfc2htX2J1Zl90bXAtPmNvb2tpZSA9PSBjb29raWUgKQ0K
PiAgICAgICAgICB7DQo+ICAgICAgICAgICAgICBzcGluX3VubG9jaygmY3R4LT5sb2NrKTsNCj4g
LSAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAiR3Vlc3QgdHJpZXMgdG8gdXNl
IHRoZSBzYW1lIFNITSBidWZmZXIgY29va2llICVseFxuIiwNCj4gKyAgICAgICAgICAgIGdkcHJp
bnRrKFhFTkxPR19XQVJOSU5HLA0KPiArICAgICAgICAgICAgICAgICAgICAgIkd1ZXN0IHRyaWVz
IHRvIHVzZSB0aGUgc2FtZSBTSE0gYnVmZmVyIGNvb2tpZSAlIlBSSXg2NCJcbiIsDQo+ICAgICAg
ICAgICAgICAgICAgICAgICBjb29raWUpOw0KPiAgICAgICAgICAgICAgZXJyX2NvZGUgPSAtRUlO
VkFMOw0KPiAgICAgICAgICAgICAgZ290byBlcnI7DQo+IEBAIC01NzQsNyArNTc2LDggQEAgc3Rh
dGljIHZvaWQgZnJlZV9vcHRlZV9zaG1fYnVmX3BnX2xpc3Qoc3RydWN0IG9wdGVlX2RvbWFpbiAq
Y3R4LA0KPiAgICAgIGlmICggZm91bmQgKQ0KPiAgICAgICAgICBmcmVlX3BnX2xpc3Qob3B0ZWVf
c2htX2J1Zik7DQo+ICAgICAgZWxzZQ0KPiAtICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJSLCAi
Q2FuJ3QgZmluZCBwYWdlbGlzdCBmb3IgU0hNIGJ1ZmZlciB3aXRoIGNvb2tpZSAlbHggdG8gZnJl
ZSBpdFxuIiwNCj4gKyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwNCj4gKyAgICAgICAgICAg
ICAgICAgIkNhbid0IGZpbmQgcGFnZWxpc3QgZm9yIFNITSBidWZmZXIgd2l0aCBjb29raWUgJSJQ
Ukl4NjQiIHRvIGZyZWUgaXRcbiIsDQo+ICAgICAgICAgICAgICAgICAgIGNvb2tpZSk7DQo+ICB9
DQo+ICANCj4gQEAgLTEwMTgsNyArMTAyMSw4IEBAIHN0YXRpYyBpbnQgaGFuZGxlX3JwY19yZXR1
cm4oc3RydWN0IG9wdGVlX2RvbWFpbiAqY3R4LA0KPiAgICAgICAgICAgICAgICogd2lsbCBvdmVy
d3JpdGUgaXQgd2l0aCBhY3R1YWwgcmVzdWx0LiBTbyB3ZSBjYW4ganVzdA0KPiAgICAgICAgICAg
ICAgICogY29udGludWUgdGhlIGNhbGwuDQo+ICAgICAgICAgICAgICAgKi8NCj4gLSAgICAgICAg
ICAgIGdwcmludGsoWEVOTE9HX0VSUiwgIkNhbid0IGZpbmQgU0hNLVJQQyB3aXRoIGNvb2tpZSAl
bHhcbiIsIGNvb2tpZSk7DQo+ICsgICAgICAgICAgICBncHJpbnRrKFhFTkxPR19FUlIsICJDYW4n
dCBmaW5kIFNITS1SUEMgd2l0aCBjb29raWUgJSJQUkl4NjQiXG4iLA0KPiArICAgICAgICAgICAg
ICAgICAgICBjb29raWUpOw0KPiAgDQo+ICAgICAgICAgICAgICByZXR1cm4gLUVSRVNUQVJUOw0K
PiAgICAgICAgICB9DQo+IEBAIC0xMjE5LDcgKzEyMjMsOCBAQCBzdGF0aWMgdm9pZCBoYW5kbGVf
cnBjX2NtZF9hbGxvYyhzdHJ1Y3Qgb3B0ZWVfZG9tYWluICpjdHgsDQo+ICAgICAgaWYgKCBzaG1f
cnBjLT54ZW5fYXJnLT5wYXJhbXNbMF0uYXR0ciAhPSAoT1BURUVfTVNHX0FUVFJfVFlQRV9UTUVN
X09VVFBVVCB8DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgT1BURUVfTVNHX0FUVFJfTk9OQ09OVElHKSApDQo+ICAgICAgew0KPiAtICAgICAgICBnZHBy
aW50ayhYRU5MT0dfV0FSTklORywgIkludmFsaWQgYXR0cnMgZm9yIHNoYXJlZCBtZW0gYnVmZmVy
OiAlbHhcbiIsDQo+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLA0KPiArICAgICAg
ICAgICAgICAgICAiSW52YWxpZCBhdHRycyBmb3Igc2hhcmVkIG1lbSBidWZmZXI6ICUiUFJJeDY0
IlxuIiwNCj4gICAgICAgICAgICAgICAgICAgc2htX3JwYy0+eGVuX2FyZy0+cGFyYW1zWzBdLmF0
dHIpOw0KPiAgICAgICAgICByZXR1cm47DQo+ICAgICAgfQ0KPiBAQCAtMTI2OCw3ICsxMjczLDgg
QEAgc3RhdGljIHZvaWQgaGFuZGxlX3JwY19jbWQoc3RydWN0IG9wdGVlX2RvbWFpbiAqY3R4LCBz
dHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywNCj4gIA0KPiAgICAgIGlmICggIXNobV9ycGMgKQ0K
PiAgICAgIHsNCj4gLSAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIkNhbid0IGZpbmQgU0hN
LVJQQyB3aXRoIGNvb2tpZSAlbHhcbiIsIGNvb2tpZSk7DQo+ICsgICAgICAgIGdkcHJpbnRrKFhF
TkxPR19FUlIsICJDYW4ndCBmaW5kIFNITS1SUEMgd2l0aCBjb29raWUgJSJQUkl4NjQiXG4iLA0K
PiArICAgICAgICAgICAgICAgICBjb29raWUpOw0KPiAgICAgICAgICByZXR1cm47DQo+ICAgICAg
fQ0KDQoNCi0tIA0KQmVzdCByZWdhcmRzLFZvbG9keW15ciBCYWJjaHVrCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
