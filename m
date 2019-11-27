Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E09C10B2FA
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 17:12:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZzt0-0004gP-B8; Wed, 27 Nov 2019 16:09:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8bDK=ZT=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1iZzsy-0004gK-6U
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 16:09:48 +0000
X-Inumbo-ID: 54ffcaa4-1130-11ea-9db0-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54ffcaa4-1130-11ea-9db0-bc764e2007e4;
 Wed, 27 Nov 2019 16:09:47 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a21so20088017edj.8
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2019 08:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MVh7tTi5rObsII1vRb5KH/Kj99TQG5j4kV172FFYaNU=;
 b=gbR63fcLJRi/WLgkSC3biBeSS5ksFa+SgBNncFI/dtnu6JomxUFkEypKo6Hde4vGot
 YLEamBKO3NHi3MEiQhVD1VJ4Zd4YNbkgRwzuK3F+qQo35SAO10ZOP94oMfC6WY6/Wh/U
 0eKrxx18EfmCr04w4Gqxt2XGo46PBzhuFnQsl2l2UcZ/0xLjG/PGnelMJoYElJM5pyp4
 tvt0Np+1js8hOTW2NFTqQaugebPGC6rxkL/ADeoJv7eyygV5BDFyATPfvj8v+A0BWw7r
 Kp3ix1Ofv6QK+yQq/Zlr0cnpeMqh8iDM9Y9JJ5A/IMywhztDuC2O6mUHpjN7w2VaAD6S
 qlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MVh7tTi5rObsII1vRb5KH/Kj99TQG5j4kV172FFYaNU=;
 b=AL1Obk4WDRLRU4CBc19+WB3YeV3hr9nZJp2R9ol2UB0dAPx9a62UvbLn8PLw0p4trr
 0vETL3+tSfH8fEB4dBZU5w3XCaaDok1lowSStfbyc7r/B+A93pTlp0Hu3SZK4uY7FpoV
 wFfB7LxGHoY8uIQg/BpWju/MDMu0bUm+fS5jHhFdwBWed0rfuGq19Ne2YIPMgee4MzKl
 qUFvd0S/TWHqf/9AVDG6Y66AhlgF50FPMR9/BCf9Pc9nPSSr1zZYQIhM/1y7b/oT3mGB
 +Xx+1RaaLt/ck7r4/hACdWcSVmlkeQODjvlXyVNXK8458E0+5+A+foalYKjVayzIP98e
 gyLQ==
X-Gm-Message-State: APjAAAUc+SlrQZ28oo+XA7qFTOJbASlgAyBPXHcIRlNKj0m36J1ALVJP
 Jd/poO+kf3GndRHmbMFss9t/I11Pg/fZweEulsXvPw==
X-Google-Smtp-Source: APXvYqyGvrGVufQv8/trojtgiiYMTMZNR892vMYV853ZwD/Xo8IVHZPoSX4tMMrkndkbkHl7S1A5sUcM3uaSQGcM8Lo=
X-Received: by 2002:a50:9e22:: with SMTP id z31mr7697426ede.258.1574870986619; 
 Wed, 27 Nov 2019 08:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20191122022406.590141-1-pasha.tatashin@soleen.com>
 <20191122022406.590141-4-pasha.tatashin@soleen.com>
 <20191127151154.GC51937@lakrids.cambridge.arm.com>
 <CA+CK2bDDom_pwLC-ABwDw66ynyELH3f3NdjUEdhr1LYLkgWJvg@mail.gmail.com>
 <20191127160342.GF51937@lakrids.cambridge.arm.com>
