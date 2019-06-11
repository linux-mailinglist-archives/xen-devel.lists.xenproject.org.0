Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2483D75B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 21:59:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hamrZ-0005Gd-Qm; Tue, 11 Jun 2019 19:55:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r+TN=UK=gmail.com=niko.tsirakis@srs-us1.protection.inumbo.net>)
 id 1hamrY-0005GX-CV
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 19:55:20 +0000
X-Inumbo-ID: d71e2743-8c82-11e9-8980-bc764e045a96
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d71e2743-8c82-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 19:55:19 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id v186so9915342oie.5
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 12:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iAyIzOlqTlvbuWDE+kuKx/T5UVnQNhn+Dq+WhITKDm0=;
 b=uoZSwqLBB+BdQkj99PKSRtLhz/ijPKBRQ0it9JDphVRaua7DN/m4dQMO3VPV76SPgW
 92a91Mu9xQOwnUQrYb4B+8JEggn9WwyPBk1gQiVNaN4pmhK3wER8jaR1XAzDAj9OnMUt
 AaMWppt7ifCPAWLav4gnGcV6sLMGsYpflD3O1Icgw3614vOzgjotMjBcQZYuUQF5hOtt
 ur52VCTTVVoCY2YEjTBAdKl9jYfvkxriHiTCsZb6pa41AclP2vMm2ll1M2pOkvJxvsw1
 flYzf5zcOBcgMRqabQdL6XLyw0phpDN9aPlePioEO6XiRiiEmn93SxlzWUIumzhqhTrf
 v8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iAyIzOlqTlvbuWDE+kuKx/T5UVnQNhn+Dq+WhITKDm0=;
 b=qWYsfevLIZ2VIBV9l/KnWKDKm1Sq8cb5jtYuuimG27YOtene78UKu5u/EaWmuFVz1w
 N07IQ1MX5uSdyF5YdixqB6kwlArbPWHDMPYQ+fTj5MdKyv/rdZKONrfntFb0lXiUKrOR
 YEOYk6LIqjRiWDGQTCzrPSThd/takDm0bmdVvkd4iZ6FksdsTJeJh6N1b0vgUYOHipM5
 ZtMmBWY59c1M1X/Df2eNFe6d7O+XTbw993R+NZ2YIx8fChqdCh2TRIs9FaKyfDk3htUy
 hhfQ06rwOtUxitZW9dJ6lywOP4suShQqtHl10uq4uXT68EjH4gYKhx2dn3GHcFHdPnQ+
 WbeA==
X-Gm-Message-State: APjAAAU3oiCSu4F3XRXu1aZc5RO1mlM02ZkfG7PyBUz45bbCAB1Cv/q/
 Ss6CDDwSOmMr6FUH4dDzVQVH/N/om2ASb18yE8Y=
X-Google-Smtp-Source: APXvYqzLEBbS9kcRsljH+57cy6PpxwUpIlcZ0yv3BKo41Jbkwx+CsRTcC2rWk69g2qVbPkVSLA8rBwoBP3+ig86KV98=
X-Received: by 2002:aca:3305:: with SMTP id z5mr14541147oiz.141.1560282919033; 
 Tue, 11 Jun 2019 12:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560272437.git.tsirakisn@ainfosec.com>
 <43766a806049b9556dd73ed8c1d6368ab2b26c4f.1560272437.git.tsirakisn@ainfosec.com>
 <CACMJ4GZfTrrA=HkWemB96Qb_8wftbSxv+cXDpa6t0Z=gQc-ywQ@mail.gmail.com>
In-Reply-To: <CACMJ4GZfTrrA=HkWemB96Qb_8wftbSxv+cXDpa6t0Z=gQc-ywQ@mail.gmail.com>
From: Nicholas Tsirakis <niko.tsirakis@gmail.com>
Date: Tue, 11 Jun 2019 15:55:08 -0400
Message-ID: <CAFqpmV+c9ZF8+Dh7sDwBQjx8MXAfWc7n5aKdPziQFUxg-7bj_A@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [Xen-devel] [PATCH 2/2] argo: correctly report pending message
 length
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
 Nicholas Tsirakis <tsirakisn@ainfosec.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMjo0OSBQTSBDaHJpc3RvcGhlciBDbGFyawo8Y2hyaXN0
