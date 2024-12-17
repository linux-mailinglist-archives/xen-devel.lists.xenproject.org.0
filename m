Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD51F9F5010
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 16:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859363.1271490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZvL-00084s-1I; Tue, 17 Dec 2024 15:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859363.1271490; Tue, 17 Dec 2024 15:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZvK-00082R-UF; Tue, 17 Dec 2024 15:55:50 +0000
Received: by outflank-mailman (input) for mailman id 859363;
 Tue, 17 Dec 2024 15:55:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Iy1x=TK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tNZvJ-00082J-7i
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 15:55:49 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61511361-bc8f-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 16:55:47 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5d41848901bso9671443a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 07:55:47 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652f2599fsm4377087a12.68.2024.12.17.07.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 07:55:46 -0800 (PST)
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
X-Inumbo-ID: 61511361-bc8f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734450947; x=1735055747; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A1FJ2pBbOIfouCTKMcqgZiyKyvy9Yp0A06LNR1tI/H8=;
        b=Vmi78qtW/QxMehoCdlmlKRKIQ7VSSoFLuF+kRkwOv8pxoM90xiTXwgi54LttRX4xGR
         0Cw4A/W/2hY1P/xOj+3RdrR8c3WIp4KDdy18uz/Q3c8MRhYIB7qhI4vuoFnueYxnQdVg
         X//7cD1LsSKpAsxbJYxH8LHoDzGJGYx3uE2Rk2wiQfcunwfH19fHOvNlCAc5DV8407GD
         DV3xfu0P2Blfy/c1siqdwt4XgmgvthOA/PvRqKYRQ0BmYNnwbOK9+ud7VoMqsfLEQBKy
         hurA1VxwC9ghmAklIRmiPZDTqT6BPcoMW9aE2B75KbiVPpdtURkzqsKIs6CtNcziW9fT
         IA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734450947; x=1735055747;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A1FJ2pBbOIfouCTKMcqgZiyKyvy9Yp0A06LNR1tI/H8=;
        b=ntIZQR+npw4l/DAvwhgyZoMwTwQh/E+vvp0W8OsdVG4V8FCIu806lliiC+uaXYppN5
         YWHEUf81UWpSv+/1sNQ2rDxQp14PtiYqAntrRR/dtbX9eD7V9cuZVZNyjzmAb8gQHd5S
         Br+nCyCjI9zaWycxT+7Ybffgf3tFmPng1hyiRANtmaFCyH1cuhleSrCUBcdz+TwXA61E
         aAfEhYjlraUe0AOA+5nD2FK6g3uPgZ/s17rxBpZX6X8YmW+p6UdYRrz+B8dYTT6rIsxn
         WpJOEMM5Wz/OKszpUry9x8Ugf8E/zVJ7sjjw/RJmD6MWqOGeHHEyMXRbSO2Qc4Xu6FyA
         wYpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLnWhtU1B3sLim05QBkbnnKWqKHpaaROL9uOFP4NGm7AWD7RNYE1rSQu2zACm0o0XbTYylu+AoOoQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyvu8JBv9MJH7spvCtH8TexXdudWJOSE0YMr+Mta49IExc0FHgC
	KvylHBpk1fUTE4SlpWrN2iLKHT7xPojAgRKus2qc2tmqB1PiVXl22Xtbcdz9H7M=
X-Gm-Gg: ASbGncs+Qtkb/tkHixpXj3CG3OrajDGwlLWWxjq4V8SAM4y3tIQb3uRvVu/x02/pPjr
	Do2ooTRBs3Ya7uTa9OcSmSGDTWz5Yli33wbZXcm/inTnxDTwD1HCvirBS5uojyxaQ+owVSemPrC
	fqeC7I+JcOun0phsKfnrdNfabrQK5HdWzFBQkQdNYsrSRjjSkyMVVi9O87WamnGghuXKS/Ij93A
	BJi7DJj6v7eFnVZlgdfBWp7csDRcSo5nl9JfHVpmRgr+4j/09QdTZpONfZy7+BXV1K5AuXrGGpc
	iRQFXkh/Go/M22PglhWPUR+cRUC99nFI65Is/Ht3Umhl+KLUmBBiZ5t6jNApvl31DI9eiqEHBK0
	ZeW6uBg==
