Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9524A36DA4
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 12:15:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889380.1298511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjG8G-0008RT-DB; Sat, 15 Feb 2025 11:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889380.1298511; Sat, 15 Feb 2025 11:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjG8G-0008PV-9P; Sat, 15 Feb 2025 11:14:48 +0000
Received: by outflank-mailman (input) for mailman id 889380;
 Sat, 15 Feb 2025 11:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tjG8E-0008PP-7s
 for xen-devel@lists.xenproject.org; Sat, 15 Feb 2025 11:14:46 +0000
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [2a00:1450:4864:20::441])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e69970a-eb8e-11ef-9896-31a8f345e629;
 Sat, 15 Feb 2025 12:14:43 +0100 (CET)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-38dc5764fc0so2427110f8f.3
 for <xen-devel@lists.xenproject.org>; Sat, 15 Feb 2025 03:14:43 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259fdce7sm7059692f8f.96.2025.02.15.03.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Feb 2025 03:14:42 -0800 (PST)
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
X-Inumbo-ID: 0e69970a-eb8e-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739618082; x=1740222882; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JEB/NMoZQs+AbyiicyPPH6D5+uq64R9uU4nh0xFgoaI=;
        b=YpspE5pCm0k/lyTLL4fnz7QPQwopPOYglS1KrUF3OZIrNmQEVLqyU1v8Q0wA8qIjTJ
         vIMIinssHExKrEXm5PSesijaOMxy7RfEiX/vcmTdW6CWr7PLKZAo9ckkrOqwq5yfCPfx
         1VzZip1+8bHcv50EiTzBwOZJi9SJKIEgjSHsbNBH+iip1axIegpPUDGvwVrLyQ0ujqhH
         VV/xXU396Xd9JAJcMOG0zI6aVyCMh/5boiIWur2l/8a/uQRczo66xfpOKJQj40burCZb
         mWUPmF3Iz8ai2F5p8ymt+rg/uRrfaT7HZ9Jdqu9+9f+DRccvA0pe/btxGkqKsdb534EV
         nn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739618082; x=1740222882;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JEB/NMoZQs+AbyiicyPPH6D5+uq64R9uU4nh0xFgoaI=;
        b=vKpy2qjzbj1iRwkrIJsE7/71+M5Uvn4cP/MaY7vOxv1JWMkNPFiOxMQx6lp3tuGkrn
         zIwrFXN7yZyiOfRRPIpYF50rWTbmay9Q1mDeayFedE4zFVWxP9ohDduO3v5Z3HwrwDZ5
         y58nuI1eioyfyHwKUyCTzDSQtdFz/G1+Bw+F0psEHLD5keturUWSroMP+dVDo6ZJeeiO
         rIIHhoGWvv5M/sOI0Lt8yZfQUWZTZ3XmN5FJk+Laaz10hd/FrpZLnaCxGv5o68QYZOS4
         IbDSyWtnU/TWwD4TldOWx55yENWMdWTpOVMbVYZjt7YhLkAcCFK/qx4bhpehQ5tvNGoe
         RQrA==
X-Forwarded-Encrypted: i=1; AJvYcCVW9U6t5p0TDgDjI3y2vDoE93DvUKiDIsZC3rjCMxiP38QbeevAq7w4fSv76GR61OZPX9hAyQG46G4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwpjXSMzZDAz6rNZffAsKZOtrIaK6o2ls07Nji+8kkp8SYrS0H
	RgAoWsxmz0o+sAOrNTxVgOFgIMy8DwwqfNmbr6YFenaUEouJD8KT+2GHRtpo9DY=
X-Gm-Gg: ASbGnctG5v3HxAEhrd2VxvL6gkUc3VENLeHqZluZo0sK9M09gsQ2NyE30egpwHSK44b
	cyFWlQQY+1z1JEekuCi+TW3HsgitwcDy1TekVGK2LJgL/1XjMOmOzaBtNExwH/Iies+ZXXU7eAy
	/U8pJwRi/R81FUEz7FIvRNjTabBcZYCH06y9AAwS5OlGCwhsRLtv+ATdAdOClrQfjr/s0BFQy19
	GHwtFB0D1OErfzu6kvVQmCx4133KT6EtfQ+lZQWdDeXPB1plDTNThD2UpAhaiJj2dBQLIYn1W1d
	yT2oiZjJ88itOkDCs/a7dncGW9TW/+S/KRp47kfiVe2/jKgGikshJFa2lWceH8UeZ6JTE1S8+qq
	3jUZWuFZeWMRoCe6y99Sr23gQdOFcfpRyMbel8A==
