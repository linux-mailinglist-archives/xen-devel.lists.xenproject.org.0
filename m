Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6226DB38616
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 17:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096312.1451080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHsb-0003bh-3Q; Wed, 27 Aug 2025 15:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096312.1451080; Wed, 27 Aug 2025 15:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHsb-0003YX-06; Wed, 27 Aug 2025 15:16:05 +0000
Received: by outflank-mailman (input) for mailman id 1096312;
 Wed, 27 Aug 2025 15:16:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bDd0=3H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1urHsa-0003DW-2z
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 15:16:04 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beb06d16-8358-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 17:16:03 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3cc3600e5d1so1639979f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 08:16:03 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:6400:8c05:37ee:9cf6:6840?
 (p200300e5872d64008c0537ee9cf66840.dip0.t-ipconnect.de.
 [2003:e5:872d:6400:8c05:37ee:9cf6:6840])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cce1724939sm2943229f8f.26.2025.08.27.08.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 08:16:01 -0700 (PDT)
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
X-Inumbo-ID: beb06d16-8358-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756307762; x=1756912562; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mkwwNb4PUU2phyW0XXIgsswHkgN1PSjVOVIVRwzjANE=;
        b=AGbcqArE+ghV//Mm5mi59QPuQNDvoIIPZOLp8yX+/vMWsz8yVD2CL/ICWC87YFpsq3
         B7x/Ig/1+1vMSBv/uQjsMwrUKBzTqHxOKBFJoB36ADkCuiBVrf4Li+J4pb0989caLbcj
         Sh/K4X58b5e5oh1cDGprZ310UFnyCLsVPHKQfE4ddK36Sefjg39AD5QY6+Uq0vue5wzP
         7CK3mXKNcVaWuP2MN32IrIXQOrwYIhtS0dnGwdoK5vUM+UlxZkwPONSh0Q2H/U2LAMKh
         0KBSE8w+RDKZJzJwqgKbWw96I31ba/Pcpg7LGIazVAW2vqnXysRh/buHGpryjlQ9njXB
         iWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756307762; x=1756912562;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mkwwNb4PUU2phyW0XXIgsswHkgN1PSjVOVIVRwzjANE=;
        b=GANO7JyDwhi4rWtCWtTgxxnDa2FviN1Byjy2L26OqESWW/RTm3Fe4qFu/eeuD8LExw
         TJZJK823hKQ/YlNMhpP4tT1zE/u9c3Nxwi47NWqyYoebYOcgSve+IFOv3PmgSw5MIW+X
         EBGNL3AkkG4cqt5c6huKQMnSaiVgah3ToPSSwvV3rKgXUEk9dqPJWCvjlpePMVdPDBxv
         3YZKRU8lhGVyKOr1t0BRfb9GaMgEPIgusq/aSDXTpjoK7aPyi7zXobCGVD0ig3dZlvTr
         nDNt7Mx8soQyDZfgFb2E3rd6uwRXMUeyr8mrDOu/gTMTpZTa/7i4jJ3MRfQXgjzn+wHB
         gSCA==
X-Gm-Message-State: AOJu0YzVyr+I/0RbI0+PZpvMjzMG8JDTztdbXm8oO4ZTwDLZQzw9cKQu
	qy2qP8KS87/IGXRisyJiCcI1Io5qyQX1IVkd5dLZ5pHxIenEVv35cnSkqD/r/q/hu5Y=
X-Gm-Gg: ASbGncsKTWTsidX6jjsFePSR9DNrGpZ4LWI3ebUq7js0SX62DF0zqG5ZS30GMiGMWeU
	l0lit2qvt7Z5TcW8MO3keuF+iTIx1+nh2P0XG3I/7X4oSxTzoSvMtg/a06AcvJ+Bdl46w7t0n0j
	BbPK3pJ4OEmFS90kRjLvaxLhiDOvwRwM1Xlj1IYIA0AIxXxv7AMduoWaWD9HVOux2UANH2hurZ4
	OPKMLddMJJC76OMvt5b2rE+kras1NppNeXXCTiBWEs+9iC9uuYRfjmR8CAOhLCe0BO2Ia4yDaHt
	EEF75sm4dP9T8JADqrbVnagAavV+i55gsUkHLma8c/ArDSMiVTEPn8bHB05yZUvUL68MJX0wQR6
	QS0KZ7UKOHkXK74Ms7464ytuVWKGwGleeQqcheHCJ35l1Gh5QWoQSIyQZe6ry4WbyGdeCz2b70v
	RpqoLKfM4n+7vllMUvpxdMnYBGbcOmIzoYDnyrVB8YpmGJALM=
X-Google-Smtp-Source: AGHT+IGC3x27/9Wz7Q4JF0YzB9FZ/1kNHSA4g27HaFNm2Fi1QrhRtivnaLS1lLxxwqkiJ6Hc2qhMWQ==
X-Received: by 2002:a5d:5f4b:0:b0:3b7:7563:9d59 with SMTP id ffacd0b85a97d-3c5dceff114mr16392120f8f.57.1756307762164;
        Wed, 27 Aug 2025 08:16:02 -0700 (PDT)
