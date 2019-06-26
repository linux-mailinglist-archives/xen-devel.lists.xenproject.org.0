Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39C8570B7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 20:35:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgCiG-00061w-MW; Wed, 26 Jun 2019 18:32:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hgCiF-00061r-3x
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 18:32:07 +0000
X-Inumbo-ID: b2b9f3e0-9840-11e9-8a2f-2f955918ebdb
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2b9f3e0-9840-11e9-8a2f-2f955918ebdb;
 Wed, 26 Jun 2019 18:32:05 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DDB3C216FD;
 Wed, 26 Jun 2019 18:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561573925;
 bh=qPp/leDPmmN2FtW8SJ4QlFscPlGevWpeJFkqNvtWTtE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=JpJMlGtO0lQfDdGcZ0sR6nVYeSseKiUdkspD0W3PW2IwotYiHNFHfDBzIOF0a1ipb
 4O209Kb5NHOZD3QzLnMvaRef9qcBbZe5SAsY2JndUsZ7CDggF5Z61M+16kBAEkHF58
 bsq9rmuIUvk0PEQbjMe/Ln39zLfNI0iQfJTPbGww=
Date: Wed, 26 Jun 2019 11:32:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <d8c94588-8f7f-84a5-aed1-fe7bfe7bd178@arm.com>
Message-ID: <alpine.DEB.2.21.1906261130190.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-3-julien.grall@arm.com>
 <alpine.DEB.2.21.1906251627270.5851@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906251656420.5851@sstabellini-ThinkPad-T480s>
 <31afe099-1a7b-d8f3-6d11-0fdf78594c2e@arm.com>
 <alpine.DEB.2.21.1906260827080.5851@sstabellini-ThinkPad-T480s>
 <d8c94588-8f7f-84a5-aed1-fe7bfe7bd178@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNiBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMjYvMDYvMjAxOSAxNjoyNywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
