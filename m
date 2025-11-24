Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD47C808BC
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:46:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170783.1495827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVwz-0006et-M9; Mon, 24 Nov 2025 12:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170783.1495827; Mon, 24 Nov 2025 12:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVwz-0006cx-JN; Mon, 24 Nov 2025 12:45:49 +0000
Received: by outflank-mailman (input) for mailman id 1170783;
 Mon, 24 Nov 2025 12:45:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fNsn=6A=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vNVwy-0006ch-Pn
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:45:48 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ffc9e6d-c933-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:45:47 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-640d0ec9651so7142005a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:45:47 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64536443784sm11828410a12.28.2025.11.24.04.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:45:36 -0800 (PST)
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
X-Inumbo-ID: 7ffc9e6d-c933-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763988347; x=1764593147; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vegomO540GgvAFXLXcwEbN1/Dy5RuZjlL/Wc3OvPm9Y=;
        b=FIZoSj7jfz/2VWdctCZe5uBncRX2DBdWCkEVifIlkod5E7twBf94cYt4hE2/AypDMi
         nrbExPm8yJmX1kmrnYtnCMzWgUpMHkDmCtBAe5ruMcqScnENCsKK63HIKLy7UILO3/U2
         RgZ1GUGQDezt1CNS8FWtUfgDkus5Tlvit6fhoksX7R6IPsYW7qg/iuJN01kIcjsFra6D
         CWgdlkFKPnaOJBRCN69hSixnp6b4HIqtX8w2gJz6kqY8MKWBx3CcLwt9pxrJ3/cLQX+S
         tMbF2jN7fjYSiMmDp4mE3Fz5Nm0ghMMgpe13vyhFtOcB0HTekjiXmfWu3P0NJxOWVNmk
         sQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988347; x=1764593147;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vegomO540GgvAFXLXcwEbN1/Dy5RuZjlL/Wc3OvPm9Y=;
        b=ftQ5aY5b+VczAh3xeE7LN1ilHSRSo6vlHoSijY2vRBGlziWV4oIbAtquA9ZlstDAyk
         1V/31Qqjt6dw37VIM2r0vR3YMwh3pW1d3612GhMOxIJZNUdLwoUX123EGKln+pfgIUpH
         /bA+OWlVm1S4xBOmArNuHRNvq0So6CLaMorQ3Zs3LZyduTcOh5ryLmGYdEf/DKYQVJ9J
         iVCxrwvL+dtpAMODcNQu+hjmbA7SwbggVL7QWCyR30l2qJFk74bwKOlm4ZjLVqPF69l4
         +8sk6bj3Lvh/0ymadaDCBDC123MsPPc6k3fSOSP2mpMTCvWWHFKssPjmiQfgKFyq6QhS
         v63w==
X-Forwarded-Encrypted: i=1; AJvYcCVCH25qeKa+5yjMqFmAAqAySxlRJoEGKR4EhyBvFANceEdUYPuNKepe4URxIo9JCwHaf4pzewDl2As=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZRdpifygGQahT32SgiQGQyz9Qy9PeUTBrzN3x1USYiU/1JjWC
	3ddxTTTYXWBce8CaxvtNy6Q20Dg8smhRfJM5JPEI0DBevTzkCIYrFnnHx0lUGGaqdl8=
X-Gm-Gg: ASbGnctYA1SLugbC+c2j4NYaT/Puu9F93gHOgS9Jgyw7geKPbhxseaspPI16+rW55q0
	+Ifp488j+AXJy6l020Zngv0uI+nNpWeM2mIUbZKKO0awR+v2E4OUwoGURLU40VP+1cxbygi6TFd
	32JTA90rzL/I9L40M71pKvZexAEFAL+QpsbENuXHU/8QHxY7QWvvd6XS62mXPru2pOXq/qHJ+Fg
	8e02itM123Ikb/cqxsOl77P0lvc8cBRUpDBKA1liQqFXI9v/XQghoQ8pMI9TjqL4IP/IOjOMqmE
	wEK4Z609vFgnO9OViA6sgKMrFF3Z/KJyeaQSPg8BqPa/tBCK8f4DdWz6SE+qs4zaEECbBb1MF/9
	MtyJmcPzkMuEOjATh5jJwSifSRWpI2VMMgwaDffl5yl+B+LiL4Pa21QG9KJY5UHsO0oABPd7vck
	dHY7GtKdB9myKcc+JgWU05Y0Ctz1EbG62ePT3lP711y7A9dS3LhmLECPCO+UaehivrGIKeq0Q0d
	Kpggjl6g6S46dtWJWRRGivUZvlkx3Y/j5f4Sso=
