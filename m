Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B756A32493
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 12:15:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886340.1296008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiAhz-0004GC-HH; Wed, 12 Feb 2025 11:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886340.1296008; Wed, 12 Feb 2025 11:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiAhz-0004DK-EJ; Wed, 12 Feb 2025 11:15:11 +0000
Received: by outflank-mailman (input) for mailman id 886340;
 Wed, 12 Feb 2025 11:15:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y4oX=VD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tiAhy-0003hO-8E
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 11:15:10 +0000
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ed666a5-e932-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 12:15:09 +0100 (CET)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-ab7e1286126so325605666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 03:15:09 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab79d9ced43sm926109066b.78.2025.02.12.03.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 03:15:08 -0800 (PST)
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
X-Inumbo-ID: 9ed666a5-e932-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739358909; x=1739963709; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dhNxh9dyGr5FO2cf7rcf58Sw9SHa6zZDc69VG0aQ/qM=;
        b=BLDz6+kDi/SLWRLXGoH9erPFglXUYpPHsvIEVRO9RZUa8I5trUcyalbW0VRvBBC0Td
         tq3uMV/4Jx96bZH7C07QhvZbugVouDNnQZl31nsDlzLUwUx/VB2nPrHULIaejGiWtD9g
         /UTk0Y3vhNZ3Qz0jj1kR/rDKdrS0NY3gL/r3UANmVlT24m1pu+hqCdd6pWRzj9cJHUbJ
         TqLcu8A19HkVHwKO6hJf+YwsR6dypmiubVtEVKbgWYwWHpSMGUhJJ+/4mDBhWiNyuScn
         bus/OTfjLFlFTimMq0q3ou5wC97FzaDmaKAYB8gr4o3ldk/64VbWZ7yfKR2mi+fwH4SX
         8exQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739358909; x=1739963709;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhNxh9dyGr5FO2cf7rcf58Sw9SHa6zZDc69VG0aQ/qM=;
        b=aK5RCAqlDhK7zl6osJtqwJeOGI94zynWdwGZDI8/3DFTDZsq46z8t8/85vyilUj31G
         iWeQSAqzmeQ7xj0r95kmai0Bb8lQnG7db+uc+r6wsXTkFH56b2ma3IwqIH+upAAdcu2V
         w7TdvNAex7mADd5oYqTlJGLDSkE4FWJP8VYm9Ro93rxSlMUHnT+2Pxb5aTNfAEk2OwZ7
         9/9L9BFlkDtuF8hkPLMQ9EW+Zccr9cKQ+fwvl0Rd00gaSmQeS+fEWw9s0RhPFFCKXaGS
         IcI5NU/JqNiFoSYcyNKyiiL7Kyau1NBYKP2v4Hecc+z0pzzLDegyF0dZSdB7rjoLpzcI
         wLLw==
X-Forwarded-Encrypted: i=1; AJvYcCXI+XOL0lVnrI1oq4p/JvfjRxcYX+JcYjtiC5XhYAw33LR7TjssxfhSEcNIWxzQInu8JxWshFP9DaM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy205T/7NGtIJKdi0Cz4hkyMYVVWGYJquoGqAvcNOgvlaYvg5WI
	xKInEbIe15sXQS4JgY+dCCTDAOymRlgEFZ5EBRvw7Osni3+48NIxZK+OWtjxRsQ=
X-Gm-Gg: ASbGncu0JlfDWmVX/V+/Rv1fsB+jd+YeB/+sWiSNpSDk1KiwCga3xpLUfsMLIPLiMH5
	8uNXO2uTUlK5RlR5rrTaMHcfYoaquovI+iEKb1CqbM497KbHRkxJt+HPHykin9y97iTGeVr5iLe
	jqLHZtnxAQnUBE+/K92O5yZnhQdr2D2/cQ3Q5str98EJgQ+QP/ha9U0gcqGMVJDzexcK4ch27UY
	UoVcSs8DVLhGnBRxN+m2hn9yEJBuGJeYBPUWZI3vQI/0fe15grQtvfxNQypCF8X89FMSha50DE2
	Gjqb2/WL2sjQZOLgdC7HoA+FOWQLrCMZP2orqKR4N2wz7w6lEtOEyhvoum1oSIvwMlsiP2eRy9Z
	6yPbiWKTNuEFK1h6iaMiAKk4xTkAMKMkjxYlGPA==
