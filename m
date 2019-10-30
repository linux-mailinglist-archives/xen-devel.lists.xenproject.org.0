Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B354DE9C05
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 14:06:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPncM-0002aK-2W; Wed, 30 Oct 2019 13:02:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hACg=YX=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iPncK-0002aF-Go
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 13:02:28 +0000
X-Inumbo-ID: 8565627a-fb15-11e9-bbab-bc764e2007e4
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.136]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8565627a-fb15-11e9-bbab-bc764e2007e4;
 Wed, 30 Oct 2019 13:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewmMz+p/JU4fTTULl6/x4ry6AvILj9aYxpEs/3pdj6/vwacUNYOwRVggqHFIJi0jVr+EMiiE7Qb9mKS8GB76O/A9GcYona8vKrWz0cO6x/KaCooFy9Qu4zTP35icEq0FJsq0IkMppE/DpiGKQEJand0gfIzzuVCNgSBLkN0EI0a5NYoUVJ25UR3tKR1CjpR58NfMGtGWEuaPixm5XTIDsm1h2yQUDk57caiIuuClhtyKj3gaxLxWzU+JS3Z4q5THvCzy1897JFOfgQnzHhm+dbzYIwn4ojjvnRtqJbssayQ99UjNAaakw7eet9SvLp8UwZuNcocY4RZCMaM7+ZARiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f10+Txvgyuna+o/mcWEGpY8nLy794u6auX48FLQVNDI=;
 b=AbiDkwh9i6JEeK4ycP3BtMDnHk9BLaCjUi9iM1wTypJpDZdmOAEAnd1xyZp+b1cDa3tDsUHBcRi1zufcO/S9H0g6CMQ0uWcvw3BvCB+eYweGM89HbbDnRpURz8T7IG23rs/8PH9vx5n0miqXXD2myQS8+wGe6YGb+FVoW+I9tsmK0BJMaKycRrYEA3NUKgM2KTwLaE/V7psigeSrvJfkABOA751ghuYi9e8slEOfB6X5d8uPqlNapo18VykVZitKnHuetfh2K5TMyd/zjlNjQovqhLwBhgVLvZzRkqazzAGFqWU7e8it1b5mdMtfRvGn3GDuzuYxs7Gb0owSTCI89A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f10+Txvgyuna+o/mcWEGpY8nLy794u6auX48FLQVNDI=;
 b=bPaP0bBWbNbHaM+GFAY5DuKoP0gvyW8P+C5/V7IMOkPwAyHJMoEKiHOvYfiKHyWD2czF4MBCw2X818Vo0DHj4WMb2X9lOtaLK/Cf182+gc+F/1c+bu/8VV+Unse7SVNg83z7czXAJnDyylqqINAQ+nHazFLlUzLSvc3bQy+fk4o=
Received: from DB3PR0202MB3417.eurprd02.prod.outlook.com (52.134.67.32) by
 DB3PR0202MB3435.eurprd02.prod.outlook.com (52.134.65.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Wed, 30 Oct 2019 13:02:25 +0000
Received: from DB3PR0202MB3417.eurprd02.prod.outlook.com
 ([fe80::2c46:4c68:6439:7847]) by DB3PR0202MB3417.eurprd02.prod.outlook.com
 ([fe80::2c46:4c68:6439:7847%7]) with mapi id 15.20.2387.025; Wed, 30 Oct 2019
 13:02:25 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v1] x86/hvm: Update code in HVMOP_altp2m_set_suppress_ve
Thread-Index: AQHVjyJG8jOGSwzG50aoFrq0l89wTg==
Date: Wed, 30 Oct 2019 13:02:25 +0000
Message-ID: <20191030130143.30964-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR08CA0060.eurprd08.prod.outlook.com
 (2603:10a6:205:2::31) To DB3PR0202MB3417.eurprd02.prod.outlook.com
 (2603:10a6:8:6::32)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5ca2a9a-b101-4b75-2eeb-08d75d3968eb
