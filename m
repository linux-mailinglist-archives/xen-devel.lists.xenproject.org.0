Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0C2A548A2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 12:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903340.1311248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq8yO-0008KK-VA; Thu, 06 Mar 2025 11:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903340.1311248; Thu, 06 Mar 2025 11:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq8yO-0008Hr-QG; Thu, 06 Mar 2025 11:01:04 +0000
Received: by outflank-mailman (input) for mailman id 903340;
 Thu, 06 Mar 2025 11:01:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tq8yN-0008Hl-Tw
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 11:01:04 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b0f128c-fa7a-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 12:01:02 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-390e3b3d3bcso531680f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 03:01:02 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2399d1237sm74542666b.164.2025.03.06.03.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 03:01:00 -0800 (PST)
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
X-Inumbo-ID: 4b0f128c-fa7a-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741258862; x=1741863662; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FJbEhPs7iQHCq19leLF2Y+g3liPQAiinQojF7dB5/Kc=;
        b=V6JNs4tThoIebbE3z2ZXyX5G9oYZkfKhpdM6q5oeDOmeNCOcwPmdTj+Iqjpe3ytqrk
         8/pv3+w4EILZeB0ytAgZD5LP6kcyJKJaYtvf2/zO1U4wrq8W92Rx0aYgm2hVtEEh7iV6
         YID0I93Pqflr6dwZan7w5XfvwCUBPtl9WYYSkzs3/0q9sxeie5c7WnP+BZ/v0xJlfXJJ
         kPH4OizKBIPGcrxI9PG25ba8twH9YQ2wYklnlhv7yQOrZCRh3jWR67oX5CBtWBQOeYPK
         RduoCOL+12LlWEv/m111a/BvwFmRF//J5TLaiHuMK4P+DYWyl+j4vDp1qg7Z1q0J8snX
         cY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258862; x=1741863662;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJbEhPs7iQHCq19leLF2Y+g3liPQAiinQojF7dB5/Kc=;
        b=tLlN/l4vhbJ0Igw4ONOcIhnDUY5sj8bnZEtDthXuVMX8RUtyY7wWOLUa/5I6IvONx7
         aQrT7dvY1tPgjAK31dS9Zmbm0sM8KNFJrqFZ/BHQXbRobg3yRvmoxeMwrj/VrkUc7gyk
         G12NCXx76FnY8OwijfzOm5YcGa2VTqZjaDlt2VuT/3TZove00NvU0emn/rLyRqK+Lv4b
         mQArNQoV6kwxns4HEJnbOjF/OiXVsVoIJYFRvZIl4/jmPWbNcJFL11uCeQmcTbllXTDE
         9t6PlyZMXCqTw5ldIbucuynwP9B4fFVKjXXVOVJYXgw+AF7lX62vUfi+6mXoz0USvJ9G
         W1rg==
X-Gm-Message-State: AOJu0YxEMHAjiZI9rns7Ii8DVgolqnnOvH3Hx3AQVnveKZ24OV+sMjxp
	sEi3MNnLKhOzZUIBnKBktqN1T8twW/kki9Qgas6/FkjTsob4+KPnCkL+q5QTS2k=
X-Gm-Gg: ASbGncv/bEyJVxf+lzxx/2i6gsUM/L0gommksXHRDFn+jdAJ2q8naNihTs6y77lQgdl
	3ikKECXHM5TU8YLO0YtQYYZFf7fhiaF3NWDaT1ZmZ4poJJse3IfwoOGZPustXRyjWT2rHmJnRDL
	2lXXL3mqRjUfy3NExXcgolPJPrTE8bZRAQdg11MA/LdQfwmO1AusJ37YzFqzVZc30/FR2ad2FhY
	E6VfvIqBwOQvm6PoxhUEMXdeOxLcPRWgw6TRLfvbVcx7r2GvMtI0D4SkT1KI3ZoI2rr+KwcMvPQ
	KqyfRIuKK/908WbMywT/6oFPaM58zCBOT5/7Ke6gmgG9+GcClkaqNG5fJzw9QVQecxkPZ7NQpfJ
	ghmk67RbFHVfuZc4cIeubsj+vG4ZB795v5fmLE7nQKl6JnQ6FTbOFtTzFr2F5MsEZUX4=
X-Google-Smtp-Source: AGHT+IGpiYFS3i2DdEQ8sLCzeykKiTeH1bNdp9aaC6enNVi0S78oZmSVMtOSt0Z8yq6UIEr74GxCNA==
X-Received: by 2002:a5d:5847:0:b0:385:d7f9:f157 with SMTP id ffacd0b85a97d-3911f7adc5emr6287447f8f.36.1741258861057;
        Thu, 06 Mar 2025 03:01:01 -0800 (PST)
