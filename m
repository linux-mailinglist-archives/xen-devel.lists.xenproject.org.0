Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD55ABAC2AA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 11:03:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134117.1472127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3WG9-0001mj-Oa; Tue, 30 Sep 2025 09:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134117.1472127; Tue, 30 Sep 2025 09:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3WG9-0001kP-Kj; Tue, 30 Sep 2025 09:02:57 +0000
Received: by outflank-mailman (input) for mailman id 1134117;
 Tue, 30 Sep 2025 09:02:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v3WG8-0001kJ-1W
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 09:02:56 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fc5ca55-9ddc-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 11:02:53 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-61cc281171cso11645291a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 02:02:53 -0700 (PDT)
Received: from ?IPV6:2003:e5:873f:400:7b4f:e512:a417:5a86?
 (p200300e5873f04007b4fe512a4175a86.dip0.t-ipconnect.de.
 [2003:e5:873f:400:7b4f:e512:a417:5a86])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3c40d9ced1sm557968466b.80.2025.09.30.02.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 02:02:52 -0700 (PDT)
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
X-Inumbo-ID: 3fc5ca55-9ddc-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759222973; x=1759827773; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LtMOHW+53F0W8gofi/abbzsPPcLlqTFKatap2a1mWHc=;
        b=d+Mp5vPuyIM2NRTC5R3tCemFnPCNzpTb3JLdPGgHdrZMD1K6wzGyg+8JMa6mq0hevA
         JCf2o7XfT22kxBj1aSL6KZ0ONcJzDC62kUIEmSLqlEDNu9sU0UWq8PL2ijreioKzLFif
         DtWXkRN2h7CGKQaLDoYKFgZ+tYF3XTRZeD4yoNyoAlazvoPtL9jGaNrvasg7XnYjqC9d
         MPiKiJ+6Gv2oHDBzWDc7wXTc0Ve1WCSQjrXe3p5UL2XQ6ekOPDNOCOrxLE3Hs1mof9EW
         6zwbezGL3pQtXVD/I9xxkGrTvT15cr3ujgWs1fAwfEeqOK+HXnfHUToeqrpnnFtXpgvC
         J7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759222973; x=1759827773;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LtMOHW+53F0W8gofi/abbzsPPcLlqTFKatap2a1mWHc=;
        b=f8wVYY/zHOJOFrga3GJU+1VbICDN4BRfV/dfIoGLhqOO7K5mLBo21VwdMW6QIcwfCQ
         P8hUTeJzZkOLjKz6JG9FgCm4zxIC3ocSNr+1p9vjgQhZOu96UmZYQjPCwNcJspOoKERV
         joX6DaMvruEFg/k1fxqVtEVG+tr4P/PNLyvEKMuScTcnudi9zSoZoqkCS4p4wU+rQOY7
         /55KxpZZy8iCCY0DrlPJL2wrGa1cLlRHGxvbol3nvendl/9RYiAtsB+xZKAZmAzsrgRw
         WvMHkjQoa441ItvV+ZqpoCvEleKb32BNsF9DfQynE/OoNhR0Jbckf2GdK2VUjety7QWj
         LFlw==
X-Forwarded-Encrypted: i=1; AJvYcCXc7Sf6TFzHfBiB+5+qJJzfT+ynBYX6q6s6GcaqdfJberBycBSbInRvKreCgd47emziCBRCrI5B8Cs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpN9NdLxSOeanoX5/Qn1Rv5K9z09AreCcJvakM0B69+842jMZj
	LT4wSOA5OQralEPXvRgngwvZ2XSg2zBuSqqkhM9aXnfz1o3K1jL2Seq1Bij8vuPqyNc=
