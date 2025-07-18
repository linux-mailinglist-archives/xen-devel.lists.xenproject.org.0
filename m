Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 222E0B09AE0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 07:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047913.1418214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucdQS-0000Lh-1K; Fri, 18 Jul 2025 05:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047913.1418214; Fri, 18 Jul 2025 05:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucdQR-0000Jx-Uy; Fri, 18 Jul 2025 05:14:27 +0000
Received: by outflank-mailman (input) for mailman id 1047913;
 Fri, 18 Jul 2025 05:14:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ucdQP-0000Jr-Qy
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 05:14:26 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11ad737f-6396-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 07:14:24 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso1347892f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 22:14:24 -0700 (PDT)
Received: from ?IPV6:2003:e5:8709:f00:6357:915b:11f9:6d20?
 (p200300e587090f006357915b11f96d20.dip0.t-ipconnect.de.
 [2003:e5:8709:f00:6357:915b:11f9:6d20])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4563b740c51sm9317285e9.19.2025.07.17.22.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 22:14:23 -0700 (PDT)
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
X-Inumbo-ID: 11ad737f-6396-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752815664; x=1753420464; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oHkwKq6S+We6R7ynrZ1f3VIKAEeEfqkJv0WYccQ51Cs=;
        b=eQpIIDErqm5ZvCqGySzmU23LgkT+4AniiWfFECEuCJjbc1q4z2lCvE3Z6+FI90TdjY
         6dX18YO7SZPopkwgAIXmEEO+ho7FsvO4wSu+Ll+btmCCojg2EjQc4v4leYrlEV6tA7C9
         W0zKwlczv++hKHm+eR2cZkUnsg2fLSc9rbCEEnBfwdMwA6AULjpW/nIz600V+RR4yxn+
         tL8Ypk/m8k/9xXHWRet2X3A76cBjKD7YJpo0JSYRx3NNYldgze/QeBziFSGAmDX+RNH4
         yn/c0PVpY5Uz1MGukBKZjtvGyMNZwTGgRUBXZeHjBIAKxHbdgrC847yCAQv0RyIMEA5A
         1fIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752815664; x=1753420464;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oHkwKq6S+We6R7ynrZ1f3VIKAEeEfqkJv0WYccQ51Cs=;
        b=ebvp3k+mRrJnx9ZRBgKhpS9nZKyg158Bc3QcQ5Jd4OFjjaTi4Qwez1nAJonXuDpyiX
         czJlQaLNMcF7Gu32KOGzkuEpHvhWNXFIGcU8BhViSj+iSG1ZNA2g97vsHAwIo49kVtD7
         ITXuiZUeJ6LdziKbQkKlLtMo7qHlocYk46db1XMRxKKbyKeajDBf4yJXmmJk0Isrgwad
         9u0F0LlgTYEr7zqWrmiELDqW71d37U3/wwYrGV2HNlSAMtKIo4vq5BKR68xsLwM4FgmA
         H3Z+P3zOtKs0w7VM+Co2E70u/3Y43VwBlJZLYvraIsjUDQtA+urf8HWsQzP7HC0R/dC0
         sdPw==
X-Forwarded-Encrypted: i=1; AJvYcCViYkT/1PU6s2cg7GizBo2lg8vMISMLWIDtQnFr/F159uCV2uBBVktUiARI6729uzO+n0eQEZZ2Tao=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCQyrK7l9MpT3RwWAKX2BkfZJphcf/dgL/QHpdYGS0M/Sya9JO
	x3cXnNxCkVRfTIatnz84BOm7ntzZ+f2ofO2vL3SggOZ7wVfiEf4wK/Tk9MphBsr7Gxk=
X-Gm-Gg: ASbGncujVU509F7eEzXFWoa61C9YoIEZba7qbADrKqDH6b/TeqYMjD81VDq5WG5EOQf
	2Y8f+AsDuWGZ+PRqd6PCE3+PI8npPvJbhtfsI3LTzsVdLTX5t1e/vd+g5vSit3+BznuH8tfiZHP
	m99C1ui3Z/vzrp1PryzHvlE7EypQP3a6txucMvfNvLl5EzJF8dELa2MMULw8egUaF2V4lX/bNxF
	vEb/kUwRPnv3/UMowILYufbAuRaBrohjkpl64ACh4OTVLLNopQ+8RGI/gnJKqrdMdLUPnUqgD/5
	ATht0OQsHoXSfwt8U5khTkNbGFC8ZUHCrYAbIAWZkg8JjJpDHiEpMlO4IYrZaNdIJHqWt2JcdWO
	HTXcUmaPT0mqs48O011ZRyFQ9Ax2+F45ZYQpVH37haMgH6KZnbnMNXBhw+FAU672BqcWToDhOa6
	H4aWKLPL1xcTJItED80REoT9py1BQ/8I4wgH4kJl8fA2+k
X-Google-Smtp-Source: AGHT+IGB5RLYTCtdftwXbcTL3uj/vHQECT5v5Rn54I/nmj8x8HSDoC4pM9Dc8i0J3iPWSpYLYPjZFQ==
X-Received: by 2002:a5d:6f14:0:b0:3a4:f661:c3e0 with SMTP id ffacd0b85a97d-3b60e510baamr6047626f8f.45.1752815663576;
        Thu, 17 Jul 2025 22:14:23 -0700 (PDT)
