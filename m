Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E74FA365E3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 19:47:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888991.1298242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj0i1-0007lT-LO; Fri, 14 Feb 2025 18:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888991.1298242; Fri, 14 Feb 2025 18:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj0i1-0007j4-Hl; Fri, 14 Feb 2025 18:46:41 +0000
Received: by outflank-mailman (input) for mailman id 888991;
 Fri, 14 Feb 2025 18:46:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1GEo=VF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tj0hz-0007iy-Sr
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 18:46:39 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0529fc57-eb04-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 19:46:37 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aaec111762bso544156766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 10:46:37 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532581acsm391200266b.50.2025.02.14.10.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 10:46:36 -0800 (PST)
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
X-Inumbo-ID: 0529fc57-eb04-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739558797; x=1740163597; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9cZUvtkhOJHv3roKzPmiTT0vSfmu08+p+R3fVltJ3J8=;
        b=RqZfFwvwtFejZwpnbKwQ1mWOADwEFzjlgNtIKPG/CxaP0rSRPS69qsuHCTmgWY478u
         DcqCRGr5m3tqynXVcZCxAkFWxdV72mkwlZXvED/csrh6O9Kk0f2FdQIlOEv8BzVydhnf
         zomCgnyhzdWQ5cjYzvVQm1CLFXQYYV0yKU43jPlmBykjsF0qd3PDiYmxc8K1jKbu5YZM
         htlLxU4V7P1tknZC1GfINf+ccF4Rb3DsxALCztJtVo1QU6cpDrYTasvKfopgC8zbBWee
         b1Vm4eQl8Mi0YvOZIRmDHHdknX81XJYhDjikKXt1TruU2oCC1XT6/9BNUvkRBx9NqDQe
         Qbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739558797; x=1740163597;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9cZUvtkhOJHv3roKzPmiTT0vSfmu08+p+R3fVltJ3J8=;
        b=eNN7UGOPF0ldvzlfuPiIg+Q+lTU/Sa/xWJwCuNyV3qiaLxzGHIzLgZ3wKqcghoQ3L8
         JGPtzY9quXZc3TjTW0l7/gWoAVS9RNdCJ1shSeAq/iPK4XSpALSe/nHmZhZZRwdZzTh6
         w0GbL7XlAt27HY/UmyVDW97tDTQ6IvcvTMRVnGAdlcjnnazIR087PMt8j+ZkG/xsVzI9
         hlJ4bpWS9K7th8Ao8Vk1arK1jGK7sU5eN7O2OLIu6EfK0Xdrvxc1VmM4+/ev50AiZRlW
         pjnzz4hIb8Nju6nDD9OvdPQvBL9q2NodCvOZud5enYsr+PDqgcNhDmtAd3oGDB57H+nw
         sKxg==
X-Forwarded-Encrypted: i=1; AJvYcCVxKv2YsAehIHw/H6T8ku4AuT6MdvtUYGllQjoTj8qq56eLhdmlzG5huQ6vfclNTWr/xEYO5xbBVSc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIFWC1OdMUPmBMp43xxr847Ur0XXYB7cYl90snzZ3Bi0R2/ZxJ
	Pl74xvSxfiTfoaBccveifD6rja87pQoDfb7DhiM6gtPG4kUsXFX+LZlEgeJP1/Q=
X-Gm-Gg: ASbGncv1icB++n6JzMT4r/OAECkosefprH45JuOzzLhSO3eHUriqCJnxfEZBgTtyID+
	XUe2zZVjr6KHZpVuljZj/Cr4XrlmJNbTJn7cvC4OZeUwvqJiDF6JnRymCqZbhgcOlvpQDoq9lfD
	i4C9JQeUbtBDvSqE05ketXrE49gCdOSLcNl27SQ1ntWAsBs4Vr0L9PJdf7qaumMauAaJTKKQBsi
	2Uue0GG1hWw37DByyXW7eZJ8eNnaBxBDTMiCBPWckh5+PySCiRaIurRWlARkcfK/Ec0DIEx5X2i
	S9cSvppoicuC+sHkvcV3AfImL7gFJApp7QKCdS6iNujwr8pKnhV6Jf99Nhh0zUn7U3JbX9kdaD0
	c7/a20S+TTuTVXNgcTbXiJnpVwpJm+qYl9OPpoQ==
