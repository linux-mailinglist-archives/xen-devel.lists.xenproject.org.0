Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA50C04A1
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:53:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDomc-0001tR-CE; Fri, 27 Sep 2019 11:51:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDoma-0001tI-Po
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:51:32 +0000
X-Inumbo-ID: 25b3b7d0-e11d-11e9-bf31-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::62a]) by localhost (Halon) with ESMTPS
 id 25b3b7d0-e11d-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 11:51:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NT4NyFQReJCQBehospxGY0XMVJcJJpY+9WqFeuxO+rQqz7t8ktQASdW1wqpmEROzHv3ZD+Dak+4mucPyksagEmgK+tI9pY0x4EHokhq6Px5CrobtclVUqb42u2K9vJMkhJgW8n6FB2lLB2DNOM0+IBPtrEqFN10y3OPimU/TBHXaZPehcvH/MKNnV1bO1UTvfUDDk3zTuhZF7j7RVNBAxdo+ztyltaCEQIe5agEwab9esmM9SJnuLSoOuzTWbGC1vfhlozXELm8uj08CD66DkPPgxKNJ2X4/YjFs58bLKGaGSCu/Pt/vb07SqHFjgiMVVRZ86pGM+BaHrH1vBpy3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeYd05hvzB4fYJTk6oN/qrI0RNJ8D6ddGCvMr6H45YA=;
 b=OZX0T6Eu5gR8fXlp/sQO8PQgIYOYkLEHnAgywHgcLIF6FNWPka8qPbNuQWM0fjQ7+4Q45TtXw1StBVD/MtKNh4teC5zp/LSMvn6ANmpfxarwvtrlWCVTryir0oEmBIyT3finFYrvAqTmZOHMYOYdezJXCGGSp8AfkvSPAAzQKt5+djOoURXtGRnzkOxXqSWCTJEs1QBR/ZBP3imDYzioHhKeuM2GOU1IGqqsKgCwC80K6TX8vF3biTnY4x5BSFngAkQCNe04rumBI3oMHrPVMaDmlER9pfvSzEKtfnXTsatJ1xeiTqZ5EFyxutBzwLAxs99VrxxO74zBlMNMBkqsHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeYd05hvzB4fYJTk6oN/qrI0RNJ8D6ddGCvMr6H45YA=;
 b=U3nLtDo+hRVOaZFR3fgiLCZSjvQD/E0bYIhsg9LABXu0sdCfLM4If1WNQY7hnXeYy7zV++XjCyXZ2LMTIdVMdFt+78p0kwwglmSZr/0Ob+Dh0s20bBbwBWi+2EtAzaxKbIMllDCHVbmpohnSj8wvWLFXw8u4jJEKG4rEfEDUcds=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4066.eurprd03.prod.outlook.com (52.135.145.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Fri, 27 Sep 2019 11:51:30 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 11:51:30 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 06/10] xen/arm: Move ARCH_PATCH_INSN_SIZE
 out of the header livepatch.h
Thread-Index: AQHVdJmU1TGCLSr2DEqPk0AXFAhajqc/apSA
Date: Fri, 27 Sep 2019 11:51:30 +0000
Message-ID: <87y2ya7y9u.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-7-julien.grall@arm.com>
In-Reply-To: <20190926183808.11630-7-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 101aeb9d-33ca-491a-a274-08d743410933
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB4066; 
x-ms-traffictypediagnostic: AM0PR03MB4066:|AM0PR03MB4066:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB4066125A4FCA7F7215E297D0E6810@AM0PR03MB4066.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(199004)(189003)(186003)(71200400001)(486006)(76176011)(91956017)(55236004)(6506007)(25786009)(14454004)(36756003)(102836004)(2906002)(6916009)(66446008)(66066001)(66556008)(476003)(66476007)(80792005)(64756008)(11346002)(316002)(7736002)(446003)(305945005)(2616005)(99286004)(81156014)(8676002)(81166006)(26005)(6116002)(3846002)(54906003)(76116006)(478600001)(86362001)(66946007)(6436002)(6486002)(6246003)(4326008)(6512007)(8936002)(5660300002)(4744005)(71190400001)(256004)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4066;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: G6mmUXx3tDBIf7+GzkenWgGIowtQt11rTmDoU0bb9+EeLK8GmwUlk0ueP3MZb6h4bmWp5jlz0lq2qt+VX50r+d+SbIaTYFCPXB9hJAhfzwMbnPUT0qBo9K6v64kehTq+ixpmoDJoyK9B3GkHCbEbRIPf9OpcxcTWHC5OF2qHmrkYmVSdl1xHP/9el3xo1jO+TL9o9F0VDG6GxeKWWOXdPLLP2DDuAOdZTZ6zkY8i0upWWZLHGjqeY/o4BpoEUIvJwbzZ8eaHTsQ4eXJe5ASzrH8qy881nCVV9+VCjbVee6L16jzMPI36D1scAkpbrHSGNcMIwW06hPqaVJroag292YNWvz+Hyt6AFUBgSVjmk5kyfSH6xYWdNeZXAw5uARWpPWlKIUO/jLcAjqa0dFJYyPg0gGa6+hDJVc9HjOuUdus=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 101aeb9d-33ca-491a-a274-08d743410933
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 11:51:30.1849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fErORDo0LjuA3i6DkbBdIsURrEdYD7PetXhrMtJLTfF54DiNg/4TkxcuCg5Jz889Glv/qQX8bIPf20k20cqp9fLnaCnlnvDb73Vc2fifwjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4066
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 06/10] xen/arm: Move
 ARCH_PATCH_INSN_SIZE out of the header livepatch.h
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEF0IHRoZSBtb21lbnQsIEFSQ0hfUEFUQ0hfSU5TTl9T
SVpFIGlzIGRlZmluZWQgaW4gdGhlIGhlYWRlcgo+IGxpdmVwYXRjaC5oLiBIb3dldmVyLCB0aGlz
IGlzIGFsc28gdXNlZCBpbiB0aGUgYWx0ZXJuYXRpdmUgY29kZS4KPgo+IFJhdGhlciB0aGFuIGlu
Y2x1ZGluZyBsaXZlcGF0Y2guaCBqdXN0IGZvciB1c2luZyB0aGUgZGVmaW5lLCBtb3ZlIGl0IGlu
Cj4gdGhlIGhlYWRlciBpbnNuLmggd2hpY2ggc2VlbXMgbW9yZSBzdWl0YWJsZS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5
OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+CgotLSAKVm9s
b2R5bXlyIEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
