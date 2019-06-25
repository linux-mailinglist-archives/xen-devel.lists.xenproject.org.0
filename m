Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFF955CA0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 01:52:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfvBm-0005En-Lb; Tue, 25 Jun 2019 23:49:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qEdm=UY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfvBl-0005Ei-Ew
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 23:49:25 +0000
X-Inumbo-ID: dc490702-97a3-11e9-8ed2-e3f7cabf603b
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc490702-97a3-11e9-8ed2-e3f7cabf603b;
 Tue, 25 Jun 2019 23:49:24 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A90D02086D;
 Tue, 25 Jun 2019 23:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561506563;
 bh=SEPloGFkDOerqv7ol0wq9giDRco2hGltify73URqKpM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=dFVeeX2hKQDCwoquizSpC9he/0Rv3tyyuROapKEl6PziHwOhRBNjcWqsFaRq+S0JK
 d1Dj5vIcPNzfcbn9s0iQK3V13Y5NHQ9R20QCIDdW2LYzm2hC0ImZkFGSyCUiCSekne
 WaN8Cm/RtUzwn1wSbr8usXwXxppbt3rxkZZCj+9g=
Date: Tue, 25 Jun 2019 16:49:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-4-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906251647500.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-4-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 03/17] xen/arm64: head: Rework UART
 initialization on boot CPU
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

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFueXRoaW5nIGV4ZWN1
dGVkIGFmdGVyIHRoZSBsYWJlbCBjb21tb25fc3RhcnQgY2FuIGJlIGV4ZWN1dGVkIG9uIGFsbAo+
IENQVXMuIEhvd2V2ZXIgbW9zdCBvZiB0aGUgaW5zdHJ1Y3Rpb25zIGV4ZWN1dGVkIGJldHdlZW4g
dGhlIGxhYmVsCj4gY29tbW9uX3N0YXJ0IGFuZCBpbml0X3VhcnQgYXJlIG5vdCBleGVjdXRlZCBv
biB0aGUgYm9vdCBDUFUuCj4gCj4gVGhlIG9ubHkgaW5zdHJ1Y3Rpb25zIGV4ZWN1dGVkIGFyZSB0
byBsb29rdXAgdGhlIENQVUlEIHNvIGl0IGNhbiBiZQo+IHByaW50ZWQgb24gdGhlIGNvbnNvbGUg
KGlmIGVhcmx5cHJpbnRrIGlzIGVuYWJsZWQpLiBQcmludGluZyB0aGUgQ1BVSUQKPiBpcyBub3Qg
ZW50aXJlbHkgdXNlZnVsIHRvIGhhdmUgZm9yIHRoZSBib290IENQVSBhbmQgcmVxdWlyZXMgYQo+
IGNvbmRpdGlvbmFsIGJyYW5jaCB0byBieXBhc3MgdW51c2VkIGluc3RydWN0aW9ucy4KPiAKPiBG
dXJ0aGVybW9yZSwgdGhlIGZ1bmN0aW9uIGluaXRfdWFydCBpcyBvbmx5IGNhbGxlZCBmb3IgYm9v
dCBDUFUKPiByZXF1aXJpbmcgYW5vdGhlciBjb25kaXRpb25hbCBicmFuY2guIFRoaXMgbWFrZXMg
dGhlIGNvZGUgYSBiaXQgdHJpY2t5Cj4gdG8gZm9sbG93Lgo+IAo+IFRoZSBVQVJUIGluaXRpYWxp
emF0aW9uIGlzIG5vdyBtb3ZlZCBiZWZvcmUgdGhlIGxhYmVsIGNvbW1vbl9zdGFydC4gVGhpcwo+
IG5vdyByZXF1aXJlcyB0byBoYXZlIGEgc2xpZ2h0bHkgYWx0ZXJlZCBwcmludCBmb3IgdGhlIGJv
b3QgQ1BVIGFuZCBzZXQKPiB0aGUgZWFybHkgVUFSVCBiYXNlIGFkZHJlc3MgaW4gZWFjaCB0aGUg
dHdvIHBhdGggKGJvb3QgQ1BVIGFuZAo+IHNlY29uZGFyeSBDUFVzKS4KPiAKPiBUaGlzIGhhcyB0
aGUgbmljZSBlZmZlY3QgdG8gcmVtb3ZlIGEgY291cGxlIG9mIGNvbmRpdGlvbmFsIGJyYW5jaCBp
bgo+IHRoZSBjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+CgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgoKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDI5ICsr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Fy
bTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBpbmRleCBhNTE0N2M4ZDgw
Li5mZDQzMmVlMTVkIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiAr
KysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gQEAgLTI2NSw2ICsyNjUsMTIgQEAgcmVh
bF9zdGFydF9lZmk6Cj4gICAgICAgICAgbG9hZF9wYWRkciB4MjEsIF9zZHRiCj4gICNlbmRpZgo+
ICAKPiArICAgICAgICAvKiBJbml0aWFsaXplIHRoZSBVQVJUIGlmIGVhcmx5cHJpbnRrIGhhcyBi
ZWVuIGVuYWJsZWQuICovCj4gKyNpZmRlZiBDT05GSUdfRUFSTFlfUFJJTlRLCj4gKyAgICAgICAg
YmwgICAgaW5pdF91YXJ0Cj4gKyNlbmRpZgo+ICsgICAgICAgIFBSSU5UKCItIEJvb3QgQ1BVIGJv
b3RpbmcgLVxyXG4iKQo+ICsKPiAgICAgICAgICBtb3YgICB4MjIsICMwICAgICAgICAgICAgICAg
IC8qIHgyMiA6PSBpc19zZWNvbmRhcnlfY3B1ICovCj4gIAo+ICAgICAgICAgIGIgICAgIGNvbW1v
bl9zdGFydAo+IEBAIC0yODEsMTQgKzI4NywxMSBAQCBHTE9CQUwoaW5pdF9zZWNvbmRhcnkpCj4g
ICAgICAgICAgLyogQm9vdCBDUFUgYWxyZWFkeSB6ZXJvIEJTUyBzbyBza2lwIGl0IG9uIHNlY29u
ZGFyeSBDUFVzLiAqLwo+ICAgICAgICAgIG1vdiAgIHgyNiwgIzEgICAgICAgICAgICAgICAgLyog
WDI2IDo9IHNraXBfemVyb19ic3MgKi8KPiAgCj4gLWNvbW1vbl9zdGFydDoKPiAgICAgICAgICBt
cnMgICB4MCwgbXBpZHJfZWwxCj4gICAgICAgICAgbGRyICAgeDEzLCA9KH5NUElEUl9IV0lEX01B
U0spCj4gICAgICAgICAgYmljICAgeDI0LCB4MCwgeDEzICAgICAgICAgICAvKiBNYXNrIG91dCBm
bGFncyB0byBnZXQgQ1BVIElEICovCj4gIAo+IC0gICAgICAgIC8qIE5vbi1ib290IENQVXMgd2Fp
dCBoZXJlIHVudGlsIF9fY3B1X3VwIGlzIHJlYWR5IGZvciB0aGVtICovCj4gLSAgICAgICAgY2J6
ICAgeDIyLCAxZgo+IC0KPiArICAgICAgICAvKiBXYWl0IGhlcmUgdW50aWwgX19jcHVfdXAgaXMg
cmVhZHkgdG8gaGFuZGxlIHRoZSBDUFUgKi8KPiAgICAgICAgICBsb2FkX3BhZGRyIHgwLCBzbXBf
dXBfY3B1Cj4gICAgICAgICAgZHNiICAgc3kKPiAgMjogICAgICBsZHIgICB4MSwgW3gwXQo+IEBA
IC0zMDAsMTQgKzMwMywxNCBAQCBjb21tb25fc3RhcnQ6Cj4gIAo+ICAjaWZkZWYgQ09ORklHX0VB
UkxZX1BSSU5USwo+ICAgICAgICAgIGxkciAgIHgyMywgPUVBUkxZX1VBUlRfQkFTRV9BRERSRVNT
IC8qIHgyMyA6PSBVQVJUIGJhc2UgYWRkcmVzcyAqLwo+IC0gICAgICAgIGNibnogIHgyMiwgMWYK
PiAtICAgICAgICBibCAgICBpbml0X3VhcnQgICAgICAgICAgICAgICAgIC8qIEJvb3QgQ1BVIHNl
dHMgdXAgdGhlIFVBUlQgdG9vICovCj4gLTE6ICAgICAgUFJJTlQoIi0gQ1BVICIpCj4gKyAgICAg
ICAgUFJJTlQoIi0gQ1BVICIpCj4gICAgICAgICAgbW92ICAgeDAsIHgyNAo+ICAgICAgICAgIGJs
ICAgIHB1dG4KPiAgICAgICAgICBQUklOVCgiIGJvb3RpbmcgLVxyXG4iKQo+ICAjZW5kaWYKPiAg
Cj4gK2NvbW1vbl9zdGFydDoKPiArCj4gICAgICAgICAgUFJJTlQoIi0gQ3VycmVudCBFTCAiKQo+
ICAgICAgICAgIG1ycyAgIHg0LCBDdXJyZW50RUwKPiAgICAgICAgICBtb3YgICB4MCwgeDQKPiBA
QCAtNjI4LDEwICs2MzEsMTYgQEAgRU5UUlkoc3dpdGNoX3R0YnIpCj4gICAgICAgICAgcmV0Cj4g
IAo+ICAjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USwo+IC0vKiBCcmluZyB1cCB0aGUgVUFSVC4K
PiAtICogeDIzOiBFYXJseSBVQVJUIGJhc2UgYWRkcmVzcwo+IC0gKiBDbG9iYmVycyB4MC14MSAq
Lwo+ICsvKgo+ICsgKiBJbml0aWFsaXplIHRoZSBVQVJULiBTaG91bGQgb25seSBiZSBjYWxsZWQg
b24gdGhlIGJvb3QgQ1BVLgo+ICsgKgo+ICsgKiBPdXB1dDoKPiArICogIHgyMzogRWFybHkgVUFS
VCBiYXNlIHBoeXNpY2FsIGFkZHJlc3MKPiArICoKPiArICogQ2xvYmJlcnMgeDAgLSB4MQo+ICsg
Ki8KPiAgaW5pdF91YXJ0Ogo+ICsgICAgICAgIGxkciAgIHgyMywgPUVBUkxZX1VBUlRfQkFTRV9B
RERSRVNTCj4gICNpZmRlZiBFQVJMWV9QUklOVEtfSU5JVF9VQVJUCj4gICAgICAgICAgZWFybHlf
dWFydF9pbml0IHgyMywgMAo+ICAjZW5kaWYKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
