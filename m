Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 949DC9F5F1B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 08:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859990.1272073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNoHS-0005b2-Qi; Wed, 18 Dec 2024 07:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859990.1272073; Wed, 18 Dec 2024 07:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNoHS-0005YK-N9; Wed, 18 Dec 2024 07:15:38 +0000
Received: by outflank-mailman (input) for mailman id 859990;
 Wed, 18 Dec 2024 07:15:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fISF=TL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tNoHQ-0005YE-87
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 07:15:36 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df440a2e-bd0f-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 08:15:34 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d3d0205bd5so8701081a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 23:15:34 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab9638ecb7sm520980266b.155.2024.12.17.23.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 23:15:33 -0800 (PST)
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
X-Inumbo-ID: df440a2e-bd0f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734506133; x=1735110933; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SVwo/povEVBa7tvWJ84JOJO0aX6nITiFYWRQz/p5XW0=;
        b=QC4GkxpGlfzsQrOvAJsoZLTbLtOQn3jdCtnv3s7VwzNNuPF1bdXH3o3bWHLgtq12/W
         cQdCF/pym3eQ9MiefYTbBcEBmHZ+CBDKnuT09/MteMu5AMsDzaEKpJM5Uk4GjUaM7GZw
         LeE/D4R9ez0A0HSKTNAXsVNUYDCDF8wGC2HtXH5l3awC+V0ylw8UNYwCtnIjfJFfTfEL
         SyubmTMmeNn1dVVAybbe1f/H9GoiNyvVJz6swyybmm5Q7D2NT+RDP7rZwRkL5BQt8Vr5
         lYU2x2tR7QfwLxGgliOQV2z101Dv2A6w9VjEE9X1boHwleiK3D9HHPmD5T+mEdRz88kv
         3Rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734506133; x=1735110933;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVwo/povEVBa7tvWJ84JOJO0aX6nITiFYWRQz/p5XW0=;
        b=X/aDqKeG9WgoK/HwkWacAoTcmRuugt04psvr1dOYTIRxYFow0kymTuu05oWko3w0ft
         hFqEE3EYhvc2tmVxCh8FOk/iW7/8r96E6lzV7ZbbyGvfDR72FuI80zojQh2pDgsLtdJY
         x8mRaEBY3Ox27Rx4ZhFNSNdkLHnj62TRvIZmuAr4oZZ9S1AzCN3lokLT+vt7RlrAyW4Q
         XEbXofdnS9JmS+Xb1q1lJkeUQwffGM7U82KXBTJsmjv8p0enNoj2zH64Chkq2vqUTUT4
         cKY40xvuRQ5jd0zxjHxa1LZ16/JP0/H6sW86r1art21B/4lJk5XYLAT7fRzHXF8nPZlu
         lrSA==
X-Forwarded-Encrypted: i=1; AJvYcCVJbvIaKHgkbkqXj61aj+3S4kzPpsvpXMFr+V/6V6BpcKvEaML7vBfmZqT2Cz+x9PPfrCeu8FBPMvE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPGc9ef6lNCCMHKMn4KJkM23sncOHsZvHOjSaarJtWSq8jBjSV
	FOjT5XIdSWqPC35rk3Da7X0RtHZQi61B66WIUvfFqKSVmQnrO43sx8LtDk9gqco=
X-Gm-Gg: ASbGncvaSSaHtTLpFGWssORIt5wy3+hMkqtspRW0wTlfg0Tp7yu3d3FxQnzs66d7J+9
	HbNY0EFyae4afbQ6Ywn1NaeNelkBcqYT0crh4WhzQf0rup+xyW+aIWbwiFxSMi61XVZowKGtz56
	YxKUy+V/R+YzI+BOc3DrBNwdkcKCv1WJhQrDoET1PFjDxZWIoo9nopvuF3zw/BFOkAn/vZYw1cM
	aP22Y/V6DG6daysQLvq2utlBH8cY656rZZMqZjSSx+bn+k469KIOUyZNsH4r4l0S93oNVC/z73q
	vNYOlRc69Ipdx+eu6vtumFuCkK2zKWJh2QSH9aOhQhMW0unOwdhsJ4eR3oJIdKHR6AnyqIzAI8r
	KJLHRDA==
