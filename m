Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE71CDF1F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 12:23:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHQ76-0005gP-S2; Mon, 07 Oct 2019 10:19:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=d412=YA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iHQ75-0005gG-F9
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 10:19:35 +0000
X-Inumbo-ID: f5148d6c-e8eb-11e9-8c93-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5148d6c-e8eb-11e9-8c93-bc764e2007e4;
 Mon, 07 Oct 2019 10:19:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6D9B0B22E;
 Mon,  7 Oct 2019 10:19:33 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <ba0fd598-9102-e765-e7f5-61e91d47b124@suse.com>
 <dc7d25e5-11f8-b6c3-7137-ceb0814e836a@suse.com>
 <c694e8f7-fd64-f2be-fadb-edc1478d07ae@citrix.com>
 <44d87efa-36af-7c06-6530-a1691ab55a83@suse.com>
 <f7f47cb5-a08b-ca08-93df-73427d94b847@citrix.com>
 <ee24c8e1-c925-f78e-1d51-d0d1f03f7326@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f0c08d79-fad2-4760-6e18-99bfe84509e2@suse.com>
Date: Mon, 7 Oct 2019 12:19:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <ee24c8e1-c925-f78e-1d51-d0d1f03f7326@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/3] AMD/IOMMU: allocate one device table
 per PCI segment
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paul Durrant <paul@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTAuMTkgMTI6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEkgYXBwcmVjaWF0ZSB0aGUg
YWNrLCBidXQgSSB0aGluayBJJ2QgcHJlZmVyIHRvIG5vdCBtYWtlIHVzZSBvZiBpdAo+IGlmIGF0
IGFsbCBwb3NzaWJsZSB1bmRlciB0aGVzZSBjb25kaXRpb25zLiBJbnN0ZWFkIEknZCBsaWtlIHVz
IHRvCj4gcmVhY2ggc29tZSBjb21tb24gZ3JvdW5kIGhlcmUuIFNlZWluZyB0aGF0IHdlJ3JlIHBh
c3QgdGhlIGRlYWRsaW5lCj4gYWxyZWFkeSwgSsO8cmdlbidzIHJlbGVhc2UgYWNrIHdpbGwgbm93
IGJlIG5lZWRlZCBhbnl3YXkuIErDvHJnZW4gLQo+IHdvdWxkIHlvdSBiZSBmaW5lIHdpdGggc2V0
dGxpbmcgb24gdGhpcyB0YWtpbmcgYSBmZXcgbW9yZSBkYXlzLAo+IGFuZCB0aGVuIHN0aWxsIGFs
bG93IGluIHRoaXMgc2VyaWVzPyBPciBpcyB0cnlpbmcgdG8gc29vbiBmaW5kIGEKPiByZXNvbHV0
aW9uIGhlcmUgcG9pbnRsZXNzIGFzIHlvdSdkIHJhdGhlciBub3Qgc2VlIHRoaXMgZ28gaW4KPiBh
bnltb3JlPwoKQXMgaXQgaXNuJ3QgYSBjb21wbGV0ZWx5IHRyaXZpYWwgcGF0Y2ggc2VyaWVzIEkn
ZCBsaWtlIHRvIGtub3cgd2hhdAp0aGUgZ2FpbiB3b3VsZCBiZTogaXMgaXQganVzdCBhICJuaWNl
IHRvIGhhdmUiLCBkb2VzIGl0IHNvbHZlIGEKdGhlb3JldGljYWwgKG5vdCB0byBiZSBleHBlY3Rl
ZCkgcHJvYmxlbSwgb3IgZG8geW91IHRoaW5rIGl0IHdpbGwKYmUgbmVlZGVkIHRvIGJlIGJhY2tw
b3J0ZWQgaWYgSSBzYXkgIm5vIj8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
