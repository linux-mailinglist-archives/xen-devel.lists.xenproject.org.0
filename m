Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D4D70A08
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 21:46:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpeDq-0002SU-Dy; Mon, 22 Jul 2019 19:43:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cBkH=VT=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1hpeDp-0002SP-2n
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 19:43:45 +0000
X-Inumbo-ID: 02ab4252-acb9-11e9-8980-bc764e045a96
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::703])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 02ab4252-acb9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 19:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPg1L5gjmvRiMUyf5QqktgmPmlT004zREPHnujGYv3TBHjIZiNbu2FHfVSgrH6LqsgmpqtXLNgvr9Cv7iGQFZUqUrDdj3nXgGvLxUed2UD+KjcuFvSjsaryMdNW745YSrtaVbJhYvc2yg5ma4l3etJrK1yWKnRgH40eEn+A3ZTZ6u/YqQyO5PqqgPqOlhbVVV1LbwI7W3zkOkI0kDGtXjnbVQKSa/l3q330mpayEbcSAjgNko5f0Pip8BGo5OISCYIxLHyLBudNimMchvrfScb7w1TZLhd+K/JV6DmDEyTULfZO4kLszOUxLRmBpCLZinWa+H6c5trPeno1jro/Orw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XSIFn52P0F+7kXgYO8nG47HreIbA01tyJr3+dr5v28=;
 b=lk02iGkdUv/+3DaBqB09I3va6dmhlFBf5KzNbBYqMLGZeCrZU6/oE2R/qjU2EsrnbgWVOqJbQTVtHRtzp+VioxQqOJCYvakAF5TM7vf0/eK7XzIT3Zd4iZe5M65vKXDObOLCqLyYQ75+HRbb6/c5XyBce7j2uRFdV+O9NhHIk9ZOmY775NcVuyg2/gTTNxi6XsZMQPhBcZ9xBsmcAxFGJdhEocOoI0k97jM19E7uRJhCFEgiRD8gPzyzZX0XiTmMkkbV7HZlR3ov+1OLoG+8zxI5dA3onlAcxDlEzxf7SPYA08lpcg3lI9IVq4Rewrz2oGpUMWPiWTFV35zAekETgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=durham.ac.uk;dmarc=pass action=none
 header.from=durham.ac.uk;dkim=pass header.d=durham.ac.uk;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector1-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XSIFn52P0F+7kXgYO8nG47HreIbA01tyJr3+dr5v28=;
 b=Dgx+m7E8QbA5LkHvjoMYBhskNPKnNPKSVmCqeo7vLGfwjMGAzpgbsMQGiIwSG5XTqsgvYEhF0bO1mEKpzHcZoRv4tY5qAiNnZF30mzfexCB2PUBPDYiyNNQrtu0MP4aVOX7tUlh7kxlorGFaQ+RIN4XqnXDpDr+QfXgmQ7oMgAw=
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com (20.177.200.18) by
 VI1PR06MB4592.eurprd06.prod.outlook.com (20.178.10.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 19:43:41 +0000
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::390f:6eb7:7df2:94fe]) by VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::390f:6eb7:7df2:94fe%6]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 19:43:41 +0000
From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] pygrub, installed with Python 3, doesn't boot Xen
 DomU-s
Thread-Index: AQHVQIyzovlJtaJUH0OBUd+8+cCUIabXCmiA
Date: Mon, 22 Jul 2019 19:43:40 +0000
Message-ID: <alpine.LFD.2.21.1907222020280.2764@austen3.home>
References: <CABwOO=dnXZSfaCAEB5COs4sT_tz-R8VTuuK_V_Nf60XpPQoS3A@mail.gmail.com>
 <4de7580d-5478-2b90-58da-1f7335f0154b@citrix.com>
