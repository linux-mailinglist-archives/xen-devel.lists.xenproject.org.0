Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB72E142828
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 11:22:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itU9X-0006Dx-Pv; Mon, 20 Jan 2020 10:19:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UWIx=3J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1itU9V-0006Ds-UW
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 10:19:25 +0000
X-Inumbo-ID: 504517fe-3b6e-11ea-8e9a-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 504517fe-3b6e-11ea-8e9a-bc764e2007e4;
 Mon, 20 Jan 2020 10:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579515558;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iWaZzdZ7kSyKhHXchieSRKvwhZrn8oqptpwnEE7lEAQ=;
 b=WOipADZeXwwW4AMj/NLMss2GbZGI75IXnu7bSCHnCwAbaAn1aFJ/fAt0
 YSMztRzpmrSte9k0YO9Vj7gFqfpiLsXaUkRRZz2tiet+Owkn1DnOPG8kD
 mvSN3EjLrDAe8ZlxxsIvJ3sL5EZfjQo/PDKMXNJtdHQRri1zjfbMlkSms Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6TV+sKZXrSAufhu1beOElFildt4rzq762P7UZmjgOcOil8IBY+G30dFLDesKvkVHUX9jqvAlj6
 EXEURdqdKtGfT5tP+CPV8SXCCcomDN0xWyynhF83pCZ21pbgv9TuyFDdshn4ggRN+MEBknUUOD
 058RIV/B05qYhgdckyAk6wueRp5/4iKSpUsS2Csua1FFlgrf1XkC+EDpwPCO5foAOqcd5q2CRF
 r2QwfTGG7uCnKg2yf1ebz6WFAdPj1tcgygndTiF3oHIGvQVqhzTk5Sdj650OC6zb464Q+ftrro
 h3o=
X-SBRS: 2.7
X-MesageID: 11322337
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,341,1574139600"; d="scan'208";a="11322337"
Date: Mon, 20 Jan 2020 10:19:06 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20200120101906.GW11756@Air-de-Roger>
References: <20200108103857.77236-1-roger.pau@citrix.com>
 <20200108103857.77236-2-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D739C38@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D739C38@SHSMSX104.ccr.corp.intel.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/2] nvmx: fix handling of interrupts
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBKYW4gMTksIDIwMjAgYXQgMDQ6MTU6MDRBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4g
U2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDgsIDIwMjAgNjozOSBQTQo+ID4gCj4gPiBXaGVuIGRv
aW5nIGEgdmlydHVhbCB2bWV4aXQgKGllOiBhIHZtZXhpdCBoYW5kbGVkIGJ5IHRoZSBMMSBWTU0p
Cj4gPiBpbnRlcnJ1cHRzIHNob3VsZG4ndCBiZSBpbmplY3RlZCB1c2luZyB0aGUgdmlydHVhbCBp
bnRlcnJ1cHQgZGVsaXZlcnkKPiA+IG1lY2hhbmlzbSwgYW5kIGluc3RlYWQgc2hvdWxkIGJlIHNp
Z25hbGVkIGluIHRoZSB2bWNzIHVzaW5nIHRoZSBleGl0Cj4gPiByZWFzb24gYW5kIHRoZSBpbnRl
cnJ1cHRpb24taW5mb3JtYXRpb24gZmllbGQgaWYgdGhlICJBY2tub3dsZWRnZQo+ID4gaW50ZXJy
dXB0IG9uIGV4aXQiIHZtZXhpdCBjb250cm9sIGlzIHNldC4KPiA+IAo+ID4gUmVtb3ZlIHRoZSBu
dm14X3VwZGF0ZV9hcGljdiBoZWxwZXI6IGl0J3MgYm9ndXMgdG8gYXR0ZW1wdCB0byBpbmplY3QK
PiA+IGludGVycnVwdHMgb24gdmlydHVhbCB2bWV4aXQgdXNpbmcgdGhlIHZpcnR1YWwgaW50ZXJy
dXB0IGRlbGl2ZXJ5Cj4gPiBhc3Npc3RhbmNlLCBhbmQgaXQncyBhbHNvIGJvZ3VzIHRvIGFjayBp
bnRlcnJ1cHRzIHdpdGhvdXQgY2hlY2tpbmcgaWYKPiA+IHRoZSB2bWV4aXQgIkFja25vd2xlZGdl
IGludGVycnVwdCBvbiBleGl0IiB2bWV4aXQgY29udHJvbCBpcyBzZXQuCj4gPiBudm14X2ludHJf
aW50ZXJjZXB0IGFscmVhZHkgaGFuZGxlcyBpbnRlcnJ1cHRzIGNvcnJlY3RseSBvbiB2aXJ0dWFs
Cj4gPiB2bWV4aXQuCj4gPiAKPiA+IE5vdGUgdGhhdCB0aGlzIGZpeGVzIHRoZSB1c2FnZSBvZiB4
MkFQSUMgYnkgdGhlIEwxIFZNTSwgYXQgbGVhc3Qgd2hlbgo+ID4gdGhlIEwxIFZNTSBpcyBYZW4u
Cj4gCj4gd2hpbGUgdGhpcyBmaXggbWFrZXMgc2Vuc2UgdG8gbWUsIGNhbiB5b3UgYWxzbyB0ZXN0
IG90aGVyIEwxIFZNTXMsCj4gc28gd2UgZG9uJ3Qgb3Zlcmxvb2sgc29tZSBvdGhlciBpbnRlbnRp
b25zIGNvdmVyZWQgb3IgaGlkZGVuIGJ5Cj4gcmVtb3ZlZCBsb2dpYz8KCkkgY291bGQgdGVzdCBv
dGhlciBoeXBlcnZpc29ycywgYnV0IGRvIHdlIHJlYWxseSBleHBlY3QgYW55dGhpbmcKdGhhdCdz
IG5vdCBYZW4gb24gWGVuIHRvIHdvcms/CgpJJ20gYXNraW5nIGJlY2F1c2UgdGhhdCdzIHRoZSBv
bmx5IGNvbWJpbmF0aW9uIHRoYXQncyBhY3R1YWxseSB0ZXN0ZWQKYnkgb3NzdGVzdC4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
