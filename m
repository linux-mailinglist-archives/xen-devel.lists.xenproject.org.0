Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD135656B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 11:11:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg3tY-0008Hb-3V; Wed, 26 Jun 2019 09:07:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hg3tW-0008HW-Dc
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 09:07:10 +0000
X-Inumbo-ID: c4cce50a-97f1-11e9-afeb-43d2864a52de
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c4cce50a-97f1-11e9-afeb-43d2864a52de;
 Wed, 26 Jun 2019 09:07:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40CC12B;
 Wed, 26 Jun 2019 02:07:05 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A77F3F71E;
 Wed, 26 Jun 2019 02:07:04 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-3-julien.grall@arm.com>
 <alpine.DEB.2.21.1906251627270.5851@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906251656420.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <31afe099-1a7b-d8f3-6d11-0fdf78594c2e@arm.com>
Date: Wed, 26 Jun 2019 10:07:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906251656420.5851@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 02/17] xen/arm64: head: Don't clobber x30/lr
 in the macro PRINT
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 andrii_anisov@epam.com, andre.przywara@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDI2LzA2LzIwMTkgMDA6NTksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDI1IEp1biAyMDE5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+IE9u
IE1vbiwgMTAgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiAgIFRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uIG9mIHRoZSBtYWNybyBQUklOVCB3aWxsIGNsb2JiZXIgeDMwL2xyLiBU
aGlzCj4+PiBtZWFucyB0aGUgdXNlciBzaG91bGQgc2F2ZSBsciBpZiBpdCBjYXJlcyBhYm91dCBp
dC4KPj4KPj4gQnkgeDMwL2xyLCBkbyB5b3UgbWVhbiB4MC14MyBhbmQgbHI/IEkgd291bGQgcHJl
ZmVyIGEgY2xlYXJlcgo+PiBleHByZXNzaW9uLgo+IAo+IE5vIG9mIGNvdXJzZSBub3QhIFlvdSBt
ZWFudCB4MzAgd2hpY2ggaXMgYSBzeW5vbnltIG9mIGxyISBJdCBpcyBqdXN0Cj4gdGhhdCBpbiB0
aGlzIGNhc2UgaXQgaXMgYWxzbyBzdXBwb3NlZCB0byBjbG9iYmVyIHgwLXgzIC0tIEkgZ290Cj4g
Y29uZnVzZWQhIFRoZSBjb21taXQgbWVzc2FnZSBpcyBhbHNvIGZpbmUgYXMgaXMgdGhlbi4gTW9y
ZSBiZWxvdy4KPiAKPiAKPj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4KPj4KPj4KPj4+IEZvbGxvdy11cCBwYXRjaGVzIHdpbGwgaW50cm9k
dWNlIG1vcmUgdXNlIG9mIFBSSU5UIGluIHBsYWNlIHdoZXJlIGxyCj4+PiBzaG91bGQgYmUgcHJl
c2VydmVkLiBSYXRoZXIgdGhhbiByZXF1aXJpbmcgYWxsIHRoZSB1c2VycyB0byBwcmVzZXJ2ZSBs
ciwKPj4+IHRoZSBtYWNybyBQUklOVCBpcyBtb2RpZmllZCB0byBzYXZlIGFuZCByZXN0b3JlIGl0
Lgo+Pj4KPj4+IFdoaWxlIHRoZSBjb21tZW50IHN0YXRlIHgzIHdpbGwgYmUgY2xvYmJlcmVkLCB0
aGlzIGlzIG5vdCB0aGUgY2FzZS4gU28KPj4+IFBSSU5UIHdpbGwgdXNlIHgzIHRvIHByZXNlcnZl
IGxyLgo+Pj4KPj4+IExhc3RseSwgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gbW92ZSB0aGUgY29t
bWVudCBvbiB0b3Agb2YgUFJJTlQgYW5kIHVzZQo+Pj4gUFJJTlQgaW4gaW5pdF91YXJ0LiBCb3Ro
IGNoYW5nZXMgd2lsbCBiZSBoZWxwZnVsIGluIGEgZm9sbG93LXVwIHBhdGNoLgo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+PiAtLS0K
Pj4+ICAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDE0ICsrKysrKysrKy0tLS0tCj4+PiAg
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJt
NjQvaGVhZC5TCj4+PiBpbmRleCBjOGJiZGYwNWE2Li5hNTE0N2M4ZDgwIDEwMDY0NAo+Pj4gLS0t
IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0
L2hlYWQuUwo+Pj4gQEAgLTc4LDEyICs3OCwxNyBAQAo+Pj4gICAgKiAgeDMwIC0gbHIKPj4+ICAg
ICovCj4+PiAgIAo+Pj4gLS8qIE1hY3JvIHRvIHByaW50IGEgc3RyaW5nIHRvIHRoZSBVQVJULCBp
ZiB0aGVyZSBpcyBvbmUuCj4+PiAtICogQ2xvYmJlcnMgeDAteDMuICovCj4+PiAgICNpZmRlZiBD
T05GSUdfRUFSTFlfUFJJTlRLCj4+PiArLyoKPj4+ICsgKiBNYWNybyB0byBwcmludCBhIHN0cmlu
ZyB0byB0aGUgVUFSVCwgaWYgdGhlcmUgaXMgb25lLgo+Pj4gKyAqCj4+PiArICogQ2xvYmJlcnMg
eDAgLSB4Mwo+Pj4gKyAqLwo+Pj4gICAjZGVmaW5lIFBSSU5UKF9zKSAgICAgICAgICAgXAo+Pj4g
KyAgICAgICAgbW92ICAgeDMsIGxyICA7ICAgICBcCj4+PiAgICAgICAgICAgYWRyICAgeDAsIDk4
ZiA7ICAgICBcCj4+PiAgICAgICAgICAgYmwgICAgcHV0cyAgICA7ICAgICBcCj4+PiArICAgICAg
ICBtb3YgICBsciwgeDMgIDsgICAgIFwKPj4+ICAgICAgICAgICBST0RBVEFfU1RSKDk4LCBfcykK
PiAKPiBTdHJhbmdlbHkgZW5vdWdoIEkgZ2V0IGEgYnVpbGQgZXJyb3Igd2l0aCBnY2MgNy4zLjEs
IGJ1dCBpZiBJIHVzZSB4MzAKPiBpbnN0ZWFkIG9mIGxyLCBpdCBidWlsZHMgZmluZS4gSGF2ZSB5
b3Ugc2VlbiB0aGlzIGJlZm9yZT8KCkhtbW0sIEkgY2FuJ3QgdG8gcmVwcm9kdWNlIGl0IGV2ZW4g
b24gb2xkZXIgY29tcGlsZXIgKDQuOSkuIE15IGd1ZXNzIGlzIG5vdCBhbGwgCnRoZSBhc3NlbWJs
ZXIgaXMgYWJsZSB0byB1bmRlcnN0YW5kICJsciIuCgpJbiB0aGUgZmlsZSBlbnRyeS5TIHdlIGhh
dmUgdGhlIGZvbGxvd2luZyBsaW5lOgoKbHIgICAgICAucmVxICAgIHgzMCAgICAgICAgICAgICAv
LyBsaW5rIHJlZ2lzdGVyCgoKQ291bGQgeW91IGdpdmUgYSB0cnkgdG8gYWRkIHRoZSBsaW5lIGlu
IGhlYWQuUz8KCj4gVGhlIGVycm9yIGlzOgo+IAo+IGFybTY0L2hlYWQuUzogQXNzZW1ibGVyIG1l
c3NhZ2VzOgo+IGFybTY0L2hlYWQuUzoyNzI6IEVycm9yOiBvcGVyYW5kIDEgbXVzdCBiZSBhbiBp
bnRlZ2VyIHJlZ2lzdGVyIC0tIGBtb3YgbHIseDMnCj4gWy4uLl0KPiBhcm02NC9oZWFkLlM6Mjcy
OiBFcnJvcjogdW5kZWZpbmVkIHN5bWJvbCBsciB1c2VkIGFzIGFuIGltbWVkaWF0ZSB2YWx1ZQo+
IFsuLi5dCj4gCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
