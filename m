Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21DC9968FB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 13:38:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814404.1227967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syV1Z-0002m5-DN; Wed, 09 Oct 2024 11:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814404.1227967; Wed, 09 Oct 2024 11:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syV1Z-0002jE-Ah; Wed, 09 Oct 2024 11:38:37 +0000
Received: by outflank-mailman (input) for mailman id 814404;
 Wed, 09 Oct 2024 11:38:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEV=RF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1syV1Y-0002gM-NF
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 11:38:36 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04499f3b-8633-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 13:38:34 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42e5e758093so59593995e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 04:38:34 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d3b5f88b2sm1256135f8f.59.2024.10.09.04.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 04:38:33 -0700 (PDT)
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
X-Inumbo-ID: 04499f3b-8633-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728473914; x=1729078714; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G4VPx/JKa4vgWGeJYSYnFXy2EubNDMVjaRjmRDulg3g=;
        b=A15zGFTE1TpGimojV/JQXixRTMXz2F9qyBNdJfOTJImnN+mVdo1osSkhnIREAOBbVl
         tI4i/n2AJBtptT5rxfgNw9z2iRAZgg72YLNnHPPnVmju246RTqxB5TL8xSOldiFVvWBx
         EAwYeb7dosg5os26FgbO3orb66CZ7Wz9uqYaVIjxxqUz5NsrMmiJEyM7lmPxb9b/xiz7
         SET5lnLQZFvVgzbrqTF9BYqt+8UFqitnS3KPgoDmo7yMwCBO0PA4Ky/i+++T/2nfUuNL
         9bCHHXub3GsHmPwehN8RcK+1hmwu4cSwsaO+MtyEv89xd/iGd7XaD9Y1ZvMsewMc1r3m
         NKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728473914; x=1729078714;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G4VPx/JKa4vgWGeJYSYnFXy2EubNDMVjaRjmRDulg3g=;
        b=F26imEMzYhdnS5ohHZaHFJNNr2EB3VMC+hC3Bs2nTlju3tv6DGENQLp+Fo1FImVogN
         bj42ZEoS1jpyXwVxsrrm3WgmiuvLOlDFEwHN2Kw1s6QoOGGPn2Gyy9HekiStvdn1QGWF
         mLKaSa71hvtDXwkjUEMIZAoJpAjmLABdY9cUpOfIHjV8qSjp1TgN14La8J70buYbwjZA
         W2faGg/bdnlzcipOnr1JBMWddsOM/1BRaGjfFNtFHi8cdrR98q82k+eZ6YSd11qHNEai
         RIh8IoEJZ8fuK83YLfptJ5CWfstmVRD9s8o6f+gkH4Floaox68q2EK+wKNHe+IVEDbtX
         U7FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUifdJVKxVMTlccRU+iHYW+eiuw9BehNTN8G5d4quDXMmHw2wYNq0+Z3Tv1QfWqSc9B1pUC58qw2KQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaHL2SyNPDajs/dZ/ZCWlRdaIftDJgNbEWyrWPk/9OQaMoToFw
	J4geBJPIIq74QdaQWinFzMum4MLOdh55WaUZd7j3RriyqmgMUg099yXJn+qIyEk=
X-Google-Smtp-Source: AGHT+IFzoogDJD3F85pcVJ9V4wjwncLAqRUjHucbPscl6RgLxWX/qzMcRoZbx8GniGA7kfyOCeg5yQ==
X-Received: by 2002:a05:600c:3b87:b0:42f:823d:dddd with SMTP id 5b1f17b1804b1-430d59b7ac8mr13011325e9.27.1728473913911;
        Wed, 09 Oct 2024 04:38:33 -0700 (PDT)
