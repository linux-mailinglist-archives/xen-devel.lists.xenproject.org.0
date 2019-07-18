Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC0C6CE9A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:10:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho68d-0006q2-EW; Thu, 18 Jul 2019 13:07:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho68b-0006px-62
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:07:57 +0000
X-Inumbo-ID: 0d906fd8-a95d-11e9-a7cd-f3fff764834b
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d906fd8-a95d-11e9-a7cd-f3fff764834b;
 Thu, 18 Jul 2019 13:07:54 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 13:04:01 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 13:07:20 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 13:07:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKs5RNAQqcWOYjUREf97SgForimAkyaD4WNc4uUAngUdbu1bSDgdd7nTzgFOc1TMfQQXviPWZHGdLJsEX7LkxEcDPP8JJyYLIa7Dp4UpZw5KbAk6cJhJ0zThKzHGdvrvEmgWIcKoPWfV/K8DamQVHLrUvFAP5XQaAqiRtduM4cixa8langBicWqZNAn5BLRWhCuZyf2LvXFr2QI46IGkTTXDrAnSixJTx14M6sRZzIJTFYc+XvhE8QzNwtx+Yc6YTd4+1yHvkw5MDlK0yXUaJFm3SZPIyy4KTzi5dyGPHQiwl7L26G3WwEKVMY0QjZnkU6JMzExMfA/lxDYmC3giDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iE8oRu2KShXQklDKQVC8+SgicMoWfy/LJz8l6mN6VE=;
 b=Axz33imlbWp8FRbBdYvnXzRBuYcq46oawCdP5H9nRAy4zVf5lakOOP5AnUBpmlUdWcBNp/k9KPVw9yGosStk1mM7kjpTQO+11MDcopqgl+c8OZPQLk9rvYHJwnqKpVMUvhXVWII5VyUBGFFNChezIgyvHJH2VvDaJrEe39/mUS8vf1T8a3I7nZIcR8BtaYQLLc03j9YccRK2OKn6BGIbdvFud+j1dDnKQMUTsbhqaaUGsX//Qa4SifZ6rFuA15gM3xtsSGYbQLPGpbWf72/5uJ+KWMhnxeY2PibZi2kGFSjybkax3zYgJlzVhhwXAgbyR+zsGN6rWU172KEFU5mk9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2540.namprd18.prod.outlook.com (20.179.105.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 13:07:19 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 13:07:19 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 1/2] x86/cpu/intel: Clear cache self-snoop capability in
 CPUs with known errata
Thread-Index: AQHVPWGy1ek8AecLnECtUEoEAro4wqbQTIu9gAAMIwA=
Date: Thu, 18 Jul 2019 13:07:19 +0000
Message-ID: <dadc1871-02eb-3312-9e5f-bb4cebc1308c@suse.com>
References: <31d4cb3f-6ff0-a13c-00ce-bced77c6dd78@suse.com>
 <05257008-13e3-0d49-cd1d-6a8c9eee2ce5@suse.com>
 <d643e3c0-fd02-3427-b241-a707eaaf5d52@citrix.com>
In-Reply-To: <d643e3c0-fd02-3427-b241-a707eaaf5d52@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0100.eurprd07.prod.outlook.com
 (2603:10a6:6:2c::14) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d553b2a-d7bb-446c-2a3f-08d70b80dd5a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2540; 
