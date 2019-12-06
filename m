Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E3E115700
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 19:12:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idI3I-0003Jx-KB; Fri, 06 Dec 2019 18:10:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FJ2M=Z4=amazon.de=prvs=2369f9c3a=snu@srs-us1.protection.inumbo.net>)
 id 1idI3H-0003Cf-Pq
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 18:10:03 +0000
X-Inumbo-ID: 9fab51c0-1853-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fab51c0-1853-11ea-b6f1-bc764e2007e4;
 Fri, 06 Dec 2019 18:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1575655803; x=1607191803;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=dFhaFDujFZfaC5uj3WUWdWQ8zfUQNHRGBKSseh0hxLQ=;
 b=T+iQdzs3iQdZuUMR/mJh4xhjVQwYfgXEAXsdE/8NHe1Xz8OQz5enzhQB
 9/NunzwtY68Ovvt6U5uecXO1nBjrk2IMzIRYQMT5RBOK+AzN0qkVybSsc
 W63uwYe7I0/lADGsADCa2ksrJLXobKMM0LTA1eQHHfnvCV7dj1TuWokm/ U=;
IronPort-SDR: tZqk2ZEjNYjIHwc9OpRYYG3dgq06CmpVOaANoh8yxuiHx7VmoZvgpJ0peZSt5NpXzIfoPFFNaj
 nOklWwq3B4RQ==
X-IronPort-AV: E=Sophos;i="5.69,285,1571702400"; d="scan'208";a="12071804"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 06 Dec 2019 18:09:51 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id ABF27A2367; Fri,  6 Dec 2019 18:09:49 +0000 (UTC)
Received: from EX13D07EUB003.ant.amazon.com (10.43.166.173) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Dec 2019 18:09:49 +0000
Received: from EX13D07EUB004.ant.amazon.com (10.43.166.234) by
 EX13D07EUB003.ant.amazon.com (10.43.166.173) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Dec 2019 18:09:48 +0000
Received: from EX13D07EUB004.ant.amazon.com ([10.43.166.234]) by
 EX13D07EUB004.ant.amazon.com ([10.43.166.234]) with mapi id 15.00.1367.000;
 Fri, 6 Dec 2019 18:09:48 +0000
From: "Nuernberger, Stefan" <snu@amazon.de>
To: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "Nuernberger,
 Stefan" <snu@amazon.de>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH] xen/pciback: Prevent NULL pointer dereference in
 quirks_show
Thread-Index: AQHVrDvmewMicN/JcUO9mDMvMIw7UKetNk+AgAAx6YA=
Date: Fri, 6 Dec 2019 18:09:48 +0000
Message-ID: <1575655787.7257.42.camel@amazon.de>
References: <20191206134804.4537-1-snu@amazon.com>
 <9917a357-12f6-107f-e08d-33e464036317@oracle.com>
In-Reply-To: <9917a357-12f6-107f-e08d-33e464036317@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.160.109]
Content-ID: <1B719AEC8F545740A90BC0053E29636F@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] xen/pciback: Prevent NULL pointer
 dereference in quirks_show
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "jgross@suse.com" <jgross@suse.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "ross.lagerwall@citrix.com" <ross.lagerwall@citrix.com>, "Seidel,
 Conny" <consei@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Dannowski,
 Uwe" <uwed@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDE5LTEyLTA2IGF0IDEwOjExIC0wNTAwLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6