V2VkLCAyNiBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBIaSBTdGVmYW5vLAo+
ID4gPiAKPiA+ID4gT24gMjYvMDYvMjAxOSAwMDo1OSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+ID4gPiA+IE9uIFR1ZSwgMjUgSnVuIDIwMTksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
PiA+ID4gPiA+IE9uIE1vbiwgMTAgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4g
PiA+ID4gPiAgICBUaGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgbWFjcm8gUFJJTlQg
d2lsbCBjbG9iYmVyCj4gPiA+ID4gPiA+ID4geDMwL2xyLgo+ID4gPiA+ID4gPiA+IFRoaXMKPiA+
ID4gPiA+ID4gbWVhbnMgdGhlIHVzZXIgc2hvdWxkIHNhdmUgbHIgaWYgaXQgY2FyZXMgYWJvdXQg
aXQuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEJ5IHgzMC9sciwgZG8geW91IG1lYW4geDAteDMgYW5k
IGxyPyBJIHdvdWxkIHByZWZlciBhIGNsZWFyZXIKPiA+ID4gPiA+IGV4cHJlc3Npb24uCj4gPiA+
ID4gCj4gPiA+ID4gTm8gb2YgY291cnNlIG5vdCEgWW91IG1lYW50IHgzMCB3aGljaCBpcyBhIHN5
bm9ueW0gb2YgbHIhIEl0IGlzIGp1c3QKPiA+ID4gPiB0aGF0IGluIHRoaXMgY2FzZSBpdCBpcyBh
bHNvIHN1cHBvc2VkIHRvIGNsb2JiZXIgeDAteDMgLS0gSSBnb3QKPiA+ID4gPiBjb25mdXNlZCEg
VGhlIGNvbW1pdCBtZXNzYWdlIGlzIGFsc28gZmluZSBhcyBpcyB0aGVuLiBNb3JlIGJlbG93Lgo+
ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+ID4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+IEZvbGxvdy11cCBwYXRjaGVzIHdpbGwgaW50cm9kdWNlIG1vcmUgdXNlIG9mIFBSSU5UIGlu
IHBsYWNlIHdoZXJlIGxyCj4gPiA+ID4gPiA+IHNob3VsZCBiZSBwcmVzZXJ2ZWQuIFJhdGhlciB0
aGFuIHJlcXVpcmluZyBhbGwgdGhlIHVzZXJzIHRvIHByZXNlcnZlCj4gPiA+ID4gPiA+IGxyLAo+
ID4gPiA+ID4gPiB0aGUgbWFjcm8gUFJJTlQgaXMgbW9kaWZpZWQgdG8gc2F2ZSBhbmQgcmVzdG9y
ZSBpdC4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFdoaWxlIHRoZSBjb21tZW50IHN0YXRlIHgz
IHdpbGwgYmUgY2xvYmJlcmVkLCB0aGlzIGlzIG5vdCB0aGUgY2FzZS4KPiA+ID4gPiA+ID4gU28K
PiA+ID4gPiA+ID4gUFJJTlQgd2lsbCB1c2UgeDMgdG8gcHJlc2VydmUgbHIuCj4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiBMYXN0bHksIHRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIG1vdmUgdGhlIGNv
bW1lbnQgb24gdG9wIG9mIFBSSU5UIGFuZAo+ID4gPiA+ID4gPiB1c2UKPiA+ID4gPiA+ID4gUFJJ
TlQgaW4gaW5pdF91YXJ0LiBCb3RoIGNoYW5nZXMgd2lsbCBiZSBoZWxwZnVsIGluIGEgZm9sbG93
LXVwCj4gPiA+ID4gPiA+IHBhdGNoLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiA+ID4gPiA+ID4gLS0t
Cj4gPiA+ID4gPiA+ICAgIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCAxNCArKysrKysrKyst
LS0tLQo+ID4gPiA+ID4gPiAgICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gPiA+ID4gPiA+
IGluZGV4IGM4YmJkZjA1YTYuLmE1MTQ3YzhkODAgMTAwNjQ0Cj4gPiA+ID4gPiA+IC0tLSBhL3hl
bi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiA+ID4gPiA+ID4gKysrIGIveGVuL2FyY2gvYXJtL2Fy
bTY0L2hlYWQuUwo+ID4gPiA+ID4gPiBAQCAtNzgsMTIgKzc4LDE3IEBACj4gPiA+ID4gPiA+ICAg
ICAqICB4MzAgLSBscgo+ID4gPiA+ID4gPiAgICAgKi8KPiA+ID4gPiA+ID4gICAgLS8qIE1hY3Jv
IHRvIHByaW50IGEgc3RyaW5nIHRvIHRoZSBVQVJULCBpZiB0aGVyZSBpcyBvbmUuCj4gPiA+ID4g
PiA+IC0gKiBDbG9iYmVycyB4MC14My4gKi8KPiA+ID4gPiA+ID4gICAgI2lmZGVmIENPTkZJR19F
QVJMWV9QUklOVEsKPiA+ID4gPiA+ID4gKy8qCj4gPiA+ID4gPiA+ICsgKiBNYWNybyB0byBwcmlu
dCBhIHN0cmluZyB0byB0aGUgVUFSVCwgaWYgdGhlcmUgaXMgb25lLgo+ID4gPiA+ID4gPiArICoK
PiA+ID4gPiA+ID4gKyAqIENsb2JiZXJzIHgwIC0geDMKPiA+ID4gPiA+ID4gKyAqLwo+ID4gPiA+
ID4gPiAgICAjZGVmaW5lIFBSSU5UKF9zKSAgICAgICAgICAgXAo+ID4gPiA+ID4gPiArICAgICAg
ICBtb3YgICB4MywgbHIgIDsgICAgIFwKPiA+ID4gPiA+ID4gICAgICAgICAgICBhZHIgICB4MCwg
OThmIDsgICAgIFwKPiA+ID4gPiA+ID4gICAgICAgICAgICBibCAgICBwdXRzICAgIDsgICAgIFwK
PiA+ID4gPiA+ID4gKyAgICAgICAgbW92ICAgbHIsIHgzICA7ICAgICBcCj4gPiA+ID4gPiA+ICAg
ICAgICAgICAgUk9EQVRBX1NUUig5OCwgX3MpCj4gPiA+ID4gCj4gPiA+ID4gU3RyYW5nZWx5IGVu
b3VnaCBJIGdldCBhIGJ1aWxkIGVycm9yIHdpdGggZ2NjIDcuMy4xLCBidXQgaWYgSSB1c2UgeDMw
Cj4gPiA+ID4gaW5zdGVhZCBvZiBsciwgaXQgYnVpbGRzIGZpbmUuIEhhdmUgeW91IHNlZW4gdGhp
cyBiZWZvcmU/Cj4gPiA+IAo+ID4gPiBIbW1tLCBJIGNhbid0IHRvIHJlcHJvZHVjZSBpdCBldmVu
IG9uIG9sZGVyIGNvbXBpbGVyICg0LjkpLiBNeSBndWVzcyBpcwo+ID4gPiBub3QKPiA+ID4gYWxs
IHRoZSBhc3NlbWJsZXIgaXMgYWJsZSB0byB1bmRlcnN0YW5kICJsciIuCj4gPiA+IAo+ID4gPiBJ
biB0aGUgZmlsZSBlbnRyeS5TIHdlIGhhdmUgdGhlIGZvbGxvd2luZyBsaW5lOgo+ID4gPiAKPiA+
ID4gbHIgICAgICAucmVxICAgIHgzMCAgICAgICAgICAgICAvLyBsaW5rIHJlZ2lzdGVyCj4gPiA+
IAo+ID4gPiAKPiA+ID4gQ291bGQgeW91IGdpdmUgYSB0cnkgdG8gYWRkIHRoZSBsaW5lIGluIGhl
YWQuUz8KPiA+IAo+ID4gVGhhdCB3b3Jrcwo+IAo+IFRoYW5rIHlvdS4KPiAKPiBJIHRob3VnaHQg
YSBiaXQgbW9yZSBkdXJpbmcgdGhlIGRheSBhbmQgZGVjaWRlZCB0byB1c2UgIngzMCIgZGlyZWN0
bHkgcmF0aGVyCj4gdGhhbiBsci4gV2UgY2FuIGRlY2lkZSB0byByZXZpc2l0IGl0IGlmIHdlIHRo
aW5rIHRoZSBjb2RlIGlzIHRvbyBkaWZmaWN1bHQgdG8KPiByZWFkLgoKSSB3YXMgZ29pbmcgdG8g
c3VnZ2VzdCB4MzAgdG9vIHllc3RlcmRheSwgYnV0IGlmIHdlIGNhbiBtYWtlIGBscicgd29yawp0
aGVuIHRoYXQgd291bGQgYmUgbXkgcHJlZmVyZW5jZSBiZWNhdXNlIGl0IG1ha2VzIGl0IG1vcmUg
aW1tZWRpYXRlbHkKb2J2aW91cyB3aGF0IHRoZSBjb2RlIGlzIGRvaW5nLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
