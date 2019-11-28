Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2B010C7D6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 12:19:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaHn7-0004Z8-Bb; Thu, 28 Nov 2019 11:16:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaHn5-0004Z3-Nr
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 11:16:55 +0000
X-Inumbo-ID: 95534d10-11d0-11ea-a3d1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95534d10-11d0-11ea-a3d1-12813bfff9fa;
 Thu, 28 Nov 2019 11:16:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D66F8AFA7;
 Thu, 28 Nov 2019 11:16:53 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, Juergen Gross <jgross@suse.com>
References: <20191127171143.27399-1-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c1cd5d7c-d08f-cdac-9935-42f4a35ac12d@suse.com>
Date: Thu, 28 Nov 2019 12:17:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191127171143.27399-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86 / iommu: set up a scratch page in
 the quarantine domain
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMjAxOSAxODoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoaXMgcGF0Y2ggaW50
cm9kdWNlcyBhIG5ldyBpb21tdV9vcCB0byBmYWNpbGl0YXRlIGEgcGVyLWltcGxlbWVudGF0aW9u
Cj4gcXVhcmFudGluZSBzZXQgdXAsIGFuZCB0aGVuIGZ1cnRoZXIgY29kZSBmb3IgeDg2IGltcGxl
bWVudGF0aW9ucwo+IChhbWQgYW5kIHZ0ZCkgdG8gc2V0IHVwIGEgcmVhZC1vbmx5IHNjcmF0Y2gg
cGFnZSB0byBzZXJ2ZSBhcyB0aGUgc291cmNlCj4gZm9yIERNQSByZWFkcyB3aGlsc3QgYSBkZXZp
Y2UgaXMgYXNzaWduZWQgdG8gZG9tX2lvLiBETUEgd3JpdGVzIHdpbGwKPiBjb250aW51ZSB0byBm
YXVsdCBhcyBiZWZvcmUuCj4gCj4gVGhlIHJlYXNvbiBmb3IgZG9pbmcgdGhpcyBpcyB0aGF0IHNv
bWUgaGFyZHdhcmUgbWF5IGNvbnRpbnVlIHRvIHJlLXRyeQo+IERNQSAoZGVzcGl0ZSBGTFIpIGlu
IHRoZSBldmVudCBvZiBhbiBlcnJvciwgb3IgZXZlbiBCTUUgYmVpbmcgY2xlYXJlZCwgYW5kCj4g
d2lsbCBmYWlsIHRvIGRlYWwgd2l0aCBETUEgcmVhZCBmYXVsdHMgZ3JhY2VmdWxseS4gSGF2aW5n
IGEgc2NyYXRjaCBwYWdlCj4gbWFwcGVkIHdpbGwgYWxsb3cgcGVuZGluZyBETUEgcmVhZHMgdG8g
Y29tcGxldGUgYW5kIHRodXMgc3VjaCBidWdneQo+IGhhcmR3YXJlIHdpbGwgZXZlbnR1YWxseSBi
ZSBxdWllc2NlZC4KPiAKPiBOT1RFOiBUaGVzZSBtb2RpZmljYXRpb25zIGFyZSByZXN0cmljdGVk
IHRvIHg4NiBpbXBsZW1lbnRhdGlvbnMgb25seSBhcwo+ICAgICAgIHRoZSBidWdneSBoL3cgSSBh
bSBhd2FyZSBvZiBpcyBvbmx5IHVzZWQgd2l0aCBYZW4gaW4gYW4geDg2Cj4gICAgICAgZW52aXJv
bm1lbnQuIEFSTSBtYXkgcmVxdWlyZSBzaW1pbGFyIGNvZGUgYnV0LCBzaW5jZSBJIGFtIG5vdAo+
ICAgICAgIGF3YXJlIG9mIHRoZSBuZWVkLCB0aGlzIHBhdGNoIGRvZXMgbm90IG1vZGlmeSBhbnkg
QVJNIGltcGxlbWVudGF0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1
cnJhbnRAYW1hem9uLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cgo+IFRoZXJlIGlzIHN0aWxsIHRoZSBvcGVuIHF1ZXN0aW9uIG9mIHdoZXRoZXIgdXNl
IG9mIGEgc2NyYXRjaCBwYWdlIG91Z2h0Cj4gdG8gYmUgZ2F0ZWQgb24gc29tZXRoaW5nLCBlaXRo
ZXIgYXJlIHJ1bi10aW1lIG9yIGNvbXBpbGUtdGltZS4KCkkgaGF2ZSBubyBjbGVhciBvcGluaW9u
IGVpdGhlciB3YXkgaGVyZS4gVGhlIHdvcmthcm91bmQgc2VlbXMgbG93Cm92ZXJoZWFkIGVub3Vn
aCB0aGF0IHRoZXJlIG1heSBub3QgYmUgYSBuZWVkIHRvIGhhdmUgYW4gYWRtaW4gKG9yCmJ1aWxk
IHRpbWUpIGNvbnRyb2wgZm9yIHRoaXMuCgpBcyB0byA0LjEzOiBUaGUgcXVhcmFudGluaW5nIGFz
IGEgd2hvbGUgaXMgcHJldHR5IGZyZXNoLiBXaGlsZSBpdApoYXMgYmVlbiBiYWNrcG9ydGVkIHRv
IHNlY3VyaXR5IG1haW50YWluZWQgdHJlZXMsIEknZCBzdGlsbCBjb25zaWRlcgppdCBhIG5ldyBm
ZWF0dXJlIGluIDQuMTMsIGFuZCBoZW5jZSB0aGlzIHdvcmthcm91bmQgYXQgbGVhc3QgZWxpZ2li
bGUKZm9yIGNvbnNpZGVyYXRpb24uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
