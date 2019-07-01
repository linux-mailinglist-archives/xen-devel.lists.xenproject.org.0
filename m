Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C29F25C060
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 17:36:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhyJV-0000wD-9l; Mon, 01 Jul 2019 15:33:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhyJT-0000w7-DY
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 15:33:51 +0000
X-Inumbo-ID: 9e4cc792-9c15-11e9-a548-6b759649c57e
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e4cc792-9c15-11e9-a548-6b759649c57e;
 Mon, 01 Jul 2019 15:33:49 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 15:33:43 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 15:26:58 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 15:26:58 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3107.namprd18.prod.outlook.com (10.255.137.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 15:26:57 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 15:26:57 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH] xstate: make use_xsave non-init
Thread-Index: AQHVMAGdCquHeScd+UuKxH/O+V4l3Ka1yz2LgAAFEICAAA+07oAAAsUA
Date: Mon, 1 Jul 2019 15:26:56 +0000
Message-ID: <bf8442b7-5974-4c66-b8a7-b69d93ec1f4b@suse.com>
References: <20190701104903.72364-1-roger.pau@citrix.com>
 <addf8b00-6c2e-56e3-d5f8-ec7e52291638@suse.com>
 <20190701140153.uy5frq2kgxijxolr@MacBook-Air-de-Roger.local>
 <3daac2b4-9373-cef5-e9d1-e5aea39c697a@suse.com>
 <20190701151616.sk5tslyneueagmme@MacBook-Air-de-Roger.local>
In-Reply-To: <20190701151616.sk5tslyneueagmme@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR03CA0092.eurprd03.prod.outlook.com
 (2603:10a6:10:72::33) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62f02186-aaa5-4539-9cb2-08d6fe388da0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3107; 
