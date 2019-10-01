Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A1BC2B98
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 03:18:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF6l7-0006BH-U0; Tue, 01 Oct 2019 01:15:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iF6l6-0006BC-8g
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 01:15:20 +0000
X-Inumbo-ID: eefe6680-e3e8-11e9-97fb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id eefe6680-e3e8-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 01:15:19 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B51132075C;
 Tue,  1 Oct 2019 01:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569892519;
 bh=mkZmpPiCwuXJvQu9XKxdY9I0wFuGPAQT07zm5S3anW0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=rXDKH1tQMnZjAmlEd44B76T0xaFJZN9qw2/h3FaSStc28n6tw8mW4oiyX8m7xHZ6J
 Ca8lNgW3KCsiu2ZZ5PyWjbLRpivwsOHDF1sZQaW7Fb4YE0zVFE7+cLd0Ohq4MUm5uV
 6fYjRK7aCjukuFjjJwnzXawlNj98qsJQ3XwX4pmo=
Date: Mon, 30 Sep 2019 18:15:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <441ce7f6-7907-dc23-b0e6-7503ba888953@arm.com>
Message-ID: <alpine.DEB.2.21.1909301808070.2594@sstabellini-ThinkPad-T480s>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-3-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171340390.1370@sstabellini-ThinkPad-X260>
 <be790e9c-75bb-b38b-9a01-8c586580ed1a@arm.com>
 <alpine.DEB.2.10.1904181056410.1370@sstabellini-ThinkPad-X260>
 <441ce7f6-7907-dc23-b0e6-7503ba888953@arm.com>
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
 Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCAyOSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IFNvcnJ5
