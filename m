Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 393B0B02063
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 17:28:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041011.1412198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaFfO-0003PW-E6; Fri, 11 Jul 2025 15:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041011.1412198; Fri, 11 Jul 2025 15:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaFfO-0003No-Aa; Fri, 11 Jul 2025 15:28:02 +0000
Received: by outflank-mailman (input) for mailman id 1041011;
 Fri, 11 Jul 2025 15:28:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7n+=ZY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uaFfN-0003Ni-03
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 15:28:01 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f923803-5e6b-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 17:27:58 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso2244569f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jul 2025 08:27:58 -0700 (PDT)
Received: from ?IPV6:2003:e5:8709:f00:6357:915b:11f9:6d20?
 (p200300e587090f006357915b11f96d20.dip0.t-ipconnect.de.
 [2003:e5:8709:f00:6357:915b:11f9:6d20])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1776sm4812651f8f.12.2025.07.11.08.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 08:27:56 -0700 (PDT)
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
X-Inumbo-ID: 9f923803-5e6b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752247677; x=1752852477; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FGIUYVM2lM4QfpfqPGXD+4K63/6WCEB5v7Jb6J9s8wI=;
        b=adLIlwB17cGq6tXHw6kZk9rPYzc8ECJPXR8l5CVOw57fZs0wxc8aAeOdWdGdxaaS/y
         tFg8yBP85s35Ou7OU0empgoDzYsba6lZSNg336w5KFPFB5Zveq8C9Aryk7IbnOfNED4Z
         0lqY3HyfBM9q/fg81DAMFXnHP43mDGcZfB1UxuAafLB4RpSu83bZ7yIVo2y9gEotPWqb
         tjUuQq/hkPQEjaYHFNVz95I91aAQeUL2N/5jJ+ZqaH9ZX2TBbyyc+DIcD+xP+CB8YK2R
         hyCcni/Zgy5De4PXggByfK6VllTLls9yN4+62AHtxHm7j6L0lWAD92dV3yqC7mYyP23/
         It9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752247677; x=1752852477;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FGIUYVM2lM4QfpfqPGXD+4K63/6WCEB5v7Jb6J9s8wI=;
        b=pXYGzBM32t1/NO+HcrVSrM/2gj+gD4fei+y2HtIcOrkQC7XvfcseVPGewzA3CSvN5T
         1u7fQdVNwaUpY0OquCOFKT7a1UvFWGNB3nA3XvrD17srEmieiMfACC0IJtK9ZxBy6FER
         Pkf7Hsv5EbVf9pirb1QH/wV1NF9Vn0n+0sY2MwGulQr2o/ji3uIEmwh09RPpYJPQKVvO
         qTRvYIGZMrl3ZTdZ8OoctDuFIxXmsJeWaHGb5FzZ5jyHAf1VROT1uPceXHD65y2JWYPO
         BtuCYO+hpEYSJmGWUl6Xt0mwY60w8V2OWir2OP1pfCPCGeeqv37IrIKzfJB0exd68QNX
         E35Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeVE2M1hhg8la9wB6UU6oQktRWqiPjVAxpERXloqjNF17Zpm0u3hM0BskElwNetFbZNqyuVWRSXE0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxlb//TgiWa/HNJiRmmMhf+ed0/oLjQsYigJcL6TgKlAMxJeoTK
	3PMGid0fByWZ3qWDg483GUgSYlHSIBwu0oTZqcWD74PsoB2gnroUczLxWSApaC3CUrg=
X-Gm-Gg: ASbGncscFzqCUsZGhWifQml572F9EXBWzRbYlJho9mqP0pGUGyi6Fhu29RPRzsIw/hH
	D+JJw+fR6snZouZcX2DUemGLzSXJu8u+T3hT8tNR5BLO9nNmVXMKODFVbCCT0jzeSV7BKpUh5xU
	cL90zlU9Ark1CyLhgABU2VBjM4yJCMvILcB0tz1iYuiO2TzLxZZEIw0EnK+qqUnV7Z+cNLjOpd2
	HcB/+rg6U2LWWwcBNmVoB1ANVC5x5O/pPfvdyXGnJ9WqoR2sJJARBjhv1bWaaQLvH9F6h6fV43U
	mplzuvIKxqoAoJR5QEaaDwQqASj7MvfmBMAYBUnquPnz+SgMu3flaUUc3mRaSkoYyUK3R+wcRRp
	yVl7Q+UFftsgukh3/le3B2GQCJF7ya2gKDJBgxA+DqH2NqAAJOMsCxsSA51QiXMFYWY8iYgbXfm
	N74xb4mTD8hTIJ7pwsP0fPZf5+50qNXtaFonrm32gp/QFa
