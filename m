Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC2D5FA21
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 16:32:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj2jq-0001fA-Ty; Thu, 04 Jul 2019 14:29:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hj2jp-0001f2-48
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:29:29 +0000
X-Inumbo-ID: 1f23978e-9e68-11e9-baaa-9f9d30736b8e
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f23978e-9e68-11e9-baaa-9f9d30736b8e;
 Thu, 04 Jul 2019 14:29:25 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 14:29:03 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 14:25:04 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 14:25:04 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3267.namprd18.prod.outlook.com (10.255.138.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Thu, 4 Jul 2019 14:25:02 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 14:25:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v9 05/23] x86emul: support AVX512F gather
 insns
Thread-Index: AQHVL/7DlmNHyySWV0mdXoNuP5HddKa6hJxbgAAByDWAAAIiAA==
Date: Thu, 4 Jul 2019 14:25:01 +0000
Message-ID: <5879b09b-c664-839d-0452-315627efa039@suse.com>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
 <95252da8-777b-9527-6f5b-1e1a5994f845@suse.com>
 <6f03fb10-6339-610f-0620-86675d76a4ee@citrix.com>
 <e28b72a5-8c3e-104d-027e-225d04cfc12f@citrix.com>
In-Reply-To: <e28b72a5-8c3e-104d-027e-225d04cfc12f@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0176.eurprd07.prod.outlook.com
 (2603:10a6:6:43::30) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78551c6a-dad1-443c-6c0a-08d7008b6668
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3267; 
x-ms-traffictypediagnostic: BY5PR18MB3267:
x-microsoft-antispam-prvs: <BY5PR18MB32679A26291BFB8676EDC4B5B3FA0@BY5PR18MB3267.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(189003)(199004)(52314003)(31696002)(446003)(6512007)(6116002)(54906003)(3846002)(2906002)(102836004)(86362001)(256004)(53546011)(81166006)(386003)(11346002)(80792005)(26005)(71200400001)(2501003)(110136005)(6506007)(6436002)(76176011)(71190400001)(186003)(4326008)(81156014)(229853002)(8936002)(316002)(53936002)(66556008)(64756008)(305945005)(8676002)(72206003)(73956011)(52116002)(36756003)(478600001)(6246003)(7736002)(14454004)(25786009)(66946007)(68736007)(99286004)(476003)(486006)(6486002)(31686004)(66476007)(66066001)(5660300002)(2616005)(66446008)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3267;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dryUQida6Nu88UkdiF79NBFjIFyZBWPXM0qBqoRoo3pYXu7BNJI02VP2vkBMeX8bETxqbPKhSzz95h1bN8A+AJxQHUkxRx2/1+GUNT9GqXRd+67/LXrruydeTv2zdyUDl7bnHVjTJ0FvVtYb7YCuYXKl3qBYSmInBMcY8fSL267QG4Tc0n8KHXt4iKnq9kV+KCdAvs9yMa4A8kO3kXok2+vdVG221ulvK3eCKivSvlnhlkbxhOpt6yzqBp1nySlGmWCLCFW1VYS+qH12zqG/5jtKmArPJDxiyz1SpaGPyjVr9iI/ZvBXk2JqREr9AFq2t/uTq1nw68zdfpVaRHBXh16p/Q7K4mq5IVS3t7lGATI+LQI4xUqrjYYB5mPSLfQo3bVtWb0dRjQc3auQ1T51hOgnwrHK3lfz1Iayqh7mvIs=
Content-ID: <A5DC87D329B64B4181C2D382E469A832@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 78551c6a-dad1-443c-6c0a-08d7008b6668
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 14:25:01.8216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3267
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v9 05/23] x86emul: support AVX512F gather
 insns
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
Cc: Wei Liu <wl@xen.org>, RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDcuMjAxOSAxNjoxNiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDQvMDcvMjAx
OSAxNToxMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDAxLzA3LzIwMTkgMTI6MTgsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZf
ZW11bGF0ZS5jDQo+Pj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRl
LmMNCj4+PiBAQCAtOTEwMCw2ICs5MTAwLDEzMyBAQCB4ODZfZW11bGF0ZSgNCj4+PiAgICAgICAg
ICAgIHB1dF9zdHViKHN0dWIpOw0KPj4+ICAgIA0KPj4+ICAgICAgICAgICAgaWYgKCByYyAhPSBY
ODZFTVVMX09LQVkgKQ0KPj4+ICsgICAgICAgICAgICBnb3RvIGRvbmU7DQo+Pj4gKw0KPj4+ICsg
ICAgICAgIHN0YXRlLT5zaW1kX3NpemUgPSBzaW1kX25vbmU7DQo+Pj4gKyAgICAgICAgYnJlYWs7
DQo+Pj4gKyAgICB9DQo+Pj4gKw0KPj4+ICsgICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4
MGYzOCwgMHg5MCk6IC8qIHZwZ2F0aGVyZHtkLHF9IG1lbSxbeHl6XW1te2t9ICovDQo+Pj4gKyAg
ICBjYXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZjM4LCAweDkxKTogLyogdnBnYXRoZXJxe2Qs
cX0gbWVtLFt4eXpdbW17a30gKi8NCj4+PiArICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82Nigw
eDBmMzgsIDB4OTIpOiAvKiB2Z2F0aGVyZHB7cyxkfSBtZW0sW3h5el1tbXtrfSAqLw0KPj4+ICsg
ICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYzOCwgMHg5Myk6IC8qIHZnYXRoZXJxcHtz
LGR9IG1lbSxbeHl6XW1te2t9ICovDQo+Pj4gKyAgICB7DQo+Pj4gKyAgICAgICAgdHlwZW9mKGV2
ZXgpICpwZXZleDsNCj4+PiArICAgICAgICB1bmlvbiB7DQo+Pj4gKyAgICAgICAgICAgIGludDMy
X3QgZHdbMTZdOw0KPj4+ICsgICAgICAgICAgICBpbnQ2NF90IHF3WzhdOw0KPj4+ICsgICAgICAg
IH0gaW5kZXg7DQo+Pj4gKyAgICAgICAgYm9vbCBkb25lID0gZmFsc2U7DQo+Pj4gKw0KPj4+ICsg
ICAgICAgIEFTU0VSVChlYS50eXBlID09IE9QX01FTSk7DQo+Pj4gKyAgICAgICAgZ2VuZXJhdGVf
ZXhjZXB0aW9uX2lmKCghZXZleC5vcG1zayB8fCBldmV4LmJycyB8fCBldmV4LnogfHwNCj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV2ZXgucmVnICE9IDB4ZiB8fA0KPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbW9kcm1fcmVnID09IHN0YXRlLT5zaWJfaW5k
ZXgpLA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFWENfVUQpOw0KPj4+ICsg
ICAgICAgIGF2eDUxMl92bGVuX2NoZWNrKGZhbHNlKTsNCj4+PiArICAgICAgICBob3N0X2FuZF92
Y3B1X211c3RfaGF2ZShhdng1MTJmKTsNCj4+PiArICAgICAgICBnZXRfZnB1KFg4NkVNVUxfRlBV
X3ptbSk7DQo+Pj4gKw0KPj4+ICsgICAgICAgIC8qIFJlYWQgZGVzdGluYXRpb24gYW5kIGluZGV4
IHJlZ2lzdGVycy4gKi8NCj4+PiArICAgICAgICBvcGMgPSBpbml0X2V2ZXgoc3R1Yik7DQo+Pj4g
KyAgICAgICAgcGV2ZXggPSBjb3B5X0VWRVgob3BjLCBldmV4KTsNCj4+PiArICAgICAgICBwZXZl
eC0+b3BjeCA9IHZleF8wZjsNCj4+PiArICAgICAgICBvcGNbMF0gPSAweDdmOyAvKiB2bW92ZHFh
ezMyLDY0fSAqLw0KPj4+ICsgICAgICAgIC8qDQo+Pj4gKyAgICAgICAgICogVGhlIHJlZ2lzdGVy
IHdyaXRlYmFjayBiZWxvdyBoYXMgdG8gcmV0YWluIG1hc2tlZC1vZmYgZWxlbWVudHMsIGJ1dA0K
Pj4+ICsgICAgICAgICAqIG5lZWRzIHRvIGNsZWFyIHVwcGVyIHBvcnRpb25zIGluIHRoZSBpbmRl
eC13aWRlci10aGFuLWRhdGEgY2FzZXMuDQo+Pj4gKyAgICAgICAgICogVGhlcmVmb3JlIHJlYWQg
KGFuZCB3cml0ZSBiZWxvdykgdGhlIGZ1bGwgcmVnaXN0ZXIuIFRoZSBhbHRlcm5hdGl2ZQ0KPj4+
ICsgICAgICAgICAqIHdvdWxkIGhhdmUgYmVlbiB0byBmaWRkbGUgd2l0aCB0aGUgbWFzayByZWdp
c3RlciB1c2VkLg0KPj4+ICsgICAgICAgICAqLw0KPj4+ICsgICAgICAgIHBldmV4LT5vcG1zayA9
IDA7DQo+Pj4gKyAgICAgICAgLyogVXNlICglcmF4KSBhcyBkZXN0aW5hdGlvbiBhbmQgbW9kcm1f
cmVnIGFzIHNvdXJjZS4gKi8NCj4+PiArICAgICAgICBwZXZleC0+YiA9IDE7DQo+Pj4gKyAgICAg
ICAgb3BjWzFdID0gKG1vZHJtX3JlZyAmIDcpIDw8IDM7DQo+Pj4gKyAgICAgICAgcGV2ZXgtPlJY
ID0gMTsNCj4+PiArICAgICAgICBvcGNbMl0gPSAweGMzOw0KPj4+ICsNCj4+PiArICAgICAgICBp
bnZva2Vfc3R1YigiIiwgIiIsICI9bSIgKCptbXZhbHApIDogImEiIChtbXZhbHApKTsNCj4+PiAr
DQo+Pj4gKyAgICAgICAgcGV2ZXgtPnBmeCA9IHZleF9mMzsgLyogdm1vdmRxdXszMiw2NH0gKi8N
Cj4+PiArICAgICAgICBwZXZleC0+dyA9IGIgJiAxOw0KPj4+ICsgICAgICAgIC8qIFN3aXRjaCB0
byBzaWJfaW5kZXggYXMgc291cmNlLiAqLw0KPj4+ICsgICAgICAgIHBldmV4LT5yID0gIW1vZGVf
NjRiaXQoKSB8fCAhKHN0YXRlLT5zaWJfaW5kZXggJiAweDA4KTsNCj4+PiArICAgICAgICBwZXZl
eC0+UiA9ICFtb2RlXzY0Yml0KCkgfHwgIShzdGF0ZS0+c2liX2luZGV4ICYgMHgxMCk7DQo+Pj4g
KyAgICAgICAgb3BjWzFdID0gKHN0YXRlLT5zaWJfaW5kZXggJiA3KSA8PCAzOw0KPj4+ICsNCj4+
PiArICAgICAgICBpbnZva2Vfc3R1YigiIiwgIiIsICI9bSIgKGluZGV4KSA6ICJhIiAoJmluZGV4
KSk7DQo+Pj4gKyAgICAgICAgcHV0X3N0dWIoc3R1Yik7DQo+Pj4gKw0KPj4+ICsgICAgICAgIC8q
IENsZWFyIHVudG91Y2hlZCBwYXJ0cyBvZiB0aGUgZGVzdGluYXRpb24gYW5kIG1hc2sgdmFsdWVz
LiAqLw0KPj4+ICsgICAgICAgIG4gPSAxIDw8ICgyICsgZXZleC5sciAtICgoYiAmIDEpIHwgZXZl
eC53KSk7DQo+Pj4gKyAgICAgICAgb3BfYnl0ZXMgPSA0IDw8IGV2ZXgudzsNCj4+PiArICAgICAg
ICBtZW1zZXQoKHZvaWQgKiltbXZhbHAgKyBuICogb3BfYnl0ZXMsIDAsIDY0IC0gbiAqIG9wX2J5
dGVzKTsNCj4+PiArICAgICAgICBvcF9tYXNrICY9ICgxIDw8IG4pIC0gMTsNCj4+PiArDQo+Pj4g
KyAgICAgICAgZm9yICggaSA9IDA7IG9wX21hc2s7ICsraSApDQo+Pj4gKyAgICAgICAgew0KPj4+
ICsgICAgICAgICAgICBzaWduZWQgbG9uZyBpZHggPSBiICYgMSA/IGluZGV4LnF3W2ldIDogaW5k
ZXguZHdbaV07DQo+PiBObyBzaWduZWQuwqAgSG93ZXZlciwgc3VyZWx5IHRoaXMgbmVlZHMgdG8g
YmUgaW50NjRfdCBhbnl3YXksIHRvIGZ1bmN0aW9uDQo+PiBjb3JyZWN0bHkgaW4gYSAzMmJpdCBi
dWlsZCBvZiB0aGUgdGVzdCBoYXJuZXNzPw0KPj4NCj4+IFRoZSBTRE0gc2F5cyBWUEdBVEhFUlFE
IGlzIGVuY29kYWJsZSBpbiAzMmJpdCB3aXRoIHF1YWR3b3JkIGluZGljZXMuDQo+Pg0KPj4gfkFu
ZHJldw0KPj4NCj4+PiArDQo+Pj4gKyAgICAgICAgICAgIGlmICggIShvcF9tYXNrICYgKDEgPDwg
aSkpICkNCj4+PiArICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4+ICsNCj4+PiArICAgICAg
ICAgICAgcmMgPSBvcHMtPnJlYWQoZWEubWVtLnNlZywNCj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdHJ1bmNhdGVfZWEoZWEubWVtLm9mZiArIChpZHggPDwgc3RhdGUtPnNpYl9zY2Fs
ZSkpLA0KPiANCj4gQWN0dWFsbHksIHdoYXQgU0RNIHNheXMgaXM6DQo+IA0KPiAiVGhlIHNjYWxl
ZCBpbmRleCBtYXkgcmVxdWlyZSBtb3JlIGJpdHMgdG8gcmVwcmVzZW50IHRoYW4gdGhlIGFkZHJl
c3MNCj4gYml0cyB1c2VkIGJ5IHRoZSBwcm9jZXNzb3IgKGUuZy4sIGluIDMyLWJpdCBtb2RlLCBp
ZiB0aGUgc2NhbGUgaXMNCj4gZ3JlYXRlciB0aGFuIG9uZSkuIEluIHRoaXMgY2FzZSwgdGhlIG1v
c3Qgc2lnbmlmaWNhbnQgYml0cyBiZXlvbmQgdGhlDQo+IG51bWJlciBvZiBhZGRyZXNzIGJpdHMg
YXJlIGlnbm9yZWQuIg0KPiANCj4gVGhhdCByZWFkcyBhcyBpZiBpdCBpcyBpdCBtZWFucyAiZWEu
bWVtLm9mZiArICh1MzIpKGlkeCA8PA0KPiBzdGF0ZS0+c2liX3NjYWxlKSIuDQoNCldoeSAicmVh
ZHMgYXMgaWYiPyBXaGF0IGVsc2UgY291bGQgYSAzMi1iaXQgYWRkcmVzcyBjb21wdXRhdGlvbiBs
b29rDQpsaWtlPyAoSW4gZXNzZW5jZSB0cnVuY2F0ZV9lYSgpIHdpbGwgdHJ1bmNhdGUgdG8gMzIg
Yml0cyBhbnl3YXkgd2hlbg0KMzItYml0IGFkZHJlc3NpbmcgaXMgaW4gdXNlLCBzbyB0aGUgaW5u
ZXIgdHJ1bmNhdGlvbiBpcyBzaW1wbHkNCnJlZHVuZGFudC4pDQoNCkphbg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
