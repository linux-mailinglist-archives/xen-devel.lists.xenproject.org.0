Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F0949EFE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 13:14:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdC2I-00007J-7j; Tue, 18 Jun 2019 11:12:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kstG=UR=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hdC2G-00007D-SQ
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 11:12:21 +0000
X-Inumbo-ID: ef79ff85-91b9-11e9-8980-bc764e045a96
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::607])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ef79ff85-91b9-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 11:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgHSKmfsH8qtKrsLs4JXbr9MhnGdGuZ1By7DkvzHgwE=;
 b=AGjjR/JXux3OJ5XEYBQsWoffVEwN148OpT95PsfeYeXIBrpDC53U7E/P0inZDmcBAv9Z8IDzDNVUjXbOMvDZXTYx3cZv9HkbWaeb7jmSA1q/nq67dQbey6nWC/fK5wr1bNnEB+LGCo1HXINsCFuL+krrg0wqGPwtu2h4OtG3UfnVgy6FpDdnmqEUGle3Bq2/qFVI0wGFaOngMYxEJu4oF9J1yEURm4zx45ny7DmGWsTW2vbAe+bpU0SG65NHv+g0CBl0dl0JiImvb26CKms+q8K902WDXHgY/wANCbJEt3XP5KhkgYGOhHRK8aLo0Pvrvj5QvBa5JOzaHrtVqiTehQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB3681.eurprd03.prod.outlook.com (52.134.82.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Tue, 18 Jun 2019 11:12:15 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1987.013; Tue, 18 Jun 2019
 11:12:15 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v2] get_maintainer: Improve patch recognition
