Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5D09C708A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 14:25:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835682.1251545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBDN1-0001HE-8s; Wed, 13 Nov 2024 13:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835682.1251545; Wed, 13 Nov 2024 13:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBDN1-0001Ez-6A; Wed, 13 Nov 2024 13:25:19 +0000
Received: by outflank-mailman (input) for mailman id 835682;
 Wed, 13 Nov 2024 13:25:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K+ao=SI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tBDMz-0001Et-2d
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 13:25:17 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b65c99ac-a1c2-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 14:25:12 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-431481433bdso60247865e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 05:25:12 -0800 (PST)
Received: from ?IPV6:2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c?
 (p200300e5872eb100d3c7e0c05e3baa1c.dip0.t-ipconnect.de.
 [2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d54fcabcsm24685335e9.18.2024.11.13.05.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 05:25:11 -0800 (PST)
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
X-Inumbo-ID: b65c99ac-a1c2-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozNDIiLCJoZWxvIjoibWFpbC13bTEteDM0Mi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI2NWM5OWFjLWExYzItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTA0MzEyLjk1MDIzNywic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731504312; x=1732109112; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tI7vWtg8gJ6RWwGIsoNlg/Cyo/tnqNM3pVUJsmGzCok=;
        b=ZwWo+KUfIfXz1ow56X7uagD8vkFsv47skpWIJHsTEUdkEU8u0wU4w/Dwcjcs0eca0G
         0n50PxjHyF3jzesPnCJ+DR2kKdXXEuM6SJ0m9lw8J5wwto8IV+AaaRJ7KzjXhg87Mqpi
         54PSSluWnPXA6ZTG+q7gO15hoU/4bhvaT5i9FKOt7cvO7YvK0EY91qgR2qg9PrlB91vj
         eO1LqpHPpMhSAODl8vfx21ERO7XPUoTGPhQn9C9y8byMbuXZJtQeTT8MCbuMtatK9fE7
         U8Bm80G2yqdcJ7zk4CrET4l1LBJxI5Nd1R+3MOt4q4vXVT4oLw6RMUPesbUV3aK03OSn
         buig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504312; x=1732109112;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tI7vWtg8gJ6RWwGIsoNlg/Cyo/tnqNM3pVUJsmGzCok=;
        b=KZHD23On8LHlR+6+6jtpreJNJGBWc3j3okxmoXWIVmTaA0vTRFGSylGTBekRtv+y6A
         T4O5epLMxnvYJelhLzd/3n7JvQIO0dMUQdOK+ktrAdo7v+mTJPAPx29/UGKwvcXEFQYT
         L/kP5ARrbb0KDSmiyQG0TSLKfVSffVIjR+5if2aCzEdtQdsWSIb6qTgheHg4hwS1VrDc
         3QC4eHmLpzpc+U0zko7qTmdyPalMdFd8oZ/fimJVdRiu5Efg1CLbte99gMLmD2CgPTZX
         hBef3JyWBz5UuQGlm4BnS1L1Pak+eQ1GoQlbDWCQGV3gU0fBHfQzDky8MrBlSpHdyPRs
         oa0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXw27mrnJ2pSgkQWqOjJxo9kvYVotPl18Z/x4+j7Bd3Hav5e1psEL0JwLbA+vVtBUHopzMJmhBgWlQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhYgxydqeD7Q5EotV4U/Gx8hgU6FLhwoxnhw2d1oamq7uPHFII
	PCWRAfYH0M39GI3viEsW2w5ZTDiyuKi5aPVSMn8P8h7GgV1DRbH9wE7ZpZnwm1Q=
X-Google-Smtp-Source: AGHT+IFF08y36fv/zXwMx6fU8k54Ine7T8C6PmMOMDCZCk8Es9Reve0grx+VFsQk3Vhg7T3eFpr2mQ==
X-Received: by 2002:a05:600c:3c97:b0:431:4f5e:1f61 with SMTP id 5b1f17b1804b1-432d4ab1840mr28275635e9.14.1731504312215;
        Wed, 13 Nov 2024 05:25:12 -0800 (PST)
Message-ID: <8205ea71-858c-4552-819f-2b9753457034@suse.com>
Date: Wed, 13 Nov 2024 14:25:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.20 Development Update [August-October]
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Kelly Choi <kelly.choi@cloud.com>
References: <CAMacjJzO+Oa1_BEBrV3J=L4=5vsxZRV8DGuiuho96qLqM-QWcA@mail.gmail.com>
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
In-Reply-To: <CAMacjJzO+Oa1_BEBrV3J=L4=5vsxZRV8DGuiuho96qLqM-QWcA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jJrHLxQ9gIASRZbaESDR2c4c"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jJrHLxQ9gIASRZbaESDR2c4c
Content-Type: multipart/mixed; boundary="------------my9VWqJD0FktgDpR9tDcFBnU";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Kelly Choi <kelly.choi@cloud.com>
Message-ID: <8205ea71-858c-4552-819f-2b9753457034@suse.com>
Subject: Re: Xen 4.20 Development Update [August-October]
References: <CAMacjJzO+Oa1_BEBrV3J=L4=5vsxZRV8DGuiuho96qLqM-QWcA@mail.gmail.com>
In-Reply-To: <CAMacjJzO+Oa1_BEBrV3J=L4=5vsxZRV8DGuiuho96qLqM-QWcA@mail.gmail.com>

--------------my9VWqJD0FktgDpR9tDcFBnU
Content-Type: multipart/mixed; boundary="------------soa2blsgTPuWnfjdJImBcngz"

--------------soa2blsgTPuWnfjdJImBcngz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTEuMjQgMTc6MTYsIE9sZWtzaWkgS3Vyb2Noa28gd3JvdGU6DQo+IEhlbGxvIGV2
ZXJ5b25lLA0KPiANCj4gVGhpcyBlbWFpbCBvbmx5IHRyYWNrcyBiaWcgaXRlbXMgZm9yIHhl
bi5naXQgdHJlZS4gUGxlYXNlIHJlcGx5IGZvciBpdGVtcyB5b3UNCj4gd291bGQgbGlrZSB0
byBzZWUgaW4gNC4yMCBzbyB0aGF0IHBlb3BsZSBoYXZlIGFuIGlkZWEgd2hhdCBpcyBnb2lu
ZyBvbiBhbmQNCj4gcHJpb3JpdGlzZSBhY2NvcmRpbmdseS4NCj4gDQo+IFlvdSdyZSB3ZWxj
b21lIHRvIHByb3ZpZGUgZGVzY3JpcHRpb24gYW5kIHVzZSBjYXNlcyBvZiB0aGUgZmVhdHVy
ZSB5b3UncmUNCj4gd29ya2luZyBvbi4NCj4gDQo+ID0gVGltZWxpbmUgPQ0KPiANCj4gLS0t
PiBXZSBhcmUgaGVyZQ0KPiAqIExhc3QgcG9zdGluZyBkYXRlOiBOb3YgMjksIDIwMjQNCj4g
KiBGZWF0dXJlIGZyZWV6ZSBkYXRlOiBEZWMgMjAsIDIwMjQNCj4gKiBIYXJkIGNvZGUgZnJl
ZXplOiBKYW4gMTcsIDIwMjUNCj4gKiBSQzE6IFRCRA0KPiAqIFJlbGVhc2U6IEZlYiAyMSwg
MjAyNQ0KPiAoIGN1cnJlbnQgcmVsZWFzZSBzY2hlZHVsZTogaHR0cHM6Ly93aWtpLnhlbnBy
b2plY3Qub3JnL3dpa2kvIA0KPiBYZW5fUHJvamVjdF9YLllZX1JlbGVhc2VfTm90ZXMgPGh0
dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpLyANCj4gWGVuX1Byb2plY3RfWC5ZWV9S
ZWxlYXNlX05vdGVzPiApDQo+IA0KPiBBbGwgcGF0Y2hlcyB0aGF0IHdpc2ggdG8gZ28gaW50
byA0LjIwIG11c3QgYmUgcG9zdGVkIG5vIGxhdGVyIHRoYW4gdGhlIGxhc3QgcG9zdGluZw0K
PiBkYXRlLiBBbGwgcGF0Y2hlcyBwb3N0ZWQgYWZ0ZXIgdGhhdCBkYXRlIHdpbGwgYmUgYXV0
b21hdGljYWxseSBxdWV1ZWQNCj4gaW50byBuZXh0IHJlbGVhc2UuDQo+IA0KPiBSQ3Mgd2ls
bCBiZSBhcnJhbmdlZCBpbW1lZGlhdGVseSBhZnRlciBmcmVlemUuDQo+IA0KPiA9IFByb2pl
Y3RzID0NCj4gDQo+ID09IEh5cGVydmlzb3IgPT0NCj4gKiDCoHN0dWJkb206IHJlZHVjZSB4
ZW5zdG9yZSBsaWJyYXJ5IGRlcGVuZGVuY2llcyAodjEpDQo+ICDCoCAtIMKgSnVlcmdlbiBH
cm9zcw0KPiAgwqAgLSBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAyNDEw
MTAxNTU0NTkuMjIzODktMS1qZ3Jvc3NAc3VzZS5jb20vVC8gDQo+ICNtOGI1YWYzODZlMmQy
ODg5NjFiYjZlOGY3ODM5NjUwZTBjYWI5NmE4MyA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
eGVuLSANCj4gZGV2ZWwvMjAyNDEwMTAxNTU0NTkuMjIzODktMS1qZ3Jvc3NAc3VzZS5jb20v
VC8gDQo+ICNtOGI1YWYzODZlMmQyODg5NjFiYjZlOGY3ODM5NjUwZTBjYWI5NmE4Mz4NCg0K
VGhpcyBvbmUgaGFzIGJlZW4gYXBwbGllZCBhbHJlYWR5Lg0KDQoNCkp1ZXJnZW4NCg==
--------------soa2blsgTPuWnfjdJImBcngz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------soa2blsgTPuWnfjdJImBcngz--

--------------my9VWqJD0FktgDpR9tDcFBnU--

--------------jJrHLxQ9gIASRZbaESDR2c4c
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmc0qLcFAwAAAAAACgkQsN6d1ii/Ey9t
fwgAhRY4HeaASuMLN2PqMmPSX5tfNvuCZu5MFwz+jKD7LZhIWrHVec+Eddxi5NQyexC63W4g44sp
XzuNZeOF6cRREFyP1zMLIM867/wqWYj/ib/05GuvAS2kN7wg9pg7ac+Qch7GjaLWXAAcUbRYrxWk
pl9AV3Cu3zRTzRfLFicwoUnK6by83rx9ydH67kdRNTjX8uYonptlTIMji+PrhLk47Ug+9DvHQvHB
s1+hmOLXDuCMJM0e6iWAhb1OYgU8KqH1cQN0vxdNhjCxH6YH8rCvsm6DCV34hZkGURCMRrG1tC/2
lESb9yU9dEbiLWs4JHxXbdKhHwfizTeNcx/bfzrhYQ==
=QEVY
-----END PGP SIGNATURE-----

--------------jJrHLxQ9gIASRZbaESDR2c4c--

