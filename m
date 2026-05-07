Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKBQBahC/GlYNgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 09:43:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 738AA4E434E
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 09:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302211.1576189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKtOE-0003NH-7u; Thu, 07 May 2026 07:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302211.1576189; Thu, 07 May 2026 07:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKtOE-0003Kx-4r; Thu, 07 May 2026 07:43:22 +0000
Received: by outflank-mailman (input) for mailman id 1302211;
 Thu, 07 May 2026 07:43:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wKtOC-0003Kp-V0
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 07:43:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKtOC-008I3B-6L
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 09:43:20 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69fc4294-e002-0a2a0a5209dd-0a2a4506bf2c-14
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 09:43:20 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69fc4297-7371-0a2a45060019-d155da36a806-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 09:43:20 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-bc1f0830f44so316120466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 00:43:19 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc8355281cfsm49688866b.54.2026.05.07.00.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 00:43:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778139799; x=1778744599; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9VS3OfDpF1+VQZhX2yMePmBwdL0OOCrpGS/EsBP+94w=;
        b=UV6iGtKAXw15JY8rGGqDy8U8RO2PJHUy7n9IQa1JoDocfVB9NnK6YRCk/Gc9sZ+Mep
         yFtcTVUDtl4OItl7BC+k/jNlzZn09WYCoizJAq315ueBgbSaLHr0syIFLEJwuphCsWX/
         /pcV+6isHaFsmMsXUpzNLfXoKmoBQGN6Waofp3i1rf2lnJP6t9AE1ixc67Mufac8itd9
         tdPuh650ay9rFzlLypYghvbNadhLG6tkUHrzRyXEq16m4TZOh3LtDSNjsBTNJpnBEbv+
         g6tuOhtd6SsKDZVkxUnb0wkjMmGzPRp3PLXv6NHMFjuUftO6Es/8zoV2QKhK9D/vbzYd
         +gVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778139799; x=1778744599;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VS3OfDpF1+VQZhX2yMePmBwdL0OOCrpGS/EsBP+94w=;
        b=o5cuV1N6Q3ym+taOkNxb4zQC9AM/6JVvOvJQl6AlyP9lKQgXVOlFeA3gq6PwMnq2Xj
         HGLyWSsqTDYOiXHuuLd5n8Uh50IKjeahD2Y1TVBM+j29fP4VLHTsbAK9j4qVM8nCx6+l
         VlACNMkgAu0OEVMXavESZbgv7SH0Z6v7WMcW6CYp0zSORjJtaFR1VFxnJtp+7mx8s68s
         8qE1I20iDtj/LvjYec+0jMqSrkOuZq7IpUOqD1heQ0jQYuBlaBui1yjfsQhc2uUrgHZh
         wx1n8WeH/g1qG9m1UurUhLRTRpYTpylsuR86sMnU3YHbPHWC9wBm7sM+2Sst8cwC00we
         TGqw==
X-Forwarded-Encrypted: i=1; AFNElJ+QYvMVOaXP/TM8+PP6CNkHYkY5jRlPdHt4RoEYdG4wKOktgHsd3ScrbbfHb+bO4KaiSpTdpO58yFo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyTJOYL/E94KhIs9DaX27oJ5J+GEfx74j2v+vFIosg8RvNxBQj
	zfOztnNZ956hhQFUT8l6MOpRuOikdNJ804vmSG/a/hxXjemQBixobVC+iCLoqFsEMCU=
X-Gm-Gg: AeBDieuGuqHAV3L4AlpvdW/7cSINRXWatEhJbLAtvjuTJBoCHDJlyDckAfIdq5i9hJy
	WxU7I0DOd0bj5YyYYlVQZtSG524sxygisy3rsaGgfYIUlsRszfGoFIFObtJbf1+KZCTHy14XLQ9
	jwAm/0epVE3KakeCXJLEoADw3tlp40ypy9snwGYhw6N2+B7EAIuq2bmOrZXGJrZTxDRb6ZtKmEU
	RfRIf7lhb/93OG65M7reyViVibcIiqLnxMGJUClKHhGNHp+YMbxjIxrLT6LxK1KmNnEnIcD+mWN
	Na9dK/FwMUd7iSh5KAUbJifpD+bbxRKyTeJI9tXQIZBe0R5FUoh7OknkOpR30Wx/bR6AJYKXW9V
	dTwg7vL0AaEzdikaT+7rjujiasIQ51McYTuGyrZEY+PeV2V5RXF0clPOsjdOu0f0D3Gvdg0EZOe
	IGvPLAmznVLw3ECYDKuNTAiSo5M8zkbO2i5SU7mJh0b8pVUgGKLlssE6HsbeI1yBxKCY6GNXwUJ
	Mk/EH8ErqI0CMNLhz+jwz/QUhr7saIGeWltt9agbk9z8OYZGwQ8V4mrNqzmbzY2
