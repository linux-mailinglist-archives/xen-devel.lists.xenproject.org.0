Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK4rJiH2u2nkqQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:12:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05522CBB91
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257094.1551535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DA9-0001zG-Al; Thu, 19 Mar 2026 13:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257094.1551535; Thu, 19 Mar 2026 13:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DA9-0001wK-89; Thu, 19 Mar 2026 13:11:45 +0000
Received: by outflank-mailman (input) for mailman id 1257094;
 Thu, 19 Mar 2026 13:11:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3DA8-0001wE-11
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:11:44 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c276406-2395-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 14:11:42 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-65c0891f4e9so1841445a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 06:11:42 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-667afa57131sm3440869a12.12.2026.03.19.06.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 06:11:41 -0700 (PDT)
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
X-Inumbo-ID: 2c276406-2395-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773925902; x=1774530702; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2cRNm3rBefjJpIqZX8XHJWtWDuBGM319iDYOg8ohwuI=;
        b=fkH/FnhqxW/pxR/1JH8suwpfTRFu75+uPf19UIl72igjtwMkbrR3GLgbmQU2Qd0uG5
         6atHn0LOYcr9QACgZpHO6vRrIttWp0cVBPE5SUoxERD1zp4GOTOFjgQSxIGBGWVZp0Xw
         hB28gEIJGPjLKDyY2smN6i9yksB0mgzt1vPxGKczCcOQkhzPQLtkC2U9sQD7uS6Ozn48
         GaaBR5FVqJcZ1fWOyxwn3wmx+nUDdJcO2ZgnIJvMiWAK+SjMX1aeeglaNqdXHhMs5kPZ
         gtrg+yvWUy6f2qkL/nfdEmWS3I28EDa1MWhqHdgfbK812MfT3E6oMZLZmeoIdtQJy+d4
         tk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773925902; x=1774530702;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2cRNm3rBefjJpIqZX8XHJWtWDuBGM319iDYOg8ohwuI=;
        b=LGuzVkc924piHQBmafETZG4CTf8N5JExOlLOrX9NMtqrzQUnn8M/uKDOVJER/zniuO
         C9bQDAbJN51thvCHqKrNKslGGOR0e8ebwHP7zmjvHK8d8a+tbZl7Dbu9G+GVdIgJLiTF
         myp3x53VHfYpRDIT5LtyxAQ8paZ2itxIhbzIf4IAiJlDC6T6S5pXAcVD69T5IfKcTkI9
         236Q8rs7A60GEczpSc5zmYBeWTjhGY+KSZuh8Plh4iEiiMf0CTl15FKzfUlvxN3kpeVM
         Kj3rmTSTjLuczEg5YXTId73YyPfCjcS8Rinn7cmH9oCSXAY/MSOeaIsj8NLpbOWWkTKY
         SIxA==
X-Gm-Message-State: AOJu0YxIL/S1wZrX+d+AQFA9cjubTPe0wGdb4jPy91TjKsCWKnXDTKMj
	md4LBuMNPMvYAxJH1mcL8ZhAkdyvGexULbZC9oMNzLMz9QgNcA7/+kDTaOXFrOUpbks=
X-Gm-Gg: ATEYQzwponYtNZ8N6moXX5hruI4jMxg9BMZ7zqpb3/sx8jJ9MQZ7RibNpRLcXUuNNRf
	DoFUm7FEnrafNWHEls4d9VlxbhABzNO581koWYXcfHjjyvD+9bbZHhN8NVZST7FhGr9LfcpdfK6
	wF+XteBsl4X0BUI0uOT1ED3xZERzMO6N2bnqPGrs0UYq4Yw6bZT6paUlQelhpqMmZKBQ4sQbTho
	I+65diMNFIhTtUTXllkng2s+mg8ihEUtUhLgjVIFZorP2Cc4Qw5P5fAw4klW+P7jC+5cxAYT+jD
	b2i1KJUGMiqd+SIwWD2utFxFmVx34pVPEsPvgGbinaCVH4Ynp94/gVldgWlXE6GpQGhU575bSYU
	sjbP3wqVC2QwSZJKz2MbNjlQz9HYU3NNT6kumCmIwYqWwHviRON8IVu3Z67y2NyL8sgbuqp9xcR
	jNyQsvs8KeS9l3PUQDc7TTaQTi37xE8CaFytyILlkFeJiSwaM5bgvUx2FLdgF8ODZCkCPU3vBjS
	E9w/1rXGUXpElCXm41QbwsYmr0VDzpgO9tawYDbwOtsiKqSO0mX4A==
X-Received: by 2002:a17:907:a0e:b0:b97:f28c:fea6 with SMTP id a640c23a62f3a-b97f486677amr436366066b.8.1773925901748;
        Thu, 19 Mar 2026 06:11:41 -0700 (PDT)
