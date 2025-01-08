Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155E5A0560D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 10:02:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866993.1278397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVRx7-0006q8-2f; Wed, 08 Jan 2025 09:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866993.1278397; Wed, 08 Jan 2025 09:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVRx6-0006mk-VI; Wed, 08 Jan 2025 09:02:12 +0000
Received: by outflank-mailman (input) for mailman id 866993;
 Wed, 08 Jan 2025 09:02:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hCO=UA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tVRx5-0006TF-DL
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 09:02:11 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e9c6651-cd9f-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 10:02:10 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361f796586so168861015e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 01:02:10 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e03210sm13600295e9.34.2025.01.08.01.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 01:02:09 -0800 (PST)
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
X-Inumbo-ID: 3e9c6651-cd9f-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736326930; x=1736931730; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fkc7Z7yxTC1YVlAybo84K7ThQmlUUT58sCI4GDVzsHc=;
        b=OwSSSc7CbcoXCsg4EA5/0ccgOEscA4is33gMu64v0ytiD5++hpaSflCkdEH081GwPt
         Gyc2+lE1zzibjx6TBOhRGT5oiBW+YpfvV1JFb0ds9gBPCRzbFdi6ueOcPDp1URz8ari1
         lnx8qi0cZwkTK+4xgcCjeu6DLo8pTMHjup0QZCOeaTgmR2SmU5/cN7Gw0E150iDFZion
         jVIGyEFC+YjvkhitkGzSVTiPc3gBtAX0VDvLIdfFM8SviGFkTGmoXXDqJiwJGU+6r0NT
         WiPE/LwP1ZIwf0AmzDnq8eTRm+n7g1U525bfffJGVyowV2yY3E7Ax00h9zwv9S7aLHk1
         0vBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736326930; x=1736931730;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fkc7Z7yxTC1YVlAybo84K7ThQmlUUT58sCI4GDVzsHc=;
        b=j6ctp9KOdbWQznE5s+dtRBt/Vw/OQAJWMxYjzI2Jj+Jn87Gaq2mVLnWmRVUcbNFU+m
         8OLXfxVvCI5h0TrP0cCZKPs0Ow5HLIcePibKN1g1J7FXuM9DG5XSL+88EdzMJV+aEgLS
         q8xuIv1Lzddqg5US0oKdirkCVE/eLUmXPuWYYVvcFNMxdiUStU9xprpJNOtwX8989cU5
         KmVQtBef3TAsAL6RupULZoN7wtOBcvziFllRDCK5zRqDBEvGy/J3F1XWDViXAaLtdNks
         kSTBiqhjs3sdzWzvKe7XNoMFH7U4XbXcq1Au4Y2dxGtV27qzmFH6HWquYydDwPVt487c
         BNyw==
X-Forwarded-Encrypted: i=1; AJvYcCVVYmhe/MkghI+co4rqCDJqTUIIYqsZQ1CoCxdJH3jTE2tEe6n8YP6z0+a1SjbjYIBdDvqDOsu0HcY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDV1J7oMjCuquRck4CsaBm+rnoME/bXYQq5lkWYDiIRlisMAOn
	6unBGDuQWMli14/22XgOtVSBPvuFEa1NbyjPhC38r6YM/HQMHAcR1CRhCBJS0uw=
X-Gm-Gg: ASbGnctV2VRfxsCPhBSemjGYP1H/iGAdriQWKfkCRUZyyOyfK6SPCDwvw2mR0lQ3olW
	T4i+1aEAhCGHWJ8gW6TcnPXhMo6h8/WuqWI81K5G+03y4eo0EIOlbS2BpFJn40UppwXM+X1n5Rp
	cOBe5UNZZxApboG+u9kQiaLVYb6os7RCGoowr8/UYuaXspoCj7qyXrNnkblZwUqaijcv65hnsWk
	JME2pFtfBVOpiTthoY8Yq8krif5lFfpf2jAc6srqaX0mKubVmV4POjgVnZ//rF95uDTMyZPiOAb
	S1eQmVwmYkUTBNwcEE3D1skek/6SX70yQ2HMk6UPBKuATnYsubKzEs8L6We7B/TueIXeFt/4RB3
	cLxpN6A==