X-Google-Smtp-Source: AGHT+IHuhYMAVvndKZTfju+ktbACdX8g9isNq/qP/9vWKm3adVSIG7UH/rzspuBIcDh+7pOOVKSQrQ==
X-Received: by 2002:a05:6402:d0e:b0:640:a9b1:870b with SMTP id 4fb4d7f45d1cf-64555baa940mr10080735a12.14.1763988337277;
        Mon, 24 Nov 2025 04:45:37 -0800 (PST)
Message-ID: <a593e8cb-fa56-4301-a7da-ca4b51dfab9a@suse.com>
Date: Mon, 24 Nov 2025 13:45:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <d34e3e86-c51a-49b3-8b46-140526755f0f@suse.com>
 <826037a5-dacf-434f-90d9-8f12e61bdd6e@suse.com>
 <0ece9df6-8a04-4ffa-bcf4-d7a3fd4bbef4@suse.com>
 <bf7e1a66-1696-477a-bdef-79b08df0b57c@suse.com>
 <bbcaf4f2-c52e-4b3e-ab6a-ca5020a8b786@suse.com>
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
In-Reply-To: <bbcaf4f2-c52e-4b3e-ab6a-ca5020a8b786@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rnClgptvmRmrOv993EFk3d0G"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rnClgptvmRmrOv993EFk3d0G
Content-Type: multipart/mixed; boundary="------------hWJkwhnAaPtL2FfiBw0dRqiN";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <a593e8cb-fa56-4301-a7da-ca4b51dfab9a@suse.com>
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <d34e3e86-c51a-49b3-8b46-140526755f0f@suse.com>
 <826037a5-dacf-434f-90d9-8f12e61bdd6e@suse.com>
 <0ece9df6-8a04-4ffa-bcf4-d7a3fd4bbef4@suse.com>
 <bf7e1a66-1696-477a-bdef-79b08df0b57c@suse.com>
 <bbcaf4f2-c52e-4b3e-ab6a-ca5020a8b786@suse.com>
In-Reply-To: <bbcaf4f2-c52e-4b3e-ab6a-ca5020a8b786@suse.com>
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

--------------hWJkwhnAaPtL2FfiBw0dRqiN
Content-Type: multipart/mixed; boundary="------------ZmADpcFg0DLlpAexXdK27IJ0"

