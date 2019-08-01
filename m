Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E94DD7E049
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 18:35:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htE0z-0006zA-8Q; Thu, 01 Aug 2019 16:33:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H9Oh=V5=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1htE0x-0006z5-Ad
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 16:33:15 +0000
X-Inumbo-ID: 0f01c341-b47a-11e9-8980-bc764e045a96
Received: from mail-io1-xd31.google.com (unknown [2607:f8b0:4864:20::d31])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0f01c341-b47a-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 16:33:14 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id o9so42116679iom.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xxHHYnollR0Xe+G9FgmyTWAmre44Cj7Wwf+n+in5BpQ=;
 b=k9dT8otYs0owimWSIX9VICIi+zo6W7BQDDbKQSOmxYOjce+Ns6VXq+DZx1OfarvvLv
 a2cvNcQ3dbzAtzl9zxxAfH8Ugv5A6hYJvC0m03U9qCIBxwn5NzNjU8JzhALnmWgM0nJw
 atyF26NEZC1guHU69M0DTdg+JRtrOYuc6ZD2BKssqszMcQPIRJISUlXb1vF9G7ExkExh
 8zev0zfYc/2SPs5kma/GL2JeS27Ct6S/lPcqy0Qlqte3riUCmPKtURhTje5Kv0ztbu8R
 rs8HRVL7g8Pm80IIto6Qo7qcrseZKSo6nJ4Aa9+P3TWHlYH7Byozbf/U2/5r2znukAu8
 TsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xxHHYnollR0Xe+G9FgmyTWAmre44Cj7Wwf+n+in5BpQ=;
 b=EtiMRMQE2z99ZDi9h74OA6oQmMCuNLx91IKSDLPa8g3kFl9AnuGn4B+WOcnrK7DX0g
 fsVxPdiWW3VnVi/BO9pLwLIiXbslKdMY9QMKnIM5v9TAiIFWuLlY9klKTW6Sg+BWbKnm
 lJSCeK763eivibmYNIquS9SmOpLXQT9FaQM2kPEJi+pV525TeKtxUkTCtkbvwyS3/wuo
 MYZ5Unqp3QiLTFzHrY5pidcQJGXTLQl48k4wJ6RpNJXHPtE5nil3zhEabLIgRwX9vJNM
 J4sQPNbxYVnlhnCO0a54gWWoyG1gvVUtTV+l7RWIKfhoj6fQO4qM9S9ziE0MNA93KzfE
 q1KQ==
X-Gm-Message-State: APjAAAV9TqYi6T+RI7XM1G3swXPUuhkwZcGmQBLyCmHKyX1gu0aVzNiJ
 XEDjidWVyxk3F1FrWjnTO/ohbFNQNZwn7gSBeYs=
X-Google-Smtp-Source: APXvYqwF5N8rbeCC1J81e0Uir1DYCY3udbXx0/S7+luPDjGvKruR7FWX2/yWCVpBiHM98oCLeW6Ku5jqKnP5GfrRvn0=
X-Received: by 2002:a6b:b756:: with SMTP id h83mr15765506iof.147.1564677193844; 
 Thu, 01 Aug 2019 09:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZavLnHhNc7mmHnO5Gi_vq-0j1FCgvpXh0NimAewXX8e1g@mail.gmail.com>
 <5B61E054-048E-46BF-9952-382FA65893EE@gmail.com>
 <ab635236-6dac-0f8f-8bab-46ccbc9d47e2@arm.com>
 <CAOcoXZYw0uC+2c5KAVMhvXRukYomAuhSVW=jWU3HH1sX6zgkaQ@mail.gmail.com>
 <685e081c-b374-7d66-4645-d6ee7a02f655@arm.com>
 <CAOcoXZZ5HWYrDEy966BN-Esaci2XD=H98kn1JNwjAU_DUW_Egg@mail.gmail.com>
 <d5e1b66e-4d94-6ec5-96e4-54fb77c44eaa@arm.com>
 <CAOcoXZbapuZ3FhDP2cZ+C9JEJwCZUp03h-6eTbynqk5RGWF+3g@mail.gmail.com>
 <efbb6de5-3454-ad61-e3e6-07c7bdb0def7@arm.com>
 <CAOcoXZYKXqXa=M2LvcGMDrufh9snhSQvCX_qBFr63sn=fgDo=w@mail.gmail.com>
 <1CE4B542-C03C-4B21-AC92-145F7B9B63BB@gmail.com>
 <CAOcoXZaL3OwVcNsOUkUVw4Wo6ts8YQkuQ60vz+-H573Zwvuy2g@mail.gmail.com>
 <CAOcoXZbibFp02xus2VaJ6i2sh04--R6Cj_Wc+NhWOhSb_z2ZMA@mail.gmail.com>
 <CABfawhk_LbkPFeB5EjWsrEcuxnWg2Uy3Spp6R9CQ1HNNwyze4w@mail.gmail.com>