Message-ID: <e7ebec95-e6f0-491f-8fb4-afe7ee505b07@suse.com>
Date: Wed, 9 Oct 2024 13:38:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xg: increase LZMA_BLOCK_SIZE for uncompressing the
 kernel
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241008213225.728922-1-marmarek@invisiblethingslab.com>
 <226bc9b3-6741-4cb6-917b-1164e340a19d@suse.com> <ZwZScGr75xEolDnS@mail-itl>
 <00ac0665-e4ff-4a56-8537-e81573710c3c@suse.com>
 <e3917457-08d4-4f0c-9e0c-1519952ceed9@suse.com>
 <dde4b510-5674-44d0-9493-a0717387b8d6@citrix.com>
 <99089b03-e9f0-4fe8-94b2-11e75f9e5243@suse.com>
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
In-Reply-To: <99089b03-e9f0-4fe8-94b2-11e75f9e5243@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZhTuUy9p1XnXhNMAm0owZwO0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZhTuUy9p1XnXhNMAm0owZwO0
Content-Type: multipart/mixed; boundary="------------eZpqWWdo61ab5299oV7VxF8B";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <e7ebec95-e6f0-491f-8fb4-afe7ee505b07@suse.com>
Subject: Re: [PATCH] tools/xg: increase LZMA_BLOCK_SIZE for uncompressing the
 kernel
References: <20241008213225.728922-1-marmarek@invisiblethingslab.com>
 <226bc9b3-6741-4cb6-917b-1164e340a19d@suse.com> <ZwZScGr75xEolDnS@mail-itl>
 <00ac0665-e4ff-4a56-8537-e81573710c3c@suse.com>
 <e3917457-08d4-4f0c-9e0c-1519952ceed9@suse.com>
 <dde4b510-5674-44d0-9493-a0717387b8d6@citrix.com>
 <99089b03-e9f0-4fe8-94b2-11e75f9e5243@suse.com>
In-Reply-To: <99089b03-e9f0-4fe8-94b2-11e75f9e5243@suse.com>
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

--------------eZpqWWdo61ab5299oV7VxF8B
Content-Type: multipart/mixed; boundary="------------31fYpY1S4q6gqWNoJiToo5Fo"

