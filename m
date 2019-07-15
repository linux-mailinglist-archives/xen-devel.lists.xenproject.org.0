Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 452F8693C6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 16:47:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn2Du-000648-Vt; Mon, 15 Jul 2019 14:45:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wBjO=VM=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hn2Dt-000643-7e
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 14:45:01 +0000
X-Inumbo-ID: 1e98f272-a70f-11e9-8980-bc764e045a96
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1e98f272-a70f-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 14:44:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n9so17423395wrr.4
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2019 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rn93wQocMNzXwW5WK6UhbixmsxzafxoWRTa1TjHe2mM=;
 b=d3HPNnX2hVedGeWlKE8+kuoKurfvp8z2xN0Fduq2lkzlDShnekdF0TR0J34KCMda39
 K4d27GR/l+WGS7n1cBku0yykp++FMbCgaR1HcOBiMXwP8uOcXSjpBZ1CK1Fh6cLA5uNu
 gDzgRyhyN4MJRilseLk/x/Jv1W+Ly/XHIBd34bft0FzthkkE+QVOiJ02j0lP+ToFmB7M
 BB7A7Wuc43/JehZFfmCWr3+agqaOXPZhD3nDnnZMPM0O6gZcMjdlYRCGZSKlbxQMK61s
 ggwZdHX4luY7+fmdF8blY9EQkNPgT7waR1BkfeRVE7c/xv9gHy304HLDUHLi0ZERe857
 ThKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rn93wQocMNzXwW5WK6UhbixmsxzafxoWRTa1TjHe2mM=;
 b=ZMfSmGf86XUmoK52SYXfIa+j/GQurn1vK7ybxaXjZ3Eq8RDoOeNYUZEgKFwcRuis7n
 ogYfrtZfZr0MUNIwagC1iolHYCVwCPwAUXOIinTGXRYrX2jTU2/eUzv+YKKsS2VnqfSq
 UimS5QHXOCT8hRMLGMOBduwSqElJf7s4dGQftetJjMpEuNwaggh3rVdNTpeVJa+CTwNF
 MRYFPQVgBdLg2eQX47sfW9mNV1la5KucBP4uI5IAvq9cnYNz9H9bK9QoJCfUyI1uTbdJ
 GJdLjrfbPOuTeZOchkVh4hbDcSFZ80mFol2C5P00MMjlftc4gbxWjZBltd/cTVALQ9va
 rQ0Q==
X-Gm-Message-State: APjAAAWSpieJlIppby9u5N6qS2ee22DNil+BiW9+IWkls9YEmvO7x7kn
 YM6ZDlLRBsO5I3+ffdAjeQWq2g9CfjgeElmMGAc=
X-Google-Smtp-Source: APXvYqy1DK6nU1BuvPhPgXAoW/De+gkeQn6SXt2o/fxdQZM3VnkstwSodqsvz2MYHq9PJZv6lp6pxrj2DdvynVefVsE=
X-Received: by 2002:adf:ef8d:: with SMTP id d13mr28623928wro.60.1563201898637; 
 Mon, 15 Jul 2019 07:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <ef670212-8257-b960-a3cb-9363cf076033@suse.com>
 <CABfawhmHFWEQ36S6M0+M+Ls1fFJpvHRCN6+Q4Mn0_DrFQjOVPg@mail.gmail.com>
 <07f476c6-2f65-c6a6-7b80-9700816cbd54@suse.com>
