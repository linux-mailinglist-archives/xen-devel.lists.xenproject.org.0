Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED3FA3DA49
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 13:43:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893822.1302669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl5u5-0006ec-Mv; Thu, 20 Feb 2025 12:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893822.1302669; Thu, 20 Feb 2025 12:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl5u5-0006da-JB; Thu, 20 Feb 2025 12:43:45 +0000
Received: by outflank-mailman (input) for mailman id 893822;
 Thu, 20 Feb 2025 12:43:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2YGB=VL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tl5u3-0006dU-TK
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 12:43:44 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 503b2480-ef88-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 13:43:41 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38de1a5f039so706700f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 04:43:41 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258eb141sm20159342f8f.41.2025.02.20.04.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 04:43:40 -0800 (PST)
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
X-Inumbo-ID: 503b2480-ef88-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740055421; x=1740660221; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6Uz8a4fg9H6knpDg0XOup1BvP7jNFECkBXoq5sRIai8=;
        b=AHG6U0hCnugZMM9g3aTXHjaDFLezVqLMa4VN/4RPj1gxLyhzJiBlJ1tNjGxV5P5UX1
         ezqQGO1kaIpmVDKtn4S3ku+I+sPOI1Jfm/vPZOgFFehfCJL0CQWzevGebHpXssIpCKjB
         Nh8rW7ERSDFEOBVuIqwo7aSlvjYfVy/oIEOtQpOPThxAdJuBKpAX+XBOOVzvI2QjhwwO
         DgjYEQsxqlmQK+t7rSeBg5WFxL58htt48fNAhrm7mA3e1wWd1yeQLzIvqdxPBUtA9AeU
         rMBuGpN6Vy3gFYF21wCArB8mnT6bXQxdWu3GZAqWdl04J6Lt3wspozE8vNo4oFWgoN+n
         hzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740055421; x=1740660221;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Uz8a4fg9H6knpDg0XOup1BvP7jNFECkBXoq5sRIai8=;
        b=c1C5kUiaYLz318A3sZNGEDWwsqQpQDVPVyKC7iPfiVaep6Q43evByRxyUo1PezypsX
         nfmviEghLi7bMi9+VEfUMorGO3DreMATjU2I+vI7C7XJpSMWIi2tfeFYRB0pam8K/opE
         dkXRs7SUH8wCaHvicMwo00CF3XHdRh78SoRG9GbOFibNTQZE8vi/re61KP5X/zwao4is
         DCh0TcRdEh54UYBCocx8zKoK/a/1/n2yEMHtzZ1E646CQTkVg+8vhOuI8XgC2bWd6m6d
         iwRzD99WOy8aeZuZmVjdvM8JRh5OxJsJ2EuXFx1lwsVVZy2kuQ3j6atDw9n3HSfTxZEJ
         h3IQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8TuQ8LpAFwk3RXk8v01+77A/jOrKh5mJnluymheo3XqsJIwAINE8JNS1ZsVedpmMcX8qjhV52aNQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLCTFwGh1J4N2dlXIY0zcwVCCafvcy7VPZcoa6gpUjGTRujCwn
	B2Q8Y0TyOudBtlDdhBgODvAF4iCHmvM+zY10AI80Lnb+fZuqIAfou9gqpgZxb8s=
X-Gm-Gg: ASbGncvTu3xiXeO2G+S4/fg8vaH+09MJ17w+sfz6fNaJWoZ1EEygDCatCz8/2i7tGJK
	BdY5FjK8d1X9oWBL6sHc4Opz5WLjU3pyQ3pwomn4Lp8wnwmYIXUoylOtAXYx526MctGXSEJHCyq
	nE5cHcqa1pMaBOIf+W3xMjC/nUAvdgBer5eM9Y6Hjmap0Q7CUrJXl+iL2+Fe3NxPBjP+WsTrfWh
	32IVkQNTr/sdVWYXt+BcMs9jls/DiZhYvaZv4h7abR6D/Lk06gIfKOvT4ZiMlqyYIu4/YWuTFQH
	H3Z/ofDBqMd18ul3ToaVtM/VIRYeb9TjNnGTYMoZPphtZZbF3Isw9qJk+hzuAJ3Vh/x/K/VXo1p
	zaKBSAHA2DNlXKdRlfeKDHTuLlldY/vuLWedzXA==
