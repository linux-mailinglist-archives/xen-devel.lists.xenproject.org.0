Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC47E12049C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 13:00:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igp00-00009Z-Eq; Mon, 16 Dec 2019 11:57:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wy9o=2G=suse.com=jnwang@srs-us1.protection.inumbo.net>)
 id 1igozy-00009I-RB
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 11:57:14 +0000
X-Inumbo-ID: 2ec37028-1ffb-11ea-938e-12813bfff9fa
Received: from m9a0014g.houston.softwaregrp.com (unknown [15.124.64.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ec37028-1ffb-11ea-938e-12813bfff9fa;
 Mon, 16 Dec 2019 11:57:13 +0000 (UTC)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0014g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 16 Dec 2019 11:56:19 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 16 Dec 2019 11:42:42 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 16 Dec 2019 11:42:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCPBP9lyKDqfP2X8SxE9Dj4vwAAynfgHYCDYVBhWeFAilPbQpVYrs6srbNpzP36THhKg4fetCIjFlY8TZhAG9vCWM9PreNJZOy+K1ziOmOdSgT4eGQjwOrd2wHwsfrgyeFrQC4y6ASU0T+0cYsUWB0FFMMCxT2uFJeq+VbYRue1Y7U6BdyKnpkEZZAVEQu7WRZYygTaZc13iQjTldQMubkA9ITrD7gdboN+9iD81VKlWrQ1dboWYZ7raZvbxrs3JYn0bcpzR/LmeV9qIxrRp2hZJtsqkziXzT6cXwpEL3xEI6CgRpj04OP9GiPBMK0JRqRg6a+4PO4OgjwvCtp7UBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XX2bNsAYyznEwbPdAAawQCv7bhHOmouQlK7BAJW0j/4=;
 b=azaXlvy4zK+3/ZFMjha+1R7CRkxmDRLOChfZ00zjzNsqFMJ842xFBXw9HxDz/cvR0sz5VJKOblVc61cPhKUIbZHzIdiIqIEGG5oRMN2kq4xcvErvyMWMAxFUozbwc5UWOHQLqJDg8tZPC6RfRvht7NPTqkH4MifM/32CR58uXD+EV+aV5Afp+AnMWAzLsAHGceJp1CmQ6kcX+faUIuYwRvCCQRyO13d07cCGE0u/gKcgdfr9ERmfqmGTOyFmzPEJh8bqQCeogPmh3Y2F2Dis0LXePYFPuRdOxkwJ4GbyAk7Tw/Vs7AW+14/jUbBuNCkRWPh5XWpMsDgDUA2s9Od6WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3170.namprd18.prod.outlook.com (10.255.137.144) by
 BY5PR18MB3412.namprd18.prod.outlook.com (10.255.136.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Mon, 16 Dec 2019 11:42:41 +0000
Received: from BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::5967:dfe8:c14:808e]) by BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::5967:dfe8:c14:808e%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 11:42:41 +0000
From: Jin Nan Wang <jnwang@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3] Xen missing prompt log when exec-sp=off
Thread-Index: AQHVtAXsLvnVyOfn/Emg1UZSn6nYtQ==
Date: Mon, 16 Dec 2019 11:42:40 +0000
Message-ID: <20191216114206.28803-1-jnwang@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0087.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::27)
 To BY5PR18MB3170.namprd18.prod.outlook.com
 (2603:10b6:a03:1a9::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jnwang@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.24.0
x-originating-ip: [45.122.156.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 531f499e-804f-4879-77fa-08d7821d0e8b
x-ms-traffictypediagnostic: BY5PR18MB3412:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB34124004ADD371BA4F6A6705BE510@BY5PR18MB3412.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(189003)(199004)(6486002)(54906003)(186003)(316002)(5660300002)(6916009)(66946007)(66446008)(66556008)(66476007)(64756008)(52116002)(2616005)(6506007)(2906002)(71200400001)(81156014)(6512007)(4326008)(8936002)(81166006)(1076003)(26005)(36756003)(86362001)(8676002)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3412;
 H:BY5PR18MB3170.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: //mnjdnN6Y/DJuFbiB+M5JwZxHJtWpdo2cJb1ZRlCPeNSBas8YOUny1qXmr2mq87zKd2g4Mja4yhebGw+nMN/tRCxgSBU5+kv96zyHoHswrmGn9PWtwnREUxNHEq5nYKjuTVevwDfOjUP8egm30D2R/hWdBvxa8ZWFNTRB0IU6F5P5tzmdWbVMTRFkdSd1tTIfjboHz7sm+S2vqQNqnk/KcraHfdeXLtg4cgVgJaGdDXHLbhxYLEbl3P2XoFUortM3Nvk0Ym+pZ6AR/3rSsktNWVxVqbPW1cuuvyADrYvy7WhGRjJ70tAkChzZCQ5AhC8yOIVFYZHIK9P0kM8gL1wBoOyMvM2JHmMozpLvcPF/9rRUrGpNcqwoupMjZwjX19JqogUTLQ2Lcpa/x3PGUm3NysMg0+L5zeewXWSSMbyqb/l3CWx1q1kvIt5VPgVzZU
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 531f499e-804f-4879-77fa-08d7821d0e8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 11:42:41.0195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: esXG7NCWfD7OdIeBrYrf2Ok4njIuUzs7F24Zk71y4lpAQazdeUpuLEH30Y5bY+WZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3412
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v3] Xen missing prompt log when exec-sp=off
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jin Nan Wang <jnwang@suse.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rml4IGEgaXNzdWUgd2hlbiB1c2VyIGRpc2FibGUgRVRQIGV4ZWMtc3AsIHhlbiBtaXNzZWQgYSBw
cm9tcHQKbG9nIGluIGRtZXNnLgoKU2lnbmVkLW9mZi1ieTogSmFtZXMgV2FuZyA8am53YW5nQHN1
c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIHwgMTAgKysrKystLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Zt
eC5jCmluZGV4IDc5NzBiYTkzZTEuLjlkY2IxMDAyMTAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vdm14L3ZteC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCkBAIC0yNDk1
LDE0ICsyNDk1LDE0IEBAIGNvbnN0IHN0cnVjdCBodm1fZnVuY3Rpb25fdGFibGUgKiBfX2luaXQg
c3RhcnRfdm14KHZvaWQpCiAgICAgewogICAgICAgICBib29sIGNwdV9oYXNfYnVnX3BzY2hhbmdl
X21jID0gaGFzX2lmX3BzY2hhbmdlX21jKCk7CiAKKyAgICAgICAgLyogRGVmYXVsdCB0byBub24t
ZXhlY3V0YWJsZSBzdXBlcnBhZ2VzIG9uIHZ1bG5lcmFibGUgaGFyZHdhcmUuICovCiAgICAgICAg
IGlmICggb3B0X2VwdF9leGVjX3NwID09IC0xICkKLSAgICAgICAgewotICAgICAgICAgICAgLyog
RGVmYXVsdCB0byBub24tZXhlY3V0YWJsZSBzdXBlcnBhZ2VzIG9uIHZ1bG5lcmFibGUgaGFyZHdh
cmUuICovCiAgICAgICAgICAgICBvcHRfZXB0X2V4ZWNfc3AgPSAhY3B1X2hhc19idWdfcHNjaGFu
Z2VfbWM7CiAKLSAgICAgICAgICAgIGlmICggY3B1X2hhc19idWdfcHNjaGFuZ2VfbWMgKQotICAg
ICAgICAgICAgICAgIHByaW50aygiVk1YOiBEaXNhYmxpbmcgZXhlY3V0YWJsZSBFUFQgc3VwZXJw
YWdlcyBkdWUgdG8gQ1ZFLTIwMTgtMTIyMDdcbiIpOwotICAgICAgICB9CisgICAgICAgIGlmICgg
b3B0X2VwdF9leGVjX3NwICkKKyAgICAgICAgICAgIHByaW50aygiVk1YOiBFbmFibGUgZXhlY3V0
YWJsZSBFUFQgc3VwZXJwYWdlc1xuIik7CisgICAgICAgIGVsc2UgCisgICAgICAgICAgICBwcmlu
dGsoIlZNWDogRGlzYWJsaW5nIGV4ZWN1dGFibGUgRVBUIHN1cGVycGFnZXMgZHVlIHRvIENWRS0y
MDE4LTEyMjA3XG4iKTsKIAogICAgICAgICB2bXhfZnVuY3Rpb25fdGFibGUuaGFwX3N1cHBvcnRl
ZCA9IDE7CiAgICAgICAgIHZteF9mdW5jdGlvbl90YWJsZS5hbHRwMm1fc3VwcG9ydGVkID0gMTsK
LS0gCjIuMjQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
