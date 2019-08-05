Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CFC818F2
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 14:15:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hubqM-0006rf-41; Mon, 05 Aug 2019 12:12:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hubqK-0006ra-TK
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 12:12:00 +0000
X-Inumbo-ID: 373feaae-b77a-11e9-8377-3767f31ce629
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 373feaae-b77a-11e9-8377-3767f31ce629;
 Mon, 05 Aug 2019 12:11:58 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 12:11:48 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 12:11:03 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 12:11:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oF2uH/7FSFdNYqxczIo+Ttfv//vR0kHKC5HvCMNutMov22kt7NcRTVB+mcCVrOGq8su7X/ybtPckyObxDDntf6rpCj1hCSWkJSYX/YNlgn1HOLq+UdGf6hh+HTj9/CXgPTkXRJVMAAH7NgzkGez2HEa0Ho6fjZqX35EO5n5au/ck8Yu5FdG3nRF8gWJg77aF8pAZmnCPIbs5/Tue9RapCd9JD23ZrT8KytSfv5V7qq8zjpcO3ohGP7pKjK1EMcR9BR4UOQ/fYrmPtUz7+g9XZEevdCcR+N+rWBSdyov3zGH0oUUU0ELuvncRTa/FnBtBNwCoqfEiMwXx34DxRR2XBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dg8TJ3+Zvq4OJPh/OVxOpvH4h7RsYISV9ITZGvB9g4Q=;
 b=FN1GwxF4tboLR9Ou6xnRk/5/OiOF+n6fcKaTRxyxi9YR8ua1CdnDaBnvDEsAJRU7CspX1zS6M4OdIc/StRTZRyhHU4Mpb89fjt3v1KpFSpi6yB/6eJp7lHVcZ5K8fRkchT4p4UW3nM191KeW3XyVNZXt68NLjkRZ3V+ZZN99zanF0T6bG/ewDFwhwqnBYCV9+60lap69bTr8Xf0+gYSbmsxFFEotuNW4T00kLpdoDpb1JaE/cZ10ZGlnlyj9x0aFgQrUpxBhcx+KbYo018HVJHwJBsetQuO7O8EHXqegj7FtG2uWg0yuMV9p1ZpXEx50EgFPe3XNoaM2stQ+6RcNAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3085.namprd18.prod.outlook.com (20.179.21.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 12:11:02 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 12:11:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v8 16/16] microcode: block #NMI handling when loading an
 ucode
