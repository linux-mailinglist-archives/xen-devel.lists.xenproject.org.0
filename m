Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00F5B09AF0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 07:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047933.1418244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucddx-00038D-OB; Fri, 18 Jul 2025 05:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047933.1418244; Fri, 18 Jul 2025 05:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucddx-000365-Km; Fri, 18 Jul 2025 05:28:25 +0000
Received: by outflank-mailman (input) for mailman id 1047933;
 Fri, 18 Jul 2025 05:28:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ucddw-00035z-Ix
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 05:28:24 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04a40966-6398-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 07:28:21 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso1252775f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 22:28:21 -0700 (PDT)
Received: from ?IPV6:2003:e5:8709:f00:6357:915b:11f9:6d20?
 (p200300e587090f006357915b11f96d20.dip0.t-ipconnect.de.
 [2003:e5:8709:f00:6357:915b:11f9:6d20])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca5cfb0sm775118f8f.83.2025.07.17.22.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 22:28:20 -0700 (PDT)
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
X-Inumbo-ID: 04a40966-6398-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752816501; x=1753421301; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zpkdciVKGk8qP7g38jgoLr3wmCg5ibtyVsn6mxeBxjY=;
        b=bZ8wL/QVzFw5R/tBat+OvJ0Wz+LHtINEmDzhVccLU2plAciGjEgCinmyN3QKETpvpO
         pjHHQmIagb9+OAY9uF407XZoegc/pi/njDc4cLkRP5m2r3MXjZtINCoiwg237joWTX6t
         VSOXdpUkAEuPAaFzBv0CCGBXCeVTohkv3kqA6MiBm6xAWAiN46qgjTfkJJlheG2D2/9e
         lO4YSGd/pbeVrGb7CvaeI1rrfoYaR4FFrYIO/ALMcNhSUW059243CYaCFc7jSc1nJzf4
         8rMVugJsUrXru1BNzZs5/T4v78iRUpAB/9XDyvGwilI0m9DvGROHEd3C7fmd8H0/p41K
         orRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752816501; x=1753421301;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zpkdciVKGk8qP7g38jgoLr3wmCg5ibtyVsn6mxeBxjY=;
        b=ugFz2puDhuvtdWhMjjlPaCIAigBKdpo0tLwqKe6OMCPB14zbM7bwkdvTB2ebF1ighl
         AS9HPnyBVv/iuRu1s4Qejhij4gg6vHEvWcvh6xq/94meRDr92oNPpuUjqiwg7ygW1imR
         HDRKL9cP3T2+IxzmtFakwi82mztTd4i3WqLOFNyxtyLkskA+Z5kndayQjtqflY3Rb8ir
         DlQT2Hid4PTKnFDK+mHKcmOdAJi6/RwrFR3MIVddmXBeQSx+lieudU8dWD9purc9ghyh
         +sjSAHUzYkW18CAb0liReCE2w9GwlqRPcYx+wSSz6ZRAlQVZL5CjkNh/pxk/5QPNFxgQ
         0CEA==
X-Forwarded-Encrypted: i=1; AJvYcCVebLjCxOK4DRACx0HHX+/g+tDGf1erk8JZvUxGQNavfdfBF/xtbeg67dKHfyB5Dv5qhTP0Q0BeSL4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsuXtVfDBpBYl+kUnB1Hfj16Nc0ynP2aDQ6EQT/xIzWs1O0YqX
	ejCx1XNEbuFbieycTHtzHvNdnTCYjb23EL3ivy8AW7uXYeZjPZkaEVoS4t7S0hTB3lk=
