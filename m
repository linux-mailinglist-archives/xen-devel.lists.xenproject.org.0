Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886DC6FF6C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 14:22:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpXIK-0002jE-Fn; Mon, 22 Jul 2019 12:19:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wXcs=VT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpXII-0002j4-Kh
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 12:19:54 +0000
X-Inumbo-ID: fb6ac314-ac7a-11e9-b0ed-0f534a27c71c
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb6ac314-ac7a-11e9-b0ed-0f534a27c71c;
 Mon, 22 Jul 2019 12:19:52 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 22 Jul 2019 12:19:41 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 12:18:36 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 12:18:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOKHxdAwO4jr85VWqhK7bntDDn+R0k88ToX4N/8VWwpAYwukiKMWdFUFAhf88RjR9txkbu3WOjRVbxG3pZdN4MG53xqMMDy3jpxHDLEdCjrIX3IuIK2H/ee+3/9g5K4LeOx5fHh2GMXUciNRdnQ1WkbS5cILLhNPIRW+KZyyqHsVHdj+quB1v1Et90zhojuoi6to7+zybMoyTBopD2QqFYsFWpmx8sS5ysakNTgJ2ngN1i8FkEAnPX2Gii9zlIlTn22VM8ADL6Hp2hV53EXsX8dOugonODxB0pkKACHZR+ucfMkBJiyShKqClbsEy/lLrqPPtWuGH8D7AjOch+Nsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMZLFoCYeosz08whAWQSnWp2kPiJOK9dBoq+q7xW7Hk=;
 b=npJO+alxR1R0Sm7MDL89Qwi/ao7Wv6dnmSpSOwyfhmMqsUKMZ0EuZTawyAP8UASpLqwxfyrA53VMPqSfMQ76ZOPY6wWSmEvCrozfdrpbn64v9bjvOrUFKx6pFtQUyZjUcXA0bPuR52rqbeGv7PyI1gSkxDxYEkMxRY9YGTefYcYtZr0fE9F5N5VA1UJFgcCbd18waKkZX8fbfU5Sgqnw0gZAAHtgRPu03mBm2i5UnHfWbEZWKKPCBnVjtZOrPlYIUVeT7I2WH5wSX+VL2ARhFawDmWS42aak+FXEu4TC5sGpYUM+GyheNwmhun+t1/5nkouUum1fY7Gr4tTHrY2bqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2649.namprd18.prod.outlook.com (20.179.106.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 12:18:34 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 22 Jul 2019
 12:18:34 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] "CPU N still not dead..." messages during microcode
 update stage of boot when smt=0
Thread-Index: AQHVP//515Jyq7gbbE+1g3GDqkihQ6bWXCcAgAAvoO+AAANagA==
Date: Mon, 22 Jul 2019 12:18:34 +0000
Message-ID: <6b3c41f4-377e-0515-a6c8-8057c8dcd465@suse.com>
References: <20190721200623.GJ11726@bitfolk.com>
 <7d518504-b12b-a6b9-dc37-7fdb00f8d632@suse.com>
 <c33f310d-7956-ba59-7df7-1cdc66aa1979@citrix.com>