X-Google-Smtp-Source: AGHT+IEGcT1KuZPBOAL5DwZtvlbNZFE5JWyvbP/Ah7EejRGVzCbScH+7quOyl4RPYu64aRXLTr5KTg==
X-Received: by 2002:a05:6402:26c5:b0:5d0:96a:aa90 with SMTP id 4fb4d7f45d1cf-5d7d55e7578mr4042752a12.17.1734450946561;
        Tue, 17 Dec 2024 07:55:46 -0800 (PST)
Message-ID: <b7738421-5802-4179-8b6b-1ec18b8abd8a@suse.com>
Date: Tue, 17 Dec 2024 16:55:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] xen: add bitmap to indicate per-domain state
 changes
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241217142218.24129-1-jgross@suse.com>
 <20241217142218.24129-3-jgross@suse.com>
 <ce327545-c23b-4272-a290-ce950b4c27f5@suse.com>
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
In-Reply-To: <ce327545-c23b-4272-a290-ce950b4c27f5@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eTXP0Wp7Mp3kxg3MRtVVou3G"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eTXP0Wp7Mp3kxg3MRtVVou3G
Content-Type: multipart/mixed; boundary="------------9rekIVJhhd0PmixfbOwlJ49i";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <b7738421-5802-4179-8b6b-1ec18b8abd8a@suse.com>
Subject: Re: [PATCH v5 2/5] xen: add bitmap to indicate per-domain state
 changes
References: <20241217142218.24129-1-jgross@suse.com>
 <20241217142218.24129-3-jgross@suse.com>
 <ce327545-c23b-4272-a290-ce950b4c27f5@suse.com>
In-Reply-To: <ce327545-c23b-4272-a290-ce950b4c27f5@suse.com>
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

--------------9rekIVJhhd0PmixfbOwlJ49i
Content-Type: multipart/mixed; boundary="------------zJjCejBRpRY5Ye51sfXtpEfq"

