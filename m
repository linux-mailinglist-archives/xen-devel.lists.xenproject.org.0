Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CE8C4554
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 03:15:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFTC5-0004zt-UU; Wed, 02 Oct 2019 01:12:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bij=X3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFTC4-0004zo-2p
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 01:12:40 +0000
X-Inumbo-ID: b9ebdca6-e4b1-11e9-970b-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id b9ebdca6-e4b1-11e9-970b-12813bfff9fa;
 Wed, 02 Oct 2019 01:12:39 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90BCA20815;
 Wed,  2 Oct 2019 01:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569978758;
 bh=3dAoIpfHLdgY/BUWFg0vsIbh4/6vKkKnaGK6eX0X/cg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=0JqyHAz59lN4jsZqE/J8BomA8LOFOobxc/psD8ZRbCCMkYR6H80I9eewY4HPf8bWp
 G/dnJgLAIviVGwv5DXXzQLi2XeFsos3YgctfYF4RW56+TtcLDHY84Lr5e3YL4mq6Rp
 Q5v4c8rHWGLBZUMSY91fuPOeuTiSnZHdl+ki3oq8=
Date: Tue, 1 Oct 2019 18:12:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190821221221.19456-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910011811270.26319@sstabellini-ThinkPad-T480s>
References: <20190821221221.19456-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: domain_build: Don't continue if
 unable to allocate all dom0 banks
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMSBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFhlbiB3aWxsIG9ubHkg
cHJpbnQgYSB3YXJuaW5nIGlmIHRoZXJlIGFyZSBtZW1vcnkgdW5hbGxvY2F0ZWQgd2hlbiB1c2lu
ZwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gaXMKCgo+IDE6MSBt
YXBwaW5nIChvbmx5IHVzZWQgYnkgZG9tMCkuIFRoaXMgYWxzbyBpbmNsdWRlcyB0aGUgY2FzZSB3
aGVyZSBubwo+IG1lbW9yeSBoYXMgYmVlbiBhbGxvY2F0ZWQuCj4gCj4gSXQgd2lsbCBicmluZyB0
byBhbGwgc29ydCBvZiBpc3N1ZXMgdGhhdCBjYW4gYmUgaGFyZCB0byBkaWFnbm9zdGljIGZvcgo+
IHVzZXJzICh0aGUgd2FybmluZyBjYW4gYmUgZGlmZmljdWx0IHRvIHNwb3Qgb3IgZGlzcmVnYXJk
KS4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gZGlz
cmVnYXJkZWQKCiAKPiBJZiB0aGUgdXNlcnMgcmVxdWVzdCAxR0Igb2YgbWVtb3J5LCB0aGVuIG1v
c3QgbGlrZWx5IHRoZXkgd2FudCB0aGUgZXhhY3QKPiBhbW91bnQgYW5kIG5vdCA1MTJNQi4gU28g
cGFuaWMgaWYgYWxsIHRoZSBtZW1vcnkgaGFzIG5vdCBiZWVuIGFsbG9jYXRlZC4KPiAKPiBBZnRl
ciB0aGlzIGNoYW5nZSwgdGhlIGJlaGF2aW9yIGlzIHRoZSBzYW1lIGFzIGZvciBub24tMToxIG1l
bW9yeQo+IGFsbG9jYXRpb24gKHVzZWQgYnkgZG9tVSkuCj4gCj4gQXQgdGhlIHNhbWUgdGltZSwg
cmVmbG93IHRoZSBtZXNzYWdlIHRvIGhhdmUgdGhlIGZvcm1hdCBvbiBhIHNpbmdsZQo+IGxpbmUu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
CkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoK
PiAtLS0KPiAKPiBDYzogQmVydHJhbmQuTWFycXVpc0Bhcm0uY29tCj4gCj4gSXQgdG9vayBtZSBz
b21ldGltZXMgdGhpcyBtb3JuaW5nIHRvIHNwb3QgdGhlIHdhcm5pbmcgaW4gdGhlIGxvZy4gSWYg
d2UKPiBkb24ndCBob25vciB0aGUgc2l6ZSwgaXQgZmVlbHMgaXQgaXMgYmV0dGVyIHRvIGNyYXNo
IGFuZCByZXF1ZXN0IHRoZQo+IHVzZXIgdG8gcmVxdWVzdCBsZXNzIG1lbW9yeSAob3IgcmUtb3Jk
ZXIgdGhlIGJpbmFyeSkuCj4gCj4gVGhpcyBpcyBpbmxpbmUgb24gaG93IGRvbVUgbWVtb3J5IGFs
bG9jYXRpb24gaXMgaGFuZGxlZC4KPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
IHwgNyArKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IGluZGV4IDFhM2RjYjFiY2QuLjcyZTE0NzQ2Y2Qg
MTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gKysrIGIveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gQEAgLTM1OCwxMCArMzU4LDkgQEAgc3RhdGljIHZvaWQg
X19pbml0IGFsbG9jYXRlX21lbW9yeV8xMShzdHJ1Y3QgZG9tYWluICpkLAo+ICAgICAgfQo+ICAK
PiAgICAgIGlmICgga2luZm8tPnVuYXNzaWduZWRfbWVtICkKPiAtICAgICAgICBwcmludGsoIldB
Uk5JTkc6IEZhaWxlZCB0byBhbGxvY2F0ZSByZXF1ZXN0ZWQgZG9tMCBtZW1vcnkuIgo+IC0gICAg
ICAgICAgICAgICAvKiBEb24ndCB3YW50IGZvcm1hdCB0aGlzIGFzIFBSSXBhZGRyICgxNiBkaWdp
dCBoZXgpICovCj4gLSAgICAgICAgICAgICAgICIgJWxkTUIgdW5hbGxvY2F0ZWRcbiIsCj4gLSAg
ICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKWtpbmZvLT51bmFzc2lnbmVkX21lbSA+PiAyMCk7
Cj4gKyAgICAgICAgLyogRG9uJ3Qgd2FudCBmb3JtYXQgdGhpcyBhcyBQUklwYWRkciAoMTYgZGln
aXQgaGV4KSAqLwo+ICsgICAgICAgIHBhbmljKCJGYWlsZWQgdG8gYWxsb2NhdGUgcmVxdWVzdGVk
IGRvbTAgbWVtb3J5LiAlbGRNQiB1bmFsbG9jYXRlZFxuIiwKPiArICAgICAgICAgICAgICAodW5z
aWduZWQgbG9uZylraW5mby0+dW5hc3NpZ25lZF9tZW0gPj4gMjApOwo+ICAKPiAgICAgIGZvcigg
aSA9IDA7IGkgPCBraW5mby0+bWVtLm5yX2JhbmtzOyBpKysgKQo+ICAgICAgewo+IC0tIAo+IDIu
MTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
