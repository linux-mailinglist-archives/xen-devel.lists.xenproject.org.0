Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7BABB5D3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 15:55:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCOlu-0003i5-Ec; Mon, 23 Sep 2019 13:52:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dNMU=XS=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iCOls-0003i0-Gu
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 13:52:56 +0000
X-Inumbo-ID: 7154f594-de09-11e9-b299-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::703])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7154f594-de09-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 13:52:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Toppn3S3lTQ+Mnqxm7YpybydrJRzRt+ld6fHRELDvZdUAnJg9nYN8Q8bB/7cnoZyR0oUrevxg1D17Y8MWXu45dv1+IuY6/rTw7iyhe3hJfCyk2rVFEK+XfttGOuGRe45pKnaMIF8ZZc7fYerUIUATUgZBW9fcP7EjMtOiqfiFAGGn8/NYY/On23iXUcx/+AK6Ggb/AcnqP7qoRfHDL6EUAQde/0dU+wft+ecBV3G+resv8Sd5ZXPYmtKx69ii+ZPIXJzTeDvDvrjqjgaJV425Uhybe2/gJUvGJDAHxfw8+XLpy+Nn4GEvJ+NNLjssCraLPr8SE8+Vu8vOOmyZVIMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8q+8RTFhgrDaT7GapWBzD9QmJ9JPwfYKOJ1ECUvW9Pg=;
 b=UfhvkfBgj6oWjbGdKxnzbFL3DiCNXqU8uFsakYul5fPH+1/1f/smZohg9oJa+CxKCht9h6ujpya+1iv3mtPE/tw4DSf2Ruoo2sHWYytVWHLPBfY0Mn4UE/5SSPaMat7z0AwvWereWvodiRSk4Ql/t4peQLaVFMAAMJqgQsgkGU9qW2ivz7gbnpWC7SWpjpTMj951uQ3cdLbk+YeKI0OyRz3359TKsIMKHPqVCIZUhn6KtmlzqyZR44kEaWw6Iv5+yVFq4TW0I5taxXFFSjdj5OdNNHtQkqhS3ymq/W9N780pFEW5uMoVDzstAGAAmit3kgUQOi4afpmoN1J62OuhRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8q+8RTFhgrDaT7GapWBzD9QmJ9JPwfYKOJ1ECUvW9Pg=;
 b=NOqPF10nYccNA6UofKZpOpp8r08fw5ZqEmLIXKdhubDXJuiHU2IVg3a01TiTM1Sx61jo8o7CEMiJDwImw98UK+Hg8GMFinugJnRv4BLLL4q/cOD+2j+GF/X9WCNiuSecR3bzlWhisqOPZvTvPhFTgc33/+xPJ2TbcxZF94S4G+Q=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5784.eurprd02.prod.outlook.com (10.141.172.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.21; Mon, 23 Sep 2019 13:52:54 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 13:52:54 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v13] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVcgc/RjZRGBRqJUWCjIFeFraK9Kc5RdcAgAACfIA=
Date: Mon, 23 Sep 2019 13:52:53 +0000
Message-ID: <a7fbd8ff-d0ce-a881-7e9b-e01c85b4ef02@bitdefender.com>
References: <20190923120539.25242-1-aisaila@bitdefender.com>
 <ec3b6788-a354-f0bf-0d62-0f7a116bc435@suse.com>
In-Reply-To: <ec3b6788-a354-f0bf-0d62-0f7a116bc435@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0202CA0002.eurprd02.prod.outlook.com
 (2603:10a6:200:89::12) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edcac405-eced-40f0-fdbc-08d7402d54d2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5784; 
