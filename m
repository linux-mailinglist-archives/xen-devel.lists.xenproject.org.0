Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312467D662
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 09:35:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht5aK-0004oL-T0; Thu, 01 Aug 2019 07:33:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d+It=V5=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1ht5aJ-0004oG-DA
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 07:33:11 +0000
X-Inumbo-ID: 9be1c834-b42e-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9be1c834-b42e-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 07:33:09 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 62so44586977lfa.8
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 00:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C4UqOERjCdyOMH1D7ZlJwfeNdHoDZ5xpHkL2ZFftQ8s=;
 b=lNatkaNiL00nTWWauG8ZUxqKhokLdgnWumIzYjqhVJFGJAp5AJUmQZvvW5tfL/kD2y
 xMG81fTq0cEsj911ZcCrYExMNU/38tHk9NijQeHLMyTHPiumRX6ltPbC/EDtwTfn1cJv
 9NkN0Gn6Kenq7A8B5BbGjytozQAmChzZtrGH9HZMRrDuWpOTlWE0ASBlTTWeCiprZJhP
 0ta3ePZEpWq9YMOjwHHnlkHn4LjOPNaIZ1cUt9S8e4H73hb7S6aV3dVj5LvQdNxvz1SR
 zIbUovcYQXaqjzR9qCinfzrl/IfsOycyA51WCNkHKlTzRue5xONt3As8NyHcbqjRqQco
 QdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C4UqOERjCdyOMH1D7ZlJwfeNdHoDZ5xpHkL2ZFftQ8s=;
 b=WIN1xAMFFO1kOjOqHrW/VP+QMihuKy/c4E/tkOVLjlNaldAY5jF0Rw/ifJqpDiAoJ+
 7Efb95jsf9+yf+yx/BGjYGTUjBFrhl50vjBsyGVWQx/fwpkPeFYDXne58QYJHIF7YM8A
 jT0sZ92FBk8KKH7+3XfTkS8K1a5zDIuAgsGFjcMh+oFVDZ7QVh1fYtJZR10rVa5I0Fzn
 w5A5XFSjqVMw4DYbDvSZZo8RJ+HzTANYvPMisUj1YSkE/t2RiMm1rQuDFRXbJopzjb+I
 Baia5913Nt9rFbCzefIh4KX7NRlLSIcSeVrkiZnH8kw6/GWN0NV35gkxSeShhqkD86zv
 gxaQ==
X-Gm-Message-State: APjAAAWgWDkSW4pzSLphWHwLgi7v2q+M3JIZpoCxxABm59Y6OhiREJl7
 5yZ4U8i09ardhNNywsTF3uQ=
X-Google-Smtp-Source: APXvYqykopY1vmuYLz4RG6r2moF8oJG+B0lXjYwSGnPAn6sIlFRYwS4VPPfjuygvFqy3mZvVNGK6Fg==
X-Received: by 2002:a19:f703:: with SMTP id z3mr4968127lfe.171.1564644788183; 
 Thu, 01 Aug 2019 00:33:08 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 t1sm14479202lji.52.2019.08.01.00.33.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 00:33:07 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-7-git-send-email-andrii.anisov@gmail.com>
 <c971845f-7305-22c2-081f-9faa36e4c8d2@arm.com>
 <63256c34-fab7-1fb8-3637-9c5a50d6d6bf@gmail.com>
 <8c7bc6d1-3482-ec5b-b3d9-c6562caf5711@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <c2a220ad-553f-272f-606f-2c569e299e10@gmail.com>
