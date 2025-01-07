Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B72AA046F4
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 17:46:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866670.1278007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCiS-0003gX-D0; Tue, 07 Jan 2025 16:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866670.1278007; Tue, 07 Jan 2025 16:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCiS-0003du-AH; Tue, 07 Jan 2025 16:46:04 +0000
Received: by outflank-mailman (input) for mailman id 866670;
 Tue, 07 Jan 2025 16:46:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tVCiR-0003do-Du
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 16:46:03 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e12a063c-cd16-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 17:46:02 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso156799635e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 08:46:02 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b4432dsm632975125e9.41.2025.01.07.08.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 08:46:01 -0800 (PST)
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
X-Inumbo-ID: e12a063c-cd16-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736268362; x=1736873162; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tc4l18DronqzPGD59Z1aht7nudFiCBklHDYbG/UzLMs=;
        b=BNTnU9/DUUrVkhcpc0xm9Y/0JHmED72Nx8uM3rzwMEmYbfaWnIuYRiW5uDyHQBoVem
         a86T6zkF/h2maYDeTZ6ohdyuCKELU23LzENnTwrTiM0BWJYycNRKWCzK+RA4PwaBxtHo
         zUb2+kcjRl2ZWhydezK72/LKO9QhWatyuU+3pmSl+b0w7jW/ViKDS3kQNqfQXlEt31Dp
         Nrvvm7zDWuWoQdIvJngh2B54BORANTmjCGEw9yVj8puRydj3jZRHW/E4Kgay1iTCs31s
         Y3m9/L6UNqFQF3J1nTyAid8EWgFY2wkm3JyHAjhaiPPSPbgvI4D/Pp3qSP9G/2Zn98Zr
         oj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268362; x=1736873162;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tc4l18DronqzPGD59Z1aht7nudFiCBklHDYbG/UzLMs=;
        b=Sm0Yd74x/qo8d1F6NrG5ltIAvlg1EfhqXI7qptFp5VsCPtCzDggh48EVZbDnCf2ujx
         V7lQO2NvG2j2ERisMuBhyblZSfnMFh+W5h0vd0tohjZPAx0obDWqa7jRd1zMWQdgfzPn
         vWcGi2oXBTaUvN3LSEjLXnvoq0nTYbDfbXl8IHfLeXREmCpShyN+SSa19k+RoxVxu/fy
         iXBiaxYdzPJUNkuE/Xw0uy5IWs77cR6Rn6qwBpcXskZn+T9NPDE7NDbstBFz42qdZegG
         4F1qMl9NZzVrUlPcVskDBa8h33yhBcAVeWcDJ0gdRftDPsLDrM1YnUHEPIcEmy9wUp61
         E+xg==
X-Forwarded-Encrypted: i=1; AJvYcCXVIt6MhEeAK7HHETkk/Wp/uPTpDicPc2SkYaaVRm4W+AMAJ4kzS/FF0LHgQ9BF8LJgW/qaTiqirfA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydiGqq0J79ainhzKETGwzNtL+r/uopxXzqbv11bdSHuqYeqnls
	YRlDPqMxtgYSVW8DbpAzY7kyGBQqqrFXebbe8mn9tfa4naxSP2ZDUFUfFQhtZY0=
X-Gm-Gg: ASbGncs9sLoJmOY5lMNleeB6rWufJYOqPlXr5fFSVguzdTvnJvJ1RaDOx+P4X3OICK7
	18bSCeK6zo8v6lsnWW6LoLW7cnpDy7j4Tn5b0G5oxUsZQV7qDotoCWpfoPqFFl5iDc+l4BlYnup
	A8mi8edDs9Ewd03GAe9muv1gcuMvZRJnUZJdbBVSW2t/UkynH3/tM7FrajRJzLZPd1wp2qYdFEa
	3l90gRvmy+HUG6VTpUXR6C3v3euZqF36lFcWAJ/SLolZGmD7ueKfM8yV8uom/QnnfCUTRo2MsdE
	Azn4jYkVJKixnKBDhWCpMOwk2Vq6AUCpmR62rB3GbV3gQAVRC+zABRCvzMs1A7SZPm854weUSB9
	pDD16AA==
