Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED72F7238A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 02:55:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hq5Vv-0008RG-Us; Wed, 24 Jul 2019 00:52:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FRib=VV=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hq5Vt-0008R6-Vm
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 00:52:14 +0000
X-Inumbo-ID: 430f922a-adad-11e9-aa93-d388228333bf
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 430f922a-adad-11e9-aa93-d388228333bf;
 Wed, 24 Jul 2019 00:52:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 17:52:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; d="scan'208";a="253415507"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga001.jf.intel.com with ESMTP; 23 Jul 2019 17:52:06 -0700
Received: from fmsmsx118.amr.corp.intel.com (10.18.116.18) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 23 Jul 2019 17:52:06 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 fmsmsx118.amr.corp.intel.com (10.18.116.18) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 23 Jul 2019 17:52:06 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.110]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.240]) with mapi id 14.03.0439.000;
 Wed, 24 Jul 2019 08:52:03 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3] passthrough/vtd: Don't DMA to the stack in
 queue_invalidate_wait()
Thread-Index: AQHVO/L5KqAMV4eJUUuIlDrYCEG7RKbY/ALA
Date: Wed, 24 Jul 2019 00:52:03 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CADCC20@SHSMSX104.ccr.corp.intel.com>
References: <20190716162355.1321-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190716162355.1321-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjM1NGRjZGItYzhhNS00MDY2LTg1ODYtMWM4NWYzZjJmZWZmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoid2pGaFNxOVdkREVwYTYySVpKRkxIRWczcWpJbitBSVJvVlVxUmVscnRCUXpidFEwOXRrRE14MjY5Nk95NllLaCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3] passthrough/vtd: Don't DMA to the stack
 in queue_invalidate_wait()
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
Cc: Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0K
PiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMTcsIDIwMTkgMTI6MjQgQU0KPiAKPiBETUEtaW5nIHRv
IHRoZSBzdGFjayBpcyBjb25zaWRlcmVkIGJhZCBwcmFjdGljZS4gIEluIHRoaXMgY2FzZSwgaWYg
YQo+IHRpbWVvdXQgb2NjdXJzIGJlY2F1c2Ugb2YgYSBzbHVnZ2lzaCBkZXZpY2Ugd2hpY2ggaXMg
cHJvY2Vzc2luZyB0aGUKPiByZXF1ZXN0LCB0aGUgY29tcGxldGlvbiBub3RpZmljYXRpb24gd2ls
bCBjb3JydXB0IHRoZSBzdGFjayBvZiBhCj4gc3Vic2VxdWVudCBkZWVwZXIgY2FsbCB0cmVlLgo+
IAo+IFBsYWNlIHRoZSBwb2xsX3Nsb3QgaW4gYSBwZXJjcHUgYXJlYSBhbmQgRE1BIHRvIHRoYXQg
aW5zdGVhZC4KPiAKPiBGaXggdGhlIGRlY2xhcmF0aW9uIG9mIHNhZGRyIGluIHN0cnVjdCBxaW52
YWxfZW50cnksIHRvIGF2b2lkIGEgc2hpZnQgYnkKPiB0d28uICBUaGUgcmVxdWlyZW1lbnQgaGVy
ZSBpcyB0aGF0IHRoZSBETUEgYWRkcmVzcyBpcyBkd29yZCBhbGlnbmVkLAo+IHdoaWNoIGlzIGNv
dmVyZWQgYnkgcG9sbF9zbG90J3MgdHlwZS4KPiAKPiBUaGlzIGNoYW5nZSBkb2VzIG5vdCBhZGRy
ZXNzIG90aGVyIGlzc3Vlcy4gIENvcnJlbGF0aW5nIGNvbXBsZXRpb25zCj4gYWZ0ZXIgYSB0aW1l
b3V0IHdpdGggdGhlaXIgcmVxdWVzdCBpcyBhIG1vcmUgY29tcGxpY2F0ZWQgY2hhbmdlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
CgpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
