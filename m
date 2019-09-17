Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B138B48A4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 09:56:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA8Hm-0005a1-RK; Tue, 17 Sep 2019 07:52:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=biJV=XM=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iA8Hl-0005Zp-Bw
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 07:52:29 +0000
X-Inumbo-ID: 17dd5616-d920-11e9-978d-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.134]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17dd5616-d920-11e9-978d-bc764e2007e4;
 Tue, 17 Sep 2019 07:52:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PilODW9ULJn9gOlle8LQJOExsoAfTf1NHv2PwuJascPafSBi3WpgqGOJGJtUFl+1ybWpYz9hvZmLDh0j21NuXj7ZcjaA3ccBBtbBggAWWcPfA6HVR8An4ot0GIRCHjyDUWoHSatYcbor5/phFTGY/dbjAev/phVk3QxCM2pDlMLsDQGg0gdVvIYn5ByZT9fE4H7L+IcBpHZ8ZWq8weunQB5hxTb+MxGbQojmjTzAu66DqwHNhZ6ru+RFSMPVzHgm4fw29GivZKWH6Lng9kvOfpTRdm4gK9QGuQI0U7wA5JmJyTDh5nBtVM/hlObtZVd3b+muEn4EI2XD+AJt29N2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRAoFVeBKN++g8Jlc17Dy90Kj1cTAJ9rw1JZHXt/OOQ=;
 b=guiSiR49Q8OhuK76+uH4svGCQxWWrHtk7ahq1smhEWrvX4GkkdeLKV3fdNBQ2aSgPWBvJwrSMGdXBjHDwPqAspQs5SqTN6ikeCxv+22QC47rUMafAsAgqXhyvC6M8bDS34KGPwUbctrtRgbIW6z4OdAs5lyqPIqxES0MKSwCfv8mrH/Hs2hobPW+HEn4CfM1QbCdc6BO99KeHWjD9JoygBZYkM3KQBv/BemAliOxtXbI0BpckFgq4kyalKkyczp5xlB/wHO0rjFW7T4+x2dpejNbDasUDCL3/rDciY0R0demCvPGTCEuKwaAuzd/pDsjMuz7txi9g2vDyQ4AGuiO6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRAoFVeBKN++g8Jlc17Dy90Kj1cTAJ9rw1JZHXt/OOQ=;
 b=ehltXUDhcbSoBC8U1p8Uz9GnF+c+OwQLZP+S+Ojp52MPkj2kSKRPir/1/VRJ1yxhizMcAvb77nw29uj9+9vYaB5k6YeF1ubC2H7F6QNjvkkGjpcWNM2/vq3HuB4nV65xR8YJWIiafwLPeJboD+a3qe3cSoX7cfEOIWOn7uMKzl4=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5912.eurprd02.prod.outlook.com (10.141.172.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Tue, 17 Sep 2019 07:52:26 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 07:52:26 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v10] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVbGY5LYraxeTPu06yM6Qe3Haip6cudlQAgAEKjgA=
Date: Tue, 17 Sep 2019 07:52:26 +0000
Message-ID: <3f252f60-6f72-6025-d4dc-d82077e43691@bitdefender.com>
References: <20190916081024.20931-1-aisaila@bitdefender.com>
 <18854b5e-8e1a-298f-672f-ccc93b5b3a2a@suse.com>
