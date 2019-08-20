Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EFB953F3
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 04:00:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hztOh-00012D-V8; Tue, 20 Aug 2019 01:57:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DErr=WQ=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hztOh-000128-2V
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 01:57:19 +0000
X-Inumbo-ID: d6970492-c2ed-11e9-b90c-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6970492-c2ed-11e9-b90c-bc764e2007e4;
 Tue, 20 Aug 2019 01:57:17 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j15so4233758qtl.13
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2019 18:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9OBjK5ZMk9gSktEl250Ooudrz0Zo4JUD/gaLgoimL2g=;
 b=dTNGFku3gLSROATdI52lTmM6d1CYfkS9BDEMQ3IHexaEalhxeNc1jwRFNlZ30i3VXk
 3RRnkCXFRNXXn6yOB93lavDzwaUVydUuNUqJCPreHvzrtylAsvdR18LiuRapBdlxlm06
 /D5dq21rdcp1/rQTBJ3/3S2GvqcDtBuZA4Wm4OwwG6ZC5YjggCkUzphxyD5ddVWA6UDE
 UnQR5W1mbC1Bzc17Qymz4HiX1dqdrcnM4sNZStreK6uM6bi5xAumjWRjGUc3pSke3ye5
 WA89M59WLyFAF9n7oFEBhj5rAoOjtLNhPoFKNvBn95khPyrAt+gr3TQPd2B0K4bl2zI6
 nV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9OBjK5ZMk9gSktEl250Ooudrz0Zo4JUD/gaLgoimL2g=;
 b=pZ07CQv0ZANNcK9RwU0uSgWbGr083N7ze09+ez2GHJqiN9aW3w8ArSzbm+URSjiF2T
 mfuHvNY3u9oW24j6WMU3mnpmPFsNYUW1eaMhL6wP6lms3yUSOSzbGMxJYK+uDUd+5N5s
 zlWQNuAcXcCJumrsgJaQGidHuj+X8nELjZh34JpjIenX/ZgEcG1JtzXCiWK0eNN/MPA3
 SZngm+H5ztHq5au+97JjQNLHLyFYiPZdi2bqQnyD/KGEFCtX0R/l6WrRZ2HG9NRNogkD
 x5hSBfZWmpDsipLEvg1RrWoyARlV1tnlDX7oe9pN/ChPiGdsPJm+naXL2ZZ4VR1reDRq
 /NPA==
X-Gm-Message-State: APjAAAW/zxucsCTYlFOX4yrBqfXj9OdtCeXqRt98hnETKb+j6rajFtBE
 dRAnZfvdqAfyk972COlnffFwi/nbwIUQdKGvbwF8fg==
X-Google-Smtp-Source: APXvYqwetL3C1Us2I2SPlbzWpJXBocI1VJWkrVMKLj/lbO4gHGrCPuB4XqhCqtf/phzjHt4+oCSM+kCyOz9BZxETteI=
X-Received: by 2002:ac8:7cd:: with SMTP id m13mr24002261qth.341.1566266237040; 
 Mon, 19 Aug 2019 18:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190722153209.73107-1-roger.pau@citrix.com>
