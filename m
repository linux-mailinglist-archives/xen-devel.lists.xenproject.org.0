Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7535F5DF
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 11:43:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiyEY-0001Ya-8B; Thu, 04 Jul 2019 09:40:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiyEV-0001Xq-Um
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 09:40:51 +0000
X-Inumbo-ID: c8616e26-9e3f-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c8616e26-9e3f-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 09:40:50 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 09:40:32 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 09:37:46 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 09:37:46 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3396.namprd18.prod.outlook.com (10.255.139.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.16; Thu, 4 Jul 2019 09:37:45 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 09:37:45 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v3 04/15] x86/IRQ: desc->affinity should
 strictly represent the requested value
Thread-Index: AQHVMck9/v+GBcj3s0qM+FFS6GMbzKa6NKsA
Date: Thu, 4 Jul 2019 09:37:44 +0000
Message-ID: <0929d3f2-14d1-8929-39c7-7b5888a17ce8@suse.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE910E0200007800230072@prv1-mh.provo.novell.com>
 <100bb162-6a69-f911-57bb-c709d3e0f98f@citrix.com>
In-Reply-To: <100bb162-6a69-f911-57bb-c709d3e0f98f@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::15)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47e64a48-0db8-49b7-26e4-08d70063447f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3396; 
x-ms-traffictypediagnostic: BY5PR18MB3396:
x-microsoft-antispam-prvs: <BY5PR18MB3396CD0E475BC626F7F157FBB3FA0@BY5PR18MB3396.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(199004)(189003)(71200400001)(81156014)(14454004)(73956011)(11346002)(66946007)(66556008)(64756008)(66446008)(66476007)(25786009)(4326008)(446003)(53546011)(99286004)(8676002)(5660300002)(14444005)(68736007)(386003)(8936002)(52116002)(102836004)(478600001)(80792005)(6506007)(186003)(6436002)(71190400001)(6486002)(54906003)(76176011)(256004)(110136005)(66066001)(31686004)(81166006)(72206003)(316002)(2616005)(26005)(229853002)(6246003)(31696002)(7736002)(2906002)(486006)(53936002)(86362001)(36756003)(6512007)(476003)(6116002)(3846002)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3396;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ebXg62piaJlptwO7uHMm3rppjLIjXG9+4xb6XD4mV5OaqXRtXA1hL9IGmLiaPEttmSr9bpLT53ru2i5AUna9Jfbdbs9NYveH2u3m1lhFp2bKh2KCm0K/q7Cv+MsVgksTZef1iDMfMj/aTIQW5wv3HeREPtCTcRkNv6ic1Zxl794/kgFaE9VtJ5OYcabjj0NximL36wy7HUypbulWG/z5ibw79tfHuZfz1xlj/HyJyHnIyEiAT/QHWCJxlAqYL0EiYpJjUVnGNfTZOSNGLsFyUNgdY5Rg/w/8T2Zn126JYesPHsznAZdUw3S+dEH4EIw+aDSsLVYvxiS5FIV7ht34YESzCZTf0/YbzccX82lk+ZRLjZ/aMIEF+qphBIP+uBh95DwwXHA+CUlaOsguo6/MdH81uQTdBgw9S0zcWKKqQsM=
Content-ID: <750050DBD5FA45448E8D068551153F16@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e64a48-0db8-49b7-26e4-08d70063447f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 09:37:44.9039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3396
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 04/15] x86/IRQ: desc->affinity should
 strictly represent the requested value
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
Cc: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxOTo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTcvMDUvMjAx
OSAxMTo0NiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBAQCAtMjMzNCw5ICsyMzM5LDEwIEBAIHN0
YXRpYyB2b2lkIGR1bXBfaXJxcyh1bnNpZ25lZCBjaGFyIGtleSkNCj4+ICAgDQo+PiAgICAgICAg
ICAgc3Bpbl9sb2NrX2lycXNhdmUoJmRlc2MtPmxvY2ssIGZsYWdzKTsNCj4+ICAgDQo+PiAtICAg
ICAgICBwcmludGsoIiAgIElSUTolNGQgYWZmOiUqcGIgdmVjOiUwMnggJS0xNXMgc3RhdHVzPSUw
M3ggIiwNCj4+IC0gICAgICAgICAgICAgICBpcnEsIG5yX2NwdV9pZHMsIGNwdW1hc2tfYml0cyhk
ZXNjLT5hZmZpbml0eSksIGRlc2MtPmFyY2gudmVjdG9yLA0KPj4gLSAgICAgICAgICAgICAgIGRl
c2MtPmhhbmRsZXItPnR5cGVuYW1lLCBkZXNjLT5zdGF0dXMpOw0KPj4gKyAgICAgICAgcHJpbnRr
KCIgICBJUlE6JTRkIGFmZjolKnBiLyUqcGIgdmVjOiUwMnggJS0xNXMgc3RhdHVzPSUwM3ggIiwN
Cj4+ICsgICAgICAgICAgICAgICBpcnEsIG5yX2NwdV9pZHMsIGNwdW1hc2tfYml0cyhkZXNjLT5h
ZmZpbml0eSksDQo+PiArICAgICAgICAgICAgICAgbnJfY3B1X2lkcywgY3B1bWFza19iaXRzKGRl
c2MtPmFyY2guY3B1X21hc2spLA0KPj4gKyAgICAgICAgICAgICAgIGRlc2MtPmFyY2gudmVjdG9y
LCBkZXNjLT5oYW5kbGVyLT50eXBlbmFtZSwgZGVzYy0+c3RhdHVzKTsNCj4gDQo+IFRha2luZyBh
IHNhbXBsZSBsYXJnZSBzeXN0ZW0gKFJvbWUsIHdpdGggeW91ciB4MmFwaWMgc2VyaWVzIHRvIGJl
DQo+IHNwZWNpZmljKSwgd2hpY2ggaXMgb25seSBoYWxmIGFzIGxhcmdlIGFzIHR5cGljYWwgaGln
aC1lbmQgU2t5bGFrZSBzeXN0ZW1zLg0KPiANCj4gKFhFTikgSVJRIGluZm9ybWF0aW9uOg0KPiAo
WEVOKSAgICBJUlE6ICAgMCBhZmZpbml0eTowMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAw
MDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMSB2ZWM6ZjAgdHlwZT1JTy1B
UElDLWVkZ2UgICAgc3RhdHVzPTAwMDAwMDAwIHRpbWUuYyN0aW1lcl9pbnRlcnJ1cHQoKQ0KPiAo
WEVOKSAgICBJUlE6ICAgMSBhZmZpbml0eTowMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAw
MDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMSB2ZWM6NjggdHlwZT1JTy1B
UElDLWVkZ2UgICAgc3RhdHVzPTAwMDAwMDAyIG1hcHBlZCwgdW5ib3VuZA0KPiAoWEVOKSAgICBJ
UlE6ICAgMyBhZmZpbml0eTpmZmZmZmZmZixmZmZmZmZmZixmZmZmZmZmZixmZmZmZmZmZixmZmZm
ZmZmZixmZmZmZmZmZixmZmZmZmZmZixmZmZmZmZmZiB2ZWM6NzAgdHlwZT1JTy1BUElDLWVkZ2Ug
ICAgc3RhdHVzPTAwMDAwMDAyIG1hcHBlZCwgdW5ib3VuZA0KPiAoWEVOKSAgICBJUlE6ICAgNCBh
ZmZpbml0eTpmZmZmZmZmZixmZmZmZmZmZixmZmZmZmZmZixmZmZmZmZmZixmZmZmZmZmZixmZmZm
ZmZmZixmZmZmZmZmZixmZmZmZmZmZiB2ZWM6ZjEgdHlwZT1JTy1BUElDLWVkZ2UgICAgc3RhdHVz
PTAwMDAwMDAwIG5zMTY1NTAuYyNuczE2NTUwX2ludGVycnVwdCgpDQo+IChYRU4pICAgIElSUTog
ICA1IGFmZmluaXR5OjAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAw
LDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAxIHZlYzo3OCB0eXBlPUlPLUFQSUMtZWRnZSAgICBz
dGF0dXM9MDAwMDAwMDIgbWFwcGVkLCB1bmJvdW5kDQo+IChYRU4pICAgIElSUTogICA2IGFmZmlu
aXR5OjAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAw
LDAwMDAwMDAwLDAwMDAwMDAxIHZlYzo4OCB0eXBlPUlPLUFQSUMtZWRnZSAgICBzdGF0dXM9MDAw
MDAwMDIgbWFwcGVkLCB1bmJvdW5kDQo+IChYRU4pICAgIElSUTogICA3IGFmZmluaXR5OmZmZmZm
ZmZmLGZmZmZmZmZmLGZmZmZmZmZmLGZmZmZmZmZmLGZmZmZmZmZmLGZmZmZmZmZmLGZmZmZmZmZm
LGZmZmZmZmZmIHZlYzo5MCB0eXBlPUlPLUFQSUMtbGV2ZWwgICBzdGF0dXM9MDAwMDAwMDIgbWFw
cGVkLCB1bmJvdW5kDQo+IChYRU4pICAgIElSUTogICA4IGFmZmluaXR5OjAwMDAwMDAwLDAwMDAw
MDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAx
IHZlYzo5OCB0eXBlPUlPLUFQSUMtZWRnZSAgICBzdGF0dXM9MDAwMDAwMzAgaW4tZmxpZ2h0PTAg
ZG9tYWluLWxpc3Q9MDogIDgoLS0tKSwNCj4gKFhFTikgICAgSVJROiAgIDkgYWZmaW5pdHk6MDAw
MDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAw
MDAsMDAwMDAwMDEgdmVjOmEwIHR5cGU9SU8tQVBJQy1sZXZlbCAgIHN0YXR1cz0wMDAwMDAzMCBp
bi1mbGlnaHQ9MSBkb21haW4tbGlzdD0wOiAgOShQTU0pLA0KPiANCj4gVGhpcyBjaGFuZ2UgaXMg
Z29pbmcgdG8gZG91YmxlIHVwIHRoZSBhZmZpbml0eSBibG9jaywgd2hpY2ggd2lsbCBtYWtlDQo+
IHRoZSBsaW5lcyBldmVuIGxvbmdlci4NCj4gDQo+IEdpdmVuIHRoYXQgYWxsIGV4YW1wbGVzIEkn
dmUgZXZlciBzcG90dGVkIGFyZSBlaXRoZXIgYSBzaW5nbGUgYml0LCBvciBhDQo+IGZ1bGx5IHNl
dCBibG9jaywgeyUqcGJsfSB3aWxsIHJlbmRlciBpbiBhIG11Y2ggc2hvcnRlciwgYW5kIGtlZXAg
dGhlDQo+IGxpbmUgbGVuZ3RoIHJlYXNvbmFibGUuwqAgKFRoaXMgaW4gcHJhY3RpY2UgYXBwbGll
cyB0byB0aGUgcHJldmlvdXMgcGF0Y2gNCj4gYXMgd2VsbCkuDQoNCldpdGggU01UIG9mZiAob24g
SW50ZWwgc3lzdGVtcykgSSd2ZSBjZXJ0YWlubHkgb2JzZXJ2ZWQgZXZlcnkgb3RoZXIgYml0DQpi
ZWluZyBzZXQsIHdoaWNoIGlzIHdoeSBJIGhhZCBzcGVjaWZpY2FsbHkgZGVjaWRlZCBhZ2FpbnN0
ICUqcGJsLiBQbHVzDQp1c2luZyAlKnBibCB3b3VsZCBicmVhayB0aGUgdGFidWxhciBmb3JtYXR0
aW5nLiBUaGUgb25seSBtaWRkbGUgZ3JvdW5kDQpJIGNvdWxkIHNlZSAoc3RpbGwgaGF2aW5nIHRo
ZSB1bmRlc2lyYWJsZSBsYXR0ZXIgZWZmZWN0KSB3b3VsZCBiZSB0bw0KcGljayBiZXR3ZWVuIGJv
dGggZm9ybXMgYmFzZWQgb24gdGhlIHJhdGlvIGJldHdlZW4gc2V0IGJpdHMgYW5kIHRvdGFsDQpu
dW1iZXIgb2YgdGhlbSAoYW5kIHBlcmhhcHMgdXNpbmcgJSpwYiBhcyBsb25nIGFzIHRoZSB0b3Rh
bCBudW1iZXIgb2YNCnRoZW0gaXMgYmVsb3cgYSBjZXJ0YWluIHRocmVzaG9sZCkuIFRob3VnaHRz
Pw0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
