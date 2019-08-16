Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EABA90480
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 17:15:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hydu9-0001mt-3c; Fri, 16 Aug 2019 15:12:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jd8M=WM=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1hydu7-0001mo-Ak
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 15:12:35 +0000
X-Inumbo-ID: 43d8b22a-c038-11e9-8bb8-12813bfff9fa
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43d8b22a-c038-11e9-8bb8-12813bfff9fa;
 Fri, 16 Aug 2019 15:12:34 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 16 Aug 2019 15:11:54 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 16 Aug 2019 14:57:34 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 16 Aug 2019 14:57:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpRFPoU8elpJ+/P43k0dGMDehhBop222fVuioZiv6WWGlPvdnk1rEpH9sU/d/9AyIDD64YzggPaeqx6v9DpIoQZVkfP+A4oLWvceZXQFDPvtG0V0wge/dY12pFNZQh4aZQY8AXYwxtE9Wx92sl94elm2H5myuKHlHeXJE0MtTTcYdRAEffSmjeMbyT2r3X6wI1nqyCb+57nVt3Ls7kT4w4BrqSpD/XWvASLiqJmasZNn0phxL/wT2t3GnKtPyBs+L9JYb+QMliAYzaGuQ0o5L6+pb5sogHNPSIGBbSAqFYJBtYJuSZ7wigznBNikVATxXcOy7ct2463XGviMfKlTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2hWqqJ+SghHypunDPViKbRTFAvkBV054E6opudPFkE=;
 b=abRfy81BjrtZNidvFvdQMS6fiPOoQWqlCj/HK4Mj2xkjeTxMO6jwYED7yeAmU8sme6Fh3kktHgtFk/B4jfInyjc1+3xB7B6gsyEpHTKpO1mMVbsmqHvqhMN+yCQVOBzhLh46Ucl22zfCTrEySQITEEhchbkYC3ZqLEme1O0poe6sXXX9jTMB+I2G8jVnrCtssbaqn9QaENwqCY4sIjtpKDgq8G9sWOhsL1urgpPBSoEnjDeVBHteEpfT7Spmh2t8gaCoDF7Dnm+d2WJN9ctd9NBLaoTj+gmjGBbzH4/fk6BeZUDLgsHd1YgPYPb/EMd332C5b3OhOjuKFGr5hMUlbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3315.namprd18.prod.outlook.com (10.255.139.204) by
 BY5PR18MB3156.namprd18.prod.outlook.com (10.255.138.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 14:57:32 +0000
Received: from BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::4408:ba97:cbe0:616a]) by BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::4408:ba97:cbe0:616a%6]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 14:57:32 +0000
From: Jim Fehlig <JFEHLIG@suse.com>
To: osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [libvirt test] 140186: regressions - FAIL
Thread-Index: AQHVVDLiLUjWXDFLUUiVROc4q7HZ9ab93XOA
Date: Fri, 16 Aug 2019 14:57:32 +0000
Message-ID: <d3ed7743-577e-05c3-719e-2f0a93406799@suse.com>
References: <osstest-140186-mainreport@xen.org>
In-Reply-To: <osstest-140186-mainreport@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0095.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::36) To BY5PR18MB3315.namprd18.prod.outlook.com
 (2603:10b6:a03:196::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JFEHLIG@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [192.150.157.152]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbc553c4-9766-4848-f646-08d7225a10f7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BY5PR18MB3156; 
x-ms-traffictypediagnostic: BY5PR18MB3156:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BY5PR18MB31564A6CF57F80D0BBEC7FC2C6AF0@BY5PR18MB3156.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:115;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(189003)(199004)(6116002)(71200400001)(110136005)(2906002)(476003)(256004)(316002)(6512007)(6436002)(3846002)(31696002)(66066001)(8936002)(71190400001)(6306002)(7736002)(66946007)(66446008)(305945005)(66476007)(64756008)(66556008)(11346002)(53936002)(486006)(446003)(2616005)(25786009)(4744005)(81166006)(229853002)(26005)(53546011)(36756003)(81156014)(186003)(6506007)(86362001)(102836004)(386003)(966005)(31686004)(6246003)(5660300002)(478600001)(8676002)(14454004)(6486002)(99286004)(52116002)(76176011)(2501003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3156;
 H:BY5PR18MB3315.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uaXvTcBE5ETCP5SdY7XFm52f4LWJ0K2Z1+P0EZPr67t4x9Sxn2yarR9XUJwooOlmRcnttVvYRvnrqw6SWvD0vJ1N6NQNJG2zwp+jJSILjxJjcVmmmu/kyBnhE2qRBDAFYvMXEkqk9AFJfv/0mZ/BdDl5L+RLkE452maQ9PJfT5OG+0MNGt0/YIFLmUmp7tjqWCH6v9c8AyHBbrEusbw/R6GCJOUCclabUptv1RpxQ4Ke6ZkwXXw3GvYDjv21l6Hjh0yAuNgrOY41dJRiI9jcyC4fN290LQyirLyMCPbqOyLrt67WBEtNLWPpon14gc/NmN6knOuHhdiRoYQDPb4R2a5JeWEYNH57n7+o2BBkKi9pVLvrVMqUF5fjQIonaFav3nPuk+PF40iUg5BvAjen8DHDZ3kHPB/4cpvNRxMxAKM=
x-ms-exchange-transport-forked: True
Content-ID: <7DA8FE7BD47D8046BACF7A6F9ECC7416@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc553c4-9766-4848-f646-08d7225a10f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 14:57:32.6289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ttNwBkfKkzwQAag1wbakP70uz1pS5Y7YGAEFnlQa1cL067VoUn6fhAdkEd16w3HGbhHDBuTjafw8Fg95omDd+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3156
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [libvirt test] 140186: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNi8xOSA3OjAxIEFNLCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6DQo+IGZsaWdo
dCAxNDAxODYgbGlidmlydCByZWFsIFtyZWFsXQ0KPiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5w
cm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQwMTg2Lw0KPiANCj4gUmVncmVzc2lvbnMgOi0oDQo+
IA0KPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywNCj4gaW5j
bHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46DQo+ICAgYnVpbGQtYW1kNjQtbGli
dmlydCAgICAgICAgICAgNiBsaWJ2aXJ0LWJ1aWxkICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4g
MTM5ODI5DQo+ICAgYnVpbGQtaTM4Ni1saWJ2aXJ0ICAgICAgICAgICAgNiBsaWJ2aXJ0LWJ1aWxk
ICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTM5ODI5DQo+ICAgYnVpbGQtYXJtNjQtbGlidmly
dCAgICAgICAgICAgNiBsaWJ2aXJ0LWJ1aWxkICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTM5
ODI5DQo+ICAgYnVpbGQtYXJtaGYtbGlidmlydCAgICAgICAgICAgNiBsaWJ2aXJ0LWJ1aWxkICAg
ICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTM5ODI5DQoNClNob3VsZCBiZSBmaXhlZCBub3cgYnkg
Y29tbWl0IDNiN2M1YWI5DQoNCmh0dHBzOi8vbGlidmlydC5vcmcvZ2l0Lz9wPWxpYnZpcnQuZ2l0
O2E9Y29tbWl0O2g9M2I3YzVhYjk4M2Y0NjU1YWUwMmI4YWY0NTE3ZDg5ODM5NTMwZWU1Zg0KDQpS
ZWdhcmRzLA0KSmltDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
