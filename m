Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01CD7B232
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 20:42:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsX2Z-0005NH-Uj; Tue, 30 Jul 2019 18:40:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aMGE=V3=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hsX2Y-0005Fq-MG
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 18:40:02 +0000
X-Inumbo-ID: 6fc4be12-b2f9-11e9-8980-bc764e045a96
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6fc4be12-b2f9-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 18:40:01 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f9so66843025wre.12
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2019 11:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3tN9dWuQm39Fzmvm00nJ/Csd7lrwuKdyABKW0Fi8jjk=;
 b=YAwlxg6SGgQjSGYqz1xVJl4dGQMZ9YqBFTT+f3Y8acPfdP1V1KR5TWHt859taaaBWw
 FbVPI+5w0bqXlGcEmnNloLvYwF4FFJQnsEZbvnMx86rlzf1wvMRYICmTWVVI6gArzP8J
 XQiM2qiFViq4aqngE/eqMWOEY0LI2i/70XFuPm//g9Ey5AFLZw+sl2FH1tqC3ydjPyAH
 VPOmJNNTfywOn7Z8lSIHHKRYAlExxq2Z/3cp4FSTAXY8mM/8lfIg7bF1nrvmYymGrkZQ
 dWYBsGSlFqR7TpBSOu5AvIVnvDCMg2TkHy747O+fb1N6jF3XC6XEF17TyqCJkcWNYAnY
 3TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3tN9dWuQm39Fzmvm00nJ/Csd7lrwuKdyABKW0Fi8jjk=;
 b=m6z+Z3bjOuc5R49Un8WG+pHGMappYQqvY8XnpYJqF3xSQnc5bbC1ymfVNIEHCwATjS
 CwpMbXGbqy/e8RPFRir8x7OypVv/5VdR41q8q4AkJZIqss8h0T9+X/uIKtoMjQLzBHFr
 vKiY3IJBCEJwlqKoivfbrVbSccir4Lhkjz0I+IV1UFqnDGC3Bgf/4hvEZHzkRLM9W29Z
 xUuAwzqM7sG3iybxYPsWVueFb9sU9SRR/a/H8Pm1szsg34KSI/xlguXocA6i3qlFNzM1
 RWSvttHiVy49SL2hV95CHmGzlCs6LhvN7gE5V3zAb0RFoGaouybDytXMKs4ubIPa3nHy
 G1yA==
X-Gm-Message-State: APjAAAUGnNMjFs/i8+c0je6Dvk3RG3RrRwz2IeyuAr/AcojXy7mu7O9V
 7raoXgNkMv4HtU/mRbTR6G6J1qHwa8Z+WWzkkjY=
X-Google-Smtp-Source: APXvYqw2pdlteF1JTpcLwZQ/6zImeR6rzwLgz683Zde6Nh9ivv5o70oe5MKR2Csjem5kfxzo5xESuL7CFQ+vQVedABM=
X-Received: by 2002:adf:9486:: with SMTP id 6mr98768103wrr.242.1564511999811; 
 Tue, 30 Jul 2019 11:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <5c6f3ed7b2f444918feea4f4b7cec107@ainfosec.com>
 <CABfawhmhPy-BWwRfZ-+pB1Zr98ony9jeXoOEOx+HZBm_z+Ez=g@mail.gmail.com>
 <93971fac-b839-802f-a508-39fa79478db5@citrix.com>
In-Reply-To: <93971fac-b839-802f-a508-39fa79478db5@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 30 Jul 2019 12:39:23 -0600
Message-ID: <CABfawh=B_nOAbV-JzCpFUEfcmVnudAJxh7buUVJRFqMPm2yE6g@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [RFC] Generating Go bindings for libxl
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
Cc: Brendan Kerrigan <kerriganb@ainfosec.com>, "wl@xen.org" <wl@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Nicholas Rosbrook <rosbrookn@ainfosec.com>,
 Nicolas Belouin <nicolas.belouin@gandi.net>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgOTo0OSBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gNy8zMC8xOSAyOjQ4IFBNLCBUYW1hcyBLIExl
