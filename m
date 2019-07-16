Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC606A348
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 09:51:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnIBx-0002uQ-Vx; Tue, 16 Jul 2019 07:48:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnIBw-0002u6-O6
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 07:48:04 +0000
X-Inumbo-ID: 096525e0-a79e-11e9-a140-27e16e1e6b08
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 096525e0-a79e-11e9-a140-27e16e1e6b08;
 Tue, 16 Jul 2019 07:48:02 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 07:48:01 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 07:44:27 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 07:44:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAKmWnXA7QBhsNKIFAdKuOap1DX2B5njWcW5nES9jS2QL2R9MPQOjZAC9gtG35vkuOfa7OgRyym/LKcyTDGwgplw8GsC+aKae848l6WP2HrmJx+8d6dYxzeVtnskaSMoTs8564olKsZm0p6Z6wTbn3vRKEY1dFhkOGJxkkzNTrgIDWMBkuKSQ+v9poLhMAfkHs7mOT6vUlD3H9ZqQVAR3AHE6J0/eyedD1Do+uilaqfsd6oCGTyYh3f4IOAjhKtXBcqd/REUNu2ypd8rGJ9VfmsPK5hujxNbTv6ipabEdaJjyOekxv0yWZ6+IUlCAMyYyLLfkZOE0WHCGhB7L+7CQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcP8GYNOpduM3r6dwUuYkp76fE5Zx9qWnYDzPW/DR1k=;
 b=A5WI7/K67PY9YNiaJFHLERPcz4thJuTsy+BhGIzEfopo97Wnfm5I1lcWYpzxbZuxFjshtnbKlrXO723ow1WWAA4guVfaWYiaBybHdFQPZBaacfEjYdRb3wdPe1cvVUeHth1ANmxna1ZKBweKqYQQUAZCdgOau7VxSoS+wzX8l3IopZDGw3ylBLuIwwSfh/Njl8Ublul2mu7uSNBXxwplYYsIHVIH1zCVRY0NPuWBEyjV77gUQj53/5HPIaph8mRD+5r9YXqkVU+sc4FCCLon58rqVP3hrMdYjFuCvluUWcVejNUzom9P6fr0/Z4zYxcV/0QJUfpSgSbTNprooe2gAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2667.namprd18.prod.outlook.com (20.179.107.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 07:44:26 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 07:44:26 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 12/13] x86/IRQ: eliminate some on-stack cpumask_t
 instances