x-ms-traffictypediagnostic: AM7PR02MB5784:|AM7PR02MB5784:|AM7PR02MB5784:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB57846EABC00E2FDBFAA305B2AB850@AM7PR02MB5784.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(376002)(136003)(396003)(366004)(189003)(199004)(51914003)(8676002)(66476007)(64756008)(66446008)(66556008)(6486002)(5660300002)(66946007)(8936002)(54906003)(476003)(2616005)(11346002)(31696002)(81156014)(316002)(86362001)(81166006)(6506007)(6916009)(53546011)(386003)(2906002)(305945005)(66066001)(71190400001)(71200400001)(7736002)(446003)(14454004)(478600001)(186003)(25786009)(99286004)(6246003)(256004)(14444005)(6512007)(36756003)(26005)(52116002)(4326008)(31686004)(3846002)(6116002)(76176011)(229853002)(6436002)(486006)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5784;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4E5lUOi49wgmKkcfeoX/qUVR6KgSqd3tatYSR9ha7V23q24LdbmgiViz3TymznevcW6v6k+L/2aojxb8L6VF0OFeBXqgcpzU7An7RtkF6deJiSDttBXufnzLYmwcF0bjwxqXQAVup+Eqb/nRLf5tNtPrIbfdr3098G/5uxAXCCaqF1YdIh/Qr+xyDNUe7M3U0C6VbcxQveNXqpzGSPZBTCfdbgPBS1FvqoHgz6++UXIJrjCNGC9DnhASJU64cn44WeKtfiXutTJVF5yOlOCsMeeyTwxVQnWajIY2Jc9UH3IWG2oCoB62ZseyaYIE0pVwDukp9IAIWu55r58rKtDlVcfHjFh9sfzeUzikYsgLKLduZqKjf2zqoZiQuAhMZ2W8I7mAqr/4ZpHOi39LVnxUmM0IMPLr0KTgfeZQodC2znA=
Content-ID: <275513C593FD8540979C3FA509EB9DB6@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edcac405-eced-40f0-fdbc-08d7402d54d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 13:52:53.8555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dawyAihpSS0Hhy1nGQAjS2m69Ip3S/zZbiOaLrBmFdoL8E7Ci66RfQcqdqcb7DH8rzOc1g60ASfAUClmcqu9TtLy6bA04LGQUOywjl3UbO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5784
Subject: Re: [Xen-devel] [PATCH v13] x86/emulate: Send vm_event from emulate
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
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDIzLjA5LjIwMTkgMTY6NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wOS4y
MDE5IDE0OjA1LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IEBAIC01OTksOCAr
NjAwLDE1IEBAIHN0YXRpYyB2b2lkICpodm1lbXVsX21hcF9saW5lYXJfYWRkcigNCj4+ICAgICAg
ICAgICAgICAgZXJyID0gTlVMTDsNCj4+ICAgICAgICAgICAgICAgZ290byBvdXQ7DQo+PiAgIA0K
Pj4gLSAgICAgICAgY2FzZSBIVk1UUkFOU19nZm5fcGFnZWRfb3V0Og0KPj4gKyAgICAgICAgY2Fz
ZSBIVk1UUkFOU19uZWVkX3JldHJ5Og0KPj4gKyAgICAgICAgICAgIC8qDQo+PiArICAgICAgICAg
ICAgICogaHZtX3RyYW5zbGF0ZV9nZXRfcGFnZSgpIGRvZXMgbm90IHJldHVybiBIVk1UUkFOU19u
ZWVkX3JldHJ5Lg0KPj4gKyAgICAgICAgICAgICAqIEl0IGNhbiBkcm9wcGVkIGlmIGZ1dHVyZSB3
b3JrIHJlcXVpcmVzIHRoaXMuDQo+PiArICAgICAgICAgICAgICovDQo+IA0KPiBUbyBtZSwgIml0
IiBpbiB0aGlzIGNvbW1lbnQgY2FuIG9ubHkgcmVmZXIgdG8gc29tZXRoaW5nIG1lbnRpb25lZCBp
bg0KPiB0aGUgcHJpb3Igc2VudGVuY2UuIEJ1dCB0byBiZSBob25lc3QgSSdkIGRyb3AgdGhlIDJu
ZCBzZW50ZW5jZQ0KPiBhbHRvZ2V0aGVyLCBhZGRpbmcgImN1cnJlbnRseSIgdG8gdGhlIDFzdCBv
bmUuIChTYW1lIGZ1cnRoZXIgZG93bg0KPiB0aGVuLikNCj4gDQo+PiArICAgICAgICAgICAgQVNT
RVJUX1VOUkVBQ0hBQkxFKCk7DQo+PiArICAgICAgICAgICAgLyogZmFsbCB0aHJvdWdoICovDQo+
PiAgICAgICAgICAgY2FzZSBIVk1UUkFOU19nZm5fc2hhcmVkOg0KPj4gKyAgICAgICAgY2FzZSBI
Vk1UUkFOU19nZm5fcGFnZWRfb3V0Og0KPj4gICAgICAgICAgICAgICBlcnIgPSBFUlJfUFRSKH5Y
ODZFTVVMX1JFVFJZKTsNCj4+ICAgICAgICAgICAgICAgZ290byBvdXQ7DQo+IA0KPiBJdCBhbHNv
IGVzY2FwZXMgbWUgd2h5IHlvdSBmZWx0IGxpa2UgbW92aW5nIHRoZQ0KPiAiY2FzZSBIVk1UUkFO
U19nZm5fcGFnZWRfb3V0OiIgbGluZS4NCj4gDQo+PiBAQCAtMTg1MiwxOSArMTg3MCwyNyBAQCBz
dGF0aWMgaW50IGh2bWVtdWxfcmVwX21vdnMoDQo+PiAgIA0KPj4gICAgICAgeGZyZWUoYnVmKTsN
Cj4+ICAgDQo+PiAtICAgIGlmICggcmMgPT0gSFZNVFJBTlNfZ2ZuX3BhZ2VkX291dCApDQo+PiAt
ICAgICAgICByZXR1cm4gWDg2RU1VTF9SRVRSWTsNCj4+IC0gICAgaWYgKCByYyA9PSBIVk1UUkFO
U19nZm5fc2hhcmVkICkNCj4+IC0gICAgICAgIHJldHVybiBYODZFTVVMX1JFVFJZOw0KPj4gLSAg
ICBpZiAoIHJjICE9IEhWTVRSQU5TX29rYXkgKQ0KPj4gKyAgICBzd2l0Y2ggKCByYyApDQo+PiAg
ICAgICB7DQo+PiAtICAgICAgICBnZHByaW50ayhYRU5MT0dfV0FSTklORywgIkZhaWxlZCBtZW1v
cnktdG8tbWVtb3J5IFJFUCBNT1ZTOiBzZ3BhPSUiDQo+PiAtICAgICAgICAgICAgICAgICBQUklw
YWRkciIgZGdwYT0lIlBSSXBhZGRyIiByZXBzPSVsdSBieXRlc19wZXJfcmVwPSV1XG4iLA0KPj4g
LSAgICAgICAgICAgICAgICAgc2dwYSwgZGdwYSwgKnJlcHMsIGJ5dGVzX3Blcl9yZXApOw0KPj4g
LSAgICAgICAgcmV0dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxFOw0KPj4gKyAgICBjYXNlIEhWTVRS
QU5TX25lZWRfcmV0cnk6DQo+PiArICAgICAgICAvKg0KPj4gKyAgICAgICAgICogaHZtX2NvcHlf
dG9fZ3Vlc3RfcGh5cygpIGRvZXMgbm90IHJldHVybiBIVk1UUkFOU19uZWVkX3JldHJ5Lg0KPj4g
KyAgICAgICAgICogSXQgY2FuIGRyb3BwZWQgaWYgZnV0dXJlIHdvcmsgcmVxdWlyZXMgdGhpcy4N
Cj4+ICsgICAgICAgICAqLw0KPiANCj4gVW5saWtlIGluIGl0cyByZXBfc3RvcyBjb3VudGVycGFy
dCwgaGVyZSB0aGUgcmV0dXJuIHZhbHVlIG1heSBjb21lDQo+IGZyb20gaHZtX2NvcHlfZnJvbV9n
dWVzdF9waHlzKCkgb3IgaHZtX2NvcHlfdG9fZ3Vlc3RfcGh5cygpLCBhbmQgSQ0KPiB0aGluayB0
aGUgY29tbWVudCBzaG91bGQgbm90IHNheSBvdGhlcndpc2UuDQo+IA0KPiBXaXRoIHRoZXNlIGNo
YW5nZXMgKHdoaWNoIGFyZSBvZiBlbm91Z2ggb2YgYSBjb3NtZXRpYyBuYXR1cmUgdGhhdA0KPiB0
aGV5IGNvdWxkIHByb2JhYmx5IGJlIHRha2VuIGNhcmUgb2Ygd2hpbGUgY29tbWl0dGluZywgcHJv
dmlkZWQNCj4geW91IGFncmVlKSwgbm9uLW1vbml0b3Itc3BlY2lmaWMgcGFydHMNCj4gUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQoNCkkgYWdyZWUsIHRo
YW5rcyBmb3IgdGhlIHJldmlldyBhbmQgdGhlIGhlbHAgd2l0aCB0aGlzIHBhdGNoDQoNCkFsZXgN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
