Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521306CF02
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:39:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6b5-0001Kw-Pl; Thu, 18 Jul 2019 13:37:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho6b4-0001Kq-2x
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:37:22 +0000
X-Inumbo-ID: 293fa70e-a961-11e9-923e-6bc317b16dff
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 293fa70e-a961-11e9-923e-6bc317b16dff;
 Thu, 18 Jul 2019 13:37:19 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 13:37:17 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 13:37:03 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 13:37:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ho21qak6J5QzPDMp3vDuwzw2D9IEmuvvakhz19cyYkzBPPRzNgV7x0OFGu7nDvILVVMkpPxAwo2cpWNZGqkk1Dgl3z8X+NN8C6dj/Vy1H+1PZNRck8HetHfD+UifcPK9A80l9gxs3mVFr26T2yjqIesckUgtPWhVrx5dtTcgbY5MBvam5Y3v8T4KBicTgEjQ7Ehvrdhj5qAJFpm0d6NDrpfr/e2rt6N8vRDnyOD5eV5e9BiNTH2r8lwI1YTP69kQHWVeGh6gjiJidLgiUfvMquGhJhXN1j9N8UdQmEmbzgUHx157R4tGtZ3baVu9sO2ZHauo6ySg6V5qoAL1e/rrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6OeLqUEMnKmAtqPybt9VT42ApnkeHXZycGSku74TZs=;
 b=F+7mS9YLecyzaW7tBL+nvlY4QpWMK4hEkRK8GI9EvyaFK0SPu2EAbiZHrSyNSBNfemQpHDH6FPwgQjk/Iuv3NsU7Bu14XOc1Inj6PZQKf7wIjXHsJNNalZIBTiH10snR6ODEOtslA//tD+zmXiW8nh9gDTC5C4DE9CLcFDpxtfEgN9T1XAEtzVzWR0ljAPjMNhX8L+fsNgZlXMCKHuzAbRiFbZnq9z8lcKtVDJ+N8JZX9W59U0lB0m2D+fFgpqjZLEJlgTsZR4pnLflciFNHjz3dA/NfrqAXnHoTZq7pR/qSTPnuiL+hVxcNH7Yvd8pjXFepXBQj8Y+Pfc3Aa/xXHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2972.namprd18.prod.outlook.com (20.179.52.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 13:37:01 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 13:37:01 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [Xen-devel] [PATCH v6 5/5] x86/mem_sharing: style cleanup
Thread-Index: AQHVPNaxkDvYm35RQ027yAvXjVGEzqbQNNsAgAAjJviAAAPJgIAAAPIjgAAFVAA=
Date: Thu, 18 Jul 2019 13:37:01 +0000
Message-ID: <9d59429f-c54e-9e3c-1b85-3b49ed98a6b7@suse.com>
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-6-tamas@tklengyel.com>
 <7d6e93e9-8037-e0ed-5c2b-e00a810bc7e4@suse.com>
 <CABfawhm35+gf=3J-OYo84nwymDAx2vCrgtyqSe2it4LAgpxYTw@mail.gmail.com>
 <95234c89-846c-1f65-7418-0c2187aa0067@suse.com>
 <CABfawhmDTQ6d+FDhY3PLydE1rshew-EnRBH-SjgV2DLCdbAgiw@mail.gmail.com>
