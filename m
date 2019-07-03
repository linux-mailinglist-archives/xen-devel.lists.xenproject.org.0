Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 191135E4C9
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 15:04:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hieuD-0004Pq-6S; Wed, 03 Jul 2019 13:02:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hieuB-0004Pj-NA
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 13:02:35 +0000
X-Inumbo-ID: d2b08ba7-9d92-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d2b08ba7-9d92-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 13:02:34 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 13:02:33 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 13:00:14 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 13:00:12 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3282.namprd18.prod.outlook.com (10.255.138.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 13:00:11 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 13:00:11 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/5] x86/cpuidle: really use C1 for "urgent" CPUs
Thread-Index: AQHVMZ8/Ypvn1rOb/0ed9fyvGVPQHQ==
Date: Wed, 3 Jul 2019 13:00:10 +0000
Message-ID: <d360f174-8cac-1dc8-ef75-844061afb27e@suse.com>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
In-Reply-To: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR08CA0011.eurprd08.prod.outlook.com
 (2603:10a6:5:16::24) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f7a6c57-1d91-4897-3d12-08d6ffb661ae
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3282; 
x-ms-traffictypediagnostic: BY5PR18MB3282:
x-microsoft-antispam-prvs: <BY5PR18MB3282CBA97667BDE55C8298C1B3FB0@BY5PR18MB3282.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(189003)(199004)(6436002)(6506007)(4326008)(66946007)(316002)(5640700003)(66476007)(54906003)(72206003)(36756003)(5660300002)(66066001)(53936002)(486006)(478600001)(6512007)(6916009)(6486002)(2906002)(25786009)(68736007)(31686004)(52116002)(2616005)(11346002)(14454004)(305945005)(64756008)(3846002)(73956011)(80792005)(476003)(66446008)(66556008)(26005)(256004)(71190400001)(71200400001)(2501003)(446003)(7736002)(102836004)(186003)(31696002)(6116002)(99286004)(8936002)(76176011)(81156014)(86362001)(2351001)(81166006)(8676002)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3282;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3mh4tKKXKRpajz29Q1oBMeOSmNI0SlkiljN3q2Wa7efPRm4FHNM/aak5X676pWceeuRMyDbjY3OQINEkp1dRKSxOLWENdaS7tMaHXTjqIwC+/C5xBZZMmlshkusxe++TuetkEhhfpy2VUo5r5lZO7LIdCgcsf9VGuunjWK8KuZX8xfq9D15kjNr9rAMWvi7VCpIwfYLwWAVcUqHKoNashEPbPzU5rOTI3SwfljQt3/fYgP7//Lk0OmvEf1+9Mq21RDTjK/pah+SpZWeCIpy7646Xdt+ItbREknLHHnisisNOP+lcnR/xk6Sh8xIIeeI88UM98dDmiFwBgpQa2umM/ttq6YjR03TLDWkJv5yxWaBCVuj2lSmwqpcnEXiatgicIPul2zfxFt8RRhNEdXdfUxphvDFKxHZ89Hj4wIxv7Ow=
Content-ID: <71BF2B014811CF42A44EC51FF9168F39@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7a6c57-1d91-4897-3d12-08d6ffb661ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 13:00:10.9772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3282
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v2 2/5] x86/cpuidle: really use C1 for "urgent"
 CPUs
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
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9yIG9uZSBvbiByZWNlbnQgQU1EIENQVXMgZW50ZXJpbmcgQzEgKGlmIGF2YWlsYWJsZSBhdCBh
bGwpIHJlcXVpcmVzDQp1c2Ugb2YgTVdBSVQsIHdoaWxlIEhMVCAoaS5lLiBkZWZhdWx0X2lkbGUo
KSkgd291bGQgcHV0IHRoZSBwcm9jZXNzb3INCmludG8gYXMgZGVlcCBhcyBDQzYuIEFuZCB0aGVu
IGV2ZW4gb24gb3RoZXIgdmVuZG9ycycgQ1BVcyB3ZSBzaG91bGQNCmF2b2lkIGVudGVyaW5nIGRl
ZmF1bHRfaWRsZSgpIHdoZW4gdGhlIGludGVuZGVkIHN0YXRlIGNhbiBiZSByZWFjaGVkDQpieSB1
c2luZyB0aGUgYWN0aXZlIGlkbGUgZHJpdmVyJ3MgZmFjaWxpdGllcy4NCg0KU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KUmV2aWV3ZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNCi0tLSBhL3hlbi9hcmNoL3g4Ni9h
Y3BpL2NwdV9pZGxlLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMNCkBAIC01
ODIsMTIgKzU4MiwxNSBAQCBzdGF0aWMgdm9pZCBhY3BpX3Byb2Nlc3Nvcl9pZGxlKHZvaWQpDQog
ICAgICB1MzIgZXhwID0gMCwgcHJlZCA9IDA7DQogICAgICB1MzIgaXJxX3RyYWNlZFs0XSA9IHsg
MCB9Ow0KICANCi0gICAgaWYgKCBtYXhfY3N0YXRlID4gMCAmJiBwb3dlciAmJiAhc2NoZWRfaGFz
X3VyZ2VudF92Y3B1KCkgJiYNCisgICAgaWYgKCBtYXhfY3N0YXRlID4gMCAmJiBwb3dlciAmJg0K
ICAgICAgICAgICAobmV4dF9zdGF0ZSA9IGNwdWlkbGVfY3VycmVudF9nb3Zlcm5vci0+c2VsZWN0
KHBvd2VyKSkgPiAwICkNCiAgICAgIHsNCisgICAgICAgIHVuc2lnbmVkIGludCBtYXhfc3RhdGUg
PSBzY2hlZF9oYXNfdXJnZW50X3ZjcHUoKSA/IEFDUElfU1RBVEVfQzENCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IG1heF9jc3RhdGU7
DQorDQogICAgICAgICAgZG8gew0KICAgICAgICAgICAgICBjeCA9ICZwb3dlci0+c3RhdGVzW25l
eHRfc3RhdGVdOw0KLSAgICAgICAgfSB3aGlsZSAoIGN4LT50eXBlID4gbWF4X2NzdGF0ZSAmJiAt
LW5leHRfc3RhdGUgKTsNCisgICAgICAgIH0gd2hpbGUgKCBjeC0+dHlwZSA+IG1heF9zdGF0ZSAm
JiAtLW5leHRfc3RhdGUgKTsNCiAgICAgICAgICBpZiAoIG5leHRfc3RhdGUgKQ0KICAgICAgICAg
IHsNCiAgICAgICAgICAgICAgaWYgKCBjeC0+dHlwZSA9PSBBQ1BJX1NUQVRFX0MzICYmIHBvd2Vy
LT5mbGFncy5ibV9jaGVjayAmJg0KLS0tIGEveGVuL2FyY2gveDg2L2NwdS9td2FpdC1pZGxlLmMN
CisrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbXdhaXQtaWRsZS5jDQpAQCAtNzI0LDExICs3MjQsMTQg
QEAgc3RhdGljIHZvaWQgbXdhaXRfaWRsZSh2b2lkKQ0KICAJdTY0IGJlZm9yZSwgYWZ0ZXI7DQog
IAl1MzIgZXhwID0gMCwgcHJlZCA9IDAsIGlycV90cmFjZWRbNF0gPSB7IDAgfTsNCiAgDQotCWlm
IChtYXhfY3N0YXRlID4gMCAmJiBwb3dlciAmJiAhc2NoZWRfaGFzX3VyZ2VudF92Y3B1KCkgJiYN
CisJaWYgKG1heF9jc3RhdGUgPiAwICYmIHBvd2VyICYmDQogIAkgICAgKG5leHRfc3RhdGUgPSBj
cHVpZGxlX2N1cnJlbnRfZ292ZXJub3ItPnNlbGVjdChwb3dlcikpID4gMCkgew0KKwkJdW5zaWdu
ZWQgaW50IG1heF9zdGF0ZSA9IHNjaGVkX2hhc191cmdlbnRfdmNwdSgpID8gQUNQSV9TVEFURV9D
MQ0KKwkJCQkJCQkJIDogbWF4X2NzdGF0ZTsNCisNCiAgCQlkbyB7DQogIAkJCWN4ID0gJnBvd2Vy
LT5zdGF0ZXNbbmV4dF9zdGF0ZV07DQotCQl9IHdoaWxlIChjeC0+dHlwZSA+IG1heF9jc3RhdGUg
JiYgLS1uZXh0X3N0YXRlKTsNCisJCX0gd2hpbGUgKGN4LT50eXBlID4gbWF4X3N0YXRlICYmIC0t
bmV4dF9zdGF0ZSk7DQogIAkJaWYgKCFuZXh0X3N0YXRlKQ0KICAJCQljeCA9IE5VTEw7DQogIAkJ
ZWxzZSBpZiAodGJfaW5pdF9kb25lKQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
