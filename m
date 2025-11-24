Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881F3C81327
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 15:58:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171269.1496287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNY1P-0005oz-6l; Mon, 24 Nov 2025 14:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171269.1496287; Mon, 24 Nov 2025 14:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNY1P-0005mV-43; Mon, 24 Nov 2025 14:58:31 +0000
Received: by outflank-mailman (input) for mailman id 1171269;
 Mon, 24 Nov 2025 14:58:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fNsn=6A=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vNY1N-0005X4-UJ
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 14:58:30 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08a88b30-c946-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 15:58:28 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b7380f66a8bso654461366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 06:58:28 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654ff3962sm1323502766b.50.2025.11.24.06.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 06:58:26 -0800 (PST)
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
X-Inumbo-ID: 08a88b30-c946-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763996307; x=1764601107; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U9rb1EscELxNAsWw5LAgHmqeO7FGxuvs8IaqTiD5V+0=;
        b=cPDYhsOXiNJnOWkgQTnTd/NnEBsTK/cQm2M+3BYlz8gIiP9JbPvE6NVZHM4fuiGE0s
         eL9s9ZAeALC2EOkEhMl/WnJxb+Pa3L01ZIrjDMaHKBk0SWYKRlCITg6HtBuXqFi9bVNy
         2h6IqB59Sb4K+9P5vTuNQmIggPyzRpwSvscUJbE8UhG+HPmMCsgmnaKICkRTRpr7aTST
         7fWLsblmPLFSqJF95RV2owTrLMPWBasVcSMfpqhQRvYhlfTl4jJsKVmgzu3pQaPkpiq4
         Hky5/rVPrsAqnUri1Oew4wTnfOzuGCIBrTi7R1Fh7aLEH1LWc0VJeqS3SGA2hdCl1F8K
         Jqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996307; x=1764601107;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U9rb1EscELxNAsWw5LAgHmqeO7FGxuvs8IaqTiD5V+0=;
        b=btoJ5WUhtxiAMXDLnwmhMu6Ka7QHmFatDXP5W7nz5eRwqFN1ELT/nfT1/jKvVrdxWS
         kSM22lKbjVI1tqoX0Y/67VNf3iha/FToN1dSrb2oFzgA76zYjJklXuUiEDrguCCPKGel
         37tDM673kI8CeG74WftPcuMqYxxfxNqNdenzbnjtjPj7lJt7h3zCAWEBiE54fiCNOIlV
         TzaJA16xH9iR4uxlNNbyltL4WMp9zHH3IakMdmutFt1S2x6HHmJ30kUOb+gkzAvX0dkC
         ZBJmtOkWTLXGSkHg3JNIoAzZhFrg8c4uhBMsyckDe4fhJ3BwcuLquDrXp3z3KxtxFyvU
         x4uw==
X-Forwarded-Encrypted: i=1; AJvYcCXV9Cv/jvAZpZxBYMbqAIrK8jtfE29oIWTv87qWOOUJ9sYyUCZtfSQw2XcuowAjJ18w+gXgOmjfBeY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYTyqlvhX4rIDEu5WhC3NcErS3X73qEnUjfb+3BBvz+HQRaXG0
	H70JN3KSzLAZ/q+hGm/GOB0GvyP4ma15LEASatVT5TBb6GPeVuHJkojnnSIlI7dgkRCSLoSbbDk
	upDqQjvs=
X-Gm-Gg: ASbGncvkSkpxy/3feguODhcqp6ixtfwGTQ1tTYhpBC3ijca7cbFqZJunPaR3OR8e3lk
	P3+0EaLYE6Hiaxy8dgvwqiCn2EyCQG9IccN+t2lPALA20YZwGT45BSjT65yil/8u1RUYgqZ6U7H
	jwYnste/rJq8coQGNWj/N/rY4r6wZicNd4FJNDeT01WLPdZWP4K+Nx7HsepW+n4SR+NXmzf32Hz
	RLy397TgllGitoXreo4Qwz0eWMzEifUI7aNicdcF3Qjw9N2+KdGik9h76UlMwJ/ynC9qKolg5QR
	jUCHwuqLP3LKv9TvaGnItxiJmmad8KNsdzEqqhMQNEBZz7xHgHC8jCrCYSqCWf5VuWh4m+Har8T
	Fk+OpTSVQkkDoKlG9KWk0uAKpx2L7RW+h7kYkRyxuoNqOCvCXouAcbj51miMZ6D/1WnhkD/8ZI+
	xkz4uc5yWb/Lcvbn+BnWBCxvrycKqxRVG1nkb7cTlM74FHCjwm7x0ZcGy7aW8WfhnjzKFDsZYt0
	cmzWqCLPYY+5LSWsA6LTmzNuClDT6ig2o6RhRBBwzCo4Wm4rg==
