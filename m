Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6D06AD0C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 18:44:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnQXA-00040s-1q; Tue, 16 Jul 2019 16:42:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnQX8-00040c-Pg
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 16:42:30 +0000
X-Inumbo-ID: b2f14d44-a7e8-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b2f14d44-a7e8-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 16:42:29 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 16:42:28 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 16:40:36 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 16:40:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbFrIUPijASBkrZARO8n5iCh0glgelCAGexUdQI32FhMlZTP0cw0Hnp6S14Ju2N8WGqxsUJTxrJ0Crfb4I20I1+70Hr6I1tUupTK1ZedCt6Idhj39r9BPKYcIzHCSkChD6Wv7tsCEpQA3VeGCHP1G/klamGk8LdkoI9/F5HH1VzmwWEAT2fWfx3M71VSKGb6UBfetI8fh7lqjlenALG/0xia+aIyaZ00CFcvPRmrsxYYEIRuMeQkJIpwn084XNiwQL+DstNfSl5bwg6yTnqmeNkB7p+lhSk8TT3HV6WNy3QcyR6371wJkZSEgutf9HTigb7DDVZV9mM+YM2LvdGCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYkvDvEM84d7X8cEu8UD9m4Bp6iEpBDl/lShwzsA0fE=;
 b=QA9Q31NkLfDpwTwu1rfDvSNYQzpj+tM3sVQXVTy8HQZx0qGcxf6hsoADh0edvEQBQ3ZGOe5RnjDlfPYmDnVfEkMjb+drPnRwjimMezrPisAgFUCByPock84iuj0mohMeu6vmM/Gy8lfzbZVbJqjy/a2XYLUxxHqacbhA6CjNvC7WSJkwBJDK0RAKDVVPP+wrBVWMW7ZGg8zBQHVhmgNGXwlre9KgTsB4+s96ostvuQnwjieHAMfSfxB6SsdWRL7Xiph9H7uqsqWO1rylHdpjG10S42zMsE2YutAUd9kJ9y5Id0PLEEC+3x8GQLuj4CEMDepn0wIcFP8r645HWjq2HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2764.namprd18.prod.outlook.com (20.179.49.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 16:40:34 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 16:40:34 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 12/14] AMD/IOMMU: enable x2APIC mode when available
Thread-Index: AQHVO/UwqdlmfJQxJ0qVIoXHud0MJg==
Date: Tue, 16 Jul 2019 16:40:33 +0000
Message-ID: <aab965bf-9a59-f778-0fd3-b6fae724755a@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
In-Reply-To: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0301CA0029.eurprd03.prod.outlook.com
 (2603:10a6:4:3e::39) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2196444b-392c-42c2-36d0-08d70a0c52a6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2764; 
