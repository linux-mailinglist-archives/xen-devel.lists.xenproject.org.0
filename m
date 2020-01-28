Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0E214BE50
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 18:07:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwUHb-0003Kt-K6; Tue, 28 Jan 2020 17:04:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4/zE=3R=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iwUHZ-0003Kl-T9
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 17:04:09 +0000
X-Inumbo-ID: 32c98092-41f0-11ea-8396-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32c98092-41f0-11ea-8396-bc764e2007e4;
 Tue, 28 Jan 2020 17:04:09 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y17so16906383wrh.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2020 09:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GJFlQ7ukv6d8mNqgJ+nLD/HfzBZXfFiM9p04laKu9uo=;
 b=MLhg3S5O8cZgxIdDhSOx5l27NhSnP4jWL5WgJxaWWwd5cA6c3ninbSgb7KfE8XyVQ8
 ay9+dSCbbpriKh06kuZJdKNQaft04Fpey5VNXSIZKmj8tQpyHfpLrAmS7xQi5fVO3bhT
 z2lISurYhKNrETgKmLzzfrBNu5Yt8of3fGfccCwhONzdQtAGkAh0vSfOuvIkkVRrsFrM
 3Dif7Cfkct4gMY+gY/CtY4xFWB4hVt5+ZjajSLuHl4OZdE78+36KrgSr+FqSzXYO80Sz
 FQz31LO6T9ySchFCDRSt8oJECY3LITrQsTo2L9ud32gTCORpm3mM0lvNyGtkDXEVPbzF
 RQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GJFlQ7ukv6d8mNqgJ+nLD/HfzBZXfFiM9p04laKu9uo=;
 b=nC6KOmnnhO7DH8s/Rf+rLKnsoLvaWx+mxOJ2hF0mpZXxuKNbMQdqJuu6UH7Yd4xaI9
 ad7bZRCMP/paNSoWekEzgyNvjoBbRoWNxsJIiYn+uMo9JZW1Y92zfTnC6/T7wDArX4g1
 EU7djdlscRd3wZ9WY+x7wfquLx8dw7n+mEYdrWfnZmnNdqnV6BAGoRTxJv/AMd6cKqkr
 /P4z77zXqNdIVZ4SD+lLbtCG8pqt9NdoiW7zGCRZ4OztoUAhpwkz03ZyYGSivZrWpTZK
 RCNXqE4CLBtv3ttU+AF1pS+sMzKoIgGJG0uvfn7ukK0ZORsNWQE7N9nJDg71tE3Kq3Jv
 DpAg==
X-Gm-Message-State: APjAAAWInenB4W+oCe0Z1p82aUI9dg35IhpppYbpPqB2sfPFGwCGOFg0
 /izsG7w/QOHPb1orY8GZqqiHwculTNVd+bvMLsc=
X-Google-Smtp-Source: APXvYqxpCAXwOjrIRBHCiYdDLn8fMX9/KWM16535KfimaDnZjZGZEKhNP0XwoBud3CKGH5BAf0ZbZplQhLwxbMYE5E0=
X-Received: by 2002:a5d:5381:: with SMTP id d1mr29168357wrv.259.1580231048336; 
 Tue, 28 Jan 2020 09:04:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <0f94706731f30e8407f64064d33a27f549554250.1580148227.git.tamas.lengyel@intel.com>
 <60bfe54a-0395-228b-d74d-017db819c279@suse.com>
 <CABfawhnsNa-HZRtsuMop-dvV++WRNQj75TmN0LFW=ucs9Dz=SQ@mail.gmail.com>
 <f189faf0-107d-6cdb-c5f1-077563c3f40e@suse.com>
In-Reply-To: <f189faf0-107d-6cdb-c5f1-077563c3f40e@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 28 Jan 2020 10:03:31 -0700
Message-ID: <CABfawhmFmXmF_O+0=CTme_24FTycPrfPWttx7RwJW_TGqgC5tQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v6 2/9] x86/hvm: introduce
 hvm_copy_context_and_params
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
 Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgOTo1OSBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjguMDEuMjAyMCAxNzo1NCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgOTo0OCBBTSBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMjcuMDEuMjAyMCAxOTowNiwgVGFt
YXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+PiBAQCAtNDEzOSw0OSArNDE0MCwzMiBAQCBzdGF0aWMg
aW50IGh2bV9hbGxvd19zZXRfcGFyYW0oc3RydWN0IGRvbWFpbiAqZCwKPiA+Pj4gICAgICByZXR1
cm4gcmM7Cj4gPj4+ICB9Cj4gPj4+Cj4gPj4+IC1zdGF0aWMgaW50IGh2bW9wX3NldF9wYXJhbSgK
PiA+Pj4gLSAgICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9odm1fcGFyYW1fdCkgYXJnKQo+
ID4+PiArc3RhdGljIGludCBodm1fc2V0X3BhcmFtKHN0cnVjdCBkb21haW4gKmQsIHVpbnQzMl90
IGluZGV4LCB1aW50NjRfdCB2YWx1ZSkKPiA+Pj4gIHsKPiA+Pj4gICAgICBzdHJ1Y3QgZG9tYWlu
ICpjdXJyX2QgPSBjdXJyZW50LT5kb21haW47Cj4gPj4+IC0gICAgc3RydWN0IHhlbl9odm1fcGFy
YW0gYTsKPiA+Pj4gLSAgICBzdHJ1Y3QgZG9tYWluICpkOwo+ID4+PiAgICAgIHN0cnVjdCB2Y3B1
ICp2Owo+ID4+PiAgICAgIGludCByYzsKPiA+Pj4KPiA+Pj4gLSAgICBpZiAoIGNvcHlfZnJvbV9n
dWVzdCgmYSwgYXJnLCAxKSApCj4gPj4+IC0gICAgICAgIHJldHVybiAtRUZBVUxUOwo+ID4+PiAt
Cj4gPj4+IC0gICAgaWYgKCBhLmluZGV4ID49IEhWTV9OUl9QQVJBTVMgKQo+ID4+PiArICAgIGlm
ICggaW5kZXggPj0gSFZNX05SX1BBUkFNUyApCj4gPj4+ICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+ID4+Cj4gPj4gVGhlIGVxdWl2YWxlbnQgb2YgdGhpcyBvbiB0aGUgImdldCIgcGF0aCBub3cg
c2VlbXMgdG8gYmUgZ29uZS4gSXMKPiA+PiB0aGVyZSBhbnkgcmVhc29uIHRoZSBvbmUgaGVyZSBp
cyBzdGlsbCBuZWVkZWQ/Cj4gPj4KPiA+Pj4gK2ludCBodm1vcF9zZXRfcGFyYW0oCj4gPj4+ICsg
ICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5faHZtX3BhcmFtX3QpIGFyZykKPiA+Pj4gK3sK
PiA+Pj4gKyAgICBzdHJ1Y3QgeGVuX2h2bV9wYXJhbSBhOwo+ID4+PiArICAgIHN0cnVjdCBkb21h
aW4gKmQ7Cj4gPj4+ICsgICAgaW50IHJjOwo+ID4+PiArCj4gPj4+ICsgICAgaWYgKCBjb3B5X2Zy
b21fZ3Vlc3QoJmEsIGFyZywgMSkgKQo+ID4+PiArICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiA+
Pj4gKwo+ID4+PiArICAgIGlmICggYS5pbmRleCA+PSBIVk1fTlJfUEFSQU1TICkKPiA+Pj4gKyAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPj4+ICsKPiA+Pj4gKyAgICAvKiBNYWtlIHN1cmUgdGhl
IGFib3ZlIGJvdW5kIGNoZWNrIGlzIG5vdCBieXBhc3NlZCBkdXJpbmcgc3BlY3VsYXRpb24uICov
Cj4gPj4+ICsgICAgYmxvY2tfc3BlY3VsYXRpb24oKTsKPiA+Pj4gKwo+ID4+PiArICAgIGQgPSBy
Y3VfbG9ja19kb21haW5fYnlfYW55X2lkKGEuZG9taWQpOwo+ID4+PiArICAgIGlmICggZCA9PSBO
VUxMICkKPiA+Pj4gKyAgICAgICAgcmV0dXJuIC1FU1JDSDsKPiA+Pj4gKwo+ID4+PiArICAgIHJj
ID0gLUVJTlZBTDsKPiA+Pj4gKyAgICBpZiAoICFpc19odm1fZG9tYWluKGQpICkKPiA+Pj4gKyAg
ICAgICAgZ290byBvdXQ7Cj4gPj4KPiA+PiBEZXNwaXRlIHlvdXIgY2xhaW0gdG8gaGF2ZSBhZGRy
ZXNzZWQgbXkgcmVtYWluaW5nIGNvbW1lbnQgZnJvbSB2NCwKPiA+PiB5b3Ugc3RpbGwgdXNlIGdv
dG8gaGVyZSB3aGVuIHRoZXJlJ3MgYW4gZWFzeSBhbHRlcm5hdGl2ZS4KPiA+Cj4gPiBJIGRpZG4n
dCB3cml0ZSB0aGlzIGNvZGUuIFRoaXMgaXMgcHJlZXhpc3RpbmcgY29kZSB0aGF0IEknbSBqdXN0
Cj4gPiBtb3ZpbmcuIEkgZG9uJ3Qgd2FudCB0byByZXdyaXRlIHByZWV4aXN0aW5nIGNvZGUgaGVy
ZS4KPgo+IFdlbGwsIHdpdGggdGhlIGNvZGUgbW92ZW1lbnQgeW91IGNvdWxkIChhbmQgaW1vIHNo
b3VsZCkgX21vdmVfCj4gdGhlICJvdXQiIGxhYmVsIGluc3RlYWQgb2YgZHVwbGljYXRpbmcgaXQu
CgpJIHJlYWxseSByYXRoZXIgbm90IGNoYW5nZSBwcmVleGlzdGluZyBjb2RlIHdoZW4gcG9zc2li
bGUuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
