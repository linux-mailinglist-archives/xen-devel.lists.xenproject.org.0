Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3557A5BCB9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 10:51:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907605.1314815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwGb-00075J-OS; Tue, 11 Mar 2025 09:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907605.1314815; Tue, 11 Mar 2025 09:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwGb-000736-L4; Tue, 11 Mar 2025 09:51:17 +0000
Received: by outflank-mailman (input) for mailman id 907605;
 Tue, 11 Mar 2025 09:51:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6th=V6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1trwGa-000730-DW
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 09:51:16 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f4d8187-fe5e-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 10:51:15 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac286d4ed05so368797966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 02:51:15 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2a09ca468sm308817266b.5.2025.03.11.02.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 02:51:14 -0700 (PDT)
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
X-Inumbo-ID: 5f4d8187-fe5e-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741686674; x=1742291474; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mar9nrrtPldwoMmug423uIAHJ8EXa4+qpMEyBeleapg=;
        b=ImXt6awSXQKfpvfBRSY+FG58vfldsKe2sU/xsSdtzaz7Xdp94s48W17+5G2DVmiL0s
         jJ7em3jhB2uXZoo9Dyuo6pD8n0op5WBkpNyR6zi7WbVkqBryYh1DV2tPT6k7EJd5VeGS
         iONOWQWOcjLUvnZdVO/9imVV3jrPKrIkrbW9ER4LMsw/06FL9/CcVs0zPn4hdaWh5N6t
         1SAGkL46XjedgPOveTln1EzgxYA11nVps/7/rvZdnIA5dtaqH7OkbmU2q7SZN1QahPFE
         m61BEOynF0bFO1fweaLbjnTXvm1ggr5ZmbuPk5xkxmGfdZyid88eNOvxBygQ1o6bph/e
         xDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741686674; x=1742291474;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mar9nrrtPldwoMmug423uIAHJ8EXa4+qpMEyBeleapg=;
        b=UrwUDsj3AjQoT07NOIY9I2Y5DQaJ42At2k/gpW6lvYvcPs7yXAILW4o6gTHS23HxDb
         hxNqaOuwepUaWOeS9qTB4wq6rZYZZA1jtqKCx5n7TIqiQJEMyhvJvpBS3s7sPCRWg/Oo
         enH1MAce5B4fCq1QC5XRDkfy+k/4bHvj2iWomO3kjZU1VZFT2Y02QMtKPpZYbt32KGYb
         jrIUyCgTkN1CsgA2n65D1gm7JXwWIYmxQPb+NW75kgEn4Ew3ueRiPssJyrK0RHvKBMWL
         naiMlNnPqz2UQUj42lk2B1A56ZHFT3zy6uowwlWclKham25Rh308wYI2cuM/FXidIyv2
         t7JA==
X-Forwarded-Encrypted: i=1; AJvYcCUsqLFBi23bOzxdcxWbFzw/qwdLUJHANCHqwefweQ8M6CDf20bnw2zE00F2j1LOFqQ1FGh2qTjfbic=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzkrZPMU8kC8vvfluDU+NYdw0nOybQ0NPLpxz24ptELvFzECCRo
	+VJS44oqfJm2biSQiHjdPcHQbA5NMOyi/k3/wYX4DBNtHKlSuGqxSe2KZEnVUWE=
X-Gm-Gg: ASbGnctJiMvPWUJCcL+Kku+Jd0pm9RxxFZQkA+ZYoECueViZRFD7kG5XmrmS/bVEr4+
	3VwW0CJl3g1+1UA8LL3xxzQz3htntqFI8+wbhg531MJk5m6UJTvs1f7BYoosZUkGSds5yubgXSj
	aWdi9N4iAzpbYLRpcZTXTYuJCu/ntFdQdydtia8PUrefhEQyGrDw6DeHGxA+M5kGiT2fXErdkX7
	D3tl2OjjzSvoo2ZMiw+bhUEkyidN21gQm+7K/Mv/8jrMlcmEpaa/6nctexWP5y0L0bOlocB5CXZ
	1bQhPhkJO1aZF/wbqqzCsuSagNU9OXeNuDa4id4kIWHaFRmGmMFB8hj+7bfalUQK9ga2BS408sg
	vbgVd8ZsN6M/1ECiSAsuTf6iBqPwjzazbEBIUDBc7ASl6NJ5Tv0087xk+3VOXRE6d6QQ=