X-Google-Smtp-Source: AGHT+IEEtNgzujv3njsPpsmHirT/Vpy9KrChnurzSDeC72uXfcRV1W04L+LjWpST62EtVAAUUoEBPw==
X-Received: by 2002:a5d:588f:0:b0:3a5:2ef8:34f9 with SMTP id ffacd0b85a97d-3b5f188ea1fmr3807069f8f.27.1752247677359;
        Fri, 11 Jul 2025 08:27:57 -0700 (PDT)
Message-ID: <e0005562-0235-4552-8a6f-474fe9ac4e56@suse.com>
Date: Fri, 11 Jul 2025 17:27:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/netfront: Fix TX response spurious interrupts
To: Teddy Astie <teddy.astie@vates.tech>,
 Anthoine Bourgeois <anthoine.bourgeois@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>
 <6a6b8f95-0407-43ac-925f-d6e8e312a631@vates.tech>
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
In-Reply-To: <6a6b8f95-0407-43ac-925f-d6e8e312a631@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UU2J0NhZCBy1rzxup8AwtyPJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UU2J0NhZCBy1rzxup8AwtyPJ
Content-Type: multipart/mixed; boundary="------------1I4PcuxuRQ8Ki0Bt600vfbif";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Teddy Astie <teddy.astie@vates.tech>,
 Anthoine Bourgeois <anthoine.bourgeois@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <e0005562-0235-4552-8a6f-474fe9ac4e56@suse.com>
Subject: Re: [PATCH] xen/netfront: Fix TX response spurious interrupts
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>
 <6a6b8f95-0407-43ac-925f-d6e8e312a631@vates.tech>
In-Reply-To: <6a6b8f95-0407-43ac-925f-d6e8e312a631@vates.tech>

--------------1I4PcuxuRQ8Ki0Bt600vfbif
Content-Type: multipart/mixed; boundary="------------lBSjsM43rmjUDFGWQijKaU0f"

