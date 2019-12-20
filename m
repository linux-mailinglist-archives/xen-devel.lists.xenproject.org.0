Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4181278AF
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 11:00:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiF1g-0003pp-Jy; Fri, 20 Dec 2019 09:56:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiF1e-0003pe-LB
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 09:56:50 +0000
X-Inumbo-ID: 0a4a9692-230f-11ea-931b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a4a9692-230f-11ea-931b-12813bfff9fa;
 Fri, 20 Dec 2019 09:56:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE0D5ACFE;
 Fri, 20 Dec 2019 09:56:48 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <d3fb2800517d79a422acc62628ad362f919824ea.1576630344.git.elnikety@amazon.com>
 <eaaffb6f-b2b1-f81e-8643-ccc238914e52@suse.com>
 <8a15bbca-e730-cbf7-2108-b8f0260e846a@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f40b177-f60b-c988-ac99-ef7eef7dfd17@suse.com>
Date: Fri, 20 Dec 2019 10:57:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8a15bbca-e730-cbf7-2108-b8f0260e846a@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/microcode: avoid unnecessary
 xmalloc/memcpy of ucode data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTIuMjAxOSAyMjoyNSwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gT24gMTguMTIuMTkg
MTM6MDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxOC4xMi4yMDE5IDAyOjMyLCBFc2xhbSBF
bG5pa2V0eSB3cm90ZToKPj4+IEBAIC03MjUsNyArNzAxLDcgQEAgc3RhdGljIGludCBfX2luaXQg
bWljcm9jb2RlX2luaXQodm9pZCkKPj4+ICAgICAgICAqLwo+Pj4gICAgICAgaWYgKCB1Y29kZV9i
bG9iLnNpemUgKQo+Pj4gICAgICAgewo+Pj4gLSAgICAgICAgeGZyZWUodWNvZGVfYmxvYi5kYXRh
KTsKPj4+ICsgICAgICAgIGJvb3RzdHJhcF9tYXAoTlVMTCk7Cj4+Cj4+IEFzIG11Y2ggYXMgSSBs
aWtlIHRoZSBjaGFuZ2UsIEkgd2hvbGVoZWFydGVkbHkgZGlzYWdyZWUgd2l0aCB0aGlzCj4+IGFz
cGVjdCBvZiBpdDogWW91IG1ha2UgaXQgbGFyZ2VseSB1bnByZWRpY3RhYmxlIHdoZW4gdGhlIGJv
b3QKPj4gbWFwcGluZ3Mgd2lsbCBnbyBhd2F5IC0gaXQgYmVjb21lcyBlbnRpcmVseSBkZXBlbmRl
bnQgdXBvbiBsaW5rCj4+IG9yZGVyLiBBbmQgb2YgY291cnNlIHdlIHJlYWxseSB3YW50IHRoZXNl
IG1hcHBpbmdzIHRvIGJlIGdvbmUsCj4+IHRoZSB2ZXJ5IGxhdGVzdCAoSSB0aGluayksIGJ5IHRo
ZSB0aW1lIHdlIHN0YXJ0IGJyaW5naW5nIHVwIEFQcwo+PiAoYnV0IGdlbmVyYWxseSB0aGUgc29v
bmVyIHRoZSBiZXR0ZXIpLiBUaGlzIGlzIChvbmUgb2Y/KSB0aGUgbWFpbgo+PiByZWFzb24ocykg
d2h5IGl0IGhhZG4ndCBiZWVuIGRvbmUgdGhpcyB3YXkgdG8gYmVnaW4gd2l0aC4gVGhlCj4+IGFs
dGVybmF0aXZlIGlzIG1vcmUgY29tcGxpY2F0ZWQgKHNldCB1cCBhIHByb3BlciwgbG9uZyB0ZXJt
Cj4+IG1hcHBpbmcpLCBidXQgaXQncyBnb2luZyB0byBiZSBtb3JlIGNsZWFuIChpbmNsdWRpbmcg
dGhlIG1hcHBpbmcKPj4gdGhlbiBhbHNvIGJlaW5nIHN1aXRhYmxlIHRvIHBvc3QtYm9vdCBDUFUg
b25saW5pbmcpLgo+Pgo+IAo+IFRoaXMgY2hhbmdlIGlzIGFuIGltcHJvdmVtZW50IG9uIHRoZSBj
dXJyZW50IHN0YXR1cy4gV2UgZ2V0IHRvIGF2b2lkIAo+IHhtYWxsb2MvbWVtY3B5IGluIHRoZSBj
YXNlIG9mIGEgc3VjY2Vzc2Z1bCB1Y29kZT1zY2FuLiBUaGUgcHJvYmxlbWF0aWMgCj4gYXNwZWN0
IHlvdSBoaWdobGlnaHQgaXMgYW55d2F5IHRoZXJlIHJlZ2FyZGxlc3Mgb2YgdGhpcyBwYXRjaCAo
cmVmLiB0byAKPiB0aGUgImVsc2UgaWYgKCB1Y29kZV9tb2QubW9kX2VuZCApIiBpbiBtaWNyb2Nv
ZGVfaW5pdCkuCgpIbW0sIGZhaXIgcG9pbnQuIEknbSBub3QgYSBmYW4gb2YgbWFraW5nIGEgYmFk
IHNpdHVhdGlvbiB3b3JzZSwKYnV0IEkgdGhpbmsgaXQncyBhY2NlcHRhYmxlIGhlcmU6CkFja2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
