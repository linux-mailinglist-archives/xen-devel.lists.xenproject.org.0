Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48BF105DC6
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 01:38:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXwvG-0001pd-MD; Fri, 22 Nov 2019 00:35:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sEnY=ZO=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iXwvE-0001pU-H8
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 00:35:40 +0000
X-Inumbo-ID: 00815368-0cc0-11ea-9631-bc764e2007e4
Received: from pandora.armlinux.org.uk (unknown
 [2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00815368-0cc0-11ea-9631-bc764e2007e4;
 Fri, 22 Nov 2019 00:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aNyMrZGi1ytX4T6Y1L2udQxbuMw2fttK87FjgMDAYUk=; b=L+ozNyJ+BLJds7rUUZwTGmJ7R
 5e4PdATY1wuc72kBvYhSNqzWkMLSHsiNJaRKKZ+QW6c/CaPxnlL0mM/RPN1bk4jPOFZREl6QSpL4L
 U3SAD87N8NAF8bzJqfo9CxhGXIHbgmAZZDd6BRqC9ys8sxVq7Xz172xTF71hYopdiv8Ho/rc7y1Yp
 9U9/ujkr8zeakeK8TCVh42YDuJelKERsJKDzxphKgN/A7SiBXQtk6Xcx/3Op+FveXgSucAFoCOSum
 XMJNkFyEpvPjQWNAF0yn6kqWii0P0XsxVVkOtrF7xV1CzBDQeXXUUFjx0ebt5BwyPw9NsN4yUw2ZV
 6LjfuU4/g==;
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:38750)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iXwuz-0001fH-G7; Fri, 22 Nov 2019 00:35:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iXwuy-0003Cf-Q2; Fri, 22 Nov 2019 00:35:24 +0000
Date: Fri, 22 Nov 2019 00:35:24 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Message-ID: <20191122003524.GH25745@shell.armlinux.org.uk>
References: <20191121184805.414758-1-pasha.tatashin@soleen.com>
 <20191121184805.414758-2-pasha.tatashin@soleen.com>
 <20191122002258.GD25745@shell.armlinux.org.uk>
 <CA+CK2bDtADA2eVwJAUEPhpic8vXWegh8yLjo6Q6WmXZDxAfJpA@mail.gmail.com>
 <20191122003403.GG25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191122003403.GG25745@shell.armlinux.org.uk>
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

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTI6MzQ6MDNBTSArMDAwMCwgUnVzc2VsbCBLaW5nIC0g
QVJNIExpbnV4IGFkbWluIHdyb3RlOgo+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDA3OjMwOjQx
UE0gLTA1MDAsIFBhdmVsIFRhdGFzaGluIHdyb3RlOgo+ID4gPiA+ICsjaWZkZWYgQ09ORklHX0NQ
VV9TV19ET01BSU5fUEFOCj4gPiA+ID4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCB1YWNj
ZXNzX2VuYWJsZSh2b2lkKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAgdW5zaWduZWQgbG9uZyB2
YWwgPSBEQUNSX1VBQ0NFU1NfRU5BQkxFOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICBhc20gdm9s
YXRpbGUoIm1jciBwMTUsIDAsICUwLCBjMywgYzAsIDAiIDogOiAiciIgKHZhbCkpOwo+ID4gPiA+
ICsgICAgIGlzYigpOwo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0aWMgX19hbHdh
eXNfaW5saW5lIHZvaWQgdWFjY2Vzc19kaXNhYmxlKHZvaWQpCj4gPiA+ID4gK3sKPiA+ID4gPiAr
ICAgICB1bnNpZ25lZCBsb25nIHZhbCA9IERBQ1JfVUFDQ0VTU19FTkFCTEU7Cj4gPiAKPiA+IE9v
cHMsIHNob3VsZCBiZSBEQUNSX1VBQ0NFU1NfRElTQUJMRS4KPiA+IAo+ID4gPiA+ICsKPiA+ID4g
PiArICAgICBhc20gdm9sYXRpbGUoIm1jciBwMTUsIDAsICUwLCBjMywgYzAsIDAiIDogOiAiciIg
KHZhbCkpOwo+ID4gPiA+ICsgICAgIGlzYigpOwo+ID4gPiA+ICt9Cj4gPiA+Cj4gPiA+IFJhdGhl
ciB0aGFuIGludmVudGluZyB0aGVzZSwgd2h5IG5vdCB1c2UgdWFjY2Vzc19zYXZlX2FuZF9lbmFi
bGUoKS4uCj4gPiA+IHVhY2Nlc3NfcmVzdG9yZSgpIGFyb3VuZCB0aGUgWGVuIGNhbGw/Cj4gPiAK
PiA+IFRoYW5rIHlvdSBmb3Igc3VnZ2VzdGlvbjogdWFjY2Vzc19lbmFibGUoKSBhbmQgdWFjY2Vz
c19kaXNhYmxlKCkgYXJlCj4gPiBjb21tb24gY2FsbHMgd2l0aCBhcm02NCwgc28gSSB3aWxsIG5l
ZWQgdGhlbSwgYnV0IEkgdGhpbmsgSSBjYW4gdXNlCj4gPiBzZXRfZG9tYWluKCkgd2l0aCBEQUNS
X1VBQ0NFU1NfRElTQUJMRSAvREFDUl9VQUNDRVNTX0VOQUJMRSBpbnNpZGUKPiA+IHRoZXNlIGlu
bGluZXMuCj4gCj4gVGhhdCBtYXkgYmUsIGJ1dCBiZSB2ZXJ5IGNhcmVmdWwgdGhhdCB5b3Ugb25s
eSB1c2UgdGhlbSBpbiBBUk12Ny1vbmx5Cj4gY29kZS4gIFVzaW5nIHRoZW0gZWxzZXdoZXJlIGlz
IHVuc2FmZSBhcyB0aGUgZG9tYWluIHJlZ2lzdGVyIGlzIHVzZWQKPiBmb3Igb3RoZXIgcHVycG9z
ZXMsIGFuZCBtZXJlbHkgYmxhdHRpbmcgb3ZlciBpdCAoYXMgeW91cgo+IHVhY2Nlc3NfZW5hYmxl
IGFuZCB1YWNjZXNzX2Rpc2FibGUgZnVuY3Rpb25zIGRvKSBpcyB1bnNhZmUuCgpJbiBmYWN0LCBJ
J2xsIHR1cm4gdGhhdCBpbnRvIGEgYml0IG1vcmUgdGhhbiBhIHN1Z2dlc3Rpb24uICBJJ2xsIG1h
a2UKaXQgYSBOQUsgb24gYWRkaW5nIHRoZW0gdG8gMzItYml0IEFSTS4KCi0tIApSTUsncyBQYXRj
aCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8K
RlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZSBpbiBzdWJ1cmJpYTogc3luYyBhdCAxMi4x
TWJwcyBkb3duIDYyMmticHMgdXAKQWNjb3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQ6IDExLjlNYnBz
IGRvd24gNTAwa2JwcyB1cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
