Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 946286E6DF
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:53:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoTH0-00054K-8H; Fri, 19 Jul 2019 13:50:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ucx3=VQ=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hoTGy-00054B-Gw
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:50:08 +0000
X-Inumbo-ID: 1df8830f-aa2c-11e9-8980-bc764e045a96
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1df8830f-aa2c-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 13:50:07 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id q22so58536398iog.4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2019 06:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yxA7ZFJiO/25Uwh6BTM+7RNxhUiSQfJ8MhVXCYH7R14=;
 b=Ea3SsRqPlktoZ7i9mYSh4A8r4mujLmE/SQMLJhb1U8Tz4XsWwvlNqQ88utqPxVjDhi
 kLhBlDmYLNgOEyRupd1htbTuTD3EOucN93ClPN78OslCChKgcM+3wojKtT6hiXZMCjcz
 eVVvXj0LDRZ2AYhpvgcb4mcPVYWrMNRczFPTYE2OtPDdFCKn2EPSSnRVUb+6a4LzIV7Z
 zEF/g6ZnTrbqCDsgaCicDb6MvBYZDnzluRf3xMvgIpWmmQLVrg7+UnB0kEumFvTS2GMl
 SKjw4sUXJqbSxokk16/mE5K8vGFGW1s2thST/Ohg4GyKQZS6LQZT9xA9xhwL+bmvJEYZ
 93Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yxA7ZFJiO/25Uwh6BTM+7RNxhUiSQfJ8MhVXCYH7R14=;
 b=XTf1ER+rcPQU3usEnjZl42k/9AoKGIHJHnUBx76067uHWS1LO7mmTe7gi2glSj2m9z
 mvjIrAgeoltyt8DxDvyCZvxYtxgDsS9BDjKZ0xrnQCim6D1fhypQc++xx3dRIPZHpWnR
 h1wUP3cKTimrW3SLLeocnJE4LKE0rMQZqcc+QpIOWohV745XFXTGF5lalIzvp2bwHE7p
 3aJTJ/6K/7FSzGzaYkh/sksDs61xZfZKvlEoGsaxzgs/Xgrv6lSXN2J+qBSSfIv9QnoU
 CM9zrLTmWSfjDcYChEq+mwoVcAR8yrgl/eb7yPNyTlhuRhNzSX7gcvuDgN8Hz9FRem+/
 +AAw==
X-Gm-Message-State: APjAAAUtCITDCcuTmYJjwTywz/kM2M/h2xourz0U6e2Nf6Q0H7kkK2Ge
 BT0vPWTnIhGpdLPKbc3Gy/s=
X-Google-Smtp-Source: APXvYqz8hLqSPegjBs6unNZRGNywZ4HO/Wjef5XBwm/a2NiX/Vw3FFr6cRrdqJeVmEBmlhn+pgEa2A==
X-Received: by 2002:a6b:b206:: with SMTP id b6mr53270735iof.286.1563544206656; 
 Fri, 19 Jul 2019 06:50:06 -0700 (PDT)
Received: from [100.64.72.253] ([205.185.206.117])
 by smtp.gmail.com with ESMTPSA id v13sm26073793ioq.13.2019.07.19.06.50.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 06:50:06 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16F203)
In-Reply-To: <6cabe11e-af20-2096-5516-02c0deaf6fca@arm.com>
Date: Fri, 19 Jul 2019 09:50:05 -0400
Message-Id: <0BAD4AC1-5181-48AA-98FE-DD64133194CB@gmail.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawh=R-K3nje0gdsi-26Zj7-y6=KkiW=-s0TLK1o3QgVXLmw@mail.gmail.com>
 <27973ea5-a0d4-0ca4-fd3f-9680f179b283@arm.com>
 <CABfawhk4TzQemnG+3XwtQ4SGmquufOd4nFGajEWJJ++YFuqfZw@mail.gmail.com>
 <a0c71023-2546-d7c4-771c-02a944c93d90@arm.com>
 <CABfawhm+e4YfnPGT9K-aWqipAFJp1tqfFr9dNDm6g0Twb2gGoA@mail.gmail.com>
 <d9f6faf8-c784-7998-e184-19702a625ca9@arm.com>
 <6cabe11e-af20-2096-5516-02c0deaf6fca@arm.com>
