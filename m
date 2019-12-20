Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD18128173
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 18:30:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiM48-0007iT-MF; Fri, 20 Dec 2019 17:27:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ROLc=2K=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iiM46-0007iI-SP
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 17:27:50 +0000
X-Inumbo-ID: 0bac4bfe-234e-11ea-a1e1-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bac4bfe-234e-11ea-a1e1-bc764e2007e4;
 Fri, 20 Dec 2019 17:27:50 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c127so2256753wme.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 09:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2cRm1p3lnTdLqZKYmGiwcqeJ+3MRrAFmOcxWXwg4NHY=;
 b=dQpZL7OEqHO76cvpDck5d3zMTofcjGziUKKloHUftSzNUBfRYpNnWy4AwS5yahfA1c
 oBif8jP/gQYMJ+gXGxJQ5te+ci4hG6JqoB+RlPFjaQ/5Njr20TectfQSt+ZsVlrMuNqm
 B2skdc5eN1ZrBSm4TLNPS+3rWTxOPQStJo4/J2ISXhNx1DnWJGU4dqNfWSwrdwk4fFpE
 g5+dnwZLLfiX35SfHy5YmykxwPQxG6fMZZgJ3cSc6vrFp2zhxBoUoWmPK3utn7qineS+
 9JrjvNiBX73GgbzhXINka10ot7REGIa2Zu9hIqmeFOtsOQKuB3dW+2hBWp2Q9+qPx+xt
 RdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2cRm1p3lnTdLqZKYmGiwcqeJ+3MRrAFmOcxWXwg4NHY=;
 b=jPTqLhy4Hbm1y+/YnRVM4w1h18hsh2l3EZhvALdn4KwKlY8pmXQY2yU6ri5wQJFteL
 ZesuZ9olkvjAwGX2paPBZvG1upYUeY4uLYMc7ls+OZS2il/6FGQNXY9dm3yMpFptcMSk
 VfLobhQXj4Sbk4vhufAgUclkoOHNB8RRpBJIqXiZbrvIDAh208RndexD4VXd69Z7NkKc
 muqiNAg7oUfjH0EtVI5O72QYB0aE7s0q6GjyP/W99MAA/VvPClzdMkizLFKnXRtTfUPA
 VHhKsV/0r5+SWOvA74Eq1lPeGjixe8TOGpVqO3jOSZehVWXWk7ykH1DFU9j5IETupFGb
 Lk9g==
X-Gm-Message-State: APjAAAW1Vhw6okSgSoYN1BSDf8zcsiy3MJh1Xcp22uE9jDtK+Pug+0Sm
 pYbDRWlhK7Zo0Fs9mBZBymjiUph7O79GgkJQ0Ys=
X-Google-Smtp-Source: APXvYqxpGg21DaN2oUWyO/g7oNfi996f3sW+ht5S6sOt3GSWIxTX2KedkSqInc9Bvzq11C7WvWVZiDZiJoiER8+FZXg=
X-Received: by 2002:a1c:22c6:: with SMTP id i189mr18774553wmi.15.1576862869408; 
 Fri, 20 Dec 2019 09:27:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
 <ba37b587-6a4a-ecd8-3e2f-400e2755b24d@suse.com>
