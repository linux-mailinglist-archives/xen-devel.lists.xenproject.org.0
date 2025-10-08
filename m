Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EDDBC4CF5
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 14:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139610.1474883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6TKx-0007Pv-K0; Wed, 08 Oct 2025 12:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139610.1474883; Wed, 08 Oct 2025 12:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6TKx-0007O0-HM; Wed, 08 Oct 2025 12:32:07 +0000
Received: by outflank-mailman (input) for mailman id 1139610;
 Wed, 08 Oct 2025 12:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGyo=4R=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v6TKv-0007Na-Nz
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 12:32:05 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb73dd15-a442-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 14:32:03 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-631787faf35so13330130a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 05:32:03 -0700 (PDT)
Received: from ?IPV6:2003:e5:873f:400:7b4f:e512:a417:5a86?
 (p200300e5873f04007b4fe512a4175a86.dip0.t-ipconnect.de.
 [2003:e5:873f:400:7b4f:e512:a417:5a86])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b503c779df2sm315950266b.34.2025.10.08.05.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 05:32:02 -0700 (PDT)
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
X-Inumbo-ID: cb73dd15-a442-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759926723; x=1760531523; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHzyZQwBPjGkjshEoi66t2uXNrPo+sDic2boGqNxpI0=;
        b=NLAJhFmjaA6y7KYbDKxBiXOBD9CGB4WzTh3riihkZ70sH3bKdS8ps3DzkHRhe97CGy
         liZ9dxsaoUi4+4gpBQmccMXTrHt3E0cgzeRMpspSDUiTh0cpIpdE19dcT6U5APAjI4Gy
         Vi5vJ0febfcA21sjag4dbZoQeDB1jDCTVy9OjaUURqn3AQpixiRFjNTn2aKTRKCksNIN
         lK8EQoYFm8px4sftaEzXGee0nkrMsRD2uugWwUq8fR3rOroodjR/Zxrg0RJZAtCaeK+n
         07J3GBSx1NAfmgjb1h7EZB2dPay70nXb6wPBw0+yKnvC+7SS0vVoj8IMDopETGSGcF54
         XdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759926723; x=1760531523;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OHzyZQwBPjGkjshEoi66t2uXNrPo+sDic2boGqNxpI0=;
        b=Pj/iQC/i1eRmXVc/ZxGw/75zYsiE+HRZjF+A6wDPEETHetiWsCRlZ+AGANVZSZB1TQ
         ABsg2RlEdmFoKYi/IvjxBU4HPsG/EiAMByqMgYXD2rOWcn8ga/t63Vwjz+iOFeAuN8FA
         3UJH0mIY0dCeruT6pdBpHsSPcvhjR07ipiyUXF8Sx8RmHxmHZLOGD+tLGsWeFkTGI9Sq
         N24JhIGotjpb0bw86UbwDFCbsOwwEBLmtRI5jIMsA6e4nwtzNV6qIygO3agRgja7N7Y0
         /14SjvjiVr6+3V0v767lJnrH9OgZh7mdcOLNa2+M53DwK8VduPhVLGLEDVNl0qWFBlgV
         bwWw==
X-Forwarded-Encrypted: i=1; AJvYcCXH2T5HrVpxboR1tXMPbJiiX+fsn8ACO6DOqajsRXjYpGCUTGrHahfNfRgVEeHc1GcXkX/oAM1AiF4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZG82f9NWWIBa0O74Ja9f0gqKcyUVQgjBoB0u4FSlKoR57nKhZ
	NdIMpFq4CwP9Foxr/La5XvWjRlFn0Vq/B5IVrZJ33XD87oN91W5LOvVXYpOQxoLnsEY=
X-Gm-Gg: ASbGnctQp9NCWbzT6rGCxD0kV6dmeQVx7X6MPW60Jwb9f6Gfp7wBYxeHovC+xKfOuPo
	4J6czWRWP+n8WHzxbV3P3lq6hIu4cF404rG/GSw2ascSEF0YukC+FiTA/Ise7riFB1HXVdxbfWb
	OF5M5Q8KFs/Zbzf6cgAPPDa5TnTAEEI5VNRym+yfvW8g0gyP6wGe8K2PMbRdR5mnLHcZFWEs7VV
	AzlnGFBwF+fiquzapqyHSXgFi2tJMhaF5wjKZv50AeRSNquWxIB1uy2TikI6W7y0sjNqI0R4kFu
	h1lcioR+H4FWC2iS4tgYgQWBt6IXbXblkvHza+lVXzAiX5Ort2p2r/HK0ABj+gCjd66ExxWmd08
	82Ja3noKXVSgCeA2/wM82CNEczHAustYj1TgYI3hmYVyDw0uLlk9Vj4GuG48KpCQV0nAcqDapx+
	ABN+Gr5t3R4mGcQrVcc+8jje8urjrGGM9zYg3hXM2aiSG5HDtPDuIYo4SIFn8q6eUpIU6beNnkZ
	usGhKA=
