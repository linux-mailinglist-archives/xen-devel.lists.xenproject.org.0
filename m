Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F21E14F140
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 18:25:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixa0R-0003za-H2; Fri, 31 Jan 2020 17:22:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XEit=3U=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ixa0P-0003zV-Sh
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 17:22:57 +0000
X-Inumbo-ID: 52335330-444e-11ea-b211-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52335330-444e-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 17:22:57 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v17so7899433ljg.4
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2020 09:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DgXVt03RljUCkSa5qUCT0LmvVf7NhhMAdUFr8y2AQK4=;
 b=lSlgOs/cGw/pucCqBRQLZpXnZL5R93FYpJsiI0UdfJl2SNztFoSNfxLJQz4QRdxy5S
 Ic1ceb48YQ4IVrsikUGIIdMeE0Is+sf7i6li53ZV8pQ2/8IA17on/sc9bX1CGYpOUO6S
 2+Yp9xjYB62bdKCNVnDWMjjI89V+L3+kWZg8uLVIHUBI+W9xhw42zJKrPoSybU862V+M
 7rrWOqyrkfO2pgb97IBf7LW0RVBwI6GOzhZm/xhvl6cx30/aPB5JuTP1gqCnjKQaZ45n
 6rh8cecMZaZt1dUXEvGXMfcXck6Fwmkm607otV6R3WgbiuijBIfZ/Bsdn4f4qlfUZ6Hj
 BqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DgXVt03RljUCkSa5qUCT0LmvVf7NhhMAdUFr8y2AQK4=;
 b=qDYHfWp4FedJTkpIrTL89vf/Z8cGf8f4p3RM+w74IncKAwMEQT9h0tX4rCDRqbEwQ4
 Jl85INKVtrkwg7yDxCpbfiw6AJoBxy+3TclvTTT9cn819VvNP6scLe9cfrnce4+x43f8
 j9c6pN9hHMYnuNG78YpF17nB1mAJNK5F7fupP4et+cFUnTvg3N9pxJowhqrU7uVJZdXz
 qCqyR2MPe46IaCAWL5WWLXxi7O970h9ky/anRL2k8F+z5HW2EOL3uAr1GvPYLUjEBdLB
 TQBuipRWJPSYPh92bYA6lLhlv1DnfyRdga6+wmusQ/dFH3Z345yFmU/VrPeFjwFO0gP4
 7JJA==
X-Gm-Message-State: APjAAAXibVw/exZaMvYddJONIIJy6sNdUWLuHL0QqwX7G7lyDIuVQnAI
 0FxhaMh8TriqBAk0nyQnDohWr5UwuFZGpLIDSXg=
X-Google-Smtp-Source: APXvYqwqmVBgYURgko6sbMpPQJF8o0OygMd8tfhocelkdCGrIYk/3RGDsc9mipyn6oyJznHIvH8V8ZZLrRXiQ842X7Q=
X-Received: by 2002:a2e:9143:: with SMTP id q3mr6158944ljg.199.1580491376087; 
 Fri, 31 Jan 2020 09:22:56 -0800 (PST)
MIME-Version: 1.0
References: <20200131150149.2008-1-pdurrant@amazon.com>
 <20200131150149.2008-6-pdurrant@amazon.com>