--------------zJjCejBRpRY5Ye51sfXtpEfq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMTIuMjQgMTY6MTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4xMi4yMDI0
IDE1OjIyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQWRkIGEgYml0bWFwIHdpdGggb25l
IGJpdCBwZXIgcG9zc2libGUgZG9taWQgaW5kaWNhdGluZyB0aGUgcmVzcGVjdGl2ZQ0KPj4g
ZG9tYWluIGhhcyBjaGFuZ2VkIGl0cyBzdGF0ZSAoY3JlYXRlZCwgZGVsZXRlZCwgZHlpbmcs
IGNyYXNoZWQsDQo+PiBzaHV0ZG93bikuDQo+Pg0KPj4gUmVnaXN0ZXJpbmcgdGhlIFZJUlFf
RE9NX0VYQyBldmVudCB3aWxsIHJlc3VsdCBpbiBzZXR0aW5nIHRoZSBiaXRzIGZvcg0KPj4g
YWxsIGV4aXN0aW5nIGRvbWFpbnMgYW5kIHJlc2V0dGluZyBhbGwgb3RoZXIgYml0cy4NCj4+
DQo+PiBBcyB0aGUgdXNhZ2Ugb2YgdGhpcyBiaXRtYXAgaXMgdGlnaHRseSBjb3VwbGVkIHdp
dGggdGhlIFZJUlFfRE9NX0VYQw0KPj4gZXZlbnQsIGl0IGlzIG1lYW50IHRvIGJlIHVzZWQg
b25seSBieSBhIHNpbmdsZSBjb25zdW1lciBpbiB0aGUgc3lzdGVtLA0KPj4ganVzdCBsaWtl
IHRoZSBWSVJRX0RPTV9FWEMgZXZlbnQuDQo+IA0KPiBJJ20gc29ycnksIGJ1dCBJIG5lZWQg
dG8gY29tZSBiYWNrIHRvIHRoaXMuIEkgdGhvdWdodCBJIGhhZCBnb3QgY29udmluY2VkDQo+
IHRoYXQgb25seSBhIHNpbmdsZSBlbnRpdHkgaW4gdGhlIHN5c3RlbSBjYW4gYmluZCB0aGlz
IHZJUlEuIFlldCB1cG9uDQo+IGNoZWNraW5nIEkgY2FuJ3Qgc2VlbSB0byBmaW5kIHdoYXQg
d291bGQgZ3VhcmFudGVlIHRoaXMuIEluIHBhcnRpY3VsYXINCj4gYmluZGluZyBhIHZJUlEg
ZG9lc24ndCBpbnZvbHZlIGFueSBYU00gY2hlY2suIEhlbmNlIGFuIHVucHJpdmlsZWdlZCBl
bnRpdHkNCj4gY291bGQsIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQgdGhlIGludGVyZXN0ZWQg
cHJpdmlsZWdlZCBlbnRpdHkgKHhlbnN0b3JlKQ0KPiBpcyBhbHJlYWR5IHVwIGFuZCBydW5u
aW5nLCBiaW5kIGFuZCB1bmJpbmQgdGhpcyB2SVJRLCBqdXN0IHRvIGhhdmUgdGhlDQo+IGds
b2JhbCBtYXAgZnJlZWQuIFdoYXQgYW0gSSBvdmVybG9va2luZyAod2hpY2ggd291bGQgbGlr
ZWx5IHdhbnQgc3RhdGluZw0KPiBoZXJlKT8NCg0KSSB0aGluayB5b3UgYXJlIG5vdCBvdmVy
bG9va2luZyBhbnl0aGluZy4NCg0KSSBndWVzcyB0aGlzIGNhbiBlYXNpbHkgYmUgaGFuZGxl
ZCBieSBjaGVja2luZyB0aGF0IHRoZSBWSVJRX0RPTV9FWEMgaGFuZGxpbmcNCmRvbWFpbiBp
cyB0aGUgY2FsbGluZyBvbmUgaW4gZG9tYWluX1tkZV1pbml0X3N0YXRlcygpLiBOb3RlIHRo
YXQgZ2xvYmFsIHZpcnFzDQphcmUgb25seSBldmVyIHNlbnQgdG8gdmNwdVswXSBvZiB0aGUg
aGFuZGxpbmcgZG9tYWluLCBzbyByZWJpbmRpbmcgdGhlIGV2ZW50DQp0byBhbm90aGVyIHZj
cHUgaXMgcG9zc2libGUsIGJ1dCBkb2Vzbid0IG1ha2Ugc2Vuc2UuDQoNCj4gDQo+PiBWNToN
Cj4+IC0gZG9tYWluX2luaXRfc3RhdGVzKCkgbWF5IGJlIGNhbGxlZCBvbmx5IGlmIGV2dGNo
bl9iaW5kX3ZpcnEoKSBoYXMgYmVlbg0KPj4gICAgY2FsbGVkIHZhbGlkbHkgKEphbiBCZXVs
aWNoKQ0KPiANCj4gSSBub3cgcmVjYWxsIHdoeSBJIGhhZCBmaXJzdCBzdWdnZXN0ZWQgdGhl
IHBsYWNlbWVudCBsYXRlciBpbiB0aGUgaGFuZGxpbmc6DQo+IFlvdSdyZSBub3cgZG9pbmcg
dGhlIGFsbG9jYXRpb24gd2l0aCB5ZXQgYW5vdGhlciBsb2NrIGhlbGQuIEl0J3MgbGlrZWx5
IG5vdA0KPiB0aGUgZW5kIG9mIHRoZSB3b3JsZCwgYnV0IC4uLg0KPiANCj4+IEBAIC0xMzgs
NiArMTM5LDYwIEBAIGJvb2wgX19yZWFkX21vc3RseSB2bXRyYWNlX2F2YWlsYWJsZTsNCj4+
ICAgDQo+PiAgIGJvb2wgX19yZWFkX21vc3RseSB2cG11X2lzX2F2YWlsYWJsZTsNCj4+ICAg
DQo+PiArc3RhdGljIERFRklORV9TUElOTE9DSyhkb21fc3RhdGVfY2hhbmdlZF9sb2NrKTsN
Cj4+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyAqX19yZWFkX21vc3RseSBkb21fc3RhdGVfY2hh
bmdlZDsNCj4+ICsNCj4+ICtpbnQgZG9tYWluX2luaXRfc3RhdGVzKHZvaWQpDQo+PiArew0K
Pj4gKyAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpkOw0KPj4gKyAgICBpbnQgcmMgPSAtRU5P
TUVNOw0KPj4gKw0KPj4gKyAgICBzcGluX2xvY2soJmRvbV9zdGF0ZV9jaGFuZ2VkX2xvY2sp
Ow0KPj4gKw0KPj4gKyAgICBpZiAoIGRvbV9zdGF0ZV9jaGFuZ2VkICkNCj4+ICsgICAgICAg
IGJpdG1hcF96ZXJvKGRvbV9zdGF0ZV9jaGFuZ2VkLCBET01JRF9GSVJTVF9SRVNFUlZFRCk7
DQo+PiArICAgIGVsc2UNCj4+ICsgICAgew0KPj4gKyAgICAgICAgZG9tX3N0YXRlX2NoYW5n
ZWQgPSB4dnphbGxvY19hcnJheSh1bnNpZ25lZCBsb25nLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVRTX1RPX0xPTkdTKERPTUlEX0ZJUlNU
X1JFU0VSVkVEKSk7DQo+IA0KPiAuLi4gYWxyZWFkeSB0aGlzIGFsb25lIHdhc24ndCBuaWNl
LCBhbmQgY291bGQgYmUgYXZvaWRlZCAoYnkgZG9pbmcgdGhlDQo+IGFsbG9jYXRpb24gcHJp
b3IgdG8gYWNxdWlyaW5nIHRoZSBsb2NrLCB3aGljaCBvZiBjb3Vyc2UgY29tcGxpY2F0ZXMg
dGhlDQo+IGxvZ2ljIHNvbWUpLg0KPiANCj4gV2hhdCdzIHBlcmhhcHMgbGVzcyBkZXNpcmFi
bGUgaXMgdGhhdCAuLi4NCj4gDQo+PiBAQCAtNDk0LDYgKzQ5NSwxNSBAQCBpbnQgZXZ0Y2hu
X2JpbmRfdmlycShldnRjaG5fYmluZF92aXJxX3QgKmJpbmQsIGV2dGNobl9wb3J0X3QgcG9y
dCkNCj4+ICAgICAgICAgICBnb3RvIG91dDsNCj4+ICAgICAgIH0NCj4+ICAgDQo+PiArICAg
IGlmICggdmlycSA9PSBWSVJRX0RPTV9FWEMgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBy
YyA9IGRvbWFpbl9pbml0X3N0YXRlcygpOw0KPj4gKyAgICAgICAgaWYgKCByYyApDQo+PiAr
ICAgICAgICAgICAgZ290byBvdXQ7DQo+PiArDQo+PiArICAgICAgICBkZWluaXRfaWZfZXJy
ID0gdHJ1ZTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gICAgICAgcG9ydCA9IHJjID0gZXZ0Y2hu
X2dldF9wb3J0KGQsIHBvcnQpOw0KPj4gICAgICAgaWYgKCByYyA8IDAgKQ0KPj4gICAgICAg
ew0KPiANCj4gLi4uIHRoZSBwbGFjZW1lbnQgaGVyZSBhZGRpdGlvbmFsbHkgaW50cm9kdWNl
cyBsb2NrIG5lc3Rpbmcgd2hlbiByZWFsbHkNCj4gdGhlIHR3byBsb2NrcyBzaG91bGRuJ3Qg
aGF2ZSBhbnkgcmVsYXRpb25zaGlwLg0KPiANCj4gSG93IGFib3V0IGdpdmluZyBkb21haW5f
aW5pdF9zdGF0ZXMoKSBhIGJvb2xlYW4gcGFyYW1ldGVyLCBzdWNoIHRoYXQgaXQNCj4gY2Fu
IGJlIGNhbGxlZCB0d2ljZSwgd2l0aCB0aGUgZmlyc3QgaW52b2NhdGlvbiBtb3ZlZCBiYWNr
IHVwIHdoZXJlIGl0DQo+IHdhcywgYW5kIHRoZSBzZWNvbmQgb25lIHB1dCAuLi4NCj4gDQo+
PiBAQCAtNTI3LDYgKzUzNyw5IEBAIGludCBldnRjaG5fYmluZF92aXJxKGV2dGNobl9iaW5k
X3ZpcnFfdCAqYmluZCwgZXZ0Y2huX3BvcnRfdCBwb3J0KQ0KPj4gICAgb3V0Og0KPj4gICAg
ICAgd3JpdGVfdW5sb2NrKCZkLT5ldmVudF9sb2NrKTsNCj4+ICAgDQo+PiArICAgIGlmICgg
cmMgJiYgZGVpbml0X2lmX2VyciApDQo+PiArICAgICAgICBkb21haW5fZGVpbml0X3N0YXRl
cygpOw0KPj4gKw0KPj4gICAgICAgcmV0dXJuIHJjOw0KPj4gICB9DQo+IA0KPiAuLi4gZG93
biBoZXJlLCBub3QgZG9pbmcgYW55IGFsbG9jYXRpb24gYXQgYWxsIChvbmx5IHRoZSBjbGVh
cmluZyksIGFuZA0KPiBoZW5jZSBlbGltaW5hdGluZyB0aGUgbmVlZCB0byBkZWFsIHdpdGgg
aXRzIGZhaWx1cmU/IChBbHRlcm5hdGl2ZWx5DQo+IHRoZXJlIGNvdWxkIG9mIGNvdXJzZSBi
ZSBhIHNwbGl0IGludG8gYW4gaW5pdCBhbmQgYSByZXNldCBmdW5jdGlvbi4pDQo+IA0KPiBU
aGVyZSBvZiBjb3Vyc2UgaXMgdGhlIGNoYW5jZSBvZiByYWNlcyB3aXRoIHN1Y2ggYW4gYXBw
cm9hY2guIEknZCBsaWtlDQo+IHRvIG5vdGUgdGhvdWdoIHRoYXQgd2l0aCB0aGUgcGxhY2Vt
ZW50IG9mIHRoZSBjYWxsIGluIHRoZSBodW5rIGFib3ZlDQo+IHRoZXJlJ3MgYSBtaW5vciBy
YWNlLCB0b28gKGFnYWluc3QgLi4uDQo+IA0KPj4gQEAgLTczMCw2ICs3NDMsOSBAQCBpbnQg
ZXZ0Y2huX2Nsb3NlKHN0cnVjdCBkb21haW4gKmQxLCBpbnQgcG9ydDEsIGJvb2wgZ3Vlc3Qp
DQo+PiAgICAgICAgICAgc3RydWN0IHZjcHUgKnY7DQo+PiAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBmbGFnczsNCj4+ICAgDQo+PiArICAgICAgICBpZiAoIGNobjEtPnUudmlycSA9PSBW
SVJRX0RPTV9FWEMgKQ0KPj4gKyAgICAgICAgICAgIGRvbWFpbl9kZWluaXRfc3RhdGVzKCk7
DQo+IA0KPiAuLi4gdGhpcyBhbmQgdGhlIHNhbWUgcmVtb3RlIHZDUFUgdGhlbiBpbW1lZGlh
dGVseSBiaW5kaW5nIHRoZSB2SVJRDQo+IGFnYWluKS4gSGVuY2UgeWV0IGFub3RoZXIgYWx0
ZXJuYXRpdmUgd291bGQgYXBwZWFyIHRvIGJlIHRvIGRyb3AgdGhlDQo+IG5ldyBnbG9iYWwg
bG9jayBhbmQgdXNlIGQtPmV2ZW50X2xvY2sgZm9yIHN5bmNocm9uaXphdGlvbiBpbnN0ZWFk
DQo+IChwcm92aWRlZCAtIHNlZSBhYm92ZSAtIHRoYXQgb25seSBhIHNpbmdsZSBlbnRpdHkg
Y2FuIGFjdHVhbGx5IHNldCB1cA0KPiBhbGwgb2YgdGhpcykuIFRoYXQgd291bGQgcHJldHR5
IG11Y2ggd2FudCB0byBoYXZlIHRoZSBhbGxvY2F0aW9uIGtlcHQNCj4gd2l0aCB0aGUgbG9j
ayBhbHJlYWR5IGhlbGQgKHdoaWNoIGlzbid0IG5pY2UsIGJ1dCBhcyBzYWlkIGlzIHBlcmhh
cHMNCj4gdG9sZXJhYmxlKSwgYnV0IHdvdWxkIGF0IGxlYXN0IGVsaW1pbmF0ZSB0aGUgdW5k
ZXNpcmFibGUgbG9jayBuZXN0aW5nLg0KPiANCj4gUmUtdXNlIG9mIHRoZSBkb21haW4ncyBl
dmVudCBsb2NrIGlzIGF0IGxlYXN0IHNvbWV3aGF0IGp1c3RpZmllZCBieQ0KPiB0aGUgYml0
IGFycmF5IGJlaW5nIHRpZWQgdG8gVklSUV9ET01fRVhFQy4NCj4gDQo+IFRob3VnaHRzPw0K
DQpXaXRoIG15IHN1Z2dlc3Rpb24gYWJvdmUgSSB0aGluayB0aGVyZSBpcyBubyByYWNlLCBh
cyBvbmx5IHRoZSBkb21haW4gaGFuZGxpbmcNClZJUlFfRE9NX0VYQyBjb3VsZCBhbGxvYy9k
ZWFsbG9jIGRvbV9zdGF0ZV9jaGFuZ2VkLg0KDQpVc2luZyBkLT5ldmVudF9sb2NrIGZvciBz
eW5jaHJvbml6YXRpb24gaXMgbm90IGEgbmljZSBvcHRpb24gSU1PLCBhcyBpdCB3b3VsZA0K
cmVxdWlyZSB0byB0YWtlIHRoZSBldmVudF9sb2NrIG9mIHRoZSBkb21haW4gaGFuZGxpbmcg
VklSUV9ET01fRVhFQyB3aGVuIHRyeWluZw0KdG8gc2V0IGEgYml0IGZvciBhbm90aGVyIGRv
bWFpbiBjaGFuZ2luZyBzdGF0ZS4NCg0KDQpKdWVyZ2VuDQo=
--------------zJjCejBRpRY5Ye51sfXtpEfq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------zJjCejBRpRY5Ye51sfXtpEfq--

--------------9rekIVJhhd0PmixfbOwlJ49i--

--------------eTXP0Wp7Mp3kxg3MRtVVou3G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdhnwEFAwAAAAAACgkQsN6d1ii/Ey8f
9AgAlUWmKjAMKfwze+GdX2gtvNPwuGn8HtGmgdpfvVu78EcZqaBPr+T00NM1+HpA0qriaZJdSDDd
aSlY8Y5lcnM0bDrNCgnaqu1AwX1r68aDIQ35fZvdWwypz2gsLCf1QAfXFRdJLU4Ob5KAi2YjjpAx
zwdjge4kMRcYNkfumyPcPTBsmJIPaZg6N7id1FZARRDs9Cqef62qpqESwW0e6Ob30lIabvFKQy4K
FpOL/oA37+oEZpTdB5x4Y6YkiR9CiAL6O7zjBCzwTgmDeAQvu4braO9fqKloc47Na9oxB+sDfNb3
dRuVI5bwlcRGd1xLysMKS0gYF6c1zphVi1ZshBHB/w==
=Lh7p
-----END PGP SIGNATURE-----

--------------eTXP0Wp7Mp3kxg3MRtVVou3G--