X-Google-Smtp-Source: AGHT+IEm3k+cp94ev9fEGRBBVX2OylrgNWBrIgvqSqgsnNGiV6fuW2HwVBeeTrWshPNtX4uNU0gywA==
X-Received: by 2002:a05:6000:4603:b0:382:38e6:1eb3 with SMTP id ffacd0b85a97d-38a221ffbcamr44088822f8f.30.1736268361744;
        Tue, 07 Jan 2025 08:46:01 -0800 (PST)
Message-ID: <236583ca-a9e7-4354-86b7-e27aba0b0e2e@suse.com>
Date: Tue, 7 Jan 2025 17:46:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] xen: add bitmap to indicate per-domain state
 changes
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-5-jgross@suse.com>
 <b77141df-fa14-426a-937f-42693d1caeb9@suse.com>
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
In-Reply-To: <b77141df-fa14-426a-937f-42693d1caeb9@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NS2cgfNO7fcBGpcJrs4gyAVo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NS2cgfNO7fcBGpcJrs4gyAVo
Content-Type: multipart/mixed; boundary="------------JL0EmhrgxgpWDJkwKzyNi4Y7";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <236583ca-a9e7-4354-86b7-e27aba0b0e2e@suse.com>
Subject: Re: [PATCH v6 4/7] xen: add bitmap to indicate per-domain state
 changes
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-5-jgross@suse.com>
 <b77141df-fa14-426a-937f-42693d1caeb9@suse.com>
In-Reply-To: <b77141df-fa14-426a-937f-42693d1caeb9@suse.com>
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

--------------JL0EmhrgxgpWDJkwKzyNi4Y7
Content-Type: multipart/mixed; boundary="------------0W2c3mV91g5x7ezp9ynggHLq"

