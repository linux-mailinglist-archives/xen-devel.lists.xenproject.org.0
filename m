Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0E37E1E6
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 20:05:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htFNo-00054z-N4; Thu, 01 Aug 2019 18:00:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wIOK=V5=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1htFNn-00054u-Ix
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 18:00:55 +0000
X-Inumbo-ID: 4e4a1f60-b486-11e9-8980-bc764e045a96
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4e4a1f60-b486-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 18:00:54 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id m14so27035279qka.10
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 11:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oUWrGgzXeVpL9yBVW6RX7ueMnRawB4Ura+kPTDiDdLk=;
 b=Z2S/6ubczLdBy5Rs/v4zWD8FMLs9AmLKV6CWxuj0MJcxyJzQVC8qMejqoifdkkmglg
 HrutWSmPJjKA0veTm49Hm9oi4NebVlSDGm1L+z3+KtpvKjNFCbXNo2l9T069cbMytpPw
 WCWf7jd9mwBtRkoTzaOiUEs6V/0Qr95B1ntl7w95vTxob/WHJjDBRP21tRqGNuErclbL
 3Wvnn6xykg0wWLLr05pAyMDexPtxHWM1IAXDguNJkPL1BY2idn6/tUvRgcjLY9KNAAY9
 jaupmWx81BY9kVCaigxhL6NU1MibAyG4oMBlVfBrxQ7d2+9vSBHotKK5ZPX1ycl1GgAz
 RQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oUWrGgzXeVpL9yBVW6RX7ueMnRawB4Ura+kPTDiDdLk=;
 b=QSS4jSaDA9SZddHJ2Gl7v9IfpPwE77CI50f+RB8q8dVQDJlEWXjMsq7r4gBSqZQw8z
 t2I9oJEywYYhmEpreR22aGb8w9ve/I40VEt2EwChxa6xKsVIfbF2fSj9EKR8gzONyrjg
 FWtDliqgi96CrVqmJLeXxGIIymmjbZ6q0RiexrofpeDfsfD1fs5uVkC8yY7YokxJZAWC
 irfKnh65jQuEeqQc3apmW8Y6vBc8XTd9LGJLDXovYFxbNFeHx02Xj8T/+9Q+Fv/S2paT
 EstyGg9Q03KbbuqQd0isvC0hXL9FDWYihstMLJIVHP64hFn5hiUvEkBlInGYwbQuVWLh
 L5wg==
X-Gm-Message-State: APjAAAURdnhn7YqMsPIKMuhyHA9Hjh8EX77YLXbgJvv5UKvsUBuUnIrV
 34fuK9KhPFDvJ5PcmqUggEgiIo0pcvf9j4q3HH26CQ==
X-Google-Smtp-Source: APXvYqwPOuHOcT8xvgneJq1y8+nOwqKVTI+j7I2c4nLke/8l3OUI+xgWLw306liwQAhv+JFMQLJ6rCtjcbd4RjU7Z8Y=
X-Received: by 2002:a37:a40f:: with SMTP id n15mr81568599qke.19.1564682453949; 
 Thu, 01 Aug 2019 11:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy_60jh+YXMVEm0PnEnD-MP4R1A5AKEKWL62V_1bc2L5cw@mail.gmail.com>
 <20190801103019.GC5791@perard.uk.xensource.com>
 <CAMmSBy8t+ttKrVJ_aRFZxt-WCz7N0V5Of3yoZ9=8tmyySbpKAw@mail.gmail.com>
 <a4e1b6bc-2d0c-7976-a740-4bae9282434d@citrix.com>
