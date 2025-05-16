Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E66D3AB9DBA
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 15:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987196.1372622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFvL1-0002XJ-7h; Fri, 16 May 2025 13:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987196.1372622; Fri, 16 May 2025 13:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFvL1-0002US-4w; Fri, 16 May 2025 13:42:59 +0000
Received: by outflank-mailman (input) for mailman id 987196;
 Fri, 16 May 2025 13:42:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d412=YA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uFvL0-0002UM-1S
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 13:42:58 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac924069-325b-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 15:42:56 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3a0bd7f4cd5so1975905f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 06:42:56 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b?
 (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de.
 [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f8ab839esm68011645e9.17.2025.05.16.06.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 06:42:55 -0700 (PDT)
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
X-Inumbo-ID: ac924069-325b-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747402976; x=1748007776; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yo12YD/EeNnxhz289hdmLpNy6oxcFoxCiS3jEAs1NK0=;
        b=IT0TMyaVSdwhzi/JRRwCQzL6MdQQh7HL3PBC3DF8n9GfFUaPl+apqeCCcQrq1f3FLg
         yHewglhblojt7xfb9ZD9tsfwzAFctMZ//RRdRRSIBCz1LSjCGGoVCeqRKZRYtYt5Jlrk
         ZAd0LpyvZYimoZNqeBHheGfWxTOWyEefk+twfElxFdXDEqhqimDjKGsrmDQFo1icfjas
         EXa9fKBZUSRcN5t9akXosfcCjyBp6C81HHyW5du6hVsU5HHD0BmjRCRKkaXn8MFdTcv2
         Y/RXXBFme5c48UlWkMGOxNmkJUSkNIXICCOFS6R4rsyaCYLNljnwJMkywH9vzQam2DUM
         zwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402976; x=1748007776;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yo12YD/EeNnxhz289hdmLpNy6oxcFoxCiS3jEAs1NK0=;
        b=YDbVvOWLTqasiW9PpH8VfQsHXbikGg9QGtedrNWJew+vT3SoeJw8RW6TXE83ZRTXRz
         v5ytA63MoH8bS+paIKnRiq5VOnYMCOLte1NnCuSFxKQmhpNIduDT3rDooG+2867gwv0h
         +aFAWQdyx6YgGOLZl8+aEwATJF0MkeCGyaPFmmcDiMIvcw6W2063zgsMHc177R7DS3pa
         qtRQhIt7WZplayaqRCglSVGcUuY0nwx2nA7AbVXA0SfcvtMVijW6i1DkfrKF1DKvvViP
         62/4lXO4v1oI6AuKTxuyv9sRFAqlYjpokZ/gjLgbD0b3FRlz4bIUqb4H9W7ZyLPBTENK
         b3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVdA9t0FP41MM1519mH/6TH9h75jzOTAyhYmffJVOEW2mTAfH5q2+4RSB170qle9NVkMDf5qYhIN/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwM2kvqECk4z67yjqUVXOlbcflzi2WpU+RKXt4h66jNiTQJ6BbK
	P8DsFfsakruQMEMV0Cyk9rL7GtxjTrHuPVDvW5qhUhkpsYqiIgBw2/9wdU6VIsYOCis=
X-Gm-Gg: ASbGncsak2k1WDJuW9/qY4VKAdwa86WWwCcFAGuZDcDkOyKuxsFQ3Zn54qEg6lgHATw
	ikBRJs/znti4U1WPk/ck7/bSqO4Y3PE4A1FD6RClPMe2gL1jFDTlBRhX2F22TRBFu1hd7tDHiS/
	nHhFf6AWUmkcmijUZ8XS0kHEgY74SxkGDeSt/QeQN26+jGMWwwDxcaS9pPcu0pEx0A/f/ff2SQa
	VjhQ0JMs24QGZnlkWzyqFLQQNBu87ikM20Q7TwPxQtmu/iRSg5OnvGkwPXRXoU3s0ztJE9+zxRg
	lMyTyoJivaQW5RKZujhlYiJxHblNZ/82+KCEiuJk/hSxe4JxtVCYd78M7JR3upfUynQxDaG2Qeg
	QKlAgV2beI33GgIMxwEj1cd3jVQnuYOSRqVidTQ5mdf9xmhjm/Rryh8p8XTFJPWeWGItxzVAF6u
	Yt
X-Google-Smtp-Source: AGHT+IGMcbLo75Lu+7Igu/BA62qo1z5kNbNummd8n2M2O9qqMvMW86VfecgeGjv0GPu5gqB62yvszg==
X-Received: by 2002:a5d:5f54:0:b0:3a3:64b9:2b87 with SMTP id ffacd0b85a97d-3a364b92c18mr151340f8f.8.1747402976122;
        Fri, 16 May 2025 06:42:56 -0700 (PDT)
Message-ID: <ae1d05f6-cd65-4ca4-87c5-af0ae34e21ce@suse.com>
Date: Fri, 16 May 2025 15:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] x86/xen/msr: Fix uninitialized symbol 'err'
To: Xin Li <xin@zytor.com>, Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, tglx@linutronix.de, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 peterz@infradead.org, boris.ostrovsky@oracle.com, rafael@kernel.org,
 lenb@kernel.org
References: <20250512084552.1586883-1-xin@zytor.com>
 <20250512084552.1586883-3-xin@zytor.com> <aCYIblffvBGUuxWf@gmail.com>
 <30affad5-4f26-4e22-9d64-b8ece1199773@zytor.com>
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
In-Reply-To: <30affad5-4f26-4e22-9d64-b8ece1199773@zytor.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PgiYR0j8o8tgjsYaNHIycWKK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PgiYR0j8o8tgjsYaNHIycWKK
Content-Type: multipart/mixed; boundary="------------77fm8ZAPfoKwkw5C0Tyy8C7B";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Xin Li <xin@zytor.com>, Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, tglx@linutronix.de, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 peterz@infradead.org, boris.ostrovsky@oracle.com, rafael@kernel.org,
 lenb@kernel.org
Message-ID: <ae1d05f6-cd65-4ca4-87c5-af0ae34e21ce@suse.com>
Subject: Re: [PATCH v1 2/3] x86/xen/msr: Fix uninitialized symbol 'err'
References: <20250512084552.1586883-1-xin@zytor.com>
 <20250512084552.1586883-3-xin@zytor.com> <aCYIblffvBGUuxWf@gmail.com>
 <30affad5-4f26-4e22-9d64-b8ece1199773@zytor.com>
In-Reply-To: <30affad5-4f26-4e22-9d64-b8ece1199773@zytor.com>

--------------77fm8ZAPfoKwkw5C0Tyy8C7B
Content-Type: multipart/mixed; boundary="------------DXvRsuOKe4mFw5cdW3f0xAAU"

--------------DXvRsuOKe4mFw5cdW3f0xAAU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDUuMjUgMjA6MTEsIFhpbiBMaSB3cm90ZToNCj4gT24gNS8xNS8yMDI1IDg6Mjkg
QU0sIEluZ28gTW9sbmFyIHdyb3RlOg0KPj4NCj4+ICogWGluIExpIChJbnRlbCkgPHhpbkB6
eXRvci5jb20+IHdyb3RlOg0KPj4NCj4+PiB4ZW5fcmVhZF9tc3Jfc2FmZSgpIGN1cnJlbnRs
eSBwYXNzZXMgYW4gdW5pbml0aWFsaXplZCBhcmd1bWVudCBlcnIgdG8NCj4+PiB4ZW5fZG9f
cmVhZF9tc3IoKS7CoCBCdXQgYXMgeGVuX2RvX3JlYWRfbXNyKCkgbWF5IG5vdCBzZXQgdGhl
IGFyZ3VtZW50LA0KPj4+IHhlbl9yZWFkX21zcl9zYWZlKCkgY291bGQgcmV0dXJuIGVyciB3
aXRoIGFuIHVucHJlZGljdGFibGUgdmFsdWUuDQo+Pj4NCj4+PiBUbyBlbnN1cmUgY29ycmVj
dG5lc3MsIGluaXRpYWxpemUgZXJyIHRvIDAgKHJlcHJlc2VudGluZyBzdWNjZXNzKQ0KPj4+
IGluIHhlbl9yZWFkX21zcl9zYWZlKCkuDQo+Pj4NCj4+PiBCZWNhdXNlIHhlbl9yZWFkX21z
cl9zYWZlKCkgaXMgZXNzZW50aWFsbHkgYSB3cmFwcGVyIG9mIHhlbl9kb19yZWFkX21zcigp
LA0KPj4+IHRoZSBsYXR0ZXIgc2hvdWxkIGJlIHJlc3BvbnNpYmxlIGZvciBpbml0aWFsaXpp
bmcgdGhlIHZhbHVlIG9mICplcnIgdG8gMC4NCj4+PiBUaHVzIGluaXRpYWxpemUgKmVyciB0
byAwIGluIHhlbl9kb19yZWFkX21zcigpLg0KPj4+DQo+Pj4gRml4ZXM6IDUwMmFkNmU1YTYx
OSAoIng4Ni9tc3I6IENoYW5nZSB0aGUgZnVuY3Rpb24gdHlwZSBvZiANCj4+PiBuYXRpdmVf
cmVhZF9tc3Jfc2FmZSgpIikNCj4+PiBSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFu
LmNhcnBlbnRlckBsaW5hcm8ub3JnPg0KPj4+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcveGVuLWRldmVsL2FCeE5JX1EwLU1odEJTWkdAc3RhbmxleS5tb3VudGFpbi8NCj4+
PiBTaWduZWQtb2ZmLWJ5OiBYaW4gTGkgKEludGVsKSA8eGluQHp5dG9yLmNvbT4NCj4+PiAt
LS0NCj4+PiDCoCBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgfCA1ICsrKystDQo+Pj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+
DQo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyBiL2FyY2gv
eDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYw0KPj4+IGluZGV4IDNiZTM4MzUwZjA0NC4uMDFmMWQ0
NDEzNDdlIDEwMDY0NA0KPj4+IC0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYw0K
Pj4+ICsrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYw0KPj4+IEBAIC0xMDkxLDYg
KzEwOTEsOSBAQCBzdGF0aWMgdTY0IHhlbl9kb19yZWFkX21zcih1MzIgbXNyLCBpbnQgKmVy
cikNCj4+PiDCoCB7DQo+Pj4gwqDCoMKgwqDCoCB1NjQgdmFsID0gMDvCoMKgwqAgLyogQXZv
aWQgdW5pbml0aWFsaXplZCB2YWx1ZSBmb3Igc2FmZSB2YXJpYW50LiAqLw0KPj4+ICvCoMKg
wqAgaWYgKGVycikNCj4+PiArwqDCoMKgwqDCoMKgwqAgKmVyciA9IDA7DQo+Pj4gKw0KPj4+
IMKgwqDCoMKgwqAgaWYgKHBtdV9tc3JfY2hrX2VtdWxhdGVkKG1zciwgJnZhbCwgdHJ1ZSkp
DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB2YWw7DQo+Pj4gQEAgLTExNjIsNyAr
MTE2NSw3IEBAIHN0YXRpYyB2b2lkIHhlbl9kb193cml0ZV9tc3IodTMyIG1zciwgdTY0IHZh
bCwgaW50ICplcnIpDQo+Pj4gwqAgc3RhdGljIGludCB4ZW5fcmVhZF9tc3Jfc2FmZSh1MzIg
bXNyLCB1NjQgKnZhbCkNCj4+PiDCoCB7DQo+Pj4gLcKgwqDCoCBpbnQgZXJyOw0KPj4+ICvC
oMKgwqAgaW50IGVyciA9IDA7DQo+Pj4gwqDCoMKgwqDCoCAqdmFsID0geGVuX2RvX3JlYWRf
bXNyKG1zciwgJmVycik7DQo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gZXJyOw0KPj4NCj4+IFNv
IHdoeSBub3QgaW5pdGlhbGl6ZSAnZXJyJyB3aXRoIDAgaW4gYm90aCBjYWxsZXJzLCB4ZW5f
cmVhZF9tc3Jfc2FmZSgpDQo+PiBhbmQgeGVuX3JlYWRfbXNyKCksIGFuZCBhdm9pZCBhbGwg
dGhlIGluaXRpYWxpemF0aW9uIHRyb3VibGUgaW4NCj4+IHhlbl9kb19yZWFkX21zcigpPw0K
PiANCj4gWWVhaCwgSSBzaG91bGQgbWFrZSB0aGUgY2hhbmdlIGluIHhlbl9yZWFkX21zcigp
IHRvby4NCj4gDQo+IEhvd2V2ZXIgeGVuX2RvX3JlYWRfbXNyKCkgc2hvdWxkIGJlIGltcGxl
bWVudGVkIGluIGEgZGVmZW5zaXZlIHdheSB0bw0KPiBzZXQgKmVyciBwcm9wZXJseSBhcyBp
dCdzIHBhcnQgb2YgaXRzIHJldHVybiB2YWx1ZS7CoCBBY3R1YWxseSBpdCB3YXMgc28sDQo+
IGJ1dCBvbmUgb2YgbXkgcHJldmlvdXMgY2xlYW51cCBwYXRjaCByZW1vdmVkIGl0IGJlY2F1
c2UgZXJyIGlzIG5vIGxvbmdlcg0KPiBwYXNzZWQgdG8gcG11X21zcl9jaGtfZW11bGF0ZWQo
KS4NCg0KeGVuX2RvX3JlYWRfbXNyKCkgaXMgdXNhYmxlIG9ubHkgaW4gZW5saWdodGVuX3B2
LmMgYXMgaXQgaXMgc3RhdGljLg0KDQpTbyBJJ2QgcHJlZmVyIHRvIGRyb3Agc2V0dGluZyBl
cnIgdG8gMCBpbiB4ZW5fZG9fcmVhZF9tc3IoKSBpbml0aWFsbHkNCmFuZCB0byBzZXQgZXJy
IHRvIDAgaW4gYWxsIGNhbGxlcnMuDQoNCg0KSnVlcmdlbg0K
--------------DXvRsuOKe4mFw5cdW3f0xAAU
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------DXvRsuOKe4mFw5cdW3f0xAAU--

--------------77fm8ZAPfoKwkw5C0Tyy8C7B--

--------------PgiYR0j8o8tgjsYaNHIycWKK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgnQN4FAwAAAAAACgkQsN6d1ii/Ey9l
lwf/Xk2T6T50jLesExpAbNXip6060sAMN1Mc1BYrkiVurjsNyS+Uwh6P0jqLiZHfkb2TSD+F0IyF
lfwz1sEUjaNAWM9qY0PiyIhTzdWWPRxWD5Ffl5hCuIHM/OvPo99OhATvJE9gAIWTX7SFc6XUvzLg
zh4WEAOg1mJmlnzOoM/u1/2ZUb7NvdX+IDlUZXxM+Ixv1pbuIFXTi8FQY5reGXKs15D/g1GgRZyV
IBqZeZwosjxNSFC+LVI0WoQ4npyKWGnHitExTb8uBKPimQ+oleF8gmhx7r7q2BsZtuAawZVwjISK
AKQRIdHkbZdv+ROvrq3Aq/lssd0ULRktdKLt6rzaAw==
=zWaj
-----END PGP SIGNATURE-----

--------------PgiYR0j8o8tgjsYaNHIycWKK--

