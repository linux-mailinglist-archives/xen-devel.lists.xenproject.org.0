Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4786B16342
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 16:59:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064102.1429851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8HJ-0003nT-AR; Wed, 30 Jul 2025 14:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064102.1429851; Wed, 30 Jul 2025 14:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8HJ-0003lo-7Z; Wed, 30 Jul 2025 14:59:37 +0000
Received: by outflank-mailman (input) for mailman id 1064102;
 Wed, 30 Jul 2025 14:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txka=2L=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uh8HH-0003li-Vb
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 14:59:36 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccf6ed6b-6d55-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 16:59:33 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ae3be3eabd8so253339066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 07:59:32 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635aa21fcsm765893666b.95.2025.07.30.07.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 07:59:31 -0700 (PDT)
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
X-Inumbo-ID: ccf6ed6b-6d55-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753887572; x=1754492372; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oPDBLERfkA4lbiqRwmi7KaY9B0MOhKij5g/x11UQV3c=;
        b=CvQWb2HySxCjjzdDuDUOKayGQkaoNsmWBNdKQljXcABKQJrtV+VYx73NwVsuwx7bEV
         uY4o5+a9QPEveYp7UbJ14GcO1hlrHhD9jCBf6Tvpk894WCUggqUom2g7UDhRbfObzhbI
         cPZjQl2wsfZzWyhQEioLscyEfBj9XAfacs2EVaoDHowFtAf2qaF5phLEkuEDda/B/KM4
         0orD+XESkLFTL5BtYDOutumGOTNBNkPJLzTiMAfBv5ZJVEvfnrdha+Y7dJcXZCCoXQoE
         8gnWk74C/LUh30VX3o5NzW3x2M1WcCrUPpRfoqxd2WR016usICT/JP/oSJeDcx40cFUF
         bc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753887572; x=1754492372;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oPDBLERfkA4lbiqRwmi7KaY9B0MOhKij5g/x11UQV3c=;
        b=f30uMrGlHmzphtk4Xu93FrG6wosYLqNpYNEeKAnCLqu+12oz0sSKTpiTyukUO1dAE5
         /HSfA2p+BHLWxYpFPfK0NR7oKfGz6rZX48QxsqHxqL07S4gKdA3aW7fDMhIjlc4qUN5l
         uQeasg3sh7VkE1cPCQR/rT5CLOGscpEj6U5MljmvXub//vcexQWmDbOqAapCcBgmlYXH
         9153nwL/0u6GNa8cKr10Hj1VuMOmExoj492RtYXGkKSqSAL5vdtq1kFS718LjcTT4768
         MJFwfsJkWDBkR/ablFV1VU20JrDAxGgTsDbNN8GcASxoC6XpDeogKtq3oIshN4HgeKD8
         Cycg==
X-Forwarded-Encrypted: i=1; AJvYcCXK7cm7Wh7hMnW78zxJc3wuDJ5NVAtuORTefgXhWhtbf++7LZ7lH8PE/rJrChGJwTdaAHGAQcuASoM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSjA+6HPVk+KMSUBq6uLzbCaJ6UCoh//ple+OVGw09oe2ySk4L
	oxsi1A8O+xqBrcdhQueb4sQEJijPZ4RfIYepYzgZnk3vMBi1waqGQ5KZVH3YBmEjpNI=
X-Gm-Gg: ASbGncvNeGwKFXT5txLHWucUeU0ABnO7KoofNg4kL9JJLfOSYkDiojHaTRNlxlKdNN1
	Tmau+rXh4xXQnr4SecGh3lyucX3N5H9hW89/19n/kjgqrLstM50zJ6++Tq8iWupDj2pR6EJXYS5
	IxyevS9X3eGAbGWMD4F5TgXfA3QI2q6movhHOvs/X0nkffWMcmTT9xtstbCfdcVG1DripGOhRrD
	g1siqBGbGVYJMtyaw5MPLs3xbpidHLXD84SWxf+tqWoblwfoCYYrn5EHnR2OJ9gO7mHJ06q01Fc
	MvtITzbSoK4nz0wK3J237wxOIhol+YKdYMZHR2hQs8xIHVXVMQ8A+TgtteXcwwab9NwSaO0wVQy
	Gfnb14XGVa/ImNqFNIkOEszHmDttWnTrSbP7XGS7HwZN6F7R+eYAtngtRpUR7YR79i3s6Mqh2Ky
	ZBr6+eww0dV/coC1HnwPoxy8FH7rmZlIBOgRXIiqU/zXCwGGKjcf8D
X-Google-Smtp-Source: AGHT+IHL/AP4AkottVV8IZSbpKeLIwNYuRH4w86f9//WBnGt/PdTeO9GGbIaDuLlnqEEmu6YPJ4nYw==
X-Received: by 2002:a17:906:d555:b0:af2:31a9:c981 with SMTP id a640c23a62f3a-af8fd353894mr438908066b.23.1753887572082;
        Wed, 30 Jul 2025 07:59:32 -0700 (PDT)
Message-ID: <c2575150-9a78-40c6-a457-eac9827748c7@suse.com>
Date: Wed, 30 Jul 2025 16:59:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] xenstored: use fread() instead of mmap() for
 reading live update state
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250730122305.4050-1-jgross@suse.com>
 <20250730122305.4050-2-jgross@suse.com>
 <91a50d1d-44fd-436c-a5a6-7641a7f5cd1a@suse.com>
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
In-Reply-To: <91a50d1d-44fd-436c-a5a6-7641a7f5cd1a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VUgo4YTeSq9i3oICZHRYiveS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VUgo4YTeSq9i3oICZHRYiveS
Content-Type: multipart/mixed; boundary="------------iyM4JiXs00thovB1Wy5fbdhS";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 xen-devel@lists.xenproject.org
Message-ID: <c2575150-9a78-40c6-a457-eac9827748c7@suse.com>
Subject: Re: [PATCH v3 1/9] xenstored: use fread() instead of mmap() for
 reading live update state
