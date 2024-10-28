Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 337AD9B2DDF
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 12:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826382.1240608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5NWS-00037D-Bm; Mon, 28 Oct 2024 11:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826382.1240608; Mon, 28 Oct 2024 11:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5NWS-00035i-8c; Mon, 28 Oct 2024 11:02:56 +0000
Received: by outflank-mailman (input) for mailman id 826382;
 Mon, 28 Oct 2024 11:02:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owaa=RY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t5NWR-00035c-GE
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 11:02:55 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2dd9ea39-951c-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 12:02:53 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c94c4ad9d8so5232452a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 04:02:53 -0700 (PDT)
Received: from ?IPV6:2003:e5:8706:5100:ddd3:fe18:d0ae:c30d?
 (p200300e587065100ddd3fe18d0aec30d.dip0.t-ipconnect.de.
 [2003:e5:8706:5100:ddd3:fe18:d0ae:c30d])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb63197bdsm3070057a12.70.2024.10.28.04.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 04:02:52 -0700 (PDT)
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
X-Inumbo-ID: 2dd9ea39-951c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730113373; x=1730718173; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4kat/VnG3poqFuN3yT8csYObH4SFvwiwwMJMO+ljS+Q=;
        b=NC7nZwjISdW/dWtlPYtQTZ3tXrRcCOF2+XKX0Ym5BuW/w/zxHW5Je0Db3GC+qZFgZI
         xO1pjrsKuCKFDRjcFY+Sg5julPWfc8ra8ZXfC0YQKbaFrDQo7mh3qtw7uim92La1bkfL
         J6kMfAtQdHXa79JJrQM1p+GIF2WDQWkRY0DSojGhkNtFZGVhjggszrAZ+wa1aoMfqb3z
         LQkFhZD9RecG6/toc/VrDHAafsJ/u0O6EzutMoOzVlPx1WFb6tFn1M9sMfQOL7yW2XQd
         IpELuJObJ3OXLUNvvFiwzCRlLff0hQuDc/hjaZtdfDcF3dU2VwrcVfxjiWGcSawuQK26
         JNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730113373; x=1730718173;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4kat/VnG3poqFuN3yT8csYObH4SFvwiwwMJMO+ljS+Q=;
        b=L03vZJniJjnyPGlgiR3QXiyBRBXO11M2OYzAq351L39Iv/0QvlV+A2EztFRLwEkA1d
         34xDdNPNrUv0tl5S35ZMPpAKI4H3euzVRxnBkaqehMTJF0Lrt6CKmENO0zpVT2RJfX5O
         MWR4FxvKNE8z2xTYRNn9geOCKuS2Of0kdh40Rzg+Z10I6Bz2LUZd8yVoskVRK7FhE5kD
         wbLoj9YyEENIGnTb6/j/1opZrIAx/99oJNmrDUuF7AMGuiKEXnuPxYhB+VTFeGUtHXp3
         qMv9gt/VA7Pa2P0l0bf/YKubr2rfnYUBHDFa9t+LCYnBIn5Jbj+6X/5uAPYD7V20NuZD
         W0mw==
X-Forwarded-Encrypted: i=1; AJvYcCUKms3o1r17cHGjjIe2qdMQ9LfLibJcgktyCkZAPDHvsf9W7bGP0icEQifa1W/IXifoz1+qO0iXmv8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDfWcsNW0BkTMhl1iNfmGFK3l5/6e7R3o5lu6fPXQHY/y0Xu82
	5hwfxschbt7pBfwGDMq4svtks4n3YfQtIqGhpVTD8TjR5IGtn43uAKIa5XLlp08=
X-Google-Smtp-Source: AGHT+IFUyIdGxEHr5OBhslOytwB67noSGHQuKYk/dkC/GbasMvpvN39IedB0TMgvbIsTFw1+XdGqoA==
X-Received: by 2002:a05:6402:5107:b0:5c8:ae9e:baba with SMTP id 4fb4d7f45d1cf-5cbbf8868bbmr6218148a12.2.1730113372665;
        Mon, 28 Oct 2024 04:02:52 -0700 (PDT)
