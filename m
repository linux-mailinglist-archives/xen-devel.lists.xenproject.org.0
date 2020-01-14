Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AA813B21C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 19:29:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irQtu-0007AT-V7; Tue, 14 Jan 2020 18:26:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rxsW=3D=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1irQtt-0007AO-Mc
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 18:26:49 +0000
X-Inumbo-ID: 6d70c3ae-36fb-11ea-8424-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d70c3ae-36fb-11ea-8424-12813bfff9fa;
 Tue, 14 Jan 2020 18:26:49 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C615C24672;
 Tue, 14 Jan 2020 18:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579026408;
 bh=qnqGgrP8e9yV1OsuzVTzNXGikt0eU6jSP1VAIcJyBmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lrXuON6lNa/3kGMXfWgCZKeqToNfMEc/Bm81yU3i7YyzltzarzjHAYDGNnu+exqw5
 BWS8V+7Xk+pe0HfRkw7crfwWY+Sy7P0uSpIjfo6TNo07VEnP4BztnoU+rYjHs0VLrh
 fHeuTQaoSAjpIpBO2njoR8F/VNZT+HfKdUby0EI4=
Date: Tue, 14 Jan 2020 18:26:41 +0000
From: Will Deacon <will@kernel.org>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Message-ID: <20200114182641.GI2579@willie-the-truck>
References: <20200102211357.8042-1-pasha.tatashin@soleen.com>
 <20200102211357.8042-6-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102211357.8042-6-pasha.tatashin@soleen.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v5 5/6] arm64: move ARM64_HAS_CACHE_DIC/_IDC
 from asm to C
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, stefan@agner.ch,
 jmorris@namei.org, yamada.masahiro@socionext.com, boris.ostrovsky@oracle.com,
 sashal@kernel.org, sstabellini@kernel.org, maz@kernel.org,
 linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, vladimir.murzin@arm.com, julien@xen.org,
 alexios.zavras@intel.com, tglx@linutronix.de, allison@lohutok.net,
 jgross@suse.com, steve.capper@arm.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, james.morse@arm.com, andrew.cooper3@citrix.com,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMDIsIDIwMjAgYXQgMDQ6MTM6NTZQTSAtMDUwMCwgUGF2ZWwgVGF0YXNoaW4g
d3JvdGU6Cj4gVGhlIGFzc21ibHkgZnVuY3Rpb25zIF9fYXNtX2ZsdXNoX2NhY2hlX3VzZXJfcmFu
Z2UgYW5kCj4gX19hc21faW52YWxpZGF0ZV9pY2FjaGVfcmFuZ2UgaGF2ZSBhbHRlcm5hdGl2ZXM6
Cj4gCj4gYWx0ZXJuYXRpdmVfaWYgQVJNNjRfSEFTX0NBQ0hFX0RJQwo+IC4uLgo+IAo+IGFsdGVy
bmF0aXZlX2lmIEFSTTY0X0hBU19DQUNIRV9JREMKPiAuLi4KPiAKPiBCdXQsIHRoZSBpbXBsZW1l
bnRhdGlvbiBvZiB0aG9zZSBhbHRlcm5hdGl2ZXMgaXMgdHJpdmlhbCBhbmQgdGhlcmVmb3JlCj4g
Y2FuIGJlIGRvbmUgaW4gdGhlIEMgaW5saW5lIHdyYXBwZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFBhdmVsIFRhdGFzaGluIDxwYXNoYS50YXRhc2hpbkBzb2xlZW4uY29tPgo+IC0tLQo+ICBhcmNo
L2FybTY0L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCB8IDE5ICsrKysrKysrKysrKysrKysrKysK
PiAgYXJjaC9hcm02NC9tbS9jYWNoZS5TICAgICAgICAgICAgICAgfCAyNyArKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9hcm02NC9tbS9mbHVzaC5jICAgICAgICAgICAgICAgfCAg
MSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIGIv
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPiBpbmRleCAwNDdhZjMzOGJhMTUu
LmZjNTIxN2ExODM5OCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2NhY2hl
Zmx1c2guaAo+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCj4gQEAg
LTc3LDggKzc3LDIyIEBAIHN0YXRpYyBpbmxpbmUgbG9uZyBfX2ZsdXNoX2NhY2hlX3VzZXJfcmFu
Z2UodW5zaWduZWQgbG9uZyBzdGFydCwKPiAgewo+ICAJaW50IHJldDsKPiAgCj4gKwlpZiAoY3B1
c19oYXZlX2NvbnN0X2NhcChBUk02NF9IQVNfQ0FDSEVfSURDKSkgewo+ICsJCWRzYihpc2hzdCk7
Cj4gKwkJaWYgKGNwdXNfaGF2ZV9jb25zdF9jYXAoQVJNNjRfSEFTX0NBQ0hFX0RJQykpIHsKPiAr
CQkJaXNiKCk7Cj4gKwkJCXJldHVybiAwOwo+ICsJCX0KPiArCX0KPiArCj4gIAl1YWNjZXNzX3R0
YnIwX2VuYWJsZSgpOwo+ICAJcmV0ID0gX19hc21fZmx1c2hfY2FjaGVfdXNlcl9yYW5nZShzdGFy
dCwgZW5kKTsKCkkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzLiBEb2Vzbid0IGl0IG1lYW4gYSBDUFUg
d2l0aCBJREMgYnV0IG5vdCBESUMgd2lsbAplbmQgdXAgd2l0aCBkb2luZyB0aGUgRC1jYWNoZSBt
YWludGVuYW5jZT8KCldpbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
