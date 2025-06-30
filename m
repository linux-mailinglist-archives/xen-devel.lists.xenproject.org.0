Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB66AED821
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 11:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028967.1402691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWARc-0005m7-4F; Mon, 30 Jun 2025 09:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028967.1402691; Mon, 30 Jun 2025 09:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWARc-0005kG-09; Mon, 30 Jun 2025 09:04:56 +0000
Received: by outflank-mailman (input) for mailman id 1028967;
 Mon, 30 Jun 2025 09:04:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N53E=ZN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWARa-0005k4-7b
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 09:04:54 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 484f465e-5591-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 11:04:52 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-453749af004so21800275e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 02:04:52 -0700 (PDT)
Received: from ?IPV6:2003:e5:8746:1a00:ff67:e633:2aa8:93ba?
 (p200300e587461a00ff67e6332aa893ba.dip0.t-ipconnect.de.
 [2003:e5:8746:1a00:ff67:e633:2aa8:93ba])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e7098sm9659818f8f.4.2025.06.30.02.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 02:04:51 -0700 (PDT)
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
X-Inumbo-ID: 484f465e-5591-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751274291; x=1751879091; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YOzSyyJTbgmm5P7nXA1THL4s98W7foiluU3LTeCzaSs=;
        b=UfjJW0GgDO+AeJcIoCo271ZBKD1M6jtTBI6Lxbrio1hKm+m+qhGww+tUHaWAedy2c6
         3+Ge/lLmlYUgLJJ6iCDN0C0338BLW59sGHtY7EXSG4JzT3d0CY+BaSkGLGIo+W/ppOnp
         ErNxa9RE4hn5WGgg91yaTLcbMtnRRZ/C/BdTda7N7Momf9YLcuvZ4mf977/l0Ebjt8K7
         Ihg9J3vmNgew3QXNMbPG3o/n99DxX9ZGGJfLGq/qhHzpF9ejfRP72i6VqAath3HE8Yl2
         jAvbvVNBQ9782/USBTz+attdw/BWWvXB8q8AmsHJBuDC9er94ZHbu+T7sXno4yhN17rR
         efPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751274291; x=1751879091;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YOzSyyJTbgmm5P7nXA1THL4s98W7foiluU3LTeCzaSs=;
        b=fxMGtI20pmqBb2VnooR0an1XG25CgmrJhdUC6RmHfdG6D6Y2J+tq8/TB9fVlkzE/65
         gjuy6U26xO/zQbhzTJppVGDpbSzio4X6ihzvS5Tx+ETNEQgtypoLKdpMgFB623h/mdLG
         +grf8xEXe+yLIdUoLx9oDSMLZgo77Nzcw7ATpKo2k/CnDjYZQek5hXWsoLc9y0kw+dgL
         yTwrtWj3DWN7txTD5fvZkCABij1GpJdAfjYfwGgW+5dPOMR1DZCjQO1O0z/VnVl0sJiz
         dK60zZF1pfgTc3/Uh6SPWCQdoanxHlVMDQPNL5IRf3jhVlu4OZSktS7i6PzuJA1o/aei
         txAg==
X-Forwarded-Encrypted: i=1; AJvYcCU1PfPqQzyBUwNOqNuJDQimiHMLZAhQyuUFMYz/D6t0ipADxFFd5/1iGpcpCV/WuvnO04YgM0x3e5E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4G0Q2sQxGWmebErTQIk1Jk6FiadmDJXLfIOmr4u9t6L7R697m
	RsMuSAUn74m08KSjOa83gMmOhTR8+oOAkmexEniinh8tpXG9QKH0lmf2cwCyNcOFdNQ=
X-Gm-Gg: ASbGncvxHV+ZaqjM6BdC4EXWHbeWospR9IOEnuCsjPee8y4EhaLYySaSO0kfdhZcbVO
	KCNtj5Y4BQeEPs4znxuEZgoJ5q9mRJrx8mfpG69fuU5TVRLGHjnBbkEiSGrjRiQE0AtotfDYf/O
	DKwB2NYDZhtu0dkwNLXKocTxIL7C9wmFfdn8GctG+HH5iAL2/7+iXvPmPBMnRcoLqt+QqPRnZ+k
	yAkqQjl9TwnhoMgZU/MFCkgGpW2JOIxJr/KJz9RGA8gf+h2AImRKjIBlUoKm2flIeSBzHl3J6UM
	l1vd5BuA9oF/1tMJJBJIpgnHU4o6tABeRY1d+6/UhjbxzjA2LWMR3B0CatHfDS+1x86rrzSsuJ5
	Z27addhSoRzEOwa5JUSyC/Spzs09LX/VV4lOmr3uo/AJN+MSqIYaUQ2/CdZMeo4uw3Lnoheq6ra
	DgS05j0o8RyLI=
X-Google-Smtp-Source: AGHT+IGCgAInLjL0CmkbDDrN6TkLYI6/KZFnHjmOdpAVPuLAlepbFzUcSq3kcxZkFi5r9ta15KB3RQ==
X-Received: by 2002:a5d:620d:0:b0:3a5:2ef8:34f9 with SMTP id ffacd0b85a97d-3a917603b17mr8190934f8f.27.1751274291416;
        Mon, 30 Jun 2025 02:04:51 -0700 (PDT)
