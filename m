Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E29C5B7F5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 07:19:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162269.1489977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJn9G-0000rB-BZ; Fri, 14 Nov 2025 06:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162269.1489977; Fri, 14 Nov 2025 06:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJn9G-0000pU-8F; Fri, 14 Nov 2025 06:19:06 +0000
Received: by outflank-mailman (input) for mailman id 1162269;
 Fri, 14 Nov 2025 06:19:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=leFb=5W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vJn9E-0000pO-8E
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 06:19:04 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc9e2a2e-c121-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 07:18:56 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b714b1290aeso241222766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 22:18:56 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734ff2615esm315298166b.73.2025.11.13.22.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 22:18:55 -0800 (PST)
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
X-Inumbo-ID: cc9e2a2e-c121-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763101135; x=1763705935; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oY4T12wbr6EVML1/t67PBEvW0oz4Zy+yHEEGawpP/Ik=;
        b=Fmbqfekq9YxYqmSkRg/Ccjz3mZ81A3VtN/3k4rYurhRsR8NHXvm64TI/swOzvt9HmO
         UEHuuBh1OVhEPp1JEMBr0kYaKHK9OA0+eRQzY/PE8mgSDAeXRPTrnPfFp1HtOpnpoVnC
         neLTKLDXfn937Kz5MzAr0XMMOyMCKs4liuvozDU7QoWEPiofXoM4X7jc6A5921htrS3F
         j+uCsaEulvUzKLrw0O5CVGlTyE7/sNwemf6nb0U1WeTVBi8b+NY5m/iSRDnTG0+EaY+w
         dO1T816ra9P+LZHjQvvf/OHQTxlbUNkucgyKaJDFOA1G7Z2Bp12azvSveWaBztrhMwFI
         0izg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763101135; x=1763705935;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oY4T12wbr6EVML1/t67PBEvW0oz4Zy+yHEEGawpP/Ik=;
        b=UnVeHyF89zaMYeCv3sqNJjL4qPY8CD2I3NfqB1+HcOuqYJOLTMDlv7AW+H0owgWrkb
         41pL5gEqlhDakFzsqCa8LTPAPJ7aCvOeRtghocqebKYE5+n8DZQZEfGxcVZ37ch94kCC
         a6CBGC9SIS//W3V3m6J3zcvYGmRvYWsnXnTVRGPJ4uQYzaqzMLHHhyEsecICWThNxi52
         NHF0OMhUV1xAVJVeq+ooVeR7JGelY/aCWsTNzHfeiWcZUg4dA1KhPLQt/tJ6QCqgvLBZ
         RuW16CVIQWqxGjQl8esPQI697lbyesNsGFGt0wGcvjxki8CTNmRyI2b7FJHYxLxjP+4g
         pynw==
X-Forwarded-Encrypted: i=1; AJvYcCWgwHgfnXmN2fqRsEUoh9r7fiMCW0VffBK8+y51A3winIIzU75nnhc/NvvEUAs/1Ix/1Ap+3CEouzo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzijD1LmKb2p2ne2zNak9hFNeZYcfZaqwuxA12vwp1v4j5DvVjb
	ppPwYLlyMJusAVVLtW5EgbQyx7FWycvbx4yM9UJCAbVwfhMh/GM0auaVT1tzGEiGPaE=
X-Gm-Gg: ASbGncsn87/t0ygeikZ6Os+NpfF5PIIgrkM4JjP0u7mro5OJ68o04FX9p4gD3wxaDcV
	ht7SiKGXpKAUtYgahSzICQOoV9plQs+jRhfHZQ/NMzWWnUHUBJaE4BUKrUwePPAGFOI0TylRvK1
	wiDt5u5YnQDufcgOFlwNlW2/8M34u9Kk+JxO6SsMttsKwKg/gunRGagtdi0n/VhrWD9KaZJxmdp
	j19mkcdyWoq2T68tPDKc/bfnpPT7Jq0JBEHDRV7hsENVBqR8RcBuqjfT8xMWzMim7KkWloxONtE
	VDp99sWceYP/V2bXfiYN0PsM5Uvjj9fiXPvvlGGH/EPwBrJdxp6mBTjz2Hgo4MsNmctnhjkun8I
	KfFtSCxmd1XliemHcFBBa+dXTomMUAnQAAE0apTJObeip3S2GDlPZomnhcVvyFdCrJJJxtx9Vpj
	u46nExkNU15ZfEstAS86ODfIvoXiDBGXFIMPMFFr6iq3T/YsmaNSW/z09/KbRn3kasapN8EcU6t
	d9uWFvF/tdW12d+5VM6YDZE2I7r+NAiCL2EuK4=
