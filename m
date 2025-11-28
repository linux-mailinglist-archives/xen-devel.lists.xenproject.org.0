Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C659C9266A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 16:06:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174927.1499863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP02R-0003P1-83; Fri, 28 Nov 2025 15:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174927.1499863; Fri, 28 Nov 2025 15:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP02R-0003NZ-5S; Fri, 28 Nov 2025 15:05:35 +0000
Received: by outflank-mailman (input) for mailman id 1174927;
 Fri, 28 Nov 2025 15:05:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSNm=6E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vP02P-0003L0-LP
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 15:05:33 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab6df14c-cc6b-11f0-9d18-b5c5bf9af7f9;
 Fri, 28 Nov 2025 16:05:26 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-640b0639dabso3474457a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 07:05:25 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64751035c24sm4520620a12.22.2025.11.28.07.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Nov 2025 07:05:24 -0800 (PST)
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
X-Inumbo-ID: ab6df14c-cc6b-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764342325; x=1764947125; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=or8bH4z/O8dNofoRT/BdQGiClqQlWZSi6LpV9Mbd3vU=;
        b=aZmutXc0XZRy2i3LDkFTWRt5QjycS6Z31lStcaeNzU3G9oT4JENI2qGX/w3PtI687n
         6+KFuglCCRtk8pC+vbE/uTAupQaMAtBDA2ltxpYcNYrYjqhOA8JaFDr/RDzyJgpIfw7c
         DI4TpXTEHUAHRhPXqw6t0oggpXxqXtCiYlYWfnQh8qi+tsjAFhM/R5JgVANyHt/GtKxR
         8OZpK2BZqmKRQNmV5DjG9lBEkfPZQcOeGr3j7/FKanUhFiP/AQOupWOvyheXUS0qY5lg
         Pre5PycgThiHjgv02/2KNN0eEwBpbMIKSE7+7m2YTzpyUvR/AnzJkYe2Y44CjcmjCrld
         Unhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764342325; x=1764947125;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=or8bH4z/O8dNofoRT/BdQGiClqQlWZSi6LpV9Mbd3vU=;
        b=WVnHAsYBv8Z86GM2BoU6U54UodAyDE8cNEn44FOUUGh55ZJ+HvYY/S1fPMm1fmaJOq
         qPtmm4aWQiUCourC060M4m485oNYt+9dlgfuKBWGDIB5zF032wyoauKhOw4lUNW4JbBf
         HyOc5tZVVBFY5cALlVOExht1v8mX8UFLxvkABaT088zL5CWnUgvC8caoSL7U6y4TrYDb
         q51tuUf1xBjjeF823lFtrplWEETmvWhEniR3pzdELN79pPg237+TYOmTgcBmap118uRY
         pfbieRlm0ghlkWzBr25cF2ARQDopQybuAas/b7/rhUnHD0rhtPmGF7f6i9epYRBxmkN7
         oRPw==
X-Forwarded-Encrypted: i=1; AJvYcCXRMqVLW9uTmi6r+C7e2L9e4YESdLecPi84AKzWzKDSO0tvCQ1xjpTPwm6XlvJiNeDuvWzy3ke/Xjw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzb15H0hvQFFhCT0juGaVVneg/0sDfSPnMOAoo4b/IgvtNmn8U9
	fIJJqTLIAOVpNOaPpMkJJpbNRwCtjAosrEeor1Q7lefkp2pjqOYYTTBjKSppzwwYDks=
X-Gm-Gg: ASbGncvwLmzAxf0dPR9/ynSLkNx0v947oWR0HNcpeC79G/M2fok1fE3FRyGE3/K+dph
	813uRkRYbkP4P1jwIg2olICIA8ZLevKak3uA2MKypVFpL07yyUKmAqqA63uTtLLRsSSpVFui4e+
	FmUHKycSdks/3+/XXaudH8a8ypaiGnkz0LFvlaHvpWmwmyM3Ufk0fADc2YWq64CpWuP+v9jRyYm
	nxFyxJH0OpNhuZ3ZUVEagsNhW6Br/VjkwnxQ2vuDn0K4RHRr3t+RwaRPJ1hwyyU3N9eW3Wiwnz/
	obq+N/RqUSrNufjSMWSf5AtxUxeiw76ZUEwiD/MzK3aTIzYCWTsmkr4JfytdpJOhMuk9fh5N1H4
	4xxg9zJuNKbmRXw6sFVuGTJh97Kr7YN3cE7TizpF7aV8KL+sc8eJl1u4rCBvR2cWPS6jl2Vp/4N
	0JAIpkwgmuSe9pCfoAsQEUae92lru0iEJsuyxG5DTinx/8kjujFT6Mo8t2QzhmR6VdgMynOPKrx
	GnaThhtlJqWO+vsX/Y44zutIWK1RmF+jWNdWCg=
