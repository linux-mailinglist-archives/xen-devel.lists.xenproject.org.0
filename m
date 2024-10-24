Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCCB9AE70F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 15:59:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825325.1239528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3yMk-0007GL-B0; Thu, 24 Oct 2024 13:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825325.1239528; Thu, 24 Oct 2024 13:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3yMk-0007E7-8K; Thu, 24 Oct 2024 13:59:06 +0000
Received: by outflank-mailman (input) for mailman id 825325;
 Thu, 24 Oct 2024 13:59:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MNKq=RU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t3yMi-0007Dz-Qa
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 13:59:04 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ffc0816-9210-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 15:59:02 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c99be0a4bbso1202348a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 06:59:02 -0700 (PDT)
Received: from ?IPV6:2a00:20:700c:1cc7:2574:2fb8:b074:8405?
 ([2a00:20:700c:1cc7:2574:2fb8:b074:8405])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912d623fsm622998066b.9.2024.10.24.06.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2024 06:59:01 -0700 (PDT)
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
X-Inumbo-ID: 1ffc0816-9210-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729778342; x=1730383142; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AszfcqI1NSStMYVMcgHs2bTARDH+mBR1aaXUhjQr/pU=;
        b=AlQoqQr45Vl0otS4Ym7CyDAITWC5PMXC+Oyhp3LZfTSTIMmS4tGAHEIJsuxnQ82p5J
         8i1NdtJ7qnXjVcHv6xpdP97iR7ECXYA9t1Vof+VAvfLGRDFlu4SwIeza4y28Ctc6nXEZ
         lgpFcz/LkyTMPLsNcg4liu82F42bw4IUAhK/4dj4QStjW2m2WNKKCfTCqQ0r2wfEizR4
         lwwel4cEONE1WK64wy6mEcNdykq0FajG0bGwZN+hRd5sALiuqV6vJ4GOM5RcVHKYqwfx
         54fnOsx5jvgWgtoOS4NtOl3+1ct7IgIzBBOtFZUtpfqI13kgB8jHy6ElOt0W5MGKmS49
         DPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729778342; x=1730383142;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AszfcqI1NSStMYVMcgHs2bTARDH+mBR1aaXUhjQr/pU=;
        b=b/mtU4VetvPD2cJIMWENNm+gPpC4tg3hX0DsLCjcp7fouKPIYJrJXJeaOILXsEhXN9
         ufViMmWWmgnRn0K3q4qfqIbPwfQY2opVvvC5PU/qFiAS2FZIhdfE6VKb7wll5l6GlxlO
         EM6fiZDnSTFoZrFdYxUIxczgetJj2Q01JClkREvcbjt9dEMC0LTHIPdPRM1Iuhd9mbsX
         OwsSvWdIh5bgTTDXgklEp/vzbczhIxpqS+DG0byy1hfD7vooOW4eHhJMF4YT/GViHK3v
         zbN/FeR5/h1NzLxq+RA/M8/tX6txyM3ttjeyzPiPgv64JXkcprbzF+Ay9XraKREssy6K
         QvOw==
X-Forwarded-Encrypted: i=1; AJvYcCXA8hyGlywNHEzerEjjGRhZSJxq0v7G5UbeJLxKttlygHbh7qHv0jp8bTZaLm3waOG5ja0NnxFBaiQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNUl6nAlUn37QYJQvt5IcspfetCUJtPiCTy0c/xJfMYf6FJUhG
	2x0aNxAniumnStHr1VoAuPso6fB4GiU/QXsYzOPXc7zM27uyfzRQ/rouSqVoKDg=
X-Google-Smtp-Source: AGHT+IHySpb/oatk/vzI3+c2XdsFX6d7szWwRP0HxuAtZhC4FVWJdX8MxH3ltiqDimZ9ME+GpQZwgA==
X-Received: by 2002:a17:907:7205:b0:a9a:3dc0:8911 with SMTP id a640c23a62f3a-a9abf875a83mr685193566b.16.1729778341884;
        Thu, 24 Oct 2024 06:59:01 -0700 (PDT)
