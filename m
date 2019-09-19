Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09255B829E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 22:38:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB3AR-0005oO-QW; Thu, 19 Sep 2019 20:36:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZMuL=XO=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1iB3AP-0005oH-QG
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 20:36:41 +0000
X-Inumbo-ID: 2e3e7350-db1d-11e9-9675-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.94]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e3e7350-db1d-11e9-9675-12813bfff9fa;
 Thu, 19 Sep 2019 20:36:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iq+EvIZXM1OB0tpWrQgmj9hXCND/v1BEJiblQWN53NiiGKe9zmHAjMfd1YZJA+I8bNVC7/R2eYMXCBMc+XfLM4PhHsabax4XlxfVHpPnc1IME+WKHl/+G65gmAsaai9ZuelCnh6RHQkRNYnzzvIQnLShTBx8k/FsTkdrq4Q988ye8VnF7ZovkW3Khdt4ZJ7ck9SMMiRkEreydK0uH+S00JRJ3I0UA1rRXTX5mqdDF6sj71MyNGZTKMX22IEQmWUd0AmcufTlPYkt7kK4Jg40BdAWcOg2wTJTXx/S6gXqPKnegSrr1v+kg/XD60hAy28qxPQ/+uAeQiFTzlom4kCKEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXb8AX3EJJkzXalH6qXR2Hb8PhXzCHNO+2QXqdnN9Po=;
 b=folY5sDzj/+pok9OAUOQJq6USDFLkX6OTgD2Qowk6j0m2hp38hH54KdfujYlriOiEyR2/NW0rNCPqFEIqO35Kuj6zccT6ijPhSjx5oP5AM0V8Goxoltxuf1wk7MG8tHQPBn8DNpi3bu1R7mVT2lDU4vU45oeEUGYEg0mFNHO4GbM21kTRLCeT9wW8/2nYHtsTW/fOWkOKz7hJ/CniWKxzwAmM6rC/8O75+eskXF9rueSWxVSIrupNK/7poH2l6pqWBMMoqnXmlzrV0jb8HHHwVrl/g3yyL2kR3vX7p1fYtHAJJ8XTr4AZR6Fscmcw7c7zAVM+P3tXi8YDnKCEXFEhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXb8AX3EJJkzXalH6qXR2Hb8PhXzCHNO+2QXqdnN9Po=;
 b=GYSZOpFSlpfCvotpEe5YZ7R3/pTJLA/Sn5BuzyVTGT7B2g4Yjkg8I/ZgulOlbrVcK5RWmAhYBSWASv3zpZIeGU8mYQqtmxORYCxQhM1UZ1Z5fHSzr3/ygGQouESCjexe9bxSdHWeGXc4tUL8aQK0P//4f+WacJY4jWxlqvuuOPA=
Received: from VI1PR02MB5790.eurprd02.prod.outlook.com (52.133.244.12) by
 VI1PR02MB3087.eurprd02.prod.outlook.com (10.170.236.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.26; Thu, 19 Sep 2019 20:36:37 +0000
Received: from VI1PR02MB5790.eurprd02.prod.outlook.com
 ([fe80::c979:2ad6:63a5:dc3a]) by VI1PR02MB5790.eurprd02.prod.outlook.com
 ([fe80::c979:2ad6:63a5:dc3a%2]) with mapi id 15.20.2284.009; Thu, 19 Sep 2019
 20:36:37 +0000
From: Razvan COJOCARU <rcojocaru@bitdefender.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Beulich
 <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] SVM: correct CPUID event processing
Thread-Index: AQHVbyYpsBrcgD3+X0+1nzjP9UgLIqczdWuA
Date: Thu, 19 Sep 2019 20:36:36 +0000
Message-ID: <6c80035f-a828-0672-0421-5fb5b938937b@bitdefender.com>
References: <845737d3-e16e-61d7-7733-0f8b9eddfb45@suse.com>
 <34ef81da-628c-29f2-1020-15ea5e4bab79@oracle.com>
