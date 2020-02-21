Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26E5168481
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 18:11:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5Bmx-0004yE-GK; Fri, 21 Feb 2020 17:08:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IhbZ=4J=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j5Bmv-0004y8-C4
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 17:08:29 +0000
X-Inumbo-ID: c75a344c-54cc-11ea-b0fd-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c75a344c-54cc-11ea-b0fd-bc764e2007e4;
 Fri, 21 Feb 2020 17:08:28 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p3so3207818edx.7
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 09:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=52W8VTfnri2jTw6ckglFMSiiw8w6nKRGW5Wvdwnd+R4=;
 b=FJoBoN77Vn7ElWnWOu1URnufVT/ff7Hib6Wda+tbN/fQnpaNM8M+ygoBIB53ubxvMW
 RPhZWqCqyOCLDuy40Y7CNAz3K68ifq3UPSHVjBP/fASJMiF3Cp5u6pOYVi3f4DWDH0ZT
 VMjk+k24A+mOjlp/bebWimI5FSLYlG5BU1XuLpBlQgY52MeC8OGCFmshc6+VOdW05ZUr
 MkaA34uKgX//zflkiBHUMTjy6d6xoHVth2PalhXK3pPnGqHccJ9GSsLlMJ9JZ0xAEyNn
 glNXP0yP1wBAR129nvyOYKXnknUWsHAcT4PJAF5TC27noZ3Cor5ka8Xr1vZInbsLXC57
 vFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=52W8VTfnri2jTw6ckglFMSiiw8w6nKRGW5Wvdwnd+R4=;
 b=dRpXfXCa47ZwHnNayZvP//xZmdzdjxpB5gmdciTRq2jcBVKlzPEzb1Sf6erh1/lU4+
 7OqfpFjJtbFJtMQ/UvpZ+zbd8OkNCgeqzO+dhqagziDjUcDMDbHYSM0tjIo5ranGPARo
 4rC/PUapV8Re3TndWOm9J6WVwOQj+/oWc0ow8N780Ap7fnKpnHIWy1Qw2BW7osHDHgCF
 +Nbq0EJMmnskrsliD/t4vR5rLIM4Rl3ZcVLdVpW9Qk91qzM6u/QwPl3pFm1HqHOfS9GR
 9vfVI2Wc7EAvEYZkn3Yu/M/UqIGXFwyMApqVHO67OXRuWm/o5Z6amVj4gEIzEGYzjLpa
 a2IA==
X-Gm-Message-State: APjAAAUyPwjnltaviUeGGsp18sUiAAFlk8OJly92PQQDY8tHdAQkyrNZ
 B1K7a/y6BDiJVz5qtvmH+pjc0+tEM6E=
X-Google-Smtp-Source: APXvYqzvRLDzhJnr6vueesKDwFvX5NprwctiGjs4UhzjfLpr1lvHrAPwVlyRajoRVfZV5NBn0yGmPw==
X-Received: by 2002:aa7:ca0a:: with SMTP id y10mr16023797eds.23.1582304907596; 
 Fri, 21 Feb 2020 09:08:27 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46])
 by smtp.gmail.com with ESMTPSA id sa9sm278637ejb.28.2020.02.21.09.08.26
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 09:08:26 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id y11so2851659wrt.6
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 09:08:26 -0800 (PST)
X-Received: by 2002:adf:f986:: with SMTP id f6mr51502336wrr.182.1582304905857; 
 Fri, 21 Feb 2020 09:08:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581362050.git.tamas.lengyel@intel.com>
 <0f7d636910c45e9ca32fda4ef864a9b7d6e32745.1581362050.git.tamas.lengyel@intel.com>
 <fa70f8c7-a822-b9de-0af6-c9fb2835c664@citrix.com>
