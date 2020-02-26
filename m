Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC9F16FEFA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 13:29:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6vmy-0000Lg-Tx; Wed, 26 Feb 2020 12:27:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxXS=4O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6vmx-0000Lb-FZ
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 12:27:43 +0000
X-Inumbo-ID: 6299d16e-5893-11ea-aba8-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6299d16e-5893-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582720062;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zMpaykTSXI28kpcuIPLBQvIRnT+rLELzdFdo/F5PxU8=;
 b=IvblGd3l5jqT+uvFsncU+k8H1mrFGBQGy7NKWjDprYgjuaV0MJQEaSud
 Sy9g0FZcoWpSgkabLTnIBGOHlcjY1Y5BC8xu3Dr8O68TSQw+oKzsHmqLj
 QsZkoXLzyokYo5maHc/tvETCDXiCjZ6ZYGKgZrqk4B1Z+V/qNn7OPXyaM s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yOMEcwhMxWd0valUmt/dX5VGi/ZlnbREpQXJgGKAJrQJvnHKua43vWeRScAFYbl0muiaWWJDeF
 6hf3ty54PglbymXCNlVWtzrCCoNesMJkcPLn5GdNqfYwGGRCMzFMbt6g4tUDB+6uwsFjdMSgUF
 QBWRAOJTC5F/rc02v7tLICFEVKZUIjrIjvKHmEkhhDymvF1/AEwKBS0ai3p9PTWdvCYM1zJbPK
 2/u0ioqZdp/p/XjfH/6nVD0Hxi9Jo2h8CLVyhySBH6XwoQBVNlpuPtXZeHQbexJ2yJVKGSsUVj
 f5Q=
X-SBRS: 2.7
X-MesageID: 13660051
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,488,1574139600"; d="scan'208";a="13660051"
Date: Wed, 26 Feb 2020 13:27:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200226122730.GD24458@Air-de-Roger.citrite.net>
References: <20200226121921.28627-1-roger.pau@citrix.com>
 <20200226121921.28627-5-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226121921.28627-5-roger.pau@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 4/4] x86/smp: do not use scratch_cpumask
 when in interrupt or exception context
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
Cc: xen-devel@lists.xenproject.org, Sander Eikelenboom <linux@eikelenboom.it>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMDE6MTk6MjFQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFVzaW5nIHNjcmF0Y2hfY3B1bWFzayBpbiBzZW5kX0lQSV9tYXNrIGlzIG5vdCBz
YWZlIGluIElSUSBvciBleGNlcHRpb24KPiBjb250ZXh0IGJlY2F1c2UgaXQgY2FuIG5lc3QsIGFu
ZCBoZW5jZSBzZW5kX0lQSV9tYXNrIGNvdWxkIGJlCj4gb3ZlcndyaXRpbmcgYW5vdGhlciB1c2Vy
IHNjcmF0Y2ggY3B1bWFzayBkYXRhIHdoZW4gdXNlZCBpbiBzdWNoCj4gY29udGV4dHMuCj4gCj4g
SW5zdGVhZCBpbnRyb2R1Y2UgYSBuZXcgY3B1bWFzayB0byBiZSB1c2VkIGJ5IHNlbmRfSVBJX21h
c2ssIGFuZAo+IGRpc2FibGUgaW50ZXJydXB0cyB3aGlsZSB1c2luZyBpdC4KPiAKPiBGYWxsYmFj
ayB0byBub3QgdXNpbmcgdGhlIHNjcmF0Y2ggY3B1bWFzayAoYW5kIGhlbmNlIG5vdCBhdHRlbXBp
bmcgdG8KPiBvcHRpbWl6ZSBJUEkgc2VuZGluZyBieSB1c2luZyBhIHNob3J0aGFuZCkgd2hlbiBp
biBJUlEgb3IgZXhjZXB0aW9uCj4gY29udGV4dC4gTm90ZSB0aGF0IHRoZSBzY3JhdGNoIGNwdW1h
c2sgY2Fubm90IGJlIHVzZWQgd2hlbgo+IG5vbi1tYXNrYWJsZSBpbnRlcnJ1cHRzIGFyZSBiZWlu
ZyBzZXJ2aWNlZCAoTk1JIG9yICNNQykgYW5kIGhlbmNlCj4gZmFsbGJhY2sgdG8gbm90IHVzaW5n
IHRoZSBzaG9ydGhhbmQgaW4gdGhhdCBjYXNlLCBsaWtlIGl0IHdhcyBkb25lCj4gcHJldmlvdXNs
eS4KPiAKPiBGaXhlczogNTUwMGQyNjVhMmE4ICgneDg2L3NtcDogdXNlIEFQSUMgQUxMQlVUIGRl
c3RpbmF0aW9uIHNob3J0aGFuZCB3aGVuIHBvc3NpYmxlJykKPiBSZXBvcnRlZC1ieTogU2FuZGVy
IEVpa2VsZW5ib29tIDxsaW51eEBlaWtlbGVuYm9vbS5pdD4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNl
IHYzOgo+ICAtIERvIG5vdCB1c2UgYSBkZWRpY2F0ZWQgY3B1bWFzaywgYW5kIGluc3RlYWQgcHJl
dmVudCB1c2FnZSB3aGVuIGluCj4gICAgSVJRIGNvbnRleHQuCj4gCj4gQ2hhbmdlcyBzaW5jZSB2
MjoKPiAgLSBGYWxsYmFjayB0byB0aGUgcHJldmlvdXMgSVBJIHNlbmRpbmcgbWVjaGFuaXNtIGlu
ICNNQyBvciAjTk1JCj4gICAgY29udGV4dC4KPiAKPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ICAtIERv
bid0IHVzZSB0aGUgc2hvcnRoYW5kIHdoZW4gaW4gI01DIG9yICNOTUkgY29udGV4dC4KPiAtLS0K
PiAgeGVuL2FyY2gveDg2L3NtcC5jIHwgMTIgKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXAuYyBi
L3hlbi9hcmNoL3g4Ni9zbXAuYwo+IGluZGV4IDU1ZDA4YzlkNTIuLmZhOWJmZTRkNTQgMTAwNjQ0
Cj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3NtcC5jCj4g
QEAgLTY5LDYgKzY5LDE4IEBAIHZvaWQgc2VuZF9JUElfbWFzayhjb25zdCBjcHVtYXNrX3QgKm1h
c2ssIGludCB2ZWN0b3IpCj4gICAgICBib29sIGNwdXNfbG9ja2VkID0gZmFsc2U7Cj4gICAgICBj
cHVtYXNrX3QgKnNjcmF0Y2ggPSB0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2spOwo+ICAKPiArICAg
IGlmICggaW5faXJxKCkgfHzCoGluX21jZSgpIHx8IGluX25taSgpICkKClNvcnJ5LCBzZW50IGFu
ZCBvbGQgdmVyc2lvbiwgd2lsbCBzZW5kIDQuMSB3aXRoIHRoaXMgZml4ZWQuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