x-ms-traffictypediagnostic: BY5PR18MB3107:
x-microsoft-antispam-prvs: <BY5PR18MB31076927B343CB7F9CC2CF6CB3F90@BY5PR18MB3107.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(199004)(189003)(76176011)(53936002)(81166006)(86362001)(4326008)(478600001)(68736007)(3846002)(6116002)(6506007)(53546011)(386003)(81156014)(102836004)(6512007)(99286004)(52116002)(31696002)(66446008)(73956011)(6486002)(6916009)(26005)(8936002)(6246003)(31686004)(186003)(25786009)(6436002)(256004)(14444005)(71190400001)(5024004)(71200400001)(229853002)(5660300002)(66066001)(316002)(66946007)(486006)(72206003)(2906002)(2616005)(476003)(446003)(11346002)(36756003)(14454004)(80792005)(7736002)(54906003)(305945005)(66556008)(66476007)(64756008)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3107;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lG6EjoivpO3fsQ2AE7Aif7c8QSp65x/cnPDY0RsvI1y725l967IYCTTwADs9y1MxlYCQ0ubCHgZeoGEw1mwlId/BDazgR7+C57cPEGUgoZBsUzE6nyHCEdOCf2RVEcWNIFyivZ/lWNCgbsKw2XgNKp5TXqpt6flq28CGdiuxVLVcucyniwnNatGN09AsgCxrJqSdt8PtgjnVFUv4rujpH5SmtMcMfgW1zt6jqJfuCG6b4npMa9GQ30QRCJCVwNYIlxF/zLaS9FEnPJeTeW1wLhZR0VBNZOt/e1OKWWdDfD+28zC+YNc5SmY72e1pxZClDG/WRc81oqfdv4JK4Fiq8ugbffeTFXeDQ8eoYc0dZBt7OwuCevyF42V5SG+nBcwnB+Q+PJN4PuG/XtcWVQomy3WB6toehR48jI9+naFiXF0=
Content-ID: <680BDFB072C40E47905338897D2A8E96@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f02186-aaa5-4539-9cb2-08d6fe388da0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 15:26:56.9999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3107
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] xstate: make use_xsave non-init
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDcuMjAxOSAxNzoxNiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIE1vbiwg
SnVsIDAxLCAyMDE5IGF0IDAyOjIwOjUyUE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
T24gMDEuMDcuMjAxOSAxNjowMSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+Pj4gT24gTW9u
LCBKdWwgMDEsIDIwMTkgYXQgMTE6Mzk6MTZBTSArMDAwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+
Pj4+IE9uIDAxLjA3LjIwMTkgMTI6NDksIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4+Pj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni94c3RhdGUuYw0KPj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L3hzdGF0
ZS5jDQo+Pj4+PiBAQCAtNTc3LDcgKzU3Nyw3IEBAIHVuc2lnbmVkIGludCB4c3RhdGVfY3R4dF9z
aXplKHU2NCB4Y3IwKQ0KPj4+Pj4gICAgIC8qIENvbGxlY3QgdGhlIGluZm9ybWF0aW9uIG9mIHBy
b2Nlc3NvcidzIGV4dGVuZGVkIHN0YXRlICovDQo+Pj4+PiAgICAgdm9pZCB4c3RhdGVfaW5pdChz
dHJ1Y3QgY3B1aW5mb194ODYgKmMpDQo+Pj4+PiAgICAgew0KPj4+Pj4gLSAgICBzdGF0aWMgYm9v
bCBfX2luaXRkYXRhIHVzZV94c2F2ZSA9IHRydWU7DQo+Pj4+PiArICAgIHN0YXRpYyBib29sIHVz
ZV94c2F2ZSA9IHRydWU7DQo+Pj4+DQo+Pj4+IFBsZWFzZSBhdHRhY2ggYXQgbGVhc3QgYSBicmll
ZiBjb21tZW50IGhlcmUsIHN1Y2ggdGhhdCBwZW9wbGUNCj4+Pj4gd29uJ3QgY29uc2lkZXIgdGhl
IF9faW5pdGRhdGEgbWlzc2luZy4NCj4+Pg0KPj4+IFN1cmUuDQo+Pj4NCj4+Pj4NCj4+Pj4gT2Yg
Y291cnNlIEknZCBhY3R1YWxseSBwcmVmZXIgdGhlIGFubm90YXRpb24gdG8gc3RheSBoZXJlIGlu
DQo+Pj4+IHRoZSBnY2MgY2FzZS4gSWlyYyB0aGVyZSB3YXMgb25lIG90aGVyIGNhc2Ugd2hlcmUg
dGhlcmUgd2FzDQo+Pj4+IHN1Y2ggYW4gaXNzdWU7IEkgZG9uJ3QgcmVjYWxsIHdoZXRoZXIgdGhl
cmUgaXQgdG9vIGdvdCBkZWFsdA0KPj4+PiB3aXRoIGJ5IHJlbW92aW5nIGFuIGFubm90YXRpb24u
DQo+Pj4NCj4+PiBZZXMsIGluIHRoYXQgb3RoZXIgY2FzZSB0aGUgYW5ub3RhdGlvbiB3YXMganVz
dCByZW1vdmVkLCBpdCdzIDQzZmE5NWFlIFswXQ0KPj4+DQo+Pj4+IEhvdyBhYm91dCB3ZSBpbnRy
b2R1Y2UgYW4NCj4+Pj4gYW5ub3RhdGlvbiB0aGF0IGV4cGFuZHMgdG8gbm90aGluZyBpbiB0aGUg
Y2xhbmcgY2FzZSwgYnV0DQo+Pj4+IGNvbnRpbnVlcyB0byBwcm92aWRlIHRoZSBzYW1lIGZ1bmN0
aW9uYWxpdHkgZm9yIGdjYz8gVGhhdA0KPj4+PiB3b3VsZCB0aGVuIGFsc28gY2xhcmlmeSB0aGUg
cmVhc29uIGZvciBpdCBiZWluZyBpbiBhbnkNCj4+Pj4gcGFydGljdWxhciBwbGFjZSAoSSBndWVz
cyB0aGVyZSBhcmUgZ29pbmcgdG8gYmUgbW9yZSkgd2l0aG91dA0KPj4+PiB0aGUgbmVlZCBmb3Ig
ZnVydGhlciBjb21tZW50YXJ5Lg0KPj4+DQo+Pj4gSU1PIHRoYXQncyBhIGxpdHRsZSBiaXQgZGFu
Z2Vyb3VzLCBmcm9tIHRoZSBMTFZNIGJ1ZyByZXBvcnQgaXQgc2VlbXMNCj4+PiBsaWtlIExMVk0g
YmVoYXZpb3VyIGlzIG5vdCBhIGJ1ZywgYW5kIGhlbmNlIEkgd291bGRuJ3QgYmUgc3VycHJpc2Vk
IGlmDQo+Pj4gbmV3ZXIgdmVyc2lvbnMgb2YgZ2NjIGFsc28gZXhoaWJpdCB0aGUgc2FtZSBpc3N1
ZS4NCj4+DQo+PiBPa2F5LCB0aGVuIGxldCdzIGdvIHRoZSByb3V0ZSB5b3Ugc3VnZ2VzdGVkLCBq
dXN0IHdpdGggYSBjb21tZW50DQo+PiBhZGRlZCB0byBwcmV2ZW50IHJlLWFkZGl0aW9uIG9mIHRo
ZSBhbm5vdGF0aW9uLiBJIHdvbmRlciB3aGV0aGVyDQo+PiB3ZSBvdWdodCB0byBkbyBhbiBhdWRp
dCBvZiB0aGUgY29kZSB0byBmaW5kIHBvc3NpYmxlIGZ1cnRoZXINCj4+IG9mZmVuZGVycy4gSXQg
ZG9lc24ndCBsb29rIHZlcnkgZGVzaXJhYmxlIHRvIG1lIHRvIGZpbmQgdGhlDQo+PiBpbnN0YW5j
ZXMgb25lIGJ5IG9uZSBieSBzb21lb25lIG9ic2VydmluZyBjcmFzaGVzLg0KPj4NCj4+IEhtbSwg
aGF2aW5nIGxvb2tlZCBhdCB0aGUgb2xkZXIgY29tbWl0IEknbSBhZ2FpbiBzdGFydGluZyB0byB3
b25kZXINCj4+IHdoZXRoZXIgZHJvcHBpbmcgdGhlIGFubm90YXRpb25zIGlzIHRoZSByaWdodCBj
b3Vyc2Ugb2YgYWN0aW9uLiBEaWQNCj4+IHdlIGNvbnNpZGVyIGFkZGluZyB2b2xhdGlsZSB0byB0
aGUgdmFyaWFibGUgYmFjayB0aGVuPyBUaGF0IHNob3VsZA0KPj4gbWFrZSB0aGUgY29tcGlsZXIg
bm90IHB1bGwgYWhlYWQgdGhlIG1lbW9yeSBhY2Nlc3MoZXMpLCBhbmQgdGhlDQo+PiBkb3duc2lk
ZXMgb2YgdGhpcyBzaG91bGQgYmUgcHJldHR5IGxpbWl0ZWQgZm9yIGluaXQtb25seSBpdGVtcy4N
Cj4gDQo+IElJUkMgYXQgc29tZSBwb2ludCBJIHN1Z2dlc3RlZCB1c2luZyBBQ0NFU1NfT05DRSB0
byByZWFkIHRoZSBpbml0DQo+IG9wdF9ib290c2NydWIgdmFyaWFibGUuIEFkZGluZyB0aGUgdm9s
YXRpbGUga2V5d29yZCB0byB0aGUgX19pbml0ZGF0YQ0KPiBtYWNybyBpcyBub3QgZ29pbmcgdG8g
d29yayBhcy1pcywgYmVjYXVzZSB3ZSB3b3VsZCBhbHNvIG5lZWQgdG8gZml4dXANCj4gdGhlIGV4
aXN0aW5nIGRlY2xhcmF0aW9ucyBvZiB0aGUgdmFyaWFibGVzLg0KDQpBQ0NFU1NfT05DRSgpIGlz
IG5vdCBnb29kIGhlcmUgYmVjYXVzZSB5b3UgbmVlZCB0byB0aGVuIGNhdGNoIGFsbA0KX3VzZXNf
IG9mIGEgdmFyaWFibGUuIERlYWxpbmcgd2l0aCBpdCBieSBjaGFuZ2luZyB0aGUgZGVjbGFyYXRp
b24vDQpkZWZpbml0aW9uIG1ha2VzIGl0IGEgb25lIChvciBhdCBtb3N0IHR3bykgcGxhY2UgY2hh
bmdlLiBJIHdvdWxkbid0DQpiZSB3b3JyaWVkIGFib3V0IGEgaGVhZGVyIGZpbGUgYWxzbyBuZWVk
aW5nIHRvIGNoYW5nZS4NCg0KPiBBIG1vcmUgc2ltcGxlIChhbmQgbWF5YmUgZWFzaWVyIHRvIGVu
Zm9yY2UgcnVsZSkgbWlnaHQgYmUgdG8gZm9yYmlkDQo+IHRoZSB1c2FnZSBvZiBpbml0IGRhdGEv
dGV4dCBpbiBub24taW5pdCBmdW5jdGlvbnMsIGFuZCB0aGF0IHdvdWxkDQo+IGxpa2VseSBiZSBl
YXNpZXIgdG8gZW5mb3JjZSBhdXRvbWF0aWNhbGx5IGJ5IHNvbWUgYW5hbHlzaXMgdG9vbC4NCg0K
SWYgeW91IG9yIGFueW9uZSBlbHNlIGlzIHVwIGZvciBpbnRlZ3JhdGluZyBzdWNoIGEgdG9vbCB3
aXRoIHRoZQ0KYnVpbGQgc3lzdGVtIC0gZmluZS4gUmlnaHQgbm93IHdlIGhhdmUgbm9uZSwgYW5k
IEkgZG9uJ3Qgd2FudCBzdWNoDQppc3N1ZXMgdG8gYmUgY2F1Z2h0IGJlIHNvbGVseSBkZXBlbmRl
bnQgb24gdGhlIGlzc3VlIGdldHRpbmcgbm90aWNlZA0KdGhlIGxhdGVzdCBkdXJpbmcgcmV2aWV3
Lg0KDQpUaGF0IHNhaWQsIEknbSBub3QgYWN0dWFsbHkgY29udmluY2VkIHVuY29uZGl0aW9uYWxs
eSBmb3JiaWRkaW5nDQpzdWNoIHJlZmVyZW5jZXMgKGxpa2UgTGludXggZG9lcywgcmVxdWlyaW5n
IGZ1cnRoZXIgYW5ub3RhdGlvbnMgdG8NCm92ZXJyaWRlIHRoZSBiYW4pIGlzIHRoZSBiZXN0IG1v
ZGVsLiBUaGVyZSBhcmUgY2xlYXJseSBjYXNlcyB3aGVyZQ0KaGF2aW5nIHN1Y2ggcmVmZXJlbmNl
cyBpcyBhcHByb3ByaWF0ZSBhbmQgdXNlZnVsLiBCdXQgSSBjYW4gYWNjZXB0DQp0aGF0IExpbnV4
J2VzIG1vZGVsIGlzIG92ZXJhbGwgbW9yZSBzYWZlIHRoYW4gb3VyIGN1cnJlbnQNCmVmZmVjdGl2
ZWx5IG5vbi1leGlzdGVudCBvbmUuDQoNCkphbg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
