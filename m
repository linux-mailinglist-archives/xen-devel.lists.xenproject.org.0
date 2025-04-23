Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED29A99449
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 18:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964979.1355657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7cgw-00018F-Df; Wed, 23 Apr 2025 16:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964979.1355657; Wed, 23 Apr 2025 16:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7cgw-00015c-Aq; Wed, 23 Apr 2025 16:11:18 +0000
Received: by outflank-mailman (input) for mailman id 964979;
 Wed, 23 Apr 2025 16:11:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rDpt=XJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u7cgv-00015W-8K
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 16:11:17 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93acb682-205d-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 18:11:13 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-acb615228a4so198909066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 09:11:13 -0700 (PDT)
Received: from ?IPV6:2003:e5:870f:e000:6c64:75fd:2c51:3fef?
 (p200300e5870fe0006c6475fd2c513fef.dip0.t-ipconnect.de.
 [2003:e5:870f:e000:6c64:75fd:2c51:3fef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6ec04668sm821934866b.24.2025.04.23.09.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 09:11:11 -0700 (PDT)
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
X-Inumbo-ID: 93acb682-205d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745424672; x=1746029472; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r6M9Ja1D8Zs6b5j1y3MnNQBue4KN5PdtElPgqLbvxSg=;
        b=LyCVCZEEaSR16wdU3XmuLySOPO28HEvcvf9Zvw0NxgQ6ecZUfW4dc78XYrMs5qak/i
         m2Y4if9+je2jXeC1dIw6qXnYg/e6YGm5LWuQL8dOhlTT9VIL4l+OtS4Jd9UlAfeidmBV
         ebHhFBMbS7popSyd5dBHzsW3dxIqeMUJwikXpnExQwo1QihD684aDcJsdhozqPBfc/LY
         +p0q97fvBr7ZuYj3geNupjLpV0wMtM2jO7QREY2o1ES9CfhIgeon3yQz7gihg1CqBwRq
         x11hsYLosRNis0M4ZjWxVqTw8gfjn6sgcbsi1Io8JQ8XVfHM17B/59Rh74qTO8z9y14Q
         Z8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745424672; x=1746029472;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r6M9Ja1D8Zs6b5j1y3MnNQBue4KN5PdtElPgqLbvxSg=;
        b=BGwRuet0hyEXntWGF7PNSKLO4VKAoCR2IHFk6sRRw0Vc5VfDPG/coq4yWAyG9pIw4n
         9QgjNBXeeAy4AR87WDbtSm8OajnLXV1OjqPGe2EG9zBoXq91xI134tbZTDAzR4hXynLQ
         4i1eC5PNC3UmSNbj6dRIdLbWAOOMD4IScECCMn2CM1Y6dtPIqiogS3GZvbvWvaeE3ZGY
         a7IyYRVQgeAcJAqzopvMWdnoUVN0BlBEYIa1Mn+XwGyT/X6vrLdD5eRQ+dAyuo4MAIG3
         zzqhvkoVx3oGrNrg4IX5W+efuQTWerh6Jy1MSea69Q0TSpptttBIIHkPaJ9VdTA0NBUv
         yKWg==
X-Forwarded-Encrypted: i=1; AJvYcCUxxMNOdntSwRGN/O8tdCsyw4FYExSpcO2YCjIAvqBOcSmJlclFBY8RZP/p5ZF5pGmYGc3LMyocTEk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy32dq31BHx23tdpbODMIIcyRrFuzYUOwyCXCgU9WYPjlxYb+i1
	GJRvfLEf1OVb/53jGc4p6o6iwnYPFLhxl8qmVCYMnBWq/hpp7L0A1oaNUDPvztU=
X-Gm-Gg: ASbGncseBs20SnOtqKtG7EBSZx578za5QEdDUpndOcgUQbJ5EteDt89na9dzD8FdJcm
	897msbq5N2yjHKszN5BLfDE8YLQw1sOzH1Y7SQQxUA2N17qlYmPMlCK0KLwZ4oNgVHXGh53et2e
	phmOfh4YldrRnULjVWSfHL9TkiGJIwQwej6sedcx0tOHTTIthcPxW2cbncD4ymxtXPpfSwVBPpg
	0w5BTBAftEwMX+IpxxQbVH30E+DsMJmB4Lg0LJsq3YrbrPOzVRyQgDWYqvtwND1+a9edHbKCD8b
	3O5tW1wimDqxuTQJm0BSdZNdnKjOQCrfQ5a29LODaRH5oT/Bb6LZLviadQqUwuLKLxAHZp+VYZm
	Cge3X7XabJrrEcH07X/NMPEsaSOAxLz7HGfGtLKTk8WoQyFiXy4JL7JJ3KoMrsBjDTA==
X-Google-Smtp-Source: AGHT+IGCpPmCGC7IHEh0MIOg0AX5sgy1qpm3zmVV6d+GogUn6nD6VtfuVEh/CSiuiB3OjgZ0F+tEng==
X-Received: by 2002:a17:907:728e:b0:ac7:3441:79aa with SMTP id a640c23a62f3a-ace3f4c1d0dmr289156466b.13.1745424672252;
        Wed, 23 Apr 2025 09:11:12 -0700 (PDT)
Message-ID: <281505d5-7459-4903-887e-dc78a4c1fce4@suse.com>
Date: Wed, 23 Apr 2025 18:11:10 +0200
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
 <080351cb-6c3d-4540-953d-6205f1ff0745@suse.com>
 <7899fcd9-3492-49d3-8097-a3ddefaaeef0@zytor.com>
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
In-Reply-To: <7899fcd9-3492-49d3-8097-a3ddefaaeef0@zytor.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FE970QYjLz2b50Iy5t5x4Ioe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FE970QYjLz2b50Iy5t5x4Ioe
Content-Type: multipart/mixed; boundary="------------mQHAHZCn0fpZPeY8nLddn93h";
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
Message-ID: <281505d5-7459-4903-887e-dc78a4c1fce4@suse.com>
Subject: Re: [RFC PATCH v2 22/34] x86/msr: Utilize the alternatives mechanism
 to read MSR
References: <20250422082216.1954310-1-xin@zytor.com>
 <20250422082216.1954310-23-xin@zytor.com>
 <080351cb-6c3d-4540-953d-6205f1ff0745@suse.com>
 <7899fcd9-3492-49d3-8097-a3ddefaaeef0@zytor.com>
In-Reply-To: <7899fcd9-3492-49d3-8097-a3ddefaaeef0@zytor.com>

--------------mQHAHZCn0fpZPeY8nLddn93h
Content-Type: multipart/mixed; boundary="------------hwRd1olu00ORJ06CZhGAHDwc"

--------------hwRd1olu00ORJ06CZhGAHDwc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDQuMjUgMTE6MDMsIFhpbiBMaSB3cm90ZToNCj4gT24gNC8yMi8yMDI1IDQ6MTIg
QU0sIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4gKw0KPj4+ICtzdGF0aWMgX19hbHdheXNf
aW5saW5lIGJvb2wgX19yZG1zcnEodTMyIG1zciwgdTY0ICp2YWwsIGludCB0eXBlKQ0KPj4+
ICt7DQo+Pj4gK8KgwqDCoCBib29sIHJldDsNCj4+PiArDQo+Pj4gKyNpZmRlZiBDT05GSUdf
WEVOX1BWDQo+Pj4gK8KgwqDCoCBpZiAoY3B1X2ZlYXR1cmVfZW5hYmxlZChYODZfRkVBVFVS
RV9YRU5QVikpDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBfX3hlbnB2X3JkbXNycSht
c3IsIHZhbCwgdHlwZSk7DQo+Pg0KPj4gSSBkb24ndCB0aGluayB0aGlzIHdpbGwgd29yayBm
b3IgdGhlIFhlbiBQViBjYXNlLg0KPiANCj4gV2VsbCwgSSBoYXZlIGJlZW4gdGVzdGluZyB0
aGUgY29kZSBvbiB4ZW4tNC4xNyBjb21pbmcgd2l0aCBVYnVudHUNCj4gMjQuMDQuMiBMVFMg
OikNCg0KSG1tLCBzZWVtcyB0aGF0IHRoZSBhY2Nlc3NlZCBNU1IocykgYXJlIHRoZSBvbmVz
IGZhbGxpbmcgYmFjayB0byB0aGUNCm5hdGl2ZV9yZG1zcigpIGNhbGxzLiBBdCBsZWFzdCBv
biB0aGUgaGFyZHdhcmUgeW91IHRlc3RlZCBvbi4NCg0KPj4gWDg2X0ZFQVRVUkVfWEVOUFYg
aXMgc2V0IG9ubHkgYWZ0ZXIgdGhlIGZpcnN0IE1TUiBpcyBiZWluZyByZWFkLg0KPiANCj4g
Tm8gbWF0dGVyIHdoZXRoZXIgdGhlIGNvZGUgd29ya3Mgb3Igbm90LCBnb29kIGNhdGNoIQ0K
PiANCj4+DQo+PiBUaGlzIGNhbiBiZSBmaXhlZCBieSBzZXR0aW5nIHRoZSBmZWF0dXJlIGVh
cmxpZXIsIGJ1dCBpdCBzaG93cyB0aGF0IHRoZQ0KPj4gcGFyYXZpcnQgZmVhdHVyZSBoYXMg
aXRzIGJlbmVmaXRzIGluIHN1Y2ggY2FzZXMuDQo+IA0KPiBTZWUgbXkgb3RoZXIgcmVwbHkg
dG8gbGV0IFhlbiBoYW5kbGUgYWxsIHRoZSBkZXRhaWxzLg0KPiANCj4gUGx1cyB0aGUgY29k
ZSBhY3R1YWxseSB3b3JrcywgSSB3b3VsZCBhY3R1YWxseSBhcmd1ZSB0aGUgb3Bwb3NpdGUg
Oi1QDQoNCkJUVywgaXQgd2FzIGluIGtlcm5lbCA2LjEyIEkgaGFkIHRvIGNoYW5nZSB0aGUg
TVNSIHJlYWQgZW11bGF0aW9uIGZvcg0KWGVuLVBWIHRoZSBsYXN0IHRpbWUgKGZpeCBzb21l
IHByb2JsZW1zIHdpdGggY2hhbmdlZCB4ODYgdG9wb2xvZ3kNCmRldGVjdGlvbikuIFRoaW5n
cyBsaWtlIHRoYXQgd29uJ3QgYmUgZWFzaWx5IHB1dCBpbnRvIHRoZSBoeXBlcnZpc29yLA0K
d2hpY2ggbmVlZHMgdG8gc2VydmUgb3RoZXIgT1MtZXMsIHRvby4NCg0KDQpKdWVyZ2VuDQo=

--------------hwRd1olu00ORJ06CZhGAHDwc
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

--------------hwRd1olu00ORJ06CZhGAHDwc--

--------------mQHAHZCn0fpZPeY8nLddn93h--

--------------FE970QYjLz2b50Iy5t5x4Ioe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgJER4FAwAAAAAACgkQsN6d1ii/Ey9B
OAgAgUnmx2ytj5fx0ZWLVVSeVgbrAkAAJwflobLTfsKbhnmAKSXlnLeLRLVkxNnEl2JtohZ6+oZD
YIxawfxiIGTbwbemJOWdlKj6zJJE2cKl39wCE83gJZM/VGYiBo+Q0dTWWOWGfUJD04EkOMAAiJ96
iI2xfjOnxm1YBb5TqBqC/CvC2mbHOg543h8N5NoVx39tEeSepbZH6UirBZ3B50y3/Zgp50DK2R3O
6YLl6jBayBEHkZkqK59qYmjBrj6OriVMZpo5QCK+NLuv2mdv3O7hI1nKbmUmS94/7UcuHFtan862
npbfPTBwkAXV5WDYJ7uyIdkMVl3F9PhN2zVI4a4VUQ==
=Dl6w
-----END PGP SIGNATURE-----

--------------FE970QYjLz2b50Iy5t5x4Ioe--

