Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDEB636DC
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 15:24:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkq4j-0002Iz-1N; Tue, 09 Jul 2019 13:22:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ExLo=VG=starlab.io=will.abele@srs-us1.protection.inumbo.net>)
 id 1hkq4i-0002Iu-7N
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 13:22:28 +0000
X-Inumbo-ID: 97e62bb8-a24c-11e9-86cf-dbae6dc6fa96
Received: from GCC01-DM2-obe.outbound.protection.outlook.com (unknown
 [40.107.84.115]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97e62bb8-a24c-11e9-86cf-dbae6dc6fa96;
 Tue, 09 Jul 2019 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yx4wNshjT3qkHBehHQcIDLnOJ1GECceMcL1gR9TcUSE=;
 b=lU6EgoqVmp8HedL41Nr3YTLlJXtUz+4ERbqqVP+707HrZGuIfkG+HUT9ETO6hXNdJzULUOYYC0ZeQWZ+d0pzMeiu0RgT2uZYrNov6Au29urHdcVrhl5rwR3u3X3hAVZClpcxriO8KM+wAZdWIu2+DZS3DjUGkgH72HwqTyAe3+c=
Received: from BL0PR0901MB3203.namprd09.prod.outlook.com (20.177.243.158) by
 BL0PR0901MB4434.namprd09.prod.outlook.com (52.135.44.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 13:22:23 +0000
Received: from BL0PR0901MB3203.namprd09.prod.outlook.com
 ([fe80::317f:a059:9fd3:dcf]) by BL0PR0901MB3203.namprd09.prod.outlook.com
 ([fe80::317f:a059:9fd3:dcf%5]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 13:22:23 +0000
From: Will Abele <will.abele@starlab.io>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] xen/arm: use correct device tree root node name
Thread-Index: AQHVNllYmcbZdJKG8kKVhIvh9//pFg==
Date: Tue, 9 Jul 2019 13:22:23 +0000
Message-ID: <20190709132145.9060-1-will.abele@starlab.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN7PR06CA0039.namprd06.prod.outlook.com
 (2603:10b6:408:34::16) To BL0PR0901MB3203.namprd09.prod.outlook.com
 (2603:10b6:208:8e::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=will.abele@starlab.io; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [207.229.155.139]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b3691a0-6dfc-4aeb-5997-08d704707a78
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BL0PR0901MB4434; 
x-ms-traffictypediagnostic: BL0PR0901MB4434:
x-microsoft-antispam-prvs: <BL0PR0901MB4434A466F468D915F198643FF6F10@BL0PR0901MB4434.namprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(346002)(136003)(376002)(39830400003)(189003)(199004)(186003)(256004)(73956011)(102836004)(6506007)(66946007)(5640700003)(2906002)(7736002)(305945005)(386003)(54906003)(36756003)(486006)(2351001)(8936002)(508600001)(66446008)(64756008)(6436002)(5660300002)(26005)(66476007)(52116002)(316002)(53936002)(66556008)(3846002)(81156014)(74482002)(1076003)(81166006)(6916009)(4326008)(2616005)(476003)(6486002)(2501003)(25786009)(99286004)(44832011)(8676002)(14454004)(66066001)(68736007)(86362001)(71190400001)(71200400001)(6116002)(6512007)(50226002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR0901MB4434;
 H:BL0PR0901MB3203.namprd09.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: starlab.io does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HJ7EoGkHRDJT14YqGpN+9Mz1vQYASUpO9V5xe+WFo7CFO0H79goDVd+4cyNCgcvLCObgvIw9PpYdpBJtyr3t1TkHX2Qkww6UClqsVAITRXrFuGDsMnVDmSuD7yaJMCqvIr6k16KsjqSuDD5R7tqatOldviADQfZtmHIHindzj+btf4JqsSkWe4tvmeeyF2J5GByOIjn+BYS3P/i15RWXDQBQ4lKbf5zr5uzC9wo5n1IvzWqJ8ihSAgXPbTh3CR3N1vNrMJLg10ZMfNg+3qObrByqRCLWw3VbJ6ItoJZLG1JCQ/FRah3feGJ8jN4eASrt9B16mZQYNULmQuYrRZ3O/CSrDfBZzRkS9avMcIJMEXHvb+dH5YidmFVcEyXIQzC0leKMyyT8ffnLu7E5I+Ht9sfbM+B2RSzTLWxiq/9fZH4=
MIME-Version: 1.0
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3691a0-6dfc-4aeb-5997-08d704707a78
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 13:22:23.4879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: will.abele@starlab.io
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR0901MB4434
Subject: [Xen-devel] [PATCH v2] xen/arm: use correct device tree root node
 name
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Will Abele <will.abele@starlab.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2lsbCBBYmVsZSA8d2lsbC5hYmVsZUBzdGFybGFiLmlvPgoKVGhlIHJvb3Qgbm9kZSBv
ZiBhIGRldmljZSB0cmVlIHNob3VsZCBub3QgaGF2ZSBhIG5vZGUgbmFtZS4gVGhpcyBpcwpzcGVj
aWZpZWQgaW4gc2VjdGlvbiAyLjIuMSBvZiB2ZXJzaW9uIDAuMiBvZiB0aGUgZGV2aWNlIHRyZWUK
c3BlY2lmaWNhdGlvbiwgYXZhaWxhYmxlIGZyb20gZGV2aWNldHJlZS5vcmcuCgpMaW51eCBLZXJu
ZWwgdmVyc2lvbnMgcHJpb3IgdG8gNC4xNSBtaXNpbnRlcnByZXQgZmxhdHRlbmVkIGRldmljZSB0
cmVlcwp3aXRoIGEgIi8iIGFzIHRoZSBuYW1lIG9mIHRoZSByb290IG5vZGUgYXMgYW4gRkRUIHZl
cnNpb24gb2xkZXIgdGhhbiAxNi4KTGludXggdGhlbiBmYWlscyB0byBwYXJzZSB0aGUgRkRULgoK
U2lnbmVkLW9mZi1ieTogV2lsbCBBYmVsZSA8d2lsbC5hYmVsZUBzdGFybGFiLmlvPgotLS0KIHhl
bi9hcmNoL2FybS9hY3BpL2RvbWFpbl9idWlsZC5jIHwgMiArLQogeGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYWNwaS9kb21haW5fYnVp
bGQuYyBiL3hlbi9hcmNoL2FybS9hY3BpL2RvbWFpbl9idWlsZC5jCmluZGV4IDVhYWUzMmFjMjAu
LjFiMWNmYWJiMDAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hY3BpL2RvbWFpbl9idWlsZC5j
CisrKyBiL3hlbi9hcmNoL2FybS9hY3BpL2RvbWFpbl9idWlsZC5jCkBAIC0xNDUsNyArMTQ1LDcg
QEAgc3RhdGljIGludCBfX2luaXQgY3JlYXRlX2FjcGlfZHRiKHN0cnVjdCBrZXJuZWxfaW5mbyAq
a2luZm8sCiAgICAgaWYgKCByZXQgPCAwICkKICAgICAgICAgZ290byBlcnI7CiAKLSAgICByZXQg
PSBmZHRfYmVnaW5fbm9kZShraW5mby0+ZmR0LCAiLyIpOworICAgIHJldCA9IGZkdF9iZWdpbl9u
b2RlKGtpbmZvLT5mZHQsICIiKTsKICAgICBpZiAoIHJldCA8IDAgKQogICAgICAgICBnb3RvIGVy
cjsKIApkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jCmluZGV4IGQ5ODM2Nzc5ZDEuLmFmOTM2YjRjM2EgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYworKysgYi94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMKQEAgLTE2OTcsNyArMTY5Nyw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHByZXBhcmVf
ZHRiX2RvbVUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbykKICAg
ICBpZiAoIHJldCA8IDAgKQogICAgICAgICBnb3RvIGVycjsKIAotICAgIHJldCA9IGZkdF9iZWdp
bl9ub2RlKGtpbmZvLT5mZHQsICIvIik7CisgICAgcmV0ID0gZmR0X2JlZ2luX25vZGUoa2luZm8t
PmZkdCwgIiIpOwogICAgIGlmICggcmV0IDwgMCApCiAgICAgICAgIGdvdG8gZXJyOwogCi0tIAoy
LjIyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
