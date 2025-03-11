Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5D6A5BC72
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 10:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907572.1314784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trw68-0004IR-9D; Tue, 11 Mar 2025 09:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907572.1314784; Tue, 11 Mar 2025 09:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trw68-0004GY-5l; Tue, 11 Mar 2025 09:40:28 +0000
Received: by outflank-mailman (input) for mailman id 907572;
 Tue, 11 Mar 2025 09:40:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6th=V6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1trw66-0004GS-Ky
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 09:40:26 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daa667a4-fe5c-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 10:40:23 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso1000758f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 02:40:23 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfad7sm17400684f8f.26.2025.03.11.02.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 02:40:22 -0700 (PDT)
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
X-Inumbo-ID: daa667a4-fe5c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741686022; x=1742290822; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g7kFONeDAOf5QrTK2ywrU5LUN0ENYm9IXkbHl/h5CNw=;
        b=BKYMpmtS8oXERi27xiSNfth09iQo06RgPEjfG3dfolsVOtaMP2130jn6d/geQAuytq
         Oxm9WQCb9H+GWGIzaUVx1Uz/Di9MS3HiF52olOioRxfH1gSVmDCxRj9NLKPJ4+oX1txO
         Orq4MmK6YUuO+JmPbpnDRff4OX3KCV+i+v4tz8DcNmRiEKUfjbOQnTJJLOjJI5o7MzmK
         EhpXvxGG5Z2v0S4RXNoiwVIV21aAVut5PljwJXNd8tbltTYN5bIhkuVj1lE1l8zWSQ5I
         Nz0LNfE0cQqOi0YHHsLtg/lii5mZ3pYFTXoY0CsTf3mZo5U15Y2lApFFRSmuo1zmbYMu
         vWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741686022; x=1742290822;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g7kFONeDAOf5QrTK2ywrU5LUN0ENYm9IXkbHl/h5CNw=;
        b=j7JJb826qIqIp7vHApoE9GOrhtmqGm8FnZrVIXQZKCxmZGSjEYBg/e1OlFdHshw7Gw
         E/vSzJAOkwopdS4RfhZH3MurAnDB9PT7GewVbEp2g1Rg1lyWe09PcWK9lKK1o4IN4+lc
         xEwa1Tee5MUNfkQT+gCgfDA3p9dJTB9xH733sZoyaDEQjvg7AuXNlKEr6Wdb9Kj6td22
         a9E7EYYjnvwWrgqPms/R3aWN9cvAA8eORQHkr1SQF+f1yKZ74Vc88OYiLIL1Lw5g7nmU
         LoIFTNuwn8a6RjNvkEZg21Irlxu9yHUy+vM/RPBYL2ZfoJUb8SzP/ap2CzfPraD4AH+G
         YA6g==
X-Forwarded-Encrypted: i=1; AJvYcCVTq8BqZ3ic54LX0FsBw/Lq4MxDo9xOgySMy3070/M+rupXEoKhbI1Xx1Z1bk7gLwKxUTqgEGYO3nk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymGX09i6eLJVExfN7EiZBr/QXyfCb8tAb4mkGqYSXBBXOPIpdM
	uynVx+l7PZ8xdo/XhvVMYEqaG9u5A7XU+57HzK5jrL7e2IFs/z9Fn89ULvSgIIU=
X-Gm-Gg: ASbGncukX3fiU161juNR9m809C9Sfm8/R7IvKovRCnRWeRDTkano1Qd3PmKzEmLKO1s
	bMYNzMVzd0CxIL4UbWSOeIJqwEgiRAUINJpNK6uOxRByr6AvyGgKhExZZq4Wpp5rsHdbKMx2aII
	yE5Oc/CWoBG7Ngn+vOqkqPWxObkhnoPUemCh54DArETO+LtuKb1l8tLTXeHL/pE18HBMbmOxLEN
	AuMTmalblFm653SSuZC58pyctMSZrHr0QWvuLvPpp+g5RuqGPdqTM3EaRfXiHAfjDdmmWtG+RNX
	LTXUfX+KR9eugKyeiKMhkUcJa2K04wlhqwoIcCgjPmxuYETZi7WmmlcYMWCqqvxlJUML5FNHMGg
	WwcDXHn9I+Pcw0QuXiIXJdr6KKpyXULQASL1MOKXa7t+vSPHFTTtHU699dZ63/DkJvkk=
