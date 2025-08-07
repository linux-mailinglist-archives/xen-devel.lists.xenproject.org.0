Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE94B1D2DC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 09:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072545.1435582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujucL-0000yq-CE; Thu, 07 Aug 2025 07:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072545.1435582; Thu, 07 Aug 2025 07:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujucL-0000wt-97; Thu, 07 Aug 2025 07:00:49 +0000
Received: by outflank-mailman (input) for mailman id 1072545;
 Thu, 07 Aug 2025 07:00:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4KBa=2T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ujucJ-0000wn-KT
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 07:00:47 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ba0d867-735c-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 09:00:42 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-af95525bac4so126054566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 00:00:42 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c08csm1260993466b.118.2025.08.07.00.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 00:00:41 -0700 (PDT)
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
X-Inumbo-ID: 3ba0d867-735c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754550042; x=1755154842; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tOMFzXjfqApsmNgUmWY9MCxHySFMvslhIu9lxxs/xhY=;
        b=bqr3n0lwq3Oj2EU4mqxbW1s3b9vA8kx+qkC2skt4hMYXry+mbpoal/eA7VR9OSl4pZ
         LHTCKOTGtLTW6GSfqyQl7o2mennx+WJs5FxoilMcJF8HBJgdi81vROepqTteXEqdRj2X
         yW48TxYae3k1NYH14axItlXaa8GWKxW14wg27a3IWODpEMTQsIWrHCNrUhxM/ao3sVFg
         /5+z3RlbfKJqOGXf0HMIJxLcXt9GkU9ayNvn6mHOdOhPHNHEuiNBJ+KhyPYaY23PpDSn
         sho34OLKkmEXFPBPrxIAa3XYaB5K74jfUzHK/mNB9x3ESZuSjQgzxCVS3tL/N2X8tEy2
         pwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754550042; x=1755154842;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tOMFzXjfqApsmNgUmWY9MCxHySFMvslhIu9lxxs/xhY=;
        b=Emzuve7E/hKFN4tDR3sZ1e59M5UpuWgvV4nsb2INKMRfX5Q3RcYa2GPHfmgHL5rpOA
         nwk8QRccdWHMqriy5R11zPhFhPARrRnvGz4RGYQ29WckQAtiFsXlB5piaT03Zgo4QaFY
         PJitcOnoNlcUu6Pda9kWGMxRZ3JzdXj3V8XlrjrQ5hC96ZB+OVIWV+9YBjPMbLI11UTc
         9yMu5yW9G9hU7qPxNlalOJcGjvkOgnLFMM0a1qP+40koVkOOKau6vzDhIKAS2jmz+SmO
         0UePHe6bhyuYDBi6KHBV7Rl2hfKEpVO6ZZAigtXHd2APR6/Uxb2QbDqeL+jI+WNQRoQM
         8uuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3a4XpjpzobK7LO/msfVK/licLEPNpNboAVsH3j7y5PXd8ANg/NkSdFRrk7jWU29N+vVlvmUfNLEI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMWCF59Y2K1NYn/VQTnNyT2svfyBUUmVYWZy3MCi5b7yHQsL3k
	w4UyoVPcVFNVTfDpmCY4vhV3/47ZjKaSTFIySmWF4gKJQqoLdpu1Vz6oMzqY+UQgCR0R8kwsJYc
	rT+T4JsU=
