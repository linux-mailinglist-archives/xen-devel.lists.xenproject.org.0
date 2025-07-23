Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CE0B0EB09
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 08:55:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053333.1422093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTNf-0001Te-Ir; Wed, 23 Jul 2025 06:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053333.1422093; Wed, 23 Jul 2025 06:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTNf-0001R6-G3; Wed, 23 Jul 2025 06:55:11 +0000
Received: by outflank-mailman (input) for mailman id 1053333;
 Wed, 23 Jul 2025 06:55:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEQx=2E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ueTNe-0000eV-8A
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 06:55:10 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8671aca-6791-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 08:55:08 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-608acb0a27fso10066365a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 23:55:08 -0700 (PDT)
Received: from ?IPV6:2003:e5:8728:2b00:e047:1b8:d101:cf8e?
 (p200300e587282b00e04701b8d101cf8e.dip0.t-ipconnect.de.
 [2003:e5:8728:2b00:e047:1b8:d101:cf8e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c8f36fb0sm8019709a12.21.2025.07.22.23.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 23:55:07 -0700 (PDT)
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
X-Inumbo-ID: f8671aca-6791-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753253708; x=1753858508; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6r7JnVkxALQi/57RKxWidhxMBZFhTBZr2OCXNmjP27k=;
        b=e5IGNjHzJk4DI2nm1q9TdAGP2C9p2qXnme0jf+3nfoxCJS66tl2slzGvGgbHllRw3J
         f/y7NkOqO+OCUQo5EaxUd+ue7WlO9T8cYUb3XytEY+7H8qAlLV58sTClV9MI+u5UQOLb
         5IXGuY6AnQu8cf4AKkFGZtGa+FjYTyx0vPr1ati8Iy5JwGTBa8loatRpUG57dkHzmM9K
         pM3PFEpXOrpfwHEh+ersq2Z34doTfF7exXqGiwspJ1Ru8mByahDTlccOiSIn2sownSwZ
         h48YV0bXDpS3iwW2WA2QebsXe2OdNTBuloT8TmQ9o1Ltx9pCeaO5U2Snx+WIvmm0KU1x
         B5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753253708; x=1753858508;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6r7JnVkxALQi/57RKxWidhxMBZFhTBZr2OCXNmjP27k=;
        b=XJiqY8vJEXqHde9M30/I8VWiIC7U1ahp0HAYYI/wl032hIC+LKlWnLrpzIc3PiJqhC
         laLEg2ZGZ/0vXAzH9sqnIscRGR/csGTeI6RQLWy9Deqm7Kbjec8JgO4sDcVM5Ciz05MK
         RN1v3OPq3B2d/tkCy1vW46bYjJcjOvXhNkM0r6QXREIe2+ca36jMwNhoupn1WwL/GtaW
         jPx2F3WEUiSQxnF6DPd/+YQ9B12DjbmIWa3jmuZDkfenCr3LTwHAg9F/mJzV5EIyg1Ly
         5J3VaVYMiFE0DZujrUBpd7e2Td4I1rhKIpnkjM7OjdS8LC3bKF22HhZCTw6PzTdbDMWu
         I2XA==
X-Forwarded-Encrypted: i=1; AJvYcCULRel2B17EoKyHvc61ojc8IZPJCYjJZe/F11KN2zPGBArUx6ssEYLk7PzDv+WlOok35B8JzxP2Itg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyi3fwvPUtXxqVqDFvuyWrOTVUpjmIIQEMi5hjD7ltID6hqdllM
	9iKsTUcB0gm0KbfCZpaIfG7mVskRmcIGV2EIHmMSjoHkdCV0YAeBzKkhKFW+G+Hw+fc=
X-Gm-Gg: ASbGnctphcYVymxZQcRxv22puZJs2hIZGiHxo2y4+JeD43mgDzgmm3nFkl9uOwTKOwO
	OSKq/lEoo1TYJsVHAU28LYCIQ+D7gIocJL1X9vX09gcOsbB4i91Ct3jxCUH/a/NTN8w7fsBYGZp
	bjT2YLSXWEpoGpAxdnwNFRdTWOryv1sWLFHsgpS89SG2dSVrjdD4Sj15cbi8Dy3IA7hJWW0gxk3
	qzaOhp/Dx8uDiOc5qeDU9itHfHtxi4MRhR5PuqOkjMRiTtci3zFMXwP2ow6XQFcz8bUcaXgqRjW
	1yDVg8OMEtGT3MhA1swpD+lC7ik9sr3x/OVUxd40tAhAYTxv9CIISsUPOw1bTWn5n99jcpNtifg
	d/Exx+LbsjP05Lgr1/xquolcwrNc5mFeu+tGW8R4/0z7M5u8b4GoFBv3aVr5mqz6osvUIPDEuXm
	sOh+AixzterinMfBuoskzr4wGwykao4JN+H8mEwWlphkFx
X-Google-Smtp-Source: AGHT+IHVh+XykHQ2ie1FbsjPB5NCYM/GfnVSD4j3aJa7Gx2GenLmZSy/XBqIT6+L3zFgueo4AFh0qQ==
X-Received: by 2002:a05:6402:2353:b0:604:e33f:e5c0 with SMTP id 4fb4d7f45d1cf-6149b5a6fbamr1579000a12.30.1753253707637;
        Tue, 22 Jul 2025 23:55:07 -0700 (PDT)
Message-ID: <b33a1b88-dca1-42f1-874a-5681eea53336@suse.com>
Date: Wed, 23 Jul 2025 08:55:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen: Add capabilities to get_domain_state
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250722001958.174294-1-jason.andryuk@amd.com>
 <20250722001958.174294-2-jason.andryuk@amd.com>
 <481a415a-7992-42bf-a890-a7b40b4aac84@suse.com>
 <b7cf7835-c3e3-468d-8625-5cc147861737@suse.com>
 <fb860d51-56ee-455a-bbaa-81ee0e94b0d1@suse.com>
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
In-Reply-To: <fb860d51-56ee-455a-bbaa-81ee0e94b0d1@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Mpb4uCtRjam6x9JFZRgFG6iA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Mpb4uCtRjam6x9JFZRgFG6iA
Content-Type: multipart/mixed; boundary="------------mOJvLo0RrrZFduTmi2PSpm0X";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>
Message-ID: <b33a1b88-dca1-42f1-874a-5681eea53336@suse.com>
Subject: Re: [PATCH v3 1/2] xen: Add capabilities to get_domain_state
References: <20250722001958.174294-1-jason.andryuk@amd.com>
 <20250722001958.174294-2-jason.andryuk@amd.com>
 <481a415a-7992-42bf-a890-a7b40b4aac84@suse.com>
 <b7cf7835-c3e3-468d-8625-5cc147861737@suse.com>
 <fb860d51-56ee-455a-bbaa-81ee0e94b0d1@suse.com>
In-Reply-To: <fb860d51-56ee-455a-bbaa-81ee0e94b0d1@suse.com>
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

--------------mOJvLo0RrrZFduTmi2PSpm0X
Content-Type: multipart/mixed; boundary="------------nw8E9quQA08eD05qGcuVEOrX"

--------------nw8E9quQA08eD05qGcuVEOrX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDcuMjUgMDg6NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wNy4yMDI1
IDA4OjM0LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMjMuMDcuMjUgMDg6MjgsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIyLjA3LjIwMjUgMDI6MTksIEphc29uIEFuZHJ5
dWsgd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4+Pj4gKysrIGIv
eGVuL2NvbW1vbi9kb21haW4uYw0KPj4+PiBAQCAtMTk1LDYgKzE5NSwxNCBAQCBzdGF0aWMg
dm9pZCBzZXRfZG9tYWluX3N0YXRlX2luZm8oc3RydWN0IHhlbl9kb21jdGxfZ2V0X2RvbWFp
bl9zdGF0ZSAqaW5mbywNCj4+Pj4gICAgICAgICAgICBpbmZvLT5zdGF0ZSB8PSBYRU5fRE9N
Q1RMX0dFVERPTVNUQVRFX1NUQVRFX0RZSU5HOw0KPj4+PiAgICAgICAgaWYgKCBkLT5pc19k
eWluZyA9PSBET01EWUlOR19kZWFkICkNCj4+Pj4gICAgICAgICAgICBpbmZvLT5zdGF0ZSB8
PSBYRU5fRE9NQ1RMX0dFVERPTVNUQVRFX1NUQVRFX0RFQUQ7DQo+Pj4+ICsNCj4+Pj4gKyAg
ICBpbmZvLT5jYXBzID0gMDsNCj4+Pj4gKyAgICBpZiAoIGlzX2NvbnRyb2xfZG9tYWluKGQp
ICkNCj4+Pj4gKyAgICAgICAgaW5mby0+Y2FwcyB8PSBYRU5fRE9NQ1RMX0dFVERPTVNUQVRF
X0NBUF9DT05UUk9MOw0KPj4+PiArICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGQpICkN
Cj4+Pj4gKyAgICAgICAgaW5mby0+Y2FwcyB8PSBYRU5fRE9NQ1RMX0dFVERPTVNUQVRFX0NB
UF9IQVJEV0FSRTsNCj4+Pj4gKyAgICBpZiAoIGlzX3hlbnN0b3JlX2RvbWFpbihkKSApDQo+
Pj4+ICsgICAgICAgIGluZm8tPmNhcHMgfD0gWEVOX0RPTUNUTF9HRVRET01TVEFURV9DQVBf
WEVOU1RPUkU7DQo+Pj4+ICAgICAgICBpbmZvLT51bmlxdWVfaWQgPSBkLT51bmlxdWVfaWQ7
DQo+Pj4+ICAgIH0NCj4+Pg0KPj4+IFRoaXMgYmVpbmcgYSBzdGFibGUgc3ViLW9wLCBkb24n
dCB3ZSBuZWVkIGEgd2F5IHRvIGluZGljYXRlIHRvIHRoZSBjYWxsZXINCj4+PiBfdGhhdF8g
dGhpcyBmaWVsZCBoYXMgdmFsaWQgZGF0YSBub3c/IFdoZW4gbm9uLXplcm8gaXQncyBlYXN5
IHRvIHRlbGwsIGJ1dA0KPj4+IGdldHRpbmcgYmFjayB6ZXJvIGlzIGFtYmlndW91cy4NCj4+
DQo+PiBUaGUgaHlwZXJjYWxsIHN1Yi1vcCB3YXMgaW50cm9kdWNlZCBpbiB0aGlzIGRldmVs
b3BtZW50IGN5Y2xlIG9ubHksIHNvDQo+PiB0aGVyZSBpcyBubyByZWxlYXNlZCBYZW4gaHlw
ZXJ2aXNvciB3aXRob3V0IHRoZSBjYXBhYmlsaXR5IHNldHRpbmcuDQo+Pg0KPj4gSW4gY2Fz
ZSB0aGlzIHBhdGNoIGRvZXNuJ3QgbWFrZSBpdCBpbnRvIDQuMjEsIHRoZSBjYXNlIHlvdSBh
cmUgbWVudGlvbmluZw0KPj4gbXVzdCBiZSBoYW5kbGVkLCBvZiBjb3Vyc2UuDQo+IA0KPiBI
bW0sIHllcywgdGhpcyB3YXkgaXQncyBvbiB0aGUgZWRnZS4gQXMgYSBzdGFibGUgc3ViLW9w
LCBzb21lb25lIGNvdWxkIGhhdmUNCj4gYmFja3BvcnRlZCB0aGUgY2hhbmdlLCB0aG91Z2gu
IElPVyAoYW5kIGluIGdlbmVyYWwpIEkgd29uZGVyIHdoZXRoZXIgZm9yDQo+IHN0YWJsZSBz
dWItb3BzIHdlIHNob3VsZG4ndCBiZSBwcmV0dHkgc3RyaWN0IGFib3V0IGZ1bmN0aW9uYWwg
ZXh0ZW5zaW9ucywNCj4gbm90IHR5aW5nIHRoZWlyIGFkZGl0aW9uIHRvIHJlbGVhc2VzIGF0
IGFsbC4NCg0KU2hvdWxkIHdlIHJlYWxseSBjYXJlIGFib3V0IGRvd25zdHJlYW1zIGJhY2tw
b3J0aW5nIG5vdCB5ZXQgcmVsZWFzZWQNCmZ1bmN0aW9uYWxpdHk/DQoNClVzaW5nIHlvdXIg
cmVhc29uaW5nIHRoaXMgd291bGQgbWVhbiB3ZSdkIG5lZWQgdG8gaXNzdWUgWFNBcyBmb3Ig
bm90IHlldA0KcmVsZWFzZWQgaHlwZXJ2aXNvciBpc3N1ZXMgb2Ygc3RhYmxlIGludGVyZmFj
ZXMsIHRvby4gSSBkb24ndCB0aGluayB3ZQ0Kd2FudCB0byBkbyB0aGF0Lg0KDQoNCkp1ZXJn
ZW4NCg==
--------------nw8E9quQA08eD05qGcuVEOrX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------nw8E9quQA08eD05qGcuVEOrX--

--------------mOJvLo0RrrZFduTmi2PSpm0X--

--------------Mpb4uCtRjam6x9JFZRgFG6iA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiAh0oFAwAAAAAACgkQsN6d1ii/Ey98
Rwf+IggG0CBxu8Gbc6rxiNOpldvvYzxhpeZmAEb9lWwV1hUcKwVdmfhnouLw9bZsJwoq3wxTRiPp
SQidBLGVgzH2xPJwXAlOQ8XKISVJxF/uJVoCHOZ7mb7nKufQMfWiNPMVhBeRqfWMokpjzsSy18n3
jMjvFrmY4VfH6cIIGSpjcFJ4XWA6RZUAB9qGt7p5Kf8kLp/0E3tyMlMrqQa3AX8WX2rSlFXSJPtY
BGmj9WGbKuxWdf9E3rX/03Hnq8CUR+EaA2jD6b1fteWdKqBH2Hthlqm698QgnYo1lQ/8BIH3hZld
89o8yVf1EaGErNXnug+H3MAHmVCeGuT/7tDJz2wbzg==
=cJS6
-----END PGP SIGNATURE-----

--------------Mpb4uCtRjam6x9JFZRgFG6iA--

