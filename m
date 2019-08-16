Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8558FF46
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 11:45:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyYl5-0002cJ-2J; Fri, 16 Aug 2019 09:42:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1LD=WM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyYl3-0002cE-K4
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 09:42:53 +0000
X-Inumbo-ID: 366c0a0c-c00a-11e9-8bb2-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 366c0a0c-c00a-11e9-8bb2-12813bfff9fa;
 Fri, 16 Aug 2019 09:42:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4892E28;
 Fri, 16 Aug 2019 02:42:50 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B09493F706;
 Fri, 16 Aug 2019 02:42:49 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908151634170.8737@sstabellini-ThinkPad-T480s>
 <20190815233618.31630-7-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <63b80e43-f07c-5db7-8aa8-bbf959cb2f3f@arm.com>
Date: Fri, 16 Aug 2019 10:42:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815233618.31630-7-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 7/8] xen/arm: don't iomem_permit_access
 for reserved-memory regions
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNi8wOC8yMDE5IDAwOjM2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gRG9u
J3QgYWxsb3cgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgdG8gYmUgcmVtYXBwZWQgaW50byBhbnkg
dW5wcml2aWxlZ2VkCj4gZ3Vlc3RzLCB1bnRpbCByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyBhcmUg
cHJvcGVybHkgc3VwcG9ydGVkIGluIFhlbi4gRm9yCj4gbm93LCBkbyBub3QgY2FsbCBpb21lbV9w
ZXJtaXRfYWNjZXNzIG9uIHRoZW0sIGJlY2F1c2UgZ2l2aW5nCj4gaW9tZW1fcGVybWl0X2FjY2Vz
cyB0byBkb20wIG1lYW5zIHRoYXQgdGhlIHRvb2xzdGFjayB3aWxsIGJlIGFibGUgdG8KPiBhc3Np
Z24gdGhlIHJlZ2lvbiB0byBhIGRvbVUuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+IC0tLQo+IAo+IENoYW5nZXMgaW4gdjY6Cj4g
LSBjb21wYXJlIGFnYWluc3QgIi9yZXNlcnZlZC1tZW1vcnkvIgo+IAo+IENoYW5nZXMgaW4gdjU6
Cj4gLSBmaXggY2hlY2sgY29uZGl0aW9uCj4gLSB1c2Ugc3RybmljbXAKPiAtIHJldHVybiBlcnJv
cgo+IC0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQo+IAo+IENoYW5nZXMgaW4gdjQ6Cj4gLSBjb21w
YXJlIHRoZSBwYXJlbnQgbmFtZSB3aXRoIHJlc2VydmVkLW1lbW9yeQo+IC0gdXNlIGR0X25vZGVf
Y21wCj4gCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIG5ldyBwYXRjaAo+IC0tLQo+ICAgeGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jIHwgMjQgKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jCj4gaW5kZXggNGM4NDA0MTU1YS4uNjczZmZhNDUzZiAxMDA2NDQKPiAtLS0gYS94ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMKPiBAQCAtMTE1NSwxNSArMTE1NSwyMyBAQCBzdGF0aWMgaW50IF9faW5pdCBtYXBfcmFuZ2Vf
dG9fZG9tYWluKGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LAo+ICAgICAgIGJvb2wg
bmVlZF9tYXBwaW5nID0gIWR0X2RldmljZV9mb3JfcGFzc3Rocm91Z2goZGV2KTsKPiAgICAgICBp
bnQgcmVzOwo+ICAgCj4gLSAgICByZXMgPSBpb21lbV9wZXJtaXRfYWNjZXNzKGQsIHBhZGRyX3Rv
X3BmbihhZGRyKSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFkZHJfdG9fcGZu
KFBBR0VfQUxJR04oYWRkciArIGxlbiAtIDEpKSk7Cj4gLSAgICBpZiAoIHJlcyApCj4gKyAgICAv
Kgo+ICsgICAgICogRG9uJ3QgZ2l2ZSBpb21lbSBwZXJtaXNzaW9ucyBmb3IgcmVzZXJ2ZWQtbWVt
b3J5IHJhbmdlcyB0byBkb21VcwoKSW4gdXBzdHJlYW0gWGVuLCB0aGlzIGlzIG9ubHkgY2FsbGVk
IGZvciBEb20wLiBTbyB3aGF0IGFyZSB5b3UgcmVmZXJyaW5nIHRvPwoKPiArICAgICAqIHVudGls
IHJlc2VydmVkLW1lbW9yeSBzdXBwb3J0IGlzIGNvbXBsZXRlLgoKQnV0IGFzIEkgcG9pbnRlZCBv
dXQgYmVmb3JlIHJlc2VydmVkLW1lbW9yeSBzdXBwb3J0IGlzIG5vdCBnb2luZyB0byBoYXBwZW4g
dmlhIAppb21lbS4gVGhpcyBpcyBhbiBhYnVzZSBvZiB0aGUgaW50ZXJmYWNlLgoKPiArICAgICAq
LwoKQSBiZXR0ZXIgY29tbWVudCB3b3VsZCBiZToKCiJyZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyBh
cmUgUkFNIGNhcnZlZCBvdXQgZm9yIHNwZWNpYWwgcHVycG9zZS4gVGhleSBhcmUgbm90IApNTUlP
IGFuZCB0aGVyZWZvcmUgYSBkb21haW4gc2hvdWxkIG5vdCBiZSBhYmxlIHRvIG1hbmFnZSB0aGVt
IHZpYSB0aGUgSU9NRU0gCmludGVyZmFjZSIuCgo+ICsgICAgaWYgKCBzdHJuaWNtcChkdF9ub2Rl
X2Z1bGxfbmFtZShkZXYpLCAiL3Jlc2VydmVkLW1lbW9yeS8iLAo+ICsgICAgICAgICBzdHJsZW4o
Ii9yZXNlcnZlZC1tZW1vcnkvIikpICE9IDAgKQo+ICAgICAgIHsKPiAtICAgICAgICBwcmludGso
WEVOTE9HX0VSUiAiVW5hYmxlIHRvIHBlcm1pdCB0byBkb20lZCBhY2Nlc3MgdG8iCj4gLSAgICAg
ICAgICAgICAgICIgMHglIlBSSXg2NCIgLSAweCUiUFJJeDY0IlxuIiwKPiAtICAgICAgICAgICAg
ICAgZC0+ZG9tYWluX2lkLAo+IC0gICAgICAgICAgICAgICBhZGRyICYgUEFHRV9NQVNLLCBQQUdF
X0FMSUdOKGFkZHIgKyBsZW4pIC0gMSk7Cj4gLSAgICAgICAgcmV0dXJuIHJlczsKPiArICAgICAg
ICByZXMgPSBpb21lbV9wZXJtaXRfYWNjZXNzKGQsIHBhZGRyX3RvX3BmbihhZGRyKSwKPiArICAg
ICAgICAgICAgICAgIHBhZGRyX3RvX3BmbihQQUdFX0FMSUdOKGFkZHIgKyBsZW4gLSAxKSkpOwo+
ICsgICAgICAgIGlmICggcmVzICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIHByaW50ayhY
RU5MT0dfRVJSICJVbmFibGUgdG8gcGVybWl0IHRvIGRvbSVkIGFjY2VzcyB0byIKPiArICAgICAg
ICAgICAgICAgICAgICAiIDB4JSJQUkl4NjQiIC0gMHglIlBSSXg2NCJcbiIsCj4gKyAgICAgICAg
ICAgICAgICAgICAgZC0+ZG9tYWluX2lkLAo+ICsgICAgICAgICAgICAgICAgICAgIGFkZHIgJiBQ
QUdFX01BU0ssIFBBR0VfQUxJR04oYWRkciArIGxlbikgLSAxKTsKPiArICAgICAgICAgICAgcmV0
dXJuIHJlczsKPiArICAgICAgICB9Cj4gICAgICAgfQo+ICAgCj4gICAgICAgaWYgKCBuZWVkX21h
cHBpbmcgKQo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
