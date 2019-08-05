Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB8582163
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 18:11:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hufWw-0001a9-Ip; Mon, 05 Aug 2019 16:08:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hufWv-0001a4-3c
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 16:08:13 +0000
X-Inumbo-ID: 36d8deb0-b79b-11e9-831b-d74e0c6bad96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36d8deb0-b79b-11e9-831b-d74e0c6bad96;
 Mon, 05 Aug 2019 16:08:08 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 16:08:01 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 16:06:29 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 16:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNgPa83Xn3D2lggedmyAH6j/YNS1fxiWHkjfyOVITO+v+dFHPB1XModoOL+MgopYgh6jBCMv6Vq9yzf0MI50/wQjmISqD5zrs+983A+FQdDJGNXzLXzirhpRL+RjZOuABZBv/lf6sd4VFapf6D+/mEnG22wq8ZD2xmFyKNM1cyT6q8qRR4z4eBZuqlo3fkgRqcu/sSRoE4C9fgafLjyUQPcGF8ZLtq+ZJGgvDhohhlLAzSGTkdHEhaiTiEs5BUEOFCQRKidq1ZnmwGOH+54d4rCzjoRzczFB/yHBnYju1J2T8xnHsPStvPhzyhCjlEgGa6cCuf0/oHRvwwI6fo5kog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZLJ8AF6iY+RvsdZIQemxAfwPhhKe7w4nmwOso/n2z8=;
 b=koQFkWWN1c3waLf7x0QvQFjpSRuj7On+20HUOZhB5AoCU3xErOvx9zF4WBQM32VS3n65aHsO0coRqDU0LMBdHsxSS6pYTsl78LK6ae7Hp8IldF7RyEDSQMFkBgyIPAtOigs0J0h/ILlsFkWOndqTt0I+TnonjwbA1ublUhdp+k6ZWBn5UvhMFb+/Q/I8rX/xV1mkg6iQuQHVrkJc2YY+LD5lhRW97iib4Qrl3bOAhLh9/GFkzLGNG++KB1npFo+8wq5UnTNf4x+v6OXOVJV+2dTWnF5CdrIoDY6ucQijp010vaPY+jHn7INX7fWlTGwQO++QCUFpmP9YuSM7331enQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2495.namprd18.prod.outlook.com (20.179.83.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Mon, 5 Aug 2019 16:06:28 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 16:06:28 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] x86/shim: Fix parallel build following c/s
 32b1d62887d0
Thread-Index: AQHVS5VCLsUfjjNYSkSWxIawZ+ErEabsuEeA
Date: Mon, 5 Aug 2019 16:06:28 +0000
Message-ID: <e5851547-a785-4613-ab04-1e822bc23e79@suse.com>
References: <20190805135335.7812-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190805135335.7812-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:208::36) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8cd3e629-508f-4ccd-c3ed-08d719bedf5e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2495; 
x-ms-traffictypediagnostic: MN2PR18MB2495:
x-microsoft-antispam-prvs: <MN2PR18MB2495E5D25149CC1821C9470CB3DA0@MN2PR18MB2495.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(199004)(189003)(80792005)(71190400001)(68736007)(6916009)(5660300002)(316002)(54906003)(486006)(81166006)(446003)(305945005)(66066001)(478600001)(25786009)(8676002)(81156014)(14454004)(186003)(256004)(66476007)(2616005)(86362001)(11346002)(66946007)(4744005)(31696002)(66446008)(476003)(66556008)(36756003)(64756008)(3846002)(31686004)(6486002)(53936002)(99286004)(6116002)(2906002)(229853002)(6512007)(6436002)(52116002)(386003)(71200400001)(53546011)(6506007)(76176011)(26005)(6246003)(102836004)(4326008)(7736002)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2495;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /k893fA89LYA8gdGAx6ku0Gu+B5T1yW6ZLa/hYPSrcz7IVl76oSdlL5oOylsaJnZTg3qGzmSKrQ1nnxt1X3KQdlNmhH9TpeeiJfp0RHdspq6+WQi/RbliJTZ6Y/EJrXvNicBEeBd8AN8GyDY9Yfeznn/kOdjdeWKFU/KQ2ljany7JvWylJ5WMeqY8aBsZnHK3eTucXcGst0pOk6ug0ADs2jyeAXm2NlCdLQuVFy9sFNgPbcc5l0m0Qt/eJm3Xe0frNJatCudNl96crJnxd+Q2rLRDb5fQhDurl8I944IgrjfIToJH4k32qUUuMK/i8EpTnkkdNswv1iEMoDW/pCaE4xNQZsgP5+zO727ybo2SEZWuP2re1N9AFkMWuU489XAD0GmV7vrg3zyqZFtHT+fo1T77Xj1ArBNEHRa1k0P6PI=
Content-ID: <D342D9495C240B46986ADD075310CFA9@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd3e629-508f-4ccd-c3ed-08d719bedf5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 16:06:28.0563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2495
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/shim: Fix parallel build following c/s
 32b1d62887d0
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxNTo1MywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gLS0tIGEvdG9vbHMv
ZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZQ0KPiArKysgYi90b29scy9maXJtd2FyZS94ZW4tZGly
L01ha2VmaWxlDQo+IEBAIC0zOCw3ICszOCw3IEBAIGxpbmtmYXJtLnN0YW1wOiAkKERFUF9ESVJT
KSAkKERFUF9GSUxFUykgRk9SQ0UNCj4gICAJCX0NCj4gICANCj4gICAjIENvcHkgZW5vdWdoIG9m
IHRoZSB0cmVlIHRvIGJ1aWxkIHRoZSBzaGltIGh5cGVydmlzb3INCj4gLSQoRCk6IGxpbmtmYXJt
LnN0YW1wDQo+ICskKEQpICQoRCkveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZp
ZzogbGlua2Zhcm0uc3RhbXANCj4gICAJJChNQUtFKSAtQyAkKEQpL3hlbiBkaXN0Y2xlYW4NCj4g
ICANCj4gICAkKEQpL3hlbi8uY29uZmlnOiAkKEQpICQoRCkveGVuL2FyY2gveDg2L2NvbmZpZ3Mv
cHZzaGltX2RlZmNvbmZpZw0KDQpCdXQgdGhpcyB0aGVuIGFsbG93cyB0d28gaW5zdGFuY2VzIG9m
ICIkKE1BS0UpIC1DICQoRCkveGVuIGRpc3RjbGVhbiINCnRvIHJ1biBpbiBwYXJhbGxlbCAtIG5v
dCBzdXJlIGhvdyB3ZWxsIHRoYXQgd291bGQgd29yay4gSSB0aGluayB3aGF0DQp3ZSB3YW50IGlu
c3RlYWQgaXMNCg0KJChEKTogbGlua2Zhcm0uc3RhbXANCiAgCSQoTUFLRSkgLUMgJChEKS94ZW4g
ZGlzdGNsZWFuDQoNCiQoRCkveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZpZzog
JChEKQ0KDQokKEQpL3hlbi8uY29uZmlnOiAkKEQpL3hlbi9hcmNoL3g4Ni9jb25maWdzL3B2c2hp
bV9kZWZjb25maWcNCi4uLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
