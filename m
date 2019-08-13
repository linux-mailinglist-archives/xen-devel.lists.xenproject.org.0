Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD4B8BD72
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 17:43:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxYtg-0000hJ-4B; Tue, 13 Aug 2019 15:39:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FUCW=WJ=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hxYtf-0000hE-4O
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 15:39:39 +0000
X-Inumbo-ID: 8e684fda-bde0-11e9-9032-0345dd22dabc
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::614])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e684fda-bde0-11e9-9032-0345dd22dabc;
 Tue, 13 Aug 2019 15:39:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NrT0bUNqmxMP0W21WJDdLl0o6dNTv9nQi+J6dLpKAQ55ssoqeSEfZhaV2HTKtW1nqhTQBS8EHeI8tW0Do2xRgjkbFbMC/8tPbMz1aAKvLsuDXsl+zLBV1xmygZxrAdR8nYO6BSwADzQfczUAuyHUz1BczC3UNaI4FSX9dR+XhGlNBB+dFcAVEo5z8RJm/83gSOmq4lOLKKGjVD9WmsBt2AwxXmP6nSJPy3LWRq6wpRrcsZMzS0AMgrgVkO1+EQ5wAeg/rOVeWggahIWdrEr/AjcwnUEpuxvvr7Qd/3p45lXznOUtZ74Zs8Syp/KjC+htatHMvxfYRjHqIirI4iM/rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2DoG6AcJki3Wd8psWnSVRHpCZXONme9FMjjwKM4Afk=;
 b=PD8XBVcE4ytrw9svHnAWrNXH/qjf20pWKHyY+h/tjud9+N0dHH6kMYqO7XvMDhf3cyZcwBt6I4vTcpGSh3y2ltQ0cAi3Q5b5XzvXrPix+aGCpXoJXWK8aoNiu/mlhshZlerBumxNAuV4ZpoRan3Mjeq5zOOrTyB0DaH3i5n76ZnAFqqhaqH/5CqYl6DrHncw6K1q1LoMsXW+BJ0YOan4HKLNLQSAoHvasS2K/6OF150uiqWxsMBOUGgUyvzwS9G3NWx5g5LmHbmC7OX0iv2Ez36FoMdsFUdKAGBLJCGeLnq6y4deVynM0ECQgJdh59LLHIOsyq6QenXbYn3hTkNVOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2DoG6AcJki3Wd8psWnSVRHpCZXONme9FMjjwKM4Afk=;
 b=CHq/ux075ijQr8PwXkBdnBsadPmngoCSXiIqUUhzVAVmtsv4PmLrITqVV7flDnVu2BxvaTi4PICoSCjbRhsq0KkMJoFgE+RjpmOXHGypNz+0ZFeAa4x2wtyQaVka+uKm4LI81pxJ3/8gJuEJ5DrkTWjxZ659CNj1oCvgcIFq0gurIz3yDkBbjElvmjil1D8qG+XTQm+3KJnAYeIoyIp+D67y9kI8e50rA1qXbv5Psir3FW8Wa0MuKT0d7sGQ1aTm1iHmlVK+AuZQV8eGqNCrtEOugnGFrJGTHH2HggGXwqVPMq7TdsbVKglKXXcY1irNEKFLxQ7mtRUfgSkBd+xReA==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3633.eurprd03.prod.outlook.com (52.134.83.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Tue, 13 Aug 2019 15:39:35 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 15:39:35 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v5 3/7] xen/arm: keep track of reserved-memory regions
Thread-Index: AQHVUV1QMNfXhdMZzkSWk2vkeQwkS6b5IrWAgAAGPwCAAAfPgIAAAHEAgAAGrQA=
Date: Tue, 13 Aug 2019 15:39:35 +0000
Message-ID: <878srxgjm1.fsf@epam.com>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-3-sstabellini@kernel.org> <87ef1pgn4c.fsf@epam.com>
 <75f9a42a-f691-2cf2-b9e8-289c05f66286@arm.com> <87a7cdgksi.fsf@epam.com>
 <888c9482-7a12-2f18-568b-e11773249f22@arm.com>
