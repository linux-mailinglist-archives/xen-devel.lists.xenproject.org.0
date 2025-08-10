Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E570B1F894
	for <lists+xen-devel@lfdr.de>; Sun, 10 Aug 2025 08:15:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076541.1437984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukzKG-0005f8-Vb; Sun, 10 Aug 2025 06:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076541.1437984; Sun, 10 Aug 2025 06:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukzKG-0005c4-PI; Sun, 10 Aug 2025 06:14:36 +0000
Received: by outflank-mailman (input) for mailman id 1076541;
 Sun, 10 Aug 2025 06:14:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MvAv=2W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ukzKE-0005bi-T3
 for xen-devel@lists.xenproject.org; Sun, 10 Aug 2025 06:14:35 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 468d4e82-75b1-11f0-a325-13f23c93f187;
 Sun, 10 Aug 2025 08:14:30 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-af93150f7c2so523453866b.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Aug 2025 23:14:30 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c099sm1793022766b.108.2025.08.09.23.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 23:14:29 -0700 (PDT)
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
X-Inumbo-ID: 468d4e82-75b1-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754806470; x=1755411270; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IFxpocUlKyk2kptDIl31/0vQ3O1I0mFxUCZpnJ6gvkc=;
        b=LexG+4t4vkH8LBV2HcyTjLPyJKe0/9j243NhiSQFQSiBgbWDSbxAfLTOzqO04P1CIA
         Ttm+aaghfSi4dUm5zPn9ddUh7whQxpxpmP2Nxe1fgwTRwJReFFKwNzmJ8BZEqOuqFMzx
         YH4HKIh6YrofFkENkVzcyRCFRBENy8RdPHcgfIhtYohG/RoAPSi5JOx8/MkiNGUb4F+G
         WOqr6V/JUS1l4yDWlP+7mqAog6eF0aylyN/amZqpottpcIHD9CWWhOZ+aeIxJBZTx8tk
         8fsEUBs0QXm5wSomeYTr5LyxOu5xtrJ/NdOpjdshbs985eW6nt2Yd/nXzAYxYCFoYFKf
         pf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754806470; x=1755411270;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IFxpocUlKyk2kptDIl31/0vQ3O1I0mFxUCZpnJ6gvkc=;
        b=FQF3WMu1T3wwbuBV1AvKcd0DJm9UejjidOvXxr5fYdPnBVIaYrx1ZQTVvEgarepg1x
         uREz5HxGDTzBqnSWa+dRwLUkzgECAsW9G8CFYvNg1ji9K9Rifr3244WMFFFxiwcWmtbF
         mARPWMYXGrF19iay5Ae31boqbJyz2QJlSq/Qpxko4wcTgFBy8Rjh1ObJq/ymj/fxJZcU
         vAD07jiAM8Uw0cKe4HH+1SY8mTNRGHDqJcYvbfVHEP8MMqN6MMHGDNlOPIiWo00ohJRq
         Nl7qKXe6D+LjHQHxQWFqHqrAKqmBo/6gTvEudaN4TSUfte1CGsovzNi6/oa6eHA8CCOe
         GhlA==
X-Forwarded-Encrypted: i=1; AJvYcCV5V3GT5cf0WQD+P52Bs2dUEdfdCoqW+exkpwLgNxWaghWj4cFYF4gXn7pPwBvJDoBpoBKonvKnjU4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVL3xOCqcwagapNdL+WaTiRmBgkM6PcTakp4mIp+aK4f3c0vtu
	IVrCP/IsAfX2oppQeIgo5LE761bR6yMjNpdWMATXHWeyhtdGPTmlZwVR2VkgMeCHRys=
X-Gm-Gg: ASbGncs5Ne10ANfIiiHTGSd0qV4FXsuBACTUecldjFSQTgV0pK8xJbuCw5MMSeM0jZk
	PKfylzi0u5T2hyM3bLy42O9/OrcRIDy/Sd6k8Le2Iwcn18NxOPCmL6CdCAZd/nEsJ4fUPGbZI6A
	rul/JDI1jnEoDHM0pC7H43H1ZBoEEGvsYOdldIHWwSrfkQspV8a9LmrFhEL78/Rpe8h1oxUC3Ar
	vRWKxB2TJbMOEre8+pZuFVkdm8CKL+WPAx+aVOXtUVOqFwviP2Ylxc/1zFFMX4yJlo8ntBmTrhG
	CzDHWS1Ye8tNS5+IBPbiWB+IPIHwwEI6gtRs57u85nWCF+ScAZ8SM0+rBTU8RXPklTIcKxhG0bo
	d+dOWwIX0Hv57GUMa796nn/jRG4wo8dTEusX6c7hAWsuQSnlhkLSj2mF6Zk02CerxmrS3KuW0Nn
	Ho0FuFbuiWlZr1GNEFUwwkEdZ7PZuR8EUqpFm/Zx6xxQ==
X-Google-Smtp-Source: AGHT+IE5EXKAoo2KTMfE4MelMnus5zBwlvl4uq4rl3lyquQJwMXZBmOxTvX6oBmZtUdjGUmxa0KwYw==
X-Received: by 2002:a17:906:fd8d:b0:ae6:c9b3:57cb with SMTP id a640c23a62f3a-af9c63b08d6mr869146466b.5.1754806469589;
        Sat, 09 Aug 2025 23:14:29 -0700 (PDT)
