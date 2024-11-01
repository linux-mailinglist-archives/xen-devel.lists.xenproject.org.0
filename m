Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1029B8BBD
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 08:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828971.1244080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6lkF-0005xU-41; Fri, 01 Nov 2024 07:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828971.1244080; Fri, 01 Nov 2024 07:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6lkF-0005w0-0q; Fri, 01 Nov 2024 07:06:55 +0000
Received: by outflank-mailman (input) for mailman id 828971;
 Fri, 01 Nov 2024 07:06:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSVc=R4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t6lkC-0005vs-TJ
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 07:06:53 +0000
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [2a00:1450:4864:20::542])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd692800-981f-11ef-a0c5-8be0dac302b0;
 Fri, 01 Nov 2024 08:06:50 +0100 (CET)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-5cb74434bc5so2010396a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Nov 2024 00:06:50 -0700 (PDT)
Received: from ?IPV6:2003:e5:8706:5100:ddd3:fe18:d0ae:c30d?
 (p200300e587065100ddd3fe18d0aec30d.dip0.t-ipconnect.de.
 [2003:e5:8706:5100:ddd3:fe18:d0ae:c30d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e564e9ceasm149475466b.96.2024.11.01.00.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Nov 2024 00:06:48 -0700 (PDT)
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
X-Inumbo-ID: dd692800-981f-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1NDIiLCJoZWxvIjoibWFpbC1lZDEteDU0Mi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRkNjkyODAwLTk4MWYtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNDQ0ODEwLjExNDI3LCJzZW5kZXIiOiJqZ3Jvc3NAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730444809; x=1731049609; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aeNA3YCfZz+iPtcJJ5VI6F0K1ze23q13x6dLutDLsGU=;
        b=eam0cynC8jVdJWIK0+HW1jmBPfD09zW+nF7acOlVewgehHLFNxaF/kleQioi5JJ2CT
         C9zkS+HSr7jYJ4+W0dC86x1n5ILBSxo2XN3mGdSS1bV239Sv47ZC7NOfjjNmUrj756as
         GIFx5tupWffuj8U3T3WAyBEOKXK0nInmpXd/rE3xcoKnAEU4r8ST7i38TbfepEJrFG22
         I2vm+ZnP+y3U7daJBN2FAJcAVkDMnKDB2/CqZlofN1qDCstAGDdZnlzPJYfCQe0RfKOY
         sroy9NFuRWqoLwHEdaUnpw9dk55gasoM74u7LdhFJQN0wQW0tu/N8klbMyWpFlfidoAM
         JROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730444809; x=1731049609;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aeNA3YCfZz+iPtcJJ5VI6F0K1ze23q13x6dLutDLsGU=;
        b=h26i/LP9+8i18soxmZMvn07P5csXoaWvQEt/53EDuKlttahj27hAC5xgO63RwTSLy2
         6tefaVrPY3qMeYwTg4F+6Na7wE3ReABM0PTgLqLryDhWmOk9Ek8nGX3Z0kj/tlyTyrP1
         BH17GfGNgZrAUrO6OPZti7VyJ+iXS4ZcFCat9dc8H6GGFD3JzzBc+fIpOamv4HrbfRhv
         QBQZT75uUJAWkX9lHDWHD5fdeKd9cUOhgtDCOjH/EtePLZziP//3euGjwUHxWuV22jnB
         o+ndxhgbAV6hbnXb72JTzyrLv8PngLSkF3DB1Ivq7HAVcHnctNtHB2EruAWl1xJaFs+L
         3o0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpjoOiEy8KI1bhrzipCD4M4maHw++68WCBxtv/jFn2MSg5vJWID9B+EWZzzkM0Hq8TCXSmLLNmSC0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyW63hqkA1IN0AMCmg2kgafehnmDwa5BUVItQfJ7FB3hVRKyH9v
	6jfdDp0XIQVyUbpTFEk8mjl0+bxJnPy/NhP5pZFJXUmLu3k0yDXSewGqoyeUTa0=
X-Google-Smtp-Source: AGHT+IG6Z5kmVI+KtWlZnh7ztqJ268VEGTvZos8r9wPYHR/nvLhSdJomaLHu60x+8n08j2jzp+cGbA==
X-Received: by 2002:a17:907:97ce:b0:a99:8a5c:a357 with SMTP id a640c23a62f3a-a9e657fd8c3mr217923566b.58.1730444809184;
        Fri, 01 Nov 2024 00:06:49 -0700 (PDT)
Message-ID: <870f8639-335b-4b1e-bdd4-ffbb38ee3eb2@suse.com>
Date: Fri, 1 Nov 2024 08:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] xen: add a domain unique id to each domain
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-2-jgross@suse.com>
 <D538TV4LGFZF.J375ZVYWPIHO@cloud.com>
 <cc607d38-1638-4f43-b0d3-b03842e8d9b9@suse.com>
 <D59Z2CO4QOAK.KWLIRVJEV4XY@cloud.com>
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
In-Reply-To: <D59Z2CO4QOAK.KWLIRVJEV4XY@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Xxyt9kcWDqo4WuvRBdRxf6T9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Xxyt9kcWDqo4WuvRBdRxf6T9
Content-Type: multipart/mixed; boundary="------------zPVgCWERb080tWDVNB4HP6ir";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <870f8639-335b-4b1e-bdd4-ffbb38ee3eb2@suse.com>
Subject: Re: [PATCH 1/6] xen: add a domain unique id to each domain
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-2-jgross@suse.com>
 <D538TV4LGFZF.J375ZVYWPIHO@cloud.com>
 <cc607d38-1638-4f43-b0d3-b03842e8d9b9@suse.com>
 <D59Z2CO4QOAK.KWLIRVJEV4XY@cloud.com>
In-Reply-To: <D59Z2CO4QOAK.KWLIRVJEV4XY@cloud.com>
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

--------------zPVgCWERb080tWDVNB4HP6ir
Content-Type: multipart/mixed; boundary="------------16SVtxD0228pbFahI70hw0f9"

--------------16SVtxD0228pbFahI70hw0f9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzEuMTAuMjQgMTI6NTgsIEFsZWphbmRybyBWYWxsZWpvIHdyb3RlOg0KPiBPbiBXZWQg
T2N0IDIzLCAyMDI0IGF0IDM6MjcgUE0gQlNULCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4g
T24gMjMuMTAuMjQgMTY6MDgsIEFsZWphbmRybyBWYWxsZWpvIHdyb3RlOg0KPj4+IE9uIFdl
ZCBPY3QgMjMsIDIwMjQgYXQgMjoxMCBQTSBCU1QsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+
Pj4+IFhlbnN0b3JlIGlzIHJlZmVyZW5jaW5nIGRvbWFpbnMgYnkgdGhlaXIgZG9taWQsIGJ1
dCByZXVzZSBvZiBhIGRvbWlkDQo+Pj4+IGNhbiBsZWFkIHRvIHRoZSBzaXR1YXRpb24gdGhh
dCBYZW5zdG9yZSBjYW4ndCB0ZWxsIHdoZXRoZXIgYSBkb21haW4NCj4+Pj4gd2l0aCB0aGF0
IGRvbWlkIGhhcyBiZWVuIGRlbGV0ZWQgYW5kIGNyZWF0ZWQgYWdhaW4gd2l0aG91dCBYZW5z
dG9yZQ0KPj4+PiBub3RpY2luZyB0aGUgZG9tYWluIGlzIGEgbmV3IG9uZSBub3cuDQo+Pj4+
DQo+Pj4+IEFkZCBhIGdsb2JhbCBkb21haW4gY3JlYXRpb24gdW5pcXVlIGlkIHdoaWNoIGlz
IHVwZGF0ZWQgd2hlbiBjcmVhdGluZw0KPj4+PiBhIG5ldyBkb21haW4sIGFuZCBzdG9yZSB0
aGF0IHZhbHVlIGluIHN0cnVjdCBkb21haW4gb2YgdGhlIG5ldyBkb21haW4uDQo+Pj4+IFRo
ZSBnbG9iYWwgdW5pcXVlIGlkIGlzIGluaXRpYWxpemVkIHdpdGggdGhlIHN5c3RlbSB0aW1l
IGFuZCB1cGRhdGVzDQo+Pj4+IGFyZSBkb25lIHZpYSB0aGUgeG9yc2hpZnQgYWxnb3JpdGht
IHdoaWNoIGlzIHVzZWQgZm9yIHBzZXVkbyByYW5kb20NCj4+Pj4gbnVtYmVyIGdlbmVyYXRp
b24sIHRvbyAoc2VlIGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL1hvcnNoaWZ0KS4N
Cj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPg0KPj4+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KPj4+PiAtLS0NCj4+Pj4gVjE6DQo+Pj4+IC0gbWFrZSB1bmlxdWVfaWQgbG9jYWwgdG8g
ZnVuY3Rpb24gKEphbiBCZXVsaWNoKQ0KPj4+PiAtIGFkZCBsb2NrIChKdWxpZW4gR3JhbGwp
DQo+Pj4+IC0gYWRkIGNvbW1lbnQgKEp1bGllbiBHcmFsbCkNCj4+Pj4gLS0tDQo+Pj4+ICAg
IHhlbi9jb21tb24vZG9tYWluLmMgICAgIHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4+
Pj4gICAgeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCAgMyArKysNCj4+Pj4gICAgMiBmaWxl
cyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9kb21haW4uYw0KPj4+PiBpbmRleCA5
MjI2M2E0ZmJkLi4zOTQ4NjQwZmIwIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vY29tbW9uL2Rv
bWFpbi5jDQo+Pj4+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4+Pj4gQEAgLTU2Miw2
ICs1NjIsMjUgQEAgc3RhdGljIHZvaWQgX2RvbWFpbl9kZXN0cm95KHN0cnVjdCBkb21haW4g
KmQpDQo+Pj4+ICAgICAgICBmcmVlX2RvbWFpbl9zdHJ1Y3QoZCk7DQo+Pj4+ICAgIH0NCj4+
Pj4gICAgDQo+Pj4+ICtzdGF0aWMgdWludDY0X3QgZ2V0X3VuaXF1ZV9pZCh2b2lkKQ0KPj4+
PiArew0KPj4+PiArICAgIHN0YXRpYyB1aW50NjRfdCB1bmlxdWVfaWQ7DQo+Pj4+ICsgICAg
c3RhdGljIERFRklORV9TUElOTE9DSyhsb2NrKTsNCj4+Pj4gKyAgICB1aW50NjRfdCB4ID0g
dW5pcXVlX2lkID8gOiBOT1coKTsNCj4+Pj4gKw0KPj4+PiArICAgIHNwaW5fbG9jaygmbG9j
ayk7DQo+Pj4+ICsNCj4+Pj4gKyAgICAvKiBQc2V1ZG8tcmFuZG9taXplIGlkIGluIG9yZGVy
IHRvIGF2b2lkIGNvbnN1bWVycyByZWx5aW5nIG9uIHNlcXVlbmNlLiAqLw0KPj4+PiArICAg
IHggXj0geCA8PCAxMzsNCj4+Pj4gKyAgICB4IF49IHggPj4gNzsNCj4+Pj4gKyAgICB4IF49
IHggPDwgMTc7DQo+Pj4+ICsgICAgdW5pcXVlX2lkID0geDsNCj4gDQo+IEhvdyAidW5pcXVl
IiBhcmUgdGhleT8gV2l0aCB0aG9zZSBzaGlmdHMgaXQncyBmYXIgbGVzcyBvYnZpb3VzIHRv
IGtub3cgaG93IG1hbnkNCj4gdGltZXMgd2UgY2FuIGNhbGwgZ2V0X3VuaXF1ZV9pZCgpIGFu
ZCBnZXQgYW4gSUQgdGhhdCBoYXNuJ3QgYmVlbiBzZWVuIHNpbmNlDQo+IHJlc2V0LiBXaXRo
IHNlcXVlbnRpYWwgbnVtYmVycyBpdCdzIHByZXR0eSBvYnZpb3VzIHRoYXQgaXQnZCBiZSBh
DQo+IG5vbi1vdmVyZmxvd2FibGUgbW9ub3RvbmljIGNvdW50ZXIuIEhlcmUncyBpdCdzIGZh
ciBsZXNzIGNsZWFyLCBwYXJ0aWN1bGFybHkNCj4gd2hlbiBpdCdzIHJhbmRvbWx5IHNlZWRl
ZC4NCg0KSWYgeW91J2QgbG9vayBpbnRvIHRoZSBXaWtpcGVkaWEgYXJ0aWNsZSBtZW50aW9u
ZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlDQp5b3UnZCBrbm93IHRoYXQgdGhlIHBlcmlvZCBp
cyAyXjY0IC0gMS4NCg0KPiBJIGRvbid0IHF1aXRlIHNlZSB3aHkgc2VxdWVudGlhbCBJRHMg
YXJlIHByb2JsZW1hdGljLiBXaGF0IGlzIHRoaXMNCj4gKHBzZXVkbylyYW5kb21pemF0aW9u
IHNwZWNpZmljYWxseSB0cnlpbmcgdG8gcHJldmVudD8gSWYgaXQncyBqdXN0IGJyZWFraW5n
IHRoZQ0KPiBhc3N1bXB0aW9uIHRoYXQgbnVtYmVycyBnbyBpbiBzdHJpY3Qgc2VxdWVuY2Ug
eW91IGNvdWxkIGp1c3QgZmxpcCB0aGUgaGlnaCBhbmQNCj4gbG93IG5pYmJsZXMgKG9yIGFu
eSBvdGhlciBkZXRlcm1pbmlzdGljIHN3YXBwaW5nIG9mIGNvdW50ZXIgbmliYmxlcykNCg0K
VGhhdCB3YXMgYSByZXF1ZXN0IGZyb20gdGhlIFJGQyBzZXJpZXMgb2YgdGhpcyBwYXRjaC4N
Cg0KPiBQbHVzLCB3aXRoIHRoZSBjb3VudGVyIGdvaW5nIGluIHNlcXVlbmNlIHdlIGNvdWxk
IGdldCByaWQgb2YgdGhlIGxvY2sgYmVjYXVzZQ0KPiBhbiBhdG9taWMgZmV0Y2hfYWRkKCkg
d291bGQgZG8uDQoNCkl0cyBub3QgYXMgaWYgdGhpcyB3b3VsZCBiZSBhIGhvdCBwYXRoLiBT
byB0aGUgbG9jayBpcyBubyByZWFsIGlzc3VlIElNTy4NCg0KPiANCj4+Pj4gKw0KPj4+PiAr
ICAgIHNwaW5fdW5sb2NrKCZsb2NrKTsNCj4+Pj4gKw0KPj4+PiArICAgIHJldHVybiB4Ow0K
Pj4+PiArfQ0KPj4+PiArDQo+Pj4+ICAgIHN0YXRpYyBpbnQgc2FuaXRpc2VfZG9tYWluX2Nv
bmZpZyhzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gKmNvbmZpZykNCj4+Pj4gICAg
ew0KPj4+PiAgICAgICAgYm9vbCBodm0gPSBjb25maWctPmZsYWdzICYgWEVOX0RPTUNUTF9D
REZfaHZtOw0KPj4+PiBAQCAtNjU0LDYgKzY3Myw3IEBAIHN0cnVjdCBkb21haW4gKmRvbWFp
bl9jcmVhdGUoZG9taWRfdCBkb21pZCwNCj4+Pj4gICAgDQo+Pj4+ICAgICAgICAvKiBTb3J0
IG91dCBvdXIgaWRlYSBvZiBpc19zeXN0ZW1fZG9tYWluKCkuICovDQo+Pj4+ICAgICAgICBk
LT5kb21haW5faWQgPSBkb21pZDsNCj4+Pj4gKyAgICBkLT51bmlxdWVfaWQgPSBnZXRfdW5p
cXVlX2lkKCk7DQo+Pj4+ICAgIA0KPj4+PiAgICAgICAgLyogSG9sZGluZyBDREZfKiBpbnRl
cm5hbCBmbGFncy4gKi8NCj4+Pj4gICAgICAgIGQtPmNkZiA9IGZsYWdzOw0KPj4+PiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmggYi94ZW4vaW5jbHVkZS94ZW4vc2No
ZWQuaA0KPj4+PiBpbmRleCA5MDY2NjU3NmMyLi4xZGQ4YTQyNWY5IDEwMDY0NA0KPj4+PiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPj4+PiArKysgYi94ZW4vaW5jbHVkZS94
ZW4vc2NoZWQuaA0KPj4+PiBAQCAtMzcwLDYgKzM3MCw5IEBAIHN0cnVjdCBkb21haW4NCj4+
Pj4gICAgICAgIGRvbWlkX3QgICAgICAgICAgZG9tYWluX2lkOw0KPj4+PiAgICANCj4+Pj4g
ICAgICAgIHVuc2lnbmVkIGludCAgICAgbWF4X3ZjcHVzOw0KPj4+PiArDQo+Pj4+ICsgICAg
dWludDY0X3QgICAgICAgICB1bmlxdWVfaWQ7ICAgICAgIC8qIFVuaXF1ZSBkb21haW4gaWRl
bnRpZmllciAqLw0KPj4+PiArDQo+Pj4NCj4+PiBXaHkgbm90IHhlbl9kb21haW5faGFuZGxl
X3QgaGFuZGxlLCBkZWZpbmVkIGxhdGVyIG9uPyBUaGF0J3MgbWVhbnQgdG8gYmUgYQ0KPj4+
IFVVSUQsIHNvIHRoaXMgZmVlbHMgbGlrZSBhIGR1cGxpY2F0ZSBmaWVsZC4NCj4+DQo+PiBJ
dCBpcyBhbiBpbnB1dCB2YWx1ZSBmb3IgY3JlYXRlIGRvbWFpbi4gU28gdGhlcmUgaXMgYWJz
b2x1dGVseSBubw0KPj4gZ3VhcmFudGVlIHRoYXQgaXQgaXMgdW5pcXVlLg0KPj4NCj4+IEl0
IGNhbiBlc3BlY2lhbGx5IGJlIHNwZWNpZmllZCBpbiB0aGUgeGwgY29uZmlnIGZpbGUsIHNv
IHlvdSBjb3VsZCBoYXZlDQo+PiBhIGhvc3QgcnVubmluZyBtdWx0aXBsZSBndWVzdHMgYWxs
IHdpdGggdGhlIHNhbWUgVVVJRCAoZXZlbiBpZiB0aGlzIG1pZ2h0DQo+PiBiZSByZWplY3Rl
ZCBieSBsaWJ4bCwgZGVzdHJveWluZyBhIGd1ZXN0IGFuZCB0aGVuIHJlY3JlYXRpbmcgaXQg
d2l0aCB0aGUNCj4+IHNhbWUgVVVJRCBpcyBwb3NzaWJsZSwgYnV0IFhlbnN0b3JlIHdvdWxk
IG5lZWQgdG8gc2VlIGRpZmZlcmVudCB1bmlxdWUgSWRzDQo+PiBmb3IgdGhvc2UgMiBndWVz
dHMpLg0KPiANCj4gRmFpciBwb2ludHMuIFdpdGggdGhhdCBpbnRvIGFjY291bnQsIEkgd291
bGRuJ3QgbWluZCBzZWVpbmcgYSB3aWRlciBjb21tZW50IG9uDQo+IHRvcCBvZiB1bmlxdWVf
aWQgZXhwbGFpbmluZyBob3cgdGhlc2UgSURzIGFyZSBtZWFudCB0byBiZSBub24tcmVwZWF0
YWJsZQ0KPiBiZXR3ZWVuIHJlc2V0cyBhbmQgbWVhbnQgdG8gaGF2ZSB0aGUgc2FtZSBsaWZl
dGltZSBhcyB0aGVpciBjb3JyZXNwb25kaW5nDQo+IGRvbWFpbl9pZC4NCg0KT2theSwgSSBj
YW4gYWRkIHN1Y2ggYSBjb21tZW50Lg0KDQoNCkp1ZXJnZW4NCg==
--------------16SVtxD0228pbFahI70hw0f9
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------16SVtxD0228pbFahI70hw0f9--

--------------zPVgCWERb080tWDVNB4HP6ir--

--------------Xxyt9kcWDqo4WuvRBdRxf6T9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmckfggFAwAAAAAACgkQsN6d1ii/Ey+I
lQgAkrOtYKCdFLCOUotCdXUrWcPevsGW059ejANWyrYQv23DrvvsQbUgyrNis0JQYopVOScjhQwB
B50kC48PoTPhQ//LaMsxd88nV3GJBwUwY87awypYZ7P6MufjxFkW0KrJhDsxAtofZ1v3RW0Ma09S
tcy5ODQNauczamr6htNm9iLlhuy+P7pOFeyCmmUh8v4olXJMYmcWO5LsMsUEcZ5ABVPtQzBD2/2A
TTHVyNM/P59xA3t6XT1cqSUN7iLHWgvvSCf6N0OuqkQcanvi1B80U8SfLB2Q1nfI0VlviaqfKOc2
SdbStojJyw8s3Fegh2OvjEVeylVoB/g4AnS3UQr0Jg==
=mBuO
-----END PGP SIGNATURE-----

--------------Xxyt9kcWDqo4WuvRBdRxf6T9--

