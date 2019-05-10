Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07E11A4BF
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 23:47:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPDIm-0005oN-T7; Fri, 10 May 2019 21:43:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hPDIk-0005oI-SZ
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 21:43:35 +0000
X-Inumbo-ID: a5933396-736c-11e9-b2e0-c39a9def5679
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5933396-736c-11e9-b2e0-c39a9def5679;
 Fri, 10 May 2019 21:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xQmyjTWhavv8TIgvu+xGMF581H9ggkqZQWq/hnWlMo=;
 b=IjhHLjIhw81rhU62f3bRqA4Ea6/QAJX3koduM9GQPZNZGC9Q4Lz/90oVUSo0ic/0KrTFmzUC/BxfR8H4nDtwqv5ZpCKvqkJZhRTPtPc31qj97dzUrsNCaI7TpnXZiAGJNDy8zzUz/5LvMejRfdHBLZFaT/0EnxV78uEf+dJuMUk=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB4404.eurprd08.prod.outlook.com (20.179.32.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Fri, 10 May 2019 21:43:27 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::3498:cf18:7cd6:d98b%7]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 21:43:27 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v2 10/10] xen/arm: add reserved-memory regions to the
 dom0 memory node
Thread-Index: AQHU/5gYXTScSCWZtk2WboaSm81SxqZgNL4AgASwTwCAAA6MAA==
Date: Fri, 10 May 2019 21:43:27 +0000
Message-ID: <0dc6d4db-7b83-0b8d-77c4-2f97f73a659e@arm.com>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-10-git-send-email-sstabellini@kernel.org>
 <1b8217e1-8671-e1e7-d5bc-4b4c144eedd6@arm.com>
 <alpine.DEB.2.21.1905101326060.25766@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1905101326060.25766@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0402CA0020.eurprd04.prod.outlook.com
 (2603:10a6:4:91::30) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 690d08c8-2ad4-4900-effc-08d6d59088e3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB4404; 
