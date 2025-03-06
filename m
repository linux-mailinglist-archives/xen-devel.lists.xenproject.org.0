Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8398CA54FA9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 16:53:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903811.1311753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDWs-0001d1-7U; Thu, 06 Mar 2025 15:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903811.1311753; Thu, 06 Mar 2025 15:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDWs-0001bD-3s; Thu, 06 Mar 2025 15:52:58 +0000
Received: by outflank-mailman (input) for mailman id 903811;
 Thu, 06 Mar 2025 15:52:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tqDWq-0001b7-Gu
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 15:52:56 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 111bfd6b-faa3-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 16:52:54 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43bdf0cbb6bso4738685e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 07:52:54 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd42916a0sm53532375e9.9.2025.03.06.07.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 07:52:53 -0800 (PST)
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
X-Inumbo-ID: 111bfd6b-faa3-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741276374; x=1741881174; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DoHEQGT9RX+wJ/u5rTASJvN1jjJTYUBIWS65Yi/Z1Uw=;
        b=AIBvh08Rhqf/wTAKet7ds+bL0N8LMl0DVX9SVXloTLhD2vtuavVpvPQfTsQL5vpVJX
         nXiWCTmhL7sk/F9lbASUqOgdmZpt/Q89oyyJXNnAOR0OrEmAfrujzqPFW3EmqWtXig1z
         osMll5zPw0Vf/Z/BEOydbcKOogzI87Tym3BSHN4GSpzwrvzbtOby3n70vlWWIkwF4kYR
         FwvoLL8F3t4HoVTt2xU6ySIMyOP0E374sqg/bEMTA5XLyg8WVyZaF0+OmjmKb1SlYg87
         LYOzycQDJE/BII/qU/ysR9Nez2i7340BhiGKer6l2wjykE3aYUmwL/hpf8RrUwynxJ9j
         06ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741276374; x=1741881174;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DoHEQGT9RX+wJ/u5rTASJvN1jjJTYUBIWS65Yi/Z1Uw=;
        b=bYkEu3bcF/rsQ2MOQC5APjUpAYBsiwA6Cced/nAFDMx4PwQh6J18Rx/jnZ1SzN+82E
         8b392jVV4NM7fo/eAGzCBwRWQrgSqjia9y8qTlIjIq+es7KYba/OMZjmfI4Uco2aGgCA
         0DupXPk1ptdmsrXWEnNNXfE8AkXJJRfMIHBPQdQxSFnha+mhJH7wDeLrA2kuqEvYkAud
         jAUVGkguIG9g5MV/FkhzyxtjQBIB5Cr/p18wGzpeAJWWLEmkhzF8RMO1FcFwl2BWAPC8
         80li5lWem0E7OiPG5JK4PNx0E0ruZwe2/psJbX+/5ey5Q8U8q7GTRrM4/E7xSt9GYvRf
         jhig==
X-Forwarded-Encrypted: i=1; AJvYcCVVsLXPTqJ7SY/j0vbu2znpP5z/hOz3Njsy4MUxPTn5IDAsDZt8LP5mkeGlq7Xa5+QK+gahxpIRLo8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVwvHeX9t5I7Y/Y8F2btQEVFJ5XkVbpneJ+2opKoCy3Z5CIoFh
	Yo5CKCPs/31KisOoZQJt7afhohsOHkZUVvFzMPEz+dNjSXBLMAlJfkfUQE92gCw=
X-Gm-Gg: ASbGncv9mqy5nPhP/dclenfn7ODf0J3QJxDIT0NczQb8tIYhxtH64BbpCeey+q2wtHj
	Oq1akJHnvUoqn76OlOeTzKgKNlre8XCMh0VLM46Kop/Na6bkCnBKRT8UVh0T78JtIRtwcUw1TMb
	zKYgNAQsn2KaE3wX10gQDRxCCzLf2h8YTgRipYgzmh9/1CzaRAIi8XT9GiGtQ/lx9Tki0nTsU1t
	d4WK5r6roqx1CHMjG7VgCP4GqEOMD1NIOdPy9EuH/BQrBTpRHuhfR0G10nF7TDelldnhsQUns8z
	POmdqWcAglELibars44ZixtfiY7umFE15hnIzjBB2sWqCQw0UqJ+82Zqr/NHpFNfhuN84TwGaMA
	MwiWshWFQ09/BanWKSUcZINA+oI3HdGNVTXNHA/swvFJ9AoG+gLO2oY/o+xu+gP2dskA=
X-Google-Smtp-Source: AGHT+IHyDbEQladU940o+q0H6jdm5RFzuewoTVyFpNSj1SHgdsZWSwxImUJ3PuswzyyPxksA0M5BzQ==
X-Received: by 2002:a05:600c:314c:b0:43b:cc87:374a with SMTP id 5b1f17b1804b1-43bd296f676mr63093075e9.18.1741276373990;
        Thu, 06 Mar 2025 07:52:53 -0800 (PST)
