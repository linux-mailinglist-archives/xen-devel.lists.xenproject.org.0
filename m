Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1F574B90
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 12:28:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqavC-0000xx-Dz; Thu, 25 Jul 2019 10:24:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqavA-0000xs-8W
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 10:24:24 +0000
X-Inumbo-ID: 5da18e02-aec6-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5da18e02-aec6-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 10:24:22 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 10:24:21 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 10:22:18 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 10:22:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHuyBqf2LxpOiHb36EfzsgumYexrO5A5lQGRAECZZE1Zyb4Bxkzhy+lWCCwbiV+gCkaJ8TD9xJvWO29QN60mdAskZwKsabwDJ8RMqtAs2HQRFOTIlfdyOvQtUG7W+iXqDrghJFIYfb09iOyTGRZy4GB7Hd+t81aoBBV6g1HtlLxodP15kvu0dNvRyNR2q8PnI5b5ULF1vKQe0QTXdlxO74JfW9BIJP5s+UTAG9y97485gA1kBuExrn+9VdSK5g8q8fSMhWKKeIDiD3EVOTyjDPJFPikq9SDrOKfpNFnorw6IHe3GRawOSucLbG3YKM8dWZOfM24JZSIaQTIhI7MUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrn1fN/uixDX5g+Vokpt36zTRs8X8mNHVVtkbz75oGg=;
 b=i3wuJhYN5UfOdrIf9afJTlH7XkyGrEl00nkX+Ca/st0USLcHNeig9i+iQyEUH4Z/Gnz+CkftI1LtR2Z4JzZarfvSKx/TCH478MKro5vEixWIxegeGXSfg9DOi0xNvghapnkylKbYsmxWm7Jl6X3YORNxAb7FiCmrCOCjQrc/d3xa6GqAJvdO/djjAfhHKGVtoK6qYUCrd/8YabK59Qz0C3VzCQS9BcI0dOPw1FArDOpU8vhYiPfl6EBg0SNDROnLiMFuWWlfPp//mZ8Xr4NQvQnLtLmmmLnfZqqB3FU2sP+Njz71o/O1UrVpeLeZgvV2uUbM6oWZbx+P7KXUa5e08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2780.namprd18.prod.outlook.com (20.179.49.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 10:22:17 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 10:22:17 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 1/2] x86/iommu: avoid mapping the interrupt address range
 for hwdom
Thread-Index: AQHVQW4v+Mw2bodxPUiy9HdTXv5ycabbIsgA
Date: Thu, 25 Jul 2019 10:22:17 +0000
Message-ID: <502a2fd8-5a03-0921-bf5f-bb88feae35c1@suse.com>
References: <20190723154851.77627-1-roger.pau@citrix.com>
 <20190723154851.77627-2-roger.pau@citrix.com>
In-Reply-To: <20190723154851.77627-2-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0148.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::16) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc35d2fb-ceff-4e90-d2cb-08d710e9f80b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2780; 
x-ms-traffictypediagnostic: DM6PR18MB2780:
x-microsoft-antispam-prvs: <DM6PR18MB27808BFCE930BC99781C63EEB3C10@DM6PR18MB2780.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(189003)(199004)(52314003)(2906002)(6436002)(53936002)(386003)(6506007)(64756008)(86362001)(478600001)(6512007)(229853002)(4326008)(80792005)(14454004)(7736002)(6246003)(31696002)(25786009)(66066001)(102836004)(53546011)(66476007)(66556008)(66446008)(66946007)(5660300002)(26005)(6486002)(446003)(186003)(36756003)(4744005)(99286004)(76176011)(52116002)(6116002)(305945005)(110136005)(14444005)(31686004)(316002)(3846002)(81166006)(8936002)(81156014)(8676002)(68736007)(11346002)(486006)(2616005)(256004)(71190400001)(71200400001)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2780;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VTc0QoVLNM04pbS3wJm+9u06EYaE339mxXlsS7OzSDIHQ5F4Bg+s+fqFL+mYBOMeWvSLhaqWtOUYXDwbQGk3PU+tYf65CzuixnUHuX+snCvxeXHu7T5aswH5CGu/WGRMD/LZGlUc9Ddfrivy35H18J2a9SdkobQuHzKJTSrZgbN5yeBxDtFBKlJLyu0GG5xeiYDNsoNNtgCFSIxGUbirtml6oYEqMxURJoKSenx1X09i2q0HrnR4Ai+6yNGZuvPvqpf969+D+VBP0bxSsjcZdDrAmSrD3KhDUWtHJTnq7lvmkYQU8UPjI7edB45cDoEm7XFJDhecyomSvZyCRhb3hgUaZaywKAseZSETCwVhgpVAEKYJBE0Amc1c3p3yD7aLf+Q4hYyx4U6MVqXemyqs7Y7s/rSA2XXtfH3qbeSD7+4=
Content-ID: <8039FF09EF299641BB8F6CCF578F4ACA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cc35d2fb-ceff-4e90-d2cb-08d710e9f80b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 10:22:17.5260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2780
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAxNzo0OCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBDdXJyZW50IGNv
ZGUgb25seSBwcmV2ZW50IG1hcHBpbmcgdGhlIGxhcGljIHBhZ2UgaW50byB0aGUgZ3Vlc3QNCj4g
cGh5c2ljYWwgbWVtb3J5IG1hcC4gRXhwYW5kIHRoZSByYW5nZSB0byBiZSAweEZFRXhfeHh4eCBh
cyBkZXNjcmliZWQNCj4gaW4gdGhlIEludGVsIFZUZCBzcGVjaWZpY2F0aW9uIHNlY3Rpb24gMy4x
MyAiSGFuZGxpbmcgUmVxdWVzdHMgdG8NCj4gSW50ZXJydXB0IEFkZHJlc3MgUmFuZ2UiLg0KPiAN
Cj4gQU1EIGFsc28gbGlzdHMgdGhpcyBhZGRyZXNzIHJhbmdlIGluIHRoZSBBTUQgU1I1NjkwIERh
dGFib29rLCBzZWN0aW9uDQo+IDIuNC40ICJNU0kgSW50ZXJydXB0IEhhbmRsaW5nIGFuZCBNU0kg
dG8gSFQgSW50ZXJydXB0IENvbnZlcnNpb24iLg0KPiANCj4gUmVxdWVzdGVkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCg0KSSd2ZSBjb21taXR0ZWQgdGhp
cyBvbiB0aGUgYmFzaXMgdGhhdCBpdCBzaG91bGRuJ3QgaHVydCwgYnV0IGhhdmluZw0KdGhvdWdo
dCBhYm91dCB0aGlzIHNvbWUgbW9yZSBJJ20gbm90IHJlYWxseSBzdXJlIEkgc2VlIHRoZSBwb2lu
dDoNClRoZSBJT01NVSBzcGVjaWFsIGNhc2VzIGFjY2Vzc2VzIGludG8gdGhpcyByYW5nZSBhbnl3
YXksIHRvIHJlZGlyZWN0DQpsb29rdXAgdG8gdGhlIGludGVycnVwdCByZW1hcHBpbmcgdGFibGUg
aW5zdGVhZCBvZiB0aGUgRE1BIHJlbWFwcGluZw0Kb25lLiBIZW5jZSBhbnkgbWFwcGluZ3MgaW5z
ZXJ0ZWQgaW50byB0aGlzIHJhbmdlIGFyZSBzaW1wbHkgdXNlbGVzcywNCmJ1dCBzaG91bGRuJ3Qg
b3RoZXJ3aXNlIGh1cnQuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
