Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51E9217F8
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 14:01:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRbTu-00044d-Ci; Fri, 17 May 2019 11:56:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FnXM=TR=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hRbTt-00044Y-1h
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 11:56:57 +0000
X-Inumbo-ID: de399536-789a-11e9-8980-bc764e045a96
Received: from mail-it1-x131.google.com (unknown [2607:f8b0:4864:20::131])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id de399536-789a-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 11:56:56 +0000 (UTC)
Received: by mail-it1-x131.google.com with SMTP id u16so10772190itc.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2019 04:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IB7/LRvOGkwPzlnuRydZwUFAuOpS5LAMlfGHPXrRNAA=;
 b=vKexkAUPmXGvO2rqfA4ooZYulgafkclCycPKrimQVSQ9KOWQbkJyldht+B0idZl28c
 OG9ep79tnP7hGu4j1Ic/GCDR0JzcFKSA2zk651x/nZyYiugjCz5V35Qwl2nb28Np/qd9
 /tNoXfjOkVxMAv0ItV/b2mH7PeqHMWW7QEYoNHvD2udcIi7RjF88vC+LvZ9EO+0W+mES
 iryq41zOnEJkKExGeC+he7Zadc9jht6lP0wFId3nXzF/Ym6HK39Ap8ck0zSIfNcnzjtB
 pjttgRodhB8jZIzVNL3UfaQCTknNJsDwG+PIfkXXfJf4WE5NtaZ+5xsvyFC24liZv1tM
 390Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IB7/LRvOGkwPzlnuRydZwUFAuOpS5LAMlfGHPXrRNAA=;
 b=XR3ydpiCo5odUosEPvRb7v9Qp1wlfZnZ1+Ts36nfDlX/orayTN7S/iHiVq8AtOk81D
 kG6fPyH/4XjlEZdl6/eEPfRjitYsNxTQrwz2VTm9qCAAhVc5yREz71fYASZ16vAVZucP
 /05WSEitdnxmt8YQudoMnBTtKhzzaZyLcRezyg31j3+L8Yos7DslirYsM/UKHrANVsI1
 Lc42iIvZ8GUdXbtkoRpCwSKVxq6kpIiO/xEhSfDoEQowOHjLdX5g6Wy+xj3me9tQvBX7
 8Gta3b1Z5wHO95HjYvUAQO8i7iPcDNlApyPOwbX1vXoQa5hUV7wA7w6or4UmswUHKEFm
 9/rQ==
X-Gm-Message-State: APjAAAWramlH/BpYosYHuX23EGexhz2Gppm7n+1XZkKtRxP5X5rLt5Wa
 3EIfkeWE+jbZ0OU23u3ICOuQbO5Vm12lteUEZcA=
X-Google-Smtp-Source: APXvYqxWysW4qBot4tQOYCVFDgUMw2mwNdGUHDygLNHpXGJn8vYDYejrVPDmmwzYk5yPBL9ppQX/isI7ZX7fPhTAwSE=
X-Received: by 2002:a24:ac52:: with SMTP id m18mr11793504iti.146.1558094215728; 
 Fri, 17 May 2019 04:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZYuwoFDKexde=BJgexsv=DN5u_Y8WdLcOgveC+GvEAiuA@mail.gmail.com>
In-Reply-To: <CAOcoXZYuwoFDKexde=BJgexsv=DN5u_Y8WdLcOgveC+GvEAiuA@mail.gmail.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 17 May 2019 14:56:44 +0300
Message-ID: <CAOcoXZbz6Yfjc=U+MEAPWL0g+wc44FpipM+AmrKJGMYeQPteJw@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Campbell <Ian.Campbell@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [Xen-devel] libxc: memory leak in handle_hvm_context
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgaXMgbm8gbWVtb3J5IGxlYWsgaW4gY2FzZSB3aGVuIGhhbmRsZV9odm1fY29udGV4dCBm
dW5jdGlvbiBpcwpjYWxsZWQgbmV4dCB0aW1lLgpTbyB0aGUgY29kZSBzZWVtcyBvaywgcGxlYXNl
IGlnbm9yZSB0aGUgbWFpbCwgc29ycnkgZm9yIGNvbmZ1c2lvbi4KClRoYW5rcwoKT24gRnJpLCBN
YXkgMTcsIDIwMTkgYXQgMjo0OSBQTSBWaWt0b3IgTWl0aW4gPHZpa3Rvci5taXRpbi4xOUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gSGkgQWxsLAo+Cj4gSXQgc2VlbXMgdGhlcmUgaXMgYSBtZW1vcnkg
bGVhayBpbiBsaWJ4YyBmdW5jdGlvbiBoYW5kbGVfaHZtX2NvbnRleHQKPiAoaW4gZmlsZSB0b29s
cy9saWJ4Yy94Y19zcl9yZXN0b3JlX3g4Nl9odm0uYy4pLiBUaGVyZSBpcyBhIG1hbGxvYyBvZgo+
IHZhcmlhYmxlIHAgd2l0aG91dCBmcmVlLgo+IFBsZWFzZSB0YWtlIGEgbG9vay4KPgo+ICsvKgo+
ICsgKiBQcm9jZXNzIGFuIEhWTV9DT05URVhUIHJlY29yZCBmcm9tIHRoZSBzdHJlYW0uCj4gKyAq
Lwo+ICtzdGF0aWMgaW50IGhhbmRsZV9odm1fY29udGV4dChzdHJ1Y3QgeGNfc3JfY29udGV4dCAq
Y3R4LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGNfc3JfcmVjb3Jk
ICpyZWMpCj4gK3sKPiArICAgIHhjX2ludGVyZmFjZSAqeGNoID0gY3R4LT54Y2g7Cj4gKyAgICB2
b2lkICpwOwo+ICsKPiArICAgIHAgPSBtYWxsb2MocmVjLT5sZW5ndGgpOwo+ICsgICAgaWYgKCAh
cCApCj4gKyAgICB7Cj4gKyAgICAgICAgRVJST1IoIlVuYWJsZSB0byBhbGxvY2F0ZSAldSBieXRl
cyBmb3IgaHZtIGNvbnRleHQiLCByZWMtPmxlbmd0aCk7Cj4gKyAgICAgICAgcmV0dXJuIC0xOwo+
ICsgICAgfQo+ICsKPiArICAgIGZyZWUoY3R4LT54ODZfaHZtLnJlc3RvcmUuY29udGV4dCk7Cj4g
Kwo+ICsgICAgY3R4LT54ODZfaHZtLnJlc3RvcmUuY29udGV4dCA9IG1lbWNweShwLCByZWMtPmRh
dGEsIHJlYy0+bGVuZ3RoKTsKPiArICAgIGN0eC0+eDg2X2h2bS5yZXN0b3JlLmNvbnRleHRzeiA9
IHJlYy0+bGVuZ3RoOwo+ICsKPiArICAgIHJldHVybiAwOwo+ICt9Cj4KPiBUaGFua3MKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
