Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C3E714DA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 11:17:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpqsa-00037u-Tw; Tue, 23 Jul 2019 09:14:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpqsY-00037k-Li
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 09:14:38 +0000
X-Inumbo-ID: 3a2a81f2-ad2a-11e9-95a5-e7bcdab08fbc
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a2a81f2-ad2a-11e9-95a5-e7bcdab08fbc;
 Tue, 23 Jul 2019 09:14:33 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 09:14:13 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 09:12:32 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 09:12:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8Bc2zkTFtYqTjwLUxLOerptCJKJOYu4o8vmD9/XSe/lP4CfbKP7lIZrzHql9yDLTUGtB3Z1P5H62+jzl/uB/JPkxorp0OwZaJjMeDYdcHksyNMJivnankWegVv/RxeWGkxtrh9wWiw/mTnRXT6hYyHbwWcd9QgYaabHYRo8dfKKbgHqVwXfm4/u7moSpmCMFGCwlDrepAt9zCieuoPpj4OxsqAq4xxMce96Y3yn3KhL6mM4A3YCGyvugjL9P/vDbfVOFn+lnZhQSwyXLMPRH4Yl70OgwqLlaibuj/MBGvDXed+g/J/WvoA7De8EcKH2DZIpdqd+4TXECWgWungjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AG3TnhYXI209fXJPKeDH638TraIzdEF+1qpZDuFU8P4=;
 b=E16umIXlLmQC7cJgOCC8CNFZAsaFoByz0vUI7ydUE9xcS4NRxtDZvMQNF4JbgonkdekbtPAFZ+s/LlqifItwPx8Wykxi8oPAguJaK9apetJljDLX6HHWXbEEURPPh61HL7eGobhdUl3+7GeMgz46zjodaQ6hmHamqDDBUaWBhSBuqlo0as9jbNltU17/1jxs55ctCVVzUtDtqzlokKrKTG1+0+usi7fnqheICQwXzOCVNAWd4D3wIEVenboHFrGZWrICf6SA+boLq/ly3h6q0a/PCkJrh3t6fDL3h9NhugdARX4tzzQFq+DEeitZQD0VkfJ+eMJ2o6QMOWWc4DqSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2570.namprd18.prod.outlook.com (20.179.106.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 09:12:31 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 09:12:31 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrii Anisov <andrii.anisov@gmail.com>
Thread-Topic: [PATCH] vunmap: let vunmap align virtual address by itself
Thread-Index: AQHVPhWLg4cyYnQWKUW8aYX9saIQuqbWZDjPgAAOmQCAABvi84AAAicAgAAFXjOAAVSIOoAABo0A
Date: Tue, 23 Jul 2019 09:12:31 +0000
Message-ID: <039019e1-ac02-019f-9ce1-78ed64198d5e@suse.com>
References: <1563469897-2773-1-git-send-email-andrii.anisov@gmail.com>
 <2d71f4c0-023f-7a09-731e-e84e21378e26@suse.com>
 <261e0c5e-a886-f389-3c37-413613c9bf4f@gmail.com>
 <a4877031-1abd-e683-aae9-5d8ce5df98b5@suse.com>
 <7ddef8b7-ec79-d7ce-4123-31ae63a5e7b3@arm.com>
 <35df7b4d-068d-15d3-2197-d5a6dee23917@suse.com>
 <6e608435-a414-320b-307a-a413c82cf9aa@arm.com>
 <a3b0d7ed-db9d-9c03-9fef-1b42b02b3f4b@gmail.com>
In-Reply-To: <a3b0d7ed-db9d-9c03-9fef-1b42b02b3f4b@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0202CA0024.eurprd02.prod.outlook.com
 (2603:10a6:4:29::34) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 482db415-b3cc-4335-f455-08d70f4de413
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2570; 
x-ms-traffictypediagnostic: DM6PR18MB2570:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM6PR18MB2570D203AAC9D563F337BC1DB3C70@DM6PR18MB2570.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(189003)(199004)(8936002)(102836004)(316002)(229853002)(76176011)(486006)(305945005)(8676002)(81156014)(3846002)(966005)(6506007)(386003)(6916009)(446003)(26005)(478600001)(53546011)(6116002)(256004)(476003)(2616005)(2906002)(52116002)(186003)(80792005)(4326008)(54906003)(11346002)(68736007)(5660300002)(6246003)(53936002)(66066001)(71200400001)(64756008)(31686004)(7736002)(66476007)(66946007)(66556008)(66446008)(86362001)(36756003)(14454004)(6512007)(6436002)(7416002)(31696002)(81166006)(71190400001)(99286004)(25786009)(6486002)(6306002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2570;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: A6nrNKQ+BlphOREEm+QLHJ4XG1Hx7+niB/pD2Zbd38cVgesCijwXKPcy2USyGzgqgIeqi63xbDrG/CZJIMoqIqmJsSlEX4CekpqrY0y03Q5TMIBMYM9Y1hTwXNcbMbMj7C9PHImEUuyCbwOkfSB3Vfoc75AR+xC+Unwulbp03G3XMhx0z9uOVc1wfawgyNbXUbCXm26IYWt+Tm9XVzV4eoq5Bf6lc8f4i5RJ3NVbYJ1FKpMvG2ZmBqp0l9MfIjdGh5FPVkileyqCAymgN16gXLadcxhXzBEZN2ri3SHh5Wqaad+D7wAe37K2vU+edJWq83BpUamRKK/infofv5uXvPcOn22c/1WsrUYAEfmqBFfbcSxaYY5BkyLDeb6qYl/Hyskpni1HJCyMvMu7I8NKwKw38A7w/Kq3Ckme8rU2LUY=
Content-ID: <E438B93A952DE84CA959BAC8A66C29D8@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 482db415-b3cc-4335-f455-08d70f4de413
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 09:12:31.1894 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2570
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] vunmap: let vunmap align virtual address by
 itself
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAxMDo0OCwgQW5kcmlpIEFuaXNvdiB3cm90ZToNCj4gSnVsaWVuLCBKYW4s
IEFuZHJldywNCj4gDQo+IFRoZSBwcm9ibGVtIGFkZHJlc3NlZCBieSBbMV0gY2F1c2VzIHJhbmRv
bSBBUk02NCBib290IGZhaWxzIGRlcGVuZGVudCBvbiBoeXBlcnZpc29yIGNvZGUgY2hhbmdlcy4N
Cj4gWWV0IG1vcmUgZ2VuZXJpYyBzb2x1dGlvbiB3YXMgcmVxdWVzdGVkIGJ5IEFuZHJldyBhbmQg
c3VwcG9ydGVkIGJ5IEp1bGllbiBbMl0uDQo+IA0KPiBIb3cgdG8gcHJvY2VlZCB3aXRoIHRoaXMg
cGFydGljdWxhciBwYXRjaD8NCj4gQXMgSSB1bmRlcnN0YW5kLCBKYW4gZG91YnRzIHdlIHNob3Vs
ZCBtb3ZlIHBhZ2UgYWxpZ25tZW50IHRvIHZ1bm1hcCgpLCB3aGlsZSBKdWxpZW4gYW5kIEFuZHJl
dyB3YW50ZWQgdGhlIGNvbW1pdCBtZXNzYWdlIGNsYXJpZmljYXRpb24uDQo+IENhbiB3ZSBoYXZl
IGFuIGFncmVlbWVudCBvbiBhcHByb2FjaCBoZXJlPw0KPiANCj4gWzFdIGh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMTE2Ny5o
dG1sDQo+IFsyXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVu
LWRldmVsLzIwMTktMDcvbXNnMDExMjkuaHRtbA0KDQpGaXJzdCBvZiBhbGwsIGxldCBtZSBxdW90
ZSBMaW51eCdlcyBjb2RlOg0KDQpzdGF0aWMgdm9pZCBfX3Z1bm1hcChjb25zdCB2b2lkICphZGRy
LCBpbnQgZGVhbGxvY2F0ZV9wYWdlcykNCnsNCglzdHJ1Y3Qgdm1fc3RydWN0ICphcmVhOw0KDQoJ
aWYgKCFhZGRyKQ0KCQlyZXR1cm47DQoNCglpZiAoV0FSTighUEFHRV9BTElHTkVEKGFkZHIpLCAi
VHJ5aW5nIHRvIHZmcmVlKCkgYmFkIGFkZHJlc3MgKCVwKVxuIiwNCgkJCWFkZHIpKQ0KCQlyZXR1
cm47DQoNCkFzIGxvbmcgYXMgd2UgYWltIHRvIGhhdmUgYSByZWFzb25hYmxlIGxldmVsIG9mIGNv
bXBhdGliaWxpdHkgb2YNCnNpbWlsYXIgaW50ZXJmYWNlcywgd2Ugc2hvdWxkIG5vdCBnbyB0aGUg
c3VnZ2VzdGVkIHJvdXRlLg0KDQpCZXlvbmQgdGhhdCBJIGNvbnRpbnVlIHRvIGJlIG9mIHRoZSBv
cGluaW9uIHRoYXQgaXQgc2hvdWxkIGJlDQphbGwtb3Itbm90aGluZzogQW55IHBvaW50ZXIgcG9p
bnRpbmcgYW55d2hlcmUgYXQgb3IgaW5zaWRlIHRoZQ0KcmVnaW9uIHNob3VsZCBiZSBhY2NlcHRl
ZCwgb3IganVzdCB0aGUgb25lIHBvaW50aW5nIHByZWNpc2VseSBhdA0KdGhlIHN0YXJ0Lg0KDQpK
YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
