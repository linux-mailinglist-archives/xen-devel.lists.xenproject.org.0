Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB806E468
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 12:34:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoQ9T-0004Fk-1k; Fri, 19 Jul 2019 10:30:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoQ9R-0004FX-Dg
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 10:30:09 +0000
X-Inumbo-ID: 2b82be16-aa10-11e9-8caa-938f29f2802e
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b82be16-aa10-11e9-8caa-938f29f2802e;
 Fri, 19 Jul 2019 10:30:06 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 10:30:02 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 10:29:13 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 10:29:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7W7I6UYjJYeq4PA+Sva3B9MJD3OpkLz05j1CpkG9MKAPhCon4mARmi7WnogcrOEE1fdArz+jOEJL4iGF530zONaUKJMu7fFMuwvoDMg73DzNsWeevSAdmpnjm287vqd7Vp8wyiFqYWl3sGXo1VyRQH/51eZomzoKKgSUKP1jV/PHJCgDP/f19XGCGDiKpdZskqLBDDq3mXGCRPnfMeC+dr6eg3W3WkVea7gdA/2jBeyX3h/2wUfrWacR5L4Yxkg9YIfCBHtDqNgvNbz5i3WbwtwO8lzGldk2ucTK3YhYj1tRwgWP6UENcnTUmaJ5MM1JN4HDLziXALuO8O94ckJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvVnFIBxtG1VqNAilCVCJY2BYlSAiKIw3lPug2FFKw4=;
 b=XRGp0tuDmrw/e8pUTrlUkPL7NVG3Z8gV7Xz89M/7mMlHI5prAGoxNSvjnGYur5pR/Q8dJkho1X+pLxOiA+YUB5QitsMAMk3HNld5HLed3PZWv3s+72kSAt+OHHbSRwep1uhi9TrMSh7Rfs9MVePeJ8eKHbzzVvV3pkCG/TNo5jw2ingoARqHjxICH0MhiSoSRahqaj7ApA4fQStXAWMF9Xp51zHX8H/HMz+HyCOI7FRP7NnuKNWAePSXA+oe7J5i5mDJjZfKIuAXPoWzU6RWI9kSPSDweimRDZDXtS1wK1pOsNBOViSe9w+U2rNQ06x8/dBHdFztLK9bA7/f2Z2Pzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2540.namprd18.prod.outlook.com (20.179.105.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 10:29:11 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 10:29:11 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 1/2] x86/cpu/intel: Clear cache self-snoop capability
 in CPUs with known errata
Thread-Index: AQHVPhzObMH32PKqfka5dBK6AxG1/g==
Date: Fri, 19 Jul 2019 10:29:11 +0000
Message-ID: <d6a4ad4f-402b-bb01-b920-7d1afb28c4ff@suse.com>
References: <0ccb27d1-6612-d915-a898-8423ac3afdd0@suse.com>
In-Reply-To: <0ccb27d1-6612-d915-a898-8423ac3afdd0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0318.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::18) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cd9dc7f-2a39-4b19-3330-08d70c33f0b4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2540; 
x-ms-traffictypediagnostic: DM6PR18MB2540:
x-microsoft-antispam-prvs: <DM6PR18MB2540DD409F2DEDE231961197B3CB0@DM6PR18MB2540.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(199004)(189003)(66066001)(446003)(11346002)(3846002)(6116002)(6436002)(36756003)(26005)(53936002)(5640700003)(2616005)(476003)(102836004)(186003)(6486002)(478600001)(14454004)(2351001)(25786009)(256004)(486006)(6506007)(71200400001)(7736002)(6916009)(71190400001)(2501003)(316002)(4326008)(99286004)(8676002)(305945005)(86362001)(31696002)(54906003)(31686004)(5660300002)(2906002)(66556008)(76176011)(52116002)(6512007)(386003)(80792005)(66946007)(81156014)(68736007)(8936002)(81166006)(66446008)(64756008)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2540;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: o1il4NumIbrL7IaNZ+CxYBCvIE+ZedMPik1kpU3oXGnBc2nnzIYO5+Av2ptgMWkb5YbZmKVoeEj5Pp6bT55VIG/RWUf8ypoWhf9upsNbg6lFkv6hhFlwOgq5J+AiWmJP5FjKzG/2FKrFutLy68ybpRPwuMOwU+u1/zqKA53X/K44mYwQURsI4vwf8r9pAHyZLBjxj9yj8UIqP7+bI9+o9ZJHHECTW380z01CEr406xZt/YCyJ4Mmwzzo/xotjFaTw21je09HpRp4XIANJYiILQk8zP/L5PH7y+KdrHE5opdLVqgvAWIC5Jj2YXD95Eg1lYhIVXgpPEQwMZb+9gC7yhi4F8S17PtHKWIlajHPMmbirXhsRjZm/Su4Vpqi8TZ4hh8hG+bdf8HnsDcBaAxKLO60TsCceM1VlnRUgAk56Ew=
Content-ID: <4CC21AF714A82747BDEB6CD3E73ECC72@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd9dc7f-2a39-4b19-3330-08d70c33f0b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 10:29:11.8250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2540
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v2 1/2] x86/cpu/intel: Clear cache self-snoop
 capability in CPUs with known errata
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

