Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B8855CB7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 02:02:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfvLw-00063i-O7; Tue, 25 Jun 2019 23:59:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qEdm=UY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfvLv-00063d-JU
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 23:59:55 +0000
X-Inumbo-ID: 53f782aa-97a5-11e9-8bdd-cb71a99eac91
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53f782aa-97a5-11e9-8bdd-cb71a99eac91;
 Tue, 25 Jun 2019 23:59:54 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F25920869;
 Tue, 25 Jun 2019 23:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561507194;
 bh=JcZ2l32lnuZE6byip7xftlGcKe5M/NbPZg/pW/JfxAM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=tXu3k70HCTbXSJ/Ly8beD66z19R/mxqOe9dEbKdj1tALPfmZoNiTrCDJjMP/ZiBb8
 a9vTcMzOAfY39sbjWrL3lESdlWbm5gL7FfPtaNaUDEcqMcH6sAW2fFgw6+efbJHZbu
 DN26HDBFDzt0z5Ekg1vzhMtyfbsT+cTKpfLXOthc=
Date: Tue, 25 Jun 2019 16:59:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1906251627270.5851@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.1906251656420.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-3-julien.grall@arm.com>
 <alpine.DEB.2.21.1906251627270.5851@sstabellini-ThinkPad-T480s>
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
Cc: Oleksandr_Tyshchenko@epam.com, xen-devel@lists.xenproject.org,
 Julien Grall <julien.grall@arm.com>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyNSBKdW4gMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIE1vbiwg
MTAgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+PiAgVGhlIGN1cnJlbnQgaW1wbGVt
ZW50YXRpb24gb2YgdGhlIG1hY3JvIFBSSU5UIHdpbGwgY2xvYmJlciB4MzAvbHIuIFRoaXMKPiA+
IG1lYW5zIHRoZSB1c2VyIHNob3VsZCBzYXZlIGxyIGlmIGl0IGNhcmVzIGFib3V0IGl0Lgo+IAo+
IEJ5IHgzMC9sciwgZG8geW91IG1lYW4geDAteDMgYW5kIGxyPyBJIHdvdWxkIHByZWZlciBhIGNs
ZWFyZXIKPiBleHByZXNzaW9uLgoKTm8gb2YgY291cnNlIG5vdCEgWW91IG1lYW50IHgzMCB3aGlj
aCBpcyBhIHN5bm9ueW0gb2YgbHIhIEl0IGlzIGp1c3QKdGhhdCBpbiB0aGlzIGNhc2UgaXQgaXMg
YWxzbyBzdXBwb3NlZCB0byBjbG9iYmVyIHgwLXgzIC0tIEkgZ290CmNvbmZ1c2VkISBUaGUgY29t
bWl0IG1lc3NhZ2UgaXMgYWxzbyBmaW5lIGFzIGlzIHRoZW4uIE1vcmUgYmVsb3cuCgoKPiBSZXZp
ZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IAo+
IAo+ID4gRm9sbG93LXVwIHBhdGNoZXMgd2lsbCBpbnRyb2R1Y2UgbW9yZSB1c2Ugb2YgUFJJTlQg
aW4gcGxhY2Ugd2hlcmUgbHIKPiA+IHNob3VsZCBiZSBwcmVzZXJ2ZWQuIFJhdGhlciB0aGFuIHJl
cXVpcmluZyBhbGwgdGhlIHVzZXJzIHRvIHByZXNlcnZlIGxyLAo+ID4gdGhlIG1hY3JvIFBSSU5U
IGlzIG1vZGlmaWVkIHRvIHNhdmUgYW5kIHJlc3RvcmUgaXQuCj4gPiAKPiA+IFdoaWxlIHRoZSBj
b21tZW50IHN0YXRlIHgzIHdpbGwgYmUgY2xvYmJlcmVkLCB0aGlzIGlzIG5vdCB0aGUgY2FzZS4g
U28KPiA+IFBSSU5UIHdpbGwgdXNlIHgzIHRvIHByZXNlcnZlIGxyLgo+ID4gCj4gPiBMYXN0bHks
IHRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIG1vdmUgdGhlIGNvbW1lbnQgb24gdG9wIG9mIFBSSU5U
IGFuZCB1c2UKPiA+IFBSSU5UIGluIGluaXRfdWFydC4gQm90aCBjaGFuZ2VzIHdpbGwgYmUgaGVs
cGZ1bCBpbiBhIGZvbGxvdy11cCBwYXRjaC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiA+IC0tLQo+ID4gIHhlbi9hcmNoL2FybS9h
cm02NC9oZWFkLlMgfCAxNCArKysrKysrKystLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+ID4gaW5kZXgg
YzhiYmRmMDVhNi4uYTUxNDdjOGQ4MCAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02
NC9oZWFkLlMKPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiA+IEBAIC03OCwx
MiArNzgsMTcgQEAKPiA+ICAgKiAgeDMwIC0gbHIKPiA+ICAgKi8KPiA+ICAKPiA+IC0vKiBNYWNy
byB0byBwcmludCBhIHN0cmluZyB0byB0aGUgVUFSVCwgaWYgdGhlcmUgaXMgb25lLgo+ID4gLSAq
IENsb2JiZXJzIHgwLXgzLiAqLwo+ID4gICNpZmRlZiBDT05GSUdfRUFSTFlfUFJJTlRLCj4gPiAr
LyoKPiA+ICsgKiBNYWNybyB0byBwcmludCBhIHN0cmluZyB0byB0aGUgVUFSVCwgaWYgdGhlcmUg
aXMgb25lLgo+ID4gKyAqCj4gPiArICogQ2xvYmJlcnMgeDAgLSB4Mwo+ID4gKyAqLwo+ID4gICNk
ZWZpbmUgUFJJTlQoX3MpICAgICAgICAgICBcCj4gPiArICAgICAgICBtb3YgICB4MywgbHIgIDsg
ICAgIFwKPiA+ICAgICAgICAgIGFkciAgIHgwLCA5OGYgOyAgICAgXAo+ID4gICAgICAgICAgYmwg
ICAgcHV0cyAgICA7ICAgICBcCj4gPiArICAgICAgICBtb3YgICBsciwgeDMgIDsgICAgIFwKPiA+
ICAgICAgICAgIFJPREFUQV9TVFIoOTgsIF9zKQoKU3RyYW5nZWx5IGVub3VnaCBJIGdldCBhIGJ1
aWxkIGVycm9yIHdpdGggZ2NjIDcuMy4xLCBidXQgaWYgSSB1c2UgeDMwCmluc3RlYWQgb2YgbHIs
IGl0IGJ1aWxkcyBmaW5lLiBIYXZlIHlvdSBzZWVuIHRoaXMgYmVmb3JlPwpUaGUgZXJyb3IgaXM6
Cgphcm02NC9oZWFkLlM6IEFzc2VtYmxlciBtZXNzYWdlczoKYXJtNjQvaGVhZC5TOjI3MjogRXJy
b3I6IG9wZXJhbmQgMSBtdXN0IGJlIGFuIGludGVnZXIgcmVnaXN0ZXIgLS0gYG1vdiBscix4MycK
Wy4uLl0KYXJtNjQvaGVhZC5TOjI3MjogRXJyb3I6IHVuZGVmaW5lZCBzeW1ib2wgbHIgdXNlZCBh
cyBhbiBpbW1lZGlhdGUgdmFsdWUKWy4uLl0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
