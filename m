Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7891BE56B8
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 00:55:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO8RI-0004Cz-UA; Fri, 25 Oct 2019 22:52:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BhMP=YS=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1iO8RG-0004Cs-Ra
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 22:52:10 +0000
X-Inumbo-ID: 128e05c0-f77a-11e9-beca-bc764e2007e4
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.124]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 128e05c0-f77a-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 22:52:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkpH8r/tVG8NAxu4JpDFNJrSaR3eKYsOUDxi5T2nq7u3LKXV5i6TX9vi0f7qoGUDyxBqvoNsyQBc884udZq4fhLcQQWobN19MM7XoOXQEgHqG1kgqtq95xSg2zsFpedonkOLKqqjiVxrHl1uznsUcUJNV/fCgJxAvWf38YtCG6RV6G7xK0BAkb1v4nx/DXjthRW3wdDspPjhOq905Y4oBpmpsq5kCW3r+kQ1vlWkvhuUQQQmF7HAznFeHDnWDjsArJcvDnd0CfhLm8Va93qcMiHBfcAr/oKzdhCLQaWYPZ8ughD2XLw+LcNZrI+xpz1ApV7hDfRscNu8k+crgqvDYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRLI18g6UexQancK1ASjxVAK8n2RHs+RcegUGoiT9i0=;
 b=OgnrKaTVstmQHrzRt0uIhqeuVYdyARlqBeG/R9f34m8KfR0fvLkomgNwVNpmi+FG3CxEc04sRdhg7UKOCHPRyd3YmLs6C3C8O45+q2eLK5nnclx0GuN8o1DKTI/gex7JeJObQYDQNuiWln7R3LE9E1/Ve6hBwo7MkxkVgqS0XbxHQB1SeAlsYI0URP7W4YtTkNF4dtJcbu+USSzV2lWQmGbgUia1rT18uXaijKhcbnQ8/nruJ5I6lO1v3AsmhdZq17mvvARGxiL8y9Mgoe+WkRQGFOc4fQWR8AVo+hzu8SD/e+sWSNg3Rrfy+p9E3g7A5bi1kxP6EdgsgalSOHIKYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRLI18g6UexQancK1ASjxVAK8n2RHs+RcegUGoiT9i0=;
 b=l1YCwXf22SW7Y0EGYjN1V5N2pjh44nCItDj7NqWszwnCOjYgvkWQ9RAtP7qLRSxhr6GPMLC0trAZbYp68yj08QjXvIG0RDMQN1G4gak245NUV5bFHgPgss2ZjseiDt7OPOx5Wg4x87PBmhkov97e112pDgiJjLdG7+4jnMNSTLM=
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com (20.177.200.18) by
 VI1PR06MB4126.eurprd06.prod.outlook.com (20.176.3.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Fri, 25 Oct 2019 22:52:07 +0000
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::d067:c8d1:e873:5632]) by VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::d067:c8d1:e873:5632%5]) with mapi id 15.20.2387.021; Fri, 25 Oct 2019
 22:52:07 +0000
From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [XEN PATCH 0/3] read grubenv and set default from it
Thread-Index: AQHVi4bTyBvpbwXj3ku6LOJzISE5Yg==
Date: Fri, 25 Oct 2019 22:52:06 +0000
Message-ID: <cover.1572038720.git.m.a.young@durham.ac.uk>
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
x-ms-office365-filtering-correlation-id: 08d03aaa-abec-4f53-603b-08d7599df5ea
x-ms-traffictypediagnostic: VI1PR06MB4126:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR06MB4126AF9A01A3C61349B6E02E87650@VI1PR06MB4126.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(18054003)(189003)(199004)(81166006)(8936002)(7736002)(305945005)(6116002)(36756003)(66946007)(5640700003)(52116002)(186003)(66556008)(4326008)(50226002)(8676002)(66446008)(2351001)(64756008)(66476007)(2501003)(5660300002)(6512007)(6916009)(25786009)(6436002)(476003)(86362001)(2616005)(2906002)(46003)(81156014)(71190400001)(71200400001)(14444005)(256004)(786003)(316002)(102836004)(99286004)(386003)(6506007)(14454004)(6486002)(478600001)(486006)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR06MB4126;
 H:VI1PR06MB4720.eurprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: durham.ac.uk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: it7rgBEd/cc4fhfqHn2TKaWn/XEZwd4ilpKEKDBHDCik1Sb01I51bW/+6St3IPuz+ChKjCKJrAxg3FjYEZUVuj/rQTdtCbv2jJ6vU7i79GtmkJ4zOKwvEg+uNMDV1oqMrVFL5uwCn8p5cQvmwtZl5blGcV9X4ufUo/oWDzc/o9cloEHM0ioLZMXk65tIGNWnVQRjLL1c1my1SiqP/TgkTf8fgWpdHzNRmklSotihmZXl1sJ3yIQKxnV+4n/DACudRol23L3TlUmEU206haaJhKIy81d5XygXpcgIwdqTikYcrKLhGI23Abw18au70G8LaEFghJDnT1jJBt4/ZQqvuDSEAw5A9ArEYqUhsc3aTG9v3PVDhRBDQikOfMKnimP3/09WUZn0Tqt6tKPSB7QBxjTTYWYAlxNhXOqf9ydcmhvIM/O3mEUF6Bd/jGOpnlkU
