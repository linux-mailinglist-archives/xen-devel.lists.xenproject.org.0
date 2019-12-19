Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AFD125CD4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 09:40:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihrJg-0006XO-K1; Thu, 19 Dec 2019 08:37:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiZr=2J=amazon.com=prvs=249f004f8=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihrJf-0006XJ-CP
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 08:37:51 +0000
X-Inumbo-ID: d73affa0-223a-11ea-916b-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d73affa0-223a-11ea-916b-12813bfff9fa;
 Thu, 19 Dec 2019 08:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576744671; x=1608280671;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tlz6C2KMozw0TrfS1GVyBei21Hch4OD774do88v1F68=;
 b=QroxkeN0BRt/m3My0oVSVA7ckXa4ocTTs6r4GBbnFDi49WMopt9Cp3Pm
 40lwBZTYioPZ6ZhFxygtdh/5gOAVXCwWSuD7zJXvMhnxc+xOZhI6qcFnK
 dB6sxCijPvp8H+JrQXi+KxLSdsaVRPy5gsii/yuxKnbgZj9/jKHkufO8R c=;
IronPort-SDR: cXjbh1HxhjKIxJkXDzXADj5hSNKUbAE4rYb+nndgGkQpwwAIMDICk/ajYWaWh2FSuuV/HMg3hd
 2hQemqOvBT3A==
X-IronPort-AV: E=Sophos;i="5.69,331,1571702400"; d="scan'208";a="14418986"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 19 Dec 2019 08:37:40 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id 58CC5A2CA2; Thu, 19 Dec 2019 08:37:39 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 19 Dec 2019 08:37:39 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 08:37:38 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 19 Dec 2019 08:37:37 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Michael Kelley <mikelley@microsoft.com>
Thread-Topic: [PATCH v2 6/6] x86: implement Hyper-V clock source
Thread-Index: AQHVtbGIcPOyV0Vq0U60/IJ15FXn3qe//uhAgABYA4CAACBvAIAArA8A
Date: Thu, 19 Dec 2019 08:37:37 +0000
Message-ID: <2293a10a1fde4414b9f8868c8a8baff5@EX13D32EUC003.ant.amazon.com>
References: <20191218144233.15372-1-liuwe@microsoft.com>
 <20191218144233.15372-7-liuwe@microsoft.com>
 <dcd1dc1a6e99484bbabb6c994c6506ce@EX13D32EUC003.ant.amazon.com>
 <CY4PR21MB0629365FA8E64586AAD0E031D7530@CY4PR21MB0629.namprd21.prod.outlook.com>
 <CAK9nU=oGJkAZWxYdYZXjhR7A4GW-7rtHiVzbNvv4Q_95Q8nB9w@mail.gmail.com>
