Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E333A6D900
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 12:18:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925367.1328233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twfp2-00055E-RZ; Mon, 24 Mar 2025 11:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925367.1328233; Mon, 24 Mar 2025 11:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twfp2-00052i-OI; Mon, 24 Mar 2025 11:18:24 +0000
Received: by outflank-mailman (input) for mailman id 925367;
 Mon, 24 Mar 2025 11:18:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mc85=WL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1twfp0-00052W-Sk
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 11:18:22 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b12b9e96-08a1-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 12:18:20 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-abf3d64849dso701611766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 04:18:20 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef8675a9sm657615266b.28.2025.03.24.04.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 04:18:19 -0700 (PDT)
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
X-Inumbo-ID: b12b9e96-08a1-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742815100; x=1743419900; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/aD0jqqsiGXVDg4jgzyO6tncFjvnQC7Tk3Evr0Dzxs=;
        b=Fvr28KxD4ITlkw3Fj04lAupbn8LMVId043Eepf4WjBiE/hOxLc+PJFfYfYRbWxHs1X
         gJnOxnDKwE1WCBitYOiUlggioTzqmTck65ngO5RU0u+hcDTBrc2PiL9M2Cl5Wc5e3cY8
         jhkT8pW7r6FZ6hIv4/Y7HYW6D3xT0zvfLSBUaMeCF5cik0N6nqNdNE7u3Mv9XczLjTp9
         P14tzrhZ5Gc3w65ykMGKOa0Vyn+9TaCuuxzeMYshz14tmZTubpcsIuI8TG8IkKcLth/z
         ahORfeT1hFYwJNyLrPSwnhDylZ49nU46gM/7bHSWwFYrRJHIqF0biNj94xKNM1LFg0QG
         8FDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742815100; x=1743419900;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M/aD0jqqsiGXVDg4jgzyO6tncFjvnQC7Tk3Evr0Dzxs=;
        b=S6gAn0CJwZWHLNM6JjOoT0CCXkjA37uZ3aZe9VbXB0LYgkd/ip98pugrVZxRy4LKTM
         j2lRJIy1Q3107vKF9M35CxMr56ifvOfWZ9q/H1wMgp9EwxJaGXZ7s4SXova3jk3FdU8H
         XxF4qjyyhvSWxAJ3x/NucJn8nLW/mqE/YLdB0BAeg3gq6Nw3ZzTqY2H82HC2CPMgCfdf
         p9vrcVRrOdfm579dzQIFQn12dt7q2ydt9+Yxf/myvwM+m1vYNvCxqJbcUWHgABWE+4mi
         5Hq39KRxkDLKxTV1C5dtPF0l+3eGGylf4VINQH5EwJoAjUHWzfNlercb3byqusye1xuv
         CdqA==
X-Forwarded-Encrypted: i=1; AJvYcCWnWOVbI0ztxBdPn9Y+pb/COMnDCfwt0zHmQYS5VcRgT2NaftP1nGeH1aHhVLAR0LSBh5l4MDSqlGw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxnk1b5kjTT7KVXwMi8/1P7erp/uCX9unwbN1C96iSD/Z6bz516
	ZFJl7sQsqYW5sL6gjmMIDXGJ2tKexk1KGqsYpleOzGfDO6TY2h0NWRnhtxE7AWU=
X-Gm-Gg: ASbGncvRIHl99ebHum/FOaV0KATW5p+m8c6MYFZ2wfqEFmiCd8evtkOv+WdEPSkjc6a
	+cxYb6EfreW+9QtLxWMYZDlVcqsWleQAyh9T4CTLdQPYb+slOj1fUkkMVXjMlLKsnr4GDMvSvea
	JwLjJUexdwKu3G2PiWLk9zVdIQ3eAJ8Z17to8elwDy6UjvIRnfBY9c/8S4oMBfAtLdAkfyan3Gn
	+L6NzO6ELlRUYKzG3x6xxzOHHp261q2os6mIQi74rYepRfzDS6TmJh5mWuOZOKH96Qm+XVEDNsa
	EiSmnH2dsR0gR+scdgdvBB8XQcn+Fj3yu7vDQk63qDZbkat1rxJl7IfpHN5rjgvOwXzKYrW1bbH
	SlysEYDtG6emD192m3DLaL4tAULhDAW9oz0brrPdf92u9xNjCq0YptHAxaEZE9FErNs9l4A==
X-Google-Smtp-Source: AGHT+IGQqLX9WqN5pq9/5m9ht3nL/oNNGecIcBTfHjbistTUweg0GSoFCLbMCLeIyUdL9BLqJ2vV5w==
X-Received: by 2002:a17:907:bc8b:b0:ac4:4cd:c26c with SMTP id a640c23a62f3a-ac404cdc6eamr915901666b.35.1742815099829;
        Mon, 24 Mar 2025 04:18:19 -0700 (PDT)
