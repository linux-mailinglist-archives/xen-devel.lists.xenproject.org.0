Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A253D5CD
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 20:49:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haln6-0006JH-CK; Tue, 11 Jun 2019 18:46:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZYfD=UK=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1haln4-0006Io-Ph
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 18:46:38 +0000
X-Inumbo-ID: 3ce8ae62-8c79-11e9-8980-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::61b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3ce8ae62-8c79-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 18:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eE649t0mAy5U3VBTEcLz7zhFw9XkJ1cEtUgswiLu/XI=;
 b=gzBDiE6htklB49eymA/GZRig1Cq9de0SVlJ1p6NYeDhsY9NHs0YoMAIjucjeJ4D4WSgjiKOtFQmoIgBgSdoaIC9aanT4xXFzCadvG6n5H2yvYhaYqNJmrZAUKjJwNEANPFna0YmeNLnjfgc1ztZCr+VzePyg+UwpLXHZElHn/TPoRvDR9OyorAUCYQYdoiCr1+LA07naYmAtTTI+evqVSZzk9zaa0tOJiv4RJ2e7Ne2cqkWjmkVwRjeAfW4C4MZwb7DBPHldeb6UUpFkgYWOjqFvRd7JV6k0/JBmtFzAwKQNS8XSpbyVSamqVoYtXhPYFlfO4Lj0yLd8UMAF+LPgFA==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB3795.eurprd03.prod.outlook.com (52.135.146.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Tue, 11 Jun 2019 18:46:33 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1965.011; Tue, 11 Jun 2019
 18:46:33 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v6 05/10] xen/arm: optee: add std call handling
