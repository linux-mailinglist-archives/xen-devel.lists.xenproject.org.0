Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAB7768E8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:48:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0Wx-0007j8-F8; Fri, 26 Jul 2019 13:45:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YaH9=VX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hr0Wv-0007j3-Tb
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:45:05 +0000
X-Inumbo-ID: 9258e296-afab-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9258e296-afab-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 13:45:04 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 26 Jul 2019 13:44:51 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 26 Jul 2019 13:34:09 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 26 Jul 2019 13:34:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4yFHTKZ/B7Vicj0/4bMEVSMeTmLmG/hFpy9ikz5jrUYiqsND/vpcm5we46jpaQqUNYjrkt7E59DK0/0hLLtINqXjvMf3JHn6YxwovaY0/MK18WVaMTCWOv0bafw8FVSeV2ZtSAv+SPJ0uNHrZdHCAbQ0IZvaFMKb3u1q31qQ+spFDZpyJn/xaGDAJFnkqd2DF1TwLiDW12lMlr7EuPqHxksd4okA9f58TekSiVsczFuPZocZPrXiiI9Kg0coXjze4YNqqXTJXINe+B2VvUCSv4AFGABENXsCy//OHlqd665I+/pNoD0Anmnr3R4EdQReIlWK9/x3SR7dAWdc7RUuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwkhiX0IUzy7x5ZWKfmFaodd2z9jzfVP5eHzLfhChuo=;
 b=UIiqC5z+kJIO1laGVRsEoHa+ypnkeIdiawfRVBpVvrEKZMZlh+IG8yv5pNnnmFwjET4neFUvP+JnUzPLdDfc0RKiBJOPstcnbq2SF+C7gOH7j8e8a/L19UmFiC2kb0Kwr3tMriessSAja0DdeBWquMCx39M95izS4CjMgM3pWjDjf7CIp6WFkanX0pY70uXA4Xz+gaaIZHCBYkicyFinjqmTZcraunPxwAsoX7Lu1V+QLgbmCrOd24zY1x5zg79T2i1l0kZQZU5XhGbbGVlt5lHPeE3z2B1rfsKrFQRs1KzeT9vejk8m1ygdgrcqOIfiZ/kEnzNP02f3GHbDYyRN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3201.namprd18.prod.outlook.com (10.255.139.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Fri, 26 Jul 2019 13:34:09 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 13:34:09 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86: don't include {amd-,}iommu.h from fixmap.h
Thread-Index: AQHVQ7bNqtABAqKiMUiURogAFDADgg==
Date: Fri, 26 Jul 2019 13:34:08 +0000
Message-ID: <2feaccf3-003b-f2ce-f101-da23f8c387c8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR1001CA0037.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:4:55::23) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9d73a20-0e5b-496c-1abd-08d711cdefd7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3201; 
x-ms-traffictypediagnostic: BY5PR18MB3201:
x-microsoft-antispam-prvs: <BY5PR18MB32019B489888467352E41E3DB3C00@BY5PR18MB3201.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(199004)(189003)(71190400001)(99286004)(71200400001)(68736007)(7736002)(316002)(8936002)(6512007)(8676002)(81156014)(81166006)(54906003)(6916009)(305945005)(486006)(476003)(256004)(2616005)(66066001)(4326008)(31686004)(6506007)(80792005)(53936002)(26005)(36756003)(25786009)(186003)(2351001)(2501003)(66946007)(66476007)(66556008)(64756008)(66446008)(5660300002)(86362001)(5640700003)(3846002)(6116002)(6436002)(478600001)(52116002)(6486002)(4744005)(14454004)(102836004)(386003)(2906002)(31696002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3201;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fjiJzYFu3ShWIr9nqpTvdSMHrYcrjweOgzvXe4sof43fkjl3VdzOT5vU3Xl7FPUrUp4nkfDCG1X+SWLY5CWQ9b8MvqOhTHJ0IK9tZryVHCO0LqSKl/mIB1qgm8nDtd/01yOnw4EVGK/DIwavAR0zyuIbuMN7XrSeWg8zx8CzsE4si5VHF+/7XcXEABdZ1vI733GNtSg8Rzqi1wqcGr5c/rLo6u4ns9WHes3x7eE9G3WKKiVr+9RXWjrXCT7hQjX7YEAKr6TuxWmCfZ/V2v9TuE8625cWcZTUwgofZNEcJH15ujZkGtZu1ML7FBD2o11pLeAMFeFXF3h4j5g1vTcs81W/UfvWx07U8zJVL/BmIyI0OqAP8y8QX+STp3GZSObcEzbEMxr0vG4hnrSOwlmcL7+GeRYYsJ2oMi4T2LupKV8=
Content-ID: <A64C5B4567E97E4CBCC3AC525B2395E9@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d73a20-0e5b-496c-1abd-08d711cdefd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 13:34:08.9392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3201
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH] x86: don't include {amd-, }iommu.h from fixmap.h
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

