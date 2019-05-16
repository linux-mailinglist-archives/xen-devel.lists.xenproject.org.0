Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8514821335
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 06:43:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRUfT-0007pD-CA; Fri, 17 May 2019 04:40:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pg8o=TQ=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1hRM5o-0007nn-AP
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 19:31:04 +0000
X-Inumbo-ID: 23a6c9c8-7811-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 23a6c9c8-7811-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 19:31:02 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id n22so3496474lfe.12
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 12:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5zTGu/k/A+AUmiIvEtxDc/znuYX0jWRygQckn6BCkec=;
 b=oxOI5UGer+byqxEu0600m34aSHi+EntAVbNuclSUVza14ZW8KZ1OBbzoeEGAtrT2xr
 SvdoXn+YORu0JCywp9zamacg9WrZOqCWfRRw/wiklRTZH91erYEDVfPpFuz8GwDhQFeI
 EFFZFqzGtxpBS9x5kumpY2RUsR+1n5tNWFxpC+6UhTL3Alp+kMcEk+RhsmrUXg5sBDUH
 cIShyYLzQqNJZIRGgHs8c4Pm4FMdU96xOMIC57V7TorpKvwgO4KHzACc9IUZuM/ECnF0
 w5hsmFo12jzUHfiN4HuuUvH73wiUOmijQw8o4zshs3ZTNruhJLMnVHvIf5+Ms3tMrn24
 Dhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5zTGu/k/A+AUmiIvEtxDc/znuYX0jWRygQckn6BCkec=;
 b=qsiTj+IJlInsH2ghAOEtkC66a+bM7GqMJ/pBljvEOw6kBZ2vCcE0lucJ4pEEQJ2cQn
 rSwaBqLOuNrTSTbI3lAl9WR7u/TgI7T5pZ6bLAbn3e+tb4WmgfcxVKIlBCyAqQFpkxoR
 n31LYHKhi4PU1YGlyR0Bbwk4dfvIPleg+JsMMcYipRLDOXHnL0TPIPNdQm6vU0cWKUum
 YWYXgeBenHcW/9p/6FEFdwAC4SFkYdsOl5scLCZ+LxNFKgtnNaiGNwshsV8AdEqFRuDb
 GXBuECg74f49Rv2etpMIWdrYNyxeETRhmbwsH1YbzEWYHiP7WSj/SmXas9thnwRbleoA
 nrng==
X-Gm-Message-State: APjAAAUbAqob2THq0E0ZejmmJQ4xWMDOIvhX2r2evFres7OfoqK1OHBq
 ir31bei+H3HFoHOpLpwxsZPeipXopVdc0ogc9Dc=
X-Google-Smtp-Source: APXvYqyGsWTwOH2daI2gSoxwAV+U25RxU/mELxSUveFABVZJr6nPF1+CJ+/gMDg3PhBscvgSn10ffpZ1jrFz3nfrNGo=
X-Received: by 2002:a19:4a04:: with SMTP id x4mr24515966lfa.124.1558035060605; 
 Thu, 16 May 2019 12:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <20190516000212.13468-2-alistair.francis@wdc.com>
 <5CDD3C4B020000780022F8BE@prv1-mh.provo.novell.com>
In-Reply-To: <5CDD3C4B020000780022F8BE@prv1-mh.provo.novell.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 May 2019 12:30:34 -0700
Message-ID: <CAKmqyKPhUK9LDpJA8+H16uO4augfEHW+WdnBMjZzdwHa3dM8YA@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
X-Mailman-Approved-At: Fri, 17 May 2019 04:40:25 +0000
Subject: Re: [Xen-devel] [PATCH 2/3] xen/drivers/char: Don't require vpl011
 for all non-x86 archs
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
Cc: Wei Liu <wei.liu2@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMzozMiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDE2LjA1LjE5IGF0IDAyOjAyLCA8YWxpc3RhaXIuZnJh
bmNpc0B3ZGMuY29tPiB3cm90ZToKPiA+IE1ha2UgdGhlIGFzbS92cGwwMTEuaCBkZXBlbmRlbnQg
b24gdGhlIEFSTSBhcmNoaXRlY3R1cmUuCj4KPiBCdXQgd2Ugb25seSBoYXZlIHg4NiBhbmQgQXJt
IHJpZ2h0IG5vdy4gQSB3b3JkIG1vcmUgYWJvdXQKPiB5b3VyIG1vdGl2YXRpb24gd291bGQgaGVs
cC4KCkFzIHRoZSBjb2RlIGN1cnJlbnRseSBpcyBubyBvbmUgY2FuIGFkZCBhbm90aGVyIGFyY2hp
dGVjdHVyZS4gVGhpcyBpcwpqdXN0IGEgZ2VuZXJhbCBmaXh1cCBhcyBhc3N1bWluZyBYZW4gd2ls
bCBvbmx5IGV2ZXIgc3VwcG9ydCB0d28gYXJjaHMKc2VlbXMgc3RyYW5nZS4KCj4KPiBBbHNvIEkg
ZG9uJ3QgdGhpbmsgeW91ciBDYyBsaXN0IGlzIHdpZGUgZW5vdWdoIGZvciB0aGlzIGNoYW5nZS4K
CkkgY291bGRuJ3QgZmluZCBhbnlvdGhlciBwZW9wbGUgaW4gdGhlIE1BSU5UQUlORVJTIGZpbGUs
IHdobyBlbHNlIHNob3VsZCBJIENDPwoKQWxpc3RhaXIKCj4KPiBKYW4KPgo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
