Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB10C70D75
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 01:39:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hphrE-00052d-GD; Mon, 22 Jul 2019 23:36:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGXh=VT=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1hphrC-00052Y-O5
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 23:36:38 +0000
X-Inumbo-ID: 8c31b003-acd9-11e9-8980-bc764e045a96
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8c31b003-acd9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 23:36:37 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id l9so40121940qtu.6
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2019 16:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LsYbnSRLpXY2LOs6L85oxCcN5vSsFNv0K2H7wfkJRvQ=;
 b=Q1eE4f+KSwMDcce3RXjUfxWEPEbxEJkFn4yFcJ+jbuRHZWzjPQdFF36Fi69zf5dxDg
 EaAfXqH5xbfHFPoyqMB3r7r4LQ3tkHbm49PIFc8Fm1h/qrk/Bejxi/AT1Mji7B3vi8ul
 JmGSzJwoRXycoyxia5QZZfMtdnRF1JKhERystTWZHAdW61JaVDRDgUkVY1eF3V7OORHj
 CubLw+7EaAKgToZ3qgfD3X+Lf0H50ja+nDnUhwIsr6wczbNixs9Ufi7tobc8WfMJb1kg
 8pUSYTO1VMsggRy1b0Jh6A8cCuEB00CB0CpcqZarydTiRsAEJVBhO66DqCX8C7sFk9pf
 XyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LsYbnSRLpXY2LOs6L85oxCcN5vSsFNv0K2H7wfkJRvQ=;
 b=bmsp2TiFCQbeebSOiOijrQkJGrrFCn7EAf53wIURBmkGx/lIcUXdW5nWQYuj0NZQJu
 HnIsVTCBnbkcopO6ZaOllpk95lcGhhtYWlNEkZ18aPo2RdfzXN64bqQ+R3Jv7zimTPLX
 U2mMOekLjEJgdKZvSEfL/Gwr3PyQu/wEiOW+X9JQ/qGaNqyf5meOlZfB/NHkYK/XF3lC
 gDOKi5/nJRWFFmj4KJg8JdcekNnk5/wrgiUG4xINT8qRLSaTkk+GgEu/yDJ5eNWL0T01
 qUGAeKoXa/lTXBbKne3QaZ326rdXruKaEZyGxJg2nRlBcGrDztjZYsaFMH0ZreFw+CfZ
 dPuA==
X-Gm-Message-State: APjAAAVFSVxc0SydKJShyTPAynEzbONCzIYOmMqXFS52HuWj2+4743eC
 BUJGIzHj6QLi15NBxOeA74rZudMT49nhQCKV4Bvvxw==
X-Google-Smtp-Source: APXvYqyZXXcRp6HKYlNUBmaCLIK9AfNqgF+uO5TWKaow7ZCAEqnNecSgn6k0fAsWUP3KdRy47/ZUdH6W3CuUgXfVEO4=
X-Received: by 2002:ac8:60a:: with SMTP id d10mr49939200qth.31.1563838596815; 
 Mon, 22 Jul 2019 16:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <CAMmSBy8CcG08-+-F6fvwmH1oEKpsV8OGEco94g04dZcyyFWKbw@mail.gmail.com>
 <b2e4ed0b178e41ebbc8f1db622ecae95@AMSPEX02CL03.citrite.net>
 <20190722114859.dtm4w5ff75uedu24@Air-de-Roger>
 <9238bf1a297c42f38dccc1cfb50bd144@AMSPEX02CL03.citrite.net>
 <20190722134813.c7fedaqtrbo6ojvo@Air-de-Roger>
 <81a7cdc728294e5ca05fd056a87cb21b@AMSPEX02CL03.citrite.net>
 <20190722143953.tkcmv5bb72sdlkql@Air-de-Roger>
 <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
 <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