In-Reply-To: <20190722153209.73107-1-roger.pau@citrix.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 19 Aug 2019 18:57:06 -0700
Message-ID: <CAMmSBy8-RjAfKbd4zgNkdP30WB6B3knYySW9Q=i-V7177Ur3Ww@mail.gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/p2m: fix non-translated handling of
 iommu mappings
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgODozMyBBTSBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPgo+IFRoZSBjdXJyZW50IHVzYWdlIG9mIG5lZWRfaW9tbXVf
cHRfc3luYyBpbiBwMm0gZm9yIG5vbi10cmFuc2xhdGVkCj4gZ3Vlc3RzIGlzIHdyb25nIGJlY2F1
c2UgaXQgZG9lc24ndCBjb3JyZWN0bHkgaGFuZGxlIGEgcmVsYXhlZCBQVgo+IGhhcmR3YXJlIGRv
bWFpbiwgdGhhdCBoYXMgbmVlZF9zeW5jIHNldCB0byBmYWxzZSwgYnV0IHN0aWxsIG5lZWQKPiBl
bnRyaWVzIHRvIGJlIGFkZGVkIGZyb20gY2FsbHMgdG8ge3NldC9jbGVhcn1faWRlbnRpdHlfcDJt
X2VudHJ5Lgo+Cj4gQWRqdXN0IHRoZSBjb2RlIGluIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UgdG8g
YWxzbyBjaGVjayB3aGV0aGVyIHRoZQo+IGRvbWFpbiBoYXMgYW4gaW9tbXUgaW5zdGVhZCBvZiB3
aGV0aGVyIGl0IG5lZWRzIHN5bmNpbmcgb3Igbm90IGluCj4gb3JkZXIgdG8gdGFrZSBhIHJlZmVy
ZW5jZSB0byBhIHBhZ2UgdG8gYmUgbWFwcGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2M6IEdlb3JnZSBEdW5sYXAg
PGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pgo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IENjOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPgoKVGVzdGVkLWJ5OiBSb21hbiBTaGFwb3NobmlrIDxyb21hbkB6ZWRl
ZGEuY29tPgoKPiAtLS0KPiAgeGVuL2FyY2gveDg2L21tL3AybS5jIHwgNiArKystLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiBpbmRl
eCBmZWY5N2M4MmY2Li44OGEyNDMwYzhjIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+IEBAIC04MzYsNyArODM2LDcgQEAg
Z3Vlc3RfcGh5c21hcF9hZGRfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIG1mbl90
IG1mbiwKPiAgICAgICAgICAgKi8KPiAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8ICgxVUwgPDwg
cGFnZV9vcmRlcik7ICsraSwgKytwYWdlICkKPiAgICAgICAgICB7Cj4gLSAgICAgICAgICAgIGlm
ICggIW5lZWRfaW9tbXVfcHRfc3luYyhkKSApCj4gKyAgICAgICAgICAgIGlmICggIWhhc19pb21t
dV9wdChkKSApCj4gICAgICAgICAgICAgICAgICAvKiBub3RoaW5nICovOwo+ICAgICAgICAgICAg
ICBlbHNlIGlmICggZ2V0X3BhZ2VfYW5kX3R5cGUocGFnZSwgZCwgUEdUX3dyaXRhYmxlX3BhZ2Up
ICkKPiAgICAgICAgICAgICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKHBhZ2UpOwo+IEBAIC0xMzQx
LDcgKzEzNDEsNyBAQCBpbnQgc2V0X2lkZW50aXR5X3AybV9lbnRyeShzdHJ1Y3QgZG9tYWluICpk
LCB1bnNpZ25lZCBsb25nIGdmbl9sLAo+Cj4gICAgICBpZiAoICFwYWdpbmdfbW9kZV90cmFuc2xh
dGUocDJtLT5kb21haW4pICkKPiAgICAgIHsKPiAtICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0
X3N5bmMoZCkgKQo+ICsgICAgICAgIGlmICggIWhhc19pb21tdV9wdChkKSApCj4gICAgICAgICAg
ICAgIHJldHVybiAwOwo+ICAgICAgICAgIHJldHVybiBpb21tdV9sZWdhY3lfbWFwKGQsIF9kZm4o
Z2ZuX2wpLCBfbWZuKGdmbl9sKSwgUEFHRV9PUkRFUl80SywKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBJT01NVUZfcmVhZGFibGUgfCBJT01NVUZfd3JpdGFibGUpOwo+IEBAIC0x
NDMyLDcgKzE0MzIsNyBAQCBpbnQgY2xlYXJfaWRlbnRpdHlfcDJtX2VudHJ5KHN0cnVjdCBkb21h
aW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuX2wpCj4KPiAgICAgIGlmICggIXBhZ2luZ19tb2RlX3Ry
YW5zbGF0ZShkKSApCj4gICAgICB7Cj4gLSAgICAgICAgaWYgKCAhbmVlZF9pb21tdV9wdF9zeW5j
KGQpICkKPiArICAgICAgICBpZiAoICFoYXNfaW9tbXVfcHQoZCkgKQo+ICAgICAgICAgICAgICBy
ZXR1cm4gMDsKPiAgICAgICAgICByZXR1cm4gaW9tbXVfbGVnYWN5X3VubWFwKGQsIF9kZm4oZ2Zu
X2wpLCBQQUdFX09SREVSXzRLKTsKPiAgICAgIH0KPiAtLQo+IDIuMjAuMSAoQXBwbGUgR2l0LTEx
NykKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
