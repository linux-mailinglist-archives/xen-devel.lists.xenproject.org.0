Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E54C85BA9E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 13:27:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhuPr-0001sQ-UR; Mon, 01 Jul 2019 11:24:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhuPp-0001s5-Tr
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 11:24:09 +0000
X-Inumbo-ID: 871a6246-9bf2-11e9-a38e-3315b6b8acd4
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 871a6246-9bf2-11e9-a38e-3315b6b8acd4;
 Mon, 01 Jul 2019 11:24:07 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 11:22:31 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 11:21:51 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 11:21:51 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3363.namprd18.prod.outlook.com (10.255.139.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 11:21:50 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 11:21:50 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v9 10/23] x86emul: complete support of AVX512_VBMI insns
Thread-Index: AQHVL/8tA4h2j9NdCU+Y5T3SgU74Cg==
Date: Mon, 1 Jul 2019 11:21:49 +0000
Message-ID: <145201fc-8421-9e34-65e7-de8ad52e1a73@suse.com>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
In-Reply-To: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR05CA0062.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::39) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56f1dc08-63a3-4956-15c9-08d6fe164f86
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3363; 
x-ms-traffictypediagnostic: BY5PR18MB3363:
x-microsoft-antispam-prvs: <BY5PR18MB3363CB9C525CD69327D03E4EB3F90@BY5PR18MB3363.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(199004)(189003)(14444005)(25786009)(2616005)(5640700003)(6486002)(256004)(66066001)(6436002)(486006)(36756003)(72206003)(11346002)(476003)(446003)(2501003)(3846002)(6116002)(66946007)(386003)(76176011)(52116002)(81156014)(8676002)(14454004)(8936002)(71190400001)(80792005)(2906002)(81166006)(305945005)(99286004)(31696002)(7736002)(102836004)(26005)(186003)(6506007)(86362001)(54906003)(478600001)(4326008)(316002)(66476007)(5660300002)(64756008)(66446008)(68736007)(73956011)(6512007)(71200400001)(31686004)(6916009)(53936002)(66556008)(2351001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3363;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zX6k+GPFXBL6AD47yqLjZUYqXheq84vklg41oUIw119pHywE8vvSODs1Fzd2oGG3qStb6xDfldEg/pLxdrTm/BDSfndpVMkuUAvqgVZihsyW3wi5Tn/TbMXwu0+6c2sJnjY8nIG4zoE/t2YkUMldfdrJ8osKQW76M4AP4tYspAcDTbdVDZ5g0Qu1jeEO/gleF+9liYgshxQQ8OH08N3uNwWcwheoTdqC26vkN2QAb0NomLwbayRfskUOO4e88FBZBrb4YPYLTrJ1KWfsogR7KN7mYBR/P8IZjSeuBiiM6U5QcsoS90bk1Fv4Q2InHkV3EcirophH04zxiJKyHm8XAwd1EPGJYZ0p290NB0C39rpOBRqksFXaTlzXvlDTUsJYuLcggxJhxJfUJdArcUP5AMCgbvHHU9//CXpsj+5iFEA=
Content-ID: <ADB0A7B5F743BF459BA1220D6211C192@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f1dc08-63a3-4956-15c9-08d6fe164f86
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 11:21:49.8805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3363
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v9 10/23] x86emul: complete support of
 AVX512_VBMI insns
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

