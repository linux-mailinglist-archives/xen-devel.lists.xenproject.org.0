Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B207FD78
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:27:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZPf-00026y-5t; Fri, 02 Aug 2019 15:24:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htZPd-00026s-Ko
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:24:09 +0000
X-Inumbo-ID: 9166e548-b539-11e9-b7f8-afc0ce4c3ccf
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9166e548-b539-11e9-b7f8-afc0ce4c3ccf;
 Fri, 02 Aug 2019 15:24:08 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  2 Aug 2019 15:24:05 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 2 Aug 2019 15:21:56 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 2 Aug 2019 15:21:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuPDBLAgHlX5aP/S8YI6br7MYxrDBh8eL5yra+1PUKyt6dg1YkBdu/MfbMhlletSTFbwly1M6xsgw2N1KHVb8l791Nx6wOqzKLEuLkkX8N8F74U7mKyp729AOt4zq81bUaAwV1u5BBz1CD/OMPK+5QS1C9g8V9wdZibSZpisN/A65LhsEQtRt3cxXPhLl44Wr4D8jN4MpxgvLvIpfijLWkUq1gLSbx2gaMCEBrgCeYg3XLew8WQRmednWMb/JHGgtaOdwNOyXutwCFmXVpXXaFlahhq8DXNYcPhyWjKFWhjFbKqP+nrtDk9kYHSJHRL3uuInviE3FEb7LtqaKQlOnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3KCcE1+AQQJqhN/aisBQYeOtP/SGZoKide+rhsQzHE=;
 b=hFeFovObkxcrd6yMBrUk7++kKU9wKqqLToJV1KyrviABNiULH/yrkAzCcHaDDztzt7eizSzo1gAlh3rZGVAElJMmjPqC4KqZz5kHny+8VFNq6q4uFQJ6ZaDuUT4QTW9sljKOqpiMpLxaAEGKvACmYY6ZuRxk5RYO+jbUcTRI3rB33QBz/t5jJ1sFbPjY/tZWwFnDTfikBUfqJcOBLYl9YErPXEBX8RTxkryLQEmPTElxVgM/73i9zdRfRGGAOnRIuWY/DnDPmZMM69lkAM3CttPci6exJtJO5qRFl4Gfyy9IfGyNBRjkELgk5+27W/AnC2fY1M1UkAwL4IzfXo88cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2426.namprd18.prod.outlook.com (20.179.104.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Fri, 2 Aug 2019 15:21:55 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 15:21:55 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [PATCH v8 10/16] microcode/amd: call svm_host_osvw_init() in
 common code
Thread-Index: AQHVSFKfdPX0MLYXWU6Kfh+0nyWtsKbn+2AA
Date: Fri, 2 Aug 2019 15:21:55 +0000
Message-ID: <eca23e12-aa79-69bb-9659-fb3a69c65272@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-11-git-send-email-chao.gao@intel.com>
In-Reply-To: <1564654971-31328-11-git-send-email-chao.gao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0178.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::22) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04ea72c5-cb29-40c6-bb88-08d7175d271e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2426; 
x-ms-traffictypediagnostic: DM6PR18MB2426:
x-microsoft-antispam-prvs: <DM6PR18MB2426466E1F79EBDE2CD17A71B3D90@DM6PR18MB2426.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(189003)(199004)(8676002)(14444005)(99286004)(14454004)(26005)(305945005)(256004)(7736002)(8936002)(478600001)(3846002)(6116002)(31696002)(66446008)(5660300002)(66946007)(64756008)(66556008)(66476007)(6916009)(66066001)(86362001)(186003)(36756003)(11346002)(2616005)(53936002)(386003)(476003)(6486002)(446003)(6436002)(6512007)(102836004)(486006)(52116002)(53546011)(81156014)(81166006)(71190400001)(71200400001)(25786009)(54906003)(80792005)(6246003)(316002)(31686004)(68736007)(229853002)(2906002)(6506007)(76176011)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2426;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kMWWUptTTHbdhDqFlfirp2X2UOjZ2KQfo5q1d//bTHK27Vw6XcZYfK898Gnx25s5j/MNI2G0ZO+AqaXD6nMTkVhkYKn8BYl+KimyeHAsnROjQTPX4vZ/N8n7mEK8ZgfXC+9iBJhqx8EAfR1LDk9WxvP5VpebLoirOg2RxbPGGezLK7EZwQIhNdly0HQT4vq83tMCsaaqjajxf1boHckKhp6AmRjMSmFngIUwyU19j4WTe1/p6SITLVlaA9+A5hG4XYqrCu7AvNS+RMpLtcJun4td8SmPuVjBs6gIVS8ZA25twZ49mT3RyTev9Pm+JB/1UsfaWzz+HjPpjqibUNlqHRmuHLRdaN17/N1vfMiVkzqOP22WgSlwl7O3/9qAxrMGZP1VdCiq32T3IrmYxvukTXzNBeZBp3/+uI15Tu5uoJM=
Content-ID: <64A11E6AD61C5243895A0DF5C4E18CEB@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ea72c5-cb29-40c6-bb88-08d7175d271e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 15:21:55.3326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2426
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 10/16] microcode/amd: call
 svm_host_osvw_init() in common code
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDguMjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9taWNyb2NvZGUuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMNCj4gQEAgLTI3
Nyw2ICsyNzcsOSBAQCBzdGF0aWMgbG9uZyBkb19taWNyb2NvZGVfdXBkYXRlKHZvaWQgKl9pbmZv
KQ0KPiAgICAgICBpZiAoIGVycm9yICkNCj4gICAgICAgICAgIGluZm8tPmVycm9yID0gZXJyb3I7
DQo+ICAgDQo+ICsgICAgaWYgKCBtaWNyb2NvZGVfb3BzLT5lbmRfdXBkYXRlICkNCj4gKyAgICAg
ICAgbWljcm9jb2RlX29wcy0+ZW5kX3VwZGF0ZSgpOw0KPiArDQo+ICAgICAgIGluZm8tPmNwdSA9
IGNwdW1hc2tfbmV4dChpbmZvLT5jcHUsICZjcHVfb25saW5lX21hcCk7DQo+ICAgICAgIGlmICgg
aW5mby0+Y3B1IDwgbnJfY3B1X2lkcyApDQo+ICAgICAgICAgICByZXR1cm4gY29udGludWVfaHlw
ZXJjYWxsX29uX2NwdShpbmZvLT5jcHUsIGRvX21pY3JvY29kZV91cGRhdGUsIGluZm8pOw0KDQpU
aGlzIGJlaW5nIHRoZSBvbmx5IGNoYW5nZSBpbiB0aGlzIGZpbGUgLSBkb24ndCB5b3UgYWxzbyBu
ZWVkIHRvDQphbHRlciB0aGUgZWFybHkgdWNvZGUgbG9hZGluZyBwYXRoPw0KDQo+IEBAIC02MzEs
MTEgKzYyMiwxOSBAQCBzdGF0aWMgaW50IHN0YXJ0X3VwZGF0ZSh2b2lkKQ0KPiAgICAgICByZXR1
cm4gMDsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgdm9pZCBlbmRfdXBkYXRlKHZvaWQpDQo+ICt7
DQo+ICsjaWYgQ09ORklHX0hWTQ0KPiArICAgIHN2bV9ob3N0X29zdndfaW5pdCgpOw0KPiArI2Vu
ZGlmDQo+ICt9DQoNCkluc3RlYWQgb2YgbGVhdmluZyBhbiBlbXB0eSBmdW5jdGlvbiBpbiB0aGUg
IUhWTSBjYXNlLCAuLi4NCg0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX29wcyBt
aWNyb2NvZGVfYW1kX29wcyA9IHsNCj4gICAgICAgLmNwdV9yZXF1ZXN0X21pY3JvY29kZSAgICAg
ICAgICAgID0gY3B1X3JlcXVlc3RfbWljcm9jb2RlLA0KPiAgICAgICAuY29sbGVjdF9jcHVfaW5m
byAgICAgICAgICAgICAgICAgPSBjb2xsZWN0X2NwdV9pbmZvLA0KPiAgICAgICAuYXBwbHlfbWlj
cm9jb2RlICAgICAgICAgICAgICAgICAgPSBhcHBseV9taWNyb2NvZGUsDQo+ICAgICAgIC5zdGFy
dF91cGRhdGUgICAgICAgICAgICAgICAgICAgICA9IHN0YXJ0X3VwZGF0ZSwNCj4gKyAgICAuZW5k
X3VwZGF0ZSAgICAgICAgICAgICAgICAgICAgICAgPSBlbmRfdXBkYXRlLA0KDQouLi4gY291bGQg
eW91IHBsZWFzZSBsZWF2ZSB0aGlzIHBvaW50ZXIgdW5pbml0aWFsaXplZCAoaS5lLg0KTlVMTCkg
aW4gdGhhdCBjYXNlPw0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
