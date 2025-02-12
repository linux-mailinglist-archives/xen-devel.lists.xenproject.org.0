Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D47EA32437
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 12:05:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886297.1295968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiAXe-0000so-N3; Wed, 12 Feb 2025 11:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886297.1295968; Wed, 12 Feb 2025 11:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiAXe-0000pl-Jg; Wed, 12 Feb 2025 11:04:30 +0000
Received: by outflank-mailman (input) for mailman id 886297;
 Wed, 12 Feb 2025 11:04:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y4oX=VD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tiAXc-0000pd-Oj
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 11:04:28 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fa6359d-e931-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 12:04:26 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38dc6d9b292so2944894f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 03:04:26 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbde1dfaesm17340834f8f.90.2025.02.12.03.04.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 03:04:25 -0800 (PST)
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
X-Inumbo-ID: 1fa6359d-e931-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739358266; x=1739963066; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W1dlGHxCQbRS0uYSerDMSpI2w1rSU1kndDeoEazJDww=;
        b=OclY7y5RwQdu3Oik2EFGNT1xdvA58oPMIWcrRXM2ckv1sEF1RvWvFFveumWQU5s4Ze
         gy3yMAqCO4Th/oXCg8jOLO6KoHIfNaaRVKW95aa1raDXynIruc+scowqLl8rID45+Fcs
         nGtIFcMTuHmRQGQ6k6zO2ggwY32AqaY0hGKD5omXYkl9aI6qhUZP03XPL8Yi9JZ0RtHJ
         Oy8IZ0TXQz0aOKRhwRHNg8BEZowKKoz86oSb4mAfIwmvFgRkR+8kXTUtLKemYt3OKgj7
         ukyUKrykIipO2QTX7xzWMr3Mo8nkE+RZ14MEdOOmHfz77ZQvVVvFRIDagSUPnEwj0KvC
         OOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739358266; x=1739963066;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W1dlGHxCQbRS0uYSerDMSpI2w1rSU1kndDeoEazJDww=;
        b=i61LaESMXK8l7HJuQaB8SPU2p3YLoCL5JbiAiwdkIFGnzOBYGo+N5m6/2A4Y1q5Gmf
         VtMeJ87tvYLwTVs/6I+oiK4/8NahNzUckCgidc4kOxNF60KwsuLYfxMIjB2YjRJPqiv6
         hzRxXTcY34iAfgkvOQjWdEAiN6Bm7eRoNM7rUiz3ascbg5NDp4Bue8qPOkwng2QXkOe1
         fBH48sz+YmndvfPMBgvDvkaK48cAG0QTFUtu/hbbS/NzuL1YaEMji486GyrEc/8Hb3W7
         j5VG10QYfBs4f7pkoOty6mxatvOztWDC+NHI1qid0nRPgMXW8feuDJfbPqJOByob6oYT
         QXTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8DeFiteKiJ4QRtWuBqwGxvm6qnnmZYd4m8VpaiIUZjDSZbmMUVeChHXgn2krLRliearzo+osdFJ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2tskdKKtV6234JVgbX2c61AhUxtmGxTGbDGLGADmSwc7dM4Qb
	8KUboZafMPbrDf6g2+s5XpRvwu101eQXAo63br3hB/ILodRwZLSvQi6Uht8EHAk=
X-Gm-Gg: ASbGncunYppT3zahLz+6GmrVL19Fys3Axj3fOvPvQXQufDblSf3eLhW/LdUpkkqU8vz
	B/RcR9mrpRo0ybk+C419GXhnthfoJedLIuby0LMbLtxVDSewJO9EJ1o4iQ6nuBfR0G1IiaW9/1v
	SuleOukLvqebskgIhmiAZmafcKu+sXuehsOQe9gMAO7LmzfXkftfEtBZpZOj5h+RmNMTS1Oq6i0
	dIfEllrk7rFcfuO+Nlhp1kAmA99Go8+gXlBUmZ1cuGg83jOB4hlnepyCXHfWSvz95nav7QR6aav
	Ou2pz/rQNI4dMZHZd3A0fhhBDzBl9AsAA9+q/FgfN7R2JYZyRprCXrdaoZSan3RFQHc4PVErkxT
	3lgcibMrnVr1//SCrI8pH8CzFaZM8nt4oJUz+Hw==
X-Google-Smtp-Source: AGHT+IEV3LceUhlJZevV3XSLTkc5PdO981bVL7+QH8DsCH7ZiHwizJ5uYyA7Coj7xe6Azd4NSjigzg==
X-Received: by 2002:a5d:6da4:0:b0:385:e17a:ce61 with SMTP id ffacd0b85a97d-38dea605267mr2044963f8f.53.1739358265968;
        Wed, 12 Feb 2025 03:04:25 -0800 (PST)
