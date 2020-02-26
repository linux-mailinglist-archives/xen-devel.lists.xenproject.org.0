Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6049516FCA5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 11:55:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6uIV-00061m-80; Wed, 26 Feb 2020 10:52:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NxXS=4O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6uIT-00061h-5A
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 10:52:09 +0000
X-Inumbo-ID: 07899f6e-5886-11ea-93f3-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07899f6e-5886-11ea-93f3-12813bfff9fa;
 Wed, 26 Feb 2020 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582714327;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JTyPh4upIDQ8i/5WKXhxFkAI/SduodFBlfMGZJgEuYo=;
 b=hRdTJY+tl56BzrBp4jt2czCSjVbgu8Wh+NQoX4In2WTxezl5R5kl2Bvt
 CsAC4aZRmXO7OLYVzve1ffQhNwZpaD2sYD6FFNHBqtdvDWzpqQvJM4aj7
 MEwnQJ9K+FPY/jadkA2AflGF/GMylF/14HMWAp0gCnWf3w3dTdr/De5Rs Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kIFiMawFXVbSUPHOnkBPJVQEgaLUXSkda7xOWVSvVOc8npbssQaOQLc1YGuphSqEgKclL5Yv0r
 a5sHafNbXwvl6i0rFpakf1yK5hqPIgGBZkAMH5kfbpd/n+wJXWApZyHYuWY4YKVnnkjwNWukaZ
 ADfPNU0UsxQwK2XCOW9vKOH0Zui4JTkzv+iKHb4fbaCFWbLVTepb48cwVeaPtB9e+fWg7rEmjt
 E2bO8iGmUm48vG/rnPN7Zd/LdDC8uJkU4dYDucb40AC/js4f2SkAAS2j2BqSJhziOVHfw19y7Y
 e7k=
X-SBRS: 2.7
X-MesageID: 13036520
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13036520"
Date: Wed, 26 Feb 2020 11:51:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200226105155.GC24458@Air-de-Roger.citrite.net>
References: <20200224104645.96381-1-roger.pau@citrix.com>
 <20200224104645.96381-5-roger.pau@citrix.com>
 <cae27b7b-1690-7273-635e-95584a474fa5@suse.com>
 <20200226101852.GB24458@Air-de-Roger.citrite.net>
 <fbbce137-2ea5-7154-8411-dc161ff6bfbb@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fbbce137-2ea5-7154-8411-dc161ff6bfbb@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 4/5] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMTE6NDU6NDBBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMDIuMjAyMCAxMToxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFdlZCwgRmViIDI2LCAyMDIwIGF0IDExOjA3OjQ0QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDI0LjAyLjIwMjAgMTE6NDYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