X-Google-Smtp-Source: AGHT+IF/BxTtuq51CuoLKuqp0xk1XjUbGck9Et0TE+IIhEFUpwQCvUYFobdzZgEK3aC+DDzFkgE3yA==
X-Received: by 2002:a05:600c:46c3:b0:434:fbe2:4f with SMTP id 5b1f17b1804b1-436e26e1d20mr11416145e9.23.1736326929951;
        Wed, 08 Jan 2025 01:02:09 -0800 (PST)
Message-ID: <f0cb4d80-5d26-437e-b6ee-a45f0157fc19@suse.com>
Date: Wed, 8 Jan 2025 10:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] xen/events: don't allow binding a global virq from
 any domain
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-3-jgross@suse.com>
 <577427ff-61e2-4fc9-8853-a7eec3f69bb6@suse.com>
 <5261716e-a2f4-4423-bb8d-17e36bf34538@suse.com>
 <511c3207-20b8-4110-a5ef-55f8b428074d@suse.com>
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
In-Reply-To: <511c3207-20b8-4110-a5ef-55f8b428074d@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7rrkwPcDk8GosLD5EOo4zIi0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7rrkwPcDk8GosLD5EOo4zIi0
Content-Type: multipart/mixed; boundary="------------TI3jFKzOntJRu0D87zTa0ZnD";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <f0cb4d80-5d26-437e-b6ee-a45f0157fc19@suse.com>
Subject: Re: [PATCH v6 2/7] xen/events: don't allow binding a global virq from
 any domain
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-3-jgross@suse.com>
 <577427ff-61e2-4fc9-8853-a7eec3f69bb6@suse.com>
 <5261716e-a2f4-4423-bb8d-17e36bf34538@suse.com>
 <511c3207-20b8-4110-a5ef-55f8b428074d@suse.com>
In-Reply-To: <511c3207-20b8-4110-a5ef-55f8b428074d@suse.com>
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

--------------TI3jFKzOntJRu0D87zTa0ZnD
Content-Type: multipart/mixed; boundary="------------4enMWu4ocrhIekdxeZEandwm"

