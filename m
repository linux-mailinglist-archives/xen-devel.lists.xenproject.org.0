Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7783A6ABA
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 16:04:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i59NE-0006MJ-Pg; Tue, 03 Sep 2019 14:01:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IaxG=W6=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1i59NC-0006MD-H2
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 14:01:30 +0000
X-Inumbo-ID: 53248532-ce53-11e9-a337-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.113]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53248532-ce53-11e9-a337-bc764e2007e4;
 Tue, 03 Sep 2019 14:01:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuMlOtp4JN66Ni01riGItnD2GYmX5jpqHQ1+ph/ZJfhM3YhKVT0bBUmtxLV3Ez/JHg5amJlvWpNfaey8XflYZn5kwEHOPnbXwCe9f/8fum7u7gtbVzNVuN9sfpfZsFU8tyXzoph2tZvnXTW/MnsZew91nI5iFTu/HqhfWgeRypfxC3myDY1urpXWAs23QttaGmgv8rhk/jwE+2SborPAAiW7Sv92nqN449wAYsAPsrf8V4THYmK0PL79uwonIh4Tp1G36i1q1PA4vGdKfhx68/ZZtpUeJghKfKP0lbOhGxeanxU1HHUpw2lpfZkohtQXnA6cpla0TQ6dF/1mZ/E+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag1IajAbK/Hqo4QKFbVnw7TQS2mbl3pys1dNBpzEy6k=;
 b=CTx6i/mQWqxLy+J4/xrUa6WE1aghM7SZcCC6G3MdAYKF6u3kGd9QEZegKcDMHXyPUqLd2pTEIc+gWwoYpiOuwZlQMFjPDz1LJqX214fvhC8SFZskj3XvdLyg4006d44VWFO/kOFMnkwZoCY9n09GEVRdpm+rAo7erYoOlMRDzQbKyQSvPoGFk/GpPr/IYoPw0aEekJQGea1UV4hpCdU6UEA9g2OSKs6KV+BW+dU/onpN7w4Sqfx83jszdnsbAZfnaXRscdComRBXvPpmdYb3RgTbLbS6S2+ETFAMJ26yGRZosPe3IbH+ZPqTIcRwhBlmEgsj1vxl5Lj2lB9tlEvSiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag1IajAbK/Hqo4QKFbVnw7TQS2mbl3pys1dNBpzEy6k=;
 b=rVXJ7QxsumaghmvPk6Mz5oKtlT4r88XK5/ekN78tFzvBjwLMywjJRne0JRG+JHCmH9cd1m0EE5BLx6GLuBD033pHhEYcChP+yMSWYtYTGMWxmNBpyQk8lQ44SONsFNGDyEq6g5J1arjh6YSoU5PwzDjMRjJaN7KyO5AqkuRcyEU=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5798.eurprd02.prod.outlook.com (10.141.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 14:01:27 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::d422:432c:51e0:2d74%4]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 14:01:27 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v8] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVYmAUwzAuH5cfgUOJUZVAs8B/2Q==
Date: Tue, 3 Sep 2019 14:01:27 +0000
Message-ID: <20190903140112.18806-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2P264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::32)
 To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02fdcc14-076d-497d-3d8e-08d73077367f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5798; 