Message-ID: <5c427357-d31c-4085-b714-c7b26db1e0ad@suse.com>
Date: Fri, 18 Jul 2025 07:14:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/17] xen: Add capabilities to get_domain_state
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-12-jason.andryuk@amd.com>
 <13f6ce53-fdb9-469c-a2fd-a93280d55c97@suse.com>
 <f03ae1ad-629d-4cb7-ad85-7862dde939a4@amd.com>
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
In-Reply-To: <f03ae1ad-629d-4cb7-ad85-7862dde939a4@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5XO4vS0e4IkXXLgFk1hq9h0T"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5XO4vS0e4IkXXLgFk1hq9h0T
Content-Type: multipart/mixed; boundary="------------haOaoIK03ljIkjm2Cd7FQsoj";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <5c427357-d31c-4085-b714-c7b26db1e0ad@suse.com>
Subject: Re: [PATCH v2 11/17] xen: Add capabilities to get_domain_state
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-12-jason.andryuk@amd.com>
 <13f6ce53-fdb9-469c-a2fd-a93280d55c97@suse.com>
 <f03ae1ad-629d-4cb7-ad85-7862dde939a4@amd.com>
In-Reply-To: <f03ae1ad-629d-4cb7-ad85-7862dde939a4@amd.com>
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

--------------haOaoIK03ljIkjm2Cd7FQsoj
Content-Type: multipart/mixed; boundary="------------ffxWPnCxjtLlj1m4AcvHB5LI"

