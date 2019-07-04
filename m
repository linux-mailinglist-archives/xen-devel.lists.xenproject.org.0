Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B355F548
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 11:15:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hixnO-0007Dw-Rq; Thu, 04 Jul 2019 09:12:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hixnN-0007Dq-2k
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 09:12:49 +0000
X-Inumbo-ID: e1ef8515-9e3b-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e1ef8515-9e3b-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 09:12:47 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 09:12:45 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 09:09:03 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 09:09:03 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3266.namprd18.prod.outlook.com (10.255.163.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Thu, 4 Jul 2019 09:09:02 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 09:09:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v2 2/2] x86/traps: widen condition for logging
 top-of-stack
Thread-Index: AQHVMYkwcjc8Dr6fl02oECpK/6oOhKa4ssEAgACafouAAN/oAA==
Date: Thu, 4 Jul 2019 09:09:02 +0000
Message-ID: <65dfe1f9-0e0d-07f9-7595-b037984ff0ae@suse.com>
References: <5CF0ECE80200007800233D41@prv1-mh.provo.novell.com>
 <5D074AE60200007800238B5E@prv1-mh.provo.novell.com>
 <5D074BA30200007800238B6C@prv1-mh.provo.novell.com>
 <eb44801a-1081-858d-4853-6dc574e0c6d6@citrix.com>
 <2e2a1d5d-f04e-5400-6817-86a7985b1c9b@suse.com>
 <48d87646-5fa2-4cb7-e7a4-e83af1f372dd@citrix.com>
