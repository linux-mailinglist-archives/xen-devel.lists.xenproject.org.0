Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953186E35B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 11:24:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoP3x-0006iO-Ep; Fri, 19 Jul 2019 09:20:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoP3v-0006iD-H0
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 09:20:23 +0000
X-Inumbo-ID: 6ca08e1e-aa06-11e9-b1d0-b77d4499df5b
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ca08e1e-aa06-11e9-b1d0-b77d4499df5b;
 Fri, 19 Jul 2019 09:20:18 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 09:20:16 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 09:19:04 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 09:19:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayu/VMPMBNoVRXNRb7nT0izwMeQGN6aFR34BuBkVljaSZzW6UkqyF6Rx091lbNQSTzTagKBuBQuz9U9BWJYyq0jcHye/yWEzT1NEpqO07yhTyoSWzW+v1ougLKlCm6JcByWv8YSDStkMjRj0AWmqdHtXGvFgGHDe0xbooGVfNEvsWO9bt+gPriu/KYu5y6xz6LKM+9FTMVSm8OPh8ffBe5f8TUK/2wMjMXADWECUyKmeBZA2be4QwSHCUheQNPriM+MLFvytsp/gZq3tC6ag4rJQJEQrBVb2antjDQcKb6sEAxCMLBBe6apADBOotPBnnx3ibEJnQZN3brJEFN4DYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eh5fJyr96BwL7NmKrJgjTloQpCJzgn1wF8ZNuZ6dMnw=;
 b=Dc9SwMhVDHw17M1rD4upZQFD+K0gQhVW58gfSbTXiefxin10JhngoBE27xucupUlnimfHjXn9PwIZUrws30eqF+3toSd/sAYCNYa+f+T9DRm706Nq7zWh1UpixoQOQIcJNPwPrTHojV1KIgQeH+93nJXfUFbtWN3HrRbjK0/hRle5YNAWOB63IAcPLvvXHUlSwVT9IHfhiH7f6UJ0p6m2qUjvb3sS3IqEsV7jl9avqpo+QR/5ycoslMPBflCJ1AwwxKwr5u+RQDBuGKcgI3o5Uht3EJPNW85FWBpQ1IGvtxfBUufP2dKUX1Wf2z+RnkmQ+2H21pAkxRTJnS8Mvvvjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2475.namprd18.prod.outlook.com (20.179.104.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 09:19:02 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 09:19:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 2/2] CODING_STYLE: list further brace placement exceptions
