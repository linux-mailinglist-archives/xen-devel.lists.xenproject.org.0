Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C22885C6
	for <lists+xen-devel@lfdr.de>; Sat, 10 Aug 2019 00:23:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwDEs-0004Hf-Sl; Fri, 09 Aug 2019 22:19:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gc9A=WF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hwDEs-0004Ha-8f
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 22:19:58 +0000
X-Inumbo-ID: d189e0be-baf3-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d189e0be-baf3-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 22:19:56 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CE3920C01;
 Fri,  9 Aug 2019 22:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565389196;
 bh=Gp5uU96EHYFZ84WlFt4G9q+I4P5/+fpSSvqQoOORJdc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=sUT5PB+0kTb3jRwOUuadBcE9L+NwwOXrPXiPdMYYkegIq2r4gBxdwDVIbvXg5w1HT
 AArOdHe5qtYs1aYwpEWuG1mGcwaOVQYlbkEzUZdUszoiWzFud6dXRaqDgdv4G3BwNi
 TnS9z+rIAWwxKAEfy78iD9C4eP1GtskRt1XUv2JI=
Date: Fri, 9 Aug 2019 15:19:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <ac88a18f-0651-628c-fb74-e979f26df6b3@arm.com>
Message-ID: <alpine.DEB.2.21.1908091515220.7788@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <20190806214925.7534-3-sstabellini@kernel.org>
 <ac88a18f-0651-628c-fb74-e979f26df6b3@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 3/7] xen/arm: keep track of
 reserved-memory regions
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
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA3IEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiAwNi8wOC8yMDE5IDIyOjQ5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBBcyB3
ZSBwYXJzZSB0aGUgZGV2aWNlIHRyZWUgaW4gWGVuLCBrZWVwIHRyYWNrIG9mIHRoZSByZXNlcnZl
ZC1tZW1vcnkKPiA+IHJlZ2lvbnMgYXMgdGhleSBuZWVkIHNwZWNpYWwgdHJlYXRtZW50IChmb2xs
b3ctdXAgcGF0Y2hlcyB3aWxsIG1ha2UgdXNlCj4gPiBvZiB0aGUgc3RvcmVkIGluZm9ybWF0aW9u
LikKPiA+IAo+ID4gUmV1c2UgcHJvY2Vzc19tZW1vcnlfbm9kZSB0byBhZGQgcmVzZXJ2ZWQtbWVt
b3J5IHJlZ2lvbnMgdG8gdGhlCj4gPiBib290aW5mby5yZXNlcnZlZF9tZW0gYXJyYXkuCj4gPiAK
PiA+IFJlZnVzZSB0byBjb250aW51ZSBvbmNlIHdlIHJlYWNoIHRoZSBtYXggbnVtYmVyIG9mIHJl
c2VydmVkIG1lbW9yeQo+ID4gcmVnaW9ucyB0byBhdm9pZCBhY2NpZGVudGFsbHkgbWFwcGluZyBh
bnkgcG9ydGlvbnMgb2YgdGhlbSBpbnRvIGEgVk0uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiA+IAo+ID4gLS0tCj4gPiBD
aGFuZ2VzIGluIHY0Ogo+ID4gLSBkZXB0aCArIDEgaW4gcHJvY2Vzc19yZXNlcnZlZF9tZW1vcnlf
bm9kZQo+IAo+IEFoLCB5b3UgZml4ZWQgaXQgaW4gdGhpcyBwYXRjaC4gQnV0IHRoZW4sIHRoaXMg
ZG9lcyBub3QgbWF0Y2ggdGhlCj4gZG9jdW1lbnRhdGlvbiBpbiBwYXRjaCAjMS4KClllcyBnb29k
IHBvaW50LCBzZWUgYmVsb3cKCgo+ID4gLSBwYXNzIGFkZHJlc3NfY2VsbHMgYW5kIHNpemVfY2Vs
bHMgdG8gZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZQo+ID4gLSBwYXNzIHN0cnVjdCBtZW1pbmZv
ICogaW5zdGVhZCBvZiBhIGJvb2xlYW4gdG8gcHJvY2Vzc19tZW1vcnlfbm9kZQo+ID4gLSBpbXBy
b3ZlIGluLWNvZGUgY29tbWVudAo+IAo+IEkgY2FuJ3Qgc2VlIGFueSBjb21tZW50LCBpcyB0aGF0
IGFuIGltcHJvdmVtZW50PyA6KQoKSXQgZ290IGxvc3Qgd2l0aCB0aGUgcmVmYWN0b3Jpbmcgb2Yg
dGhlIGNvZGUsIGJ1dCBJIGRvbid0IHRoaW5rIHdlIG5lZWQKaXQgYW55bW9yZQoKCj4gPiAtIHVz
ZSBhIHNlcGFyYXRlIHByb2Nlc3NfcmVzZXJ2ZWRfbWVtb3J5X25vZGUgKHNlcGFyYXRlIGZyb20K
PiA+ICAgIHByb2Nlc3NfbWVtb3J5X25vZGUpIGZ1bmN0aW9uIHdyYXBwZXIgdG8gaGF2ZSBkaWZm
ZXJlbnQgZXJyb3IgaGFuZGxpbmcKPiA+IAo+ID4gQ2hhbmdlcyBpbiB2MzoKPiA+IC0gbWF0Y2gg
b25seSAvcmVzZXJ2ZWQtbWVtb3J5Cj4gPiAtIHB1dCB0aGUgd2FybmluZyBiYWNrIGluIHBsYWNl
IGZvciByZWcgbm90IHByZXNlbnQgb24gYSBub3JtYWwgbWVtb3J5Cj4gPiAgICByZWdpb24KPiA+
IC0gcmVmdXNlIHRvIGNvbnRpbnVlIG9uY2Ugd2UgcmVhY2ggdGhlIG1heCBudW1iZXIgb2YgcmVz
ZXJ2ZWQgbWVtb3J5Cj4gPiAgICByZWdpb25zCj4gPiAKPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAt
IGNhbGwgcHJvY2Vzc19tZW1vcnlfbm9kZSBmcm9tIHByb2Nlc3NfcmVzZXJ2ZWRfbWVtb3J5X25v
ZGUgdG8gYXZvaWQKPiA+ICAgIGR1cGxpY2F0aW9uCj4gPiAtLS0KPiA+ICAgeGVuL2FyY2gvYXJt
L2Jvb3RmZHQuYyAgICAgIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LQo+ID4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmggfCAgMSArCj4gPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4g
PiBpbmRleCBjMjJkNTdjZDcyLi4zZTZmZDYzYjE2IDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gv
YXJtL2Jvb3RmZHQuYwo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+ID4gQEAgLTE0
NCw2ICsxNDQsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBwcm9jZXNzX21lbW9yeV9ub2RlKGNvbnN0
IHZvaWQgKmZkdCwKPiA+IGludCBub2RlLAo+ID4gICAgICAgY29uc3QgX19iZTMyICpjZWxsOwo+
ID4gICAgICAgcGFkZHJfdCBzdGFydCwgc2l6ZTsKPiA+ICAgICAgIHUzMiByZWdfY2VsbHMgPSBh
ZGRyZXNzX2NlbGxzICsgc2l6ZV9jZWxsczsKPiA+ICsgICAgc3RydWN0IG1lbWluZm8gKm1lbSA9
IChzdHJ1Y3QgbWVtaW5mbyAqKWRhdGE7Cj4gCj4gVGhlIGNhc3QgaXMgdW5uZWNlc3NhcnkuCj4g
Cj4gVGhlIHJlc3Qgb2YgdGhlIGNvZGUgbG9va3MgZ29vZC4gUGVuZGluZyB0aGUgZGlzY3Vzc2lv
biBhYm91dAo+IGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGU6Cj4gCj4gQWNrZWQtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpUaGFuayB5b3UuIEkgcmVtb3ZlZCB0aGUg
Y2FzdC4gQWxzbywgSSB0aGluayB0aGF0IGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8KZG8gdGhlIGRl
cHRoIGluY3JlYXNlIChkZXB0aCArIDEpIGluc2lkZSB0aGUgaW1wbGVtZW50YXRpb24gb2YKZGV2
aWNlX3RyZWVfZm9yX2VhY2hfbm9kZSBpbnN0ZWFkIG9mIGF0IHRoZSBjYWxsZXIgc2l0ZSwgbGlr
ZSBpdCBpcyBkb25lCmluIHRoaXMgcGF0Y2guIFRoaXMgd291bGQgbWF0Y2ggdGhlIGRvY3VtZW50
YXRpb24gYmV0dGVyIGFuZCBpcyBjbGVhbmVyCmZyb20gYW4gaW50ZXJmYWNlIHBvaW50IG9mIHZp
ZXcuIFNvIEknbGwgcmVtb3ZlIHRoZSBkZXB0aCBpbmNyZWFzZSBmcm9tCnRoaXMgcGF0Y2ggYW5k
IG1vdmUgaXQgdG8gdGhlIGZpcnN0IHBhdGNoIChtaW5fZGVwdGggPSBkZXB0aCArIDEpLgoKR2l2
ZW4gdGhlIGNoYW5nZSwgSSB3b24ndCBhZGQgdGhlIGFja2VkLWJ5IHRvIGdpdmUgeW91IHRoZSBj
aGFuY2UgdG8KZ2l2ZSBpdCBhbm90aGVyIGxvb2suCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
