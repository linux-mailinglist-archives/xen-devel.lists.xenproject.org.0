Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A65171A1D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 16:19:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpvZt-0000IF-S4; Tue, 23 Jul 2019 14:15:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpvZs-0000I9-CB
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 14:15:40 +0000
X-Inumbo-ID: 5070a03f-ad54-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5070a03f-ad54-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 14:15:38 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 14:11:31 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 14:14:44 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 14:14:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2FCODdcnBUbstw8RA0Ccbgrfqw5r210Fi+bvkYaeK+Uhe1TGCSHmxdWb9xzl6UvTsZOJ1TppxWC7Dzq6nrdpNfs9nHPkvyXEPyR1hsZI0NQmPdSPXkQw9qu5/jdK7iqmDI6x43e884a1hb3Gsp08DTJmJ11bKzNIFHGJ+0wA4VdeRSqr8ZvlIc0tXf/d3MUuFyHBnykeIZv5R9d62sqKfRaRAXxTHZyL28rk5otTdl7WA7txTIFgEm7zcT98oVRkdZV+TswBzm+DDACpxixuFq3ZLtckniHmhjKQ23BAXQN5wtBDAf7i8E1jFTmpnNwAr8bfoCPMHK75wBGVkCnDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDIUdwSqu34N+tA/M/AWgaHPyt1BrvMxgOwOOH93iSM=;
 b=CXs42Z+5sbIG2SREKb23QS2yqm+6i2eMc9e+oxVkf2tHpnAK/ubF6AAoUU3ynNaMSmSKU6ZBwH5yB8oBJqSpZfJ/gWJbVrk1L4HIXUUGT8QOcbsWN5jvwI3nbkmBdLue6tHiVlslPF5HIvkEsc9e+YA90TPZHV7w2GJQdwUNVSpkCagERR9PnPIgP3nNxfIE+jW9GFizObJAMfbsWidp9TIa3Lj473rdZgro88HF0qCfwhMfpJarJD14IlOKkJapjTvJ2ttWGyqpnSDpf0sSum2D7AW7/DjlbYyZgbLX2Mf0C5rPv6vHb/rUIKQ8cuGyidbvCqF+eaasJqFpVL2D2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2714.namprd18.prod.outlook.com (20.179.51.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 14:14:42 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 14:14:42 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
 scenarios
Thread-Index: AQHVQTgCmOXaxQxPLUKxvpzXZTTLrabYJaWAgAARcbKAACa/gP//4aOA
Date: Tue, 23 Jul 2019 14:14:42 +0000
Message-ID: <e28384ea-4c85-e1c2-efce-01ec354d4ab3@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-3-jgross@suse.com>
 <eb7d7c8a-9bb1-f264-b72e-7e4c96087568@suse.com>
 <4c6a7888-d697-1b2c-cdbf-7127ae00bc4f@suse.com>
 <779077d6-5f07-9801-49e6-58fcd1fe31b4@suse.com>
In-Reply-To: <779077d6-5f07-9801-49e6-58fcd1fe31b4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0035.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::23) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3ac5fd0-0b85-4ec3-9497-08d70f781b3c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2714; 
x-ms-traffictypediagnostic: DM6PR18MB2714:
x-microsoft-antispam-prvs: <DM6PR18MB2714B0E97BB7E8845791127EB3C70@DM6PR18MB2714.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(199004)(189003)(478600001)(476003)(36756003)(7416002)(25786009)(11346002)(31686004)(2616005)(5660300002)(6862004)(99286004)(53936002)(446003)(68736007)(71200400001)(7736002)(76176011)(6512007)(66476007)(6436002)(64756008)(66946007)(305945005)(66446008)(66556008)(6506007)(6246003)(386003)(81156014)(3846002)(71190400001)(66066001)(81166006)(316002)(53546011)(6116002)(8936002)(14454004)(102836004)(54906003)(86362001)(31696002)(186003)(8676002)(229853002)(37006003)(2906002)(6636002)(6486002)(80792005)(256004)(14444005)(26005)(486006)(4326008)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2714;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DbOrp9ZVegDX5s1RzFT0zQdtv+TIA0+q0TJknGlAEhcZgOBT/hyuMAQ4Aej3bHdf5U1zOzjD/vZiqEuRE6ZGYePHRrP1KD874Le/3wlzn1OvKasodLaTW1pohPMfb8hmb3PIBsIL/IxA4fc+UsWxKBfsk92rswAuzzINflu2G7Fp9WMVP7eh2yoP8kicyvghyTNaAGYD1PEe9tGDQNGEQCzqmVA+aVItwPE7odWwJYmr/t+aKjZOthFPkUx4M3scDcrxsB+czqVeLzpCOucwPMvqdmnUOsY4L0G1Jj2Vw+kI7nofs+z7aTCqsuhhKfw/lDHr4sikEaYNqFgwS/3vB3ig11VHy+cSmejgfBvMraWDrdWOvW8537kVJ1QkyQEhypiAS5uN8zbW9rig0teI8aXDOHi2RTMZLtk5lvYYlEQ=
Content-ID: <78E6E9937082AA44A376EBDDB3C987D5@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ac5fd0-0b85-4ec3-9497-08d70f781b3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 14:14:42.7152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2714
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAxNjowMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIzLjA3LjIwMTkg
MTU6NDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBPbiAyMy4wNy4xOSAxNDo0MiwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4gdi0+cHJvY2Vzc29yIGdldHMgbGF0Y2hlZCBpbnRvIHN0LT5wcm9j
ZXNzb3IgYmVmb3JlIHJhaXNpbmcgdGhlIHNvZnRpcnEsDQo+Pj4gYnV0IGNhbid0IHRoZSB2Q1BV
IGJlIG1vdmVkIGVsc2V3aGVyZSBieSB0aGUgdGltZSB0aGUgc29mdGlycSBoYW5kbGVyDQo+Pj4g
YWN0dWFsbHkgZ2FpbnMgY29udHJvbD8gSWYgdGhhdCdzIG5vdCBwb3NzaWJsZSAoYW5kIGlmIGl0
J3Mgbm90IG9idmlvdXMNCj4+PiB3aHksIGFuZCBhcyB5b3UgY2FuIHNlZSBpdCdzIG5vdCBvYnZp
b3VzIHRvIG1lKSwgdGhlbiBJIHRoaW5rIGEgY29kZQ0KPj4+IGNvbW1lbnQgd2FudHMgdG8gYmUg
YWRkZWQgdGhlcmUuDQo+Pg0KPj4gWW91IGFyZSByaWdodCwgaXQgbWlnaHQgYmUgcG9zc2libGUg
Zm9yIHRoZSB2Y3B1IHRvIG1vdmUgYXJvdW5kLg0KPj4NCj4+IE9UT0ggaXMgaXQgcmVhbGx5IGlt
cG9ydGFudCB0byBydW4gdGhlIHRhcmdldCB2Y3B1IGV4YWN0bHkgb24gdGhlIGNwdQ0KPj4gaXQg
aXMgZXhlY3V0aW5nIChvciBoYXMgbGFzdCBleGVjdXRlZCkgYXQgdGhlIHRpbWUgdGhlIE5NSS9N
Q0UgaXMgYmVpbmcNCj4+IHF1ZXVlZD8gVGhpcyBpcyBpbiBubyB3YXkgcmVsYXRlZCB0byB0aGUg
Y3B1IHRoZSBNQ0Ugb3IgTk1JIGhhcyBiZWVuDQo+PiBoYXBwZW5pbmcgb24uIEl0IGlzIGp1c3Qg
YSByYW5kb20gY3B1LCBhbmQgc28gaXQgd291bGQgYmUgaWYgd2UnZCBkbyB0aGUNCj4+IGNwdSBz
ZWxlY3Rpb24gd2hlbiB0aGUgc29mdGlycSBoYW5kbGVyIGlzIHJ1bm5pbmcuDQo+Pg0KPj4gT25l
IHF1ZXN0aW9uIHRvIHVuZGVyc3RhbmQgdGhlIGlkZWEgbmVoaW5kIGFsbCB0aGF0OiBfd2h5XyBp
cyB0aGUgdmNwdQ0KPj4gcGlubmVkIHVudGlsIGl0IGRvZXMgYW4gaXJldD8gSSBjb3VsZCB1bmRl
cnN0YW5kIGlmIGl0IHdvdWxkIGJlIHBpbm5lZA0KPj4gdG8gdGhlIGNwdSB3aGVyZSB0aGUgTk1J
L01DRSB3YXMgaGFwcGVuaW5nLCBidXQgdGhpcyBpcyBub3QgdGhlIGNhc2UuDQo+IA0KPiBUaGVu
IGl0IHdhcyBuZXZlciBmaW5pc2hlZCBvciBnb3QgYnJva2VuLCBJIHdvdWxkIGd1ZXNzLg0KDQpP
aCwgbm8uIFRoZSAjTUMgc2lkZSB1c2UgaGFzIGdvbmUgYXdheSBpbiAzYTkxNzY5ZDZlLCB3aXRo
b3V0IGNsZWFuaW5nDQp1cCBvdGhlciBjb2RlLiBTbyB0aGVyZSBkb2Vzbid0IHNlZW0gdG8gYmUg
YW55IHN1Y2ggcmVxdWlyZW1lbnQgYW55bW9yZS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