In-Reply-To: <888c9482-7a12-2f18-568b-e11773249f22@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4029d70-4168-4820-4adf-08d7200471a3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB3633; 
x-ms-traffictypediagnostic: AM0PR03MB3633:|AM0PR03MB3633:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB3633154031CF80B15A29AF06E6D20@AM0PR03MB3633.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(8676002)(86362001)(6246003)(305945005)(7736002)(6916009)(6512007)(66066001)(5660300002)(229853002)(316002)(99286004)(26005)(53936002)(54906003)(53546011)(76176011)(4326008)(102836004)(186003)(55236004)(6506007)(2906002)(478600001)(71200400001)(71190400001)(14454004)(6116002)(486006)(66446008)(8936002)(66476007)(66556008)(64756008)(446003)(11346002)(2616005)(6486002)(76116006)(91956017)(66946007)(476003)(81166006)(81156014)(36756003)(256004)(80792005)(25786009)(6436002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3633;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IWHQRXpH5ftrEKFDnx2ojVwQ4WCFDJC3lwbUzSa6iRs3cd4aROR+MvPxZcXQed0byLFNyWHTILxC75RWx5WHr++pgkSdGrUjXMnn9sUP+uW2arqrFGCA0G/GuHFbPMvCIoJ3xFtyfmO/yPP60w30cqQN8R+UjmsllOqgSsHqvrKHsknVBbNkSQsMZjfX3/P/Hjxj24PO6RpUd6JyUbwUkAu7JQaXQkP7OZH+d7lYzp4cE0tkqqzn306afSFeWWmtTTTeDGJ6a2cg+rM6M+KXgL41haXRsZV8xew2Fh841bZ2EKszsSLXy0NpRGfNcjeY1UAdw6CK4q9VG/0wasfuK3yBif13DBb34ML5N30LWb2Z3dwBrumgv3yqkH6noUHsVzIKW2d5R68b1GDmyJiLCGp29Yww4EOIV4fvmoJAhrY=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4029d70-4168-4820-4adf-08d7200471a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 15:39:35.3481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 01Yy0zHJgFIO/+mDaKnBlphwogP3+XJrMqV1C0q6BV7EJeDbVnlq7vlpSYXLruXzrD1CBfnmqkdEXVk6QQh1ahMFOUlpBGWnpBs3uEBC+lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3633
Subject: Re: [Xen-devel] [PATCH v5 3/7] xen/arm: keep track of
 reserved-memory regions
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpLAo+Cj4gT24gOC8xMy8xOSA0OjE0IFBNLCBWb2xv
ZHlteXIgQmFiY2h1ayB3cm90ZToKPj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPj4+IE9uIDgvMTMv
MTkgMzoyMyBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pj4gU3RlZmFubyBTdGFiZWxs
aW5pIHdyaXRlczoKPj4+Pgo+Pj4+PiAgICAgICAgewo+Pj4+PiAgICAgICAgICAgIGRldmljZV90
cmVlX2dldF9yZWcoJmNlbGwsIGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMsICZzdGFydCwgJnNp
emUpOwo+Pj4+PiAgICAgICAgICAgIGlmICggIXNpemUgKQo+Pj4+PiAgICAgICAgICAgICAgICBj
b250aW51ZTsKPj4+Pj4gLSAgICAgICAgYm9vdGluZm8ubWVtLmJhbmtbYm9vdGluZm8ubWVtLm5y
X2JhbmtzXS5zdGFydCA9IHN0YXJ0Owo+Pj4+PiAtICAgICAgICBib290aW5mby5tZW0uYmFua1ti
b290aW5mby5tZW0ubnJfYmFua3NdLnNpemUgPSBzaXplOwo+Pj4+PiAtICAgICAgICBib290aW5m
by5tZW0ubnJfYmFua3MrKzsKPj4+Pj4gKyAgICAgICAgbWVtLT5iYW5rW21lbS0+bnJfYmFua3Nd
LnN0YXJ0ID0gc3RhcnQ7Cj4+Pj4+ICsgICAgICAgIG1lbS0+YmFua1ttZW0tPm5yX2JhbmtzXS5z
aXplID0gc2l6ZTsKPj4+Pj4gKyAgICAgICAgbWVtLT5ucl9iYW5rcysrOwo+Pj4+PiAgICAgICAg
fQo+Pj4+Pgo+Pj4+PiAtICAgIGlmICggYm9vdGluZm8ubWVtLm5yX2JhbmtzID09IE5SX01FTV9C
QU5LUyApCj4+Pj4+ICsgICAgaWYgKCBtZW0tPm5yX2JhbmtzID09IE5SX01FTV9CQU5LUyApCj4+
Pj4gTG9va3MgbGlrZSB5b3UgaGF2ZSB0aGUgc2FtZSBvZmYtYnktb25lIGVycm9yLCBhcyBpbiBw
cmV2aW91cyBwYXRjaC4KPj4+PiBJIGNhbiBzZWUgdGhhdCBpdCB3YXMgdGhlcmUgZWFybGllci4g
QnV0IGl0IGlzIGdvb2QgdGltZSB0byBmaXggaXQuCj4+Pgo+Pj4gSSBkb24ndCB0aGluayB0aGVy
ZSB3YXMgYW4gb2ZmLWJ5LW9uZSBlcnJvciBiZWZvcmUgdGhpcyBzZXJpZXMuIFNvCj4+PiB3aGF0
IGRvIHlvdSBtZWFuPwo+PiBJIGV4cGxhaW5lZCB0aGlzIGluIHBhdGNoICMyLiBJbWFnaW5lIHRo
YXQgTlJfTUVNX0JBTktTID0gMSBhbmQgeW91IGhhdmUKPj4gb25lIG1lbW9yeSBub2RlIGluIHRo
ZSBkdGIuIFlvdSdsbCBmaWxsIHRoZSBmaXJzdCBlbGVtZW50IG9mIHRoZSBhcnJheQo+PiBhbmQg
bWVtLT5ucl9iYW5rcyB3aWxsIGJlY29tZSAxLiBUaGlzIGlzIGFic29sdXRlbHkgbm9ybWFsLiBC
dXQgY2hlY2sKPj4gYWJvdmUgd2lsbCBmYWlsLCB3aGljaCBpcyBub3QgcmlnaHQuCj4KPiBPay4g
U28gdGhlIG9mZi1ieS1vbmUgZXJyb3IgaGFzIGJlZW4gaW50cm9kdWNlZCBieSB0aGlzIHNlcmll
cy4gU28KPiB0aGlzIHNob3VsZCBiZSBmaXhlZCBpbiBwYXRjaCAjMiBub3QgaGVyZS4KWWVzLCBz
b3JyeS4gSSBnb3QgbG9zdCBpbiB0aGUgY29kZS4KCi0tIApWb2xvZHlteXIgQmFiY2h1ayBhdCBF
UEFNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