LCBJIGFtIHBpY2tpbmcgdXAgdGhpcyBzZXJpZXMgYWdhaW4uCj4gCj4gT24gNC8xOC8xOSA3OjAz
IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBXZWQsIDE3IEFwciAyMDE5LCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPiAKPiA+ID4gT24gNC8xNy8xOSA5OjQ1
IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCAyNyBNYXIgMjAx
OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+ID4gQ2xhbmcgdW5kZXJzdGFuZHMgdGhlIEdD
Q2lzbSBpbiB1c2UgaGVyZSwgYnV0IHN0aWxsIGNvbXBsYWlucyB0aGF0IHNwCj4gPiA+ID4gPiBp
cwo+ID4gPiA+ID4gdW5pdGlhbGlzZWQuIEluIHN1Y2ggY2FzZXMsIHJlc29ydCB0byB0aGUgb2xk
ZXIgdmVyc2lvbnMgb2YgdGhpcyBjb2RlLAo+ID4gPiA+ID4gd2hpY2ggZGlyZWN0bHkgcmVhZCBz
cCBpbnRvIHRoZSB0ZW1wb3JhcnkgdmFyaWFibGUuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IE5vdGUg
dGhhdCB3ZSBzdGlsbCBrZWVwIHRoZSBHQ0Npc20gaW4gdGhlIGRlZmF1bHQgY2FzZSwgYXMgaXQg
Y2F1c2VzCj4gPiA+ID4gPiBHQ0MKPiA+ID4gPiA+IHRvIGNyZWF0ZSByYXRoZXIgYmV0dGVyIGFz
c2VtYmx5Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGlzIGlzIGJhc2VkIG9uIHRoZSB4ODYgY291
bnRlcnBhcnQuCj4gPiA+ID4gCj4gPiA+ID4gSSB1bmRlcnN0YW5kIHRoaXMgaXMgYmFzZWQgb24g
YW4gZXhpc3RpbmcgYXBwcm9hY2ggYnV0IHdoYXQgYWJvdXQgb3RoZXIKPiA+ID4gPiBjb21waWxl
cnM/IEkgaGF2ZSBhIHN1Z2dlc3Rpb24gYmVsb3cuCj4gPiA+IAo+ID4gPiBXaGF0IGlmIHRoZSBj
b21waWxlciBhY3R1YWxseSBzdXBwb3J0IG5hbWVkIHJlZ2lzdGVycz8gV2h5IHdvdWxkIHdlIG1h
a2UKPiA+ID4gdGhlCj4gPiA+IGNvZGUgbGVzcyBlZmZpY2llbnQ/Cj4gPiAKPiA+IEl0IGlzIG5v
dCBteSBpbnRlbnRpb24gdG8gbWFrZSB0aGUgY29kZSBsZXNzIGVmZmljaWVudCBmb3Igb3RoZXIK
PiA+IGNvbXBpbGVycy4gSG93ZXZlciwgcmVhZGluZyB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIHRo
ZSBwYXRjaCBJIGhhdmUgdGhlCj4gPiBpbXByZXNzaW9uIHRoYXQgdGhlIGNsYW5nIHZlcnNpb24g
aXMgbW9yZSBsaWtlbHkgdG8gYmUgYXBwbGljYWJsZSB0bwo+ID4gb3RoZXIgY29tcGlsZXJzLCBj
b21wYXJlZCB0byB0aGUgZ2NjIHZlcnNpb24uIE1vcmUgInN0YW5kYXJkIi4gVGhlCj4gPiByZWFz
b24gaXMgdGhhdCB0aGUgY2xhbmcgdmVyc2lvbiBvbmx5IHJlcXVpcmVzIGFzbSBpbmxpbmUsIHdo
aWxlIHRoZSBnY2MKPiA+IHZlcnNpb24gcmVxdWlyZXMgYm90aCBhc20gaW5saW5lIGFuZCBuYW1l
ZCByZWdpc3RlcnMuIEZvciB0aGUgc2FrZSBvZgo+ID4gZ2V0dGluZyBYZW4gdG8gY29tcGlsZSBv
dXQgb2YgdGhlIGJveCB3aXRoIGFueSBDIGNvbXBpbGVyLCBJIHRoaW5rIGl0IGlzCj4gPiBiZXN0
IGlmIHdlIGRlZmF1bHQgdG8gdGhlIGxlc3MgZGVtYW5kaW5nIHZlcnNpb24gb2YgdGhlIGltcGxl
bWVudGF0aW9uCj4gPiBmb3IgdW5rbm93biBjb21waWxlcnMuCj4gV2hpbGUgYnVpbGRpbmcgWGVu
IG91dCBvZiBib3ggaXMgbmljZSBnb2FsIHRvIGhhdmUsIHRoaXMgaXMgbGlrZWx5IGJlIHZlcnkK
PiBoYXJkIHRvIHJlYWNoIG91dCBiZWNhdXNlIFhlbiBpcyB1c2luZyBhIGxvdCBvZiBHQ0Npc20u
IEl0IG1vc3RseSB3b3JrIHdpdGgKPiBDbGFuZyBiZWNhdXNlIHRoZXkgaGF2ZSBhZG9wdGVkIHNv
bWUgb2YgdGhlbS4KPiAKPiBJIHdvdWxkIGJlIGhhcHB5IHRvIHJldmVydCB0aGUgY29uZGl0aW9u
LCBidXQgdGhlbiBBRkFJQ1QgdGhlcmUgYXJlIG5vIHByZXR0eQo+IHdheSB0byBub3cgdGhhdCB3
ZSBhcmUgdXNpbmcgR0NDLiBXaGlsZSB0aGUgZGVmaW5lIF9fR05VQ19fIGlzIG1lYW50IHRvIHRl
bGwKPiB5b3UgdGhpcyBpcyBjb21waWxlZCB3aXRoIEdDQywgY2xhbmcgaXMgYWxzbyBkZWZpbmlu
ZyBpdC4KClRoYXQncyBob3JyaWJsZSwgSSBkaWRuJ3Qga25vdyBhYm91dCB0aGF0IQoKCj4gU28g
dGhlIGNvbmRpdGlvbiB3b3VsZCBoYXZlIHRvIGJlCj4gCj4gI2lmICFkZWZpbmVkKF9fY2xhbmdf
XykgJiYgZGVmaW5lZChfX0dOVUNfXykKCjotKAoKCj4gQnV0IHRoZW4gaWYgY2xhbmcgaXMgYWxy
ZWFkeSBkZWZpbmluZyBfX0dOVUNfXywgd2hhdCBhY3R1YWxseSBwcmV2ZW50cyBhbnkKPiBvdGhl
ciB0byBkbyBpdD8KPiAKPiBJIGhhdmUgeWV0IHRvIHNlZSBhbnlvbmUgd2FudGVkIHRvIGJ1aWxk
IFhlbiB3aXRoIGFub3RoZXIgY29tcGlsZXIgb3RoZXIgdGhhbgo+IGNsYW5nIGFuZCBHQ0MuIFNv
IEkgd2lsbCBsZWF2ZSB0aGlzIHBhdGNoIGFzIGlzLiBGZWVsIGZyZWUgdG8gc3VnZ2VzdCBhCj4g
ZGlmZmVyZW50IGFwcHJvYWNoIGlmIHlvdSBhcmUgbm90IGhhcHB5IHdpdGggdGhpcy4KCklzIHRo
ZXJlIGEgX19SRUFMTFlfUkVBTExZX0dVTkNfXyB2YXJpYWJsZT8gSSBndWVzcyBub3QsIHNvIEkg
ZG9uJ3QgaGF2ZQphIGJldHRlciBzdWdnZXN0aW9uLiBUaGlzIHByb2JsZW0gaXMgcXVpdGUgYW5u
b3lpbmcgKG5vdCB5b3VyIGZhdWx0IG9mCmNvdXJzZSkgSSB3b25kZXIgaG93IG90aGVyIHByb2pl
Y3RzIGRlYWwgd2l0aCBpdC4gVGhlcmUgbXVzdCBiZSBhCiJjbGVhbiIgd2F5IHRvIGRpc3Rpbmd1
aXNoIGdjYyBmcm9tIG90aGVycz8KCkZvciBub3csIEkgYW0gT0sgd2l0aCB0aGlzIHBhdGNoIGFz
IGlzIGJlY2F1c2UgSSB3b3VsZG4ndCBrbm93IHdoYXQgZWxzZQp0byBzdWdnZXN0LCBhbmQgSSBh
Z3JlZSB0aGF0ICFkZWZpbmVkKF9fY2xhbmdfXykgJiYgZGVmaW5lZChfX0dOVUNfXykgaXMKYmFk
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
