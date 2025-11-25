Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 164C5C83F42
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 09:21:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171736.1496731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNoIH-0006Ic-0p; Tue, 25 Nov 2025 08:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171736.1496731; Tue, 25 Nov 2025 08:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNoIG-0006G5-UN; Tue, 25 Nov 2025 08:21:00 +0000
Received: by outflank-mailman (input) for mailman id 1171736;
 Tue, 25 Nov 2025 08:21:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ygd1=6B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vNoIG-0006Fz-1v
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 08:21:00 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aad267c9-c9d7-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 09:20:57 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b75c7cb722aso762570766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 00:20:57 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76550191c8sm1471719166b.54.2025.11.25.00.20.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 00:20:56 -0800 (PST)
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
X-Inumbo-ID: aad267c9-c9d7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764058856; x=1764663656; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ojbrSr/MBp+mgHmKSGaLFmD5zhy5z3RH8FCkUxONmsA=;
        b=LVO5JaCr+0NgqAgbq0cYlT2epVQntHi7Dv6ZJgXOokFjf2TsjI8PGpGpNYJTYvzFNc
         Er58XMSAd+XeX81Epqz7fhDDyPgV7QJsyiDcrQxw7BlCEmUjjuWBhAwbgkCoHET7mwd9
         NFPJy+v12Riw0mNfDKXu3oIks2H+WlJsWkRpV9nZs+3/dJBUYiXW+i8vYp0fHEFrKVEm
         hmvBvK85AYAaVoB99/jsEIRSllIGa2mdjtKjbTd0lAZtXWej2iwOdJUrk/td7cBECAm6
         ps1Ervlloq1p6xs0N8U6unYq8s6qmlyV9dyG3NiCHKOLpNwdsxv6D+GY0ixIry2tJVYN
         4j7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764058856; x=1764663656;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojbrSr/MBp+mgHmKSGaLFmD5zhy5z3RH8FCkUxONmsA=;
        b=pj/Jb2zSmmBZnmrgd2xi5kK6Sg2/fHcX8mp6So0SHgpEQLy6AyU5cJa/vlrrSHXfGI
         ZxKPQ5CtNjeKImF1kjKVA9yhW7EwlmFK1IJVp5/yOmm7bjN9Lzsx9EZxhmT88zYzGwmL
         AmQyXMBU1PzqAW/RSQeKhRXfQaz1rF5M6nmxo5njSPLJriLazuqcKjbFQViaGJwhInLC
         PS/XEe/fBVF8yfLWHnPtkRa/Q+7tFZgWm2o+duKp/SwBFqeMUoq+mflFjunw51TLgoRG
         XB+aN2BOhbQ13md5ABVXfsgGainxm+bAdDPcNtiWIGbg9TyzPc3+VNDp56Xzd0Kq0JZX
         q5GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaXnkgU9FpuNu7jtUFxy4cM8sQvut/koKiTW6ntRqkdrx49wKwZ75A0YhW0rH9LXIBm1qsI0Ft2Ww=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlOtKTuJ1ruygyqrWLzu1r03w29id2gicdgafnFEZiKJFQKiYK
	CxREAomj3XpBouZgHtyRGAjzfYAcyaY2nq9Axw4fQxmss0+c08OG/PefSe+f/m8zlzI=
X-Gm-Gg: ASbGncsBAnd1slJggZVLeFwR4GxtoHcTzsee66q3JQETi2s9bEHi4VRb5f6OMbXnvgW
	yVKcZcAjqEj2VdKEZS94SsCNW1YzJDo1bCV6vOvssDT5bL3ZMmD30S764pkjgREngzKJqRiFidy
	5L7RqXSHylHnSJmQXY+hPjwUWLTXtQIKiPoK/FfsY46lillzAcJp8UJz2BGZm1+juBM///JI6K9
	l5aDFvjnJQ2/Yqc53oYDzGLdQeIlIoFo7tBi0k1X9Y/Xb6tDHFNRrhtQHCjI9qY2LDL6L042hKz
	5E/835LgQ6b5YP/yXsyEGlF9cuGracrvzM3evSxxjYDCZ9h/O2oFyl+hML4tdLKMJQ9evHtDEfX
	iuQLnmKqRw2HaTHxUnpvvcxwjGTtK5e2eu+KoEWrflU3agOeOtJwF76vOhFvajnQZDp9g1Miwc2
	sWEIg/biWmY4CHINX2T5O7lIoQBJSM1P218fzZRApyjxHI4muB8JCyGi8eWMRNArFOJJLObbPOK
	rycTOvme4pFcUWYPNKnBxD0GzgfdJ/AonatSi0=
