Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A4D56DB0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 17:30:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg9qj-0007FQ-10; Wed, 26 Jun 2019 15:28:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hg9qg-0007FI-UX
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 15:28:38 +0000
X-Inumbo-ID: 104b6bac-9827-11e9-868b-8b59a5c11dec
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 104b6bac-9827-11e9-868b-8b59a5c11dec;
 Wed, 26 Jun 2019 15:28:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50E3B2B;
 Wed, 26 Jun 2019 08:28:35 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 957403F706;
 Wed, 26 Jun 2019 08:28:34 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-3-julien.grall@arm.com>
 <alpine.DEB.2.21.1906251627270.5851@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906251656420.5851@sstabellini-ThinkPad-T480s>
 <31afe099-1a7b-d8f3-6d11-0fdf78594c2e@arm.com>
 <alpine.DEB.2.21.1906260827080.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d8c94588-8f7f-84a5-aed1-fe7bfe7bd178@arm.com>
Date: Wed, 26 Jun 2019 16:28:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906260827080.5851@sstabellini-ThinkPad-T480s>
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

SGkgU3RlZmFubywKCk9uIDI2LzA2LzIwMTkgMTY6MjcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBXZWQsIDI2IEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIFN0ZWZh
bm8sCj4+Cj4+IE9uIDI2LzA2LzIwMTkgMDA6NTksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
Pj4+IE9uIFR1ZSwgMjUgSnVuIDIwMTksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+PiBP
biBNb24sIDEwIEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+PiAgICBUaGUgY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgbWFjcm8gUFJJTlQgd2lsbCBjbG9iYmVyIHgzMC9s
ci4KPj4+Pj4+IFRoaXMKPj4+Pj4gbWVhbnMgdGhlIHVzZXIgc2hvdWxkIHNhdmUgbHIgaWYgaXQg
Y2FyZXMgYWJvdXQgaXQuCj4+Pj4KPj4+PiBCeSB4MzAvbHIsIGRvIHlvdSBtZWFuIHgwLXgzIGFu
ZCBscj8gSSB3b3VsZCBwcmVmZXIgYSBjbGVhcmVyCj4+Pj4gZXhwcmVzc2lvbi4KPj4+Cj4+PiBO
byBvZiBjb3Vyc2Ugbm90ISBZb3UgbWVhbnQgeDMwIHdoaWNoIGlzIGEgc3lub255bSBvZiBsciEg
SXQgaXMganVzdAo+Pj4gdGhhdCBpbiB0aGlzIGNhc2UgaXQgaXMgYWxzbyBzdXBwb3NlZCB0byBj
bG9iYmVyIHgwLXgzIC0tIEkgZ290Cj4+PiBjb25mdXNlZCEgVGhlIGNvbW1pdCBtZXNzYWdlIGlz
IGFsc28gZmluZSBhcyBpcyB0aGVuLiBNb3JlIGJlbG93Lgo+Pj4KPj4+Cj4+Pj4gUmV2aWV3ZWQt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4+Pgo+Pj4+
Cj4+Pj4+IEZvbGxvdy11cCBwYXRjaGVzIHdpbGwgaW50cm9kdWNlIG1vcmUgdXNlIG9mIFBSSU5U
IGluIHBsYWNlIHdoZXJlIGxyCj4+Pj4+IHNob3VsZCBiZSBwcmVzZXJ2ZWQuIFJhdGhlciB0aGFu
IHJlcXVpcmluZyBhbGwgdGhlIHVzZXJzIHRvIHByZXNlcnZlIGxyLAo+Pj4+PiB0aGUgbWFjcm8g
UFJJTlQgaXMgbW9kaWZpZWQgdG8gc2F2ZSBhbmQgcmVzdG9yZSBpdC4KPj4+Pj4KPj4+Pj4gV2hp
bGUgdGhlIGNvbW1lbnQgc3RhdGUgeDMgd2lsbCBiZSBjbG9iYmVyZWQsIHRoaXMgaXMgbm90IHRo
ZSBjYXNlLiBTbwo+Pj4+PiBQUklOVCB3aWxsIHVzZSB4MyB0byBwcmVzZXJ2ZSBsci4KPj4+Pj4K
Pj4+Pj4gTGFzdGx5LCB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byBtb3ZlIHRoZSBjb21tZW50IG9u
IHRvcCBvZiBQUklOVCBhbmQgdXNlCj4+Pj4+IFBSSU5UIGluIGluaXRfdWFydC4gQm90aCBjaGFu
Z2VzIHdpbGwgYmUgaGVscGZ1bCBpbiBhIGZvbGxvdy11cCBwYXRjaC4KPj4+Pj4KPj4+Pj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4+Pj4gLS0t
Cj4+Pj4+ICAgIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCAxNCArKysrKysrKystLS0tLQo+
Pj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+
Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9h
cmNoL2FybS9hcm02NC9oZWFkLlMKPj4+Pj4gaW5kZXggYzhiYmRmMDVhNi4uYTUxNDdjOGQ4MCAx
MDA2NDQKPj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+Pj4+PiArKysgYi94
ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4+Pj4+IEBAIC03OCwxMiArNzgsMTcgQEAKPj4+Pj4g
ICAgICogIHgzMCAtIGxyCj4+Pj4+ICAgICAqLwo+Pj4+PiAgICAtLyogTWFjcm8gdG8gcHJpbnQg
YSBzdHJpbmcgdG8gdGhlIFVBUlQsIGlmIHRoZXJlIGlzIG9uZS4KPj4+Pj4gLSAqIENsb2JiZXJz
IHgwLXgzLiAqLwo+Pj4+PiAgICAjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USwo+Pj4+PiArLyoK
Pj4+Pj4gKyAqIE1hY3JvIHRvIHByaW50IGEgc3RyaW5nIHRvIHRoZSBVQVJULCBpZiB0aGVyZSBp
cyBvbmUuCj4+Pj4+ICsgKgo+Pj4+PiArICogQ2xvYmJlcnMgeDAgLSB4Mwo+Pj4+PiArICovCj4+
Pj4+ICAgICNkZWZpbmUgUFJJTlQoX3MpICAgICAgICAgICBcCj4+Pj4+ICsgICAgICAgIG1vdiAg
IHgzLCBsciAgOyAgICAgXAo+Pj4+PiAgICAgICAgICAgIGFkciAgIHgwLCA5OGYgOyAgICAgXAo+
Pj4+PiAgICAgICAgICAgIGJsICAgIHB1dHMgICAgOyAgICAgXAo+Pj4+PiArICAgICAgICBtb3Yg
ICBsciwgeDMgIDsgICAgIFwKPj4+Pj4gICAgICAgICAgICBST0RBVEFfU1RSKDk4LCBfcykKPj4+
Cj4+PiBTdHJhbmdlbHkgZW5vdWdoIEkgZ2V0IGEgYnVpbGQgZXJyb3Igd2l0aCBnY2MgNy4zLjEs
IGJ1dCBpZiBJIHVzZSB4MzAKPj4+IGluc3RlYWQgb2YgbHIsIGl0IGJ1aWxkcyBmaW5lLiBIYXZl
IHlvdSBzZWVuIHRoaXMgYmVmb3JlPwo+Pgo+PiBIbW1tLCBJIGNhbid0IHRvIHJlcHJvZHVjZSBp
dCBldmVuIG9uIG9sZGVyIGNvbXBpbGVyICg0LjkpLiBNeSBndWVzcyBpcyBub3QKPj4gYWxsIHRo
ZSBhc3NlbWJsZXIgaXMgYWJsZSB0byB1bmRlcnN0YW5kICJsciIuCj4+Cj4+IEluIHRoZSBmaWxl
IGVudHJ5LlMgd2UgaGF2ZSB0aGUgZm9sbG93aW5nIGxpbmU6Cj4+Cj4+IGxyICAgICAgLnJlcSAg
ICB4MzAgICAgICAgICAgICAgLy8gbGluayByZWdpc3Rlcgo+Pgo+Pgo+PiBDb3VsZCB5b3UgZ2l2
ZSBhIHRyeSB0byBhZGQgdGhlIGxpbmUgaW4gaGVhZC5TPwo+IAo+IFRoYXQgd29ya3MKClRoYW5r
IHlvdS4KCkkgdGhvdWdodCBhIGJpdCBtb3JlIGR1cmluZyB0aGUgZGF5IGFuZCBkZWNpZGVkIHRv
IHVzZSAieDMwIiBkaXJlY3RseSByYXRoZXIgCnRoYW4gbHIuIFdlIGNhbiBkZWNpZGUgdG8gcmV2
aXNpdCBpdCBpZiB3ZSB0aGluayB0aGUgY29kZSBpcyB0b28gZGlmZmljdWx0IHRvIHJlYWQuCgpD
aGVlcnMsCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
