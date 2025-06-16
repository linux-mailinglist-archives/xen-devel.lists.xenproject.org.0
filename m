Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B5BADA8F4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 09:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016757.1393694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3xY-0002Kj-0a; Mon, 16 Jun 2025 07:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016757.1393694; Mon, 16 Jun 2025 07:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3xX-0002J0-T7; Mon, 16 Jun 2025 07:08:47 +0000
Received: by outflank-mailman (input) for mailman id 1016757;
 Mon, 16 Jun 2025 07:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR3xW-0002Ip-PH
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 07:08:46 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdb6ae20-4a80-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 09:08:44 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c8cso7525755a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 00:08:44 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b?
 (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de.
 [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adfade680d4sm444697866b.10.2025.06.16.00.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 00:08:43 -0700 (PDT)
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
X-Inumbo-ID: bdb6ae20-4a80-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750057724; x=1750662524; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+I72yCiZvSZ5VQ3Cp8cHIMHwkk7sv/Vv9aJvu6F9c3U=;
        b=J2NSHn9J79EQ+h9dR4aYBSu8zmhleVtKDn3ZPrn6c3j7x94CmwAwcPUSW4OYErBKET
         NjueBMEwJsW47KYqJ8AW864qaU1Gxh3wI1LmMnRZGwxLtYNft9M0bxlYy24VISd1EEQU
         TG+zxxhYHvu4+2EeEOJe5HT/N1048//GDgynPpclHetWTai/r/YSNZcLEKbXRi6whO1x
         5Uh/+KFSOwCkpyACpSmx7fPj+gyLWOK0TTyiehAODiB+v+4jsAuLk51l2IX3VoNrmryG
         QoJoLN7cOHmEA3BvdGOdaGxUIDrrmJ6QJqQrivcfqXrpO0Cj+r16zkq/K/2jW0TcT8/t
         bIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057724; x=1750662524;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+I72yCiZvSZ5VQ3Cp8cHIMHwkk7sv/Vv9aJvu6F9c3U=;
        b=evk2t/rVsbB+pO+vC0MoJYp3AG0DIBSIdp3PfQI6jKx3wP/LB4ngeyvfHJABIOeFEx
         vfszOpvbQNwyHtggFdAhc1xJk/aCFcRPfva5Pgi/cRj0S1uN7cIEWTe7qx6UIBwHS6EH
         B9okL1pddBMWzNFdWzAqb28Owr71TZoBRcUhSiF9bbLnCLiG17/+mzHicgEtuGV54bix
         mQEU2Mj9sglJHzemLnd+sDgGwwVJ10wdxpo8Iso+30u8FMZDNMVdNFESlgnmp/2iOOvw
         t+nX8nA7qfw0dO5TFrHh21sl9q9o1EueyluYgT03TF+6Y/TQbMlU31LVhWikP47MJ0Ah
         NzvA==
X-Forwarded-Encrypted: i=1; AJvYcCVvzcv2bRIPGodKU2yKN42lFTf70JBO6u5VvUilhjfaAsZ4kiQMDTR/9TF4iQXTtYobnDt44AfmKDY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUBstDGUgt1DdlgkdAsT8g/8xlFU2AON/hG2NysjNtxifRxvwJ
	ilzMgon+4nmnSA+kyY+8yp8iNgtwkbZ8KB9ercSglG4MLChvNXCPcrWJfgrbsDcFrWU=
X-Gm-Gg: ASbGnctXBcizTvQcYkj8bN2GeKXYN+GDqMNRyW+lJpuS2jryokYL3CJFGzyC8Oi2mWc
	aPgM20JPfqqaaxGBfWj+mS69YkQMUdW/wpFqlMr/MBFTnVtWr2CVJmMgbgObqWIfC7w1vgn0w1N
	+pChDM6QBPsJFmj7JZGYdpNmX2u6jd1e/ZuxTu9dSG3SRtOZSzG46hAtIb/1QlgNg5Fl06fzvOq
	+jelWfDDRxfNt82DgaymrndH8qjiLombWkHPztUcwBqSsSm7rLku4uR3Q5qwO2nb5/FcRmqLcQe
	Fv6Ry99wTl1swwI7Me+0TYOCu9PxpR8Ai2d9E1fxlx8H17tCZ7i1aDNgnxWfFMQHZ6ulCvQRYTR
	o6ZpjbFrjVTbKwsK7kVGfdCAwgusiq+ezVzVJ087Ij6zdZ1eZQKTeSAsvJMh+Q9bxaABOSXWGRd
	954CXDRHg4rXA=
X-Google-Smtp-Source: AGHT+IH+hFESYGI9L7mtofpdwV3qW0INSv2cqjLVh+LZoJkQyU1vr2nsEp36MHdl86wZlvrtS0RXeg==
X-Received: by 2002:a17:907:86ac:b0:ad5:6c54:1147 with SMTP id a640c23a62f3a-adfad4bf5cemr817834266b.48.1750057724215;
        Mon, 16 Jun 2025 00:08:44 -0700 (PDT)
Message-ID: <fa0c7252-9773-4609-9999-35ef97905c6c@suse.com>
Date: Mon, 16 Jun 2025 09:08:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 11/12] kexec: add kexec callback functionality
To: Jason Andryuk <jandryuk@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org
References: <20250321092451.17309-1-jgross@suse.com>
 <20250321092451.17309-12-jgross@suse.com>
 <CAKf6xpsi++LOh-s3F7ZWUp-orBYg+WdmNEe+EMG_-T2=NVvRVw@mail.gmail.com>
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
In-Reply-To: <CAKf6xpsi++LOh-s3F7ZWUp-orBYg+WdmNEe+EMG_-T2=NVvRVw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------H612b77uQVqqYckaSTQjK0uU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------H612b77uQVqqYckaSTQjK0uU
Content-Type: multipart/mixed; boundary="------------40zEQulrY1Z6J1ybyE76v00m";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org
Message-ID: <fa0c7252-9773-4609-9999-35ef97905c6c@suse.com>
Subject: Re: [MINI-OS PATCH 11/12] kexec: add kexec callback functionality
References: <20250321092451.17309-1-jgross@suse.com>
 <20250321092451.17309-12-jgross@suse.com>
 <CAKf6xpsi++LOh-s3F7ZWUp-orBYg+WdmNEe+EMG_-T2=NVvRVw@mail.gmail.com>
In-Reply-To: <CAKf6xpsi++LOh-s3F7ZWUp-orBYg+WdmNEe+EMG_-T2=NVvRVw@mail.gmail.com>

--------------40zEQulrY1Z6J1ybyE76v00m
Content-Type: multipart/mixed; boundary="------------6Rcz6J9JWIKVOyIRACiCip21"

--------------6Rcz6J9JWIKVOyIRACiCip21
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDYuMjUgMTk6MzQsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIEZyaSwgTWFy
IDIxLCAyMDI1IGF0IDU6MzLigK9BTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOg0KPj4NCj4+IEFkZCBhIGtleGVjX2NhbGwoKSBtYWNybyB3aGljaCB3aWxsIHBy
b3ZpZGUgdGhlIGNhcGFiaWxpdHkgdG8gcmVnaXN0ZXINCj4+IGEgZnVuY3Rpb24gZm9yIGJl
aW5nIGNhbGxlZCB3aGVuIGRvaW5nIGEga2V4ZWMoKSBjYWxsLiBUaGUgY2FsbGVkDQo+PiBm
dW5jdGlvbnMgd2lsbCBiZSBjYWxsZWQgd2l0aCBhIGJvb2xlYW4gcGFyYW1ldGVyICJ1bmRv
IiBpbmRpY2F0aW5nDQo+PiB3aGV0aGVyIGEgcHJldmlvdXMgY2FsbCBuZWVkcyB0byBiZSB1
bmRvbmUgZHVlIHRvIGEgZmFpbHVyZSBkdXJpbmcNCj4+IGtleGVjKCkuDQo+Pg0KPj4gVGhl
IHJlbGF0ZWQgbG9vcCB0byBjYWxsIGFsbCBjYWxsYmFja3MgaXMgYWRkZWQgdG8ga2V4ZWMo
KS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+DQo+IA0KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L21tLmMgYi9hcmNoL3g4Ni9tbS5j
DQo+PiBpbmRleCBmNDQxOWQ5NS4uMjZlZGU2ZjQgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3g4
Ni9tbS5jDQo+PiArKysgYi9hcmNoL3g4Ni9tbS5jDQo+PiBAQCAtNTI5LDcgKzUyOSw4IEBA
IHZvaWQgY2hhbmdlX3JlYWRvbmx5KGJvb2wgcmVhZG9ubHkpDQo+PiAgICNlbmRpZg0KPj4g
ICAgICAgfQ0KPj4NCj4+IC0gICAgcHJpbnRrKCJzZXR0aW5nICVwLSVwIHJlYWRvbmx5XG4i
LCAmX3RleHQsICZfZXJvZGF0YSk7DQo+PiArICAgIHByaW50aygic2V0dGluZyAlcC0lcCAl
c1xuIiwgJl90ZXh0LCAmX2Vyb2RhdGEsDQo+PiArICAgICAgICAgICByZWFkb25seSA/ICJy
ZWFkb25seSIgOiAid3JpdGFibGUiKTsNCj4gDQo+IE9oLCBJIHRoaW5rIHRoaXMgYmVsb25n
cyBpbiB0aGUgZWFybGllciBjaGFuZ2UuDQoNCkluZGVlZC4NCg0KPiANCj4gV2l0aCB0aGF0
IG1vdmVkLCB0aGlzIG9uZSAoYW5kIHRoZSBlYXJsaWVyIG9uZSBzdGlsbCkNCj4gDQo+IENv
ZGUgd2lzZToNCj4gUmV2aWV3ZWQtYnk6IEphc29uIEFuZHJ5dWsgPGphc29uLmFuZHJ5dWtA
YW1kLmNvbT4NCj4gDQo+IEJ1dCB0aGlzIGtleGVjX2NhbGwoKSBtYWNybyBpc24ndCBhY3R1
YWxseSB1c2VkPyAgeGVuc3RvcmUgbmVlZHMgdGhpcw0KPiB0byBwcmVwYXJlIGZvciBrZXhl
Yz8NCg0KVGhpcyB3aWxsIGJlIG5lZWRlZCB0byBlLmcuIGhhbmRsZSBGRF9DTE9FWEVDLg0K
DQoNCkp1ZXJnZW4NCg==
--------------6Rcz6J9JWIKVOyIRACiCip21
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------6Rcz6J9JWIKVOyIRACiCip21--

--------------40zEQulrY1Z6J1ybyE76v00m--

--------------H612b77uQVqqYckaSTQjK0uU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhPwvsFAwAAAAAACgkQsN6d1ii/Ey/R
0wf/YBtyrU3c5JaOQCwWK88TyKVhJ4VqCEFa5VNaON92BrFiyU5dl8uN5O/USeg7VeRvuTfrQDHb
C0Ry2LHgA4xekllfN4Ytia9SDZxZ1TtSibqh9w1u8M6l+o8xSEJuJ4BqPHXcN1TQ1fm8JqGJI2jV
Q6M+ba8W2ZydO8Nz78FKtARC1Js4xRtO60gyKlMev+b1HxcxMZqIZpQoKbwy6B/gxpKE3xZiCrep
Z2vFfmIQc3QvSmP0DwJaXvDmj+s8M8e90SQI7wED+JqNISU1y0de5VrYeRlH0WUVgsl9UMBfUuw+
w8kNkVYm8RI+LlIeur+P7OKorVNohIkFvJe+6gTP3g==
=I7VR
-----END PGP SIGNATURE-----

--------------H612b77uQVqqYckaSTQjK0uU--