Message-ID: <20e4b2ef-fa2f-447d-a02a-c7a349b6c599@suse.com>
Date: Thu, 6 Mar 2025 16:52:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/9] xen: add bitmap to indicate per-domain state
 changes
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-4-jgross@suse.com>
 <21bd8eff-1583-42a9-baf4-00a495ab7a5b@suse.com>
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
In-Reply-To: <21bd8eff-1583-42a9-baf4-00a495ab7a5b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3DOvb0ioRRPOJZbRmxPqF1b5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3DOvb0ioRRPOJZbRmxPqF1b5
Content-Type: multipart/mixed; boundary="------------96X0DoM3oz0HeWBDrUR2mxQa";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <20e4b2ef-fa2f-447d-a02a-c7a349b6c599@suse.com>
Subject: Re: [PATCH v8 3/9] xen: add bitmap to indicate per-domain state
 changes
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-4-jgross@suse.com>
 <21bd8eff-1583-42a9-baf4-00a495ab7a5b@suse.com>
In-Reply-To: <21bd8eff-1583-42a9-baf4-00a495ab7a5b@suse.com>
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

--------------96X0DoM3oz0HeWBDrUR2mxQa
Content-Type: multipart/mixed; boundary="------------8r23VJUdE6lj059gJ1RSU0lX"

--------------8r23VJUdE6lj059gJ1RSU0lX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDMuMjUgMTY6NDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wMi4yMDI1
IDEyOjM0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQEAgLTEwNzUsNiArMTA4NiwyNiBA
QCBzdGF0aWMgdm9pZCBjbGVhcl9nbG9iYWxfdmlycV9oYW5kbGVycyhzdHJ1Y3QgZG9tYWlu
ICpkKQ0KPj4gICAgICAgfQ0KPj4gICB9DQo+PiAgIA0KPj4gK3N0cnVjdCBkb21haW4gKmxv
Y2tfZG9tX2V4Y19oYW5kbGVyKHZvaWQpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgZG9tYWlu
ICpkOw0KPj4gKw0KPj4gKyAgICBkID0gZ2V0X2dsb2JhbF92aXJxX2hhbmRsZXIoVklSUV9E
T01fRVhDKTsNCj4gDQo+IFRoZSBBcm0gZG9tMGxlc3MgY3Jhc2goZXM/KSBmb3VuZCBieSBD
SSBhcmUgYXBwYXJlbnRseSBhIHJlc3VsdCBvZiB0aGlzIHBvc3NpYmx5DQo+IHJldHVybmlu
ZyBOVUxMIChoYXJkd2FyZV9kb21haW4gPT0gTlVMTCkuIFJldHVybmluZyBOVUxMIGZyb20g
aGVyZSBhbHNvIGluIHRoaXMNCj4gY2FzZSAoYW5kIG5vdCBqdXN0IC4uLg0KPiANCj4+ICsg
ICAgaWYgKCB1bmxpa2VseSghZ2V0X2RvbWFpbihkKSkgKQ0KPj4gKyAgICAgICAgcmV0dXJu
IE5VTEw7DQo+IA0KPiAuLi4gaW4gdGhpcyBvbmUpIHdvdWxkIGF0IGxlYXN0IGRlYWwgd2l0
aCB0aGUgdXNlIGZyb20gZG9tYWluX2NoYW5nZWRfc3RhdGUoKS4gSQ0KPiBkaWRuJ3QgY2xv
c2VseSBjaGVjayBvdGhlciB1c2VzLiBUaG91Z2h0cz8NCj4gDQo+IEphbg0KDQpKdXN0IGFi
b3V0IHRvIHBvc3QgYSBwYXRjaC4NCg0KVGhlcmUgaXMgb25lIG90aGVyIGNhc2Ugd2hlcmUg
YSBOVUxMIGNoZWNrIGlzIHdhbnRlZC4NCg0KDQpKdWVyZ2VuDQo=
--------------8r23VJUdE6lj059gJ1RSU0lX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------8r23VJUdE6lj059gJ1RSU0lX--

--------------96X0DoM3oz0HeWBDrUR2mxQa--

--------------3DOvb0ioRRPOJZbRmxPqF1b5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfJxNUFAwAAAAAACgkQsN6d1ii/Ey/I
iAf9FlC9HOudo6+PoRoPa+i9IN/vPf19Bda8RRERW4Di1HGuivWw2g1JMv/seQRK9n3Y0L8aiDzU
5b2THatjT+W7IXSIj1bsf9aIKo+eejejLOg2oX6H2RTFwsUc/8Wbt35B1GH2VCE1eZwez1jZXbbD
4e0MUSWGgnQtIm25RndQe2+TttFyI6wQAoLPb/S/tlWtR784c8KXTHDPciV5x+ZhpvREoSbGi0HK
EF5XbiLvxfqc8opTV6QZFtu/6DX+EZwqFU9HL4R8JOg/dC1aYaWXxb3+8dg22KsLBivAcFdWR1J1
TI6DwSpL5u3QWOWhtOW4rUv0Qpd69NxQYPRBEjynTQ==
=isr6
-----END PGP SIGNATURE-----

--------------3DOvb0ioRRPOJZbRmxPqF1b5--