In-Reply-To: <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 22 Jul 2019 16:36:25 -0700
Message-ID: <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRXZlcnlvbmUhCgpUaGFua3MgYSBtaWxsaW9uIGZvciBhbiBleHRyZW1lbHkgcXVpY2sgdHVy
bmFyb3VuZC4gSSBhbSBpbiBteSBsYWIKYWdhaW4gbmV4dCB0byB0aGUgYm94IGluIHF1ZXN0aW9u
LgoKU2hvdWxkIEkgZ28gYWhlYWQgYW5kIHRlc3QgdGhlIGxhdGVzdCBwYXRjaCBvciB3YWl0IGZv
ciB0aGUgb2ZmaWNpYWwKb25lIHRvIGJlIHN1Ym1pdHRlZD8KClRoYW5rcywKUm9tYW4uCgpPbiBN
b24sIEp1bCAyMiwgMjAxOSBhdCA4OjIyIEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDA1OjAyOjM1UE0g
KzAyMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0KPiA+ID4gRnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+
ID4gU2VudDogMjIgSnVseSAyMDE5IDE1OjQwCj4gPiA+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwu
RHVycmFudEBjaXRyaXguY29tPgo+ID4gPiBDYzogJ1JvbWFuIFNoYXBvc2huaWsnIDxyb21hbkB6
ZWRlZGEuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBqZ3Jvc3NAc3VzZS5j
b207IEFuZHJldwo+ID4gPiBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBib3Jp
cy5vc3Ryb3Zza3lAb3JhY2xlLmNvbTsgamJldWxpY2hAc3VzZS5jb20KPiA+ID4gU3ViamVjdDog
UmU6IFtYZW4tZGV2ZWxdIFtCVUddIEFmdGVyIHVwZ3JhZGUgdG8gWGVuIDQuMTIuMCBpb21tdT1u
by1pZ2Z4Cj4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJj
aC94ODYvbW0vcDJtLmMKPiA+ID4gaW5kZXggZmVmOTdjODJmNi4uODhhMjQzMGM4YyAxMDA2NDQK
PiA+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9tbS9wMm0uYwo+ID4gPiBAQCAtODM2LDcgKzgzNiw3IEBAIGd1ZXN0X3BoeXNtYXBfYWRkX3Bh
Z2Uoc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCBtZm5fdCBtZm4sCj4gPiA+ICAgICAgICAg
ICAqLwo+ID4gPiAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8ICgxVUwgPDwgcGFnZV9vcmRlcik7
ICsraSwgKytwYWdlICkKPiA+ID4gICAgICAgICAgewo+ID4gPiAtICAgICAgICAgICAgaWYgKCAh
bmVlZF9pb21tdV9wdF9zeW5jKGQpICkKPiA+ID4gKyAgICAgICAgICAgIGlmICggIWhhc19pb21t
dV9wdChkKSApCj4gPiA+ICAgICAgICAgICAgICAgICAgLyogbm90aGluZyAqLzsKPiA+ID4gICAg
ICAgICAgICAgIGVsc2UgaWYgKCBnZXRfcGFnZV9hbmRfdHlwZShwYWdlLCBkLCBQR1Rfd3JpdGFi
bGVfcGFnZSkgKQo+ID4gPiAgICAgICAgICAgICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKHBhZ2Up
Owo+ID4gPiBAQCAtMTM0MSw3ICsxMzQxLDcgQEAgaW50IHNldF9pZGVudGl0eV9wMm1fZW50cnko
c3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnZm5fbCwKPiA+ID4KPiA+ID4gICAgICBp
ZiAoICFwYWdpbmdfbW9kZV90cmFuc2xhdGUocDJtLT5kb21haW4pICkKPiA+ID4gICAgICB7Cj4g
PiA+IC0gICAgICAgIGlmICggIW5lZWRfaW9tbXVfcHRfc3luYyhkKSApCj4gPiA+ICsgICAgICAg
IGlmICggIWhhc19pb21tdV9wdChkKSApCj4gPiA+ICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+
ID4gICAgICAgICAgcmV0dXJuIGlvbW11X2xlZ2FjeV9tYXAoZCwgX2RmbihnZm5fbCksIF9tZm4o
Z2ZuX2wpLCBQQUdFX09SREVSXzRLLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBJT01NVUZfcmVhZGFibGUgfCBJT01NVUZfd3JpdGFibGUpOwo+ID4gPiBAQCAtMTQzMiw3
ICsxNDMyLDcgQEAgaW50IGNsZWFyX2lkZW50aXR5X3AybV9lbnRyeShzdHJ1Y3QgZG9tYWluICpk
LCB1bnNpZ25lZCBsb25nIGdmbl9sKQo+ID4gPgo+ID4gPiAgICAgIGlmICggIXBhZ2luZ19tb2Rl
X3RyYW5zbGF0ZShkKSApCj4gPiA+ICAgICAgewo+ID4gPiAtICAgICAgICBpZiAoICFuZWVkX2lv
bW11X3B0X3N5bmMoZCkgKQo+ID4gPiArICAgICAgICBpZiAoICFoYXNfaW9tbXVfcHQoZCkgKQo+
ID4gPiAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+ICAgICAgICAgIHJldHVybiBpb21tdV9s
ZWdhY3lfdW5tYXAoZCwgX2RmbihnZm5fbCksIFBBR0VfT1JERVJfNEspOwo+ID4gPiAgICAgIH0K
PiA+Cj4gPiBZZXMsIHRoaXMgYWxsIGxvb2tzIG9rIHRvIG1lLi4uIGFsdGhvdWdoIEkgc3RpbGwg
ZmluZCBpdCBjb3VudGVyaW50dWl0aXZlIHRoYXQgd2UgbWFrZSBwMm0gY2FsbHMgZm9yIFBWIGRv
bWFpbnMuCj4KPiBJIGFncmVlLCBhbGJlaXQgSSdtIG5vdCBzdXJlIG9mIGhvdyB0byBnZXQgcmlk
IG9mIHRob3NlLCB3aWxsIG5lZWQgdG8KPiBsb29rIGF0IHRoZSBjYWxsZXJzLiBGb3IgaW9tbXUg
Y2FsbGVycyB3ZSBjb3VsZCBsaWtlbHkganVzdCBjYWxsCj4gaW9tbXVfbGVnYWN5X3ttYXAvdW5t
YXB9IGZvciBQVi4KPgo+IEknbSBnb2luZyB0byBmb3JtYWxseSBzdWJtaXQgdGhpcyBwYXRjaCB0
aGVuLgo+Cj4gVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
