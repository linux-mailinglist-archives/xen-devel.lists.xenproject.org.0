Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26F36083A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 16:46:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjPRo-0003wl-4N; Fri, 05 Jul 2019 14:44:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hjPRl-0003wb-Vt
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 14:44:22 +0000
X-Inumbo-ID: 5bee761d-9f33-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5bee761d-9f33-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 14:44:20 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  5 Jul 2019 14:40:38 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 5 Jul 2019 14:42:02 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 5 Jul 2019 14:42:02 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3426.namprd18.prod.outlook.com (10.255.136.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 14:42:00 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 14:42:00 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH v2] x86/mm: Clean IOMMU flags from p2m-pt code
Thread-Index: AQHVMZ3eVPiN3NnZMUe+cwMyPT0RlKa8HFuA
Date: Fri, 5 Jul 2019 14:42:00 +0000
Message-ID: <0b68a345-9eeb-1f21-bd0e-8a12a3f0e126@suse.com>
References: <20190703125004.25451-1-aisaila@bitdefender.com>
In-Reply-To: <20190703125004.25451-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P189CA0010.EURP189.PROD.OUTLOOK.COM (2603:10a6:6:2e::23)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 638e54cd-028a-44f6-1918-08d70156f026
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3426; 
x-ms-traffictypediagnostic: BY5PR18MB3426:
x-microsoft-antispam-prvs: <BY5PR18MB3426AFEA77F4DE449F4669D0B3F50@BY5PR18MB3426.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(189003)(199004)(53546011)(31696002)(386003)(6506007)(76176011)(102836004)(316002)(54906003)(99286004)(53936002)(52116002)(6246003)(31686004)(71190400001)(71200400001)(4744005)(66066001)(5660300002)(36756003)(2906002)(26005)(64756008)(66476007)(66946007)(66556008)(66446008)(73956011)(14444005)(256004)(14454004)(186003)(3846002)(6116002)(229853002)(6512007)(72206003)(4326008)(81156014)(6486002)(446003)(8936002)(81166006)(305945005)(11346002)(6916009)(80792005)(2616005)(476003)(7736002)(86362001)(6436002)(486006)(478600001)(68736007)(8676002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3426;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vBY1U8XihS7fdjwjFpu5LgNJaQEhehpe6unnpJewTcGNTk+4PsuUDOkfESDMMRKzxp+o+VZgZot7UDYMqYbXnh/6AtL/Vxg91p0ivFWMpfmSoyXDejRo3VmAt9GtJzkCBqg5Q1VAfx/UIN5SRQIqAGwtNjB4M9enlvW38fKxYOqcBk+E8Oru1Pzm+f3WJlL82jZbyGS4+d/uK229Yfv6GCYeq+doEf1qpJvn5YDYizs0IDgaoA78T/kw/R2lRiMq3cTiJfC74tNDCTAXDBSzGZHMSldFDKaLjbkJNTIDodyv3+jX5zf3y1vZ/7un14YGEwSpsFXespMoub3VFtCPXGFtdQ04lehl0Xcv+pqualXc5Xl3aw8rkSN8Q08hfvuQ913IokwBeKxlGdC97hGFrBawxYIsRTLopzWu532sP8w=
Content-ID: <C62116B86ABB9842A3B1E7673FADBF1B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 638e54cd-028a-44f6-1918-08d70156f026
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 14:42:00.6217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3426
X-OriginatorOrg: suse.com
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

T24gMDMuMDcuMjAxOSAxNDo1MCwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+IEF0
IHRoaXMgbW9tZW50IElPTU1VIHB0IHNoYXJpbmcgaXMgZGlzYWJsZWQgYnkgY29tbWl0IFsxXS4N
Cj4gDQo+IFRoaXMgcGF0Y2ggYWltcyB0byBjbGVhciB0aGUgSU9NTVUgaGFwIHNoYXJlIHN1cHBv
cnQgYXMgaXQgd2lsbCBub3QgYmUNCj4gdXNlZCBpbiB0aGUgZnV0dXJlLiBCeSBkb2luZyB0aGlz
IHRoZSBJT01NVSBiaXRzIHVzZWQgaW4gcHRlWzUyOjU4XSBjYW4NCj4gYmUgdXNlZCBpbiBvdGhl
ciB3YXlzLg0KPiANCj4gWzFdIGMyYmEzZGIzMWVmMmQ5ZjFlNDBlN2I2YzE2Y2YzYmUzZDY3MWQ1
NTUNCg0KVGhpcyBhbGwgbWFrZXMgaXQgc291bmQgYXMgaWYgdGhpcyB3YXMgZ2VuZXJhbGx5IHRo
ZSBjYXNlLCBidXQgaXQncw0Kc28gb25seSBvbiB0aGUgQU1EIHNpZGUuIE9uIFZULWQgLyBWVC14
IHBhZ2UgdGFibGUgc2hhcmluZyBjb250aW51ZXMNCnRvIHdvcmsuIEJ1dCBpdCBtYXkgYmUganVz
dCBtZSB0aGF0IEknZCBwcmVmZXIgdGhpcyB0byBub3QgYmUgaW1wbGllZA0KZnJvbSB0aGUgbWVu
dGlvbiBvZiBwMm0tcHQgaW4gdGhlIHRpdGxlLCBzbyBJJ2xsIGxlYXZlIGl0IHRvIEdlb3JnZQ0K
YXMgdGhlIG1haW50YWluZXIgdG8gZGVjaWRlIHdoZXRoZXIgYSBmdXJ0aGVyIGNoYW5nZSB0byB0
aGUNCmRlc2NyaXB0aW9uIGlzIG5lZWRlZC4NCg0KQW5kIHRoZW4gSSB3b3VsZCBvZiBjb3Vyc2Ug
aGF2ZSB3aXNoZWQgdGhhdCBhIGNsZWFudXAgcGF0Y2ggbGlrZSB0aGlzDQpvbmUgZGVhbHQgd2l0
aCBib3RoIHNpZGVzLCBpLmUuIHJlbW92ZWQgcHQgc2hhcmluZyByZW1haW5zIGZyb20NCnhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC8gYXQgdGhlIHNhbWUgdGltZSAoaS5lLiBpZiBub3QgaW4g
b25lDQpwYXRjaCwgdGhlbiBhdCBsZWFzdCBpbiB0aGUgc2FtZSBzZXJpZXMpLiBCdXQgdGhpcyBt
YXkgYWdhaW4gYmUganVzdA0KbWUgLi4uDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
