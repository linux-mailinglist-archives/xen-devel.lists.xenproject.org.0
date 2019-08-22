Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A3199B0F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 19:20:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0qiW-00021T-CI; Thu, 22 Aug 2019 17:17:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gXwC=WS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i0qiV-00021L-7W
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 17:17:43 +0000
X-Inumbo-ID: bfeee010-c500-11e9-addb-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfeee010-c500-11e9-addb-12813bfff9fa;
 Thu, 22 Aug 2019 17:17:42 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B324723407;
 Thu, 22 Aug 2019 17:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566494262;
 bh=ZTuuneqSzK3skRftFI1J6s6e+B7nIBR8KgxzuQVclZg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=to2cgXsYSB/WOtvbMO7flWLLWalFV9TLgGHO2ejptEV9At/A+QDx4OoB4u4J6RMoG
 SlgkXqapMGDSN0p+KdMHjPL++snOHbtUu5O1jkWfBLoykt8W7SEusgHaurvVlyWccK
 20cHMO5WaY31bBwHRlsfiFbF6k/Q1Pact/UIFaLY=
Date: Thu, 22 Aug 2019 10:17:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190812173019.11956-19-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1908221017270.22783@sstabellini-ThinkPad-T480s>
References: <20190812173019.11956-1-julien.grall@arm.com>
 <20190812173019.11956-19-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 18/28] xen/arm32: head: Move assembly
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

