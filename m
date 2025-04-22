Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6737EA96544
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 11:58:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962397.1353608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7AOA-0002I5-QL; Tue, 22 Apr 2025 09:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962397.1353608; Tue, 22 Apr 2025 09:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7AOA-0002F5-N5; Tue, 22 Apr 2025 09:58:02 +0000
Received: by outflank-mailman (input) for mailman id 962397;
 Tue, 22 Apr 2025 09:58:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mE8E=XI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u7AO9-0001ix-AI
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 09:58:01 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4660a6b5-1f60-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 11:58:00 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39c1ef4acf2so3011710f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 02:58:00 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4207afsm14838749f8f.12.2025.04.22.02.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 02:57:59 -0700 (PDT)
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
X-Inumbo-ID: 4660a6b5-1f60-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745315880; x=1745920680; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tO6B4uusGXWb6S1d5vB39Y8e5rVhKy79xlXkhC2hD/8=;
        b=P89FawpQJtvLX/wOJQGYwyVIkyTeG7hnjK3fTwrkmlVr8ZzdOovLD01EGoTPHJ/NdO
         1FXdPL/RLkY/GTVd3SBkwlupV1MiU7z3Uh+iG4Kh3NZUQU4SiryKQVZmKv0A+2xlj/KX
         X0YQTt1fDsKMieSBcLvGq7Ou2VfLuZXnMtRJui+jGFu0K7QUYF0zpNnzX/ybGjFt3Hbi
         wI8CGhICDKPGYfPdIkrCqMBepZR8Gqi3L6YZm91KDK+KABCE/FWzY8kMR28ogJ6OpQlw
         q0ak0sjpY5qCoib/Pu8pQfpHY7B+nkbBRPyKiD3q8jFWdTe8XXQ4gUwAk9q3aJayOWrm
         CEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315880; x=1745920680;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tO6B4uusGXWb6S1d5vB39Y8e5rVhKy79xlXkhC2hD/8=;
        b=PSRcn1T3KgdtOOjsBGxObqZywbT0Yr4ZJ/pCS5QPDBhs4YlcVgfoFPc174BPqUWLUq
         fVJP1Ki6qWJnYpK9XURdN+4Cn9a1Mw5TQ3OATTwevk9dfSb2K2Z/D2MwWwZVq2jp7Mb/
         ir666kuONbFFtRg4N0xL6LXZLuGY2+O6VxBxqPfHQbd78Be7x6yRkSz3GqFJmxR2j7I1
         2+tlLDYGFKSCQ3h3c2KGp33VugpvAdewocuBqbMTVD9L1q9QqYfp6pwpK/e2/2zEbEl5
         BVrAuDqZIaDZqaYNH1eQj1FqXkRIyNIBUI5vg/HXO1pOYNNg3kBGxJqci8VBBQuaJICF
         anxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW86xBFDJgIyErWNYkr0mxAzyWocTQbVcJm6IfY2Ee/2usZxdDDoO0j+NthiodIWedvu4vJgRAwaA4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyokmOSw3qayunVTHCWKkypsbggxcKqEwKVqgxrx/YeghjQpfAU
	EPuU+nSWxHFbfGCvyOXwf8ylacs3YZJwpdiOB8itiNcQNsVn+5SqTmDW+53B25w=
X-Gm-Gg: ASbGncsg7Ug+x/T+XHHL25PvKcl/qvAijLA0ZCei4NETAE6envJ8aj76EmMx1CCGng3
	JVF33ZByovno1GiFGhElhEWX4+C4BBa2pBaxs1KaqdMtzvYcC5HydzApl22IrbZ/OlYm80mZaHe
	NHjPi8Qe2H0A2L6lGoIDJPRn0RlKk7njZ3+PTrcJBVyXCZHqD+4jnmi4b8chg7ouy24NdxYFi36
	tTWJz59Je0Tq19jRmDD/vXaQMqaNtf1ftFJ/EUofk/4Q6FkmS9olHdtMxEmqxW6VBHpAta4aDTj
	NCJS2RnqziLUUrNQy9ToW8cMCBHWEnU8jzC20xEQgoZKj8UryRV/KrC/NuE9Dg+W67f4KIU0676
	GTvt5Fy/9SUrmdznGiJzACaqdtnSRVPAIBCUoJqPAikEM7boIqqS39Pwy/nGvJDE9gw==
