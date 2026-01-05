Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C14CF3882
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 13:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195387.1513340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcjjd-0000Wv-4D; Mon, 05 Jan 2026 12:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195387.1513340; Mon, 05 Jan 2026 12:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcjjd-0000UZ-0h; Mon, 05 Jan 2026 12:30:57 +0000
Received: by outflank-mailman (input) for mailman id 1195387;
 Mon, 05 Jan 2026 12:30:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l/Gm=7K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vcjjb-0008Vf-IS
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 12:30:55 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60ecad66-ea32-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 13:30:54 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso45522125e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 04:30:54 -0800 (PST)
Received: from ?IPV6:2003:e5:8704:4800:66fd:131f:60bd:bc29?
 (p200300e58704480066fd131f60bdbc29.dip0.t-ipconnect.de.
 [2003:e5:8704:4800:66fd:131f:60bd:bc29])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6d14912asm149324915e9.8.2026.01.05.04.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 04:30:53 -0800 (PST)
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
X-Inumbo-ID: 60ecad66-ea32-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767616254; x=1768221054; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3IfjnrxjRzFX+Zru/wByu+UKYqoBOIp/X4fNnDziGyo=;
        b=PqIb/yFLTk04r3UQqWzwLgl/io2lMGwfX5v9ISakba0iP2TLinXkvQK8YNuxXf2ltr
         Sc4lEJjFIwCF+xpxaKLjIxEyVEmx5r3WMjYROSIfZhKMUNWOCENkBHCYtR52JANGJDVE
         loPI8yC0TSriRV42S/LTmxbnUhxw/RO/sVeabmmskO75SnlHsQNHA0iC/9pnaPWucbsl
         FOi4IqUSbciw4M9dUwIg+6AY3StUo9j9H7uNUJBrAShDeuKv8Y8qJcWheodc4+ZqgV/A
         s4ZgF6X0PRS/dykTXjZ2HH0FIriz/xzCN+1xt5mogYSa6XVPZG/g0fOiy3ri6mChThS6
         uclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616254; x=1768221054;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3IfjnrxjRzFX+Zru/wByu+UKYqoBOIp/X4fNnDziGyo=;
        b=uKRrIEjXjYi/fuB17Tt+8LP+IH0b73dy7lRK7cCU136Edm8jELv8PViROTF1tuftVr
         0WjTqI0/+f4hyTfhsPoObsdy1B4ytZ09e0/KwPTolLfBhs0POQaFvtVVjARuCn33P7pg
         1/EcoCX1cfI9SEHIcuhs63G6AzbROvLLv4U++zy8u4dH4dBsUoGZZbw2XybP6IOBPn60
         S36Jkz7WUA5pX0wy10i8npZWkELY3WpTXtPtvZZydZUK7JJCTc3IL7JfDDmQXxmaiU4z
         A4lp+z3VaXrzeH8itrMNqYjMFZ/CxSXF0vwRIPcpp6CdH7uQm56b4uxCa++0LK9qvaHQ
         NaoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJHPu93JxyuBp7KfA2vADNWPXm1f4e3moCpJFY3UAY6LDovRmc7kiVSjpuHGaqgAmqAUeaovzza6w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrDd4Io+vCQoN9PHtWkxGF3YlhnCWo9tIfRXFIZDywY5xmtlZm
	26+f6o5TA+vSryiBgCfVAfEI+prLdO+IRU+Joh2N2hmgWRoKoK/BeMLm75OAnUk89Eo=
X-Gm-Gg: AY/fxX6DEWAKBb+MQwkHm8lskkY4Ee8HZcukiOvW4TzVxgM4i1BdmUAkakS1eOTQz+c
	CSc4uG9myHSPoEawelChsdp7wiV8pMoI4A862hST5mCtxSiYu+mF51Uwr7sruYksncv9wMZjaZS
	u0eAMSM0//4YdEwF2UUqcdKDi2iu1fr/Ax/Y4Oj9JL88LsRjA7LK8KR8+6UM+4QqUkNWpMquiS2
	AnFN4zvvsw2/TuNVsXvkATzCNeXqU5v1BnJrKrI7zSdx9L9huB86Vo9ghpMuZujTAu0aWXFuMTw
	3WvoIQjhPpUyes/xXRIXJ+ZC+1dRO7V2K8cwd7m1F7CtCObn5CIWWdoCDvpnp70DzJlPuIPqBm0
	sHCg9oiPkefDx/BDDx+AMBeTl3qZw7ec/IWadLfxXpW2Mv9y46asZ5f3NPYX9LfQB7+oNRmOtBi
	Qox0YX2D8aLrP+Zdn4ZVxESZWB0y7k6VNXRTY4/W8Bu4dATdYS8H0l/kSGyqd8JZtzgwxj9ZukT
	oevWoUCYCyK7crPxluenqazdiej2UslAn8jtQ8=