Message-ID: <9fe53856-725c-4f7b-88a7-9e564bf7b997@suse.com>
Date: Thu, 24 Oct 2024 15:59:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen: add new domctl get_changed_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-4-jgross@suse.com>
 <ea2aeed1-91b7-47db-9354-d0634d0db9e8@apertussolutions.com>
 <9a049e23-471f-4987-9993-e5f2db60ac1f@suse.com>
 <fa78a4f7-4b2e-46e2-8110-868735892fae@apertussolutions.com>
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
In-Reply-To: <fa78a4f7-4b2e-46e2-8110-868735892fae@apertussolutions.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GXI0HAWFsCssZxiwUSqGWVHF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GXI0HAWFsCssZxiwUSqGWVHF
Content-Type: multipart/mixed; boundary="------------MfGaL0YybK0Ya05ivLVuDFy8";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <9fe53856-725c-4f7b-88a7-9e564bf7b997@suse.com>
Subject: Re: [PATCH 3/6] xen: add new domctl get_changed_domain
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-4-jgross@suse.com>
 <ea2aeed1-91b7-47db-9354-d0634d0db9e8@apertussolutions.com>
 <9a049e23-471f-4987-9993-e5f2db60ac1f@suse.com>
 <fa78a4f7-4b2e-46e2-8110-868735892fae@apertussolutions.com>
In-Reply-To: <fa78a4f7-4b2e-46e2-8110-868735892fae@apertussolutions.com>
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

--------------MfGaL0YybK0Ya05ivLVuDFy8
Content-Type: multipart/mixed; boundary="------------oHqYx0i4GsPK5GKmJcR2miZT"

