Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353829A5D6
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 04:57:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0zjI-0001Mn-Ka; Fri, 23 Aug 2019 02:55:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VL6j=WT=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1i0zjH-0001Mi-GI
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 02:55:07 +0000
X-Inumbo-ID: 688ce37a-c551-11e9-ade2-12813bfff9fa
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 688ce37a-c551-11e9-ade2-12813bfff9fa;
 Fri, 23 Aug 2019 02:55:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 19:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,419,1559545200"; d="scan'208";a="354486052"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga005.jf.intel.com with ESMTP; 22 Aug 2019 19:54:32 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 22 Aug 2019 19:54:17 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 22 Aug 2019 19:54:17 -0700
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 22 Aug 2019 19:54:16 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.112]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.15]) with mapi id 14.03.0439.000;
 Fri, 23 Aug 2019 10:54:14 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/vtd: Fix S3 resume following c/s 650c31d3af
Thread-Index: AQHVUTHnpLK6JVIV50GEKK5IGbJqg6cIGZFw
Date: Fri, 23 Aug 2019 02:54:14 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D5459C2@SHSMSX104.ccr.corp.intel.com>
References: <20190812171729.4984-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190812171729.4984-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzk3MGVhNDktNmJlMS00ZGE3LTlmOTMtNGJjZmI5OTY5YmE0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMU40SkJ2eDlWYVc2RWNKRUd5a09hczczSVFsMXkxZjVPREZKcWppNm5XSllwdlNQN2ZNdDNwOXFZdE5VcXlubCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/vtd: Fix S3 resume following c/s
 650c31d3af
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
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogVHVlc2RheSwgQXVndXN0IDEzLCAyMDE5IDE6MTcgQU0NCj4gDQo+IGMvcyA2NTBj
MzFkM2FmICJ4ODYvSVJROiBmaXggbG9ja2luZyBhcm91bmQgdmVjdG9yIG1hbmFnZW1lbnQiIGFk
anVzdGVkDQo+IHRoZQ0KPiBsb2NraW5nIGluIGFkanVzdF9pcnFfYWZmaW5pdHkoKS4NCj4gDQo+
IFRoZSBTMyBwYXRoIGVuZHMgdXAgaGVyZSB2aWEgaW9tbXVfcmVzdW1lKCkgYmVmb3JlIGludGVy
cnVwdHMgYXJlIGVuYWJsZWQsDQo+IGF0DQo+IHdoaWNoIHBvaW50IHNwaW5fbG9ja19pcnEoKSB3
aGljaCBmYWlsIEFTU0VSVChsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsgYnV0DQo+IHdpdGggbm8g
d29ya2luZyBjb25zb2xlLg0KPiANCj4gVXNlIHNwaW5fbG9ja19pcnFzYXZlKCkgaW5zdGVhZCB0
byBjb3BlIHdpdGggaW50ZXJydXB0cyBhbHJlYWR5IGJlaW5nDQo+IGRpc2FibGVkLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4N
Cg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
