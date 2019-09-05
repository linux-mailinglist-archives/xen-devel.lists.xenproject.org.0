Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D91CFA98CD
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 05:13:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5i9U-0005Wg-7g; Thu, 05 Sep 2019 03:09:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/IXJ=XA=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1i5i9T-0005Wb-8K
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 03:09:39 +0000
X-Inumbo-ID: 97a74b80-cf8a-11e9-b76c-bc764e2007e4
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97a74b80-cf8a-11e9-b76c-bc764e2007e4;
 Thu, 05 Sep 2019 03:09:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 20:09:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,469,1559545200"; d="scan'208";a="173790830"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga007.jf.intel.com with ESMTP; 04 Sep 2019 20:09:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 4 Sep 2019 20:09:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 4 Sep 2019 20:09:35 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 4 Sep 2019 20:09:34 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.53]) with mapi id 14.03.0439.000;
 Thu, 5 Sep 2019 11:09:33 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 2/3] VT-d: avoid PCI device lookup
Thread-Index: AQHVYySOT2l5YjeoAUysB4srFLbm4qccZ0kw
Date: Thu, 5 Sep 2019 03:09:32 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D563BF3@SHSMSX104.ccr.corp.intel.com>
References: <050de29e-5a10-8b4a-44f1-0241f4b33ee2@suse.com>
 <53d3e1ed-93c4-56de-dbb8-2517feaa93bb@suse.com>
In-Reply-To: <53d3e1ed-93c4-56de-dbb8-2517feaa93bb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGQ4ZWRlMTctMzlkYi00ZTU4LWEzZWEtZGI2OTdmMDQxMzExIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRFhFVlUwN3VEVXNGQzlcL1FJZDRYTzdsYit1eW1EdnZrQXorUjZaN3haV3VuYVhyTk5EcEhiTFpHcXdCdlZhZ0gifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/3] VT-d: avoid PCI device lookup
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOmpiZXVsaWNoQHN1c2UuY29tXQ0KPiBTZW50OiBX
ZWRuZXNkYXksIFNlcHRlbWJlciA0LCAyMDE5IDk6MjggUE0NCj4gDQo+IFRoZSB0d28gdXNlcyBv
ZiBwY2lfZ2V0X3BkZXZfYnlfZG9tYWluKCkgbGFjayBwcm9wZXIgbG9ja2luZywgYnV0IGFyZQ0K
PiBhbHNvIG9ubHkgdXNlZCB0byBnZXQgaG9sZCBvZiBhIE5VTUEgbm9kZSBJRC4gQ2FsY3VsYXRl
IGFuZCBzdG9yZSB0aGUNCj4gbm9kZSBJRCBlYXJsaWVyIG9uIGFuZCByZW1vdmUgdGhlIGxvb2t1
cHMgKGluIGxpZXUgb2YgZml4aW5nIHRoZQ0KPiBsb2NraW5nKS4NCj4gDQo+IFdoaWxlIGRvaW5n
IHRoaXMgaXQgYmVjYW1lIGFwcGFyZW50IHRoYXQgaW9tbXVfYWxsb2MoKSdzIHVzZSBvZg0KPiBh
bGxvY19wZ3RhYmxlX21hZGRyKCkgd291bGQgb2NjdXIgYmVmb3JlIFJIU0FzIHdvdWxkIGhhdmUg
YmVlbiBwYXJzZWQ6DQo+IGlvbW11X2FsbG9jKCkgZ2V0cyBjYWxsZWQgZnJvbSB0aGUgRFJIRCBw
YXJzaW5nIHJvdXRpbmUsIHdoaWNoIC0gb24NCj4gc3BlYyBjb25mb3JtaW5nIHBsYXRmb3JtcyAt
IGhhcHBlbnMgc3RyaWN0bHkgYmVmb3JlIFJIU0EgcGFyc2luZy4gRGVmZXINCj4gdGhlIGFsbG9j
YXRpb24gdW50aWwgYWZ0ZXIgYWxsIEFDUEkgdGFibGUgcGFyc2luZyBoYXMgZmluaXNoZWQsDQo+
IGVzdGFibGlzaGVkIHRoZSBub2RlIElEIHRoZXJlIGZpcnN0Lg0KPiANCj4gU3VnZ2VzdGVkLWJ5
OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRp
YW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