X-Google-Smtp-Source: AGHT+IHGiyGBL9Qy1PfJCANIOsmf32/b+UknosAlhec5sEiSFw0tir7XXuWQfzvdEwkOTL/3T9l27g==
X-Received: by 2002:a17:907:26c2:b0:b73:8639:cd88 with SMTP id a640c23a62f3a-b76715ab98amr1515197466b.22.1764058856464;
        Tue, 25 Nov 2025 00:20:56 -0800 (PST)
Message-ID: <1c991699-51b7-4284-8179-6bc78f8f4eac@suse.com>
Date: Tue, 25 Nov 2025 09:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xenbus: Use .freeze/.thaw to handle xenbus devices
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Yann Sionneau <yann.sionneau@vates.tech>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20251119224731.61497-1-jason.andryuk@amd.com>
 <20251119224731.61497-2-jason.andryuk@amd.com>
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
In-Reply-To: <20251119224731.61497-2-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CfWRt20Yq90ES5stFlBXz1cl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CfWRt20Yq90ES5stFlBXz1cl
Content-Type: multipart/mixed; boundary="------------ZOIId50E5xvM95JLGMG0BSrb";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Yann Sionneau <yann.sionneau@vates.tech>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Message-ID: <1c991699-51b7-4284-8179-6bc78f8f4eac@suse.com>
Subject: Re: [PATCH 1/2] xenbus: Use .freeze/.thaw to handle xenbus devices
References: <20251119224731.61497-1-jason.andryuk@amd.com>
 <20251119224731.61497-2-jason.andryuk@amd.com>
In-Reply-To: <20251119224731.61497-2-jason.andryuk@amd.com>

--------------ZOIId50E5xvM95JLGMG0BSrb
Content-Type: multipart/mixed; boundary="------------z2uAYKCPeTIIK9LR7PVvjfCP"