Message-ID: <6079fcf9-c1f1-4644-b94f-8c6814aaa862@suse.com>
Date: Thu, 6 Mar 2025 12:00:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: add missing Xenstore commands to xs_wire.h
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20250306082105.17398-1-jgross@suse.com>
 <7ed46917-d551-4439-80b0-27ae295863b1@suse.com>
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
In-Reply-To: <7ed46917-d551-4439-80b0-27ae295863b1@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HWZ0MML3mFtPsi0b6mq6DrIq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HWZ0MML3mFtPsi0b6mq6DrIq
Content-Type: multipart/mixed; boundary="------------vVBtFt4Yqss4AXMNzriy4LZs";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <6079fcf9-c1f1-4644-b94f-8c6814aaa862@suse.com>
Subject: Re: [PATCH] xen/public: add missing Xenstore commands to xs_wire.h
References: <20250306082105.17398-1-jgross@suse.com>
 <7ed46917-d551-4439-80b0-27ae295863b1@suse.com>
In-Reply-To: <7ed46917-d551-4439-80b0-27ae295863b1@suse.com>
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

--------------vVBtFt4Yqss4AXMNzriy4LZs
Content-Type: multipart/mixed; boundary="------------jIaleHZ7X6PGWRU2STw07BVC"

--------------jIaleHZ7X6PGWRU2STw07BVC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDMuMjUgMTE6MjcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4wMy4yMDI1
IDA5OjIxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVGhlIEdFVF9GRUFUVVJFLCBTRVRf
RkVBVFVSRSwgR0VUX1FVT1RBIGFuZCBTRVRfUVVPVEEgWGVuc3RvcmUgY29tbWFuZHMNCj4+
IGFyZSBkZWZpbmVkIGluIGRvY3MvbWlzYy94ZW5zdG9yZS50eHQsIGJ1dCB0aGV5IGFyZSBt
aXNzaW5nIGluDQo+PiB4c193aXJlLmguDQo+Pg0KPj4gQWRkIHRoZSBtaXNzaW5nIGNvbW1h
bmRzIHRvIHhzX3dpcmUuaA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gICB4ZW4vaW5jbHVkZS9wdWJsaWMvaW8v
eHNfd2lyZS5oIHwgNCArKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2lvL3hzX3dpcmUu
aCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby94c193aXJlLmgNCj4+IGluZGV4IDBkOWY0OWFj
ODkuLmU5MmE4N2EwN2IgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaW8v
eHNfd2lyZS5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaW8veHNfd2lyZS5oDQo+
PiBAQCAtMzUsNiArMzUsMTAgQEAgZW51bSB4c2Rfc29ja21zZ190eXBlDQo+PiAgICAgICAv
KiBYU19SRVNUUklDVCBoYXMgYmVlbiByZW1vdmVkICovDQo+PiAgICAgICBYU19SRVNFVF9X
QVRDSEVTID0gWFNfU0VUX1RBUkdFVCArIDIsDQo+PiAgICAgICBYU19ESVJFQ1RPUllfUEFS
VCwNCj4+ICsgICAgWFNfR0VUX0ZFQVRVUkUsDQo+PiArICAgIFhTX1NFVF9GRUFUVVJFLA0K
Pj4gKyAgICBYU19HRVRfUVVPVEEsDQo+PiArICAgIFhTX1NFVF9RVU9UQSwNCj4+ICAgDQo+
PiAgICAgICBYU19UWVBFX0NPVU5ULCAgICAgIC8qIE51bWJlciBvZiB2YWxpZCB0eXBlcy4g
Ki8NCj4gDQo+IFRoaXMgaXMgZWZmZWN0aXZlbHkgZXh0ZW5kaW5nIHRoZSBBQkkgd2l0aCBy
ZXF1ZXN0IHR5cGVzIHRoYXQgYXJlIHJlY29nbml6ZWQNCj4gYnkgbmVpdGhlciBjeGVuc3Rv
cmVkIG5vciBveGVuc3RvcmVkLiBUaGUgYXNzdW1wdGlvbiB0aGVyZWZvcmUgYXBwZWFycyB0
byBiZQ0KPiB0aGF0IG5vIGNsaWVudCB3b3VsZCBoYXZlIHVzZWQgdGhvc2UgdHlwZXMgLyBu
dW1iZXJzIGVpdGhlci4NCg0KWWVzLCBzYW1lIGFzIGUuZy4gd2l0aCBuZXcgaHlwZXJjYWxs
IG51bWJlcnMgb3IgaHlwZXJjYWxsIHN1Yi1vcHRpb25zLg0KDQpBIFhlbnN0b3JlIGltcGxl
bWVudGF0aW9uIG5vdCBrbm93aW5nIGFib3V0IHRob3NlIG5ldyBjb21tYW5kcyB3b3VsZCBy
ZWplY3QNCnRoZW0gKHRoaXMgaXMgdGhlIHJlYXNvbiB3aHkgd2UgZG9uJ3QgbmVlZCBhIGZl
YXR1cmUgYml0IGZvciBuZXcgY29tbWFuZHMsDQphZ2FpbiBzYW1lIGFzIGZvciBuZXcgaHlw
ZXJjYWxscykuDQoNCj4gZG9jcy9taXNjL3hlbnN0b3JlLnR4dCBkb2Vzbid0IHNwZWxsIG91
dCB3aGF0IHRoZSBlbmNvZGluZyBvZiB0aGUgY29tbWFuZHMgaXMNCj4gaW4gdGhlIChiaW5h
cnkpIHJlcHJlc2VudGF0aW9uLg0KDQpJbmRlZWQuIEknbGwgc3Bhd24gYW5vdGhlciBwYXRj
aCBmaXhpbmcgdGhhdC4NCg0KPiBBdCB0aGUgc2FtZSB0aW1lIHRoZSBlZmZlY3Qgb2YgdGhp
cyBjaGFuZ2UgaXMgYSBncm93dGggb2YgY3hlbnN0b3JlZCdzDQo+IHdpcmVfZnVuY3NbXSBh
cnJheSwgYWRkaW5nIGZvdXIgbmlsIGVudHJpZXMuIEx1Y2tpbHkgdGhlIGNvZGUgYWNjZXNz
aW5nIHRoZQ0KPiBhcnJheSBsb29rcyB0byBiZSBwcmVwYXJlZCBmb3Igc3VjaC4gKFN0aWxs
IEkgd29uZGVyIHdoZXRoZXIgdGhlIGFycmF5DQoNClRoaXMgaXNuJ3QgcHVyZSBsdWNrLiBJ
dCB3YXMgZG9uZSBvbiBwdXJwb3NlLiBQbGVhc2Ugbm90ZSB0aGF0IHRoZSBhcnJheQ0KaXMg
c3BhcnNlIGFscmVhZHksIGFzIFhTX1JFU1RSSUNUIGhhcyBiZWVuIHJlbW92ZWQgaW4gdGhl
IHBhc3QgKHRoaXMgaXMNCmV2ZW4gdmlzaWJsZSBpbiB0aGUgY29udGV4dCBhYm92ZSkuDQoN
Cj4gd291bGRuJ3QgYmV0dGVyIGJlIGV4dGVuZGVkIHJpZ2h0IGF3YXksIGJ5IGFkZGluZyBq
dXN0IHRoZSBzdHJpbmdzIHdoaWxlDQo+IGxlYXZpbmcgdGhlIGhhbmRsZXIgZnVuY3Rpb24g
cG9pbnRlcnMgYXQgTlVMTC4pDQoNCk5vLCBJIGRvbid0IHRoaW5rIHNvLiBUaGlzIHNob3Vs
ZCBiZSBkb25lIHdoZW4gaW1wbGVtZW50aW5nIHRoZSBuZXcNCmNvbW1hbmRzLg0KDQo+IFBy
b3ZpZGVkIGFsbCBvZiB0aGUgYWJvdmUgaXMgY29ycmVjdCwNCj4gUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KVGhhbmtzLA0KDQoNCkp1ZXJnZW4N
Cg==
--------------jIaleHZ7X6PGWRU2STw07BVC
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------jIaleHZ7X6PGWRU2STw07BVC--

--------------vVBtFt4Yqss4AXMNzriy4LZs--

--------------HWZ0MML3mFtPsi0b6mq6DrIq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfJgGwFAwAAAAAACgkQsN6d1ii/Ey8u
yQf/cmgR8RNF2B2DBlsjwG0Tqd65PVOzsQTtCFzttURsowtshGfT786sQIwQHZmWt6KRt62BMVwW
Y9ezX3Nbe3GIgKwAX7tIWEUt4/D4VezK/T4+ZCz/yG24W61gLMZngLjHDvdbO04pMWnAJEUSZdi7
T65lG9enk/n7Rv9C/VR963KvvS8tZTuC8tmdWzhwMOcuVq7VIct17jkj3A3k3zu++ycj3xBgXdiH
bxK61h8RLwJs90fvYRU1LzwebJPFxX9ORK3RoxnmM7SQ8v98N3T+T7wLgWTCz5clhm6bbn21Y5qA
x/2rToVgprC1TqvzaNq2Rk5i33JvXhvd8r1d4t2ejA==
=9QrC
-----END PGP SIGNATURE-----

--------------HWZ0MML3mFtPsi0b6mq6DrIq--

