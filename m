Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673D39B4A3C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 13:54:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827379.1241969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ljv-0006kP-Ul; Tue, 29 Oct 2024 12:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827379.1241969; Tue, 29 Oct 2024 12:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ljv-0006iF-Rr; Tue, 29 Oct 2024 12:54:27 +0000
Received: by outflank-mailman (input) for mailman id 827379;
 Tue, 29 Oct 2024 12:54:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uXRL=RZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t5lju-0006i9-Mx
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 12:54:26 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eac0c4c2-95f4-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 13:54:21 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-431616c23b5so38604995e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 05:54:21 -0700 (PDT)
Received: from ?IPV6:2003:e5:8706:5100:ddd3:fe18:d0ae:c30d?
 (p200300e587065100ddd3fe18d0aec30d.dip0.t-ipconnect.de.
 [2003:e5:8706:5100:ddd3:fe18:d0ae:c30d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b567e18sm171845825e9.26.2024.10.29.05.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 05:54:19 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: eac0c4c2-95f4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozNDMiLCJoZWxvIjoibWFpbC13bTEteDM0My5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImVhYzBjNGMyLTk1ZjQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjA2NDYxLjc0NzIwNywic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730206461; x=1730811261; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IB/SspXJn9DW40qXKS4C+SGjhth7zlhYxZ8X2ylA6ns=;
        b=Xk/HeWYXei2uAH2ehC3+q+3MKtVGayBav0gVilYZlvNFsLAntSLXLrtshfH93ScZ5y
         HSQfste8u9LM0hL3z4qY59LLNXDnuzzLkLLxgwdB3KG53oNGCRDfHbvWxOjsbT+opeVJ
         UBzyRzFPnYE4cwTsBPwxN2J76KFJJ3603GhZsCQXE0GDGtxj+0hwPYdQLkaJHXUPwMQ9
         yCm2zDx712v6qRB9qvG4ffhA3bMcAsnqzFCHPDYAO9ZZB6hWPqITelldmjDn8Lu6b6LY
         NsvA0AWf8j+3jybes6l1mFcddRwp/iXRhIECWEB3VRxw38wafMEwkeoRLTpTIP60EtOE
         0oSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730206461; x=1730811261;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IB/SspXJn9DW40qXKS4C+SGjhth7zlhYxZ8X2ylA6ns=;
        b=t6SzpJVLKfxEJOs4eH1CZsIBMNejvBAz8vl54ebR1Vvvl39WOju3DFzLGaH1LiH+LP
         FEDZJQl2GMeM5puh0rbb1KPmb0DGym16ZbaM3hfl78qTRGSvBIhMeLETyG6W/wnfmAVp
         yRkA4ERIYR1vvzXaBzy0c8UjvfvABmLfY3HKhd1/lUEXCyhsvW2ifIORWE8b9TjZE3Zu
         bM3HEg9cKEtUxzcINKIzzObHU1yDn7DjTZ4yelC4HE4yg8FiRXncw/dWZWrZUWqBizFC
         KzS0U2ijXFPBKRb6EtZ8bM+3c6B92zXnumJtTX0vOITPDy21TN6Yq3PNApWogeGMjy6+
         dpaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4zEdtp4R2rd3F98gayCrn99DXPKq2b7CgafZcPW7CyUfPTHyopc1pgUGvus9iccz1aDHTJaf87lw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuzZCZLEi3PKhrStxgfZHnpkOB5h87heXkmDqFYvDRha6r7vcT
	Pb4m0A4MVXgsvtv+0r9Kaz0oW9QRtIic7Q9SD4ABSuZjZENj0MBtgTvfCm8IZDo=
X-Google-Smtp-Source: AGHT+IHveqyLAdE+f0O3Qvwa05yrKETR0oJ0UJowgjCeDbzgrYNglYyyKbsOECitWP1T2CCI7CrHMg==
X-Received: by 2002:a05:600c:3c90:b0:431:416e:2603 with SMTP id 5b1f17b1804b1-431b55d3c24mr17473465e9.3.1730206459415;
        Tue, 29 Oct 2024 05:54:19 -0700 (PDT)
Message-ID: <1dea1f19-c247-435b-9c73-a0181914024d@suse.com>
Date: Tue, 29 Oct 2024 13:54:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] x86/xen: Drop absolute references from startup
 code
To: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Jason Andryuk <jason.andryuk@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 xen-devel@lists.xenproject.org
References: <20241009160438.3884381-7-ardb+git@google.com>
 <CAMj1kXHzahaLRH_0nSQaS7L+so0WRwh4R6SLdb1R+Hm3s-o1dA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <CAMj1kXHzahaLRH_0nSQaS7L+so0WRwh4R6SLdb1R+Hm3s-o1dA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gZOzk40ZcVg0MUXFpa50Y3np"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gZOzk40ZcVg0MUXFpa50Y3np
Content-Type: multipart/mixed; boundary="------------59DSvMH77fSlhYIrtlAj43Kz";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Jason Andryuk <jason.andryuk@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 xen-devel@lists.xenproject.org
Message-ID: <1dea1f19-c247-435b-9c73-a0181914024d@suse.com>
Subject: Re: [PATCH v3 0/5] x86/xen: Drop absolute references from startup
 code
References: <20241009160438.3884381-7-ardb+git@google.com>
 <CAMj1kXHzahaLRH_0nSQaS7L+so0WRwh4R6SLdb1R+Hm3s-o1dA@mail.gmail.com>
In-Reply-To: <CAMj1kXHzahaLRH_0nSQaS7L+so0WRwh4R6SLdb1R+Hm3s-o1dA@mail.gmail.com>

--------------59DSvMH77fSlhYIrtlAj43Kz
Content-Type: multipart/mixed; boundary="------------EJEuQGMwcveO1ydmzL3SuMmy"

--------------EJEuQGMwcveO1ydmzL3SuMmy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMTAuMjQgMTM6NTAsIEFyZCBCaWVzaGV1dmVsIHdyb3RlOg0KPiBPbiBXZWQsIDkg
T2N0IDIwMjQgYXQgMTg6MDksIEFyZCBCaWVzaGV1dmVsIDxhcmRiK2dpdEBnb29nbGUuY29t
PiB3cm90ZToNCj4+DQo+PiBGcm9tOiBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3Jn
Pg0KPj4NCj4+IFRoaXMgc2VyaWVzIHdhcyBicm9rZW4gb3V0IG9mIHRoZSBzZXJpZXMgSSBz
ZW50IHJlY2VudGx5IFswXSwgYWZ0ZXINCj4+IEphc29uIHBvaW50ZWQgb3V0IHRoYXQgbXkg
WGVuIHN0YXJ0dXAgY29kZSBjaGFuZ2VzIGNvbmZsaWN0IHdpdGggaGlzDQo+PiBjaGFuZ2Vz
IHRvIG1ha2UgdGhlIFBWSCBzdGFydHVwIGNvZGUgcG9zaXRpb24gaW5kZXBlbmRlbnQuDQo+
Pg0KPj4gSmFzb24ncyB3b3JrIHJlZHVjZXMgdGhlIGRlbHRhIG9mIG15IGNoYW5nZXMsIGFu
ZCBnaXZlbiB0aGF0IG15IG90aGVyDQo+PiBzZXJpZXMgd2lsbCBsaWtlbHkgYWR2YW5jZSBh
dCBhIG11Y2ggc2xvd2VyIHBhY2UsIHRoZSBYZW4gY2hhbmdlcyBhcmUNCj4+IHByZXNlbnRl
ZCBoZXJlIHNvIHRoZXkgY2FuIGJlIG1lcmdlZCBpbmRlcGVuZGVudGx5Lg0KPj4NCj4+IFRo
ZSBlbmQgcmVzdWx0IGFmdGVyIGFwcGx5aW5nIHRoaXMgc2VyaWVzIChzZWUgYmVsb3cpIGlz
IHRoYXQgdGhlcmUgYXJlDQo+PiBubyBsb25nZXIgYW55IFhlbi1yZWxhdGVkIGFic29sdXRl
IHJlbG9jYXRpb25zIHRoYXQgbmVlZCB0byBiZSBhcHBsaWVkDQo+PiB0byAuaGVhZC50ZXh0
LCBhIHNlY3Rpb24gd2hpY2ggY2FycmllcyBjb2RlIHRoYXQgbWF5IGJlIGludm9rZWQgZnJv
bSB0aGUNCj4+IDE6MSBtYXBwaW5nIG9mIG1lbW9yeSBiZWZvcmUgdGhlIGtlcm5lbCB2aXJ0
dWFsIG1hcHBpbmcgaXMgdXAuICBUaGUgdXNlDQo+PiBvZiBhYnNvbHV0ZSByZWZlcmVuY2Vz
IGluIHRoaXMgY29kZSBzZWN0aW9uIGhhcyByZXN1bHRlZCBpbiBhIGZldyBib290DQo+PiBp
c3N1ZXMgdGhhdCB3ZXJlIHZlcnkgaGFyZCB0byB0cmFjayBkb3duIChDbGFuZyBidWlsdCBr
ZXJuZWxzIHJ1bm5pbmcNCj4+IHVuZGVyIFNFVi1TTlAgaW4gcGFydGljdWxhciwgd2hpY2gg
ZG9lcyBub3QgcHJvdmlkZSB0aGUgYmVzdCBkZWJ1Zw0KPj4gZXhwZXJpZW5jZSkuDQo+Pg0K
Pj4gRXZlbiB0aG91Z2ggdGhlIG9jY3VycmVuY2VzIGluIHRoZSBYZW4gc3RhcnR1cCBjb2Rl
IHdlcmUgZmluZSwgdGhlcmUgaXMNCj4+IG5vdyBhIGxvdCBvZiBDIGNvZGUgZW1pdHRlZCBp
bnRvIC5oZWFkLnRleHQgYXMgd2VsbCwgYW5kIHNvIGl0IHdvdWxkIGJlDQo+PiBoZWxwZnVs
IHRvIHRlYWNoIG9ianRvb2wgdG8gcmVqZWN0IGFic29sdXRlIHJlZmVyZW5jZXMgZW50aXJl
bHkgaW4gdGhpcw0KPj4gc2VjdGlvbiAob3IgcmVseSBvbiB0aGUgbGlua2VyIGZvciB0aGF0
KS4gVGhlcmVmb3JlLCBub3QgcmVseWluZyBvbiB0aGVtDQo+PiBpbiB0aGUgZmlyc3QgcGxh
Y2UgaXMgYSBzdGVwIHRvd2FyZHMgdGhhdCBnb2FsLg0KPj4NCj4+IENoYW5nZXMgc2luY2Ug
djIgWzJdOg0KPj4gLSBhZGQgSmFzb24ncyBUZXN0ZWQtYnkgdG8gcGF0Y2ggIzQNCj4+IC0g
dXNlIGEgYmV0dGVyIG5hbWUgZm9yIHRoZSBsaW5rZXIgZGVmaW5lZCBzeW1ib2xzIHVzZWQg
aW4gdGhlIEVMRiBub3Rlcw0KPj4gICAgKHBhdGNoICM0KQ0KPj4gLSBhZGQgYSBjb21tZW50
IGluIHRoZSBsaW5rZXIgc2NyaXB0IGV4cGxhaW5pbmcgd2h5IHRoZSBzeW1ib2wgdmFsdWVz
DQo+PiAgICBhcmUgY29uc3RydWN0ZWQgaW4gdGhlIHdheSB0aGV5IGFyZQ0KPj4gLSByZWJh
c2Ugb250byB2Ni4xMi1yYzINCj4+DQo+PiBDaGFuZ2VzIHNpbmNlIHYxIFsxXToNCj4+IC0g
YWRkIEphc29uJ3MgUmIgdG8gcGF0Y2hlcyAjMiwgIzMgYW5kICM1DQo+PiAtIGRyb3AgdGhl
IHVzZSBvZiBhIDMyLWJpdCBmaWVsZCBmb3IgdGhlIEVMRiBub3RlLSBRRU1VIHJlYWRzIGEg
dTY0IGFuZA0KPj4gICAgc28gdGhlIHRvcCB3b3JkIG5lZWRzIHRvIHJlbWFpbiAweDANCj4+
IC0gdHdlYWsgI2lmZGVmcyBpbiBwYXRjaCAjNCBzbyB0aGUgaHlwZXJjYWxsX3BhZ2UgbGlu
a2VyIHN5bWJvbCBkb2VzIG5vdA0KPj4gICAgZGVwZW5kIG9uIENPTkZJR19YRU5fUFYNCj4+
IC0gcmViYXNlIG9udG8gdjYuMTItcmMxDQo+Pg0KPj4gQ2hhbmdlcyB3cnQgWzBdOg0KPj4g
LSBhZGQgSmFzb24ncyBSYiB0byBwYXRjaCAjMQ0KPj4gLSByZWJhc2Ugb250byB4ZW4vdGlw
J3MgbGludXgtbmV4dCBicmFuY2gNCj4+IC0gc3BsaXQgb3V0IGZpeCBmb3IgR0RUIGRlc2Ny
aXB0b3Igc2l6ZSBmaWVsZA0KPj4gLSBhZGQgcGF0Y2ggdG8gcmVtb3ZlIHRoZSB6ZXJvaW5n
IG9mIHBoeXNfYmFzZSwgd2hpY2ggaXMgbm8gbG9uZ2VyDQo+PiAgICBuZWVkZWQNCj4+IC0g
dXNlIGEgMzItYml0IGZpZWxkIGZvciBYRU5fRUxGTk9URV9QSFlTMzJfRU5UUlksIGFuZCB1
c2UgaXRzIGNvbnRlbnRzDQo+PiAgICB0byBvYnRhaW4gdGhlIGJ1aWxkIHRpbWUgcGh5c2lj
YWwgYWRkcmVzcyBvZiBwdmhfc3RhcnR1cF94ZW4oKQ0KPj4NCj4+IFswXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNDA5MjUxNTAwNTkuMzk1NTU2OS0zMC1hcmRiK2dpdEBn
b29nbGUuY29tDQo+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwOTI2
MTA0MTEzLjgwMTQ2LTctYXJkYitnaXRAZ29vZ2xlLmNvbS8NCj4+IFsyXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNDA5MzAwNzE1MTMuOTA5NDYyLTctYXJkYitnaXRAZ29v
Z2xlLmNvbS8NCj4+DQo+PiBSZWxvY2F0aW9uIHNlY3Rpb24gJy5yZWxhLmhlYWQudGV4dCcg
YXQgb2Zmc2V0IDB4YjQyOCBjb250YWlucyAxNSBlbnRyaWVzOg0KPj4gICAgT2Zmc2V0ICAg
ICAgICAgIEluZm8gICAgICAgICAgIFR5cGUgICAgICAgICAgIFN5bS4gVmFsdWUgICAgU3lt
LiBOYW1lICsgQWRkZW5kDQo+PiAwMDAwMDAwMDAwMTggIDAwMDgwMDAwMDAwMiBSX1g4Nl82
NF9QQzMyICAgICAwMDAwMDAwMDAwMDAwMDAwIC5pbml0LmRhdGEgKyAxOA0KPj4gMDAwMDAw
MDAwMDJmICAwMDBlMDAwMDAwMDIgUl9YODZfNjRfUEMzMiAgICAgMDAwMDAwMDAwMDAwMDAw
MCBwdmhfc3RhcnRfaW5mbyArIDJmDQo+PiAwMDAwMDAwMDAwMzcgIDAwMGYwMDAwMDAwMiBS
X1g4Nl82NF9QQzMyICAgICAwMDAwMDAwMDAwMDAwMDAwIHB2aF9zdGFydF9pbmZvX3N6ICsg
MzcNCj4+IDAwMDAwMDAwMDA0MiAgMDAwODAwMDAwMDAyIFJfWDg2XzY0X1BDMzIgICAgIDAw
MDAwMDAwMDAwMDAwMDAgLmluaXQuZGF0YSArIDQwOTINCj4+IDAwMDAwMDAwMDA2MCAgMDAx
MDAwMDAwMDAyIFJfWDg2XzY0X1BDMzIgICAgIDAwMDAwMDAwMDAwMDAwMmMgeGVuX2VsZm5v
dGVfcGh5czNbLi4uXSArIDYwDQo+PiAwMDAwMDAwMDAwNjggIDAwMTEwMDAwMDAwMiBSX1g4
Nl82NF9QQzMyICAgICAwMDAwMDAwMDAwMDAwMDAwIHBoeXNfYmFzZSArIDY4DQo+PiAwMDAw
MDAwMDAwNmUgIDAwMTIwMDAwMDAwMiBSX1g4Nl82NF9QQzMyICAgICAwMDAwMDAwMDAwMDA1
MDAwIHB2aF9pbml0X3RvcF9wZ3QgKyA2ZQ0KPj4gMDAwMDAwMDAwMDg5ICAwMDEzMDAwMDAw
MDIgUl9YODZfNjRfUEMzMiAgICAgMDAwMDAwMDAwMDAwNjAwMCBwdmhfbGV2ZWwzX2lkZW50
X3BndCArIDg5DQo+PiAwMDAwMDAwMDAwOTEgIDAwMTQwMDAwMDAwMiBSX1g4Nl82NF9QQzMy
ICAgICAwMDAwMDAwMDAwMDA4MDAwIHB2aF9sZXZlbDNfa2VybmVsX3BndCArIDkxDQo+PiAw
MDAwMDAwMDAwYTMgIDAwMTUwMDAwMDAwMiBSX1g4Nl82NF9QQzMyICAgICAwMDAwMDAwMDAw
MDA5MDAwIHB2aF9sZXZlbDJfa2VybmVsX3BndCArIGEzDQo+PiAwMDAwMDAwMDAwYmUgIDAw
MTIwMDAwMDAwMiBSX1g4Nl82NF9QQzMyICAgICAwMDAwMDAwMDAwMDA1MDAwIHB2aF9pbml0
X3RvcF9wZ3QgKyBiZQ0KPj4gMDAwMDAwMDAwMGRlICAwMDA4MDAwMDAwMDIgUl9YODZfNjRf
UEMzMiAgICAgMDAwMDAwMDAwMDAwMDAwMCAuaW5pdC5kYXRhICsgMWMNCj4+IDAwMDAwMDAw
MDBlOSAgMDAxNjAwMDAwMDAyIFJfWDg2XzY0X1BDMzIgICAgIDAwMDAwMDAwMDAwMDAwMDAg
eGVuX3ByZXBhcmVfcHZoIC0gNA0KPj4gMDAwMDAwMDAwMGY4ICAwMDE3MDAwMDAwMDIgUl9Y
ODZfNjRfUEMzMiAgICAgMDAwMDAwMDAwMDAwMDAwMCBwdmhfYm9vdHBhcmFtcyAtIDQNCj4+
IDAwMDAwMDAwMDBmZCAgMDAxODAwMDAwMDA0IFJfWDg2XzY0X1BMVDMyICAgIDAwMDAwMDAw
MDAwMDAwMDAgc3RhcnR1cF82NCAtIDQNCj4+DQo+PiBSZWxvY2F0aW9uIHNlY3Rpb24gJy5y
ZWxhLm5vdGUuWGVuJyBhdCBvZmZzZXQgMHhiNjY4IGNvbnRhaW5zIDEgZW50cnk6DQo+PiAg
ICBPZmZzZXQgICAgICAgICAgSW5mbyAgICAgICAgICAgVHlwZSAgICAgICAgICAgU3ltLiBW
YWx1ZSAgICBTeW0uIE5hbWUgKyBBZGRlbmQNCj4+IDAwMDAwMDAwMDAyYyAgMDAxYTAwMDAw
MDAyIFJfWDg2XzY0X1BDMzIgICAgIDAwMDAwMDAwMDAwMDAwMDAgeGVuX2VsZm5vdGVfcGh5
czNbLi4uXSArIDANCj4+DQo+PiBDYzogSmFzb24gQW5kcnl1ayA8amFzb24uYW5kcnl1a0Bh
bWQuY29tPg0KPj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IENj
OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPg0KPj4gQ2M6
IHg4NkBrZXJuZWwub3JnDQo+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
DQo+Pg0KPiANCj4gUGluZz8NCg0KSSBoYXZlIHF1ZXVlZCB0aGlzIHNlcmllcyBmb3IgNi4x
My4NCg0KDQpKdWVyZ2VuDQo=
--------------EJEuQGMwcveO1ydmzL3SuMmy
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------EJEuQGMwcveO1ydmzL3SuMmy--

--------------59DSvMH77fSlhYIrtlAj43Kz--

--------------gZOzk40ZcVg0MUXFpa50Y3np
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcg2voFAwAAAAAACgkQsN6d1ii/Ey+l
pgf/alY9XdfauhOlIasMI3SCedfqnCZ5CtIqSf7D8cyOr3A0myUgoWXGLQK8xJz7jJ3k+WHiOKei
AuceXMfbhukeNOddLS4WiwGJgYD2j8gOiJHmpXC7gkxrTcBg/JO8aqN0Yk4O7PQaQyu3YuR8edYX
XFCsurjX7OX0sS7DiuTD+r9juepEw+K2vhMnpGxsaTZYwqbmmqx35Puc7MOG8S58RgoNPVJbwStR
srPk8O2CFlJ9msWCwc1Znjpd1Q4kGN+ERCI8+qBX4a6DP2NwDAgWDd0PZbv4ezD1HaC22sSK/msd
bzgCV3aCTK3ZYyuC1aRhPceZ40HLNOzBYq5/ekxxbQ==
=Pkdz
-----END PGP SIGNATURE-----

--------------gZOzk40ZcVg0MUXFpa50Y3np--

