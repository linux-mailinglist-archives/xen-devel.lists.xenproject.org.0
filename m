Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426A044A05
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 19:58:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbTx8-00080k-9C; Thu, 13 Jun 2019 17:55:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fP4x=UM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hbTx6-00080f-Q2
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 17:55:56 +0000
X-Inumbo-ID: 7dad6b00-8e04-11e9-a778-47da20032f81
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7dad6b00-8e04-11e9-a778-47da20032f81;
 Thu, 13 Jun 2019 17:55:55 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F8C72063F;
 Thu, 13 Jun 2019 17:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560448554;
 bh=JWg1XtN3Tl+2YpALE9G0ME/FG7W4PfEfJpWvSiPrTSM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=E2m88v4ehklslKc8+RvIgUDHIF03uLD3wHb/CJc4GMRLMQibOUm085a5dwKHJEyKu
 OcO14Z0ksaj6vFrfUZtsriIcpCr0BLBgr+0tIcjNnG1rvQUbNVozts2XDr4nwWkaSk
 TBvu35DwdBwN/P7/kzCWRC3GBpMLJ5NlYtuWQ5Fw=
Date: Thu, 13 Jun 2019 10:55:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <c791b221-a809-6d56-4137-055fd0ffa604@arm.com>
Message-ID: <alpine.DEB.2.21.1906131055450.13737@sstabellini-ThinkPad-T480s>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-10-julien.grall@arm.com>
 <alpine.DEB.2.21.1906121523550.13737@sstabellini-ThinkPad-T480s>
 <c791b221-a809-6d56-4137-055fd0ffa604@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 09/12] xen/arm: mm: Use {,
 un}map_domain_page() to map/unmap Xen page-tables
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
 Andrii Anisov <Andrii_Anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxMyBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gNi8xMi8xOSAxMToyNSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
VHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBDdXJyZW50bHksIHRo
ZSB2aXJ0dWFsIGFkZHJlc3Mgb2YgdGhlIDNyZCBsZXZlbCBwYWdlLXRhYmxlcyBpcyBvYnRhaW5l
ZAo+ID4gPiB1c2luZyBtZm5fdG9fdmlydCgpLgo+ID4gPiAKPiA+ID4gT24gQXJtMzIsIG1mbl90
b192aXJ0IGNhbiBvbmx5IHdvcmsgb24geGVuaGVhcCBwYWdlLiBXaGlsZSBpbiBwcmFjdGljZQo+
ID4gPiBhbGwgdGhlIHBhZ2UtdGFibGVzIHVwZGF0ZWQgd2lsbCByZXNpZGUgaW4geGVuaGVhcCwg
aW4gcHJhY3RpdmUgdGhlCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeIGluIHRoZW9yeSA/Cj4gCj4gVGhlIGZpcnN0IG9uZSBzaG91
bGQgdG8gYmUgInRoZW9yeSIgYW5kIHRoZSBzZWNvbmQgInByYWN0aWNlIi4gQmVjYXVzZSBzb21l
IG9mCj4gdGhlIGJvb3RzdHJhcCBwYWdlLXRhYmxlcyAoZS5nIHhlbl9maXhtYXAveGVuX21hcHBp
bmcpIGFyZSBwYXJ0IG9mIFhlbiBiaW5hcnkuCj4gCj4gPiAKPiA+IAo+ID4gPiBwYWdlLXRhYmxl
cyBjb3ZlcmluZyBYZW4gbWVtb3J5IChlLmcgeGVuX21hcHBpbmcpIGlzIHBhcnQgb2YgWGVuIGJp
bmFyeS4KPiA+ID4gCj4gPiA+IEZ1cnRoZXJtb3JlLCBhIGZvbGxvdy11cCBjaGFuZ2Ugd2lsbCB1
cGRhdGUgeGVuX3B0X3VwZGF0ZV9lbnRyeSgpIHRvCj4gPiA+IHdhbGsgYWxsIHRoZSBsZXZlbHMg
YW5kIHRoZXJlZm9yZSBiZSBtb3JlIGdlbmVyaWMuIFNvbWUgb2YgdGhlCj4gPiA+IHBhZ2UtdGFi
bGVzIHdpbGwgYWxzbyBwYXJ0IG9mIFhlbiBtZW1vcnkgYW5kIHRoZXJlZm9yZSB3aWxsIG5vdCBi
ZQo+ID4gPiByZWFjaGFibGUgdXNpbmcgbWZuX3RvX3ZpcnQoKS4KPiA+ID4gCj4gPiA+IFRoZSBl
YXNpZXN0IHdheSB0byByZWFjaCB0aG9zZSBwYWdlcyBpcyB0byB1c2UgeywgdW59bWFwX2RvbWFp
bl9wYWdlKCkuCj4gPiA+IFdoaWxlIG9uIGFybTMyIHRoaXMgbWVhbnMgYW4gZXh0cmEgbWFwcGlu
ZyBpbiB0aGUgbm9ybWFsIGNhc2VzLCB0aGlzIGlzCj4gPiA+IG5vdAo+ID4gPiB2ZXJ5IGltcG9y
dGFudCBhcyB4ZW4gcGFnZS10YWJsZXMgYXJlIG5vdCB1cGRhdGVkIG9mdGVuLgo+ID4gPiAKPiA+
ID4gSW4gb3JkZXIgdG8gYWxsb3cgZnV0dXJlIGNoYW5nZSBpbiB0aGUgd2F5IFhlbiBwYWdlLXRh
YmxlcyBhcmUgbWFwcGVkLAo+ID4gPiB0d28gbmV3IGhlbHBlcnMgYXJlIGludHJvZHVjZWQgdG8g
bWFwL3VubWFwIHRoZSBwYWdlLXRhYmxlcy4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBBbmRy
aWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+ID4gCj4gPiBhc2lkZSBmcm9tIHRo
ZSB0eXBvIGFib3ZlOgo+IAo+IExldCBtZSBrbm93IGlmIG15IHN1Z2dlc3Rpb24gbWFrZXMgc2Vu
c2UgYWJvdmUuCgpZZXMsIGZpbmUKCgo+ID4gQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiAKPiBUaGFuayB5b3UuCj4gCj4gQ2hlZXJzLAo+IAo+
IC0tIAo+IEp1bGllbiBHcmFsbAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