Message-ID: <5ba0d19d-63c8-4224-b9f9-75ef75f0a332@suse.com>
Date: Mon, 28 Oct 2024 12:02:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen: add new domctl get_changed_domain
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-4-jgross@suse.com>
 <311e38eb-4d4a-44a1-9ae1-db40a79c9698@suse.com>
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
In-Reply-To: <311e38eb-4d4a-44a1-9ae1-db40a79c9698@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MYBdebw1B2ki7ZEph0Zy4b6p"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MYBdebw1B2ki7ZEph0Zy4b6p
Content-Type: multipart/mixed; boundary="------------BpkG8iKnQMpNgdXsm04cr75i";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <5ba0d19d-63c8-4224-b9f9-75ef75f0a332@suse.com>
Subject: Re: [PATCH 3/6] xen: add new domctl get_changed_domain
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-4-jgross@suse.com>
 <311e38eb-4d4a-44a1-9ae1-db40a79c9698@suse.com>
In-Reply-To: <311e38eb-4d4a-44a1-9ae1-db40a79c9698@suse.com>
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

--------------BpkG8iKnQMpNgdXsm04cr75i
Content-Type: multipart/mixed; boundary="------------Os0A5I8ffzdpzARQCqmbNbZ0"

--------------Os0A5I8ffzdpzARQCqmbNbZ0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMTAuMjQgMTE6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4xMC4yMDI0
IDE1OjEwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQWRkIGEgbmV3IGRvbWN0bCBzdWIt
ZnVuY3Rpb24gdG8gZ2V0IGRhdGEgb2YgYSBkb21haW4gaGF2aW5nIGNoYW5nZWQNCj4+IHN0
YXRlICh0aGlzIGlzIG5lZWRlZCBieSBYZW5zdG9yZSkuDQo+Pg0KPj4gVGhlIHJldHVybmVk
IHN0YXRlIGp1c3QgY29udGFpbnMgdGhlIGRvbWlkLCB0aGUgZG9tYWluIHVuaXF1ZSBpZCwN
Cj4+IGFuZCBzb21lIGZsYWdzIChleGlzdGluZywgc2h1dGRvd24sIGR5aW5nKS4NCj4+DQo+
PiBJbiBvcmRlciB0byBlbmFibGUgWGVuc3RvcmUgc3R1YmRvbSBiZWluZyBidWlsdCBmb3Ig
bXVsdGlwbGUgWGVuDQo+PiB2ZXJzaW9ucywgbWFrZSB0aGlzIGRvbWN0bCBzdGFibGUuICBG
b3Igc3RhYmxlIGRvbWN0bHMgdGhlDQo+PiBpbnRlcmZhY2VfdmVyc2lvbiBpcyBzcGVjaWZp
YyB0byB0aGUgcmVzcGVjdGl2ZSBkb21jdGwgb3AgYW5kIGl0IGlzIGFuDQo+PiBpbi9vdXQg
cGFyYW1ldGVyOiBPbiBpbnB1dCB0aGUgY2FsbGVyIGlzIHNwZWNpZnlpbmcgdGhlIGRlc2ly
ZWQgdmVyc2lvbg0KPj4gb2YgdGhlIG9wLCB3aGlsZSBvbiBvdXRwdXQgdGhlIGh5cGVydmlz
b3Igd2lsbCByZXR1cm4gdGhlIHVzZWQgdmVyc2lvbg0KPj4gKHRoaXMgd2lsbCBiZSBhdCBt
YXggdGhlIGNhbGxlciBzdXBwbGllZCB2ZXJzaW9uLCBidXQgbWlnaHQgYmUgbG93ZXIgaW4N
Cj4+IGNhc2UgdGhlIGh5cGVydmlzb3IgZG9lc24ndCBzdXBwb3J0IHRoaXMgdmVyc2lvbiku
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pg0KPj4gLS0tDQo+PiBWMToNCj4+IC0gdXNlIGEgZG9tY3RsIHN1Ym9wIGZvciB0aGUgbmV3
IGludGVyZmFjZSAoSmFuIEJldWxpY2gpDQo+IA0KPiBKdXN0IGFzIGEgcHJlbGltaW5hcnkg
cmVwbHk6IFdpdGggQW5kcmV3J3Mgc3RhYmlsaXphdGlvbiBwbGFucyBJJ20gbm90DQo+IHN1
cmUgdGhpcywgaW4gcGFydGljdWxhciBpbmNsdWRpbmcgLi4uDQo+IA0KPj4gQEAgLTEyMzYs
NyArMTIzNywzNyBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9kdF9vdmVybGF5IHsNCj4+ICAgfTsN
Cj4+ICAgI2VuZGlmDQo+PiAgIA0KPj4gKy8qDQo+PiArICogWEVOX0RPTUNUTF9nZXRfZG9t
YWluX3N0YXRlIChzdGFibGUgaW50ZXJmYWNlKQ0KPj4gKyAqDQo+PiArICogR2V0IHN0YXRl
IGluZm9ybWF0aW9uIG9mIGEgZG9tYWluLg0KPj4gKyAqDQo+PiArICogSW4gY2FzZSBkb21h
aW4gaXMgRE9NSURfSU5WQUxJRCwgcmV0dXJuIGluZm9ybWF0aW9uIGFib3V0IGEgZG9tYWlu
IGhhdmluZw0KPj4gKyAqIGNoYW5nZWQgc3RhdGUgYW5kIHJlc2V0IHRoZSBzdGF0ZSBjaGFu
Z2UgaW5kaWNhdG9yIGZvciB0aGF0IGRvbWFpbi4gVGhpcw0KPj4gKyAqIGZ1bmN0aW9uIGlz
IHVzYWJsZSBvbmx5IGJ5IGEgZG9tYWluIGhhdmluZyByZWdpc3RlcmVkIHRoZSBWSVJRX0RP
TV9FWEMNCj4+ICsgKiBldmVudCAobm9ybWFsbHkgWGVuc3RvcmUpLg0KPj4gKyAqDQo+PiAr
ICogU3VwcG9ydGVkIGludGVyZmFjZSB2ZXJzaW9uczogMHgwMDAwMDAwMA0KPj4gKyAqLw0K
Pj4gKyNkZWZpbmUgWEVOX0RPTUNUTF9HRVRET01TVEFURV9WRVJTX01BWCAgICAwDQo+PiAr
c3RydWN0IHhlbl9kb21jdGxfZ2V0X2RvbWFpbl9zdGF0ZSB7DQo+PiArICAgIGRvbWlkX3Qg
ZG9taWQ7DQo+PiArICAgIHVpbnQxNl90IHN0YXRlOw0KPj4gKyNkZWZpbmUgWEVOX0RPTUNU
TF9HRVRET01TVEFURV9TVEFURV9FWElTVCAgICAgMHgwMDAxICAvKiBEb21haW4gaXMgZXhp
c3RpbmcuICovDQo+PiArI2RlZmluZSBYRU5fRE9NQ1RMX0dFVERPTVNUQVRFX1NUQVRFX1NI
VVRET1dOICAweDAwMDIgIC8qIFNodXRkb3duIGZpbmlzaGVkLiAqLw0KPj4gKyNkZWZpbmUg
WEVOX0RPTUNUTF9HRVRET01TVEFURV9TVEFURV9EWUlORyAgICAgMHgwMDA0ICAvKiBEb21h
aW4gZHlpbmcuICovDQo+PiArICAgIHVpbnQzMl90IHBhZDE7ICAgICAgICAgICAvKiBSZXR1
cm5lZCBhcyAwLiAqLw0KPj4gKyAgICB1aW50NjRfdCB1bmlxdWVfaWQ7ICAgICAgLyogVW5p
cXVlIGRvbWFpbiBpZGVudGlmaWVyLiAqLw0KPj4gKyAgICB1aW50NjRfdCBwYWQyWzZdOyAg
ICAgICAgLyogUmV0dXJuZWQgYXMgMC4gKi8NCj4+ICt9Ow0KPj4gKw0KPj4gICBzdHJ1Y3Qg
eGVuX2RvbWN0bCB7DQo+PiArLyoNCj4+ICsgKiBTdGFibGUgZG9tY3RsIG9wczoNCj4+ICsg
KiBpbnRlcmZhY2VfdmVyc2lvbiBpcyBwZXIgY21kLCBoeXBlcnZpc29yIGNhbiBzdXBwb3J0
IG11bHRpcGxlIHZlcnNpb25zDQo+PiArICogYW5kIHdpbGwgcmV0dXJuIHVzZWQgdmVyc2lv
biAoYXQgbWF4IGNhbGxlciBzdXBwbGllZCB2YWx1ZSkgaW4NCj4+ICsgKiBpbnRlcmZhY2Vf
dmVyc2lvbiBvbiByZXR1cm4uDQo+PiArICovDQo+IA0KPiAuLi4gdGhpcyAoYWIpdXNlIG9m
IHRoZSBpbnRlcmZhY2UgdmVyc2lvbiwgaXMgdGhlIHdheSB0byBnby4gSSB0aGluaw0KPiB3
ZSB3YW50IGEgYnJhbmQgbmV3IGh5cGVyY2FsbCwgd2l0aCBzdGFiaWxpdHkganVzdCBsaWtl
IG1vc3Qgb3RoZXINCj4gaHlwZXJjYWxscyBoYXZlIGl0LiBCYWNrd2FyZHMtaW5jb21wYXRp
YmxlIGludGVyZmFjZSBjaGFuZ2VzIHRoZW4NCj4gc2ltcGx5IGFyZW4ndCBhbGxvd2VkIChh
cyBpbjogcmVxdWlyZSBhIG5ldyBzdWItb3AgaW5zdGVhZCkuDQoNCk9rYXksIHNvIGJhY2sg
dG8gbXkgaW5pdGlhbCBSRkMgdmFyaWFudCB0aGVuLiA6LSkNCg0KQW5kcmV3LCBjYW4geW91
IGNvbmZpcm0geW91J2QgcHJlZmVyIHRoYXQgcm91dGU/DQoNCg0KSnVlcmdlbg0K
--------------Os0A5I8ffzdpzARQCqmbNbZ0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Os0A5I8ffzdpzARQCqmbNbZ0--

--------------BpkG8iKnQMpNgdXsm04cr75i--

--------------MYBdebw1B2ki7ZEph0Zy4b6p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcfb1sFAwAAAAAACgkQsN6d1ii/Ey9f
dwf+JdDMUpid52rpHVlLUMK7nj5tmv6/Pg+pfwqk5/9icpoxvE3ULpvsz1VI8vH0nnow3T4EE6gC
ngTTO6xmqTRsvcFifRzE4rwqLU1YHOpmKipaMBsaVOO88Va4+uxPj0X+0Au22MTOtuexPQQJ3kfi
c7J5ku9IGMq9PRMGZz1GYv3A/iAApDTHH8coyX5nBwO1jpZ3/WsWuK9PPPVmHsrmtvfNrKTBU/nk
maZHHm4lRF5BUfHZLWcOEVuUWNVvwOb4elQ1dj+2X0i2osQT0xAQr47UIvYHKiStpZOdMDapPOPk
aBEswkI1uB6VZcOB2DlFhyNry+ERnOszdT2CjqGIFQ==
=XwwR
-----END PGP SIGNATURE-----

--------------MYBdebw1B2ki7ZEph0Zy4b6p--

