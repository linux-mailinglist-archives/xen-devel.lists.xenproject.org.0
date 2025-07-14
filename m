Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF87B04100
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 16:08:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042875.1412942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubJqz-0005Xo-VH; Mon, 14 Jul 2025 14:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042875.1412942; Mon, 14 Jul 2025 14:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubJqz-0005VK-S8; Mon, 14 Jul 2025 14:08:25 +0000
Received: by outflank-mailman (input) for mailman id 1042875;
 Mon, 14 Jul 2025 14:08:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qtq2=Z3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ubJqy-0005V8-Fi
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 14:08:24 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 009ded8e-60bc-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 16:08:23 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-454f428038eso27907325e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 07:08:23 -0700 (PDT)
Received: from ?IPV6:2003:e5:8709:f00:6357:915b:11f9:6d20?
 (p200300e587090f006357915b11f96d20.dip0.t-ipconnect.de.
 [2003:e5:8709:f00:6357:915b:11f9:6d20])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d50fa9b4sm177292905e9.27.2025.07.14.07.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 07:08:21 -0700 (PDT)
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
X-Inumbo-ID: 009ded8e-60bc-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752502102; x=1753106902; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QbA+OWgZ9xPZ5U6RZZcg7S4Cukk+36MgsP5KzKP8cUw=;
        b=aAePszSVGbmDS/pVD4ZcYyVmYQky7YThHnrVIrOw9wKLxXoFNxYkVYbmQqynQ6AnrJ
         hRy2CdSogf+s8eNdz8oSzkOdva2P4/wEthJMEKDuytZXh6Ju5tNgm+ie5uSxaQcc/2zp
         fLgBp+tbe3sMWKkH8iwTvIfbei48KKpf0FKzroISkl00yqmoTLp8CPMfgP/nNAHMYuP2
         7gGb8++feUdGYt0Ydy8y0RVAvr+eLp4mxgka47X21UFR8l7qd1o8GzMFRXTp/b8Q348U
         NDr1ec0oyH8EqS9dJRADduWmJ9D4qfu5GManvEuRQONlaeZ62NMHuzjG4hq5QKhWT/VG
         kLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752502102; x=1753106902;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QbA+OWgZ9xPZ5U6RZZcg7S4Cukk+36MgsP5KzKP8cUw=;
        b=rB0uygwrUIoLKd3vCuhdNIB7+wsmYEYq2ak0GtMVDYeSX4iQ3FC4NRbHCh4IdVjj7d
         +shU+cH9TtjWCZ0P1wx4JPcZrCXFdi9dJzg4ugqdJXdoGiC/l4ZMU/3t9MdhLB+y8BLq
         8yWqDVglVKnoauIwLbN/cyHtEezfR825X+0wDTA+huTx4z+ywEOplfoo32dzXhrVgbtD
         WpjaAGxwxOb+zWhHqwHq/4rgNK0ENeJRNkD756x3+j3Udl049rdNSGYhC/QTgqTp0EYx
         zB4yEtRDCrLuS1brXXRTJw1soCTAfvYjbum4P4uwcSD+xEbcHZA9oISAhEQ+0D+pJId8
         R+BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCovE3hrvuKZUpuQQK339fjVqs3/PHXKnPHJA3I8xwb+6dY3qXT2/WbfUxUixVHgTWUHhY36NJS6M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyM/jq0q2ouCDN7y9J6lM3HySdR/8W+kdHriO6D2vPrx9y95J4b
	xGgITIuNOxQ3wKQvDbSThIZH2Euz3pUegDV8APSKDh76wppoLFFFUmDrQxy32o8k7Fw=
X-Gm-Gg: ASbGncuUOEzF+nnCms0vNhuuwD6bGFFSH2I3GKmR1YfB+R42JPR4PRpxfhWQpvwLHDi
	eIL8ZTawbAWuYT+vIuVWPqhmEFlor4/2vS0c6o4rboWu4VvQpbbSR1WON3+GTch92XChqAVgbO8
	0Ws8TFOHB9gzMk04f2pzpcBd8QFCGOOrwCSwf8NA+dF0FxEYWCNu421PDsBhGtV50Xd3Wn6n4LZ
	Moplp8YC867onkk4t2HJQ+mkRVhM9AsRDBDrp2EZHLpzYEgrjwfD1zfn3Vi19u8o5Qb1shAjEfl
	Bt+a79r6VEXDjB/NrUt8lyPwX3ADVslJiEYxXbuClQDlOpCodK1OpyiqoTTaUEXRv4YsAGbOk1d
	x81mdaCa/X7JU7caWMAuEhGazaYOoPAR3Kie99lrTtwf4XYXN+auBM+Ex64edD1GXP2xw0CA5hd
	hQWovOpXTV5oH97WISnuJ2WKll4dfmFSHrtEuDRrXF34Ew
X-Google-Smtp-Source: AGHT+IHehcclOJSyKjiXfjUmQKgdKkl3LlW2LI+e+GZssL/Q8E/QAR5F9IeZJQ2e7rv0hFe2wSErjw==
X-Received: by 2002:a05:600c:c116:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-4557f0b6245mr108320825e9.16.1752502102255;
        Mon, 14 Jul 2025 07:08:22 -0700 (PDT)
