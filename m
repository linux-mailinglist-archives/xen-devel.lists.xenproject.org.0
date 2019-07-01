Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C35BA83
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 13:23:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhuLw-0001B8-M6; Mon, 01 Jul 2019 11:20:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhuLv-00014U-7o
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 11:20:07 +0000
X-Inumbo-ID: 2d0497cf-9bf2-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2d0497cf-9bf2-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 11:20:05 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 11:19:59 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 11:19:36 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 11:19:36 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3363.namprd18.prod.outlook.com (10.255.139.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 11:19:35 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 11:19:35 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v9 06/23] x86emul: add high register S/G test cases
Thread-Index: AQHVL/7dDY0pqJbdD0ax+FI2XhGujg==
Date: Mon, 1 Jul 2019 11:19:35 +0000
Message-ID: <040b3c5c-551e-c26e-ae91-58a9403fb674@suse.com>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
In-Reply-To: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P193CA0009.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::19)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30d7ff23-1a28-474c-cf36-08d6fe15ff88
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3363; 
x-ms-traffictypediagnostic: BY5PR18MB3363:
x-microsoft-antispam-prvs: <BY5PR18MB3363E77604F456719903928DB3F90@BY5PR18MB3363.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:972;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(199004)(189003)(14444005)(25786009)(2616005)(5640700003)(6486002)(256004)(66066001)(6436002)(486006)(36756003)(72206003)(11346002)(476003)(446003)(2501003)(3846002)(6116002)(66946007)(386003)(76176011)(52116002)(81156014)(8676002)(14454004)(8936002)(71190400001)(80792005)(2906002)(81166006)(305945005)(99286004)(31696002)(7736002)(102836004)(26005)(186003)(6506007)(86362001)(54906003)(478600001)(4326008)(316002)(66476007)(5660300002)(64756008)(66446008)(68736007)(73956011)(6512007)(71200400001)(31686004)(6916009)(53936002)(66556008)(2351001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3363;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6dmFjjc33YIhnNAQ3IkhqJ4RS7ADITI67n/N1JVRma6ee8uQzTdgx7xFAbiPAZO+ZHQzZwBDtEHGn/exJRUYANb++DW/KugvLv9xVz5zv7693RMiugheTx6Kc4CY1wOuJxtFrzd45yfgkXmCOJ9Frg3Mu9/Fc9AqOdWg/Qh/e9GZk/R6x1SmAFyF5muvvD9ls68/8/InIxTn9Jltri2Eo66q+m6091N1PzEpxO1YhhyPg1DLanko7lyH8uZrH9VfrZ7yrfAb1ABGZ5yjjtii3YHMnElLr3I4yqF62bhkf/nnsjJ35G5AZIo1iC/c5PyoMASoBU0FloHDrtZK51iotBtnOX6p2bQDJtXUEpCQehazecoLcZZpM0dw0gK+uKRBvWu0F+8ODqq8DVWSukPv2kC6h8rut4Lu/xMJYXWYe2Y=
Content-ID: <E23024AA1766B74A92AC4CAAD908741F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d7ff23-1a28-474c-cf36-08d6fe15ff88
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 11:19:35.6716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3363
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v9 06/23] x86emul: add high register S/G test
 cases
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gb3JkZXIgdG8gdmVyaWZ5IHRoYXQgaW4gcGFydGljdWxhciB0aGUgaW5kZXggcmVnaXN0ZXIg
ZGVjb2Rpbmcgd29ya3MNCmNvcnJlY3RseSBpbiB0aGUgUy9HIGVtdWxhdGlvbiBwYXRocywgYWRk
IGRlZGljYXRlZCAoNjQtYml0IG9ubHkpIGNhc2VzDQpkaXNhbGxvd2luZyB0aGUgY29tcGlsZXIg
dG8gdXNlIHRoZSBsb3dlciByZWdpc3RlcnMuIE90aGVyIHRoYW4gaW4gdGhlDQpnZW5lcmljIFNJ
TUQgY2FzZSwgd2hlcmUgb2NjYXNpb25hbCB1c2VzIG9mICV4bW0gb3IgJXltbSByZWdpc3RlcnMg
aW4NCmdlbmVyYXRlZCBjb2RlIGNhdXNlIHZhcmlvdXMgaW50ZXJuYWwgY29tcGlsZXIgZXJyb3Jz
IHdoZW4gZGlzYWxsb3dpbmcNCnVzZSBvZiBhbGwgb2YgdGhlIGxvd2VyIDE2IHJlZ2lzdGVycyAo
YXBwYXJlbnRseSBkdWUgdG8gaW5zbiB0ZW1wbGF0ZXMNCnRyeWluZyB0byB1c2UgQVZYMiBlbmNv
ZGluZ3MpLCBkb2luZyBzbyBoZXJlIGluIHRoZSBBVlg1MTJGIGNhc2UgbG9va3MNCnRvIGJlIGZp
bmUuDQoNCldoaWxlIHRoZSBtYWluIGdvYWwgaGVyZSBpcyB0aGUgQVZYNTEyRiBjYXNlLCBhZGQg
YW4gQVZYMiB2YXJpYW50IGFzDQp3ZWxsLg0KDQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCi0tLQ0KdjY6IE5ldy4NCg0KLS0tIGEvdG9vbHMvdGVzdHMveDg2X2Vt
dWxhdG9yL01ha2VmaWxlDQorKysgYi90b29scy90ZXN0cy94ODZfZW11bGF0b3IvTWFrZWZpbGUN
CkBAIC0xNDcsNiArMTQ3LDEyIEBAICQoZm9yZWFjaCBmbGF2b3IsJChTSU1EKSAkKEZNQSksJChl
dmFsICQNCiAgJChmb3JlYWNoIGZsYXZvciwkKFNHKSwkKGV2YWwgJChjYWxsIHNpbWQtc2ctZGVm
cywkKGZsYXZvcikpKSkNCiAgJChmb3JlYWNoIGZsYXZvciwkKE9QTUFTSyksJChldmFsICQoY2Fs
bCBvcG1hc2stZGVmcywkKGZsYXZvcikpKSkNCiAgDQorZmlyc3Qtc3RyaW5nID0gJChzaGVsbCBm
b3IgcyBpbiAkKDEpOyBkbyBlY2hvICIkJHMiOyBicmVhazsgZG9uZSkNCisNCithdngyLXNnLWNm
bGFncy14ODZfNjQgICAgOj0gIi1EX2hpZ2ggJChmb3JlYWNoIG4sNyA2IDUgNCAzIDIgMSwtZmZp
eGVkLXltbSQobikpICQoY2FsbCBmaXJzdC1zdHJpbmcsJChhdngyLXNnLWNmbGFncykpIg0KK2F2
eDUxMmYtc2ctY2ZsYWdzLXg4Nl82NCA6PSAiLURfaGlnaGVyICQoZm9yZWFjaCBuLDcgNiA1IDQg
MyAyIDEsLWZmaXhlZC16bW0kKG4pKSAkKGNhbGwgZmlyc3Qtc3RyaW5nLCQoYXZ4NTEyZi1zZy1j
ZmxhZ3MpKSINCithdng1MTJmLXNnLWNmbGFncy14ODZfNjQgKz0gIi1EX2hpZ2hlc3QgJChmb3Jl
YWNoIG4sMTUgMTQgMTMgMTIgMTEgMTAgOSA4LC1mZml4ZWQtem1tJChuKSkgJChjYWxsIGZpcnN0
LXN0cmluZywkKGF2eDUxMmYtc2ctY2ZsYWdzLXg4Nl82NCkpIg0KKw0KICAkKGFkZHN1ZmZpeCAu
aCwkKFRFU1RDQVNFUykpOiAlLmg6ICUuYyB0ZXN0Y2FzZS5tayBNYWtlZmlsZQ0KICAJcm0gLWYg
JEAubmV3ICQqLmJpbg0KICAJJChmb3JlYWNoIGFyY2gsJChmaWx0ZXItb3V0ICQoWEVOX0NPTVBJ
TEVfQVJDSCkseDg2XzMyKSAkKFhFTl9DT01QSUxFX0FSQ0gpLCBcDQotLS0gYS90b29scy90ZXN0
cy94ODZfZW11bGF0b3IvdGVzdF94ODZfZW11bGF0b3IuYw0KKysrIGIvdG9vbHMvdGVzdHMveDg2
X2VtdWxhdG9yL3Rlc3RfeDg2X2VtdWxhdG9yLmMNCkBAIC0yNjYsNiArMjY2LDkgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCB7DQogICAgICBTSU1EKEFWWDIgUy9HIGk2NFs0eDMyXSwgIGF2eDJfc2cs
ICAgIDMyeDRpOCksDQogICAgICBTSU1EKEFWWDIgUy9HIGkzMls0eDY0XSwgIGF2eDJfc2csICAg
IDMyeDhpNCksDQogICAgICBTSU1EKEFWWDIgUy9HIGk2NFs0eDY0XSwgIGF2eDJfc2csICAgIDMy
eDhpOCksDQorI2lmZGVmIF9feDg2XzY0X18NCisgICAgU0lNRF8oNjQsIEFWWDIgUy9HICV5bW04
KywgYXZ4Ml9zZywgICAgIGhpZ2gpLA0KKyNlbmRpZg0KICAgICAgU0lNRChYT1AgMTI4Yml0IHNp
bmdsZSwgICAgICAgeG9wLCAgICAgIDE2ZjQpLA0KICAgICAgU0lNRChYT1AgMjU2Yml0IHNpbmds
ZSwgICAgICAgeG9wLCAgICAgIDMyZjQpLA0KICAgICAgU0lNRChYT1AgMTI4Yml0IGRvdWJsZSwg
ICAgICAgeG9wLCAgICAgIDE2ZjgpLA0KQEAgLTMwMyw2ICszMDYsMTAgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCB7DQogICAgICBTSU1EKEFWWDUxMkYgUy9HIGk2NFsgOHgzMl0sIGF2eDUxMmZfc2cs
IDY0eDRpOCksDQogICAgICBTSU1EKEFWWDUxMkYgUy9HIGkzMlsgOHg2NF0sIGF2eDUxMmZfc2cs
IDY0eDhpNCksDQogICAgICBTSU1EKEFWWDUxMkYgUy9HIGk2NFsgOHg2NF0sIGF2eDUxMmZfc2cs
IDY0eDhpOCksDQorI2lmZGVmIF9feDg2XzY0X18NCisgICAgU0lNRF8oNjQsIEFWWDUxMkYgUy9H
ICV6bW04KywgYXZ4NTEyZl9zZywgaGlnaGVyKSwNCisgICAgU0lNRF8oNjQsIEFWWDUxMkYgUy9H
ICV6bW0xNissIGF2eDUxMmZfc2csIGhpZ2hlc3QpLA0KKyNlbmRpZg0KICAgICAgQVZYNTEyVkwo
VkwgZjMyeDQsICAgICAgICBhdng1MTJmLCAgICAgIDE2ZjQpLA0KICAgICAgQVZYNTEyVkwoVkwg
ZjY0eDIsICAgICAgICBhdng1MTJmLCAgICAgIDE2ZjgpLA0KICAgICAgQVZYNTEyVkwoVkwgZjMy
eDgsICAgICAgICBhdng1MTJmLCAgICAgIDMyZjQpLA0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
