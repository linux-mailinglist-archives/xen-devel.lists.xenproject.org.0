Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4F3122243
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 03:59:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ih310-0002dy-H9; Tue, 17 Dec 2019 02:55:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UgdD=2H=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ih30z-0002ds-Bf
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 02:55:13 +0000
X-Inumbo-ID: a4be6e4a-2078-11ea-a914-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4be6e4a-2078-11ea-a914-bc764e2007e4;
 Tue, 17 Dec 2019 02:55:12 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D9F3206D3;
 Tue, 17 Dec 2019 02:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576551311;
 bh=PVqBn4WaigjYaexLgfVLoOz/r66ljBWz2mxiWNgHdzY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=EUWOhJ3a8Krg8S82mY5LII4I6oWS5Yfz1M1Iuw7435moCYekIo1Dfw0VgAN0Rj3qT
 lTaPBqaoSZpGnNR2ATlt8UNj4FdZKX/xybKoCCatc4a3U7S0m5s5iVQvQQqkreXuBZ
 +K9tCtNQxw2aRoFy4bBrxYRMTkANukMJ1Q846bIc=
Date: Mon, 16 Dec 2019 18:55:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Roman Shaposhnik <roman@zededa.com>
In-Reply-To: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1912161814220.13474@sstabellini-ThinkPad-T480s>
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on
 ARM
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
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxNiBEZWMgMjAxOSwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBIaSEKPiAKPiBp
dCBhcHBlYXJzIHRoYXQgc29tZXRoaW5nIGhhcyBicm9rZW4gaW4gNC4xMyBSQzUgc28gdGhhdAo+
IEknbSBub3cgZ2V0dGluZyB0aGUgZm9sbG93aW5nIG9uIEFSTSAoZnVsbCBsb2dzIGFyZSBhdHRh
Y2hlZCkuCj4gCj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Kgo+IChYRU4pIFBhbmljIG9uIENQVSAwOgo+IChYRU4pIEZhaWxlZCB0byBhbGxvY2F0ZSByZXF1
ZXN0ZWQgZG9tMCBtZW1vcnkuIDY3Mk1CIHVuYWxsb2NhdGVkCj4gKFhFTikgKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+IAo+IE15IEdSVUIgYm9vdCBzZXF1ZW5jZSBo
YXNuJ3QgY2hhbmdlZDoKPiAKPiB4ZW5faHlwZXJ2aXNvciAvYm9vdC94ZW4uZWZpIGNvbnNvbGU9
ZHR1YXJ0ICAgZG9tMF9tZW09MTAyNE0sbWF4OjEwMjRNCj4gZG9tMF9tYXhfdmNwdXM9MSBkb20w
X3ZjcHVzX3BpbgoKRllJIHdlIGRvbid0IGFjdHVhbGx5IHN1cHBvcnQgdGhlICIsbWF4OjEwMjRN
IiBwYXJ0IG9mIHRoZSBkb20wX21lbQphcmd1bWVudCBvbiBBUk0uIE9uIEFSTSwgaXQgc2hvdWxk
IGp1c3QgYmU6CgogIGRvbTBfbWVtPTEwMjRNCgoKPiB4ZW5fbW9kdWxlIC9ib290L2tlcm5lbCBj
b25zb2xlPWh2YzAgcm9vdD0oaGQxLGdwdDEpL3Jvb3Rmcy5pbWcgdGV4dAo+IGRldmljZXRyZWUg
KGhkMSxncHQ0KS9ldmUuZHRiCj4geGVuX21vZHVsZSAoaGQxLGdwdDEpL2luaXRyZC5pbWcKPiAK
PiBJbiBmYWN0LCBpZiBJIHVzZSBYZW4gNC4xMiBpbnN0ZWFkIG9mIDQuMTMgLS0gZXZlcnl0aGlu
ZyBzZWVtcyB0byB3b3JrCj4gYXMgaXQgdXNlZCB0by4KCkkgc3Bva2UgdG9vIGVhcmx5OiBJIGFt
IHVuYWJsZSB0byByZXByb2R1Y2UgaXQgb24gbXkgZW5kLiBPbiB3aGF0CnBsYXRmb3JtcyBkaWQg
eW91IHNlZSB0aGlzIGVycm9yPyBXYXMgaXQgdGhlIEhpS2V5PyBDb3VsZCB5b3UgcGxlYXNlCnBv
c3QgdGhlIGRldmljZXRyZWUgdGhhdCB5b3UgYXJlIHVzaW5nIChldmUuZHRiIGZyb20gdGhpcyBl
eGFtcGxlKT8KCklmIHRoZSBkdHMgaXMgdGhpcyBvbmU6IGh0dHBzOi8vZ2l0aHViLmNvbS9sZi1l
ZGdlL2V2ZS9ibG9iL21hc3Rlci9jb25mL2V2ZS5kdHMKdGhlbiBJIG1pZ2h0IGhhdmUgYW4gaWRl
YS4gSW4gWGVuIDQuMTMgd2UgaW50cm9kdWNlZCBzdXBwb3J0IGZvcgpyZXNlcnZlZC1tZW1vcnku
IEl0IGxvb2tzIGxpa2UgdGhlIEhpS2V5IGhhcyBhIGZldyByZXNlcnZlZC1tZW1vcnkKcmVnaW9u
cyBhbmQgSSB3b25kZXIgaWYgdGhhdCBpcyB0aGUgcHJvYmxlbS4gQ291bGQgeW91IHBsZWFzZSBy
ZW1vdmUgdGhlCndob2xlICJyZXNlcnZlZC1tZW1vcnkiIG5vZGUgYW5kIHRyeSBhZ2FpbiB0byBz
ZWUgaWYgdGhhdCBpcyB0aGUgaXNzdWU/CgpBbHNvIGxvb2tpbmcgYXQgZXZlLmR0cyBhYm92ZSwg
SSBhbSBhIGJpdCBwdXp6bGVkIGJlY2F1c2UgdGhlIG1lbW9yeQpub2RlIGlzOgoKICAgIG1lbW9y
eUAwIHsKCQlkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwoJCXJlZyA9IDwweDAgMHgwIDB4MCAweDVl
MDAwMDAgMHgwIDB4NWYwMDAwMCAweDAgMHgxMDAwIDB4MCAweDVmMDIwMDAgMHgwIDB4ZWZkMDAw
IDB4MCAweDZlMDAwMDAgMHgwIDB4NjBmMDAwIDB4MCAweDc0MTAwMDAgMHgwIDB4MWFhZjAwMDAg
MHgwIDB4MjIwMDAwMDAgMHgwIDB4MWMwMDAwMDA+OwoJfTsKCklmIEkgc3VtIGFsbCB0aGUgbWVt
b3J5IHNpemVzIHRvZ2V0aGVyIEkgZ2V0IDB4M2RkZmQwMDAgd2hpY2ggaXMgOTkwTS4KSWYgc28s
IEkgd29uZGVyIGhvdyB5b3UgY291bGQgYm9vdCBzdWNjZXNmdWxseSB3aXRoIGRvbTBfbWVtPTEw
MjRNIGV2ZW4Kb24gWGVuIDQuMTIuLi4gOi0/CgpJZiB3ZSBsb29rIGF0IHJhbW9vcHNAMjFmMDAw
MDAgdW5kZXIgcmVzZXJ2ZWQtbWVtb3J5OgoKCQlyYW1vb3BzQDIxZjAwMDAwIHsKCQkJcmVjb3Jk
LXNpemUgPSA8MHgyMDAwMD47CgkJCWNvbXBhdGlibGUgPSAicmFtb29wcyI7CgkJCWNvbnNvbGUt
c2l6ZSA9IDwweDIwMDAwPjsKCQkJcmVnID0gPDB4MCAweDIxZjAwMDAwIDB4MCAweDEwMDAwMD47
CgkJCWZ0cmFjZS1zaXplID0gPDB4MjAwMDA+OwoJCX07Cgp0aGUgbWVtb3J5IHJhbmdlICIweDAg
MHgyMWYwMDAwMCAweDAgMHgxMDAwMDAiIGlzIHN1cHBvc2VkIHRvIGZhbGwgaW4KYW55IG9mIHRo
ZSBtZW1vcnkgcmFuZ2VzIG9mIHRoZSBtZW1vcnkgbm9kZSAodGhlIG9uZXMgSSBjb3B5L3Bhc3Rl
ZAphYm92ZSkuIEJ1dCBhY3R1YWxseSBpdCBkb2Vzbid0LiBUaGF0IGlzIGEgZGV2aWNlIHRyZWUg
ZXJyb3IuCgpNYXliZSB5b3UgY291bGQgdHJ5IGJvb3Rpbmcgb24gdGhlIEhpS2V5IGNoYW5naW5n
IHRoZSBkZXZpY2UgdHJlZSBzbyB0aGF0IHRoZQptZW1vcnkgbm9kZSBpbmNsdWRlcyB0aGUgcmFt
b29wcyByYW5nZSwgbGlrZSB0aGlzOiAKCiAgICBtZW1vcnlAMCB7CgkJZGV2aWNlX3R5cGUgPSAi
bWVtb3J5IjsKCQlyZWcgPSA8MHgwIDB4MCAweDAgMHg1ZTAwMDAwIDB4MCAweDVmMDAwMDAgMHgw
IDB4MTAwMCAweDAgMHg1ZjAyMDAwIDB4MCAweGVmZDAwMCAweDAgMHg2ZTAwMDAwIDB4MCAweDYw
ZjAwMCAweDAgMHg3NDEwMDAwIDB4MCAweDFhYWYwMDAwIDB4MCAweDIxZjAwMDAwIDB4MCAweDEw
MDAwMCAweDAgMHgyMjAwMDAwMCAweDAgMHgxYzAwMDAwMD47Cgl9OwoKKE5vdGUgdGhhdCBJIGFk
ZGVkICIweDAgMHgyMWYwMDAwMCAweDAgMHgxMDAwMDAiIHRvIHRoZSBsaXN0IG9mIHJhbmdlcyBp
biBvcmRlci4pCgpMZXQgbWUga25vdyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