X-Google-Smtp-Source: AGHT+IHpHy/0PbaMNl12i7vPGrJCmWCpFLD8taURs6IJEvezk3HrdIl+22juqNkJBfG7DGOMBFAZaQ==
X-Received: by 2002:a05:6402:4405:b0:640:bce5:77a9 with SMTP id 4fb4d7f45d1cf-6455469cf36mr26068018a12.32.1764342325062;
        Fri, 28 Nov 2025 07:05:25 -0800 (PST)
Message-ID: <72af5838-ed6b-4549-a366-32aa0d5b3d34@suse.com>
Date: Fri, 28 Nov 2025 16:05:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH] x86: have .note.Xen segment contents before other
 .note.* ones
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20251128133807.9206-1-jgross@suse.com>
 <96c71c8b-21de-42d9-afc9-280e651a29dc@suse.com>
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
In-Reply-To: <96c71c8b-21de-42d9-afc9-280e651a29dc@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rwVqTJBxFDIT15mm0Ph1vodr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rwVqTJBxFDIT15mm0Ph1vodr
Content-Type: multipart/mixed; boundary="------------TCALS8Ozs0s4dKhTvE2RqyCZ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Message-ID: <72af5838-ed6b-4549-a366-32aa0d5b3d34@suse.com>
Subject: Re: [MINI-OS PATCH] x86: have .note.Xen segment contents before other
 .note.* ones
References: <20251128133807.9206-1-jgross@suse.com>
 <96c71c8b-21de-42d9-afc9-280e651a29dc@suse.com>
In-Reply-To: <96c71c8b-21de-42d9-afc9-280e651a29dc@suse.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------TCALS8Ozs0s4dKhTvE2RqyCZ
Content-Type: multipart/mixed; boundary="------------FO0yOVvCOAExGitp5zca0yIJ"

