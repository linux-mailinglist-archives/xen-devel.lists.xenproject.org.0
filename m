Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D26DDA3853E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 15:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890499.1299653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk1ff-0005vT-9n; Mon, 17 Feb 2025 14:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890499.1299653; Mon, 17 Feb 2025 14:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk1ff-0005u1-6z; Mon, 17 Feb 2025 14:00:27 +0000
Received: by outflank-mailman (input) for mailman id 890499;
 Mon, 17 Feb 2025 14:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L/wo=VI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tk1fe-0005tt-Cv
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 14:00:26 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88faf095-ed37-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 15:00:25 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5deb1266031so7694378a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 06:00:25 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1d00d9sm7193635a12.32.2025.02.17.06.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 06:00:23 -0800 (PST)
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
X-Inumbo-ID: 88faf095-ed37-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739800824; x=1740405624; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xEYjKomFi+MmNMV04HVkayp40MGUXEYydJ07iWFZgZI=;
        b=QZuA6m4IAy13AoRm5qrjIQ3sUUzve2PfbRA0T87GoPsbZvGP+NZOvg+W6p7SMyHQjJ
         mKTpqaDaK3ULz9F/X3Qpjh8gKBXqVERwIkppzvho1lwrmpsrtW9RbATx+8wywo8qHrpi
         o2rFl6pBUOrZVhNs49dkoWktnVIa3qg15mSVVurJTGGy5cScrOFOBc2GsdJgTlhpeIMC
         oq3pTgBunLLRGhriTKSofspbG/3qW77G0PNV/TLuVhe2C+han9IMcuMzw40rbY/htvt0
         bXiodImQgjbwYQnj+SlF6whLzPzLhoI05DttF1ADJZBzYsA7kjaZbu0FeFAtTi0LruC/
         Fh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739800824; x=1740405624;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEYjKomFi+MmNMV04HVkayp40MGUXEYydJ07iWFZgZI=;
        b=Hr7Lnqo6ZnHd7JRyayioQbBeMd0Ots6uGuqA2phC7GatlJQXUdrEQOrflQQmURtWKd
         8d5Z+li7rCuSiV4ya54z3qctE2fuxpSfWEV8C/NDWa1PGYEWk0ih71otGBrcqjq3v/bN
         U3t6BvrFM4ft4qWE7RxWyA4BmhipJnvBtHYSSDHBB4iNTCGkR5WobQVTHQ8oJShct5Zc
         bKpUa7BDld0kNT4mjSq5KVj8VugXKAuh0iSNrKwgLgCUxfsf7oHVQ/fEo14kKnRVARdj
         jbguH95d5W1XEInzOfjM0RPdbOoOkC9nEoGL1wg/3Un/dl9hfR8xHpunaTfkHAuBPn6q
         npAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJpkoiwpFBDj/NNoQLm4U0BTsBbulWlSOCmEGndS909j5IJk4QDUGjYE/Hrn+y7wHAjUxpz1ba8so=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzg5RlsMKPSZOcIROfyJeudnbrQyiJZ5FYAo6CWGXJjNJA0wrWD
	jfEitXRAhoUWsN//xT5JlsWQ1uvKXIxR0f6klxrrL8Q7NVTvD3L+Ok5Y1QqN88s=
X-Gm-Gg: ASbGncsRd770dg6D839//TMHpdc3D2UClDGA0lEwonjFFFRagZqz85b7yKck1q4O7Jy
	AhmfZHvJPiAsQzypQ57JUeYZjt38iO537VcYSiMtZ9Fx0OY6l+pR1U1QR3ibvkWV1NXQQ3qeWZQ
	WeI8QwpxSLIuqsQbny5w49MSE2RRId3q7FNHrgWgvwPW3T3t72eGiuoPABgaGhed4DrN656Gx3l
	hxhxnLra+YYE1frpEmGphHLPU2/lYlyej8dp1o2uUSz23HG4SIPH9yN7T9wOVTEFgHi331taDAS
	gdq5Ew6K7qLZX0KiRgDFGFoqYVjprN55bpMJGDDLbJ4G+PuLBI16vSqC7dIT5pLneZLSP0HkB1F
	qPRBeW5Um/g8ZNIzDdSlQstTGxPcJniiYtZHETQ==
