Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A8CB501F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 16:14:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAECN-0007uX-CR; Tue, 17 Sep 2019 14:11:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=biJV=XM=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iAECM-0007uM-Cn
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 14:11:18 +0000
X-Inumbo-ID: 03c043f2-d955-11e9-a337-bc764e2007e4
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.139]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03c043f2-d955-11e9-a337-bc764e2007e4;
 Tue, 17 Sep 2019 14:11:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sulu0OOTEVtoxks2LGXrsA7YFPCZHPHj1C8rDIeg2JslrtvC5FSHmpggmJ7/GKm8sc04WZgeggDaqJPnlOSN6Vsp2VnW5qS0B6MYLy3yKX9w3WviubyxS38Cpd5mpVH24TgsjLNeJlHABotxZWPlTIAmvu7hbxeRECWOqHAF9NW5YqFgZLRmyvhlr5cfF1/xXJx2Vqx0alArGVf6tbP1IY4a56t8yqtkxZWUnuJrgqZOfdyAhpzXsTgZSDoyVSExTtwGnvo0SbYlSNIvDN6H0GWLsxNFF+8WoyJkH93lF56zW+sSxfp4/leXlFXeGaeJkNy+vXJvnspEG9qcOf5Zog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSU7H9IjGY4nf8E+du8f7Am0AXRoQDbqLGjV6l5SdW0=;
 b=QHgDP9QegxG6AeHVT3a6uGE9VR0oDKOyBP58lQ6zrvu9oQaj9ixmMHNV6foLWwUZ1jmYjm9BdHsB6rCmQvMxYiUJrGWk8r178qoF7XXxuG89indVJollm9jnvCls/2o9Rb/b8AJJc2L2wP9RtmPH74Qil1MEMy1omFjIt7u6HX4NUQ/PPCp3DpxmSrtBsH24+9ZMrmIUKjweZ9REFvCK7YpWbcPlomzpOB70+DVbGJzH/jgBq/qunZZ93juBupir09ulKx373j0i+12tIa3IIrXKnUXE7cSBOsul4s6SMymvUlmoXpFg6d4ccfNO61svGt+TPTCqzbDDHx3Qf/4XBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSU7H9IjGY4nf8E+du8f7Am0AXRoQDbqLGjV6l5SdW0=;
 b=RYGLEHKJ+yYWogv6poIdoBVQ3lO4W3e4+jCish36/ngIZ50Arl9wrWfb/qBvhV2L4OkbtaYCLpXBgc661DyJTW0j9B3xYKYEjBHsjOxIq/l6EvZV7FY0G7cqj79DzLYdpZE5P6PerdJk9crJs6kNGbMritNNTnULZpU4V0dH5jA=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5861.eurprd02.prod.outlook.com (10.141.172.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Tue, 17 Sep 2019 14:11:16 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 14:11:15 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVbGY5LYraxeTPu06yM6Qe3Haip6cudlQAgAEKjgCAAATfAIAAZPcA
Date: Tue, 17 Sep 2019 14:11:15 +0000
Message-ID: <65dcce1f-e73a-230d-83bd-271b6312bc48@bitdefender.com>
References: <20190916081024.20931-1-aisaila@bitdefender.com>
 <18854b5e-8e1a-298f-672f-ccc93b5b3a2a@suse.com>
 <3f252f60-6f72-6025-d4dc-d82077e43691@bitdefender.com>
 <f791ad24-a106-1cf6-2ff8-53adca03b1d5@suse.com>
In-Reply-To: <f791ad24-a106-1cf6-2ff8-53adca03b1d5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MRXP264CA0019.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::31) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 761576d3-2d48-45bf-41eb-08d73b78e723
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM7PR02MB5861; 
x-ms-traffictypediagnostic: AM7PR02MB5861:|AM7PR02MB5861:|AM7PR02MB5861:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB58611A7181E78BCDEB34AE8FAB8F0@AM7PR02MB5861.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(366004)(346002)(39860400002)(376002)(199004)(189003)(229853002)(14444005)(52116002)(53546011)(256004)(86362001)(66476007)(316002)(66556008)(64756008)(6486002)(36756003)(5660300002)(66446008)(66946007)(2616005)(476003)(4326008)(31696002)(305945005)(8936002)(446003)(14454004)(478600001)(66066001)(25786009)(6246003)(76176011)(81166006)(386003)(71200400001)(102836004)(6436002)(8676002)(6116002)(81156014)(6916009)(54906003)(11346002)(486006)(2906002)(3846002)(71190400001)(186003)(7736002)(26005)(6506007)(99286004)(6512007)(31686004)(3714002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5861;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MhtLTixf2OBDdFBa/nJ6B8UZKStjFmptaN7VdI0zORLoO5+FulPuuRRJnIn6HmcBRFdBxtHoXfMR7j3gQxEUNsZjpuq6VqjHjUeRlPd8zbm1Y6VM+9KeH+h4RTRlJgTReiIJZHKXVOdUlf2ape9UdueE9Emt3eHXJXKP0LUE7OVv0w3HQxCk+hfKaBPMSxKcGLrZesj1QqH9fL1uEcTJwlQOwC7ncIBniNzepOVhb4oMthriiVXX7AH9Fg/1h3BUS27SoqZEvPzvIPovaWqgFjfArX184lfAZnrHbb36UD+66u4P8XHDfn0/kyNYrxhoWhH2vbz+1Y5SdwRDlbYrFt8o4S1uCvhTGvc6D3uHt2gtfIhsDdoWI46+6Lsw0+y7sQ93abPVIF380sb5Dmm4FuWvqrPIxuyffAhWB/oKz/M=
Content-ID: <B59FA1BCB6BEC34ABE618C908A9940E7@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 761576d3-2d48-45bf-41eb-08d73b78e723
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 14:11:15.8067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WYNwlOw2o4dBro98Gx/45oGUcEw685DvEMkF0cb1lpaAeIhkcbawDvBtQnwbABDcPMUWJNyOB7VmW5Y7uFOmMSbcL4BfKP6MuoWeLc/lbs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5861
Subject: Re: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
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

DQoNCk9uIDE3LjA5LjIwMTkgMTE6MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4wOS4y
MDE5IDA5OjUyLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IE9uIDE2LjA5LjIw
MTkgMTg6NTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE2LjA5LjIwMTkgMTA6MTAsIEFs
ZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZt
L2h2bS5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4+Pj4gQEAgLTMyMjQs
NiArMzIyNCwxNCBAQCBzdGF0aWMgZW51bSBodm1fdHJhbnNsYXRpb25fcmVzdWx0IF9faHZtX2Nv
cHkoDQo+Pj4+ICAgICAgICAgICAgICAgIHJldHVybiBIVk1UUkFOU19iYWRfZ2ZuX3RvX21mbjsN
Cj4+Pj4gICAgICAgICAgICB9DQo+Pj4+ICAgIA0KPj4+PiArICAgICAgICBpZiAoIHVubGlrZWx5
KHYtPmFyY2gudm1fZXZlbnQpICYmDQo+Pj4+ICsgICAgICAgICAgICAgdi0+YXJjaC52bV9ldmVu
dC0+c2VuZF9ldmVudCAmJg0KPj4+PiArICAgICAgICAgICAgIGh2bV9tb25pdG9yX2NoZWNrX3Ay
bShhZGRyLCBnZm4sIHBmZWMsIG5wZmVjX2tpbmRfd2l0aF9nbGEpICkNCj4+Pj4gKyAgICAgICAg
ew0KPj4+PiArICAgICAgICAgICAgcHV0X3BhZ2UocGFnZSk7DQo+Pj4+ICsgICAgICAgICAgICBy
ZXR1cm4gSFZNVFJBTlNfZ2ZuX3BhZ2VkX291dDsNCj4+Pg0KPj4+IEknbSBzb3JyeSwgYnV0IHRo
ZXJlIGlzIF9zdGlsbF8gbm8gY29tbWVudCBuZXh0IHRvIHRoaXMgYXBwYXJlbnQNCj4+PiBtaXMt
dXNlIG9mIEhWTVRSQU5TX2dmbl9wYWdlZF9vdXQuDQo+Pg0KPj4gSSB3aWxsIGFkZCB0aGlzIGNv
bW1lbnQgaGVyZToNCj4+DQo+PiAiLyoNCj4+ICAgICAqIEluIGNhc2UgYSB2bSBldmVudCB3YXMg
c2VudCByZXR1cm4gcGFnZWRfb3V0IHNvIHRoZSBlbXVsYXRpb24gd2lsbA0KPj4gICAgICogc3Rv
cCB3aXRoIG5vIHNpZGUgZWZmZWN0DQo+PiAgICAgKi8iDQo+IA0KPiBGaXJzdCBvZiBhbGwgLSB3
aHkgIndhcyBzZW50Ij8gVGhlIGV2ZW50IGlzIHlldCB0byBiZSBzZW50LCBpc24ndCBpdD8NCg0K
WWVzIGl0IHNob3VsZCBzdGF0ZSAiaWYgdGhlIGV2ZW50IGlzIHNlbnQiLg0KDQo+IEFuZCB0aGVu
IEknbSBhZnJhaWQgdGhpcyBzdGlsbCBpc24ndCBlbm91Z2guIF9faHZtX2NvcHkoKSBnZXRzIHVz
ZWQNCj4gZm9yIG1hbnkgcHVycG9zZXMuIEZvciBleGFtcGxlLCB3aGlsZSBsb29raW5nIGludG8g
dGhpcyBhZ2FpbiB3aGVuDQo+IHByZXBhcmluZyB0aGUgcmVwbHkgaGVyZSwgSSd2ZSBub3RpY2Vk
IHRoYXQgYWJvdmUgeW91IG1heSB3cm9uZ2x5DQo+IGNhbGwgaHZtX21vbml0b3JfY2hlY2tfcDJt
KCkgd2l0aCBucGZlY19raW5kX3dpdGhfZ2xhIC0gdGhlcmUncyBubw0KPiBsaW5lYXIgYWRkcmVz
cyB3aGVuIEhWTUNPUFlfbGluZWFyIGlzIG5vdCBzZXQuIElmLCB3aGlsZSBwdXR0aW5nDQoNCllv
dSBhcmUgcmlnaHQsIGEgY2hlY2sgZm9yIEhWTUNPUFlfbGluZWFyIHNob3VsZCBnbyBpbiB0aGUg
aWYgc28gd2UgYXJlIA0Kc3VyZSB0aGF0IGl0IGlzIGNhbGxlZCB3aXRoIGEgbGluZWFyIGFkZHJl
c3Mgb25seS4NCg0KPiB0b2dldGhlciB3aGF0IHRoZSBjb21tZW50IG5lZWRzIHRvIGV4cGxhaW4g
KGkuZS4gZXZlcnl0aGluZyB0aGF0DQo+IGNhbid0IGJlIGltcGxpZWQgZnJvbSB0aGUgY29kZSB5
b3UgYWRkKSwgeW91IGNvbnNpZGVyZWQgYWxsIGNhc2VzDQo+IHlvdSBzaG91bGQgaGF2ZSBub3Rp
Y2VkIHRoaXMgeW91cnNlbGYuDQoNCldpdGggdGhpcyBuZXcgY2hlY2sgaW4gcGxhY2UgKEhWTUNP
UFlfbGluZWFyKSBfX2h2bV9jb3B5KCkgd2lsbCBiZSANCmNhbGxlZCBmcm9tIGxpbmVhcl9yZWFk
KCkgbGluZWFyX3dyaXRlKCkgd2hlcmUgaXQgd2lsbCBwYXNzIGRvd24gDQpYODZFTVVMX1JFVFJZ
Lg0KDQpUaGUgY29tbWVudCBjYW4gY2hhbmdlIHRvOg0KIklmIGEgZXZlbnQgaXMgc2VudCByZXR1
cm4gcGFnZWRfb3V0LiBUaGUgZW11bGF0aW9uIHdpbGwgaGF2ZSBubyBzaWRlIA0KZWZmZWN0IGFu
ZCB3aWxsIHJldHVybiBYODZFTVVMX1JFVFJZIg0KDQo+IA0KPj4+PiBAQCAtMjE1LDYgKzIxNyw3
OSBAQCB2b2lkIGh2bV9tb25pdG9yX2ludGVycnVwdCh1bnNpZ25lZCBpbnQgdmVjdG9yLCB1bnNp
Z25lZCBpbnQgdHlwZSwNCj4+Pj4gICAgICAgIG1vbml0b3JfdHJhcHMoY3VycmVudCwgMSwgJnJl
cSk7DQo+Pj4+ICAgIH0NCj4+Pj4gICAgDQo+Pj4+ICsvKg0KPj4+PiArICogU2VuZCBtZW1vcnkg
YWNjZXNzIHZtX2V2ZW50cyBiYXNlZCBvbiBwZmVjLiBSZXR1cm5zIHRydWUgaWYgdGhlIGV2ZW50
IHdhcw0KPj4+PiArICogc2VudCBhbmQgZmFsc2UgZm9yIHAybV9nZXRfbWVtX2FjY2VzcygpIGVy
cm9yLCBubyB2aW9sYXRpb24gYW5kIGV2ZW50IHNlbmQNCj4+Pj4gKyAqIGVycm9yLiBBc3N1bWVz
IHRoZSBjYWxsZXIgd2lsbCBjaGVjayBhcmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50Lg0KPj4+PiAr
ICoNCj4+Pj4gKyAqIE5PVEU6IHAybV9nZXRfbWVtX2FjY2VzcygpIGNhbiBmYWlsIGlmIHRoZSBl
bnRyeSB3YXMgbm90IGZvdW5kIGluIHRoZSBFUFQNCj4+Pj4gKyAqIChpbiB3aGljaCBjYXNlIGFj
Y2VzcyB0byBpdCBpcyB1bnJlc3RyaWN0ZWQsIHNvIG5vIHZpb2xhdGlvbnMgY2FuIG9jY3VyKS4N
Cj4+Pj4gKyAqIEluIHRoaXMgY2FzZXMgaXQgaXMgZmluZSB0byBjb250aW51ZSB0aGUgZW11bGF0
aW9uLg0KPj4+PiArICovDQo+Pj4NCj4+PiBJIHRoaW5rIHRoaXMgcGFydCBvZiB0aGUgY29tbWVu
dCB3b3VsZCBiZXR0ZXIgZ28gLi4uDQo+Pj4NCj4+Pj4gK2Jvb2wgaHZtX21vbml0b3JfY2hlY2tf
cDJtKHVuc2lnbmVkIGxvbmcgZ2xhLCBnZm5fdCBnZm4sIHVpbnQzMl90IHBmZWMsDQo+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCBraW5kKQ0KPj4+PiArew0KPj4+PiAr
ICAgIHhlbm1lbV9hY2Nlc3NfdCBhY2Nlc3M7DQo+Pj4+ICsgICAgdm1fZXZlbnRfcmVxdWVzdF90
IHJlcSA9IHt9Ow0KPj4+PiArICAgIHBhZGRyX3QgZ3BhID0gKGdmbl90b19nYWRkcihnZm4pIHwg
KGdsYSAmIH5QQUdFX01BU0spKTsNCj4+Pj4gKw0KPj4+PiArICAgIEFTU0VSVChjdXJyZW50LT5h
cmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50KTsNCj4+Pj4gKw0KPj4+PiArICAgIGN1cnJlbnQtPmFy
Y2gudm1fZXZlbnQtPnNlbmRfZXZlbnQgPSBmYWxzZTsNCj4+Pj4gKw0KPj4+PiArICAgIGlmICgg
cDJtX2dldF9tZW1fYWNjZXNzKGN1cnJlbnQtPmRvbWFpbiwgZ2ZuLCAmYWNjZXNzLA0KPj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsdHAybV92Y3B1X2lkeChjdXJyZW50KSkgIT0g
MCApDQo+Pj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4+Pg0KPj4+IC4uLiBuZXh0IHRvIHRo
ZSBjYWxsIGhlcmUgKGJ1dCB0aGUgbWFpbnRhaW5lcnMgb2YgdGhlIGZpbGUgd291bGQNCj4+PiBo
YXZlIHRvIGp1ZGdlIGluIHRoZSBlbmQpLiBUaGF0IHNhaWQsIEkgY29udGludWUgdG8gbm90IHVu
ZGVyc3RhbmQNCj4+PiB3aHkgYSBub3QgZm91bmQgZW50cnkgbWVhbnMgdW5yZXN0cmljdGVkIGFj
Y2Vzcy4gSXNuJ3QgaXQNCj4+PiAtPmRlZmF1bHRfYWNjZXNzIHdoaWNoIGNvbnRyb2xzIHdoYXQg
c3VjaCBhICJ2aXJ0dWFsIiBlbnRyeSB3b3VsZA0KPj4+IHBlcm1pdD8NCj4+DQo+PiBJJ20gc29y
cnkgZm9yIHRoaXMgbWlzbGVhZGluZyBjb21tZW50LiBUaGUgY29kZSBzdGF0ZXMgdGhhdCBpZiBl
bnRyeSB3YXMNCj4+IG5vdCBmb3VuZCB0aGUgYWNjZXNzIHdpbGwgYmUgZGVmYXVsdF9hY2Nlc3Mg
YW5kIHJldHVybiAwLiBTbyBpbiB0aGlzDQo+PiBjYXNlIHRoZSBkZWZhdWx0X2FjY2VzcyB3aWxs
IGJlIGNoZWNrZWQuDQo+Pg0KPj4gLyogSWYgcmVxdWVzdCB0byBnZXQgZGVmYXVsdCBhY2Nlc3Mu
ICovDQo+PiBpZiAoIGdmbl9lcShnZm4sIElOVkFMSURfR0ZOKSApDQo+PiB7DQo+PiAgICAgICAq
YWNjZXNzID0gbWVtYWNjZXNzW3AybS0+ZGVmYXVsdF9hY2Nlc3NdOw0KPj4gICAgICAgcmV0dXJu
IDA7DQo+PiB9DQo+Pg0KPj4gSWYgdGhpcyBjbGVhcnMgdGhpbmcgdXAgSSBjYW4gcmVtb3ZlIHRo
ZSAiTk9URSIgcGFydCBpZiB0aGUgY29tbWVudC4NCj4gDQo+IEknbSBhZnJhaWQgaXQgZG9lc24n
dCBjbGVhciB0aGluZ3MgdXA6IEknbSBzdGlsbCBsb3N0IGFzIHRvIHdoeQ0KPiAiZW50cnkgbm90
IGZvdW5kIiBpbXBsaWVzICJmdWxsIGFjY2VzcyIuIEFuZCBJJ20gZnVydGhlciBsb3N0IGFzDQo+
IHRvIHdoYXQgdGhlIGNvZGUgZnJhZ21lbnQgYWJvdmUgKGRlYWxpbmcgd2l0aCBJTlZBTElEX0dG
TiwgYnV0DQo+IG5vdCByZWFsbHkgdGhlICJlbnRyeSBub3QgZm91bmQiIGNhc2UsIHdoaWNoIHdv
dWxkIGJlIElOVkFMSURfTUZODQo+IGNvbWluZyBiYWNrIGZyb20gYSB0cmFuc2xhdGlvbikgaXMg
c3VwcG9zZWQgdG8gdGVsbCBtZS4NCj4gDQpJdCBpcyBzYWZlIGVub3VnaCB0byBjb25zaWRlciBh
IGludmFsaWQgbWZuIGZyb20gaG9zdHAyIHRvIGJlIGEgDQp2aW9sYXRpb24uIFRoZXJlIGlzIHN0
aWxsIGEgc21hbGwgcHJvYmxlbSB3aXRoIGhhdmluZyB0aGUgYWx0cDJtIHZpZXcgDQpub3QgaGF2
aW5nIHRoZSBwYWdlIHByb3BhZ2F0ZWQgZnJvbSBob3N0cDJtLiBJbiB0aGlzIGNhc2Ugd2UgaGF2
ZSB0byB1c2UNCmFsdHAybV9nZXRfZWZmZWN0aXZlX2VudHJ5KCkuDQoNCkFsZXgNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
