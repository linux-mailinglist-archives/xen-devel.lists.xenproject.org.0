Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFB6E56B6
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 00:55:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO8RS-0004E8-7z; Fri, 25 Oct 2019 22:52:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BhMP=YS=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1iO8RR-0004Dy-7k
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 22:52:21 +0000
X-Inumbo-ID: 1916ed44-f77a-11e9-94cd-12813bfff9fa
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.130]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1916ed44-f77a-11e9-94cd-12813bfff9fa;
 Fri, 25 Oct 2019 22:52:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckMrotn2uZ8SmceBwdIfloeui/Dq/j9zBQaKB8iaWhIKJ/FVH81EfrKhHBBvCShiQgcOFVWAwyohwqattFDDjM9fRM0Oo3Etw+IAmPnw3LYJVHl/C8tvuga+C5vmR0Vun6jlkJE6gUtIu5CYcoYQiFWm7wtyiiVEbFVSlN8bFoWolSAQzMMgqwmIhovTtX5OS4yMT4QWLK+y1BUr3ob8BgJ4Ze8/wkOpRjGjjntT50mcfRNNAoSKKWvUGFiY6NoGD9xO8YesNhtutFa8PLbzI90RzFw8gxoYAIBdiJp9Kp4SMTB1++W+FezEc5papd86A8ZpnHcRRWtLDgswb+SVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqQssvL0QFp0PYbissrRB7wzp7O6AgiJU0bpAsVoq18=;
 b=oFXFkqCRJYt3ttE7wQQa0p5wBzji9ktFPTT08U0QMIdyVIk5Gl8Ue65Dna6ZYtoQRqwYGORX4Wg+2byhQzWOt3ztcG/xVh4dENoLskUajWsJhqSbR4+qrmaDArzr+LQBWXWDcuUDcCK/+/fFE5/A8mzjdBEB9nMwzVSHg4LghGOC+ZXflSQnYXVBleGtztstqUbUOn/4tE43E6pn9V46ocqcKd8L9baNwabYt/dz3kVCn76QAaUlm/mu4u3v9RYS34CFN5rEkcJdcxxOUBJOWxjNAV629Kt41HyHGbfb34z/GIKVAgeCGuMcKeSnO4tJX3nmOVBhb2s7l5xB4U+jgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqQssvL0QFp0PYbissrRB7wzp7O6AgiJU0bpAsVoq18=;
 b=N3XIF6m10e7O0PKECg3vYqdC6zoRwRReNllE/T/gIQoOcZSd5rne02Re0KA7sVoG0tgCbpbU/eeOcrUCu7rQa+diaScN9fOFmWN3uuRw+11wXF0aQm8dz+VLkRXkSMUrasKC8zhynGqx5S1GDr63Zu0fuC/EEKrmxV4ZkoAqqWY=
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com (20.177.200.18) by
 VI1PR06MB5583.eurprd06.prod.outlook.com (20.177.202.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Fri, 25 Oct 2019 22:52:17 +0000
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::d067:c8d1:e873:5632]) by VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::d067:c8d1:e873:5632%5]) with mapi id 15.20.2387.021; Fri, 25 Oct 2019
 22:52:17 +0000
From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [XEN PATCH 1/3] set default kernel from grubenv next_entry or
 saved_entry
Thread-Index: AQHVi4bZp6Rlls8E60iiZZ95hwr4Gg==
Date: Fri, 25 Oct 2019 22:52:17 +0000
Message-ID: <30a4fb6bb023348af867a253f6ff1e80efc7e232.1572038720.git.m.a.young@durham.ac.uk>
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
x-ms-office365-filtering-correlation-id: 6c9b051d-2318-411c-3c2b-08d7599dfc03
x-ms-traffictypediagnostic: VI1PR06MB5583:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR06MB5583B3ECE9E0F8DB2D45457887650@VI1PR06MB5583.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
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
x-microsoft-antispam-message-info: zMJe54zRgfoNoS/SEAxRJZ3PMcXMIn+Uf8/jrterrvxLAdyy7rSkT5VPk0x5OWuEuNmqc9WnYoXsXMkz0TDXoYYH1NVQdOOKPIKWFWoCVUpOXT390N91i6oiVc5bFu+IuHdxUJRbEVYacoF8CktwOHQxQz5llKlNePDB+wrZgHtNOelsElgxt9JR3GIYsGJM58nBk0eFJ/LH7BCOY+1+iZ/VqCnQ3c7bxtY0GKbkj3W5PmTe8aMDVT5fP6gzn/FiPtpCcdtLyryK7BRtR73JdoViR/rHqRPtUc0hLtfD5UfPKjV3E19K0rZ+k/RUejY9PHJ9SoOaOIgI/JfJY+vig9xzkR6nLDq44PB3nZCMJoyhiJ47kkCZfkefKCzK5uDGHAKW53y3SOhB/tAwI1DUiHKgi0ed15ke5dtleZGOUxsGl0ygStsNYA0/2YIg3sq8
MIME-Version: 1.0
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9b051d-2318-411c-3c2b-08d7599dfc03
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 22:52:17.0791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yuFjdmEKyMrCQak5fkv3Hg6BAFYBb+M0bb+mBYukr99St9Hf0Jh+vW+N+8egzO+eYHzkcTTFtQ3OUgWWBO9bfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB5583
Subject: [Xen-devel] [XEN PATCH 1/3] set default kernel from grubenv
 next_entry or saved_entry
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

