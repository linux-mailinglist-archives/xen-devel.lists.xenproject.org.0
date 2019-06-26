Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B599F56E31
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 17:59:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgAI5-0001Ca-4d; Wed, 26 Jun 2019 15:56:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L5OZ=UZ=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hgAI3-0001CV-24
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 15:56:55 +0000
X-Inumbo-ID: 045cc290-982b-11e9-8980-bc764e045a96
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 045cc290-982b-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 15:56:53 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id j6so4475836ioa.5
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2019 08:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mSE6pf/OcH3c6TO0YiiL4tUIZfOtulRZYdsMJcMQ5xw=;
 b=H6YZrHsCqI2aBsC9ZWde8NxkJR4TkqqhSaAOqEcHUi+8VrCYPZDg8RyvD4cU5tZnlZ
 niBoPp+ZSWpXSeedM0AYNDse2lpigrlNZOpvnlTLXbqpq3cxA3/kc6gobGDogAQJFnrX
 MifOlmzWFJlODtmRfk5gmsrKlAzo4byrVUGutK9FrAWeUm/HStqEQCJL3OYS4uUkX+LB
 8WDa8w1GI3/3xOEliK9XAllhE6fEnS/ftsLP7iJkH0QAPQ8T9+42tMyTel1IyJ3M/dSN
 rIyNMbKH/8FyS5TlkVUgpkb7rplnJcy4lroqShL89uL9MhorwhjkkOwhcJ5WsMKtFphu
 wcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mSE6pf/OcH3c6TO0YiiL4tUIZfOtulRZYdsMJcMQ5xw=;
 b=Fvfs08229kLSYB3pVJPhp9RjGLK2x1N/k5+ub/lSVrqoQ5RO8JInodwRyqaDIyRPpA
 dBLrsNKpxV8yZ3qrS0SgwghvaoFrDUq+cYgRViVcBPi2NDeeh7LX7pCYNzkqz/BITmdt
 FCUnQuG+Ilcd4QCWlJaQM9c3H8L1YUPREDamYQqs5ZFmGPWt1kodAQ0YWFX6DWvnyWc0
 0uql5lx+BHSVgrnqc/hYGn/lnocDwnoPJc+qZ+VvD0Mx1VYg3I+ueLMAHNAxmTegPV3f
 k7wvh8+oHmdOdFpYxnkTy0gcMetrtCk/DpzWZV3ye4r5LbarRzDmYa2SkZY5YGNrKzf/
 32Dw==
X-Gm-Message-State: APjAAAW09trU/SHGyNGwMCzryMX+xa1tTNmnLL3GG35cVS2kaC96ZaXD
 HKVqCh0fThsH2+tDbtbtVs8dxmnAXdbzF6693Zk=
X-Google-Smtp-Source: APXvYqytX3wWYKo2UpU/qzYpj1zOiPx0rb6SLNf/I/Xqxg1Z12jiJil8mY11QkU7kRwP2UaHdENRVuXlk+920KNcYrA=
X-Received: by 2002:a5e:da4b:: with SMTP id o11mr5562989iop.212.1561564613255; 
 Wed, 26 Jun 2019 08:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZZW-aoQUgMJFKJ9hj9bcFjojOST_i+ifmjZDvosGo8LCQ@mail.gmail.com>
 <5f0f6188-2205-2114-d353-e7eb09d9ba22@arm.com>
