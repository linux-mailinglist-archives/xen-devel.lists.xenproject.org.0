Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6910A37D72
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 09:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889828.1298868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjwoF-0003cd-Q4; Mon, 17 Feb 2025 08:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889828.1298868; Mon, 17 Feb 2025 08:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjwoF-0003ai-N6; Mon, 17 Feb 2025 08:48:59 +0000
Received: by outflank-mailman (input) for mailman id 889828;
 Mon, 17 Feb 2025 08:48:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L/wo=VI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tjwoE-0003ac-2L
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 08:48:58 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0597aabd-ed0c-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 09:48:56 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5dea50ee572so6020332a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 00:48:56 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9b187203sm165698166b.61.2025.02.17.00.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 00:48:55 -0800 (PST)
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
X-Inumbo-ID: 0597aabd-ed0c-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739782136; x=1740386936; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OFIo/6LNvgUBjN+MXivl/uWKP8iMSBpCyCG5rv5mAN4=;
        b=fEqS0hbMeayJIoKizQ3mbebwGPQEjozlasRTT0jdr44Xb7FCTuQ9S/9ytOkbNM4fCe
         spd1lFO6PM1zeJy1Xe68Q3Yq8YH4OfCRPSWL4J8lrBqVzzSurfwwQW+y9hevEWpiDmKz
         Ay/p2iFc2NH+TYGFvkPEYz0L4SJBDLRygKoxdqqeg+OY6+saiFjplHWYctpC8jn4jO/U
         AjAulRKRmz2TLRUFy1QGDGgOgiyd2ITtYb/eEriPD/U+1o+T+9FVGnbQ4rVAZ72R8fX1
         1i9JH8dWc69rCl9I8pqhU4RBjetemtarJhzoBkqRLYsvrqOy4rbshLWT2xdzNMFGtnGD
         7a5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782136; x=1740386936;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OFIo/6LNvgUBjN+MXivl/uWKP8iMSBpCyCG5rv5mAN4=;
        b=uSboJocqJ1tjEI0T/nknDh6aQYzf1/8/WoW6nTGLmW0chkiNlm34aRoI4kYi/VFSSX
         L4vVm71Jl2YUl7x59bHSF96COrx+/XPBM1Hq1Ar5Y7bdoQ/s87Ky1diFwBr6rSw8a4wO
         nLwI2OlhFAw5mWyGpNwTTeB571dVAvN0Wa8omMME3CxZOLqSgYhjJ4s98sPZmTWkon2J
         CgQP0JT8Lt+KvL4NeCPwDHKlRHmFhPx2H1ACdwjmnuf39ziqnDrYg2S6ghMuEs8OKdxx
         Z0iRji2b5Cpv3Iw2Vv/4NMkP+8Yi+avGqd/O4mFjIHfE7IyOZRQHyPWmwW4Rbqta62qo
         T57w==
X-Forwarded-Encrypted: i=1; AJvYcCXEt+V+R1qhSjihflEI+/tulWLs5QFf3jLPMfmzTTvO7XDpnMy0v049/w9E9bf/mjbmnpJ56UdBejI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWZtklLRCp1mQ8d64+JWP9j4lpQoJo34VdwnR0KLEWcX5oXWUJ
	JfJP94CBQOHlGNvookH4HGbzipN3S8t/34wlWLjKj909npj6dGdjhEy+uQlr9I8=
X-Gm-Gg: ASbGncu2tvo6SNrItvRvNYFwJt8kLjAZZ5hCDsU/HVxD3KRoSGszxz8P+1tA+HCOvH3
	LkcVoeP1UCWwTjUSxgZQ9oZCYK+3oIJwvzMNNVXRDVr14/kdCENrdsrdR5wVpedTfhRIcrR4i6o
	JradmLoEd/zxGdK8DjUVHDa//6Eapm/3VQYVHqJv/YayuBSf5N5YGjqF4gm7Xyb031mxyGNhVbq
	7ICW3MG8RSOqlX0aXlwaJ8e03yZzylE/oRqS/Zn8erwHzlyo8B1RhrTupfWCjParSaaJLk9+PWs
	EfbQJBd//ttzMV9j7q7icCF6DFvryuol4bua3eztjdbVwei4h1SCyjrTJu3i8+Rt6vrl2giVyo5
	pJYsglL3US9zTVl4R1HHiyIwWFb5f6Lme3F52Cg==
X-Google-Smtp-Source: AGHT+IGnYDCa7VrLMHn+HvFXeziaE1cGdF+MaNg1NRMjW/RwLte18+mlkUpNq6qTqJop0vLwY7TiNw==
X-Received: by 2002:a17:906:30d9:b0:ab7:e8d8:854b with SMTP id a640c23a62f3a-abb70d96420mr848954066b.36.1739782135556;
        Mon, 17 Feb 2025 00:48:55 -0800 (PST)