X-Google-Smtp-Source: AGHT+IFk8jNGFyyTeWcu/H0tSooc89TK/+Apk8XFpZHsy0ys/N4hCQ4amFtiehdZf7WVDYmhaOarfA==
X-Received: by 2002:a17:907:6095:b0:b73:a0b9:181a with SMTP id a640c23a62f3a-b7671a241eemr1324497466b.54.1763996307314;
        Mon, 24 Nov 2025 06:58:27 -0800 (PST)
Message-ID: <158df666-9359-4fe8-976b-f194a1fb317b@suse.com>
Date: Mon, 24 Nov 2025 15:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <d34e3e86-c51a-49b3-8b46-140526755f0f@suse.com>
 <826037a5-dacf-434f-90d9-8f12e61bdd6e@suse.com>
 <0ece9df6-8a04-4ffa-bcf4-d7a3fd4bbef4@suse.com>
 <bf7e1a66-1696-477a-bdef-79b08df0b57c@suse.com>
 <bbcaf4f2-c52e-4b3e-ab6a-ca5020a8b786@suse.com>
 <a593e8cb-fa56-4301-a7da-ca4b51dfab9a@suse.com>
 <39df58e5-6b04-45fb-bd25-8ebc8972a7ed@suse.com>
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
In-Reply-To: <39df58e5-6b04-45fb-bd25-8ebc8972a7ed@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KfZZ9JXhHAtruW06WPwZqx4A"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KfZZ9JXhHAtruW06WPwZqx4A
Content-Type: multipart/mixed; boundary="------------h6FyQEcYkNdaApCR32iRpqQB";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <158df666-9359-4fe8-976b-f194a1fb317b@suse.com>
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <d34e3e86-c51a-49b3-8b46-140526755f0f@suse.com>
 <826037a5-dacf-434f-90d9-8f12e61bdd6e@suse.com>
 <0ece9df6-8a04-4ffa-bcf4-d7a3fd4bbef4@suse.com>
 <bf7e1a66-1696-477a-bdef-79b08df0b57c@suse.com>
 <bbcaf4f2-c52e-4b3e-ab6a-ca5020a8b786@suse.com>
 <a593e8cb-fa56-4301-a7da-ca4b51dfab9a@suse.com>
 <39df58e5-6b04-45fb-bd25-8ebc8972a7ed@suse.com>
In-Reply-To: <39df58e5-6b04-45fb-bd25-8ebc8972a7ed@suse.com>
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

--------------h6FyQEcYkNdaApCR32iRpqQB
Content-Type: multipart/mixed; boundary="------------nAAYj5ZWyrUZO1qvVgNZt8XL"

