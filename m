Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4989C7E135
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 19:39:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htEzG-0002uu-0N; Thu, 01 Aug 2019 17:35:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wIOK=V5=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1htEzE-0002up-Ai
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 17:35:32 +0000
X-Inumbo-ID: c26910ea-b482-11e9-8980-bc764e045a96
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c26910ea-b482-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 17:35:31 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id d15so52652454qkl.4
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gnva5+4OUjJ+9Kb+8ptzmO7/IePVDFdv9ZlaZQWOAzI=;
 b=GAuJegyRtudAJIih4H+dv5jQFPjTrgXXQrs/oyZxJsL+IFprZBvcBL1hHHKhESrEG5
 3ULJ6/BEI6o+4o+FwTKa3OsuB8erF75YagCfI2DS1XYjVoDPIGTv+woQJYLjF12kGyM8
 H80WHFfBJjpeB/b/ivPKQY7diTj5YxmH9b9NfHi9Ax2vTEm1Ymn8VeJyAftekdk4sGrZ
 X25OR9hM6cI73Eflx1WmREXNEF3S1OtwQjkRff0AzUieFRSLwKn35JrnsuNbjxXKSysQ
 sE/S+Z/RLV8AgE4HHTtA5YpTsuMA6qmui7y3UzcT47EY9ofxcX7ARIJeUt8NmiWQQOuj
 hTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gnva5+4OUjJ+9Kb+8ptzmO7/IePVDFdv9ZlaZQWOAzI=;
 b=Ainarw0/7Z8HLYgupap4UeZQX+MLUiguyEVLNppz5roHBbgmseamH3xj0UHvL3Ryqy
 1HTobsnddH6j5dzEytzDa6LgoshANcRxPQbWpMhby56LBRGUuzvqk7Mg8izOGzRvMxId
 cm8kpr5bfeLsPy0mn3XAeO6JA0RjYxrJgmHwSQ6sm7SChGIey4BOXwhsLbGLKe0GFa1L
 LjbY4Zb/1ZU4Z5eShvlOThtPOVd5Malgc0AZ4MHPbV6bHRwguhnyzvZDIKorYeeSC73g
 rUxsfzRhg2lSaiKlZnlH4xYKoSLLQqdO7RIgtBOOsFoqcYw4Xz32At0IqPIy+MttC5W5
 ymMw==
X-Gm-Message-State: APjAAAUygyp3iRQFyGUhqH/hdo7KfcYiR10fjjcbX3jl/oNqHpzHsNGk
 VzwZtYYeKu9krPEDIFFZk3NQnWAp5wCIVKDa8QVCnA==
X-Google-Smtp-Source: APXvYqxgKKAZlhOzhEDGALxuETixEQW6aekXihQvvLzmhGq+P0yjMJRANJtLj5DNXgzV8OQ7NmuC2FIhRGhQGJR4coE=
X-Received: by 2002:a37:a7d2:: with SMTP id
 q201mr58528191qke.403.1564680930703; 
 Thu, 01 Aug 2019 10:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy_60jh+YXMVEm0PnEnD-MP4R1A5AKEKWL62V_1bc2L5cw@mail.gmail.com>
 <20190801103019.GC5791@perard.uk.xensource.com>