Message-ID: <2fa05dd3-c5ae-4e72-b42d-260433590187@suse.com>
Date: Mon, 24 Mar 2025 12:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH v2 1/2] 9pfs: add fstat file operation hook
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jan Beulich <jbeulich@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>
References: <20250321093145.17882-1-jgross@suse.com>
 <20250321093145.17882-2-jgross@suse.com> <Z99PXOXocyuZtf_X@begin>
 <79a51a80-7723-4f58-b0ea-25f73d4fd796@suse.com>
 <abce7ac0-21bd-409c-bc4c-f08d04a5a5d1@suse.com> <Z-E0TUu_LWkXt-wI@begin>
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
In-Reply-To: <Z-E0TUu_LWkXt-wI@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------93VhOJVDM4Aui2kdG0uWoMhH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------93VhOJVDM4Aui2kdG0uWoMhH
Content-Type: multipart/mixed; boundary="------------sWzNZouI0XYebMzUCklyKNWW";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jan Beulich <jbeulich@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>
Message-ID: <2fa05dd3-c5ae-4e72-b42d-260433590187@suse.com>
Subject: Re: [MINI-OS PATCH v2 1/2] 9pfs: add fstat file operation hook
References: <20250321093145.17882-1-jgross@suse.com>
 <20250321093145.17882-2-jgross@suse.com> <Z99PXOXocyuZtf_X@begin>
 <79a51a80-7723-4f58-b0ea-25f73d4fd796@suse.com>
 <abce7ac0-21bd-409c-bc4c-f08d04a5a5d1@suse.com> <Z-E0TUu_LWkXt-wI@begin>
In-Reply-To: <Z-E0TUu_LWkXt-wI@begin>
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

--------------sWzNZouI0XYebMzUCklyKNWW
Content-Type: multipart/mixed; boundary="------------x2sEk6Xx3DBccBIYmmETXiO5"