In-Reply-To: <CABfawhk_LbkPFeB5EjWsrEcuxnWg2Uy3Spp6R9CQ1HNNwyze4w@mail.gmail.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Thu, 1 Aug 2019 19:33:02 +0300
Message-ID: <CAOcoXZbGShTH711qWwFGx6jBZ9DyB25x61mwrRqX1FqooRwYJw@mail.gmail.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] Xen Coding style and clang-format
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
Cc: Lars Kurth <lars.kurth.xen@gmail.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Committers <committers@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVGFtYXMsCgpPbiBUaHUsIEF1ZyAxLCAyMDE5IGF0IDY6NTggUE0gVGFtYXMgSyBMZW5neWVs
Cjx0YW1hcy5rLmxlbmd5ZWxAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDEsIDIw
MTkgYXQgNDowNiBBTSBWaWt0b3IgTWl0aW4gPHZpa3Rvci5taXRpbi4xOUBnbWFpbC5jb20+IHdy
b3RlOgo+ID4KPiA+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDg6MDUgUE0gVmlrdG9yIE1pdGlu
IDx2aWt0b3IubWl0aW4uMTlAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBK
dWwgMzEsIDIwMTkgYXQgNzoyNyBQTSBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoLnhlbkBnbWFpbC5j
b20+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IFZpa3RvcjogdGhhbmsgeW91IGZvciBzcGVuZGluZyB0
aW1lIG9uIHRoaXMKPiA+ID4gPgo+ID4gPiA+IEkgYWRkZWQgYW4gaXRlbSB0byBjb21tdW5pdHkg
Y2FsbCB0b21vcnJvdyBhbmQgQ0MnZWQgeW91IGluIHRoZSBpbnZpdGUuIFNvIEkgdGhpbmsgd2hh
dCB3ZSBuZWVkIHRvIGRvIGlzIGZpZ3VyZSBvdXQgYSB3YXkgb24gaG93IHRvIG1ha2UgdGhlIGNv
ZGluZyBzdGFuZGFyZCBlbmZvcmNlYWJsZSBieSBhIGNvZGluZyBzdGFuZGFyZCBjaGVja2VyIHN1
Y2ggYXMgcHJvcG9zZWQgaGVyZS4gQUZBSUNUCj4gPiA+ID4gKiBJdCBzZWVtcyB0aGVyZSBhcmUg
c29tZSB1bmRvY3VtZW50ZWQgY29kaW5nIHN0YW5kYXJkIHJ1bGVzLCB3aGljaCBhcmUgZXNzZW50
aWFsbHkgY2F1c2luZyBwcm9ibGVtcyB3aXRoIHRoZSB0b29sCj4gPiA+ID4gKiBJbiBhZGRpdGlv
biwgdGhlIGZhY3QgdGhhdCB0aGUgTExWTSBjb2Rpbmcgc3R5bGUgaXMgdGhlIGJhc2VsaW5lIGZv
ciB0aGUgY2hlY2tzIG1heSBhbHNvIGNyZWF0ZSBzb21lIHByb2JsZW1zIHdpdGggZmFsc2Ugc3Rh
bmRhcmQgdmlvbGF0aW9ucwo+ID4gPiA+Cj4gPiA+ID4gTXkgaW5zdGluY3Qgd291bGQgYmUgdG8g
dHJ5IGFuZCBkb2N1bWVudCBhbnkgdW5kb2N1bWVudGVkIHJ1bGVzIG9uIGEgc2NyYXRjaCBzcGFj
ZSAoZS5nLiBnb29nbGUgZG9jKSwgbG9vayBhdCBkaWZmZXJlbmNlcyBiZXR3ZWVuIFhlbiBhbmQg
TExWTSBmb3JtYXR0aW5nIHN0eWxlIGFuZCB0aGVuIG1ha2UgZGVjaXNpb25zIHVzaW5nIGEgdm90
aW5nIG1lY2hhbmlzbSB0byBhdm9pZCBiaWtlLXNoZWRkaW5nLiBJbiBzb21lIGNhc2VzIGRpc2N1
c3Npb24gbWF5IGJlIG5lY2Vzc2FyeSB0aG91Z2gKPiA+ID4gPgo+ID4gPiA+IEl0IHdvdWxkIGJl
IGdvb2QgaWYgeW91IGNvdWxkIGF0dGVuZCwgYnV0IEkgdGhpbmsgd2UgY2FuIGRvIHdpdGhvdXQg
eW91LCBpZiBuZWVkZWQKPiA+ID4gPgo+ID4gPgo+ID4gPiBMYXJzLCB0aGFuayB5b3UgZm9yIHRo
ZSBpbnZpdGF0aW9uLiBJIHdpbGwgdHJ5IHRvIGpvaW4gdGhlIGNhbGwuCj4gPiA+IFNlZW1zIHRo
ZSB0b3BpYyBpcyBub3QgYSBzaW1wbGUgb25lLCB0aGVyZSBhcmUgYSBsb3Qgb2YgdGhpbmdzIHRv
IGRpc2N1c3MgaXQuCj4gPgo+ID4gUGxlYXNlIGJlIGF3YXJlIHRoYXQgdGhlIHJlcG8gd2l0aCB4
ZW4gY2xhbmctZm9ybWF0IGhhcyBiZWVuIGNyZWF0ZWQKPiA+IHVuZGVyIHRoZSBuZXh0IGxpbmsg
KGJyYW5jaCB4ZW4tY2xhbmctZm9ybWF0KToKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS94ZW4tdHJv
b3BzL2xsdm0tcHJvamVjdC90cmVlL3hlbi1jbGFuZy1mb3JtYXQKPiA+Cj4gPiBUaGUgbmV4dCBz
Y3JpcHQgY2FuIGJlIHVzZWQgYXMgYW4gZXhhbXBsZSBvZiBob3cgdG8gYnVpbGQgY2xhbmctZm9y
bWF0Ogo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3Zpa3Rvci1taXRpbi94ZW4tY2xhbmctZm9ybWF0
LWV4YW1wbGUvYmxvYi9tYXN0ZXIvYnVpbGRfY2xhbmdfZm9ybWF0LnNoCj4KPiBJIGhhZCBhIGNo
YW5jZSB0byBnaXZlIGl0IGEgc2hvdCByaWdodCBub3cgYW5kIHJ1bm5pbmcgaXQgb24gdGhlCj4g
aHlwZXJ2aXNvciBjb2RlIHJlc3VsdHMgaW4gMTA3MyBvdXQgb2YgMTE2NSBmaWxlcyBiZWluZyBj
aGFuZ2VkIGJ5IGl0Lgo+IEhlcmUgaXMgdGhlIGdpc3Qgb2YgdGhlIGRpZmY6Cj4KPiBodHRwczov
L2dpc3QuZ2l0aHViLmNvbS90a2xlbmd5ZWwvYmM0YTg2ZTBmMjBiN2M1MGM3MzBjMWI5NDI5ZDRl
MmMKClRoYW5rIHlvdSBmb3IgY2hlY2tpbmcgdGhlIHRvb2wuIFRoZXJlIGFyZSBtYW55IGZpbGVz
IGNoYW5nZWQgYmVjYXVzZQppdCBuZWVkcyB0byBpbnZlc3RpZ2F0ZSBob3cgdG8gaW1wbGVtZW50
ICdsYXp5JyBtb2RlIGxvZ2ljIGluIGl0LgpBcyB3ZSBkaXNjdXNzZWQgd2l0aCBKdWxpZW4sIGl0
IHNob3VsZCBub3QgdHJ5IHRvIHBhY2sgZXZlcnl0aGluZyB0bwpmaWxsIGEgbGluZSwgZXRjLiBP
bmNlIGl0IGlzIGRvbmUsIG1hbnkgb2Ygc3VjaCAnZmFsc2UtcG9zaXRpdmVzJwpkaXNhcHBlYXIu
CkluIGFueSBjYXNlLCB0aGFuayB5b3UgZm9yIHlvdXIgaW5wdXQgYWJvdXQgaXQuCgpUaGFua3MK
Cj4gQ2hlZXJzLAo+IFRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
