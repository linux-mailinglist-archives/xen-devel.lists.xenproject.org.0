Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D2FCF386D
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 13:30:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195382.1513330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcjjB-000070-Pe; Mon, 05 Jan 2026 12:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195382.1513330; Mon, 05 Jan 2026 12:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcjjB-0008Vl-Lj; Mon, 05 Jan 2026 12:30:29 +0000
Received: by outflank-mailman (input) for mailman id 1195382;
 Mon, 05 Jan 2026 12:30:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l/Gm=7K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vcjjA-0008Vf-1T
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 12:30:28 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5026fc01-ea32-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 13:30:26 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b73161849e1so2697515266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 04:30:26 -0800 (PST)
Received: from ?IPV6:2003:e5:8704:4800:66fd:131f:60bd:bc29?
 (p200300e58704480066fd131f60bdbc29.dip0.t-ipconnect.de.
 [2003:e5:8704:4800:66fd:131f:60bd:bc29])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b841fc8f2a2sm86653866b.63.2026.01.05.04.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 04:30:25 -0800 (PST)
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
X-Inumbo-ID: 5026fc01-ea32-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767616226; x=1768221026; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I2Nk/tTo8pumwLJRVroAmmxAzYDU4LxxrIEGYy3AXlM=;
        b=aBFzmR5INiqO4FfpB2WgKC07gypDazfGTkZ1RA0r/n80BJUFSC+JLIxu2Vj7lEUJe3
         i4Bw6RBfSQ+rfBQ4yCryEmcPt6HrmYcHbMkI//Ru6ztXGseN1nAp6Jd01XMzBzj61mdg
         zPRqwRZ/ITsxoiyR94d+IRJnseACviZdUuf5EFBjiIp9yJ0yI7FrsRNc3jkzAIpAM6BQ
         gtppXdyH07CeWw4PxaYsgwJ5XNiofoc8TIoGMDu+h8t4s99NWSqH+nQsJzrEZnRJAvXO
         Zm7f/eRp5M4rJlr+PQeVrqQt/sjDdUPAuTIEOPgh8t4NWPhYoFbLJOXSTWf9yDdZDwM2
         +jvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616226; x=1768221026;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I2Nk/tTo8pumwLJRVroAmmxAzYDU4LxxrIEGYy3AXlM=;
        b=q9EX4OffvTSBEy8CNE+GYx6TR91+oFIV1nl8nj5wAxeTk9g/OP7qbQbNnqJMbCDaCQ
         /Qig5an4NWjF9cnEK09/668YC19YChipPv43cf1qtjqM6Sj+rYpu2Kw8pwfvM+NmMRcb
         68Fs/kHc/HrcrXpO8IIjH6tBy5wSWMijDkLzzKHLmsSjaYvBP/M42b9Oza8vy/JJ0N7w
         /LfdwTNdwxhoyGOVKQw9omO3JYalzjobQGY93A34xxYOv50+YhGrtbrDTAXavEkeTssD
         ouopsCCgsVQyRQa7froWNkfLKMKkfnf8lrkn1f0s0ItrJ98sUroj8uJHD8iffco4t5iZ
         E1ow==
X-Forwarded-Encrypted: i=1; AJvYcCXlEYI3sw+xE0YQhwq9TLvkVtG7HwYq9OGgl209tvWVa4wTDE6oSYm5OREJ4o1AbZOMZm7a9AqLMAQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5zMJ+3ld0S1AxKWXlvF2mVsaKw++os7F0+T0qlWQm9P9/OP3c
	KIMnBOo7lYZbabTSIvhQzFuO4IB/8Hypsy0UVg0T2HcVZiDmXpsRtlSQ3vBiJe2io6o=
X-Gm-Gg: AY/fxX5yEi3uzZfU32tnd1DtaQzPd+iz7xvuwx4si+FiucEFbBKszR3txoUcCptBIT8
	xZjupQf/PXDBMruzLiBEb6v5bRctdj5W1nkfaDcBChp8YIwDWqBEQJOJL5kw/V+AbpXGIR6Qbwh
	eNrqBIn5AP/WRWwMdsayFJDfW5PN2uBuZbUglpwO6loQPd6MuQPa2axNZnyTkM+2ksqR99eSeX1
	TWIH9sCzW6NIULIUphiZNfLTE2GXXUcg6NA12SuEOnisc1xKPo6Wj3GDjE8vY7agCwHzwGSmcpP
	Vw/MrIll/p1O1bC++R/sBcgdbiHXk72vOtkgzPQoLJXJWMMFnIhW5SXcpZ8Am5po71CmyHq64Pb
	NEynqmJmmqY/8ib7sS+juNPp1UK/M0sMB1mYiqKINHfDSOEU8ywfQ+gKDNweIsOYKdZ6ROnT69A
	PRFLvP84zu/wI1vbIk57dxC5e51aIP3TUARQnRPTnnBem31lxny6XiPvb44Sg0Vj96/jV+xQS+J
	gW6I2T9VDNEX5ZSXTL3ZJ+25pMc+LUqaSik+bx44nkImdUuNQ==
X-Google-Smtp-Source: AGHT+IGCPHQgxAPDtbyWEiEGXI40NdxL+l7/n1HqJvGf0MHXX253ZEZgOIBDCyPHpnJitWr3iDDuxQ==
X-Received: by 2002:a17:907:9606:b0:b80:3447:e0c0 with SMTP id a640c23a62f3a-b80371f8c3amr4880080766b.62.1767616225840;
        Mon, 05 Jan 2026 04:30:25 -0800 (PST)
