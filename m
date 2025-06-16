Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E286AADA7C5
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 07:41:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016427.1393325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR2aF-0005iU-VW; Mon, 16 Jun 2025 05:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016427.1393325; Mon, 16 Jun 2025 05:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR2aF-0005gV-Pp; Mon, 16 Jun 2025 05:40:39 +0000
Received: by outflank-mailman (input) for mailman id 1016427;
 Mon, 16 Jun 2025 05:40:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR2aE-0005dX-KO
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 05:40:38 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bf5be09-4a74-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 07:40:33 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ade48b24c97so639847866b.2
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jun 2025 22:40:33 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b?
 (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de.
 [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adecdcae670sm568395866b.184.2025.06.15.22.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jun 2025 22:40:32 -0700 (PDT)
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
X-Inumbo-ID: 6bf5be09-4a74-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750052433; x=1750657233; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PtGa9BiltSEfCE6pUkFJ0nmDG9QdCpI+jRCiUubRb+8=;
        b=OTyBG0gu1dvYV1divgUSVeyjaC7/bGPMcaVn6vmH2K2pBmpWlLPSkwqrpVFt6c1ImS
         h8wIUmuyzVyRSf38zplT0UczHPj0jQN0vC298XZsmB2WGPHEeWQnFmpGcheuZMhYcwH4
         a63Rk9gNOQnrwQdtM/vCbXAEhAK+aseBABMQyJ5P1PfeVFxX1ooApOHRsAf8VhcokoXd
         jy9cy/PrbreTK8ygPHNj9D/3N8DHDzBBgtPBPjQVWWDL8Otnx5tYd/h/X5MIAp/KACcc
         ZF1mC3Cv/ilLWq65yqkzB6GY3XFEICsXPFld6dDW1tsfl8AFKSKFfqKEakR7TnK266PR
         UuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750052433; x=1750657233;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PtGa9BiltSEfCE6pUkFJ0nmDG9QdCpI+jRCiUubRb+8=;
        b=hV23oo0JXkp7Z9z5rx9ENCAWvxz79SGmM/5URqSrI+Fsvw3sgK0gD7UFpevBIS1Rva
         eKWR2vAWuAHQk2e8B2YH0xY+gxtET2QhdqRar4v7aA9flvfoY6fRxYPFZyz2xeo1g3E0
         /Pdvk8/hmCqrLRJR9L74NiYMTpQhGXnG2N1zReBHp4f3iTzbocelvMAxXvftxSdhpvxK
         /PPLYktYiop9jHLCjetpUKp4MTUYiklwqKxNncAOnokBgFjsTxad8ULU8Y0nfs29dkNo
         f9kwueNA5x+q/RtxMF6dUkTwueE8CLNo29BE1AzrDck1MwNePNA+6i9aPa8wQrJk9mIb
         6XAA==
X-Forwarded-Encrypted: i=1; AJvYcCXOTPgQUy1DCSEkTikRl0KDSN4LTqifhfv7uYWy94yaT5umNt2ICskI2SvlYnTAIAL3L5v0I0BH+e0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDI6UH9+sChPnw0PyxUwwfHpFiwCUmAocRYkVaOJcHGqyiuC2z
	r/uLTQXksizUbrywZQ+WBEIsXOvgwbFUeipXx3bEbJhIYTNZfRHS57teTn024qtlYxc=
X-Gm-Gg: ASbGncvGa498UnFcruMM/kXc693hREEsJSTH64Lg4/WKq2otGKxV98Thmdts2qW0OAa
	qidMkUDrA9OmfuQ7nJSa2adrQ06Rt70/0KIqKxbKNuLBy791312/nbE90qbPv33Dkqs8osztTa1
	eYTcVlubIAX/eXTJt1mFvcnbqgpiqBx6+0B+jdFrjpS11/t0I91+HmgeAa1zlvAu20wJnKWTyX+
	wPKnA4fbrnmpwqjFWSjsqGYdYonYTG4/qOORzD9eteUU7AGSyDkUvjFhyOU0CmGfiGa8qyY+1bf
	o5O4iVzjH3lJD6w5ONjQ5xAfD9MNswY9o4fYS7rrpvmqq7WeUor/0Zt0PD0rse4x77sidi57C51
	azwObY2xGWK2dlyhNO2T4Pv7THJUxXk6xAk11lUB6qivfRr04b97TtHqx0C3LSfF4OPM6VVVjKO
	bmCd3tJfsqg5c=
X-Google-Smtp-Source: AGHT+IHmNIqU4mrDdCTj2UAWLWI8Q/UKK3omTAorxv5vfLr3BtPZtmxVVlWlAVrm4CHK/IeEO2hqxw==
X-Received: by 2002:a17:907:2da9:b0:ad8:a935:b907 with SMTP id a640c23a62f3a-adfad287d43mr647841466b.8.1750052433081;
        Sun, 15 Jun 2025 22:40:33 -0700 (PDT)
Message-ID: <fa8b8257-947d-440b-9d52-79c01e63270c@suse.com>
Date: Mon, 16 Jun 2025 07:40:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 01/12] kexec: add kexec framework
To: Jason Andryuk <jandryuk@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org
References: <20250321092451.17309-1-jgross@suse.com>
 <20250321092451.17309-2-jgross@suse.com>
 <CAKf6xptTLrEem1rvR+siM+-v-BqkAAs1A8jd-Ed7+NH6c61=Fw@mail.gmail.com>
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
In-Reply-To: <CAKf6xptTLrEem1rvR+siM+-v-BqkAAs1A8jd-Ed7+NH6c61=Fw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c1i91g09BY09HIQD05xjnWJE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c1i91g09BY09HIQD05xjnWJE
Content-Type: multipart/mixed; boundary="------------GXQaY9QphCH00dkYtbUAWd00";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org
Message-ID: <fa8b8257-947d-440b-9d52-79c01e63270c@suse.com>
Subject: Re: [MINI-OS PATCH 01/12] kexec: add kexec framework
References: <20250321092451.17309-1-jgross@suse.com>
 <20250321092451.17309-2-jgross@suse.com>
 <CAKf6xptTLrEem1rvR+siM+-v-BqkAAs1A8jd-Ed7+NH6c61=Fw@mail.gmail.com>
In-Reply-To: <CAKf6xptTLrEem1rvR+siM+-v-BqkAAs1A8jd-Ed7+NH6c61=Fw@mail.gmail.com>

--------------GXQaY9QphCH00dkYtbUAWd00
Content-Type: multipart/mixed; boundary="------------JQrCHYqapAtOz1SfzK44M06F"

--------------JQrCHYqapAtOz1SfzK44M06F
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SmFzb24sDQoNCnRoYW5rcyBmb3IgaGF2aW5nIGEgbG9vayBhdCB0aGUgc2VyaWVzISBJIHZl
cnkgbXVjaCBhcHByZWNpYXRlIHRoYXQhDQoNCk9uIDE0LjA2LjI1IDE4OjQwLCBKYXNvbiBB
bmRyeXVrIHdyb3RlOg0KPiBPbiBGcmksIE1hciAyMSwgMjAyNSBhdCA1OjI14oCvQU0gSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4+DQo+PiBBZGQgYSBuZXcg
Y29uZmlnIG9wdGlvbiBDT05GSUdfS0VYRUMgZm9yIHN1cHBvcnQgb2Yga2V4ZWMtaW5nIGlu
dG8gYQ0KPj4gbmV3IG1pbmktb3Mga2VybmVsLiBBZGQgYSByZWxhdGVkIGtleGVjLmMgc291
cmNlIGFuZCBhIGtleGVjLmggaGVhZGVyLg0KPj4NCj4+IEZvciBub3cgYWxsb3cgQ09ORklH
X0tFWEVDIHRvIGJlIHNldCBvbmx5IGZvciBQVkggdmFyaWFudCBvZiBtaW5pLW9zLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+
IC0tLQ0KPiANCj4gDQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvdGVzdGJ1aWxkL2FsbC15
ZXMgYi9hcmNoL3g4Ni90ZXN0YnVpbGQvYWxsLXllcw0KPj4gaW5kZXggOGFlNDg5YTQuLjk5
YmE3NWRkIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC94ODYvdGVzdGJ1aWxkL2FsbC15ZXMNCj4+
ICsrKyBiL2FyY2gveDg2L3Rlc3RidWlsZC9hbGwteWVzDQo+PiBAQCAtMTksMyArMTksNSBA
QCBDT05GSUdfQkFMTE9PTiA9IHkNCj4+ICAgQ09ORklHX1VTRV9YRU5fQ09OU09MRSA9IHkN
Cj4+ICAgIyBUaGUgZm9sbG93aW5nIGFyZSBzcGVjaWFsOiB0aGV5IG5lZWQgc3VwcG9ydCBm
cm9tIG91dHNpZGUNCj4+ICAgQ09ORklHX0xXSVAgPSBuDQo+PiArIyBLRVhFQyBvbmx5IHdp
dGhvdXQgUEFSQVZJUlQNCj4gDQo+IE1heWJlOiAiS0VYRUMgbm90IGltcGxlbWVudGVkIGZv
ciBQQVJBVklSVCI/DQoNCkZpbmUgd2l0aCBtZS4NCg0KPiANCj4+ICtDT05GSUdfS0VYRUMg
PSBuDQo+IA0KPj4gZGlmZiAtLWdpdCBhL2tleGVjLmMgYi9rZXhlYy5jDQo+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAuLjUzNTI4MTY5DQo+PiAtLS0gL2Rl
di9udWxsDQo+PiArKysgYi9rZXhlYy5jDQo+PiBAQCAtMCwwICsxLDYyIEBADQo+IA0KPj4g
Kw0KPj4gKyNpbmNsdWRlIDxlcnJuby5oPg0KPj4gKyNpbmNsdWRlIDxtaW5pLW9zL29zLmg+
DQo+PiArI2luY2x1ZGUgPG1pbmktb3MvbGliLmg+DQo+PiArI2luY2x1ZGUgPG1pbmktb3Mv
a2V4ZWMuaD4NCj4+ICsNCj4+ICsvKg0KPj4gKyAqIEdlbmVyYWwgYXBwcm9hY2ggZm9yIGtl
eGVjIHN1cHBvcnQgKFBWSCBvbmx5KSBpcyBhcyBmb2xsb3dzOg0KPj4gKyAqDQo+PiArICog
LSBOZXcga2VybmVsIG5lZWRzIHRvIGJlIGluIG1lbW9yeSBpbiBmb3JtIG9mIGEgRUxGIGZp
bGUgaW4gYSB2aXJ0dWFsDQo+IA0KPiAiaW4gdGhlIGZvcm0gb2YgYW4gRUxGIGJpbmFyeSIN
Cj4gDQo+PiArICogICBtZW1vcnkgcmVnaW9uLg0KPiANCj4gTWF5YmUganVzdCAiVGhlIG5l
dyBrZXJuZWwgbmVlZHMgdG8gYmUgYW4gRUxGIGJpbmFyeSBsb2FkZWQgaW50byB0aGUNCj4g
TWluaS1PUyBhZGRyZXNzIHNwYWNlIj8NCg0KVGhlICJ2aXJ0dWFsIG1lbW9yeSByZWdpb24i
IGlzIHF1aXRlIGltcG9ydGFudCwgYXMgdGhpcyBhbGxvd3MgdG8gaGFuZGxlDQpjb25mbGlj
dHMgd2l0aCB0aGUgdGFyZ2V0IG1lbW9yeSBsYXlvdXQgb24gYSBwZXItcGFnZSBiYXNpcy4N
Cg0KPiANCj4+ICsgKiAtIEEgbmV3IHN0YXJ0X2luZm8gc3RydWN0dXJlIGlzIGNvbnN0cnVj
dGVkIGluIG1lbW9yeSB3aXRoIHRoZSBmaW5hbA0KPj4gKyAqICAgbWVtb3J5IGxvY2F0aW9u
cyBpbmNsdWRlZC4NCj4+ICsgKiAtIEFsbCBtZW1vcnkgYXJlYXMgbmVlZGVkIGZvciBrZXhl
YyBleGVjdXRpb24gYXJlIGJlaW5nIGZpbmFsaXplZC4NCj4+ICsgKiAtIEZyb20gaGVyZSBv
biBhIGdyYWNlZnVsIGZhaWx1cmUgaXMgbm8gbG9uZ2VyIHBvc3NpYmxlLg0KPj4gKyAqIC0g
R3JhbnRzIGFuZCBldmVudCBjaGFubmVscyBhcmUgdG9ybiBkb3duLg0KPj4gKyAqIC0gQSB0
ZW1wb3Jhcnkgc2V0IG9mIHBhZ2UgdGFibGVzIGlzIGNvbnN0cnVjdGVkIGF0IGEgbG9jYXRp
b24gd2hlcmUgaXQNCj4+ICsgKiAgIGRvZXNuJ3QgY29uZmxpY3Qgd2l0aCBvbGQgYW5kIG5l
dyBrZXJuZWwgb3Igc3RhcnRfaW5mby4NCj4+ICsgKiAtIFRoZSBmaW5hbCBrZXhlYyBleGVj
dXRpb24gc3RhZ2UgaXMgY29waWVkIHRvIGEgbWVtb3J5IGFyZWEgYmVsb3cgNEcgd2hpY2gN
Cj4+ICsgKiAgIGRvZXNuJ3QgY29uZmxpY3Qgd2l0aCB0aGUgdGFyZ2V0IGFyZWFzIG9mIGtl
cm5lbCBldGMuDQo+PiArICogLSBDcjMgaXMgc3dpdGNoZWQgdG8gdGhlIG5ldyBzZXQgb2Yg
cGFnZSB0YWJsZXMuDQo+PiArICogLSBFeGVjdXRpb24gY29udGludWVzIGluIHRoZSBmaW5h
bCBleGVjdXRpb24gc3RhZ2UuDQo+PiArICogLSBBbGwgZGF0YSBpcyBjb3BpZWQgdG8gaXRz
IGZpbmFsIGFkZHJlc3Nlcy4NCj4+ICsgKiAtIFByb2Nlc3NpbmcgaXMgc3dpdGNoZWQgdG8g
MzItYml0IG1vZGUgd2l0aG91dCBhZGRyZXNzIHRyYW5zbGF0aW9uLg0KPiANCj4gTWF5YmUg
IkNQVSBpcyBzd2l0Y2hlZCB0byAzMi1iaXQgbW9kZSB3aXRoIHBhZ2luZyBkaXNhYmxlZC4i
Pw0KDQpPa2F5Lg0KDQo+IA0KPiBJcyB0aGUgZm9sbG93aW5nIG1lbW9yeSBsYXlvdXQgY29y
cmVjdD8NCj4gDQo+IFsgMCAuLi4gOE1CIF0gLi4uIFsgWCAuLi4gWCArIFkgXSAuLi4gWyBa
IC4uLiAgICAgIF0NCj4gICBPbGQgc3R1YmRvbSAgICAgICAgTmV3IHN0dWJkb20gICAgICAg
ICBrZXhlYyBjb2RlDQoNCldpdGg6DQpPOiBvbGQgc3R1YmRvbSBrZXJuZWwNClA6IGFjdGl2
ZSBwYWdlIHRhYmxlcw0KTjogbmV3IHN0dWJkb20ga2VybmVsDQpaOiBrZXhlYyBjb2RlLg0K
DQpUaGUgZ3Vlc3QgcGh5c2ljYWwgbWVtb3J5IGxheW91dCBpcyBtb3JlIGxpa2U6DQpPUE9P
T05QLk5OLk4uTk5OLi5aTk4uLlBQLi4NCg0KVGhlIHRhcmdldCBsYXlvdXQgb2YgdGhpcyBl
eGFtcGxlIChiZWZvcmUgdGhlIGZpbmFsIGtleGVjIHN0YWdlKSB3aWxsIGJlOg0KTy5PT08u
Li4uTi5OLk5OTlAuWk5OUC5QUE5ODQoNCk5vdGUgdGhhdCBhbGwgY29uZmxpY3RpbmcgTiBh
bmQgUCBlbnRyaWVzIGhhdmUgYmVlbiBtb3ZlZCB0byBhIHBvc2l0aW9uDQpiZWhpbmQgdGhl
IHRhcmdldCBwb3NpdGlvbiBvZiB0aGUgbmV3IGtlcm5lbC4gVGhpcyBpbmNsdWRlcyB0aGUg
cGFnZQ0KdGFibGVzIGluIHRoZSBvbGQga2VybmVsIHdoaWNoIHdlcmUgcHJlLXBvcHVsYXRl
ZCBhdCBib290IHRpbWUuDQoNCkFuZCBiZWZvcmUgcGFzc2luZyBjb250cm9sIHRvIHRoZSBu
ZXcga2VybmVsIGl0IHdpbGwgYmU6DQpOTk5OTk5OTk4uLi4uLi4uLi5aLi4uLi4uLi4NCg0K
PiBrZXhlYyBjb2RlIGNvcGllcyBOZXcgc3R1YmRvbSB0byAwIGFuZCBsYXRlciBqdW1wcyB0
byBOZXcgc3R1YmRvbSBAIDANCg0KS2luZCBvZi4gVGhlICIwIiBpcyBub3QgaGFyZCB3aXJl
ZCBpbiB0aGUga2V4ZWMgY29kZS4NCg0KPiBUaGUgdGVtcG9yYXJ5IHBhZ2UgdGFibGVzIGFy
ZSB0byBhbGxvdyBvbGQgc3R1YmRvbSBhbmQga2V4ZWMgY29kZSB0bw0KPiBiZSBjYWxsZWQg
d2hpbGUgb3ZlcndyaXRpbmcgdGhlICJPbGQgc3R1YmRvbSIgcmFuZ2Ugd2hpY2ggd291bGQN
Cj4gaW5jbHVkZSB0aGUgcGFnZSB0YWJsZXMgb3JpZ2luYWxseSB1c2VkPyAgT3IgaXQgY2Fu
IG9ubHkgcnVuIHRoZSBrZXhlYw0KPiBjb2RlIG9uY2Ugb2xkIHN0dWJkb20gaXMgb3Zlcndy
aXR0ZW4sIHJpZ2h0Pw0KDQpZZXMuDQoNCkkganVzdCByZWFsaXplZCB0aGF0IHNvbWUgb2Yg
dGhlIGNvbW1lbnRzIGFyZSBzdGFsZSBub3cuIFRoZSBjdXJyZW50DQppbXBsZW1lbnRhdGlv
biBkb2Vzbid0IHNldHVwIGEgbmV3IHNldCBvZiBwYWdlIHRhYmxlcywgYnV0IGlzIHR3ZWFr
aW5nDQp0aGUgZXhpc3Rpbmcgb25lIHRvIGF2b2lkIGNvbmZsaWN0cy4NCg0KPiBJIHRoaW5r
IHNvbWUgY29tbWVudHMgdHdlYWtzIHdvdWxkIGJlIGhlbHBmdWwsIGJ1dCBjb2RlLXdpc2UN
Cj4gZXZlcnl0aGluZyBpcyBva2F5LCBzbzoNCj4gDQo+IFJldmlld2VkLWJ5OiBKYXNvbiBB
bmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQoNClRoYW5rcywNCg0KDQpKdWVyZ2Vu
DQo=
--------------JQrCHYqapAtOz1SfzK44M06F
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------JQrCHYqapAtOz1SfzK44M06F--

--------------GXQaY9QphCH00dkYtbUAWd00--

--------------c1i91g09BY09HIQD05xjnWJE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhPrk8FAwAAAAAACgkQsN6d1ii/Ey87
fggAhswXmpvmF9HUuRnYGL/ul17z+fyh4TY2YMfllJc1W2v9MO9hbm/u9KUauFZpQsCDV8KxChjg
csfsPpkzWAMPl9wRMFllp9J5XyFNnemntadytKA8L2qZx68CsFMC6CgISM55of2AaU7TaniLI4pN
vVrEtmPShUTjGF3K41IZiFgPWcZppMaKPWhCXTRF12wZMppoa3EYjNIDTgr+/2sg3E41AohbTzBL
LJDOjXWHUP0TnQPztDHIpo6gnrwfuy7S67pTS4aj0OlQ1UoI9ZDaCNou97fRMszJSRhwLGZbX+GG
P2B+J0qHPl/6Q33pZ0I07argTwD1hXsZHXAQs6hBpg==
=I9Js
-----END PGP SIGNATURE-----

--------------c1i91g09BY09HIQD05xjnWJE--

