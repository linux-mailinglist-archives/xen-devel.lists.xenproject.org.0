Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE2F11FE39
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 06:58:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igjLA-00015w-50; Mon, 16 Dec 2019 05:54:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wy9o=2G=suse.com=jnwang@srs-us1.protection.inumbo.net>)
 id 1igjL8-00015p-NU
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 05:54:42 +0000
X-Inumbo-ID: 81310ff6-1fc8-11ea-88e7-bc764e2007e4
Received: from m4a0073g.houston.softwaregrp.com (unknown [15.124.2.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81310ff6-1fc8-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 05:54:31 +0000 (UTC)
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0073g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 16 Dec 2019 05:52:17 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 16 Dec 2019 05:47:50 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 16 Dec 2019 05:47:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ve14y2k50hCyTxpcNLyrVKSMMaWGbGHt6ycqfnqxR1HXH7Nch+AYbo2m8EmMkBKX+3W/JoiTYmfxda5gm3BdPwLQO+jWY3Psq+YA7emSy6A5dEYsbiQNeayEtdmOOuCu0XU+KYyzuRiiN/ltb1BktGHfs3GUQD3neuDFsGr7+EZfjSZQHd1kzpW5P53BBcVbpSMXRdXG7GrwE9T2F2pNIvPJlij5kLQ+Q23X2ldo0WCXAvBkEtDywh1vugWLypt3dWBJzp0B5FwLTiwT7gmXn6v6cXXhJEt2Rew25S2/vzXpy9L+fM+h5e3V8xHpgspJBL+cCPT8hGObMgmZu4KT2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stedXO0+eqT7zbb2V7pJqFPa6RrsSXoeZl8uoziC7WI=;
 b=i6CiIept4jN1WYPC8ztmDaGmJNoIBh4BWISYLKnHma1fHaFjULmzAN8EFxeugvMZ/pmDGL3KbaqmR476q9KsjJtzvdyMOzZMxBc6CNmLnXRBX0ilq4kFBQN5G88Fp0hzpvFX8OI+xkVCGqzZqihE7KUy2+xoK0oBar/361rYB6LVzBixlXXG1dmkla429MPQi0h6yZ/ALyoOnK2n4XfqFJ3OnjWupUNogsCxE7X+e5n9GqsphhXvhL1kOWLYxcwzJmUwZ45OYBfi3C5G26hKg2fxf7EkL39kQqrxcxYkVNlQsGru0SAfssInnj6NmBPf+wgDn/XiTp47XLdxQzhn1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3170.namprd18.prod.outlook.com (10.255.137.144) by
 BY5PR18MB3348.namprd18.prod.outlook.com (10.255.136.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.14; Mon, 16 Dec 2019 05:47:48 +0000
Received: from BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::5967:dfe8:c14:808e]) by BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::5967:dfe8:c14:808e%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 05:47:48 +0000
From: Jin Nan Wang <jnwang@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] Xen missing prompt log when exec-sp=off
Thread-Index: AQHVs9RYvDJGD9d8eEizxnHO4Wu68w==
Date: Mon, 16 Dec 2019 05:47:48 +0000
Message-ID: <20191216054728.12845-1-jnwang@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0078.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::18)
 To BY5PR18MB3170.namprd18.prod.outlook.com
 (2603:10b6:a03:1a9::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jnwang@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.24.0
x-originating-ip: [45.122.156.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bab592b-6493-46c0-c318-08d781eb7b3e
x-ms-traffictypediagnostic: BY5PR18MB3348:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB3348B4868C6545A7F6CDA739BE510@BY5PR18MB3348.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(199004)(189003)(52116002)(478600001)(6916009)(81156014)(81166006)(86362001)(36756003)(316002)(8676002)(54906003)(64756008)(66446008)(4744005)(6486002)(6512007)(66946007)(2616005)(66556008)(2906002)(66476007)(186003)(8936002)(6506007)(26005)(1076003)(5660300002)(71200400001)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3348;
 H:BY5PR18MB3170.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TSYj9tNuX1kzC7yTbH+/TbwjGbWI+mVGcMfqv0X3yWf3yKk2hbzAdga0FWbbvyX6JpQt1dRe7aRO30H4UMbVBD3czgcf04+aesWTabSEdl+5h2ykuutKv/mHzCOd5I5bvQ7eWkxjjQXXHZVJSHzbY1Gxl2EwOFkj3kEml2L0HxZPXNNhd8GjGO24rG3utzJIsJSr+9s2XBP1JV4IHKE7p+5LocohaBH8K5XR8ZhO3kkMUpFdFpdzQgTbegBoMMmPhCFGh4AA9jQyqFeL3QEUZffzQjepOhXAogjw5HvuDhD+xq4Qs/nbgEQXTTeggOn9ryTZonN1vKHOS3wHt1HfIpdK+KmKDniGUokxUoQbqSO86dQBP1nvDISNiXRn6koTiVrTDkOTkJUBVhguoTqg1b1Ug+7IapTm985FzmdnVIubZtC/2CVvNJK10X0gXVL7
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bab592b-6493-46c0-c318-08d781eb7b3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 05:47:48.5340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B7SXGIF+V1tZkUjo1JGMm2536ET+QGT7yGzua3rjOYZFhGsit4VZ5+7KY8NY/3rg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3348
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH] Xen missing prompt log when exec-sp=off
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
c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIHwgNCArKystCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwppbmRl
eCA3OTcwYmE5M2UxLi45YzFmMGY2NDVkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3Zt
eC92bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwpAQCAtMjQ5OSw3ICsyNDk5
LDkgQEAgY29uc3Qgc3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSAqIF9faW5pdCBzdGFydF92bXgo
dm9pZCkKICAgICAgICAgewogICAgICAgICAgICAgLyogRGVmYXVsdCB0byBub24tZXhlY3V0YWJs
ZSBzdXBlcnBhZ2VzIG9uIHZ1bG5lcmFibGUgaGFyZHdhcmUuICovCiAgICAgICAgICAgICBvcHRf
ZXB0X2V4ZWNfc3AgPSAhY3B1X2hhc19idWdfcHNjaGFuZ2VfbWM7Ci0KKyAgICAgICAgfQorICAg
ICAgICBpZiAob3B0X2VwdF9leGVjX3NwID09IGZhbHNlKQorICAgICAgICB7CiAgICAgICAgICAg
ICBpZiAoIGNwdV9oYXNfYnVnX3BzY2hhbmdlX21jICkKICAgICAgICAgICAgICAgICBwcmludGso
IlZNWDogRGlzYWJsaW5nIGV4ZWN1dGFibGUgRVBUIHN1cGVycGFnZXMgZHVlIHRvIENWRS0yMDE4
LTEyMjA3XG4iKTsKICAgICAgICAgfQotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
