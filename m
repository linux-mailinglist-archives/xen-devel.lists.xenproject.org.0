Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBC27AF6E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:16:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsVh1-0006aO-EG; Tue, 30 Jul 2019 17:13:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsVh0-0006aJ-B6
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:13:42 +0000
X-Inumbo-ID: 6041e6be-b2ed-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6041e6be-b2ed-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 17:13:40 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3BC0206A2;
 Tue, 30 Jul 2019 17:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564506820;
 bh=VaSWHeyDax69UcnbA13llM5e849Jbn3isfso5k2oTLo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=LasEHTDQLXjBcJ7JP+QelZXLLtXJ+EsOnP0Nk8K/I5gGE+8nK1ytRCxFlqLnMw/rk
 CP6MaHVAgKvC1PWU/YJ/vA4hxkl1EfJnevQg3cKsT6hbeCE/HJgy1O/i6SEvVOOiNM
 a+KOuuT97dvEKHdl4i75r8d9GHtiS3VCDQ0PBA/k=
Date: Tue, 30 Jul 2019 10:13:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-9-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301013320.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-9-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 08/35] xen/arm64: head: Rework and
 document zero_bss()
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

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIHNlY29uZGFyeSBD
UFVzLCB6ZXJvX2JzcygpIHdpbGwgYmUgYSBOT1AgYmVjYXVzZSBCU1Mgb25seSBuZWVkIHRvIGJl
Cj4gemVyb2VkIG9uY2UgYXQgYm9vdC4gU28gdGhlIGNhbGwgaW4gdGhlIHNlY29uZGFyeSBDUFVz
IHBhdGggY2FuIGJlCj4gcmVtb3ZlZC4gSXQgYWxzbyBtZWFucyB0aGF0IHgyNiBkb2VzIG5vdCBu
ZWVkIHRvIGJlIHNldCBmb3Igc2Vjb25kYXJ5Cj4gQ1BVLgo+IAo+IE5vdGUgdGhhdCB3ZSB3aWxs
IG5lZWQgdG8ga2VlcCB4MjYgYXJvdW5kIGZvciB0aGUgYm9vdCBDUFUgYXMgQlNTIHNob3VsZAo+
IG5vdCBiZSByZXNldCB3aGVuIGJvb3RpbmcgdmlhIFVFRkkuCj4gCj4gTGFzdGx5LCBkb2N1bWVu
dCB0aGUgYmVoYXZpb3IgYW5kIHRoZSBtYWluIHJlZ2lzdGVycyB1c2FnZSB3aXRoaW4gdGhlCj4g
ZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+CgoKPiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgIC0gQ2xhcmlm
eSB0aGUgY29tbWl0IG1lc3NhZ2UKPiAgICAgICAgIC0gTWVudGlvbiB4MjAgaXMgdXNlZCBhcyBh
biBpbnB1dAo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMTQgKysrKysrKysr
Ky0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TCj4gaW5kZXggZmJjYzc5MmFkZS4uOTJjODMzOGQ3MSAxMDA2NDQKPiAt
LS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0
L2hlYWQuUwo+IEBAIC03MSw3ICs3MSw3IEBACj4gICAqICB4MjMgLSBVQVJUIGFkZHJlc3MKPiAg
ICogIHgyNCAtCj4gICAqICB4MjUgLSBpZGVudGl0eSBtYXAgaW4gcGxhY2UKPiAtICogIHgyNiAt
IHNraXBfemVyb19ic3MKPiArICogIHgyNiAtIHNraXBfemVyb19ic3MgKGJvb3QgY3B1IG9ubHkp
Cj4gICAqICB4MjcgLQo+ICAgKiAgeDI4IC0KPiAgICogIHgyOSAtCj4gQEAgLTMxMyw4ICszMTMs
NiBAQCBHTE9CQUwoaW5pdF9zZWNvbmRhcnkpCj4gICAgICAgICAgc3ViICAgeDIwLCB4MTksIHgw
ICAgICAgICAgICAvKiB4MjAgOj0gcGh5cy1vZmZzZXQgKi8KPiAgCj4gICAgICAgICAgbW92ICAg
eDIyLCAjMSAgICAgICAgICAgICAgICAvKiB4MjIgOj0gaXNfc2Vjb25kYXJ5X2NwdSAqLwo+IC0g
ICAgICAgIC8qIEJvb3QgQ1BVIGFscmVhZHkgemVybyBCU1Mgc28gc2tpcCBpdCBvbiBzZWNvbmRh
cnkgQ1BVcy4gKi8KPiAtICAgICAgICBtb3YgICB4MjYsICMxICAgICAgICAgICAgICAgIC8qIFgy
NiA6PSBza2lwX3plcm9fYnNzICovCj4gIAo+ICAgICAgICAgIG1ycyAgIHgwLCBtcGlkcl9lbDEK
PiAgICAgICAgICBsZHIgICB4MTMsID0ofk1QSURSX0hXSURfTUFTSykKPiBAQCAtMzM3LDcgKzMz
NSw2IEBAIEdMT0JBTChpbml0X3NlY29uZGFyeSkKPiAgICAgICAgICBQUklOVCgiIGJvb3Rpbmcg
LVxyXG4iKQo+ICAjZW5kaWYKPiAgICAgICAgICBibCAgICBjaGVja19jcHVfbW9kZQo+IC0gICAg
ICAgIGJsICAgIHplcm9fYnNzCj4gICAgICAgICAgYmwgICAgY3B1X2luaXQKPiAgICAgICAgICBi
bCAgICBjcmVhdGVfcGFnZV90YWJsZXMKPiAgICAgICAgICBibCAgICBlbmFibGVfbW11Cj4gQEAg
LTM3NSw2ICszNzIsMTUgQEAgY2hlY2tfY3B1X21vZGU6Cj4gICAgICAgICAgYiBmYWlsCj4gIEVO
RFBST0MoY2hlY2tfY3B1X21vZGUpCj4gIAo+ICsvKgo+ICsgKiBaZXJvIEJTUwo+ICsgKgo+ICsg
KiBJbnB1dHM6Cj4gKyAqICAgeDIwOiBQaHlzaWNhbCBvZmZzZXQKPiArICogICB4MjY6IERvIHdl
IG5lZWQgdG8gemVybyBCU1M/Cj4gKyAqCj4gKyAqIENsb2JiZXJzIHgwIC0geDMKPiArICovCj4g
IHplcm9fYnNzOgo+ICAgICAgICAgIC8qIFplcm8gQlNTIG9ubHkgd2hlbiByZXF1ZXN0ZWQgKi8K
PiAgICAgICAgICBjYm56ICB4MjYsIHNraXBfYnNzCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