X-Google-Smtp-Source: AGHT+IEtMalfSOAIr1NsBaPxEfogybRIxrlhb1axhgWO5tk+V7D4OVBfJTNMM0XPbqodq5sQW6ca+g==
X-Received: by 2002:a17:907:7e98:b0:b70:7e10:4f4b with SMTP id a640c23a62f3a-b736780b437mr185354066b.18.1763101135435;
        Thu, 13 Nov 2025 22:18:55 -0800 (PST)
Message-ID: <6cc9926e-ec22-40b9-9711-e89f1d8f3087@suse.com>
Date: Fri, 14 Nov 2025 07:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] build: add new make pattern for making file from
 file.src
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251111161959.13667-1-jgross@suse.com>
 <20251111161959.13667-3-jgross@suse.com>
 <f5934f86-7a93-4184-a807-86fc6e18157a@suse.com>
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
In-Reply-To: <f5934f86-7a93-4184-a807-86fc6e18157a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jLBH0c0ITv9i070Ng0gPhyuJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jLBH0c0ITv9i070Ng0gPhyuJ
Content-Type: multipart/mixed; boundary="------------viw9sl4UctM09UfGymOaqikW";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <6cc9926e-ec22-40b9-9711-e89f1d8f3087@suse.com>
Subject: Re: [PATCH 2/5] build: add new make pattern for making file from
 file.src
References: <20251111161959.13667-1-jgross@suse.com>
 <20251111161959.13667-3-jgross@suse.com>
 <f5934f86-7a93-4184-a807-86fc6e18157a@suse.com>
In-Reply-To: <f5934f86-7a93-4184-a807-86fc6e18157a@suse.com>
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

--------------viw9sl4UctM09UfGymOaqikW
Content-Type: multipart/mixed; boundary="------------eIohzw3jWwxXnjfiYQzZNeOV"

