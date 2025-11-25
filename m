Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57984C85376
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 14:41:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171892.1496970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNtH0-0002ny-AU; Tue, 25 Nov 2025 13:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171892.1496970; Tue, 25 Nov 2025 13:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNtH0-0002kr-7c; Tue, 25 Nov 2025 13:40:02 +0000
Received: by outflank-mailman (input) for mailman id 1171892;
 Tue, 25 Nov 2025 13:40:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ygd1=6B=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vNtGy-0002fq-TX
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 13:40:01 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bf5f0f8-ca04-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 14:39:58 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-640a503fbe8so9771680a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 05:39:58 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64536443a9csm14940329a12.29.2025.11.25.05.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 05:39:57 -0800 (PST)
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
X-Inumbo-ID: 3bf5f0f8-ca04-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764077998; x=1764682798; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t9k46YKiR0yToOqPC8tJLWldUv3bkY2Nm4TLf+L1CEI=;
        b=fmCvhhKaaqdZshzEVm7K2rho4mJWNxrn9BMJle3jdGl7x7DiNG1B2sVkozP3QiKSUP
         3KQOStJrloQ+x6HU8Bs4sS0rEAFUxrRcgXAI2mJTSYNKmkav8Olap9IC9R5ZKiE2vy95
         oDx9HbNY2xbhCcnMXnzpj65DiOf+Es2rodr8lS3J1vZJQbjZaERIFa0/0Ba8cTeMIHSp
         DRKC92J6vfUfMo+8Qz7B23tXhvzQsAd98862N7D4rfJiW6rKl4Uyw212WqDRLxVTfDni
         D8B4CaqklX6Z70hkF5pIAzlGF9OJ9e+b8cLCcAmYBV0tu+qBKXcYPQ5+pXFzVjpfexp1
         pBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764077998; x=1764682798;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9k46YKiR0yToOqPC8tJLWldUv3bkY2Nm4TLf+L1CEI=;
        b=hNf3wXp2R5gqe/FA31m9e6rx5oi7rfdwqPjSWCzIRGOPEt8MO7H2B5uyzyl0vnvrS8
         23eiBQNU+SNkDWwIn5b/k5pVPRygrdBmsmUr6K192TXs8x/cC9+kguI76Ip0h2iIkMWY
         GXQJgsK9I7acBh1moQiwdsWSbDbzDfId/RRqpwYLkZnF4DQTgc5SqvGrasLkEVQzl2yM
         oh5UCROf6Bz6e1oMW90JSbOdxEuDrtC4pVoDsEADYGSMMDRoqA4d/PE98Aj8J4LLvso8
         rLcMoRfbb5tkTyprPnOgqCz4CipS/F6BRswYZ1N7k74fqSHz1LBI7nrhr1cMX6302bmF
         JPvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaXW+dCmpM8kgDbeWWmXN3BTwZIGgu8LiJJr6hChXYpWoM3AEUBaTpaEXXqjxTPzuptSOINSre5Dc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPvoH3Y/xjZshW2BfNU0r612l1ck0v24flfQ5ErSd6/5UqQ9a2
	qWVgaGCnXudKDoIX8ShAzgJMMJkZ1vAjNGnrNslKoUc9aAU76/iW/cpJxyZVHbDkoJQ=
X-Gm-Gg: ASbGnctNxRT0Xdps4+KWzWk42fXX5NX2wzTJCLTQWBKFWYAFC3rpgnRbBMP1GEzHkI2
	k5wJgRgJf8TwO58iZEOQYtM4KGVFo3ZFCC9iBrAkHQJFeoVPftXjhQWnvuv7Hl0Gc6LsEtzdwjL
	2tBmF8DuAmrTIf1lKllwlF7hvSl6INlMBsrI82NNyxd3gQDOoW8AAk2U6GKWF3vs7zPe1wSuK2Z
	HPuVP3ZhP9swEDFPAinVKqHlYr0t1J6UMDCXPj4OMXb7wfI5NRjhxz6tMhnN+jO4AVcA/w4emly
	pz/TC1E1Sjs1+eUQJvRxL5yyWPaCa/AKxDB8FYxoWMDnPNeQW1jOANa12i4Edg360rO+muelc7O
	moUQLZWbsZLJknQkZVHRu/cYMzPyCZk35bChgbVP+vGPtj030XcwfaHTqnOkpzwAyMJBMYEwml2
	zGpBFaRiK4E6AHpsk4Gc+FlesyPFpdvlSOJS0RRcZIeUxD3aozWqg+yk6pn7J7OZvSbjoizruSZ
	AWfnkkuLXkcyFW76ghIiGjrLYnp2fLEGPBolZwaI7vA6tL97g==