Message-ID: <c982be4f-0f86-461a-a4cb-f8c930400736@suse.com>
Date: Mon, 14 Jul 2025 16:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH] e820: fix e820_get_reserved_pfns() to reserve
 page aligned area
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250711120333.23745-1-jgross@suse.com>
 <cccfa579-7fe9-400d-8ea6-7d6a8210e65d@suse.com>
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
In-Reply-To: <cccfa579-7fe9-400d-8ea6-7d6a8210e65d@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HkO1YO95APsia0p0jqivzp7j"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HkO1YO95APsia0p0jqivzp7j
Content-Type: multipart/mixed; boundary="------------2QwfgLwV4YrCGKdxZZX6IeFb";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Message-ID: <c982be4f-0f86-461a-a4cb-f8c930400736@suse.com>
Subject: Re: [MINI-OS PATCH] e820: fix e820_get_reserved_pfns() to reserve
 page aligned area
References: <20250711120333.23745-1-jgross@suse.com>
 <cccfa579-7fe9-400d-8ea6-7d6a8210e65d@suse.com>
In-Reply-To: <cccfa579-7fe9-400d-8ea6-7d6a8210e65d@suse.com>
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

--------------2QwfgLwV4YrCGKdxZZX6IeFb
Content-Type: multipart/mixed; boundary="------------X0cJd0QFIp5VO61sO02VDkoS"

--------------X0cJd0QFIp5VO61sO02VDkoS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDcuMjUgMTY6MDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4wNy4yMDI1
IDE0OjAzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gZTgyMF9nZXRfcmVzZXJ2ZWRfcGZu
cygpIG5lZWRzIHRvIG1ha2Ugc3VyZSB0byByZXNlcnZlIG9ubHkgcGFnZQ0KPj4gYWxpZ25l
ZCBtZW1vcnkgYXJlYXMuDQo+Pg0KPj4gRml4ZXM6IGE3ZDI3YTczMzJiYSAoIm1pbmktb3M6
IGFkZCBtZW1vcnkgbWFwIHNlcnZpY2UgZnVuY3Rpb25zIikNCj4+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gDQo+IEkndmUgY29tbWl0dGVk
IHRoaXMsIGJ1dCAuLi4NCj4gDQo+PiAtLS0gYS9lODIwLmMNCj4+ICsrKyBiL2U4MjAuYw0K
Pj4gQEAgLTM2NSw3ICszNjUsNyBAQCB1bnNpZ25lZCBsb25nIGU4MjBfZ2V0X3Jlc2VydmVk
X3BmbnMoaW50IHBhZ2VzKQ0KPj4gICAgICAgdW5zaWduZWQgbG9uZyBsYXN0ID0gMCwgbmVl
ZGVkID0gKGxvbmcpcGFnZXMgPDwgUEFHRV9TSElGVDsNCj4+ICAgDQo+PiAgICAgICBmb3Ig
KCBpID0gMDsgaSA8IGU4MjBfZW50cmllcyAmJiBlODIwX21hcFtpXS5hZGRyIDwgbGFzdCAr
IG5lZWRlZDsgaSsrICkNCj4+IC0gICAgICAgIGxhc3QgPSBlODIwX21hcFtpXS5hZGRyICsg
ZTgyMF9tYXBbaV0uc2l6ZTsNCj4+ICsgICAgICAgIGxhc3QgPSByb3VuZF9wZ3VwKGU4MjBf
bWFwW2ldLmFkZHIgKyBlODIwX21hcFtpXS5zaXplKTsNCj4+ICAgDQo+PiAgICAgICBpZiAo
IGkgPT0gMCB8fCBlODIwX21hcFtpIC0gMV0udHlwZSAhPSBFODIwX1RZUEVfU09GVF9SRVNF
UlZFRCApDQo+PiAgICAgICAgICAgZTgyMF9pbnNlcnRfZW50cnlfYXQoaSwgbGFzdCwgbmVl
ZGVkLCBFODIwX1RZUEVfU09GVF9SRVNFUlZFRCk7DQo+IA0KPiAuLi4gSSBoYWQgdG8gcmVz
b2x2ZSBmdXp6IGhlcmU6IFRoZXJlJ3Mgbm8gRTgyMF9UWVBFX1NPRlRfUkVTRVJWRUQgaW4g
dGhlDQo+IHVwc3RyZWFtIHRyZWUsIGFmYWljcy4gSSBqdXN0IGhvcGUgSSBkaWRuJ3Qgc2Ny
ZXcgdXAgLi4uDQoNCk9oLCBJIGhhZCB0aGlzIG9uIHRvcCBvZiBteSBrZXhlYygpIHNlcmll
cy4gWW91ciBhZGFwdGlvbiBpcyBsb29raW5nIGZpbmUuDQoNCg0KSnVlcmdlbg0K
--------------X0cJd0QFIp5VO61sO02VDkoS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------X0cJd0QFIp5VO61sO02VDkoS--

--------------2QwfgLwV4YrCGKdxZZX6IeFb--

--------------HkO1YO95APsia0p0jqivzp7j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh1D1QFAwAAAAAACgkQsN6d1ii/Ey/+
MwgAm5kOos2rkjsTqsigOdrYSLeHCv5C6MXr+K3qT8OrmPyOSwSXDhuYzVfjOcuaUoY8fm6FkcVS
xssP8IR0s0jSF0ZiMH2Or7bNyxnWAGJKzYyOO77VPhVlMTsqosEvIbsA9e2CUdFsutcZTmFX0Spw
6hbLBdjozuckYRG3xhEFQh1lPylAhRDYBW9SDVeHt479PSlOgj580A+lYb5ezsirKEjxn569aO2K
f1jT0wMlZa38T6+w6803+zpPji/zGuBUws+8cxRfdOG7PttxtCOwkeraSK7E7yTGzyPqlDDWJWky
myYwtJLVUivjgDP6CuH0bZ8pIauVfjwxFS58guw8ew==
=Lepg
-----END PGP SIGNATURE-----

--------------HkO1YO95APsia0p0jqivzp7j--