--------------nAAYj5ZWyrUZO1qvVgNZt8XL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjUgMTU6MzAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4xMS4yMDI1
IDEzOjQ1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMjQuMTEuMjUgMTM6MTgsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI0LjExLjIwMjUgMTI6MjcsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE9uIDI0LjExLjI1IDEyOjE1LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDI0LjExLjIwMjUgMTI6MDUsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4+
Pj4gT24gMjQuMTEuMjUgMTE6NDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+PiBPbiAy
MS4xMS4yMDI1IDE0OjIzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4+Pj4gLS0tIGEv
Q29uZmlnLm1rDQo+Pj4+Pj4+PiArKysgYi9Db25maWcubWsNCj4+Pj4+Pj4+IEBAIC0xNTks
NiArMTU5LDE5IEBAIGRlZmluZSBtb3ZlLWlmLWNoYW5nZWQNCj4+Pj4+Pj4+ICAgICAgCWlm
ICEgY21wIC1zICQoMSkgJCgyKTsgdGhlbiBtdiAtZiAkKDEpICQoMik7IGVsc2Ugcm0gLWYg
JCgxKTsgZmkNCj4+Pj4+Pj4+ICAgICAgZW5kZWYNCj4+Pj4+Pj4+ICAgICAgDQo+Pj4+Pj4+
PiArUEFUSF9GSUxFUyA6PSBQYXRocw0KPj4+Pj4+Pj4gK0lOQ19GSUxFUyA9ICQoZm9yZWFj
aCBmLCAkKFBBVEhfRklMRVMpLCAkKFhFTl9ST09UKS9jb25maWcvJChmKS5taykNCj4+Pj4+
Pj4+ICsNCj4+Pj4+Pj4+ICtpbmNsdWRlICQoSU5DX0ZJTEVTKQ0KPj4+Pj4+Pj4gKw0KPj4+
Pj4+Pj4gK0JVSUxEX01BS0VfVkFSUyA9ICQoZm9yZWFjaCBmLCAkKFBBVEhfRklMRVMpLCAk
KHNoZWxsIGF3ayAnJCQyID09ICI6PSIgeyBwcmludCAkJDE7IH0nICQoWEVOX1JPT1QpL2Nv
bmZpZy8kKGYpLm1rLmluKSkNCj4+Pj4+Pj4NCj4+Pj4+Pj4gRmVlbHMgbGlrZSBteSBwcmlv
ciBjb21tZW50cyB3ZXJlbid0IHJlYWxseSBhZGRyZXNzZWQuIEkgY29udGludWUgdG8gdGhp
bmsgdGhhdA0KPj4+Pj4+PiBub25lIG9mIHRoZSBhYm92ZSBpcyBwYXJ0IG9mIHdoYXQgdGhl
IHN1YmplY3Qgc2F5cy4NCj4+Pj4+Pg0KPj4+Pj4+IEkgcmVhbGx5IGRvbid0IHVuZGVyc3Rh
bmQgeW91ciBjb25jZXJuIGhlcmUuDQo+Pj4+Pj4NCj4+Pj4+PiBGb3IgcmVwbGFjaW5nIHRo
ZSBAbWFya2Vyc0AgbWFrZSBuZWVkcyB0byBrbm93IHdoYXQgc2hvdWxkIGJlIHJlcGxhY2Vk
Lg0KPj4+Pj4+IFNvIGl0IG5lZWRzIHRvIHNjYW4gdGhlIGZpbGVzIGNvbnRhaW5pbmcgdGhl
IG1hcmtlcnMgYW5kIGdhdGhlciB0aGVtLg0KPj4+Pj4+IFRoaXMgaXMgd2hhdCBpcyBkb25l
IGFib3ZlLg0KPj4+Pj4+DQo+Pj4+Pj4gSW4gdGhlIGZpbmFsIG1hY3JvIGJlbG93IHRoZSBy
ZXBsYWNlbWVudHMgYXJlIGRvbmUgdGhlbi4gSG93IHdvdWxkIHlvdQ0KPj4+Pj4+IGhhbmRs
ZSB0aGF0Pw0KPj4+Pj4NCj4+Pj4+IEJ5IHBhc3NpbmcgKGFub3RoZXIpIGFyZ3VtZW50IHRv
IHRoZSBtYWNybywgZm9yIGV4YW1wbGUuIEFzIGluZGljYXRlZA0KPj4+Pj4gZWFybGllciwg
ZGlmZmVyZW50IHN1Yi10cmVlcyBtYXkgaGF2ZSBkaWZmZXJlbnQgcGxhY2VzIHdoZXJlIHRo
ZXNlDQo+Pj4+PiBkZWZpbml0aW9ucyBsaXZlLCBhbmQgdGhleSB3b3VsZCB3YW50IHRvIGJl
IGFibGUgdG8gcGFzcyB0aGF0IGluDQo+Pj4+PiAoaWRlYWxseSB3aXRob3V0IG5lZWRpbmcg
dG8gcHV0IHRoaXMgaW4gYSBjb21tb24gcGFydCBvZiB0aGUgdHJlZSkuDQo+Pj4+DQo+Pj4+
IEkgZG9uJ3QgZ2V0IHdoYXQgeW91IHdhbnQgdG8gcGFzcyBpbiBhZGRpdGlvbmFsbHkuDQo+
Pj4+DQo+Pj4+IEkndmUgYWxyZWFkeSBjaGFuZ2VkIHRoZSBtYWNybyBhbmQgdGhlIE1ha2Vm
aWxlcyB0byBiZSBhYmxlIHRvIGFkZCBhbm90aGVyDQo+Pj4+IG1hcmtlciBmaWxlIHRvIHRo
ZSBQQVRIX0ZJTEVTIHZhcmlhYmxlLiBXaGF0IGVsc2UgZG8geW91IG5lZWQ/DQo+Pj4NCj4+
PiBXZWxsLCB0aGF0J3Mgc2ltcGx5IGFuIG9kZCB3YXkgb2YgcGFzc2luZyBhIHBhcmFtZXRl
ci4gUGx1cywgdGhlIGV4dHJhIGZpbGUNCj4+DQo+PiBXZSBkbyB0aGF0IGFsbCB0aGUgdGlt
ZXMsIGUuZy4gYnkgIk9CSi15ICs9IC4uLiINCj4gDQo+IFRoYXQncyBzdWZmaWNpZW50bHkg
ZGlmZmVyZW50IHRob3VnaDogQWNjdW11bGF0aW5nIHRoZSBzZXQgb2Ygb2JqZWN0cyB0bw0K
PiBwcm9kdWNlIGlzIGtpbmQgb2YgbmF0dXJhbGx5IGRvbmUgdGhhdCB3YXkuDQo+IA0KPj4+
IHdvbid0IGFmZmVjdCBJTkNfRklMRVMsIG9yIG1vcmUgcHJlY2lzZWx5IGl0cyB1c2UgaW4g
dGhlIGluY2x1ZGUgZGlyZWN0aXZlDQo+Pj4gaW4gcGF0Y2ggMTogQXQgbGVhc3QgYWl1aSwg
JChJTkNfRklMRVMpIGlzIGV4cGFuZGVkIGF0IHRoZSBwb2ludCB3aGVuIHRoZQ0KPj4+IGRp
cmVjdGl2ZSBpcyBwcm9jZXNzZWQuIEhlbmNlIHdoeSB5b3UgbmVlZCB0byBvcGVuLWNvZGUg
YW5vdGhlciBpbmNsdWRlDQo+Pj4gdGhlcmUuDQo+Pg0KPj4gVGhlIElOQ19GSUxFUyB2YXJp
YWJsZSBpcyBtb3N0bHkgbmVlZGVkIGZvciBzcGVjaWZ5aW5nIHRoZSBkZXBlbmRlbmNlIG9m
DQo+PiB0aGUgZ2VuZXJhdGVkIGZpbGVzIG9uIHRoZSBmaWxlcyBtZW50aW9uZWQgaW4gUEFU
SF9GSUxFUy4NCj4+DQo+PiBJdCBtaWdodCBiZSBiZXR0ZXIgdG8ganVzdCBoYXZlICItaW5j
bHVkZSAkKFhFTl9ST09UL2NvbmZpZy9QYXRocy5tayIgaW4NCj4+IENvbmZpZy5taywgbWF0
Y2hpbmcgdGhlIHNldHRpbmcgb2YgUEFUSF9GSUxFUyB0aGVyZS4NCj4gDQo+IExvb2tpbmcg
YXQgdGhpcyB0aGUgM3JkIG9yIDR0aCB0aW1lIG5vdywgSSBzdGlsbCBkb24ndCBxdWl0ZSBn
ZXQgd2h5IHRoZQ0KPiBpbmNsdWRlIGlzIG5lZWRlZCBpbiB0aGUgZmlyc3QgcGxhY2UuIFlv
dSBkb24ndCBtZWFuIHRvIHVzZSAocmlnaHQgaGVyZSkNCj4gYW55IG9mIHRoZSBzZXR0aW5n
cyB0aGUgZmlsZSBwcm9kdWNlcywgZG8geW91PyBSZWFsbHksIGFzIGFsc28gbWVudGlvbmVk
DQo+IGJ5IEFuZHJldywgeW91IHJlYWxseSBjYW4ndCwgYmVjYXVzZSBpbiBhIHB1cmUgaHlw
ZXJ2aXNvciBidWlsZCB0aGUgZmlsZQ0KPiB3b3VsZG4ndCBoYXZlIGJlZW4gbWFkZSwgYXMg
bm8gY29uZmlndXJlIHdvdWxkIGhhdmUgcnVuLg0KPiANCj4gSWYgSSdtIG5vdCBtaXN0YWtl
biwgeW91IHJlYWxseSBuZWVkIHRob3NlIHZhbHVlcyBvbmx5IGF0IHRoZSB0aW1lIHlvdQ0K
PiBleGVjdXRlIHRoZSBydWxlLiBBbmQgSSdtIHdvcnJpZWQgb2YgdGhlc2UgZGVmaW5pdGlv
bnMgdG8gY29sbGlkZSB3aXRoDQo+IHNvbWV0aGluZyBlbHNlLiBIZW5jZSBvbmUgZGVzaXJl
IHdvdWxkIGJlIHRvIGxpbWl0IHRoZSBzY29wZSBvZiB0aGVzZQ0KPiB2YXJpYWJsZXMgdG8g
anVzdCB0aGUgbmV3IHJ1bGUuIE1heWJlIHNvbWV0aGluZyBsaWtlDQo+IA0KPiAjIFJlcGxh
Y2UgQHh4eEAgbWFya2VycyBpbiAkKDEpLmluIHdpdGggJCh4eHgpIHZhcmlhYmxlIGNvbnRl
bnRzLCB3cml0ZSB0byAkKDEpDQo+IGRlZmluZSBhcHBseS1idWlsZC12YXJzDQo+ICQoMSk6
ICQkKHNoZWxsIGdyZXAgLWggOj0gJCQod2lsZGNhcmQgJCQoSU5DX0ZJTEVTKSkgL2Rldi9u
dWxsKQ0KPiAkKDEpOiAkKDEpLmluICQkKElOQ19GSUxFUykNCj4gCXNlZCAkJChmb3JlYWNo
IHYsICQkKEJVSUxEX01BS0VfVkFSUyksIC1lICdzI0AkJCh2KUAjJCQoJCQodikpI2cnKSA8
JCQ8ID4kJEANCj4gZW5kZWYNCj4gDQo+IGNvdWxkIHdvcms/IChUaGlzIGxpa2VseSBkZXBl
bmRzIG9uIElOQ19GSUxFUyB0byBvbmx5IGxpc3QgZmlsZXMgd2hpY2gNCj4gYXJlIGNvbmZp
Z3VyZSBnZW5lcmF0ZWQsIGkuZS4gd291bGRuJ3QgYmUgdXBkYXRlZCBieSBhIG1ha2UgcnVs
ZS4pDQoNCkFuZCB3aG8gaXMgc2V0dGluZyBCVUlMRF9NQUtFX1ZBUlM/IFlvdSBkaWRuJ3Qg
dGhpbmsgdGhlIHNuaXBwZXQgZG9pbmcgdGhhdA0Kc2hvdWxkIGJlIHRoZXJlLg0KDQpBbmQg
VEJIOiBhbnkgc2V0dGluZyBmcm9tIFBhdGhzLm1rIGNvbGxpZGluZyB3aXRoIHNvbWV0aGlu
ZyBlbHNlIHdvdWxkDQpfcmVhbGx5XyBiZSB3b3JyeWluZy4NCg0KDQpKdWVyZ2VuDQo=
--------------nAAYj5ZWyrUZO1qvVgNZt8XL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------nAAYj5ZWyrUZO1qvVgNZt8XL--

--------------h6FyQEcYkNdaApCR32iRpqQB--

--------------KfZZ9JXhHAtruW06WPwZqx4A
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkkcpIFAwAAAAAACgkQsN6d1ii/Ey/P
IQgAmYwCahGNGk700O6IbJK+jXQzsY2iSGHqiRdF7hOlpqeZLZDbZWQlhZHWR3apCJdLH0AK8NOP
RvtI7eHvkUlQTCZxEIgDunWYPb8U+6opjpOAYFEZzKk+LSpM8lo6fTBOuJhl8cksbOu++sTah7bO
VSrhU8s0/Wtbuh3ZBDcnZ1ga1Vpr7e2KLESfHpajmhOsZydgRhGs1wnNgsPT42H5q/PP4lx/kPuk
yfLgnDsEddBpcHO940FnGkZnUSw1eZYlcX0Ugp8rY08mPRL4pboerjwsifEi9soEdkSXgfy6qLJL
KyOzPa0yIorxK7VemSKtKmVgrNqg0s2HNZkviaUXog==
=bqS3
-----END PGP SIGNATURE-----

--------------KfZZ9JXhHAtruW06WPwZqx4A--