X-Google-Smtp-Source: AGHT+IEKLJjN3NYI9lbeSzuEvGZkWxGWL6BH/6FWVN7yJ1agSMnv0cqk4OctJIac/PDUQSOUwUYorw==
X-Received: by 2002:a17:907:3e1d:b0:aa6:8a1b:8b78 with SMTP id a640c23a62f3a-aabf471ff8dmr125407266b.6.1734506133372;
        Tue, 17 Dec 2024 23:15:33 -0800 (PST)
Message-ID: <2fa06b11-e7a0-4f57-9af0-af432d35820a@suse.com>
Date: Wed, 18 Dec 2024 08:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] xen: add bitmap to indicate per-domain state
 changes
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241217142218.24129-1-jgross@suse.com>
 <20241217142218.24129-3-jgross@suse.com>
 <ce327545-c23b-4272-a290-ce950b4c27f5@suse.com>
 <b7738421-5802-4179-8b6b-1ec18b8abd8a@suse.com>
 <be77e290-086e-4393-ac68-13a9cddc3f98@suse.com>
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
In-Reply-To: <be77e290-086e-4393-ac68-13a9cddc3f98@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wy0qqVeRzNRn21eZh8BJP3Wg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wy0qqVeRzNRn21eZh8BJP3Wg
Content-Type: multipart/mixed; boundary="------------6EWgdWQk5ExBp58YTfCEh0Wb";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <2fa06b11-e7a0-4f57-9af0-af432d35820a@suse.com>
Subject: Re: [PATCH v5 2/5] xen: add bitmap to indicate per-domain state
 changes
References: <20241217142218.24129-1-jgross@suse.com>
 <20241217142218.24129-3-jgross@suse.com>
 <ce327545-c23b-4272-a290-ce950b4c27f5@suse.com>
 <b7738421-5802-4179-8b6b-1ec18b8abd8a@suse.com>
 <be77e290-086e-4393-ac68-13a9cddc3f98@suse.com>
In-Reply-To: <be77e290-086e-4393-ac68-13a9cddc3f98@suse.com>
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

--------------6EWgdWQk5ExBp58YTfCEh0Wb
Content-Type: multipart/mixed; boundary="------------1OkYYJKIGx2nQcY88XbA7a7W"

