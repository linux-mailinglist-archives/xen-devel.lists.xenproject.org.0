Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0958F713CE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 10:21:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hppzk-00071a-BD; Tue, 23 Jul 2019 08:18:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TpCo=VU=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hppzi-00071S-Nl
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 08:17:58 +0000
X-Inumbo-ID: 5fdf09ad-ad22-11e9-8980-bc764e045a96
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.127]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5fdf09ad-ad22-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 08:17:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqLskZPAcez9hUGfTJA1xf9CMnRP4BeH32EXdeH7wLLQx++iBv0wdNoxs/Rm4TkGTi5Q2SjDjwEtmj2UasSQ/TpWDqABfFUWODyrccvlZZiWVCO4/H9+CRL/s1B+R4yK7loBxZzEssV3/O7VRWbMzdzSGgAD2o+erRY7Nh0ELttoSjAz29QQvfaJx76kCEy7JNVHARKXOrj0+CQ55vTGSHVrooeTgWeCaj7cbfz+jpVS2lycv9l1L8h0V1RAaDGPLhPy9cNhvpof8yEk9qkSMRyZJ3mkqv59jbsHUCIZkTpfE2L1/Pz/Def2iVgxlOfV5QYfJA5rQIMm+xvRkXshZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Q1wotiUOV5Sk4cSeZvV+GaduQJL9uT9YaFyQF8zXVs=;
 b=HIONrVs2RhcQMRaVh9U+yD8rmaEbZv4DXwgi/NPgd7RKQkBOBDtz1ykMBVjGeD970KqTVLXUfLiOCla+zfezMOybvsiqN1QIiJX3bvTW0u+oqSx84HKZlq/TRDjrYmZOqhn6IvMc7zlSw649NPT52dPhslClMnjuOXmyJyqqbVy1q4otkALqlazGV/ejhTv2JNIC+8UDxYXLBdxDe84zfhF3n88H39aPjAMeEa/oxkriQpVJVFIB8Pu5rTf+SUSE/bM9610XC4n+SyeZM4yn8ksMvbQih07E3xEwGn5jvsaZsvSoQ6i+N/qNWHkRqbPWPD3W/isJ3Z7L/SuT6lOrbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Q1wotiUOV5Sk4cSeZvV+GaduQJL9uT9YaFyQF8zXVs=;
 b=BK7G/WdHPP4SKmSuqNQWJPaZuTeysuDNIFfomXBDMfrMOStDJWvM/KzOmRnyZn9qJkoIvJ9dV+6OPjHeWITEf0/v4gBbJ8Lq0F2mZNSEfc8ibRsRThuz8SL9ZP4X6FLZcLF44Ymv/rdvQnvlULd/WWagY2aiqoQnpzJsZO5aL9c=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB2640.eurprd02.prod.outlook.com (10.173.80.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Tue, 23 Jul 2019 08:17:53 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd6a:880a:7de3:75ce]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd6a:880a:7de3:75ce%9]) with mapi id 15.20.2094.017; Tue, 23 Jul 2019
 08:17:53 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v7] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMY4Gmux1Y/IiSU2ZKtKyOfOCuKbQbceAgAG+GQD//9nvgIAF9VAA
Date: Tue, 23 Jul 2019 08:17:53 +0000
Message-ID: <7666f388-3343-5bdd-cff0-3176a228496f@bitdefender.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <7a4c824d-3ccd-b289-3e8e-ff94ea916b3e@suse.com>
 <0d1ab92f-171b-98d9-a69e-5aa7cfbe0d85@bitdefender.com>
 <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
