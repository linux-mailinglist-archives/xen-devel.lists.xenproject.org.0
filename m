Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFE79F64CC
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 12:24:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860297.1272347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNs9y-0004eO-3e; Wed, 18 Dec 2024 11:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860297.1272347; Wed, 18 Dec 2024 11:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNs9y-0004bQ-0a; Wed, 18 Dec 2024 11:24:10 +0000
Received: by outflank-mailman (input) for mailman id 860297;
 Wed, 18 Dec 2024 11:24:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fISF=TL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tNs9w-0004bK-Ms
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 11:24:08 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 989a86f4-bd32-11ef-a0d6-8be0dac302b0;
 Wed, 18 Dec 2024 12:24:07 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a977d6cc7so854470766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 03:24:07 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652ad15bfsm5388377a12.19.2024.12.18.03.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 03:24:06 -0800 (PST)
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
X-Inumbo-ID: 989a86f4-bd32-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734521047; x=1735125847; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rKADOUVSg3P6JzB3kuGfwq6CPirviwx4/LDew2MuPis=;
        b=Zi//wboW9GvrSr2CvGjRQPukMTMsv+vHytM90ZquRURsdj/ZopJFy3lylDMguOVJxg
         r2c+hVlV/90/0pqJwrupQMzRJo+sGfGQkV1xWncUxXTI+I/wDsQlUN4DtT4lPrEXHE2P
         vtkxiDHgn6xQgdNGk+WjUfd2doninx5tKnfOFgegMmw5Zf0SRD4MI0EOfejrqsJnjWSF
         T/JVo8j7ConZlUefkjMuCjWzQie4oueLJZo0Cufd6IcyeVkpU9bthzNMopSMcAqoPPC0
         ohTtNXMoQA7IfaEgLegWK6xkWwNjpgfiNBA2Jxkvx9W5/VXZ9eYB4cfKkUNK752wBENp
         loeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734521047; x=1735125847;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rKADOUVSg3P6JzB3kuGfwq6CPirviwx4/LDew2MuPis=;
        b=KqPpULY2EKiNN0M7Q42FEFeIuRow0vk5cRfhMsbvGoQcMFRp4Hn/kbIZ7MJhxzmvcA
         yatxlg8/GSMAhJ4Kh24I6ovtc5hAwvsW1GLMOaj/f5dupYTmhHVcLHh4HOfv+830kBf1
         CM6nG2VuhtUTrmFuQj1F1C4SLBf0kXyVua0xPsoe9JslEBwrdw1kApqAVYHJkiecydtZ
         UOw4VvJ3QV2iIxKFMmFGWmtZnyQPciJNfY9sBrjwXRlTkm1WUsaMGHdgXVW+KYZiVzTr
         FOYzAzu4stAHO+J8vq9c+acycY033d128hMf9RHs9j4aOXPSbgNKDqJWBh7EliLEqOws
         kkKg==
X-Forwarded-Encrypted: i=1; AJvYcCU7evUNaEpghpzsM+weQcxTOjbTGVGG3dhyMUx7H3Rv31ziS6D8ix/d39MmgIkVUEewvseTesDv7PA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjKiRfJXuPg2trc25IJ4n6InWRKaCoNxr4vnSy9VUe3Zyn9juB
	FDq4O4gk+JR4ECSSI/lBG3Mx7Ahh8ZgiisiwBW9rcz6J8dvzsn/lkniVjqB7y/c=
X-Gm-Gg: ASbGncuvcIq3OtYZG0fgVNfEzqzLCJW2/9IPUYGB1NK4oAD5Vt1oB2yT35oKlLKXxE5
	UiRriYW1+2TF8Ly1wUqOt4XQSRXKPnhCYTYcw06qgvX2/37JrKePVqarGoVYqkrNv52XiE1Xrq1
	MzDaO89x2X0Tsw9sVQtwuOE5eV2cFDyHmLfjBMELX+tPWjFHgf2eLjvd3AgQ4Ohdyi/lT5pKWPt
	tz+exmO5i0jfIpxwP4fGZAxg7IJlPU7snYOEcviYwIirD13kFWBcaaSAAeZK1pBE8u8xOS8xdEk
	69vvOJk4McSHDzn5VeR2E7zB9nle5xLPxm8ry30uZ5iATzEoNd32X+O/MjBpmces8tnSN/AZls4
	i5gOYbA==
