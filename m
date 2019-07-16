Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249B86ACE6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 18:38:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnQQs-00024s-OO; Tue, 16 Jul 2019 16:36:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnQQr-00024m-FF
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 16:36:01 +0000
X-Inumbo-ID: cb160d03-a7e7-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb160d03-a7e7-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 16:36:00 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 16:35:59 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 16:35:08 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 16:35:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuRWPq8rZELuK+DlXssG5k5sC0Pm1L5r4hkUnlHzq+ewtVbrb0UdggwsS6dohwHAoSzaY9ZF3GTNM6YkUxA8JN2+EK0cn5Q+L0fBrMkgkGreIAtdc8i8b/6KxcJl2TwuivWKLG/pRYnA7C/Rga70Sb2tk5jPygmlZOIH7A+wuNXnFuMJlZO8bHaT+zlwIXwp5NbQIOZu5ubLprnC+pnoWNJbgmuUBRQTyWiI8RPxcg0QL7h3OjRTzCQaeOzVRgnujV8ovToSUp4n9ygncUjxFdMf2G7t8W50tt1RPfccurNHJJmAmZxwLZxPPANT6TOvz7VUQydRsE+DahjL0bdgfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4b/8lMA3V0UKl8hzQJA2iYxHhfpLnnYKrKerCCshVk=;
 b=nMwHytgWXz7dtcAnSSwXsB/gFBdJklJYSrh/ZQ04ZWGNS3mpfqXwqwHOKWlrumU0oC2vKul8blHhcB/YvStX87MyudIngKzJuPi4MZqqkqLHWFfuO5Wu17DbnScBzgon6Xwh6vfRn1MYD0DOi2xDcF+Ckn4DipYBI06DM4Q5HKneD8R022KUz73yMwZbZuN417fK8e8AGSxJtVn/a1070Z5d3nAS/VLEtBIOxjd3I4h8JLIDOB8CGrxLGNS1nv3h1+9HGQcGZrBHCkLAU88fyu3Ikijmkx0Vyf403M5aT8CBKyAP8DIVXjno8SvfssrhOZ6JBQv8OekkTO0Q0hgESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2764.namprd18.prod.outlook.com (20.179.49.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 16:35:08 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 16:35:08 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 01/14] AMD/IOMMU: free more memory when cleaning up
 after error