VGhlICNpbmNsdWRlIHdhcyBhZGRlZCBieSAwNzAwYzk2MmFjICgiQWRkIEFNRCBJT01NVSBzdXBw
b3J0IGludG8NCmh5cGVydmlzb3IiKSBhbmQgSSB0aGVuIGRpZG4ndCBkcm9wIGl0IGFnYWluIGlu
IGQ3ZjkxM2I4ZGUgKCJBTUQgSU9NTVU6DQp1c2UgaW9yZW1hcCgpIik7IHNpbWlsYXJseSBmb3Ig
eGVuL2lvbW11LmggaW4gOTkzMjFlMGU2YyAoIlZULWQ6IHVzZQ0KaW9yZW1hcCgpIikuIEF2b2lk
IG5lZWRsZXNzbHkgcmUtYnVpbGRpbmcgdW5yZWxhdGVkIGZpbGVzIHdoZW4gb25seQ0KSU9NTVUg
ZGVmaW5pdGlvbnMgaGF2ZSBjaGFuZ2VkLg0KDQpUd28gI2luY2x1ZGUtcyBvZiB4ZW4vaW5pdC5o
IHR1cm4gb3V0IG5lY2Vzc2FyeSBhcyByZXBsYWNlbWVudC4NCg0KU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQotLS0gYS94ZW4vZHJpdmVycy9hY3BpL2Fw
ZWkvYXBlaS1pby5jDQorKysgYi94ZW4vZHJpdmVycy9hY3BpL2FwZWkvYXBlaS1pby5jDQpAQCAt
MjEsNiArMjEsNyBAQA0KICAjaW5jbHVkZSA8eGVuL2tlcm5lbC5oPg0KICAjaW5jbHVkZSA8eGVu
L2Vycm5vLmg+DQogICNpbmNsdWRlIDx4ZW4vZGVsYXkuaD4NCisjaW5jbHVkZSA8eGVuL2luaXQu
aD4NCiAgI2luY2x1ZGUgPHhlbi9zdHJpbmcuaD4NCiAgI2luY2x1ZGUgPHhlbi94bWFsbG9jLmg+
DQogICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4NCi0tLSBhL3hlbi9kcml2ZXJzL2FjcGkvYXBlaS9l
cnN0LmMNCisrKyBiL3hlbi9kcml2ZXJzL2FjcGkvYXBlaS9lcnN0LmMNCkBAIC0yOCw2ICsyOCw3
IEBADQogICNpbmNsdWRlIDx4ZW4va2VybmVsLmg+DQogICNpbmNsdWRlIDx4ZW4vZXJybm8uaD4N
CiAgI2luY2x1ZGUgPHhlbi9kZWxheS5oPg0KKyNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0KICAjaW5j
bHVkZSA8eGVuL3N0cmluZy5oPg0KICAjaW5jbHVkZSA8eGVuL3R5cGVzLmg+DQogICNpbmNsdWRl
IDx4ZW4vc3BpbmxvY2suaD4NCi0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZml4bWFwLmgNCisr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZml4bWFwLmgNCkBAIC0yMSw5ICsyMSw3IEBADQogICNp
bmNsdWRlIDx4ZW4vYWNwaS5oPg0KICAjaW5jbHVkZSA8eGVuL3Bmbi5oPg0KICAjaW5jbHVkZSA8
eGVuL2tleGVjLmg+DQotI2luY2x1ZGUgPHhlbi9pb21tdS5oPg0KICAjaW5jbHVkZSA8YXNtL2Fw
aWNkZWYuaD4NCi0jaW5jbHVkZSA8YXNtL2FtZC1pb21tdS5oPg0KICAjaW5jbHVkZSA8YXNtL21z
aS5oPg0KICAjaW5jbHVkZSA8YWNwaS9hcGVpLmg+DQogIA0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