In-Reply-To: <20190801103019.GC5791@perard.uk.xensource.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 1 Aug 2019 10:35:19 -0700
Message-ID: <CAMmSBy8t+ttKrVJ_aRFZxt-WCz7N0V5Of3yoZ9=8tmyySbpKAw@mail.gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [Xen-devel] [BUG] Assertion failed: !blk->legacy_dev
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCAzOjMwIEFNIEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDAxOjEx
OjIyUE0gLTA3MDAsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4gPiBIaSEKPgo+IEhpIFJvbWFu
LAo+Cj4gVGhhbmtzIGZvciB0aGUgYnVnIHJlcG9ydCEKPgo+IFRoYXQgYnVnICh0ZWNobmljYWwg
ZGVidCByZWFsbHkpIHdhcyBmaXhlZCBpbiBRRU1VIDQuMCAoc28gd2lsbCBiZSBmaXhlZAo+IGlu
IFhlbiA0LjEzKS4gSXQncyBhIHNlcmllcyBvZiBwYXRjaCB3aXRoIHRoZSBsYXN0IG9uZSBiZWVu
IGRiOWZmNDYgaWYKPiB5b3Ugd2FudCB0byBoYXZlIGEgbG9vay4KCkdvdCBpdCEgSXMgdGhlcmUg
YW55IHF1aWNrIHdheSBob3cgSSBjYW4gY2hlY2sgdGhhdCB0aGlzLCBpbmRlZWQsIHNvbHZlcwpv
dXIgcHJvYmxlbSBhbmQgSSBjYW4gcmVtb3ZlIHRoZSBvdXQtb2YtdHJlZSBwYXRjaD8gSSBqdXN0
IHJlYWxseQp3YW50IHRvIG1ha2Ugc3VyZSB0aGF0IHdoZW4gNC4xMyBjb21lcyBvdXQgLS0gdGhl
IGlzc3VlIGlzIGZpeGVkLgoKSSdtIHN0aWxsIGEgbGl0dGxlIGJpdCBuZXcgdG8gWGVuIGRldmVs
b3BtZW50LCBzbyBJIGd1ZXNzIEkgbmVlZCB0byBjb21iaW5lOgogICAgIGh0dHA6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1zdW1tYXJ5CiAgICAgaHR0cDovL3hlbmJpdHMu
eGVuLm9yZy9naXR3ZWIvP3A9cWVtdS14ZW4uZ2l0O2E9c3VtbWFyeQpzb21laG93IHRvIGdldCB0
aGUgc2FtZSB0cmVlIEkgZ2V0IHdoZW4gSSBkb3dubG9hZCBhbiBvZmZpY2lhbCByZWxlYXNlPwoK
SXMgdGhlcmUgYSBzY3JpcHQgb3IgYmV0dGVyIHlldCBhIG5pZ2h0bHkgYnVpbGQgb2Ygc29tZSBz
b3J0PwoKPiA+IEFuZHJldyByZW1pbmRlZCBtZSB0aGF0IEVWRSBoYXMgYSB3ZWlyZCBpbi10cmVl
IHBhdGNoIGZvciBYZW4ncyBxZW11Cj4gPiB0byBkZWFsIHdpdGggYW4gaXNzdWUgd2UgY2FuJ3Qg
cXVpdGUgZXhwbGFpbjoKPiA+ICAgICBodHRwczovL2dpdGh1Yi5jb20vbGYtZWRnZS9ldmUvYmxv
Yi9tYXN0ZXIvcGtnL3hlbi10b29scy9wYXRjaGVzLTQuMTIuMC8wMS1yZW1vdmUtYXNzZXJ0LnBh
dGNoCj4gPgo+ID4gVGhlIHdheSB0aGlzIHByb2JsZW0gbWFuaWZlc3RzIGl0c2VsZiBpcyAqc29t
ZXRpbWUgYWZ0ZXIqIGFuIEhWTSBkb21haW4KPiA+IHdpdGggYSBxY293MiBkaXNrIGF0dGFjaGVk
IGdldCBzdGFydGVkIHdlIGdldCBRRU1VIGZhaWxpbmcgd2l0aDoKPiA+ICAgICBBc3NlcnRpb24g
ZmFpbGVkOiAhYmxrLT5sZWdhY3lfZGV2Cj4gPiAoL3hlbi90b29scy9xZW11LXhlbi9ibG9jay9i
bG9jay1iYWNrZW5kLmM6IGJsa19nZXRfYXR0YWNoZWRfZGV2X2lkOgo+ID4gOTAzKQo+Cj4gSSBj
YW4gdGVsbCB5b3UgbW9yZSBhYm91dCBob3cgdG8gdHJpZ2dlciB0aGUgYXNzZXJ0aW9uIGZhaWx1
cmUuIFNpbXBseQo+IHJ1bm5pbmcgYHhlbnRvcCcgd2lsbCB0cmlnZ2VyIHRoZSBidWcuIFRoYXQg
dG9vbCBydW4gdGhlIFFNUCBjb21tYW5kCj4gInF1ZXJ5LWJsb2NrIiB3aGljaCB3aWxsIHRyaWdn
ZXIgdGhlIGJ1ZywgdGhlcmUgYXJlIHByb2JhYmx5IG90aGVyIFFNUAo+IGNvbW1hbmQgb3IgSE1Q
IG9yIG1vbml0b3IgY29tbWFuZCB3aGljaCB3b3VsZCBkbyB0aGUgc2FtZSBpZiB5b3UgdXNlIGEK
PiBkaWZmZXJlbnQgbW9uaXRvcmluZyBzb2Z0d2FyZS4KClRoYXQncyBleGFjdGx5IHJpZ2h0ISBF
eGFjdGx5IHdoYXQgSSdtIHNlZWluZyByaWdodCBub3cuCgo+IFNvIHlvdSBjb3VsZCBydW4gd2l0
aCBhIG5ld2VyIHZlcnNpb24gb2YgUUVNVSBvciBrZWVwIHRoZSBwYXRjaCB0aGF0Cj4gcmVtb3Zl
cyB0aGUgYXNzZXJ0LgoKU28uLi4gYXJlIHlvdSBzYXlpbmcgdGhhdCB0aGUgaW4tdHJlZSAoWGVu
J3MgZm9yayBvZikgcWVtdSBjYW4gYmUgZGl0Y2hlZCBhbmQKd2UgY2FuIHNpbXBseSBydW4gd2l0
aCB1cHN0cmVhbSBxZW11IDQuMD8KClRoYW5rcywKUm9tYW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