--------------0W2c3mV91g5x7ezp9ynggHLq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDEuMjUgMTc6MTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNy4wMS4yMDI1
IDExOjE3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQWRkIGEgYml0bWFwIHdpdGggb25l
IGJpdCBwZXIgcG9zc2libGUgZG9taWQgaW5kaWNhdGluZyB0aGUgcmVzcGVjdGl2ZQ0KPj4g
ZG9tYWluIGhhcyBjaGFuZ2VkIGl0cyBzdGF0ZSAoY3JlYXRlZCwgZGVsZXRlZCwgZHlpbmcs
IGNyYXNoZWQsDQo+PiBzaHV0ZG93bikuDQo+Pg0KPj4gUmVnaXN0ZXJpbmcgdGhlIFZJUlFf
RE9NX0VYQyBldmVudCB3aWxsIHJlc3VsdCBpbiBzZXR0aW5nIHRoZSBiaXRzIGZvcg0KPj4g
YWxsIGV4aXN0aW5nIGRvbWFpbnMgYW5kIHJlc2V0dGluZyBhbGwgb3RoZXIgYml0cy4NCj4+
DQo+PiBBcyB0aGUgdXNhZ2Ugb2YgdGhpcyBiaXRtYXAgaXMgdGlnaHRseSBjb3VwbGVkIHdp
dGggdGhlIFZJUlFfRE9NX0VYQw0KPj4gZXZlbnQsIGl0IGlzIG1lYW50IHRvIGJlIHVzZWQg
b25seSBieSBhIHNpbmdsZSBjb25zdW1lciBpbiB0aGUgc3lzdGVtLA0KPj4ganVzdCBsaWtl
IHRoZSBWSVJRX0RPTV9FWEMgZXZlbnQuDQo+Pg0KPj4gUmVzZXR0aW5nIGEgYml0IHdpbGwg
YmUgZG9uZSBpbiBhIGZ1dHVyZSBwYXRjaC4NCj4+DQo+PiBUaGlzIGluZm9ybWF0aW9uIGlz
IG5lZWRlZCBmb3IgWGVuc3RvcmUgdG8ga2VlcCB0cmFjayBvZiBhbGwgZG9tYWlucy4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+
PiAtLS0NCj4+IFYyOg0KPj4gLSB1c2UgRE9NSURfRklSU1RfUkVTRVJWRUQgaW5zdGVhZCBv
ZiBET01JRF9NQVNLICsgMSAoSmFuIEJldWxpY2gpDQo+PiAtIHVzZSBjb25zdCAoSmFuIEJl
dWxpY2gpDQo+PiAtIG1vdmUgY2FsbCBvZiBkb21haW5fcmVzZXRfc3RhdGVzKCkgaW50byBl
dnRjaG5fYmluZF92aXJxKCkgKEphbiBCZXVsaWNoKQ0KPj4gLSBkeW5hbWljYWxseSBhbGxv
Y2F0ZSBkb21fc3RhdGVfY2hhbmdlZCBiaXRtYXAgKEphbiBCZXVsaWNoKQ0KPj4gVjM6DQo+
PiAtIHVzZSB4dnphbGxvY19hcnJheSgpIChKYW4gQmV1bGljaCkNCj4+IC0gZG9uJ3QgcmVu
YW1lIGV4aXN0aW5nIGxhYmVsIChKYW4gQmV1bGljaCkNCj4+IFY0Og0KPj4gLSBhZGQgX19y
ZWFkX21vc3RseSAoSmFuIEJldWxpY2gpDQo+PiAtIHVzZSBfX3NldF9iaXQoKSAoSmFuIEJl
dWxpY2gpDQo+IA0KPiBUaGlzIGNoYW5nZSBsb29rcyB0byBoYXZlIGJlZW4gbG9zdCwgLi4u
DQo+IA0KPj4gLSBmaXggZXJyb3IgaGFuZGxpbmcgaW4gZXZ0Y2huX2JpbmRfdmlycSgpIChK
YW4gQmV1bGljaCkNCj4+IFY1Og0KPj4gLSBkb21haW5faW5pdF9zdGF0ZXMoKSBtYXkgYmUg
Y2FsbGVkIG9ubHkgaWYgZXZ0Y2huX2JpbmRfdmlycSgpIGhhcyBiZWVuDQo+PiAgICBjYWxs
ZWQgdmFsaWRseSAoSmFuIEJldWxpY2gpDQo+PiBWNjoNCj4+IC0gZ3VhcmQgZG9tX3N0YXRl
X2NoYW5nZWQgYml0bWFwIHdpdGggZC0+ZXZlbnRfbG9jayAoSmFuIEJldWxpY2gpDQo+IA0K
PiAuLi4gd2l0aG91dCBpdCBiZWluZyBtZW50aW9uZWQgYW55d2hlcmUsIGFuZCB3aXRob3V0
IGl0IGJlY29taW5nIGNsZWFyIHdoeQ0KPiBpdCB3b3VsZCBoYXZlIG5lZWRlZCB1bmRvaW5n
Lg0KDQpPaCwgdGhhbmtzIGZvciBzcG90dGluZy4gSSBjaGFuZ2VkIHRoYXQgYnkgYWNjaWRl
bnQgYW5kIG1pc3NlZCB0byB1bmRvDQp0aGlzIGNoYW5nZS4NCg0KPiANCj4+IC0tLSBhL3hl
bi9jb21tb24vZG9tYWluLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4+IEBA
IC0zNSw2ICszNSw3IEBADQo+PiAgICNpbmNsdWRlIDx4ZW4vaXJxLmg+DQo+PiAgICNpbmNs
dWRlIDx4ZW4vYXJnby5oPg0KPj4gICAjaW5jbHVkZSA8eGVuL2xsYy1jb2xvcmluZy5oPg0K
Pj4gKyNpbmNsdWRlIDx4ZW4veHZtYWxsb2MuaD4NCj4+ICAgI2luY2x1ZGUgPGFzbS9wMm0u
aD4NCj4+ICAgI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4NCj4+ICAgI2luY2x1ZGUgPHB1
YmxpYy9zY2hlZC5oPg0KPj4gQEAgLTEzOSw2ICsxNDAsNTEgQEAgYm9vbCBfX3JlYWRfbW9z
dGx5IHZtdHJhY2VfYXZhaWxhYmxlOw0KPj4gICANCj4+ICAgYm9vbCBfX3JlYWRfbW9zdGx5
IHZwbXVfaXNfYXZhaWxhYmxlOw0KPj4gICANCj4+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyAq
X19yZWFkX21vc3RseSBkb21fc3RhdGVfY2hhbmdlZDsNCj4+ICsNCj4+ICtpbnQgZG9tYWlu
X2luaXRfc3RhdGVzKHZvaWQpDQo+PiArew0KPj4gKyAgICBjb25zdCBzdHJ1Y3QgZG9tYWlu
ICpkOw0KPj4gKw0KPj4gKyAgICBBU1NFUlQoIWRvbV9zdGF0ZV9jaGFuZ2VkKTsNCj4+ICsg
ICAgQVNTRVJUKHJ3X2lzX3dyaXRlX2xvY2tlZCgmY3VycmVudC0+ZG9tYWluLT5ldmVudF9s
b2NrKSk7DQo+IA0KPiByd19pc193cml0ZV9sb2NrZWRfYnlfbWUoKT8NCg0KWWVzLCBwcm9i
YWJseSBiZXR0ZXIuDQoNCj4gDQo+PiArICAgIGRvbV9zdGF0ZV9jaGFuZ2VkID0geHZ6YWxs
b2NfYXJyYXkodW5zaWduZWQgbG9uZywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBCSVRTX1RPX0xPTkdTKERPTUlEX0ZJUlNUX1JFU0VSVkVEKSk7DQo+
PiArICAgIGlmICggIWRvbV9zdGF0ZV9jaGFuZ2VkICkNCj4+ICsgICAgICAgIHJldHVybiAt
RU5PTUVNOw0KPj4gKw0KPj4gKyAgICByY3VfcmVhZF9sb2NrKCZkb21saXN0X3JlYWRfbG9j
ayk7DQo+PiArDQo+PiArICAgIGZvcl9lYWNoX2RvbWFpbiAoIGQgKQ0KPj4gKyAgICAgICAg
c2V0X2JpdChkLT5kb21haW5faWQsIGRvbV9zdGF0ZV9jaGFuZ2VkKTsNCj4+ICsNCj4+ICsg
ICAgcmN1X3JlYWRfdW5sb2NrKCZkb21saXN0X3JlYWRfbG9jayk7DQo+PiArDQo+PiArICAg
IHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICt2b2lkIGRvbWFpbl9kZWluaXRfc3RhdGVz
KGNvbnN0IHN0cnVjdCBkb21haW4gKmQpDQo+PiArew0KPj4gKyAgICBBU1NFUlQocndfaXNf
d3JpdGVfbG9ja2VkKCZkLT5ldmVudF9sb2NrKSk7DQo+IA0KPiBBZ2Fpbi4NCg0KWWVzLg0K
DQoNCkp1ZXJnZW4NCg==
--------------0W2c3mV91g5x7ezp9ynggHLq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0W2c3mV91g5x7ezp9ynggHLq--

--------------JL0EmhrgxgpWDJkwKzyNi4Y7--

--------------NS2cgfNO7fcBGpcJrs4gyAVo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmd9WkgFAwAAAAAACgkQsN6d1ii/Ey+n
XQf8DH81Y/VZ06q6r6ASpK43Mj8UZod3GCuUqTynddHGKx/hdLOVZyHzxG6Cft6jkBhxLj87Lv5q
SepmIsz5+91PnlQs0d29nvMaPunUQcTn7/jOmY+1tyv7/yJklKI7ZSB8VOUPDBSh2avh+6tsr2Kr
GMoKoPqQ7y/iZzUc91w5kJbf2KYuvCR33bfcyyYAEvBPIOKEn56pWgGWYFWzv0WI1ABfZ5zLVjlt
UpBb7h0JOGFn82vI/YIBSS51B21VAiyFqk2j8bTCVvCU6xDJF+xrs/ZErR7JbUPpvTvudsZWDmUw
eZ6FuzESi01sIQr3K4EIjYZ65T1jDN7pTYhAs775rw==
=6QLo
-----END PGP SIGNATURE-----

--------------NS2cgfNO7fcBGpcJrs4gyAVo--