X-Google-Smtp-Source: AGHT+IF4WA1ddgG1ugNhu9mr7Usq+c6felMxP4UZZfbhSec+VLAiGk0eYRoHD1oW6l0w/++yvyp5HA==
X-Received: by 2002:adf:a40c:0:b0:391:ab2:9e76 with SMTP id ffacd0b85a97d-39132d47102mr9901517f8f.30.1741686022468;
        Tue, 11 Mar 2025 02:40:22 -0700 (PDT)
Message-ID: <eb440a72-5016-4eb3-928c-d441268b2189@suse.com>
Date: Tue, 11 Mar 2025 10:40:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: specify numerical values of Xenstore commands
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250311073131.13539-1-jgross@suse.com>
 <ca2e86f3-68f6-4628-af98-c3ad0e82cc0f@xen.org>
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
In-Reply-To: <ca2e86f3-68f6-4628-af98-c3ad0e82cc0f@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------z2RVo8f0sPak026edbHrCRTT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------z2RVo8f0sPak026edbHrCRTT
Content-Type: multipart/mixed; boundary="------------RHrzRMfNpceh9t6wqvAnc0eT";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <eb440a72-5016-4eb3-928c-d441268b2189@suse.com>
Subject: Re: [PATCH v2] docs: specify numerical values of Xenstore commands
References: <20250311073131.13539-1-jgross@suse.com>
 <ca2e86f3-68f6-4628-af98-c3ad0e82cc0f@xen.org>
In-Reply-To: <ca2e86f3-68f6-4628-af98-c3ad0e82cc0f@xen.org>
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

--------------RHrzRMfNpceh9t6wqvAnc0eT
Content-Type: multipart/mixed; boundary="------------XpuCC0cyqbwlNDDePen7xuDc"

