Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C492778345
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 04:19:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hrvCS-0003Ce-DR; Mon, 29 Jul 2019 02:15:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i0K+=V2=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1hrvCQ-0003CZ-PM
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 02:15:42 +0000
X-Inumbo-ID: c2ecc70b-b1a6-11e9-8980-bc764e045a96
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c2ecc70b-b1a6-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 02:15:41 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p74so52330744wme.4
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jul 2019 19:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kCqN4wsbWhCkrSSwGp7++HN4lTvKCcncly/RXwv6PKQ=;
 b=LUlzVyv28qoJmtdxrHYaSYWbo2CAsZPr58vUy5vLv/E8leZIa2Yc8wP3qiz8HxqxtL
 XqYR8RyoW1ppmNfSg0baHGiQydhH9FK7fceqk+Lna/FFvE1nnVUpRZJ7lUym0eUdCFCL
 GDxrvv23GO0B/PprAhKgvnqxfaFfMgc7R56DxLn8sBHJ+1qrwG79RLhC10a0kigF8Ltj
 FUY1BdLyrEc2np14QYAk8qirqqzLChroX7APJbWiDmqFfNI5TjCKC4HkikFKkBWU63iI
 jeDL8X/Q3vLBpHsknYWemwVexHMw7Drtp3n0S94RZ45fOnhYffbFND953B0kOrEUvZoD
 fZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kCqN4wsbWhCkrSSwGp7++HN4lTvKCcncly/RXwv6PKQ=;
 b=tbeelj23SdaDnVgTrFd97VODWp6y2CztliL+m7/TZ+nns7o7QkxaIEtyvsF72PBO+K
 XCxJrjp5cy8Yy2PzDqV8e0pTif+d98F1/DmpUZZWmviX0mC+JK2FrDFqRKFV11u9JQ2E
 Yi9oMwzwCSAh6RHh6fjpP5Drhi8b/kA6TWfRrKWjHOx6Jo9v2+BYyMQpkA9MdM47080b
 1YiWpLmthpt/wqnZQRhtC8vfdlC4+HQOB5yW9n+VQ1slIkWd0vOaja6kGU3NOQGA3239
 m6MBPS7/tUzybbv4dWPb5Czi/3wvZTHulkEcCvR0npv4uqB8EC2CAXcVLvjOkZqcdg8g
 HCVg==
X-Gm-Message-State: APjAAAW3QDWntFzmsVuLwEazI1iFuo5pfKzmDHpITb/HX+PE4/+iAI78
 CtRI7RMY/A/BOC/Gc7KNEhb84dY9XAE4wxJQAcI=
X-Google-Smtp-Source: APXvYqw15deAeYLmgKPVfycHSFQM2JQvpmv2d1JSV29+KxWQKQU0b2LbGVT0nhF5Lx3fDKew4L4EwaORZZ85oWzMrIY=
X-Received: by 2002:a1c:ddc1:: with SMTP id
 u184mr93812972wmg.158.1564366540063; 
 Sun, 28 Jul 2019 19:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <CABwOO=dnXZSfaCAEB5COs4sT_tz-R8VTuuK_V_Nf60XpPQoS3A@mail.gmail.com>
 <4de7580d-5478-2b90-58da-1f7335f0154b@citrix.com>
 <alpine.LFD.2.21.1907222020280.2764@austen3.home>
In-Reply-To: <alpine.LFD.2.21.1907222020280.2764@austen3.home>
From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Date: Mon, 29 Jul 2019 10:15:28 +0800
Message-ID: <CABwOO=e4mh39a4RhddVWBbJWaB4q_v7cmTMcwJZNXwrwRPS0Bw@mail.gmail.com>
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
Subject: Re: [Xen-devel] pygrub, installed with Python 3,
 doesn't boot Xen DomU-s
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMyBKdWwgMjAxOSBhdCAwMzo0MywgWU9VTkcsIE1JQ0hBRUwgQS4gPG0uYS55b3Vu
Z0BkdXJoYW0uYWMudWs+IHdyb3RlOgoKPiA+IFllcyAtIHRoaXMgbG9va3MgbGlrZSBhIFB5IDIv
MyBjb21wYXRpYmlsaXR5IGlzc3VlLiAgVGhpcyBwYXJ0aWN1bGFyIG9uZQo+ID4gaXMgcmVsYXRl
ZCB0bwo+ID4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1jb21t
aXRkaWZmO2g9ZmY5MTVjOGNhY2MyNjRhZTEzODBkNTFmZWEwNzI2N2I4MzA4ZDdiYQo+ID4KPiA+
IEhvd2V2ZXIsIEkgY2FuJ3QgZXhwbGFpbiB3aHkgcHl0aG9uIGlzIGNvbXBsYWluaW5nIGF0IHN0
ci5zcGxpdCgpLgo+ID4gc3BsaXQoKSBpcyBhIHN0cmluZyBvcGVyYXRpb24sIG5vdCBhIGJ5dGVz
IG9wZXJhdGlvbi4KPgo+IEl0IGxvb2tzIGxpa2UgeW91IGFyZSBtaXNzaW5nIHRoZSBhYm92ZSBw
YXRjaCBhbmQgSSB0aGluayB5b3UgYWxzbyBuZWVkCj4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcv
Z2l0d2ViLz9wPXhlbi5naXQ7YT1jb21taXQ7aD00ODUwNzllODE2Nzg4ZDcwMTY5ZjQ1NTc5ZTFm
NWE4ZjkwOWRjMWIzCj4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7
YT1jb21taXQ7aD03NjdiYTM5N2QzNDg0OGM3ZTBjNGU5Y2RmYzVlZmE0ZTBjYjYxNDQyCj4gYW5k
IHBlcmhhcHMKPiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNv
bW1pdDtoPWE1N2ExYjI2ZWMwYWUzMWY5MjRjZjJiYmNmNDc5NjM3ZDAwN2JlNDQKPiBpZiB5b3Ug
YnVpbGQgd2l0aCBvY2FtbC4gQWN0dWFsbHkgdGhlIGZpcnN0IG9mIHRoZXNlIDMgcGF0Y2hlcyBp
cyBvcHRpb25hbAo+IGFzIGl0IGlzIGp1c3QgYW4gZXJyb3IgbWVzc2FnZSBjaGFuZ2UgYnV0IHNo
b3VsZCBhbGxvdyB0aGUgc2Vjb25kIHBhdGNoIHRvCj4gYXBwbHkgY2xlYW5seS4KPgo+ICAgICAg
ICAgTWljaGFlbCBZb3VuZwoKSnVzdCB0byBzYXkgdGhhdCwgb3ZlciB0aGUgd2Vla2VuZCwgSSBy
ZWJ1aWx0IHRoaW5ncyB1c2luZyBYZW4gY29tbWl0IGY3ZjdjZDUKYW5kIEkgbm93IGhhdmUgYSBY
ZW4gZW52aXJvbm1lbnQgIHRoYXQgYm9vdHMgbXkgZXhpc3RpbmcgRG9tMHMuCgpUaGFua3MgZm9y
IGFsbCB0aGUgcG9pbnRlcnMgdG8gdGhlIG9uZ29pbmcgd29yayBhcyByZWdhcmRzIHB5dGhpbjIt
PjMuCgpLZXZpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
