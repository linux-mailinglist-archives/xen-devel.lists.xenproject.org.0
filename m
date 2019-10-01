Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08230C2B9F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 03:24:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF6ri-00070I-OK; Tue, 01 Oct 2019 01:22:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iF6ri-00070D-1T
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 01:22:10 +0000
X-Inumbo-ID: e349bb54-e3e9-11e9-b588-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id e349bb54-e3e9-11e9-b588-bc764e2007e4;
 Tue, 01 Oct 2019 01:22:09 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 870CE20842;
 Tue,  1 Oct 2019 01:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569892928;
 bh=AHqb57l8h6vVx3PUxC+nTEQ6aE9ffcCGQIix1QCFf5I=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=2LDYg6uJvTFvksKDwpnuE2uUjlRPPuDTRk1ArYV/y2bmBwA+lu6PUyRh2I75nDfei
 c3f1DfwD51gwqHUlAwpvdTvfvXoCd9nhfouKc7eOedMW3MwdrVKtkyp5W6UGisIkE7
 piAaej3i6Jk8bb+qji5IGWSBtnjW0eNwt9Ejm4fA=
Date: Mon, 30 Sep 2019 18:22:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1909301808070.2594@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.1909301821550.2594@sstabellini-ThinkPad-T480s>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-3-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171340390.1370@sstabellini-ThinkPad-X260>
 <be790e9c-75bb-b38b-9a01-8c586580ed1a@arm.com>
 <alpine.DEB.2.10.1904181056410.1370@sstabellini-ThinkPad-X260>
 <441ce7f6-7907-dc23-b0e6-7503ba888953@arm.com>
 <alpine.DEB.2.21.1909301808070.2594@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 02/12] xen/arm: fix get_cpu_info() when
 built with clang
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Julien Grall <julien.grall@arm.com>, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAzMCBTZXAgMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFN1biwg
MjkgU2VwIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+IEhpLAo+ID4gCj4gPiBTb3JyeSwg
SSBhbSBwaWNraW5nIHVwIHRoaXMgc2VyaWVzIGFnYWluLgo+ID4gCj4gPiBPbiA0LzE4LzE5IDc6
MDMgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4gT24gV2VkLCAxNyBBcHIgMjAx
OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+IEhpLAo+ID4gPiA+IAo+ID4gPiA+IE9uIDQv
MTcvMTkgOTo0NSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gPiA+ID4gT24gV2Vk
LCAyNyBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+ID4gPiBDbGFuZyB1bmRl
cnN0YW5kcyB0aGUgR0NDaXNtIGluIHVzZSBoZXJlLCBidXQgc3RpbGwgY29tcGxhaW5zIHRoYXQg
c3AKPiA+ID4gPiA+ID4gaXMKPiA+ID4gPiA+ID4gdW5pdGlhbGlzZWQuIEluIHN1Y2ggY2FzZXMs
IHJlc29ydCB0byB0aGUgb2xkZXIgdmVyc2lvbnMgb2YgdGhpcyBjb2RlLAo+ID4gPiA+ID4gPiB3
aGljaCBkaXJlY3RseSByZWFkIHNwIGludG8gdGhlIHRlbXBvcmFyeSB2YXJpYWJsZS4KPiA+ID4g
PiA+ID4gCj4gPiA+ID4gPiA+IE5vdGUgdGhhdCB3ZSBzdGlsbCBrZWVwIHRoZSBHQ0Npc20gaW4g
dGhlIGRlZmF1bHQgY2FzZSwgYXMgaXQgY2F1c2VzCj4gPiA+ID4gPiA+IEdDQwo+ID4gPiA+ID4g
PiB0byBjcmVhdGUgcmF0aGVyIGJldHRlciBhc3NlbWJseS4KPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+IFRoaXMgaXMgYmFzZWQgb24gdGhlIHg4NiBjb3VudGVycGFydC4KPiA+ID4gPiA+IAo+ID4g
PiA+ID4gSSB1bmRlcnN0YW5kIHRoaXMgaXMgYmFzZWQgb24gYW4gZXhpc3RpbmcgYXBwcm9hY2gg
YnV0IHdoYXQgYWJvdXQgb3RoZXIKPiA+ID4gPiA+IGNvbXBpbGVycz8gSSBoYXZlIGEgc3VnZ2Vz
dGlvbiBiZWxvdy4KPiA+ID4gPiAKPiA+ID4gPiBXaGF0IGlmIHRoZSBjb21waWxlciBhY3R1YWxs
eSBzdXBwb3J0IG5hbWVkIHJlZ2lzdGVycz8gV2h5IHdvdWxkIHdlIG1ha2UKPiA+ID4gPiB0aGUK
PiA+ID4gPiBjb2RlIGxlc3MgZWZmaWNpZW50Pwo+ID4gPiAKPiA+ID4gSXQgaXMgbm90IG15IGlu
dGVudGlvbiB0byBtYWtlIHRoZSBjb2RlIGxlc3MgZWZmaWNpZW50IGZvciBvdGhlcgo+ID4gPiBj
b21waWxlcnMuIEhvd2V2ZXIsIHJlYWRpbmcgdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCB0aGUgcGF0
Y2ggSSBoYXZlIHRoZQo+ID4gPiBpbXByZXNzaW9uIHRoYXQgdGhlIGNsYW5nIHZlcnNpb24gaXMg
bW9yZSBsaWtlbHkgdG8gYmUgYXBwbGljYWJsZSB0bwo+ID4gPiBvdGhlciBjb21waWxlcnMsIGNv
bXBhcmVkIHRvIHRoZSBnY2MgdmVyc2lvbi4gTW9yZSAic3RhbmRhcmQiLiBUaGUKPiA+ID4gcmVh
c29uIGlzIHRoYXQgdGhlIGNsYW5nIHZlcnNpb24gb25seSByZXF1aXJlcyBhc20gaW5saW5lLCB3
aGlsZSB0aGUgZ2NjCj4gPiA+IHZlcnNpb24gcmVxdWlyZXMgYm90aCBhc20gaW5saW5lIGFuZCBu
YW1lZCByZWdpc3RlcnMuIEZvciB0aGUgc2FrZSBvZgo+ID4gPiBnZXR0aW5nIFhlbiB0byBjb21w
aWxlIG91dCBvZiB0aGUgYm94IHdpdGggYW55IEMgY29tcGlsZXIsIEkgdGhpbmsgaXQgaXMKPiA+
ID4gYmVzdCBpZiB3ZSBkZWZhdWx0IHRvIHRoZSBsZXNzIGRlbWFuZGluZyB2ZXJzaW9uIG9mIHRo
ZSBpbXBsZW1lbnRhdGlvbgo+ID4gPiBmb3IgdW5rbm93biBjb21waWxlcnMuCj4gPiBXaGlsZSBi
dWlsZGluZyBYZW4gb3V0IG9mIGJveCBpcyBuaWNlIGdvYWwgdG8gaGF2ZSwgdGhpcyBpcyBsaWtl
bHkgYmUgdmVyeQo+ID4gaGFyZCB0byByZWFjaCBvdXQgYmVjYXVzZSBYZW4gaXMgdXNpbmcgYSBs
b3Qgb2YgR0NDaXNtLiBJdCBtb3N0bHkgd29yayB3aXRoCj4gPiBDbGFuZyBiZWNhdXNlIHRoZXkg
aGF2ZSBhZG9wdGVkIHNvbWUgb2YgdGhlbS4KPiA+IAo+ID4gSSB3b3VsZCBiZSBoYXBweSB0byBy
ZXZlcnQgdGhlIGNvbmRpdGlvbiwgYnV0IHRoZW4gQUZBSUNUIHRoZXJlIGFyZSBubyBwcmV0dHkK
PiA+IHdheSB0byBub3cgdGhhdCB3ZSBhcmUgdXNpbmcgR0NDLiBXaGlsZSB0aGUgZGVmaW5lIF9f
R05VQ19fIGlzIG1lYW50IHRvIHRlbGwKPiA+IHlvdSB0aGlzIGlzIGNvbXBpbGVkIHdpdGggR0ND
LCBjbGFuZyBpcyBhbHNvIGRlZmluaW5nIGl0Lgo+IAo+IFRoYXQncyBob3JyaWJsZSwgSSBkaWRu
J3Qga25vdyBhYm91dCB0aGF0IQo+IAo+IAo+ID4gU28gdGhlIGNvbmRpdGlvbiB3b3VsZCBoYXZl
IHRvIGJlCj4gPiAKPiA+ICNpZiAhZGVmaW5lZChfX2NsYW5nX18pICYmIGRlZmluZWQoX19HTlVD
X18pCj4gCj4gOi0oCj4gCj4gCj4gPiBCdXQgdGhlbiBpZiBjbGFuZyBpcyBhbHJlYWR5IGRlZmlu
aW5nIF9fR05VQ19fLCB3aGF0IGFjdHVhbGx5IHByZXZlbnRzIGFueQo+ID4gb3RoZXIgdG8gZG8g
aXQ/Cj4gPiAKPiA+IEkgaGF2ZSB5ZXQgdG8gc2VlIGFueW9uZSB3YW50ZWQgdG8gYnVpbGQgWGVu
IHdpdGggYW5vdGhlciBjb21waWxlciBvdGhlciB0aGFuCj4gPiBjbGFuZyBhbmQgR0NDLiBTbyBJ
IHdpbGwgbGVhdmUgdGhpcyBwYXRjaCBhcyBpcy4gRmVlbCBmcmVlIHRvIHN1Z2dlc3QgYQo+ID4g
ZGlmZmVyZW50IGFwcHJvYWNoIGlmIHlvdSBhcmUgbm90IGhhcHB5IHdpdGggdGhpcy4KPiAKPiBJ
cyB0aGVyZSBhIF9fUkVBTExZX1JFQUxMWV9HVU5DX18gdmFyaWFibGU/IEkgZ3Vlc3Mgbm90LCBz
byBJIGRvbid0IGhhdmUKPiBhIGJldHRlciBzdWdnZXN0aW9uLiBUaGlzIHByb2JsZW0gaXMgcXVp
dGUgYW5ub3lpbmcgKG5vdCB5b3VyIGZhdWx0IG9mCj4gY291cnNlKSBJIHdvbmRlciBob3cgb3Ro
ZXIgcHJvamVjdHMgZGVhbCB3aXRoIGl0LiBUaGVyZSBtdXN0IGJlIGEKPiAiY2xlYW4iIHdheSB0
byBkaXN0aW5ndWlzaCBnY2MgZnJvbSBvdGhlcnM/Cj4gCj4gRm9yIG5vdywgSSBhbSBPSyB3aXRo
IHRoaXMgcGF0Y2ggYXMgaXMgYmVjYXVzZSBJIHdvdWxkbid0IGtub3cgd2hhdCBlbHNlCj4gdG8g
c3VnZ2VzdCwgYW5kIEkgYWdyZWUgdGhhdCAhZGVmaW5lZChfX2NsYW5nX18pICYmIGRlZmluZWQo
X19HTlVDX18pIGlzCj4gYmFkLgoKYW5kIHlvdSBjYW4gYWRkOgoKQWNrZWQtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
