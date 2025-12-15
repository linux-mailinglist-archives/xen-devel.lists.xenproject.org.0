Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A63DCBCA6E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 07:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186640.1508076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV2Cj-0006zR-JX; Mon, 15 Dec 2025 06:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186640.1508076; Mon, 15 Dec 2025 06:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV2Cj-0006xe-GA; Mon, 15 Dec 2025 06:37:09 +0000
Received: by outflank-mailman (input) for mailman id 1186640;
 Mon, 15 Dec 2025 06:37:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJJs=6V=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vV2Ch-0006xY-Ke
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 06:37:07 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 759d0d20-d980-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 07:37:00 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6495c4577adso4411847a12.3
 for <xen-devel@lists.xenproject.org>; Sun, 14 Dec 2025 22:37:00 -0800 (PST)
Received: from ?IPV6:2003:e5:8704:4800:66fd:131f:60bd:bc29?
 (p200300e58704480066fd131f60bdbc29.dip0.t-ipconnect.de.
 [2003:e5:8704:4800:66fd:131f:60bd:bc29])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa29beabsm1330300666b.4.2025.12.14.22.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Dec 2025 22:36:59 -0800 (PST)
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
X-Inumbo-ID: 759d0d20-d980-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765780619; x=1766385419; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Flsp6Ih3FlMEVzRadHwRQZrT6qbOt0qkn7I0oYf7Qcc=;
        b=f0SGEv7w27Z7+L9BmYnfLjLbpsAaIbN6oQ36lAtktOGa/Tu9o7GAC8VQwlmOVbVFQs
         aNZni0xQ8nN/6mAnD/zCshlbix9SALtV4wdSw0Gtlp3+vOzLxwpRUZCsU/YhZbDEzvqJ
         ZT9rPSWO7Ec1rnQAS+nf3Guvy2J5q+eV4rFBuJ1NWM8i3VjHIJXRnk3tJg+uY5hlBXtB
         vOetMYX+u4mzZ8kDdqGFvfbqgRudF+Qbt8iPLK1FrBvQ3U3gbypj9BoesjuW1kMrbK56
         68zq23XbTm35X/AHTSH7dvEmPk5T8Xa3qeh9SbG7kDaLfthnLgv22I0VSKI1ASuUtoTs
         UE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765780620; x=1766385420;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Flsp6Ih3FlMEVzRadHwRQZrT6qbOt0qkn7I0oYf7Qcc=;
        b=boBaKJ0FzwjIgWHfnifZ0wEUXxsVLeM6kFu4/ZCD3Yt2ZLR5t413OC9oc30vBmEVcN
         jNfTnjV4WnVAYXP6PU39bwl1diCFALAgLUD7TGiCgYsdJTgkfdyNE6bUkL13giGHFKiE
         uCd5RaRsr/S+br7Izm6NS8jHekmGQpfyCxLloAGdmVMnV/OVJU3AMLNIA/c1TLSRnIOO
         0kgjdmJcl0FR51OKcdsOwudYyiY755VorbmGaUWsRQ6x0FbZg0Rh6BM55BRDjupO5Vak
         IXm0SIqLVNcEve9TDY+iLbgTc62D7kkVKd4pa1L7VB45Ry+sWmTAXWef6Pn2KDgSVr29
         FbdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7vf0G+1r+v3wqISHCyM+ZagZT2XFuQ2xcXwUlyNZS5Itv+Wf0cxy82czuyjQXeGZ77/QhGAI8SSc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzApMqsHDCj0udLCahU0yDsv1xG8en/cxG1zZVvTPs4jxn+K92N
	CMUshgBzf3zK0ynV88l3wYgQlaf0yC5y5PABKskGqFjkTXnr9lKR5CFSc7vTXN66WWc=
