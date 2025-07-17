Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD60B08535
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046196.1416458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIL9-0008Pf-6F; Thu, 17 Jul 2025 06:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046196.1416458; Thu, 17 Jul 2025 06:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIL9-0008OD-2c; Thu, 17 Jul 2025 06:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1046196;
 Thu, 17 Jul 2025 06:43:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XrhN=Z6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ucIL7-0008O7-TJ
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:43:34 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a982463-62d9-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 08:43:31 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ae9c2754a00so106939066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 23:43:31 -0700 (PDT)
Received: from ?IPV6:2003:e5:8709:f00:6357:915b:11f9:6d20?
 (p200300e587090f006357915b11f96d20.dip0.t-ipconnect.de.
 [2003:e5:8709:f00:6357:915b:11f9:6d20])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e8294042sm1308431966b.119.2025.07.16.23.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 23:43:30 -0700 (PDT)
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
X-Inumbo-ID: 5a982463-62d9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752734611; x=1753339411; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qOpjVdP31MZ1zCD29g5R5JhQ9g4co9TNOO8bvFbu8lk=;
        b=HEEvPTbS19g4PmElVGOdKDkLuw8Xk9p0e9Hg7xbSwc/HPLR1bMyPs2JG4m+Bvr/6Kf
         vZNpVsrNhMajIiH1gYx/N949+6fFomA1syHpzbZq8JyLnmzTvN2QqYSPHM/DfPXdl//t
         HK/e0/br8Fwb4+DkKo2yxEVquqxqZP0Yp3WCdDKTgj4DEPuRWssRGCgh1tuQp/VAgsPd
         Rz+0crwNXNM2gUyY4Se2C7vjXyBswI4nHucDNyKMMn+ArfZRYtlkKmu/4Cu3s6RJDOi3
         jNFMiTXkMMaCQ9I1iXTsFBydHyfNaZ7bBG/CxKwFwE1B1Qm8PNwWU2fQgPfiHNkmkjSu
         6GYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752734611; x=1753339411;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qOpjVdP31MZ1zCD29g5R5JhQ9g4co9TNOO8bvFbu8lk=;
        b=FC4iGBW94ayIYZB/AZOxWOv9iDXHoKkqvbLhQ3fMKvyKRhmavV+5sTjMA4UnagE10h
         nChaJxloKuOy9KUml6BZT6waZv7bT7ur1LFwmsVhMJTPYC0pj64n8E7DflZXbUqCDxek
         iKAU3JE8Li5/l/0KgbfoTIlwSzOMWQmv+GI7mFuqtgf9xDtlXKjWYY/dsGEMJ8fDxBDA
         QTOyWtXvucuw6XRNxlYnDlDO45s84mlpT/7+pjyW4RL+npvquocB1EOSMs2kcv2ot166
         x/HX3NYLpoSZNrk7RKDC4bgF+GelACb17Z9/+j2ls2XhTkGUHh7+fxwcR96YeeytqETq
         W/aA==
X-Forwarded-Encrypted: i=1; AJvYcCXlJHQdqQkQpsSRJcdvq7hNEsKsw+BYUx7rt/2bgzo9chSdaJenO2DEHrRoffC+SJF2Ibz9bu1muU4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzDjyx90jC9q0k7oO1BsaImh0HOqlBQm5PChddgpbaNYPZbm4g
	aFPDlzGNt/d6o+zRSyL9zRvok+GgXKYZ1Ec55ltLJm2FomkTDgwz8erwmAhnH1p31sI=
X-Gm-Gg: ASbGncsnax2eBIsOSgXXBGoFw+NNuaTpnKE9HI7MvKSoUcRMit0uDLGRL9xCf1oX5st
	qJKuxvVMRisYuYcFKo0w/ZZbbMF0xOT/NlRUH/eZ+F0Y7e/RlM2fS0YcEtJZy70D6WpgmhVuxIN
	dG+LkHThiFCbOojQ0KsU9U9KpPpVoqO12xL03pnJ+eS4tdrySDKpLwIlMivawImcwXDbGk+9AMU
	1IrbcmiEeXW7Qo+iZoxTvArIhP6Q/1MlRi/iRKdMjAi5hPosB+jF3p9h4JbCbMl7PeRPcmRGL4X
	IhkZTqQFCgiQuDP7n4DT4oPk++bozfPbXImyjksDEsXxEcqigxWUeRKibloTf9sztI/F8ZW9l8A
	kmXpgPbRtILuAyE9+NvgiO/t1gx96+EYMSwNxPUCuml8VUgPgEsIl3KyUHU9976Vm+8GOr3vvlp
	ZBDvT7jPz+nCDiscqupLc7OsjamBnJtHiBRt6XrwmJMEpxkgUG5pNk6Z4=
