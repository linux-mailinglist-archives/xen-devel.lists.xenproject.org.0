Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDF4145819
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 15:46:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuHEW-0000Rx-5x; Wed, 22 Jan 2020 14:43:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GdgK=3L=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1iuHEU-0000Rs-E5
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 14:43:50 +0000
X-Inumbo-ID: 99c4cf60-3d25-11ea-b833-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99c4cf60-3d25-11ea-b833-bc764e2007e4;
 Wed, 22 Jan 2020 14:43:49 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r14so5526567lfm.5
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 06:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WoXG14KIwDaRCsrMKIH2fVmpB4XGw9wA8FSrjk4h6nw=;
 b=nrfkrNHI9eafdKYIOhS41c69yU9rNp+CayzuTm8oXHpKWxbNcTFsTZmQwQ6oBKH/nw
 Y5Kb0VfZa+FKQcvV1aEv94qWC1TZbX0h8XHj9gJLD68WtTq7da1/q406QQdyCSdev44n
 dLI5OmI0+qPNfC0lXZoJAwg+tFCJ4a4AERnt2yfk8dGFyQiVQekjMOmgNvLwCjBakDYC
 JAEwYa0EarEdEjjm8xSqPyY0q0Mk6mkpLY5LOGHJadj7wGgYjlr9z5j9scu5Af2/3O/E
 HyMbiR78sW9iPDtxYyUuayYbY13x4n5Z0gbJRe1qzoDrIVkkXqoVWaE3cuEB0KvV2Myz
 QrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WoXG14KIwDaRCsrMKIH2fVmpB4XGw9wA8FSrjk4h6nw=;
 b=KQi7aNxUMKr7RDGinn0HZX7zvzfpdmSxYDV3Kcv1p/gVmJyKEu9gw0RyLtDREmn8Re
 /+j7Ju9DKCDP+z8lQtr6vFvBgZ4wjdUWYE++AqsnlarQqLjE+srK4XPGqYeDKrmLPlSl
 5Bbaod2G4cE1h80sihCV42/t9U6KBToOEISOfg0z6wSsRBvNI5lql5z3nKrrngUXIvGx
 l+VMa1yz6MU0C7o8zrZfmbWE3ufh0E/VVNj8SD75aekhJw7w3BQm22ZMhv94J/WiUVUW
 ZPpf+lGMw+7Q4vw4anPlx63hPXctnw1k5NKbuU0SFc3KYVwXpg1TE2bHvhvT8AKOQNmM
 ieog==
X-Gm-Message-State: APjAAAUKn7xGeMTwRDtL6Vt8JjM3m1gHVEjyOISocQ4FkVpWbYfCYaXa
 bEAXHuvm/vJfeToh1YTG0/ac+bD5/m/wx9182vg=
X-Google-Smtp-Source: APXvYqyII+3NwL2h9NZv4BWFZdb2IZNDjT0HsGI0/0E5lHcGt1F1m1xwZ5S0kz7S4SIH9OtjspAGIMsqBqroLBI9jcc=
X-Received: by 2002:a19:ac43:: with SMTP id r3mr2092070lfc.156.1579704228721; 
 Wed, 22 Jan 2020 06:43:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <047e5ff567ac0c2e0bd92fd8741c03d07b548ab5.1579055705.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpsu2yvtEaQoweWxkR3G3zUM+1Edkoxh4-6MQyXYMKniqw@mail.gmail.com>
 <20200121212828.GT1314@mail-itl>