X-Gm-Gg: ASbGncv0vtL5amEUa1hvd7guifoyucF3t3SaLwQKcmNyyvriMkhRJURSg8sv85Vy55H
	dNbV06yjmfjpuAU9zyps6lSnbuzwo8BpW1pMS/tWREC95WZxJ3ww/zo9/lAkLMFjyqKyOipsh6D
	6fequ+7hQOAbxKA1xMMfjr2YxmHre3iOuUqkXjduWy6dyPoeB4S07QftOpBjnusU2REKhecTtUk
	6sTLCD9YAa3zzRaaK6F0v2tGPQxta7dlcpu81hJuXMG0jJS8WGsOpxT2jlijWqJ1ekSuBYrUtyS
	58dR5ZVCjT7l5T5OXLmioDzduPUJ6frNX6J0eVftU5Skm+2YBOYMyouK2DiEd1AC7QHn015Kr8E
	dO7lzuaLYjJD5zgzcoIs3+QNblEyFJW6oEIkTLNgx9P4QxJyhfpkJR8lsimsZsaG4kmiQM+hfeZ
	qaLZU6fQ7/LN1eH8QaQ8Yjr+u4JuoUu2+nODFeihMxWFpS6Qo8+hmRfMjJZ2rxC2xpiYk4
X-Google-Smtp-Source: AGHT+IEhBcJxRX85g9uAkfqQnAOM8ZX84eGYiI6CL0xWr5Dy3J8XRMl2kqQOdaPWOVnka4EPHeMGbA==
X-Received: by 2002:a17:907:d7c1:b0:b3a:ecc1:7774 with SMTP id a640c23a62f3a-b3aecc183bamr1092767766b.53.1759222973125;
        Tue, 30 Sep 2025 02:02:53 -0700 (PDT)
Message-ID: <1541b670-8b29-42a5-a58d-34d85197751d@suse.com>
Date: Tue, 30 Sep 2025 11:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] x86/paravirt: Don't use pv_ops vector for MSR
 access functions
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, xin@zytor.com,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
References: <20250930070356.30695-1-jgross@suse.com>
 <20250930070356.30695-12-jgross@suse.com>
 <20250930083827.GI3245006@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20250930083827.GI3245006@noisy.programming.kicks-ass.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EDjdRPJRmmUK5bP0S1o6gxj8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EDjdRPJRmmUK5bP0S1o6gxj8
Content-Type: multipart/mixed; boundary="------------SnAjFPsvrro8lhJGEyYEiJll";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, xin@zytor.com,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Message-ID: <1541b670-8b29-42a5-a58d-34d85197751d@suse.com>
Subject: Re: [PATCH v2 11/12] x86/paravirt: Don't use pv_ops vector for MSR
 access functions
References: <20250930070356.30695-1-jgross@suse.com>
 <20250930070356.30695-12-jgross@suse.com>
 <20250930083827.GI3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20250930083827.GI3245006@noisy.programming.kicks-ass.net>

--------------SnAjFPsvrro8lhJGEyYEiJll
Content-Type: multipart/mixed; boundary="------------dMBscmw5LmvOz0wWFtddEw66"

