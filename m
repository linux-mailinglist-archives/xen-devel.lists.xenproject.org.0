Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D238A4C37B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 15:37:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900403.1308328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6uU-0004B8-Ni; Mon, 03 Mar 2025 14:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900403.1308328; Mon, 03 Mar 2025 14:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp6uU-000483-KI; Mon, 03 Mar 2025 14:36:46 +0000
Received: by outflank-mailman (input) for mailman id 900403;
 Mon, 03 Mar 2025 14:36:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DNf3=VW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tp6uT-00046W-7r
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 14:36:45 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecd983d9-f83c-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 15:36:42 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39104c1cbbdso652401f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 06:36:42 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4844abbsm14539737f8f.70.2025.03.03.06.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 06:36:41 -0800 (PST)
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
X-Inumbo-ID: ecd983d9-f83c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741012602; x=1741617402; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R2KPH7xolSgRpERAbrimyPF/uYhIF+d26nYUpS/9Nl4=;
        b=KYhz6FNl8Qiocg9bsD8p9q0lATcAt8z1rdaTDUapDgXMucaFH7fD+5hCrJkjE4IuA6
         752oSJAUjvYNARTEhz/qDiZsEdKqVoyPE8CnTg2G9L1oryOPsX/6Qvg9Zucc4S2COEnu
         ATaLFZIOuWN4fd2DoBxtjAQ68ejGV6Rrusazk54U6Aye9pE1MpvPYgV9chOFsdrShz++
         q5sHUf2c9sNMQD3B57V5rP0DpXxFE1wI8ZyxXdYufm6HJ9fhjUa9rJo35isNJTtdf50O
         vuj7ybnWtiqTKyamQRanQDuUfTt91ysNNaSGZC7iJg6v0VMsO66gD+yRoVfkYTaOVNNR
         fQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741012602; x=1741617402;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R2KPH7xolSgRpERAbrimyPF/uYhIF+d26nYUpS/9Nl4=;
        b=kC12uOmbhvIr6/QAlcgpm4GHQq91AvxAqE0UGQvg4BQJ4sdOaEVEdthiNWjbAip7Z5
         Hq6zBARyq1jOJSxGAzAG0XxQ/WIDNpKc9jUc1c9PvjCDw8ux6vkMMz//B4YyTtzJ+/Mj
         JaBdTPrwiI9VIoAFcm5BgVmYrFKIV3YNeQ4rlkofNB6BEWGk2fsoUdalnsSlM4v7xYb2
         ZjyRwhTgdaHUsfYYaGpGt5PH7JmL/ckhCH0ubeLjT/l2EsvJMpYpckd4f+lvWiVfhiKO
         3Oip/cLd/Df8H+W8mPX6ab9qmBts9MJFW5OZVaxaV9cznVfTNX2gLxENr88UD4IFdajY
         a/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8LGb7YcvxtW+VBeuCEV7NsQ7CjmoEalJmEJzv2gYtU1QStjuP3RXWWNxaqpKTyv1XrS6R/567KaM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3EfO6tqk2a3BePxbmjHj0S1x4TqZ6eq0L0QQSAq7ZSZEpk1V5
	5VVidzkIZ80FXhzhix7zFGNxHcSWqURncma4GYlt0n1AUQHdnZ42Zx+ZQViWzBw=
X-Gm-Gg: ASbGncsECRxZ0azLsIe7BfzdPPtjuYNMRV2XVMRAdq4HAmP1+3CG+tu5/D+QFr3MP/+
	RyuTfBm0aC/PykOgKF5+Eaq+PB3ac7R6RdFymCnBlaf/CI6RdyEP6b/Dx6CbVpLjBNHxZFe3Moc
	rshTUAYbmzMj6+ldkyNE2cnpEUtsi5A0CZ9m6keKEyUNkkAeWCyUOz7GMnQPGQBJHlDnSdv1H+R
	BLgtR/qGFXSMjK7JdMcW5NInibxPS9Py+QypacgJVuZ8YtkQubcMGtGedzYIGCCZPi1aOjbAHwE
	PnavOSuw4cyMbqKIur2pVBF4khkkdhnhyj2VqQsJE/86Wavs1KJlobbKHnsPRK4axITtHaKHyiP
	dgubeSrFYcurdLZGUt4IL6AO9TAG9yzOWDJnQyah6kUijSEmWlcKJS7cLc977Q6iu/SA=