In-Reply-To: <20200131150149.2008-6-pdurrant@amazon.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 31 Jan 2020 12:22:44 -0500
Message-ID: <CAKf6xpsEzxVnnOn8G2bz=JQm1vwvKYtgy3UBLyp8B1CS8rPnUA@mail.gmail.com>
To: Paul Durrant <pdurrant@amazon.com>
Subject: Re: [Xen-devel] [PATCH v5 5/7] libxl: allow creation of domains
 with a specified or random domid
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMTA6MDIgQU0gUGF1bCBEdXJyYW50IDxwZHVycmFudEBh
bWF6b24uY29tPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2ggYWRkcyBhICdkb21pZCcgZmllbGQgdG8g
bGlieGxfZG9tYWluX2NyZWF0ZV9pbmZvIGFuZCB0aGVuCj4gbW9kaWZpZXMgbGlieGxfX2RvbWFp
bl9tYWtlKCkgdG8gaGF2ZSBYZW4gdXNlIHRoYXQgdmFsdWUgaWYgaXQgaXMgdmFsaWQuCj4gSWYg
dGhlIGRvbWlkIHZhbHVlIGlzIGludmFsaWQgdGhlbiBYZW4gd2lsbCBjaG9vc2UgdGhlIGRvbWlk
LCBhcyBiZWZvcmUsCj4gdW5sZXNzIHRoZSB2YWx1ZSBpcyB0aGUgbmV3IHNwZWNpYWwgUkFORE9N
X0RPTUlEIHZhbHVlIGFkZGVkIHRvIHRoZSBBUEkuCj4gVGhpcyB2YWx1ZSBpbnN0cnVjdHMgbGli
eGxfX2RvbWFpbl9tYWtlKCkgdG8gY2hvb3NlIGEgcmFuZG9tIGRvbWlkIHZhbHVlCj4gZm9yIFhl
biB0byB1c2UuCj4KPiBJZiBYZW4gZGV0ZXJtaW5lcyB0aGF0IGEgZG9taWQgc3BlY2lmaWVkIHRv
IG9yIGNob3NlbiBieQo+IGxpYnhsX19kb21haW5fbWFrZSgpIGNvLWluY2lkZXMgd2l0aCBhbiBl
eGlzdGluZyBkb21haW4gdGhlbiB0aGUgY3JlYXRlCj4gb3BlcmF0aW9uIHdpbGwgZmFpbC4gSW4g
dGhpcyBjYXNlLCBpZiBSQU5ET01fRE9NSUQgd2FzIHNwZWNpZmllZCB0bwo+IGxpYnhsX19kb21h
aW5fbWFrZSgpIHRoZW4gYSBuZXcgcmFuZG9tIHZhbHVlIHdpbGwgYmUgY2hvc2VuIGFuZCB0aGUg
Y3JlYXRlCj4gb3BlcmF0aW9uIHdpbGwgYmUgcmUtdHJpZWQsIG90aGVyd2lzZSBsaWJ4bF9fZG9t
YWluX21ha2UoKSB3aWxsIGZhaWwuCj4KPiBBZnRlciBYZW4gaGFzIHN1Y2Nlc3NmdWxseSBjcmVh
dGVkIGEgbmV3IGRvbWFpbiwgbGlieGxfX2RvbWFpbl9tYWtlKCkgd2lsbAo+IGNoZWNrIHdoZXRo
ZXIgaXRzIGRvbWlkIG1hdGNoZXMgYW55IHJlY2VudGx5IHVzZWQgZG9taWQgdmFsdWVzLiBJZiBp
dCBkb2VzCj4gdGhlbiB0aGUgZG9tYWluIHdpbGwgYmUgZGVzdHJveWVkLiBJZiB0aGUgZG9taWQg
dXNlZCBpbiBjcmVhdGlvbiB3YXMKPiBzcGVjaWZpZWQgdG8gbGlieGxfX2RvbWFpbl9tYWtlKCkg
dGhlbiBpdCB3aWxsIGZhaWwgYXQgdGhpcyBwb2ludCwKPiBvdGhlcndpc2UgdGhlIGNyZWF0ZSBv
cGVyYXRpb24gd2lsbCBiZSByZS10cmllZCB3aXRoIGVpdGhlciBhIG5ldyByYW5kb20KPiBvciBY
ZW4tc2VsZWN0ZWQgZG9taWQgdmFsdWUuCj4KPiBOT1RFOiBsaWJ4bF9fbG9ndigpIGlzIGFsc28g
bW9kaWZpZWQgdG8gb25seSBsb2cgdmFsaWQgZG9taWQgdmFsdWVzIGluCj4gICAgICAgbWVzc2Fn
ZXMgcmF0aGVyIHRoYW4gYW55IGRvbWlkLCB2YWxpZCBvciBvdGhlcndpc2UsIHRoYXQgaXMgbm90
Cj4gICAgICAgSU5WQUxJRF9ET01JRC4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8
cGR1cnJhbnRAYW1hem9uLmNvbT4KCkxvb2tzIGdvb2QsIHdpdGggb25lIHN1Z2dlc3Rpb24gYmVs
b3cuCgpSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPgoKPHNu
aXA+Cgo+ICsKPiArICAgICAgICAgICAgLyogVHJ5IHRvIGRlc3Ryb3kgdGhlIGRvbWFpbiBhZ2Fp
biBhcyB3ZSBjYW4ndCB1c2UgaXQgKi8KPiArICAgICAgICAgICAgcmV0ID0geGNfZG9tYWluX2Rl
c3Ryb3koY3R4LT54Y2gsICpkb21pZCk7Cj4gKyAgICAgICAgICAgIGlmIChyZXQgPCAwKSB7Cj4g
KyAgICAgICAgICAgICAgICBMT0dFRChFUlJPUiwgKmRvbWlkLCAiZG9tYWluIGRlc3Ryb3kgZmFp
bCIpOwoKTWF5YmUgImRlc3Ryb3kgcmVjZW50bHkgdXNlZCBkb21haW4gaWQgZmFpbGVkIj8KCj4g
KyAgICAgICAgICAgICAgICAqZG9taWQgPSBJTlZBTElEX0RPTUlEOwo+ICsgICAgICAgICAgICAg
ICAgcmMgPSBFUlJPUl9GQUlMOwo+ICsgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gKyAgICAg
ICAgICAgIH0KPiAgICAgICAgICB9Cj4KPiAgICAgICAgICByYyA9IGxpYnhsX19hcmNoX2RvbWFp
bl9zYXZlX2NvbmZpZyhnYywgZF9jb25maWcsIHN0YXRlLCAmY3JlYXRlKTsKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