X-Google-Smtp-Source: AGHT+IFzbd0aUhzCswo+obqr2KQDTzPLbbyXRCDs0z9lrsgK0pf7fXU4mMhzx1Xgi57fmWKQRxXcxw==
X-Received: by 2002:a17:907:d06:b0:b2d:830a:8c09 with SMTP id a640c23a62f3a-b50ac6d0efamr322705166b.44.1759926723127;
        Wed, 08 Oct 2025 05:32:03 -0700 (PDT)
Message-ID: <66d8febb-568b-40db-bbe3-d8dfdc43444c@suse.com>
Date: Wed, 8 Oct 2025 14:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: race condition when re-connecting vif after backend died
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <aOZJhD6_F_ceHoCb@mail-itl>
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
In-Reply-To: <aOZJhD6_F_ceHoCb@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0raJHIBNLI95hlpQrfrZ5cMZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0raJHIBNLI95hlpQrfrZ5cMZ
Content-Type: multipart/mixed; boundary="------------TePLH8R9pcWrXcAG8gxA7Z1S";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <66d8febb-568b-40db-bbe3-d8dfdc43444c@suse.com>
Subject: Re: race condition when re-connecting vif after backend died
References: <aOZJhD6_F_ceHoCb@mail-itl>
In-Reply-To: <aOZJhD6_F_ceHoCb@mail-itl>

--------------TePLH8R9pcWrXcAG8gxA7Z1S
Content-Type: multipart/mixed; boundary="------------qwrDkTY0MgEFLnJe3sqorziJ"

