Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0292BA9A589
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 10:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965984.1356354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7rj0-0005Lt-VX; Thu, 24 Apr 2025 08:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965984.1356354; Thu, 24 Apr 2025 08:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7rj0-0005KR-Sb; Thu, 24 Apr 2025 08:14:26 +0000
Received: by outflank-mailman (input) for mailman id 965984;
 Thu, 24 Apr 2025 08:14:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RfDJ=XK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u7riz-0005KL-Lc
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 08:14:25 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 217e76ce-20e4-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 10:14:23 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so4432295e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 01:14:23 -0700 (PDT)
Received: from ?IPV6:2003:e5:870f:e000:6c64:75fd:2c51:3fef?
 (p200300e5870fe0006c6475fd2c513fef.dip0.t-ipconnect.de.
 [2003:e5:870f:e000:6c64:75fd:2c51:3fef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2bfa93sm10528525e9.37.2025.04.24.01.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 01:14:22 -0700 (PDT)
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
X-Inumbo-ID: 217e76ce-20e4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745482463; x=1746087263; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=008EJSG/phqGVPmxi0nDH3NCIHBvP55QLSxmr4tKYHM=;
        b=O+zyb46tl5IRV0ab/UlX29Dgj8ugoX5RBknK+7OCh/4p8Yxv2md1Qxjr0VLg1dCpny
         iJ+c7EX+4DDFb3nIZ+k5DUs7cssRnN0y5RwZ3tuh706Al/+X6XrWvyOwgB/m+eNCvBDH
         s1wxK3Lv72jmWLT9X8F14nUjLuajM4FvVjvOzstRBWcWHHXVBeHGf3kUln/MmlcAtesp
         k/e/UnFyEmTW7EPxlq/0uBvnNXu15jq22eXONFEZMjaMycT+q5+OINsmf2jZGQNwn168
         NnwFU3VnbvBfWR9x6/T2HxSulu4xuXQ8HInkGcQvmQMx76nDjBSfLknyWWzN20REotAb
         NB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745482463; x=1746087263;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=008EJSG/phqGVPmxi0nDH3NCIHBvP55QLSxmr4tKYHM=;
        b=OdtGhEDqY1sN1DusdDeCg95nU+x6lIv4tSHc+5z1qwj3X52lSiGpASG7GK9/BtIo6v
         rNUL60phzRz2/9imHducSt1RTdaViViaC4aCmqxMKdK4qo2dWX4xWNH3c7BwTRDI8its
         3daK4C2zo6ubv3qBGH4od11guVJpDD5ip6BKnkZR4CIlvRqWW89lDb6ppdFtKqBw6j5x
         weKo78ydb64vTgYujBsHXOawCD6BphuHls5LYv3XJBsXVuvxohAL2vbEiYg/A8Esh9xl
         caPSciINs0mB7m/PrU3nfp2sFxG1ylJ9OgwOmn7ZL9p0Z6B6klIeaN9isnfFqB6r7Tbk
         pKDw==
X-Forwarded-Encrypted: i=1; AJvYcCWp+qulfYgcxXEE+DDMEiJxUs5wJ9C02EUea6I0nwyBlfYwBT++0Nwrj3cdiLfCMAx/EG2f1G/nLT0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzokT2YlPSiAcY1bOh+o2hI30rhxaf1vJYJ+oUwxbrj4p7k5XpP
	JK+9PAIACwkfo2JxF7uHvB+2EBJsfjcXSa9AdDL5FHzn+iOkaLpRqH1t9FNBg7c=
X-Gm-Gg: ASbGncsZh9gJRi21y35hQM4iIoc/ZdmFmmksa9aK7qnL7kbXH3UKNiTAX7unKMSdV8l
	Lb3t1dhXePAGcZeRrZDi2PSqxqwZDhOGXxibU7IXJ7KwQPoKKwF8sew82+7GkXnAtMKQ0307BD2
	bP+MhMrnxFV5V13RCMOMYpO/dwd9FJFBBap6AfryA70U4n7eo0E4Ly3WNPml60GN5Ilp46cMbg/
	mRkyk27TDa+14Qgi0NSLRdGcNW9JC0NXT3O9jWRlXLrLQTutl7gYl3n4J+OmyWW65QgOAz/PcsR
	CG8FiEfblgWvpn6g3sYf6Ad9WChnBvAuqkBNxUgqvCUafuR9S+dWXVxamzo7yE+1VtOKJwwB3Wb
	HHIp7Hn7DFw+U0bPnGG34huXSGRGsjIDsJ5/nlsXNH6qBRYsh9XfPyABhU8eOB1SENg==
X-Google-Smtp-Source: AGHT+IFyv2kCFIwtSgJfhMLoeL4umabM8GMXtTutcFH/tZ4GaYnDHHb5JDeYCLMrA1sChvoEPbh09w==
X-Received: by 2002:a05:600c:1d03:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-4409bd2225dmr12614855e9.12.1745482462951;
        Thu, 24 Apr 2025 01:14:22 -0700 (PDT)
Message-ID: <0cdc6e9d-88eb-4ead-8d55-985474257d53@suse.com>
Date: Thu, 24 Apr 2025 10:14:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 21/34] x86/msr: Utilize the alternatives mechanism
 to write MSR
To: Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-edac@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org,
 andrew.cooper3@citrix.com, peterz@infradead.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 wei.liu@kernel.org, ajay.kaher@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
 pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
 luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
 haiyangz@microsoft.com, decui@microsoft.com
References: <20250422082216.1954310-1-xin@zytor.com>
 <20250422082216.1954310-22-xin@zytor.com>
 <b2624e84-6fab-44a3-affc-ce0847cd3da4@suse.com>
 <f7198308-e8f8-4cc5-b884-24bc5f408a2a@zytor.com>
 <37c88ea3-dd24-4607-9ee1-0f19025aaef3@suse.com>
 <bb8f6b85-4e7d-440a-a8c3-0e0da45864b8@zytor.com>
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
In-Reply-To: <bb8f6b85-4e7d-440a-a8c3-0e0da45864b8@zytor.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VMSl19Ws92VaJ19wHUdCoQEK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VMSl19Ws92VaJ19wHUdCoQEK
Content-Type: multipart/mixed; boundary="------------0vp5F0mv6hCcRHQUu1aj0a9v";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-edac@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org,
 andrew.cooper3@citrix.com, peterz@infradead.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 wei.liu@kernel.org, ajay.kaher@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
 pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
 luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
 haiyangz@microsoft.com, decui@microsoft.com
Message-ID: <0cdc6e9d-88eb-4ead-8d55-985474257d53@suse.com>
Subject: Re: [RFC PATCH v2 21/34] x86/msr: Utilize the alternatives mechanism
 to write MSR
References: <20250422082216.1954310-1-xin@zytor.com>
 <20250422082216.1954310-22-xin@zytor.com>
 <b2624e84-6fab-44a3-affc-ce0847cd3da4@suse.com>
 <f7198308-e8f8-4cc5-b884-24bc5f408a2a@zytor.com>
 <37c88ea3-dd24-4607-9ee1-0f19025aaef3@suse.com>
 <bb8f6b85-4e7d-440a-a8c3-0e0da45864b8@zytor.com>
In-Reply-To: <bb8f6b85-4e7d-440a-a8c3-0e0da45864b8@zytor.com>

--------------0vp5F0mv6hCcRHQUu1aj0a9v
Content-Type: multipart/mixed; boundary="------------0yeVN4sI0bLxwrBqbg5RE1SY"

--------------0yeVN4sI0bLxwrBqbg5RE1SY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDQuMjUgMTA6MDYsIFhpbiBMaSB3cm90ZToNCj4gT24gNC8yMy8yMDI1IDk6MDUg
QU0sIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4gSXQncyBub3QgYSBtYWpvciBjaGFuZ2Us
IGJ1dCB3aGVuIGl0IGlzIHBhdGNoZWQgdG8gdXNlIHRoZSBpbW1lZGlhdGUgZm9ybSBNU1Ig
DQo+Pj4gd3JpdGUgaW5zdHJ1Y3Rpb24sIGl0J3Mgc3RyYWlnaHRmb3J3YXJkbHkgc3RyZWFt
bGluZWQuDQo+Pg0KPj4gSXQgc2hvdWxkIGJlIHJhdGhlciBlYXN5IHRvIHN3aXRjaCB0aGUg
Y3VycmVudCB3cm1zci9yZG1zciBwYXJhdmlydCBwYXRjaGluZw0KPj4gbG9jYXRpb25zIHRv
IHVzZSB0aGUgcmRtc3Ivd3Jtc3IgaW5zdHJ1Y3Rpb25zIGluc3RlYWQgb2YgZG9pbmcgYSBj
YWxsIHRvDQo+PiBuYXRpdmVfKm1zcigpLg0KPj4NCj4+IFRoZSBjYXNlIG9mIHRoZSBuZXcg
aW1tZWRpYXRlIGZvcm0gY291bGQgYmUgaGFuZGxlZCB0aGUgc2FtZSB3YXkuDQo+IA0KPiBB
Y3R1YWxseSwgdGhhdCBpcyBob3cgd2UgZ2V0IHRoaXMgcGF0Y2ggd2l0aCB0aGUgZXhpc3Rp
bmcgYWx0ZXJuYXRpdmVzDQo+IGluZnJhc3RydWN0dXJlLsKgIEFuZCB3ZSB0b29rIGEgc3Rl
cCBmdXJ0aGVyIHRvIGFsc28gcmVtb3ZlIHRoZSBwdl9vcHMNCj4gTVNSIEFQSXMuLi4NCg0K
QW5kIHRoaXMgaXMgd2hhdCBJJ20gcXVlc3Rpb25pbmcuIElNSE8gdGhpcyBhcHByb2FjaCBp
cyBhZGRpbmcgbW9yZQ0KY29kZSBieSByZW1vdmluZyB0aGUgcHZfb3BzIE1TUl9BUElzIGp1
c3QgYmVjYXVzZSAicHZfb3BzIGlzIGJhZCIuIEFuZA0KSSBiZWxpZXZlIG1vc3QgcmVmdXNh
bCBvZiBwdl9vcHMgaXMgYmFzZWQgb24gbm8gbG9uZ2VyIHZhbGlkIHJlYXNvbmluZy4NCg0K
PiBJdCBsb29rcyB0byBtZSB0aGF0IHlvdSB3YW50IHRvIGFkZCBhIG5ldyBmYWNpbGl0eSB0
byB0aGUgYWx0ZXJuYXRpdmVzDQo+IGluZnJhc3RydWN0dXJlIGZpcnN0Pw0KDQpXaHkgd291
bGQgd2UgbmVlZCBhIG5ldyBmYWNpbGl0eSBpbiB0aGUgYWx0ZXJuYXRpdmVzIGluZnJhc3Ry
dWN0dXJlPw0KDQoNCkp1ZXJnZW4NCg==
--------------0yeVN4sI0bLxwrBqbg5RE1SY
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0yeVN4sI0bLxwrBqbg5RE1SY--

--------------0vp5F0mv6hCcRHQUu1aj0a9v--

--------------VMSl19Ws92VaJ19wHUdCoQEK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgJ8twFAwAAAAAACgkQsN6d1ii/Ey8k
sgf/bXb/yPNEYKqkydqe/bdDkpvmLpSFUpdHMovM4PRMGt6zioNmVWczEr+IQ53jJEK1EgOrz1V5
CSe5GF6AQ52FukYXR+nsdEhvJ3SQbHcC1jjQ0KBbi7qxCIl5hNUVmyEEjIxdE5u2TPCMWxoot6t1
yNRYVLJOfCGc+rtLzkqT+DCZhmL5bJV7aHjBV/gGYMQs5mZvFWky2orA31cQd87ZQ01sJsXhSyK5
kyPT2DLGT2EUSFgkADIATsccYzDmoFGHujoktt1Dvy7KAp5Ij89J1F9z/bJPieoeXbxYM6WgXK6i
mL8fdLmqdHH+xIxH3Fw7vjbOQPVv3Q5NLHeDBr80mQ==
=oHe8
-----END PGP SIGNATURE-----

--------------VMSl19Ws92VaJ19wHUdCoQEK--