X-Google-Smtp-Source: AGHT+IH96POiGCHpCYRDidEwiZLnvx6jjJS8nimJrvpkYqYZ5gZxybm4R+GVsyz2lElibRP+wl+pKQ==
X-Received: by 2002:a05:6402:354e:b0:5dc:74fd:ac0a with SMTP id 4fb4d7f45d1cf-5e03606f4camr7995059a12.8.1739800824270;
        Mon, 17 Feb 2025 06:00:24 -0800 (PST)
Message-ID: <12ede60b-3c87-4f1e-b8f2-4c13fe001cd5@suse.com>
Date: Mon, 17 Feb 2025 15:00:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/list: avoid UB in list iterators
To: Jan Beulich <jbeulich@suse.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250216102356.18801-1-jgross@suse.com>
 <20250216102356.18801-2-jgross@suse.com>
 <6e429c09-7f45-4bf6-b5b9-5d4b8885620c@suse.com>
 <93a37ce1-cffb-4dae-b339-7fd52a1098d8@suse.com>
 <ad91884b-e712-4f6e-a7ee-04817e8aabce@suse.com>
 <b1a4fd99-6553-4256-97ec-655c944170b2@suse.com>
 <3a3a1efe-ddde-44c6-b4c0-1701657f31c1@suse.com>
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
In-Reply-To: <3a3a1efe-ddde-44c6-b4c0-1701657f31c1@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GWo06CPsuUvwW2X1edT99cbe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GWo06CPsuUvwW2X1edT99cbe
Content-Type: multipart/mixed; boundary="------------YvMYh7O0SCAxxHr0AHJFmhTD";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <12ede60b-3c87-4f1e-b8f2-4c13fe001cd5@suse.com>
Subject: Re: [PATCH 1/2] xen/list: avoid UB in list iterators
References: <20250216102356.18801-1-jgross@suse.com>
 <20250216102356.18801-2-jgross@suse.com>
 <6e429c09-7f45-4bf6-b5b9-5d4b8885620c@suse.com>
 <93a37ce1-cffb-4dae-b339-7fd52a1098d8@suse.com>
 <ad91884b-e712-4f6e-a7ee-04817e8aabce@suse.com>
 <b1a4fd99-6553-4256-97ec-655c944170b2@suse.com>
 <3a3a1efe-ddde-44c6-b4c0-1701657f31c1@suse.com>
In-Reply-To: <3a3a1efe-ddde-44c6-b4c0-1701657f31c1@suse.com>
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

--------------YvMYh7O0SCAxxHr0AHJFmhTD
Content-Type: multipart/mixed; boundary="------------a0q3eX4nD8YOaiD3EaIZXZ0T"

