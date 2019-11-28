Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F4710CA21
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 15:09:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaKQx-0004KI-VA; Thu, 28 Nov 2019 14:06:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fxZj=ZU=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1iaKQx-0004KD-2Q
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 14:06:15 +0000
X-Inumbo-ID: 3c1edff8-11e8-11ea-a3d2-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.132]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c1edff8-11e8-11ea-a3d2-12813bfff9fa;
 Thu, 28 Nov 2019 14:06:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGEyMGC0jdkNpxsLPTBlZfgG24Ch3vVJBHfUXlSYe7gKB/SKAO5bfxpZ3q9RTjlW8k+yzJC8/ijnAW83FdjYKoRihkmU1tDfIomL3WVVrDxef5KrZALSkgiAUMRabY5s2Cw6YK2pfQOtP/jgSko3DaOzLJNyIvnjYDwBihFTUsTjiAGWy2lbur8wFDc8W+0OW8msNgfFWiUwvDSDx0Ty5G6lETFSWbtoXI/xHl5mWmqeRrG3H6pxV/ZzoPsyfcr6ytkraWae5bLBfNDqEqiXyD+74Jju4Z5Fc+hWP7ArSmHpaU3+lkodQN67fGYbxkTnp7tsejaz7GaMNzTavUtCgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEVCjHK2RhK35tPtJaxWG/gF1a7/QLW2wpAPhxOnxMc=;
 b=X5EXuAaIK7SIs+FG/ZOJLDlW6V9gdj6q5nw4fP1gcokT/FupDiHbDR0zBXnYtmOUfEB+o6xtWL5pWqPmvZjjxsj9DrkatdNAofiqnkjBSmUg432raGSZxEDoGu8k8K0+kKYfJoGpoJZK/N46Rxpj7onZUUfUC+0aHAjZ35uwakN7tOfG+284CfIzI4VjNh5Xn25dhSVOMAHc5w0emV5MQtbkxQdwjPbjEQ2ioREiSYqlZKa84JE/tAvYF99Q7KxyFleViKtyY6XMJ8R1vmuCTgSlBQTrQ8u6yxKPmv989JkPjzSmYhLg0wr7oC4sf4Fb8vCc3TLPz+c9ezU7TXx3uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEVCjHK2RhK35tPtJaxWG/gF1a7/QLW2wpAPhxOnxMc=;
 b=qdHlvpOg9cQu5NsyG3jeKyGSklNSIUxfIMidph6eF354rICXhpcwzUQ9ieghrQRrbY183/oFnQMkrK6U/PCWJ7zFVFFGNL/J5indujnDVbarzMENXbwl8AY6B2QHLC6N7W1Edn7lmtE/HBl54uqTWaQHEZQzYy64UsmDPKQH5mU=
Received: from AM0PR02MB4241.eurprd02.prod.outlook.com (20.177.109.15) by
 AM0PR02MB5313.eurprd02.prod.outlook.com (20.178.82.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Thu, 28 Nov 2019 14:06:11 +0000
Received: from AM0PR02MB4241.eurprd02.prod.outlook.com
 ([fe80::f512:e5c4:69bb:985e]) by AM0PR02MB4241.eurprd02.prod.outlook.com
 ([fe80::f512:e5c4:69bb:985e%3]) with mapi id 15.20.2474.023; Thu, 28 Nov 2019
 14:06:11 +0000
From: Razvan COJOCARU <rcojocaru@bitdefender.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH for-next] x86/svm: Correct vm_event API for descriptor
 accesses
