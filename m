Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F319283CFC
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 23:52:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv7KL-0000js-NT; Tue, 06 Aug 2019 21:49:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x5Cp=WC=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hv7KK-0000jn-9r
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 21:49:04 +0000
X-Inumbo-ID: 018e26bb-b894-11e9-8980-bc764e045a96
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 018e26bb-b894-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 21:49:03 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h18so86259468qtm.9
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 14:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rALUZ4k0MTo5USfPzefUzQI/bfi7ejJtxv/iV32s0Ek=;
 b=eCDP81jZkPQWEVXuT+pic+3JEnUVu6y34aMrwkWEPxNYCubKPaa8XdOw2UDvw16ltG
 UGVRgoextvyDefv5ulMFNjtOPYnIneohkrxQA7YJqWMDndnT+jpsIJ+VSfQJnKz86N5o
 8kXfUuNoyu75T96YQBeYpqYcUuzFeODOSFOrInttQwx1IO2XCjxNjoe2qYSsTbwwDVRj
 qTixwY2gFC4g9Jl/mgDhg60jUOr+71mVGfSR515qcXDUTe/L1yapQdqUQLE+bWaxSYt3
 9Hk0+uV8rGE/bve322CEVaQP2/+dno2Iepwtc/ix9xXdPOAZTSaPs4KDtAdz5X7NoLvU
 Na5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rALUZ4k0MTo5USfPzefUzQI/bfi7ejJtxv/iV32s0Ek=;
 b=aDK7QHnij9nO0x3EPGPeO7+rc1Ui5J5zGXXOGNZjTbOgaYXEP7fWncySSpeWbZBwtX
 1TNNAswSU29xzk/kUi4bujN8jxFXCPTuYf5IwinOYP7H+AgwsA4UsDpZiW5NV3utOWNf
 N1DDi5gNklVqphXJdpjKqNGl38ays6XVXWAIoOh1F2f14Zri9PjPcsYU8Z6IJiqdsd6+
 TUEtn0/zpmdo64RbbhJ9BJygg4GqfSfG6UTxcUCbNVO8IPXeYfCpQQbaz+leRFM4qpzP
 uw0ZfIqxUR2fPlmtcPOwdzO3vPGpVh52SM5igu89ng1l0NBRvfJE7uHXFFYRcjkH/fEh
 Uw+A==
X-Gm-Message-State: APjAAAUMOkukF4VxCQHaqnSritm0lB3X6FK/X6NjU/7ApPAQNJND/UpK
 qJBOshxHUeeFGBqDK8vQeLFffWrTwZ1UOPZthvcdkw==
X-Google-Smtp-Source: APXvYqwuNI7OyM+jF7FNvRXM8AjHpMe5z9F+932chSnLEs7C/bPwwcnRpiRCC93tJQhaXfxAgWE+h6s/1OlYMDgQqMc=
X-Received: by 2002:ac8:7cd:: with SMTP id m13mr5126445qth.341.1565128142856; 
 Tue, 06 Aug 2019 14:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190730092122.dbpfzu7jsznpyksd@Air-de-Roger>
 <CAMmSBy8U3druT0V_9ADojAyQxn7KTWARMsZ08DZ_5EWU43qDAg@mail.gmail.com>
 <20190731083631.63vqxrdr5vyeeswn@Air-de-Roger>
 <20190731084336.lkpk4n35qg2zo67w@Air-de-Roger>
 <CAMmSBy89cvwnRRPhorpUucLdc5LEak__Mtyw8ka5XvqP7W+q6A@mail.gmail.com>
 <d6ba30f8-7959-57bc-3843-e11f48b52766@citrix.com>
 <CAMmSBy9ZiEU95yAK1ry_41GR0ttWTX9EEJ0bMStZaK=PrzCH7w@mail.gmail.com>
 <20190801081559.wruxck32h5bum2va@Air-de-Roger>
 <CAMmSBy9y6hHQfDgcDFmKiRw9QiRSgcxHAq6Qo=o7apTR2EuusA@mail.gmail.com>
 <20190802080540.r4e3rrv3eit5yebt@Air-de-Roger>
 <20190806160644.adqzknxdfuwz4qaz@Air-de-Roger>
