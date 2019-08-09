Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32588881D1
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 19:58:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw97C-0001TT-5Z; Fri, 09 Aug 2019 17:55:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gc9A=WF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hw97A-0001TL-8j
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 17:55:44 +0000
X-Inumbo-ID: e82584b2-bace-11e9-8007-d3003db85947
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e82584b2-bace-11e9-8007-d3003db85947;
 Fri, 09 Aug 2019 17:55:43 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 545DA21743;
 Fri,  9 Aug 2019 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565373342;
 bh=1H0FQDiy80YPANbj6lo6Ojg7B0SVCj1qlqN37aqbzv8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=FVuyeXKYCrWGkV9IzuBDdmUDyvN1XKaKgUM/oeJTWzN6AnwDtfwHVE7hWm9OsXeWn
 fn5yvwoxmDSL1lmX2PqfII4+/6i0hS3z/tr/KoWxbMqrkmre4v3dx/i/7/4BSFbvMU
 mNzLPpwkMH5uv4lCnz255xjtqG7nAsxgSM9b5fCs=
Date: Fri, 9 Aug 2019 10:55:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190809121440.5668-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1908091054550.7788@sstabellini-ThinkPad-T480s>
References: <20190809121440.5668-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/page_alloc: Keep away MFN 0 from the
 buddy allocator
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Stewart.Hildebrand@dornerworks.com,
 xen-devel@lists.xenproject.org, Jarvis.Roach@dornerworks.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCA5IEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQ29tYmluaW5nIG9mIGJ1
ZGRpZXMgaGFwcGVucyBvbmx5IHN1Y2ggdGhhdCB0aGUgcmVzdWx0aW5nIGxhcmdlciBidWRkeQo+
IGlzIHN0aWxsIG9yZGVyLWFsaWduZWQuIFRvIGNyb3NzIGEgem9uZSBib3VuZGFyeSB3aGlsZSBt
ZXJnaW5nLCB0aGUKPiBpbXBsaWNhdGlvbiBpcyB0aGF0IGJvdGggdGhlIGJ1ZGR5IFswLCAyXm4t
MV0gYW5kIHRoZSBidWRkeQo+IFsyXm4sIDJeKG4rMSldIGFyZSBmcmVlLgo+IAo+IElkZWFsbHkg
d2Ugd2FudCB0byBmaXggdGhlIGFsbG9jYXRvciwgYnV0IGZvciBub3cgd2UgY2FuIGp1c3QgcHJl
dmVudAo+IGFkZGluZyB0aGUgTUZOIDAgaW4gdGhlIGFsbG9jYXRvci4KPiAKPiBPbiB4ODYsIHRo
ZSBNRk4gMCBpcyBhbHJlYWR5IGtlcHQgYXdheSBmcm9tIHRoZSBidWRkeSBhbGxvY2F0b3IuIFNv
IHRoZQo+IGJ1ZyBjYW4gb25seSBoYXBwZW4gb24gQXJtIHBsYXRmb3JtIHdoZXJlIHRoZSBmaXJz
dCBtZW1vcnkgYmFuayBpcwo+IHN0YXJ0aW5nIGF0IDAuCj4gCj4gQXMgdGhpcyBpcyBhIHNwZWNp
ZmljIHRvIHRoZSBhbGxvY2F0b3IsIHRoZSBNRk4gMCBpcyByZW1vdmVkIGluIHRoZSBjb21tb24g
Y29kZQo+IHRvIGNhdGVyIGFsbCB0aGUgYXJjaGl0ZWN0dXJlcyAoY3VycmVudCBhbmQgZnV0dXJl
KS4KPiAKPiBSZXBvcnRlZC1ieTogSmVmZiBLdWJhc2NpayA8amVmZi5rdWJhc2Npa0Bkb3JuZXJ3
b3Jrcy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KCkkgY291bGQgcmVwcm9kdWNlIHRoZSBwcm9ibGVtIGFuZCBJIGNvbmZpcm0gdGhhdCB0
aGlzIHBhdGNoIGZpeGVzIGl0OgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4KVGVzdGVkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CgoKCj4gLS0tCj4gQ2M6IEphcnZpcy5Sb2FjaEBkb3JuZXJ3b3Jrcy5j
b20KPiBDYzogU3Rld2FydC5IaWxkZWJyYW5kQGRvcm5lcndvcmtzLmNvbQo+IAo+ICAgICBJIGFt
IG5vdCBzdXJlIEkgZnVsbHkgdW5kZXJzdG9vZCB0aGUgZXhhY3QgcHJvYmxlbSB3aGVuIE1GTiAw
IGlzCj4gICAgIGdpdmVuIHRvIHRoZSBhbGxvY2F0b3IuIEZlZWwgZnJlZSB0byBzdWdnZXN0IGEg
YmV0dGVyIGV4cGxhbmF0aW9uLgo+IAo+ICAgICBDYW4gYW55b25lIGFibGUgdG8gcmVwcm9kdWNl
IHRoZSBidWcgdGVzdCB3aGVyZSB0aGUgcGF0Y2gKPiAgICAgZWZmZWN0aXZlbHkgc29sdmUgdGhl
IGNyYXNoPwo+IC0tLQo+ICB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyB8IDEyICsrKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gaW5kZXgg
NDUzYjMwM2I1Yi4uNDJiOGE4Y2UyMyAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxs
b2MuYwo+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gQEAgLTE3NTksNiArMTc1OSwx
OCBAQCBzdGF0aWMgdm9pZCBpbml0X2hlYXBfcGFnZXMoCj4gICAgICBib29sIGlkbGVfc2NydWIg
PSBmYWxzZTsKPiAgCj4gICAgICAvKgo+ICsgICAgICogS2VlcCBNRk4gMCBhd2F5IGZyb20gdGhl
IGJ1ZGR5IGFsbG9jYXRvciB0byBhdm9pZCBjcm9zc2luZyB6b25lCj4gKyAgICAgKiBib3VuZGFy
eSB3aGVuIG1lcmdpbmcgdHdvIGJ1ZGRpZXMuCj4gKyAgICAgKi8KPiArICAgIGlmICggIW1mbl94
KHBhZ2VfdG9fbWZuKHBnKSkgKQo+ICsgICAgewo+ICsgICAgICAgIGlmICggbnJfcGFnZXMtLSA8
PSAxICkKPiArICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAgICAgIHBnKys7Cj4gKyAgICB9Cj4g
Kwo+ICsKPiArICAgIC8qCj4gICAgICAgKiBTb21lIHBhZ2VzIG1heSBub3QgZ28gdGhyb3VnaCB0
aGUgYm9vdCBhbGxvY2F0b3IgKGUuZyByZXNlcnZlZAo+ICAgICAgICogbWVtb3J5IGF0IGJvb3Qg
YnV0IHJlbGVhc2VkIGp1c3QgYWZ0ZXIgLS0tIGtlcm5lbCwgaW5pdHJhbWZzLAo+ICAgICAgICog
ZXRjLikuCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
