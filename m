Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D506A674
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 12:26:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnKdT-0007X3-VK; Tue, 16 Jul 2019 10:24:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnKdS-0007Wy-HC
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 10:24:38 +0000
X-Inumbo-ID: e4a39b7c-a7b3-11e9-8e6c-5fbe23588c8d
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4a39b7c-a7b3-11e9-8e6c-5fbe23588c8d;
 Tue, 16 Jul 2019 10:24:33 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 10:24:32 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 10:20:12 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 10:20:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoLcVMkO8HsgcsBCnVSRQZx9pT3S4z7mulGqHJUxqj/O1S5FDUlvvevEnxpDHw1fYmGrnz47Xxp/3c2Uz3f/9F4pwzBGgnBUDq0Fi3j+XiX99j68bt3fTA7aVq13iJxkiLE78CUGa/2vyh3GXfuqWMVKq7Xz7AIHzMhtznGh28sIGB6lOAL881G5aW4OPKyOiu7/zo74TG2FIr/WdQuywWOR3uUSDMe8G367PrFe1m/x52s7MwIwuyWPdgS1dEkDKsekeDXAAMgLQeeGE4iu7o34+2mN8AQDU3J/9JU9vZuPsAQ2xCLv8ZHSh9CyA2/v9AD//5A8Fe8FyQ0w6Ti8bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrKGSeOMBO1ZuKim6vn2ns4nAPPBUJrNb6IriPm4+PY=;
 b=hPp58Qt1+YMiVgwbgp9qykse7pfu40lofVK6e82XG9D7SChVRHBAV8Ii+SmY4OCvQcahOpCKAKTPuAfQ16fRqVQvRCYVYu6A4es+C8qkTMe+Of4U7Dn9aSoECtDTRCysrkYhTNkicw4FmLyF/VhG+69+VcdYEQF6jz/neUWGihGVT3kwsbbNKiVsYJBeFRMc2hf61YyZ28czHaxL7ldabBW6K/3jeXl3C2ox44StJQmPrK2Ei35rPMyW5WLn14wrQwWZNwKtmq0836HOy/WMhrjZlU3VOZ0YAT7fB/oIGHWDouZc0bwnysamZ7Ejf0gqsrlgvRoAzvZtSHnYBET4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2777.namprd18.prod.outlook.com (20.179.49.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 10:20:11 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 10:20:11 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH v4 06/13] x86/IOMMU: don't restrict IRQ affinities to
 online CPUs
Thread-Index: AQHVO6nO1yIoPbw3sE+gj0c0leZLnabM9hDhgAASrIA=
Date: Tue, 16 Jul 2019 10:20:10 +0000
Message-ID: <a6ff2c4a-de0b-f83c-cb6d-5bbbb92d46e9@suse.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
 <923083ba-66f9-a88b-8909-a2f5e2808a69@suse.com>
 <20190716091237.fjjhhppndquy3cvx@Air-de-Roger.citrite.net>
