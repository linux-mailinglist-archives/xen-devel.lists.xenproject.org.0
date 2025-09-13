Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640A2B55F19
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 09:17:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123040.1466375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxKUy-0004yb-1U; Sat, 13 Sep 2025 07:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123040.1466375; Sat, 13 Sep 2025 07:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxKUx-0004va-Ta; Sat, 13 Sep 2025 07:16:39 +0000
Received: by outflank-mailman (input) for mailman id 1123040;
 Sat, 13 Sep 2025 07:16:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4ZTP=3Y=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uxKUw-0004vU-Nb
 for xen-devel@lists.xenproject.org; Sat, 13 Sep 2025 07:16:38 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95f4e0ba-9071-11f0-9d13-b5c5bf9af7f9;
 Sat, 13 Sep 2025 09:16:37 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45dec1ae562so23386435e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 13 Sep 2025 00:16:37 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:be00:c26:b971:1ba7:9d8b?
 (p200300e5873dbe000c26b9711ba79d8b.dip0.t-ipconnect.de.
 [2003:e5:873d:be00:c26:b971:1ba7:9d8b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd4cdsm9238829f8f.37.2025.09.13.00.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Sep 2025 00:16:36 -0700 (PDT)
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
X-Inumbo-ID: 95f4e0ba-9071-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757747796; x=1758352596; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xje1crB6/RpCXZepP9n4C83bdrQMxqzt4pcOcmmsRGg=;
        b=G0uXH/0HBMWaX7bhdoxhUAHuwlFLetclLfyI9IJCDs96XJ6/ArF+GSw53XyeDEI1PH
         cDFfvRyZ1GQqMThhV+uef7mL3l9XBLAzSDFH6PTqaiVjjSCVL1SZvGaqsu5YhBP1cFW7
         acIC8ylkg7CIAVhoRgYlQphdgM3g/tpcyNtNCu9VOk0jtBm6nvWhj+EMHzGntEZrL0uf
         kBXLF2zE1SLNdYVAE0JkjR3BWkDkdR+DuheEjDAn8HV0QfKH+SErSuRjY+D7WXgBrhqf
         Gcw0uyD3kNxB5h7CtatRL7WGaAtbn75YAkyPP+FU97/DGwfjZ6VgoVjv4wwdvHdkMXk0
         GGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757747796; x=1758352596;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xje1crB6/RpCXZepP9n4C83bdrQMxqzt4pcOcmmsRGg=;
        b=rzI3QUWzV7mCbKShBRZLv9IJYJjuonk2Pcw4g/seaCXE1KeWq1fF0wpgqbAIZnDqti
         mwkHS9iyZD2uWy9/sfBZ0lHPMo9RlmBkRo8mHSxDEUmJ2F7n9dZxZGqmzw9cE99AgqfE
         yu0/5FdWZ5RpqOIT7p11ER1jgu1B/LqI76kxuPSMJa3OIEHaqQIbpP13K0uQ2BTiFpAP
         FsXm+LsaRa00C5zPj7fuPOZowoTCoZW7aiqm9VKnRaC+tmuyRw1C7oB6uq1WuR4TlkQ9
         d7xrJ2U2FuBje6PBxS77TeU8xkrz/QO34KjKKfs8Us/mwmmxlEuyCWdqWajvqla7EhXm
         lT3w==
X-Forwarded-Encrypted: i=1; AJvYcCXLNouANdLZpE+4VbXqYHWZ2oFBNyTSRQil6837hTnLl0hatCacPbNMyquxSgx5TvRTAgSgHoPT4GE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQV9FsC8OMUDo60ldG7jp/SwHZMxebC9D0SyU0FLIkRl2Mpd7n
	Hml0E6U3W2BPIhBIz98VunSILSbzzklX1yKmWGKUgsyn9KQXr26BpV1UipgTx2Ln80U=
X-Gm-Gg: ASbGncvyUCOxpAugm+WdL4UJaVRA81x/8vm5h6yrdpuLrDYOZFiIfg92R2AjRwc/1+y
	aRLROfZaMfnbJ0rQvecwdJUeKINEMqh6R2XdNJRmNycUqDaorOiUc3d6LZoEOMk64o7+RUwR32+
	YEuZU1GbhVANIOdPWMezXvqbLNGLcJZdinhTNoGJlJ0EF47lEta/chSRAjLAEQfzW2yH8NRnDgC
	nV3dZrWTwO9CYOvcZc+y9jnGM8JXl43AE64CndRJr1gJjlfbqqnoLbRFc3G86dtB/17d6xJI33P
	jjF90GMVdv5jiRvaBHM4aqJ5jpjwlZ6wQAeH6vDlXuVqCIBYfmHhhrWIGJL6WbgMJ1aNjVpRuhC
	fOD1adqwAtGtqIzt/f6FmRAeXKyl4rnNNY+Sh+V939yfEOTenRD1sjqgTl6/URhcC75PBf4sqT/
	bAQCwTaJzFaQvFQQZDMT1wBsN2N25U71PLm3HHVaRsXVW2AzIJebYW7hI=
X-Google-Smtp-Source: AGHT+IH1c4+pxrHtLZCPRNkyCEtPXUpmokLJCxIB+vWOmL5Ne7ATfKa+ZCpiH20dtRe6rBtXDB+VPA==
X-Received: by 2002:a05:6000:230b:b0:3d0:b3cc:c1ff with SMTP id ffacd0b85a97d-3e765a2df90mr5048129f8f.39.1757747796470;
        Sat, 13 Sep 2025 00:16:36 -0700 (PDT)
Message-ID: <1f1a5a8f-0b1f-4e50-9467-3d27d8a3089d@suse.com>
Date: Sat, 13 Sep 2025 09:16:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] SUPPORT.md: add xenstorepvh-stubdom live update
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250730122305.4050-1-jgross@suse.com>
 <20250730122305.4050-9-jgross@suse.com>
 <25c867ca-3b73-4b65-be98-c2d7b3ea4f7b@xen.org>
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
In-Reply-To: <25c867ca-3b73-4b65-be98-c2d7b3ea4f7b@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0sOc0ImYWr9fRcilD63Tv4k6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0sOc0ImYWr9fRcilD63Tv4k6
Content-Type: multipart/mixed; boundary="------------cwjEYSPA3N88hrGJnWJPxla7";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <1f1a5a8f-0b1f-4e50-9467-3d27d8a3089d@suse.com>
Subject: Re: [PATCH v3 8/9] SUPPORT.md: add xenstorepvh-stubdom live update
References: <20250730122305.4050-1-jgross@suse.com>
 <20250730122305.4050-9-jgross@suse.com>
 <25c867ca-3b73-4b65-be98-c2d7b3ea4f7b@xen.org>
In-Reply-To: <25c867ca-3b73-4b65-be98-c2d7b3ea4f7b@xen.org>
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

--------------cwjEYSPA3N88hrGJnWJPxla7
Content-Type: multipart/mixed; boundary="------------pPrLaUNLqexxwDpL6LYOMVsq"

--------------pPrLaUNLqexxwDpL6LYOMVsq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDkuMjUgMjM6MDksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IFNvcnJ5IGZvciB0aGUgbGF0ZSBhbnN3ZXIuDQo+IA0KPiBPbiAzMC8wNy8yMDI1
IDEzOjIzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gTGl2ZSB1cGRhdGUgaXMgbm93IHdv
cmtpbmcgd2l0aCB0aGUgUFZIIHZhcmlhbnQgb2YgeGVuc3RvcmUtc3R1YmRvbS4NCj4gID4g
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAt
LS0NCj4+IFYyOg0KPj4gLSBuZXcgcGF0Y2gNCj4+IC0tLQ0KPj4gwqAgU1VQUE9SVC5tZCB8
IDIgKy0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9TVVBQT1JULm1kIGIvU1VQUE9SVC5tZA0KPj4g
aW5kZXggNmE4MmE5MjE4OS4uZWI0NGVlODVmZCAxMDA2NDQNCj4+IC0tLSBhL1NVUFBPUlQu
bWQNCj4+ICsrKyBiL1NVUFBPUlQubWQNCj4+IEBAIC0yODAsNyArMjgwLDcgQEAgb3IgaXRz
ZWxmIHdpbGwgbm90IGJlIHJlZ2FyZGVkIGEgc2VjdXJpdHkgaXNzdWUuDQo+PiDCoCAjIyMg
QyB4ZW5zdG9yZSBzdHViZG9tIFBWSA0KPj4gwqDCoMKgwqDCoCBTdGF0dXM6IFN1cHBvcnRl
ZA0KPj4gLcKgwqDCoCBTdGF0dXMsIExpdmV1cGRhdGU6IE5vdCBpbXBsZW1lbnRlZA0KPj4g
K8KgwqDCoCBTdGF0dXMsIExpdmV1cGRhdGU6IFN1cHBvcnRlZA0KPiANCj4gSSB3ZW50IHRo
cm91Z2ggdGhlIGNoYW5nZXMgaW4gWGVuc3RvcmVkIGZvciB0aGUgc3R1YmRvbSBhbmQgSSBo
YXZlIG9uZSBxdWVzdGlvbiANCj4gcmVnYXJkaW5nIFsxXS4gRG9lcyB0aGlzIG1lYW4gdGhl
IGV2ZW50IGNoYW5uZWwgd2lsbCBiZSBjbG9zZWQgZHVyaW5nIExpdmUtIA0KPiBVcGRhdGU/
IEFza2luZyBiZWNhdXNlIEkgdmFndWVseSByZW1lbWJlciB3ZSBuZWVkIHRvIGtlZXAgdGhl
bSBvcGVuIHRvIGF2b2lkIA0KPiBsb3NpbmcgZXZlbnRzLiBJIGFtIHdvbmRlcmluZyBob3cg
dGhpcyB3b3VsZCB3b3JrIGluIHN0dWJkb20/DQoNClRoZSBldmVudCBjaGFubmVsIGlzIHN0
aWxsIG9wZW4sIGl0cyBqdXN0IHRoZSBNaW5pLU9TIGludGVybmFscyB0aGF0IGRvbid0DQpr
bm93IGFib3V0IHRoaXMuIFRoaXMgaXMgdGhlIHJlYXNvbiBmb3IgY2FsbGluZyB4ZW5ldnRj
aG5fYmluZCgpIHRvIGJyaW5nDQpoeXBlcnZpc29yIGFuZCBNaW5pLU9TIHZpZXcgaW4gc3lu
YyBhZ2Fpbiwgd2l0aG91dCBjaGFuZ2luZyB0aGUgaHlwZXJ2aXNvcg0Kc2lkZS4NCg0KDQpK
dWVyZ2VuDQo=
--------------pPrLaUNLqexxwDpL6LYOMVsq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------pPrLaUNLqexxwDpL6LYOMVsq--

--------------cwjEYSPA3N88hrGJnWJPxla7--

--------------0sOc0ImYWr9fRcilD63Tv4k6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjFGlMFAwAAAAAACgkQsN6d1ii/Ey81
qgf+IE1vgHUEb0/riaqYLz0J3pSR6RGPBa5gJpScMwuHXbJSBOKMdlPxqu1Be6l7LvypnYGTEo0C
AMnpcs0LPMNaFEpnrVW+KdCEj6Fv1oKT24kLN79yQ5iepWFemzIucI2laTlV5GMamVh2991ZtwCE
ZciasY/e3Ejbt3B10OctPoxjNtduD60q4vCiWpyyAJFmrW5Bry+kgmfpqyDEVFk45+YOp/HpRSqq
yBViDqUfFsfcv3uBuc4P7TqXkeoBeAnSHZhZBXJDOXI9/eX49tZYp2c4Lkht5dzWg8eW6HwUez3A
cFfP7stfroqZ1pS/89RUylWgf0gapReWh2x+UI24lg==
=oxZg
-----END PGP SIGNATURE-----

--------------0sOc0ImYWr9fRcilD63Tv4k6--