In-Reply-To: <20190806160644.adqzknxdfuwz4qaz@Air-de-Roger>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 6 Aug 2019 14:48:51 -0700
Message-ID: <CAMmSBy91XfNz5DfbaL8OC7v1eYp7n_EKjGgSgAH+YBALh9HM-g@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCA5OjE4IEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgQXVnIDAyLCAyMDE5IGF0IDEwOjA1OjQw
QU0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAwMSwgMjAx
OSBhdCAxMToyNTowNEFNIC0wNzAwLCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+ID4gPiBUaGlz
IHBhdGNoIGNvbXBsZXRlbHkgZml4ZXMgdGhlIHByb2JsZW0gZm9yIG1lIQo+ID4gPgo+ID4gPiBU
aGFua3MgUm9nZXIhIEknZCBsb3ZlIHRvIHNlZSB0aGlzIGluIFhlbiA0LjEzCj4gPgo+ID4gVGhh
bmtzIGZvciB0ZXN0aW5nIQo+ID4KPiA+IEl0J3Mgc3RpbGwgbm90IGNsZWFyIHRvIG1lIHdoeSB0
aGUgcHJldmlvdXMgYXBwcm9hY2ggZGlkbid0IHdvcmssIGJ1dAo+ID4gSSB0aGluayB0aGlzIHBh
dGNoIGlzIGJldHRlciBiZWNhdXNlIGl0IHJlbW92ZXMgdGhlIHVzYWdlIG9mCj4gPiB7c2V0L2Ns
ZWFyfV9pZGVudGl0eV9wMm1fZW50cnkgZnJvbSBQViBkb21haW5zLiBJIHdpbGwgc3VibWl0IHRo
aXMKPiA+IGZvcm1hbGx5IG5vdy4KPgo+IFNvcnJ5IHRvIGJvdGhlciBhZ2FpbiwgYnV0IHNpbmNl
IHdlIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoZQo+IHByZXZpb3VzIGZpeCBkaWRuJ3Qg
d29yayBmb3IgeW91LCBhbmQgSSBjYW4ndCByZXByb2R1Y2UgdGhpcyB3aXRoIG15Cj4gaGFyZHdh
cmUsIGNvdWxkIHlvdSBnaXZlIHRoZSBhdHRhY2hlZCBwYXRjaCBhIHRyeT8KCk5vIHdvcnJpZXMg
LS0gYW5kIHRoYW5rcyBmb3IgaGVscGluZyB0byBnZXQgaXQgb3ZlciB0aGUgZmluaXNoIGxpbmUg
LS0KdGhpcyBpcyBtdWNoIGFwcHJlY2lhdGVkIQoKSSdtIGhhcHB5IHRvIHNheSB0aGF0IHRoaXMg
bGF0ZXN0IHBhdGNoIGlzIGFsc28gd29ya2luZyBqdXN0IGZpbmUuIFNvCkkgZ3Vlc3MgdGhpcyBp
cyB0aGUgb25lIHRoYXQncyBnb2luZyB0byBsYW5kIGluIFhlbiA0LjEzPwoKVGhhbmtzLApSb21h
bi4KCj4gQUZBSUNUIHRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgbm9uLXdvcmtpbmcg
dmVyc2lvbiBhbmQgdGhlCj4gd29ya2luZyB2ZXJzaW9uIGlzIHRoZSBmbHVzaCwgc28gSSd2ZSBh
ZGRlZCBpdCBoZXJlLgo+Cj4gVGhhbmtzLCBSb2dlci4KPiAtLS04PC0tLQo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiBpbmRleCBm
ZWY5N2M4MmY2Li4zNjA1NjE0YWFmIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0u
Ywo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+IEBAIC0xMzQxLDcgKzEzNDEsNyBAQCBp
bnQgc2V0X2lkZW50aXR5X3AybV9lbnRyeShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25n
IGdmbl9sLAo+Cj4gICAgICBpZiAoICFwYWdpbmdfbW9kZV90cmFuc2xhdGUocDJtLT5kb21haW4p
ICkKPiAgICAgIHsKPiAtICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5bmMoZCkgKQo+ICsg
ICAgICAgIGlmICggIWhhc19pb21tdV9wdChkKSApCj4gICAgICAgICAgICAgIHJldHVybiAwOwo+
ICAgICAgICAgIHJldHVybiBpb21tdV9sZWdhY3lfbWFwKGQsIF9kZm4oZ2ZuX2wpLCBfbWZuKGdm
bl9sKSwgUEFHRV9PUkRFUl80SywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJ
T01NVUZfcmVhZGFibGUgfCBJT01NVUZfd3JpdGFibGUpOwo+IEBAIC0xNDMyLDcgKzE0MzIsNyBA
QCBpbnQgY2xlYXJfaWRlbnRpdHlfcDJtX2VudHJ5KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVk
IGxvbmcgZ2ZuX2wpCj4KPiAgICAgIGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSApCj4g
ICAgICB7Cj4gLSAgICAgICAgaWYgKCAhbmVlZF9pb21tdV9wdF9zeW5jKGQpICkKPiArICAgICAg
ICBpZiAoICFoYXNfaW9tbXVfcHQoZCkgKQo+ICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAg
ICAgICByZXR1cm4gaW9tbXVfbGVnYWN5X3VubWFwKGQsIF9kZm4oZ2ZuX2wpLCBQQUdFX09SREVS
XzRLKTsKPiAgICAgIH0KPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRk
L2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+IGluZGV4IDVk
NzIyNzBjNWIuLjlmZDVjOTdiZTIgMTAwNjQ0Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL2lvbW11LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUu
Ywo+IEBAIC0yMDI2LDcgKzIwMjYsNyBAQCBzdGF0aWMgaW50IHJtcnJfaWRlbnRpdHlfbWFwcGlu
ZyhzdHJ1Y3QgZG9tYWluICpkLCBib29sX3QgbWFwLAo+ICAgICAgbXJtcnItPmNvdW50ID0gMTsK
PiAgICAgIGxpc3RfYWRkX3RhaWwoJm1ybXJyLT5saXN0LCAmaGQtPmFyY2gubWFwcGVkX3JtcnJz
KTsKPgo+IC0gICAgcmV0dXJuIDA7Cj4gKyAgICByZXR1cm4gaW9tbXVfaW90bGJfZmx1c2hfYWxs
KGQsIElPTU1VX0ZMVVNIRl9hZGRlZCB8IElPTU1VX0ZMVVNIRl9tb2RpZmllZCk7Cj4gIH0KPgo+
ICBzdGF0aWMgaW50IGludGVsX2lvbW11X2FkZF9kZXZpY2UodTggZGV2Zm4sIHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