References: <20250730122305.4050-1-jgross@suse.com>
 <20250730122305.4050-2-jgross@suse.com>
 <91a50d1d-44fd-436c-a5a6-7641a7f5cd1a@suse.com>
In-Reply-To: <91a50d1d-44fd-436c-a5a6-7641a7f5cd1a@suse.com>
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

--------------iyM4JiXs00thovB1Wy5fbdhS
Content-Type: multipart/mixed; boundary="------------0CjRwpcvQBFx5diEnFD4bFpk"

--------------0CjRwpcvQBFx5diEnFD4bFpk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDcuMjUgMTY6MzgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wNy4yMDI1
IDE0OjIyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gTWluaS1PUyBkb2Vzbid0IHN1cHBv
cnQgdXNpbmcgbW1hcCgpIGZvciBhY2Nlc3NpbmcgYSBmaWxlLiBJbiBvcmRlcg0KPj4gdG8g
c3VwcG9ydCByZWFkaW5nIHRoZSBsaXZlIHVwZGF0ZSBzdGF0ZSBmcm9tIGEgOXBmcyBiYXNl
ZCBmaWxlLCB1c2UNCj4+IGZyZWFkKCkgaW5zdGVhZCBvZiBtbWFwKCkuDQo+Pg0KPj4gV2hp
bGUgYWRkaW5nIHRoZSBvZmZzZXQgbWVtYmVyIHRvIGx1X3N0YXRlLCBjaGFuZ2UgdGhlIHR5
cGUgb2YgInNpemUiDQo+PiB0byBzaXplX3QgaW4gb3JkZXIgdG8gYXZvaWQgcHJvYmxlbXMg
d2l0aCBzdGF0ZSBleGNlZWRpbmcgNEdCLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBKYXNvbiBBbmRy
eXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQo+PiAtLS0NCj4+IFYyOg0KPj4gLSBtb3Zl
IHRvIHN0YXJ0IG9mIHNlcmllcw0KPj4gVjM6DQo+PiAtIGNoYW5nZSBvZmZzZXQgdG8gb2Zm
NjRfdCBhbmQgc2l6ZSB0byBzaXplX3QgKEFuZHJldyBDb29wZXIpDQo+IA0KPiBXYXNuJ3Qg
dGhhdCBtZWFudCB0byBhbHNvIGNvdmVyIC4uLg0KPiANCj4+IC0tLSBhL3Rvb2xzL3hlbnN0
b3JlZC9sdS5jDQo+PiArKysgYi90b29scy94ZW5zdG9yZWQvbHUuYw0KPj4gQEAgLTI3LDkg
KzI3LDExIEBAIHN0cnVjdCBsaXZlX3VwZGF0ZSAqbHVfc3RhdHVzOw0KPj4gICANCj4+ICAg
c3RydWN0IGx1X2R1bXBfc3RhdGUgew0KPj4gICAJdm9pZCAqYnVmOw0KPj4gLQl1bnNpZ25l
ZCBpbnQgc2l6ZTsNCj4+IC0JaW50IGZkOw0KPj4gKwl1bnNpZ25lZCBpbnQgYnVmX3NpemU7
DQo+IA0KPiAuLi4gdGhpcyBmaWVsZD8NCg0KQXMgdGhpcyBidWZmZXIgaXMgZm9yIGEgc2lu
Z2xlIHN0YXRlIHJlY29yZCBvbmx5LCBhbiB1bnNpZ25lZCBpbnQgaXMNCmFsd2F5cyBlbm91
Z2guIFRoZSByZWNvcmQgaGVhZGVyIGlzIHVzaW5nIHVpbnQzMl90IGZvciB0aGUgcmVjb3Jk
IGxlbmd0aC4NCg0KDQpKdWVyZ2VuDQo=
--------------0CjRwpcvQBFx5diEnFD4bFpk
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

--------------0CjRwpcvQBFx5diEnFD4bFpk--

--------------iyM4JiXs00thovB1Wy5fbdhS--

--------------VUgo4YTeSq9i3oICZHRYiveS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiKM1IFAwAAAAAACgkQsN6d1ii/Ey86
mAf9E9F+bodmiBtNiRl/tdyA/u2dQp0G4TA46eBWe165T9U3QC1RoDTsZm7xBJKhXtY53Z5S3Erx
yPl0mPV/L7lItB6EdaQnCreYPpTGCuU4c5n8V9uBzMmcykEhg0HVXf4rR1XRyrqWtQYlRc5G+5q+
96doDqAMcvurW3QAw43nOQQRLFv4JIaPKReiTxM+5XFXMN5btT+O8CgdVRzWuFLPrH6HpXv8GFUc
uwvcnGuFDK8zS39RU/5HU+Dj8BVy0XQMBvuh+N9uREk4OT7ZbZZ1Zyd7iwz2qwrtgAxN8g91Ojjf
gU1o71FJhjW0bLplN+kqPq/seABc8tpspzH9eQUbZQ==
=bpSN
-----END PGP SIGNATURE-----

--------------VUgo4YTeSq9i3oICZHRYiveS--