--------------ZmADpcFg0DLlpAexXdK27IJ0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjUgMTM6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4xMS4yMDI1
IDEyOjI3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjQuMTEuMjUgMTI6MTUsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI0LjExLjIwMjUgMTI6MDUsIErDvHJnZW4gR3Jv
w58gd3JvdGU6DQo+Pj4+IE9uIDI0LjExLjI1IDExOjQxLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDIxLjExLjIwMjUgMTQ6MjMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+
Pj4gLS0tIGEvQ29uZmlnLm1rDQo+Pj4+Pj4gKysrIGIvQ29uZmlnLm1rDQo+Pj4+Pj4gQEAg
LTE1OSw2ICsxNTksMTkgQEAgZGVmaW5lIG1vdmUtaWYtY2hhbmdlZA0KPj4+Pj4+ICAgICAJ
aWYgISBjbXAgLXMgJCgxKSAkKDIpOyB0aGVuIG12IC1mICQoMSkgJCgyKTsgZWxzZSBybSAt
ZiAkKDEpOyBmaQ0KPj4+Pj4+ICAgICBlbmRlZg0KPj4+Pj4+ICAgICANCj4+Pj4+PiArUEFU
SF9GSUxFUyA6PSBQYXRocw0KPj4+Pj4+ICtJTkNfRklMRVMgPSAkKGZvcmVhY2ggZiwgJChQ
QVRIX0ZJTEVTKSwgJChYRU5fUk9PVCkvY29uZmlnLyQoZikubWspDQo+Pj4+Pj4gKw0KPj4+
Pj4+ICtpbmNsdWRlICQoSU5DX0ZJTEVTKQ0KPj4+Pj4+ICsNCj4+Pj4+PiArQlVJTERfTUFL
RV9WQVJTID0gJChmb3JlYWNoIGYsICQoUEFUSF9GSUxFUyksICQoc2hlbGwgYXdrICckJDIg
PT0gIjo9IiB7IHByaW50ICQkMTsgfScgJChYRU5fUk9PVCkvY29uZmlnLyQoZikubWsuaW4p
KQ0KPj4+Pj4NCj4+Pj4+IEZlZWxzIGxpa2UgbXkgcHJpb3IgY29tbWVudHMgd2VyZW4ndCBy
ZWFsbHkgYWRkcmVzc2VkLiBJIGNvbnRpbnVlIHRvIHRoaW5rIHRoYXQNCj4+Pj4+IG5vbmUg
b2YgdGhlIGFib3ZlIGlzIHBhcnQgb2Ygd2hhdCB0aGUgc3ViamVjdCBzYXlzLg0KPj4+Pg0K
Pj4+PiBJIHJlYWxseSBkb24ndCB1bmRlcnN0YW5kIHlvdXIgY29uY2VybiBoZXJlLg0KPj4+
Pg0KPj4+PiBGb3IgcmVwbGFjaW5nIHRoZSBAbWFya2Vyc0AgbWFrZSBuZWVkcyB0byBrbm93
IHdoYXQgc2hvdWxkIGJlIHJlcGxhY2VkLg0KPj4+PiBTbyBpdCBuZWVkcyB0byBzY2FuIHRo
ZSBmaWxlcyBjb250YWluaW5nIHRoZSBtYXJrZXJzIGFuZCBnYXRoZXIgdGhlbS4NCj4+Pj4g
VGhpcyBpcyB3aGF0IGlzIGRvbmUgYWJvdmUuDQo+Pj4+DQo+Pj4+IEluIHRoZSBmaW5hbCBt
YWNybyBiZWxvdyB0aGUgcmVwbGFjZW1lbnRzIGFyZSBkb25lIHRoZW4uIEhvdyB3b3VsZCB5
b3UNCj4+Pj4gaGFuZGxlIHRoYXQ/DQo+Pj4NCj4+PiBCeSBwYXNzaW5nIChhbm90aGVyKSBh
cmd1bWVudCB0byB0aGUgbWFjcm8sIGZvciBleGFtcGxlLiBBcyBpbmRpY2F0ZWQNCj4+PiBl
YXJsaWVyLCBkaWZmZXJlbnQgc3ViLXRyZWVzIG1heSBoYXZlIGRpZmZlcmVudCBwbGFjZXMg
d2hlcmUgdGhlc2UNCj4+PiBkZWZpbml0aW9ucyBsaXZlLCBhbmQgdGhleSB3b3VsZCB3YW50
IHRvIGJlIGFibGUgdG8gcGFzcyB0aGF0IGluDQo+Pj4gKGlkZWFsbHkgd2l0aG91dCBuZWVk
aW5nIHRvIHB1dCB0aGlzIGluIGEgY29tbW9uIHBhcnQgb2YgdGhlIHRyZWUpLg0KPj4NCj4+
IEkgZG9uJ3QgZ2V0IHdoYXQgeW91IHdhbnQgdG8gcGFzcyBpbiBhZGRpdGlvbmFsbHkuDQo+
Pg0KPj4gSSd2ZSBhbHJlYWR5IGNoYW5nZWQgdGhlIG1hY3JvIGFuZCB0aGUgTWFrZWZpbGVz
IHRvIGJlIGFibGUgdG8gYWRkIGFub3RoZXINCj4+IG1hcmtlciBmaWxlIHRvIHRoZSBQQVRI
X0ZJTEVTIHZhcmlhYmxlLiBXaGF0IGVsc2UgZG8geW91IG5lZWQ/DQo+IA0KPiBXZWxsLCB0
aGF0J3Mgc2ltcGx5IGFuIG9kZCB3YXkgb2YgcGFzc2luZyBhIHBhcmFtZXRlci4gUGx1cywg
dGhlIGV4dHJhIGZpbGUNCg0KV2UgZG8gdGhhdCBhbGwgdGhlIHRpbWVzLCBlLmcuIGJ5ICJP
QkoteSArPSAuLi4iDQoNCj4gd29uJ3QgYWZmZWN0IElOQ19GSUxFUywgb3IgbW9yZSBwcmVj
aXNlbHkgaXRzIHVzZSBpbiB0aGUgaW5jbHVkZSBkaXJlY3RpdmUNCj4gaW4gcGF0Y2ggMTog
QXQgbGVhc3QgYWl1aSwgJChJTkNfRklMRVMpIGlzIGV4cGFuZGVkIGF0IHRoZSBwb2ludCB3
aGVuIHRoZQ0KPiBkaXJlY3RpdmUgaXMgcHJvY2Vzc2VkLiBIZW5jZSB3aHkgeW91IG5lZWQg
dG8gb3Blbi1jb2RlIGFub3RoZXIgaW5jbHVkZQ0KPiB0aGVyZS4NCg0KVGhlIElOQ19GSUxF
UyB2YXJpYWJsZSBpcyBtb3N0bHkgbmVlZGVkIGZvciBzcGVjaWZ5aW5nIHRoZSBkZXBlbmRl
bmNlIG9mDQp0aGUgZ2VuZXJhdGVkIGZpbGVzIG9uIHRoZSBmaWxlcyBtZW50aW9uZWQgaW4g
UEFUSF9GSUxFUy4NCg0KSXQgbWlnaHQgYmUgYmV0dGVyIHRvIGp1c3QgaGF2ZSAiLWluY2x1
ZGUgJChYRU5fUk9PVC9jb25maWcvUGF0aHMubWsiIGluDQpDb25maWcubWssIG1hdGNoaW5n
IHRoZSBzZXR0aW5nIG9mIFBBVEhfRklMRVMgdGhlcmUuDQoNCg0KSnVlcmdlbg0K
--------------ZmADpcFg0DLlpAexXdK27IJ0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ZmADpcFg0DLlpAexXdK27IJ0--

--------------hWJkwhnAaPtL2FfiBw0dRqiN--

--------------rnClgptvmRmrOv993EFk3d0G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkkU3AFAwAAAAAACgkQsN6d1ii/Ey8A
Twf/UfgaTjPzBNiEDKkHM5GoZcmlG/I5d9/uYnLSuL6dY/LBtGkYTjcfT4S665kOt8PCMjDgLz4o
+OysAij2an68us2lgR+M6XGKEEqwAy7FPq9iA0q7B9gIZAgSeCsyYalqzTCZ6XFdTp6tvP6xebOg
FYsAR7vkq5KjMmFqP4ytxhFNAHE9pvw6fgU9fashs4QgkO25y1UoB0v6oDCRYZ1E9NsqTt+udz4K
UhvSAc/N/3LA2Uo4P329LEeA6/dR3sVs1LA9jaQs1JZmypOnD3QuskXTno4cVC5vAeQRcaFO9KCp
Du0GT8YCKBQJmCV3dKpjPYztCxWS4XApo4i9PPJmfg==
=OMtR
-----END PGP SIGNATURE-----

--------------rnClgptvmRmrOv993EFk3d0G--

