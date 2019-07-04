Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950965F940
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 15:40:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj1w1-0004sf-Kn; Thu, 04 Jul 2019 13:38:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hj1vz-0004s7-Hu
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 13:37:59 +0000
X-Inumbo-ID: ee0ab493-9e60-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ee0ab493-9e60-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 13:37:58 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 13:37:35 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 13:34:49 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 13:34:49 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3233.namprd18.prod.outlook.com (10.255.137.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.15; Thu, 4 Jul 2019 13:34:47 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 13:34:47 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3] IOMMU/x86: make page type checks consistent when
 mapping pages
Thread-Index: AQHVMZl1oVr/rIHCQkayQ81xVALqHaa6cKqHgAAGnIA=
Date: Thu, 4 Jul 2019 13:34:47 +0000
Message-ID: <f2aa5d6b-b137-bee5-d482-7e8d0eea5d66@suse.com>
References: <ac7a20e8-9e5e-f664-1d7f-d59105f90223@suse.com>
 <c083eb95-7751-50d7-c33b-8de63f22dc39@citrix.com>
In-Reply-To: <c083eb95-7751-50d7-c33b-8de63f22dc39@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0197.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::17) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f560ea8-5b22-4835-f57b-08d7008461c0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3233; 
x-ms-traffictypediagnostic: BY5PR18MB3233:
x-microsoft-antispam-prvs: <BY5PR18MB3233F96A939DFE764F3B20F8B3FA0@BY5PR18MB3233.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(189003)(199004)(31686004)(6486002)(80792005)(6436002)(72206003)(229853002)(256004)(2616005)(2501003)(2906002)(14444005)(478600001)(6246003)(53936002)(11346002)(6512007)(68736007)(66066001)(14454004)(25786009)(476003)(76176011)(446003)(102836004)(7736002)(4326008)(386003)(6506007)(71190400001)(5660300002)(66476007)(73956011)(64756008)(486006)(66946007)(66446008)(66556008)(52116002)(81166006)(81156014)(8676002)(71200400001)(8936002)(53546011)(305945005)(99286004)(110136005)(86362001)(316002)(31696002)(3846002)(26005)(36756003)(6116002)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3233;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u1tnHF9y+s9KoaB32XZ3RcfiUWt4m0yo/adqg7O51d9v4mnXfT6BGSLRf5ADCih9P59CNJnlnI1+m/SwGrRVq9e06PAq/Ll+8Trs7VvbPWcbjXtZZosuHODeQm4S2baYf45ZUUV3HVvpF1ZfqpQkzQigm4BGCl1P18bWvqDi4FMCxYQPmRbpwHn/QdGDmkh5nItYb9Jxq4hhfCder2+NI3f1UDAmsvrzn0SZ+upnAkl70A/FlJG95dQukZV1PBKwl9QCY49TPFpqycqhrY6rxG+PJhxKKnlJWCnJ6isq/xmtfAh5ClPWFBSUj78KCpLvST6Xz0a7QDZsIimHirXYUMwFfWJ4vrbIrqSZswc8aKq5Y4px30ewOuxXcGkSJo+78NM5GtfCjToM9mIHrzCSxk3Oc+hL5IED+ZalGvSZ17k=
Content-ID: <0077F442D8A4B94DA40F92AF20930161@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f560ea8-5b22-4835-f57b-08d7008461c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 13:34:47.5481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3233
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3] IOMMU/x86: make page type checks
 consistent when mapping pages
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDcuMjAxOSAxNToxMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDMvMDcvMjAx
OSAxMzoxOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBUaGVyZSBhcmUgY3VycmVudGx5IHRocmVl
IG1vcmUgb3IgbGVzcyBkaWZmZXJlbnQgY2hlY2tzOg0KPj4gLSBfZ2V0X3BhZ2VfdHlwZSgpIGFk
anVzdHMgdGhlIElPTU1VIG1hcHBpbmdzIGFjY29yZGluZyB0byB0aGUgbmV3IHR5cGUNCj4+ICAg
ICBhbG9uZSwNCj4+IC0gYXJjaF9pb21tdV9wb3B1bGF0ZV9wYWdlX3RhYmxlKCkgd2FudHMganVz
dCB0aGUgdHlwZSB0byBiZQ0KPj4gICAgIFBHVF93cml0YWJsZV9wYWdlLA0KPj4gLSBpb21tdV9o
d2RvbV9pbml0KCkgYWRkaXRpb25hbGx5IHBlcm1pdHMgYWxsIG90aGVyIHR5cGVzIHdpdGggYSB0
eXBlDQo+PiAgICAgcmVmY291bnQgb2YgemVyby4NCj4+IFRoZSBjYW5vbmljYWwgb25lIGlzIGlu
IF9nZXRfcGFnZV90eXBlKCksIGFuZCBhcyBvZiBYU0EtMjg4DQo+PiBhcmNoX2lvbW11X3BvcHVs
YXRlX3BhZ2VfdGFibGUoKSBhbHNvIGhhcyBubyBuZWVkIGFueW1vcmUgdG8gZGVhbCB3aXRoDQo+
PiBQR1Rfbm9uZSBwYWdlcy4gSW4gdGhlIFBWIERvbTAgY2FzZSwgaG93ZXZlciwgUEdUX25vbmUg
cGFnZXMgYXJlIHN0aWxsDQo+PiBuZWNlc3NhcnkgdG8gY29uc2lkZXIsIHNpbmNlIGluIHRoYXQg
Y2FzZSBwYWdlcyBkb24ndCBnZXQgaGFuZGVkIHRvDQo+PiBndWVzdF9waHlzbWFwX2FkZF9lbnRy
eSgpLiBGdXJ0aGVybW9yZSwgdGhlIGZ1bmN0aW9uIHNvIGZhciBhbHNvDQo+PiBlc3RhYmxpc2hl
ZCByL28gbWFwcGluZ3MsIHdoaWNoIGlzIG5vdCBpbiBsaW5lIHdpdGggdGhlIHJ1bGVzIHNldCBm
b3J0aA0KPj4gYnkgdGhlIFhTQS0yODggY2hhbmdlLg0KPj4NCj4+IEZvciBhcmNoX2lvbW11X3Bv
cHVsYXRlX3BhZ2VfdGFibGUoKSB0byBub3QgZW5jb3VudGVyIFBHVF9ub25lIHBhZ2VzDQo+PiBh
bnltb3JlIGV2ZW4gaW4gY2FzZXMgd2hlcmUgdGhlIElPTU1VIGdldHMgZW5hYmxlZCBmb3IgYSBk
b21haW4gb25seQ0KPj4gd2hlbiBpdCBpcyBhbHJlYWR5IHJ1bm5pbmcsIHJlcGxhY2UgdGhlIElP
TU1VIGRlcGVuZGVuY3kgaW4NCj4+IGd1ZXN0X3BoeXNtYXBfYWRkX2VudHJ5KCkncyBoYW5kbGlu
ZyBvZiBQViBndWVzdHMgdG8gY2hlY2sganVzdCB0aGUNCj4+IHN5c3RlbSB3aWRlIHN0YXRlIGlu
c3RlYWQgb2YgdGhlIGRvbWFpbiBwcm9wZXJ0eS4NCj4gDQo+IEFuZCB0aGlzIGlzIHRoZSBwcm9i
bGVtLsKgIFdlIGhhdmUgYW4gZW5vcm1vdXMgYW1vdW50IG9mIGNvbXBsZXhpdHksIGFuZA0KPiBh
IGh5cGVyY2FsbCB3aGljaCBldmVuIGFmdGVyIGFuIFhTQSwgd2UgY291bGQgb25seSByZWR1Y2Ug
dG8gIndpbGwNCj4gbGl2ZWxvY2sgdW5kZXIgYWR2ZXJzYXJpYWwgY29uZGl0aW9ucyAoaW5jLiB0
aGUgdG9vbHN0YWNrIHRocmVhZCB3aGljaA0KPiBzdGFydGVkIGl0KSIsIHNvIHN1cHBvcnQgYSBj
b3JuZXIgY2FzZSB3aGljaCBkb2Vzbid0IChBRkFDSVQpIGxvb2sgbGlrZQ0KPiBpdCBjYW4gd29y
ayBjb3JyZWN0bHksIGFuZCBzdXJlbHkgaXNuJ3QgdXNlZCBpbiBwcmFjdGljZS4NCj4gDQo+IElN
TywgdGhlIG9ubHkgc2FuZSB0aGluZyB0byBkbyBpcyB0byBoYXZlIGEgImNyZWF0ZSBhbiBJT01N
VSBjb250ZXh0Ig0KPiBmbGFnIGluIGRvbWFpbmNyZWF0ZSAoYW5kIGEgc2hhcmVkIHZzIHNwbGl0
IHdoaWxlIHdlJ3JlIGF0IGl0LCBmb3IgdGhlDQo+IEVQVCBjYXNlKSwgYW5kIGhhdmUgdGhlIElP
TU1VIGNvbnRleHQgcHJvcGVybHkga25vd24gZnJvbSB0aGUgdmVyeSBzdGFydA0KPiBvZiB0aGUg
ZG9tYWluLg0KDQpJcnJlc3BlY3RpdmUgb2YgbWUgZGlzYWdyZWVpbmcgaGVyZSAod2hpY2ggYnkg
bm8gbWVhbnMgc3VnZ2VzdHMgdGhhdA0Kd2hhdCB5b3UgZGVzY3JpYmUgbWF5IG5vdCBnZXQgZG9u
ZSBhbnl3YXkpLCAuLi4NCg0KPiBFdmVuIGlmIHRoaXMgZG9lcyBlbmQgdXAgcmVzdHJpY3Rpbmcg
YSBjb3JuZXIgY2FzZSB3aGljaCBpcyBiZWxpZXZlZCB0bw0KPiB3b3JrLCBJIGRvIG5vdCBzZWUg
aXQgYXMgYW4gaW5jb252ZW5pZW5jZSBvciBwcm9ibGVtIHRvIHJlcXVpcmUgYSBkb21haW4NCj4g
Y29uZmlnIGZpbGUgdG8gc3BlY2lmeSB3aGV0aGVyIGl0IHdhbnRzIGFuIElPTU1VIGNvbnRleHQg
KGRpcmVjdGx5LCBvcg0KPiBpbmRpcmVjdGx5IHZpYSB0aGluZ3MgbGlrZSBQQ0k9KSwgYW5kIHRo
ZSByZWR1Y3Rpb24gaW4gY29tcGxleGl0eSBpbiBYZW4NCj4gd291bGQgYmUgbWFzc2l2ZS4NCj4g
DQo+IEhvdyBtYW55IHNlY3VyaXR5IGJ1Z3MgaGF2ZSB3ZSBhbHJlYWR5IGZvdW5kIGhlcmU/wqAg
SG93IG1heSBhcmUgc3RpbGwNCj4gbHVya2luZywgb3IgbGlhYmxlIHRvIGJlIHJlLWludHJvZHVj
ZWQgYmVjYXVzZSB0aGlzIGNvZGUgaXMganVzdCB0b28NCj4gZGFtbiBjb21wbGljYXRlZCBmb3Ig
eW91LCBtZSBhbmQgR2VvcmdlIHRvIHJldmlldyBzZW5zaWJseT/CoCBSZWR1Y2luZw0KPiB0aGUg
Y29tcGxleGl0eSBpcyB0aGUgcmVzcG9uc2libGUgdGhpbmcgdG8gZG8uDQo+IA0KPiBJJ20gYWZy
YWlkIHRoYXQgSSBkb24ndCB2aWV3IGFueXRoaW5nIG90aGVyIHRoYW4gbW92aW5nIHRvd2FyZHMg
YW4NCj4gdXAtZnJvbnQgZGVjbGFyYXRpb24gYXMgbWFraW5nIHRoZSBzaXR1YXRpb24gYmV0dGVy
Lg0KDQouLi4gSSdtIHByZXR0eSBwdXp6bGVkIGJ5IHRoaXMsIGluIHBhcnRpY3VsYXIgc2VlaW5n
IHRoYXQgdGhlIGJ1bGsgb2YNCnRoZSBjaGFuZ2UgaW4gdGhpcyBwYXRjaCBpcyBhZmZlY3Rpbmcg
RG9tMCBvbmx5LCBpLmUuIGlzIGluIG5vIHdheQ0KcmVsYXRlZCB0byB0aGUgcG9pbnQgaW4gdGlt
ZSBhdCB3aGljaCB3ZSBkZWNsYXJlIGEgRG9tVSB0byBuZWVkIElPTU1VDQpwYWdlIHRhYmxlcy4g
VGhlIGNoYW5nZSBhZmZlY3RpbmcgRG9tVS1zIGhlcmUgaXMgYSBzaW5nbGUgbGluZSwgcGx1cw0K
c29tZSBjb21tZW50IGFkanVzdG1lbnQuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
