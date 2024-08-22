Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DC495B3DC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 13:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781756.1191269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh60i-00017k-Ry; Thu, 22 Aug 2024 11:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781756.1191269; Thu, 22 Aug 2024 11:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh60i-000150-Ou; Thu, 22 Aug 2024 11:29:48 +0000
Received: by outflank-mailman (input) for mailman id 781756;
 Thu, 22 Aug 2024 11:29:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hRh8=PV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sh60g-00014s-T6
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 11:29:47 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3af49a5-6079-11ef-8776-851b0ebba9a2;
 Thu, 22 Aug 2024 13:29:43 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8666734767so87726966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 04:29:43 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f2a5077sm107397566b.69.2024.08.22.04.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 04:29:41 -0700 (PDT)
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
X-Inumbo-ID: d3af49a5-6079-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724326182; x=1724930982; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Y9CAQApsedbwydOV+2iHCqnlWuJGqk/j1F5QK8lkSk=;
        b=Nb0O0yjo8yvRVYYxJrYR7fZL23NzRhujE/KZrDyGC9drhF0XUr5QXonbJGRMtRhgJP
         rkCYAWBDeqDE77mjI7Irgj43lGiFiZ+Exp/k/Q+B9Is4WHSsFC7DhBjGXxYMZ2VJfwfw
         OlhHYSyoRjGdIHY+m31a1y3ls343ExBohS6SNCS9Mr4Lqfxp/3vYcFP9dsFtFbMIKJxq
         0qXnCTKdebYUXBGuluscxC9UhHi+vGKpBWD6elRu90P0lqCDTjzVSEfH0yoGu0Bu+jWI
         KJcNhp39QJufWlhFa+Eem25s1CLvRmpOzCiZoKCZwLlxRPjFpJ1nZoqNY6LeaxdApByO
         dYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724326182; x=1724930982;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Y9CAQApsedbwydOV+2iHCqnlWuJGqk/j1F5QK8lkSk=;
        b=wYk3kMkM3lZkCWZBbUa0yM+u0Aazbof+MXq8IHaKgoDD3kd6kdXKdzZggpsh76WxNf
         Q3v3IbRMrhhWvja64UZJYtkjSoTKaWhkXjDg8h5jH5ZSa3gX4F/8T15fQjdyVhRMmMD8
         sNUyZZ6FASmZ2Syc1eVHih4F93/qMocXpkIBXTNk1nr8jV9UhMrSgZkbG3OVFWxzGMhU
         hV9fkH8d6EgvoofMgPnEvYYrW3jGn5BKvueSaJ1G3htTGZCUawDbswjNXrNz7Q1UCAPp
         f0y0OHR2RbFQRLkuQBfCnjOqMriaAOKlqKF8tYIC5XW0HyRjQA/3pVKsIoOgPVgnKzqD
         LPpw==
X-Forwarded-Encrypted: i=1; AJvYcCU173gnZch/kwjWAijqf2OSDPaYWcHZKGBxkmohzR6+sOvppoanw9ftrvnbO+NhUuFf9pNq8h3PE+I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXYhGIsEr91JMs/Z9v5OXAsoTu5LqSkfaG9H9S+s0w5R7P9yt7
	5yK9hija+CFwRj4nAVDBibkDvBysiIQltW17zBHz8vp8S81MRYL8W9SnK2uZPR4=
X-Google-Smtp-Source: AGHT+IHtIa2suO2P+Jxg4VZrDHrvabAmVOEFhEArsMIFoNPxeztTm/2ks0zn0a8nw8FaqBHVwFkOgA==
X-Received: by 2002:a17:906:ee89:b0:a7a:a5ae:11ba with SMTP id a640c23a62f3a-a866f70edf5mr430377766b.50.1724326181967;
        Thu, 22 Aug 2024 04:29:41 -0700 (PDT)
Message-ID: <8d7fd92b-b71d-47fa-8684-46711f7cec31@suse.com>
Date: Thu, 22 Aug 2024 13:29:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] xen: introduce generic helper checking for memory
 map conflicts
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20240820082012.31316-1-jgross@suse.com>
 <20240820082012.31316-3-jgross@suse.com>
 <22961690-14d0-4695-ba93-a68d2517059e@suse.com>
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
In-Reply-To: <22961690-14d0-4695-ba93-a68d2517059e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0p72HLI366MzTVl9iVnjjEOP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0p72HLI366MzTVl9iVnjjEOP
Content-Type: multipart/mixed; boundary="------------EJxvzaW62XEFNvsDb0AM0c0j";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Message-ID: <8d7fd92b-b71d-47fa-8684-46711f7cec31@suse.com>
Subject: Re: [PATCH v2 2/7] xen: introduce generic helper checking for memory
 map conflicts
References: <20240820082012.31316-1-jgross@suse.com>
 <20240820082012.31316-3-jgross@suse.com>
 <22961690-14d0-4695-ba93-a68d2517059e@suse.com>
In-Reply-To: <22961690-14d0-4695-ba93-a68d2517059e@suse.com>
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

--------------EJxvzaW62XEFNvsDb0AM0c0j
Content-Type: multipart/mixed; boundary="------------8AUFE80Os2ns50UcQwz0MJks"

