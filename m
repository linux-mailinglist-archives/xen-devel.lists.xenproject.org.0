Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6142C7A6D4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 16:11:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1169308.1495070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMSmn-0007cG-HH; Fri, 21 Nov 2025 15:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1169308.1495070; Fri, 21 Nov 2025 15:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMSmn-0007ax-Dz; Fri, 21 Nov 2025 15:10:57 +0000
Received: by outflank-mailman (input) for mailman id 1169308;
 Fri, 21 Nov 2025 15:10:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wmUi=55=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vMSmm-0007ar-9K
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 15:10:56 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41d86e0a-c6ec-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 16:10:47 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-477b5e0323bso17481675e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Nov 2025 07:10:47 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f34ff3sm12086179f8f.16.2025.11.21.07.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 07:10:45 -0800 (PST)
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
X-Inumbo-ID: 41d86e0a-c6ec-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763737846; x=1764342646; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DPECoFCm4Ht3/cV9B1ezaL1kyMyMLr4fOnQzFvfl1dQ=;
        b=JMso+mdCsvPACUMfPmte8DO4/+dmLi7fe4py+SEz9/mH3FC4bLPhqgdsYRzK+C2ty+
         g55JYu+wwiDysIU9t+kjNvEYRrUZbmNCz/y7gDIhyB/AhBUdYzaeQtkoXcGRC7Y3ugIY
         /jWF/DJ2uiFo0qALxPc73mXWVoB6cVQP8CeWYBlrhCgB/xYKO8dr8epHXOFrVZ0FpPVa
         UUYtm3efXmV9ADsBTxO4uOnoLaaU6cvwuLLsS6sY4LqRDZ3p4OjWuBs2T/VkBxyWieeF
         EhXNZ1LknW0dIV78cax76MFEL6MYfHl0F/Uj7vUHZTPTIkZXzWNfdzUR64Mr2a+SUce+
         I4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763737846; x=1764342646;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DPECoFCm4Ht3/cV9B1ezaL1kyMyMLr4fOnQzFvfl1dQ=;
        b=PUZPiiXoqVa/acQKqttKMUyS0Y7GCY7hrh1x7ayc4SEBInoECSds3GMn6iWNrCB8cS
         TerHsRgolm+RjN0FlXEOr5LjzZhG+m7iPmOF7AEuZFZVd4QpW507TfioWfFW1YI9ECht
         yTjBSKs+eykwOLrXaw9VgBQAdfY8uTi8DxyM+56W6yB0cEHNSe9kLcRLA+TOMynwsjMc
         /ZRCNwa5E7mtD4e//i8infQSzLo1f9FP6XLUkmaCvGkQ8lP1fXD0KxYgzXILsgpZIGRV
         dQQ6+j97iUlTBOV5u+TDaGaGWd9Y+2a2lDckw6gcPdhEBZijA6ZQxmspA3BmjedCqUOP
         aD7g==
X-Forwarded-Encrypted: i=1; AJvYcCUjAR6KEsI1C6O3TITQHXiHDa12BOU/dSXbSRdyqTCVmBhohkRn/b+HmjT9rBEn99CYaQAjzf1hh0k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlBfFuV7Y/38TSM00jO51KIR1Lh+sbprLVP5H4aM4HOyY8XXaT
	l11GMQ8yeT93ov78yrFDasWves1hPw1gTJ6Ny3cClzriRSeBAsfhcruSSYQz1IlpJmc=
X-Gm-Gg: ASbGncvS+ie6yfgJnk/dlsLT4kbrVWHVhNVheauI0Em7kxXCKtXVzNdl3YFvKPJR3Mh
	DlSoXCQ5tKyVLD0qNt+lrm8TPjm/SB7awDm9g/snwZKTJswiwb1SPpPLacV9lmrQJCxnEsaCkzw
	q9t15gAb7Sa0r5+K9h/SdhP4z03SkQsBUt6AmaBOR+w0HlY+Fv0i+9etrTO58gy6n7jxalZ4heh
	PwrR5i/isgxGCo/18v/n9VksaSPxjTwtfqMBOWo4RDxp1EFAs/EOrQSEdb4tzj+FB6stv9Dza+l
	2OBvGRxZju7+CTjGEV3Gx1q4M3CZECOm07/Y2gJ+bg9/xGnoVDKRvVf6NHi3kUzlFVBN//U0HGe
	/qQPGIVCIREJgJth+c260q9MGpeq8Es4edE2EohDbtyZMKMjWnZvS7EIaBzFUatdICaCtf+lNyk
	uSQ7ysA+5wwt96WmfOmaT9W8u6Xd4dwxMKFr5AjfXVAD1DKUQILp2dFVUfXz3GDjlnIA7S27PbK
	wqQaB9VEcDB1I56ggb07fX6HSHICPbZhRRj1PM=