Thread-Index: AQHVJcavyyPUY3If00KRLFTi8Udxfg==
Date: Tue, 18 Jun 2019 11:12:15 +0000
Message-ID: <20190618111149.32515-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f98aa47-cb24-4bc9-bebf-08d6f3ddd1f8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB3681; 
x-ms-traffictypediagnostic: AM0PR03MB3681:
x-microsoft-antispam-prvs: <AM0PR03MB3681208AAE7A571E51368E80E6EA0@AM0PR03MB3681.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:51;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(107886003)(256004)(55236004)(68736007)(66946007)(66066001)(25786009)(102836004)(1076003)(6506007)(14444005)(7416002)(80792005)(8676002)(7736002)(186003)(8936002)(26005)(3846002)(6512007)(81166006)(81156014)(71190400001)(5660300002)(36756003)(64756008)(66556008)(76116006)(6486002)(91956017)(486006)(99286004)(14454004)(73956011)(316002)(71200400001)(2616005)(6436002)(53936002)(110136005)(478600001)(86362001)(66446008)(2501003)(476003)(66476007)(4326008)(6116002)(54906003)(72206003)(305945005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3681;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pqvc5wrk8TqfdSW2E1hMACzNLP0Wjiqlz4+xn1xWo2ZI3EW9SeJ3qcI7fRupokbGq3biAnE677eXp26vo2iBsIidLn6Pg8SQli63ymcmS5KnOWE5WpP3qIgP98bjDQkhk+QUj5mZMIandt9hqzShtY/U19TGoGpYhNFRBL+HHupuuQMCqZjHlXqQGF2egPIFr7s7I6tZFy/sgHYAdnlcwqlElq44EeZUfM+xhz1E2A+3Y22EBI4fPthxuJDfMvW1SvapkiIvB2ksKrwdhxhIlcqzL+AA6ikIL337TQ7p9ubr4X7Sq14JjV1YBmhn/tv2LJkxLrK0dAQV+6N+cMVRC/wMlJVkoWQmqgwjohOxk1pKPYTYzjijdn75CM2csEDzaRtrSlf1/9YHCxM3s+mnOyp0qGYMGc0bOcMKXAIXoN8=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f98aa47-cb24-4bc9-bebf-08d6f3ddd1f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 11:12:15.4146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3681
Subject: [Xen-devel] [PATCH v2] get_maintainer: Improve patch recognition
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Joe Perches <joe@perches.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KClRoZXJlIGFyZSBtb2RlIGNoYW5n
ZSBhbmQgcmVuYW1lIG9ubHkgcGF0Y2hlcyB0aGF0IGFyZSB1bnJlY29nbml6ZWQKYnkgdGhlIGdl
dF9tYWludGFpbmVyLnBsIHNjcmlwdC4KClJlY29nbml6ZSB0aGVtLgoKWyBMaW51eCBjb21taXQg
MDQ1NWM3NDc4OGZkNWFhZDQzOTlmMDBlM2ZiYmI3ZTg3NDUwY2E1OCBdCgpSZXBvcnRlZC1ieTog
SGVpbnJpY2ggU2NodWNoYXJkdCA8eHlwcm9uLmdscGtAZ214LmRlPgpDQzogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9lIFBlcmNoZXMgPGpvZUBw
ZXJjaGVzLmNvbT4KU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9i
YWJjaHVrQGVwYW0uY29tPgotLS0KCiBDaGFuZ2VzIHdydCB0byB2MToKIC0gVXBkYXRlZCBjb21t
aXQgbWVzc2FnZSAtIGFkZCBMaW51eCBjb21taXQgaWQKCiBzY3JpcHRzL2dldF9tYWludGFpbmVy
LnBsIHwgMTMgKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIGIv
c2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbAppbmRleCBkNTI4ZGE3MzhjLi4xNzRkZmI3ZTQwIDEw
MDc1NQotLS0gYS9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsCisrKyBiL3NjcmlwdHMvZ2V0X21h
aW50YWluZXIucGwKQEAgLTQ0NSw3ICs0NDUsMTggQEAgZm9yZWFjaCBteSAkZmlsZSAoQEFSR1Yp
IHsKIAogCXdoaWxlICg8JHBhdGNoPikgewogCSAgICBteSAkcGF0Y2hfbGluZSA9ICRfOwotCSAg
ICBpZiAobS9eXCtcK1wrXHMrKFxTKykvIG9yIG0vXi0tLVxzKyhcUyspLykgeworCSAgICBpZiAo
bS9eIG1vZGUgY2hhbmdlIFswLTddKyA9PiBbMC03XSsgKFxTKylccyokLykgeworCQlteSAkZmls
ZW5hbWUgPSAkMTsKKwkJcHVzaChAZmlsZXMsICRmaWxlbmFtZSk7CisJICAgIH0gZWxzaWYgKG0v
XnJlbmFtZSAoPzpmcm9tfHRvKSAoXFMrKVxzKiQvKSB7CisJCW15ICRmaWxlbmFtZSA9ICQxOwor
CQlwdXNoKEBmaWxlcywgJGZpbGVuYW1lKTsKKwkgICAgfSBlbHNpZiAobS9eZGlmZiAtLWdpdCBh
XC8oXFMrKSBiXC8oXFMrKVxzKiQvKSB7CisJCW15ICRmaWxlbmFtZTEgPSAkMTsKKwkJbXkgJGZp
bGVuYW1lMiA9ICQyOworCQlwdXNoKEBmaWxlcywgJGZpbGVuYW1lMSk7CisJCXB1c2goQGZpbGVz
LCAkZmlsZW5hbWUyKTsKKwkgICAgfSBlbHNpZiAobS9eXCtcK1wrXHMrKFxTKykvIG9yIG0vXi0t
LVxzKyhcUyspLykgewogCQlteSAkZmlsZW5hbWUgPSAkMTsKIAkJaWYgKCQxIG5lICIvZGV2L251
bGwiKSB7ICNJZ25vcmUgdGhlIG5vLWZpbGUgcGxhY2Vob2xkZXIKIAkJICAgICRmaWxlbmFtZSA9
fiBzQF5bXi9dKi9AQDsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
