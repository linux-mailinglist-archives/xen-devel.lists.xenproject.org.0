Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4406C1296D5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 15:08:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijOKF-0008VH-0s; Mon, 23 Dec 2019 14:04:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R5un=2N=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ijOKE-0008VA-32
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 14:04:46 +0000
X-Inumbo-ID: 28afbe53-258d-11ea-96db-12813bfff9fa
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.93]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28afbe53-258d-11ea-96db-12813bfff9fa;
 Mon, 23 Dec 2019 14:04:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPmG05/1UAo+uN95oi743P44fUu6QWHrA7lqwQ8LnXdsF8RZbsfkYwIoFZhabCYWNixxKq+GQiAIab0jlUErXh1LZiBL00VRcDPMsvQOhXfnbSs1tRJ9o2Cgk9r/Bi8Txq4PTPF+XcGcIuaM55iXOMGVyFe14MG1WkBqAXexQpCSx7gIXJ9mGX6AdUPg/o99xcYErBZ+tbVBdn4AzbC971lNflo8oOOOWzjcEdIqK+48s+rB/z4MSRJAMWcUcXAQbN5Zy1F1AaZLGviZTk1BriMF5hDUJOjT/oLtxEVdFGqgGDxTWQ0tu5j3z6TmNvCXWcJQP+vwDkV1cbk7KzbbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7sAHSbH8L2ZY3ln2tZIXsZaYT6KWiORRmlbvRksHXc=;
 b=nwm+Sw46Ud1EKaaVzbcVoVMtnaa86UMezd8FQjx+kES4iiQijASVgVdzj8pl1nVsiAn1hIbexQaJasjZntillLp/4MlS5URPLhYf+JrDPfJpkHuQI4U+NtvlaQzWFntd8B7/H15OlqQndzRYGKwJPHmwKkpe685Sd7Cgg0OPiU6Ntym6J40D+cRzUAA0ULf67EPjZbK4wV1LSzmzXpUs2R6AFehRq+jtP/7OrrZt1oj58e2tWiPg8Xfh3wfyFLcHKjrIAyz3JUrdJtAyzgyGSQCx6oZAwJw1bpKvhlX7fplYi1XrJQbleoz6AnOxYKBdDaVhqZP6m6VTbly+BHccJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7sAHSbH8L2ZY3ln2tZIXsZaYT6KWiORRmlbvRksHXc=;
 b=NnavTzdnHMbt6yW7yp1nD54yZwYycMISz60LHAdj69ndNqiCC8DoL4NolOFytEwLQBmJnjBCzMPmcZZQnoZDymnhaSWpIo34sVvngTdxMqb8hn22psjOoRgtlshlvIETkvkWBG1Tn0P1jNtdqLEDoabyzNcZTdpqeVmhyQM9cRE=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5170.eurprd02.prod.outlook.com (20.178.22.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Mon, 23 Dec 2019 14:04:36 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2559.017; Mon, 23 Dec 2019
 14:04:36 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V6 2/4] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVuZnoQDql7d7Su0+P124sSAtk3w==
Date: Mon, 23 Dec 2019 14:04:36 +0000
Message-ID: <20191223140409.32449-2-aisaila@bitdefender.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
In-Reply-To: <20191223140409.32449-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR05CA0156.eurprd05.prod.outlook.com
 (2603:10a6:207:3::34) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5d89507-ec1a-41e2-d8bd-08d787b10afe
