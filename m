Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D16F76B17
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:08:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0pd-0001iD-Jj; Fri, 26 Jul 2019 14:04:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YaH9=VX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hr0pc-0001i7-Ty
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:04:24 +0000
X-Inumbo-ID: 443d3c85-afae-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 443d3c85-afae-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:04:24 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 26 Jul 2019 14:04:21 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 26 Jul 2019 14:01:50 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 26 Jul 2019 14:01:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mf10Hsm2jdU/eIjf7MQkeVltx1bqGKOsz8qbI4vbKLFKIQTWxx3AiTDEuqdOi4zJWb8toeGimlSU7jehiDLnburVseKL1r8o7U9FmooWxZAIMmtf6nG0ghhhvoMTo/WtdWqNxxg4FE3LNiGLIg1L5AIIgo1hdgj8/LWKbdS0ZgLtxdxJaax3g/4kFyGh+lRBSudCtYJakrLd5QMd/jfBni7l4RS7TqNzFuVa8msjfLm7F1SD6RFMG5leoLq96ahgy0sTZ5EALB7lH/aKSsH4GKXTZnBX6ykStE2+jwlZjR85uWSN5h07jxuSlGnPsaV0Fh/6Opot+uDi8jLW74xvHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqULPdd2ILYpVXGBhIEQMv3axvXwUxu3krgOBr33cx4=;
 b=adJtO8GLntdgvzXH1FBVEa+Bx/d64yy4IFCJYQBauISy0qGtAEU2486pQse58i3HC5faJ+YAhKozeOuRq/zEEZKF/9qKXfCOc5OLYYHzRrBKy06667q7lyIPcO/SXyKCrZ+US9NOA04Luuvor/y/wmcE41ponU0YEfxiFZtX5xncf+ZZRMdquTT8stjvatgvOrrCEByYA2PQqxDBuCtYP1K4WbRB0u52x2+Pnu6PG4U09jTzhbcPmOrZ/I3nUZFxLeffCb6ttQyeM0+wnAUhF711fBzhnvc6cJmdtdw9Diud+NhkhGnv+2+nZQKjyKbyUy1HdA2bUoGzr9+/Hc7Hqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3107.namprd18.prod.outlook.com (10.255.137.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Fri, 26 Jul 2019 14:01:49 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 14:01:49 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [Xen-devel] per-domain passthrough/iommu options
Thread-Index: AdVDqy2gdS3slVvQRuCN/iB10JmJ2gABnjsAAAD6vMAAAUXLgA==
Date: Fri, 26 Jul 2019 14:01:49 +0000
Message-ID: <82fc3e28-353a-44fb-0d6b-ec2913610c2f@suse.com>
References: <a65d176f8912458c8576367597613de9@AMSPEX02CL03.citrite.net>
 <8fff2485-bf0a-5b98-dfbc-4679c39b9ed0@suse.com>
 <3cd2057e69bc4bdbb87f53c97ffe765c@AMSPEX02CL03.citrite.net>
In-Reply-To: <3cd2057e69bc4bdbb87f53c97ffe765c@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR03CA0031.eurprd03.prod.outlook.com
 (2603:10a6:10:be::44) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ea3c3ed-5986-4be4-4acf-08d711d1cdd9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3107; 
x-ms-traffictypediagnostic: BY5PR18MB3107:
x-microsoft-antispam-prvs: <BY5PR18MB3107EA482A67C5F12F595B11B3C00@BY5PR18MB3107.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(189003)(199004)(6116002)(6436002)(3846002)(86362001)(5660300002)(66446008)(64756008)(66556008)(66476007)(66946007)(14454004)(53546011)(6506007)(386003)(102836004)(4744005)(11346002)(76176011)(31696002)(2906002)(229853002)(52116002)(6486002)(478600001)(486006)(305945005)(14444005)(2616005)(256004)(476003)(7736002)(99286004)(71190400001)(71200400001)(81166006)(81156014)(8676002)(6916009)(316002)(8936002)(6512007)(25786009)(6246003)(36756003)(186003)(4326008)(66066001)(446003)(53936002)(26005)(68736007)(31686004)(80792005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3107;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1gbMwucqgeMHmxyjPsIm17UZk7IZvScsWiializuFjcAcpF9uayy5jwbMtVTIFsBDlZzA3CnUJY0OzuYwpTe+6jNTd3A47hjf5pmmY5AxtEZ8e8sD8QQyWuTzHJ0mYelOvcVATfP9rZcPE3iGnqrim8lR/+HCCVDfYt1YZWrFKtHzYeEJ3ztiWS8TRrxaTGnkfrekTU333GHrbZQJ4xaVchffG5A+EYjpLF3VM4y+rzTk0Ia74q7vjbyLJLgDQ8/euz1MprW7cPNpr0Yv3yboYyk7zs442UTYt8ODVbAxMCDGt6le/pB9Aa36LQ8ngfPzIoi5MNkx/TrcqPKsanrpOzzMzXQgFeFhluoIKOg0iDJ5NID+dj6/Vv6qwu9XLnjwlEOrlmfmZce5WXiIEyRwdk1jEnaApZWNxS/mLfbflM=
Content-ID: <F503400AC6E59F498C39B0CC7D4C8282@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea3c3ed-5986-4be4-4acf-08d711d1cdd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 14:01:49.8599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3107
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

T24gMjYuMDcuMjAxOSAxNTozOSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiBOb3Qgc3VyZSBob3cg
J29uJyB3b3VsZCBjby1leGlzdCB3aXRoICd2aW9tbXUnLi4uIHRoZSBjcnVjaWFsIGRpZmZlcmVu
Y2UgaXMgd2hldGhlciB0aGUgcDJtIGlzIHNoYXJlZCBvciBub3QgYW5kIHRoZSBjdXJyZW50bHkg
dGhlIG9ubHkgb3B0aW9uIGluIHRoZSBub24tc2hhcmVkIGNhc2UsIGJlY2F1c2Ugd2UgbGFjayBh
IHZpb21tdSwgaXMgdG8ga2VlcCB0aGUgSU9NTVUgbWFwcGluZ3MgaW4gc3luYyB3aXRoIHRoZSBQ
Mk0gd2hlbmV2ZXIgdGhlIGxhdHRlciBpcyB1cGRhdGVkLiBTbywgaG93IGFib3V0Og0KPiANCj4g
cGFzc3Rocm91Z2ggPSBvZmZ8c3luYy1wdHxzaGFyZS1wdHx2aW9tbXUNCj4gDQo+ID8gSSBkb24n
dCB0aGluayAncHJpdmF0ZS1wdCcgb3IgJ3NlcGFyYXRlLXB0JyByZWFsbHkgY2FwdHVyZSB0aGUg
ZmFjdCB0aGF0IHRoZSBwYWdlIHRhYmxlcyBtYXRjaCB0aGUgUDJNLiBUaGV5IGNvdWxkIGp1c3Qg
YXMgZWFzaWx5IGJlIHRha2VuIHRvIG1lYW4gdGhhdCB0aGV5IGFyZSBwb3B1bGF0ZWQgdXNpbmcg
c29tZSBvdGhlciBwb2xpY3kuDQoNCkJ1dCBoYXZlbid0IHdlIHJlY2VudGx5IHNlZW4gdGhhdCB0
aGlzIGZ1bGx5IGxvY2stc3RlcCBwb3B1bGF0aW9uDQpvZiBwYWdlIHRhYmxlcyBpc24ndCBhbHdh
eXMgY29ycmVjdCAob3IgYXQgbGVhc3QgZGVzaXJhYmxlKT8gSQ0KdmFndWVseSByZWNhbGwgb3Ro
ZXIgY29tbWVudHMgdG8gdGhhdCBlZmZlY3QgdG9vLCBmcm9tIGxvbmcgYWdvLg0KSSdkIHNwZWNp
ZmljYWxseSB3YW50IHRvIGF2b2lkIGVuY29kaW5nIGludG8gdGhlIGludGVyZmFjZSBoZXJlDQp0
aGF0IHRoZSB0d28gYXJlIGV4YWN0IG1pcnJvcnMgb2Ygb25lIGFub3RoZXIsIG5vdyBhbmQgZm9y
ZXZlci4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