--------------FO0yOVvCOAExGitp5zca0yIJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMTEuMjUgMTU6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOC4xMS4yMDI1
IDE0OjM4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVG9kYXkgdGhlIGxpbmtlciBzY3Jp
cHQgb2YgTWluaS1PUyBzcGVjaWZpZXMgdG8gbWVyZ2UgYWxsIC5ub3RlKg0KPj4gc2VjdGlv
bnMgaW50byBhIHNpbmdsZSBzZWN0aW9uIC5ub3RlOg0KPj4NCj4+ICAgLm5vdGUgOiB7DQo+
PiAgICAgICAgICAgICooLm5vdGUpDQo+PiAgICAgICAgICAgICooLm5vdGUuKikNCj4+ICAg
IH0NCj4+DQo+PiBJdCBzZWVtcyBhcyBpZiBsZCB3aWxsIHVzZSB0aGUgYXR0cmlidXRlcyBv
ZiB0aGUgZmlyc3QgLm5vdGUqIHNlZ21lbnQNCj4+IGZvdW5kIGR1cmluZyB0aGUgbGlua2lu
ZyBwcm9jZXNzIGZvciB0aGUgZmluYWwgLm5vdGUgc2VnbWVudC4NCj4+DQo+PiBTb21ld2hl
cmUgYmV0d2VlbiBiaW51dGlscyAyLjQzIGFuZCAyLjQ1IHNvbWV0aGluZyBjaGFuZ2VkIHJl
c3VsdGluZyBpbg0KPj4gLm5vdGUuR05VLXN0YWNrIGJlaW5nIHRoZSBmaXJzdCAubm90ZSog
c2VnbWVudCBmb3VuZC4gVW5mb3J0dW5hdGVseQ0KPj4gdGhpcyBzZWdtZW50IGhhcyB1bnVz
dWFsIGF0dHJpYnV0ZXM6IGl0IGhhcyBQUk9HQklUUyBpbnN0ZWFkIG9mIE5PVEUgYXMNCj4+
IHR5cGUsIHJlc3VsdGluZyBpbiB0aGUgWGVuIEVMRiBwYXJzaW5nIHRvIG5vIGxvbmdlciBs
b29rIGludG8gaXQgZm9yDQo+PiBmaW5kaW5nIHRoZSBYZW4gRUxGLW5vdGVzLiBUaGlzIGlu
IHR1cm4gd2lsbCByZXN1bHQgaW4gZmFpbHVyZSB3aGlsZQ0KPj4gdHJ5aW5nIHRvIHBhcnNl
IHRoZSBiaW5hcnksIHdoaWNoIHdpbGwgbGV0IGRvbWFpbiBjcmVhdGlvbiBmYWlsLg0KPj4N
Cj4+IEluIG9yZGVyIHRvIGF2b2lkIHRoaXMgaXNzdWUsIGVuaGFuY2UgdGhlIGxpbmtlciBz
Y3JpcHQgdG8gbWVyZ2UNCj4+IC5ub3RlLlhlbiBiZWZvcmUgb3RoZXIgLm5vdGUuKiBzZWdt
ZW50cywgcmVzdWx0aW5nIGluIHRoZSBmaW5hbCAubm90ZQ0KPj4gc2VnbWVudCB0byBzdGls
bCBoYXZlIHRoZSBOT1RFIHR5cGUuDQo+Pg0KPj4gRml4ZXM6IDZkMWNjODFkMDQ5ZiAoIng4
Njogc3dpdGNoIHRvIHVzZSBlbGZub3RlIikNCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQo+IA0KPiBJIHdvbmRlciB0aG91Z2ggLi4uDQo+IA0K
Pj4gLS0tIGEvYXJjaC94ODYvbWluaW9zLXg4Ni5sZHMuUw0KPj4gKysrIGIvYXJjaC94ODYv
bWluaW9zLXg4Ni5sZHMuUw0KPj4gQEAgLTMzLDYgKzMzLDcgQEAgU0VDVElPTlMNCj4+ICAg
DQo+PiAgICAgICAgICAgLm5vdGUgOiB7DQo+PiAgICAgICAgICAgICAgICAgICAqKC5ub3Rl
KQ0KPj4gKyAgICAgICAgICAgICAgICAqKC5ub3RlLlhlbikNCj4+ICAgICAgICAgICAgICAg
ICAgICooLm5vdGUuKikNCj4+ICAgICAgICAgICB9DQo+IA0KPiAuLi4gd2hhdCB1c2UgLm5v
dGUgaGVyZSBpcy4gQ2FuJ3QgaXQgYmUgZHJvcHBlZCBpbiBleGNoYW5nZT8NCg0KRHJvcHBp
bmcgaXQgc2VlbXMgbm90IHRvIGhhdmUgYW55IG5lZ2F0aXZlIGltcGFjdC4NCg0KSW4gdGhl
b3J5IHRoaXMgc2hvdWxkIG5vdCBiZSBpbiB0aGF0IHBhdGNoLCB0aG91Z2gsIGFzIGl0cyBw
cmVzZW5jZSB3YXMNCnF1ZXN0aW9uYWJsZSBldmVuIHdpdGhvdXQgbXkgcGF0Y2guDQoNCg0K
SnVlcmdlbg0K
--------------FO0yOVvCOAExGitp5zca0yIJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------FO0yOVvCOAExGitp5zca0yIJ--

--------------TCALS8Ozs0s4dKhTvE2RqyCZ--

--------------rwVqTJBxFDIT15mm0Ph1vodr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkpujMFAwAAAAAACgkQsN6d1ii/Ey/G
Gwf/UtWvI+oYU1MQch6HO2Sc1mxaHok7Iok4Djpx3+J0Vg7Co0V6iY5dzsQpijpkDq6IWXeBhfEL
y90Few2gGeyjmaEc3e7tFW2+5m7lk05rF6JYJTEts8v4VkfT0vae/SNuHodz7BNB95BV3o+SsAXD
IJyci92mMc/wEAPAmF1y84/6DsmQ8H3zsgn3+v4rhMISzqJNtki+xtnEimtfuHTF1CUw8ZDp/Trd
J3d89ocqOhURDmn4NDQ9XncQhJ3H3VfB52Nm+ICt3jHPM6Ijev7vbPcTDy/PXEJ1SKC1Eey8/one
Or2qTHR9/ttCPPTq+C+OW6lKxKPpbraE18K3gkLkDg==
=iEnZ
-----END PGP SIGNATURE-----

--------------rwVqTJBxFDIT15mm0Ph1vodr--

