Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F26F931536
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 21:22:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWn2v-0006hF-2W; Fri, 31 May 2019 19:18:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lynN=T7=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1hWn2t-0006gi-20
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 19:18:31 +0000
X-Inumbo-ID: dee0b239-83d8-11e9-8980-bc764e045a96
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::70f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dee0b239-83d8-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 19:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector1-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDEdG/9qFDO1/zCY10/Iu/xlBx6d8qyS+L7sgorfG9E=;
 b=gpGWN/gJF6vStSIK5N/WYuvn6Jsyeyicp4f3KetCzKs/q60ragJRpUm9CWcEzCTAeWqQnnS0nhdokgU90CjQDjnTVZRuLD+wz3lheNjBCqrfNwmJBuUiXX+W8pRxHhIfgCklO0rrstdrOpv1NiN2beu0kthm3Mpl9RxQcX6YHGE=
Received: from AM6PR06MB4503.eurprd06.prod.outlook.com (20.177.36.155) by
 AM6PR06MB6133.eurprd06.prod.outlook.com (20.179.244.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Fri, 31 May 2019 19:18:27 +0000
Received: from AM6PR06MB4503.eurprd06.prod.outlook.com
 ([fe80::c0a9:b083:8490:fd5e]) by AM6PR06MB4503.eurprd06.prod.outlook.com
 ([fe80::c0a9:b083:8490:fd5e%6]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 19:18:27 +0000
From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] booting domU guest as pvh works in xen-4.11.1 but
 fails in 4.12
Thread-Index: AQHU9FeD113I0DfAJUePnpXO0i/0gqY/bGGAgEZ2KoA=
Date: Fri, 31 May 2019 19:18:26 +0000
Message-ID: <alpine.LFD.2.21.1905312010270.2763@austen3.home>
References: <CAHnBbQ8u+MywkV4+qmxhkA8216knGhGZjcy1Sz6Ukv3=PJZmXQ@mail.gmail.com>
 <293280a7-5011-e5a1-da53-80587b7b9a94@citrix.com>
 <alpine.DEB.2.11.1904162258280.33856@procyon.dur.ac.uk>
In-Reply-To: <alpine.DEB.2.11.1904162258280.33856@procyon.dur.ac.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Alpine 2.21 (LFD 202 2017-01-01)
x-originating-ip: [2a00:23c4:9208:400:c49a:db08:8036:b390]
x-clientproxiedby: LO2P265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::25) To AM6PR06MB4503.eurprd06.prod.outlook.com
 (2603:10a6:20b:12::27)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=m.a.young@durham.ac.uk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-x-sender: michael@austen3.home
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad6701c3-ba17-4908-4483-08d6e5fcc197
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR06MB6133; 
x-ms-traffictypediagnostic: AM6PR06MB6133:
x-microsoft-antispam-prvs: <AM6PR06MB6133C385BE4BEB411675A80087190@AM6PR06MB6133.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:644;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(396003)(366004)(346002)(39860400002)(189003)(199004)(58126008)(102836004)(478600001)(25786009)(66446008)(6506007)(7736002)(8676002)(5660300002)(786003)(74482002)(6116002)(71200400001)(256004)(6436002)(386003)(86362001)(14444005)(229853002)(71190400001)(486006)(81166006)(66476007)(54906003)(11346002)(9686003)(66946007)(52116002)(6486002)(46003)(305945005)(68736007)(8936002)(186003)(76176011)(64756008)(99286004)(53346004)(53936002)(6246003)(14454004)(446003)(36756003)(476003)(6512007)(316002)(2906002)(73956011)(6916009)(4326008)(66556008)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR06MB6133;
 H:AM6PR06MB4503.eurprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: durham.ac.uk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sNkAgO4kyyvrO+2Km9Tmd5ce6SMAQvpLM88TsUgLcDne7q4ZjkqCkdMZvF8rY+C+HlC8SYjzSWhrxpr5twr1yBPYDBDuG3dLBmIrhDYJVF8Yjyh2z508REF59ufp2pEQOExrjBLpslRyYV5dnfcK9apWogJogN4KDNGHbIl6Usxn3cufUcEAwZTup+vm+NbCRK6npyitx/uvE/XgXS5nzHuuu5RyvVrlxYkiNCEV/S77CSqzemTovP6Y85msMKC2SKx3ie6OEWV7Je/bXRLAvq6kmzLkivTrWjP+1mDtMuJnoP9kLfL1pv3hVx1VN3KVrb/damiGAsuaMLbipuOG/yNo67Z9035S2SAzEefYf5EYMpfGvQDtwSgMlTRCfm5vrWFoAKcTIMgNkudzfoZLHqxWULBRB/FjkajLgjsmcx0=