--------------qwrDkTY0MgEFLnJe3sqorziJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMTAuMjUgMTM6MjIsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gSGksDQo+IA0KPiBJIGhhdmUgdGhlIGZvbGxvd2luZyBzY2VuYXJpbzoNCj4gMS4gU3Rh
cnQgYmFja2VuZCBkb21haW4gKGNhbGwgaXQgbmV0dm0xKQ0KPiAyLiBTdGFydCBmcm9udGVu
ZCBkb21haW4gKGNhbGwgaXQgdm0xKSwgd2l0aA0KPiB2aWY9WydiYWNrZW5kPW5ldHZtMixt
YWM9MDA6MTY6M2U6NWU6NmM6MDAsc2NyaXB0PXZpZi1yb3V0ZS1xdWJlcyxpcD0xMC4xMzgu
MTcuMjQ0J10NCj4gMy4gUGF1c2Ugdm0xIChub3Qgc3RyaWN0bHkgcmVxdWlyZWQsIGJ1dCBt
YWtlcyByZXByb2R1Y2luZyBtdWNoIGVhc2llcikNCj4gNS4gQ3Jhc2gvc2h1dGRvd24vZGVz
dHJveSBuZXR2bTENCj4gNC4gU3RhcnQgYW5vdGhlciBiYWNrZW5kIGRvbWFpbiAoY2FsbCBp
dCBuZXR2bTIpDQo+IDUuIEluIHF1aWNrIHN1Y2Nlc3Npb246DQo+ICAgICA1LjEuIHVucGF1
c2Ugdm0xDQo+ICAgICA1LjIuIGRldGFjaCAob3IgYWN0dWFsbHkgY2xlYW51cCkgdmlmIGZy
b20gdm0xIChjb25uZWN0ZWQgdG8gbm93IGRlYWQNCj4gICAgICAgICAgbmV0dm0xKQ0KPiAg
ICAgNS4zLiBhdHRhY2ggc2ltaWxhciB2aWYgd2l0aCBiYWNrZW5kPW5ldHZtMg0KPiANCj4g
U29tZXRpbWVzIGl0IGVuZHMgdXAgd2l0aCBldGgwIGJlaW5nIHByZXNlbnQgaW4gdm0xLCBi
dXQgaXRzIHhlbnN0b3JlDQo+IHN0YXRlIGtleSBpcyBzdGlsbCBYZW5idXNTdGF0ZUluaXRp
YWxpemluZy4gQW5kIHRoZSBiYWNrZW5kIHN0YXRlIGlzIGF0DQo+IFhlbmJ1c1N0YXRlSW5p
dFdhaXQuDQo+IEluIHN0ZXAgNS4yLCBub3JtYWxseSBsaWJ4bCB3YWl0cyBmb3IgdGhlIGJh
Y2tlbmQgdG8gdHJhbnNpdGlvbiB0byBzdGF0ZQ0KPiBYZW5idXNTdGF0ZUNsb3NlZCwgYW5k
IElJVUMgYmFja2VuZCB3YWl0cyBmb3IgdGhlIGZyb250ZW5kIHRvIGRvIHRoZQ0KPiBzYW1l
IHRvby4gQnV0IHdoZW4gdGhlIGJhY2tlbmQgaXMgZ29uZSwgbGlieGwgc2VlbXMgdG8gc2lt
cGx5IHJlbW92ZXMNCj4gZnJvbnRlbmQgeGVuc3RvcmUgZW50cmllcyB3aXRob3V0IGFueSBj
b29yZGluYXRpb24gd2l0aCB0aGUgZnJvbnRlbmQNCj4gZG9tYWluIGl0c2VsZi4NCj4gV2hh
dCBJIHN1c3BlY3QgaGFwcGVucyBpcyB0aGF0IHhlbnN0b3JlIGV2ZW50cyBnZW5lcmF0ZWQg
YXQgNS4yIGFyZQ0KPiBnZXR0aW5nIGhhbmRsZWQgYnkgdGhlIGZyb250ZW5kJ3Mga2VybmVs
IG9ubHkgYWZ0ZXIgNS4zLiAgQXQgdGhpcyBzdGFnZSwNCj4gZnJvbnRlbmQgc2VlcyBkZXZp
Y2UgdGhhdCB3YXMgaXMgWGVuYnVzU3RhdGVDb25uZWN0ZWQgdHJhbnNpdGlvbmluZyB0bw0K
PiBYZW5idXNTdGF0ZUluaXRpYWxpemluZyAobm90IHJlYWxseSBleHBlY3RlZCBieSB0aGUg
ZnJvbnRlbmQgdG8gc29tZWJvZHkNCj4gZWxzZSBjaGFuZ2UgaXRzIHN0YXRlIGtleSkgYW5k
IChJIGd1ZXNzKSBkb2Vzbid0IG5vdGljZSBkZXZpY2UgdmFuaXNoZWQNCj4gZm9yIGEgbW9t
ZW50ICh4ZW5idXNfZGV2X2NoYW5nZWQoKSBkb2Vzbid0IGhpdCB0aGUgIWV4aXN0cyBwYXRo
KS4gSQ0KPiBoYXZlbid0IHZlcmlmaWVkIGl0LCBidXQgSSBndWVzcyBpdCBhbHNvIGRvZXNu
J3Qgbm90aWNlIGJhY2tlbmQgcGF0aA0KPiBjaGFuZ2UsIHNvIGl0J3Mgc3RpbGwgd2F0Y2hp
bmcgdGhlIG9sZCBvbmUgKGdvbmUgYXQgdGhpcyBwb2ludCkuDQo+IA0KPiBJZiBteSBkaWFn
bm9zaXMgaXMgY29ycmVjdCwgd2hhdCBzaG91bGQgYmUgdGhlIHNvbHV0aW9uIGhlcmU/IEFk
ZA0KPiBoYW5kbGluZyBmb3IgWGVuYnVzU3RhdGVVbmtub3duIGluIHhlbi1uZXRmcm9udGMu
YzpuZXRiYWNrX2NoYW5nZWQoKT8gSWYNCj4gc28sIGl0IHNob3VsZCBwcm9iYWJseSBjYXJl
ZnVsbHkgY2xlYW51cCB0aGUgb2xkIGRldmljZSB3aGlsZSBub3QNCj4gdG91Y2hpbmcgeGVu
c3RvcmUgZW50cmllcyAod2hpY2ggYmVsb25nIHRvIHRoZSBuZXcgaW5zdGFuY2UgYWxyZWFk
eSkgYW5kDQo+IHRoZW4gcmUtaW5pdGlhbGl6ZSB0aGUgZGV2aWNlICh4ZW5uZXRfY29ubmVj
dCgpPyBjYWxsKS4NCj4gT3IgbWF5YmUgaXQgc2hvdWxkIGJlIGRvbmUgaW4gZ2VuZXJpYyB3
YXkgaW4geGVuYnVzX3Byb2JlLmMsIGluDQo+IHhlbmJ1c19kZXZfY2hhbmdlZCgpPyBOb3Qg
c3VyZSBob3cgZXhhY3RseSAtIG1heWJlIGJ5IGNoZWNraW5nIGlmDQo+IGJhY2tlbmQgcGF0
aCAob3IganVzdCBiYWNrZW5kLWlkPykgY2hhbmdlZD8gQW5kIHRoZW4gY2FsbCBib3RoDQo+
IGRldmljZV91bnJlZ2lzdGVyKCkgKGFnYWluLCBiZWluZyBjYXJlZnVsIHRvIG5vdCBjaGFu
Z2UgeGVuc3RvcmUsDQo+IGVzcGVjaWFsbHkgbm90IHNldCBYZW5idXNTdGF0ZUNsb3NlZCkg
YW5kIHRoZW4geGVuYnVzX3Byb2JlX25vZGUoKT8NCj4gDQoNCkkgdGhpbmsgd2UgbmVlZCB0
byBrbm93IHdoYXQgaXMgZ29pbmcgb24gaGVyZS4NCg0KQ2FuIHlvdSByZXBlYXQgdGhlIHRl
c3Qgd2l0aCBYZW5zdG9yZSB0cmFjaW5nIGVuYWJsZWQ/IEp1c3QgZG86DQoNCnhlbnN0b3Jl
LWNvbnRyb2wgbG9nZmlsZSAvdG1wL3hzLXRyYWNlDQoNCmJlZm9yZSBwb2ludCAzLiBpbiB5
b3VyIGxpc3QgYWJvdmUgYW5kIHRoZW4gcGVyZm9ybSBzdGVwcyAzLiAtIDUuMy4gYW5kDQp0
aGVuIHNlbmQgdGhlIGxvZ2ZpbGUuIFBsZWFzZSBtYWtlIHN1cmUgbm90IHRvIGhhdmUgYW55
IGFkZGl0aW9uYWwgYWN0aW9ucw0KY2F1c2luZyBYZW5zdG9yZSB0cmFmZmljIGluIGJldHdl
ZW4sIGFzIHRoaXMgd291bGQgbWFrZSBpdCBtdWNoIGhhcmRlciB0bw0KYW5hbHl6ZSB0aGUg
bG9nLg0KDQpJbiBjYXNlIHRoZSBwcm9ibGVtIGRvZXNuJ3QgYXBwZWFyLCBwbGVhc2UgZGVs
ZXRlIHRoZSBsb2dmaWxlIGJlZm9yZQ0Kc3RhcnRpbmcgYSBuZXcgYXR0ZW1wdCAoeGVuc3Rv
cmVkIGlzIGFwcGVuZGluZyBuZXcgdHJhY2UgZGF0YSB0byBhbg0KZXhpc3RpbmcgZmlsZSku
DQoNCg0KSnVlcmdlbg0K
--------------qwrDkTY0MgEFLnJe3sqorziJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------qwrDkTY0MgEFLnJe3sqorziJ--

--------------TePLH8R9pcWrXcAG8gxA7Z1S--

--------------0raJHIBNLI95hlpQrfrZ5cMZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjmWcIFAwAAAAAACgkQsN6d1ii/Ey+9
AQf8C0Ux+/08hFuFL8j7ScykNTVfNbht85NqVqZpAUHGgrwO9ptvqVN7BTdPZ7409cWUKkVBJnfy
XuXEsadTNNaedyTCUITTaN0ZAFi5fs1PaxHKkMyvfjVL1RARPgmcz2rpgGKgrcsJO7gj6qK3Wwlr
LW8G1dPHBDV1zUwF0zr4rNz1aiwOpTOkvNDKaRsmJqZ2JLOiIg3fmICc+UYTynxAG8iwmJNF4Xm4
x/4J2+Eh+9Nr8oqFVdnLHbSDNMUSAb8XmgSEpuLOjviuxPxzf4d3O8HDBsc7gMLU0s5SLt1Oh/T1
+LWrHpzfFdZXUHZQBHK5o7oq4orqTN08TqF1M7Flcw==
=lsuO
-----END PGP SIGNATURE-----

--------------0raJHIBNLI95hlpQrfrZ5cMZ--

