Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C322568607
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 11:09:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmwwn-00045R-GP; Mon, 15 Jul 2019 09:07:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hmwwl-00045L-Rc
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 09:06:59 +0000
X-Inumbo-ID: e5c287e5-a6df-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e5c287e5-a6df-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 09:06:57 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 09:06:56 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 08:44:25 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 08:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eopSLYljtQlLX/CSHcskY/PLrFEAm2ZAFnCvS7hwU2lhw+eAC7cYdiQjxh1bSTJ9tW2usPCPo18cKUhUrJj5jmuKamROY7r4rExM5BcscY1jKtOvABcnLsKcROxA1yay5/EYMXLBIoVsjE9CF+5BmGfQbh2nWOtmmXExUSaDNkn/s7CnoedNh22njTRnLClLx0iSahXVLBYhRvfTVyAa8FXzA80zYCHeil5ZdoPVLAIBzJPti0f4lpn0mD7BQZ0ycDFrZfVVj/4jaRE6aSO6qtfpD0SgerQGTXUS9T6Si/AdEvzLhj/qumAtqEad1S6BVRzYsoiqz8dwxmmCzrE/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBrOsPxLtdDQV5wpW2gxPK5RwKKhpbvgvAV+AlwtneM=;
 b=EqMbz/jqG+te69xmwKPJWA3LyQljqiBH7+iKL0dd9n1Vaq5kpMrtmtR1dXE8T8UgVrND6jq2sOucXT6JrRj1aOjT2IqURDaZE8mca9BYt3sKA+3fhW7qICb2nRPaa8ZDsypQ0GByVO2zNtofwT2kak/ntNEd9XEMVXuBfq0dzHxf7cj4RV0N9HE8mlKlQqP5OQT0mh9KHXOvXTkmBtnKhGmZxF0NDsfPkt8uv5zAV/aaTKLfyozWFcoLSzEWHFMIk24Yzw9kHUTgrqGPaBEWMF/jP212tW7fzbsWGuzbJn/P1dS9rkmL+hGYeTOfAQGfYg+0HCnId4jK8J+64oRwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2955.namprd18.prod.outlook.com (20.179.50.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 08:44:23 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 08:44:23 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: =?utf-8?B?UGluZ8KyOiBbUEFUQ0ggNC80XSB4ODYvUFY6IHJlbW92ZSB1bm5lY2Vzc2Fy?=
 =?utf-8?B?eSB0b2dnbGVfZ3Vlc3RfcHQoKSBvdmVyaGVhZA==?=
Thread-Index: AQHVOumArYBldtiar0aSnSi74B4hkg==
Date: Mon, 15 Jul 2019 08:44:23 +0000
Message-ID: <669044b6-5e27-4083-fdda-dea5b24aa70e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:2f::39)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7778208-27bc-4752-870d-08d70900a30b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2955; 
x-ms-traffictypediagnostic: DM6PR18MB2955:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR18MB2955C67CD8802DD9491E6F94B3CF0@DM6PR18MB2955.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(199004)(189003)(5660300002)(256004)(66066001)(14444005)(6116002)(3846002)(4326008)(6436002)(52116002)(102836004)(186003)(26005)(53546011)(6506007)(6486002)(386003)(6916009)(53936002)(31686004)(476003)(2616005)(6512007)(6306002)(2906002)(99286004)(486006)(71190400001)(305945005)(71200400001)(7736002)(36756003)(80792005)(25786009)(81156014)(81166006)(966005)(8936002)(478600001)(54906003)(31696002)(316002)(66446008)(64756008)(66556008)(66476007)(66946007)(68736007)(14454004)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2955;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZC2tTfuHZAWKPhoQ62H8a6jv5gfFnF+sw+Xy6fGTtCrMohGm51UDB61CGQVRfhLSJ5zV6aK5d+mT2miKN37c7/WHNkFA9VSeqPMhhL9Epj5ezI12Zmb8pY258M9mJN7nCYPXOsRBWLLSF5vm94Z9tF1WSFoG4dAx42zB2h+1wlJc8bIuATBX0DxxBK1PpJxS2CT9jF69Tryuh5ubB9oPJ5nEaMmVKGTIbcoz5UweLXZQHSQS6qU0CYNNOB7S/k0sC5tYuWi1uYXq1YtASzUyPw/WKxRMtBZUdNAiMzBvwWBKUAx0xTvpyKca43/ejk+DMMvv92sN8MZQXneieS6jMp9gmWXDD56WN5DbTIT79iAU5ZbGc9Jm/tD97BFO47alcmrxNpgazTu6UEuGMpEow9QgpW+xZYvsKiKBorUc0Yw=
Content-ID: <0AB1D0AFBD45544C87F35410C416B80E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d7778208-27bc-4752-870d-08d70900a30b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 08:44:23.7735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2955
X-OriginatorOrg: suse.com
Subject: [Xen-devel] =?utf-8?q?Ping=C2=B2=3A_=5BPATCH_4/4=5D_x86/PV=3A_rem?=
 =?utf-8?q?ove_unnecessary_toggle=5Fguest=5Fpt=28=29_overhead?=
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA1LjE5IGF0IDExOjI1LCAgd3JvdGU6DQo+Pj4+IE9uIDEzLjAzLjE5IGF0IDEz
OjM5LCAgd3JvdGU6DQo+ID4gV2hpbGUgdGhlIG1lcmUgdXBkYXRpbmcgb2YgLT5wdl9jcjMgYW5k
IC0+cm9vdF9wZ3RfY2hhbmdlZCBhcmVuJ3Qgb3Zlcmx5DQo+ID4gZXhwZW5zaXZlIChidXQgc3Rp
bGwgbmVlZGVkIG9ubHkgZm9yIHRoZSB0b2dnbGVfZ3Vlc3RfbW9kZSgpIHBhdGgpLCB0aGUNCj4g
PiBlZmZlY3Qgb2YgdGhlIGxhdHRlciBvbiB0aGUgZXhpdC10by1ndWVzdCBwYXRoIGlzIG5vdCBp
bnNpZ25pZmljYW50Lg0KPiA+IE1vdmUgdGhlIGxvZ2ljIGludG8gdG9nZ2xlX2d1ZXN0X21vZGUo
KS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQo+IA0KPiBJIHRoaW5rIEkgZGlkIGFkZHJlc3MgdGhlIG9uZSBjb25jZXJuIHlvdSBoYWQu
DQo+IA0KPiBKYW4NCg0KaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDE5LTA0L21zZzAwMzA2Lmh0bWwNClBpbmc/DQoNCj4gPiAtLS0gYS94ZW4v
YXJjaC94ODYvcHYvZG9tYWluLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvcHYvZG9tYWluLmMN
Cj4gPiBAQCAtMzQ5LDE4ICszNDksMTAgQEAgYm9vbCBfX2luaXQgeHB0aV9wY2lkX2VuYWJsZWQo
dm9pZCkNCj4gPiAgDQo+ID4gIHN0YXRpYyB2b2lkIF90b2dnbGVfZ3Vlc3RfcHQoc3RydWN0IHZj
cHUgKnYpDQo+ID4gIHsNCj4gPiAtICAgIGNvbnN0IHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21h
aW47DQo+ID4gLSAgICBzdHJ1Y3QgY3B1X2luZm8gKmNwdV9pbmZvID0gZ2V0X2NwdV9pbmZvKCk7
DQo+ID4gICAgICB1bnNpZ25lZCBsb25nIGNyMzsNCj4gPiAgDQo+ID4gICAgICB2LT5hcmNoLmZs
YWdzIF49IFRGX2tlcm5lbF9tb2RlOw0KPiA+ICAgICAgdXBkYXRlX2NyMyh2KTsNCj4gPiAtICAg
IGlmICggZC0+YXJjaC5wdi54cHRpICkNCj4gPiAtICAgIHsNCj4gPiAtICAgICAgICBjcHVfaW5m
by0+cm9vdF9wZ3RfY2hhbmdlZCA9IHRydWU7DQo+ID4gLSAgICAgICAgY3B1X2luZm8tPnB2X2Ny
MyA9IF9fcGEodGhpc19jcHUocm9vdF9wZ3QpKSB8DQo+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgIChkLT5hcmNoLnB2LnBjaWQgPyBnZXRfcGNpZF9iaXRzKHYsIHRydWUpIDogMCk7DQo+
ID4gLSAgICB9DQo+ID4gIA0KPiA+ICAgICAgLyoNCj4gPiAgICAgICAqIERvbid0IGZsdXNoIHVz
ZXIgZ2xvYmFsIG1hcHBpbmdzIGZyb20gdGhlIFRMQi4gRG9uJ3QgdGljayBUTEIgY2xvY2suDQo+
ID4gQEAgLTM2OCwxNSArMzYwLDExIEBAIHN0YXRpYyB2b2lkIF90b2dnbGVfZ3Vlc3RfcHQoc3Ry
dWN0IHZjcHUNCj4gPiAgICAgICAqIEluIHNoYWRvdyBtb2RlLCB0aG91Z2gsIHVwZGF0ZV9jcjMo
KSBtYXkgbmVlZCB0byBiZSBhY2NvbXBhbmllZCBieSBhDQo+ID4gICAgICAgKiBUTEIgZmx1c2gg
KGZvciBqdXN0IHRoZSBpbmNvbWluZyBQQ0lEKSwgYXMgdGhlIHRvcCBsZXZlbCBwYWdlIHRhYmxl
IA0KPiA+IG1heQ0KPiA+ICAgICAgICogaGF2ZSBjaGFuZ2VkIGJlaGluZCBvdXIgYmFja3MuIFRv
IGJlIG9uIHRoZSBzYWZlIHNpZGUsIHN1cHByZXNzIHRoZQ0KPiA+IC0gICAgICogbm8tZmx1c2gg
dW5jb25kaXRpb25hbGx5IGluIHRoaXMgY2FzZS4gVGhlIFhQVEkgQ1IzIHdyaXRlLCBpZiANCj4g
PiBlbmFibGVkLA0KPiA+IC0gICAgICogd2lsbCB0aGVuIG5lZWQgdG8gYmUgYSBmbHVzaGluZyBv
bmUgdG9vLg0KPiA+ICsgICAgICogbm8tZmx1c2ggdW5jb25kaXRpb25hbGx5IGluIHRoaXMgY2Fz
ZS4NCj4gPiAgICAgICAqLw0KPiA+ICAgICAgY3IzID0gdi0+YXJjaC5jcjM7DQo+ID4gLSAgICBp
ZiAoIHNoYWRvd19tb2RlX2VuYWJsZWQoZCkgKQ0KPiA+IC0gICAgew0KPiA+ICsgICAgaWYgKCBz
aGFkb3dfbW9kZV9lbmFibGVkKHYtPmRvbWFpbikgKQ0KPiA+ICAgICAgICAgIGNyMyAmPSB+WDg2
X0NSM19OT0ZMVVNIOw0KPiA+IC0gICAgICAgIGNwdV9pbmZvLT5wdl9jcjMgJj0gflg4Nl9DUjNf
Tk9GTFVTSDsNCj4gPiAtICAgIH0NCj4gPiAgICAgIHdyaXRlX2NyMyhjcjMpOw0KPiA+ICANCj4g
PiAgICAgIGlmICggISh2LT5hcmNoLmZsYWdzICYgVEZfa2VybmVsX21vZGUpICkNCj4gPiBAQCAt
MzkyLDYgKzM4MCw4IEBAIHN0YXRpYyB2b2lkIF90b2dnbGVfZ3Vlc3RfcHQoc3RydWN0IHZjcHUN
Cj4gPiAgDQo+ID4gIHZvaWQgdG9nZ2xlX2d1ZXN0X21vZGUoc3RydWN0IHZjcHUgKnYpDQo+ID4g
IHsNCj4gPiArICAgIGNvbnN0IHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21haW47DQo+ID4gKw0K
PiA+ICAgICAgQVNTRVJUKCFpc19wdl8zMmJpdF92Y3B1KHYpKTsNCj4gPiAgDQo+ID4gICAgICAv
KiAlZnMvJWdzIGJhc2VzIGNhbiBvbmx5IGJlIHN0YWxlIGlmIFdSe0ZTLEdTfUJBU0UgYXJlIHVz
YWJsZS4gKi8NCj4gPiBAQCAtNDA1LDYgKzM5NSwyMSBAQCB2b2lkIHRvZ2dsZV9ndWVzdF9tb2Rl
KHN0cnVjdCB2Y3B1ICp2KQ0KPiA+ICAgICAgYXNtIHZvbGF0aWxlICggInN3YXBncyIgKTsNCj4g
PiAgDQo+ID4gICAgICBfdG9nZ2xlX2d1ZXN0X3B0KHYpOw0KPiA+ICsNCj4gPiArICAgIGlmICgg
ZC0+YXJjaC5wdi54cHRpICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBzdHJ1Y3QgY3B1X2lu
Zm8gKmNwdV9pbmZvID0gZ2V0X2NwdV9pbmZvKCk7DQo+ID4gKw0KPiA+ICsgICAgICAgIGNwdV9p
bmZvLT5yb290X3BndF9jaGFuZ2VkID0gdHJ1ZTsNCj4gPiArICAgICAgICBjcHVfaW5mby0+cHZf
Y3IzID0gX19wYSh0aGlzX2NwdShyb290X3BndCkpIHwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKGQtPmFyY2gucHYucGNpZCA/IGdldF9wY2lkX2JpdHModiwgdHJ1ZSkgOiAwKTsN
Cj4gPiArICAgICAgICAvKg0KPiA+ICsgICAgICAgICAqIEFzIGluIF90b2dnbGVfZ3Vlc3RfcHQo
KSB0aGUgWFBUSSBDUjMgd3JpdGUgbmVlZHMgdG8gYmUgYSBUTEItDQo+ID4gKyAgICAgICAgICog
Zmx1c2hpbmcgb25lIHRvbyBmb3Igc2hhZG93IG1vZGUgZ3Vlc3RzLg0KPiA+ICsgICAgICAgICAq
Lw0KPiA+ICsgICAgICAgIGlmICggc2hhZG93X21vZGVfZW5hYmxlZChkKSApDQo+ID4gKyAgICAg
ICAgICAgIGNwdV9pbmZvLT5wdl9jcjMgJj0gflg4Nl9DUjNfTk9GTFVTSDsNCj4gPiArICAgIH0N
Cj4gPiAgfQ0KPiA+ICANCj4gPiAgdm9pZCB0b2dnbGVfZ3Vlc3RfcHQoc3RydWN0IHZjcHUgKnYp
DQo+ID4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
