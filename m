Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 458BA8187B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 13:54:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hubWz-0004qa-7D; Mon, 05 Aug 2019 11:52:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hubWx-0004qV-M4
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 11:51:59 +0000
X-Inumbo-ID: 695b8d20-b777-11e9-9a6b-07e4994bb56a
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 695b8d20-b777-11e9-9a6b-07e4994bb56a;
 Mon, 05 Aug 2019 11:51:55 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 11:51:39 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 11:50:48 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 11:50:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGOM/tr6z43r/UQ9C1f1mkxwnzohVkVSid+iaCp0FZdaY69l6qOZFbPTk0F4m0+P2BFTZHs2mJXNgn0SfNErFo5SZneqZg0iFZF6OFJjUbRgrE7xfwEDxSjyV/lZf19G5590nOxSFMQuttzdeyx1qPqHy+gXMsroeOcwviColplxMp0E8JSHT9P+KhVcwFQd2agXfIrHMqYONlmYOtR2R4U15IQFDja0j0B/kHU5CpQkLYznU4JcuDjqeUsqukpoEZIdIKkyAaG3sWMmkkkjC6t1GDNX3MjqmHKoWWQuaXqsOehsZnKvMzOGnIJGhBGlbS5MWvlIWlsoiWt/NU4Jig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prQ9ocIcNgNNln1CJt5plp+hRe0LYcL60e1gJQ4UmnI=;
 b=ZmiKG0uRcU6ysjT2nopQYYiBvxT2oOZHE5if5/iIyrC//iAfX7OIP/O+hYyBXmZHryUL0YArWnCB9IQCmt9z1E0hQ74EXftrULhQXiFeuil+eV4gUH6k6loaLTXEOQTbvDOnHvBj0pztwthzzWN/Oe52gfj1wyoDlXt6KNrcbF0L3o6lqrhKshiBwfBT98FIsobyY8vkZaFpcHAl83nmzxcN4Bw3wg9foftomuSoN4UZ+kGzPoZvF5pFyzdz6pT2iH6M3zxeZ9DKSimmgzxrDItSopPhNBXY4OgXhxAmy98HFdj+24ES83ed6a6PT4RFgWPi49NlKovTpganiZVGmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2429.namprd18.prod.outlook.com (20.179.84.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Mon, 5 Aug 2019 11:50:46 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 11:50:46 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [PATCH v8 03/16] microcode/intel: extend microcode_update_match()
Thread-Index: AQHVSFKZoSixyJPoX02LB9PmM1B4FKbn2+SAgAQ4EkaAADuFAIAAJui9gAABAAA=
Date: Mon, 5 Aug 2019 11:50:46 +0000
Message-ID: <d797e049-1b43-709d-42fe-f8419131532f@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-4-git-send-email-chao.gao@intel.com>
 <86eff704-cf77-ede0-7220-7cab59b65982@suse.com>
 <20190805055809.GA19492@gao-cwp>
 <a79836ad-5a20-8a66-3dfd-c35adae1ebd3@suse.com>
 <20190805115102.GA1685@gao-cwp>
In-Reply-To: <20190805115102.GA1685@gao-cwp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0701CA0011.eurprd07.prod.outlook.com
 (2603:10a6:200:42::21) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6ff1b4e-1977-4321-deed-08d7199b2717
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2429; 
x-ms-traffictypediagnostic: MN2PR18MB2429:
x-microsoft-antispam-prvs: <MN2PR18MB2429D28A24F41D9A1C76F00AB3DA0@MN2PR18MB2429.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(52314003)(199004)(189003)(478600001)(186003)(76176011)(52116002)(36756003)(81166006)(102836004)(99286004)(26005)(71190400001)(71200400001)(53936002)(81156014)(14454004)(386003)(6506007)(53546011)(7736002)(5660300002)(6246003)(3846002)(31696002)(86362001)(6512007)(64756008)(6486002)(66476007)(66556008)(8936002)(6436002)(6116002)(66446008)(66946007)(476003)(316002)(229853002)(80792005)(31686004)(54906003)(8676002)(6916009)(446003)(11346002)(2616005)(14444005)(486006)(256004)(66066001)(305945005)(4326008)(2906002)(25786009)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2429;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zYQ+2PrnUZawpjTU5yKdIL+gEAsCSXjbUfWS5ZTQevP8CyaTJlG8i24giBp76F13CAO0HVCf+vjJ+c44NQYMhPU+PbnJtsLa3bitc/RkV+d276biMjoH91MOUJ5VMQVaT7eR0AdRrDIG2r5cZ5d7lJvsPoj+rPrudgCYxJkKjY7QHbahFCtrRgbpwXYpSDdWaq7NRNTmL7H3H6sPiLYtgyap73JD3gpxu90QAUMvGCBgUHLyYdo9uk4be9CFknAJG7EuEfMP9o4Sc9Al+zZVW1r7g3R31cdpKzNN9lEiT021ZLs3RzL0pQYZqhkIvxFNZBa1n6RYXs7epuN5i7oKx6DCWYMwn1IvYk3WeGg2Ps7rro7N0HUaIi5AcyUQlrQWv68L7GTcG9BpQeUf2tg53JsH1LyeY88nGA+EO4MxBWM=
Content-ID: <95FC98DBC3B08640AE4392C92298113D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ff1b4e-1977-4321-deed-08d7199b2717
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 11:50:46.4174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2429
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

