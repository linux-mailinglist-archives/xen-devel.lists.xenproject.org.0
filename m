Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7508A7B457
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 22:29:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsYgo-00059v-Av; Tue, 30 Jul 2019 20:25:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsYgm-00059q-TF
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 20:25:40 +0000
X-Inumbo-ID: 31ac998e-b308-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 31ac998e-b308-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 20:25:38 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 278F92067D;
 Tue, 30 Jul 2019 20:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564518338;
 bh=HXl4tJCPskNIVgQjiF0qqkJrpdLR93s4ubvXE6Qv7SM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=gZ7G2mILrqWvUtHeCVRFw+JESKcon89nk1tX3ZHa1iQOuwLIF7v1EHC6/j1vWdzE4
 DV5goCL//ajEWR1h0tPlq8fUbjFq7+Yt4v+tD7jrY9agef3F+Ac5UWXBqr7W4b4Qeb
 So/J4qWAUtBF3/1Mp/qLLR2h8hMkf63MGMf+DSDc=
Date: Tue, 30 Jul 2019 13:25:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-30-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301324310.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-30-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 29/35] xen/arm32: head: Move assembly
 switch to the runtime PT in secondary CPUs path
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBhc3NlbWJseSBz
d2l0Y2ggdG8gdGhlIHJ1bnRpbWUgUFQgaXMgb25seSBuZWNlc3NhcnkgZm9yIHRoZQo+IHNlY29u
ZGFyeSBDUFVzLiBTbyBtb3ZlIHRoZSBjb2RlIGluIHRoZSBzZWNvbmRhcnkgQ1BVcyBwYXRoLgo+
IAo+IFdoaWxlIHRoaXMgaXMgZGVmaW5pdGVseSBub3QgY29tcGxpYW50IHdpdGggdGhlIEFybSBB
cm0gYXMgd2UgYXJlCj4gc3dpdGNoaW5nIGJldHdlZW4gdHdvIGRpZmZlcmVudHMgc2V0IG9mIHBh
Z2UtdGFibGVzIHdpdGhvdXQgdHVybmluZyBvZmYKPiB0aGUgTU1VLiBUdXJuaW5nIG9mZiB0aGUg
TU1VIGlzIGltcG9zc2libGUgaGVyZSBhcyB0aGUgSUQgbWFwIG1heSBjbGFzaAo+IHdpdGggb3Ro
ZXIgbWFwcGluZ3MgaW4gdGhlIHJ1bnRpbWUgcGFnZS10YWJsZXMuIFRoaXMgd2lsbCByZXF1aXJl
IG1vcmUKPiByZXdvcmsgdG8gYXZvaWQgdGhlIHByb2JsZW0uIFNvIGZvciBub3cgYWRkIGEgVE9E
TyBpbiB0aGUgY29kZS4KPiAKPiBGaW5hbGx5LCB0aGUgY29kZSBpcyBjdXJyZW50bHkgYXNzdW1l
IHRoYXQgcjUgd2lsbCBiZSBwcm9wZXJseSBzZXQgdG8gMAo+IGJlZm9yZSBoYW5kLiBUaGlzIGlz
IGRvbmUgYnkgY3JlYXRlX3BhZ2VfdGFibGVzKCkgd2hpY2ggaXMgY2FsbGVkIHF1aXRlCj4gZWFy
bHkgaW4gdGhlIGJvb3QgcHJvY2Vzcy4gVGhlcmUgYXJlIGEgcmlzayB0aGlzIG1heSBiZSBvdmVy
c2lnaHQgaW4gdGhlCj4gZnV0dXJlIGFuZCB0aGVyZWZvcmUgYnJlYWtpbmcgc2Vjb25kYXJ5IENQ
VXMgYm9vdC4gSW5zdGVhZCwgc2V0IHI1IHRvIDAKPiBqdXN0IGJlZm9yZSB1c2luZyBpdC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+
IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAgLSBQYXRjaCBhZGRlZAo+IC0tLQo+
ICB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIHwgNDIgKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAy
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQu
UyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiBpbmRleCA0MDgxYTUyZGZhLi42ZGM2MDMy
NDk4IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiArKysgYi94ZW4v
YXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4gQEAgLTIwMSw2ICsyMDEsMjYgQEAgR0xPQkFMKGluaXRf
c2Vjb25kYXJ5KQo+ICAgICAgICAgIG1vdiAgIHBjLCByMAo+ICBzZWNvbmRhcnlfc3dpdGNoZWQ6
Cj4gICAgICAgICAgYmwgICAgc2V0dXBfZml4bWFwCj4gKwo+ICsgICAgICAgIC8qCj4gKyAgICAg
ICAgICogTm9uLWJvb3QgQ1BVcyBuZWVkIHRvIG1vdmUgb24gdG8gdGhlIHByb3BlciBwYWdldGFi
bGVzLCB3aGljaCB3ZXJlCj4gKyAgICAgICAgICogc2V0dXAgaW4gaW5pdF9zZWNvbmRhcnlfcGFn
ZXRhYmxlcy4KPiArICAgICAgICAgKgo+ICsgICAgICAgICAqIFhYWDogVGhpcyBpcyBub3QgY29t
cGxpYW50IHdpdGggdGhlIEFybSBBcm0uCj4gKyAgICAgICAgICovCj4gKyAgICAgICAgbGRyICAg
cjQsID1pbml0X3R0YnIgICAgICAgICAvKiBWQSBvZiBIVFRCUiB2YWx1ZSBzdGFzaGVkIGJ5IENQ
VSAwICovCj4gKyAgICAgICAgbW92ICAgcjUsICMwCgpXaHkgZG8gd2UgbmVlZCB0byB6ZXJvIHI1
PyBTaG91bGRuJ3QgbGRyZCBvdmVyd3JpdGUgcjUgYW55d2F5PwoKCj4gKyAgICAgICAgbGRyZCAg
cjQsIHI1LCBbcjRdICAgICAgICAgICAvKiBBY3R1YWwgdmFsdWUgKi8KPiArICAgICAgICBkc2IK
PiArICAgICAgICBtY3JyICBDUDY0KHI0LCByNSwgSFRUQlIpCj4gKyAgICAgICAgZHNiCj4gKyAg
ICAgICAgaXNiCj4gKyAgICAgICAgbWNyICAgQ1AzMihyMCwgVExCSUFMTEgpICAgICAvKiBGbHVz
aCBoeXBlcnZpc29yIFRMQiAqLwo+ICsgICAgICAgIG1jciAgIENQMzIocjAsIElDSUFMTFUpICAg
ICAgLyogRmx1c2ggSS1jYWNoZSAqLwo+ICsgICAgICAgIG1jciAgIENQMzIocjAsIEJQSUFMTCkg
ICAgICAgLyogRmx1c2ggYnJhbmNoIHByZWRpY3RvciAqLwo+ICsgICAgICAgIGRzYiAgICAgICAg
ICAgICAgICAgICAgICAgICAgLyogRW5zdXJlIGNvbXBsZXRpb24gb2YgVExCK0JQIGZsdXNoICov
Cj4gKyAgICAgICAgaXNiCj4gKwo+ICAgICAgICAgIGIgICAgIGxhdW5jaAo+ICBFTkRQUk9DKGlu
aXRfc2Vjb25kYXJ5KQo+ICAKPiBAQCAtNTA0LDI4ICs1MjQsNiBAQCBFTkRQUk9DKHNldHVwX2Zp
eG1hcCkKPiAgbGF1bmNoOgo+ICAgICAgICAgIFBSSU5UKCItIFJlYWR5IC1cclxuIikKPiAgCj4g
LSAgICAgICAgLyogVGhlIGJvb3QgQ1BVIHNob3VsZCBnbyBzdHJhaWdodCBpbnRvIEMgbm93ICov
Cj4gLSAgICAgICAgdGVxICAgcjEyLCAjMAo+IC0gICAgICAgIGJlcSAgIDFmCj4gLQo+IC0gICAg
ICAgIC8qCj4gLSAgICAgICAgICogTm9uLWJvb3QgQ1BVcyBuZWVkIHRvIG1vdmUgb24gdG8gdGhl
IHByb3BlciBwYWdldGFibGVzLCB3aGljaCB3ZXJlCj4gLSAgICAgICAgICogc2V0dXAgaW4gaW5p
dF9zZWNvbmRhcnlfcGFnZXRhYmxlcy4KPiAtICAgICAgICAgKi8KPiAtCj4gLSAgICAgICAgbGRy
ICAgcjQsID1pbml0X3R0YnIgICAgICAgICAvKiBWQSBvZiBIVFRCUiB2YWx1ZSBzdGFzaGVkIGJ5
IENQVSAwICovCj4gLSAgICAgICAgbGRyZCAgcjQsIHI1LCBbcjRdICAgICAgICAgICAvKiBBY3R1
YWwgdmFsdWUgKi8KPiAtICAgICAgICBkc2IKPiAtICAgICAgICBtY3JyICBDUDY0KHI0LCByNSwg
SFRUQlIpCj4gLSAgICAgICAgZHNiCj4gLSAgICAgICAgaXNiCj4gLSAgICAgICAgbWNyICAgQ1Az
MihyMCwgVExCSUFMTEgpICAgICAvKiBGbHVzaCBoeXBlcnZpc29yIFRMQiAqLwo+IC0gICAgICAg
IG1jciAgIENQMzIocjAsIElDSUFMTFUpICAgICAgLyogRmx1c2ggSS1jYWNoZSAqLwo+IC0gICAg
ICAgIG1jciAgIENQMzIocjAsIEJQSUFMTCkgICAgICAgLyogRmx1c2ggYnJhbmNoIHByZWRpY3Rv
ciAqLwo+IC0gICAgICAgIGRzYiAgICAgICAgICAgICAgICAgICAgICAgICAgLyogRW5zdXJlIGNv
bXBsZXRpb24gb2YgVExCK0JQIGZsdXNoICovCj4gLSAgICAgICAgaXNiCj4gLQo+IC0xOgo+ICAg
ICAgICAgIGxkciAgIHIwLCA9aW5pdF9kYXRhCj4gICAgICAgICAgYWRkICAgcjAsICNJTklUSU5G
T19zdGFjayAgICAvKiBGaW5kIHRoZSBib290LXRpbWUgc3RhY2sgKi8KPiAgICAgICAgICBsZHIg
ICBzcCwgW3IwXQo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
