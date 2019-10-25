Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40578E56B5
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 00:55:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO8RX-0004FB-H0; Fri, 25 Oct 2019 22:52:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BhMP=YS=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1iO8RW-0004F2-5t
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 22:52:26 +0000
X-Inumbo-ID: 1aee5bfc-f77a-11e9-94cd-12813bfff9fa
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.97]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1aee5bfc-f77a-11e9-94cd-12813bfff9fa;
 Fri, 25 Oct 2019 22:52:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCmHEVol8SfXRVCPZ1zaFUQwK8iltlTA/2mJ2wxZ/gv6NL/ux6RNeg+Gk2dHZ2FaaSh8ZvNWLpHXPh1dqnzDvbuAx8TcA86F/BeAfzwRE68LvTmRbbX4Wwx5WubM5SGw01NOou2sIxdB6SDqxsngblVYyMQu665xZWG/IT+/2uv6zBfEN9z/4+3hEhcRs3gYKaEfPufmOIbC5I6Xt/iB4HtDid5UdYl8tToV+xl+M8ZUu//fTzgAJn2M9aPtdtIakJN2Wuex+fDwlAt7TaXuhNUGD++DSKRxJDmdzDnldwEMPsJoIk5x3+bibjqDXopBfYYJhBfLSRsDB8jyq9TBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7TaoTyM0pJll+A8glmDyS4mzp9+V71BAb5vP2iXglA=;
 b=WREPHqwU2O5LOVmxhiE22rcACpS6mz5PB4mjC1/Fku5jTO0bdsS2inePD65UZu2RCxBJlPvepcGKsRNlT10M9d4vJYSpqEx4aZuNlXgK+r/I49XOptDJaQhXYSBDKCggHi5GydKDJ+6rP4hbRth2Q0pz2J43cfXKAYSEB3GE5nZXDJegXEKfmJe9jbxMAcwsQYdEyPvwT7JetLPhOiurc5faVM8IA1e7919Indn4QHkqDR5+gxe9nAfW9mQA+pRxuL6hDcQ2GzMOMZgje4Rn8Vs/i2gesOVk3XYBCz0CB80NLJYTTIu1jX+sfvwjj26DWFq5LnBfmHyNY0m1ZIkUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7TaoTyM0pJll+A8glmDyS4mzp9+V71BAb5vP2iXglA=;
 b=nhTacVqbzVS5eqhnppdGzUikVqw7KNtLM0/xm/ali8Jj0KuEAYajE5qnfVAw984bdc8SXhrXrEu0z+LoTqy4shiGF8TRKgtPlIFrL1agq438RBMqDw/493q/rip6mcONtqXP/w2MnQvk+fgljLaPyVp7crPWR5tPbpFlulzLZ6g=
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com (20.177.200.18) by
 VI1PR06MB5583.eurprd06.prod.outlook.com (20.177.202.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Fri, 25 Oct 2019 22:52:21 +0000
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::d067:c8d1:e873:5632]) by VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::d067:c8d1:e873:5632%5]) with mapi id 15.20.2387.021; Fri, 25 Oct 2019
 22:52:21 +0000
From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [XEN PATCH 2/3] read a grubenv file if it is next to the
 grub.cfg file
