Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDC3A79116
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 16:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935845.1337215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzyzj-0001ED-Nr; Wed, 02 Apr 2025 14:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935845.1337215; Wed, 02 Apr 2025 14:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzyzj-0001CK-Kr; Wed, 02 Apr 2025 14:23:07 +0000
Received: by outflank-mailman (input) for mailman id 935845;
 Wed, 02 Apr 2025 14:23:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L/lH=WU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tzyzh-0001CE-Uz
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 14:23:06 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd905ae7-0fcd-11f0-9ea9-5ba50f476ded;
 Wed, 02 Apr 2025 16:23:04 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so5388555e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 07:23:04 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b663860sm17333761f8f.39.2025.04.02.07.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 07:23:03 -0700 (PDT)
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
X-Inumbo-ID: fd905ae7-0fcd-11f0-9ea9-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743603784; x=1744208584; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dW6W4xGMXyVIKCYqBbFC7vgU2Q+nMeROqdsrhUXv5kw=;
        b=Dddv5CeQa99gpRzps7wE+H5vqnAzhyNvhyo4XbYAKoJCEv3oije3gORgWDYEmoXY3m
         gnOkyascOFDSzoT06uLjhEplQTzTY0jcTXi8mBXfNNR/ydoqcKYYKDlkrfAHU//7nfou
         7hIF1vNrinFkHt9qBvB4y8pY/AShWLeUyCEtg7mWb0Gt+htvyRYp1aQsHgLwatLypHvx
         tWwCMWor3K3DrPeBZkeG3VWZb7vmJZwObRhY6yiMOAH9VL8+8Y66vEzvkivK1do4xn+b
         pqKtMKHLyG6TQ31w9/vVDtpS8W064C/N8/RVMEM1s5lLojzX6Mxjg0/o6YnNZYNN1Iak
         Rd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743603784; x=1744208584;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dW6W4xGMXyVIKCYqBbFC7vgU2Q+nMeROqdsrhUXv5kw=;
        b=RLb7cL5OH388ERhyTmvXbonnZEZrm5DZcPV/tOoxXqV8alqVYgOwnpdZX5P3W7GQJ2
         Gj22w/ZCjYHE1oWcmS73ym1m3pqUu851FGoQWyAR2pX5BbHjRGCLcJlsdKLBcLvJ1fVY
         ynfjFD9wuMesnpXTY0SYAIllLNSvxTlHyijB6b9r02kHB/xRMR9J7jSTSS2Bt+D1QBMR
         6tO2s7/ys9jPkKZA2ofVB1r+28hthjF3Ygo5ti8CELGUqI5TxHaMBmKAsVIdmJfDA6D0
         0eSWNkB8miP6EbDjQSoEdAqDtEoRG3CKobZK7bIEc/Uoc3JYs1oDppd/PajhafwN7M3Z
         vgrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsNOC0O2Ez/W+2CRKJ0ACl7AtCTYCtQ19Z6v5IgJFzuZz5Bk7EjFJPGhFzpH6kwtaGNnb3UbVCdF4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUK6LR1z3KBv5SWk+UgZPQj2r431ZyHHRzBs/oKEcDEjHPL2/g
	O2YbgP5J0r7EhOTVNrPUJsrfZ3Gcm/U+nYVXBt9rc8vqvEJ1i76IJzhGiHGyVZs=
X-Gm-Gg: ASbGncs5PzKNbK3cLI+Efsugvep+iGhbW2NgDo8ocl5zowIAF3BqS0Y6tUbSLv9cFPR
	YdTmaseX/AltaTdzE4olwQclm+9/ufHoJH4BJYXCbOkhIkykMXllwP7zeRv8yOsQ2WoErNnAnKW
	tcaoiDA952GSZ4qokitDVzti5TrqpklZDO9jfz3BVZ2+R2pH3xZ1M81GVckLwDpGvJ2SKlNwfuq
	jtNHEtPh3A2WaNG3eAWgA9Dx3JBElUV7XXjbro99VQDU7LH9zzMPYCsSGYK5WZRCtKXwjVlOtvY
	U747jDvhEF9zoJe6cFqLgy3vsZp4838u0cQDoYfbT+T0k5NVyIRjIoRCP/CwQ575lv/Ub4Fx/dD
	XkE3kNtsIBV5EsQ/VZO3LilqkDf4iHbfoi4p8CVLg7qg1rIX8yQtgkxHv8YdgtCL/4Nb84w==