X-Gm-Gg: ASbGnct9ZcugcxlaAiXeyk82c9ivaEApahXEglFpUtNNUIM8KZKulGmU/WWDMDULZW9
	SKpl22bcELvKRUElKXg96Q5lOO03sxX1hCzDzb7h6Irk8gfBFgatN3TkF9+tT1zFUNvsobuRC8D
	LHWLraExOBCCBk2T+kr0WOeH7aOMgd0NqAR2bujMlISBzmUIkGqj+B6RIYe4c8fpCmC6rGKRlv7
	B0RYkQZUpsyJgUUGImVX4aAdQOT3Nb8ma6coZ7jf0Is/zVFdb5VOr5F6xkK+lNkreLHHRYS0vxR
	098skjk2NYcRO7TSr9AjfwOfE/8PrwBacYJhK5XhdLnEIggDKdfuqDndUATyCwFS99groSnXQIE
	TlbGyUc5DcQBqz8y5BYJQyyAuUnnfg2DDaLyLBETspGCWaalCTLWgrL+6PSqW3TxYbmEfX35vJZ
	ufKYJ3Rzrct5V7tmc9WJeVDJ9Dmr6CdFoj3HNS/etCaA==
X-Google-Smtp-Source: AGHT+IEifKxdhJkJU1ui3sP8SXn2lak5Lqk2FCEI5Axkq0vHTS8lt+ICJ5i21sBBxYv9qJfOuOluNg==
X-Received: by 2002:a17:906:730b:b0:ae0:c441:d54b with SMTP id a640c23a62f3a-af992a61199mr408819566b.9.1754550041658;
        Thu, 07 Aug 2025 00:00:41 -0700 (PDT)
Message-ID: <25745d45-d506-4277-8ccd-302cd1316707@suse.com>
Date: Thu, 7 Aug 2025 09:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xenconsole: Add connected flag
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20250807015606.4427-1-jason.andryuk@amd.com>
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
In-Reply-To: <20250807015606.4427-1-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wkg6tmIozJljv81Bj40WeEch"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wkg6tmIozJljv81Bj40WeEch
Content-Type: multipart/mixed; boundary="------------1DcwHXzsI00Az91ZQkKI66kj";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <25745d45-d506-4277-8ccd-302cd1316707@suse.com>
Subject: Re: [PATCH v1] xenconsole: Add connected flag
References: <20250807015606.4427-1-jason.andryuk@amd.com>
In-Reply-To: <20250807015606.4427-1-jason.andryuk@amd.com>

--------------1DcwHXzsI00Az91ZQkKI66kj
Content-Type: multipart/mixed; boundary="------------XcG6NHiDPGi3iN1i4DinuVjo"