X-Google-Smtp-Source: AGHT+IFEyicFSi+PL/7sV+Rr65T6PnnmK37s9BQnogitw6aYlavVnxgivz8dWx5vdwjWsip7TwnDGQ==
X-Received: by 2002:a05:6402:1d50:b0:640:cd2a:3cc1 with SMTP id 4fb4d7f45d1cf-645eaf9e5d6mr2598230a12.0.1764077997753;
        Tue, 25 Nov 2025 05:39:57 -0800 (PST)
Message-ID: <263d6867-bf94-40b5-87f8-96b40e797ebe@suse.com>
Date: Tue, 25 Nov 2025 14:39:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] x86/xen: use lazy_mmu_state when
 context-switching
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-13-kevin.brodsky@arm.com>
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
In-Reply-To: <20251124132228.622678-13-kevin.brodsky@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aG2Ac2AfdT2tzwl0XdLF1SjN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aG2Ac2AfdT2tzwl0XdLF1SjN
Content-Type: multipart/mixed; boundary="------------uiRZ28tjJaLdZE5TT0DoL5p0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
Message-ID: <263d6867-bf94-40b5-87f8-96b40e797ebe@suse.com>
Subject: Re: [PATCH v5 12/12] x86/xen: use lazy_mmu_state when
 context-switching
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-13-kevin.brodsky@arm.com>
In-Reply-To: <20251124132228.622678-13-kevin.brodsky@arm.com>

--------------uiRZ28tjJaLdZE5TT0DoL5p0
Content-Type: multipart/mixed; boundary="------------yTa6J58m2WgehpiHUf7cxco6"

--------------yTa6J58m2WgehpiHUf7cxco6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjUgMTQ6MjIsIEtldmluIEJyb2Rza3kgd3JvdGU6DQo+IFdlIGN1cnJlbnRs
eSBzZXQgYSBUSUYgZmxhZyB3aGVuIHNjaGVkdWxpbmcgb3V0IGEgdGFzayB0aGF0IGlzIGlu
DQo+IGxhenkgTU1VIG1vZGUsIGluIG9yZGVyIHRvIHJlc3RvcmUgaXQgd2hlbiB0aGUgdGFz
ayBpcyBzY2hlZHVsZWQNCj4gYWdhaW4uDQo+IA0KPiBUaGUgZ2VuZXJpYyBsYXp5X21tdSBs
YXllciBub3cgdHJhY2tzIHdoZXRoZXIgYSB0YXNrIGlzIGluIGxhenkgTU1VDQo+IG1vZGUg
aW4gdGFza19zdHJ1Y3Q6OmxhenlfbW11X3N0YXRlLiBXZSBjYW4gdGhlcmVmb3JlIGNoZWNr
IHRoYXQNCj4gc3RhdGUgd2hlbiBzd2l0Y2hpbmcgdG8gdGhlIG5ldyB0YXNrLCBpbnN0ZWFk
IG9mIHVzaW5nIGEgc2VwYXJhdGUNCj4gVElGIGZsYWcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBLZXZpbiBCcm9kc2t5IDxrZXZpbi5icm9kc2t5QGFybS5jb20+DQoNClJldmlld2VkLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------yTa6J58m2WgehpiHUf7cxco6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------yTa6J58m2WgehpiHUf7cxco6--

--------------uiRZ28tjJaLdZE5TT0DoL5p0--

--------------aG2Ac2AfdT2tzwl0XdLF1SjN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmklsawFAwAAAAAACgkQsN6d1ii/Ey9M
5gf9EkkVr+UGKF/wariaJTMLeEayZP1qBy09TFMvwrlbuCyD1J20iKHWJ2c/xfac/xcQdvzxGK3Y
nMX8Dg+6nWgGk7tT/9p0s2dcvsYF2fnh4WI7yS6FTimnkkmwDCj9T7zl1nziZEYUlj7oSea1hRVz
v5iiijrTDLW6L4D3oVzmqLK1XGNpOTClCzJcn9gz45Pw5+8laVmiYBcktiYFOT/TcJvnIeHTH8Fx
P0/i23ndybO8Xtkp5yj+KAjX+75J2bEJOx79yOSaRu5z3yYhY2XBKE9tsxsVb7uoaIhxnhc2Z5ZH
ms+Hk03X+jeJhvbey+a5MrddNG95o9MtcKNcDmNH6g==
=ph6L
-----END PGP SIGNATURE-----

--------------aG2Ac2AfdT2tzwl0XdLF1SjN--

