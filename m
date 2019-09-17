Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3346B54AC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:55:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAHff-0004a0-7w; Tue, 17 Sep 2019 17:53:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkBD=XM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAHfe-0004Zj-Bb
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:53:46 +0000
X-Inumbo-ID: 17bdee94-d974-11e9-961c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 17bdee94-d974-11e9-961c-12813bfff9fa;
 Tue, 17 Sep 2019 17:53:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A051D1000;
 Tue, 17 Sep 2019 10:53:44 -0700 (PDT)
Received: from [10.37.13.58] (unknown [10.37.13.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE9FE3F575;
 Tue, 17 Sep 2019 10:53:43 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190812173019.11956-1-julien.grall@arm.com>
 <20190812173019.11956-27-julien.grall@arm.com>
 <alpine.DEB.2.21.1908231754060.26226@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b0633e83-cb2f-12fd-3c9e-73a6bceb9ef9@arm.com>
Date: Tue, 17 Sep 2019 18:53:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908231754060.26226@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 26/28] xen/arm64: head: Use a page
 mapping for the 1:1 mapping in create_page_tables()
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

SGkgU3RlZmFubywKCk9uIDgvMjQvMTkgMjoxNiBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIE1vbiwgMTIgQXVnIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gICAgICAgICAg
IGxzciAgIHgyLCB4MTksICNUSElSRF9TSElGVCAgLyogQmFzZSBhZGRyZXNzIGZvciA0SyBtYXBw
aW5nICovCj4+ICAgICAgICAgICBsc2wgICB4MiwgeDIsICNUSElSRF9TSElGVAo+PiBAQCAtNjc0
LDIxICs1OTEsODAgQEAgY3JlYXRlX3BhZ2VfdGFibGVzOgo+PiAgICAgICAgICAgY21wICAgeDEs
ICMoTFBBRV9FTlRSSUVTPDwzKSAvKiA1MTIgZW50cmllcyBwZXIgcGFnZSAqLwo+PiAgICAgICAg
ICAgYi5sdCAgMWIKPiAKPiBXaHkgY2FuJ3Qgd2UgdXNlIGNyZWF0ZV9tYXBwaW5nX2VudHJ5IGhl
cmU/CgpJZiB3ZSByZS11c2UgY3JlYXRlX21hcHBpbmdfZW50cnksIHRoZW4gd2Ugd2lsbCBjb21w
dXRlIGV2ZXJ5dGhpbmcgYXQgCmVhY2ggbG9vcC4KCkF0IHRoZSBtb21lbnQsIHRoZSBsb29wIGV4
ZWN1dGUgMyBpbnN0cnVjdGlvbnMgKGV4Y2x1ZGluZyB0aGUgYnJhbmNoIGFuZCAKY29tcGFyaXNv
bikuIFdlIHdvdWxkIGVuZCB1cCB0byBoYXZlIGFuIGV4dHJhIDUgaW5zdHJ1Y3Rpb25zIGZvciBh
cm02NCAKKDkgaW5zdHJ1Y3Rpb24gZm9yIGFybTMyKS4KCkF0IHRoZSBtb21lbnQsIHdlIGl0ZXJh
dGUgNTEyIHRpbWVzIHRoZSBsb29wLCBzbyB0aGlzIGFkZHMgMjU2MCAKaW5zdHJ1Y3Rpb25zIChy
ZXNwLiA0NjA4KSBpbiB0aGUgYm9vdCBjb2RlLiBMb25nLXRlcm0gcGxhbiwgd2Ugd2lsbCB3YW50
IAp0byBpbmNyZWFzZSB0aGUgWGVuIG1hcHBpbmcgdG8gNE1CIChzbyB5b3UgZG91YmxlIHVwIHRo
ZSBudW1iZXIgaXRlcmF0aW9uKS4KClRoaXMgaXMgYSBsZXNzIHRoYW4gaWRlYWwgc29sdXRpb24u
IEkgaGF2ZW4ndCBjb21lIHVwIHdpdGggYSBjbGV2ZXIgCnNvbHV0aW9uIHNvIGZhciwgaGVuY2Ug
d2h5IGl0IGlzIGxlZnQgYWxvbmUuCgo+IAo+IAo+PiAtICAgICAgICAvKiBEZWZlciBmaXhtYXAg
YW5kIGR0YiBtYXBwaW5nIHVudGlsIGFmdGVyIHBhZ2luZyBlbmFibGVkLCB0bwo+PiAtICAgICAg
ICAgKiBhdm9pZCB0aGVtIGNsYXNoaW5nIHdpdGggdGhlIDE6MSBtYXBwaW5nLiAqLwo+PiArICAg
ICAgICAvKgo+PiArICAgICAgICAgKiBJZiBYZW4gaXMgbG9hZGVkIGF0IGV4YWN0bHkgWEVOX1ZJ
UlRfU1RBUlQgdGhlbiB3ZSBkb24ndAo+PiArICAgICAgICAgKiBuZWVkIGFuIGFkZGl0aW9uYWwg
MToxIG1hcHBpbmcsIHRoZSB2aXJ0dWFsIG1hcHBpbmcgd2lsbAo+PiArICAgICAgICAgKiBzdWZm
aWNlLgo+PiArICAgICAgICAgKi8KPj4gKyAgICAgICAgY21wICAgeDE5LCAjWEVOX1ZJUlRfU1RB
UlQKPj4gKyAgICAgICAgYm5lICAgMWYKPj4gKyAgICAgICAgcmV0Cj4+ICsxOgo+PiArICAgICAg
ICAvKgo+PiArICAgICAgICAgKiBPbmx5IHRoZSBmaXJzdCBwYWdlIG9mIFhlbiB3aWxsIGJlIHBh
cnQgb2YgdGhlIDE6MSBtYXBwaW5nLgo+PiArICAgICAgICAgKiBBbGwgdGhlIGJvb3RfKl9pZCB0
YWJsZXMgYXJlIGxpbmtlZCB0b2dldGhlciBldmVuIGlmIHRoZXkgbWF5Cj4+ICsgICAgICAgICAq
IG5vdCBiZSBhbGwgdXNlZC4gVGhleSB3aWxsIHRoZW4gYmUgbGlua2VkIHRvIHRoZSBib290IHBh
Z2UKPj4gKyAgICAgICAgICogdGFibGVzIGF0IHRoZSBjb3JyZWN0IGxldmVsLgo+PiArICAgICAg
ICAgKi8KPj4gKyAgICAgICAgY3JlYXRlX3RhYmxlX2VudHJ5IGJvb3RfZmlyc3RfaWQsIGJvb3Rf
c2Vjb25kX2lkLCB4MTksIEZJUlNUX1NISUZULCB4MCwgeDEsIHgyCj4+ICsgICAgICAgIGNyZWF0
ZV90YWJsZV9lbnRyeSBib290X3NlY29uZF9pZCwgYm9vdF90aGlyZF9pZCwgeDE5LCBTRUNPTkRf
U0hJRlQsIHgwLCB4MSwgeDIKPiAKPiBJZiBJIHVuZGVyc3Rvb2QgdGhlIGNvZGUgcmlnaHQsIGl0
IGlzIG5vdCBhY3R1YWxseSByZXF1aXJlZCB0byBsaW5rCj4gYm9vdF9maXJzdF9pZCAtPiBib290
X3NlY29uZF9pZCBhbmQvb3IgYm9vdF9zZWNvbmRfaWQgLT4gYm9vdF90aGlyZF9pZDoKPiBpdCBk
ZXBlbmRzIG9uIHdoZXRoZXIgeDE5IGNsYXNoZXMgd2l0aCBYRU5fRklSU1RfU0xPVCwgWEVOX1NF
Q09ORF9TTE9ULAo+IGV0Yy4gRG8geW91IHRoaW5rIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHdpdGhv
dXQgbWFraW5nIHRoZSBjb2RlIGNvbXBsZXgKPiB0byBvbmx5IGNhbGwgY3JlYXRlX3RhYmxlX2Vu
dHJ5IGJvb3RfZmlyc3RfaWQsIGJvb3Rfc2Vjb25kX2lkIGFuZAo+IGNyZWF0ZV90YWJsZV9lbnRy
eSBib290X3NlY29uZF9pZCwgYm9vdF90aGlyZF9pZCB3aGVuIHJlcXVpcmVkPyAgU28KPiBtb3Zp
bmcgdGhlIGNhbGxzIGJlbG93IGFmdGVyIHRoZSByZWxldmFudCBjaGVja3M/IEl0IGxvb2tzIGxp
a2UgaXQgY291bGQKPiBiZSBkb25lIGJ5IGFkZGluZyB0aG9zZSBjYWxscyBiZWZvcmUgInJldCIu
IEkgd291bGRuJ3QgbWluZCBpZiB0aGV5IGFyZQo+IGR1cGxpY2F0ZWQgYnV0IHdlIGNvdWxkIGF2
b2lkIGl0IGJ5IGFkZGluZyBhcHByb3ByaWF0ZSBsYWJlbHMgYW5kIGhhdmluZwo+IGEgc2luZ2xl
IHJldHVybiBwYXRoOgo+IAo+IG91dDE6Cj4gICAgY3JlYXRlX3RhYmxlX2VudHJ5IGJvb3RfZmly
c3RfaWQsIGJvb3Rfc2Vjb25kX2lkLCB4MTksIEZJUlNUX1NISUZULCB4MCwgeDEsIHgyCj4gb3V0
MjoKPiAgICBjcmVhdGVfdGFibGVfZW50cnkgYm9vdF9zZWNvbmRfaWQsIGJvb3RfdGhpcmRfaWQs
IHgxOSwgU0VDT05EX1NISUZULCB4MCwgeDEsIHgyCj4gb3V0MzoKPiAgICByZXQKCkkgaGF2ZSBp
bXBsZW1lbnRlZCBzb21ldGhpbmcgc2ltaWxhci4gSSB3aWxsIHNlbmQgaXQgYXMgcGFydCBvZiB0
aGUgbmV4dCAKdmVyc2lvbiBpbiBhIGJpdC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