X-Google-Smtp-Source: AGHT+IEBFFI+eruH1xqk29nUx05QKqFIArEV6cR0ciZfGdw+DpUhIMBUvbTAEpep4i6pIop6iQVFIA==
X-Received: by 2002:a17:906:6b1a:b0:ae0:da2d:1a53 with SMTP id a640c23a62f3a-aec4fc40f7cmr124096466b.42.1752734611220;
        Wed, 16 Jul 2025 23:43:31 -0700 (PDT)
Message-ID: <a84facc6-ea1e-4418-9c4e-e223b3ae204b@suse.com>
Date: Thu, 17 Jul 2025 08:43:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/17] xen/dom0less: store xenstore event channel in
 page
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-10-jason.andryuk@amd.com>
 <eca10872-aafe-4990-a86a-1582e87a6af2@suse.com>
 <b408a253-d483-4a72-9691-b7ef724eaab6@suse.com>
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
In-Reply-To: <b408a253-d483-4a72-9691-b7ef724eaab6@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0w3jD03GQ6HS5Z0uQNxpdWc9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0w3jD03GQ6HS5Z0uQNxpdWc9
Content-Type: multipart/mixed; boundary="------------JTKZgG9LKzcWovfYienXQ0cS";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
 xen-devel@lists.xenproject.org
Message-ID: <a84facc6-ea1e-4418-9c4e-e223b3ae204b@suse.com>
Subject: Re: [PATCH v2 09/17] xen/dom0less: store xenstore event channel in
 page
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-10-jason.andryuk@amd.com>
 <eca10872-aafe-4990-a86a-1582e87a6af2@suse.com>
 <b408a253-d483-4a72-9691-b7ef724eaab6@suse.com>
In-Reply-To: <b408a253-d483-4a72-9691-b7ef724eaab6@suse.com>
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

--------------JTKZgG9LKzcWovfYienXQ0cS
Content-Type: multipart/mixed; boundary="------------MPFO0WbdZc27rtowvhxQUMsd"