VXNpbmcgc2NyYXRjaF9jcHVtYXNrIGluIHNlbmRfSVBJX21hc2sgaXMgbm90IHNhZmUgYmVjYXVz
ZSBpdCBjYW4gYmUKPiA+Pj4gY2FsbGVkIGZyb20gaW50ZXJydXB0IGNvbnRleHQsIGFuZCBoZW5j
ZSBYZW4gd291bGQgaGF2ZSB0byBtYWtlIHN1cmUKPiA+Pj4gYWxsIHRoZSB1c2VycyBvZiB0aGUg
c2NyYXRjaCBjcHVtYXNrIGRpc2FibGUgaW50ZXJydXB0cyB3aGlsZSB1c2luZwo+ID4+PiBpdC4K
PiA+Pj4KPiA+Pj4gSW5zdGVhZCBpbnRyb2R1Y2UgYSBuZXcgY3B1bWFzayB0byBiZSB1c2VkIGJ5
IHNlbmRfSVBJX21hc2ssIGFuZAo+ID4+PiBkaXNhYmxlIGludGVycnVwdHMgd2hpbGUgdXNpbmcg
aXQuCj4gPj4KPiA+PiBUaGUgYWx0ZXJuYXRpdmUgb2YgYWxzbyBhZGRpbmcgLi4uCj4gPj4KPiA+
Pj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcC5jCj4gPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zbXAu
Ywo+ID4+PiBAQCAtNTksNiArNTksNyBAQCBzdGF0aWMgdm9pZCBzZW5kX0lQSV9zaG9ydGN1dCh1
bnNpZ25lZCBpbnQgc2hvcnRjdXQsIGludCB2ZWN0b3IsCj4gPj4+ICAgICAgYXBpY193cml0ZShB
UElDX0lDUiwgY2ZnKTsKPiA+Pj4gIH0KPiA+Pj4gIAo+ID4+PiArREVDTEFSRV9QRVJfQ1BVKGNw
dW1hc2tfdmFyX3QsIHNlbmRfaXBpX2NwdW1hc2spOwo+ID4+PiAgLyoKPiA+Pj4gICAqIHNlbmRf
SVBJX21hc2soY3B1bWFzaywgdmVjdG9yKTogc2VuZHMgQHZlY3RvciBJUEkgdG8gQ1BVcyBpbiBA
Y3B1bWFzaywKPiA+Pj4gICAqIGV4Y2x1ZGluZyB0aGUgbG9jYWwgQ1BVLiBAY3B1bWFzayBtYXkg
YmUgZW1wdHkuCj4gPj4+IEBAIC02Nyw3ICs2OCwyMSBAQCBzdGF0aWMgdm9pZCBzZW5kX0lQSV9z
aG9ydGN1dCh1bnNpZ25lZCBpbnQgc2hvcnRjdXQsIGludCB2ZWN0b3IsCj4gPj4+ICB2b2lkIHNl
bmRfSVBJX21hc2soY29uc3QgY3B1bWFza190ICptYXNrLCBpbnQgdmVjdG9yKQo+ID4+PiAgewo+
ID4+PiAgICAgIGJvb2wgY3B1c19sb2NrZWQgPSBmYWxzZTsKPiA+Pj4gLSAgICBjcHVtYXNrX3Qg
KnNjcmF0Y2ggPSB0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2spOwo+ID4+PiArICAgIGNwdW1hc2tf
dCAqc2NyYXRjaCA9IHRoaXNfY3B1KHNlbmRfaXBpX2NwdW1hc2spOwo+ID4+PiArICAgIHVuc2ln
bmVkIGxvbmcgZmxhZ3M7Cj4gPj4+ICsKPiA+Pj4gKyAgICBpZiAoIGluX21jKCkgfHwgaW5fbm1p
KCkgKQo+ID4+Cj4gPj4gLi4uIGluX2lycSgpIGhlcmUgd2FzIGNvbnNpZGVyZWQsIGFuZCBkaXNj
YXJkZWQgYmVjYXVzZSBvZj8gV2l0aAo+ID4+IHRoaXMgeW91J2Qgbm90IG5lZWQgdGhlIHNlY29u
ZCBDUFUgbWFzayBhbmQgeW91J2QgYWxzbyBiZSBhYmxlCj4gPj4gdG8gYXZvaWQgZGlzYWJsaW5n
IGFuIHJlLWVuYWJsaW5nIElSUXMuCj4gPiAKPiA+IEkgYWltZWQgdG8gdXNlIHRoZSBzaG9ydGhh
bmQgYXMgbXVjaCBhcyBwb3NzaWJsZSwgYnV0IEkgd291bGQgYWxzbyBiZQo+ID4gZmluZSB3aXRo
IG5vdCB1c2luZyBpdCBpbiBpcnEgY29udGV4dC4gSSBhc3N1bWUgdGhlcmUgYXJlbid0IHRoYXQg
bWFueQo+ID4gZmx1c2hlcyBpbiBpcnEgY29udGV4dCwgYW5kIHRoZW4gdGhlIElQSXMgc2VudCBh
cmUgcHJvYmFibHkgbm90Cj4gPiBicm9hZGNhc3Qgb25lcy4KPiAKPiBXZWxsLCBoZXJlIGl0J3Mg
bm90IGp1c3QgZmx1c2hlcywgaXMgaXQ/CgpObywgdGhpcyBjb3ZlcnMgYWxsIElQSXMuIE15IHJl
bWFyayB3YXMgdGhhdCBmbHVzaCBJUElzIGFyZSBtb3JlCmxpa2VseSB0byB0YXJnZXQgYWxsIENQ
VXMgdGhhbiBvdGhlciBJUElzLCB0b2dldGhlciB3aXRoIGdsb2JhbApyZW5kZXp2b3VzIGJ1dCBJ
IGFzc3VtZSB0aG9zZSBhcmVuJ3QgdGhhdCBmcmVxdWVudC4KCj4gS25vd2luZyBzb21lICh0eXBp
Y2FsKQo+IElSUSBjb250ZXh0IHVzZXMgY291bGQgYWxsb3cgdXMgdGFrZSBhIGJldHRlciBkZWNp
c2lvbi4gQWZ0ZXIKPiBTYW5kZXIncyByZXBvcnQsIGRpZCB5b3UgYWN0dWFsbHkgaWRlbnRpZnkg
d2hhdCBwYXRoKHMpIHRoZQo+IGVhcmxpZXIgY2hhbmdlIGJyb2tlPwoKTm8sIEkgYXNzdW1lIHNv
bWV0aGluZyByZWxhdGVkIHRvIHBhc3N0aHJvdWdoLCBidXQgSSBoYXZlbid0IGJlZW4gYWJsZQp0
byB0cmlnZ2VyIGl0IG15c2VsZi4KCkdvaW5nIGZvciB0aGUgZWFzaWVyIHNvbHV0aW9uIHJpZ2h0
IG5vdyBzZWVtcyBsaWtlIHRoZSBtb3N0IHNlbnNpYmxlCmFwcHJvYWNoLCB3ZSBjYW4gYWx3YXlz
IGFkZCBhIGRlZGljYXRlZCBtYXNrIGlmIG5lY2Vzc2FyeS4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