--------------ffxWPnCxjtLlj1m4AcvHB5LI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDcuMjUgMjI6MTYsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDct
MTcgMDI6MjQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBPbiAxNi4wNy4yNSAyMzoxNCwg
SmFzb24gQW5kcnl1ayB3cm90ZToNCj4+PiBFeHBvc2UgYSBkb21haW4ncyBjYXBhYmlsaXRp
ZXMgLSBjb250cm9sLCBoYXJkd2FyZSBvciB4ZW5zdG9yZSAtIHRocm91Z2gNCj4+PiBzdGFi
bGUgZ2V0IGRvbWFpbiBzdGF0ZSBoeXBlcmNhbGwuDQo+Pj4NCj4+PiBUaGUgeGVuc3RvcmUg
ZG9tYWluIGNhbiB1c2UgdGhpcyBpbmZvcm1hdGlvbiB0byBhc3NpZ24gYXBwcm9wcmlhdGUN
Cj4+PiBwZXJtaXNzaW9ucyBvbiBjb25uZWN0aW9ucy4NCj4+Pg0KPj4+IFJlcHVycG9zZSB0
aGUgMTZiaXQgcGFkIGZpZWxkIGZvciB0aGlzIHB1cnBvc2UuDQo+Pj4NCj4+PiBTaWduZWQt
b2ZmLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQo+Pj4gLS0t
DQo+Pj4gwqAgeGVuL2NvbW1vbi9kb21haW4uY8KgwqDCoMKgwqDCoMKgwqAgfCA4ICsrKysr
KystDQo+Pj4gwqAgeGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oIHwgNyArKysrKy0tDQo+
Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29t
bW9uL2RvbWFpbi5jDQo+Pj4gaW5kZXggYzM0N2RlNDMzNS4uOGIwMTUxYThmNyAxMDA2NDQN
Cj4+PiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jDQo+Pj4gKysrIGIveGVuL2NvbW1vbi9k
b21haW4uYw0KPj4+IEBAIC0xOTUsNiArMTk1LDEyIEBAIHN0YXRpYyB2b2lkIHNldF9kb21h
aW5fc3RhdGVfaW5mbyhzdHJ1Y3QgDQo+Pj4geGVuX2RvbWN0bF9nZXRfZG9tYWluX3N0YXRl
ICppbmZvLA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpbmZvLT5zdGF0ZSB8PSBYRU5fRE9N
Q1RMX0dFVERPTVNUQVRFX1NUQVRFX0RZSU5HOw0KPj4+IMKgwqDCoMKgwqAgaWYgKCBkLT5p
c19keWluZyA9PSBET01EWUlOR19kZWFkICkNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaW5m
by0+c3RhdGUgfD0gWEVOX0RPTUNUTF9HRVRET01TVEFURV9TVEFURV9ERUFEOw0KPiANCj4g
SSdsbCBhZGQ6DQo+IA0KPiArDQo+ICvCoMKgwqAgaW5mby0+Y2FwcyA9IDANCj4gDQo+IGhl
cmUsIHRvIGVuc3VyZSBhbGwgdGhlIGNhcHMgYml0cyBzdGFydCBvZmYgY2xlYXJlZC4NCj4g
DQo+Pj4gK8KgwqDCoCBpZiAoIGlzX2NvbnRyb2xfZG9tYWluKGQpICkNCj4+PiArwqDCoMKg
wqDCoMKgwqAgaW5mby0+Y2FwcyB8PSBYRU5fRE9NQ1RMX0dFVERPTVNUQVRFX0NBUF9DT05U
Uk9MOw0KPj4+ICvCoMKgwqAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgKQ0KPj4+ICvC
oMKgwqDCoMKgwqDCoCBpbmZvLT5jYXBzIHw9IFhFTl9ET01DVExfR0VURE9NU1RBVEVfQ0FQ
X0hBUkRXQVJFOw0KPj4+ICvCoMKgwqAgaWYgKCBpc194ZW5zdG9yZV9kb21haW4oZCkgKQ0K
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpbmZvLT5jYXBzIHw9IFhFTl9ET01DVExfR0VURE9NU1RB
VEVfQ0FQX1hFTlNUT1JFOw0KPj4+IMKgwqDCoMKgwqAgaW5mby0+dW5pcXVlX2lkID0gZC0+
dW5pcXVlX2lkOw0KPj4+IMKgIH0NCj4gDQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L3B1YmxpYy9kb21jdGwuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaA0KPj4+IGlu
ZGV4IGYxZjZmOTZiYzIuLjg3OTM0M2IyMWQgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2luY2x1
ZGUvcHVibGljL2RvbWN0bC5oDQo+Pj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0
bC5oDQo+Pj4gQEAgLTEyNjksOCArMTI2OSwxMSBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9nZXRf
ZG9tYWluX3N0YXRlIHsNCj4+PiDCoCAjZGVmaW5lIFhFTl9ET01DVExfR0VURE9NU1RBVEVf
U1RBVEVfU0hVVERPV07CoCAweDAwMDLCoCAvKiBTaHV0ZG93biANCj4+PiBmaW5pc2hlZC4g
Ki8NCj4+PiDCoCAjZGVmaW5lIFhFTl9ET01DVExfR0VURE9NU1RBVEVfU1RBVEVfRFlJTkfC
oMKgwqDCoCAweDAwMDTCoCAvKiBEb21haW4gZHlpbmcuICovDQo+Pj4gwqAgI2RlZmluZSBY
RU5fRE9NQ1RMX0dFVERPTVNUQVRFX1NUQVRFX0RFQUTCoMKgwqDCoMKgIDB4MDAwOMKgIC8q
IERvbWFpbiBkZWFkLiAqLw0KPj4+IC3CoMKgwqAgdWludDE2X3QgcGFkMDvCoMKgwqDCoMKg
wqDCoMKgwqDCoCAvKiBNdXN0IGJlIDAgb24gaW5wdXQsIHJldHVybmVkIGFzIDAuICovDQo+
Pj4gLcKgwqDCoCB1aW50MzJfdCBwYWQxO8KgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIE11c3Qg
YmUgMCBvbiBpbnB1dCwgcmV0dXJuZWQgYXMgMC4gKi8NCj4+PiArwqDCoMKgIHVpbnQxNl90
IGNhcHM7wqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogTXVzdCBiZSAwIG9uIGlucHV0LCByZXR1
cm5lZCBhcyAwLiAqLw0KPj4NCj4+IEknZCBkcm9wIHRoZSAicmV0dXJuZWQgYXMgMCIgaW4g
dGhlIGNvbW1lbnQuIDotKQ0KPiANCj4gOikNCj4gDQo+IEknbGwgZHJvcCB0aGUgd2hvbGUg
Y29tbWVudCBzaW5jZSB0aGUgaW5wdXQgdmFsdWUgaXMgbm90IGNoZWNrZWQuDQo+IA0KPj4g
V2l0aCB0aGF0IGZpeGVkOg0KPj4NCj4+IFJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+IA0KPiBEb2VzIHRoaXMgc3RhbmQgd2l0aCB0aGUgYWJvdmUg
Y2hhbmdlcz8NCg0KWWVzLCBpdCBkb2VzLg0KDQoNCkp1ZXJnZW4NCg==
--------------ffxWPnCxjtLlj1m4AcvHB5LI
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ffxWPnCxjtLlj1m4AcvHB5LI--

--------------haOaoIK03ljIkjm2Cd7FQsoj--

--------------5XO4vS0e4IkXXLgFk1hq9h0T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh52C4FAwAAAAAACgkQsN6d1ii/Ey86
RggAnKQ7n2ovv4U3nYVZCKhOWXZnd60DWyRWf2va26NvKkUFvKZ1NQIvc2N7FgGyD06Uw6Mx/qZ3
ReX9uQcu7bvs1OzAd99wqbaliMNXTRG4Wu7KugNskyc/8N6GJGtxbKf66TJnzL70LWQN1T9noy3U
DmRLOCYpL2jmDFeh8GkWtA6KUMbo7037jSArYvNqBH4h4//qcYkgO1wAKXfEKYcwK+EPq40fnVTd
wSzQYdb06jt0Dvw2l3InaaHQbNauEU19c1YreixOOOPzepo1d3i6WeSp61k6MoYW6pzMqYLGie4G
tZdc4C74cSidbGaRmrA4R79arxjU0UdQrAZ9ouFOfg==
=oRjU
-----END PGP SIGNATURE-----

--------------5XO4vS0e4IkXXLgFk1hq9h0T--