X-Gm-Gg: AY/fxX4LaqIJpuJqzAenQyaNTr1dH5U8SBJvRpyJJHhjRE6WsFuwuIC/035am4QB3qp
	3V0hlrT04hwbSFUpwvdVrl/jbjlRb3p/vw6Y32ocZcgkExWcElEtP6oX4+iVftONtWFWdXe+cmw
	fLbiZSpDj+ktObFy5bRFeAZm1mcxui9lQoHDw51/rQkfUHdK2I4oD+jaR9kr6qiYlLffPaXQUj+
	ZlcaNvx1ZgJDLLGUDqP2Tq37EJwUxqA9Fa7SuRINVqVwkez9lqRHB3UdqCidS5tfY3YiOnO5e2v
	edptH+MSxnswBIYQ4Bo35bRf1VyXzeXz6jAcopmasOvkRRjtrGWdyAygRiLO2opnKjfSA1wrz3H
	OHiEpnxniKAZzVd++0UmsixDe7WNeJvS3d72T4J/NjryHlYkBaJKl4tB7ImJFgKy+NqJ8823Dl/
	cpgM+L8mtyMSFugJVOg+6MbBOHDStrY865CiR8S+JJG4BLJjalcEeMfRq66XuWEdedndASQoMUN
	csVdNnJVWXpDkQdE6FDoP9e8heHxSwVvvDqdhM=
X-Google-Smtp-Source: AGHT+IGo/GqgVXtCzeCvo1UWjbyI/0K/pid4ihpAfElEjp1P5X9LqCIs4JAGA1cU0Oaa8OlI6Xu5Vg==
X-Received: by 2002:a17:907:9617:b0:b73:8f33:eed3 with SMTP id a640c23a62f3a-b7d23a9c866mr953872766b.26.1765780619499;
        Sun, 14 Dec 2025 22:36:59 -0800 (PST)
Message-ID: <bff8626d-161e-4470-9cbd-7bbda6852ec3@suse.com>
Date: Mon, 15 Dec 2025 07:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] x86: Cleanups around slow_down_io()
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-block@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Denis Efremov <efremov@linux.com>,
 Jens Axboe <axboe@kernel.dk>
References: <20251126162018.5676-1-jgross@suse.com>
 <aT5vtaefuHwLVsqy@gmail.com>
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
In-Reply-To: <aT5vtaefuHwLVsqy@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3mgjNgxNLw3aXEpCS8syparo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3mgjNgxNLw3aXEpCS8syparo
Content-Type: multipart/mixed; boundary="------------uocwPUAwg06DHItKBfr8MkI0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-block@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Denis Efremov <efremov@linux.com>,
 Jens Axboe <axboe@kernel.dk>
Message-ID: <bff8626d-161e-4470-9cbd-7bbda6852ec3@suse.com>
Subject: Re: [PATCH 0/5] x86: Cleanups around slow_down_io()
References: <20251126162018.5676-1-jgross@suse.com>
 <aT5vtaefuHwLVsqy@gmail.com>
In-Reply-To: <aT5vtaefuHwLVsqy@gmail.com>

--------------uocwPUAwg06DHItKBfr8MkI0
Content-Type: multipart/mixed; boundary="------------0K40Sw4HjMWfuWdkxRcyXR0R"