x-ms-traffictypediagnostic: AM0PR02MB5170:|AM0PR02MB5170:|AM0PR02MB5170:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB51702E2554584FA00BB7A187AB2E0@AM0PR02MB5170.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:529;
x-forefront-prvs: 0260457E99
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(81156014)(107886003)(8676002)(81166006)(6506007)(66446008)(64756008)(66476007)(66556008)(66946007)(7416002)(186003)(26005)(478600001)(8936002)(36756003)(4326008)(71200400001)(2616005)(2906002)(1076003)(6512007)(86362001)(5660300002)(54906003)(316002)(6486002)(52116002)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5170;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FERPRYRenWQgQVj0VBA++Kom0XSTuS8hKCRFibtPr5YGtyhNUDP+14F5nM0tFxlDqgwsTd0Xr6iKfWLSHHVTupmVYTc4QQfsfyxQiwH+6+a5UquKy/16Qg6NVSsWrgJ8Z/u41KWEkSvVTF9ornV2L663Bl5jgRwJ88PNJ/xXlT1HIeHtvs8YVAm5TuzvoefLv5xpW6xheJG0OkIUbJcmpgyC9aZwZV7BjodFrcOAGjn7RqVh8SjpvK8M1ZOc973EZnM6cpujinYr/eDvpAibGdH4Ija8LGQb9mcJntJdMQkeH4Tc5cwwPusGqFn7reyYNpGV0+etuel+EMDLjQYuu2LKkXPPQfZoNPYDj0R4drCQV7OT0xEXtKvAcw2uYiABJn7TtztBKd0mUYOW2g9+4PrhEoQJ3lxeuGE57Ab5D/wffch7XjI8toqZ0qaNP+gO
Content-ID: <B03FEC0950D6674286C51CBA9359B49D@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d89507-ec1a-41e2-d8bd-08d787b10afe
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2019 14:04:36.1548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iwAy/5lXlmpU5w99NQ7rk9vEPDAHf9p9Ho97MyiNVOUat9tkJv5zM+rCrjcKoC+c3IWKD9QNSevoJvLTzsRlbWMSjtM/FJBHMqFrphhmglo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5170
Subject: [Xen-devel] [PATCH V6 2/4] x86/altp2m: Add hypercall to set a range
 of sve bits
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QnkgZGVmYXVsdCB0aGUgc3ZlIGJpdHMgYXJlIG5vdCBzZXQuDQpUaGlzIHBhdGNoIGFkZHMgYSBu
ZXcgaHlwZXJjYWxsLCB4Y19hbHRwMm1fc2V0X3N1cHJlc3NfdmVfbXVsdGkoKSwNCnRvIHNldCBh
IHJhbmdlIG9mIHN2ZSBiaXRzLg0KVGhlIGNvcmUgZnVuY3Rpb24sIHAybV9zZXRfc3VwcHJlc3Nf
dmVfbXVsdGkoKSwgZG9lcyBub3QgYnJha2UgaW4gY2FzZQ0Kb2YgYSBlcnJvciBhbmQgaXQgaXMg
ZG9pbmcgYSBiZXN0IGVmZm9ydCBmb3Igc2V0dGluZyB0aGUgYml0cyBpbiB0aGUNCmdpdmVuIHJh
bmdlLiBBIGNoZWNrIGZvciBjb250aW51YXRpb24gaXMgbWFkZSBpbiBvcmRlciB0byBoYXZlDQpw
cmVlbXB0aW9uIG9uIGJpZyByYW5nZXMuDQpUaGUgZ2ZuIG9mIHRoZSBmaXJzdCBlcnJvciBpcyBz
dG9yZWQgaW4NCnhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlX211bHRpLmZpcnN0X2Vycm9yIGFu
ZCB0aGUgZXJyb3IgY29kZSBpcw0Kc3RvcmVkIGluIHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3Zl
X211bHRpLmZpcnN0X2Vycm9yX2NvZGUuDQpJZiBubyBlcnJvciBvY2N1cnJlZCB0aGUgdmFsdWVz
IHdpbGwgYmUgMC4NCg0KU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBi
aXRkZWZlbmRlci5jb20+DQpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KDQotLS0NCkNDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4NCkND
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+DQpDQzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXgu
Y29tPg0KQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCkNDOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPg0KQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndp
bGtAb3JhY2xlLmNvbT4NCkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+DQpDQzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCkND
OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+DQpDQzogUmF6dmFu
IENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPg0KQ0M6IFRhbWFzIEsgTGVuZ3ll
bCA8dGFtYXNAdGtsZW5neWVsLmNvbT4NCkNDOiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVA
Yml0ZGVmZW5kZXIuY29tPg0KLS0tDQpDaGFuZ2VzIHNpbmNlIFY1Og0KCS0gQ2hhbmdlIGZpcnN0
X2Vycm9yX2NvZGUgdG8gZmlyc3RfZXJyb3IgYW5kIGZpcnN0X2Vycm9yIHRvIGZpcnN0X2Vycm9y
X2dmbg0KCS0gVXBkYXRlIHRoZSByZXF1ZXN0ZWQgY29tbWVudHMuDQotLS0NCiB0b29scy9saWJ4
Yy9pbmNsdWRlL3hlbmN0cmwuaCAgIHwgIDQgKysrDQogdG9vbHMvbGlieGMveGNfYWx0cDJtLmMg
ICAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrDQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAg
ICAgICAgICB8IDIwICsrKysrKysrKysrDQogeGVuL2FyY2gveDg2L21tL3AybS5jICAgICAgICAg
ICB8IDY0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KIHhlbi9pbmNsdWRlL3B1
YmxpYy9odm0vaHZtX29wLmggfCAxMyArKysrKysrDQogeGVuL2luY2x1ZGUveGVuL21lbV9hY2Nl
c3MuaCAgICB8ICAzICsrDQogNiBmaWxlcyBjaGFuZ2VkLCAxMzcgaW5zZXJ0aW9ucygrKQ0KDQpk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmggYi90b29scy9saWJ4Yy9p
bmNsdWRlL3hlbmN0cmwuaA0KaW5kZXggNzVmMTkxYWUzYS4uY2M0ZWIxZTNkMyAxMDA2NDQNCi0t
LSBhL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oDQorKysgYi90b29scy9saWJ4Yy9pbmNs
dWRlL3hlbmN0cmwuaA0KQEAgLTE5MjMsNiArMTkyMywxMCBAQCBpbnQgeGNfYWx0cDJtX3N3aXRj
aF90b192aWV3KHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZpZXdfaWQpOw0KIGludCB4Y19hbHRwMm1f
c2V0X3N1cHByZXNzX3ZlKHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCB2aWV3X2lkLCB4ZW5fcGZuX3Qg
Z2ZuLCBib29sIHN2ZSk7DQoraW50IHhjX2FsdHAybV9zZXRfc3VwcmVzc192ZV9tdWx0aSh4Y19p
bnRlcmZhY2UgKmhhbmRsZSwgdWludDMyX3QgZG9taWQsDQorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1aW50MTZfdCB2aWV3X2lkLCB4ZW5fcGZuX3QgZmlyc3RfZ2ZuLA0KKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeGVuX3Bmbl90IGxhc3RfZ2ZuLCBib29s
IHN2ZSwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhlbl9wZm5fdCAqZXJy
b3JfZ2ZuLCBpbnQzMl90ICplcnJvcl9jb2RlKTsNCiBpbnQgeGNfYWx0cDJtX2dldF9zdXBwcmVz
c192ZSh4Y19pbnRlcmZhY2UgKmhhbmRsZSwgdWludDMyX3QgZG9taWQsDQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdWludDE2X3Qgdmlld19pZCwgeGVuX3Bmbl90IGdmbiwgYm9vbCAq
c3ZlKTsNCiBpbnQgeGNfYWx0cDJtX3NldF9tZW1fYWNjZXNzKHhjX2ludGVyZmFjZSAqaGFuZGxl
LCB1aW50MzJfdCBkb21pZCwNCmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19hbHRwMm0uYyBi
L3Rvb2xzL2xpYnhjL3hjX2FsdHAybS5jDQppbmRleCAwOWRhZDAzNTVlLi40NmZiNzI1ODA2IDEw
MDY0NA0KLS0tIGEvdG9vbHMvbGlieGMveGNfYWx0cDJtLmMNCisrKyBiL3Rvb2xzL2xpYnhjL3hj
X2FsdHAybS5jDQpAQCAtMjM0LDYgKzIzNCwzOSBAQCBpbnQgeGNfYWx0cDJtX3NldF9zdXBwcmVz
c192ZSh4Y19pbnRlcmZhY2UgKmhhbmRsZSwgdWludDMyX3QgZG9taWQsDQogICAgIHJldHVybiBy
YzsNCiB9DQogDQoraW50IHhjX2FsdHAybV9zZXRfc3VwcmVzc192ZV9tdWx0aSh4Y19pbnRlcmZh
Y2UgKmhhbmRsZSwgdWludDMyX3QgZG9taWQsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1aW50MTZfdCB2aWV3X2lkLCB4ZW5fcGZuX3QgZmlyc3RfZ2ZuLA0KKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgeGVuX3Bmbl90IGxhc3RfZ2ZuLCBib29sIHN2ZSwN
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhlbl9wZm5fdCAqZXJyb3JfZ2Zu
LCBpbnQzMl90ICplcnJvcl9jb2RlKQ0KK3sNCisgICAgaW50IHJjOw0KKyAgICBERUNMQVJFX0hZ
UEVSQ0FMTF9CVUZGRVIoeGVuX2h2bV9hbHRwMm1fb3BfdCwgYXJnKTsNCisNCisgICAgYXJnID0g
eGNfaHlwZXJjYWxsX2J1ZmZlcl9hbGxvYyhoYW5kbGUsIGFyZywgc2l6ZW9mKCphcmcpKTsNCisg
ICAgaWYgKCBhcmcgPT0gTlVMTCApDQorICAgICAgICByZXR1cm4gLTE7DQorDQorICAgIGFyZy0+
dmVyc2lvbiA9IEhWTU9QX0FMVFAyTV9JTlRFUkZBQ0VfVkVSU0lPTjsNCisgICAgYXJnLT5jbWQg
PSBIVk1PUF9hbHRwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpOw0KKyAgICBhcmctPmRvbWFpbiA9
IGRvbWlkOw0KKyAgICBhcmctPnUuc3VwcHJlc3NfdmVfbXVsdGkudmlldyA9IHZpZXdfaWQ7DQor
ICAgIGFyZy0+dS5zdXBwcmVzc192ZV9tdWx0aS5maXJzdF9nZm4gPSBmaXJzdF9nZm47DQorICAg
IGFyZy0+dS5zdXBwcmVzc192ZV9tdWx0aS5sYXN0X2dmbiA9IGxhc3RfZ2ZuOw0KKyAgICBhcmct
PnUuc3VwcHJlc3NfdmVfbXVsdGkuc3VwcHJlc3NfdmUgPSBzdmU7DQorDQorICAgIHJjID0geGVu
Y2FsbDIoaGFuZGxlLT54Y2FsbCwgX19IWVBFUlZJU09SX2h2bV9vcCwgSFZNT1BfYWx0cDJtLA0K
KyAgICAgICAgICAgICAgICAgIEhZUEVSQ0FMTF9CVUZGRVJfQVNfQVJHKGFyZykpOw0KKw0KKyAg
ICBpZiAoIGFyZy0+dS5zdXBwcmVzc192ZV9tdWx0aS5maXJzdF9lcnJvciApDQorICAgIHsNCisg
ICAgICAgICplcnJvcl9nZm4gPSBhcmctPnUuc3VwcHJlc3NfdmVfbXVsdGkuZmlyc3RfZXJyb3Jf
Z2ZuOw0KKyAgICAgICAgKmVycm9yX2NvZGUgPSBhcmctPnUuc3VwcHJlc3NfdmVfbXVsdGkuZmly
c3RfZXJyb3I7DQorICAgIH0NCisNCisgICAgeGNfaHlwZXJjYWxsX2J1ZmZlcl9mcmVlKGhhbmRs
ZSwgYXJnKTsNCisgICAgcmV0dXJuIHJjOw0KK30NCisNCiBpbnQgeGNfYWx0cDJtX3NldF9tZW1f
YWNjZXNzKHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZpZXdfaWQsIHhlbl9wZm5fdCBnZm4sDQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB4ZW5tZW1fYWNjZXNzX3QgYWNjZXNzKQ0KZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jDQpp
bmRleCA0ZGZhZjM1NTY2Li40ZGIxNTc2OGQ0IDEwMDY0NA0KLS0tIGEveGVuL2FyY2gveDg2L2h2
bS9odm0uYw0KKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KQEAgLTQ1MjYsNiArNDUyNiw3
IEBAIHN0YXRpYyBpbnQgZG9fYWx0cDJtX29wKA0KICAgICBjYXNlIEhWTU9QX2FsdHAybV9kZXN0
cm95X3AybToNCiAgICAgY2FzZSBIVk1PUF9hbHRwMm1fc3dpdGNoX3AybToNCiAgICAgY2FzZSBI
Vk1PUF9hbHRwMm1fc2V0X3N1cHByZXNzX3ZlOg0KKyAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRf
c3VwcHJlc3NfdmVfbXVsdGk6DQogICAgIGNhc2UgSFZNT1BfYWx0cDJtX2dldF9zdXBwcmVzc192
ZToNCiAgICAgY2FzZSBIVk1PUF9hbHRwMm1fc2V0X21lbV9hY2Nlc3M6DQogICAgIGNhc2UgSFZN
T1BfYWx0cDJtX3NldF9tZW1fYWNjZXNzX211bHRpOg0KQEAgLTQ2ODQsNiArNDY4NSwyNSBAQCBz
dGF0aWMgaW50IGRvX2FsdHAybV9vcCgNCiAgICAgICAgIH0NCiAgICAgICAgIGJyZWFrOw0KIA0K
KyAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGk6DQorICAgIHsNCisg
ICAgICAgIHVpbnQ2NF90IG1heF9waHlzX2FkZHIgPSAoMVVMIDw8IGQtPmFyY2guY3B1aWQtPmV4
dGQubWF4cGh5c2FkZHIpIC0gMTsNCisNCisgICAgICAgIGEudS5zdXBwcmVzc192ZV9tdWx0aS5s
YXN0X2dmbiA9IG1pbihhLnUuc3VwcHJlc3NfdmVfbXVsdGkubGFzdF9nZm4sDQorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWF4X3BoeXNfYWRkcik7DQorDQor
ICAgICAgICBpZiAoIGEudS5zdXBwcmVzc192ZV9tdWx0aS5wYWQxIHx8DQorICAgICAgICAgICAg
IGEudS5zdXBwcmVzc192ZV9tdWx0aS5maXJzdF9nZm4gPiBhLnUuc3VwcHJlc3NfdmVfbXVsdGku
bGFzdF9nZm4gKQ0KKyAgICAgICAgICAgIHJjID0gLUVJTlZBTDsNCisgICAgICAgIGVsc2UNCisg
ICAgICAgIHsNCisgICAgICAgICAgICByYyA9IHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkoZCwg
JmEudS5zdXBwcmVzc192ZV9tdWx0aSk7DQorICAgICAgICAgICAgaWYgKCAoIXJjIHx8IHJjID09
IC1FUkVTVEFSVCkgJiYgX19jb3B5X3RvX2d1ZXN0KGFyZywgJmEsIDEpICkNCisgICAgICAgICAg
ICAgICAgcmMgPSAtRUZBVUxUOw0KKyAgICAgICAgfQ0KKyAgICAgICAgYnJlYWs7DQorICAgIH0N
CisNCiAgICAgY2FzZSBIVk1PUF9hbHRwMm1fZ2V0X3N1cHByZXNzX3ZlOg0KICAgICAgICAgaWYg
KCBhLnUuc3VwcHJlc3NfdmUucGFkMSB8fCBhLnUuc3VwcHJlc3NfdmUucGFkMiApDQogICAgICAg
ICAgICAgcmMgPSAtRUlOVkFMOw0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBi
L3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KaW5kZXggNGZjOTE5YTljNS4uZGU4MzJkY2M2ZCAxMDA2
NDQNCi0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KKysrIGIveGVuL2FyY2gveDg2L21tL3Ay
bS5jDQpAQCAtMzA3MCw2ICszMDcwLDcwIEBAIG91dDoNCiAgICAgcmV0dXJuIHJjOw0KIH0NCiAN
CisvKg0KKyAqIFNldC9jbGVhciB0aGUgI1ZFIHN1cHByZXNzIGJpdCBmb3IgbXVsdGlwbGUgcGFn
ZXMuICBPbmx5IGF2YWlsYWJsZSBvbiBWTVguDQorICovDQoraW50IHAybV9zZXRfc3VwcHJlc3Nf
dmVfbXVsdGkoc3RydWN0IGRvbWFpbiAqZCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc3VwcHJlc3NfdmVfbXVsdGkgKnN2ZSkNCit7DQorICAg
IHN0cnVjdCBwMm1fZG9tYWluICpob3N0X3AybSA9IHAybV9nZXRfaG9zdHAybShkKTsNCisgICAg
c3RydWN0IHAybV9kb21haW4gKmFwMm0gPSBOVUxMOw0KKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAq
cDJtID0gaG9zdF9wMm07DQorICAgIHVpbnQ2NF90IHN0YXJ0ID0gc3ZlLT5maXJzdF9nZm47DQor
ICAgIGludCByYyA9IDA7DQorDQorICAgIGlmICggc3ZlLT52aWV3ID4gMCApDQorICAgIHsNCisg
ICAgICAgIGlmICggc3ZlLT52aWV3ID49IE1BWF9BTFRQMk0gfHwNCisgICAgICAgICAgICAgZC0+
YXJjaC5hbHRwMm1fZXB0cFthcnJheV9pbmRleF9ub3NwZWMoc3ZlLT52aWV3LCBNQVhfQUxUUDJN
KV0gPT0NCisgICAgICAgICAgICAgbWZuX3goSU5WQUxJRF9NRk4pICkNCisgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsNCisNCisgICAgICAgIHAybSA9IGFwMm0gPSBkLT5hcmNoLmFsdHAybV9w
Mm1bYXJyYXlfaW5kZXhfbm9zcGVjKHN2ZS0+dmlldywNCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1BWF9BTFRQMk0pXTsNCisgICAg
fQ0KKw0KKyAgICBwMm1fbG9jayhob3N0X3AybSk7DQorDQorICAgIGlmICggYXAybSApDQorICAg
ICAgICBwMm1fbG9jayhhcDJtKTsNCisNCisgICAgd2hpbGUgKCBzdmUtPmxhc3RfZ2ZuID49IHN0
YXJ0ICkNCisgICAgew0KKyAgICAgICAgcDJtX2FjY2Vzc190IGE7DQorICAgICAgICBwMm1fdHlw
ZV90IHQ7DQorICAgICAgICBtZm5fdCBtZm47DQorICAgICAgICBpbnQgZXJyID0gMDsNCisNCisg
ICAgICAgIGlmICggYWx0cDJtX2dldF9lZmZlY3RpdmVfZW50cnkocDJtLCBfZ2ZuKHN0YXJ0KSwg
Jm1mbiwgJnQsICZhLCBBUDJNR0VUX3F1ZXJ5KSApDQorICAgICAgICAgICAgYSA9IHAybS0+ZGVm
YXVsdF9hY2Nlc3M7DQorDQorICAgICAgICBpZiAoIChlcnIgPSBwMm0tPnNldF9lbnRyeShwMm0s
IF9nZm4oc3RhcnQpLCBtZm4sIFBBR0VfT1JERVJfNEssIHQsIGEsDQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdmUtPnN1cHByZXNzX3ZlKSkgJiYNCisgICAgICAgICAgICAg
IXN2ZS0+Zmlyc3RfZXJyb3IpDQorICAgICAgICB7DQorICAgICAgICAgICAgc3ZlLT5maXJzdF9l
cnJvcl9nZm4gPSBzdGFydDsgLyogU2F2ZSB0aGUgZ2ZuIG9mIHRoZSBmaXJzdCBlcnJvciAqLw0K
KyAgICAgICAgICAgIHN2ZS0+Zmlyc3RfZXJyb3IgPSBlcnI7IC8qIFNhdmUgdGhlIGZpcnN0IGVy
cm9yIGNvZGUgKi8NCisgICAgICAgIH0NCisNCisgICAgICAgIC8qIENoZWNrIGZvciBjb250aW51
YXRpb24gaWYgaXQncyBub3QgdGhlIGxhc3QgaXRlcmF0aW9uLiAqLw0KKyAgICAgICAgaWYgKCBz
dmUtPmxhc3RfZ2ZuID49ICsrc3RhcnQgJiYgaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKSApDQor
ICAgICAgICB7DQorICAgICAgICAgICAgcmMgPSAtRVJFU1RBUlQ7DQorICAgICAgICAgICAgYnJl
YWs7DQorICAgICAgICB9DQorICAgIH0NCisNCisgICAgc3ZlLT5maXJzdF9nZm4gPSBzdGFydDsN
CisNCisgICAgaWYgKCBhcDJtICkNCisgICAgICAgIHAybV91bmxvY2soYXAybSk7DQorDQorICAg
IHAybV91bmxvY2soaG9zdF9wMm0pOw0KKw0KKyAgICByZXR1cm4gcmM7DQorfQ0KKw0KIGludCBw
Mm1fZ2V0X3N1cHByZXNzX3ZlKHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwgYm9vbCAqc3Vw
cHJlc3NfdmUsDQogICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGFsdHAybV9p
ZHgpDQogew0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmggYi94
ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oDQppbmRleCAzNTNmODAzNGQ5Li4xZjA0OWNm
YTJlIDEwMDY0NA0KLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaA0KKysrIGIv
eGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaA0KQEAgLTQ2LDYgKzQ2LDE2IEBAIHN0cnVj
dCB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZSB7DQogICAgIHVpbnQ2NF90IGdmbjsNCiB9Ow0K
IA0KK3N0cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZV9tdWx0aSB7DQorICAgIHVpbnQx
Nl90IHZpZXc7DQorICAgIHVpbnQ4X3Qgc3VwcHJlc3NfdmU7IC8qIEJvb2xlYW4gdHlwZS4gKi8N
CisgICAgdWludDhfdCBwYWQxOw0KKyAgICBpbnQzMl90IGZpcnN0X2Vycm9yOyAvKiBTaG91bGQg
YmUgc2V0IHRvIDAgLiAqLw0KKyAgICB1aW50NjRfdCBmaXJzdF9nZm47IC8qIFZhbHVlIG1heSBi
ZSB1cGRhdGVkICovDQorICAgIHVpbnQ2NF90IGxhc3RfZ2ZuOw0KKyAgICB1aW50NjRfdCBmaXJz
dF9lcnJvcl9nZm47IC8qIEdmbiBvZiB0aGUgZmlyc3QgZXJyb3IuICovDQorfTsNCisNCiAjaWYg
X19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXyA8IDB4MDAwNDA5MDANCiANCiAvKiBTZXQgdGhlIGxv
Z2ljYWwgbGV2ZWwgb2Ygb25lIG9mIGEgZG9tYWluJ3MgUENJIElOVHggd2lyZXMuICovDQpAQCAt
MzM5LDYgKzM0OSw4IEBAIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9vcCB7DQogI2RlZmluZSBIVk1P
UF9hbHRwMm1fdmNwdV9kaXNhYmxlX25vdGlmeSAgMTMNCiAvKiBHZXQgdGhlIGFjdGl2ZSB2Y3B1
IHAybSBpbmRleCAqLw0KICNkZWZpbmUgSFZNT1BfYWx0cDJtX2dldF9wMm1faWR4ICAgICAgICAg
IDE0DQorLyogU2V0IHRoZSAiU3VwcmVzcyAjVkUiIGJpdCBmb3IgYSByYW5nZSBvZiBwYWdlcyAq
Lw0KKyNkZWZpbmUgSFZNT1BfYWx0cDJtX3NldF9zdXBwcmVzc192ZV9tdWx0aSAxNQ0KICAgICBk
b21pZF90IGRvbWFpbjsNCiAgICAgdWludDE2X3QgcGFkMTsNCiAgICAgdWludDMyX3QgcGFkMjsN
CkBAIC0zNTMsNiArMzY1LDcgQEAgc3RydWN0IHhlbl9odm1fYWx0cDJtX29wIHsNCiAgICAgICAg
IHN0cnVjdCB4ZW5faHZtX2FsdHAybV9jaGFuZ2VfZ2ZuICAgICAgICAgICBjaGFuZ2VfZ2ZuOw0K
ICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3NldF9tZW1fYWNjZXNzX211bHRpIHNldF9t
ZW1fYWNjZXNzX211bHRpOw0KICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNz
X3ZlICAgICAgICAgIHN1cHByZXNzX3ZlOw0KKyAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJt
X3N1cHByZXNzX3ZlX211bHRpICAgIHN1cHByZXNzX3ZlX211bHRpOw0KICAgICAgICAgc3RydWN0
IHhlbl9odm1fYWx0cDJtX3ZjcHVfZGlzYWJsZV9ub3RpZnkgIGRpc2FibGVfbm90aWZ5Ow0KICAg
ICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX2dldF92Y3B1X3AybV9pZHggICAgIGdldF92Y3B1
X3AybV9pZHg7DQogICAgICAgICB1aW50OF90IHBhZFs2NF07DQpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUveGVuL21lbV9hY2Nlc3MuaCBiL3hlbi9pbmNsdWRlL3hlbi9tZW1fYWNjZXNzLmgNCmlu
ZGV4IGU0ZDI0NTAyZTAuLjAwZTU5NGEwYWQgMTAwNjQ0DQotLS0gYS94ZW4vaW5jbHVkZS94ZW4v
bWVtX2FjY2Vzcy5oDQorKysgYi94ZW4vaW5jbHVkZS94ZW4vbWVtX2FjY2Vzcy5oDQpAQCAtNzUs
NiArNzUsOSBAQCBsb25nIHAybV9zZXRfbWVtX2FjY2Vzc19tdWx0aShzdHJ1Y3QgZG9tYWluICpk
LA0KIGludCBwMm1fc2V0X3N1cHByZXNzX3ZlKHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwg
Ym9vbCBzdXBwcmVzc192ZSwNCiAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
YWx0cDJtX2lkeCk7DQogDQoraW50IHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkoc3RydWN0IGRv
bWFpbiAqZCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVuX2h2bV9h
bHRwMm1fc3VwcHJlc3NfdmVfbXVsdGkgKnN1cHByZXNzX3ZlKTsNCisNCiBpbnQgcDJtX2dldF9z
dXBwcmVzc192ZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIGJvb2wgKnN1cHByZXNzX3Zl
LA0KICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBhbHRwMm1faWR4KTsNCiAN
Ci0tIA0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