In-Reply-To: <c33f310d-7956-ba59-7df7-1cdc66aa1979@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0176.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::20) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e7287b6-4861-4348-7b7f-08d70e9eb794
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2649; 
x-ms-traffictypediagnostic: DM6PR18MB2649:
x-microsoft-antispam-prvs: <DM6PR18MB26498E6BF6F24C8DD448E035B3C40@DM6PR18MB2649.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(189003)(199004)(54094003)(64756008)(66556008)(66476007)(66946007)(6512007)(446003)(476003)(11346002)(6246003)(2616005)(15650500001)(66446008)(7736002)(305945005)(8676002)(54906003)(2906002)(478600001)(256004)(68736007)(53546011)(31696002)(229853002)(71200400001)(86362001)(71190400001)(102836004)(386003)(6506007)(26005)(99286004)(186003)(486006)(6916009)(4326008)(76176011)(4744005)(80792005)(31686004)(36756003)(316002)(6486002)(25786009)(8936002)(53936002)(81166006)(81156014)(52116002)(66066001)(14454004)(5660300002)(6116002)(3846002)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2649;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y3IgvTzbDZlFUPOdWmkOxFXhcrSm30S+CBHxNBG+RDBSv3uxY723g3/UNZU+vUzz9KpIMnYOhxleLB2RVZ6sRxhb/HHz6+09rMJamuwjr9xzJ1uCKIipErbcdRzSZzZXR9quHWWAAq8pzq+oVkPMCwvBJhglfFwb6uDQgsW5tUz+Y5noLDon8a5wa1gZU1WdRegLY4TotPZ3YYBKSRc4CJ1DLoNb7KvHKAY1EhM8tUrufSTUb0n9yIEXQs6UnzU7AbZe6MUvNIwEOjnfYfEc3gVKi9/lpXt3upWIzXsdZjIv9aKD99ATCvOtyvZmg+B6BO0cD+tt5Gq2cSultXGmMnqvd5Hn60nIyASeuGZh7Z+btf9RZWTYAJLMhR4gPiyB4go/Q9ixIyqcgDDQs8yrrER6YZpV/pUYbXkTzkHax6I=
Content-ID: <0D2AD4C3C3AF6645AD51E84228CABCBE@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7287b6-4861-4348-7b7f-08d70e9eb794
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 12:18:34.6715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2649
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] "CPU N still not dead..." messages during microcode
 update stage of boot when smt=0
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
Cc: Andy Smith <andy@strugglers.net>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDcuMjAxOSAxNDowNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gRG9lcyByZXZlcnRp
bmcgYmFjayB0byBjcmVkaXQxIG1ha2UgdGhlIGlzc3VlIGdvIGF3YXk/wqAgSSd2ZSBuZXZlcg0K
PiBlbmNvdW50ZXJlZCB0aGlzIG9uIGFueSBzbXQ9MCB0ZXN0LCBidXQgSSBhbHNvIGRvbid0IHVz
ZSBjcmVkaXQyIGF0IGFsbC4NCg0KSSdsbCB0cnkgdG8gcmVtZW1iZXIgdHJ5aW5nIHRoaXMgb3V0
IHRoZSBuZXh0IHRpbWUgSSBzZWUgaXQuIEkgY2FuJ3QNCnNlZSBhIGNvbm5lY3Rpb24gdG8gdGhl
IHVzZWQgc2NoZWR1bGVyIHRob3VnaCwgd2hlbiB0aGUgbWVzc2FnZSBjb21lcw0Kb3V0IG9mIF9f
Y3B1X2RpZSgpLiBUaGVyZSBtdXN0IGJlIGFuIGV4Y2Vzc2l2ZSBkZWxheSBmb3IgdGhlIGR5aW5n
DQpDUFUgdG8gZmluYWxseSBjYWxsIGNwdV9leGl0X2NsZWFyKCkuIEkgd29uZGVyIGlmIHRoZSBD
UFUgbWlnaHQgZS5nLg0KYmUgc2NydWJiaW5nIG1lbW9yeSBhdCB0aGF0IHBvaW50LiBCdXQgdGhh
dCBzaG91bGRuJ3QgaGFwcGVuIHRoaXMNCmVhcmx5Lg0KDQo+IFRoZSBzaWJsaW5nIHRocmVhZHMg
c2hvdWxkbid0IGJlIGluc2VydGVkIGludG8gdGhlIHNjaGVkdWxlciBpbiB0aGUNCj4gZmlyc3Qg
cGxhY2UsIGFuZCBJIHRob3VnaHQgd2UgdG9vayBkZWxpYmVyYXRlIHN0ZXBzIHRvIHByZXZlbnQg
dGhhdCBmcm9tDQo+IG9jY3VycmluZy4NCg0KSSBkb24ndCB0aGluayB3ZSBkaWQsIGJ1dCBJIGFn
cmVlIHRoaXMgbWF5IGJlIHdvcnRod2hpbGUgdG8gZG8gaWYgaXQNCndvdWxkbid0IHJlc3VsdCBp
biBhZGRpbmcgdWdseSBzcGVjaWFsIGNhc2VzIHNvbWV3aGVyZS4NCg0KSmFuDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
