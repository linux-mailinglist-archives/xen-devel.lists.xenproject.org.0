Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13073A5BCFE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 10:59:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907618.1314825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwO6-0002V7-HA; Tue, 11 Mar 2025 09:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907618.1314825; Tue, 11 Mar 2025 09:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwO6-0002Se-Cx; Tue, 11 Mar 2025 09:59:02 +0000
Received: by outflank-mailman (input) for mailman id 907618;
 Tue, 11 Mar 2025 09:59:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6th=V6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1trwO5-0002SY-68
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 09:59:01 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 742ae5ce-fe5f-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 10:58:59 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e5b6f3025dso7415713a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 02:58:59 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac23943945asm884610366b.22.2025.03.11.02.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 02:58:58 -0700 (PDT)
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
X-Inumbo-ID: 742ae5ce-fe5f-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741687139; x=1742291939; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HhE42444M87VoHUgJqG8UhAKyxHfK0vP1HL/mLp74ZU=;
        b=dEhPkL4I2P5j8YMxBUvoIVmbOFMiMyB/7uq8xZ4+UuMMgdStf3wY/PhPbS5oc0uA1T
         foOOc0BNU8PBLEar/vmAoEo2a8z3S50rBGYiTLB+f48vqbKc7vUiPCyXEeGI2f4GPAVX
         1RXmZw47LfHXybCw0Xo9j8HYpie8TKYsI/eVG1X95BXp2+voOzs7F0JBuMl65shMGScS
         rgSH1ES7/moDgkwRBnKC+ebmvW8zhjR0Gwm5iibo7df0hXwb59TH4nkpjQDZw2aRUjMh
         BRR+yrbQ25V/du7f2sNUa9o+ilTIFX81rMW78MDzA3kyU9aPGeFA9hdUEfcF67TCPoki
         8FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741687139; x=1742291939;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HhE42444M87VoHUgJqG8UhAKyxHfK0vP1HL/mLp74ZU=;
        b=wT3C6lEQOWHgzw18wetEuE/w8lU+RvRuaJjPnPtprXFgBpvRWCVt27RN/KDhgiicET
         jFmlX0OmX0497mphR3RPjW1kwrLTT3AuAH0hJ4Us+0GNAIWQdylyAqlNHOTtU/FWW5fd
         WIR74lrw515ajm7SFJXdy6yU2wdmzlPGsTqMBr6KXKzBu1fT1vPMk2N6gF1Wxk+P+mLM
         arYgXWBK07PoToy0aHCvSacT/sTmZWXRbRdCIWeoYMYm3PpSGSjqyDWUAcTUC8afn4Er
         nLZbnJAlvPyQJaoXip43284sJRIu1vgM4J7uJ4lqBwMiE14YFiXWctXZVDfdW17gM5U/
         OnwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjurZlZtLaeg2oOL/YVnFsbezAdo3fG+NxgRGb5nv9mYFg8JkJ+K/nyp4ncB0IxSUXHoLHhx32sDk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8iAokVy9L9dZ+/kwfQGW0VNpm/9GDT8fcxxLHrBT9UCBXSaqi
	//KrvIknejo1zQjmIcnRe92uf1071sLIXLZWSI68NFqkJ/soNEbnl4zt0SFg/Ek=
X-Gm-Gg: ASbGncsqGJ/+l9gquen/sLsP1xxsTRXG1GQQPDt3Umvl32a3M1/hZ59eciB1QjzP2KA
	4RPmJouHo1BS+nQfXl44LKutC58NmcOp9ZM3dYhLlscNYGW0viMtD2b84dMLQaHr5YqBxFMveHM
	6OyvTrS7oKCbFA+Abkc7L54qikXe8537fTQD+L8eM5c3lBjrmp1wqZFeSVBFVTUEtNgNDJ69Nei
	P5bTcD23Bc5u0qDytrym9YjwJgllWkNRafw/9N/b5aUML4RunZ+IgMNTEoSyhjyJRHPjHBXKYqX
	sKrYVi6PuaHQ0s6bV1sSKuYpdUv6DDGtomawBYy2KJ9QRf+cUXdDIySM66KMB6nLEYh0isJEjk2
	bjF0W8/kIGVG+Q6ZhVAShPefqOjhNFZom5Pj8XPWAOV68YX/sR7U5sdX2S0opmtcs03o=