X-Google-Smtp-Source: AGHT+IGwOEvoLsyGlKbLK2I7EO3CV112zbLo9AuOo2VfG3qa8/zautum4TxS9/Et7Lbmpeas2d4LEQ==
X-Received: by 2002:a5d:584e:0:b0:39c:2264:43ea with SMTP id ffacd0b85a97d-39efba2a69bmr12519153f8f.3.1745315879983;
        Tue, 22 Apr 2025 02:57:59 -0700 (PDT)
Message-ID: <6046a6d0-bae3-41bb-9960-82c403f62476@suse.com>
Date: Tue, 22 Apr 2025 11:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 22/34] x86/msr: Utilize the alternatives mechanism
 to read MSR
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
 <20250422082216.1954310-23-xin@zytor.com>
 <91f9217a-cc2d-4a6e-bada-290312f73d82@suse.com>
 <7fea6158-9b7d-4bfb-b709-729266803c32@zytor.com>
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
In-Reply-To: <7fea6158-9b7d-4bfb-b709-729266803c32@zytor.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LRC1NKAgjBDvH3dBaZRyJS4G"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LRC1NKAgjBDvH3dBaZRyJS4G
Content-Type: multipart/mixed; boundary="------------2vrbMGF8pPaZHLnA82JDRyos";
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
Message-ID: <6046a6d0-bae3-41bb-9960-82c403f62476@suse.com>
Subject: Re: [RFC PATCH v2 22/34] x86/msr: Utilize the alternatives mechanism
 to read MSR
References: <20250422082216.1954310-1-xin@zytor.com>
 <20250422082216.1954310-23-xin@zytor.com>
 <91f9217a-cc2d-4a6e-bada-290312f73d82@suse.com>
 <7fea6158-9b7d-4bfb-b709-729266803c32@zytor.com>
In-Reply-To: <7fea6158-9b7d-4bfb-b709-729266803c32@zytor.com>

--------------2vrbMGF8pPaZHLnA82JDRyos
Content-Type: multipart/mixed; boundary="------------0gah4xKFvsHE00D3flXrnkz1"

