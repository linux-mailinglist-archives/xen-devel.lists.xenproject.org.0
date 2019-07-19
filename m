Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D37B36E3B0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 11:48:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoPR4-0008N0-9x; Fri, 19 Jul 2019 09:44:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoPR2-0008Mv-NK
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 09:44:16 +0000
X-Inumbo-ID: b9e0f5da-aa09-11e9-ade1-bb25ddf3b8bb
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9e0f5da-aa09-11e9-ade1-bb25ddf3b8bb;
 Fri, 19 Jul 2019 09:44:13 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 09:40:09 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 09:43:27 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 09:43:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0ByOlroKuNPdVHPtIBsh4phsj+w7fkCoSzXCKgMqgVrm5RmwiOhBymBKurfP3VbrxgF1hj5q5RyIgptv9HpLWnBJkSycS9kHZsNwRx6N4jSvQyDNuiGFh1rfZwrNsAjAoDHsUx8F7gIb3iUkcwi+uvt6gv1BFbBh5JIXGSWi9c72PV4vr027HNLu4qoCXxiR71uxIWX+yYq7rQZA/wHIHKyGQhjXaUQ/iGUZgCAiyLJWXfjYLemhX7u6Xr80xkm9UAlgvwB80VQ79kVLBPD5wFkpJmY9WAurSCP/Clt//ZmcjWNO/6tBwSjSnMHPg4OnBa3c15Fl/6tNdY8YYbZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5W/XtWmFE+z7dTJNb03vlSk8ul6FHfO6BeZQM16XwQo=;
 b=miJCDaXZSirelklYZpeThGuYTBQvBrj9O/4gWuw+SGuqydam8ff5RN8s/UYHFyNrI2AhU8ctMGNtkAV+met2PvEYCxZw95Lt5rPJNO+azoak6cpTm8/plZeVRlw9DqnYQ+qDLCU0w7XfExrTdDatCeKzLfpolX4uC1NYkPofOO3WzZzmipUTSZ9YOacca96jBPPSJwoD05eXHaBxrbfdO+QdBvsf733b3HjgpPfaXHRccxORCfN1fbblnjqLtgnjZrvJspcVMj9zzwHx2C3Had9gJtiKJ1w9gNhHIQZWNC1W/bdw15jk3H0vxXJ+AGiF+nRX0mlVsWNu57XTltSOEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2394.namprd18.prod.outlook.com (20.179.71.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 09:43:26 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 09:43:26 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
Thread-Index: AQHVPW85l6TypzCOPUKKzJbbmldm3qbQfOwAgAAauduAAP6xgIAAEDIrgAALaYA=
Date: Fri, 19 Jul 2019 09:43:26 +0000
Message-ID: <b7d4e591-a5e3-94f1-6870-f0b6e7e9daf7@suse.com>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <7280f16277aa9d7bdc9c2373277ef1b40459090b.1563325215.git-series.marmarek@invisiblethingslab.com>
 <20190717101843.2nmigl4dt4kekuax@Air-de-Roger.citrite.net>
 <20190717235426.GX1250@mail-itl>
 <20190718134604.owj6l4hk7rjq72es@Air-de-Roger.citrite.net>
 <9d0c36b7-97d3-5da8-c35b-7073c2066841@suse.com>
 <20190718165212.rj23yh5bphtc2cq5@Air-de-Roger.citrite.net>
 <f5ff77af-d2d5-1a89-06d4-6049f607ec80@suse.com>
 <20190719090202.vzeernrydawwnzan@Air-de-Roger.citrite.net>
In-Reply-To: <20190719090202.vzeernrydawwnzan@Air-de-Roger.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0014.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::24) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9014cae-e8c7-4cc4-1519-08d70c2d8c2c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2394; 
x-ms-traffictypediagnostic: DM6PR18MB2394:
x-microsoft-antispam-prvs: <DM6PR18MB23947C195EE423F919EA2E0BB3CB0@DM6PR18MB2394.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(199004)(189003)(6246003)(26005)(66066001)(31686004)(102836004)(66446008)(229853002)(54906003)(53936002)(186003)(64756008)(66556008)(6116002)(3846002)(52116002)(99286004)(81156014)(25786009)(7736002)(8936002)(7416002)(5660300002)(80792005)(68736007)(36756003)(305945005)(81166006)(478600001)(71200400001)(14454004)(71190400001)(76176011)(66946007)(486006)(4326008)(316002)(386003)(53546011)(6506007)(476003)(31696002)(6916009)(2616005)(14444005)(256004)(6486002)(446003)(86362001)(6436002)(2906002)(6512007)(66476007)(11346002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2394;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FzFLk54YcPW2/e3FJcEWH+bA3DGwujGeUR8KK96+8gctkOGMvP6a3kHDocfHSxpJgc8DQTHo2OzF8R3GDZg7Lxzj373DO4+t22DoWific7jhRb/SdLWe/nKshgcyfiECaNh+eNAmM/GmuY6QwbMHuGVVpXDertxhN8ih4Nw2J7jYxLHPCYBm7yUrZ3r+QCntVgkXvhPPDPSIYLK9yBFhMKsDC09c+WMDN5invHpdTs9uzKj2Y4EZSImdmfEgq76dxK+0vz93xPmhJtkvc+8Q6cQIj+2q8G6/hLd9G2JRE5QFmBFT+4paxfoDtCkZ2cu3ctzUFjt7+rUoIYvzgDcWSEUPxyKtaKkUtrTnbGXYwEiE1K294ZtC1BaOr3MrZCZJLe6e55QziF7tYWy6TqmA3N+H6aO/zdvGm0lZixbxvmc=
Content-ID: <2967534CCED67C4F982E9D6220FDB46A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d9014cae-e8c7-4cc4-1519-08d70c2d8c2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 09:43:26.2814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2394
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxMTowMiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIEZyaSwg
SnVsIDE5LCAyMDE5IGF0IDA4OjA0OjQ1QU0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
T24gMTguMDcuMjAxOSAxODo1MiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+Pj4gT24gVGh1
LCBKdWwgMTgsIDIwMTkgYXQgMDM6MTc6MjdQTSArMDAwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+
Pj4+IE9uIDE4LjA3LjIwMTkgMTU6NDYsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOg0KPj4+Pj4g
SW4gZmFjdCBJIGRvbid0IHRoaW5rIElOVHggc2hvdWxkIGJlIGVuYWJsZWQgd2hlbiBNU0koLVgp
IGlzIGRpc2FibGVkLA0KPj4+Pj4gUUVNVSBhbHJlYWR5IHRyYXBzIHdyaXRlcyB0byB0aGUgY29t
bWFuZCByZWdpc3RlciwgYW5kIGl0IHdpbGwgbWFuYWdlDQo+Pj4+PiBJTlR4IGVuYWJsaW5nL2Rp
c2FibGluZyBieSBpdHNlbGYuIEkgdGhpbmsgdGhlIG9ubHkgY2hlY2sgcmVxdWlyZWQgaXMNCj4+
Pj4+IHRoYXQgTVNJKC1YKSBjYW5ub3QgYmUgZW5hYmxlZCBpZiBJTlR4IGlzIGFsc28gZW5hYmxl
ZC4gSW4gdGhlIHNhbWUNCj4+Pj4+IHdheSBib3RoIE1TSSBjYXNwYWJpbGl0aWVzIGNhbm5vdCBi
ZSBlbmFibGVkIHNpbXVsdGFuZW91c2x5LiBUaGUNCj4+Pj4+IGZ1bmN0aW9uIHNob3VsZCBub3Qg
ZXhwbGljaXRseSBkaXNhYmxlIGFueSBvZiB0aGUgb3RoZXIgY2FwYWJpbGl0aWVzLA0KPj4+Pj4g
YW5kIGp1c3QgcmV0dXJuIC1FQlVTWSBpZiB0aGUgY2FsbGVyIGF0dGVtcHRzIGZvciBleGFtcGxl
IHRvIGVuYWJsZQ0KPj4+Pj4gTVNJIHdoaWxlIElOVHggb3IgTVNJLVggaXMgZW5hYmxlZC4NCj4+
Pj4NCj4+Pj4gWW91IGRvIHJlYWxpemUgdGhhdCBwY2lfaW50eCgpIG9ubHkgZXZlciBnZXRzIGNh
bGxlZCBmb3IgWGVuDQo+Pj4+IGludGVybmFsbHkgdXNlZCBpbnRlcnJ1cHRzLCBpLmUuIG1haW5s
eSB0aGUgc2VyaWFsIGNvbnNvbGUgb25lPw0KPj4+DQo+Pj4gWW91IHdpbGwgaGF2ZSB0byBiZWFy
IHdpdGggbWUgYmVjYXVzZSBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHdoeQ0KPj4+IGl0IGRv
ZXMgbWF0dGVyLiBEbyB5b3UgbWVhbiB0byBwb2ludCBvdXQgdGhhdCBkb20wIGlzIHRoZSBvbmUg
aW4gZnVsbA0KPj4+IGNvbnRyb2wgb2YgSU5UeCwgYW5kIHRodXMgWGVuIHNob3VsZG4ndCBjYXJl
IG9mIHdoZXRoZXIgSU5UeCBhbmQNCj4+PiBNU0koLVgpIGFyZSBlbmFibGVkIGF0IHRoZSBzYW1l
IHRpbWU/DQo+Pj4NCj4+PiBJIHN0aWxsIHRoaW5rIHRoYXQgYXQgbGVhc3QgYSB3YXJuaW5nIHNo
b3VsZCBiZSBwcmludGVkIGlmIGEgY2FsbGVyDQo+Pj4gdHJpZXMgdG8gZW5hYmxlIE1TSSgtWCkg
d2hpbGUgSU5UeCBpcyBhbHNvIGVuYWJsZWQsIGJ1dCB1bmxlc3MgdGhlcmUncw0KPj4+IGEgcmVh
c29uIHRvIGhhdmUgYm90aCBNU0koLVgpIGFuZCBJTlR4IGVuYWJsZWQgYXQgdGhlIHNhbWUgdGlt
ZSAobWF5YmUNCj4+PiBhIHF1aXJrIGZvciBzb21lIGhhcmR3YXJlIGlzc3VlPykgaXQgc2hvdWxk
bid0IGJlIGFsbG93ZWQgb24gdGhpcyBuZXcNCj4+PiBpbnRlcmZhY2UuDQo+Pg0KPj4gSSBkb24n
dCBtaW5kIGltcHJvdmVtZW50cyB0byB0aGUgY3VycmVudCBzaXR1YXRpb24gKGkuZS4gc3VjaCBh
DQo+PiB3YXJuaW5nIG1heSBpbmRlZWQgbWFrZSBzZW5zZSk7IEkgbWVyZWx5IHN0YXRlZCBob3cg
dGhpbmdzIGN1cnJlbnRseQ0KPj4gYXJlLiBJTlR4IHRyZWF0bWVudCB3YXMgY29tcGxldGVseSBs
ZWZ0IGFzaWRlIHdoZW4gTVNJIHN1cHBvcnQgd2FzDQo+PiBpbnRyb2R1Y2VkIGludG8gWGVuLg0K
PiANCj4gSW4gb3JkZXIgdG8gZ2l2ZSBNYXJlayBhIG1vcmUgY29uY2lzZSByZXBseSwgd291bGQg
eW91IGFncmVlIHRvIHJldHVybg0KPiAtRUJVU1kgKG9yIHNvbWUgZXJyb3IgY29kZSkgYW5kIHBy
aW50IGEgd2FybmluZyBtZXNzYWdlIGlmIHRoZSBjYWxsZXINCj4gYXR0ZW1wdHMgdG8gZW5hYmxl
IE1TSSgtWCkgd2hpbGUgSU5UeCBpcyBhbHNvIGVuYWJsZWQ/DQoNCkFzIHRvIHJldHVybmluZyBh
biBlcnJvciAtIEkgdGhpbmsgc28sIHllcy4gSSdtIGxlc3Mgc3VyZSBhYm91dCBsb2dnaW5nDQph
IG1lc3NhZ2UuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