X-Gm-Gg: ASbGncs8rh+f4CkkpagGvOyeUjtFD1Z/KTApU4SxxiJVihUGkr1pRa+hFGLI2ntSIv4
	jQuyC4bsomEjagbHxpD8esuPWFN50XkRQ4N/otUS9d7jbyRuQ5/pZi2g7Sl0EPISRw0ltUxQ1on
	V/U7RyNj16OX8EzGjnviR98WWdXgfq8NDLBWTgHKg1RRiJoTponmiNGl53Eb4hwvReMC3p+hgaK
	7xvnQLvgYVQB18RILfMhCIJE78xHLurve2Pp66qPpUOKhsxR7Gq2zxmtqKUuN0DUrvvzcgCHmxO
	2AL7sWAKmK6TbGquHb52rooVhIR1lY3+/v/8h4iBiylU0lzdegFCHFKHjbqSG7Y31E5+jZt9zjQ
	CCjD/3JTkvtuo8zLRravtJ0iQK6nOOwV/VZD3f7k8tF5qRdBi+tZomceMoPH8L+FSYBM710QknF
	IUgA+kiL6tIK2bszgQsrW71kmca8YA8LCjtDpZePGy/N5Y
X-Google-Smtp-Source: AGHT+IE1kRJeM7kOu9XwuKbVqxedFRnYQ+IejtrqwwbFK3o1eHLX/Gw9/+y6iLAWgDm85iiWKBLLYg==
X-Received: by 2002:a5d:6f14:0:b0:3a4:f661:c3e0 with SMTP id ffacd0b85a97d-3b60e510baamr6068815f8f.45.1752816500682;
        Thu, 17 Jul 2025 22:28:20 -0700 (PDT)
Message-ID: <43dfdc36-232d-479d-b153-99d55bafea56@suse.com>
Date: Fri, 18 Jul 2025 07:28:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/17] tools/xenstored: Auto-introduce domains
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-15-jason.andryuk@amd.com>
 <5c6cfc84-e1e0-427b-92ec-f01ebda1f4c8@suse.com>
 <16579803-2db0-4d5c-bc03-592b77c61a1b@amd.com>
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
In-Reply-To: <16579803-2db0-4d5c-bc03-592b77c61a1b@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6qCCnngnSHetPm47S7ehbzAQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6qCCnngnSHetPm47S7ehbzAQ
Content-Type: multipart/mixed; boundary="------------aqCB1MR2OwVDBXRCwvjFNsuB";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <43dfdc36-232d-479d-b153-99d55bafea56@suse.com>
Subject: Re: [PATCH v2 14/17] tools/xenstored: Auto-introduce domains
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-15-jason.andryuk@amd.com>
 <5c6cfc84-e1e0-427b-92ec-f01ebda1f4c8@suse.com>
 <16579803-2db0-4d5c-bc03-592b77c61a1b@amd.com>
In-Reply-To: <16579803-2db0-4d5c-bc03-592b77c61a1b@amd.com>

--------------aqCB1MR2OwVDBXRCwvjFNsuB
Content-Type: multipart/mixed; boundary="------------EaA00NfGmOpeYowthIvZow30"