--------------z2uAYKCPeTIIK9LR7PVvjfCP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTEuMjUgMjM6NDcsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFRoZSBnb2FsIGlz
IHRvIGZpeCBzMmlkbGUgYW5kIFMzIGZvciBYZW4gUFYgZGV2aWNlcy4gIEEgZG9tYWluIHJl
c3VtaW5nDQo+IGZyb20gczMgb3IgczJpZGxlIGRpc2Nvbm5lY3RzIGl0cyBQViBkZXZpY2Vz
IGR1cmluZyByZXN1bWUuICBUaGUNCj4gYmFja2VuZHMgYXJlIG5vdCBleHBlY3RpbmcgdGhp
cyBhbmQgZG8gbm90IHJlY29ubmVjdC4NCj4gDQo+IGIzZTk2YzBjNzU2MiAoInhlbjogdXNl
IGZyZWV6ZS9yZXN0b3JlL3RoYXcgUE0gZXZlbnRzIGZvciBzdXNwZW5kLw0KPiByZXN1bWUv
Y2hrcHQiKSBjaGFuZ2VkIHhlbl9zdXNwZW5kKCkvZG9fc3VzcGVuZCgpIGZyb20NCj4gUE1T
R19TVVNQRU5EL1BNU0dfUkVTVU1FIHRvIFBNU0dfRlJFRVpFL1BNU0dfVEhBVy9QTVNHX1JF
U1RPUkUsIGJ1dCB0aGUNCj4gc3VzcGVuZC9yZXN1bWUgY2FsbGJhY2tzIHJlbWFpbmVkLg0K
PiANCj4gLmZyZWV6ZS9yZXN0b3JlIGFyZSB1c2VkIHdpdGggaGliZXJhdGlvbiB3aGVyZSBM
aW51eCByZXN0YXJ0cyBpbiBhIG5ldw0KPiBwbGFjZSBpbiB0aGUgZnV0dXJlLiAgLnN1c3Bl
bmQvcmVzdW1lIGFyZSB1c2VmdWwgZm9yIHJ1bnRpbWUgcG93ZXINCj4gbWFuYWdlbWVudCBm
b3IgdGhlIGR1cmF0aW9uIG9mIGEgYm9vdC4NCj4gDQo+IFRoZSBjdXJyZW50IGJlaGF2aW9y
IG9mIHRoZSBjYWxsYmFja3Mgd29ya3MgZm9yIGFuIHhsIHNhdmUvcmVzdG9yZSBvcg0KPiBs
aXZlIG1pZ3JhdGlvbiB3aGVyZSB0aGUgZG9tYWluIGlzIHJlc3RvcmVkL21pZ3JhdGVkIHRv
IGEgbmV3IGxvY2F0aW9uDQo+IGFuZCBjb25uZWN0aW5nIHRvIGEgbm90LWFscmVhZHktY29u
bmVjdGVkIGJhY2tlbmQuDQo+IA0KPiBDaGFuZ2UgeGVuYnVzX3BtX29wcyB0byB1c2UgLmZy
ZWV6ZS90aGF3L3Jlc3RvcmUgYW5kIGRyb3AgdGhlDQo+IC5zdXNwZW5kL3Jlc3VtZSBob29r
LiAgVGhpcyBtYXRjaGVzIHRoZSB1c2UgaW4gZHJpdmVycy94ZW4vbWFuYWdlLmMgZm9yDQo+
IHNhdmUvcmVzdG9yZSBhbmQgbGl2ZSBtaWdyYXRpb24uICBXaXRoIC5zdXNwZW5kL3Jlc3Vt
ZSBlbXB0eSwgUFYgZGV2aWNlcw0KPiBhcmUgbGVmdCBjb25uZWN0ZWQgZHVyaW5nIHMyaWRs
ZSBhbmQgczMsIHNvIFBWIGRldmljZXMgYXJlIG5vdCBjaGFuZ2VkDQo+IGFuZCB3b3JrIGFm
dGVyIHJlc3VtZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphc29u
LmFuZHJ5dWtAYW1kLmNvbT4NCg0KQWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4NCg0KTWFyZWssIGNvdWxkIHlvdSBwbGVhc2UgZ2l2ZSB0aGlzIHBhdGNoIGEg
dHJ5IHdpdGggUXViZXNPUz8gSSB0aGluayB0aGlzDQpwYXRjaCBzaG91bGQgYmUgdmVyaWZp
ZWQgbm90IHRvIGJyZWFrIHlvdXIgdXNlIGNhc2VzIHJlZ2FyZGluZyBzdXNwZW5kIC8NCnJl
c3VtZS4NCg0KDQpKdWVyZ2VuDQoNCj4gLS0tDQo+ICAgZHJpdmVycy94ZW4veGVuYnVzL3hl
bmJ1c19wcm9iZV9mcm9udGVuZC5jIHwgNCArLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfZnJvbnRlbmQuYyBiL2RyaXZlcnMveGVuL3hl
bmJ1cy94ZW5idXNfcHJvYmVfZnJvbnRlbmQuYw0KPiBpbmRleCA2ZDE4MTkyNjljYmUuLjE5
OTkxN2I2Zjc3YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19w
cm9iZV9mcm9udGVuZC5jDQo+ICsrKyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJv
YmVfZnJvbnRlbmQuYw0KPiBAQCAtMTQ4LDExICsxNDgsOSBAQCBzdGF0aWMgdm9pZCB4ZW5i
dXNfZnJvbnRlbmRfZGV2X3NodXRkb3duKHN0cnVjdCBkZXZpY2UgKl9kZXYpDQo+ICAgfQ0K
PiAgIA0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyB4ZW5idXNfcG1fb3Bz
ID0gew0KPiAtCS5zdXNwZW5kCT0geGVuYnVzX2Rldl9zdXNwZW5kLA0KPiAtCS5yZXN1bWUJ
CT0geGVuYnVzX2Zyb250ZW5kX2Rldl9yZXN1bWUsDQo+ICAgCS5mcmVlemUJCT0geGVuYnVz
X2Rldl9zdXNwZW5kLA0KPiAgIAkudGhhdwkJPSB4ZW5idXNfZGV2X2NhbmNlbCwNCj4gLQku
cmVzdG9yZQk9IHhlbmJ1c19kZXZfcmVzdW1lLA0KPiArCS5yZXN0b3JlCT0geGVuYnVzX2Zy
b250ZW5kX2Rldl9yZXN1bWUsDQo+ICAgfTsNCj4gICANCj4gICBzdGF0aWMgc3RydWN0IHhl
bl9idXNfdHlwZSB4ZW5idXNfZnJvbnRlbmQgPSB7DQoNCg==
--------------z2uAYKCPeTIIK9LR7PVvjfCP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------z2uAYKCPeTIIK9LR7PVvjfCP--

--------------ZOIId50E5xvM95JLGMG0BSrb--

--------------CfWRt20Yq90ES5stFlBXz1cl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmklZucFAwAAAAAACgkQsN6d1ii/Ey8J
uAf/RmpVRT507G9fKg8VoPfbcLLNBycvPXGuTmhfUJb/kr7g7ElzToBTTsGsALMiFs6194+Mi7jf
KZz3kn9I1vYbkM7xjDhnsPjynZCxBX4W4VC6BfKh75gO473/FL67nQsLPaQcPAVGee7eHnI/gc1M
uVCx/T+060Vlcu1Xk2nzFHnxOrSK34ZkrvL1+A68VK050ZL6NBusxNrpXUAdLykxZ84qwWqOH/xw
cj2pavdw6DPUr5wkfINY+iwkUYA8oI7qX2zsRXBIHA2JEMp1Bk5uZQWhN8pNTHIupaB5RhL6TuL/
GeCKISNH5yzJ47OvGP4heXeO7H2Tj1n3s5e0zeDLpQ==
=nBm5
-----END PGP SIGNATURE-----

--------------CfWRt20Yq90ES5stFlBXz1cl--