--------------MPFO0WbdZc27rtowvhxQUMsd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDcuMjUgMDg6MjUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4wNy4yMDI1
IDA4OjE5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTYuMDcuMjUgMjM6MTQsIEph
c29uIEFuZHJ5dWsgd3JvdGU6DQo+Pj4gV3JpdGUgdGhlIGFzc29jaWF0ZWQgZXZlbnQgY2hh
bm5lbCBpbnRvIHRoZSB4ZW5zdG9yZSBwYWdlIHNvIHhlbnN0b3JlZA0KPj4+IGNhbiByZWFk
IGl0LiAgeGVuc3RvcmVkIGNhbiBtYXAgdGhlIGdyYW50IGJ5IHRoZSByZXNlcnZlZCBncmFu
dCB0YWJsZQ0KPj4+IGVudHJ5LCBhbmQgdGhlbiByZWFkIG91dCB0aGUgZXZlbnQgY2hhbm5l
bCBhbmQgYmluZCBpdC4gIFRoaXMgZWxpbWluYXRlcw0KPj4+IHRoZSBuZWVkIGZvciBhbiBh
ZGRpdGlvbmFsIG1lY2hhbmlzbSB0byBkaXNjb3ZlciB0aGUgZXZlbnQgY2hhbm5lbC4NCj4+
Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphc29uLmFuZHJ5dWtAYW1k
LmNvbT4NCj4+PiAtLS0NCj4+PiAgICB4ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNz
LWJ1aWxkLmMgfCA3ICsrKysrKysNCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9k
b20wbGVzcy1idWlsZC5jIGIveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1idWls
ZC5jDQo+Pj4gaW5kZXggYTI3ODllM2JkZi4uMjg0MTM5YmYxNCAxMDA2NDQNCj4+PiAtLS0g
YS94ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMNCj4+PiArKysgYi94
ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMNCj4+PiBAQCAtMjYsNiAr
MjYsNyBAQA0KPj4+ICAgICNpbmNsdWRlIDxwdWJsaWMvaW8veHNfd2lyZS5oPg0KPj4+ICAg
IA0KPj4+ICAgICNpbmNsdWRlIDxhc20vZG9tMGxlc3MtYnVpbGQuaD4NCj4+PiArI2luY2x1
ZGUgPGFzbS9ndWVzdF9hY2Nlc3MuaD4NCj4+PiAgICAjaW5jbHVkZSA8YXNtL3NldHVwLmg+
DQo+Pj4gICAgDQo+Pj4gICAgI2luY2x1ZGUgPHhlbi9zdGF0aWMtbWVtb3J5Lmg+DQo+Pj4g
QEAgLTEyNiw4ICsxMjcsMTQgQEAgc3RhdGljIHZvaWQgX19pbml0IGluaXRpYWxpemVfZG9t
VV94ZW5zdG9yZSh2b2lkKQ0KPj4+ICAgIA0KPj4+ICAgICAgICAgICAgaWYgKCBnZm4gIT0g
WEVOU1RPUkVfUEZOX0xBVEVfQUxMT0MgJiYgSVNfRU5BQkxFRChDT05GSUdfR1JBTlRfVEFC
TEUpICkNCj4+PiAgICAgICAgICAgIHsNCj4+PiArICAgICAgICAgICAgZXZ0Y2huX3BvcnRf
dCBwb3J0ID0gZC0+YXJjaC5odm0ucGFyYW1zW0hWTV9QQVJBTV9TVE9SRV9FVlRDSE5dOw0K
Pj4+ICsgICAgICAgICAgICBwYWRkcl90IGV2dGNobl9nYWRkciA9IGdmbl90b19nYWRkcihf
Z2ZuKGdmbikpICsNCj4+PiArICAgICAgICAgICAgICAgIG9mZnNldG9mKHN0cnVjdCB4ZW5z
dG9yZV9kb21haW5faW50ZXJmYWNlLCBldnRjaG5fcG9ydCk7DQo+Pj4gKw0KPj4+ICAgICAg
ICAgICAgICAgIEFTU0VSVChnZm4gPCBVSU5UMzJfTUFYKTsNCj4+PiAgICAgICAgICAgICAg
ICBnbnR0YWJfc2VlZF9lbnRyeShkLCBHTlRUQUJfUkVTRVJWRURfWEVOU1RPUkUsIHhzX2Rv
bWlkLCBnZm4pOw0KPj4+ICsgICAgICAgICAgICBhY2Nlc3NfZ3Vlc3RfbWVtb3J5X2J5X2dw
YShkLCBldnRjaG5fZ2FkZHIsICZwb3J0LCBzaXplb2YocG9ydCksDQo+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUgLyogaXNfd3JpdGUgKi8pOw0K
Pj4NCj4+IEkgY291bGRuJ3QgZmluZCBhY2Nlc3NfZ3Vlc3RfbWVtb3J5X2J5X2dwYSgpIGZv
ciB4ODYuIEkgdGhpbmsgeW91IGVpdGhlciBuZWVkIHRvDQo+PiBpbnRyb2R1Y2UgaXQgZm9y
IGFsbCBhcmNocywgb3IgeW91IG5lZWQgdG8gaGFuZGxlIHRoaXMgZGlmZmVyZW50bHkuDQo+
IA0KPiBUaGlzIGNvZGUgaXNuJ3QgYnVpbGRhYmxlICh5ZXQpIGZvciB4ODYsIGlzIGl0PyBU
aGVyZSdzIGEgc2VyaWVzIG9mIEFsZWphbmRybydzDQo+IG1vdmluZyBpbiB0aGF0IGRpcmVj
dGlvbiwgYnV0IHRoYXQgZGlkbid0IGdvIGluIHlldC4gQW5kIGV2ZW4gdGhlbiBhaXVpIHRo
aXMNCj4gZmlsZSB3b3VsZCBzdGlsbCBiZSBleGNsdWRlZC4NCg0KSSB0aGluayB0aGlzIHdv
dWxkIG5lZWQgdG8gYmUgZXhwbGljaXRseSBtZW50aW9uZWQgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlDQp0aGVuLiBJIHRob3VnaHQgdGhpcyB3aG9sZSB3b3JrIHdvdWxkIGJlIHRhcmdldGlu
ZyB4ODYgYXMgd2VsbCwgYnV0IEkNCm1pZ2h0IGJlIHdyb25nLCBvZiBjb3Vyc2UuDQoNCg0K
SnVlcmdlbg0K
--------------MPFO0WbdZc27rtowvhxQUMsd
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------MPFO0WbdZc27rtowvhxQUMsd--

--------------JTKZgG9LKzcWovfYienXQ0cS--

--------------0w3jD03GQ6HS5Z0uQNxpdWc9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh4m5EFAwAAAAAACgkQsN6d1ii/Ey8u
dwf7BkgorZIrN2nS87t+959rsGv7NhJgH/a8ncjnZD8PK6PIrf5HPF7c/5C2Mp9927z+ngrKpsHE
hQMIPT0pUZ6igGD1iNj8xZ3wWRb3g/EHapvaadarRuYAjowSSrO2JuRh9gbXmiFceUSVH/hh5CUq
ngo6Ssf3Oe3B8M4RK0TSOzQRhzznOzGtLmV2Lm2rQfU+itNEbiHwPOq54RAkABKp3uSt8pnBBDfj
UwhlWzqjvF0pvYr+HNk6bh2rVM2IF23RMR0qxNQ2WcmDf7cU0X79e7y0Awdg3VoXG1zwS57i6vkv
qth8ZCAvoImEC1GLPvTPlAiLXd5dQY8dA4dI3Nhdvg==
=ii0x
-----END PGP SIGNATURE-----

--------------0w3jD03GQ6HS5Z0uQNxpdWc9--