X-Google-Smtp-Source: AGHT+IES1qlktk8zGYm5cv5z603J5DVcPKE4FRYiohr8zXZs9DB9qqW7e7mJqhfqVEsKLh3RYNMHDQ==
X-Received: by 2002:a05:600c:3e0b:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-47d19555af8mr593489765e9.10.1767616254114;
        Mon, 05 Jan 2026 04:30:54 -0800 (PST)
Message-ID: <11cf87f7-060d-413a-a42e-bc39619cd11a@suse.com>
Date: Mon, 5 Jan 2026 13:30:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen: privcmd: WQ_PERCPU added to alloc_workqueue
 users
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20251106155831.306248-1-marco.crivellari@suse.com>
 <20251106155831.306248-3-marco.crivellari@suse.com>
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
In-Reply-To: <20251106155831.306248-3-marco.crivellari@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lGbqr5zLuvclXNIporo4n6SP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lGbqr5zLuvclXNIporo4n6SP
Content-Type: multipart/mixed; boundary="------------RxWE3za0dL5nnjt1Pdx0UiYj";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <11cf87f7-060d-413a-a42e-bc39619cd11a@suse.com>
Subject: Re: [PATCH 2/2] xen: privcmd: WQ_PERCPU added to alloc_workqueue
 users
References: <20251106155831.306248-1-marco.crivellari@suse.com>
 <20251106155831.306248-3-marco.crivellari@suse.com>
In-Reply-To: <20251106155831.306248-3-marco.crivellari@suse.com>

--------------RxWE3za0dL5nnjt1Pdx0UiYj
Content-Type: multipart/mixed; boundary="------------0SyVemSfu5BWy9VLIxFJoyu1"

