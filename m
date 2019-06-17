Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D997E487F8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 17:54:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hctvY-0001Sv-Sw; Mon, 17 Jun 2019 15:52:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CmRm=UQ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hctvX-0001So-Ia
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 15:52:11 +0000
X-Inumbo-ID: dcd970ae-9117-11e9-b041-479ea07c8739
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcd970ae-9117-11e9-b041-479ea07c8739;
 Mon, 17 Jun 2019 15:52:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1560786729; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=+MW5alBvVQYOSqJ1G1sw9xXelU5Dctqns0KoyvOoA7Y=;
 b=AL9kEZfYDmK6rMkhBeSeF/d+9e2rM/TPig6IhA+ch+XlbR7uBm1kSlgHAStu3I9F+W3Ex02z
 MA4cOBnKTmFhD59RUGMLTk64bzQLXXEHpkiYPQQeralXjFXzeo6ptDy4xRMy9Tnq/JALH1fv
 h8FX27sublmuQkVEQvAoE4h+Rbs=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mxa.mailgun.org with ESMTP id 5d0785eb.7f08468d42f0-smtp-out-n01;
 Mon, 17 Jun 2019 12:22:03 -0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id d18so9733813wrs.5
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2019 05:22:03 -0700 (PDT)
X-Gm-Message-State: APjAAAWSE7rhebTRII6HGlHntFPmYK4wl2ysbTs3Z/u5YUDlEC6otgD5
 uA6g9laPbYKSwt5x2qlQ2aMHr0MOBezrUZWJCew=
X-Google-Smtp-Source: APXvYqxbOCg/mJ5V0zPslkSwql9ZQbTUniTW9A/qBSj7g/Wt+vi+eDi3ip/HgSbpKJ17i6Y2YaNPy5kLEXTnw6Sw/t8=
X-Received: by 2002:a5d:4d84:: with SMTP id b4mr24114729wru.242.1560774122154; 
 Mon, 17 Jun 2019 05:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190516213752.1701-1-tamas@tklengyel.com>
 <20190516213752.1701-2-tamas@tklengyel.com>
In-Reply-To: <20190516213752.1701-2-tamas@tklengyel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 17 Jun 2019 14:21:25 +0200
X-Gmail-Original-Message-ID: <CABfawhkQ4Lm3UFU5gGqW71eu0Z-8Ya8R5h-Yq3J6A-cvhSiS4A@mail.gmail.com>
Message-ID: <CABfawhkQ4Lm3UFU5gGqW71eu0Z-8Ya8R5h-Yq3J6A-cvhSiS4A@mail.gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] [PATCH v5 2/4] x86/mem_sharing: copy a page_lock
 version to be internal to memshr
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6MzggUE0gVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0
a2xlbmd5ZWwuY29tPiB3cm90ZToKPgo+IFBhdGNoIGNmNGIzMGRjYTBhICJBZGQgZGVidWcgY29k
ZSB0byBkZXRlY3QgaWxsZWdhbCBwYWdlX2xvY2sgYW5kIHB1dF9wYWdlX3R5cGUKPiBvcmRlcmlu
ZyIgYWRkZWQgZXh0cmEgc2FuaXR5IGNoZWNraW5nIHRvIHBhZ2VfbG9jay9wYWdlX3VubG9jayBm
b3IgZGVidWcgYnVpbGRzCj4gd2l0aCB0aGUgYXNzdW1wdGlvbiB0aGF0IG5vIGh5cGVydmlzb3Ig
cGF0aCBldmVyIGxvY2tzIHR3byBwYWdlcyBhdCBvbmNlLgo+Cj4gVGhpcyBhc3N1bXB0aW9uIGRv
ZXNuJ3QgaG9sZCBkdXJpbmcgbWVtb3J5IHNoYXJpbmcgc28gd2UgY29weSBhIHZlcnNpb24gb2YK
PiBwYWdlX2xvY2svdW5sb2NrIHRvIGJlIHVzZWQgZXhjbHVzaXZlbHkgaW4gdGhlIG1lbW9yeSBz
aGFyaW5nIHN1YnN5c3RlbQo+IHdpdGhvdXQgdGhlIHNhbml0eSBjaGVja3MuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpQYXRjaCBwaW5n
LiBDdXJyZW50IHRhbGx5OgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KClRoYW5rcywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
