Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABBDC57FB9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 15:39:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161718.1489603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJYU9-0006Gm-FX; Thu, 13 Nov 2025 14:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161718.1489603; Thu, 13 Nov 2025 14:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJYU9-0006FG-Bn; Thu, 13 Nov 2025 14:39:41 +0000
Received: by outflank-mailman (input) for mailman id 1161718;
 Thu, 13 Nov 2025 14:39:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lXFW=5V=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vJYU7-0005lW-Vj
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 14:39:40 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 953485bd-c09e-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 15:39:39 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6419aaced59so1350039a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 06:39:39 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a49806csm1569657a12.18.2025.11.13.06.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 06:39:38 -0800 (PST)
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
X-Inumbo-ID: 953485bd-c09e-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763044778; x=1763649578; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=75qq635rO2tDImcbwfGGjZSeEPkH/FN9pwWgkjY22Qk=;
        b=Z/mrupG/7t2+c314vTZX6CAFTJyXPr/AQjH6ejdE5LigPo5kW7qdgRHBshwqEC4jmB
         Zccuk5SXK1mVzkOZAWWL6/4ccuX4i62vlLIP0Rhc/8Z+R6k7yj04+ZRtEkrBl44nMcxb
         gMbGx9oUTBmT4XfxWt25bIpyD/V5YQk5DAol57cknv2ODaHvw4Q1DZoEJ8vJV0LG0LNG
         ry76o1O+L2XdeJzZ1P6326HP8QdHUfhagTLb3FodAoqf2uAgpGW5wVLpKG3undBjsh72
         iQU8BBUJFzKrB3IDW/FTWEme/GZQi3ZzHSr1jgS3qrAZ7BtkMkz++/DzYfIqLWc3uJGn
         hxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763044778; x=1763649578;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=75qq635rO2tDImcbwfGGjZSeEPkH/FN9pwWgkjY22Qk=;
        b=qcdnY5aAhZWQwKfMtJulCMmRynX/wUYJ7BGTOEEY87KR/Pwb6RYp2V39U6e7j/eoWX
         11iw0OCqUvuWCX4YaaON6Sh4V8UBH+foziufI2zARIArFdjqq5Sbs61a6X66JEgS4f2m
         neiO3oe4By4NYSvtjXXI2IB6Mz/P6UxcQ6pWlQB6Idve6Hk12+lbRlusawKtiwzucgST
         amLinwW22TApvjoerY+wupgVjXx+8HllkE9QpofvTJhJui4aleZXcggKLqfU9/OPD2fi
         MviHYmsR3fHnC4HnTiZCXHiN0PZABhlapPLOtszaNaEoJAGXx16hb8+xgWD1RorNl75e
         jiiw==
X-Forwarded-Encrypted: i=1; AJvYcCUiFzx0nQGiRdug1pRc5kgLnhRDbGJoCUqYn/SuDQuwLn0omE7TuOwlvVpH9oZT5oIYKpGqbwInl+A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGlxa6biSKH52Cte57+8mUl00prAExVJHgGzi9erW/50akLXTk
	skB7FAt53aQnWnppUvPVx5Q2cIFvf+k/WKSH1R94HdZp53CRpsiatiYyzOlAhpSHwOs=
X-Gm-Gg: ASbGnctBsEdm28IClluseFGm1Iaw04XAF42oCJpqwx+9mYdknJNM/FBjGhQcCcrAfzo
	G+KDx1FOOQZwvSS/GQDszaXlly+Pg7iv7yv+djlCIm6+d9ez84f5gs0i1jH+CL56vz5F+ZcBPAE
	jin0+mdQVZGOzrUWwvnPflouuJeY9wTijxKq+JHXrxfExxLEYTMQl5FEZampEY6y0xUIJXiVo4p
	KqplQ6soe3qQqnWAQPfBC+Clmb+pHVlOlmnDLBrWKN7FT/Nl4Z6FuiWpfCIrZXKIyh9s3DJfsho
	GL5gbNKeF18M+/0UpjzZhY+5Hry6XtqABjOMcj58lZ8kQL2Ul40g3imEF2G3doeWl9v2sk1QFO5
	MfHRKekHmgmFj8g9B0WMwJFbi6f/944Zjz+QhvDA1HkjO3jt9LTBuVtaUEwpzvvTipLy7KhHRQp
	N6qHz9gXugkAsAvV2bnWNY12Jmv11QugunJnC5413BHuID2LlJp6QbG42AOLd/Q5PujIvepoCj/
	UijVu3enl57O+OH5kI3hsHpAA44Zo8f31C8Fbc=