Message-ID: <a24adbbd-8caf-4bd5-aba6-49c95f73675b@suse.com>
Date: Thu, 19 Mar 2026 14:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] tools/xl: add support for xenstore quota setting
 via domain config
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-12-jgross@suse.com> <abv07SIxrCVEZoK0@l14>
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
In-Reply-To: <abv07SIxrCVEZoK0@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DZV2VIIr0ItL1VSLWu50Stfq"
X-Spamd-Result: default: False [-1.53 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:email,suse.com:dkim,suse.com:email,suse.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D05522CBB91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DZV2VIIr0ItL1VSLWu50Stfq
Content-Type: multipart/mixed; boundary="------------C3GST06FDQ7onfjH3gGaiv3w";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
Message-ID: <a24adbbd-8caf-4bd5-aba6-49c95f73675b@suse.com>
Subject: Re: [PATCH 11/11] tools/xl: add support for xenstore quota setting
 via domain config
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-12-jgross@suse.com> <abv07SIxrCVEZoK0@l14>
In-Reply-To: <abv07SIxrCVEZoK0@l14>

--------------C3GST06FDQ7onfjH3gGaiv3w
Content-Type: multipart/mixed; boundary="------------TlskU8FREYRT0rOTB4Dzvdyo"

--------------TlskU8FREYRT0rOTB4Dzvdyo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDMuMjYgMTQ6MDYsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIE1h
ciAwNSwgMjAyNiBhdCAwMjo1MjowOFBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gQWRkIGEgbmV3ICJ4ZW5zdG9yZS1xdW90YSIgZG9tYWluIGNvbmZpZyBwYXJhbWV0ZXIg
Zm9yIHNldHRpbmcgdGhlDQo+IA0KPiBZb3UgbWVhbiBgeGVuc3RvcmVfcXVvdGFgIF4gaGVy
ZS4NCj4gDQo+PiBYZW5zdG9yZSBxdW90YSBvZiBhIG5ldyBkb21haW4gdmlhIGEgbGlzdCBv
ZiA8cXVvdGE+PTx2YWw+IGl0ZW1zLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3hsL3hsX3BhcnNlLmMgYi90b29scy94bC94bF9wYXJzZS5jDQo+PiBpbmRleCA5MzRhZDRl
ZWVmLi4wNmE1YjYwNzM2IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGwveGxfcGFyc2UuYw0K
Pj4gKysrIGIvdG9vbHMveGwveGxfcGFyc2UuYw0KPj4gQEAgLTE0NjcsNiArMTQ2OCwyNiBA
QCB2b2lkIHBhcnNlX2NvbmZpZ19kYXRhKGNvbnN0IGNoYXIgKmNvbmZpZ19zb3VyY2UsDQo+
PiAgICAgICBpZiAoIXhsdV9jZmdfZ2V0X2xvbmcgKGNvbmZpZywgInhlbnN0b3JlX2ZlYXR1
cmVfbWFzayIsICZsLCAwKSkNCj4+ICAgICAgICAgICBiX2luZm8tPnhlbnN0b3JlX2ZlYXR1
cmVfbWFzayA9IGw7DQo+PiAgIA0KPj4gKyAgICBpZiAoIXhsdV9jZmdfZ2V0X2xpc3QoY29u
ZmlnLCAieGVuc3RvcmVfcXVvdGEiLCAmeHNfcXVvdGEsICZudW1feHNfcXVvdGEsIDApKSB7
DQo+PiArICAgICAgICBiX2luZm8tPnhlbnN0b3JlX3F1b3RhLm51bV9xdW90YSA9IG51bV94
c19xdW90YTsNCj4+ICsgICAgICAgIGJfaW5mby0+eGVuc3RvcmVfcXVvdGEucXVvdGEgPSBj
YWxsb2MobnVtX3hzX3F1b3RhLCBzaXplb2YoKiBiX2luZm8tPnhlbnN0b3JlX3F1b3RhLnF1
b3RhKSk7DQo+IA0KPiBZb3UgY2FuIGNhbGwgeGNhbGxvYygpIGluc3RlYWQsIGFuZCB0aGVu
IG5vdCBuZWVkIHRvIGNoZWNrIGZvcg0KPiBhbGxvY2F0aW9uIGZhaWx1cmUuDQo+IA0KPiBB
bmQgd2l0aCB0aGUgdHdvIGNoYW5nZXM6IFJldmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD4NCg0KVGhhbmtzLA0KDQoNCkp1ZXJnZW4NCg==

--------------TlskU8FREYRT0rOTB4Dzvdyo
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------TlskU8FREYRT0rOTB4Dzvdyo--

--------------C3GST06FDQ7onfjH3gGaiv3w--

--------------DZV2VIIr0ItL1VSLWu50Stfq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmm79g0FAwAAAAAACgkQsN6d1ii/Ey8L
dgf+I37DMtulOpg30x/FMxr02IZxtHkjdI/suxTRunmirlS/XAy6ShvI+ngmQ430bc53vqcF6ow7
Rs8COXliGiAVOOpNQLSfBghG/nGyFGYfTQZvKTmrqAqRPkYeNXf6NKB8TgWHCaYpPpQNlXqk9mNW
sjQ/qdZYPVZ2ZcMY7ynjSw3SdXdG8JXvcBlCVm9DXqVFKVfO/An+9FGpQRqW+zBpHTrdNEaZnFXy
85ayJm5JtWUaYrbrBpSA6Oo/vI/jxqTHsH4kvXIxZ6awlFAsLaZHI8KkMba0TKjDAx9eQWoU0dqz
PXtTOty9F2w61HqA7QbVx0U/BVcswGIGmiqQxsNP6Q==
=A0oq
-----END PGP SIGNATURE-----

--------------DZV2VIIr0ItL1VSLWu50Stfq--

