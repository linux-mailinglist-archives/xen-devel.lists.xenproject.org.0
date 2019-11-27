Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593C410B434
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 18:15:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia0si-0003t4-PU; Wed, 27 Nov 2019 17:13:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8bDK=ZT=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1ia0sh-0003su-01
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 17:13:35 +0000
X-Inumbo-ID: 3dee1952-1139-11ea-a55d-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3dee1952-1139-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 17:13:34 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id b5so20245401eds.12
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2019 09:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=avbwI72EZ/UijnuZGSSoSC9YggMOVPWaFwJMxK6riZw=;
 b=jr9gJxmSQPb7Bj1DBwRNdZPRhmzt3zcOh776U79Aj1KoLk7VZjrppm/SOMSRGGbp5c
 p1XaJcFjws7wmiP8QdJXjCiKeXZGkBx4jqSfuNjk5XWpbS8/pLt2/OypTPnZpRW7rML2
 SsgFG2+xx28j8f42EQAh/yBk/leVmiClheJEXQA152z+RA0QBTn9Z+5nZhUpB39bm/dd
 FjqiQL/thqEGbY0p3Kd2yPu6WIFj5H7/da+9liGtltzOiOYT7fDTuHbpx/G6sgSNhaSX
 PdxJT7++0nqLEnbqtEwa3p5MEx0MITdbEXJb6AYy/l1nrbAT/LidVBkuD1XiPYJO9HIs
 eOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=avbwI72EZ/UijnuZGSSoSC9YggMOVPWaFwJMxK6riZw=;
 b=qKXYEFkQp5xDxyjsKacDd882/QUhrso6XWlyxhra+supyWO2O8FYa5UWD7Om+b9qRx
 qDdqNoEteEPzHmYTPYM0X5zA9gLA2r7gj7waUB/XwcyuELhF8cmdRBITpw/iWG5euKy/
 wWbp6bJBZRYJH7vUDmXEjBgpTwYOnsWl/kDPw215ISsjOs1+5Cl2Cuvoyx4wBhXIQOXP
 GHwagl30CwtajGm6A7y1aVA/p0DbvTT1dYZZbiGvZQXZ5t3WAOZBd9G9l/etbpMTwyDj
 f7dORH5zuInD3zRkTzsbK7YSlwCk0b3Svt+I+3USBed7ifi9Xpz7kuXjCpzLqwScybJq
 X82w==
X-Gm-Message-State: APjAAAUh7S4jfvtpNuT3ArkkW/+fF6GzFvb1yzm/IyejDTd4lzYELB6n
 6C5GNthVPNQaMdhzxFOQT1+oymQ505wUpDGMxkAz7g==
X-Google-Smtp-Source: APXvYqyZqD0tAbB7ilB8c3qt9BESX6KvcTNCcWyh8K0d4RwfSXJa3D/ae359IAhZ5F4Vw7HUXyFo+QE2ejNz+5zwlYs=
X-Received: by 2002:a17:906:a2d0:: with SMTP id
 by16mr1819282ejb.322.1574874813251; 
 Wed, 27 Nov 2019 09:13:33 -0800 (PST)
MIME-Version: 1.0
References: <20191122022406.590141-1-pasha.tatashin@soleen.com>
 <20191122022406.590141-4-pasha.tatashin@soleen.com>
 <20191127151154.GC51937@lakrids.cambridge.arm.com>
 <CA+CK2bDDom_pwLC-ABwDw66ynyELH3f3NdjUEdhr1LYLkgWJvg@mail.gmail.com>
 <20191127160342.GF51937@lakrids.cambridge.arm.com>
 <CA+CK2bBszdMYbneQ1UiYxSndN8zmoVwbTVJ20NeajYPehT_X5Q@mail.gmail.com>
 <20191127170148.GG51937@lakrids.cambridge.arm.com>
