Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBB510AF2B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 13:00:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZvvy-00062i-Ek; Wed, 27 Nov 2019 11:56:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eB6N=ZT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZvvw-00062b-NJ
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:56:36 +0000
X-Inumbo-ID: f624cf66-110c-11ea-a3af-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f624cf66-110c-11ea-a3af-12813bfff9fa;
 Wed, 27 Nov 2019 11:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574855797;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=byxLSWFSJXJZ1hmmXd3llf0af4VvgM2r0IeC6tgGOww=;
 b=KSKdE36b4BhaW2S9QDjpz+iWRqhlUM5P0g4TXAB+0Gwfykk4iz/o+Lr8
 fWj2pk1yrajD1b6A9MuaulLyWSpI+qxc6Six0GNjwplwv9VHpqy8Vvier
 PxNuSvFI5liNGsZPkLjjbnjLPkPZ/wHQzUk87FTHsAsCJBD4vUB+vQfp3 U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Y4d/9W1xZxf85m9+WS+ZmcAh/Fx8M1MfHSjXr7CMJbEvQxr4vVQFb+reM30FYtbvwWsdeMYl8k
 RGrZvntNaTaCo4c+6rdnsZ/vGDeVOw/1v7WNxLCnF06fwuNt3NUQZopT8GprMTByjyxXd9zA2g
 fFESWVsdA9yi1Vw96pCCY9pemG+jWOFBKVeAd3/IBL0cljUV4BKbeyUu9oXcsjsNqszK6/kAhg
 uL1fB+4A61kJjT+HYgAJu8B2HYXzPLKbHOPOLOXcplV+agQ+00wRhn43BvV6jZSyNzh9t7VEix
 zD4=
X-SBRS: 2.7
X-MesageID: 8894528
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,249,1571716800"; 
   d="scan'208";a="8894528"
