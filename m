Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B635BEA6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 16:49:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhxZ4-0004NF-0h; Mon, 01 Jul 2019 14:45:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QKbV=U6=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hhxZ3-0004NA-58
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 14:45:53 +0000
X-Inumbo-ID: ebbb77ae-9c0e-11e9-8980-bc764e045a96
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::71f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ebbb77ae-9c0e-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIc4SvURItr82GgM2VKbP/Gbr2RDdfZhOgbRZBN01VQ=;
 b=miI5N2LXWZ0Nrtw/0MTd4MxVyquNXLd8p3viz1sYYk6Id1FHVj7LTd3Bb3cIo1Nsg6Ww/jvMjcXYAQlgdzmBsuEVqgMkHa/aH4yTACTh2qTBq49R+M/7mzJeSuTQrN3c4twhLvkSNN1RJQgq/H9YyjZJptiYR5QIN3zpCXHs52E=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3421.eurprd02.prod.outlook.com (52.134.16.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 14:45:48 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd50:3e97:1d64:5aa3]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd50:3e97:1d64:5aa3%4]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 14:45:48 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v5] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMA7WPzdd4ckrE0m6/AH0OcBhs6a11zaA
Date: Mon, 1 Jul 2019 14:45:48 +0000
Message-ID: <0b12721c-8820-7227-1079-0bd1f5587287@bitdefender.com>
References: <fb2a4d3e-b477-11a5-7b5e-4a236acd60dd@suse.com>
In-Reply-To: <fb2a4d3e-b477-11a5-7b5e-4a236acd60dd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0010.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::22)
 To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 228fc993-822f-4455-0a0b-08d6fe32ce5a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3421; 
