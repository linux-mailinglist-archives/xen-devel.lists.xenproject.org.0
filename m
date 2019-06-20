Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1854DDED
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 01:58:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1he6v3-0003M5-SL; Thu, 20 Jun 2019 23:56:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1EL/=UT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1he6v1-0003LL-WA
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 23:56:40 +0000
X-Inumbo-ID: 0b72d972-93b7-11e9-a910-8f1d06a40848
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b72d972-93b7-11e9-a910-8f1d06a40848;
 Thu, 20 Jun 2019 23:56:39 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCEC82084A;
 Thu, 20 Jun 2019 23:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561074999;
 bh=cKmGGLVFLAKvkJmYlAfMsGWmHfEoilFz3AjEmt4MGD4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=QOkXPKLOfosq4s56gYE9kMkuvi9llNqRj9hM+g4lRtzUiN0r8YsrZUiErgOsmDXXQ
 qElbscBT8F26hszdZ48HRcI82H5I/5EkN9fqkIdignIEwMLQujHz+RW3DVaPKPXlEY
 6WqhI3dZD4kTou6zFZ8UQU9rM0sMfdLMbfj3be0I=
Date: Thu, 20 Jun 2019 16:56:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190620174706.16657-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906201655580.2677@sstabellini-ThinkPad-T480s>
References: <20190620174706.16657-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PRE-4.12 PATCH] xen/arm: time: cycles_t should be
 an uint64_t and not unsigned long
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 ian.jackson@eu.citrix.com, jbeulich@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFNpbmNlIGNvbW1pdCBj
YTczYWM4ZTdkICJ4ZW4vYXJtOiBBZGQgYW4gaXNiKCkgYmVmb3JlIHJlYWRpbmcgQ05UUENUX0VM
MAo+IHRvIHByZXZlbnQgcmUtb3JkZXJpbmciLCBnZXRfY3ljbGVzKCkgaXMgbm93IHJldHVybmlu
ZyB0aGUgbnVtYmVyIG9mCj4gY3ljbGVzIGFuZCB1c2VkIGluIG1vcmUgY2FsbGVycy4KPiAKPiBX
aGlsZSB0aGUgY291bnRlciByZWdpc3RlcnMgaXMgYWx3YXlzIDY0LWJpdCwgZ2V0X2N5Y2xlcygp
IHdpbGwgb25seQo+IHJldXRybiBhIDMyLWJpdCBvbiBBcm0zMiBhbmQgdGhlcmVmb3JlIHRydW5j
YXRlIHRoZSB2YWx1ZS4gVGhpcyB3aWxsCj4gcmVzdWx0IHRvIHdlaXJkIGJlaGF2aW9yIGJ5IGJv
dGggWGVuIGFuZCB0aGUgR3Vlc3QgYXMgdGhlIHRpbWVyIHdpbGwgbm90Cj4gYmUgc2V0dXAgY29y
cmVjdGx5Lgo+IAo+IFRoaXMgY291bGQgYmUgcmVzb2x2ZWQgYnkgc3dpdGNoIGN5Y2xlc190IGZy
b20gdW5zaWduZWQgbG9uZyB0bwo+IHVuc2lnbmVkIGludC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCkknbGwgY29tbWl0IGFkZGluZyBh
IHJlZmVyZW5jZSB0bwpkYTNkNTVhZTY3MjI1Nzk4YzJhZDhmNDJhZjJmNDMyZjZmMmIyMjE0IGlu
IHRoZSBjb21taXQgbWVzc2FnZS4KCgo+IC0tLQo+ICAgICBUaGlzIGlzIG9ubHkgdGFyZ2V0aW5n
IHhlbiA0LjExIGFuZCBlYXJsaWVyLiBYZW4gNC4xMiBhbmQgbGF0ZXIgaGF2ZQo+ICAgICBhIGNv
cnJlY3QgZGVmaW5pdGlvbiBvZiBjeWNsZXNfdCB0aGFua3MgdG8gZGEzZDU1YWU2NyAiY29uc29s
ZToKPiAgICAgYXZvaWQgcHJpbnRpbmcgbm8gb3IgbnVsbCB0aW1lIHN0YW1wcyIuCj4gCj4gICAg
IFRoaXMgd2lsbCBob3BlZnVsbHkgdW5ibG9jayBvc3N0ZXN0IG9uIHN0YWdpbmctNC4xMCBhbmQK
PiAgICAgc3RhZ2luZy00LjExLiBUaGlzIHBhdGNoIHNob3VsZCBiZSBiYWNrcG9ydGVkIHVwIHRv
IFhlbiA0LjguCj4gLS0tCj4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vdGltZS5oIHwgMiArLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS90aW1lLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3Rp
bWUuaAo+IGluZGV4IGNhMzA0MDY2NjkuLmJkN2RjODZkNzggMTAwNjQ0Cj4gLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLWFybS90aW1lLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3RpbWUuaAo+
IEBAIC03LDcgKzcsNyBAQAo+ICAgICAgRFRfTUFUQ0hfQ09NUEFUSUJMRSgiYXJtLGFybXY3LXRp
bWVyIiksIFwKPiAgICAgIERUX01BVENIX0NPTVBBVElCTEUoImFybSxhcm12OC10aW1lciIpCj4g
IAo+IC10eXBlZGVmIHVuc2lnbmVkIGxvbmcgY3ljbGVzX3Q7Cj4gK3R5cGVkZWYgdWludDY0X3Qg
Y3ljbGVzX3Q7Cj4gIAo+ICBzdGF0aWMgaW5saW5lIGN5Y2xlc190IGdldF9jeWNsZXMgKHZvaWQp
Cj4gIHsKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
