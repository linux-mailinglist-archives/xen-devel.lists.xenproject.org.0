Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A71A06A9
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 17:53:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i30Ew-0006ZR-IT; Wed, 28 Aug 2019 15:52:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=835Q=WY=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1i30Eu-0006ZI-Uh
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 15:52:04 +0000
X-Inumbo-ID: c7a83b62-c9ab-11e9-b95f-bc764e2007e4
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7a83b62-c9ab-11e9-b95f-bc764e2007e4;
 Wed, 28 Aug 2019 15:52:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id t17so607403wmi.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2019 08:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9SGGpT7Rwx+q2VEv2A1QpMUMc7ufMbZMBVqpaWPdu1s=;
 b=B2RtZGNqqqHF8oVn94uTupvTqdIko5ZHWniosUmBrWsyenwc/U50sO5ei2eGhy8KTD
 jevp17mMsGX698Rf00picTUOoqHvn/tOx261tdyg58DI+gtfy7Vupgw/QJ0CcaF9lXav
 okp0JBALlJ5ki567OUVDehUKJ7TB53l8TpFVQpI74rYqhIJaKJMiw7mnmHR5O3IeT2c0
 i8xxInplMCATION+EmbyKPcnlEA8RO7SCO3d27V4msSxIeVECV+bZaK1m6pwYhbK/OpL
 al07dqGhA5fX/nJyzwUT1rxVY30eWDRf2DW2FltHHSzhwAzBu/uFKB0pxwdvRWZX/9yH
 LRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9SGGpT7Rwx+q2VEv2A1QpMUMc7ufMbZMBVqpaWPdu1s=;
 b=oyOzhX//k4Ce6i2PKfUSLvCL+hv4+NUgDSxYQec2sfGhO/EZa1DDeEea0sRcW8JzTd
 lbLPmfWxqYIz15WZbTv7P5Z/V0TFp6k28OtcUhVfIJ7LuZXQW+fz54bmvrO+Yxsh34TL
 awOSbx0zy5uuwy0qLuGf/cdCYbZ9qDB8q75TTBBDpOp2SNTMNAgUjuB259Mev9p/FnuU
 /OxKCPWQgBs+CTg4rVady0cAsJRnIwFPcBsO2ecZFJ6xdXsfaMi2RXm2+PIyrV4QQg5q
 W90RVBGFWvvDuuJsW9p/rwqCMPv5E3O2tQvzNWQF07YQDyXTKtMqq3Og97UVodK9cveC
 ea1w==
X-Gm-Message-State: APjAAAXEFA9n7nRBx9K+zcECCpd0x+lAAGGvwpsjKgekql/2DfcupAoi
 uyzXuK3g+hjzxL1fIWaGuCs3UbjHnaWgyZixX8g=
X-Google-Smtp-Source: APXvYqx2gLd5eXux86AjYUsuhiaj6jcWQqbdcF4LMQmL1i2slq3lUAQULwW4FASQCvM6ZqvpXy+kZ+mt0WkUsXqvqkM=
X-Received: by 2002:a1c:7619:: with SMTP id r25mr5832510wmc.153.1567007523381; 
 Wed, 28 Aug 2019 08:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <CABfawhm+eu2ebwdou3btLJxcxBbq+uCHNxf82zahxp8dcsoDEQ@mail.gmail.com>
 <8c7ba37a-7fd0-4901-fd5b-4d04e02d63fc@suse.com>
