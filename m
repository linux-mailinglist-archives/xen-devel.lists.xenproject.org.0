Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AFA33A61
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 23:57:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXutg-00028S-R7; Mon, 03 Jun 2019 21:53:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5QiE=UC=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1hXutf-00028H-8d
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 21:53:39 +0000
X-Inumbo-ID: 09c9f9e7-864a-11e9-8980-bc764e045a96
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::717])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 09c9f9e7-864a-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 21:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector1-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkEbW49i4QHJVsMVJHJWSLWNfnmOH2NRL1dw4C/zotc=;
 b=eeMeiSs7sBzJfvgpWAiuHJlwK2x3ja3KqxpigZjB/xa6v3xcACPBSnVGKnzJLaHL5HdBr0CDly0BJ2T8SDXvFfUUuywGI9DxK23RcxXyJ3h6Kd4xRx59lRiOqXHl8R/7bNyqSYdC2yXu/XeUKVJJuAb3B19bo2TWCjLbnYFXHZg=
Received: from AM6PR06MB4648.eurprd06.prod.outlook.com (20.177.197.138) by
 AM6PR06MB4754.eurprd06.prod.outlook.com (20.177.118.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Mon, 3 Jun 2019 21:53:34 +0000
Received: from AM6PR06MB4648.eurprd06.prod.outlook.com
 ([fe80::864:f58f:98c6:b4a5]) by AM6PR06MB4648.eurprd06.prod.outlook.com
 ([fe80::864:f58f:98c6:b4a5%5]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 21:53:34 +0000
From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: issues with Python 3.8
Thread-Index: AQHVGlbK2uli84wTlUOOOEW8m+MOuw==
Date: Mon, 3 Jun 2019 21:53:34 +0000
Message-ID: <alpine.LFD.2.21.1906032013210.3566@austen3.home>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Alpine 2.21 (LFD 202 2017-01-01)
x-originating-ip: [2a00:23c4:9208:400:c49a:db08:8036:b390]
x-clientproxiedby: LNXP265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::16) To AM6PR06MB4648.eurprd06.prod.outlook.com
 (2603:10a6:20b:67::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=m.a.young@durham.ac.uk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-x-sender: michael@austen3.home
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccd774d2-385c-4103-9ef9-08d6e86deca4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:AM6PR06MB4754; 
x-ms-traffictypediagnostic: AM6PR06MB4754:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR06MB475428CA3B9938FB21964C2887140@AM6PR06MB4754.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:392;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(136003)(396003)(366004)(376002)(189003)(199004)(58126008)(256004)(66946007)(66556008)(5640700003)(6436002)(66576008)(66476007)(64756008)(66446008)(966005)(73956011)(316002)(14454004)(25786009)(5024004)(478600001)(6512007)(6306002)(14444005)(99936001)(8676002)(81156014)(81166006)(71200400001)(53936002)(68736007)(8936002)(71190400001)(7736002)(786003)(36756003)(305945005)(9686003)(102836004)(6916009)(6116002)(53346004)(6486002)(52116002)(74482002)(7116003)(2501003)(186003)(86362001)(6506007)(386003)(99286004)(46003)(5660300002)(2351001)(476003)(4744005)(486006)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR06MB4754;
 H:AM6PR06MB4648.eurprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: durham.ac.uk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6iXjJ6k3E0ZOXiXvw/9v4KfBTULMh2GOq6pQ41klzEkCNiFfrqxyaFd8ldKC1A09upQ/YyMysvatMyMN4v8OAKgPcEpqizKhvT+M3xN0hx/TQzqxQJK3EfkcXR7+5Sv2MClvmocriYX8kZYfnZQZTT6E8W2ou6NYEqMM0AqL2XETLZtoibPq9L/IM7Ye9sL+tYswVW0rmEZbUOl4EBCUcvQM6osvj3vWQyjpNZclK8rXEQ4CY1adP46vwSmEPbeDPtWge9LMRGZSP8o3uaIUnY0EdHqnDQiwoptbOMKLdEeWaVpQkDTmxoEKcNA3WS+li4Qy1j4DpUvuQ0n0E5pEsVg32fTYZyWx49qAQrKLa5DGANAyBt8w2c2QcH/7UTyUtJkBHZpNKAg2CR9N5Sw19TXt2TpxiV47k94tbuadGtM=
Content-Type: multipart/mixed;
 boundary="_003_alpineLFD22119060320132103566austen3home_"
MIME-Version: 1.0
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd774d2-385c-4103-9ef9-08d6e86deca4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 21:53:34.1743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dcl0may@durham.ac.uk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB4754
Subject: [Xen-devel] issues with Python 3.8
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_003_alpineLFD22119060320132103566austen3home_
Content-Type: text/plain; charset="us-ascii"
Content-ID: <91146B2510BABE4BAD38278E12D97612@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Fedora rawhide is about to to update to Python 3.8 (in beta I think) and=20
there are two issues with compiling xen with it (see=20
https://bugzilla.redhat.com/show_bug.cgi?id=3D1704807 ).

It seems that in 3.8 python3-config --libs no longer includes -lpython3.8=20
by default which causes tools/configure to fail. You can get -lpython3.8=20
back by adding --embed , but this option isn't recognized in earlier=20
versions of python.

It also seems python 3.8 adds the options -Wno-unused-result=20
-Wsign-compare to the compilations in tools/python (though I am not sure=20
how this happens) and -Wsign-compare gives some build warnings which the=20
Fedora build treats as errors.

I have attached the patch I used to get xen-4.12.0 to build with python=20
3.8 and also the build warnings it fixes in case they are useful.

 	Michael Young=

--_003_alpineLFD22119060320132103566austen3home_
Content-Type: text/plain; name="xen.python38.patch"
Content-Description: xen.python38.patch
Content-Disposition: attachment; filename="xen.python38.patch"; size=3062;
	creation-date="Mon, 03 Jun 2019 21:53:33 GMT";
	modification-date="Mon, 03 Jun 2019 21:53:33 GMT"
Content-ID: <alpine.LFD.2.21.1906032253310.3566@austen3.home>
Content-Transfer-Encoding: base64

LS0tIHhlbi00LjEyLjAvbTQvcHl0aG9uX2RldmVsLm00Lm9yaWcJMjAxOS0wNS0zMSAyMzozMDo0
Mi40ODk3MzgxMjEgKzAxMDANCisrKyB4ZW4tNC4xMi4wL200L3B5dGhvbl9kZXZlbC5tNAkyMDE5
LTA2LTAxIDE3OjAyOjM4Ljg4NjkzNDQ0MSArMDEwMA0KQEAgLTI0LDcgKzI0LDggQEANCiAgICAg
ZG5sIElmIHB5dGhvbi1jb25maWcgaXMgZm91bmQgdXNlIGl0DQogICAgIENQUEZMQUdTPSIkQ0ZM
QUdTIGAkUFlUSE9OLWNvbmZpZyAtLWNmbGFnc2AiDQogICAgIExERkxBR1M9IiRMREZMQUdTIGAk
UFlUSE9OLWNvbmZpZyAtLWxkZmxhZ3NgIg0KLSAgICBMSUJTPSIkTElCUyBgJFBZVEhPTi1jb25m
aWcgLS1saWJzYCINCisgICAgTElCU1RNUD0iYCRQWVRIT04tY29uZmlnIC0tbGlicyAtLWVtYmVk
YCIgfHwgTElCU1RNUD0iYCRQWVRIT04tY29uZmlnIC0tbGlic2AiDQorICAgIExJQlM9IiRMSUJT
ICRMSUJTVE1QIg0KIF0pDQogDQogQUNfQ0hFQ0tfSEVBREVSKFtQeXRob24uaF0sIFtdLA0KLS0t
IHhlbi00LjEyLjAvdG9vbHMvY29uZmlndXJlLm9yaWcJMjAxOS0wNS0zMSAyMzozMDo0Mi40OTg3
Mzg0NTIgKzAxMDANCisrKyB4ZW4tNC4xMi4wL3Rvb2xzL2NvbmZpZ3VyZQkyMDE5LTA2LTAxIDE3
OjA4OjI2LjEwMDcyNzY1OCArMDEwMA0KQEAgLTc0ODIsNyArNzQ4Miw4IEBADQogDQogICAgICAg
ICBDUFBGTEFHUz0iJENGTEFHUyBgJFBZVEhPTi1jb25maWcgLS1jZmxhZ3NgIg0KICAgICBMREZM
QUdTPSIkTERGTEFHUyBgJFBZVEhPTi1jb25maWcgLS1sZGZsYWdzYCINCi0gICAgTElCUz0iJExJ
QlMgYCRQWVRIT04tY29uZmlnIC0tbGlic2AiDQorICAgIExJQlNUTVA9ImAkUFlUSE9OLWNvbmZp
ZyAtLWxpYnMgLS1lbWJlZGAiIHx8IExJQlNUTVA9ImAkUFlUSE9OLWNvbmZpZyAtLWxpYnNgIg0K
KyAgICBMSUJTPSIkTElCUyAkTElCU1RNUCINCiANCiBmaQ0KIA0KLS0tIHhlbi00LjEyLjAvdG9v
bHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jLm9yaWcJMjAxOS0wNC0wMSAxMjowMzoyMy4w
MDAwMDAwMDAgKzAxMDANCisrKyB4ZW4tNC4xMi4wL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwv
eGMveGMuYwkyMDE5LTA2LTAxIDE3OjU4OjM5LjU2NzcyOTYzMCArMDEwMA0KQEAgLTExOCw3ICsx
MTgsOCBAQA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFB5T2JqZWN0ICpr
d2RzKQ0KIHsNCiAgICAgdWludDMyX3QgZG9tID0gMCwgdGFyZ2V0ID0gMDsNCi0gICAgaW50ICAg
ICAgcmV0LCBpOw0KKyAgICBpbnQgICAgICByZXQ7DQorICAgIHVuc2lnbmVkIGludCBpOw0KICAg
ICBQeU9iamVjdCAqcHloYW5kbGUgPSBOVUxMOw0KICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVh
dGVkb21haW4gY29uZmlnID0gew0KICAgICAgICAgLmhhbmRsZSA9IHsNCkBAIC0yOTYsNyArMjk3
LDcgQEANCiANCiBzdGF0aWMgUHlPYmplY3QgKnB5eGNfZG9tYWluX3NldGhhbmRsZShYY09iamVj
dCAqc2VsZiwgUHlPYmplY3QgKmFyZ3MpDQogew0KLSAgICBpbnQgaTsNCisgICAgdW5zaWduZWQg
aW50IGk7DQogICAgIHVpbnQzMl90IGRvbTsNCiAgICAgUHlPYmplY3QgKnB5aGFuZGxlOw0KICAg
ICB4ZW5fZG9tYWluX2hhbmRsZV90IGhhbmRsZTsNCkBAIC0zMzcsNyArMzM4LDggQEANCiAgICAg
UHlPYmplY3QgKmxpc3QsICppbmZvX2RpY3QsICpweWhhbmRsZTsNCiANCiAgICAgdWludDMyX3Qg
Zmlyc3RfZG9tID0gMDsNCi0gICAgaW50IG1heF9kb21zID0gMTAyNCwgbnJfZG9tcywgaSwgajsN
CisgICAgaW50IG1heF9kb21zID0gMTAyNCwgbnJfZG9tcywgaTsNCisgICAgdW5zaWduZWQgaW50
IGo7DQogICAgIHhjX2RvbWluZm9fdCAqaW5mbzsNCiANCiAgICAgc3RhdGljIGNoYXIgKmt3ZF9s
aXN0W10gPSB7ICJmaXJzdF9kb20iLCAibWF4X2RvbXMiLCBOVUxMIH07DQpAQCAtNjMyLDcgKzYz
NCw4IEBADQogew0KICAgICB1aW50MzJfdCBzYmRmOw0KICAgICB1aW50MzJfdCBtYXhfc2RldnMs
IG51bV9zZGV2czsNCi0gICAgaW50IGRvbWlkLCBzZWcsIGJ1cywgZGV2LCBmdW5jLCByYywgaTsN
CisgICAgaW50IGRvbWlkLCBzZWcsIGJ1cywgZGV2LCBmdW5jLCByYzsNCisgICAgdW5zaWduZWQg
aW50IGk7DQogICAgIFB5T2JqZWN0ICpQeXN0cjsNCiAgICAgY2hhciAqZ3JvdXBfc3RyOw0KICAg
ICBjaGFyIGRldl9zdHJbOV07DQpAQCAtOTcyLDcgKzk3NSw3IEBADQogew0KICAgICB4Y19waHlz
aW5mb190IHBpbmZvOw0KICAgICBjaGFyIGNwdV9jYXBbMTI4XSwgdmlydF9jYXBzWzEyOF0sICpw
Ow0KLSAgICBpbnQgaTsNCisgICAgdW5zaWduZWQgaW50IGk7DQogICAgIGNvbnN0IGNoYXIgKnZp
cnRjYXBfbmFtZXNbXSA9IHsgImh2bSIsICJodm1fZGlyZWN0aW8iIH07DQogDQogICAgIGlmICgg
eGNfcGh5c2luZm8oc2VsZi0+eGNfaGFuZGxlLCAmcGluZm8pICE9IDAgKQ0KLS0tIHhlbi00LjEy
LjAvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94cy94cy5jLm9yaWcJMjAxOS0wNC0wMSAxMjow
MzoyMy4wMDAwMDAwMDAgKzAxMDANCisrKyB4ZW4tNC4xMi4wL3Rvb2xzL3B5dGhvbi94ZW4vbG93
bGV2ZWwveHMveHMuYwkyMDE5LTA2LTAxIDE4OjU5OjQ2LjMxNjc2MDU2MSArMDEwMA0KQEAgLTE4
Niw3ICsxODYsNyBAQA0KICAgICBQeV9FTkRfQUxMT1dfVEhSRUFEUw0KIA0KICAgICBpZiAoeHN2
YWwpIHsNCi0gICAgICAgIGludCBpOw0KKyAgICAgICAgdW5zaWduZWQgaW50IGk7DQogICAgICAg
ICBQeU9iamVjdCAqdmFsID0gUHlMaXN0X05ldyh4c3ZhbF9uKTsNCiAgICAgICAgIGZvciAoaSA9
IDA7IGkgPCB4c3ZhbF9uOyBpKyspDQogI2lmIFBZX01BSk9SX1ZFUlNJT04gPj0gMw0KQEAgLTI3
Niw3ICsyNzYsNyBAQA0KICAgICBzdHJ1Y3QgeHNfaGFuZGxlICp4aCA9IHhzaGFuZGxlKHNlbGYp
Ow0KICAgICBzdHJ1Y3QgeHNfcGVybWlzc2lvbnMgKnBlcm1zOw0KICAgICB1bnNpZ25lZCBpbnQg
cGVybXNfbiA9IDA7DQotICAgIGludCBpOw0KKyAgICB1bnNpZ25lZCBpbnQgaTsNCiANCiAgICAg
eHNfdHJhbnNhY3Rpb25fdCB0aDsNCiAgICAgY2hhciAqdGhzdHI7DQo=

--_003_alpineLFD22119060320132103566austen3home_
Content-Type: text/plain; name="warnings.fixed.txt"
Content-Description: warnings.fixed.txt
Content-Disposition: attachment; filename="warnings.fixed.txt"; size=2393;
	creation-date="Mon, 03 Jun 2019 21:53:33 GMT";
	modification-date="Mon, 03 Jun 2019 21:53:33 GMT"
Content-ID: <alpine.LFD.2.21.1906032253311.3566@austen3.home>
Content-Transfer-Encoding: base64

QlVJTERTVERFUlI6IHhlbi9sb3dsZXZlbC94Yy94Yy5jOiBJbiBmdW5jdGlvbiDigJhweXhjX2Rv
bWFpbl9jcmVhdGXigJk6DQpCVUlMRFNUREVSUjogeGVuL2xvd2xldmVsL3hjL3hjLmM6MTQ4OjI0
OiB3YXJuaW5nOiBjb21wYXJpc29uIG9mIGludGVnZXIgZXhwcmVzc2lvbnMgb2YgZGlmZmVyZW50
IHNpZ25lZG5lc3M6IOKAmGludOKAmSBhbmQg4oCYbG9uZyB1bnNpZ25lZCBpbnTigJkgWy1Xc2ln
bi1jb21wYXJlXQ0KQlVJTERTVERFUlI6ICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgc2l6ZW9m
KHhlbl9kb21haW5faGFuZGxlX3QpOyBpKysgKQ0KQlVJTERTVERFUlI6ICAgICAgICAgICAgICAg
ICAgICAgICAgIF4NCkJVSUxEU1RERVJSOiB4ZW4vbG93bGV2ZWwveGMveGMuYzogSW4gZnVuY3Rp
b24g4oCYcHl4Y19kb21haW5fc2V0aGFuZGxl4oCZOg0KQlVJTERTVERFUlI6IHhlbi9sb3dsZXZl
bC94Yy94Yy5jOjMxMzoyMDogd2FybmluZzogY29tcGFyaXNvbiBvZiBpbnRlZ2VyIGV4cHJlc3Np
b25zIG9mIGRpZmZlcmVudCBzaWduZWRuZXNzOiDigJhpbnTigJkgYW5kIOKAmGxvbmcgdW5zaWdu
ZWQgaW504oCZIFstV3NpZ24tY29tcGFyZV0NCkJVSUxEU1RERVJSOiAgICAgIGZvciAoIGkgPSAw
OyBpIDwgc2l6ZW9mKHhlbl9kb21haW5faGFuZGxlX3QpOyBpKysgKQ0KQlVJTERTVERFUlI6ICAg
ICAgICAgICAgICAgICAgICAgXg0KQlVJTERTVERFUlI6IHhlbi9sb3dsZXZlbC94Yy94Yy5jOiBJ
biBmdW5jdGlvbiDigJhweXhjX2RvbWFpbl9nZXRpbmZv4oCZOg0KQlVJTERTVERFUlI6IHhlbi9s
b3dsZXZlbC94Yy94Yy5jOjM5MjoyNDogd2FybmluZzogY29tcGFyaXNvbiBvZiBpbnRlZ2VyIGV4
cHJlc3Npb25zIG9mIGRpZmZlcmVudCBzaWduZWRuZXNzOiDigJhpbnTigJkgYW5kIOKAmGxvbmcg
dW5zaWduZWQgaW504oCZIFstV3NpZ24tY29tcGFyZV0NCkJVSUxEU1RERVJSOiAgICAgICAgICBm
b3IgKCBqID0gMDsgaiA8IHNpemVvZih4ZW5fZG9tYWluX2hhbmRsZV90KTsgaisrICkNCkJVSUxE
U1RERVJSOiAgICAgICAgICAgICAgICAgICAgICAgICBeDQpCVUlMRFNUREVSUjogeGVuL2xvd2xl
dmVsL3hjL3hjLmM6IEluIGZ1bmN0aW9uIOKAmHB5eGNfZ2V0X2RldmljZV9ncm91cOKAmToNCkJV
SUxEU1RERVJSOiB4ZW4vbG93bGV2ZWwveGMveGMuYzo2Nzg6MjA6IHdhcm5pbmc6IGNvbXBhcmlz
b24gb2YgaW50ZWdlciBleHByZXNzaW9ucyBvZiBkaWZmZXJlbnQgc2lnbmVkbmVzczog4oCYaW50
4oCZIGFuZCDigJh1aW50MzJfdOKAmSB7YWthIOKAmHVuc2lnbmVkIGludOKAmX0gWy1Xc2lnbi1j
b21wYXJlXQ0KQlVJTERTVERFUlI6ICAgICAgZm9yICggaSA9IDA7IGkgPCBudW1fc2RldnM7IGkr
KyApDQpCVUlMRFNUREVSUjogICAgICAgICAgICAgICAgICAgICBeDQpCVUlMRFNUREVSUjogeGVu
L2xvd2xldmVsL3hjL3hjLmM6IEluIGZ1bmN0aW9uIOKAmHB5eGNfcGh5c2luZm/igJk6DQpCVUlM
RFNUREVSUjogeGVuL2xvd2xldmVsL3hjL3hjLmM6OTgzOjIwOiB3YXJuaW5nOiBjb21wYXJpc29u
IG9mIGludGVnZXIgZXhwcmVzc2lvbnMgb2YgZGlmZmVyZW50IHNpZ25lZG5lc3M6IOKAmGludOKA
mSBhbmQg4oCYbG9uZyB1bnNpZ25lZCBpbnTigJkgWy1Xc2lnbi1jb21wYXJlXQ0KQlVJTERTVERF
UlI6ICAgICAgZm9yICggaSA9IDA7IGkgPCBzaXplb2YocGluZm8uaHdfY2FwKS80OyBpKysgKQ0K
QlVJTERTVERFUlI6ICAgICAgICAgICAgICAgICAgICAgXg0KQlVJTERTVERFUlI6IHhlbi9sb3ds
ZXZlbC94cy94cy5jOiBJbiBmdW5jdGlvbiDigJh4c3B5X2xz4oCZOg0KQlVJTERTVERFUlI6IHhl
bi9sb3dsZXZlbC94cy94cy5jOjE5MToyMzogd2FybmluZzogY29tcGFyaXNvbiBvZiBpbnRlZ2Vy
IGV4cHJlc3Npb25zIG9mIGRpZmZlcmVudCBzaWduZWRuZXNzOiDigJhpbnTigJkgYW5kIOKAmHVu
c2lnbmVkIGludOKAmSBbLVdzaWduLWNvbXBhcmVdDQpCVUlMRFNUREVSUjogICAgICAgICAgZm9y
IChpID0gMDsgaSA8IHhzdmFsX247IGkrKykNCkJVSUxEU1RERVJSOiAgICAgICAgICAgICAgICAg
ICAgICAgIF4NCkJVSUxEU1RERVJSOiB4ZW4vbG93bGV2ZWwveHMveHMuYzogSW4gZnVuY3Rpb24g
4oCYeHNweV9nZXRfcGVybWlzc2lvbnPigJk6DQpCVUlMRFNUREVSUjogeGVuL2xvd2xldmVsL3hz
L3hzLmM6Mjk3OjIzOiB3YXJuaW5nOiBjb21wYXJpc29uIG9mIGludGVnZXIgZXhwcmVzc2lvbnMg
b2YgZGlmZmVyZW50IHNpZ25lZG5lc3M6IOKAmGludOKAmSBhbmQg4oCYdW5zaWduZWQgaW504oCZ
IFstV3NpZ24tY29tcGFyZV0NCkJVSUxEU1RERVJSOiAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwg
cGVybXNfbjsgaSsrKSB7DQpCVUlMRFNUREVSUjogICAgICAgICAgICAgICAgICAgICAgICBeDQo=

--_003_alpineLFD22119060320132103566austen3home_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--_003_alpineLFD22119060320132103566austen3home_--