--------------eIohzw3jWwxXnjfiYQzZNeOV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjUgMTc6NDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4xMS4yMDI1
IDE3OjE5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvQ29uZmlnLm1rDQo+PiAr
KysgYi9Db25maWcubWsNCj4+IEBAIC0xNTksNiArMTU5LDIwIEBAIGRlZmluZSBtb3ZlLWlm
LWNoYW5nZWQNCj4+ICAgCWlmICEgY21wIC1zICQoMSkgJCgyKTsgdGhlbiBtdiAtZiAkKDEp
ICQoMik7IGVsc2Ugcm0gLWYgJCgxKTsgZmkNCj4+ICAgZW5kZWYNCj4+ICAgDQo+PiArUEFU
SF9GSUxFUyA6PSBQYXRocw0KPj4gK0lOQ19GSUxFUyA6PSAkKGZvcmVhY2ggZiwgJChQQVRI
X0ZJTEVTKSwgJChYRU5fUk9PVCkvY29uZmlnLyQoZikubWspDQo+PiArDQo+PiAraW5jbHVk
ZSAkKElOQ19GSUxFUykNCj4+ICsNCj4+ICtCVUlMRF9NQUtFX1ZBUlMgOj0gJChmb3JlYWNo
IGYsICQoUEFUSF9GSUxFUyksICQoc2hlbGwgYXdrICckJDIgPT0gIjo9IiB7IHByaW50ICQk
MTsgfScgJChYRU5fUk9PVCkvY29uZmlnLyQoZikubWsuaW4pKQ0KPj4gKw0KPj4gK2RlZmlu
ZSBhcHBseS1idWlsZC12YXJzDQo+PiArCXNlZCAkKGZvcmVhY2ggdiwgJChCVUlMRF9NQUtF
X1ZBUlMpLCAtZSAncyNAJCh2KUAjJCgkKHYpKSNnJykgPCQ8ID4kQA0KPj4gK2VuZGVmDQo+
PiArDQo+PiArJTo6ICUuc3JjDQo+PiArCSQoYXBwbHktYnVpbGQtdmFycykNCj4gDQo+IEkn
bSBub3QgY29udmluY2VkIG9mIGhhdmluZyB0aGlzIGhlcmUsIHJhdGhlciB0aGFuIGluIGxl
c3MgY2VudHJhbCBwbGFjZXMgKHNheQ0KPiB1bmRlciB0b29scy8gYW5kIGRvY3MvKS4gSSdt
IGFsc28gbm90IHN1cmUgSSByZWFsbHkgdW5kZXJzdGFuZCB3aHkgaXQgbmVlZHMgdG8NCj4g
YmUgLnNyYyAtIGNhbid0IHdlIHN0aWNrIHRvIC5pbiwgZW51bWVyYXRpbmcgdGhlIHNwZWNp
ZmljIGZpbGVzIHRoYXQgd2FudA0KPiBnZW5lcmF0aW5nIHRoaXMgd2F5ICh0aHVzIGF2b2lk
aW5nIGFjY2lkZW50YWwgYXR0ZW1wdHMgdG8gcmUtZ2VuZXJhdGUgZmlsZXMNCj4gd2hpY2gg
bmVlZCBnZW5lcmF0aW5nIGEgZGlmZmVyZW50IHdheSk/DQoNCldpdGggZW51bWVyYXRpbmcg
dGhlIGZpbGVzIHRvIGdlbmVyYXRlIHdlIGNvdWxkIHByb2JhYmx5IHN0aWNrIHRvICouaW4u
DQoNCkknbSBmaW5lIHdpdGggbW92aW5nIHRoZSBydWxlIHRvIHRoZSB0b29scyBhbmQgZG9j
cyBtYWtlZmlsZXMsIGJ1dCBJJ2QNCmxpa2UgdG8ga2VlcCB0aGUgYXBwbHktYnVpbGQtdmFy
cyBkZWZpbml0aW9uIGhlcmUgaW4gb3JkZXIgdG8gYXZvaWQNCmR1cGxpY2F0aW5nIGl0Lg0K
DQo+IEFsc28gLSB3aHkgdGhlIGRvdWJsZSBjb2xvbiBoZXJlPw0KDQpJJ3ZlIGZvbGxvd2Vk
IHRoZSBhZHZpY2UgaW4gdGhlIG1ha2UgcmVmZXJlbmNlIGZvciAibWF0Y2gtYW55dGhpbmcg
cGF0dGVybg0KcnVsZXMiLg0KDQpXaXRoIGVudW1lcmF0aW5nIHRoZSBmaWxlcyB0byBnZW5l
cmF0ZSBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gYXZvaWQgdGhlDQpkb3VibGUgY29sb24u
DQoNCg0KSnVlcmdlbg0KDQo=
--------------eIohzw3jWwxXnjfiYQzZNeOV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------eIohzw3jWwxXnjfiYQzZNeOV--

--------------viw9sl4UctM09UfGymOaqikW--

--------------jLBH0c0ITv9i070Ng0gPhyuJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkWyc4FAwAAAAAACgkQsN6d1ii/Ey+I
Bgf8DBsutRRfrmMT9GlQf82F0R6WnIYZZtoQWQ822qcB8glMzd22HUv+Gy+xXDBZTYAszyllRCrG
hP8WGhBs0S1MVcgMj1O1MOXXi3+A4Gc/9nlC7O7Lm8lXLxRRcmZnig63YIPMep6ouPaLEvoaX9Ki
0OOxeYPW2Feq2kg+AiauhRkrKauI4nHE5yUCH6cUs+mDnqWH1kb24tnkO1KOKzPjo2lkWNzw4Gul
qEaVBuR3Pgb2JviRCQhj0k95IzRIT8kH49fuxmVgNyIOeZgQmayS47i5lo7SbRRukPHs7pVIe+As
HGMshPIKcTJmiABdIxVRQk/lpv7l5x+uKJTgCKHKdA==
=lT4i
-----END PGP SIGNATURE-----

--------------jLBH0c0ITv9i070Ng0gPhyuJ--