--------------x2sEk6Xx3DBccBIYmmETXiO5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDMuMjUgMTE6MzAsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSmFuIEJldWxp
Y2gsIGxlIGx1bi4gMjQgbWFycyAyMDI1IDExOjIxOjQ4ICswMTAwLCBhIGVjcml0Og0KPj4g
T24gMjMuMDMuMjAyNSAxNTo1NywgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+PiBPbiAyMy4w
My4yNSAwMTowMSwgU2FtdWVsIFRoaWJhdWx0IHdyb3RlOg0KPj4+PiBKdWVyZ2VuIEdyb3Nz
LCBsZSB2ZW4uIDIxIG1hcnMgMjAyNSAxMDozMTo0NCArMDEwMCwgYSBlY3JpdDoNCj4+Pj4+
IEFkZCBhIGZpbGUgb3BlcmF0aW9ucyBmc3RhdCBob29rIHRvIHRoZSA5cGZzIGZyb250ZW5k
Lg0KPj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4NCj4+Pj4+IFJldmlld2VkLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5hbmRy
eXVrQGFtZC5jb20+DQo+Pj4+PiAtLS0NCj4+Pj4+IFYyOg0KPj4+Pj4gLSBvciBmaWxlIGFj
Y2VzcyBtb2RlIGludG8gc3RfbW9kZSAoSmFzb24gQW5kcnl1aykNCj4+Pj4+IC0tLQ0KPj4+
Pj4gICAgOXBmcm9udC5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+
Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspDQo+Pj4+Pg0KPj4+Pj4g
ZGlmZiAtLWdpdCBhLzlwZnJvbnQuYyBiLzlwZnJvbnQuYw0KPj4+Pj4gaW5kZXggMTc0MWQ2
MDAuLjcyNTdhMDdlIDEwMDY0NA0KPj4+Pj4gLS0tIGEvOXBmcm9udC5jDQo+Pj4+PiArKysg
Yi85cGZyb250LmMNCj4+Pj4+IEBAIC04NSw2ICs4NSw4IEBAIHN0cnVjdCBmaWxlXzlwZnMg
ew0KPj4+Pj4gICAgDQo+Pj4+PiAgICAjZGVmaW5lIFA5X1FJRF9TSVpFICAgIDEzDQo+Pj4+
PiAgICANCj4+Pj4+ICsjZGVmaW5lIFFJRF9UWVBFX0RJUiAgIDB4ODAgICAgIC8qIEFwcGxp
ZXMgdG8gcWlkWzBdLiAqLw0KPj4+Pj4gKw0KPj4+Pj4gICAgc3RydWN0IHA5X2hlYWRlciB7
DQo+Pj4+PiAgICAgICAgdWludDMyX3Qgc2l6ZTsNCj4+Pj4+ICAgICAgICB1aW50OF90IGNt
ZDsNCj4+Pj4+IEBAIC05NTAsNiArOTUyLDMyIEBAIHN0YXRpYyBpbnQgd3JpdGVfOXBmcyhz
dHJ1Y3QgZmlsZSAqZmlsZSwgY29uc3Qgdm9pZCAqYnVmLCBzaXplX3QgbmJ5dGVzKQ0KPj4+
Pj4gICAgICAgIHJldHVybiByZXQ7DQo+Pj4+PiAgICB9DQo+Pj4+PiAgICANCj4+Pj4+ICtz
dGF0aWMgaW50IGZzdGF0XzlwZnMoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBzdGF0ICpi
dWYpDQo+Pj4+PiArew0KPj4+Pj4gKyAgICBzdHJ1Y3QgZmlsZV85cGZzICpmOXBmcyA9IGZp
bGUtPmZpbGVkYXRhOw0KPj4+Pj4gKyAgICBzdHJ1Y3QgcDlfc3RhdCBzdGF0Ow0KPj4+Pj4g
KyAgICBpbnQgcmV0Ow0KPj4+Pj4gKw0KPj4+Pj4gKyAgICByZXQgPSBwOV9zdGF0KGY5cGZz
LT5kZXYsIGY5cGZzLT5maWQsICZzdGF0KTsNCj4+Pj4+ICsgICAgaWYgKCByZXQgKQ0KPj4+
Pj4gKyAgICB7DQo+Pj4+PiArICAgICAgICBlcnJubyA9IEVJTzsNCj4+Pj4+ICsgICAgICAg
IHJldHVybiAtMTsNCj4+Pj4+ICsgICAgfQ0KPj4+Pj4gKw0KPj4+Pj4gKyAgICBidWYtPnN0
X21vZGUgPSAoc3RhdC5xaWRbMF0gPT0gUUlEX1RZUEVfRElSKSA/IFNfSUZESVIgOiBTX0lG
UkVHOw0KPj4+Pj4gKyAgICBidWYtPnN0X21vZGUgfD0gc3RhdC5tb2RlICYgMDc3NzsNCj4+
Pj4+ICsgICAgYnVmLT5zdF9hdGltZSA9IHN0YXQuYXRpbWU7DQo+Pj4+PiArICAgIGJ1Zi0+
c3RfbXRpbWUgPSBzdGF0Lm10aW1lOw0KPj4+Pg0KPj4+PiBTaG91bGQgd2UgcGVyaGFwcyBh
bHNvIGZpbGwgc3RfY3RpbWU/IExlYXZpbmcgaXQgYXQgMCBjb3VsZCBzdXJwcmlzZQ0KPj4+
PiBvdGhlciBzb2Z0d2FyZSBsYXllcnMuDQo+Pj4NCj4+PiBJIGNhbiBzZXQgaXQgdG8gdGhl
IHNhbWUgdmFsdWUgYXMgc3RfbXRpbWUuDQo+Pg0KPj4gTWF5YmUgdGhlIHNtYWxsZXIgb2Yg
YXRpbWUgYW5kIG10aW1lPw0KPiANCj4gVGhhdCdkIGJlIGJldHRlciwgeWVzLg0KDQpBY2Nv
cmRpbmcgdG8gdGhlIHJlZmVyZW5jZXMgSSBjb3VsZCBmaW5kIGN0aW1lIGlzIGNoYW5nZWQg
d2hlbmV2ZXINCmVpdGhlciBmaWxlIGNvbnRlbnRzIE9SIGZpbGUgc3RhdHVzICh1aWQsIGdp
ZCwgcGVybWlzc2lvbnMpIGFyZQ0KbW9kaWZpZWQuIFNvIHVzaW5nIHRoZSBzYW1lIHZhbHVl
IGFzIG10aW1lIHNlZW1zIGFwcHJvcHJpYXRlLg0KDQoNCkp1ZXJnZW4NCg==
--------------x2sEk6Xx3DBccBIYmmETXiO5
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------x2sEk6Xx3DBccBIYmmETXiO5--

--------------sWzNZouI0XYebMzUCklyKNWW--

--------------93VhOJVDM4Aui2kdG0uWoMhH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfhP3oFAwAAAAAACgkQsN6d1ii/Ey/n
hQf+OO6Q3UPo9Z+MUOHsC0v80drmqVbHddPOdqSjQJKzoVnqxLhBcLi2oy8p2GQU/A/wvWIS3XP0
cQ0s4cRzacoOwLq6SGQlI/ms0OUF93mdGD4KjWy9MsSkoDvWOuMQp3du6qK9m3U90gkm85C3PI2N
QE2W2WLokobgz0CaM48D+ozYjfNzdoYllwaJQTYOsz6aSy6WNIHi/yBnrLB+Aa6cs367guuAHA+t
QR6u9Ev/dyZO2+6L5bIdrsNum1u3VIybHboSa5UiTHSM/OvJREZXyk3Uz38OewlQD+yTiUnsu6Cf
a/oF8f1fSv/PiIhbR/loWmNxcz/sEo8AEUlJIOj//w==
=DpCV
-----END PGP SIGNATURE-----

--------------93VhOJVDM4Aui2kdG0uWoMhH--

