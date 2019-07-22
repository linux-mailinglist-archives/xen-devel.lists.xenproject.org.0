Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0836FB6C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 10:38:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpTnL-00039C-9A; Mon, 22 Jul 2019 08:35:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wXcs=VT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpTnJ-000397-4T
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 08:35:41 +0000
X-Inumbo-ID: ae36a7af-ac5b-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ae36a7af-ac5b-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 08:35:39 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 22 Jul 2019 08:35:31 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 08:34:02 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 08:34:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUT3wk8Bn7IOsE9i3bQ730RcCIUs8/h0CqUhWpa7JUlxdaGrNhsl0J96sefQdHkDn9DaBVv865bNBMxwl1l56y4r6oSjrlrEufklcV3EOwrzTPks1o4BsuDzsxlPZHM2kjG9hArRxdWmMR4udsVFwSbGVpVOX6XwVWrzvtLAoHUmEY3skvt8QLadzgMvacEQJptXWJzNoToSxweKLFOoIUhER1mA1dc3HqPaiDoEMNdOP6/7chzriiAMNQI1CL5kgEvY1p1/Ea+3amg04aKaWPcKvgADFAht0SozFj3r5xSc7WwgQsuJny2OPmhXnOAMwPhmS01hQhHxga10MOg9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhGPTfoCipHtgZk9rf6a0BPFC4XuvjB1oD4/xkKshyw=;
 b=SsB/YtqykS5kCVExJxh4RCXXcJgnU+0KsAi6nmW5TD/H6em8+NyFlad5jHsYGWtDIfI+icHVqWIP+iBV4uDBuZyNpACJVSSmnX8eGpn1bbQ0uA2zJ5Px7RXt/czifCRsuwOc6avBuj2g7CpJvFZvobVapyqj+bjFtvKsUJ49QPD7CsMI70oM3r9QigThrfEKCy9mQN+aQ7qs3bBc9ykBPlmzwCzBFYv2B8F2Q2PFBOrBzOVtA/wPOX6aUxUmtRzenlByrTZgoO0tCrKdaepXtv+le8wK64eogCodT4gR8jzllWA1MPx1sDHiAiGz9USmPd7TnhTCKOGFQZti7rlbDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2730.namprd18.prod.outlook.com (20.179.52.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 08:34:00 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 22 Jul 2019
 08:34:00 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 08/14] AMD/IOMMU: introduce 128-bit IRTE
 non-guest-APIC IRTE format
Thread-Index: AQHVO/TlAPsnkpqPo0+X2y95y9fr6KbSNr9CgAQhvIA=
Date: Mon, 22 Jul 2019 08:34:00 +0000
Message-ID: <9c6a7b4b-af52-c93d-480f-f34334de868a@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <94c28919-81cd-e6fa-aa43-e05dfea7cbed@suse.com>
 <9612f97f-904d-7b72-cff9-ead2e8590ffc@citrix.com>
In-Reply-To: <9612f97f-904d-7b72-cff9-ead2e8590ffc@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0292.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::16) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fea72a9b-8759-4a4e-8ed2-08d70e7f5874
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2730; 
x-ms-traffictypediagnostic: DM6PR18MB2730:
x-microsoft-antispam-prvs: <DM6PR18MB27308621C1E53C62E3F9677FB3C40@DM6PR18MB2730.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(54094003)(199004)(189003)(6436002)(2616005)(476003)(11346002)(86362001)(66066001)(6486002)(14454004)(8936002)(31696002)(66446008)(64756008)(66556008)(66476007)(2906002)(66946007)(3846002)(14444005)(256004)(6116002)(68736007)(54906003)(81156014)(81166006)(5660300002)(486006)(316002)(53936002)(99286004)(80792005)(52116002)(71190400001)(71200400001)(8676002)(25786009)(36756003)(102836004)(6506007)(186003)(53546011)(7736002)(386003)(305945005)(76176011)(6916009)(446003)(6512007)(4326008)(26005)(31686004)(6246003)(478600001)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2730;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +NGhlLY/w5o97hdJi7N1kEdyUcdFY++g/zxxSwd+QB3eIZMO7tTvK1nqv0n26jumiGBea6xih9j8smRwB67Q7O/fS10jv3itHWQsrv3z5Hx0fhdDhSB8HqYuyug74cal9abzbRVGahSj+LrsJtHfN/DStDtyvCbpNCuZpRpMHmPHgK4G+OXfREEYK6YZe/X6w3zD0hf3XlSAIFFkhdnC8X9MysLcncu2RNRclznmAk6vPHp6lAR+1dcvqpXlm8ISm3+7eBsk1HVJ0wzBdVDe7EtTaTJyQe9V3cGfYQkfky49vwHU888pIPeQbWrqfLRys/h8ZPktedazdhQwxZgt0AuVQw6D6mA+wVj9cMy05lh4kO0WTegi+C+l0y58uzYB8DdcLAdt+3Zp+VeXNvnw5YMe8rZr3xk7da0U9AvHTrE=
Content-ID: <8D3AE6F9F26D914F9993DB91D44E28C9@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fea72a9b-8759-4a4e-8ed2-08d70e7f5874
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 08:34:00.5662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2730
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 08/14] AMD/IOMMU: introduce 128-bit IRTE
 non-guest-APIC IRTE format
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Brian
 Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxOToyNywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTYvMDcvMjAx
OSAxNzozOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBUaGlzIGlzIGluIHByZXBhcmF0aW9uIG9m
IGFjdHVhbGx5IGVuYWJsaW5nIHgyQVBJQyBtb2RlLCB3aGljaCByZXF1aXJlcw0KPj4gdGhpcyB3
aWRlciBJUlRFIGZvcm1hdCB0byBiZSB1c2VkLg0KPj4NCj4+IEEgc3BlY2lmaWMgcmVtYXJrIHJl
Z2FyZGluZyB0aGUgZmlyc3QgaHVuayBjaGFuZ2luZw0KPj4gYW1kX2lvbW11X2lvYXBpY191cGRh
dGVfaXJlKCk6IFRoaXMgYnlwYXNzIHdhcyBpbnRyb2R1Y2VkIGZvciBYU0EtMzYsDQo+PiBpLmUu
IGJ5IDk0ZDRhMTExOWQgKCJBTUQsSU9NTVU6IENsZWFuIHVwIG9sZCBlbnRyaWVzIGluIHJlbWFw
cGluZw0KPj4gdGFibGVzIHdoZW4gY3JlYXRpbmcgbmV3IG9uZSIpLiBPdGhlciBjb2RlIGludHJv
ZHVjZWQgYnkgdGhhdCBjaGFuZ2UgaGFzDQo+PiBtZWFud2hpbGUgZGlzYXBwZWFyZWQgb3IgZnVy
dGhlciBjaGFuZ2VkLCBhbmQgSSB3b25kZXIgaWYgLSByYXRoZXIgdGhhbg0KPj4gYWRkaW5nIGFu
IHgyYXBpY19lbmFibGVkIGNoZWNrIHRvIHRoZSBjb25kaXRpb25hbCAtIHRoZSBieXBhc3MgY291
bGRuJ3QNCj4+IGJlIGRlbGV0ZWQgYWx0b2dldGhlci4gRm9yIG5vdyB0aGUgZ29hbCBpcyB0byBh
ZmZlY3QgdGhlIG5vbi14MkFQSUMNCj4+IHBhdGhzIGFzIGxpdHRsZSBhcyBwb3NzaWJsZS4NCj4g
DQo+IFRoZXJlIGFyZSBwbGVudHkgb2YgbWlzdGFrZXMgd2l0aCBYU0EtMzYuwqAgUmVhZGluZyB0
aGUgWFNBIGJhY2ssIHRoZQ0KPiBNSVRJR0FUSU9OIHNlY3Rpb24gZ2V0cyB0aGUgc2Vuc2Ugb2Yg
dGhlIGlvbW11PWFtZC1pb21tdS1wZXJkZXYtaW50cmVtYXANCj4gYm9vbGVhbiB0aGUgd3Jvbmcg
d2F5IGFyb3VuZC7CoCBPaCB3ZWxsLi4uDQo+IA0KPiBTUDUxMDAgZXJyYXR1bSAyOCBvbmx5IHJl
cXVpcmVzIHRoYXQgdGhlIElERSBhbmQgU0FUQSBkZXZpY2VzIHNoYXJlDQo+IHRhYmxlcywgbm90
IHRoYXQgZXZlcnkgZGV2aWNlIG9uIHRoZSB3aG9sZSBzeXN0ZW0gc2hhcmVzIHRhYmxlcy4NCj4g
DQo+IFdpdGggdGhlIHByb3Bvc2VkIHdvcmsgdG8gcGVyZm9ybSBJT01NVSBhc3NpZ25tZW50IGJ5
IGdyb3VwIHJhdGhlciB0aGFuDQo+IGluZGl2aWR1YWxseSwgdGhpcyB3aWxsIG5hdHVyYWxseSBm
YWxsIG91dCBhcyBhIHF1aXJrIHJlcXVpcmluZyB0aGUgdHdvDQo+IGRldmljZXMgdG8gYmUgZ3Jv
dXBlZCwgYXQgd2hpY2ggcG9pbnQgd2UgY2FuIGRyb3AgYWxsIHJlbW5hbnRzIG9mIGdsb2JhbA0K
PiByZW1hcHBpbmcgdGFibGVzLg0KDQpZZXMsIGFuZCBJJ2xsIGJlIGhhcHB5IHRvIHNlZSB0aGVt
IGdvIGF3YXkuDQoNCj4gSW4gdGhpcyBjYXNlLCBJJ20gbm90IHN1cmUgaXQgaXMgd29ydGggY2Fy
aW5nIGFib3V0IHNoYXJlZC10YWJsZSBtb2RlIG9uDQo+IHgyYXBpYy1jYXBhYmxlIHN5c3RlbXMu
wqAgMCBwZW9wbGUgd2lsbCBiZSB1c2luZyB0aGF0IG1vZGUuwqAgVGhhdCBzYWlkLA0KPiBpZiBp
dHMgZWFzaWVyIHRvIHdhaXQgdW50aWwgdGhlIElPTU1VIGNoYW5nZXMgdG8gbWFrZSB0aGlzIGFk
anVzdG1lbnQsDQo+IHRoZW4gZmluZS4NCg0KSXQgY2VydGFpbmx5IGlzLCBlc3BlY2lhbGx5IHdp
dGggYmFja3BvcnRpbmcgb2YgdGhpcyBzZXJpZXMgaW4gbWluZC4NCg0KPj4gQEAgLTE0Miw3ICsx
NzgsMTUgQEAgc3RhdGljIHZvaWQgZnJlZV9pbnRyZW1hcF9lbnRyeShjb25zdCBzdA0KPj4gICAg
ew0KPj4gICAgICAgIHVuaW9uIGlydGVfcHRyIGVudHJ5ID0gZ2V0X2ludHJlbWFwX2VudHJ5KGlv
bW11LCBiZGYsIGluZGV4KTsNCj4+ICAgIA0KPj4gLSAgICBBQ0NFU1NfT05DRShlbnRyeS5wdHIz
Mi0+cmF3WzBdKSA9IDA7DQo+PiArICAgIGlmICggaW9tbXUtPmN0cmwuZ2FfZW4gKQ0KPj4gKyAg
ICB7DQo+PiArICAgICAgICBBQ0NFU1NfT05DRShlbnRyeS5wdHIxMjgtPnJhd1swXSkgPSAwOw0K
Pj4gKyAgICAgICAgLyogTG93IGhhbGYgKGNvbnRhaW5pbmcgUmVtYXBFbikgbmVlZHMgdG8gYmUg
Y2xlYXJlZCBmaXJzdC4gKi8NCj4+ICsgICAgICAgIGJhcnJpZXIoKTsNCj4gDQo+IFdoaWxlIHRo
aXMgd2lsbCBmdW5jdGlvbiBvbiB4ODYsIEkgc3RpbGwgY29uc2lkZXIgdGhpcyBidWdneS7CoCBG
cm9tIGENCj4gY29uY2VwdHVhbCBwb2ludCBvZiB2aWV3LCBiYXJyaWVyKCkgaXMgbm90IHRoZSBj
b3JyZWN0IGNvbnN0cnVjdGlvbiB0bw0KPiB1c2UsIHdoZXJlYXMgc21wX3dtYigpIGlzLg0KDQpJ
IHRoaW5rIGl0J3MgdGhlIDNyZCB0aW1lIG5vdyB0aGF0IEkgcmVzcG9uZCBzYXlpbmcgdGhhdCBi
YXJyaWVyKCkgaXMNCmFzIGdvb2Qgb3IgYXMgYmFkIGFzIHNtcF93bWIoKSwganVzdCBmb3IgZGlm
ZmVyZW50IHJlYXNvbnMuIFdoaWxlIEkNCmFncmVlIHdpdGggeW91IHRoYXQgYmFycmllcigpIGlz
IGNvcnJlY3Qgb24geDg2IG9ubHksIEknbSB5ZXQgdG8gaGVhcg0KYmFjayBmcm9tIHlvdSBvbiBt
eSBhcmd1bWVudCB0aGF0IHNtcF93bWIoKSBpcyBpbmNvcnJlY3Qgd2hlbg0KY29uc2lkZXJpbmcg
aXRzIFVQIHNlbWFudGljcyAod2hpY2ggd2UgZG9uJ3QgY3VycmVudGx5IGltcGxlbWVudCwgYnV0
DQp3aGljaCBMaW51eCBhcyB0aGUgb3JpZ2luIG9mIHRoZSBjb25zdHJ1Y3QgY2FuIHdlbGwgYmUg
dXNlZCBmb3INCnJlZmVyZW5jZSkuIEFuZCBJIHRoaW5rIHdlIGJvdGggZG9uJ3QgcmVhbGx5IHdh
bnQgd21iKCkgaGVyZS4NCg0KPiBBcyB0aGlzIGlzIHRoZSBvbmx5IHJlbWFpbmluZyBpc3N1ZSwg
d2l0aCBpdCBmaXhlZCBpbiBlYWNoIGxvY2F0aW9uLA0KPiBBY2tlZC1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KSSdtIG5vdCBnb2luZyB0byBhcHBseSB0
aGlzIGZvciBub3csIHVudGlsIHdlJ3ZlIG1hbmFnZWQgdG8gY29tZSB0byBhbg0KYWdyZWVtZW50
IG9uIHRoZSBpdGVtIGFib3ZlLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