X-Google-Smtp-Source: AGHT+IH3O1qCCdPk0S1UchuNvWI2OM0lKq4vdY6EUYFBRP/WNx6JYzDVBzUjaSJtgiZzqBWuPZXpXQ==
X-Received: by 2002:adf:e3c4:0:b0:38d:e3d4:4468 with SMTP id ffacd0b85a97d-38f33f565ccmr17233283f8f.51.1740055420679;
        Thu, 20 Feb 2025 04:43:40 -0800 (PST)
Message-ID: <c6e37d70-6d27-4857-8541-f522a48915a3@suse.com>
Date: Thu, 20 Feb 2025 13:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Memory corruption bug with Xen PV Dom0 and BOSS-S1 RAID card
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: =?UTF-8?Q?Pawe=C5=82_Srokosz?= <pawel.srokosz@cert.pl>,
 xen-devel <xen-devel@lists.xenproject.org>,
 andrew cooper3 <andrew.cooper3@citrix.com>, JBeulich@suse.com
References: <1050214476.1105853.1739823581696.JavaMail.zimbra@cert.pl>
 <Z7RWdPpUde9ZoaZu@macbook.local>
 <1001969494.1457790.1739990267113.JavaMail.zimbra@cert.pl>
 <Z7bzAeb4UQTQUOsk@macbook.local>
 <23b12ff3-717f-4321-b3be-9c39367b8d14@suse.com>
 <Z7ch7Nk4Skibj-CN@macbook.local>
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
In-Reply-To: <Z7ch7Nk4Skibj-CN@macbook.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K0G59uLwm5YPVc0Jy8t0T0ak"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K0G59uLwm5YPVc0Jy8t0T0ak
Content-Type: multipart/mixed; boundary="------------jNQuVlqV3ngVR9K0uBuV4zBV";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: =?UTF-8?Q?Pawe=C5=82_Srokosz?= <pawel.srokosz@cert.pl>,
 xen-devel <xen-devel@lists.xenproject.org>,
 andrew cooper3 <andrew.cooper3@citrix.com>, JBeulich@suse.com
Message-ID: <c6e37d70-6d27-4857-8541-f522a48915a3@suse.com>
Subject: Re: Memory corruption bug with Xen PV Dom0 and BOSS-S1 RAID card
References: <1050214476.1105853.1739823581696.JavaMail.zimbra@cert.pl>
 <Z7RWdPpUde9ZoaZu@macbook.local>
 <1001969494.1457790.1739990267113.JavaMail.zimbra@cert.pl>
 <Z7bzAeb4UQTQUOsk@macbook.local>
 <23b12ff3-717f-4321-b3be-9c39367b8d14@suse.com>
 <Z7ch7Nk4Skibj-CN@macbook.local>
In-Reply-To: <Z7ch7Nk4Skibj-CN@macbook.local>
Autocrypt-Gossip: addr=JBeulich@suse.com; keydata=
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

--------------jNQuVlqV3ngVR9K0uBuV4zBV
Content-Type: multipart/mixed; boundary="------------0jhoac0ufScMoDCSG8HAOiUV"

