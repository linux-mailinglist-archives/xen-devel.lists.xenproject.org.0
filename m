Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 944DCB14A84
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 10:56:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062274.1427938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugg7g-0000VL-NQ; Tue, 29 Jul 2025 08:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062274.1427938; Tue, 29 Jul 2025 08:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugg7g-0000Ry-JN; Tue, 29 Jul 2025 08:55:48 +0000
Received: by outflank-mailman (input) for mailman id 1062274;
 Tue, 29 Jul 2025 08:55:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TZvG=2K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugg7f-0000Re-Kj
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:55:47 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d07bdbce-6c59-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 10:55:45 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ae3703c2a8bso1112608466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 01:55:45 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635a63139sm557645066b.92.2025.07.29.01.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 01:55:44 -0700 (PDT)
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
X-Inumbo-ID: d07bdbce-6c59-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753779345; x=1754384145; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SL/fUVXwhvyq0EZJmJ2WQ/Bv7xtjGI0O9G0kMBmKAt0=;
        b=N585x2T7BbD+FcN9peWhNHJbWyADM5RLx6hhHBm2Q6+ukdob9luIXCrYzUx0bcElyb
         5qenE7m+zHnmHJmzMOAw3RKpqo+P2WSF88AcICB+o8v0jCPpJx0AiK07mItWUBK8Zpi4
         w0Af1lWYEv+lhI8o3cE5S3Ix+9JIwfYTXnszz1TTdc6UPopykLwazD1+5Gv2pjSgmHvS
         2FRcmdf61mnWOZvY++19mv+nWcdDsv+X3P3/iRz6bcNrnr9GdgZDCxrfF2PK9kh+RqZu
         6UkRrRHH+5s5iji9sYJBvrhD5BYdRAMEKJDJai35m1ay6NF84tjWk+YGsxpbahQ8VLEK
         cfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753779345; x=1754384145;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SL/fUVXwhvyq0EZJmJ2WQ/Bv7xtjGI0O9G0kMBmKAt0=;
        b=m+piKRIPUewU2P/VfO/sBxw/GQPi9+kiIThy8+2VWMojrvDhGP4xKVvvvI/6HBQkqS
         Ri4L0IGhdCtC5YENULF2GD6zQFmGz/bM5diUx+s0FnJKIRnD4Sa0qYYvqHOqJarcjgvy
         bknsiTaOvLKnn4bsH7i3LQ7YzwXqwIgJG4Ooofu7pTpVZUc3IJH5DejILCb1hGDs6W7E
         /tKPda5N2gTlZwrMqb10sU3qP5Mk4FxjqkH4m283DoM/WyOQAWY+28/NBOGznbisTnf4
         18GQciP2C9SlfXo4bwGxpeQgLtmsmfN1nKwZ0yUEOEwD7qJmqqdLIQNTPbfEWfl4mp8U
         19rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTcW/3Aif7Yko8i+Y/SZCJFU7DY/klQz3B+6Cjmsc9azLiKLOxrrKN1lUkkO8y2FKFvj4EWoFdLds=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzk6bw02xFdYAweUodvBlLzfukj+K3IgbXp1TUoKDTJUeXds2PZ
	kroNbPNm362UYaohTbhroBd1BbhwL5QzdiFaNzHemS1Sf3+fipyJ1f7BcrPbShF1DPc=
X-Gm-Gg: ASbGncsa37sdKpB77F1SA7JqTd9EcxtBrbEHUEP+ziSLKOu2rzWqNOOrqaMJBHRyTO6
	eETLOtkO6BjUWbhLMdEHn1sIRxXa07y4wP6bQUzb8KaLf0vLCplUmO0AIXy7ve3ILyotgoW3E0O
	9dk6T79FsA931U6RTi/3apzQKnkmHqhEmd9s2QSHTqhEfXBeLBZ+9FMnElg4kFhKQlHhDDZcEuC
	pizmdXjRP5OpOgbfG2wSZCaty1nylHMAYGOjw0BHs01CunVr6XnluBXFeC56TW3rQVdjfsyv1HJ
	ZJNTbZ4x+JvEAESR0miTBDigW0arimTqihFxAirk5ewzeq1RCYfUmhEhFs2kavD7CgOz9WiiBFE
	K863pkXAxMFrNAvhrzdS/MdH5OsAPZi5kMcE7utW5042TNBkZx8uZMBGUTNDcVCktxPp7rXWXKA
	fqSl8ZZbS7s9ViDr/AY4Iy+LD5Ij5zNoUETMOZe4trGA==
X-Google-Smtp-Source: AGHT+IGUviefamrG6yAcP4ovUX9KtVyzHTbkiaDIXoL09ZCIQKsF35uauErt88SaHL+z3B6eXQiHIQ==
X-Received: by 2002:a17:907:3e92:b0:ae3:5887:4219 with SMTP id a640c23a62f3a-af61950cb0emr1705245566b.45.1753779345094;
        Tue, 29 Jul 2025 01:55:45 -0700 (PDT)