In-Reply-To: <CAK9nU=oGJkAZWxYdYZXjhR7A4GW-7rtHiVzbNvv4Q_95Q8nB9w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.29]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 6/6] x86: implement Hyper-V clock source
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
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
Pg0KPiBTZW50OiAxOCBEZWNlbWJlciAyMDE5IDIyOjIxDQo+IFRvOiBNaWNoYWVsIEtlbGxleSA8
bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT4NCj4gQ2M6IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFt
YXpvbi5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgWGVuDQo+IERldmVsb3BtZW50IExpc3Qg
PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IFdlaSBMaXUNCj4gPGxpdXdlQG1pY3Jv
c29mdC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVy
DQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNi82XSB4ODY6IGltcGxl
bWVudCBIeXBlci1WIGNsb2NrIHNvdXJjZQ0KPiANCj4gT24gV2VkLCAxOCBEZWMgMjAxOSBhdCAy
MDoyNCwgTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+DQo+IHdyb3RlOg0K
PiA+DQo+ID4gRnJvbTogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4gU2VudDog
V2VkbmVzZGF5LCBEZWNlbWJlciAxOCwNCj4gMjAxOSA3OjI0IEFNDQo+ID4NCj4gPiA+ID4gRnJv
bTogV2VpIExpdSA8d2VpLmxpdS54ZW5AZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgV2VpIExpdQ0K
PiA+ID4gPiBTZW50OiAxOCBEZWNlbWJlciAyMDE5IDE0OjQzDQo+ID4NCj4gPiBbc25pcF0NCj4g
Pg0KPiA+ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IHJlYWRfaHlwZXJ2
X3RpbWVyKHZvaWQpDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsgICAgdWludDY0X3Qgc2NhbGUsIG9m
ZnNldCwgcmV0LCB0c2M7DQo+ID4gPiA+ICsgICAgdWludDMyX3Qgc2VxOw0KPiA+ID4gPiArICAg
IGNvbnN0IHN0cnVjdCBtc19oeXBlcnZfdHNjX3BhZ2UgKnRzY19wYWdlID0gaHlwZXJ2X3RzYzsN
Cj4gPiA+ID4gKw0KPiA+ID4gPiArICAgIGRvIHsNCj4gPiA+ID4gKyAgICAgICAgc2VxID0gdHNj
X3BhZ2UtPnRzY19zZXF1ZW5jZTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICAvKiBTZXEg
MCBpcyBzcGVjaWFsLiBJdCBtZWFucyB0aGUgVFNDIGVubGlnaHRlbm1lbnQgaXMgbm90DQo+ID4g
PiA+ICsgICAgICAgICAqIGF2YWlsYWJsZSBhdCB0aGUgbW9tZW50LiBUaGUgcmVmZXJlbmNlIHRp
bWUgY2FuIG9ubHkgYmUNCj4gPiA+ID4gKyAgICAgICAgICogb2J0YWluZWQgZnJvbSB0aGUgUmVm
ZXJlbmNlIENvdW50ZXIgTVNSLg0KPiA+ID4gPiArICAgICAgICAgKi8NCj4gPiA+ID4gKyAgICAg
ICAgaWYgKCBzZXEgPT0gMCApDQo+ID4gPg0KPiA+ID4gT2xkZXIgdmVyc2lvbnMgb2YgdGhlIHNw
ZWMgdXNlZCB0byB1c2UgMHhGRkZGRkZGRiBJIHRoaW5rLCBhbHRob3VnaA0KPiB3aGVuIEkgbG9v
ayBhZ2FpbiB0aGV5DQo+ID4gPiBzZWVtIHRvIGhhdmUgYmVlbiByZXRyby1hY3RpdmVseSBmaXhl
ZC4gSW4gYW55IGNhc2UgSSB0aGluayB5b3Ugc2hvdWxkDQo+IHRyZWF0IGJvdGgNCj4gPiA+IDB4
RkZGRkZGRkYgYW5kIDAgYXMgaW52YWxpZC4NCj4gPg0KPiA+IEZXSVcsIHRoZSAweEZGRkZGRkZG
IHdhcyBqdXN0IGEgYnVnIGluIHRoZSBzcGVjLiAgSHlwZXItVg0KPiBpbXBsZW1lbnRhdGlvbnMg
b25seQ0KPiA+IHNldCB0aGUgdmFsdWUgdG8gMCB0byBpbmRpY2F0ZSBpbnZhbGlkLiAgVGhlIGVx
dWl2YWxlbnQgTGludXggY29kZQ0KPiBjaGVja3Mgb25seSBmb3IgMC4NCj4gPg0KPiANCj4gVGhh
bmtzIGZvciBjaGltaW5nIGluLCBNaWNoYWVsLg0KPiANCj4gSW4gdGhhdCBjYXNlIEkgd2lsbCBz
dWJtaXQgYSBmaXggdG8gY2hhbmdlIFhlbidzIHZpcmlkaWFuIGNvZGUgdG8NCj4gcmVtb3ZlIHRo
ZSB3cm9uZyB2YWx1ZSB0aGVyZS4NCg0KSWYgbm8gY29uc3VtaW5nIHZlcnNpb24gb2YgV2luZG93
cyBpcyBnb2luZyB0byBiZSB1cHNldCBzZWVpbmcgYWxsLUZzIHRoZW4gdGhhdCdzIGZpbmUuIFRo
YW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uDQoNCkNoZWVycywNCg0KICBQYXVsDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
