Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED68157F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 11:31:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huZIg-0001ZQ-OT; Mon, 05 Aug 2019 09:29:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huZIf-0001ZL-C2
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 09:29:05 +0000
X-Inumbo-ID: 7195d0d6-b763-11e9-a6ce-2f203177a09a
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7195d0d6-b763-11e9-a6ce-2f203177a09a;
 Mon, 05 Aug 2019 09:28:59 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 09:28:51 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 09:27:59 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 09:27:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0iaKFvA2fHzti81CMwXioSWh+YMMcPI2RFzgeBKEtx9KzTY47nHJtAZmAk4X233eI5+Z4KBIjc8WMHNBq9N9S9ctXwQtHVBKtmPefWFri6212ClceVK+EDib5J74KE2QTecS7TQPFmZKUH2GezTiDokIWMffvPTkjJIkGIb0jUugIudLuT6DU9V+HqzGI0D/6l4Z/QKpnT4xDBIO04Kn9RgddPoe+0uyAXEdR1cy0jUA7qR6obhA/aYaMX0gG3QhfEYMvauiPijFldeDlP/e/5KJam+1QLyks864g8VZzvyjMTlJymCGarOjCm2pUXU4nZM1z54gc0a2SMtBF01+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lSLi1QWPVUmP0wwgFVtcf27krJaPuFgTfcmsGe2g4o=;
 b=Lw8dfvrX2HDPn3Adnzya805ZDmR5Upyukagu5YCl5Bdf7c9oS9wMuUQgVTmbjCaJi5pdgQVC4GnMog/EZFFzOFibBgommT+cy0Ho3q3NCr1jcSLBA+95jMfDAMPxWIdDroVyW0v7ZDbTIYhFb+4jYkYknaH4CDRbnJEm6P4VOpXGQnm2GGoJbF1in1ppV2IVd7biz9e8bmlAAWkr1UOXxoY3gYzX6zXdqcFSDC2SaT/Ih3nCf7QFRrqgceJHCX8Pp3K8ZyCJ2oGNYwCzCFKmxKPOZ3zKmB9kZHT5tOwGXfqu1RuRKmwMZcYGmGHVfzG3i4UFUht4SH51UtEmC3MSEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2814.namprd18.prod.outlook.com (20.179.23.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Mon, 5 Aug 2019 09:27:58 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 09:27:58 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [PATCH v8 03/16] microcode/intel: extend microcode_update_match()
Thread-Index: AQHVSFKZoSixyJPoX02LB9PmM1B4FKbn2+SAgAQ4EkaAADuFAA==
Date: Mon, 5 Aug 2019 09:27:58 +0000
Message-ID: <a79836ad-5a20-8a66-3dfd-c35adae1ebd3@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-4-git-send-email-chao.gao@intel.com>
 <86eff704-cf77-ede0-7220-7cab59b65982@suse.com>
 <20190805055809.GA19492@gao-cwp>
In-Reply-To: <20190805055809.GA19492@gao-cwp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0107.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::48) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 261bb05f-e6fa-4c86-77fa-08d7198733fe
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2814; 
x-ms-traffictypediagnostic: MN2PR18MB2814:
x-microsoft-antispam-prvs: <MN2PR18MB2814CBF24720BE480585D6D7B3DA0@MN2PR18MB2814.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(52314003)(199004)(189003)(478600001)(186003)(76176011)(52116002)(81166006)(36756003)(53936002)(102836004)(99286004)(26005)(71190400001)(71200400001)(81156014)(14454004)(386003)(6506007)(53546011)(7736002)(5660300002)(6512007)(66476007)(6246003)(31696002)(86362001)(66446008)(64756008)(66556008)(3846002)(6486002)(8936002)(6436002)(8676002)(6116002)(66946007)(476003)(256004)(486006)(316002)(229853002)(80792005)(31686004)(54906003)(6916009)(446003)(11346002)(2616005)(14444005)(66066001)(305945005)(68736007)(2906002)(25786009)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2814;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +6jwNQ8cxpkaNqwYbafh/+SegGnKM6n86aQDJiEAZdD6b/rQGZd41j3hAoqrSevXGdHhLUWwU4nbiwYdWHKC+h5MESzQTd9JjV4eua4rQgERJriJGna9GYvwdQvYl7denFqSi2Q0GJkl9VWNanQ9icjubmFXMbLBXkVd29Q+yix9BjQGtm1a0FQXutSJRM5MUpGKI3dm/C+tXuuf3HDT8NjApA6jmjRSqN7r7JGz9KtB11WKr6pFtE5gYWvx3zUNmGKCFNb9Rp/4LaXo/LiSz+t/Ov5OP+piwro5X4KZ5d1/BjG6E/0mguuWX5kdEGSLRCUy8T6wzZ1EU1mWw/TlepgKuL+94YIyTtOjGgcdSMLJwuXmyOFllpCbVMbZPo7iUYfNTx2O3MSeCAnaxd+Z72cKxYp94V+sfgP0VsA+2SM=
Content-ID: <1D40FFF00140D1458C0699BD4D06A680@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 261bb05f-e6fa-4c86-77fa-08d7198733fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:27:58.2077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2814
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 03/16] microcode/intel: extend
 microcode_update_match()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAwNzo1OCwgQ2hhbyBHYW8gd3JvdGU6DQo+IE9uIEZyaSwgQXVnIDAyLCAy
