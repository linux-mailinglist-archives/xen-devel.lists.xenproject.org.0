Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 516AB2F83B
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 10:05:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWFyc-0006S6-FR; Thu, 30 May 2019 07:59:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XN+J=T6=os.amperecomputing.com=vishnu@srs-us1.protection.inumbo.net>)
 id 1hWFyb-0006S1-91
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 07:59:53 +0000
X-Inumbo-ID: e6904806-82b0-11e9-8980-bc764e045a96
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (unknown
 [40.107.72.101]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e6904806-82b0-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 07:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector2-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLQP1VADwRD8zmSUk1pyX56ZjfHt/x/uA8+4u279VhI=;
 b=ihrg69UfBePCxielYkL+KVTTfVjlMmpjkB+QLYh+Cu0w6G5UccE3kHkJZlvsjf98VJM0rCU1bJAa5wFwOCZSARtw24zl7nixn2+swVuT/v4bY1pQkav6wsBZytAFu3yr6BQ/o9xaIBNWoenX7nQ6tW9QXsRdvVeMuJ/t4Yike9Q=
Received: from BYAPR01MB5590.prod.exchangelabs.com (20.179.89.32) by
 BYAPR01MB5190.prod.exchangelabs.com (20.177.185.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Thu, 30 May 2019 07:59:46 +0000
Received: from BYAPR01MB5590.prod.exchangelabs.com
 ([fe80::20b6:929a:e8d8:7de7]) by BYAPR01MB5590.prod.exchangelabs.com
 ([fe80::20b6:929a:e8d8:7de7%5]) with mapi id 15.20.1922.021; Thu, 30 May 2019
 07:59:46 +0000
From: Vishnu Pajjuri OS <vishnu@os.amperecomputing.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] xen/arm: p2m: configure stage-2 page table to support
 upto 42-bit PA systems
Thread-Index: AQHVFr2lcxcx0EO9ikSAfxMidE75jA==
Date: Thu, 30 May 2019 07:59:46 +0000
Message-ID: <1559203823-4092-1-git-send-email-vishnu@os.amperecomputing.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR08CA0039.namprd08.prod.outlook.com
 (2603:10b6:903:151::25) To BYAPR01MB5590.prod.exchangelabs.com
 (2603:10b6:a03:126::32)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vishnu@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.8.3.1
x-originating-ip: [4.28.12.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b3e4eb1-692a-40c7-33ec-08d6e4d4c809
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BYAPR01MB5190; 
x-ms-traffictypediagnostic: BYAPR01MB5190:
x-microsoft-antispam-prvs: <BYAPR01MB51906A0A0673F10FF6FDCD54E6180@BYAPR01MB5190.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00531FAC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(366004)(136003)(39840400004)(346002)(199004)(189003)(4720700003)(6436002)(5640700003)(68736007)(66066001)(6486002)(86362001)(6506007)(386003)(99286004)(52116002)(14454004)(478600001)(54906003)(476003)(486006)(2351001)(2616005)(26005)(186003)(2501003)(316002)(3846002)(71190400001)(6116002)(25786009)(8936002)(71200400001)(2906002)(6512007)(50226002)(305945005)(4326008)(8676002)(7736002)(81166006)(5660300002)(81156014)(53936002)(102836004)(256004)(107886003)(6916009)(14444005)(73956011)(66946007)(66476007)(66556008)(64756008)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR01MB5190;
 H:BYAPR01MB5590.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1NVrbeFHPPld7S39gMiT3i/yVcgPYA03286jwcxgb/8AOqWyrJXeHR4P1NwPczSNst0qvk4IP6BW0+VoU9U47NsS4I8u36JJsYbbMkEQE2QJQbRs4U3XgO+GFGyalL2jxyoxAxQ0USrTB260tv4mnFpVPkRJAXbTUSmTiAzcXj7SUDKNfz4P6PlVaSqCPACeLyjMj9k9sURgay1sNu3XqHbkeewDH7Eld4010dY4YcUzlXW7d3rVvfPBSLcXyKB25dh/bdNFtSZ61s+nadQNrg0eFMj4ChuWsNHx618Y925Rzq67j1W5f9yXj0ptpW2wzWZwzGgJkDRO/F6fw+e3jeeQXPyhs0S52UuIjwg9aViMrNcNMfZw3G4vkGog5yWArEqHPrgeP7Zz6TQGMvwmpSn0EdMwbig4BUcac5dz7y4=
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3e4eb1-692a-40c7-33ec-08d6e4d4c809
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2019 07:59:46.4986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vishnu@os.amperecomputing.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5190
Subject: [Xen-devel] [PATCH v2] xen/arm: p2m: configure stage-2 page table
 to support upto 42-bit PA systems
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Feng Kan OS <fengkan@os.amperecomputing.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Vishnu Pajjuri OS <vishnu@os.amperecomputing.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WEVOIGNvbmZpZ3VyZXMgc3RhZ2UtMiBwYWdlIHRhYmxlIHRvIGV4cG9zZSA0MCBiaXRzIG9mIElQ
QQ0KKEludGVybWVkaWF0ZSBQaHlzaWNhbCBBZGRyZXNzKSBiaXRzIGZvciBzeXN0ZW1zIHdpdGgg
NDIgYml0cyBvZiBQQQ0KKFBoeXNpY2FsIEFkZHJlc3MpLiBUaGlzIHNldHRpbmcgcHJldmVudHMg
dGhlIDQyLWJpdCBQQSBzeXN0ZW1zIGZyb20gYm9vdGluZw0KRE9NMCdzIGtlcm5lbCBzaW5jZSBh
Y2Nlc3MgYWJvdmUgNDAgYml0cyByZXN1bHRzIGluIGEgZmF1bHQuDQoNClRoaXMgcGF0Y2ggYWRk
cyBzdXBwb3J0IGZvciA0Mi1iaXQgc3lzdGVtDQp3aGljaCBoYXMgYSBmdWxsIDQyLWJpdCBhZGRy
ZXNzIHJhbmdlLg0KDQpUaGUgZml4IHdpbGwgYWxsb2NhdGUgOCBwYWdlcyBmb3Igc3RhZ2UgMiBt
YXBwaW5nIGZvciBib3RoIERPTTAgYW5kIGd1ZXN0cy4NCkl0IGlzIGEgYml0IHdhc3RlZnVsIGJ1
dCBub3QgYW4gaXNzdWUgc2luY2UgbW9zdCBvZiB0aGVzZSBzeXN0ZW1zIHNob3VsZCBoYXZlDQpz
dWZmaWNpZW50bHkgbGFyZ2UgbWVtb3J5IGNhcGFjaXR5Lg0KDQpTaWduZWQtb2ZmLWJ5OiBGZW5n
IEthbiA8ZmVuZ2thbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KU2lnbmVkLW9mZi1ieTogVmlz
aG51IDx2aXNobnVAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT4NCi0tLQ0KIHhlbi9hcmNoL2FybS9w
Mm0uYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wMm0uYyBiL3hlbi9hcmNoL2FybS9wMm0u
Yw0KaW5kZXggOTJjMjQxMy4uNzcxMjk5MSAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9wMm0u
Yw0KKysrIGIveGVuL2FyY2gvYXJtL3AybS5jDQpAQCAtMTk5NSw3ICsxOTk1LDcgQEAgdm9pZCBf
X2luaXQgc2V0dXBfdmlydF9wYWdpbmcodm9pZCkNCiAgICAgICAgIFswXSA9IHsgMzIsICAgICAg
MzIvKjMyKi8sICAwLCAgICAgICAgICAxIH0sDQogICAgICAgICBbMV0gPSB7IDM2LCAgICAgIDI4
LyoyOCovLCAgMCwgICAgICAgICAgMSB9LA0KICAgICAgICAgWzJdID0geyA0MCwgICAgICAyNC8q
MjQqLywgIDEsICAgICAgICAgIDEgfSwNCi0gICAgICAgIFszXSA9IHsgNDIsICAgICAgMjQvKjIy
Ki8sICAxLCAgICAgICAgICAxIH0sDQorICAgICAgICBbM10gPSB7IDQyLCAgICAgIDIyLyoyMiov
LCAgMywgICAgICAgICAgMSB9LA0KICAgICAgICAgWzRdID0geyA0NCwgICAgICAyMC8qMjAqLywg
IDAsICAgICAgICAgIDIgfSwNCiAgICAgICAgIFs1XSA9IHsgNDgsICAgICAgMTYvKjE2Ki8sICAw
LCAgICAgICAgICAyIH0sDQogICAgICAgICBbNl0gPSB7IDAgfSwgLyogSW52YWxpZCAqLw0KLS0N
CjEuOC4zLjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