In-Reply-To: <8c7ba37a-7fd0-4901-fd5b-4d04e02d63fc@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 28 Aug 2019 09:51:26 -0600
Message-ID: <CABfawhkHm89cqMu5m-6SiLU-r8m4kFXcTMAH_3cFfvRQCUDBug@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] Question about xenpage_list
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgOTozNSBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjguMDguMjAxOSAxNzoyOCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gSGkgYWxsLAo+ID4gSSdtIHRyeWluZyB0byB0cmFjayBkb3duIGhvdyBhIGNhbGwg
aW4gY29tbW9uL2dyYW50X3RhYmxlLmMgdG8KPiA+IHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3Qg
d2lsbCBhY3R1YWxseSBwb3B1bGF0ZSB0aGF0IHBhZ2UgaW50byB0aGUKPiA+IGd1ZXN0J3MgcGh5
c21hcC4gSW1tZWRpYXRlbHkgYWZ0ZXIgdGhlIGNhbGwgdGhlIHBhZ2UgZG9lc24ndCBzZWVtIHRv
Cj4gPiBiZSBwcmVzZW50IGluIHRoZSBwaHlzbWFwLCBhcyBzaGFyZV94ZW5fcGFnZV93aXRoX2d1
ZXN0IHdpbGwganVzdCBhZGQKPiA+IHRoZSBwYWdlIHRvIHRoZSBkb21haW4ncyB4ZW5wYWdlX2xp
c3QgbGlua2VkLWxpc3Q6Cj4gPgo+ID4gICAgICAgICB1bnNpZ25lZCBsb25nIG1mbjsKPiA+ICAg
ICAgICAgdW5zaWduZWQgbG9uZyBnZm47Cj4gPgo+ID4gICAgICAgICBzaGFyZV94ZW5fcGFnZV93
aXRoX2d1ZXN0KHZpcnRfdG9fcGFnZShndC0+c2hhcmVkX3Jhd1tpXSksIGQsIFNIQVJFX3J3KTsK
PiA+Cj4gPiAgICAgICAgIG1mbiA9IHZpcnRfdG9fbWZuKGd0LT5zaGFyZWRfcmF3W2ldKTsKPiA+
ICAgICAgICAgZ2ZuID0gbWZuX3RvX2dtZm4oZCwgbWZuKTsKPiA+Cj4gPiAgICAgICAgIGdkcHJp
bnRrKFhFTkxPR19JTkZPLCAiU2hhcmluZyAlbHggLT4gJWx4IHdpdGggZG9tYWluICV1XG4iLAo+
ID4gZ2ZuLCBtZm4sIGQtPmRvbWFpbl9pZCk7Cj4gPgo+ID4gVGhpcyByZXN1bHRzIGluIHRoZSBm
b2xsb3dpbmc6Cj4gPgo+ID4gKFhFTikgZ3JhbnRfdGFibGUuYzoxODIwOmQwdjAgU2hhcmluZyBm
ZmZmZmZmZmZmZmZmZmZmIC0+IDQyYzcxZSB3aXRoIGRvbWFpbiAxCj4gPgo+ID4gQUZBSUNUIHRo
ZSBwYWdlIG9ubHkgZ2V0cyBwb3B1bGF0ZWQgaW50byB0aGUgcGh5c21hcCBvbmNlIHRoZSBkb21h
aW4KPiA+IGdldHMgdW5wYXVzZWQuIElmIEkgbGV0IHRoZSBkb21haW4gcnVuIGFuZCB0aGVuIHBh
dXNlIGl0IEkgY2FuIHNlZQo+ID4gdGhhdCB0aGUgcGFnZSBpcyBpbiB0aGUgZ3Vlc3QncyBwaHlz
bWFwIChieSBsb29waW5nIHRocm91Z2ggYWxsIHRoZQo+ID4gZW50cmllcyBpbiBpdHMgRVBUKToK
PiA+Cj4gPiAoWEVOKSBtZW1fc2hhcmluZy5jOjE2MzY6ZDB2MCAweGYyMDAwIC0+IDB4NDJjNzFl
IGlzIGEgZ3JhbnQgbWFwcGluZwo+ID4gc2hhcmVkIHdpdGggdGhlIGd1ZXN0Cj4KPiBUaGlzIHNo
b3VsZCBiZSB0aGUgcmVzdWx0IG9mIHRoZSBkb21haW4gaGF2aW5nIG1hZGUgYSByZXNwZWN0aXZl
Cj4gWEVOTUFQU1BBQ0VfZ3JhbnRfdGFibGUgcmVxdWVzdCwgc2hvdWxkbid0IGl0Pwo+CgpEbyB5
b3UgbWVhbiB0aGUgZ3Vlc3QgaXRzZWxmIG9yIHRoZSB0b29sc3RhY2s/CgpUYW1hcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
