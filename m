Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D62011302F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 17:44:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icXj3-0000X6-AK; Wed, 04 Dec 2019 16:42:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4Mbr=Z2=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1icXj1-0000Ww-Mc
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 16:42:03 +0000
X-Inumbo-ID: ff326336-16b4-11ea-8206-12813bfff9fa
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.130]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff326336-16b4-11ea-8206-12813bfff9fa;
 Wed, 04 Dec 2019 16:42:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFa0N6KcFs9qrNVB6KBgwpA3YakmAvAm6C0vCkSQmGHpgiAnH2DWV8+mvPBOKeKRZ9Qtab1zC1OCivAM4ZBfOYkOlqQLQ7OYYdLTQmZgtBMJmMOao/6WBLAVvR53oOTqPyLh1Gfx3tWsYo5xiCsCdq3ovjuCdTINyo786J+71ARXHgB6MiBUTAd9aRL+c9Tj4CkfUGfZ/pug8VB7i12/50nUfeCksJ6ghT/m29TY/gUDX8jkNaVfe/2LQBs4hNrLF3f/2uaoMkPlwSoX24YL0zWdTeSRswIWovKcLU4/hdjSFoVKX49XEuykz6s1KzcF6SLwxdpgSPQ0W72tXbDlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvJ5PeUEmt24G9bqHyMjo7Rdoi8FueaowThM208g6QI=;
 b=NhXCTZAyxam9ZqemVPu2Gb/DZqt/a25TeTcTMq+id2asns5c7EmEWwu/loLO1Bn3f7SB+Z3oSEVJVL7fYvv5dPs+GWMrVv0lBo844P9VJG9A0pB6cnV5wlATBzGEv4H+ZD3nXXFQ8any2aCLfoGeQIk68JO8C5PUK4hBHF2Svr3QTaQoQmj2YS8kMAWkdPnGwG38EMmuSEraayw2SMzPLt2PLzv7LKSClZuabh7EobjOi86fcX1NKnXHaYmbc/b9hG1TGpmcAsHUB8xh7JwLiNxT+pmb9o3iWnDfZWPtVR3a0g0km+KpcTCFyWaTtT5wNt9ncsDLfcx4fHjqqu4Iig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvJ5PeUEmt24G9bqHyMjo7Rdoi8FueaowThM208g6QI=;
 b=ggpRe7woJcKoZCOhyn/InejCpdlT2rNV1VUlJPvId+jJwXy1S+gcgpk4gIkxWpCNLQn+KG0k8FoVAmY/nPne1Q8pxtk2PrJeb2PO7BhyO+20ma0DHyi2uAOwh+cOVJ8mSwkYFVXzME/PhywqqwqbP9ZrVRD4Nkckxe5hBI3oULw=