Message-ID: <d8dfc351-2646-4ea8-b697-5f0f0ef22108@suse.com>
Date: Mon, 17 Feb 2025 09:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/3] xen/sched: address violation of MISRA C Rule 8.2
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 George Dunlap <gwd@xenproject.org>
References: <cover.1739564781.git.nicola.vetrini@bugseng.com>
 <36cd255a8d4068a66ad8cf45060d60b84b9d4c6d.1739564781.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2502141303380.3858257@ubuntu-linux-20-04-desktop>
 <180090ff-f0c1-4040-8c42-6ded7536a527@suse.com>
 <c4dbb8c88d068cf7bbc5cc6c9d8440ba@bugseng.com>
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
In-Reply-To: <c4dbb8c88d068cf7bbc5cc6c9d8440ba@bugseng.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WuQilXu79WAWFWhw7p9PY70m"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WuQilXu79WAWFWhw7p9PY70m
Content-Type: multipart/mixed; boundary="------------OIPDhXb5WdY5H0XSCcQ812Lr";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 George Dunlap <gwd@xenproject.org>
Message-ID: <d8dfc351-2646-4ea8-b697-5f0f0ef22108@suse.com>
Subject: Re: [XEN PATCH 2/3] xen/sched: address violation of MISRA C Rule 8.2
References: <cover.1739564781.git.nicola.vetrini@bugseng.com>
 <36cd255a8d4068a66ad8cf45060d60b84b9d4c6d.1739564781.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2502141303380.3858257@ubuntu-linux-20-04-desktop>
 <180090ff-f0c1-4040-8c42-6ded7536a527@suse.com>
 <c4dbb8c88d068cf7bbc5cc6c9d8440ba@bugseng.com>
In-Reply-To: <c4dbb8c88d068cf7bbc5cc6c9d8440ba@bugseng.com>
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

--------------OIPDhXb5WdY5H0XSCcQ812Lr
Content-Type: multipart/mixed; boundary="------------rZALDQ9r0TTI12XKubpUfcB0"

