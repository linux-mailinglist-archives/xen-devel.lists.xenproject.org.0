Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A55406E30F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 11:04:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoOlO-0004y6-G2; Fri, 19 Jul 2019 09:01:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoOlM-0004y1-SM
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 09:01:12 +0000
X-Inumbo-ID: b0caa7cb-aa03-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b0caa7cb-aa03-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 09:01:12 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 09:00:46 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 09:00:12 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 09:00:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZXUcHzDY8Gw+WwHJ+kATkTRqGnO3apuzsiULKeaj5W5keG3BnvuUdBV80YzmhsA/FudE6KamXdxxzAnG0kI44YD77gw8mm/Gs2xTx1j9FnlFcelf5Qkp6DJhoj6nXle18Spz8JiMRriPdov7ZFuewreiQ0Jm5DfKYtVdkZqb6PXd/mBLiInfm0Fo1+HA7EBf0hJ19VcV6xuQQpzkJX+jkibodldzlmTlccBDM43o2HpjqQScwpvW+CGfKNmlxVyZdYlMQCIoXoIC18CbmGqi6V73fjH+gpNQcubFpKyrSEy+Tl2CBYkKrsMn9xFbwZZOLOJ5dihcnlZ+ifSOSOlxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c17WKOHBWpNd5V4THty9keKLbJf6cdmzzAyNJhNWg9g=;
 b=U6DLB9Ogp+0OWShsmKv0r9aj1L9OXp5LoFvPoJLrRYl0Kh3Wd1FmsqBnUXJPzKBUJSb4XuweWzS7RLvQuxQDKvyJqaLc+21LW368fbq1WYm2pKezrLf1U+zYP2kGREv225mJzC4SFKJZNMMvNiQRGr30DCqrO+45ORHoSLvMa7YMO5shp+uvdYXoNZ2bZpWUg8No2C4AqEyjpXTSx4gAdf7oBss8V0sQCc+bnusRHMQV2b9DiCWLeAhLgezerbrvqTGz+voO5TvqyAHCYA40ItabsLEUVEcPSy1JfchPjtNmHv2jY9Rm2F6BFJG13cAwqTUoBLzHwbLpNUyd51OMyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3017.namprd18.prod.outlook.com (20.179.107.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 09:00:10 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 09:00:10 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [RFC] xen: Add .astylerc for automated style-formatting
Thread-Index: AQHVPXcqh/rpHqCfrE2r6qBBgy1Fu6bQeNoBgAADe8CAAAegOoAAG/bGgAEF3gA=
Date: Fri, 19 Jul 2019 09:00:10 +0000
Message-ID: <1406a6d0-90fb-ad20-443c-4f1bf719263c@suse.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawhnk+_ssU1xEzN6O+_JkH4jT2NguP30VRpkNKzc7xoKeXw@mail.gmail.com>
In-Reply-To: <CABfawhnk+_ssU1xEzN6O+_JkH4jT2NguP30VRpkNKzc7xoKeXw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0301CA0011.eurprd03.prod.outlook.com
 (2603:10a6:4:3e::21) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59d2980c-52ea-49b6-87b0-08d70c2780fd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3017; 
x-ms-traffictypediagnostic: DM6PR18MB3017:
x-microsoft-antispam-prvs: <DM6PR18MB30175ED493C4E0AA96BB6A67B3CB0@DM6PR18MB3017.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(189003)(199004)(14454004)(66946007)(6916009)(66476007)(66066001)(54906003)(6246003)(66556008)(68736007)(53936002)(66446008)(7416002)(31686004)(36756003)(2906002)(64756008)(8936002)(256004)(6486002)(478600001)(81156014)(25786009)(4326008)(31696002)(80792005)(305945005)(52116002)(5660300002)(7736002)(316002)(486006)(6116002)(81166006)(86362001)(3846002)(4744005)(229853002)(6512007)(76176011)(8676002)(6436002)(446003)(476003)(2616005)(99286004)(11346002)(26005)(6506007)(71200400001)(71190400001)(386003)(102836004)(53546011)(186003)(142923001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3017;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ttyEpaCsWhjzPwOQaUN5EypATDnM2clf6KCIdSefZAEPe4B/DOu9ch/IMRDQdQDICpogoX4/P///qChDutg91wc/AweoFjsfsRWiQpA55Z4N1AlGRuzIb7Qzc9jKWKppyopSDGs6jMId/abbJqeohcmokTJkgm+iITa3x2oUV3w2IU4ndvw2YAZmIjj4MfFPcgaqEiqk3uiXUwzUtc6asxIGix/3pghSs+7Q/J05+Q1U8tWtEhG3QbrIdaTyXxbVaOKul55amJo961fS85OgxRRRReLxTkJl/k+zXdTEKM5t5pleXWx8kNhh5Pki9IKP1MODtRRuolMu9LgZe/qqvonIe0LIHtZ7W57x3Cp392+HqwQwfJhQW+ljC5Z1VOxzfG78x/Nd2cTecPGI4MLyYLos/GctnvU6Z/AHzPLKRdU=
Content-ID: <5E44EDF9B4171D428E35E16DF7331F7A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d2980c-52ea-49b6-87b0-08d70c2780fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 09:00:10.6479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3017
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxOToyMiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPj4gICAgIC0gTGlu
ZSAxMzk6IFRoZSB7IGFyZSBjb21tb25seSBvbiB0aGUgc2FtZSBsaW5lIGFzIHN0cnVjdCBvciBk
ZWZpbml0aW9uLg0KPiANCj4gQWNjb3JkaW5nIHRvIENPRElOR19TVFlMRSB0aGF0J3Mgbm90IGhv
dyBpdCBzaG91bGQgYmUuDQoNCkhhdmluZyB0aGUgYnJhY2Ugb24gdGhlIHNhbWUgbGluZSB0aGVy
ZSBpcyByYXRoZXIgaGVscGZ1bCB0byBlYXNpbHkNCnRlbGwgdGhlIGRlZmluaXRpb24gcG9pbnQg
b2YgYSBzdHJ1Y3QvdW5pb24vZW51bSBmcm9tIGFueSBvZiBpdHMgdXNlcy4NCkhlbmNlIG5vIG1h
dHRlciB3aGV0aGVyIC4vQ09ESU5HX1NUWUxFIGRvZXNuJ3QgZXhwbGljaXRseSBjb3ZlciB0aGlz
DQpmYWN0LCBJIHRoaW5rIHdlIHdhbnQgdG8gc3RpY2sgdG8gdGhlIChMaW51eCBpbmhlcml0ZWQg
SSB0aGluaykgZm9ybS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