X-Google-Smtp-Source: AGHT+IHfZhnYtyqsma2MTVvnxZnT4RmrNifRnJzXLfO/CFQinhq8GONiNXcj+5atcxoORccpGeh58Q==
X-Received: by 2002:a17:907:940c:b0:ab6:362b:a83a with SMTP id a640c23a62f3a-ab7f3325ab2mr243787666b.8.1739358908824;
        Wed, 12 Feb 2025 03:15:08 -0800 (PST)
Message-ID: <b7bc43f9-47e6-4994-bba9-5c8be92a8e52@suse.com>
Date: Wed, 12 Feb 2025 12:15:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/swiotlb: don't destroy contiguous region in all
 cases
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, iommu@lists.linux.dev,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250211120432.29493-1-jgross@suse.com>
 <20250211120432.29493-3-jgross@suse.com>
 <alpine.DEB.2.22.394.2502111728560.619090@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2502111728560.619090@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------szlosvekYsXvl46yZmb0r6Xs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------szlosvekYsXvl46yZmb0r6Xs
Content-Type: multipart/mixed; boundary="------------9NmeJlDdW2BULYTua6LpmQQ0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, iommu@lists.linux.dev,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
Message-ID: <b7bc43f9-47e6-4994-bba9-5c8be92a8e52@suse.com>
Subject: Re: [PATCH 2/2] xen/swiotlb: don't destroy contiguous region in all
 cases
References: <20250211120432.29493-1-jgross@suse.com>
 <20250211120432.29493-3-jgross@suse.com>
 <alpine.DEB.2.22.394.2502111728560.619090@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2502111728560.619090@ubuntu-linux-20-04-desktop>

--------------9NmeJlDdW2BULYTua6LpmQQ0
Content-Type: multipart/mixed; boundary="------------RLvJDFujCslsLk6WtOJR7G9l"

