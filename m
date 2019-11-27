Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF7210AE99
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 12:19:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZvJB-0001lQ-UR; Wed, 27 Nov 2019 11:16:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZvJA-0001lC-K6
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:16:32 +0000
X-Inumbo-ID: 5d00c6f0-1107-11ea-b155-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d00c6f0-1107-11ea-b155-bc764e2007e4;
 Wed, 27 Nov 2019 11:16:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 907D6B1B5;
 Wed, 27 Nov 2019 11:16:30 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191118101600.94645-1-roger.pau@citrix.com>
 <14ccf9a0-ecb4-6e09-6461-99f989353f34@suse.com>
 <20191118140302.GL72134@Air-de-Roger>
 <3e543cfd-d81a-1a4b-0268-7b121ae23c23@suse.com>
 <20191118145554.GN72134@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D611FB5@SHSMSX104.ccr.corp.intel.com>
 <20191127110332.GN980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b5eebe0-0f72-7dee-37a7-1b2b94e85e5d@suse.com>
Date: Wed, 27 Nov 2019 12:16:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191127110332.GN980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMjAxOSAxMjowMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBO
b3YgMjcsIDIwMTkgYXQgMDI6MDc6MTZBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+IFRo
ZW4gd2hhdCdzIHRoZSBkaWZmZXJlbmNlIGZyb20gb3JpZ2luYWwgbG9naWM/Cj4gCj4gVGhlIG9y
aWdpbmFsIGxvZ2ljIGlzOgo+IAo+IGlmICggcnVubmluZyAmJiAoaW5faXJxKCkgfHwgKHYgIT0g
Y3VycmVudCkpICkKPiB7Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gdi0+cHJvY2Vzc29y
Owo+IAo+ICAgICAgICAgaWYgKCBjcHUgIT0gc21wX3Byb2Nlc3Nvcl9pZCgpICkKPiAgICAgICAg
ICAgICBzZW5kX0lQSV9tYXNrKGNwdW1hc2tfb2YoY3B1KSwgcG9zdGVkX2ludHJfdmVjdG9yKTsK
PiAgICAgICAgIGVsc2UgaWYgKCAhc29mdGlycV9wZW5kaW5nKGNwdSkgKQo+ICAgICAgICAgICAg
IHJhaXNlX3NvZnRpcnEoVkNQVV9LSUNLX1NPRlRJUlEpOwo+IH0KPiAKPiBXaGljaCBJIGZpbmQg
bXVjaCBoYXJkZXIgdG8gdW5kZXJzdGFuZC4gRm9yIGV4YW1wbGUgSSdtIG5vdCBzdXJlIG9mCj4g
d2hhdCdzIHRoZSBiZW5lZml0IG9mIGRvaW5nIHRoZSBjcHUgIT0gc21wX3Byb2Nlc3Nvcl9pZCgp
IGNoZWNrCj4gaW5zdGVhZCBvZiBzaW1wbHkgZG9pbmcgdiAhPSBjdXJyZW50IChsaWtlIGluIHRo
ZSBvdXRlciBpZiBjb25kaXRpb24pLgoKVGhlcmUgYXJlIHR3byBhc3BlY3RzIHRvIGNvbnNpZGVy
OiBPbmUgaXMgdGhhdCB2LT5wcm9jZXNzb3IKbWF5IGVxdWFsIHNtcF9wcm9jZXNzb3JfaWQoKSBh
bHNvIGZvciB2ICE9IGN1cnJlbnQuIFRoZSBvdGhlcgppcyB0aGF0IHdpdGhvdXQgdGhpcyBjaGVj
ayBpbiB0aGUgaWYoKSBpdCB3b3VsZCBuZWVkIGFkZGluZwp0byB0aGUgZWxzZS1pZigpLiBJJ20g
bm90IHN1cmUgdG8gd2hhdCBkZWdyZWUgd2hpY2ggb2YgdGhlCnR3byBtYXR0ZXJzIGZ1bmN0aW9u
YWxpdHkgd2lzZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