--------------1OkYYJKIGx2nQcY88XbA7a7W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMTIuMjQgMTc6MTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4xMi4yMDI0
IDE2OjU1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMTcuMTIuMjQgMTY6MTksIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE3LjEyLjIwMjQgMTU6MjIsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IEFkZCBhIGJpdG1hcCB3aXRoIG9uZSBiaXQgcGVyIHBvc3NpYmxl
IGRvbWlkIGluZGljYXRpbmcgdGhlIHJlc3BlY3RpdmUNCj4+Pj4gZG9tYWluIGhhcyBjaGFu
Z2VkIGl0cyBzdGF0ZSAoY3JlYXRlZCwgZGVsZXRlZCwgZHlpbmcsIGNyYXNoZWQsDQo+Pj4+
IHNodXRkb3duKS4NCj4+Pj4NCj4+Pj4gUmVnaXN0ZXJpbmcgdGhlIFZJUlFfRE9NX0VYQyBl
dmVudCB3aWxsIHJlc3VsdCBpbiBzZXR0aW5nIHRoZSBiaXRzIGZvcg0KPj4+PiBhbGwgZXhp
c3RpbmcgZG9tYWlucyBhbmQgcmVzZXR0aW5nIGFsbCBvdGhlciBiaXRzLg0KPj4+Pg0KPj4+
PiBBcyB0aGUgdXNhZ2Ugb2YgdGhpcyBiaXRtYXAgaXMgdGlnaHRseSBjb3VwbGVkIHdpdGgg
dGhlIFZJUlFfRE9NX0VYQw0KPj4+PiBldmVudCwgaXQgaXMgbWVhbnQgdG8gYmUgdXNlZCBv
bmx5IGJ5IGEgc2luZ2xlIGNvbnN1bWVyIGluIHRoZSBzeXN0ZW0sDQo+Pj4+IGp1c3QgbGlr
ZSB0aGUgVklSUV9ET01fRVhDIGV2ZW50Lg0KPj4+DQo+Pj4gSSdtIHNvcnJ5LCBidXQgSSBu
ZWVkIHRvIGNvbWUgYmFjayB0byB0aGlzLiBJIHRob3VnaHQgSSBoYWQgZ290IGNvbnZpbmNl
ZA0KPj4+IHRoYXQgb25seSBhIHNpbmdsZSBlbnRpdHkgaW4gdGhlIHN5c3RlbSBjYW4gYmlu
ZCB0aGlzIHZJUlEuIFlldCB1cG9uDQo+Pj4gY2hlY2tpbmcgSSBjYW4ndCBzZWVtIHRvIGZp
bmQgd2hhdCB3b3VsZCBndWFyYW50ZWUgdGhpcy4gSW4gcGFydGljdWxhcg0KPj4+IGJpbmRp
bmcgYSB2SVJRIGRvZXNuJ3QgaW52b2x2ZSBhbnkgWFNNIGNoZWNrLiBIZW5jZSBhbiB1bnBy
aXZpbGVnZWQgZW50aXR5DQo+Pj4gY291bGQsIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQgdGhl
IGludGVyZXN0ZWQgcHJpdmlsZWdlZCBlbnRpdHkgKHhlbnN0b3JlKQ0KPj4+IGlzIGFscmVh
ZHkgdXAgYW5kIHJ1bm5pbmcsIGJpbmQgYW5kIHVuYmluZCB0aGlzIHZJUlEsIGp1c3QgdG8g
aGF2ZSB0aGUNCj4+PiBnbG9iYWwgbWFwIGZyZWVkLiBXaGF0IGFtIEkgb3Zlcmxvb2tpbmcg
KHdoaWNoIHdvdWxkIGxpa2VseSB3YW50IHN0YXRpbmcNCj4+PiBoZXJlKT8NCj4+DQo+PiBJ
IHRoaW5rIHlvdSBhcmUgbm90IG92ZXJsb29raW5nIGFueXRoaW5nLg0KPj4NCj4+IEkgZ3Vl
c3MgdGhpcyBjYW4gZWFzaWx5IGJlIGhhbmRsZWQgYnkgY2hlY2tpbmcgdGhhdCB0aGUgVklS
UV9ET01fRVhDIGhhbmRsaW5nDQo+PiBkb21haW4gaXMgdGhlIGNhbGxpbmcgb25lIGluIGRv
bWFpbl9bZGVdaW5pdF9zdGF0ZXMoKS4gTm90ZSB0aGF0IGdsb2JhbCB2aXJxcw0KPj4gYXJl
IG9ubHkgZXZlciBzZW50IHRvIHZjcHVbMF0gb2YgdGhlIGhhbmRsaW5nIGRvbWFpbiwgc28g
cmViaW5kaW5nIHRoZSBldmVudA0KPj4gdG8gYW5vdGhlciB2Y3B1IGlzIHBvc3NpYmxlLCBi
dXQgZG9lc24ndCBtYWtlIHNlbnNlLg0KPiANCj4gTm8sIHRoYXQncyBwcmVjbHVkZWQgYnkN
Cj4gDQo+ICAgICAgaWYgKCB2aXJxX2lzX2dsb2JhbCh2aXJxKSAmJiAodmNwdSAhPSAwKSAp
DQo+ICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiANCj4gYWZhaWN0LiBUaGF0IGRvZXNu
J3QsIGhvd2V2ZXIsIHByZWNsdWRlIG11bHRpcGxlIHZDUFUtcyBmcm9tIHRyeWluZyB0byBi
aW5kDQo+IHRoZSB2SVJRIHRvIHZDUFUgMC4NCg0KSSBsZXQgbXlzZWxmIGZvb2wgYnkgdGhl
IGFiaWxpdHkgdG8gdXNlIEVWVENITk9QX2JpbmRfdmNwdSBmb3IgYSBnbG9iYWwNCnZpcnEu
IFdoaWxlIGl0IGlzIHBvc3NpYmxlIHRvIHNlbmQgdGhlIGV2ZW50IHRvIGFub3RoZXIgdmNw
dSwgaXQgaXMgc3RpbGwNCnZjcHVbMF0gd2hpY2ggaXMgdXNlZCBmb3IgdGhlIGJvb2trZWVw
aW5nLg0KDQo+IA0KPj4+PiBWNToNCj4+Pj4gLSBkb21haW5faW5pdF9zdGF0ZXMoKSBtYXkg
YmUgY2FsbGVkIG9ubHkgaWYgZXZ0Y2huX2JpbmRfdmlycSgpIGhhcyBiZWVuDQo+Pj4+ICAg
ICBjYWxsZWQgdmFsaWRseSAoSmFuIEJldWxpY2gpDQo+Pj4NCj4+PiBJIG5vdyByZWNhbGwg
d2h5IEkgaGFkIGZpcnN0IHN1Z2dlc3RlZCB0aGUgcGxhY2VtZW50IGxhdGVyIGluIHRoZSBo
YW5kbGluZzoNCj4+PiBZb3UncmUgbm93IGRvaW5nIHRoZSBhbGxvY2F0aW9uIHdpdGggeWV0
IGFub3RoZXIgbG9jayBoZWxkLiBJdCdzIGxpa2VseSBub3QNCj4+PiB0aGUgZW5kIG9mIHRo
ZSB3b3JsZCwgYnV0IC4uLg0KPj4+DQo+Pj4+IEBAIC0xMzgsNiArMTM5LDYwIEBAIGJvb2wg
X19yZWFkX21vc3RseSB2bXRyYWNlX2F2YWlsYWJsZTsNCj4+Pj4gICAgDQo+Pj4+ICAgIGJv
b2wgX19yZWFkX21vc3RseSB2cG11X2lzX2F2YWlsYWJsZTsNCj4+Pj4gICAgDQo+Pj4+ICtz
dGF0aWMgREVGSU5FX1NQSU5MT0NLKGRvbV9zdGF0ZV9jaGFuZ2VkX2xvY2spOw0KPj4+PiAr
c3RhdGljIHVuc2lnbmVkIGxvbmcgKl9fcmVhZF9tb3N0bHkgZG9tX3N0YXRlX2NoYW5nZWQ7
DQo+Pj4+ICsNCj4+Pj4gK2ludCBkb21haW5faW5pdF9zdGF0ZXModm9pZCkNCj4+Pj4gK3sN
Cj4+Pj4gKyAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpkOw0KPj4+PiArICAgIGludCByYyA9
IC1FTk9NRU07DQo+Pj4+ICsNCj4+Pj4gKyAgICBzcGluX2xvY2soJmRvbV9zdGF0ZV9jaGFu
Z2VkX2xvY2spOw0KPj4+PiArDQo+Pj4+ICsgICAgaWYgKCBkb21fc3RhdGVfY2hhbmdlZCAp
DQo+Pj4+ICsgICAgICAgIGJpdG1hcF96ZXJvKGRvbV9zdGF0ZV9jaGFuZ2VkLCBET01JRF9G
SVJTVF9SRVNFUlZFRCk7DQo+Pj4+ICsgICAgZWxzZQ0KPj4+PiArICAgIHsNCj4+Pj4gKyAg
ICAgICAgZG9tX3N0YXRlX2NoYW5nZWQgPSB4dnphbGxvY19hcnJheSh1bnNpZ25lZCBsb25n
LA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJ
VFNfVE9fTE9OR1MoRE9NSURfRklSU1RfUkVTRVJWRUQpKTsNCj4+Pg0KPj4+IC4uLiBhbHJl
YWR5IHRoaXMgYWxvbmUgd2Fzbid0IG5pY2UsIGFuZCBjb3VsZCBiZSBhdm9pZGVkIChieSBk
b2luZyB0aGUNCj4+PiBhbGxvY2F0aW9uIHByaW9yIHRvIGFjcXVpcmluZyB0aGUgbG9jaywg
d2hpY2ggb2YgY291cnNlIGNvbXBsaWNhdGVzIHRoZQ0KPj4+IGxvZ2ljIHNvbWUpLg0KPj4+
DQo+Pj4gV2hhdCdzIHBlcmhhcHMgbGVzcyBkZXNpcmFibGUgaXMgdGhhdCAuLi4NCj4+Pg0K
Pj4+PiBAQCAtNDk0LDYgKzQ5NSwxNSBAQCBpbnQgZXZ0Y2huX2JpbmRfdmlycShldnRjaG5f
YmluZF92aXJxX3QgKmJpbmQsIGV2dGNobl9wb3J0X3QgcG9ydCkNCj4+Pj4gICAgICAgICAg
ICBnb3RvIG91dDsNCj4+Pj4gICAgICAgIH0NCj4+Pj4gICAgDQo+Pj4+ICsgICAgaWYgKCB2
aXJxID09IFZJUlFfRE9NX0VYQyApDQo+Pj4+ICsgICAgew0KPj4+PiArICAgICAgICByYyA9
IGRvbWFpbl9pbml0X3N0YXRlcygpOw0KPj4+PiArICAgICAgICBpZiAoIHJjICkNCj4+Pj4g
KyAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4+PiArDQo+Pj4+ICsgICAgICAgIGRlaW5pdF9p
Zl9lcnIgPSB0cnVlOw0KPj4+PiArICAgIH0NCj4+Pj4gKw0KPj4+PiAgICAgICAgcG9ydCA9
IHJjID0gZXZ0Y2huX2dldF9wb3J0KGQsIHBvcnQpOw0KPj4+PiAgICAgICAgaWYgKCByYyA8
IDAgKQ0KPj4+PiAgICAgICAgew0KPj4+DQo+Pj4gLi4uIHRoZSBwbGFjZW1lbnQgaGVyZSBh
ZGRpdGlvbmFsbHkgaW50cm9kdWNlcyBsb2NrIG5lc3Rpbmcgd2hlbiByZWFsbHkNCj4+PiB0
aGUgdHdvIGxvY2tzIHNob3VsZG4ndCBoYXZlIGFueSByZWxhdGlvbnNoaXAuDQo+Pj4NCj4+
PiBIb3cgYWJvdXQgZ2l2aW5nIGRvbWFpbl9pbml0X3N0YXRlcygpIGEgYm9vbGVhbiBwYXJh
bWV0ZXIsIHN1Y2ggdGhhdCBpdA0KPj4+IGNhbiBiZSBjYWxsZWQgdHdpY2UsIHdpdGggdGhl
IGZpcnN0IGludm9jYXRpb24gbW92ZWQgYmFjayB1cCB3aGVyZSBpdA0KPj4+IHdhcywgYW5k
IHRoZSBzZWNvbmQgb25lIHB1dCAuLi4NCj4+Pg0KPj4+PiBAQCAtNTI3LDYgKzUzNyw5IEBA
IGludCBldnRjaG5fYmluZF92aXJxKGV2dGNobl9iaW5kX3ZpcnFfdCAqYmluZCwgZXZ0Y2hu
X3BvcnRfdCBwb3J0KQ0KPj4+PiAgICAgb3V0Og0KPj4+PiAgICAgICAgd3JpdGVfdW5sb2Nr
KCZkLT5ldmVudF9sb2NrKTsNCj4+Pj4gICAgDQo+Pj4+ICsgICAgaWYgKCByYyAmJiBkZWlu
aXRfaWZfZXJyICkNCj4+Pj4gKyAgICAgICAgZG9tYWluX2RlaW5pdF9zdGF0ZXMoKTsNCj4+
Pj4gKw0KPj4+PiAgICAgICAgcmV0dXJuIHJjOw0KPj4+PiAgICB9DQo+Pj4NCj4+PiAuLi4g
ZG93biBoZXJlLCBub3QgZG9pbmcgYW55IGFsbG9jYXRpb24gYXQgYWxsIChvbmx5IHRoZSBj
bGVhcmluZyksIGFuZA0KPj4+IGhlbmNlIGVsaW1pbmF0aW5nIHRoZSBuZWVkIHRvIGRlYWwg
d2l0aCBpdHMgZmFpbHVyZT8gKEFsdGVybmF0aXZlbHkNCj4+PiB0aGVyZSBjb3VsZCBvZiBj
b3Vyc2UgYmUgYSBzcGxpdCBpbnRvIGFuIGluaXQgYW5kIGEgcmVzZXQgZnVuY3Rpb24uKQ0K
Pj4+DQo+Pj4gVGhlcmUgb2YgY291cnNlIGlzIHRoZSBjaGFuY2Ugb2YgcmFjZXMgd2l0aCBz
dWNoIGFuIGFwcHJvYWNoLiBJJ2QgbGlrZQ0KPj4+IHRvIG5vdGUgdGhvdWdoIHRoYXQgd2l0
aCB0aGUgcGxhY2VtZW50IG9mIHRoZSBjYWxsIGluIHRoZSBodW5rIGFib3ZlDQo+Pj4gdGhl
cmUncyBhIG1pbm9yIHJhY2UsIHRvbyAoYWdhaW5zdCAuLi4NCj4+Pg0KPj4+PiBAQCAtNzMw
LDYgKzc0Myw5IEBAIGludCBldnRjaG5fY2xvc2Uoc3RydWN0IGRvbWFpbiAqZDEsIGludCBw
b3J0MSwgYm9vbCBndWVzdCkNCj4+Pj4gICAgICAgICAgICBzdHJ1Y3QgdmNwdSAqdjsNCj4+
Pj4gICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPj4+PiAgICANCj4+Pj4gKyAg
ICAgICAgaWYgKCBjaG4xLT51LnZpcnEgPT0gVklSUV9ET01fRVhDICkNCj4+Pj4gKyAgICAg
ICAgICAgIGRvbWFpbl9kZWluaXRfc3RhdGVzKCk7DQo+Pj4NCj4+PiAuLi4gdGhpcyBhbmQg
dGhlIHNhbWUgcmVtb3RlIHZDUFUgdGhlbiBpbW1lZGlhdGVseSBiaW5kaW5nIHRoZSB2SVJR
DQo+Pj4gYWdhaW4pLiBIZW5jZSB5ZXQgYW5vdGhlciBhbHRlcm5hdGl2ZSB3b3VsZCBhcHBl
YXIgdG8gYmUgdG8gZHJvcCB0aGUNCj4+PiBuZXcgZ2xvYmFsIGxvY2sgYW5kIHVzZSBkLT5l
dmVudF9sb2NrIGZvciBzeW5jaHJvbml6YXRpb24gaW5zdGVhZA0KPj4+IChwcm92aWRlZCAt
IHNlZSBhYm92ZSAtIHRoYXQgb25seSBhIHNpbmdsZSBlbnRpdHkgY2FuIGFjdHVhbGx5IHNl
dCB1cA0KPj4+IGFsbCBvZiB0aGlzKS4gVGhhdCB3b3VsZCBwcmV0dHkgbXVjaCB3YW50IHRv
IGhhdmUgdGhlIGFsbG9jYXRpb24ga2VwdA0KPj4+IHdpdGggdGhlIGxvY2sgYWxyZWFkeSBo
ZWxkICh3aGljaCBpc24ndCBuaWNlLCBidXQgYXMgc2FpZCBpcyBwZXJoYXBzDQo+Pj4gdG9s
ZXJhYmxlKSwgYnV0IHdvdWxkIGF0IGxlYXN0IGVsaW1pbmF0ZSB0aGUgdW5kZXNpcmFibGUg
bG9jayBuZXN0aW5nLg0KPj4+DQo+Pj4gUmUtdXNlIG9mIHRoZSBkb21haW4ncyBldmVudCBs
b2NrIGlzIGF0IGxlYXN0IHNvbWV3aGF0IGp1c3RpZmllZCBieQ0KPj4+IHRoZSBiaXQgYXJy
YXkgYmVpbmcgdGllZCB0byBWSVJRX0RPTV9FWEVDLg0KPj4+DQo+Pj4gVGhvdWdodHM/DQo+
Pg0KPj4gV2l0aCBteSBzdWdnZXN0aW9uIGFib3ZlIEkgdGhpbmsgdGhlcmUgaXMgbm8gcmFj
ZSwgYXMgb25seSB0aGUgZG9tYWluIGhhbmRsaW5nDQo+PiBWSVJRX0RPTV9FWEMgY291bGQg
YWxsb2MvZGVhbGxvYyBkb21fc3RhdGVfY2hhbmdlZC4NCj4gDQo+IFlldCBzdGlsbCBpdCBj
b3VsZCBiZSBtdWx0aXBsZSB2Q1BVLXMgdGhlcmVpbiB0byB0cnkgdG8gaW4gcGFyYWxsZWwu
DQoNCkJ1dCBpc24ndCB0aGlzIGFnYWluIHRoZSBuZWVkIGZvciB0cnVzdGluZyBvdGhlciBw
cm9jZXNzZXMgd2l0aGluIHRoZSBkb21haW4NCmhhdmluZyB0aGUgcmlnaHQgdG8gY29uc3Vt
ZSB0aGUgdmlycT8NCg0KSW4gdGhlIGVuZCBpdCBkb2Vzbid0IG1hdHRlciB3aGV0aGVyIHRo
ZXJlIGlzIHN1Y2ggYSByYWNlIG9yIG5vdC4gU29tZQ0KcHJvY2VzcyBpbiB0aGF0IGRvbWFp
biBoYXZpbmcgdGhlIHBvd2VyIHRvIGRvIGV2ZW50IGNoYW5uZWwgb3BlcmF0aW9ucyBjb3Vs
ZA0Kc2ltcGx5IGNsb3NlIHRoZSBldmVudCBjaGFubmVsLiBTbyBpdCBJUyByZWFsbHkgYWJv
dXQgdHJ1c3QuDQoNCj4gDQo+PiBVc2luZyBkLT5ldmVudF9sb2NrIGZvciBzeW5jaHJvbml6
YXRpb24gaXMgbm90IGEgbmljZSBvcHRpb24gSU1PLCBhcyBpdCB3b3VsZA0KPj4gcmVxdWly
ZSB0byB0YWtlIHRoZSBldmVudF9sb2NrIG9mIHRoZSBkb21haW4gaGFuZGxpbmcgVklSUV9E
T01fRVhFQyB3aGVuIHRyeWluZw0KPj4gdG8gc2V0IGEgYml0IGZvciBhbm90aGVyIGRvbWFp
biBjaGFuZ2luZyBzdGF0ZS4NCj4gDQo+IFdlbGwsIHllcywgaXQncyB0aGF0IGRvbWFpbidz
IGRhdGEgdGhhdCdzIHRvIGJlIG1vZGlmaWVkLCBhZnRlciBhbGwuDQoNClRydWUsIGJ1dCB1
c2luZyBkLT5ldmVudF9sb2NrIHdvdWxkIHByb2JhYmx5IGluY3JlYXNlIGxvY2sgY29udGVu
dGlvbiwgYXMgdGhpcw0KbG9jayBpcyB1c2VkIG11Y2ggbW9yZSBvZnRlbiB0aGFuIHRoZSBu
ZXcgbG9jayBpbnRyb2R1Y2VkIGJ5IG15IHBhdGNoLg0KDQoNCkp1ZXJnZW4NCg==
--------------1OkYYJKIGx2nQcY88XbA7a7W
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------1OkYYJKIGx2nQcY88XbA7a7W--

--------------6EWgdWQk5ExBp58YTfCEh0Wb--

--------------wy0qqVeRzNRn21eZh8BJP3Wg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdidpQFAwAAAAAACgkQsN6d1ii/Ey9q
Twf+IWDVlU1uUXxNIQeNNaGaW3NLBSwGcBYfrWE6Lrh9QRhTuTs28PcHxfRQUF2qqYlCFQrO9AkT
FYXXTOIDzqK1dtQIqL0kXbxv8uLXIF1sSuhJGK09lcwio2aDoc3hyaWEchDowi2HkhX079yi0kT6
L0ghw3axhHLbprZDQHbUe+rs+9a9bTzOT6epbVP+t7a80GKa63F3IecTSsvLh74F9qEAqWZknDGS
ktIBY3r871KSmnwh7r14ND3qAgFkh9wNEozqUiHbZAC78cUbvXZ6KiAZmhvBmEXMM+/8PggKhWWE
pMgQgngbiOszNKobMj0Dx2NgvekzBvNOPSkQuN3uVg==
=cO5Q
-----END PGP SIGNATURE-----

--------------wy0qqVeRzNRn21eZh8BJP3Wg--

