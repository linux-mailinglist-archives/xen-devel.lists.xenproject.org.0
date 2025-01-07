Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673D5A04706
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 17:48:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866688.1278027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCkb-0004mb-3u; Tue, 07 Jan 2025 16:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866688.1278027; Tue, 07 Jan 2025 16:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCkb-0004ks-16; Tue, 07 Jan 2025 16:48:17 +0000
Received: by outflank-mailman (input) for mailman id 866688;
 Tue, 07 Jan 2025 16:48:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tVCkZ-0004km-F9
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 16:48:15 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f6189dc-cd17-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 17:48:13 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d3dce16a3dso28011275a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 08:48:13 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80676f26dsm25271142a12.20.2025.01.07.08.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 08:48:12 -0800 (PST)
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
X-Inumbo-ID: 2f6189dc-cd17-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736268493; x=1736873293; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3vmjPXkNiKoR/nqNJyerB4vd1D1VWkaiKYfK3WUe91c=;
        b=fFt8VQvLFX68Z0fjQow2XAPrW9TxBph9X7EuaofEzfcbDCnvh64FKTeXN2p864ebQd
         L4y5FwRn6B2BRl0nUET+1KsbtFktKfMxkN+EjJbSgQlcL2RgWVTBhSi45YUA3DXzTEUH
         C7dCMoStHQXXjZNduYphiRJEChNS/eqbKL/vTLgaUfBvyYpI2C0J7tvY/3kxg7PNKk3v
         B1oCU01Tdd0QZjCuWyBmQHZ4HLs6zv3swGuygUkBVKCERu5zyCa8j8axzB0Dedk302sH
         CnERxliunMb7RmC2STqZpNXqq9r6ZQ2aXYmbqkNqteb/0Isy/PZG8ErL+/iuvEEpiM3p
         MyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268493; x=1736873293;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3vmjPXkNiKoR/nqNJyerB4vd1D1VWkaiKYfK3WUe91c=;
        b=TLNFiqWELK/9UDu86m2AGG4EaWpvt4w7t/X2OweEHvbv5upH6hOOSZJpKO/5ePVG4e
         yxPchHmSA7HvRumkekqNToAcwbGA+Rwd2pUeGG9v/cXP/0o74Jz0F9hsQpHHp9nJoFHr
         naZcnRnKgVyv4YpsQfBWGfsJg+goiHM/lMqTuKPHrOHCxbGdnBtQoIrBSIImpZESyHDo
         LWCix8clNStFyi4oBNatb8b7D4BKeiC2YFobYb+TLNz0FDLBO+E758p8Cl+tpJkGCnet
         AfzMhRBZHrtPRG6CFsyA098mxwiMOHYGfI0s8Oo2CnQECUlj/KbDkoe0ymjFzsmK0pkv
         ngMg==
X-Forwarded-Encrypted: i=1; AJvYcCVof2rwth7MMicvX2jhn5dTbQMF3HQzqV6DXRk4qyIH/7NAl67a2+V/NQohgbT8Gn0s2gJ+vPKPwIM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEUnxoA0Fo2ln74D42t11uYQvUSC7CLnl7y3GfZaVH0CHuFvUz
	MLE30J9/7TW5EN3OZbBH4Q/8o+gtwiW8W7MJiZrMHNis8aG4/+TeJ5UxukuUXDI=
X-Gm-Gg: ASbGnctQJEgA8O2txWesRcAXwnY88fk5BCTty9JJk1UCCPRNG8WfhRtVwkT+vvjjqDg
	rLH7CcPe1tez9TQzK89AgZ/alQBn5DQ4JyeloHTD/Iy5QmIYN1aVp9XX0AdcZ/RnMGFn86R6h38
	wsLmcyTEtetFup2RVQoYm+geH3GGtDeCzM1SvuZu/NxcRyyeubHQSlQHMuOsbO0W/0AKHaLICDE
	9cHTXhra2rtoBDNMq9DnjB4mRgvyb7SJkDwU48+j7/yiFHmIx+/O0dLnfjnUCQlPRWFt+Jlutko
	K5xqGf8BikkSCTFWQbEob5wSrtsACgkMsIlvXtitfbKIhsz7ouQaZ94d9ogEWzoh7pL703XsKrt
	YBLs9rQ==
X-Google-Smtp-Source: AGHT+IF9xb3JfpPnY56pH++ie3cFsshgexkPJmbAFIG5k8yPccc3eGkKCOjt/E5y4ldZiXMTZ7L6rA==
X-Received: by 2002:a05:6402:42c3:b0:5d4:c0c:70f9 with SMTP id 4fb4d7f45d1cf-5d95e8cf064mr2974415a12.6.1736268492968;
        Tue, 07 Jan 2025 08:48:12 -0800 (PST)
