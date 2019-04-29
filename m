Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F84FE70B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 17:58:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL8c6-0001tL-4v; Mon, 29 Apr 2019 15:54:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cijb=S7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hL8c4-0001tB-8V
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:54:40 +0000
X-Inumbo-ID: 17e2037f-6a97-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 17e2037f-6a97-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 15:54:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F6C780D;
 Mon, 29 Apr 2019 08:54:38 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D9963F5C1;
 Mon, 29 Apr 2019 08:54:36 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
 <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
 <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
 <5CC2D27C02000078002295F6@prv1-mh.provo.novell.com>
 <43510317-ca8a-ed23-835a-86a28286b919@arm.com>
 <5CC3283A0200007800229832@prv1-mh.provo.novell.com>
 <72a0eee1-1d29-2368-3737-d37f7a4926c6@arm.com>
 <alpine.DEB.2.10.1904261621360.24598@sstabellini-ThinkPad-X260>
 <5CC6A47E0200007800229D67@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <10687f88-fb6b-721c-c6e8-a1ab06023616@arm.com>
Date: Mon, 29 Apr 2019 16:54:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CC6A47E0200007800229D67@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: skip first page when RAM starts at
 0x0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefanos@xilinx.com>, nd@arm.com,
 206497@studenti.unimore.it, xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyOS8wNC8yMDE5IDA4OjE1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNy4w