X-Google-Smtp-Source: AGHT+IHr7XithIowbjXVFs+i6pAlWuw+f5D5Wb8UWeiECA+8UMk1KihYLHHjQZ2Buxfq4zvGcnccTg==
X-Received: by 2002:a05:6402:3586:b0:640:c454:da with SMTP id 4fb4d7f45d1cf-6431a3948d1mr6059106a12.5.1763044778457;
        Thu, 13 Nov 2025 06:39:38 -0800 (PST)
Message-ID: <a17e86e4-f8c1-464d-b30d-42713f793ea5@suse.com>
Date: Thu, 13 Nov 2025 15:39:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 3/5] x86: hvm: factor out compat code under ifdefs
To: Jan Beulich <jbeulich@suse.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-4-grygorii_strashko@epam.com>
 <af736490-5f04-4fa8-9b73-4071b72e1c33@suse.com>
 <4e4aa540-514b-458f-8036-7941a0ecf268@epam.com>
 <be6f958b-ae23-4cd0-9dd7-c096ae36d39b@suse.com>
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
In-Reply-To: <be6f958b-ae23-4cd0-9dd7-c096ae36d39b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PNT7fsjPsml06FkLDo6Nl4al"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PNT7fsjPsml06FkLDo6Nl4al
Content-Type: multipart/mixed; boundary="------------qsy8rF5H46uYx7pH1GPqE8sK";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <a17e86e4-f8c1-464d-b30d-42713f793ea5@suse.com>
Subject: Re: [XEN][PATCH 3/5] x86: hvm: factor out compat code under ifdefs
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-4-grygorii_strashko@epam.com>
 <af736490-5f04-4fa8-9b73-4071b72e1c33@suse.com>
 <4e4aa540-514b-458f-8036-7941a0ecf268@epam.com>
 <be6f958b-ae23-4cd0-9dd7-c096ae36d39b@suse.com>
In-Reply-To: <be6f958b-ae23-4cd0-9dd7-c096ae36d39b@suse.com>
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

--------------qsy8rF5H46uYx7pH1GPqE8sK
Content-Type: multipart/mixed; boundary="------------zl1e7wuIsW00AWMA29GykUon"

