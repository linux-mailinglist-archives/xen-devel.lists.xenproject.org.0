Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C5E7B1DA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 20:23:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsWjY-0004E8-Km; Tue, 30 Jul 2019 18:20:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsWjX-0004E3-18
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 18:20:23 +0000
X-Inumbo-ID: b0ce2fb0-b2f6-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b0ce2fb0-b2f6-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 18:20:21 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 79F222089E;
 Tue, 30 Jul 2019 18:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564510820;
 bh=6jiURsZZrYbTYtDUWAiGhvFQ43L7y06VGqgrsp2SB7Q=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=YYtELTe7ZfyCDYV81zg50oFt5JCA+MtSRHVtXePeflT5RpCgXkPVjOziONK2CYEiE
 Brw3F1JdpnyuYp4Togu9YZv2D540lMD+ZT6PVRZjZPbkKjbky8BAM2EfuIgz1Nad42
 ekDlRCdeDqMh0DxZxnKN7Zvil8+g1xs+yUBdBONM=
Date: Tue, 30 Jul 2019 11:20:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-18-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301114560.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-18-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 17/35] xen/arm64: head: Setup TTBR_EL2 in
 enable_mmu() and add missing isb
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IFRUQlJfRUwyIGlzIHNldHVwIGluIGNyZWF0ZV9wYWdlX3RhYmxlcygpLiBUaGlzIGlzIGZpbmUK
PiBhcyBpdCBpcyBjYWxsZWQgYnkgZXZlcnkgQ1BVcy4KPiAKPiBIb3dldmVyLCBzdWNoIGFzc3Vt
cHRpb24gbWF5IG5vdCBob2xkIGluIHRoZSBmdXR1cmUuIFRvIG1ha2UgY2hhbmdlCj4gZWFzaWVy
LCB0aGUgVFRCUl9FTDIgaXMgbm90IHNldHVwIGluIGVuYWJsZV9tbXUoKS4KPiAKPiBUYWtlIHRo
ZSBvcHBvcnR1bml0eSB0byBhZGQgdGhlIG1pc3NpbmcgaXNiKCkgdG8gZW5zdXJlIHRoZSBUVEJS
X0VMMiBpcwo+IHNlZW4gYmVmb3JlIHRoZSBNTVUgaXMgdHVybmVkIG9uLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpNYWtlcyBzZW5zZQoK
UmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
Cgo+IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAgLSBQYXRjaCBhZGRlZAo+IC0t
LQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgNyArKysrKy0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gaW5k
ZXggNzU0MTYzNTEwMi4uOWFmZDg5ZDQ0NyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJt
NjQvaGVhZC5TCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IEBAIC01MDEsOSAr
NTAxLDcgQEAgY3JlYXRlX3BhZ2VfdGFibGVzOgo+ICAgICAgICAgIGNtcCAgIHgxOSwgI1hFTl9W
SVJUX1NUQVJUCj4gICAgICAgICAgY3NldCAgeDI1LCBlcSAgICAgICAgICAgICAgICAvKiB4MjUg
Oj0gaWRlbnRpdHkgbWFwIGluIHBsYWNlLCBvciBub3QgKi8KPiAgCj4gLSAgICAgICAgLyogV3Jp
dGUgWGVuJ3MgUFQncyBwYWRkciBpbnRvIFRUQlIwX0VMMiAqLwo+ICAgICAgICAgIGxvYWRfcGFk
ZHIgeDQsIGJvb3RfcGd0YWJsZQo+IC0gICAgICAgIG1zciAgIFRUQlIwX0VMMiwgeDQKPiAgCj4g
ICAgICAgICAgLyogU2V0dXAgYm9vdF9wZ3RhYmxlOiAqLwo+ICAgICAgICAgIGxvYWRfcGFkZHIg
eDEsIGJvb3RfZmlyc3QKPiBAQCAtNjMxLDYgKzYyOSwxMSBAQCBlbmFibGVfbW11Ogo+ICAgICAg
ICAgIHRsYmkgIGFsbGUyICAgICAgICAgICAgICAgICAgLyogRmx1c2ggaHlwZXJ2aXNvciBUTEJz
ICovCj4gICAgICAgICAgZHNiICAgbnNoCj4gIAo+ICsgICAgICAgIC8qIFdyaXRlIFhlbidzIFBU
J3MgcGFkZHIgaW50byBUVEJSMF9FTDIgKi8KPiArICAgICAgICBsb2FkX3BhZGRyIHgwLCBib290
X3BndGFibGUKPiArICAgICAgICBtc3IgICBUVEJSMF9FTDIsIHgwCj4gKyAgICAgICAgaXNiCj4g
Kwo+ICAgICAgICAgIG1ycyAgIHgwLCBTQ1RMUl9FTDIKPiAgICAgICAgICBvcnIgICB4MCwgeDAs
ICNTQ1RMUl9BeHhfRUx4X00gIC8qIEVuYWJsZSBNTVUgKi8KPiAgICAgICAgICBvcnIgICB4MCwg
eDAsICNTQ1RMUl9BeHhfRUx4X0MgIC8qIEVuYWJsZSBELWNhY2hlICovCj4gLS0gCj4gMi4xMS4w
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