Message-ID: <9b66ef8f-c21b-4ad8-9f36-51ce653be661@suse.com>
Date: Wed, 27 Aug 2025 17:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/events: Cleanup find_virq() return codes
To: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20250826005517.41547-1-jason.andryuk@amd.com>
 <20250826005517.41547-2-jason.andryuk@amd.com>
 <de9005bf-c858-4e7e-bea8-33e5ea2424fc@suse.com>
 <cdbd3849-c366-4d25-bf72-23587d79ab6e@amd.com>
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
In-Reply-To: <cdbd3849-c366-4d25-bf72-23587d79ab6e@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------35bsTIxa26ft1A61ogRs6brI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------35bsTIxa26ft1A61ogRs6brI
Content-Type: multipart/mixed; boundary="------------eOB93pMtBWPMxrMPe6LEzvyd";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <9b66ef8f-c21b-4ad8-9f36-51ce653be661@suse.com>
Subject: Re: [PATCH v2 1/3] xen/events: Cleanup find_virq() return codes
References: <20250826005517.41547-1-jason.andryuk@amd.com>
 <20250826005517.41547-2-jason.andryuk@amd.com>
 <de9005bf-c858-4e7e-bea8-33e5ea2424fc@suse.com>
 <cdbd3849-c366-4d25-bf72-23587d79ab6e@amd.com>
In-Reply-To: <cdbd3849-c366-4d25-bf72-23587d79ab6e@amd.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------eOB93pMtBWPMxrMPe6LEzvyd
Content-Type: multipart/mixed; boundary="------------wuFqn0L7RqvXg450a0H4e5of"

--------------wuFqn0L7RqvXg450a0H4e5of
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDguMjUgMTc6MDMsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDgt
MjYgMDM6MjIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMjYuMDguMjAyNSAwMjo1NSwg
SmFzb24gQW5kcnl1ayB3cm90ZToNCj4+PiByYyBpcyBvdmVyd3JpdHRlbiBieSB0aGUgZXZ0
Y2huX3N0YXR1cyBoeXBlcmNhbGwgaW4gZWFjaCBpdGVyYXRpb24sIHNvDQo+Pj4gdGhlIHJl
dHVybiB2YWx1ZSB3aWxsIGJlIHdoYXRldmVyIHRoZSBsYXN0IGl0ZXJhdGlvbiBpcy4NCj4+
DQo+PiBXaGljaCBtYXkgZXZlbiBiZSBhIGZhbHNlICJzdWNjZXNzIi4gRXNwZWNpYWxseSBm
b3IgdGhhdCBpdCBmZWVscyBsaWtlIC4uLg0KPiANCj4gSSdsbCBzdGF0ZSB0aGF0IGhlcmUu
Li4NCj4gDQo+Pg0KPj4+IMKgIENoYW5nZSB0byBhbg0KPj4+IGV4cGxpY2l0IC1FTk9FTlQg
Zm9yIGFuIHVuLWZvdW5kIHZpcnEgYW5kIHJldHVybiAwIG9uIGEgc3VjY2Vzc2Z1bA0KPj4+
IG1hdGNoLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSmFzb24gQW5kcnl1ayA8amFzb24u
YW5kcnl1a0BhbWQuY29tPg0KPj4NCj4+IC4uLiB0aGlzIGFsc28gd2FudHMgYSBGaXhlczog
dGFnIGFuZCBwZXJoYXBzIGEgQ2M6IHRvIHN0YWJsZUAuDQo+IA0KPiBhbmQgYWRkIHRoZXNl
Lg0KPiANCj4+DQo+Pj4gLS0tIGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMN
Cj4+PiArKysgYi9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYw0KPj4+IEBAIC0x
MzE4LDcgKzEzMTgsNyBAQCBzdGF0aWMgaW50IGZpbmRfdmlycSh1bnNpZ25lZCBpbnQgdmly
cSwgdW5zaWduZWQgaW50IA0KPj4+IGNwdSwgZXZ0Y2huX3BvcnRfdCAqZXZ0Y2huKQ0KPj4+
IMKgIHsNCj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBldnRjaG5fc3RhdHVzIHN0YXR1czsNCj4+
PiDCoMKgwqDCoMKgIGV2dGNobl9wb3J0X3QgcG9ydDsNCj4+PiAtwqDCoMKgIGludCByYyA9
IC1FTk9FTlQ7DQo+Pj4gK8KgwqDCoCBpbnQgcmM7DQo+Pg0KPj4gTWF5YmUgYmVzdCB0byBh
bHNvIG1vdmUgdGhpcyBpbnRvIHRoZSBtb3JlIG5hcnJvdyBzY29wZSAobG9vcCBib2R5KT8N
Cj4gDQo+IFNvdW5kcyBnb29kLg0KPiANCj4+IEVpdGhlciB3YXk6DQo+PiBSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpXaXRoIHRoZSBjaGFuZ2Vz
IHlvdSBwcm9taXNlZCB0byBkbzoNCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------wuFqn0L7RqvXg450a0H4e5of
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------wuFqn0L7RqvXg450a0H4e5of--

--------------eOB93pMtBWPMxrMPe6LEzvyd--

--------------35bsTIxa26ft1A61ogRs6brI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmivITAFAwAAAAAACgkQsN6d1ii/Ey9t
aQf/Ww/kmBksJ1wFpk47yTbfu6MAIMpQGbB2TRyLlD8iuPWrk/1VS3453T7JQYdzxLSf9FH2/agx
vZRezlYBUgpMbGjER/c6xeE3zls+tvzl6cWtq1IRZkkaEdTy614KtfrGERwZYkEQ2iBBUL04lVFT
k7WhoY7ac73Ra9gSzIOfnvf3MjM9Iu5LwLFqJWf1G87yq0KpF6J5NJjWklRfJDScWahhWg8y5YFS
H8DFz95GbA8Ns6+d0IdqLWGdQCdPnDBI2k6krWUNmj3dd9WXvYtb38jhRUzcQDMqWXftNt0+5O4P
2+51W0zVE2HrwmiLQUrH32k9XcOa+M0Dc3+Su9fdaQ==
=l2gk
-----END PGP SIGNATURE-----

--------------35bsTIxa26ft1A61ogRs6brI--