--------------8AUFE80Os2ns50UcQwz0MJks
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDguMjQgMTA6MzUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4wOC4yMDI0
IDEwOjIwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gV2hlbiBib290aW5nIGFzIGEgWGVu
IFBWIGRvbTAgdGhlIG1lbW9yeSBsYXlvdXQgb2YgdGhlIGRvbTAgaXMNCj4+IG1vZGlmaWVk
IHRvIG1hdGNoIHRoYXQgb2YgdGhlIGhvc3QsIGFzIHRoaXMgcmVxdWlyZXMgbGVzcyBjaGFu
Z2VzIGluDQo+PiB0aGUga2VybmVsIGZvciBzdXBwb3J0aW5nIFhlbi4NCj4+DQo+PiBUaGVy
ZSBhcmUgc29tZSBjYXNlcywgdGhvdWdoLCB3aGljaCBhcmUgcHJvYmxlbWF0aWMsIGFzIGl0
IGlzIHRoZSBYZW4NCj4+IGh5cGVydmlzb3Igc2VsZWN0aW5nIHRoZSBrZXJuZWwncyBsb2Fk
IGFkZHJlc3MgcGx1cyBzb21lIG90aGVyIGRhdGEsDQo+PiB3aGljaCBtaWdodCBjb25mbGlj
dCB3aXRoIHRoZSBob3N0J3MgbWVtb3J5IG1hcC4NCj4+DQo+PiBUaGVzZSBjb25mbGljdHMg
YXJlIGRldGVjdGVkIGF0IGJvb3QgdGltZSBhbmQgcmVzdWx0IGluIGEgYm9vdCBlcnJvci4N
Cj4+IEluIG9yZGVyIHRvIHN1cHBvcnQgaGFuZGxpbmcgYXQgbGVhc3Qgc29tZSBvZiB0aGVz
ZSBjb25mbGljdHMgaW4NCj4+IGZ1dHVyZSwgaW50cm9kdWNlIGEgZ2VuZXJpYyBoZWxwZXIg
ZnVuY3Rpb24gd2hpY2ggd2lsbCBsYXRlciBnYWluIHRoZQ0KPj4gYWJpbGl0eSB0byBhZGFw
dCB0aGUgbWVtb3J5IGxheW91dCB3aGVuIHBvc3NpYmxlLg0KPj4NCj4+IEFkZCB0aGUgbWlz
c2luZyBjaGVjayBmb3IgdGhlIHhlbl9zdGFydF9pbmZvIGFyZWEuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gVGVzdGVkLWJ5
OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5n
c2xhYi5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KPiANCj4gSG93ZXZlciwgc2luY2UgeW91IG1lbnRpb24gdGhlIHN0YXJ0X2lu
Zm8gYXJlYSBpdCBtYXkgYmUgd29ydGggYWRkaW5nIGhhbGYNCj4gYSBzZW50ZW5jZSB0byB0
aGUgZGVzY3JpcHRpb24gYWxzbyBtZW50aW9uaW5nIHdoeSB0aGUgaHlwZXJ2aXNvciBhbGxv
Y2F0ZWQNCj4gc3RhY2sgcGFnZSBkb2Vzbid0IG5lZWQgY2hlY2tpbmcuIEluIGZhY3QgdGhp
cyBtYXkgd2FudCB0byBleHRlbmQgdG8NCj4gaW5pdHJkIGFuZCBwaHlzLW1hY2ggbWFwIGFz
IHdlbGwsIHRvIGNvdmVyIGV2ZXJ5dGhpbmcgWGVuIHNldHMgdXAgb24gYmVoYWxmDQo+IG9m
IHRoZSBrZXJuZWwuDQoNCk9rYXkuDQoNCg0KSnVlcmdlbg0KDQo=
--------------8AUFE80Os2ns50UcQwz0MJks
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------8AUFE80Os2ns50UcQwz0MJks--

--------------EJxvzaW62XEFNvsDb0AM0c0j--

--------------0p72HLI366MzTVl9iVnjjEOP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmbHISQFAwAAAAAACgkQsN6d1ii/Ey/u
gAgAmk/Df5hJJ/HTbzaqyhts0Uqd/yGoBNLzpwzCS87r97pgyZe7dkjd205qd5BaOmr6o1aescgz
4CPNAhkfQZNBScxW0lslSQEhXPPrN22cM7yAqnwkCG+fhG4bHadlvXdGTo0ZhdNFDaMJydYrsuQE
XbKJl6ol1ZxqoJqTm2frn1saqy9+A3F8wessMV8vU0Kolg21TW0ThCmn5Eh+5zNRhZFjd+YLFqv/
oo1jWwjRDJew5xDNkNhNY50Zk1TrYjVgDn342Ys1XRqA1WAcMa61LgrDBVFWPT3wVG/PmXuR8iXa
pHBKCdwb/PUBFKmACMezXJ93A+Pk4WKHQAEKxUXGwQ==
=jpv8
-----END PGP SIGNATURE-----

--------------0p72HLI366MzTVl9iVnjjEOP--

