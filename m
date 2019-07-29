Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55CE78AA4
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 13:34:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs3rg-0003GN-EZ; Mon, 29 Jul 2019 11:30:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs3rf-0003GI-0U
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 11:30:51 +0000
X-Inumbo-ID: 4de4ad52-b1f4-11e9-8b43-33d98b0eff01
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4de4ad52-b1f4-11e9-8b43-33d98b0eff01;
 Mon, 29 Jul 2019 11:30:46 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 11:30:44 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 11:10:37 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 11:10:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFPsyniqf/YgHWqkLvG5fwOrG4wyrWhMcLKtqaaFPjZmyKI03DYNX0IM5RBuF3MfMJ/IGGN2t7Cniucr8Z8Fp2MXuQg2bCiFWiFqGnsqHve0ygpIbnsJyD/g3WqROoZ0fe/V2ggCLYmTdT8y2l8fRsd+EQKSVw0DhJ1eJ0Zqyo84qWJcXjiPU/vtfW/rcuAAMZXL6b+IxOEfHWF9hlNzuI2TAYVhFG6aW3kvPrMugwNhmGg2ppQI+dEqHdIJ9GCU5JsyRQjUXX8RyX6YxpSpQFW6LBTVVUVOBIcTOpKi4VeQvvlvaQToTsHUMuE0sn9zqe5HEwGkf/KrAScj1CU5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RC4KPMe5XUhGLf4d970eHdNGoccNMT2Z65SlpLYSZ0=;
 b=nVjr8YpNGPxqP9vipkDTSOIDJUULccjkTcmFNON/SVliCMTq/ldhppaF+Ja4Niw3PzuDQkH4hDuqEEqiWn7y1NS4m8k0FuF7s6593Sg5LGUfZxGrTfPmymu2oI2c25JwY723ZTIxxz5/7QTV9TQ/UAzOdDY6VRf1MHqmRDcCWivUKX5zRtHFOyOYfWueGmGTUx7Fe6e4HajxMwoWf2ZdQvspaP+1lmWQI6DHLTCsxElCyLkCwHBJmKni1ogxcWdNYPMOhLUg5gVb15aLUeZ4Xhv1vvaVal5eBB1HJs/vCm/pBPw5Kzd4/fK4+FZdJyEX8dKvNmN7+ITpUXEHYpBFXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3345.namprd18.prod.outlook.com (10.255.138.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 11:10:36 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 11:10:36 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [Xen-devel] per-domain passthrough/iommu options
Thread-Index: AdVDqy2gdS3slVvQRuCN/iB10JmJ2gABnjsAAAD6vMAAAUXLgAAASpcAAADXF4AAAKXGUACPHNGA
Date: Mon, 29 Jul 2019 11:10:36 +0000
Message-ID: <9f3ac2e7-9542-dcf0-9e57-bb95928dd947@suse.com>
References: <a65d176f8912458c8576367597613de9@AMSPEX02CL03.citrite.net>
 <8fff2485-bf0a-5b98-dfbc-4679c39b9ed0@suse.com>
 <3cd2057e69bc4bdbb87f53c97ffe765c@AMSPEX02CL03.citrite.net>
 <82fc3e28-353a-44fb-0d6b-ec2913610c2f@suse.com>
 <fa7e8a34bedc43de8a62d8a8480d171e@AMSPEX02CL03.citrite.net>
 <73c71fa0-9eb9-c126-726d-114ff9f464af@suse.com>
 <067b1b1b41bb4fcbba0c353f4be0dc7d@AMSPEX02CL03.citrite.net>
In-Reply-To: <067b1b1b41bb4fcbba0c353f4be0dc7d@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR02CA0011.eurprd02.prod.outlook.com
 (2603:10a6:6:15::24) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e012c9d4-d577-4c73-af7b-08d7141561b2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3345; 
x-ms-traffictypediagnostic: BY5PR18MB3345:
x-microsoft-antispam-prvs: <BY5PR18MB334500BC538B964FC3796843B3DD0@BY5PR18MB3345.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(13464003)(76114002)(31686004)(31696002)(2906002)(3846002)(6116002)(478600001)(14454004)(68736007)(6246003)(25786009)(7736002)(305945005)(26005)(186003)(4326008)(446003)(71190400001)(71200400001)(2616005)(8936002)(6486002)(476003)(11346002)(66446008)(486006)(64756008)(66946007)(8676002)(81166006)(256004)(81156014)(99286004)(66066001)(316002)(66556008)(53936002)(14444005)(66476007)(80792005)(6436002)(76176011)(52116002)(229853002)(53546011)(6506007)(386003)(86362001)(36756003)(102836004)(6916009)(5660300002)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3345;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: E6dIO+n3/5NS3Ne0xwPSvilNcl132ufN1V+auqxFOyib1maBIGm4dBCrd+rD4EgdJuYwGK+g0x5fjP1VUHd9R4sIzZqilNSj5GOkt/AcKbwvBUldEd4coE8xCbOm5/YgjDp+TuVCqrCWPqf4ROurifpGrzQc11ZLkiJydVgkjhXTgBPDgZqgiAZgFek8haLSU9hKBlG+Ix7C1p5OJX/a5JaZaG2zm9uqvDnBhtdaKMnjcxqePCsp0z/7TXq4NoQ0UhBLSptyGYr9k0gO2hDRz2O1JezcC1rnkJ8WxhwRIsjcsQ0UQjHCZjVgnKgWTAdZo25viejroosW+CHex0pZvrHX/0ha3/L1GgsgGypIostjWXwHhs6oZMD9Q8/ujD8PtfNfnUaPkDP6m1M4fjle9E2g0EYaxpiqqwREjZPmVls=
Content-ID: <C783296C9C546B4B91614DB3EDB18DDD@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e012c9d4-d577-4c73-af7b-08d7141561b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 11:10:36.4192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3345
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] per-domain passthrough/iommu options
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
Cc: "xen-devel \(xen-devel@lists.xenproject.org\)"
 <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMjAxOSAxNjo1NCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4N