--------------0K40Sw4HjMWfuWdkxRcyXR0R
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMTIuMjUgMDk6MDUsIEluZ28gTW9sbmFyIHdyb3RlOg0KPiANCj4gKiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4+IFdoaWxlIGxvb2tpbmcg
YXQgcGFyYXZpcnQgY2xlYW51cHMgSSBzdHVtYmxlZCBvdmVyIHNsb3dfZG93bl9pbygpIGFu
ZA0KPj4gdGhlIHJlbGF0ZWQgUkVBTExZX1NMT1dfSU8gZGVmaW5lLg0KPj4NCj4+IEVzcGVj
aWFsbHkgUkVBTExZX1NMT1dfSU8gaXMgYSBtZXNzLCB3aGljaCBpcyBwcm92ZW4gYnkgMiBj
b21wbGV0ZWx5DQo+PiB3cm9uZyB1c2UgY2FzZXMuDQo+Pg0KPj4gRG8gc2V2ZXJhbCBjbGVh
bnVwcywgcmVzdWx0aW5nIGluIGEgZGVsZXRpb24gb2YgUkVBTExZX1NMT1dfSU8gYW5kIHRo
ZQ0KPj4gaW9fZGVsYXkoKSBwYXJhdmlydCBmdW5jdGlvbiBob29rLg0KPj4NCj4+IFBhdGNo
ZXMgMiBhbmQgMyBhcmUgbm90IGNoYW5naW5nIGFueSBmdW5jdGlvbmFsaXR5LCBidXQgbWF5
YmUgdGhleQ0KPj4gc2hvdWxkPyBBcyB0aGUgcG90ZW50aWFsIGJ1ZyBoYXMgYmVlbiBwcmVz
ZW50IGZvciBtb3JlIHRoYW4gYSBkZWNhZGUNCj4+IG5vdywgSSB3ZW50IHdpdGgganVzdCBk
ZWxldGluZyB0aGUgdXNlbGVzcyAiI2RlZmluZSBSRUFMTFlfU0xPV19JTyIuDQo+PiBUaGUg
YWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gZG8gc29tZXRoaW5nIHNpbWlsYXIgYXMgaW4gcGF0
Y2ggNS4NCj4+DQo+PiBKdWVyZ2VuIEdyb3NzICg1KToNCj4+ICAgIHg4Ni9wYXJhdmlydDog
UmVwbGFjZSBpb19kZWxheSgpIGhvb2sgd2l0aCBhIGJvb2wNCj4+ICAgIGh3bW9uL2xtNzg6
IERyb3AgUkVBTExZX1NMT1dfSU8gc2V0dGluZw0KPj4gICAgaHdtb24vdzgzNzgxZDogRHJv
cCBSRUFMTFlfU0xPV19JTyBzZXR0aW5nDQo+PiAgICBibG9jay9mbG9wcHk6IERvbid0IHVz
ZSBSRUFMTFlfU0xPV19JTyBmb3IgZGVsYXlzDQo+PiAgICB4ODYvaW86IFJlbW92ZSBSRUFM
TFlfU0xPV19JTyBoYW5kbGluZw0KPj4NCj4+ICAgYXJjaC94ODYvaW5jbHVkZS9hc20vZmxv
cHB5LmggICAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPj4gICBh
cmNoL3g4Ni9pbmNsdWRlL2FzbS9pby5oICAgICAgICAgICAgIHwgMTIgKysrKystLS0tLS0t
DQo+PiAgIGFyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmggICAgICAgfCAxMSArLS0t
LS0tLS0tLQ0KPj4gICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydF90eXBlcy5oIHwg
IDMgKy0tDQo+PiAgIGFyY2gveDg2L2tlcm5lbC9jcHUvdm13YXJlLmMgICAgICAgICAgfCAg
MiArLQ0KPj4gICBhcmNoL3g4Ni9rZXJuZWwva3ZtLmMgICAgICAgICAgICAgICAgIHwgIDgg
Ky0tLS0tLS0NCj4+ICAgYXJjaC94ODYva2VybmVsL3BhcmF2aXJ0LmMgICAgICAgICAgICB8
ICAzICstLQ0KPj4gICBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgICAgICAgICAgIHwg
IDYgKy0tLS0tDQo+PiAgIGRyaXZlcnMvYmxvY2svZmxvcHB5LmMgICAgICAgICAgICAgICAg
fCAgMiAtLQ0KPj4gICBkcml2ZXJzL2h3bW9uL2xtNzguYyAgICAgICAgICAgICAgICAgIHwg
IDUgKysrLS0NCj4+ICAgZHJpdmVycy9od21vbi93ODM3ODFkLmMgICAgICAgICAgICAgICB8
ICA1ICsrKy0tDQo+PiAgIDExIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDQ1
IGRlbGV0aW9ucygtKQ0KPiANCj4gSSB0aGluayB3ZSBzaG91bGQgZ2V0IHJpZCBvZiAqYWxs
KiBpb19kZWxheSBoYWNrcywgdGhleSBtaWdodCBoYXZlIGJlZW4NCj4gcmVsZXZhbnQgaW4g
dGhlIGRheXMgb2YgaTM4NiBzeXN0ZW1zLCBidXQgd2UgZG9uJ3QgZXZlbiBzdXBwb3J0IGkz
ODYNCj4gQ1BVcyBhbnltb3JlLiBTaG91bGQgaXQgY2F1c2UgYW55IHJlZ3Jlc3Npb25zLCBp
dCdzIGVhc3kgdG8gYmlzZWN0IHRvLg0KPiBUaGVyZSdzIGJlZW4gZW5vdWdoIGNoYW5nZXMg
YXJvdW5kIGFsbCB0aGVzZSBmYWNpbGl0aWVzIHRoYXQgdGhlDQo+IG9yaWdpbmFsIHRpbWlu
Z3MgYXJlIHByb2JhYmx5IHdheSBvZmYgYWxyZWFkeSwgc28gd2UndmUganVzdCBiZWVuDQo+
IGNhcmdvLWN1bHQgcG9ydGluZyB0aGVzZSB0byBuZXdlciBrZXJuZWxzIGVzc2VudGlhbGx5
Lg0KDQpGaW5lIHdpdGggbWUuDQoNCldoaWNoIHBhdGggdG8gcmVtb3ZhbCBvZiBpb19kZWxh
eSB3b3VsZCB5b3UgKGFuZCBvdGhlcnMpIHByZWZlcj8NCg0KMS4gUmlwcGluZyBpdCBvdXQg
aW1tZWRpYXRlbHkuDQoNCjIuIEhpZGluZyBpdCBiZWhpbmQgYSBkZWZhdWx0LW9mZiBjb25m
aWcgb3B0aW9uIGZvciBhIGZldyBrZXJuZWwgdmVyc2lvbnMNCiAgICBiZWZvcmUgcmVtb3Zp
bmcgaXQuDQoNCjMuIFVzaW5nIENPTkZJR19JT19ERUxBWV9OT05FIGFzIHRoZSBkZWZhdWx0
IGlvX2RlbGF5X3R5cGUgYmVmb3JlIHJpcHBpbmcgaXQNCiAgICBvdXQuDQoNCjQuIFVzaW5n
IENPTkZJR19JT19ERUxBWV9OT05FIGFzIHRoZSBkZWZhdWx0IGlvX2RlbGF5X3R5cGUgYmVm
b3JlIGhpZGluZyBpdA0KICAgIGJlaGluZCBhIGRlZmF1bHQtb2ZmIGNvbmZpZyBvcHRpb24s
IHRoZW4gcmlwIGl0IG91dCBsYXRlci4NCg0KSW4gY2FzZXMgMi00IEknZCBzdGlsbCBsaWtl
IHRvIGhhdmUgcGF0Y2ggMSBvZiBteSBzZXJpZXMgYXBwbGllZCwgYXMgaXQgd2lsbA0KbWFr
ZSBwYXJhdmlydCByZXdvcmsgZWFzaWVyLg0KDQoNCkp1ZXJnZW4NCg==
--------------0K40Sw4HjMWfuWdkxRcyXR0R
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0K40Sw4HjMWfuWdkxRcyXR0R--

--------------uocwPUAwg06DHItKBfr8MkI0--

--------------3mgjNgxNLw3aXEpCS8syparo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmk/rIkFAwAAAAAACgkQsN6d1ii/Ey+O
KAf/RhuC6z7N89eI1LFebQgpxz6ipUoaEJLE3iPD9BIa8MC4hAK9upc0Be1ulp8clrSuz3rdpIw7
3FUaPR9cZlvGMCV4Z+IHHjhwmCaWOcpppBqiVsNGhvT47rDwA2VkaikY3Ehl9quAQpn1CC1hhkJ1
01WuZBXoh2YzULEZSQtLiB/SNUhY/giSrXVDYqFcRdmTVicw/Obw/Xlvx6pXR3h7j5JxemXi9/Fj
iKUX4frjdzsmdQotNBCZcdFf37mdeUIi3KWRenk5jma77pmhc8v1kpf/IJcf8U5SvVaz2LnLN+pw
GgFVUcHrV+iMB8ern+6AKait3RZBMNm2dCjJdLk6bg==
=WEIE
-----END PGP SIGNATURE-----

--------------3mgjNgxNLw3aXEpCS8syparo--

