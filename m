Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4465D79C2C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 00:06:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsDiz-0008MP-Mv; Mon, 29 Jul 2019 22:02:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsDiy-0008MK-Ps
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 22:02:32 +0000
X-Inumbo-ID: 902456c4-b24c-11e9-8a76-bf2fe53e1243
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 902456c4-b24c-11e9-8a76-bf2fe53e1243;
 Mon, 29 Jul 2019 22:02:32 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44A36216C8;
 Mon, 29 Jul 2019 22:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564437751;
 bh=9J6wfFGlm0lPcg+aSWeFfrJdgzJBaYxeVR4yFCDCX9Q=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=TAQENHN4VKeodJLB95Je+h3Zb+TjFNeVDasbIIg4sVkKDboNdI5d6TY0KJgNqo5zr
 8QVqv9sMPOvR7Xt/ArVLjViFMfZPHmbUiDx+LWXIoUPIATbse6dZfB+3673sHzzfdE
 2LU054CqQt8XIJh8Dah40vZDPzNkyjojYsuaxNDE=
Date: Mon, 29 Jul 2019 15:02:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190723213553.22300-6-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907291500210.1237@sstabellini-ThinkPad-T480s>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-6-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 5/7] xen/arm: traps: Avoid BUG_ON() in
 do_trap_brk()
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

T24gVHVlLCAyMyBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IGRvX3RyYXBfYnJrKCkgaXMgdXNpbmcgYSBCVUdfT04oKSB0byBjaGVjayB0aGUgaGFyZHdhcmUK
PiBoYXMgYmVlbiBjb3JyZWN0bHkgY29uZmlndXJlZCBkdXJpbmcgYm9vdC4KPiAKPiBBbnkgZXJy
b3Igd2hlbiBjb25maWd1cmluZyB0aGUgaGFyZHdhcmUgY291bGQgcmVzdWx0IHRvIGEgZ3Vlc3Qg
J2JyaycKPiB0cmFwcGluZyBpbiB0aGUgaHlwZXJ2aXNvciBhbmQgY3Jhc2ggaXQuCj4gCj4gVGhp
cyBpcyBwcmV0dHkgaGFyc2ggdG8ga2lsbCBYZW4gd2hlbiBhY3R1YWxseSBraWxsaW5nIHRoZSBn
dWVzdCB3b3VsZAo+IGJlIGVub3VnaCBhcyBtaXNjb25maWd1cmluZyB0aGlzIHRyYXAgd291bGQg
bm90IGxlYWQgdG8gZXhwb3NpbmcKPiBzZW5zaXRpdmUgZGF0YS4gUmVwbGFjZSB0aGUgQlVHX09O
KCkgd2l0aCBjcmFzaGluZyB0aGUgZ3Vlc3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gvYXJtL3RyYXBzLmMg
fCAxMSArKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdHJhcHMuYyBiL3hlbi9h
cmNoL2FybS90cmFwcy5jCj4gaW5kZXggMTMyNjg2ZWUwZi4uZWYzN2NhNmJkZSAxMDA2NDQKPiAt
LS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS90cmFwcy5jCj4g
QEAgLTEzMDQsMTAgKzEzMDQsMTUgQEAgaW50IGRvX2J1Z19mcmFtZShjb25zdCBzdHJ1Y3QgY3B1
X3VzZXJfcmVncyAqcmVncywgdmFkZHJfdCBwYykKPiAgI2lmZGVmIENPTkZJR19BUk1fNjQKPiAg
c3RhdGljIHZvaWQgZG9fdHJhcF9icmsoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIGNvbnN0
IHVuaW9uIGhzciBoc3IpCj4gIHsKPiAtICAgIC8qIEhDUl9FTDIuVEdFIGFuZCBNRENSX0VMMi5U
REUgYXJlIG5vdCBzZXQgc28gd2UgbmV2ZXIgcmVjZWl2ZQo+IC0gICAgICogc29mdHdhcmUgYnJl
YWtwb2ludCBleGNlcHRpb24gZm9yIEVMMSBhbmQgRUwwIGhlcmUuCj4gKyAgICAvKgo+ICsgICAg
ICogSENSX0VMMi5UR0UgYW5kIE1EQ1JfRUwyLlREUiBhcmUgY3VycmVudGx5IG5vdCBzZXQuIFNv
IHdlIHNob3VsZAo+ICsgICAgICogbmV2ZXIgcmVjZWl2ZSBzb2Z0d2FyZSBicmVha3BvaW5nIGV4
Y2VwdGlvbiBmb3IgRUwxIGFuZCBFTDAgaGVyZS4KPiAgICAgICAqLwo+IC0gICAgQlVHX09OKCFo
eXBfbW9kZShyZWdzKSk7Cj4gKyAgICBpZiAoICFoeXBfbW9kZShyZWdzKSApCj4gKyAgICB7Cj4g
KyAgICAgICAgZG9tYWluX2NyYXNoKGN1cnJlbnQtPmRvbWFpbik7Cj4gKyAgICAgICAgcmV0dXJu
Owo+ICsgICAgfQoKVGhpcyBpcyBhIGdvb2QgY2hhbmdlIHRvIGhhdmUuIEkgYW0gd29uZGVyaW5n
IGlmIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8KYWxzbyBwcmludGsgc29tZSBkZWJ1ZyBtZXNzYWdl
cywgbWF5YmUgZXZlbiBzaG93X2V4ZWN1dGlvbl9zdGF0ZS4gSWYgc28sCndlIG5lZWQgdG8gYmUg
Y2FyZWZ1bCB0aGF0IGl0J3Mgb25seSBkb25lIGluIGRlYnVnIGJ1aWxkcywgb3IgaXQgaXMgcmF0
ZQpsaW1pdGVkLiBXaGF0IGRvIHlvdSB0aGluaz8gSW4gYW55IGNhc2UsIGl0IGlzIG5vdCBuZWNl
c3NhcnkgZm9yIHRoaXMKcGF0Y2ggdG8gYmUgYWNjZXB0ZWQgc286CgpSZXZpZXdlZC1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