x-ms-traffictypediagnostic: VI1PR0202MB3421:|VI1PR0202MB3421:
x-microsoft-antispam-prvs: <VI1PR0202MB34218B53358A64EE22E35FA2ABF90@VI1PR0202MB3421.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(39860400002)(396003)(346002)(366004)(199004)(189003)(25786009)(102836004)(5660300002)(6506007)(4326008)(52116002)(386003)(6246003)(31696002)(86362001)(66066001)(99286004)(53546011)(36756003)(31686004)(76176011)(11346002)(486006)(53936002)(6916009)(476003)(446003)(7416002)(14444005)(256004)(186003)(6512007)(6486002)(6436002)(478600001)(26005)(229853002)(68736007)(2906002)(14454004)(316002)(7736002)(305945005)(6116002)(66946007)(73956011)(3846002)(71190400001)(71200400001)(64756008)(66556008)(66476007)(66446008)(81166006)(54906003)(8676002)(81156014)(8936002)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3421;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R2i2/b2Rg/3e8M8tv63UAd/qNc4ZsUl9fQ2jzPnSPv5zKyMzRDf25DEcNHSIONJ1be3yav/mL33kKQOMt82apA73RParSn4UuOynkAFoUo8Wp6L7ATycxxTkDgjwy+KE73IUgk9FcPpxt5zxhTZCL+PzUmqThIZ5UJH8PbvUudBWO5wx9q2KaN8zipaoS9b/eApHneTixNW6HIAh9N73Y24sM+wXqhtf//1mb31IfZgrkIZyL/HPA/QIMxq/suSMs1VdLt0YP+T5ppHRw+cIEHPiT0qlOpqgBeQp4rtzGJFMJfwVwLyszaRg7g6gMCk/GcIzk9fcCrbMK4Fk0MS03+GsTwkAxXPtMM7LLsoC+BBpF3172UcqBBoISn3w2eE980GvA+HmOp5jO3DY+a99P2nJcz0LHpczyeihkT6fLRQ=
Content-ID: <99CE58F86425A7488FD2F2ACE4CB8CAF@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 228fc993-822f-4455-0a0b-08d6fe32ce5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 14:45:48.6793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3421
Subject: Re: [Xen-devel] [PATCH v5] x86/emulate: Send vm_event from emulate
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "brian.woods@amd.com" <brian.woods@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDAxLjA3LjIwMTkgMTY6MTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAwNC4w
Ni4xOSBhdCAxMzo0OSwgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToNCj4+IFRoaXMg
cGF0Y2ggYWltcyB0byBoYXZlIG1lbSBhY2Nlc3Mgdm0gZXZlbnRzIHNlbnQgZnJvbSB0aGUgZW11
bGF0b3IuDQo+PiBUaGlzIGlzIHVzZWZ1bCB3aGVyZSB3ZSB3YW50IHRvIG9ubHkgZW11bGF0ZSBh
IHBhZ2Ugd2FsayB3aXRob3V0DQo+PiBjaGVja2luZyB0aGUgRVBULCBidXQgd2Ugc3RpbGwgd2Fu
dCB0byBjaGVjayB0aGUgRVBUIHdoZW4gZW11bGF0aW5nDQo+PiB0aGUgaW5zdHJ1Y3Rpb24gdGhh
dCBjYXVzZWQgdGhlIHBhZ2Ugd2Fsay4gSW4gdGhpcyBjYXNlLCB0aGUgb3JpZ2luYWwNCj4+IEVQ
VCBmYXVsdCBpcyBjYXVzZWQgYnkgdGhlIHdhbGsgdHJ5aW5nIHRvIHNldCB0aGUgYWNjZXNzZWQg
b3IgZGlydHkNCj4+IGJpdHMsIGJ1dCBleGVjdXRpbmcgdGhlIGluc3RydWN0aW9uIGl0c2VsZiBt
aWdodCBhbHNvIGNhdXNlIGFuIEVQVA0KPj4gZmF1bHQgaWYgcGVybWl0dGVkIHRvIHJ1biwgYW5k
IHRoaXMgc2Vjb25kIGZhdWx0IHNob3VsZCBub3QgYmUgbG9zdC4NCj4gDQo+IEknbSBhZnJhaWQg
SSBzdGlsbCBjYW4ndCB0cmFuc2xhdGUgdGhpcyBpbnRvIHdoYXQgZXhhY3RseSBpcyB3YW50ZWQg
YW5kDQo+IHdoeS4gV2hpbGUgdHlwaWNhbGx5IHdlIGRvbid0IHVzZSBleGFtcGxlcyB0byBkZW1v
bnN0cmF0ZSB0aGF0IGlzDQo+IHdhbnRlZCBpbiBjb21taXQgbWVzc2FnZXMsIEkgdGhpbmsgdGhp
cyBpcyBhIHJhdGhlciBnb29kIGNhbmRpZGF0ZQ0KPiBmb3IgYWN0dWFsbHkgdXNpbmcgc3VjaCBh
biBhcHByb2FjaC4gVGhpcyBtYXkgdGhlbiAuLi4NCj4gDQo+PiBXZSB1c2UgaHZtZW11bF9tYXBf
bGluZWFyX2FkZHIoKSB0byBpbnRlcmNlcHQgci93IGFjY2VzcyBhbmQNCj4+IF9faHZtX2NvcHko
KSB0byBpbnRlcmNlcHQgZXhlYyBhY2Nlc3MuDQo+Pg0KPj4gRmlyc3Qgd2UgdHJ5IHRvIHNlbmQg
YSB2bSBldmVudCBhbmQgaWYgdGhlIGV2ZW50IGlzIHNlbnQgdGhlbiBlbXVsYXRpb24NCj4+IHJl
dHVybnMgWDg2RU1VTF9SRVRSWSBpbiBvcmRlciB0byBzdG9wIGVtdWxhdGlvbiBvbiBpbnN0cnVj
dGlvbnMgdGhhdA0KPj4gdXNlIGFjY2VzcyBwcm90ZWN0ZWQgcGFnZXMuIElmIHRoZSBldmVudCBp
cyBub3Qgc2VudCB0aGVuIHRoZQ0KPj4gZW11bGF0aW9uIGdvZXMgb24gYXMgZXhwZWN0ZWQuDQo+
IA0KPiAuLi4gYWxzbyBoZWxwIHVuZGVyc3RhbmRpbmcgdGhpcyBwYXJ0LCB3aGljaCBJIGNvbnRp
bnVlIHRvIGJlIGNvbmZ1c2VkDQo+IGJ5LCB0b28uDQo+IA0KPj4gQEAgLTUzMCw2ICs1MzIsNTcg
QEAgc3RhdGljIGludCBodm1lbXVsX2RvX21taW9fYWRkcihwYWRkcl90IG1taW9fZ3BhLA0KPj4g
ICAgICAgcmV0dXJuIGh2bWVtdWxfZG9faW9fYWRkcigxLCBtbWlvX2dwYSwgcmVwcywgc2l6ZSwg
ZGlyLCBkZiwgcmFtX2dwYSk7DQo+PiAgIH0NCj4+ICAgDQo+PiArYm9vbCBodm1fZW11bGF0ZV9z
ZW5kX3ZtX2V2ZW50KHVuc2lnbmVkIGxvbmcgZ2xhLCBnZm5fdCBnZm4sDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHBmZWMsIGJvb2wgc2VuZF9ldmVudCkNCj4+
ICt7DQo+PiArICAgIHhlbm1lbV9hY2Nlc3NfdCBhY2Nlc3M7DQo+PiArICAgIHZtX2V2ZW50X3Jl
cXVlc3RfdCByZXEgPSB7fTsNCj4+ICsgICAgcGFkZHJfdCBncGEgPSAoKGdmbl94KGdmbikgPDwg
UEFHRV9TSElGVCkgfCAoZ2xhICYgflBBR0VfTUFTSykpOw0KPiANCj4gZ2ZuX3RvX2dhZGRyKCkN
Cg0KSSB3aWxsIHVzZSB0aGF0DQoNCj4gDQo+PiArICAgIGlmICggIXNlbmRfZXZlbnQgfHwgIXBm
ZWMgKQ0KPj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiANCj4gSSB0aGluayBJJ3ZlIHNhaWQg
YmVmb3JlIHRoYXQgdGhlICFwZmVjIHBhcnQgbmVlZCBhbiBleHBsYW5hdGlvbiAoaW4NCj4gYSBj
b21tZW50KS4gV2l0aG91dCBzdWNoIGFuIGV4cGxhbmF0aW9uIEknbSBpbmNsaW5lZCB0byBzYXkg
aXQNCj4gc2hvdWxkIGJlIGRlbGV0ZWQuIElmIG90b2ggdGhpcyBpcyBzaW1wbHkgbWVhbiB0byBi
ZSBhIHNob3J0Y3V0LA0KPiB0aGVuIHlvdSBzaG91bGQgcmVhbGx5IGp1c3QgY2hlY2sgdGhlIHR3
byBiaXRzIHlvdSBhY3R1YWxseSBjYXJlDQo+IGFib3V0IGZ1cnRoZXIgZG93bi4NCg0KVGhlIHBm
ZWMgY2hlY2sgaXMgZG9uZSBiZWNhdXNlIEkgZW5jb3VudGVyZWQgcGZlYyAwIGluIHRlc3RzLiBJ
dCBjb3VsZCANCnNhdmUgc29tZSB3b3JrIGlmIHBmZWMgPT0gMCB3aGVuIGNhbGxpbmcgdGhlIGZ1
bmN0aW9uLiBJcyB0aGVyZQ0KYSBtdXN0IGluIGhhdmluZyB0aGlzIGNoZWNrIHJlbW92ZWQ/IElm
IHNvIHRoZW4gaXQgY2FuIGJlIGRvbmUuIFRoZSANCnNlbmRfZXZlbnQgd2lsbCBiZSBjaGVja2Vk
IGJlZm9yZSBjYWxsaW5nIHRoZSBmdW5jdGlvbiBhcyB5b3Ugc2FpZC4NCg0KPiANCj4gU2ltaWxh
cmx5IEkgdGhpbmsgSSd2ZSBzYWlkIGJlZm9yZSB0aGF0IEknbSBub3QgaGFwcHkgZm9yIHRoZSBj
b21tb24NCj4gY2FzZSB0byBub3cgYmUgdG8gY2FsbCBpbnRvIGhlcmUganVzdCB0byBiYWlsIGJh
Y2sgb3V0ICh3aGVuIFZNDQo+IGV2ZW50cyBhcmUgZGlzYWJsZWQgb24gYSBndWVzdCkuIElPVyBJ
IGRvbid0IHRoaW5rIHlvdSBzaG91bGQgY2FsbA0KPiBpbnRvIHRoaXMgZnVuY3Rpb24gaW4gdGhl
IGZpcnN0IHBsYWNlIHdoZW4gInNlbmRfZXZlbnQiIGlzIGZhbHNlLg0KPiANCj4+ICsgICAgaWYg
KCBwMm1fZ2V0X21lbV9hY2Nlc3MoY3VycmVudC0+ZG9tYWluLCBnZm4sICZhY2Nlc3MsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsdHAybV92Y3B1X2lkeChjdXJyZW50KSkgIT0g
MCApDQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+PiArDQo+PiArICAgIHN3aXRjaCAoIGFj
Y2VzcyApIHsNCj4gDQo+IFN0eWxlLg0KPiANCj4+ICsgICAgY2FzZSBYRU5NRU1fYWNjZXNzX3g6
DQo+PiArICAgIGNhc2UgWEVOTUVNX2FjY2Vzc19yeDoNCj4+ICsgICAgICAgIGlmICggcGZlYyAm
IFBGRUNfd3JpdGVfYWNjZXNzICkNCj4+ICsgICAgICAgICAgICByZXEudS5tZW1fYWNjZXNzLmZs
YWdzID0gTUVNX0FDQ0VTU19SIHwgTUVNX0FDQ0VTU19XOw0KPj4gKyAgICAgICAgYnJlYWs7DQo+
PiArDQo+PiArICAgIGNhc2UgWEVOTUVNX2FjY2Vzc193Og0KPj4gKyAgICBjYXNlIFhFTk1FTV9h
Y2Nlc3Nfcnc6DQo+PiArICAgICAgICBpZiAoIHBmZWMgJiBQRkVDX2luc25fZmV0Y2ggKQ0KPj4g
KyAgICAgICAgICAgIHJlcS51Lm1lbV9hY2Nlc3MuZmxhZ3MgPSBNRU1fQUNDRVNTX1g7DQo+PiAr
ICAgICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAgY2FzZSBYRU5NRU1fYWNjZXNzX3I6DQo+PiAr
ICAgIGNhc2UgWEVOTUVNX2FjY2Vzc19uOg0KPj4gKyAgICAgICAgaWYgKCBwZmVjICYgUEZFQ193
cml0ZV9hY2Nlc3MgKQ0KPj4gKyAgICAgICAgICAgIHJlcS51Lm1lbV9hY2Nlc3MuZmxhZ3MgfD0g
TUVNX0FDQ0VTU19SIHwgTUVNX0FDQ0VTU19XOw0KPj4gKyAgICAgICAgaWYgKCBwZmVjICYgUEZF
Q19pbnNuX2ZldGNoICkNCj4+ICsgICAgICAgICAgICByZXEudS5tZW1fYWNjZXNzLmZsYWdzIHw9
IE1FTV9BQ0NFU1NfWDsNCj4+ICsgICAgICAgIGJyZWFrOw0KPj4gKw0KPj4gKyAgICBkZWZhdWx0
Og0KPj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiANCj4gSSB0aGluayBpdCB3b3VsZCBiZSBt
b3JlIGZ1dHVyZSBwcm9vZiB0byBub3QgaGF2ZSBhIGRlZmF1bHQgY2FzZQ0KPiBoZXJlOiBXaGVu
IGEgbmV3IGFjY2VzcyBlbnVtZXJhdG9yIGdldHMgaW50cm9kdWNlZCwgbW9zdA0KPiBjb21waWxl
cnMgd291bGQgdGVsbCB0aGUgZGV2ZWxvcGVyIHJpZ2h0IGF3YXkgdGhhdCB0aGlzIG5ldw0KPiBl
bnVtZXJhdG9yIHZhbHVlIG5lZWRzIGFjdGl2ZWx5IGhhbmRsaW5nIGhlcmUuDQoNCkkgd2lsbCBj
dXQgdGhlIGRlZmF1bHQgY2FzZSBhbmQgdHJlYXQgYWxsIG9mIHRoZSBlbnVtIG1lbWJlcnMuDQoN
Cj4gDQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgaWYgKCAhcmVxLnUubWVtX2FjY2Vzcy5mbGFn
cyApDQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7IC8qIG5vIHZpb2xhdGlvbiAqLw0KPiANCj4g
SG93IGlzIHRoZSAiZmFsc2UiIGhlcmUgKEkgdGhpbmsgdGhpcyBpcyB0aGUgb25lIHRoZSBkZXNj
cmlwdGlvbiB0YWxrcw0KPiBhYm91dCkgbWF0Y2hpbmcgdXAgd2l0aCB0aGUgdmFyaW91cyBvdGhl
ciBvbmVzIGluIHRoZSBmdW5jdGlvbj8NCg0KVGhlcmUgc2hvdWxkIGJlIG5vIGV2ZW50IGlmIHRo
ZXJlIGlzIG5vIGFjY2VzcyB2aW9sYXRpb24uIFNvIGluIHRoaXMgDQpjYXNlIHRoZSBlbXVsYXRp
b24gaXMgY29udGludWVkIGFzIGV4cGVjdGVkLg0KDQo+IA0KPj4gQEAgLTYxNSw2ICs2NjksMTMg
QEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKA0KPj4gICANCj4+ICAgICAg
ICAgICBpZiAoIHBmZWMgJiBQRkVDX3dyaXRlX2FjY2VzcyApDQo+PiAgICAgICAgICAgew0KPj4g
KyAgICAgICAgICAgIGlmICggaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudChhZGRyLCBnZm4sIHBm
ZWMsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh2bWVt
dWxfY3R4dC0+c2VuZF9ldmVudCkgKQ0KPj4gKyAgICAgICAgICAgIHsNCj4+ICsgICAgICAgICAg
ICAgICAgZXJyID0gRVJSX1BUUih+WDg2RU1VTF9SRVRSWSk7DQo+PiArICAgICAgICAgICAgICAg
IGdvdG8gb3V0Ow0KPj4gKyAgICAgICAgICAgIH0NCj4gDQo+IEhvdyBjb21lIHRoaXMgc2l0cyBv
bmx5IG9uIHRoZSB3cml0ZSBwYXRoPw0KDQpXZSBhcmUgaW50ZXJlc3RlZCBvbmx5IGZvciB0aGUg
d3JpdGUgYWNjZXNzIG9uIHRoaXMgcGF0aC4gVGhpcyBhbHNvIA0KZW5zdXJlcyB0aGF0IHBmZWMg
aXMgc2V0Lg0KDQo+IA0KPj4gQEAgLTExMTUsNyArMTE3Niw4IEBAIHN0YXRpYyBpbnQgbGluZWFy
X3JlYWQodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBpbnQgYnl0ZXMsIHZvaWQgKnBfZGF0
YSwNCj4+ICAgICAgICAqIGNsZWFuIHVwIGFueSBpbnRlcmltIHN0YXRlLg0KPj4gICAgICAgICov
DQo+PiAgICAgICBpZiAoICFodm1lbXVsX2ZpbmRfbW1pb19jYWNoZSh2aW8sIGFkZHIsIElPUkVR
X1JFQUQsIGZhbHNlKSApDQo+PiAtICAgICAgICByYyA9IGh2bV9jb3B5X2Zyb21fZ3Vlc3RfbGlu
ZWFyKHBfZGF0YSwgYWRkciwgYnl0ZXMsIHBmZWMsICZwZmluZm8pOw0KPj4gKyAgICAgICAgcmMg
PSBodm1fY29weV9mcm9tX2d1ZXN0X2xpbmVhcihwX2RhdGEsIGFkZHIsIGJ5dGVzLCBwZmVjLCAm
cGZpbmZvLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBodm1l
bXVsX2N0eHQtPnNlbmRfZXZlbnQpOw0KPiANCj4gSSdtIG5vdCB2ZXJ5IGhhcHB5IHRvIHNlZSB0
aGlzIG5ldyBwYXJhbWV0ZXIvYXJndW1lbnQgYWRkaXRpb24uDQo+IERpZCB5b3UgY29uc2lkZXIg
cHV0dGluZyB0aGUgZmxhZyBvZiBpbnRlcmVzdCBlbHNld2hlcmUgKGludG8gYQ0KPiBzdHJ1Y3R1
cmUgaGFuZ2luZyBvZmYgb2YgY3VycmVudCwgb3IgaW50byBwYWdlZmF1bHRfaW5mb190KT8NCj4g
DQo+IEZ1cnRoZXJtb3JlLCBpZiB0aGUgcGFyYW1ldGVyIGlzIHJlYWxseSB1bmF2b2lkYWJsZSwg
dGhlbiBwbGVhc2UNCj4gc2VwYXJhdGUgdGhlIG1lY2hhbmljcyBvZiBpbnRyb2R1Y2luZyBpdCBm
cm9tIHRoZSBhY3R1YWwgY2hhbmdlDQo+IHlvdSdyZSBhZnRlci4NCg0KSSBjb3VsZCBtb3ZlIHRo
ZSBmbGFnIHRvIHZjcHUuYXJjaC52bV9ldmVudC5zZW5kX2V2ZW50Lg0KDQo+IA0KPj4gQEAgLTI2
MjksNyArMjY5Miw3IEBAIHZvaWQgaHZtX2VtdWxhdGVfaW5pdF9wZXJfaW5zbigNCj4+ICAgICAg
ICAgICAgICAgIGh2bV9jb3B5X2Zyb21fZ3Vlc3RfbGluZWFyKGh2bWVtdWxfY3R4dC0+aW5zbl9i
dWYsIGFkZHIsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
aXplb2YoaHZtZW11bF9jdHh0LT5pbnNuX2J1ZiksDQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwZmVjIHwgUEZFQ19pbnNuX2ZldGNoLA0KPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMKSA9PSBIVk1UUkFOU19va2F5KSA/
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwsIGZhbHNl
KSA9PSBIVk1UUkFOU19va2F5KSA/DQo+IA0KPiBJZiB5b3UgcGFzcyBmYWxzZSBoZXJlLCB3aGF0
J3MgdGhlIHBvaW50IG9mIGhhbmRsaW5nIGluc24gZmV0Y2hlcw0KPiBpbiB0aGUgbmV3IGZ1bmN0
aW9uIHlvdSBhZGQ/DQoNClRoaXMgaXMgYSBnb29kIHF1ZXN0aW9uLiBCeSBsb29raW5nIGF0IHRo
ZSBmbG93IEkgdGhpbmsgSSBzaG91bGQgdXNlIA0KY2FsbCB0aGUgc2VuZF9ldmVudCBoZXJlIGFs
c28uIEFzc3VtaW5nIHRoYXQgaGF2aW5nIA0KaHZtZW11bF9jdHh0LT5pbnNuX2J1Zl9ieXRlcyA9
IDAgaWYgdGhlIGV2ZW50IHdhcyBzZW5kIGlzIGVub3VnaCB0byBoYXZlIA0KdGhlIGVtdWxhdGlv
biBzdG9wIHRoZW4gSSB3aWxsIGdpdmUgdGhpcyBhIHRlc3QuDQoNClRoYW5rcywNCkFsZXgNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