Message-ID: <f6822b63-ebda-4134-b91e-b189006d072a@suse.com>
Date: Wed, 12 Feb 2025 12:04:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/swiotlb: relax alignment requirements
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, Jan Vejvalka <jan.vejvalka@lfmotol.cuni.cz>,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20250211120432.29493-1-jgross@suse.com>
 <20250211120432.29493-2-jgross@suse.com>
 <5255102c-de9f-4cd8-8311-5d5b5eb26832@suse.com>
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
In-Reply-To: <5255102c-de9f-4cd8-8311-5d5b5eb26832@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZmYW6lsGiLacWZAkMhxxj0vd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZmYW6lsGiLacWZAkMhxxj0vd
Content-Type: multipart/mixed; boundary="------------7LxECW4oYiLRoqHgKD7xD2zq";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, Jan Vejvalka <jan.vejvalka@lfmotol.cuni.cz>,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Message-ID: <f6822b63-ebda-4134-b91e-b189006d072a@suse.com>
Subject: Re: [PATCH 1/2] xen/swiotlb: relax alignment requirements
References: <20250211120432.29493-1-jgross@suse.com>
 <20250211120432.29493-2-jgross@suse.com>
 <5255102c-de9f-4cd8-8311-5d5b5eb26832@suse.com>
In-Reply-To: <5255102c-de9f-4cd8-8311-5d5b5eb26832@suse.com>
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

--------------7LxECW4oYiLRoqHgKD7xD2zq
Content-Type: multipart/mixed; boundary="------------nLntjFo3rp3bHtu0VCMr60Tz"

--------------nLntjFo3rp3bHtu0VCMr60Tz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDIuMjUgMDc6NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4wMi4yMDI1
IDEzOjA0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gV2hlbiBtYXBwaW5nIGEgYnVmZmVy
IGZvciBETUEgdmlhIC5tYXBfcGFnZSBvciAubWFwX3NnIERNQSBvcGVyYXRpb25zLA0KPj4g
dGhlcmUgaXMgbm8gbmVlZCB0byBjaGVjayB0aGUgbWFjaGluZSBmcmFtZXMgdG8gYmUgYWxp
Z25lZCBhY2NvcmRpbmcNCj4+IHRvIHRoZSBtYXBwZWQgYXJlYXMgc2l6ZS4gQWxsIHdoYXQg
aXMgbmVlZGVkIGluIHRoZXNlIGNhc2VzIGlzIHRoYXQgdGhlDQo+PiBidWZmZXIgaXMgY29u
dGlndW91cyBhdCBtYWNoaW5lIGxldmVsLg0KPiANCj4gSXMgdGhpcyByZWFsbHkgdHJ1ZSBp
biBhbGwgY2FzZXM/IENhbid0IGUuZy4gY29tcG91bmQgcGFnZXMgbWFrZSBpdCBoZXJlLA0K
PiB3aXRoIHRoZSBjYWxsZXIgdGhlbiBzdGlsbCBiZWluZyBwZXJtaXR0ZWQgdG8gYXNzdW1l
IGhpZ2hlciB0aGFuIHBhZ2UNCj4gYWxpZ25tZW50PyBBbGlnbm1lbnQgY2hlY2tpbmcgaW4g
eGVuX3N3aW90bGJfbWFwX3BhZ2UoKSB3b3VsZCBwZXJoYXBzDQo+IG5lZWQgZG9pbmcgd2l0
aCB0aGUgYmFzZSBhZGRyZXNzIG9mIHRoZSBpbmNvbWluZyBwYWdlLCBpLmUuIGV4Y2x1ZGlu
Zw0KPiB0aGUgaW5jb21pbmcgb2Zmc2V0Lg0KDQpUaGUgRE1BIGludGVyZmFjZXMgaW4gcXVl
c3Rpb24gKC5tYXBfcGFnZSBhbmQgLm1hcF9zZykgYXJlIGV4cGxpY2l0bHkNCmRlc2lnbmVk
IGZvciBETUEgc3RyZWFtaW5nIG1vZGUuIEkgZG9uJ3QgdGhpbmsgc3RyZWFtaW5nIG1vZGUg
cmVxdWlyZXMgYQ0Kc3BlY2lhbCBwYWdlIGFsaWdubWVudC4NCg0KDQpKdWVyZ2VuDQo=
--------------nLntjFo3rp3bHtu0VCMr60Tz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------nLntjFo3rp3bHtu0VCMr60Tz--

--------------7LxECW4oYiLRoqHgKD7xD2zq--

--------------ZmYW6lsGiLacWZAkMhxxj0vd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmesgDgFAwAAAAAACgkQsN6d1ii/Ey+z
6Qf/UX+Bm2CFCmD/3J96Ci3ilP1XFLCKdppNTba/LrgPKLNdbEizBGI7gm4D/eVKzHFj7S1Mgy4D
msUT7kaLdjoUyy1oE9K0BNCtJPEVx6ZV6iz20iA1oiri3z7RI1/FmH3BTORjzJ4q8698iwrWQ7IR
GAr2BKkDb8XAgTbG0bmhoXbJoRorupWsa2mEegMUIlZL0d6bPRvlOnhH1+E8UjGFJtgJBDerCWtq
r+XdVSHtFcqJeJhpk6I/9mmR9PuFTGdMllWvPEG92E8BCQzG5whvcAaTjciRTr0N1kkMIk/dwXXg
UXt2PduePw/v9KXfe711fbg/heONqXlezKDk96naXQ==
=5mP+
-----END PGP SIGNATURE-----

--------------ZmYW6lsGiLacWZAkMhxxj0vd--

