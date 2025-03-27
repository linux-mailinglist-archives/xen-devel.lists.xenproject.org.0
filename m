Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F65DA7368E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 17:17:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929730.1332481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpuX-0002r0-GQ; Thu, 27 Mar 2025 16:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929730.1332481; Thu, 27 Mar 2025 16:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpuX-0002oU-Dl; Thu, 27 Mar 2025 16:16:53 +0000
Received: by outflank-mailman (input) for mailman id 929730;
 Thu, 27 Mar 2025 16:16:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zm5l=WO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1txpuV-0002oO-Rl
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 16:16:51 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e34490a9-0b26-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 17:16:50 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4394a823036so12553115e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 09:16:50 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e6a532sm42418235e9.9.2025.03.27.09.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 09:16:48 -0700 (PDT)
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
X-Inumbo-ID: e34490a9-0b26-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743092209; x=1743697009; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IgBBoQB+quUX2SrmOXl6uu4eIvNYFTprpYaPvpOUfBM=;
        b=c5Xf7szn9IADjzCjJ62Wb+hfOb/1iY2U61fBnOZqrCR0OuYANTJzQLEaQrhkUmnPH0
         /BaBrqBf1IZTjzhzVMRRbNWN/dOhjkdNbTC7VndWaVVIBi9FuJJF2R42TxTJVL5ylm1x
         L/NhsX+mCS1CMJlyt16bHAErfoohsKqbDjHtzW/EdTjJxFzbvsWvEHPHVOG7ZsXVEkJ7
         nrZk/3uZpPNcdNixEMWDP5an8FBg9/s5FOUQW5XhDrYNm3E4jwf1DLxiG/q08IFRrh4A
         QXJj3GzFqZ3DKBrqtvI/7c3rzeHXgMEN5VJ933oewhxtvoZ5t9jFkdpxdGz9hqRwlTSX
         LDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092209; x=1743697009;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IgBBoQB+quUX2SrmOXl6uu4eIvNYFTprpYaPvpOUfBM=;
        b=qLA9BOlYjAS0zgtC5+S2ZXCLhVqz2ePVVslllH82rvWx9h8Xx5Y7aD6cEO75BNTJke
         MkW6fS0ik+hnC8JGYdHkjWvMrK0pA6h56B4889KJJMkH8qaUesFZd024kPPCCjoOYJxi
         5/NnRDmS17eHEC/o86Zk1EmzifsYmB4hXZMxW2B2NuE+Opm1elbXQZfxshPggI8ZAlq7
         6Q+PH2H1zPBdrMenSa8m6pj5SGL/FDfCPwVLTbtPfz+c9gqC3q/ew6Pg3BO6lwbTWzBf
         0RTYd+3hK0WZZyf4xJhvJWoNSFMiLrUX3OTKHi8GCL3PeyoSRnfQKkQc1KyMEr+RGjtB
         UIAg==
X-Forwarded-Encrypted: i=1; AJvYcCVN02rg9fH5DM0ynqvJYo8KO/i8HWz7v0fgCF6KorqX+19XPDoloIyAMjvAAspq3RKfXdpdcaojMTk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMgU2zu2Y+ptMyorlIcrUZ89MVEgoD6GtLQvlayrt0FEMmFNXG
	XuxbYNPmoia8PuAgu+mzlgFYgakbhhmePgV2ym1RGzO1fHJ3CJg1riauUecGJN8=
X-Gm-Gg: ASbGnctZHTK13Ej3CwZJt1hEGWwRMf6wQo4TDezG74+mtdjbi+H1+JSRrQk8Z5/gNb1
	dRqQHXqYDWDiYH3dsayQyBIC+vD2tvZ93KKluYnf0q82/V63R4UUpIzBN3EHveyIVH2atHjWnMn
	Aw4bF9tNNUnidBnhbAu9lNJnPUGzo+O/rPUCmOITcrr5sUHfedq9qVxBZbzdYx715tBxUUNCpN5
	cGpHeMj0jC1Hybj+PTiMfS6qIf0MLl8IWhSck9aWDb8/QOj0i8cAxywyRlpXd7Se3R2M5vprZ6K
	DlfMtACyBVmtRaNguYHgfOS3Zu8vom+CFbbJPZQMaME9e4FnA+IuFJ5tWhRdrCpoN5oD76bL4GC
	JLw/xKrTf2xAE30cnJMDLiNn2b9CLkqPHG4MjiWIWJ989gm8u9GMG3ngf18zCIQIY0I4jiA==