--------------0SyVemSfu5BWy9VLIxFJoyu1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMTEuMjUgMTY6NTgsIE1hcmNvIENyaXZlbGxhcmkgd3JvdGU6DQo+IEN1cnJlbnRs
eSBpZiBhIHVzZXIgZW5xdWV1ZSBhIHdvcmsgaXRlbSB1c2luZyBzY2hlZHVsZV9kZWxheWVk
X3dvcmsoKSB0aGUNCj4gdXNlZCB3cSBpcyAic3lzdGVtX3dxIiAocGVyLWNwdSB3cSkgd2hp
bGUgcXVldWVfZGVsYXllZF93b3JrKCkgdXNlDQo+IFdPUktfQ1BVX1VOQk9VTkQgKHVzZWQg
d2hlbiBhIGNwdSBpcyBub3Qgc3BlY2lmaWVkKS4gVGhlIHNhbWUgYXBwbGllcyB0bw0KPiBz
Y2hlZHVsZV93b3JrKCkgdGhhdCBpcyB1c2luZyBzeXN0ZW1fd3EgYW5kIHF1ZXVlX3dvcmso
KSwgdGhhdCBtYWtlcyB1c2UNCj4gYWdhaW4gb2YgV09SS19DUFVfVU5CT1VORC4NCj4gVGhp
cyBsYWNrIG9mIGNvbnNpc3RlbnRjeSBjYW5ub3QgYmUgYWRkcmVzc2VkIHdpdGhvdXQgcmVm
YWN0b3JpbmcgdGhlIEFQSS4NCj4gDQo+IGFsbG9jX3dvcmtxdWV1ZSgpIHRyZWF0cyBhbGwg
cXVldWVzIGFzIHBlci1DUFUgYnkgZGVmYXVsdCwgd2hpbGUgdW5ib3VuZA0KPiB3b3JrcXVl
dWVzIG11c3Qgb3B0LWluIHZpYSBXUV9VTkJPVU5ELg0KPiANCj4gVGhpcyBkZWZhdWx0IGlz
IHN1Ym9wdGltYWw6IG1vc3Qgd29ya2xvYWRzIGJlbmVmaXQgZnJvbSB1bmJvdW5kIHF1ZXVl
cywNCj4gYWxsb3dpbmcgdGhlIHNjaGVkdWxlciB0byBwbGFjZSB3b3JrZXIgdGhyZWFkcyB3
aGVyZSB0aGV54oCZcmUgbmVlZGVkIGFuZA0KPiByZWR1Y2luZyBub2lzZSB3aGVuIENQVXMg
YXJlIGlzb2xhdGVkLg0KPiANCj4gVGhpcyBjb250aW51ZXMgdGhlIGVmZm9ydCB0byByZWZh
Y3RvciB3b3JrcXVldWUgQVBJcywgd2hpY2ggYmVnYW4gd2l0aA0KPiB0aGUgaW50cm9kdWN0
aW9uIG9mIG5ldyB3b3JrcXVldWVzIGFuZCBhIG5ldyBhbGxvY193b3JrcXVldWUgZmxhZyBp
bjoNCj4gDQo+IGNvbW1pdCAxMjhlYTlmNmNjZmIgKCJ3b3JrcXVldWU6IEFkZCBzeXN0ZW1f
cGVyY3B1X3dxIGFuZCBzeXN0ZW1fZGZsX3dxIikNCj4gY29tbWl0IDkzMGMyZWE1NjZhZiAo
IndvcmtxdWV1ZTogQWRkIG5ldyBXUV9QRVJDUFUgZmxhZyIpDQo+IA0KPiBUaGlzIGNoYW5n
ZSBhZGRzIGEgbmV3IFdRX1BFUkNQVSBmbGFnIHRvIGV4cGxpY2l0bHkgcmVxdWVzdCBhbGxv
Y193b3JrcXVldWUoKQ0KPiB0byBiZSBwZXItY3B1IHdoZW4gV1FfVU5CT1VORCBoYXMgbm90
IGJlZW4gc3BlY2lmaWVkLg0KPiANCj4gV2l0aCB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBX
UV9QRVJDUFUgZmxhZyAoZXF1aXZhbGVudCB0byAhV1FfVU5CT1VORCksDQo+IGFueSBhbGxv
Y193b3JrcXVldWUoKSBjYWxsZXIgdGhhdCBkb2VzbuKAmXQgZXhwbGljaXRseSBzcGVjaWZ5
IFdRX1VOQk9VTkQNCj4gbXVzdCBub3cgdXNlIFdRX1BFUkNQVS4NCj4gDQo+IE9uY2UgbWln
cmF0aW9uIGlzIGNvbXBsZXRlLCBXUV9VTkJPVU5EIGNhbiBiZSByZW1vdmVkIGFuZCB1bmJv
dW5kIHdpbGwNCj4gYmVjb21lIHRoZSBpbXBsaWNpdCBkZWZhdWx0Lg0KPiANCj4gU3VnZ2Vz
dGVkLWJ5OiBUZWp1biBIZW8gPHRqQGtlcm5lbC5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IE1h
cmNvIENyaXZlbGxhcmkgPG1hcmNvLmNyaXZlbGxhcmlAc3VzZS5jb20+DQoNClJldmlld2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------0SyVemSfu5BWy9VLIxFJoyu1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0SyVemSfu5BWy9VLIxFJoyu1--

--------------RxWE3za0dL5nnjt1Pdx0UiYj--

--------------lGbqr5zLuvclXNIporo4n6SP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmlbrv0FAwAAAAAACgkQsN6d1ii/Ey98
QAgAg6SlZqiwL4c1FQ4ec3hoO8VySdf+gywGdMUU8aomPTxnNY+06Cf6mLZpGOFxloHzUWJULyIe
wxiaY5kdnLGGh7U7cS0PKH91d6//dhn5vfTbv/1vixAvDzlaQAYk44caqhRbVoLQejM0h+7sM3Fz
tKBtHjbm93kLP70YiU4DUwP0oiG0SXPjLq0NlgIKATn8/Y1rfviIDYAprIMqWpN5K322UixfwWyz
oEw95wS7TaSRTgUYNqH5UJR08EjohHTRuVyfJJZumjSK2oMzD1pCLDLPRYM3wRPk8urfFIlGjpQD
gckhK8471gq4BsszVu3BRzQGkJ6b9n75ezlv9Et9eA==
=rnWo
-----END PGP SIGNATURE-----

--------------lGbqr5zLuvclXNIporo4n6SP--

