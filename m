Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 068CFB13E2C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 17:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061696.1427288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugPiv-0004UT-9K; Mon, 28 Jul 2025 15:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061696.1427288; Mon, 28 Jul 2025 15:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugPiv-0004Rb-5K; Mon, 28 Jul 2025 15:25:09 +0000
Received: by outflank-mailman (input) for mailman id 1061696;
 Mon, 28 Jul 2025 15:25:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERLN=2J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugPiu-0004Ck-DX
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 15:25:08 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b1df558-6bc7-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 17:25:07 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ae360b6249fso797652366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 08:25:07 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af6358b052bsm437878566b.57.2025.07.28.08.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 08:25:06 -0700 (PDT)
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
X-Inumbo-ID: 0b1df558-6bc7-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753716307; x=1754321107; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dKIVbBUTQMc5GUkreyjAFSIykq9LqwWvOFXZezY6wFE=;
        b=PymywNN3Ak40x5iXW5k5CQJAjmrtunrYtDaLNUlpZabo7cUfbzMkHHlvUgPpDafF/G
         k6QNZJsYGYulxlhWyx+yv0aF0gwzC+eyy5xcEGIj4wP+ivIqEGWYaHlKBOrrfK7nuRP/
         4tqC3Q0TiXxBEp0kwwTzZN3DI8w4zprS3SpgfLB0jTsO5DabWueWgjHDqT/N7Ggxs52L
         O1vxXcGjePypsuVHqf5FvShCm7/Qy6X8z2CNfX4WTJNrVO6Y6jcLM1kmEOwJKL3gnbf8
         VP2RlUxAa6a8BwNrwGqXb6mXDV6PRAlYfC6nqnLFsohnfiuD+4MXavY9zhXaAtRBdzHR
         odrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753716307; x=1754321107;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dKIVbBUTQMc5GUkreyjAFSIykq9LqwWvOFXZezY6wFE=;
        b=JFuNwuWAt5PHsZ/+Oz8iBj4dSfUiXEyfsmLBcAQ/bVmCr1f27P0jxb17IP+LMoqy9l
         TwGYpatfnVwKR1yIN3umpBo4QCPNYdl0y500+YpOcvj8yaA2WOxjgZ6rM5c3MFA4FrWe
         oepWMIdk3ekdOWeKA1fjojmHFQvdG0xkdBR+oNzJQcglp7jqOVLvtGROgGD3s70ziVgG
         yuqKrVgmIHhl6ZMNYAjn1wj0mF4De4K8MNIlp32eWdLNP/SZfD+soxR07o7erzfHvSoN
         nO4wdiYsNQFLBCn0iO5Q2zbPWKarWVQcw8VxW0BDZUFAelhXBFVRItLaULCofL0bd56k
         ju1g==
X-Forwarded-Encrypted: i=1; AJvYcCXs2ufmsTu4p0CaNtngIZnlmRlQ0cKLXEbzBWeT4dmD0q4QNOYYDgv0GEiIjN5zrp94QFKaXGEjQp8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypV/5nFrQYeM2TWLRXgfb2uvTE9dUeNg2CYEBRhWIBbmbgJ1Z+
	vggDy7Vh75uxxaqNirdRDYRp953ULqtzgf9i2AEm+ghjlneAUn2b0PTE4pYXT8sFqOg=
X-Gm-Gg: ASbGncvDaJUjmnQJsStdbk9p0SPsDOp8EpvYyMrXmf/c0eHReCZU1qrPVWdd+ZroxQR
	AMDgjjSvj5pc+YlVv/lM++6dMPHOl7fwhulvwxEsw1HPL7W8qo/tY6DMz8kNVe6loxivwQdKeEN
	WPinzsVm9yTZZHwwb6AX807mkeyIQTkEQPuABtK5tzd10xXpnYdZd7dLGB8LI7ILJOuSQMMxkNE
	HhSse/OkU9GzYKJKBuoTD2zLlW0yI9ZEeb9UmOTplPTV2pNzONlxBmY8XujryBRxJXN/ewFxU/N
	YOfsvqNt3yol4tQ1kzPtazNBAdO5XSsEtcTDGypTokMPc+KsDxmsy9Vu1Ro7Xcx1A9pXaymZXG9
	c1Jze7p3pz8y2lqBzSAVxX9dCVJ5+OGC3pBZGWH10j7Waiatv4swnawmB865uAiZAnv0XYDuHDv
	uLxDdTo7Bd63NVZr9ObKcLThuT87h3oMX/sBYtVMhRxUYHxLr+RXYT
X-Google-Smtp-Source: AGHT+IEYzxH58xBWZfHsP5d/nXRe5D9n5km/EbZtZLWoUNjEwpZ0gismBh1iWzyCJiqeUSRbbcQm5w==
X-Received: by 2002:a17:907:6d18:b0:aec:4ba4:7893 with SMTP id a640c23a62f3a-af61c4bd82bmr1162452966b.2.1753716307057;
        Mon, 28 Jul 2025 08:25:07 -0700 (PDT)
