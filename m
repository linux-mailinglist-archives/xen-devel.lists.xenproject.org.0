Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13029C5D2F9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 13:56:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162593.1490176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJtKO-0001mI-1d; Fri, 14 Nov 2025 12:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162593.1490176; Fri, 14 Nov 2025 12:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJtKN-0001k1-Uu; Fri, 14 Nov 2025 12:54:59 +0000
Received: by outflank-mailman (input) for mailman id 1162593;
 Fri, 14 Nov 2025 12:54:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=leFb=5W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vJtKM-0001js-Jk
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 12:54:58 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d985ab8-c159-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 13:54:55 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47778b23f64so14767135e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 04:54:54 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779525d2bcsm5975325e9.5.2025.11.14.04.54.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 04:54:53 -0800 (PST)
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
X-Inumbo-ID: 1d985ab8-c159-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763124894; x=1763729694; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YqKVpNuK1uKMzQbRS3O9D7tON2zEAALyD0G+Nx+OlgQ=;
        b=GrVnCHzVSOjQubPBwuoxdMk8LawYZEvQCOiFp8x4ZFnzEp66nr8lUjZbbRFsv93xn5
         RJ8Wm3DnY6XWva8T7o81AgyBPTv2bx+llczNG5gF+NaEMD9hfV3113GOieI00U+vSjS1
         WW0IeliQuDKgkOPL4AqT24tsBA4vQGVnKS41XWr5oEZEm3jtiL8cCheRdoTAdqI7fZee
         fl/+DIx0SoWzQEsEY146bkejCK8kXGo7XI+ZNAXDGxOasS0sCLur9AxfGq1uuU2G/d2M
         qHU+l6aF1KGtXpBmlInFBbChBXdXa9nxchEJG74GyN7r2DSd94Cj65nWOBFSTblG8Blw
         fsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763124894; x=1763729694;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YqKVpNuK1uKMzQbRS3O9D7tON2zEAALyD0G+Nx+OlgQ=;
        b=KGxghSzix80pupFGkmfUJf5+3RGU77o/rnPR52cCwznBAVO4JU09wx677A3iS4iubi
         m+/4YlmzJPYIhE1HQzEhtk9sdFhXLLdM1Fi+GEVdlJpdVyKsJy68nFaF0G5AvbDQNnsS
         fwOMCbZwHTSvIesWLXCjSt2d/hkqL6a27LTGUdzotZWUWZ8qUld7dej0RL+FpCTuIigC
         3Vz6Cp9hwwg5URK2RhhYEg74ILK0Ip7kqce7ME4i6fUHv5VFYKA1fdlrMjBQvTEd8kWN
         Z+IAy1FcTQx/4ADisVKLI933qxkaBXPtWcnmRGJ0xk4KsJA8lT2tVPwckugU8Pj+VBLs
         tySw==
X-Forwarded-Encrypted: i=1; AJvYcCXJnLDCGUcOLCBIl+9KDiVlPmIkb9NVNoL4mnht7Ne/Opirf2jhMmNnHQTSAUn7cjolsB85qTiIhc4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6j3BjM+ux0aChr2xVLKwV+GHugZCyhD6MQEewgEP7EkOhPky+
	iaiF8geD9xbF+JEhYluvmfAf/3W2VLOO74yTw59Zx6oFFg4hI1PLsxw/L3Eq1NzP2b8=
X-Gm-Gg: ASbGncs4rXk2a6bHB8Q5h2q6C6QzXyT39dRhzrs6/6YTqZFyfD2gokRvxIzaaP+0jod
	NnOGQL1ioGTTo6Aj6XEs25uwZcQeWK4tOgePjs6rDf8F+lx/iAZc2XnUl8ou8BWmQQSSBUUQb34
	EL/N1wk4ogvSQ5kSGT0mDg86AmZv4d3WGi3cmqPWFFatNI7jz0X7CNGMkjmKenX9dmhMtDAiN04
	1mVMOWyHUTjsWvqEOO7gdLoQaWVcpz9amprix3gzmZdh+0EmE5Fu5Hh903+IEW0NWN2Wte9V3wO
	F3vm9ukET1hLoAedhwcCx2d/FXdTVHygygqVrA8gtxtAkc82ojR9FZSDvrIMrwTj3H+PF396z8g
	4+07vyLgNxCSl+NvdwcghJldl/uqECanm/KA6GFLhLXJfvkZdqL2FuxVN9B6vTj3F7Bt0SMAabx
	IT1oveIkbTnsBQZfG5oI1FZguvWjW9+e+vyHT0YjiJ+ysO5jd03WKkgR6jR6L/miMRG8g4+mWV2
	Oa+DPdeqkoyNf4hrDOLwtYx7vXEbRyohNCaLno=
