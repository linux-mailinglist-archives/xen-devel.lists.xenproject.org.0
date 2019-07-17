Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CCF6B6E2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 08:45:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnde0-0006Me-Vz; Wed, 17 Jul 2019 06:42:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnddz-0006MU-Cl
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 06:42:27 +0000
X-Inumbo-ID: 09b48016-a85e-11e9-b9f5-3f2bb19018b8
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09b48016-a85e-11e9-b9f5-3f2bb19018b8;
 Wed, 17 Jul 2019 06:42:26 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 06:42:24 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 06:42:10 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 06:42:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDhO9m3UGT5Gac/780qf6AY37Sxj3xdDcKhlpwdD1HfubgBmXzwNbolrNon1pvYLDlK47j329U3TPJUM5xHvC2pukLkUROnxqODrz20WBWyvm09jmqQ6t1YdNcSB/r57QH95k1u+wqLtWJhZY1IF2VOIMVqbT1HawkdfXGt8iPZdyo3zhJII6d9RWiQAZpL1FJys1LsVlf3t7BDLjwO2ZQG1XuoS0IQ3sBbd913ITOTPjaWJsX3aaETWwm8q5Aja2uF0BEH4a67tQGNQpc9qGS5MYT+Ylr6ZA5Hpp08Zbl/bymngJZEwZscve7zEtl94ivED6giK/5tvusXJ5LRdTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVGzK+ypBm+kCW0PvXnLpmzCpMEFk3n1ds0PHpR/l/8=;
 b=noWpSvGzR5JwqSVg9dUlhvr8lL4n2Kg9UxE9pkJSnPZqeXPCimQD0r9AUKC/QV9/weR+Sbaro7xAuZNg2ZBT2qJ/0TSL/JexUgY/Gf24IfU8Jbe5A+mLYis/CJOQwRmnLvdbZ0IKVmj3U5vbydwxW6ZkjYs4FDzWqI3JSpeX3fUNDwOThnV0ui4Y5jqkqCfktanxkRBaXXE5dH6lIlLNaD7QK6ulmFPkdnMRjzS1UsXrlyXgUYoZMT+s8zppwLGhXEvbwHhjrMidjdIPi2RV1IibwTzzXnCvdGlq1AprBt2yl/ZzHdnw6rvV/v/IK4ZIW4RnP1xgkD3mUbQikfMjBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3196.namprd18.prod.outlook.com (10.255.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 06:42:09 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 06:42:09 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH RFC] x86emul: unconditionally deliver #UD for LWP insns
Thread-Index: AQHVPGrBPWLzciEO+UWYWtF8DkKtbQ==
Date: Wed, 17 Jul 2019 06:42:09 +0000
Message-ID: <d7b10cdc-b33a-0297-458d-1bad42727fa0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0009.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::19) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a40c3656-4ef1-4ccc-b151-08d70a81e443
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB3196; 
x-ms-traffictypediagnostic: DM6PR18MB3196:
x-microsoft-antispam-prvs: <DM6PR18MB3196205A9AEB9E42FEF9F94FB3C90@DM6PR18MB3196.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(189003)(199004)(26005)(6486002)(2501003)(68736007)(6506007)(80792005)(36756003)(6916009)(386003)(31696002)(7736002)(86362001)(316002)(54906003)(8676002)(102836004)(2351001)(5640700003)(305945005)(14454004)(52116002)(71190400001)(6436002)(66476007)(66446008)(71200400001)(64756008)(66556008)(25786009)(2906002)(66946007)(8936002)(486006)(99286004)(2616005)(81156014)(6116002)(31686004)(53936002)(476003)(256004)(5660300002)(478600001)(186003)(4326008)(81166006)(3846002)(66066001)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3196;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iuWEAFlRAk0U4/lfScCMy1cYDZhgyuBTgQqYmQwLzSh/TeEEfOS6mVPmxOY8slHAC3KgmKqwlOR1f9KwPGZNyAmBBOnHv+xuDJ72bD3X7wxoykhyo+PRzrooOK0zcIkR1KATUz+yst0QqwJzd+LwhkfFHlRz0BbB/oTCufPD4uvRkBfBisx4NJgWnDBNPV4LXqPitXJQsmNDchuaAQFBGB4kr4Z5QmEcIXVuKojp0UBqBvl/dGy3d8YRr/HaU+VfhF+k7+NkGeeWunLp2cDrjAUD0JC4jFIk4b63wokHmSmph3LdfFEY6Ju5EMJp/uKp3GmzxYzTsfnqTvky3vcBQGLZyR8P22KrfGliYpFcgTuXNVzqbFeIoGqXvr8AMOWc37FGy4ukup2eMsS9t/8zNIE4h0KMMzvg/hNJVkccT6s=
Content-ID: <65B9D473BEA7A84EBDA50B7233191E7D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a40c3656-4ef1-4ccc-b151-08d70a81e443
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 06:42:09.4983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3196
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH RFC] x86emul: unconditionally deliver #UD for
 LWP insns
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

