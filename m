Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC42A125C58
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 09:02:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihqis-0002s6-1C; Thu, 19 Dec 2019 07:59:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datr=2J=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ihqiq-0002rx-AK
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 07:59:48 +0000
X-Inumbo-ID: 85f8fe58-2235-11ea-88e7-bc764e2007e4
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::710])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85f8fe58-2235-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 07:59:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HB4EeOMTlj9xBnFhixoQl8GAoBL65FpxrfsZ9+2lKb0IvfWF7ggWvf+LY+0qBzpx03sQeqaho4LebYUOXwLIsKqO65T6WjdrWiNNRvNgzJoBPiKtOBRxVdo6AmwvHcaN9k1K7f7ZqC5ZrDxRcPIPr97XFWryf8KpQRfSjXO6ylljdyWIrX5a/Bd+zgCV48zRs278MoaKAOV3fhkEFuAwK0bFpNvOfIIrW2mPcn+9Z/WlHQAZ1eq2HPG3SWcE0nCl9JsZhddkz0jPS2wAK7TZJ8sMFGqqrSuBooUZbRsiFkASGZ7hTLjLDX9eVZmsfazmmNncEWxCQ8hI0+qV7D+ekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYN6wMNUxAQAxDNHFgn4EHf+APlyHe+WzBAfRxLPTtw=;
 b=HLWib66IrFPpCc4p5BPPyMJkpNqee981KRoJ3e0fw8hl7uc+AVlPLiDpesph+aAALo/1iB2AtpZvilhu/1LXL50Wlw0UiDzGAfezEZEoV3m9do2003SfFgDzDJ1dV+sNLa6lTUlKi4eRGSw4lxCPuFvIDVTPmZNv76AnQEgFJHQDUANaBAsiS2cRNBgFyVTeAuJe+va9W6M5DszcBDrIOigxevBHITDKik6cp3lY6LC7LLgANqsFaY5FsN2OnzvksI+ClM+4Iqkxoa7uQ4biEMMB8mFCWGOLHIpv02SSepxmu2HM08SJxqgnYpuUPVrj80qZvFv4iNFMYvZBEmxCEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYN6wMNUxAQAxDNHFgn4EHf+APlyHe+WzBAfRxLPTtw=;
 b=hf4KdTn4i4XLXtAKRZszeZ1OnQxAt2MGr/plEr6mwRdleWIx7SXzFuE5MhgxBENWtsUkbg3bHrjpwqEp4qVKazBgf1kA78KdsmnLz6WTDVRSeavziPfA2w8WmNXMm2GCu/FomNNj8uYWdGAMGBcYahHRm6hFvbU/vTA/Mn4el6k=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5314.eurprd02.prod.outlook.com (20.178.23.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Thu, 19 Dec 2019 07:59:45 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2559.015; Thu, 19 Dec 2019
 07:59:45 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 18/20] xen/mem_access: Use __get_gfn_type_access in
 set_mem_access
Thread-Index: AQHVtds8AUH7W2YIvUirR5NHN4gmNafBGNSA
Date: Thu, 19 Dec 2019 07:59:45 +0000
Message-ID: <898073d2-7480-7f67-0411-f80055b10d4e@bitdefender.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <d814a518fc201c76ffd8f254c534719ee278175a.1576697796.git.tamas.lengyel@intel.com>
In-Reply-To: <d814a518fc201c76ffd8f254c534719ee278175a.1576697796.git.tamas.lengyel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0088.eurprd07.prod.outlook.com
 (2603:10a6:207:6::22) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c774b818-2eb5-4ff2-c1b3-08d784596952