Thread-Index: AQHVPhMBr+RUGGWe+UK6rQHc+fBEZA==
Date: Fri, 19 Jul 2019 09:19:02 +0000
Message-ID: <29b489fe-d7ad-68b8-b555-2a6381a28829@suse.com>
References: <f1a5d1b0-564e-8f04-f43e-f5c68466751b@suse.com>
In-Reply-To: <f1a5d1b0-564e-8f04-f43e-f5c68466751b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::21) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d17bf8b-575d-4f6f-20bc-08d70c2a23b5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB2475; 
x-ms-traffictypediagnostic: DM6PR18MB2475:
x-microsoft-antispam-prvs: <DM6PR18MB24754CD171D3ECFDC51BFD7CB3CB0@DM6PR18MB2475.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(189003)(199004)(52116002)(81156014)(81166006)(14454004)(6916009)(4326008)(80792005)(186003)(5660300002)(31696002)(66066001)(6512007)(478600001)(66946007)(2906002)(66556008)(66446008)(64756008)(66476007)(54906003)(86362001)(316002)(6486002)(6436002)(446003)(68736007)(11346002)(305945005)(8676002)(3846002)(476003)(2616005)(5640700003)(2351001)(99286004)(71200400001)(71190400001)(7736002)(8936002)(31686004)(36756003)(486006)(76176011)(102836004)(6506007)(386003)(6116002)(26005)(53936002)(25786009)(256004)(2501003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2475;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7ZQJHzRf0ZXLEp54SuZsNLFQrez91Z/umPlE/PcBPI2XWqpAuVdECPoj6OVws5AL2muoWpA7nbJdGu9bbWHCM0JquFypvK8wroB74J0E77D07GDNozrlSjXBlFiS4N3gonvW07q0GpyQd55HI3KP/J2QR+xvjs9EMHbleHb+buyPad3QoCLPLHXRNLBvA1jhORxpzAPYSzh9IYE/kbBZKrtcdOhnko+QOJobElOYCqWeMpV74Vn8GR2bA7iSJC3DtLBTNhG0qutbqLaCV/6xvs2QzJZCIANlRCoEj6fV9fWxYrJ2nKhjmsn/q5BKtiOgwAe2oCl/9cq02sa1tO6EaHeZLzwKvtYQ227n4HjAfZG6QSdDCCBdMtVoi76z0XDZ1E74HIqK54+IEHkvAHP/tqKghF3jzWJosmayk/TH2uc=
Content-ID: <DBA2A6244CF7D34480F22A4C3BF4A208@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d17bf8b-575d-4f6f-20bc-08d70c2a23b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 09:19:02.5266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2475
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH 2/2] CODING_STYLE: list further brace placement
 exceptions
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, JulienGrall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9yIGVhc3kgc3BvdHRpbmcgb2Ygc3RydWN0L3VuaW9uL2VudW0gZGVmaW5pdGlvbnMgd2UgYWxy
ZWFkeSBjb21tb25seQ0KcGxhY2UgdGhlIG9wZW5pbmcgYnJhY2VzIG9uIHRoZSBpbml0aWFsIGxp
bmUgb2Ygc3VjaCBhIGRlZmluaXRpb24uDQoNCldlIGFsc28gb2Z0ZW4gZG9uJ3QgcGxhY2UgdGhl
IG9wZW5pbmcgYnJhY2Ugb2YgYW4gaW5pdGlhbGl6ZXIgb24gYQ0Kc2VwYXJhdGUgbGluZS4NCg0K
QW5kIGZpbmFsbHkgZm9yIGNvbXBvdW5kIGxpdGVyYWxzIHBsYWNpbmcgdGhlIGJyYWNlcyBvbiBz
ZXBhcmF0ZSBsaW5lcw0Kb2Z0ZW4gbWFrZXMgdGhlIGNvZGUgbW9yZSBkaWZmaWN1bHQgdG8gcmVh
ZCwgc28gaXQgc2hvdWxkIChhbmQgaW4NCnByYWN0aWNlIGRvZXMpIHR5cGljYWxseSBnbyBvbiB0
aGUgc2FtZSBsaW5lIGFzIHdlbGwuICBUaGUgcGxhY2VtZW50IG9mDQp0aGUgY2xvc2luZyBicmFj
ZSBvZnRlbiBkZXBlbmRzIG9uIGhvdyBsYXJnZSBzdWNoIGEgY29tcG91bmQgbGl0ZXJhbCBpcy4N
Cg0KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KLS0tDQpU
QkQ6IFdlIG1heSB3YW50IHRvIG1ha2UgZXhwbGljaXQgdGhhdCBmb3IgaW5pdGlhbGl6ZXJzIGJv
dGggZm9ybXMgYXJlDQogICAgICBmaW5lLg0KDQotLS0gYS9DT0RJTkdfU1RZTEUNCisrKyBiL0NP
RElOR19TVFlMRQ0KQEAgLTY0LDggKzY0LDEzIEBAIEJyYWNpbmcNCiAgLS0tLS0tLQ0KICANCiAg
QnJhY2VzICgneycgYW5kICd9JykgYXJlIHVzdWFsbHkgcGxhY2VkIG9uIGEgbGluZSBvZiB0aGVp
ciBvd24sIGV4Y2VwdA0KLWZvciB0aGUgZG8vd2hpbGUgbG9vcC4gIFRoaXMgaXMgdW5saWtlIHRo
ZSBMaW51eCBjb2Rpbmcgc3R5bGUgYW5kDQotdW5saWtlIEsmUi4gIGRvL3doaWxlIGxvb3BzIGFy
ZSBhbiBleGNlcHRpb24uIGUuZy46DQorZm9yDQorLSB0aGUgZG8vd2hpbGUgbG9vcA0KKy0gdGhl
IG9wZW5pbmcgYnJhY2UgaW4gZGVmaW5pdGlvbnMgb2YgZW51bSwgc3RydWN0LCBhbmQgdW5pb24N
CistIHRoZSBvcGVuaW5nIGJyYWNlIGluIGluaXRpYWxpemVycw0KKy0gY29tcG91bmQgbGl0ZXJh
bHMNCitUaGlzIGlzIHVubGlrZSB0aGUgTGludXggY29kaW5nIHN0eWxlIGFuZCB1bmxpa2UgSyZS
LiAgZG8vd2hpbGUgbG9vcHMNCithcmUgb25lIGV4Y2VwdGlvbi4gZS5nLjoNCiAgDQogIGlmICgg
Y29uZGl0aW9uICkNCiAgew0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
