Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46832B14AE0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 11:13:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062337.1427985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uggOc-00069K-00; Tue, 29 Jul 2025 09:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062337.1427985; Tue, 29 Jul 2025 09:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uggOb-00067L-T2; Tue, 29 Jul 2025 09:13:17 +0000
Received: by outflank-mailman (input) for mailman id 1062337;
 Tue, 29 Jul 2025 09:13:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TZvG=2K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uggOa-000679-3V
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 09:13:16 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41fa6c6e-6c5c-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 11:13:14 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6156a162537so1045872a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 02:13:15 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61500ad0474sm4289907a12.32.2025.07.29.02.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 02:13:14 -0700 (PDT)
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
X-Inumbo-ID: 41fa6c6e-6c5c-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753780394; x=1754385194; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AakHI/bNEPFD36BwiMTVei3m4LZP1v4Nb3WXVsVgUAY=;
        b=EBcQtQSIuQcbnSebDnmVhwb7ZTAtg/52qnaEzorjdnmTsClPTe8ELyhr4UYAy4zrti
         ek6uYor6Mlic649bNuKB3Ndr5Mmaaiyu8Ay2S56ta3cgFqb4KcK/V+U4jTuggzDsF66h
         Jjm51cJq2SHyQw1AIwwyceTo/SYcoHvHOYAtLDA1AQDQRHHZdYUP1Dq9YVy4G7hLQW2v
         wxFgxDjQXxxYj0QVXncAwNKnxBPP+xRsNecmlv/qQPT15bFcb5bqLFtATFcTW++99aYU
         p0EY87XxqfpHg9fPEz/ObnTMfHBjOhPwcN/i7Vxj17kC+vzr0einZqqJupAKT3I/2miG
         dhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753780394; x=1754385194;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AakHI/bNEPFD36BwiMTVei3m4LZP1v4Nb3WXVsVgUAY=;
        b=SODo2cLEzLZbHC4e622uQy7Viqr0jtM6tx9WlqYK52w8z3LVOBDPrg8FfhwHWMUegh
         J3ndqDqccA4YjUCO8NiGXEYYOYEVIX2imhsNljZ0WDtbZsKC47zXajZMjC+gFX9KlcKy
         Iz3STATnxlyl1x0wOJXO/9hWsq2VmhkYO0+hMmVbz8d7uljE7GMVt7eCHZlXQmA7Ecjo
         j+MXrlFyXxQOS1jcJFxBjEBgO9LjdH7Ke9kUprDlVEnLqIpVvxh2INxjH/lkFT6g3ApC
         FuRHy9uA4LqIdf/xl1VdGMuNSfDRGYgJ+YjNZ0ckD6AGTK4xyan0ov9Z9TjLWnUPzdIm
         9eoA==
X-Forwarded-Encrypted: i=1; AJvYcCUCuoDeyEF1ZwuCZha4C73aKA1rAjb+5MF3epRMDt1XG7X8cKTzJE8malT1G672HRwYsMZ+qbOMk/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZTx4WpoZQ1HSv0I09eIM62T9jNj9kXY/qri2X8m/ks2bSLmST
	bYZMtM8RyhDvXDe5LyLDIlMkyaEX3NJHMFAMqnWGZDj167EqKEZFr52QTVhWm2IaPSg=
X-Gm-Gg: ASbGncsft6ThW5ygmGCCSHC5aCkDYBhWHWl+ayxsbtXGTBzKx6hIOngCDBDO16s8vrD
	mjaB9SukdIL6s4pQf87BWOXo1iDlijhxyDAKsH9xe7CPuoJcW6geqab4Ooch/Jb/tIpkWhepP6M
	r82iUqjIS4s2+nA7wg+zB90OQtZPAWVhwlN0cxh92C1RWU8f+0iWy7aFv9DCOabZc5CfjHGsUVF
	65oom7vXmVCZWp0vtWgujY9BP4gm0j6L0X+NzHLZysHKgIV3n8AMJ/LYaTlE+PDxOK/W7PEfyfL
	ckz5bzCOwy5XbSF50QEb2S4dIbd8g6XMFY93p93zk02EPzQd0GQxvyUoskpxa8iPUmpvW9NYIsq
	cEgLZpYiuzCVDuWLXfURwxRNiWZZw6Dqo1rHekRF3l78550HuBXFAijzsQhQ3H6Gf/4cEF5V9I1
	S3XE0fMV3yUklsEBBHm0WI2DYPCfsUlCIRoWUmB3Fe4A==
