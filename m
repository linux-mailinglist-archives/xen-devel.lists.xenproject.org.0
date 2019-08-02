Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 519137F917
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 15:26:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htXXY-0000mC-MF; Fri, 02 Aug 2019 13:24:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htXXX-0000m5-3u
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 13:24:11 +0000
X-Inumbo-ID: cf047045-b528-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cf047045-b528-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 13:24:09 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  2 Aug 2019 13:24:08 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 2 Aug 2019 13:23:02 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 2 Aug 2019 13:23:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9fykoxnBFcz8F4QKt+uGO4rbRUaRpir59pLZKJzysn3//NkeWK+akBe8CUHKwonM14pOx/Y5ZbduN6dz00re4MaYvGKUhixZCAYMx9wKBrTBJI0Zff0xywJ9mfjOWBxfgGB2XD2OgynL7VlerqmcR13uxpFZXBbEZiKn6V3fINvU3+NnIFpvsVb1ZQuLtDBM9EanOj2Rg3IgPe8HRhZk1E5pu3LJ6PLAWTKvmxoJ7ccuMbYwN3WKW4E2++bsXoj2vdzKKHNyytiTLkTVkg5FCSNzxvU5eRT0pZkLglVkcq8Rmxj/bP1ka68t1srFbyEUn9Tw456c1sH6PJDedDR9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5q+xLRm3TlAN+fNfIJRjBfsZnKRmdnnqBzR38x7ohe4=;
 b=gs9zKhKORvxmY2cqIZkh4XVXxpGKmzNjAKwKB416oXGI6JmeeN7mrVkDFyYQbeG6Y7CYuwi66T0wid4hmsccTdBEGEYrCdunGUA9yEaFmIr9WgtCHCjCDXmApOcMHh0elrhns45sKZRP8EUsBlE/dxjodmQJ0/rGjPzsAb9A2s1l0eFMdNscoUSZUR8Z39Tuq5SOY3ljeirt4P8Amub2XrYsrRg56h++MCbtdJtzBl0ENhOqXDyKA20T35y5eJQS+Sp69m/Q31CaNYc+ABKKK5brTxzNGIH7nnSc4BLDNMJLrAfJJCljUcMY4L6zQSnHBRGuZh6syRRe8ws1agkzBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2811.namprd18.prod.outlook.com (20.179.50.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Fri, 2 Aug 2019 13:23:02 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 13:23:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
Thread-Topic: [PATCH v8 02/16] x86/microcode: always collect_cpu_info() during
 boot
Thread-Index: AQHVSFKO7GI4Aqr1BU6qD1RLqn3Jhqbn2igA
Date: Fri, 2 Aug 2019 13:23:02 +0000
Message-ID: <7c73b5a3-0285-9a88-60a1-50d960897688@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-3-git-send-email-chao.gao@intel.com>
In-Reply-To: <1564654971-31328-3-git-send-email-chao.gao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR10CA0032.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::12) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39572d27-5afb-4404-c3ed-08d7174c8b4a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2811; 
x-ms-traffictypediagnostic: DM6PR18MB2811:
x-microsoft-antispam-prvs: <DM6PR18MB28117052107CD79A51254360B3D90@DM6PR18MB2811.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(189003)(199004)(4744005)(6506007)(229853002)(54906003)(110136005)(6512007)(6436002)(6116002)(3846002)(80792005)(2906002)(476003)(2616005)(99286004)(478600001)(53936002)(446003)(11346002)(305945005)(86362001)(36756003)(68736007)(31696002)(7736002)(81156014)(6246003)(31686004)(5660300002)(256004)(66066001)(71200400001)(64756008)(66476007)(26005)(66556008)(66446008)(102836004)(81166006)(8936002)(186003)(66946007)(71190400001)(8676002)(14454004)(4326008)(316002)(486006)(52116002)(14444005)(25786009)(53546011)(6486002)(76176011)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2811;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6b59zXX+KBoQPQaNDVx2MJKt/m2iute9ed9BYxmdKdd/Gs0TxKJoLiK2cz44XQhs8dTMo88E/3tBwsRwYbCmLSFeIdRG2gH6k0MwTzHjmTLuOExgQrzobM4f6S1UGzCx1UFNyNWe49GoMbdYPUVjL2smMxWyF4agT6mC43taywVs+w343LyzLfUXyzQ0I5d4e5S02JYqhSG6ii08ymzmRUKrUyDfHPgm5BwBElSAUnq5q3GN31EqBGzALAO5dPsgdIXaPGLJ7RfCfLrfWNI2CZC2zRgMhJPoMJbs5K52OW7R9YtPq6HG+rVtpK1J2Yagsrmj9gTJQ/HLboG/26j4FjsG9VpB5X1YlCYNJlf0WfkhWH7/1Bbvyba/hYu2gCNyYnW+rnuHehR/Y1W5WvPXXXCEJxaPnchDMcNMVw8LZIQ=
Content-ID: <F39C850D66369F4290FBF26DF67FCA9C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 39572d27-5afb-4404-c3ed-08d7174c8b4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 13:23:02.0999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2811
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 02/16] x86/microcode: always
 collect_cpu_info() during boot
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
Ni9taWNyb2NvZGUuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlLmMNCj4gQEAgLTM4
MywxMCArMzgzLDE1IEBAIHN0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgbWljcm9jb2RlX3Bl
cmNwdV9uZmIgPSB7DQo+ICAgDQo+ICAgaW50IF9faW5pdCBlYXJseV9taWNyb2NvZGVfdXBkYXRl
X2NwdShib29sIHN0YXJ0X3VwZGF0ZSkNCj4gICB7DQo+ICsgICAgdW5zaWduZWQgaW50IGNwdSA9
IHNtcF9wcm9jZXNzb3JfaWQoKTsNCj4gKyAgICBzdHJ1Y3QgdWNvZGVfY3B1X2luZm8gKnVjaSA9
ICZwZXJfY3B1KHVjb2RlX2NwdV9pbmZvLCBjcHUpOw0KPiAgICAgICBpbnQgcmMgPSAwOw0KPiAg
ICAgICB2b2lkICpkYXRhID0gTlVMTDsNCj4gICAgICAgc2l6ZV90IGxlbjsNCj4gICANCj4gKyAg
ICBpZiAoICFtaWNyb2NvZGVfb3BzICkNCj4gKyAgICAgICAgcmV0dXJuIC1FTk9TWVM7DQoNCkZv
ciBwb3N0ZXJpdHkgKHJlYWxpemluZyB0aGUgcGF0Y2ggaGFzIGdvbmUgaW4gYWxyZWFkeSkgLSBJ
J20gbm90DQpjb252aW5jZWQgdGhpcyBzaG91bGQgYmUgYW4gZXJyb3IgY29uZGl0aW9uLCBidXQg
dGhlIGVycm9yDQpwcm9kdWNlZCBoZXJlIGlzIGJlaW5nIGlnbm9yZWQgYW55d2F5IGFmYWljcyAo
aS5lLiB0aGUgZnVuY3Rpb24NCmNvdWxkIGFzIHdlbGwgcmV0dXJuIHZvaWQpLiBJbiBubyBjYXNl
IGlzIHRoaXMgYW4gYXBwcm9wcmlhdGUgdXNlDQpvZiBFTk9TWVM6IFRoaXMgaXNuJ3QgZXZlbiBv
biBhIGh5cGVyY2FsbCBwYXRoLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
