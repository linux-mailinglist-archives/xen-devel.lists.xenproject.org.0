Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79475D114E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 16:31:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iICxT-000852-9R; Wed, 09 Oct 2019 14:28:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iICxR-00084x-F9
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 14:28:53 +0000
X-Inumbo-ID: 1dc962d0-eaa1-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1dc962d0-eaa1-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 14:28:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91E9FAEC4;
 Wed,  9 Oct 2019 14:28:51 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <d1ca6ac5-0ed4-200f-c4e0-7a657b8d8fa8@suse.com>
 <0945a089-6fdb-89aa-f5a8-b8cc35f83f17@citrix.com>
 <8a7e1532-36cd-0b68-3655-c9ce990087ce@suse.com>
 <921fcf16-66bc-c053-e4e4-823a38b7a4da@citrix.com>
 <28975fef-3bff-9ef0-3043-f3cb7a639219@suse.com>
 <e402eb7f-715c-7e9e-b17b-88e35eede99d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e74b0f4d-c3cf-d2a9-35a6-88773d0c2401@suse.com>
Date: Wed, 9 Oct 2019 16:28:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e402eb7f-715c-7e9e-b17b-88e35eede99d@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86/mm: don't needlessly veto migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMjAxOSAxNjoxNCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMC85LzE5IDEx
OjIzIEFNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4gUmVnYXJkbGVzcyBvZiB0aGUgbWVyaXRz
IG9mIHRoZSBjaGFuZ2UgQW5keSB3YW50cyB0byBzZWUsIGl0J3Mgbm90IGEgb25lCj4+PiB0aGF0
IHNob3VsZCBiZSBtYWRlIGR1cmluZyBhIGZlYXR1cmUgZnJlZXplLgo+Pgo+PiBJbmRlZWQuIFNv
IGVpdGhlciB3ZSB0YWtlIHRoaXMgcGF0Y2ggb3Igd2UgaGF2ZSB0byByZXZlcnQgdGhlIHBhdGNo
KGVzKQo+PiBpbnRyb2R1Y2luZyB0aGUgcmVncmVzc2lvbi4KPiAKPiBBY3R1YWxseSwganVzdCBj
aGF0dGluZyB3aXRoIElhbiAtLSB0aGUgd29yc2UgaXNzdWUgQVRNLCBBRkFJQ1QsIGlzIHRoYXQK
PiB0aGUgSU9NTVUgaXMgZW5hYmxlZCBmb3IgYSBndWVzdCB3aGljaCBoYXMgbmVpdGhlciBhc2tl
ZCBmb3IgUENJCj4gZGV2aWNlcywgbm9yIGV4cGxpY2l0bHkgZW5hYmxlZCBpdDsgYW5kIGhlJ3Mg
Y3VycmVudGx5IHdvcmtpbmcgb24gYSBmaXgKPiBmb3IgdGhhdC4gIE9uY2UgdGhhdCBpc3N1ZSBp
cyBmaXhlZCwgdGhlbiBvc3N0ZXN0IHNob3VsZCBiZWNvbWUKPiB1bmJsb2NrZWQgYWdhaW4uCj4g
Cj4gSXQgaXMsIGFyZ3VhYmx5LCBub3QgaWRlYWwgdG8gcmVmdXNlIHRvIG1pZ3JhdGUgYSBWTSB3
aXRoIElPTU1VIGVuYWJsZWQKPiBidXQgbm8gZGV2aWNlcyBhdHRhY2hlZDsgYnV0IGlmIGl0IG9u
bHkgYWZmZWN0ZWQgZ3Vlc3RzIHdobyBoYWQKPiBzcGVjaWZpY2FsbHkgcmVxdWVzdGVkIHRoZSBJ
T01NVSBiZSBlbmFibGVkLCB0aGF0IHdvdWxkbid0IGJlIHNvCj4gdGVycmlibGUuICAoQW5kIGlu
IGZhY3QgaXQgaGFzIGhpZ2hsaWdodGVkIHRoZSBvdGhlciwgbW9yZSBpbXBvcnRhbnQgaXNzdWUu
KQo+IAo+IEluIHN1bW1hcnksIHRoaXMgcGF0Y2ggaXMgbm90IHN0cmljdGx5IG5lZWRlZCB0byBn
ZXQgYSBwdXNoIHRvIG9zc3Rlc3QuCj4gCj4gVGhhdCBzYWlkLCB0aGUgYmVoYXZpb3IgaW4gNC4x
MiB3YXMsIGFzIGZhciBhcyBJIGNhbiB0ZWxsOgo+IAo+IDEuIElmIGEgZ3Vlc3QgaGFkIG5ldmVy
IGhhZCBhIFBDSSBkZXZpY2UgYXNzaWduZWQsIFhlbiB3aWxsIGFsbG93Cj4gbG9nZGlydHkgdG8g
YmUgZW5hYmxlZC4KPiAKPiAyLiBJZiBhIGd1ZXN0IGhhcyBhIFBDSSBkZXZpY2UgYXNzaWduZWQs
IFhlbiB3aWxsIG5vdCBhbGxvdyBsb2dkaXJ0eSB0bwo+IGJlIGVuYWJsZWQgKGJsb2NraW5nIG1p
Z3JhdGlvbikuCj4gCj4gMy4gSWYgYSBndWVzdCBoYWQgYSBQQ0kgZGV2aWNlIGFzc2lnbmVkIGlu
IHRoZSBwYXN0IGJ1dCBkb2VzIG5vdCBoYXZlCj4gb25lIG5vdywgWGVuIHdpbGwgYWxzbyBub3Qg
YWxsb3cgbG9nZGlydHkgdG8gYmUgZW5hYmxlZCAoYmxvY2tpbmcKPiBtaWdyYXRpb24pLgoKTm8g
LSB0aGUgY29ubmVjdGlvbiBwcmV2aW91c2x5IHdhcyB0byB3aGV0aGVyIElPTU1VIHBhZ2UgdGFi
bGVzCmhhZCBiZWVuIHNldCB1cDsgdGhlc2UgcGFnZSB0YWJsZXMgd291bGQgaGF2ZSBiZWVuIHRv
cm4gZG93bgp1cG9uIGRlLWFzc2lnbm1lbnQgb2YgdGhlIGxhc3QgZGV2aWNlLCBhbGxvd2luZyBt
aWdyYXRpb24gYWdhaW4uClBlb3BsZSBhY3R1YWxseSB1c2UgdGhpcyBiZWhhdmlvciBhZmFpaywg
dXNpbmcgYSBib25kIG9mIGEKcGFzc2VkIHRocm91Z2ggU1ItSU9WIE5JQyBhbmQgbmV0ZnJvbnQg
cHJvdmlkZWQgZGV2aWNlLiBUbwptaWdyYXRlIHRoZSBWTSwgdGhlIFNSLUlPViBOSUMgaXMgdGFr
ZW4gYXdheSB3aXRob3V0IHRoZSBkb21haW4KbG9zaW5nIG5ldHdvcmsgYWNjZXNzLCBhbmQgYSBu
ZXcgb25lIG1pZ2h0IHRoZW4gYmUgYXNzaWduZWQKYWdhaW4gYWZ0ZXIgbWlncmF0aW9uLgoKVGhl
ICJJT01NVSBwYWdlIHRhYmxlcyBzZXQgdXAiIHByb3BlcnR5IHdhcyBwcmV2aW91c2x5IGlkZW50
aWNhbAp0byAiaGFzIGRldmljZXMgYXNzaWduZWQiLCBpLmUuIGV2ZW4gYmVmb3JlIHdlIGNvdWxk
IGhhdmUgdXNlZApoYXNfYXJjaF9wZGV2cygpIGluc3RlYWQgb2YgaXNfaW9tbXVfZW5hYmxlZCgp
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
