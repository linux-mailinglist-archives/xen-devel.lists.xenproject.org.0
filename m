Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30988116C9C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 12:57:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHdU-0001nC-4t; Mon, 09 Dec 2019 11:55:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieHdS-0001n0-OJ
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 11:55:30 +0000
X-Inumbo-ID: cbbdd50c-1a7a-11ea-87c2-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cbbdd50c-1a7a-11ea-87c2-12813bfff9fa;
 Mon, 09 Dec 2019 11:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575892530; x=1607428530;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aWasGmz+bTmJrkGuU+RmqPYMM43/nlmyotsLJ9o3E3A=;
 b=ZvkLuQm432acAw4sMkesAwETWdr5Vz6NQhzzWkqwulsJ1MTaqGznd0z2
 bpvq9PBxI0k/aoCpyYwSBSRdRb2FAKEarTKbmeLcfKnNlL0YARF88nbIm
 OOOw8+uXEARl8V4fTPVuv5hAwJWj/pkQugWtEjznUcnkJxuisQANvmeeo s=;
IronPort-SDR: HQzdBu1+sfRLXwy9+zOZLX9Kf4OoivonlUlEksaH/jagwQ/ic9taOMbsky0hrCSuQziNX1KFPp
 DwhliXnq0cuA==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; 
   d="scan'208";a="8243588"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 09 Dec 2019 11:55:26 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 5380FA2171; Mon,  9 Dec 2019 11:55:24 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 11:55:24 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 11:55:23 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 11:55:23 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/4] xenbus: move xenbus_dev_shutdown() into frontend
 code...
Thread-Index: AQHVq3SBpbAngA4d/022sf0VDQe5p6exsiGAgAAEKtA=
Date: Mon, 9 Dec 2019 11:55:23 +0000
Message-ID: <bd8a9c19fd944e0faf7a36354db2d495@EX13D32EUC003.ant.amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-2-pdurrant@amazon.com>
 <38908166-6a4b-9dab-144c-71df691da167@suse.com>
In-Reply-To: <38908166-6a4b-9dab-144c-71df691da167@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.211]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 1/4] xenbus: move xenbus_dev_shutdown() into
 frontend code...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkgMTE6MzQNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOw0KPiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEJvcmlzIE9zdHJv
dnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4g
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS80XSB4ZW5i
dXM6IG1vdmUgeGVuYnVzX2Rldl9zaHV0ZG93bigpIGludG8gZnJvbnRlbmQNCj4gY29kZS4uLg0K
PiANCj4gT24gMDUuMTIuMTkgMTU6MDEsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiAuLi5hbmQg
bWFrZSBpdCBzdGF0aWMNCj4gPg0KPiA+IHhlbmJ1c19kZXZfc2h1dGRvd24oKSBpcyBzZWVtaW5n
bHkgaW50ZW5kZWQgdG8gY2F1c2UgY2xlYW4gc2h1dGRvd24gb2YNCj4gUFYNCj4gPiBmcm9udGVu
ZHMgd2hlbiBhIGd1ZXN0IGlzIHJlYm9vdGVkLiBJbmRlZWQgdGhlIGZ1bmN0aW9uIHdhaXRzIGZv
ciBhDQo+ID4gY29ucGxldGlvbiB3aGljaCBpcyBvbmx5IHNldCBieSBhIGNhbGwgdG8geGVuYnVz
X2Zyb250ZW5kX2Nsb3NlZCgpLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCByZW1vdmVzIHRoZSBzaHV0
ZG93bigpIG1ldGhvZCBmcm9tIGJhY2tlbmRzIGFuZCBtb3Zlcw0KPiA+IHhlbmJ1c19kZXZfc2h1
dGRvd24oKSBmcm9tIHhlbmJ1c19wcm9iZS5jIGludG8geGVuYnVzX3Byb2JlX2Zyb250ZW5kLmMs
DQo+ID4gcmVuYW1pbmcgaXQgYXBwcm9wcmlhdGVseSBhbmQgbWFraW5nIGl0IHN0YXRpYy4NCj4g
DQo+IElzIHRoaXMgYSBnb29kIG1vdmUgY29uc2lkZXJpbmcgZHJpdmVyIGRvbWFpbnM/DQoNCkkg
ZG9uJ3QgdGhpbmsgaXQgY2FuIGhhdmUgZXZlciB3b3JrZWQgcHJvcGVybHkgZm9yIGRyaXZlciBk
b21haW5zLCBhbmQgd2l0aCB0aGUgcmVzdCBvZiB0aGUgcGF0Y2hlcyBhIGJhY2tlbmQgc2hvdWxk
IGJlIGFibGUgZ28gYXdheSBhbmQgcmV0dXJuIHVuYW5ub3VuY2VkIChhcyBsb25nIGFzIHRoZSBk
b21haW4gaWQgaXMga2VwdC4uLiBmb3Igd2hpY2ggcGF0Y2hlcyBuZWVkIHRvIGJlIHVwc3RyZWFt
ZWQgaW50byBYZW4pLg0KDQo+IA0KPiBBdCBsZWFzdCBJJ2QgZXhwZWN0IHRoZSBjb21taXQgbWVz
c2FnZSBhZGRyZXNzaW5nIHRoZSBleHBlY3RlZCBiZWhhdmlvcg0KPiB3aXRoIHJlYm9vdGluZyBh
IGRyaXZlciBkb21haW4gYW5kIHdoeSB0aGlzIHBhdGNoIGlzbid0IG1ha2luZyB0aGluZ3MNCj4g
d29yc2UuDQo+IA0KDQpGb3IgYSBjbGVhbiByZWJvb3QgSSdkIGV4cGVjdCB0aGUgdG9vbHN0YWNr
IHRvIHNodXQgZG93biB0aGUgcHJvdG9jb2wgYmVmb3JlIHJlYm9vdGluZyB0aGUgZHJpdmVyIGRv
bWFpbiwgc28gdGhlIGJhY2tlbmQgc2h1dGRvd24gbWV0aG9kIGlzIG1vb3QuIEFuZCBJIGRvbid0
IGJlbGlldmUgcmUtc3RhcnRhYmxlIGRyaXZlciBkb21haW5zIHdlcmUgc29tZXRoaW5nIHRoYXQg
ZXZlciBtYWRlIGl0IGludG8gc3VwcG9ydCAoYmVjYXVzZSBvZiB0aGUgbm9uLXBlcnNpc3RlbnQg
ZG9taWQgcHJvYmxlbSkuIEkgY2FuIGFkZCBzb21ldGhpbmcgdG8gdGhlIGNvbW1pdCBjb21tZW50
IHRvIHRoYXQgZWZmZWN0IGlmIHlvdSdkIGxpa2UuDQoNCiAgUGF1bA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
