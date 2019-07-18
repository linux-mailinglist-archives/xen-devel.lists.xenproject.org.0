Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB56CE77
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:02:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho5zj-0005xs-7X; Thu, 18 Jul 2019 12:58:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho5zh-0005xk-CL
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 12:58:45 +0000
X-Inumbo-ID: c319bf46-a95b-11e9-a1e7-17e7bd1bd251
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c319bf46-a95b-11e9-a1e7-17e7bd1bd251;
 Thu, 18 Jul 2019 12:58:43 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 12:58:36 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 12:58:11 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 12:58:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ha6G+/562z08QImskqJomHWLRDTEGsb2jhXWxg8euu/UvMxDolGGXnPVjot5gSKzFzs/hvFBNcaJFhZGN0vPPArF5ZqEtIYctNfX6oZAVLgHTChBhT9zsNahBOsyUohsSPsN5UlmJ75dIxew6hI6KRSr58Dm012tFBC/AsvnEE5IZ36XYDGzsY/oXFf49zkTCOvCBw9Mb/wW1M+fAnSw/ptXkz8zWsR5pUNLyY4Lq0Xq4w7vtNSD/jT+33tAg1r3NX90XGlPBzbqc/sZm/gqy8shSGEZWwPKRSmyeha2a3w91ldmMEgyu3pyxt8RMcVv629gKnL0A3tHzE+w2/lrPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCF/X/8rapdeMcCfImK+oPGvMi5IyQmaISDeVuo6qyk=;
 b=efCBhTc/TxgByzjRPpEgRYjykQxF0Ynq4MXsFlYtE32EcPVPTLSBcqJq1WNty1vLlv3LoPGVYiCT/xhx9XR7c3UKWDiO+dko/rYsaVIHv/6Oy7JM5ch/h4EWjYqOeSCGW+MLCbvMpfHdxKvbRW8z8jGOTmSH1CdN+bA5l4nPYTrOJUyDVuK4ymqfc4cit++kOMWCTDFq8YxZt5EIrxcQQmmbwZSo/eDCzP4Cz1YSulKYk8kQwkl+QwqWyFq3fm/Kn+YTMKH0GNnoNXBK32OFVNE3nKr7wGPQgqoNe4sBWotzlyqFksytPTd03aPsHF16Ew+3IAICzBNPaWk9fEDarQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2665.namprd18.prod.outlook.com (20.179.106.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 12:58:11 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 12:58:10 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH v7] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMY4Gmux1Y/IiSU2ZKtKyOfOCuKbQbceA
