Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50826790AC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:20:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs8ML-0007zf-Uc; Mon, 29 Jul 2019 16:18:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs8MK-0007zY-Oj
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 16:18:48 +0000
X-Inumbo-ID: 8a8ed091-b21c-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8a8ed091-b21c-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 16:18:47 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 16:18:47 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 15:57:14 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 15:57:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fP+PntkOeIc2ijVC+HsiYVE6iN3DBbRm2/AZCKqM7Y6qi8H2kT6JIoGn+nBFMcNItAih1T8/QgGgNu3PJpPh3lgNPK27fw3s8YC1dS3BGvaakZY/Ks2QhIttD6W2YGDt7wO3qrCeV7VOpyXsTDXMYj3BbK0uFstvfYdLPk3O19ER4gMljBiSIY/QmixZ1Eqr8zhPm5SFRe1os1N9PYam6x8+7JucX2qqyAfJI1U4lBFJDyOBcrLMf81FSvL6wKJ7m9ZUEMOyHT+7uF62KiIte9EBDaweD8plfGXVYyNsLts+BXZrG9aZTQvkV1vJcwP6f9xUdAs+uz4DQ7qKoXpl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35/jrHJXwfmEAu2shWpvsryFzeN6AadXwRChQAHmPOU=;
 b=lMVaT4+LqUkqBBEF8WitTleG9reWePjsEfeXQAZV6PxjVcAeh3ZjnQC11FP0E/Ie1VPA8tvjQ/CxiIUJi1YofgF0Svgtg9Wma5n+fI7wXu2T4GUVL5CtmjC81QFh5knKrQJ7iwAMvbrMfSg65pofxbrplEfEFrYQ6M+TldUD8BaCDOJlayMou5CMNdqD/bCFke/oBHtRaPXRO1z8DBFwDJgLRE/RqrH/10T3f3QHePcapYJx/0H9bMTzytrc4BiY5uQR2Tcd3mEfOjy99YEFUlEcmniTzdHoqi0Ll5lTN150B4SMtZKvuzSdQoaKz3MjpANKrPO7LpMwWyLnxdhnFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3412.namprd18.prod.outlook.com (10.255.136.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 15:57:13 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 15:57:13 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] xen: Avoid calling device suspend/resume
 callbacks
Thread-Index: AQHVRiQr6DrMZ4ncf0iQGv5Hre+VmqbhwEEA
Date: Mon, 29 Jul 2019 15:57:13 +0000
Message-ID: <d9cb90b9-1d58-9514-0f35-0c1dbb1476be@suse.com>
References: <20190729154112.7644-1-ross.lagerwall@citrix.com>
In-Reply-To: <20190729154112.7644-1-ross.lagerwall@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::14)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6a2e810-1202-4b6d-c879-08d7143d6bc1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3412; 
x-ms-traffictypediagnostic: BY5PR18MB3412:
x-microsoft-antispam-prvs: <BY5PR18MB341284421C33C1C690E0D2CCB3DD0@BY5PR18MB3412.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(199004)(189003)(76176011)(26005)(53546011)(6506007)(386003)(66066001)(8936002)(5024004)(14444005)(256004)(71190400001)(71200400001)(2906002)(478600001)(31696002)(486006)(476003)(3846002)(446003)(186003)(6916009)(4744005)(68736007)(52116002)(86362001)(81166006)(81156014)(102836004)(14454004)(8676002)(99286004)(2616005)(6116002)(7736002)(11346002)(6512007)(53936002)(66446008)(66946007)(66476007)(66556008)(64756008)(4326008)(54906003)(6486002)(15650500001)(36756003)(6246003)(6436002)(305945005)(107886003)(25786009)(5660300002)(31686004)(229853002)(80792005)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3412;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ix6nvJfbYAG1PozXJ5h1oLp1JGHhPdSw7ocFd/yqQ8m5nEIkJFgdEGmnBmY/djJq2W/zIWEO7RCCee2UitAcLh8Er79JoWrLQSLaovTt0ECTzar1Ixi3PJltu5qMkjsOoVhB3W5lyD2YEhW8ZhbWOvLc1Mhx+ut6S6T9R1cVAeOmRFg9k9T9oa+m2G7wcbNdtfa3K+XuZDdy86MQtU+Xd1SohHh4zAdyBRZYfILplJX7YIe8cTkZWS4JS6oLu1j9WJttra7q4LqaeK1dz9RVfhh5GGjd0PkZmsMhYXDA0Muw5G3nIrYM2Fjd8aFfWXKuJEYNO6XV2uJu9lwSo6VDEjfsXXxxLxJY8YLZqe5pFSKBFH+hmTRhs895zMRWsVx87s+mLPw6tcsLTloubvszNVX1dA9uqvTOwNeo+IuwDsw=
Content-ID: <BC08A7D1E87365469F33D404149E4DED@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a2e810-1202-4b6d-c879-08d7143d6bc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 15:57:13.3384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3412
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] xen: Avoid calling device suspend/resume
 callbacks
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
Cc: Juergen Gross <JGross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxNzo0MSwgUm9zcyBMYWdlcndhbGwgd3JvdGU6DQo+IFdoZW4gc3VzcGVu
ZGluZy9yZXN1bWluZyBvciBtaWdyYXRpbmcgdW5kZXIgWGVuLCB0aGVyZSBpc24ndCBtdWNoIG5l
ZWQNCj4gZm9yIHN1c3BlbmRpbmcgYW5kIHJlc3VtaW5nIGFsbCB0aGUgYXR0YWNoZWQgZGV2aWNl
cyBzaW5jZSB0aGUgWGVuL1FFTVUNCj4gc2hvdWxkIGNvcnJlY3RseSBtYWludGFpbiB0aGUgaGFy
ZHdhcmUgc3RhdGUuIERyb3AgdGhlc2UgY2FsbHMgYW5kDQo+IHJlcGxhY2Ugd2l0aCBtb3JlIHNw
ZWNpZmljIGNhbGxzIHRvIGVuc3VyZSBYZW4gZnJvbnRlbmQgZGV2aWNlcyBhcmUNCj4gcHJvcGVy
bHkgcmVjb25uZWN0ZWQuDQoNCklzIHRoaXMgdHJ1ZSBmb3IgdGhlIGdlbmVyYWwgcGFzcy10aHJv
dWdoIGNhc2UgYXMgd2VsbD8gV2hpbGUgbWlncmF0aW9uDQptYXkgbm90IGJlIChmdWxseSkgY29t
cGF0aWJsZSB3aXRoIHBhc3MtdGhyb3VnaCwgaWlyYyBzYXZlL3Jlc3RvcmUgaXMuDQpXb3VsZCBx
ZW11IHJlc3RvcmUgc3RhdGUgb2YgcGh5c2ljYWwgUENJIGRldmljZXM/DQoNCkphbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
