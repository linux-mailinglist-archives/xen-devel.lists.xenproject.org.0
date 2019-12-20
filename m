Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539F81281E8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 19:08:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiMf2-0003Rz-QV; Fri, 20 Dec 2019 18:06:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ROLc=2K=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iiMf1-0003Ru-Pe
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 18:05:59 +0000
X-Inumbo-ID: 5fe2656e-2353-11ea-a1e1-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fe2656e-2353-11ea-a1e1-bc764e2007e4;
 Fri, 20 Dec 2019 18:05:59 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id m24so9825171wmc.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 10:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WiaOeGztf9DHwsEsg0ybWDTEhXF8vStjISPpKvg9Nxg=;
 b=m5hXN/jiLzikbgBIoTfEMgo3OMGvCq238NSkn7H7ZXfwl2WMozH2hHmbi/iNDkSsGQ
 o6fkpXGILms5im83mmVeL+OiZzmkqFdn9kvYMNTZfmWRxP/56q9Yk5eWeTX3m3FNwKcF
 aUX98uppOPM6SZxxmdU1ZlBrR44Um7cnXth3inPhm5EqMwW3gAAV0+hcRN64Ct05z7RO
 V9LjQK6Tnt7InBh21gow9t1M+hm04WhJNqNz/ExrNDpKvVJ1XRYJbcVhqSCV0VUkf8JM
 DG+6bNxpprVDruvFcZq4T0q7JXEDrBY4J3Sw9kB4WPZ5jnZmBYwn6DoopuLWAEWjm5DN
 02qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WiaOeGztf9DHwsEsg0ybWDTEhXF8vStjISPpKvg9Nxg=;
 b=Dbg6a+7ZP7/jmH0oSQyGGWHnJkuNEdxf4C/7DvY3w7BqXBI45uJ7EuOmQMSDLGEVEA
 MKtMpRJKUYMQkBuoUX9EjZdZnR2OWKzfPEhL6JzdM2b3ftWMw4guk2ce2qhevJ3ROq3Z
 WJzSov0WBvITY4msGvCXYOIbMNfqFxdQ/0shFm1hQwNBesKCYLFBKBoaUiATS1LGh9w4
 74yRv8w6cF2izeWc7h1AcoAjTjE6G2Cmycz2Es05/SN8ePTUz7AvBKSZZn5a5MVgGgke
 N2Msj3ByvglzAanOs9zK8dG/f2KnCbdcx9kwPYW+czbS3x3NK8xEKRCP2sBBG0mzjoBQ
 oXkA==
X-Gm-Message-State: APjAAAVX+DYiF7SyQ0+sMSV4eWgi2WD0msaNLtPMzMDZf7sJrLnPslEz
 U0ESoLcSPFHtlfyGioq76C4zj2sIqr8wFYhzbi0=
X-Google-Smtp-Source: APXvYqwGrmwT7koZSPJA2gJNUtA5w7hs0/csAFoeaBmyv3mDHZNGcDeB0y5tGDmLky1r5b/GIJYKpLXMuEgyyc6Oa1k=
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr17346118wmc.168.1576865158166; 
 Fri, 20 Dec 2019 10:05:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
 <ba37b587-6a4a-ecd8-3e2f-400e2755b24d@suse.com>
 <CABfawhmGQz8cAQWv-pkTXTNNXS-ML6wDcCon5ONAUZr_VP8WUA@mail.gmail.com>
 <530c2a0e-c79a-b540-8d6a-9d50e22bff41@citrix.com>
 <CABfawh=Si977UzkWKbYHoYEW+daLFQNLvOF8YvznxmmeM_BDaA@mail.gmail.com>
 <2122fc00-bf6e-cedd-3b49-d53065a40832@citrix.com>
 <CABfawh=6SjqOT1nhfL+73FfQG34W=iJpUoGr6kT0oBdnyERrmA@mail.gmail.com>
 <770cee09-050f-a7d1-75ce-c75ca1ede8fe@citrix.com>