X-Google-Smtp-Source: AGHT+IGjyYDSt2rqgUaJ5mOAdcH03yCaPc44BFfuIXWlzw2pZ0CnTnkUcqUhg+AnZeDZ+bl99Tr88g==
X-Received: by 2002:a05:600c:4fd0:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-43d84fb1f59mr43440385e9.13.1743092209142;
        Thu, 27 Mar 2025 09:16:49 -0700 (PDT)
Message-ID: <bcf9b121-40a9-4c77-8e6f-34366a86a572@suse.com>
Date: Thu, 27 Mar 2025 17:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] SUPPORT.md: make Linux based stubdom fully supported
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250326160442.19706-1-jgross@suse.com>
 <20250326160442.19706-2-jgross@suse.com>
 <0db5c039-f379-4393-b00f-c4cd44188a9b@suse.com>
 <16266da1-f164-41a4-a569-b500998b4b64@suse.com>
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
In-Reply-To: <16266da1-f164-41a4-a569-b500998b4b64@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cH5g7Bzy5pCU4rcu0yLC8HVc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cH5g7Bzy5pCU4rcu0yLC8HVc
Content-Type: multipart/mixed; boundary="------------4mOyTSePYD7PBNBKlLXah02W";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <bcf9b121-40a9-4c77-8e6f-34366a86a572@suse.com>
Subject: Re: [PATCH 1/6] SUPPORT.md: make Linux based stubdom fully supported
References: <20250326160442.19706-1-jgross@suse.com>
 <20250326160442.19706-2-jgross@suse.com>
 <0db5c039-f379-4393-b00f-c4cd44188a9b@suse.com>
 <16266da1-f164-41a4-a569-b500998b4b64@suse.com>
In-Reply-To: <16266da1-f164-41a4-a569-b500998b4b64@suse.com>
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

--------------4mOyTSePYD7PBNBKlLXah02W
Content-Type: multipart/mixed; boundary="------------aWuBchtelEHDOh4VjTTny3Sk"

