Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B66816CDB1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 13:54:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho4xL-0000kE-1K; Thu, 18 Jul 2019 11:52:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho4xJ-0000k9-LT
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 11:52:13 +0000
X-Inumbo-ID: 77ac955a-a952-11e9-9a00-ef4f1aca5f8f
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77ac955a-a952-11e9-9a00-ef4f1aca5f8f;
 Thu, 18 Jul 2019 11:52:09 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 11:52:05 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 11:51:58 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 11:51:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fk9I8KQL7RrQalF/r6Dt/2vkQlT03RhKAqhgyL23zHKeJpv0WJWWu1RP3MEYChk9QQGqcgpBk0jhzkJN+Kl2OQsyGU2sodFIEnVAcyS4Y1QNSct6PBZnLMv315xbxcyICP7Zo/VegK164bk8e0zk7jIB+Gvs+TorRsN3jKN/4095cWNsDoto6DdYKlOBVmboroW+ZWlo0TBAGohVSBck15vAB8puC0rpfSkT+OXPhdkHS/vRkDirZ96Z6CBcbIiKuBIl6r1N1mUGBV4Tldfg9Y1wiLw15fPxANOEddKZHurn37icq7d+ShNohE+Y/UIf9BeA1qsSjF3ad1YXwHoEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZtW7WM3o/4jnxjuil1athiDR7DqqvNc0ea+qgSUOM4=;
 b=YLvBHnVnMFLrNUxr1GX2wX0SGPxVub5eRNiFlO/I+CFr+KnEUHAo0E8K8FQCNxdLX8YYXT2axWOvlKJg3l911M2dn6v/vFtHe6y4MY/rWUWduhmAQeIUxEHJPgij1C22WGvqXUSoyDyXtZfrByUNkqxNLlpa+fOuYkKhRBboF/MpMLxK3Mv3q4Q9G9pdkWy2A7w5w21RXn+YNH4Y/3gGUUXqwtsV34CVbzM3IYEYSCsXEiisSr3nkJTMXNR1J8u9JAf5Spj47V7VUn8UF0+w7omT5qF16qB1yOtZrhbI49vfJkeDFs+3JCHWLXQAVDnaY+Z7Zk9yfaYzQe72KrJcag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2988.namprd18.prod.outlook.com (20.179.48.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 11:51:57 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 11:51:57 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: printf formatter for pci_sbdf_t
Thread-Index: AQHVPKkbqe/gqkIsCkyMLC3anRUky6bPCrxPgAE6U4A=
Date: Thu, 18 Jul 2019 11:51:57 +0000
Message-ID: <a27a16f1-f8ca-e620-8e91-73c9b01a8968@suse.com>
References: <20190717140810.a5a4bhmm7fb6oah5@Air-de-Roger.citrite.net>
 <cf05039e-45e1-cc11-c7e3-c0953c74b83b@citrix.com>
In-Reply-To: <cf05039e-45e1-cc11-c7e3-c0953c74b83b@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0266.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::14) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70c7273f-0c6a-412f-fd49-08d70b7655f1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2988; 
x-ms-traffictypediagnostic: DM6PR18MB2988:
x-microsoft-antispam-prvs: <DM6PR18MB2988D279070ED679D60F7188B3C80@DM6PR18MB2988.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(189003)(199004)(2906002)(7736002)(256004)(8676002)(31686004)(186003)(8936002)(486006)(476003)(71200400001)(316002)(110136005)(66066001)(31696002)(6486002)(68736007)(36756003)(99286004)(86362001)(53546011)(305945005)(80792005)(66946007)(2616005)(478600001)(6436002)(386003)(25786009)(6506007)(76176011)(14454004)(53936002)(229853002)(52116002)(6512007)(6246003)(81156014)(3846002)(6116002)(26005)(81166006)(446003)(66446008)(64756008)(66476007)(71190400001)(66556008)(5660300002)(2501003)(102836004)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2988;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BTvGyhC9IW8z17xK5ptToJTSWanJewfoIU1sIvkWrj/boVbMnxFCu1HC+PMJ/vb7U2vC95Gi/t4J8vD7J3V6Z3f5cgBkFiuLw7BPJkrVgXQNh6AmfoabulOwOFYV8KDzQX1/OVqfn1b7y51Qm/qUvN3KpXgGzQ0QwdBfBESm1koekh6syTUhXq1KYtJwjV+exYxB7AuR1gYJ9ILfOftYmc2qRLx8KnfvdThh7oK9C0fbtZkq8XjB6cz2U0IYsh5Y0lFk45PxgdzFC5K883OpnyFut2XRaZWU+acq0Nuc/lMYfy40sW488eluch2pf96dTQpqqpvd0p3vllG/g/3Rh3qzGClZXJMiROgu1Bvdf1ZkHUxZ46cQrbgLZ+GjX7AfJxP8juOaQQuXPZuacqEx5D2McPGsIvIf1Zr/IwDqF8g=
Content-ID: <2ED408CA8B8C074FA41352347D38DE3A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c7273f-0c6a-412f-fd49-08d70b7655f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 11:51:57.3142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2988
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] printf formatter for pci_sbdf_t
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMjAxOSAxOTowNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTcvMDcvMjAx
OSAxNTowOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IEFzIHBhcnQgb2Ygc29tZSBQQ0kg
cmVsYXRlZCBjbGVhbnVwIEknbSBkb2luZywgd2hpY2ggaW5jbHVkZXMNCj4+IGV4cGFuZGluZyB0
aGUgdXNhZ2Ugb2YgcGNpX3NiZGZfdCwgSSdtIGFsc28gcGxhbm5pbmcgdG8gYWRkIGEgY3VzdG9t
DQo+PiBwcmludGYgZm9ybWF0dGVyIGZvciBwY2lfc2JkZl90IFswXSwgc28gdGhhdCBhIFNCREYg
Y2FuIGJlIHByaW50ZWQNCj4+IHdpdGhvdXQgaGF2aW5nIHRvIHNwZWNpZnkgZm91ciBmb3JtYXR0
ZXJzIChhbmQgcGFzcyBmb3VyIHBhcmFtZXRlcnMpDQo+PiBlYWNoIHRpbWUgKCUwNHg6JTAyeDol
MDJ4LiV1KS4NCj4+DQo+PiBUaGVyZSdzIGJlZW4gc29tZSBkZWJhdGUgb24gdGhlIHByZXZpb3Vz
IHZlcnNpb24gYWJvdXQgd2hldGhlciB0aGUNCj4+IGZvcm1hdHRlciBzaG91bGQgYmUgJXBwIG9y
ICVvcCwgYW5kIEkgd291bGQgbGlrZSB0byBzZXR0bGUgb24gb25lIG9mDQo+PiB0aGVtIGJlZm9y
ZSBzZW5kaW5nIGEgbmV3IHZlcnNpb246DQo+IA0KPiBJIGFtIGZpcm1seSBvcHBvc2VkIHRvIG92
ZXJsb2FkaW5nICVvLg0KDQpBbmQgSSBhbSBmaXJtbHkgb2YgdGhlIG9waW5pb24gdGhhdCB1c2lu
ZyAlbyBmb3IgU0JERiBpcyB0aGUgbW9yZQ0KbmF0dXJhbCB0aGluZyB0byBkby4NCg0KPiBOb3Ro
aW5nIGFib3V0IFBDSSBjb29yZGluYXRlcyBoYXMgYW55dGhpbmcgdG8gZG8gd2l0aCBvY3RhbA0K
PiByZXByZXNlbnRhdGlvbjsgaXRzIG1vc3RseSBoZXguDQoNClRoZSBkb21haW4gYW5kIHZDUFUg
SURzIGFyZW4jdCBwb2ludGVyLWlzaCBlaXRoZXIsIGZvciBleGFtcGxlLg0KDQo+IEFuZCBmb3Ig
dGhlIHJlY29yZCwgSSdtIGZpcm1seSBvcHBvc2VkIHRvIG92ZXJsb2FkaW5nICVbeHVpZF0gYXMg
d2VsbC4NCg0KSSBhZ3JlZSB0aGF0IHdlIGRvbiN0IHdhbnQgdG8gb3ZlcmxvYWQgYW55IG9mIHRo
ZXNlLg0KDQo+ICVwIGlzIHRoZSBvbmx5IGZvcm1hdHRlciB3aGljaCBoYXMgbWFnaWMgb3Zlcmxv
YWRpbmcgc28gZmFyLCBhbmQNCj4gYXZvaWRpbmcgZ2FpbmluZyBhIHNlY29uZCB3b3VsZCBiZSBv
ZiBzdWJzdGFudGlhbCB2YWx1ZSB3aGVuIGl0IGNvbWVzIHRvDQo+IHJlYWRpbmcgdGhlIGNvZGUu
DQoNCkkgZG9uJ3QgYnV5IHRoaXMgYXJndW1lbnQuIFJlYWRhYmlsaXR5IG9mIHNvbWUgb2YgdGhl
IHByaW50aygpDQppbnZvY2F0aW9ucyBpbiBSb2dlcidzIHBhdGNoIHdhcyAoc2V2ZXJlbHkgaW1v
KSBoYW1wZXJlZCBieSB0aGUgbmVlZA0KdG8gdGFrZSBhZGRyZXNzZXMgb2YgdGhpbmdzIHRoYXQg
Y291bGQgYmUgZWFzaWx5IHBhc3NlZCBieSB2YWx1ZS4NCkdlbmVyYXRlZCBjb2RlIChzaXplKSBz
aG91bGQgYmUgdGFrZW4gaW50byBjb25zaWRlcmF0aW9uIGhlcmUgdG9vLA0KYXMgc2hvdWxkIGJl
IHRoZSAoc2xpZ2h0bHkpIGxhcmdlciBzdGFjayBjb25zdW1wdGlvbiB3aGVuIGdvaW5nIHRoZQ0K
JXBwIHJvdXRlLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