In-Reply-To: <48d87646-5fa2-4cb7-e7a4-e83af1f372dd@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0301.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::25) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6891a95b-49d0-4f67-74c4-08d7005f41d3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3266; 
x-ms-traffictypediagnostic: BY5PR18MB3266:
x-microsoft-antispam-prvs: <BY5PR18MB3266F52ECED11E6EB292EC95B3FA0@BY5PR18MB3266.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(189003)(199004)(53936002)(6512007)(81166006)(316002)(8676002)(54906003)(229853002)(7736002)(6436002)(305945005)(31686004)(81156014)(256004)(5660300002)(36756003)(2906002)(6916009)(478600001)(6486002)(80792005)(6246003)(6506007)(86362001)(386003)(2616005)(8936002)(186003)(26005)(52116002)(11346002)(476003)(76176011)(72206003)(71200400001)(99286004)(25786009)(71190400001)(561944003)(4326008)(486006)(31696002)(446003)(66446008)(66946007)(73956011)(66476007)(102836004)(53546011)(66556008)(64756008)(14454004)(3846002)(6116002)(68736007)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3266;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4PeKcAMVsWyptCs2vvTWOf4qvqh4rxch8HjyQewrGCeSI1wmPd788YxLEKh09BeVhmkoXWwKXonQx2zCeh3r6rFFpOwOsjbfps9bWoTr9wFoJe2EuJlZjhIZ1uzptsuMakaLKEi4/QE8e6x7effDH0+PwsKQbdfeRWRtqBlj32pvFoBcc3nri0kOyK9vBrCXPadzyUf6IoI1g2FTDb0DutMXwElvjttwlggqIrRNlRh+ipdFZY0IP5z9fWjcTI4jamDqLuqbsDDgF0OfOOuH2L+ugNcH/1kLXlPn97Ce0guKfWWGPIXU3531ukIFxyDOmsGf096XRk+GDJEui2JjrB928aLXQIE4YDOS5D0jCGwCeIFk9zuot/sDHnnGMufbhi0bTTV5ySGBnpTNTnqUXelFMCmOvVsx7Vx2d26jlAc=
Content-ID: <F0269CF7BE812848B1C6A56553D0D91C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6891a95b-49d0-4f67-74c4-08d7005f41d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 09:09:02.5862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3266
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/traps: widen condition for
 logging top-of-stack
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAyMTo0NywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDMvMDcvMjAx
OSAxMTozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAwMy4wNy4yMDE5IDEyOjIxLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IEknbSBzdGlsbCBvcHBvc2VkIHRvIHRoaXMuwqAgVGhlIGlu
dHJvZHVjdGlvbiBvZiA/IGRvZXMgbW9yZSBoYXJtIHRoYW4NCj4+PiBnb29kIElNTywgYmVjYXVz
ZSBpdCBzaW1wbHkgY2FuJ3QgYmUgdHJ1c3RlZC4NCj4+Pg0KPj4+IFN0YWNrIHRyYWNlcyBhcmUg
bm90IGd1YXJhbnRlZWQtYWNjdXJhdGUsIGV2ZW4gd2l0aCBmcmFtZSBwb2ludGVycw0KPj4+IGVu
YWJsZWQuwqAgVGhlIG9ubHkgdGhpbmcgd2UgY2FuIHNheSBmb3IgY2VydGFpbiBpbiBhbnkgdHJh
Y2UgaXMgd2hlcmUNCj4+PiAlcmlwIHBvaW50cy4NCj4+IFllcywgSSByZWFsaXplIHlvdSBzdGls
bCBkb24ndCBsaWtlIHRoaXMuIEJ1dCBzaW1pbGFybHkgdG8gdGhlDQo+PiBvdGhlciBwYXRjaCBz
ZXQgLSBvbiB0aGUgdjEgZGlzY3Vzc2lvbiBoZXJlIEkgd2FzIGxhY2tpbmcNCj4+IGZlZWRiYWNr
LCBhbmQgaGVuY2UgSSBldmVudHVhbGx5IHRpbWVkIG91dCBhbmQgc2VudCB2Mi4gVGhlDQo+PiBx
dWVzdGlvbiBpcyAtIHdoYXQgaXMgeW91ciBhbHRlcm5hdGl2ZSBwcm9wb3NhbCB0byBkaXN0aW5n
dWlzaA0KPj4gdGhlIHRydWx5IGd1ZXNzZWQgZW50cnkgbG9nZ2VkIGhlcmUgZnJvbSB0aGUgbW9y
ZSByZWxpYWJsZQ0KPj4gb25lcz8gQW5kIHRoZW4gc2ltaWxhcmx5IGhvdyB0byBkaXN0aW5ndWlz
aCB0aGUgbGVzcyByZWxpYWJsZQ0KPj4gb25lcyBwcm9kdWNlZCBieSB0aGUgIUNPTkZJR19GUkFN
RV9QT0lOVEVSIHZhcmlhbnQgb2YNCj4+IF9zaG93X3RyYWNlKCkgZnJvbSB0aGVpciBtb3JlIHJl
bGlhYmxlIGNvdW50ZXJwYXJ0cz8NCj4gDQo+IEEgY3JhenkgaWRlYSBJJ3ZlIGp1c3QgaGFkLsKg
IEFubm90YXRlIGFsbCBwcmludGVkIGxpbmVzIHdpdGggYSBjaGFyYWN0ZXINCj4gaWRlbnRpZnlp
bmcgd2hpY2ggc291cmNlIG9mIGluZm9ybWF0aW9uIHdlIHVzZWQ/DQo+IA0KPiBXZSBjb3VsZCBo
YXZlIFtyXSBmb3IgcmVnaXN0ZXIgc3RhdGUsIFtmXSBmb3IgImZyb20gZnJhbWUgcG9pbnRlciIs
IGFuZA0KPiBbc10gZm9yICJmcm9tIHN0YWNrIHJ1YmJsZSIuDQoNCkknbSBmaW5lIHdpdGggdGhl
IGZ1bmRhbWVudGFsIGlkZWEsIGJ1dCBJJ20gbm90IG92ZXJseSBoYXBweSB3aXRoIHRoZQ0Kc2Vj
b25kIHBhaXIgb2YgKHNxdWFyZSkgYnJhY2tldHMgdGhhdCB3b3VsZCBhcHBlYXIuIFR3byB2YXJp
YW50cyBvZg0Kd2hhdCB5b3VyIHByb3Bvc2FsIGNvbWUgdG8gbWluZDoNCg0KMSkgVXNlIChsaWtl
IEkgZGlkKSAnPycgZm9yICJzdGFjayBydWJibGUiIChhcyB5b3UgY2FsbCBpdCksICcqJyBmb3IN
CmZyYW1lIHBvaW50ZXIgYmFzZWQgZW50cmllcywgYW5kICchJyBmb3IgcmVnaXN0ZXIgb25lcy4N
Cg0KMikgSW5zdGVhZCBvZiB0aGUgZXh0cmEgYnJhY2tldHMsIHByZWZpeCBhIGNoYXJhY3RlciBh
bG9uZyBvZiB3aGF0DQp5b3UndmUgc3VnZ2VzdGVkIChJJ2QgdXNlIHVwcGVyIGNhc2Ugb25lcyB0
aG91Z2gpIGltbWVkaWF0ZWx5DQppbnNpZGUgdGhlIGFscmVhZHkgcHJlc2VudCBicmFja2V0cywg
Zm9sbG93ZWQgZS5nLiBieSBhIGNvbG9uIGFzDQpzZXBhcmF0b3IuDQoNCkphbg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
