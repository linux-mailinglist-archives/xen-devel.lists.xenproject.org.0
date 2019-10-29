Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F2EE8F74
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 19:42:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPWPF-0005sM-7b; Tue, 29 Oct 2019 18:39:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NXOE=YW=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iPWPC-0005sF-Q1
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 18:39:46 +0000
X-Inumbo-ID: 79a3a626-fa7b-11e9-9516-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79a3a626-fa7b-11e9-9516-12813bfff9fa;
 Tue, 29 Oct 2019 18:39:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 11:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,244,1569308400"; d="scan'208";a="203647934"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 29 Oct 2019 11:39:43 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 29 Oct 2019 11:39:42 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 29 Oct 2019 11:39:42 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.127]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.2]) with mapi id 14.03.0439.000;
 Wed, 30 Oct 2019 02:39:40 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 2/2] x86/vtx: Fixes to Haswell/Broadwell LBR TSX errata
Thread-Index: AQHVjaCp2IYi5uTBGE+7bYmv/pozV6dx9MXQ
Date: Tue, 29 Oct 2019 18:39:39 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D5DEEF9@SHSMSX104.ccr.corp.intel.com>
References: <20191028150152.21179-1-andrew.cooper3@citrix.com>
 <20191028150152.21179-3-andrew.cooper3@citrix.com>
In-Reply-To: <20191028150152.21179-3-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjU2MzNjMjAtYjNhZC00Zjg5LThhZGUtYjc2YTM2NDAxOTA1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiT0pOT2lJU2hHZkpZU1wvamd1QmJod1wvQzZwTmhoREpnZXFDWGtVaG9mdjlWaHZMbUZUY1FJdVJUaEEwSnVYNFE5In0=
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/2] x86/vtx: Fixes to Haswell/Broadwell LBR
 TSX errata
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
Cj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDI4LCAyMDE5IDExOjAyIFBNDQo+IA0KPiBDcm9zcyBy
ZWZlcmVuY2UgYW5kIGxpc3QgZWFjaCBlcnJhdGEsIG5vdyB0aGF0IHRoZXkgYXJlIHB1Ymxpc2hl
ZC4NCj4gDQo+IFRoZXNlIGVycmF0YSBhcmUgc3BlY2lmaWMgdG8gSGFzd2VsbC9Ccm9hZHdlbGwu
ICBUaGV5IHNob3VsZCBoYXZlIG1vZGVsDQo+IGFuZA0KPiB2ZW5kb3IgY2hlY2tzLCBhcyBJbnRl
bCBpc24ndCB0aGUgb25seSB2ZW5kb3IgdG8gaW1wbGVtZW50IFZULXguDQo+IA0KPiBBbGwgYWZm
ZWN0ZWQgbW9kZWxzIHVzZSB0aGUgc2FtZSBNU1IgaW5kaWNpZXMsIHNvIHRoZXNlIGNhbiBiZSBo
YXJkIGNvZGVkDQo+IHJhdGhlciB0aGFuIGxvb2tpbmcgdXAgYW5kIHN0b3JpbmcgY29uc3RhbnQg
dmFsdWVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