Message-ID: <93d27332-d813-47ed-a57e-0119a12e0a1e@suse.com>
Date: Sun, 10 Aug 2025 08:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] stubdom: Fix -Wimplicit-int in newlib
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
 <20250809221206.1260861-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250809221206.1260861-5-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ov7hTQ1wVtNaG6leQuWeLhcc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ov7hTQ1wVtNaG6leQuWeLhcc
Content-Type: multipart/mixed; boundary="------------TyaQcn8ZtdmLXlK4ccCv10kW";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <93d27332-d813-47ed-a57e-0119a12e0a1e@suse.com>
Subject: Re: [PATCH 4/5] stubdom: Fix -Wimplicit-int in newlib
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
 <20250809221206.1260861-5-andrew.cooper3@citrix.com>
In-Reply-To: <20250809221206.1260861-5-andrew.cooper3@citrix.com>
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

--------------TyaQcn8ZtdmLXlK4ccCv10kW
Content-Type: multipart/mixed; boundary="------------nBra1eLk9q0QDn54cTx30TM0"

--------------nBra1eLk9q0QDn54cTx30TM0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDguMjUgMDA6MTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IFRoaXMgaXMgYW4g
ZXJyb3Igbm93IERlYmlhbiBUcml4aWUncyBnY2MtMTQNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClJldmlld2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCj4gLS0tDQo+IENDOiBB
bnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD4NCj4gQ0M6IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IENDOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0K
PiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IENDOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IENDOiBTYW11
ZWwgVGhpYmF1bHQgPHNhbXVlbC50aGliYXVsdEBlbnMtbHlvbi5vcmc+DQo+IENDOiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IA0KPiBJIHJlYWxseSB0aGluayB3ZSBu
ZWVkIHRvIG1vdmUgb250byBVbmlrcmFmdCBhcyBhIG1haW50YWluZWQgYmFzZS4uLg0KDQpU
aGlzIHdvdWxkIHJlcXVpcmUgYSBfbG90XyBvZiB3b3JrIHRvIHJlYWNoIGZlYXR1cmUgcGFy
aXR5IChiYWxsb29uaW5nLA0Ka2V4ZWMgY29tZSB0byBteSBtaW5kIGltbWVkaWF0ZWx5KS4N
Cg0KSSdtIG5vdCBzdXJlIHdoZW4gVW5pa3JhZnQgdG9vayBNaW5pLU9TIGFzIHRoZSBiYXNl
LCBidXQgaXQgc2VlbXMgdG8gaGF2ZQ0KaGFwcGVuZWQgYmVmb3JlIEkgYWRkZWQgYmFsbG9v
bmluZywgc28gNC43IG9yIGVhcmxpZXIuDQoNCkl0IHByb2JhYmx5IHdvdWxkIGJlIGVhc2ll
ciB0byAianVzdCIgdGFrZSBhbiB1cC10by1kYXRlIG5ld2xpYiBmb3IgTWluaS1PUw0KKGJ0
dywgVW5pa3JhZnQgaXMgYmFzZWQgb24gbmV3bGliIDIuNSwgd2hpY2ggaXNuJ3QgdXAtdG8t
ZGF0ZSBlaXRoZXIpLg0KDQpPVE9IIHVzaW5nIFVuaWtyYWZ0IHdvdWxkIGdpdmUgdXMgQXJt
IHN1cHBvcnQgImZvciBmcmVlIiwgd2hpY2ggd291bGRuJ3QgYmUNCmEgbWlub3IgZWZmb3J0
IHRvIGFkZCB0byBNaW5pLU9TLg0KDQpTbyBJJ20gbm90IG9wcG9zZWQgdG8gc3dpdGNoIHRv
IFVuaWtyYWZ0LCBidXQgYmVmb3JlIHN0YXJ0aW5nIHRoaXMgYWR2ZW50dXJlDQpJJ2QgbGlr
ZSB0byBkaXNjdXNzIGEgcGF0aCB0byBmZWF0dXJlIHBhcml0eSBjb21wYXJlZCB0byBNaW5p
LU9TIHdpdGggdGhlDQpVbmlrcmFmdCBjb21tdW5pdHkgKGVzcGVjaWFsbHkgbG9va2luZyBh
dCBYZW5zdG9yZSBzdXBwb3J0IGluY2x1ZGluZyBsaXZlDQp1cGRhdGUpLg0KDQoNCkp1ZXJn
ZW4NCg==
--------------nBra1eLk9q0QDn54cTx30TM0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------nBra1eLk9q0QDn54cTx30TM0--

--------------TyaQcn8ZtdmLXlK4ccCv10kW--

--------------ov7hTQ1wVtNaG6leQuWeLhcc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiYOMQFAwAAAAAACgkQsN6d1ii/Ey+c
igf/R7R7f+whW+pwogueZ8g9zMwW4eAPDYexZ7yWNPbKoApviBR7GVysZ9xqUkw7pdmr3gz9OnOr
agAcPbWCcKphQXGT6oVpyLUb1sTEaTsXImKpNSWlhkN3diDgCrpI/NOCTNQ1t9rwwf9wzWwG0kaT
iFm8f4u8nkqyNfCzXjIzZ0eOCDInjx1mpp+NtSFFSiwJGZ4RNzM5VA1yJNY/v/wKudq+Ih8UMu23
XTRfaaPPR5/kPAIjZ3JFLclfBlITufZLG3U1gbpQrIFK0YhlZLcz54Hej86tpAVl4vLaB2bM5iR2
ghOPgfteVYLBPkh0kaBm4kylVlCqxIstEf4bCpIADg==
=vM0w
-----END PGP SIGNATURE-----

--------------ov7hTQ1wVtNaG6leQuWeLhcc--

