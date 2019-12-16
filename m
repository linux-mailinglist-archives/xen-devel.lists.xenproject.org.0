Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C0D120277
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 11:29:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ignYb-0008Bi-Ew; Mon, 16 Dec 2019 10:24:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ILIH=2G=amazon.com=prvs=2465856dc=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ignYZ-0008Bd-Gi
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 10:24:51 +0000
X-Inumbo-ID: 4a508072-1fee-11ea-937c-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a508072-1fee-11ea-937c-12813bfff9fa;
 Mon, 16 Dec 2019 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576491890; x=1608027890;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a7R2AYlyHNFeKXCTJ6nVTRohwbt+5gYg3DEjl6VUWJ4=;
 b=VUixg0FsiVO3vwwfKUgqT4qO0UDzHdtuqCycp9FMQ9KY7f7LSDA+6Q8i
 zDTG292VJwYhbxR26fKy0lYPNFwWDwUkC5P5x9ZyWT8UquGe2aZTgET6Z
 ovvHTgQkCpE3dN5GEbuyDMrxPPouQim31Pe8XwCETYxDXxD+R1UrC7mnI o=;
IronPort-SDR: Kn7RO1VIpIUOiT3AVWCbnjoLp4HXLvEGj8VphH8I02O6vJkwm4Npb1k5BGyjUNhkGiOz5dkbUS
 cfeVW1QOtJBQ==
X-IronPort-AV: E=Sophos;i="5.69,321,1571702400"; 
   d="scan'208";a="7791163"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-807d4a99.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 16 Dec 2019 10:24:49 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-807d4a99.us-east-1.amazon.com (Postfix) with ESMTPS
 id 898E3A3CB1; Mon, 16 Dec 2019 10:24:47 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Dec 2019 10:24:46 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Dec 2019 10:24:45 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 16 Dec 2019 10:24:45 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Julien Grall <julien@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [Xen-devel] xen-block: race condition when stopping the device
 (WAS: Re: [xen-4.13-testing test] 144736: regressions - FAIL)
Thread-Index: AQHVs/YzEtj4rqX6zky6UaCDmCfZVKe8jUhQ
Date: Mon, 16 Dec 2019 10:24:45 +0000
Message-ID: <ed9ddf4ef27f42c6bcc8efc923ea7e34@EX13D32EUC003.ant.amazon.com>
References: <osstest-144736-mainreport@xen.org>
 <e05a3bc4-2c1d-7e71-af42-d6362c4f6d07@suse.com>
 <6ea2af3c-b277-1118-7c83-ebcb0809d449@xen.org>
 <24051.30893.31444.319978@mariner.uk.xensource.com>
 <7a0ef296-eb50-fbda-63e2-8d890fad5111@xen.org>
 <a65ae7dca64f4f718f116b9174893730@EX13D32EUC003.ant.amazon.com>
 <65df8a75-a658-1a14-6780-66c8706bcc80@xen.org>
 <e49691262df2450aa48522dc38f80657@EX13D32EUC003.ant.amazon.com>
 <a757db30c7e247cfbf4ae930c4d3926d@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <a757db30c7e247cfbf4ae930c4d3926d@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.122]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] xen-block: race condition when stopping the device
 (WAS: Re: [xen-4.13-testing test] 144736: regressions - FAIL)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEdXJyYW50LCBQYXVsIDxwZHVy
