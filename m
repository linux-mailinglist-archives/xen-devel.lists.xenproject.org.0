Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C78D6CD00
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 12:51:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho3wp-0004Cn-4f; Thu, 18 Jul 2019 10:47:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho3wo-0004Ci-4M
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 10:47:38 +0000
X-Inumbo-ID: 707faece-a949-11e9-9e9b-c3ea8cca51b4
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 707faece-a949-11e9-9e9b-c3ea8cca51b4;
 Thu, 18 Jul 2019 10:47:32 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 10:47:27 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 10:46:18 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 10:46:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fp/wAeKAFTTvGmxFZp2ZZiEPUnDM6bUL2n/xd0sJAvGDfXH6JjI7WysChQJICn3kffU8oc6QPIGYdiLm0FHbHSuqRG0kdWi7CvlIOEaUVITebRFE8CM2n8aa8fBCg6O0YErtsHLOoH7CZbbulNMsA8l4qENXWc2fPzKNQlk40dvZb60soz7ke2f+taHQ0mbkcs7yJMgFet2RBxOWhFi12lB0M4E/f1va+AqLxlOmadtEHI1RvR+AHwEV9tD0Xk3LnmLF6FObpEM5ZLN9GrSZy73Z4FyssZkQzYN+NmsTnvdXy7JUvL0lxPU7vw+yqoF0AyNHakQZ1VJMJ1aEdomANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+R6r7SOqa+xdQfEI0FxNrOPS/4+EIr4nzu1d9X4rfU=;
 b=mV07mX4h2Euj41ithgF18oeOptFQ4Hk9VSBnWnwLPGDTQmeUMSHnw63BgXqezWsc/2dLFUQ0PNljT7BIlY4jYoANQNqm3yKpTOA42kIaltaC45l1K1kWVDJgNNvPjpVwGOjlaCEH6WDz7uOGa7wm669IQt7KbMwKoV4tsAjBA1HTLCDOdNqDEZlxRjXYSobNzuhQjnDYa9WlS0N0JikSKv1XVCoNKqD7oST2gjogcdbnEROlahy9Y4m/fuJAUZWgAJ4zeSkoLIkIz54j63C+BdUkk6LJiD2hI86/bMKeaHrJ4r+rNvM4sOzVApqwNRbDkiyjFVTyh/cl+Ja6+3pwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2746.namprd18.prod.outlook.com (20.179.48.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 10:46:17 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 10:46:17 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH v6 1/5] x86/mem_sharing: reorder when pages are unlocked
 and released