--------------31fYpY1S4q6gqWNoJiToo5Fo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMTAuMjQgMTM6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOS4xMC4yMDI0
IDEzOjA4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMDkvMTAvMjAyNCAxMToyNiBh
bSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+PiBPbiAwOS4xMC4yNCAxMjoxOSwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDA5LjEwLjIwMjQgMTE6NTIsIE1hcmVrIE1hcmN6eWtv
d3NraS1Hw7NyZWNraSB3cm90ZToNCj4+Pj4+IE9uIFdlZCwgT2N0IDA5LCAyMDI0IGF0IDA5
OjE5OjU3QU0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+IE9uIDA4LjEwLjIw
MjQgMjM6MzIsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4+Pj4+Pj4g
LS0tIGEvdG9vbHMvbGlicy9ndWVzdC94Z19kb21fYnppbWFnZWxvYWRlci5jDQo+Pj4+Pj4+
ICsrKyBiL3Rvb2xzL2xpYnMvZ3Vlc3QveGdfZG9tX2J6aW1hZ2Vsb2FkZXIuYw0KPj4+Pj4+
PiBAQCAtMjcyLDggKzI3Miw3IEBAIHN0YXRpYyBpbnQgX3hjX3RyeV9sem1hX2RlY29kZSgN
Cj4+Pj4+Pj4gIMKgwqDCoMKgwqAgcmV0dXJuIHJldHZhbDsNCj4+Pj4+Pj4gIMKgIH0NCj4+
Pj4+Pj4gIMKgIC0vKiAxMjggTWIgaXMgdGhlIG1pbmltdW0gc2l6ZSAoaGFsZi13YXkpIGRv
Y3VtZW50ZWQgdG8gd29yayBmb3INCj4+Pj4+Pj4gYWxsIGlucHV0cy4gKi8NCj4+Pj4+Pj4g
LSNkZWZpbmUgTFpNQV9CTE9DS19TSVpFICgxMjgqMTAyNCoxMDI0KQ0KPj4+Pj4+PiArI2Rl
ZmluZSBMWk1BX0JMT0NLX1NJWkUgKDI1NioxMDI0KjEwMjQpDQo+Pj4+Pj4NCj4+Pj4+PiBU
aGF0J3MgYXMgYXJiaXRyYXJ5IGFzIGJlZm9yZSwgbm93IGp1c3Qgbm90IGV2ZW4gd2l0aCBh
IGNvbW1lbnQgYXQNCj4+Pj4+PiBsZWFzdA0KPj4+Pj4+IGhpbnRpbmcgYXQgaXQgYmVpbmcg
YXJiaXRyYXJ5LiBRdW90aW5nIGZyb20gb25lIG9mIHRoZSBMWk1BIEFQSQ0KPj4+Pj4+IGhl
YWRlcnM6DQo+Pj4+Pj4NCj4+Pj4+PiAgwqDCoMKgwqAgKiBEZWNvZGVyIGFscmVhZHkgc3Vw
cG9ydHMgZGljdGlvbmFyaWVzIHVwIHRvIDQgR2lCIC0gMSBCIChpLmUuDQo+Pj4+Pj4gIMKg
wqDCoMKgICogVUlOVDMyX01BWCksIHNvIGluY3JlYXNpbmcgdGhlIG1heGltdW0gZGljdGlv
bmFyeSBzaXplIG9mIHRoZQ0KPj4+Pj4+ICDCoMKgwqDCoCAqIGVuY29kZXIgd29uJ3QgY2F1
c2UgcHJvYmxlbXMgZm9yIG9sZCBkZWNvZGVycy4NCj4+Pj4+Pg0KPj4+Pj4+IElPVyAtIHdo
YXQgaWYgdGhlIExpbnV4IGZvbGtzIGRlY2lkZWQgdG8gaW5jcmVhc2UgdGhlIGRpY3Rpb25h
cnkgc2l6ZQ0KPj4+Pj4+IGZ1cnRoZXI/IEkgdGhlcmVmb3JlIHdvbmRlciB3aGV0aGVyIHdl
IGRvbid0IG5lZWQgdG8gbWFrZSB0aGlzIG1vcmUNCj4+Pj4+PiBkeW5hbWljLCBwZXJoYXBz
IGJ5IHBlZWtpbmcgaW50byB0aGUgaGVhZGVyIHRvIG9idGFpbiB0aGUgZGljdGlvbmFyeQ0K
Pj4+Pj4+IHNpemUgdXNlZC4gVGhlIG9uZSB0aGluZyBJJ20gbm90IHN1cmUgYWJvdXQgaXMg
d2hldGhlciB0aGVyZSBjYW4ndCBiZQ0KPj4+Pj4+IG11bHRpcGxlIHN1Y2ggaGVhZGVycyB0
aHJvdWdob3V0IHRoZSBmaWxlLCBhbmQgaGVuY2UgKGluIHByaW5jaXBsZSkNCj4+Pj4+PiBk
aWZmZXJpbmcgZGljdGlvbmFyeSBzaXplcy4NCj4+Pj4+DQo+Pj4+PiBXaGF0IGlzIHRoZSBw
dXJwb3NlIG9mIHRoaXMgYmxvY2sgc2l6ZSBsaW1pdD8gRnJvbSB0aGUgZXJyb3INCj4+Pj4+
IG1lc3NhZ2UsIGl0DQo+Pj4+PiBzZWVtcyB0byBiZSBhdm9pZGluZyBleGNlc3NpdmUgbWVt
b3J5IHVzYWdlIGR1cmluZyBkZWNvbXByZXNzaW9uICh3aGljaA0KPj4+Pj4gY291bGQgYmUg
RG9TIHZpYSBPT00pLiBJZiB0aGF0J3MgdGhlIGNhc2UsIHRoZW4gdGFraW5nIHRoZSBsaW1p
dCBmcm9tDQo+Pj4+PiB0aGUga2VybmVsIGJpbmFyeSBpdHNlbGYgd2lsbCBtaXNzIHRoaXMg
cG9pbnQgKGVzcGVjaWFsbHkgaW4gY2FzZSBvZg0KPj4+Pj4gcHlncnViIG9yIHNpbWlsYXIs
IGJ1dCB0aGVyZSBtYXkgYmUgb3RoZXIgY2FzZXMgb2Ygbm90LWZ1bGx5LXRydXN0ZWQNCj4+
Pj4+IGtlcm5lbCBiaW5hcmllcykuDQo+Pj4+DQo+Pj4+IEluZGVlZC4gVGhlIHF1ZXN0aW9u
IHRoZW4gc2ltcGx5IGlzOiBXaGVyZSBkbyB3ZSB3YW50IHRvIGRyYXcgdGhlIGxpbmUNCj4+
Pj4gYmV0d2VlbiB3aGF0IHdlIHBlcm1pdCBhbmQgd2hhdCB3ZSByZWplY3Q/DQo+Pj4NCj4+
PiBJTUhPIHRoZSBtb3N0IG5hdHVyYWwgc29sdXRpb24gd291bGQgYmUgdG8gdXNlIGd1ZXN0
IG1lbW9yeSBmb3IgdGhpcw0KPj4+IHB1cnBvc2UuDQo+Pj4gT1RPSCB0aGlzIHByb2JhYmx5
IHdvdWxkIHJlcXVpcmUgYSBzaWduaWZpY2FudCByZXdvcmsgb2YgbGlieGVuZ3Vlc3QuDQo+
Pg0KPj4gVGhhdCB3YXMgWFNBLTI1LsKgIFRoZXJlIGFyZSB0b29sc3RhY2stcHJvdmlkZWQg
bGltaXRzIG9uIGtlcm5lbCZpbml0cmQNCj4+IHNpemVzLg0KPiANCj4gV2hpY2ggcHJvYmFi
bHkgY2FuJ3QgYmUgZGlyZWN0bHkgYXBwbGllZCB0byBkaWN0aW9uYXJ5IHNpemUgdXNlZCBk
dXJpbmcNCj4gKGRlKWNvbXByZXNzaW9uLg0KDQpNeSBwb2ludCBzdGlsbCBzdGFuZHM6IHVz
aW5nIEdVRVNUIG1lbW9yeSBmb3IgYWxsIHRoZSBkZWNvbXByZXNzaW9uIHdvcmsNCndvdWxk
IGF2b2lkIGFsbCB0aGVzZSBwcm9ibGVtcy4gSWYgdGhlIGd1ZXN0IG1lbW9yeSBpc24ndCBz
dWZmaWNpZW50LCBhDQpkZWNvbXByZXNzaW9uIGJ5IGUuZy4gZ3J1YiB3b3VsZG4ndCB3b3Jr
IGVpdGhlci4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------31fYpY1S4q6gqWNoJiToo5Fo
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------31fYpY1S4q6gqWNoJiToo5Fo--

--------------eZpqWWdo61ab5299oV7VxF8B--

--------------ZhTuUy9p1XnXhNMAm0owZwO0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcGazgFAwAAAAAACgkQsN6d1ii/Ey/s
rwf/WUOlbJ7djUGLp58WKksGr57vHT5dYmfGYa5RPBuQ8wFFOhexDUdwXaulix/PPUQdF3dWMEnF
zjLLqqwHRlh/ZD/W9QIT8s8ZnXLc33yWSyza9GwdfJp4AEQLsnHlkKfVmQGXwEQJsRWj7svFz1g9
qdpMHEfBU7VmD9p05L/3LfNvPq6/xkeOn18Wc38cz36Wrveofy32njy3oyspuqZl0myr6DXO8ibI
AdXT+fIGrSwN8jYpFiRFfK5QIH/YUyhHmtnwJ0m163mA6JZJ8y4UPuLwbNnSIBDR58LGl7wrn2Pc
r0i6wQHt+/8Ailim3RszIo6gF8y0lG9WOY/dhlyWxw==
=7K08
-----END PGP SIGNATURE-----

--------------ZhTuUy9p1XnXhNMAm0owZwO0--

