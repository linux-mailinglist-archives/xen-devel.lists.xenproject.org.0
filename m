Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316866FBB3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 11:03:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpUBD-0005RY-Bz; Mon, 22 Jul 2019 09:00:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wXcs=VT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpUBB-0005RT-Vk
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 09:00:22 +0000
X-Inumbo-ID: 1b6c8948-ac5f-11e9-ac29-9b12737f236f
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b6c8948-ac5f-11e9-ac29-9b12737f236f;
 Mon, 22 Jul 2019 09:00:17 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 22 Jul 2019 08:56:15 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 08:55:47 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 08:55:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8yDyilI1ae5EThEaI3VUq5FLWnHofedTsmnWLIQZhE7IGEGOrjCOoZMgOwyjWFAk5l1lh/dge2/zDa2M+SUYTrF4gT7O4Y0lsxSafZUgy2aWPF4Bc8OU/UfqWouEYJqBjHtSCet8rsYLf8/wI8qgAQAQvmvyu2bxINyDRyOSoiHdK6i53bYWWnxmvGYCTWuj8K/PncnMqgCMmYTLa3phOOaofuMgi0yVB/LDrS0fEMYEuQOsT0qpegv602Q93NYks1MN/04ifXfcb+ecmkcxEeytIdLMN0Ge+xGkyaBlGr3B4yBvChO5PC87tBB2S6GeMe89V10Z+gPRmTHL5684w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znqLsLSp99gT3tl0p4DcHDPfLV4Ez3HJWmtFFFj+2DU=;
 b=ENTNXcDKeQEqJBBGBTWzgFEp6BMTPGTasgEO0kotZEND54fEc4+4iADDuedptQyuFbcVjCJPlfUAgDSsTdOnWY2B8V36F7QZml+t1J6k0kDxLte1uZRYXuxiwJfv45OI0dbSW210fqViUvIeiayxXyqsm743jx2kb1pZgWL2TAL+jPm7wID6bEG1EOY16mAaYzMdo4S1agN/HCrfp7Wajb+NooI1UCIwnbo6GsISzXC71/9G+HB/CDnLZWzekhtTlsSkXd4Dpdi+aScZQa6ZHo0mAt9SaJziYr0EZbKGUEyw2sqr/UAG5+OCihaFcd1ehK932kYTnmHygearyXKtwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2763.namprd18.prod.outlook.com (20.179.49.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 08:55:45 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 22 Jul 2019
 08:55:45 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "Woods, Brian" <Brian.Woods@amd.com>
Thread-Topic: [PATCH v3 03/14] AMD/IOMMU: use bit field for control register
Thread-Index: AQHVO/SRnAccqyvNqEup1oh+z/xKQqbSRheAgAQYd4A=
Date: Mon, 22 Jul 2019 08:55:45 +0000
Message-ID: <24a47712-00f2-bbbf-9027-648c5dd6b4da@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <3bca9f91-7cd8-e1bd-6d4c-736998fd3f0a@suse.com>
 <20190719182303.GB4496@amd.com>
In-Reply-To: <20190719182303.GB4496@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::32) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c70d8ebc-e121-4e52-0437-08d70e82622b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2763; 
x-ms-traffictypediagnostic: DM6PR18MB2763:
x-microsoft-antispam-prvs: <DM6PR18MB2763BC45B0AC2FF070B9F5D9B3C40@DM6PR18MB2763.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(199004)(189003)(52116002)(6916009)(478600001)(6486002)(76176011)(53936002)(6436002)(316002)(36756003)(6512007)(81166006)(81156014)(186003)(25786009)(446003)(26005)(8676002)(4744005)(54906003)(2616005)(11346002)(476003)(4326008)(229853002)(8936002)(31686004)(71190400001)(71200400001)(102836004)(2906002)(7736002)(14454004)(386003)(6506007)(53546011)(305945005)(6246003)(31696002)(66946007)(66476007)(66556008)(64756008)(66446008)(66066001)(80792005)(14444005)(256004)(6116002)(86362001)(99286004)(68736007)(5660300002)(3846002)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2763;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bViQNdZ8Kwu/Boey88A7BMDNAmuoWgrTWG8GyfvfmaLLbjthtB35IoZMehz/xJ18tMErJZlT5ssUbzT/Rbpj34An9okL4m1f7iwndDA8twLbD2fvtrVJ7CFhQcpHKLBRbsknL7daICA7WNe9rf5qUuc/9Y47WzfnolGMTmtETOFpXfp7X6J/9hbhc1uAal89T1QQ6cwZKz8fIVOfSKQ6fJbW6dtPY/s9HzcfgKKUdOWyb/trGfoGLvTBdJfZJcM01kqwjbYzJJdCuA+mBL2YzH7sdqor93zmUT9MUiY7+FazwAMWaQsxiVbYDeEJ/yb7zNyZ0CnwnEFPILqDXCG3HIkwbTx02lWjVaARqA6d66rgRPfw0gc4OeQMvXFHE7iH26UYlHPB9XDI9lHTBAnh5NqRwc+wRFROdwoYM5q59tI=
Content-ID: <168FCCD2DB4D9545A28878EF618CF578@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c70d8ebc-e121-4e52-0437-08d70e82622b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 08:55:45.3667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2763
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 03/14] AMD/IOMMU: use bit field for
 control register
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
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAyMDoyMywgIFdvb2RzLCBCcmlhbiAgd3JvdGU6DQo+IE9uIFR1ZSwgSnVs
IDE2LCAyMDE5IGF0IDA0OjM2OjA2UE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gQWxz
byBpbnRyb2R1Y2UgYSBmaWVsZCBpbiBzdHJ1Y3QgYW1kX2lvbW11IGNhY2hpbmcgdGhlIG1vc3Qg
cmVjZW50bHkNCj4+IHdyaXR0ZW4gY29udHJvbCByZWdpc3Rlci4gQWxsIHdyaXRlcyBzaG91bGQg
bm93IGhhcHBlbiBleGNsdXNpdmVseSBmcm9tDQo+PiB0aGF0IGNhY2hlZCB2YWx1ZSwgc3VjaCB0
aGF0IGl0IGlzIGd1YXJhbnRlZWQgdG8gYmUgdXAgdG8gZGF0ZS4NCj4+DQo+PiBUYWtlIHRoZSBv
cHBvcnR1bml0eSBhbmQgYWRkIGZ1cnRoZXIgZmllbGRzLiBBbHNvIGNvbnZlcnQgYSBmZXcgYm9v
bGVhbg0KPj4gZnVuY3Rpb24gcGFyYW1ldGVycyB0byBib29sLCBzdWNoIHRoYXQgdXNlIG9mICEh
IGNhbiBiZSBhdm9pZGVkLg0KPj4NCj4+IEJlY2F1c2Ugb2YgdGhlcmUgbm93IGJlaW5nIGRlZmlu
aXRpb25zIGJleW9uZCBiaXQgMzEsIHdyaXRlbCgpIGFsc28gZ2V0cw0KPj4gcmVwbGFjZWQgYnkg
d3JpdGVxKCkgd2hlbiB1cGRhdGluZyBoYXJkd2FyZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+PiBBY2tlZC1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBCcmlhbiBXb29k
cyA8YnJpYW4ud29vZHNAYW1kLmNvbT4NCg0KVGhhbmtzIGZvciB0aGlzIGFuZCB0aGUgb3RoZXIg
YWNrcy4gSSBub3RpY2UgdGhvdWdoIHRoYXQgeW91IHNraXBwZWQNCnBhdGNoZXMgMiBhbmQgMTM6
IEFyZSB0aGVyZSBjb25jZXJucyB0aGVyZT8gUGF0Y2ggOCBzdGlsbCBoYXMgYQ0KZGlzY3Vzc2lv
biB0byBzZXR0bGUsIHNvIEkgcmVhbGl6ZSB5b3UgcHJvYmFibHkgd291bGRuJ3Qgd2FudCB0byBh
Y2sNCnRoYXQgb25lIHlldC4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
