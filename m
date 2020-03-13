Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA7D1840CF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 07:17:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCdX8-0007QU-0X; Fri, 13 Mar 2020 06:10:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7gA4=46=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jCdX6-0007QP-SF
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 06:10:56 +0000
X-Inumbo-ID: 650de4ca-64f1-11ea-bec1-bc764e2007e4
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 650de4ca-64f1-11ea-bec1-bc764e2007e4;
 Fri, 13 Mar 2020 06:10:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 23:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,547,1574150400"; d="scan'208";a="232316594"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga007.jf.intel.com with ESMTP; 12 Mar 2020 23:10:52 -0700
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 12 Mar 2020 23:10:52 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 12 Mar 2020 23:10:51 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.145]) with mapi id 14.03.0439.000;
 Fri, 13 Mar 2020 14:10:49 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/vvmx: Fix deadlock with MSR bitmap merging
Thread-Index: AQHV99PK5HEC23EZvUejohsEd9+XOqhGDGzw
Date: Fri, 13 Mar 2020 06:10:49 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7CDC70@SHSMSX104.ccr.corp.intel.com>
References: <20200311183455.23729-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200311183455.23729-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWJlNjI1NWUtNDFjMC00ZWEwLThkYzMtMjg1NTk2OGYwMTk0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQW9Hbm03ZnNHYTB6YVwvazBcL3BvZUJ2bFpHajhSVUx5RFZZR1Q1MUN0SFBteXJkOENHOW5YcW1VN2dqck1xSnAxIn0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: Fix deadlock with MSR bitmap
 merging
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50
OiBUaHVyc2RheSwgTWFyY2ggMTIsIDIwMjAgMjozNSBBTQ0KPiANCj4gYy9zIGM0Nzk4NGFhYmVh
ZCAibnZteDogaW1wbGVtZW50IHN1cHBvcnQgZm9yIE1TUiBiaXRtYXBzIiBpbnRyb2R1Y2VkIGEN
Cj4gdXNlIG9mDQo+IG1hcF9kb21haW5fcGFnZSgpIHdoaWNoIG1heSBnZXQgdXNlZCBpbiB0aGUg
bWlkZGxlIG9mIGNvbnRleHQgc3dpdGNoLg0KPiANCj4gVGhpcyBpcyBub3Qgc2FmZSwgYW5kIGNh
dXNlcyBYZW4gdG8gZGVhZGxvY2sgb24gdGhlIG1hcGNhY2hlIGxvY2s6DQo+IA0KPiAgIChYRU4p
IFhlbiBjYWxsIHRyYWNlOg0KPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDIyZDZhZT5dIFIgX3Nw
aW5fbG9jaysweDM0LzB4NWUNCj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAzMjE5ZDc+XSBGIG1h
cF9kb21haW5fcGFnZSsweDI1MC8weDUyNw0KPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDM1NjMz
Mj5dIEYgZG9fcGFnZV9mYXVsdCsweDQyMC8weDc4MA0KPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4
MDM4ZGEzZD5dIEYNCj4geDg2XzY0L2VudHJ5LlMjaGFuZGxlX2V4Y2VwdGlvbl9zYXZlZCsweDY4
LzB4OTQNCj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAzMTcyOWY+XSBGIF9fZmluZF9uZXh0X3pl
cm9fYml0KzB4MjgvMHg2OQ0KPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDMyMWE0ZD5dIEYgbWFw
X2RvbWFpbl9wYWdlKzB4MmM2LzB4NTI3DQo+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjllZWIy
Pl0gRiBudm14X3VwZGF0ZV9leGVjX2NvbnRyb2wrMHgxZDcvMHgzMjMNCj4gICAoWEVOKSAgICBb
PGZmZmY4MmQwODAyOTlmNWE+XSBGIHZteF91cGRhdGVfY3B1X2V4ZWNfY29udHJvbCsweDIzLzB4
NDANCj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyOWEzZjc+XSBGDQo+IGFyY2gveDg2L2h2bS92
bXgvdm14LmMjdm14X2N0eHRfc3dpdGNoX2Zyb20rMHhiNy8weDEyMQ0KPiAgIChYRU4pICAgIFs8
ZmZmZjgyZDA4MDMxZDc5Nj5dIEYNCj4gYXJjaC94ODYvZG9tYWluLmMjX19jb250ZXh0X3N3aXRj
aCsweDEyNC8weDRhOQ0KPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDMyMDkyNT5dIEYgY29udGV4
dF9zd2l0Y2grMHgxNTQvMHg2MmMNCj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyNTJmM2U+XSBG
DQo+IGNvbW1vbi9zY2hlZC9jb3JlLmMjc2NoZWRfY29udGV4dF9zd2l0Y2grMHgxNmEvMHgxNzUN
Cj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyNTM4Nzc+XSBGDQo+IGNvbW1vbi9zY2hlZC9jb3Jl
LmMjc2NoZWR1bGUrMHgyYWQvMHgyYmMNCj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyMmNjOTc+
XSBGIGNvbW1vbi9zb2Z0aXJxLmMjX19kb19zb2Z0aXJxKzB4YjcvMHhjOA0KPiAgIChYRU4pICAg
IFs8ZmZmZjgyZDA4MDIyY2QzOD5dIEYgZG9fc29mdGlycSsweDE4LzB4MWENCj4gICAoWEVOKSAg
ICBbPGZmZmY4MmQwODAyYTJmYmI+XSBGIHZteF9hc21fZG9fdm1lbnRyeSsweDJiLzB4MzANCj4g
DQo+IENvbnZlcnQgdGhlIGRvbWhlYXAgcGFnZSBpbnRvIGJlaW5nIGEgeGVuaGVhcCBwYWdlLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
