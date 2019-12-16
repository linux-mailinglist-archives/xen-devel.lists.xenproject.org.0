Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BB11205CD
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 13:32:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igpVw-0003qj-Fb; Mon, 16 Dec 2019 12:30:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wy9o=2G=suse.com=jnwang@srs-us1.protection.inumbo.net>)
 id 1igpVu-0003qe-C4
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 12:30:14 +0000
X-Inumbo-ID: ca17b8fa-1fff-11ea-9398-12813bfff9fa
Received: from m9a0014g.houston.softwaregrp.com (unknown [15.124.64.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca17b8fa-1fff-11ea-9398-12813bfff9fa;
 Mon, 16 Dec 2019 12:30:13 +0000 (UTC)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0014g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 16 Dec 2019 12:29:19 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 16 Dec 2019 12:11:02 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 16 Dec 2019 12:11:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R49sTPcPoeeOTTBxaQUWk0YIj8kORlVo8F5XsNH/1V1os5DtlkuPJr5eBUg29xTrglwXdLxdwt7ZYGNovnlp3PKjabGxztRBXOeJjvX0iEbw/Icfdp+83L7+c3keDpff/piOCjDD3YaukXc4HS7LIDPnpuFNXBPATOOqpvMSY+21nERPQJ2ifghX4JiZz0GfV90CvD7H7rKsGdPqjMfJoiRkM+f8kle0yyklJNFHJaMsCIwpmAa01zvyrfMNzutbzsFTnCKM9Iq5YvEN0hnQi7hXhGdT1fgY1rUO6p3YREI3QI8gAZKMG3Vo7VxnYPLd93YlQRJ4JbAvCVkMBpQ84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEMoEYSj0bfFmSSEcDY6zPpRGtK000+/NYonGTTZXeQ=;
 b=l2O5Dypw9kedHLer3uzEZb+q2J6ZN71FPURqUx5ij1PusqDlHqQm6LXX6gzcsl7LHOyHqRn9pcL6K8RnPai8zSCCwHlwT4OPzrQuwFsUSVp8SYzdhd5y90d4AC1/n5SICkhEjnnoLkZLNmV9j81YPoLx3lREtDYLce4/1AAYJoiPI3xZ82rP7px3g+C0yrN1/f1vtL1QU+ngc5I8ilgpp4ZQrrn7HCMmc1iAjCWFtiA8CG9UGinK3e6KQjgRI9ykUPw0ARIscwSlcqv+rBpxF3V3beeQuOfrVW7thmtgi3ZHFRUXYvvBmL+XOooF38mwTM7Pv2RPPWY0BCXmcPX/rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3170.namprd18.prod.outlook.com (10.255.137.144) by
 BY5PR18MB3377.namprd18.prod.outlook.com (10.255.139.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.19; Mon, 16 Dec 2019 12:11:01 +0000
Received: from BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::5967:dfe8:c14:808e]) by BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::5967:dfe8:c14:808e%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 12:11:01 +0000
From: Jin Nan Wang <jnwang@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4] Xen missing prompt log when exec-sp=off
Thread-Index: AQHVtAnikBKl2+3ElEG70BBPpmH8nw==
Date: Mon, 16 Dec 2019 12:11:01 +0000
Message-ID: <20191216121023.30237-1-jnwang@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SG2PR0401CA0011.apcprd04.prod.outlook.com
 (2603:1096:3:1::21) To BY5PR18MB3170.namprd18.prod.outlook.com
 (2603:10b6:a03:1a9::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jnwang@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.24.0
x-originating-ip: [45.122.156.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd94af22-f1ba-413e-705e-08d782210459
x-ms-traffictypediagnostic: BY5PR18MB3377:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB33779089F263F972C94B3F58BE510@BY5PR18MB3377.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(199004)(189003)(64756008)(8676002)(66476007)(66556008)(54906003)(66446008)(6512007)(4326008)(71200400001)(2616005)(36756003)(6486002)(8936002)(1076003)(86362001)(66946007)(316002)(26005)(186003)(6916009)(5660300002)(6506007)(81166006)(81156014)(52116002)(2906002)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3377;
 H:BY5PR18MB3170.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5gZLjvJq1ENykgvvRqF5mhh6zrdGswUWCYS2KWFnaTz9X0XkYbRK2W/knZ2uXCRkIdMc1vFhQmCdWKF9MZa185JtkG7zWGg49l9FjgCcsO3E8y3EkcCc/Xfd8je+/gDacK11izzogkw4x5cIBexw0YjbeXMFBcvOfIutv3fN7fN4CsKmqwHnGLeDSqbMUV+S1ygGB/NBXCZnyk/gN+uVxv6NDJYTq+wnjqP7oux3OzBmqEKake7zDJx8LN/nDMtF13zbGQPUgbyLtPpzoxd9ZDukVkfTzs88aXvTtP4YinM4I5oXyDxydeleZG2Bg/sLNwoK+4Ss4nDll6JvxQGJyDnWZGYW5d8hNB1ZiZzZOxwJtRq+gkLGaEcisupSxijlxsmAHPUSIuqfWr3M3yo2gFpCX947XmY/W/0NpLq1QEYJtSxd22GvSg07CCSz5Zzd
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fd94af22-f1ba-413e-705e-08d782210459
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 12:11:01.7384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qgqfpaiwDVkBGwWqGzCbi/5hd//yMr3UIqYaAPQYuY/kTWLl+qSvsXX0bkSrCXQO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3377
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4] Xen missing prompt log when exec-sp=off
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
cm9tcHQKbG9nIGluIGRtZXNnLgoKQXQgZGVmYXVsdCwgeGVuIHdpbGwgdGVsbCAiVk1YOiBEaXNh
YmxpbmcgZXhlY3V0YWJsZSBFUFQgc3VlcnBhZ2VzCmR1ZSB0byBDVkUtMjAxOC0xMjIwNyIuIFdo
ZW4gdXNlciBhZGQgJ2VwdD1leGVjLXNwPW9mZicgb24gY29tbWFuZC1saW5lLgpUaGUgcHJvbXB0
IGlzIGRpc2FwcGVhcmVkLiBUaGlzIGNhbiBnaXZlIHVzZXJzIHRoZSBpbGx1c2lvbiB0aGF0IHRo
ZQpmZWF0dXJlIGlzIHR1cm5lZCBvbi4KClNpZ25lZC1vZmYtYnk6IEphbWVzIFdhbmcgPGpud2Fu
Z0BzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyB8IDEwICsrKysrLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3Zt
eC92bXguYwppbmRleCA3OTcwYmE5M2UxLi45ZGNiMTAwMjEwIDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvaHZtL3ZteC92bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwpAQCAt
MjQ5NSwxNCArMjQ5NSwxNCBAQCBjb25zdCBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxlICogX19p
bml0IHN0YXJ0X3ZteCh2b2lkKQogICAgIHsKICAgICAgICAgYm9vbCBjcHVfaGFzX2J1Z19wc2No
YW5nZV9tYyA9IGhhc19pZl9wc2NoYW5nZV9tYygpOwogCisgICAgICAgIC8qIERlZmF1bHQgdG8g
bm9uLWV4ZWN1dGFibGUgc3VwZXJwYWdlcyBvbiB2dWxuZXJhYmxlIGhhcmR3YXJlLiAqLwogICAg
ICAgICBpZiAoIG9wdF9lcHRfZXhlY19zcCA9PSAtMSApCi0gICAgICAgIHsKLSAgICAgICAgICAg
IC8qIERlZmF1bHQgdG8gbm9uLWV4ZWN1dGFibGUgc3VwZXJwYWdlcyBvbiB2dWxuZXJhYmxlIGhh
cmR3YXJlLiAqLwogICAgICAgICAgICAgb3B0X2VwdF9leGVjX3NwID0gIWNwdV9oYXNfYnVnX3Bz
Y2hhbmdlX21jOwogCi0gICAgICAgICAgICBpZiAoIGNwdV9oYXNfYnVnX3BzY2hhbmdlX21jICkK
LSAgICAgICAgICAgICAgICBwcmludGsoIlZNWDogRGlzYWJsaW5nIGV4ZWN1dGFibGUgRVBUIHN1
cGVycGFnZXMgZHVlIHRvIENWRS0yMDE4LTEyMjA3XG4iKTsKLSAgICAgICAgfQorICAgICAgICBp
ZiAoIG9wdF9lcHRfZXhlY19zcCApCisgICAgICAgICAgICBwcmludGsoIlZNWDogRW5hYmxlIGV4
ZWN1dGFibGUgRVBUIHN1cGVycGFnZXNcbiIpOworICAgICAgICBlbHNlIAorICAgICAgICAgICAg
cHJpbnRrKCJWTVg6IERpc2FibGluZyBleGVjdXRhYmxlIEVQVCBzdXBlcnBhZ2VzIGR1ZSB0byBD
VkUtMjAxOC0xMjIwN1xuIik7CiAKICAgICAgICAgdm14X2Z1bmN0aW9uX3RhYmxlLmhhcF9zdXBw
b3J0ZWQgPSAxOwogICAgICAgICB2bXhfZnVuY3Rpb25fdGFibGUuYWx0cDJtX3N1cHBvcnRlZCA9
IDE7Ci0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
