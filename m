Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B98226B909
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 11:16:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hng0p-00026O-MS; Wed, 17 Jul 2019 09:14:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N/EB=VO=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hng0o-00025n-4P
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 09:14:10 +0000
X-Inumbo-ID: 3b2a28bc-a873-11e9-8980-bc764e045a96
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::70f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3b2a28bc-a873-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 09:14:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOdB3lo7T33amh95uH6luXOxKfFrW3dSPVqFHtqIJzSKfSWsBf/LCBqZ4TON9/A4aZjkWA+zkJvmScd9lRUiwQev69rQIewnqAbZcn01CrNORPeStn9x7UazCD3wmVZVVN3AvNuJjm4siS62o7ltjqyHNYIJO/VJ0zdOIbvBNedJY7h/edaC09pTYAyNdrjYMO4jMpGbC+kOPMCJLBrHRg23lyiaMO0mlRGvvuopdzfwE2Dawq+1kNsiUjA6efGOzfreKabINu+Dk4iEgGlq6NtqoEAr+M/ca7hZcm4LImLJm6pNph54Cc1Lx3nEoQQEdqCiTiJ6k7U1yI1nkOY+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TAi+7cquAhbafVpKx+OcBkPz36P5rppzK83qs++8fs=;
 b=GzUJt1/2V6st+KPRGFIdkAzc17aDlHATwR+0UngEjUYU2LwqKwwzKBPfJjNAxWVImVOrnC4ZPxscCsGIawR3jP9U6ciRAJ/AZOSobAc22H80cacxt1k4fDidEBisPIDQDwOGaNUoT0ldaiEi/icgoZXv+MSx/sXEdF8D2kItL1CpAbqiYcLUYqd5K8GrqfHhRkaOTsY8EyQ68UwLUnwnqiABoIBIk5ZRkMccx2bM6KAMh+4AX+fJdA8vxFGsnFJ3pW7UWVwbGzwMZTLXclpGVuSChE2XjNUGi1wO1ZbZ3scsBl1C7WvKHUuFGPgIy3N8AKaiMKS/QAB68RDPR7E70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TAi+7cquAhbafVpKx+OcBkPz36P5rppzK83qs++8fs=;
 b=xVyt4OzYMwRFsNL5K6FVijeR9N8e5pyzNnE2zF9GMQ7PwLAyCExDYz6XPleGBdAX7g9X4MqRJXP4ftjwrlDJtSnWX39gjWa14ynl8v4aUyAJjelT5MduSNY3Cgv0NkiCz91xBVyJYBB7VLxircBmdcAsQKAObMEXl1ruzm+R1kM=
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com (20.177.198.89) by
 AM6PR02MB4405.eurprd02.prod.outlook.com (20.177.196.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 09:14:06 +0000
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00]) by AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00%2]) with mapi id 15.20.2094.011; Wed, 17 Jul 2019
 09:14:06 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH v2 00/10] Per vcpu vm_event channels
