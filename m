Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 379429F3214
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 14:58:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858073.1270321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNBbR-0003y1-Vw; Mon, 16 Dec 2024 13:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858073.1270321; Mon, 16 Dec 2024 13:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNBbR-0003wY-TK; Mon, 16 Dec 2024 13:57:41 +0000
Received: by outflank-mailman (input) for mailman id 858073;
 Mon, 16 Dec 2024 13:57:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hXi=TJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tNBbQ-0003wJ-V3
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 13:57:40 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5a55e1d-bbb5-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 14:57:38 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6274015so7217725a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 05:57:38 -0800 (PST)
Received: from ?IPV6:2003:e5:8725:5e00:fa69:c5cb:46d:3e5b?
 (p200300e587255e00fa69c5cb046d3e5b.dip0.t-ipconnect.de.
 [2003:e5:8725:5e00:fa69:c5cb:46d:3e5b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652ae1205sm3210615a12.44.2024.12.16.05.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 05:57:37 -0800 (PST)
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
X-Inumbo-ID: b5a55e1d-bbb5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734357458; x=1734962258; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I6mLb53qXQ+6q8Wws9RLDGZ6bIRw/j/samqfJuSBVMo=;
        b=F7caVi6FgrkatBViEGhnFtVoIhktglKKtEYlEyqXsp5XhlChVXGgMgKo1WGtrycvnr
         0LRzdCjeivMcmmASgMGTR6CrnxAB590y21u9NBz98r123m4HN/TG4nsLx5PJPnkj3sSe
         y2FeObuQzJc5ItKczlG6su8JuNF7FdTPqqjFMaSoYWZOdIeshXjHSdc7wB0tSMXSvjpR
         RCKbw6uYd1zDLe810bZTcLiYOmJfEr78rwq7Q9GmO56HY3rqL+I2GBTqb5wPHtGm8XjQ
         urwSHHMBiJB5UhnAyeKk3Mdc7ff0Vymp/Bhc8xuzAfu1V8T18zAaNFibBza5VjV4jt0w
         Nycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734357458; x=1734962258;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6mLb53qXQ+6q8Wws9RLDGZ6bIRw/j/samqfJuSBVMo=;
        b=uxdLsDx+sz0eSYC6wwURwN91icRDGpuo3bexorsyK0Fh9y3qHzMQ0p7QJ1tLLnFmdB
         tK/9xSh2UmO9bfwToCj/ZzqjNR37Uhk5N9znifPyA3s55f2hi/RBwns4S1mjEVPExpdW
         7v4Y9iGDNUKB/TpcGPR98WeB2zCmTC397LbNdvnpjGVYfbM406mhEVXorJAaBh2nEzZ8
         nVvsNE9Nrr1NgmEnQAlHKnT2As9T9so0I8lhXsYKUGVFi9RogNiWNaTObClOFWroPJ69
         zvMsNWPs8NrkxQAtzadvxj7fPDP9jhmBU1nqEKd3Jhho9OpE3f0mBe25Z4Uie7vcSl56
         jGxA==
X-Forwarded-Encrypted: i=1; AJvYcCUCMdk0t4cQchIsbRFm8ndjCDpcHlOCVJ8gPpbauxYo1TTEiUjj/yUwXjGeKREbHueXXwmff2Ya9dc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhRnDvoJXDHY3TIQum8h8+E/ID93z+fayILc3jANTHk6benlxC
	Ca6zOA1SJK2p/32GgWIDxaKAfRK63fVlX4fYayMuCW50MmuUInM7ak3I276wNy4=
X-Gm-Gg: ASbGncs+v5kV9UOawCF+6wxjw2iHTW/tmKqWTX58eHnVtlB+sbTjkaRusp6b34KZDwj
	W75JegDmBamptGCNtJlzq2ujBDTXDgvyTGSwuIznKgSL+otKkcj8kPKHl6SnB83EG2gVU3/ZLQF
	DgDpUcnHD5u/3lo24g0cRzOdeMtGaeqtmY0+yJd6LFEFbUSuvctn3VDeoVz5LteMT4CLpKiAsIH
	KupVDIDrFZGg4S6U8JG5IblHT3S4JxkrC/oAiQIfzsXXQUWY76r/22rQai6PkYrMY8ftoqJe/e7
	v0edwd1i1FoIzQ+OhJAhPIrE+leLAxip6QD+XWU8EHm0pN4qWh/H0U/Av+xQDXi3BsteyAfhV6S
	/rvM=
X-Google-Smtp-Source: AGHT+IH7Wb1odvwKa50nm+iSwmMGFmyrwdhsYw89QnviTrN0/Zp7bEUFgUKzw+NgRcxBMUwyQ5TttA==
X-Received: by 2002:a05:6402:354d:b0:5cf:ab23:1f07 with SMTP id 4fb4d7f45d1cf-5d63c320f8fmr10455703a12.15.1734357457816;
        Mon, 16 Dec 2024 05:57:37 -0800 (PST)
Message-ID: <adae16db-f463-4d9b-8f3a-73c81fba1148@suse.com>
Date: Mon, 16 Dec 2024 14:57:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] xen: add new domctl get_changed_domain
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241213162421.16782-1-jgross@suse.com>
 <20241213162421.16782-6-jgross@suse.com>
 <f5371446-98e5-42ff-aa8d-0a7252e89f1f@suse.com>
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
In-Reply-To: <f5371446-98e5-42ff-aa8d-0a7252e89f1f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WGwiqnZwB75dvyYz0jf1cBnY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WGwiqnZwB75dvyYz0jf1cBnY
Content-Type: multipart/mixed; boundary="------------v67u5DqhRdNvFXAGOgeLhb9N";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <adae16db-f463-4d9b-8f3a-73c81fba1148@suse.com>
Subject: Re: [PATCH v3 5/7] xen: add new domctl get_changed_domain
References: <20241213162421.16782-1-jgross@suse.com>
 <20241213162421.16782-6-jgross@suse.com>
 <f5371446-98e5-42ff-aa8d-0a7252e89f1f@suse.com>
In-Reply-To: <f5371446-98e5-42ff-aa8d-0a7252e89f1f@suse.com>
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

--------------v67u5DqhRdNvFXAGOgeLhb9N
Content-Type: multipart/mixed; boundary="------------y6WUQ276IJkKlliwTc0kZT0u"

--------------y6WUQ276IJkKlliwTc0kZT0u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMTIuMjQgMTE6NDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMy4xMi4yMDI0
IDE3OjI0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2NvbW1vbi9kb21h
aW4uYw0KPj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYw0KPj4gQEAgLTE5Myw2ICsxOTMs
NTcgQEAgc3RhdGljIHZvaWQgZG9tYWluX2NoYW5nZWRfc3RhdGUoY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCkNCj4+ICAgICAgIHNwaW5fdW5sb2NrKCZkb21fc3RhdGVfY2hhbmdlZF9sb2Nr
KTsNCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0aWMgdm9pZCBzZXRfZG9tYWluX3N0YXRlX2lu
Zm8oc3RydWN0IHhlbl9kb21jdGxfZ2V0X2RvbWFpbl9zdGF0ZSAqaW5mbywNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkN
Cj4+ICt7DQo+PiArICAgIGluZm8tPnN0YXRlID0gWEVOX0RPTUNUTF9HRVRET01TVEFURV9T
VEFURV9FWElTVDsNCj4+ICsgICAgaWYgKCBkLT5pc19zaHV0X2Rvd24gKQ0KPj4gKyAgICAg
ICAgaW5mby0+c3RhdGUgfD0gWEVOX0RPTUNUTF9HRVRET01TVEFURV9TVEFURV9TSFVURE9X
TjsNCj4+ICsgICAgaWYgKCBkLT5pc19keWluZyA9PSBET01EWUlOR19keWluZyApDQo+PiAr
ICAgICAgICBpbmZvLT5zdGF0ZSB8PSBYRU5fRE9NQ1RMX0dFVERPTVNUQVRFX1NUQVRFX0RZ
SU5HOw0KPj4gKyAgICBpZiAoIGQtPmlzX2R5aW5nID09IERPTURZSU5HX2RlYWQgKQ0KPj4g
KyAgICAgICAgaW5mby0+c3RhdGUgfD0gWEVOX0RPTUNUTF9HRVRET01TVEFURV9TVEFURV9E
RUFEOw0KPj4gKyAgICBpbmZvLT51bmlxdWVfaWQgPSBkLT51bmlxdWVfaWQ7DQo+PiArfQ0K
Pj4gKw0KPj4gK2ludCBnZXRfZG9tYWluX3N0YXRlKHN0cnVjdCB4ZW5fZG9tY3RsX2dldF9k
b21haW5fc3RhdGUgKmluZm8sIHN0cnVjdCBkb21haW4gKmQsDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgZG9taWRfdCAqZG9taWQpDQo+PiArew0KPj4gKyAgICB1bnNpZ25lZCBpbnQg
ZG9tOw0KPj4gKw0KPj4gKyAgICBpZiAoIGluZm8tPnBhZDAgfHwgaW5mby0+cGFkMSApDQo+
PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICsNCj4+ICsgICAgaWYgKCBkICkNCj4+
ICsgICAgew0KPj4gKyAgICAgICAgc2V0X2RvbWFpbl9zdGF0ZV9pbmZvKGluZm8sIGQpOw0K
Pj4gKw0KPj4gKyAgICAgICAgcmV0dXJuIDA7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAg
d2hpbGUgKCAoZG9tID0gZmluZF9maXJzdF9iaXQoZG9tX3N0YXRlX2NoYW5nZWQsIERPTUlE
X01BU0sgKyAxKSkgPA0KPj4gKyAgICAgICAgICAgIERPTUlEX0ZJUlNUX1JFU0VSVkVEICkN
Cj4+ICsgICAgew0KPj4gKyAgICAgICAgaWYgKCB0ZXN0X2FuZF9jbGVhcl9iaXQoZG9tLCBk
b21fc3RhdGVfY2hhbmdlZCkgKQ0KPiANCj4gRm9yIHRoZXNlIHR3byBhY2Nlc3NlcyB0byBk
b21fc3RhdGVfY2hhbmdlZCBkb24ndCB5b3UgbmVlZCB0byBob2xkIHRoZQ0KPiBsb2NrIHBh
dGNoIDQgaW50cm9kdWNlcz8gQWxzbyBkaWRuJ3QgeW91IHNheSB5b3UnZCBjb25zdHJhaW4g
dGhlIG5ldw0KPiBzdWItb3AgdG8gdGhlIHNvbGUgZG9tYWluIGhhdmluZyBWSVJRX0RPTV9F
WEVDIGJvdW5kICh3aGljaCwgZnRhb2QsDQo+IGlzbid0IGVub3VnaCB0byBlbGltaW5hdGUg
dGhlIHJhY2UpPw0KDQpPaCwgaW5kZWVkLiBTb3JyeSBmb3IgaGF2aW5nIG1pc3NlZCBib3Ro
IGFzcGVjdHMuDQoNCj4gDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgKmRvbWlk
ID0gZG9tOw0KPj4gKw0KPj4gKyAgICAgICAgICAgIGQgPSByY3VfbG9ja19kb21haW5fYnlf
aWQoZG9tKTsNCj4+ICsNCj4+ICsgICAgICAgICAgICBpZiAoIGQgKQ0KPj4gKyAgICAgICAg
ICAgIHsNCj4+ICsgICAgICAgICAgICAgICAgc2V0X2RvbWFpbl9zdGF0ZV9pbmZvKGluZm8s
IGQpOw0KPj4gKw0KPj4gKyAgICAgICAgICAgICAgICByY3VfdW5sb2NrX2RvbWFpbihkKTsN
Cj4+ICsgICAgICAgICAgICB9DQo+IA0KPiBPaCwgb24gdGhlIGltcGxpY2l0ICJlbHNlIiBp
cyB3aGVyZSB0aGUgb3JpZ2luYWwgbWVtc2V0KCkgd291bGQgY29tZSBpbnRvDQo+IHBsYXk6
IFlvdSB3YW50IHRvIG1ha2Ugc3VyZSBhdCBsZWFzdCAtPnN0YXRlLCBidXQgcGVyaGFwcyBh
bHNvIC0+dW5pcXVlX2lkDQo+IGFyZSBjbGVhcmVkIChyYXRoZXIgdGhhbiBkZW1hbmRpbmcg
dGhlIGNhbGxlciB0byBjbGVhciB0aGVtIGFoZWFkIG9mIG1ha2luZw0KPiB0aGUgY2FsbCku
DQoNClJpZ2h0Lg0KDQoNCkp1ZXJnZW4NCg==
--------------y6WUQ276IJkKlliwTc0kZT0u
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------y6WUQ276IJkKlliwTc0kZT0u--

--------------v67u5DqhRdNvFXAGOgeLhb9N--

--------------WGwiqnZwB75dvyYz0jf1cBnY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdgMdAFAwAAAAAACgkQsN6d1ii/Ey9l
dAgAlBvgJwJUYV7DmtBW5murzbEyWslTYhHn3OJTqSSb6gfDjohVvldZ1h7x1U76rSdoIr8BB85M
rL7fpXbvE13VSgz5pvPIQt2ge6sV7gHKfDQneD+87VUS6Mzqx7wtqz/Uozb7XJ+8FXTJNncsSbQZ
kienNgUKI6vdIoSb/yQLTpPzCTgWbANApaLSz1n0/Gsx2uiNfLx1o6/+4YbvtGcm4GG0Je6+RYTE
d+O0hQ/ZAQJi5QYtttPP/Eb3NUhvOLI/GqZV5JNAtS8ZDHMJhAtUoebQktkJCDMlPuDw2+FXSVIy
qRVM2qKPBhbqqJFhjX0OeBOp3HXr57kjkC40VVQBzw==
=FZsU
-----END PGP SIGNATURE-----

--------------WGwiqnZwB75dvyYz0jf1cBnY--