X-Google-Smtp-Source: AGHT+IEiaOyDEhLrVKNCkkdnIQ3TnI9ssdcdteYeK3kt/1u9jo9jTghMfpWKpjiXy/vlXQNj0vu+TA==
X-Received: by 2002:a17:907:158a:b0:ac2:6913:7cc6 with SMTP id a640c23a62f3a-ac2b9e220f1mr258786266b.31.1741687138969;
        Tue, 11 Mar 2025 02:58:58 -0700 (PDT)
Message-ID: <5316de12-303b-4a2e-af34-3029ac03153b@suse.com>
Date: Tue, 11 Mar 2025 10:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/9] docs: update xenstore migration stream definition
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-8-jgross@suse.com>
 <526952a6-eb7a-4055-bd3f-eae1af203f80@xen.org>
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
In-Reply-To: <526952a6-eb7a-4055-bd3f-eae1af203f80@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------otMVjAFDba6JVMIuKtRYeChe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------otMVjAFDba6JVMIuKtRYeChe
Content-Type: multipart/mixed; boundary="------------8jaZm2EFVzYe9ZWjSyat6sbZ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <5316de12-303b-4a2e-af34-3029ac03153b@suse.com>
Subject: Re: [PATCH v8 7/9] docs: update xenstore migration stream definition
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-8-jgross@suse.com>
 <526952a6-eb7a-4055-bd3f-eae1af203f80@xen.org>
In-Reply-To: <526952a6-eb7a-4055-bd3f-eae1af203f80@xen.org>
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

--------------8jaZm2EFVzYe9ZWjSyat6sbZ
Content-Type: multipart/mixed; boundary="------------a8G1DYG2LmbvTnxB6wBOZjtJ"