In-Reply-To: <34ef81da-628c-29f2-1020-15ea5e4bab79@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0140.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::24) To VI1PR02MB5790.eurprd02.prod.outlook.com
 (2603:10a6:803:12d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=rcojocaru@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.154.138]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5146a97c-8e5c-4571-a634-08d73d411141
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR02MB3087; 
x-ms-traffictypediagnostic: VI1PR02MB3087:|VI1PR02MB3087:|VI1PR02MB3087:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR02MB3087BA36BDA8532E97C6BAAFAB890@VI1PR02MB3087.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(396003)(136003)(39860400002)(376002)(199004)(189003)(81166006)(54906003)(66066001)(5660300002)(476003)(7736002)(2906002)(305945005)(316002)(76176011)(31696002)(52116002)(31686004)(446003)(86362001)(110136005)(8676002)(186003)(81156014)(26005)(99286004)(386003)(71190400001)(6506007)(7416002)(53546011)(102836004)(8936002)(11346002)(6486002)(4744005)(486006)(6512007)(14454004)(4326008)(66446008)(2616005)(64756008)(6436002)(36756003)(71200400001)(25786009)(478600001)(3846002)(256004)(229853002)(66476007)(66946007)(6246003)(2501003)(66556008)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR02MB3087;
 H:VI1PR02MB5790.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pEa43lL5/2u2gqxZGg5Gip8QdW8dkrTJB0ec7XyNOfOhbP94XsD8qEyH6MgEL3Q5bvggS2smc32lFCiVtr/qmT9ratlA2IRqpZkyJ1MpixG13EF/oEmGuxhTyn/kaUc/AbroxDIV8OoRgeXd5Z4k0fXENGBfpE7LfslYVhiGrDE5jCYgLEIYf2M8CUyFqKUjnNOiAdqJSNRfQhH0l/bQYxRFUAVinq+1w1zeHLVRa34n3X11TZsGBwm8Q0dJXCUpwq61pbUcHPvVy+oQkiv9n5Qqtqu8rhkdmw/YW/Pofz5aRtcGlPWmd9uIHWS0DWIEIcQ/4u3pjzy+JOwFD/UY1Ervdp+mxtosdXant+3IIr8TOyg+x0CfPDuqTnIPnYaavyENZAYSMjgkGS55S8zrIxBjS9c2AwrplZf8ykwoNPw=
Content-ID: <1B16A24C7277E94593CF31C9B3BD1FD3@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5146a97c-8e5c-4571-a634-08d73d411141
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 20:36:36.9749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mh2yBj5Dzeu3JkJq5QVao5i1thGoSbZXxUuaoFC81WEhISYFx9Fp7Pzwkjk9KR1/viUzKxzeslBAsBxqTTqxbil5m56W4aRlyGtJNdf2Rww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB3087
Subject: Re: [Xen-devel] [PATCH] SVM: correct CPUID event processing
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xOS8xOSAxMTowNyBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOg0KPiBPbiA5LzE5LzE5
IDY6MzcgQU0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gaHZtX21vbml0b3JfY3B1aWQoKSBleHBl
Y3RzIHRoZSBpbnB1dCByZWdpc3RlcnMsIG5vdCB0d28gb2YgdGhlIG91dHB1dHMuDQo+Pg0KPj4g
SG93ZXZlciwgb25jZSBoYXZpbmcgbWFkZSB0aGUgbmVjZXNzYXJ5IGFkanVzdG1lbnQsIHRoZSBT
Vk0gYW5kIFZNWA0KPj4gZnVuY3Rpb25zIGFyZSBzbyBzaW1pbGFyIHRoYXQgdGhleSBzaG91bGQg
YmUgZm9sZGVkICh0aHVzIGF2b2lkaW5nDQo+PiBmdXJ0aGVyIHNpbWlsYXIgYXN5bW1ldHJpZXMg
dG8gZ2V0IGludHJvZHVjZWQpLiBVc2UgdGhlIGJlc3Qgb2YgYm90aA0KPj4gd29ybGRzIGJ5IGUu
Zy4gdXNpbmcgImN1cnIiIGNvbnNpc3RlbnRseS4gVGhpcyB0aGVuIGJlaW5nIHRoZSBvbmx5DQo+
PiBjYWxsZXIgb2YgaHZtX2NoZWNrX2NwdWlkX2ZhdWx0aW5nKCksIGZvbGQgaW4gdGhhdCBmdW5j
dGlvbiBhcyB3ZWxsLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPg0KDQpBY2tlZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPg0KDQoNClRoYW5rcywNClJhenZhbg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