MDE5IGF0IDAxOjI5OjE0UE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDEuMDgu
MjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21pY3Jv
Y29kZV9pbnRlbC5jDQo+Pj4gKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jDQo+
Pj4gQEAgLTEzNCwxNCArMTM0LDM1IEBAIHN0YXRpYyBpbnQgY29sbGVjdF9jcHVfaW5mbyh1bnNp
Z25lZCBpbnQgY3B1X251bSwgc3RydWN0IGNwdV9zaWduYXR1cmUgKmNzaWcpDQo+Pj4gICAgICAg
IHJldHVybiAwOw0KPj4+ICAgIH0NCj4+PiAgICANCj4+PiAtc3RhdGljIGlubGluZSBpbnQgbWlj
cm9jb2RlX3VwZGF0ZV9tYXRjaCgNCj4+PiAtICAgIHVuc2lnbmVkIGludCBjcHVfbnVtLCBjb25z
dCBzdHJ1Y3QgbWljcm9jb2RlX2hlYWRlcl9pbnRlbCAqbWNfaGVhZGVyLA0KPj4+IC0gICAgaW50
IHNpZywgaW50IHBmKQ0KPj4+ICtzdGF0aWMgZW51bSBtaWNyb2NvZGVfbWF0Y2hfcmVzdWx0IG1p
Y3JvY29kZV91cGRhdGVfbWF0Y2goDQo+Pj4gKyAgICBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX2hl
YWRlcl9pbnRlbCAqbWNfaGVhZGVyLCB1bnNpZ25lZCBpbnQgc2lnLA0KPj4+ICsgICAgdW5zaWdu
ZWQgaW50IHBmLCB1bnNpZ25lZCBpbnQgcmV2KQ0KPj4+ICAgIHsNCj4+PiAtICAgIHN0cnVjdCB1
Y29kZV9jcHVfaW5mbyAqdWNpID0gJnBlcl9jcHUodWNvZGVfY3B1X2luZm8sIGNwdV9udW0pOw0K
Pj4+IC0NCj4+PiAtICAgIHJldHVybiAoc2lnbWF0Y2goc2lnLCB1Y2ktPmNwdV9zaWcuc2lnLCBw
ZiwgdWNpLT5jcHVfc2lnLnBmKSAmJg0KPj4+IC0gICAgICAgICAgICAobWNfaGVhZGVyLT5yZXYg
PiB1Y2ktPmNwdV9zaWcucmV2KSk7DQo+Pj4gKyAgICBjb25zdCBzdHJ1Y3QgZXh0ZW5kZWRfc2ln
dGFibGUgKmV4dF9oZWFkZXI7DQo+Pj4gKyAgICBjb25zdCBzdHJ1Y3QgZXh0ZW5kZWRfc2lnbmF0
dXJlICpleHRfc2lnOw0KPj4+ICsgICAgdW5zaWduZWQgbG9uZyBkYXRhX3NpemUgPSBnZXRfZGF0
YXNpemUobWNfaGVhZGVyKTsNCj4+PiArICAgIHVuc2lnbmVkIGludCBpOw0KPj4+ICsgICAgY29u
c3Qgdm9pZCAqZW5kID0gKGNvbnN0IHZvaWQgKiltY19oZWFkZXIgKyBnZXRfdG90YWxzaXplKG1j
X2hlYWRlcik7DQo+Pj4gKw0KPj4+ICsgICAgaWYgKCBzaWdtYXRjaChzaWcsIG1jX2hlYWRlci0+
c2lnLCBwZiwgbWNfaGVhZGVyLT5wZikgKQ0KPj4+ICsgICAgICAgIHJldHVybiAobWNfaGVhZGVy
LT5yZXYgPiByZXYpID8gTkVXX1VDT0RFIDogT0xEX1VDT0RFOw0KPj4NCj4+IEJvdGggaGVyZSBh
bmQgLi4uDQo+Pg0KPj4+ICsgICAgZXh0X2hlYWRlciA9IChjb25zdCB2b2lkICopKG1jX2hlYWRl
ciArIDEpICsgZGF0YV9zaXplOw0KPj4+ICsgICAgZXh0X3NpZyA9IChjb25zdCB2b2lkICopKGV4
dF9oZWFkZXIgKyAxKTsNCj4+PiArDQo+Pj4gKyAgICAvKg0KPj4+ICsgICAgICogTWFrZSBzdXJl
IHRoZXJlIGlzIGVub3VnaCBzcGFjZSB0byBob2xkIGFuIGV4dGVuZGVkIGhlYWRlciBhbmQgZW5v
dWdoDQo+Pj4gKyAgICAgKiBhcnJheSBlbGVtZW50cy4NCj4+PiArICAgICAqLw0KPj4+ICsgICAg
aWYgKCAoZW5kIDwgKGNvbnN0IHZvaWQgKilleHRfc2lnKSB8fA0KPj4+ICsgICAgICAgICAoZW5k
IDwgKGNvbnN0IHZvaWQgKikoZXh0X3NpZyArIGV4dF9oZWFkZXItPmNvdW50KSkgKQ0KPj4+ICsg
ICAgICAgIHJldHVybiBNSVNfVUNPREU7DQo+Pj4gKw0KPj4+ICsgICAgZm9yICggaSA9IDA7IGkg
PCBleHRfaGVhZGVyLT5jb3VudDsgaSsrICkNCj4+PiArICAgICAgICBpZiAoIHNpZ21hdGNoKHNp
ZywgZXh0X3NpZ1tpXS5zaWcsIHBmLCBleHRfc2lnW2ldLnBmKSApDQo+Pj4gKyAgICAgICAgICAg
IHJldHVybiAobWNfaGVhZGVyLT5yZXYgPiByZXYpID8gTkVXX1VDT0RFIDogT0xEX1VDT0RFOw0K
Pj4NCj4+IC4uLiBoZXJlIHRoZXJlJ3MgYWdhaW4gYW4gYXNzdW1wdGlvbiB0aGF0IHRoZXJlJ3Mg
c3RyaWN0IG9yZGVyaW5nDQo+PiBiZXR3ZWVuIGJsb2JzLCBidXQgYXMgbWVudGlvbmVkIGluIHJl
cGx5IHRvIGEgbGF0ZXIgcGF0Y2ggb2YgYW4NCj4+IGVhcmxpZXIgdmVyc2lvbiB0aGlzIGlzbid0
IHRoZSBjYXNlLiBUaGVyZWZvcmUgdGhlIGZ1bmN0aW9uIGNhbid0DQo+PiBiZSB1c2VkIHRvIGNv
bXBhcmUgdHdvIGFyYml0cmFyeSBibG9icywgaXQgbWF5IG9ubHkgYmUgdXNlZCB0bw0KPj4gY29t
cGFyZSBhIGJsb2Igd2l0aCB3aGF0IGlzIGFscmVhZHkgbG9hZGVkIGludG8gYSBDUFUuIEkgdGhp
bmsgaXQNCj4+IGlzIHF1aXRlIGltcG9ydGFudCB0byBtZW50aW9uIHRoaXMgcmVzdHJpY3Rpb24g
aW4gYSBjb21tZW50IGFoZWFkDQo+PiBvZiB0aGUgZnVuY3Rpb24uDQo+Pg0KPj4gVGhlIGNvZGUg
aXRzZWxmIGxvb2tzIGZpbmUgdG8gbWUsIGFuZCBhIGNvbW1lbnQgY291bGQgcGVyaGFwcyBiZQ0K
Pj4gYWRkZWQgd2hpbGUgY29tbWl0dGluZzsgd2l0aCBzdWNoIGEgY29tbWVudA0KPiANCj4gQWdy
ZWUuIEJlY2F1c2UgdGhlcmUgd2lsbCBiZSBhIHZlcnNpb24gOSwgSSBjYW4gYWRkIGEgY29tbWVu
dC4NCg0KSGF2aW5nIHNlZW4gdGhlIHVzZXMgaW4gbGF0ZXIgcGF0Y2hlcywgSSB0aGluayBhIGNv
bW1lbnQgaXMgbm90IHRoZQ0Kd2F5IHRvIGdvLiBJbnN0ZWFkIEkgdGhpbmsgeW91IHdhbnQgdG8g
Zmlyc3QgbWF0Y2ggX2JvdGhfDQpzaWduYXR1cmVzIGFnYWluc3QgdGhlIGxvY2FsIENQVSAodW5s
ZXNzIGUuZy4gZm9yIGVpdGhlciBzaWRlIHRoaXMNCmlzIGxvZ2ljYWxseSBndWFyYW50ZWVkKSwg
YW5kIHJldHVybiBESVNfVUNPREUgdXBvbiBtaXNtYXRjaC4gT25seQ0KdGhlbiBzaG91bGQgeW91
IGFjdHVhbGx5IGNvbXBhcmUgdGhlIHR3byBzaWduYXR1cmVzLiBXaGlsZSBmcm9tIGENCnB1cmUs
IGFic3RyYWN0IHBhdGNoIG9yZGVyaW5nIHBlcnNwZWN0aXZlIHRoaXMgaXNuJ3QgY29ycmVjdCwg
d2UNCm9ubHkgY2FyZSBhYm91dCBwYXRjaGVzIGFwcGxpY2FibGUgdG8gdGhlIGxvY2FsIENQVSBh
bnl3YXksIGFuZCBmb3INCnRoYXQgY2FzZSB0aGUgZXh0cmEgcmVzdHJpY3Rpb24gaXMgZmluZS4g
VGhpcyB3YXkgeW91J2xsIGJlIGFibGUgdG8NCmF2b2lkIHRha2luZyBleHRyYSBwcmVjYXV0aW9u
cyBpbiB2ZW5kb3ItaW5kZXBlbmRlbnQgY29kZSBqdXN0IHRvDQphY2NvbW1vZGF0ZSBhbiBJbnRl
bCBzcGVjaWZpYyByZXF1aXJlbWVudC4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