x-ms-traffictypediagnostic: DB3PR0202MB3435:|DB3PR0202MB3435:|DB3PR0202MB3435:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0202MB34353CE7643149AF7CAA3467AB600@DB3PR0202MB3435.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 02065A9E77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(39860400002)(376002)(136003)(189003)(199004)(256004)(52116002)(14444005)(316002)(25786009)(2501003)(4326008)(6916009)(8936002)(6512007)(2906002)(8676002)(102836004)(7736002)(99286004)(305945005)(6486002)(26005)(54906003)(81156014)(81166006)(50226002)(107886003)(4744005)(2351001)(3846002)(386003)(6506007)(66066001)(6116002)(1076003)(86362001)(5660300002)(478600001)(5640700003)(486006)(64756008)(66446008)(476003)(2616005)(66476007)(66556008)(36756003)(6436002)(71200400001)(71190400001)(14454004)(186003)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3435;
 H:DB3PR0202MB3417.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X1yaPssF/0BTeQJFvMEV2rWnTOskQLFtoPRL9DtK224TiXauWr/JNMee5ROAMcunSsa9DOWUJGnk66tmVRxv8lk6dTmMZwYhFjNJmmaAZKWfB1AxwhY1I8DZuRLiLjVTxO/gAjBPcVVnBkU17l05790cvKN7w5aZetXZCrj3e3B5kY/Yv+8kqgein2UfLmbIQZS/iHLAVCroeZzc7IAS6/vdLWYWlN3lV/Pf3M+rEIAXVQAxQ6AOzrLcTOscoGg2JaUqWj0c7plYigJ1AK7lYE8KQeDMsBPe++Zn7UrbNbojw0feer8HOCfiuSYQ0pRlMEj6w7ktznTVrxQskqYPQYduwaMCtZPVZHkWdHyFEdnFyNBhGkK9dzomy4uTBVLwVKciJPbEX9dXlgA4s/1iX4EefTpAY1xgF8dwFqsNZ+Qhjyw8LT3gCHKDPhin0bnO
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ca2a9a-b101-4b75-2eeb-08d75d3968eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2019 13:02:25.2716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: acGdt14nZN/1LafTKNrzAAlHZZJM5rqlE551SxripoXkAJgyMxk3BDlln9phCd8S1bUtjAdFNd4zkuZntfh7KrVr8Eqr9QYM/I/eSdRZyqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3435
Subject: [Xen-devel] [PATCH v1] x86/hvm: Update code in
 HVMOP_altp2m_set_suppress_ve
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
Cc: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T3JpZ2luYWxseSB0aGUgZ2ZuIGFuZCBhbHRwMm1faWR4IGFyZSBhc3NpZ25lZCBmcm9tIHRoZSBh
LnUubWVtX2FjY2VzcyB1bmlvbi4KVGhpcyB3b3JrcyBiZWNhdXNlIGl0J3MgdGhlIHNhbWUgbWVt
b3J5IHVzZWQuIFRoaXMgcGF0Y2ggYWRkcmVzc2VzIHRoaXMKaXNzdWUgYnkgY2hhbmdpbmcgdGhl
IG1lbV9hY2Nlc3MgdW5pb24gd2l0aCB0aGUgc3VwcHJlc3NfdmUgdW5pb24gZm9yCmNvbnNpc3Rl
bmN5LgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRl
ci5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwppbmRleCBlNGMwNDI1MzMw
Li4wNmE3YjQwMTA3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9odm0vaHZtLmMKQEAgLTQ2ODUsOCArNDY4NSw4IEBAIHN0YXRpYyBpbnQgZG9f
YWx0cDJtX29wKAogICAgICAgICAgICAgcmMgPSAtRUlOVkFMOwogICAgICAgICBlbHNlCiAgICAg
ICAgIHsKLSAgICAgICAgICAgIGdmbl90IGdmbiA9IF9nZm4oYS51Lm1lbV9hY2Nlc3MuZ2ZuKTsK
LSAgICAgICAgICAgIHVuc2lnbmVkIGludCBhbHRwMm1faWR4ID0gYS51Lm1lbV9hY2Nlc3Mudmll
dzsKKyAgICAgICAgICAgIGdmbl90IGdmbiA9IF9nZm4oYS51LnN1cHByZXNzX3ZlLmdmbik7Cisg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgYWx0cDJtX2lkeCA9IGEudS5zdXBwcmVzc192ZS52aWV3
OwogICAgICAgICAgICAgYm9vbCBzdXBwcmVzc192ZSA9IGEudS5zdXBwcmVzc192ZS5zdXBwcmVz
c192ZTsKIAogICAgICAgICAgICAgcmMgPSBwMm1fc2V0X3N1cHByZXNzX3ZlKGQsIGdmbiwgc3Vw
cHJlc3NfdmUsIGFsdHAybV9pZHgpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