--------------rZALDQ9r0TTI12XKubpUfcB0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDIuMjUgMDk6MzEsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI1LTAy
LTE3IDA4OjU0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDE1LjAyLjIwMjUgMDA6MDQs
IFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+PiBPbiBGcmksIDE0IEZlYiAyMDI1LCBO
aWNvbGEgVmV0cmluaSB3cm90ZToNCj4+Pj4gUnVsZSA4LjIgc3RhdGVzOiAiRnVuY3Rpb24g
dHlwZXMgc2hhbGwgYmUgaW4gcHJvdG90eXBlIGZvcm0gd2l0aA0KPj4+PiBuYW1lZCBwYXJh
bWV0ZXJzIi4NCj4+Pj4NCj4+Pj4gVGhlIHBhcmFtZXRlciBuYW1lIGlzIG1pc3NpbmcgZnJv
bSB0aGUgZnVuY3Rpb24gcG9pbnRlciB0eXBlDQo+Pj4+IHRoYXQgY29uc3RpdHV0ZXMgdGhl
IGZpcnN0IHBhcmFtZXRlci4NCj4+Pj4NCj4+Pj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+
Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IE5pY29sYSBWZXRyaW5pIDxuaWNvbGEudmV0cmlu
aUBidWdzZW5nLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IFRoaXMgc21hbGwgZml4IGlzIG5lZWRl
ZCBpbiBvcmRlciB0byBrZWVwIHRoZSBydWxlIGNsZWFuIGluIHRoZQ0KPj4+PiBmb2xsb3ct
dXAgcGF0Y2ggdGhhdCBjaGFuZ2VzIHRoZSBYZW4gY29uZmlndXJhdGlvbiB1bmRlciBzdGF0
aWMNCj4+Pj4gYW5hbHlzaXMuDQo+Pj4+DQo+Pj4+IEkgd2Fzbid0IHJlYWxseSBjZXJ0YWlu
IGFib3V0IHRoZSByaWdodCBuYW1lIHRvIGdpdmUgdG8gdGhlIHBhcmFtZXRlciwNCj4+Pj4g
c28gaWYgdGhlcmUgYXJlIGJldHRlciBvcHRpb25zIEknZCBiZSBoYXBweSB0byBhY2NlcHQg
dGhlbS4NCj4+Pj4gLS0tDQo+Pj4+IMKgeGVuL2NvbW1vbi9zY2hlZC9ydC5jIHwgMiArLQ0K
Pj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
Pj4NCj4+IFRoaXMgaXMgYSBzcGVjaWZpYyBzY2hlZHVsZXIgeW91IHRvdWNoLCB3aGljaCBJ
IHRoaW5rIHdhbnRzIGV4cHJlc3NpbmcNCj4+IHNvbWVob3cgKGUuZy4gdmlhIGFuIGFkanVz
dGVkIHByZWZpeCkgaW4gdGhlIHBhdGNoIHN1YmplY3QuDQo+Pg0KPiANCj4gT2suIEkgdGhp
bmsgaXQgc2hvdWxkIGJlICJ4ZW4vcnQiIHRoZW4uDQo+IA0KPj4+PiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkL3J0LmMNCj4+Pj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZC9ydC5jDQo+Pj4+
IEBAIC01MDAsNyArNTAwLDcgQEAgZGVhZGxpbmVfcXVldWVfcmVtb3ZlKHN0cnVjdCBsaXN0
X2hlYWQgKnF1ZXVlLCBzdHJ1Y3QgDQo+Pj4+IGxpc3RfaGVhZCAqZWxlbSkNCj4+Pj4gwqB9
DQo+Pj4+DQo+Pj4+IMKgc3RhdGljIGlubGluZSBib29sDQo+Pj4+IC1kZWFkbGluZV9xdWV1
ZV9pbnNlcnQoc3RydWN0IHJ0X3VuaXQgKiAoKnFlbGVtKShzdHJ1Y3QgbGlzdF9oZWFkICop
LA0KPj4+PiArZGVhZGxpbmVfcXVldWVfaW5zZXJ0KHN0cnVjdCBydF91bml0ICogKCpxZWxl
bSkoc3RydWN0IGxpc3RfaGVhZCAqcV9pdGVyKSwNCj4+Pg0KPj4+IEkgdGhpbmsgaXQgc2hv
dWxkIGJlICJlbGVtIiBpbnN0ZWFkIG9mICJxX2l0ZXIiDQo+Pg0KPj4gV2h5IHdvdWxkIGl0
IG1hdHRlciB3aGF0IHRoZSBuYW1lIGlzPyBUaGVyZSdzIG5vIHNlcGFyYXRlIGRlY2wgdG8g
c3RheSBpbg0KPj4gc3luYyB3aXRoLiAoVGhhdCBzYWlkLCBJJ2QgYmUgaGFwcHkgd2l0aCAi
ZWxlbSI7IGl0J2xsIGJlIGEgbWF0dGVyIG9mIHRoZQ0KPj4gbWFpbnRhaW5lcnMgdG8ganVk
Z2UuKQ0KPj4NCj4+IEphbg0KPiANCj4gSSdkIGJlIG9rIHdpdGggdGhhdCB0b28uDQo+IA0K
DQpJIHRoaW5rIG5hbWluZyBpdCAiZWxlbSIgaXMgdGhlIGJldHRlciBjaG9pY2UsIGFzIGJv
dGggZnVuY3Rpb25zIHVzZWQgZm9yDQp0aGUgcWVsZW0oKSBwYXJhbWV0ZXIgbmFtZSB0aGVp
ciBwYXJhbWV0ZXIgImVsZW0iIGFscmVhZHkuDQoNCldpdGggdGhhdCBjaGFuZ2U6DQoNClJl
dmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdl
bg0K
--------------rZALDQ9r0TTI12XKubpUfcB0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------rZALDQ9r0TTI12XKubpUfcB0--

--------------OIPDhXb5WdY5H0XSCcQ812Lr--

--------------WuQilXu79WAWFWhw7p9PY70m
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmey9/YFAwAAAAAACgkQsN6d1ii/Ey8u
3Af+O6KbYzPRnLSFRQfKd0ourUI2nKIot6JjFORCi3qcwCRYibxxyEU1+D/Vmz5vCaYqC1ffG2IM
u8uN+jVxE5pNr7mjsMtRBSqMQQNOcX2b3YJKEd4wHbCA+H9RsL4QcgkldBZkeTLATUYTFLwNVLI7
eUf+NwMB0oWbctaCA5IroD/ExfsqjTyoZsP+Z903OCUAzWspVIxAVvmfEvLnSQJKMFoZs9Yddjxx
HCDIGlzVULxQplj/AKTcWL4qRaBLcw3ZJIO5YdvTaCjUNlqBOdqNw+jc6L6tKUjfi0LdiJ4JARU4
rvlxDhUa9H0A4ntQaUXtPGJCd4FsoFkaqaOapu9O7g==
=hN3t
-----END PGP SIGNATURE-----

--------------WuQilXu79WAWFWhw7p9PY70m--

