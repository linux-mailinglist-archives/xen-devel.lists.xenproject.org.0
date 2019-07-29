Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1477479BA9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 23:57:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsDbs-0007bO-SS; Mon, 29 Jul 2019 21:55:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsDbq-0007bH-V4
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 21:55:10 +0000
X-Inumbo-ID: 88eb262c-b24b-11e9-9ae5-0bc8fc311476
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88eb262c-b24b-11e9-9ae5-0bc8fc311476;
 Mon, 29 Jul 2019 21:55:10 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B027E20C01;
 Mon, 29 Jul 2019 21:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564437309;
 bh=Wfd28tY552p+UXdZ8FrXidmjN/ptL57FFTEJ24r84ME=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Hids+wMIKcagkudMDWJDgTNiCqgHhqZInRpT7P/E2ZSrmep0kJS77xc0+8mHcAuyA
 lGlQOMv1N5gRtI2Mrix0xJATqx6vwcrTGIZLe/+74zJUKH4dkNfhBiNcGelClR2mXw
 nMVBGbkap4Ho6J5/098narQBYUDS34ZCeBdbkREw=
Date: Mon, 29 Jul 2019 14:55:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <87muh1ht5f.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1907291454060.1237@sstabellini-ThinkPad-T480s>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-5-julien.grall@arm.com> <87muh1ht5f.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 4/7] xen/arm: traps: Avoid using BUG_ON() in
 _show_registers()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyNiBKdWwgMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gSnVsaWVuIEdy
YWxsIHdyaXRlczoKPiAKPiA+IEF0IHRoZSBtb21lbnQsIF9zaG93X3JlZ2lzdGVycygpIGlzIHVz
aW5nIGEgQlVHX09OKCkgdG8gYXNzZXJ0IG9ubHkKPiA+IHVzZXJzcGFjZSB3aWxsIHJ1biAzMi1i
aXQgY29kZSBpbiBhIDY0LWJpdCBkb21haW4uCj4gPgo+ID4gU3VjaCBleHRyYSBwcmVjYXV0aW9u
IGlzIG5vdCBuZWNlc3NhcnkgYW5kIGNvdWxkIGJlIGF2b2lkZWQgYnkgb25seQo+ID4gY2hlY2tp
bmcgdGhlIENQVSBtb2RlIHRvIGRlY2lkZSB3aGV0aGVyIHNob3dfcmVnaXN0ZXJzXzY0KCkgb3IK
PiA+IHNob3dfcmVpZ3N0ZXJzXzMyKCkgc2hvdWxkIGJlIGNhbGxlZC4KPiA+Cj4gPiBUaGlzIGhh
cyBhbHNvIHRoZSBuaWNlIGFkdmFudGFnZSB0byBhdm9pZCBuZXN0ZWQgaWYgaW4gdGhlIGNvZGUu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KPiBSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVw
YW0uY29tPgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KCgo+ID4gLS0tCj4gPiAgeGVuL2FyY2gvYXJtL3RyYXBzLmMgfCAxNiArKystLS0tLS0t
LS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25z
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gv
YXJtL3RyYXBzLmMKPiA+IGluZGV4IDU0ZTY2YTg2ZDAuLjEzMjY4NmVlMGYgMTAwNjQ0Cj4gPiAt
LS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+ID4gKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMK
PiA+IEBAIC05MTQsMjEgKzkxNCwxMSBAQCBzdGF0aWMgdm9pZCBfc2hvd19yZWdpc3RlcnMoY29u
c3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsCj4gPiAgCj4gPiAgICAgIGlmICggZ3Vlc3Rf
bW9kZSApCj4gPiAgICAgIHsKPiA+IC0gICAgICAgIGlmICggaXNfMzJiaXRfZG9tYWluKHYtPmRv
bWFpbikgKQo+ID4gKyAgICAgICAgaWYgKCBwc3JfbW9kZV9pc18zMmJpdChyZWdzKSApCj4gPiAg
ICAgICAgICAgICAgc2hvd19yZWdpc3RlcnNfMzIocmVncywgY3R4dCwgZ3Vlc3RfbW9kZSwgdik7
Cj4gPiAgI2lmZGVmIENPTkZJR19BUk1fNjQKPiA+IC0gICAgICAgIGVsc2UgaWYgKCBpc182NGJp
dF9kb21haW4odi0+ZG9tYWluKSApCj4gPiAtICAgICAgICB7Cj4gPiAtICAgICAgICAgICAgaWYg
KCBwc3JfbW9kZV9pc18zMmJpdChyZWdzKSApCj4gPiAtICAgICAgICAgICAgewo+ID4gLSAgICAg
ICAgICAgICAgICBCVUdfT04oIXVzcl9tb2RlKHJlZ3MpKTsKPiA+IC0gICAgICAgICAgICAgICAg
c2hvd19yZWdpc3RlcnNfMzIocmVncywgY3R4dCwgZ3Vlc3RfbW9kZSwgdik7Cj4gPiAtICAgICAg
ICAgICAgfQo+ID4gLSAgICAgICAgICAgIGVsc2UKPiA+IC0gICAgICAgICAgICB7Cj4gPiAtICAg
ICAgICAgICAgICAgIHNob3dfcmVnaXN0ZXJzXzY0KHJlZ3MsIGN0eHQsIGd1ZXN0X21vZGUsIHYp
Owo+ID4gLSAgICAgICAgICAgIH0KPiA+IC0gICAgICAgIH0KPiA+ICsgICAgICAgIGVsc2UKPiA+
ICsgICAgICAgICAgICBzaG93X3JlZ2lzdGVyc182NChyZWdzLCBjdHh0LCBndWVzdF9tb2RlLCB2
KTsKPiA+ICAjZW5kaWYKPiA+ICAgICAgfQo+ID4gICAgICBlbHNlCj4gCj4gCj4gLS0gCj4gVm9s
b2R5bXlyIEJhYmNodWsgYXQgRVBBTQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