X-Google-Smtp-Source: AGHT+IEq9X9xrsRogHZoBQ34I4TxrH9kLaD9GKTVNRzJU3lUTqM5Dm3mjz6MibIi2wgoCByXhzv1qg==
X-Received: by 2002:a5d:4807:0:b0:38d:d0ca:fbad with SMTP id ffacd0b85a97d-38f33f382dfmr2731977f8f.14.1739618082587;
        Sat, 15 Feb 2025 03:14:42 -0800 (PST)
Message-ID: <9a418f50-3635-4cc6-8d62-037a270cbf40@suse.com>
Date: Sat, 15 Feb 2025 12:14:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARM32 UBSAN failure in credit2
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <9c2c6099-9399-4607-9533-4d2f6aa1afc8@citrix.com>
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
In-Reply-To: <9c2c6099-9399-4607-9533-4d2f6aa1afc8@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------inOH0pjhPB50VFEs1HiZ0tvy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------inOH0pjhPB50VFEs1HiZ0tvy
Content-Type: multipart/mixed; boundary="------------9ljGxAaG30vN4me23hmbuG0R";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
Message-ID: <9a418f50-3635-4cc6-8d62-037a270cbf40@suse.com>
Subject: Re: ARM32 UBSAN failure in credit2
References: <9c2c6099-9399-4607-9533-4d2f6aa1afc8@citrix.com>
In-Reply-To: <9c2c6099-9399-4607-9533-4d2f6aa1afc8@citrix.com>
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

--------------9ljGxAaG30vN4me23hmbuG0R
Content-Type: multipart/mixed; boundary="------------ZbQ2XV0tB0j0kx1X2wZq9p63"