DQo+IE9uIDEyLzYvMTkgODo0OCBBTSwgU3RlZmFuIE51ZXJuYmVyZ2VyIHdyb3RlOg0KPiA+IA0K
PiA+IEZyb206IFV3ZSBEYW5ub3dza2kgPHV3ZWRAYW1hem9uLmRlPg0KPiA+IA0KPiA+IFJlYWRp
bmcgL3N5cy9idXMvcGNpL2RyaXZlcnMvcGNpYmFjay9xdWlya3Mgd2hpbGUgdW5iaW5kaW5nIGNh
bg0KPiA+IHJlc3VsdA0KPiA+IGluIGRlcmVmZXJlbmNpbmcgYSBOVUxMIHBvaW50ZXIuIEluc3Rl
YWQsIHNraXAgcHJpbnRpbmcgaW5mb3JtYXRpb24NCj4gPiBhYm91dCB0aGUgZGFuZ2xpbmcgcXVp
cmsuDQo+ID4gDQo+ID4gUmVwb3J0ZWQtYnk6IENvbm55IFNlaWRlbCA8Y29uc2VpQGFtYXpvbi5k
ZT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBVd2UgRGFubm93c2tpIDx1d2VkQGFtYXpvbi5kZT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gTnVlcm5iZXJnZXIgPHNudUBhbWF6b24uY29tPg0KPiA+
IA0KPiA+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPiBDYzogc3RhYmxl
QHZnZXIua2VybmVsLm9yZw0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy94ZW4veGVuLXBjaWJhY2sv
cGNpX3N0dWIuYyB8IDIgKysNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIu
YyBiL2RyaXZlcnMveGVuL3hlbi0NCj4gPiBwY2liYWNrL3BjaV9zdHViLmMNCj4gPiBpbmRleCAw
OTc0MTBhN2NkYjcuLmRhNzI1ZTQ3NDI5NCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3hlbi94
ZW4tcGNpYmFjay9wY2lfc3R1Yi5jDQo+ID4gKysrIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2sv
cGNpX3N0dWIuYw0KPiA+IEBAIC0xMzQ2LDYgKzEzNDYsOCBAQCBzdGF0aWMgc3NpemVfdCBxdWly
a3Nfc2hvdyhzdHJ1Y3QNCj4gPiBkZXZpY2VfZHJpdmVyICpkcnYsIGNoYXIgKmJ1ZikNCj4gPiDC
oAkJCQnCoMKgwqBxdWlyay0+ZGV2aWQuc3ViZGV2aWNlKTsNCj4gPiDCoA0KPiA+IMKgCQlkZXZf
ZGF0YSA9IHBjaV9nZXRfZHJ2ZGF0YShxdWlyay0+cGRldik7DQo+ID4gKwkJaWYgKCFkZXZfZGF0
YSkNCj4gPiArCQkJY29udGludWU7DQo+ID4gwqANCj4gPiDCoAkJbGlzdF9mb3JfZWFjaF9lbnRy
eShjZmdfZW50cnksICZkZXZfZGF0YS0NCj4gPiA+Y29uZmlnX2ZpZWxkcywgbGlzdCkgew0KPiBD
b3VsZG4ndCB5b3UgaGF2ZSB0aGUgc2FtZSByYWNlIGhlcmU/DQoNCk5vdCBxdWl0ZSB0aGUgc2Ft
ZSwgYnV0IGl0IG1pZ2h0IG5vdCBiZSBlbnRpcmVseSBzYWZlIHlldC4gVGhlDQoncXVpcmtzX3No
b3cnIHRha2VzIHRoZSAnZGV2aWNlX2lkc19sb2NrJyBhbmQgcmFjZXMgd2l0aCB1bmJpbmQgLw0K
J3BjaXN0dWJfZGV2aWNlX3JlbGVhc2UnICJ3aGljaCB0YWtlcyBkZXZpY2VfbG9jayBtdXRleCIu
IFNvIHRoaXMgbWlnaHQNCm5vdyBiZSBhIFVBRiByZWFkIGFjY2VzcyBpbnN0ZWFkIG9mIGEgTlVM
TCBwb2ludGVyIGRlcmVmZXJlbmNlLiBXZSBoYXZlDQpub3Qgb2JzZXJ2ZWQgYWR2ZXJzYXJpYWwg
ZWZmZWN0cyBpbiBvdXIgdGVzdGluZyAoY29tcGFyZWQgdG8gdGhlDQpvYnZpb3VzIGlzc3VlcyB3
aXRoIE5VTEwgcG9pbnRlcikgYnV0IHRoYXQncyBub3QgYSBndWFyYW50ZWUgb2YgY291cnNlLg0K
DQpTbyBzaG91bGQgcXVpcmtzX3Nob3cgYWN0dWFsbHkgYmUgcHJvdGVjdGVkIGJ5IHBjaXN0dWJf
ZGV2aWNlc19sb2NrDQppbnN0ZWFkIGFzIGFyZSBvdGhlciBmdW5jdGlvbnMgdGhhdCBhY2Nlc3Mg
ZGV2X2RhdGE/IERvZXMgaXQgbmVlZCBib3RoDQpsb2NrcyBpbiB0aGF0IGNhc2U/DQoNCi1TdGVm
YW4NCg0KPiANCj4gLWJvcmlzDQo+IA0KPiA+IA0KPiA+IMKgCQkJZmllbGQgPSBjZmdfZW50cnkt
PmZpZWxkOwoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vu
c3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFl
Z2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5i
dXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3
OQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