VGhpcyBpcyB0byBhY2NvbXBhbnkgY29tbWl0ICAoIng4Ni9zdm06IERyb3Agc3VwcG9ydCBmb3Ig
QU1EJ3MNCkxpZ2h0d2VpZ2h0IFByb2ZpbGluZyIpLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQotLS0NCldpdGggQU1EIGFwcGFyZW50bHkgaGF2aW5n
IGFiYW5kb25lZCBYT1AgZW5jb2RlZCBpbnNucywgYW5vdGhlciBvcHRpb24NCndvdWxkIHNlZW0g
dG8gYmUgdG8gc2ltcGx5IHdpcmUgYWxsIHVucmVjb2duaXplZCBvbmVzIGludG8gI1VEIChyYXRo
ZXINCnRoZW4gcmV0dXJuaW5nIFVOSU1QTEVNRU5URUQvVU5SRUNPR05JWkVEKS4NCi0tLQ0KVE9E
Ty9SRkM6IEluc2VydCBjb21taXQgSUQgb2YgcmVmZXJlbmNlZCBjb21taXQuDQoNCi0tLSBhL3hl
bi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jDQorKysgYi94ZW4vYXJjaC94ODYv
eDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYw0KQEAgLTEwMzY3LDYgKzEwMzY3LDE2IEBAIHg4Nl9l
bXVsYXRlKA0KICAgICAgICAgIH0NCiAgICAgICAgICBnb3RvIHVucmVjb2duaXplZF9pbnNuOw0K
ICANCisgICAgY2FzZSBYODZFTVVMX09QQ19YT1AoMDksIDB4MTIpOiAvKiBYT1AgR3JwMyAqLw0K
KyAgICAgICAgc3dpdGNoICggbW9kcm1fcmVnICYgNyApDQorICAgICAgICB7DQorICAgICAgICBj
YXNlIDA6IC8qIGxsd3BjYiByICovDQorICAgICAgICBjYXNlIDE6IC8qIHNsd3BjYiByICovDQor
ICAgICAgICAgICAgLyogTFdQIGlzIHVuc3VwcG9ydGVkLCBzbyBwcm9kdWNlICNVRCB1bmNvbmRp
dGlvbmFsbHkuICovDQorICAgICAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uKEVYQ19VRCk7DQor
ICAgICAgICB9DQorICAgICAgICBnb3RvIHVucmVjb2duaXplZF9pbnNuOw0KKw0KICAgICAgY2Fz
ZSBYODZFTVVMX09QQ19YT1AoMDksIDB4ODIpOiAvKiB2ZnJjenNzIHhtbS9tMTI4LHhtbSAqLw0K
ICAgICAgY2FzZSBYODZFTVVMX09QQ19YT1AoMDksIDB4ODMpOiAvKiB2ZnJjenNkIHhtbS9tMTI4
LHhtbSAqLw0KICAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZih2ZXgubCwgRVhDX1VEKTsN
CkBAIC0xMDQ1MSw2ICsxMDQ2MSwxNiBAQCB4ODZfZW11bGF0ZSgNCiAgICAgICAgICBicmVhazsN
CiAgICAgIH0NCiAgDQorICAgIGNhc2UgWDg2RU1VTF9PUENfWE9QKDBhLCAweDEyKTogLyogWE9Q
IEdycDQgKi8NCisgICAgICAgIHN3aXRjaCAoIG1vZHJtX3JlZyAmIDcgKQ0KKyAgICAgICAgew0K
KyAgICAgICAgY2FzZSAwOiAvKiBsd3BpbnMgJGltbTMyLHIvbSxyICovDQorICAgICAgICBjYXNl
IDE6IC8qIGx3cHZhbCAkaW1tMzIsci9tLHIgKi8NCisgICAgICAgICAgICAvKiBMV1AgaXMgdW5z
dXBwb3J0ZWQsIHNvIHByb2R1Y2UgI1VEIHVuY29uZGl0aW9uYWxseS4gKi8NCisgICAgICAgICAg
ICBnZW5lcmF0ZV9leGNlcHRpb24oRVhDX1VEKTsNCisgICAgICAgIH0NCisgICAgICAgIGdvdG8g
dW5yZWNvZ25pemVkX2luc247DQorDQogICAgICBkZWZhdWx0Og0KICAgICAgdW5pbXBsZW1lbnRl
ZF9pbnNuOg0KICAgICAgICAgIHJjID0gWDg2RU1VTF9VTklNUExFTUVOVEVEOw0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
