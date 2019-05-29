Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF222DC06
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 13:38:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVws2-0001iY-Rg; Wed, 29 May 2019 11:35:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QpgD=T5=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hVws1-0001iT-8x
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 11:35:49 +0000
X-Inumbo-ID: e68d6435-8205-11e9-8980-bc764e045a96
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.88]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e68d6435-8205-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 11:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhLQQ1/Cfbm/+mJHGlIMsBVk/z5NnvwKOEqWMvlZhx8=;
 b=XfFYeR04Lq4POTx4I0quuh/VGwkWvlLBdkI+lIszjH6uAzaZP/zSbyrPNt5qiW6+mnf5t4v5eJwg7WuSz0L37a3+NJqomV/MX+m5woBM4FsPYgyxqggXMiS0THCRWIJ3MYeiPHZaYa22dJhTSacmOOPSlbSBoeH6JDXi2IaHuU3dgmMkOc67BPg1R0J84wHTQQzC2yg0wgLLPIee9eYtwAT1D408NHhyqDCPJHHKHEhcgixnFVnkha3huf2hlN+eUHPntN5MvB3dREvNMW/+lOC6J+80tJ3rft58ceuSrRNh9n7V3dMkWcjnindF2rmgkcA1bn/EurIP5WBsItd0BA==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB4529.eurprd03.prod.outlook.com (20.176.214.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.20; Wed, 29 May 2019 11:35:43 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a%3]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 11:35:43 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] get_maintainer: Improve patch recognition
Thread-Index: AQHVFhKmR9oYQeQHRUKX8vkFAoSAyA==
Date: Wed, 29 May 2019 11:35:43 +0000
Message-ID: <20190529113534.23213-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 125c3373-f180-48bd-c39a-08d6e429c904
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4529; 
x-ms-traffictypediagnostic: AM0PR03MB4529:
x-microsoft-antispam-prvs: <AM0PR03MB4529BF5DEF8079BBDB8DBAABE61F0@AM0PR03MB4529.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(39860400002)(136003)(376002)(346002)(199004)(189003)(14444005)(256004)(36756003)(2501003)(66446008)(64756008)(53936002)(486006)(107886003)(80792005)(2351001)(2906002)(68736007)(66066001)(76116006)(66946007)(14454004)(86362001)(6916009)(66556008)(8676002)(81156014)(81166006)(91956017)(66476007)(1076003)(5660300002)(73956011)(72206003)(7736002)(71200400001)(71190400001)(305945005)(6436002)(102836004)(316002)(7416002)(4326008)(8936002)(478600001)(54906003)(25786009)(476003)(2616005)(3846002)(55236004)(186003)(6116002)(6512007)(99286004)(6486002)(5640700003)(6506007)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4529;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uRp891PnN6PCQbJxxCl3FWjHZnMrW+zMNgUGEKRqtRYZxYF81CbYUxY8tQe0hDxnvSPryUU1H3psWtSvDkQjDzpPqtsJ4UdE4fj7xKCRo9c2ZS3ggHuIT3IJnlXv0bUJT7evkJxHL8UpoX2516ErAAkfmEv46WBdua3laoQCD9Ei/puICfO82Qzs3ECqXTOpZdV6fDopKtIf1sHYezfUIisb0XYaRrG9lB7YzEFObYC4cmW/v7VPSyac8aJokWPR6mY7C418wjNlyW52oOth+Lbipo4wBo73zRxV6mSny7AjZFmICUnqhtGdrsVZZkJvlwgpETlYGTGTvNaf8ojpO9cxfvX0MnaORzLMapYc4k5KWh48X1kUDdWJhT2q0CB9dE7swaGUVz93sXnFToEwB+t2/h8I2JORv+jY0ZBedNg=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125c3373-f180-48bd-c39a-08d6e429c904
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 11:35:43.5655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4529
Subject: [Xen-devel] [PATCH] get_maintainer: Improve patch recognition
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Joe Perches <joe@perches.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KCkZyb206IEpvZSBQZXJjaGVzIDxq
b2VAcGVyY2hlcy5jb20+CgpUaGVyZSBhcmUgbW9kZSBjaGFuZ2UgYW5kIHJlbmFtZSBvbmx5IHBh
dGNoZXMgdGhhdCBhcmUgdW5yZWNvZ25pemVkCmJ5IHRoZSBnZXRfbWFpbnRhaW5lci5wbCBzY3Jp
cHQuCgpSZWNvZ25pemUgdGhlbS4KClJlcG9ydGVkLWJ5OiBIZWlucmljaCBTY2h1Y2hhcmR0IDx4
eXByb24uZ2xwa0BnbXguZGU+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgpTaWduZWQtb2ZmLWJ5OiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMuY29tPgpTaWduZWQtb2Zm
LWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Ci0tLQog
c2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCB8IDEzICsrKysrKysrKysrKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0
cy9nZXRfbWFpbnRhaW5lci5wbCBiL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwKaW5kZXggZDUy
OGRhNzM4Yy4uMTc0ZGZiN2U0MCAxMDA3NTUKLS0tIGEvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5w
bAorKysgYi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsCkBAIC00NDUsNyArNDQ1LDE4IEBAIGZv
cmVhY2ggbXkgJGZpbGUgKEBBUkdWKSB7CiAKIAl3aGlsZSAoPCRwYXRjaD4pIHsKIAkgICAgbXkg
JHBhdGNoX2xpbmUgPSAkXzsKLQkgICAgaWYgKG0vXlwrXCtcK1xzKyhcUyspLyBvciBtL14tLS1c
cysoXFMrKS8pIHsKKwkgICAgaWYgKG0vXiBtb2RlIGNoYW5nZSBbMC03XSsgPT4gWzAtN10rIChc
UyspXHMqJC8pIHsKKwkJbXkgJGZpbGVuYW1lID0gJDE7CisJCXB1c2goQGZpbGVzLCAkZmlsZW5h
bWUpOworCSAgICB9IGVsc2lmIChtL15yZW5hbWUgKD86ZnJvbXx0bykgKFxTKylccyokLykgewor
CQlteSAkZmlsZW5hbWUgPSAkMTsKKwkJcHVzaChAZmlsZXMsICRmaWxlbmFtZSk7CisJICAgIH0g
ZWxzaWYgKG0vXmRpZmYgLS1naXQgYVwvKFxTKykgYlwvKFxTKylccyokLykgeworCQlteSAkZmls
ZW5hbWUxID0gJDE7CisJCW15ICRmaWxlbmFtZTIgPSAkMjsKKwkJcHVzaChAZmlsZXMsICRmaWxl
bmFtZTEpOworCQlwdXNoKEBmaWxlcywgJGZpbGVuYW1lMik7CisJICAgIH0gZWxzaWYgKG0vXlwr
XCtcK1xzKyhcUyspLyBvciBtL14tLS1ccysoXFMrKS8pIHsKIAkJbXkgJGZpbGVuYW1lID0gJDE7
CiAJCWlmICgkMSBuZSAiL2Rldi9udWxsIikgeyAjSWdub3JlIHRoZSBuby1maWxlIHBsYWNlaG9s
ZGVyCiAJCSAgICAkZmlsZW5hbWUgPX4gc0BeW14vXSovQEA7Ci0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