X-Google-Smtp-Source: AGHT+IF5SQzsNXVV8lc2al1cGoEXz3poXNEhJy1XoWl32vyAo0iX4zGhBygZsl2dso92tKzUcImL7w==
X-Received: by 2002:a05:6402:3550:b0:5d0:c7a7:ac13 with SMTP id 4fb4d7f45d1cf-5d7ee3fde20mr5630156a12.34.1734521047034;
        Wed, 18 Dec 2024 03:24:07 -0800 (PST)
Message-ID: <733e95a6-dd33-422a-a25b-9f08cef5860e@suse.com>
Date: Wed, 18 Dec 2024 12:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen/mmu: Increase MAX_CONTIG_ORDER
To: Thierry Escande <thierry.escande@vates.tech>,
 Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20241204171346.458105-1-thierry.escande@vates.tech>
 <ccb28ccc-531c-4ead-9a27-76cc430f8c35@suse.com>
 <cc61bdce-47af-45ea-8ace-173adef9ae41@vates.tech>
 <cbc389e4-3b69-4681-ad66-6102b0ed0cae@suse.com>
 <8fb77778-b821-4e38-a835-54883ba14e4b@suse.com>
 <ed764807-a58b-473c-911d-b52f013f89b2@vates.tech>
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
In-Reply-To: <ed764807-a58b-473c-911d-b52f013f89b2@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IU1rzrY1hP2GvmiIBYMdsg6k"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IU1rzrY1hP2GvmiIBYMdsg6k
Content-Type: multipart/mixed; boundary="------------KONvUQBmacrsoI30Y0kRMJZz";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Thierry Escande <thierry.escande@vates.tech>,
 Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <733e95a6-dd33-422a-a25b-9f08cef5860e@suse.com>
Subject: Re: [PATCH] x86/xen/mmu: Increase MAX_CONTIG_ORDER
References: <20241204171346.458105-1-thierry.escande@vates.tech>
 <ccb28ccc-531c-4ead-9a27-76cc430f8c35@suse.com>
 <cc61bdce-47af-45ea-8ace-173adef9ae41@vates.tech>
 <cbc389e4-3b69-4681-ad66-6102b0ed0cae@suse.com>
 <8fb77778-b821-4e38-a835-54883ba14e4b@suse.com>
 <ed764807-a58b-473c-911d-b52f013f89b2@vates.tech>
In-Reply-To: <ed764807-a58b-473c-911d-b52f013f89b2@vates.tech>
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

--------------KONvUQBmacrsoI30Y0kRMJZz
Content-Type: multipart/mixed; boundary="------------N004l0OXHZtI0hPekMD1aKf8"

