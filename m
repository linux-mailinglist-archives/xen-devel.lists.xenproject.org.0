Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F5D105DE2
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 01:57:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXxCg-0003Qe-C3; Fri, 22 Nov 2019 00:53:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sEnY=ZO=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iXxCf-0003QZ-7F
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 00:53:41 +0000
X-Inumbo-ID: 84147dde-0cc2-11ea-b678-bc764e2007e4
Received: from pandora.armlinux.org.uk (unknown
 [2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84147dde-0cc2-11ea-b678-bc764e2007e4;
 Fri, 22 Nov 2019 00:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m8abUx8pSYpn1hn5D1w1GLb8aL+UUj0d2TyW9NfUG1g=; b=QDvDXbAXyOJq5lNNXeptcbMNI
 k0VOOqaMtYLgAsH3CMe5FWVVhuAK2Q6LNZOjK4odsCCM1Nt3Phq7R9wp5OcXjYdvnMflj6mnI7PBH
 dreG7wO50Wn1ZumhGlCeC8+ee4x0AIVreVJfffqnZrOUdAp8rmWQn7FKqJ0zTt6qON6JBxm6hrCt1
 baCBq+6gHLQ5/6oHlov+evlBhdaxnQmYoDOR7ren/sR9HvX04+IDgURZAcqSXWAvj7spzEslGG+1J
 jWNum5v1ebB+VbwhXd7tlF/z5W43Q2emlgEDWrOQsUTIHov/zb7VRYJSryVEAPmFGjGs0rB2hZ65Y
 SdDtKL8Sg==;
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:38760)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iXxCJ-0001kC-NV; Fri, 22 Nov 2019 00:53:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iXxCC-0003Dm-2F; Fri, 22 Nov 2019 00:53:12 +0000
Date: Fri, 22 Nov 2019 00:53:12 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Message-ID: <20191122005311.GI25745@shell.armlinux.org.uk>
References: <20191121184805.414758-1-pasha.tatashin@soleen.com>
 <20191121184805.414758-2-pasha.tatashin@soleen.com>
 <20191122002258.GD25745@shell.armlinux.org.uk>
 <CA+CK2bDtADA2eVwJAUEPhpic8vXWegh8yLjo6Q6WmXZDxAfJpA@mail.gmail.com>
 <20191122003403.GG25745@shell.armlinux.org.uk>
 <20191122003524.GH25745@shell.armlinux.org.uk>
 <CA+CK2bAm0r8zLMz_gdq30zF8io5RzVnbXFSV9NkyT_uUxKJwLA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+CK2bAm0r8zLMz_gdq30zF8io5RzVnbXFSV9NkyT_uUxKJwLA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 1/3] arm/arm64/xen: use C inlines for
 privcmd_call
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, stefan@agner.ch,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sasha Levin <sashal@kernel.org>,
 sstabellini@kernel.org, James Morris <jmorris@namei.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 xen-devel@lists.xenproject.org, Vladimir Murzin <vladimir.murzin@arm.com>,
 Marc Zyngier <marc.zyngier@arm.com>, alexios.zavras@intel.com,
 boris.ostrovsky@oracle.com, allison@lohutok.net, jgross@suse.com,
 steve.capper@arm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDc6Mzk6MjJQTSAtMDUwMCwgUGF2ZWwgVGF0YXNoaW4g