Thread-Index: AQHVpeFJwhxl33oiokmRm1yy7hbF8KegnjSA
Date: Thu, 28 Nov 2019 14:06:11 +0000
Message-ID: <89a81842-b5e5-01df-0af1-e8fec1e17a35@bitdefender.com>
References: <20191128114414.21716-1-andrew.cooper3@citrix.com>
In-Reply-To: <20191128114414.21716-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR07CA0010.eurprd07.prod.outlook.com
 (2603:10a6:205:1::23) To AM0PR02MB4241.eurprd02.prod.outlook.com
 (2603:10a6:208:db::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=rcojocaru@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 728fdae3-db7d-4a96-c3fd-08d7740c1f9e
x-ms-traffictypediagnostic: AM0PR02MB5313:|AM0PR02MB5313:|AM0PR02MB5313:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB5313DF533A755D7624308FC7AB470@AM0PR02MB5313.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(366004)(396003)(39860400002)(346002)(189003)(199004)(64756008)(5660300002)(110136005)(52116002)(76176011)(6512007)(256004)(54906003)(14444005)(31696002)(6486002)(71190400001)(86362001)(102836004)(99286004)(66066001)(8676002)(186003)(81166006)(81156014)(6506007)(305945005)(26005)(478600001)(7736002)(71200400001)(36756003)(53546011)(386003)(31686004)(11346002)(446003)(4326008)(25786009)(8936002)(2616005)(229853002)(6246003)(316002)(2906002)(6116002)(3846002)(66946007)(6436002)(66446008)(66556008)(66476007)(14454004)(107886003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5313;
 H:AM0PR02MB4241.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IZsTWAWTkdWxqiTNO2zmIZbFa6t8UUoKNF48m8LBkzqOnBCSU3Gw9tiDqIZlfhAJnk68YCNBese5m6xZISXeApeHD4NswSvA4GNaJzE5EAmVJ+SXD0eqGA6/QNbPdQWndC5MdbLzjB+zeWw9diNqmHEu4W99TygHo+09Yi2YtHqcXcQdiu9LyS7DfadC7fhKeG6gcgbOYNDAVY7H2l69Mex/XagqPChTJYSqdL3Vp8Z3VcWuAceZH0uomN7ABtdku+oe89RvJiqVj9lGzE4hUNWDQYn4tpAGNf21sUf1xvWl6PZlWc/I9Xjbq5ran81h6HOfujGf+S1QEp39uxddXQof2zzfAQsoILvke5DPwFiO1NMYKTod7PIBkCaCo/kQWaIb7qBu3Z1ui4YBdSiXp1/uARhmMrLz7LiOCfUen53Lyrsisdsfj4Obze6xgx9x
Content-ID: <49BB1BC5CB8C2F46BA2CA79495CC7F15@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 728fdae3-db7d-4a96-c3fd-08d7740c1f9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 14:06:11.6891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UyxiPhFFyEgEkfJQLDa6BziM20pX4yRoCpnNX5J4Vdt1Uis0HM+X8d+na0dL5/WsvUE01oiQrXvC9fnfzPtrO4uIOZyWFANFaSR1RwG4eN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5313
Subject: Re: [Xen-devel] [PATCH for-next] x86/svm: Correct vm_event API for
 descriptor accesses
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
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Adrian Pop <apop@bitdefender.com>, Jan Beulich <JBeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjgvMTkgMTo0NCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gYy9zIGQwYTY5OWEz
ODlmMSAieDg2L21vbml0b3I6IGFkZCBzdXBwb3J0IGZvciBkZXNjcmlwdG9yIGFjY2VzcyBldmVu
dHMiDQo+IGludHJvZHVjZWQgbG9naWMgbG9va2luZyBmb3Igd2hhdCBhcHBlYXJlZCB0byBiZSBl
eGl0aW5mbyAobm90IHRoYXQgdGhpcw0KPiBleGlzdHMgaW4gU1ZNIC0gZXhpdGluZm8xIG9yIDIg
ZG8pLCBidXQgYWN0dWFsbHkgcGFzc2VkIHRoZSBleGl0IElEVCB2ZWN0b3JpbmcNCj4gaW5mb3Jt
YXRpb24uICBUaGVyZSBpcyBuZXZlciBhbnkgSURUIHZlY3RvcmluZyBpbnZvbHZlZCBpbiB0aGVz
ZSBpbnRlcmNlcHRzIHNvDQo+IHRoZSB2YWx1ZSBwYXNzZWQgaXMgYWx3YXlzIHplcm8uDQo+IA0K
PiBJbiBmYWN0LCBTVk0gZG9lc24ndCBwcm92aWRlIGFueSBpbmZvcm1hdGlvbiwgZXZlbiBpbiBl
eGl0aW5mbzEgYW5kIDIuICBOb3RlDQo+IHRoZSBlcnJvciBpbiB0aGUgcHVibGljIEFQSSBhbmQg
c3RhdGUgdGhhdCB0aGlzIGZpZWxkIGlzIGFsd2F5cyAwLCBhbmQgZHJvcA0KPiB0aGUgU1ZNIGxv
Z2ljIGluIGh2bV9tb25pdG9yX2Rlc2NyaXB0b3JfYWNjZXNzKCkuDQo+IA0KPiBJbiB0aGUgU1ZN
IHZtZXhpdCBoYW5kbGVyIGl0c2VsZiwgb3B0aW1pc2UgdGhlIHN3aXRjaCBzdGF0ZW1lbnQgYnkg
b2JzZXJ2aW5nDQo+IHRoYXQgdGhlcmUgaXMgYSBsaW5lYXIgdHJhbnNmb3JtYXRpb24gYmV0d2Vl
biB0aGUgU1ZNIGV4aXRfcmVhc29uIGFuZA0KPiBWTV9FVkVOVF9ERVNDXyogdmFsdWVzLiAgKEJs
b2F0LW8tbWV0ZXIgcmVwb3J0cyA2MDI4ID0+IDU4NzcgZm9yIGEgc2F2aW5nIG9mDQo+IDE1MSBi
eXRlcykuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPg0KPiAtLS0NCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNv
bT4NCj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4NCj4gQ0M6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJp
dGRlZmVuZGVyLmNvbT4NCj4gQ0M6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNv
bT4NCj4gQ0M6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KPiBD
QzogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4gQ0M6IEFk
cmlhbiBQb3AgPGFwb3BAYml0ZGVmZW5kZXIuY29tPg0KPiANCj4gQWRyaWFuOiBEbyB5b3UgcmVj
YWxsIHdoYXQgaW5mb3JtYXRpb24geW91IHdlcmUgYXR0ZW1wdGluZyB0byBmb3J3YXJkIGZyb20g
dGhlDQo+IFZNQ0I/ICBJIGNhbid0IGxvY2F0ZSBhbnl0aGluZyB3aGljaCB3b3VsZCBwbGF1c2li
bHkgYmUgaW50ZXJlc3RpbmcuDQoNCkkgdGhpbmsgaXQncyBzYWZlIHRvIGdvIHRoZSByb3V0ZSB5
b3UncmUgZ29pbmcgKHlvdSBzaG91bGRuJ3QgYnJlYWsgDQphbnl0aGluZykuDQoNCkFja2VkLWJ5
OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+DQoNCih3aXRoIG9y
IHdpdGhvdXQgYWRkcmVzc2luZyBUYW1hcycgY29tbWVudHMpLg0KDQoNClRoYW5rcywNClJhenZh
bg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
