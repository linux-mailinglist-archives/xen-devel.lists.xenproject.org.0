Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGoEGlkHj2maHQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:13:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D4F13594B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:13:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230622.1536064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqr65-0004jG-Sh; Fri, 13 Feb 2026 11:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230622.1536064; Fri, 13 Feb 2026 11:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqr65-0004hD-Pg; Fri, 13 Feb 2026 11:12:29 +0000
Received: by outflank-mailman (input) for mailman id 1230622;
 Fri, 13 Feb 2026 11:12:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vDOC=AR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vqr64-0004h7-26
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 11:12:28 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e109eed8-08cc-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 12:12:27 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b8f8f2106f1so103416566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 03:12:26 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fbe407520sm3682466b.43.2026.02.13.03.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Feb 2026 03:12:25 -0800 (PST)
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
X-Inumbo-ID: e109eed8-08cc-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770981146; x=1771585946; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ev/ToI45invKmxKsmjv/nTAYHo0Moc+rLWviNdbLiR0=;
        b=c7Yy5CSGpTwntZGudiCKxo6n2N3/6YCUxD/2kXDh7hHvonfDuwO3BG8i/FBYf1P+fW
         psENUQeZFKd2Ge/nkd9TDpfW8DJEN+AhXufTQjhOUHz+di7Fx7Y2eTbs57dmn3tJuTRZ
         rQdEVSIv5de+zza6Hs9vTm8lKLO5+BceyPSI+ywCHuYJJXio9ib3ie9yqiF3qKGYsoFH
         xR9YH5HSrDQPUdYwEmxTw6JhMvTK3cyri6UXSNlyIp5ZJDoqSXEzRHBKTQaOwJcQz2zF
         3QeE/k+sWt8HYtUoRtQ4Zsz9rfRy9cs3k6lZrlTmACiNfvuSaORF9zpT2gGWDZI4VhVk
         41xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770981146; x=1771585946;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ev/ToI45invKmxKsmjv/nTAYHo0Moc+rLWviNdbLiR0=;
        b=YCfGUlFhCgpZndtMdbFIlh6g5fw10TCbmwZ4qXViZ2dg4zpAGW1iDHPqfMvptb0iv7
         nATQ29s1y7x4Ga+oEKGwTHSjVaiGqWIXuwFXEMo6z40wGn9C+/iSnffO7m+S16cEpBaG
         lEYIYkPVQtGwwyDQ/BcTnsQHnT1Yt9DyL36Re1KCuDsC8qn+7iWt94MdLFuKky/m7ehs
         ri8QGtdERvxUkEZ2v3CuT59aKeCEgihZKx9GPNRyRHpZUa/MftDm1I8jNPjm4dk6MesY
         c7sQ6tzS1z4OfiiFTIjItzp3M/tDvXhbzMBKtKRvxiR7ihDdYkexG7igbsV49cNTQ7cl
         Wa/A==
X-Forwarded-Encrypted: i=1; AJvYcCWlEuWxcFG0/0GrFv+jZ3kxGLtdNQZL/OC1HElT8Bul5lXqREXip0olFsWMakQRLDGr45hq/RQpMKw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdZ2PXz04e560wj8ZIp2YPHw4kTP6FdCmAh2W+a8/pmQ+MNQs/
	3mBPlwPoRZU50lf+0AHyJLv27u9vGTC7VHaae0Usg6SdtGst56zTIZe6jUvC9bzqVIU=
X-Gm-Gg: AZuq6aJBZLDywxepUBRfLbDUw00S8E/aNktmefYB1JpLhYu88o0U1ZuZ+ZC52NlVYFQ
	f9p7768zXBwyiFc6XyO3ZMb2TyeepVShJ+w6ZSOPxgn31jSqaUPiHV4enC8/fPiXHFlX/Uqx3YY
	T1tfVXYzfu6ro7DPJpuMB8YaZfp2S/O1yBp/sk3OwId8DKvziCa+U+C4ygg7U54pGyeNZoiMZGg
	d3NBvOp+7ecPkg0f/BR2Gz7VyrZ0TdO0eK0lZ0GgSnEUk04PQX1UpHa72JRIBFzTIMelMjj5FpK
	/pmzL8tpBx1QDZEh59pdAyVS8SxlLtTK8zzZ3ztkqdGtv0v/ZeZ1F7DGJe9jm2ju+MlT2Oufc2e
	/T2MSob7BfD4ylJnsz+zt2iErdf2xVpYNHZqanK3/ldQOpr0jBXzNCnhgW85DE6d2K/v7ypDKMo
	W/BTk3Xtjv9VTH7R+MfFUGw5CVKWWGCQq/81RUpZXbCCwI+TWBmfKQiz6xbteCRm/J9Ox5MGM2s
	+Y6w9/kS9vqw5Z5KeqHV2hFAP40gDpnJar/dXkEZDth5p6ghw==
X-Received: by 2002:a17:906:6a21:b0:b8f:a853:add5 with SMTP id a640c23a62f3a-b8fb466c3dcmr84975466b.62.1770981146183;
        Fri, 13 Feb 2026 03:12:26 -0800 (PST)
Message-ID: <02459674-58f9-407c-b151-39374a6cf81a@suse.com>
Date: Fri, 13 Feb 2026 12:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] xen-netback: reject zero-queue configuration from
 guest