--------------zl1e7wuIsW00AWMA29GykUon
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjUgMTQ6MjMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMy4xMS4yMDI1
IDE0OjE4LCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90ZToNCj4+IE9uIDEzLjExLjI1IDE0OjMw
LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxMS4xMS4yMDI1IDE4OjU0LCBHcnlnb3Jp
aSBTdHJhc2hrbyB3cm90ZToNCj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNh
bGwuYw0KPj4+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jDQo+Pj4+IEBA
IC0yOSwxMCArMjksMTIgQEAgbG9uZyBodm1fbWVtb3J5X29wKHVuc2lnbmVkIGxvbmcgY21k
LCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4+Pj4gICAgICAgICAgICBy
ZXR1cm4gLUVOT1NZUzsNCj4+Pj4gICAgICAgIH0NCj4+Pj4gICAgDQo+Pj4+IC0gICAgaWYg
KCAhdmNwdV9pc19oY2FsbF9jb21wYXQoY3VycmVudCkgKQ0KPj4+PiAtICAgICAgICByYyA9
IGRvX21lbW9yeV9vcChjbWQsIGFyZyk7DQo+Pj4+IC0gICAgZWxzZQ0KPj4+PiArI2lmZGVm
IENPTkZJR19DT01QQVQNCj4+Pj4gKyAgICBpZiAoIHZjcHVfaXNfaGNhbGxfY29tcGF0KGN1
cnJlbnQpICkNCj4+Pj4gICAgICAgICAgICByYyA9IGNvbXBhdF9tZW1vcnlfb3AoY21kLCBh
cmcpOw0KPj4+PiArICAgIGVsc2UNCj4+Pj4gKyNlbmRpZg0KPj4+PiArICAgICAgICByYyA9
IGRvX21lbW9yeV9vcChjbWQsIGFyZyk7DQo+Pj4NCj4+PiBXaHkgd291bGQgdGhpcyBiZSBu
ZWVkZWQgd2hlbiB2Y3B1X2lzX2hjYWxsX2NvbXBhdCgpIGFscmVhZHkgaG9ub3JzIENPTkZJ
R19DT01QQVQ/DQo+Pj4gKFNhbWUgcXVlc3Rpb24gdGhlbiBhcHBsaWVzIGVsc2V3aGVyZSwg
b2YgY291cnNlLikNCj4+DQo+PiBUaGlzIEkgZG8gbm90IGxpa2UgYnkgbXlzZWxmLCBidXQg
SSB3YXMgbm90IGFibGUgdG8gZmluZCBvdGhlciBvcHRpb25zIDooDQo+Pg0KPj4gaHlwZXJj
YWxsLWRlZnMuaCBpcyBhdXRvZ2VuZXJhdGVkIGFuZCBpdCdzIHRoZSBvbmx5IG9uZSBwbGFj
ZSB3aGVyZSBmdW5jdGlvbnMNCj4+IGRlY2xhcmF0aW9ucyBsaWtlIGRvX3hfb3AoKSBhcmUg
YXBwZWFyZWQgb3IgZGlzYXBwZWFyZWQuDQo+PiBTbyBidWlsZCBpcyBmYWlsaW5nIHdpdGhv
dXQgaWZkZWZzIGFzIGNvbXBpbGVyIGNhbid0IGZpbmQgY29tcGF0X21lbW9yeV9vcCgpDQo+
PiBkZWNsYXJhdGlvbi4NCj4gDQo+IE9oLCBJIHNlZTsgSSBoYWRuJ3QgdGhvdWdodCBvZiB0
aGF0IGFzcGVjdC4gSSB3b25kZXIgaWYgd2Ugd291bGRuJ3QgYmV0dGVyIHRha2UNCj4gY2Fy
ZSBvZiB0aGF0IGluIHRoZSBtYWNoaW5lcnkgdGhlcmUuIENjLWluZyBKw7xyZ2VuLCB3aG8g
ZGlkIGludHJvZHVjZSB0aGlzDQo+IG9yaWdpbmFsbHkuIE1heWJlIGhlIGhhcyBjb25jcmV0
ZSBhcmd1bWVudHMgYWdhaW5zdCB1cyBkb2luZyBzby4NCg0KTm8gYXJndW1lbnRzIGFnYWlu
c3QgaXQuDQoNCllvdSBwcm9iYWJseSB3aWxsIG5lZWQgYSBuZXcgUHJlZml4IGRlZmluZWQg
KGUuZy4gY29tcGF0X2Fsd2F5cykgYW5kIHNldCBpdCB2aWENCg0KI2RlZmluZSBQUkVGSVhf
Y29tcGF0X2Fsd2F5cyBjb21wYXQNCg0KdW5jb25kaXRpb25hbGx5LiBUaGVuIGl0IHNob3Vs
ZCBiZSBwb3NzaWJsZSB0byBoYXZlDQoNClByZWZpeDogY29tcGF0X2Fsd2F5cw0KbWVtb3J5
X29wKC4uLikNCg0Kb3V0c2lkZSBvZiAjaWZkZWZzIGFuZCBkcm9wIHRoZSBtZW1vcnlfb3Ao
KSBpbiB0aGUgI2lmZGVmIENPTkZJR19DT01QQVQgc2VjdGlvbi4NCg0KVGhpcyBzaG91bGQg
cmVzdWx0IGluIHRoZSBjb21wYXRfbWVtb3J5X29wKCkgcHJvdG90eXBlIHRvIGJlIGFsd2F5
cyBhdmFpbGFibGUuDQpIYXZpbmcgbm8gcmVsYXRlZCBmdW5jdGlvbiBzaG91bGQgYmUgbm8g
cHJvYmxlbSBkdWUgdG8gRENPIGluIGNhc2UgQ09ORklHX0NPTVBBVA0KaXNuJ3QgZGVmaW5l
ZC4NCg0KDQpKdWVyZ2VuDQo=
--------------zl1e7wuIsW00AWMA29GykUon
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------zl1e7wuIsW00AWMA29GykUon--

--------------qsy8rF5H46uYx7pH1GPqE8sK--

--------------PNT7fsjPsml06FkLDo6Nl4al
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkV7akFAwAAAAAACgkQsN6d1ii/Ey8Y
0QgAh1w1FzK6S05Z78qwkepFPrUbncQClgqYe824tHHuW4kWsPmREIsn5dpfljBYasq0YRlSYojm
eGy914MXD0TzrulER55w41nrMjOq1XjO3FDDzCEh4qv11yGxILFmdVJp72DArwPrOmcMmK5hA7Yq
So2X0SndHY8p2b7U/jR3xf/CaJvS6ErubwrlIn3N2sTnR/Coa0a4TJhcwjl3t+lA//ZIKFtpdBDS
bLNRqw3s4ilW4Cn/klrnhMJk9Io2HpgBk+nFCLsvr0peQhT12HzX7/Dv/P8xo2eceWN3cGQiDiZI
qvfuDIe8VC2ZtOYppzT/fCsXuMUAk9wSwgHafy5qhw==
=Qro5
-----END PGP SIGNATURE-----

--------------PNT7fsjPsml06FkLDo6Nl4al--

