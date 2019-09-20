Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF356B8C68
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 10:11:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBDvq-0000nC-Vg; Fri, 20 Sep 2019 08:06:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ihh=XP=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iBDvp-0000mS-1K
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 08:06:21 +0000
X-Inumbo-ID: 86da24fe-db7d-11e9-978d-bc764e2007e4
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.113]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86da24fe-db7d-11e9-978d-bc764e2007e4;
 Fri, 20 Sep 2019 08:06:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzRYkg4AnIrHy69O0tmt4UDE9NIvlQcqTwVBQDYXSHQDMPIVnIsSn3Z9HlDMk891HXxh8ygIS9qegJyO0L0qo3nCbBXeTbmvwCL8bZ7e0cks7iaTybS44vHv+wn6FE30OSZ/NYe7xiJ8C6Wqkk/WkswIIQnUkCCbn5ZI6I36CZbo/MZm5BvKetvlc4GYxCuxEyBwIasnyQ7O6j9ikAtnkJnCb17Pxjtr/NdyKaNeaRr1ySroMywn4v2l0pdRn6Mi8kN+6Vwfnh7PbFAMfO/n/ul3Kqky++4MfPxiWqn5peY9P9U3ISGskknduQrYcvyaRGl/5zJypUONDlXhlz4AxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OI32upjA3SXcTBtGErFX3fbMc5G6GTRK20uo/oue4Yc=;
 b=WkrlhJiWNyBuBmcFisFRrnEAMspU835B4LJJjB+sklmDwqcC8nyTGGMv/koC2Ktcj6zM4bWgPTxsCS3o+lbru3v8bEAJGB/FuKFL3Xa+JyL5wUyP3cDaiu2Dm+P8kXOh9gAWRpfnkaX8/ieEb4IAmiGbxQS1ZDciuxn/M9dM56Hc7iTE786wyku4Vz98xnvqHoN+4EU0lFJIlzDD5AGvCQPOEBi3+FZBrFfBxEH9d/cx8B/HruXgHIfSFLGMaf7Kmh9mOlq2C9QHgNUB0Ud3LGvJl3TsyfeavKWHvTFW5p4pB2vL3ps6LoAuF8mfd66dAgkzj+9apHdWraJY6uVNig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OI32upjA3SXcTBtGErFX3fbMc5G6GTRK20uo/oue4Yc=;
 b=WCuVN6k9a1+8p1DawILRxt9KgBKrFG5BLJAfMDngtF0gAEopPqBsHnFUpJFbVXGVDQoPdhu/W0Uj+UP/ZquKqb6rGnXa2Bo/Ko5Qia9XGzeCRkG8w9WP01eORdiohtydbWy0CG9HH8WDanqzr7MTewE3SP+rZM9ItR+SF4pkWgI=
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com (10.141.171.8) by
 AM7PR02MB5782.eurprd02.prod.outlook.com (10.141.172.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Fri, 20 Sep 2019 08:06:18 +0000
Received: from AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8]) by AM7PR02MB5750.eurprd02.prod.outlook.com
 ([fe80::2d9b:67b0:d407:67b8%2]) with mapi id 15.20.2284.023; Fri, 20 Sep 2019
 08:06:18 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v11] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVbuqvObi2c4eeME6qC/Xll4ji7KczByuAgAEvi4A=
Date: Fri, 20 Sep 2019 08:06:18 +0000
Message-ID: <f2532730-7528-9819-1653-83f901acc754@bitdefender.com>
References: <20190919130338.3132-1-aisaila@bitdefender.com>
 <03e3bb4f-e6da-b5a5-d337-4e91215dc2fe@suse.com>