X-Google-Smtp-Source: AGHT+IHKK84nt1WbtrJdInHOqs53RxzOxLjO8nfCz6umz3fSvccNELdDes4nwHdjIsc7+EX8WCem1Q==
X-Received: by 2002:a17:907:6ea8:b0:ac2:8a59:92f4 with SMTP id a640c23a62f3a-ac28a5997fdmr1255403366b.51.1741686674501;
        Tue, 11 Mar 2025 02:51:14 -0700 (PDT)
Message-ID: <e6352575-c2cb-4616-b305-1cd64480de1a@suse.com>
Date: Tue, 11 Mar 2025 10:51:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/9] xen/events: don't allow binding a global virq from
 any domain
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-2-jgross@suse.com>
 <24a909a8-c6a9-4c09-b819-24c10e0762c3@xen.org>
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
In-Reply-To: <24a909a8-c6a9-4c09-b819-24c10e0762c3@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PSl804qVHK0D3e06hWVBoITR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PSl804qVHK0D3e06hWVBoITR
Content-Type: multipart/mixed; boundary="------------00npI2P9rnseJ6HPieiRIxJs";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <e6352575-c2cb-4616-b305-1cd64480de1a@suse.com>
Subject: Re: [PATCH v8 1/9] xen/events: don't allow binding a global virq from
 any domain
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-2-jgross@suse.com>
 <24a909a8-c6a9-4c09-b819-24c10e0762c3@xen.org>
In-Reply-To: <24a909a8-c6a9-4c09-b819-24c10e0762c3@xen.org>
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

--------------00npI2P9rnseJ6HPieiRIxJs
Content-Type: multipart/mixed; boundary="------------cOK7d2SpSdlvgEe9TU4ePZFe"

