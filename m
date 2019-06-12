Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A7642B83
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 17:59:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb5cc-0006kR-H3; Wed, 12 Jun 2019 15:57:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hb5ca-0006kM-M3
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 15:57:08 +0000
X-Inumbo-ID: bae5e428-8d2a-11e9-857b-b7be5620b34d
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bae5e428-8d2a-11e9-857b-b7be5620b34d;
 Wed, 12 Jun 2019 15:57:07 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 05DEC21019;
 Wed, 12 Jun 2019 15:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560355027;
 bh=x1WgIsUfC7lOW+IPMZZ1sVwa5npFEZdb53zeorBdfvs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Ck5DtMrNiEy6yoAHQEUdbEMvCM2z1Rvid5ydL/3P/54syC69gYBbNLyVBS9VofKs3
 ZSpguu7BMWlwrgAsFRHHSl5Hd+3Y032Wfz9iPWuqPTFlMvqSwC4he4bWNnmjFnIlQZ
 0LXwCb6Dxh/oShaxr5s7pGO6AmZmQoOCPRE7zcCw=
Date: Wed, 12 Jun 2019 08:57:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <2dbf8e6c-04ae-0925-cc1f-cfcb65678272@arm.com>
Message-ID: <alpine.DEB.2.21.1906120856530.13737@sstabellini-ThinkPad-T480s>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1906111134410.13737@sstabellini-ThinkPad-T480s>
 <6ad24adc-dfb7-a2da-b4c8-2fe49c61a31f@arm.com>
 <c2876923-91b7-77ef-c14a-c4c46b0cfcb7@citrix.com>
 <2dbf8e6c-04ae-0925-cc1f-cfcb65678272@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] Checking INVALID_MFN in mfn_add (WAS: Re: [PATCH
 MM-PART3 v2 04/12] xen/arm: mm: Only increment mfn when valid in
 xen_pt_update)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxMiBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDEx
LzA2LzIwMTkgMjE6MjQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPiBPbiAxMS8wNi8yMDE5IDIw
OjU2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IE9uIDExLzA2LzIwMTkgMTk6MzcsIFN0ZWZh
bm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIDE0IE1heSAyMDE5LCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4gPiA+ID4gPiBDdXJyZW50bHksIHRoZSBNRk4gd2lsbCBiZSBpbmNyZW1l
bnRlZCBldmVuIGlmIGl0IGlzIGludmFsaWQuIFRoaXMKPiA+ID4gPiA+IHdpbGwKPiA+ID4gPiA+
IHJlc3VsdCB0byBoYXZlIGEgdmFsaWQgTUZOIGFmdGVyIHRoZSBmaXJzdCBpdGVyYXRpb24uCj4g
PiA+ID4gPiAKPiA+ID4gPiA+IFdoaWxlIHRoaXMgaXMgbm90IGEgbWFqb3IgcHJvYmxlbSB0b2Rh
eSwgdGhpcyB3aWxsIGJlIGluIHRoZSBmdXR1cmUgaWYKPiA+ID4gPiA+IHRoZSBjb2RlIGV4cGVj
dCBhbiBpbnZhbGlkIE1GTiBhdCBldmVyeSBpdGVyYXRpb24uCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IFN1Y2ggYmVoYXZpb3IgaXMgcHJldmVudGVkIGJ5IGF2b2lkaW5nIHRvIGluY3JlbWVudCBhbiBp
bnZhbGlkIE1GTi4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBBbmRyaWkg
QW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAtLS0K
PiA+ID4gPiA+ICAgICAgIENoYW5nZXMgaW4gdjI6Cj4gPiA+ID4gPiAgICAgICAgICAgLSBNb3Zl
IHRoZSBwYXRjaCBlYXJsaWVyIG9uIGluIHRoZSBzZXJpZXMKPiA+ID4gPiA+ICAgICAgICAgICAt
IEFkZCBBbmRyaWkncyByZXZpZXdlZC1ieQo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgICB4ZW4v
YXJjaC9hcm0vbW0uYyB8IDUgKysrKy0KPiA+ID4gPiA+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPiA+IAo+ID4gPiA+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKPiA+ID4gPiA+IGluZGV4
IGY5NTZhYTYzOTkuLjlkZTJhMTE1MGYgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS94ZW4vYXJjaC9h
cm0vbW0uYwo+ID4gPiA+ID4gKysrIGIveGVuL2FyY2gvYXJtL21tLmMKPiA+ID4gPiA+IEBAIC0x
MDUxLDExICsxMDUxLDE0IEBAIHN0YXRpYyBpbnQgeGVuX3B0X3VwZGF0ZShlbnVtIHhlbm1hcF9v
cGVyYXRpb24KPiA+ID4gPiA+IG9wLAo+ID4gPiA+ID4gICAgICAgICAgIHNwaW5fbG9jaygmeGVu
X3B0X2xvY2spOwo+ID4gPiA+ID4gICAgLSAgICBmb3IoOyBhZGRyIDwgYWRkcl9lbmQ7IGFkZHIg
Kz0gUEFHRV9TSVpFLCBtZm4gPSBtZm5fYWRkKG1mbiwKPiA+ID4gPiA+IDEpKQo+ID4gPiA+ID4g
KyAgICBmb3IoIDsgYWRkciA8IGFkZHJfZW5kOyBhZGRyICs9IFBBR0VfU0laRSApCj4gPiA+ID4g
PiAgICAgICAgewo+ID4gPiA+ID4gICAgICAgICAgICByYyA9IHhlbl9wdF91cGRhdGVfZW50cnko
b3AsIGFkZHIsIG1mbiwgZmxhZ3MpOwo+ID4gPiA+ID4gICAgICAgICAgICBpZiAoIHJjICkKPiA+
ID4gPiA+ICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAg
ICAgaWYgKCAhbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pICkKPiA+ID4gPiA+ICsgICAgICAgICAg
ICBtZm4gPSBtZm5fYWRkKG1mbiwgMSk7Cj4gPiA+ID4gPiAgICAgICAgfQo+ID4gPiA+IFRoaXMg
aXMgT0sgYnV0IGdvdCBtZSB0aGlua2luZzogc2hvdWxkIHdlIGJlIHVwZGF0aW5nIHRoZSBtZm4g
aW4gbWZuX2FkZAo+ID4gPiA+IGlmIHRoZSBtZm4gaXMgSU5WQUxJRD8gVGhlIG1mbl9lcShtZm4s
IElOVkFMSURfTUZOKSBjb3VsZCBsaXZlIGluc2lkZQo+ID4gPiA+IHRoZSBzdGF0aWMgaW5saW5l
IG1mbl90IG1mbl9hZGQgZnVuY3Rpb24uIFdoYXQgZG8geW91IHRoaW5rPyBJIGRvbid0Cj4gPiA+
ID4gdGhpbmsgdGhlcmUgYXJlIGFueSB2YWxpZCBzY2VuYXJpb3Mgd2hlcmUgd2Ugd2FudCB0byBp
bmNyZW1lbnQKPiA+ID4gPiBJTlZBTElEX01GTi4uLgo+ID4gPiBNeSBmaXJzdCB0aG91Z2h0IGlz
IG1mbl9hZGQoLi4uKSBtYXkgYmUgdXNlZCBpbiBwbGFjZSB3aGVyZSB3ZSBrbm93IHRoZQo+ID4g
PiBtZm4gaXMgbm90IElOVkFMSURfTUZOLiBTbyB3ZSB3b3VsZCBhZGQgZXh0cmEgY2hlY2sgd2hl
biBpdCBtYXkgbm90IGJlCj4gPiA+IG5lY2Vzc2FyeS4gQWx0aG91Z2gsIEkgYW0gbm90IHN1cmUg
aWYgaXQgaXMgaW1wb3J0YW50Lgo+ID4gPiAKPiA+ID4gSSBoYXZlIGFkZGVkIEFuZHJldyAmIEph
biB0byBnZXQgYW55IG9waW5pb25zLgo+ID4gCj4gPiBtZm5fYWRkKGZvbywgYmFyKSBpcyBzaG9y
dGhhbmQgZm9yIGZvbyArPSBiYXIsIGFuZCBzaG91bGQgcmVtYWluIGFzIHN1Y2guCj4gPiAKPiA+
IEl0IGV4aXN0cyBvbmx5IGJlY2F1c2Ugd2UgY2FuJ3Qgb3ZlcmxvYWQgb3BlcmF0b3JzIGluIEMs
IGFuZCB3YW50Cj4gPiBzb21ldGhpbmcgc2xpZ2h0bHkgbW9yZSByZWFkYWJsZSB0aGFuIF9tZm4o
bWZuX3goZm9vKSArIGJhcikKPiA+IAo+ID4gQmVoaW5kIHRoZSBzY2VuZXMsIHRoZSBjb21waWxl
ciB3aWxsIHR1cm4gaXQgYmFjayBpbnRvIGEgc2luZ2xlIGFkZAo+ID4gaW5zdHJ1Y3Rpb24uCj4g
PiAKPiA+IFRoZSBzYXR1cmF0aW5nIGJlaGF2aW91ciBoZXJlIGlzIHNwZWNpZmljIHRvIHRoZSBw
YWdldGFibGUgb3BlcmVhdGlvbnMKPiA+IHdoZXJlIHBhc3NpbmcgSU5WQUxJRF9NRk4gaXMgYW4g
YWxpYXMgZm9yIHVubWFwLCBhbmQgaXMgdGhlcmVmb3JlIG5vdAo+ID4gdXNlZnVsIGluIHRoZSBt
YWpvcml0eSBvZiB0aGUgdXNlcnMgb2YgbWZuX2FkZCgpLCBhbmQgY2VydGFpbmx5IG5vdAo+ID4g
c29tZXRoaW5nIHdlIHNob3VsZCBoYXZlIGEgaGlkZGVuIGJyYW5jaCBmb3IgaW4gdGhlIG1pZGRs
ZSBvZiBtYW55IHRpZ2h0Cj4gPiBsb29wcy4KPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBpbnB1dCEg
SSB3aWxsIGtlZXAgbWZuX2FkZCgpIGFzIGl0IGlzLgoKQWRkIG15IGFja2VkLWJ5IHRvIHRoZSBv
cmlnaW5hbCBwYXRjaC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