In-Reply-To: <03e3bb4f-e6da-b5a5-d337-4e91215dc2fe@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0193.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::13) To AM7PR02MB5750.eurprd02.prod.outlook.com
 (2603:10a6:20b:102::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ea714de-1627-48ed-82d8-08d73da16a55
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR02MB5782; 
x-ms-traffictypediagnostic: AM7PR02MB5782:|AM7PR02MB5782:|AM7PR02MB5782:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR02MB5782DFB156C7CF1920BE7983AB880@AM7PR02MB5782.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(39860400002)(396003)(366004)(376002)(199004)(189003)(25786009)(31696002)(256004)(66476007)(86362001)(53546011)(446003)(4326008)(102836004)(64756008)(186003)(66446008)(486006)(66946007)(14444005)(476003)(478600001)(386003)(71190400001)(71200400001)(52116002)(6506007)(66556008)(76176011)(26005)(99286004)(2616005)(36756003)(6916009)(6512007)(11346002)(5660300002)(8676002)(81156014)(81166006)(229853002)(54906003)(14454004)(6436002)(7736002)(31686004)(8936002)(305945005)(2906002)(6486002)(316002)(66066001)(6246003)(3846002)(6116002)(3714002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR02MB5782;
 H:AM7PR02MB5750.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vaqOnw9P6ohwZY899bkSzFec9xeyZsk/lOPL00hBcqMk43mvd4BsX7Vx4ePSftDtgIl8431sacCWj5CNN5cXRfsTZIw7E3BElpWdKS4Phvpz+Zo2qiw8IlMgJW9DC1Cp38fsCAnS1my/o+17/WW1UMB483p4gfn98Rp35qACZGNQcJNGXpqZySDI3ApK5YAefMMTyy0plxtCjusqLsqJMVuf3bZ2TV/HhxDn0YYNMvoRBTROfpSv0QWgi1xUOuUr6oVPSZc8662mkdkHUzUuT6DsVMf2XAAKOtIX521DgDHJC/Gv4paw1FnVUHdswFxIOqoO+/YknNlfppGy+sllYz/CGFtQxgo9X0rsAa9oQjgoVfVALLO/ofpP4KLOfISE1iSVLB1saVNY4XP/j4jC/WDnKiIEefCI9TtvHQhdd6E=
Content-ID: <F39C694B27AB384399394B32B70BDEC4@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea714de-1627-48ed-82d8-08d73da16a55
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 08:06:18.0463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XNmFI0zclF4n8NaqM6QAAHeZkA5fN08/oJWKK5S8Rofnbll/vujlOdk0ZTVPByQdeoBCU+oya+ZHuOXReiJ5uMPfCm/w2vFLIJOYBvCYVJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5782
Subject: Re: [Xen-devel] [PATCH v11] x86/emulate: Send vm_event from emulate
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

DQoNCk9uIDE5LjA5LjIwMTkgMTY6NTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOS4wOS4y
MDE5IDE1OjAzLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IEBAIC02MDEsNiAr
NjAyLDcgQEAgc3RhdGljIHZvaWQgKmh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyKA0KPj4gICANCj4+
ICAgICAgICAgICBjYXNlIEhWTVRSQU5TX2dmbl9wYWdlZF9vdXQ6DQo+PiAgICAgICAgICAgY2Fz
ZSBIVk1UUkFOU19nZm5fc2hhcmVkOg0KPj4gKyAgICAgICAgY2FzZSBIVk1UUkFOU19iYWRfZ2Zu
X2FjY2VzczoNCj4+ICAgICAgICAgICAgICAgZXJyID0gRVJSX1BUUih+WDg2RU1VTF9SRVRSWSk7
DQo+PiAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPiANCj4gVGhpcyBsb29rcyBwcmV0dHkgc3Vz
cGljaW91cyBub3cgLSB3aHkgd291bGQgKHdpdGhvdXQga25vd2luZyBhbGwNCj4gdGhlIGJhY2tn
cm91bmQpICJiYWQgYWNjZXNzIiB0cmFuc2xhdGUgaW50byAicmV0cnkiLiBXaGlsZSB5b3UgZGlk
DQo+IHBvc3QgdGhlIHN1Z2dlc3RlZCBuYW1lIGJlZm9yZSwgaXQncyBuZXZlcnRoZWxlc3MgcHJl
dHR5IGNsZWFyIG5vdw0KPiB0aGF0IGl0IG5lZWRzIGNoYW5naW5nLiBQZXJoYXBzIEhWTVRSQU5T
X25lZWRfcmV0cnkgb3Igc29tZSBzdWNoPw0KDQpJdCdzIGZpbmUgYnkgbWUsIEkgd2lsbCBjaGFu
Z2UgdGhlIG5hbWUgdG8gSFZNVFJBTlNfbmVlZF9yZXRyeS4NCg0KPiANCj4+IEBAIC0xODUyLDYg
KzE4NjQsOCBAQCBzdGF0aWMgaW50IGh2bWVtdWxfcmVwX21vdnMoDQo+PiAgIA0KPj4gICAgICAg
eGZyZWUoYnVmKTsNCj4+ICAgDQo+PiArICAgIEFTU0VSVChyYyAhPSBIVk1UUkFOU19iYWRfZ2Zu
X2FjY2Vzcyk7DQo+PiArDQo+PiAgICAgICBpZiAoIHJjID09IEhWTVRSQU5TX2dmbl9wYWdlZF9v
dXQgKQ0KPj4gICAgICAgICAgIHJldHVybiBYODZFTVVMX1JFVFJZOw0KPj4gICAgICAgaWYgKCBy
YyA9PSBIVk1UUkFOU19nZm5fc2hhcmVkICkNCj4+IEBAIC0xOTY0LDYgKzE5NzgsOCBAQCBzdGF0
aWMgaW50IGh2bWVtdWxfcmVwX3N0b3MoDQo+PiAgICAgICAgICAgaWYgKCBidWYgIT0gcF9kYXRh
ICkNCj4+ICAgICAgICAgICAgICAgeGZyZWUoYnVmKTsNCj4+ICAgDQo+PiArICAgICAgICBBU1NF
UlQocmMgIT0gSFZNVFJBTlNfYmFkX2dmbl9hY2Nlc3MpOw0KPj4gKw0KPj4gICAgICAgICAgIHN3
aXRjaCAoIHJjICkNCj4+ICAgICAgICAgICB7DQo+PiAgICAgICAgICAgY2FzZSBIVk1UUkFOU19n
Zm5fcGFnZWRfb3V0Og0KPiANCj4gVGhlc2UgYXJlIGNoYW5nZXMgdG8gcGxhY2VzIHRoYXQgd2Vy
ZSBwb2ludGVkIG91dCBiZWZvcmUgZG8gY29uc3VtZQ0KPiBIVk1UUkFOU18qIHJldHVybiB2YWx1
ZXMuIERpZCB5b3UgZ28gdGhyb3VnaCBhbmQgY2hlY2sgbm90aGluZyBlbHNlDQo+IG5lZWRzIGFk
anVzdG1lbnQ/IFlvdSBkb24ndCBzYXkgYW55dGhpbmcgaW4gdGhpcyByZWdhcmQgaW4gdGhlDQo+
IGRlc2NyaXB0aW9uLiBGb3IgZXhhbXBsZSwgaWYgc2hhZG93J3MgaHZtX3JlYWQoKSB3b3VsZCBn
ZXQgdG8gc2VlDQo+IHRoZSBuZXcgdmFsdWUsIGl0IHdvdWxkIGZhbGwgb3V0IG9mIGl0cyBzd2l0
Y2goKSBpbnRvIGEgQlVHKCkuDQo+IA0KDQpZZXMsIHlvdSBhcmUgcmlnaHQsIHRoZSBvbmx5IHRo
aW5nIHRoYXQgc2F2ZXMgc2hhZG93IGZyb20gbm90IHJhaXNpbmcgYSANCkJVRyBpcyB0aGUgc2Vu
ZF9ldmVudCBmbGFnLiBGb3Igc2FmZXR5IHJlYXNvbnMgSSB3aWxsIGhhdmUgYSBjb21wbGV0ZSAN
CmNoZWNrIG9mIGFsbCB0aGUgcGxhY2VzIHRoYXQgY2FuIGZhaWwgZnJvbSBhZGRpbmcgdGhlIG5l
dyByZXR1cm4gdmFsdWUuDQoNCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4+IEBAIC0zMjM2LDYgKzMyMzYsMTkgQEAgc3Rh
dGljIGVudW0gaHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCBfX2h2bV9jb3B5KA0KPj4gICAgICAgICAg
ICAgICByZXR1cm4gSFZNVFJBTlNfYmFkX2dmbl90b19tZm47DQo+PiAgICAgICAgICAgfQ0KPj4g
ICANCj4+ICsgICAgICAgIC8qDQo+PiArICAgICAgICAgKiBJbiBjYXNlIGEgdm0gZXZlbnQgd2Fz
IHNlbnQgcmV0dXJuIHBhZ2VkX291dCBzbyB0aGUgZW11bGF0aW9uIHdpbGwNCj4+ICsgICAgICAg
ICAqIHN0b3Agd2l0aCBubyBzaWRlIGVmZmVjdA0KPj4gKyAgICAgICAgICovDQo+PiArICAgICAg
ICBpZiAoIChmbGFncyAmIEhWTUNPUFlfbGluZWFyKSAmJg0KPj4gKyAgICAgICAgICAgICB1bmxp
a2VseSh2LT5hcmNoLnZtX2V2ZW50KSAmJg0KPj4gKyAgICAgICAgICAgICB2LT5hcmNoLnZtX2V2
ZW50LT5zZW5kX2V2ZW50ICYmDQo+PiArICAgICAgICAgICAgIGh2bV9tb25pdG9yX2NoZWNrX3Ay
bShhZGRyLCBnZm4sIHBmZWMsIG5wZmVjX2tpbmRfd2l0aF9nbGEpICkNCj4gDQo+IEluIHN1Y2gg
YSBzZXF1ZW5jZSBvZiBjaGVja3Mgd2l0aCBfc29tZV8gcGFydCB1c2luZyB1bmxpa2VseSgpIEkN
Cj4gdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGhhdmUgdGhlIHVubGlrZWx5KCkgb25lIGZp
cnN0ICh1bmxlc3MNCj4gaXQncyBhIHJlbGF0aXZlbHkgZXhwZW5zaXZlIGNoZWNrLCB3aGljaCBp
c24ndCB0aGUgY2FzZSBoZXJlKSwgdG8NCj4gaGF2ZSBhcyBsaXR0bGUgYXMgcG9zc2libGUgdW5u
ZWNlc3NhcnkgY29tcHV0YXRpb25zIC8gYnJhbmNoZXMgaW4NCj4gdGhlIGNvbW1vbiAoZmFzdCBw
YXRoKSBjYXNlLg0KDQpJIHdpbGwgY2hhbmdlIHRoZSBvcmRlciBpbiB0aGUgbmV4dCB2ZXJzaW9u
Lg0KDQo+IA0KPiBGdXJ0aGVybW9yZSB3aGlsZSB5b3Ugbm93IHJlc3RyaWN0IHRoZSBjaGVjayB0
byBsaW5lYXIgYWRkcmVzcw0KPiBiYXNlZCBhY2Nlc3Nlcywgb3RoZXIgdGhhbiB0aGUgZGVzY3Jp
cHRpb24gc2F5cyAob3IgYXQgbGVhc3QNCj4gaW1wbGllcykgeW91IGRvIG5vdCByZXN0cmljdCBp
dCB0byByZWFkIGFuZCBleGVjIGFjY2Vzc2VzLiBJdCdzDQo+IG5vdCBjbGVhciB0byBtZSB3aGV0
aGVyIHRoYXQncyBpbnRlbnRpb25hbCwgeWV0IGl0IGFmZmVjdHMgd2hpY2gNCj4gaHZtX2NvcHlf
Kl9saW5lYXIoKSBjYWxsZXJzIG5lZWQgYXVkaXRpbmcuDQoNClRoZSBwZmVjIHZhciBpcyBjaGVj
a2VkIGluIGh2bV9tb25pdG9yX2NoZWNrX3AybSgpLiBJZiB5b3UgdGhpbmsgaXQgaXMgDQpuZWNl
c3NhcnkgSSBjYW4gYWRkIG9uZSBtb3JlIGNoZWNrIGhlcmUgZm9yIChwZmVjICYgKFBGRUNfaW5z
bl9mZXRjaCB8IA0KUEZFQ193cml0ZV9hY2Nlc3MpKS4NCg0KPiANCj4gRmluYWxseSwgd2hhdCBh
Ym91dCAtPmFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQgcmVtYWluaW5nIHNldA0KPiBhZnRlciBo
dm1fZW11bGF0ZV9vbmVfdm1fZXZlbnQoKSwgYmVjYXVzZSBodm1fbW9uaXRvcl9jaGVja19wMm0o
KQ0KPiAodGhlIG9ubHkgcGxhY2Ugd2hlcmUgdGhlIGZsYWcgd291bGQgZ2V0IGNsZWFyZWQpIHdh
cyBuZXZlciBoaXQNCj4gaW4gdGhlIHByb2Nlc3M/DQpUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMg
b3V0LCBpbmRlZWQgaXQncyBhIHByb2JsZW0gaGVyZS4gQSBzb2x1dGlvbiBjYW4gDQpiZSB0byBt
b3ZlIHNlbmRfZXZlbnQgPSBmYWxzZTsgYWZ0ZXIgaHZtX2VtdWxhdGVfb25lX3ZtX2V2ZW50KCkg
aXMgDQpmaW5pc2hlZC4gQW5kIHN0YXRlIGluIHRoZSBjb21tZW50IHRoYXQgdGhlIHVzZXIgaXMg
aW4gY2hhcmdlIG9mIA0KZW5hYmxpbmcgYW5kIGRpc2FibGluZyB0aGUgZmxhZy4NCk9yIGp1c3Qg
aGF2ZSBpdCBpbiBib3RoIHBsYWNlcy4NCg0KPiBBbmQgd2hhdCBhYm91dCBhbiBpbnN0cnVjdGlv
biBhY2Nlc3NpbmcgdHdvIChvcg0KPiBtb3JlKSBkaXN0aW5jdCBhZGRyZXNzZXM/IFRoZSBmbGFn
IHdvdWxkIGJlIGNsZWFyIGFmdGVyIHRoZSBmaXJzdA0KPiBvbmUgd2FzIGNoZWNrZWQgYWZhaWN0
Lg0KDQpUaGVyZSBpcyBubyBwcm9ibGVtIGhlcmUgYmVjYXVzZSBlbXVsYXRpb24gd2lsbCBzdG9w
IGFmdGVyIHRoZSBmaXJzdCBiYWQgDQphY2Nlc3Mgc28gdGhlcmUgaXMgbm8gbmVlZCB0byBjb250
aW51ZS4NCg0KUmVnYXJkcywNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
