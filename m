Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7C89EC5D3
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 08:45:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853976.1267295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHOt-0003fQ-Ng; Wed, 11 Dec 2024 07:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853976.1267295; Wed, 11 Dec 2024 07:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHOt-0003dw-Kn; Wed, 11 Dec 2024 07:44:51 +0000
Received: by outflank-mailman (input) for mailman id 853976;
 Wed, 11 Dec 2024 07:44:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tDfV=TE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tLHOs-0003do-63
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 07:44:50 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbcce425-b793-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 08:44:48 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385df53e559so4334749f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 23:44:48 -0800 (PST)
Received: from ?IPV6:2003:e5:8701:7700:f2d:e3aa:8e9e:99bf?
 (p200300e5870177000f2de3aa8e9e99bf.dip0.t-ipconnect.de.
 [2003:e5:8701:7700:f2d:e3aa:8e9e:99bf])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3878251bc16sm647457f8f.86.2024.12.10.23.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 23:44:46 -0800 (PST)
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
X-Inumbo-ID: cbcce425-b793-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733903087; x=1734507887; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lple0WAmTTtnF6BRMys+naYMN3+WtKjnqDz2VMiUppw=;
        b=DD3I6k7idVUyDKRw6cR1mRGi309cfY6v41vHuj0LNsNl9ds5tS9+xti/NdeIqGlxLu
         OSyQxO/5nqPiAlLUYTOVDgsqTBafKJiZHykDQnI7CPekBjr3YePr/SMoHiFvmPVgj9vf
         JSP9orlgD1coMrLcxFyIudSq95WzHzVAPVvRMfP/kvJclL3XfLuzDX/p2DdZFQVGjt0Q
         hLp/3lkQpdiuRb89bF32lIo3V36VFZU3ZfKrY8+gE9xsosQJNJLqnwRDQIUCnqW5GnYd
         dRkP8Bp7WH65E3zeLyQkZxjyBe1VKVzIHWo5UaQ4mUA4Fc2P4X1jAL9M6oy9Lv2jE4qm
         Ilpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733903087; x=1734507887;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lple0WAmTTtnF6BRMys+naYMN3+WtKjnqDz2VMiUppw=;
        b=AeBUXLWeUHr5RjCSgkmo17tQ7kK10bES60zKi0wrd9nDyjPnECj7tT83E1OYaBUCHC
         aBYnAjpiKhS+TLrCQ4O3cZdCPA4Z7SFczkmwlbK3pJvSzj4DY8I+Rs1mpjmvJthbGuqj
         UDL33TTolNgPL8a/QwGl70LYPrfYB7iiNcvzl6zthy99iyf6F1Vrvik94Eb/w47CU6JY
         iFFma6I40BbrO/CIpazhB7oJ0pk/Fxr//Y+FOTUproSDNI+lckDvZGffpPYcOYPx7Nm/
         ahQEy06BAzztq4o+r9Z8b14u+6UPMb81ZmBvt4rW52VXN1UbV134PSNauCNKKmjp9LS/
         jzUw==
X-Forwarded-Encrypted: i=1; AJvYcCUe+RGXV/pSIwRdDjMInmIvX974VHQSVUl8NEAXQSx3IySk5EEYlqlreeQAd3O7UHKvjwMYB5BMR90=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTOR00DHcinWQD3ePia/FlzK3qSv3r5BIcoFp0yX/JRWWibWwb
	C4YOt4aEpBbwGR7KRwqCpDUiDXX5hKfCNOnbU2snpLssE3qrImd+p8UKRnNV2wY=
