Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D221AE72A0
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 14:31:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP53E-00072Y-K7; Mon, 28 Oct 2019 13:27:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8VQ8=YV=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iP53C-00072T-Lp
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 13:27:14 +0000
X-Inumbo-ID: a6d32f90-f986-11e9-bbab-bc764e2007e4
Received: from mail-pf1-x443.google.com (unknown [2607:f8b0:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6d32f90-f986-11e9-bbab-bc764e2007e4;
 Mon, 28 Oct 2019 13:27:13 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id v19so6888114pfm.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 06:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5+WJQGmZzCRHA5BKqQRZUjmAxd0ypOSBRBP6BPAq6ZM=;
 b=H+un9DAuUEeLEdfPOSdXf87GFp6pxhtBnzcVWBrPHRBdMxz0hEKI2UcFXkxUnMSMpg
 l/w50BpkeuybD0KQsn2QdkSpReMCXu2iMWLKxcabYAHn2cY2628pkEJ0Ym++k7G9tebU
 c4dCReEog1Ca8J4oRlCtCciboOfznzsktjKHFxizHYObGgx/HmEWNFnU+3TevwFBcFU3
 6yUjc9CiV1OENb84XG/BokovuYLRIWaGo0VSrRtQJSLxZxVNhq2lf+V9pC8QrVtNhyJO
 Bq1XHvjPo1IRpiliSibjnIVsS1CTsCeUTi3aeStCzlQ0UVMChpH7N2Xl1w3Q2D/hQdKQ
 7dTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5+WJQGmZzCRHA5BKqQRZUjmAxd0ypOSBRBP6BPAq6ZM=;
 b=P439BvwWPN0F1K3RZNuZziDQbP6zlamUP/Z6GxODr+IUcANcyqFo1ka7DRZ/AOXHGk
 Dv8aFT3SrtqgS4Lnd0kycWVlqDxZ5FaUdMzpL/hJvIxQhX9X1nR4CNlFprqZeE2CaW+Y
 bqmShFCUn7OBSZKMA3uLaiG7MkjuMss67ADL8J9rcC2ps3jDYsAQ7YZB/QtGYg0pA7ro
 jeOcXIH9jvwNFm+llWi7E6AntHLU9pPVD10OezrO24/aOvyQ+80L3SmcU7ou6WteGJs8
 f6B/AH/JdzlOpKO25rExVknVOoyqD1xCEAIxVuzwlJ9xTabzXtNXYCfMx2Thf8+SyTk4
 F4nA==
X-Gm-Message-State: APjAAAWb+EepBMOgqRgQ7W0OY1LG4pQFp499uiMGUvkpS3sU/LQ5mvBR
 i6YolpNGqnDoqlyDOH8ddc/a/+jjC3tXjitABbI=
X-Google-Smtp-Source: APXvYqx7+pGKE4j4KKValx0urJ3W83D/tdCNjcuZLQyW7mZLSdGgnkXIgJRMgZru3xL3wDAzl7oGPo1lzQhwt6HKgA4=
X-Received: by 2002:a63:cf4d:: with SMTP id b13mr20479704pgj.396.1572269232555; 
 Mon, 28 Oct 2019 06:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <20191024142103.962-1-paul@xen.org>
 <20191028122956.GA2381@perard.uk.xensource.com>
In-Reply-To: <20191028122956.GA2381@perard.uk.xensource.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Mon, 28 Oct 2019 13:27:01 +0000
Message-ID: <CACCGGhDgCT2vchwNSjnGF2FORg+stg2CRTFERbL3PERBMfQ4JA@mail.gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [Xen-devel] [PATCH] tools/hotpug: only attempt to call 'ip
 route' if there is valid command
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
 Paul Durrant <pdurrant@amazon.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyOCBPY3QgMjAxOSBhdCAxMjozMCwgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDM6MjE6
MDNQTSArMDEwMCwgcGF1bEB4ZW4ub3JnIHdyb3RlOgo+ID4gRnJvbTogUGF1bCBEdXJyYW50IDxw
ZHVycmFudEBhbWF6b24uY29tPgo+ID4KPiA+IFRoZSB2aWYtcm91dGUgc2NyaXB0IHNob3VsZCBv
bmx5IGNhbGwgJ2lwIHJvdXRlJyB3aGVuICdpcGNtZCcgaGFzIGJlZW4KPiA+IHNldCwgb3RoZXJ3
aXNlIGl0IHdpbGwgZmFpbCBkdWUgdG8gYW4gaW5jb3JyZWN0IGNvbW1hbmQgc3RyaW5nLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiA+
IC0tLQo+ID4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+ID4g
Q2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPgo+ID4gVGhpcyBhcHBlYXJzIHRv
IGhhdmUgYmVlbiBicm9rZW4gZm9yZXZlci4KPgo+IE9yIHByb2JhYmx5IHNpbmNlIGMwZWZiOGRj
ODUyODA1ZmQ0ZDNjMjY5MWFjYTFmNmM1MmY2YjZhYzcsIDEzIHllYXJzCj4gYWdvLgo+CgpNYXli
ZS4gVGhlIGhlcml0YWdlIGlzIG5vdCBhbGwgdGhhdCBjbGVhci4KCj4gPiAtLS0KPiA+ICB0b29s
cy9ob3RwbHVnL0xpbnV4L3ZpZi1yb3V0ZSB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvaG90
cGx1Zy9MaW51eC92aWYtcm91dGUgYi90b29scy9ob3RwbHVnL0xpbnV4L3ZpZi1yb3V0ZQo+ID4g
aW5kZXggYzE0OWZmY2E3My4uOTg4OTNkOTBiNiAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL2hvdHBs
dWcvTGludXgvdmlmLXJvdXRlCj4gPiArKysgYi90b29scy9ob3RwbHVnL0xpbnV4L3ZpZi1yb3V0
ZQo+ID4gQEAgLTM1LDcgKzM1LDcgQEAgY2FzZSAiJHtjb21tYW5kfSIgaW4KPiA+ICAgICAgICAg
IDs7Cj4gPiAgZXNhYwo+ID4KPiA+IC1pZiBbICIke2lwfSIgXSA7IHRoZW4KPiA+ICtpZiBbICIk
e2lwY21kfSIgXSA7IHRoZW4KPgo+IFRoZSBjb21taXQgbWVzc2FnZSBhbmQgdGhpcyBuZXcgY29u
ZGl0aW9uIGRvZXNuJ3QgcmVhbGx5IGV4cGxhaW4gd2hhdCBpcwo+IGhhcHBlbmluZy4KCkl0IGtp
bmQgb2YgZG9lcywgYnV0IG1heWJlIG5vdCB3aXRoIHRoZSBzdGFuZGFyZCBjb250ZXh0LiBMb29r
aW5nIGF0CnRoZSB3aG9sZSBmaWxlIGl0IGRvZXMgYXBwZWFyIHRvIGJlIHRoZSBpbnRlbnRpb24g
dGhhdCB0aGUgY2xhdXNlIGlzCm9ubHkgaW52b2tlZCB3aGVuIGlwY21kIGlzIHNldCwgYW5kIGl0
IHdhcyBwcm9iYWJseSB0eXBvZWQuIEkgY2FuIGFkZApzb21lIG1vcmUgZXhwbGFuYXRpb24gdGhv
dWdoLgoKPiBEb2VzIHRoYXQgbWVhbnMgd2Ugb25seSBuZWVkIHRvIHJ1biBgaXAgcm91dGVgIHdo
ZW4gY29tbWFuZCBpcyAnb25saW5lJwo+IG9yICdvZmZsaW5lJz8gSXMgdGhlcmUgc29tZXRoaW5n
IGVsc2UgdG8gZG8gJ2FkZCcgYW5kICdyZW1vdmUnPwo+CgpFbXBpcmljYWxseSBvbmxpbmUvb2Zm
bGluZSBhcHBlYXIgdG8gYmUgdXNlZCBmb3IgUFYgaW50ZXJmYWNlcyBhbmQKYWRkL3JlbW92ZSBm
b3IgZW11bGF0ZWQgaW50ZXJmYWNlcy4gSSBkbyBhY3R1YWxseSBoYXZlIGEgbmV3ZXIgdmVyc2lv
bgpvZiB0aGUgc2NyaXB0IG5vdyB0aGF0IGFkZHMgYSByb3V0ZSBtZXRyaWMgYW5kIGhhbmRsZXMg
YWRkL3JlbW92ZSBzdWNoCnRoYXQgdGhlIGVtdWxhdGVkIGludGVyZmFjZSBnZXRzIGEgaGlnaGVy
IHByaW9yaXR5Li4uIHNvIGl0IGlzIHVzZWQKdW50aWwgdGhlIGd1ZXN0IHRyaWdnZXJzIGFuIHVu
cGx1Zy4gSSBuZWVkIHRvIGRvIHNvbWUgbW9yZSB0ZXN0aW5nIGFuZApJJ2xsIHNlbmQgdGhhdCBh
cyB2MiBvbmNlIEknbSBkb25lLgoKICBDaGVlcnMsCgogICAgUGF1bAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
