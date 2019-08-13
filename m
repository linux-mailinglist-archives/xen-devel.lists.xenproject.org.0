Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B948B340
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 11:03:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxSeQ-0000b1-W1; Tue, 13 Aug 2019 08:59:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxSeP-0000aw-MN
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 08:59:29 +0000
X-Inumbo-ID: a7ceceb4-bda8-11e9-8e4b-d785988b89a3
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a7ceceb4-bda8-11e9-8e4b-d785988b89a3;
 Tue, 13 Aug 2019 08:59:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2FF115AB;
 Tue, 13 Aug 2019 01:59:27 -0700 (PDT)
Received: from [10.37.8.112] (unknown [10.37.8.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B0533F706;
 Tue, 13 Aug 2019 01:59:26 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190812202735.23411-1-julien.grall@arm.com>
 <d904c960-3a9b-bcfc-1631-5be88f793862@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c98af17d-ace1-34b3-2d6f-36e1ff586ef9@arm.com>
Date: Tue, 13 Aug 2019 09:59:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d904c960-3a9b-bcfc-1631-5be88f793862@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: p2m: Free the p2m entry after
 flushing the IOMMU TLBs
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
Cc: olekstysh@gmail.com, oleksandr_tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gOC8xMy8xOSA5OjAzIEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9u
IDEyLzA4LzIwMTkgMjE6MjcsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gV2hlbiBmcmVlaW5nIGEg
cDJtIGVudHJ5LCBhbGwgdGhlIHN1Yi10cmVlIGJlaGluZCBpdCB3aWxsIGFsc28gYmUgZnJlZWQu
Cj4+IFRoaXMgbWF5IGluY2x1ZGUgaW50ZXJtZWRpYXRlIHBhZ2UtdGFibGVzIG9yIGFueSBsMyBl
bnRyeSByZXF1aXJpbmcgdG8KPj4gZHJvcCBhIHJlZmVyZW5jZSAoZS5nIGZvciBmb3JlaWduIHBh
Z2VzKS4gQXMgc29vbiBhcyBwYWdlcyBhcmUgZnJlZWQsCj4+IHRoZXkgbWF5IGJlIHJlLXVzZWQg
YnkgWGVuIG9yIGFub3RoZXIgZG9tYWluLiBUaGVyZWZvcmUgaXQgaXMgbmVjZXNzYXJ5Cj4+IHRv
IGZsdXNoICphbGwqIHRoZSBUTEJzIGJlZm9yZWhhbmQuCj4+Cj4+IFdoaWxlIENQVSBUTEJzIHdp
bGwgYmUgZmx1c2hlZCBiZWZvcmUgZnJlZWluZyB0aGUgcGFnZXMsIHRoaXMgaXMgbm90Cj4+IHRo
ZSBjYXNlIGZvciBJT01NVSBUTEJzLiBUaGlzIGNhbiBiZSBzb2x2ZWQgYnkgbW92aW5nIHRoZSBJ
T01NVSBUTEJzCj4+IGZsdXNoIGVhcmxpZXIgaW4gdGhlIGNvZGUuCj4+Cj4+IFRoaXMgd2Fzbid0
IGNvbnNpZGVyZWQgYXMgYSBzZWN1cml0eSBpc3N1ZSBhcyBkZXZpY2UgcGFzc3Rocm91Z2ggb24g
QXJtCj4+IGlzIG5vdCBzZWN1cml0eSBzdXBwb3J0ZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Cj4+IC0tLQo+Pgo+PiBDYzogb2xl
a3N0eXNoQGdtYWlsLmNvbQo+PiBDYzogb2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20KPj4K
Pj4gICAgICBJIGRpc2NvdmVyZWQgaXQgd2hpbGUgbG9va2luZyBhdCB0aGUgY29kZSwgc28gSSBk
b24ndCBoYXZlIGFueQo+PiAgICAgIHJlcHJvZHVjZXIgb2YgdGhlIGlzc3VlLiBUaGVyZSBpcyBh
IHNtYWxsIHdpbmRvd3Mgd2hlcmUgcGFnZSBjb3VsZAo+PiAgICAgIGJlIHJlYWxsb2NhdGVkIHRv
IFhlbiBvciBhbm90aGVyIGRvbWFpbiBidXQgc3RpbGwgcHJlc2VudCBpbiB0aGUKPj4gICAgICBJ
T01NVSBUTEJzLgo+Pgo+PiAgICAgIFRoaXMgcGF0Y2ggb25seSBhZGRyZXNzIHRoZSBjYXNlIHdo
ZXJlIHRoZSBmbHVzaCBzdWNjZWVkLiBJbiB0aGUKPj4gICAgICB1bmxpa2VseSBjYXNlIHdoZXJl
IGl0IGRvZXMgbm90IHN1Y2NlZWQsIHRoZW4gd2Ugd2lsbCBzdGlsbCBmcmVlIHRoZQo+PiAgICAg
IHBhZ2VzLiBUaGUgSU9NTVUgaGVscGVyIHdpbGwgY3Jhc2ggZG9tYWluLCBidXQgdGhlIGRldmlj
ZSBtYXkgc3RpbGwKPj4gICAgICBub3QgYmUgcXVpZXNjZW50LiBTbyB0aGVyZSBhcmUgYSBwb3Rl
bnRpYWxseSBpc3N1ZXMgZG8gRE1BIG9uIHdyb25nCj4+ICAgICAgdGhpbmdzLgo+Pgo+PiAgICAg
IEF0IHRoZSBtb21lbnQsIG5vbmUgb2YgdGhlIEFybSBJT01NVXMgZHJpdmVycyAoaW5jbHVkaW5n
IHRoZSBJUE1NVQo+PiAgICAgIG9uZSB1bmRlciByZXZpZXcpIGFyZSByZXR1cm4gYW4gZXJyb3Ig
aGVyZS4gTm90ZSB0aGF0IGZsdXNoIG1heQo+PiAgICAgIHN0aWxsIGZhaWwgKHNlZSB0aW1lb3V0
KSwgYnV0IGlzIGlnbm9yZWQuIFRoaXMgaXMgbm90IGdyZWF0IGFzIGl0Cj4+ICAgICAgbWVhbnMg
YSBkZXZpY2UgbWF5IERNQSBpbnRvIHNvbWV0aGluZyB0aGF0IGRvZXMgbm90IGJlbG9uZyB0byB0
aGUKPj4gICAgICBkb21haW4uIFNvIHdlIHByb2JhYmx5IHdhbnQgdG8gcmV0dXJuIGFuIGVycm9y
IGhlcmUuCj4+Cj4+ICAgICAgRXZlbiBpZiBhbiBlcnJvciBpcyByZXR1cm5lZCwgdGhlcmUgYXJl
IHN0aWxsIHBvdGVudGlhbCBpc3N1ZXMKPj4gICAgICAoc2VlIGFib3ZlKS4gVGhlIGZpeCBpcyBu
b3QgZW50aXJlbHkgdHJpdmlhbCwgd2Ugd291bGQgbmVlZCB0byBrZWVwCj4+ICAgICAgdGhlIHBh
Z2UgYXJvdW5kIHVudGlsIHRoZSBhIGRldmljZSBpcyBxdWllc2NlbnQgb3IgdGhlIElPTU1VIGlz
Cj4+ICAgICAgcmVzZXQuIFRoaXMgbW9zdGx5IGxpa2VseSBtZWFucyB1bnRpbCB0aGUgZG9tYWlu
IGlzIGZ1bGx5IGRlc3Ryb3llZC4KPiAKPiBYZW4ncyBiZWhhdmlvdXIgd2l0aCBJT01NVSB0aW1l
b3V0cyBpcyBicm9rZW4sIGFuZCBkZWZpbml0ZWx5IHVuc2FmZS4KPiAKPiBXZSBkbyBub3QgKGFu
ZCBpbmRlZWQgbXVzdCBub3QpIGltcG9zZSBhIHRpbWVvdXQgZm9yIFRMQiBmbHVzaAo+IG9wZXJh
dGlvbnMgbG9jYWxseSBpbiB0aGUgY29yZS7CoCBJT1RMQiBmbHVzaCBvcGVyYXRpb25zIGFyZSBu
byBkaWZmZXJlbnQuCgpXZWxsIHRoZXJlIGlzIGEgZGlmZmVyZW5jZSBiZXR3ZWVuIENQVSBUTEIg
Zmx1c2ggYW5kIElPVExCIGZsdXNoLiBGb3IgCnRoZSBmb3JtZXIsIHRoZSBkc2IgaXNiIHNlcXVl
bmNlIGlzIGVub3VnaCB0byBlbnN1cmUgdGhlIGNvbXBsZXRpb24uCgpGb3IgdGhlIGxhdHRlciB5
b3UgbmVlZCB0byBwb2xsIGEgcmVnaXN0ZXIgdG8gY2hlY2sgdGhlIGNvbXBsZXRpb24uCgo+IAo+
IElmIHRoZSBJT01NVSBzdGFydHMgbWFsZnVuY3Rpb25pbmcsIHRoYXQgaXMgZmF0YWwgdG8gdGhl
IHdob2xlIHN5c3RlbSwKPiBub3QganVzdCB0aGUgZ3Vlc3QgaW4gcXVlc3Rpb24uCgpXaGV0aGVy
IHRoaXMgaXMgYSBmYXRhbCBvciBub3QsIHdlIG5lZWQgdG8gZGV0ZWN0IGl0IGFuZCBtYWtlIHN1
cmUgaXQgCmRvZXMgbm90IGRvIG1vcmUgZGFtYWdlIG9uIHRoZSBzeXN0ZW1zLgoKPiAKPiBUaGUg
b25seSB2aWFibGUgYXBwcm9hY2ggaXMgdG8gZHJvcCB0aGUgYXJ0aWZpY2lhbCB0aW1lb3V0cyBh
bmQgdXAgdGhlCj4gc2V2ZXJpdHkgb2YgYSBtYWxmdW5jdGlvbi4KCkkgYW0gbm90IHN1cmUgdG8g
dW5kZXJzdGFuZCB5b3VyIHN1Z2dlc3Rpb24uLi4gSWYgeW91IGRyb3AgdGhlIHRpbWVvdXQsIApo
b3cgZG8geW91IGRldGVjdCBhbiBJT01NVSBzdGFydHMgbWFsZnVuY3Rpb25pbmc/CgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
