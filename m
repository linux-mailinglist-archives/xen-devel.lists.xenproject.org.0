Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67817C7A939
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 16:35:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1169337.1495090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMTAX-0002ro-Ji; Fri, 21 Nov 2025 15:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1169337.1495090; Fri, 21 Nov 2025 15:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMTAX-0002qA-Gu; Fri, 21 Nov 2025 15:35:29 +0000
Received: by outflank-mailman (input) for mailman id 1169337;
 Fri, 21 Nov 2025 15:35:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wmUi=55=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vMTAV-0002q4-JV
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 15:35:27 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b37065fb-c6ef-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 16:35:26 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b71397df721so398793266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Nov 2025 07:35:26 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654fd4e51sm487196266b.42.2025.11.21.07.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 07:35:24 -0800 (PST)
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
X-Inumbo-ID: b37065fb-c6ef-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763739325; x=1764344125; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yRPae1uWYXZsTBiinPsI++VlxWxa9cG5Un8sTmPuQUo=;
        b=QNx306jOLKo1taYWlHYhxSIQHQJdMUVG5OZqx+Z4GyXLkGrkT008M9CSmCVUes96wQ
         AffY7QQR9/bcW8IYils11id87iJRRegEYKFCf8DZRR0QDZajq7PNNcyW93a8QbxX+6eN
         +Hahc4WzYYRJ+a2pg6bl/lOjYNRP2g8GvDLIscrezTTwRAIkHVmwtmECaUp2hkp4hzkG
         EPt84bUx+n4oeA0N/vR02aXnWAXzjAPnzTgH4AfVx8Rl+tPqRNMo6QOfCunyctgaFW+L
         vxFK7c9MkTIkNU+90jaY7smHjQkEdCm6jHFcdzn7J5O7YRNLIyXvgRcYSni6yqAl/GfO
         uWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763739325; x=1764344125;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yRPae1uWYXZsTBiinPsI++VlxWxa9cG5Un8sTmPuQUo=;
        b=T4stqq5IqMXrk1aQ9s+64nNgDji4UplpWoyMiPhyDHGAOQ4Qgfxm3u67l9qeNKlxZa
         4WWiq5SDE6uC3vLIMepyv8NQjIdVhqibz81ypGpDK1hsAcZDbDeJ9EmaDklyGO0tgIfp
         +emph3lLZ7i6HCwyRizszUSxPmsDZxtua9N1bdaCxVFc6eu24xKeYP1RmU6psyCflz4h
         HAiRj9bv+xguXXv14nFQxT7ZckmOFUzh21jKLDTVw6AUpfjtY9socuHZxVVpPRT7s2U7
         oZTm7bHIlVFRIpDDPmM5xOtJyL06PwOh2uOAXZxJLKF7K/8u+fpCgZnbE0mOERjJ0f//
         PsIA==
X-Forwarded-Encrypted: i=1; AJvYcCVx154TDIGbNXLa/pnP7Ti7a6D+DLJo50FVr90/xWF2QeHp/I+sTALnZ5dY3Lq/1dnwH3uBnLJWmQw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjQYZ7pN/iAjcRdzdejeEsjta63DDY/wVoDS/u4Trux11SUrHE
	t4GPfHyM5TnPlSkixDTpZmwlVCx0danPZ4CE+RMeyix1OWsMOKAvNWgEUOpXUM6vHmc=
X-Gm-Gg: ASbGnctvM6VPrqb8fhxDMBZ9Cy/NAzrw2+S8/UxunsZVusBFAnT8ZpR8m221tDwZO9s
	zaQVEoL0M/IHQvDeIRP9vd8F7SCzAbNO/ExrwXjfIeswB6+JfCrhsm+l4unQ/SyGvf2+3n9lkip
	thGFh1EKpudX8ocOyD64aMiJxvfIhiJ9l4E7y1Ri3nAJAydGkDVeuKlevn0EuSxOAdSXSrFj16K
	OIvYvyfo1g3yqGUz7zZXiBBfaIGUbvR7LbBFtUyGlUjT4kVka++dZcvX4m58MfG8j5qZ+IVA7CE
	IlWuI1cztBR6iBP/i8JSmFsMYplesM5RQeZdTLvocRdTcRieOPGawBkfhaCjcbi0dQ7XvpVhPdR
	WbRavXdwzl9Zl3f+cZhjbwcPgfW6XjJB/ntt3v71EEzeHEv9tkw8oaSbdJSqIHxTTlhokmiWzVC
	ozHFF8gSEe23wKD3NLcrgWeqQzbIaDK0PtRxinMGzzFE0buW6cC2uzichDIejpzTmHVsoBUTdOq
	rF2rsK6aFpV4kuznaEPkh9LKyjSjN8GWdO/AJ0eW+GPMP/vhA==