x-ms-traffictypediagnostic: DM6PR18MB2540:
x-microsoft-antispam-prvs: <DM6PR18MB25402045BB1F48597B93FEF0B3C80@DM6PR18MB2540.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(189003)(199004)(54094003)(8676002)(99286004)(54906003)(31696002)(71200400001)(86362001)(6246003)(6916009)(7736002)(6506007)(316002)(305945005)(4326008)(229853002)(80792005)(71190400001)(386003)(53546011)(68736007)(64756008)(81156014)(66556008)(66446008)(81166006)(8936002)(66946007)(5660300002)(31686004)(52116002)(76176011)(6512007)(2906002)(66476007)(53936002)(26005)(102836004)(186003)(6486002)(476003)(2616005)(66066001)(36756003)(6116002)(3846002)(6436002)(446003)(11346002)(14454004)(486006)(25786009)(256004)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2540;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: J74GmpAbuC81uwoLlxRIG5USpSJfVWAsPipUQicpQqbE5YI0BpHxSQ1zCfGnWOr+6eDcMYIBQF61h81fuvlfvDodlTGiIU28m02YVCrotV7fLpEFftGE/sOQheo8uN3tSqtiLf4FARdyCdrgiORjQtQpt0CzkKY7pIib6f/HUQfCK66NG9c23k2ukncWbnxfrQAwYZp9dSy8faQLMh5nXX0h55izRoILOl4QQY2x+/OrzSXDzxXNjkoMMvqhxXpCfaB8LCQg++ZDWj6NLsOG4mM9bN0gaRdRuva5ttDOLpXXAg/hYekreGpXoWKeMw9W2P7ZBplA5A7QQ6xNFJcDGm/9Q7mUyUZT6eJXPDy/60s32Il6i2N3kFf4OSzWC1373SzRSrkhkiJO5X06F+1Zns76TEZyblgh33d2cAJCSBo=
Content-ID: <439EF8C339A117429688D7CE21B746A7@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d553b2a-d7bb-446c-2a3f-08d70b80dd5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 13:07:19.5736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2540
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/2] x86/cpu/intel: Clear cache self-snoop
 capability in CPUs with known errata
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxNDoyMywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTgvMDcvMjAx
OSAxMzowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L2lu
dGVsLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvaW50ZWwuYw0KPj4gQEAgLTE1LDYgKzE1
LDMyIEBADQo+PiAgICAjaW5jbHVkZSAiY3B1LmgiDQo+PiAgICANCj4+ICAgIC8qDQo+PiArICog
UHJvY2Vzc29ycyB3aGljaCBoYXZlIHNlbGYtc25vb3BpbmcgY2FwYWJpbGl0eSBjYW4gaGFuZGxl
IGNvbmZsaWN0aW5nDQo+PiArICogbWVtb3J5IHR5cGUgYWNyb3NzIENQVXMgYnkgc25vb3Bpbmcg
aXRzIG93biBjYWNoZS4gSG93ZXZlciwgdGhlcmUgZXhpc3RzDQo+PiArICogQ1BVIG1vZGVscyBp
biB3aGljaCBoYXZpbmcgY29uZmxpY3RpbmcgbWVtb3J5IHR5cGVzIHN0aWxsIGxlYWRzIHRvDQo+
PiArICogdW5wcmVkaWN0YWJsZSBiZWhhdmlvciwgbWFjaGluZSBjaGVjayBlcnJvcnMsIG9yIGhh
bmdzLiBDbGVhciB0aGlzDQo+PiArICogZmVhdHVyZSB0byBwcmV2ZW50IGl0cyB1c2Ugb24gbWFj
aGluZXMgd2l0aCBrbm93biBlcnJhdGFzLg0KPj4gKyAqLw0KPj4gK3N0YXRpYyB2b2lkIF9faW5p
dCBjaGVja19tZW1vcnlfdHlwZV9zZWxmX3Nub29wX2VycmF0YSh2b2lkKQ0KPj4gK3sNCj4+ICsJ
c3dpdGNoIChib290X2NwdV9kYXRhLng4Nl9tb2RlbCkgew0KPj4gKwljYXNlIDB4MGY6IC8qIE1l
cm9tICovDQo+PiArCWNhc2UgMHgxNjogLyogTWVyb20gTCAqLw0KPj4gKwljYXNlIDB4MTc6IC8q
IFBlbnJ5biAqLw0KPj4gKwljYXNlIDB4MWQ6IC8qIER1bm5pbmd0b24gKi8NCj4+ICsJY2FzZSAw
eDFlOiAvKiBOZWhhbGVtICovDQo+PiArCWNhc2UgMHgxZjogLyogQXVidXJuZGFsZSAvIEhhdmVu
ZGFsZSAqLw0KPj4gKwljYXNlIDB4MWE6IC8qIE5laGFsZW0gRVAgKi8NCj4+ICsJY2FzZSAweDJl
OiAvKiBOZWhhbGVtIEVYICovDQo+PiArCWNhc2UgMHgyNTogLyogV2VzdG1lcmUgKi8NCj4+ICsJ
Y2FzZSAweDJjOiAvKiBXZXN0bWVyZSBFUCAqLw0KPj4gKwljYXNlIDB4MmE6IC8qIFNhbmR5QnJp
ZGdlICovDQo+IA0KPiBJdCB3b3VsZCBoYXZlIGJlZW4gbmljZSBpZiB0aGUgZXJyYXRhIGhhZCBh
Y3R1YWxseSBiZWVuIGlkZW50aWZpZWQuLi4NCg0KSW5kZWVkOyBJIGhvcGUgeW91IGRvbid0IGV4
cGVjdCBtZSB0byBnbyBodW50IHRoZW0gZG93bi4gSSdtDQpjbG9uaW5nIGEgTGludXggY29tbWl0
IGhlcmUgb25seSwgYWZ0ZXIgYWxsLg0KDQo+PiArCQlzZXR1cF9jbGVhcl9jcHVfY2FwKFg4Nl9G
RUFUVVJFX1NTKTsNCj4gDQo+IEknbSByZWdyZXR0aW5nIGV4cG9zaW5nIFNTIHRvIGd1ZXN0cyBh
dCB0aGlzIHBvaW50Lg0KPiANCj4gQXMgdGhpcyBzdGFuZHMsIGl0IHdpbGwgcmVzdWx0IGluIGEg
bWlncmF0aW9uIGNvbXBhdGliaWxpdHkgaXNzdWUsDQo+IGJlY2F1c2UgdXBkYXRpbmcgWGVuIHdp
bGwgY2F1c2UgYSBmZWF0dXJlIHRvIGRpc2FwcGVhci7CoCBJZiB3ZSBoYWQgYQ0KPiBkZWZhdWx0
IHZzIGZ1bGwgcG9saWN5IHNwbGl0LCB0aGlzIHdvdWxkIGJlIGVhc3kgZW5vdWdoIHRvIHdvcmsg
YXJvdW5kDQo+IGluIGEgY29tcGF0aWJsZSB3YXkuwqAgSSB3b25kZXIgaWYgdGhlcmUgaXMgYW55
dGhpbmcgY2xldmVyIHdlIGNhbiBkbyBpbg0KPiB0aGUgbWVhbnRpbWUgYXMgYSBzdG9wZ2FwIHdv
cmthcm91bmQuDQoNClNob3VsZCB3ZSBwZXJoYXBzIGludHJvZHVjZSBYODZfRkVBVFVSRV9YRU5f
U0VMRlNOT09QLCBqdXN0IGxpa2UNCndlIGRvIGZvciBTTUVQIGFuZCBTTUFQLCBzdWNoIHRoYXQg
d2UgY2FuIGxlYXZlIHRoZSByZWFsIG9uZSBhbG9uZT8NCg0KSmFuDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