Received: from AM6PR02MB5287.eurprd02.prod.outlook.com (20.178.89.79) by
 AM6PR02MB4867.eurprd02.prod.outlook.com (20.177.118.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Wed, 4 Dec 2019 16:42:00 +0000
Received: from AM6PR02MB5287.eurprd02.prod.outlook.com
 ([fe80::cddf:15eb:a538:71fe]) by AM6PR02MB5287.eurprd02.prod.outlook.com
 ([fe80::cddf:15eb:a538:71fe%5]) with mapi id 15.20.2516.013; Wed, 4 Dec 2019
 16:42:00 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/debug: Plumb pending_dbg through the monitor and
 devicemodel interfaces
Thread-Index: AQHVqfyqJfL5ZJWFbkCmEracwCthr6eqL4WA
Date: Wed, 4 Dec 2019 16:42:00 +0000
Message-ID: <32c61218507a617cead37f0c58b9ddbab9858256.camel@bitdefender.com>
References: <20191203171030.11680-1-andrew.cooper3@citrix.com>
In-Reply-To: <20191203171030.11680-1-andrew.cooper3@citrix.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0701CA0006.eurprd07.prod.outlook.com
 (2603:10a6:200:42::16) To AM6PR02MB5287.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee11ff6b-eabd-4895-39fe-08d778d8e299
x-ms-traffictypediagnostic: AM6PR02MB4867:|AM6PR02MB4867:|AM6PR02MB4867:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR02MB486720D10F573FF157D247A9D65D0@AM6PR02MB4867.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0241D5F98C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(366004)(376002)(39860400002)(136003)(199004)(189003)(14454004)(5660300002)(6486002)(118296001)(478600001)(2906002)(102836004)(36756003)(6436002)(50226002)(66946007)(66476007)(66446008)(64756008)(66556008)(229853002)(71190400001)(71200400001)(2616005)(81166006)(81156014)(26005)(11346002)(8676002)(8936002)(76176011)(6116002)(86362001)(3846002)(110136005)(54906003)(52116002)(186003)(25786009)(4326008)(7736002)(6506007)(6512007)(6246003)(99286004)(305945005)(14444005)(316002)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB4867;
 H:AM6PR02MB5287.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mpN4Md6j/1XESxjio2USmWAvfSI5hp/i1e4ILQAYRIYjHwvKhfa3V+19NaVNSEkxZH5uMhu4Amh9mT/O340HAnOlkD+xFdsAEptNzWy58SNJ4B9bGzuLIY+WKab2vXR/vfS+cLf+l1/rATShalvnLo3PKMKIrm4j2GRhRDwzSrG9kj/ZzDH7P59GKknicLf7zgeyCosCDTFWwi+DFq+mUNSdas0zcV2sQntT9ImbdIku4BNLcQ27LYtP1IufAkHfRC0LejaP2gKPEqxOlROO8c/hf99zRgrZgYFId/2+qe17W6AnCuEp6PHlQ40y37kspz9bNaMUi6eEbumcEpX6FkXrW0QIQ5xi3J8KQvA1fTP4zk8tMMTf2dVSj8mWKyYnvsikslDDNOaNKK9mg0U3Ad5XfWQRHXTHRow66MZxGMBSRX7h55xbL0ksN/qsgYBERpS+2ue+LYvmQF8yx+oMppaevfGFFoxkZ6/WoZjbEMIaSdf3Id0A16SXfmOuKhdF
Content-ID: <B2C34F8B6A81624CAA36F8BDA938191A@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee11ff6b-eabd-4895-39fe-08d778d8e299
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2019 16:42:00.7995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0i8flEsEx9BWYC88Y3mkFYzTxJXt1EW98yhV6ksfseZXzEbHYPnfiY3KTRscP8ffYEKHSoqc+pR4a7nXUkgv4JatrVHgw5U598uTFnL/zVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4867
Subject: Re: [Xen-devel] [PATCH] x86/debug: Plumb pending_dbg through the
 monitor and devicemodel interfaces
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDE5LTEyLTAzIGF0IDE3OjEwICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBMaWtlICVjcjIgZm9yIHBhZ2VmYXVsdHMsICVkcjYgY29udGFpbnMgYW5jaWxsYXJ5IGluZm9y
bWF0aW9uIGZvcg0KPiBkZWJ1Zw0KPiBleGNlcHRpb25zLCBhbmQgbmVlZHMgc2ltaWxhciBoYW5k
bGluZy4NCj4gDQo+IEZvciB4ZW5kZXZpY2Vtb2RlbF9pbmplY3RfZXZlbnQoKSwgbm8gQUJJIGNo
YW5nZSBpcyBuZWVkZWQgKGFsdGhvdWdoDQo+IGFuIEFQSQ0KPiBvbmUgd291bGQgYmUgaWRlYWwp
LiAgU3dpdGNoIGZyb20gJ2NyMicgdG8gJ2V4dHJhJyBpbiB2YXJpYWJsZSBuYW1lcw0KPiB3aGlj
aA0KPiBkb24ndCBjb25zdGl0dXRlIGFuIEFQSSBjaGFuZ2UsIGFuZCB1cGRhdGUgdGhlIGRvY3Vt
ZW50YXRpb24gdG8NCj4gbWF0Y2guDQo+IA0KPiBGb3IgdGhlIG1vbml0b3IgaW50ZXJmYWNlLCB2
bV9ldmVudF9kZWJ1ZyBuZWVkcyBleHRlbmRpbmcgd2l0aCBhDQo+IHBlbmRpbmdfZGJnDQo+IGZp
ZWxkLiAgRXh0ZW5kIGh2bV9tb25pdG9yX2RlYnVnKCkgYW5kIGZvciBub3csIGFsd2F5cyBwYXNz
IGluIDAgLQ0KPiB0aGlzIHdpbGwNCj4gYmUgZml4ZWQgZXZlbnR1YWxseSwgd2hlbiBvdGhlciBo
eXBlcnZpc29yIGJ1Z2ZpeGVzIGFyZSBjb21wbGV0ZS4NCj4gDQo+IFdoaWxlIG1vZGlmeWluZyBo
dm1fbW9uaXRvcl9kZWJ1ZygpLCB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byBjb3JyZWN0DQo+IHRy
YXAgdHlwZQ0KPiBhbmQgaW5zdHJ1Y3Rpb24gbGVuZ3RoIGZyb20gdW5zaWduZWQgbG9uZyB0byB1
bnNpZ25lZCBpbnQsIGFzIHRoZXkNCj4gYXJlIGJvdGgNCj4gdGlueSB2YWx1ZXMuDQo+IA0KPiBG
aW5hbGx5LCBhZGp1c3QgeGVuLWFjY2Vzcy5jIHRvIHRoZSBuZXcgZXhwZWN0YXRpb25zLiAgSW50
cm9zcGVjdGlvbg0KPiB0b29scw0KPiBpbnRlcmNlcHRpbmcgZGVidWcgZXhjZXB0aW9ucyBzaG91
bGQgbWlycm9yIHRoZSBuZXcgcGVuZGluZ19kYmcgZmllbGQNCj4gaW50bw0KPiB4ZW5kZXZpY2Vt
b2RlbF9pbmplY3RfZXZlbnQoKSBmb3IgJWRyNiB0byBiZSBwcm9jZXNzZWQgY29ycmVjdGx5IGZv
cg0KPiB0aGUNCj4gZ3Vlc3QuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiAtLS0NCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1
bGljaEBzdXNlLmNvbT4NCj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+IENDOiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gQ0M6IFJhenZhbiBDb2pvY2FydSA8
cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4gQ0M6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNA
dGtsZW5neWVsLmNvbT4NCj4gQ0M6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5k
ZXIuY29tPg0KPiBDQzogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNv
bT4NCj4gQ0M6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPg0KPiANCj4gSSdt
IGV4cGVjdGluZyB0byBjb21taXQgdGhpcyBhbG9uZ3NpZGUgIng4Ni9zdm06IENvcnJlY3Qgdm1f
ZXZlbnQgQVBJDQo+IGZvcg0KPiBkZXNjcmlwdG9yIGFjY2Vzc2VzIiB3aGljaCBjb3ZlcnMgdGhl
IGJ1bXAgb2YgdGhlIFZNX0VWRU5UIGludGVyZmFjZQ0KPiB2ZXJzaW9uLg0KPiAtLS0NCj4gIHRv
b2xzL2xpYnMvZGV2aWNlbW9kZWwvY29yZS5jICAgICAgICAgICAgICAgICAgIHwgNCArKy0tDQo+
ICB0b29scy9saWJzL2RldmljZW1vZGVsL2luY2x1ZGUveGVuZGV2aWNlbW9kZWwuaCB8IDQgKyst
LQ0KPiAgdG9vbHMvdGVzdHMveGVuLWFjY2Vzcy94ZW4tYWNjZXNzLmMgICAgICAgICAgICAgfCA3
ICsrKystLS0NCj4gIHhlbi9hcmNoL3g4Ni9odm0vbW9uaXRvci5jICAgICAgICAgICAgICAgICAg
ICAgIHwgNCArKystDQo+ICB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyAgICAgICAgICAgICAg
ICAgICAgICB8IDQgKystLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgICAgICAgICAg
ICAgICAgICAgICAgfCA2ICsrKy0tLQ0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vbW9uaXRv
ci5oICAgICAgICAgICAgICAgfCAzICsrLQ0KPiAgeGVuL2luY2x1ZGUvcHVibGljL2h2bS9kbV9v
cC5oICAgICAgICAgICAgICAgICAgfCAyICstDQo+ICB4ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZl
bnQuaCAgICAgICAgICAgICAgICAgICB8IDEgKw0KPiAgOSBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNl
cnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNClJldmlld2VkLWJ5OiBQZXRyZSBQaXJjYWxhYnUg
PHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPg0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