In-Reply-To: <770cee09-050f-a7d1-75ce-c75ca1ede8fe@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 20 Dec 2019 11:05:22 -0700
Message-ID: <CABfawh=9XzjCKsLT+oVCZJrycTCvU_HwsjpPd6m4p-hPzs3okA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 01/20] x86: make hvm_{get/set}_param
 accessible
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjAsIDIwMTkgYXQgMTE6MDAgQU0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAyMC8xMi8yMDE5IDE3OjUwLCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPiBPbiBGcmksIERlYyAyMCwgMjAxOSBhdCAxMDo0NyBBTSBBbmRy
ZXcgQ29vcGVyCj4gPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gT24g
MjAvMTIvMjAxOSAxNzozNiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+PiBPbiBGcmksIERl
YyAyMCwgMjAxOSBhdCAxMDozMiBBTSBBbmRyZXcgQ29vcGVyCj4gPj4+IDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPiB3cm90ZToKPiA+Pj4+IE9uIDIwLzEyLzIwMTkgMTc6MjcsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+Pj4+PiBPbiBGcmksIERlYyAyMCwgMjAxOSBhdCA5OjQ3IEFNIEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4+Pj4+IE9uIDE4LjEyLjIw
MTkgMjA6NDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+Pj4+Pj4+IEN1cnJlbnRseSB0aGUg
aHZtIHBhcmFtZXRlcnMgYXJlIG9ubHkgYWNjZXNzaWJsZSB2aWEgdGhlIEhWTU9QIGh5cGVyY2Fs
bHMuIEJ5Cj4gPj4+Pj4+PiBleHBvc2luZyBodm1fe2dldC9zZXR9X3BhcmFtIGl0IHdpbGwgYmUg
cG9zc2libGUgZm9yIFZNIGZvcmtpbmcgdG8gY29weSB0aGUKPiA+Pj4+Pj4+IHBhcmFtZXRlcnMg
ZGlyZWN0bHkgaW50byB0aGUgY2xvbmUgZG9tYWluLgo+ID4+Pj4+PiBIYXZpbmcgcGVla2VkIGFo
ZWFkIGF0IHBhdGNoIDE3LCB3aGVyZSB0aGlzIGdldHMgdXNlZCwgSSB3b25kZXIgd2h5Cj4gPj4+
Pj4+IHlvdSB3YW50IGEgcGFpciBvZiBvbmUtYnktb25lIGZ1bmN0aW9ucywgcmF0aGVyIHRoYW4g
YSBjb3B5LWFsbCBvbmUuCj4gPj4+Pj4+IFRoaXMgdGhlbiB3b3VsZG4ndCByZXF1aXJlIGV4cG9z
dXJlIG9mIHRoZSBmdW5jdGlvbnMgeW91IHRvdWNoIGhlcmUuCj4gPj4+Pj4gV2VsbCwgcHJvdmlk
ZWQgdGhlcmUgaXMgbm8gc3VjaCBmdW5jdGlvbiBpbiBleGlzdGVuY2UgdG9kYXkgaXQgd2FzCj4g
Pj4+Pj4ganVzdCBlYXNpZXIgdG8gdXNlIHdoYXQncyBhbHJlYWR5IGF2YWlsYWJsZS4gSSBzdGls
bCB3b3VsZG4ndCB3YW50IHRvCj4gPj4+Pj4gaW1wbGVtZW50IGEgb25lLXNob3QgZnVuY3Rpb24g
bGlrZSB0aGF0IGJlY2F1c2UgdGhpcyBzYW1lIGNvZGUtcGF0aCBpcwo+ID4+Pj4+IHNoYXJlZCBi
eSB0aGUgc2F2ZS1yZXN0b3JlIG9wZXJhdGlvbnMgb24gdGhlIHRvb2xzdGFjayBzaWRlLCBzbyBh
dAo+ID4+Pj4+IGxlYXN0IEkgaGF2ZSBhIHJlYXNvbmFibGUgYXNzdW1wdGlvbiB0aGF0IGl0IHdv
bid0IGJyZWFrIG9uIG1lIGluIHRoZQo+ID4+Pj4+IGZ1dHVyZS4KPiA+Pj4+IEluIHBhcnRpY3Vs
YXIsIGEgbnVtYmVyIG9mIHRoZSBzZXQgb3BlcmF0aW9ucyBhcmUgZGlzdGluY3RseQo+ID4+Pj4g
bm9uLXRyaXZpYWwuICAoT1RPSCwgdGhvc2UgYXJlIG5vdCBsb25nIGZvciB0aGlzIHdvcmxkLCBh
bmQgc2hvdWxkIGJlCj4gPj4+PiBjcmVhdGlvbiBYODZfRU1VXyogY29uc3RhbnRzIGluc3RlYWQp
Lgo+ID4+Pj4KPiA+Pj4gSSBhY3R1YWxseSB3YW50ZWQgdG8gYXNrIGFib3V0IHRoYXQuIEluCj4g
Pj4+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXRv
b2xzL2xpYnhjL3hjX3NyX3NhdmVfeDg2X2h2bS5jO2g9OTdhOGM0OTgwN2YxOTJjNDcyMDk1MjVm
NTFlNGQ3OWE1MGM2NmNlYztoYj1IRUFEI2w2MQo+ID4+PiB0aGUgdG9vbHN0YWNrIG9ubHkgc2Vs
ZWN0cyBjZXJ0YWluIEhWTSBwYXJhbXMgdG8gYmUgc2F2ZWQgKGFuZAo+ID4+PiByZXN0b3JlZCBs
YXRlcikuIEkgb3JpZ2luYWxseSBmb2xsb3dlZCB0aGUgc2FtZSBsb2dpYyBpbiB0aGUgZm9yawo+
ID4+PiBjb2RlLXBhdGggYnV0IGFmdGVyIGEgbG90IG9mIGV4cGVyaW1lbnRzIGl0IGxvb2tzIGxp
a2UgaXQncyBhY3R1YWxseQo+ID4+PiBPSyB0byBncmFiIGFsbCBwYXJhbXMgYnV0IG9ubHkgY2Fs
bCBzZXRfcGFyYW0gb24gdGhlIG9uZXMgdGhhdCBoYXZlIGEKPiA+Pj4gbm9uLXplcm8gdmFsdWUu
IFNvIHNldHRpbmcgc29tZSBwYXJhbXMgd2l0aCBhIHplcm8gdmFsdWUgaGFzIGNlcnRhaW5seQo+
ID4+PiBsZWFkIHRvIGNyYXNoZXMsIGJ1dCBvdGhlcndpc2UgaXQgc2VlbXMgdG8gImp1c3Qgd29y
ayIgdG8gY29weSBhbGwgdGhlCj4gPj4+IHJlc3QuCj4gPj4gSSB0aGluayB5b3UncmUgdHJ5aW5n
IHRvIGFzY3JpYmUgYW55IGZvcm0gb2YgZGVzaWduL3BsYW4gdG8gYSBzeXN0ZW0KPiA+PiB3aGlj
aCBoYWQgbm9uZS4gOikKPiA+Pgo+ID4+IFRoZSBjb2RlIHlvdSBxdW90ZSB3YXMgbGlrZSB0aGF0
IGJlY2F1c2UgdGhhdCBpcyBob3cgbGVnYWN5IG1pZ3JhdGlvbgo+ID4+IHdvcmtlZC4gIFRoYXQg
c2FpZCwgZWxpZGluZyBlbXB0eSByZWNvcmRzIHdhcyBhbiBlZmZvcnQtc2F2aW5nIGV4ZXJjaXNl
Cj4gPj4gKGF2b2lkIHJlZHVuZGFudCBoeXBlcmNhbGxzIG9uIGRlc3RpbmF0aW9uIHNpZGUpLCBu
b3QgYmVjYXVzZSB0aGVyZSB3YXMKPiA+PiBhbnkgc3VnZ2VzdGlvbiB0aGF0IGF0dGVtcHRpbmcg
dG8gZXhwbGljaXRseSBzZXQgMCB3b3VsZCBjcmFzaC4KPiA+Pgo+ID4+IERvIHlvdSBoYXZlIGFu
eSBpZGVhIHdoaWNoIHBhcmFtIHdhcyBjYXVzaW5nIHByb2JsZW1zPwo+ID4gWWVzLCBIVk1fUEFS
QU1fSURFTlRfUFQgd2FzIG9uZSBzdXJlLiBUaGVyZSBtYXkgaGF2ZSBiZWVuIG90aGVycyAoSQo+
ID4gZG9uJ3QgcmVjYWxsIG5vdykgYnV0IHNpbXBseSBjaGVja2luZyBmb3Igbm9uLXplcm8gdmFs
dWUgYmVmb3JlCj4gPiBjYWxsaW5nIHNldF9wYXJhbSByZXNvbHZlZCBldmVyeXRoaW5nLgo+Cj4g
SURFTlRfUFQgaXMgYW4gV2VzdG1lcmUoPykgd3JpbmtsZS4KPgo+IFRoZXJlIHdhcyBvbmUgcHJv
Y2Vzc29yIGJhY2sgaW4gdGhvc2UgZGF5cyB3aGljaCBzdXBwb3J0ZWQgRVBULCBidXQKPiBkaWRu
J3Qgc3VwcG9ydCBWVC14IHJ1bm5pbmcgaW4gdW5wYWdlZCBtb2RlLiAgVGhlcmVmb3JlLCB3ZSBo
YWQgdG8gZmFrZQo+IHVwIHVucGFnZWQgbW9kZSBieSBwb2ludGluZyB2Q1IzIGF0IGFuIGlkZW50
aXR5IHBhZ2V0YWJsZSBpbnNpZGUgdGhlCj4gZ3Vlc3RzIHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2Uu
CgpFaCwgeWlrZXMuCgo+Cj4gVGhlIGNyYXNoIHdvbid0IGJlIGZyb20gdGhlIElERU5UX1BUIGl0
c2VsZiwgYnV0IHRoZSBwYWdpbmdfdXBkYXRlX2NyMygpCj4gc2lkZSBlZmZlY3QuICBXYXMgaXQg
YSBob3N0IGNyYXNoLCBvciBndWVzdCBjcmFzaD8KPgoKWWVzLCB0aGF0J3Mgd2hhdCBJIHJlY2Fs
bCBhZnRlciBJIGxvb2tlZCBpbnRvIGl0LiBJdCB3YXMgYSBndWVzdCBhCmNyYXNoIGFzIEkgcmVt
ZW1iZXIuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
