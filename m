Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209E0A9F4A0
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 17:36:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970852.1359417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9QWn-0008Q2-FI; Mon, 28 Apr 2025 15:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970852.1359417; Mon, 28 Apr 2025 15:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9QWn-0008O3-C5; Mon, 28 Apr 2025 15:36:17 +0000
Received: by outflank-mailman (input) for mailman id 970852;
 Mon, 28 Apr 2025 15:36:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WylS=XO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u9QWl-0008Ns-RK
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 15:36:15 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84086b7f-2446-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 17:36:13 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-acbb48bad09so916827266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 08:36:13 -0700 (PDT)
Received: from ?IPV6:2003:e5:870f:e000:6c64:75fd:2c51:3fef?
 (p200300e5870fe0006c6475fd2c513fef.dip0.t-ipconnect.de.
 [2003:e5:870f:e000:6c64:75fd:2c51:3fef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecf9a27sm646515666b.109.2025.04.28.08.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 08:36:12 -0700 (PDT)
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
X-Inumbo-ID: 84086b7f-2446-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745854573; x=1746459373; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XMH7+Ss3l1t5Ls+cH3/cseOt9piC4sPKG8qdQbIfRmM=;
        b=KzjXFyjwOCpP977X+2J+z99HN/wt48Xz1W6H2liYHKJyK2ZUXv9k6fy4VvOCSk0svX
         jo3+uXLj94m00Mslk1/LEiqVaB5KZ/gCyDKt4Bo7DkNYPn8eGopnyKujGmScL77I8jAo
         EHaiQQ+f7xZuEoYQNTpEBLk7XW7JayxKZl3AgRE/cP1Etgx0EzoAws+S33BlDvkhR7pL
         wJ8NWAUAx9aonmYJAjb0sb/773DzqyfbSRLMFzWMpqltPok0sFGrQkSudrTNFk+BCbCW
         gpgQubQx6p48Ot4XqT5wRqX+IR5oV2atWBuN9CIoyyX2hdS9becb2NnwvRJdLUCpso3S
         Q+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745854573; x=1746459373;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XMH7+Ss3l1t5Ls+cH3/cseOt9piC4sPKG8qdQbIfRmM=;
        b=jmTz7B+Fw2G5a/LCgQqXQyn8GE3jPmzSXzT3ZzaWvQtYcV5joMwTsKvRi+GT6VFdR3
         3OXMjsnnrtNaOThJBPpeealR1RW5SoeC2NRage2gtmQqte8oRlux8pEcriudfC9+wkfg
         zRqj93675MyhjzFAmiGDGXLrVpUUqrNd61Q/UMXI7nRl4g+jp+mERAi5mPl9DNov76Yb
         pVM4J5euLtiygMITPY9NTkB5WM0UclztKCARVYAqs+3Y6flXDN9rY9sGKB08H1nCunkA
         QTg9cxRQXL/TqUptnZKdKxHqMJFEfFHK/tG+UzyGsyl6cOnGkYC23donZz2rLY70KZg2
         RCLA==
X-Gm-Message-State: AOJu0YzgHR8OHH3QW5bYN7JwMulXfaCioGNmpM+RhMC/hnkaB3WPM0tA
	SVAI5N3n3A+gY/yFTfwNcTZDLqAkI1Wo0ecdoo96L9UckHXSIu1T+78E6uEwL+0=
X-Gm-Gg: ASbGncuQ6PJ8qf4X6NuFj69ewF1UZ3YVFOKevTBcv1VF54w6wEyBdRyOP331llZuQtv
	xiK4QF6wffLxdPt+5GLzpmURw1lKoeOqZiiLi9uv08JZXGzz9hsLcA0IBu6OisTa3N1seyXK7yh
	pgxz+7zDEsnBomuZ/rHl23h+//F1FK/w+7SPIawy2hLzdo3HEw0Iqw2w2IeG2v3cnEYYXHaByXF
	s4PQfN7VrAG5buM+p+qRk/7bUNZ0Q8uemeT5p8a+AcGsq4fMj5ZG7BSuRrXc9prU7jGPAQRDEoO
	T0DVeq5d15/j8c74JilhXdyV25NMTGMx5W+W04GKpAiIeBnAAIXJs3aWSkiNrHabQfXnMiy1FHF
	JjgEPemMDlMHoWwTESSOEFE3uvx1t5tJpHsB67zro8qh25KWk3pAWgpjrzW7Htl9KjA==
X-Google-Smtp-Source: AGHT+IEeJP3jc5S78SdNB8IkcDgM4viBTdONcQGNIAXKyGd8YrbSXzdNcY/BCiePr50ptTVKq1+3hg==
X-Received: by 2002:a17:907:724f:b0:acb:893:8c40 with SMTP id a640c23a62f3a-ace84901512mr951285266b.19.1745854572543;
        Mon, 28 Apr 2025 08:36:12 -0700 (PDT)
Message-ID: <37697ba6-ea59-410a-abe4-c64173596110@suse.com>
Date: Mon, 28 Apr 2025 17:36:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] docs: remove qemu-traditional support from
 documentation
To: Alejandro Vallejo <agarciav@amd.com>,
 Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-3-jgross@suse.com> <aAoHOrcZ5LlhEObL@l14>
 <D9IDA8NYNZUG.2Z1IGCDV4YI5Y@amd.com>
 <198ec36e-15e3-491a-bd15-d440d9d578da@suse.com>
 <D9IDPE8Q5XKK.2CSC9N1BMSU2Y@amd.com>
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
In-Reply-To: <D9IDPE8Q5XKK.2CSC9N1BMSU2Y@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6aU92H0hM755FqMg01KRAJUR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6aU92H0hM755FqMg01KRAJUR
Content-Type: multipart/mixed; boundary="------------a0Lh8OLuPcpQZ2BrTEvNngJh";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Alejandro Vallejo <agarciav@amd.com>,
 Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
Message-ID: <37697ba6-ea59-410a-abe4-c64173596110@suse.com>
Subject: Re: [PATCH v2 2/6] docs: remove qemu-traditional support from
 documentation
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-3-jgross@suse.com> <aAoHOrcZ5LlhEObL@l14>
 <D9IDA8NYNZUG.2Z1IGCDV4YI5Y@amd.com>
 <198ec36e-15e3-491a-bd15-d440d9d578da@suse.com>
 <D9IDPE8Q5XKK.2CSC9N1BMSU2Y@amd.com>
In-Reply-To: <D9IDPE8Q5XKK.2CSC9N1BMSU2Y@amd.com>
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

--------------a0Lh8OLuPcpQZ2BrTEvNngJh
Content-Type: multipart/mixed; boundary="------------udC0z1u6uIsH99H1NhPqV9Yc"

--------------udC0z1u6uIsH99H1NhPqV9Yc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDQuMjUgMTc6MzEsIEFsZWphbmRybyBWYWxsZWpvIHdyb3RlOg0KPiBPbiBNb24g
QXByIDI4LCAyMDI1IGF0IDQ6MTUgUE0gQlNULCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4g
T24gMjguMDQuMjUgMTc6MTIsIEFsZWphbmRybyBWYWxsZWpvIHdyb3RlOg0KPj4+IE9uIFRo
dSBBcHIgMjQsIDIwMjUgYXQgMTA6NDEgQU0gQlNULCBBbnRob255IFBFUkFSRCB3cm90ZToN
Cj4+Pj4gT24gVHVlLCBBcHIgMDgsIDIwMjUgYXQgMDI6MzU6MjBQTSArMDIwMCwgSnVlcmdl
biBHcm9zcyB3cm90ZToNCj4+Pj4+IEBAIC0xOTAzLDEwICsxODk0LDcgQEAgaXQgbWF5IGJl
IHVzZWZ1bCB0byByZXF1ZXN0IGEgZGlmZmVyZW50IG9uZSwgbGlrZSBVRUZJLg0KPj4+Pj4g
ICAgDQo+Pj4+PiAgICA9aXRlbSBCPHJvbWJpb3M+DQo+Pj4+PiAgICANCj4+Pj4+IC1Mb2Fk
cyBST01CSU9TLCBhIDE2LWJpdCB4ODYgY29tcGF0aWJsZSBCSU9TLiBUaGlzIGlzIHVzZWQg
YnkgZGVmYXVsdA0KPj4+Pj4gLXdoZW4gQjxkZXZpY2VfbW9kZWxfdmVyc2lvbj1xZW11LXhl
bi10cmFkaXRpb25hbD4uIFRoaXMgaXMgdGhlIG9ubHkgQklPUw0KPj4+Pj4gLW9wdGlvbiBz
dXBwb3J0ZWQgd2hlbiBCPGRldmljZV9tb2RlbF92ZXJzaW9uPXFlbXUteGVuLXRyYWRpdGlv
bmFsPi4gVGhpcyBpcw0KPj4+Pj4gLXRoZSBCSU9TIHVzZWQgYnkgYWxsIHByZXZpb3VzIFhl
biB2ZXJzaW9ucy4NCj4+Pj4+ICtMb2FkcyBST01CSU9TLCBhIDE2LWJpdCB4ODYgY29tcGF0
aWJsZSBCSU9TLg0KPj4+Pg0KPj4+PiBUaGlzIG9wdGlvbiBpcyBub3QgdmFsaWQgYW55bW9y
ZSwgbGlieGwgd2lsbCBjb21wbGFpbiB3aXRoOg0KPj4+PiAgICAgICAicWVtdS14ZW4gZG9l
cyBub3Qgc3VwcG9ydCBiaW9zPXJvbWJpb3MuIg0KPj4+DQo+Pj4gU291bmRzIGxpa2UgYSBn
b29kIHRpbWUgdG8gcmVtb3ZlIGJpb3M9cm9tYmlvcyBhbHRvZ2V0aGVyIGFuZCBzdHJpY3Rs
eQ0KPj4+IHN1cHBvcnQgYmlvcz1zZWFiaW9zIG9ubHkgKHBsdXMgdGhlIG92ZXJyaWRlKS4N
Cj4+DQo+PiBGaW5lIHdpdGggbWUuDQo+Pg0KPj4gQnV0IHByb2JhYmx5IHdlIHNob3VsZCBO
T1QgZHJvcCBidWlsZGluZyBSb21CSU9TLCByaWdodD8NCj4gDQo+IE9uIHN0YWdpbmcvbWFz
dGVyPyBJIGRvbid0IHRoaW5rIHdlIG91Z2h0IHRvIHdhc3RlIGN5Y2xlcyByZWJ1aWxkaW5n
IGl0Lg0KPiBJdCdkIG9ubHkgYmUgYSBkZXBlbmRlbmN5IGZvciBzdGFibGUgdHJlZXMsIHNv
IHNob3VsZG4ndCBpdCBiZSBidWlsdA0KPiB0aGVyZSBpbnN0ZWFkPyBUaGVuIGJ5IHRoZSB0
aW1lIHdlIGRvbid0IHN1cHBvcnQgaXQgaW4gc3RhYmxlIGVpdGhlcg0KPiAoYmVjYXVzZSB0
aGV5IGFsbCB3ZW50IEVPTCkgaXQnZCBuYXR1cmFsbHkganVzdCBzdG9wIGJlaW5nIGJ1aWx0
Lg0KPiANCj4gVGhlIG1lY2hhbmljcyBvZiBob3cgdGhhdCB3b3VsZCB3b3JrIEknbSBub3Qg
c3VyZS4gV2UgaGF2ZSBwZXINCj4gc3RhYmxlLXRyZWUgcGlwZWxpbmVzLiBEbyB0aGV5IGJ1
aWxkIGV2ZXJ5dGhpbmcsIEFudGhvbnk/DQoNClNvcnJ5LCBJIHBocmFzZWQgdGhhdCB3cm9u
Zy4NCg0KSSBtZWFudCB3ZSBzaG91bGRuJ3QgcmVtb3ZlIFJvbUJJT1MgZnJvbSB0aGUgdHJl
ZS4NCg0KDQpKdWVyZ2VuDQo=
--------------udC0z1u6uIsH99H1NhPqV9Yc
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------udC0z1u6uIsH99H1NhPqV9Yc--

--------------a0Lh8OLuPcpQZ2BrTEvNngJh--

--------------6aU92H0hM755FqMg01KRAJUR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgPoGsFAwAAAAAACgkQsN6d1ii/Ey+R
QAf/UMIZtDkjwENyq452YKbqavSkXLiahlPIwoG+VPst/AdVUj86L+TuypCFPbghXn+LoeEYBafe
pRNa5hmqCpv8DPx/jWzz6OPKkUNOZ/UyOyco+ZC81FmSmd3TVTEZ4+neDHjywqV5v+DbMc+WOEYn
wJ2q+Au6QLkDGIpncubnXnqXRThwFp/TgNTHEsqeV9pKooyKHQLC+Vpcgolup9g57dfeJa7FC9pj
s2QY3sb+lF5OBXkORdBUNmJz64iNBoYnp0B2pjpGdAXpQbWlCFjBoApNaSj0v9tsnEXZBhJt1pZe
R8wcC31KUsO0W+8BBfQqTR+xpI0E5eEUL09Wng3D9w==
=QziJ
-----END PGP SIGNATURE-----

--------------6aU92H0hM755FqMg01KRAJUR--