--------------XpuCC0cyqbwlNDDePen7xuDc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDMuMjUgMTA6MjEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDExLzAzLzIwMjUgMDc6MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBJ
biBkb2NzL21pc2MveGVuc3RvcmUudHh0IGFsbCBYZW5zdG9yZSBjb21tYW5kcyBhcmUgc3Bl
Y2lmaWVkLCBidXQNCj4+IHRoZSBzcGVjaWZpY2F0aW9ucyBsYWNrIHRoZSBudW1lcmljYWwg
dmFsdWVzIG9mIHRoZSBjb21tYW5kcy4NCj4+DQo+PiBBZGQgYSB0YWJsZSB3aXRoIGFsbCBj
b21tYW5kcywgdGhlaXIgdmFsdWVzLCBhbmQgYSBwb3RlbnRpYWwgcmVtYXJrDQo+PiAoZS5n
LiB3aGV0aGVyIHRoZSBjb21tYW5kIGlzIG9wdGlvbmFsKS4NCj4+DQo+PiBSZXBvcnRlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiBWMjoNCj4+IC0g
cmVwbGFjZSAixZUiIHdpdGggcGxhaW4gInIiIChKYW4gQmV1bGljaCkNCj4+IC0gcmVwbGFj
ZSBoYXJkIHRhYnMgd2l0aCBibGFua3MgKEphbiBCZXVsaWNoKQ0KPj4gLSBhbGxvdyBHRVRf
RkVBVFVSRVMgYW5kIEdFVF9RVU9UQSBzdXBwb3J0IHdpdGhvdXQgU0VUXyogKEphbiBCZXVs
aWNoKQ0KPj4gLS0tDQo+PiDCoCBkb2NzL21pc2MveGVuc3RvcmUudHh0IHwgNTcgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiDCoCAxIGZpbGUgY2hh
bmdlZCwgNTcgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kb2NzL21pc2Mv
eGVuc3RvcmUudHh0IGIvZG9jcy9taXNjL3hlbnN0b3JlLnR4dA0KPj4gaW5kZXggN2UxZjAz
MTUyMC4uOGI0Yjc5MGUxMSAxMDA2NDQNCj4+IC0tLSBhL2RvY3MvbWlzYy94ZW5zdG9yZS50
eHQNCj4+ICsrKyBiL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQNCj4+IEBAIC04Niw2ICs4Niw2
MyBAQCBwYXJ0cyBvZiB4ZW5zdG9yZSBpbmFjY2Vzc2libGUgdG8gc29tZSBjbGllbnRzLsKg
IEluIGFueSANCj4+IGNhc2UgcGFzc2luZw0KPj4gwqAgYnVsayBkYXRhIHRocm91Z2ggeGVu
c3RvcmUgaXMgbm90IHJlY29tbWVuZGVkIGFzIHRoZSBwZXJmb3JtYW5jZQ0KPj4gwqAgcHJv
cGVydGllcyBhcmUgcG9vci4NCj4+ICstLS0tLS0tLS0tIERlZmluZWQgWGVuc3RvcmUgbWVz
c2FnZSB0eXBlcyAtLS0tLS0tLS0tDQo+PiArDQo+PiArQmVsb3cgaXMgYSB0YWJsZSB3aXRo
IGFsbCBkZWZpbmVkIFhlbnN0b3JlIG1lc3NhZ2UgdHlwZXMgKHR5cGUgbmFtZQ0KPj4gK2Fu
ZCBpdHMgYXNzb2NpYXRlZCBudW1lcmljYWwgdmFsdWUpLg0KPj4gKw0KPj4gK1NvbWUgdHlw
ZXMgYXJlIG9wdGlvbmFsIHRvIGJlIHN1cHBvcnRlZCBieSBhIHNwZWNpZmljIFhlbnN0b3Jl
DQo+PiAraW1wbGVtZW50YXRpb24uwqAgSWYgYW4gb3B0aW9uYWwgdHlwZSBpcyBub3Qgc3Vw
cG9ydGVkIGJ5IGEgWGVuc3RvcmUNCj4+ICtpbXBsZW1lbnRhdGlvbiwgWGVuIHRvb2xzIHdp
bGwgY29udGludWUgdG8gd29yaywgbWF5YmUgd2l0aCBzbGlnaHRseQ0KPj4gK3JlZHVjZWQg
ZnVuY3Rpb25hbGl0eS7CoCBBIG1hbmRhdG9yeSB0eXBlIG5vdCBiZWluZyBzdXBwb3J0ZWQg
d2lsbA0KPj4gK3Jlc3VsdCBpbiBzZXZlcmVseSByZWR1Y2VkIGZ1bmN0aW9uYWxpdHksIGxp
a2UgaW5hYmlsaXR5IHRvIGNyZWF0ZQ0KPj4gK2RvbWFpbnMuwqAgSW4gY2FzZSBhIHR5cGUg
aXMgb3B0aW9uYWwsIHRoaXMgaXMgc3RhdGVkIGluIHRoZSB0YWJsZSB3aXRoDQo+PiArdGhl
IGxvc3QgZnVuY3Rpb25hbGl0eSBpbiBjYXNlIFhlbnN0b3JlIGRvZXNuJ3Qgc3VwcG9ydCB0
aGF0IHR5cGUuDQo+PiArDQo+PiArWFNfQ09OVFJPTMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgMMKgwqDCoCBvcHRpb25hbA0KPj4gK8KgwqDCoCBJZiBub3Qgc3VwcG9ydGVkLCB4
ZW5zdG9yZS1jb250cm9sIGNvbW1hbmQgd2lsbCBub3Qgd29yay4NCj4gDQo+IEFyZSB3ZSBk
b2N1bWVudGluZyBhbnl3aGVyZSBob3cgYSB1c2VyIGNvdWxkIGZpZ3VyZSBvdXQgaWYgdGhl
IGNvbW1hbmQgaXMgbm90IA0KPiBzdXBwb3J0ZWQ/IElzIGl0IGEgc3BlY2lmaWMgZXJyb3Ig
Y29kZT8NCg0KSSBjYW4gYWRkIHRoYXQgbm90IHN1cHBvcnRlZCBjb21tYW5kcyB3aWxsIHJl
dHVybiAiRU5PU1lTIiBhcyBhbiBlcnJvcg0KcmVzcG9uc2UuDQoNCj4gDQo+PiArwqDCoMKg
IFhTX0RFQlVHIGlzIGEgZGVwcmVjYXRlZCBhbGlhcyBvZiBYU19DT05UUk9MLg0KPiAgPiAr
WFNfRElSRUNUT1JZwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDE+ICtYU19SRUFEwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyDQo+PiArWFNfR0VUX1BFUk1TwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDMNCj4+ICtYU19XQVRDSMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDQNCj4+ICtYU19VTldBVENIwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA1DQo+PiArWFNfVFJBTlNBQ1RJT05fU1RBUlTCoMKgwqDCoCA2DQo+PiArWFNfVFJB
TlNBQ1RJT05fRU5EwqDCoMKgwqDCoMKgIDcNCj4+ICtYU19JTlRST0RVQ0XCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgOA0KPj4gK1hTX1JFTEVBU0XCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDkNCj4+ICtYU19HRVRfRE9NQUlOX1BBVEjCoMKgwqDCoMKgIDEwDQo+PiArWFNf
V1JJVEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTENCj4+ICtYU19NS0RJUsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxMg0KPj4gK1hTX1JNwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDEzDQo+PiArWFNfU0VUX1BFUk1TwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAxNA0KPj4gK1hTX1dBVENIX0VWRU5UwqDCoMKgwqDCoMKgwqDCoMKg
IDE1DQo+PiArwqDCoMKgIE5vdCB2YWxpZCBpbiBjbGllbnQgc2VudCBtZXNzYWdlcy4NCj4+
ICvCoMKgwqAgT25seSB2YWxpZCBpbiBYZW5zdG9yZSByZXBsaWVzLg0KPj4gK1hTX0VSUk9S
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDE2DQo+PiArwqDCoMKgIE5vdCB2YWxp
ZCBpbiBjbGllbnQgc2VudCBtZXNzYWdlcy4NCj4+ICvCoMKgwqAgT25seSB2YWxpZCBpbiBY
ZW5zdG9yZSByZXBsaWVzLg0KPj4gK1hTX0lTX0RPTUFJTl9JTlRST0RVQ0VEIDE3DQo+PiAr
WFNfUkVTVU1FwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxOA0KPj4gK1hTX1NFVF9U
QVJHRVTCoMKgwqDCoMKgwqDCoMKgwqDCoCAxOQ0KPj4gK1hTX1JFU1RSSUNUwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDIwwqDCoMKgIG5vIGxvbmdlciBzdXBwb3J0ZWQNCj4+ICvCoMKg
wqAgWFNfUkVTVFJJQ1QgaGFzIGJlZW4gcmVtb3ZlZCwgdGhlIHR5cGUgdmFsdWUgMjAgaXMg
aW52YWxpZC4NCj4+ICtYU19SRVNFVF9XQVRDSEVTwqDCoMKgwqDCoMKgwqAgMjENCj4+ICtY
U19ESVJFQ1RPUllfUEFSVMKgwqDCoMKgwqDCoCAyMsKgwqDCoCBvcHRpb25hbA0KPj4gK8Kg
wqDCoCBJZiBub3Qgc3VwcG9ydGVkLCB0aGUgb3V0cHV0IG9mIHhlbnN0b3JlLWxzIG1pZ2h0
IGJlIGluY29tcGxldGUNCj4+ICvCoMKgwqAgd2l0aCBtb3JlIHRoYW4gY2EuIDEwMDAgZG9t
YWlucyBhY3RpdmUuDQo+IA0KPiBXaHkgYXJlIHdlIG1ha2luZyB0aGlzIHNwZWNpZmljIHRv
IG51bWJlciBvZiBkb21haW5zPyBXb3VsZG4ndCB0aGUgcHJvYmxlbSBiZSANCj4gdGhlIHNh
bWUgaWYgeW91IGhhdmUgMTAwMCBub2RlIHdpdGhpbiBhIHBhcmVudCBub2RlPw0KDQpMZXQg
bWUgcmVpdGVyYXRlIHRoZSBhbnN3ZXIgSSBnYXZlIHRvIEphbiB3aGVuIGhlIGFza2VkOg0K
DQogICBBbmQgZWxzZXdoZXJlIHRoZXJlIGNhbid0IGJlIHZlcnkgbWFueSBub2RlcyByZXN1
bHRpbmcgaW4gYSBzaW1pbGFyDQogICBzaXR1YXRpb24/DQoNCk5vdCB3aXRob3V0IHNvbWVv
bmUgdHJ5aW5nIHRvIGZvcmNlIHRoaXMgYnkgd2lsbCAob25seSBwb3NzaWJsZSBieSBhDQpy
b290IHVzZXIgb2YgZG9tMCwgZS5nLiB2aWEgY3JlYXRpbmcgbG90cyBvZiBub2RlcyBpbiB0
aGUgc2FtZSBkaXJlY3RvcnkNCnZpYSAieGVuc3RvcmUtd3JpdGUiKS4NCg0KSGF2aW5nIGxv
dHMgb2YgZG9tYWlucyBpcyBhbiAiZWFzeSIgd2F5IHRvIGNyZWF0ZSB0aGlzIHNjZW5hcmlv
IHZpYQ0KcGVyZmVjdGx5IHZhbGlkIGFuZCBzZW5zaWJsZSBvcGVyYXRpb25zLg0KDQoNCkkg
Y2FuIHJlcGhyYXNlIHRoZSByZW1hcmsgbGlrZSB0aGlzOg0KDQogICAgIElmIG5vdCBzdXBw
b3J0ZWQsIHRoZSBvdXRwdXQgb2YgeGVuc3RvcmUtbHMgbWlnaHQgYmUgaW5jb21wbGV0ZQ0K
ICAgICB3aXRoIGEgbm9kZSdzIHN1Yi1ub2RlIGxpc3QgZXhjZWVkaW5nIHRoZSBtYXhpbXVt
IHBheWxvYWQgc2l6ZQ0KICAgICAoZS5nLiB0aGUgIi9sb2NhbC9kb21haW4iIG5vZGUgd2l0
aCBtb3JlIHRoYW4gY2EuIDEwMDAgZG9tYWlucw0KICAgICBhY3RpdmUpLg0KDQoNCkp1ZXJn
ZW4NCg==
--------------XpuCC0cyqbwlNDDePen7xuDc
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

--------------XpuCC0cyqbwlNDDePen7xuDc--

--------------RHrzRMfNpceh9t6wqvAnc0eT--

--------------z2RVo8f0sPak026edbHrCRTT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfQBQUFAwAAAAAACgkQsN6d1ii/Ey+m
cQf/eXQm6NMuvPSsHrN5KVcMYCgwT7j3gZhi1HAUBYozR3Jb2mb0hL9tp6oWRBggLlmr4YDsOWaz
eHrTzFEAodD8/l/JIqzrYK9rNojZs5/5Tm9CYmaR3/ZEo11Tsye/fdiNjpaRv69s3jbm+YNpDTtu
lzwJH37m+cSb6ctLJQklnlfXlkpo28mpKRAeW+P5Ckj4pXs1VnqOe3sekAstzvNb72/jEZA8La+h
6loFcDnTVB67JvBqJntfgng5Edes0qjggbehk+VmUUbRcWa8kzco1bh35E4I4draqkOP8WOhFX3f
Zo/S3IcLwzyuykNgj8pffVAYcWT1NZ76TDnWjPYRVQ==
=8eje
-----END PGP SIGNATURE-----

--------------z2RVo8f0sPak026edbHrCRTT--