X-Google-Smtp-Source: AGHT+IEfAE+yGYV4vD1yDlAZH5l0mF9QsP03ia8ReUQjdDC1qLLrJ+fW5yw+yDA5SsCbXSInyOac4Q==
X-Received: by 2002:a17:906:3112:b0:aaf:ada2:181e with SMTP id a640c23a62f3a-abb70dcfdf8mr12819866b.26.1739558797016;
        Fri, 14 Feb 2025 10:46:37 -0800 (PST)
Message-ID: <e39d6686-deb1-48cd-bdcb-e5ac7e87a38a@suse.com>
Date: Fri, 14 Feb 2025 19:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] xen: fix usage of devices behind a VMD bridge
To: Bjorn Helgaas <helgaas@kernel.org>, Roger Pau Monne
 <roger.pau@citrix.com>, Nirmal Patel <nirmal.patel@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Jonathan Derrick <jonathan.derrick@linux.dev>
References: <20250214171745.GA157045@bhelgaas>
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
In-Reply-To: <20250214171745.GA157045@bhelgaas>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dFjo1nWKpml6ocFLCg2lFSIE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dFjo1nWKpml6ocFLCg2lFSIE
Content-Type: multipart/mixed; boundary="------------1ez97w0veSUCMfLnmAAfkVb4";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Roger Pau Monne
 <roger.pau@citrix.com>, Nirmal Patel <nirmal.patel@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Jonathan Derrick <jonathan.derrick@linux.dev>
Message-ID: <e39d6686-deb1-48cd-bdcb-e5ac7e87a38a@suse.com>
Subject: Re: [PATCH v2 0/3] xen: fix usage of devices behind a VMD bridge
References: <20250214171745.GA157045@bhelgaas>
In-Reply-To: <20250214171745.GA157045@bhelgaas>

--------------1ez97w0veSUCMfLnmAAfkVb4
Content-Type: multipart/mixed; boundary="------------6Nwm3dpB58p7PWOHokdSqgH0"