In-Reply-To: <18854b5e-8e1a-298f-672f-ccc93b5b3a2a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0001.eurprd05.prod.outlook.com
 (2603:10a6:208:55::14) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da1be32a-0f1f-4297-2ee4-08d73b43fb48
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM7PR02MB5912; 
x-ms-traffictypediagnostic: AM7PR02MB5912:|AM7PR02MB5912:|AM7PR02MB5912:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB5912A257A733A8003853349CAB8F0@AM7PR02MB5912.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(39860400002)(346002)(136003)(366004)(199004)(189003)(476003)(486006)(11346002)(2906002)(6436002)(54906003)(6246003)(386003)(71190400001)(6116002)(3846002)(81166006)(102836004)(7736002)(8676002)(81156014)(71200400001)(6512007)(31686004)(99286004)(26005)(6506007)(186003)(6486002)(5660300002)(36756003)(66476007)(66556008)(64756008)(66946007)(316002)(2616005)(66446008)(8936002)(53546011)(76176011)(229853002)(86362001)(52116002)(4326008)(14444005)(256004)(305945005)(6916009)(66066001)(25786009)(446003)(478600001)(14454004)(31696002)(3714002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5912;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6ZYQ7waKmz8beXu58B77VpzFfN4XPVryAQnyVwQiVxvHvfPvQ2iEMj2cMalXw1cFf5Qm5f+TelsmdgHt2Bwef5j2d+bLuvK6maKkbjDOxymb9cAYUZyqRM0BAqOE3HwKdtfvkfgHOJZ5wjHe7KUS0NKOroY0aGkL/ukeWRsDafQdunQTWzwPu5iVH4UQbpH131W6UtyQdXwuazx31sxaC+9c64vqpesjr5OREtrRQY5zqf3+iOiR75rjGQFNmyNriffC3zYnVypuSyzerJXQZSeFGS7/8VjNmFZhhQAJFQAVinjt4dafk9ie2gLOpl8JqWOg4sswTslq6VzvfVYbTatlU48f4JNkQo/oYEHkFrhpKDEj/duRJbuD5FOfAVSSjyscjta65tbwH8wbXXxe73PpE08yWzz26hWc9zPTvE8=
Content-ID: <20E78DEF50794A4B8B5405A116AFE57E@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da1be32a-0f1f-4297-2ee4-08d73b43fb48
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 07:52:26.2485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dmlWDFfPXnQGe6Vi+tpXTHcDuY5giv0XLT8nY1guYuTBxLAIx14hOWFoaFVBKUEpILdZwn7on3r/IJtyr/gRpyDJUDkC4gzyZUgJ4pEzHxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5912
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

DQoNCk9uIDE2LjA5LjIwMTkgMTg6NTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNi4wOS4y
MDE5IDEwOjEwLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vaHZtLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4+IEBA
IC0zMjI0LDYgKzMyMjQsMTQgQEAgc3RhdGljIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCBf
X2h2bV9jb3B5KA0KPj4gICAgICAgICAgICAgICByZXR1cm4gSFZNVFJBTlNfYmFkX2dmbl90b19t
Zm47DQo+PiAgICAgICAgICAgfQ0KPj4gICANCj4+ICsgICAgICAgIGlmICggdW5saWtlbHkodi0+
YXJjaC52bV9ldmVudCkgJiYNCj4+ICsgICAgICAgICAgICAgdi0+YXJjaC52bV9ldmVudC0+c2Vu
ZF9ldmVudCAmJg0KPj4gKyAgICAgICAgICAgICBodm1fbW9uaXRvcl9jaGVja19wMm0oYWRkciwg
Z2ZuLCBwZmVjLCBucGZlY19raW5kX3dpdGhfZ2xhKSApDQo+PiArICAgICAgICB7DQo+PiArICAg
ICAgICAgICAgcHV0X3BhZ2UocGFnZSk7DQo+PiArICAgICAgICAgICAgcmV0dXJuIEhWTVRSQU5T
X2dmbl9wYWdlZF9vdXQ7DQo+IA0KPiBJJ20gc29ycnksIGJ1dCB0aGVyZSBpcyBfc3RpbGxfIG5v
IGNvbW1lbnQgbmV4dCB0byB0aGlzIGFwcGFyZW50DQo+IG1pcy11c2Ugb2YgSFZNVFJBTlNfZ2Zu
X3BhZ2VkX291dC4NCg0KSSB3aWxsIGFkZCB0aGlzIGNvbW1lbnQgaGVyZToNCg0KIi8qDQogICAq
IEluIGNhc2UgYSB2bSBldmVudCB3YXMgc2VudCByZXR1cm4gcGFnZWRfb3V0IHNvIHRoZSBlbXVs
YXRpb24gd2lsbA0KICAgKiBzdG9wIHdpdGggbm8gc2lkZSBlZmZlY3QNCiAgICovIg0KDQoNCj4g
DQo+PiBAQCAtMjE1LDYgKzIxNyw3OSBAQCB2b2lkIGh2bV9tb25pdG9yX2ludGVycnVwdCh1bnNp
Z25lZCBpbnQgdmVjdG9yLCB1bnNpZ25lZCBpbnQgdHlwZSwNCj4+ICAgICAgIG1vbml0b3JfdHJh
cHMoY3VycmVudCwgMSwgJnJlcSk7DQo+PiAgIH0NCj4+ICAgDQo+PiArLyoNCj4+ICsgKiBTZW5k
IG1lbW9yeSBhY2Nlc3Mgdm1fZXZlbnRzIGJhc2VkIG9uIHBmZWMuIFJldHVybnMgdHJ1ZSBpZiB0
aGUgZXZlbnQgd2FzDQo+PiArICogc2VudCBhbmQgZmFsc2UgZm9yIHAybV9nZXRfbWVtX2FjY2Vz
cygpIGVycm9yLCBubyB2aW9sYXRpb24gYW5kIGV2ZW50IHNlbmQNCj4+ICsgKiBlcnJvci4gQXNz
dW1lcyB0aGUgY2FsbGVyIHdpbGwgY2hlY2sgYXJjaC52bV9ldmVudC0+c2VuZF9ldmVudC4NCj4+
ICsgKg0KPj4gKyAqIE5PVEU6IHAybV9nZXRfbWVtX2FjY2VzcygpIGNhbiBmYWlsIGlmIHRoZSBl
bnRyeSB3YXMgbm90IGZvdW5kIGluIHRoZSBFUFQNCj4+ICsgKiAoaW4gd2hpY2ggY2FzZSBhY2Nl
c3MgdG8gaXQgaXMgdW5yZXN0cmljdGVkLCBzbyBubyB2aW9sYXRpb25zIGNhbiBvY2N1cikuDQo+
PiArICogSW4gdGhpcyBjYXNlcyBpdCBpcyBmaW5lIHRvIGNvbnRpbnVlIHRoZSBlbXVsYXRpb24u
DQo+PiArICovDQo+IA0KPiBJIHRoaW5rIHRoaXMgcGFydCBvZiB0aGUgY29tbWVudCB3b3VsZCBi
ZXR0ZXIgZ28gLi4uDQo+IA0KPj4gK2Jvb2wgaHZtX21vbml0b3JfY2hlY2tfcDJtKHVuc2lnbmVk
IGxvbmcgZ2xhLCBnZm5fdCBnZm4sIHVpbnQzMl90IHBmZWMsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdWludDE2X3Qga2luZCkNCj4+ICt7DQo+PiArICAgIHhlbm1lbV9hY2Nlc3Nf
dCBhY2Nlc3M7DQo+PiArICAgIHZtX2V2ZW50X3JlcXVlc3RfdCByZXEgPSB7fTsNCj4+ICsgICAg
cGFkZHJfdCBncGEgPSAoZ2ZuX3RvX2dhZGRyKGdmbikgfCAoZ2xhICYgflBBR0VfTUFTSykpOw0K
Pj4gKw0KPj4gKyAgICBBU1NFUlQoY3VycmVudC0+YXJjaC52bV9ldmVudC0+c2VuZF9ldmVudCk7
DQo+PiArDQo+PiArICAgIGN1cnJlbnQtPmFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQgPSBmYWxz
ZTsNCj4+ICsNCj4+ICsgICAgaWYgKCBwMm1fZ2V0X21lbV9hY2Nlc3MoY3VycmVudC0+ZG9tYWlu
LCBnZm4sICZhY2Nlc3MsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsdHAybV92
Y3B1X2lkeChjdXJyZW50KSkgIT0gMCApDQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+IA0K
PiAuLi4gbmV4dCB0byB0aGUgY2FsbCBoZXJlIChidXQgdGhlIG1haW50YWluZXJzIG9mIHRoZSBm
aWxlIHdvdWxkDQo+IGhhdmUgdG8ganVkZ2UgaW4gdGhlIGVuZCkuIFRoYXQgc2FpZCwgSSBjb250
aW51ZSB0byBub3QgdW5kZXJzdGFuZA0KPiB3aHkgYSBub3QgZm91bmQgZW50cnkgbWVhbnMgdW5y
ZXN0cmljdGVkIGFjY2Vzcy4gSXNuJ3QgaXQNCj4gLT5kZWZhdWx0X2FjY2VzcyB3aGljaCBjb250
cm9scyB3aGF0IHN1Y2ggYSAidmlydHVhbCIgZW50cnkgd291bGQNCj4gcGVybWl0Pw0KDQpJJ20g
c29ycnkgZm9yIHRoaXMgbWlzbGVhZGluZyBjb21tZW50LiBUaGUgY29kZSBzdGF0ZXMgdGhhdCBp
ZiBlbnRyeSB3YXMgDQpub3QgZm91bmQgdGhlIGFjY2VzcyB3aWxsIGJlIGRlZmF1bHRfYWNjZXNz
IGFuZCByZXR1cm4gMC4gU28gaW4gdGhpcyANCmNhc2UgdGhlIGRlZmF1bHRfYWNjZXNzIHdpbGwg
YmUgY2hlY2tlZC4NCg0KLyogSWYgcmVxdWVzdCB0byBnZXQgZGVmYXVsdCBhY2Nlc3MuICovDQpp
ZiAoIGdmbl9lcShnZm4sIElOVkFMSURfR0ZOKSApDQp7DQogICAgICphY2Nlc3MgPSBtZW1hY2Nl
c3NbcDJtLT5kZWZhdWx0X2FjY2Vzc107DQogICAgIHJldHVybiAwOw0KfQ0KDQpJZiB0aGlzIGNs
ZWFycyB0aGluZyB1cCBJIGNhbiByZW1vdmUgdGhlICJOT1RFIiBwYXJ0IGlmIHRoZSBjb21tZW50
Lg0KDQoNCj4gDQo+PiArICAgIHN3aXRjaCAoIGFjY2VzcyApDQo+PiArICAgIHsNCj4+ICsgICAg
Y2FzZSBYRU5NRU1fYWNjZXNzX3g6DQo+PiArICAgIGNhc2UgWEVOTUVNX2FjY2Vzc19yeDoNCj4+
ICsgICAgICAgIGlmICggcGZlYyAmIFBGRUNfd3JpdGVfYWNjZXNzICkNCj4+ICsgICAgICAgICAg
ICByZXEudS5tZW1fYWNjZXNzLmZsYWdzID0gTUVNX0FDQ0VTU19SIHwgTUVNX0FDQ0VTU19XOw0K
Pj4gKyAgICAgICAgYnJlYWs7DQo+PiArDQo+PiArICAgIGNhc2UgWEVOTUVNX2FjY2Vzc193Og0K
Pj4gKyAgICBjYXNlIFhFTk1FTV9hY2Nlc3Nfcnc6DQo+PiArICAgICAgICBpZiAoIHBmZWMgJiBQ
RkVDX2luc25fZmV0Y2ggKQ0KPj4gKyAgICAgICAgICAgIHJlcS51Lm1lbV9hY2Nlc3MuZmxhZ3Mg
PSBNRU1fQUNDRVNTX1g7DQo+PiArICAgICAgICBicmVhazsNCj4+ICsNCj4+ICsgICAgY2FzZSBY
RU5NRU1fYWNjZXNzX3I6DQo+PiArICAgIGNhc2UgWEVOTUVNX2FjY2Vzc19uOg0KPj4gKyAgICAg
ICAgaWYgKCBwZmVjICYgUEZFQ193cml0ZV9hY2Nlc3MgKQ0KPj4gKyAgICAgICAgICAgIHJlcS51
Lm1lbV9hY2Nlc3MuZmxhZ3MgfD0gTUVNX0FDQ0VTU19SIHwgTUVNX0FDQ0VTU19XOw0KPj4gKyAg
ICAgICAgaWYgKCBwZmVjICYgUEZFQ19pbnNuX2ZldGNoICkNCj4+ICsgICAgICAgICAgICByZXEu
dS5tZW1fYWNjZXNzLmZsYWdzIHw9IE1FTV9BQ0NFU1NfWDsNCj4+ICsgICAgICAgIGJyZWFrOw0K
Pj4gKw0KPj4gKyAgICBjYXNlIFhFTk1FTV9hY2Nlc3Nfd3g6DQo+PiArICAgIGNhc2UgWEVOTUVN
X2FjY2Vzc19yd3g6DQo+PiArICAgIGNhc2UgWEVOTUVNX2FjY2Vzc19yeDJydzoNCj4+ICsgICAg
Y2FzZSBYRU5NRU1fYWNjZXNzX24ycnd4Og0KPj4gKyAgICBjYXNlIFhFTk1FTV9hY2Nlc3NfZGVm
YXVsdDoNCj4+ICsgICAgICAgIGJyZWFrOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIGlmICgg
IXJlcS51Lm1lbV9hY2Nlc3MuZmxhZ3MgKQ0KPj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOyAvKiBu
byB2aW9sYXRpb24gKi8NCj4+ICsNCj4+ICsgICAgaWYgKCBraW5kID09IG5wZmVjX2tpbmRfd2l0
aF9nbGEgKQ0KPj4gKyAgICAgICAgcmVxLnUubWVtX2FjY2Vzcy5mbGFncyB8PSBNRU1fQUNDRVNT
X0ZBVUxUX1dJVEhfR0xBIHwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
TUVNX0FDQ0VTU19HTEFfVkFMSUQ7DQo+PiArICAgIGVsc2UgaWYgKCBraW5kID09IG5wZmVjX2tp
bmRfaW5fZ3B0ICkNCj4+ICsgICAgICAgIHJlcS51Lm1lbV9hY2Nlc3MuZmxhZ3MgfD0gTUVNX0FD
Q0VTU19GQVVMVF9JTl9HUFQgfA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBNRU1fQUNDRVNTX0dMQV9WQUxJRDsNCj4+ICsNCj4+ICsNCj4+ICsgICAgcmVxLnJlYXNvbiA9
IFZNX0VWRU5UX1JFQVNPTl9NRU1fQUNDRVNTOw0KPj4gKyAgICByZXEudS5tZW1fYWNjZXNzLmdm
biA9IGdmbl94KGdmbik7DQo+PiArICAgIHJlcS51Lm1lbV9hY2Nlc3MuZ2xhID0gZ2xhOw0KPj4g
KyAgICByZXEudS5tZW1fYWNjZXNzLm9mZnNldCA9IGdwYSAmIH5QQUdFX01BU0s7DQo+PiArDQo+
PiArICAgIHJldHVybiBtb25pdG9yX3RyYXBzKGN1cnJlbnQsIHRydWUsICZyZXEpID49IDA7DQo+
PiArfQ0KPiANCj4gVGhlcmUgYXJlIHF1aXRlIGEgZmV3IHVzZXMgb2YgImN1cnJlbnQiIGluIGhl
cmUgLSBwbGVhc2UgY29uc2lkZXINCj4gbGF0Y2hpbmcgaW50byBhIGxvY2FsIHZhcmlhYmxlIG5h
bWVkICJjdXJyIi4NCg0KSSB3aWxsIGFkZCBhIGxvY2FsIHZhcmlhYmxlIGhlcmUuDQoNClRoYW5r
cywNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
