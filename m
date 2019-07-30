Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A08157A39A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:02:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsNz9-0003ti-0V; Tue, 30 Jul 2019 08:59:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WuyF=V3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsNz8-0003tc-66
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 08:59:54 +0000
X-Inumbo-ID: 64d66bbb-b2a8-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 64d66bbb-b2a8-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 08:59:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D63E344;
 Tue, 30 Jul 2019 01:59:52 -0700 (PDT)
Received: from [10.37.8.36] (unknown [10.37.8.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC5333F71F;
 Tue, 30 Jul 2019 01:59:51 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-6-julien.grall@arm.com>
 <alpine.DEB.2.21.1907291500210.1237@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d4f7330a-ad8d-032f-2020-efcf649c4312@arm.com>
Date: Tue, 30 Jul 2019 09:59:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907291500210.1237@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/7] xen/arm: traps: Avoid BUG_ON() in
 do_trap_brk()
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDcvMjkvMTkgMTE6MDIgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDIzIEp1bCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEF0IHRoZSBt
b21lbnQsIGRvX3RyYXBfYnJrKCkgaXMgdXNpbmcgYSBCVUdfT04oKSB0byBjaGVjayB0aGUgaGFy
ZHdhcmUKPj4gaGFzIGJlZW4gY29ycmVjdGx5IGNvbmZpZ3VyZWQgZHVyaW5nIGJvb3QuCj4+Cj4+
IEFueSBlcnJvciB3aGVuIGNvbmZpZ3VyaW5nIHRoZSBoYXJkd2FyZSBjb3VsZCByZXN1bHQgdG8g
YSBndWVzdCAnYnJrJwo+PiB0cmFwcGluZyBpbiB0aGUgaHlwZXJ2aXNvciBhbmQgY3Jhc2ggaXQu
Cj4+Cj4+IFRoaXMgaXMgcHJldHR5IGhhcnNoIHRvIGtpbGwgWGVuIHdoZW4gYWN0dWFsbHkga2ls
bGluZyB0aGUgZ3Vlc3Qgd291bGQKPj4gYmUgZW5vdWdoIGFzIG1pc2NvbmZpZ3VyaW5nIHRoaXMg
dHJhcCB3b3VsZCBub3QgbGVhZCB0byBleHBvc2luZwo+PiBzZW5zaXRpdmUgZGF0YS4gUmVwbGFj
ZSB0aGUgQlVHX09OKCkgd2l0aCBjcmFzaGluZyB0aGUgZ3Vlc3QuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+IC0tLQo+PiAgIHhlbi9h
cmNoL2FybS90cmFwcy5jIHwgMTEgKysrKysrKystLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL3RyYXBzLmMgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+PiBpbmRleCAxMzI2ODZlZTBmLi5l
ZjM3Y2E2YmRlIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+PiArKysgYi94
ZW4vYXJjaC9hcm0vdHJhcHMuYwo+PiBAQCAtMTMwNCwxMCArMTMwNCwxNSBAQCBpbnQgZG9fYnVn
X2ZyYW1lKGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB2YWRkcl90IHBjKQo+PiAg
ICNpZmRlZiBDT05GSUdfQVJNXzY0Cj4+ICAgc3RhdGljIHZvaWQgZG9fdHJhcF9icmsoc3RydWN0
IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIGNvbnN0IHVuaW9uIGhzciBoc3IpCj4+ICAgewo+PiAtICAg
IC8qIEhDUl9FTDIuVEdFIGFuZCBNRENSX0VMMi5UREUgYXJlIG5vdCBzZXQgc28gd2UgbmV2ZXIg
cmVjZWl2ZQo+PiAtICAgICAqIHNvZnR3YXJlIGJyZWFrcG9pbnQgZXhjZXB0aW9uIGZvciBFTDEg
YW5kIEVMMCBoZXJlLgo+PiArICAgIC8qCj4+ICsgICAgICogSENSX0VMMi5UR0UgYW5kIE1EQ1Jf
RUwyLlREUiBhcmUgY3VycmVudGx5IG5vdCBzZXQuIFNvIHdlIHNob3VsZAo+PiArICAgICAqIG5l
dmVyIHJlY2VpdmUgc29mdHdhcmUgYnJlYWtwb2luZyBleGNlcHRpb24gZm9yIEVMMSBhbmQgRUww
IGhlcmUuCj4+ICAgICAgICAqLwo+PiAtICAgIEJVR19PTighaHlwX21vZGUocmVncykpOwo+PiAr
ICAgIGlmICggIWh5cF9tb2RlKHJlZ3MpICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIGRvbWFpbl9j
cmFzaChjdXJyZW50LT5kb21haW4pOwo+PiArICAgICAgICByZXR1cm47Cj4+ICsgICAgfQo+IAo+
IFRoaXMgaXMgYSBnb29kIGNoYW5nZSB0byBoYXZlLiBJIGFtIHdvbmRlcmluZyBpZiBpdCB3b3Vs
ZCBtYWtlIHNlbnNlIHRvCj4gYWxzbyBwcmludGsgc29tZSBkZWJ1ZyBtZXNzYWdlcywgbWF5YmUg
ZXZlbiBzaG93X2V4ZWN1dGlvbl9zdGF0ZS4gSWYgc28sCj4gd2UgbmVlZCB0byBiZSBjYXJlZnVs
IHRoYXQgaXQncyBvbmx5IGRvbmUgaW4gZGVidWcgYnVpbGRzLCBvciBpdCBpcyByYXRlCj4gbGlt
aXRlZC4gV2hhdCBkbyB5b3UgdGhpbms/CgpNZXNzYWdlcyBhcmUgYWxyZWFkeSBwcmludGVkIGJ5
IGRvbWFpbl9jcmFzaCguLi4pLiBCdXQgSSBkb24ndCBzZWUgdGhlIApjb25jZXJuIGFib3V0IG5v
bi1kZWJ1ZyBidWlsZCBvciBldmVuIG5vdCByYXRlIGxpbWl0aW5nLi4uIElmIHRoZSBkb21haW4g
CmNyYXNoLCB0aGVuIGl0IHdpbGwgbm90IGNhdXNlIGFueW1vcmUgcHJpbnQgYW5kIHRoZXJlZm9y
ZSB5b3UgY2FuJ3Qgc3BhbSAKdGhlIGNvbnNvbGUgaGVyZS4KCj4gSW4gYW55IGNhc2UsIGl0IGlz
IG5vdCBuZWNlc3NhcnkgZm9yIHRoaXMKPiBwYXRjaCB0byBiZSBhY2NlcHRlZCBzbzoKPiAKPiBS
ZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+
IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