x-ms-traffictypediagnostic: DM6PR18MB2764:
x-microsoft-antispam-prvs: <DM6PR18MB27647A096D7B5C3183D1A222B3CE0@DM6PR18MB2764.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(199004)(189003)(80792005)(76176011)(478600001)(14454004)(66066001)(2906002)(31696002)(2501003)(52116002)(7736002)(2616005)(25786009)(186003)(68736007)(11346002)(446003)(386003)(14444005)(6506007)(36756003)(8676002)(6512007)(476003)(305945005)(26005)(31686004)(8936002)(3846002)(4326008)(2351001)(6486002)(81166006)(81156014)(486006)(316002)(53936002)(54906003)(5640700003)(256004)(102836004)(86362001)(71200400001)(6116002)(66946007)(66476007)(66556008)(64756008)(66446008)(5660300002)(99286004)(6916009)(6436002)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2764;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: E4i+SDbFC4MhRxqTfYgkRcOVMvTeCswc9L7/4nsFHixFN4COrKh4OONy7XNnuN3igA4mIdGWzlcXrcGbXfCMuwxLiUynmc/q5aXlGGpEhfpYaElEthSlJx3XneaNV2IiLpzKUxIU+6OpfbG/ecFW6IV5aY32/vlXDf4GHFm+6kQo4iqjdz7DB8CXVxDDzk24fYClnS02Ny90kT9Igk6TDdQgzRl089luK9ftO24X9d+3nyuYg4DJQIqtAaC56AEijtDRTwBIogsjisKIbEZge/YgFFnWgkUtM1S36/uXnKWaItK5i2Ddkh3JiaMc05zUtGkzK21OiJnrVmE4ifrfWPXzPwNBtB9Y6FKUq7MFMgLWJK1izoJMELm8fhtvXvm5F8LfLfNJD8AZDbHfzywVg6aYytV0HipEuMNBwzvDAKM=
Content-ID: <A660CA620FE0074C9C8A8C70BCEB70AA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2196444b-392c-42c2-36d0-08d70a0c52a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 16:40:33.9773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2764
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v3 12/14] AMD/IOMMU: enable x2APIC mode when
 available
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
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gb3JkZXIgZm9yIHRoZSBDUFVzIHRvIHVzZSB4MkFQSUMgbW9kZSwgdGhlIElPTU1VKHMpIGZp
cnN0IG5lZWQgdG8gYmUNCnN3aXRjaGVkIGludG8gc3VpdGFibGUgc3RhdGUuDQoNClRoZSBwb3N0
LUFQLWJyaW5ndXAgSVJRIGFmZmluaXR5IGFkanVzdG1lbnQgaXMgZG9uZSBhbHNvIGZvciB0aGUg
bm9uLQ0KeDJBUElDIGNhc2UsIG1hdGNoaW5nIHdoYXQgVlQtZCBkb2VzLg0KDQpTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQotLS0NCnYzOiBTZXQgR0FFbiAo
YW5kIG90aGVyIGNvbnRyb2wgcmVnaXN0ZXIgYml0cykgZWFybGllci4gQWxzbyBjbGVhciB0aGUN
CiAgICAgYml0cyBlbmFibGVkIGhlcmUgaW4gYW1kX2lvbW11X2luaXRfY2xlYW51cCgpLiBSZS1i
YXNlLiBQYXNzIE5VTEwNCiAgICAgQ1BVIG1hc2sgdG8gc2V0X3t4MmFwaWMsbXNpfV9hZmZpbml0
eSgpLg0KdjI6IERyb3AgY3B1X2hhc19jeDE2IGNoZWNrLiBBZGQgY29tbWVudC4NCi0tLQ0KVEJE
OiBJbnN0ZWFkIG9mIHRoZSBzeXN0ZW1fc3RhdGUgY2hlY2sgaW4gaW92X2VuYWJsZV94dCgpIHRo
ZSBmdW5jdGlvbg0KICAgICAgY291bGQgYWxzbyB6YXAgaXRzIG93biBob29rIHBvaW50ZXIsIGF0
IHdoaWNoIHBvaW50IGl0IGNvdWxkIGFsc28NCiAgICAgIGJlY29tZSBfX2luaXQuIFRoaXMgd291
bGQsIGhvd2V2ZXIsIHJlcXVpcmUgdGhhdCBlaXRoZXINCiAgICAgIHJlc3VtZV94MmFwaWMoKSBi
ZSBib3VuZCB0byBpZ25vcmUgaW9tbXVfZW5hYmxlX3gyYXBpYygpIGVycm9ycw0KICAgICAgZm9y
ZXZlciwgb3IgdGhhdCBpb21tdV9lbmFibGVfeDJhcGljKCkgYmUgc2xpZ2h0bHkgcmUtYXJyYW5n
ZWQgdG8NCiAgICAgIG5vdCByZXR1cm4gLUVPUE5PVFNVUFAgd2hlbiBmaW5kaW5nIGEgTlVMTCBo
b29rIGR1cmluZyByZXN1bWUuDQoNCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9p
b21tdV9pbml0LmMNCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0
LmMNCkBAIC04MzQsNiArODM0LDMwIEBAIHN0YXRpYyBib29sX3QgX19pbml0IHNldF9pb21tdV9p
bnRlcnJ1cHQNCiAgICAgIHJldHVybiAxOw0KICB9DQogIA0KK2ludCBpb3ZfYWRqdXN0X2lycV9h
ZmZpbml0aWVzKHZvaWQpDQorew0KKyAgICBjb25zdCBzdHJ1Y3QgYW1kX2lvbW11ICppb21tdTsN
CisNCisgICAgaWYgKCAhaW9tbXVfZW5hYmxlZCApDQorICAgICAgICByZXR1cm4gMDsNCisNCisg
ICAgZm9yX2VhY2hfYW1kX2lvbW11ICggaW9tbXUgKQ0KKyAgICB7DQorICAgICAgICBzdHJ1Y3Qg
aXJxX2Rlc2MgKmRlc2MgPSBpcnFfdG9fZGVzYyhpb21tdS0+bXNpLmlycSk7DQorICAgICAgICB1
bnNpZ25lZCBsb25nIGZsYWdzOw0KKw0KKyAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmRlc2Mt
PmxvY2ssIGZsYWdzKTsNCisgICAgICAgIGlmICggaW9tbXUtPmN0cmwuaW50X2NhcF94dF9lbiAp
DQorICAgICAgICAgICAgc2V0X3gyYXBpY19hZmZpbml0eShkZXNjLCBOVUxMKTsNCisgICAgICAg
IGVsc2UNCisgICAgICAgICAgICBzZXRfbXNpX2FmZmluaXR5KGRlc2MsIE5VTEwpOw0KKyAgICAg
ICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGVzYy0+bG9jaywgZmxhZ3MpOw0KKyAgICB9DQor
DQorICAgIHJldHVybiAwOw0KK30NCitfX2luaXRjYWxsKGlvdl9hZGp1c3RfaXJxX2FmZmluaXRp
ZXMpOw0KKw0KICAvKg0KICAgKiBGYW1pbHkxNWggTW9kZWwgMTBoLTFmaCBlcnJhdHVtIDc0NiAo
SU9NTVUgTG9nZ2luZyBNYXkgU3RhbGwgVHJhbnNsYXRpb25zKQ0KICAgKiBXb3JrYXJvdW5kOg0K
QEAgLTEwNDcsNyArMTA3MSw3IEBAIHN0YXRpYyB2b2lkICogX19pbml0IGFsbG9jYXRlX3Bwcl9s
b2coc3QNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9QUFJfTE9HX0RF
RkFVTFRfRU5UUklFUywgIlBQUiBMb2ciKTsNCiAgfQ0KICANCi1zdGF0aWMgaW50IF9faW5pdCBh
bWRfaW9tbXVfaW5pdF9vbmUoc3RydWN0IGFtZF9pb21tdSAqaW9tbXUpDQorc3RhdGljIGludCBf
X2luaXQgYW1kX2lvbW11X2luaXRfb25lKHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11LCBib29sIGlu
dHIpDQogIHsNCiAgICAgIGlmICggYWxsb2NhdGVfY21kX2J1ZmZlcihpb21tdSkgPT0gTlVMTCAp
DQogICAgICAgICAgZ290byBlcnJvcl9vdXQ7DQpAQCAtMTA1OCw3ICsxMDgyLDcgQEAgc3RhdGlj
IGludCBfX2luaXQgYW1kX2lvbW11X2luaXRfb25lKHN0cg0KICAgICAgaWYgKCBpb21tdS0+ZmVh
dHVyZXMuZmxkcy5wcHJfc3VwICYmICFhbGxvY2F0ZV9wcHJfbG9nKGlvbW11KSApDQogICAgICAg
ICAgZ290byBlcnJvcl9vdXQ7DQogIA0KLSAgICBpZiAoICFzZXRfaW9tbXVfaW50ZXJydXB0X2hh
bmRsZXIoaW9tbXUpICkNCisgICAgaWYgKCBpbnRyICYmICFzZXRfaW9tbXVfaW50ZXJydXB0X2hh
bmRsZXIoaW9tbXUpICkNCiAgICAgICAgICBnb3RvIGVycm9yX291dDsNCiAgDQogICAgICAvKiBU
byBtYWtlIHN1cmUgdGhhdCBkZXZpY2VfdGFibGUuYnVmZmVyIGhhcyBiZWVuIHN1Y2Nlc3NmdWxs
eSBhbGxvY2F0ZWQgKi8NCkBAIC0xMDg3LDggKzExMTEsMTYgQEAgc3RhdGljIHZvaWQgX19pbml0
IGFtZF9pb21tdV9pbml0X2NsZWFudQ0KICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlICgg
aW9tbXUsIG5leHQsICZhbWRfaW9tbXVfaGVhZCwgbGlzdCApDQogICAgICB7DQogICAgICAgICAg
bGlzdF9kZWwoJmlvbW11LT5saXN0KTsNCisNCisgICAgICAgIGlvbW11LT5jdHJsLmdhX2VuID0g
MDsNCisgICAgICAgIGlvbW11LT5jdHJsLnh0X2VuID0gMDsNCisgICAgICAgIGlvbW11LT5jdHJs
LmludF9jYXBfeHRfZW4gPSAwOw0KKw0KICAgICAgICAgIGlmICggaW9tbXUtPmVuYWJsZWQgKQ0K
ICAgICAgICAgICAgICBkaXNhYmxlX2lvbW11KGlvbW11KTsNCisgICAgICAgIGVsc2UgaWYgKCBp
b21tdS0+bW1pb19iYXNlICkNCisgICAgICAgICAgICB3cml0ZXEoaW9tbXUtPmN0cmwucmF3LA0K
KyAgICAgICAgICAgICAgICAgICBpb21tdS0+bW1pb19iYXNlICsgSU9NTVVfQ09OVFJPTF9NTUlP
X09GRlNFVCk7DQogIA0KICAgICAgICAgIGRlYWxsb2NhdGVfcmluZ19idWZmZXIoJmlvbW11LT5j
bWRfYnVmZmVyKTsNCiAgICAgICAgICBkZWFsbG9jYXRlX3JpbmdfYnVmZmVyKCZpb21tdS0+ZXZl
bnRfbG9nKTsNCkBAIC0xMjkwLDcgKzEzMjIsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9t
bXVfcHJlcGFyZV9vbmUoDQogICAgICByZXR1cm4gMDsNCiAgfQ0KICANCi1pbnQgX19pbml0IGFt
ZF9pb21tdV9pbml0KHZvaWQpDQoraW50IF9faW5pdCBhbWRfaW9tbXVfcHJlcGFyZShib29sIHh0
KQ0KICB7DQogICAgICBzdHJ1Y3QgYW1kX2lvbW11ICppb21tdTsNCiAgICAgIGludCByYyA9IC1F
Tk9ERVY7DQpAQCAtMTMwNSw5ICsxMzM3LDE0IEBAIGludCBfX2luaXQgYW1kX2lvbW11X2luaXQo
dm9pZCkNCiAgICAgIGlmICggdW5saWtlbHkoYWNwaV9nYmxfRkFEVC5ib290X2ZsYWdzICYgQUNQ
SV9GQURUX05PX01TSSkgKQ0KICAgICAgICAgIGdvdG8gZXJyb3Jfb3V0Ow0KICANCisgICAgLyog
SGF2ZSB3ZSBiZWVuIGhlcmUgYmVmb3JlPyAqLw0KKyAgICBpZiAoIGl2aGRfdHlwZSApDQorICAg
ICAgICByZXR1cm4gMDsNCisNCiAgICAgIHJjID0gYW1kX2lvbW11X2dldF9zdXBwb3J0ZWRfaXZo
ZF90eXBlKCk7DQogICAgICBpZiAoIHJjIDwgMCApDQogICAgICAgICAgZ290byBlcnJvcl9vdXQ7
DQorICAgIEJVR19PTighcmMpOw0KICAgICAgaXZoZF90eXBlID0gcmM7DQogIA0KICAgICAgcmMg
PSBhbWRfaW9tbXVfZ2V0X2l2cnNfZGV2X2VudHJpZXMoKTsNCkBAIC0xMzIzLDkgKzEzNjAsMzcg
QEAgaW50IF9faW5pdCBhbWRfaW9tbXVfaW5pdCh2b2lkKQ0KICAgICAgICAgIHJjID0gYW1kX2lv
bW11X3ByZXBhcmVfb25lKGlvbW11KTsNCiAgICAgICAgICBpZiAoIHJjICkNCiAgICAgICAgICAg
ICAgZ290byBlcnJvcl9vdXQ7DQorDQorICAgICAgICByYyA9IC1FTk9ERVY7DQorICAgICAgICBp
ZiAoIHh0ICYmICghaW9tbXUtPmZlYXR1cmVzLmZsZHMuZ2Ffc3VwIHx8ICFpb21tdS0+ZmVhdHVy
ZXMuZmxkcy54dF9zdXApICkNCisgICAgICAgICAgICBnb3RvIGVycm9yX291dDsNCisgICAgfQ0K
Kw0KKyAgICBmb3JfZWFjaF9hbWRfaW9tbXUgKCBpb21tdSApDQorICAgIHsNCisgICAgICAgIC8q
IE5COiBUaGVyZSdzIG5vIG5lZWQgdG8gYWN0dWFsbHkgd3JpdGUgdGhlc2Ugb3V0IHJpZ2h0IGhl
cmUuICovDQorICAgICAgICBpb21tdS0+Y3RybC5nYV9lbiB8PSB4dDsNCisgICAgICAgIGlvbW11
LT5jdHJsLnh0X2VuID0geHQ7DQorICAgICAgICBpb21tdS0+Y3RybC5pbnRfY2FwX3h0X2VuID0g
eHQ7DQogICAgICB9DQogIA0KICAgICAgcmMgPSBhbWRfaW9tbXVfdXBkYXRlX2l2cnNfbWFwcGlu
Z19hY3BpKCk7DQorDQorIGVycm9yX291dDoNCisgICAgaWYgKCByYyApDQorICAgIHsNCisgICAg
ICAgIGFtZF9pb21tdV9pbml0X2NsZWFudXAoKTsNCisgICAgICAgIGl2aGRfdHlwZSA9IDA7DQor
ICAgIH0NCisNCisgICAgcmV0dXJuIHJjOw0KK30NCisNCitpbnQgX19pbml0IGFtZF9pb21tdV9p
bml0KGJvb2wgeHQpDQorew0KKyAgICBzdHJ1Y3QgYW1kX2lvbW11ICppb21tdTsNCisgICAgaW50
IHJjID0gYW1kX2lvbW11X3ByZXBhcmUoeHQpOw0KKw0KICAgICAgaWYgKCByYyApDQogICAgICAg
ICAgZ290byBlcnJvcl9vdXQ7DQogIA0KQEAgLTEzNTEsNyArMTQxNiwxMiBAQCBpbnQgX19pbml0
IGFtZF9pb21tdV9pbml0KHZvaWQpDQogICAgICAvKiBwZXIgaW9tbXUgaW5pdGlhbGl6YXRpb24g
ICovDQogICAgICBmb3JfZWFjaF9hbWRfaW9tbXUgKCBpb21tdSApDQogICAgICB7DQotICAgICAg
ICByYyA9IGFtZF9pb21tdV9pbml0X29uZShpb21tdSk7DQorICAgICAgICAvKg0KKyAgICAgICAg
ICogU2V0dGluZyB1cCBvZiB0aGUgSU9NTVUgaW50ZXJydXB0cyBjYW5ub3Qgb2NjdXIgeWV0IGF0
IHRoZSAodmVyeQ0KKyAgICAgICAgICogZWFybHkpIHRpbWUgd2UgZ2V0IGhlcmUgd2hlbiBlbmFi
bGluZyB4MkFQSUMgbW9kZS4gU3VwcHJlc3MgaXQNCisgICAgICAgICAqIGhlcmUsIGFuZCBkbyBp
dCBleHBsaWNpdGx5IGluIGFtZF9pb21tdV9pbml0X2ludGVycnVwdCgpLg0KKyAgICAgICAgICov
DQorICAgICAgICByYyA9IGFtZF9pb21tdV9pbml0X29uZShpb21tdSwgIXh0KTsNCiAgICAgICAg
ICBpZiAoIHJjICkNCiAgICAgICAgICAgICAgZ290byBlcnJvcl9vdXQ7DQogICAgICB9DQpAQCAt
MTM2Myw2ICsxNDMzLDQwIEBAIGVycm9yX291dDoNCiAgICAgIHJldHVybiByYzsNCiAgfQ0KICAN
CitpbnQgX19pbml0IGFtZF9pb21tdV9pbml0X2ludGVycnVwdCh2b2lkKQ0KK3sNCisgICAgc3Ry
dWN0IGFtZF9pb21tdSAqaW9tbXU7DQorICAgIGludCByYyA9IDA7DQorDQorICAgIGZvcl9lYWNo
X2FtZF9pb21tdSAoIGlvbW11ICkNCisgICAgew0KKyAgICAgICAgc3RydWN0IGlycV9kZXNjICpk
ZXNjOw0KKw0KKyAgICAgICAgaWYgKCAhc2V0X2lvbW11X2ludGVycnVwdF9oYW5kbGVyKGlvbW11
KSApDQorICAgICAgICB7DQorICAgICAgICAgICAgcmMgPSAtRUlPOw0KKyAgICAgICAgICAgIGJy
ZWFrOw0KKyAgICAgICAgfQ0KKw0KKyAgICAgICAgZGVzYyA9IGlycV90b19kZXNjKGlvbW11LT5t
c2kuaXJxKTsNCisNCisgICAgICAgIHNwaW5fbG9jaygmZGVzYy0+bG9jayk7DQorICAgICAgICBB
U1NFUlQoaW9tbXUtPmN0cmwuaW50X2NhcF94dF9lbik7DQorICAgICAgICBzZXRfeDJhcGljX2Fm
ZmluaXR5KGRlc2MsICZjcHVfb25saW5lX21hcCk7DQorICAgICAgICBzcGluX3VubG9jaygmZGVz
Yy0+bG9jayk7DQorDQorICAgICAgICBzZXRfaW9tbXVfZXZlbnRfbG9nX2NvbnRyb2woaW9tbXUs
IElPTU1VX0NPTlRST0xfRU5BQkxFRCk7DQorDQorICAgICAgICBpZiAoIGlvbW11LT5mZWF0dXJl
cy5mbGRzLnBwcl9zdXAgKQ0KKyAgICAgICAgICAgIHNldF9pb21tdV9wcHJfbG9nX2NvbnRyb2wo
aW9tbXUsIElPTU1VX0NPTlRST0xfRU5BQkxFRCk7DQorICAgIH0NCisNCisgICAgaWYgKCByYyAp
DQorICAgICAgICBhbWRfaW9tbXVfaW5pdF9jbGVhbnVwKCk7DQorDQorICAgIHJldHVybiByYzsN
Cit9DQorDQogIHN0YXRpYyB2b2lkIGludmFsaWRhdGVfYWxsX2RvbWFpbl9wYWdlcyh2b2lkKQ0K
ICB7DQogICAgICBzdHJ1Y3QgZG9tYWluICpkOw0KLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYW1kL2lvbW11X2ludHIuYw0KKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lv
bW11X2ludHIuYw0KQEAgLTc5MSw2ICs3OTEsMzUgQEAgdm9pZCAqX19pbml0IGFtZF9pb21tdV9h
bGxvY19pbnRyZW1hcF90YQ0KICAgICAgcmV0dXJuIHRiOw0KICB9DQogIA0KK2Jvb2wgX19pbml0
IGlvdl9zdXBwb3J0c194dCh2b2lkKQ0KK3sNCisgICAgdW5zaWduZWQgaW50IGFwaWM7DQorDQor
ICAgIGlmICggIWlvbW11X2VuYWJsZSB8fCAhaW9tbXVfaW50cmVtYXAgKQ0KKyAgICAgICAgcmV0
dXJuIGZhbHNlOw0KKw0KKyAgICBpZiAoIGFtZF9pb21tdV9wcmVwYXJlKHRydWUpICkNCisgICAg
ICAgIHJldHVybiBmYWxzZTsNCisNCisgICAgZm9yICggYXBpYyA9IDA7IGFwaWMgPCBucl9pb2Fw
aWNzOyBhcGljKysgKQ0KKyAgICB7DQorICAgICAgICB1bnNpZ25lZCBpbnQgaWR4ID0gaW9hcGlj
X2lkX3RvX2luZGV4KElPX0FQSUNfSUQoYXBpYykpOw0KKw0KKyAgICAgICAgaWYgKCBpZHggPT0g
TUFYX0lPX0FQSUNTICkNCisgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQorDQorICAgICAgICBp
ZiAoICFmaW5kX2lvbW11X2Zvcl9kZXZpY2UoaW9hcGljX3NiZGZbaWR4XS5zZWcsDQorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW9hcGljX3NiZGZbaWR4XS5iZGYpICkNCisg
ICAgICAgIHsNCisgICAgICAgICAgICBBTURfSU9NTVVfREVCVUcoIk5vIElPTU1VIGZvciBJTy1B
UElDICUjeCAoSUQgJXgpXG4iLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBhcGljLCBJ
T19BUElDX0lEKGFwaWMpKTsNCisgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQorICAgICAgICB9
DQorICAgIH0NCisNCisgICAgcmV0dXJuIHRydWU7DQorfQ0KKw0KICBpbnQgX19pbml0IGFtZF9z
ZXR1cF9ocGV0X21zaShzdHJ1Y3QgbXNpX2Rlc2MgKm1zaV9kZXNjKQ0KICB7DQogICAgICBzcGlu
bG9ja190ICpsb2NrOw0KLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRf
aW9tbXUuYw0KKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUu
Yw0KQEAgLTE3MCw3ICsxNzAsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBpb3ZfZGV0ZWN0KHZvaWQp
DQogICAgICBpZiAoICFpb21tdV9lbmFibGUgJiYgIWlvbW11X2ludHJlbWFwICkNCiAgICAgICAg
ICByZXR1cm4gMDsNCiAgDQotICAgIGlmICggYW1kX2lvbW11X2luaXQoKSAhPSAwICkNCisgICAg
ZWxzZSBpZiAoIChpbml0X2RvbmUgPyBhbWRfaW9tbXVfaW5pdF9pbnRlcnJ1cHQoKQ0KKyAgICAg
ICAgICAgICAgICAgICAgICAgICA6IGFtZF9pb21tdV9pbml0KGZhbHNlKSkgIT0gMCApDQogICAg
ICB7DQogICAgICAgICAgcHJpbnRrKCJBTUQtVmk6IEVycm9yIGluaXRpYWxpemF0aW9uXG4iKTsN
CiAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCkBAIC0xODMsNiArMTg0LDI1IEBAIHN0YXRpYyBp
bnQgX19pbml0IGlvdl9kZXRlY3Qodm9pZCkNCiAgICAgIHJldHVybiBzY2FuX3BjaV9kZXZpY2Vz
KCk7DQogIH0NCiAgDQorc3RhdGljIGludCBpb3ZfZW5hYmxlX3h0KHZvaWQpDQorew0KKyAgICBp
bnQgcmM7DQorDQorICAgIGlmICggc3lzdGVtX3N0YXRlID49IFNZU19TVEFURV9hY3RpdmUgKQ0K
KyAgICAgICAgcmV0dXJuIDA7DQorDQorICAgIGlmICggKHJjID0gYW1kX2lvbW11X2luaXQodHJ1
ZSkpICE9IDAgKQ0KKyAgICB7DQorICAgICAgICBwcmludGsoIkFNRC1WaTogRXJyb3IgJWQgaW5p
dGlhbGl6aW5nIGZvciB4MkFQSUMgbW9kZVxuIiwgcmMpOw0KKyAgICAgICAgLyogLUVOWElPIGhh
cyBzcGVjaWFsIG1lYW5pbmcgdG8gdGhlIGNhbGxlciAtIGNvbnZlcnQgaXQuICovDQorICAgICAg
ICByZXR1cm4gcmMgIT0gLUVOWElPID8gcmMgOiAtRU5PREFUQTsNCisgICAgfQ0KKw0KKyAgICBp
bml0X2RvbmUgPSB0cnVlOw0KKw0KKyAgICByZXR1cm4gMDsNCit9DQorDQogIGludCBhbWRfaW9t
bXVfYWxsb2Nfcm9vdChzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCkNCiAgew0KICAgICAgaWYgKCB1
bmxpa2VseSghaGQtPmFyY2gucm9vdF90YWJsZSkgKQ0KQEAgLTU1OSwxMSArNTc5LDEzIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzIF9faW5pdGNvbnMNCiAgICAgIC5mcmVlX3BhZ2Vf
dGFibGUgPSBkZWFsbG9jYXRlX3BhZ2VfdGFibGUsDQogICAgICAucmVhc3NpZ25fZGV2aWNlID0g
cmVhc3NpZ25fZGV2aWNlLA0KICAgICAgLmdldF9kZXZpY2VfZ3JvdXBfaWQgPSBhbWRfaW9tbXVf
Z3JvdXBfaWQsDQorICAgIC5lbmFibGVfeDJhcGljID0gaW92X2VuYWJsZV94dCwNCiAgICAgIC51
cGRhdGVfaXJlX2Zyb21fYXBpYyA9IGFtZF9pb21tdV9pb2FwaWNfdXBkYXRlX2lyZSwNCiAgICAg
IC51cGRhdGVfaXJlX2Zyb21fbXNpID0gYW1kX2lvbW11X21zaV9tc2dfdXBkYXRlX2lyZSwNCiAg
ICAgIC5yZWFkX2FwaWNfZnJvbV9pcmUgPSBhbWRfaW9tbXVfcmVhZF9pb2FwaWNfZnJvbV9pcmUs
DQogICAgICAucmVhZF9tc2lfZnJvbV9pcmUgPSBhbWRfaW9tbXVfcmVhZF9tc2lfZnJvbV9pcmUs
DQogICAgICAuc2V0dXBfaHBldF9tc2kgPSBhbWRfc2V0dXBfaHBldF9tc2ksDQorICAgIC5hZGp1
c3RfaXJxX2FmZmluaXRpZXMgPSBpb3ZfYWRqdXN0X2lycV9hZmZpbml0aWVzLA0KICAgICAgLnN1
c3BlbmQgPSBhbWRfaW9tbXVfc3VzcGVuZCwNCiAgICAgIC5yZXN1bWUgPSBhbWRfaW9tbXVfcmVz
dW1lLA0KICAgICAgLnNoYXJlX3AybSA9IGFtZF9pb21tdV9zaGFyZV9wMm0sDQpAQCAtNTc0LDQg
KzU5Niw1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzIF9faW5pdGNvbnMNCiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBpb21tdV9pbml0X29wcyBfX2luaXRjb25zdHJlbCBfaW9tbXVfaW5p
dF9vcHMgPSB7DQogICAgICAub3BzID0gJl9pb21tdV9vcHMsDQogICAgICAuc2V0dXAgPSBpb3Zf
ZGV0ZWN0LA0KKyAgICAuc3VwcG9ydHNfeDJhcGljID0gaW92X3N1cHBvcnRzX3h0LA0KICB9Ow0K
LS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL2FtZC1pb21tdS1wcm90by5oDQorKysg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11LXByb3RvLmgNCkBAIC00OCw4
ICs0OCwxMSBAQCBpbnQgYW1kX2lvbW11X2RldGVjdF9hY3BpKHZvaWQpOw0KICB2b2lkIGdldF9p
b21tdV9mZWF0dXJlcyhzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSk7DQogIA0KICAvKiBhbWQtaW9t
bXUtaW5pdCBmdW5jdGlvbnMgKi8NCi1pbnQgYW1kX2lvbW11X2luaXQodm9pZCk7DQoraW50IGFt
ZF9pb21tdV9wcmVwYXJlKGJvb2wgeHQpOw0KK2ludCBhbWRfaW9tbXVfaW5pdChib29sIHh0KTsN
CitpbnQgYW1kX2lvbW11X2luaXRfaW50ZXJydXB0KHZvaWQpOw0KICBpbnQgYW1kX2lvbW11X3Vw
ZGF0ZV9pdnJzX21hcHBpbmdfYWNwaSh2b2lkKTsNCitpbnQgaW92X2FkanVzdF9pcnFfYWZmaW5p
dGllcyh2b2lkKTsNCiAgDQogIC8qIG1hcHBpbmcgZnVuY3Rpb25zICovDQogIGludCBfX211c3Rf
Y2hlY2sgYW1kX2lvbW11X21hcF9wYWdlKHN0cnVjdCBkb21haW4gKmQsIGRmbl90IGRmbiwNCkBA
IC05Niw2ICs5OSw3IEBAIHZvaWQgYW1kX2lvbW11X2ZsdXNoX2FsbF9jYWNoZXMoc3RydWN0IGEN
CiAgc3RydWN0IGFtZF9pb21tdSAqZmluZF9pb21tdV9mb3JfZGV2aWNlKGludCBzZWcsIGludCBi
ZGYpOw0KICANCiAgLyogaW50ZXJydXB0IHJlbWFwcGluZyAqLw0KK2Jvb2wgaW92X3N1cHBvcnRz
X3h0KHZvaWQpOw0KICBpbnQgYW1kX2lvbW11X3NldHVwX2lvYXBpY19yZW1hcHBpbmcodm9pZCk7
DQogIHZvaWQgKmFtZF9pb21tdV9hbGxvY19pbnRyZW1hcF90YWJsZSgNCiAgICAgIGNvbnN0IHN0
cnVjdCBhbWRfaW9tbXUgKiwgdW5zaWduZWQgbG9uZyAqKik7DQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