--------------RLvJDFujCslsLk6WtOJR7G9l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDIuMjUgMDI6MzAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gVHVl
LCAxMSBGZWIgMjAyNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IEluIGNhc2UgeGVuX3N3
aW90bGJfYWxsb2NfY29oZXJlbnQoKSBuZWVkZWQgdG8gY3JlYXRlIGEgY29udGlndW91cw0K
Pj4gcmVnaW9uIG9ubHkgZm9yIG90aGVyIHJlYXNvbiB0aGFuIHRoZSBtZW1vcnkgbm90IGJl
aW5nIGNvbXBsaWFudCB3aXRoDQo+PiB0aGUgZGV2aWNlJ3MgRE1BIG1hc2ssIHRoZXJlIGlz
IG5vIHJlYXNvbiB3aHkgdGhpcyBjb250aWd1b3VzIHJlZ2lvbg0KPj4gc2hvdWxkIGJlIGRl
c3Ryb3llZCBieSB4ZW5fc3dpb3RsYl9mcmVlX2NvaGVyZW50KCkgbGF0ZXIuIERlc3Ryb3lp
bmcNCj4+IHRoaXMgcmVnaW9uIHNob3VsZCBiZSBkb25lIG9ubHksIGlmIHRoZSBtZW1vcnkg
b2YgdGhlIHJlZ2lvbiB3YXMNCj4+IGFsbG9jYXRlZCB3aXRoIG1vcmUgc3RyaW5nZW50IHBs
YWNlbWVudCByZXF1aXJlbWVudHMgdGhhbiB0aGUgbWVtb3J5DQo+PiBpdCBkaWQgcmVwbGFj
ZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+DQo+PiAtLS0NCj4+ICAgYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL3N3aW90bGIteGVu
LmggfCAgNSArKystLQ0KPj4gICBhcmNoL3g4Ni94ZW4vbW11X3B2LmMgICAgICAgICAgICAg
ICAgICB8IDE4ICsrKysrKysrKysrKy0tLS0tLQ0KPj4gICBkcml2ZXJzL3hlbi9zd2lvdGxi
LXhlbi5jICAgICAgICAgICAgICB8IDExICsrKysrKystLS0tDQo+PiAgIDMgZmlsZXMgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9zd2lvdGxiLXhlbi5oIGIvYXJjaC94
ODYvaW5jbHVkZS9hc20veGVuL3N3aW90bGIteGVuLmgNCj4+IGluZGV4IGFiZGUwZjQ0ZGY1
Ny4uYTM1M2YyMGM3ZTc5IDEwMDY0NA0KPj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20v
eGVuL3N3aW90bGIteGVuLmgNCj4+ICsrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9z
d2lvdGxiLXhlbi5oDQo+PiBAQCAtNCw4ICs0LDkgQEANCj4+ICAgDQo+PiAgIGludCB4ZW5f
c3dpb3RsYl9maXh1cCh2b2lkICpidWYsIHVuc2lnbmVkIGxvbmcgbnNsYWJzKTsNCj4+ICAg
aW50IHhlbl9jcmVhdGVfY29udGlndW91c19yZWdpb24ocGh5c19hZGRyX3QgcHN0YXJ0LCB1
bnNpZ25lZCBpbnQgb3JkZXIsDQo+PiAtCQkJCXVuc2lnbmVkIGludCBhZGRyZXNzX2JpdHMs
DQo+PiAtCQkJCWRtYV9hZGRyX3QgKmRtYV9oYW5kbGUpOw0KPj4gKwkJCQkgdW5zaWduZWQg
aW50IGFkZHJlc3NfYml0cywNCj4+ICsJCQkJIGRtYV9hZGRyX3QgKmRtYV9oYW5kbGUsDQo+
PiArCQkJCSB1bnNpZ25lZCBpbnQgKmFkZHJlc3NfYml0c19pbik7DQo+PiAgIHZvaWQgeGVu
X2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24ocGh5c19hZGRyX3QgcHN0YXJ0LCB1bnNpZ25l
ZCBpbnQgb3JkZXIpOw0KPj4gICANCj4+ICAgI2VuZGlmIC8qIF9BU01fWDg2X1NXSU9UTEJf
WEVOX0ggKi8NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vbW11X3B2LmMgYi9hcmNo
L3g4Ni94ZW4vbW11X3B2LmMNCj4+IGluZGV4IDJjNzBjZDM1ZTcyYy4uZmI1ODYyMzhmN2M0
IDEwMDY0NA0KPj4gLS0tIGEvYXJjaC94ODYveGVuL21tdV9wdi5jDQo+PiArKysgYi9hcmNo
L3g4Ni94ZW4vbW11X3B2LmMNCj4+IEBAIC0yMjA4LDE5ICsyMjA4LDIyIEBAIHZvaWQgX19p
bml0IHhlbl9pbml0X21tdV9vcHModm9pZCkNCj4+ICAgc3RhdGljIHVuc2lnbmVkIGxvbmcg
ZGlzY29udGlnX2ZyYW1lc1sxPDxNQVhfQ09OVElHX09SREVSXTsNCj4+ICAgDQo+PiAgICNk
ZWZpbmUgVk9JRF9QVEUgKG1mbl9wdGUoMCwgX19wZ3Byb3QoMCkpKQ0KPj4gLXN0YXRpYyB2
b2lkIHhlbl96YXBfcGZuX3JhbmdlKHVuc2lnbmVkIGxvbmcgdmFkZHIsIHVuc2lnbmVkIGlu
dCBvcmRlciwNCj4+IC0JCQkJdW5zaWduZWQgbG9uZyAqaW5fZnJhbWVzLA0KPj4gLQkJCQl1
bnNpZ25lZCBsb25nICpvdXRfZnJhbWVzKQ0KPj4gK3N0YXRpYyBpbnQgeGVuX3phcF9wZm5f
cmFuZ2UodW5zaWduZWQgbG9uZyB2YWRkciwgdW5zaWduZWQgaW50IG9yZGVyLA0KPj4gKwkJ
CSAgICAgdW5zaWduZWQgbG9uZyAqaW5fZnJhbWVzLA0KPj4gKwkJCSAgICAgdW5zaWduZWQg
bG9uZyAqb3V0X2ZyYW1lcykNCj4+ICAgew0KPj4gICAJaW50IGk7DQo+PiArCXU2NCBhZGRy
ZXNzX2JpdHMgPSAwOw0KPj4gICAJc3RydWN0IG11bHRpY2FsbF9zcGFjZSBtY3M7DQo+PiAg
IA0KPj4gICAJeGVuX21jX2JhdGNoKCk7DQo+PiAgIAlmb3IgKGkgPSAwOyBpIDwgKDFVTDw8
b3JkZXIpOyBpKyssIHZhZGRyICs9IFBBR0VfU0laRSkgew0KPj4gICAJCW1jcyA9IF9feGVu
X21jX2VudHJ5KDApOw0KPj4gICANCj4+IC0JCWlmIChpbl9mcmFtZXMpDQo+PiArCQlpZiAo
aW5fZnJhbWVzKSB7DQo+PiAgIAkJCWluX2ZyYW1lc1tpXSA9IHZpcnRfdG9fbWZuKCh2b2lk
ICopdmFkZHIpOw0KPj4gKwkJCWFkZHJlc3NfYml0cyB8PSBpbl9mcmFtZXNbaV0gPDwgUEFH
RV9TSElGVDsNCj4+ICsJCX0NCj4+ICAgDQo+PiAgIAkJTVVMVElfdXBkYXRlX3ZhX21hcHBp
bmcobWNzLm1jLCB2YWRkciwgVk9JRF9QVEUsIDApOw0KPj4gICAJCV9fc2V0X3BoeXNfdG9f
bWFjaGluZSh2aXJ0X3RvX3Bmbigodm9pZCAqKXZhZGRyKSwgSU5WQUxJRF9QMk1fRU5UUlkp
Ow0KPj4gQEAgLTIyMjksNiArMjIzMiw4IEBAIHN0YXRpYyB2b2lkIHhlbl96YXBfcGZuX3Jh
bmdlKHVuc2lnbmVkIGxvbmcgdmFkZHIsIHVuc2lnbmVkIGludCBvcmRlciwNCj4+ICAgCQkJ
b3V0X2ZyYW1lc1tpXSA9IHZpcnRfdG9fcGZuKCh2b2lkICopdmFkZHIpOw0KPj4gICAJfQ0K
Pj4gICAJeGVuX21jX2lzc3VlKDApOw0KPj4gKw0KPj4gKwlyZXR1cm4gZmxzNjQoYWRkcmVz
c19iaXRzKTsNCj4+ICAgfQ0KPj4gICANCj4+ICAgLyoNCj4+IEBAIC0yMzIxLDcgKzIzMjYs
OCBAQCBzdGF0aWMgaW50IHhlbl9leGNoYW5nZV9tZW1vcnkodW5zaWduZWQgbG9uZyBleHRl
bnRzX2luLCB1bnNpZ25lZCBpbnQgb3JkZXJfaW4sDQo+PiAgIA0KPj4gICBpbnQgeGVuX2Ny
ZWF0ZV9jb250aWd1b3VzX3JlZ2lvbihwaHlzX2FkZHJfdCBwc3RhcnQsIHVuc2lnbmVkIGlu
dCBvcmRlciwNCj4+ICAgCQkJCSB1bnNpZ25lZCBpbnQgYWRkcmVzc19iaXRzLA0KPj4gLQkJ
CQkgZG1hX2FkZHJfdCAqZG1hX2hhbmRsZSkNCj4+ICsJCQkJIGRtYV9hZGRyX3QgKmRtYV9o
YW5kbGUsDQo+PiArCQkJCSB1bnNpZ25lZCBpbnQgKmFkZHJlc3NfYml0c19pbikNCj4+ICAg
ew0KPj4gICAJdW5zaWduZWQgbG9uZyAqaW5fZnJhbWVzID0gZGlzY29udGlnX2ZyYW1lcywg
b3V0X2ZyYW1lOw0KPj4gICAJdW5zaWduZWQgbG9uZyAgZmxhZ3M7DQo+PiBAQCAtMjMzNiw3
ICsyMzQyLDcgQEAgaW50IHhlbl9jcmVhdGVfY29udGlndW91c19yZWdpb24ocGh5c19hZGRy
X3QgcHN0YXJ0LCB1bnNpZ25lZCBpbnQgb3JkZXIsDQo+PiAgIAlzcGluX2xvY2tfaXJxc2F2
ZSgmeGVuX3Jlc2VydmF0aW9uX2xvY2ssIGZsYWdzKTsNCj4+ICAgDQo+PiAgIAkvKiAxLiBa
YXAgY3VycmVudCBQVEVzLCByZW1lbWJlcmluZyBNRk5zLiAqLw0KPj4gLQl4ZW5femFwX3Bm
bl9yYW5nZSh2c3RhcnQsIG9yZGVyLCBpbl9mcmFtZXMsIE5VTEwpOw0KPj4gKwkqYWRkcmVz
c19iaXRzX2luID0geGVuX3phcF9wZm5fcmFuZ2UodnN0YXJ0LCBvcmRlciwgaW5fZnJhbWVz
LCBOVUxMKTsNCj4+ICAgDQo+PiAgIAkvKiAyLiBHZXQgYSBuZXcgY29udGlndW91cyBtZW1v
cnkgZXh0ZW50LiAqLw0KPj4gICAJb3V0X2ZyYW1lID0gdmlydF90b19wZm4oKHZvaWQgKil2
c3RhcnQpOw0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9k
cml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jDQo+PiBpbmRleCAyNmM2MmUwZDM0ZTkuLjNmMzcy
NGY1MzkxNCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMNCj4+
ICsrKyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMNCj4+IEBAIC0xMTgsNiArMTE4LDcg
QEAgaW50IHhlbl9zd2lvdGxiX2ZpeHVwKHZvaWQgKmJ1ZiwgdW5zaWduZWQgbG9uZyBuc2xh
YnMpDQo+PiAgIAlpbnQgcmM7DQo+PiAgIAl1bnNpZ25lZCBpbnQgb3JkZXIgPSBnZXRfb3Jk
ZXIoSU9fVExCX1NFR1NJWkUgPDwgSU9fVExCX1NISUZUKTsNCj4+ICAgCXVuc2lnbmVkIGlu
dCBpLCBkbWFfYml0cyA9IG9yZGVyICsgUEFHRV9TSElGVDsNCj4+ICsJdW5zaWduZWQgaW50
IGR1bW15Ow0KPj4gICAJZG1hX2FkZHJfdCBkbWFfaGFuZGxlOw0KPj4gICAJcGh5c19hZGRy
X3QgcCA9IHZpcnRfdG9fcGh5cyhidWYpOw0KPj4gICANCj4+IEBAIC0xMjksNyArMTMwLDcg
QEAgaW50IHhlbl9zd2lvdGxiX2ZpeHVwKHZvaWQgKmJ1ZiwgdW5zaWduZWQgbG9uZyBuc2xh
YnMpDQo+PiAgIAkJZG8gew0KPj4gICAJCQlyYyA9IHhlbl9jcmVhdGVfY29udGlndW91c19y
ZWdpb24oDQo+PiAgIAkJCQlwICsgKGkgPDwgSU9fVExCX1NISUZUKSwgb3JkZXIsDQo+PiAt
CQkJCWRtYV9iaXRzLCAmZG1hX2hhbmRsZSk7DQo+PiArCQkJCWRtYV9iaXRzLCAmZG1hX2hh
bmRsZSwgJmR1bW15KTsNCj4+ICAgCQl9IHdoaWxlIChyYyAmJiBkbWFfYml0cysrIDwgTUFY
X0RNQV9CSVRTKTsNCj4+ICAgCQlpZiAocmMpDQo+PiAgIAkJCXJldHVybiByYzsNCj4+IEBA
IC0xNDQsNiArMTQ1LDcgQEAgeGVuX3N3aW90bGJfYWxsb2NfY29oZXJlbnQoc3RydWN0IGRl
dmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwNCj4+ICAgCQlkbWFfYWRkcl90ICpkbWFfaGFuZGxl
LCBnZnBfdCBmbGFncywgdW5zaWduZWQgbG9uZyBhdHRycykNCj4+ICAgew0KPj4gICAJdTY0
IGRtYV9tYXNrID0gZGV2LT5jb2hlcmVudF9kbWFfbWFzazsNCj4+ICsJdW5zaWduZWQgaW50
IGFkZHJlc3NfYml0cyA9IGZsczY0KGRtYV9tYXNrKSwgYWRkcmVzc19iaXRzX2luOw0KPj4g
ICAJaW50IG9yZGVyID0gZ2V0X29yZGVyKHNpemUpOw0KPj4gICAJcGh5c19hZGRyX3QgcGh5
czsNCj4+ICAgCXZvaWQgKnJldDsNCj4+IEBAIC0xNjAsMTAgKzE2MiwxMSBAQCB4ZW5fc3dp
b3RsYl9hbGxvY19jb2hlcmVudChzdHJ1Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLA0K
Pj4gICAJaWYgKCpkbWFfaGFuZGxlICsgc2l6ZSAtIDEgPiBkbWFfbWFzayB8fA0KPj4gICAJ
ICAgIHJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5kYXJ5KHBoeXMsIHNpemUpIHx8DQo+PiAg
IAkgICAgcmFuZ2VfcmVxdWlyZXNfYWxpZ25tZW50KHBoeXMsIHNpemUpKSB7DQo+PiAtCQlp
ZiAoeGVuX2NyZWF0ZV9jb250aWd1b3VzX3JlZ2lvbihwaHlzLCBvcmRlciwgZmxzNjQoZG1h
X21hc2spLA0KPj4gLQkJCQlkbWFfaGFuZGxlKSAhPSAwKQ0KPj4gKwkJaWYgKHhlbl9jcmVh
dGVfY29udGlndW91c19yZWdpb24ocGh5cywgb3JkZXIsIGFkZHJlc3NfYml0cywNCj4+ICsJ
CQkJCQkgZG1hX2hhbmRsZSwgJmFkZHJlc3NfYml0c19pbikpDQo+PiAgIAkJCWdvdG8gb3V0
X2ZyZWVfcGFnZXM7DQo+PiAtCQlTZXRQYWdlWGVuUmVtYXBwZWQodmlydF90b19wYWdlKHJl
dCkpOw0KPj4gKwkJaWYgKGFkZHJlc3NfYml0c19pbiA+IGFkZHJlc3NfYml0cykNCj4+ICsJ
CQlTZXRQYWdlWGVuUmVtYXBwZWQodmlydF90b19wYWdlKHJldCkpOw0KPiANCj4gVGhpcyBo
YXMgdGhlIHVuZm9ydHVuYXRlIHNpZGUgZWZmZWN0IG9mIG1ha2luZyAiUGFnZVhlblJlbWFw
cGVkIg0KPiB1bnJlbGlhYmxlIGFzIGFuIGluZGljYXRvciBvZiB3aGV0aGVyIGEgcGFnZSBo
YXMgYmVlbiByZW1hcHBlZC4gQSBwYWdlDQo+IGNvdWxkIHN0aWxsIGJlIHJlbWFwcGVkIHdp
dGhvdXQgdGhlICJQYWdlWGVuUmVtYXBwZWQiIGJpdCBiZWluZyBzZXQuDQo+IA0KPiBJIHJl
Y29tbWVuZCBhZGRpbmcgYW4gaW4tY29kZSBjb21tZW50IHRvIGNsYXJpZnkgdGhpcyBiZWhh
dmlvci4NCg0KVGhlIFBhZ2VYZW5SZW1hcHBlZCBiaXQgaXMgdXNlZCBvbmx5IGZvciBkZXRl
cm1pbmluZyB3aGV0aGVyDQp4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigpIHNob3Vs
ZCBiZSBjYWxsZWQuIEFuZCBieSBub3Qgc2V0dGluZyB0aGUgYml0DQpJJ20gYXZvaWRpbmcg
dG8gY2FsbCB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigpIGxhdGVyLiBTbyBJIGRv
bid0IHNlZSBhbnkNCnVuZm9ydHVuYXRlIHNpZGUgZWZmZWN0Lg0KDQoNCkp1ZXJnZW4NCg==

