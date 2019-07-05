Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97A3608C3
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 17:08:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjPmq-0006OB-D6; Fri, 05 Jul 2019 15:06:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xMCB=VC=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hjPmo-0006O5-Pd
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 15:06:06 +0000
X-Inumbo-ID: 6845ce1c-9f36-11e9-8980-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::70d])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6845ce1c-9f36-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 15:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4n6NO1pUMmtRK+DXC5AZomIpsL1N7hhk+/OyQSOd1M=;
 b=aTl0ifp3ol8tMrKSEruTuopvcPyvKEnaiBOIlB5pvXA0ZBYUIGqlKObEFzIKcWWg59dJ99vYIhqWlGDruOGxujSF/mG30CCEHS8+5rcCmwmyWkXy4KT5k9DH8HbGymAw/vvwAvNOSHsMpVVfm8vj4O/ZtFsgPDiXNP7nlPxyTTM=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2526.eurprd02.prod.outlook.com (10.173.79.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Fri, 5 Jul 2019 15:06:01 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03%8]) with mapi id 15.20.2052.010; Fri, 5 Jul 2019
 15:06:01 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v2] x86/mm: Clean IOMMU flags from p2m-pt code
Thread-Index: AQHVMZ3eVPiN3NnZMUe+cwMyPT0RlKa8HFuAgAAGt4A=
Date: Fri, 5 Jul 2019 15:06:01 +0000
Message-ID: <b0bd291c-2408-5f64-446c-34abfaa3bf63@bitdefender.com>
References: <20190703125004.25451-1-aisaila@bitdefender.com>
 <0b68a345-9eeb-1f21-bd0e-8a12a3f0e126@suse.com>