--------------cOK7d2SpSdlvgEe9TU4ePZFe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDMuMjUgMTA6MzUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA0LzAyLzIwMjUgMTE6MzMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
b2RheSBYZW4gd2lsbCBoYXBwaWx5IGFsbG93IGJpbmRpbmcgYSBnbG9iYWwgdmlycSBieSBh
IGRvbWFpbiB3aGljaA0KPj4gaXNuJ3QgY29uZmlndXJlZCB0byByZWNlaXZlIGl0LiBUaGlz
IHdvbid0IHJlc3VsdCBpbiBhbnkgYmFkIGFjdGlvbnMsDQo+PiBidXQgdGhlIGJpbmQgd2ls
bCBhcHBlYXIgdG8gaGF2ZSBzdWNjZWVkZWQgd2l0aCBubyBldmVudCBldmVyIGJlaW5nDQo+
PiByZWNlaXZlZCBieSB0aGF0IGV2ZW50IGNoYW5uZWwuDQo+Pg0KPj4gSW5zdGVhZCBvZiBh
bGxvd2luZyB0aGUgYmluZCwgZXJyb3Igb3V0IGlmIHRoZSBkb21haW4gaXNuJ3Qgc2V0IHRv
DQo+PiBoYW5kbGUgdGhhdCB2aXJxLiBOb3RlIHRoYXQgdGhpcyBjaGVjayBpcyBpbnNpZGUg
dGhlIHdyaXRlX2xvY2soKSBvbg0KPj4gcHVycG9zZSwgYXMgYSBmdXR1cmUgcGF0Y2ggd2ls
bCBwdXQgYSByZWxhdGVkIGNoZWNrIGludG8NCj4+IHNldF9nbG9iYWxfdmlycV9oYW5kbGVy
KCkgd2l0aCB0aGUgYWRkaXRpb24gb2YgdXNpbmcgdGhlIHNhbWUgbG9jay4NCj4gID4gPiBT
aWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IA0KPiBJ
IHNlZSB0aGlzIHBhdGNoIHdhcyBhbHJlYWR5IGNvbW1pdHRlZC4gQnV0IEkgaGF2ZSBhIHF1
ZXN0aW9uIGFib3V0IHRoZSBsb2dpYy4NCj4gDQo+PiAtLS0NCj4+IFY2Og0KPj4gLSBuZXcg
cGF0Y2gNCj4+IFY3Og0KPj4gLSBtb3ZlIGhhbmRsaW5nIGRvbWFpbiBjaGVjayBpbnNpZGUg
bG9ja2VkIHJlZ2lvbiAoSmFuIEJldWxpY2gpDQo+PiAtIHN0eWxlIGZpeCAoSmFuIEJldWxp
Y2gpDQo+PiAtLS0NCj4+IMKgIHhlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5jIHwgMjEgKysr
KysrKysrKysrKysrKystLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9l
dmVudF9jaGFubmVsLmMgYi94ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYw0KPj4gaW5kZXgg
NDYyODFiMTZjZS4uY2Q2ZjVhMTIxMSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9jb21tb24vZXZl
bnRfY2hhbm5lbC5jDQo+PiArKysgYi94ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYw0KPj4g
QEAgLTEyMCw2ICsxMjAsMTMgQEAgc3RhdGljIHVpbnQ4X3QgDQo+PiBnZXRfeGVuX2NvbnN1
bWVyKHhlbl9ldmVudF9jaGFubmVsX25vdGlmaWNhdGlvbl90IGZuKQ0KPj4gwqAgLyogR2V0
IHRoZSBub3RpZmljYXRpb24gZnVuY3Rpb24gZm9yIGEgZ2l2ZW4gWGVuLWJvdW5kIGV2ZW50
IGNoYW5uZWwuICovDQo+PiDCoCAjZGVmaW5lIHhlbl9ub3RpZmljYXRpb25fZm4oZSkgKHhl
bl9jb25zdW1lcnNbKGUpLT54ZW5fY29uc3VtZXItMV0pDQo+PiArc3RhdGljIHN0cnVjdCBk
b21haW4gKl9fcmVhZF9tb3N0bHkgZ2xvYmFsX3ZpcnFfaGFuZGxlcnNbTlJfVklSUVNdOw0K
Pj4gKw0KPj4gK3N0YXRpYyBzdHJ1Y3QgZG9tYWluICpnZXRfZ2xvYmFsX3ZpcnFfaGFuZGxl
cih1bnNpZ25lZCBpbnQgdmlycSkNCj4+ICt7DQo+PiArwqDCoMKgIHJldHVybiBnbG9iYWxf
dmlycV9oYW5kbGVyc1t2aXJxXSA/OiBoYXJkd2FyZV9kb21haW47DQo+PiArfQ0KPj4gKw0K
Pj4gwqAgc3RhdGljIGJvb2wgdmlycV9pc19nbG9iYWwodW5zaWduZWQgaW50IHZpcnEpDQo+
PiDCoCB7DQo+PiDCoMKgwqDCoMKgIHN3aXRjaCAoIHZpcnEgKQ0KPj4gQEAgLTQ2OSw2ICs0
NzYsNyBAQCBpbnQgZXZ0Y2huX2JpbmRfdmlycShldnRjaG5fYmluZF92aXJxX3QgKmJpbmQs
IA0KPj4gZXZ0Y2huX3BvcnRfdCBwb3J0KQ0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZG9tYWlu
ICpkID0gY3VycmVudC0+ZG9tYWluOw0KPj4gwqDCoMKgwqDCoCBpbnTCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHZpcnEgPSBiaW5kLT52aXJxLCB2Y3B1ID0gYmluZC0+dmNwdTsNCj4+IMKg
wqDCoMKgwqAgaW50wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYyA9IDA7DQo+PiArwqDCoMKg
IGJvb2zCoMKgwqDCoMKgwqDCoMKgwqDCoCBpc19nbG9iYWw7DQo+PiDCoMKgwqDCoMKgIGlm
ICggKHZpcnEgPCAwKSB8fCAodmlycSA+PSBBUlJBWV9TSVpFKHYtPnZpcnFfdG9fZXZ0Y2hu
KSkgKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOw0KPj4gQEAgLTQ3
OCw4ICs0ODYsOSBAQCBpbnQgZXZ0Y2huX2JpbmRfdmlycShldnRjaG5fYmluZF92aXJxX3Qg
KmJpbmQsIA0KPj4gZXZ0Y2huX3BvcnRfdCBwb3J0KQ0KPj4gwqDCoMKgwqDCoCAqIHNwZWN1
bGF0aXZlIGV4ZWN1dGlvbi4NCj4+IMKgwqDCoMKgwqAgKi8NCj4+IMKgwqDCoMKgwqAgdmly
cSA9IGFycmF5X2luZGV4X25vc3BlYyh2aXJxLCBBUlJBWV9TSVpFKHYtPnZpcnFfdG9fZXZ0
Y2huKSk7DQo+PiArwqDCoMKgIGlzX2dsb2JhbCA9IHZpcnFfaXNfZ2xvYmFsKHZpcnEpOw0K
Pj4gLcKgwqDCoCBpZiAoIHZpcnFfaXNfZ2xvYmFsKHZpcnEpICYmICh2Y3B1ICE9IDApICkN
Cj4+ICvCoMKgwqAgaWYgKCBpc19nbG9iYWwgJiYgdmNwdSAhPSAwICkNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsNCj4+IMKgwqDCoMKgwqAgaWYgKCAodiA9IGRv
bWFpbl92Y3B1KGQsIHZjcHUpKSA9PSBOVUxMICkNCj4+IEBAIC00ODcsNiArNDk2LDEyIEBA
IGludCBldnRjaG5fYmluZF92aXJxKGV2dGNobl9iaW5kX3ZpcnFfdCAqYmluZCwgDQo+PiBl
dnRjaG5fcG9ydF90IHBvcnQpDQo+PiDCoMKgwqDCoMKgIHdyaXRlX2xvY2soJmQtPmV2ZW50
X2xvY2spOw0KPj4gK8KgwqDCoCBpZiAoIGlzX2dsb2JhbCAmJiBnZXRfZ2xvYmFsX3ZpcnFf
aGFuZGxlcih2aXJxKSAhPSBkICkNCj4gDQo+IFdoYXQgcHJldmVudCBhIHJhY2UgYmV0d2Vl
biBnZXRfZ2xvYmFsX3ZpcnFfaGFuZGxlcigpIGFuZCANCj4gc2V0X2dsb2JhbF92aXJxX2hh
bmRsZXIoKT8gQWxzbywgaXQgaXMgbm90IGNsZWFyIGluIHRoZSBpbXBsZW1lbnRhdGlvbiBv
ZiANCj4gZ2V0X2dsb2JhbF92aXJxX2hhbmRsZXIoKSB0aGF0IGl0IHdpbGwgZXZlciBvbmx5
IHJlYWQgZ2xvYmFsX3ZpcnFfaGFuZGxlcnNbdmlycV0gDQo+IG9uY2UuDQoNCnNldF9nbG9i
YWxfdmlycV9oYW5kbGVyKCkgaXMgdGFraW5nIHRoZSBldmVudF9sb2NrIG9mIHRoZSBkb21h
aW4NCnJlZ2lzdGVyZWQgYXMgaGFuZGxlci4NCg0KU28gaWYgYSBkb21haW4gaXMgcmVnaXN0
ZXJlZCBmb3IgaGFuZGxpbmcgYSB2aXJxLCBkLT5ldmVudF9sb2NrIGlzDQpwcm90ZWN0aW5n
IGFnYWluc3QgdGhlIGhhbmRsaW5nIGRvbWFpbiB0byBiZSBjaGFuZ2VkLiBDb25jdXJyZW50
DQpjYWxscyBvZiBzZXRfZ2xvYmFsX3ZpcnFfaGFuZGxlcigpIGFyZSBoYW5kbGVkIHZpYSB0
YWtpbmcgdGhlDQpnbG9iYWxfdmlycV9oYW5kbGVyc19sb2NrIHNwaW5fbG9jay4NCg0KDQpK
dWVyZ2VuDQo=
--------------cOK7d2SpSdlvgEe9TU4ePZFe
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------cOK7d2SpSdlvgEe9TU4ePZFe--

--------------00npI2P9rnseJ6HPieiRIxJs--

--------------PSl804qVHK0D3e06hWVBoITR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfQB5EFAwAAAAAACgkQsN6d1ii/Ey84
Mgf/Yl7tj3egwySegvTKiaVYe3IzkgafSPzTZe/GUA2mfhaULfDPlOhoxmnXv213Jzcky11guWgf
14DVDKNgt5DTOrbLoHXVpzcUxhF718hnlIm5DRf/uk84RiqpOBpvFh7GejB8mv3vNluh3A92j/rL
cA8otbTtnNu/rvUDK6fEE/xHFEK/I02Sa00uLJ4/xZy5vUDS3umAN4cs5ub8YC8prSQj7uN+Z5Sh
YRwcxpTSVcPp0zLOSFXd9WcSv6tslO5R9Yo3G8biOXDwdF2vvt/i4ETErdHiS106OA03JAUHft+S
DCR/NYCg4ImtGUWYLtw5HbnRo6i2CijxlQDGVAPtlw==
=4UpF
-----END PGP SIGNATURE-----

--------------PSl804qVHK0D3e06hWVBoITR--

