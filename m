Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407CD12FD04
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 20:27:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inSYe-0007K8-7I; Fri, 03 Jan 2020 19:24:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w8Vo=2Y=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1inSYd-0007K3-Ds
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 19:24:27 +0000
X-Inumbo-ID: a78789f6-2e5e-11ea-b6f1-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a78789f6-2e5e-11ea-b6f1-bc764e2007e4;
 Fri, 03 Jan 2020 19:24:26 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l18so24343056lfc.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 11:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wYga6Of97m0wwNjCtZW7rX+DfSFtNOCiHdLh/lpSl+4=;
 b=ff1K2UCten0hqRkC9NDrw0jutR5rTFnQp5BuRrrSiVUO2jvuDAaZe2O6yXCCN5YHCi
 MgUnatWmvanetQUtO0pPbtkDXzuIFklelwdAdNA3inJOVK66LQkuWZp7O4XGnWnvJOI4
 T4M91tbws2LMQR0GTf2K6bwXOn7J5U+nyFn0m54E3vK6+Hpc14nez6PcAVadWRjBgssb
 DuIMjlSXrIelSP6hD9stDFHKldaZ+uWM2lJ5Vuf5m2G0QQ22KWuVVsCDqrH17OBDtNVs
 snyMAnTiK+xYmS8e9XZrerMNhjm+WwRui4jZ1T51v6q2nDHK+SHsbfpKzAT8cNeXqMz3
 Od9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wYga6Of97m0wwNjCtZW7rX+DfSFtNOCiHdLh/lpSl+4=;
 b=JZkNUMVVNY7xMQuFewdDE77apJ4i79YiF7wko3BFkmUJ2eiNBaKI/ZzTJvjnY8xF1Q
 Le1hCg1vfCkg8TjwUWhRjExbGZYiieCoyWnZ8wiQUuDhduVyQSwvhV/vA4pZR5z8/LwQ
 2uH60pzkLcsK+lRG36jUVQCESb6tsFCz+Wxm48V9feTyuPld09WXz0HBmj5S2D/YtUnC
 y5HIDPRuqQ2yNEBHfeJO4AypsWCVyJX8EitrUlyn3z5x0ZMhM0pTKNoZ0lw24MpttnFN
 axuAzJnlEZQYJNNpOGzoWCkhaZkybE/JAAzqsMwhcZbXATyUBkqXTciTpAKUaPxFsG90
 Tiqg==
X-Gm-Message-State: APjAAAUbNX+TlAbGS6JMWtzHd38LclgWnZoE5cHUtIOz8COQcRDCCowO
 jCtsh9w2S0e18O1mBBNiNsaS7pD0KmUdH7d0FzM=
X-Google-Smtp-Source: APXvYqxUk3nBFzt0rUxdVr7AcVw4U1mPKCC1iK4u/O+VkhijZF6RDMRBEwSrdA7+f8S8i00BU1WbkCiqqx1aoCukpog=
X-Received: by 2002:ac2:555c:: with SMTP id l28mr49626027lfk.52.1578079465665; 
 Fri, 03 Jan 2020 11:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20191224130416.3570-1-pdurrant@amazon.com>
 <20191224130416.3570-6-pdurrant@amazon.com>