Thread-Index: AQHVPNaoMN4/6VqHlEm91bwrx18tx6bQMluA
Date: Thu, 18 Jul 2019 10:46:17 +0000
Message-ID: <66bbd9f7-12f9-b654-555d-a02d5f4f0dba@suse.com>
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-2-tamas@tklengyel.com>
In-Reply-To: <20190717193335.11991-2-tamas@tklengyel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::31) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 441df530-0217-4b75-a1cc-08d70b6d2968
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2746; 
x-ms-traffictypediagnostic: DM6PR18MB2746:
x-microsoft-antispam-prvs: <DM6PR18MB27461DC0421B794323D965D4B3C80@DM6PR18MB2746.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(199004)(189003)(26005)(8676002)(476003)(256004)(36756003)(446003)(11346002)(6512007)(6506007)(386003)(53546011)(305945005)(2616005)(7736002)(76176011)(25786009)(6436002)(66446008)(64756008)(66066001)(229853002)(66946007)(81156014)(5660300002)(31696002)(102836004)(66556008)(99286004)(14444005)(6246003)(14454004)(66476007)(4326008)(81166006)(6916009)(54906003)(86362001)(31686004)(6116002)(80792005)(316002)(52116002)(3846002)(8936002)(486006)(478600001)(71200400001)(2906002)(68736007)(71190400001)(6486002)(53936002)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2746;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Yc/hkbnNE9skxVFHpUkFVCRknpaaE2vXD5ChGwOHxTy0RC6tDEWqfbdfGYM3vDynWvvkQ++y5eJAPBwDDJkbttnRReoUQOKl/tD2pJLbrCpLsGdC4HsCEJgpq8/vN6lJUnls5jccUvMHF8XbaWj7+XTEgnQAdOrWhZw4Ncmrv49YMtmhfO3a8mS6sZTCKE9StMg6LIH4D9VKFnJhezABr+hu0mtEO1Fxx9HgKIuFwwPMYDbD4mfXv55xOP/x29/sGRc/EcMEkS8KnIHvSaCiILdsmBhIay28FCzBu+t6k4JourPmEMxjs9AJWyoXVDMKikGFcyQY5KO+c/2ETS5Upv5XdyTnM1MhNtxFyrkg0FRIJi3gvc9yY9umr2A0qz+fuVzqGuno504Al+m+cuI6I51YKXTQ5qHgHoXCdtrXQm8=
Content-ID: <EC86F8C1521CD947ABCCC10DC7D88B13@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 441df530-0217-4b75-a1cc-08d70b6d2968
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 10:46:17.1837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2746
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMjAxOSAyMTozMywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBDYWxsaW5nIF9w
dXRfcGFnZV90eXBlIHdoaWxlIGFsc28gaG9sZGluZyB0aGUgcGFnZV9sb2NrDQo+IGZvciB0aGF0
IHBhZ2UgY2FuIGNhdXNlIGEgZGVhZGxvY2suDQo+IA0KPiBUaGUgY29tbWVudCBiZWluZyBkcm9w
cGVkIGlzIGluY29ycmVjdCBzaW5jZSBpdCdzIG5vdyBvdXQtb2YtZGF0ZS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4NCg0KVGhlIGRl
c2NyaXB0aW9uIGNvdmVycyAuLi4NCg0KPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJp
bmcuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYw0KPiBAQCAtNjQ4LDEw
ICs2NDgsNiBAQCBzdGF0aWMgaW50IHBhZ2VfbWFrZV9wcml2YXRlKHN0cnVjdCBkb21haW4gKmQs
IHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpDQo+ICAgICAgICAgICByZXR1cm4gLUVCVVNZOw0KPiAg
ICAgICB9DQo+ICAgDQo+IC0gICAgLyogV2UgY2FuIG9ubHkgY2hhbmdlIHRoZSB0eXBlIGlmIGNv
dW50IGlzIG9uZSAqLw0KPiAtICAgIC8qIEJlY2F1c2Ugd2UgYXJlIGxvY2tpbmcgcGFnZXMgaW5k
aXZpZHVhbGx5LCB3ZSBuZWVkIHRvIGRyb3ANCj4gLSAgICAgKiB0aGUgbG9jayBoZXJlLCB3aGls
ZSB0aGUgcGFnZSBpcyB0eXBlZC4gV2UgY2Fubm90IHJpc2sgdGhlDQo+IC0gICAgICogcmFjZSBv
ZiBwYWdlX3VubG9jayBhbmQgdGhlbiBwdXRfcGFnZV90eXBlLiAqLw0KPiAgICAgICBleHBlY3Rl
ZF90eXBlID0gKFBHVF9zaGFyZWRfcGFnZSB8IFBHVF92YWxpZGF0ZWQgfCBQR1RfbG9ja2VkIHwg
Mik7DQo+ICAgICAgIGlmICggcGFnZS0+dS5pbnVzZS50eXBlX2luZm8gIT0gZXhwZWN0ZWRfdHlw
ZSApDQo+ICAgICAgIHsNCj4gQEAgLTY2MCwxMiArNjU2LDExIEBAIHN0YXRpYyBpbnQgcGFnZV9t
YWtlX3ByaXZhdGUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkNCj4g
ICAgICAgICAgIHJldHVybiAtRUVYSVNUOw0KPiAgICAgICB9DQo+ICAgDQo+ICsgICAgbWVtX3No
YXJpbmdfcGFnZV91bmxvY2socGFnZSk7DQo+ICsNCj4gICAgICAgLyogRHJvcCB0aGUgZmluYWwg
dHlwZWNvdW50ICovDQo+ICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKHBhZ2UpOw0KPiAgIA0KPiAt
ICAgIC8qIE5vdyB0aGF0IHdlJ3ZlIGRyb3BwZWQgdGhlIHR5cGUsIHdlIGNhbiB1bmxvY2sgKi8N
Cj4gLSAgICBtZW1fc2hhcmluZ19wYWdlX3VubG9jayhwYWdlKTsNCj4gLQ0KPiAgICAgICAvKiBD
aGFuZ2UgdGhlIG93bmVyICovDQo+ICAgICAgIEFTU0VSVChwYWdlX2dldF9vd25lcihwYWdlKSA9
PSBkb21fY293KTsNCj4gICAgICAgcGFnZV9zZXRfb3duZXIocGFnZSwgZCk7DQoNCmFsbCBvZiB0
aGUgYWJvdmUuIEJ1dCB3aGF0IGFib3V0IC4uLg0KDQo+IEBAIC05MDAsNiArODk1LDcgQEAgc3Rh
dGljIGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hh
bmRsZV90IHNoLA0KPiAgICAgICBwMm1fdHlwZV90IHNtZm5fdHlwZSwgY21mbl90eXBlOw0KPiAg
ICAgICBzdHJ1Y3QgdHdvX2dmbnMgdGc7DQo+ICAgICAgIHN0cnVjdCBybWFwX2l0ZXJhdG9yIHJp
Ow0KPiArICAgIHVuc2lnbmVkIGxvbmcgcHV0X2NvdW50ID0gMDsNCj4gICANCj4gICAgICAgZ2V0
X3R3b19nZm5zKHNkLCBzZ2ZuLCAmc21mbl90eXBlLCBOVUxMLCAmc21mbiwNCj4gICAgICAgICAg
ICAgICAgICAgIGNkLCBjZ2ZuLCAmY21mbl90eXBlLCBOVUxMLCAmY21mbiwgMCwgJnRnKTsNCj4g
QEAgLTk2NCwxNSArOTYwLDYgQEAgc3RhdGljIGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWlu
ICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hhbmRsZV90IHNoLA0KPiAgICAgICAgICAgZ290byBlcnJf
b3V0Ow0KPiAgICAgICB9DQo+ICAgDQo+IC0gICAgLyogQWNxdWlyZSBhbiBleHRyYSByZWZlcmVu
Y2UsIGZvciB0aGUgZnJlZWluZyBiZWxvdyB0byBiZSBzYWZlLiAqLw0KPiAtICAgIGlmICggIWdl
dF9wYWdlKGNwYWdlLCBkb21fY293KSApDQo+IC0gICAgew0KPiAtICAgICAgICByZXQgPSAtRU9W
RVJGTE9XOw0KPiAtICAgICAgICBtZW1fc2hhcmluZ19wYWdlX3VubG9jayhzZWNvbmRwZyk7DQo+
IC0gICAgICAgIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKGZpcnN0cGcpOw0KPiAtICAgICAgICBn
b3RvIGVycl9vdXQ7DQo+IC0gICAgfQ0KPiAtDQo+ICAgICAgIC8qIE1lcmdlIHRoZSBsaXN0cyB0
b2dldGhlciAqLw0KPiAgICAgICBybWFwX3NlZWRfaXRlcmF0b3IoY3BhZ2UsICZyaSk7DQo+ICAg
ICAgIHdoaWxlICggKGdmbiA9IHJtYXBfaXRlcmF0ZShjcGFnZSwgJnJpKSkgIT0gTlVMTCkNCj4g
QEAgLTk4NCwxMyArOTcxLDE0IEBAIHN0YXRpYyBpbnQgc2hhcmVfcGFnZXMoc3RydWN0IGRvbWFp
biAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwNCj4gICAgICAgICAgICAqIERvbid0
IGNoYW5nZSB0aGUgdHlwZSBvZiBybWFwIGZvciB0aGUgY2xpZW50IHBhZ2UuICovDQo+ICAgICAg
ICAgICBybWFwX2RlbChnZm4sIGNwYWdlLCAwKTsNCj4gICAgICAgICAgIHJtYXBfYWRkKGdmbiwg
c3BhZ2UpOw0KPiAtICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShjcGFnZSk7DQo+ICsgICAgICAg
IHB1dF9jb3VudCsrOw0KPiAgICAgICAgICAgZCA9IGdldF9kb21haW5fYnlfaWQoZ2ZuLT5kb21h
aW4pOw0KPiAgICAgICAgICAgQlVHX09OKCFkKTsNCj4gICAgICAgICAgIEJVR19PTihzZXRfc2hh
cmVkX3AybV9lbnRyeShkLCBnZm4tPmdmbiwgc21mbikpOw0KPiAgICAgICAgICAgcHV0X2RvbWFp
bihkKTsNCj4gICAgICAgfQ0KPiAgICAgICBBU1NFUlQobGlzdF9lbXB0eSgmY3BhZ2UtPnNoYXJp
bmctPmdmbnMpKTsNCj4gKyAgICBCVUdfT04oIXB1dF9jb3VudCk7DQo+ICAgDQo+ICAgICAgIC8q
IENsZWFyIHRoZSByZXN0IG9mIHRoZSBzaGFyZWQgc3RhdGUgKi8NCj4gICAgICAgcGFnZV9zaGFy
aW5nX2Rpc3Bvc2UoY3BhZ2UpOw0KPiBAQCAtMTAwMSw3ICs5ODksOSBAQCBzdGF0aWMgaW50IHNo
YXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBzaHJfaGFuZGxlX3Qgc2gs
DQo+ICAgDQo+ICAgICAgIC8qIEZyZWUgdGhlIGNsaWVudCBwYWdlICovDQo+ICAgICAgIHB1dF9w
YWdlX2FsbG9jX3JlZihjcGFnZSk7DQo+IC0gICAgcHV0X3BhZ2UoY3BhZ2UpOw0KPiArDQo+ICsg
ICAgd2hpbGUgKCBwdXRfY291bnQtLSApDQo+ICsgICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKGNw
YWdlKTsNCj4gICANCj4gICAgICAgLyogV2UgbWFuYWdlZCB0byBmcmVlIGEgZG9tYWluIHBhZ2Uu
ICovDQo+ICAgICAgIGF0b21pY19kZWMoJm5yX3NoYXJlZF9tZm5zKTsNCj4gQEAgLTExNjUsMTkg
KzExNTUsMTMgQEAgaW50IF9fbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKHN0cnVjdCBkb21haW4g
KmQsDQo+ICAgICAgIHsNCj4gICAgICAgICAgIGlmICggIWxhc3RfZ2ZuICkNCj4gICAgICAgICAg
ICAgICBtZW1fc2hhcmluZ19nZm5fZGVzdHJveShwYWdlLCBkLCBnZm5faW5mbyk7DQo+IC0gICAg
ICAgIHB1dF9wYWdlX2FuZF90eXBlKHBhZ2UpOw0KPiArDQo+ICAgICAgICAgICBtZW1fc2hhcmlu
Z19wYWdlX3VubG9jayhwYWdlKTsNCj4gKw0KPiAgICAgICAgICAgaWYgKCBsYXN0X2dmbiApDQo+
IC0gICAgICAgIHsNCj4gLSAgICAgICAgICAgIGlmICggIWdldF9wYWdlKHBhZ2UsIGRvbV9jb3cp
ICkNCj4gLSAgICAgICAgICAgIHsNCj4gLSAgICAgICAgICAgICAgICBwdXRfZ2ZuKGQsIGdmbik7
DQo+IC0gICAgICAgICAgICAgICAgZG9tYWluX2NyYXNoKGQpOw0KPiAtICAgICAgICAgICAgICAg
IHJldHVybiAtRU9WRVJGTE9XOw0KPiAtICAgICAgICAgICAgfQ0KPiAgICAgICAgICAgICAgIHB1
dF9wYWdlX2FsbG9jX3JlZihwYWdlKTsNCj4gLSAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOw0K
PiAtICAgICAgICB9DQo+ICsNCj4gKyAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUocGFnZSk7DQo+
ICAgICAgICAgICBwdXRfZ2ZuKGQsIGdmbik7DQo+ICAgDQo+ICAgICAgICAgICByZXR1cm4gMDsN
Cg0KLi4uIHRoaXMgKG1haW4sIGFzIEkgZ3Vlc3MgYnkgdGhlIHRpdGxlKSBwYXJ0IG9mIHRoZSBj
aGFuZ2U/IEkgdGhpbmsNCnlvdSB3YW50IHRvIGV4cGxhaW4gd2hhdCB3YXMgd3JvbmcgaGVyZSBh
bmQvb3Igd2h5IHRoZSBuZXcgYXJyYW5nZW1lbnQNCmlzIGJldHRlci4gKEknbSBzb3JyeSwgSSBn
dWVzcyBpdCB3YXMgdGhpcyB3YXkgb24gcHJpb3IgdmVyc2lvbnMNCmFscmVhZHksIGJ1dCBhcHBh
cmVudGx5IEkgZGlkbid0IG5vdGljZS4pDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