In-Reply-To: <20191127160342.GF51937@lakrids.cambridge.arm.com>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 27 Nov 2019 11:09:35 -0500
Message-ID: <CA+CK2bBszdMYbneQ1UiYxSndN8zmoVwbTVJ20NeajYPehT_X5Q@mail.gmail.com>
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

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTE6MDMgQU0gTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxh
bmRAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE5vdiAyNywgMjAxOSBhdCAxMDozMTo1NEFN
IC0wNTAwLCBQYXZlbCBUYXRhc2hpbiB3cm90ZToKPiA+IE9uIFdlZCwgTm92IDI3LCAyMDE5IGF0
IDEwOjEyIEFNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAwOToyNDowNlBNIC0wNTAwLCBQYXZlbCBU
YXRhc2hpbiB3cm90ZToKPiA+ID4gPiBUaGUgX191YWNjZXNzX3R0YnIwX2Rpc2FibGUgYW5kIF9f
dWFjY2Vzc190dGJyMF9lbmFibGUsCj4gPiA+ID4gYXJlIHRoZSBsYXN0IHR3byBtYWNyb3MgZGVm
aW5lZCBpbiBhc20tdWFjY2Vzcy5oLgo+ID4gPiA+Cj4gPiA+ID4gUmVwbGFjZSB0aGVtIHdpdGgg
QyB3cmFwcGVycyBhbmQgY2FsbCBDIGZ1bmN0aW9ucyBmcm9tCj4gPiA+ID4ga2VybmVsX2VudHJ5
IGFuZCBrZXJuZWxfZXhpdC4KPiA+ID4KPiA+ID4gRm9yIG5vdywgcGxlYXNlIGxlYXZlIHRob3Nl
IGFzLWlzLgo+ID4gPgo+ID4gPiBJIGRvbid0IHRoaW5rIHdlIHdhbnQgdG8gaGF2ZSBvdXQtb2Yt
bGluZSBDIHdyYXBwZXJzIGluIHRoZSBtaWRkbGUgb2YKPiA+ID4gdGhlIGVudHJ5IGFzc2VtYmx5
IHdoZXJlIHdlIGRvbid0IGhhdmUgYSBjb21wbGV0ZSBrZXJuZWwgZW52aXJvbm1lbnQuCj4gPiA+
IFRoZSB1c2UgaW4gZW50cnkgY29kZSBjYW4gYWxzbyBhc3N1bWUgbm9uLXByZWVtcHRpYmlsaXR5
LCB3aGlsZSB0aGUgQwo+ID4gPiBmdW5jdGlvbnMgaGF2ZSB0byBleHBsY2l0aWx5IGRpc2FibGUg
dGhhdC4KPiA+Cj4gPiBJIGRvIG5vdCB1bmRlcnN0YW5kLCBpZiBDIGZ1bmN0aW9uIGlzIGNhbGxl
ZCBmb3JtIG5vbi1wcmVlbXB0aWJsZQo+ID4gY29udGV4dCBpdCBzdGF5cyBub24tcHJlZW1wdGli
bGUuIGtlcm5lbF9leGl0IGFscmVhZHkgbWF5IGNhbGwgQwo+ID4gZnVuY3Rpb25zIGFyb3VuZCB0
aGUgdGltZSBfX3VhY2Nlc3NfdHRicjBfZW5hYmxlIGlzIGNhbGxlZCAoaXQgbWF5Cj4gPiBjYWxs
IHBvc3RfdHRicl91cGRhdGVfd29ya2Fyb3VuZCksIGFuZCB0aGF0IEMgZnVuY3Rpb25zIGRvZXMg
bm90IGRvCj4gPiBleHBsaWNpdCBwcmVlbXB0IGRpc2FibGU6Cj4KPiBTb3JyeSwgSSBtZWFudCB0
aGF0IElSUXMgYXJlIGRpc2FibGVkIGhlcmUuCj4KPiBUaGUgQyB3cmFwcGVyIGNhbGxzIF9fdWFj
Y2Vzc190dGJyMF9lbmFibGUoKSwgd2hpY2ggY2FsbHMKPiBsb2NhbF9pcnFfc2F2ZSgpIGFuZCBs
b2NhbF9pcnFfcmVzdG9yZSgpLiBUaG9zZSBhcmUgcG9pbnRsZXNzIGluIHRoZQo+IGJvd2VscyBv
ZiB0aGUgZW50cnkgY29kZSwgYW5kIHBvdGVudGlhbGx5IGV4cGVuc2l2ZSBpZiBJUlEgcHJpbyBt
YXNraW5nCj4gaXMgaW4gdXNlLgo+Cj4gSSdkIHJhdGhlciBub3QgYWRkIG1vcmUgb3V0LW9mLWxp
bmUgQyBjb2RlIGNhbGxzIGhlcmUgcmlnaHQgbm93IGFzIEknZAo+IHByZWZlciB0byBmYWN0b3Ig
b3V0IHRoZSBsb2dpYyB0byBDIGluIGEgYmV0dGVyIHdheS4KCkFoLCB5ZXMsIHRoaXMgbWFrZXMg
c2Vuc2UuIEkgY291bGQgY2VydGFpbmx5IGZhY3RvciBvdXQgQyBjYWxscyBpbiBhCmJldHRlciB3
YXksIG9yIGlzIHRoaXMgc29tZXRoaW5nIHlvdSB3YW50IHRvIHdvcmsgb24/CgpXaXRob3V0IHJl
bW92aW5nIHRoZXNlIGFzc2VtYmx5IG1hY3JvcyBJIGRvIG5vdCB0aGluayB3ZSB3YW50IHRvCmFk
ZHJlc3MgdGhpcyBzdWdnZXN0aW9uIGZyb20gS2VlcyBDb29rOgpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sL0NBK0NLMmJDQlMyZktPVG1URm0xM2l2M3U1VEJQd3BvQ3NZZWVQMzUyRFZFLWdz
OUdKd0BtYWlsLmdtYWlsLmNvbS8KClRoYW5rIHlvdSwKUGFzaGEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