--------------dMBscmw5LmvOz0wWFtddEw66
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDkuMjUgMTA6MzgsIFBldGVyIFppamxzdHJhIHdyb3RlOg0KPiBPbiBUdWUsIFNl
cCAzMCwgMjAyNSBhdCAwOTowMzo1NUFNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
PiANCj4+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHU2NCByZWFkX21zcih1MzIgbXNyKQ0K
Pj4gK3sNCj4+ICsJaWYgKGNwdV9mZWF0dXJlX2VuYWJsZWQoWDg2X0ZFQVRVUkVfWEVOUFYp
KQ0KPj4gKwkJcmV0dXJuIHhlbl9yZWFkX21zcihtc3IpOw0KPj4gKw0KPj4gKwlyZXR1cm4g
bmF0aXZlX3JkbXNycShtc3IpOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgX19hbHdheXNf
aW5saW5lIGludCByZWFkX21zcl9zYWZlKHUzMiBtc3IsIHU2NCAqcCkNCj4+ICt7DQo+PiAr
CWlmIChjcHVfZmVhdHVyZV9lbmFibGVkKFg4Nl9GRUFUVVJFX1hFTlBWKSkNCj4+ICsJCXJl
dHVybiB4ZW5fcmVhZF9tc3Jfc2FmZShtc3IsIHApOw0KPj4gKw0KPj4gKwlyZXR1cm4gbmF0
aXZlX3JlYWRfbXNyX3NhZmUobXNyLCBwKTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIF9f
YWx3YXlzX2lubGluZSB2b2lkIHdyaXRlX21zcih1MzIgbXNyLCB1NjQgdmFsKQ0KPj4gK3sN
Cj4+ICsJaWYgKGNwdV9mZWF0dXJlX2VuYWJsZWQoWDg2X0ZFQVRVUkVfWEVOUFYpKQ0KPj4g
KwkJeGVuX3dyaXRlX21zcihtc3IsIHZhbCk7DQo+PiArCWVsc2UNCj4+ICsJCW5hdGl2ZV93
cm1zcnEobXNyLCB2YWwpOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgX19hbHdheXNfaW5s
aW5lIGludCB3cml0ZV9tc3Jfc2FmZSh1MzIgbXNyLCB1NjQgdmFsKQ0KPj4gK3sNCj4+ICsJ
aWYgKGNwdV9mZWF0dXJlX2VuYWJsZWQoWDg2X0ZFQVRVUkVfWEVOUFYpKQ0KPj4gKwkJcmV0
dXJuIHhlbl93cml0ZV9tc3Jfc2FmZShtc3IsIHZhbCk7DQo+PiArDQo+PiArCXJldHVybiBu
YXRpdmVfd3JpdGVfbXNyX3NhZmUobXNyLCB2YWwpOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0
aWMgX19hbHdheXNfaW5saW5lIHU2NCByZHBtYyhpbnQgY291bnRlcikNCj4+ICt7DQo+PiAr
CWlmIChjcHVfZmVhdHVyZV9lbmFibGVkKFg4Nl9GRUFUVVJFX1hFTlBWKSkNCj4+ICsJCXJl
dHVybiB4ZW5fcmVhZF9wbWMoY291bnRlcik7DQo+PiArDQo+PiArCXJldHVybiBuYXRpdmVf
cmVhZF9wbWMoY291bnRlcik7DQo+PiArfQ0KPiANCj4gRWdhZHMsIGRpZG4ndCB3ZSBqdXN0
IGNvbnN0cnVjdCBnaWFudCBBTFRFUk5BVElWRSgpcyBmb3IgdGhlIG5hdGl2ZV8NCj4gdGhp
bmdzPyBXaHkgd3JhcCB0aGF0IGluIGEgY3B1X2ZlYXR1cmVfZW5hYmxlZCgpIGluc3RlYWQg
b2YganVzdCBhZGRpbmcNCj4gb25lIG1vcmUgY2FzZSB0byB0aGUgQUxURVJOQVRJVkUoKSA/
DQoNClRoZSBwcm9ibGVtIEkgZW5jb3VudGVyZWQgd2l0aCB1c2luZyBwdl9vcHMgd2FzIHRv
IGltcGxlbWVudCB0aGUgKl9zYWZlKCkNCnZhcmlhbnRzLiBUaGVyZSBpcyBubyBzaW1wbGUg
d2F5IHRvIGRvIHRoYXQgdXNpbmcgQUxURVJOQVRJVkVfPG4+KCksIGFzDQppbiB0aGUgWGVu
IFBWIGNhc2UgdGhlIGNhbGwgd2lsbCByZW1haW4sIGFuZCBJIGRpZG4ndCBmaW5kIGEgd2F5
IHRvDQpzcGVjaWZ5IGEgc2FuZSBpbnRlcmZhY2UgYmV0d2VlbiB0aGUgY2FsbC1zaXRlIGFu
ZCB0aGUgY2FsbGVkIFhlbiBmdW5jdGlvbg0KdG8gcmV0dXJuIHRoZSBlcnJvciBpbmRpY2F0
b3IuIFJlbWVtYmVyIHRoYXQgYXQgdGhlIGNhbGwgc2l0ZSB0aGUgbWFpbg0KaW50ZXJmYWNl
IGlzIHRoZSBvbmUgb2YgdGhlIFJETVNSL1dSTVNSIGluc3RydWN0aW9ucy4gVGhleSBsYWNr
IGFuIGVycm9yDQppbmRpY2F0b3IuDQoNCkluIFhpbidzIHNlcmllcyB0aGVyZSB3YXMgYSBw
YXRjaCB3cml0dGVuIGluaXRpYWxseSBieSB5b3UgdG8gc29sdmUgc3VjaA0KYSBwcm9ibGVt
IGJ5IGFkZGluZyB0aGUgX0FTTV9FWFRBQkxFX0ZVTkNfUkVXSU5EKCkgZXhjZXB0aW9uIHRh
YmxlIG1ldGhvZC4NCkkgdGhpbmsgdGhpcyBpcyBhIGRlYWQgZW5kLCBhcyBpdCB3aWxsIGJy
ZWFrIHdoZW4gdXNpbmcgYSBzaGFkb3cgc3RhY2suDQoNCkFkZGl0aW9uYWxseSBJIGZvdW5k
IGEgcmF0aGVyIHVnbHkgaGFjayBvbmx5IHRvIGF2b2lkIHJlLWl0ZXJhdGluZyBtb3N0IG9m
DQp0aGUgYmFyZSBtZXRhbCBBTFRFUk5BVElWRSgpIGZvciB0aGUgcGFyYXZpcnQgY2FzZS4g
SXQgaXMgcG9zc2libGUsIGJ1dCB0aGUNCmJhcmUgbWV0YWwgY2FzZSBpcyBnYWluaW5nIG9u
ZSBhZGRpdGlvbmFsIEFMVEVSTkFUSVZFIGxldmVsLCByZXN1bHRpbmcgaW4NCnBhdGNoaW5n
IHRoZSBvcmlnaW5hbCBpbnN0cnVjdGlvbiB3aXRoIGFuIGlkZW50aWNhbCBjb3B5IGZpcnN0
Lg0KDQpBbm90aGVyIGJlbmVmaXQgb2YgbXkgYXBwcm9hY2ggaXMgdGhlIGRyb3BwaW5nIG9m
ICIjaW5jbHVkZSA8YXNtL3BhcmF2aXJ0Lmg+Ig0KZnJvbSBtc3IuaCwgd2hpY2ggaXMgbWFr
aW5nIGxpZmUgYSBsaXR0bGUgYml0IGVhc2llci4NCg0KDQpKdWVyZ2VuDQo=
--------------dMBscmw5LmvOz0wWFtddEw66
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------dMBscmw5LmvOz0wWFtddEw66--

--------------SnAjFPsvrro8lhJGEyYEiJll--

--------------EDjdRPJRmmUK5bP0S1o6gxj8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjbnLwFAwAAAAAACgkQsN6d1ii/Ey8j
Ngf/VhebFnmOYuETy4RiRDShiplntQglNhvDrVEDyiRLy20bM8s5hGdcLlc5Ssv2N8wntccp4htO
cF31CpnEhQS88HO7CbdPODQ8YKH1jlN8O00AsgRcnllqRgkpv83VzAGMyqyjHiAhCYsoDdrO3Kfk
kgj30NsD+ftCgYzYmd1MwMQ0k0XcjRQ5mBLspsF3XtSUJKQwrhyP+5y6OBQnMmzWSbHncqrAdpGi
CC9OZfIq3E6H9GbKVkVBul4kSjewsKQGXlpZTaE95Bsq2oKjR4aElYvfPqRqSKhroCdcNjZDRQJp
0jFNZkvzBmshvDti9g0rJCROakm32uq0FwPmlX6PhA==
=CfFP
-----END PGP SIGNATURE-----

--------------EDjdRPJRmmUK5bP0S1o6gxj8--