Thread-Index: AQHVO/Rtf/2Gjt1xPEey+KV3HfkjfA==
Date: Tue, 16 Jul 2019 16:35:08 +0000
Message-ID: <78aa4de3-f955-850f-9e1b-8711f2aa906f@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
In-Reply-To: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::12)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f59bf87-5bf1-4db7-7360-08d70a0b9066
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2764; 
x-ms-traffictypediagnostic: DM6PR18MB2764:
x-microsoft-antispam-prvs: <DM6PR18MB27642CDA834748402102A522B3CE0@DM6PR18MB2764.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(199004)(189003)(80792005)(76176011)(478600001)(14454004)(66066001)(2906002)(31696002)(2501003)(52116002)(7736002)(2616005)(25786009)(186003)(68736007)(11346002)(446003)(386003)(14444005)(6506007)(36756003)(8676002)(6512007)(476003)(305945005)(26005)(31686004)(8936002)(3846002)(4326008)(2351001)(6486002)(81166006)(81156014)(486006)(316002)(53936002)(54906003)(5640700003)(256004)(102836004)(86362001)(71200400001)(6116002)(66946007)(66476007)(66556008)(64756008)(66446008)(5660300002)(99286004)(6916009)(6436002)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2764;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +62huFybgVlzAYLWUQ0jJzCt2nSvNOFYLt++s7x5mNNG3c+EV8tnuG2jjm0MuRU9jKbwfiyf8m24XaWun0/7Gk/izKG9t7p6RjRz0KtoeQeGVAUfMjt3sag1DjC76JyFC+NnbHLUsPjU7y2/h9mNUQ9l7Hzm0Dh4MfppfaeeJLXz6XkUGsey2jgKykhaT/wG+9TNZlI/66BzLYzBzMt0MZ/hrR/znCpjcHSAObRlbBHBA7wvs8rhZSKOPhGKjMsBuJPq2xuH8IZnbOj5+lDsK17iy5emgPLDeMj4vhfqNVeqeqMOehB65YScdyfAI/wLy5WcC5TNflkQWulp0ga/hWzRiEdHi0hc57SlTfkutQ5E6ljpeNDryp0cVI9Scg9vJ9dXlDL3eu+RTZgBBDFjX9YKHaZk5dPCcep7vJovYOs=
Content-ID: <C45978007F13514E845EB8ABC862E70D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f59bf87-5bf1-4db7-7360-08d70a0b9066
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 16:35:08.0675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2764
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v3 01/14] AMD/IOMMU: free more memory when
 cleaning up after error
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGludGVycnVwdCByZW1hcHBpbmcgaW4tdXNlIGJpdG1hcHMgd2VyZSBsZWFrZWQgaW4gYWxs
IGNhc2VzLiBUaGUNCnJpbmcgYnVmZmVycyBhbmQgdGhlIG1hcHBpbmcgb2YgdGhlIE1NSU8gc3Bh
Y2Ugd2VyZSBsZWFrZWQgZm9yIGFueSBJT01NVQ0KdGhhdCBoYWRuJ3QgYmVlbiBlbmFibGVkIHll
dC4NCg0KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KLS0t
DQp2MzogTmV3Lg0KDQotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5p
dC5jDQorKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jDQpAQCAt
MTA3MCwxMyArMTA3MCwxMiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYW1kX2lvbW11X2luaXRfY2xl
YW51DQogICAgICB7DQogICAgICAgICAgbGlzdF9kZWwoJmlvbW11LT5saXN0KTsNCiAgICAgICAg
ICBpZiAoIGlvbW11LT5lbmFibGVkICkNCi0gICAgICAgIHsNCiAgICAgICAgICAgICAgZGlzYWJs
ZV9pb21tdShpb21tdSk7DQotICAgICAgICAgICAgZGVhbGxvY2F0ZV9yaW5nX2J1ZmZlcigmaW9t
bXUtPmNtZF9idWZmZXIpOw0KLSAgICAgICAgICAgIGRlYWxsb2NhdGVfcmluZ19idWZmZXIoJmlv
bW11LT5ldmVudF9sb2cpOw0KLSAgICAgICAgICAgIGRlYWxsb2NhdGVfcmluZ19idWZmZXIoJmlv
bW11LT5wcHJfbG9nKTsNCi0gICAgICAgICAgICB1bm1hcF9pb21tdV9tbWlvX3JlZ2lvbihpb21t
dSk7DQotICAgICAgICB9DQorDQorICAgICAgICBkZWFsbG9jYXRlX3JpbmdfYnVmZmVyKCZpb21t
dS0+Y21kX2J1ZmZlcik7DQorICAgICAgICBkZWFsbG9jYXRlX3JpbmdfYnVmZmVyKCZpb21tdS0+
ZXZlbnRfbG9nKTsNCisgICAgICAgIGRlYWxsb2NhdGVfcmluZ19idWZmZXIoJmlvbW11LT5wcHJf
bG9nKTsNCisgICAgICAgIHVubWFwX2lvbW11X21taW9fcmVnaW9uKGlvbW11KTsNCiAgICAgICAg
ICB4ZnJlZShpb21tdSk7DQogICAgICB9DQogIA0KLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYW1kL2lvbW11X2ludHIuYw0KKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lv
bW11X2ludHIuYw0KQEAgLTYxMCw2ICs2MTAsOCBAQCBpbnQgX19pbml0IGFtZF9pb21tdV9mcmVl
X2ludHJlbWFwX3RhYmxlDQogIHsNCiAgICAgIHZvaWQgKnRiID0gaXZyc19tYXBwaW5nLT5pbnRy
ZW1hcF90YWJsZTsNCiAgDQorICAgIFhGUkVFKGl2cnNfbWFwcGluZy0+aW50cmVtYXBfaW51c2Up
Ow0KKw0KICAgICAgaWYgKCB0YiApDQogICAgICB7DQogICAgICAgICAgX19mcmVlX2FtZF9pb21t
dV90YWJsZXModGIsIElOVFJFTUFQX1RBQkxFX09SREVSKTsNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