In-Reply-To: <5f0f6188-2205-2114-d353-e7eb09d9ba22@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Wed, 26 Jun 2019 18:56:42 +0300
Message-ID: <CAOcoXZanq7iGMLYSA4EWgaCfj3bRx1mefYkLM4NAr1V4zKaBhQ@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] xen/arm dts: Check "reg" property length in
 process_multiboot_node
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLAoKVGhhbmsgeW91IGZvciBpbmZvcm1hdGlvbiBwcm92aWRlZC4KUGVyIHRoZSBi
aW5kaW5nLCBkb21VMSBub2RlIHNob3VsZCBjb250YWluIHRoZSBwcm9wZXJ0aWVzCiNhZGRyZXNz
LWNlbGxzIGFuZCAjc2l6ZS1jZWxscy4KCkFkZGluZyB4ZW4tZGV2ZWwgdG8gQ0MuCgpUaGFua3MK
CgpPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCA2OjQyIFBNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDI2LzA2LzIwMTkgMTY6MjEsIFZpa3RvciBN
aXRpbiB3cm90ZToKPiA+IEhpIEFsbCwKPgo+IEhpLAo+Cj4gV291bGQgeW91IG1pbmQgdG8gYWRk
IHhlbi1kZXZlbCBvbiBDQz8gVGhpcyBkaXNjdXNzaW9uIGNvdWxkIGJlbmVmaXRzIGV2ZXJ5b25l
Lgo+Cj4gPiBXaGlsZSBzZXR0aW5nIHVwIGRvbTBsZXNzIGNvbmZpZ3VyYXRpb24gYXMgZGVzY3Jp
YmVkIGluCj4gPiBkb2NzL2ZlYXR1cmVzL2RvbTBsZXNzLnBhbmRvYwo+ID4gaXQgaGFzIGJlZW4g
Zm91bmQgb3V0IHRoYXQgWGVuIGRvZXNuJ3QgY2hlY2sgdGhlIGxlbmd0aCBvZiB0aGUgRFQgcmVn
IHByb3BlcnR5Lgo+Cj4gV2hhdCBkbyB5b3UgbWVhbj8gVGhlIHBhbmljIGJlbG93IGNsZWFybHkg
c2hvd3MgWGVuIGlzIGNoZWNraW5nIHRoZSBsZW5ndGggb2YKPiB0aGUgRFQgcmVnIHByb3BlcnR5
Lgo+Cj4gPiBUaGlzIHNlZW1zIGFuIG9sZCBpc3N1ZSBkZXNjcmliZWQgaW4gWzFdLiBIb3dldmVy
LCB0aGUgdGVzdHMgd2l0aAo+ID4gZG9tMGxlc3MgZG9tVTEgc2V0dXAgc2hvdyB0aGF0IHRoZSBp
c3N1ZSBpcyBzdGlsbCByZWxldmFudCBhdCBsZWFzdCBpbgo+ID4gY2FzZSBvZiB4ZW4gNC4xMjoK
PiA+Cj4gPiAgICAgIGRvbVUxIHsKPiA+ICAgICAgICAgIGNvbXBhdGlibGUgPSAieGVuLGRvbWFp
biI7Cj4gPiAgICAgICAgICBtZW1vcnkgPSA8MHgyMDAwMD47Cj4gPiAgICAgICAgICBjcHVzID0g
MTsKPiA+ICAgICAgICAgIHZwbDAxMTsKPiA+Cj4gPiAgICAgICAgICBtb2R1bGVAMjAwMDAwMCB7
Cj4gPiAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3Qsa2VybmVsIiwgIm11bHRp
Ym9vdCxtb2R1bGUiOwo+ID4gICAgICAgICAgICAgIHJlZyA9IDwweDIwMDAwMDAgMHhmZmZmZmY+
Owo+ID4gICAgICAgICAgICAgIGJvb3RhcmdzID0gImNvbnNvbGU9dHR5QU1BMCI7Cj4gPiAgICAg
ICAgICB9Owo+ID4KPiA+ICAgICAgICAgIG1vZHVsZUAzMDAwMDAwMCB7Cj4gPiAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3QscmFtZGlzayIsICJtdWx0aWJvb3QsbW9kdWxlIjsK
PiA+ICAgICAgICAgICAgICByZWcgPSA8MHgzMDAwMDAwIDB4ZmZmZmZmPjsKPiA+ICAgICAgICAg
IH07Cj4gPiAgICAgIH07Cj4gPgo+ID4gVGhlIHJlZyBwcm9wZXJ0eSBpbiB0aGlzIGV4YW1wbGUg
ZG9lc24ndCB3b3JrIC0gWGVuIHBhbmljcyB3aXRoIGl0Lgo+ID4gSXQgc2hvdWxkIGJlIGRlc2Ny
aWJlZCBhcwo+ID4gcmVnID0gPDB4MCAweDIwMDAwMDAgMHgwIDB4ZmZmZmZmPjsKPiA+IG9yIGFz
Cj4gPiAjYWRkcmVzcy1jZWxscyA8MT4KPiA+ICNzaXplLWNlbGxzIDwxPgo+ID4gcmVnID0gPDB4
MjAwMDAwMCAweGZmZmZmZj47Cj4gPgo+ID4gSW4gb3RoZXIgY2FzZSB4ZW4gcGFuaWNzIG9uIHRo
ZSBuZXh0IGNvZGU6Cj4gPiBJbiB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jOgo+ID4KPiA+ICAgICAg
IGlmICggbGVuIDwgZHRfY2VsbHNfdG9fc2l6ZShhZGRyZXNzX2NlbGxzICsgc2l6ZV9jZWxscykg
KQo+ID4gICAgICAgICAgIHBhbmljKCJmZHQ6IG5vZGUgYCVzJzogYHJlZ2AgcHJvcGVydHkgbGVu
Z3RoIGlzIHRvbyBzaG9ydFxuIiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICBuYW1lKTsKPiA+
Cj4gPiBCZWNhdXNlIGluIGNhc2Ugb2YgYXJtNjQgZG9tMGxlc3MgZXhhbXBsZSByZWcgbGVuIGNh
bGN1bGF0aW9uIGxvb2tzIG5leHQ6Cj4gPiBsZW4gPT0gOCwKPiA+IGR0X2NlbGxzX3RvX3NpemUo
YWRkcmVzc19jZWxscyArIHNpemVfY2VsbHMpID09IDE2Cj4gPiBhZGRyZXNzX2NlbGxzID09IDIK
PiA+IHNpemVfY2VsbHMgPT0gMgo+ID4KPiA+IEJvdGggc29sdXRpb25zIG1lbnRpb25lZCBhYm92
ZSBoYXMgYmVlbiB0ZXN0ZWQgYW5kIHdvcmtzIHdlbGwuCj4gPiBUaGUgdGhpbmcgaXMgdGhhdCBk
b20wbGVzcyBkb2N1bWVudGF0aW9uIGhhcyBhbmQgZXhhbXBsZSB3aGljaCBkb2Vzbid0Cj4gPiB3
b3JrIGluIGNhc2Ugb2YgYXJtNjQgYW5kIGl0IHNob3VsZCBiZSBpbXByb3ZlZCB3aXRoIHRoaXMg
aW5mb3JtYXRpb24KPiA+IG9yIGl0IG5lZWRzIHRvIGZpeCAicmVnIiBwcm9wZXJ0eSBsZW5ndGgg
Y2FsY3VsYXRpb24uCj4KPiBUaGUgZXhhbXBsZSBpbiBkb2NzL2ZlYXR1cmVzL2RvbTBsZXNzLnBh
bmRvYyBkb2VzIG5vdCBtYXRjaCB0aGUgYmluZGluZ3MKPiBkZXNjcmliZWQgaW4gZG9jcy9taXNj
L2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dC4KPgo+IFBlciB0aGUgYmluZGluZywgZG9tVTEg
bm9kZSBzaG91bGQgY29udGFpbiB0aGUgcHJvcGVydGllcyAjYWRkcmVzcy1jZWxscyBhbmQKPiAj
c2l6ZS1jZWxscy4KPgo+ID4KPiA+IFdoYXQgZG8geW91IHRoaW5rPwo+Cj4gVGhlIGNvZGUgd29y
a3MgYXMgZXhwZWN0ZWQsIGhvd2V2ZXIgdGhlIGRvY3VtZW50YXRpb24gbmVlZHMgdG8gYmUgdXBk
YXRlZC4KPgo+ID4KPiA+IDwxPiAgaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZl
cy9odG1sL3hlbi1kZXZlbC8yMDEzLTA5L21zZzAwNjQyLmh0bWwKPiA+Cj4gPiBUaGFua3MsCj4g
PiBWaWt0b3IgTWl0aW4KPiA+Cj4KPiAtLQo+IEp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