cmFudEBhbWF6b24uY29tPg0KPiBTZW50OiAxNiBEZWNlbWJlciAyMDE5IDA5OjUwDQo+IFRvOiBE
dXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz47DQo+IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPg0KPiBDYzog
SsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBvc3N0ZXN0IHNl
cnZpY2Ugb3duZXINCj4gPG9zc3Rlc3QtYWRtaW5AeGVucHJvamVjdC5vcmc+OyBBbnRob255IFBl
cmFyZA0KPiA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSRTogW1hlbi1kZXZlbF0geGVuLWJsb2NrOiByYWNlIGNv
bmRpdGlvbiB3aGVuIHN0b3BwaW5nIHRoZQ0KPiBkZXZpY2UgKFdBUzogUmU6IFt4ZW4tNC4xMy10
ZXN0aW5nIHRlc3RdIDE0NDczNjogcmVncmVzc2lvbnMgLSBGQUlMKQ0KPiANCj4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5j
ZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+IER1cnJhbnQsIFBhdWwN
Cj4gPiBTZW50OiAxNiBEZWNlbWJlciAyMDE5IDA5OjM0DQo+ID4gVG86IEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+OyBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4NCj4g
PiBDYzogSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5p
DQo+ID4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IG9z
c3Rlc3Qgc2VydmljZSBvd25lcg0KPiA+IDxvc3N0ZXN0LWFkbWluQHhlbnByb2plY3Qub3JnPjsg
QW50aG9ueSBQZXJhcmQNCj4gPiA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSB4ZW4t
YmxvY2s6IHJhY2UgY29uZGl0aW9uIHdoZW4gc3RvcHBpbmcgdGhlDQo+ID4gZGV2aWNlIChXQVM6
IFJlOiBbeGVuLTQuMTMtdGVzdGluZyB0ZXN0XSAxNDQ3MzY6IHJlZ3Jlc3Npb25zIC0gRkFJTCkN
Cj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBbc25pcF0NCj4gPiA+
ID4+DQo+ID4gPiA+PiBUaGlzIGZlZWxzIGxpa2UgYSByYWNlIGNvbmRpdGlvbiBiZXR3ZWVuIHRo
ZSBpbml0L2ZyZWUgY29kZSB3aXRoDQo+ID4gPiA+PiBoYW5kbGVyLiBBbnRob255LCBkb2VzIGl0
IHJpbmcgYW55IGJlbGw/DQo+ID4gPiA+Pg0KPiA+ID4gPg0KPiA+ID4gPiAgRnJvbSB0aGF0IHN0
YWNrIGJ0IGl0IGxvb2tzIGxpa2UgYW4gaW90aHJlYWQgbWFuYWdlZCB0byBydW4gYWZ0ZXINCj4g
dGhlDQo+ID4gPiBzcmluZyB3YXMgTlVMTGVkLiBUaGlzIHNob3VsZCBub3QgYmUgYWJsZSBoYXBw
ZW4gYXMgdGhlIGRhdGFwbGFuZQ0KPiBzaG91bGQNCj4gPiA+IGhhdmUgYmVlbiBtb3ZlZCBiYWNr
IG9udG8gUUVNVSdzIG1haW4gdGhyZWFkIGNvbnRleHQgYmVmb3JlIHRoZSByaW5nDQo+IGlzDQo+
ID4gPiB1bm1hcHBlZC4NCj4gPiA+DQo+ID4gPiBNeSBrbm93bGVkZ2Ugb2YgdGhpcyBjb2RlIGlz
IGZhaXJseSBsaW1pdGVkLCBzbyBjb3JyZWN0IG1lIGlmIEkgYW0NCj4gPiB3cm9uZy4NCj4gPiA+
DQo+ID4gPiBibGtfc2V0X2Fpb19jb250ZXh0KCkgd291bGQgc2V0IHRoZSBjb250ZXh0IGZvciB0
aGUgYmxvY2sgYWlvLiBBRkFJQ1QsDQo+ID4gPiB0aGUgb25seSBhaW8gZm9yIHRoZSBibG9jayBp
cyB4ZW5fYmxvY2tfY29tcGxldGVfYWlvKCkuDQo+ID4NCj4gPiBOb3QgcXVpdGUuIHhlbl9ibG9j
a19kYXRhcGxhbmVfc3RhcnQoKSBjYWxscw0KPiA+IHhlbl9kZXZpY2VfYmluZF9ldmVudF9jaGFu
bmVsKCkgYW5kIHRoYXQgd2lsbCBhZGQgYW4gZXZlbnQgY2hhbm5lbCBmZA0KPiBpbnRvDQo+ID4g
dGhlIGFpbyBjb250ZXh0LCBzbyB0aGUgc2hhcmVkIHJpbmcgaXMgcG9sbGVkIGJ5IHRoZSBpb3Ro
cmVhZCBhcyB3ZWxsIGFzDQo+ID4gYmxvY2sgaS9vIGNvbXBsZXRpb24uDQo+ID4NCj4gPiA+DQo+
ID4gPiBJbiB0aGUgc3RhY2sgYWJvdmUsIHdlIGFyZSBub3QgZGVhbGluZyB3aXRoIGEgYmxvY2sg
YWlvIGJ1dCBhbiBhaW8gdGllDQo+ID4gPiB0byB0aGUgZXZlbnQgY2hhbm5lbCAoc2VlIHRoZSBj
YWxsIGZyb20geGVuX2RldmljZV9wb2xsKS4gU28gSSBkb24ndA0KPiA+ID4gdGhpbmsgdGhlIGJs
a19zZXRfYWlvX2NvbnRleHQoKSB3b3VsZCBhZmZlY3QgdGhlIGFpby4NCj4gPiA+DQo+ID4NCj4g
PiBGb3IgdGhlIHJlYXNvbiBJIG91dGxpbmUgYWJvdmUsIGl0IGRvZXMuDQo+ID4NCj4gPiA+IFNv
IGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIGdldCB0aGUgaW90aHJlYWQgcnVubmluZyBiZWNhdXNl
IHdlDQo+IHJlY2VpdmVkDQo+ID4gPiBhIG5vdGlmaWNhdGlvbiBvbiB0aGUgZXZlbnQgY2hhbm5l
bCB3aGlsZSB3ZSBhcmUgc3RvcHBpbmcgdGhlIGJsb2NrDQo+IChpLmUNCj4gPiA+IHhlbl9ibG9j
a19kYXRhcGxhbmVfc3RvcCgpKS4NCj4gPiA+DQo+ID4NCj4gPiBXZSBzaG91bGQgYXNzdW1lIGFu
IGlvdGhyZWFkIGNhbiBlc3NlbnRpYWxseSBydW4gYXQgYW55IHRpbWUsIGFzIGl0IGlzIGENCj4g
PiBwb2xsaW5nIGVudGl0eS4gSXQgc2hvdWxkIGV2ZW50dWFsbHkgYmxvY2sgcG9sbGluZyBvbiBm
ZHMgYXNzaWduIHRvIGl0cw0KPiA+IGFpbyBjb250ZXh0IGJ1dCBJIGRvbid0IHRoaW5rIHRoZSBh
YnN0cmFjdGlvbiBndWFyYW50ZWVzIHRoYXQgaXQgY2Fubm90DQo+IGJlDQo+ID4gYXdva2VuIGZv
ciBvdGhlciByZWFzb25zIChlLmcuIG9mZiBhIHRpbWVvdXQpLiBIb3dldmVyIGFuZCBldmVudCBm
cm9tDQo+IHRoZQ0KPiA+IGZyb250ZW5kIHdpbGwgY2VydGFpbmx5IGNhdXNlIHRoZSBldnRjaG4g
ZmQgcG9sbCB0byB3YWtlIHVwLg0KPiA+DQo+ID4gPiBJZiB4ZW5fYmxvY2tfZGF0YXBsYW5lX3N0
b3AoKSBncmFiIHRoZSBjb250ZXh0IGxvY2sgZmlyc3QsIHRoZW4gdGhlDQo+ID4gPiBpb3RocmVh
ZCBkZWFsaW5nIHdpdGggdGhlIGV2ZW50IG1heSB3YWl0IG9uIHRoZSBsb2NrIHVudGlsIGl0cw0K
PiByZWxlYXNlZC4NCj4gPiA+DQo+ID4gPiBCeSB0aGUgdGltZSB0aGUgbG9jayBpcyBncmFiYmVk
LCB3ZSBtYXkgaGF2ZSBmcmVlIGFsbCB0aGUgcmVzb3VyY2VzDQo+ID4gPiAoaW5jbHVkaW5nIHNy
aW5ncykuIFNvIHRoZSBldmVudCBpb3RocmVhZCB3aWxsIGVuZCB1cCB0byBkZXJlZmVyZW5jZSBh
DQo+ID4gPiBOVUxMIHBvaW50ZXIuDQo+ID4gPg0KPiA+DQo+ID4gSSB0aGluayB0aGUgcHJvYmxl
bSBtYXkgYWN0dWFsbHkgYmUgdGhhdCB4ZW5fYmxvY2tfZGF0YXBsYW5lX2V2ZW50KCkNCj4gZG9l
cw0KPiA+IG5vdCBhY3F1aXJlIHRoZSBjb250ZXh0IGFuZCB0aHVzIGlzIG5vdCBzeW5jaHJvbml6
ZWQgd2l0aA0KPiA+IHhlbl9ibG9ja19kYXRhcGxhbmVfc3RvcCgpLiBUaGUgZG9jdW1lbnRhdGlv
biBpbiBtdWx0aXBsZS1pb3RocmVhZHMudHh0DQo+IGlzDQo+ID4gbm90IGNsZWFyIHdoZXRoZXIg
YSBwb2xsIGhhbmRsZXIgY2FsbGVkIGJ5IGFuIGlvdGhyZWFkIG5lZWRzIHRvIGFjcXVpcmUNCj4g
PiB0aGUgY29udGV4dCB0aG91Z2g7IFRCSCBJIHdvdWxkIG5vdCBoYXZlIHRob3VnaHQgaXQgbmVj
ZXNzYXJ5Lg0KPiA+DQo+ID4gPiBJdCBmZWVscyB0byBtZSB3ZSBuZWVkIGEgd2F5IHRvIHF1aWVz
Y2UgYWxsIHRoZSBpb3RocmVhZHMgKGJsaywNCj4gPiA+IGV2ZW50LC4uLikgYmVmb3JlIGNvbnRp
bnVpbmcuIEJ1dCBJIGFtIGEgYml0IHVuc3VyZSBob3cgdG8gZG8gdGhpcyBpbg0KPiA+ID4gUUVN
VS4NCj4gPiA+DQo+ID4NCj4gPiBMb29raW5nIGF0IHZpcnRpby1ibGsuYyBJIHNlZSB0aGF0IGl0
IGRvZXMgc2VlbSB0byBjbG9zZSBvZmYgaXRzIGV2dGNobg0KPiA+IGVxdWl2YWxlbnQgZnJvbSBp
b3RocmVhZCBjb250ZXh0IHZpYSBhaW9fd2FpdF9iaF9vbmVzaG90KCkuIFNvIEkgd29uZGVyDQo+
ID4gd2hldGhlciB0aGUgJ3JpZ2h0JyB0aGluZyB0byBkbyBpcyB0byBjYWxsDQo+ID4geGVuX2Rl
dmljZV91bmJpbmRfZXZlbnRfY2hhbm5lbCgpIHVzaW5nIHRoZSBzYW1lIG1lY2hhbmlzbSB0byBl
bnN1cmUNCj4gPiB4ZW5fYmxvY2tfZGF0YXBsYW5lX2V2ZW50KCkgY2FuJ3QgcmFjZS4NCj4gDQo+
IERpZ2dpbmcgYXJvdW5kIHRoZSB2aXJ0aW8tYmxrIGhpc3RvcnkgSSBzZWU6DQo+IA0KPiBjb21t
aXQgMTAxMGNhZGY2MjMzMjAxNzY0OGFiZWUwZDdhM2RjN2YyZWVmOTYzMg0KPiBBdXRob3I6IFN0
ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4NCj4gRGF0ZTogICBXZWQgTWFyIDcg
MTQ6NDI6MDMgMjAxOCArMDAwMA0KPiANCj4gICAgIHZpcnRpby1ibGs6IGZpeCByYWNlIGJldHdl
ZW4gLmlvZXZlbnRmZF9zdG9wKCkgYW5kIHZxIGhhbmRsZXINCj4gDQo+ICAgICBJZiB0aGUgbWFp
biBsb29wIHRocmVhZCBpbnZva2VzIC5pb2V2ZW50ZmRfc3RvcCgpIGp1c3QgYXMgdGhlIHZxDQo+
IGhhbmRsZXINCj4gICAgIGZ1bmN0aW9uIGJlZ2lucyBpbiB0aGUgSU9UaHJlYWQgdGhlbiB0aGUg
aGFuZGxlciBtYXkgbG9zZSB0aGUgcmFjZSBmb3INCj4gICAgIHRoZSBBaW9Db250ZXh0IGxvY2su
ICBCeSB0aGUgdGltZSB0aGUgdnEgaGFuZGxlciBpcyBhYmxlIHRvIGFjcXVpcmUNCj4gdGhlDQo+
ICAgICBBaW9Db250ZXh0IGxvY2sgdGhlIGlvZXZlbnRmZCBoYXMgYWxyZWFkeSBiZWVuIHJlbW92
ZWQgYW5kIHRoZSBoYW5kbGVyDQo+ICAgICBpc24ndCBzdXBwb3NlZCB0byBydW4gYW55bW9yZSEN
Cj4gDQo+ICAgICBVc2UgdGhlIG5ldyBhaW9fd2FpdF9iaF9vbmVzaG90KCkgZnVuY3Rpb24gdG8g
cGVyZm9ybSBpb2V2ZW50ZmQNCj4gcmVtb3ZhbA0KPiAgICAgZnJvbSB3aXRoaW4gdGhlIElPVGhy
ZWFkLiAgVGhpcyB3YXkgbm8gcmFjZXMgd2l0aCB0aGUgdnEgaGFuZGxlciBhcmUNCj4gICAgIHBv
c3NpYmxlLg0KPiANCj4gICAgIFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4NCj4gICAgIFJldmlld2VkLWJ5OiBGYW0gWmhlbmcgPGZhbXpAcmVkaGF0
LmNvbT4NCj4gICAgIEFja2VkLWJ5OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29t
Pg0KPiAgICAgTWVzc2FnZS1pZDogMjAxODAzMDcxNDQyMDUuMjA2MTktMy1zdGVmYW5oYUByZWRo
YXQuY29tDQo+ICAgICBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJl
ZGhhdC5jb20+DQo+IA0KPiAuLi5zbyBJIHRoaW5rIHhlbi1ibG9jayBoYXMgZXhhY3RseSB0aGUg
c2FtZSBwcm9ibGVtLiBJIHRoaW5rIHdlIG1heSBhbHNvDQo+IGJlIG1pc3NpbmcgYSBxZW11X2Jo
X2NhbmNlbCgpIHRvIG1ha2Ugc3VyZSBibG9jayBhaW8gY29tcGxldGlvbnMgYXJlDQo+IHN0b3Bw
ZWQuIEknbGwgcHJlcCBhIHBhdGNoLg0KPiANCg0KSGF2aW5nIGRpc2N1c3NlZCB3aXRoIEp1bGll
biBvZmYtbGlzdCwgd2UgYWdyZWVkIHRoYXQgdGhlIG9uZXNob3QgaGFuZGxlciBtYXkgYmUgb3Zl
cmx5IGVsYWJvcmF0ZSBmb3Igb3VyIHB1cnBvc2VzIGFuZCBhY3R1YWxseSBkZXN0cm95aW5nIHRo
ZSBldmVudCBjaGFubmVsIGF0IHRoYXQgcG9pbnQgd2lsbCBzdGlsbCBwb3NlIHByb2JsZW1zIGZv
ciBwZW5kaW5nIGFpby4gV2hhdCB3ZSByZWFsbHkgbmVlZCBpcyBhbiBlcXVpdmFsZW50IG9mIGJs
a19zZXRfYWlvX2NvbnRleHQoKSBmb3IgZXZlbnQgY2hhbm5lbHMuDQoNCiAgUGF1bA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