T24gTW9uLCAxMiBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBhc3NlbWJseSBz
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
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2
aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+
IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYzOgo+ICAgICAgICAgLSBUaGVyZSBpcyBubyBuZWVkIHRv
IHplcm8gcjUKPiAKPiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgIC0gUGF0Y2ggYWRkZWQK
PiAtLS0KPiAgeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDQxICsrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25z
KCspLCAyMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMy
L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiBpbmRleCBmODYwMzA1MWU0Li4w
Yzk1ZDFjNDMyIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiArKysg
Yi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4gQEAgLTIwMiw2ICsyMDIsMjUgQEAgR0xPQkFM
KGluaXRfc2Vjb25kYXJ5KQo+ICAgICAgICAgIG1vdiAgIHBjLCByMAo+ICBzZWNvbmRhcnlfc3dp
dGNoZWQ6Cj4gICAgICAgICAgYmwgICAgc2V0dXBfZml4bWFwCj4gKwo+ICsgICAgICAgIC8qCj4g
KyAgICAgICAgICogTm9uLWJvb3QgQ1BVcyBuZWVkIHRvIG1vdmUgb24gdG8gdGhlIHByb3BlciBw
YWdldGFibGVzLCB3aGljaCB3ZXJlCj4gKyAgICAgICAgICogc2V0dXAgaW4gaW5pdF9zZWNvbmRh
cnlfcGFnZXRhYmxlcy4KPiArICAgICAgICAgKgo+ICsgICAgICAgICAqIFhYWDogVGhpcyBpcyBu
b3QgY29tcGxpYW50IHdpdGggdGhlIEFybSBBcm0uCj4gKyAgICAgICAgICovCj4gKyAgICAgICAg
bGRyICAgcjQsID1pbml0X3R0YnIgICAgICAgICAvKiBWQSBvZiBIVFRCUiB2YWx1ZSBzdGFzaGVk
IGJ5IENQVSAwICovCj4gKyAgICAgICAgbGRyZCAgcjQsIHI1LCBbcjRdICAgICAgICAgICAvKiBB
Y3R1YWwgdmFsdWUgKi8KPiArICAgICAgICBkc2IKPiArICAgICAgICBtY3JyICBDUDY0KHI0LCBy
NSwgSFRUQlIpCj4gKyAgICAgICAgZHNiCj4gKyAgICAgICAgaXNiCj4gKyAgICAgICAgbWNyICAg
Q1AzMihyMCwgVExCSUFMTEgpICAgICAvKiBGbHVzaCBoeXBlcnZpc29yIFRMQiAqLwo+ICsgICAg
ICAgIG1jciAgIENQMzIocjAsIElDSUFMTFUpICAgICAgLyogRmx1c2ggSS1jYWNoZSAqLwo+ICsg
ICAgICAgIG1jciAgIENQMzIocjAsIEJQSUFMTCkgICAgICAgLyogRmx1c2ggYnJhbmNoIHByZWRp
Y3RvciAqLwo+ICsgICAgICAgIGRzYiAgICAgICAgICAgICAgICAgICAgICAgICAgLyogRW5zdXJl
IGNvbXBsZXRpb24gb2YgVExCK0JQIGZsdXNoICovCj4gKyAgICAgICAgaXNiCj4gKwo+ICAgICAg
ICAgIGIgICAgIGxhdW5jaAo+ICBFTkRQUk9DKGluaXRfc2Vjb25kYXJ5KQo+ICAKPiBAQCAtNTA1
LDI4ICs1MjQsNiBAQCBFTkRQUk9DKHNldHVwX2ZpeG1hcCkKPiAgbGF1bmNoOgo+ICAgICAgICAg
IFBSSU5UKCItIFJlYWR5IC1cclxuIikKPiAgCj4gLSAgICAgICAgLyogVGhlIGJvb3QgQ1BVIHNo
b3VsZCBnbyBzdHJhaWdodCBpbnRvIEMgbm93ICovCj4gLSAgICAgICAgdGVxICAgcjEyLCAjMAo+
IC0gICAgICAgIGJlcSAgIDFmCj4gLQo+IC0gICAgICAgIC8qCj4gLSAgICAgICAgICogTm9uLWJv
b3QgQ1BVcyBuZWVkIHRvIG1vdmUgb24gdG8gdGhlIHByb3BlciBwYWdldGFibGVzLCB3aGljaCB3
ZXJlCj4gLSAgICAgICAgICogc2V0dXAgaW4gaW5pdF9zZWNvbmRhcnlfcGFnZXRhYmxlcy4KPiAt
ICAgICAgICAgKi8KPiAtCj4gLSAgICAgICAgbGRyICAgcjQsID1pbml0X3R0YnIgICAgICAgICAv
KiBWQSBvZiBIVFRCUiB2YWx1ZSBzdGFzaGVkIGJ5IENQVSAwICovCj4gLSAgICAgICAgbGRyZCAg
cjQsIHI1LCBbcjRdICAgICAgICAgICAvKiBBY3R1YWwgdmFsdWUgKi8KPiAtICAgICAgICBkc2IK
PiAtICAgICAgICBtY3JyICBDUDY0KHI0LCByNSwgSFRUQlIpCj4gLSAgICAgICAgZHNiCj4gLSAg
ICAgICAgaXNiCj4gLSAgICAgICAgbWNyICAgQ1AzMihyMCwgVExCSUFMTEgpICAgICAvKiBGbHVz
aCBoeXBlcnZpc29yIFRMQiAqLwo+IC0gICAgICAgIG1jciAgIENQMzIocjAsIElDSUFMTFUpICAg
ICAgLyogRmx1c2ggSS1jYWNoZSAqLwo+IC0gICAgICAgIG1jciAgIENQMzIocjAsIEJQSUFMTCkg
ICAgICAgLyogRmx1c2ggYnJhbmNoIHByZWRpY3RvciAqLwo+IC0gICAgICAgIGRzYiAgICAgICAg
ICAgICAgICAgICAgICAgICAgLyogRW5zdXJlIGNvbXBsZXRpb24gb2YgVExCK0JQIGZsdXNoICov
Cj4gLSAgICAgICAgaXNiCj4gLQo+IC0xOgo+ICAgICAgICAgIGxkciAgIHIwLCA9aW5pdF9kYXRh
Cj4gICAgICAgICAgYWRkICAgcjAsICNJTklUSU5GT19zdGFjayAgICAvKiBGaW5kIHRoZSBib290
LXRpbWUgc3RhY2sgKi8KPiAgICAgICAgICBsZHIgICBzcCwgW3IwXQo+IC0tIAo+IDIuMTEuMAo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
