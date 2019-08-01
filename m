Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087057DF9F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 18:01:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htDTM-0003dH-L4; Thu, 01 Aug 2019 15:58:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i81v=V5=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1htDTK-0003dC-VC
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 15:58:31 +0000
X-Inumbo-ID: 33b24c37-b475-11e9-8980-bc764e045a96
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 33b24c37-b475-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 15:58:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z1so74135727wru.13
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6E4qW17vHCdzMdOSFnuWHwWf6nKEuaEbFnYfg5EQq7A=;
 b=rduFwdfpt8EAcrAYqPYWOPvVBF0a9CVFbCeK7aV3KI5ovBlBb/J4rjysLqNcheK5kp
 ZY6gpWWyXoNEPnDLvvPXnGjzEW8/jTIBCmPPNSw7FYkWCc3uWSI4uqXI20kI6YI9EHHr
 QzVCibLK5QvuwswTtjkL2Z8o8ePrO5KBzq3VkcBOd3qW9+BRuvOp9QENZ47i2R71n2eM
 Ugc0CdGTPHQR2xL+RI5VBTSm99T2rKvRyYm0HVWLx1d/RKX7lKh+MhxYC3ONmBr3M2u0
 SKbzGnlk+quVJ7sQEZ9lu7Sm5tLXZZe37beFKOeHFZNftS97aAU8JZwiRBJNIKzZCiON
 0QtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6E4qW17vHCdzMdOSFnuWHwWf6nKEuaEbFnYfg5EQq7A=;
 b=UJWUxd1QpB5+rO2kb1rZiyz98aBxVKknZc909G1LqJcDAFUN+hnITKk1BwIFMy95qO
 N1I0vebAP1yZa8eZifocCgP2W7EXweXuSWaMpJa6xinrFzi5iSuSxlwAFI2DibvEMmkQ
 Zf5vfzDn9jKgowLED174xoJW/LRk4xqKBY2l9rZUGL/mqXiSQRNMAhw+f+QoYuelly+c
 /QW4VFnktKncy8x+MRlukr8YjWi0ag7OZ5OKJpEI0yMpxnXZPpKCnoiDzwVx5ljlsWEE
 ehskrGJJPAv89Rjh08Wd56Dj0oA1yzunViAX6QZxhGCKmlt+MzxjfttUerpGPCWAgM2D
 ac8w==
X-Gm-Message-State: APjAAAWB0PaJxxwRI+x95s785ZYvyDLq6Bf8B6YTa8cf+rLYr1Rqhd14
 QC07E04Dq5+Kv6H9Ckm00eYRXM5Y3dnGFpbiu+0=
X-Google-Smtp-Source: APXvYqxwqf0HCDHLoIQE9ZnXs3apxmymguvdwmVEzUO0RxsVEjzs+T34dPRemUXilbom3Uu+g2dGqSm18smyB8TE2oQ=
X-Received: by 2002:adf:b64b:: with SMTP id i11mr7141661wre.205.1564675107803; 
 Thu, 01 Aug 2019 08:58:27 -0700 (PDT)
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
In-Reply-To: <CAOcoXZbibFp02xus2VaJ6i2sh04--R6Cj_Wc+NhWOhSb_z2ZMA@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 1 Aug 2019 09:57:51 -0600
Message-ID: <CABfawhk_LbkPFeB5EjWsrEcuxnWg2Uy3Spp6R9CQ1HNNwyze4w@mail.gmail.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>, Doug Goldstein <cardoe@cardoe.com>,
 Julien Grall <julien.grall@arm.com>, Committers <committers@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCA0OjA2IEFNIFZpa3RvciBNaXRpbiA8dmlrdG9yLm1pdGlu
