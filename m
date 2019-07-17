Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D74A46B715
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 09:02:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnduY-0007aG-85; Wed, 17 Jul 2019 06:59:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnduV-0007aB-US
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 06:59:31 +0000
X-Inumbo-ID: 6a6416f4-a860-11e9-a84b-e7d18c6d5a69
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a6416f4-a860-11e9-a84b-e7d18c6d5a69;
 Wed, 17 Jul 2019 06:59:28 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 06:59:25 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 06:59:10 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 06:59:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxmNXFKtY09/xfp1ODcM6q1Da4P/1/PZZgym7msDGgyY4HpO07TzK/YK7tPauNcXADSipFlviycGuJ/8xfWIzUKLPAX9crYrO6OXALQExJrsmD8sfx1xzzDB1DTKckYITRk2a0q8px2UkQO7HawDmhLVud0KelV1OyYgebErIKcuMSherAg07i0ocAYsLOgzCeCnzElsvy/A+zYY1/6ntrbmrWN3OvS1XuHkWoBb30GCySVSddMLFLbnPgDjYTdf1wctXG/hWiTrJdndNisq47GwuYi+LOh1Y4tnjCAPZdhNfYGY42AxWFlv2ugtzYC4xfmfYIn45tBGT0Q0CwT8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bV99t9mhISRDL6L37Tt5iMwNF/Cx66x0PVz6wERhaJ8=;
 b=RlgLezSCLw3mE6x5aw5/TY6+hHfnLYC2YCjZT4EKVRzAlJzNk3sAe1FgyG4IHLVOmk60Vi/dP/V6TZ6qVpkrMfU1uiDy6joN3ibBwlVjJC1ONgvsc2L6UyOGfGOF9SXCHVcEG3JsvnlmDtcgvBv2EjsQK4KxqF/xxc9+YSUGLORlTQoQyziqRI9Ts9O5ZnAlL0s3gdXuSSTJEML4kWKUFpujYCJZ1XiEuOjmAHSnRCerZ/yi0umxLGGtv3mVwbywSC93x1w8YnAdyEnC/2dL9dXw/v4uHxasKu8zhw4zyRL7kvBYfGZFipbcrHkI1pn9hJWd8fmIBpMSS4HPY7PniA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2601.namprd18.prod.outlook.com (20.179.106.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.11; Wed, 17 Jul 2019 06:59:09 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 06:59:09 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: Ping: [PATCH v2 1/4] x86/PV: tighten page table ownership check
 in emul-priv-op.c:read_cr()
Thread-Index: AQHVPG0io4mJ+l5O+0+d1rxyiWEgBg==
Date: Wed, 17 Jul 2019 06:59:09 +0000
Message-ID: <30fea6f7-0226-1767-669e-a7428fe35aaa@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR03CA0099.eurprd03.prod.outlook.com
 (2603:10a6:10:72::40) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31ec7384-4c9c-4fbe-43ff-08d70a84446a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2601; 
x-ms-traffictypediagnostic: DM6PR18MB2601:
x-microsoft-antispam-prvs: <DM6PR18MB2601F1347079C318552E1054B3C90@DM6PR18MB2601.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(199004)(189003)(102836004)(71200400001)(71190400001)(26005)(25786009)(316002)(81166006)(81156014)(53546011)(386003)(6506007)(4326008)(5660300002)(6486002)(2906002)(486006)(53936002)(186003)(36756003)(14454004)(7736002)(305945005)(99286004)(6916009)(8676002)(256004)(478600001)(68736007)(31686004)(31696002)(6436002)(3846002)(6512007)(6116002)(64756008)(2616005)(52116002)(66446008)(66556008)(66476007)(476003)(66946007)(86362001)(66066001)(8936002)(80792005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2601;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: k/at1T0VEWgXGGNDuFTAbWFv0g8ivuwHkwVqJpTMV+3C0OtG/Ab4+iqLb4Q/mQ/6/+HpFRU4lLBGAVuxrYys0NiQteTjhPn1pscOWTkKvfJrq7KKWN/j/IKn/hPzwX+0HRnfDLPKNRixlUf72Qv68mM5r0uF8IrH/YFPHJeCTZTnffdMrzkQcPLJIcZVQNHYfWHQmWpFzGO1L3890wWoZ1eYAZR3a/eR50zjLht8dJ281cDTNlu/XZNeuhL9YkcBK2+xGrLoP+Ey4Gsg/A3bx7tBPFH3Qima0zHLcLPxLHhYsq6P9opuTgWpA1wvp5lApEaIFmGNz4CMSy3mnyuG/QvnQzg3yny9bQ+E1jahJYpG3HK/PBKwKCfJcrXKlAnd+tnnj82zQe4BIehN4YaiTm4Cs8Ohi47YpBcStIdkCIg=
Content-ID: <B55DCB3734348E46ADACBF849638DC80@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ec7384-4c9c-4fbe-43ff-08d70a84446a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 06:59:09.8418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2601
X-OriginatorOrg: suse.com
Subject: [Xen-devel] Ping: [PATCH v2 1/4] x86/PV: tighten page table
 ownership check in emul-priv-op.c:read_cr()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDE0OjQxLCAgd3JvdGU6DQo+IFJhdGhlciB0aGFuIGNoZWNraW5n
IHRoYXQgYSBwYWdlIHRhYmxlIGlzIF9ub3RfICJvd25lZCIgYnkgdGhlIGZha2UgQ09XDQo+IGRv
bWFpbiwgY2hlY2sgdGhhdCBpdCdzIG93bmVkIGJ5IHRoZSBkb21haW4gYWN0dWFsbHkgd2FudGlu
ZyB0byBpbnN0YWxsDQo+IGl0Lg0KPiANCj4gU3dpdGNoIGF3YXkgZnJvbSBCVUdfT04oKSBhdCB0
aGUgc2FtZSB0aW1lLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KDQpJJ3ZlIGdvdCBSb2dlcidzIFItYiAtIGFueSBjaGFuY2UgdG8gZ2V0IGFu
IGFjayBoZXJlIHNvIGl0IGNhbiBnbyBpbj8NCg0KPiAtLS0NCj4gdjI6IFNwbGl0IG91dCBmcm9t
IGxhcmdlciBwYXRjaCB0byBtYWtlIGZ1cnRoZXIgYWRqdXN0bWVudHMuDQo+IC0tLQ0KPiBUaGlu
a2luZyBhYm91dCBpdCBJIHdvbmRlciB3aHkgd2UgaGF2ZSBzdWNoIGEgY2hlY2sgaGVyZSBhbmQg
bm8td2hlcmUNCj4gZWxzZS4gQW4gYWx0ZXJuYXRpdmUgd291bGQgc2VlbSB0byBiZSB0byBzaW1w
bHkgZHJvcCB0aGUgQlVHX09OKCkuDQoNCk9yIHdvdWxkIHlvdSBwcmVmZXIgbWUgdG8gZ28gdGhp
cyAob3IgeWV0IGFub3RoZXIpIHJvdXRlPw0KDQpKYW4NCg0KPiAtLS0gYS94ZW4vYXJjaC94ODYv
cHYvZW11bC1wcml2LW9wLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L3B2L2VtdWwtcHJpdi1vcC5j
DQo+IEBAIC03MDYsNyArNzA2LDcgQEAgc3RhdGljIGludCByZWFkX2NyKHVuc2lnbmVkIGludCBy
ZWcsIHVucw0KPiAgDQo+ICAgICAgY2FzZSAzOiAvKiBSZWFkIENSMyAqLw0KPiAgICAgIHsNCj4g
LSAgICAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqY3VycmQgPSBjdXJyLT5kb21haW47DQo+ICsg
ICAgICAgIHN0cnVjdCBkb21haW4gKmN1cnJkID0gY3Vyci0+ZG9tYWluOw0KPiAgICAgICAgICBt
Zm5fdCBtZm47DQo+ICANCj4gICAgICAgICAgaWYgKCAhaXNfcHZfMzJiaXRfZG9tYWluKGN1cnJk
KSApDQo+IEBAIC03MjMsOCArNzIzLDE0IEBAIHN0YXRpYyBpbnQgcmVhZF9jcih1bnNpZ25lZCBp
bnQgcmVnLCB1bnMNCj4gICAgICAgICAgICAgIHVubWFwX2RvbWFpbl9wYWdlKHBsNGUpOw0KPiAg
ICAgICAgICAgICAgKnZhbCA9IGNvbXBhdF9wZm5fdG9fY3IzKG1mbl90b19nbWZuKGN1cnJkLCBt
Zm5feChtZm4pKSk7DQo+ICAgICAgICAgIH0NCj4gLSAgICAgICAgLyogUFRzIHNob3VsZCBub3Qg
YmUgc2hhcmVkICovDQo+IC0gICAgICAgIEJVR19PTihwYWdlX2dldF9vd25lcihtZm5fdG9fcGFn
ZShtZm4pKSA9PSBkb21fY293KTsNCj4gKw0KPiArICAgICAgICAvKiBQVHMgc2hvdWxkIGJlIG93
bmVkIGJ5IHRoZWlyIGRvbWFpbnMgKi8NCj4gKyAgICAgICAgaWYgKCBwYWdlX2dldF9vd25lciht
Zm5fdG9fcGFnZShtZm4pKSAhPSBjdXJyZCApDQo+ICsgICAgICAgIHsNCj4gKyAgICAgICAgICAg
IEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPiArICAgICAgICAgICAgZG9tYWluX2NyYXNoKGN1cnJk
KTsNCj4gKyAgICAgICAgfQ0KPiArDQo+ICAgICAgICAgIHJldHVybiBYODZFTVVMX09LQVk7DQo+
ICAgICAgfQ0KPiAgICAgIH0NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
