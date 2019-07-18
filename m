Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B526A6CEF9
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:37:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6Xf-0001Du-8n; Thu, 18 Jul 2019 13:33:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho6Xd-0001Dm-9r
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:33:49 +0000
X-Inumbo-ID: a89a26f1-a960-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a89a26f1-a960-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 13:33:47 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 13:33:42 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 13:33:21 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 13:33:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9Aw/qQ6uVTK5IQF+coEJ30zp83z8SzmMyqo4IstxgAhrUnaKvB+HRKdCNQE247n9QwctW4i5WjQq0w0BeN5TJOPidx6qWae3RzheQ19q+INBR2IRso8KLyqnEPVBTxukC/9y1MZpyyd3c1W90dZ9geNLHtob7iCVwqLxp9AqSSNt7FQsOK7ewXuQ1coDWzJNcKk9Qc8BSwfkFxgn1GVg/PkC0ho1ybaRvDkNbRaRXWjb2IXd8lAkgqXkjVQ2yHE5a1U84ssrq8Nn+7F1GHmXjHJPOx7Tc3uy9LJg7wzLMYplZDUm8FAof7FrGJ7Xo0/4dF5y0kFv+IVQqQ03IQ21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POxQVjRTtYuatpM93ckuMERUOnhI6rWQFIzWV5cieBs=;
 b=NF0kvS0wdS8tUR8N/ykTY3vC+pjTUWLa7TW6o7X/D7lvzbbGS6LTyFOvDXi/5vdK9IzYRCfh2+9m2E+g+xd5eNs/BtxkJb7PO09kbjRZth2DJleVL31YZLLteX7QVVRksUZP2i0sxhUwRJ3HN6vsKwD0lRwLIHni1Z7e1XK7AYMm1pKMFjul8VW0Hzhz/eEc/MTFw1dhYvhM58JipZo0+TqnjwblAjV0MjuHRkOvrobglwlfj5OhW5tx5SEiiEH0oEpvR3NfJGWDy9etHLhqwIuLROcrbpnapb90gTc5opxOBl+kVMHBGfcL0HWTqmEWxra7a/5Lu9/dELGRQFbKzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2812.namprd18.prod.outlook.com (20.179.50.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 13:33:20 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 13:33:20 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [Xen-devel] [PATCH v6 1/5] x86/mem_sharing: reorder when pages
 are unlocked and released
Thread-Index: AQHVPNaoMN4/6VqHlEm91bwrx18tx6bQMluAgAAkhnuAAARMgIAAAL3BgAAFHgA=
Date: Thu, 18 Jul 2019 13:33:20 +0000
Message-ID: <6e2986dd-5416-4ef3-c00b-eca4db578e7c@suse.com>
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-2-tamas@tklengyel.com>
 <66bbd9f7-12f9-b654-555d-a02d5f4f0dba@suse.com>
 <CABfawhkJR8sz8cVCfcuxQ-4+xoQOSTs-XQuow-qzPyd4xZwq0g@mail.gmail.com>
 <b6cdc457-01e8-03cf-5408-11337e5a10d9@suse.com>
 <CABfawhkAcoHm_+5ob6nge4xELUvpb4kZXoC+n_7sF-PNK+untQ@mail.gmail.com>
In-Reply-To: <CABfawhkAcoHm_+5ob6nge4xELUvpb4kZXoC+n_7sF-PNK+untQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR05CA0040.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::17) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bc5a499-f79c-4590-448f-08d70b847fe7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2812; 
x-ms-traffictypediagnostic: DM6PR18MB2812:
x-microsoft-antispam-prvs: <DM6PR18MB2812B127BC9C40C17029EC7EB3C80@DM6PR18MB2812.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(189003)(199004)(6512007)(14454004)(5660300002)(53936002)(6486002)(6116002)(6246003)(229853002)(81156014)(3846002)(14444005)(66066001)(86362001)(7736002)(66946007)(478600001)(68736007)(99286004)(36756003)(305945005)(6916009)(476003)(81166006)(80792005)(102836004)(8676002)(486006)(31686004)(26005)(25786009)(446003)(11346002)(8936002)(186003)(2616005)(316002)(53546011)(4326008)(66476007)(386003)(71200400001)(64756008)(31696002)(54906003)(6506007)(66446008)(66556008)(6436002)(76176011)(256004)(52116002)(2906002)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2812;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4JvVpFRNTrGNO35zf4LDgnBqhvzssBm2FK1sRsFIH1cCxKcpmaqNiTBFOlMPO1LTJIaucfxwMJAB3wOGOYuMEKBgEtG3icBNlRAVjjJ9pJDu7U250Hj85dRzhkZ4TpCxtf2wipz8L1YqxAZm3QS8DJ/L1480uIITnw6dRvCjkL7K/rA82fZNJl18ENhfGn8blBEcxsSXs7RmM2r6B5yYIYJ1ngBx9EZr1O7fg6NvPzPuSqXNQWFQfQOUTPmpo490/JIl/r14xsrSZjA6iuIeUVxA9NU0KgYIDg7fjCOoy2NWcHNg++K3pk0k3H7kappcIY7gXJePSFu0HYz+Hcf7GjB+LhZx9GzxkgC8m0g4zUGbRZyU72fZsUvu18Y1VghIOO5NkSd3T6Ub260IdlPZzQk+LQ5P5y3RnKM+DK4LNEo=
Content-ID: <50E204679D620B46B19B1793AA20A6DF@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc5a499-f79c-4590-448f-08d70b847fe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 13:33:20.7065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2812
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v6 1/5] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxNToxMywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBPbiBUaHUsIEp1
bCAxOCwgMjAxOSBhdCA3OjEyIEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6DQo+Pg0KPj4gT24gMTguMDcuMjAxOSAxNDo1NSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0K
Pj4+IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDQ6NDcgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4+Pj4gT24gMTcuMDcuMjAxOSAyMTozMywgVGFtYXMgSyBMZW5n
eWVsIHdyb3RlOg0KPj4+Pj4gQEAgLTkwMCw2ICs4OTUsNyBAQCBzdGF0aWMgaW50IHNoYXJlX3Bh
Z2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBzaHJfaGFuZGxlX3Qgc2gsDQo+Pj4+
PiAgICAgICAgIHAybV90eXBlX3Qgc21mbl90eXBlLCBjbWZuX3R5cGU7DQo+Pj4+PiAgICAgICAg
IHN0cnVjdCB0d29fZ2ZucyB0ZzsNCj4+Pj4+ICAgICAgICAgc3RydWN0IHJtYXBfaXRlcmF0b3Ig
cmk7DQo+Pj4+PiArICAgIHVuc2lnbmVkIGxvbmcgcHV0X2NvdW50ID0gMDsNCj4+Pj4+DQo+Pj4+
PiAgICAgICAgIGdldF90d29fZ2ZucyhzZCwgc2dmbiwgJnNtZm5fdHlwZSwgTlVMTCwgJnNtZm4s
DQo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICBjZCwgY2dmbiwgJmNtZm5fdHlwZSwgTlVMTCwg
JmNtZm4sIDAsICZ0Zyk7DQo+Pj4+PiBAQCAtOTY0LDE1ICs5NjAsNiBAQCBzdGF0aWMgaW50IHNo
YXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBzaHJfaGFuZGxlX3Qgc2gs
DQo+Pj4+PiAgICAgICAgICAgICBnb3RvIGVycl9vdXQ7DQo+Pj4+PiAgICAgICAgIH0NCj4+Pj4+
DQo+Pj4+PiAtICAgIC8qIEFjcXVpcmUgYW4gZXh0cmEgcmVmZXJlbmNlLCBmb3IgdGhlIGZyZWVp
bmcgYmVsb3cgdG8gYmUgc2FmZS4gKi8NCj4+Pj4+IC0gICAgaWYgKCAhZ2V0X3BhZ2UoY3BhZ2Us
IGRvbV9jb3cpICkNCj4+Pj4+IC0gICAgew0KPj4+Pj4gLSAgICAgICAgcmV0ID0gLUVPVkVSRkxP
VzsNCj4+Pj4+IC0gICAgICAgIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKHNlY29uZHBnKTsNCj4+
Pj4+IC0gICAgICAgIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKGZpcnN0cGcpOw0KPj4+Pj4gLSAg
ICAgICAgZ290byBlcnJfb3V0Ow0KPj4+Pj4gLSAgICB9DQo+Pj4+PiAtDQo+Pj4+PiAgICAgICAg
IC8qIE1lcmdlIHRoZSBsaXN0cyB0b2dldGhlciAqLw0KPj4+Pj4gICAgICAgICBybWFwX3NlZWRf
aXRlcmF0b3IoY3BhZ2UsICZyaSk7DQo+Pj4+PiAgICAgICAgIHdoaWxlICggKGdmbiA9IHJtYXBf
aXRlcmF0ZShjcGFnZSwgJnJpKSkgIT0gTlVMTCkNCj4+Pj4+IEBAIC05ODQsMTMgKzk3MSwxNCBA
QCBzdGF0aWMgaW50IHNoYXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBz
aHJfaGFuZGxlX3Qgc2gsDQo+Pj4+PiAgICAgICAgICAgICAgKiBEb24ndCBjaGFuZ2UgdGhlIHR5
cGUgb2Ygcm1hcCBmb3IgdGhlIGNsaWVudCBwYWdlLiAqLw0KPj4+Pj4gICAgICAgICAgICAgcm1h
cF9kZWwoZ2ZuLCBjcGFnZSwgMCk7DQo+Pj4+PiAgICAgICAgICAgICBybWFwX2FkZChnZm4sIHNw
YWdlKTsNCj4+Pj4+IC0gICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKGNwYWdlKTsNCj4+Pj4+ICsg
ICAgICAgIHB1dF9jb3VudCsrOw0KPj4+Pj4gICAgICAgICAgICAgZCA9IGdldF9kb21haW5fYnlf
aWQoZ2ZuLT5kb21haW4pOw0KPj4+Pj4gICAgICAgICAgICAgQlVHX09OKCFkKTsNCj4+Pj4+ICAg
ICAgICAgICAgIEJVR19PTihzZXRfc2hhcmVkX3AybV9lbnRyeShkLCBnZm4tPmdmbiwgc21mbikp
Ow0KPj4+Pj4gICAgICAgICAgICAgcHV0X2RvbWFpbihkKTsNCj4+Pj4+ICAgICAgICAgfQ0KPj4+
Pj4gICAgICAgICBBU1NFUlQobGlzdF9lbXB0eSgmY3BhZ2UtPnNoYXJpbmctPmdmbnMpKTsNCj4+
Pj4+ICsgICAgQlVHX09OKCFwdXRfY291bnQpOw0KPj4+Pj4NCj4+Pj4+ICAgICAgICAgLyogQ2xl
YXIgdGhlIHJlc3Qgb2YgdGhlIHNoYXJlZCBzdGF0ZSAqLw0KPj4+Pj4gICAgICAgICBwYWdlX3No
YXJpbmdfZGlzcG9zZShjcGFnZSk7DQo+Pj4+PiBAQCAtMTAwMSw3ICs5ODksOSBAQCBzdGF0aWMg
aW50IHNoYXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBzaHJfaGFuZGxl
X3Qgc2gsDQo+Pj4+Pg0KPj4+Pj4gICAgICAgICAvKiBGcmVlIHRoZSBjbGllbnQgcGFnZSAqLw0K
Pj4+Pj4gICAgICAgICBwdXRfcGFnZV9hbGxvY19yZWYoY3BhZ2UpOw0KPj4+Pj4gLSAgICBwdXRf
cGFnZShjcGFnZSk7DQo+Pj4+PiArDQo+Pj4+PiArICAgIHdoaWxlICggcHV0X2NvdW50LS0gKQ0K
Pj4+Pj4gKyAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUoY3BhZ2UpOw0KPj4+Pj4NCj4+Pj4+ICAg
ICAgICAgLyogV2UgbWFuYWdlZCB0byBmcmVlIGEgZG9tYWluIHBhZ2UuICovDQo+Pj4+PiAgICAg
ICAgIGF0b21pY19kZWMoJm5yX3NoYXJlZF9tZm5zKTsNCj4+Pj4+IEBAIC0xMTY1LDE5ICsxMTU1
LDEzIEBAIGludCBfX21lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1Y3QgZG9tYWluICpkLA0K
Pj4+Pj4gICAgICAgICB7DQo+Pj4+PiAgICAgICAgICAgICBpZiAoICFsYXN0X2dmbiApDQo+Pj4+
PiAgICAgICAgICAgICAgICAgbWVtX3NoYXJpbmdfZ2ZuX2Rlc3Ryb3kocGFnZSwgZCwgZ2ZuX2lu
Zm8pOw0KPj4+Pj4gLSAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUocGFnZSk7DQo+Pj4+PiArDQo+
Pj4+PiAgICAgICAgICAgICBtZW1fc2hhcmluZ19wYWdlX3VubG9jayhwYWdlKTsNCj4+Pj4+ICsN
Cj4+Pj4+ICAgICAgICAgICAgIGlmICggbGFzdF9nZm4gKQ0KPj4+Pj4gLSAgICAgICAgew0KPj4+
Pj4gLSAgICAgICAgICAgIGlmICggIWdldF9wYWdlKHBhZ2UsIGRvbV9jb3cpICkNCj4+Pj4+IC0g
ICAgICAgICAgICB7DQo+Pj4+PiAtICAgICAgICAgICAgICAgIHB1dF9nZm4oZCwgZ2ZuKTsNCj4+
Pj4+IC0gICAgICAgICAgICAgICAgZG9tYWluX2NyYXNoKGQpOw0KPj4+Pj4gLSAgICAgICAgICAg
ICAgICByZXR1cm4gLUVPVkVSRkxPVzsNCj4+Pj4+IC0gICAgICAgICAgICB9DQo+Pj4+PiAgICAg
ICAgICAgICAgICAgcHV0X3BhZ2VfYWxsb2NfcmVmKHBhZ2UpOw0KPj4+Pj4gLSAgICAgICAgICAg
IHB1dF9wYWdlKHBhZ2UpOw0KPj4+Pj4gLSAgICAgICAgfQ0KPj4+Pj4gKw0KPj4+Pj4gKyAgICAg
ICAgcHV0X3BhZ2VfYW5kX3R5cGUocGFnZSk7DQo+Pj4+PiAgICAgICAgICAgICBwdXRfZ2ZuKGQs
IGdmbik7DQo+Pj4+Pg0KPj4+Pj4gICAgICAgICAgICAgcmV0dXJuIDA7DQo+Pj4+DQo+Pj4+IC4u
LiB0aGlzIChtYWluLCBhcyBJIGd1ZXNzIGJ5IHRoZSB0aXRsZSkgcGFydCBvZiB0aGUgY2hhbmdl
PyBJIHRoaW5rDQo+Pj4+IHlvdSB3YW50IHRvIGV4cGxhaW4gd2hhdCB3YXMgd3JvbmcgaGVyZSBh
bmQvb3Igd2h5IHRoZSBuZXcgYXJyYW5nZW1lbnQNCj4+Pj4gaXMgYmV0dGVyLiAoSSdtIHNvcnJ5
LCBJIGd1ZXNzIGl0IHdhcyB0aGlzIHdheSBvbiBwcmlvciB2ZXJzaW9ucw0KPj4+PiBhbHJlYWR5
LCBidXQgYXBwYXJlbnRseSBJIGRpZG4ndCBub3RpY2UuKQ0KPj4+DQo+Pj4gSXQncyB3aGF0IHRo
ZSBwYXRjaCBtZXNzYWdlIHNheXMgLSBjYWxsaW5nIHB1dF9wYWdlX2FuZF90eXBlIGJlZm9yZQ0K
Pj4+IG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrIGNhbiBjYXVzZSBhIGRlYWRsb2NrLiBTaW5jZSBu
b3cgd2UgYXJlIG5vdw0KPj4+IGhvbGRpbmcgYSByZWZlcmVuY2UgdG8gdGhlIHBhZ2UgdGlsbCB0
aGUgZW5kIHRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoZQ0KPj4+IGV4dHJhIGdldF9wYWdlL3B1dF9w
YWdlIGxvZ2ljIHdoZW4gd2UgYXJlIGRlYWxpbmcgd2l0aCB0aGUgbGFzdF9nZm4uDQo+Pg0KPj4g
VGhlIHRpdGxlIHNheXMgInJlb3JkZXIiIHdpdGhvdXQgYW55ICJ3aHkiLg0KPiANCj4gWWVzLCBJ
IGNhbid0IHJlYXNvbmFibHkgZml0ICJDYWxsaW5nIF9wdXRfcGFnZV90eXBlIHdoaWxlIGFsc28g
aG9sZGluZw0KPiB0aGUgcGFnZV9sb2NrIGZvciB0aGF0IHBhZ2UgY2FuIGNhdXNlIGEgZGVhZGxv
Y2suIiBpbnRvIHRoZSB0aXRsZS4gU28NCj4gaXQncyBzcGVsbGVkIG91dCBpbiB0aGUgcGF0Y2gg
bWVzc2FnZS4NCg0KT2YgY291cnNlIG5vdC4gQW5kIEkgcmVhbGl6ZSBfcGFydF8gb2YgdGhlIGNo
YW5nZXMgaXMgaW5kZWVkIHdoYXQgdGhlDQp0aXRsZSBzYXlzIChhbHRob3VnaCBmb3Igc2hhcmVf
cGFnZXMoKSB0aGF0J3Mgbm90IG9idmlvdXMgZnJvbSB0aGUNCnBhdGNoIGFsb25lKS4gQnV0IHlv
dSBkbyBtb3JlOiBZb3UgYWxzbyBhdm9pZCBhY3F1aXJpbmcgYW4gZXh0cmENCnJlZmVyZW5jZSBp
biBzaGFyZV9wYWdlcygpLg0KDQpBbmQgc2luY2UgeW91IG1hZGUgbWUgbG9vayBhdCB0aGUgY29k
ZSBhZ2FpbjogSWYgcHV0X3BhZ2UoKSBpcyB1bnNhZmUNCndpdGggYSBsb2NrIGhlbGQsIGhvdyBj
b21lIHRoZSBnZXRfcGFnZV9hbmRfdHlwZSgpIGluIHNoYXJlX3BhZ2VzKCkNCmlzIHNhZmUgd2l0
aCB0d28gc3VjaCBsb2NrcyBoZWxkPyBJZiBpdCByZWFsbHkgaXMsIGl0IHN1cmVseSB3b3VsZCBi
ZQ0Kd29ydGh3aGlsZSB0byBzdGF0ZSBpbiB0aGUgZGVzY3JpcHRpb24uIFRoZXJlJ3MgYW5vdGhl
ciBzdWNoIGluc3RhbmNlDQppbiBtZW1fc2hhcmluZ19hZGRfdG9fcGh5c21hcCgpIChwbHVzIGEg
Z2V0X3BhZ2UoKSksIGFuZCBhbHNvIG9uZQ0Kd2hlcmUgcHV0X3BhZ2VfYW5kX3R5cGUoKSBnZXRz
IGNhbGxlZCB3aXRoIHN1Y2ggYSBsb2NrIGhlbGQgKGFmYWljcykuDQoNCkphbg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