Thread-Index: AQHVi4bcsVc5X9HnfkOVxxCiimkx9Q==
Date: Fri, 25 Oct 2019 22:52:21 +0000
Message-ID: <2491e384fae5399baf8639e07882f8ee687b6370.1572038720.git.m.a.young@durham.ac.uk>
References: <cover.1572038720.git.m.a.young@durham.ac.uk>
In-Reply-To: <cover.1572038720.git.m.a.young@durham.ac.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a00:23c4:921a:2100:1097:224c:243b:f186]
x-mailer: git-send-email 2.21.0
x-clientproxiedby: LNXP123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::28) To VI1PR06MB4720.eurprd06.prod.outlook.com
 (2603:10a6:803:90::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=m.a.young@durham.ac.uk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97f7528c-86d6-4662-7643-08d7599dfeac
x-ms-traffictypediagnostic: VI1PR06MB5583:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR06MB558382FCD683C5314B63127887650@VI1PR06MB5583.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(199004)(189003)(66476007)(66946007)(256004)(8676002)(8936002)(81156014)(50226002)(66556008)(305945005)(7736002)(2501003)(54906003)(36756003)(66446008)(186003)(5660300002)(14454004)(86362001)(76176011)(786003)(316002)(52116002)(102836004)(386003)(6506007)(6436002)(2616005)(6512007)(71200400001)(71190400001)(446003)(64756008)(99286004)(6486002)(11346002)(25786009)(486006)(5640700003)(478600001)(4326008)(476003)(2906002)(118296001)(46003)(6116002)(6916009)(2351001)(81166006)(14444005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR06MB5583;
 H:VI1PR06MB4720.eurprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: durham.ac.uk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mIGl+HEXn+erTnOy1hSC14DVP9J1d9RT7cJk0uCXDqdqd6BwAwlRQr2auMfZvRO6q8vo7J0jR/AsyzGBgnGumBnroW6zJtmF6+TMDCSSpq5ZtvL/BCfH1t5d968eIIsduAH7ghdOZ/O48M64IwEl+TzFICNZ37njXCudmYdzzEazVQPEMfxmuwB6hBdFIppAVHItllIeZgkDkJuNQwxRYBLgai4xK8h+JnNuUmx3rgwhI2QcP72CeND9X5iAdV+MSaSwEw79FNk1jJHvsllvIM5qUmyDp8QoV+/7QAqVF/1fz2Qcbadiq0xX2slnuivJymKqWCCr9gHoSwTU1qlZ/t1VSQM/3vefzFU9ZeS6qbntgb9ypsSw5A2zDR1YsAEtSMT0ymPDaNcikxxRFZ/Ok4E7tgaFle9mvXbtGIxIHOsXC+52ZJB/LPdtcG4z6f7G
MIME-Version: 1.0
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f7528c-86d6-4662-7643-08d7599dfeac
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 22:52:21.5406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 86AkGu7O8b+MxnAtOI607XHeQAfgNu8MgL6ALFkmK/Y3zb4aDfI9T8FJSJT1/6ISJeZ13PAmLwBpHuryZCzUOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB5583
Subject: [Xen-devel] [XEN PATCH 2/3] read a grubenv file if it is next to
 the grub.cfg file
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, "YOUNG,
 MICHAEL A." <m.a.young@durham.ac.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBhIGdydWIuY2ZnIGZpbGUgaXMgZm91bmQgdGhpcyBwYXRjaCBjaGVja3MgaWYgdGhlcmUg
aXMgZ3J1YmVudgpmaWxlIGluIHRoZSBzYW1lIGRpcmVjdG9yeSBhcyB0aGUgZ3J1Yi5jZmcgZmls
ZS4gSWYgdGhlcmUgaXMgaXQKcGFzc2VzIHRoZSBjb250ZW50cyB0byBwYXJzZSgpLgoKU2lnbmVk
LW9mZi1ieTogTWljaGFlbCBZb3VuZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51az4KLS0tCiB0b29s
cy9weWdydWIvc3JjL3B5Z3J1YiB8IDIxICsrKysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9v
bHMvcHlncnViL3NyYy9weWdydWIgYi90b29scy9weWdydWIvc3JjL3B5Z3J1YgppbmRleCBjZTdh
YjBlYjhjLi41M2EwODAzODE3IDEwMDc1NQotLS0gYS90b29scy9weWdydWIvc3JjL3B5Z3J1Ygor
KysgYi90b29scy9weWdydWIvc3JjL3B5Z3J1YgpAQCAtNDU3LDEwICs0NTcsMjUgQEAgY2xhc3Mg
R3J1YjoKICAgICAgICAgIyBsaW1pdCByZWFkIHNpemUgdG8gYXZvaWQgcGF0aG9sb2dpY2FsIGNh
c2VzCiAgICAgICAgIGJ1ZiA9IGYucmVhZChGU19SRUFEX01BWCkKICAgICAgICAgZGVsIGYKLSAg
ICAgICAgaWYgc3lzLnZlcnNpb25faW5mb1swXSA8IDM6Ci0gICAgICAgICAgICBzZWxmLmNmLnBh
cnNlKGJ1ZikKKyAgICAgICAgIyBjaGVjayBmb3IgYSBncnViZW52IGZpbGUgbmV4dCB0byB0aGUg
Z3J1Yi5jZmcgZmlsZQorICAgICAgICAoZmRpciwgZnNlcCwgZmZpbGUpID0gc2VsZi5jZi5maWxl
bmFtZS5ycGFydGl0aW9uKCIvIikKKyAgICAgICAgaWYgZmRpciAhPSAiIiBhbmQgZmZpbGUgPT0g
ImdydWIuY2ZnIjoKKyAgICAgICAgICAgIGZlbnYgPSBmZGlyICsgIi9ncnViZW52IgogICAgICAg
ICBlbHNlOgotICAgICAgICAgICAgc2VsZi5jZi5wYXJzZShidWYuZGVjb2RlKCkpCisgICAgICAg
ICAgICBmZW52ID0gIiIKKyAgICAgICAgaWYgZmVudiAhPSAiIiBhbmQgZnMuZmlsZV9leGlzdHMo
ZmVudik6CisgICAgICAgICAgICBmZW52ZiA9IGZzLm9wZW5fZmlsZShmZW52KQorICAgICAgICAg
ICAgZ3J1YmVudiA9IGZlbnZmLnJlYWQoRlNfUkVBRF9NQVgpCisgICAgICAgICAgICBkZWwgZmVu
dmYKKyAgICAgICAgICAgIGlmIHN5cy52ZXJzaW9uX2luZm9bMF0gPCAzOgorICAgICAgICAgICAg
ICAgIHNlbGYuY2YucGFyc2UoYnVmLCBncnViZW52KQorICAgICAgICAgICAgZWxzZToKKyAgICAg
ICAgICAgICAgICBzZWxmLmNmLnBhcnNlKGJ1Zi5kZWNvZGUoKSwgZ3J1YmVudi5kZWNvZGUoKSkK
KyAgICAgICAgZWxzZToKKyAgICAgICAgICAgIGlmIHN5cy52ZXJzaW9uX2luZm9bMF0gPCAzOgor
ICAgICAgICAgICAgICAgIHNlbGYuY2YucGFyc2UoYnVmKQorICAgICAgICAgICAgZWxzZToKKyAg
ICAgICAgICAgICAgICBzZWxmLmNmLnBhcnNlKGJ1Zi5kZWNvZGUoKSkKIAogICAgIGRlZiBpbWFn
ZV9pbmRleChzZWxmKToKICAgICAgICAgaWYgaXNpbnN0YW5jZShzZWxmLmNmLmRlZmF1bHQsIGlu
dCk6Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