X-Google-Smtp-Source: AGHT+IGc5XlHFTLrdDnsPuGkdb6a7rDvhd0Qg4G2LZYfl3B+fINpcDUWo6Sc0cBkd1Fwy6zydAaj0A==
X-Received: by 2002:a05:600c:5952:b0:477:3fcf:368c with SMTP id 5b1f17b1804b1-477b9ee4fbfmr48544795e9.9.1763737846048;
        Fri, 21 Nov 2025 07:10:46 -0800 (PST)
Message-ID: <201bbc2a-310b-4880-8633-485535762258@suse.com>
Date: Fri, 21 Nov 2025 16:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <4f898adc-323d-4c3a-a780-1acb2c58345d@citrix.com>
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
In-Reply-To: <4f898adc-323d-4c3a-a780-1acb2c58345d@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------W9GfgIWIp9RmFWR5KBjr4m5I"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------W9GfgIWIp9RmFWR5KBjr4m5I
Content-Type: multipart/mixed; boundary="------------16SeOCdA52QldkIHHRqEL0AC";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <201bbc2a-310b-4880-8633-485535762258@suse.com>
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <4f898adc-323d-4c3a-a780-1acb2c58345d@citrix.com>
In-Reply-To: <4f898adc-323d-4c3a-a780-1acb2c58345d@citrix.com>
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

--------------16SeOCdA52QldkIHHRqEL0AC
Content-Type: multipart/mixed; boundary="------------Ps416FLVoHbQs0kHrs0ofvJ5"