Message-ID: <81221a18-d6f8-418d-841a-8aa43420df09@suse.com>
Date: Tue, 7 Jan 2025 17:48:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] xen: add new domctl get_changed_domain
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-6-jgross@suse.com>
 <781daba7-5d6f-4d86-bce4-c5aa9d135513@suse.com>
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
In-Reply-To: <781daba7-5d6f-4d86-bce4-c5aa9d135513@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hZmKMrjhkNeVRsMyKk5MOBjE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hZmKMrjhkNeVRsMyKk5MOBjE
Content-Type: multipart/mixed; boundary="------------kIYTm0ezGH200OMoLai431hL";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <81221a18-d6f8-418d-841a-8aa43420df09@suse.com>
Subject: Re: [PATCH v6 5/7] xen: add new domctl get_changed_domain
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-6-jgross@suse.com>
 <781daba7-5d6f-4d86-bce4-c5aa9d135513@suse.com>
In-Reply-To: <781daba7-5d6f-4d86-bce4-c5aa9d135513@suse.com>
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

--------------kIYTm0ezGH200OMoLai431hL
Content-Type: multipart/mixed; boundary="------------HXhcw75K4GtuBuelXCONw4nV"

--------------HXhcw75K4GtuBuelXCONw4nV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDEuMjUgMTc6MjgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMS4yMDI1
IDExOjE3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2NvbW1vbi9kb21h
aW4uYw0KPj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYw0KPj4gQEAgLTE4NSw2ICsxODUs
NzYgQEAgc3RhdGljIHZvaWQgZG9tYWluX2NoYW5nZWRfc3RhdGUoY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCkNCj4+ICAgICAgIHVubG9ja19kb21fZXhjX2hhbmRsZXIoaGRsKTsNCj4+ICAg
fQ0KPj4gICANCj4+ICtzdGF0aWMgdm9pZCBzZXRfZG9tYWluX3N0YXRlX2luZm8oc3RydWN0
IHhlbl9kb21jdGxfZ2V0X2RvbWFpbl9zdGF0ZSAqaW5mbywNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkNCj4+ICt7DQo+
PiArICAgIGluZm8tPnN0YXRlID0gWEVOX0RPTUNUTF9HRVRET01TVEFURV9TVEFURV9FWElT
VDsNCj4+ICsgICAgaWYgKCBkLT5pc19zaHV0X2Rvd24gKQ0KPj4gKyAgICAgICAgaW5mby0+
c3RhdGUgfD0gWEVOX0RPTUNUTF9HRVRET01TVEFURV9TVEFURV9TSFVURE9XTjsNCj4+ICsg
ICAgaWYgKCBkLT5pc19keWluZyA9PSBET01EWUlOR19keWluZyApDQo+PiArICAgICAgICBp
bmZvLT5zdGF0ZSB8PSBYRU5fRE9NQ1RMX0dFVERPTVNUQVRFX1NUQVRFX0RZSU5HOw0KPj4g
KyAgICBpZiAoIGQtPmlzX2R5aW5nID09IERPTURZSU5HX2RlYWQgKQ0KPj4gKyAgICAgICAg
aW5mby0+c3RhdGUgfD0gWEVOX0RPTUNUTF9HRVRET01TVEFURV9TVEFURV9ERUFEOw0KPj4g
KyAgICBpbmZvLT51bmlxdWVfaWQgPSBkLT51bmlxdWVfaWQ7DQo+PiArfQ0KPj4gKw0KPj4g
K2ludCBnZXRfZG9tYWluX3N0YXRlKHN0cnVjdCB4ZW5fZG9tY3RsX2dldF9kb21haW5fc3Rh
dGUgKmluZm8sIHN0cnVjdCBkb21haW4gKmQsDQo+PiArICAgICAgICAgICAgICAgICAgICAg
ZG9taWRfdCAqZG9taWQpDQo+PiArew0KPj4gKyAgICB1bnNpZ25lZCBpbnQgZG9tOw0KPj4g
KyAgICBpbnQgcmMgPSAtRU5PRU5UOw0KPj4gKyAgICBzdHJ1Y3QgZG9tYWluICpoZGw7DQo+
PiArDQo+PiArICAgIGlmICggaW5mby0+cGFkMCB8fCBpbmZvLT5wYWQxICkNCj4+ICsgICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KPj4gKw0KPj4gKyAgICBpZiAoIGQgKQ0KPj4gKyAgICB7
DQo+PiArICAgICAgICBzZXRfZG9tYWluX3N0YXRlX2luZm8oaW5mbywgZCk7DQo+PiArDQo+
PiArICAgICAgICByZXR1cm4gMDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICAvKg0KPj4g
KyAgICAgKiBPbmx5IGRvbWFpbiByZWdpc3RlcmVkIGZvciBWSVJRX0RPTV9FWEMgZXZlbnQg
aXMgYWxsb3dlZCB0byBxdWVyeQ0KPj4gKyAgICAgKiBkb21haW5zIGhhdmluZyBjaGFuZ2Vk
IHN0YXRlLg0KPj4gKyAgICAgKi8NCj4+ICsgICAgaWYgKCAhZG9tYWluX2hhbmRsZXNfZ2xv
YmFsX3ZpcnEoY3VycmVudC0+ZG9tYWluLCBWSVJRX0RPTV9FWEMpICkNCj4+ICsgICAgICAg
IHJldHVybiAtRUFDQ0VTOw0KPj4gKw0KPj4gKyAgICBoZGwgPSBsb2NrX2RvbV9leGNfaGFu
ZGxlcigpOw0KPiANCj4gSW5zdGVhZCBvZiBsZWF2aW5nIGEgc21hbGwgd2luZG93IGZvciBy
YWNlcyBiZXR3ZWVuIHRoZSBpZigpIGFuZCB0aGlzDQo+IGZ1bmN0aW9uIGNhbGwsIGNhbid0
IHlvdSBzaW1wbHkgY29tcGFyZSBoZGwgYWdhaW5zdCBjdXJyZW50LT5kb21haW4/DQoNCkdv
b2QgaWRlYS4NCg0KPiANCj4+ICsgICAgd2hpbGUgKCBkb21fc3RhdGVfY2hhbmdlZCApDQo+
PiArICAgIHsNCj4+ICsgICAgICAgIGRvbSA9IGZpbmRfZmlyc3RfYml0KGRvbV9zdGF0ZV9j
aGFuZ2VkLCBET01JRF9NQVNLICsgMSk7DQo+PiArICAgICAgICBpZiAoIGRvbSA+PSBET01J
RF9GSVJTVF9SRVNFUlZFRCApDQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+PiArICAgICAg
ICBpZiAoIHRlc3RfYW5kX2NsZWFyX2JpdChkb20sIGRvbV9zdGF0ZV9jaGFuZ2VkKSApDQo+
IA0KPiBBcyB0aGlzIGlzIG5vdyBydW5uaW5nIHVuZGVyIGxvY2ssIGRvZXMgaXQgcmVhbGx5
IG5lZWQgdG8gYmUgdGVzdC1hbmQtY2xlYXI/DQo+IFdoYXQgbWVjaGFuaXNtIHdvdWxkIGFs
bG93IHRoZSBmbGFnIHRvIGJlIGNsZWFyZWQgYmV0d2VlbiB0aGUgZmluZC0xc3QgYW5kDQo+
IGhlcmU/IFBsdXMsIGxpa2UgZm9yIHBhdGNoIDQsIEkgdGhpbmsgaXQgY291bGQgYmUgX19j
bGVhcl9iaXQoKSBoZXJlLg0KDQpJdCBpcyBvbmx5IHVuZGVyIHJlYWRfbG9jaygpLCBzbyB0
aGVyZSBhcmUgY29uY3VycmVudCBjYWxscyBwb3NzaWJsZS4NCkkgZG9uJ3QgdGhpbmsgd2Ug
d2FudCB0byB1c2Ugd3JpdGVfbG9jaygpIGhlcmUsIGRvIHdlPw0KDQoNCkp1ZXJnZW4NCg==