--------------0gah4xKFvsHE00D3flXrnkz1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDQuMjUgMTE6MjAsIFhpbiBMaSB3cm90ZToNCj4gT24gNC8yMi8yMDI1IDE6NTkg
QU0sIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAyMi4wNC4yNSAxMDoyMiwgWGluIExp
IChJbnRlbCkgd3JvdGU6DQo+Pj4gVG8gZWxpbWluYXRlIHRoZSBpbmRpcmVjdCBjYWxsIG92
ZXJoZWFkIGludHJvZHVjZWQgYnkgdGhlIHB2X29wcyBBUEksDQo+Pj4gdXRpbGl6ZSB0aGUg
YWx0ZXJuYXRpdmVzIG1lY2hhbmlzbSB0byByZWFkIE1TUjoNCj4+Pg0KPj4+IMKgwqDCoMKg
IDEpIFdoZW4gYnVpbHQgd2l0aCAhQ09ORklHX1hFTl9QViwgWDg2X0ZFQVRVUkVfWEVOUFYg
YmVjb21lcyBhDQo+Pj4gwqDCoMKgwqDCoMKgwqAgZGlzYWJsZWQgZmVhdHVyZSwgcHJldmVu
dGluZyB0aGUgWGVuIGNvZGUgZnJvbSBiZWluZyBidWlsdA0KPj4+IMKgwqDCoMKgwqDCoMKg
IGFuZCBlbnN1cmluZyB0aGUgbmF0aXZlIGNvZGUgaXMgZXhlY3V0ZWQgdW5jb25kaXRpb25h
bGx5Lg0KPj4+DQo+Pj4gwqDCoMKgwqAgMikgV2hlbiBidWlsdCB3aXRoIENPTkZJR19YRU5f
UFY6DQo+Pj4NCj4+PiDCoMKgwqDCoMKgwqDCoCAyLjEpIElmIG5vdCBydW5uaW5nIG9uIHRo
ZSBYZW4gaHlwZXJ2aXNvciAoIVg4Nl9GRUFUVVJFX1hFTlBWKSwNCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdGhlIGtlcm5lbCBydW50aW1lIGJpbmFyeSBpcyBwYXRjaGVkIHRv
IHVuY29uZGl0aW9uYWxseQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBqdW1wIHRv
IHRoZSBuYXRpdmUgTVNSIHJlYWQgY29kZS4NCj4+Pg0KPj4+IMKgwqDCoMKgwqDCoMKgIDIu
MikgSWYgcnVubmluZyBvbiB0aGUgWGVuIGh5cGVydmlzb3IgKFg4Nl9GRUFUVVJFX1hFTlBW
KSwgdGhlDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGtlcm5lbCBydW50aW1lIGJp
bmFyeSBpcyBwYXRjaGVkIHRvIHVuY29uZGl0aW9uYWxseSBqdW1wDQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHRvIHRoZSBYZW4gTVNSIHJlYWQgY29kZS4NCj4+Pg0KPj4+IFRo
ZSBhbHRlcm5hdGl2ZXMgbWVjaGFuaXNtIGlzIGFsc28gdXNlZCB0byBjaG9vc2UgdGhlIG5l
dyBpbW1lZGlhdGUNCj4+PiBmb3JtIE1TUiByZWFkIGluc3RydWN0aW9uIHdoZW4gaXQncyBh
dmFpbGFibGUuDQo+Pj4NCj4+PiBDb25zZXF1ZW50bHksIHJlbW92ZSB0aGUgcHZfb3BzIE1T
UiByZWFkIEFQSXMgYW5kIHRoZSBYZW4gY2FsbGJhY2tzLg0KPj4NCj4+IFNhbWUgYXMgdGhl
IGNvbW1lbnQgdG8gcGF0Y2ggNTogdGhlcmUgaXMgbm8gaW5kaXJlY3QgY2FsbCBvdmVyaGVh
ZCBhZnRlcg0KPj4gdGhlIHN5c3RlbSBoYXMgY29tZSB1cC4NCj4+DQo+IA0KPiBQbGVhc2Ug
Y2hlY2sgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC84N3kxaDgxaHQ0LmZmc0B0Z2x4
Ly4NCj4gDQo+IEFuZCBpdCdzIHdhcyBhbHNvIG1lbnRpb25lZCBpbiB0aGUgcHJldmlvdXMg
cGF0Y2g6DQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwNDIyMDgy
MjE2LjE5NTQzMTAtMjIteGluQHp5dG9yLmNvbS8NCj4gDQo+IFBsZWFzZSBsZXQgbWUga25v
dyB3aGF0IEkgaGF2ZSBtaXNzZWQuDQoNClBsZWFzZSBzZWUgbXkgcmVzcG9uc2UgdG8gdGhl
IHByZXZpb3VzIHBhdGNoLg0KDQoNCkp1ZXJnZW4NCg==
--------------0gah4xKFvsHE00D3flXrnkz1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0gah4xKFvsHE00D3flXrnkz1--

--------------2vrbMGF8pPaZHLnA82JDRyos--

--------------LRC1NKAgjBDvH3dBaZRyJS4G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgHaCYFAwAAAAAACgkQsN6d1ii/Ey88
2gf9G2X7seedpgkuVi3Kr8ramS2kAPeIhTmk5YzYNI/baO7kJni9Bz3A8CJrjqPBQos1/m+ZHUnL
HHqgoLhq+2kdhHVUY+nPYIPdebmYLTHvd3gC+R7swUzJf55bQGENKLO6WtuH5sksovruObmjap7C
sbHKsWYiAx51NvcRCMZPJAmT8N/+KqAAPfqutdEhiGIfuSkyH9cA34H3Dg/y2hLs4SMppXznwBe7
TXOOblqw8TxiQKwP05dQo56KdIc6ap06wnELQWlmjSZUSIkSyD4RvmANZE0jAxiFKQr00dtaGUxz
eaA239uDGL6mfOq/W/cBOw0vspmUeBL6fc4RZErgyw==
=mYH8
-----END PGP SIGNATURE-----

--------------LRC1NKAgjBDvH3dBaZRyJS4G--