Content-ID: <D90DA2BDF890E241A12BF5E786D627D7@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6701c3-ba17-4908-4483-08d6e5fcc197
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 19:18:26.9175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dcl0may@durham.ac.uk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB6133
Subject: Re: [Xen-devel] booting domU guest as pvh works in xen-4.11.1 but
 fails in 4.12
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Pry Mar <pryorm09@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNiBBcHIgMjAxOSwgTSBBIFlvdW5nIHdyb3RlOg0KDQo+IE9uIFR1ZSwgMTYgQXBy
IDIwMTksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+DQo+PiBGcm9tIHRoZSBsb2c6DQo+Pg0KPj4g
dHJhcHM6IG1vZHByb2JlWzQ4XSB0cmFwIGludmFsaWQgb3Bjb2RlIGlwOjdmNzk3ZGM3YmI5NSBz
cDo3ZmZlMzA5OWNkYjggZXJybw0KPj4gcjowIGluIGxkLTIuMjkuc29bN2Y3OTdkYzYxMDAwKzIx
MDAwXQ0KPj4NCj4+DQo+PiBDYW4geW91IGRpc2Fzc2VtYmxlIGxkLTIuMjkuc28gYW5kIGZpbmQg
b3V0IHdoYXQgdGhhdCBpbnN0cnVjdGlvbiBpcz/CoCBJdCBpcw0KPj4gYWxtb3N0IGNlcnRhaW5s
eSBhIHJlbGF0ZWQgZmFjdG9yLg0KPg0KPiBJIGdldCBsaW5lcyBsaWtlDQo+IFsgICAgMS4zODQz
NTZdIHRyYXBzOiBtb2Rwcm9iZVszNl0gdHJhcCBpbnZhbGlkIG9wY29kZSBpcDo3ZjU3NDQ4YWYx
NzkNCj4gc3A6N2ZmZjhmYzNhOTM4IGVycm9yOjAgaW4gbGQtMi4yOS5zb1s3ZjU3NDQ4OTUwMDAr
MjAwMDBdDQo+DQo+IEkgYW0gZ3Vlc3NpbmcgdGhlIHJpZ2h0IHBsYWNlIHRvIGxvb2sgaW4gbGQt
Mi4yOS5zbyBpcw0KPiAweDdmNTc0NDhhZjE3OS0weDdmNTc0NDg5NTAwMDAtMjAwMDAgPSA4Njg3
MyBpbiB3aGljaCBjYXNlIEkgZ2V0DQo+IChnZGIpIHgvMTBpIDg2ODczDQo+ICAgMHgxNTM1OSA8
X2RsX2Nsb3NlX3dvcmtlciszNTkzPjoJbW92ICAgICglcnNpLCVyY3gsOCksJXI4DQo+ICAgMHgx
NTM1ZCA8X2RsX2Nsb3NlX3dvcmtlciszNTk3PjoJdGVzdGIgICQweDIwLDB4MzFkKCVyOCkNCj4g
ICAweDE1MzY1IDxfZGxfY2xvc2Vfd29ya2VyKzM2MDU+OglqbmUgICAgMHgxNTM3NQ0KPiA8X2Rs
X2Nsb3NlX3dvcmtlciszNjIxPg0KPiAgIDB4MTUzNjcgPF9kbF9jbG9zZV93b3JrZXIrMzYwNz46
CWNtcCAgICAlZWN4LCVlZHgNCj4gICAweDE1MzY5IDxfZGxfY2xvc2Vfd29ya2VyKzM2MDk+Oglq
ZSAgICAgMHgxNTM3Mg0KPiA8X2RsX2Nsb3NlX3dvcmtlciszNjE4Pg0KPiAgIDB4MTUzNmIgPF9k
bF9jbG9zZV93b3JrZXIrMzYxMT46CW1vdiAgICAlZWR4LCVyOWQNCj4gICAweDE1MzZlIDxfZGxf
Y2xvc2Vfd29ya2VyKzM2MTQ+Ogltb3YgICAgJXI4LCglcnNpLCVyOSw4KQ0KPiAgIDB4MTUzNzIg
PF9kbF9jbG9zZV93b3JrZXIrMzYxOD46CWFkZCAgICAkMHgxLCVlZHgNCj4gICAweDE1Mzc1IDxf
ZGxfY2xvc2Vfd29ya2VyKzM2MjE+OglhZGQgICAgJDB4MSwlcmN4DQo+ICAgMHgxNTM3OSA8X2Rs
X2Nsb3NlX3dvcmtlciszNjI1PjoJY21wICAgICVlY3gsJWVheA0KPg0KPiBTb21lIG1vcmUgbGlu
ZXMgbGlrZSB0aGlzIGFyZQ0KPiBbICAgIDEuNTcxNDc5XSB0cmFwczogbW9kcHJvYmVbNDFdIHRy
YXAgaW52YWxpZCBvcGNvZGUgaXA6N2YzZTM2MjhkMTc5DQo+IHNwOjdmZmM4NmFiYmUwOCBlcnJv
cjowIGluIGxkLTIuMjkuc29bN2YzZTM2MjczMDAwKzIwMDAwXQ0KPiBbICAgIDEuNjMwNTYyXSB0
cmFwczogbW9kcHJvYmVbNDNdIHRyYXAgaW52YWxpZCBvcGNvZGUgaXA6N2YyMjdiMzlhMTc5DQo+
IHNwOjdmZmRmZDk0MzE5OCBlcnJvcjowIGluIGxkLTIuMjkuc29bN2YyMjdiMzgwMDAwKzIwMDAw
XQ0KPiB3aGljaCBhbGwgc2VlbSB0byBnZXQgdG8gdGhlIHNhbWUgcGxhY2UuIElzIHRoaXMgdXNl
ZnVsIG9yIGFtIEkgbG9va2luZyBpbg0KPiB0aGUgd3JvbmcgcGxhY2U/DQoNCkkgZGlkIGEgYmlz
ZWN0IG9uIHRoaXMgaXNzdWUsIGFuZCBpdCBpZGVudGlmaWVkIHRoZSBmaXJzdCBiYWQgY29tbWl0
IGFzIA0KZmQzMmRjZmU0YzlhNTM5ZjhlNWQyNmZmNGM1Y2E1MGVlNTQ1NTZiMg0KeDg2L3ZteDog
RG9uJ3QgbGVhayBFRkVSLk5YRSBpbnRvIGd1ZXN0IGNvbnRleHQNCg0KIAlNaWNoYWVsIFlvdW5n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
