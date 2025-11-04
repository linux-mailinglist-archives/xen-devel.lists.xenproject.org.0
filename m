Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD4EC30F11
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 13:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155749.1485172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGFx2-0005fX-Q0; Tue, 04 Nov 2025 12:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155749.1485172; Tue, 04 Nov 2025 12:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGFx2-0005dM-N8; Tue, 04 Nov 2025 12:15:52 +0000
Received: by outflank-mailman (input) for mailman id 1155749;
 Tue, 04 Nov 2025 12:15:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fmA7=5M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vGFx1-0005dG-JL
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 12:15:51 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffe24194-b977-11f0-9d16-b5c5bf9af7f9;
 Tue, 04 Nov 2025 13:15:49 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so40432875e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Nov 2025 04:15:49 -0800 (PST)
Received: from ?IPV6:2003:e5:870e:1500:7795:3e8a:56c1:ae53?
 (p200300e5870e150077953e8a56c1ae53.dip0.t-ipconnect.de.
 [2003:e5:870e:1500:7795:3e8a:56c1:ae53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47755932134sm16117985e9.14.2025.11.04.04.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 04:15:48 -0800 (PST)
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
X-Inumbo-ID: ffe24194-b977-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762258549; x=1762863349; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wscswWET3PTwL3iV6zIY/JDftXaYCff+IoFh0MKXVJY=;
        b=Srx4TS11fqaM8HBT0XTliRfJ3DqQCkdKbEFak2O6b8VGw88hfu1B8QPMafOPWulGK3
         /0R8wvUhG4SLNAy/3efFfZa7dVgS8ZatvTry868+dvahZjjcB623BPtPeV1IuAHm7QN0
         +FBLGEQczfDL2mfcbmuSO0AVGOxLSbA4vHjOENPEx5xMWkmqDY/lAAAWsgJAuhuS8BoR
         ZvADv/xlw3xp1K1TrSDKJXwfvToycOehqk1mxzQKLPJdENkg3lyEpqz3N+LXCra5jkCm
         FUCjrLAcKNJrQcyuHcvZCc6BxO/RZJD2Xq48SSuJHvYQ34x528XYbywV3bIYXfhS3rWN
         kYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762258549; x=1762863349;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wscswWET3PTwL3iV6zIY/JDftXaYCff+IoFh0MKXVJY=;
        b=llYwfQhRnlevWFVnneiRpwn0v6b/kRabCe92l5kzKThPDA1zYlWK4xPbHC5NJQFYm2
         bPs/clGu796KMpRoLSAAsxfUtVjCXyaZ0K6Sali/Pm/eoTOJPxDlkrRv8LpcursXlTkL
         D9S1bKs0vFtaQ6WydoKA3GOtSY+q+zWDgbig6nnF/QGENIE/pG/AKIUj6h2lVJVLWX/n
         gPneYWNIfnW/JWYpdYc4yrS5Ok0uPaLYOLSaYWGkuCbISrezW1fkcoBwh1tDSnLkLeQP
         CkvdySP/8Umuaz19wq3ZT+VM5UMdvVV8jc4FRQQJ1dsBeY1w9Lr9yL82ViKq/A1iD5xi
         6BQw==
X-Gm-Message-State: AOJu0YxtoglpFvztwC1Rd6pflC76PkYFa/BYjk3xZkBy+LW8yTr8LItQ
	DFZrhUfVu3Q7HBgrhHF2+Zoor/+zTTnRN88jXiLmsd5j0ikXZ6uZZaz0MylpwoZIz6iM5Vzv4R7
	NMnMQE0A=
X-Gm-Gg: ASbGncvtzPGu8x0UMxFjaG9FjL+X2Ofo2AFqqy/3vwasW0lTf1mxaJi/Jou6UTwj/cj
	p2t8jxDoovpXiUz3Ihq9dwzfXMiLvvOO7kaOCmQMG7zkq2HyjLH3IbqD79vU1h9IC3sATZZdRXk
	sp3xx9hldx8sK5X9SSu6tElkOmiUDEqVLvdMFok2XjnBXkToZBbysnw7z5u/m90oKmkViqAm9PJ
	6cXal4zXuA2gXws+KrwWpDzrRPqHLlkDRDX5Kxx7hQrMArhSBbYc3v0NFrSHYCx2/MBF1noboFW
	cj8XKgqFvwmGSWoVIRDjCL8qNo+aufXrnVdt8U3n4gOLCTEEB0JcJUAf1kdbfpVGbGnB6B5cABR
	Kiph5V4HLHJOxL1vXUImpS15mliNrrcfQqWcXJAFKkWr0uY75duXFjmw4qJ10+rGawO8O5PsjKz
	JcEujzg+lHTokAWvBnTMSgQywqgHH7QHJtIS+mpcFW1p+elv0tXSZmmcj7e1S8PemiHrcKLWn+T
	zHw04xBwo9RXAi9fzAWKz5UEOv3
X-Google-Smtp-Source: AGHT+IFkVFJRuEjiMqFf4/CpARUTY3QXDXo3e5IPbj2An858sDLKMOrylFmN1iMuAJXzI4rmMrIX4w==
X-Received: by 2002:a05:600c:8b66:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-477307b6157mr147891605e9.5.1762258548783;
        Tue, 04 Nov 2025 04:15:48 -0800 (PST)
Message-ID: <5a3660c9-1b18-4d87-a1f7-efa8d68239d8@suse.com>
Date: Tue, 4 Nov 2025 13:15:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: privcmd: fix ioeventfd/ioreq crashing PV domain
To: Val Packett <val@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20251015195713.6500-1-val@invisiblethingslab.com>
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
In-Reply-To: <20251015195713.6500-1-val@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MxfdmqHibyPmNwfhiQTVXYEi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MxfdmqHibyPmNwfhiQTVXYEi
Content-Type: multipart/mixed; boundary="------------qLygUuaIx1nTwKKhMjC4Qs0u";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Val Packett <val@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <5a3660c9-1b18-4d87-a1f7-efa8d68239d8@suse.com>
Subject: Re: [RFC PATCH] xen: privcmd: fix ioeventfd/ioreq crashing PV domain
References: <20251015195713.6500-1-val@invisiblethingslab.com>
In-Reply-To: <20251015195713.6500-1-val@invisiblethingslab.com>

--------------qLygUuaIx1nTwKKhMjC4Qs0u
Content-Type: multipart/mixed; boundary="------------48K2HVhLaEkN2URQigHRKy9r"

--------------48K2HVhLaEkN2URQigHRKy9r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMTAuMjUgMjE6NTcsIFZhbCBQYWNrZXR0IHdyb3RlOg0KPiBTdGFydGluZyBhIHZp
cnRpbyBiYWNrZW5kIGluIGEgUFYgZG9tYWluIHdvdWxkIHBhbmljIHRoZSBrZXJuZWwgaW4N
Cj4gYWxsb2NfaW9yZXEsIHRyeWluZyB0byBkZXJlZmVyZW5jZSB2bWEtPnZtX3ByaXZhdGVf
ZGF0YSBhcyBhIHBhZ2VzDQo+IHBvaW50ZXIgd2hlbiBpbiByZWFsaXR5IGl0IHN0YXllZCBh
cyBQUklWX1ZNQV9MT0NLRUQuDQo+IA0KPiBGaXggYnkgYWxsb2NhdGluZyBhIHBhZ2VzIGFy
cmF5IGluIG1tYXBfcmVzb3VyY2UgaW4gdGhlIFBWIGNhc2UsDQo+IGZpbGxpbmcgaXQgd2l0
aCBwYWdlIGluZm8gY29udmVydGVkIGZyb20gdGhlIHBmbiBhcnJheS4gVGhpcyBhbGxvd3MN
Cj4gaW9yZXEgdG8gZnVuY3Rpb24gc3VjY2Vzc2Z1bGx5IHdpdGggYSBiYWNrZW5kIHByb3Zp
ZGVkIGJ5IGEgUFYgZG9tMC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFZhbCBQYWNrZXR0IDx2
YWxAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4NCj4gLS0tDQo+IEkndmUgYmVlbiBwb3J0aW5n
IHRoZSB4ZW4tdmhvc3QtZnJvbnRlbmRbMV0gdG8gUXViZXMsIHdoaWNoIHJ1bnMgb24gYW1k
NjQNCj4gYW5kIHdlIChzdGlsbCkgdXNlIFBWIGZvciBkb20wLiBUaGUgeDg2IHBhcnQgZGlk
bid0IGdpdmUgbWUgbXVjaCB0cm91YmxlLA0KPiBidXQgdGhlIGZpcnN0IHRoaW5nIEkgZm91
bmQgd2FzIHRoaXMgY3Jhc2ggZHVlIHRvIHVzaW5nIGEgUFYgZG9tYWluIHRvIGhvc3QNCj4g
dGhlIGJhY2tlbmQuIGFsbG9jX2lvcmVxIHdhcyBkZXJlZmVyZW5jaW5nIHRoZSAnMScgY29u
c3RhbnQgYW5kIHBhbmlja2luZw0KPiB0aGUgZG9tMCBrZXJuZWwuDQo+IA0KPiBJIGZpZ3Vy
ZWQgb3V0IHRoYXQgSSBjYW4gbWFrZSBhIHBhZ2VzIGFycmF5IGluIHRoZSBleHBlY3RlZCBm
b3JtYXQgZnJvbSB0aGUNCj4gcGZuIGFycmF5IHdoZXJlIHRoZSBhY3R1YWwgbWVtb3J5IG1h
cHBpbmcgaGFwcGVucyBmb3IgdGhlIFBWIGNhc2UsIGFuZCB3aXRoDQo+IHRoZSBmaXgsIHRo
ZSBpb3JlcSBwYXJ0IHdvcmtzOiB0aGUgdmhvc3QgZnJvbnRlbmQgcmVwbGllcyB0byB0aGUg
cHJvYmluZw0KPiBzZXF1ZW5jZSBhbmQgdGhlIGd1ZXN0IHJlY29nbml6ZXMgd2hpY2ggdmly
dGlvIGRldmljZSBpcyBiZWluZyBwcm92aWRlZC4NCj4gDQo+IEkgc3RpbGwgaGF2ZSBhbm90
aGVyIHRoaW5nIHRvIGRlYnVnOiB0aGUgTU1JTyBhY2Nlc3NlcyBmcm9tIHRoZSBpbm5lciBk
cml2ZXINCj4gKGUuZy4gdmlydGlvX3JuZykgZG9uJ3QgZ2V0IHRocm91Z2ggdG8gdGhlIHZo
b3N0IHByb3ZpZGVyIChpb2V2ZW50ZmQgZG9lcw0KPiBub3QgZ2V0IG5vdGlmaWVkKSwgYW5k
IG1hbnVhbGx5IGtpY2tpbmcgdGhlIGV2ZW50ZmQgZnJvbSB0aGUgZnJvbnRlbmQNCj4gc2Vl
bXMgdG8gY3Jhc2guLi4gWGVuIGl0c2VsZj8/IChubyBMaW51eCBwYW5pYyBvbiBjb25zb2xl
LCBqdXN0IGEgZnJlZXplIGFuZA0KPiBxdWljayByZWJvb3QgLSB3aWxsIHRyeSB0byBzZXQg
dXAgYSBzZXJpYWwgY29uc29sZSBub3cpDQoNCklNSE8gZm9yIG1ha2luZyB0aGUgTU1JTyBh
Y2Nlc3NlcyB3b3JrIHlvdSdkIG5lZWQgdG8gaW1wbGVtZW50IGlvcmVxLXNlcnZlcg0Kc3Vw
cG9ydCBmb3IgUFYtZG9tYWlucyBpbiB0aGUgaHlwZXJ2aXNvci4gVGhpcyB3aWxsIGJlIGEg
bWFqb3IgZW5kZWF2b3IsIHNvDQpiZWZvcmUgdGFraW5nIHlvdXIgTGludXgga2VybmVsIHBh
dGNoIEknZCBsaWtlIHRvIHNlZSB0aGlzIGNvdmVyZWQuDQoNCj4gQnV0IEkgZmlndXJlZCBJ
J2QgcG9zdCB0aGlzIGFzIGFuIFJGQyBhbHJlYWR5LCBzaW5jZSB0aGUgb3RoZXIgYnVnIG1h
eSBiZQ0KPiB1bnJlbGF0ZWQgYW5kIHRoZSBpb3JlcSBhcmVhIGl0c2VsZiBkb2VzIHdvcmsg
bm93LiBJJ2QgbGlrZSB0byBoZWFyIHNvbWUNCj4gZmVlZGJhY2sgb24gdGhpcyBmcm9tIHBl
b3BsZSB3aG8gYWN0dWFsbHkga25vdyBYZW4gOikNCg0KTXkgbWFpbiBwcm9ibGVtIHdpdGgg
eW91ciBwYXRjaCBpcyB0aGF0IGl0IGlzIGFkZGluZyBhIG1lbW9yeSBhbGxvY2F0aW9uDQpm
b3IgYSB2ZXJ5IHJhcmUgdXNlIGNhc2UgaW1wYWN0aW5nIGFsbCBjdXJyZW50IHVzZXJzIG9m
IHRoYXQgZnVuY3Rpb25hbGl0eS4NCg0KWW91IGNvdWxkIGF2b2lkIHRoYXQgYnkgdXNpbmcg
YSBkaWZmZXJlbnQgaW9jdGwgd2hpY2ggY291bGQgYmUgc2VsZWN0ZWQgYnkNCnNwZWNpZnlp
bmcgYSBuZXcgZmxhZyB3aGVuIGNhbGxpbmcgeGVuZm9yZWlnbm1lbW9yeV9vcGVuKCkgKGhh
dmUgYSBsb29rDQppbnRvIHRoZSBYZW4gc291cmNlcyB1bmRlciB0b29scy9saWJzL2ZvcmVp
Z25tZW1vcnkvY29yZS5jKS4NCg0KDQpKdWVyZ2VuDQo=
--------------48K2HVhLaEkN2URQigHRKy9r
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------48K2HVhLaEkN2URQigHRKy9r--

--------------qLygUuaIx1nTwKKhMjC4Qs0u--

--------------MxfdmqHibyPmNwfhiQTVXYEi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkJ7nMFAwAAAAAACgkQsN6d1ii/Ey/O
IAgAmw9Dru6v0Ge8dH1Mbt2yjO5ZKeby3ruLVT9ZRyilhZuJZehjJlRwHolcsRuVBemXhnbgUBbJ
fUUCQdV+VLiQkc180O28aWXNd3BoPAiFD+u1UD5DGcmoqFZKz4oUL6h5tmhWOjILPllAODQvIvAY
puWj88O2ylymiuO946AUJhpp/XMcXe7gSKdrhTWrwC+PVPmanpGFEiWTLRYaJobA1jzkexzI+nH1
PmhvNNXc7Vj8VWICsNL+MrnlExmN/RN9iCqQKo8GVjCT1VyDsG0hDTTRT2DS8fOjchkT7SoXQFDj
yR/hvBEMUPwb5opVSCigsnZ2oEWMFHZ3/DA9YordbA==
=khDL
-----END PGP SIGNATURE-----

--------------MxfdmqHibyPmNwfhiQTVXYEi--

