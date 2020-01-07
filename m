Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E52A132B54
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 17:47:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioryx-00084k-Ig; Tue, 07 Jan 2020 16:45:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d0v/=24=microsoft.com=mikelley@srs-us1.protection.inumbo.net>)
 id 1ioryv-00084Z-Sz
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 16:45:26 +0000
X-Inumbo-ID: 1a0730c4-316d-11ea-ac6d-12813bfff9fa
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (unknown
 [40.107.75.104]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a0730c4-316d-11ea-ac6d-12813bfff9fa;
 Tue, 07 Jan 2020 16:45:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDl3+UECeiB48G2FfzJALzdF3g8KsmA0Hl11f8WOTSTnZeo/66JPzjDcjl1jIlzDLSqeTZYtX6isqmm68xDxNat+D6iXFYHYT2cPMppp6UHksqy4WS6/3f/Xu+wMHZkuYcjg4I327zGEvwo5p+7b1rfD9H6N0d6ovrookOsJI+KgbQPvv6aWZC1RZuHyQqniKsjqVQ8m/wu4n77+QB6dsZ+cRUk97eqfiFydnZnajfqAB7fk06GjzjTrGroJWBlTz6eQjuMwbEOeHRXm0Zb12GkXNfJLjtWD2aTTaPqf/x/LuDRHdZY1fzk+qdBSYgz7cn+N5VIDFIah27Yrr/3s1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAFEp4N0KeugNaDSx/sJwIbo6KYAMPlgtCkvcAzhhwo=;
 b=SzDNdpNZxNJz2znqsdVj+0U1yS/iEYABxK6HTnEiA1/MQOUoCvxHayKlc2ofjvsAxE+54YULY1bBMXg4HTTgctD7Ab1Uesln2ov/LMJv+Ia5bEo0vIG0fr3fHJwOwVGeWC9Utm7Q9eDukI/pVEuv/vMHITzqMTv0J30Zdqwf2KNUcK5GVgr8jzqnvilHBWhtQd4pYGwSTbH/QMzOlcXBgoPCsReEfNXgkwS54hcUZiGhkRLzPFkTw0eg8EUi3rRDUZL9k0ZUwkK3FRqNljCGCsFYpW0o0p32y7nScei+pwaZrAdimoCr/Zd5VvP9UWELT/PZq6QNemuLTxtjNAcbzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAFEp4N0KeugNaDSx/sJwIbo6KYAMPlgtCkvcAzhhwo=;
 b=ZrrFP+nWktIMDlJRQf1YTSmKEPYYfCMTbA+JlxfhssSKVHX1c7XdHD/sfncm7OFwOzDkGNVf48gDvAgxzuKDMtjY7Ubok7NLpg2oMH//TtMv/2NqOYtZtz1en233JJBNOp7gDBTjrlXvb9201M/pcqgRvJqspMpITgJa+TEQvzE=
Received: from MW2PR2101MB1052.namprd21.prod.outlook.com (52.132.149.16) by
 MW2PR2101MB1035.namprd21.prod.outlook.com (52.132.149.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.1; Tue, 7 Jan 2020 16:45:23 +0000
Received: from MW2PR2101MB1052.namprd21.prod.outlook.com
 ([fe80::f1bb:c094:cb30:ba1f]) by MW2PR2101MB1052.namprd21.prod.outlook.com
 ([fe80::f1bb:c094:cb30:ba1f%6]) with mapi id 15.20.2644.002; Tue, 7 Jan 2020
 16:45:23 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v3 3/5] x86/hyperv: provide percpu hypercall input page
Thread-Index: AQHVw+fuxrxh+AQHPUiSQcmySCfFHafdb+4AgAH4sICAAAJrwA==
Date: Tue, 7 Jan 2020 16:45:22 +0000
Message-ID: <MW2PR2101MB10520EB8D020D858A3499656D73F0@MW2PR2101MB1052.namprd21.prod.outlook.com>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-4-liuwe@microsoft.com>
 <8437e48d-b22c-68c1-f589-fd945c011a3f@suse.com>
 <20200107163339.rwqo6ybwzxgi77e4@debian>
In-Reply-To: <20200107163339.rwqo6ybwzxgi77e4@debian>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-01-07T16:45:21.5950288Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=abe73dc0-3923-44f4-af0f-5802a1c386d0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
x-originating-ip: [2001:4898:80e8:0:19d7:c643:622e:dfc9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 385282c2-59d4-48fa-05e7-08d79390fd4f
x-ms-traffictypediagnostic: MW2PR2101MB1035:|MW2PR2101MB1035:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR2101MB10357881F3660B7B7DAF8DFDD73F0@MW2PR2101MB1035.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(346002)(396003)(136003)(39860400002)(189003)(199004)(4326008)(66446008)(110136005)(53546011)(7696005)(64756008)(316002)(55016002)(6506007)(66556008)(9686003)(81166006)(81156014)(5660300002)(2906002)(33656002)(10290500003)(8990500004)(66476007)(478600001)(186003)(66946007)(76116006)(52536014)(8936002)(86362001)(71200400001)(8676002)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW2PR2101MB1035;
 H:MW2PR2101MB1052.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9ZTRIoFC10MkmN9ZD57id4IhfWkPDF+56/7YoKYoQp/8Wk5vooMI9zsr9g41s2gVusG3y3xDBPeR+sMW6eO1rkCVNsKsiyL2Hl5M65Rpaygn8POSfaKofrABhhq2nwgRSFlAHtIZAw3+8340b9u+wbhLrw5lI04rNEQ30WwJMdvvS7W8kynavfJNKl5i9X+K+8APFzdW6IPGV/upYcym9WAJ5CKZGzWKhHqBCTjfm+j6o4a1NrDB9vP+t6wC2Mygm0oslE/VPpa8gMRq5X9VBDAA+b4Z275Pm0NRwrdX6H9J0178RTlSmF6aRxlGvkRz9RKpMFQzmigvCtJ4LBztZUQtzLmBWcn+y0UySNJSamk9aZqtll7o7DPKwqcEqJoJEhgvUemsyIkSJsbFmFvZ0yNpsZbTZWzVlq0WJ2o8wGM37Evwf9+ERf/puvDR5UI4
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 385282c2-59d4-48fa-05e7-08d79390fd4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 16:45:22.9833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CR2lTOkIE1T5duQMo8rsYdjSQyZrAtbxc466cZq2qDBAaiy3CjHqf7NRSLyfmNKs6GWzyHv0pELMSBRINzIh5Nw50ruq702LtkwNRh6ZUGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR2101MB1035
Subject: Re: [Xen-devel] [PATCH v3 3/5] x86/hyperv: provide percpu hypercall
 input page
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2xAeGVuLm9yZz4gU2VudDogVHVlc2RheSwgSmFudWFyeSA3LCAyMDIw
IDg6MzQgQU0KPiAKPiBPbiBNb24sIEphbiAwNiwgMjAyMCBhdCAxMToyNzoxOEFNICswMTAwLCBK
YW4gQmV1bGljaCB3cm90ZToKPiA+IE9uIDA1LjAxLjIwMjAgMTc6NDcsIFdlaSBMaXUgd3JvdGU6
Cj4gPiA+IEh5cGVyLVYncyBpbnB1dCAvIG91dHB1dCBhcmd1bWVudCBtdXN0IGJlIDggYnl0ZXMg
YWxpZ25lZCBhbiBub3QgY3Jvc3MKPiA+ID4gcGFnZSBib3VuZGFyeS4gVGhlIGVhc2llc3Qgd2F5
IHRvIHNhdGlzZnkgdGhvc2UgcmVxdWlyZW1lbnRzIGlzIHRvIHVzZQo+ID4gPiBwZXJjcHUgcGFn
ZS4KPiA+Cj4gPiBJJ20gbm90IHN1cmUgImVhc2llc3QiIGlzIHJlYWxseSB0cnVlIGhlcmUuIE90
aGVycyBjb3VsZCBjb25zaWRlciBhZGRpbmcKPiA+IF9fYWxpZ25lZCgpIGF0dHJpYnV0ZXMgYXMg
ZWFzeSBvciBldmVuIGVhc2llciAoYnkgYmVpbmcgZXZlbiBtb3JlCj4gPiB0cmFuc3BhcmVudCB0
byB1c2Ugc2l0ZXMpLiBDb3VsZCB3ZSBzZXR0bGUgb24gIk9uZSB3YXkgLi4uIj8KPiAKPiBEbyB5
b3UgbWVhbiBzb21ldGhpbmcgbGlrZQo+IAo+ICAgIHN0cnVjdCBmb28gX19hbGlnbmVkKDgpOwo+
IAo+ICAgIGh2X2RvX2h5cGVyY2FsbChPUCwgdmlydF90b19tYWRkcigmZm9vKSwgLi4uKTsKPiAK
PiA/Cj4gCj4gSSBkb24ndCB0aGluayB0aGlzIGlzIHRyYW5zcGFyZW50IHRvIHVzZXIgc2l0ZXMu
IFBsdXMsIGZvbyBpcyBvbiBzdGFjawo+IHdoaWNoIGlzIDEpIGRpZmZpY3VsdCB0byBnZXQgaXRz
IG1hZGRyLCAyKSBtYXkgY3Jvc3MgcGFnZSBib3VuZGFyeS4KPiAKPiBJZiBJIG1pc3VuZGVyc3Rv
b2Qgd2hhdCB5b3UgbWVhbnQsIHBsZWFzZSBnaXZlIG1lIGFuIGV4YW1wbGUgaGVyZS4KPiAKPiA+
Cj4gPiA+IEBAIC04MywxNCArODQsMzMgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2h5cGVy
Y2FsbF9wYWdlKHZvaWQpCj4gPiA+ICAgICAgd3Jtc3JsKEhWX1g2NF9NU1JfSFlQRVJDQUxMLCBo
eXBlcmNhbGxfbXNyLmFzX3VpbnQ2NCk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICtzdGF0aWMgdm9p
ZCBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcodm9pZCkKPiA+ID4gK3sKPiA+ID4gKyAgICB2b2lk
ICptYXBwaW5nOwo+ID4gPiArCj4gPiA+ICsgICAgbWFwcGluZyA9IGFsbG9jX3hlbmhlYXBfcGFn
ZSgpOwo+ID4gPiArICAgIGlmICggIW1hcHBpbmcgKQo+ID4gPiArICAgICAgICBwYW5pYygiRmFp
bGVkIHRvIGFsbG9jYXRlIGh5cGVyY2FsbCBpbnB1dCBwYWdlIGZvciAldVxuIiwKPiA+Cj4gPiAi
Li4uIGZvciBDUFUldVxuIiBwbGVhc2UuCj4gPgo+ID4gPiArICAgICAgICAgICAgICBzbXBfcHJv
Y2Vzc29yX2lkKCkpOwo+ID4gPiArCj4gPiA+ICsgICAgdGhpc19jcHUoaHZfcGNwdV9pbnB1dF9h
cmcpID0gbWFwcGluZzsKPiA+Cj4gPiBXaGVuIG9mZmxpbmluZyBhbmQgdGhlbiByZS1vbmxpbmlu
ZyBhIENQVSwgdGhlIHByaW9yIHBhZ2Ugd2lsbCBiZQo+ID4gbGVha2VkLgo+IAo+IFJpZ2h0LiBU
aGFua3MgZm9yIGNhdGNoaW5nIHRoaXMgb25lLgo+IAo+ID4KPiA+ID4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAo+ID4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2
L2d1ZXN0L2h5cGVydi5oCj4gPiA+IEBAIC01MSw2ICs1MSw4IEBAIHN0YXRpYyBpbmxpbmUgdWlu
dDY0X3QgaHZfc2NhbGVfdHNjKHVpbnQ2NF90IHRzYywgdWludDY0X3Qgc2NhbGUsCj4gPiA+Cj4g
PiA+ICAjaWZkZWYgQ09ORklHX0hZUEVSVl9HVUVTVAo+ID4gPgo+ID4gPiArI2luY2x1ZGUgPHhl
bi9wZXJjcHUuaD4KPiA+ID4gKwo+ID4gPiAgI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnZpc29y
Lmg+Cj4gPiA+Cj4gPiA+ICBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gewo+ID4gPiBAQCAtNjMsNiAr
NjUsOCBAQCBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gewo+ID4gPiAgfTsKPiA+ID4gIGV4dGVybiBz
dHJ1Y3QgbXNfaHlwZXJ2X2luZm8gbXNfaHlwZXJ2Owo+ID4gPgo+ID4gPiArREVDTEFSRV9QRVJf
Q1BVKHZvaWQgKiwgaHZfcGNwdV9pbnB1dF9hcmcpOwo+ID4KPiA+IFdpbGwgdGhpcyByZWFsbHkg
YmUgbmVlZGVkIG91dHNpZGUgb2YgdGhlIGZpbGUgdGhhdCBkZWZpbmVzIGl0Pwo+ID4KPiAKPiBU
aGlzIGNhbiBsaXZlIGluIGEgcHJpdmF0ZSBoZWFkZXIgZm9yIHRoZSB0aW1lIGJlaW5nLgo+IAo+
ID4gQWxzbywgd2hpbGUgbG9va2luZyBhdCB0aGlzIEkgbm90aWNlIHRoYXQgLSBkZXNwaXRlIG15
IGVhcmxpZXIKPiA+IGNvbW1lbnQgd2hlbiBnaXZpbmcgdGhlIHJlc3BlY3RpdmUsIHNvcnQtb2Yt
Y29uZGl0aW9uYWwgYWNrIC0KPiA+IHRoZXJlIGFyZSAoc3RpbGwpIG1hbnkgYXBwYXJlbnRseSBw
b2ludGxlc3MgX19wYWNrZWQgYXR0cmlidXRlcwo+ID4gaW4gaHlwZXJ2LXRsZnMuaC4gQ2FyZSB0
byBjb21tZW50IG9uIHRoaXM/Cj4gCj4gQWdhaW4sIHRoYXQncyBhIHN0cmFpZ2h0IGltcG9ydCBm
cm9tIExpbnV4LiBJIHRyaWVkIG5vdCB0byBkZXZpYXRlIHRvbwo+IG11Y2guIEEgY29tbWl0IGlu
IExpbnV4IChlYzA4NDQ5MTcyN2IwKSBjbGFpbXMgImNvbXBpbGVyIGNhbiBhZGQKPiBhbGlnbm1l
bnQgcGFkZGluZyB0byBzdHJ1Y3R1cmVzIG9yIHJlb3JkZXIgc3RydWN0IG1lbWJlcnMgZm9yCj4g
cmFuZG9taXphdGlvbiBhbmQgb3B0aW1pemF0aW9uIi4KPiAKPiBJIGp1c3QgY2hlY2tlZCBhbGwg
dGhlIHBhY2tlZCBzdHJ1Y3R1cmVzLiBUaGV5IHNlZW0gdG8gaGF2ZSBhbGwgdGhlCj4gcmVxdWly
ZWQgbWFudWFsIHBhZGRpbmdzIGFscmVhZHkuIEkgY2FuIG9ubHkgYXNzdW1lIHRoZXkgdHJpZWQg
dG8gZXJyZWQKPiBvbiB0aGUgc2FmZSBzaWRlLgoKQ29ycmVjdC4gIFRoZSBfX3BhY2tlZCBhdHRy
aWJ1dGUgd2FzIGFkZGVkIG9ubHkgYWJvdXQgYSB5ZWFyIGFnbwphZnRlciBzb21lYm9keSBvbiBM
S01MIG5vdGljZWQgdGhhdCB0aGUgc3RydWN0dXJlcyB3ZXJlIG5vdCBwYWNrZWQuClNvbWUgZGlz
Y3Vzc2lvbiBlbnN1ZWQsIGJ1dCB0aGUgY29uc2Vuc3VzIHdhcyB0byBhZGQgX19wYWNrZWQgZHVl
CnRvIGdlbmVyYWwgIHBhcmFub2lhIGFib3V0IHdoYXQgdGhlIGNvbXBpbGVyIG1pZ2h0IGRvIGV2
ZW4gdGhvdWdoCmluZGl2aWR1YWwgZmllbGRzIGFyZSBhbGlnbmVkIHRvIHRoZWlyIG5hdHVyYWwg
Ym91bmRhcnkuCgpNaWNoYWVsCgo+IAo+IFdlaS4KPiAKPiA+Cj4gPiBKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