To: Julien Grall <julien.grall@arm.com>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Jeff.Kubascik@dornerworks.com, Tim Deegan <tim@xen.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gSnVsIDE5LCAyMDE5LCBhdCAwOTozMSwgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4gd3JvdGU6Cj4+IE9uIDE5LzA3LzIwMTkgMTQ6MjQsIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4gSGkgVGFtYXMsCj4+PiBPbiAxOS8wNy8yMDE5IDE0OjE0LCBUYW1hcyBLIExlbmd5ZWwgd3Jv
dGU6Cj4+Pj4gT24gRnJpLCBKdWwgMTksIDIwMTkgYXQgNzoxMSBBTSBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+PiAKPj4+PiBIaSBUYW1hcywKPj4+PiAKPj4+
Pj4gT24gMTkvMDcvMjAxOSAxNDowMCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4+Pj4gT24g
RnJpLCBKdWwgMTksIDIwMTkgYXQgMjo0MyBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPiB3cm90ZToKPj4+Pj4+IAo+Pj4+Pj4gSGkgVGFtYXMsCj4+Pj4+PiAKPj4+Pj4+IE9u
IDE4LzA3LzIwMTkgMTg6NDgsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+Pj4+Pj4gICAgICAg
LSBMaW5lIDEwMjU6IFRoZSB0b29scyBuZWVkcyB0byBiZSBhYmxlIHRvIGRlYWwgZm9yX2VhY2hf
dmNwdSguLi4pICYgY28uCj4+Pj4+Pj4gCj4+Pj4+Pj4gVGhlc2UgY2FuIGJlIG1hZGUgT0sgYnkg
YWRkaW5nIGJyYWNlcy4gT3RoZXIgdGhhbiB0aGF0IHRoZSBvbmx5IHdheSBJCj4+Pj4+Pj4gZm91
bmQgdG8gbWFrZSBpdCBub3QgY2hhbmdlIHRoZSBpbmRlbnRhdGlvbiBpcyB0byBhZGQgdGhlIGNv
bW1lbnQgIi8qCj4+Pj4+Pj4gKklOREVOVC1PRkYqICovIiBiZWZvcmUgdGhlIGJsb2NrIGFuZCAi
LyogKklOREVOVC1PTiogKi8iIGFmdGVyd2FyZHMuCj4+Pj4+PiAKPj4+Pj4+IE5vbmUgb2YgdGhl
bSBsb29rcyByZWFsbHkgYXBwZWFsaW5nIGJlY2F1c2UgaXQgbWVhbnMgYXN0eWxlIHdpbGwgbm90
IGNvcnJlY3RseQo+Pj4+Pj4gaW5kZW50IGlmIHRoZSB1c2VyIGRvZXMgbm90IGFkZCBicmFjZXMg
b3IgY29tbWVudHMuCj4+Pj4+PiAKPj4+Pj4+IENvdWxkIGFzdHlsZSBiZSBlYXNpbHkgbW9kaWZp
ZWQgdG8gcmVjb2duaXplIGZvcmVhY2ggbWFjcm9zPwo+Pj4+PiAKPj4+Pj4gTm90IHRoYXQgSSdt
IGF3YXJlIG9mLiBJZiB5b3UgZG9uJ3Qgd2FudCB0byBtYW51YWxseSBhbm5vdGF0ZSBmaWxlcwo+
Pj4+PiB3aXRoIHVuc3VwcG9ydGVkIG1hY3JvcyB0aGVuIGp1c3QgZXhjbHVkZSB0aG9zZSBmaWxl
cyBmcm9tIGFzdHlsZS4gSQo+Pj4+PiB3b3VsZG4ndCByZWNvbW1lbmQgYWRkaW5nIHRoaXMgdG8g
dGhlIENJIGZvciBhbGwgZmlsZXMsIG9ubHkgZm9yIHRob3NlCj4+Pj4+IHRoYXQgdGhlaXIgcmVz
cGVjdGl2ZSBtYWludGFpbmVycyBoYXZlIGNvbmZpcm1lZCB0byBjb25mb3JtIHRvIHRoZQo+Pj4+
PiBzdHlsZSBhbmQgd2FudCB0byBlbmZvcmNlIGl0IGdvaW5nIGZvcndhcmQuCj4+Pj4gCj4+Pj4g
U28gYSBjb3VwbGUgdXNlIG9mIGFuIHVuc3VwcG9ydGVkIG1hY3JvcyB3b3VsZCBtYWtlIGltcG9z
c2libGUgdG8gZW5mb3JjZSB0aGUKPj4+PiBjb2Rpbmcgc3R5bGUuIFRoaXMgaXMgbm90IGEgdmVy
eSBpZGVhbCBwb3NpdGlvbiB0byBiZSBpbi4KPj4+PiAKPj4+PiBfaWZfIHdlIGFyZSBnb2luZyB0
byBhZG9wdCBhc3R5bGUgdGhlbiB3ZSBuZWVkIHRvIGJlIGFibGUgdG8gZW5mb3JjZSBpdCBvbiBl
dmVyeQo+Pj4+IFhlbiBmaWxlcyBsb25nLXRlcm0uIElmIGl0IGlzIG5vdCBwb3NzaWJsZSB0byBk
byBpdCB3aXRoIGFzdHlsZSwgdGhlbiBtYXliZSB0aGlzCj4+Pj4gaXMgbm90IHRoZSByaWdodCB0
b29sIHRvIHVzZS4KPj4+PiAKPj4+PiBGb3IgaW5zdGFuY2UsIEkga25vdyB0aGF0IHRvb2xzIHN1
Y2ggYXMgY2xhbmctZm9ybWF0IGlzIGFibGUgdG8gZGVhbCB3aXRoCj4+Pj4gZm9yZWFjaCBtYWNy
b3MuCj4+PiAKPj4+IElmIHRoZXJlIGFyZSBiZXR0ZXIgdG9vbHMgdGhlbiBzdXJlLCBJIGRvbid0
IHJlYWxseSBtaW5kIHVzaW5nCj4+PiBzb21ldGhpbmcgZWxzZS4gSSBqdXN0IGRvbid0IGhhdmUg
dGltZSB0byBkbyB0aGUgbWFudWFsIHN0eWxlIGNoZWNrCj4+PiBiYWNrLWFuZC1mb3J0aCBhbnlt
b3JlLCBzbyB0aGUgc29vbmVyIHdlIGhhdmUgc29tZXRoaW5nIGluIHBsYWNlIHRoZQo+Pj4gYmV0
dGVyLgo+PiBJIHRvdGFsbHkgYWdyZWUgd2UgbmVlZCBhIHRvb2wgc28gdGhlIHJldmlld2VyIGNh
biBmcmVlLXVwIHNvbWUgdGltZSB0byBmb2N1cyBvbiBtb3JlIGltcG9ydGFudCB0aGluZ3MuIEhv
d2V2ZXIsIEkgdGhpbmsgd2Ugc2hvdWxkIGJlIGNhcmVmdWwgb24gd2hhdCB3ZSBhZG9wdCBoZXJl
Lgo+PiBTaW1pbGFyIHRvIEFuZHJldywgSSBhbSBvcGVuIHdpdGggbW9kaWZ5aW5nIHRoZSBjb2Rp
bmcgc3R5bGUgdG8gaGVscCB0aGUgYXV0b21hdGljIHN0eWxlIGNoZWNrLiBCdXQgSSBhbSBub3Qg
aGFwcHkgdG8gZGlzYWJsZSBhdXRvbWF0aWMgc3R5bGUgb24gcGFydCAob3IgZW50aXJlKSBvZiBm
aWxlcyBmb3JldmVyLgo+PiBBdCB0aGUgbW9tZW50LCBjbGFuZy1mb3JtYXQgZmVlbHMgbW9yZSBw
b3dlcmZ1bCBhbmQgdGhlcmUgYXJlIHBlb3BsZSB3b3JraW5nIG9uIGl0Lgo+IAo+IEZZSSwgYmVs
b3cgYSBsaW5rIHRvIHRoZSBjbGFuZy1mb3JtYXQgY2hhbmdlczoKPiAKPiBodHRwczovL2dpdGh1
Yi5jb20veGVuLXRyb29wcy9YZW4tQ2xhbmctZm9ybWF0L2Jsb2IvZGV2ZWwvY2xhbmctZm9ybWF0
LnBhdGNoCgpXZXJlIHRoZXNlIGNsYW5nLWZvcm1hdCBjaGFuZ2VzIGRvbmUgZm9yIEZ1U2Egd29y
az8gIEFyZSB0aGV5IGludGVuZGVkIHRvIGJlIHJ1biB3aXRoaW4gT1NTdGVzdCBhbmQvb3IgWGVu
J3MgR2l0bGFiIENJLCB3aGljaCBkbyBub3QgY3VycmVudGx5IHN1cHBvcnQgT3BlbkVtYmVkZGVk
L1lvY3RvIGFuZCB4ZW4tdHJvb3BzPwoKSXQgd291bGQgYmUgaGVscGZ1bCB0byBoYXZlIGEgeGVu
LWRldmVsIHRocmVhZCBvbiB0aGUgbW90aXZhdGlvbiBmb3IgdGhlIGNsYW5nLWZvcm1hdCB3b3Jr
LCB0aGUgc3BlY2lmaWMgc3R5bGUgYmVpbmcgZW5mb3JjZWQgKGluY2x1ZGluZyB0aGUgbnVhbmNl
cyBkaXNjdXNzZWQgaW4gdGhpcyB0aHJlYWQpIGFuZCBhZGRpdGlvbmFsIHdvcmsgbmVlZGVkIGJl
Zm9yZSBjbGFuZy1mb3JtYXQgY2FuIHBlcmZvcm0gYXV0b21hdGVkIHN0eWxlIGNoZWNraW5nIHRv
IGFkZHJlc3MgKGEpIGV4aXN0aW5nIFhlbi9MaW51eCBzdHlsZSByZXF1aXJlbWVudHMsIChiKSBG
dVNhIHJlcXVpcmVtZW50cy4KClJpY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
