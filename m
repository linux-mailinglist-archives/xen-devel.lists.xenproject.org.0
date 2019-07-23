Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E972A71CA2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 18:15:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpxPm-0002qK-0X; Tue, 23 Jul 2019 16:13:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpxPk-0002qF-Hy
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 16:13:20 +0000
X-Inumbo-ID: c80711c2-ad64-11e9-9955-570e779e0252
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c80711c2-ad64-11e9-9955-570e779e0252;
 Tue, 23 Jul 2019 16:13:18 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 16:13:08 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 16:06:44 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 16:06:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRBUr8YpFr42J6AmIskOStVlZbEjsDIVBDedYupDMO5d946k0HO69hQHo4j1Ta9FtQtHq9L9VTrpH80b4Cl6adaUPJLs+9oHL4PriwDjzU8BOYp15Wq5I/7dgvEhBclX5OIhU1EpXdqTgpVVx46MoDoF0hsp6bdY4H2Nk197j3Um1ElUQXfwZr8BlqymWOvtXsB2hm8KIfM54oxa4e04SEO06NByXwdvynB5f6Oh+444WHXmSdbZMUhPWe8e7XallOubPif8xLcYPkBZwcYt9dlKR43aTfz66zux6C5b/QnVVzJFzL6lA60n40fOO1WAvtfhX2VLl775A5kTJcURdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtyIpav2AWNHRzvHJ9+ZChhP7g9azS0ShlsSa1SXAYo=;
 b=k4rf3c3+ImpfWY6ac3Ni2IEOavcxWCP7o7nnte3HvEjRzYen6RfAplacZyMM+rncCk0vU1hkNGQzcpM0AbdZV6pKS+eQ3FlyoM7shCAylEsKwQsBg2Z2+bZrxmThmWBvwY1Nz+WgXRX3J8Z0nE3VKX4rAEUaqHvxQF9krhFgZy4pVOdpJQosYO1L0G4UaecHotgVjzQxyMOKXeywNp9vzYQt0OxGiIo9Zcf4ODs24b0RtVeAdlgv+qmnyz1AC/P3OQ69VrZJrnpa9OSfkG+G6n0g7DECchqS5gVeAD+P/8Wu3if7UOcKr6SflN/PA/LzKu6FizldfpzX8Epcnlyctw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3147.namprd18.prod.outlook.com (10.255.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 16:06:41 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 16:06:41 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH 1/2] x86/iommu: avoid mapping the interrupt address range
 for hwdom
Thread-Index: AQHVQW4v+Mw2bodxPUiy9HdTXv5ycabYXlgA
Date: Tue, 23 Jul 2019 16:06:41 +0000
Message-ID: <d3347e1c-92c0-bcea-19c5-9425490686f9@suse.com>
References: <20190723154851.77627-1-roger.pau@citrix.com>
 <20190723154851.77627-2-roger.pau@citrix.com>
In-Reply-To: <20190723154851.77627-2-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::23) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a280ed3-f36f-4617-e16d-08d70f87bfd5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3147; 
x-ms-traffictypediagnostic: DM6PR18MB3147:
x-microsoft-antispam-prvs: <DM6PR18MB31478C8FBDF2D44F81378CC3B3C70@DM6PR18MB3147.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(189003)(199004)(66556008)(4744005)(66446008)(66946007)(64756008)(66476007)(31686004)(53936002)(71190400001)(66066001)(6246003)(229853002)(6512007)(71200400001)(52116002)(99286004)(6486002)(316002)(86362001)(2906002)(6436002)(25786009)(36756003)(81166006)(31696002)(6916009)(6506007)(305945005)(7736002)(386003)(8936002)(8676002)(102836004)(486006)(81156014)(76176011)(14454004)(53546011)(11346002)(54906003)(68736007)(476003)(186003)(5660300002)(4326008)(80792005)(478600001)(6116002)(14444005)(26005)(446003)(2616005)(256004)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3147;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GGDQA4SYgcZM2Yanfsrln9ObUk58+2McIZr271fN8RagPjchMxIPvRjnjFDBzFF0fH57fXT6HWxwtVLTSaXaHcXTHEX+aobQbn0e9hljMTsjiYoZW8mn7kAXwYv4ATVAq6BFZmfsZoBrvvmdT+amawMNbvl82FdKoxOxvQMhqckVN/BuGsDYMbqiL0qjLx2JFsmpHrB2mbfUpNAliadpn0LL8ZcptpVjOrzlEJLbYgZA14kBd2PZioYv0EkunNARQ2kZoO0ll9lnKQZkVFDoX7XGJBqnb3ATAJH7vhNyUtBcSXKuJ/35v6hfCMfJjgHHNoriHB+uaUWVecIEVtrh6+6b1Qhkye1JlpUX3FmE0q9wJY+fqJv6qTNDzhqxl2zANj485O6Sdnj6X5h1LBxagFmoRE4Pg7BbcyBIIO1pfCs=
Content-ID: <2ADF03161F5F944D9A66942F454B3692@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a280ed3-f36f-4617-e16d-08d70f87bfd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 16:06:41.1610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3147
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/2] x86/iommu: avoid mapping the interrupt
 address range for hwdom
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAxNzo0OCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBDdXJyZW50IGNv
ZGUgb25seSBwcmV2ZW50IG1hcHBpbmcgdGhlIGxhcGljIHBhZ2UgaW50byB0aGUgZ3Vlc3QNCj4g
cGh5c2ljYWwgbWVtb3J5IG1hcC4gRXhwYW5kIHRoZSByYW5nZSB0byBiZSAweEZFRXhfeHh4eCBh
cyBkZXNjcmliZWQNCj4gaW4gdGhlIEludGVsIFZUZCBzcGVjaWZpY2F0aW9uIHNlY3Rpb24gMy4x
MyAiSGFuZGxpbmcgUmVxdWVzdHMgdG8NCj4gSW50ZXJydXB0IEFkZHJlc3MgUmFuZ2UiLg0KDQpS
aWdodCwgYW5kIGl0IGJlaW5nIGRldmljZSBzaWRlIGFjY2Vzc2VzIHRoYXQgYXJlIG9mIGludGVy
ZXN0IGhlcmUsDQp0aGUgTEFQSUMgYWRkcmVzcyByYW5nZSAodmlzaWJsZSB0byB0aGUgQ1BVIG9u
bHkpIHNob3VsZG4ndCBldmVuDQptYXR0ZXIuIEhlbmNlIGFmdGVyIHNvbWUgYmFjayBhbmQgZm9y
dGggd2l0aCBteXNlbGYgSSBhZ3JlZSB0aGF0DQp5b3UgcmVtb3ZlIHRoZSBlbnRpcmUgY29tbWVu
dCB0aGVyZS4NCg0KPiBBTUQgYWxzbyBsaXN0cyB0aGlzIGFkZHJlc3MgcmFuZ2UgaW4gdGhlIEFN
RCBTUjU2OTAgRGF0YWJvb2ssIHNlY3Rpb24NCj4gMi40LjQgIk1TSSBJbnRlcnJ1cHQgSGFuZGxp
bmcgYW5kIE1TSSB0byBIVCBJbnRlcnJ1cHQgQ29udmVyc2lvbiIuDQoNCldoaWNoIHJhaXNlcyB0
aGUgcXVlc3Rpb24gYWJvdXQgeWV0IGFub3RoZXIgcGF0Y2ggdG8gYWxzbyBleGNsdWRlDQp0aGUg
SFQgcmFuZ2UuDQoNCj4gUmVxdWVzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
