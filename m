Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F9F162225
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 09:20:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3y4G-0000J2-8p; Tue, 18 Feb 2020 08:17:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qq7b=4G=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1j3y4F-0000Ix-47
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 08:17:19 +0000
X-Inumbo-ID: 13189a8e-5227-11ea-8119-12813bfff9fa
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13189a8e-5227-11ea-8119-12813bfff9fa;
 Tue, 18 Feb 2020 08:17:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 00:17:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,455,1574150400"; d="scan'208";a="228667278"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga008.jf.intel.com with ESMTP; 18 Feb 2020 00:17:15 -0800
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 18 Feb 2020 00:17:15 -0800
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx110.amr.corp.intel.com (10.18.116.10) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 18 Feb 2020 00:17:15 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.158]) with mapi id 14.03.0439.000;
 Tue, 18 Feb 2020 16:17:11 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v5 1/4] nvmx: implement support for MSR bitmaps
Thread-Index: AQHV5YfYLFBb4q+0VkO3xmUrJfHkL6ggnHdg
Date: Tue, 18 Feb 2020 08:17:11 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D78B190@SHSMSX104.ccr.corp.intel.com>
References: <20200217114545.71112-1-roger.pau@citrix.com>
 <20200217114545.71112-2-roger.pau@citrix.com>
In-Reply-To: <20200217114545.71112-2-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTQ5NGI3NzgtNzhiYS00MjlmLTg2ZDgtNGJmNTFhNmIyNzM5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUDUzdFBDMUFqRUZyZVFveXBPS29MTThTa1J1dnFPOHZlb1Z0YW1ZTnpcL3hyMis3dWs4NE82Zk9hOVU0aDdaYzgifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v5 1/4] nvmx: implement support for MSR
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBN
b25kYXksIEZlYnJ1YXJ5IDE3LCAyMDIwIDc6NDYgUE0NCj4gDQo+IEN1cnJlbnQgaW1wbGVtZW50
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