To: Ziyi Guo <n7l8m4@u.northwestern.edu>, Wei Liu <wei.liu@kernel.org>,
 Paul Durrant <paul@xen.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: "Andrew J . Bennieston" <andrew.bennieston@citrix.com>,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260212224040.86674-1-n7l8m4@u.northwestern.edu>
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
In-Reply-To: <20260212224040.86674-1-n7l8m4@u.northwestern.edu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rmAWL2OMeeZDohi0r3FMp00n"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.13 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:n7l8m4@u.northwestern.edu,m:wei.liu@kernel.org,m:paul@xen.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:andrew.bennieston@citrix.com,m:xen-devel@lists.xenproject.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B3D4F13594B
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rmAWL2OMeeZDohi0r3FMp00n
Content-Type: multipart/mixed; boundary="------------fzXF7bXgc7rK1nb40SukhLSf";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ziyi Guo <n7l8m4@u.northwestern.edu>, Wei Liu <wei.liu@kernel.org>,
 Paul Durrant <paul@xen.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: "Andrew J . Bennieston" <andrew.bennieston@citrix.com>,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <02459674-58f9-407c-b151-39374a6cf81a@suse.com>
Subject: Re: [PATCH net] xen-netback: reject zero-queue configuration from
 guest
References: <20260212224040.86674-1-n7l8m4@u.northwestern.edu>
In-Reply-To: <20260212224040.86674-1-n7l8m4@u.northwestern.edu>

--------------fzXF7bXgc7rK1nb40SukhLSf
Content-Type: multipart/mixed; boundary="------------oPkhdrcLI3DudRxu4wTLSAHY"

--------------oPkhdrcLI3DudRxu4wTLSAHY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDIuMjYgMjM6NDAsIFppeWkgR3VvIHdyb3RlOg0KPiBBIG1hbGljaW91cyBvciBi
dWdneSBYZW4gZ3Vlc3QgY2FuIHdyaXRlICIwIiB0byB0aGUgeGVuYnVzIGtleQ0KPiAibXVs
dGktcXVldWUtbnVtLXF1ZXVlcyIuIFRoZSBjb25uZWN0KCkgZnVuY3Rpb24gaW4gdGhlIGJh
Y2tlbmQgb25seQ0KPiB2YWxpZGF0ZXMgdGhlIHVwcGVyIGJvdW5kIChyZXF1ZXN0ZWRfbnVt
X3F1ZXVlcyA+IHhlbnZpZl9tYXhfcXVldWVzKQ0KPiBidXQgbm90IHplcm8sIGFsbG93aW5n
IHJlcXVlc3RlZF9udW1fcXVldWVzPTAgdG8gcmVhY2gNCj4gdnphbGxvYyhhcnJheV9zaXpl
KDAsIHNpemVvZihzdHJ1Y3QgeGVudmlmX3F1ZXVlKSkpLCB3aGljaCB0cmlnZ2Vycw0KPiBX
QVJOX09OX09OQ0UoIXNpemUpIGluIF9fdm1hbGxvY19ub2RlX3JhbmdlKCkuDQo+IA0KPiBP
biBzeXN0ZW1zIHdpdGggcGFuaWNfb25fd2Fybj0xLCB0aGlzIGFsbG93cyBhIGd1ZXN0LXRv
LWhvc3QgZGVuaWFsDQo+IG9mIHNlcnZpY2UuDQo+IA0KPiBUaGUgWGVuIG5ldHdvcmsgaW50
ZXJmYWNlIHNwZWNpZmljYXRpb24gcmVxdWlyZXMNCj4gdGhlIHF1ZXVlIGNvdW50IHRvIGJl
ICJncmVhdGVyIHRoYW4gemVybyIuDQo+IA0KPiBBZGQgYSB6ZXJvIGNoZWNrIHRvIG1hdGNo
IHRoZSB2YWxpZGF0aW9uIGFscmVhZHkgcHJlc2VudA0KPiBpbiB4ZW4tYmxrYmFjaywgd2hp
Y2ggaGFzIGluY2x1ZGVkIHRoaXMNCj4gZ3VhcmQgc2luY2UgaXRzIG11bHRpLXF1ZXVlIHN1
cHBvcnQgd2FzIGFkZGVkLg0KPiANCj4gRml4ZXM6IDhkM2Q1M2IzZTQzMyAoInhlbi1uZXRi
YWNrOiBBZGQgc3VwcG9ydCBmb3IgbXVsdGlwbGUgcXVldWVzIikNCj4gU2lnbmVkLW9mZi1i
eTogWml5aSBHdW8gPG43bDhtNEB1Lm5vcnRod2VzdGVybi5lZHU+DQoNClJldmlld2VkLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------oPkhdrcLI3DudRxu4wTLSAHY
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------oPkhdrcLI3DudRxu4wTLSAHY--

--------------fzXF7bXgc7rK1nb40SukhLSf--

--------------rmAWL2OMeeZDohi0r3FMp00n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmPBxkFAwAAAAAACgkQsN6d1ii/Ey9i
zQf+NoCNOcEARUKfM7WGvjBJICmF9LWnKvhG2fMAYCZ3gF3ybnoHStwJQ+ioMHEkirAye7g1vmnP
TRQsqYFYW53t0VuEy9LsniZk7fapy7fGr36uOjMJg3+xyU4q9xt+VFKF8b4dKVi5itasrGmC6yKQ
OM51/LLkoQBcMwj0BvyXmZrMIMrE5tSTO6EichMpEba3R7UyNKBSOZmOn8kRzo5cY9KIs4X5LZJs
eFKSb1dTjZwcpR5P0Nhmsb16K8alSpLyrROO3srwc6is92yY/k4eggBCPekIt7dybWFv/cVLeCxV
ptCCQ2s7NNh0hryMfq/CZQLGFoFeVImhq8GyuRuSCA==
=G6ik
-----END PGP SIGNATURE-----

--------------rmAWL2OMeeZDohi0r3FMp00n--