X-Received: by 2002:a17:906:ee84:b0:bc5:114c:956 with SMTP id a640c23a62f3a-bc84cc73483mr79253766b.1.1778139799328;
        Thu, 07 May 2026 00:43:19 -0700 (PDT)
Message-ID: <199b54b5-8571-4a18-bba6-226a5a94ecc9@suse.com>
Date: Thu, 7 May 2026 09:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] tools/xenstored: remove permissions related to
 dead domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20260429120619.1013440-1-jgross@suse.com>
 <20260429120619.1013440-5-jgross@suse.com>
 <e9cfb86e-704d-4a5d-bc59-ad05d07bf69a@amd.com>
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
In-Reply-To: <e9cfb86e-704d-4a5d-bc59-ad05d07bf69a@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------I3K5I940S1iowrQwofMvgFlj"
X-purgate-ID: tlsNG-16d1c6/1778139800-86974D75-1583D037/0/0
X-purgate-type: clean
X-purgate-size: 6820
X-Rspamd-Queue-Id: 738AA4E434E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.63)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------I3K5I940S1iowrQwofMvgFlj
Content-Type: multipart/mixed; boundary="------------7CbKlZjBSYIXH3Rxecf2PM1b";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <199b54b5-8571-4a18-bba6-226a5a94ecc9@suse.com>
Subject: Re: [PATCH v2 4/4] tools/xenstored: remove permissions related to
 dead domain
References: <20260429120619.1013440-1-jgross@suse.com>
 <20260429120619.1013440-5-jgross@suse.com>
 <e9cfb86e-704d-4a5d-bc59-ad05d07bf69a@amd.com>
In-Reply-To: <e9cfb86e-704d-4a5d-bc59-ad05d07bf69a@amd.com>

--------------7CbKlZjBSYIXH3Rxecf2PM1b
Content-Type: multipart/mixed; boundary="------------TxX2aORkAAQdRmZi0xMUc5Ph"

--------------TxX2aORkAAQdRmZi0xMUc5Ph
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDQuMjYgMTg6NDEsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjYtMDQt
MjkgMDg6MDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBXaXQgdW5wcml2aWxlZ2VkIGRv
bWFpbnMgbm93IGNhcGFibGUgdG8gdXNlIHRoZSBAcmVsZWFzZURvbWFpbiB3YXRjaCwNCj4g
DQo+IHMvV2l0L1dpdGgvIGFnYWluLg0KPiANCj4gUmVnYXJkcywNCj4gSmFzb24NCj4gDQo+
PiB0aGVyZSBpcyBubyByZWFzb24gbm90IHRvIHJlbW92ZSBhbnkgbm9kZSBwZXJtaXNzaW9u
cyB3aGljaCByZWxhdGUgdG8NCj4+IGEgZG9tYWluIHdoaWNoIGhhcyBiZWVuIHJlbW92ZWQu
DQo+Pg0KPj4gVGhpcyByZXNvbHZlcyBhIGNvbXBsZXggc2NlbmFyaW8gd2hlcmUgYSBuZXcg
ZG9tYWluIGNvdWxkIGluaGVyaXQgdGhlDQo+PiBwZXJtaXNzaW9ucyBvZiBhbiBvbGQgb25l
IHdpdGggdGhlIHNhbWUgZG9taWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IEphc29uIEFuZHJ5dWsg
PGphc29uLmFuZHJ5dWtAYW1kLmNvbT4NCg0KQ2FuIHRoaXMgc2ltcGxlIGZpeCBiZSBkb25l
IHdoaWxlIGNvbW1pdHRpbmcsIG9yIHNob3VsZCBJIHNlbmQgVjM/DQoNCg0KSnVlcmdlbg0K

--------------TxX2aORkAAQdRmZi0xMUc5Ph
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------TxX2aORkAAQdRmZi0xMUc5Ph--

--------------7CbKlZjBSYIXH3Rxecf2PM1b--

--------------I3K5I940S1iowrQwofMvgFlj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmn8QpYFAwAAAAAACgkQsN6d1ii/Ey+B
OQf/UFoAluFeE7HnnSaI8Y+cacrGD5IGwtB5PdOIhs3gZoluuZhz2RtWMf2dt3XnQMikvVAHVJFN
ArbjoWwx8925mu5Nd4enuay+HmJuk7ebSzWrWdIR6wikBTjD6bOM+OwXhkyYA56dQShPkH+yM5V7
HjA/kGL7sL21jqKEFj9VdCKNXyLFbj2ncIWZiY3BshCcMJwEUNj1taAdPpBkJCVtzKeQkJVqqR0q
crazqdnog7ZkyFuBDTOo5UjI4bbzXX6V7hqZN+Yp3JMulvZKwEe1FAKmFGt8KEb9aYWUYe2DA5Mw
Oe/MmItbZ1YScFu89vBZhlylLm5agGUTHZ2t9dk46w==
=faB5
-----END PGP SIGNATURE-----

--------------I3K5I940S1iowrQwofMvgFlj--

