Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BBCA5D6B0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 07:56:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909969.1316793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsG0b-0008VA-8d; Wed, 12 Mar 2025 06:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909969.1316793; Wed, 12 Mar 2025 06:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsG0b-0008RZ-4u; Wed, 12 Mar 2025 06:56:05 +0000
Received: by outflank-mailman (input) for mailman id 909969;
 Wed, 12 Mar 2025 06:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IlF8=V7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tsG0Z-0008BI-Eh
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 06:56:03 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 085cae59-ff0f-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 07:55:50 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so1094691966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 23:55:50 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2585d60f2sm882051866b.173.2025.03.11.23.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 23:55:49 -0700 (PDT)
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
X-Inumbo-ID: 085cae59-ff0f-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741762550; x=1742367350; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2DSP1M7gIiJZhrnNdOVaNRxNOrln/8Bu3afMS9PHvZ0=;
        b=K1uo1ht1oaxtlvJF5z1V2g0VI+sAfpKU/vc2sBGRN8a9maG28F6W2tph1+4y0LPE5D
         qAk3rBfI7FAr9K51qTlzA9RhX/MQwKdqWwyiDYsNvbSOQ9mPrubwUB8zgmu8FuukPJat
         3oY6ULzsA07p4lb0/IykF1RO3zgDnKWP7FBt2reopNWVlNxnwtRP7WYVivxXAhwdsbSB
         kHOoZIhZZ18/IRLRNDydjwvym12YiAs+Hz4PvsJVCn7bj15DH0zgMGp4Ntp6+/R4atzP
         SwZ+mo2wSCzg1/GXKiCoEtSpSVCRHUUI6UcyZQNHUv4Er5p9n1GFTRDLOUaze2EsNA9s
         /ePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741762550; x=1742367350;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2DSP1M7gIiJZhrnNdOVaNRxNOrln/8Bu3afMS9PHvZ0=;
        b=WbdLFTcu64bD+IJlpTPB9NHp0tOCyOn7wfg9xtBjAFpyf5Vs/HFkdmn7AFxL/Q+fIP
         LbYA6RKSU1cSHtHcr/vitabkqZeCQjWr+30x8QZOpKCwIUHbFvJgOpa8jMacDlfH0vo+
         KDvcX8sukv9H4jjA9pDm0cvYh5cw04PlkKLFWSScYQ/Tsvq4Fy768pCD9naj0IXumlwO
         w8F34dCCGB9WzOv2A1EhyQE8FXGeNeLwa/emLUp8DU9VrZePEco+LDFq/TiJF3qtvkH+
         OfDpee0un7OHTlwIIwNJcDBy7dMFi9GHf0K0KtzpOjqHJHPWXTBJDqIRFJ3ZEhp0TNOU
         u3PA==
X-Forwarded-Encrypted: i=1; AJvYcCXFGTu+3231hnGp7OSu3HtF7MHKKikrLcTnt6ELtzFamYshozQg0HD8fRfwYmgq9sxMpWuDStIVYcc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypMdj/NKY8CNfmKQ1oizQaXEnwrLKf+vQ61WF6umXy2cPlWeuU
	FcwJyaTEd+ZN5BvyfIhXP8ly7XmbZrZEZhYx2aaiuOhbGydjc2u4l/JYD2oefsU=
X-Gm-Gg: ASbGncsQd5rK6fDTricFnNEQKP6uOacz/fuohFZRBxoAy6XNozXfWLBdldSk9CFZ1Yh
	CCMa6/oOGsf8mpl5zO1TwX6ng1c2DsoWZ01ETz9FYw+6rCuwQ0uOsokIcMB/Mgxknh6I5jEvQVj
	q7JUbrGAiz4bD+5j8V5Sm0JIlMR58uEZuTsDcoBbMjJYD9Oux/EOoAfYCXJPxmZNkZ7gpbVveR3
	jhbZ0blwO9+MVDnKCRztcOh3u/fwWi8Gi4XpCxwIvL2iehVo42AE+czJRGnJ648jULIQSC5f5Mo
	f1m7armVse3gNuqJehYsOf2ssNxicpGGKeSNwUGD4kePfIq+VtB0aoQymB+7YLti8G5WHzf6HiO
	TVNC1bkJaCnokQHb/WYS260ULeL7wzIqAU5hFzCun/K9ocJ2lMYqRq5NXrr87QgMguPA=