X-Google-Smtp-Source: AGHT+IETRZED7ZsQcGAcMp9McU6wrB6K3PBTPKwBl2p+/70kIocYRQJYvHoGosm7XLXPjnWdSDvs6Q==
X-Received: by 2002:a05:600c:a015:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-43eb71e27bdmr25530615e9.16.1743603784169;
        Wed, 02 Apr 2025 07:23:04 -0700 (PDT)
Message-ID: <05974e77-ae3c-4e62-a2c2-c764ab4a6d48@suse.com>
Date: Wed, 2 Apr 2025 16:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: fix balloon target initialization for PVH dom0
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20250402113656.84673-1-roger.pau@citrix.com>
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
In-Reply-To: <20250402113656.84673-1-roger.pau@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JxCZvdLcOPVULmrk5v0xs8hy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JxCZvdLcOPVULmrk5v0xs8hy
Content-Type: multipart/mixed; boundary="------------4IlyO0e06YQKSOcYRDsspWPU";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <05974e77-ae3c-4e62-a2c2-c764ab4a6d48@suse.com>
Subject: Re: [PATCH] x86/xen: fix balloon target initialization for PVH dom0
References: <20250402113656.84673-1-roger.pau@citrix.com>
In-Reply-To: <20250402113656.84673-1-roger.pau@citrix.com>

--------------4IlyO0e06YQKSOcYRDsspWPU
Content-Type: multipart/mixed; boundary="------------8SKrxIyjysNDcLV0IxPx3de1"

