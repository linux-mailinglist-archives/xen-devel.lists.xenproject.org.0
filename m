Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA25A79122
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 16:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935858.1337225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzz18-0001oC-3T; Wed, 02 Apr 2025 14:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935858.1337225; Wed, 02 Apr 2025 14:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzz18-0001lv-0f; Wed, 02 Apr 2025 14:24:34 +0000
Received: by outflank-mailman (input) for mailman id 935858;
 Wed, 02 Apr 2025 14:24:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L/lH=WU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tzz16-0001CE-DS
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 14:24:32 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 316fa96b-0fce-11f0-9ea9-5ba50f476ded;
 Wed, 02 Apr 2025 16:24:31 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so61236525e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 07:24:31 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb613a283sm22291795e9.37.2025.04.02.07.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 07:24:31 -0700 (PDT)
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
X-Inumbo-ID: 316fa96b-0fce-11f0-9ea9-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743603871; x=1744208671; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iJzineMrgwmkQWOI4wS34a3mCsqCX+XEhj/GY/k54Ew=;
        b=XbpeTB2xsq1UkXjkzRAwHk/v5HzyVdZLS5kKCLsNKdvZzsqgR2meDoLBmAPfzqciZJ
         n/LJxexyaxSd7LWzS1LyoOGU2Tn3gzbrgvPc7tKY8B5O/Fcr+nCMMzO5pdUMO4f83FUP
         DC5ll/BVjbB+Mu0/89hXdLcttePzjxVnjGyMdj4xggv/SC8Ren8F58Tg3RcOCwZNxLSm
         hWQca/THWV3qqjViNldKhGcgvIRdcdkDjh1mXqdjE5l8xabZZ5ji8HzLTeMXg6JV99Hm
         +lgaL6ZXWAxc/7iLHgf5HMAmi8Q5inbKXyYCFQmU5Fm7actshbrD40KGAA0kidBc4+sf
         vzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743603871; x=1744208671;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJzineMrgwmkQWOI4wS34a3mCsqCX+XEhj/GY/k54Ew=;
        b=wvdoUA01mRdXJwl1Fxw+4fCDvFIZA/Ir+2EK3oLy+4dmlXGraSpPgDqSmAvbaqJ3Tu
         E9JnfTVTvVpDz9FUxW5Jtu6ZcfMDTElZEBYqzlA1X3yYKY7Ey/4KKPhqrsH5RU5yylyn
         REoeVaMMmHIecLMVFQW+TsTDoChfaVtpmMrDOjd4m0P9RjpnHQmzulTUP587SYEz0et0
         sOKaa0b7lerAacKtw1Ny9cFkV4bPJErNqfW8YWILUAU6iruQW0hpYC63uf9omCoXBOnC
         5SkVlkG4dtY2TC+evThh04367cl9XxTrWFhc8jYuysOPzSSzaVpKvse5wzt8Bnq7RhRS
         xk1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzOunXZ4DazNx02AmuReXxL92cLa8t3fz9dKsivIlKol49vyGXX0LsO3eUYpzKt+ET1dBy/kTcPJI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgbsQKbIMFZHJ9gg/M5r2pXawJ51SS+av8Kf0c0Eoo7JObgq0t
	K9zvQqD0mkToTDVdyw0inNs6Y/hQjbIpmQffFNV2LGJVPg1MpvmrDfQyyN9j8k4=
X-Gm-Gg: ASbGncu9tWT7esl6b4F32bwaxH/0kbO4i83icIG8/OnTEQLWr27MePWROTf5cny+Iue
	nXwuFfsKHSoI3tqah/nrgXOmgBudPd+IKSxQciM9SCoqAujB4AHNlym7ARUWXqo3LDpRmwTl9zL
	K43zjmJKXrgefesa0+NmcMrqqTeEh0rtL9WgqWrWUNPQSeHn+kQr5wylBO8GciqMOk3MB1oq1Se
	+bBHwZDK4eRzw24zMZZAjJcuLFHaswSRwlcOJ/YEYgR5O0rfOh7y+iTeO8PkH6nwjpXB1c1eS+G
	6xD2lVw6Qp5K1MASQ4WLYAQCmy+yMOA2KVscO8E5XxmwtEsDlprF/XAdRDTTJYOA73S6PLfR0pl
	Cgh24iEGbaqAyD5JpajfIyRjL/evTkfh+gmDpCrtQE19FfotjcRQmbfC15PdZrFW9M2bCV8rnTD
	nFjV1v
X-Google-Smtp-Source: AGHT+IGtPGezyCWJtX6IVYSkPaMY2YGHUv364L5zBXLlo5aESABGFxd8SNox1SCTQJZY3CEj07y/6Q==
X-Received: by 2002:a05:6000:4021:b0:390:d73a:4848 with SMTP id ffacd0b85a97d-39c1211ddd9mr13452019f8f.47.1743603871312;
        Wed, 02 Apr 2025 07:24:31 -0700 (PDT)