X-Google-Smtp-Source: AGHT+IEwx5Mo1OMtwOnw1HT7Hlq/5FRStqCy0XJFGqA1czWZwHPwa/2qeG+eXKcC5Vx9Ve97R4VncA==
X-Received: by 2002:a17:907:a04:b0:b6d:5363:88a9 with SMTP id a640c23a62f3a-b767154772bmr223954066b.9.1763739325269;
        Fri, 21 Nov 2025 07:35:25 -0800 (PST)
Message-ID: <d1af76b5-3d71-4cf9-b1dc-cc65c2a2869f@suse.com>
Date: Fri, 21 Nov 2025 16:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <4f898adc-323d-4c3a-a780-1acb2c58345d@citrix.com>
 <201bbc2a-310b-4880-8633-485535762258@suse.com>
 <78da6bbd-5fa9-4bbc-ac22-d52a11527c76@citrix.com>
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
In-Reply-To: <78da6bbd-5fa9-4bbc-ac22-d52a11527c76@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IhW4rlZdu26VyVHGEjTn1Pm2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IhW4rlZdu26VyVHGEjTn1Pm2
Content-Type: multipart/mixed; boundary="------------Gv3yx6d8dIxkOehNTjL30L0Y";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <d1af76b5-3d71-4cf9-b1dc-cc65c2a2869f@suse.com>
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <4f898adc-323d-4c3a-a780-1acb2c58345d@citrix.com>
 <201bbc2a-310b-4880-8633-485535762258@suse.com>
 <78da6bbd-5fa9-4bbc-ac22-d52a11527c76@citrix.com>
In-Reply-To: <78da6bbd-5fa9-4bbc-ac22-d52a11527c76@citrix.com>
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

--------------Gv3yx6d8dIxkOehNTjL30L0Y
Content-Type: multipart/mixed; boundary="------------hPulBEIF8L9YAeWq3b17I0q8"