--------------8SKrxIyjysNDcLV0IxPx3de1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDQuMjUgMTM6MzYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gUFZIIGRvbTAg
cmUtdXNlcyBsb2dpYyBmcm9tIFBWIGRvbTAsIGluIHdoaWNoIFJBTSByYW5nZXMgbm90IGFz
c2lnbmVkIHRvDQo+IGRvbTAgYXJlIHJlLXVzZWQgYXMgc2NyYXRjaCBtZW1vcnkgdG8gbWFw
IGZvcmVpZ24gYW5kIGdyYW50IHBhZ2VzLiAgU3VjaA0KPiBsb2dpYyByZWxpZXMgb24gcmVw
b3J0aW5nIHRob3NlIHVucG9wdWxhdGVkIHJhbmdlcyBhcyBSQU0gdG8gTGludXgsIGFuZA0K
PiBtYXJrIHRoZW0gYXMgcmVzZXJ2ZWQuICBUaGlzIHdheSBMaW51eCBjcmVhdGVzIHRoZSB1
bmRlcmx5aW5nIHBhZ2UNCj4gc3RydWN0dXJlcyByZXF1aXJlZCBmb3IgbWV0YWRhdGEgbWFu
YWdlbWVudC4NCj4gDQo+IFN1Y2ggYXBwcm9hY2ggd29ya3MgZmluZSBvbiBQViBiZWNhdXNl
IHRoZSBpbml0aWFsIGJhbGxvb24gdGFyZ2V0IGlzDQo+IGNhbGN1bGF0ZWQgdXNpbmcgc3Bl
Y2lmaWMgWGVuIGRhdGEsIHRoYXQgZG9lc24ndCB0YWtlIGludG8gYWNjb3VudCB0aGUNCj4g
bWVtb3J5IHR5cGUgY2hhbmdlcyBkZXNjcmliZWQgYWJvdmUuICBIb3dldmVyIG9uIEhWTSBh
bmQgUFZIIHRoZSBpbml0aWFsDQo+IGJhbGxvb24gdGFyZ2V0IGlzIGNhbGN1bGF0ZWQgdXNp
bmcgZ2V0X251bV9waHlzcGFnZXMoKSwgYW5kIHRoYXQgZnVuY3Rpb24NCj4gZG9lcyB0YWtl
IGludG8gYWNjb3VudCB0aGUgdW5wb3B1bGF0ZWQgUkFNIHJlZ2lvbnMgdXNlZCBhcyBzY3Jh
dGNoIHNwYWNlDQo+IGZvciByZW1vdGUgZG9tYWluIG1hcHBpbmdzLg0KPiANCj4gVGhpcyBs
ZWFkcyB0byBQVkggZG9tMCBoYXZpbmcgYW4gaW5jb3JyZWN0IGluaXRpYWwgYmFsbG9vbiB0
YXJnZXQsIHdoaWNoDQo+IGNhdXNlcyBtYWxmdW5jdGlvbiAoZXhjZXNzaXZlIG1lbW9yeSBm
cmVlaW5nKSBvZiB0aGUgYmFsbG9vbiBkcml2ZXIgaWYgdGhlDQo+IGRvbTAgbWVtb3J5IHRh
cmdldCBpcyBsYXRlciBhZGp1c3RlZCBmcm9tIHRoZSB0b29sc3RhY2suDQo+IA0KPiBGaXgg
dGhpcyBieSB1c2luZyB4ZW5fcmVsZWFzZWRfcGFnZXMgdG8gYWNjb3VudCBmb3IgYW55IHBh
Z2VzIHRoYXQgYXJlIHBhcnQNCj4gb2YgdGhlIG1lbW9yeSBtYXAsIGJ1dCBhcmUgYWxyZWFk
eSB1bnBvcHVsYXRlZCB3aGVuIHRoZSBiYWxsb29uIGRyaXZlciBpcw0KPiBpbml0aWFsaXpl
ZC4gIFRoaXMgYWNjb3VudHMgZm9yIGFueSByZWdpb25zIHVzZWQgZm9yIHNjcmF0Y2ggcmVt
b3RlDQo+IG1hcHBpbmdzLg0KPiANCj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gdW5pZnkg
UFYgd2l0aCBQVkgvSFZNIGd1ZXN0cyByZWdhcmRpbmcgdGhlIHVzYWdlIG9mDQo+IGdldF9u
dW1fcGh5c3BhZ2VzKCksIGFzIHRoYXQgYXZvaWRzIGhhdmluZyB0byBhZGQgZGlmZmVyZW50
IGxvZ2ljIGZvciBQViB2cw0KPiBQVkggaW4gYm90aCBiYWxsb29uX2FkZF9yZWdpb25zKCkg
YW5kIGFyY2hfeGVuX3VucG9wdWxhdGVkX2luaXQoKS4NCj4gDQo+IE11Y2ggbGlrZSBhNmFh
NGViOTk0ZWUsIHRoZSBjb2RlIGluIHRoaXMgY2hhbmdlc2V0IHNob3VsZCBoYXZlIGJlZW4g
cGFydCBvZg0KPiAzODYyMGZjNGU4OTMuDQo+IA0KPiBGaXhlczogYTZhYTRlYjk5NGVlICgn
eGVuL3g4NjogYWRkIGV4dHJhIHBhZ2VzIHRvIHVucG9wdWxhdGVkLWFsbG9jIGlmIGF2YWls
YWJsZScpDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KPiAtLS0NCj4gSSB0aGluayBpdCdzIGVhc2llciB0byB1bmlmeSB0aGUg
UFYgYW5kIFBWSC9IVk0gcGF0aHMgaGVyZSByZWdhcmRpbmcgdGhlDQo+IHVzYWdlIG9mIGdl
dF9udW1fcGh5c3BhZ2VzKCksIGFzIG90aGVyd2lzZSB0aGUgZml4IG5lZWRzIHRvIGFkZCBm
dXJ0aGVyIFBWDQo+IHZzIEhWTSBkaXZlcmdlbmNlcyBpbiBib3RoIGJhbGxvb25fYWRkX3Jl
Z2lvbnMoKSBhbmQNCj4gYXJjaF94ZW5fdW5wb3B1bGF0ZWRfaW5pdCgpLCBidXQgaXQgYWxz
byBoYXMgYSBoaWdoZXIgcmlzayBvZiBicmVha2luZyBQVg0KPiBpbiBzdWJ0bGUgd2F5cy4N
Cj4gLS0tDQo+ICAgYXJjaC94ODYveGVuL2VubGlnaHRlbi5jIHwgIDcgKysrKysrKw0KPiAg
IGRyaXZlcnMveGVuL2JhbGxvb24uYyAgICB8IDE5ICsrKysrKysrKysrLS0tLS0tLS0NCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbi5jIGIvYXJjaC94ODYv
eGVuL2VubGlnaHRlbi5jDQo+IGluZGV4IDQzZGNkOGM3YmFkYy4uNjUxYmIyMDY0MzRjIDEw
MDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuLmMNCj4gKysrIGIvYXJjaC94
ODYveGVuL2VubGlnaHRlbi5jDQo+IEBAIC00NjYsNiArNDY2LDEzIEBAIGludCBfX2luaXQg
YXJjaF94ZW5fdW5wb3B1bGF0ZWRfaW5pdChzdHJ1Y3QgcmVzb3VyY2UgKipyZXMpDQo+ICAg
CQkJeGVuX2ZyZWVfdW5wb3B1bGF0ZWRfcGFnZXMoMSwgJnBnKTsNCj4gICAJCX0NCj4gICAN
Cj4gKwkJLyoNCj4gKwkJICogQWNjb3VudCBmb3IgdGhlIHJlZ2lvbiBiZWluZyBpbiB0aGUg
cGh5c21hcCBidXQgdW5wb3B1bGF0ZWQuDQo+ICsJCSAqIFRoZSB2YWx1ZSBpbiB4ZW5fcmVs
ZWFzZWRfcGFnZXMgaXMgdXNlZCBieSB0aGUgYmFsbG9vbg0KPiArCQkgKiBkcml2ZXIgdG8g
a25vdyBob3cgbXVjaCBvZiB0aGUgcGh5c21hcCBpcyB1bnBvcHVsYXRlZCBhbmQNCj4gKwkJ
ICogc2V0IGFuIGFjY3VyYXRlIGluaXRpYWwgbWVtb3J5IHRhcmdldC4NCj4gKwkJICovDQo+
ICsJCXhlbl9yZWxlYXNlZF9wYWdlcyArPSB4ZW5fZXh0cmFfbWVtW2ldLm5fcGZuczsNCj4g
ICAJCS8qIFplcm8gc28gcmVnaW9uIGlzIG5vdCBhbHNvIGFkZGVkIHRvIHRoZSBiYWxsb29u
IGRyaXZlci4gKi8NCj4gICAJCXhlbl9leHRyYV9tZW1baV0ubl9wZm5zID0gMDsNCj4gICAJ
fQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vYmFsbG9vbi5jIGIvZHJpdmVycy94ZW4v
YmFsbG9vbi5jDQo+IGluZGV4IDE2M2Y3ZjFkNzBmMS4uMDg1ZDQxOGVlNmRhIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3hlbi9iYWxsb29uLmMNCj4gKysrIGIvZHJpdmVycy94ZW4vYmFs
bG9vbi5jDQo+IEBAIC02OTgsNyArNjk4LDE1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBiYWxs
b29uX2FkZF9yZWdpb25zKHZvaWQpDQo+ICAgCQlmb3IgKHBmbiA9IHN0YXJ0X3BmbjsgcGZu
IDwgZXh0cmFfcGZuX2VuZDsgcGZuKyspDQo+ICAgCQkJYmFsbG9vbl9hcHBlbmQocGZuX3Rv
X3BhZ2UocGZuKSk7DQo+ICAgDQo+IC0JCWJhbGxvb25fc3RhdHMudG90YWxfcGFnZXMgKz0g
ZXh0cmFfcGZuX2VuZCAtIHN0YXJ0X3BmbjsNCj4gKwkJLyoNCj4gKwkJICogRXh0cmEgcmVn
aW9ucyBhcmUgYWNjb3VudGVkIGZvciBpbiB0aGUgcGh5c21hcCwgYnV0IG5lZWQNCj4gKwkJ
ICogZGVjcmVhc2luZyBmcm9tIGN1cnJlbnRfcGFnZXMgdG8gYmFsbG9vbiBkb3duIHRoZSBp
bml0aWFsDQo+ICsJCSAqIGFsbG9jYXRpb24sIGJlY2F1c2UgdGhleSBhcmUgYWxyZWFkeSBh
Y2NvdW50ZWQgZm9yIGluDQo+ICsJCSAqIHRvdGFsX3BhZ2VzLg0KPiArCQkgKi8NCj4gKwkJ
QlVHX09OKGV4dHJhX3Bmbl9lbmQgLSBzdGFydF9wZm4gPj0NCj4gKwkJICAgICAgIGJhbGxv
b25fc3RhdHMuY3VycmVudF9wYWdlcyk7DQoNCk1heWJlIGluc3RlYWQgb2YgY3Jhc2hpbmcg
dGhlIHN5c3RlbSBkaXNhYmxlIGJhbGxvb25pbmcgYW5kIHByaW50IHNvbWUNCmRpYWdub3N0
aWNzIHdoeSB0aGlzIGhhcHBlbmVkPw0KDQo+ICsJCWJhbGxvb25fc3RhdHMuY3VycmVudF9w
YWdlcyAtPSBleHRyYV9wZm5fZW5kIC0gc3RhcnRfcGZuOw0KPiAgIAl9DQo+ICAgfQ0KPiAg
IA0KPiBAQCAtNzExLDEzICs3MTksOCBAQCBzdGF0aWMgaW50IF9faW5pdCBiYWxsb29uX2lu
aXQodm9pZCkNCj4gICANCj4gICAJcHJfaW5mbygiSW5pdGlhbGlzaW5nIGJhbGxvb24gZHJp
dmVyXG4iKTsNCj4gICANCj4gLSNpZmRlZiBDT05GSUdfWEVOX1BWDQo+IC0JYmFsbG9vbl9z
dGF0cy5jdXJyZW50X3BhZ2VzID0geGVuX3B2X2RvbWFpbigpDQo+IC0JCT8gbWluKHhlbl9z
dGFydF9pbmZvLT5ucl9wYWdlcyAtIHhlbl9yZWxlYXNlZF9wYWdlcywgbWF4X3BmbikNCj4g
LQkJOiBnZXRfbnVtX3BoeXNwYWdlcygpOw0KPiAtI2Vsc2UNCj4gLQliYWxsb29uX3N0YXRz
LmN1cnJlbnRfcGFnZXMgPSBnZXRfbnVtX3BoeXNwYWdlcygpOw0KPiAtI2VuZGlmDQo+ICsJ
QlVHX09OKHhlbl9yZWxlYXNlZF9wYWdlcyA+PSBnZXRfbnVtX3BoeXNwYWdlcygpKTsNCg0K
QWdhaW4sIEknZCByYXRoZXIganVzdCBkaXNhYmxlIGJhbGxvb25pbmcgaW5zdGVhZCBvZiBj
cmFzaGluZyB0aGUgc3lzdGVtLg0KDQo+ICsJYmFsbG9vbl9zdGF0cy5jdXJyZW50X3BhZ2Vz
ID0gZ2V0X251bV9waHlzcGFnZXMoKSAtIHhlbl9yZWxlYXNlZF9wYWdlczsNCj4gICAJYmFs
bG9vbl9zdGF0cy50YXJnZXRfcGFnZXMgID0gYmFsbG9vbl9zdGF0cy5jdXJyZW50X3BhZ2Vz
Ow0KPiAgIAliYWxsb29uX3N0YXRzLmJhbGxvb25fbG93ICAgPSAwOw0KPiAgIAliYWxsb29u
X3N0YXRzLmJhbGxvb25faGlnaCAgPSAwOw0KDQpPdGhlciB0aGFuIHRoYXQgSSB0aGluayB5
b3VyIGFwcHJvYWNoIGlzIGZpbmUuDQoNCg0KSnVlcmdlbg0K
--------------8SKrxIyjysNDcLV0IxPx3de1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------8SKrxIyjysNDcLV0IxPx3de1--

--------------4IlyO0e06YQKSOcYRDsspWPU--

--------------JxCZvdLcOPVULmrk5v0xs8hy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmftSEYFAwAAAAAACgkQsN6d1ii/Ey+o
5Qf+KcPF8TuM128KjfFQnF1BCTBTGbvfsfJbHffFpOOtQxgVH93Pye6UqsguLgkuLJM5ghI3hqAT
wYPOPuoebSHZ4TnWgPYeitN4oeOIEhUnRWNTI5rqRqIrixbBZUt1S9aogqsIC1E1cDtlbqUr+jzw
ZVCFKVgRdeixz/oHSvY82SusbA3qLdyrxg1/ICb2CBIAUUrnLYJBsg+zN0VD7bueVRXj5EZpRJJA
ybcYUuheu2xT50JCFMg5mGBGMU1DJozDvolrXaEvaFV4+1IJry0kZSXyGSsfLnsq/jjh/wjqcbLU
1Fki5QCAuKVnXzKHufViw5TxglwBigrG7rZIpz83qA==
=2OzK
-----END PGP SIGNATURE-----

--------------JxCZvdLcOPVULmrk5v0xs8hy--