In-Reply-To: <CABfawhmDTQ6d+FDhY3PLydE1rshew-EnRBH-SjgV2DLCdbAgiw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0092.eurprd07.prod.outlook.com
 (2603:10a6:6:2b::30) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e57c1171-50f8-47b1-3aff-08d70b850385
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2972; 
x-ms-traffictypediagnostic: DM6PR18MB2972:
x-microsoft-antispam-prvs: <DM6PR18MB297281E4E92E024CAADF143BB3C80@DM6PR18MB2972.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(199004)(189003)(68736007)(53936002)(6512007)(36756003)(186003)(31686004)(229853002)(102836004)(99286004)(316002)(26005)(446003)(11346002)(2616005)(476003)(305945005)(76176011)(53546011)(386003)(52116002)(6506007)(486006)(66066001)(6916009)(7736002)(5660300002)(66446008)(66946007)(71200400001)(71190400001)(66476007)(8676002)(6246003)(2906002)(478600001)(6436002)(80792005)(14444005)(4326008)(6116002)(3846002)(31696002)(256004)(6486002)(81156014)(81166006)(25786009)(8936002)(14454004)(66556008)(86362001)(64756008)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2972;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UhB/28Yd5fMBFtJN9SMl9r/4rdo4pdQBDltbP4L2fAHXAApopGA5LykTLxi4mlnBZAY1XIADjb77ksmdAyS6/AlD72kd9fK7cjj//EZpDXf+bC43qyj7PxtaeT2G2n3O+oLbBnfs6GhqpYHOkJsXWmxERDof5nTWCRuwTpMMihIjAJfj7z64AqfZH3fMsQNaxUJE2xmuRLcYSY5Yja67ohlFJLs0omIbb6SpOm6NkJAqmFU0WBVf8uzT3EdTcWNg40CQDJjkXW2dAqBJNf9yMy3vaYOmRv2g3VScos7QjFrGdKXR82BVm1r82GPHxmsie9LezltY65XU/XXPt9XpspJCJ1puTfQKGn9AmplahGMsmkIoiTleXq9iBuhW+rZuXRiI4KmyFG2sjpd8A1sgcVVUTWFLoOhoRglp/qEc6tg=
Content-ID: <D012561795BB174AA4EF09D71D173DF1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e57c1171-50f8-47b1-3aff-08d70b850385
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 13:37:01.5872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2972
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v6 5/5] x86/mem_sharing: style cleanup
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxNToxNiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBPbiBUaHUsIEp1
bCAxOCwgMjAxOSBhdCA3OjE0IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6DQo+Pg0KPj4gT24gMTguMDcuMjAxOSAxNDo1OSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0K
Pj4+IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDQ6NTYgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4+Pj4NCj4+Pj4gT24gMTcuMDcuMjAxOSAyMTozMywgVGFtYXMg
SyBMZW5neWVsIHdyb3RlOg0KPj4+Pj4gQEAgLTEzNiw4ICsxMzcsOCBAQCBzdGF0aWMgaW5saW5l
IGJvb2wgX3BhZ2VfbG9jayhzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQ0KPj4+Pj4gICAgICAgICAg
ICAgICAgIGNwdV9yZWxheCgpOw0KPj4+Pj4gICAgICAgICAgICAgbnggPSB4ICsgKDEgfCBQR1Rf
bG9ja2VkKTsNCj4+Pj4+ICAgICAgICAgICAgIGlmICggISh4ICYgUEdUX3ZhbGlkYXRlZCkgfHwN
Cj4+Pj4+IC0gICAgICAgICAgICAgISh4ICYgUEdUX2NvdW50X21hc2spIHx8DQo+Pj4+PiAtICAg
ICAgICAgICAgICEobnggJiBQR1RfY291bnRfbWFzaykgKQ0KPj4+Pj4gKyAgICAgICAgICAgICAg
ICAhKHggJiBQR1RfY291bnRfbWFzaykgfHwNCj4+Pj4+ICsgICAgICAgICAgICAgICAgIShueCAm
IFBHVF9jb3VudF9tYXNrKSApDQo+Pj4+PiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0K
Pj4+Pj4gICAgICAgICB9IHdoaWxlICggY21weGNoZygmcGFnZS0+dS5pbnVzZS50eXBlX2luZm8s
IHgsIG54KSAhPSB4ICk7DQo+Pj4+DQo+Pj4+IEFyZW4ndCB5b3Ugc2NyZXdpbmcgdXAgaW5kZW50
YXRpb24gaGVyZT8gSXQgbG9va3Mgd3JvbmcgYm90aCBpbiBteQ0KPj4+PiBtYWlsIGNsaWVudCdz
IHZpZXcgYW5kIG9uIHRoZSBsaXN0IGFyY2hpdmVzLCB3aGVyZWFzLiBGdXJ0aGVybW9yZQ0KPj4+
PiB0aGlzIGlzIGNvZGUgeW91J3ZlIGludHJvZHVjZWQgZWFybGllciBpbiB0aGUgc2VyaWVzLCBz
byBpdCBzaG91bGQNCj4+Pj4gYmUgZ290IHJpZ2h0IHRoZXJlLCBub3QgaGVyZS4NCj4+Pg0KPj4+
IFRoZSBzdHlsZSB3YXMgYXV0by1hcHBsaWVkIHdpdGggYXN0eWxlIHVzaW5nIHRoZSBic2QgZm9y
bWF0LiBJbiB0aGUNCj4+PiBwcmV2aW91cyBwYXRjaCB0aGVyZSB3ZXJlIG5vIHN0eWxlLWNoYW5n
ZXMgYXBwbGllZCBiZWNhdXNlIGl0IHdhcyBhDQo+Pj4gY29weS1wYXN0ZSBqb2IgZnJvbSB0aGUg
b3RoZXIgY29kZSBsb2NhdGlvbi4gSSByYXRoZXIga2VlcA0KPj4+IGNvZGUtY29weWluZyBhbmQg
c3R5bGUgZml4ZXMgc2VwYXJhdGUuDQo+Pg0KPj4gQnV0IHlvdSdyZSBhY3RpdmVseSBicmVha2lu
ZyBYZW4gc3R5bGUgaGVyZSAoYW5kIGJlbG93KS4NCj4gDQo+IEkgZG9uJ3Qgc2VlIGFueSBtZW50
aW9uIG9mIHN0eWxlIHJlc3RyaWN0aW9ucyByZWdhcmRpbmcgdGhpcyBpbg0KPiBDT0RJTkdfU1RZ
TEUuIElmIHRoZXJlIGlzLCBJIHdvdWxkIHByZWZlciBjaGFuZ2luZyB0aGF0IHNvIHdlIGNhbg0K
PiBhdXRvbWF0ZSBzdHlsZSBjaGVja3Mgd2hpY2ggSU1ITyBhcmUgdGhlIGJpZ2dlc3Qgd2FzdGUg
b2YgZXZlcnlvbmUncw0KPiB0aW1lIHRvIGRvIG1hbnVhbGx5Lg0KDQouL0NPRElOR19TVFlMRSBm
YWlscyB0byBtZW50aW9uIG1hbnkgYXNwZWN0cyBvZiB3aGF0IHdlIGRvIGV2ZXJ5d2hlcmUuDQpB
bG1vc3QgYW55IGF0dGVtcHQgb2YgdXBkYXRpbmcgaXQgaGFzIGZhaWxlZCBmb3IgbWUgaW4gdGhl
IHBhc3QsIG9mdGVuDQpkdWUgdG8gZW50aXJlIGxhY2sgb2YgcmVzcG9uc2VzIG9uIHBhdGNoZXMg
KGluIG90aGVyIGNhc2VzIGFsc28gYmVjYXVzZQ0Kb2YgcGVvcGxlIGRpc2FncmVlaW5nKS4gRGVz
cGl0ZSB5b3UgYmVpbmcgdGhlIG1haW50YWluZXIgb2YgdGhlIGZpbGUgSQ0Kc3Ryb25nbHkgdGhp
bmsgeW91IHNob3VsZG4ndCBhY3RpdmVseSBicmVhayBzdHlsZSB0aGF0J3MgaW4gbGluZSB3aXRo
DQpsYXJnZSBzd2F0aGVzIG9mIGNvZGUgZWxzZXdoZXJlLg0KDQpKYW4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