--------------oHqYx0i4GsPK5GKmJcR2miZT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTAuMjQgMTU6MzUsIERhbmllbCBQLiBTbWl0aCB3cm90ZToNCj4gT24gMTAvMjQv
MjQgMDU6MTMsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAyMy4xMC4yNCAxNzo1NSwg
RGFuaWVsIFAuIFNtaXRoIHdyb3RlOg0KPj4+IE9uIDEwLzIzLzI0IDA5OjEwLCBKdWVyZ2Vu
IEdyb3NzIHdyb3RlOg0KPj4+PiBBZGQgYSBuZXcgZG9tY3RsIHN1Yi1mdW5jdGlvbiB0byBn
ZXQgZGF0YSBvZiBhIGRvbWFpbiBoYXZpbmcgY2hhbmdlZA0KPj4+PiBzdGF0ZSAodGhpcyBp
cyBuZWVkZWQgYnkgWGVuc3RvcmUpLg0KPj4+Pg0KPj4+PiBUaGUgcmV0dXJuZWQgc3RhdGUg
anVzdCBjb250YWlucyB0aGUgZG9taWQsIHRoZSBkb21haW4gdW5pcXVlIGlkLA0KPj4+PiBh
bmQgc29tZSBmbGFncyAoZXhpc3RpbmcsIHNodXRkb3duLCBkeWluZykuDQo+Pj4+DQo+Pj4+
IEluIG9yZGVyIHRvIGVuYWJsZSBYZW5zdG9yZSBzdHViZG9tIGJlaW5nIGJ1aWx0IGZvciBt
dWx0aXBsZSBYZW4NCj4+Pj4gdmVyc2lvbnMsIG1ha2UgdGhpcyBkb21jdGwgc3RhYmxlLsKg
IEZvciBzdGFibGUgZG9tY3RscyB0aGUNCj4+Pj4gaW50ZXJmYWNlX3ZlcnNpb24gaXMgc3Bl
Y2lmaWMgdG8gdGhlIHJlc3BlY3RpdmUgZG9tY3RsIG9wIGFuZCBpdCBpcyBhbg0KPj4+PiBp
bi9vdXQgcGFyYW1ldGVyOiBPbiBpbnB1dCB0aGUgY2FsbGVyIGlzIHNwZWNpZnlpbmcgdGhl
IGRlc2lyZWQgdmVyc2lvbg0KPj4+PiBvZiB0aGUgb3AsIHdoaWxlIG9uIG91dHB1dCB0aGUg
aHlwZXJ2aXNvciB3aWxsIHJldHVybiB0aGUgdXNlZCB2ZXJzaW9uDQo+Pj4+ICh0aGlzIHdp
bGwgYmUgYXQgbWF4IHRoZSBjYWxsZXIgc3VwcGxpZWQgdmVyc2lvbiwgYnV0IG1pZ2h0IGJl
IGxvd2VyIGluDQo+Pj4+IGNhc2UgdGhlIGh5cGVydmlzb3IgZG9lc24ndCBzdXBwb3J0IHRo
aXMgdmVyc2lvbikuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IFYxOg0KPj4+PiAtIHVzZSBhIGRv
bWN0bCBzdWJvcCBmb3IgdGhlIG5ldyBpbnRlcmZhY2UgKEphbiBCZXVsaWNoKQ0KPj4+PiAt
LS0NCj4+Pj4gwqAgdG9vbHMvZmxhc2svcG9saWN5L21vZHVsZXMvZG9tMC50ZcKgIHzCoCAy
ICstDQo+Pj4+IMKgIHhlbi9jb21tb24vZG9tYWluLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDUxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+IMKg
IHhlbi9jb21tb24vZG9tY3RsLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDE5ICsrKysrKysrKystDQo+Pj4+IMKgIHhlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5jwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCA5ICsrKystDQo+Pj4+IMKgIHhlbi9pbmNsdWRlL3B1Ymxp
Yy9kb21jdGwuaMKgwqDCoMKgwqDCoMKgwqAgfCAzMyArKysrKysrKysrKysrKysrKysrDQo+
Pj4+IMKgIHhlbi9pbmNsdWRlL3hlbi9ldmVudC5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCA2ICsrKysNCj4+Pj4gwqAgeGVuL2luY2x1ZGUveGVuL3NjaGVkLmjCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDIgKysNCj4+Pj4gwqAgeGVuL2luY2x1ZGUveHNtL2R1bW15
LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDggKysrKysNCj4+Pj4gwqAgeGVuL2lu
Y2x1ZGUveHNtL3hzbS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNiArKysr
DQo+Pj4+IMKgIHhlbi94c20vZHVtbXkuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDEgKw0KPj4+PiDCoCB4ZW4veHNtL2ZsYXNrL2hvb2tzLmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA3ICsrKysNCj4+Pj4gwqAgeGVuL3hzbS9m
bGFzay9wb2xpY3kvYWNjZXNzX3ZlY3RvcnMgfMKgIDIgKysNCj4+Pj4gwqAgMTIgZmlsZXMg
Y2hhbmdlZCwgMTQzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+
IGRpZmYgLS1naXQgYS90b29scy9mbGFzay9wb2xpY3kvbW9kdWxlcy9kb20wLnRlIA0KPj4+
PiBiL3Rvb2xzL2ZsYXNrL3BvbGljeS9tb2R1bGVzL2RvbTAudGUNCj4+Pj4gaW5kZXggMTZi
OGM5NjQ2ZC4uNjA0M2MwMWIxMiAxMDA2NDQNCj4+Pj4gLS0tIGEvdG9vbHMvZmxhc2svcG9s
aWN5L21vZHVsZXMvZG9tMC50ZQ0KPj4+PiArKysgYi90b29scy9mbGFzay9wb2xpY3kvbW9k
dWxlcy9kb20wLnRlDQo+Pj4+IEBAIC00MCw3ICs0MCw3IEBAIGFsbG93IGRvbTBfdCBkb20w
X3Q6ZG9tYWluIHsNCj4+Pj4gwqAgfTsNCj4+Pj4gwqAgYWxsb3cgZG9tMF90IGRvbTBfdDpk
b21haW4yIHsNCj4+Pj4gwqDCoMKgwqDCoCBzZXRfY3B1X3BvbGljeSBnZXR0c2Mgc2V0dHNj
IHNldHNjaGVkdWxlciBzZXRfdm51bWFpbmZvDQo+Pj4+IC3CoMKgwqAgZ2V0X3ZudW1haW5m
byBwc3JfY210X29wIHBzcl9hbGxvYyBnZXRfY3B1X3BvbGljeQ0KPj4+PiArwqDCoMKgIGdl
dF92bnVtYWluZm8gcHNyX2NtdF9vcCBwc3JfYWxsb2MgZ2V0X2NwdV9wb2xpY3kgZ2V0X2Rv
bWFpbl9zdGF0ZQ0KPj4+DQo+Pj4gSSBkb24ndCB0aGluayB0aGF0IGlzIHdoZXJlIHlvdSB3
YW50IGl0LCBhcyB0aGF0IHJlc3RyaWN0cyBkb20wIHRvIG9ubHkgYmVpbmcgDQo+Pj4gYWJs
ZSB0byBtYWtlIHRoYXQgY2FsbCBhZ2FpbnN0IGRvbTAuIFRoZSBxdWVzdGlvbiBJIGhhdmUg
aXMsIGFyZSB5b3UgbG9va2luZyANCj4+PiBmb3IgdGhpcyBwZXJtaXNzaW9uIHRvIGJlIGV4
cGxpY2l0bHkgYXNzaWduZWQgdG8gZG9tMCBvciB0byB0aGUgZG9tYWluIHR5cGUgDQo+Pj4g
dGhhdCB3YXMgYWxsb3dlZCB0byBjcmVhdGUgdGhlIGRvbWFpbi4gSU1ITywgSSB0aGluayB5
b3Ugd291bGQgd2FudCB0aGUgDQo+Pj4gbGF0dGVyLCBzbyBub3Qgb25seSBzaG91bGQgdGhl
IHBlcm1pc3Npb24gZ28gaGVyZSwgYnV0IGFsc28gYWRkZWQgdG8gDQo+Pj4geGVuLmlmOmNy
ZWF0ZV9kb21haW5fY29tbW9uLg0KPj4+DQo+Pj4gQWRkaXRpb25hbGx5LCBJIHdvdWxkIGFs
c28gcmVjb21tZW5kIGFkZGluZyB0aGUgZm9sbG93aW5nIHRvIHhlbnN0b3JlLnRlOg0KPj4+
DQo+Pj4gYWxsb3cgeGVuc3RvcmVfdCBkb21haW5fdHlwZTpkb21haW4gZ2V0X2RvbWFpbl9z
dGF0ZQ0KPj4NCj4+IE9rYXksIGJ1dCBzaG91bGRuJ3QgdGhpcyBiZToNCj4+DQo+PiBhbGxv
dyB4ZW5zdG9yZV90IGRvbWFpbl90eXBlOmRvbWFpbjIgZ2V0X2RvbWFpbl9zdGF0ZTsNCj4g
DQo+IEFwb2xvZ2llcywgeWVzIHRoYXQgd2FzIGEgdHlwbyBvbiBteSBwYXJ0Lg0KPiANCj4+
Pg0KPj4+PiDCoCBhbGxvdyBkb20wX3QgZG9tMF90OnJlc291cmNlIHsgYWRkIHJlbW92ZSB9
Ow0KPj4+DQo+Pj4gLi4uDQo+Pj4NCj4+Pj4gQEAgLTg2Niw2ICs4NzMsMTYgQEAgbG9uZyBk
b19kb21jdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIA0KPj4+PiB1
X2RvbWN0bCkNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX0hZ
UEVSVklTT1JfZG9tY3RsLCAiaCIsIHVfZG9tY3RsKTsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGJyZWFrOw0KPj4+PiArwqDCoMKgIGNhc2UgWEVOX0RPTUNUTF9nZXRfZG9tYWluX3N0
YXRlOg0KPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0geHNtX2dldF9kb21haW5fc3RhdGUo
WFNNX0hPT0ssIGQpOw0KPj4+DQo+Pj4gWFNNX0hPT0sgd2lsbCBhbGxvdyBhbnkgZG9tYWlu
IHRvIG1ha2UgdGhpcyBjYWxsIG9uIGFueSBkb21haW4uIFdoYXQgSSB0aGluayANCj4+PiB5
b3Ugd2FudCBoZXJlIGlzIFhTTV9YU19QUklWLiBUaGF0IHdpbGwgYWxsb3cgZWl0aGVyIGEg
ZG9tYWluIGZsYWdnZWQgYXMgdGhlIA0KPj4+IHhlbnN0b3JlIGRvbWFpbiBvciBkb20wIHRv
IG1ha2UgdGhlIGNhbGwuDQo+Pg0KPj4gSSB0aG91Z2h0IHNvLCB0b28sIGJ1dCBsb29raW5n
IGF0IHRoZSAiZ2V0ZG9tYWluaW5mbyIgZXhhbXBsZSBpdCBzZWVtcw0KPj4gdG8gYmUgb2th
eSB0aGlzIHdheSwgdG9vLiBFc3BlY2lhbGx5IHdpdGggdGhlIGFkZGl0aW9uIHRvIHhzbV9k
b21jdGwoKQ0KPj4gY2hlY2tpbmcgZm9yIFhTTV9YU19QUklWLg0KPiANCj4gSSBrbm93IHRo
aXMgaGFzIGJlZW4gZG9uZSBpbiB0aGUgcGFzdCwgYnV0IGltaG8gaXQgaXMgbm90IGEgdmVy
eSBnb29kIHByYWN0aWNlLiANCj4gQWNjZXNzIGNoZWNrcyByZWFsbHkgc2hvdWxkIGFsd2F5
cyByZXN0cmljdCBlcXVhbCBvciBkb3duLiBUaGVyZSBzaG91bGQgYmUgYSANCj4gc3Ryb25n
IHJlYXNvbiwgd2hpY2ggcHJvYmFibHkgd291bGQgZGVzZXJ2ZXMgYSBjb2RlIGNvbW1lbnQs
IHRvIGFsbG93IGEgY2hlY2sgdG8gDQo+IHJlbGF4IHVwLiBSZXN0cmljdGluZyBlcXVhbCBz
aG91bGQgbm90IHJlZHVjZSBhY2Nlc3MsIGFuZCBpZiBpdCBkb2VzLCB0aGVuIGl0IA0KPiBt
ZWFucyB0aGVyZSBpcyBhbiB1bmludGVuZGVkIGFjY2VzcyBwYXRoIHdoaWNoIGlzIG5vdyBl
eHBvc2VkLg0KDQpTb3VuZHMgbG9naWNhbC4NCg0KSSdsbCBjaGVjayBpZiBpdCB3b3JrcyB0
aGUgd2F5IHlvdSBhcmUgc3VnZ2VzdGluZy4gSWYgc28sIEknbGwgc2VuZCBhIHBhdGNoDQpm
aXhpbmcgdGhlIGdldGRvbWFpbmluZm8gY2FzZS4NCg0KDQpKdWVyZ2VuDQo=
--------------oHqYx0i4GsPK5GKmJcR2miZT
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------oHqYx0i4GsPK5GKmJcR2miZT--

--------------MfGaL0YybK0Ya05ivLVuDFy8--

--------------GXI0HAWFsCssZxiwUSqGWVHF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcaUqQFAwAAAAAACgkQsN6d1ii/Ey/7
pQf+MIKIwAnwdseh20ygkXZPk4NWSbNfByiWZo6Mtkw1FUKQ/vgHKKSWPpnOHS/UD03Qo2j4gK7X
YXVl4g8WOGHowgbdmTnCa9+Cl2tsdi8wW3yEV9SJoge2QWuhV4Dcp/Zgmr4iQDPNEl0gNKjR6Z/g
DUDRvShvN16WxsZmu5ZzB3DnsZi4ofRBdfJeiYfovoTYSu6qmDQhc0B+G8wraMcEhJq/rUlrKK/0
UXosg0kHTIfRblVV2KpEGgT9dxvbtgKQvmwAfqNWIbnW102Exgg7haG8+S9hMK7q4vwTjoFJ2Eqr
3bFxL7IfTL53mQr/ihzAWKwNrMdoBHtmPHiwVSZSIg==
=0+Sl
-----END PGP SIGNATURE-----

--------------GXI0HAWFsCssZxiwUSqGWVHF--