X-Google-Smtp-Source: AGHT+IF/YNaEAhPglzQq5RvOayFLuHfNLxuwLS/F4jzMNCPFjo2/E2U143S9Egfud55tNHE/a643VA==
X-Received: by 2002:a05:6402:2788:b0:615:30c3:3795 with SMTP id 4fb4d7f45d1cf-61530c33c22mr9263054a12.4.1753780394461;
        Tue, 29 Jul 2025 02:13:14 -0700 (PDT)
Message-ID: <8d4ca224-dbed-4548-b26b-0e8b020c377f@suse.com>
Date: Tue, 29 Jul 2025 11:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH v2 2/2] x86: don't use a memory page for mapping
 the shared info page
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250729083829.11038-1-jgross@suse.com>
 <20250729083829.11038-3-jgross@suse.com>
 <0b6b3a4a-03df-4bc9-996d-ba2efb3f5b73@suse.com>
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
In-Reply-To: <0b6b3a4a-03df-4bc9-996d-ba2efb3f5b73@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5hVzY4zwqa1BDsb9fT7QS2vA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5hVzY4zwqa1BDsb9fT7QS2vA
Content-Type: multipart/mixed; boundary="------------a0m4HCodCA6CHkA3RG7CDH7k";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Message-ID: <8d4ca224-dbed-4548-b26b-0e8b020c377f@suse.com>
Subject: Re: [MINI-OS PATCH v2 2/2] x86: don't use a memory page for mapping
 the shared info page
References: <20250729083829.11038-1-jgross@suse.com>
 <20250729083829.11038-3-jgross@suse.com>
 <0b6b3a4a-03df-4bc9-996d-ba2efb3f5b73@suse.com>
In-Reply-To: <0b6b3a4a-03df-4bc9-996d-ba2efb3f5b73@suse.com>
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

--------------a0m4HCodCA6CHkA3RG7CDH7k
Content-Type: multipart/mixed; boundary="------------cWMpMmjscPkYA8PNTEVRI0Q0"