In-Reply-To: <20191127170148.GG51937@lakrids.cambridge.arm.com>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 27 Nov 2019 12:13:22 -0500
Message-ID: <CA+CK2bByJJO+0_0H8sDOyWQ-igMvw8pJd_2FR1okX3EAr1r__A@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [Xen-devel] [PATCH v2 3/3] arm64: remove the rest of
 asm-uaccess.h
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Stefan Agner <stefan@agner.ch>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will@kernel.org>,
 boris.ostrovsky@oracle.com, Sasha Levin <sashal@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, James Morris <jmorris@namei.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 xen-devel@lists.xenproject.org, Vladimir Murzin <vladimir.murzin@arm.com>,
 Marc Zyngier <marc.zyngier@arm.com>, alexios.zavras@intel.com,
 Thomas Gleixner <tglx@linutronix.de>, allison@lohutok.net, jgross@suse.com,
 steve.capper@arm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTI6MDEgUE0gTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxh
bmRAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE5vdiAyNywgMjAxOSBhdCAxMTowOTozNUFN
IC0wNTAwLCBQYXZlbCBUYXRhc2hpbiB3cm90ZToKPiA+IE9uIFdlZCwgTm92IDI3LCAyMDE5IGF0
IDExOjAzIEFNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBPbiBXZWQsIE5vdiAyNywgMjAxOSBhdCAxMDozMTo1NEFNIC0wNTAwLCBQYXZlbCBU
YXRhc2hpbiB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIE5vdiAyNywgMjAxOSBhdCAxMDoxMiBBTSBN
YXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAwOToyNDowNlBNIC0wNTAwLCBQYXZlbCBUYXRh
c2hpbiB3cm90ZToKPiA+ID4gPiA+ID4gVGhlIF9fdWFjY2Vzc190dGJyMF9kaXNhYmxlIGFuZCBf
X3VhY2Nlc3NfdHRicjBfZW5hYmxlLAo+ID4gPiA+ID4gPiBhcmUgdGhlIGxhc3QgdHdvIG1hY3Jv
cyBkZWZpbmVkIGluIGFzbS11YWNjZXNzLmguCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFJlcGxh
Y2UgdGhlbSB3aXRoIEMgd3JhcHBlcnMgYW5kIGNhbGwgQyBmdW5jdGlvbnMgZnJvbQo+ID4gPiA+
ID4gPiBrZXJuZWxfZW50cnkgYW5kIGtlcm5lbF9leGl0Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IEZv
ciBub3csIHBsZWFzZSBsZWF2ZSB0aG9zZSBhcy1pcy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIGRv
bid0IHRoaW5rIHdlIHdhbnQgdG8gaGF2ZSBvdXQtb2YtbGluZSBDIHdyYXBwZXJzIGluIHRoZSBt
aWRkbGUgb2YKPiA+ID4gPiA+IHRoZSBlbnRyeSBhc3NlbWJseSB3aGVyZSB3ZSBkb24ndCBoYXZl
IGEgY29tcGxldGUga2VybmVsIGVudmlyb25tZW50Lgo+ID4gPiA+ID4gVGhlIHVzZSBpbiBlbnRy
eSBjb2RlIGNhbiBhbHNvIGFzc3VtZSBub24tcHJlZW1wdGliaWxpdHksIHdoaWxlIHRoZSBDCj4g
PiA+ID4gPiBmdW5jdGlvbnMgaGF2ZSB0byBleHBsY2l0aWx5IGRpc2FibGUgdGhhdC4KPiA+ID4g
Pgo+ID4gPiA+IEkgZG8gbm90IHVuZGVyc3RhbmQsIGlmIEMgZnVuY3Rpb24gaXMgY2FsbGVkIGZv
cm0gbm9uLXByZWVtcHRpYmxlCj4gPiA+ID4gY29udGV4dCBpdCBzdGF5cyBub24tcHJlZW1wdGli
bGUuIGtlcm5lbF9leGl0IGFscmVhZHkgbWF5IGNhbGwgQwo+ID4gPiA+IGZ1bmN0aW9ucyBhcm91
bmQgdGhlIHRpbWUgX191YWNjZXNzX3R0YnIwX2VuYWJsZSBpcyBjYWxsZWQgKGl0IG1heQo+ID4g
PiA+IGNhbGwgcG9zdF90dGJyX3VwZGF0ZV93b3JrYXJvdW5kKSwgYW5kIHRoYXQgQyBmdW5jdGlv
bnMgZG9lcyBub3QgZG8KPiA+ID4gPiBleHBsaWNpdCBwcmVlbXB0IGRpc2FibGU6Cj4gPiA+Cj4g
PiA+IFNvcnJ5LCBJIG1lYW50IHRoYXQgSVJRcyBhcmUgZGlzYWJsZWQgaGVyZS4KPiA+ID4KPiA+
ID4gVGhlIEMgd3JhcHBlciBjYWxscyBfX3VhY2Nlc3NfdHRicjBfZW5hYmxlKCksIHdoaWNoIGNh
bGxzCj4gPiA+IGxvY2FsX2lycV9zYXZlKCkgYW5kIGxvY2FsX2lycV9yZXN0b3JlKCkuIFRob3Nl
IGFyZSBwb2ludGxlc3MgaW4gdGhlCj4gPiA+IGJvd2VscyBvZiB0aGUgZW50cnkgY29kZSwgYW5k
IHBvdGVudGlhbGx5IGV4cGVuc2l2ZSBpZiBJUlEgcHJpbyBtYXNraW5nCj4gPiA+IGlzIGluIHVz
ZS4KPiA+ID4KPiA+ID4gSSdkIHJhdGhlciBub3QgYWRkIG1vcmUgb3V0LW9mLWxpbmUgQyBjb2Rl
IGNhbGxzIGhlcmUgcmlnaHQgbm93IGFzIEknZAo+ID4gPiBwcmVmZXIgdG8gZmFjdG9yIG91dCB0
aGUgbG9naWMgdG8gQyBpbiBhIGJldHRlciB3YXkuCj4gPgo+ID4gQWgsIHllcywgdGhpcyBtYWtl
cyBzZW5zZS4gSSBjb3VsZCBjZXJ0YWlubHkgZmFjdG9yIG91dCBDIGNhbGxzIGluIGEKPiA+IGJl
dHRlciB3YXksIG9yIGlzIHRoaXMgc29tZXRoaW5nIHlvdSB3YW50IHRvIHdvcmsgb24/Cj4KPiBJ
J20gaG9waW5nIHRvIGRvIHRoYXQgYXMgcGFydCBvZiBvbmdvaW5nIGVudHJ5LWRlYXNtIHdvcmss
IG5vdyB0aGF0IGEKPiBsb3Qgb2YgdGhlIHByZXJlcXVpc2l0ZSB3b3JrIHdhcyBtZXJnZWQgaW4g
djUuNC4KCk9LLCBJIHdpbGwgc2VuZCBuZXcgcGF0Y2hlcyB3aXRoIHdoYXQgd2UgYWdyZWVkIG9u
LCBhbmQgeW91ciBjb21tZW50cyBhZGRyZXNzZWQuCgo+Cj4gPiBXaXRob3V0IHJlbW92aW5nIHRo
ZXNlIGFzc2VtYmx5IG1hY3JvcyBJIGRvIG5vdCB0aGluayB3ZSB3YW50IHRvCj4gPiBhZGRyZXNz
IHRoaXMgc3VnZ2VzdGlvbiBmcm9tIEtlZXMgQ29vazoKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvQ0ErQ0syYkNCUzJmS09UbVRGbTEzaXYzdTVUQlB3cG9Dc1llZVAzNTJEVkUtZ3M5
R0p3QG1haWwuZ21haWwuY29tLwo+Cj4gSW4gdGhlIG1lYW4gdGltZSwgd2UgY291bGQgYWRkIGNo
ZWNrcyBhcm91bmQgYWRkcl9saW1pdF91c2VyX2NoZWNrKCksCj4gYW5kIGluIHRoZSBjb250ZXh0
LXN3aXRjaCBwYXRoLiBJIGhhdmUgc29tZSBwcmVwYXJhdG9yeSBjbGVhbnVwIHRvIGFsbG93Cj4g
Zm9yIHRoZSBjb250ZXh0LXN3aXRjaCBjaGVjaywgd2hpY2ggSSdsbCBzZW5kIG91dCBhdCAtcmMx
LiBUaGF0IHdhcyB3aGF0Cj4gSSB1c2VkIHRvIGRldGVjdCB0aGUgY2FzZSB5b3UgcmVwb3J0ZWQg
cHJldmlvdXNseS4KClNvdW5kcyBnb29kLgoKVGhhbmsgeW91LApQYXNoYQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