LjE5QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCA4OjA1IFBN
IFZpa3RvciBNaXRpbiA8dmlrdG9yLm1pdGluLjE5QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgNzoyNyBQTSBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoLnhl
bkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+ID4gVmlrdG9yOiB0aGFuayB5b3UgZm9yIHNwZW5k
aW5nIHRpbWUgb24gdGhpcwo+ID4gPgo+ID4gPiBJIGFkZGVkIGFuIGl0ZW0gdG8gY29tbXVuaXR5
IGNhbGwgdG9tb3Jyb3cgYW5kIENDJ2VkIHlvdSBpbiB0aGUgaW52aXRlLiBTbyBJIHRoaW5rIHdo
YXQgd2UgbmVlZCB0byBkbyBpcyBmaWd1cmUgb3V0IGEgd2F5IG9uIGhvdyB0byBtYWtlIHRoZSBj
b2Rpbmcgc3RhbmRhcmQgZW5mb3JjZWFibGUgYnkgYSBjb2Rpbmcgc3RhbmRhcmQgY2hlY2tlciBz
dWNoIGFzIHByb3Bvc2VkIGhlcmUuIEFGQUlDVAo+ID4gPiAqIEl0IHNlZW1zIHRoZXJlIGFyZSBz
b21lIHVuZG9jdW1lbnRlZCBjb2Rpbmcgc3RhbmRhcmQgcnVsZXMsIHdoaWNoIGFyZSBlc3NlbnRp
YWxseSBjYXVzaW5nIHByb2JsZW1zIHdpdGggdGhlIHRvb2wKPiA+ID4gKiBJbiBhZGRpdGlvbiwg
dGhlIGZhY3QgdGhhdCB0aGUgTExWTSBjb2Rpbmcgc3R5bGUgaXMgdGhlIGJhc2VsaW5lIGZvciB0
aGUgY2hlY2tzIG1heSBhbHNvIGNyZWF0ZSBzb21lIHByb2JsZW1zIHdpdGggZmFsc2Ugc3RhbmRh
cmQgdmlvbGF0aW9ucwo+ID4gPgo+ID4gPiBNeSBpbnN0aW5jdCB3b3VsZCBiZSB0byB0cnkgYW5k
IGRvY3VtZW50IGFueSB1bmRvY3VtZW50ZWQgcnVsZXMgb24gYSBzY3JhdGNoIHNwYWNlIChlLmcu
IGdvb2dsZSBkb2MpLCBsb29rIGF0IGRpZmZlcmVuY2VzIGJldHdlZW4gWGVuIGFuZCBMTFZNIGZv
cm1hdHRpbmcgc3R5bGUgYW5kIHRoZW4gbWFrZSBkZWNpc2lvbnMgdXNpbmcgYSB2b3RpbmcgbWVj
aGFuaXNtIHRvIGF2b2lkIGJpa2Utc2hlZGRpbmcuIEluIHNvbWUgY2FzZXMgZGlzY3Vzc2lvbiBt
YXkgYmUgbmVjZXNzYXJ5IHRob3VnaAo+ID4gPgo+ID4gPiBJdCB3b3VsZCBiZSBnb29kIGlmIHlv
dSBjb3VsZCBhdHRlbmQsIGJ1dCBJIHRoaW5rIHdlIGNhbiBkbyB3aXRob3V0IHlvdSwgaWYgbmVl
ZGVkCj4gPiA+Cj4gPgo+ID4gTGFycywgdGhhbmsgeW91IGZvciB0aGUgaW52aXRhdGlvbi4gSSB3
aWxsIHRyeSB0byBqb2luIHRoZSBjYWxsLgo+ID4gU2VlbXMgdGhlIHRvcGljIGlzIG5vdCBhIHNp
bXBsZSBvbmUsIHRoZXJlIGFyZSBhIGxvdCBvZiB0aGluZ3MgdG8gZGlzY3VzcyBpdC4KPgo+IFBs
ZWFzZSBiZSBhd2FyZSB0aGF0IHRoZSByZXBvIHdpdGggeGVuIGNsYW5nLWZvcm1hdCBoYXMgYmVl
biBjcmVhdGVkCj4gdW5kZXIgdGhlIG5leHQgbGluayAoYnJhbmNoIHhlbi1jbGFuZy1mb3JtYXQp
Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS94ZW4tdHJvb3BzL2xsdm0tcHJvamVjdC90cmVlL3hlbi1j
bGFuZy1mb3JtYXQKPgo+IFRoZSBuZXh0IHNjcmlwdCBjYW4gYmUgdXNlZCBhcyBhbiBleGFtcGxl
IG9mIGhvdyB0byBidWlsZCBjbGFuZy1mb3JtYXQ6Cj4gaHR0cHM6Ly9naXRodWIuY29tL3Zpa3Rv
ci1taXRpbi94ZW4tY2xhbmctZm9ybWF0LWV4YW1wbGUvYmxvYi9tYXN0ZXIvYnVpbGRfY2xhbmdf
Zm9ybWF0LnNoCgpJIGhhZCBhIGNoYW5jZSB0byBnaXZlIGl0IGEgc2hvdCByaWdodCBub3cgYW5k
IHJ1bm5pbmcgaXQgb24gdGhlCmh5cGVydmlzb3IgY29kZSByZXN1bHRzIGluIDEwNzMgb3V0IG9m
IDExNjUgZmlsZXMgYmVpbmcgY2hhbmdlZCBieSBpdC4KSGVyZSBpcyB0aGUgZ2lzdCBvZiB0aGUg
ZGlmZjoKCmh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3RrbGVuZ3llbC9iYzRhODZlMGYyMGI3YzUw
YzczMGMxYjk0MjlkNGUyYwoKQ2hlZXJzLApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