X-Google-Smtp-Source: AGHT+IHeqNfIdUAY0aCNZ7uSc4X7kTf1fQPORXHd3+rurnFmt+4BmasD4a+VZ5rTcATeR6AfzFsl/g==
X-Received: by 2002:a17:906:f593:b0:ac1:db49:99a3 with SMTP id a640c23a62f3a-ac252fc6bdemr2589564266b.40.1741762549618;
        Tue, 11 Mar 2025 23:55:49 -0700 (PDT)
Message-ID: <656e5916-6a8f-4151-ba27-e8214db170e8@suse.com>
Date: Wed, 12 Mar 2025 07:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: specify numerical values of Xenstore commands
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250311073131.13539-1-jgross@suse.com>
 <ca2e86f3-68f6-4628-af98-c3ad0e82cc0f@xen.org>
 <eb440a72-5016-4eb3-928c-d441268b2189@suse.com>
 <2eeaa891-8a6b-4bc6-b544-e825a60e8887@xen.org>
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
In-Reply-To: <2eeaa891-8a6b-4bc6-b544-e825a60e8887@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EQOX0mKuIVmlwd5mdUaSXa3k"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EQOX0mKuIVmlwd5mdUaSXa3k
Content-Type: multipart/mixed; boundary="------------YnepqWPZZOk1HgO89uZ7bdPL";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <656e5916-6a8f-4151-ba27-e8214db170e8@suse.com>
Subject: Re: [PATCH v2] docs: specify numerical values of Xenstore commands
References: <20250311073131.13539-1-jgross@suse.com>
 <ca2e86f3-68f6-4628-af98-c3ad0e82cc0f@xen.org>
 <eb440a72-5016-4eb3-928c-d441268b2189@suse.com>
 <2eeaa891-8a6b-4bc6-b544-e825a60e8887@xen.org>
In-Reply-To: <2eeaa891-8a6b-4bc6-b544-e825a60e8887@xen.org>
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

--------------YnepqWPZZOk1HgO89uZ7bdPL
Content-Type: multipart/mixed; boundary="------------X9bXYj9IxSh7SwEVyS39Bzz0"