In-Reply-To: <07f476c6-2f65-c6a6-7b80-9700816cbd54@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 15 Jul 2019 08:44:22 -0600
Message-ID: <CABfawhmDky6=sHsXRAD36Tz=kW5=rQSk9bb5Un3cxaO+6y55uQ@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] x86/dom0-build: fix build with clang5
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgODoxMyBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTUuMDcuMjAxOSAxNTo0MSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgNDozNiBBTSBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gV2l0aCBub24tZW1wdHkgQ09ORklHX0RP
TTBfTUVNIGNsYW5nNSBwcm9kdWNlcwo+ID4+Cj4gPj4gZG9tMF9idWlsZC5jOjM0NDoyNDogZXJy
b3I6IHVzZSBvZiBsb2dpY2FsICcmJicgd2l0aCBjb25zdGFudCBvcGVyYW5kIFstV2Vycm9yLC1X
Y29uc3RhbnQtbG9naWNhbC1vcGVyYW5kXQo+ID4+ICAgICAgIGlmICggIWRvbTBfbWVtX3NldCAm
JiBDT05GSUdfRE9NMF9NRU1bMF0gKQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICBeICB+
fn5+fn5+fn5+fn5+fn5+fn4KPiA+PiBkb20wX2J1aWxkLmM6MzQ0OjI0OiBub3RlOiB1c2UgJyYn
IGZvciBhIGJpdHdpc2Ugb3BlcmF0aW9uCj4gPj4gICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYm
IENPTkZJR19ET00wX01FTVswXSApCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIF5+Cj4g
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICYKPiA+PiBkb20wX2J1aWxkLmM6MzQ0OjI0OiBu
b3RlOiByZW1vdmUgY29uc3RhbnQgdG8gc2lsZW5jZSB0aGlzIHdhcm5pbmcKPiA+PiAgICAgICBp
ZiAoICFkb20wX21lbV9zZXQgJiYgQ09ORklHX0RPTTBfTUVNWzBdICkKPiA+PiAgICAgICAgICAg
ICAgICAgICAgICAgICB+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPj4gMSBlcnJvciBnZW5lcmF0
ZWQuCj4gPj4KPiA+PiBPYnZpb3VzbHkgbmVpdGhlciBvZiB0aGUgdHdvIHN1Z2dlc3Rpb25zIGFy
ZSBhbiBvcHRpb24gaGVyZS4gT2RkbHkKPiA+PiBlbm91Z2ggc3dhcHBpbmcgdGhlIG9wZXJhbmRz
IG9mIHRoZSAmJiBoZWxwcywgd2hpbGUgZS5nLiBjYXN0aW5nIG9yCj4gPj4gcGFyZW50aGVzaXpp
bmcgZG9lc24ndC4gQW5vdGhlciB3b3JrYWJsZSB2YXJpYW50IGxvb2tzIHRvIGJlIHRoZSB1c2Ug
b2YKPiA+PiAhISBvbiB0aGUgY29uc3RhbnQuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPj4gLS0tCj4gPj4gSSdtIG9wZW4gdG8gZ29p
bmcgdGhlICEhIG9yIHlldCBzb21lIGRpZmZlcmVudCByb3V0ZS4gTm8gbWF0dGVyIHdoaWNoCj4g
Pj4gb25lIHdlIGNob29zZSwgSSdtIGFmcmFpZCBpdCBpcyBnb2luZyB0byByZW1haW4gZ3Vlc3N3
b3JrIHdoYXQgbmV3ZXIKPiA+PiAoYW5kIGZ1dHVyZSkgdmVyc2lvbnMgb2YgY2xhbmcgd2lsbCBj
aG9rZSBvbi4KPiA+Cj4gPiBJcyBkaXNhYmxpbmcgdGhlIGNoZWNrIGl0c2VsZiBub3QgYW4gb3B0
aW9uPyBTZWVtcyB0byBtZSB0byBiZSBhIG1vcmUKPiA+IHNlbnNpYmxlIG9wdGlvbiB0aGVuIGhh
Y2tpbmcgYXJvdW5kIGl0Lgo+Cj4gSG93IHdvdWxkIHlvdSBlbnZpc2lvbiB0byBkaXNhYmxlIHRo
ZSBjaGVjaz8gSXQncyB0aGVyZSBmb3IgYSByZWFzb24KPiBhZnRlciBhbGwuCgpCeSBwYXNzaW5n
IC1Xbm8tY29uc3RhbnQtbG9naWNhbC1vcGVyYW5kIHRvIHRoZSBjb21waWxlci4gSXQgbG9va3MK
bGlrZSBhIGNoZWNrIGZvciBhIG5vbi1jb21tb24gc2l0dWF0aW9uIHdoaWNoIGV2aWRlbnRseSBY
ZW4gdXNlcywgc28Kd2hhdCdzIHRoZSBwb2ludCBvZiBrZWVwaW5nIGl0IGJ1dCBoYWNraW5nIGFy
b3VuZCB3aXRoIGl0IHdpdGggdHJpY2tzCnRoYXQgYXJlIGZyYWdpbGU/CgpUYW1hcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