X-Gm-Gg: ASbGnct9iiRCMRKhE/symwNludCDATwln72YZdctsHvY+9YLEfG/s4K8Q9uYw9FeqFx
	E6a0ODdsoRH2aedHxaZtew9UGFYGnfkSuFIeB65IWsal8fNR63kVhtsXat6BsxQ48diZZGNszlQ
	EPlakA54e/29+O8pUyq5FBy4CXEGoS9eODgYA/d9Pu+aOI5Og3ODNc8aIrVe6tFfGbqTu8qhUyg
	tEYuyWzcvmkXUqHkGOiq8IsS9N6il5nXL1L+PF3RI0pGd1LjxmtKkb7YBc5uBWWpJsH3MpjSr4J
	N1Fd4U1U1vkywd9pueB6ZcZCpPp4X7mCXJcSYkt94X0XAvhfz2EuEMxvrXAcp4Hi6RB4YrSvKP1
	F
X-Google-Smtp-Source: AGHT+IGNv5YP2juyGZpQMEuKqJ56fqDC5Wjnlh9aX5OLHc7/75vnWKFnHFg2nhjIGWCicO+uuSqPEg==
X-Received: by 2002:a05:6000:42c6:b0:385:f6de:6266 with SMTP id ffacd0b85a97d-3864cea1eaamr915170f8f.24.1733903087382;
        Tue, 10 Dec 2024 23:44:47 -0800 (PST)
Message-ID: <c9e30b69-328a-47f5-abc4-02b5c3e379e8@suse.com>
Date: Wed, 11 Dec 2024 08:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen: add new domctl get_changed_domain
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241206130221.17773-1-jgross@suse.com>
 <20241206130221.17773-6-jgross@suse.com>
 <69e08251-c227-42a5-a2e4-a4eb7d63961d@suse.com>
 <30304914-f0c5-4053-ae23-890fa5b8a0c2@suse.com>
 <fd1eedc4-652a-427e-9520-77a62f3047e0@suse.com>
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
In-Reply-To: <fd1eedc4-652a-427e-9520-77a62f3047e0@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2GlcpF0tg9LWXT80a5IV1pVz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2GlcpF0tg9LWXT80a5IV1pVz
Content-Type: multipart/mixed; boundary="------------FYiImZLX7DTBYS6ytuvThDdZ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <c9e30b69-328a-47f5-abc4-02b5c3e379e8@suse.com>
Subject: Re: [PATCH v2 5/7] xen: add new domctl get_changed_domain
References: <20241206130221.17773-1-jgross@suse.com>
 <20241206130221.17773-6-jgross@suse.com>
 <69e08251-c227-42a5-a2e4-a4eb7d63961d@suse.com>
 <30304914-f0c5-4053-ae23-890fa5b8a0c2@suse.com>
 <fd1eedc4-652a-427e-9520-77a62f3047e0@suse.com>
In-Reply-To: <fd1eedc4-652a-427e-9520-77a62f3047e0@suse.com>
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

--------------FYiImZLX7DTBYS6ytuvThDdZ
Content-Type: multipart/mixed; boundary="------------8trdgdO3bPLJNafea9Cwkvbh"