--------------EaA00NfGmOpeYowthIvZow30
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDcuMjUgMjM6MzksIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjUtMDct
MTcgMDQ6NTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBPbiAxNi4wNy4yNSAyMzoxNSwg
SmFzb24gQW5kcnl1ayB3cm90ZToNCj4+PiBSZXBsYWNlIGRvbTBfaW5pdCgpIHdpdGggaW5p
dF9kb21haW5zKCkgd2hpY2ggdXNlcyBsaWJ4ZW5tYW5hZ2UgdG8NCj4+PiBpdGVyYXRlIHRo
cm91Z2ggYWxsIGV4aXN0aW5nIGRvbWFpbnMgYW5kIGludHJvZHVjZSB0aGVtLg0KPj4+DQo+
Pj4gZG9tMF9kb21pZCBpcyB1cGRhdGVkIHdpdGggdGhlIHhlbnN0b3JlIGRvbWFpbiwgc2lu
Y2UgaXQgcmVhbGx5DQo+Pj4gaW5kaWNhdGVzIHRoZSBsb2NhbCBkb21haW4uDQo+Pg0KPj4g
SSBhZ3JlZSB3aXRoIHRoYXQgZXhwbGFuYXRpb24sIGJ1dCBJIHdvbmRlciB3aGV0aGVyIHRo
aXMgZXhwbGFuYXRpb24NCj4+IGRvZXNuJ3QgaW5kaWNhdGUgdGhhdCBhIHJlbmFtZSBvZiB0
aGUgZG9tMF9kb21pZCB2YXJpYWJsZSBpcyB3YW50ZWQsDQo+PiBlLmcuIHRvICJzdG9yZV9k
b21pZCIuDQo+IA0KPiBJJ3ZlIHdyaXR0ZW4gYSBwYXRjaCB1c2luZyAibG9jYWxfZG9taWQi
LCB0aG91Z2ggInN0b3JlX2RvbWlkIiB3b3VsZCBiZSBmaW5lLsKgIEkgDQo+IHVzZWQgImxv
Y2FsIiBzaW5jZSBJIHRob3VnaHQgdGhhdCB3b3VsZCBiZSBiZXR0ZXIgZm9yIGluZGljYXRp
bmcgd2hlbiB3ZSBuZWVkIHRvIA0KPiB1c2UgL3Byb2MveGVuL3hzZF8qIGZvciBhICJsb2Nh
bCIgYWNjZXNzLiBBbmQgZm9yIHhlbnN0b3JlLXN0dWJkb20sIGxvY2FsX2RvbWFpbiANCj4g
d291bGQgdXNlIHRoZSBzcGVjaWFsIGNhc2UgY29kZS4NCg0KSSdkIHByZWZlciBzdG9yZV9k
b21pZC4NCg0KPiANCj4+PiBwcml2X2RvbWlkIGlzIHNldCB0byB0aGUgY29udHJvbCBkb21h
aW4uwqAgVGhpcyBtYWtlcyBpdCBsaW1pdGVkIHRvIGENCj4+PiBzaW5nbGUgZG9tYWluLg0K
Pj4NCj4+IE1heWJlIGFub3RoZXIgY2FuZGlkYXRlIGZvciByZW5hbWluZyAoY3RybF9kb21p
ZD8pLg0KPiANCj4gSSd2ZSBmdXJ0aGVyIGV4cGVyaW1lbnRlZCB3aXRoIHJlcGxhY2luZyBw
cml2X2RvbWlkIGNoZWNrcyB3aXRoIGEgcGVyLWNvbm5lY3Rpb24gDQo+IGlzX3ByaXYgZmxh
Zy7CoCBUaG91Z2ggbm93IHRoYXQgSSd2ZSB3cml0dGVuIHRoYXQgZG93biwgbWF5YmUgd2Ug
ZG9uJ3Qgd2FudCB0byANCj4gc3VwcG9ydCBtdWx0aXBsZSBkb21haW5zIGhhdmluZyBYZW5z
dG9yZSBwcml2aWxlZ2U/DQoNCkF0IGxlYXN0IG5vdCBwZXIgZGVmYXVsdC4gV2hlbiBuZWVk
ZWQgaXQgbWlnaHQgYmUgcG9zc2libGUgdG8gYWRkDQphIG5ldyBwcml2aWxlZ2VkIFhTXyBj
b21tYW5kIHRvIGdyYW50IGFub3RoZXIgZG9tYWluIHRoYXQgc3RhdHVzLg0KDQo+IA0KPj4+
IFRoZXNlIGZlYXR1cmVzIGxldCB4ZW5zdG9yZSBhdXRvbWF0aWNhbGx5IGNvbm5lY3QgYW55
IGV4aXN0aW5nIGRvbWFpbnMsDQo+Pj4gd2hpY2ggbWVhbnMgaXQgZG9lc24ndCBuZWVkIHRv
IGJlIGRvbmUgbWFudWFsbHkgZnJvbSBpbml0LWRvbTBsZXNzLg0KPj4+DQo+Pj4gRm9yIGEg
bGVnYWN5IGRvbTAsIHRoZSByZXN1bHQgc2hvdWxkIGJlIHVuY2hhbmdlZC4NCj4+Pg0KPj4+
IEZvciBhIGxhdGUgeGVuc3RvcmUgc3R1YmRvbSBpdCBzaG91bGQgYWxzbyBiZSB0aGUgc2Ft
ZSwgYnV0IHByaXZfZG9taWQNCj4+PiB3b3VsZCBiZSBzZXQgYXV0b21hdGljYWxseSB0byBj
b250cm9sIGRvbWFpbiAod2hpY2ggZGVmYXVsdCB0byAwDQo+Pj4gbm9ybWFsbHkpLg0KPj4+
DQo+Pj4gQWx3YXlzIHNpZ25hbCB0aGUgZXZlbnQgY2hhbm5lbCBmb3IgaW5pdGlhbCBkb21h
aW5zLsKgIFRoaXMgZ2V0cyBkb20wIChhDQo+Pj4gbG9jYWwgeGVuc3RvcmVkIGRvbWFpbikg
dG8gY29ubmVjdC4NCj4+Pg0KPj4+IEFsc28gYWx3YXlzIHdyaXRlIFhFTlNUT1JFX0NPTk5F
Q1RFRCBzaW5jZSB3ZSBrbm93IHdlIGFyZSBjb25uZWN0ZWQgYXQNCj4+PiB0aGlzIHBvaW50
Lg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSmFzb24gQW5kcnl1ayA8amFzb24uYW5kcnl1
a0BhbWQuY29tPg0KPj4+IC0tLQ0KPj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9jb3JlLmPCoMKg
IHzCoCAyICstDQo+Pj4gwqAgdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jIHwgNDUgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPj4+IMKgIHRvb2xzL3hlbnN0
b3JlZC9kb21haW4uaCB8wqAgMiArLQ0KPj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMzcgaW5z
ZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvdG9v
bHMveGVuc3RvcmVkL2NvcmUuYyBiL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMNCj4+PiBpbmRl
eCA1NTBlODc5YTAwLi44MzU0MDJhZjgxIDEwMDY0NA0KPj4+IC0tLSBhL3Rvb2xzL3hlbnN0
b3JlZC9jb3JlLmMNCj4+PiArKysgYi90b29scy94ZW5zdG9yZWQvY29yZS5jDQo+Pj4gQEAg
LTI3NjIsNyArMjc2Miw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pDQo+
Pj4gwqDCoMKgwqDCoCAvKiBMaXN0ZW4gdG8gaHlwZXJ2aXNvci4gKi8NCj4+PiDCoMKgwqDC
oMKgIGlmICghbGl2ZV91cGRhdGUpIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZG9tYWlu
X2luaXQoLTEpOw0KPj4+IC3CoMKgwqDCoMKgwqDCoCBkb20wX2luaXQoKTsNCj4+PiArwqDC
oMKgwqDCoMKgwqAgaW5pdF9kb21haW5zKCk7DQo+Pj4gwqDCoMKgwqDCoCB9DQo+Pj4gwqDC
oMKgwqDCoCAvKiByZWRpcmVjdCB0byAvZGV2L251bGwgbm93IHdlJ3JlIHJlYWR5IHRvIGFj
Y2VwdCBjb25uZWN0aW9ucyAqLw0KPj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZWQv
ZG9tYWluLmMgYi90b29scy94ZW5zdG9yZWQvZG9tYWluLmMNCj4+PiBpbmRleCA1NDQzYjRl
NjA4Li40NGU5OTdjZWU0IDEwMDY0NA0KPj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlZC9kb21h
aW4uYw0KPj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPj4+IEBAIC0xMjU3
LDIwICsxMjU3LDQ1IEBAIGNvbnN0IGNoYXIgKmdldF9pbXBsaWNpdF9wYXRoKGNvbnN0IHN0
cnVjdCBjb25uZWN0aW9uIA0KPj4+ICpjb25uKQ0KPj4+IMKgwqDCoMKgwqAgcmV0dXJuIGNv
bm4tPmRvbWFpbi0+cGF0aDsNCj4+PiDCoCB9DQo+Pj4gLXZvaWQgZG9tMF9pbml0KHZvaWQp
DQo+Pj4gK3ZvaWQgaW5pdF9kb21haW5zKHZvaWQpDQo+Pj4gwqAgew0KPj4+IC3CoMKgwqAg
ZXZ0Y2huX3BvcnRfdCBwb3J0Ow0KPj4+IC3CoMKgwqAgc3RydWN0IGRvbWFpbiAqZG9tMDsN
Cj4+PiArwqDCoMKgIHVuc2lnbmVkIGludCBkb21pZDsNCj4+PiArwqDCoMKgIHVuc2lnbmVk
IGludCBzdGF0ZTsNCj4+PiArwqDCoMKgIHVuc2lnbmVkIGludCBjYXBzOw0KPj4+ICvCoMKg
wqAgdWludDY0X3QgdW5pcXVlX2lkOw0KPj4+ICsNCj4+PiArwqDCoMKgIHdoaWxlICgheGVu
bWFuYWdlX3BvbGxfY2hhbmdlZF9kb21haW4oeG1faGFuZGxlLCAmZG9taWQsICZzdGF0ZSwg
JmNhcHMsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICZ1bmlxdWVfaWQpKSB7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGV2dGNobl9w
b3J0X3QgcG9ydCA9IDA7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBkb21haW4gKmRv
bWFpbjsNCj4+PiArDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChjYXBzICYgWEVOTUFOQUdF
X0dFVERPTVNUQVRFX0NBUF9YRU5TVE9SRSkNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkb20wX2RvbWlkID0gZG9taWQ7DQo+Pj4gKw0KPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAo
Y2FwcyAmIFhFTk1BTkFHRV9HRVRET01TVEFURV9DQVBfQ09OVFJPTCkNCj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwcml2X2RvbWlkID0gZG9taWQ7DQo+Pj4gLcKgwqDCoCBwb3J0
ID0gZ2V0X3hlbmJ1c19ldnRjaG4oKTsNCj4+PiAtwqDCoMKgIGlmIChwb3J0ID09IC0xKQ0K
Pj4+IC3CoMKgwqDCoMKgwqDCoCBiYXJmX3BlcnJvcigiRmFpbGVkIHRvIGluaXRpYWxpemUg
ZG9tMCBwb3J0Iik7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChkb21pZCA9PSBkb20wX2Rv
bWlkKSB7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG9ydCA9IGdldF94ZW5idXNf
ZXZ0Y2huKCk7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHBvcnQgPT0gLTEp
DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiYXJmX3BlcnJvcigiRmFp
bGVkIHRvIGluaXRpYWxpemUgZG9tJXUgcG9ydCIsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9taWQpOw0KPj4+ICvCoMKgwqDCoMKg
wqDCoCB9DQo+Pg0KPj4gSSBkb24ndCB0aGluayB0aGlzIGlzIGNvcnJlY3QgZm9yIGEgeGVu
c3RvcmUtc3R1YmRvbS4gU2VlIHN0dWJkb21faW5pdCgpLg0KPiANCj4gWWVzLCB5b3UgYXJl
IHJpZ2h0LsKgIFRoZXJlIGlzIGEgbWlzbWF0Y2ggd2hlcmUgZm9yIHhlbnN0b3JlZCwgZG9t
MF9kb21pZCBtZWFucyANCj4gdGhlIGxvY2FsIGRvbWFpbiwgYnV0IGZvciBzdHViZG9tLCBk
b20wX2RvbWlkIGlzIGRvbTAuwqAgSSBoYXZlIHNvbWUgZnVydGhlciANCj4gY2hhbmdlcyBJ
IG5lZWQgdG8gcmV2aXNpdCB0aGF0IHdvcmsgdG8gYWRkcmVzcyB0aGF0LiBCYXNpY2FsbHks
IG1ha2UgbWluaW9zLmMgDQo+IGFuZCBwb3NpeC5jIG9ubHkgaGFuZGxlIHRoZSAibG9jYWwi
IGNhc2UuIEFueXRoaW5nIHRoYXQgaXMgbm90IGxvY2FsIGlzIGp1c3QgYSANCj4gZ3JhbnQg
bWFwLsKgIFdpdGggdGhhdCBpbiBwbGFjZSwgc3R1YmRvbV9pbml0KCkgZG9lcyBub3QgbmVl
ZCBhbiANCj4gaW50cm9kdWNlX2RvbWFpbigpIGNhbGwuDQoNCkkgYWdyZWUgd2l0aCB0aGF0
IGFwcHJvYWNoLg0KDQo+IA0KPiBJIHRoaW5rIEkgaGFkbid0IGZpZ3VyZWQgb3V0IGV4YWN0
bHkgaG93IHRvIGhhbmRsZSB0aGUgZG9tMCBldmVudCBjaGFubmVsIHBhc3NlZCANCj4gb24g
dGhlIGNvbW1hbmQgbGluZSB0byB0aGUgc3R1YmRvbS4NCj4gDQo+Pj4gKw0KPj4+ICvCoMKg
wqDCoMKgwqDCoCBkb21haW4gPSBpbnRyb2R1Y2VfZG9tYWluKE5VTEwsIGRvbWlkLCBwb3J0
LCBmYWxzZSk7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghZG9tYWluKSB7DQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgeHByaW50ZigiQ291bGQgbm90IGluaXRpYWxpemUgZG9t
JXUiLCBkb21pZCk7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7DQo+
IA0KPiBJIG5lZWQgdG8gZXhwYW5kIHRoZSBjb21taXQgbWVzc2FnZSB0byBtZW50aW9uIHRo
aXMgY2hhbmdlLsKgIEhlcmUgSSBtYWRlIGZhaWx1cmUgDQo+IG5vbi1mYXRhbCBzaW5jZSBm
b3IgQVJNIHRoZXJlIGNhbiBiZSBkb21haW5zIHdpdGhvdXQgeGVuc3RvcmUgYWNjZXNzLsKg
IFRoZXkgY2FuIA0KPiBiZSBpZGVudGlmaWVkIGJ5IGFuIGh2bV9wYXJhbSwgYnV0IHhlbnN0
b3JlIGRvZXNuJ3QgaGF2ZSBwZXJtaXNzaW9uIHRvIHJlYWQgDQo+IHRob3NlLsKgIEhlcmUg
aW50cm9kdWNlX2RvbWFpbigpIGlzIGNhbGxlZCBvbiB0aGVtLCBhbmQgdGhlIGdyYW50IG1h
cHBpbmcgZmFpbHMuICANCj4gU28gd2Ugbm90ZSB0aGUgZXJyb3IgaGVyZSBhbmQgY29udGlu
dWUgb24uDQoNClJpZ2h0LCBidXQgSSB0aGluayB5b3Ugc2hvdWxkIHByaW50IGVycm5vIGFz
IHdlbGwsIHdoaWNoIG1lYW5zIHRoYXQgeW91DQpuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IGVy
cm5vIGlzIHNldCB0byBhIHNwZWNpZmljIHZhbHVlIGluIGNhc2UgdGhlDQptYXBwaW5nIGZh
aWxzLg0KDQpUaGlzIG1pZ2h0IGJlIG5lZWRlZCB0byBkaXN0aW5ndWlzaCB0aGlzIGNhc2Ug
ZnJvbSBvdGhlciBlcnJvcnMsIGxpa2UNCkVOT01FTSAod2hpY2ggd291bGQgYmUgcmF0aGVy
IHN0cmFuZ2UgYXQgdGhpcyBlYXJseSBwaGFzZSwgdGhvdWdoKS4NCg0KDQpKdWVyZ2VuDQo=