In-Reply-To: <4de7580d-5478-2b90-58da-1f7335f0154b@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Alpine 2.21 (LFD 202 2017-01-01)
x-originating-ip: [2a00:23c4:9208:400:c49a:db08:8036:b390]
x-clientproxiedby: LO2P265CA0082.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::22) To VI1PR06MB4720.eurprd06.prod.outlook.com
 (2603:10a6:803:90::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=m.a.young@durham.ac.uk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-x-sender: michael@austen3.home
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba14451d-f7f4-4f62-0bdc-08d70edce5d1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR06MB4592; 
x-ms-traffictypediagnostic: VI1PR06MB4592:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <VI1PR06MB4592C3856BFF20BD73BD1C3F87C40@VI1PR06MB4592.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(189003)(199004)(68736007)(76176011)(36756003)(66446008)(64756008)(66556008)(66476007)(6916009)(66946007)(186003)(53346004)(71190400001)(102836004)(5660300002)(386003)(53546011)(71200400001)(6506007)(4326008)(6246003)(2906002)(81166006)(54906003)(81156014)(229853002)(966005)(305945005)(6512007)(9686003)(53936002)(446003)(25786009)(6116002)(478600001)(8676002)(58126008)(6486002)(6436002)(486006)(14454004)(99286004)(256004)(8936002)(476003)(86362001)(52116002)(11346002)(7736002)(6306002)(46003)(786003)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR06MB4592;
 H:VI1PR06MB4720.eurprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: durham.ac.uk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4k4HYUcsCL+bfQ5vZJolcrE9bDCqdR9hAq61CSESisTeCqiSNqUpgr7430YrnFwyfIDGxDOpVkv5fIes8lNRS/h9cylafwh8X6pfQnJJrSwtb8EOL9anuomQMIEd9AcvszfvAskv0rPHl9CFR7bF3H0bI6pcosj0FLz5duiRHA/Eh70Jdi4oRTvdy2RBgxR2u5tk/g5I+JyhRPAKNQJYV7s0JsPhTI/ybblaya7HIhLsn+vzDh6pAMN+3uDlyOT+XJD6uhag0nPn/71b35T9CMVMybfU7ck1fR1x2QBNu7wwpLNlFPm87aQ0kndV9FtJGxtuLpRZRrZGY8btTEBUrHEsRq+Qgt4lfX6drXQ/lk1Ig9617nU5nGtbdNibkC8nvymF7YJmFRcFKVSKx8Wf3FjzvU+1KdFQ29qFe09aRZ4=
Content-ID: <alpine.LFD.2.21.1907222024481.2764@austen3.home>
MIME-Version: 1.0
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: ba14451d-f7f4-4f62-0bdc-08d70edce5d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 19:43:40.9939 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dcl0may@durham.ac.uk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB4592
Subject: Re: [Xen-devel] pygrub, installed with Python 3,
 doesn't boot Xen DomU-s
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
 Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMiBKdWwgMjAxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKCj4gT24gMjIvMDcvMjAx
OSAwMzo1NywgS2V2aW4gQnVja2xleSB3cm90ZToKPj4gYmFzaC01LjAjIC91c3IvbGliL3hlbi9i
aW4vcHlncnViIC0tZGVidWcgLS1vZmZzZXQ9MTA0ODU3Ngo+PiAtLWxpc3QtZW50cmllcyAvZGV2
L3ZnX3hlbl92YmRzL2x2XzRnXzAyCj4+IFVzaW5nIDxjbGFzcyAnZ3J1Yi5HcnViQ29uZi5HcnVi
MkNvbmZpZ0ZpbGUnPiB0byBwYXJzZSAvYm9vdC9ncnViL2dydWIuY2ZnCj4+IFRyYWNlYmFjayAo
bW9zdCByZWNlbnQgY2FsbCBsYXN0KToKPj4gICBGaWxlICIvdXNyL2xpYi94ZW4vYmluL3B5Z3J1
YiIsIGxpbmUgOTA3LCBpbiA8bW9kdWxlPgo+PiAgICAgY2hvc2VuY2ZnID0gcnVuX2dydWIoZmls
ZSwgZW50cnksIGZzLCBpbmNmZ1siYXJncyJdKQo+PiAgIEZpbGUgIi91c3IvbGliL3hlbi9iaW4v
cHlncnViIiwgbGluZSA2MjUsIGluIHJ1bl9ncnViCj4+ICAgICBnID0gR3J1YihmaWxlLCBmcykK
Pj4gICBGaWxlICIvdXNyL2xpYi94ZW4vYmluL3B5Z3J1YiIsIGxpbmUgMjQ5LCBpbiBfX2luaXRf
Xwo+PiAgICAgc2VsZi5yZWFkX2NvbmZpZyhmaWxlLCBmcykKPj4gICBGaWxlICIvdXNyL2xpYi94
ZW4vYmluL3B5Z3J1YiIsIGxpbmUgNDYwLCBpbiByZWFkX2NvbmZpZwo+PiAgICAgc2VsZi5jZi5w
YXJzZShidWYpCj4+ICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy43L3NpdGUtcGFja2FnZXMvZ3J1
Yi9HcnViQ29uZi5weSIsIGxpbmUgMzc2LCBpbiBwYXJzZQo+PiAgICAgbGluZXMgPSBidWYuc3Bs
aXQoIlxuIikKPj4gVHlwZUVycm9yOiBhIGJ5dGVzLWxpa2Ugb2JqZWN0IGlzIHJlcXVpcmVkLCBu
b3QgJ3N0cicKPj4KPj4gLi4uCj4+Cj4+IE9rLCBzbyB0aGVuIEkgd2VudCBodW50aW5nIGFyb3Vu
ZCBmb3IgdGhlIGNhdXNlIG9mIHRoZSBlcnJvcgo+PiBJIHdhcyBzZWVpbmcgb24gdGhlIExGUyBz
eXN0ZW0gYW5kIGdvdCBwb2ludGVkIHRvd2FyZHMgdGhlCj4+IGNhdXNlIGJlaW5nIGEgUHl0aGlu
Mi0+MyBpc3N1ZSwgd2l0aCB0aGUgd2F5IDMgbm93IGRpZmZlcmVudGlhdGVzCj4+IGJldHdlZW4g
c3RyaW5ncyBhbmQgYnl0ZXMuCj4KPiBZZXMgLSB0aGlzIGxvb2tzIGxpa2UgYSBQeSAyLzMgY29t
cGF0aWJpbGl0eSBpc3N1ZS7CoCBUaGlzIHBhcnRpY3VsYXIgb25lCj4gaXMgcmVsYXRlZCB0bwo+
IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29tbWl0ZGlmZjto
PWZmOTE1YzhjYWNjMjY0YWUxMzgwZDUxZmVhMDcyNjdiODMwOGQ3YmEKPgo+IEhvd2V2ZXIsIEkg
Y2FuJ3QgZXhwbGFpbiB3aHkgcHl0aG9uIGlzIGNvbXBsYWluaW5nIGF0IHN0ci5zcGxpdCgpLsKg
Cj4gc3BsaXQoKSBpcyBhIHN0cmluZyBvcGVyYXRpb24sIG5vdCBhIGJ5dGVzIG9wZXJhdGlvbi4K
Ckl0IGxvb2tzIGxpa2UgeW91IGFyZSBtaXNzaW5nIHRoZSBhYm92ZSBwYXRjaCBhbmQgSSB0aGlu
ayB5b3UgYWxzbyBuZWVkCmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0
O2E9Y29tbWl0O2g9NDg1MDc5ZTgxNjc4OGQ3MDE2OWY0NTU3OWUxZjVhOGY5MDlkYzFiMwpodHRw
czovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNvbW1pdDtoPTc2N2JhMzk3
ZDM0ODQ4YzdlMGM0ZTljZGZjNWVmYTRlMGNiNjE0NDIKYW5kIHBlcmhhcHMKaHR0cHM6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1jb21taXQ7aD1hNTdhMWIyNmVjMGFlMzFm
OTI0Y2YyYmJjZjQ3OTYzN2QwMDdiZTQ0CmlmIHlvdSBidWlsZCB3aXRoIG9jYW1sLiBBY3R1YWxs
eSB0aGUgZmlyc3Qgb2YgdGhlc2UgMyBwYXRjaGVzIGlzIG9wdGlvbmFsIAphcyBpdCBpcyBqdXN0
IGFuIGVycm9yIG1lc3NhZ2UgY2hhbmdlIGJ1dCBzaG91bGQgYWxsb3cgdGhlIHNlY29uZCBwYXRj
aCB0byAKYXBwbHkgY2xlYW5seS4KCiAJTWljaGFlbCBZb3VuZwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