Thread-Index: AQHVO/jemBHelXeH3k6+zod9k0UcZ6bNtvaAgADRDQA=
Date: Wed, 17 Jul 2019 09:14:06 +0000
Message-ID: <d7868b396957fd0455f14e79c1e0f28985361809.camel@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <CABfawhmXfCRfM_YpDVRJLVpNDKLct+NJvraeHS2V_298SqSusw@mail.gmail.com>
In-Reply-To: <CABfawhmXfCRfM_YpDVRJLVpNDKLct+NJvraeHS2V_298SqSusw@mail.gmail.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0093.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::33) To AM6PR02MB4615.eurprd02.prod.outlook.com
 (2603:10a6:20b:6a::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15987331-166c-4053-cd77-08d70a971ea3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR02MB4405; 
x-ms-traffictypediagnostic: AM6PR02MB4405:|AM6PR02MB4405:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR02MB4405AC6D3A24AD31D128CD1FD6C90@AM6PR02MB4405.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(136003)(346002)(39860400002)(376002)(199004)(189003)(8676002)(52116002)(4326008)(6246003)(6486002)(6436002)(446003)(66946007)(11346002)(2906002)(5660300002)(53936002)(81166006)(81156014)(316002)(7736002)(86362001)(66476007)(305945005)(6512007)(6116002)(6306002)(2616005)(3846002)(25786009)(8936002)(76176011)(64756008)(66556008)(118296001)(66446008)(476003)(486006)(966005)(186003)(71200400001)(229853002)(256004)(7416002)(386003)(53546011)(14454004)(6506007)(14444005)(26005)(50226002)(36756003)(99286004)(54906003)(68736007)(102836004)(66066001)(478600001)(71190400001)(6916009)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB4405;
 H:AM6PR02MB4615.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: q0Ev0s3ivy5+0xoOmYeFEP20nlSzVMuz3oVWtBwaz3xbZLWygZXDfaHL83/HWP4ArhOjsi6NgIpwOXO0FDH9RbAeOUpas8Q6e9YvyKNotfQQv1sfv8GHt0A+bkkASAFnWyjYIMx6WhoedaE99gF5vAWTJLKrGVSiAjDRdbjCQ84kPxbq3PpCjDdoOtYhuML+E7r6Un2LX+VRwCM8GSNBO9tIC29TlcrES1Lx2WsFgtXOMFIfU2paeFfJnL2L7jN3Gnk6UI2C5RzR0mkgoSOdrAsWsSji8BQL+HBxsLYjcK3D91m7Qp21YZDcklOOs0odC2z5aZpf5nyX1aJ8aNMrXvq2nFJK+gdvTKWSTIYQMYUxUeHAaddfxdOdlnc5Gn12t4m4NfieoNoUtxrh6IZrYDZlWMvoDKOA+D2sWxVOFRA=
Content-ID: <378FE22232DEC6418874C3750D7D2A07@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15987331-166c-4053-cd77-08d70a971ea3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 09:14:06.8244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4405
Subject: Re: [Xen-devel] [PATCH v2 00/10] Per vcpu vm_event channels
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDE5LTA3LTE2IGF0IDE0OjQ1IC0wNjAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6
DQo+IE9uIFR1ZSwgSnVsIDE2LCAyMDE5IGF0IDExOjA2IEFNIFBldHJlIFBpcmNhbGFidQ0KPiA8
cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IFRoaXMgcGF0Y2hz
ZXQgYWRkcyBhIG5ldyBtZWNoYW5pc20gb2Ygc2VuZGluZyBzeW5jaHJvbm91cyB2bV9ldmVudA0K
PiA+IHJlcXVlc3RzIGFuZCBoYW5kbGluZyB2bV9ldmVudCByZXNwb25zZXMgd2l0aG91dCB1c2lu
ZyBhIHJpbmcuDQo+ID4gQXMgZWFjaCBzeW5jaHJvbm91cyByZXF1ZXN0IHBhdXNlcyB0aGUgdmNw
dSB1bnRpbCB0aGUgY29ycmVzcG9uZGluZw0KPiA+IHJlc3BvbnNlIGlzIGhhbmRsZWQsIGl0IGNh
biBiZSBzdG9yZWQgaW4gYSBzbG90dGVkIG1lbW9yeSBidWZmZXINCj4gPiAob25lIHBlciB2Y3B1
KSBzaGFyZWQgYmV0d2VlbiB0aGUgaHlwZXJ2aXNvciBhbmQgdGhlIGNvbnRyb2xsaW5nDQo+ID4g
ZG9tYWluLg0KPiA+IA0KPiA+IFRoZSBtYWluIGFkdmFudGFnZXMgb2YgdGhpcyBhcHByb2FjaCBh
cmU6DQo+ID4gKiB0aGUgYWJpbGl0eSB0byBkeW5hbWljYWx5IGFsbG9jYXRlIHRoZSBuZWNlc3Nh
cnkgbWVtb3J5IHVzZWQgdG8NCj4gPiBob2xkDQo+ID4gdGhlIHJlcXVlc3RzL3Jlc3BvbnNlcyAo
dGhlIHNpemUgb2YNCj4gPiB2bV9ldmVudF9yZXF1ZXN0X3Qvdm1fZXZlbnRfcmVzcG9uc2VfdA0K
PiA+IGNhbiBncm93IHVucmVzdHJpY3RlZCBieSB0aGUgcmluZydzIG9uZSBwYWdlIGxpbWl0YXRp
b24pDQo+ID4gKiB0aGUgcmluZydzIHdhaXRxdWV1ZSBsb2dpYyBpcyB1bm5lY2Vzc2FyeSBpbiB0
aGlzIGNhc2UgYmVjYXVzZQ0KPiA+IHRoZQ0KPiA+IHZjcHUgc2VuZGluZyB0aGUgcmVxdWVzdCBp
cyBibG9ja2VkIHVudGlsIGEgcmVzcG9uc2UgaXMgcmVjZWl2ZWQuDQo+IA0KPiBDb3VsZCB5b3Ug
cGxlYXNlIHB1c2ggYSBnaXQgYnJhbmNoIGZvciB0aGlzIHNvbWV3aGVyZT8NCj4gDQo+IFRoYW5r
cywNCj4gVGFtYXMNCg0KSSd2ZSBwdXNoZWQgdGhpcyBjaGFuZ2VzIHRvIG15IGdpdGh1YiB4ZW4g
Zm9yazoNCmh0dHBzOi8vZ2l0aHViLmNvbS9wZXRyZXBpcmNhbGFidS94ZW4vdHJlZS92bV9ldmVu
dF9uZy9kZXZlbA0KVGhlIHRhZyBmb3IgcGF0Y2hzZXQgaXMgcGVyX2NwdV92bV9ldmVudF9jaGFu
bmVsc192Mi4NCg0KTWFueSB0aGFua3MgZm9yIHlvdXIgc3VwcG9ydCwNClBldHJlDQoNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