--------------X9bXYj9IxSh7SwEVyS39Bzz0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDMuMjUgMjA6MzYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDExLzAzLzIwMjUgMDk6NDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBP
biAxMS4wMy4yNSAxMDoyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAxMS8wMy8yMDI1IDA3OjMxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBJbiBkb2NzL21pc2MveGVuc3RvcmUudHh0IGFsbCBYZW5zdG9yZSBjb21tYW5kcyBh
cmUgc3BlY2lmaWVkLCBidXQNCj4+Pj4gdGhlIHNwZWNpZmljYXRpb25zIGxhY2sgdGhlIG51
bWVyaWNhbCB2YWx1ZXMgb2YgdGhlIGNvbW1hbmRzLg0KPj4+Pg0KPj4+PiBBZGQgYSB0YWJs
ZSB3aXRoIGFsbCBjb21tYW5kcywgdGhlaXIgdmFsdWVzLCBhbmQgYSBwb3RlbnRpYWwgcmVt
YXJrDQo+Pj4+IChlLmcuIHdoZXRoZXIgdGhlIGNvbW1hbmQgaXMgb3B0aW9uYWwpLg0KPj4+
Pg0KPj4+PiBSZXBvcnRlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+
Pj4+IC0tLQ0KPj4+PiBWMjoNCj4+Pj4gLSByZXBsYWNlICLFlSIgd2l0aCBwbGFpbiAiciIg
KEphbiBCZXVsaWNoKQ0KPj4+PiAtIHJlcGxhY2UgaGFyZCB0YWJzIHdpdGggYmxhbmtzIChK
YW4gQmV1bGljaCkNCj4+Pj4gLSBhbGxvdyBHRVRfRkVBVFVSRVMgYW5kIEdFVF9RVU9UQSBz
dXBwb3J0IHdpdGhvdXQgU0VUXyogKEphbiBCZXVsaWNoKQ0KPj4+PiAtLS0NCj4+Pj4gwqAg
ZG9jcy9taXNjL3hlbnN0b3JlLnR4dCB8IDU3ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNTcgaW5zZXJ0aW9u
cygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbnN0b3JlLnR4dCBi
L2RvY3MvbWlzYy94ZW5zdG9yZS50eHQNCj4+Pj4gaW5kZXggN2UxZjAzMTUyMC4uOGI0Yjc5
MGUxMSAxMDA2NDQNCj4+Pj4gLS0tIGEvZG9jcy9taXNjL3hlbnN0b3JlLnR4dA0KPj4+PiAr
KysgYi9kb2NzL21pc2MveGVuc3RvcmUudHh0DQo+Pj4+IEBAIC04Niw2ICs4Niw2MyBAQCBw
YXJ0cyBvZiB4ZW5zdG9yZSBpbmFjY2Vzc2libGUgdG8gc29tZSBjbGllbnRzLiBJbiBhbnkg
DQo+Pj4+IGNhc2UgcGFzc2luZw0KPj4+PiDCoCBidWxrIGRhdGEgdGhyb3VnaCB4ZW5zdG9y
ZSBpcyBub3QgcmVjb21tZW5kZWQgYXMgdGhlIHBlcmZvcm1hbmNlDQo+Pj4+IMKgIHByb3Bl
cnRpZXMgYXJlIHBvb3IuDQo+Pj4+ICstLS0tLS0tLS0tIERlZmluZWQgWGVuc3RvcmUgbWVz
c2FnZSB0eXBlcyAtLS0tLS0tLS0tDQo+Pj4+ICsNCj4+Pj4gK0JlbG93IGlzIGEgdGFibGUg
d2l0aCBhbGwgZGVmaW5lZCBYZW5zdG9yZSBtZXNzYWdlIHR5cGVzICh0eXBlIG5hbWUNCj4+
Pj4gK2FuZCBpdHMgYXNzb2NpYXRlZCBudW1lcmljYWwgdmFsdWUpLg0KPj4+PiArDQo+Pj4+
ICtTb21lIHR5cGVzIGFyZSBvcHRpb25hbCB0byBiZSBzdXBwb3J0ZWQgYnkgYSBzcGVjaWZp
YyBYZW5zdG9yZQ0KPj4+PiAraW1wbGVtZW50YXRpb24uwqAgSWYgYW4gb3B0aW9uYWwgdHlw
ZSBpcyBub3Qgc3VwcG9ydGVkIGJ5IGEgWGVuc3RvcmUNCj4+Pj4gK2ltcGxlbWVudGF0aW9u
LCBYZW4gdG9vbHMgd2lsbCBjb250aW51ZSB0byB3b3JrLCBtYXliZSB3aXRoIHNsaWdodGx5
DQo+Pj4+ICtyZWR1Y2VkIGZ1bmN0aW9uYWxpdHkuwqAgQSBtYW5kYXRvcnkgdHlwZSBub3Qg
YmVpbmcgc3VwcG9ydGVkIHdpbGwNCj4+Pj4gK3Jlc3VsdCBpbiBzZXZlcmVseSByZWR1Y2Vk
IGZ1bmN0aW9uYWxpdHksIGxpa2UgaW5hYmlsaXR5IHRvIGNyZWF0ZQ0KPj4+PiArZG9tYWlu
cy7CoCBJbiBjYXNlIGEgdHlwZSBpcyBvcHRpb25hbCwgdGhpcyBpcyBzdGF0ZWQgaW4gdGhl
IHRhYmxlIHdpdGgNCj4+Pj4gK3RoZSBsb3N0IGZ1bmN0aW9uYWxpdHkgaW4gY2FzZSBYZW5z
dG9yZSBkb2Vzbid0IHN1cHBvcnQgdGhhdCB0eXBlLg0KPj4+PiArDQo+Pj4+ICtYU19DT05U
Uk9MwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwwqDCoMKgIG9wdGlvbmFsDQo+Pj4+
ICvCoMKgwqAgSWYgbm90IHN1cHBvcnRlZCwgeGVuc3RvcmUtY29udHJvbCBjb21tYW5kIHdp
bGwgbm90IHdvcmsuDQo+Pj4NCj4+PiBBcmUgd2UgZG9jdW1lbnRpbmcgYW55d2hlcmUgaG93
IGEgdXNlciBjb3VsZCBmaWd1cmUgb3V0IGlmIHRoZSBjb21tYW5kIGlzIG5vdCANCj4+PiBz
dXBwb3J0ZWQ/IElzIGl0IGEgc3BlY2lmaWMgZXJyb3IgY29kZT8NCj4+DQo+PiBJIGNhbiBh
ZGQgdGhhdCBub3Qgc3VwcG9ydGVkIGNvbW1hbmRzIHdpbGwgcmV0dXJuICJFTk9TWVMiIGFz
IGFuIGVycm9yDQo+PiByZXNwb25zZS4NCj4gDQo+IFllcyBwbGVhc2UuDQo+IA0KPj4NCj4+
Pg0KPj4+PiArwqDCoMKgIFhTX0RFQlVHIGlzIGEgZGVwcmVjYXRlZCBhbGlhcyBvZiBYU19D
T05UUk9MLg0KPj4+IMKgPiArWFNfRElSRUNUT1JZwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDE+ICtYU19SRUFEwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyDQo+Pj4+
ICtYU19HRVRfUEVSTVPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMw0KPj4+PiArWFNfV0FU
Q0jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA0DQo+Pj4+ICtYU19VTldBVENI
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA1DQo+Pj4+ICtYU19UUkFOU0FDVElPTl9T
VEFSVMKgwqDCoMKgIDYNCj4+Pj4gK1hTX1RSQU5TQUNUSU9OX0VORMKgwqDCoMKgwqDCoCA3
DQo+Pj4+ICtYU19JTlRST0RVQ0XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOA0KPj4+PiAr
WFNfUkVMRUFTRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOQ0KPj4+PiArWFNfR0VU
X0RPTUFJTl9QQVRIwqDCoMKgwqDCoCAxMA0KPj4+PiArWFNfV1JJVEXCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgMTENCj4+Pj4gK1hTX01LRElSwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDEyDQo+Pj4+ICtYU19STcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAxMw0KPj4+PiArWFNfU0VUX1BFUk1TwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAxNA0KPj4+PiArWFNfV0FUQ0hfRVZFTlTCoMKgwqDCoMKgwqDCoMKgwqAgMTUNCj4+Pj4g
K8KgwqDCoCBOb3QgdmFsaWQgaW4gY2xpZW50IHNlbnQgbWVzc2FnZXMuDQo+Pj4+ICvCoMKg
wqAgT25seSB2YWxpZCBpbiBYZW5zdG9yZSByZXBsaWVzLg0KPj4+PiArWFNfRVJST1LCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTYNCj4+Pj4gK8KgwqDCoCBOb3QgdmFsaWQg
aW4gY2xpZW50IHNlbnQgbWVzc2FnZXMuDQo+Pj4+ICvCoMKgwqAgT25seSB2YWxpZCBpbiBY
ZW5zdG9yZSByZXBsaWVzLg0KPj4+PiArWFNfSVNfRE9NQUlOX0lOVFJPRFVDRUQgMTcNCj4+
Pj4gK1hTX1JFU1VNRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTgNCj4+Pj4gK1hT
X1NFVF9UQVJHRVTCoMKgwqDCoMKgwqDCoMKgwqDCoCAxOQ0KPj4+PiArWFNfUkVTVFJJQ1TC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjDCoMKgwqAgbm8gbG9uZ2VyIHN1cHBvcnRlZA0K
Pj4+PiArwqDCoMKgIFhTX1JFU1RSSUNUIGhhcyBiZWVuIHJlbW92ZWQsIHRoZSB0eXBlIHZh
bHVlIDIwIGlzIGludmFsaWQuDQo+Pj4+ICtYU19SRVNFVF9XQVRDSEVTwqDCoMKgwqDCoMKg
wqAgMjENCj4+Pj4gK1hTX0RJUkVDVE9SWV9QQVJUwqDCoMKgwqDCoMKgIDIywqDCoMKgIG9w
dGlvbmFsDQo+Pj4+ICvCoMKgwqAgSWYgbm90IHN1cHBvcnRlZCwgdGhlIG91dHB1dCBvZiB4
ZW5zdG9yZS1scyBtaWdodCBiZSBpbmNvbXBsZXRlDQo+Pj4+ICvCoMKgwqAgd2l0aCBtb3Jl
IHRoYW4gY2EuIDEwMDAgZG9tYWlucyBhY3RpdmUuDQo+Pj4NCj4+PiBXaHkgYXJlIHdlIG1h
a2luZyB0aGlzIHNwZWNpZmljIHRvIG51bWJlciBvZiBkb21haW5zPyBXb3VsZG4ndCB0aGUg
cHJvYmxlbSBiZSANCj4+PiB0aGUgc2FtZSBpZiB5b3UgaGF2ZSAxMDAwIG5vZGUgd2l0aGlu
IGEgcGFyZW50IG5vZGU/DQo+Pg0KPj4gTGV0IG1lIHJlaXRlcmF0ZSB0aGUgYW5zd2VyIEkg
Z2F2ZSB0byBKYW4gd2hlbiBoZSBhc2tlZDoNCj4gID4gPsKgIMKgIEFuZCBlbHNld2hlcmUg
dGhlcmUgY2FuJ3QgYmUgdmVyeSBtYW55IG5vZGVzIHJlc3VsdGluZyBpbiBhIHNpbWlsYXIN
Cj4+IMKgwqAgc2l0dWF0aW9uPw0KPiAgPiA+IE5vdCB3aXRob3V0IHNvbWVvbmUgdHJ5aW5n
IHRvIGZvcmNlIHRoaXMgYnkgd2lsbCAob25seSBwb3NzaWJsZSBieSBhDQo+PiByb290IHVz
ZXIgb2YgZG9tMCwgZS5nLiB2aWEgY3JlYXRpbmcgbG90cyBvZiBub2RlcyBpbiB0aGUgc2Ft
ZSBkaXJlY3RvcnkNCj4+IHZpYSAieGVuc3RvcmUtd3JpdGUiKS4NCj4gDQo+IFRoYXQncyBh
c3N1bWluZyB0aGUgYWRtaW4gaGFzIG5vdCBjaGFuZ2VkIHRoZSBkZWZhdWx0IHF1b3Rhcywg
cmlnaHQ/DQoNCk5vLCBJIGRvbid0IHRoaW5rIHRoaXMgaXMgcmVsYXRlZCB0byBxdW90YXMu
DQoNClRoaXMgaXMgcHVyZWx5IHJlbGF0ZWQgdG8gdGhlIGZhY3QgdGhhdCBYU19ESVJFQ1RP
UlkgaXMgbm90IGNhcGFibGUgdG8NCnJldHVybiBhIGZ1bGwgbGlzdCBvZiB0aGUgbm9kZSdz
IGNoaWxkcmVuLCBhcyB0aGlzIGxpc3Qgd291bGQgZXhjZWVkDQpYRU5TVE9SRV9QQVlMT0FE
X01BWCwgd2hpY2ggaXMgYSBoYXJkIHdpcmVkIHBhcnQgb2YgdGhlIHByb3RvY29sLg0KDQo+
IA0KPj4NCj4+IEhhdmluZyBsb3RzIG9mIGRvbWFpbnMgaXMgYW4gImVhc3kiIHdheSB0byBj
cmVhdGUgdGhpcyBzY2VuYXJpbyB2aWENCj4+IHBlcmZlY3RseSB2YWxpZCBhbmQgc2Vuc2li
bGUgb3BlcmF0aW9ucy4NCj4gID4gPg0KPj4gSSBjYW4gcmVwaHJhc2UgdGhlIHJlbWFyayBs
aWtlIHRoaXM6DQo+Pg0KPj4gwqDCoMKgwqAgSWYgbm90IHN1cHBvcnRlZCwgdGhlIG91dHB1
dCBvZiB4ZW5zdG9yZS1scyBtaWdodCBiZSBpbmNvbXBsZXRlDQo+PiDCoMKgwqDCoCB3aXRo
IGEgbm9kZSdzIHN1Yi1ub2RlIGxpc3QgZXhjZWVkaW5nIHRoZSBtYXhpbXVtIHBheWxvYWQg
c2l6ZQ0KPj4gwqDCoMKgwqAgKGUuZy4gdGhlICIvbG9jYWwvZG9tYWluIiBub2RlIHdpdGgg
bW9yZSB0aGFuIGNhLiAxMDAwIGRvbWFpbnMNCj4+IMKgwqDCoMKgIGFjdGl2ZSkuDQo+IA0K
PiANCj4gVGhhdCB3b3VsZCBiZSBiZXR0ZXIuIEl0IGRvZXNuJ3QgdGllIHRoZSBwcm9ibGVt
IHRvIHRoZSBkZWZhdWx0IHF1b3Rhcy4NCg0KSSdsbCB1c2UgdGhhdCB0aGVuLg0KDQoNCkp1
ZXJnZW4NCg==
--------------X9bXYj9IxSh7SwEVyS39Bzz0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------X9bXYj9IxSh7SwEVyS39Bzz0--

--------------YnepqWPZZOk1HgO89uZ7bdPL--

--------------EQOX0mKuIVmlwd5mdUaSXa3k
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfRL/QFAwAAAAAACgkQsN6d1ii/Ey9a
kwf/QL2oPejmhj3A8I2pvzh5oWYHPP100PDmA+gCBRxHatx5FVl2WQD3WXQrNmGEZ3yWUu4BCpbg
9xZyAbLmeqOJD+KnBEGY5utPx0CBPpyFa9w5Jm0AwYPQaC8CRouBHC8rMqqUezap8JVxCMLfRKPO
0fz1f593DCFQftJCsVFZGGNXYC5icoGTJHUyWla73N7Ko+caydc10kIqZvSn4GULzkYIQftT/CPy
1HaFhh980t/iSwZfLYxGzgzCQJDEZ/azUzq+OhG6vnG4I6P/y0YUfIsES7UuXll1y5Xixf1WBeBP
mbQmfbVLM90FHN7l6FTf3Lg7PwCKlvjp5HO4k7MHnA==
=HkDm
-----END PGP SIGNATURE-----

--------------EQOX0mKuIVmlwd5mdUaSXa3k--

