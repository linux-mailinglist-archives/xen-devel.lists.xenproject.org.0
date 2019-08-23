Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 764559A5AB
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 04:41:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0zS2-0007qB-7Y; Fri, 23 Aug 2019 02:37:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VL6j=WT=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1i0zS0-0007q3-LE
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 02:37:16 +0000
X-Inumbo-ID: e961ed2c-c54e-11e9-b95f-bc764e2007e4
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e961ed2c-c54e-11e9-b95f-bc764e2007e4;
 Fri, 23 Aug 2019 02:37:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 19:37:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,419,1559545200"; d="scan'208";a="181583382"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga003.jf.intel.com with ESMTP; 22 Aug 2019 19:37:11 -0700
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 22 Aug 2019 19:37:11 -0700
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 22 Aug 2019 19:37:10 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.112]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.204]) with mapi id 14.03.0439.000;
 Fri, 23 Aug 2019 10:37:08 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/vvmx: Fix nested virt on VMCS-Shadow capable hardware
Thread-Index: AQHVRuUfGzDqLzmZSU2yLjwN1QadlKcIKDFA
Date: Fri, 23 Aug 2019 02:37:08 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D545937@SHSMSX104.ccr.corp.intel.com>
References: <20190730144255.6126-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190730144255.6126-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNThiMTM5OTAtYzQxZi00NjRkLWE1NzQtNjliNGRjZTM1NmE0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaWlnS0xtd3NTQ0tmVVJzVWFQQWlvTURRa2tqbEdxd3pDYUp4ek5HRG1oMDVESkRhaVg0OVViMEtnVWRxMVwvbkkifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: Fix nested virt on VMCS-Shadow
 capable hardware
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
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogVHVlc2RheSwgSnVseSAzMCwgMjAxOSAxMDo0MyBQTQ0KPiANCj4gYy9zIGU5OTg2
YjBkZCAieDg2L3Z2bXg6IFNpbXBsaWZ5IHBlci1DUFUgbWVtb3J5IGFsbG9jYXRpb25zIiBoYWQg
dGhlDQo+IHdyb25nDQo+IGluZGlyZWN0aW9uIG9uIGl0cyBwb2ludGVyIGNoZWNrIGluIG52bXhf
Y3B1X3VwX3ByZXBhcmUoKSwgY2F1c2luZyB0aGUNCj4gVk1DUy1zaGFkb3dpbmcgYnVmZmVyIG5l
dmVyIGJlIGFsbG9jYXRlZC4gIEZpeCBpdC4NCj4gDQo+IFRoaXMgaW4gdHVybiByZXN1bHRzIGlu
IGEgbWFzc2l2ZSBxdWFudGl0eSBvZiBsb2dzcGFtLCBhcyBldmVyeSB2aXJ0dWFsDQo+IHZtZW50
cnkvZXhpdCBoaXRzIGJvdGggZ2RwcmludGsoKXMgaW4gdGhlICpfYnVsaygpIGZ1bmN0aW9ucy4N
Cj4gDQo+IFN3aXRjaCB0aGVzZSB0byB1c2luZyBwcmludGtfb25jZSgpLiAgVGhlIHNpemUgb2Yg
dGhlIGJ1ZmZlciBpcyBjaG9zZW4gYXQNCj4gY29tcGlsZSB0aW1lLCBzbyBjb21wbGFpbmluZyBh
Ym91dCBpdCByZXBlYXRlZGx5IGlzIG9mIG5vIGJlbmVmaXQuDQo+IA0KPiBGaW5hbGx5LCBkcm9w
IHRoZSBydW50aW1lIE5VTEwgcG9pbnRlciBjaGVja3MuICBJdCBpcyBub3QgdGVycmlibHkgYXBw
cm9wcmlhdGUNCj4gdG8gYmUgcmVwZWF0ZWRseSBjaGVja2luZyBpbmZyYXN0cnVjdHVyZSB3aGlj
aCBpcyBzZXQgdXAgZnJvbSBzdGFydC1vZi1kYXksDQo+IGFuZCBpbiB0aGlzIGNhc2UsIGFjdHVh
bGx5IGhpZCB0aGUgYWJvdmUgYnVnLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4g
PGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