In-Reply-To: <20190716091237.fjjhhppndquy3cvx@Air-de-Roger.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0007.eurprd05.prod.outlook.com
 (2603:10a6:4:8f::17) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d033300d-95ad-473e-fc9c-08d709d72eef
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2777; 
x-ms-traffictypediagnostic: DM6PR18MB2777:
x-microsoft-antispam-prvs: <DM6PR18MB27779046436903D3639178DAB3CE0@DM6PR18MB2777.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(199004)(189003)(71190400001)(71200400001)(3846002)(6116002)(6246003)(6512007)(53936002)(66446008)(31696002)(186003)(2906002)(26005)(36756003)(446003)(476003)(2616005)(25786009)(11346002)(66556008)(86362001)(66946007)(64756008)(386003)(53546011)(6506007)(76176011)(102836004)(66476007)(52116002)(68736007)(305945005)(8936002)(316002)(81156014)(81166006)(54906003)(6436002)(31686004)(6486002)(99286004)(256004)(14444005)(5024004)(4326008)(6916009)(14454004)(7736002)(80792005)(229853002)(486006)(478600001)(8676002)(66066001)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2777;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BFGbfECArkr0cwBIOcGExDZC5NF3dseubKmGgMtFhmG77vYsO16nzdyKe95YaxiXBiQv3LlHGKDihO96bL2bUcUYGhjM5NC6oDi8Inu0JhxSqpNnXHNHr8NTQel1w/0CRmXvvtS+BwALGJtR6cXZ22mutbVNKCt3jtOgu3r2XtT7Ric4xL705gxCwhloiUarVBEwQXz5lhapTi2TdFAtRQZLv6vyulex1CnAXZU2+5Bv9BE0f4YufVxwezUbAhYu9C2rad9rUx6j+ATLW1VXdz4+zCEH9GK414ljqKAgJE/V/4MnWORZ21+l9y0XXXVM1OsA68PymT3dj+M9Kajid+t+tacQL7PXJtSy+dGRXLeO2H+APZAfID7Ssc/i+v3GcCDklqCT2q0QlhYR9Z5m5s7LRicv3kTdlCDo2wnN6Oc=
Content-ID: <F6CE167009FA7B499463AE41E4666D6E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d033300d-95ad-473e-fc9c-08d709d72eef
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 10:20:10.7532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2777
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v4 06/13] x86/IOMMU: don't restrict IRQ
 affinities to online CPUs
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxMToxMiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFR1ZSwg
SnVsIDE2LCAyMDE5IGF0IDA3OjQwOjU3QU0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
SW4gbGluZSB3aXRoICJ4ODYvSVJROiBkZXNjLT5hZmZpbml0eSBzaG91bGQgc3RyaWN0bHkgcmVw
cmVzZW50IHRoZQ0KPj4gcmVxdWVzdGVkIHZhbHVlIiB0aGUgaW50ZXJuYWxseSB1c2VkIElSUShz
KSBhbHNvIHNob3VsZG4ndCBiZSByZXN0cmljdGVkDQo+PiB0byBvbmxpbmUgb25lcy4gTWFrZSBz
ZXRfZGVzY19hZmZpbml0eSgpIChzZXRfbXNpX2FmZmluaXR5KCkgdGhlbiBkb2VzDQo+PiBieSBp
bXBsaWNhdGlvbikgY29wZSB3aXRoIGEgTlVMTCBtYXNrIGJlaW5nIHBhc3NlZCAoanVzdCBsaWtl
DQo+PiBhc3NpZ25faXJxX3ZlY3RvcigpIGRvZXMpLCBhbmQgaGF2ZSBJT01NVSBjb2RlIHBhc3Mg
TlVMTCBpbnN0ZWFkIG9mDQo+PiAmY3B1X29ubGluZV9tYXAgKHdoZW4sIGZvciBWVC1kLCB0aGVy
ZSdzIG5vIE5VTUEgbm9kZSBpbmZvcm1hdGlvbg0KPj4gYXZhaWxhYmxlKS4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IA0KPiBMR1RNLCBq
dXN0IG9uZSBwYXRjaCBzdHlsZSBjb21tZW50IGFuZCBvbmUgY29kZSBjb21tZW50Og0KPiANCj4g
UmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpU
aGFua3MuDQoNCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYw0KPj4gKysrIGIveGVuL2FyY2gv
eDg2L2lycS5jDQo+PiBAQCAtNzk2LDE4ICs3OTYsMjYgQEAgdW5zaWduZWQgaW50IHNldF9kZXNj
X2FmZmluaXR5KHN0cnVjdCBpcg0KPj4gICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+PiAg
ICAgICAgY3B1bWFza190IGRlc3RfbWFzazsNCj4+ICAgIA0KPj4gLSAgICBpZiAoIWNwdW1hc2tf
aW50ZXJzZWN0cyhtYXNrLCAmY3B1X29ubGluZV9tYXApKQ0KPj4gKyAgICBpZiAoIG1hc2sgJiYg
IWNwdW1hc2tfaW50ZXJzZWN0cyhtYXNrLCAmY3B1X29ubGluZV9tYXApICkNCj4+ICAgICAgICAg
ICAgcmV0dXJuIEJBRF9BUElDSUQ7DQo+PiAgICANCj4+ICAgICAgICBzcGluX2xvY2tfaXJxc2F2
ZSgmdmVjdG9yX2xvY2ssIGZsYWdzKTsNCj4+IC0gICAgcmV0ID0gX2Fzc2lnbl9pcnFfdmVjdG9y
KGRlc2MsIG1hc2spOw0KPj4gKyAgICByZXQgPSBfYXNzaWduX2lycV92ZWN0b3IoZGVzYywgbWFz
ayA/OiBUQVJHRVRfQ1BVUyk7DQo+PiAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmdmVj
dG9yX2xvY2ssIGZsYWdzKTsNCj4gDQo+IEkgdGhpbmsgdGhlIHBhdGNoIGlzIHNvbWVob3cgbWFu
Z2xlZCBhdCBsZWFzdCBvbiBteSBlbmQsIHRoZXJlJ3Mgb25lDQo+IHByZXBlbmRlZCBleHRyYSBz
cGFjZSBpbiB0aGUgbm9uLW1vZGlmaWVkIGxpbmVzIEFGQUlDVC4NCg0KV2VsbCwgeWVzLCBoZW5j
ZSB0aGUgbGFzdCBzZW50ZW5jZSBpbiB0aGUgY292ZXIgbGV0dGVyIGFuZCB0aGUgYXR0YWNoZWQN
CnBhdGNoZXMgdGhlcmUuIEl0IGlzIHRoZSBtYWlsIHN5c3RlbSAobW9yZSBsaWtlbHkgc2VydmVy
IHRoYW4gY2xpZW50KQ0Kb3ZlciBoZXJlIHdoaWNoIGNhdXNlcyB0aGlzIGlzc3VlIChldmVyeXdo
ZXJlIGZvciBtZSkuDQoNCj4+ICAgIA0KPj4gLSAgICBpZiAocmV0IDwgMCkNCj4+ICsgICAgaWYg
KCByZXQgPCAwICkNCj4+ICAgICAgICAgICAgcmV0dXJuIEJBRF9BUElDSUQ7DQo+PiAgICANCj4+
IC0gICAgY3B1bWFza19jb3B5KGRlc2MtPmFmZmluaXR5LCBtYXNrKTsNCj4gDQo+IEFGQUlDVCB5
b3UgY291bGQgYWxzbyBhdm9pZCB0aGUgaWYgYW5kIGp1c3QgZG8gdGhlIHNhbWUgYXMgaW4gdGhl
DQo+IGFzc2lnbl9pcnFfdmVjdG9yIGNhbGwgYWJvdmUgYW5kIHBhc3MgVEFSR0VUX0NQVVMgaWYg
bWFzayBpcyBOVUxMPw0KDQpBcmUgeW91IHRhbGtpbmcgYWJvdXQgdGhlIGlmKCkgaW4gY29udGV4
dCBhYm92ZSwgb3IgdGhlIG9uZSB5b3UndmUNCnN0cmlwcGVkIChpbW1lZGlhdGVseSBmb2xsb3dp
bmcgdGhlIGxhc3QgcXVvdGVkIGxpbmUgb2YgdGhlIHBhdGNoKT8NCkZvciB0aGUgb25lIGluIGNv
bnRleHQgSSBkb24ndCBzZWUgaG93IHRoZSByZXN0IG9mIHlvdXIgcmVtYXJrIGlzDQpyZWxhdGVk
LiBGb3IgdGhlIG90aGVyIG9uZSAtIG5vLCBzdHJpY3RseSBub3QsIGFzIHRoYXQgd291bGQgYmUN
CmFnYWluc3QgdGhlIHB1cnBvc2Ugb2YgdGhpcyBjaGFuZ2U6IFdlIHNwZWNpZmljYWxseSB3YW50
IHRvIF9ub3RfDQpyZXN0cmljdCBkZXNjLT5hZmZpbml0eSB0byBvbmxpbmUgQ1BVcyBvbmx5ICh5
ZXQgdGhhdCdzIHdoYXQNClRBUkdFVF9DUFVTIHJlc29sdmVzIHRvKS4NCg0KSmFuDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