X-Google-Smtp-Source: AGHT+IFMfgF/VLmVhwJsynzDuNAecpkH0tIJAWdWL2xHut7YdeK+yT3HyCUZZQEM/pg/VCJsLiFkkA==
X-Received: by 2002:a05:600c:1387:b0:45b:47e1:ef6d with SMTP id 5b1f17b1804b1-4778feb2507mr29120585e9.36.1763124893621;
        Fri, 14 Nov 2025 04:54:53 -0800 (PST)
Message-ID: <cc90d18b-f88e-49d9-a55f-b7035ce43167@suse.com>
Date: Fri, 14 Nov 2025 13:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
 <468c6686-43e5-4c35-8366-58558f199e22@citrix.com>
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
In-Reply-To: <468c6686-43e5-4c35-8366-58558f199e22@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PNPCGwuF0SpejIkhfwi4kZAd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PNPCGwuF0SpejIkhfwi4kZAd
Content-Type: multipart/mixed; boundary="------------wdUHWjHXtN05tVQVCWf4QEvw";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <cc90d18b-f88e-49d9-a55f-b7035ce43167@suse.com>
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
 <468c6686-43e5-4c35-8366-58558f199e22@citrix.com>
In-Reply-To: <468c6686-43e5-4c35-8366-58558f199e22@citrix.com>
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

--------------wdUHWjHXtN05tVQVCWf4QEvw
Content-Type: multipart/mixed; boundary="------------pf45BxBrzLV4r4RsJY0bWbD5"