--------------lBSjsM43rmjUDFGWQijKaU0f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDcuMjUgMTE6MjksIFRlZGR5IEFzdGllIHdyb3RlOg0KPiBZb3UgYWxzbyBwcm9i
YWJseSB3YW50IHRvIHNlbmQgdGhpcyB0byBsaW51eCBrZXJuZWwgbWFpbGluZyBsaXN0IHRv
by4NCj4gDQo+IExlIDEwLzA3LzIwMjUgw6AgMTg6MTQsIEFudGhvaW5lIEJvdXJnZW9pcyBh
IMOpY3JpdMKgOg0KPj4gV2UgZm91bmQgYXQgVmF0ZXMgdGhhdCB0aGVyZSBhcmUgbG90IG9m
IHNwdXJpb3VzIGludGVycnVwdHMgd2hlbg0KPj4gYmVuY2htYXJraW5nIHRoZSBQViBkcml2
ZXJzIG9mIFhlbi4gVGhpcyBpc3N1ZSBhcHBlYXJlZCB3aXRoIGEgcGF0Y2gNCj4+IHRoYXQg
YWRkcmVzc2VzIHNlY3VyaXR5IGlzc3VlIFhTQS0zOTEgKHNlZSBGaXhlcyBiZWxvdykuIE9u
IGFuIGlwZXJmDQo+PiBiZW5jaG1hcmssIHNwdXJpb3VzIGludGVycnVwdHMgY2FuIHJlcHJl
c2VudCB1cCB0byA1MCUgb2YgdGhlDQo+PiBpbnRlcnJ1cHRzLg0KPj4NCj4+IFNwdXJpb3Vz
IGludGVycnVwdHMgYXJlIGludGVycnVwdHMgdGhhdCBhcmUgcmlzZWQgZm9yIG5vdGhpbmcs
IHRoZXJlIGlzDQo+PiBubyB3b3JrIHRvIGRvLiBUaGlzIGFwcGVuZHMgYmVjYXVzZSB0aGUg
ZnVuY3Rpb24gdGhhdCBoYW5kbGVzIHRoZQ0KPj4gaW50ZXJydXB0cyAoInhlbm5ldF90eF9i
dWZfZ2MiKSBpcyBhbHNvIGNhbGxlZCBhdCB0aGUgZW5kIG9mIHRoZSByZXF1ZXN0DQo+PiBw
YXRoIHRvIGdhcmJhZ2UgY29sbGVjdCB0aGUgcmVzcG9uc2VzIHJlY2VpdmVkIGR1cmluZyB0
aGUgdHJhbnNtaXNzaW9uDQo+PiBsb2FkLg0KPj4NCj4+IFRoZSByZXF1ZXN0IHBhdGggaXMg
ZG9pbmcgdGhlIHdvcmsgdGhhdCB0aGUgaW50ZXJydXB0IGhhbmRsZXIgc2hvdWxkDQo+PiBo
YXZlIGRvbmUgb3RoZXJ3aXNlLiBUaGlzIGlzIHBhcnRpY3VyYXJ5IHRydWUgd2hlbiB0aGVy
ZSBpcyBtb3JlIHRoYW4NCj4+IG9uZSB2Y3B1IGFuZCBnZXQgd29yc2UgbGluZWFybHkgd2l0
aCB0aGUgbnVtYmVyIG9mIHZjcHUvcXVldWUuDQo+Pg0KPj4gTW9yZW92ZXIsIHRoaXMgcHJv
YmxlbSBpcyBhbXBsaWZ5ZWQgYnkgdGhlIHBlbmFsdHkgaW1wb3NlZCBieSBhIHNwdXJpb3Vz
DQo+PiBpbnRlcnJ1cHQuIFdoZW4gYW4gaW50ZXJydXB0IGlzIGZvdW5kIHNwdXJpb3VzIHRo
ZSBpbnRlcnJ1cHQgY2hpcCB3aWxsDQo+PiBkZWxheSB0aGUgRU9JIHRvIHNsb3dkb3duIHRo
ZSBiYWNrZW5kLiBUaGlzIGRlbGF5IHdpbGwgYWxsb3cgbW9yZQ0KPj4gcmVzcG9uc2VzIHRv
IGJlIGhhbmRsZWQgYnkgdGhlIHJlcXVlc3QgcGF0aCBhbmQgdGhlbiB0aGVyZSB3aWxsIGJl
IG1vcmUNCj4+IGNoYW5jZSB0aGUgbmV4dCBpbnRlcnJ1cHQgd2lsbCBub3QgZmluZCBhbnkg
d29yayB0byBkbywgY3JlYXRpbmcgYSBuZXcNCj4+IHNwdXJpb3VzIGludGVycnVwdC4NCj4+
DQo+PiBUaGlzIGNhdXNlcyBwZXJmb3JtYW5jZSBpc3N1ZS4gVGhlIHNvbHV0aW9uIGhlcmUg
aXMgdG8gcmVtb3ZlIHRoZSBjYWxscw0KPj4gZnJvbSB0aGUgcmVxdWVzdCBwYXRoIGFuZCBs
ZXQgdGhlIGludGVycnVwdCBoYW5kbGVyIGRvIHRoZSBwcm9jZXNzaW5nIG9mDQo+PiB0aGUg
cmVzcG9uc2VzLiBUaGlzIGFwcHJvY2ggcmVtb3ZlcyBzcHVyaW91cyBpbnRlcnJ1cHRzICg8
MC4wNSUpIGFuZA0KPj4gYWxzbyBoYXMgdGhlIGJlbmVmaXQgb2YgZnJlZWluZyB1cCBjeWNs
ZXMgaW4gdGhlIHJlcXVlc3QgcGF0aCwgYWxsb3dpbmcNCj4+IGl0IHRvIHByb2Nlc3MgbW9y
ZSB3b3JrLCB3aGljaCBpbXByb3ZlcyBwZXJmb3JtYW5jZSBjb21wYXJlZCB0byBtYXNraW5n
DQo+PiB0aGUgc3B1cmlvdXMgaW50ZXJydXB0IG9uZSB3YXkgb3IgYW5vdGhlci4NCj4+DQo+
PiBTb21lIHZpZiB0aHJvdWdocHV0IHBlcmZvcm1hbmNlIGZpZ3VyZXMgZnJvbSBhIDggdkNQ
VXMsIDRHQiBvZiBSQU0gSFZNDQo+PiBndWVzdChzKToNCj4+DQo+PiBXaXRob3V0IHRoaXMg
cGF0Y2ggb24gdGhlIDoNCj4+IHZtIC0+IGRvbTA6IDQuNUdiL3MNCj4+IHZtIC0+IHZtOiAg
IDcuMEdiL3MNCj4+DQo+PiBXaXRob3V0IFhTQS0zOTEgcGF0Y2ggKHJldmVydCBvZiBiMjdk
NDc5NTBlNDgpOg0KPj4gdm0gLT4gZG9tMDogOC4zR2Ivcw0KPj4gdm0gLT4gdm06ICAgOC43
R2Ivcw0KPj4NCj4+IFdpdGggWFNBLTM5MSBhbmQgdGhpcyBwYXRjaDoNCj4+IHZtIC0+IGRv
bTA6IDExLjVHYi9zDQo+PiB2bSAtPiB2bTogICAxMi42R2Ivcw0KPj4NCj4+IEZpeGVzOiBi
MjdkNDc5NTBlNDggKCJ4ZW4vbmV0ZnJvbnQ6IGhhcmRlbiBuZXRmcm9udCBhZ2FpbnN0IGV2
ZW50IGNoYW5uZWwgc3Rvcm1zIikNCj4+IFNpZ25lZC1vZmYtYnk6IEFudGhvaW5lIEJvdXJn
ZW9pcyA8YW50aG9pbmUuYm91cmdlb2lzQHZhdGVzLnRlY2g+DQo+PiAtLS0NCj4+ICAgIGRy
aXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jIHwgNSAtLS0tLQ0KPj4gICAgMSBmaWxlIGNoYW5n
ZWQsIDUgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hl
bi1uZXRmcm9udC5jIGIvZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMNCj4+IGluZGV4IDli
YWM1MDk2MzQ3Ny4uYTExYTBlOTQ5NDAwIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9uZXQv
eGVuLW5ldGZyb250LmMNCj4+ICsrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jDQo+
PiBAQCAtNjM4LDggKzYzOCw2IEBAIHN0YXRpYyBpbnQgeGVubmV0X3hkcF94bWl0X29uZShz
dHJ1Y3QgbmV0X2RldmljZSAqZGV2LA0KPj4gICAgCXR4X3N0YXRzLT5wYWNrZXRzKys7DQo+
PiAgICAJdTY0X3N0YXRzX3VwZGF0ZV9lbmQoJnR4X3N0YXRzLT5zeW5jcCk7DQo+PiAgICAN
Cj4+IC0JeGVubmV0X3R4X2J1Zl9nYyhxdWV1ZSk7DQo+PiAtDQo+PiAgICAJcmV0dXJuIDA7
DQo+PiAgICB9DQo+PiAgICANCj4+IEBAIC04NDksOSArODQ3LDYgQEAgc3RhdGljIG5ldGRl
dl90eF90IHhlbm5ldF9zdGFydF94bWl0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBu
ZXRfZGV2aWNlICpkZXYNCj4+ICAgIAl0eF9zdGF0cy0+cGFja2V0cysrOw0KPj4gICAgCXU2
NF9zdGF0c191cGRhdGVfZW5kKCZ0eF9zdGF0cy0+c3luY3ApOw0KPj4gICAgDQo+PiAtCS8q
IE5vdGU6IEl0IGlzIG5vdCBzYWZlIHRvIGFjY2VzcyBza2IgYWZ0ZXIgeGVubmV0X3R4X2J1
Zl9nYygpISAqLw0KPj4gLQl4ZW5uZXRfdHhfYnVmX2djKHF1ZXVlKTsNCj4+IC0NCj4+ICAg
IAlpZiAoIW5ldGZyb250X3R4X3Nsb3RfYXZhaWxhYmxlKHF1ZXVlKSkNCj4+ICAgIAkJbmV0
aWZfdHhfc3RvcF9xdWV1ZShuZXRkZXZfZ2V0X3R4X3F1ZXVlKGRldiwgcXVldWUtPmlkKSk7
DQo+PiAgICANCj4gDQo+IElzIHRoZXJlIGEgcmlzayBvZiBoYXZpbmcgYSBjb25kaXRpb24g
d2hlcmUgdGhlIHJpbmcgaXMgZnVsbCBhbmQgdGhlDQo+IGV2ZW50IGNoYW5uZWwgaXMgbm90
IHVwICh3aGljaCB3b3VsZCBjYXVzZSB0aGUgaW50ZXJydXB0IHRvIG5ldmVyIGJlDQo+IGNh
bGxlZCwgYW5kIG5vIG1lc3NhZ2UgdG8gYmUgcmVjZWl2ZWQgYWdhaW4pID8NCg0KVGhhdCB3
b3VsZCBiZSBhIGJhY2tlbmQgYnVnLg0KDQoNCkp1ZXJnZW4NCg==
--------------lBSjsM43rmjUDFGWQijKaU0f
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------lBSjsM43rmjUDFGWQijKaU0f--

--------------1I4PcuxuRQ8Ki0Bt600vfbif--

--------------UU2J0NhZCBy1rzxup8AwtyPJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhxLXwFAwAAAAAACgkQsN6d1ii/Ey8Y
nwf/dNmxgoHV7Em/pgW5P0+j1XcIZq9qAvCHO28xZK+D6S9COs0FR16s6QdbvpeXT28qkzOwx8yn
pHrBM/hsbFvkgFvFGqbo0o+VCGS7h8sTi7hmKh3I/j0PvofDCfT8OgWxrbjaTEHcNF8ZplPc6a11
qqpglLIy/yUqKPIrvFtd7Vn0HYo1Kz3O+T0bvKb9Kr17k0aPViDINzmzT/AnROvqkeKLc7B+vyb9
vuA+YCniRUJEeAgmhtEo8YKd4XvhWEZuX0qeaW7i0J2BOFqqLoJ9cR9hhn3AUb7NE7kef1gMB99Y
JYBqzHcuELL4j7rImS1z3ebfoLjCNVUeIzPVonSUSQ==
=i2Ai
-----END PGP SIGNATURE-----

--------------UU2J0NhZCBy1rzxup8AwtyPJ--