--------------8trdgdO3bPLJNafea9Cwkvbh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTIuMjQgMTc6MjksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMC4xMi4yMDI0
IDE2OjUyLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMDkuMTIuMjQgMTg6MDQsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA2LjEyLjIwMjQgMTQ6MDIsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4+Pj4gKysrIGIv
eGVuL2NvbW1vbi9kb21haW4uYw0KPj4+PiBAQCAtMTkyLDYgKzE5Miw1NCBAQCBzdGF0aWMg
dm9pZCBkb21haW5fY2hhbmdlZF9zdGF0ZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+
PiAgICAgICAgc3Bpbl91bmxvY2soJmRvbV9zdGF0ZV9jaGFuZ2VkX2xvY2spOw0KPj4+PiAg
ICB9DQo+Pj4+ICAgIA0KPj4+PiArc3RhdGljIHZvaWQgc2V0X2RvbWFpbl9zdGF0ZV9pbmZv
KHN0cnVjdCB4ZW5fZG9tY3RsX2dldF9kb21haW5fc3RhdGUgKmluZm8sDQo+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkN
Cj4+Pj4gK3sNCj4+Pj4gKyAgICBpbmZvLT5zdGF0ZSA9IFhFTl9ET01DVExfR0VURE9NU1RB
VEVfU1RBVEVfRVhJU1Q7DQo+Pj4+ICsgICAgaWYgKCBkLT5pc19zaHV0X2Rvd24gKQ0KPj4+
PiArICAgICAgICBpbmZvLT5zdGF0ZSB8PSBYRU5fRE9NQ1RMX0dFVERPTVNUQVRFX1NUQVRF
X1NIVVRET1dOOw0KPj4+PiArICAgIGlmICggZC0+aXNfZHlpbmcgPT0gRE9NRFlJTkdfZGVh
ZCApDQo+Pj4+ICsgICAgICAgIGluZm8tPnN0YXRlIHw9IFhFTl9ET01DVExfR0VURE9NU1RB
VEVfU1RBVEVfRFlJTkc7DQo+Pj4NCj4+PiBUaGUgcHVibGljIGNvbnN0YW50IHNheWluZyAi
ZHlpbmciIGlzbid0IHF1aXRlIGluIGxpbmUgd2l0aCB0aGUgaW50ZXJuYWwNCj4+PiBjb25z
dGFudCBzYXlpbmcgImRlYWQiLiBJdCBtYXkgd2VsbCBiZSB0aGF0IFhlbnN0b3JlIG9ubHkg
Y2FyZXMgYWJvdXQgdGhlDQo+Pj4gImRlYWQiIHN0YXRlLCBidXQgdGhlbiBpdCB3b3VsZCBi
ZXR0ZXIgYmUgbmVtYWVkIHRoaXMgd2F5IGFsc28gaW4gdGhlDQo+Pj4gcHVibGljIGludGVy
ZmFjZSwgSSB0aGluay4NCj4+DQo+PiBPa2F5LCBJJ2xsIHJlbmFtZSBpdCB0byAiWEVOX0RP
TUNUTF9HRVRET01TVEFURV9TVEFURV9ERUFEIi4NCj4gDQo+IFdlbGwsIG1heWJlIGhhdmUg
Ym90aCBEWUlORyBhbmQgREVBRCwgZXZlbiBpZiBYZW5zdG9yZSByaWdodCBub3cgbmVlZHMg
b25seSBvbmU/DQoNClllcywgbWlnaHQgYmUgaW50ZXJlc3RpbmcgaW4gdGhlIGZ1dHVyZS4N
Cg0KPiANCj4+Pj4gQEAgLTg2Niw2ICs4NzMsMTUgQEAgbG9uZyBkb19kb21jdGwoWEVOX0dV
RVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQ0KPj4+PiAgICAgICAg
ICAgICAgICAgICAgX19IWVBFUlZJU09SX2RvbWN0bCwgImgiLCB1X2RvbWN0bCk7DQo+Pj4+
ICAgICAgICAgICAgYnJlYWs7DQo+Pj4+ICAgIA0KPj4+PiArICAgIGNhc2UgWEVOX0RPTUNU
TF9nZXRfZG9tYWluX3N0YXRlOg0KPj4+PiArICAgICAgICByZXQgPSB4c21fZ2V0X2RvbWFp
bl9zdGF0ZShYU01fWFNfUFJJViwgZCk7DQo+Pj4+ICsgICAgICAgIGlmICggcmV0ICkNCj4+
Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+PiArDQo+Pj4+ICsgICAgICAgIGNvcHliYWNr
ID0gMTsNCj4+Pj4gKyAgICAgICAgcmV0ID0gZ2V0X2RvbWFpbl9zdGF0ZSgmb3AtPnUuZ2V0
X2RvbWFpbl9zdGF0ZSwgZCwgJm9wLT5kb21haW4pOw0KPj4+PiArICAgICAgICBicmVhazsN
Cj4+Pg0KPj4+IEVzcGVjaWFsbHkgd2l0aCB0aGlzIGJlaW5nIGEgc3RhYmxlIGludGVyZmFj
ZSwgc3VyZWx5IHRoZSB0d28gcGFkZGluZyBmaWVsZHMNCj4+PiB3YW50IGNoZWNraW5nIHRv
IGJlIHplcm8gb24gaW5wdXQgKHRvIHBvc3NpYmx5IGFsbG93IHRoZWlyIGZ1dHVyZSB1c2Ug
Zm9yDQo+Pj4gc29tZXRoaW5nIGlucHV0LWlzaCkuIFRoZW4gZXZlbiB0aGUgbWVtc2V0KCkg
aW4gdGhlIGZ1bmN0aW9uIG1heSBub3QgcmVhbGx5DQo+Pj4gYmUgbmVlZGVkLg0KPj4NCj4+
IEknbGwgYWRkIHRoZSBjaGVjay4gUmVtb3ZpbmcgdGhlIG1lbXNldCgpIGlzIGEgbGl0dGxl
IGJpdCBkb3VidGZ1bCwgYXMgdGhpcw0KPj4gbWlnaHQgcmVzdWx0IGluIGxlYWtpbmcgaHlw
ZXJ2aXNvciBkYXRhIGUuZy4gaW4gY2FzZSBhIGRvbWFpbiBpc24ndCBleGlzdGluZw0KPj4g
KHRoaXMgd2lsbCBjb3B5IHRoZSBpbnRlcm5hbCBzdHJ1Y3QgdG8gdGhlIHVzZXIgZXZlbiBp
biB0aGUgLUVOT0VOVCBjYXNlKS4NCj4gDQo+IFdoaWNoIGludGVybmFsIHN0cnVjdD8gVGhl
IGZ1bmN0aW9uIGlzIHBhc3NlZCAmb3AtPi4uLiBmb3IgYm90aCBwYXJhbWV0ZXJzLg0KPiBB
bmQgb3AgaXMgZnVsbHkgY29waWVkIGZyb20gZ3Vlc3Qgc3BhY2UuDQoNClNpZ2guIEkgc2hv
dWxkbid0IGhhdmUgYW5zd2VyZWQgc28gcXVpY2tseSB3aGlsZSBiZWluZyBkZWVwIGludG8g
b3RoZXINCnRvcGljcy4gOi0oDQoNCldoaWxlIEkgYWdyZWUgdGhhdCB0aGUgY2FsbGVyIF9z
aG91bGRfIHBhc3MgdGhlc2UgZmllbGRzIHplcm9lZCwgSSdtIHN0aWxsDQpub3Qgc3VyZSB3
ZSBzaG91bGQgcmVseSBvbiBpdC4gRG8geW91IGluc2lzdCBvbiByZW1vdmluZyB0aGUgbWVt
c2V0KCk/IElmDQpub3QgSSdkIHJhdGhlciBrZWVwIGl0Lg0KDQoNCkp1ZXJnZW4NCg==
--------------8trdgdO3bPLJNafea9Cwkvbh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------8trdgdO3bPLJNafea9Cwkvbh--

--------------FYiImZLX7DTBYS6ytuvThDdZ--

--------------2GlcpF0tg9LWXT80a5IV1pVz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdZQu0FAwAAAAAACgkQsN6d1ii/Ey/K
xwf+PNHwnTJ1h+RjEAvIxs/GmAWVsOw+COOzzhzjmG8YKU8JvGxQ1ZZ8plu8AELRYlFZ/4xBxozq
7n9lebFDhov/jR0o0oxt06eWzMlvd32118kWvGrnvAJ9Ozu+fRFtU1/EWFUxU/UR/rfgNSa8QxcB
fSHzhIQehTMVP73z9d2eE/kzgl43vKAzM2PTwRGya4aT9eCiMBvvtRvklzDcsuoyzclkMznnUgiv
5yF7ujLXKNl+1DW5c3G9ETc2s3U+emE7RkL0Mw3TwPUP4ECeK4Qq/T4D2hDZIcEUneuqsDP7zaMA
2tBCNX08qnkxwbd22gYA9ftW3NR4ABKE1L3XS4YFkQ==
=6105
-----END PGP SIGNATURE-----

--------------2GlcpF0tg9LWXT80a5IV1pVz--