--------------cWMpMmjscPkYA8PNTEVRI0Q0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDcuMjUgMTE6MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOS4wNy4yMDI1
IDEwOjM4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvYXJjaC94ODYveDg2XzY0
LlMNCj4+ICsrKyBiL2FyY2gveDg2L3g4Nl82NC5TDQo+PiBAQCAtMzMsMTMgKzMzLDggQEAg
X3N0YXJ0Og0KPj4gICBzdGFja19zdGFydDoNCj4+ICAgICAgICAgICAucXVhZCBzdGFjayso
MipfX1NUQUNLX1NJWkUpDQo+PiAgIA0KPj4gLS5nbG9ibCBzaGFyZWRfaW5mbywgaHlwZXJj
YWxsX3BhZ2UNCj4+IC0gICAgICAgIC8qIFVucGxlYXNhbnQgLS0gdGhlIFBURSB0aGF0IG1h
cHMgdGhpcyBwYWdlIGlzIGFjdHVhbGx5IG92ZXJ3cml0dGVuICovDQo+PiAtICAgICAgICAv
KiB0byBtYXAgdGhlIHJlYWwgc2hhcmVkLWluZm8gcGFnZSEgOi0pICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAqLw0KPj4gICAgICAgICAgIC5hbGlnbiBfX1BBR0VfU0laRQ0KPj4g
LXNoYXJlZF9pbmZvOg0KPj4gLSAgICAgICAgLmZpbGwgX19QQUdFX1NJWkUsMSwwDQo+PiAt
DQo+PiArLmdsb2JsIGh5cGVyY2FsbF9wYWdlDQo+IA0KPiBXaGlsZSB0b3VjaGluZyB0aGlz
IGxpbmUsIG1heSBJIHN1Z2dlc3QgdG8gaW5kZW50IHRoaXMgZGlyZWN0aXZlIHRvIG1hdGNo
IGFsbA0KPiBvdGhlciBkaXJlY3RpdmVzIGluIGNvbnRleHQ/IEV2ZW4gaWYgYXNzZW1ibGVy
cyBhY2NlcHQgdGhlbSBmb3IgbW9zdCB0YXJnZXRzLA0KPiBkaXJlY3RpdmVzIHN0YXJ0aW5n
IGluIHRoZSBmaXJzdCBjb2x1bW4gc3RyaWN0bHkgc3BlYWtpbmcgYXJlIG1pc3BsYWNlZC4N
Cj4gDQo+PiAtLS0gYS9oeXBlcnZpc29yLmMNCj4+ICsrKyBiL2h5cGVydmlzb3IuYw0KPj4g
QEAgLTI3LDggKzI3LDEwIEBADQo+PiAgIA0KPj4gICAjaW5jbHVkZSA8bWluaS1vcy9vcy5o
Pg0KPj4gICAjaW5jbHVkZSA8bWluaS1vcy9saWIuaD4NCj4+ICsjaW5jbHVkZSA8bWluaS1v
cy9lODIwLmg+DQo+PiAgICNpbmNsdWRlIDxtaW5pLW9zL2h5cGVydmlzb3IuaD4NCj4+ICAg
I2luY2x1ZGUgPG1pbmktb3MvZXZlbnRzLmg+DQo+PiArI2luY2x1ZGUgPG1pbmktb3MvbW0u
aD4NCj4+ICAgI2luY2x1ZGUgPHhlbi9tZW1vcnkuaD4NCj4+ICAgDQo+PiAgIEVYUE9SVF9T
WU1CT0woaHlwZXJjYWxsX3BhZ2UpOw0KPj4gQEAgLTM3LDcgKzM5LDggQEAgRVhQT1JUX1NZ
TUJPTChoeXBlcmNhbGxfcGFnZSk7DQo+PiAgICAgICAoKHNoKS0+ZXZ0Y2huX3BlbmRpbmdb
aWR4XSAmIH4oc2gpLT5ldnRjaG5fbWFza1tpZHhdKQ0KPj4gICANCj4+ICAgI2lmbmRlZiBD
T05GSUdfUEFSQVZJUlQNCj4+IC1leHRlcm4gc2hhcmVkX2luZm9fdCBzaGFyZWRfaW5mbzsN
Cj4+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBzaGluZm9fcGZuOw0KPj4gK3N0YXRpYyB1bnNp
Z25lZCBsb25nIHNoaW5mb192YTsNCj4+ICAgDQo+PiAgIGludCBodm1fZ2V0X3BhcmFtZXRl
cihpbnQgaWR4LCB1aW50NjRfdCAqdmFsdWUpDQo+PiAgIHsNCj4+IEBAIC02OSwyNCArNzIs
MzEgQEAgc2hhcmVkX2luZm9fdCAqbWFwX3NoYXJlZF9pbmZvKHZvaWQpDQo+PiAgIHsNCj4+
ICAgICAgIHN0cnVjdCB4ZW5fYWRkX3RvX3BoeXNtYXAgeGF0cDsNCj4+ICAgDQo+PiArICAg
IHNoaW5mb19wZm4gPSBlODIwX2dldF9yZXNlcnZlZF9wZm5zKDEpOw0KPj4gICAgICAgeGF0
cC5kb21pZCA9IERPTUlEX1NFTEY7DQo+PiAgICAgICB4YXRwLmlkeCA9IDA7DQo+PiAgICAg
ICB4YXRwLnNwYWNlID0gWEVOTUFQU1BBQ0Vfc2hhcmVkX2luZm87DQo+PiAtICAgIHhhdHAu
Z3BmbiA9IHZpcnRfdG9fcGZuKCZzaGFyZWRfaW5mbyk7DQo+PiArICAgIHhhdHAuZ3BmbiA9
IHNoaW5mb19wZm47DQo+PiAgICAgICBpZiAoIEhZUEVSVklTT1JfbWVtb3J5X29wKFhFTk1F
TV9hZGRfdG9fcGh5c21hcCwgJnhhdHApICE9IDAgKQ0KPj4gICAgICAgICAgIEJVRygpOw0K
Pj4gKyAgICBpZiAoICFzaGluZm9fdmEgKQ0KPj4gKyAgICAgICAgc2hpbmZvX3ZhID0gYWxs
b2NfdmlydF9rZXJuZWwoMSk7DQo+PiArICAgIGlmICggIXNoaW5mb192YSB8fCBtYXBfZnJh
bWVfcncoc2hpbmZvX3ZhLCBzaGluZm9fcGZuKSApDQo+PiArICAgICAgICBCVUcoKTsNCj4g
DQo+IE5vdyB0aGVyZSdzIGEgbmV3IGFzeW1tZXRyeTogSGVyZSB5b3UgY2hlY2sgd2hldGhl
ciBhbGxvY192aXJ0X2tlcm5lbCgpDQo+IChhcHBlYXJzIHRvIGhhdmUpIGZhaWxlZCwgd2hl
cmVhcyBpbiB0aGUgUFYgdmFyaWFudCB5b3UgZG9uJ3QuIEFuZCBpdCdzDQo+IHJlYWxseSBv
bmx5ICJhcHBlYXJzIHRvIiwgYXMgdGhlIGZ1bmN0aW9uIHdvbid0IHJldHVybiAwIGluIHRo
ZSBmYWlsdXJlDQo+IGNhc2UsIGFmYWljcy4gSSB0aGVyZWZvcmUgdGhpbmsgdGhhdCBleHRy
YSBjb25kaXRpb24gc2ltcGx5IHdhbnRzDQo+IGRyb3BwaW5nIGhlcmUuIFRoZW4NCg0KT2gs
IHJpZ2h0LiBGaXJzdCBJIGhhZA0KDQppZiAoICFzaGluZm9fdmEgKQ0KICAgICBzaGluZm9f
dmEgPSBtYXBfZnJhbWVfdmlydChzaGluZm9fcGZuKTsNCmVsc2UNCiAgICAgcmV0ID0gbWFw
X2ZyYW1lX3J3KHNoaW5mb192YSwgc2hpbmZvX3Bmbik7DQppZiAoIHJldCB8fCAhc2hpbmZv
X3ZhICkNCiAgICAgQlVHKCk7DQoNCndoaWNoIEkgdGhlbiBzaW1wbGlmaWVkIHRvIGFib3Zl
IHNlcXVlbmNlLCBidXQgd2l0aG91dCBkcm9wcGluZyB0aGUgdGVzdCBmb3INCnNoaW5mb192
YSBiZWluZyBub3QgMC4NCg0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KPiANCj4gQXMgZm9yIHRoZSBvdGhlciBwYXRjaCwgaGFwcHkgdG8gbWFr
ZSBib3RoIGFkanVzdG1lbnRzIHdoaWxlIGNvbW1pdHRpbmcuDQo+IEFzIGxvbmcgYXMgeW91
IGFncmVlLCBvZiBjb3Vyc2UuDQoNClllcywgSSBhZ3JlZSwgdGhhbmtzLg0KDQoNCkp1ZXJn
ZW4NCg==
--------------cWMpMmjscPkYA8PNTEVRI0Q0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------cWMpMmjscPkYA8PNTEVRI0Q0--

--------------a0m4HCodCA6CHkA3RG7CDH7k--

--------------5hVzY4zwqa1BDsb9fT7QS2vA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiIkKkFAwAAAAAACgkQsN6d1ii/Ey/P
TQgAhkl9Xw9sF5bpNQAhLMfn+0nNNY9nydFsmty+Esj5VsW5PlaIaMrGkk8d/xJB3NwmrqDxvd3+
RlLzNq8BW64x/LbTzPZXcu4fZJDiKOHnFpXkpWjzadoBt6lSxfFn/IH8gHhQ9XtliRGQPHGUlr9N
ShjzuekRxTY3j7ZUk60aPBskvUpg/Mf5rWzbKr+vPu9wXx/EbYEjrj6/cTkPr1HVeRyBJIPG/O+s
qB1ZWDGobkuKNhqmsUNo70Mszgwv9T1p+i2MCBU94HNVHkB+VEZ4XFSYlvhrJlzXdqBX9yq75SPX
dzh1S4/sviT0divuKLvYshZU4VCO+q6LO/WYJvrVnQ==
=7nc0
-----END PGP SIGNATURE-----

--------------5hVzY4zwqa1BDsb9fT7QS2vA--