Message-ID: <dee78b61-5432-4096-a9fe-ce554ee88a0d@suse.com>
Date: Mon, 28 Jul 2025 17:25:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 2/2] x86: don't use a memory page for mapping the
 shared info page
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250708063738.18994-1-jgross@suse.com>
 <20250708063738.18994-3-jgross@suse.com>
 <d3934ed6-09c5-4bd1-b7a2-fb3f5725d0dd@suse.com>
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
In-Reply-To: <d3934ed6-09c5-4bd1-b7a2-fb3f5725d0dd@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BcnZvHmXBzOoMs0Ui70Oq0i2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BcnZvHmXBzOoMs0Ui70Oq0i2
Content-Type: multipart/mixed; boundary="------------c1Lh69cm8aAxQYeG0S0s1nxi";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Message-ID: <dee78b61-5432-4096-a9fe-ce554ee88a0d@suse.com>
Subject: Re: [MINI-OS PATCH 2/2] x86: don't use a memory page for mapping the
 shared info page
References: <20250708063738.18994-1-jgross@suse.com>
 <20250708063738.18994-3-jgross@suse.com>
 <d3934ed6-09c5-4bd1-b7a2-fb3f5725d0dd@suse.com>
In-Reply-To: <d3934ed6-09c5-4bd1-b7a2-fb3f5725d0dd@suse.com>
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

--------------c1Lh69cm8aAxQYeG0S0s1nxi
Content-Type: multipart/mixed; boundary="------------q4b0dmlQxr5fqOiEcq0d20KK"

