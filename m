Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4926E66A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:32:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSx2-00029P-1x; Fri, 19 Jul 2019 13:29:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SVhr=VQ=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hoSx0-00029F-02
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:29:30 +0000
X-Inumbo-ID: 3bc22b10-aa29-11e9-8980-bc764e045a96
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3bc22b10-aa29-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 13:29:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 207so28831094wma.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2019 06:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PkR9r0OPrFWZcIBGUZac0sx5aJ821Yf8Eg6J08Chpo0=;
 b=OAOMu9qHnAGvyCLEtYfYIT4no/jrraQHegkUovwKMIlNlUEB3pjV8PdO5coEiW5kMK
 8euzHSiGXY13RDjcFt7B3x8zdUc40MRyMm7Cnu1kP8GGnbKcsFUZVXW1/rt4V/pWCh+a
 q+zP3px7pfNLKKnSHPzmpts0h6xmo7TvZY8KE1AjOnsMSFnEGWkpmwMhhlVh7Z0yDXTC
 iQiIRVFAd8xgSEyq2eOro0wO3a1pTRrtFtkVaYvAvZRFnkMvdPhYtN26DA9oQSzJtP5s
 1WoetIohyc8tK5PC79IXlUR0ArTUmZr9GU0gTs2v5Z4Qab3jAB/QrAk88XHLdpAB7cgv
 6kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PkR9r0OPrFWZcIBGUZac0sx5aJ821Yf8Eg6J08Chpo0=;
 b=RZ7nKEbl5rsQffaM7/ssRto8GLgVJxtVm8/xwW6lwESuHpqFpwtYEPJc5YPir1sJUg
 GH6s7uB8rIWaVKiGc+IyQlFWtq3mVTj55gNAYmlIfymU+VnF3iVVmLridNbvqtVClu//
 c0zdxsJX7pVg1SpPL8daKD6jZg0nJPeU0M7URUQn1gJe145IWb76N5/jU0xB35RP95Sp
 wJoOzzDlKLLHwXYrfN4TsNpzTO4VDzwOyGYorU2nD2Q6QWtZ69ZlGcg5Gt8toVAfQTPp
 Ti46iGFAWdMRHZ1n12PnWKo8P5Erh+6pgUZcx+j6F5si1DH03wB/Pt7IS5dn3Oh927JB
 +7lg==
X-Gm-Message-State: APjAAAWNe9sxbpIvmsGOTrIc49rcqiJfcQQm+7/s5TLqzKR8Mp6ED57N
 fWG2EVIGGKLrZmzJcc/NY0do6yjpj0w5i7EdOlo=
X-Google-Smtp-Source: APXvYqx2kfZ6We7nlg65BSGPKEKSJ43tW308Ob60KC4KE3ArZ/xT0LRKTFdSiF4bYNNacDKK5YaFQGT86O9CVp/cDTg=
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr48567623wmj.128.1563542967971; 
 Fri, 19 Jul 2019 06:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <f1a5d1b0-564e-8f04-f43e-f5c68466751b@suse.com>
 <7072cc5e-8137-762b-53a1-c4a80d19ff08@suse.com>
 <CABfawhnyhLwjWqGvqtT6vohTYjzcW4+BGpjrEMw1M=yYrzXTPA@mail.gmail.com>
 <b9b18428-6114-117d-a6b2-049b5d6dceec@suse.com>
In-Reply-To: <b9b18428-6114-117d-a6b2-049b5d6dceec@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 19 Jul 2019 07:28:51 -0600
Message-ID: <CABfawh=Yg4bBP=+6MmG1pqrz25cL=Mxf_mLPR_OF8cP7KgVKjg@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH 1/2 RESEND] CODING_STYLE: explicitly call
 out label indentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 JulienGrall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgNzoyMiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTkuMDcuMjAxOSAxNToxOCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMzoxOSBBTSBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gU2luY2UgdGhlIGJlaGF2aW9yIG9mICJk
aWZmIC1wIiB0byB1c2UgYW4gdW5pbmRlbnRlZCBsYWJlbCBhcyBjb250ZXh0Cj4gPj4gaWRlbnRp
ZmllciBvZnRlbiBtYWtlcyBpdCBoYXJkZXIgdG8gcmV2aWV3IHBhdGNoZXMsIG1ha2UgZXhwbGlj
aXQgdGhlCj4gPj4gcmVxdWlyZW1lbnQgZm9yIGxhYmVscyB0byBiZSBpbmRlbnRlZC4KPiA+Pgo+
ID4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+Cj4g
PiBUaGlzIHN0eWxlIHJlcXVpcmVtZW50IHdvdWxkbid0IHJlYWxseSB3b3JrIHdpdGggYXN0eWxl
IGFzLWlzLgo+Cj4gUGVyc29uYWxseSBJIHZpZXcgcHJvcGVyICJkaWZmIC1wIiBjb250ZXh0IGlu
IHBhdGNoZXMgYXMgcXVpdGUKPiBhIGJpdCBtb3JlIGltcG9ydGFudCB0aGFuIGF1dG9tYXRpYyBz
dHlsZSBjaGVja2luZy4gQnV0IHBlcmhhcHMKPiB0aGF0J3MganVzdCBiZWNhdXNlIEkgZG8gcXVp
dGUgYSBsb3Qgb2YgcGF0Y2ggcmV2aWV3IC4uLgoKV2hpY2ggaXMgYSB2YWxpZCBwb2ludC4gSSBk
b24ndCByZWFsbHkgY2FyZSB3aGljaCBzdHlsZSBvcHRpb24gaXQKcmVhbGx5IGlzLCBpZiBpdCBo
ZWxwcyB5b3UsIEknbSBmaW5lIHdpdGggaXQuIEJ1dCBhcyBhIG1haW50YWluZXIgd2hvCmRvZXMg
dGhpcyBvbiBhIHZvbHVudGVlciBiYXNpcyB3aGVuIEkgaGF2ZSBhIDUtbWludXRlIHdpbmRvdywg
SSdtIG5vdApnb2luZyB0byBzcGVuZCBteSB0aW1lIGxvb2tpbmcgZm9yIHN0eWxlIGlzc3Vlcy4g
U28gaW4gdGhlIG9uZ29pbmcKdm1fZXZlbnQgc2VyaWVzIHRoYXQncyB1bmRlciByZXZpZXcgd2hl
cmUgeW91IGV4cGxpY2l0bHkgY2FsbGVkIG91dAp0aGF0IHRoZSB2bV9ldmVudCBtYWludGFpbmVy
cyBoYXZlIHRvIHJldmlldyBhbmQgcG9pbnQgb3V0IGFsbCBzdHlsZQppc3N1ZXMsIHRoYXQncyBh
IG5vLWdvIGZyb20gbXkgc2lkZS4gU28gZWl0aGVyIHdlIGhhdmUgYXV0b21hdGljIHN0eWxlCmNo
ZWNrcyBvciBJJ20ganVzdCBnb2luZyB0byBBY2sgcGF0Y2hlcyB3aXRoIHN0eWxlIGlzc3Vlcy4K
ClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