RnJvbTogUmljYXJkbyBOZXJpIDxyaWNhcmRvLm5lcmktY2FsZGVyb25AbGludXguaW50ZWwuY29t
Pg0KDQpQcm9jZXNzb3JzIHdoaWNoIGhhdmUgc2VsZi1zbm9vcGluZyBjYXBhYmlsaXR5IGNhbiBo
YW5kbGUgY29uZmxpY3RpbmcNCm1lbW9yeSB0eXBlIGFjcm9zcyBDUFVzIGJ5IHNub29waW5nIGl0
cyBvd24gY2FjaGUuIEhvd2V2ZXIsIHRoZXJlIGV4aXN0cw0KQ1BVIG1vZGVscyBpbiB3aGljaCBo
YXZpbmcgY29uZmxpY3RpbmcgbWVtb3J5IHR5cGVzIHN0aWxsIGxlYWRzIHRvDQp1bnByZWRpY3Rh
YmxlIGJlaGF2aW9yLCBtYWNoaW5lIGNoZWNrIGVycm9ycywgb3IgaGFuZ3MuDQoNCkNsZWFyIHRo
aXMgZmVhdHVyZSBvbiBhZmZlY3RlZCBDUFVzIHRvIHByZXZlbnQgaXRzIHVzZS4NCg0KU3VnZ2Vz
dGVkLWJ5OiBBbGFuIENveCA8YWxhbi5jb3hAaW50ZWwuY29tPg0KU2lnbmVkLW9mZi1ieTogUmlj
YXJkbyBOZXJpIDxyaWNhcmRvLm5lcmktY2FsZGVyb25AbGludXguaW50ZWwuY29tPg0KW0xpbnV4
IGNvbW1pdCAxZTAzYmZmMzYwMDEwMWJkOTE1OGQwMDVlNDMxMzEzMmU1NWJkZWM4XQ0KDQpTdHJp
cCBZb25haCAtIGFzIHBlciBhcmsuaW50ZWwuY29tIGl0IGRvZXNuJ3QgbG9vayB0byBiZSA2NC1i
aXQgY2FwYWJsZS4NCkNhbGwgdGhlIG5ldyBmdW5jdGlvbiBvbiB0aGUgYm9vdCBDUFUgb25seS4g
RG9uJ3QgY2xlYXIgdGhlIENQVSBmZWF0dXJlDQpmbGFnIGl0c2VsZiwgYXMgaXQgaXMgZXhwb3Nl
ZCB0byBndWVzdHMgKHdobyBjb3VsZCBvdGhlcndpc2Ugb2JzZXJ2ZSBpdA0KZGlzYXBwZWFyIGFm
dGVyIG1pZ3JhdGlvbikuDQoNClJlcXVlc3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4NClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4NCi0tLQ0KdjI6IEludHJvZHVjZSBhbmQgdXNlIFhFTl9TRUxGU05PT1AuDQotLS0N
Ck5COiBUaGUgZnVuY3Rpb24gbmFtZSBpc24ndCBmdWxseSBhcHByb3ByaWF0ZSBhbnltb3JlLCBi
dXQgSSdkIHByZWZlciB0bw0KICAgICBrZWVwIExpbnV4J2VzIG5hbWUgdG8gYWxsb3cgbWF0Y2hp
bmcgdGhlIHR3byBjaGFuZ2VzLg0KDQotLS0gYS94ZW4vYXJjaC94ODYvY3B1L2ludGVsLmMNCisr
KyBiL3hlbi9hcmNoL3g4Ni9jcHUvaW50ZWwuYw0KQEAgLTE1LDYgKzE1LDM2IEBADQogICNpbmNs
dWRlICJjcHUuaCINCiAgDQogIC8qDQorICogUHJvY2Vzc29ycyB3aGljaCBoYXZlIHNlbGYtc25v
b3BpbmcgY2FwYWJpbGl0eSBjYW4gaGFuZGxlIGNvbmZsaWN0aW5nDQorICogbWVtb3J5IHR5cGUg
YWNyb3NzIENQVXMgYnkgc25vb3BpbmcgaXRzIG93biBjYWNoZS4gSG93ZXZlciwgdGhlcmUgZXhp
c3RzDQorICogQ1BVIG1vZGVscyBpbiB3aGljaCBoYXZpbmcgY29uZmxpY3RpbmcgbWVtb3J5IHR5
cGVzIHN0aWxsIGxlYWRzIHRvDQorICogdW5wcmVkaWN0YWJsZSBiZWhhdmlvciwgbWFjaGluZSBj
aGVjayBlcnJvcnMsIG9yIGhhbmdzLiBDbGVhciB0aGlzDQorICogZmVhdHVyZSB0byBwcmV2ZW50
IGl0cyB1c2Ugb24gbWFjaGluZXMgd2l0aCBrbm93biBlcnJhdGFzLg0KKyAqLw0KK3N0YXRpYyB2
b2lkIF9faW5pdCBjaGVja19tZW1vcnlfdHlwZV9zZWxmX3Nub29wX2VycmF0YSh2b2lkKQ0KK3sN
CisJaWYgKCFib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfU1MpKQ0KKwkJcmV0dXJuOw0KKw0KKwlz
d2l0Y2ggKGJvb3RfY3B1X2RhdGEueDg2X21vZGVsKSB7DQorCWNhc2UgMHgwZjogLyogTWVyb20g
Ki8NCisJY2FzZSAweDE2OiAvKiBNZXJvbSBMICovDQorCWNhc2UgMHgxNzogLyogUGVucnluICov
DQorCWNhc2UgMHgxZDogLyogRHVubmluZ3RvbiAqLw0KKwljYXNlIDB4MWU6IC8qIE5laGFsZW0g
Ki8NCisJY2FzZSAweDFmOiAvKiBBdWJ1cm5kYWxlIC8gSGF2ZW5kYWxlICovDQorCWNhc2UgMHgx
YTogLyogTmVoYWxlbSBFUCAqLw0KKwljYXNlIDB4MmU6IC8qIE5laGFsZW0gRVggKi8NCisJY2Fz
ZSAweDI1OiAvKiBXZXN0bWVyZSAqLw0KKwljYXNlIDB4MmM6IC8qIFdlc3RtZXJlIEVQICovDQor
CWNhc2UgMHgyYTogLyogU2FuZHlCcmlkZ2UgKi8NCisJCXJldHVybjsNCisJfQ0KKw0KKwlzZXR1
cF9mb3JjZV9jcHVfY2FwKFg4Nl9GRUFUVVJFX1hFTl9TRUxGU05PT1ApOw0KK30NCisNCisvKg0K
ICAgKiBTZXQgY2FwcyBpbiBleHBlY3RlZF9sZXZlbGxpbmdfY2FwLCBwcm9iZSBhIHNwZWNpZmlj
IG1hc2tpbmcgTVNSLCBhbmQgc2V0DQogICAqIGNhcHMgaW4gbGV2ZWxsaW5nX2NhcHMgaWYgaXQg
aXMgZm91bmQsIG9yIGNsb2JiZXIgdGhlIE1TUiBpbmRleCBpZiBtaXNzaW5nLg0KICAgKiBJZiBw
cmVzZXQsIHJlYWRzIHRoZSBkZWZhdWx0IHZhbHVlIGludG8gbXNyX3ZhbC4NCkBAIC0yNTYsOCAr
Mjg2LDExIEBAIHN0YXRpYyB2b2lkIGVhcmx5X2luaXRfaW50ZWwoc3RydWN0IGNwdWkNCiAgCSAg
ICAoYm9vdF9jcHVfZGF0YS54ODZfbWFzayA9PSAzIHx8IGJvb3RfY3B1X2RhdGEueDg2X21hc2sg
PT0gNCkpDQogIAkJcGFkZHJfYml0cyA9IDM2Ow0KICANCi0JaWYgKGMgPT0gJmJvb3RfY3B1X2Rh
dGEpDQorCWlmIChjID09ICZib290X2NwdV9kYXRhKSB7DQorCQljaGVja19tZW1vcnlfdHlwZV9z
ZWxmX3Nub29wX2VycmF0YSgpOw0KKw0KICAJCWludGVsX2luaXRfbGV2ZWxsaW5nKCk7DQorCX0N
CiAgDQogIAljdHh0X3N3aXRjaF9sZXZlbGxpbmcoTlVMTCk7DQogIH0NCi0tLSBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvY3B1ZmVhdHVyZXMuaA0KKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9jcHVm
ZWF0dXJlcy5oDQpAQCAtMzAsNiArMzAsNyBAQCBYRU5fQ1BVRkVBVFVSRShTQ19NU1JfUFYsICAg
ICAgIChGU0NBUElODQogIFhFTl9DUFVGRUFUVVJFKFNDX01TUl9IVk0sICAgICAgKEZTQ0FQSU5U
UyswKSozMisxNykgLyogTVNSX1NQRUNfQ1RSTCB1c2VkIGJ5IFhlbiBmb3IgSFZNICovDQogIFhF
Tl9DUFVGRUFUVVJFKFNDX1JTQl9QViwgICAgICAgKEZTQ0FQSU5UUyswKSozMisxOCkgLyogUlNC
IG92ZXJ3cml0ZSBuZWVkZWQgZm9yIFBWICovDQogIFhFTl9DUFVGRUFUVVJFKFNDX1JTQl9IVk0s
ICAgICAgKEZTQ0FQSU5UUyswKSozMisxOSkgLyogUlNCIG92ZXJ3cml0ZSBuZWVkZWQgZm9yIEhW
TSAqLw0KK1hFTl9DUFVGRUFUVVJFKFhFTl9TRUxGU05PT1AsICAgKEZTQ0FQSU5UUyswKSozMisy
MCkgLyogU0VMRlNOT09QIGdldHMgdXNlZCBieSBYZW4gaXRzZWxmICovDQogIFhFTl9DUFVGRUFU
VVJFKFNDX01TUl9JRExFLCAgICAgKEZTQ0FQSU5UUyswKSozMisyMSkgLyogKFNDX01TUl9QViB8
fCBTQ19NU1JfSFZNKSAmJiBkZWZhdWx0X3hlbl9zcGVjX2N0cmwgKi8NCiAgWEVOX0NQVUZFQVRV
UkUoWEVOX0xCUiwgICAgICAgICAoRlNDQVBJTlRTKzApKjMyKzIyKSAvKiBYZW4gdXNlcyBNU1Jf
REVCVUdDVEwuTEJSICovDQogIFhFTl9DUFVGRUFUVVJFKFNDX1ZFUldfUFYsICAgICAgKEZTQ0FQ
SU5UUyswKSozMisyMykgLyogVkVSVyB1c2VkIGJ5IFhlbiBmb3IgUFYgKi8NCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
