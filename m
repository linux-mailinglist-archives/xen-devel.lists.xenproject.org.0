Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C124BDADA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 11:23:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD3Sp-0003T1-6D; Wed, 25 Sep 2019 09:19:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R6jh=XU=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iD3Sn-0003Sr-OX
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 09:19:57 +0000
X-Inumbo-ID: a2ab9266-df75-11e9-bf31-bc764e2007e4
Received: from mga01.intel.com (unknown [192.55.52.88])
 by localhost (Halon) with ESMTPS
 id a2ab9266-df75-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 09:19:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 02:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,547,1559545200"; d="scan'208";a="191283036"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga003.jf.intel.com with ESMTP; 25 Sep 2019 02:19:53 -0700
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Sep 2019 02:19:53 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx116.amr.corp.intel.com (10.18.116.20) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Sep 2019 02:19:52 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.146]) with mapi id 14.03.0439.000;
 Wed, 25 Sep 2019 17:19:50 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] SVM: correct CPUID event processing
Thread-Index: AQHVbtZEZJW1x4X3c0WmKXXBRFVMpac8Jv+w
Date: Wed, 25 Sep 2019 09:19:50 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D58F892@SHSMSX104.ccr.corp.intel.com>
References: <845737d3-e16e-61d7-7733-0f8b9eddfb45@suse.com>
In-Reply-To: <845737d3-e16e-61d7-7733-0f8b9eddfb45@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGYwMGUzOGQtNTY1MS00NDUyLTk4NDQtN2MxNGQ4MDk4YThjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidjhSZldya1BcL2FLMTA3bUJXcmFTWEFuU0pOenV0MHc3MmtIR09IcE1rTElRQ1V4bEFxeGhNZnpCTXNZRGlJQUYifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] SVM: correct CPUID event processing
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOmpiZXVsaWNoQHN1c2UuY29tXQ0KPiBTZW50OiBU
aHVyc2RheSwgU2VwdGVtYmVyIDE5LCAyMDE5IDY6MzggUE0NCj4gDQo+IGh2bV9tb25pdG9yX2Nw
dWlkKCkgZXhwZWN0cyB0aGUgaW5wdXQgcmVnaXN0ZXJzLCBub3QgdHdvIG9mIHRoZSBvdXRwdXRz
Lg0KPiANCj4gSG93ZXZlciwgb25jZSBoYXZpbmcgbWFkZSB0aGUgbmVjZXNzYXJ5IGFkanVzdG1l
bnQsIHRoZSBTVk0gYW5kIFZNWA0KPiBmdW5jdGlvbnMgYXJlIHNvIHNpbWlsYXIgdGhhdCB0aGV5
IHNob3VsZCBiZSBmb2xkZWQgKHRodXMgYXZvaWRpbmcNCj4gZnVydGhlciBzaW1pbGFyIGFzeW1t
ZXRyaWVzIHRvIGdldCBpbnRyb2R1Y2VkKS4gVXNlIHRoZSBiZXN0IG9mIGJvdGgNCj4gd29ybGRz
IGJ5IGUuZy4gdXNpbmcgImN1cnIiIGNvbnNpc3RlbnRseS4gVGhpcyB0aGVuIGJlaW5nIHRoZSBv
bmx5DQo+IGNhbGxlciBvZiBodm1fY2hlY2tfY3B1aWRfZmF1bHRpbmcoKSwgZm9sZCBpbiB0aGF0
IGZ1bmN0aW9uIGFzIHdlbGwuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQo+IA0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlh
bkBpbnRlbC5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
