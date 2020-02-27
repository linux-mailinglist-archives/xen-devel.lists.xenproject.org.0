Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1D4171523
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 11:39:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7GY3-0005Iv-Md; Thu, 27 Feb 2020 10:37:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iNYA=4P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j7GY2-0005Ik-BK
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 10:37:42 +0000
X-Inumbo-ID: 2e2ed19e-594d-11ea-b7e8-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e2ed19e-594d-11ea-b7e8-bc764e2007e4;
 Thu, 27 Feb 2020 10:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582799862;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=9+MMsIK/MbbT7AOpn2fRGsNl+0Sw8gii+YZUAfM0uiQ=;
 b=EUZEwBQtmWkcd8yWqveYhBj/Wi+wljDr4PIok2aMnHLumltjwCOevy52
 1tnJxM8nAT5nbYv8jTThc5E9RBG9MV11FDdpDzFbgMgkW9uW1eiu0pvBs
 dcbZHtAWBppTyFCGh7Xncc1X9R7JD1SxXV0KNioL94z8T1SHkJN2etD40 w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DkjyUwD3OxxogqohqzrtyN/PcnF4LKqe/OMV0uPdmowuqyTxnmC9OajPPKTs1myx6e1skquzJ5
 QBE70ZkZeZa8B+I/xNSTciJ2SyTh2euyI/3n5ed27iYOxq+xiIflFx304KP0yfMCqoBDQ1Av8c
 SkxWnwCaU5nYJxpvGk8WMwu1g2d3Ki6Cz5BSFuvLEEoznOIZa2j9GNjQjgrIcmqg9r4IMIc/Y8
 51Hf0HTNYF6ASGSZSKs4Kr+yDU40uLMjj0EghiZVYMWLvE2dnYQBHdqGvKhcSWBqh02b1xswg/
 Tog=
X-SBRS: 2.7
X-MesageID: 13274317
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,491,1574139600"; d="scan'208";a="13274317"
To: Jan Beulich <jbeulich@suse.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-6-andrew.cooper3@citrix.com>
 <88c175bc-ebeb-c40b-fc4e-5e175706c3af@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8730f07d-decd-7ed1-b07b-ce3af000c0ca@citrix.com>
Date: Thu, 27 Feb 2020 10:37:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <88c175bc-ebeb-c40b-fc4e-5e175706c3af@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 05/10] x86/msr: Compile out unused
 logic/objects
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDIvMjAyMCAwODowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjYuMDIuMjAyMCAy
MToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gQEAgLTc2LDE2ICs3NywyNyBAQCB2b2lkIF9f
aW5pdCBpbml0X2d1ZXN0X21zcl9wb2xpY3kodm9pZCkKPj4gIHsKPj4gICAgICBjYWxjdWxhdGVf
cmF3X3BvbGljeSgpOwo+PiAgICAgIGNhbGN1bGF0ZV9ob3N0X3BvbGljeSgpOwo+PiAtICAgIGNh
bGN1bGF0ZV9odm1fbWF4X3BvbGljeSgpOwo+PiAtICAgIGNhbGN1bGF0ZV9wdl9tYXhfcG9saWN5
KCk7Cj4+ICsKPj4gKyAgICBpZiAoIElTX0VOQUJMRUQoQ09ORklHX1BWKSApCj4+ICsgICAgICAg
IGNhbGN1bGF0ZV9wdl9tYXhfcG9saWN5KCk7Cj4+ICsKPj4gKyAgICBpZiAoIGh2bV9lbmFibGVk
ICkKPgo+IEFueSBjaGFuY2Ugb2YgdGFsa2luZyB5b3UgaW50byBkb2luZyB0aGluZ3MgbW9yZSBz
eW1tZXRyaWNhbGx5LAo+IGJ5IGVpdGhlciBhbHNvIHVzaW5nIElTX0VOQUJMRUQoQ09ORklHX0hW
TSkgaGVyZSBvciAuLi4KPgo+PiArICAgICAgICBjYWxjdWxhdGVfaHZtX21heF9wb2xpY3koKTsK
Pj4gIH0KPj4gIAo+PiAgaW50IGluaXRfZG9tYWluX21zcl9wb2xpY3koc3RydWN0IGRvbWFpbiAq
ZCkKPj4gIHsKPj4gLSAgICBzdHJ1Y3QgbXNyX3BvbGljeSAqbXAgPQo+PiAtICAgICAgICB4bWVt
ZHVwKGlzX3B2X2RvbWFpbihkKSA/ICAmcHZfbWF4X21zcl9wb2xpY3kKPj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgOiAmaHZtX21heF9tc3JfcG9saWN5KTsKPj4gKyAgICBzdHJ1
Y3QgbXNyX3BvbGljeSAqbXAgPSBpc19wdl9kb21haW4oZCkKPj4gKyAgICAgICAgPyAoSVNfRU5B
QkxFRChDT05GSUdfUFYpICA/ICAmcHZfbWF4X21zcl9wb2xpY3kgOiBOVUxMKQo+PiArICAgICAg
ICA6IChJU19FTkFCTEVEKENPTkZJR19IVk0pID8gJmh2bV9tYXhfbXNyX3BvbGljeSA6IE5VTEwp
Owo+IC4uLiAoaW1vIHByZWZlcmFibHkpIGh2bV9lbmFibGVkIGhlcmU/IEVpdGhlciB3YXkKPiBS
ZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKVGhlIGFzeW1tZXRy
eSBpcyBkZWxpYmVyYXRlLgoKSW4gdGhlIGZvcm1lciBodW5rLCBodm1fZW5hYmxlZCBpcyBzaG9y
dC1jaXJjdWl0ZWQgdG8gZmFsc2UgZm9yCiFDT05GSUdfSFZNLCBhbmQgaWYgSSBkb24ndCB1c2Ug
aHZtX2VuYWJsZWQsIGhlcmUsIHRoZW4gSSd2ZSBnb3QgdG8KcmV0YWluIHRoZSBsb2dpYyBhdCB0
aGUgdG9wIG9mIGNhbGN1bGF0ZV9odm1fbWF4X3BvbGljeSgpLsKgIFRoYXQgc2VlbXMKc2lsbHku
CgpJbiB0aGlzIGxhdGVyIGh1bmssIHdlIGFyZSBsb29raW5nIGZvciB0aGUgbW9zdCBlZmZpY2ll
bnQgd2F5IHRvIGFsbG93CnRoZSBjb21waWxlciB0byBkaXNjYXJkIHRoZSByZWZlcmVuY2UgdG8g
aHZtX21heF9tc3JfcG9saWN5LsKgIFVzaW5nCmh2bV9lbmFibGVkIHdvdWxkIGJlIGxvZ2ljYWxs
eSBlcXVpdmFsZW50LCBidXQgY29tcGlsZSB0byBtb3JlIGNvZGUgaW4KQ09ORklHX0hWTSBjYXNl
LCBhcyBpdCBpcyBhIHJlYWwgYm9vbGVhbiBuZWVkaW5nIGNoZWNraW5nLgoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