x-ms-traffictypediagnostic: AM0PR08MB4404:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB44042DF9D1F9D2003D1DBA81800C0@AM0PR08MB4404.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(199004)(446003)(71200400001)(478600001)(71190400001)(25786009)(31686004)(6116002)(3846002)(72206003)(8936002)(8676002)(186003)(81156014)(81166006)(14454004)(305945005)(26005)(2906002)(7736002)(53546011)(6506007)(5660300002)(386003)(6916009)(102836004)(76176011)(44832011)(36756003)(6486002)(66066001)(86362001)(66476007)(73956011)(66946007)(66446008)(66556008)(64756008)(229853002)(31696002)(6436002)(476003)(6246003)(14444005)(256004)(6512007)(4326008)(11346002)(54906003)(2616005)(316002)(53936002)(68736007)(99286004)(52116002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4404;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7rn5ku8AupL4/LFo6uIGSwXpAqE48rcHhuQ9ynJOKy+rWaW5RlnCJp9wl2W7ZIujtSUvCaavl1ZYbj3BlF1O4R2hNV3eVjqENC8k8WTY63tO/uR0h4SiaY/1n8cNW5athryM3txNgMEiPRk0ljVlPbQMXcsJoPXGu+mUAPYkQaz1R/yC2nNBiv4PNQwHu17XXofUilKw6fdSXQNjpbskAMCu7HZPAZ7P4LsjkqXdWMGC2kI+b2MJs78A9MAYknKLsZvML6+axL/CKPOZ4h8qR3fcQqtlmas/RwTOuX/r6zyqRTv151GmMVyfE6q93V9b62Z1mfsX1lMR9YdCzm7nERyndERmK71yN7O2S/DdjHyVxy3OfTUND9bSe229Gjw4FGsFYaXiD5psd3pAGsVegYpwI7AFzvv8XvFPndhQCrg=
Content-ID: <85EEFBDE5EC7ED4BA0DB2B40FA51AE42@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 690d08c8-2ad4-4900-effc-08d6d59088e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 21:43:27.0458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4404
Subject: Re: [Xen-devel] [PATCH v2 10/10] xen/arm: add reserved-memory
 regions to the dom0 memory node
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksDQoNCk9uIDEwLzA1LzIwMTkgMjE6NTEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gVHVlLCA3IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBIaSBTdGVmYW5vLA0K
Pj4NCj4+IE9uIDQvMzAvMTkgMTA6MDIgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+
PiBSZXNlcnZlZCBtZW1vcnkgcmVnaW9ucyBhcmUgYXV0b21hdGljYWxseSByZW1hcHBlZCB0byBk
b20wLiBUaGVpciBkZXZpY2UNCj4+PiB0cmVlIG5vZGVzIGFyZSBhbHNvIGFkZGVkIHRvIGRvbTAg
ZGV2aWNlIHRyZWUuIEhvd2V2ZXIsIHRoZSBkb20wIG1lbW9yeQ0KPj4+IG5vZGUgaXMgbm90IGN1
cnJlbnRseSBleHRlbmRlZCB0byBjb3ZlciB0aGUgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMNCj4+
PiByYW5nZXMgYXMgcmVxdWlyZWQgYnkgdGhlIHNwZWMuICBUaGlzIGNvbW1pdCBmaXhlcyBpdC4N
Cj4+DQo+PiBBRkFJQ1QsIHRoaXMgZG9lcyBub3QgY292ZXIgdGhlIHByb2JsZW0gbWVudGlvbiBi
eSBBbWl0IGluIFsxXS4NCj4gDQo+IFdoYXQgZG8geW91IHRoaW5rIGlzIHJlcXVpcmVkIHRvIGZp
eCBBbWl0J3MgcHJvYmxlbT8NCg0KSSBoYXZlbid0IGZ1bGx5IGludmVzdGlnYXRlZCB0aGUgcHJv
YmxlbSB0byBiZSBhYmxlIHRvIGFuc3dlciB0aGUgDQpxdWVzdGlvbiBoZXJlLiBBbHRob3VnaCBJ
IHByb3ZpZGVkIHNvbWUgaW5zaWdodHMgaW46DQoNCjxiMjkzZDg5Yy05ZWQxLTIwMzMtNDRlNS0y
Mjc2NDNhZTFiMGNAYXJtLmNvbT4NCg0KPiANCj4gDQo+PiBCdXQgSSBhbSBzdGlsbCBub3QgaGFw
cHkgd2l0aCB0aGUgYXBwcm9hY2ggdGFrZW4gZm9yIHRoZSByZXNlcnZlZC1tZW1vcnkNCj4+IHJl
Z2lvbnMgaW4gdGhpcyBzZXJpZXMuIEFzIEkgcG9pbnRlZCBvdXQgYmVmb3JlLCB0aGV5IGFyZSBq
dXN0IG5vcm1hbCBtZW1vcnkNCj4+IHRoYXQgd2FzIHJlc2VydmVkIGZvciBvdGhlciBwdXJwb3Nl
IChDTUEsIGZyYW1lYnVmZmVyLi4uKS4NCj4+DQo+PiBUcmVhdGluZyB0aGVtIGFzICJkZXZpY2Ui
IGZyb20gWGVuIFBPViBpcyBhIGNsZWFyIGFidXNlIG9mIHRoZSBtZWFuaW5nIGFuZCBJDQo+PiBk
b24ndCBiZWxpZXZlIGl0IGlzIGEgdmlhYmxlIHNvbHV0aW9uIGxvbmcgdGVybS4NCj4gDQo+IElm
IHdlIGRvbid0IGNvbnNpZGVyICJyZXVzYWJsZSIgbWVtb3J5IHJlZ2lvbnMgYXMgcGFydCBvZiB0
aGUNCj4gZGlzY3Vzc2lvbiwgdGhlIGRpc3RpbmN0aW9uIGJlY29tZXMgbW9yZSBwaGlsb3NvcGhp
Y2FsIHRoYW4gcHJhY3RpY2FsOg0KPiANCj4gLSBYZW4gaXMgbm90IHN1cHBvc2VkIHRvIHVzZSB0
aGVtIGZvciBhbnl0aGluZw0KPiAtIG9ubHkgZ2l2ZW4gdGhlbSB0byB0aGUgVk0gY29uZmlndXJl
ZCBmb3IgaXQNCj4gDQo+IEkgZG9uJ3Qgc2VlIG11Y2ggb2YgYSBkaWZmZXJlbmNlIHdpdGggTU1J
TyByZWdpb25zLCBleGNlcHQgZm9yIHRoZQ0KPiBleHBlY3RlZCBwYWdldGFibGUgYXR0cmlidXRl
czogaS5lLiBjYWNoZWFibGUsIG5vdC1jYWNoZWFibGUuIEJ1dCBldmVuDQo+IGluIHRoYXQgY2Fz
ZSwgdGhlcmUgY291bGQgYmUgcmVhc29uYWJsZSB1c2UgY2FzZXMgZm9yIG5vbi1jYWNoZWFibGUN
Cj4gbWFwcGluZ3Mgb2YgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMsIGV2ZW4gaWYgcmVzZXJ2ZWQt
bWVtb3J5IHJlZ2lvbnMgYXJlDQo+ICJub3JtYWwiIG1lbW9yeS4NCj4gDQo+IENvdWxkIHlvdSBw
bGVhc2UgaGVscCBtZSB1bmRlcnN0YW5kIHdoeSB5b3Ugc2VlIHRoZW0gc28gZGlmZmVyZW50bHks
IGFzDQo+IGZhciBhcyB0byBzYXkgdGhhdCAidHJlYXRpbmcgdGhlbSBhcyAiZGV2aWNlIiBmcm9t
IFhlbiBQT1YgaXMgYSBjbGVhcg0KPiBhYnVzZSBvZiB0aGUgbWVhbmluZyI/DQoNCk9idmlvdXNs
eSBpZiB5b3UgdGFrZSBoYWxmIG9mIHRoZSBwaWN0dXJlLCB0aGVuIGl0IG1ha2VzIHRoaW5ncyBl
YXNpZXIuDQpIb3dldmVyLCB3ZSBhcmUgbm90IGhlcmUgdG8gZGlzY3VzcyBoYWxmIG9mIHRoZSBw
aWN0dXJlIGJ1dCB0aGUgZnVsbCBvbmUgDQooZXZlbiBpZiBhdCB0aGUgZW5kIHlvdSBvbmx5IGlt
cGxlbWVudCBoYWxmIG9mIGl0KS4NCg0KPj4gSW5kZWVkLCBzb21lIG9mIHRoZSByZWdpb25zIG1h
eSBoYXZlIGEgcHJvcGVydHkgInJldXNhYmxlIiBhbGxvd2luZyB0aGUgdGhlIE9TDQo+PiB0byB1
c2UgdGhlbSB1bnRpbCB0aGV5IGFyZSBjbGFpbWVkIGJ5IHRoZSBkZXZpY2UgZHJpdmVyIG93bmlu
ZyB0aGUgcmVnaW9uLiBJDQo+PiBkb24ndCBrbm93IGhvdyBMaW51eCAob3IgYW55IG90aGVyIE9T
KSBpcyB1c2luZyBpdCB0b2RheSwgYnV0IEkgZG9uJ3Qgc2VlIHdoYXQNCj4+IHdvdWxkIHByZXZl
bnQgaXQgdG8gdXNlIHRoZW0gYXMgaHlwZXJjYWxsIGJ1ZmZlci4gVGhpcyB3b3VsZCBvYnZpb3Vz
bHkgbm90DQo+PiB3b3JrIGJlY2F1c2UgdGhleSBhcmUgbm90IGFjdHVhbCBSQU0gZnJvbSBYZW4g
UE9WLg0KPiANCj4gSSBoYXZlbid0IGF0dGVtcHRlZCBhdCBoYW5kbGluZyAicmV1c2FibGUiIHJl
c2VydmVkLW1lbW9yeSByZWdpb25zDQo+IGJlY2F1c2UgSSBkb24ndCBoYXZlIGEgdGVzdCBlbnZp
cm9ubWVudCBhbmQvb3IgYSB1c2UtY2FzZSBmb3IgdGhlbS4gSW4NCj4gb3RoZXIgd29yZHMsIEkg
ZG9uJ3QgaGF2ZSBhbnkgInJldXNhYmxlIiByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyBpbiBhbnkN
Cj4gb2YgdGhlIGJvYXJkcyAoWGlsaW54IGFuZCBub3QgWGlsaW54KSBJIGhhdmUgYWNjZXNzIHRv
LiBJIGNvdWxkIGFkZCBhDQo+IHdhcm5pbmcgaWYgd2UgZmluZCBhICJyZXVzYWJsZSIgcmVzZXJ2
ZWQtbWVtb3J5IHJlZ2lvbiBhdCBib290Lg0KDQpEb24ndCBnZXQgbWUgd3JvbmcsIEkgZG9uJ3Qg
YXNrIGZvciB0aGUgaW1wbGVtZW50YXRpb24gbm93LCBzbyBhIHdhcm5pbmcgDQp3b3VsZCBiZSBm
aW5lIGhlcmUuIEhvd2V2ZXIsIHlvdSBuZWVkIGF0IGxlYXN0IHRvIHNob3cgbWUgc29tZSBncm91
bmQgDQp0aGF0IHJlLXVzYWJsZSBtZW1vcnkgY2FuIGJlIGltcGxlbWVudGVkIHdpdGggeW91ciBz
b2x1dGlvbiBvciB0aGV5IGFyZSANCm5vdCBhIGNvbmNlcm4gZm9yIFhlbiBhdCBhbGwuDQoNCj4g
DQo+IE5vbmV0aGVsZXNzLCBpZiB5b3UgaGF2ZSBhIGNvbmNyZXRlIHN1Z2dlc3Rpb24gd2hpY2gg
ZG9lc24ndCByZXF1aXJlIGENCj4gY29tcGxldGUgcmV3b3JrIG9mIHRoaXMgc2VyaWVzLCBJIGNh
biB0cnkgdG8gcHV0IGV4dHJhIGVmZm9ydCB0byBoYW5kbGUNCj4gdGhpcyBjYXNlIGV2ZW4gaWYg
aXQgaXMgbm90IGEgYmVuZWZpdCB0byBteSBlbXBsb3llci4gSSBhbSBhbHNvIG9wZW4gdG8NCj4g
dGhlIHBvc3NpYmlsaXR5IG9mIGRyb3BwaW5nIHBhdGNoZXMgNi0xMCBmcm9tIHRoZSBzZXJpZXMu
DQpJIGRvbid0IHRoaW5rIHRoZSBzZXJpZXMgYXMgaXQgaXMgd291bGQgYWxsb3cgdXMgdG8gc3Vw
cG9ydCByZS11c2FibGUgDQptZW1vcnkuIEhvd2V2ZXIgYXMgSSBoYXZlbid0IHNwZW50IGVub3Vn
aCB0aW1lIHRvIHVuZGVyc3RhbmQgaG93IHRoaXMgDQpjb3VsZCBiZSBwb3NzaWJseSBkZWFsdC4g
U28gSSBhbSBoYXBweSB0byBiZSBwcm92ZWQgd3JvbmcuDQoNCj4gDQo+IFRoZXJlIGlzIGFsc28g
dGhlIG9wdGlvbiBvZiBnb2luZyB0byBkZXZpY2V0cmVlLm9yZyB0byByZXF1ZXN0IGEgbmV3DQo+
IGJpbmRpbmcgZGlmZmVyZW50IGZyb20gcmVzZXJ2ZWQtbWVtb3J5LiBJZiByZXNlcnZlZC1tZW1v
cnkgcmVnaW9ucyBhcmUNCj4gZXhwZWN0ZWQgdG8gYmUgdHJlYXRlZCBhcyBub3JtYWwgbWVtb3J5
IGZvciBhbGwgaW50ZW50cyBhbmQgcHVycG9zZXMNCj4gZXhjZXB0IGZvciBiZWluZyByZXNlcnZl
ZCBzb21ldGltZXMsIHRoZW4gdGhleSBtaWdodCBub3QgYmUgdGhlIHJpZ2h0DQo+IGJpbmRpbmdz
IHRvIGRlc2NyaWJlIFhpbGlueCBoYXJkd2FyZSwgd2hpY2ggcmVxdWlyZXMgZnVsbHkgZGVkaWNh
dGVkDQo+IG1lbW9yeSByZWdpb25zIHdpdGggYm90aCBjYWNoZWFibGUgYW5kIG5vbi1jYWNoZWFi
bGUgbWFwcGluZ3MgZm9yIHRoZQ0KPiBwdXJwb3NlIG9mIGNvbW11bmljYXRpbmcgd2l0aCBmb3Jl
aWduIENQVXMuDQo+IA0KPiBBcyBhIG1haW50YWluZXIsIGV2ZW4gaWYgdGhlIGFwcHJvYWNoIG1p
Z2h0IGNvbnNpZGVyZWQgbm90LWlkZWFsLCBteQ0KPiBvcGluaW9uIGlzIHRoYXQgdGhpcyBzZXJp
ZXMgaXMgc3RpbGwgYW4gaW1wcm92ZW1lbnQgb3ZlciB3aGF0IHdlIGhhdmUNCj4gdG9kYXkuDQoN
CldlbGwgeWVzIGl0IGlzIGFuIGltcHJvdmVtZW50IGNvbXBhcmUgdG8gd2hhdCB3ZSBoYXZlIHRv
ZGF5LiBIb3dldmVyLCBJIA0KZG9uJ3QgdGhpbmsgdGhlIHByb2JsZW0gb2YgdGhlIHJlc2VydmVk
LW1lbW9yeSByZWdpb24gaGFzIGJlZW4gZnVsbHkgDQp0aG91Z2h0IHRocm91Z2ggc28gZmFyLiBJ
IGFtIHdvcnJ5IHRoYXQgeW91ciBzdWdnZXN0aW9uIGlzIGdvaW5nIHRvIHB1dCANCnVzIGludG8g
YSBjb3JuZXIgbWFrZSBpbXBvc3NpYmxlIHRvIGV4cGFuZCBpdCAoc3VjaCBhcyByZS11c2FibGUp
IGluIHRoZSANCmZ1dHVyZSB3aXRob3V0IGJyZWFraW5nIGJhY2t3YXJkIGNvbXBhdGliaWxpdHku
DQoNCk1heWJlIHlvdXIgc29sdXRpb24gaXMgY29ycmVjdCBhbmQgd2Ugd2lsbCBiZSBhYmxlIHRv
IGV4cGFuZCBmb3IgDQpyZS11c2FibGUgb3IgYXQgbGVhc3QgYWRkIGl0IGluIGEgYmFja3dhcmQg
Y29tcGF0aWJsZSB3YXkuIEJ1dCBmb3IgdGhhdCwgDQpJIG5lZWQgc29saWQgZXhwbGFuYXRpb24g
ZnJvbSB5b3VyIHNpZGUgdGhhdCBpdCB3b3VsZCBiZSBwb3NzaWJsZS4NCg0KPj4gT24gYSBzaW1p
bGFyIHRvcGljLCBiZWNhdXNlIHRoZXkgYXJlIG5vcm1hbCBtZW1vcnksIEkgZG9uJ3QgdGhpbmsN
Cj4+IFhFTl9ET01DVExfbWVtb3J5X21hcHBpbmcgc2hvdWxkIGJlIGFibGUgdG8gbWFwIHJlc2Vy
dmVkLXJlZ2lvbnMuIFNvIHRoZSBpb21lbQ0KPj4gcmFuZ2VzZXQgc2hvdWxkIG5vdCBjb250YWlu
IHRoZW0uDQo+IA0KPiBXaGF0IGh5cGVyY2FsbCBkbyB5b3Ugc3VnZ2VzdCBzaG91bGQgYmUgdXNl
ZCBpbnN0ZWFkPw0KDQpMZXQncyB0YWxrIGFib3V0IHRoYXQgb25jZSB3ZSBhZ3JlZSBvbiB0aGUg
b3ZlcmFsbCBhcHByb2FjaCBmb3IgDQpyZXNlcnZlZC1tZW1vcnkuDQoNCkNoZWVycywNCg0KLS0g
DQpKdWxpZW4gR3JhbGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
