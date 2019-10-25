Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A3AE4B11
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 14:32:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNyjZ-0007Cq-0U; Fri, 25 Oct 2019 12:30:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QgnE=YS=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iNyjW-0007Ce-T1
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 12:30:22 +0000
X-Inumbo-ID: 361ae83e-f723-11e9-beca-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 361ae83e-f723-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 12:30:22 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f5so2498878ljg.8
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2019 05:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SCuuXjsq+tqrtQnl+VzA3SXB/QOkepGs2hU9qOlsZ/M=;
 b=mhw4xP4mi0RmGD/12OI+LFkq3tQdxPg/xW5CsAcCPURDEgY4MiXyok7VMsLx88+nlp
 1DHVSbkl+dppLepqx50Jz6beyX628Q7vwm1hiok9lN15GRU6difFV4bX/sIFPJi4Db+R
 iM76aKR6IMdU6Fs3Sm1XJ5779VlCi/6CBqDnLxzJ3fIHdI5v4my05q0/rRl4Irl1snDQ
 9SRPNVVI/GjiHW9FR0EQwR2YnK+5Mo8VVEQIU6B20c+IbeIwpWt9ll0tZpQxNRui84N6
 TcY9WxT+Tk1ZRs60q5Ky8aTtAxLy4tta1zWf8rf5pCLx4gphxalinRYWNEgGvRbASp1R
 6sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SCuuXjsq+tqrtQnl+VzA3SXB/QOkepGs2hU9qOlsZ/M=;
 b=DdeXS1kD8N5HkZugrUNSzRdV5+QvQmZonosb/3uU6MzTpmGO67ADUzme4qE5AxBf2l
 3Im8IwqPpfacfat0PDBhD1K4aYby6ejRvI/WR095NmMJryW9jHYsdyhh72FPob3udP58
 osvhRuh8GIPrrQ1OQrOXOJCMCcSOSGZvMHaL5U57J3haAJ/WXwEbwt/Iti8+i5+Ra+gm
 vXn4tcUYR9IkxPKUtRwXFHfMXW6aiBC6FHshRiJ2fTWyTfJG2RZ2LW0wc+RIYPYHM0HU
 RJI8GmCKX5Ezcc+YuDSaOkXUL2oOot6C/dcUzCBpUpg5IHWxty0pR81gJE4LFgdnjxy5
 jIHA==
X-Gm-Message-State: APjAAAUcQIKGJJtPUp2cmSz9Q2Tdgc/OjowsuoDw6t7/tZSX53X3ty1z
 B0XwphGFFyVzvcAPDkyDxHjLfSVHOURSmDSK3Bk=
X-Google-Smtp-Source: APXvYqz9jSpg/GUkKOXWr98yB/83t3DzfUZx1Tu1EG/kcoCLonc48VoZrKV7nhbKvD+Akq5+ZKM3lKbWOXfGfzapbVI=
X-Received: by 2002:a05:651c:1213:: with SMTP id
 i19mr2339066lja.19.1572006620976; 
 Fri, 25 Oct 2019 05:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <1a60b855c0886c8e7147d48923f16b4d0815db81.1570456846.git.rosbrookn@ainfosec.com>
 <a27892b1-6d7f-c18b-3a6c-859cdd869e85@citrix.com>
 <CAEBZRSd82pXdL8+k9ASEkypdtF=yqfpaVO3e+4eAcf8iQi8_QA@mail.gmail.com>
 <15987276-47AC-436B-9D93-C7A90A2558F2@citrix.com>
In-Reply-To: <15987276-47AC-436B-9D93-C7A90A2558F2@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Fri, 25 Oct 2019 08:30:09 -0400
Message-ID: <CAEBZRSck38wDsjZbrHuy7WDOhTPuq8_LN-jSaYQ6kRVaVFwzAg@mail.gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 05/24] golang/xenlight: define KeyValueList
 builtin type
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "kerriganb@ainfosec.com" <kerriganb@ainfosec.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPaywgaW4gdGhhdCBjYXNlIGxldOKAmXMganVzdCBsZWF2ZSB0aGUgc3RydWN0IGVtcHR5LgoK
T2ssIHNvdW5kcyBsaWtlIGEgcGxhbi4KCj4gSSB0aGluayB3ZSBiYXNpY2FsbHkgaGF2ZSB0aHJl
ZSBvcHRpb25zOgo+Cj4gMS4gVHJ5IHRvIGFycmFuZ2UgaXQgc28gdGhhdCB0aGUg4oCcemVyb+KA
nSB2YWx1ZXMgY29ycmVzcG9uZCB0byDigJxkZWZhdWx04oCdIHZhbHVlcyBpbiBsaWJ4bDsgaS5l
LiwgaGF2ZSBEZXZJRCAwIC0+IGxpYnhsX2RldmlkIC0xLCBEZXZJRCAxIC0+IGxpYnhsX2Rldmlk
IDAsICZjCj4KPiAyLiBBZGQgTmV3U3RydWN0VHlwZSBmdW5jdGlvbnMKPgo+IDMuIEFkZCAuSW5p
dCgpIG1ldGhvZHMgdG8gc3RydWN0cwo+Cj4gIzEgSSB0aGluayBpcyBwcm9iYWJseSB0b28gcmlz
a3k7IHNvIDIgb3IgMyAob3IgbWF5YmUgYm90aCkgd2lsbCBwcm9iYWJseSBiZSBuZWVkZWQuICBU
aGUgTmV3U3RydWN0VHlwZSgpIHNlZW1zIHRvIGJlIG1vcmUgc3RhbmRhcmQuICBCdXQgSeKAmW0g
b3BlbiBzbyBzdWdnZXN0aW9ucy4gOi0pCgpPcHRpb24gMiBpcyBjZXJ0YWlubHkgdGhlIHN0YW5k
YXJkLCBhbmQgYmVzdCB0byBhdm9pZCBjb25mdXNpbmcKLkluaXQoKSBmdW5jdGlvbnMgd2l0aCB0
aGUgc3BlY2lhbCBmdW5jdGlvbiBpbml0KCkuIEknbGwgd29yayBvbiB0aGUKaW1wbGVtZW50YXRp
b24gYXMgc29vbiBhcyB3ZSBnZXQgdGhpcyBzZXJpZXMgZG9uZSA6KQoKLU5SCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