NC4xOSBhdCAwMTo0NywgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiBUaGUgb3Ro
ZXIgY2hhbmdlIHRvIG5yX3BkeHMgaXMgbGVzcyBvYnZpb3VzLiBJdCBpcyBjbGVhciB0aGF0IG5y
X3BkeHMgaXMKPj4gY2FsY3VsYXRlZCB3cm9uZ2x5IGluIHRoaXMgY2FzZSAobWVtb3J5IDAtMHg4
MDAwMDAwMCwKPj4gMHg4MDAwMDAwMDAtMHg4ODAwMDAwMDAsIHBzPTAsIHBlPTB4ODgwMDAwMDAw
KTogbnJfcGR4cz01MjQyODggd2hpY2ggaXMKPj4gaGFsZiB0aGUgbnVtYmVyIHdlIG5lZWQgKHRo
ZSBjb3JyZWN0IG51bWJlciBpcyAxMDQ4NTc1KS4KPj4KPj4gVGFraW5nIGEgbGluZSBmcm9tIHRo
ZSB4ODYgY29kZSB4ZW4vYXJjaC94ODYvc2V0dXAuYzpzZXR1cF9tYXhfcGR4Cj4+IChKdWxpZW4n
cyBzdWdnZXN0aW9uKToKPj4KPj4gICAgbWF4X3BkeCA9IHBmbl90b19wZHgodG9wX3BhZ2UgLSAx
KSArIDE7Cj4+Cj4+IEkgY2hhbmdlZCBucl9wZHhzIHRvCj4+ICAgIAo+PiAgICBucl9wZHhzID0g
cGZuX3RvX3BkeCgocGUgPj4gUEFHRV9TSElGVCkgLSAxKSArIDE7Cj4+Cj4+IGFuZCBpdCB3b3Jr
cy4gSSB0aGluayB0aGUgY2hhbmdlIGlzIGNvcnJlY3QgYmVjYXVzZSBsb29raW5nIGF0IHRoZQo+
PiBpbXBsZW1lbnRhdGlvbiBvZiBwZm5fdG9fcGR4IGl0IGlzIGNlcnRhaW5seSBtZWFudCB0byBv
cGVyYXRlIG9uIGEgcGZuCj4+IG1hc2tpbmcgYml0cyBvbiBpdCB0byBjb21wZW5zYXRlIGZvciB0
aGUgaG9sZXMuIEl0IGlzIG5vdCBtZWFudCB0byB3b3JrCj4+IG9uIGEgc2l6ZS4KPj4KPj4gSmFu
LCBkb2VzIGl0IGxvb2sgY29ycmVjdCB0byB5b3UgdG9vPwo+IAo+IFllcy4gcGZuX3RvX3BkeCgp
IGFuZCBmcmllbmRzIG1heSBvbmx5IGV2ZXIgYmUgcGFzc2VkIGFjdHVhbAo+IFBGTnMgLyBQRFhl
cywgbm90IHNvbWV0aGluZyB0aGF0J3Mgb25lIGFib3ZlIG9yIG9uZSBiZWxvdyBhCj4gdmFsaWQg
cmFuZ2UuIEkgc2hhcmUgSnVsaWVuJ3MgcXVlc3Rpb24gdGhvdWdoOiBXYXMgaXQgcmVhbGx5IG1l
cmUKPiBsdWNrIHRoYXQgdGhpbmdzIGhhdmUgYmVlbiB3b3JraW5nIHRvIGRhdGU/CgpUTERSOyB1
bmV4cGxhaW5lZCB0byBub3Qgc2F5IG1lcmUgbHVjawoKV2UgZGVmaW5lIHRoZSBzaXplIG9mIHRo
ZSBmcmFtZXRhYmxlIHVzaW5nOgoKbnJfcGR4cyA9IHBmbl90b19wZHgocGUgLSBwcyk7CmZyYW1l
dGFibGVfc2l6ZSA9IG5yX3BkeHMgKiBzaXplb2YgKHN0cnVjdCBwYWdlX2luZm8pOwoKbWZuX3Rv
X3BhZ2UgaXMgaW1wbGVtZW50ZWQgdGhlIGZvbGxvd2luZyB3YXk6CgpmcmFtZV90YWJsZSArICht
Zm5fdG9fcGR4KG1mbikgLSBmcmFtZXRhYmxlX2Jhc2VfcGR4KQoKV2hlcmUgZnJhbWV0YWJsZV9i
YXNlX3BkeCA9IHBmbl90b19wZHgocHMgPj4gUEFHRV9TSElGVCkKCk9uIHRoZSB0d28gcGxhdGZv
cm1zIChKdW5vLXIyICsgRm91bmRhdGlvbiBNb2RlbCkgSSB0ZXN0ZWQgdG9kYXksIHNvbWVob3cK
CnBmbl90b19wZHgocGUgLSBwcykgPT0gKHBmbl90b19wZHgoKHBlID4+IFBBR0VfU0hJRlQpIC0g
MSkgKyAxKSAtIApmcmFtZXRhYmxlX2Jhc2VfcGR4KQoKU28gdGhlIGZyYW1ldGFibGUgaXMgY29y
cmVjdGx5IHNpemVkIGJ1dCBJIGhvbmVzdGx5IEkgaGF2ZSBubyBpZGVhIHdoeSBpdCB3b3Jrcy4K
CkFueXdheSwgSSBhbHNvIHRlc3RlZCB0aGUgY2hhbmdlIHN1Z2dlc3RlZCBieSBTdGVmYW5vLiBU
aGlzIHdpbGwgc3Vic3RhbnRpYWxseSAKaW5jcmVhc2UgdGhlIHNpemUgb2YgdGhlIGZyYW1ldGFi
bGUgb24gcGxhdGZvcm0gd2hlcmUgdGhlIFJBTSBkb2VzIG5vdCBzdGFydCBhdCAwLgoKRm9yIGlu
c3RhbmNlLCBvbiBGb3VuZGF0aW9uIE1vZGVsIHRoZSBSQU0gc3RhcnRzIGF0IDJHQi4gQXMgd2Ug
ZG9uJ3QgY29tcHJlc3MgCmFueSBvZiB0aGUgZmlyc3QgMzEgYml0cywgdGhlIGZyYW1ldGFibGUg
d2lsbCBub3cgYmUgMjhNQiBiaWdnZXIgdGhhbiB3ZSAKY3VycmVudGx5IGhhdmUgKDExMk1CIHVw
IGZyb20gODRNQikuCgpTbyBJIHRoaW5rIHdoYXQgd2Ugd2FudCBpczoKCm5yX3BkeHMgPSBwZm5f
dG9fcGR4KGVuZCAtIDEpIC0gcGZuX3RvX3BkeChzdGFydCkgKyAxOwpmcmFtZV90YWJsZV9iYXNl
X3BkeCA9IHBmbl90b19wZHgoc3RhcnQpOwoKT24gYSBzaWRlIG5vdGUsIEkgbm90aWNlZCB0aGF0
IHRoZSB0YWJsZSBpcyBzdGlsbCBtdWNoIGJpZ2dlciB0aGFuIGl0IHNob3VsZCBiZS4gCjRHQiBv
ZiBSQU0gc2hvdWxkIG9ubHkgcmVxdWlyZSBhIGZyYW1ldGFibGUgb2YgNTZNQiwgYnV0IGl0IGlz
IDg0TUIuIEFueXdheSwgCnRoYXQncyBwcm9iYWJseSBhIHNlcGFyYXRlIGRpc2N1c3Npb24uCgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