--------------aWuBchtelEHDOh4VjTTny3Sk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDMuMjUgMTY6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNy4wMy4yMDI1
IDE2OjI1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjYuMDMuMjUgMTc6MDQsIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gQWxsIHBhdGNoZXMgbmVlZGVkIGZvciBydW5uaW5n
IHdpdGggYSBMaW51eCBzdHViZG9tIGRldmljZSBtb2RlbCBhcmUNCj4+PiBpbiB0aGUgdHJl
ZSBhbmQgUXViZXNPUyBpcyB1c2luZyBhbmQgdGVzdGluZyBMaW51eCBzdHViZG9tcyBub3dh
ZGF5cy4NCj4+Pg0KPj4+IFN3aXRjaCBzdXBwb3J0IGZyb20gIlRlY2ggUHJldmlldyIgdG8g
IlN1cHBvcnRlZCIuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+Pj4gLS0tDQo+Pj4gICAgQ0hBTkdFTE9HLm1kIHwgMSArDQo+
Pj4gICAgU1VQUE9SVC5tZCAgIHwgMiArLQ0KPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvQ0hB
TkdFTE9HLm1kIGIvQ0hBTkdFTE9HLm1kDQo+Pj4gaW5kZXggOWE1OTE5NTg1ZC4uYjAzZTJj
NzNkNyAxMDA2NDQNCj4+PiAtLS0gYS9DSEFOR0VMT0cubWQNCj4+PiArKysgYi9DSEFOR0VM
T0cubWQNCj4+PiBAQCAtNyw2ICs3LDcgQEAgVGhlIGZvcm1hdCBpcyBiYXNlZCBvbiBbS2Vl
cCBhIENoYW5nZWxvZ10oaHR0cHM6Ly9rZWVwYWNoYW5nZWxvZy5jb20vZW4vMS4wLjAvKQ0K
Pj4+ICAgICMjIFs0LjIxLjAgVU5SRUxFQVNFRF0oaHR0cHM6Ly94ZW5iaXRzLnhlbnByb2pl
Y3Qub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9c2hvcnRsb2c7aD1zdGFnaW5nKSAtIFRCRA0K
Pj4+ICAgIA0KPj4+ICAgICMjIyBDaGFuZ2VkDQo+Pj4gKyAtIExpbnV4IGJhc2VkIGRldmlj
ZSBtb2RlbCBzdHViZG9tYWlucyBhcmUgbm93IGZ1bGx5IHN1cHBvcnRlZC4NCj4+PiAgICAN
Cj4+PiAgICAjIyMgQWRkZWQNCj4+PiAgICAgLSBPbiB4ODY6DQo+Pj4gZGlmZiAtLWdpdCBh
L1NVUFBPUlQubWQgYi9TVVBQT1JULm1kDQo+Pj4gaW5kZXggOTFjYjZmOGVkMi4uZWQ0NDEy
ZjBhZiAxMDA2NDQNCj4+PiAtLS0gYS9TVVBQT1JULm1kDQo+Pj4gKysrIGIvU1VQUE9SVC5t
ZA0KPj4+IEBAIC0yNjAsNyArMjYwLDcgQEAgR28gKGdvbGFuZykgYmluZGluZ3MgZm9yIGxp
YnhsDQo+Pj4gICAgDQo+Pj4gICAgU3VwcG9ydCBmb3IgcnVubmluZyBxZW11LXhlbiBkZXZp
Y2UgbW9kZWwgaW4gYSBsaW51eCBzdHViZG9tYWluLg0KPj4+ICAgIA0KPj4+IC0gICAgU3Rh
dHVzOiBUZWNoIFByZXZpZXcNCj4+PiArICAgIFN0YXR1czogU3VwcG9ydGVkDQo+Pg0KPj4g
VGhlIHN0YXR1cyBjaGFuZ2Ugd2FzIGRpc2N1c3NlZCBpbiB0aGUgc2VjdXJpdHkgdGVhbS4g
VGhlIHN1Z2dlc3Rpb24gd2FzDQo+PiB0aGF0IHRoZSBuZXcgc3VwcG9ydCBzdGF0ZSBzaG91
bGQgYmUgIlN1cHBvcnRlZCwgd2l0aCBjYXZlYXRzIiwgY2xhcmlmeWluZw0KPj4gdGhhdCBh
bnkgaXNzdWUgaW4gdGhlIHN0dWJkb21haW4gYWZmZWN0aW5nIG9ubHkgdGhlIGd1ZXN0IGl0
IGlzIHNlcnZpY2luZw0KPj4gd291bGQgbm90IGJlIHJlZ3JhZGVkIHRvIGJlIGEgc2VjdXJp
dHkgaXNzdWUuDQo+IA0KPiBNaW5kIG1ha2luZyB0aGlzIGEgdGlueSBiaXQgbW9yZSBzdHJp
Y3QsIGJ5IHNheWluZyAiYWZmZWN0aW5nIG9ubHkgdGhlIGd1ZXN0DQo+IGl0IGlzIHNlcnZp
Y2luZyBvciBpdHNlbGYiPw0KDQpGaW5lIHdpdGggbWUuDQoNCg0KSnVlcmdlbg0K
--------------aWuBchtelEHDOh4VjTTny3Sk
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------aWuBchtelEHDOh4VjTTny3Sk--

--------------4mOyTSePYD7PBNBKlLXah02W--

--------------cH5g7Bzy5pCU4rcu0yLC8HVc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmflee8FAwAAAAAACgkQsN6d1ii/Ey+v
Lgf9HvIVoRMAN6tMtnFWrLSMh/zNv1PmM/9khKT2WJVNsoq4xLjzbEEsFjBLQrO/nIpSIOYB2y4d
6nkWI9NHs9qaj7ddG45CvUZdyNqJv/YrBM/kieahejI5mis+AGkRUaHQPPi55VNHZcG1Hk5wOAcR
cmE2PxihH4Z3gUHy+9KkCpivXuGurXPgyCYSsP+UVtKKcBGQ8a2a/Q17tvDV1vnJ+n23msjcXuJt
ebxdDVJ9ra/1BSpm7q2Z+JHbI4HR5DGtCcTLhehaGjTdbP1Sl6uftpUr3jwf0AEC2/L0RfWSms6T
obtIOqIhJ+oNNQS9inPQN3Xz0OOUYrnAmJ+tEmnLPw==
=5KX1
-----END PGP SIGNATURE-----

--------------cH5g7Bzy5pCU4rcu0yLC8HVc--