x-ms-traffictypediagnostic: AM7PR02MB5798:|AM7PR02MB5798:|AM7PR02MB5798:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB5798E70D367D3380F3670681ABB90@AM7PR02MB5798.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(376002)(396003)(39860400002)(346002)(199004)(189003)(50226002)(478600001)(2501003)(99286004)(52116002)(316002)(6116002)(64756008)(66446008)(71200400001)(66556008)(25786009)(66946007)(14454004)(4326008)(6486002)(5660300002)(66066001)(6916009)(86362001)(71190400001)(66476007)(1076003)(54906003)(102836004)(386003)(6506007)(53936002)(305945005)(5640700003)(6436002)(6512007)(2906002)(256004)(14444005)(26005)(8676002)(476003)(81156014)(186003)(2351001)(486006)(81166006)(2616005)(36756003)(8936002)(3846002)(7736002)(309714004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5798;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uAtql9Tgh/ZK3/HyDQql6JgEYFaE4ufjUxUx37xHm7i+Vok+ezCyVjDrtfGTRTkpjOEhiY9vciD6Rxnn2MDujsyHc7zk/3JfgJOJtwyaP4si0TxgtO/lqTic+/FeWrZI200LN/sgRQ2CjuQeIBrE+dWXC31wvMYpwq23Xt5IVAkq4UchNa6riooBFdsor/DgBEIfU3r9rtZiklQnW0HRWtqgCltp9w5pPIPO9F+vCVGUe/oz/snJCKobp4EWVqFhaHN2aFke99/oJ7HkJ8vA2opNifoEIFKk9CAsHkdyQjKPa4LBm7OJXyY/gtaGf1fXlGPFfR3eIYQHx/k9g4jWraC7M1o8v3BleA1vNUiEjmKE6FSPz4Pfr5ecYznQsMM21BrHLjJCYAP4hYNYNmdbDdWfq/h6OMmA9V7Ti5E7mYc=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fdcc14-076d-497d-3d8e-08d73077367f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 14:01:27.1125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: osMnAVoIzutbY2XRFmre5kQKsa0M55XohVhRlKeUk+hPFJ/mTVz8NDCZZJqSKSpmmoUT51o9DykvCJD3deQY+CtIBfNMT5+bJp9QOvzMcI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5798
Subject: [Xen-devel] [PATCH v8] x86/emulate: Send vm_event from emulate
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
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QS9EIGJpdCB3cml0ZXMgKG9uIHBhZ2Ugd2Fsa3MpIGNhbiBiZSBjb25zaWRlcmVkIGJlbmlnbiBi
eSBhbiBpbnRyb3NwZWN0aW9uCmFnZW50LCBzbyByZWNlaXZpbmcgdm1fZXZlbnRzIGZvciB0aGVt
IGlzIGEgcGVzc2ltaXphdGlvbi4gV2UgdHJ5IGhlcmUgdG8Kb3B0aW1pemUgYnkgZmlsdGVyaW5n
IHRoZXNlIGV2ZW50cyBvdXQuCkN1cnJlbnRseSwgd2UgYXJlIGZ1bGx5IGVtdWxhdGluZyB0aGUg
aW5zdHJ1Y3Rpb24gYXQgUklQIHdoZW4gdGhlIGhhcmR3YXJlIHNlZXMKYW4gRVBUIGZhdWx0IHdp
dGggbnBmZWMua2luZCAhPSBucGZlY19raW5kX3dpdGhfZ2xhLiBUaGlzIGlzLCBob3dldmVyLApp
bmNvcnJlY3QsIGJlY2F1c2UgdGhlIGluc3RydWN0aW9uIGF0IFJJUCBtaWdodCBsZWdpdGltYXRl
bHkgY2F1c2UgYW4KRVBUIGZhdWx0IG9mIGl0cyBvd24gd2hpbGUgYWNjZXNzaW5nIGEgX2RpZmZl
cmVudF8gcGFnZSBmcm9tIHRoZSBvcmlnaW5hbCBvbmUsCndoZXJlIEEvRCB3ZXJlIHNldC4KVGhl
IHNvbHV0aW9uIGlzIHRvIHBlcmZvcm0gdGhlIHdob2xlIGVtdWxhdGlvbiwgd2hpbGUgaWdub3Jp
bmcgRVBUIHJlc3RyaWN0aW9ucwpmb3IgdGhlIHdhbGsgcGFydCwgYW5kIHRha2luZyB0aGVtIGlu
dG8gYWNjb3VudCBmb3IgdGhlICJhY3R1YWwiIGVtdWxhdGluZyBvZgp0aGUgaW5zdHJ1Y3Rpb24g
YXQgUklQLiBXaGVuIHdlIHNlbmQgb3V0IGEgdm1fZXZlbnQsIHdlIGRvbid0IHdhbnQgdGhlIGVt
dWxhdGlvbgp0byBjb21wbGV0ZSwgc2luY2UgaW4gdGhhdCBjYXNlIHdlIHdvbid0IGJlIGFibGUg
dG8gdmV0byB3aGF0ZXZlciBpdCBpcyBkb2luZy4KVGhhdCB3b3VsZCBtZWFuIHRoYXQgd2UgY2Fu
J3QgYWN0dWFsbHkgcHJldmVudCBhbnkgbWFsaWNpb3VzIGFjdGl2aXR5LCBpbnN0ZWFkCndlJ2Qg
b25seSBiZSBhYmxlIHRvIHJlcG9ydCBvbiBpdC4KV2hlbiB3ZSBzZWUgYSAic2VuZC12bV9ldmVu
dCIgY2FzZSB3aGlsZSBlbXVsYXRpbmcsIHdlIG5lZWQgdG8gZmlyc3Qgc2VuZCB0aGUKZXZlbnQg
b3V0IGFuZCB0aGVuIHN1c3BlbmQgdGhlIGVtdWxhdGlvbiAocmV0dXJuIFg4NkVNVUxfUkVUUlkp
LgpBZnRlciB0aGUgZW11bGF0aW9uIHN0b3BzIHdlJ2xsIGNhbGwgaHZtX3ZtX2V2ZW50X2RvX3Jl
c3VtZSgpIGFnYWluIGFmdGVyIHRoZQppbnRyb3NwZWN0aW9uIGFnZW50IHRyZWF0cyB0aGUgZXZl
bnQgYW5kIHJlc3VtZXMgdGhlIGd1ZXN0LiBUaGVyZSwgdGhlCmluc3RydWN0aW9uIGF0IFJJUCB3
aWxsIGJlIGZ1bGx5IGVtdWxhdGVkICh3aXRoIHRoZSBFUFQgaWdub3JlZCkgaWYgdGhlCmludHJv
c3BlY3Rpb24gYXBwbGljYXRpb24gYWxsb3dzIGl0LCBhbmQgdGhlIGd1ZXN0IHdpbGwgY29udGlu
dWUgdG8gcnVuIHBhc3QKdGhlIGluc3RydWN0aW9uLgoKQSBjb21tb24gZXhhbXBsZSBpcyBpZiB0
aGUgaGFyZHdhcmUgZXhpdHMgYmVjYXVzZSBvZiBhbiBFUFQgZmF1bHQgY2F1c2VkIGJ5IGEKcGFn
ZSB3YWxrLCBwMm1fbWVtX2FjY2Vzc19jaGVjaygpIGRlY2lkZXMgaWYgaXQgaXMgZ29pbmcgdG8g
c2VuZCBhIHZtX2V2ZW50LgpJZiB0aGUgdm1fZXZlbnQgd2FzIHNlbnQgYW5kIGl0IHdvdWxkIGJl
IHRyZWF0ZWQgc28gaXQgcnVucyB0aGUgaW5zdHJ1Y3Rpb24KYXQgUklQLCB0aGF0IGluc3RydWN0
aW9uIG1pZ2h0IGFsc28gaGl0IGEgcHJvdGVjdGVkIHBhZ2UgYW5kIHByb3Zva2UgYSB2bV9ldmVu
dC4KCk5vdyBpZiBucGZlYy5raW5kICE9IG5wZmVjX2tpbmRfd2l0aF9nbGEgYW5kIGQtPmFyY2gu
bW9uaXRvci5pbmd1ZXN0X3BhZ2VmYXVsdF9kaXNhYmxlZAppcyB0cnVlIHRoZW4gd2UgYXJlIGlu
IHRoZSBwYWdlIHdhbGsgY2FzZSBhbmQgd2UgY2FuIGRvIHRoaXMgZW11bGF0aW9uIG9wdGltaXph
dGlvbgphbmQgZW11bGF0ZSB0aGUgcGFnZSB3YWxrIHdoaWxlIGlnbm9yaW5nIHRoZSBFUFQsIGJ1
dCBkb24ndCBpZ25vcmUgdGhlIEVQVCBmb3IgdGhlCmVtdWxhdGlvbiBvZiB0aGUgYWN0dWFsIGlu
c3RydWN0aW9uLgoKSW4gdGhlIGZpcnN0IGNhc2Ugd2Ugd291bGQgaGF2ZSAyIEVQVCBldmVudHMs
IGluIHRoZSBzZWNvbmQgY2FzZSB3ZSB3b3VsZCBoYXZlCjEgRVBUIGV2ZW50IGlmIHRoZSBpbnN0
cnVjdGlvbiBhdCB0aGUgUklQIHRyaWdnZXJzIGFuIEVQVCBldmVudC4KCldlIHVzZSBodm1lbXVs
X21hcF9saW5lYXJfYWRkcigpIHRvIGludGVyY2VwdCByL3cgYWNjZXNzIGFuZApfX2h2bV9jb3B5
KCkgdG8gaW50ZXJjZXB0IGV4ZWMgYWNjZXNzLgoKaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudCgp
IGNhbiByZXR1cm4gZmFsc2UgaWYgdGhlcmUgd2FzIG5vIHZpb2xhdGlvbiwKaWYgdGhlcmUgd2Fz
IGFuIGVycm9yIGZyb20gbW9uaXRvcl90cmFwcygpIG9yIHAybV9nZXRfbWVtX2FjY2VzcygpLgpS
ZXR1cm5pbmcgZmFsc2UgaWYgcDJtX2dldF9tZW1fYWNjZXNzKCkgZmFpbHMgaWYgdGhlIGVudHJ5
IHdhcyBub3QgZm91bmQKaW4gdGhlIEVQVCBpbiB3aGljaCBjYXNlIGl0IGlzIHVucmVzdHJpY3Rl
ZC4KCk5PVEU6IGh2bV9lbXVsYXRlX3NlbmRfdm1fZXZlbnQoKSBhc3N1bWVzIHRoZSBjYWxsZXIg
d2lsbCBjaGVjawphcmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50CgpTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KCi0tLQpDaGFuZ2VzIHNpbmNl
IFY3OgoJLSBDaGFuZ2UgY29tbWl0IG1lc3NhZ2UKCS0gRml4IGluZGVudGF0aW9uCgktIFJlbW92
ZSBzZW5kX2V2ZW50ID0gZmFsc2UKCS0gUmVtb3ZlIGdvdG8gb3V0IGZyb20gdGhlIHNlbmRfdm1f
ZXZlbnQgY2hlY2sKCS0gSW5pdCBlcnIgd2l0aCBudWxsIGFuZCByZW1vdmUgdGhlIGVyciA9IE5V
TEwgZnJvbQpodm1lbXVsX21hcF9saW5lYXJfYWRkcigpCgktIENoZWNrIGVyciBhZnRlciB0aGUg
bG9vcAoJLSBBZGQgYXNzZXJ0IGZvciBzZW5kX2V2ZW50IGluIGh2bV9lbXVsYXRlX3NlbmRfdm1f
ZXZlbnQoKQotLS0KIHhlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jICAgICAgICB8IDg1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0KIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMgICAgICAg
ICAgICB8ICA4ICsrKwogeGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyAgICAgIHwgIDEgKwog
eGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZW11bGF0ZS5oIHwgIDQgKysKIHhlbi9pbmNsdWRlL2Fz
bS14ODYvdm1fZXZlbnQuaCAgICB8ICAyICsKIDUgZmlsZXMgY2hhbmdlZCwgOTQgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2VtdWxh
dGUuYyBiL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCmluZGV4IGU0YjNmMzMwYTguLjRhYjEx
M2VmNTggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vZW11bGF0ZS5jCkBAIC0xMiw5ICsxMiwxMSBAQAogI2luY2x1ZGUgPHhlbi9p
bml0Lmg+CiAjaW5jbHVkZSA8eGVuL2xpYi5oPgogI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgorI2lu
Y2x1ZGUgPHhlbi9tb25pdG9yLmg+CiAjaW5jbHVkZSA8eGVuL3BhZ2luZy5oPgogI2luY2x1ZGUg
PHhlbi90cmFjZS5oPgogI2luY2x1ZGUgPHhlbi92bV9ldmVudC5oPgorI2luY2x1ZGUgPGFzbS9h
bHRwMm0uaD4KICNpbmNsdWRlIDxhc20vZXZlbnQuaD4KICNpbmNsdWRlIDxhc20vaTM4Ny5oPgog
I2luY2x1ZGUgPGFzbS94c3RhdGUuaD4KQEAgLTUzMSw2ICs1MzMsNzIgQEAgc3RhdGljIGludCBo
dm1lbXVsX2RvX21taW9fYWRkcihwYWRkcl90IG1taW9fZ3BhLAogICAgIHJldHVybiBodm1lbXVs
X2RvX2lvX2FkZHIoMSwgbW1pb19ncGEsIHJlcHMsIHNpemUsIGRpciwgZGYsIHJhbV9ncGEpOwog
fQogCisvKgorICogU2VuZCBtZW1vcnkgYWNjZXNzIHZtX2V2ZW50cyBiYXNlZCBvbiBwZmVjLiBS
ZXR1cm5zIHRydWUgaWYgdGhlIGV2ZW50IHdhcworICogc2VudCBhbmQgZmFsc2UgZm9yIHAybV9n
ZXRfbWVtX2FjY2VzcygpIGVycm9yLCBubyB2aW9sYXRpb24gYW5kIGV2ZW50IHNlbmQKKyAqIGVy
cm9yLiBBc3N1bWVzIHRoZSBjYWxsZXIgd2lsbCBjaGVjayBhcmNoLnZtX2V2ZW50LT5zZW5kX2V2
ZW50LgorICoKKyAqIE5PVEU6IHAybV9nZXRfbWVtX2FjY2VzcygpIGNhbiBmYWlsIGlmIHRoZSBl
bnRyeSB3YXMgbm90IGZvdW5kIGluIHRoZSBFUFQKKyAqIChpbiB3aGljaCBjYXNlIGFjY2VzcyB0
byBpdCBpcyB1bnJlc3RyaWN0ZWQsIHNvIG5vIHZpb2xhdGlvbnMgY2FuIG9jY3VyKS4KKyAqIElu
IHRoaXMgY2FzZXMgaXQgaXMgZmluZSB0byBjb250aW51ZSB0aGUgZW11bGF0aW9uLgorICovCiti
b29sIGh2bV9lbXVsYXRlX3NlbmRfdm1fZXZlbnQodW5zaWduZWQgbG9uZyBnbGEsIGdmbl90IGdm
biwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBwZmVjKQoreworICAg
IHhlbm1lbV9hY2Nlc3NfdCBhY2Nlc3M7CisgICAgdm1fZXZlbnRfcmVxdWVzdF90IHJlcSA9IHt9
OworICAgIHBhZGRyX3QgZ3BhID0gKGdmbl90b19nYWRkcihnZm4pIHwgKGdsYSAmIH5QQUdFX01B
U0spKTsKKworICAgIEFTU0VSVChjdXJyZW50LT5hcmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50KTsK
KworICAgIGN1cnJlbnQtPmFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQgPSBmYWxzZTsKKworICAg
IGlmICggcDJtX2dldF9tZW1fYWNjZXNzKGN1cnJlbnQtPmRvbWFpbiwgZ2ZuLCAmYWNjZXNzLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsdHAybV92Y3B1X2lkeChjdXJyZW50KSkgIT0g
MCApCisgICAgICAgIHJldHVybiBmYWxzZTsKKworICAgIHN3aXRjaCAoIGFjY2VzcyApCisgICAg
eworICAgIGNhc2UgWEVOTUVNX2FjY2Vzc194OgorICAgIGNhc2UgWEVOTUVNX2FjY2Vzc19yeDoK
KyAgICAgICAgaWYgKCBwZmVjICYgUEZFQ193cml0ZV9hY2Nlc3MgKQorICAgICAgICAgICAgcmVx
LnUubWVtX2FjY2Vzcy5mbGFncyA9IE1FTV9BQ0NFU1NfUiB8IE1FTV9BQ0NFU1NfVzsKKyAgICAg
ICAgYnJlYWs7CisKKyAgICBjYXNlIFhFTk1FTV9hY2Nlc3NfdzoKKyAgICBjYXNlIFhFTk1FTV9h
Y2Nlc3Nfcnc6CisgICAgICAgIGlmICggcGZlYyAmIFBGRUNfaW5zbl9mZXRjaCApCisgICAgICAg
ICAgICByZXEudS5tZW1fYWNjZXNzLmZsYWdzID0gTUVNX0FDQ0VTU19YOworICAgICAgICBicmVh
azsKKworICAgIGNhc2UgWEVOTUVNX2FjY2Vzc19yOgorICAgIGNhc2UgWEVOTUVNX2FjY2Vzc19u
OgorICAgICAgICBpZiAoIHBmZWMgJiBQRkVDX3dyaXRlX2FjY2VzcyApCisgICAgICAgICAgICBy
ZXEudS5tZW1fYWNjZXNzLmZsYWdzIHw9IE1FTV9BQ0NFU1NfUiB8IE1FTV9BQ0NFU1NfVzsKKyAg
ICAgICAgaWYgKCBwZmVjICYgUEZFQ19pbnNuX2ZldGNoICkKKyAgICAgICAgICAgIHJlcS51Lm1l
bV9hY2Nlc3MuZmxhZ3MgfD0gTUVNX0FDQ0VTU19YOworICAgICAgICBicmVhazsKKworICAgIGNh
c2UgWEVOTUVNX2FjY2Vzc193eDoKKyAgICBjYXNlIFhFTk1FTV9hY2Nlc3Nfcnd4OgorICAgIGNh
c2UgWEVOTUVNX2FjY2Vzc19yeDJydzoKKyAgICBjYXNlIFhFTk1FTV9hY2Nlc3NfbjJyd3g6Cisg
ICAgY2FzZSBYRU5NRU1fYWNjZXNzX2RlZmF1bHQ6CisgICAgICAgIGJyZWFrOworICAgIH0KKwor
ICAgIGlmICggIXJlcS51Lm1lbV9hY2Nlc3MuZmxhZ3MgKQorICAgICAgICByZXR1cm4gZmFsc2U7
IC8qIG5vIHZpb2xhdGlvbiAqLworCisgICAgcmVxLnJlYXNvbiA9IFZNX0VWRU5UX1JFQVNPTl9N
RU1fQUNDRVNTOworICAgIHJlcS51Lm1lbV9hY2Nlc3MuZ2ZuID0gZ2ZuX3goZ2ZuKTsKKyAgICBy
ZXEudS5tZW1fYWNjZXNzLmZsYWdzIHw9IE1FTV9BQ0NFU1NfRkFVTFRfV0lUSF9HTEEgfCBNRU1f
QUNDRVNTX0dMQV9WQUxJRDsKKyAgICByZXEudS5tZW1fYWNjZXNzLmdsYSA9IGdsYTsKKyAgICBy
ZXEudS5tZW1fYWNjZXNzLm9mZnNldCA9IGdwYSAmIH5QQUdFX01BU0s7CisKKyAgICByZXR1cm4g
bW9uaXRvcl90cmFwcyhjdXJyZW50LCB0cnVlLCAmcmVxKSA+PSAwOworfQorCiAvKgogICogTWFw
IHRoZSBmcmFtZShzKSBjb3ZlcmluZyBhbiBpbmRpdmlkdWFsIGxpbmVhciBhY2Nlc3MsIGZvciB3
cml0ZWFibGUKICAqIGFjY2Vzcy4gIE1heSByZXR1cm4gTlVMTCBmb3IgTU1JTywgb3IgRVJSX1BU
Uih+WDg2RU1VTF8qKSBmb3Igb3RoZXIgZXJyb3JzCkBAIC01NDQsMTAgKzYxMiwxMSBAQCBzdGF0
aWMgdm9pZCAqaHZtZW11bF9tYXBfbGluZWFyX2FkZHIoCiAgICAgc3RydWN0IGh2bV9lbXVsYXRl
X2N0eHQgKmh2bWVtdWxfY3R4dCkKIHsKICAgICBzdHJ1Y3QgdmNwdSAqY3VyciA9IGN1cnJlbnQ7
Ci0gICAgdm9pZCAqZXJyLCAqbWFwcGluZzsKKyAgICB2b2lkICplcnIgPSBOVUxMLCAqbWFwcGlu
ZzsKICAgICB1bnNpZ25lZCBpbnQgbnJfZnJhbWVzID0gKChsaW5lYXIgKyBieXRlcyAtICEhYnl0
ZXMpID4+IFBBR0VfU0hJRlQpIC0KICAgICAgICAgKGxpbmVhciA+PiBQQUdFX1NISUZUKSArIDE7
CiAgICAgdW5zaWduZWQgaW50IGk7CisgICAgZ2ZuX3QgZ2ZuOwogCiAgICAgLyoKICAgICAgKiBt
Zm4gcG9pbnRzIHRvIHRoZSBuZXh0IGZyZWUgc2xvdC4gIEFsbCB1c2VkIHNsb3RzIGhhdmUgYSBw
YWdlIHJlZmVyZW5jZQpAQCAtNTgyLDcgKzY1MSw3IEBAIHN0YXRpYyB2b2lkICpodm1lbXVsX21h
cF9saW5lYXJfYWRkcigKICAgICAgICAgQVNTRVJUKG1mbl94KCptZm4pID09IDApOwogCiAgICAg
ICAgIHJlcyA9IGh2bV90cmFuc2xhdGVfZ2V0X3BhZ2UoY3VyciwgYWRkciwgdHJ1ZSwgcGZlYywK
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcGZpbmZvLCAmcGFnZSwgTlVM
TCwgJnAybXQpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwZmluZm8s
ICZwYWdlLCAmZ2ZuLCAmcDJtdCk7CiAKICAgICAgICAgc3dpdGNoICggcmVzICkKICAgICAgICAg
ewpAQCAtNTk2LDcgKzY2NSw2IEBAIHN0YXRpYyB2b2lkICpodm1lbXVsX21hcF9saW5lYXJfYWRk
cigKICAgICAgICAgICAgIGdvdG8gb3V0OwogCiAgICAgICAgIGNhc2UgSFZNVFJBTlNfYmFkX2dm
bl90b19tZm46Ci0gICAgICAgICAgICBlcnIgPSBOVUxMOwogICAgICAgICAgICAgZ290byBvdXQ7
CiAKICAgICAgICAgY2FzZSBIVk1UUkFOU19nZm5fcGFnZWRfb3V0OgpAQCAtNjE5LDE0ICs2ODcs
MTkgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKAogICAgICAgICAgICAg
fQogCiAgICAgICAgICAgICBpZiAoIHAybXQgPT0gcDJtX2lvcmVxX3NlcnZlciApCi0gICAgICAg
ICAgICB7Ci0gICAgICAgICAgICAgICAgZXJyID0gTlVMTDsKICAgICAgICAgICAgICAgICBnb3Rv
IG91dDsKLSAgICAgICAgICAgIH0KIAogICAgICAgICAgICAgQVNTRVJUKHAybXQgPT0gcDJtX3Jh
bV9sb2dkaXJ0eSB8fCAhcDJtX2lzX3JlYWRvbmx5KHAybXQpKTsKICAgICAgICAgfQorCisgICAg
ICAgIGlmICggY3Vyci0+YXJjaC52bV9ldmVudCAmJgorICAgICAgICAgICAgIGN1cnItPmFyY2gu
dm1fZXZlbnQtPnNlbmRfZXZlbnQgJiYKKyAgICAgICAgICAgICBodm1fZW11bGF0ZV9zZW5kX3Zt
X2V2ZW50KGFkZHIsIGdmbiwgcGZlYykgKQorICAgICAgICAgICAgZXJyID0gRVJSX1BUUih+WDg2
RU1VTF9SRVRSWSk7CiAgICAgfQorICAgIC8qIENoZWNrIGlmIGVueSB2bV9ldmVudCB3YXMgc2Vu
dCAqLworICAgIGlmICggZXJyICkKKyAgICAgICAgZ290byBvdXQ7CiAKICAgICAvKiBFbnRpcmUg
YWNjZXNzIHdpdGhpbiBhIHNpbmdsZSBmcmFtZT8gKi8KICAgICBpZiAoIG5yX2ZyYW1lcyA9PSAx
ICkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94ZW4vYXJjaC94ODYvaHZt
L2h2bS5jCmluZGV4IDJiODE4OTk0NmIuLjcyN2YxOTUzNTkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L3g4Ni9odm0vaHZtLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwpAQCAtMzIyNCw2ICsz
MjI0LDE0IEBAIHN0YXRpYyBlbnVtIGh2bV90cmFuc2xhdGlvbl9yZXN1bHQgX19odm1fY29weSgK
ICAgICAgICAgICAgIHJldHVybiBIVk1UUkFOU19iYWRfZ2ZuX3RvX21mbjsKICAgICAgICAgfQog
CisgICAgICAgIGlmICggdW5saWtlbHkodi0+YXJjaC52bV9ldmVudCkgJiYKKyAgICAgICAgICAg
ICB2LT5hcmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50ICYmCisgICAgICAgICAgICAgaHZtX2VtdWxh
dGVfc2VuZF92bV9ldmVudChhZGRyLCBnZm4sIHBmZWMpICkKKyAgICAgICAgeworICAgICAgICAg
ICAgcHV0X3BhZ2UocGFnZSk7CisgICAgICAgICAgICByZXR1cm4gSFZNVFJBTlNfZ2ZuX3BhZ2Vk
X291dDsKKyAgICAgICAgfQorCiAgICAgICAgIHAgPSAoY2hhciAqKV9fbWFwX2RvbWFpbl9wYWdl
KHBhZ2UpICsgKGFkZHIgJiB+UEFHRV9NQVNLKTsKIAogICAgICAgICBpZiAoIGZsYWdzICYgSFZN
Q09QWV90b19ndWVzdCApCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5j
IGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwppbmRleCAwMTQ0ZjkyYjk4Li5jMGZhYTU3
ZGIxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKQEAgLTIxNCw2ICsyMTQsNyBAQCBib29sIHAybV9tZW1f
YWNjZXNzX2NoZWNrKHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGdsYSwKICAgICAgICAgIGQt
PmFyY2gubW9uaXRvci5pbmd1ZXN0X3BhZ2VmYXVsdF9kaXNhYmxlZCAmJgogICAgICAgICAgbnBm
ZWMua2luZCAhPSBucGZlY19raW5kX3dpdGhfZ2xhICkgLyogZG9uJ3Qgc2VuZCBhIG1lbV9ldmVu
dCAqLwogICAgIHsKKyAgICAgICAgdi0+YXJjaC52bV9ldmVudC0+c2VuZF9ldmVudCA9IHRydWU7
CiAgICAgICAgIGh2bV9lbXVsYXRlX29uZV92bV9ldmVudChFTVVMX0tJTkRfTk9STUFMLCBUUkFQ
X2ludmFsaWRfb3AsIFg4Nl9FVkVOVF9OT19FQyk7CiAKICAgICAgICAgcmV0dXJuIHRydWU7CmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9lbXVsYXRlLmggYi94ZW4vaW5jbHVk
ZS9hc20teDg2L2h2bS9lbXVsYXRlLmgKaW5kZXggYjM5YTFhMDMzMS4uMzY4MmVmZDkwYiAxMDA2
NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZW11bGF0ZS5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL2VtdWxhdGUuaApAQCAtODAsNiArODAsMTAgQEAgc3RydWN0IHNlZ21l
bnRfcmVnaXN0ZXIgKmh2bWVtdWxfZ2V0X3NlZ19yZWcoCiAgICAgZW51bSB4ODZfc2VnbWVudCBz
ZWcsCiAgICAgc3RydWN0IGh2bV9lbXVsYXRlX2N0eHQgKmh2bWVtdWxfY3R4dCk7CiBpbnQgaHZt
X2VtdWxhdGVfb25lX21taW8odW5zaWduZWQgbG9uZyBtZm4sIHVuc2lnbmVkIGxvbmcgZ2xhKTsK
K2Jvb2wgaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudCgKKyAgICB1bnNpZ25lZCBsb25nIGdsYSwK
KyAgICBnZm5fdCBnZm4sCisgICAgdWludDMyX3QgcGZlYyk7CiAKIHN0YXRpYyBpbmxpbmUgYm9v
bCBoYW5kbGVfbW1pbyh2b2lkKQogewpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni92
bV9ldmVudC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni92bV9ldmVudC5oCmluZGV4IDIzZTY1NTcx
MGIuLjY2ZGI5ZTFlMjUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvdm1fZXZlbnQu
aAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3ZtX2V2ZW50LmgKQEAgLTM2LDYgKzM2LDggQEAg
c3RydWN0IGFyY2hfdm1fZXZlbnQgewogICAgIGJvb2wgc2V0X2dwcnM7CiAgICAgLyogQSBzeW5j
IHZtX2V2ZW50IGhhcyBiZWVuIHNlbnQgYW5kIHdlJ3JlIG5vdCBkb25lIGhhbmRsaW5nIGl0LiAq
LwogICAgIGJvb2wgc3luY19ldmVudDsKKyAgICAvKiBTZW5kIG1lbSBhY2Nlc3MgZXZlbnRzIGZy
b20gZW11bGF0b3IgKi8KKyAgICBib29sIHNlbmRfZXZlbnQ7CiB9OwogCiBpbnQgdm1fZXZlbnRf
aW5pdF9kb21haW4oc3RydWN0IGRvbWFpbiAqZCk7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