X-Google-Smtp-Source: AGHT+IHZG5boLzUXRaTet0jfOprLTQ+TmhwTynTWXlvVPZA4H0j5TEeDpiAF4xDj5sFXrKtG7EyUTQ==
X-Received: by 2002:a05:6000:23c7:b0:38f:218c:f672 with SMTP id ffacd0b85a97d-390eca41904mr7634141f8f.41.1741012602186;
        Mon, 03 Mar 2025 06:36:42 -0800 (PST)
Message-ID: <d0de16ad-33d5-4878-8e7f-8e8cd1d44585@suse.com>
Date: Mon, 3 Mar 2025 15:36:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Fix lazy mmu mode
To: Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-mm@kvack.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20250303141542.3371656-1-ryan.roberts@arm.com>
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
In-Reply-To: <20250303141542.3371656-1-ryan.roberts@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------j1JkPn85K8wsyuAVtwcVFZfT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------j1JkPn85K8wsyuAVtwcVFZfT
Content-Type: multipart/mixed; boundary="------------MxUlsgon821Y6J0ncZkjxNaY";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-mm@kvack.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <d0de16ad-33d5-4878-8e7f-8e8cd1d44585@suse.com>
Subject: Re: [PATCH v2 0/5] Fix lazy mmu mode
References: <20250303141542.3371656-1-ryan.roberts@arm.com>
In-Reply-To: <20250303141542.3371656-1-ryan.roberts@arm.com>

--------------MxUlsgon821Y6J0ncZkjxNaY
Content-Type: multipart/mixed; boundary="------------Dy08AUytJDFuCzLfWwyhli8T"