--------------Ps416FLVoHbQs0kHrs0ofvJ5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMTEuMjUgMTY6MDMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDIxLzExLzIw
MjUgMToyMyBwbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IEFkZCBhIG5ldyBtYWtlIG1h
Y3JvIGZvciBjcmVhdGluZyA8ZmlsZT4gZnJvbSA8ZmlsZT4uaW4gYXQgYnVpbGQNCj4+IHRp
bWUuIFRvIGJlIHVzZWQgbGlrZSB0aGlzOg0KPj4NCj4+ICQoZm9yZWFjaCBmaWxlLCQoSU5f
VEFSR0VUUyksJChldmFsICQoY2FsbCBhcHBseS1idWlsZC12YXJzLCQoZmlsZSkpKSkNCj4+
DQo+PiBUaGlzIGNhbiBiZSB1c2VkIGluc3RlYWQgb2YgdGhlIGN1cnJlbnQgYXBwcm9hY2gg
dG8gcGVyZm9ybSB0aGUgc2ltaWxhcg0KPj4gc3RlcCBmb3IgZmlsZS5pbiBkdXJpbmcgLi9j
b25maWd1cmUuDQo+Pg0KPj4gVGhpcyB3aWxsIGF2b2lkIGhhdmluZyB0byBydW4gLi9jb25m
aWd1cmUganVzdCBiZWNhdXNlIG9mIG1vZGlmeWluZyBhDQo+PiBmaWxlIGRlcGVuZGluZyBv
biBhIHZhcmlhYmxlIHNldCBieSBjb25maWd1cmUuDQo+Pg0KPj4gUHJlcGFyZSB0byBoYXZl
IG11bHRpcGxlIGZpbGVzIGFzIHNvdXJjZSBmb3IgdGhlIHJlcGxhY2VtZW50IHBhdHRlcm5z
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4NCj4+IC0tLQ0KPj4gVjI6DQo+PiAtIGRvbid0IHVzZSBwYXR0ZXJuIHJ1bGUsIGJ1dCBj
cmVhdGUgZXhwbGljaXQgZGVwZW5kZW5jeSBpbiBtYWNybywNCj4+ICAgIGRvbid0IHJlcXVp
cmUgdG8gcmVuYW1lIHNvdXJjZSBmaWxlcyAoSmFuIEJldWxpY2gsIEFuZHJldyBDb29wZXIp
DQo+PiBWMzoNCj4+IC0gcHJlcGFyZSBmb3IgJChQQVRIX0ZJTEVTKSB0byBiZSBleHRlbmRl
ZCBieSBvdGhlciBNYWtlZmlsZQ0KPj4gLSBsZXQgZ2VuZXJhdGVkIGZpbGUgZGVwZW5kIG9u
ICQoSU5DX0ZJTEVTKQ0KPj4gLS0tDQo+PiAgIENvbmZpZy5tayB8IDEzICsrKysrKysrKysr
KysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvQ29uZmlnLm1rIGIvQ29uZmlnLm1rDQo+PiBpbmRleCBlMTU1NmRmYmZhLi4z
OWU4MDA3YjljIDEwMDY0NA0KPj4gLS0tIGEvQ29uZmlnLm1rDQo+PiArKysgYi9Db25maWcu
bWsNCj4+IEBAIC0xNTksNiArMTU5LDE5IEBAIGRlZmluZSBtb3ZlLWlmLWNoYW5nZWQNCj4+
ICAgCWlmICEgY21wIC1zICQoMSkgJCgyKTsgdGhlbiBtdiAtZiAkKDEpICQoMik7IGVsc2Ug
cm0gLWYgJCgxKTsgZmkNCj4+ICAgZW5kZWYNCj4+ICAgDQo+PiArUEFUSF9GSUxFUyA6PSBQ
YXRocw0KPj4gK0lOQ19GSUxFUyA9ICQoZm9yZWFjaCBmLCAkKFBBVEhfRklMRVMpLCAkKFhF
Tl9ST09UKS9jb25maWcvJChmKS5taykNCj4+ICsNCj4+ICtpbmNsdWRlICQoSU5DX0ZJTEVT
KQ0KPj4gKw0KPj4gK0JVSUxEX01BS0VfVkFSUyA9ICQoZm9yZWFjaCBmLCAkKFBBVEhfRklM
RVMpLCAkKHNoZWxsIGF3ayAnJCQyID09ICI6PSIgeyBwcmludCAkJDE7IH0nICQoWEVOX1JP
T1QpL2NvbmZpZy8kKGYpLm1rLmluKSkNCj4gDQo+IEV2ZXJ5dGhpbmcgZWxzZSBpbiB0aGUg
c2VyaWVzIGlzIGxvb2tpbmcgZmluZSBub3cuwqAgQnV0IHdoeSBpcw0KPiBQQVRIX0ZJTEVT
IGRyb3BwaW5nIHRoZSAubWsgZXh0ZW5zaW9uIGZyb20gdGhlIGZpbGU/DQo+IA0KPiBJdCBs
b29rcyB3ZWlyZCBmb3IgYm90aCBJTkNfRklMRVMgYW5kIEJVSUxEX01BS0VfVkFSUyB0byBo
YXZlIHRvDQo+IHJlLWluc2VydCBpdC4NCg0KSG1tLCByaWdodC4NCg0KTGV0IG1lIGNoYW5n
ZSB0aGF0Lg0KDQoNCkp1ZXJnZW4NCg==
--------------Ps416FLVoHbQs0kHrs0ofvJ5
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

--------------Ps416FLVoHbQs0kHrs0ofvJ5--

--------------16SeOCdA52QldkIHHRqEL0AC--

--------------W9GfgIWIp9RmFWR5KBjr4m5I
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkggPQFAwAAAAAACgkQsN6d1ii/Ey8M
RQf/cyuynJCVcCjQ+RgostkspvFKkVOorZvPOtRvRlPBZv79M/RvdJzlY8CaAwhoLifpB2P4wtFe
jRhR9NTEygdu835ldun9S6EWG4RKMcu+PheDYdsQ+4GcR+uDTwx4QbdZgUhra4L4yPr4ESg63WjO
7uiBrXXUFqTDbIwEAhxZEC6WLnRIUUbs6euFxBM943eehdMMPycBSb+dhV4LyGiyFpJuDD3uAJBm
HjhtyoI4VCCPVqamAPhBabh3gWeBH+qr9zXOLUVbHed5BTEkhAiO0s3hfNUcvhVrxVThzHt5u8iT
4RVWJW8RxeCTe5O6ShzEuiE3KNgSZryjnYiXIvBAUA==
=ULGP
-----END PGP SIGNATURE-----

--------------W9GfgIWIp9RmFWR5KBjr4m5I--

