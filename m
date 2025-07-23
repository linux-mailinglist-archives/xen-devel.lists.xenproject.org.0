Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5BAB0EAC7
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 08:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053283.1422024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTC7-0004zx-2Y; Wed, 23 Jul 2025 06:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053283.1422024; Wed, 23 Jul 2025 06:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTC6-0004xN-Vy; Wed, 23 Jul 2025 06:43:14 +0000
Received: by outflank-mailman (input) for mailman id 1053283;
 Wed, 23 Jul 2025 06:43:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEQx=2E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ueTC5-0004xH-Tf
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 06:43:14 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48701b03-6790-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 08:43:03 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so5172549f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 23:43:03 -0700 (PDT)
Received: from ?IPV6:2003:e5:8728:2b00:e047:1b8:d101:cf8e?
 (p200300e587282b00e04701b8d101cf8e.dip0.t-ipconnect.de.
 [2003:e5:8728:2b00:e047:1b8:d101:cf8e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45869180a00sm12821415e9.3.2025.07.22.23.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 23:43:02 -0700 (PDT)
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
X-Inumbo-ID: 48701b03-6790-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753252983; x=1753857783; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dnoeKzG19RpGOGpV0YEzElL9L6K4gJ6WTrKdF1ZMa+Q=;
        b=EPJ1m0pLMuab+gT5FPUmt7pbqb1rApln0V6j0kGJlbHToWeYUtuahL4mxrAOr+p/5T
         XkgUpDmwX1HAVsnvdklg3p/XnA8zwqaBVKWRtzJsTv1cawL5XP/WjYx3Jx/jIgS5zfMr
         ZTRFHKkwg6WfvaarzsClxDJX4u5mEdqLm98r4J5ZyGOIU320WtxjbL9Eh7q9kUcNmKAQ
         ymXd6MHgMifkg9jgWLVW7E0kgMfOVpF5hnaOwk+elrMhHOBLbOMnB4Kj8AFZnRyWVKCo
         SEQGQAUKiPMXAty3i0UVPGNGZNonQ2qrwUvrfWpyiJrUKSUUErpv5zMoEFXX7vK9LZxI
         St2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753252983; x=1753857783;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnoeKzG19RpGOGpV0YEzElL9L6K4gJ6WTrKdF1ZMa+Q=;
        b=bfZD/WXL45Ba0r6e3H2Ha/q4z1uwpI0KsS3B8UAvb46DFk36ZCMU4BIjv3JQyMquK5
         0RAyFja9duHJH4/AoTfCMO2SAk/DXs8CLO0yoboRUuCG5u+mgfePYcLyuWZOwdThQ+8K
         wQ3DQBEUME0cR1xMCkca1J1i2Rf8Z9ajf7qeEkwA/z5H1GH2M8kPcEU/4j+0OIWyabvC
         55yEOCe4wnGnaTgyuyefhpk5UMZiK5jIr53iG/BOmhrrMSvyJzyufmngQ+KdzOPwKpB6
         usoybaTt2xPBCzRasm2kf5/IzgSPBBs6Wba/dndWDMRfk6yyXAhta9E+9hlyMr0i/bYp
         CewA==
X-Forwarded-Encrypted: i=1; AJvYcCW5tSu7YnNiVEEGifsc2qIV7AvjfZAays1MsYHZiNO7snPE9vH7zCb1yCQyR1ap1vcKC/7TGSIRuSk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkKe/t1jvcGFMeqdCrlL3RUeuZiOVBz8y+BFYltEohPbnQWaPm
	J+gCycvbgX3bia0OnkwBgMxlrJcgKv9edP0plbTGFx/QXJcOttdm0tbe+kn3wuxALe8=
X-Gm-Gg: ASbGnct6TStZjGv/SdbpnXqzqTkndJ84sNDY24vWq3Uv9NDy0uoB3jB27i6l7+M9Mpk
	A/eDLVFGcwUhdaXZfmP+RV3xDijMcLqQB97fiUXZ8lnh8PvRyZm8fcJ+x+gtU6caLolotTCurNQ
	ckeqjq4y77sCnbHoTpzBuH1wXbA+W1mmKsQbyYm7q5biqxe/1pnjFx9RKRpaUVC9OhHPAOBUfRy
	uZ8Me5H9LL2TRsXU85bDGpbxpNoYanMpF7SoTLBSJ7JJH7L0GU+7ALv0qPB5t+WdSujj+d40hIR
	8CxgHC/WMA4v2WZKtQpf6m2vvJfbBL6xEI3/kKRnD0kHeoyDp1L/zRYBEBYpo2A9U2T41GhSkoh
	vzgxt14XmOLHYEad0R/D8tbeCAgIjjP5V5QCikSbXZ1YssIt4O4miqNARBuPoeUn41JgnOrOE4I
	Rz4o0vj6Fs+AFQx3zRk3sXyNKCnNR9MgnBNGpiZb6qPJh/OXRYuWkZz4Q=
X-Google-Smtp-Source: AGHT+IGSlIBnefhzgOXMTCWAqj7iJq1hqkCJvOIqxl9Jd6bjba48GTiOT2JwRPkgwg6lZKA8N1GKaQ==
X-Received: by 2002:a05:6000:2288:b0:3a6:ec1d:1cba with SMTP id ffacd0b85a97d-3b768cb011dmr1590881f8f.20.1753252982892;
        Tue, 22 Jul 2025 23:43:02 -0700 (PDT)
Message-ID: <5bf07143-46dd-4667-8fa2-d584f48c0b09@suse.com>
Date: Wed, 23 Jul 2025 08:43:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen: Add capabilities to get_domain_state
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250722001958.174294-1-jason.andryuk@amd.com>
 <20250722001958.174294-2-jason.andryuk@amd.com>
 <8e31d4dc-9f20-4af2-a814-d59a40e69fc2@amd.com>
 <bb99eba3-b4ca-4819-8ef7-d3804c2add60@suse.com>
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
In-Reply-To: <bb99eba3-b4ca-4819-8ef7-d3804c2add60@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------efmZViPPLeCE8gCxeKeLAvDf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------efmZViPPLeCE8gCxeKeLAvDf
Content-Type: multipart/mixed; boundary="------------4NP21C5EM0bgR0Y43JmthFlP";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <5bf07143-46dd-4667-8fa2-d584f48c0b09@suse.com>
Subject: Re: [PATCH v3 1/2] xen: Add capabilities to get_domain_state
References: <20250722001958.174294-1-jason.andryuk@amd.com>
 <20250722001958.174294-2-jason.andryuk@amd.com>
 <8e31d4dc-9f20-4af2-a814-d59a40e69fc2@amd.com>
 <bb99eba3-b4ca-4819-8ef7-d3804c2add60@suse.com>
In-Reply-To: <bb99eba3-b4ca-4819-8ef7-d3804c2add60@suse.com>
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

--------------4NP21C5EM0bgR0Y43JmthFlP
Content-Type: multipart/mixed; boundary="------------lKdcZI630v0Lix4EUSPpd0F7"

--------------lKdcZI630v0Lix4EUSPpd0F7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDcuMjUgMDg6MjUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMi4wNy4yMDI1
IDE0OjA5LCBKYXNvbiBBbmRyeXVrIHdyb3RlOg0KPj4gT24gMjAyNS0wNy0yMSAyMDoxOSwg
SmFzb24gQW5kcnl1ayB3cm90ZToNCj4+PiBFeHBvc2UgYSBkb21haW4ncyBjYXBhYmlsaXRp
ZXMgLSBjb250cm9sLCBoYXJkd2FyZSBvciB4ZW5zdG9yZSAtIHRocm91Z2gNCj4+PiBzdGFi
bGUgZ2V0IGRvbWFpbiBzdGF0ZSBoeXBlcmNhbGwuDQo+Pj4NCj4+PiBUaGUgeGVuc3RvcmUg
ZG9tYWluIGNhbiB1c2UgdGhpcyBpbmZvcm1hdGlvbiB0byBhc3NpZ24gYXBwcm9wcmlhdGUN
Cj4+PiBwZXJtaXNzaW9ucyBvbiBjb25uZWN0aW9ucy4NCj4+Pg0KPj4+IFJlcHVycG9zZSB0
aGUgMTZiaXQgcGFkIGZpZWxkIGZvciB0aGlzIHB1cnBvc2UuDQo+Pj4NCj4+PiBTaWduZWQt
b2ZmLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQo+Pj4gUmV2
aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+PiAtLS0NCj4+
PiB2MjoNCj4+PiBJbml0IGluZm8tPmNhcHMgPSAwDQo+Pj4gUmVtb3ZlIHN0YWxlIGNvbW1l
bnQgb24gY2FwcyBmaWVsZA0KPj4+IEFkZCBKdWVyZ2VuJ3MgUi1iDQo+Pj4gLS0tDQo+Pj4g
ICAgeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgIHwgMTAgKysrKysrKysrLQ0KPj4+ICAg
IHhlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaCB8ICA3ICsrKysrLS0NCj4+PiAgICAyIGZp
bGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pj4NCj4+
PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWlu
LmMNCj4+PiBpbmRleCBjMzQ3ZGU0MzM1Li5iYjMzYjFmMWM3IDEwMDY0NA0KPj4+IC0tLSBh
L3hlbi9jb21tb24vZG9tYWluLmMNCj4+PiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jDQo+
Pg0KPj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggYi94ZW4v
aW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4+PiBpbmRleCBmMWY2Zjk2YmMyLi4xMzY4MjBl
YTViIDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaA0KPj4+
ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaA0KPj4+IEBAIC0xMjY5LDggKzEy
NjksMTEgQEAgc3RydWN0IHhlbl9kb21jdGxfZ2V0X2RvbWFpbl9zdGF0ZSB7DQo+Pj4gICAg
I2RlZmluZSBYRU5fRE9NQ1RMX0dFVERPTVNUQVRFX1NUQVRFX1NIVVRET1dOICAweDAwMDIg
IC8qIFNodXRkb3duIGZpbmlzaGVkLiAqLw0KPj4+ICAgICNkZWZpbmUgWEVOX0RPTUNUTF9H
RVRET01TVEFURV9TVEFURV9EWUlORyAgICAgMHgwMDA0ICAvKiBEb21haW4gZHlpbmcuICov
DQo+Pj4gICAgI2RlZmluZSBYRU5fRE9NQ1RMX0dFVERPTVNUQVRFX1NUQVRFX0RFQUQgICAg
ICAweDAwMDggIC8qIERvbWFpbiBkZWFkLiAqLw0KPj4+IC0gICAgdWludDE2X3QgcGFkMDsg
ICAgICAgICAgIC8qIE11c3QgYmUgMCBvbiBpbnB1dCwgcmV0dXJuZWQgYXMgMC4gKi8NCj4+
PiAtICAgIHVpbnQzMl90IHBhZDE7ICAgICAgICAgICAvKiBNdXN0IGJlIDAgb24gaW5wdXQs
IHJldHVybmVkIGFzIDAuICovDQo+Pj4gKyAgICB1aW50MTZfdCBjYXBzOw0KPj4+ICsjZGVm
aW5lIFhFTl9ET01DVExfR0VURE9NU1RBVEVfQ0FQX0NPTlRST0wgICAgIDB4MDAwMSAgLyog
Q29udHJvbCBkb21haW4uICovDQo+Pj4gKyNkZWZpbmUgWEVOX0RPTUNUTF9HRVRET01TVEFU
RV9DQVBfSEFSRFdBUkUgICAgMHgwMDAyICAvKiBIYXJkd2FyZSBkb21haW4uICovDQo+Pj4g
KyNkZWZpbmUgWEVOX0RPTUNUTF9HRVRET01TVEFURV9DQVBfWEVOU1RPUkUgICAgMHgwMDA0
ICAvKiBYZW5zdG9yZSBkb21haW4uICovDQo+Pj4gKyAgICB1aW50MzJfdCBwYWQwOyAgICAg
ICAgICAgLyogTXVzdCBiZSAwIG9uIGlucHV0LCByZXR1cm5lZCBhcyAwLiAqLw0KPj4NCj4+
IEkgaGF2ZSB3b25kZXJlZCBpZiB3ZSBzaG91bGQgdXNlIHNvbWUgb2YgdGhpcyBwYWRkaW5n
IHRvIHN0YXJ0IHJldHVybmluZw0KPj4gdGhlIHZhbGlkIGNhcGFiaWxpdHkgYml0cy4gIFdo
ZW4gdGhlIGh5cGVyY2FsbCAoYW5kIGxpYnJhcnkpIHdpbGwgYmUNCj4+IHJlYWR5IGluIGNh
c2UgdGhlIG51bWJlciBpbmNyZWFzZXMuDQo+IA0KPiBIb3cgd291bGQgYSBjYWxsZXIgdXNl
IHRoYXQgaW5mb3JtYXRpb24/IFRoZSBoeXBlcnZpc29yIHdvdWxkbid0IHJldHVybg0KPiAi
aW52YWxpZCIgYml0cyBzZXQuIChJZiBhbnkgc3VjaCBwbGF1c2libGUgdXNlIGNvdWxkIGJl
IGVudmlzaW9uZWQsIGl0DQo+IGJlaW5nIGEgc3RhYmxlIHN1Yi1vcCwgcHJvdmlkaW5nIHN1
Y2ggaW5mb3JtYXRpb24gd291bGQgY2VydGFpbmx5IG1ha2UNCj4gc2Vuc2UuKQ0KDQpXaGVu
IHNjYW5uaW5nIGFsbCBkb21haW5zIHRoZXJlIGlzIGEgZGlmZmVyZW5jZSBiZXR3ZWVuICJ0
aGVyZSBpcyBubyBkb21haW4NCndpdGggY2FwYWJpbGl0eSBGT08iIGFuZCAiaHlwZXJ2aXNv
ciBkb2Vzbid0IHJlcG9ydCBjYXBhYmlsaXR5IEZPTyIuDQoNClRoZSBxdWVzdGlvbiBpcyB3
aGF0IGEgY2FsbGVyIHdvdWxkIGRvIGluIHRoZSBsYXR0ZXIgY2FzZS4NCg0KPiANCj4+IFRo
ZSBvdGhlciBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byByZXR1cm4gdGhlIGJpdHMgaW4gc29t
ZSBvdGhlciBjYWxsLCBpbg0KPj4gd2hpY2ggY2FzZSB0aGlzIG9uZSB3b3VsZCBub3QgbmVl
ZCB0byBjaGFuZ2UuICBBbmQgcmV0dXJuaW5nIHRoZQ0KPj4gdW5jaGFuZ2luZyB2YWxpZHMg
Yml0cyBvbiBlYWNoIGNhbGwgc2VlbXMgdW5uZWNlc3NhcnkuDQo+IA0KPiBJbmRlZWQuIFll
dCB0aGUgc2FtZSBpbnRlcmZhY2UgY291bGQgc3RpbGwgYmUgdXNlZCAodGhlbiBwZXJoYXBz
IGFsc28NCj4gdG8gaW5kaWNhdGUgdGhlIHZhbGlkIFhFTl9ET01DVExfR0VURE9NU1RBVEVf
U1RBVEVfKiBiaXRzKTogSGF2ZSB0aGUNCj4gY2FsbGVyIHBhc3MgaW4gYW5vdGhlciBzcGVj
aWFsIERPTUlEXyogKERPTUlEX0lOVkFMSUQgYWxyZWFkeSBoYXMgYQ0KPiBtZWFuaW5nLCB0
aG91Z2gpLg0KDQpJJ2QgcmF0aGVyIGdvIHRoaXMgcm91dGUsIGFzIHRoaXMgd291bGQgbm90
IGJ1cm4gYW5vdGhlciBwYWRkaW5nIGZpZWxkIGZvcg0KcmFyZSB1c2UgY2FzZXMuIERPTUlE
X1hFTiBtaWdodCBiZSBhIGdvb2QgZml0Lg0KDQoNCkp1ZXJnZW4NCg==
--------------lKdcZI630v0Lix4EUSPpd0F7
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------lKdcZI630v0Lix4EUSPpd0F7--

--------------4NP21C5EM0bgR0Y43JmthFlP--

--------------efmZViPPLeCE8gCxeKeLAvDf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiAhHUFAwAAAAAACgkQsN6d1ii/Ey8a
bAgAjGAxOCo4ycj207o8F5fk/UvmOzvbT9l4awXzLdye5gSzmItRJjtgIFZFKNbmeaOvfqua5nRR
Qj3K6JW05+YW04rrrwg3hGI398yuBsD+v9WofJLnSh/8KfmJ84wYr3GMvUud8Ww0lROCoV/EA10c
ACMKc7bt+pYL+iImxsQJFHc1T5s/uEVNWysv1HkJ8LXnVyQkDn7LHoL6G3HTqTBFQcbUCQzWa+tm
vSxsGU0NqUxSj0WjEpALidMY1Ux3ssWt2CSSphuV0Tcc7n8neHjWAg/sub2ysEiIQ/QsqauXjjgz
qMXJ6AQavBSAacsmkqp7nek/AjyHfhxX5tAq0kbAUQ==
=uFbu
-----END PGP SIGNATURE-----

--------------efmZViPPLeCE8gCxeKeLAvDf--