MIME-Version: 1.0
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d03aaa-abec-4f53-603b-08d7599df5ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 22:52:06.9278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A2HHyqLzfSIPo9Lc2y308/1eDRMTLtClpG23I2chuR7VuMj8pZuPX19WIbthD/fJ0E/dTeO1oZ/1yyY9NKMmVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB4126
Subject: [Xen-devel] [XEN PATCH 0/3] read grubenv and set default from it
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

VGhpcyBzZXJpZXMgb2YgcGF0Y2hlcyBpcyB0byBpbXByb3ZlIHRoZSBwYXJzaW5nIGJ5IHB5Z3J1
YiBvZiBncnViCmNvbmZpZ3VyYXRpb24gb24gRmVkb3JhLiBUaGUgY3VycmVudCByZXN1bHQgb2Yg
cGFyc2luZyBpcyBnZW5lcmFsbHkKdGhhdCB0aGUgc2Vjb25kIGtlcm5lbCBsaXN0ZWQgaXMgc2V0
IGFzIHRoZSBkZWZhdWx0IGR1ZSB0byBhCnNldCBkZWZhdWx0PTEgbGluZSBpbiBncnViLmNmZyB3
aGljaCBpcyBvbmx5IGludGVuZGVkIHRvIGJlCnJlYWNoZWQgYWZ0ZXIgcmVwZWF0ZWQgYm9vdCBm
YWlsdXJlcy4KClRoZSBwYXRjaGVzIHJlYWQgdGhlIGdydWJlbnYgZmlsZSAod2hpY2ggY29uc2lz
dHMgb2Yga2V5PXZhbHVlIGxpbmVzCnBhZGRlZCB0byAxMDI0IGNoYXJhY3RlcnMgYnkgIyBjaGFy
YWN0ZXJzKSB0byBnZXQgdGhlIHZhbHVlcyBvZgpuZXh0X2VudHJ5IGFuZCBzYXZlZF9lbnRyeSwg
d2hpY2ggY2FuIGJlIGEga2VybmVsIHN0cmluZyBvciBhbgpvcmRlciBudW1iZXIuIFVuZm9ydHVu
YXRlbHksIGZvciBGZWRvcmEgMzEgYXQgbGVhc3QsIHRoaXMgaXMKb2Z0ZW4gYSBCTFMtc3R5bGUg
c3RyaW5nIHNvIGl0IGlzbid0IG5lY2Vzc2FyaWx5IHVzZWZ1bC4gVGhlIHBhdGNoZXMKdXNlIHRo
ZSB2YWx1ZSBvZiBuZXh0X2VudHJ5IG9yIG9mIHNhdmVkX2VudHJ5IHRvIHNldCB0aGUgZGVmYXVs
dAprZXJuZWwgb3Igc2V0cyBpdCB0byB0aGUgZmlyc3Qga2VybmVsIGxpc3RlZCBpZiB0aG9zZSB2
YWx1ZXMgYXJlIHNldApidXQgbm90IHVzZWQuCgoKTWljaGFlbCBZb3VuZyAoMyk6CiAgc2V0IGRl
ZmF1bHQga2VybmVsIGZyb20gZ3J1YmVudiBuZXh0X2VudHJ5IG9yIHNhdmVkX2VudHJ5CiAgcmVh
ZCBhIGdydWJlbnYgZmlsZSBpZiBpdCBpcyBuZXh0IHRvIHRoZSBncnViLmNmZyBmaWxlCiAgRXhh
bXBsZSBGZWRvcmEgMzEgZ3J1Yi5jZmcgYW5kIGdydWJlbnYgZmlsZXMKCiB0b29scy9weWdydWIv
ZXhhbXBsZXMvZmVkb3JhLTMxLmdydWIuY2ZnIHwgMjAwICsrKysrKysrKysrKysrKysrKysrKysr
CiB0b29scy9weWdydWIvZXhhbXBsZXMvZmVkb3JhLTMxLmdydWJlbnYgIHwgICA1ICsKIHRvb2xz
L3B5Z3J1Yi9zcmMvR3J1YkNvbmYucHkgICAgICAgICAgICAgfCAgMzEgKysrLQogdG9vbHMvcHln
cnViL3NyYy9weWdydWIgICAgICAgICAgICAgICAgICB8ICAyMSArKy0KIDQgZmlsZXMgY2hhbmdl
ZCwgMjUzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQg
dG9vbHMvcHlncnViL2V4YW1wbGVzL2ZlZG9yYS0zMS5ncnViLmNmZwogY3JlYXRlIG1vZGUgMTAw
NjQ0IHRvb2xzL3B5Z3J1Yi9leGFtcGxlcy9mZWRvcmEtMzEuZ3J1YmVudgoKLS0gCjIuMjEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