--------------pf45BxBrzLV4r4RsJY0bWbD5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTEuMjUgMTI6NDIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE0LzExLzIw
MjUgMTE6MzIgYW0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvQ29u
ZmlnLm1rIGIvQ29uZmlnLm1rDQo+PiBpbmRleCBlMTU1NmRmYmZhLi5kMjFkNjc5NDVhIDEw
MDY0NA0KPj4gLS0tIGEvQ29uZmlnLm1rDQo+PiArKysgYi9Db25maWcubWsNCj4+IEBAIC0x
NTksNiArMTU5LDE5IEBAIGRlZmluZSBtb3ZlLWlmLWNoYW5nZWQNCj4+ICAgCWlmICEgY21w
IC1zICQoMSkgJCgyKTsgdGhlbiBtdiAtZiAkKDEpICQoMik7IGVsc2Ugcm0gLWYgJCgxKTsg
ZmkNCj4+ICAgZW5kZWYNCj4+ICAgDQo+PiArUEFUSF9GSUxFUyA6PSBQYXRocw0KPj4gK0lO
Q19GSUxFUyA6PSAkKGZvcmVhY2ggZiwgJChQQVRIX0ZJTEVTKSwgJChYRU5fUk9PVCkvY29u
ZmlnLyQoZikubWspDQo+PiArDQo+PiAraW5jbHVkZSAkKElOQ19GSUxFUykNCj4+ICsNCj4+
ICtCVUlMRF9NQUtFX1ZBUlMgOj0gJChmb3JlYWNoIGYsICQoUEFUSF9GSUxFUyksICQoc2hl
bGwgYXdrICckJDIgPT0gIjo9IiB7IHByaW50ICQkMTsgfScgJChYRU5fUk9PVCkvY29uZmln
LyQoZikubWsuaW4pKQ0KPj4gKw0KPj4gKyMgUmVwbGFjZSBAeHh4QCBtYXJrZXJzIGluICQo
MSkuaW4gd2l0aCAkKHh4eCkgdmFyaWFibGUgY29udGVudHMsIHdyaXRlIHRvICQoMSkNCj4+
ICtkZWZpbmUgYXBwbHktYnVpbGQtdmFycw0KPj4gKyAkKDEpOiAkKDEpLmluDQo+PiArCXNl
ZCAkJChmb3JlYWNoIHYsICQkKEJVSUxEX01BS0VfVkFSUyksIC1lICdzI0AkJCh2KUAjJCQo
JCQodikpI2cnKSA8JCQ8ID4kJEANCj4+ICtlbmRlZg0KPiANCj4gU2hvdWxkbid0IHRoaXMg
d3JpdGUgdG8gYSB0bXAgZmlsZSwgYW5kIHVzZSBtb3ZlLWlmLWNoYW5nZWQ/wqAgTW9zdCBv
Zg0KPiB0aGUgdGltZSB0aGUgbWFya2VycyB3b24ndCBoYXZlIGNoYW5nZWQsIGFuZCB3ZSds
bCB3YW50IHRvIHNob3J0IGNpcmN1aXQNCj4gZGVwZW5kZW50IHJ1bGVzLg0KDQpJIGNhbiBz
ZWUgdGhpcyBiZWluZyBhbiBhZHZhbnRhZ2Ugd2hlbiBlLmcuIGdlbmVyYXRpbmcgaGVhZGVy
IGZpbGVzLCBhcw0KdGhvc2UgYmVpbmcgZ2VuZXJhdGVkIGFnYWluIHdvdWxkIHBvdGVudGlh
bGx5IGNhdXNlIGxvdHMgb2YgcmVidWlsZHMuDQoNCkluIHRoaXMgY2FzZSBJIGNhbiBoYXJk
bHkgc2VlIGFueSBjYXNlIHdoZXJlIG1ha2Ugd291bGRuJ3QgZG8gdGhlIHJpZ2h0DQp0aGlu
ZyBhbHJlYWR5LiBFaXRoZXIgdGhlICouaW4gZmlsZSBpcyBuZXdlciB0aGFuIHRoZSBnZW5l
cmF0ZWQgZmlsZSBkdWUNCnRvIGEgZ2l0IHVwZGF0ZSBvciBhIG1hbnVhbCBlZGl0LCBzbyBt
YWtlIHdpbGwgcmVnZW5lcmF0ZSB0aGUgdGFyZ2V0IChhbmQNCnRoaXMgaXMgd2hhdCB3ZSB3
YW50KSwgb3IgdGhlICouaW4gZmlsZSBoYXNuJ3QgY2hhbmdlZCwgc28gbWFrZSB3b24ndA0K
cmVnZW5lcmF0ZSB0aGUgZmlsZSBhcyBpdCBpcyBuZXdlciB0aGFuIHRoZSAqLmluIGZpbGUg
YWxyZWFkeS4NCg0KT3IgZGlkIEkgbWlzcyBzb21lIGFzcGVjdD8NCg0KV2hhdCBJUyBuZWVk
ZWQgaXMgcHJvYmFibHkgYSBkZXBlbmRlbmN5IG9uICQoUEFUSF9GSUxFUykgaW4gY2FzZSBz
b21lb25lDQpkaWQgYSBuZXcgLi9jb25maWd1cmUgY2FsbCB3aXRob3V0IGEgbWFrZSBkaXN0
Y2xlYW4uDQoNCg0KSnVlcmdlbg0K
--------------pf45BxBrzLV4r4RsJY0bWbD5
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------pf45BxBrzLV4r4RsJY0bWbD5--

--------------wdUHWjHXtN05tVQVCWf4QEvw--

--------------PNPCGwuF0SpejIkhfwi4kZAd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkXJpwFAwAAAAAACgkQsN6d1ii/Ey9Q
8QgAjO7V0DQMYCE46GnBV4DRNkU0+Vt9W1GtUXAJBLINxkEvM3ZdGSybEN7PIoj4b+lVpk6bh9OK
LVT7P7GmMbAh7FCc6eQ7wcdEynOfpIOGbipiihOB4Y/ThL9D4NpTGS7OsJCNXxhbV3ve/GsVk/e2
mJxlhodwWvlX1ca92jMF+kfXeu6pokmh9B0/SY4RPhbYR+6rrgrZYLTw5ZjPh/cLCMEmZKBLpfeg
FegmebSQ+JaOWVbcOuJuqjgR6UYpYNhetpQpvjV497F2plQNJs9i9GH9uI44XDYZZAHEk2Xrzxs+
vmHBno9kmjO21UwfOe9ij4w73D8t6C/WiBtWFGEP4A==
=Bkz6
-----END PGP SIGNATURE-----

--------------PNPCGwuF0SpejIkhfwi4kZAd--