--------------a0q3eX4nD8YOaiD3EaIZXZ0T
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDIuMjUgMTM6MTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4wMi4yMDI1
IDEyOjU4LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMTcuMDIuMjUgMTI6MzksIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE3LjAyLjIwMjUgMTI6MTYsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE9uIDE3LjAyLjI1IDEwOjQ3LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDE2LjAyLjIwMjUgMTE6MjMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+
Pj4gQEAgLTU1NiwxMSArNTkwLDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBsaXN0X3NwbGlj
ZV9pbml0KHN0cnVjdCBsaXN0X2hlYWQgKmxpc3QsDQo+Pj4+Pj4gICAgICAqIEBoZWFkOiAg
IHRoZSBoZWFkIGZvciB5b3VyIGxpc3QuDQo+Pj4+Pj4gICAgICAqIEBtZW1iZXI6IHRoZSBu
YW1lIG9mIHRoZSBsaXN0X3N0cnVjdCB3aXRoaW4gdGhlIHN0cnVjdC4NCj4+Pj4+PiAgICAg
ICovDQo+Pj4+Pj4gLSNkZWZpbmUgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHBvcywgbiwg
aGVhZCwgbWVtYmVyKSAgICAgICAgICAgICAgICAgIFwNCj4+Pj4+PiAtICAgIGZvciAoKHBv
cykgPSBsaXN0X2VudHJ5KChoZWFkKS0+bmV4dCwgdHlwZW9mKCoocG9zKSksIG1lbWJlciks
ICAgICAgXA0KPj4+Pj4+IC0gICAgICAgICAobikgPSBsaXN0X2VudHJ5KChwb3MpLT5tZW1i
ZXIubmV4dCwgdHlwZW9mKCoocG9zKSksIG1lbWJlcik7ICBcDQo+Pj4+Pj4gLSAgICAgICAg
ICYocG9zKS0+bWVtYmVyICE9IChoZWFkKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwNCj4+Pj4+PiAtICAgICAgICAgKHBvcykgPSAobiksIChuKSA9IGxpc3Rf
ZW50cnkoKG4pLT5tZW1iZXIubmV4dCwgdHlwZW9mKCoobikpLCBtZW1iZXIpKQ0KPj4+Pj4+
ICsjZGVmaW5lIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShwb3MsIG4sIGhlYWQsIG1lbWJl
cikgICAgICAgICAgICAgICAgICAgICBcDQo+Pj4+Pj4gKyAgICBmb3IgKCAocG9zKSA9IGxp
c3RfZmlyc3RfZW50cnlfb3JfbnVsbChoZWFkLCB0eXBlb2YoKihwb3MpKSwgbWVtYmVyKSwg
IFwNCj4+Pj4+PiArICAgICAgICAgIChuKSA9IChwb3MpID8gbGlzdF9uZXh0X2VudHJ5X29y
X251bGwoaGVhZCwgcG9zLCBtZW1iZXIpIDogTlVMTDsgXA0KPj4+Pj4NCj4+Pj4+IG4gY2Fu
IGVuZCB1cCBiZWluZyBOVUxMIGhlcmUgZXZlbiBpZiBwb3MgaXNuJ3QuIFRoZW4gLi4uDQo+
Pj4+Pg0KPj4+Pj4+ICsgICAgICAgICAgcG9zOyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+Pj4+Pj4gKyAgICAgICAg
ICAocG9zKSA9IChuKSwgKG4pID0gbGlzdF9uZXh0X2VudHJ5X29yX251bGwoaGVhZCwgbiwg
bWVtYmVyKSApDQo+Pj4+Pg0KPj4+Pj4gLi4uIHlvdSBjYW4ndCB1c2UgbGlzdF9uZXh0X2Vu
dHJ5X29yX251bGwoKSBvbiBpdC4NCj4+Pj4NCj4+Pj4gQWgsIGluZGVlZC4NCj4+Pj4NCj4+
Pj4gV2hhdCB3b3VsZCB5b3UgcHJlZmVyPyBIYW5kbGluZyB0aGF0IGluIHRoZSAqX3NhZmUo
KSBpdGVyYXRvciBtYWNyb3MsIG9yDQo+Pj4+IGFsbG93aW5nIHRoZSAqX2VudHJ5X29yX251
bGwoKSBtYWNyb3MgdG8gYmUgY2FsbGVkIHdpdGggYSBOVUxMIHBhcmFtZXRlcj8NCj4+Pg0K
Pj4+IEknZCBwcmVmZXIgdGhlIGZvcm1lciwgYnV0IEkgcHJvYmFibHkgd291bGRuJ3QgbWlu
ZCB0aGUgbGF0dGVyLg0KPj4+DQo+Pj4+Pj4gQEAgLTY1NSwxMCArNjg5LDEwIEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBsaXN0X3NwbGljZV9pbml0KHN0cnVjdCBsaXN0X2hlYWQgKmxpc3Qs
DQo+Pj4+Pj4gICAgICAqIHRoZSBfcmN1IGxpc3QtbXV0YXRpb24gcHJpbWl0aXZlcyBzdWNo
IGFzIGxpc3RfYWRkX3JjdSgpDQo+Pj4+Pj4gICAgICAqIGFzIGxvbmcgYXMgdGhlIHRyYXZl
cnNhbCBpcyBndWFyZGVkIGJ5IHJjdV9yZWFkX2xvY2soKS4NCj4+Pj4+PiAgICAgICovDQo+
Pj4+Pj4gLSNkZWZpbmUgbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UocG9zLCBoZWFkLCBtZW1i
ZXIpICAgICAgICAgICAgICAgICAgICAgIFwNCj4+Pj4+PiAtICAgIGZvciAoKHBvcykgPSBs
aXN0X2VudHJ5KChoZWFkKS0+bmV4dCwgdHlwZW9mKCoocG9zKSksIG1lbWJlcik7ICAgICAg
XA0KPj4+Pj4+IC0gICAgICAgICAmcmN1X2RlcmVmZXJlbmNlKHBvcyktPm1lbWJlciAhPSAo
aGVhZCk7ICAgICAgICAgICAgICAgICAgICAgICBcDQo+Pj4+Pj4gLSAgICAgICAgIChwb3Mp
ID0gbGlzdF9lbnRyeSgocG9zKS0+bWVtYmVyLm5leHQsIHR5cGVvZigqKHBvcykpLCBtZW1i
ZXIpKQ0KPj4+Pj4+ICsjZGVmaW5lIGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KHBvcywgaGVh
ZCwgbWVtYmVyKSAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+Pj4+PiArICAgIGZvciAo
IChwb3MpID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKGhlYWQsIHR5cGVvZigqKHBvcykp
LCBtZW1iZXIpOyBcDQo+Pj4+Pj4gKyAgICAgICAgICByY3VfZGVyZWZlcmVuY2UocG9zKTsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4+Pj4+ICsg
ICAgICAgICAgKHBvcykgPSBsaXN0X25leHRfZW50cnlfb3JfbnVsbChoZWFkLCBwb3MsIG1l
bWJlcikgKQ0KPj4+Pj4NCj4+Pj4+IERvbid0IHlvdSBuZWVkIGEgbGlzdF9uZXh0X2VudHJ5
X29yX251bGxfcmN1KCkgZmxhdm9yIGhlcmUsIHVzaW5nDQo+Pj4+PiByY3VfZGVyZWZlcmVu
Y2UoKSBvbiB0aGUgcGFzc2VkIGluIHBvcyBmb3IgdGhlIChwb3MpLT5tZW1iZXIubmV4dCBk
ZXJlZj8NCj4+Pj4NCj4+Pj4gSXNuJ3QgdGhlICJyY3VfZGVyZWZlcmVuY2UocG9zKTsiIGFs
bCB3aGF0IGlzIG5lZWRlZCBmb3IgdGhlIGN1cnJlbnQgaXRlcmF0aW9uPw0KPj4+DQo+Pj4g
UmVhZGluZyBMaW51eCdlcyByY3VfZGVyZWZlcmVuY2UucnN0LCBteSB1bmRlcnN0YW5kaW5n
IGlzIHRoYXQgb25lIG9mIHRoZW0NCj4+PiB3b3VsZCBzdWZmaWNlIGlmIHRoZW4gd2UgdXNl
ZCBpdHMgcmVzdWx0IHJhdGhlciB0aGFuIHRoZSBvcmlnaW5hbCBwb2ludGVyLg0KPj4+IFRo
ZW4gYWdhaW4gUkNVIGhhcyBiZWVuIHNvbWV3aGF0IG9wYXF1ZSB0byBtZSBmb3IgYWxsIHRo
ZSB5ZWFycyAuLi4NCj4+Pg0KPj4+PiBPdGhlcndpc2UgdG9kYXkncyBpbXBsZW1lbnRhdGlv
biB3b3VsZCBzdWZmZXIgZnJvbSB0aGUgc2FtZSBwcm9ibGVtIElNSE8uDQo+Pj4NCj4+PiBU
aGF0J3MgdGhlIGltcHJlc3Npb24gSSdtIChub3cpIGhhdmluZy4NCj4+DQo+PiBUaGUgcmN1
X2RlcmVmZXJlbmNlKCkgaXMgYmFzaWNhbGx5IGp1c3QgZm9yIGRvY3VtZW50YXRpb24gcHVy
cG9zZXMuIElmIG5lZWRlZA0KPj4gYnkgYW4gYXJjaCwgaXQgY2FuIGFkZCBiYXJyaWVycywg
dG9vLCBidXQgYWNjb3JkaW5nIHRvIHRoZSBjb21tZW50cyB0aG9zZSB3b3VsZA0KPj4gYmUg
bmVlZGVkIG9uIGFscGhhIG9ubHkuIFRoZSByZXR1cm5lZCB2YWx1ZSBpcyBhbHdheXMgdGhl
IG9yaWdpbmFsIHBvaW50ZXINCj4+IHZhbHVlLiBTZWUgdGhlIGNvbW1lbnQgYmxvY2sgaW4g
eGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmgNCj4gDQo+IE5vdGUgdGhlICJUaGlzIHBvaW50
ZXIgbWF5IGxhdGVyIGJlIHNhZmVseSBkZXJlZmVyZW5jZWQiIGluIHRoZXJlLiBBcyBzYWlk
LA0KPiB3ZSdkIGJlIGZpbmUgaWYgd2UgdXNlZCB0aGUgcmV0dXJuIHZhbHVlIGluc3RlYWQg
b2YgdGhlIG9yaWdpbmFsICJwb3MiLiBZZXQNCj4gd2UgZG9uJ3QuIFdlIGVmZmVjdGl2ZWx5
IGFzc3VtZSB0aGF0IHRoZSBtYWNybyBleHBhbmRzIHRvIGp1c3QgdGhlIHBhc3NlZA0KPiBp
biBwb2ludGVyLCB3aXRoIG5vIGJhcnJpZXJzIG9yIGFueXRoaW5nIGVsc2UuDQo+IA0KPiBB
bnl3YXksIHNpbmNlIC0gYXMgeW91IHZhbGlkbHkgc2F5IC0gdGhpcyBpcyBhIHByZS1leGlz
dGluZyBpc3N1ZSwgbGV0J3MgcHV0DQo+IGl0IG9uIHRoZSBzaWRlIHJpZ2h0IGhlcmUuDQoN
CkknbGwgc2V0dXAgYSBwYXRjaCBmb3IgNC4yMSBmaXhpbmcgYWxsIHRoZSByY3UgbGlzdCBp
dGVyYXRvcnMuDQoNCg0KSnVlcmdlbg0K
--------------a0q3eX4nD8YOaiD3EaIZXZ0T
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------a0q3eX4nD8YOaiD3EaIZXZ0T--

--------------YvMYh7O0SCAxxHr0AHJFmhTD--

--------------GWo06CPsuUvwW2X1edT99cbe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmezQPcFAwAAAAAACgkQsN6d1ii/Ey8x
cQf/Z4FQH1sktogXR0rJ27N+9fJD9GgpxqdmEy1oktsdTXKz+y3uWOb+0sssxs27ZS/UGHWpx/Zu
i8uAkwj9GSOk0ei9QevuV5qyljyddEjwwvP04VMF4Jl7iwERTaZPfTPYKjhcbvK7BCQBcmOQbTFX
JoQaPznMopUS7lQ3W/tuQuN+0h58LaoTc4j/iJfid/v1DEwjNnq9SFUSWfcuOKjIe3P6c6vlqjVn
yk7NMjcLT7Qd9L2ysiePuEHgGWQxZTD6J8ln1Zfm78O3sZr/VFe/qHIMxe4hc/QlDByFOPEcd+zW
CKEZ2wI1d1zI/3MTCq350qVxE8FBPCDtrDN7ncF6rQ==
=jBLI
-----END PGP SIGNATURE-----

--------------GWo06CPsuUvwW2X1edT99cbe--

