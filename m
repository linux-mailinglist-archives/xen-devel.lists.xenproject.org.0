Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFCF1A5AD
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2019 02:06:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPFTN-0008M3-Q9; Sat, 11 May 2019 00:02:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3x+=TL=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hPFTM-0008Ly-4C
 for xen-devel@lists.xenproject.org; Sat, 11 May 2019 00:02:40 +0000
X-Inumbo-ID: 147e6f06-7380-11e9-ad6a-d3e8f250e0de
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 147e6f06-7380-11e9-ad6a-d3e8f250e0de;
 Sat, 11 May 2019 00:02:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2019 17:02:34 -0700
X-ExtLoop1: 1
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga007.fm.intel.com with ESMTP; 10 May 2019 17:02:34 -0700
Received: from fmsmsx125.amr.corp.intel.com (10.18.125.40) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 10 May 2019 17:02:34 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 FMSMSX125.amr.corp.intel.com (10.18.125.40) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 10 May 2019 17:02:34 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.33]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.70]) with mapi id 14.03.0415.000;
 Sat, 11 May 2019 08:02:31 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/vvmx: Simplify per-CPU memory allocations
Thread-Index: AQHU+4Y3Rd/2EjiqJUKkIiz3tgzqLKZlIjgA
Date: Sat, 11 May 2019 00:02:31 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CA2A2B8@SHSMSX104.ccr.corp.intel.com>
References: <1556210685-2549-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1556210685-2549-1-git-send-email-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzFjMmY3N2UtMTk5ZS00NDQyLWFjMGMtYTUwMDZjYmViZTg1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMlVKbm13OXQ4YU1aeGNwU1wvWFpJWEZSeGt1U0ltbDhcL3JBY1JhdEpqWDVUQk9yb3htYXdaMERYK0xtWURscWRoIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: Simplify per-CPU memory
 allocations
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
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogRnJpZGF5LCBBcHJpbCAyNiwgMjAxOSAxMjo0NSBBTQ0KPiANCj4gICogVXNlIFhG
UkVFKCkgaW5zdGVhZCBvZiBvcGVuY29kaW5nIGl0IGluIG52bXhfY3B1X2RlYWQoKQ0KPiAgKiBB
dm9pZCByZWR1bmRhbnQgZXZhbHVhdGlvbnMgb2YgcGVyX2NwdSgpDQo+ICAqIERvbid0IGFsbG9j
YXRlIHZ2bWNzX2J1ZiBhdCBhbGwgaWYgaXQgaXNuJ3QgZ29pbmcgdG8gYmUgdXNlZC4gIEl0IGlz
IG5ldmVyDQo+ICAgIHRvdWNoZWQgb24gaGFyZHdhcmUgbGFja2luZyB0aGUgVk1DUyBTaGFkb3dp
bmcgZmVhdHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQoNCkFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