--------------RLvJDFujCslsLk6WtOJR7G9l
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------RLvJDFujCslsLk6WtOJR7G9l--

--------------9NmeJlDdW2BULYTua6LpmQQ0--

--------------szlosvekYsXvl46yZmb0r6Xs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmesgrsFAwAAAAAACgkQsN6d1ii/Ey8F
1ggAlp+VSEknaja1mVLLR1LWD/dsvqjYz3m8ejdqz5jOCK8nDawjxuTyyiw3y+XT0DnwrCztDSD4
00pmCp/5UpkCLxyTP++PPdv5DZ+S3vQ1qK/xNHxB6zoPOOUUdd6I2a7uwXG5giNbqfjT7qqdalh4
15FgSBvLCOr8JxnGQ5Iu336c+3D9mOrvHjIZTma+8k6GWXzDAA3V4TCcAxcXPyMzwnRdy3qW0e5N
XC8LJyCzsAUAengh2l2tOoi0C7zJyoAAM8iyDF9Oe6wQRKJdwlndiUS+OMaRjVPb46TyBwpvoIj9
HpklyeIuleUpdRQjR26k2EtTDNjVoKRLk3JgqsU4Tg==
=JMW7
-----END PGP SIGNATURE-----

--------------szlosvekYsXvl46yZmb0r6Xs--