T24gMDUuMDguMjAxOSAxMzo1MSwgQ2hhbyBHYW8gd3JvdGU6DQo+IE9uIE1vbiwgQXVnIDA1LCAy
MDE5IGF0IDA5OjI3OjU4QU0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDUuMDgu
MjAxOSAwNzo1OCwgQ2hhbyBHYW8gd3JvdGU6DQo+Pj4gT24gRnJpLCBBdWcgMDIsIDIwMTkgYXQg
MDE6Mjk6MTRQTSArMDAwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDAxLjA4LjIwMTkg
MTI6MjIsIENoYW8gR2FvIHdyb3RlOg0KPj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29k
ZV9pbnRlbC5jDQo+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMNCj4+
Pj4+IEBAIC0xMzQsMTQgKzEzNCwzNSBAQCBzdGF0aWMgaW50IGNvbGxlY3RfY3B1X2luZm8odW5z
aWduZWQgaW50IGNwdV9udW0sIHN0cnVjdCBjcHVfc2lnbmF0dXJlICpjc2lnKQ0KPj4+Pj4gICAg
ICAgICByZXR1cm4gMDsNCj4+Pj4+ICAgICB9DQo+Pj4+PiAgICAgDQo+Pj4+PiAtc3RhdGljIGlu
bGluZSBpbnQgbWljcm9jb2RlX3VwZGF0ZV9tYXRjaCgNCj4+Pj4+IC0gICAgdW5zaWduZWQgaW50
IGNwdV9udW0sIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsICptY19oZWFkZXIs
DQo+Pj4+PiAtICAgIGludCBzaWcsIGludCBwZikNCj4+Pj4+ICtzdGF0aWMgZW51bSBtaWNyb2Nv
ZGVfbWF0Y2hfcmVzdWx0IG1pY3JvY29kZV91cGRhdGVfbWF0Y2goDQo+Pj4+PiArICAgIGNvbnN0
IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsICptY19oZWFkZXIsIHVuc2lnbmVkIGludCBz
aWcsDQo+Pj4+PiArICAgIHVuc2lnbmVkIGludCBwZiwgdW5zaWduZWQgaW50IHJldikNCj4+Pj4+
ICAgICB7DQo+Pj4+PiAtICAgIHN0cnVjdCB1Y29kZV9jcHVfaW5mbyAqdWNpID0gJnBlcl9jcHUo
dWNvZGVfY3B1X2luZm8sIGNwdV9udW0pOw0KPj4+Pj4gLQ0KPj4+Pj4gLSAgICByZXR1cm4gKHNp
Z21hdGNoKHNpZywgdWNpLT5jcHVfc2lnLnNpZywgcGYsIHVjaS0+Y3B1X3NpZy5wZikgJiYNCj4+
Pj4+IC0gICAgICAgICAgICAobWNfaGVhZGVyLT5yZXYgPiB1Y2ktPmNwdV9zaWcucmV2KSk7DQo+
Pj4+PiArICAgIGNvbnN0IHN0cnVjdCBleHRlbmRlZF9zaWd0YWJsZSAqZXh0X2hlYWRlcjsNCj4+
Pj4+ICsgICAgY29uc3Qgc3RydWN0IGV4dGVuZGVkX3NpZ25hdHVyZSAqZXh0X3NpZzsNCj4+Pj4+
ICsgICAgdW5zaWduZWQgbG9uZyBkYXRhX3NpemUgPSBnZXRfZGF0YXNpemUobWNfaGVhZGVyKTsN
Cj4+Pj4+ICsgICAgdW5zaWduZWQgaW50IGk7DQo+Pj4+PiArICAgIGNvbnN0IHZvaWQgKmVuZCA9
IChjb25zdCB2b2lkICopbWNfaGVhZGVyICsgZ2V0X3RvdGFsc2l6ZShtY19oZWFkZXIpOw0KPj4+
Pj4gKw0KPj4+Pj4gKyAgICBpZiAoIHNpZ21hdGNoKHNpZywgbWNfaGVhZGVyLT5zaWcsIHBmLCBt
Y19oZWFkZXItPnBmKSApDQo+Pj4+PiArICAgICAgICByZXR1cm4gKG1jX2hlYWRlci0+cmV2ID4g
cmV2KSA/IE5FV19VQ09ERSA6IE9MRF9VQ09ERTsNCj4+Pj4NCj4+Pj4gQm90aCBoZXJlIGFuZCAu
Li4NCj4+Pj4NCj4+Pj4+ICsgICAgZXh0X2hlYWRlciA9IChjb25zdCB2b2lkICopKG1jX2hlYWRl
ciArIDEpICsgZGF0YV9zaXplOw0KPj4+Pj4gKyAgICBleHRfc2lnID0gKGNvbnN0IHZvaWQgKiko
ZXh0X2hlYWRlciArIDEpOw0KPj4+Pj4gKw0KPj4+Pj4gKyAgICAvKg0KPj4+Pj4gKyAgICAgKiBN
YWtlIHN1cmUgdGhlcmUgaXMgZW5vdWdoIHNwYWNlIHRvIGhvbGQgYW4gZXh0ZW5kZWQgaGVhZGVy
IGFuZCBlbm91Z2gNCj4+Pj4+ICsgICAgICogYXJyYXkgZWxlbWVudHMuDQo+Pj4+PiArICAgICAq
Lw0KPj4+Pj4gKyAgICBpZiAoIChlbmQgPCAoY29uc3Qgdm9pZCAqKWV4dF9zaWcpIHx8DQo+Pj4+
PiArICAgICAgICAgKGVuZCA8IChjb25zdCB2b2lkICopKGV4dF9zaWcgKyBleHRfaGVhZGVyLT5j
b3VudCkpICkNCj4+Pj4+ICsgICAgICAgIHJldHVybiBNSVNfVUNPREU7DQo+Pj4+PiArDQo+Pj4+
PiArICAgIGZvciAoIGkgPSAwOyBpIDwgZXh0X2hlYWRlci0+Y291bnQ7IGkrKyApDQo+Pj4+PiAr
ICAgICAgICBpZiAoIHNpZ21hdGNoKHNpZywgZXh0X3NpZ1tpXS5zaWcsIHBmLCBleHRfc2lnW2ld
LnBmKSApDQo+Pj4+PiArICAgICAgICAgICAgcmV0dXJuIChtY19oZWFkZXItPnJldiA+IHJldikg
PyBORVdfVUNPREUgOiBPTERfVUNPREU7DQo+Pj4+DQo+Pj4+IC4uLiBoZXJlIHRoZXJlJ3MgYWdh
aW4gYW4gYXNzdW1wdGlvbiB0aGF0IHRoZXJlJ3Mgc3RyaWN0IG9yZGVyaW5nDQo+Pj4+IGJldHdl
ZW4gYmxvYnMsIGJ1dCBhcyBtZW50aW9uZWQgaW4gcmVwbHkgdG8gYSBsYXRlciBwYXRjaCBvZiBh
bg0KPj4+PiBlYXJsaWVyIHZlcnNpb24gdGhpcyBpc24ndCB0aGUgY2FzZS4gVGhlcmVmb3JlIHRo
ZSBmdW5jdGlvbiBjYW4ndA0KPj4+PiBiZSB1c2VkIHRvIGNvbXBhcmUgdHdvIGFyYml0cmFyeSBi
bG9icywgaXQgbWF5IG9ubHkgYmUgdXNlZCB0bw0KPj4+PiBjb21wYXJlIGEgYmxvYiB3aXRoIHdo
YXQgaXMgYWxyZWFkeSBsb2FkZWQgaW50byBhIENQVS4gSSB0aGluayBpdA0KPj4+PiBpcyBxdWl0
ZSBpbXBvcnRhbnQgdG8gbWVudGlvbiB0aGlzIHJlc3RyaWN0aW9uIGluIGEgY29tbWVudCBhaGVh
ZA0KPj4+PiBvZiB0aGUgZnVuY3Rpb24uDQo+Pj4+DQo+Pj4+IFRoZSBjb2RlIGl0c2VsZiBsb29r
cyBmaW5lIHRvIG1lLCBhbmQgYSBjb21tZW50IGNvdWxkIHBlcmhhcHMgYmUNCj4+Pj4gYWRkZWQg
d2hpbGUgY29tbWl0dGluZzsgd2l0aCBzdWNoIGEgY29tbWVudA0KPj4+DQo+Pj4gQWdyZWUuIEJl
Y2F1c2UgdGhlcmUgd2lsbCBiZSBhIHZlcnNpb24gOSwgSSBjYW4gYWRkIGEgY29tbWVudC4NCj4+
DQo+PiBIYXZpbmcgc2VlbiB0aGUgdXNlcyBpbiBsYXRlciBwYXRjaGVzLCBJIHRoaW5rIGEgY29t
bWVudCBpcyBub3QgdGhlDQo+PiB3YXkgdG8gZ28uIEluc3RlYWQgSSB0aGluayB5b3Ugd2FudCB0
byBmaXJzdCBtYXRjaCBfYm90aF8NCj4+IHNpZ25hdHVyZXMgYWdhaW5zdCB0aGUgbG9jYWwgQ1BV
ICh1bmxlc3MgZS5nLiBmb3IgZWl0aGVyIHNpZGUgdGhpcw0KPj4gaXMgbG9naWNhbGx5IGd1YXJh
bnRlZWQpLA0KPiANCj4gWWVzLiBJdCBpcyBndWFyYW50ZWVkIGF0IHRoZSBmaXJzdCBwbGFjZTog
d2UgaWdub3JlIGFueSBwYXRjaCB0aGF0DQo+IGRvZXNuJ3QgbWF0Y2ggd2l0aCB0aGUgQ1BVIHNp
Z25hdHVyZSB3aGVuIHBhcnNpbmcgdGhlIHVjb2RlIGJsb2IuDQoNCldlbGwsIGlmIHRoYXQncyB0
aGUgY2FzZSwgdGhlbiBwZXJoYXBzIGEgY29tbWVudCBpcyByZWFsbHkgYWxsDQp0aGF0J3MgbmVl
ZGVkLCBpLmUuIC4uLg0KDQo+PiBhbmQgcmV0dXJuIERJU19VQ09ERSB1cG9uIG1pc21hdGNoLiBP
bmx5DQo+PiB0aGVuIHNob3VsZCB5b3UgYWN0dWFsbHkgY29tcGFyZSB0aGUgdHdvIHNpZ25hdHVy
ZXMuIFdoaWxlIGZyb20gYQ0KPj4gcHVyZSwgYWJzdHJhY3QgcGF0Y2ggb3JkZXJpbmcgcGVyc3Bl
Y3RpdmUgdGhpcyBpc24ndCBjb3JyZWN0LCB3ZQ0KPj4gb25seSBjYXJlIGFib3V0IHBhdGNoZXMg
YXBwbGljYWJsZSB0byB0aGUgbG9jYWwgQ1BVIGFueXdheSwgYW5kIGZvcg0KPj4gdGhhdCBjYXNl
IHRoZSBleHRyYSByZXN0cmljdGlvbiBpcyBmaW5lLiBUaGlzIHdheSB5b3UnbGwgYmUgYWJsZSB0
bw0KPj4gYXZvaWQgdGFraW5nIGV4dHJhIHByZWNhdXRpb25zIGluIHZlbmRvci1pbmRlcGVuZGVu
dCBjb2RlIGp1c3QgdG8NCj4+IGFjY29tbW9kYXRlIGFuIEludGVsIHNwZWNpZmljIHJlcXVpcmVt
ZW50Lg0KPiANCj4gWWVzLiBJIGFncmVlIGFuZCBpdCBzZWVtcyB0aGF0IG5vIGZ1cnRoZXIgY2hh
bmdlIGlzIG5lZWRlZCBleGNlcHQNCj4gdGhlIGltcGxlbWVudGF0aW9uIG9mIC0+Y29tcGFyZV9w
YXRjaC4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBhbSB3cm9uZy4NCg0KLi4uIG1heWJlIG5vdCBl
dmVuIHRoZSBjaGFuZ2UgaGVyZS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
