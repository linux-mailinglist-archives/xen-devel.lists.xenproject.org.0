Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF1C141B3F
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jan 2020 03:47:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1it0aH-0004uM-VE; Sun, 19 Jan 2020 02:45:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxl7=3I=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1it0aG-0004uG-E9
 for xen-devel@lists.xenproject.org; Sun, 19 Jan 2020 02:45:04 +0000
X-Inumbo-ID: ab9d99aa-3a65-11ea-9fd7-bc764e2007e4
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab9d99aa-3a65-11ea-9fd7-bc764e2007e4;
 Sun, 19 Jan 2020 02:44:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jan 2020 18:44:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,336,1574150400"; d="scan'208";a="374019627"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga004.jf.intel.com with ESMTP; 18 Jan 2020 18:44:52 -0800
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 18 Jan 2020 18:44:13 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.197]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.28]) with mapi id 14.03.0439.000;
 Sun, 19 Jan 2020 10:44:10 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 7/8] x86/HVM: don't needlessly intercept
 APERF/MPERF/TSC MSR reads
Thread-Index: AQHVxK++ESh37tCKKkiO6pikiaY7safxWy0A
Date: Sun, 19 Jan 2020 02:44:10 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D739AB2@SHSMSX104.ccr.corp.intel.com>
References: <6f167053-38dc-19b5-a873-321d978e9a59@suse.com>
 <0d2c44ca-d3ce-bb83-e3fc-0e5037c90143@suse.com>
In-Reply-To: <0d2c44ca-d3ce-bb83-e3fc-0e5037c90143@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjM0NDRmZTktYmZkMC00MDZlLTkwYWEtMzQ4NWZlYzY5NzE0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibG5PcHdoK0ltbXJBb3lFbXVxMldDRGY0V0J6MFwvU3dJeDJcL1lORjRWYkIwcThyR29veFVpYjNaS29DbTcydEljIn0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 7/8] x86/HVM: don't needlessly intercept
 APERF/MPERF/TSC MSR reads
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEphbnVhcnkgNywgMjAyMCAxMjozOSBBTQ0KPiANCj4gSWYgdGhlIGhhcmR3YXJlIGNhbiBoYW5k
bGUgYWNjZXNzZXMsIHdlIHNob3VsZCBhbGxvdyBpdCB0byBkbyBzby4gVGhpcw0KPiB3YXkgd2Ug
Y2FuIGV4cG9zZSBFRlJPIHRvIEhWTSBndWVzdHMsIGFuZCAiYWxsIiB0aGF0J3MgbGVmdCBmb3Ig
ZXhwb3NpbmcNCj4gQVBFUkYvTVBFUkYgaXMgdG8gZmlndXJlIG91dCBob3cgdG8gaGFuZGxlIHdy
aXRlcyB0byB0aGVzZSBNU1JzLiAoTm90ZQ0KPiB0aGF0IHRoZSBsZWFmIDYgZ3Vlc3QgQ1BVSUQg
Y2hlY2tzIHdpbGwgZXZhbHVhdGUgdG8gZmFsc2UgZm9yIG5vdywgYXMNCj4gcmVjYWxjdWxhdGVf
bWlzYygpIHphcHMgdGhlIGVudGlyZSBsZWFmIGZvciBub3cuKQ0KPiANCj4gRm9yIFRTQyB0aGUg
aW50ZXJjZXB0cyBhcmUgbWFkZSBtaXJyb3IgdGhlIFJEVFNDIG9uZXMuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBL
ZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