In-Reply-To: <ba37b587-6a4a-ecd8-3e2f-400e2755b24d@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 20 Dec 2019 10:27:13 -0700
Message-ID: <CABfawhmGQz8cAQWv-pkTXTNNXS-ML6wDcCon5ONAUZr_VP8WUA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v2 01/20] x86: make hvm_{get/set}_param
 accessible
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjAsIDIwMTkgYXQgOTo0NyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTguMTIuMjAxOSAyMDo0MCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gQ3VycmVudGx5IHRoZSBodm0gcGFyYW1ldGVycyBhcmUgb25seSBhY2Nlc3NpYmxl
IHZpYSB0aGUgSFZNT1AgaHlwZXJjYWxscy4gQnkKPiA+IGV4cG9zaW5nIGh2bV97Z2V0L3NldH1f
cGFyYW0gaXQgd2lsbCBiZSBwb3NzaWJsZSBmb3IgVk0gZm9ya2luZyB0byBjb3B5IHRoZQo+ID4g
cGFyYW1ldGVycyBkaXJlY3RseSBpbnRvIHRoZSBjbG9uZSBkb21haW4uCj4KPiBIYXZpbmcgcGVl
a2VkIGFoZWFkIGF0IHBhdGNoIDE3LCB3aGVyZSB0aGlzIGdldHMgdXNlZCwgSSB3b25kZXIgd2h5
Cj4geW91IHdhbnQgYSBwYWlyIG9mIG9uZS1ieS1vbmUgZnVuY3Rpb25zLCByYXRoZXIgdGhhbiBh
IGNvcHktYWxsIG9uZS4KPiBUaGlzIHRoZW4gd291bGRuJ3QgcmVxdWlyZSBleHBvc3VyZSBvZiB0
aGUgZnVuY3Rpb25zIHlvdSB0b3VjaCBoZXJlLgoKV2VsbCwgcHJvdmlkZWQgdGhlcmUgaXMgbm8g
c3VjaCBmdW5jdGlvbiBpbiBleGlzdGVuY2UgdG9kYXkgaXQgd2FzCmp1c3QgZWFzaWVyIHRvIHVz
ZSB3aGF0J3MgYWxyZWFkeSBhdmFpbGFibGUuIEkgc3RpbGwgd291bGRuJ3Qgd2FudCB0bwppbXBs
ZW1lbnQgYSBvbmUtc2hvdCBmdW5jdGlvbiBsaWtlIHRoYXQgYmVjYXVzZSB0aGlzIHNhbWUgY29k
ZS1wYXRoIGlzCnNoYXJlZCBieSB0aGUgc2F2ZS1yZXN0b3JlIG9wZXJhdGlvbnMgb24gdGhlIHRv
b2xzdGFjayBzaWRlLCBzbyBhdApsZWFzdCBJIGhhdmUgYSByZWFzb25hYmxlIGFzc3VtcHRpb24g
dGhhdCBpdCB3b24ndCBicmVhayBvbiBtZSBpbiB0aGUKZnV0dXJlLgoKPiA+IEBAIC00NDI5LDQy
ICs0NDQ2LDYwIEBAIHN0YXRpYyBpbnQgaHZtb3BfZ2V0X3BhcmFtKAo+ID4gICAgICBpZiAoICFp
c19odm1fZG9tYWluKGQpICkKPiA+ICAgICAgICAgIGdvdG8gb3V0Owo+ID4KPiA+IC0gICAgcmMg
PSBodm1fYWxsb3dfZ2V0X3BhcmFtKGQsICZhKTsKPiA+ICsgICAgcmMgPSBodm1fZ2V0X3BhcmFt
KGQsIGEuaW5kZXgsICZhLnZhbHVlKTsKPiA+ICAgICAgaWYgKCByYyApCj4gPiAgICAgICAgICBn
b3RvIG91dDsKPiA+Cj4gPiAtICAgIHN3aXRjaCAoIGEuaW5kZXggKQo+ID4gKyAgICByYyA9IF9f
Y29weV90b19ndWVzdChhcmcsICZhLCAxKSA/IC1FRkFVTFQgOiAwOwo+ID4gKwo+ID4gKyAgICBI
Vk1fREJHX0xPRyhEQkdfTEVWRUxfSENBTEwsICJnZXQgcGFyYW0gJXUgPSAlIlBSSXg2NCwKPiA+
ICsgICAgICAgICAgICAgICAgYS5pbmRleCwgYS52YWx1ZSk7Cj4gPiArCj4gPiArIG91dDoKPiA+
ICsgICAgcmN1X3VubG9ja19kb21haW4oZCk7Cj4gPiArICAgIHJldHVybiByYzsKPiA+ICt9Cj4g
PiArCj4gPiAraW50IGh2bV9nZXRfcGFyYW0oCj4gPiArICAgIHN0cnVjdCBkb21haW4gKmQsCj4K
PiBJZiB0aGlzIGlzIHRvIGJlIG5vbi1zdGF0aWMsIEkgdGhpbmsgaXQgd291bGQgYmUgcXVpdGUg
bmljZSBpZgo+IHRoaXMgcGFyYW1ldGVyIHdhcyBjb25zdC4gVGhpcyB3aWxsIHRha2UgYSBwcmVy
ZXEgcGF0Y2ggdG8KPiBjb25zdGlmeSB0aGUgWFNNIHBhdGggaW52b2x2ZWQsIGJ1dCBvdGhlciB0
aGFuIHRoaXMgSSBjYW4ndAo+IHNlZSBhbnl0aGluZyBnZXR0aW5nIGluIHRoZSB3YXkuCgpTdXJl
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
