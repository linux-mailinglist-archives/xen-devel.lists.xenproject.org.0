Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C408E81D57
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 15:33:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hud4g-00059r-V2; Mon, 05 Aug 2019 13:30:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hud4f-00058p-Ug
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 13:30:53 +0000
X-Inumbo-ID: 3627b204-b785-11e9-ba9a-d75ed17f297b
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3627b204-b785-11e9-ba9a-d75ed17f297b;
 Mon, 05 Aug 2019 13:30:52 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 13:30:42 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 13:28:44 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 13:28:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPAFMZWemKjKvI+rj5XvFCZOlLT/sL5StZ9FNxIxsnZciVPyscYP5PK6nK5UFKA4BqAOB9NvIhoHH37CJHOXNaBp26xtLrzHLkH/I5fRMNcIxViXN2id+HhdsdwpdIHwgiIycWVGjPY+40ml2FPraY07iO1G+Cg74ruaesWm4lEDb/mTj6ov7M8bCayXsfN34s5iwKE500/16GzVEKAJKJEY0xJwARjVgEVqG1jLuF3C+uzw6Sajx4ShW3bPH1O0EZtSZ3PvfUvIm3iQS9A+rIDlr1NHRvvyy4J8Cx9Cz9cJnGafRZ8cnj/N+iMZv80i1ZSm8lL+sJya3JbPpJP/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaAhHy7m0tTp49IIQRxF4k1VzyM7o3Wj4OznEEjopwc=;
 b=oNSmfHpeOxoUvyFvpC+t3qRet63IqYF9Z2nAWnCxBcJCDX5LNHQTMwiH7TWeVAdBaHGkIvhG9qancPepxTwubZpuSJCCIN8+5kMgf6Zf89UmcXK88W4Ppm7qcu+eml+caAQHk3RlYxBxB/uYMirAQPr/udv+7p5SnCGBeXcNAu1hRf41U08p0PVU1KCt7CHwDeZcXA6IFAZBDAuA1Zb8qQq2+RP/yiYMe2TEhXN7le4HFqYAPR7Jl5DNUirxZXMMQ5JfH7NhAjnvn/hrNFfv8gU+kVWJJxmZ71PcdH8ws8qK8kPOqqyYiZwE7Ow8n/oqPaQnrNLi3BLcIwYyaL75ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2415.namprd18.prod.outlook.com (20.179.81.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 13:28:43 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 13:28:43 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [PATCH v8 14/16] x86/microcode: Synchronize late microcode
 loading
Thread-Index: AQHVSFKr3nOgmxjRgEC58Iy/dUUpk6bsZIcAgAAp5guAAARNgA==
Date: Mon, 5 Aug 2019 13:28:43 +0000
Message-ID: <6a6fd350-1b5c-3393-b23f-9c6a46122200@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-15-git-send-email-chao.gao@intel.com>
 <14b8b6ba-4b3c-dada-dfb2-65b815ca621f@suse.com>
 <20190805131623.GC1685@gao-cwp>
In-Reply-To: <20190805131623.GC1685@gao-cwp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR10CA0008.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::18) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5726a6fb-6c88-4b2c-b0db-08d719a8d627
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2415; 
x-ms-traffictypediagnostic: MN2PR18MB2415:
x-microsoft-antispam-prvs: <MN2PR18MB2415BD0DB2C9376E694ACB8EB3DA0@MN2PR18MB2415.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(189003)(199004)(7416002)(478600001)(80792005)(71200400001)(71190400001)(31686004)(2906002)(316002)(66946007)(66446008)(64756008)(66556008)(66476007)(6486002)(66066001)(6512007)(6436002)(53936002)(6246003)(4326008)(25786009)(31696002)(229853002)(36756003)(86362001)(186003)(26005)(11346002)(446003)(486006)(8676002)(81156014)(81166006)(8936002)(68736007)(53546011)(102836004)(6506007)(76176011)(386003)(5660300002)(256004)(3846002)(6916009)(305945005)(2616005)(54906003)(476003)(6116002)(14444005)(14454004)(7736002)(99286004)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2415;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RNNqiFQ26WekbHJQrk9cpRldSHx2hvLkdRtHA9guHjkK9Neh/qqDmdGHWIFQ8oa+P7C36fU0qpo3L+NbMvMG4tOFP+Obh5u2d5LaH3kwkwg9zOlo1tDkkZvbm8M2tFhqu0ZCqwfv8l/ZhG/jwRnkI2+mxilBQe9C33vX7crPwo0TymRsonC5W0YvumzI1KSRxe06sDwH0cvSKehHAPruwc2Q96Y53f2nIeDtRUJtZL4s6SvcX/oIoqAQny0SxrI1Oyc9+Az3TYrmZDmux+kMmMuPWHcpbThvnWNtM1ZX9GsbYWwSe4od0f9U7f16BuYsFqQYl3ONzQ5Lr2qrJ3HxlmPLDP1xR6T+uG+hIzGZClnMl1zPJoZFqEzYf0S0XKiEMRNQMjS/GjdrxSPnJ2onr+7hVERxStZAJ0wrL+nnJWo=
Content-ID: <C78D4198A561B9469EA7FCF96CD0F39C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5726a6fb-6c88-4b2c-b0db-08d719a8d627
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 13:28:43.5679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2415
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 14/16] x86/microcode: Synchronize late
 microcode loading
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
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@suse.de>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxNToxNiwgQ2hhbyBHYW8gd3JvdGU6DQo+IE9uIE1vbiwgQXVnIDA1LCAy
MDE5IGF0IDEwOjQzOjE2QU0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDEuMDgu
MjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+Pj4gQEAgLTI4MywzNyArMzQ1LDEwNSBAQCBz
dGF0aWMgaW50IG1pY3JvY29kZV91cGRhdGVfY3B1KGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfcGF0
Y2ggKnBhdGNoKQ0KPj4+ICAgICAgICByZXR1cm4gZXJyOw0KPj4+ICAgIH0NCj4+PiAgICANCj4+
PiAtc3RhdGljIGxvbmcgZG9fbWljcm9jb2RlX3VwZGF0ZSh2b2lkICpwYXRjaCkNCj4+PiArc3Rh
dGljIGludCBkb19taWNyb2NvZGVfdXBkYXRlKHZvaWQgKnBhdGNoKQ0KPj4+ICAgIHsNCj4+PiAt
ICAgIHVuc2lnbmVkIGludCBjcHU7DQo+Pj4gKyAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3By
b2Nlc3Nvcl9pZCgpOw0KPj4+ICsgICAgdW5zaWduZWQgaW50IGNwdV9uciA9IG51bV9vbmxpbmVf
Y3B1cygpOw0KPj4+ICsgICAgaW50IHJldDsNCj4+PiAgICANCj4+PiAtICAgIC8qIHN0b3JlIHRo
ZSBwYXRjaCBhZnRlciBhIHN1Y2Nlc3NmdWwgbG9hZGluZyAqLw0KPj4+IC0gICAgaWYgKCAhbWlj
cm9jb2RlX3VwZGF0ZV9jcHUocGF0Y2gpICYmIHBhdGNoICkNCj4+PiArICAgIC8qIE1hcmsgbG9h
ZGluZyBhbiB1Y29kZSBpcyBpbiBwcm9ncmVzcyAqLw0KPj4+ICsgICAgY21weGNoZygmbG9hZGlu
Z19zdGF0ZSwgTE9BRElOR19FWElURUQsIExPQURJTkdfRU5URVJFRCk7DQo+Pg0KPj4gV2h5IGNt
cHhjaGcoKSwgZXNwZWNpYWxseSB3aGVuIHlvdSBkb24ndCBjaGVjayB3aGV0aGVyIHRoZSBzdG9y
ZQ0KPj4gaGFzIGFjdHVhbGx5IGhhcHBlbmVkPyAoU2FtZSBmdXJ0aGVyIGRvd24gdGhlbi4pDQo+
IA0KPiBsb2FkaW5nX3N0YXRlIGlzIHNldCB0byAiTE9BRElOR19FWElURUQiIGJ5IHRoZSBjYWxs
ZXIuIFNvIHRoZSBmaXJzdCBDUFUNCj4gY29taW5nIGhlcmUgd291bGQgc3RvcmUgIkxPQURJTkdf
RU5URVJFRCIgdG8gaXQuIEFuZCB3ZSBkb24ndCBuZWVkDQo+IHNwZWNpYWwgaGFuZGxpbmcgZm9y
IHRoZSBDUFUgdGhhdCBzZXRzIHRoZSBzdGF0ZSwgc28gdGhlIHJldHVybiB2YWx1ZQ0KPiBpc24n
dCBjaGVja2VkLg0KPiANCj4gSGVyZSBhcmUgbXkgY29uc2lkZXJhdGlvbnMgYWJvdXQgaG93IHRv
IHNldCB0aGUgc3RhdGU6DQo+IDEpIFdlIGNhbm5vdCBzZXQgdGhlIHN0YXRlIGluIHRoZSBjYWxs
ZXIuIEJlY2F1c2Ugd2Ugd291bGQgdXNlIHRoaXMNCj4gc3RhdGUgdG8gYmxvY2sgI05NSSBoYW5k
bGluZy4gU2V0dGluZyB0aGUgc3RhdGUgaW4gdGhlIGNhbGxlciBtYXkNCj4gYnJlYWsgc3RvcF9t
YWNoaW5lX3J1biBtZWNoYW5pc20gd2l0aCB0aGUgcGF0Y2ggMTYuDQo+IA0KPiAyKSBUaGUgZmly
c3QgQ1BVIHJlYWNoaW5nIGhlcmUgc2hvdWxkIHNldCB0aGUgc3RhdGUgKGl0IG1lYW5zIHdlIGNh
bm5vdA0KPiBjaG9vc2Ugb25lIENQVSwgZS5nLiBCU1AsIHRvIGRvIGl0KS4gV2l0aCB0aGlzLCAj
Tk1JIGhhbmRsaW5nIGlzDQo+IGRpc2FibGVkIHN5c3RlbS13aXNlIGJlZm9yZSBhbnkgQ1BVIGNh
bGxzIGluLiBPdGhlcndpc2UsIGlmIHRoZXJlIGlzDQo+IGFuIGV4Y2VwdGlvbiBmb3IgYSBDUFUs
IGl0IG1heSBiZSBzdGlsbCBpbiAjTk1JIGhhbmRsaW5nLCB3aGVuIGl0cw0KPiBzaWJsaW5nIHRo
cmVhZCBzdGFydHMgbG9hZGluZyBhbiB1Y29kZS4NCj4gDQo+IDMpIEEgc2ltcGxlIGFzc2lnbm1l
bnQgb24gZXZlcnkgQ1BVIGlzIHByb2JsZW1hdGljIGluIHNvbWUgY2FzZXMuDQo+IEZvciBleGFt
cGxlLCBpZiBvbmUgQ1BVIGNvbWVzIGluIGFmdGVyIG90aGVyIENQVXMgdGltZWQgb3V0IGFuZCBs
ZWZ0LA0KPiBpdCBtaWdodCBzZXQgdGhlIHN0YXRlIHRvICJMT0FESU5HX0VOVEVSRUQiIGFuZCBi
ZSBibG9ja2VkIGluICNOTUkNCj4gaGFuZGxpbmcgZm9yZXZlciB3aXRoIHBhdGNoIDE2Lg0KPiAN
Cj4gVGhhdCdzIHdoeSBJIGNob29zZSB0byB1c2UgYSBjbXB4aGcoKS4NCg0KQnV0IGlmIHRoZSBl
eHBlY3RlZCBpbmNvbWluZyBzdGF0ZSBpcyBfbm90XyB0aGUgb25lIGFjdHVhbGx5IGZvdW5kDQpp
biBtZW1vcnksIHRoZW4gdGhlIGNtcHhjaGcoKSB3aWxsIHNpbGVudGx5IGRlZ2VuZXJhdGUgdG8g
YSBuby1vcCwNCndpdGhvdXQgYW55b25lIG5vdGljaW5nIG90aGVyIHRoYW4gdGhlIHN5c3RlbSBt
aXNiZWhhdmluZyBpbiBhbg0KdW5wcmVkaWN0YWJsZSB3YXkuDQoNCk9uIHRoZSB3aG9sZSwgc2Vl
aW5nIHlvdXIgZXhwbGFuYXRpb24gYWJvdmUsIHRoZXJlIGlzIG1lcml0IHRvDQp1c2luZyBjbXB4
Y2hnKCkuIEJ1dCBhdCB0aGUgdmVyeSBsZWFzdCB0aGlzIGJhY2tncm91bmQgbmVlZHMgdG8gYmUN
CnB1dCBpbiB0aGUgZGVzY3JpcHRpb247IHBlcmhhcHMgYmV0dGVyIGluIGEgY29kZSBjb21tZW50
IG5leHQgdG8NCnRoZSB2YXJpYWJsZSBkZWZpbml0aW9uLg0KDQo+IFJlZ2FyZGluZyB0aGUgY21w
eGNoZygpIGluIGVycm9yLWhhbmRsaW5nIGJlbG93LCBpdCBjYW4gYmUgcmVwbGFjZWQgYnkNCj4g
YSBzaW1wbGUgYXNzaWdubWVudC4gQnV0IEkgYW0gbm90IHN1cmUgd2hldGhlciBpdCBpcyBiZXR0
ZXIgdG8gdXNlDQo+IGNtcHhjaGcoKSBjb25zaWRlcmluZyBjYWNoZSBsaW5lIGJvdW5jaW5nLg0K
DQpJIGRpZG4ndCB0aGluayBNT1Ygd291bGQgY2F1c2UgbW9yZSBoZWF2eSBjYWNoZWxpbmUgYm91
bmNpbmcgY29tcGFyZWQNCnRvIENNUFhDSEcuDQoNCj4+PiArICAgIGNwdW1hc2tfc2V0X2NwdShj
cHUsICZjcHVfY2FsbGluX21hcCk7DQo+Pj4gKyAgICByZXQgPSB3YWl0X2Zvcl9jb25kaXRpb24o
d2FpdF9jcHVfY2FsbGluLCAodm9pZCAqKSh1bnNpZ25lZCBsb25nKWNwdV9uciwNCj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBNSUNST0NPREVfQ0FMTElOX1RJTUVPVVRfVVMpOw0K
Pj4+ICsgICAgaWYgKCByZXQgKQ0KPj4+ICAgICAgICB7DQo+Pj4gLSAgICAgICAgc3Bpbl9sb2Nr
KCZtaWNyb2NvZGVfbXV0ZXgpOw0KPj4+IC0gICAgICAgIG1pY3JvY29kZV91cGRhdGVfY2FjaGUo
cGF0Y2gpOw0KPj4+IC0gICAgICAgIHNwaW5fdW5sb2NrKCZtaWNyb2NvZGVfbXV0ZXgpOw0KPj4+
IC0gICAgICAgIHBhdGNoID0gTlVMTDsNCj4+PiArICAgICAgICBjbXB4Y2hnKCZsb2FkaW5nX3N0
YXRlLCBMT0FESU5HX0VOVEVSRUQsIExPQURJTkdfQUJPUlRFRCk7DQo+Pj4gKyAgICAgICAgcmV0
dXJuIHJldDsNCj4+PiAgICAgICAgfQ0KPj4+ICAgIA0KPj4+IC0gICAgaWYgKCBtaWNyb2NvZGVf
b3BzLT5lbmRfdXBkYXRlICkNCj4+PiAtICAgICAgICBtaWNyb2NvZGVfb3BzLT5lbmRfdXBkYXRl
KCk7DQo+Pj4gKyAgICAvKg0KPj4+ICsgICAgICogTG9hZCBtaWNyb2NvZGUgdXBkYXRlIG9uIG9u
bHkgb25lIGxvZ2ljYWwgcHJvY2Vzc29yIHBlciBjb3JlLCBvciBpbg0KPj4+ICsgICAgICogQU1E
J3MgdGVybSwgb25lIGNvcmUgcGVyIGNvbXB1dGUgdW5pdC4gVGhlIG9uZSB3aXRoIHRoZSBsb3dl
c3QgdGhyZWFkDQo+Pj4gKyAgICAgKiBpZCBhbW9uZyBhbGwgc2libGluZ3MgaXMgY2hvc2VuIHRv
IHBlcmZvcm0gdGhlIGxvYWRpbmcuDQo+Pj4gKyAgICAgKi8NCj4+PiArICAgIGlmICggKGNwdSA9
PSBjcHVtYXNrX2ZpcnN0KHBlcl9jcHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSkpICkNCj4+PiAr
ICAgIHsNCj4+PiArICAgICAgICBzdGF0aWMgdW5zaWduZWQgaW50IHBhbmlja2VkID0gMDsNCj4+
PiArICAgICAgICBib29sIG1vbml0b3I7DQo+Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IGRvbmU7
DQo+Pj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyB0aWNrID0gMDsNCj4+PiAgICANCj4+PiAtICAg
IGNwdSA9IGNwdW1hc2tfbmV4dChzbXBfcHJvY2Vzc29yX2lkKCksICZjcHVfb25saW5lX21hcCk7
DQo+Pj4gLSAgICBpZiAoIGNwdSA8IG5yX2NwdV9pZHMgKQ0KPj4+IC0gICAgICAgIHJldHVybiBj
b250aW51ZV9oeXBlcmNhbGxfb25fY3B1KGNwdSwgZG9fbWljcm9jb2RlX3VwZGF0ZSwgcGF0Y2gp
Ow0KPj4+ICsgICAgICAgIHJldCA9IG1pY3JvY29kZV9vcHMtPmFwcGx5X21pY3JvY29kZShwYXRj
aCk7DQo+Pj4gKyAgICAgICAgaWYgKCAhcmV0ICkNCj4+PiArICAgICAgICB7DQo+Pj4gKyAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBjcHUyOw0KPj4+ICAgIA0KPj4+IC0gICAgLyogRnJlZSB0aGUg
cGF0Y2ggaWYgbm8gQ1BVIGhhcyBsb2FkZWQgaXQgc3VjY2Vzc2Z1bGx5LiAqLw0KPj4+IC0gICAg
aWYgKCBwYXRjaCApDQo+Pj4gLSAgICAgICAgbWljcm9jb2RlX2ZyZWVfcGF0Y2gocGF0Y2gpOw0K
Pj4+ICsgICAgICAgICAgICBhdG9taWNfaW5jKCZjcHVfdXBkYXRlZCk7DQo+Pj4gKyAgICAgICAg
ICAgIC8qIFByb3BhZ2F0ZSByZXZpc2lvbiBudW1iZXIgdG8gYWxsIHNpYmxpbmdzICovDQo+Pj4g
KyAgICAgICAgICAgIGZvcl9lYWNoX2NwdShjcHUyLCBwZXJfY3B1KGNwdV9zaWJsaW5nX21hc2ss
IGNwdSkpDQo+Pj4gKyAgICAgICAgICAgICAgICBwZXJfY3B1KGNwdV9zaWcsIGNwdTIpLnJldiA9
IHRoaXNfY3B1KGNwdV9zaWcpLnJldjsNCj4+PiArICAgICAgICB9DQo+Pj4gICAgDQo+Pj4gLSAg
ICByZXR1cm4gMDsNCj4+PiArICAgICAgICAvKg0KPj4+ICsgICAgICAgICAqIFRoZSBmaXJzdCBD
UFUgcmVhY2hpbmcgaGVyZSB3aWxsIG1vbml0b3IgdGhlIHByb2dyZXNzIGFuZCBlbWl0DQo+Pj4g
KyAgICAgICAgICogd2FybmluZyBtZXNzYWdlIGlmIHRoZSBkdXJhdGlvbiBpcyB0b28gbG9uZyAo
ZS5nLiA+MSBzZWNvbmQpLg0KPj4+ICsgICAgICAgICAqLw0KPj4+ICsgICAgICAgIG1vbml0b3Ig
PSAhYXRvbWljX2luY19yZXR1cm4oJmNwdV9vdXQpOw0KPj4+ICsgICAgICAgIGlmICggbW9uaXRv
ciApDQo+Pj4gKyAgICAgICAgICAgIHRpY2sgPSByZHRzY19vcmRlcmVkKCk7DQo+Pj4gKw0KPj4+
ICsgICAgICAgIC8qIFdhaXRpbmcgZm9yIGFsbCBjb3JlcyBvciBjb21wdXRpbmcgdW5pdHMgZmlu
aXNoaW5nIHVwZGF0ZSAqLw0KPj4+ICsgICAgICAgIGRvbmUgPSBhdG9taWNfcmVhZCgmY3B1X291
dCk7DQo+Pj4gKyAgICAgICAgd2hpbGUgKCBwYW5pY2tlZCAmJiBkb25lICE9IG5yX2NvcmVzICkN
Cj4+DQo+PiBEb24ndCB5b3UgbWVhbiAiIXBhbmlja2VkIiBoZXJlLCBvciB8fCBpbnN0ZWFkIG9m
ICYmID8gT3RoZXJ3aXNlIEkgZG9uJ3QNCj4+IHNlZSBob3cgdGhlIGxvb3Agd291bGQgZXZlciBi
ZSBlbnRlcmVkLg0KPiANCj4gU29ycnkuIEl0IHNob3VsZCBiZSAhcGFuaWNrZWQuDQoNCkkuZS4g
eW91IG1lYW4gdG8gZXhpdCB0aGUgbG9vcCBvbiBhbGwgQ1BVcyBvbmNlIG9uZSBvZiB0aGVtIGhh
cw0KaW52b2tlZCBwYW5pYygpPyBJIGRpZCBhcHBlbmQgdGhlIGFsdGVybmF0aXZlIGZvciBhIHJl
YXNvbiAtIGl0DQpzZWVtcyB0byBtZSB0aGF0IGtlZXBpbmcgQ1BVcyBpbiB0aGlzIGxvb3AgYWZ0
ZXIgYSBwYW5pYygpIG1pZ2h0DQpiZSBiZXR0ZXIuDQoNCkphbg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