In-Reply-To: <a4e1b6bc-2d0c-7976-a740-4bae9282434d@citrix.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 1 Aug 2019 11:00:42 -0700
Message-ID: <CAMmSBy95MRSHfyHw+=Nf15pWPbwv2CODLR1ys0bXRZCXDNi4Hg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCAxMDo0NCBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDAxLzA4LzIwMTkgMTg6MzUsIFJvbWFuIFNo
YXBvc2huaWsgd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAxLCAyMDE5IGF0IDM6MzAgQU0gQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+IE9uIFdlZCwg
SnVsIDMxLCAyMDE5IGF0IDAxOjExOjIyUE0gLTA3MDAsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6
Cj4gPj4+IEhpIQo+ID4+IEhpIFJvbWFuLAo+ID4+Cj4gPj4gVGhhbmtzIGZvciB0aGUgYnVnIHJl
cG9ydCEKPiA+Pgo+ID4+IFRoYXQgYnVnICh0ZWNobmljYWwgZGVidCByZWFsbHkpIHdhcyBmaXhl
ZCBpbiBRRU1VIDQuMCAoc28gd2lsbCBiZSBmaXhlZAo+ID4+IGluIFhlbiA0LjEzKS4gSXQncyBh
IHNlcmllcyBvZiBwYXRjaCB3aXRoIHRoZSBsYXN0IG9uZSBiZWVuIGRiOWZmNDYgaWYKPiA+PiB5
b3Ugd2FudCB0byBoYXZlIGEgbG9vay4KPiA+IEdvdCBpdCEgSXMgdGhlcmUgYW55IHF1aWNrIHdh
eSBob3cgSSBjYW4gY2hlY2sgdGhhdCB0aGlzLCBpbmRlZWQsIHNvbHZlcwo+ID4gb3VyIHByb2Js
ZW0gYW5kIEkgY2FuIHJlbW92ZSB0aGUgb3V0LW9mLXRyZWUgcGF0Y2g/IEkganVzdCByZWFsbHkK
PiA+IHdhbnQgdG8gbWFrZSBzdXJlIHRoYXQgd2hlbiA0LjEzIGNvbWVzIG91dCAtLSB0aGUgaXNz
dWUgaXMgZml4ZWQuCj4gPgo+ID4gSSdtIHN0aWxsIGEgbGl0dGxlIGJpdCBuZXcgdG8gWGVuIGRl
dmVsb3BtZW50LCBzbyBJIGd1ZXNzIEkgbmVlZCB0byBjb21iaW5lOgo+ID4gICAgICBodHRwOi8v
eGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9c3VtbWFyeQo+ID4gICAgICBodHRw
Oi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1xZW11LXhlbi5naXQ7YT1zdW1tYXJ5Cj4gPiBz
b21laG93IHRvIGdldCB0aGUgc2FtZSB0cmVlIEkgZ2V0IHdoZW4gSSBkb3dubG9hZCBhbiBvZmZp
Y2lhbCByZWxlYXNlPwo+ID4KPiA+IElzIHRoZXJlIGEgc2NyaXB0IG9yIGJldHRlciB5ZXQgYSBu
aWdodGx5IGJ1aWxkIG9mIHNvbWUgc29ydD8KPgo+IFNvIHRoaXMgaXMgYW4gYXJlYSBvZiB0aGUg
WGVuIGJ1aWxkIHN5c3RlbSB3aGljaCBhbGwgZGlzdHJvIGRvd25zdHJlYW1zCj4gaGF0ZSBhbmQg
d29yayBhcm91bmQuCj4KPiBEaXN0cm9zIGRvbid0IHNoaXAgdHdvIHZlcmlzb25zIG9mIHFlbXUs
IGFuZCBkb24ndCB3YW50IFhlbiB0byBoYXZlIGl0cwo+IG93biBwcml2YXRlIHZlcnNpb24uICBU
aGUgY3VycmVudCBiZWhhdmlvdXIgaXMgc29tZXdoZXJlIGJldHdlZW4gInRoYXRzCj4gaG93IGl0
IHdhcyBhbHdheXMgZG9uZSIgYW5kIGEgY29udmVuaWVuY2UgZm9yIGRldmVsb3BlcnMuCj4KPiBU
aGUgY29tbW9uIHNvbHV0aW9uIGlzIHRvIGJ1aWxkIHRoZSBYZW4gdG9vbHMgd2l0aAo+Cj4gLi9j
b25maWd1cmUgLS13aXRoLXN5c3RlbS1xZW11PS91c3IvbGliNjQveGVuL2Jpbi9xZW11LXN5c3Rl
bS1pMzg2Cj4KPiAocGF0aCBhcyBhcHByb3ByaWF0ZSBmb3IgZG9tMCkgd2hpY2ggdGVsbHMgeGwo
L2xpYnhsPyBJIGZvcmdldCB3aGljaCkKPiB3aGVyZSB0byBmaW5kIHFlbXUsIGJ1dCBvdGhlcndp
c2Uga2VlcHMgaXQgYXMgYW4gaW5kZXBlbmRlbnQgY29tcG9uZW50LgoKR290IGl0ISBTbyBwbGVh
c2UgYmVhciB3aXRoIG1lIGZvciBhIGxpdHRsZSBiaXQgbG9uZ2VyOiBJJ20gbG9va2luZyBhdAog
ICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXFlbXUteGVuLmdpdDthPXN1bW1h
cnkKYW5kIEkgc2VlIHRoYXQgaXQgaXMgYmFzZWQgb24gYSBzdG9jaywgdXBzdHJlYW0gcWVtdSA0
LjAuMCB3aXRoCmp1c3QgdHdvIHBhdGNoZXMgb24gdG9wOgogICAgIGh0dHA6Ly94ZW5iaXRzLnhl
bi5vcmcvZ2l0d2ViLz9wPXFlbXUteGVuLmdpdDthPWNvbW1pdDtoPTljY2EwMmQ4ZmZjMjNlOTY4
OGE5NzFkODU4ZTRmZmRmZjUzODliMTEKICAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdl
Yi8/cD1xZW11LXhlbi5naXQ7YT1jb21taXQ7aD0xYmNmNDg0ZmE5ZjQ1MWNjOGMyOTBmZTgwZmQw
ZTc2NDE5OWNhODFjCgpTbyBoZXJlJ3MgbXkgcXVlc3Rpb246IHdoZW4gdGhlcmUncyB0aW1lIHRv
IHJlbGVhc2UgWGVuIDQuMTMsIGlzIHRoZQpleHBlY3RhdGlvbiBmb3IgdGhlc2UgcGF0Y2hlcyB0
byBnZXQgdXBzdHJlYW1lZCBpbnRvIGEgcGFydGljdWxhciBwYXRjaApyZWxlYXNlIG9mIHFlbXUg
NC4wLnggb3IgdGhhdCBkaXN0cm9zIChsaWtlIG91cnNlbHZlcykgd2lsbCBiZSBvbiB0aGUgaG9v
awpvZiBsaWZ0aW5nIHRob3NlIHBhdGNoZXMgb2ZmIG9mIFhlbiB0cmVlIGFuZCBtZXJnaW5nIGlu
IHdoYXRldmVyIHZlcnNpb24Kb2YgcWVtdSA0LnkgdGhleSBzaGlwPwoKQWxzbywgaW4gdGVybXMg
b2YgdGVzdGluZywgd2hhdCBkb2VzIHRoZSBtYWpvcml0eSBvZiBmb2xrcyB3aG8gd2lsbCBiZSB3
b3JraW5nCm9uIFhlbiA0LjEzIHJlbGVhc2UgYmUgdGVzdGluZyBpdCB3aXRoPyBxZW11IHRoYXQg
Y29tZXMgb3V0IG9mIHhlbmJpdHMueGVuLm9yZywKdXBzdHJlYW0gcWVtdSArIGN1c3RvbSBwYXRj
aGVzLCBkaXN0cm8gUUVNVSwgc29tZXRoaW5nIGVsc2U/CgpUaGFua3MsClJvbWFuLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
