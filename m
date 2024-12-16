Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE0B9F3454
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 16:21:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858314.1270560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCts-0004W8-2C; Mon, 16 Dec 2024 15:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858314.1270560; Mon, 16 Dec 2024 15:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCtr-0004UG-VX; Mon, 16 Dec 2024 15:20:47 +0000
Received: by outflank-mailman (input) for mailman id 858314;
 Mon, 16 Dec 2024 15:20:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hXi=TJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tNCtr-0004UA-7G
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 15:20:47 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52a6fb27-bbc1-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 16:20:46 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d3ecae02beso5523900a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 07:20:46 -0800 (PST)
Received: from ?IPV6:2003:e5:8725:5e00:fa69:c5cb:46d:3e5b?
 (p200300e587255e00fa69c5cb046d3e5b.dip0.t-ipconnect.de.
 [2003:e5:8725:5e00:fa69:c5cb:46d:3e5b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab96359b94sm345492666b.106.2024.12.16.07.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 07:20:45 -0800 (PST)
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
X-Inumbo-ID: 52a6fb27-bbc1-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734362446; x=1734967246; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CvD0uv/RptUvQVZMuSMRfyuoTAQPIMuShTyPw62aLT0=;
        b=R8/QsLBJOEZlus3Eji9j0ENmQ88hI6PDSx9kdzBLqXfxRoTfTsT77HYH9sVpTiCncx
         s3Xc2lKvymAki+QK5uqyIaTGjEeVuhMEzjYRYDoSmXOv7iqh3n4t6KRnnAi5CFnmznJy
         9v18CmER9+N82xESoEGoz5+mVGmmJuyr7DZKQIdWtwQkcEwRWhSFHXhESQabjHlraX5/
         cJRj0dxGbGu+1+PzBoLXpn8VRItMLmp4pag8jRKEeHpwnA+xig9WDzYjcHc6PDjBvyGS
         8GZu47uxLX7HK/f+D6d67ZXZT43wiwuuy4Orh+xX+DZ1o5BBi7py9JYfQFeQqQBzx5oa
         xxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734362446; x=1734967246;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CvD0uv/RptUvQVZMuSMRfyuoTAQPIMuShTyPw62aLT0=;
        b=Vr88/RaaOOl9gCIpeueosuNHVrbSq4Ve97yAKcPpo3Kz1O+POgCiZDCt4USRFWge5n
         Kl+EFy72plm7IhmBs58d9y9mgt25rGqsxNv6jSKKYmiNy0T9hgLRm3hyq7+tg2aa+cWW
         xzodZ9RdpMrySJJs2XRf0nztA6DTlM+/lpBgLB1lBURRANyvQG23u982j20vXt/eFF/2
         dAfOkb8oGsb//utZp+HaJ2+BlRpSQ4yvJ8DxnQ+WvyazerXf5qVbCooAJLdGuJE+PpfF
         yfMn8A1ynllbxIbJe/B7gKuGareOrQAgO/08PBuCLQBrVvTr2OaluLBbRjokKhINKa0Y
         Vw+A==
X-Forwarded-Encrypted: i=1; AJvYcCW3E6UtzaZWYB+dzUdITYFVfIZX9YKsxVwmbAxW99DZ5QQpcvFkapPqSO7yET9IgikxwMTLs5KD77o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTzA0YcB/GJqsVbWD5BV2rsp/xQ+WK51kJH9puoV9oqWMKo4C4
	k79fhI1+yCqVRlJ8dJBsgf8pLtedbnSOBm4OMZgx8SmZN1BSJhpsnBGEVbxHvjA=
X-Gm-Gg: ASbGncs27/6VBzY0IaFNbsfOeRYmUeK/JGz+E03XzHUtI0BkNhyFLGzHFcxSiJANW14
	lfbWW63ftKDVh9QuCHlnXAwJ7zVl9OuUyl/tYkyTzfm2oVCxXCiYtRWkWcErejfqz8vQs6avjBn
	D5cQuUK/fUvT4SpiUY0ITV7MSoYcq/VFsyuvWv9WcG1B7MkbXMY6jooMi1YYm/Z9y9fBNdKz/3e
	wY8bYMlJfMfvN8QhYt/TR2ijS2+rXy4S7do+xAiUzedvY+a0pAQNF0EVX34TTeLtd/mt2/wzdXS
	xqbBRAIk4wpNFj9rGFu7CoBSFDWl0OCD1duWVnuMJnu7aPUYa1vs0gOsr74vhGgLvDMrvxtM66p
	9ajM=
X-Google-Smtp-Source: AGHT+IHrbiM7WTW5EWpbfrrNgj5d+SHO/jLZdxcJGBENWqc9LOaqVGdha5Wym+/UBDGBDfZMdj96Yg==
X-Received: by 2002:a17:906:f585:b0:aa6:5201:7ae3 with SMTP id a640c23a62f3a-aab77ea5c47mr1441072366b.40.1734362445642;
        Mon, 16 Dec 2024 07:20:45 -0800 (PST)
Message-ID: <3974c88f-ba87-4b09-bdc4-5bb77b06139b@suse.com>
Date: Mon, 16 Dec 2024 16:20:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] xen: add new domctl get_changed_domain
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241213162421.16782-1-jgross@suse.com>
 <20241213162421.16782-6-jgross@suse.com>
 <f5371446-98e5-42ff-aa8d-0a7252e89f1f@suse.com>
 <7061e31b-2d61-40fd-b2e9-528c4faf41f9@suse.com>
 <d516d05b-a69d-46d8-b90c-c868dd68eab1@suse.com>
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
In-Reply-To: <d516d05b-a69d-46d8-b90c-c868dd68eab1@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HxXmnoYRQDEK5Lg1aMq0WJvZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HxXmnoYRQDEK5Lg1aMq0WJvZ
Content-Type: multipart/mixed; boundary="------------AYlcXS5r7fAZ1iMeVxifbgh2";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <3974c88f-ba87-4b09-bdc4-5bb77b06139b@suse.com>
Subject: Re: [PATCH v3 5/7] xen: add new domctl get_changed_domain
References: <20241213162421.16782-1-jgross@suse.com>
 <20241213162421.16782-6-jgross@suse.com>
 <f5371446-98e5-42ff-aa8d-0a7252e89f1f@suse.com>
 <7061e31b-2d61-40fd-b2e9-528c4faf41f9@suse.com>
 <d516d05b-a69d-46d8-b90c-c868dd68eab1@suse.com>
In-Reply-To: <d516d05b-a69d-46d8-b90c-c868dd68eab1@suse.com>
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

--------------AYlcXS5r7fAZ1iMeVxifbgh2
Content-Type: multipart/mixed; boundary="------------0sjivpxVRBWyl62DlMCvLb0V"

--------------0sjivpxVRBWyl62DlMCvLb0V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMTIuMjQgMTY6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNi4xMi4yMDI0
IDE2OjAzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTYuMTIuMjQgMTE6NDEsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDEzLjEyLjIwMjQgMTc6MjQsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4+Pj4gKysrIGIv
eGVuL2NvbW1vbi9kb21haW4uYw0KPj4+PiBAQCAtMTkzLDYgKzE5Myw1NyBAQCBzdGF0aWMg
dm9pZCBkb21haW5fY2hhbmdlZF9zdGF0ZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+
PiAgICAgICAgc3Bpbl91bmxvY2soJmRvbV9zdGF0ZV9jaGFuZ2VkX2xvY2spOw0KPj4+PiAg
ICB9DQo+Pj4+ICAgIA0KPj4+PiArc3RhdGljIHZvaWQgc2V0X2RvbWFpbl9zdGF0ZV9pbmZv
KHN0cnVjdCB4ZW5fZG9tY3RsX2dldF9kb21haW5fc3RhdGUgKmluZm8sDQo+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkN
Cj4+Pj4gK3sNCj4+Pj4gKyAgICBpbmZvLT5zdGF0ZSA9IFhFTl9ET01DVExfR0VURE9NU1RB
VEVfU1RBVEVfRVhJU1Q7DQo+Pj4+ICsgICAgaWYgKCBkLT5pc19zaHV0X2Rvd24gKQ0KPj4+
PiArICAgICAgICBpbmZvLT5zdGF0ZSB8PSBYRU5fRE9NQ1RMX0dFVERPTVNUQVRFX1NUQVRF
X1NIVVRET1dOOw0KPj4+PiArICAgIGlmICggZC0+aXNfZHlpbmcgPT0gRE9NRFlJTkdfZHlp
bmcgKQ0KPj4+PiArICAgICAgICBpbmZvLT5zdGF0ZSB8PSBYRU5fRE9NQ1RMX0dFVERPTVNU
QVRFX1NUQVRFX0RZSU5HOw0KPj4+PiArICAgIGlmICggZC0+aXNfZHlpbmcgPT0gRE9NRFlJ
TkdfZGVhZCApDQo+Pj4+ICsgICAgICAgIGluZm8tPnN0YXRlIHw9IFhFTl9ET01DVExfR0VU
RE9NU1RBVEVfU1RBVEVfREVBRDsNCj4+Pj4gKyAgICBpbmZvLT51bmlxdWVfaWQgPSBkLT51
bmlxdWVfaWQ7DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4gK2ludCBnZXRfZG9tYWluX3N0YXRl
KHN0cnVjdCB4ZW5fZG9tY3RsX2dldF9kb21haW5fc3RhdGUgKmluZm8sIHN0cnVjdCBkb21h
aW4gKmQsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICBkb21pZF90ICpkb21pZCkNCj4+
Pj4gK3sNCj4+Pj4gKyAgICB1bnNpZ25lZCBpbnQgZG9tOw0KPj4+PiArDQo+Pj4+ICsgICAg
aWYgKCBpbmZvLT5wYWQwIHx8IGluZm8tPnBhZDEgKQ0KPj4+PiArICAgICAgICByZXR1cm4g
LUVJTlZBTDsNCj4+Pj4gKw0KPj4+PiArICAgIGlmICggZCApDQo+Pj4+ICsgICAgew0KPj4+
PiArICAgICAgICBzZXRfZG9tYWluX3N0YXRlX2luZm8oaW5mbywgZCk7DQo+Pj4+ICsNCj4+
Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+Pj4+ICsgICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAg
d2hpbGUgKCAoZG9tID0gZmluZF9maXJzdF9iaXQoZG9tX3N0YXRlX2NoYW5nZWQsIERPTUlE
X01BU0sgKyAxKSkgPA0KPj4+PiArICAgICAgICAgICAgRE9NSURfRklSU1RfUkVTRVJWRUQg
KQ0KPj4+PiArICAgIHsNCj4+Pj4gKyAgICAgICAgaWYgKCB0ZXN0X2FuZF9jbGVhcl9iaXQo
ZG9tLCBkb21fc3RhdGVfY2hhbmdlZCkgKQ0KPj4+DQo+Pj4gRm9yIHRoZXNlIHR3byBhY2Nl
c3NlcyB0byBkb21fc3RhdGVfY2hhbmdlZCBkb24ndCB5b3UgbmVlZCB0byBob2xkIHRoZQ0K
Pj4+IGxvY2sgcGF0Y2ggNCBpbnRyb2R1Y2VzPyBBbHNvIGRpZG4ndCB5b3Ugc2F5IHlvdSdk
IGNvbnN0cmFpbiB0aGUgbmV3DQo+Pj4gc3ViLW9wIHRvIHRoZSBzb2xlIGRvbWFpbiBoYXZp
bmcgVklSUV9ET01fRVhFQyBib3VuZCAod2hpY2gsIGZ0YW9kLA0KPj4+IGlzbid0IGVub3Vn
aCB0byBlbGltaW5hdGUgdGhlIHJhY2UpPw0KPj4NCj4+IEp1c3QgdG8gYmUgbW9yZSBzcGVj
aWZpYyByZWdhcmRpbmcgdGhlIHJhY2U6IEkgZ3Vlc3MgeW91IG1lYW4gdGhhdCBhIGRvbWFp
bg0KPj4gaGF2aW5nIHJlZ2lzdGVyZWQgZm9yIHRoZSBWSVJRIGRvZXNuJ3QgbWVhbiB0aGUg
Y2FsbGluZyBjb21wb25lbnQgYmVpbmcgaW4NCj4+IHRoYXQgZG9tYWluIHJlYWxseSBpcyB0
aGUgb25lIGFzc29jaWF0ZWQgd2l0aCB0aGUgVklSUS4NCj4+DQo+PiBXaGlsZSBiZWluZyB0
cnVlLCBldmVuIHRvZGF5IGl0IGlzIHBvc3NpYmxlIGZvciBvbmUgZG9tMCB1c2VyIHByb2Nl
c3MgdG8NCj4+ICJzdGVhbCIgYSBWSVJRIGZyb20gYW5vdGhlciBwcm9jZXNzIGJ5IHVzaW5n
IGRpcnR5IHRyaWNrcyB2aWEgdGhlIHByaXZjbWQNCj4+IGRyaXZlci4NCj4+DQo+PiBJbiB0
aGUgZW5kIGEgcHJvY2VzcyBoYXZpbmcgdGhlIGFjY2VzcyByaWdodHMgdG8gdXNlIHRoZSBw
cml2Y21kIGRyaXZlciBtdXN0DQo+PiBiZSB0cnVzdGVkIHRvIG5vdCBkaXN0dXJiIG90aGVy
IHByb2Nlc3NlcyB3aXRoIHRoZSBzYW1lIHJpZ2h0cy4NCj4gDQo+IE9mIGNvdXJzZSwgYnV0
IHRoYXQncyBub3QgZXhhY3RseSB3aGF0IEkgd2FzIGdldHRpbmcgYXQuIEkgd2FzIHRyeWlu
ZyB0bw0KPiBwb2ludCBvdXQgdGhhdCB0aGUgdklSUSBjaGVjayBhbG9uZSBpcyBzdGlsbCBp
bnN1ZmZpY2llbnQgdG8gYXZvaWQgcG90ZW50aWFsDQo+IGNyYXNoZXMgaGVyZSwgYnkgb25l
IHZDUFUgY2FsbGluZyBoZXJlIHdoaWxlIGFub3RoZXIgdW5iaW5kcyB0aGUgdklSUS4gVGFr
aW5nDQo+IHRoZSBsb2NrIGlzIHJlcXVpcmVkIGZvciBYZW4ncyBzYWZldHk7IGNoZWNraW5n
IHRoZSB2SVJRIGlzIGJvdW5kIGlzIGFuIGV4dHJhDQo+IHBvbGljeSBlbmZvcmNlbWVudC4N
Cg0KQWgsIG9rYXkuIEkgdGhpbmsgVjQgd2lsbCBjb3ZlciB5b3VyIHNjZW5hcmlvLg0KDQoN
Ckp1ZXJnZW4NCg==
--------------0sjivpxVRBWyl62DlMCvLb0V
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

--------------0sjivpxVRBWyl62DlMCvLb0V--

--------------AYlcXS5r7fAZ1iMeVxifbgh2--

--------------HxXmnoYRQDEK5Lg1aMq0WJvZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdgRUwFAwAAAAAACgkQsN6d1ii/Ey/t
Rgf/Zp1xT0MnwiLLEbBBCHtTX5wIRhFwU9k8T5G0u4lp0EZ99btuSPmP8+5t42nKwmp1nyuBzH5g
Yv55D8NC2wrfkshYv7suxig4IIEOA2Sj+5vDidqZ1xoFYPytopV8RKoHuqxYpFPFLlITGApYeGk4
DyeSAPIKFOp1TGDzVEsPx/tn6k6kpFYCY2WF4zj+1gc36tV1txkqGEy83X6lBnjEgQxpWS4IHeon
9HX5W8Xp0IG0AMzuJbaiPC9Ro0V/r9vVmqHIKsKUugLenZy82eRPkixcujqa6P4W2fjKM6Dw608d
2+V5tNpMIggoh5bRdM9Clov3E9dmhOqPsRWWbKvH5w==
=AKJw
-----END PGP SIGNATURE-----

--------------HxXmnoYRQDEK5Lg1aMq0WJvZ--

