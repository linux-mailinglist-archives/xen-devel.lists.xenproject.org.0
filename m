Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46316106CD
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 12:06:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLm5K-0000xZ-Uz; Wed, 01 May 2019 10:03:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q/fo=TB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hLm5J-0000wy-VE
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:03:29 +0000
X-Inumbo-ID: 5e3a0c16-6bf8-11e9-812f-abd49b58ff65
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5e3a0c16-6bf8-11e9-812f-abd49b58ff65;
 Wed, 01 May 2019 10:03:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CD53A78;
 Wed,  1 May 2019 03:03:28 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECD9B3F719;
 Wed,  1 May 2019 03:03:27 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-8-git-send-email-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a897193b-8dd2-2874-ea62-c9f404d14936@arm.com>
Date: Wed, 1 May 2019 11:03:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556658172-8824-8-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 08/10] xen/arm: keep track of
 reserved-memory regions
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
Cc: Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDMwLzA0LzIwMTkgMjI6MDIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBBcyB3ZSBwYXJzZSB0aGUgZGV2aWNlIHRyZWUgaW4gWGVuLCBrZWVwIHRyYWNrIG9mIHRo
ZSByZXNlcnZlZC1tZW1vcnkKPiByZWdpb25zIGFzIHRoZXkgbmVlZCBzcGVjaWFsIHRyZWF0bWVu
dCAoZm9sbG93LXVwIHBhdGNoZXMgd2lsbCBtYWtlIHVzZQo+IG9mIHRoZSBzdG9yZWQgaW5mb3Jt
YXRpb24uKQo+IAo+IFJldXNlIHByb2Nlc3NfbWVtb3J5X25vZGUgdG8gYWRkIHJlc2VydmVkLW1l
bW9yeSByZWdpb25zIHRvIHRoZQo+IGJvb3RpbmZvLnJlc2VydmVkX21lbSBhcnJheS4gUmVtb3Zl
IHRoZSB3YXJuaW5nIGlmIHRoZXJlIGlzIG5vIHJlZyBpbgo+IHByb2Nlc3NfbWVtb3J5X25vZGUg
YmVjYXVzZSBpdCBpcyBhIG5vcm1hbCBjb25kaXRpb24gZm9yCj4gcmVzZXJ2ZWQtbWVtb3J5LgoK
QW5kIGl0IGlzIG5vdCBhIG5vcm1hbCBjb25kaXRpb24gZm9yIC9tZW1vcnkuLi4gU28geW91ciBh
cmd1bWVudCBoZXJlIGlzIG5vdCAKc3VmZmljaWVudCBmb3IgbWUgdG8gbm90IGtlZXAgdGhlIHdh
cm5pbmcgaGVyZSBmb3IgL21lbW9yeS4KClJhdGhlciB0aGFuIHRyeWluZyB0byByZS1wdXJwb3Nl
IHByb2Nlc3NfbWVtb3J5X25vZGUsIEkgd291bGQgcHJlZmVyIGlmIHlvdSBtb3ZlIApvdXQgdGhl
IHBhcnNpbmcgb2YgInJlZyIgYW5kIHRoZW4gcHJvdmlkZSAyIGZ1bmN0aW9ucyAob25lIGZvciAv
bWVtb3J5IGFuZCBvbmUgCmZvciAvcmVzZXJ2ZWQtbWVtb3J5KS4KClRoZSBwYXJzaW5nIGZ1bmN0
aW9uIHdpbGwgcmV0dXJuIGFuIGVycm9yIGlmICJyZWciIGlzIG5vdCBwcmVzZW50LCBidXQgaXQg
Y2FuIGJlIAppZ25vcmVkIGJ5IC9yZXNlcnZlZC1tZW1vcnkgYW5kIGEgd2FybmluZyBpcyBhZGRl
ZCBmb3IgL21lbW9yeS4KCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
dGVmYW5vc0B4aWxpbnguY29tPgo+IAo+IC0tLQo+IAo+IE5vdCBkb25lOiBjcmVhdGUgYW4gZTgy
MC1saWtlIHN0cnVjdHVyZSBvbiBBUk0uCj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIGNhbGwgcHJv
Y2Vzc19tZW1vcnlfbm9kZSBmcm9tIHByb2Nlc3NfcmVzZXJ2ZWRfbWVtb3J5X25vZGUgdG8gYXZv
aWQKPiAgICBkdXBsaWNhdGlvbgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyAgICAg
IHwgMzAgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gICB4ZW4vaW5jbHVkZS9hc20t
YXJtL3NldHVwLmggfCAgMSArCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMg
Yi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4gaW5kZXggYjY2MDBhYi4uOTM1NWE2ZSAxMDA2NDQK
PiAtLS0gYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2Jvb3Rm
ZHQuYwo+IEBAIC0xMzUsNiArMTM1LDggQEAgc3RhdGljIGludCBfX2luaXQgcHJvY2Vzc19tZW1v
cnlfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAo+ICAgICAgIGNvbnN0IF9fYmUzMiAq
Y2VsbDsKPiAgICAgICBwYWRkcl90IHN0YXJ0LCBzaXplOwo+ICAgICAgIHUzMiByZWdfY2VsbHMg
PSBhZGRyZXNzX2NlbGxzICsgc2l6ZV9jZWxsczsKPiArICAgIHN0cnVjdCBtZW1pbmZvICptZW07
Cj4gKyAgICBib29sIHJlc2VydmVkID0gKGJvb2wpZGF0YTsKPiAgIAo+ICAgICAgIGlmICggYWRk
cmVzc19jZWxscyA8IDEgfHwgc2l6ZV9jZWxscyA8IDEgKQo+ICAgICAgIHsKPiBAQCAtMTQzLDI5
ICsxNDUsMzkgQEAgc3RhdGljIGludCBfX2luaXQgcHJvY2Vzc19tZW1vcnlfbm9kZShjb25zdCB2
b2lkICpmZHQsIGludCBub2RlLAo+ICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICB9Cj4gICAK
PiArICAgIGlmICggcmVzZXJ2ZWQgKQo+ICsgICAgICAgIG1lbSA9ICZib290aW5mby5yZXNlcnZl
ZF9tZW07Cj4gKyAgICBlbHNlCj4gKyAgICAgICAgbWVtID0gJmJvb3RpbmZvLm1lbTsKPiArCj4g
ICAgICAgcHJvcCA9IGZkdF9nZXRfcHJvcGVydHkoZmR0LCBub2RlLCAicmVnIiwgTlVMTCk7Cj4g
ICAgICAgaWYgKCAhcHJvcCApCj4gLSAgICB7Cj4gLSAgICAgICAgcHJpbnRrKCJmZHQ6IG5vZGUg
YCVzJzogbWlzc2luZyBgcmVnJyBwcm9wZXJ0eVxuIiwgbmFtZSk7Cj4gICAgICAgICAgIHJldHVy
biAwOwo+IC0gICAgfQo+ICAgCj4gICAgICAgY2VsbCA9IChjb25zdCBfX2JlMzIgKilwcm9wLT5k
YXRhOwo+ICAgICAgIGJhbmtzID0gZmR0MzJfdG9fY3B1KHByb3AtPmxlbikgLyAocmVnX2NlbGxz
ICogc2l6ZW9mICh1MzIpKTsKPiAgIAo+IC0gICAgZm9yICggaSA9IDA7IGkgPCBiYW5rcyAmJiBi
b290aW5mby5tZW0ubnJfYmFua3MgPCBOUl9NRU1fQkFOS1M7IGkrKyApCj4gKyAgICBmb3IgKCBp
ID0gMDsgaSA8IGJhbmtzICYmIG1lbS0+bnJfYmFua3MgPCBOUl9NRU1fQkFOS1M7IGkrKyApCgpB
cyBJIHBvaW50ZWQgb3V0IG9uIHYxLCB0aGlzIGlzIHByZXR0eSBmcmFnaWxlLiBXaGlsZSBpZ25v
cmluZyAvbWVtb3J5IGJhbmsgaXMgCmZpbmUgaWYgd2UgaGF2ZSBubyBtb3JlIHNwYWNlLCBmb3Ig
L3Jlc2VydmVkLXJlZ2lvbiB0aGlzIG1heSBtZWFuIHVzaW5nIHRoZW0gaW4gClhlbiBhbGxvY2F0
b3Igd2l0aCB0aGUgY29uc2VxdWVuY2VzIHdlIGFsbCBrbm93LgoKSWYgeW91IHNwbGl0IHRoZSBm
dW5jdGlvbiBwcm9wZXJseSwgdGhlbiB5b3Ugd2lsbCBiZSBhYmxlIHRvIHRyZWF0IApyZXNlcnZl
ZC1yZWdpb25zIGFuZCBtZW1vcnkgZGlmZmVyZW50bHkuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
