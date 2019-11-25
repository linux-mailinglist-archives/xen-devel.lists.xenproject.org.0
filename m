Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73A6108A01
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 09:26:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZ9ei-0002Qv-UY; Mon, 25 Nov 2019 08:23:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z5e+=ZR=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iZ9eh-0002Qo-VX
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 08:23:35 +0000
X-Inumbo-ID: deef8ffe-0f5c-11ea-a38a-12813bfff9fa
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id deef8ffe-0f5c-11ea-a38a-12813bfff9fa;
 Mon, 25 Nov 2019 08:23:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Nov 2019 00:23:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,241,1571727600"; d="scan'208";a="202274107"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga008.jf.intel.com with ESMTP; 25 Nov 2019 00:23:32 -0800
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 25 Nov 2019 00:23:33 -0800
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx115.amr.corp.intel.com (10.18.116.19) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 25 Nov 2019 00:23:32 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.127]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.60]) with mapi id 14.03.0439.000;
 Mon, 25 Nov 2019 16:23:31 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/2] x86/vtx: Fix fault semantics for early task switch
 failures
Thread-Index: AQHVoLlZqpeUT9aZRku8H/J9OhAPpqebkWvw
Date: Mon, 25 Nov 2019 08:23:31 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D60EA1F@SHSMSX104.ccr.corp.intel.com>
References: <20191121221551.1175-1-andrew.cooper3@citrix.com>
 <20191121221551.1175-2-andrew.cooper3@citrix.com>
In-Reply-To: <20191121221551.1175-2-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTFmYTZmYjctZDg3NC00NWI4LWFjNmItOWMyNmIyOTBlMWIyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTzNaYkNSdEY0Q01ZUmsyVHdvbnFDbnlKOUxtUXdjc2ZSYkFDeEtcLzdUNmZ2TXcyNHdRcXR2OTNSQndZYTNBN0wifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] x86/vtx: Fix fault semantics for early
 task switch failures
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
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAyMiwgMjAxOSA2OjE2IEFNDQo+IA0KPiBUaGUgVlQt
eCB0YXNrIHN3aXRjaCBoYW5kbGVyIGFkZHMgaW5zdF9sZW4gdG8gcmlwIGJlZm9yZSBjYWxsaW5n
DQo+IGh2bV90YXNrX3N3aXRjaCgpLiAgVGhpcyBjYXVzZXMgZWFybHkgZmF1bHRzIHRvIGJlIGRl
bGl2ZXJlZCB0byB0aGUgZ3Vlc3QNCj4gd2l0aA0KPiB0cmFwIHNlbWFudGljcywgYW5kIGJyZWFr
IHJlc3RhcnRpYmlsaXR5Lg0KPiANCj4gSW5zdGVhZCwgcGFzcyB0aGUgaW5zdHJ1Y3Rpb24gbGVu
Z3RoIGludG8gaHZtX3Rhc2tfc3dpdGNoKCkgYW5kIHdyaXRlIGl0IGludG8NCj4gdGhlIG91dGdv
aW5nIHRzcyBvbmx5LCBsZWF2aW5nIHJpcCBpbiBpdHMgb3JpZ2luYWwgbG9jYXRpb24uDQo+IA0K
PiBGb3Igbm93LCBwYXNzIDAgb24gdGhlIFNWTSBzaWRlLiAgVGhpcyBoaWdobGlnaHRzIGEgc2Vw
YXJhdGUgcHJlZXhpc3RpbmcgYnVnDQo+IHdoaWNoIHdpbGwgYmUgYWRkcmVzc2VkIGluIHRoZSBm
b2xsb3dpbmcgcGF0Y2guDQo+IA0KPiBXaGlsZSBhZGp1c3RpbmcgY2FsbCBzaXRlcywgZHJvcCB0
aGUgdW5uZWNlc3NhcnkgdWludDE2X3QgY2FzdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZp
biBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