--------------Dy08AUytJDFuCzLfWwyhli8T
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDMuMjUgMTU6MTUsIFJ5YW4gUm9iZXJ0cyB3cm90ZToNCj4gSGkgQWxsLA0KPiAN
Cj4gSSdtIHBsYW5uaW5nIHRvIGltcGxlbWVudCBsYXp5IG1tdSBtb2RlIGZvciBhcm02NCB0
byBvcHRpbWl6ZSB2bWFsbG9jLiBBcyBwYXJ0DQo+IG9mIHRoYXQsIEkgd2lsbCBleHRlbmQg
bGF6eSBtbXUgbW9kZSB0byBjb3ZlciBrZXJuZWwgbWFwcGluZ3MgaW4gdm1hbGxvYyB0YWJs
ZQ0KPiB3YWxrZXJzLiBXaGlsZSBsYXp5IG1tdSBtb2RlIGlzIGFscmVhZHkgdXNlZCBmb3Ig
a2VybmVsIG1hcHBpbmdzIGluIGEgZmV3DQo+IHBsYWNlcywgdGhpcyB3aWxsIGV4dGVuZCBp
dCdzIHVzZSBzaWduaWZpY2FudGx5Lg0KPiANCj4gSGF2aW5nIHJldmlld2VkIHRoZSBleGlz
dGluZyBsYXp5IG1tdSBpbXBsZW1lbnRhdGlvbnMgaW4gcG93ZXJwYywgc3BhcmMgYW5kIHg4
NiwNCj4gaXQgbG9va3MgbGlrZSB0aGVyZSBhcmUgYSBidW5jaCBvZiBidWdzLCBzb21lIG9m
IHdoaWNoIG1heSBiZSBtb3JlIGxpa2VseSB0bw0KPiB0cmlnZ2VyIG9uY2UgSSBleHRlbmQg
dGhlIHVzZSBvZiBsYXp5IG1tdS4gU28gdGhpcyBzZXJpZXMgYXR0ZW1wdHMgdG8gY2xhcmlm
eQ0KPiB0aGUgcmVxdWlyZW1lbnRzIGFuZCBmaXggYWxsIHRoZSBidWdzIGluIGFkdmFuY2Ug
b2YgdGhhdCBzZXJpZXMuIFNlZSBwYXRjaCAjMQ0KPiBjb21taXQgbG9nIGZvciBhbGwgdGhl
IGRldGFpbHMuDQo+IA0KPiBOb3RlIHRoYXQgSSBoYXZlIG9ubHkgYmVlbiBhYmxlIHRvIGNv
bXBpbGUgdGVzdCB0aGVzZSBjaGFuZ2VzIGJ1dCBJIHRoaW5rIHRoZXkNCj4gYXJlIGluIGdv
b2QgZW5vdWdoIHNoYXBlIGZvciBzb21lIGxpbnV4LW5leHQgdGVzdGluZy4NCj4gDQo+IEFw
cGxpZXMgb24gRnJpZGF5J3MgbW0tdW5zdGFibGUgKDVmMDg5YTlhYTk4NyksIGFzIEkgYXNz
dW1lIHRoaXMgd291bGQgYmUNCj4gcHJlZmVycmVkIHZpYSB0aGF0IHRyZWUuDQo+IA0KPiBD
aGFuZ2VzIHNpbmNlIHYxDQo+ID09PT09PT09PT09PT09PT0NCj4gICAgLSBzcGxpdCB2MSBw
YXRjaCAjMSBpbnRvIHYyIHBhdGNoICMxIGFuZCAjMjsgcGVyIERhdmlkDQo+ICAgIC0gQWRk
ZWQgQWNrZWQtYnkgdGFncyBmcm9tIERhdmlkIGFuZCBBbmRyZWFzOyBUaGFua3MhDQo+ICAg
IC0gUmVmaW5lZCB0aGUgcGF0Y2hlcyB3aGljaCBhcmUgdHJ1ZWx5IGZpeGVzIGFuZCBhZGRl
ZCB0byBzdGFibGUgdG8gY2MNCj4gDQo+IFRoYW5rcywNCj4gUnlhbg0KPiANCj4gUnlhbiBS
b2JlcnRzICg1KToNCj4gICAgbW06IEZpeCBsYXp5IG1tdSBkb2NzIGFuZCB1c2FnZQ0KPiAg
ICBmcy9wcm9jL3Rhc2tfbW11OiBSZWR1Y2Ugc2NvcGUgb2YgbGF6eSBtbXUgcmVnaW9uDQo+
ICAgIHNwYXJjL21tOiBEaXNhYmxlIHByZWVtcHRpb24gaW4gbGF6eSBtbXUgbW9kZQ0KPiAg
ICBzcGFyYy9tbTogQXZvaWQgY2FsbGluZyBhcmNoX2VudGVyL2xlYXZlX2xhenlfbW11KCkg
aW4gc2V0X3B0ZXMNCj4gICAgUmV2ZXJ0ICJ4ODYveGVuOiBhbGxvdyBuZXN0aW5nIG9mIHNh
bWUgbGF6eSBtb2RlIg0KPiANCj4gICBhcmNoL3NwYXJjL2luY2x1ZGUvYXNtL3BndGFibGVf
NjQuaCAgIHwgIDIgLS0NCj4gICBhcmNoL3NwYXJjL21tL3RsYi5jICAgICAgICAgICAgICAg
ICAgIHwgIDUgKysrKy0NCj4gICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vaHlwZXJ2aXNv
ci5oIHwgMTUgKystLS0tLS0tLS0tLS0tDQo+ICAgYXJjaC94ODYveGVuL2VubGlnaHRlbl9w
di5jICAgICAgICAgICB8ICAxIC0NCj4gICBmcy9wcm9jL3Rhc2tfbW11LmMgICAgICAgICAg
ICAgICAgICAgIHwgMTEgKysrKy0tLS0tLS0NCj4gICBpbmNsdWRlL2xpbnV4L3BndGFibGUu
aCAgICAgICAgICAgICAgIHwgMTQgKysrKysrKystLS0tLS0NCj4gICA2IGZpbGVzIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQ0KDQpGb3IgdGhlIHNlcmll
czoNCg0KQWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpK
dWVyZ2VuDQo=
--------------Dy08AUytJDFuCzLfWwyhli8T
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Dy08AUytJDFuCzLfWwyhli8T--

--------------MxUlsgon821Y6J0ncZkjxNaY--

--------------j1JkPn85K8wsyuAVtwcVFZfT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfFvngFAwAAAAAACgkQsN6d1ii/Ey9N
HQf8CVGYvY31u+jZWErxqTSyDA7QQHaTw7tURzlm5l8yYeEnRGQwVGiLei6T5Ntjuj7NBN343O9f
09ZUt85SNGt0VcBYWrF2C3sTml+jsOUTF2kxZwRfVLyUQ8vpnPIcyC9XEicHLZTph7aCJ7rur1is
cJ4bCWKtarW+365ICzD5fLVso4JENnqDneUbtMJ2cibbsYPCSnq8VzLZjWLhPAxkybsCaBPc8e6A
jwWftIwIiqbJOuPprrf8QQ568TWkkm0cRoZqOorrwBbYbeOxDUXMVFH0xS8sMkWAXVYEMB0gOhoz
kGXdGm/0HeROKlLNMNPDmJCQ+cPKAHGHuqxdtCQM2A==
=6C3p
-----END PGP SIGNATURE-----

--------------j1JkPn85K8wsyuAVtwcVFZfT--