Message-ID: <a6977caf-ce0e-4002-8df5-26cb0bdc88d7@suse.com>
Date: Wed, 2 Apr 2025 16:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Change xen-acpi-processor dom0 dependency
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Penny Zheng <penny.zheng@amd.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20250331172913.51240-1-jason.andryuk@amd.com>
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
In-Reply-To: <20250331172913.51240-1-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------m66sebaDQsVxECLQq91DuIcx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------m66sebaDQsVxECLQq91DuIcx
Content-Type: multipart/mixed; boundary="------------oQ3RPytk3d9i5O0EtiFFiinQ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Penny Zheng <penny.zheng@amd.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <a6977caf-ce0e-4002-8df5-26cb0bdc88d7@suse.com>
Subject: Re: [PATCH] xen: Change xen-acpi-processor dom0 dependency
References: <20250331172913.51240-1-jason.andryuk@amd.com>
In-Reply-To: <20250331172913.51240-1-jason.andryuk@amd.com>
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

--------------oQ3RPytk3d9i5O0EtiFFiinQ
Content-Type: multipart/mixed; boundary="------------VD3gOMoYFtwHmoy3ZVcwlLLC"

--------------VD3gOMoYFtwHmoy3ZVcwlLLC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzEuMDMuMjUgMTk6MjksIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IHhlbi1hY3BpLXBy
b2Nlc3NvciBmdW5jdGlvbnMgdW5kZXIgYSBQVkggZG9tMCB3aXRoIG9ubHkgYQ0KPiB4ZW5f
aW5pdGlhbF9kb21haW4oKSBydW50aW1lIGNoZWNrLiAgQ2hhbmdlIHRoZSBLY29uZmlnIGRl
cGVuZGVuY3kgZnJvbQ0KPiBQViBkb20wIHRvIGdlbmVyaWMgZG9tMCB0byByZWZsZWN0IHRo
YXQuDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogSmFzb24gQW5kcnl1ayA8amFzb24uYW5kcnl1a0BhbWQu
Y29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL3hlbi9LY29uZmlnIHwgMiArLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMveGVuL0tjb25maWcgYi9kcml2ZXJzL3hlbi9LY29uZmlnDQo+IGlu
ZGV4IGY3ZDZmNDc5NzFmZC4uMjRmNDg1ODI3ZTAzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3hlbi9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMveGVuL0tjb25maWcNCj4gQEAgLTI3OCw3
ICsyNzgsNyBAQCBjb25maWcgWEVOX1BSSVZDTURfRVZFTlRGRA0KPiAgIA0KPiAgIGNvbmZp
ZyBYRU5fQUNQSV9QUk9DRVNTT1INCj4gICAJdHJpc3RhdGUgIlhlbiBBQ1BJIHByb2Nlc3Nv
ciINCj4gLQlkZXBlbmRzIG9uIFhFTiAmJiBYRU5fUFZfRE9NMCAmJiBYODYgJiYgQUNQSV9Q
Uk9DRVNTT1IgJiYgQ1BVX0ZSRVENCj4gKwlkZXBlbmRzIG9uIFhFTiAmJiBYRU5fRE9NMCAm
JiBYODYgJiYgQUNQSV9QUk9DRVNTT1IgJiYgQ1BVX0ZSRVENCj4gICAJZGVmYXVsdCBtDQo+
ICAgCWhlbHANCj4gICAJICBUaGlzIEFDUEkgcHJvY2Vzc29yIHVwbG9hZHMgUG93ZXIgTWFu
YWdlbWVudCBpbmZvcm1hdGlvbiB0byB0aGUgWGVuDQoNCkFzc3VtaW5nIHRoYXQgYWxsIG5l
ZWRlZCBoeXBlcmNhbGxzIGFyZSBmaW5lIGZvciBQVkggZG9tMDoNCg0KUmV2aWV3ZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------VD3gOMoYFtwHmoy3ZVcwlLLC
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

--------------VD3gOMoYFtwHmoy3ZVcwlLLC--

--------------oQ3RPytk3d9i5O0EtiFFiinQ--

--------------m66sebaDQsVxECLQq91DuIcx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmftSJ4FAwAAAAAACgkQsN6d1ii/Ey/L
JAf/bhOl9OHcEuNgUSKI6NfwxDIDgaauqljWmZC0ymjFKbkvQmgtTcpY42kVDGxX7rzTQmMYhCQg
iBMa28Dp3oeqEFctCZ0Z69y3eWDDcE7Da+c/GDmyH59Iv/96f5lO9W/2OKQkgB5QH7HUs2jRxbUt
t6DRjYD2dOTZMFQj1qxYixaB0s/5LhN7beCc4RjGy2jwFu3OUuRho/ZrNjCMSYlgfGjeNhpdhmRm
xsmmsPblJ7Jaz/dX0VLeAPK4yv6SaI+NJ/FX0NkoPsx88TTxKn2BAjoNSFeQfMR7Dag6naGw2lCI
fuCg9L/v7c/4zZqE+LANzRTd/+p2gYYezVWwmzu3QQ==
=kMeA
-----END PGP SIGNATURE-----

--------------m66sebaDQsVxECLQq91DuIcx--

