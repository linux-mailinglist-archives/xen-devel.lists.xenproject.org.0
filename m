Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F4D72389
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 02:55:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hq5VL-0008PM-KR; Wed, 24 Jul 2019 00:51:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FRib=VV=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hq5VK-0008PH-Ql
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 00:51:38 +0000
X-Inumbo-ID: 2df76296-adad-11e9-bcf5-fb1fdc44dd61
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2df76296-adad-11e9-bcf5-fb1fdc44dd61;
 Wed, 24 Jul 2019 00:51:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 17:51:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; d="scan'208";a="169723066"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga008.fm.intel.com with ESMTP; 23 Jul 2019 17:51:31 -0700
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 23 Jul 2019 17:51:31 -0700
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx120.amr.corp.intel.com (10.18.124.208) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 23 Jul 2019 17:51:31 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.110]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.232]) with mapi id 14.03.0439.000;
 Wed, 24 Jul 2019 08:51:29 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 1/4] iommu / x86: move call to scan_pci_devices()
 out of vendor code
Thread-Index: AQHVO7+ptzvGBy77eE617UiWwilaAqbY/DbA
Date: Wed, 24 Jul 2019 00:51:28 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CADCC0E@SHSMSX104.ccr.corp.intel.com>
References: <20190716101657.23327-1-paul.durrant@citrix.com>
 <20190716101657.23327-2-paul.durrant@citrix.com>
In-Reply-To: <20190716101657.23327-2-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDA1NGE5MjgtMTNhYi00ZmZmLTliYmYtMDEwODkyMmFlYjExIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTVwvZHArdUNZeDZEYXhxcVVzaGlxY1Z5WlJaOXNUdElJbUU5UmVzWTZJQjBwS1VxdlNtYVFSUTI5V1wvQ1pcL3JESyJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 1/4] iommu / x86: move call to
 scan_pci_devices() out of vendor code
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Brian Woods <brian.woods@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0NCj4g
U2VudDogVHVlc2RheSwgSnVseSAxNiwgMjAxOSA2OjE3IFBNDQo+IA0KPiBJdCdzIG5vdCB2ZW5k
b3Igc3BlY2lmaWMgc28gaXQgZG9lc24ndCByZWFsbHkgYmVsb25nIHRoZXJlLg0KPiANCj4gU2Nh
bm5pbmcgdGhlIFBDSSB0b3BvbG9neSBhbHNvIHJlYWxseSBkb2Vzbid0IGhhdmUgbXVjaCB0byBk
byB3aXRoIElPTU1VDQo+IGluaXRpYWxpemF0aW9uLiBJdCBkb2Vzbid0IGRlcGVuZCBvbiB0aGVy
ZSBldmVuIGJlaW5nIGFuIElPTU1VLiBUaGlzIHBhdGNoDQo+IG1vdmVzIHRvIHRoZSBjYWxsIHRv
IHRoZSBiZWdpbm5pbmcgb2YgaW9tbXVfaGFyZHdhcmVfc2V0dXAoKSBidXQgb25seQ0KPiBwbGFj
ZXMgaXQgdGhlcmUgYmVjYXVzZSB0aGUgdG9wb2xvZ3kgaW5mb3JtYXRpb24gd291bGQgYmUgb3Ro
ZXJ3aXNlIHVudXNlZC4NCj4gDQo+IFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIGFjdHVhbGx5IG1h
a2UgdXNlIG9mIHRoZSBQQ0kgdG9wb2xvZ3kgZHVyaW5nDQo+ICh4ODYpIElPTU1VIGluaXRpYWxp
emF0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRA
Y2l0cml4LmNvbT4NCj4gUmV2aWV3ZWQtYnk6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1
QGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVs
LmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
