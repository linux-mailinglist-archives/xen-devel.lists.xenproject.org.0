Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85188973902
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 15:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795586.1204980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1C8-0001Od-2n; Tue, 10 Sep 2024 13:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795586.1204980; Tue, 10 Sep 2024 13:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1C7-0001M5-W5; Tue, 10 Sep 2024 13:46:11 +0000
Received: by outflank-mailman (input) for mailman id 795586;
 Tue, 10 Sep 2024 13:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ulZE=QI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1so1C7-0001Lt-2J
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 13:46:11 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04f87337-6f7b-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 15:46:02 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42bb6d3e260so7967475e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 06:46:02 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb33a92sm112784745e9.20.2024.09.10.06.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 06:46:01 -0700 (PDT)
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
X-Inumbo-ID: 04f87337-6f7b-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725975962; x=1726580762; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ffqd2lqUOLnT38BRGjepfLc2iuI0BKx2+gjm2RQcEIg=;
        b=JMjxoqa3cK5tJprxJ3WJHelbF10sy6AN4uAkYfnHjrHeChj3DQMjmASth+iQxsR0sN
         DQfeg89spDxiTo653DU/KwlJK6GRaQazm9Z0YPYOmxKcriFrNs37N0asZd+X73RODSK4
         X8KSjiLb0bgmY/KdDE/RgV1nKPYzkz123594ArIL4bjVRFKtTCA0gVA4MafIDaS9hl5A
         OfTFNdibQz9xdNio9vKfLnpWhBkeyMe+Vrh28AW+nRJiOBBjaE4MAXQNj7QRvjPRvVMU
         wNRb8/eKXh4EG1IeiE+2LEyuJwmmK5z43KFUJz05tl2xdtld4624gIC0gxDuPh9QvL8S
         v6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725975962; x=1726580762;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ffqd2lqUOLnT38BRGjepfLc2iuI0BKx2+gjm2RQcEIg=;
        b=kk9gEGlp/R1m6Llajclku+/UW4slcbgGtDiAxUi3yfWEJguLUe1RdZvbTy5A++bITD
         8ztAx6cVGvieD8DEZpzbIOkzCifPSBEdKQsF9IiAk12WzrJ+WgLUbnzxM0smlm6ayswM
         Ak3BZ0DG6MTGoBcs0glHJ1xvXaTlsdJdyB3HJB6ww3uhdILobHjsgtHMX7MZPSPO4/Gq
         B6xkHzWUgQ2CYT0uJBrbLD2Gcgj2TIq5ou6PIqUBTWTM23ZGiqgdHQVeAV7zU7RGRSxy
         Ff+App0iT6mhPZ5J84XwXSZDqWpvM3EB8HGxtEjYr4VY1i7OQxdhoCIlTz9B9+jUkAcB
         MTFw==
X-Forwarded-Encrypted: i=1; AJvYcCWwZIuYX2/OTbcIVsTsGUF52MtYvwP5o9N+2zYR48lxvNKJQSHek01MM8Em+NOP0Qf0TilBc91XZSg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0B/8/1eI95Z4gt8WOVkJ1luYK7Byww8bLORvr+EUJ3H8iRK1q
	r8D3Dlcu5t3732WjSvDBxfnAQ3TiDA1vpK9JzdZExWwaylWvOL/mZYxXTuMxKIM=
X-Google-Smtp-Source: AGHT+IG6RmqG94msa6Hsi5ciWm3/D9vsMhjTcpS0KwDf2ohlaBZwN11g64AkgpscpOcfb9ToWAJdDA==
X-Received: by 2002:a05:600c:4e11:b0:42c:b9c7:f54b with SMTP id 5b1f17b1804b1-42cb9c7f6e0mr44155905e9.16.1725975961827;
        Tue, 10 Sep 2024 06:46:01 -0700 (PDT)
Message-ID: <2e7d1bf6-443b-41a3-b97a-072461f71db5@suse.com>
Date: Tue, 10 Sep 2024 15:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] blkif: reconcile protocol specification with in-use
 implementations
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@cloud.com>,
 Mark Syms <mark.syms@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240910114604.13194-1-roger.pau@citrix.com>
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
In-Reply-To: <20240910114604.13194-1-roger.pau@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DJO2nqQo6p4VUW7XmaJ70xJq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DJO2nqQo6p4VUW7XmaJ70xJq
Content-Type: multipart/mixed; boundary="------------VkN5E0ZNtQrcXdPWew7Em3Ma";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@cloud.com>,
 Mark Syms <mark.syms@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <2e7d1bf6-443b-41a3-b97a-072461f71db5@suse.com>