In-Reply-To: <20191224130416.3570-6-pdurrant@amazon.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 3 Jan 2020 14:24:13 -0500
Message-ID: <CAKf6xpti3DLLv7Fqf78HsK_vabX0gQis8-vAessvOxu2oJCveQ@mail.gmail.com>
To: Paul Durrant <pdurrant@amazon.com>
Subject: Re: [Xen-devel] [PATCH 5/6] libxl: allow creation of domains with
 specified or random domid
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMjQsIDIwMTkgYXQgODowNiBBTSBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFt
YXpvbi5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBtb2RpZmllcyBkb19kb21haW5fY3JlYXRl
KCkgdG8gdXNlIHRoZSB2YWx1ZSBvZiBkb21pZCB0aGF0IGlzCj4gcGFzc2VkIGluLiBBIG5ldyAn
c3BlY2lhbCB2YWx1ZScgLSBSQU5ET01fRE9NSUQgLSBpcyBhZGRlZCBpbnRvIHRoZSBBUEkKPiBh
bmQgdGhpcywgSU5WQUxJRF9ET01JRCBvciBhbnkgdmFsaWQgZG9taWQgaXMgcGFzc2VkIHVubW9k
aWZpZWQgdG8KPiBsaWJ4bF9fZG9tYWluX21ha2UoKS4gQW55IG90aGVyIGludmFsaWQgZG9taWQg
dmFsdWUgd2lsbCBjYXVzZSBhbiBlcnJvci4KPgo+IElmIFJBTkRPTV9ET01JRCBpcyBwYXNzZWQg
aW4gdGhlbiBsaWJ4bF9fZG9tYWluX21ha2UoKSB3aWxsIHVzZQo+IGxpYnhsX19yYW5kb21fYnl0
ZXMoKSB0byBjaG9vc2UgYSBkb21pZC4gSWYgdGhlIGNob3NlbiB2YWx1ZSBpcyBub3QgYQo+IHZh
bGlkIGRvbWlkIHRoZW4gdGhpcyBzdGVwIHdpbGwgYmUgcmVwZWF0ZWQuIE9uY2UgYSB2YWxpZCB2
YWx1ZSBpcyBjaG9zZW4KPiBpdCB3aWxsIGJlIHBhc3NlZCB0byB4Y19kb21haW5fY3JlYXRlKCkg
YnV0IGlmIHRoaXMgZmFpbHMgd2l0aCBhbiBlcnJubwo+IHZhbHVlIG9mIEVFWElTVCwgYSBuZXcg
cmFuZG9tIHZhbHVlIHdpbGwgYmUgY2hvc2VuIGFuZCB0aGUgb3BlcmF0aW9uIHdpbGwKPiBiZSBy
ZXRyaWVkLgo+Cj4gSWYgYSB2YWxpZCBkb21pZCBpcyBwYXNzZWQgaW4gYW5kIHhjX2RvbWFpbl9j
cmVhdGUoKSBmYWlscyB3aXRoIGVycm5vCj4gc2V0IHRvIEVFWElTVCB0aGVuIHRoaXMgd2lsbCBy
ZXN1bHQgaW4gYSBuZXcgZXJyb3IgdmFsdWUgb2YKPiBFUlJPUl9ERVZJQ0VfRVhJU1RTIGJlaW5n
IHJldHVybmVkIGZyb20gbGlieGxfX2RvbWFpbl9tYWtlKCkuIFRoaXMgaXMKPiBkb25lIHNvIHRo
YXQgZG9tY3JlYXRlX2NvbXBsZXRlKCkgY2FuIGJlIGFkanVzdGVkIHNvIGFzIG5vdCB0byB0ZWFy
IGRvd24KPiB0aGUgZXhpc3RpbmcgZG9tYWluIHRoYXQgdGhlIGF0dGVtcHRlZCBjcmVhdGlvbiBo
YXBwZW5lZCB0byBjb2xsaWRlIHdpdGguCj4KPiBOT1RFOiBsaWJ4bF9fbG9ndigpIGlzIGFsc28g
bW9kaWZpZWQgdG8gb25seSBsb2cgdmFsaWQgZG9taWQgdmFsdWVzIGluCj4gICAgICAgbWVzc2Fn
ZXMgcmF0aGVyIHRoYW4gYW55IGRvbWlkLCB2YWxpZCBvciBvdGhlcndpc2UsIHRoYXQgaXMgbm90
Cj4gICAgICAgSU5WQUxJRF9ET01JRC4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8
cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAtLS0KPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ2M6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IC0tLQoKPHNuaXA+Cgo+IC0tLSBh
L3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3Jl
YXRlLmMKCjxzbmlwPgoKPiBAQCAtNTcxLDYgKzU2OSw3IEBAIGludCBsaWJ4bF9fZG9tYWluX21h
a2UobGlieGxfX2djICpnYywgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcsCj4gICAgICAg
ICAgICAgIC5tYXhfZ3JhbnRfZnJhbWVzID0gYl9pbmZvLT5tYXhfZ3JhbnRfZnJhbWVzLAo+ICAg
ICAgICAgICAgICAubWF4X21hcHRyYWNrX2ZyYW1lcyA9IGJfaW5mby0+bWF4X21hcHRyYWNrX2Zy
YW1lcywKPiAgICAgICAgICB9Owo+ICsgICAgICAgIHVpbnQzMl90IGluX2RvbWlkID0gKmRvbWlk
Owo+Cj4gICAgICAgICAgaWYgKGluZm8tPnR5cGUgIT0gTElCWExfRE9NQUlOX1RZUEVfUFYpIHsK
PiAgICAgICAgICAgICAgY3JlYXRlLmZsYWdzIHw9IFhFTl9ET01DVExfQ0RGX2h2bTsKPiBAQCAt
NjAwLDEwICs1OTksMjQgQEAgaW50IGxpYnhsX19kb21haW5fbWFrZShsaWJ4bF9fZ2MgKmdjLCBs
aWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZpZywKPiAgICAgICAgICAgICAgZ290byBvdXQ7Cj4g
ICAgICAgICAgfQo+Cj4gLSAgICAgICAgcmV0ID0geGNfZG9tYWluX2NyZWF0ZShjdHgtPnhjaCwg
ZG9taWQsICZjcmVhdGUpOwo+ICsgICAgICAgIGZvciAoOzspIHsKPiArICAgICAgICAgICAgaWYg
KGluX2RvbWlkID09IFJBTkRPTV9ET01JRCkgewo+ICsgICAgICAgICAgICAgICAgcmV0ID0gbGli
eGxfX3JhbmRvbV9ieXRlcyhnYywgKHZvaWQgKilkb21pZCwgc2l6ZW9mKCpkb21pZCkpOwoKU2lu
Y2UgdmFsaWQgZG9taWRzIGFyZSB+MC0yXjE1LCB5b3UgbWF5IHdhbnQgdG8gdXNlZCBhIHRlbXBv
cmFyeQp1aW50MTZfdCBpbnN0ZWFkIG9mIHRoZSB1aW50MzJfdCBkb21pZCB0byB0aWdodGVuIHVw
IHRoZSByYW5nZS4KClJlZ2FyZHMsCkphc29uCgo+ICsgICAgICAgICAgICAgICAgaWYgKHJldCA8
IDApCj4gKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKwo+ICsgICAgICAgICAgICAgICAg
aWYgKCFsaWJ4bF9kb21pZF92YWxpZF9ndWVzdCgqZG9taWQpKQo+ICsgICAgICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOwo+ICsgICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICByZXQgPSB4
Y19kb21haW5fY3JlYXRlKGN0eC0+eGNoLCBkb21pZCwgJmNyZWF0ZSk7Cj4gKyAgICAgICAgICAg
IGlmIChyZXQgPT0gMCB8fCBlcnJubyAhPSBFRVhJU1QgfHwgaW5fZG9taWQgIT0gUkFORE9NX0RP
TUlEKQo+ICsgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgfQo+ICsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
