Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D0C7238B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 02:55:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hq5X0-00006d-FD; Wed, 24 Jul 2019 00:53:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FRib=VV=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hq5Wy-00006P-Fe
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 00:53:20 +0000
X-Inumbo-ID: 6ac02c9e-adad-11e9-8ba7-af9673ff77a7
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ac02c9e-adad-11e9-8ba7-af9673ff77a7;
 Wed, 24 Jul 2019 00:53:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 17:53:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; d="scan'208";a="180932364"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga002.jf.intel.com with ESMTP; 23 Jul 2019 17:53:13 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 23 Jul 2019 17:53:12 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 23 Jul 2019 17:53:12 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.110]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.55]) with mapi id 14.03.0439.000;
 Wed, 24 Jul 2019 08:53:10 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 06/13] x86/IOMMU: don't restrict IRQ affinities to
 online CPUs
Thread-Index: AQHVO6rllLEXcM8zx06+cTEbERg4TKbY/NWA
Date: Wed, 24 Jul 2019 00:53:10 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CADCC3C@SHSMSX104.ccr.corp.intel.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
 <923083ba-66f9-a88b-8909-a2f5e2808a69@suse.com>
In-Reply-To: <923083ba-66f9-a88b-8909-a2f5e2808a69@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZGQxZmMwM2EtYmNhNS00MjRjLWEyMjUtZmZmNjhiYjdjOGE0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWm5wU1FDUXJ1eUNHcXI5SEl6QmRmcXhxT3JVdXpCV3JPQ0pPN3l0MmI5MzlPQ3NoTW1nNUZGNTg4aURWREhxdyJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 06/13] x86/IOMMU: don't restrict IRQ
 affinities to online CPUs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQ0KPiBTZW50OiBU
dWVzZGF5LCBKdWx5IDE2LCAyMDE5IDM6NDEgUE0NCj4gDQo+IEluIGxpbmUgd2l0aCAieDg2L0lS
UTogZGVzYy0+YWZmaW5pdHkgc2hvdWxkIHN0cmljdGx5IHJlcHJlc2VudCB0aGUNCj4gcmVxdWVz
dGVkIHZhbHVlIiB0aGUgaW50ZXJuYWxseSB1c2VkIElSUShzKSBhbHNvIHNob3VsZG4ndCBiZSBy
ZXN0cmljdGVkDQo+IHRvIG9ubGluZSBvbmVzLiBNYWtlIHNldF9kZXNjX2FmZmluaXR5KCkgKHNl
dF9tc2lfYWZmaW5pdHkoKSB0aGVuIGRvZXMNCj4gYnkgaW1wbGljYXRpb24pIGNvcGUgd2l0aCBh
IE5VTEwgbWFzayBiZWluZyBwYXNzZWQgKGp1c3QgbGlrZQ0KPiBhc3NpZ25faXJxX3ZlY3Rvcigp
IGRvZXMpLCBhbmQgaGF2ZSBJT01NVSBjb2RlIHBhc3MgTlVMTCBpbnN0ZWFkIG9mDQo+ICZjcHVf
b25saW5lX21hcCAod2hlbiwgZm9yIFZULWQsIHRoZXJlJ3Mgbm8gTlVNQSBub2RlIGluZm9ybWF0
aW9uDQo+IGF2YWlsYWJsZSkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