In-Reply-To: <0b68a345-9eeb-1f21-bd0e-8a12a3f0e126@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2P264CA0018.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::30)
 To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6c0ba26-f7fd-456c-8173-08d7015a4b24
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2526; 
x-ms-traffictypediagnostic: VI1PR0202MB2526:|VI1PR0202MB2526:
x-microsoft-antispam-prvs: <VI1PR0202MB252653FFAF0CFE8D34059D31ABF50@VI1PR0202MB2526.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(136003)(39860400002)(376002)(396003)(346002)(366004)(189003)(199004)(6916009)(81156014)(81166006)(25786009)(476003)(11346002)(6246003)(4326008)(229853002)(53936002)(446003)(26005)(71200400001)(2616005)(71190400001)(102836004)(6486002)(486006)(36756003)(2906002)(99286004)(31686004)(68736007)(52116002)(76176011)(14454004)(53546011)(386003)(6512007)(6506007)(256004)(14444005)(66476007)(186003)(478600001)(6436002)(6116002)(3846002)(31696002)(8936002)(5660300002)(7736002)(66446008)(316002)(66066001)(54906003)(66946007)(66556008)(305945005)(73956011)(8676002)(64756008)(86362001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2526;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uoiaoZcBPt88ZgjcV32jeeoewm4stI0EBIY7aQVxZhQ5faeHN+BCZuMn2p/bAzHt8tYSxnH9cX4GOoBELdPVmPgYuSMuK1yciOyuQTnd3hWXgCsB1Oq7qxK4lFVPBB8Ju/XS/EcGRSBIXkW5l7W/DnDdLVRflDVfIlhWUSFNrIF1U4ela2kxoQzU0bsEj3XiuSe/13prF7cs8xWJrPzUnUwV3KHBsyH/MNvVMkENVSoWo/Gf5WUe9+10QVhA06pc+JmGlAgNAI5ecz7LVWE4nrYqwtjBQ1vcHrmgxjSBTnx9Z08RHIMwdhgQVoDbs0lWmReukTD49cIjadgqocSiQkdPHmgvrsPPCjz1NUaOdBmV7m2vdYmizZ2kY1AKscqRe91R3e6CwRLTi6ddk2khMx7DslYcd3VQDLwmcguwMoQ=
Content-ID: <330F7A3BCFFC1944ABAC89D06CBF41F6@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c0ba26-f7fd-456c-8173-08d7015a4b24
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 15:06:01.7694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2526
Subject: Re: [Xen-devel] [PATCH v2] x86/mm: Clean IOMMU flags from p2m-pt
 code
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
Cc: "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>, "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIDAzLjA3LjIwMTkgMTQ6NTAsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0K
Pj4gQXQgdGhpcyBtb21lbnQgSU9NTVUgcHQgc2hhcmluZyBpcyBkaXNhYmxlZCBieSBjb21taXQg
WzFdLg0KPj4NCj4+IFRoaXMgcGF0Y2ggYWltcyB0byBjbGVhciB0aGUgSU9NTVUgaGFwIHNoYXJl
IHN1cHBvcnQgYXMgaXQgd2lsbCBub3QgYmUNCj4+IHVzZWQgaW4gdGhlIGZ1dHVyZS4gQnkgZG9p
bmcgdGhpcyB0aGUgSU9NTVUgYml0cyB1c2VkIGluIHB0ZVs1Mjo1OF0gY2FuDQo+PiBiZSB1c2Vk
IGluIG90aGVyIHdheXMuDQo+Pg0KPj4gWzFdIGMyYmEzZGIzMWVmMmQ5ZjFlNDBlN2I2YzE2Y2Yz
YmUzZDY3MWQ1NTUNCj4gDQo+IFRoaXMgYWxsIG1ha2VzIGl0IHNvdW5kIGFzIGlmIHRoaXMgd2Fz
IGdlbmVyYWxseSB0aGUgY2FzZSwgYnV0IGl0J3MNCj4gc28gb25seSBvbiB0aGUgQU1EIHNpZGUu
IE9uIFZULWQgLyBWVC14IHBhZ2UgdGFibGUgc2hhcmluZyBjb250aW51ZXMNCj4gdG8gd29yay4g
QnV0IGl0IG1heSBiZSBqdXN0IG1lIHRoYXQgSSdkIHByZWZlciB0aGlzIHRvIG5vdCBiZSBpbXBs
aWVkDQo+IGZyb20gdGhlIG1lbnRpb24gb2YgcDJtLXB0IGluIHRoZSB0aXRsZSwgc28gSSdsbCBs
ZWF2ZSBpdCB0byBHZW9yZ2UNCj4gYXMgdGhlIG1haW50YWluZXIgdG8gZGVjaWRlIHdoZXRoZXIg
YSBmdXJ0aGVyIGNoYW5nZSB0byB0aGUNCj4gZGVzY3JpcHRpb24gaXMgbmVlZGVkLg0KPiANCj4g
QW5kIHRoZW4gSSB3b3VsZCBvZiBjb3Vyc2UgaGF2ZSB3aXNoZWQgdGhhdCBhIGNsZWFudXAgcGF0
Y2ggbGlrZSB0aGlzDQo+IG9uZSBkZWFsdCB3aXRoIGJvdGggc2lkZXMsIGkuZS4gcmVtb3ZlZCBw
dCBzaGFyaW5nIHJlbWFpbnMgZnJvbQ0KPiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvIGF0
IHRoZSBzYW1lIHRpbWUgKGkuZS4gaWYgbm90IGluIG9uZQ0KPiBwYXRjaCwgdGhlbiBhdCBsZWFz
dCBpbiB0aGUgc2FtZSBzZXJpZXMpLiBCdXQgdGhpcyBtYXkgYWdhaW4gYmUganVzdA0KPiBtZSAu
Li4NCj4gDQoNCkp1c3QgdG8gY2xhcmlmeSwgYXJlIHlvdSB0YWxraW5nIGFib3V0IHRoZSBhbWRf
aW9tbXVfc2hhcmVfcDJtKCkgDQpmdW5jdGlvbiB0aGF0IHdpbGwgbm90IGJlIGNhbGxlZCBhbnkg
bW9yZSBpZiB0aGUgaW9tbXVfaGFwX3B0X3NoYXJlIGZsYWcgDQp3aWxsIGJlIGRlbGV0ZWQ/IElm
IHNvIEkgY2FuIGFkZCB0aGlzIGluIGEgMiBwYXRjaCBzZXJpZXMuDQoNCkFsZXgNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