d3JvdGU6Cj4gPiA+IFRoYXQgbWF5IGJlLCBidXQgYmUgdmVyeSBjYXJlZnVsIHRoYXQgeW91IG9u
bHkgdXNlIHRoZW0gaW4gQVJNdjctb25seQo+ID4gPiBjb2RlLiAgVXNpbmcgdGhlbSBlbHNld2hl
cmUgaXMgdW5zYWZlIGFzIHRoZSBkb21haW4gcmVnaXN0ZXIgaXMgdXNlZAo+ID4gPiBmb3Igb3Ro
ZXIgcHVycG9zZXMsIGFuZCBtZXJlbHkgYmxhdHRpbmcgb3ZlciBpdCAoYXMgeW91cgo+ID4gPiB1
YWNjZXNzX2VuYWJsZSBhbmQgdWFjY2Vzc19kaXNhYmxlIGZ1bmN0aW9ucyBkbykgaXMgdW5zYWZl
Lgo+ID4KPiA+IEluIGZhY3QsIEknbGwgdHVybiB0aGF0IGludG8gYSBiaXQgbW9yZSB0aGFuIGEg
c3VnZ2VzdGlvbi4gIEknbGwgbWFrZQo+ID4gaXQgYSBOQUsgb24gYWRkaW5nIHRoZW0gdG8gMzIt
Yml0IEFSTS4KPiA+Cj4gCj4gVGhhdCdzIGZpbmUsIGFuZCBJIGFsc28gZGlkIG5vdCB3YW50IHRv
IGNoYW5nZSBBUk0gMzItYml0LiBCdXQsIGRvIHlvdQo+IGhhdmUgYSBzdWdnZXN0aW9uIGhvdyBk
aWZmZXJlbnRpYXRlIGJldHdlZW4gYXJtNjQgYW5kIGFybSBpbgo+IGluY2x1ZGUveGVuL2FybS9o
eXBlcmNhbGwuaCB3aXRob3V0IHVnbHkgaWZkZWZzPwoKU29ycnksIEkgZG9uJ3QuCgpJJ20gc3Vy
cHJpc2VkIEFSTTY0IGRvZXNuJ3QgaGF2ZSBhbnl0aGluZyBsaWtlIHRoYXQsIGJ1dCBJIHN1c3Bl
Y3QKdGhhdCdzIGJlY2F1c2UgdGhleSBkb24ndCBuZWVkIHRvIGRvIGEgc2F2ZS9yZXN0b3JlIHR5
cGUgb3BlcmF0aW9uLgpXaGVyZWFzLCAzMi1iaXQgQVJNIGRvZXMgdmVyeSBtdWNoIG5lZWQgdGhl
IHNhdmUvcmVzdG9yZSBiZWhhdmlvdXIKKGFsdGhvdWdoIG5vdCBpbiB0aGlzIHBhdGguKQoKVGhl
IHByb2JsZW0gaXMsIHR1cm5pbmcgdWFjY2Vzc19lbmFibGUvZGlzYWJsZSBpbnRvIEMgY29kZSBt
ZWFucwp0aGF0IGl0J3Mgb3BlbiB0byBiZWluZyB1c2VkIGVsc2V3aGVyZSBpbiB0aGUga2VybmVs
IChvb2gsIGEgY291cGxlCm9mIHVzZWZ1bCBsb29raW5nIGZ1bmN0aW9ucyB0aGF0IHdvcmsgb24g
Ym90aCBhcmNoaXRlY3R1cmVzISAgSSBjYW4KdXNlIHRoYXQgdG9vISkgYW5kIHRoZW4gd2UgZW5k
IHVwIHdpdGggc3R1ZmYgYnJlYWtpbmcgc3VidGx5LiAgSXQncwp0aGUgcG90ZW50aWFsIGZvciBz
dWJ0bGUgYnJlYWthZ2UgdGhhdCBpcyBtYWtpbmcgbWUgTkFLIHRoZSBpZGVhIG9mCmFkZGluZyB0
aGUgaW5saW5lIEMgZnVuY3Rpb25zLgoKR2l2ZW4gdGhlIHR3byBoYXZlIGRpdmVyZ2VkLCB0aGUg
b25seSBhbnN3ZXIgaXMgaWZkZWZzLCBzb3JyeS4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0
dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUQyBicm9hZGJh
bmQgZm9yIDAuOG1pbGUgbGluZSBpbiBzdWJ1cmJpYTogc3luYyBhdCAxMi4xTWJwcyBkb3duIDYy
MmticHMgdXAKQWNjb3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQ6IDExLjlNYnBzIGRvd24gNTAwa2Jw
cyB1cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