--------------a8G1DYG2LmbvTnxB6wBOZjtJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDMuMjUgMTA6NDMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA0LzAyLzIwMjUgMTE6MzQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBJ
biBvcmRlciB0byBjbG9zZSBhIHJhY2Ugd2luZG93IGZvciBYZW5zdG9yZSBsaXZlIHVwZGF0
ZSB3aGVuIHVzaW5nDQo+PiB0aGUgbmV3IHVuaXF1ZV9pZCBvZiBkb21haW5zLCB0aGUgbWln
cmF0aW9uIHN0cmVhbSBuZWVkcyB0byBjb250YWluDQo+PiB0aGlzIHVuaXF1ZV9pZCBmb3Ig
ZWFjaCBkb21haW4ga25vd24gYnkgWGVuc3RvcmUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiBWODoNCj4+IC0g
bmV3IHBhdGNoDQo+PiAtLS0NCj4+IMKgIGRvY3MvZGVzaWducy94ZW5zdG9yZS1taWdyYXRp
b24ubWQgfCAxNCArKysrKysrKysrKysrLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZG9jcy9k
ZXNpZ25zL3hlbnN0b3JlLW1pZ3JhdGlvbi5tZCBiL2RvY3MvZGVzaWducy94ZW5zdG9yZS0g
DQo+PiBtaWdyYXRpb24ubWQNCj4+IGluZGV4IDA4MjMxNGJmNzIuLmZiYTY5MWVlMGQgMTAw
NjQ0DQo+PiAtLS0gYS9kb2NzL2Rlc2lnbnMveGVuc3RvcmUtbWlncmF0aW9uLm1kDQo+PiAr
KysgYi9kb2NzL2Rlc2lnbnMveGVuc3RvcmUtbWlncmF0aW9uLm1kDQo+PiBAQCAtMTU2LDcg
KzE1Niw3IEBAIHRoZSBkb21haW4gYmVpbmcgbWlncmF0ZWQuDQo+PiDCoCBgYGANCj4+IMKg
wqDCoMKgwqAgMMKgwqDCoMKgwqDCoCAxwqDCoMKgwqDCoMKgIDLCoMKgwqDCoMKgwqAgM8Kg
wqDCoMKgwqDCoCA0wqDCoMKgwqDCoMKgIDXCoMKgwqDCoMKgwqAgNsKgwqDCoMKgwqDCoCA3
wqDCoMKgIG9jdGV0DQo+PiDCoCArLS0tLS0tLSstLS0tLS0tKy0tLS0tLS0rLS0tLS0tLSst
LS0tLS0tKy0tLS0tLS0rLS0tLS0tLSstLS0tLS0tKw0KPj4gLXwgY29ubi1pZMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgY29ubi10eXBlwqDCoMKg
wqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4gK3wgY29ubi1pZMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgY29ubi10eXBlwqDC
oMKgwqAgfCB1bmlxLWlkLW9mZsKgwqAgfA0KPj4gwqAgKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLSsNCj4gID7CoMKg
IHwgY29ubi1zcGVjPsKgwqAgLi4uDQo+PiBAQCAtMTY1LDYgKzE2NSw5IEBAIHRoZSBkb21h
aW4gYmVpbmcgbWlncmF0ZWQuDQo+PiDCoCArLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPj4gwqAgfCBkYXRhDQo+
PiDCoCAuLi4NCj4+ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPj4gK3wgdW5pcXVlLWlkwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4gKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0rDQo+PiDCoCBgYGANCj4+IEBAIC0xNzgsNiArMTgxLDEyIEBAIHRoZSBkb21haW4gYmVp
bmcgbWlncmF0ZWQuDQo+PiDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MHgwMDAxOiBzb2NrZXTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4gwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDB4MDAwMiAtIDB4RkZGRjogcmVzZXJ2ZWQgZm9yIGZ1dHVyZSB1c2XCoMKg
wqDCoCB8DQo+PiDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4gK3wgYHVuaXEtaWQtb2ZmYMKg
IHwgVGhlIG9mZnNldCAoaW4gb2N0ZXRzKSBvZiB0aGUgYHVuaXF1ZS1pZGDCoMKgwqAgfA0K
Pj4gK3zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBmaWVsZCBmcm9tIHRoZSBz
dGFydCBvZiB0aGUgcmVjb3JkIGJvZHkuwqDCoMKgwqAgfA0KPj4gK3zCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCBJZiAwLCBubyBgdW5pcXVlLWlkYCBmaWVsZCBpcyBwcmVz
ZW50LsKgwqDCoMKgwqDCoCB8DQo+PiArfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8IE9ubHkgbmVlZGVkIGZvciBgc2hhcmVkIHJpbmdgIGNvbm5lY3Rpb24gaW7CoCB8DQo+
PiArfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IGxpdmUgdXBkYXRlIHN0cmVh
bXMuwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwN
Cj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPiANCj4gTG9va2luZyBhdCB0aGUgcmVzdCBvZiB0
aGUgcmVjb3JkLCB0aGUgdW5pcXVlIElEIHdvdWxkIGJlIHBhc3QgdGhlIGluLWRhdGEgDQo+
IChsZW5ndGggaXMgMi1ieXRlKSBhbmQgdGhlIG91dC1kYXRhIChsZW5ndGggaXMgNC1ieXRl
KS4gU28gdGVjaG5pY2FsbHkgdGhlIA0KPiBvZmZzZXQgd291bGQgbmVlZCA1LWJ5dGVzLiBC
dXQgaGVyZSB5b3UgYXJlIHVzaW5nIDItYnl0ZXMuIENhbiB5b3UgZXhwbGFpbiB3aHk/DQoN
Ckdvb2QgY2F0Y2guDQoNCkkgdGhpbmsgSSBuZWVkIHRvIGNoYW5nZSB0aGlzIHRvIGJlIGEg
ZmxhZyBpbmRpY2F0aW5nIHRoYXQgdGhlIHVuaXF1ZS1pZA0KaXMgcHJlc2VudCBhbmQgbG9j
YXRlZCBhdCB0aGUgbmV4dCA4LWJ5dGUgYm91bmRhcnkgYWZ0ZXIgImRhdGEiLg0KDQoNCkp1
ZXJnZW4NCg==
--------------a8G1DYG2LmbvTnxB6wBOZjtJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------a8G1DYG2LmbvTnxB6wBOZjtJ--

--------------8jaZm2EFVzYe9ZWjSyat6sbZ--

--------------otMVjAFDba6JVMIuKtRYeChe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfQCWIFAwAAAAAACgkQsN6d1ii/Ey9K
oAgAgDgKSDQKr6ANf2h9Rq5fm9shEtnLPgVJkZJO2EZSFo4TyDGnB6r7GX21CljwFxC2J1uIM6+o
K25ODtpY0pigXPS9GE8sDSYZ3kltc+lJPMtlt9e3GqTsh8ADD3Me4WPMo5OrmEIOcggHL0qYHaC/
Y0jquOkONBvWPr3nEvXecnE+WKOEM/T5gGvClLTVBwbA+Y26DIBO9xkuwuNVqK8DskAsXEyN4rIs
DxerzBh1UJczudsG0j9QbcDX2vGpxpv96z5mjnD9NqDdRZatoxgabTpIUn2kTtyuBx5GmzS3BKh6
Nd09kBgKUorfQNPuhwJxAmaecFcJ+XZvShqnrpLlDA==
=tPPM
-----END PGP SIGNATURE-----

--------------otMVjAFDba6JVMIuKtRYeChe--