--------------hPulBEIF8L9YAeWq3b17I0q8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMTEuMjUgMTY6MjIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDIxLzExLzIw
MjUgMzoxMCBwbSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+IE9uIDIxLjExLjI1IDE2OjAz
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDIxLzExLzIwMjUgMToyMyBwbSwgSnVl
cmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gQWRkIGEgbmV3IG1ha2UgbWFjcm8gZm9yIGNyZWF0
aW5nIDxmaWxlPiBmcm9tIDxmaWxlPi5pbiBhdCBidWlsZA0KPj4+PiB0aW1lLiBUbyBiZSB1
c2VkIGxpa2UgdGhpczoNCj4+Pj4NCj4+Pj4gJChmb3JlYWNoIGZpbGUsJChJTl9UQVJHRVRT
KSwkKGV2YWwgJChjYWxsIGFwcGx5LWJ1aWxkLXZhcnMsJChmaWxlKSkpKQ0KPj4+Pg0KPj4+
PiBUaGlzIGNhbiBiZSB1c2VkIGluc3RlYWQgb2YgdGhlIGN1cnJlbnQgYXBwcm9hY2ggdG8g
cGVyZm9ybSB0aGUgc2ltaWxhcg0KPj4+PiBzdGVwIGZvciBmaWxlLmluIGR1cmluZyAuL2Nv
bmZpZ3VyZS4NCj4+Pj4NCj4+Pj4gVGhpcyB3aWxsIGF2b2lkIGhhdmluZyB0byBydW4gLi9j
b25maWd1cmUganVzdCBiZWNhdXNlIG9mIG1vZGlmeWluZyBhDQo+Pj4+IGZpbGUgZGVwZW5k
aW5nIG9uIGEgdmFyaWFibGUgc2V0IGJ5IGNvbmZpZ3VyZS4NCj4+Pj4NCj4+Pj4gUHJlcGFy
ZSB0byBoYXZlIG11bHRpcGxlIGZpbGVzIGFzIHNvdXJjZSBmb3IgdGhlIHJlcGxhY2VtZW50
IHBhdHRlcm5zLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiBWMjoNCj4+Pj4gLSBkb24ndCB1c2Ug
cGF0dGVybiBydWxlLCBidXQgY3JlYXRlIGV4cGxpY2l0IGRlcGVuZGVuY3kgaW4gbWFjcm8s
DQo+Pj4+ICDCoMKgIGRvbid0IHJlcXVpcmUgdG8gcmVuYW1lIHNvdXJjZSBmaWxlcyAoSmFu
IEJldWxpY2gsIEFuZHJldyBDb29wZXIpDQo+Pj4+IFYzOg0KPj4+PiAtIHByZXBhcmUgZm9y
ICQoUEFUSF9GSUxFUykgdG8gYmUgZXh0ZW5kZWQgYnkgb3RoZXIgTWFrZWZpbGUNCj4+Pj4g
LSBsZXQgZ2VuZXJhdGVkIGZpbGUgZGVwZW5kIG9uICQoSU5DX0ZJTEVTKQ0KPj4+PiAtLS0N
Cj4+Pj4gIMKgIENvbmZpZy5tayB8IDEzICsrKysrKysrKysrKysNCj4+Pj4gIMKgIDEgZmls
ZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9D
b25maWcubWsgYi9Db25maWcubWsNCj4+Pj4gaW5kZXggZTE1NTZkZmJmYS4uMzllODAwN2I5
YyAxMDA2NDQNCj4+Pj4gLS0tIGEvQ29uZmlnLm1rDQo+Pj4+ICsrKyBiL0NvbmZpZy5taw0K
Pj4+PiBAQCAtMTU5LDYgKzE1OSwxOSBAQCBkZWZpbmUgbW92ZS1pZi1jaGFuZ2VkDQo+Pj4+
ICDCoMKgwqDCoMKgIGlmICEgY21wIC1zICQoMSkgJCgyKTsgdGhlbiBtdiAtZiAkKDEpICQo
Mik7IGVsc2Ugcm0gLWYgJCgxKTsgZmkNCj4+Pj4gIMKgIGVuZGVmDQo+Pj4+ICDCoCArUEFU
SF9GSUxFUyA6PSBQYXRocw0KPj4+PiArSU5DX0ZJTEVTID0gJChmb3JlYWNoIGYsICQoUEFU
SF9GSUxFUyksICQoWEVOX1JPT1QpL2NvbmZpZy8kKGYpLm1rKQ0KPj4+PiArDQo+Pj4+ICtp
bmNsdWRlICQoSU5DX0ZJTEVTKQ0KPj4+PiArDQo+Pj4+ICtCVUlMRF9NQUtFX1ZBUlMgPSAk
KGZvcmVhY2ggZiwgJChQQVRIX0ZJTEVTKSwgJChzaGVsbCBhd2sgJyQkMiA9PQ0KPj4+PiAi
Oj0iIHsgcHJpbnQgJCQxOyB9JyAkKFhFTl9ST09UKS9jb25maWcvJChmKS5tay5pbikpDQo+
Pj4NCj4+PiBFdmVyeXRoaW5nIGVsc2UgaW4gdGhlIHNlcmllcyBpcyBsb29raW5nIGZpbmUg
bm93LsKgIEJ1dCB3aHkgaXMNCj4+PiBQQVRIX0ZJTEVTIGRyb3BwaW5nIHRoZSAubWsgZXh0
ZW5zaW9uIGZyb20gdGhlIGZpbGU/DQo+Pj4NCj4+PiBJdCBsb29rcyB3ZWlyZCBmb3IgYm90
aCBJTkNfRklMRVMgYW5kIEJVSUxEX01BS0VfVkFSUyB0byBoYXZlIHRvDQo+Pj4gcmUtaW5z
ZXJ0IGl0Lg0KPj4NCj4+IEhtbSwgcmlnaHQuDQo+Pg0KPj4gTGV0IG1lIGNoYW5nZSB0aGF0
Lg0KPiANCj4gSWYgaXQncyBvbmx5IHRoYXQsIEkgY291bGQgZml4IHVwIG9uIGNvbW1pdCB0
byBzYXZlIGFub3RoZXIgcG9zdGluZy4NCj4gDQo+IFdob2xlIHNlcmllcywgUmV2aWV3ZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNCllvdSBu
ZWVkIHRvIGZpeCB1cCBwYXRjaCA0LCB0b28gKGluIHRvb2xzL1J1bGVzLm1rKS4NCg0KVGhh
bmtzLA0KDQoNCkp1ZXJnZW4NCg==
--------------hPulBEIF8L9YAeWq3b17I0q8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------hPulBEIF8L9YAeWq3b17I0q8--

--------------Gv3yx6d8dIxkOehNTjL30L0Y--

--------------IhW4rlZdu26VyVHGEjTn1Pm2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkghrwFAwAAAAAACgkQsN6d1ii/Ey/w
3Qf/dXvGFVz4ZepyT6FPGVURF9k+EiacVti/b4+AJrwFO4NctQXLkyzU6rvFDZmX+M3NEZDnAsY2
431aQ1jh5B5ewMQdGDWFu9dIHgl3o8t2m967B3dSbjUDvh6epAUYJesA0tqo8USbzhlx1ToBqNBw
5dhCmTDVCS25Syn0gb3R/O/jS4aBhq682D91G8PeoVwoeobsejQuP/HiKQfEyxDRdHN2eYrWY9bD
WW8SDp0z02Z9n4fPc3UyD+hblU0lsscBEZQ8gM+Q2aPhN46LPXTiHOhMRzveSmxw1t59pqeVEAev
I1ZhhmQcvriKOHlRLATn9dt734GeOByxnyAmQwvO1Q==
=I3M8
-----END PGP SIGNATURE-----

--------------IhW4rlZdu26VyVHGEjTn1Pm2--