In-Reply-To: <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0056.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::20) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc2cfa16-a105-4d2b-0414-08d70f46425a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2640; 
x-ms-traffictypediagnostic: VI1PR0202MB2640:|VI1PR0202MB2640:
x-microsoft-antispam-prvs: <VI1PR0202MB2640C80BB6DFE49BAF86C465ABC70@VI1PR0202MB2640.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(376002)(136003)(396003)(346002)(51914003)(51444003)(189003)(199004)(8936002)(81156014)(186003)(81166006)(8676002)(5660300002)(36756003)(71190400001)(71200400001)(486006)(2616005)(6916009)(476003)(256004)(14444005)(25786009)(2906002)(31686004)(11346002)(3846002)(6116002)(53936002)(76176011)(4326008)(446003)(52116002)(6486002)(6246003)(99286004)(6436002)(68736007)(26005)(229853002)(386003)(6506007)(53546011)(316002)(54906003)(102836004)(6512007)(66066001)(14454004)(31696002)(86362001)(66946007)(305945005)(66476007)(66446008)(64756008)(478600001)(66556008)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2640;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SP5/0UzweNzP7xJKRIF/3vQqdBGwA4pFgmXNFJPo+eNeJvpwMTIneLv4T9Rb+pMZYqi5lG10QS7v4l1+S81Zu8+rkYjIZEpoDSn/obdd4SGS4O0B27MlbycaN5imLez75P/f46NxR9L2L4OVsw6VyVRMrxK34GrRvaytnDTJuzpKk8A392k+jye3R8vUlLPkdks+8fxIaNC0z6ycV/hKHzycpuMQ5Twhd5+xoy8y2VlI0u2Vzp+JORlkxw+rZWlux/G8Gn8Oivdc0ubk9Fz+V01Fa7XI3OQ73Fx7rXE1Xi0WUCqw2cv6e95HDcdu2Q3gwHHw6FSpJ6VSZUeSpw+pu9Oxx7mpju4/SuUsWfkYxPhoekhgMMJCnewXfNdyh5b1ClIvtf5wR9/DV8fwnugYlaN2BZ2sLKW4geHKpPsDM0g=
Content-ID: <CAF8F468F52AB846867315DA3D80F69E@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2cfa16-a105-4d2b-0414-08d70f46425a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 08:17:53.4149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2640
Subject: Re: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
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
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE5LjA3LjIwMTkgMTY6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOS4wNy4y
MDE5IDE0OjM0LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IE9uIDE4LjA3LjIw
MTkgMTU6NTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAzLjA3LjIwMTkgMTI6NTYsIEFs
ZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KDQo+Pj4+IEN1cnJlbnRseSwgd2UgYXJlIGZ1
bGx5IGVtdWxhdGluZyB0aGUgaW5zdHJ1Y3Rpb24gYXQgUklQIHdoZW4gdGhlIGhhcmR3YXJlIHNl
ZXMNCj4+Pj4gYW4gRVBUIGZhdWx0IHdpdGggbnBmZWMua2luZCAhPSBucGZlY19raW5kX3dpdGhf
Z2xhLiBUaGlzIGlzLCBob3dldmVyLA0KPj4+PiBpbmNvcnJlY3QsIGJlY2F1c2UgdGhlIGluc3Ry
dWN0aW9uIGF0IFJJUCBtaWdodCBsZWdpdGltYXRlbHkgY2F1c2UgYW4NCj4+Pj4gRVBUIGZhdWx0
IG9mIGl0cyBvd24gd2hpbGUgYWNjZXNzaW5nIGEgX2RpZmZlcmVudF8gcGFnZSBmcm9tIHRoZSBv
cmlnaW5hbCBvbmUsDQo+Pj4+IHdoZXJlIEEvRCB3ZXJlIHNldC4NCj4+Pj4gVGhlIHNvbHV0aW9u
IGlzIHRvIHBlcmZvcm0gdGhlIHdob2xlIGVtdWxhdGlvbiwNCj4+Pg0KPj4+IEFib3ZlIHlvdSBz
YWlkIGZ1bGx5IGVtdWxhdGluZyBzdWNoIGFuIGluc24gaXMgaW5jb3JyZWN0LiBUbyBtZSB0aGUN
Cj4+PiB0d28gc3RhdGVtZW50cyBjb250cmFkaWN0IG9uZSBhbm90aGVyLg0KPj4+DQo+Pj4+IHdo
aWxlIGlnbm9yaW5nIEVQVCByZXN0cmljdGlvbnMNCj4+Pj4gZm9yIHRoZSB3YWxrIHBhcnQsIGFu
ZCB0YWtpbmcgdGhlbSBpbnRvIGFjY291bnQgZm9yIHRoZSAiYWN0dWFsIiBlbXVsYXRpbmcgb2YN
Cj4+Pj4gdGhlIGluc3RydWN0aW9uIGF0IFJJUC4NCj4+Pg0KPj4+IFNvIHRoZSAiaWdub3JlIiBw
YXJ0IGhlcmUgaXMgYmVjYXVzZSB0aGUgd2FsayBkb2Vzbid0IGN1cnJlbnRseSBzZW5kDQo+Pj4g
YW55IGV2ZW50cz8gVGhhdCdzIGFuIG9taXNzaW9uIGFmdGVyIGFsbCwgd2hpY2ggdWx0aW1hdGVs
eSB3YW50cyB0bw0KPj4+IGdldCBmaXhlZC4gVGhpcyBpbiB0dXJuIG1ha2VzIG1lIHdvbmRlciB3
aGV0aGVyIHRoZXJlIGNvdWxkbid0IGJlDQo+Pj4gY2FzZXMgd2hlcmUgYSBtb25pdG9yIGFjdHVh
bGx5IHdhbnRzIHRvIHNlZSB0aGVzZSB2aW9sYXRpb25zLCB0b28uDQo+Pj4gQWZ0ZXIgYWxsIG9u
ZSBtYXkgYmUgYWJsZSB0byBhYnVzZSB0byBwYWdlIHdhbGtlciB0byBzZXQgYml0cyBpbg0KPj4+
IHBsYWNlcyB5b3UgYWN0dWFsbHkgY2FyZSB0byBwcm90ZWN0IGZyb20gdW5kdWUgbW9kaWZpY2F0
aW9uLg0KPj4NCj4+IFRoZXJlIGlzIG5vIG5lZWQgZm9yIGV2ZW50cyBmcm9tIHBhZ2Ugd2Fsay4g
RnVydGhlciB3b3JrIHdpbGwgaGF2ZSB0byBiZQ0KPj4gZG9uZSwgd2hlbiBwYWdlLXdhbGsgd2ls
bCBzZW5kIGV2ZW50cywgc28gdGhhdCB3ZSBjYW4gdG9nZ2xlIHRoYXQgbmV3DQo+PiBmZWF0dXJl
IG9uL29mZi4NCj4gDQo+IFBsZWFzZSBjYW4geW91IG1vdmUgb3ZlciB0byB0aGlua2luZyBpbiBt
b3JlIGdlbmVyYWwgdGVybXMsDQo+IG5vdCBqdXN0IHdoYXQgeW91IG5lZWQgZm9yIHlvdXIgYXBw
bGljYXRpb24uIEluIHRoaXMgY2FzZQ0KPiAiVGhlcmUgaXMgbm8gbmVlZCIgIT0gIldlIGRvbid0
IGhhdmUgYSBuZWVkIGZvciIuIEFuZCBJIHRoaW5rDQo+IHRoZSBWTSBldmVudCBfaW50ZXJmYWNl
XyBzaG91bGQgYmUgYXJyYW5nZWQgaW4gYSB3YXkgdGhhdCBpdA0KPiBhbHJlYWR5IGFjY291bnRz
IGZvciBldmVudHVhbGx5IGNvcnJlY3QgYmVoYXZpb3Igb2YgdGhlIHBhZ2UNCj4gd2FsayBwYXRo
cy4NCj4gDQoNCkknbSBub3Qgc3VyZSBob3cgZnV0dXJlIGNvZGUgZm9yIHNlbmRpbmcgZXZlbnRz
IGZvcm0gcGFnZS13YWxrIHdpbGwgYmUgDQpidXQgSSB3aWxsIHRyeSB0byBtYWtlIHRoaXMgcGF0
Y2ggaGF2ZSBzb21lIGNoZWNrcyBpbiBwbGFjZSBzbyB0aGF0IGl0IA0Kd2lsbCB3b3JrIHRoZSBz
YW1lLg0KDQo+Pj4+IEFmdGVyIHRoZSBlbXVsYXRpb24gc3RvcHMgd2UnbGwgY2FsbCBodm1fdm1f
ZXZlbnRfZG9fcmVzdW1lKCkgYWdhaW4gYWZ0ZXIgdGhlDQo+Pj4+IGludHJvc3BlY3Rpb24gYWdl
bnQgdHJlYXRzIHRoZSBldmVudCBhbmQgcmVzdW1lcyB0aGUgZ3Vlc3QuIFRoZXJlLCB0aGUNCj4+
Pj4gaW5zdHJ1Y3Rpb24gYXQgUklQIHdpbGwgYmUgZnVsbHkgZW11bGF0ZWQgKHdpdGggdGhlIEVQ
VCBpZ25vcmVkKSBpZiB0aGUNCj4+Pj4gaW50cm9zcGVjdGlvbiBhcHBsaWNhdGlvbiBhbGxvd3Mg
aXQsIGFuZCB0aGUgZ3Vlc3Qgd2lsbCBjb250aW51ZSB0byBydW4gcGFzdA0KPj4+PiB0aGUgaW5z
dHJ1Y3Rpb24uDQo+Pj4+DQo+Pj4+IFdlIHVzZSBodm1lbXVsX21hcF9saW5lYXJfYWRkcigpIHRv
IGludGVyY2VwdCByL3cgYWNjZXNzIGFuZA0KPj4+PiBfX2h2bV9jb3B5KCkgdG8gaW50ZXJjZXB0
IGV4ZWMgYWNjZXNzLg0KPj4+DQo+Pj4gQnR3IEkgY29udGludWUgdG8gYmUgdW5oYXBweSBhYm91
dCB0aGlzIGFzeW1tZXRyeS4gRnVydGhlcm1vcmUgaW4NCj4+PiB0aGUgZm9ybWVyIGNhc2UgeW91
IG9ubHkgaGFuZGxlIHdyaXRlIGFuZCBybXcgYWNjZXNzZXMsIGJ1dCBub3QNCj4+PiByZWFkcyBh
ZmFpY3MuIEkgYXNzdW1lIHlvdSBkb24ndCBjYXJlIGFib3V0IHJlYWRzLCBidXQgdGhpcyBzaG91
bGQNCj4+PiB0aGVuIGJlIG1hZGUgZXhwbGljaXQuIEZ1cnRoZXJtb3JlIEVQVCBhbGxvd3MgcmVh
ZCBwcm90ZWN0aW9uLCBhbmQNCj4+PiB0aGVyZSBhcmUgcDJtX2FjY2Vzc193LCBwMm1fYWNjZXNz
X3d4LCBhbmQgcDJtX2FjY2Vzc194LCBzbyBJIGd1ZXNzDQo+Pj4gaWdub3JpbmcgcmVhZHMgY2Fu
IGF0IGJlc3QgYmUgYW4gb3B0aW9uIHBpY2tlZCBieSB0aGUgbW9uaXRvciwgbm90DQo+Pj4gc29t
ZXRoaW5nIHRvIGJlIGxlZnQgb3V0IG9mIHRoZSBpbnRlcmZhY2UgYWx0b2dldGhlci4NCj4+DQo+
PiBUaGF0IGlzIGNvcnJlY3QsIHdlIGFyZSBub3QgaW50ZXJlc3RlZCBpbiByZWFkIGV2ZW50cyBi
dXQgdGhlcmUgaXMNCj4+IGFub3RoZXIgcHJvYmxlbSwgd2UgYXJlIGNoZWNraW5nIGFjY2VzcyBh
bmQgcGZlYyB0byBmaWxsIHRoZSBldmVudCBmbGFnDQo+PiBhbmQgcGZlYyBvbmx5IGhhcyBhIHdy
aXRlIGZsYWcoUEZFQ193cml0ZV9hY2Nlc3MpLCBpbiBfX2h2bWVtdWxfcmVhZCgpDQo+PiBwZmVj
IG9ubHkgZ2V0cyBQRkVDX3BhZ2VfcHJlc2VudCBhbmQgdGhlcmUgaXMgbm8gd2F5IHRvIGRpZmZl
cmVudGlhdGUNCj4+IHdyaXRlIGZyb20gcmVhZC4NCj4gDQo+IEJ5IHRoZSBQRkVDIG1vZGVsLCBh
bnl0aGluZyB0aGF0J3Mgbm90IGEgd3JpdGUgb3IgaW5zbiBmZXRjaCBpcyBhDQo+IHJlYWQuIFRo
ZSBtYWluIGFub21hbHkgaXMgZWxzZXdoZXJlOiBUaGUgd3JpdGUgZmxhZyBpcyBhbHNvIGdvaW5n
DQo+IHRvIGJlIHNldCBmb3IgUk1XIG9wZXJhdGlvbnMuDQo+IA0KPj4+PiBodm1fZW11bGF0ZV9z
ZW5kX3ZtX2V2ZW50KCkgY2FuIHJldHVybiBmYWxzZSBpZiB0aGVyZSB3YXMgbm8gdmlvbGF0aW9u
LA0KPj4+PiBpZiB0aGVyZSB3YXMgYW4gZXJyb3IgZnJvbSBtb25pdG9yX3RyYXBzKCkgb3IgcDJt
X2dldF9tZW1fYWNjZXNzKCkuDQo+Pj4NCj4+PiBBcyBzYWlkIGJlZm9yZSAtIEkgZG9uJ3QgdGhp
bmsgZXJyb3JzIGFuZCBsYWNrIG9mIGEgdmlvbGF0aW9uIGNhbg0KPj4+IHNlbnNpYmx5IGJlIHRy
ZWF0ZWQgdGhlIHNhbWUgd2F5LiBJcyB0aGUgaW1wbGljYXRpb24gcGVyaGFwcyB0aGF0DQo+Pj4g
ZW11bGF0aW9uIHRoZW4gd2lsbCBmYWlsIGxhdGVyIGFueXdheT8gSWYgc28sIGlzIHN1Y2ggYW4N
Cj4+PiBhc3N1bXB0aW9uIHRha2luZyBpbnRvIGNvbnNpZGVyYXRpb24gcG9zc2libGUgcmFjZXM/
DQo+Pg0KPj4gVGhlIG9ubHkgcGxhY2UgdGhhdCBJIGNhbiBzZWUgYSBwcm9ibGVtIGlzIHRoZSBl
cnJvciBmcm9tDQo+PiBtb25pdG9yX3RyYXBzKCkuIFRoYXQgY2FuIGJlIGNoZWNrZWQgYW5kIGFj
Y29tcGFuaWVkIGJ5IGEgd2FybmluZyBtc2cuDQo+IA0KPiBIb3cgd291bGQgYSB3YXJuaW5nIG1l
c3NhZ2UgaGVscD8NCj4gDQo+PiBPciBpZiB5b3UgY2FuIGdpdmUgbWUgYSBkaWZmZXJlbnQgaWRl
YSB0byBnbyBmb3J3YXJkIHdpdGggdGhpcyBpc3N1ZSBJDQo+PiB3aWxsIGJlIGdsYWQgdG8gcmV2
aWV3IGl0Lg0KPiANCj4gSSdtIGFmcmFpZCB5b3UnbGwgaGF2ZSB0byBmaXJzdCBvZiBhbGwgZ2l2
ZSBtZSBhbiBpZGVhIHdoYXQgdGhlDQo+IGNvcnJlY3QgYWN0aW9uIGlzIGluIGNhc2Ugb2Ygc3Vj
aCBhbiBlcnJvci4gQW5kIG9uY2UgeW91J3ZlIGRvbmUNCj4gc28sIEknbSBwcmV0dHkgc3VyZSB5
b3UnbGwgcmVjb2duaXplIHlvdXJzZWxmIHdoZXRoZXIgdGhlIGN1cnJlbnQNCj4gY29kZSB5b3Ug
aGF2ZSBpcyBhcHByb3ByaWF0ZSAoYW5kIEknbGwgdGhlbiBrbm93IHdoZXRoZXIgSSB3YW50DQo+
IHRvIGluc2lzdCBvbiB5b3UgY2hhbmdpbmcgdGhlIGNvZGUpLg0KPiANCg0KU28gSSB0aGluayB0
aGF0IHRoZSByZXR1cm4gb2YgaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudCgpIHNob3VsZCBub3Qg
dXNlIA0KdGhlIHJldHVybiBvZiBtb25pdG9yX3RyYXBzKCkuIEJ5IHRoZSB0aW1lIG1vbml0b3Jf
dHJhcHMoKSBpcyBjYWxsZWQgd2UgDQphcmUgc3VyZSB0aGF0IHRoZXJlIGlzIGEgdmlvbGF0aW9u
IGFuZCBlbXVsYXRpb24gc2hvdWxkIHN0b3AgcmVnYXJkbGVzcyANCmlmIHRoZSBldmVudCB3YXMg
c2VudCBvciBub3QuIEluIHRoaXMgaWRlYSB0aGUgbGFzdCByZXR1cm4gc2hvdWxkIGJlIHRydWUu
DQoNCj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYw0KPj4+PiArKysgYi94ZW4vYXJj
aC94ODYvaHZtL2h2bS5jDQo+Pj4+IEBAIC0zMjI0LDYgKzMyMjQsMTQgQEAgc3RhdGljIGVudW0g
aHZtX3RyYW5zbGF0aW9uX3Jlc3VsdCBfX2h2bV9jb3B5KA0KPj4+PiAgICAgICAgICAgICAgICAg
IHJldHVybiBIVk1UUkFOU19iYWRfZ2ZuX3RvX21mbjsNCj4+Pj4gICAgICAgICAgICAgIH0NCj4+
Pj4gICAgICANCj4+Pj4gKyAgICAgICAgaWYgKCB1bmxpa2VseSh2LT5hcmNoLnZtX2V2ZW50KSAm
Jg0KPj4+PiArICAgICAgICAgICAgdi0+YXJjaC52bV9ldmVudC0+c2VuZF9ldmVudCAmJg0KPj4+
PiArICAgICAgICAgICAgaHZtX2VtdWxhdGVfc2VuZF92bV9ldmVudChhZGRyLCBnZm4sIHBmZWMp
ICkNCj4+Pg0KPj4+IEluZGVudGF0aW9uIGxvb2tzIHdyb25nIGFnYWluLg0KPj4+DQo+Pj4+ICsg
ICAgICAgIHsNCj4+Pj4gKyAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOw0KPj4+PiArICAgICAg
ICAgICAgcmV0dXJuIEhWTVRSQU5TX2dmbl9wYWdlZF9vdXQ7DQo+Pj4NCj4+PiBXaHkgInBhZ2Vk
IG91dCI/IElmIHRoaXMgaXMgYW4gaW50ZW50aW9uYWwgYWJ1c2UsIHRoZW4geW91IHdhbnQNCj4+
PiB0byBzYXkgc28gaW4gYSBjb21tZW50IGFuZCBqdXN0aWZ5IHRoZSBhYnVzZSBoZXJlIG9yIGlu
IHRoZQ0KPj4+IGRlc2NyaXB0aW9uLg0KDQpZZXMgdGhpcyBpcyBpbnRlbnRpb25hbCBzbyBsaW5l
YXJfcmVhZCgpIHdpbGwgcmV0dXJuIFg4NkVNVUxfUkVUUlkuDQoNClRoYW5rcyBmb3IgdGhlIHJl
dmlldywNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
