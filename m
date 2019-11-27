Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 230AA10B1D7
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 16:05:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZyp7-0005tr-9y; Wed, 27 Nov 2019 15:01:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=juU/=ZT=arm.com=mark.rutland@srs-us1.protection.inumbo.net>)
 id 1iZyp5-0005tm-UG
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 15:01:43 +0000
X-Inumbo-ID: d2ae0010-1126-11ea-a3b7-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d2ae0010-1126-11ea-a3b7-12813bfff9fa;
 Wed, 27 Nov 2019 15:01:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A53ED30E;
 Wed, 27 Nov 2019 07:01:42 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFC373F68E;
 Wed, 27 Nov 2019 07:01:39 -0800 (PST)
Date: Wed, 27 Nov 2019 15:01:37 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Message-ID: <20191127150137.GB51937@lakrids.cambridge.arm.com>
References: <20191122022406.590141-1-pasha.tatashin@soleen.com>
 <20191122022406.590141-3-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122022406.590141-3-pasha.tatashin@soleen.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Subject: Re: [Xen-devel] [PATCH v2 2/3] arm64: remove uaccess_ttbr0 asm
 macros from cache functions
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
Cc: catalin.marinas@arm.com, stefan@agner.ch, linux@armlinux.org.uk,
 yamada.masahiro@socionext.com, will@kernel.org, boris.ostrovsky@oracle.com,
 sashal@kernel.org, sstabellini@kernel.org, jmorris@namei.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org,
 vladimir.murzin@arm.com, marc.zyngier@arm.com, alexios.zavras@intel.com,
 tglx@linutronix.de, allison@lohutok.net, jgross@suse.com, steve.capper@arm.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, james.morse@arm.com,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF2ZWwsCgpPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAwOToyNDowNVBNIC0wNTAwLCBQYXZl
bCBUYXRhc2hpbiB3cm90ZToKPiBSZXBsYWNlIHRoZSB1YWNjZXNzX3R0YnIwX2Rpc2FibGUvdWFj
Y2Vzc190dGJyMF9lbmFibGUgdmlhCj4gaW5saW5lIHZhcmlhbnRzLCBhbmQgcmVtb3ZlIGFzbSBt
YWNyb3MuCgpBIGNvbW1pdCBtZXNzYWdlIHNob3VsZCBwcm92aWRlIHJhdGlvbmFsZSwgcmF0aGVy
IHRoYW4ganVzdCBhCmRlc2NyaXB0aW9uIG9mIHRoZSBwYXRjaC4gU29tZXRoaW5nIGxpa2U6Cgp8
IFdlIGN1cnJlbnRseSBkdXBsaWNhdGUgdGhlIGxvZ2ljIHRvIGVuYWJsZS9kaXNhYmxlIHVhY2Nl
c3MgdmlhIFRUQlIwLAp8IHdpdGggQyBmdW5jdGlvbnMgYW5kIGFzc2VtYmx5IG1hY3Jvcy4gVGhp
cyBpcyBhIG1haW50ZW5lbmFjZSBidXJkZW4KfCBhbmQgaXMgbGlhYmxlIHRvIGxlYWQgdG8gc3Vi
dGxlIGJ1Z3MsIHNvIGxldCdzIGdldCByaWQgb2YgdGhlIGFzc2VtYmx5CnwgbWFjcm9zLCBhbmQg
YWx3YXlzIHVzZSB0aGUgQyBmdW5jdGlvbnMuIFRoaXMgcmVxdWlyZXMgcmVmYWN0b3JpbmcKfCBz
b21lIGFzc2VtYmx5IGZ1bmN0aW9ucyB0byBoYXZlIGEgQyB3cmFwcGVyLgoKWy4uLl0KCj4gK3N0
YXRpYyBpbmxpbmUgaW50IGludmFsaWRhdGVfaWNhY2hlX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3Rh
cnQsCj4gKwkJCQkJICB1bnNpZ25lZCBsb25nIGVuZCkKPiArewo+ICsJaW50IHJ2Owo+ICsjaWYg
QVJNNjRfSEFTX0NBQ0hFX0RJQwo+ICsJcnYgPSBhcmNoX2ludmFsaWRhdGVfaWNhY2hlX3Jhbmdl
KHN0YXJ0LCBlbmQpOwo+ICsjZWxzZQo+ICsJdWFjY2Vzc190dGJyMF9lbmFibGUoKTsKPiArCXJ2
ID0gYXJjaF9pbnZhbGlkYXRlX2ljYWNoZV9yYW5nZShzdGFydCwgZW5kKTsKPiArCXVhY2Nlc3Nf
dHRicjBfZGlzYWJsZSgpOwo+ICsjZW5kaWYKPiArCXJldHVybiBydjsKPiArfQoKVGhpcyBpZmRl
ZmZlcnkgaXMgbm90IHRoZSBzYW1lIGFzIGFuIGFsdGVybmF0aXZlX2lmLCBhbmQgZXZlbiBpZiBp
dCB3ZXJlCnRoZSBBUk02NF9IQVNfQ0FDSEVfRElDIGJlaGF2aW91ciBpcyBub3QgdGhlIHNhbWUg
YXMgdGhlIGV4aXN0aW5nCmFzc2VtYmx5LgoKVGhpcyBzaG91bGQgYmU6CgpzdGF0aWMgaW5saW5l
IGludCBpbnZhbGlkYXRlX2ljYWNoZV9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LAoJCQkJCSAg
dW5zaWduZWQgbG9uZyBlbmQpCnsKCWludCByZXQ7CgoJaWYgKGNwdXNfaGF2ZV9jb25zdF9jYXAo
QVJNNjRfSEFTX0NBQ0hFX0RJQykpIHsKCQlpc2IoKTsKCQlyZXR1cm4gMDsKCX0KCQoJdWFjY2Vz
c190dGJyMF9lbmFibGUoKTsKCXJldCA9IGFyY2hfaW52YWxpZGF0ZV9pY2FjaGVfcmFuZ2Uoc3Rh
cnQsIGVuZCk7Cgl1YWNjZXNzX3R0YnIwX2Rpc2FibGUoKTsKCglyZXR1cm4gcmV0Owp9CgpUaGUg
J2FyY2hfJyBwcmVmaXggc2hvdWxkIHByb2JhYmx5IGJlICdhc21fJyAob3IgaGF2ZSBhbiAnX2Fz
bScgc3VmZml4KSwKc2luY2UgdGhpcyBpcyBlbnRpcmVseSBsb2NhbCB0byB0aGUgYXJjaCBjb2Rl
LCBhbmQgZXZlbiB0aGVuIHNob3VsZCBvbmx5CmJlIGNhbGxlZCBmcm9tIHRoZSBDIHdyYXBwZXJz
LgoKVGhhbmtzLApNYXJrLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
