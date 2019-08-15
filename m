Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAAD8EB5D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 14:17:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyEep-0002Py-Nw; Thu, 15 Aug 2019 12:15:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ryZ=WL=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hyEeo-0002Pt-AI
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 12:15:06 +0000
X-Inumbo-ID: 4c201b40-bf56-11e9-8b9b-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c201b40-bf56-11e9-8b9b-12813bfff9fa;
 Thu, 15 Aug 2019 12:15:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mhgx4MgoGw4MJQDKPkKPA8Z6xViRxYEvOi6yEWpxNrg95v5uss6Mch0b+y1kaGmtXUtyED9e6LNZ8CEbqlUmOCOPAluaDeYp25EubSq6gQE/BW126bWbbs07yJM+sMUUf+O1jOH9rKO491u/dqFiVFyxZGGXNdZt9tFbg2tR3FoZHFj8hKcDDdsXdslieYkjHP3jTsJCFILYy8SPG1foP2BN1YuuEqRznxmq9oH4iFskFPerVt7aUL7Z01qTym/EwPM3n8JKtCVQWcy43sk7flKxEb8Ok4soCSM1vHy/OhHVJmMYSeklZ6Rj676FmBggyMcNBuAtAQU/ste771Hftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/+zd+kz3vmnA/lL70S/ou3kTOWB/4A42dQI27x6CfA=;
 b=lJIJEhEeuFGYW1JWrsHzcjRkdC9hnLSUy2N77wqHa6TqmQDYYQ/mJ1Yg7rAtfFiq+eSn//FDUW9Yzuw6HX76V7IYtcT2XaYx3HmOdYffI7TidYSyy8eQl0groItTaTwbOTQWehNe4hBfocMYPire/bVAAHfudD7MVkhHlGhsbP7Q43A+wR2zjhAh/QPPLQdt+MbcfF2NMjnIOD8o62/8Xztl4kVHe2Dp9fypmpMI+MJ9vXZOzvyXhCRnDNogn0c6NgtegrwV6dGaymfK01zVqP5vCzK0ULTbuynQO4yChJSJCLf3tyN/YjbBTSV4N/cD2nWInE3swLN8YwFHOWpdtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/+zd+kz3vmnA/lL70S/ou3kTOWB/4A42dQI27x6CfA=;
 b=ehMgLzL+uoNZFeTk/oWTVg4gGk1046S6AGPwq4lvgxAFDv5ujfo63T3pNaflCpg7iP1DC5UC7HSBznZjY+HYZo0WOwg6Qrfo06f0Ncv32LNN0iTF0nXojMysr63EtKthWJ4/q6NaOoVaWX/ru5H90YpuViwXgCU35EjMdOc6cYJtU8JcAE+t3+OIIs8Ax1eJJkELuTqaIDAylVLGL1S6hm+D/Sha2VA04L65oGM9Dlkk5aVY2wnSCdBy2NcCqf9WLaf7+pEdsl1W3LEtyFRZXx+VPVFr5CwJ7/ECRglmOM1uW+asGMBBaFlnS1/uEDATMIj0QOy8MNI7EOLPeuTCrQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5812.eurprd03.prod.outlook.com (10.255.28.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 15 Aug 2019 12:14:56 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 12:14:56 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v5 2/7] xen/arm: make process_memory_node a
 device_tree_node_func
Thread-Index: AQHVUV1R/d2bF3zaTUGfbkxrXQjKbab5IAaAgAIeWACAANW8gIAAAS+AgAABXwCAAAy1gA==
Date: Thu, 15 Aug 2019 12:14:56 +0000
Message-ID: <874l2ihbgg.fsf@epam.com>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-2-sstabellini@kernel.org> <87ftm5gnkc.fsf@epam.com>
 <alpine.DEB.2.21.1908141528250.8737@sstabellini-ThinkPad-T480s>
 <875zmyhdzi.fsf@epam.com> <9452f4b5-7e36-0514-f207-a6b7c4410ea6@arm.com>
 <79e7a0a2-7c1e-cfe9-b5b1-d503075f60bd@arm.com>