Message-ID: <5165bb0e-db0a-4b03-acf9-9c6a65705370@suse.com>
Date: Mon, 30 Jun 2025 11:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] stubdom/grub: avoid relying on start_info
 definition
To: Jan Beulich <jbeulich@suse.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250626151344.6971-1-jgross@suse.com>
 <5a423869-d67f-4a98-9fa4-e854bc84e2c7@suse.com>
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
In-Reply-To: <5a423869-d67f-4a98-9fa4-e854bc84e2c7@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TaagjCxVx8nzO01vKGtaJs08"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TaagjCxVx8nzO01vKGtaJs08
Content-Type: multipart/mixed; boundary="------------IhqAUGGIltfvh48ZzGg09aAM";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <5165bb0e-db0a-4b03-acf9-9c6a65705370@suse.com>
Subject: Re: [PATCH v2 0/3] stubdom/grub: avoid relying on start_info
 definition
References: <20250626151344.6971-1-jgross@suse.com>
 <5a423869-d67f-4a98-9fa4-e854bc84e2c7@suse.com>
In-Reply-To: <5a423869-d67f-4a98-9fa4-e854bc84e2c7@suse.com>
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

--------------IhqAUGGIltfvh48ZzGg09aAM
Content-Type: multipart/mixed; boundary="------------I5dJ0An5Y7gmYbX006uoVDlb"

--------------I5dJ0An5Y7gmYbX006uoVDlb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDYuMjUgMDk6NTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNi4wNi4yMDI1
IDE3OjEzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gV2l0aCB0aGUgcmVsYXRlZCBjaGFu
Z2UgaGF2aW5nIGJlZW4gYWRkZWQgdG8gTWluaS1PUywgdGhlIHNpbmdsZSBWMQ0KPj4gcGF0
Y2ggY2FuIG5vdyBiZSBleHBhbmRlZCB0byBhIDMgcGF0Y2ggc2VyaWVzLCBlc3BlY2lhbGx5
IG1lYW50IHRvDQo+PiB1bnRhbmdsZSB0aGUgY2xvc2UgZGVwZW5kZW5jaWVzIGJldHdlZW4g
Z3J1Yi1wdiBhbmQgTWluaS1PUyBpbnRlcm5hbHMuDQo+Pg0KPj4gQ2hhbmdlcyBpbiBWMjoN
Cj4+IC0gYWRkIGNvbW1lbnQgdG8gcGF0Y2ggMQ0KPj4gLSBhZGRlZCBwYXRjaGVzIDIrMw0K
Pj4NCj4+IEp1ZXJnZW4gR3Jvc3MgKDMpOg0KPj4gICAgc3R1YmRvbS9ncnViOiBhdm9pZCBy
ZWx5aW5nIG9uIHN0YXJ0X2luZm8gZGVmaW5pdGlvbg0KPj4gICAgQ29uZmlnOiB1cGRhdGUg
TWluaS1PUyBjb21taXQgaWQNCj4+ICAgIHN0dWJkb20vZ3J1Yjogc3dhcCBzdGFydF9pbmZv
IHVzYWdlIHdpdGggc3RhcnRfaW5mb19wdHINCj4gDQo+IEFzIHBhdGNoZXMgMSBhbmQgMyBh
cmUgc3RpbGwgd2FpdGluZyBmb3IgYSBtYWludGFpbmVyIGFjaywgaXMgcGF0Y2ggMiBva2F5
DQo+IHRvIHB1dCBpbiBhaGVhZCBvZiBwYXRjaCAxPw0KDQpUaGF0IHdvdWxkIGJyZWFrIHRo
ZSBncnViLXB2IGJ1aWxkIGFnYWluLg0KDQoNCkp1ZXJnZW4NCg==
--------------I5dJ0An5Y7gmYbX006uoVDlb
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------I5dJ0An5Y7gmYbX006uoVDlb--

--------------IhqAUGGIltfvh48ZzGg09aAM--

--------------TaagjCxVx8nzO01vKGtaJs08
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhiUzIFAwAAAAAACgkQsN6d1ii/Ey/7
oAf+NizqrvUUqIXLMIX2SuhjzADZ2FG8EMD9xMix4N2r6b2OVbdFtZs/OmPzBE7rDTPWYTAbE8s8
I1w8mXJTDT+AQJ8hUlnaEGfoOt2/bwLsL+hAbuXuHaIy/llGna54THE/T7oEJVckgYgbwYi5FT+G
oOGwbLpYqkHbuiJGgLt3Oy22DH0UItX35VI9AJ7In/WMupvoxcpGVnPDIECdQpmcBxLK+3UtppU8
Hwao2fsmJD0YobJAjrKs8f9xq1lglOU6hpzNbLC3MTIYGJTYiLoJDL90aVxIXog1PETYwWGrp5nU
QTIkP1AnZkT0QyY2QQFMuM3OQl5LVkcAZuQxBO/Jng==
=ngHH
-----END PGP SIGNATURE-----

--------------TaagjCxVx8nzO01vKGtaJs08--