b3BoZXIudy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdW4gMTEsIDIwMTkg
YXQgMTA6MTEgQU0gTmljaG9sYXMgVHNpcmFraXMKPiA8bmlrby50c2lyYWtpc0BnbWFpbC5jb20+
IHdyb3RlOgo+ID4KPiA+IFdoZW4gYSBtZXNzYWdlIGlzIHJlcXVldWUnZCBpbiBYZW4ncyBpbnRl
cm5hbCBxdWV1ZSwgdGhlIHF1ZXVlCj4gPiBlbnRyeSBjb250YWlucyB0aGUgbGVuZ3RoIG9mIHRo
ZSBtZXNzYWdlIHNvIHRoYXQgWGVuIGtub3dzIHRvCj4gPiBzZW5kIGEgVklSUSB0byB0aGUgcmVz
cGVjdGl2ZSBkb21haW4gd2hlbiBlbm91Z2ggc3BhY2UgZnJlZXMgdXAKPiA+IGluIHRoZSByaW5n
LiBEdWUgdG8gYSBzbWFsbCBidWcsIGhvd2V2ZXIsIFhlbiBkb2Vzbid0IHBvcHVsYXRlCj4gPiB0
aGUgbGVuZ3RoIG9mIHRoZSBtc2cgaWYgYSBnaXZlbiB3cml0ZSBmYWlscywgc28gdGhpcyBsZW5n
dGggaXMKPiA+IGFsd2F5cyByZXBvcnRlZCBhcyB6ZXJvLiBUaGlzIGNhdXNlcyBYZW4gdG8gc3B1
cnJpb3VzbHkgd2FrZSB1cAo+ID4gYSBkb21haW4gZXZlbiB3aGVuIHRoZSByaW5nIGRvZXNuJ3Qg
aGF2ZSBlbm91Z2ggc3BhY2UuCj4gPgo+ID4gVGhpcyBwYXRjaCBtYWtlcyBzdXJlIHRoYXQgdGhl
IG1zZyBsZW4gaXMgcHJvcGVybHkgcmVwb3J0ZWQgYnkKPiA+IHBvcHVsYXRpbmcgaXQgaW4gdGhl
IGV2ZW50IG9mIGEgd3JpdGUgZmFpbHVyZS4KPgo+IFlvdSdyZSBjb3JyZWN0IHRoYXQgdGhpcyBp
cyBhbiBpc3N1ZSB0byBiZSBmaXhlZCwgYnV0IHVuZm9ydHVuYXRlbHkKPiB0aGlzIHBhdGNoIGRv
ZXNuJ3QgY29tcGlsZSwgYXQgbGVhc3Qgd2l0aCBnY2MgOC4yIHdpdGggd2FybmluZ3MgYXMKPiBl
cnJvcnMsIHJlcG9ydGluZzoKPgo+IGFyZ28uYzogSW4gZnVuY3Rpb24gJ3NlbmR2JzoKPiBhcmdv
LmM6MjA1NzozNTogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMyBvZiAnaW92X2NvdW50JyBmcm9t
Cj4gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdlcnJvcj1pbmNvbXBhdGlibGUtcG9pbnRl
ci10eXBlc10KPiAgICAgICAgICAgICAgaW92X2NvdW50KGlvdnMsIG5pb3YsICZsZW4pOwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fgo+IGFyZ28uYzo3MjM6MjU6IG5v
dGU6IGV4cGVjdGVkICd1bnNpZ25lZCBpbnQgKicgYnV0IGFyZ3VtZW50IGlzIG9mIHR5cGUKPiAn
bG9uZyB1bnNpZ25lZCBpbnQgKicKPiAgICAgICAgICAgIHVuc2lnbmVkIGludCAqY291bnQpCj4g
ICAgICAgICAgICB+fn5+fn5+fn5+fn5+fl5+fn5+CgpTaG9vdCwgc29ycnkgYWJvdXQgdGhhdCwg
aXQgY29tcGlsZXMgb24gbXkgZW5kIGp1c3QgZmluZS4KCj4gRXZlbiB3aXRob3V0IHRoaXMgZXJy
b3IsIHRoZSBsb2dpYyBpdCBpbXBsZW1lbnRzIGNhbiB1bm5lY2Vzc2FyaWx5Cj4gaW52b2tlIGlv
dl9jb3VudCB0d2ljZSB1cG9uIHRoZSBzYW1lIGd1ZXN0LXN1cHBsaWVkIGJ1ZmZlcnM7IGl0IHdv
dWxkCj4gYmUgYmV0dGVyIHRvIGF2b2lkIHRoYXQsIHNvOiBsb29raW5nIGF0IHRoZSBvcmlnaW5h
bCBzZWN0aW9uIG9mIGNvZGU6Cj4KPiAqIHNlbmR2J3MgImxlbiIgdmFyaWFibGUgY2FuIGJlIGlu
dCwgcmF0aGVyIHRoYW4gbG9uZy4KPiAqIGlvdl9jb3VudCBjYW4gYmUgY2FsbGVkIGZyb20gc2Vu
ZHYsIGp1c3QgYmVmb3JlIHJpbmdidWZfaW5zZXJ0LAo+IGluc3RlYWQgb2Ygd2l0aGluIHJpbmdi
dWZfaW5zZXJ0LiBJdCBjYW4gcG9wdWxhdGUgc2VuZHYncyAibGVuIgo+IHZhcmlhYmxlLgo+ICog
dGhlIGxlbiBvYnRhaW5lZCBmcm9tIGlvdl9jb3VudCAoaWYgc3VjY2Vzc2Z1bCkgY2FuIGJlIHBh
c3NlZCBpbnRvCj4gcmluZ2J1Zl9pbnNlcnQgYXMgYSBwYXJhbWV0ZXIsIGFuZCByZXBsYWNlIHJp
bmdidWZfaW5zZXJ0J3MgZXhpc3RpbmcKPiAibGVuIiB2YXJpYWJsZS4KPiAqIHJpbmdidWZfaW5z
ZXJ0J3MgIm91dF9sZW4iIHBvaW50ZXIgYXJndW1lbnQgY2FuIHRoZW4gYmUgZHJvcHBlZCBhcwo+
IHVubmVjZXNzYXJ5Lgo+ICogcGVuZGluZ19yZXF1ZXVlIHdpbGwgYmUgZmluZSB0byB1c2Ugc2Vu
ZHYncyBwb3B1bGF0ZWQgImxlbiIgdmFyaWFibGUuCj4KPiBDaHJpc3RvcGhlcgoKVGhpcyB3YXMg
YW4gYWx0ZXJuYXRpdmUgdGhhdCBJIGhhZCBjb25zaWRlcmVkLiBVbHRpbWF0ZWx5IEkgd2VudCB3
aXRoIG15IGN1cnJlbnQKaW1wbGVtZW50YXRpb24gYXMgaXQgaGFkIGxlc3Mgb2YgYSBTTE9DIGNo
YW5nZSwgdGhvdWdoIEkgc2VlIG5vdyB0aGF0IHRoYXQgd2FzCmEgcG9vciBjaG9pY2UuIFNoYWxs
IEkgc3VibWl0IGFzIGEgdjIgb3IgcmVwbHkgdG8gdGhpcyB0aHJlYWQKZGlyZWN0bHk/IEJlaW5n
IHRoYXQKdGhlIGZpcnN0IHBhdGNoIHdhcyBhbHJlYWR5IHB1c2hlZC4KCj4gPiBTaWduZWQtb2Zm
LWJ5OiBOaWNob2xhcyBUc2lyYWtpcyA8dHNpcmFraXNuQGFpbmZvc2VjLmNvbT4KPiA+IC0tLQo+
ID4gIHhlbi9jb21tb24vYXJnby5jIHwgNiArKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vYXJnby5jIGIveGVu
L2NvbW1vbi9hcmdvLmMKPiA+IGluZGV4IDJmODc0YTU3MGQuLmViNTQxODI5ZDYgMTAwNjQ0Cj4g
PiAtLS0gYS94ZW4vY29tbW9uL2FyZ28uYwo+ID4gKysrIGIveGVuL2NvbW1vbi9hcmdvLmMKPiA+
IEBAIC0yMDUwLDYgKzIwNTAsMTIgQEAgc2VuZHYoc3RydWN0IGRvbWFpbiAqc3JjX2QsIHhlbl9h
cmdvX2FkZHJfdCAqc3JjX2FkZHIsCj4gPiAgICAgICAgICB7Cj4gPiAgICAgICAgICAgICAgaW50
IHJjOwo+ID4KPiA+ICsgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAgICAqIGlmIHJpbmdi
dWZfaW5zZXJ0IGZhaWxzLCB0aGVuIGxlbiB3aWxsIG5ldmVyIGJlIHBvcHVsYXRlZC4KPiA+ICsg
ICAgICAgICAgICAgKiBtYWtlIHN1cmUgdG8gcG9wdWxhdGUgaXQgaGVyZS4KPiA+ICsgICAgICAg
ICAgICAgKi8KPiA+ICsgICAgICAgICAgICBpb3ZfY291bnQoaW92cywgbmlvdiwgJmxlbik7Cj4g
PiArCj4gPiAgICAgICAgICAgICAgYXJnb19kcHJpbnRrKCJhcmdvX3JpbmdidWZfc2VuZHYgZmFp
bGVkLCBFQUdBSU5cbiIpOwo+ID4gICAgICAgICAgICAgIC8qIHJlcXVldWUgdG8gaXNzdWUgYSBu
b3RpZmljYXRpb24gd2hlbiBzcGFjZSBpcyB0aGVyZSAqLwo+ID4gICAgICAgICAgICAgIHJjID0g
cGVuZGluZ19yZXF1ZXVlKGRzdF9kLCByaW5nX2luZm8sIHNyY19pZC5kb21haW5faWQsIGxlbik7
Cj4gPiAtLQo+ID4gMi4xNy4xCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