In-Reply-To: <79e7a0a2-7c1e-cfe9-b5b1-d503075f60bd@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 908888b0-c0e8-4298-f91c-08d7217a2fa6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB5812; 
x-ms-traffictypediagnostic: AM0PR03MB5812:|AM0PR03MB5812:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB58120C34382174F08CCC6E54E6AC0@AM0PR03MB5812.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(199004)(189003)(8936002)(446003)(64756008)(76116006)(6116002)(66556008)(26005)(476003)(486006)(66946007)(256004)(3846002)(186003)(6512007)(2616005)(11346002)(66446008)(5660300002)(71200400001)(6506007)(53546011)(71190400001)(2906002)(102836004)(55236004)(76176011)(86362001)(66476007)(14454004)(91956017)(14444005)(81166006)(478600001)(6436002)(316002)(6486002)(4326008)(80792005)(8676002)(6246003)(6916009)(229853002)(36756003)(305945005)(81156014)(7736002)(99286004)(53936002)(25786009)(66066001)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5812;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kk+CbNCZpRdjUEMztMLoZGT1/uax4ZEacyyl/QEAjz89HfzgJrugHXnqwE9MdyDuxXxXrIjobB+JYMu7SbIlF9o1VZgBat5bHNVOQFRZL8N+MiNLRsxhKKOKgbyo+PiXdLHUwloyU5ACWsDthRdzrKfEr1fdrRZ2HuiADHFDIfyejBj/3uBeQiVWRtUX3dy8cgcls6t+BulNBjj/0YJnKQQ7oeWMrirWDONnFoNIdDYLjReGEnsz2rRZAkkBZ8uif6Xpe4XQ6g4UhPt6IMaWdH/DBaTOGTRIxlOelcfABIeMwbXVnUxgv19s3l/64IfLFthnh2EQtXexb0Dme7pNlUVpH6j/1gSzkWv+03u0qIB+GVLNdT42PA2rtfjSJDvTN5GkqRvLQHZxWR7zHD9ctWh1/z6gkcqAuRU1p5tVY80=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908888b0-c0e8-4298-f91c-08d7217a2fa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 12:14:56.4345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q4K/sEdcimOP5NCPgtqkd2d9hZdMmv6TJyQDeCTH/F4XdoDp+wqsyCSoG/BWA+UJh2OEXbGlskbdyhWjyCSED3zwm3jS0hBz/68vgsIszj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5812
Subject: Re: [Xen-devel] [PATCH v5 2/7] xen/arm: make process_memory_node a
 device_tree_node_func
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE9uIDE1LzA4LzIwMTkgMTI6MjQs
IEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgVm9sb2R5bXlyLAo+Pgo+PiBPbiAxNS8wOC8yMDE5
IDEyOjIwLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+Cj4+PiBIaSBTdGVmYW5vLAo+Pj4K
Pj4+IFN0ZWZhbm8gU3RhYmVsbGluaSB3cml0ZXM6Cj4+Pgo+Pj4+IE9uIFR1ZSwgMTMgQXVnIDIw
MTksIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+Pj4+Pj4gQEAgLTE2Miw2ICsxNTYsMTAgQEAg
c3RhdGljIHZvaWQgX19pbml0Cj4+Pj4+PiBwcm9jZXNzX21lbW9yeV9ub2RlKGNvbnN0IHZvaWQg
KmZkdCwgaW50IG5vZGUsCj4+Pj4+PiAgYm9vdGluZm8ubWVtLmJhbmtbYm9vdGluZm8ubWVtLm5y
X2JhbmtzXS5zaXplID0gc2l6ZTsKPj4+Pj4+ICBib290aW5mby5tZW0ubnJfYmFua3MrKzsKPj4+
Pj4+ICB9Cj4+Pj4+PiArCj4+Pj4+PiArIGlmICggYm9vdGluZm8ubWVtLm5yX2JhbmtzID09IE5S
X01FTV9CQU5LUyApCj4+Pj4+PiArIHJldHVybiAtRU5PU1BDOwo+Pj4+PiBBcmUgeW91IHN1cmUg
dGhhdCB0aGlzIGxvZ2ljIGlzIGNvcnJlY3Q/Cj4+Pj4+Cj4+Pj4+IEZvciBleGFtcGxlLCBpZiBO
Ul9NRU1fQkFOS1MgaXMgMSwgYW5kIHdlIGhhdmUgZXhhY3RseSBvbmUgbWVtb3J5IG5vZGUKPj4+
Pj4gaW4gZGV2aWNlIHRyZWUsIHRoaXMgZnVuY3Rpb24gd2lsbCBmYWlsLiBCdXQgaXQgc2hvdWxk
IG5vdC4gSSB0aGluayB5b3UKPj4+Pj4gd2FudCB0aGlzIGNvbmRpdGlvbjogYm9vdGluZm8ubWVt
Lm5yX2JhbmtzID4gTlJfTUVNX0JBTktTCj4+Pj4KPj4+PiBZb3UgYXJlIHJpZ2h0LCBpZiBOUl9N
RU1fQkFOS1MgaXMgMSBhbmQgd2UgaGF2ZSAxIG1lbW9yeSBub2RlIGluIGRldmljZQo+Pj4+IHRy
ZWUgdGhlIGNvZGUgd291bGQgcmV0dXJuIGFuIGVycm9yIHdoaWxlIGFjdHVhbGx5IGl0IGlzIG5v
cm1hbC4KPj4+Pgo+Pj4+IEkgdGhpbmsgdGhlIHJpZ2h0IGNoZWNrIHdvdWxkIGJlOgo+Pj4+Cj4+
Pj4gIGlmICggaSA8IGJhbmtzICYmIGJvb3RpbmZvLm1lbS5ucl9iYW5rcyA9PSBOUl9NRU1fQkFO
S1MgKQo+Pj4+ICByZXR1cm4gLUVOT1NQQzsKPj4+Cj4+PiBBY3R1YWxseSwgdGhpcyBkb2VzIG5v
dCBjb3ZlciBhbGwgY29ybmVyIGNhc2VzLiBIZXJlIGlzIHRoZSByZXN1bHRpbmcKPj4+IGNvZGU6
Cj4+Pgo+Pj4gIDE1MCBmb3IgKCBpID0gMDsgaSA8IGJhbmtzICYmIGJvb3RpbmZvLm1lbS5ucl9i
YW5rcyA8IE5SX01FTV9CQU5LUzsgaSsrICkKPj4+ICAxNTEgewo+Pj4gIDE1MiBkZXZpY2VfdHJl
ZV9nZXRfcmVnKCZjZWxsLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzLAo+Pj4gJnN0YXJ0LCAm
c2l6ZSk7Cj4+PiAgMTUzIGlmICggIXNpemUgKQo+Pj4gIDE1NCBjb250aW51ZTsKPj4+ICAxNTUg
Ym9vdGluZm8ubWVtLmJhbmtbYm9vdGluZm8ubWVtLm5yX2JhbmtzXS5zdGFydCA9IHN0YXJ0Owo+
Pj4gIDE1NiBib290aW5mby5tZW0uYmFua1tib290aW5mby5tZW0ubnJfYmFua3NdLnNpemUgPSBz
aXplOwo+Pj4gIDE1NyBib290aW5mby5tZW0ubnJfYmFua3MrKzsKPj4+ICAxNTggfQo+Pj4gIDE1
OQo+Pj4gIDE2MCBpZiAoIGkgPCBiYW5rcyAmJiBib290aW5mby5tZW0ubnJfYmFua3MgPT0gTlJf
TUVNX0JBTktTICkKPj4+ICAxNjEgcmV0dXJuIC1FTk9TUEM7Cj4+Pgo+Pj4gTGluZXMgMTUzLTE1
NCBjYXVzZSB0aGUgaXNzdWUuCj4+Pgo+Pj4gSW1hZ2luZSB0aGF0IE5SX01FTV9CQU5LUyA9IDEg
YW5kIHdlIGhhdmUgdHdvIG1lbW9yeSBub2RlcyBpbiBkZXZpY2UKPj4+IHRyZWUgd2l0aC4gTm9k
ZXMgaGF2ZSBzaXplcyAwIGFuZCAxMDI0LiBZb3VyIGNvZGUgd2lsbCB3b3JrIGFzCj4+PiBpbnRl
bmRlZC4gQXQgdGhlIGVuZCBvZiBsb29wIHdlIHdpbGwgaGF2ZSBiYW5rcyA9IDIsIGkgPSAyIGFu
ZAo+Pj4gYm9vdGluZm8ubWVtLm5yX2JhbmtzID0gMS4KPj4+Cj4+PiBCdXQgaWYgd2Ugc3dpdGNo
IG9yZGVyIG9mIG1lbW9yeSBub2Rlcywgc28gZmlyc3Qgb25lIHdpbGwgYmUgd2l0aCBzaXplCj4+
PiAxMDI0IGFuZCBzZWNvbmQgb25lIHdpdGggc2l6ZSAwLCB5b3VyIGNvZGUgd2lsbCByZXR1cm4g
LUVOT1NQQywgYmVjYXVzZQo+Pj4gd2UnbGwgaGF2ZSBiYW5rcyA9IDIsIGkgPSAxLCBib290aW5m
by5tZW0ubnJfYmFua3MgPSAxLgo+Pj4KPj4+IEkgdGhpbmssIHJpZ2h0IHNvbHV0aW9uIHdpbGwg
YmUgdG8gc2NhbiBhbGwgbm9kZXMgdG8gY291bnQgbm9kZXMKPj4+IHdpdGggc2l6ZSA+IDAuIEFu
ZCB0aGVuIC0gZWl0aGVyIHJldHVybiBhbiBlcnJvciBvciBkbyBzZWNvbmQgbG9vcCB0bwo+Pj4g
ZmlsbCBib290aW5mby5tZW0uYmFua1tdLgo+Pgo+PiBUbyBiZSBob25lc3QsIGEgbWVtb3J5IHdp
dGggc2l6ZSAwIGlzIGFuIGVycm9yIGluIHRoZSBEVAo+PiBwcm92aWRlZC4gU28gSSB3b3VsZCBu
b3QgY2FyZSB0b28gbXVjaCBpZiBYZW4gaXMgbm90IHdvcmtpbmcgYXMKPj4gaW50ZW5kZWQuCj4+
Cj4+IElmIHdlIHdhbnQgdG8gZml4IHRoaXMsIHRoZW4gd2Ugc2hvdWxkIGJhaWwgb3V0IGFzIHdl
IGRvIGZvciBtaXNzaW5nCj4+ICdyZWdzJyBhbmQgaW52YWxpZCAnYWRkcmVzcy1jZWxscycvJ3Np
emUtY2VsbHMnLgo+Cj4gSSBzZW5kIHRoaXMgdG9vIGVhcmx5LiBJIGZvcmdvdCB0byBtZW50aW9u
IHRoYXQgSSB3b3VsZCBub3QgYmUgaGFwcHkKPiB3aXRoIHBhcnNpbmcgdGhlIERldmljZS1UcmVl
IHR3aWNlIGp1c3QgZm9yIGJlbmVmaXRzIG9mIHdyb25nIERULiBJZiBhCj4gRFQgaXMgd3Jvbmcg
dGhlbiB3ZSBzaG91bGQgdHJlYXQgYXMgc3VjaCBhbmQgc2hvdXQgYXQgdGhlIHVzZXIuCkZhaXIg
ZW5vdWdoLiBCdXQgdGhlbiBhdCBsaW5lIDE1NCB3ZSBuZWVkIHRvIHJldHVybiBhbiBlcnJvciwg
aW5zdGVhZCBvZgpjb250aW51aW5nIHRoZSBpdGVyYXRpb25zLiBBbmQgaW4gdGhpcyBjYXNlIHdl
IGNhbiBzaW1wbGlmeSB0aGUgZXJyb3IKY2hlY2sgdG8gKGJhbmtzID4gTlJfTUVNX0JBTktTKS4K
Ci0tIApWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
