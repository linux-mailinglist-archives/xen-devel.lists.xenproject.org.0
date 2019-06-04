Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A168352FD
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 01:14:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYIaf-0008GI-CU; Tue, 04 Jun 2019 23:11:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cmcs=UD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hYIad-0008G1-4J
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 23:11:35 +0000
X-Inumbo-ID: 18361bd1-871e-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 18361bd1-871e-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 23:11:34 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C4C92067C;
 Tue,  4 Jun 2019 23:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559689893;
 bh=QLugZElNHDO0np04jNpyp/TUDhrUj63KZOit8g9ToBc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=V/yTdDOlB2e2A5TPfycWSPx9qnSOfzheF5vB/ffNeke1rPmNu7r/V7OoSDpklYF1e
 QxId94ajKscdBQ01Cw4HJNCXn1Bg4R+W6qpQGKftp99t7A7f7c6d0nz2TMyMGCzT4n
 4CXqz6WB5z4x+TyAD4Pp9MIU52kFR0UeEeDzoXSw=
Date: Tue, 4 Jun 2019 16:11:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514122456.28559-15-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906041113220.14041@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-15-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 14/19] xen/arm32: mm:
 Avoid cleaning the cache for secondary CPUs page-tables
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
 Andrii Anisov <andrii_anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBwYWdlLXRhYmxl
IHdhbGtlciBpcyBjb25maWd1cmVkIHRvIHVzZSB0aGUgc2FtZSBzaGFyZWFiaWxpdHkgYW5kCj4g
Y2FjaGVhYmlsaXR5IGFzIHRoZSBhY2Nlc3MgcGVyZm9ybWVkIHdoZW4gdXBkYXRpbmcgdGhlIHBh
Z2UtdGFibGVzLiBUaGlzCj4gbWVhbnMgY2xlYW5pbmcgdGhlIGNhY2hlIGZvciBzZWNvbmRhcnkg
Q1BVcyBydW50aW1lIHBhZ2UtdGFibGVzIGlzCj4gdW5uZWNlc3NhcnkuCgpBbGwgcmlnaHQuIElz
IHRoZXJlIGFuIGV4cGxpY2l0IGNvbmZpZ3VyYXRpb24gZm9yIHRoZSBzaGFyZWFiaWxpdHkgYW5k
CmNhY2hlYWJpbGl0eSB1c2VkIGJ5IHRoZSBwYWdlLXRhYmxlIHdhbGtlciBvciBpcyBpdCBzcGVj
aWZpZWQgYXMgc3VjaCBpbgp0aGUgQXJtIEFybT8gQWxzbywgaXNuJ3QgaXQgcG9zc2libGUgdGhh
dCBDUFVzIG9uIGEgZGlmZmVyZW50IGNsdXN0ZXIKKGJpZy5MSVRUTEUpIHdvdWxkIGhhdmUgaXNz
dWVzIHdpdGggdGhpcyBpZiB0aGUgY2FjaGUgY291bGQgYmUgc3BsaXQKYmV0d2VlbiB0aGUgdHdv
IGNsdXN0ZXJzPwoKCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFt
LmNvbT4KPiAKPiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgIC0gQWRkIEFuZHJp
aSdzIHJldmlld2VkLWJ5Cj4gLS0tCj4gIHhlbi9hcmNoL2FybS9tbS5jIHwgMyAtLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKPiBpbmRleCBjZGEyODQ3ZDAwLi42ZGI3ZGRhMGRh
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCj4gKysrIGIveGVuL2FyY2gvYXJtL21t
LmMKPiBAQCAtNzY5LDkgKzc2OSw2IEBAIGludCBpbml0X3NlY29uZGFyeV9wYWdldGFibGVzKGlu
dCBjcHUpCj4gICAgICAgICAgd3JpdGVfcHRlKCZmaXJzdFtmaXJzdF90YWJsZV9vZmZzZXQoRE9N
SEVBUF9WSVJUX1NUQVJUK2kqRklSU1RfU0laRSldLCBwdGUpOwo+ICAgICAgfQo+ICAKPiAtICAg
IGNsZWFuX2RjYWNoZV92YV9yYW5nZShmaXJzdCwgUEFHRV9TSVpFKTsKPiAtICAgIGNsZWFuX2Rj
YWNoZV92YV9yYW5nZShkb21oZWFwLCBET01IRUFQX1NFQ09ORF9QQUdFUypQQUdFX1NJWkUpOwo+
IC0KPiAgICAgIHBlcl9jcHUoeGVuX3BndGFibGUsIGNwdSkgPSBmaXJzdDsKPiAgICAgIHBlcl9j
cHUoeGVuX2RvbW1hcCwgY3B1KSA9IGRvbWhlYXA7Cj4gIAo+IC0tIAo+IDIuMTEuMAo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