In-Reply-To: <20200121212828.GT1314@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 22 Jan 2020 09:43:37 -0500
Message-ID: <CAKf6xpsSYTruwQgJUOT1-=QQ1Ovw-oSrCss+U0Sm-T9pZTu8Vg@mail.gmail.com>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v4 08/16] tools/libvchan: notify server when
 client is connected
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgNDoyOCBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBK
YW4gMjAsIDIwMjAgYXQgMDI6NDQ6NThQTSAtMDUwMCwgSmFzb24gQW5kcnl1ayB3cm90ZToKPiA+
IE9uIFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDk6NDIgUE0gTWFyZWsgTWFyY3p5a293c2tpLUfDs3Jl
Y2tpCj4gPiA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IExldCB0aGUgc2VydmVyIGtub3cgd2hlbiB0aGUgY2xpZW50IGlzIGNvbm5lY3RlZC4gT3Ro
ZXJ3aXNlIHNlcnZlciB3aWxsCj4gPiA+IG5vdGljZSBvbmx5IHdoZW4gY2xpZW50IHNlbmQgc29t
ZSBkYXRhLgo+ID4gPiBUaGlzIGNoYW5nZSBkb2VzIG5vdCBicmVhayBleGlzdGluZyBjbGllbnRz
LCBhcyBsaWJ2Y2hhbiB1c2VyIHNob3VsZAo+ID4gPiBoYW5kbGUgc3B1cmlvdXMgbm90aWZpY2F0
aW9ucyBhbnl3YXkgKGZvciBleGFtcGxlIGFja25vd2xlZGdlIG9mIHJlbW90ZQo+ID4gPiBzaWRl
IHJlYWRpbmcgdGhlIGRhdGEpLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJj
enlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4gPiA+
IC0tLQo+ID4gPiBJIGhhZCB0aGlzIHBhdGNoIGluIFF1YmVzIGZvciBhIGxvbmcgdGltZSBhbmQg
dG90YWxseSBmb3Jnb3QgaXQgd2Fzbid0Cj4gPiA+IHVwc3RyZWFtIHRoaW5nLi4uCj4gPiA+IC0t
LQo+ID4gPiAgdG9vbHMvbGlidmNoYW4vaW5pdC5jIHwgMyArKysKPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnZj
aGFuL2luaXQuYyBiL3Rvb2xzL2xpYnZjaGFuL2luaXQuYwo+ID4gPiBpbmRleCAxODA4MzNkLi41
MGE2NGMxIDEwMDY0NAo+ID4gPiAtLS0gYS90b29scy9saWJ2Y2hhbi9pbml0LmMKPiA+ID4gKysr
IGIvdG9vbHMvbGlidmNoYW4vaW5pdC5jCj4gPiA+IEBAIC00NDcsNiArNDQ3LDkgQEAgc3RydWN0
IGxpYnhlbnZjaGFuICpsaWJ4ZW52Y2hhbl9jbGllbnRfaW5pdChzdHJ1Y3QgeGVudG9vbGxvZ19s
b2dnZXIgKmxvZ2dlciwKPiA+ID4gICAgICAgICBjdHJsLT5yaW5nLT5jbGlfbGl2ZSA9IDE7Cj4g
PiA+ICAgICAgICAgY3RybC0+cmluZy0+c3J2X25vdGlmeSA9IFZDSEFOX05PVElGWV9XUklURTsK
PiA+ID4KPiA+ID4gKyAgICAvKiB3YWtlIHVwIHRoZSBzZXJ2ZXIgKi8KPiA+ID4gKyAgICB4ZW5l
dnRjaG5fbm90aWZ5KGN0cmwtPmV2ZW50LCBjdHJsLT5ldmVudF9wb3J0KTsKPiA+Cj4gPiBMb29r
cyBsaWtlIHlvdSB1c2VkIDQgc3BhY2VzLCBidXQgdGhlIHVwc3RyZWFtIGZpbGUgdXNlcyBoYXJk
IHRhYnMuCj4KPiBJbmRlZWQuIENPRElOR19TVFlMRSBzYXlzIHNwYWNlcywgYnV0IGl0IGFsc28g
c2F5cyBzb21lIHRvb2xzLyogYXJlIG5vdAo+IGRpcmVjdGx5IGNvdmVyZWQgYnkgdGhpcyBmaWxl
LiBTaG91bGQgSSB1c2UgdGhpcyBvY2Nhc2lvbiB0byBjb252ZXJ0Cj4gdG9vbHMvbGlidmNoYW4v
KiB0byBzcGFjZXMgKGluIGEgc2VwYXJhdGUgcGF0Y2gpLCBvciBrZWVwIHRhYnMgKGFuZAo+IGFk
anVzdCBteSBwYXRjaCk/CgpNYXliZSBhZGp1c3QgeW91ciBwYXRjaCBmb3IgdGFicyBpbiBjYXNl
IHNvbWVvbmUgd2FudHMgdG8gYmFja3BvcnQgaXQuCkFuZCB0aGVuIGNvbnZlcnQgdG8gc3BhY2Vz
IGluIGEgc2VwYXJhdGUgcGF0Y2guCgpSZWdhcmRzLApKYXNvbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