Date: Thu, 1 Aug 2019 10:33:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8c7bc6d1-3482-ec5b-b3d9-c6562caf5711@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 5/6] arm64: call enter_hypervisor_head only
 when it is needed
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Andre Przywara <andre.przywara@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAzMS4wNy4xOSAxNDowMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEV2ZXJ5dGhpbmcgaXMg
aW4gdGhlIGhvdCBwYXRoIGhlcmUsIHlldCB0aGVyZSBhcmUgYSBsb3Qgb2Ygb3RoZXIgYnJhbmNo
ZXMuIFNvIHdoeSB0aGlzIGJyYW5jaCBpbiBwYXJ0aWN1bGFyPwoKVGhpcyBicmFuY2ggYW5kIGZ1
bmN0aW9uIGNhbGwgaXMgcGFydGljdWxhciBiZWNhdXNlIEkgZmluZCB0aGlzIHBpZWNlIG9mIGNv
ZGUgcXVpdGUgY29uZnVzaW5nOgoKPj4gSSdtIG5vdCBzZWVpbmcgYW55IGJlbmVmaXRzIGluIGNh
bGxpbmcgYGVudGVyX2h5cGVydmlzb3JfaGVhZCgpYCBmcm9tIGZ1bmN0aW9ucyBuYW1lZCBgZG9f
dHJhcF9oeXBfKmAuIFRoYXQgY29kZSBpcyBjb25mdXNpbmcgZm9yIG1lLgo+PiBJTUhPLCBkaXZp
ZGluZyBgZG9fdHJhcF9pcnEvZmlxKClgIGludG8gZ3Vlc3QgYW5kIGh5cCBzcGVjaWZpYyBmdW5j
dGlvbnMgaXMgbm90IGEgYmlnIGRlYWwuIEV2ZW4gZm9yIEFSTTMyLiBNb3Jlb3ZlciwgaXQgd2ls
bCBtYWtlIG1vcmUgb2J2aW91cyB0aGUgZmFjdCB0aGF0IG5vdGhpbmcgZnJvbSBgZW50ZXJfaHlw
ZXJ2aXNvcl9oZWFkKClgIGlzIGRvbmUgZm9yIElSUSB0cmFwcyB0YWtlbiBmcm9tIGh5cC4KCkFu
ZCBJIGJlbGlldmUgdGhpcyBwYXRjaCBiYWxhbmNlcyBwYXRjaCAieGVuL2FybTogUmUtZW5hYmxl
IGludGVycnVwdCBsYXRlciBpbiB0aGUgdHJhcCBwYXRoIiB3aGF0IHlvdSBOQUtlZCBiZWNhdXNl
IG9mIGluY3JlYXNlZCBJUlEgbGF0ZW5jeS4KV2hpbGUgdGhlbSB0b2dldGhlciBtYWtlIHRoZSBj
b2RlIG1vcmUgc3RyYWlnaHQgZm9yd2FyZCBhbmQgY2xlYXIsIGJlY2F1c2U6CiAgLSB5b3Ugc3Rh
cnQgYWxsIEMtY29kZWQgY29tbW9uIHRyYXAgaGFuZGxlcnMgd2l0aCBJUlFzIGxvY2tlZCwgYW5k
IGZyZWUgZnJvbSBhc20gY29kZSBtaXN1bmRlcnN0YW5kaW5nCiAgLSBhbGwgY29tbW9uIHRyYXAg
aGFuZGxlcnMgYXJlIGRpc3RpbmN0IGluIHRoZWlyIG5hbWluZywgcHVycG9zZSBhbmQgYWN0aW9u
LiBJbiB0ZXJtcyBvZiBjYWxsaW5nIGBlbnRlcl9oeXBlcnZpc29yX2hlYWQoKWAgb25seSBmcm9t
IHRoZSB0cmFwcyB0YWtlbiBmcm9tIGd1ZXN0LgoKPiBJZiB5b3UgYXJlIHJlYWxseSB3b3JyeSBv
ZiB0aGUgaW1wYWN0IG9mIGJyYW5jaCB0aGVuIHRoZXJlIGFyZSBhIGZldyBtb3JlIGltcG9ydGFu
dCBwbGFjZXMgKHdpdGggYSBncmVhdGVyIGJlbmVmaXRzKSB0byBsb29rOgo+ICDCoMKgwqAgMSkg
SXQgc2VlbXMgdGhlIGNvbXBpbGVyIHVzZSBhIGp1bXAgdGFibGUgZm9yIHRoZSBzd2l0Y2ggY2Fz
ZSBpbiBkb190cmFwX2d1ZXN0X3N5bmMoKSwgc28gaXQgd2lsbCByZXN1bHQgdG8gbXVsdGlwbGUg
ZGlyZWN0IGJyYW5jaCBldmVyeXRpbWUuCj4gIMKgwqDCoCAyKSBJbmRpcmVjdCBicmFuY2ggaGF2
ZSBhIG5vbi1uZWdsaWdpYmxlIGNvc3QgY29tcGFyZSB0byBkaXJlY3QgYnJhbmNoLiBUaGlzIGlz
IGEgbG90IHVzZWQgaW4gdGhlIGludGVycnVwdCBjb2RlIChzZWUgZ2ljX2h3X29wcy0+cmVhZF9p
cnEoKSkuIEFsbCBvZiB0aGVtIGFyZSBrbm93biBhdCBib290IHRpbWUsIHNvIHRoZXkgY291bGQg
YmUgcmVwbGFjZSB3aXRoIGRpcmVjdCBicmFuY2guIHg4NiByZWNlbnRseSBpbnRyb2R1Y2VkIGFs
dGVybmF0aXZlX2NhbGwoKSBmb3IgdGhpcyBwdXJwb3NlLiBUaGlzIGNvdWxkIGJlIHJlLXVzZWQg
b24gQXJtLgoKSSByZW1lbWJlciB0aGlzLiBCdXQgSSdtIG5vdCByZWFkeSB0byBjb2RlIGl0LiBJ
IGFkbWl0IHRoYXQgSSBoYXZlIG5vdCB5ZXQgZ29vZCB1bmRlcnN0YW5kaW5nIGFib3V0IGhvdyBh
bHRlcm5hdGl2ZXMgd29yay4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