Thread-Index: AQHVO6pKDn1083D/KkaQ2jj4uqEkWw==
Date: Tue, 16 Jul 2019 07:44:26 +0000
Message-ID: <37f03698-7664-1c3d-0d2d-3ac8d1636fc1@suse.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
In-Reply-To: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR05CA0035.eurprd05.prod.outlook.com
 (2603:10a6:10:36::48) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20f6830b-a294-45c0-c3ea-08d709c16d57
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2667; 
x-ms-traffictypediagnostic: DM6PR18MB2667:
x-microsoft-antispam-prvs: <DM6PR18MB26675E414CDBD8A68A37542AB3CE0@DM6PR18MB2667.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(189003)(199004)(6436002)(102836004)(5640700003)(8676002)(53936002)(6506007)(4326008)(386003)(6512007)(7736002)(186003)(6116002)(6486002)(305945005)(52116002)(2906002)(66066001)(11346002)(81166006)(2616005)(8936002)(316002)(476003)(3846002)(66476007)(446003)(76176011)(2351001)(99286004)(26005)(81156014)(31686004)(68736007)(6916009)(256004)(14444005)(14454004)(486006)(71190400001)(478600001)(71200400001)(31696002)(5660300002)(86362001)(80792005)(2501003)(54906003)(36756003)(25786009)(64756008)(66556008)(66946007)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2667;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wpKpMaS6zdx64J1grMh7ELt58X3uBo3rUzan+IbnjC6jl8p/w7uLkz11kN8ExdlGg0LY6FM5GST2rQYOk0074snWAagSN1xhbyumqsAm/uqf2XWa89EQWILMHlqTT0CDGSLMY9kqoOUq6L5z6dW/rhfiFVmBqJRRoEQHJVVO9BfUm34izIb/x0umoCH296oAX///TvFaw9qUY5OVK5A5+ki7va30ViF09DMKH7JAs281I4+RqeCyv0IaUkuzfhthmK5F0BQYtviZFlCur+l6lYOnerTTWFwnaqTyjeOqLJso4Y0FWLWOri6TQnsjs3YuiDHxnGthbrw4dkHk3KSi4GFTaTv03GTwQZDK9dQFdgLiVq17BEaGU1tZnrSNdRSY27QQm+tfgEkaJFTL47R4+4YVrNS9UCaK5df/Lo8AplY=
Content-ID: <0F5E1125388404499713AD39BF6D88FE@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f6830b-a294-45c0-c3ea-08d709c16d57
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 07:44:26.5240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2667
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4 12/13] x86/IRQ: eliminate some on-stack
 cpumask_t instances
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIHNjcmF0Y2hfY3B1bWFzayB3aGVyZSBwb3NzaWJsZSwgdG8gYXZvaWQgY3JlYXRpbmcgdGhl
c2UgcG9zc2libHkNCmxhcmdlIHN0YWNrIG9iamVjdHMuIFdlIGNhbid0IHVzZSBpdCBpbiBfYXNz
aWduX2lycV92ZWN0b3IoKSBhbmQNCnNldF9kZXNjX2FmZmluaXR5KCksIGFzIHRoZXNlIGdldCBj
YWxsZWQgaW4gSVJRIGNvbnRleHQuDQoNClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4NCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPg0KLS0tDQp2NDogUmUtYmFzZSBvdmVyIGNoYW5nZXMgZWFybGllciBpbiB0aGUgc2Vy
aWVzLg0KdjM6IE5ldy4NCg0KLS0tIGEveGVuL2FyY2gveDg2L2lycS5jDQorKysgYi94ZW4vYXJj
aC94ODYvaXJxLmMNCkBAIC0yODUsMTQgKzI4NSwxNSBAQCBzdGF0aWMgdm9pZCBfY2xlYXJfaXJx
X3ZlY3RvcihzdHJ1Y3QgaXJxDQogIHsNCiAgICAgIHVuc2lnbmVkIGludCBjcHUsIG9sZF92ZWN0
b3IsIGlycSA9IGRlc2MtPmlycTsNCiAgICAgIHVuc2lnbmVkIGludCB2ZWN0b3IgPSBkZXNjLT5h
cmNoLnZlY3RvcjsNCi0gICAgY3B1bWFza190IHRtcF9tYXNrOw0KKyAgICBjcHVtYXNrX3QgKnRt
cF9tYXNrID0gdGhpc19jcHUoc2NyYXRjaF9jcHVtYXNrKTsNCiAgDQogICAgICBCVUdfT04oIXZh
bGlkX2lycV92ZWN0b3IodmVjdG9yKSk7DQogIA0KICAgICAgLyogQWx3YXlzIGNsZWFyIGRlc2Mt
PmFyY2gudmVjdG9yICovDQotICAgIGNwdW1hc2tfYW5kKCZ0bXBfbWFzaywgZGVzYy0+YXJjaC5j
cHVfbWFzaywgJmNwdV9vbmxpbmVfbWFwKTsNCisgICAgY3B1bWFza19hbmQodG1wX21hc2ssIGRl
c2MtPmFyY2guY3B1X21hc2ssICZjcHVfb25saW5lX21hcCk7DQogIA0KLSAgICBmb3JfZWFjaF9j
cHUoY3B1LCAmdG1wX21hc2spIHsNCisgICAgZm9yX2VhY2hfY3B1KGNwdSwgdG1wX21hc2spDQor
ICAgIHsNCiAgICAgICAgICBBU1NFUlQoIHBlcl9jcHUodmVjdG9yX2lycSwgY3B1KVt2ZWN0b3Jd
ID09IGlycSApOw0KICAgICAgICAgIHBlcl9jcHUodmVjdG9yX2lycSwgY3B1KVt2ZWN0b3JdID0g
fmlycTsNCiAgICAgIH0NCkBAIC0zMDgsMTYgKzMwOSwxNyBAQCBzdGF0aWMgdm9pZCBfY2xlYXJf
aXJxX3ZlY3RvcihzdHJ1Y3QgaXJxDQogIA0KICAgICAgZGVzYy0+YXJjaC51c2VkID0gSVJRX1VO
VVNFRDsNCiAgDQotICAgIHRyYWNlX2lycV9tYXNrKFRSQ19IV19JUlFfQ0xFQVJfVkVDVE9SLCBp
cnEsIHZlY3RvciwgJnRtcF9tYXNrKTsNCisgICAgdHJhY2VfaXJxX21hc2soVFJDX0hXX0lSUV9D
TEVBUl9WRUNUT1IsIGlycSwgdmVjdG9yLCB0bXBfbWFzayk7DQogIA0KICAgICAgaWYgKCBsaWtl
bHkoIWRlc2MtPmFyY2gubW92ZV9pbl9wcm9ncmVzcykgKQ0KICAgICAgICAgIHJldHVybjsNCiAg
DQogICAgICAvKiBJZiB3ZSB3ZXJlIGluIG1vdGlvbiwgYWxzbyBjbGVhciBkZXNjLT5hcmNoLm9s
ZF92ZWN0b3IgKi8NCiAgICAgIG9sZF92ZWN0b3IgPSBkZXNjLT5hcmNoLm9sZF92ZWN0b3I7DQot
ICAgIGNwdW1hc2tfYW5kKCZ0bXBfbWFzaywgZGVzYy0+YXJjaC5vbGRfY3B1X21hc2ssICZjcHVf
b25saW5lX21hcCk7DQorICAgIGNwdW1hc2tfYW5kKHRtcF9tYXNrLCBkZXNjLT5hcmNoLm9sZF9j
cHVfbWFzaywgJmNwdV9vbmxpbmVfbWFwKTsNCiAgDQotICAgIGZvcl9lYWNoX2NwdShjcHUsICZ0
bXBfbWFzaykgew0KKyAgICBmb3JfZWFjaF9jcHUoY3B1LCB0bXBfbWFzaykNCisgICAgew0KICAg
ICAgICAgIEFTU0VSVCggcGVyX2NwdSh2ZWN0b3JfaXJxLCBjcHUpW29sZF92ZWN0b3JdID09IGly
cSApOw0KICAgICAgICAgIFRSQUNFXzNEKFRSQ19IV19JUlFfTU9WRV9GSU5JU0gsIGlycSwgb2xk
X3ZlY3RvciwgY3B1KTsNCiAgICAgICAgICBwZXJfY3B1KHZlY3Rvcl9pcnEsIGNwdSlbb2xkX3Zl
Y3Rvcl0gPSB+aXJxOw0KQEAgLTExNjksNyArMTE3MSw2IEBAIHN0YXRpYyB2b2lkIGlycV9ndWVz
dF9lb2lfdGltZXJfZm4odm9pZA0KICAgICAgc3RydWN0IGlycV9kZXNjICpkZXNjID0gZGF0YTsN
CiAgICAgIHVuc2lnbmVkIGludCBpLCBpcnEgPSBkZXNjIC0gaXJxX2Rlc2M7DQogICAgICBpcnFf
Z3Vlc3RfYWN0aW9uX3QgKmFjdGlvbjsNCi0gICAgY3B1bWFza190IGNwdV9lb2lfbWFwOw0KICAN
CiAgICAgIHNwaW5fbG9ja19pcnEoJmRlc2MtPmxvY2spOw0KICAgICAgDQpAQCAtMTIwNiwxNCAr
MTIwNywxOCBAQCBzdGF0aWMgdm9pZCBpcnFfZ3Vlc3RfZW9pX3RpbWVyX2ZuKHZvaWQNCiAgDQog
ICAgICBzd2l0Y2ggKCBhY3Rpb24tPmFja190eXBlICkNCiAgICAgIHsNCisgICAgICAgIGNwdW1h
c2tfdCAqY3B1X2VvaV9tYXA7DQorDQogICAgICBjYXNlIEFDS1RZUEVfVU5NQVNLOg0KICAgICAg
ICAgIGlmICggZGVzYy0+aGFuZGxlci0+ZW5kICkNCiAgICAgICAgICAgICAgZGVzYy0+aGFuZGxl
ci0+ZW5kKGRlc2MsIDApOw0KICAgICAgICAgIGJyZWFrOw0KKw0KICAgICAgY2FzZSBBQ0tUWVBF
X0VPSToNCi0gICAgICAgIGNwdW1hc2tfY29weSgmY3B1X2VvaV9tYXAsIGFjdGlvbi0+Y3B1X2Vv
aV9tYXApOw0KKyAgICAgICAgY3B1X2VvaV9tYXAgPSB0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2sp
Ow0KKyAgICAgICAgY3B1bWFza19jb3B5KGNwdV9lb2lfbWFwLCBhY3Rpb24tPmNwdV9lb2lfbWFw
KTsNCiAgICAgICAgICBzcGluX3VubG9ja19pcnEoJmRlc2MtPmxvY2spOw0KLSAgICAgICAgb25f
c2VsZWN0ZWRfY3B1cygmY3B1X2VvaV9tYXAsIHNldF9lb2lfcmVhZHksIGRlc2MsIDApOw0KKyAg
ICAgICAgb25fc2VsZWN0ZWRfY3B1cyhjcHVfZW9pX21hcCwgc2V0X2VvaV9yZWFkeSwgZGVzYywg
MCk7DQogICAgICAgICAgcmV0dXJuOw0KICAgICAgfQ0KICANCkBAIC0yNDU4LDcgKzI0NjMsNyBA
QCB2b2lkIGZpeHVwX2lycXMoY29uc3QgY3B1bWFza190ICptYXNrLCBiDQogICAgICB7DQogICAg
ICAgICAgYm9vbCBicmVha19hZmZpbml0eSA9IGZhbHNlLCBzZXRfYWZmaW5pdHkgPSB0cnVlOw0K
ICAgICAgICAgIHVuc2lnbmVkIGludCB2ZWN0b3I7DQotICAgICAgICBjcHVtYXNrX3QgYWZmaW5p
dHk7DQorICAgICAgICBjcHVtYXNrX3QgKmFmZmluaXR5ID0gdGhpc19jcHUoc2NyYXRjaF9jcHVt
YXNrKTsNCiAgDQogICAgICAgICAgaWYgKCBpcnEgPT0gMiApDQogICAgICAgICAgICAgIGNvbnRp
bnVlOw0KQEAgLTI0ODksOSArMjQ5NCw5IEBAIHZvaWQgZml4dXBfaXJxcyhjb25zdCBjcHVtYXNr
X3QgKm1hc2ssIGINCiAgICAgICAgICBpZiAoIGRlc2MtPmFyY2gubW92ZV9jbGVhbnVwX2NvdW50
ICkNCiAgICAgICAgICB7DQogICAgICAgICAgICAgIC8qIFRoZSBjbGVhbnVwIElQSSBtYXkgaGF2
ZSBnb3Qgc2VudCB3aGlsZSB3ZSB3ZXJlIHN0aWxsIG9ubGluZS4gKi8NCi0gICAgICAgICAgICBj
cHVtYXNrX2FuZG5vdCgmYWZmaW5pdHksIGRlc2MtPmFyY2gub2xkX2NwdV9tYXNrLA0KKyAgICAg
ICAgICAgIGNwdW1hc2tfYW5kbm90KGFmZmluaXR5LCBkZXNjLT5hcmNoLm9sZF9jcHVfbWFzaywN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmNwdV9vbmxpbmVfbWFwKTsNCi0gICAgICAg
ICAgICBkZXNjLT5hcmNoLm1vdmVfY2xlYW51cF9jb3VudCAtPSBjcHVtYXNrX3dlaWdodCgmYWZm
aW5pdHkpOw0KKyAgICAgICAgICAgIGRlc2MtPmFyY2gubW92ZV9jbGVhbnVwX2NvdW50IC09IGNw
dW1hc2tfd2VpZ2h0KGFmZmluaXR5KTsNCiAgICAgICAgICAgICAgaWYgKCAhZGVzYy0+YXJjaC5t
b3ZlX2NsZWFudXBfY291bnQgKQ0KICAgICAgICAgICAgICAgICAgcmVsZWFzZV9vbGRfdmVjKGRl
c2MpOw0KICAgICAgICAgIH0NCkBAIC0yNTE4LDEwICsyNTIzLDEwIEBAIHZvaWQgZml4dXBfaXJx
cyhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGINCiAgICAgICAgICB7DQogICAgICAgICAgICAgIHVu
c2lnbmVkIGludCBjcHU7DQogIA0KLSAgICAgICAgICAgIGNwdW1hc2tfYW5kKCZhZmZpbml0eSwg
ZGVzYy0+YXJjaC5vbGRfY3B1X21hc2ssICZjcHVfb25saW5lX21hcCk7DQorICAgICAgICAgICAg
Y3B1bWFza19hbmQoYWZmaW5pdHksIGRlc2MtPmFyY2gub2xkX2NwdV9tYXNrLCAmY3B1X29ubGlu
ZV9tYXApOw0KICANCiAgICAgICAgICAgICAgc3Bpbl9sb2NrKCZ2ZWN0b3JfbG9jayk7DQotICAg
ICAgICAgICAgZm9yX2VhY2hfY3B1KGNwdSwgJmFmZmluaXR5KQ0KKyAgICAgICAgICAgIGZvcl9l
YWNoX2NwdShjcHUsIGFmZmluaXR5KQ0KICAgICAgICAgICAgICAgICAgcGVyX2NwdSh2ZWN0b3Jf
aXJxLCBjcHUpW2Rlc2MtPmFyY2gub2xkX3ZlY3Rvcl0gPSB+aXJxOw0KICAgICAgICAgICAgICBz
cGluX3VubG9jaygmdmVjdG9yX2xvY2spOw0KICANCkBAIC0yNTMyLDIzICsyNTM3LDIzIEBAIHZv
aWQgZml4dXBfaXJxcyhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGINCiAgICAgICAgICBpZiAoICFj
cHVtYXNrX2ludGVyc2VjdHMobWFzaywgZGVzYy0+YWZmaW5pdHkpICkNCiAgICAgICAgICB7DQog
ICAgICAgICAgICAgIGJyZWFrX2FmZmluaXR5ID0gdHJ1ZTsNCi0gICAgICAgICAgICBjcHVtYXNr
X3NldGFsbCgmYWZmaW5pdHkpOw0KKyAgICAgICAgICAgIGNwdW1hc2tfc2V0YWxsKGFmZmluaXR5
KTsNCiAgICAgICAgICB9DQogICAgICAgICAgZWxzZQ0KLSAgICAgICAgICAgIGNwdW1hc2tfY29w
eSgmYWZmaW5pdHksIGRlc2MtPmFmZmluaXR5KTsNCisgICAgICAgICAgICBjcHVtYXNrX2NvcHko
YWZmaW5pdHksIGRlc2MtPmFmZmluaXR5KTsNCiAgDQogICAgICAgICAgaWYgKCBkZXNjLT5oYW5k
bGVyLT5kaXNhYmxlICkNCiAgICAgICAgICAgICAgZGVzYy0+aGFuZGxlci0+ZGlzYWJsZShkZXNj
KTsNCiAgDQogICAgICAgICAgaWYgKCBkZXNjLT5oYW5kbGVyLT5zZXRfYWZmaW5pdHkgKQ0KLSAg
ICAgICAgICAgIGRlc2MtPmhhbmRsZXItPnNldF9hZmZpbml0eShkZXNjLCAmYWZmaW5pdHkpOw0K
KyAgICAgICAgICAgIGRlc2MtPmhhbmRsZXItPnNldF9hZmZpbml0eShkZXNjLCBhZmZpbml0eSk7
DQogICAgICAgICAgZWxzZSBpZiAoICEod2FybmVkKyspICkNCiAgICAgICAgICAgICAgc2V0X2Fm
ZmluaXR5ID0gZmFsc2U7DQogIA0KICAgICAgICAgIGlmICggZGVzYy0+aGFuZGxlci0+ZW5hYmxl
ICkNCiAgICAgICAgICAgICAgZGVzYy0+aGFuZGxlci0+ZW5hYmxlKGRlc2MpOw0KICANCi0gICAg
ICAgIGNwdW1hc2tfY29weSgmYWZmaW5pdHksIGRlc2MtPmFmZmluaXR5KTsNCisgICAgICAgIGNw
dW1hc2tfY29weShhZmZpbml0eSwgZGVzYy0+YWZmaW5pdHkpOw0KICANCiAgICAgICAgICBzcGlu
X3VubG9jaygmZGVzYy0+bG9jayk7DQogIA0KQEAgLTI1NTksNyArMjU2NCw3IEBAIHZvaWQgZml4
dXBfaXJxcyhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGINCiAgICAgICAgICAgICAgcHJpbnRrKCJD
YW5ub3Qgc2V0IGFmZmluaXR5IGZvciBJUlEldVxuIiwgaXJxKTsNCiAgICAgICAgICBlbHNlIGlm
ICggYnJlYWtfYWZmaW5pdHkgKQ0KICAgICAgICAgICAgICBwcmludGsoIkJyb2tlIGFmZmluaXR5
IGZvciBJUlEldSwgbmV3OiAlKnBiXG4iLA0KLSAgICAgICAgICAgICAgICAgICBpcnEsIG5yX2Nw
dV9pZHMsIGNwdW1hc2tfYml0cygmYWZmaW5pdHkpKTsNCisgICAgICAgICAgICAgICAgICAgaXJx
LCBucl9jcHVfaWRzLCBjcHVtYXNrX2JpdHMoYWZmaW5pdHkpKTsNCiAgICAgIH0NCiAgDQogICAg
ICAvKiBUaGF0IGRvZXNuJ3Qgc2VlbSBzdWZmaWNpZW50LiAgR2l2ZSBpdCAxbXMuICovDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
