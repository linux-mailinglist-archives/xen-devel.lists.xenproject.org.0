Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A1815140C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 02:49:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iynIY-0003kh-E4; Tue, 04 Feb 2020 01:46:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Mmy=3Y=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iynIX-0003kc-Ae
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 01:46:41 +0000
X-Inumbo-ID: 2fd461fe-46f0-11ea-8eb4-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2fd461fe-46f0-11ea-8eb4-12813bfff9fa;
 Tue, 04 Feb 2020 01:46:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 17:46:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="310899276"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga001.jf.intel.com with ESMTP; 03 Feb 2020 17:46:39 -0800
Received: from fmsmsx162.amr.corp.intel.com (10.18.125.71) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 17:46:38 -0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 fmsmsx162.amr.corp.intel.com (10.18.125.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 17:46:38 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.222]) with mapi id 14.03.0439.000;
 Tue, 4 Feb 2020 09:46:36 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 1/2] nvmx: implement support for MSR bitmaps
Thread-Index: AQHV2rix/ohhAOsbKEmJiC4qE6Jv5qgKQvqg
Date: Tue, 4 Feb 2020 01:46:35 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7659A8@SHSMSX104.ccr.corp.intel.com>
References: <20200203173728.18135-1-roger.pau@citrix.com>
 <20200203173728.18135-2-roger.pau@citrix.com>
In-Reply-To: <20200203173728.18135-2-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjU2NDU4NTgtMGJmZC00NzNjLWJmNDEtODcyYThmM2YzMThhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaUp3YlNueHoybjZiSjRHUGQwOTczSHNROXc1THBpd1FUSlJMZHV3Q0ZFeThJVXhwUXFVbEFjZW1zOVNNUXRveiJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 1/2] nvmx: implement support for MSR
 bitmaps
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBU
dWVzZGF5LCBGZWJydWFyeSA0LCAyMDIwIDE6MzcgQU0NCj4gDQo+IEN1cnJlbnQgaW1wbGVtZW50
YXRpb24gb2YgbmVzdGVkIFZNWCBoYXMgYSBoYWxmIGJha2VkIGhhbmRsaW5nIG9mIE1TUg0KPiBi
aXRtYXBzIGZvciB0aGUgTDEgVk1NOiBpdCBtYXBzIHRoZSBMMSBWTU0gcHJvdmlkZWQgTVNSIGJp
dG1hcCwgYnV0DQo+IGRvZXNuJ3QgYWN0dWFsbHkgbG9hZCBpdCBpbnRvIHRoZSBuZXN0ZWQgdm1j
cywgYW5kIHRodXMgdGhlIG5lc3RlZA0KPiBndWVzdCB2bWNzIGVuZHMgdXAgdXNpbmcgdGhlIHNh
bWUgTVNSIGJpdG1hcCBhcyB0aGUgTDEgVk1NLg0KPiANCj4gVGhpcyBpcyB3cm9uZyBhcyB0aGVy
ZSdzIG5vIGFzc3VyYW5jZSB0aGF0IHRoZSBzZXQgb2YgZmVhdHVyZXMgZW5hYmxlZA0KPiBmb3Ig
dGhlIEwxIHZtY3MgYXJlIHRoZSBzYW1lIHRoYXQgTDEgaXRzZWxmIGlzIGdvaW5nIHRvIHVzZSBp
biB0aGUNCj4gbmVzdGVkIHZtY3MsIGFuZCB0aHVzIGNhbiBsZWFkIHRvIG1pc2NvbmZpZ3VyYXRp
b25zLg0KPiANCj4gRm9yIGV4YW1wbGUgTDEgdm1jcyBjYW4gdXNlIHgyQVBJQyB2aXJ0dWFsaXph
dGlvbiBhbmQgdmlydHVhbA0KPiBpbnRlcnJ1cHQgZGVsaXZlcnksIGFuZCB0aHVzIHNvbWUgeDJB
UElDIE1TUnMgd29uJ3QgYmUgdHJhcHBlZCBzbyB0aGF0DQo+IHRoZXkgY2FuIGJlIGhhbmRsZWQg
ZGlyZWN0bHkgYnkgdGhlIGhhcmR3YXJlIHVzaW5nIHZpcnR1YWxpemF0aW9uDQo+IGV4dGVuc2lv
bnMuIE9uIHRoZSBvdGhlciBoYW5kLCB0aGUgbmVzdGVkIHZtY3MgY3JlYXRlZCBieSBMMSBWTU0g
bWlnaHQNCj4gbm90IHVzZSBhbnkgb2Ygc3VjaCBmZWF0dXJlcywgc28gdXNpbmcgYSBNU1IgYml0
bWFwIHRoYXQgZG9lc24ndCB0cmFwDQo+IGFjY2Vzc2VzIHRvIHRoZSB4MkFQSUMgTVNScyB3aWxs
IGJlIGxlYWtpbmcgdGhlbSB0byB0aGUgdW5kZXJseWluZw0KPiBoYXJkd2FyZS4NCj4gDQo+IEZp
eCB0aGlzIGJ5IGNyYWZ0aW5nIGEgbWVyZ2VkIE1TUiBiaXRtYXAgYmV0d2VlbiB0aGUgb25lIHVz
ZWQgYnkgTDENCj4gYW5kIHRoZSBuZXN0ZWQgZ3Vlc3QuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtl
dmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