Message-ID: <a7658957-e218-452e-88a7-62176fef3163@suse.com>
Date: Mon, 5 Jan 2026 13:30:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/events: replace use of system_wq with
 system_percpu_wq
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20251106155831.306248-1-marco.crivellari@suse.com>
 <20251106155831.306248-2-marco.crivellari@suse.com>
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
In-Reply-To: <20251106155831.306248-2-marco.crivellari@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rZniUMkCsQegAOQbSofO81jm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rZniUMkCsQegAOQbSofO81jm
Content-Type: multipart/mixed; boundary="------------OiDwSmYXtw8G29gJdIB9TKXH";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <a7658957-e218-452e-88a7-62176fef3163@suse.com>
Subject: Re: [PATCH 1/2] xen/events: replace use of system_wq with
 system_percpu_wq
References: <20251106155831.306248-1-marco.crivellari@suse.com>
 <20251106155831.306248-2-marco.crivellari@suse.com>
In-Reply-To: <20251106155831.306248-2-marco.crivellari@suse.com>

--------------OiDwSmYXtw8G29gJdIB9TKXH
Content-Type: multipart/mixed; boundary="------------JgwdlsoBKx5EbJGQVVg6FwZu"

--------------JgwdlsoBKx5EbJGQVVg6FwZu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMTEuMjUgMTY6NTgsIE1hcmNvIENyaXZlbGxhcmkgd3JvdGU6DQo+IEN1cnJlbnRs
eSBpZiBhIHVzZXIgZW5xdWV1ZXMgYSB3b3JrIGl0ZW0gdXNpbmcgc2NoZWR1bGVfZGVsYXll
ZF93b3JrKCkgdGhlDQo+IHVzZWQgd3EgaXMgInN5c3RlbV93cSIgKHBlci1jcHUgd3EpIHdo
aWxlIHF1ZXVlX2RlbGF5ZWRfd29yaygpIHVzZQ0KPiBXT1JLX0NQVV9VTkJPVU5EICh1c2Vk
IHdoZW4gYSBjcHUgaXMgbm90IHNwZWNpZmllZCkuIFRoZSBzYW1lIGFwcGxpZXMgdG8NCj4g
c2NoZWR1bGVfd29yaygpIHRoYXQgaXMgdXNpbmcgc3lzdGVtX3dxIGFuZCBxdWV1ZV93b3Jr
KCksIHRoYXQgbWFrZXMgdXNlDQo+IGFnYWluIG9mIFdPUktfQ1BVX1VOQk9VTkQuDQo+IA0K
PiBUaGlzIGxhY2sgb2YgY29uc2lzdGVuY3kgY2Fubm90IGJlIGFkZHJlc3NlZCB3aXRob3V0
IHJlZmFjdG9yaW5nIHRoZSBBUEkuDQo+IA0KPiBUaGlzIGNvbnRpbnVlcyB0aGUgZWZmb3J0
IHRvIHJlZmFjdG9yIHdvcmtxdWV1ZSBBUElzLCB3aGljaCBiZWdhbiB3aXRoDQo+IHRoZSBp
bnRyb2R1Y3Rpb24gb2YgbmV3IHdvcmtxdWV1ZXMgYW5kIGEgbmV3IGFsbG9jX3dvcmtxdWV1
ZSBmbGFnIGluOg0KPiANCj4gY29tbWl0IDEyOGVhOWY2Y2NmYiAoIndvcmtxdWV1ZTogQWRk
IHN5c3RlbV9wZXJjcHVfd3EgYW5kIHN5c3RlbV9kZmxfd3EiKQ0KPiBjb21taXQgOTMwYzJl
YTU2NmFmICgid29ya3F1ZXVlOiBBZGQgbmV3IFdRX1BFUkNQVSBmbGFnIikNCj4gDQo+IFN3
aXRjaCB0byB1c2luZyBzeXN0ZW1fcGVyY3B1X3dxIGJlY2F1c2Ugc3lzdGVtX3dxIGlzIGdv
aW5nIGF3YXkgYXMgcGFydCBvZg0KPiBhIHdvcmtxdWV1ZSByZXN0cnVjdHVyaW5nLg0KPiAN
Cj4gU3VnZ2VzdGVkLWJ5OiBUZWp1biBIZW8gPHRqQGtlcm5lbC5vcmc+DQo+IFNpZ25lZC1v
ZmYtYnk6IE1hcmNvIENyaXZlbGxhcmkgPG1hcmNvLmNyaXZlbGxhcmlAc3VzZS5jb20+DQoN
ClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVl
cmdlbg0K
--------------JgwdlsoBKx5EbJGQVVg6FwZu
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------JgwdlsoBKx5EbJGQVVg6FwZu--

--------------OiDwSmYXtw8G29gJdIB9TKXH--

--------------rZniUMkCsQegAOQbSofO81jm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmlbruAFAwAAAAAACgkQsN6d1ii/Ey/1
hAf/d2Gq7Ba3L6q6plswJt8zJSFPkOu1TaKD6e6pjwQMjItpJT/z236hcoV0G9eUAZP/grT9bvEo
TdnlxRupTSmXaLp6OYQFIaParjBvwDtF4PHq03yMxfE3LRicvkf8vF5Hb2h1d1RWCj5liyCYiGzl
FQbGvbMYA+habVsSfqhG2S8yvYTv4x011NQ8sX1F3KRpTopfzKChll1byC4y3FNyw5+Zr+BZnGG2
toO1SKhfbLP80S3YfMbbfBj0WlRSemidrB8mvZdU4j2Rj3BT/FxYihIY3lP/T5CC8pHm+xK94i65
h69PSMndbMiyJ2FgGcTfEeoSS4r3n207uvQ4byvn5g==
=JGqa
-----END PGP SIGNATURE-----

--------------rZniUMkCsQegAOQbSofO81jm--