Subject: Re: [PATCH v2] blkif: reconcile protocol specification with in-use
 implementations
References: <20240910114604.13194-1-roger.pau@citrix.com>
In-Reply-To: <20240910114604.13194-1-roger.pau@citrix.com>

--------------VkN5E0ZNtQrcXdPWew7Em3Ma
Content-Type: multipart/mixed; boundary="------------GF7uH0w6fzwTlc469eOhQQLT"

--------------GF7uH0w6fzwTlc469eOhQQLT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDkuMjQgMTM6NDYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gQ3VycmVudCBi
bGtpZiBpbXBsZW1lbnRhdGlvbnMgKGJvdGggYmFja2VuZHMgYW5kIGZyb250ZW5kcykgaGF2
ZSBhbGwgc2xpZ2h0DQo+IGRpZmZlcmVuY2VzIGFib3V0IGhvdyB0aGV5IGhhbmRsZSB0aGUg
J3NlY3Rvci1zaXplJyB4ZW5zdG9yZSBub2RlLCBhbmQgaG93DQo+IG90aGVyIGZpZWxkcyBh
cmUgZGVyaXZlZCBmcm9tIHRoaXMgdmFsdWUgb3IgaGFyZGNvZGVkIHRvIGJlIGV4cHJlc3Nl
ZCBpbiB1bml0cw0KPiBvZiA1MTIgYnl0ZXMuDQo+IA0KPiBUbyBnaXZlIHNvbWUgY29udGV4
dCwgdGhpcyBpcyBhbiBleGNlcnB0IG9mIGhvdyBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb25z
IHVzZQ0KPiB0aGUgdmFsdWUgaW4gJ3NlY3Rvci1zaXplJyBhcyB0aGUgYmFzZSB1bml0IGZv
ciB0byBvdGhlciBmaWVsZHMgcmF0aGVyIHRoYW4NCj4ganVzdCB0byBzZXQgdGhlIGxvZ2lj
YWwgc2VjdG9yIHNpemUgb2YgdGhlIGJsb2NrIGRldmljZToNCj4gDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICDilIIgc2VjdG9ycyB4ZW5idXMgbm9kZSDilIIgcmVxdWVzdHMgc2Vj
dG9yX251bWJlciDilIIgcmVxdWVzdHMge2ZpcnN0LGxhc3R9X3NlY3QNCj4g4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSADQo+IEZyZWVCU0QgYmxre2Zyb250LGJhY2t9IOKUgiAgICAg
c2VjdG9yLXNpemUgICAgIOKUgiAgICAgIHNlY3Rvci1zaXplICAgICAgIOKUgiAgICAgICAg
ICAgNTEyDQo+IOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgA0KPiBMaW51eCBibGt7ZnJv
bnQsYmFja30gICDilIIgICAgICAgICA1MTIgICAgICAgICDilIIgICAgICAgICAgNTEyICAg
ICAgICAgICDilIIgICAgICAgICAgIDUxMg0KPiDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilLzilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilLzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIANCj4gUUVNVSBibGtiYWNrICAgICAgICAgICAg4pSCICAgICBzZWN0b3Itc2l6ZSAgICAg
4pSCICAgICAgc2VjdG9yLXNpemUgICAgICAg4pSCICAgICAgIHNlY3Rvci1zaXplDQo+IOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUvOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgA0KPiBXaW5kb3dzIGJsa2Zyb250ICAgICAgICDi
lIIgICAgIHNlY3Rvci1zaXplICAgICDilIIgICAgICBzZWN0b3Itc2l6ZSAgICAgICDilIIg
ICAgICAgc2VjdG9yLXNpemUNCj4g4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS8
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pS84pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSADQo+IE1p
bmlPUyAgICAgICAgICAgICAgICAgIOKUgiAgICAgc2VjdG9yLXNpemUgICAgIOKUgiAgICAg
ICAgICA1MTIgICAgICAgICAgIOKUgiAgICAgICAgICAgNTEyDQo+IA0KPiBBbiBhdHRlbXB0
IHdhcyBtYWRlIGJ5IDY3ZTFjMDUwZTM2YiBpbiBvcmRlciB0byBjaGFuZ2UgdGhlIGJhc2Ug
dW5pdHMgb2YgdGhlDQo+IHJlcXVlc3QgZmllbGRzIGFuZCB0aGUgeGVuc3RvcmUgJ3NlY3Rv
cnMnIG5vZGUuICBUaGF0IGhvd2V2ZXIgb25seSBsZWFkIHRvIG1vcmUNCj4gY29uZnVzaW9u
LCBhcyB0aGUgc3BlY2lmaWNhdGlvbiBub3cgY2xlYXJseSBkaXZlcmdlZCBmcm9tIHRoZSBy
ZWZlcmVuY2UNCj4gaW1wbGVtZW50YXRpb24gaW4gTGludXguICBTdWNoIGNoYW5nZSB3YXMg
b25seSBpbXBsZW1lbnRlZCBmb3IgUUVNVSBRZGlzaw0KPiBhbmQgV2luZG93cyBQViBibGtm
cm9udC4NCj4gDQo+IFBhcnRpYWxseSByZXZlcnQgdG8gdGhlIHN0YXRlIGJlZm9yZSA2N2Ux
YzA1MGUzNmIgd2hpbGUgYWRqdXN0aW5nIHRoZQ0KPiBkb2N1bWVudGF0aW9uIGZvciAnc2Vj
dG9ycycgdG8gbWF0Y2ggd2hhdCBpdCB1c2VkIHRvIGJlIHByZXZpb3VzIHRvDQo+IDJmYTcw
MWU1MzQ2ZDoNCj4gDQo+ICAgKiBEZWNsYXJlICdmZWF0dXJlLWxhcmdlLXNlY3Rvci1zaXpl
JyBkZXByZWNhdGVkLiAgRnJvbnRlbmRzIHNob3VsZCBub3QgZXhwb3NlDQo+ICAgICB0aGUg
bm9kZSwgYmFja2VuZHMgc2hvdWxkIG5vdCBtYWtlIGRlY2lzaW9ucyBiYXNlZCBvbiBpdHMg
cHJlc2VuY2UuDQo+IA0KPiAgICogQ2xhcmlmeSB0aGF0ICdzZWN0b3JzJyB4ZW5zdG9yZSBu
b2RlIGFuZCB0aGUgcmVxdWVzdHMgZmllbGRzIGFyZSBhbHdheXMgaW4NCj4gICAgIDUxMi1i
eXRlIHVuaXRzLCBsaWtlIGl0IHdhcyBwcmV2aW91cyB0byAyZmE3MDFlNTM0NmQgYW5kIDY3
ZTFjMDUwZTM2Yi4NCj4gDQo+IEFsbCBiYXNlIHVuaXRzIGZvciB0aGUgZmllbGRzIHVzZWQg
aW4gdGhlIHByb3RvY29sIGFyZSA1MTItYnl0ZSBiYXNlZCwgdGhlDQo+IHhlbmJ1cyAnc2Vj
dG9yLXNpemUnIGZpZWxkIGlzIG9ubHkgdXNlZCB0byBzaWduYWwgdGhlIGxvZ2ljIGJsb2Nr
IHNpemUuICBXaGVuDQo+ICdzZWN0b3Itc2l6ZScgaXMgZ3JlYXRlciB0aGFuIDUxMiwgYmxr
ZnJvbnQgaW1wbGVtZW50YXRpb25zIG11c3QgbWFrZSBzdXJlIHRoYXQNCj4gdGhlIG9mZnNl
dHMgYW5kIHNpemVzIChkZXNwaXRlIGJlaW5nIGV4cHJlc3NlZCBpbiA1MTItYnl0ZSB1bml0
cykgYXJlIGFsaWduZWQNCj4gdG8gdGhlIGxvZ2ljYWwgYmxvY2sgc2l6ZSBzcGVjaWZpZWQg
aW4gJ3NlY3Rvci1zaXplJywgb3RoZXJ3aXNlIHRoZSBiYWNrZW5kDQo+IHdpbGwgZmFpbCB0
byBwcm9jZXNzIHRoZSByZXF1ZXN0cy4NCj4gDQo+IFRoaXMgd2lsbCByZXF1aXJlIGNoYW5n
ZXMgdG8gc29tZSBvZiB0aGUgZnJvbnRlbmRzIGFuZCBiYWNrZW5kcyBpbiBvcmRlciB0bw0K
PiBwcm9wZXJseSBzdXBwb3J0ICdzZWN0b3Itc2l6ZScgbm9kZXMgZ3JlYXRlciB0aGFuIDUx
Mi4NCj4gDQo+IEZpeGVzOiAyZmE3MDFlNTM0NmQgKCdibGtpZi5oOiBQcm92aWRlIG1vcmUg
Y29tcGxldGUgZG9jdW1lbnRhdGlvbiBvZiB0aGUgYmxraWYgaW50ZXJmYWNlJykNCj4gRml4
ZXM6IDY3ZTFjMDUwZTM2YiAoJ3B1YmxpYy9pby9ibGtpZi5oOiB0cnkgdG8gZml4IHRoZSBz
ZW1hbnRpY3Mgb2Ygc2VjdG9yIGJhc2VkIHF1YW50aXRpZXMnKQ0KPiBTaWduZWQtb2ZmLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gLS0tDQo+IENo
YW5nZXMgc2luY2UgdjE6DQo+ICAgLSBVcGRhdGUgY29tbWl0IG1lc3NhZ2UuDQo+ICAgLSBF
eHBhbmQgY29tbWVudHMuDQo+IC0tLQ0KPiAgIHhlbi9pbmNsdWRlL3B1YmxpYy9pby9ibGtp
Zi5oIHwgNTAgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2lvL2Jsa2lmLmggYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvaW8vYmxraWYuaA0KPiBpbmRleCAyMmYxZWVmMGMwY2EuLmRhODkzZWIzNzlk
YiAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2lvL2Jsa2lmLmgNCj4gKysr
IGIveGVuL2luY2x1ZGUvcHVibGljL2lvL2Jsa2lmLmgNCj4gQEAgLTIzNywxMiArMjM3LDE2
IEBADQo+ICAgICogc2VjdG9yLXNpemUNCj4gICAgKiAgICAgIFZhbHVlczogICAgICAgICA8
dWludDMyX3Q+DQo+ICAgICoNCj4gLSAqICAgICAgVGhlIGxvZ2ljYWwgYmxvY2sgc2l6ZSwg
aW4gYnl0ZXMsIG9mIHRoZSB1bmRlcmx5aW5nIHN0b3JhZ2UuIFRoaXMNCj4gLSAqICAgICAg
bXVzdCBiZSBhIHBvd2VyIG9mIHR3byB3aXRoIGEgbWluaW11bSB2YWx1ZSBvZiA1MTIuDQo+
ICsgKiAgICAgIFRoZSBsb2dpY2FsIGJsb2NrIHNpemUsIGluIGJ5dGVzLCBvZiB0aGUgdW5k
ZXJseWluZyBzdG9yYWdlLiBUaGlzIG11c3QNCj4gKyAqICAgICAgYmUgYSBwb3dlciBvZiB0
d28gd2l0aCBhIG1pbmltdW0gdmFsdWUgb2YgNTEyLiAgVGhlIHNlY3RvciBzaXplIHNob3Vs
ZA0KPiArICogICAgICBvbmx5IGJlIHVzZWQgZm9yIHJlcXVlc3Qgc2VnbWVudCBsZW5ndGgg
YW5kIGFsaWdubWVudC4NCj4gICAgKg0KPiAtICogICAgICBOT1RFOiBCZWNhdXNlIG9mIGlt
cGxlbWVudGF0aW9uIGJ1Z3MgaW4gc29tZSBmcm9udGVuZHMgdGhpcyBtdXN0IGJlDQo+IC0g
KiAgICAgICAgICAgIHNldCB0byA1MTIsIHVubGVzcyB0aGUgZnJvbnRlbmQgYWR2ZXJ0aXpl
cyBhIG5vbi16ZXJvIHZhbHVlDQo+IC0gKiAgICAgICAgICAgIGluIGl0cyAiZmVhdHVyZS1s
YXJnZS1zZWN0b3Itc2l6ZSIgeGVuYnVzIG5vZGUuIChTZWUgYmVsb3cpLg0KPiArICogICAg
ICBXaGVuIGV4cG9zaW5nIGEgZGV2aWNlIHRoYXQgdXNlcyA0MDk2IGxvZ2ljYWwgc2VjdG9y
IHNpemVzLCB0aGUgb25seQ0KDQpzL3VzZXMgNDA5NiBsb2dpY2FsIHNlY3RvciBzaXplcy91
c2VzIGEgbG9naWNhbCBzZWN0b3Igc2l6ZSBvZiA0MDk2Lw0KDQo+ICsgKiAgICAgIGRpZmZl
cmVuY2UgeGVuc3RvcmUgd2lzZSB3aWxsIGJlIHRoYXQgJ3NlY3Rvci1zaXplJyAoYW5kIHBv
c3NpYmx5DQo+ICsgKiAgICAgICdwaHlzaWNhbC1zZWN0b3Itc2l6ZScgaWYgc3VwcG9ydGVk
IGJ5IHRoZSBiYWNrZW5kKSB3aWxsIGJlIDQwOTYsIGJ1dA0KPiArICogICAgICB0aGUgJ3Nl
Y3RvcnMnIG5vZGUgd2lsbCBzdGlsbCBiZSBjYWxjdWxhdGVkIHVzaW5nIDUxMiBieXRlIHVu
aXRzLiAgVGhlDQo+ICsgKiAgICAgIHNlY3RvciBiYXNlIHVuaXRzIGluIHRoZSByaW5nIHJl
cXVlc3RzIGZpZWxkcyB3aWxsIGFsbCBiZSA1MTIgYnl0ZQ0KPiArICogICAgICBiYXNlZCBk
ZXNwaXRlIHRoZSBsb2dpY2FsIHNlY3RvciBzaXplIGV4cG9zZWQgaW4gJ3NlY3Rvci1zaXpl
Jy4NCj4gICAgKg0KPiAgICAqIHBoeXNpY2FsLXNlY3Rvci1zaXplDQo+ICAgICogICAgICBW
YWx1ZXM6ICAgICAgICAgPHVpbnQzMl90Pg0KPiBAQCAtMjU0LDggKzI1OCw4IEBADQo+ICAg
ICogc2VjdG9ycw0KPiAgICAqICAgICAgVmFsdWVzOiAgICAgICAgIDx1aW50NjRfdD4NCj4g
ICAgKg0KPiAtICogICAgICBUaGUgc2l6ZSBvZiB0aGUgYmFja2VuZCBkZXZpY2UsIGV4cHJl
c3NlZCBpbiB1bml0cyBvZiAic2VjdG9yLXNpemUiLg0KPiAtICogICAgICBUaGUgcHJvZHVj
dCBvZiAic2VjdG9yLXNpemUiIGFuZCAic2VjdG9ycyIgbXVzdCBhbHNvIGJlIGFuIGludGVn
ZXINCj4gKyAqICAgICAgVGhlIHNpemUgb2YgdGhlIGJhY2tlbmQgZGV2aWNlLCBleHByZXNz
ZWQgaW4gdW5pdHMgb2YgNTEyYi4NCj4gKyAqICAgICAgVGhlIHByb2R1Y3Qgb2YgInNlY3Rv
ci1zaXplIiAqIDUxMiBtdXN0IGFsc28gYmUgYW4gaW50ZWdlcg0KDQpEWU06IFRoZSBwcm9k
dWN0IG9mICJzZWN0b3JzIiAqIDUxMiBtdXN0IGFsc28gYmUgYW4gaW50ZWdlciAuLi4gPw0K
DQo+ICAgICogICAgICBtdWx0aXBsZSBvZiAicGh5c2ljYWwtc2VjdG9yLXNpemUiLCBpZiB0
aGF0IG5vZGUgaXMgcHJlc2VudC4NCj4gICAgKg0KPiAgICAqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKg0KPiBAQCAtMzM4LDYgKzM0Miw3IEBADQo+ICAgICogZmVhdHVyZS1sYXJnZS1zZWN0
b3Itc2l6ZQ0KPiAgICAqICAgICAgVmFsdWVzOiAgICAgICAgIDAvMSAoYm9vbGVhbikNCj4g
ICAgKiAgICAgIERlZmF1bHQgVmFsdWU6ICAwDQo+ICsgKiAgICAgIE5vdGVzOiAgICAgICAg
ICBERVBSRUNBVEVELCAxMg0KPiAgICAqDQo+ICAgICogICAgICBBIHZhbHVlIG9mICIxIiBp
bmRpY2F0ZXMgdGhhdCB0aGUgZnJvbnRlbmQgd2lsbCBjb3JyZWN0bHkgc3VwcGx5IGFuZA0K
PiAgICAqICAgICAgaW50ZXJwcmV0IGFsbCBzZWN0b3ItYmFzZWQgcXVhbnRpdGllcyBpbiB0
ZXJtcyBvZiB0aGUgInNlY3Rvci1zaXplIg0KPiBAQCAtNDExLDYgKzQxNiwxMSBAQA0KPiAg
ICAqKDEwKSBUaGUgZGlzY2FyZC1zZWN1cmUgcHJvcGVydHkgbWF5IGJlIHByZXNlbnQgYW5k
IHdpbGwgYmUgc2V0IHRvIDEgaWYgdGhlDQo+ICAgICogICAgIGJhY2tpbmcgZGV2aWNlIHN1
cHBvcnRzIHNlY3VyZSBkaXNjYXJkLg0KPiAgICAqKDExKSBPbmx5IHVzZWQgYnkgTGludXgg
YW5kIE5ldEJTRC4NCj4gKyAqKDEyKSBQb3NzaWJseSBvbmx5IGV2ZXIgaW1wbGVtZW50ZWQg
YnkgdGhlIFFFTVUgUWRpc2sgYmFja2VuZCBhbmQgdGhlIFdpbmRvd3MNCj4gKyAqICAgICBQ
ViBibG9jayBmcm9udGVuZC4gIE90aGVyIGJhY2tlbmRzIGFuZCBmcm9udGVuZHMgc3VwcG9y
dGVkICdzZWN0b3Itc2l6ZScNCj4gKyAqICAgICB2YWx1ZXMgZ3JlYXRlciB0aGFuIDUxMiBi
ZWZvcmUgc3VjaCBmZWF0dXJlIHdhcyBhZGRlZC4gIEZyb250ZW5kcyBzaG91bGQNCj4gKyAq
ICAgICBub3QgZXhwb3NlIHRoaXMgbm9kZSwgbmVpdGhlciBzaG91bGQgYmFja2VuZHMgbWFr
ZSBhbnkgZGVjaXNpb25zIGJhc2VkDQo+ICsgKiAgICAgb24gaXQgYmVpbmcgZXhwb3NlZCBi
eSB0aGUgZnJvbnRlbmQuDQo+ICAgICovDQo+ICAgDQo+ICAgLyoNCj4gQEAgLTYxOSwxMSAr
NjI5LDE0IEBADQo+ICAgI2RlZmluZSBCTEtJRl9NQVhfSU5ESVJFQ1RfUEFHRVNfUEVSX1JF
UVVFU1QgOA0KPiAgIA0KPiAgIC8qDQo+IC0gKiBOQi4gJ2ZpcnN0X3NlY3QnIGFuZCAnbGFz
dF9zZWN0JyBpbiBibGtpZl9yZXF1ZXN0X3NlZ21lbnQsIGFzIHdlbGwgYXMNCj4gLSAqICdz
ZWN0b3JfbnVtYmVyJyBpbiBibGtpZl9yZXF1ZXN0LCBibGtpZl9yZXF1ZXN0X2Rpc2NhcmQg
YW5kDQo+IC0gKiBibGtpZl9yZXF1ZXN0X2luZGlyZWN0IGFyZSBzZWN0b3ItYmFzZWQgcXVh
bnRpdGllcy4gU2VlIHRoZSBkZXNjcmlwdGlvbg0KPiAtICogb2YgdGhlICJmZWF0dXJlLWxh
cmdlLXNlY3Rvci1zaXplIiBmcm9udGVuZCB4ZW5idXMgbm9kZSBhYm92ZSBmb3INCj4gLSAq
IG1vcmUgaW5mb3JtYXRpb24uDQo+ICsgKiBOQi4gJ2ZpcnN0X3NlY3QnIGFuZCAnbGFzdF9z
ZWN0JyBpbiBibGtpZl9yZXF1ZXN0X3NlZ21lbnQgYXJlIGFsbCBpbiB1bml0cw0KPiArICog
b2YgNTEyIGJ5dGVzLCBkZXNwaXRlIHRoZSAnc2VjdG9yLXNpemUnIHhlbnN0b3JlIG5vZGUg
cG9zc2libHkgaGF2aW5nIGENCj4gKyAqIHZhbHVlIGdyZWF0ZXIgdGhhbiA1MTIuDQo+ICsg
Kg0KPiArICogVGhlIHZhbHVlIGluICdmaXJzdF9zZWN0JyBhbmQgJ2xhc3Rfc2VjdCcgZmll
bGRzIG11c3QgYmUgc2V0dXAgc28gdGhhdCB0aGUNCj4gKyAqIHJlc3VsdGluZyBzZWdtZW50
IG9mZnNldCBhbmQgc2l6ZSBpcyBhbGlnbmVkIHRvIHRoZSBsb2dpY2FsIHNlY3RvciBzaXpl
DQo+ICsgKiByZXBvcnRlZCBieSB0aGUgJ3NlY3Rvci1zaXplJyB4ZW5zdG9yZSBub2RlLCBz
ZWUgJ0JhY2tlbmQgRGV2aWNlIFByb3BlcnRpZXMnDQo+ICsgKiBzZWN0aW9uLg0KPiAgICAq
Lw0KPiAgIHN0cnVjdCBibGtpZl9yZXF1ZXN0X3NlZ21lbnQgew0KPiAgICAgICBncmFudF9y
ZWZfdCBncmVmOyAgICAgICAgLyogcmVmZXJlbmNlIHRvIEkvTyBidWZmZXIgZnJhbWUgICAg
ICAgICovDQo+IEBAIC02MzQsNiArNjQ3LDEwIEBAIHN0cnVjdCBibGtpZl9yZXF1ZXN0X3Nl
Z21lbnQgew0KPiAgIA0KPiAgIC8qDQo+ICAgICogU3RhcnRpbmcgcmluZyBlbGVtZW50IGZv
ciBhbnkgSS9PIHJlcXVlc3QuDQo+ICsgKg0KPiArICogVGhlICdzZWN0b3JfbnVtYmVyJyBm
aWVsZCBpcyBpbiB1bml0cyBvZiA1MTJiLCBkZXNwaXRlIHRoZSB2YWx1ZSBvZiB0aGUNCj4g
KyAqICdzZWN0b3Itc2l6ZScgeGVuc3RvcmUgbm9kZS4gIE5vdGUgaG93ZXZlciB0aGF0IHRo
ZSBvZmZzZXQgaW4NCj4gKyAqICdzZWN0b3JfbnVtYmVyJyBtdXN0IGJlIGFsaWduZWQgdG8g
J3NlY3Rvci1zaXplJy4NCj4gICAgKi8NCj4gICBzdHJ1Y3QgYmxraWZfcmVxdWVzdCB7DQo+
ICAgICAgIHVpbnQ4X3QgICAgICAgIG9wZXJhdGlvbjsgICAgLyogQkxLSUZfT1BfPz8/ICAg
ICAgICAgICAgICAgICAgICAgICAgICovDQo+IEBAIC02NDgsNiArNjY1LDEwIEBAIHR5cGVk
ZWYgc3RydWN0IGJsa2lmX3JlcXVlc3QgYmxraWZfcmVxdWVzdF90Ow0KPiAgIC8qDQo+ICAg
ICogQ2FzdCB0byB0aGlzIHN0cnVjdHVyZSB3aGVuIGJsa2lmX3JlcXVlc3Qub3BlcmF0aW9u
ID09IEJMS0lGX09QX0RJU0NBUkQNCj4gICAgKiBzaXplb2Yoc3RydWN0IGJsa2lmX3JlcXVl
c3RfZGlzY2FyZCkgPD0gc2l6ZW9mKHN0cnVjdCBibGtpZl9yZXF1ZXN0KQ0KPiArICoNCj4g
KyAqIFRoZSAnc2VjdG9yX251bWJlcicgZmllbGQgaXMgaW4gdW5pdHMgb2YgNTEyYiwgZGVz
cGl0ZSB0aGUgdmFsdWUgb2YgdGhlDQo+ICsgKiAnc2VjdG9yLXNpemUnIHhlbnN0b3JlIG5v
ZGUuICBOb3RlIGhvd2V2ZXIgdGhhdCB0aGUgb2Zmc2V0IGluDQo+ICsgKiAnc2VjdG9yX251
bWJlcicgbXVzdCBiZSBhbGlnbmVkIHRvICdzZWN0b3Itc2l6ZScuDQo+ICAgICovDQo+ICAg
c3RydWN0IGJsa2lmX3JlcXVlc3RfZGlzY2FyZCB7DQo+ICAgICAgIHVpbnQ4X3QgICAgICAg
IG9wZXJhdGlvbjsgICAgLyogQkxLSUZfT1BfRElTQ0FSRCAgICAgICAgICAgICAgICAgICAg
ICovDQo+IEBAIC02NjAsNiArNjgxLDExIEBAIHN0cnVjdCBibGtpZl9yZXF1ZXN0X2Rpc2Nh
cmQgew0KPiAgIH07DQo+ICAgdHlwZWRlZiBzdHJ1Y3QgYmxraWZfcmVxdWVzdF9kaXNjYXJk
IGJsa2lmX3JlcXVlc3RfZGlzY2FyZF90Ow0KPiAgIA0KPiArLyoNCj4gKyAqIFRoZSAnc2Vj
dG9yX251bWJlcicgZmllbGQgaXMgaW4gdW5pdHMgb2YgNTEyYiwgZGVzcGl0ZSB0aGUgdmFs
dWUgb2YgdGhlDQo+ICsgKiAnc2VjdG9yLXNpemUnIHhlbnN0b3JlIG5vZGUuICBOb3RlIGhv
d2V2ZXIgdGhhdCB0aGUgb2Zmc2V0IGluDQo+ICsgKiAnc2VjdG9yX251bWJlcicgbXVzdCBi
ZSBhbGlnbmVkIHRvICdzZWN0b3Itc2l6ZScuDQo+ICsgKi8NCj4gICBzdHJ1Y3QgYmxraWZf
cmVxdWVzdF9pbmRpcmVjdCB7DQo+ICAgICAgIHVpbnQ4X3QgICAgICAgIG9wZXJhdGlvbjsg
ICAgLyogQkxLSUZfT1BfSU5ESVJFQ1QgICAgICAgICAgICAgICAgICAgICovDQo+ICAgICAg
IHVpbnQ4X3QgICAgICAgIGluZGlyZWN0X29wOyAgLyogQkxLSUZfT1Bfe1JFQUQvV1JJVEV9
ICAgICAgICAgICAgICAgICovDQoNCkp1ZXJnZW4NCg==
--------------GF7uH0w6fzwTlc469eOhQQLT
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------GF7uH0w6fzwTlc469eOhQQLT--

--------------VkN5E0ZNtQrcXdPWew7Em3Ma--

--------------DJO2nqQo6p4VUW7XmaJ70xJq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmbgTZgFAwAAAAAACgkQsN6d1ii/Ey8s
kwf+OMJhTg+ujqEf5QJ4p7O9kfrNty4P5uXRZfAvCYyyced66erzt5vlpg8qnRczcRxf9MFeHNJ+
NZlidBA7OkY2ttlxLwWvYxrI9+cLY736i86AkGzJxNG9iwEjml05k6Rd8cuvQbVyXQZVJAsU6kHr
Mzy25WzRIkq7BqAZzyFuC0e6FtL/vanPa7PHlv9RJwu9n8PdVsymSP/rDJwlALPc2RWBSgn0xn5H
7vYd/q7v8jWqp85KSM7Ope0m6MAxJocg/QaJK1Sqa0g+O17PqC+/D2N9WOJFVox9eAplbz+AFHf2
nkXrKJ/kJtnsVfQnDPEEmQGMwtG9VzCdaQ4DiJ4E8g==
=RylN
-----END PGP SIGNATURE-----

--------------DJO2nqQo6p4VUW7XmaJ70xJq--

