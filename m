Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DE022314A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 04:49:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwGQT-00025T-3R; Fri, 17 Jul 2020 02:48:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hPx8=A4=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jwGQQ-00025O-QP
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 02:48:39 +0000
X-Inumbo-ID: 017d7174-c7d8-11ea-bb8b-bc764e2007e4
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 017d7174-c7d8-11ea-bb8b-bc764e2007e4;
 Fri, 17 Jul 2020 02:48:34 +0000 (UTC)
IronPort-SDR: +ku72ieCpUj6BiG0cCLANam8WHw2+8+G7ITrPt3PdTm1AHj4EL5QKFQXC5MjHvmFoPhLA9T9rM
 xsxEYn7yGTNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="234379831"
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; d="scan'208";a="234379831"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 19:48:33 -0700
IronPort-SDR: 27u9ZPBRvB8dwNTpknMqOKTcEPpZ6WlIgTTl8/93s6P5zb6BWpU1ukbq19wQ5gt/YYOl6t4Rry
 aaw7nsD5wlag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; d="scan'208";a="486327508"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 16 Jul 2020 19:48:33 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 16 Jul 2020 19:48:32 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 16 Jul 2020 19:48:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 16 Jul 2020 19:48:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ko7LwWSOX2cgWAIq7nb9Ybr+/CTg6NZX5I64YSEJzYPpPvofkjYyq+zkkZmQeivTUdgKwh1LmL+iUs6sPtf1xTrV6LRR1Axd5h/jzHa9G1jVf/56hFktJnTHVLJ6wqAJiDI6BB3SWfhfjkO6tFcQ5LM30SFU00V+hcqK3MUESwt/gOeV/9QdjZLW7jqYqNg9ZkeGJzS+ZpHpogTAaFY11gkA/pTALADUrvhuB74DaZH6CtcknFeVAV7QD0DDMVGfgfxxGW6BE80Jgc36q6uq+oQw52KCQBwbCzRUulPmRez7bSOkHS5c3KANtMyNsZFkHdfpqhY61iRIdY/KaujI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqUNMdOna51lVMddSEw3v4JJroMRzmwwFd/ZAXjxsk8=;
 b=THh+oD2LWZIJbbGYotae/MIC9pa02HuNdfwXc6ZYIYT+GvfvE6wXrjo8dTIxRtRlZHMH8rF7cSidmQZ6DWHsGKhKsqJkWzwqcSC+3Dabdf4gOZ9/Tvpi2pTwQSJTLipWp0uTqU+ARzvZNTIOZcnjFz2UZv013zQeHiFvUvyTZZPuQLnqcLVP/Xi8APHvvNxBUObrvJdONvTlCsAyutdCXEWqDHWmzu2TDh9goujmlXmiIEE1IC8RP/q/s3dtyZ/jaM8PwrnG1tmkKqMdSaEmlUj+hDlPz6vxBKQDL6DD3z/Ae/CkQ5BuTIrlgS7N6pq4wLhz+9DpOiDMdOL1HkKaqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqUNMdOna51lVMddSEw3v4JJroMRzmwwFd/ZAXjxsk8=;
 b=hOwnou9yMSI195yXQdzAgXeoKutkBNSAxcVM4pzFBVARLu6pAgnZHYHrWw5yCzDlAhwodiV+nJZbAXRsdEiEteY1evCBz9y7Ljvfxz78q2NwLtg+InUpHy14pCshNk76RkhGznuH3YlZivsRNcDTdvmAU7O7YkGsmwVEwfTXnlo=
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by MWHPR1101MB2253.namprd11.prod.outlook.com (2603:10b6:301:52::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Fri, 17 Jul
 2020 02:48:29 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::9864:e0cb:af36:6feb]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::9864:e0cb:af36:6feb%5]) with mapi id 15.20.3195.018; Fri, 17 Jul 2020
 02:48:29 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 1/2] VT-d: install sync_cache hook on demand
Thread-Topic: [PATCH 1/2] VT-d: install sync_cache hook on demand
Thread-Index: AQHWWo9R9JuT380chUCL6kT51/xX/6kLFAIA
Date: Fri, 17 Jul 2020 02:48:29 +0000
Message-ID: <MWHPR11MB1645176C28AD7F37615C79378C7C0@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <2ad1607d-0909-f1cc-83bf-2546b28a9128@suse.com>
 <0036b69f-0d56-9ac4-1afa-06640c9007de@suse.com>
