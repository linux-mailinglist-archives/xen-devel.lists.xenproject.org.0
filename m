Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22129134DD8
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 21:45:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipI9r-0005K6-8W; Wed, 08 Jan 2020 20:42:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ky+M=25=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ipI9q-0005K1-DW
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 20:42:26 +0000
X-Inumbo-ID: 6070b8f6-3257-11ea-a38f-bc764e2007e4
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6070b8f6-3257-11ea-a38f-bc764e2007e4;
 Wed, 08 Jan 2020 20:42:25 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id u71so4706520lje.11
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 12:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3Tu5svTAV3r/0Bw64k/RrpI+q05QTT299+SXKaS7mt8=;
 b=SfGEpb0VznutvRBNrEWqvxYNuh809uzijY1R5wLNEYtcBdVccfP+FBsVBVIJDUvGBO
 Ej+ltuvTLII1vrxIeczdKGmQ7QsgnJiYMB/suUZbsk3/E6l4p+qIXuK9S8yJy4ZPeGlD
 1YAZZyCVqALLM8P5FhwSOv3Z2ZhX7tZzcmpi26MxbG8P1dDMlJQN+LQBnRV0hy/JEgxw
 0p7eslc4OygtzTvvKb6I9zMrnhCaQeEJ7QL16mkG0Y6/Pj85ZvRCH9EWHvnSYKFm6USn
 yZMBZbstbwCEcWqPXba78DMcU88zOjgn6OnvSuFsbm5fnOFGt3Vux0C0tPD+Z6IF+c9b
 Akag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3Tu5svTAV3r/0Bw64k/RrpI+q05QTT299+SXKaS7mt8=;
 b=tYSZuTBNkC4BjKvO8W50KgOPdZ8XtQOR7ubxU/TtoGcd1Mmb8HHg0O4ikZO/KigO35
 MD/47QW9rHKC5VVknN3zrUxoMly6Q5tg7tdblXiH13Q0n1TmC4sjOrFLeC9S0Ka4IhOM
 l2JfFj7g2kwYKh3vwxjHYXTYM5Y7tjy3oFnGYPWP2msTMj4nmGdFlxwJM67MloIHl8oX
 sxG9BPewHbBP3QzTFUTew79wd92JjMF5ngwFRhIfzxHgvH3K1/3wyrZ4RYPqD59oLCuD
 /DLzaUC9A2P6m3H8v77KQjm65Uj5HCUFbM+38NyZAUX6QMHmK5Q+Qb9ICuwY1jf0TR8c
 5msQ==
X-Gm-Message-State: APjAAAVpAkCrwjX+1KHv9SBt253vm64hf74q96eKPpzBGiNLmsGQCNrF
 RSU+Natv/pT9hqa2Hm75TXdgUf6FNelybhGisUI=
X-Google-Smtp-Source: APXvYqwHkH8X+vKPqzQ3qsnYhYlY6WqeI9M2THQyuKJUDmnq8Y6voBoYACC9eE+B1YcEdzC74CpuPxzTAoc1OXRXutk=
X-Received: by 2002:a2e:8946:: with SMTP id b6mr4082379ljk.1.1578516144546;
 Wed, 08 Jan 2020 12:42:24 -0800 (PST)
MIME-Version: 1.0
References: <001f1181-615a-fcbe-de30-5792a1f1f318@phptrix.de>
 <719c82c2904741b58691ec5896d5b116@EX13D32EUC003.ant.amazon.com>
 <fc34ad12-aa99-e7ec-ab67-9313cb6fe30b@phptrix.de>
In-Reply-To: <fc34ad12-aa99-e7ec-ab67-9313cb6fe30b@phptrix.de>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 8 Jan 2020 15:42:13 -0500
Message-ID: <CAKf6xpsCcMk4b5bYPV+GiyGg-JrsY97P2tjFhqraT38GKEdzFw@mail.gmail.com>
To: Steffen Einsle <einsle@phptrix.de>
Subject: Re: [Xen-devel] [...], USB-passthru only works with qemu-traditional
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, "Durrant,
 Paul" <pdurrant@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gNywgMjAyMCBhdCAyOjM2IFBNIFN0ZWZmZW4gRWluc2xlIDxlaW5zbGVAcGhw