--------------0jhoac0ufScMoDCSG8HAOiUV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDIuMjUgMTM6MzcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFRodSwg
RmViIDIwLCAyMDI1IGF0IDEwOjMxOjAyQU0gKzAxMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6
DQo+PiBPbiAyMC4wMi4yNSAxMDoxNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBP
biBXZWQsIEZlYiAxOSwgMjAyNSBhdCAwNzozNzo0N1BNICswMTAwLCBQYXdlxYIgU3Jva29z
eiB3cm90ZToNCj4+Pj4gSGVsbG8sDQo+Pj4+DQo+Pj4+PiBTbyB0aGUgaXNzdWUgZG9lc24n
dCBoYXBwZW4gb24gZGVidWc9eSBidWlsZHM/IFRoYXQncyB1bmV4cGVjdGVkLiAgSSB3b3Vs
ZA0KPj4+Pj4gZXhwZWN0IHRoZSBvcHBvc2l0ZSwgdGhhdCBzb21lIGNvZGUgaW4gTGludXgg
YXNzdW1lcyB0aGF0IHBmbiArIDEgPT0gbWZuICsNCj4+Pj4+IDEsIGFuZCBoZW5jZSBicmVh
a3Mgd2hlbiB0aGUgcmVsYXRpb24gaXMgcmV2ZXJzZWQuDQo+Pj4+DQo+Pj4+IEl0IHdhcyBh
bHNvIHN1cnByaXNpbmcgZm9yIG1lIGJ1dCBJIHRoaW5rIHRoZSBrZXkgdGhpbmcgaXMgdGhh
dCBkZWJ1Zz15DQo+Pj4+IGNhdXNlcyB3aG9sZSBtYXBwaW5nIHRvIGJlIHJldmVyc2VkIHNv
IGVhY2ggUEZOIGxhbmRzIG9uIGNvbXBsZXRlbHkgZGlmZmVyZW50DQo+Pj4+IE1GTiBlLmcu
IE1GTj0weDEzMDAwMDAgaXMgbWFwcGVkIHRvIFBGTj0weDIwZTUwYyBpbiBuZGVidWcsIGJ1
dCBpbiBkZWJ1Zw0KPj4+PiBpdCdzIG1hcHBlZCB0byBQRk49MHg1RkZGRkYuIEkgZ3Vlc3Mg
dGhhdCdzIHdoeSBJIGNhbid0IHJlcHJvZHVjZSB0aGUNCj4+Pj4gcHJvYmxlbS4NCj4+Pj4N
Cj4+Pj4+IENhbiB5b3Ugc2VlIGlmIHlvdSBjYW4gcmVwcm9kdWNlIHdpdGggZG9tMC1pb21t
dT1zdHJpY3QgaW4gdGhlIFhlbiBjb21tYW5kDQo+Pj4+PiBsaW5lPw0KPj4+Pg0KPj4+PiBV
bmZvcnR1bmF0ZWx5LCBpdCBkb2Vzbid0IGhlbHAuIEJ1dCBJIGhhdmUgZmV3IG1vcmUgb2Jz
ZXJ2YXRpb25zLg0KPj4+Pg0KPj4+PiBGaXJzdGx5LCBJIGNoZWNrZWQgdGhlICJ4ZW4tbWZu
ZHVtcCBkdW1wLW0ycCIgb3V0cHV0IGFuZCBmb3VuZCB0aGF0IG1pc3JlYWQNCj4+Pj4gYmxv
Y2tzIGFyZSBtYXBwZWQgdG8gc3VzcGljaW91c2x5IHJvdW5kIE1GTnMuIEkgaGF2ZSBkaWZm
ZXJlbnQgdmVyc2lvbnMgb2YNCj4+Pj4gWGVuIGFuZCBMaW51eCBrZXJuZWwgb24gZWFjaCBt
YWNoaW5lIGFuZCBJIHNlZSBzb21lIGNvaW5jaWRlbmNlLg0KPj4+Pg0KPj4+PiBJJ20gd3Jp
dGluZyBmZXcgaHVnZSBmaWxlcyB3aXRob3V0IFhlbiB0byBlbnN1cmUgdGhhdCB0aGV5IGhh
dmUgYmVlbiB3cml0dGVuDQo+Pj4+IGNvcnJlY3RseSAoYmVjYXVzZSB1bmRlciBYZW4gYm90
aCByZWFkIGFuZCB3cml0ZWJhY2sgaXMgYWZmZWN0ZWQpLiBUaGVuIEknbQ0KPj4+PiBib290
aW5nIHRvIFhlbiwgbWVtb3J5LW1hcHBpbmcgdGhlIGZpbGVzIGFuZCByZWFkaW5nIGVhY2gg
cGFnZS4gSSBzZWUgdGhhdCB3aGVuDQo+Pj4+IGJsb2NrIGlzIGNvcnJ1cHRlZCwgaXQgaXMg
bWFwcGVkIG9uIHJvdW5kIE1GTiBlLmcuIHBmbj0weDUwOTVkOS9tZm49MHgxNjAwMDAwLA0K
Pj4+PiBhbm90aGVyIG9uIHBmbj0weDQwOTVkOS9tZm49MHgxNTAwMDAwIGV0Yy4NCj4+Pj4N
Cj4+Pj4gT24gYW5vdGhlciBtYWNoaW5lIHdpdGggZGlmZmVyZW50IExpbnV4L1hlbiB2ZXJz
aW9uIHRoZXNlIGZhdWx0cyBhcHBlYXIgb24NCj4+Pj4gcGZuPTB4MjBlNTBjL21mbj0weDEz
MDAwMDAsIHBmbj0weDMwZTUwYy9tZm49MHgxNDAwMDAwIGV0Yy4NCj4+Pj4NCj4+Pj4gSSBh
bHNvIG5vdGljZWQgdGhhdCBkdXJpbmcgcmVhZCBvZiBwYWdlIHRoYXQgaXMgbWFwcGVkIHRv
DQo+Pj4+IHBmbj0weDIwZTUwYy9tZm49MHgxMzAwMDAwLCBJJ20gZ2V0dGluZyB0aGVzZSBm
YXVsdHMgZnJvbSBETUFSOg0KPj4+Pg0KPj4+PiBgYGANCj4+Pj4gKFhFTikgW1ZULURdRE1B
UjpbRE1BIFdyaXRlXSBSZXF1ZXN0IGRldmljZSBbMDAwMDo2NTowMC4wXSBmYXVsdCBhZGRy
IDEyMDAwMDAwMDANCj4+Pj4gKFhFTikgW1ZULURdRE1BUjogcmVhc29uIDA1IC0gUFRFIFdy
aXRlIGFjY2VzcyBpcyBub3Qgc2V0DQo+Pj4+IChYRU4pIFtWVC1EXURNQVI6W0RNQSBXcml0
ZV0gUmVxdWVzdCBkZXZpY2UgWzAwMDA6NjU6MDAuMF0gZmF1bHQgYWRkciAxMjAwMDAxMDAw
DQo+Pj4+IChYRU4pIFtWVC1EXURNQVI6IHJlYXNvbiAwNSAtIFBURSBXcml0ZSBhY2Nlc3Mg
aXMgbm90IHNldA0KPj4+PiAoWEVOKSBbVlQtRF1ETUFSOltETUEgV3JpdGVdIFJlcXVlc3Qg
ZGV2aWNlIFswMDAwOjY1OjAwLjBdIGZhdWx0IGFkZHIgMTIwMDAwNjAwMA0KPj4+PiAoWEVO
KSBbVlQtRF1ETUFSOiByZWFzb24gMDUgLSBQVEUgV3JpdGUgYWNjZXNzIGlzIG5vdCBzZXQN
Cj4+Pj4gKFhFTikgW1ZULURdRE1BUjpbRE1BIFdyaXRlXSBSZXF1ZXN0IGRldmljZSBbMDAw
MDo2NTowMC4wXSBmYXVsdCBhZGRyIDEyMDAwMDgwMDANCj4+Pj4gKFhFTikgW1ZULURdRE1B
UjogcmVhc29uIDA1IC0gUFRFIFdyaXRlIGFjY2VzcyBpcyBub3Qgc2V0DQo+Pj4+IChYRU4p
IFtWVC1EXURNQVI6W0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2UgWzAwMDA6NjU6MDAuMF0g
ZmF1bHQgYWRkciAxMjAwMDA5MDAwDQo+Pj4+IChYRU4pIFtWVC1EXURNQVI6IHJlYXNvbiAw
NSAtIFBURSBXcml0ZSBhY2Nlc3MgaXMgbm90IHNldA0KPj4+PiAoWEVOKSBbVlQtRF1ETUFS
OltETUEgV3JpdGVdIFJlcXVlc3QgZGV2aWNlIFswMDAwOjY1OjAwLjBdIGZhdWx0IGFkZHIg
MTIwMDAwYTAwMA0KPj4+PiAoWEVOKSBbVlQtRF1ETUFSOiByZWFzb24gMDUgLSBQVEUgV3Jp
dGUgYWNjZXNzIGlzIG5vdCBzZXQNCj4+Pj4gKFhFTikgW1ZULURdRE1BUjpbRE1BIFdyaXRl
XSBSZXF1ZXN0IGRldmljZSBbMDAwMDo2NTowMC4wXSBmYXVsdCBhZGRyIDEyMDAwMGMwMDAN
Cj4+Pj4gKFhFTikgW1ZULURdRE1BUjogcmVhc29uIDA1IC0gUFRFIFdyaXRlIGFjY2VzcyBp
cyBub3Qgc2V0DQo+Pj4+IGBgYA0KPj4+DQo+Pj4gVGhhdCdzIGludGVyZXN0aW5nLCBpdCBz
ZWVtcyB0byBtZSB0aGF0IExpbnV4IGlzIGFzc3VtaW5nIHRoYXQgcGFnZXMNCj4+PiBhdCBj
ZXJ0YWluIGJvdW5kYXJpZXMgYXJlIHN1cGVycGFnZXMsIGFuZCB0aHVzIGl0IGNhbiBqdXN0
IGluY3JlYXNlDQo+Pj4gdGhlIG1mbiB0byBnZXQgdGhlIG5leHQgcGh5c2ljYWwgcGFnZS4N
Cj4+DQo+PiBJJ20gbm90IHN1cmUgdGhpcyBpcyB0cnVlLiBTZWUgYmVsb3cuDQo+Pg0KPj4+
PiBhbmQgZXZlcnkgdGltZSBJJ20gZHJvcHBpbmcgdGhlIGNhY2hlIGFuZCByZWFkaW5nIHRo
aXMgcmVnaW9uLCBJJ20gZ2V0dGluZw0KPj4+PiBETUFSIGZhdWx0cyBvbiBmZXcgcmFuZG9t
IGFkZHJlc3NlcyBmcm9tIDEyMDAwMDAwMDAtMTIwMDAwZjAwMCByYW5nZSAoSSBndWVzcw0K
Pj4+PiBNRk5zIDB4MTIwMDAwMC0xMjAwMDBmKS4gTUZOcyAweDEyMDAwMDAtMHgxMjAwMGZm
IGFyZSBub3QgbWFwcGVkIHRvIGFueSBQRk4gaW4NCj4+Pj4gRG9tMCAoYmFzZWQgb24geGVu
LW1mbmR1bXAgb3V0cHV0LikuDQo+Pj4NCj4+PiBJdCB3b3VsZCBiZSB2ZXJ5IGludGVyZXN0
aW5nIHRvIGZpZ3VyZSBvdXQgd2hlcmUgdGhvc2UgcmVxdWVzdHMNCj4+PiBvcmlnaW5hdGUs
IGlvdzogd2hpY2ggZW50aXR5IGluIExpbnV4IGNyZWF0ZXMgdGhlIGJpb3Mgd2l0aCB0aGUN
Cj4+PiBmYXVsdGluZyBhZGRyZXNzKGVzKS4NCj4+DQo+PiBJIF90aGlua18gdGhpcyBpcyBy
ZWxhdGVkIHRvIHRoZSBrZXJuZWwgdHJ5aW5nIHRvIGdldCBzb21lIGNvbnRpZ3VvdXMgYXJl
YXMNCj4+IGZvciB0aGUgYnVmZmVycyB1c2VkIGJ5IHRoZSBJL09zLiBBcyB0aG9zZSBhcmVh
cyBhcmUgYmVpbmcgZ2l2ZW4gYmFjayBhZnRlcg0KPj4gdGhlIEkvTywgdGhleSBkb24ndCBh
cHBlYXIgaW4gdGhlIG1mbmR1bXAuDQo+Pg0KPj4+IEl0J3MgYSB3aWxkIGd1ZXNzLCBidXQg
Y291bGQgeW91IHRyeSB0byBib290IExpbnV4IHdpdGggc3dpb3RsYj1mb3JjZQ0KPj4+IG9u
IHRoZSBjb21tYW5kIGxpbmUgYW5kIGF0dGVtcHQgdG8gdHJpZ2dlciB0aGUgaXNzdWU/ICBJ
IHdvbmRlcg0KPj4+IHdoZXRoZXIgaW1wb3NpbmcgdGhlIHVzYWdlIG9mIHRoZSBzd2lvdGxi
IHdpbGwgc3VyZmFjZSB0aGUgaXNzdWVzIGFzDQo+Pj4gQ1BVIGFjY2Vzc2VzLCByYXRoZXIg
dGhlbiBJT01NVSBmYXVsdHMsIGFuZCB0aGF0IGNvdWxkIGdldCB1cyBhIHRyYWNlDQo+Pj4g
aW5zaWRlIExpbnV4IG9mIGhvdyB0aG9zZSByZXF1ZXN0cyBhcmUgZ2VuZXJhdGVkLg0KPj4+
DQo+Pj4+IE9uIHRoZSBvdGhlciBoYW5kLCBJJ20gbm90IGdldHRpbmcgdGhlc2UgRE1BUiBm
YXVsdHMgd2hpbGUgcmVhZGluZyBvdGhlciByZWdpb25zLg0KPj4+PiBBbHNvIEkgY2FuJ3Qg
dHJpZ2dlciB0aGUgYnVnIHdpdGggcmV2ZXJzZWQgRG9tMCBtYXBwaW5nLCBldmVuIGlmIEkg
ZmlsbCB0aGUgcGFnZQ0KPj4+PiBjYWNoZSB3aXRoIHJlYWRzLg0KPj4+DQo+Pj4gVGhlcmUn
cyBwb3NzaWJseSBzb21lIGNvbmRpdGlvbiB3ZSBhcmUgbWlzc2luZyB0aGF0IGNhdXNlcyBh
IGNvbXBvbmVudA0KPj4+IGluIExpbnV4IHRvIGFzc3VtZSB0aGUgbmV4dCBhZGRyZXNzIGlz
IG1mbiArIDEsIGluc3RlYWQgb2YgZG9pbmcgdGhlDQo+Pj4gZnVsbCBhZGRyZXNzIHRyYW5z
bGF0aW9uIGZyb20gdGhlIGxpbmVhciBvciBwZm4gc3BhY2UuDQo+Pg0KPj4gTXkgdGhlb3J5
IGlzOg0KPj4NCj4+IFRoZSBrZXJuZWwgaXMgc2VlaW5nIHRoZSB1c2VkIGJ1ZmZlciB0byBi
ZSBhIHBoeXNpY2FsbHkgY29udGlndW91cyBhcmVhLA0KPj4gc28gaXQgaXMgX25vdF8gdXNp
bmcgYSBzY2F0dGVyLWdhdGhlciBsaXN0IChpdCBkb2VzIGluIHRoZSBkZWJ1ZyBYZW4gY2Fz
ZSwNCj4+IHJlc3VsdGluZyBpbiBpdCBub3QgdG8gc2hvdyBhbnkgZXJyb3JzKS4gVW5mb3J0
dW5hdGVseSB0aGUgYnVmZmVyIGlzIG5vdA0KPj4gYWxpZ25lZCB0byBpdHMgc2l6ZSwgc28g
c3dpb3RsYi14ZW4gd2lsbCByZW1hcCB0aGUgYnVmZmVyIHRvIGEgc3VpdGFibHkNCj4+IGFs
aWduZWQgb25lLiBUaGUgZHJpdmVyIHdpbGwgdGhlbiB1c2UgdGhlIHJldHVybmVkIG1hY2hp
bmUgYWRkcmVzcyBmb3INCj4+IEkvT3MgdG8gYm90aCB0aGUgZGV2aWNlcyBvZiB0aGUgUkFJ
RCBjb25maWd1cmF0aW9uLiBXaGVuIHRoZSBmaXJzdCBJL08gaXMNCj4+IGRvbmUsIHRoZSBk
cml2ZXIgcHJvYmFibHkgaXMgY2FsbGluZyB0aGUgRE1BIHVubWFwIG9yIGRldmljZSBzeW5j
IGZ1bmN0aW9uDQo+PiBhbHJlYWR5LCBjYXVzaW5nIHRoZSBpbnRlcm1lZGlhdGUgY29udGln
dW91cyByZWdpb24gdG8gYmUgZGVzdHJveWVkIGFnYWluDQo+PiAodGhpcyBpcyB0aGUgdGlt
ZSB3aGVuIHRoZSBETUFSIGVycm9ycyBzaG91bGQgc2hvdyB1cCBmb3IgdGhlIDJuZCBJL08g
c3RpbGwNCj4+IHJ1bm5pbmcpLg0KPj4NCj4+IFNvIHRoZSBtYWluIGlzc3VlIElNSE8gaXMs
IHRoYXQgYSBETUEgYnVmZmVyIG1hcHBlZCBmb3Igb25lIGRldmljZSBpcyB1c2VkDQo+PiBm
b3IgMiBkZXZpY2VzIGluc3RlYWQuDQo+IA0KPiBCdXQgdGhhdCB3b24ndCBjYXVzZSBJT01N
VSBmYXVsdHM/ICBCZWNhdXNlIHRoZSBtZW1vcnkgdXNlZCBieSB0aGUNCj4gYm91bmNlIGJ1
ZmZlciB3b3VsZCBzdGlsbCBiZSBvd25lZCBieSBkb20wIChhbmQgdGh1cyBwYXJ0IG9mIGl0
J3MgSU9NTVUNCj4gcGFnZS10YWJsZXMpLCBqdXN0IHByb2JhYmx5IHJlLXdyaXR0ZW4gdG8g
Y29udGFpbiBkaWZmZXJlbnQgZGF0YS4NCj4gDQo+IE9yIGlzIHRoZSBzd2lvdGxiIGNvbnRp
Z3VvdXMgcmVnaW9uIHRvcm4gZG93biBhZnRlciBldmVyeSBvcGVyYXRpb24/DQoNClNlZSB0
aGUga2VybmVsIGZ1bmN0aW9uIHhlbl9zd2lvdGxiX2FsbG9jX2NvaGVyZW50KCk6IGl0IHdp
bGwgdHJ5IHRvDQphbGxvY2F0ZSBhIGNvbnRpbnVvdXMgcmVnaW9uIGZyb20gdGhlIGh5cGVy
dmlzb3Igb24gZGVtYW5kIGFuZCBnaXZlIGl0DQpiYWNrIHZpYSB4ZW5fc3dpb3RsYl9mcmVl
X2NvaGVyZW50KCkgYWZ0ZXIgdGhlIEkvTy4NCg0KPiBUaGF0IHdvdWxkIHNlZW0gZXh0cmVt
ZWx5IHdhc3RlZnVsIHRvIG1lLCBJIGFzc3VtZSB0aGUgYnVmZmVyIGlzDQo+IGFsbG9jYXRl
ZCBkdXJpbmcgZGV2aWNlIGluaXQsIGFuZCBzdGF5cyB0aGUgc2FtZSB1bnRpbCB0aGUgZGV2
aWNlIGlzDQo+IGRldGFjaGVkLg0KDQpZZXMsIHRoYXQgaXMgdGhlIG5vcm1hbCB1c2UgY2Fz
ZSBmb3IgeGVuX3N3aW90bGJfYWxsb2NfY29oZXJlbnQoKS4gV2hldGhlcg0KYWxsIHVzZXJz
IGFyZSBkb2luZyBpdCB0aGF0IHdheSBpcyBhbm90aGVyIHF1ZXN0aW9uLg0KDQpGb3Igbm9y
bWFsIEkvTyB0aGUgc3RhbmRhcmQgY2FzZSBpcyB0byB1c2UgZWl0aGVyIFNHLWxpc3QsIGEg
cHJlLWFsbG9jYXRlZA0KY29udGlndW91cyByZWdpb24sIG9yIHRoZSBzd2lvdGxiIChpbXBs
aWNpdGx5IGRvbmUgdmlhIHhlbl9zd2lvdGxiX21hcF9wYWdlKCkpLg0KDQpBcyB0aGUgb2Jz
ZXJ2YXRpb24gd2FzIHRoYXQgdGhlcmUgYXJlIERNQVIgbWVzc2FnZXMgTk9UIHJlbGF0ZWQg
dG8gZG9tMCBNRk5zLA0KSSBydWxlZCBvdXQgbm9ybWFsIHN3aW90bGIgYnVmZmVycywgd2hp
Y2ggYXJlIGluZGVlZCBwcmUtYWxsb2NhdGVkIGFuZCBhcyBzdWNoDQprbm93biB0byBiZWxv
bmcgdG8gZG9tMCB3aGVuIHRha2luZyB0aGUgbWZuZHVtcC4NCg0KDQpKdWVyZ2VuDQo=
--------------0jhoac0ufScMoDCSG8HAOiUV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0jhoac0ufScMoDCSG8HAOiUV--

--------------jNQuVlqV3ngVR9K0uBuV4zBV--

--------------K0G59uLwm5YPVc0Jy8t0T0ak
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAme3I3sFAwAAAAAACgkQsN6d1ii/Ey8N
jAf/fvLkEn/i8nXRmlRNJIx/YoQHqh5jqWVfK8QdBZtZZrCXIZCETaBXpPDsg38HeM4wA2txRMTi
+uv8Aqok1bR3P79TX2u7lI8BXi6iMkpz58LDtWwrjHF2tdZmXceP7rwHaTaSfxO50vfiKtf8Ot6H
iXULyo8g19STQAq8kAM+jarX14vlADzs51cqF9OyM+Sb2ZsMOCr3doZZbuCaX8NfZ7+UlfNkHU0i
AgfsHk9OMfE8o5rF/xq23hGjp2pyhcozrz7yYNIGIs8R+utTEBkr5h7gKhumoFK6zI0Rm9ZbHroH
V98gVFejRQ5CVS7uPDUgesV2z64HYdVaZQKDwn20sA==
=AOoq
-----END PGP SIGNATURE-----

--------------K0G59uLwm5YPVc0Jy8t0T0ak--