--------------4enMWu4ocrhIekdxeZEandwm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDEuMjUgMTc6MzgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMS4yMDI1
IDE3OjA3LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMDcuMDEuMjUgMTY6MzQsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjAxLjIwMjUgMTE6MTcsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IEBAIC00NzksOCArNDg2LDEzIEBAIGludCBldnRjaG5fYmluZF92
aXJxKGV2dGNobl9iaW5kX3ZpcnFfdCAqYmluZCwgZXZ0Y2huX3BvcnRfdCBwb3J0KQ0KPj4+
PiAgICAgICAgKi8NCj4+Pj4gICAgICAgIHZpcnEgPSBhcnJheV9pbmRleF9ub3NwZWModmly
cSwgQVJSQVlfU0laRSh2LT52aXJxX3RvX2V2dGNobikpOw0KPj4+PiAgICANCj4+Pj4gLSAg
ICBpZiAoIHZpcnFfaXNfZ2xvYmFsKHZpcnEpICYmICh2Y3B1ICE9IDApICkNCj4+Pj4gLSAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4+ICsgICAgaWYgKCB2aXJxX2lzX2dsb2JhbCh2
aXJxKSApDQo+Pj4+ICsgICAgew0KPj4+PiArICAgICAgICBpZiAoIGdldF9nbG9iYWxfdmly
cV9oYW5kbGVyKHZpcnEpICE9IGQgKQ0KPj4+PiArICAgICAgICAgICAgcmV0dXJuIC1FQlVT
WTsNCj4+Pg0KPj4+IEhtbS4gV2hpbGUgdGhpcyBlbGltaW5hdGVzIHRoZSBwcm9ibGVtIGZv
ciB0aGUgY29tbW9uLCByYWNlIGZyZWUgY2FzZSwNCj4+PiB0aGUgaGFuZGxlciBjaGFuZ2lu
ZyByaWdodCBhZnRlciB0aGUgY2hlY2sgd291bGQgc3RpbGwgbWVhbiB0aGUgYmluZA0KPj4+
IHdvdWxkIHN1Y2NlZWQuDQo+Pg0KPj4gQXJlIHlvdSBmaW5lIHdpdGggbWUgYWRkaW5nIGEg
cGFyYWdyYXBoIHRvIHRoZSBjb21taXQgbWVzc2FnZSBzYXlpbmcNCj4+IHRoYXQgYSBmdXR1
cmUgcGF0Y2ggd2lsbCBoYW5kbGUgdGhpcyBjYXNlPw0KPj4NCj4+IFRoaXMgZnV0dXJlIHBh
dGNoIGlzIHBhdGNoIDQgb2YgdGhlIHNlcmllcywgd2hpY2ggd2lsbCBuZWVkIHRvIGJlDQo+
PiBtb2RpZmllZCB0byBjaGVjayB0aGUgaGFuZGxpbmcgZG9tYWluIGluc2lkZSB0aGUgZXZl
bnRfbG9jay4NCj4gDQo+IEkgdGhpbmsgdGhpcyB3b3VsZCBiZSBva2F5LCBzbyBsb25nIGFz
IHBhdGNoZXMgMi4uLjQgYXJlIHRoZW4gYWxzbyBhbGwNCj4gY29tbWl0dGVkIHRvZ2V0aGVy
Lg0KPiANCj4+PiBQbHVzIHRoaXMgd2F5IHlvdSdyZSBicmVha2luZyBhIGNhc2UgdGhhdCBh
ZmFpY3QgaGFzIGJlZW4gd29ya2luZyBzbw0KPj4+IGZhcjogVGhlIGJpbmQgaGFwcGVuaW5n
IGJlZm9yZSB0aGUgc2V0dGluZyBvZiB0aGUgaGFuZGxlci4gV2l0aCBhIGxvdA0KPj4+IG9m
IHVucmVsYXRlZCBpZi1zIGFuZCB3aGVuLXMgdGhpcyBjb3VsZCBlLmcuIGJlIG9mIGludGVy
ZXN0IHdoZW4NCj4+PiBjb25zaWRlcmluZyBhIHJlLXN0YXJ0YWJsZSBYZW5zdG9yZSBkb21h
aW4uIFRoZSBvbmUgdG8gdGFrZSBvdmVyIGNvdWxkDQo+Pj4gc3RhcnQgZmlyc3QsIG9idGFp
biBzdGF0ZSBmcm9tIHRoZSBvcmlnaW5hbCBvbmUgd2hpbGUgdGhhdCdzIHN0aWxsDQo+Pj4g
YWN0aXZlLCBhbmQgYmUgbm9taW5hdGVkIHRoZSBoYW5kbGVyIG9mIHRoZSBnbG9iYWwgdklS
USBvbmx5IGluIHRoZQ0KPj4+IGxhc3QgbW9tZW50Lg0KPj4NCj4+IFRoaXMgaXMgYSByYWN5
IHNpdHVhdGlvbiwgdG9vLiBJZiB0aGUgb2xkIGRvbWFpbiByZWNlaXZlcyB0aGUgdmlycSBh
ZnRlcg0KPj4gc2VuZGluZyB0aGUgc3RhdGUsIHRoaXMgd291bGQgbmVlZCB0byBiZSBoYW5k
bGVkIGJ5IHRyYW5zZmVycmluZyB0aGUgdmlycQ0KPj4gaW5mb3JtYXRpb24gdG8gdGhlIG5l
dyBkb21haW4sIHdoaWNoIGNhbiByZXN1bHQgaW4gYSBuZXZlciBlbmRpbmcgc3RvcnkuDQo+
Pg0KPj4gVGhpcyBpcyB0aGUgcmVhc29uIHdoeSB0aGUgZG9tYWluIHN0YXRlIGJpdG1hcCBp
cyByZXNldCB0byBjb250YWluIGFsbA0KPj4gZXhpc3RpbmcgZG9tYWlucyB0byBiZSBmbGFn
Z2VkIGFzICJjaGFuZ2VkIiwgYXMgb3RoZXJ3aXNlIGEgY2hhbmdlIG1pZ2h0DQo+PiBnZXQg
bG9zdC4NCj4+DQo+PiBJJ2QgcmF0aGVyIGJlIGFibGUgdG8gaGFuZGxlIHRvZGF5J3MgdXNl
IGNhc2VzIGluIGEgc2FuZSB3YXkgdGhhbiB0byB0cnkNCj4+IGhhbmRsaW5nIGFueSB3ZWly
ZCBmdXR1cmUgdXNlIGNhc2VzIHdoaWNoIHdlIGRvbid0IGtub3cgeWV0Lg0KPj4NCj4+IEkg
dGhpbmsgdG9kYXkncyBiZWhhdmlvciBpcyBtb3JlIG9yIGxlc3MgaW5zYW5lIGFuZCB0aGUg
bmV3IGJlaGF2aW9yIGlzDQo+PiBtdWNoIGVhc2llciB0byB1bmRlcnN0YW5kIGFuZCBtb3Jl
IGludHVpdGl2ZS4NCj4gDQo+IEhtbSwgSSdkIGxpa2UgdG8gbGVhdmUgdGhpcyB0aGVuIGZv
ciBpbnB1dCBieSBvdGhlciBtYWludGFpbmVycy4NCg0KSnVzdCBvbmUgYWRkaXRpb25hbCBy
ZW1hcmsgdG8geW91ciByZS1zdGFydGFibGUgeGVuc3RvcmUgZG9tYWluIHNjZW5hcmlvDQph
Ym92ZToNCg0KSXQgd291bGRuJ3QgYmUgcG9zc2libGUgdG9kYXkgdG8gZG8gdGhlIHNhbWUg
d2l0aCBhIHhlbnN0b3JlIGRhZW1vbiBpbg0KZS5nLiBkb20wLCBhcyBiaW5kaW5nIHRoZSB2
aXJxIGFub3RoZXIgdGltZSBmcm9tIHdpdGhpbiB0aGUgc2FtZSBkb21haW4NCndvdWxkIGJl
IHJlamVjdGVkIGJ5IHRoZSBoeXBlcnZpc29yLiBJbiB0aGUgeGVuc3RvcmUgZG9tYWluIGNh
c2UgeW91J2QNCmVpdGhlciBuZWVkIHRoZSBvbGQgZG9tYWluIHRvIGFzayBkb20wIHRvIGNo
YW5nZSB0aGUgaGFuZGxlciAoc28gbXVjaA0KYWJvdXQgbGVzcyBjb21tdW5pY2F0aW9uIG5l
ZWRlZCksIG9yIHlvdSdkIG5lZWQgdG8gZ2l2ZSB0aGUgeGVuc3RvcmUgZG9tYWluDQp0aGUg
cmlnaHQgdG8gZG8gdGhlIGhhbmRsZXIgY2hhbmdlIGl0c2VsZiwgcmVxdWlyaW5nIHRvIHVz
ZSBmbGFzayBvciB0bw0KbW9kaWZ5IHRoZSBkdW1teSBYU00gcmlnaHRzIG9mIHRoZSB4ZW5z
dG9yZSBkb21haW4uDQoNCg0KSnVlcmdlbg0K
--------------4enMWu4ocrhIekdxeZEandwm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------4enMWu4ocrhIekdxeZEandwm--

--------------TI3jFKzOntJRu0D87zTa0ZnD--

--------------7rrkwPcDk8GosLD5EOo4zIi0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmd+PxAFAwAAAAAACgkQsN6d1ii/Ey+X
Jgf+PijFCxZRHQ1j3PVTawxNLv2FoVSLdj3fyu6NCF5sgQI63FOs1j/jAgyqc7W1Zla+dcLR6M0L
4RzBNTA3+xRhVfPT5FA7HDhpcHu6zCbsU8mXgQdkZpKePYKCyCJyLL7UQ+I4+vCdrX0L08OioAuG
U7jMjEqxI0fQfLPeIL72R7Uvuz1pLcSgvItjarhLVpTMx62com1J1rULMQvbKwZLph/LNduZOpT7
wjjtKKqAafudwYKTVi8Pk2iXHNq0+Atl/fU62vRlf8UYCqGRnmZLOzTK+snkT6b//8GtJ7N6sYuB
dYkGvn0vdhpSBDKfJuot3Sk4oUaeBU5CvDzu4zAcrQ==
=kuOH
-----END PGP SIGNATURE-----

--------------7rrkwPcDk8GosLD5EOo4zIi0--

