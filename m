Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B0B5E034
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 10:50:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiavO-0006GL-Dn; Wed, 03 Jul 2019 08:47:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiavN-0006GG-6G
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 08:47:33 +0000
X-Inumbo-ID: 2ebb2c9c-9d6f-11e9-b5a5-a713834754a5
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ebb2c9c-9d6f-11e9-b5a5-a713834754a5;
 Wed, 03 Jul 2019 08:47:29 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 08:47:27 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 08:46:11 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 08:46:11 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3252.namprd18.prod.outlook.com (10.255.136.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 08:46:10 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 08:46:10 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 05/10] AMD/IOMMU: introduce 128-bit IRTE
 non-guest-APIC IRTE format
Thread-Index: AQHVMO2UOHmA7j9ffkazg1PUO76EkKa4laSA
Date: Wed, 3 Jul 2019 08:46:10 +0000
Message-ID: <9dbc26cf-4b53-d5ad-3af2-1169de63a4d3@suse.com>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
 <5D14DEEB020000780023B987@prv1-mh.provo.novell.com>
 <330aa2a1-bb69-140e-3a91-125b82df755f@citrix.com>
In-Reply-To: <330aa2a1-bb69-140e-3a91-125b82df755f@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0202CA0017.eurprd02.prod.outlook.com
 (2603:10a6:4:29::27) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c22cfec-d5d4-4562-32ab-08d6ff92e572
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3252; 
x-ms-traffictypediagnostic: BY5PR18MB3252:
x-microsoft-antispam-prvs: <BY5PR18MB32521A3A18929B57D858ED68B3FB0@BY5PR18MB3252.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(189003)(199004)(486006)(3846002)(476003)(256004)(2906002)(2616005)(36756003)(11346002)(66066001)(99286004)(4326008)(66946007)(6486002)(73956011)(478600001)(71190400001)(26005)(71200400001)(110136005)(14444005)(66446008)(31696002)(6506007)(5660300002)(86362001)(25786009)(6116002)(64756008)(66556008)(6246003)(66476007)(446003)(68736007)(386003)(305945005)(229853002)(6436002)(52116002)(7736002)(54906003)(6512007)(102836004)(8936002)(80792005)(81166006)(81156014)(76176011)(14454004)(31686004)(53936002)(316002)(53546011)(72206003)(8676002)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3252;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3tvwsXFkG4moTNz5rcNRwLf/zQvQPRoeiJ0Zd09BZyQmrcgr0diF9gjS0RcdkG6GQE8Ptjfzo9+Fo55jM1Ny9uF4OugP1wdJszviqX7L28+TFQWu11qZGXErIzk7zM9bFSj7LFeDiDF1qKSlXxUQII/J6LVZR1RN9PSKZ9wigfs5qvt05M8UxLKvI1njZ4ZD2dkkeXQnoCNf6pNSeRieL/UOzg7AGqIIRRL8h3uoyHA1+t4T1YQEEDHi2buTYRETeFITUqZ8XvS1rf3hKP55VgsQ/xxvZVaoFQk5lxxCr7oyq6cqLR90fzIeIHkKIGJy8NpfxmmIF06vRMg8H0jhBm9FenzNEcId4t46VZyxOB8PSq8nV664fLfTP3K9v9Evv4bo20yAMN4N0Fk4fTuCKaR9dn8PQaRQmb3oLsvqxIU=
Content-ID: <35C8C6185F963F4DAF5C360189884FC1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c22cfec-d5d4-4562-32ab-08d6ff92e572
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 08:46:10.0937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3252
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 05/10] AMD/IOMMU: introduce 128-bit IRTE
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMjAxOSAxNjo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjcvMDYvMjAx
OSAxNjoyMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBAQCAtMTQyLDcgKzE4NywyMSBAQCBzdGF0
aWMgdm9pZCBmcmVlX2ludHJlbWFwX2VudHJ5KHVuc2lnbmVkDQo+PiAgIHsNCj4+ICAgICAgIHVu
aW9uIGlydGVfcHRyIGVudHJ5ID0gZ2V0X2ludHJlbWFwX2VudHJ5KHNlZywgYmRmLCBpbmRleCk7
DQo+PiAgIA0KPj4gLSAgICBBQ0NFU1NfT05DRShlbnRyeS5wdHIzMi0+cmF3WzBdKSA9IDA7DQo+
PiArICAgIHN3aXRjaCAoIGlydGVfbW9kZSApDQo+PiArICAgIHsNCj4+ICsgICAgY2FzZSBpcnRl
MzI6DQo+PiArICAgICAgICBBQ0NFU1NfT05DRShlbnRyeS5wdHIzMi0+cmF3WzBdKSA9IDA7DQo+
PiArICAgICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAgY2FzZSBpcnRlMTI4Og0KPj4gKyAgICAg
ICAgQUNDRVNTX09OQ0UoZW50cnkucHRyMTI4LT5yYXdbMF0pID0gMDsNCj4+ICsgICAgICAgIGJh
cnJpZXIoKTsNCj4gDQo+IHNtcF93bWIoKS4NCj4gDQo+IFVzaW5nIGJhcnJpZXIgaGVyZSBpc24n
dCB0ZWNobmljYWxseSBjb3JyZWN0LCBiZWNhdXNlIHdoYXQgbWF0dGVycyBpcw0KPiB0aGUgZXh0
ZXJuYWwgdmlzaWJpbGl0eSBvZiB0aGUgd3JpdGUuDQo+IA0KPiBJdCBmdW5jdGlvbnMgY29ycmVj
dGx5IG9uIHg4NiBiZWNhdXNlIHNtcF93bWIoKSBpcyBiYXJyaWVyKCksIGJ1dCB0aGlzDQo+IGNv
ZGUgZG9lc24ndCB3b3JrIGNvcnJlY3RseSBvbiBlLmcuIEFSTS4NCg0KV2VsbCwgSSBkaWQgcmVw
bHkgdG8gYSBzaW1pbGFyIGVhcmxpZXIgY29tbWVudCBvZiB5b3VycywgYW5kIEkNCmhhZCBob3Bl
ZCB0byBnZXQgYSByZXBseSBmcm9tIHlvdSBpbiB0dXJuIGJlZm9yZSBhY3R1YWxseSBzZW5kaW5n
DQpvdXQgdjIuIEFzIHNhaWQgdGhlcmUsIHNtcF93bWIoKSBpc24ndCBjb3JyZWN0IGVpdGhlciwg
eWV0IHlvdQ0KYWxzbyBkb24ndCB3YW50IHdtYigpIGhlcmUuIEV2ZW4gaWYgd2UgZG9uJ3QgcGF0
Y2ggdGhlbSBvdXJzZWx2ZXMsDQp3ZSBzaG91bGQgc3RpbGwgZm9sbG93IHRoZSBhYnN0cmFjdCBM
aW51eCBtb2RlbCBhbmQgX2Fzc3VtZV8NCnNtcF8qbWIoKSBjb252ZXJ0IHRvIG5vLW9wIHdoZW4g
cnVubmluZyBvbiBhIFVQIHN5c3RlbS4gVGhlDQpiYXJyaWVyLCBob3dldmVyLCBpcyBuZWVkZWQg
ZXZlbiBpbiB0aGF0IGNhc2UuDQoNCldoYXQgSSdtIG9rYXkgdG8gZG8gaXMgYWNjb21wYW55IHRo
ZSBiYXJyaWVyKCkgKG9yLCBpZiB5b3UgaW5zaXN0LA0Kc21wX3dtYigpKSB1c2Ugd2l0aCBhIGNv
bW1lbnQgY2xhcmlmeWluZyB0aGF0IHRoaXMgaXMgZmluZSBmb3IgeDg2LA0KYnV0IHdvdWxkIG5l
ZWQgY2hhbmdpbmcgaWYgdGhlIGNvZGUgd2FzIGluY2x1ZGVkIGluIGJ1aWxkcyBmb3INCm90aGVy
IGFyY2hpdGVjdHVyZXMuDQoNCj4+IEBAIC00NDQsOSArNjAxLDkgQEAgc3RhdGljIGludCB1cGRh
dGVfaW50cmVtYXBfZW50cnlfZnJvbV9tcw0KPj4gICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsN
Cj4+ICAgICAgIHVuaW9uIGlydGVfcHRyIGVudHJ5Ow0KPj4gICAgICAgdTE2IHJlcV9pZCwgYWxp
YXNfaWQ7DQo+PiAtICAgIHU4IGRlbGl2ZXJ5X21vZGUsIGRlc3QsIHZlY3RvciwgZGVzdF9tb2Rl
Ow0KPj4gKyAgICB1aW50OF90IGRlbGl2ZXJ5X21vZGUsIHZlY3RvciwgZGVzdF9tb2RlOw0KPiAN
Cj4gRm9yIHRoZSBpb2FwaWMgdmVyc2lvbiwgeW91IHVzZWQgdW5zaWduZWQgaW50LCByYXRoZXIg
dGhhbiB1aW50OF90LsKgIEknZA0KPiBleHBlY3QgdGhlbSB0byBhdCBsZWFzdCBiZSBjb25zaXN0
ZW50Lg0KDQpUaGUgdHlwZSBjaGFuZ2Ugb24gdGhlIEkvTy1BUElDIHNpZGUgaXMgYmVjYXVzZSAi
ZGVzdCIgaXMgYW1vbmcNCnRoZSB2YXJpYWJsZXMgdGhlcmUuIEJ1dCBsb29raW5nIGF0IGJvdGgg
Y2hhbmdlcyBhZ2FpbiwgSSBndWVzcw0KSSdsbCByYXRoZXIgdXNlIHRoZSBhcHByb2FjaCBoZXJl
IGFsc28gaW4gdGhlIEkvTy1BUElDIGZ1bmN0aW9uLA0KbW92aW5nICJkZXN0IiBkb3duIHRvZ2V0
aGVyIHdpdGggIm9mZnNldCIuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