--------------N004l0OXHZtI0hPekMD1aKf8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMTIuMjQgMTI6MTEsIFRoaWVycnkgRXNjYW5kZSB3cm90ZToNCj4gDQo+IA0KPiBP
biAxMi8xMi8yMDI0IDEyOjA5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTIuMTIu
MjQgMTE6MjIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDExLjEyLjIwMjQgMTk6MjAs
IFRoaWVycnkgRXNjYW5kZSB3cm90ZToNCj4+Pj4gSGkgSmFuLA0KPj4+Pg0KPj4+PiBPbiAw
OS8xMi8yMDI0IDExOjA0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDA0LjEyLjIw
MjQgMTg6MTQsIFRoaWVycnkgRXNjYW5kZSB3cm90ZToNCj4+Pj4+PiBXaXRoIGNoYW5nZSA5
ZjQwZWM4NGE3OTcgKHhlbi9zd2lvdGxiOiBhZGQgYWxpZ25tZW50IGNoZWNrIGZvciBkbWEN
Cj4+Pj4+PiBidWZmZXJzKSwgdGhlIGRyaXZlciBtcHQzc2FzIGZhaWxzIHRvIGxvYWQgYmVj
YXVzZSBpdCBjYW5ub3QgYWxsb2NhdGUNCj4+Pj4+PiBpdHMgRE1BIHBvb2wgZm9yIGFuIGFs
bG9jYXRpb24gc2l6ZSBvZiB+MiwzIE1CeXRlcy4gVGhpcyBpcyBiZWNhdXNlDQo+Pj4+Pj4g
dGhlDQo+Pj4+Pj4gYWxpZ25lbWVudCBjaGVjayBhZGRlZCBieSA5ZjQwZWM4NGE3OTcgZmFp
bHMgYW5kDQo+Pj4+Pj4geGVuX3N3aW90bGJfYWxsb2NfY29oZXJlbnQoKSBlbmRzIHVwIGNh
bGxpbmcNCj4+Pj4+PiB4ZW5fY3JlYXRlX2NvbnRpZ3VvdXNfcmVnaW9uKCkgd2l0aCBhIHNp
emUgb3JkZXIgb2YgMTAgd2hpY2ggaXMgdG9vDQo+Pj4+Pj4gaGlnaA0KPj4+Pj4+IGZvciB0
aGUgY3VycmVudCBtYXggdmFsdWUuDQo+Pj4+Pj4NCj4+Pj4+PiBUaGlzIHBhdGNoIGluY3Jl
YXNlcyB0aGUgTUFYX0NPTlRJR19PUkRFUiBmcm9tIDkgdG8gMTAgKDRNQikgdG8gYWxsb3cN
Cj4+Pj4+PiBzdWNoIGFsbG9jYXRpb25zLg0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogVGhpZXJyeSBFc2NhbmRlIDx0aGllcnJ5LmVzY2FuZGVAdmF0ZXMudGVjaD4NCj4+Pj4+
PiAtLS0NCj4+Pj4+PiAgwqAgYXJjaC94ODYveGVuL21tdV9wdi5jIHwgMiArLQ0KPj4+Pj4+
ICDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+
Pj4+Pg0KPj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vbW11X3B2LmMgYi9hcmNo
L3g4Ni94ZW4vbW11X3B2LmMNCj4+Pj4+PiBpbmRleCA1NWE0OTk2ZDBjMDQuLjdmMTEwNzQw
ZTFhMiAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9hcmNoL3g4Ni94ZW4vbW11X3B2LmMNCj4+Pj4+
PiArKysgYi9hcmNoL3g4Ni94ZW4vbW11X3B2LmMNCj4+Pj4+PiBAQCAtMjIwMCw3ICsyMjAw
LDcgQEAgdm9pZCBfX2luaXQgeGVuX2luaXRfbW11X29wcyh2b2lkKQ0KPj4+Pj4+ICDCoCB9
DQo+Pj4+Pj4gIMKgIMKgIC8qIFByb3RlY3RlZCBieSB4ZW5fcmVzZXJ2YXRpb25fbG9jay4g
Ki8NCj4+Pj4+PiAtI2RlZmluZSBNQVhfQ09OVElHX09SREVSIDkgLyogMk1CICovDQo+Pj4+
Pj4gKyNkZWZpbmUgTUFYX0NPTlRJR19PUkRFUiAxMCAvKiA0TUIgKi8NCj4+Pj4+PiAgwqAg
c3RhdGljIHVuc2lnbmVkIGxvbmcgZGlzY29udGlnX2ZyYW1lc1sxPDxNQVhfQ09OVElHX09S
REVSXTsNCj4+Pj4+DQo+Pj4+PiBXaGlsZSBsYWNraW5nIHJlc3BlY3RpdmUgY29tbWVudGFy
eSwgYnVtcGluZyB0aGlzIHZhbHVlIGltbyBhbHNvDQo+Pj4+PiBuZWVkcyB0bw0KPj4+Pj4g
dGFrZSBpbnRvIGFjY291bnQgWGVuIGl0c2VsZiwgYXQgbGVhc3QgY29tbWl0LW1lc3NhZ2Ut
d2lzZS4gVGhlDQo+Pj4+PiBidW1waW5nIGlzDQo+Pj4+PiBmaW5lIGZvciBEb20wIGluIGFu
eSBldmVudC4gSXQgaXMgYWxzbyBmaW5lIGZvciBEb21VLXMgd2l0aCB0aGUNCj4+Pj4+IGRl
ZmF1bHRzDQo+Pj4+PiBidWlsdCBpbnRvIHRoZSBoeXBlcnZpc29yIChvcmRlcnMgMTIgYW5k
IDEwIHJlc3BlY3RpdmVseSBmb3IgeDg2IGFuZA0KPj4+Pj4gQXJtKSwNCj4+Pj4+IHlldCBl
c3BlY2lhbGx5IGZvciBBcm0gKGFuZCBpbiB0aGUgZnV0dXJlIFBQQyBhbmQgUklTQy1WKSBh
bnkgZnVydGhlcg0KPj4+Pj4gYnVtcGluZyB3b3VsZCBiZSBsZXNzIHN0cmFpZ2h0Zm9yd2Fy
ZC4NCj4+Pj4NCj4+Pj4gVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dC4gT24gdGhlIFhl
biBzaWRlLCBDT05GSUdfQ1RMRE9NX01BWF9PUkRFUg0KPj4+PiBhbmQgQ09ORklHX0hXRE9N
X01BWF9PUkRFUiBzZWVtIGJpZyBlbm91Z2ggb24gYWxsIGFyY2hpdGVjdHVyZXMuIEJ1dCBJ
DQo+Pj4+IHNlZSBDT05GSUdfRE9NVV9NQVhfT1JERVIgc2V0IHRvIDkgKGFsc28gYWxsIGFy
Y2hzKS4gV29uJ3QgdGhhdCBiZSBhDQo+Pj4+IHByb2JsZW0gZm9yIGRyaXZlcnMgdHJ5aW5n
IHRvIGFsbG9jYXRlIG1vcmUgdGhhbiB0aGF0IGZyb20gYSBkb21VID8NCj4+Pg0KPj4+IEEg
ZHJpdmVyIGFzc3VtZXMgYSAocGh5c2ljYWwpIGRldmljZSB0byBiZSBpbiB0aGUgRG9tVSwg
YXQgd2hpY2ggcG9pbnQgaXQNCj4+PiBpcyBDT05GSUdfUFRET01fTUFYX09SREVSIHdoaWNo
IGFwcGxpZXMgKFBUIHN0YW5kaW5nIGZvciBwYXNzLXRocm91Z2gpLg0KPj4+DQo+Pj4+PiBI
b3dldmVyIC0gZG9lcyB0aGUgZHJpdmVyIHJlYWxseSBuZWVkIHRoaXMgYmlnIGEgY29udGln
dW91cyBjaHVuaz8gSXQNCj4+Pj4+IHdvdWxkIHNlZW0gZmFyIG1vcmUgZGVzaXJhYmxlIHRv
IG1lIHRvIGJyZWFrIHRoYXQgdXAgc29tZSwgaWYgcG9zc2libGUuDQo+Pj4+DQo+Pj4+IFNp
bmNlIHRoaXMgd29ya3Mgb24gYmFyZSBtZXRhbCBJJ20gYWZyYWlkIHRoZSBkcml2ZXIgbWFp
bnRhaW5lciAobXB0DQo+Pj4+IGZ1c2lvbiBkcml2ZXIpIHdpbGwganVzdCB0ZWxsIG1lIHRv
IGZpeCBYZW4uDQo+Pj4NCj4+PiBXZWxsLiBUaGUgYmlnZ2VyIHN1Y2ggYWxsb2NhdGlvbnMs
IHRoZSBsYXJnZXIgdGhlIHJpc2sgdGhhdCBvbiBzeXN0ZW1zDQo+Pj4gdGhhdCBoYXZlIGJl
ZW4gdXAgZm9yIGEgd2hpbGUgc3VjaCBhbGxvY2F0aW9ucyBjYW4ndCBiZSBmdWxmaWxsZWQg
YW55bW9yZQ0KPj4+IGV2ZW4gaW4gdGhlIGJhcmUgbWV0YWwgY2FzZS4NCj4+DQo+PiBZZXMu
IEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGp1c3Qgd29yayBhcm91bmQgdGhpcyBpc3N1ZSB3
aXRob3V0IGhhdmluZw0KPj4gZXZlbiB0cmllZCB0byBnZXQgdGhlIGRyaXZlciBmaXhlZC4g
SW4gY2FzZSB0aGV5IHJlZnVzZSB0byBjaGFuZ2UgaXQsIHdlDQo+PiBjYW4gc3RpbGwgaW5j
cmVhc2UgTUFYX0NPTlRJR19PUkRFUi4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNr
LiBJJ2xsIHRyeSB0byBoYXZlIGEgbG9vayBhdCB0aGUgZHJpdmVyIGlmIEkgaGF2ZQ0KPiB0
aW1lIHRvIGRvIHNvLg0KDQpBbm90aGVyIHRob3VnaHQgd291bGQgYmUgdG8gY2hhbmdlIHRo
ZSBnZW5lcmljIERNQSBhbGxvY2F0aW9uIHRvIG5vdCByZXF1aXJlDQphbGlnbm1lbnQgYmFz
ZWQgb24gdGhlIHJvdW5kZWQgdXAgc2l6ZSwgYnV0IG9uIHRoZSBsYXJnZXN0IHBvd2VyLW9m
LTIgY2h1bmsNCmZpdHRpbmcgaW50byB0aGUgcmVxdWVzdGVkIHNpemUuDQoNCkkgZG9uJ3Qg
c2VlIHdoeSBhIDIuMyBNQiBtZW1vcnkgYWxsb2NhdGlvbiB3b3VsZCBuZWVkIHRvIGJlIDQg
TUIgYWxpZ25lZC4gSXQNCnNob3VsZCBiZSBwZXJmZWN0bHkgZmluZSB0byBhbGlnbiBpdCB0
byAyIE1CIG9ubHkuDQoNCg0KSnVlcmdlbg0K
--------------N004l0OXHZtI0hPekMD1aKf8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------N004l0OXHZtI0hPekMD1aKf8--

--------------KONvUQBmacrsoI30Y0kRMJZz--

--------------IU1rzrY1hP2GvmiIBYMdsg6k
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdisNYFAwAAAAAACgkQsN6d1ii/Ey/b
Pwf/Uq2jGlmTcfz+X1FzYRn6+X+tgSkBHBAYSArocNyfSZ39G0Kkp8y1i93yNO32ncU7Xd+DXGxa
Somn35DX7vZSeePMW6iLCcebaRr/HDrT5fVhMsUdhwpRJ21B0s8TNO/N5sLBfdLZJyaJH7dDPS8G
W62w1Zqhko9rgvpJejA/xZ7Vu8wtzNW8DSUqZtDdmGHQ7SL4GvqMta1DzLk3iAxxKsjBW0zkXWsq
i7FsRO4lFwtcMuhCXXVC+mlM4SN5xRNDULF7uMex0xVDGmuYx7zF3wIBfvtH0JrvYK54Oz3zpV0a
W7aXmKhaMN4r2xxSkWNUnbCvNHCTVQjYQ4wALRrCnQ==
=UJGJ
-----END PGP SIGNATURE-----

--------------IU1rzrY1hP2GvmiIBYMdsg6k--