In-Reply-To: <fa70f8c7-a822-b9de-0af6-c9fb2835c664@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 21 Feb 2020 10:07:49 -0700
X-Gmail-Original-Message-ID: <CABfawh=g7OXetqAgA9rtu0gL0PB6bkg4U-e_raXrvS11X_+gBA@mail.gmail.com>
Message-ID: <CABfawh=g7OXetqAgA9rtu0gL0PB6bkg4U-e_raXrvS11X_+gBA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v8 3/5] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgNzo0MiBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDEwLzAyLzIwMjAgMTk6MjEsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+ICtzdGF0aWMgaW50IG1lbV9zaGFyaW5nX2Zvcmsoc3RydWN0IGRv
bWFpbiAqZCwgc3RydWN0IGRvbWFpbiAqY2QpCj4gPiArewo+ID4gKyAgICBpbnQgcmMgPSAtRUlO
VkFMOwo+ID4gKwo+ID4gKyAgICBpZiAoICFjZC0+Y29udHJvbGxlcl9wYXVzZV9jb3VudCApCj4g
PiArICAgICAgICByZXR1cm4gcmM7Cj4gPiArCj4gPiArICAgIC8qCj4gPiArICAgICAqIFdlIG9u
bHkgd2FudCB0byBnZXQgYW5kIHBhdXNlIHRoZSBwYXJlbnQgb25jZSwgbm90IGVhY2ggdGltZSB0
aGlzCj4gPiArICAgICAqIG9wZXJhdGlvbiBpcyByZXN0YXJ0ZWQgZHVlIHRvIHByZWVtcHRpb24u
Cj4gPiArICAgICAqLwo+ID4gKyAgICBpZiAoICFjZC0+cGFyZW50X3BhdXNlZCApCj4gPiArICAg
IHsKPiA+ICsgICAgICAgIEFTU0VSVChnZXRfZG9tYWluKGQpKTsKPiA+ICsgICAgICAgIGRvbWFp
bl9wYXVzZShkKTsKPiA+ICsKPiA+ICsgICAgICAgIGNkLT5wYXJlbnRfcGF1c2VkID0gdHJ1ZTsK
PiA+ICsgICAgICAgIGNkLT5tYXhfcGFnZXMgPSBkLT5tYXhfcGFnZXM7Cj4gPiArICAgICAgICBj
ZC0+bWF4X3ZjcHVzID0gZC0+bWF4X3ZjcHVzOwo+Cj4gU29ycnksIEkgc3Bva2UgdG9vIHNvb24u
ICBZb3UgY2FuJ3QgbW9kaWZ5IG1heF92Y3B1cyBoZXJlLCBiZWNhdXNlIGl0Cj4gdmlvbGF0ZXMg
dGhlIGludmFyaWFudCB0aGF0IGRvbWFpbl92Y3B1KCkgZGVwZW5kcyB1cG9uIGZvciBzYWZldHku
Cj4KPiBJZiB0aGUgdG9vbHN0YWNrIGdldHMgdGhpbmdzIHdyb25nLCBYZW4gd2lsbCBlaXRoZXIg
bGVhayBzdHJ1Y3QgdmNwdSdzCj4gb24gY2QncyB0ZWFyZG93biwgb3IgY29ycnVwdCBtZW1vcnkg
YmV5b25kIHRoZSBlbmQgb2YgdGhlIGNkLT52Y3B1W10gYXJyYXkuCj4KPiBMb29raW5nIGF0IHRo
ZSBoeXBlcmNhbGwgc2VtYW50aWNzLCB1c2Vyc3BhY2UgY3JlYXRlcyBhIG5ldyBkb21haW4KPiAo
d2hpY2ggc3BlY2lmaWVzIG1heF9jcHVzKSwgdGhlbiBjYWxscyBtZW1fc2hhcmluZ19mb3JrKHBh
cmVudF9kb20sCj4gbmV3X2RvbSk7ICBGb3JraW5nIHNob3VsZCBiZSByZWplY3RlZCBpZiB0b29s
c3RhY2sgaGFzbid0IGNob3NlbiB0aGUKPiBzYW1lIG51bWJlciBvZiB2Y3B1cyBmb3IgdGhlIG5l
dyBkb21haW4uCgpUaGF0J3MgdW5mb3J0dW5hdGUgc2luY2UgdGhpcyB3b3VsZCByZXF1aXJlIGFu
IGV4dHJhIGh5cGVyY2FsbCBqdXN0IHRvCmdldCBpbmZvcm1hdGlvbiBYZW4gYWxyZWFkeSBoYXMu
IEkgdGhpbmsgaW5zdGVhZCBvZiB3aGF0IHlvdSByZWNvbW1lbmQKd2hhdCBJJ2xsIGRvIGlzIGV4
dGVuZCBYRU5fRE9NQ1RMX2NyZWF0ZWRvbWFpbiB0byBpbmNsdWRlIHRoZSBwYXJlbnQKZG9tYWlu
J3MgSUQgYWxyZWFkeSBzbyBYZW4gY2FuIGdhdGhlciB0aGVzZSBpbmZvcm1hdGlvbiBhdXRvbWF0
aWNhbGx5CndpdGhvdXQgdGhlIHRvb2xzdGFjayBoYXZpbmcgdG8gZG8gaXQgdGhpcyByb3VuZGFi
b3V0IHdheS4KCj4KPiBUaGlzIHJhaXNlcyB0aGUgcXVlc3Rpb24gb2Ygd2hldGhlciB0aGUgc2Ft
ZSBzaG91bGQgYmUgdHJ1ZSBmb3IKPiBtYXhfcGFnZXMgYXMgd2VsbC4KCkNvdWxkIHlvdSBleHBh
bmQgb24gdGhpcz8KClRoYW5rcywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