Cj4+IFNlbnQ6IDI2IEp1bHkgMjAxOSAxNTozNA0KPj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5E
dXJyYW50QGNpdHJpeC5jb20+DQo+PiBDYzogeGVuLWRldmVsICh4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcpIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+DQo+PiBTdWJqZWN0
OiBSZTogW1hlbi1kZXZlbF0gcGVyLWRvbWFpbiBwYXNzdGhyb3VnaC9pb21tdSBvcHRpb25zDQo+
Pg0KPj4gT24gMjYuMDcuMjAxOSAxNjoyNiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4+PiBGcm9t
OiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+DQo+Pj4+IFNlbnQ6IDI2IEp1bHkgMjAx
OSAxNTowMg0KPj4+Pg0KPj4+PiBPbiAyNi4wNy4yMDE5IDE1OjM5LCBQYXVsIER1cnJhbnQgd3Jv
dGU6DQo+Pj4+PiA/IEkgZG9uJ3QgdGhpbmsgJ3ByaXZhdGUtcHQnIG9yICdzZXBhcmF0ZS1wdCcg
cmVhbGx5IGNhcHR1cmUgdGhlIGZhY3QgdGhhdCB0aGUgcGFnZSB0YWJsZXMgbWF0Y2gNCj4+IHRo
ZQ0KPj4+PiBQMk0uIFRoZXkgY291bGQganVzdCBhcyBlYXNpbHkgYmUgdGFrZW4gdG8gbWVhbiB0
aGF0IHRoZXkgYXJlIHBvcHVsYXRlZCB1c2luZyBzb21lIG90aGVyIHBvbGljeS4NCj4+Pj4NCj4+
Pj4gQnV0IGhhdmVuJ3Qgd2UgcmVjZW50bHkgc2VlbiB0aGF0IHRoaXMgZnVsbHkgbG9jay1zdGVw
IHBvcHVsYXRpb24NCj4+Pj4gb2YgcGFnZSB0YWJsZXMgaXNuJ3QgYWx3YXlzIGNvcnJlY3QgKG9y
IGF0IGxlYXN0IGRlc2lyYWJsZSk/IEkNCj4+Pj4gdmFndWVseSByZWNhbGwgb3RoZXIgY29tbWVu
dHMgdG8gdGhhdCBlZmZlY3QgdG9vLCBmcm9tIGxvbmcgYWdvLg0KPj4+PiBJJ2Qgc3BlY2lmaWNh
bGx5IHdhbnQgdG8gYXZvaWQgZW5jb2RpbmcgaW50byB0aGUgaW50ZXJmYWNlIGhlcmUNCj4+Pj4g
dGhhdCB0aGUgdHdvIGFyZSBleGFjdCBtaXJyb3JzIG9mIG9uZSBhbm90aGVyLCBub3cgYW5kIGZv
cmV2ZXIuDQo+Pj4NCj4+PiBIb3cgZG8geW91IHRoaW5rIHdlIHNob3VsZCBleHByZXNzIGl0LiBJ
IGFncmVlIHRoYXQgaXQncyBhIGJpdCBhd2t3YXJkIGJlY2F1c2Ugb2YgdGhlIGRpZmZlcmVuY2UN
Cj4+IGJldHdlZW4gSFZNIGFuZCBQViBkb21haW5zLCBidXQgYWxsIHdlIGNhbiBkbyB0aGVyZSBy
ZWFsbHkgaXMgZG9jdW1lbnQgaXQgSSB0aGluaywgc28gcGVyaGFwcyB0aGUNCj4+IG1hbnBhZ2Ug
Y291bGQgaGF2ZSBzb21ldGhpbmcgbGlrZToNCj4+DQo+PiBTb3VuZHMgcmVhc29uYWJsZSAtIGl0
IGF0IGxlYXN0IGF2b2lkcyBtYWtpbmcgdGhlIGJlaGF2aW9yIHRvbw0KPj4gbXVjaCBzcGVsbGVk
IG91dCB3aXRoIHJlZ2FyZCB0byB0aGUgc2ltaWxhcml0eSBvZiBtYXBwaW5ncyBiZXR3ZWVuDQo+
PiBJT01NVSBwYWdlIHRhYmxlcyBhbmQgUDJNLiBUaGVyZSdzIG9uZSBpc3N1ZSB0aG91Z2g6DQo+
Pg0KPj4+ICdvZmYnDQo+Pj4NCj4+PiBJT01NVSBtYXBwaW5ncyBhcmUgZGlzYWJsZWQgZm9yIHRo
ZSBkb21haW4gYW5kIHNvIGhhcmR3YXJlIG1heSBub3QgYmUgcGFzc2VkIHRocm91Z2guDQo+Pj4N
Cj4+PiAnc3luYy1wdCcNCj4+Pg0KPj4+IEZvciBhIFBWIGRvbWFpbiwgYWxsIHdyaXRhYmxlIHBh
Z2VzIGFzc2lnbmVkIHRvIHRoZSBkb21haW4gYXJlIGlkZW50aXR5IG1hcHBlZCBieSBNRk4gaW4g
dGhlIElPTU1VDQo+PiBwYWdlIHRhYmxlcy4gVGh1cyBhIGRldmljZSBkcml2ZXIgcnVubmluZyBp
biB0aGUgZG9tYWluIG1heSBwcm9ncmFtIHBhc3N0aHJvdWdoIGhhcmR3YXJlIGZvciBETUEgdXNp
bmcNCj4+IE1GTiB2YWx1ZXMgKGkuZS4gaG9zdC9tYWNoaW5lIGZyYW1lIG51bWJlcnMpIGxvb2tl
ZCB1cCBpbiBpdHMgUDJNLg0KPj4+IEZvciBhbiBIVk0gZG9tYWluLCBhbGwgbm9uLWZvcmVpZ24g
UkFNIHBhZ2VzIHByZXNlbnQgaW4gdGhlIFAyTSB3aWxsIGJlIGlkZW50aXR5IG1hcHBlZCBieSBH
Rk4NCj4+DQo+PiBXaHkgImlkZW50aXR5IG1hcHBlZCIgaGVyZT8gSXQncyBhIEdGTiAtPiBNRk4g
bWFwcGluZ20sIGlzbid0IGl0Pw0KPiANCj4gWWVzLi4uIGl0J3MgaGFyZCB0byBleHByZXNzLiBX
aGF0IEkgd2FudCB0byBzYXksIG9mIGNvdXJzZSwgaXMgdGhhdCBkZXZpY2UgZHJpdmVycyBjYW4g
dXNlIEdGTnMuIENhbiB5b3UgdGhpbmsgb2YgYW55IG90aGVyIGZvcm0gb2Ygd29yZHMgdGhhdCBt
aWdodCBiZSBiZXR0ZXI/DQoNCkp1c3Qgb21pdCAiaWRlbnRpdHkiIGluIHRoZSBIVk0gcmVsYXRl
ZCBzZW50ZW5jZT8NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