--------------6Nwm3dpB58p7PWOHokdSqgH0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDIuMjUgMTg6MTcsIEJqb3JuIEhlbGdhYXMgd3JvdGU6DQo+IFsrdG8gSnVlcmdl
biwgTmlybWFsLCArY2MgSm9uYXRoYW5dDQo+IA0KPiBPbiBUdWUsIEphbiAxNCwgMjAyNSBh
dCAxMTozMzoxMEFNICswMTAwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6DQo+PiBIZWxsbywN
Cj4+DQo+PiBUaGUgZm9sbG93aW5nIHNlcmllcyBzaG91bGQgZml4IHRoZSB1c2FnZSBvZiBk
ZXZpY2VzIGJlaGluZCBhIFZNRCBicmlkZ2UNCj4+IHdoZW4gcnVubmluZyBMaW51eCBhcyBh
IFhlbiBQViBoYXJkd2FyZSBkb21haW4gKGRvbTApLiAgSSd2ZSBvbmx5IGJlZW4NCj4+IGFi
bGUgdG8gdGVzdCBQVi4gSSB0aGluayBQVkggc2hvdWxkIGFsc28gd29yayBidXQgSSBkb24n
dCBoYXZlIGhhcmR3YXJlDQo+PiBjYXBhYmxlIG9mIHRlc3RpbmcgaXQgcmlnaHQgbm93Lg0K
Pj4NCj4+IEkgZG9uJ3QgZXhwZWN0IHRoZSBmaXJzdCB0d28gcGF0Y2hlcyB0byBiZSBwcm9i
bGVtYXRpYywgdGhlIGxhc3QgcGF0Y2gNCj4+IGlzIGxpa2VseSB0byBiZSBtb3JlIGNvbnRy
b3ZlcnNpYWwuICBJJ3ZlIHRlc3RlZCBpdCBpbnRlcm5hbGx5IGFuZA0KPj4gZGlkbid0IHNl
ZSBhbnkgaXNzdWVzLCBidXQgbXkgdGVzdGluZyBvZiBQViBtb2RlIGlzIG1vc3RseSBsaW1p
dGVkIHRvDQo+PiBkb20wLg0KPj4NCj4+IFRoYW5rcywgUm9nZXIuDQo+Pg0KPj4gUm9nZXIg
UGF1IE1vbm5lICgzKToNCj4+ICAgIHhlbi9wY2k6IGRvIG5vdCByZWdpc3RlciBkZXZpY2Vz
IHdpdGggc2VnbWVudHMgPj0gMHgxMDAwMA0KPj4gICAgdm1kOiBkaXNhYmxlIE1TSSByZW1h
cHBpbmcgYnlwYXNzIHVuZGVyIFhlbg0KPj4gICAgcGNpL21zaTogcmVtb3ZlIHBjaV9tc2lf
aWdub3JlX21hc2sNCj4+DQo+PiAgIGFyY2gveDg2L3BjaS94ZW4uYyAgICAgICAgICAgfCAg
OCArKy0tLS0tLQ0KPj4gICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3ZtZC5jIHwgMTkgKysr
KysrKysrKysrKysrKysrDQo+PiAgIGRyaXZlcnMvcGNpL21zaS9tc2kuYyAgICAgICAgfCAz
NyArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0NCj4+ICAgZHJpdmVycy94
ZW4vcGNpLmMgICAgICAgICAgICB8IDE5ICsrKysrKysrKysrKysrKysrKw0KPj4gICBpbmNs
dWRlL2xpbnV4L21zaS5oICAgICAgICAgIHwgIDMgKystDQo+PiAgIGtlcm5lbC9pcnEvbXNp
LmMgICAgICAgICAgICAgfCAgMiArLQ0KPj4gICA2IGZpbGVzIGNoYW5nZWQsIDY0IGluc2Vy
dGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQ0KPiANCj4gV2UgZ290IGFuIGFjayBmcm9tIFRo
b21hcywgc28gSSdtIGZpbmUgd2l0aCB0aGlzIGZyb20gYSBQQ0kNCj4gcGVyc3BlY3RpdmUu
ICBIb3cgc2hvdWxkIGl0IGJlIG1lcmdlZD8gIFZpYSBYZW4gb3IgUENJPyAgSSdtIGhhcHB5
IHRvDQo+IG1lcmdlIHZpYSBQQ0ksIGJ1dCB3b3VsZCBhbHNvIHdhbnQgYWNrcyBmcm9tIEp1
ZXJnZW4gZm9yIHRoZSBYZW4NCj4gcGllY2UgYW5kIE5pcm1hbCBmb3IgdGhlIFZNRCBwaWVj
ZS4NCg0KSSdtIGZpbmUgd2l0aCB0aGlzIHRvIGdvIGluIHZpYSB0aGUgUENJIHRyZWUuDQoN
CkZvciB0aGUgWGVuIHJlbGF0ZWQgcGFydHM6DQoNCkFja2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------6Nwm3dpB58p7PWOHokdSqgH0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------6Nwm3dpB58p7PWOHokdSqgH0--

--------------1ez97w0veSUCMfLnmAAfkVb4--

--------------dFjo1nWKpml6ocFLCg2lFSIE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmevj4sFAwAAAAAACgkQsN6d1ii/Ey9q
hQgAgBseELLevj+jS7i/dM3OQPq6NgU0r0iL7S70aQj6hmIZgyI4saJiooA87zubPJFxnQIL5Hac
mdqlZDG5ARCn7wx1NjFTJ0WaQbBFpigeU3x0dzONRXcxjWIqQVD5KKnAKGuMjvs56EFp8CxEoQJt
jX9WfSTEt9SFJ1XGLl/6dJXJ6ZXyWK5wfW+zvlnuwuAHH3lW5xqpENo39eWHJI+s1FaVZAB40ZWH
BRqA0bKaxiT0hLLTi9dmDL1wzC3/ZC5PGLiStpq7KQB7RlHk/s3fi7OPa0HIkCl9kBOHNf5WzOAC
CoihculsYAGY/p5rw8Q/WKiWSfPIUOyhMBedfha9cA==
=rF35
-----END PGP SIGNATURE-----

--------------dFjo1nWKpml6ocFLCg2lFSIE--