Thread-Index: AQHVIIX9Gln1vgrZ6kGKROV0ZvhYmw==
Date: Tue, 11 Jun 2019 18:46:33 +0000
Message-ID: <20190611184541.7281-6-volodymyr_babchuk@epam.com>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18a1e625-7544-49cb-2193-08d6ee9d2033
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB3795; 
x-ms-traffictypediagnostic: AM0PR03MB3795:
x-microsoft-antispam-prvs: <AM0PR03MB37958EBF01C5366A78DC5A3DE6ED0@AM0PR03MB3795.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(376002)(396003)(366004)(189003)(199004)(73956011)(256004)(1076003)(305945005)(5660300002)(30864003)(14444005)(76116006)(486006)(7736002)(91956017)(53936002)(14454004)(71190400001)(71200400001)(26005)(80792005)(76176011)(66946007)(2501003)(6506007)(102836004)(25786009)(55236004)(186003)(36756003)(86362001)(68736007)(2351001)(99286004)(2906002)(81166006)(81156014)(66476007)(4326008)(5640700003)(8676002)(8936002)(53946003)(64756008)(66446008)(6512007)(478600001)(66556008)(316002)(6486002)(54906003)(2616005)(446003)(6116002)(6436002)(3846002)(66066001)(11346002)(72206003)(476003)(6916009)(579004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3795;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1AVrxvZn4yhXauDQMe4U9pr1Uy3dpn8spgKvkSmOgczir+kNETYBEohV+pFs/J7jS+1jxwYNrJXvWxMAHAK0vrQAXllV1/wq1N12+OO2QKSMJkAZoE3Nq6MqrmmvNAYVdNTVO5Z+rQF1puBwU1aTI0Lk5cCprFstSckK6mXRz4wPVF4YKvixo6aEIBMJVj4Vx53ajl1l/MHtAiQStZgn7SBkVlsiZKqIk5dOMUdc2/L69q+5sqvq87qi+vkx082keaFwl3wqVQ3HlSjwtiMfBm1uW4m55WmXz0kfFtE1bc7+Bp4ZpNw5BSbO2c6xY5Zb5sRdFTfZDaxaajELgr+N1G1jEpYGjeI6gWj48Jf7oJLSBJxbFwytpWjlXjC95X0VrPeIPKLjMpC8UL1OXL+gxNRXJuyhW9y56JccTPUVKc4=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a1e625-7544-49cb-2193-08d6ee9d2033
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 18:46:33.6392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3795
Subject: [Xen-devel] [PATCH v6 05/10] xen/arm: optee: add std call handling
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG1haW4gd2F5IHRvIGNvbW11bmljYXRlIHdpdGggT1AtVEVFIGlzIHRvIGlzc3VlIHN0YW5k
YXJkIFNNQ0NDCmNhbGwuICJTdGFuZGFyZCIgaXMgYSBTTUNDQyB0ZXJtIGFuZCBpdCBtZWFucyB0
aGF0IGNhbGwgY2FuIGJlCmludGVycnVwdGVkIGFuZCBPUC1URUUgY2FuIHJldHVybiBjb250cm9s
IHRvIE5XIGJlZm9yZSBjb21wbGV0aW5nCnRoZSBjYWxsLgoKSW4gY29udHJhc3Qgd2l0aCBmYXN0
IGNhbGxzLCB3aGVyZSBhcmd1bWVudHMgYW5kIHJldHVybiB2YWx1ZXMKYXJlIHBhc3NlZCBpbiBy
ZWdpc3RlcnMsIHN0YW5kYXJkIGNhbGxzIHVzZSBzaGFyZWQgbWVtb3J5LiBSZWdpc3RlcgpwYWly
IGExLGEyIGhvbGRzIDY0LWJpdCBQQSBvZiBjb21tYW5kIGJ1ZmZlciwgd2hlcmUgYWxsIGFyZ3Vt
ZW50cwphcmUgc3RvcmVkIGFuZCB3aGljaCBpcyB1c2VkIHRvIHJldHVybiBkYXRhLiBPUC1URUUg
aW50ZXJuYWxseQpjb3BpZXMgY29udGVudHMgb2YgdGhpcyBidWZmZXIgaW50byBvd24gc2VjdXJl
IG1lbW9yeSBiZWZvcmUgYWNjZXNzaW5nCmFuZCB2YWxpZGF0aW5nIGFueSBkYXRhIGluIGNvbW1h
bmQgYnVmZmVyLiBUaGlzIGlzIGRvbmUgdG8gbWFrZSBzdXJlCnRoYXQgTlcgd2lsbCBub3QgY2hh
bmdlIGNvbnRlbnRzIG9mIHRoZSB2YWxpZGF0ZWQgcGFyYW1ldGVycy4KCk1lZGlhdG9yIG5lZWRz
IHRvIGRvIHRoZSBzYW1lIGZvciBudW1iZXIgb2YgcmVhc29uczoKCjEuIFRvIG1ha2Ugc3VyZSB0
aGF0IGd1ZXN0IHdpbGwgbm90IGNoYW5nZSBkYXRhIGFmdGVyIHZhbGlkYXRpb24uCjIuIFRvIHRy
YW5zbGF0ZSBJUEFzIHRvIFBBcyBpbiB0aGUgY29tbWFuZCBidWZmZXIgKHRoaXMgaXMgbm90IGRv
bmUKICAgaW4gdGhpcyBwYXRjaCkuCjMuIFRvIGhpZGUgdHJhbnNsYXRlZCBhZGRyZXNzIGZyb20g
Z3Vlc3QsIHNvIGl0IHdpbGwgbm90IGJlIGFibGUKICAgdG8gZG8gSVBBLT5QQSB0cmFuc2xhdGlv
biBieSBtaXN1c2luZyBtZWRpYXRvci4KCkR1cmluZyBzdGFuZGFyZCBjYWxsIE9QLVRFRSBjYW4g
aXNzdWUgbXVsdGlwbGUgIlJQQyByZXR1cm5zIiwgYXNraW5nCk5XIHRvIGRvIHNvbWUgd29yayBm
b3IgT1AtVEVFLiBOVyB0aGVuIGlzc3VlcyBzcGVjaWFsIGNhbGwKT1BURUVfU01DX0NBTExfUkVU
VVJOX0ZST01fUlBDIHRvIHJlc3VtZSBoYW5kbGluZyBvZiB0aGUgb3JpZ2luYWwgY2FsbC4KVGh1
cywgbWVkaWF0b3IgbmVlZHMgdG8gbWFpbnRhaW4gY29udGV4dCBmb3Igb3JpZ2luYWwgc3RhbmRh
cmQgY2FsbApkdXJpbmcgbXVsdGlwbGUgU01DQ0MgY2FsbHMuCgpTdGFuZGFyZCBjYWxsIGlzIGNv
bnNpZGVyZWQgY29tcGxldGUsIHdoZW4gcmV0dXJuZWQgdmFsdWUgaXMKbm90IGEgUlBDIHJlcXVl
c3QuCgpTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtA
ZXBhbS5jb20+CkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoK
LS0tCiBBbGwgdGhlIHBhdGNoZXMgdG8gb3B0ZWUuYyBzaG91bGQgYmUgbWVyZ2VkIHRvZ2V0aGVy
LiBUaGV5IHdlcmUKIHNwbGl0IHRvIGVhc2UgdXAgcmV2aWV3LiBCdXQgdGhleSBkZXBlbmQgaGVh
dmlseSBvbiBlYWNoIG90aGVyLgoKICBDaGFuZ2VzIGZyb20gdjQ6CiAgLSBDb2RlIHVzZXMgYXJt
X3NtY2NjX3NtYygpIGRpcmVjdGx5LCBpbnN0ZWFkIG9mIGZvcndhcmRfY2FsbCgpCiAgLSBkb19j
YWxsX3dpdGhfYXJnKCkgZnVuY3Rpb24gbm93IGFjY2VwdHMgcmVnaXN0ZXIgdmFsdWVzIGFzCiAg
ICBwYXJhbWV0ZXJzLCBzbyBpdCBjYW4gYmUgY2FsbGVkIGJ5IFJQQyBoYW5kbGVycyB3aXRoIGNv
cnJlY3QKICAgIHZhbHVlcyBmb3IgdGhlIGdpdmVuIFJQQyB0eXBlCiAgLSBvcHRlZV9wcm9iZSgp
IGNhbGxzIE9QVEVFX1NNQ19HRVRfVEhSRUFEX0NPVU5ULiBUaGlzIGNhbGwKICAgIGlzIG1lcmdl
ZCBpbnRvIE9QLVRFRSBtYWlubGluZSBhbmQgd2lsbCBiZSByZWxlYXNlZCB3aXRoCiAgICBPUC1U
RUUgdjMuNS4wCiAgLSBSZW1vdmVkIERFRl9NQVhfT1BURUVfVEhSRUFEUyBiZWNhdXNlIGl0IGlz
IGV4cGVjdGVkIHRoYXQKICAgIE9QLVRFRSB3b3VsZCBzdXBwb3J0IE9QVEVFX1NNQ19HRVRfVEhS
RUFEX0NPVU5UCiAgLSBNb3ZlZCBtYXAvdW5tYXBfeGVuX2FyZygpIG91dHNpZGUgdGhlIHNwaW5s
b2NrcwogIC0gQWRkZWQgZ2V0X2RvbWFpbl9yYW1fcGFnZSgpIGhlbHBlciBmdW5jdGlvbgogIC0g
Q2hlY2sgdGhlIG51bWJlciBvZiBwYXJhbWV0ZXJzLCB0aGF0IGFyZSBzdXBwbGllZCBieSBndWVz
dAoKICBDaGFuZ2VzIGZyb20gdjM6CiAgLSBBZGRlZCBhYmlsaXR5IHRvIHJlYWQgbnVtYmVyIG9m
IHRocmVhZHMgZnJvbSBPUC1URUUsIGlmIGl0CiAgc3VwcG9ydHMgdGhpcyBmZWF0dXJlCiAgLSBQ
YWdlcyBhcmUgYWxsb2NhdGVkIGZyb20gZG9taGVhcCwgaW5zdGVhZCBvZiB4ZW5oZWFwCiAgLSBB
ZGRlZCBjb21tZW50cyBmb3IgY29tcGxleCBjb2RlCgogIENoYW5nZXMgZnJvbSB2MjoKICAtIHJl
bmFtZWQgc3RydWN0IGRvbWFpbl9jdHggdG8gc3RydWN0IG9wdGVlX2RvbWFpbgogIC0gZml4ZWQg
Y29kaW5nIHN0eWxlCiAgLSBOb3cgSSB1c2UgYWNjZXNzX2d1ZXN0X21lbW9yeV9ieV9pcGEoKSBp
bnN0ZWFkIG9mIG1hcHBpbmdzCiAgICB0byByZWFkIGNvbW1hbmQgYnVmZmVyCiAgLSBBZGRlZCB0
cmFja2luZyBmb3IgaW4gZmxpZ2h0IGNhbGxzLCBzbyBndWVzdCBjYW4ndCByZXN1bWUKICAgIHRo
ZSBzYW1lIGNhbGwgZnJvbSB0d28gQ1BVcyBzaW11bHRhbmlvdXNseQotLS0KIHhlbi9hcmNoL2Fy
bS90ZWUvb3B0ZWUuYyB8IDUxMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCA1MDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMgYi94ZW4vYXJjaC9hcm0vdGVlL29w
dGVlLmMKaW5kZXggNmM1MWNhYTQxYS4uZjA5MjQ5Mjg0OSAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
YXJtL3RlZS9vcHRlZS5jCisrKyBiL3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYwpAQCAtMjUsOCAr
MjUsMTMgQEAKICAqLwogCiAjaW5jbHVkZSA8eGVuL2RldmljZV90cmVlLmg+CisjaW5jbHVkZSA8
eGVuL2RvbWFpbl9wYWdlLmg+CisjaW5jbHVkZSA8eGVuL2Vyci5oPgorI2luY2x1ZGUgPHhlbi9n
dWVzdF9hY2Nlc3MuaD4KKyNpbmNsdWRlIDx4ZW4vbW0uaD4KICNpbmNsdWRlIDx4ZW4vc2NoZWQu
aD4KIAorI2luY2x1ZGUgPGFzbS9ldmVudC5oPgogI2luY2x1ZGUgPGFzbS9zbWNjYy5oPgogI2lu
Y2x1ZGUgPGFzbS90ZWUvdGVlLmg+CiAjaW5jbHVkZSA8YXNtL3RlZS9vcHRlZV9tc2cuaD4KQEAg
LTM1LDYgKzQwLDE5IEBACiAvKiBOdW1iZXIgb2YgU01DcyBrbm93biB0byB0aGUgbWVkaWF0b3Ig
Ki8KICNkZWZpbmUgT1BURUVfTUVESUFUT1JfU01DX0NPVU5UICAgMTEKIAorLyoKKyAqICJUaGUg
cmV0dXJuIGNvZGUgaXMgYW4gZXJyb3IgdGhhdCBvcmlnaW5hdGVkIHdpdGhpbiB0aGUgdW5kZXJs
eWluZworICogY29tbXVuaWNhdGlvbnMgc3RhY2sgbGlua2luZyB0aGUgcmljaCBPUyB3aXRoIHRo
ZSBURUUiIGFzIGRlc2NyaWJlZAorICogaW4gR1AgVEVFIENsaWVudCBBUEkgU3BlY2lmaWNhdGlv
bi4KKyAqLworI2RlZmluZSBURUVDX09SSUdJTl9DT01NUyAweDAwMDAwMDAyCisKKy8qCisgKiAi
SW5wdXQgcGFyYW1ldGVycyB3ZXJlIGludmFsaWQiIGFzIGRlc2NyaWJlZAorICogaW4gR1AgVEVF
IENsaWVudCBBUEkgU3BlY2lmaWNhdGlvbi4KKyAqLworI2RlZmluZSBURUVDX0VSUk9SX0JBRF9Q
QVJBTUVURVJTIDB4RkZGRjAwMDYKKwogLyogQ2xpZW50IElEIDAgaXMgcmVzZXJ2ZWQgZm9yIHRo
ZSBoeXBlcnZpc29yIGl0c2VsZiAqLwogI2RlZmluZSBPUFRFRV9DTElFTlRfSUQoZG9tYWluKSAo
KGRvbWFpbiktPmRvbWFpbl9pZCArIDEpCiAKQEAgLTQzLDggKzYxLDMxIEBACiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBPUFRFRV9TTUNfU0VDX0NBUF9VTlJFR0lTVEVSRURfU0hNIHwg
XAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgT1BURUVfU01DX1NFQ19DQVBfRFlOQU1J
Q19TSE0pCiAKK3N0YXRpYyB1bnNpZ25lZCBpbnQgX19yZWFkX21vc3RseSBtYXhfb3B0ZWVfdGhy
ZWFkczsKKworLyoKKyAqIENhbGwgY29udGV4dC4gT1AtVEVFIGNhbiBpc3N1ZSBtdWx0aXBsZSBS
UEMgcmV0dXJucyBkdXJpbmcgb25lIGNhbGwuCisgKiBXZSBuZWVkIHRvIHByZXNlcnZlIGNvbnRl
eHQgZHVyaW5nIHRoZW0uCisgKi8KK3N0cnVjdCBvcHRlZV9zdGRfY2FsbCB7CisgICAgc3RydWN0
IGxpc3RfaGVhZCBsaXN0OworICAgIC8qIFBhZ2Ugd2hlcmUgc2hhZG93ZWQgY29weSBvZiBjYWxs
IGFyZ3VtZW50cyBpcyBzdG9yZWQgKi8KKyAgICBzdHJ1Y3QgcGFnZV9pbmZvICp4ZW5fYXJnX3Bn
OworICAgIC8qIEFib3ZlIHBhZ2UgbWFwcGVkIGludG8gWEVOICovCisgICAgc3RydWN0IG9wdGVl
X21zZ19hcmcgKnhlbl9hcmc7CisgICAgLyogQWRkcmVzcyBvZiBvcmlnaW5hbCBjYWxsIGFyZ3Vt
ZW50cyAqLworICAgIHBhZGRyX3QgZ3Vlc3RfYXJnX2lwYTsKKyAgICBpbnQgb3B0ZWVfdGhyZWFk
X2lkOworICAgIGludCBycGNfb3A7CisgICAgYm9vbCBpbl9mbGlnaHQ7CisgICAgcmVnaXN0ZXJf
dCBycGNfcGFyYW1zWzJdOworfTsKKwogLyogRG9tYWluIGNvbnRleHQgKi8KIHN0cnVjdCBvcHRl
ZV9kb21haW4geworICAgIHN0cnVjdCBsaXN0X2hlYWQgY2FsbF9saXN0OworICAgIGF0b21pY190
IGNhbGxfY291bnQ7CisgICAgc3BpbmxvY2tfdCBsb2NrOwogfTsKIAogc3RhdGljIGJvb2wgb3B0
ZWVfcHJvYmUodm9pZCkKQEAgLTY2LDYgKzEwNywyMyBAQCBzdGF0aWMgYm9vbCBvcHRlZV9wcm9i
ZSh2b2lkKQogICAgICAgICAgKHVpbnQzMl90KXJlc3AuYTMgIT0gT1BURUVfTVNHX1VJRF8zICkK
ICAgICAgICAgcmV0dXJuIGZhbHNlOwogCisgICAgLyogUmVhZCBudW1iZXIgb2YgdGhyZWFkcyAq
LworICAgIGFybV9zbWNjY19zbWMoT1BURUVfU01DX0dFVF9USFJFQURfQ09VTlQsICZyZXNwKTsK
KyAgICBpZiAoIHJlc3AuYTAgPT0gT1BURUVfU01DX1JFVFVSTl9PSyApCisgICAgeworICAgICAg
ICBtYXhfb3B0ZWVfdGhyZWFkcyA9IHJlc3AuYTE7CisgICAgICAgIHByaW50ayhYRU5MT0dfSU5G
TworICAgICAgICAgICAgICAgIk9QLVRFRSBzdXBwb3J0cyAldSBzaW11bHRhbmVvdXMgdGhyZWFk
cyBwZXIgZ3Vlc3QuXG4iLAorICAgICAgICAgICAgICAgbWF4X29wdGVlX3RocmVhZHMpOworICAg
IH0KKyAgICBlbHNlCisgICAgeworICAgICAgICBwcmludGsoWEVOTE9HX0VSUgorICAgICAgICAg
ICAgICAgIkNhbid0IHJlYWQgbnVtYmVyIG9mIHRocmVhZHMgc3VwcG9ydGVkIGJ5IE9QLVRFRTog
JXhcbiIsCisgICAgICAgICAgICAgICAodWludDMyX3QpcmVzcC5hMCk7CisgICAgICAgIHJldHVy
biBmYWxzZTsKKyAgICB9CisKICAgICByZXR1cm4gdHJ1ZTsKIH0KIApAQCAtOTksMTggKzE1Nywx
NjMgQEAgc3RhdGljIGludCBvcHRlZV9kb21haW5faW5pdChzdHJ1Y3QgZG9tYWluICpkKQogICAg
ICAgICByZXR1cm4gLUVOT0RFVjsKICAgICB9CiAKKyAgICBJTklUX0xJU1RfSEVBRCgmY3R4LT5j
YWxsX2xpc3QpOworICAgIGF0b21pY19zZXQoJmN0eC0+Y2FsbF9jb3VudCwgMCk7CisgICAgc3Bp
bl9sb2NrX2luaXQoJmN0eC0+bG9jayk7CisKICAgICBkLT5hcmNoLnRlZSA9IGN0eDsKIAogICAg
IHJldHVybiAwOwogfQogCitzdGF0aWMgdWludDY0X3QgcmVncGFpcl90b191aW50NjQocmVnaXN0
ZXJfdCByZWcwLCByZWdpc3Rlcl90IHJlZzEpCit7CisgICAgcmV0dXJuICgodWludDY0X3QpcmVn
MCA8PCAzMikgfCAodWludDMyX3QpcmVnMTsKK30KKworc3RhdGljIHZvaWQgdWludDY0X3RvX3Jl
Z3BhaXIocmVnaXN0ZXJfdCAqcmVnMCwgcmVnaXN0ZXJfdCAqcmVnMSwgdWludDY0X3QgdmFsKQor
eworICAgICpyZWcwID0gdmFsID4+IDMyOworICAgICpyZWcxID0gKHVpbnQzMl90KXZhbDsKK30K
Kworc3RhdGljIHN0cnVjdCBwYWdlX2luZm8gKmdldF9kb21haW5fcmFtX3BhZ2UoZ2ZuX3QgZ2Zu
KQoreworICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7CisgICAgcDJtX3R5cGVfdCB0OworCisg
ICAgcGFnZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKGN1cnJlbnQtPmRvbWFpbiwgZ2ZuX3goZ2ZuKSwg
JnQsIFAyTV9BTExPQyk7CisgICAgaWYgKCAhcGFnZSB8fCB0ICE9IHAybV9yYW1fcncgKQorICAg
IHsKKyAgICAgICAgaWYgKCBwYWdlICkKKyAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOworCisg
ICAgICAgIHJldHVybiBOVUxMOworICAgIH0KKworICAgIHJldHVybiBwYWdlOworfQorCitzdGF0
aWMgc3RydWN0IG9wdGVlX3N0ZF9jYWxsICphbGxvY2F0ZV9zdGRfY2FsbChzdHJ1Y3Qgb3B0ZWVf
ZG9tYWluICpjdHgpCit7CisgICAgc3RydWN0IG9wdGVlX3N0ZF9jYWxsICpjYWxsOworICAgIGlu
dCBjb3VudDsKKworICAgIC8qIE1ha2Ugc3VyZSB0aGF0IGd1ZXN0IGRvZXMgbm90IGV4ZWN1dGUg
bW9yZSB0aGFuIG1heF9vcHRlZV90aHJlYWRzICovCisgICAgY291bnQgPSBhdG9taWNfYWRkX3Vu
bGVzcygmY3R4LT5jYWxsX2NvdW50LCAxLCBtYXhfb3B0ZWVfdGhyZWFkcyk7CisgICAgaWYgKCBj
b3VudCA9PSBtYXhfb3B0ZWVfdGhyZWFkcyApCisgICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9T
UEMpOworCisgICAgY2FsbCA9IHh6YWxsb2Moc3RydWN0IG9wdGVlX3N0ZF9jYWxsKTsKKyAgICBp
ZiAoICFjYWxsICkKKyAgICB7CisgICAgICAgIGF0b21pY19kZWMoJmN0eC0+Y2FsbF9jb3VudCk7
CisgICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOworICAgIH0KKworICAgIGNhbGwtPm9w
dGVlX3RocmVhZF9pZCA9IC0xOworICAgIGNhbGwtPmluX2ZsaWdodCA9IHRydWU7CisKKyAgICBz
cGluX2xvY2soJmN0eC0+bG9jayk7CisgICAgbGlzdF9hZGRfdGFpbCgmY2FsbC0+bGlzdCwgJmN0
eC0+Y2FsbF9saXN0KTsKKyAgICBzcGluX3VubG9jaygmY3R4LT5sb2NrKTsKKworICAgIHJldHVy
biBjYWxsOworfQorCitzdGF0aWMgdm9pZCBmcmVlX3N0ZF9jYWxsKHN0cnVjdCBvcHRlZV9kb21h
aW4gKmN0eCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG9wdGVlX3N0ZF9jYWxs
ICpjYWxsKQoreworICAgIGF0b21pY19kZWMoJmN0eC0+Y2FsbF9jb3VudCk7CisKKyAgICBzcGlu
X2xvY2soJmN0eC0+bG9jayk7CisgICAgbGlzdF9kZWwoJmNhbGwtPmxpc3QpOworICAgIHNwaW5f
dW5sb2NrKCZjdHgtPmxvY2spOworCisgICAgQVNTRVJUKCFjYWxsLT5pbl9mbGlnaHQpOworICAg
IEFTU0VSVCghY2FsbC0+eGVuX2FyZyk7CisKKyAgICBpZiAoIGNhbGwtPnhlbl9hcmdfcGcgKQor
ICAgICAgICBmcmVlX2RvbWhlYXBfcGFnZShjYWxsLT54ZW5fYXJnX3BnKTsKKworICAgIHhmcmVl
KGNhbGwpOworfQorCitzdGF0aWMgdm9pZCBtYXBfeGVuX2FyZyhzdHJ1Y3Qgb3B0ZWVfc3RkX2Nh
bGwgKmNhbGwpCit7CisgICAgQVNTRVJUKCFjYWxsLT54ZW5fYXJnKTsKKworICAgIGNhbGwtPnhl
bl9hcmcgPSBfX21hcF9kb21haW5fcGFnZShjYWxsLT54ZW5fYXJnX3BnKTsKK30KKworc3RhdGlj
IHZvaWQgdW5tYXBfeGVuX2FyZyhzdHJ1Y3Qgb3B0ZWVfc3RkX2NhbGwgKmNhbGwpCit7CisgICAg
aWYgKCAhY2FsbC0+eGVuX2FyZyApCisgICAgICAgIHJldHVybjsKKworICAgIHVubWFwX2RvbWFp
bl9wYWdlKGNhbGwtPnhlbl9hcmcpOworICAgIGNhbGwtPnhlbl9hcmcgPSBOVUxMOworfQorCitz
dGF0aWMgc3RydWN0IG9wdGVlX3N0ZF9jYWxsICpnZXRfc3RkX2NhbGwoc3RydWN0IG9wdGVlX2Rv
bWFpbiAqY3R4LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlu
dCB0aHJlYWRfaWQpCit7CisgICAgc3RydWN0IG9wdGVlX3N0ZF9jYWxsICpjYWxsOworCisgICAg
c3Bpbl9sb2NrKCZjdHgtPmxvY2spOworICAgIGxpc3RfZm9yX2VhY2hfZW50cnkoIGNhbGwsICZj
dHgtPmNhbGxfbGlzdCwgbGlzdCApCisgICAgeworICAgICAgICBpZiAoIGNhbGwtPm9wdGVlX3Ro
cmVhZF9pZCA9PSB0aHJlYWRfaWQgKQorICAgICAgICB7CisgICAgICAgICAgICBpZiAoIGNhbGwt
PmluX2ZsaWdodCApCisgICAgICAgICAgICB7CisgICAgICAgICAgICAgICAgZ2RwcmludGsoWEVO
TE9HX1dBUk5JTkcsCisgICAgICAgICAgICAgICAgICAgICAgICAgIkd1ZXN0IHRyaWVzIHRvIGV4
ZWN1dGUgY2FsbCB3aGljaCBpcyBhbHJlYWR5IGluIGZsaWdodC5cbiIpOworICAgICAgICAgICAg
ICAgIGdvdG8gb3V0OworICAgICAgICAgICAgfQorICAgICAgICAgICAgY2FsbC0+aW5fZmxpZ2h0
ID0gdHJ1ZTsKKyAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZjdHgtPmxvY2spOworICAgICAgICAg
ICAgbWFwX3hlbl9hcmcoY2FsbCk7CisKKyAgICAgICAgICAgIHJldHVybiBjYWxsOworICAgICAg
ICB9CisgICAgfQorCitvdXQ6CisgICAgc3Bpbl91bmxvY2soJmN0eC0+bG9jayk7CisKKyAgICBy
ZXR1cm4gTlVMTDsKK30KKworc3RhdGljIHZvaWQgcHV0X3N0ZF9jYWxsKHN0cnVjdCBvcHRlZV9k
b21haW4gKmN0eCwgc3RydWN0IG9wdGVlX3N0ZF9jYWxsICpjYWxsKQoreworICAgIEFTU0VSVChj
YWxsLT5pbl9mbGlnaHQpOworICAgIHVubWFwX3hlbl9hcmcoY2FsbCk7CisgICAgc3Bpbl9sb2Nr
KCZjdHgtPmxvY2spOworICAgIGNhbGwtPmluX2ZsaWdodCA9IGZhbHNlOworICAgIHNwaW5fdW5s
b2NrKCZjdHgtPmxvY2spOworfQorCiBzdGF0aWMgaW50IG9wdGVlX3JlbGlucXVpc2hfcmVzb3Vy
Y2VzKHN0cnVjdCBkb21haW4gKmQpCiB7CiAgICAgc3RydWN0IGFybV9zbWNjY19yZXMgcmVzcDsK
KyAgICBzdHJ1Y3Qgb3B0ZWVfc3RkX2NhbGwgKmNhbGwsICpjYWxsX3RtcDsKKyAgICBzdHJ1Y3Qg
b3B0ZWVfZG9tYWluICpjdHggPSBkLT5hcmNoLnRlZTsKIAotICAgIGlmICggIWQtPmFyY2gudGVl
ICkKKyAgICBpZiAoICFjdHggKQogICAgICAgICByZXR1cm4gMDsKIAorICAgIC8qCisgICAgICog
V2UgbmVlZCB0byBmcmVlIHVwIHRvIG1heF9vcHRlZV90aHJlYWRzIGNhbGxzLiBVc3VhbGx5LCB0
aGlzIGlzCisgICAgICogbm8gbW9yZSB0aGFuIDgtMTYgY2FsbHMuIEJ1dCBpdCBkZXBlbmRzIG9u
IE9QLVRFRSBjb25maWd1cmF0aW9uCisgICAgICogKENGR19OVU1fVEhSRUFEUyBvcHRpb24pLgor
ICAgICAqLworICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSggY2FsbCwgY2FsbF90bXAsICZj
dHgtPmNhbGxfbGlzdCwgbGlzdCApCisgICAgICAgIGZyZWVfc3RkX2NhbGwoY3R4LCBjYWxsKTsK
KworICAgIGlmICggaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKSApCisgICAgICAgIHJldHVybiAt
RVJFU1RBUlQ7CisKICAgICAvKgogICAgICAqIEluZm9ybSBPUC1URUUgdGhhdCBkb21haW4gaXMg
c2h1dHRpbmcgZG93bi4gVGhpcyBpcwogICAgICAqIGFsc28gYSBmYXN0IFNNQyBjYWxsLCBsaWtl
IE9QVEVFX1NNQ19WTV9DUkVBVEVELCBzbwpAQCAtMTIzLDExICszMjYsMzA4IEBAIHN0YXRpYyBp
bnQgb3B0ZWVfcmVsaW5xdWlzaF9yZXNvdXJjZXMoc3RydWN0IGRvbWFpbiAqZCkKICAgICBhcm1f
c21jY2Nfc21jKE9QVEVFX1NNQ19WTV9ERVNUUk9ZRUQsIE9QVEVFX0NMSUVOVF9JRChkKSwgMCwg
MCwgMCwgMCwgMCwgMCwKICAgICAgICAgICAgICAgICAgICZyZXNwKTsKIAorICAgIEFTU0VSVCgh
c3Bpbl9pc19sb2NrZWQoJmN0eC0+bG9jaykpOworICAgIEFTU0VSVCghYXRvbWljX3JlYWQoJmN0
eC0+Y2FsbF9jb3VudCkpOworCiAgICAgWEZSRUUoZC0+YXJjaC50ZWUpOwogCiAgICAgcmV0dXJu
IDA7CiB9CiAKKy8qCisgKiBDb3B5IGNvbW1hbmQgYnVmZmVyIGludG8gZG9taGVhcCBtZW1vcnkg
dG86CisgKiAxKSBIaWRlIHRyYW5zbGF0ZWQgYWRkcmVzc2VzIGZyb20gZ3Vlc3QKKyAqIDIpIE1h
a2Ugc3VyZSB0aGF0IGd1ZXN0IHdvdWxkbid0IGNoYW5nZSBkYXRhIGluIGNvbW1hbmQgYnVmZmVy
IGR1cmluZyBjYWxsCisgKi8KK3N0YXRpYyBib29sIGNvcHlfc3RkX3JlcXVlc3Qoc3RydWN0IGNw
dV91c2VyX3JlZ3MgKnJlZ3MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBv
cHRlZV9zdGRfY2FsbCAqY2FsbCkKK3sKKyAgICBjYWxsLT5ndWVzdF9hcmdfaXBhID0gcmVncGFp
cl90b191aW50NjQoZ2V0X3VzZXJfcmVnKHJlZ3MsIDEpLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnZXRfdXNlcl9yZWcocmVncywgMikpOworCisgICAgLyoK
KyAgICAgKiBDb21tYW5kIGJ1ZmZlciBzaG91bGQgc3RhcnQgYXQgcGFnZSBib3VuZGFyeS4KKyAg
ICAgKiBUaGlzIGlzIE9QLVRFRSBBQkkgcmVxdWlyZW1lbnQuCisgICAgICovCisgICAgaWYgKCBj
YWxsLT5ndWVzdF9hcmdfaXBhICYgKE9QVEVFX01TR19OT05DT05USUdfUEFHRV9TSVpFIC0gMSkg
KQorICAgIHsKKyAgICAgICAgc2V0X3VzZXJfcmVnKHJlZ3MsIDAsIE9QVEVFX1NNQ19SRVRVUk5f
RUJBREFERFIpOworICAgICAgICByZXR1cm4gZmFsc2U7CisgICAgfQorCisgICAgQlVJTERfQlVH
X09OKE9QVEVFX01TR19OT05DT05USUdfUEFHRV9TSVpFID4gUEFHRV9TSVpFKTsKKworICAgIGNh
bGwtPnhlbl9hcmdfcGcgPSBhbGxvY19kb21oZWFwX3BhZ2UoY3VycmVudC0+ZG9tYWluLCAwKTsK
KyAgICBpZiAoICFjYWxsLT54ZW5fYXJnX3BnICkKKyAgICB7CisgICAgICAgIHNldF91c2VyX3Jl
ZyhyZWdzLCAwLCBPUFRFRV9TTUNfUkVUVVJOX0VOT01FTSk7CisgICAgICAgIHJldHVybiBmYWxz
ZTsKKyAgICB9CisKKyAgICBtYXBfeGVuX2FyZyhjYWxsKTsKKworICAgIGlmICggYWNjZXNzX2d1
ZXN0X21lbW9yeV9ieV9pcGEoY3VycmVudC0+ZG9tYWluLCBjYWxsLT5ndWVzdF9hcmdfaXBhLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2FsbC0+eGVuX2FyZywKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE9QVEVFX01TR19OT05DT05USUdfUEFHRV9T
SVpFLCBmYWxzZSkgKQorICAgIHsKKyAgICAgICAgc2V0X3VzZXJfcmVnKHJlZ3MsIDAsIE9QVEVF
X1NNQ19SRVRVUk5fRUJBREFERFIpOworICAgICAgICByZXR1cm4gZmFsc2U7CisgICAgfQorCisg
ICAgcmV0dXJuIHRydWU7Cit9CisKKy8qCisgKiBDb3B5IHJlc3VsdCBvZiBjb21wbGV0ZWQgcmVx
dWVzdCBiYWNrIHRvIGd1ZXN0J3MgYnVmZmVyLgorICogV2UgYXJlIGNvcHlpbmcgb25seSB2YWx1
ZXMgdGhhdCBzdWJqZWN0ZWQgdG8gY2hhbmdlIHRvIG1pbmltaXplCisgKiBwb3NzaWJsZSBpbmZv
cm1hdGlvbiBsZWFrLgorICoKKyAqIEJlY2F1c2UgdGhlcmUgY2FuIGJlIG11bHRpcGxlIFJQQ3Mg
ZHVyaW5nIHN0YW5kYXJkIGNhbGwsIGFuZCBndWVzdAorICogaXMgbm90IG9ibGlnYXRlZCB0byBy
ZXR1cm4gZnJvbSBSUEMgaW1tZWRpYXRlbHksIHRoZXJlIGNhbiBiZQorICogYXJiaXRyYXJ5IHRp
bWUgc3BhbiBiZXR3ZWVuIGNhbGxpbmcgY29weV9zdGRfcmVxdWVzdCgpIGFuZAorICogY29weV9z
dGRfcmVxdWVzdCgpLiBTbyB3ZSBuZWVkIHRvIHZhbGlkYXRlIGd1ZXN0J3MgY29tbWFuZCBidWZm
ZXIKKyAqIGFnYWluLgorICovCitzdGF0aWMgdm9pZCBjb3B5X3N0ZF9yZXF1ZXN0X2JhY2soc3Ry
dWN0IG9wdGVlX2RvbWFpbiAqY3R4LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBvcHRlZV9zdGRfY2FsbCAqY2FsbCkKK3sKKyAgICBzdHJ1Y3Qgb3B0ZWVf
bXNnX2FyZyAqZ3Vlc3RfYXJnOworICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7CisgICAgdW5z
aWduZWQgaW50IGk7CisgICAgdWludDMyX3QgYXR0cjsKKworICAgIHBhZ2UgPSBnZXRfZG9tYWlu
X3JhbV9wYWdlKGdhZGRyX3RvX2dmbihjYWxsLT5ndWVzdF9hcmdfaXBhKSk7CisgICAgaWYgKCAh
cGFnZSApCisgICAgeworICAgICAgICAvKgorICAgICAgICAgKiBHdWVzdCBkaWQgc29tZXRoaW5n
IHRvIG93biBjb21tYW5kIGJ1ZmZlciBkdXJpbmcgdGhlIGNhbGwuCisgICAgICAgICAqIE5vdyB3
ZSBldmVuIGNhbid0IHdyaXRlIGVycm9yIGNvZGUgdG8gdGhlIGNvbW1hbmQKKyAgICAgICAgICog
YnVmZmVyLiBMZXQncyB0cnkgdG8gcmV0dXJuIGdlbmVyaWMgZXJyb3IgdmlhCisgICAgICAgICAq
IHJlZ2lzdGVyLiBQcm9ibGVtIGlzIHRoYXQgT1AtVEVFIGRvZXMgbm90IGtub3cgdGhhdCBndWVz
dAorICAgICAgICAgKiBkaWRuJ3QgcmVjZWl2ZWQgdmFsaWQgcmVzcG9uc2UuIEJ1dCBhdCBsZWFz
dCBndWVzdCB3aWxsCisgICAgICAgICAqIGtub3cgdGhhdCBzb21ldGhpbmcgYmFkIGhhcHBlbmVk
LgorICAgICAgICAgKi8KKyAgICAgICAgc2V0X3VzZXJfcmVnKHJlZ3MsIDAsIE9QVEVFX1NNQ19S
RVRVUk5fRUJBREFERFIpOworCisgICAgICAgIHJldHVybjsKKyAgICB9CisKKyAgICBndWVzdF9h
cmcgPSBfX21hcF9kb21haW5fcGFnZShwYWdlKTsKKworICAgIGd1ZXN0X2FyZy0+cmV0ID0gY2Fs
bC0+eGVuX2FyZy0+cmV0OworICAgIGd1ZXN0X2FyZy0+cmV0X29yaWdpbiA9IGNhbGwtPnhlbl9h
cmctPnJldF9vcmlnaW47CisgICAgZ3Vlc3RfYXJnLT5zZXNzaW9uID0gY2FsbC0+eGVuX2FyZy0+
c2Vzc2lvbjsKKworICAgIGZvciAoIGkgPSAwOyBpIDwgY2FsbC0+eGVuX2FyZy0+bnVtX3BhcmFt
czsgaSsrICkKKyAgICB7CisgICAgICAgIGF0dHIgPSBjYWxsLT54ZW5fYXJnLT5wYXJhbXNbaV0u
YXR0cjsKKworICAgICAgICBzd2l0Y2ggKCBhdHRyICYgT1BURUVfTVNHX0FUVFJfVFlQRV9NQVNL
ICkKKyAgICAgICAgeworICAgICAgICBjYXNlIE9QVEVFX01TR19BVFRSX1RZUEVfVE1FTV9PVVRQ
VVQ6CisgICAgICAgIGNhc2UgT1BURUVfTVNHX0FUVFJfVFlQRV9UTUVNX0lOT1VUOgorICAgICAg
ICAgICAgZ3Vlc3RfYXJnLT5wYXJhbXNbaV0udS50bWVtLnNpemUgPQorICAgICAgICAgICAgICAg
IGNhbGwtPnhlbl9hcmctPnBhcmFtc1tpXS51LnRtZW0uc2l6ZTsKKyAgICAgICAgICAgIGNvbnRp
bnVlOworICAgICAgICBjYXNlIE9QVEVFX01TR19BVFRSX1RZUEVfUk1FTV9PVVRQVVQ6CisgICAg
ICAgIGNhc2UgT1BURUVfTVNHX0FUVFJfVFlQRV9STUVNX0lOT1VUOgorICAgICAgICAgICAgZ3Vl
c3RfYXJnLT5wYXJhbXNbaV0udS5ybWVtLnNpemUgPQorICAgICAgICAgICAgICAgIGNhbGwtPnhl
bl9hcmctPnBhcmFtc1tpXS51LnJtZW0uc2l6ZTsKKyAgICAgICAgICAgIGNvbnRpbnVlOworICAg
ICAgICBjYXNlIE9QVEVFX01TR19BVFRSX1RZUEVfVkFMVUVfT1VUUFVUOgorICAgICAgICBjYXNl
IE9QVEVFX01TR19BVFRSX1RZUEVfVkFMVUVfSU5PVVQ6CisgICAgICAgICAgICBndWVzdF9hcmct
PnBhcmFtc1tpXS51LnZhbHVlLmEgPQorICAgICAgICAgICAgICAgIGNhbGwtPnhlbl9hcmctPnBh
cmFtc1tpXS51LnZhbHVlLmE7CisgICAgICAgICAgICBndWVzdF9hcmctPnBhcmFtc1tpXS51LnZh
bHVlLmIgPQorICAgICAgICAgICAgICAgIGNhbGwtPnhlbl9hcmctPnBhcmFtc1tpXS51LnZhbHVl
LmI7CisgICAgICAgICAgICBndWVzdF9hcmctPnBhcmFtc1tpXS51LnZhbHVlLmMgPQorICAgICAg
ICAgICAgICAgIGNhbGwtPnhlbl9hcmctPnBhcmFtc1tpXS51LnZhbHVlLmM7CisgICAgICAgICAg
ICBjb250aW51ZTsKKyAgICAgICAgY2FzZSBPUFRFRV9NU0dfQVRUUl9UWVBFX05PTkU6CisgICAg
ICAgIGNhc2UgT1BURUVfTVNHX0FUVFJfVFlQRV9STUVNX0lOUFVUOgorICAgICAgICBjYXNlIE9Q
VEVFX01TR19BVFRSX1RZUEVfVE1FTV9JTlBVVDoKKyAgICAgICAgICAgIGNvbnRpbnVlOworICAg
ICAgICB9CisgICAgfQorCisgICAgdW5tYXBfZG9tYWluX3BhZ2UoZ3Vlc3RfYXJnKTsKKyAgICBw
dXRfcGFnZShwYWdlKTsKK30KKworLyogSGFuZGxlIFJQQyByZXR1cm4gZnJvbSBPUC1URUUgKi8K
K3N0YXRpYyB2b2lkIGhhbmRsZV9ycGNfcmV0dXJuKHN0cnVjdCBhcm1fc21jY2NfcmVzICpyZXMs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVn
cywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBvcHRlZV9zdGRfY2FsbCAq
Y2FsbCkKK3sKKyAgICBjYWxsLT5ycGNfb3AgPSBPUFRFRV9TTUNfUkVUVVJOX0dFVF9SUENfRlVO
QyhyZXMtPmEwKTsKKyAgICBjYWxsLT5ycGNfcGFyYW1zWzBdID0gcmVzLT5hMTsKKyAgICBjYWxs
LT5ycGNfcGFyYW1zWzFdID0gcmVzLT5hMjsKKyAgICBjYWxsLT5vcHRlZV90aHJlYWRfaWQgPSBy
ZXMtPmEzOworCisgICAgc2V0X3VzZXJfcmVnKHJlZ3MsIDAsIHJlcy0+YTApOworICAgIHNldF91
c2VyX3JlZyhyZWdzLCAxLCByZXMtPmExKTsKKyAgICBzZXRfdXNlcl9yZWcocmVncywgMiwgcmVz
LT5hMik7CisgICAgc2V0X3VzZXJfcmVnKHJlZ3MsIDMsIHJlcy0+YTMpOworfQorCisvKgorICog
KFJlKXN0YXJ0IHN0YW5kYXJkIGNhbGwuIFRoaXMgZnVuY3Rpb24gd2lsbCBiZSBjYWxsZWQgaW4g
dHdvIGNhc2VzOgorICogMS4gR3Vlc3QgaW5pdGlhdGVzIG5ldyBzdGFuZGFyZCBjYWxsCisgKiAy
LiBHdWVzdCBmaW5pc2hlZCBSUEMgaGFuZGxpbmcgYW5kIGFza3MgT1AtVEVFIHRvIHJlc3VtZSB0
aGUgY2FsbAorICoKKyAqIEluIGFueSBjYXNlIE9QLVRFRSBjYW4gZWl0aGVyIGNvbXBsZXRlIGNh
bGwgb3IgaXNzdWUgYW5vdGhlciBSUEMuCisgKiBJZiB0aGlzIGlzIFJQQyAtIHdlIG5lZWQgdG8g
c3RvcmUgY2FsbCBjb250ZXh0IGFuZCByZXR1cm4gYmFjayB0byBndWVzdC4KKyAqIElmIGNhbGwg
aXMgY29tcGxldGUgLSB3ZSBuZWVkIHRvIHJldHVybiByZXN1bHRzIHdpdGggY29weV9zdGRfcmVx
dWVzdF9iYWNrKCkKKyAqIGFuZCB0aGVuIHdlIHdpbGwgZGVzdHJveSB0aGUgY2FsbCBjb250ZXh0
IGFzIGl0IGlzIG5vdCBuZWVkZWQgYW55bW9yZS4KKyAqLworc3RhdGljIHZvaWQgZG9fY2FsbF93
aXRoX2FyZyhzdHJ1Y3Qgb3B0ZWVfZG9tYWluICpjdHgsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBvcHRlZV9zdGRfY2FsbCAqY2FsbCwKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlZ2lzdGVyX3QgYTAsIHJlZ2lzdGVyX3QgYTEsIHJlZ2lzdGVyX3QgYTIsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ2lzdGVyX3QgYTMsIHJlZ2lzdGVyX3QgYTQs
IHJlZ2lzdGVyX3QgYTUpCit7CisgICAgc3RydWN0IGFybV9zbWNjY19yZXMgcmVzOworCisgICAg
YXJtX3NtY2NjX3NtYyhhMCwgYTEsIGEyLCBhMywgYTQsIGE1LCAwLCBPUFRFRV9DTElFTlRfSUQo
Y3VycmVudC0+ZG9tYWluKSwKKyAgICAgICAgICAgICAgICAgICZyZXMpOworCisgICAgaWYgKCBP
UFRFRV9TTUNfUkVUVVJOX0lTX1JQQyhyZXMuYTApICkKKyAgICB7CisgICAgICAgIGhhbmRsZV9y
cGNfcmV0dXJuKCZyZXMsIHJlZ3MsIGNhbGwpOworICAgICAgICBwdXRfc3RkX2NhbGwoY3R4LCBj
YWxsKTsKKworICAgICAgICByZXR1cm47CisgICAgfQorCisgICAgY29weV9zdGRfcmVxdWVzdF9i
YWNrKGN0eCwgcmVncywgY2FsbCk7CisgICAgc2V0X3VzZXJfcmVnKHJlZ3MsIDAsIHJlcy5hMCk7
CisKKyAgICBwdXRfc3RkX2NhbGwoY3R4LCBjYWxsKTsKKyAgICBmcmVlX3N0ZF9jYWxsKGN0eCwg
Y2FsbCk7Cit9CisKKy8qCisgKiBTdGFuZGFyZCBjYWxsIGhhbmRsaW5nLiBUaGlzIGlzIHRoZSBt
YWluIHR5cGUgb2YgdGhlIGNhbGwgd2hpY2gKKyAqIG1ha2VzIE9QLVRFRSB1c2VmdWwuIE1vc3Qg
b2YgdGhlIG90aGVyIGNhbGxzIHR5cGUgYXJlIHV0aWxpdHkKKyAqIGNhbGxzLCB3aGlsZSBzdGFu
ZGFyZCBjYWxscyBhcmUgbmVlZGVkIHRvIGludGVyYWN0IHdpdGggVHJ1c3RlZAorICogQXBwbGlj
YXRpb25zIHdoaWNoIGFyZSBydW5uaW5nIGluc2lkZSB0aGUgT1AtVEVFLgorICoKKyAqIEFsbCBh
cmd1bWVudHMgZm9yIHRoaXMgdHlwZSBvZiBjYWxsIGFyZSBwYXNzZWQgaW4gdGhlIGNvbW1hbmQK
KyAqIGJ1ZmZlciBpbiB0aGUgZ3Vlc3QgbWVtb3J5LiBXZSB3aWxsIGNvcHkgdGhpcyBidWZmZXIg
aW50bworICogb3duIHNoYWRvdyBidWZmZXIgYW5kIHByb3ZpZGUgdGhlIGNvcHkgdG8gT1AtVEVF
LgorICoKKyAqIFRoaXMgY2FsbCBpcyBwcmVlbXB0aWJsZS4gT1AtVEVFIHdpbGwgcmV0dXJuIGZy
b20gdGhlIGNhbGwgaWYgdGhlcmUKKyAqIGlzIGFuIGludGVycnVwdCByZXF1ZXN0IHBlbmRpbmcu
IEFsc28sIE9QLVRFRSB3aWxsIGludGVycnVwdCB0aGUKKyAqIGNhbGwgaWYgaXQgbmVlZHMgc29t
ZSBzZXJ2aWNlIGZyb20gZ3Vlc3QuIEluIGJvdGggY2FzZXMgaXQgd2lsbAorICogaXNzdWUgUlBD
LCB3aGljaCBpcyBwcm9jZXNzZWQgYnkgaGFuZGxlX3JwY19yZXR1cm4oKSBmdW5jdGlvbi4KKyAq
Lworc3RhdGljIHZvaWQgaGFuZGxlX3N0ZF9jYWxsKHN0cnVjdCBvcHRlZV9kb21haW4gKmN0eCwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykK
K3sKKyAgICByZWdpc3Rlcl90IGExLCBhMjsKKyAgICBwYWRkcl90IHhlbl9hZGRyOworICAgIHNp
emVfdCBhcmdfc2l6ZTsKKyAgICBzdHJ1Y3Qgb3B0ZWVfc3RkX2NhbGwgKmNhbGwgPSBhbGxvY2F0
ZV9zdGRfY2FsbChjdHgpOworCisgICAgaWYgKCBJU19FUlIoY2FsbCkgKQorICAgIHsKKyAgICAg
ICAgaWYgKCBQVFJfRVJSKGNhbGwpID09IC1FTk9NRU0gKQorICAgICAgICAgICAgc2V0X3VzZXJf
cmVnKHJlZ3MsIDAsIE9QVEVFX1NNQ19SRVRVUk5fRU5PTUVNKTsKKyAgICAgICAgZWxzZQorICAg
ICAgICAgICAgc2V0X3VzZXJfcmVnKHJlZ3MsIDAsIE9QVEVFX1NNQ19SRVRVUk5fRVRIUkVBRF9M
SU1JVCk7CisKKyAgICAgICAgcmV0dXJuOworICAgIH0KKworICAgIGlmICggIWNvcHlfc3RkX3Jl
cXVlc3QocmVncywgY2FsbCkgKQorICAgICAgICBnb3RvIGVycjsKKworICAgIGFyZ19zaXplID0g
T1BURUVfTVNHX0dFVF9BUkdfU0laRShjYWxsLT54ZW5fYXJnLT5udW1fcGFyYW1zKTsKKyAgICBp
ZiAoIGFyZ19zaXplID4gT1BURUVfTVNHX05PTkNPTlRJR19QQUdFX1NJWkUgKQorICAgIHsKKyAg
ICAgICAgY2FsbC0+eGVuX2FyZy0+cmV0ID0gVEVFQ19FUlJPUl9CQURfUEFSQU1FVEVSUzsKKyAg
ICAgICAgY2FsbC0+eGVuX2FyZy0+cmV0X29yaWdpbiA9IFRFRUNfT1JJR0lOX0NPTU1TOworICAg
ICAgICAvKiBNYWtlIHN1cmUgdGhhdCBjb3B5X3N0ZF9yZXF1ZXN0X2JhY2soKSB3aWxsIHN0YXkg
d2l0aGluIHRoZSBidWZmZXIgKi8KKyAgICAgICAgY2FsbC0+eGVuX2FyZy0+bnVtX3BhcmFtcyA9
IDA7CisKKyAgICAgICAgY29weV9zdGRfcmVxdWVzdF9iYWNrKGN0eCwgcmVncywgY2FsbCk7CisK
KyAgICAgICAgZ290byBlcnI7CisgICAgfQorCisgICAgc3dpdGNoICggY2FsbC0+eGVuX2FyZy0+
Y21kICkKKyAgICB7CisgICAgY2FzZSBPUFRFRV9NU0dfQ01EX09QRU5fU0VTU0lPTjoKKyAgICBj
YXNlIE9QVEVFX01TR19DTURfQ0xPU0VfU0VTU0lPTjoKKyAgICBjYXNlIE9QVEVFX01TR19DTURf
SU5WT0tFX0NPTU1BTkQ6CisgICAgY2FzZSBPUFRFRV9NU0dfQ01EX0NBTkNFTDoKKyAgICBjYXNl
IE9QVEVFX01TR19DTURfUkVHSVNURVJfU0hNOgorICAgIGNhc2UgT1BURUVfTVNHX0NNRF9VTlJF
R0lTVEVSX1NITToKKyAgICAgICAgeGVuX2FkZHIgPSBwYWdlX3RvX21hZGRyKGNhbGwtPnhlbl9h
cmdfcGcpOworICAgICAgICB1aW50NjRfdG9fcmVncGFpcigmYTEsICZhMiwgeGVuX2FkZHIpOwor
CisgICAgICAgIGRvX2NhbGxfd2l0aF9hcmcoY3R4LCBjYWxsLCByZWdzLCBPUFRFRV9TTUNfQ0FM
TF9XSVRIX0FSRywgYTEsIGEyLAorICAgICAgICAgICAgICAgICAgICAgICAgIE9QVEVFX1NNQ19T
SE1fQ0FDSEVELCAwLCAwKTsKKyAgICAgICAgcmV0dXJuOworICAgIGRlZmF1bHQ6CisgICAgICAg
IHNldF91c2VyX3JlZyhyZWdzLCAwLCBPUFRFRV9TTUNfUkVUVVJOX0VCQURDTUQpOworICAgICAg
ICBicmVhazsKKyAgICB9CisKK2VycjoKKyAgICBwdXRfc3RkX2NhbGwoY3R4LCBjYWxsKTsKKyAg
ICBmcmVlX3N0ZF9jYWxsKGN0eCwgY2FsbCk7CisKKyAgICByZXR1cm47Cit9CisKKy8qCisgKiBU
aGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCB3aGVuIGd1ZXN0IGlzIGZpbmlzaGVkIHByb2Nlc3Npbmcg
UlBDCisgKiByZXF1ZXN0IGZyb20gT1AtVEVFIGFuZCB3aXNoZWQgdG8gcmVzdW1lIHRoZSBpbnRl
cnJ1cHRlZCBzdGFuZGFyZAorICogY2FsbC4KKyAqLworc3RhdGljIHZvaWQgaGFuZGxlX3JwYyhz
dHJ1Y3Qgb3B0ZWVfZG9tYWluICpjdHgsIHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQorewor
ICAgIHN0cnVjdCBvcHRlZV9zdGRfY2FsbCAqY2FsbDsKKyAgICBpbnQgb3B0ZWVfdGhyZWFkX2lk
ID0gZ2V0X3VzZXJfcmVnKHJlZ3MsIDMpOworCisgICAgY2FsbCA9IGdldF9zdGRfY2FsbChjdHgs
IG9wdGVlX3RocmVhZF9pZCk7CisKKyAgICBpZiAoICFjYWxsICkKKyAgICB7CisgICAgICAgIHNl
dF91c2VyX3JlZyhyZWdzLCAwLCBPUFRFRV9TTUNfUkVUVVJOX0VSRVNVTUUpOworICAgICAgICBy
ZXR1cm47CisgICAgfQorCisgICAgLyoKKyAgICAgKiBUaGlzIGlzIHRvIHByZXZlbnQgcmFjZSBi
ZXR3ZWVuIG5ldyBjYWxsIHdpdGggdGhlIHNhbWUgdGhyZWFkIGlkLgorICAgICAqIE9QLVRFRSBj
YW4gcmV1c2UgdGhyZWFkIGlkIHJpZ2h0IGFmdGVyIGl0IGZpbmlzaGVkIGhhbmRsaW5nIHRoZSBj
YWxsLAorICAgICAqIGJlZm9yZSBYRU4gaGFkIGNoYW5jZSB0byBmcmVlIG9sZCBjYWxsIGNvbnRl
eHQuCisgICAgICovCisgICAgY2FsbC0+b3B0ZWVfdGhyZWFkX2lkID0gLTE7CisKKyAgICBzd2l0
Y2ggKCBjYWxsLT5ycGNfb3AgKQorICAgIHsKKyAgICBjYXNlIE9QVEVFX1NNQ19SUENfRlVOQ19B
TExPQzoKKyAgICAgICAgLyogVE9ETzogQWRkIGhhbmRsaW5nICovCisgICAgICAgIGJyZWFrOwor
ICAgIGNhc2UgT1BURUVfU01DX1JQQ19GVU5DX0ZSRUU6CisgICAgICAgIC8qIFRPRE86IEFkZCBo
YW5kbGluZyAqLworICAgICAgICBicmVhazsKKyAgICBjYXNlIE9QVEVFX1NNQ19SUENfRlVOQ19G
T1JFSUdOX0lOVFI6CisgICAgICAgIGJyZWFrOworICAgIGNhc2UgT1BURUVfU01DX1JQQ19GVU5D
X0NNRDoKKyAgICAgICAgLyogVE9ETzogQWRkIGhhbmRsaW5nICovCisgICAgICAgIGJyZWFrOwor
ICAgIH0KKworICAgIGRvX2NhbGxfd2l0aF9hcmcoY3R4LCBjYWxsLCByZWdzLCBPUFRFRV9TTUNf
Q0FMTF9SRVRVUk5fRlJPTV9SUEMsCisgICAgICAgICAgICAgICAgICAgICBjYWxsLT5ycGNfcGFy
YW1zWzBdLCBjYWxsLT5ycGNfcGFyYW1zWzFdLAorICAgICAgICAgICAgICAgICAgICAgb3B0ZWVf
dGhyZWFkX2lkLCAwLCAwKTsKKyAgICByZXR1cm47Cit9CisKIHN0YXRpYyB2b2lkIGhhbmRsZV9l
eGNoYW5nZV9jYXBhYmlsaXRpZXMoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiB7CiAgICAg
c3RydWN0IGFybV9zbWNjY19yZXMgcmVzcDsKQEAgLTE2Niw4ICs2NjYsOSBAQCBzdGF0aWMgdm9p
ZCBoYW5kbGVfZXhjaGFuZ2VfY2FwYWJpbGl0aWVzKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdz
KQogc3RhdGljIGJvb2wgb3B0ZWVfaGFuZGxlX2NhbGwoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJl
Z3MpCiB7CiAgICAgc3RydWN0IGFybV9zbWNjY19yZXMgcmVzcDsKKyAgICBzdHJ1Y3Qgb3B0ZWVf
ZG9tYWluICpjdHggPSBjdXJyZW50LT5kb21haW4tPmFyY2gudGVlOwogCi0gICAgaWYgKCAhY3Vy
cmVudC0+ZG9tYWluLT5hcmNoLnRlZSApCisgICAgaWYgKCAhY3R4ICkKICAgICAgICAgcmV0dXJu
IGZhbHNlOwogCiAgICAgc3dpdGNoICggZ2V0X3VzZXJfcmVnKHJlZ3MsIDApICkKQEAgLTIzNCw4
ICs3MzUsMTEgQEAgc3RhdGljIGJvb2wgb3B0ZWVfaGFuZGxlX2NhbGwoc3RydWN0IGNwdV91c2Vy
X3JlZ3MgKnJlZ3MpCiAgICAgICAgIHJldHVybiB0cnVlOwogCiAgICAgY2FzZSBPUFRFRV9TTUNf
Q0FMTF9XSVRIX0FSRzoKKyAgICAgICAgaGFuZGxlX3N0ZF9jYWxsKGN0eCwgcmVncyk7CisgICAg
ICAgIHJldHVybiB0cnVlOworCiAgICAgY2FzZSBPUFRFRV9TTUNfQ0FMTF9SRVRVUk5fRlJPTV9S
UEM6Ci0gICAgICAgIHNldF91c2VyX3JlZyhyZWdzLCAwLCBPUFRFRV9TTUNfUkVUVVJOX0VOT1RB
VkFJTCk7CisgICAgICAgIGhhbmRsZV9ycGMoY3R4LCByZWdzKTsKICAgICAgICAgcmV0dXJuIHRy
dWU7CiAKICAgICBkZWZhdWx0OgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