Message-ID: <d396208c-54e9-4054-83b8-8153798af47a@suse.com>
Date: Tue, 29 Jul 2025 10:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH v2 1/2] mm: provide a way to do very early page
 table allocations
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250729083829.11038-1-jgross@suse.com>
 <20250729083829.11038-2-jgross@suse.com>
 <2fb97c32-f0e7-4d9f-bf3c-5fd621498b29@suse.com>
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
In-Reply-To: <2fb97c32-f0e7-4d9f-bf3c-5fd621498b29@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fz79nls2L8PcHdp4XbM256ZS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fz79nls2L8PcHdp4XbM256ZS
Content-Type: multipart/mixed; boundary="------------E5mKh97YDGX1ahT5Es4huWC9";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Message-ID: <d396208c-54e9-4054-83b8-8153798af47a@suse.com>
Subject: Re: [MINI-OS PATCH v2 1/2] mm: provide a way to do very early page
 table allocations
References: <20250729083829.11038-1-jgross@suse.com>
 <20250729083829.11038-2-jgross@suse.com>
 <2fb97c32-f0e7-4d9f-bf3c-5fd621498b29@suse.com>
In-Reply-To: <2fb97c32-f0e7-4d9f-bf3c-5fd621498b29@suse.com>
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

--------------E5mKh97YDGX1ahT5Es4huWC9
Content-Type: multipart/mixed; boundary="------------9SBMnO01B1l18llAPmN1Nxt9"

--------------9SBMnO01B1l18llAPmN1Nxt9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDcuMjUgMTA6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOS4wNy4yMDI1
IDEwOjM4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvYXJjaC94ODYvbW0uYw0K
Pj4gKysrIGIvYXJjaC94ODYvbW0uYw0KPj4gQEAgLTY0MCwxMyArNjQwLDIwIEBAIHZvaWQg
Y2hhbmdlX3JlYWRvbmx5KGJvb2wgcmVhZG9ubHkpDQo+PiAgIC8qDQo+PiAgICAqIHJldHVy
biBhIHZhbGlkIFBURSBmb3IgYSBnaXZlbiB2aXJ0dWFsIGFkZHJlc3MuIElmIFBURSBkb2Vz
IG5vdCBleGlzdCwNCj4+ICAgICogYWxsb2NhdGUgcGFnZS10YWJsZSBwYWdlcy4NCj4+ICsg
KiBQcm92aWRlIGEgc21hbGwgcG9vbCBmb3IgYWxsb2NhdGluZyBzb21lIHBhZ2UgdGFibGVz
IHZlcnkgZWFybHkuIFRob3NlIGFyZQ0KPj4gKyAqIG5lZWRlZCBjdXJyZW50bHkgZm9yIG1h
cHBpbmcgdGhlIHNoYXJlZCBpbmZvIHBhZ2UsIHNvIDIgcGFnZXMgb3VnaHQgdG8gYmUNCj4+
ICsgKiBlbm91Z2guIEFkZCBvbmUgc3BhcmUgcGFnZSBhbnl3YXkuDQo+PiAgICAqLw0KPiAN
Cj4gSG1tLCAyIHBhZ2VzIHBsdXMgb25lIHNwYXJlIGRvZXNuJ3QgeWllbGQgLi4uDQo+IA0K
Pj4gK3N0YXRpYyBjaGFyIGVhcmx5X3B0WzRdW1BBR0VfU0laRV0gX19hdHRyaWJ1dGVfXygo
YWxpZ25lZChQQUdFX1NJWkUpKSk7DQo+IA0KPiAuLi4gNC4gV2FzIDIgYSB0eXBvLCBhbmQg
MyB3YXMgbWVhbnQ/IChXaGljaCwganVzdCB0byBtZW50aW9uIGl0LCB0aGVuIGlzbid0DQo+
IGNvcnJlY3QgZm9yIDMyLWJpdCBhaXVpLikgV2hhdGV2ZXIgYWRqdXN0bWVudCB3YW50cyBt
YWtpbmcgLSBoYXBweSB0byBkbyBzbw0KPiB3aGlsZSBjb21taXR0aW5nLiBKdXN0IG5lZWQg
dG8ga25vdyB3aGljaCB3YXkuIFRoZW4NCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCg0KVGhhbmtzLiBTaG91bGQgaGF2ZSBiZWVuIDMsIG9mIGNv
dXJzZS4gQW5kIGV2ZW4gb24gMzItYml0IDMgYXJlIGVub3VnaC4gOi0pDQoNCg0KSnVlcmdl
bg0K
--------------9SBMnO01B1l18llAPmN1Nxt9
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------9SBMnO01B1l18llAPmN1Nxt9--

--------------E5mKh97YDGX1ahT5Es4huWC9--

--------------fz79nls2L8PcHdp4XbM256ZS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiIjJAFAwAAAAAACgkQsN6d1ii/Ey+t
dwf/fiZX4QsJxWF0gz01Si0Ux0BZ94EctZ1wglf5KvOGhWogpEMEGx/czc8bo1BhRrgQSzcCTttb
HapyM5cOAlCivCC17MFAfi6eX/hKQOMDoijGYvWdzbIIyjQTRDlG2xeSgwzZNj1GCNNxWN79k8kV
mHzaVKMxE3CNEFe8HlBB42OaJJhXSIUxL6ZrRJeIjFRW12n8TW21zDaIiURjzIPHnt4y7Hf1froR
+6PQA1oXAyLQ7hJ0UYPSNRIDzD2w6YcxO4AfAhyYt2pxvbmblaKMRMd2nOLv7237LJXvfTtPgAwB
1NlPhVWZzw0sKFGPaPNhh2rOT9kMZg+rRZ5GsOXYzA==
=CfQM
-----END PGP SIGNATURE-----

--------------fz79nls2L8PcHdp4XbM256ZS--