dHJpeC5kZT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IHlvdSdyZSBwcm9iYWJseSByaWdodCBhYm91
dCB0aGUgbWFsZm9ybWVkIGNvbW1hbmRsaW5lIGZvciBVU0ItcGFzc3RocnU6Cj4gV2l0aCB1cHN0
cmVhbSBxZW11IEkgZ2V0Cj4KPiBxZW11LXN5c3RlbS14ODZfNjQ6IC11c2JkZXZpY2UgdGFibGV0
OiAnLXVzYmRldmljZScgaXMgZGVwcmVjYXRlZCwKPiBwbGVhc2UgdXNlICctZGV2aWNlIHVzYi0u
Li4nIGluc3RlYWQKPiBxZW11LXN5c3RlbS14ODZfNjQ6IC11c2JkZXZpY2UgaG9zdDowZDQ2OjMw
MDM6ICctdXNiZGV2aWNlJyBpcwo+IGRlcHJlY2F0ZWQsIHBsZWFzZSB1c2UgJy1kZXZpY2UgdXNi
LS4uLicgaW5zdGVhZAo+IHFlbXUtc3lzdGVtLXg4Nl82NDogLXVzYmRldmljZSBob3N0OjBkNDY6
MzAwMzogY291bGQgbm90IGFkZCBVU0IgZGV2aWNlCj4gJ2hvc3Q6MGQ0NjozMDAzJwoKUUVNVSAo
YXMgb2YgMi4xMj8pIG5vIGxvbmdlciBwYXJzZXMgJ2hvc3Q6MGQ0NjozMDAzJy4gIFlvdSBuZWVk
IHRvCnN1cHBseSBhcmd1bWVudHMgbGlrZSB0aGlzOgotZGV2aWNlIHVzYi1ob3N0LHZlbmRvcmlk
PTB4MGQ0Nixwcm9kdWN0aWQ9MHgzMDAzCgpxZW11LXN5c3RlbS14ODZfNjQgLWRldmljZSBxZW11
LXhoY2kgLWRldmljZQp1c2ItaG9zdCx2ZW5kb3JpZD0weDBkNDYscHJvZHVjdGlkPTB4MzAwMwoK
bGlieGwgbmVlZHMgdG8gYmUgbW9kaWZpZWQgdG8gY2hhbmdlIHRoZSBhcmd1bWVudHMuICBZb3Ug
Km1pZ2h0KiBiZQphYmxlIHRvIHNuZWFrIGFyb3VuZCBpdCBieSBzZXR0aW5ncwpkZXZpY2VfbW9k
ZWxfYXJncz1bIi1kZXZpY2UKdXNiLWhvc3QsdmVuZG9yaWQ9MHgwZDQ2LHByb2R1Y3RpZD0weDMw
MDMiXSBhbmQgZHJvcHBpbmcgdGhlIGhvc3QKZGV2aWNlIGZyb20gdXNiZGV2aWNlLgpJdCBtYXkg
bmVlZCB0byBiZQpkZXZpY2VfbW9kZWxfYXJncz1bIi1kZXZpY2UiLCJ1c2ItaG9zdCx2ZW5kb3Jp
ZD0weDBkNDYscHJvZHVjdGlkPTB4MzAwMyJdCmlmIHNwYWNlcyBpbiBhcmd1bWVudHMgYXJlbid0
IGhhbmRsZWQgcHJvcGVybHkuCgpSZWdhcmRzLApKYXNvbgoKPiBJJ20gbm90IHF1aXRlIHN1cmUg
aWYgdGhpcyBldmVyIHdvcmtlZCAod2l0aG91dCB0cmFkKSwgYnV0IGlmIGl0IGRpZCwgaXQKPiB3
YXMgc29tZSB5ZWFycyBhZ28uLi4gcGVyaGFwcyBhdCB0aGUgdGltZXMgb2YgeGVuIDQuMSA/Cj4K
Pgo+IEFtIDA2LjAxLjIwMjAgdW0gMTE6MjMgc2NocmllYiBEdXJyYW50LCBQYXVsOgo+ID4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPj4gRnJvbTogd2luLXB2LWRldmVsIDx3aW4tcHYt
ZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmCj4gPj4gT2YgU3Rl
ZmZlbiBFaW5zbGUKPiA+PiBTZW50OiAwNSBKYW51YXJ5IDIwMjAgMDA6NDQKPiA+PiBUbzogd2lu
LXB2LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gPj4gU3ViamVjdDogW3dpbi1wdi1kZXZl
bF0gRHJpdmVyIDkuMC4wIG5vIGtleWJvYXJkIGluIHZuY3ZpZXdlciwgVVNCLQo+ID4+IHBhc3N0
aHJ1IG9ubHkgd2l0aCBxZW11LXRyYWRpdGlvbmFsCj4gPj4KPiA+PiBIZWxsbywKPiA+Pgo+ID4+
IEkganVzdCBpbnN0YWxsZWQgYSBXaW5kb3dzIDIwMTkgU2VydmVyIHdpdGggdGhlIG5ldyA5LjAu
MCBQViBkcml2ZXJzCj4gPj4gdW5kZXIgeGVuIDQuMTIuMS4gSSB1c2UgZ2VudG9vIGFuZCBzaW5j
ZSBJIG5lZWQgdXNiLXBhc3N0aHJ1IEkgaGF2ZSB0bwo+ID4+IHVzZSB0aGUgcWVtdS10cmFkaXRp
b25hbCB1c2VmbGFnIChvciBkZXZpY2VfbW9kZWxfdmVyc2lvbiA9Cj4gPj4gJ3FlbXUteGVuLXRy
YWRpdGlvbmFsJykuCj4gPj4KPiA+PiAtIFVTQi1wYXNzdGhydSB3b3JrcyBvbmx5IHdpdGggcWVt
dS10cmFkaXRpb25hbAo+ID4gICAgVGhhdCBzZWVtcyBvZGQsIGJ1dCBJIGd1ZXNzIG5vciBtYW55
IHBlb3BsZSB1c2UgVVNCIHBhc3N0aHJ1IHNvIGl0IGNvdWxkIGhhdmUgZ290IGJyb2tlbiB3aXRo
IHVwc3RyZWFtIHNvbWV3aGVyZSBhbG9uZyB0aGUgd2F5Lgo+ID4+IElzIHRoZXJlIGEgZ2VuZXJh
bCB0cmljayB0byBnZXQgVVNCLXBhc3N0aHJ1IHdvcmtpbmcgd2l0aCBxZW11LXhlbj8KPiA+PiAo
d2l0aG91dCBxZW11LXRyYWRpdGlvbmFsIG15IHVzYmRldmljZSA9IFsndGFibGV0JywgJ2hvc3Q6
MGQ0NjozMDAzJ10KPiA+PiBwcmV2ZW50cyBkb211IGNyZWF0aW9uIC0gZGV2aWNlLW1vZGVsLWV4
aXRlZC1lcnJvcikKPiA+ICAgIEkgdGhpbmsgdGhhdCBpcyBwcm9iYWJseSBzb21ldGhpbmcgdG8g
cG9zdCBvbiB4ZW4tdXNlcnMgb3IgeGVuLWRldmVsLiBIYXZlIHlvdSBldmVyIGhhZCBVU0IgcGFz
c3Rocm91Z2ggd29ya2luZyB3aXRoIHVwc3RyZWFtIFFFTVU/IFRoZXJlJ3Mgbm90aGluZyBhdCBo
dHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9YZW5fVVNCX1Bhc3N0aHJvdWdoIHRvIHN1
Z2dlc3QgaXQgaXMgb25seSBzdXBwb3J0ZWQgdXNpbmcgdHJhZCBzbyBpZiBpdCBpcyBicm9rZW4g
aXQgbmVlZHMgZml4aW5nLiBXaGF0IGRvZXMgeW91ciBxZW11IGxvZyAodW5kZXIgL3Zhci9sb2cv
eGVuKSBzYXkgd2FzIHRoZSByZWFzb24gZm9yIGZhaWx1cmU/IChJJ20gZ3Vlc3NpbmcgaXQgd2Fz
IHByb2JhYmx5IG1hbGZvcm1lZCBjb21tYW5kIGxpbmUsIHdoaWNoIHdvdWxkIG1lYW4gdGhlcmUn
cyBhIGJ1ZyBpbiBsaWJ4bCkuCj4gPiBQYXVsCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