Date: Thu, 18 Jul 2019 12:58:10 +0000
Message-ID: <7a4c824d-3ccd-b289-3e8e-ff94ea916b3e@suse.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
In-Reply-To: <20190703105639.23081-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0033.eurprd05.prod.outlook.com
 (2603:10a6:4:67::19) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddabfbb9-6f94-4f05-6b68-08d70b7f9647
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2665; 
x-ms-traffictypediagnostic: DM6PR18MB2665:
x-microsoft-antispam-prvs: <DM6PR18MB26650F13CF7EFA4616ADF30BB3C80@DM6PR18MB2665.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(189003)(199004)(53936002)(6512007)(6246003)(7416002)(102836004)(31686004)(99286004)(86362001)(11346002)(26005)(186003)(256004)(2616005)(6506007)(446003)(386003)(6486002)(6436002)(36756003)(31696002)(476003)(486006)(14444005)(52116002)(5660300002)(76176011)(66946007)(68736007)(80792005)(25786009)(478600001)(53546011)(64756008)(66446008)(66556008)(2906002)(66476007)(66066001)(6916009)(8676002)(14454004)(71200400001)(81166006)(81156014)(71190400001)(316002)(8936002)(229853002)(4326008)(54906003)(305945005)(3846002)(7736002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2665;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N3n/serOCzN9Pm1Fg/lXip3HgxhUPiIjb5nrSfnNX73eHOmMP/hs30a5gED9RFHMi+l9v6wojth34HaSBvDv6nJByKwXvC0T1M1QSLS+CdZFtfS2tYu7VjvdmWU9nnlyLpGDM8HXISGHSHcLI9o2PpDJYUrQMeXCbgG+iNeJMjDtAF10J0xhs/Gd55cRTnRtQ5h5xV4TM32iW6jvZTgNr4hyYjkx+ohm2PVsAeyKVSxUawIFVvaZmg54+NCxNU8WPOilKMWUgkp1+yf7T45oVL860LJQ7Yj3Ylxq2L0qenx+71QVcch0bL9GsOERFBqJorlfjnTn80YN9ZiOdshuqwdGP1JpzuVEUO9XcwAIsKqxOxNPwQvtju+8ZfKaG0T3ZXBtQYYHQUGMVwVU0jE4lcF4RkQCThsiWba3dYlYTjw=
Content-ID: <3F9BEEE287E0C14ABC73B12D974421E5@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ddabfbb9-6f94-4f05-6b68-08d70b7f9647
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 12:58:10.7828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2665
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxMjo1NiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+IEEv
RCBiaXQgd3JpdGVzIChvbiBwYWdlIHdhbGtzKSBjYW4gYmUgY29uc2lkZXJlZCBiZW5pZ24gYnkg
YW4gaW50cm9zcGVjdGlvbg0KPiBhZ2VudCwgc28gcmVjZWl2aW5nIHZtX2V2ZW50cyBmb3IgdGhl
bSBpcyBhIHBlc3NpbWl6YXRpb24uIFdlIHRyeSBoZXJlIHRvDQo+IG9wdGltaXplIGJ5IGZpdGVy
aW5nIHRoZXNlIGV2ZW50cyBvdXQuDQoNCkJ1dCB5b3UgYWRkIHRoZSBzZW5kaW5nIG9mIG1vcmUg
ZXZlbnRzIC0gaG93IGRvZXMgImZpbHRlciBvdXQiIG1hdGNoDQp0aGUgYWN0dWFsIGltcGxlbWVu
dGF0aW9uPw0KDQo+IEN1cnJlbnRseSwgd2UgYXJlIGZ1bGx5IGVtdWxhdGluZyB0aGUgaW5zdHJ1
Y3Rpb24gYXQgUklQIHdoZW4gdGhlIGhhcmR3YXJlIHNlZXMNCj4gYW4gRVBUIGZhdWx0IHdpdGgg
bnBmZWMua2luZCAhPSBucGZlY19raW5kX3dpdGhfZ2xhLiBUaGlzIGlzLCBob3dldmVyLA0KPiBp
bmNvcnJlY3QsIGJlY2F1c2UgdGhlIGluc3RydWN0aW9uIGF0IFJJUCBtaWdodCBsZWdpdGltYXRl
bHkgY2F1c2UgYW4NCj4gRVBUIGZhdWx0IG9mIGl0cyBvd24gd2hpbGUgYWNjZXNzaW5nIGEgX2Rp
ZmZlcmVudF8gcGFnZSBmcm9tIHRoZSBvcmlnaW5hbCBvbmUsDQo+IHdoZXJlIEEvRCB3ZXJlIHNl
dC4NCj4gVGhlIHNvbHV0aW9uIGlzIHRvIHBlcmZvcm0gdGhlIHdob2xlIGVtdWxhdGlvbiwNCg0K
QWJvdmUgeW91IHNhaWQgZnVsbHkgZW11bGF0aW5nIHN1Y2ggYW4gaW5zbiBpcyBpbmNvcnJlY3Qu
IFRvIG1lIHRoZQ0KdHdvIHN0YXRlbWVudHMgY29udHJhZGljdCBvbmUgYW5vdGhlci4NCg0KPiB3
aGlsZSBpZ25vcmluZyBFUFQgcmVzdHJpY3Rpb25zDQo+IGZvciB0aGUgd2FsayBwYXJ0LCBhbmQg
dGFraW5nIHRoZW0gaW50byBhY2NvdW50IGZvciB0aGUgImFjdHVhbCIgZW11bGF0aW5nIG9mDQo+
IHRoZSBpbnN0cnVjdGlvbiBhdCBSSVAuDQoNClNvIHRoZSAiaWdub3JlIiBwYXJ0IGhlcmUgaXMg
YmVjYXVzZSB0aGUgd2FsayBkb2Vzbid0IGN1cnJlbnRseSBzZW5kDQphbnkgZXZlbnRzPyBUaGF0
J3MgYW4gb21pc3Npb24gYWZ0ZXIgYWxsLCB3aGljaCB1bHRpbWF0ZWx5IHdhbnRzIHRvDQpnZXQg
Zml4ZWQuIFRoaXMgaW4gdHVybiBtYWtlcyBtZSB3b25kZXIgd2hldGhlciB0aGVyZSBjb3VsZG4n
dCBiZQ0KY2FzZXMgd2hlcmUgYSBtb25pdG9yIGFjdHVhbGx5IHdhbnRzIHRvIHNlZSB0aGVzZSB2
aW9sYXRpb25zLCB0b28uDQpBZnRlciBhbGwgb25lIG1heSBiZSBhYmxlIHRvIGFidXNlIHRvIHBh
Z2Ugd2Fsa2VyIHRvIHNldCBiaXRzIGluDQpwbGFjZXMgeW91IGFjdHVhbGx5IGNhcmUgdG8gcHJv
dGVjdCBmcm9tIHVuZHVlIG1vZGlmaWNhdGlvbi4NCg0KPiBXaGVuIHdlIHNlbmQgb3V0IGEgdm1f
ZXZlbnQsIHdlIGRvbid0IHdhbnQgdGhlIGVtdWxhdGlvbg0KPiB0byBjb21wbGV0ZSwgc2luY2Ug
aW4gdGhhdCBjYXNlIHdlIHdvbid0IGJlIGFibGUgdG8gdmV0byB3aGF0ZXZlciBpdCBpcyBkb2lu
Zy4NCj4gVGhhdCB3b3VsZCBtZWFuIHRoYXQgd2UgY2FuJ3QgYWN0dWFsbHkgcHJldmVudCBhbnkg
bWFsaWNpb3VzIGFjdGl2aXR5LCBpbnN0ZWFkDQo+IHdlJ2Qgb25seSBiZSBhYmxlIHRvIHJlcG9y
dCBvbiBpdC4NCj4gV2hlbiB3ZSBzZWUgYSAic2VuZC12bV9ldmVudCIgY2FzZSB3aGlsZSBlbXVs
YXRpbmcsIHdlIG5lZWQgdG8gZmlyc3Qgc2VuZCB0aGUNCj4gZXZlbnQgb3V0IGFuZCB0aGVuIHN0
b3AgdGhlIGVtdWxhdGlvbiAocmV0dXJuIFg4NkVNVUxfUkVUUlkpLg0KDQpQZXJoYXBzIGJldHRl
ciAic3VzcGVuZCIgaW5zdGVhZCBvZiAic3RvcCI/DQoNCj4gQWZ0ZXIgdGhlIGVtdWxhdGlvbiBz
dG9wcyB3ZSdsbCBjYWxsIGh2bV92bV9ldmVudF9kb19yZXN1bWUoKSBhZ2FpbiBhZnRlciB0aGUN
Cj4gaW50cm9zcGVjdGlvbiBhZ2VudCB0cmVhdHMgdGhlIGV2ZW50IGFuZCByZXN1bWVzIHRoZSBn
dWVzdC4gVGhlcmUsIHRoZQ0KPiBpbnN0cnVjdGlvbiBhdCBSSVAgd2lsbCBiZSBmdWxseSBlbXVs
YXRlZCAod2l0aCB0aGUgRVBUIGlnbm9yZWQpIGlmIHRoZQ0KPiBpbnRyb3NwZWN0aW9uIGFwcGxp
Y2F0aW9uIGFsbG93cyBpdCwgYW5kIHRoZSBndWVzdCB3aWxsIGNvbnRpbnVlIHRvIHJ1biBwYXN0
DQo+IHRoZSBpbnN0cnVjdGlvbi4NCj4gDQo+IFdlIHVzZSBodm1lbXVsX21hcF9saW5lYXJfYWRk
cigpIHRvIGludGVyY2VwdCByL3cgYWNjZXNzIGFuZA0KPiBfX2h2bV9jb3B5KCkgdG8gaW50ZXJj
ZXB0IGV4ZWMgYWNjZXNzLg0KDQpCdHcgSSBjb250aW51ZSB0byBiZSB1bmhhcHB5IGFib3V0IHRo
aXMgYXN5bW1ldHJ5LiBGdXJ0aGVybW9yZSBpbg0KdGhlIGZvcm1lciBjYXNlIHlvdSBvbmx5IGhh
bmRsZSB3cml0ZSBhbmQgcm13IGFjY2Vzc2VzLCBidXQgbm90DQpyZWFkcyBhZmFpY3MuIEkgYXNz
dW1lIHlvdSBkb24ndCBjYXJlIGFib3V0IHJlYWRzLCBidXQgdGhpcyBzaG91bGQNCnRoZW4gYmUg
bWFkZSBleHBsaWNpdC4gRnVydGhlcm1vcmUgRVBUIGFsbG93cyByZWFkIHByb3RlY3Rpb24sIGFu
ZA0KdGhlcmUgYXJlIHAybV9hY2Nlc3NfdywgcDJtX2FjY2Vzc193eCwgYW5kIHAybV9hY2Nlc3Nf
eCwgc28gSSBndWVzcw0KaWdub3JpbmcgcmVhZHMgY2FuIGF0IGJlc3QgYmUgYW4gb3B0aW9uIHBp
Y2tlZCBieSB0aGUgbW9uaXRvciwgbm90DQpzb21ldGhpbmcgdG8gYmUgbGVmdCBvdXQgb2YgdGhl
IGludGVyZmFjZSBhbHRvZ2V0aGVyLg0KDQo+IGh2bV9lbXVsYXRlX3NlbmRfdm1fZXZlbnQoKSBj
YW4gcmV0dXJuIGZhbHNlIGlmIHRoZXJlIHdhcyBubyB2aW9sYXRpb24sDQo+IGlmIHRoZXJlIHdh
cyBhbiBlcnJvciBmcm9tIG1vbml0b3JfdHJhcHMoKSBvciBwMm1fZ2V0X21lbV9hY2Nlc3MoKS4N
Cg0KQXMgc2FpZCBiZWZvcmUgLSBJIGRvbid0IHRoaW5rIGVycm9ycyBhbmQgbGFjayBvZiBhIHZp
b2xhdGlvbiBjYW4NCnNlbnNpYmx5IGJlIHRyZWF0ZWQgdGhlIHNhbWUgd2F5LiBJcyB0aGUgaW1w
bGljYXRpb24gcGVyaGFwcyB0aGF0DQplbXVsYXRpb24gdGhlbiB3aWxsIGZhaWwgbGF0ZXIgYW55
d2F5PyBJZiBzbywgaXMgc3VjaCBhbg0KYXNzdW1wdGlvbiB0YWtpbmcgaW50byBjb25zaWRlcmF0
aW9uIHBvc3NpYmxlIHJhY2VzPw0KDQo+IFJldHVybmluZyBmYWxzZSBpZiBwMm1fZ2V0X21lbV9h
Y2Nlc3MoKSBpcyBvZiBiZWNhdXNlIHRoaXMgd2lsbCBoYXBwZW4NCj4gaWYgaXQgd2FzIGNhbGxl
ZCB3aXRoIGEgYmFkIGFkZHJlc3Mgb3IgaWYgdGhlIGVudHJ5IHdhcyBub3QgZm91bmQgaW4gdGhl
DQo+IEVQVCBpbiB3aGljaCBjYXNlIGl0IGlzIHVucmVzdHJpY3RlZC4NCg0KSSdtIGFmcmFpZCBJ
J20gaGF2aW5nIHRyb3VibGUgdW5kZXJzdGFuZGluZyB0aGlzLiBJJ20gaW4gcGFydGljdWxhcg0K
aGVhdmlseSBjb25mdXNlZCBieSB0aGUgIm9mIiBpbiB0aGUgbWlkZGxlLg0KDQo+IEBAIC01MzAs
NiArNTMyLDcxIEBAIHN0YXRpYyBpbnQgaHZtZW11bF9kb19tbWlvX2FkZHIocGFkZHJfdCBtbWlv
X2dwYSwNCj4gICAgICAgcmV0dXJuIGh2bWVtdWxfZG9faW9fYWRkcigxLCBtbWlvX2dwYSwgcmVw
cywgc2l6ZSwgZGlyLCBkZiwgcmFtX2dwYSk7DQo+ICAgfQ0KPiAgIA0KPiArLyoNCj4gKyAqIFNl
bmQgbWVtb3J5IGFjY2VzcyB2bV9ldmVudHMgYmFzZWQgb24gcGZlYy4gUmV0dXJucyB0cnVlIGlm
IHRoZSBldmVudCB3YXMNCj4gKyAqIHNlbnQgYW5kIGZhbHNlIGZvciBwMm1fZ2V0X21lbV9hY2Nl
c3MoKSBlcnJvciwgbm8gdmlvbGF0aW9uIGFuZCBldmVudCBzZW5kDQo+ICsgKiBlcnJvci4gRGVw
ZW5kcyBvbiBhcmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50Lg0KDQpJbnN0ZWFkIG9mICJkZXBlbmRz
IiwgZG8geW91IHBlcmhhcHMgbWVhbiAiYXNzdW1lcyB0aGUgY2FsbGVyIHRvIGNoZWNrIj8NCklu
IHdoaWNoIGNhc2UgeW91IG1heSB3YW50IHRvIEFTU0VSVCgpIHRoaXMgaGVyZSB0byBkb2N1bWVu
dCB0aGUNCnJlcXVpcmVtZW50Pw0KDQo+ICsgKiBOT1RFOiBwMm1fZ2V0X21lbV9hY2Nlc3MoKSBj
YW4gZmFpbCBmb3Igd3JvbmcgYWRkcmVzcyBvciBpZiB0aGUgZW50cnkNCg0KV2hhdCBpcyAid3Jv
bmcgYWRkcmVzcyIgaGVyZT8gSU9XIGhvdyBpcyB0aGlzIGRpZmZlcmVudCBmcm9tICJlbnRyeSBu
b3QNCmZvdW5kIj8NCg0KPiBAQCAtNjI5LDYgKzY5NywxNCBAQCBzdGF0aWMgdm9pZCAqaHZtZW11
bF9tYXBfbGluZWFyX2FkZHIoDQo+ICAgDQo+ICAgICAgICAgICAgICAgQVNTRVJUKHAybXQgPT0g
cDJtX3JhbV9sb2dkaXJ0eSB8fCAhcDJtX2lzX3JlYWRvbmx5KHAybXQpKTsNCj4gICAgICAgICAg
IH0NCj4gKw0KPiArICAgICAgICBpZiAoIGN1cnItPmFyY2gudm1fZXZlbnQgJiYNCj4gKyAgICAg
ICAgICAgIGN1cnItPmFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQgJiYNCj4gKyAgICAgICAgICAg
IGh2bV9lbXVsYXRlX3NlbmRfdm1fZXZlbnQoYWRkciwgZ2ZuLCBwZmVjKSApDQoNCkluZGVudGF0
aW9uIGxvb2tzIG9mZiBieSBvbmUgaGVyZS4NCg0KPiArICAgICAgICB7DQo+ICsgICAgICAgICAg
ICBlcnIgPSBFUlJfUFRSKH5YODZFTVVMX1JFVFJZKTsNCj4gKyAgICAgICAgICAgIGdvdG8gb3V0
Ow0KPiArICAgICAgICB9DQoNCkRpZCB5b3Ugbm90aWNlIHRoYXQgdGhlcmUncyBhbiBpbW1lZGlh
dGUgZXhpdCBmcm9tIHRoZSBsb29wIG9ubHkNCmluIGNhc2UgdGhlIGxpbmVhciAtPiBwaHlzaWNh
bCB0cmFuc2xhdGlvbiBmYWlscz8gVGhpcyBpcw0KcmVsZXZhbnQgZm9yIHBhZ2UgZmF1bHQgZGVs
aXZlcnkgY29ycmVjdG5lc3MgZm9yIGFjY2Vzc2VzDQpjcm9zc2luZyBwYWdlIGJvdW5kYXJpZXMu
IEkgdGhpbmsgeW91IHdhbnQgdG8gdXNlDQp1cGRhdGVfbWFwX2VycigpIGFuZCBkcm9wIHRoZSAi
Z290byBvdXQiLiBJIGNhbid0IHJlYWxseSBtYWtlIHVwDQpteSBtaW5kIG9uIHRoZSBjb3JyZWN0
IGludGVyYWN0aW9uIGJldHdlZW4geW91ciBuZXcgaWYoKSBhbmQgdGhlDQpvbmUgaW1tZWRpYXRl
bHkgYWhlYWQgb2YgaXQuIFlvdSB3aWxsIHdhbnQgdG8gdGhpbmsgdGhpcyB0aHJvdWdoLg0KDQo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9o
dm0uYw0KPiBAQCAtMzIyNCw2ICszMjI0LDE0IEBAIHN0YXRpYyBlbnVtIGh2bV90cmFuc2xhdGlv
bl9yZXN1bHQgX19odm1fY29weSgNCj4gICAgICAgICAgICAgICByZXR1cm4gSFZNVFJBTlNfYmFk
X2dmbl90b19tZm47DQo+ICAgICAgICAgICB9DQo+ICAgDQo+ICsgICAgICAgIGlmICggdW5saWtl
bHkodi0+YXJjaC52bV9ldmVudCkgJiYNCj4gKyAgICAgICAgICAgIHYtPmFyY2gudm1fZXZlbnQt
PnNlbmRfZXZlbnQgJiYNCj4gKyAgICAgICAgICAgIGh2bV9lbXVsYXRlX3NlbmRfdm1fZXZlbnQo
YWRkciwgZ2ZuLCBwZmVjKSApDQoNCkluZGVudGF0aW9uIGxvb2tzIHdyb25nIGFnYWluLg0KDQo+
ICsgICAgICAgIHsNCj4gKyAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOw0KPiArICAgICAgICAg
ICAgcmV0dXJuIEhWTVRSQU5TX2dmbl9wYWdlZF9vdXQ7DQoNCldoeSAicGFnZWQgb3V0Ij8gSWYg
dGhpcyBpcyBhbiBpbnRlbnRpb25hbCBhYnVzZSwgdGhlbiB5b3Ugd2FudA0KdG8gc2F5IHNvIGlu
IGEgY29tbWVudCBhbmQganVzdGlmeSB0aGUgYWJ1c2UgaGVyZSBvciBpbiB0aGUNCmRlc2NyaXB0
aW9uLg0KDQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm1fZXZlbnQuYw0KPiArKysgYi94ZW4v
YXJjaC94ODYvaHZtL3ZtX2V2ZW50LmMNCj4gQEAgLTg2LDYgKzg2LDcgQEAgdm9pZCBodm1fdm1f
ZXZlbnRfZG9fcmVzdW1lKHN0cnVjdCB2Y3B1ICp2KQ0KPiAgICAgICAgICAgICAgICAgICAgIFZN
X0VWRU5UX0ZMQUdfU0VUX0VNVUxfSU5TTl9EQVRBICkNCj4gICAgICAgICAgICAgICBraW5kID0g
RU1VTF9LSU5EX1NFVF9DT05URVhUX0lOU047DQo+ICAgDQo+ICsgICAgICAgIHYtPmFyY2gudm1f
ZXZlbnQtPnNlbmRfZXZlbnQgPSBmYWxzZTsNCj4gICAgICAgICAgIGh2bV9lbXVsYXRlX29uZV92
bV9ldmVudChraW5kLCBUUkFQX2ludmFsaWRfb3AsDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgWDg2X0VWRU5UX05PX0VDKTsNCg0KSXMgdGhpcyBpbnNlcnRpb24gbWVhbmlu
ZyB0byB1c2UgInRydWUiIGluc3RlYWQsIG9yIGlzIHRoZQ0KcmV2aXNpb24gbG9nIGVudHJ5IHdy
b25nPyBPciBkb2VzICJzZXQiIHRoZXJlIG5vdCBuZWNlc3NhcmlseQ0KbWVhbiAic2V0IGl0IHRv
IHRydWUiLCBidXQganVzdCAic2V0IGl0IHRvIGEgZGV0ZXJtaW5pc3RpYw0KdmFsdWUiIChpbiB3
aGljaCBjYXNlICJpbml0aWFsaXplIiB3b3VsZCBoYXZlIGJlZW4gYW4NCnVuYW1iaWd1b3VzIGFs
dGVybmF0aXZlIHdvcmRpbmcpPw0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