--------------ZbQ2XV0tB0j0kx1X2wZq9p63
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjUgMDA6MzYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IFRoaXMgaXMgbmFz
dHkuDQo+IA0KPiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2FuZHlo
aHAveGVuLy0vam9icy85MTM3MDA4MjE1DQo+IA0KPiBXaGVuIHByZXByb2Nlc3NlZCwgd2Ug
Z2V0Og0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWQvY3JlZGl0Mi5jIGIv
eGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMNCj4gaW5kZXggMGE4M2YyMzcyNTlmLi42Yjhk
MzY2MDI0MGEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY3JlZGl0Mi5jDQo+
ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY3JlZGl0Mi5jDQo+IEBAIC05NTgsNyArOTU4LDI4
IEBAIGNwdV9hZGRfdG9fcnVucXVldWUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLA0K
PiB1bnNpZ25lZCBpbnQgY3B1KQ0KPiAgwqDCoMKgwqAgd3JpdGVfbG9ja19pcnFzYXZlKCZw
cnYtPmxvY2ssIGZsYWdzKTsNCj4gICANCj4gIMKgwqDCoMKgIHJxZF9pbnMgPSAmcHJ2LT5y
cWw7DQo+ICsNCj4gKyNpZiAwDQo+ICDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5ICgg
cnFkLCAmcHJ2LT5ycWwsIHJxbCApDQo+ICsjZWxzZQ0KPiArwqDCoMKgIGZvciAoIChycWQp
ID0gKHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0eXBlb2YoKCh0eXBl
b2YoKihycWQpKSAqKSgodm9pZCopMCkpLT5ycWwpICpfX21wdHIgPQ0KPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKCgmcHJ2LT5ycWwpLT5uZXh0KTsNCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAodHlwZW9mKCoocnFkKSkgKikNCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgoY2hhciAqKV9fbXB0
ciAtDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fYnVp
bHRpbl9vZmZzZXRvZih0eXBlb2YoKihycWQpKSxycWwpICk7DQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIH0pOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgICYocnFkKS0+cnFsICE9IC8v
IDwtLSBwcm9ibGVtIGV4cHJlc3Npb24NCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICgmcHJ2LT5ycWwpOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgIChycWQpID0gKHsNCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHlwZW9mKCgodHlwZW9mKCoocnFk
KSkgKikoKHZvaWQqKTApKS0+cnFsKSAqX19tcHRyID0NCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoKHJxZCktPnJxbC5uZXh0KTsNCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHR5cGVvZigqKHJxZCkpICopDQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKChjaGFyICopX19t
cHRyIC0NCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IF9fYnVpbHRpbl9vZmZzZXRvZih0eXBlb2YoKihycWQpKSxycWwpICk7DQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB9KQ0KPiArwqDCoMKgwqDCoMKgwqAgKQ0KPiArI2VuZGlm
DQo+ICDCoMKgwqDCoCB7DQo+ICDCoMKgwqDCoMKgwqDCoMKgIC8qIFJlbWVtYmVyIGZpcnN0
IHVudXNlZCBxdWV1ZSBpbmRleC4gKi8NCj4gIMKgwqDCoMKgwqDCoMKgwqAgaWYgKCAhcnFp
X3VudXNlZCAmJiBycWQtPmlkID4gcnFpICkNCj4gDQo+IA0KPiBUaGUgYWxpZ25tZW50IG9m
IGNzY2hlZDJfcnVucXVldWVfZGF0YSBpcyA4LCB3aGlsZSBjc2NoZWQyX3ByaXZhdGUgaXMg
NC4NCj4gDQo+IHByaXYncyBsaXN0X2hlYWQgZm9yIHJxbCBpcyBhdCArMjggKCsweDFjKSwg
YW5kIGxpc3RfZm9yX2VhY2hfZW50cnkoKQ0KPiBwZXJmb3JtcyBhIGJ1Z2dpbHktdHlwZWQg
Y29udGFpbmVyX29mKCksIHRyZWF0aW5nIGEgY3NjaGVkMl9wcml2YXRlIGFzDQo+IGlmIGl0
IHdlcmUgY3NjaGVkMl9ydW5xdWV1ZV9kYXRhLg0KDQpObywgSSBkb24ndCB0aGluayBzby4g
SXQganVzdCBjb21wYXJlcyB0aGUgYWRkcmVzc2VzIG9mIDIgc3RydWN0IGxpc3RfaGVhZC4N
CjEgaW4gY3NjaGVkMl9ydW5xdWV1ZV9kYXRhIGFuZCAxIGluIGNzY2hlZDJfcHJpdmF0ZS4N
Cg0KPiBJdCBmdW5jdGlvbnMgYmVjYXVzZSBpdCdzIG9ubHkgYW4gYWRkcmVzcyBlcXVhbGl0
eSBjaGVjaywgYnV0IGl0J3MgYWxzbw0KPiB3aHkgVUJTQU4gb2JqZWN0cy4NCg0Kc3RydWN0
IGxpc3RfaGVhZCBzaG91bGQgcmVxdWlyZSBvbmx5IDQgYnl0ZSBhbGlnbm1lbnQsIHNvIEkg
ZG9uJ3Qgc2VlIHdoeQ0KdGhpcyB3b3VsZCB0cmlnZ2VyIFVCU0FOLiBDb3VsZCBpdCBiZSB0
aGF0IFVCU0FOIGhhcyBhIGJ1ZyBoZXJlPw0KDQoNCkp1ZXJnZW4NCg==
--------------ZbQ2XV0tB0j0kx1X2wZq9p63
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ZbQ2XV0tB0j0kx1X2wZq9p63--

--------------9ljGxAaG30vN4me23hmbuG0R--

--------------inOH0pjhPB50VFEs1HiZ0tvy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmewdyAFAwAAAAAACgkQsN6d1ii/Ey/B
egf/bVIreKswahUl3hs7Oc8nDnHPDD9vOUpToEvbGLO3zFksxZ64dQGVOcHSggAUqnlI8a/Rl3lz
z9mEMz0aEfs4lsk9bNqsYTNgTF4GOwXmaNLnDTGB6DihscDWBK/wW1wnYZ7h4ASuTz8I3PgC6r0Z
rmkzMzBZlc8r022drG9cgtcMh0QCx+ObXflv/0bJRo/ZQVa0I46JhWpbGKK7sP7iFmXkewmmWyvL
9xJmntYR+VU0R1LHcXNpWRec3NYQdfiC+tGRd9IwbwXaCYZQxXrThqTTMQpaad3MnlKJ+cTqD3Js
KwB6UaT4OssMJ08xsA31yDatiGHNlc6sYgVdZs75Ng==
=UR8e
-----END PGP SIGNATURE-----

--------------inOH0pjhPB50VFEs1HiZ0tvy--