VGhpcyBwYXRjaCByZWFkcyB0aGUgY29udGVudHMgb2YgYSBncnViZW52IGZpbGUgaWYgYXZhaWxh
YmxlLCBhbmQKdXNlcyB0aGUgdmFsdWUgb2YgbmV4dF9lbnRyeSAoaW4gcHJlZmVyZW5jZSkgb3Ig
b2Ygc2F2ZWRfZW50cnkgdG8Kc2V0IHRoZSBkZWZhdWx0IGtlcm5lbCBpZiB0aGVyZSBpcyBhIG1h
dGNoaW5nIHRpdGxlIG9yIGlmIGl0IGlzIGEKbnVtYmVyLiAgSWYgZWl0aGVyIG5leHRfZW50cnkg
b3Igc2F2ZWRfZW50cnkgaXMgc2V0IGFuZCBuZWl0aGVyIGlzCnVzZWQgdGhlbiB0aGUgZGVmYXVs
dCBpcyBzZXQgdG8gMC4KClNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgWW91bmcgPG0uYS55b3VuZ0Bk
dXJoYW0uYWMudWs+Ci0tLQogdG9vbHMvcHlncnViL3NyYy9HcnViQ29uZi5weSB8IDMxICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvcHlncnViL3NyYy9HcnViQ29u
Zi5weSBiL3Rvb2xzL3B5Z3J1Yi9zcmMvR3J1YkNvbmYucHkKaW5kZXggNzNmMWJiZWQyZi4uMWZj
NjhjYWRiMiAxMDA2NDQKLS0tIGEvdG9vbHMvcHlncnViL3NyYy9HcnViQ29uZi5weQorKysgYi90
b29scy9weWdydWIvc3JjL0dydWJDb25mLnB5CkBAIC0zNjgsNyArMzY4LDcgQEAgY2xhc3MgR3J1
YjJDb25maWdGaWxlKF9HcnViQ29uZmlnRmlsZSk6CiAgICAgZGVmIG5ld19pbWFnZShzZWxmLCB0
aXRsZSwgbGluZXMpOgogICAgICAgICByZXR1cm4gR3J1YjJJbWFnZSh0aXRsZSwgbGluZXMpCiAg
Ci0gICAgZGVmIHBhcnNlKHNlbGYsIGJ1ZiA9IE5vbmUpOgorICAgIGRlZiBwYXJzZShzZWxmLCBi
dWYgPSBOb25lLCBncnViZW52ID0gTm9uZSk6CiAgICAgICAgIGlmIGJ1ZiBpcyBOb25lOgogICAg
ICAgICAgICAgaWYgc2VsZi5maWxlbmFtZSBpcyBOb25lOgogICAgICAgICAgICAgICAgIHJhaXNl
IFZhbHVlRXJyb3IoIk5vIGNvbmZpZyBmaWxlIGRlZmluZWQgdG8gcGFyc2UhIikKQEAgLTM3OSwx
MCArMzc5LDE3IEBAIGNsYXNzIEdydWIyQ29uZmlnRmlsZShfR3J1YkNvbmZpZ0ZpbGUpOgogICAg
ICAgICBlbHNlOgogICAgICAgICAgICAgbGluZXMgPSBidWYuc3BsaXQoIlxuIikKIAorICAgICAg
ICBpZiBncnViZW52IGlzIG5vdCBOb25lOgorICAgICAgICAgICAgbGluZXMgPSBncnViZW52LnNw
bGl0KCJcbiIpICsgbGluZXMKKwogICAgICAgICBpbl9mdW5jdGlvbiA9IEZhbHNlCiAgICAgICAg
IGltZyA9IE5vbmUKICAgICAgICAgdGl0bGUgPSAiIgogICAgICAgICBtZW51X2xldmVsPTAKKyAg
ICAgICAgaW1nX2NvdW50PTAKKyAgICAgICAgc2F2ZWRfZW50cnkgPSAiIgorICAgICAgICBuZXh0
X2VudHJ5ID0gIiIKKyAgICAgICAgZW50cnlfbWF0Y2hlZCA9IEZhbHNlCiAgICAgICAgIGZvciBs
IGluIGxpbmVzOgogICAgICAgICAgICAgbCA9IGwuc3RyaXAoKQogICAgICAgICAgICAgIyBza2lw
IGJsYW5rIGxpbmVzCkBAIC00MDgsNiArNDE1LDEzIEBAIGNsYXNzIEdydWIyQ29uZmlnRmlsZShf
R3J1YkNvbmZpZ0ZpbGUpOgogICAgICAgICAgICAgICAgICAgICByYWlzZSBSdW50aW1lRXJyb3Io
InN5bnRheCBlcnJvcjogY2Fubm90IG5lc3QgbWVudWVudHJ5ICglZCAlcykiICUgKGxlbihpbWcp
LGltZykpCiAgICAgICAgICAgICAgICAgaW1nID0gW10KICAgICAgICAgICAgICAgICB0aXRsZSA9
IHRpdGxlX21hdGNoLmdyb3VwKDEpCisgICAgICAgICAgICAgICAgaWYgdGl0bGUgPT0gbmV4dF9l
bnRyeToKKyAgICAgICAgICAgICAgICAgICAgc2V0YXR0cihzZWxmLCAnZGVmYXVsdCcsIGltZ19j
b3VudCkKKyAgICAgICAgICAgICAgICAgICAgZW50cnlfbWF0Y2hlZCA9IFRydWUKKyAgICAgICAg
ICAgICAgICBpZiB0aXRsZSA9PSBzYXZlZF9lbnRyeSBhbmQgbm90IGVudHJ5X21hdGNoZWQ6Cisg
ICAgICAgICAgICAgICAgICAgIHNldGF0dHIoc2VsZiwgJ2RlZmF1bHQnLCBpbWdfY291bnQpCisg
ICAgICAgICAgICAgICAgICAgIGVudHJ5X21hdGNoZWQgPSBUcnVlCisgICAgICAgICAgICAgICAg
aW1nX2NvdW50ICs9IDEKICAgICAgICAgICAgICAgICBjb250aW51ZQogCiAgICAgICAgICAgICBp
ZiBsLnN0YXJ0c3dpdGgoInN1Ym1lbnUiKToKQEAgLTQzMiw2ICs0NDYsMTQgQEAgY2xhc3MgR3J1
YjJDb25maWdGaWxlKF9HcnViQ29uZmlnRmlsZSk6CiAKICAgICAgICAgICAgIChjb20sIGFyZykg
PSBncnViX2V4YWN0X3NwbGl0KGwsIDIpCiAgICAgICAgIAorICAgICAgICAgICAgaWYgY29tID09
ICJuZXh0X2VudHJ5IjoKKyAgICAgICAgICAgICAgICBuZXh0X2VudHJ5ID0gYXJnCisgICAgICAg
ICAgICAgICAgY29udGludWUKKworICAgICAgICAgICAgaWYgY29tID09ICJzYXZlZF9lbnRyeSI6
CisgICAgICAgICAgICAgICAgc2F2ZWRfZW50cnkgPSBhcmcKKyAgICAgICAgICAgICAgICBjb250
aW51ZQorCiAgICAgICAgICAgICBpZiBjb20gPT0gInNldCI6CiAgICAgICAgICAgICAgICAgKGNv
bSxhcmcpID0gZ3J1YjJfaGFuZGxlX3NldChhcmcpCiAgICAgICAgICAgICAgICAgCkBAIC00NDgs
NiArNDcwLDEzIEBAIGNsYXNzIEdydWIyQ29uZmlnRmlsZShfR3J1YkNvbmZpZ0ZpbGUpOgogICAg
ICAgICAgICAgICAgIHBhc3MKICAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAgICAgbG9n
Z2luZy53YXJuaW5nKCJVbmtub3duIGRpcmVjdGl2ZSAlcyIgJShjb20sKSkKKworICAgICAgICBp
ZiBuZXh0X2VudHJ5LmlzZGlnaXQoKToKKyAgICAgICAgICAgIHNldGF0dHIoc2VsZiwgJ2RlZmF1
bHQnLCBuZXh0X2VudHJ5KQorICAgICAgICBlbGlmIHNhdmVkX2VudHJ5LmlzZGlnaXQoKSBhbmQg
bm90IGVudHJ5X21hdGNoZWQ6CisgICAgICAgICAgICBzZXRhdHRyKHNlbGYsICdkZWZhdWx0Jywg
c2F2ZWRfZW50cnkpCisgICAgICAgIGVsaWYgKG5leHRfZW50cnkgIT0gIiIgb3Igc2F2ZWRfZW50
cnkgIT0gIiIpIGFuZCBub3QgZW50cnlfbWF0Y2hlZDoKKyAgICAgICAgICAgIHNldGF0dHIoc2Vs
ZiwgJ2RlZmF1bHQnLCAwKQogICAgICAgICAgICAgCiAgICAgICAgIGlmIGltZyBpcyBub3QgTm9u
ZToKICAgICAgICAgICAgIHJhaXNlIFJ1bnRpbWVFcnJvcigic3ludGF4IGVycm9yOiBlbmQgb2Yg
ZmlsZSB3aXRoIG9wZW4gbWVudWVudHJ5KCVkICVzKSIgJSAobGVuKGltZyksaW1nKSkKLS0gCjIu
MjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