--------------XcG6NHiDPGi3iN1i4DinuVjo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDguMjUgMDM6NTYsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFdpdGggaHlwZXJs
YXVuY2gsIGEgZG9tVSBjYW4gc3RhcnQgYmVmb3JlIGl0cyBjb25zb2xlIHJpbmcgaXMgY29u
bmVjdGVkDQo+IGJ5IHhlbmNvbnNvbGVkLiAgV2l0aCBub3RoaW5nIGVtcHR5aW5nIHRoZSBy
aW5nLCBpdCBjYW4gcXVpY2tseSBmaWxsDQo+IGR1cmluZyBib290LiAgSW4gZG9tVV93cml0
ZV9jb25zb2xlKCksIF9fd3JpdGVfY29uc29sZSgpIHJldHVybnMgMCB3aGVuDQo+IHRoZSBy
aW5nIGlzIGZ1bGwuICBUaGlzIGxvb3BzIHNwaW5zIHVudGlsIHhlbmNvbnNvbGVkIHN0YXJ0
cyBlbXB0eWluZw0KPiB0aGUgcmluZzoNCj4gDQo+ICAgICAgICAgIHdoaWxlIChsZW4pIHsN
Cj4gICAgICAgICAgICAgICAgICBzc2l6ZV90IHNlbnQgPSBfX3dyaXRlX2NvbnNvbGUoY29u
cywgZGF0YSwgbGVuKTsNCj4gDQo+ICAgICAgICAgICAgICAgICAgaWYgKHNlbnQgPCAwKQ0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHNlbnQ7DQo+IA0KPiAgICAgICAg
ICAgICAgICAgIGRhdGEgKz0gc2VudDsNCj4gICAgICAgICAgICAgICAgICBsZW4gLT0gc2Vu
dDsNCj4gDQo+ICAgICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KGxlbikpDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICBIWVBFUlZJU09SX3NjaGVkX29wKFNDSEVET1BfeWllbGQs
IE5VTEwpOw0KPiAgICAgICAgICB9DQo+IA0KPiBUaGUgZ29hbCBvZiB0aGlzIHBhdGNoIGlz
IHRvIGFkZCBhIHdheSBmb3IgdGhlIGZyb250ZW5kIHRvIGtub3cgd2hlbiBhDQo+IGNvbnNv
bGUgaXMgY29ubmVjdGVkLiAgVGhpcyBwYXRjaCBhZGRzIGEgbmV3IGZsYWcgdG8gdGhlIGVu
ZCBvZiB0aGUNCj4gY29uc29sZSByaW5nIHN0cnVjdHVyZS4gIEl0IGlzIHVzZWQgZm9yIHRo
ZSBiYWNrZW5kIHRvIGluZGljYXRlIHRoYXQgaXQNCj4gaGFzIGNvbm5lY3RlZCBhbmQgc3Rh
cnRlZCBzZXJ2aWNpbmcgdGhlIHBhZ2UuDQo+IA0KPiBUaGUgdHdvIHZhbHVlcyBhcmUNCj4g
WEVOQ09OU09MRV9ESVNDT05ORUNURUQgMQ0KPiBYRU5DT05TT0xFX0NPTk5FQ1RFRCAgICAw
DQo+IA0KPiBYRU5DT05TT0xFX0RJU0NPTk5FQ1RFRCBpbmRpY2F0ZXMgdG8gdGhlIGd1ZXN0
IHRoYXQgcmluZyBpcw0KPiBkaXNjb25uZWN0ZWQsIHNvIGl0IHdpbGwgbm90IGJlIHNlcnZp
Y2VkLiAgVGhlIGd1ZXN0IGNhbiBhdm9pZCB3cml0aW5nDQo+IGludG8gaXQgaW4gdGhhdCBj
YXNlLiAgQSBkb21VIGNhbiB1c2UgY29uc29sZSBoeXBlcmNhbGxzIGFuZCBvbmx5DQo+IHRy
YW5zaXRpb24gdG8gdGhlIHJpbmcgd2hlbiBpdCBpcyBjb25uZWN0ZWQgYW5kIHdvbid0IGZp
bGwgYW5kIGJsb2NrLg0KPiANCj4gT25jZSB0aGUgYmFja2VuZCAoeGVuY29uc29sZWQpIG1h
cHMgYW5kIHN0YXJ0cyBzZXJ2aWNpbmcgdGhlDQo+IGNvbnNvbGUsIHRoZSBmbGFnIHdpbGwg
YmUgc2V0IHRvIFhFTkNPTlNPTEVfQ09OTkVDVEVEICgwKSB0byBpbmRpY2F0ZQ0KPiB0aGUg
YmFja2VuZCBzdGF0ZSB0byB0aGUgZnJvbnRlbmQuDQo+IA0KPiBUaGUgY29ubmVjdGVkIHZh
bHVlIGFzIDAgd2lsbCBiZSBtYXRjaCB0aGUgZGVmYXVsdCBvZiBhIHplcm8tZWQgY29uc29s
ZQ0KPiBwYWdlLiAgSHlwZXJsYXVuY2ggY2FuIHNldCB0aGUgZmxhZyB0byBYRU5DT05TT0xF
X0RJU0NPTk5FQ1RFRCBhbmQgbGV0DQo+IHhlbmNvbnNvbGVkIHNldCB0byBYRU5DT05TT0xF
X0NPTk5FQ1RFRC4NCg0KSSB0aGluayBsaWJ4ZW5ndWVzdCBzaG91bGQgc2V0IFhFTkNPTlNP
TEVfRElTQ09OTkVDVEVEIGFzIHdlbGwgKHNlZSBiZWxvdykuDQoNCj4gDQo+IE9sZCBkb21V
IGh2Y194ZW4gZHJpdmVycyB3b24ndCBjaGVjayB0aGUgZmxhZy4NCj4gTmV3IGRvbVUgaHZj
X3hlbiBydW5uaW5nIG9uIGEgbmV3IHhlbi94ZW5jb25zb2xlZCB3aWxsIHdvcmsgcHJvcGVy
bHkuDQo+IE5ldyBkb21VIGh2Y194ZW4gb24gb2xkIHhlbi94ZW5jb25zb2xlZCBzaG91bGQg
b25seSBzZWUgYSAwIGZvciB0aGUgZmxhZw0KPiBhbmQgYmVoYXZlIGFzIGlmIGNvbm5lY3Rl
ZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphc29uLmFuZHJ5dWtA
YW1kLmNvbT4NCg0KQWRhcHQgdGhlIHRpdGxlIG9mIHRoZSBwYXRjaD8NCg0KPiAtLS0NCj4g
djE6DQo+IFJlbW92ZSBldnRjaG4gbm90aWZ5IGNhbGwNCj4gU2V0IGNvbm5lY3RlZCBsYXRl
ciB3aGVuIHRoZXJlIGlzIG5vIGVycm9yDQo+IA0KPiBSRkMgdjM6DQo+IEZsaXAgZmxhZyB2
YWx1ZXMgc28gMCBpcyBjb25uZWN0ZWQuDQo+IA0KPiBUaGUgb3RoZXIgb3B0aW9uIHdvdWxk
IGJlIHRvIGFkZDoNCj4gdWludDMyX3QgZmVhdHVyZXMNCj4gdWludDMyX3QgY29ubmVjdGVk
DQo+IA0KPiBOZXcgZG9tVXMgd291bGQgY2hlY2sgZmVhdHVyZXMgZm9yIGEgbWFnaWMgdmFs
dWUgYW5kL29yIGZsYWcgdG8ga25vdw0KPiB0aGV5IGNhbiByZWx5IG9uIGNvbm5lY3RlZCB0
cmFuc2l0aW9uaW5nLg0KPiANCj4gSSB0aGluayBtYWtpbmcgWEVOQ09OU09MRV9DT05ORUNU
RUQgPT0gMCBzaWRlIHN0ZXBzIHRoZSBuZWVkIGZvcg0KPiBhbiBhZGRpdGlvbmFsIGZlYXR1
cmVzIGZpZWxkLiAgQXMgbG9uZyBhcyBhc3N1bWluZyB6ZXJvLWVkIG1lbW9yeSBpcw0KPiBh
Y2NlcHRhYmxlLiAgSG93ZXZlciwgdGhpcyBvbmx5IG1hdHRlcnMgZm9yIGEgaHlwZXJsYXVu
Y2hlZCBndWVzdCAtDQo+IHhlbmNvbnNvbGVkIHdpbGwgbm9ybWFsbHkgcmVhZGlseSBjb25u
ZWN0IHRoZSBjb25zb2xlIGFuZCBzZXQgdGhlIHZhbHVlLg0KDQpJJ2QgbGlrZSB0byBjb25z
aWRlciBvdGhlciBjYXNlcyBhcyB3ZWxsLCBlLmcuIGEgY29uc29sZSBkcml2ZXIgZG9tYWlu
Lg0KU28gYW55IGluc3RhbmNlIGNyZWF0aW5nIGEgZG9tYWluIHdpdGggYSBjb25zb2xlIHJp
bmcgcGFnZSBzaG91bGQgc2V0IHRoZQ0KZmxhZyBpbml0aWFsbHkgdG8gImRpc2Nvbm5lY3Rl
ZCIuDQoNCj4gVGhpcyBhc3N1bWVzIHRoYXQgZXhpc3RpbmcgZnJvbnRlbmRzIGFyZSBub3Qg
dXNpbmcgdGhlIGZsYWcgc3BhY2UgZm9yDQo+IHNvbWUgb3RoZXIgdXNlLg0KPiANCj4gUmVt
b3ZlZCBpZGVhOg0KPiBTZW5kIGFuIGV2ZW50IGNoYW5uZWwgbm90aWZpY2F0aW9uIHRvIGxl
dCB0aGUgZG9tVSBrbm93IHRoYXQgeGVuY29uc29sZWQNCj4gaXMgY29ubmVjdGVkLiAgWGVu
c3RvcmVkIGRvZXMgc2ltaWxhciwgYnV0IGZvciB4ZW5zdG9yZSwgdGhlIHhlbnN0b3JlDQo+
IGRyaXZlciBvd25zIHRoZSBldmVudCBjaGFubmVsL2lycSBhbmQgY2FuIHJlYmluZCBpdC4g
IEZvciBodmNfeGVuLCB0aGUNCj4gaHZjIHN1YnN5c3RlbSBvd25zIHRoZSBpcnEsIHNvIGl0
IGlzbid0IHJlYWRpbHkgYXZhaWxhYmxlIGZvciByZWJpbmRpbmcuDQo+IFRoaXMgaXMgbm90
IGltcGxlbWVudGVkLg0KPiANCj4gSSBoYWQgdGhlIGlkZWEgZm9yIHRoZSBrZXJuZWwgdG8g
dXNlIGEgc3RhdGljIGtleSBhbmQgc3dpdGNoIHdyaXRpbmcNCj4gZnJvbSB0aGUgaHlwZXJj
YWxsIHRvIHRoZSBQViByaW5nIG9uY2UgY29ubmVjdGVkLiAgSXQgZGlkbid0IGFjdHVhbGx5
DQo+IHdvcmsgaW4gbXkgc2hvcnQgYXR0ZW1wdCAtIEkgdGhpbmsgY2hhbmdpbmcgdGhlIHN0
YXRpYyBrZXkgZnJvbSB3aXRoaW4NCj4gYW4gaW50ZXJ1cHQgd2FzIHdyb25nLiAgSSBmZWxs
IGJhY2sgdG8ganVzdCBjaGVja2luZyB0aGUgZmxhZyBkaXJlY3RseQ0KDQpZb3UnZCBuZWVk
IHRvIGRvIHRoZSBzdGF0aWMga2V5IGNoYW5naW5nIGZyb20gYSB3b3JrZXIgdGhyZWFkIGlu
c3RlYWQuDQoNCg0KSnVlcmdlbg0K
--------------XcG6NHiDPGi3iN1i4DinuVjo
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------XcG6NHiDPGi3iN1i4DinuVjo--

--------------1DcwHXzsI00Az91ZQkKI66kj--

--------------wkg6tmIozJljv81Bj40WeEch
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiUTxgFAwAAAAAACgkQsN6d1ii/Ey8I
gwf/SH17iEDgKCnKIzrLhVj+GkMlOF42BJcccp7/t77MK7zGrRhg7mXnBdviRgTVIBNvy27GiDy2
pPbrgZ3JLyCpPGT76s0EbY6S87foPiu2RSprivkLmlqZQ2kchFOB6Ss2Bx7k2+J/AwJ3W1qDsCHI
yygUXZUn0Mt0/3XrIz0rQxw5I/9Pibt+AiU/CGdhV5q+lntTMMAIM1MU7qJHI/gIhA3A6BBkRQ29
GIvhndaSBfKYNeS8UlD/mmrB2LADWhlfaVaVLxkh6Ko/aIycRyvr6jlSvHwavQnHulrLWgZ+2Wvl
cu/zFGN0OGEay8RM4Eb8fGkd9HqomIz3eqFuln1qYA==
=USPK
-----END PGP SIGNATURE-----

--------------wkg6tmIozJljv81Bj40WeEch--