Thread-Index: AQHVSFKrqDJQeAvFNUKw2nxS+/LtoqbsfQuA
Date: Mon, 5 Aug 2019 12:11:01 +0000
Message-ID: <8f6d506f-ee05-ab43-ef5f-8301f3845d4d@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-17-git-send-email-chao.gao@intel.com>
In-Reply-To: <1564654971-31328-17-git-send-email-chao.gao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR10CA0040.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::20) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d06c9a9d-7919-46b5-a6aa-08d7199dfb89
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3085; 
x-ms-traffictypediagnostic: MN2PR18MB3085:
x-microsoft-antispam-prvs: <MN2PR18MB308598051A6FE763EA85712CB3DA0@MN2PR18MB3085.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:843;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(189003)(199004)(86362001)(25786009)(31696002)(7736002)(5660300002)(305945005)(68736007)(81156014)(81166006)(8676002)(66446008)(36756003)(66476007)(66556008)(66946007)(64756008)(6116002)(3846002)(31686004)(8936002)(76176011)(316002)(110136005)(54906003)(6506007)(53546011)(6512007)(102836004)(476003)(53936002)(6486002)(71190400001)(71200400001)(229853002)(99286004)(52116002)(386003)(6436002)(14444005)(6246003)(446003)(11346002)(4326008)(80792005)(14454004)(486006)(66066001)(478600001)(2906002)(2616005)(26005)(186003)(256004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3085;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ntMy7/NRgliCZqSzp1RbU1zH/Z7/AWVvFaGGQHajaEQN7HEMqQojmY1cq+a0T+T8DDPT0Jucbawxpko1THTirTMCol626al8idPm5HXdLQYK/iW2sAt4tlgrHFkiDujPhi0ZuXfy+aL3YUldVgxPxiHuiIxJ9D5Cvn1f92Md7vTk2Y74KCL5MXk+FhiGaoATi2b60muYti6C/+6OG/akdU7BH6xfdOgfg/NPM24R1D6l85W/bWYDRl0noE/i7XQohNPE3p+KdkbI6/CbKrzdhqOj2cFNSuluITNHPGoasPIshFR/TBIccWf8rViHLaN0hTem3gsf0nwd6D23ni2DhDCW/C/jmy9ilKqn85+2ZqELtabCRtlNE8HyygOIkat/IfwF/IkkzWH9EUaHAyKrlUqJRLdFIkH2dKtNZjhngy4=
Content-ID: <2D3E1A1C700E2C48BB3DBD4AC04E6539@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d06c9a9d-7919-46b5-a6aa-08d7199dfb89
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 12:11:01.8595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3085
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 16/16] microcode: block #NMI handling
 when loading an ucode
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
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDguMjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+IEBAIC00MzksMTIgKzQ0MCwz
NyBAQCBzdGF0aWMgaW50IGRvX21pY3JvY29kZV91cGRhdGUodm9pZCAqcGF0Y2gpDQo+ICAgICAg
IHJldHVybiByZXQ7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIGludCBtaWNyb2NvZGVfbm1pX2Nh
bGxiYWNrKGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCBpbnQgY3B1KQ0KPiArew0K
PiArICAgIGJvb2wgcHJpbnQgPSBmYWxzZTsNCj4gKw0KPiArICAgIC8qIFRoZSBmaXJzdCB0aHJl
YWQgb2YgYSBjb3JlIGlzIHRvIGxvYWQgYW4gdXBkYXRlLiBEb24ndCBibG9jayBpdC4gKi8NCj4g
KyAgICBpZiAoIGNwdSA9PSBjcHVtYXNrX2ZpcnN0KHBlcl9jcHUoY3B1X3NpYmxpbmdfbWFzaywg
Y3B1KSkgKQ0KPiArICAgICAgICByZXR1cm4gMDsNCj4gKw0KPiArICAgIGlmICggbG9hZGluZ19z
dGF0ZSA9PSBMT0FESU5HX0VOVEVSRUQgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgY3B1bWFza19z
ZXRfY3B1KGNwdSwgJmNwdV9jYWxsaW5fbWFwKTsNCj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19E
RUJVRyAiQ1BVJXUgZW50ZXJzICVzXG4iLCBzbXBfcHJvY2Vzc29yX2lkKCksIF9fZnVuY19fKTsN
Cg0KSGVyZSAgYW5kIC4uLg0KDQo+ICsgICAgICAgIHByaW50ID0gdHJ1ZTsNCj4gKyAgICB9DQo+
ICsNCj4gKyAgICB3aGlsZSAoIGxvYWRpbmdfc3RhdGUgPT0gTE9BRElOR19FTlRFUkVEICkNCj4g
KyAgICAgICAgcmVwX25vcCgpOw0KPiArDQo+ICsgICAgaWYgKCBwcmludCApDQo+ICsgICAgICAg
IHByaW50ayhYRU5MT0dfREVCVUcgIkNQVSV1IGV4aXRzICVzXG4iLCBzbXBfcHJvY2Vzc29yX2lk
KCksIF9fZnVuY19fKTsNCg0KLi4uIGhlcmUgLSB3aHkgc21wX3Byb2Nlc3Nvcl9pZCgpIHdoZW4g
eW91IGNhbiB1c2UgImNwdSI/IEFuZCB3aGF0DQp1c2UgaXMgX19mdW5jX18gaGVyZT8NCg0KVGhl
IHJlcF9ub3AoKSBhYm92ZSBhbHNvIHByZXN1bWFibHkgd2FudHMgdG8gYmUgY3B1X3JlbGF4KCkg
YWdhaW4uDQoNCkJ1dCBvbiB0aGUgd2hvbGUgSSB3YXMgcmVhbGx5IGhvcGluZyBmb3IgbW9yZSBh
Z2dyZXNzaXZlIGRpc2FibGluZw0Kb2YgTk1JIGhhbmRsaW5nLCBtb3JlIGxpa2UgKGJ1dCBvZiBj
b3Vyc2Ugbm90IHF1aXRlIGFzIGhlYXZ5IGFzKQ0KdGhlIGNyYXNoIHBhdGggd2lyaW5nIHRoZSBJ
RFQgZW50cnkgdG8gdHJhcF9ub3AoKS4gQW5kcmV3LCBJJ20NCmN1cmlvdXMgdG8gbGVhcm4gd2hh
dCB5b3UncmUgdGhpbmtpbmcgd291bGQgYmUgYmVzdCBoZXJlLg0KDQpKYW4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
