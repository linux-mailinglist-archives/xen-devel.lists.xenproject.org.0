Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BA2140AD4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 14:34:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isRiq-0004Ay-1e; Fri, 17 Jan 2020 13:31:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Pu3f=3G=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1isRio-0004Ao-FW
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 13:31:34 +0000
X-Inumbo-ID: ac24263e-392d-11ea-b833-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::70f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac24263e-392d-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 13:31:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvtvSV1m9K2V3v61KMgoNwQSU2v3xJ6gsNtI08qkY5/42anaPwmJRiAEW0OW5mVqoC+gywG+n6woSlqIKGt7NPOcHGBBvwgdYYzYhILF24WVlciLJOmyIUVfc7oAXVegW89sR4ZL+jIcECexheHtv9CmcmDdGdF5o7YOTo0k5nR5ZHTA0+7zDUCT6T7Qlez3JNyZU54D2gvNmgZ84Ydgc8BZCQxuuVvcFpW3rezaiJ/E3lSKc5Ps2IjL+Zix6vZI8K739DLPq9EhtbjkgMx85v45lWB3kKkbUjYfLhe/xnuXaDuRSDr3uX3alDplQ5a/zCHXVSfQSD0zLIDjADAVXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roAEFmyFi2yNBdKzFUufx2e0ulDCZ/OkDjYFa9/ZFdM=;
 b=H2GXPSznlIy1CAAHlNAIdLDwg1XZo069WSaU/WpquDrm0soq0d374QHN0xGbrV9w8b48d/yfXZVJM7sXp5qxCFbRluv9TKV1hkWSBCvFSmcyuAeG6HQF9sbLFLr/EZ787LV20p42oR1+aybPQsDAZcBILHKVfp12vlHm+vCBBh7fh7nE+a23OIJjDolA5Px6HcBaeXMC1W+uQXGxU4MB1tSJ0TQ7rGaKg0E2WhiYc7TOzpZPDYXNQijciFYfuYKHred7pwd+1zulV+JlHCz6Q7RUoIR/oL57wfnJoiwW4TOTKFAh1//y8TRV1nim46KFyYRcbC609NzahWe22Vuu5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roAEFmyFi2yNBdKzFUufx2e0ulDCZ/OkDjYFa9/ZFdM=;
 b=ezmJqMo+dcEeWfWW/KPyRlfR9Zu3BoKRLPc+i7t1B4HI0FfyS325WgS1uO5D7Ooi5+LhTlKGc+9YfMwkOJth6fqM8hqZLoK6tSMPsC41IkvclVpKYlx4COoEhG0kgUx0zkveTMe5JF+Z/b73MGnGC1rgWMWiwuqGO4H/ZS9sCQU=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3207.eurprd02.prod.outlook.com (10.175.234.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Fri, 17 Jan 2020 13:31:30 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2644.023; Fri, 17 Jan 2020
 13:31:30 +0000
Received: from aisaila-Latitude-E5570.dsd.bitdefender.biz (91.199.104.6) by
 AM0PR0402CA0004.eurprd04.prod.outlook.com (2603:10a6:208:15::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via Frontend
 Transport; Fri, 17 Jan 2020 13:31:29 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V8 2/4] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVzTptSkYAIu/W+UimKALDRNBbPQ==
Date: Fri, 17 Jan 2020 13:31:30 +0000
Message-ID: <20200117133059.14602-2-aisaila@bitdefender.com>
References: <20200117133059.14602-1-aisaila@bitdefender.com>
In-Reply-To: <20200117133059.14602-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0402CA0004.eurprd04.prod.outlook.com
 (2603:10a6:208:15::17) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 761f7d53-6cfc-4489-23ff-08d79b518fab
x-ms-traffictypediagnostic: DB6PR02MB3207:|DB6PR02MB3207:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR02MB3207B8294EFA6427761684B4AB310@DB6PR02MB3207.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:94;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(396003)(366004)(136003)(39850400004)(199004)(189003)(71200400001)(1076003)(52116002)(956004)(2616005)(66476007)(66556008)(36756003)(107886003)(66446008)(64756008)(54906003)(478600001)(7416002)(86362001)(6486002)(5660300002)(4326008)(8936002)(316002)(16526019)(66946007)(81156014)(26005)(81166006)(186003)(6916009)(8676002)(2906002)(6666004)(6512007)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3207;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kAGlFp7P+YbcjG0JoXwaabC2fq7PdjDDKbyg+Gi21mxDAn1FGdlkL+UPkAN64RhcT8y5aiw0gaNVACdFJKJX5bbc82wQcEzikWe9+4dQXDyMUFVt7lgfHsRBehaAzMVcx5OqeuDMLaejRewRkHdZWaudlQgPHF72SFiExNTItIylgzo04nqtZb9M470MqviyfoUMDo3tydR0A1F21r5H2KvrHe05G0XTaCB81Fxjd/FHXdbDkSQmjxAazC8pvr2YL0BbrfOCEtRKkkUZ7GxSIGYbwBB/9VGn2a3plgX8xiwk4Q9XSgx44DdCKnimet0XNuGrkbSDJIeDdTD/7f2bIzlg8MMWzJUq5oiUqObzUDuIPNQ0+efDTVYGJZq7uHUXvpvGtdnBSk5Rn51yPsskV4L8+foWqiVXeLmb7kZZjQqgRc/72pZbli3J8+mXutfX
Content-ID: <A9AA8BB471E2C04FAFF3FE8BACF33D8D@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 761f7d53-6cfc-4489-23ff-08d79b518fab
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 13:31:30.2667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: on2eBBvVHh/jIj73/RtM4mTnc1Jvk4eL0qOy7nR2eGnGsSMLXWbNYQEtzrteIDupbN3JlcocqufmC25W4spr+gPP0OoQ/uBUtWAkBvVjAps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3207
Subject: [Xen-devel] [PATCH V8 2/4] x86/altp2m: Add hypercall to set a range
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
dmVfbXVsdGkoKSwgZG9lcyBub3QgYnJlYWsgaW4gY2FzZQ0Kb2YgYSBlcnJvciBhbmQgaXQgaXMg
ZG9pbmcgYSBiZXN0IGVmZm9ydCBmb3Igc2V0dGluZyB0aGUgYml0cyBpbiB0aGUNCmdpdmVuIHJh
bmdlLiBBIGNoZWNrIGZvciBjb250aW51YXRpb24gaXMgbWFkZSBpbiBvcmRlciB0byBoYXZlDQpw
cmVlbXB0aW9uIG9uIGxhcmdlIHJhbmdlcy4NClRoZSBnZm4gb2YgdGhlIGZpcnN0IGVycm9yIGlz
IHN0b3JlZCBpbg0KeGVuX2h2bV9hbHRwMm1fc3VwcHJlc3NfdmVfbXVsdGkuZmlyc3RfZXJyb3Jf
Z2ZuIGFuZCB0aGUgZXJyb3IgY29kZSBpcw0Kc3RvcmVkIGluIHhlbl9odm1fYWx0cDJtX3N1cHBy
ZXNzX3ZlX211bHRpLmZpcnN0X2Vycm9yLg0KSWYgbm8gZXJyb3Igb2NjdXJyZWQgdGhlIHZhbHVl
cyB3aWxsIGJlIDAuDQoNClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFA
Yml0ZGVmZW5kZXIuY29tPg0KDQotLS0NCkNDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4NCkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KQ0M6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQpDQzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1
bmxhcEBldS5jaXRyaXguY29tPg0KQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KQ0M6IEtvbnJhZCBSemVzenV0ZWsg
V2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4NCkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+DQpDQzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4NCkNDOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5j
b20+DQpDQzogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPg0KQ0M6
IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4NCkNDOiBQZXRyZSBQaXJjYWxh
YnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPg0KLS0tDQpDaGFuZ2VzIHNpbmNlIFY3Og0K
CS0gRml4IGNvbW1pdCBtZXNzYWdlDQoJLSBNb3ZlIGFsbCBpbiB2YWx1ZXMgaW4gdGhlIHN2ZSBp
bml0aWFsaXplcg0KCS0gRHJvcCBzdmUuZmlyc3RfZXJyb3IgY2hlY2suDQotLS0NCiB0b29scy9s
aWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCAgIHwgIDQgKysNCiB0b29scy9saWJ4Yy94Y19hbHRwMm0u
YyAgICAgICAgIHwgMzMgKysrKysrKysrKysrKysrDQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAg
ICAgICAgICB8IDIwICsrKysrKysrKw0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyAgICAgICAgICAg
fCA3NSArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCiB4ZW4vaW5jbHVkZS9wdWJs
aWMvaHZtL2h2bV9vcC5oIHwgMTMgKysrKysrDQogeGVuL2luY2x1ZGUveGVuL21lbV9hY2Nlc3Mu
aCAgICB8ICAzICsrDQogNiBmaWxlcyBjaGFuZ2VkLCAxMzAgaW5zZXJ0aW9ucygrKSwgMTggZGVs
ZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCBi
L3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oDQppbmRleCA3NWYxOTFhZTNhLi5jYzRlYjFl
M2QzIDEwMDY0NA0KLS0tIGEvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgNCisrKyBiL3Rv
b2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oDQpAQCAtMTkyMyw2ICsxOTIzLDEwIEBAIGludCB4
Y19hbHRwMm1fc3dpdGNoX3RvX3ZpZXcoeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVpbnQzMl90IGRv
bWlkLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3Qgdmlld19pZCk7DQog
aW50IHhjX2FsdHAybV9zZXRfc3VwcHJlc3NfdmUoeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVpbnQz
Ml90IGRvbWlkLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZpZXdf
aWQsIHhlbl9wZm5fdCBnZm4sIGJvb2wgc3ZlKTsNCitpbnQgeGNfYWx0cDJtX3NldF9zdXByZXNz
X3ZlX211bHRpKHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZpZXdfaWQsIHhlbl9wZm5fdCBm
aXJzdF9nZm4sDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4ZW5fcGZuX3Qg
bGFzdF9nZm4sIGJvb2wgc3ZlLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
eGVuX3Bmbl90ICplcnJvcl9nZm4sIGludDMyX3QgKmVycm9yX2NvZGUpOw0KIGludCB4Y19hbHRw
Mm1fZ2V0X3N1cHByZXNzX3ZlKHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCB2aWV3X2lkLCB4ZW5fcGZu
X3QgZ2ZuLCBib29sICpzdmUpOw0KIGludCB4Y19hbHRwMm1fc2V0X21lbV9hY2Nlc3MoeGNfaW50
ZXJmYWNlICpoYW5kbGUsIHVpbnQzMl90IGRvbWlkLA0KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhj
L3hjX2FsdHAybS5jIGIvdG9vbHMvbGlieGMveGNfYWx0cDJtLmMNCmluZGV4IDA5ZGFkMDM1NWUu
LjQ2ZmI3MjU4MDYgMTAwNjQ0DQotLS0gYS90b29scy9saWJ4Yy94Y19hbHRwMm0uYw0KKysrIGIv
dG9vbHMvbGlieGMveGNfYWx0cDJtLmMNCkBAIC0yMzQsNiArMjM0LDM5IEBAIGludCB4Y19hbHRw
Mm1fc2V0X3N1cHByZXNzX3ZlKHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwN
CiAgICAgcmV0dXJuIHJjOw0KIH0NCiANCitpbnQgeGNfYWx0cDJtX3NldF9zdXByZXNzX3ZlX211
bHRpKHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwNCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZpZXdfaWQsIHhlbl9wZm5fdCBmaXJzdF9n
Zm4sDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4ZW5fcGZuX3QgbGFzdF9n
Zm4sIGJvb2wgc3ZlLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeGVuX3Bm
bl90ICplcnJvcl9nZm4sIGludDMyX3QgKmVycm9yX2NvZGUpDQorew0KKyAgICBpbnQgcmM7DQor
ICAgIERFQ0xBUkVfSFlQRVJDQUxMX0JVRkZFUih4ZW5faHZtX2FsdHAybV9vcF90LCBhcmcpOw0K
Kw0KKyAgICBhcmcgPSB4Y19oeXBlcmNhbGxfYnVmZmVyX2FsbG9jKGhhbmRsZSwgYXJnLCBzaXpl
b2YoKmFyZykpOw0KKyAgICBpZiAoIGFyZyA9PSBOVUxMICkNCisgICAgICAgIHJldHVybiAtMTsN
CisNCisgICAgYXJnLT52ZXJzaW9uID0gSFZNT1BfQUxUUDJNX0lOVEVSRkFDRV9WRVJTSU9OOw0K
KyAgICBhcmctPmNtZCA9IEhWTU9QX2FsdHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGk7DQorICAg
IGFyZy0+ZG9tYWluID0gZG9taWQ7DQorICAgIGFyZy0+dS5zdXBwcmVzc192ZV9tdWx0aS52aWV3
ID0gdmlld19pZDsNCisgICAgYXJnLT51LnN1cHByZXNzX3ZlX211bHRpLmZpcnN0X2dmbiA9IGZp
cnN0X2dmbjsNCisgICAgYXJnLT51LnN1cHByZXNzX3ZlX211bHRpLmxhc3RfZ2ZuID0gbGFzdF9n
Zm47DQorICAgIGFyZy0+dS5zdXBwcmVzc192ZV9tdWx0aS5zdXBwcmVzc192ZSA9IHN2ZTsNCisN
CisgICAgcmMgPSB4ZW5jYWxsMihoYW5kbGUtPnhjYWxsLCBfX0hZUEVSVklTT1JfaHZtX29wLCBI
Vk1PUF9hbHRwMm0sDQorICAgICAgICAgICAgICAgICAgSFlQRVJDQUxMX0JVRkZFUl9BU19BUkco
YXJnKSk7DQorDQorICAgIGlmICggYXJnLT51LnN1cHByZXNzX3ZlX211bHRpLmZpcnN0X2Vycm9y
ICkNCisgICAgew0KKyAgICAgICAgKmVycm9yX2dmbiA9IGFyZy0+dS5zdXBwcmVzc192ZV9tdWx0
aS5maXJzdF9lcnJvcl9nZm47DQorICAgICAgICAqZXJyb3JfY29kZSA9IGFyZy0+dS5zdXBwcmVz
c192ZV9tdWx0aS5maXJzdF9lcnJvcjsNCisgICAgfQ0KKw0KKyAgICB4Y19oeXBlcmNhbGxfYnVm
ZmVyX2ZyZWUoaGFuZGxlLCBhcmcpOw0KKyAgICByZXR1cm4gcmM7DQorfQ0KKw0KIGludCB4Y19h
bHRwMm1fc2V0X21lbV9hY2Nlc3MoeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVpbnQzMl90IGRvbWlk
LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3Qgdmlld19pZCwgeGVuX3Bm
bl90IGdmbiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhlbm1lbV9hY2Nlc3NfdCBh
Y2Nlc3MpDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNoL3g4
Ni9odm0vaHZtLmMNCmluZGV4IDQ3MjNmNWQwOWMuLjRkNzliNDkzNGUgMTAwNjQ0DQotLS0gYS94
ZW4vYXJjaC94ODYvaHZtL2h2bS5jDQorKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jDQpAQCAt
NDUyMCw2ICs0NTIwLDcgQEAgc3RhdGljIGludCBkb19hbHRwMm1fb3AoDQogICAgIGNhc2UgSFZN
T1BfYWx0cDJtX2Rlc3Ryb3lfcDJtOg0KICAgICBjYXNlIEhWTU9QX2FsdHAybV9zd2l0Y2hfcDJt
Og0KICAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfc3VwcHJlc3NfdmU6DQorICAgIGNhc2UgSFZN
T1BfYWx0cDJtX3NldF9zdXBwcmVzc192ZV9tdWx0aToNCiAgICAgY2FzZSBIVk1PUF9hbHRwMm1f
Z2V0X3N1cHByZXNzX3ZlOg0KICAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfbWVtX2FjY2VzczoN
CiAgICAgY2FzZSBIVk1PUF9hbHRwMm1fc2V0X21lbV9hY2Nlc3NfbXVsdGk6DQpAQCAtNDY3OCw2
ICs0Njc5LDI1IEBAIHN0YXRpYyBpbnQgZG9fYWx0cDJtX29wKA0KICAgICAgICAgfQ0KICAgICAg
ICAgYnJlYWs7DQogDQorICAgIGNhc2UgSFZNT1BfYWx0cDJtX3NldF9zdXBwcmVzc192ZV9tdWx0
aToNCisgICAgew0KKyAgICAgICAgdWludDY0X3QgbWF4X3BoeXNfYWRkciA9ICgxVUwgPDwgZC0+
YXJjaC5jcHVpZC0+ZXh0ZC5tYXhwaHlzYWRkcikgLSAxOw0KKw0KKyAgICAgICAgYS51LnN1cHBy
ZXNzX3ZlX211bHRpLmxhc3RfZ2ZuID0gbWluKGEudS5zdXBwcmVzc192ZV9tdWx0aS5sYXN0X2dm
biwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXhfcGh5
c19hZGRyKTsNCisNCisgICAgICAgIGlmICggYS51LnN1cHByZXNzX3ZlX211bHRpLnBhZDEgfHwN
CisgICAgICAgICAgICAgYS51LnN1cHByZXNzX3ZlX211bHRpLmZpcnN0X2dmbiA+IGEudS5zdXBw
cmVzc192ZV9tdWx0aS5sYXN0X2dmbiApDQorICAgICAgICAgICAgcmMgPSAtRUlOVkFMOw0KKyAg
ICAgICAgZWxzZQ0KKyAgICAgICAgew0KKyAgICAgICAgICAgIHJjID0gcDJtX3NldF9zdXBwcmVz
c192ZV9tdWx0aShkLCAmYS51LnN1cHByZXNzX3ZlX211bHRpKTsNCisgICAgICAgICAgICBpZiAo
ICghcmMgfHwgcmMgPT0gLUVSRVNUQVJUKSAmJiBfX2NvcHlfdG9fZ3Vlc3QoYXJnLCAmYSwgMSkg
KQ0KKyAgICAgICAgICAgICAgICByYyA9IC1FRkFVTFQ7DQorICAgICAgICB9DQorICAgICAgICBi
cmVhazsNCisgICAgfQ0KKw0KICAgICBjYXNlIEhWTU9QX2FsdHAybV9nZXRfc3VwcHJlc3NfdmU6
DQogICAgICAgICBpZiAoIGEudS5zdXBwcmVzc192ZS5wYWQxIHx8IGEudS5zdXBwcmVzc192ZS5w
YWQyICkNCiAgICAgICAgICAgICByYyA9IC1FSU5WQUw7DQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L21tL3AybS5jIGIveGVuL2FyY2gveDg2L21tL3AybS5jDQppbmRleCAwMGIyNDM0MmZjLi4z
YTI5MjljMzY1IDEwMDY0NA0KLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jDQorKysgYi94ZW4v
YXJjaC94ODYvbW0vcDJtLmMNCkBAIC0zMDI2LDQ0ICszMDI2LDgzIEBAIG91dDoNCiAgKi8NCiBp
bnQgcDJtX3NldF9zdXBwcmVzc192ZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIGJvb2wg
c3VwcHJlc3NfdmUsDQogICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGFsdHAy
bV9pZHgpDQorew0KKyAgICBpbnQgcmM7DQorICAgIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBw
cmVzc192ZV9tdWx0aSBzdmUgPSB7DQorICAgICAgICBhbHRwMm1faWR4LCBzdXBwcmVzc192ZSwg
MCwgMCwgZ2ZuX3goZ2ZuKSwgZ2ZuX3goZ2ZuKSwgMA0KKyAgICB9Ow0KKw0KKyAgICBpZiAoICEo
cmMgPSBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKGQsICZzdmUpKSApDQorICAgICAgICByYyA9
IHN2ZS5maXJzdF9lcnJvcjsNCisNCisgICAgcmV0dXJuIHJjOw0KK30NCisNCisvKg0KKyAqIFNl
dC9jbGVhciB0aGUgI1ZFIHN1cHByZXNzIGJpdCBmb3IgbXVsdGlwbGUgcGFnZXMuICBPbmx5IGF2
YWlsYWJsZSBvbiBWTVguDQorICovDQoraW50IHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkoc3Ry
dWN0IGRvbWFpbiAqZCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVu
X2h2bV9hbHRwMm1fc3VwcHJlc3NfdmVfbXVsdGkgKnN2ZSkNCiB7DQogICAgIHN0cnVjdCBwMm1f
ZG9tYWluICpob3N0X3AybSA9IHAybV9nZXRfaG9zdHAybShkKTsNCiAgICAgc3RydWN0IHAybV9k
b21haW4gKmFwMm0gPSBOVUxMOw0KLSAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtOw0KLSAgICBt
Zm5fdCBtZm47DQotICAgIHAybV9hY2Nlc3NfdCBhOw0KLSAgICBwMm1fdHlwZV90IHQ7DQotICAg
IGludCByYzsNCisgICAgc3RydWN0IHAybV9kb21haW4gKnAybSA9IGhvc3RfcDJtOw0KKyAgICB1
aW50NjRfdCBzdGFydCA9IHN2ZS0+Zmlyc3RfZ2ZuOw0KKyAgICBpbnQgcmMgPSAwOw0KIA0KLSAg
ICBpZiAoIGFsdHAybV9pZHggPiAwICkNCisgICAgaWYgKCBzdmUtPnZpZXcgPiAwICkNCiAgICAg
ew0KLSAgICAgICAgaWYgKCBhbHRwMm1faWR4ID49IG1pbihBUlJBWV9TSVpFKGQtPmFyY2guYWx0
cDJtX3AybSksIE1BWF9FUFRQKSB8fA0KLSAgICAgICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRw
W2FycmF5X2luZGV4X25vc3BlYyhhbHRwMm1faWR4LCBNQVhfRVBUUCldID09DQorICAgICAgICBp
ZiAoIHN2ZS0+dmlldyA+PSBtaW4oQVJSQVlfU0laRShkLT5hcmNoLmFsdHAybV9wMm0pLCBNQVhf
RVBUUCkgfHwNCisgICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFthcnJheV9pbmRleF9u
b3NwZWMoc3ZlLT52aWV3LCBNQVhfRVBUUCldID09DQogICAgICAgICAgICAgIG1mbl94KElOVkFM
SURfTUZOKSApDQogICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQogDQotICAgICAgICBwMm0g
PSBhcDJtID0gYXJyYXlfYWNjZXNzX25vc3BlYyhkLT5hcmNoLmFsdHAybV9wMm0sIGFsdHAybV9p
ZHgpOw0KKyAgICAgICAgcDJtID0gYXAybSA9IGFycmF5X2FjY2Vzc19ub3NwZWMoZC0+YXJjaC5h
bHRwMm1fcDJtLCBzdmUtPnZpZXcpOw0KICAgICB9DQotICAgIGVsc2UNCi0gICAgICAgIHAybSA9
IGhvc3RfcDJtOw0KIA0KLSAgICBnZm5fbG9jayhob3N0X3AybSwgZ2ZuLCAwKTsNCisgICAgcDJt
X2xvY2soaG9zdF9wMm0pOw0KIA0KICAgICBpZiAoIGFwMm0gKQ0KICAgICAgICAgcDJtX2xvY2so
YXAybSk7DQogDQotICAgIHJjID0gYWx0cDJtX2dldF9lZmZlY3RpdmVfZW50cnkocDJtLCBnZm4s
ICZtZm4sICZ0LCAmYSwgQVAyTUdFVF9xdWVyeSk7DQorICAgIHdoaWxlICggc3ZlLT5sYXN0X2dm
biA+PSBzdGFydCApDQorICAgIHsNCisgICAgICAgIHAybV9hY2Nlc3NfdCBhOw0KKyAgICAgICAg
cDJtX3R5cGVfdCB0Ow0KKyAgICAgICAgbWZuX3QgbWZuOw0KKyAgICAgICAgaW50IGVyciA9IDA7
DQogDQotICAgIGlmICggcmMgKQ0KLSAgICAgICAgZ290byBvdXQ7DQorICAgICAgICBpZiAoIChl
cnIgPSBhbHRwMm1fZ2V0X2VmZmVjdGl2ZV9lbnRyeShwMm0sIF9nZm4oc3RhcnQpLCAmbWZuLCAm
dCwgJmEsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBB
UDJNR0VUX3F1ZXJ5KSkgJiYNCisgICAgICAgICAgICAgIXN2ZS0+Zmlyc3RfZXJyb3IgKQ0KKyAg
ICAgICAgew0KKyAgICAgICAgICAgIHN2ZS0+Zmlyc3RfZXJyb3JfZ2ZuID0gc3RhcnQ7IC8qIFNh
dmUgdGhlIGdmbiBvZiB0aGUgZmlyc3QgZXJyb3IgKi8NCisgICAgICAgICAgICBzdmUtPmZpcnN0
X2Vycm9yID0gZXJyOyAvKiBTYXZlIHRoZSBmaXJzdCBlcnJvciBjb2RlICovDQorICAgICAgICB9
DQogDQotICAgIHJjID0gcDJtLT5zZXRfZW50cnkocDJtLCBnZm4sIG1mbiwgUEFHRV9PUkRFUl80
SywgdCwgYSwgc3VwcHJlc3NfdmUpOw0KKyAgICAgICAgaWYgKCAhZXJyICYmIChlcnIgPSBwMm0t
PnNldF9lbnRyeShwMm0sIF9nZm4oc3RhcnQpLCBtZm4sDQorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFBBR0VfT1JERVJfNEssIHQsIGEsDQorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN2ZS0+c3VwcHJlc3NfdmUpKSAmJg0KKyAg
ICAgICAgICAgICAhc3ZlLT5maXJzdF9lcnJvciApDQorICAgICAgICB7DQorICAgICAgICAgICAg
c3ZlLT5maXJzdF9lcnJvcl9nZm4gPSBzdGFydDsgLyogU2F2ZSB0aGUgZ2ZuIG9mIHRoZSBmaXJz
dCBlcnJvciAqLw0KKyAgICAgICAgICAgIHN2ZS0+Zmlyc3RfZXJyb3IgPSBlcnI7IC8qIFNhdmUg
dGhlIGZpcnN0IGVycm9yIGNvZGUgKi8NCisgICAgICAgIH0NCisNCisgICAgICAgIC8qIENoZWNr
IGZvciBjb250aW51YXRpb24gaWYgaXQncyBub3QgdGhlIGxhc3QgaXRlcmF0aW9uLiAqLw0KKyAg
ICAgICAgaWYgKCBzdmUtPmxhc3RfZ2ZuID49ICsrc3RhcnQgJiYgaHlwZXJjYWxsX3ByZWVtcHRf
Y2hlY2soKSApDQorICAgICAgICB7DQorICAgICAgICAgICAgcmMgPSAtRVJFU1RBUlQ7DQorICAg
ICAgICAgICAgYnJlYWs7DQorICAgICAgICB9DQorICAgIH0NCisNCisgICAgc3ZlLT5maXJzdF9n
Zm4gPSBzdGFydDsNCiANCi1vdXQ6DQogICAgIGlmICggYXAybSApDQogICAgICAgICBwMm1fdW5s
b2NrKGFwMm0pOw0KIA0KLSAgICBnZm5fdW5sb2NrKGhvc3RfcDJtLCBnZm4sIDApOw0KKyAgICBw
Mm1fdW5sb2NrKGhvc3RfcDJtKTsNCiANCiAgICAgcmV0dXJuIHJjOw0KIH0NCmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oIGIveGVuL2luY2x1ZGUvcHVibGljL2h2
bS9odm1fb3AuaA0KaW5kZXggMzUzZjgwMzRkOS4uZDM0NDYwNjg2NCAxMDA2NDQNCi0tLSBhL3hl
bi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmgNCisrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9o
dm0vaHZtX29wLmgNCkBAIC00Niw2ICs0NiwxNiBAQCBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc3Vw
cHJlc3NfdmUgew0KICAgICB1aW50NjRfdCBnZm47DQogfTsNCiANCitzdHJ1Y3QgeGVuX2h2bV9h
bHRwMm1fc3VwcHJlc3NfdmVfbXVsdGkgew0KKyAgICB1aW50MTZfdCB2aWV3Ow0KKyAgICB1aW50
OF90IHN1cHByZXNzX3ZlOyAvKiBCb29sZWFuIHR5cGUuICovDQorICAgIHVpbnQ4X3QgcGFkMTsN
CisgICAgaW50MzJfdCBmaXJzdF9lcnJvcjsgLyogU2hvdWxkIGJlIHNldCB0byAwLiAqLw0KKyAg
ICB1aW50NjRfdCBmaXJzdF9nZm47IC8qIFZhbHVlIG1heSBiZSB1cGRhdGVkLiAqLw0KKyAgICB1
aW50NjRfdCBsYXN0X2dmbjsNCisgICAgdWludDY0X3QgZmlyc3RfZXJyb3JfZ2ZuOyAvKiBHZm4g
b2YgdGhlIGZpcnN0IGVycm9yLiAqLw0KK307DQorDQogI2lmIF9fWEVOX0lOVEVSRkFDRV9WRVJT
SU9OX18gPCAweDAwMDQwOTAwDQogDQogLyogU2V0IHRoZSBsb2dpY2FsIGxldmVsIG9mIG9uZSBv
ZiBhIGRvbWFpbidzIFBDSSBJTlR4IHdpcmVzLiAqLw0KQEAgLTMzOSw2ICszNDksOCBAQCBzdHJ1
Y3QgeGVuX2h2bV9hbHRwMm1fb3Agew0KICNkZWZpbmUgSFZNT1BfYWx0cDJtX3ZjcHVfZGlzYWJs
ZV9ub3RpZnkgIDEzDQogLyogR2V0IHRoZSBhY3RpdmUgdmNwdSBwMm0gaW5kZXggKi8NCiAjZGVm
aW5lIEhWTU9QX2FsdHAybV9nZXRfcDJtX2lkeCAgICAgICAgICAxNA0KKy8qIFNldCB0aGUgIlN1
cHJlc3MgI1ZFIiBiaXQgZm9yIGEgcmFuZ2Ugb2YgcGFnZXMgKi8NCisjZGVmaW5lIEhWTU9QX2Fs
dHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkgMTUNCiAgICAgZG9taWRfdCBkb21haW47DQogICAg
IHVpbnQxNl90IHBhZDE7DQogICAgIHVpbnQzMl90IHBhZDI7DQpAQCAtMzUzLDYgKzM2NSw3IEBA
IHN0cnVjdCB4ZW5faHZtX2FsdHAybV9vcCB7DQogICAgICAgICBzdHJ1Y3QgeGVuX2h2bV9hbHRw
Mm1fY2hhbmdlX2dmbiAgICAgICAgICAgY2hhbmdlX2dmbjsNCiAgICAgICAgIHN0cnVjdCB4ZW5f
aHZtX2FsdHAybV9zZXRfbWVtX2FjY2Vzc19tdWx0aSBzZXRfbWVtX2FjY2Vzc19tdWx0aTsNCiAg
ICAgICAgIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZSAgICAgICAgICBzdXBwcmVz
c192ZTsNCisgICAgICAgIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZV9tdWx0aSAg
ICBzdXBwcmVzc192ZV9tdWx0aTsNCiAgICAgICAgIHN0cnVjdCB4ZW5faHZtX2FsdHAybV92Y3B1
X2Rpc2FibGVfbm90aWZ5ICBkaXNhYmxlX25vdGlmeTsNCiAgICAgICAgIHN0cnVjdCB4ZW5faHZt
X2FsdHAybV9nZXRfdmNwdV9wMm1faWR4ICAgICBnZXRfdmNwdV9wMm1faWR4Ow0KICAgICAgICAg
dWludDhfdCBwYWRbNjRdOw0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9tZW1fYWNjZXNz
LmggYi94ZW4vaW5jbHVkZS94ZW4vbWVtX2FjY2Vzcy5oDQppbmRleCBlNGQyNDUwMmUwLi4wMGU1
OTRhMGFkIDEwMDY0NA0KLS0tIGEveGVuL2luY2x1ZGUveGVuL21lbV9hY2Nlc3MuaA0KKysrIGIv
eGVuL2luY2x1ZGUveGVuL21lbV9hY2Nlc3MuaA0KQEAgLTc1LDYgKzc1LDkgQEAgbG9uZyBwMm1f
c2V0X21lbV9hY2Nlc3NfbXVsdGkoc3RydWN0IGRvbWFpbiAqZCwNCiBpbnQgcDJtX3NldF9zdXBw
cmVzc192ZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIGJvb2wgc3VwcHJlc3NfdmUsDQog
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGFsdHAybV9pZHgpOw0KIA0KK2lu
dCBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKHN0cnVjdCBkb21haW4gKmQsDQorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlX211
bHRpICpzdXBwcmVzc192ZSk7DQorDQogaW50IHAybV9nZXRfc3VwcHJlc3NfdmUoc3RydWN0IGRv
bWFpbiAqZCwgZ2ZuX3QgZ2ZuLCBib29sICpzdXBwcmVzc192ZSwNCiAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgYWx0cDJtX2lkeCk7DQogDQotLSANCjIuMTcuMQ0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