--------------q4b0dmlQxr5fqOiEcq0d20KK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDcuMjUgMTY6MjEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOC4wNy4yMDI1
IDA4OjM3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvaHlwZXJ2aXNvci5jDQo+
PiArKysgYi9oeXBlcnZpc29yLmMNCj4+IEBAIC0yNyw4ICsyNywxMCBAQA0KPj4gICANCj4+
ICAgI2luY2x1ZGUgPG1pbmktb3Mvb3MuaD4NCj4+ICAgI2luY2x1ZGUgPG1pbmktb3MvbGli
Lmg+DQo+PiArI2luY2x1ZGUgPG1pbmktb3MvZTgyMC5oPg0KPj4gICAjaW5jbHVkZSA8bWlu
aS1vcy9oeXBlcnZpc29yLmg+DQo+PiAgICNpbmNsdWRlIDxtaW5pLW9zL2V2ZW50cy5oPg0K
Pj4gKyNpbmNsdWRlIDxtaW5pLW9zL21tLmg+DQo+PiAgICNpbmNsdWRlIDx4ZW4vbWVtb3J5
Lmg+DQo+PiAgIA0KPj4gICBFWFBPUlRfU1lNQk9MKGh5cGVyY2FsbF9wYWdlKTsNCj4+IEBA
IC0zNyw3ICszOSw4IEBAIEVYUE9SVF9TWU1CT0woaHlwZXJjYWxsX3BhZ2UpOw0KPj4gICAg
ICAgKChzaCktPmV2dGNobl9wZW5kaW5nW2lkeF0gJiB+KHNoKS0+ZXZ0Y2huX21hc2tbaWR4
XSkNCj4+ICAgDQo+PiAgICNpZm5kZWYgQ09ORklHX1BBUkFWSVJUDQo+PiAtZXh0ZXJuIHNo
YXJlZF9pbmZvX3Qgc2hhcmVkX2luZm87DQo+PiArc3RhdGljIHVuc2lnbmVkIGxvbmcgc2hp
bmZvX3BmbjsNCj4+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBzaGluZm9fdmE7DQo+PiAgIA0K
Pj4gICBpbnQgaHZtX2dldF9wYXJhbWV0ZXIoaW50IGlkeCwgdWludDY0X3QgKnZhbHVlKQ0K
Pj4gICB7DQo+PiBAQCAtNjksMTQgKzcyLDE2IEBAIHNoYXJlZF9pbmZvX3QgKm1hcF9zaGFy
ZWRfaW5mbyh2b2lkKQ0KPj4gICB7DQo+PiAgICAgICBzdHJ1Y3QgeGVuX2FkZF90b19waHlz
bWFwIHhhdHA7DQo+PiAgIA0KPj4gKyAgICBzaGluZm9fcGZuID0gZTgyMF9nZXRfcmVzZXJ2
ZWRfcGZucygxKTsNCj4+ICAgICAgIHhhdHAuZG9taWQgPSBET01JRF9TRUxGOw0KPj4gICAg
ICAgeGF0cC5pZHggPSAwOw0KPj4gICAgICAgeGF0cC5zcGFjZSA9IFhFTk1BUFNQQUNFX3No
YXJlZF9pbmZvOw0KPj4gLSAgICB4YXRwLmdwZm4gPSB2aXJ0X3RvX3Bmbigmc2hhcmVkX2lu
Zm8pOw0KPj4gKyAgICB4YXRwLmdwZm4gPSBzaGluZm9fcGZuOw0KPj4gICAgICAgaWYgKCBI
WVBFUlZJU09SX21lbW9yeV9vcChYRU5NRU1fYWRkX3RvX3BoeXNtYXAsICZ4YXRwKSAhPSAw
ICkNCj4+ICAgICAgICAgICBCVUcoKTsNCj4+ICsgICAgc2hpbmZvX3ZhID0gbWFwX2ZyYW1l
X3ZpcnQoc2hpbmZvX3Bmbik7DQo+IA0KPiBJbiB0aGUgUFYgdmFyaWFudCB5b3UgZmlyc3Qg
Y2hlY2sgd2hldGhlciB5b3UgYWxyZWFkeSBoYXZlIGEgVkEuIFdoeSBpcw0KPiB0aGF0IG5l
ZWRlZCB0aGVyZSwgYnV0IG5vdCBoZXJlPyAoT3JpZ2luYWxseSBJIG1lYW50IHRvIGFzayB3
aHkgeW91IGRvbid0DQo+IHVzZSBtYXBfZnJhbWVfdmlydCgpIHRoZXJlIGFzIHdlbGwuKQ0K
DQpHb29kIGNhdGNoLiBJdCBpcyBuZWVkZWQgaGVyZSwgb3RoZXJ3aXNlIHdlJ2xsIGxlYWsg
dGhlIHZpcnR1YWwgcGFnZQ0KZHVyaW5nIGEgc3VzcGVuZC9yZXN1bWUgY3ljbGUuDQoNCj4g
DQo+IFRhbGtpbmcgb2YgbWFwX2ZyYW1lX3ZpcnQoKSAtIEkgdGFrZSBpdCBpdHMgMm5kIHBh
cmFtZXRlciBiZWluZyBuYW1lZA0KPiAibWZuIiBpcyBraW5kIG9mIHN0YWxlIChwcmUtZGF0
aW5nIHRoZSBhZGRpdGlvbiBvZiBQVkggc3VwcG9ydCk/DQoNCkkgdGhpbmsgaXQgd2FzIG1p
c25hbWVkIGJhY2sgdGhlbi4NCg0KPiANCj4+IEBAIC04NCw5ICs4OSwxMSBAQCB2b2lkIHVu
bWFwX3NoYXJlZF9pbmZvKHZvaWQpDQo+PiAgICAgICBzdHJ1Y3QgeGVuX3JlbW92ZV9mcm9t
X3BoeXNtYXAgeHJ0cDsNCj4+ICAgDQo+PiAgICAgICB4cnRwLmRvbWlkID0gRE9NSURfU0VM
RjsNCj4+IC0gICAgeHJ0cC5ncGZuID0gdmlydF90b19wZm4oJnNoYXJlZF9pbmZvKTsNCj4+
ICsgICAgeHJ0cC5ncGZuID0gc2hpbmZvX3BmbjsNCj4+ICAgICAgIGlmICggSFlQRVJWSVNP
Ul9tZW1vcnlfb3AoWEVOTUVNX3JlbW92ZV9mcm9tX3BoeXNtYXAsICZ4cnRwKSAhPSAwICkN
Cj4+ICAgICAgICAgICBCVUcoKTsNCj4+ICsgICAgdW5tYXBfZnJhbWVzKHNoaW5mb192YSwg
MSk7DQo+IA0KPiBCZXR0ZXIgZG8gdGhpcyBhaGVhZCBvZiB0aGUgaHlwZXJjYWxsPw0KDQpB
Z3JlZWQuDQoNCg0KSnVlcmdlbg0K
--------------q4b0dmlQxr5fqOiEcq0d20KK
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

--------------q4b0dmlQxr5fqOiEcq0d20KK--

--------------c1Lh69cm8aAxQYeG0S0s1nxi--

--------------BcnZvHmXBzOoMs0Ui70Oq0i2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiHllIFAwAAAAAACgkQsN6d1ii/Ey+r
Uwf+IocrLOAj4hS6LMNgXTBp7V0e1bj7fJ/Tz76S+LJ9PitdsScvnUkokZAbKKhlIcegSpHF5OES
iQxAdLZ93LIu02svLx4DCFLeo0GDU7TRTaEEk1JGNIohbHSWK5k9XztDTe6WRQkeOPCZcw9K4XQ7
SuGoY1nVYQO2IV6xqUmJ0xaiJak+UGWsmXDEY9MM4JFQy7/iBF27Cwf7GlrZp23y0fVV6hRfl6hk
BG5mRGvF0rOQj0f6fi7Fma6i3bjX8lfHfamc7ysVT2Hxg8GArOA+Ffja1V5G0S+2roABf8prI+d+
5nMgPb/EKKXDNA/8VaHGsAHfqfQ6OdmAUENcUmZlDA==
=rD2F
-----END PGP SIGNATURE-----

--------------BcnZvHmXBzOoMs0Ui70Oq0i2--