x-ms-traffictypediagnostic: AM0PR02MB5314:|AM0PR02MB5314:|AM0PR02MB5314:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB53148B4AA8D0E5116E0422A3AB520@AM0PR02MB5314.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0256C18696
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(136003)(39860400002)(376002)(346002)(199004)(189003)(2616005)(31696002)(110136005)(6486002)(52116002)(36756003)(6512007)(316002)(26005)(66556008)(86362001)(81166006)(186003)(81156014)(66946007)(66476007)(54906003)(8936002)(66446008)(64756008)(53546011)(8676002)(6506007)(31686004)(2906002)(71200400001)(5660300002)(4326008)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5314;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fz0VUg/PwLtut1tPYbYRLDvpmGOO+d83eLYJzaHPSalUwb9+L8XvoPZ25txTL0uZi+4ScCG8sekxD9FhZHzH4wlvGX406xXWd0Lh50DD5fY42JUGOFA1/NrLH3gY2jvQyltGTw0yfEYKpPfDP1AJ3XRjdca6uzTw9hQLYQ2ER7eVVa+g66CBlGCHpUln13ojTwQDUM46kOB3bSkLrseGYR4jo9DWX929f/dfRk0GFln0aEZnkgg2n4n9TVIPFq/Q8RMwg6ZcfF0g37WdSEUnx424RL7mfPNeCtGg8Jw3NGti+m24DNKcW5HXrI09LBi2v98l2aNYaPxIkK+vYRhM/QdWHZKsifXD6MWtx4P8KeBZeG3dZZRrVtOjAccUTMnZFlXOXHCma7BQtVnSjWskeg54DDvoSqtAkuNYHzfLPB0EaLWydxoyJZbbWjcds39p
Content-ID: <C38ED57EC4089F4781BE7AB7EA73B480@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c774b818-2eb5-4ff2-c1b3-08d784596952
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2019 07:59:45.1340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XbXvoUdrgcGwaKlhlOoHOdIxLm8dDrnRubMaF/tgANIczi9kHt2crb6zuSDboQvlnnk8MRdmwqoPSKt2vaet3OeEBu0bwkqF0bFdWK/CHv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5314
Subject: Re: [Xen-devel] [PATCH v2 18/20] xen/mem_access: Use
 __get_gfn_type_access in set_mem_access
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE4LjEyLjIwMTkgMjE6NDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4gVXNlIF9f
Z2V0X2dmbl90eXBlX2FjY2VzcyBpbnN0ZWFkIG9mIHAybS0+Z2V0X2VudHJ5IHRvIHRyaWdnZXIg
cGFnZS1mb3JraW5nDQo+IHdoZW4gdGhlIG1lbV9hY2Nlc3MgcGVybWlzc2lvbiBpcyBiZWluZyBz
ZXQgb24gYSBwYWdlIHRoYXQgaGFzIG5vdCB5ZXQgYmVlbg0KPiBjb3BpZWQgb3ZlciBmcm9tIHRo
ZSBwYXJlbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxl
bmd5ZWxAaW50ZWwuY29tUmV2aWV3ZWQtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0
ZGVmZW5kZXIuY29tPg0KDQo+IC0tLQ0KPiAgIHhlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMg
fCA1ICsrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIGIv
eGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYw0KPiBpbmRleCAzMjBiOWZlNjIxLi45Y2FmMDhh
NWIyIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jDQo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMNCj4gQEAgLTMwMywxMSArMzAzLDEwIEBAIHN0
YXRpYyBpbnQgc2V0X21lbV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHAybV9kb21h
aW4gKnAybSwNCj4gICAgICAgQVNTRVJUKCFhcDJtKTsNCj4gICAjZW5kaWYNCj4gICAgICAgew0K
PiAtICAgICAgICBtZm5fdCBtZm47DQo+ICAgICAgICAgICBwMm1fYWNjZXNzX3QgX2E7DQo+ICAg
ICAgICAgICBwMm1fdHlwZV90IHQ7DQo+IC0NCj4gLSAgICAgICAgbWZuID0gcDJtLT5nZXRfZW50
cnkocDJtLCBnZm4sICZ0LCAmX2EsIDAsIE5VTEwsIE5VTEwpOw0KPiArICAgICAgICBtZm5fdCBt
Zm4gPSBfX2dldF9nZm5fdHlwZV9hY2Nlc3MocDJtLCBnZm5feChnZm4pLCAmdCwgJl9hLA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUDJNX0FMTE9DLCBOVUxM
LCBmYWxzZSk7DQoNCkRvbid0IHlvdSB3YW50IHAybV9xdWVyeV90IHRvIGJlIDAgYXMgaXQgd2Fz
IGluIHRoZSBwMm0tPmdldF9lbnRyeSgpIGNhbGwgPw0KDQo+ICAgICAgICAgICByYyA9IHAybS0+
c2V0X2VudHJ5KHAybSwgZ2ZuLCBtZm4sIFBBR0VfT1JERVJfNEssIHQsIGEsIC0xKTsNCj4gICAg
ICAgfQ0KPiAgIA0KPiANCg0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