Date: Wed, 27 Nov 2019 12:56:29 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191127115629.GS980@Air-de-Roger>
References: <20191126132648.6917-1-roger.pau@citrix.com>
 <20191126132648.6917-3-roger.pau@citrix.com>
 <a6193850-7f1c-64c9-46b9-2319701e914b@suse.com>
 <20191127112236.GP980@Air-de-Roger>
 <f2a51992-e507-dd32-12c9-2fda3d5431fc@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f2a51992-e507-dd32-12c9-2fda3d5431fc@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13 v3 2/2] x86/vmx: always sync PIR to
 IRR before vmentry
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
Cc: Juergen Gross <jgross@suse.com>, KevinTian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Joe Jin <joe.jin@oracle.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTI6MzA6MDZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjcuMTEuMjAxOSAxMjoyMiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUdWUsIE5vdiAyNiwgMjAxOSBhdCAwNTo1MDozMlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAyNi4xMS4yMDE5IDE0OjI2LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaXJxLmMKPiA+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2
bS9pcnEuYwo+ID4+PiBAQCAtNTE1LDcgKzUxNSwxMSBAQCB2b2lkIGh2bV9zZXRfY2FsbGJhY2tf
dmlhKHN0cnVjdCBkb21haW4gKmQsIHVpbnQ2NF90IHZpYSkKPiA+Pj4gIHN0cnVjdCBodm1faW50
YWNrIGh2bV92Y3B1X2hhc19wZW5kaW5nX2lycShzdHJ1Y3QgdmNwdSAqdikKPiA+Pj4gIHsKPiA+
Pj4gICAgICBzdHJ1Y3QgaHZtX2RvbWFpbiAqcGxhdCA9ICZ2LT5kb21haW4tPmFyY2guaHZtOwo+
ID4+PiAtICAgIGludCB2ZWN0b3I7Cj4gPj4+ICsgICAgLyoKPiA+Pj4gKyAgICAgKiBBbHdheXMg
Y2FsbCB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxIHNvIHRoYXQgUElSIGlzIHN5bmNlZCBpbnRvIElS
UiB3aGVuCj4gPj4+ICsgICAgICogdXNpbmcgcG9zdGVkIGludGVycnVwdHMuCj4gPj4+ICsgICAg
ICovCj4gPj4+ICsgICAgaW50IHZlY3RvciA9IHZsYXBpY19oYXNfcGVuZGluZ19pcnEodik7Cj4g
Pj4KPiA+PiBEaWQgeW91IGNvbnNpZGVyIGRvaW5nIHRoaXMgY29uZGl0aW9uYWxseSBlaXRoZXIg
aGVyZSAuLi4KPiA+Pgo+ID4+PiBAQCAtNTMwLDcgKzUzNCw2IEBAIHN0cnVjdCBodm1faW50YWNr
IGh2bV92Y3B1X2hhc19wZW5kaW5nX2lycShzdHJ1Y3QgdmNwdSAqdikKPiA+Pj4gICAgICBpZiAo
IHZsYXBpY19hY2NlcHRfcGljX2ludHIodikgJiYgcGxhdC0+dnBpY1swXS5pbnRfb3V0cHV0ICkK
PiA+Pj4gICAgICAgICAgcmV0dXJuIGh2bV9pbnRhY2tfcGljKDApOwo+ID4+PiAgCj4gPj4+IC0g
ICAgdmVjdG9yID0gdmxhcGljX2hhc19wZW5kaW5nX2lycSh2KTsKPiA+Pj4gICAgICBpZiAoIHZl
Y3RvciAhPSAtMSApCj4gPj4+ICAgICAgICAgIHJldHVybiBodm1faW50YWNrX2xhcGljKHZlY3Rv
cik7Cj4gPj4KPiA+PiAuLi4gb3IgaGVyZT8KPiA+IAo+ID4gSSdtIGFmcmFpZCBJIGRvbid0IGZv
bGxvdy4gVGhlIHdob2xlIHBvaW50IG9mIHRoaXMgY2hhbmdlIGlzIHRvIGVuc3VyZQo+ID4gdmxh
cGljX2hhc19wZW5kaW5nX2lycSBpcyB1bmNvbmRpdGlvbmFsbHkgY2FsbGVkIGluCj4gPiBodm1f
dmNwdV9oYXNfcGVuZGluZ19pcnEsIHNvIEknbSBub3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5ICJk
b2luZyB0aGlzCj4gPiBjb25kaXRpb25hbGx5Li4uIi4KPiAKPiBEbyBpdCBlYXJseSB3aGVuIHVz
aW5nIGludGVycnVwdCBwb3N0aW5nLCBhbmQga2VlcCBpdCBpbiBpdHMKPiBjdXJyZW50IHBsYWNl
IG90aGVyd2lzZS4KPiAKPiA+PiBJIGFzayBub3Qgb25seSBiZWNhdXNlIHRoZSBmdW5jdGlvbiBp
c24ndCBleGFjdGx5Cj4gPj4gY2hlYXAgdG8gY2FsbCAoYXMgaWlyYyB5b3UgZGlkIGFsc28gbWVu
dGlvbiBkdXJpbmcgdGhlIHYyCj4gPj4gZGlzY3Vzc2lvbiksIGJ1dCBhbHNvIGJlY2F1c2Ugb2Yg
aXRzIGludGVyYWN0aW9uIHdpdGggVmlyaWRpYW4KPiA+PiBhbmQgbmVzdGVkIG1vZGUuIEluIGNh
c2Ugb2YgcHJvYmxlbXMgdGhlcmUsIGF2b2lkaW5nIHRoZSB1c2UKPiA+PiBvZiBpbnRlcnJ1cHQg
cG9zdGluZyB3b3VsZCBiZSBhIHdvcmthcm91bmQgaW4gc3VjaCBjYXNlcyB0aGVuLgo+ID4gCj4g
PiBXb3VsZCB5b3UgbGlrZSBtZSB0byBleHBvcnQgc29tZXRoaW5nIGxpa2UgdmxhcGljX3N5bmNf
cGlyX3RvX2lyciBhbmQKPiA+IGNhbGwgaXQgdW5jb25kaXRpb25hbGx5IGluc3RlYWQgb2YgY2Fs
bGluZyB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxPwo+IAo+IFRoaXMgbG9va3MgdG8gYmUgYW5vdGhl
ciBvcHRpb24sIHllcy4gQWxiZWl0IGluc3RlYWQgb2YgbWFraW5nCj4gbm9uLXN0YXRpYyAod2hp
Y2ggSSBhc3N1bWUgaXMgd2hhdCB5b3UgbWVhbiBieSAiZXhwb3J0IiksIG1heWJlCj4gc2ltcGx5
IG1ha2UgdGhpcyBhIHN0YXRpYyBpbmxpbmUgaW4gdmxhcGljLmggdGhlbi4KClllcywgdGhhdCB3
b3VsZCB3b3JrIGFuZCBJTU8gaXMgYmV0dGVyIHRoYW4gbW92aW5nIHRoZSBjYWxsIHRvCnZsYXBp
Y19oYXNfcGVuZGluZ19pcnEgYXJvdW5kLiBBcmUgeW91IE9LIHdpdGggdGhpcyBhcHByb2FjaD8K
ClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