QWxzbyBhZGQgdGVzdGluZyBvZiBvbmVzIHN1cHBvcnQgZm9yIHdoaWNoIHdhcyBhZGRlZCBiZWZv
cmUuIFNhZGx5IGdjYydzDQpjb21tYW5kIGxpbmUgb3B0aW9uIG5hbWluZyBpcyBub3QgaW4gbGlu
ZSB3aXRoIEludGVsJ3MgbmFtaW5nIG9mIHRoZQ0KZmVhdHVyZSwgd2hpY2ggbWFrZXMgaXQgbmVj
ZXNzYXJ5IHRvIG1pcy1uYW1lIHRoaW5ncyBpbiB0aGUgdGVzdCBoYXJuZXNzLg0KDQpTaW5jZSB0
aGUgb25seSBuZXcgaW5zbiBoZXJlIGFuZCBpbiBwYXJ0aWN1bGFyIGl0cyBtZW1vcnkgYWNjZXNz
IHBhdHRlcm4NCmZvbGxvd3MgdGhlIHVzdWFsIHNjaGVtZSwgSSBkaWRuJ3QgdGhpbmsgaXQgd2Fz
IG5lY2Vzc2FyeSB0byBhZGQgYQ0KY29udHJpdmVkIHRlc3Qgc3BlY2lmaWNhbGx5IGZvciBpdCwg
YmV5b25kIHRoZSBEaXNwOCBzY2FsaW5nIG9uZS4NCg0KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQotLS0NCnY2OiBOZXcuDQoNCi0tLSBhL3Rvb2xzL3Rlc3RzL3g4
Nl9lbXVsYXRvci9NYWtlZmlsZQ0KKysrIGIvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL01ha2Vm
aWxlDQpAQCAtMTYsNyArMTYsNyBAQCB2cGF0aCAlLmMgJChYRU5fUk9PVCkveGVuL2xpYi94ODYN
CiAgDQogIENGTEFHUyArPSAkKENGTEFHU194ZW5pbmNsdWRlKQ0KICANCi1TSU1EIDo9IDNkbm93
IHNzZSBzc2UyIHNzZTQgYXZ4IGF2eDIgeG9wIGF2eDUxMmYgYXZ4NTEyYncgYXZ4NTEyZHEgYXZ4
NTEyZXINCitTSU1EIDo9IDNkbm93IHNzZSBzc2UyIHNzZTQgYXZ4IGF2eDIgeG9wIGF2eDUxMmYg
YXZ4NTEyYncgYXZ4NTEyZHEgYXZ4NTEyZXIgYXZ4NTEydmJtaQ0KICBGTUEgOj0gZm1hNCBmbWEN
CiAgU0cgOj0gYXZ4Mi1zZyBhdng1MTJmLXNnIGF2eDUxMnZsLXNnDQogIFRFU1RDQVNFUyA6PSBi
bG93ZmlzaCAkKFNJTUQpICQoRk1BKSAkKFNHKQ0KQEAgLTgzLDYgKzgzLDkgQEAgYXZ4NTEyZHEt
Zmx0cyA6PSAkKGF2eDUxMmYtZmx0cykNCiAgYXZ4NTEyZXItdmVjcyA6PSA2NA0KICBhdng1MTJl
ci1pbnRzIDo9DQogIGF2eDUxMmVyLWZsdHMgOj0gNCA4DQorYXZ4NTEydmJtaS12ZWNzIDo9ICQo
YXZ4NTEyYnctdmVjcykNCithdng1MTJ2Ym1pLWludHMgOj0gJChhdng1MTJidy1pbnRzKQ0KK2F2
eDUxMnZibWktZmx0cyA6PSAkKGF2eDUxMmJ3LWZsdHMpDQogIA0KICBhdng1MTJmLW9wbWFzay12
ZWNzIDo9IDINCiAgYXZ4NTEyZHEtb3BtYXNrLXZlY3MgOj0gMSAyDQotLS0gYS90b29scy90ZXN0
cy94ODZfZW11bGF0b3IvZXZleC1kaXNwOC5jDQorKysgYi90b29scy90ZXN0cy94ODZfZW11bGF0
b3IvZXZleC1kaXNwOC5jDQpAQCAtNTQyLDYgKzU0Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
dGVzdCBhdng1MTJfdmJtaV9hbGwNCiAgICAgIElOU04ocGVybWIsICAgICAgICAgNjYsIDBmMzgs
IDhkLCB2bCwgYiwgdmwpLA0KICAgICAgSU5TTihwZXJtaTJiLCAgICAgICA2NiwgMGYzOCwgNzUs
IHZsLCBiLCB2bCksDQogICAgICBJTlNOKHBlcm10MmIsICAgICAgIDY2LCAwZjM4LCA3ZCwgdmws
IGIsIHZsKSwNCisgICAgSU5TTihwbXVsdGlzaGlmdHFiLCA2NiwgMGYzOCwgODMsIHZsLCBxLCB2
bCksDQogIH07DQogIA0KICBzdGF0aWMgY29uc3Qgc3RydWN0IHRlc3QgYXZ4NTEyX3ZibWkyX2Fs
bFtdID0gew0KLS0tIGEvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3Rlc3RfeDg2X2VtdWxhdG9y
LmMNCisrKyBiL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci90ZXN0X3g4Nl9lbXVsYXRvci5jDQpA
QCAtMjcsNiArMjcsNyBAQCBhc20gKCAiLnB1c2hzZWN0aW9uIC50ZXN0LCBcImF4XCIsIEBwcm9n
DQogICNpbmNsdWRlICJhdng1MTJidy5oIg0KICAjaW5jbHVkZSAiYXZ4NTEyZHEuaCINCiAgI2lu
Y2x1ZGUgImF2eDUxMmVyLmgiDQorI2luY2x1ZGUgImF2eDUxMnZibWkuaCINCiAgDQogICNkZWZp
bmUgdmVyYm9zZSBmYWxzZSAvKiBTd2l0Y2ggdG8gdHJ1ZSBmb3IgZmFyIG1vcmUgbG9nZ2luZy4g
Ki8NCiAgDQpAQCAtMTI3LDYgKzEyOCwxNiBAQCBzdGF0aWMgYm9vbCBzaW1kX2NoZWNrX2F2eDUx
MmJ3X3ZsKHZvaWQpDQogICAgICByZXR1cm4gY3B1X2hhc19hdng1MTJidyAmJiBjcHVfaGFzX2F2
eDUxMnZsOw0KICB9DQogIA0KK3N0YXRpYyBib29sIHNpbWRfY2hlY2tfYXZ4NTEydmJtaSh2b2lk
KQ0KK3sNCisgICAgcmV0dXJuIGNwdV9oYXNfYXZ4NTEyX3ZibWk7DQorfQ0KKw0KK3N0YXRpYyBi
b29sIHNpbWRfY2hlY2tfYXZ4NTEydmJtaV92bCh2b2lkKQ0KK3sNCisgICAgcmV0dXJuIGNwdV9o
YXNfYXZ4NTEyX3ZibWkgJiYgY3B1X2hhc19hdng1MTJ2bDsNCit9DQorDQogIHN0YXRpYyB2b2lk
IHNpbWRfc2V0X3JlZ3Moc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQogIHsNCiAgICAgIGlm
ICggY3B1X2hhc19tbXggKQ0KQEAgLTM3Miw2ICszODMsMTggQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCB7DQogICAgICBTSU1EKEFWWDUxMkVSIGYzMngxNiwgICAgYXZ4NTEyZXIsICAgICAgNjRmNCks
DQogICAgICBTSU1EKEFWWDUxMkVSIGY2NCBzY2FsYXIsYXZ4NTEyZXIsICAgICAgICBmOCksDQog
ICAgICBTSU1EKEFWWDUxMkVSIGY2NHg4LCAgICAgYXZ4NTEyZXIsICAgICAgNjRmOCksDQorICAg
IFNJTUQoQVZYNTEyX1ZCTUkgczh4NjQsICBhdng1MTJ2Ym1pLCAgICA2NGkxKSwNCisgICAgU0lN
RChBVlg1MTJfVkJNSSB1OHg2NCwgIGF2eDUxMnZibWksICAgIDY0dTEpLA0KKyAgICBTSU1EKEFW
WDUxMl9WQk1JIHMxNngzMiwgYXZ4NTEydmJtaSwgICAgNjRpMiksDQorICAgIFNJTUQoQVZYNTEy
X1ZCTUkgdTE2eDMyLCBhdng1MTJ2Ym1pLCAgICA2NHUyKSwNCisgICAgQVZYNTEyVkwoX1ZCTUkr
Vkwgczh4MTYsIGF2eDUxMnZibWksICAgIDE2aTEpLA0KKyAgICBBVlg1MTJWTChfVkJNSStWTCB1
OHgxNiwgYXZ4NTEydmJtaSwgICAgMTZ1MSksDQorICAgIEFWWDUxMlZMKF9WQk1JK1ZMIHM4eDMy
LCBhdng1MTJ2Ym1pLCAgICAzMmkxKSwNCisgICAgQVZYNTEyVkwoX1ZCTUkrVkwgdTh4MzIsIGF2
eDUxMnZibWksICAgIDMydTEpLA0KKyAgICBBVlg1MTJWTChfVkJNSStWTCBzMTZ4OCwgYXZ4NTEy
dmJtaSwgICAgMTZpMiksDQorICAgIEFWWDUxMlZMKF9WQk1JK1ZMIHUxNng4LCBhdng1MTJ2Ym1p
LCAgICAxNnUyKSwNCisgICAgQVZYNTEyVkwoX1ZCTUkrVkwgczE2eDE2LCBhdng1MTJ2Ym1pLCAg
IDMyaTIpLA0KKyAgICBBVlg1MTJWTChfVkJNSStWTCB1MTZ4MTYsIGF2eDUxMnZibWksICAgMzJ1
MiksDQogICN1bmRlZiBBVlg1MTJWTF8NCiAgI3VuZGVmIEFWWDUxMlZMDQogICN1bmRlZiBTSU1E
Xw0KLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMNCisrKyBiL3hl
bi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jDQpAQCAtNDkzLDYgKzQ5Myw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZXh0MGYzOF90YWJsZSB7DQogICAgICBbMHg3YSAuLi4gMHg3
Y10gPSB7IC5zaW1kX3NpemUgPSBzaW1kX25vbmUsIC50d29fb3AgPSAxIH0sDQogICAgICBbMHg3
ZCAuLi4gMHg3ZV0gPSB7IC5zaW1kX3NpemUgPSBzaW1kX3BhY2tlZF9pbnQsIC5kOHMgPSBkOHNf
dmwgfSwNCiAgICAgIFsweDdmXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfcGFja2VkX2ZwLCAuZDhz
ID0gZDhzX3ZsIH0sDQorICAgIFsweDgzXSA9IHsgLnNpbWRfc2l6ZSA9IHNpbWRfcGFja2VkX2lu
dCwgLmQ4cyA9IGQ4c192bCB9LA0KICAgICAgWzB4ODhdID0geyAuc2ltZF9zaXplID0gc2ltZF9w
YWNrZWRfZnAsIC50d29fb3AgPSAxLCAuZDhzID0gZDhzX2RxIH0sDQogICAgICBbMHg4OV0gPSB7
IC5zaW1kX3NpemUgPSBzaW1kX3BhY2tlZF9pbnQsIC50d29fb3AgPSAxLCAuZDhzID0gZDhzX2Rx
IH0sDQogICAgICBbMHg4YV0gPSB7IC5zaW1kX3NpemUgPSBzaW1kX3BhY2tlZF9mcCwgLnRvX21l
bSA9IDEsIC50d29fb3AgPSAxLCAuZDhzID0gZDhzX2RxIH0sDQpAQCAtODk5OSw2ICs5MDAwLDEy
IEBAIHg4Nl9lbXVsYXRlKA0KICAgICAgICAgIEFTU0VSVCghc3RhdGUtPnNpbWRfc2l6ZSk7DQog
ICAgICAgICAgYnJlYWs7DQogIA0KKyAgICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4
LCAweDgzKTogLyogdnBtdWx0aXNoaWZ0cWIgW3h5el1tbS9tZW0sW3h5el1tbSxbeHl6XW1te2t9
ICovDQorICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoIWV2ZXgudywgRVhDX1VEKTsNCisg
ICAgICAgIGhvc3RfYW5kX3ZjcHVfbXVzdF9oYXZlKGF2eDUxMl92Ym1pKTsNCisgICAgICAgIGZh
dWx0X3N1cHByZXNzaW9uID0gZmFsc2U7DQorICAgICAgICBnb3RvIGF2eDUxMmZfbm9fc2FlOw0K
Kw0KICAgICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZjM4LCAweDhjKTogLyogdnBtYXNr
bW92e2QscX0gbWVtLHt4LHl9bW0se3gseX1tbSAqLw0KICAgICAgY2FzZSBYODZFTVVMX09QQ19W
RVhfNjYoMHgwZjM4LCAweDhlKTogLyogdnBtYXNrbW92e2QscX0ge3gseX1tbSx7eCx5fW1tLG1l
bSAqLw0KICAgICAgICAgIGdlbmVyYXRlX2V4Y2VwdGlvbl9pZihlYS50eXBlICE9IE9QX01FTSwg
RVhDX1VEKTsNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
