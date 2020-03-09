Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CDB17D94F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 07:31:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBBtm-000109-M1; Mon, 09 Mar 2020 06:28:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZGpV=42=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jBBtl-000104-MU
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 06:28:21 +0000
X-Inumbo-ID: 2ae9e32c-61cf-11ea-abd4-12813bfff9fa
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ae9e32c-61cf-11ea-abd4-12813bfff9fa;
 Mon, 09 Mar 2020 06:28:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Mar 2020 23:27:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,532,1574150400"; d="scan'208";a="414707830"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga005.jf.intel.com with ESMTP; 08 Mar 2020 23:27:16 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 8 Mar 2020 23:27:15 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 8 Mar 2020 23:27:15 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 8 Mar 2020 23:27:15 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.50]) with mapi id 14.03.0439.000;
 Mon, 9 Mar 2020 14:27:13 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] VT-d: fix and extend RMRR reservation check
Thread-Index: AQHV7V8eTQ4+CKubykyXA8xZd0Ltgag/3K0Q
Date: Mon, 9 Mar 2020 06:27:12 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7C3BEB@SHSMSX104.ccr.corp.intel.com>
References: <e651d6f5-0331-4bf1-7385-e64dad3a1e8e@suse.com>
In-Reply-To: <e651d6f5-0331-4bf1-7385-e64dad3a1e8e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzUxZmM0Y2QtMTkyNC00NTRkLWE0N2YtNDBhMDA5OGUzZDU5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTHFKUG1pdVoxWFJEXC9WRnBxdFpRaDBsUFVuc3R0SzJsTFErY0E5T2RNREhzWUxhamJGdk5DOU52cW45cFEyWjkifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] VT-d: fix and extend RMRR reservation check
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

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBGZWJydWFyeSAyNywgMjAyMCA3OjE1IFBNDQo+IA0KPiBGaXJzdCBvZiBhbGwgaW4gY29tbWl0
IGQ2NTczYmM2ZTZiNyAoIlZULWQ6IGNoZWNrIGFsbCBvZiBhbiBSTVJSIGZvcg0KPiBiZWluZyBF
ODIwLXJlc2VydmVkIikgYWxvbmcgd2l0aCBjaGFuZ2luZyB0aGUgZnVuY3Rpb24gdXNlZCwgdGhl
IGVudW0tDQo+IGxpa2UgdmFsdWUgcGFzc2VkIHNob3VsZCBoYXZlIGJlZW4gY2hhbmdlZCB0b28g
KHRvIEU4MjBfKikuIERvIHNvIG5vdy4NCj4gKEx1Y2tpbHkgdGhlIGFjdHVhbCB2YWx1ZXMgb2Yg
UkFNX1RZUEVfUkVTRVJWRUQgYW5kIEU4MjBfUkVTRVJWRUQNCj4gbWF0Y2gsIHNvIHRoZSBicmVh
a2FnZSBpbnRyb2R1Y2VkIHdhcyAib25seSIgbGF0ZW50LikNCj4gDQo+IEZ1cnRoZXJtb3JlIG9u
ZSBvZiBteSBzeXN0ZW1zIHN1cmZhY2VzIFJNUlIgaW4gYW4gQUNQSSBOVlMgRTgyMCByYW5nZS4N
Cj4gVGhlIHB1cnBvc2Ugb2YgdGhlIGNoZWNrIGlzIGp1c3QgdG8gbWFrZSBzdXJlIHRoZXJlIHdv
bid0IGJlICJvcmRpbmFyeSINCj4gbWFwcGluZ3Mgb2YgdGhlc2UgcmFuZ2VzLCBhbmQgZG9tYWlu
cyAoaW5jbHVkaW5nIERvbTApIHdvbid0IHdhbnQgdG8NCj4gdXNlIHRoZSByZWdpb24gdG8gZS5n
LiBwdXQgUENJIGRldmljZSBCQVJzIHRoZXJlLiBUaGUgdHdvIEFDUEkgcmVsYXRlZA0KPiBFODIw
IHR5cGVzIGFyZSBnb29kIGVub3VnaCBmb3IgdGhpcyBwdXJwb3NlLCBzbyBhbGxvdyB0aGVtIGFz
IHdlbGwuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