--------------HXhcw75K4GtuBuelXCONw4nV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------HXhcw75K4GtuBuelXCONw4nV--

--------------kIYTm0ezGH200OMoLai431hL--

--------------hZmKMrjhkNeVRsMyKk5MOBjE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmd9WswFAwAAAAAACgkQsN6d1ii/Ey80
lQf+IpBZgtH4yG6uThGm4mHx/TrkyBTd3K2FYQtrX1iAcTNCMA0HGh0gOdjqMpiPFz8TIOJnyfWE
DifDO4Sm59B/9VkOdVCORpM+qeUwBY5Y/E3Jpd4+ci31rDMdPcciWt7blhDyUF2p0q25Qk02KWkM
4cMZksISo4BaHePj8NOb6l0urgtnxOzhq88zIxtQrWlYotjOJ6Vp7zlW8e2jWttu6t4mjXLOZ7pC
/nmrxuyweLEK+uVyLgkn9BxuHDZMRSTuQJw8luXepWRz58Qc+0RdBKB16oKxD/DltghCC4ujzCK0
Bs1ru1RszKvwrEF5Duc1uHueUAY67UT8uPDE1/LhVA==
=h/wc
-----END PGP SIGNATURE-----

--------------hZmKMrjhkNeVRsMyKk5MOBjE--