bmd5ZWwgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1bCAzMCwgMjAxOSBhdCA3OjMyIEFNIE5pY2hvbGFz
IFJvc2Jyb29rCj4gPiA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBI
ZWxsbywKPiA+Pgo+ID4+IEFzIGEgZm9sbG93IHVwIHRvIHRoZSBwcmVzZW50YXRpb24gdGhhdCBC
cmVuZGFuIEtlcnJpZ2FuIGFuZCBJIGdhdmUgYXQgWGVuCj4gPj4gc3VtbWl0IGVhcmxpZXIgdGhp
cyBtb250aCwgIkNsaWVudCBWaXJ0dWFsaXphdGlvbiBUb29sc3RhY2sgaW4gR28iLCBJIHdvdWxk
IGxpa2UgdG8gb3Blbgo+ID4+IGEgZGlzY3Vzc2lvbiBhcm91bmQgdGhlIGRldmVsb3BtZW50IG9m
IEdvIGJpbmRpbmdzIGZvciBsaWJ4bC4gR2VvcmdlIER1bmxhcCwKPiA+PiBOaWNvbGFzIEJlbG91
aW4gYW5kIEkgaGF2ZSBoYWQgc29tZSBkaXNjdXNzaW9uIG9mZi1saW5lIGFscmVhZHkuCj4gPj4K
PiA+PiBTbyBmYXIsIHRoZXNlIGFyZSB0aGUgdG9waWNzIG9mIGRpc2N1c3Npb246Cj4gPgo+ID4g
SGkgTmljaG9sYXMsCj4gPiB0byBhZGQgdG8gdGhlIGxpc3Qgb2YgdG9waWNzIEkganVzdCB3YW50
IHRvIG1lbnRpb24gdGhhdCBwZXJoYXBzIGl0Cj4gPiBtYXkgYmUgYmVuZWZpY2lhbCB0byBjb25z
aWRlciBwYXJ0cyBvZiB0aGUgZ28gYmluZGluZ3Mgbm90IGdvIHRvIGxpYnhsCj4gPiBhdCBhbGwu
IEkgaGF2ZSBiZWVuIGRpZ2dpbmcgdGhyb3VnaCBsaWJ4bCBmb3IgdGhlIHBhc3QgY291cGxlIG1v
bnRocwo+ID4gYW5kIGl0J3MgYXN5bmNocm9ub3VzIGNhbGxiYWNrIHN5c3RlbSBpcyBkYW1uIG5l
YXIgaW1wb3NzaWJsZSB0bwo+ID4gZm9sbG93IGFuZCBJIGp1c3QgY2FuJ3Qgc2hha2UgdGhlIGZl
ZWxpbmcgdGhhdCBpdCB3b3VsZCBiZSBhIGxvdAo+ID4gZWFzaWVyIHRvIGZvbGxvdyBpZiBpdCB3
YXMgaW4gZ28uCj4KPiBTbyBJIGRvbid0IHRoaW5rIHdlJ3JlIGV2ZXIgZ29pbmcgdG8gc3dpdGNo
IHRvIGdvbGFuZyBiZWluZyBvdXIgcHJpbWFyeQo+IHRvb2xzdGFjayBsYW5ndWFnZSwgYmVjYXVz
ZSBjYWxsaW5nIGl0IGZyb20gb3RoZXIgbGFuZ3VhZ2VzIGlzbid0IHJlYWxseQo+IGFuIG9wdGlv
bi4gIFRoYXQgbWVhbnMgdGhhdCBpbXBsZW1lbnRpbmcgdGhpbmdzIGxpa2UgZG9tYWluIGNyZWF0
aW9uIGluCj4gR28gbWVhbiBkdXBsaWNhdGluZyBmdW5jdGlvbmFsaXR5IGluIHR3byBwbGFjZXMs
IHdoaWNoIGlzCj4gZXh0cmFvcmRpbmFyaWx5IGV4cGVuc2l2ZSBmcm9tIGEgc29mdHdhcmUtZW5n
aW5lZXJpbmcgcGVyc3BlY3RpdmUuCj4KPiBGV0lXIEkgdGhpbmsgdGhlIGFzeW5jaHJvbm91cyBj
YWxsYmFjayBzeXN0ZW0ganVzdCBuZWVkcyBiZXR0ZXIKPiBkb2N1bWVudGF0aW9uLiAgSXQgYWx3
YXlzIHRha2VzIG1lIGEgbGl0dGxlIGJpdCB0byBnZXQgbXkgYmVhcmluZ3MgYWdhaW4KPiBvbmNl
IEkgaGF2ZSB0byBjaGFuZ2UgdGhhdCBjb2RlLCBidXQgb25jZSBJIGRvLCBldmVyeXRoaW5nIGlz
Cj4gY29uc2lzdGVudC4gIEFuZCBhcyBJIHVuZGVyc3RhbmQgaXQsIHRoZSBleHRlcm5hbCBpbnRl
cmZhY2Ugd2FzIHdyaXR0ZW4KPiBwcmltYXJpbHkgd2l0aCBsaWJ2aXJ0IGluIG1pbmQsIHNvIGl0
IHdvdWxkIHByb2JhYmx5IGJlIGRpZmZpY3VsdCB0bwo+IGNoYW5nZSBpdCB3aGlsZSByZW1haW5p
bmcgY29tcGF0aWJsZS4KPgo+ID4gTm90IHRvIG1lbnRpb24gdGhlIHBlcmZvcm1hbmNlCj4gPiBp
c3N1ZXMgd2l0aCB0aGUgYnVpbHQtaW4gZ2FyYmFnZSBjb2xsZWN0b3IKPgo+IFdoYXQgcGVyZm9y
bWFuY2UgaXNzdWVzIHdlcmUgeW91IHNlZWluZyB3aXRoIGxpYnhsJ3MgZ2FyYmFnZSBjb2xsZWN0
b3I/Cj4gSSB0aG91Z2h0IGl0IGp1c3Qga2VwdCBhIGxpc3Qgb2YgcG9pbnRlcnMgYW5kIGZyZWVk
IHRoZW0gYXQgdGhlIHZlcnkgZW5kLgoKSSBkaWRuJ3QgaW52ZXN0aWdhdGUgdG9vIGNsb3NlbHkg
YnV0IG9uIHNvbWUgb2NjYXNpb25zIGEgY29uc2lkZXJhYmxlCmFtb3VudCBvZiB0aGUgZXhlY3V0
aW9uIHRpbWUgd2FzIGJlaW5nIHNwZW50IGluIHRoZXJlIGFjY29yZGluZyB0bwpjYWxsZ3JpbmQu
IEFmdGVyIGV2ZXJ5dGhpbmcgd2FzIGZpbmlzaGVkIGluIGEgZG9tYWluIGNyZWF0aW9uIHhsIHdv
dWxkCmp1c3QgImhhbmciIGluIHRoZXJlIGZvciBhIHdoaWxlIGJlZm9yZSBhY3R1YWxseSBleGl0
aW5nLiBJdCB3YXMgbm90CnZlcnkgY29uc2lzdGVudCBhbmQgcmVjb21waWxpbmcgbGlieGwgc29t
ZXRpbWVzIHNwZWQgdGhpbmdzIHVwLgpIYXZlbid0IHJ1biBpbnRvIGl0IHNpbmNlIEkndmUgdXBn
cmFkZWQgdG8gZGViaWFuIGJ1c3RlciBhbmQgYSBuZXdlcgpnY2MuCgo+Cj4gPiBhbmQgZm9yay9l
eGVjIHBhcnRzLgo+Cj4gU2luY2Ugd2Ugb25seSBmb3JrL2V4ZWMgd2hlbiB3ZSBuZWVkIHRvIGRv
IHNvLCB0aGlzIHBhcnQgd291bGQgcHJvYmFibHkKPiBiZSB0aGUgc2FtZSBubyBtYXR0ZXIgd2hh
dCBsYW5ndWFnZSBpdCB3YXMgZG9uZSBpbi4KPgo+IFRoYXQgc2FpZCwgdmVyeSBsaXR0bGUgb2Yg
dGhpcyBoYXMgaGFkIG11Y2ggcGVyZm9ybWFuY2UgYW5hbHlzaXMgLS0gaWYKPiB0aGlzIGlzIGlt
cG9ydGFudCB0byB5b3UsIEknbSBzdXJlIHRoZXJlJ3MgbG90cyBvZiBsb3ctaGFuZ2luZyBmcnVp
dCBpbgo+IHRlcm1zIG9mIGltcHJvdmVtZW50cyB3ZSBjb3VsZCBtYWtlLgo+CgpSaWdodCwgaXQg
d2FzIG15IGRpc3RpbmN0IGltcHJlc3Npb24gdGhhdCBmb3IgdGhlIG1ham9yaXR5IG9mIGxpYnhs
CnRhc2tzIHNwZWVkIHdhc24ndCByZWFsbHkgYSBjb25jZXJuIC0gYWZ0ZXIgYWxsLCBhIHNlY29u
ZCBvciB0d28gZXh0cmEKZm9yIGNyZWF0aW5nIGEgZG9tYWluIHdvdWxkIG5vdCBiZSBvZiBjb25j
ZXJuIGZvciBub3JtYWwgdXNlLWNhc2VzLgpGb3IgdGhlIHVzZS1jYXNlIEknbSBhZnRlciwgaXQg
aXMKKGh0dHBzOi8veGVucHJvamVjdC5hdGxhc3NpYW4ubmV0L3Byb2plY3RzL1hFTi9ib2FyZD9p
c3N1ZS1rZXk9WEVOLTg5KS4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
