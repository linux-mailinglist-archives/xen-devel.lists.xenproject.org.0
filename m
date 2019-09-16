Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F277BB39FC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 14:07:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9pjc-0008MP-SE; Mon, 16 Sep 2019 12:04:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KvKu=XL=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1i9pZr-00079S-DV
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 11:53:55 +0000
X-Inumbo-ID: 9faa33a0-d878-11e9-b299-bc764e2007e4
Received: from mail-pl1-x644.google.com (unknown [2607:f8b0:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9faa33a0-d878-11e9-b299-bc764e2007e4;
 Mon, 16 Sep 2019 11:53:40 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id f19so16791836plr.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 04:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZW3eIdpP19Zgv0/L4FgrI+Syb8QuMMvgAXdK6GwR5zY=;
 b=g/hXGfiIxNktr6NqtKUxl6+4AAf+YxDRnh0iXT7gfZOVoCsdtplVsyQG2jP4MxOqbI
 pVcR6SHPZqfedu7pzd5ijt+qyVEO5qY9kHRZ91QwgHu1VnulS9LBFwoq0/3j/YtkmZpW
 O+s+v/LfZZmue7GqSx1eWI08E2mhOjeo3SncZt8LOCeY4sDpeFA6+iVdgNAVGuMOXiZh
 12JFc1Uf+0SnDwELsLdoTE+PK0yCAFKlkqUTxCsZATJwC9jEBlmr/5A3juZXQ9eDLu4J
 SwNKMBEg4mgP+rCZ5AUSXLAlSXv6NKeAx+fc7rXWBsNNip6rXK3CBq8Lbtvpz+bx7Cdn
 4l2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZW3eIdpP19Zgv0/L4FgrI+Syb8QuMMvgAXdK6GwR5zY=;
 b=jKdwtO9U6Hb506msUGEh8ftZ+S6aKrHg1ulsZnKX1AJvtf9Wc7AXmjdai2t6Fzur7Z
 PtrFi4j/ri7BGvpXT7lqBCuHJgtXmCKKnXoQUleOSYlwR0x4xYzeJTPd1U75whoyY3UV
 egrI0BTbSE+3aO376ZZZ+x5fHnNLrnrkF3E28/ZUxkvEgV+p1DwY/tjPrhdRxtPA4SMd
 LKxifgpxoB4nVuj8Dpf0o33c9NKj6bsp+KBf2yRDcDa/hqHrOyf3XCUEBhzEql1IjxCP
 R1aHU3Cloy4TV0eFgt+HVWO4IOKCrcDC1xKYTvp26O6JuzPKewDoIAZ6wgaACKgA+Ki4
 bNpA==
X-Gm-Message-State: APjAAAWvKDztKHwLmVDb6908+JXDk4/E7gz3wnOzOEl4taqNwAta5RL2
 +neBlkmEctr+mGuDLewQXymZvD4h0UzjPL/vwi4=
X-Google-Smtp-Source: APXvYqya9m1Lpn19FpnQTqXcWhNdglRw4D1B5brDaDo21g+NZSLbiMbQd8493KBmHzFyHqLk9qBA6Ek6ycPotzBZ/Ig=
X-Received: by 2002:a17:902:9001:: with SMTP id
 a1mr55464107plp.148.1568634819298; 
 Mon, 16 Sep 2019 04:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAKan5DCdRvofdAWaL3js9wmWBsiKWt9DAyguOpy0qv=33tdUwQ@mail.gmail.com>
 <6b9d7429-7dc5-476d-afda-bb3f196c804f@arm.com>
 <20190916103858.kovwuktf7ce52vw7@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
In-Reply-To: <20190916103858.kovwuktf7ce52vw7@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
From: Paul Durrant <pdurrant@gmail.com>
Date: Mon, 16 Sep 2019 12:53:27 +0100
Message-ID: <CACCGGhCPUpqtf0CjmpJBBebymMFrjKhKyX3o5NZ3pP5C7qQ2Pg@mail.gmail.com>
To: Wei Liu <wl@xen.org>
X-Mailman-Approved-At: Mon, 16 Sep 2019 12:04:00 +0000
Subject: Re: [Xen-devel] Looking for Semester long Project
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, paul@xen.org,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Julian Tuminaro <jtuminar@andrew.cmu.edu>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSB0aGluayBLREQgaXMgc3RpbGwgYSB3b3J0aHkgdGhpbmcgdG8gZG8sIHBhcnRpY3VsYXJseSBp
biBsaWdodCBvZgpodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwv
MjAxNy0xMi9tc2cwMTcyMy5odG1sCih3aGljaCBpcyBhYm91dCB0aGUgbW9zdCByZWNlbnQgcmVm
IEkgY291bGQgZmluZCwgYW5kIEkgZG9uJ3Qga25vdwp3aGF0IGhhcHBlbmVkIHRvIHRoZSBjb2Rl
IGFmdGVyIHRoYXQpLiBBRkFJSywgdGhlIGJpZ2dlc3QgY2hhbGxlbmdlIGlzCmdldHRpbmcgcm91
bmQgV2luZG93cycgS0FTTFI7IGl0IG1heSBiZSBuZWNlc3NhcnkgdG8gaGF2ZSBzb21lIHNvcnQg
b2YKZHJpdmVyIGluIHRoZSBndWVzdCB0byBnZXQgdGhlIG5lY2Vzc2FyeSBpbmZvLiBvdXQgYnV0
IHRoYXQgc2hvdWxkbid0CmJlIHRvbyBoYXJkIHRvIGltcGxlbWVudC4KCiAgQ2hlZXJzLAoKICAg
IFBhdWwKCk9uIE1vbiwgMTYgU2VwIDIwMTkgYXQgMTE6MzksIFdlaSBMaXUgPHdsQHhlbi5vcmc+
IHdyb3RlOgo+Cj4gSGkgSnVsaWFuCj4KPiBGb3IgdGhlIEtERCByZWxhdGVkIHByb2plY3QgSSBo
YXZlIENDJ2VkIFBhdWwuCj4KPiBJIGhhdmUgZ2F0aGVyZWQgc29tZSBpZGVhcyBmb3IgY2xlYW5p
bmcgdXAgaHlwZXJ2aXNvciBjb2RlIGJ1dCB0aGV5IGFyZQo+IG9mIGxvd2VyIGRpZmZpY3VsdHkg
Y29tcGFyZWQgdG8gb3RoZXIgcHJvamVjdHMuIFRoZXkgYXJlIGRlZmluaXRpdmVseQo+IG5vdCBh
cyBmdW4gYXMgdGhlIG90aGVycy4gOy0pCj4KPiBXZWkuCj4KPiBPbiBNb24sIFNlcCAwOSwgMjAx
OSBhdCAwODo1ODo1MUFNICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiArQW5kcmV3LCBM
YXJzLCBTdGVmYW5vIGFuZCBXZWkKPiA+Cj4gPiBPbiA5LzUvMTkgMTE6MjMgUE0sIEp1bGlhbiBU
dW1pbmFybyB3cm90ZToKPiA+ID4gSGksCj4gPgo+ID4gSGVsbG8sCj4gPgo+ID4gVGhhbmsgeW91
IGZvciB5b3UgaW50ZXJlc3Qgb24gWGVuLiBJIGhhdmUgQ0NlZCBmZXcgbW9yZSBwZXJzb24gdGhh
dCBzaG91bGQKPiA+IGJlIGFibGUgdG8gYW5zd2VyIHlvdXIgcXVlc3Rpb25zIGJlbG93Lgo+ID4K
PiA+ID4KPiA+ID4gV2UgKGEgZ3JvdXAgb2YgMiBzdHVkZW50cykgYXJlIGludGVyZXN0ZWQgaW4g
ZG9pbmcgYSBoeXBlcnZpc29yIHJlbGF0ZWQKPiA+ID4gcHJvamVjdCBmb3IgdGhlIG5leHQgMTAt
MTIgd2Vla3MgYXMgcGFydCBvZiBvbmUgb2Ygb3VyIGNvdXJzZXMgdGhpcwo+ID4gPiBzZW1lc3Rl
ci4gV2UgaGF2ZSB0YWtlbiBhIGxvb2sgYXQgdGhpcyB5ZWFyJ3MgR1NvQyBwcm9qZWN0IGxpc3QK
PiA+ID4gKGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL091dHJlYWNoX1Byb2dyYW1f
UHJvamVjdHMpLiBXZSB3ZXJlCj4gPiA+IGludGVyZXN0ZWQgaW4gbGVhcm5pbmcgbW9yZSBhYm91
dCB0aGUgIktERCAoV2luZG93cyBEZWJ1Z2dlciBTdHViKQo+ID4gPiBlbmhhbmNlbWVudHMiIHBy
b2plY3QgYW5kIFhlbiBvbiBBUk0gYmFzZWQgcHJvamVjdHMuIFlldCwgb24gaXJjIHdlIHdlcmUK
PiA+ID4gdG9sZCB0aGF0IHRoaXMgbGlzdCBpcyBvdXRkYXRlZC4gSWYgdGhlcmUgYXJlIGFueSBv
dGhlciBwcm9qZWN0Cj4gPiA+IHN1Z2dlc3Rpb25zIG9yIGxpc3QsIHdlIHdvdWxkIGJlIGludGVy
ZXN0aW5nIGluIGxlYXJuaW5nIG1vcmUgYWJvdXQKPiA+ID4gdGhlbS4KPiA+IFRoZSBsaXN0IG9m
IHByb2plY3RzIGZvciBYZW4gb24gQXJtIGlzIG1vc3RseSB1cGRhdGUtdG8tZGF0ZS4gVGhlIG9u
bHkKPiA+IHByb2plY3Qgd2hlcmUgc29tZSBwcm9ncmVzcyBoYXMgYmVlbiBtYWRlIHNvIGZhciBp
cyAiWGVuIG9uIEFSTTogZHluYW1pYwo+ID4gdmlydHVhbCBtZW1vcnkgbGF5b3V0Ii4KPiA+Cj4g
PiBJIHdvdWxkIGJlIGhhcHB5IHRvIGdvIGluIG1vcmUgZGV0YWlscyBmb3IgYW55IHRob3NlIHBy
b2plY3RzIGlmIHlvdSBhcmUKPiA+IGludGVyZXN0ZWQuCj4gPgo+ID4gPgo+ID4gPiBBbmRyZXcg
Q29vcGVyIHN1Z2dlc3RlZCBvbiBpcmMgdGhlIGZvbGxvd2luZyBwcm9qZWN0OiBDb250ZXh0IFN3
aXRjaGluZwo+ID4gPiB3aXRoIENSMC5UUyBpbiBIVk0gR3Vlc3QuIFdlIHdvdWxkIGxpa2UgdG8g
cG9zc2libGUga25vdyBtb3JlIGFib3V0IHRoaXMKPiA+ID4gcHJvamVjdCBpbiB0ZXJtcyBvZiBk
aWZmaWN1bHR5LCBwb3RlbnRpYWwgZXN0aW1hdGUgb24gdGltZSByZXF1aXJlZC4KPiA+ID4gQW5k
cmV3IGFsc28gbWVudGlvbmVkIGEgc2xpZ2h0ZXIgYmlnZ2VyIHhlbi9saW51eCBwcm9qZWN0IGFu
ZCB3ZSB3b3VsZAo+ID4gPiBsaWtlIHRvIGtub3cgbW9yZSBkZXRhaWwgYWJvdXQgdGhpcyBvbmUg
YXMgd2VsbC4KPiA+Cj4gPiBDaGVlcnMsCj4gPgo+ID4gLS0KPiA+IEp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