In-Reply-To: <0036b69f-0d56-9ac4-1afa-06640c9007de@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.213]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03c6982c-59d9-4533-8134-08d829fbe32e
x-ms-traffictypediagnostic: MWHPR1101MB2253:
x-microsoft-antispam-prvs: <MWHPR1101MB2253920F702B6D77C79C89F18C7C0@MWHPR1101MB2253.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v8XsXVOjU+qAymc52E2F39cAEnw1Haz4ovPx58yPLXZBUsTPO8tPly8QuSkgMgNN+fXBGF0AyjcU8syZia9UQ/wUsbr/W/8aqCOiAXQ83M10UkdA2S71u4w1J0O8IvJ+MTyNDdMcnOHCnuCRhpYzR0CrRvoGsge1BP/euxzd1YN+GxBr5Fw3oY8c1PFDyRBEJK6SiGXEMRmsftZYy/ltTGQMrs3dftymcKqweUEwXjPqozSPLnpj4Q+u3rk1hyKa4aGEIK7eYp/v7uq+ugYGNnODBp7onIcGNnka/aIM+t2cEsIWXtxY3LttRwg2S6EYthe1lnXFR0oDBvpzsQ8+pQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(76116006)(8936002)(9686003)(33656002)(66446008)(8676002)(66556008)(83380400001)(66476007)(6506007)(64756008)(52536014)(7696005)(186003)(26005)(110136005)(5660300002)(71200400001)(66946007)(86362001)(55016002)(478600001)(2906002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: oB8sN9ajGtSPXR8Af/MTCA6MHGO2lCKRxXfqtx1bUNxa5afQpb6V+QM5hplyP4X15cSjcUI8yNy0u5zzPSukYZKXINs/KbEdQ/yIwySU7VFMitrniNjP5A/OLmsP4QlaucK5VCmwcBsSE6o+GCWkrBcP2CbgUfyc4Vwo/w4JPog4aTDk2L/T9CQivtIiPBD5stBuBs/GPBqYooqRqLOtJDb9f/2toAPEihtinzxCU33np59RQcBlbe5NrMEu0dlQYoZuSwZBejoGiBX5PHm5Kz8WCc5BNpZHW3eHgU86gPI+3MeLif5gStZHTrszbLegNsMcOVp3WKuNViZ5E/KPFEnWE0MqMeRjcxU8olE/pxlcE7jx0Qsc5qyF8h0P9EU/3QyV2UGmYB8imCKkvtA8oJKk2J5o+Bxewzm4MM41OZ37kxqHqtTXu0OFbNA2FPlIVFs977qZEchCXxTRX6VLFcagALZDEhvO9Z5WuLoSkl9dA69unn1BlxV2tRBWS/hC
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c6982c-59d9-4533-8134-08d829fbe32e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 02:48:29.5382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: py6jFCLPmZfWWUSnEN64haaYBrwj59xG6+sMOaBx7WHWTShEsEgD6Bh/0Ug94ifXOBdMV6/859Q9CMhuy1Zo1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2253
X-OriginatorOrg: intel.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgSnVseSAxNSwgMjAyMCA2OjA0IFBNDQo+IA0KPiBJbnN0ZWFkIG9mIGNoZWNraW5nIGluc2lk
ZSB0aGUgaG9vayB3aGV0aGVyIGFueSBub24tY29oZXJlbnQgSU9NTVVzIGFyZQ0KPiBwcmVzZW50
LCBzaW1wbHkgaW5zdGFsbCB0aGUgaG9vayBvbmx5IHdoZW4gdGhpcyBpcyB0aGUgY2FzZS4NCj4g
DQo+IFRvIHByb3ZlIHRoYXQgdGhlcmUgYXJlIG5vIG90aGVyIHJlZmVyZW5jZXMgdG8gdGhlIG5v
dyBkeW5hbWljYWxseQ0KPiB1cGRhdGVkIG9wcyBzdHJ1Y3R1cmUgKGFuZCBoZW5jZSB0aGF0IGl0
cyB1cGRhdGluZyBoYXBwZW5zIGVhcmx5DQo+IGVub3VnaCksIG1ha2UgaXQgc3RhdGljIGFuZCBy
ZW5hbWUgaXQgYXQgdGhlIHNhbWUgdGltZS4NCj4gDQo+IE5vdGUgdGhhdCB0aGlzIGNoYW5nZSBp
bXBsaWVzIHRoYXQgc3luY19jYWNoZSgpIHNob3VsZG4ndCBiZSBjYWxsZWQNCj4gZGlyZWN0bHkg
dW5sZXNzIHRoZXJlIGFyZSB1bnVzdWFsIGNpcmN1bXN0YW5jZXMsIGxpa2UgaXMgdGhlIGNhc2Ug
aW4NCj4gYWxsb2NfcGd0YWJsZV9tYWRkcigpLCB3aGljaCBnZXRzIGludm9rZWQgdG9vIGVhcmx5
IGZvciBpb21tdV9vcHMgdG8NCj4gYmUgc2V0IGFscmVhZHkgKGFuZCB0aGVyZWZvcmUgd2UgYWxz
byBuZWVkIHRvIGJlIGNhcmVmdWwgdGhlcmUgdG8NCj4gYXZvaWQgYWNjZXNzaW5nIHZ0ZF9vcHMg
bGF0ZXIgb24sIGFzIGl0IGxpdmVzIGluIC5pbml0KS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4g
PGtldmluLnRpYW5AaW50ZWwuY29tPg0KDQo+IA0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC92dGQvZXh0ZXJuLmgNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2V4
dGVybi5oDQo+IEBAIC0yOCw3ICsyOCw2IEBADQo+ICBzdHJ1Y3QgcGNpX2F0c19kZXY7DQo+ICBl
eHRlcm4gYm9vbF90IHJ3YmZfcXVpcms7DQo+ICBleHRlcm4gY29uc3Qgc3RydWN0IGlvbW11X2lu
aXRfb3BzIGludGVsX2lvbW11X2luaXRfb3BzOw0KPiAtZXh0ZXJuIGNvbnN0IHN0cnVjdCBpb21t
dV9vcHMgaW50ZWxfaW9tbXVfb3BzOw0KPiANCj4gIHZvaWQgcHJpbnRfaW9tbXVfcmVncyhzdHJ1
Y3QgYWNwaV9kcmhkX3VuaXQgKmRyaGQpOw0KPiAgdm9pZCBwcmludF92dGRfZW50cmllcyhzdHJ1
Y3QgdnRkX2lvbW11ICppb21tdSwgaW50IGJ1cywgaW50IGRldmZuLCB1NjQNCj4gZ21mbik7DQo+
IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+ICsrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+IEBAIC01OSw2ICs1OSw3IEBAIGJvb2wg
X19yZWFkX21vc3RseSBpb21tdV9zbm9vcCA9IHRydWU7DQo+IA0KPiAgaW50IG5yX2lvbW11czsN
Cj4gDQo+ICtzdGF0aWMgc3RydWN0IGlvbW11X29wcyB2dGRfb3BzOw0KPiAgc3RhdGljIHN0cnVj
dCB0YXNrbGV0IHZ0ZF9mYXVsdF90YXNrbGV0Ow0KPiANCj4gIHN0YXRpYyBpbnQgc2V0dXBfaHdk
b21fZGV2aWNlKHU4IGRldmZuLCBzdHJ1Y3QgcGNpX2RldiAqKTsNCj4gQEAgLTE0NiwxNiArMTQ3
LDExIEBAIHN0YXRpYyBpbnQgY29udGV4dF9nZXRfZG9tYWluX2lkKHN0cnVjdA0KPiAgICAgIHJl
dHVybiBkb21pZDsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgaW50IGlvbW11c19pbmNvaGVyZW50Ow0K
PiAtDQo+ICBzdGF0aWMgdm9pZCBzeW5jX2NhY2hlKGNvbnN0IHZvaWQgKmFkZHIsIHVuc2lnbmVk
IGludCBzaXplKQ0KPiAgew0KPiAgICAgIHN0YXRpYyB1bnNpZ25lZCBsb25nIGNsZmx1c2hfc2l6
ZSA9IDA7DQo+ICAgICAgY29uc3Qgdm9pZCAqZW5kID0gYWRkciArIHNpemU7DQo+IA0KPiAtICAg
IGlmICggIWlvbW11c19pbmNvaGVyZW50ICkNCj4gLSAgICAgICAgcmV0dXJuOw0KPiAtDQo+ICAg
ICAgaWYgKCBjbGZsdXNoX3NpemUgPT0gMCApDQo+ICAgICAgICAgIGNsZmx1c2hfc2l6ZSA9IGdl
dF9jYWNoZV9saW5lX3NpemUoKTsNCj4gDQo+IEBAIC0yMTcsNyArMjEzLDggQEAgdWludDY0X3Qg
YWxsb2NfcGd0YWJsZV9tYWRkcih1bnNpZ25lZCBsbw0KPiAgICAgICAgICB2YWRkciA9IF9fbWFw
X2RvbWFpbl9wYWdlKGN1cl9wZyk7DQo+ICAgICAgICAgIG1lbXNldCh2YWRkciwgMCwgUEFHRV9T
SVpFKTsNCj4gDQo+IC0gICAgICAgIHN5bmNfY2FjaGUodmFkZHIsIFBBR0VfU0laRSk7DQo+ICsg
ICAgICAgIGlmICggKGlvbW11X29wcy5pbml0ID8gJmlvbW11X29wcyA6ICZ2dGRfb3BzKS0+c3lu
Y19jYWNoZSApDQo+ICsgICAgICAgICAgICBzeW5jX2NhY2hlKHZhZGRyLCBQQUdFX1NJWkUpOw0K
PiAgICAgICAgICB1bm1hcF9kb21haW5fcGFnZSh2YWRkcik7DQo+ICAgICAgICAgIGN1cl9wZysr
Ow0KPiAgICAgIH0NCj4gQEAgLTEyMjcsNyArMTIyNCw3IEBAIGludCBfX2luaXQgaW9tbXVfYWxs
b2Moc3RydWN0IGFjcGlfZHJoZF8NCj4gICAgICBpb21tdS0+bnJfcHRfbGV2ZWxzID0gYWdhd190
b19sZXZlbChhZ2F3KTsNCj4gDQo+ICAgICAgaWYgKCAhZWNhcF9jb2hlcmVudChpb21tdS0+ZWNh
cCkgKQ0KPiAtICAgICAgICBpb21tdXNfaW5jb2hlcmVudCA9IDE7DQo+ICsgICAgICAgIHZ0ZF9v
cHMuc3luY19jYWNoZSA9IHN5bmNfY2FjaGU7DQo+IA0KPiAgICAgIC8qIGFsbG9jYXRlIGRvbWFp
biBpZCBiaXRtYXAgKi8NCj4gICAgICBucl9kb20gPSBjYXBfbmRvbXMoaW9tbXUtPmNhcCk7DQo+
IEBAIC0yNzM3LDcgKzI3MzQsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBpbnRlbF9pb21tdV9xdWFy
YW50aW5lDQo+ICAgICAgcmV0dXJuIGxldmVsID8gLUVOT01FTSA6IHJjOw0KPiAgfQ0KPiANCj4g
LWNvbnN0IHN0cnVjdCBpb21tdV9vcHMgX19pbml0Y29uc3RyZWwgaW50ZWxfaW9tbXVfb3BzID0g
ew0KPiArc3RhdGljIHN0cnVjdCBpb21tdV9vcHMgX19pbml0ZGF0YSB2dGRfb3BzID0gew0KPiAg
ICAgIC5pbml0ID0gaW50ZWxfaW9tbXVfZG9tYWluX2luaXQsDQo+ICAgICAgLmh3ZG9tX2luaXQg
PSBpbnRlbF9pb21tdV9od2RvbV9pbml0LA0KPiAgICAgIC5xdWFyYW50aW5lX2luaXQgPSBpbnRl
bF9pb21tdV9xdWFyYW50aW5lX2luaXQsDQo+IEBAIC0yNzY4LDExICsyNzY1LDEwIEBAIGNvbnN0
IHN0cnVjdCBpb21tdV9vcHMgX19pbml0Y29uc3RyZWwgaW4NCj4gICAgICAuaW90bGJfZmx1c2hf
YWxsID0gaW9tbXVfZmx1c2hfaW90bGJfYWxsLA0KPiAgICAgIC5nZXRfcmVzZXJ2ZWRfZGV2aWNl
X21lbW9yeSA9DQo+IGludGVsX2lvbW11X2dldF9yZXNlcnZlZF9kZXZpY2VfbWVtb3J5LA0KPiAg
ICAgIC5kdW1wX3AybV90YWJsZSA9IHZ0ZF9kdW1wX3AybV90YWJsZSwNCj4gLSAgICAuc3luY19j
YWNoZSA9IHN5bmNfY2FjaGUsDQo+ICB9Ow0KPiANCj4gIGNvbnN0IHN0cnVjdCBpb21tdV9pbml0
X29wcyBfX2luaXRjb25zdHJlbCBpbnRlbF9pb21tdV9pbml0X29wcyA9IHsNCj4gLSAgICAub3Bz
ID0gJmludGVsX2lvbW11X29wcywNCj4gKyAgICAub3BzID0gJnZ0ZF9vcHMsDQo+ICAgICAgLnNl
dHVwID0gdnRkX3NldHVwLA0KPiAgICAgIC5zdXBwb3J0c194MmFwaWMgPSBpbnRlbF9pb21tdV9z
dXBwb3J0c19laW0sDQo+ICB9Ow0KDQo=

