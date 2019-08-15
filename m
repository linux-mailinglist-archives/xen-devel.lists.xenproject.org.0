Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566938E4C1
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 08:06:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hy8pv-00045h-BU; Thu, 15 Aug 2019 06:02:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ktw1=WL=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1hy8pt-00045b-BU
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 06:02:09 +0000
X-Inumbo-ID: 3417ad1c-bf22-11e9-96f7-bc764e2007e4
Received: from mail.crc.id.au (unknown [203.56.246.92])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3417ad1c-bf22-11e9-96f7-bc764e2007e4;
 Thu, 15 Aug 2019 06:02:05 +0000 (UTC)
Received: from lamp.crc.id.au (lamp.crc.id.au [IPv6:2407:e400:b000:200::8e8e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 556CC2000DD;
 Thu, 15 Aug 2019 16:02:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1565848923; bh=faoRIZ6fMTqEHzTtPHa4JWYzHDVzfdo+Wu+37nUnt+Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=K06jqbx8IHNugVFtuLsF1XfUz9Tz/SSZ92lOBFVX6Hca88zObSdqyXz+o7xYYdX52
 UU37WuaE98ogLeRvAFQyhPeJSVtOr3hJop+IfDvgLbGYL0+oqySLMnuwD3KK8ANC5i
 gibub4iclRo8m2gphiDJrYmUci8HEOj2HrOAZl6g=
MIME-Version: 1.0
Date: Thu, 15 Aug 2019 16:01:59 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
In-Reply-To: <alpine.LFD.2.21.1908150055060.2807@austen3.home>
References: <alpine.LFD.2.21.1908150030150.2807@austen3.home>
 <alpine.LFD.2.21.1908150055060.2807@austen3.home>
User-Agent: Roundcube Webmail/1.4-rc1
Message-ID: <18fb961102e8da16d1ad9576742bccf2@crc.id.au>
X-Sender: netwiz@crc.id.au
Subject: Re: [Xen-devel] [PATCH] read grubenv and set default from
 saved_entry or next_entry
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wOC0xNSAwOTo1NiwgWU9VTkcsIE1JQ0hBRUwgQS4gd3JvdGU6Cj4gT24gVGh1LCAx
NSBBdWcgMjAxOSwgTWljaGFlbCBZb3VuZyB3cm90ZToKPiAKPj4gVGhpcyBwYXRjaCBtYXkgaGVs
cCB5b3VyIGlzc3VlIHdpdGggdGhlIGRlZmF1bHQga2VybmVsIHNldHRpbmcgb24gCj4+IEZlZG9y
YSAzMAo+PiBhcyBpdCB1c2VzIHRoZSBzZXR0aW5nIG9mIHNhdmVkX2VudHJ5IG9yIG5leHRfZW50
cnkgZnJvbSB0aGUgZ3J1YmVudiAKPj4gZmlsZSB0bwo+PiBjaG9vc2UgdGhlIGRlZmF1bHQga2Vy
bmVsIHdoaWNoIHNob3VsZCBvdmVycmlkZSBhbnkgc2V0dGluZyBwaWNrZWQgdXAgCj4+IGZyb20g
aWYKPj4gY2xhdXNlcyBpbiB0aGUgZ3J1Yi5jZmcgZmlsZS4KPj4gCj4+IEkgaGF2ZSBvbmx5IGRv
bmUgbGltaXRlZCBhbmQgc29tZXdoYXQgaW1wZXJmZWN0IHRlc3Rpbmcgb24gaXQgYW5kIAo+PiBp
c24ndCBhCj4+IHByb3BlciBmaXggKHdoaWNoIHdvdWxkIHVzZSBncnViZW52IHNldHRpbmdzIGJh
c2VkIG9uIHdoYXQgaXMgaW4gdGhlIAo+PiBpZgo+PiBjbGF1c2VzKSBidXQgSSB0aGluayBpdCBz
aG91bGQgd29yayBpbiB5b3VyIGNhc2UuCj4gCj4gVGhlIHBhdGNoIGlzIGFjdHVhbGx5IGF0dGFj
aGVkIHRoaXMgdGltZS4KPiAKPiAgCU1pY2hhZWwgWW91bmcKCkhhdmluZyBhIGJpdCBvZiBhIGxv
b2sgaGVyZS4uLi4KCk15IHRlc3Qgc3lzdGVtIGdydWJlbnYgZmlsZSBoYXM6CiMgR1JVQiBFbnZp
cm9ubWVudCBCbG9jawpzYXZlZF9lbnRyeT0wCmtlcm5lbG9wdHM9cm9vdD1VVUlEPTUzNDZiNGQ5
LTg4NWYtNDY3My04YWZmLTA0YTE2YmYxOTcxYSBybyAKcm9vdGZsYWdzPXN1YnZvbD1yb290IHNl
bGludXg9MCByaGdiIHF1aWV0CmJvb3Rfc3VjY2Vzcz0xCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKCgpUaGUgZ3J1Yi1z
ZXQtZGVmYXVsdCBtYW4gcGFnZSBzdGF0ZXM6ClNZTk9QU0lTCiAgICAgICAgZ3J1Yi1zZXQtZGVm
YXVsdCBbLS1ib290LWRpcmVjdG9yeT1ESVJdIE1FTlVfRU5UUlkKCiAgICAgICAgTUVOVV9FTlRS
WQogICAgICAgICAgICAgICBBIG51bWJlciwgYSBtZW51IGl0ZW0gdGl0bGUgb3IgYSBtZW51IGl0
ZW0gaWRlbnRpZmllci4KCkRvIEkgaGF2ZSB0byB1c2UgYSBuYW1lIGZvciB0aGUgdGl0bGUgdG8g
bWF0Y2g/CgpJIG5vdGljZSBJIHN0aWxsIGhhdmUgdGhlIHNlY29uZCBvcHRpb24gc2VsZWN0ZWQg
d2l0aCBzYXZlZF9lbnRyeT0wCgotLSAKU3RldmVuIEhhaWdoCgo/IG5ldHdpekBjcmMuaWQuYXUg
ICAgID8gaHR0cDovL3d3dy5jcmMuaWQuYXUKPyArNjEgKDMpIDkwMDEgNjA5MCAgICA/IDA0MTIg
OTM1IDg5NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