--------------EaA00NfGmOpeYowthIvZow30
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------EaA00NfGmOpeYowthIvZow30--

--------------aqCB1MR2OwVDBXRCwvjFNsuB--

--------------6qCCnngnSHetPm47S7ehbzAQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh523MFAwAAAAAACgkQsN6d1ii/Ey/p
qwf7BNZB7Ex9/svfZD8bTcA7TMNndt9Dx+lN4yvcKwcaQw/TuttVfEk7x4JZb1v8HU+aw1xYG10Y
K6GCsw3D+P8xtrOFwp1bHzdf0lM0d6Ut3hPzDbYK3ksfeWO1Yvu5yndSS/lZK6Sl7wvJC9853fTv
LzhRi5WMbLk30togWjRH1oQm3bAcbSCeBOUiM7KoN9Zt/GcgsslQa0l+/tPx4hn21c+gwYNolX2o
alWZrCQ163gmE9gAG8bCYtwbhlWByp5FCc+tvhP5bI57j052ZRi2ime7DO3jOk+gkQthpR4Yx41u
RUXlEX0ajVBzBHEnRKsgA+IS7QGfiXIaUc84U/Sl7w==
=bXS6
-----END PGP SIGNATURE-----

--------------6qCCnngnSHetPm47S7ehbzAQ--

