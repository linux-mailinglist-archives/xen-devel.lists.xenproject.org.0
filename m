Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E18A01673
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 19:50:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865454.1276752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tU9Ds-0006GH-RE; Sat, 04 Jan 2025 18:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865454.1276752; Sat, 04 Jan 2025 18:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tU9Ds-0006En-OX; Sat, 04 Jan 2025 18:50:08 +0000
Received: by outflank-mailman (input) for mailman id 865454;
 Sat, 04 Jan 2025 18:50:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tU9Dr-0006Eh-AZ
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 18:50:07 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b68f7070-cacc-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 19:50:06 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso19361529a12.0
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jan 2025 10:50:06 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae4338sm2016788266b.86.2025.01.04.10.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jan 2025 10:50:04 -0800 (PST)
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
X-Inumbo-ID: b68f7070-cacc-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736016605; x=1736621405; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4xbqskmVl9LMF5WLmG6RtwR0GbsoUMiWmwvC3Jcln1s=;
        b=eRkYy93lHxMW51k8sCNnTtGyb3gGTUKkO3xIOp4+GXD03UP0AsPtN/vF2EZJ4exEeh
         WHX5JMCx9Xa1u2jbLrnajpwMwBS3CQOUykgsEHgtdjtYA3jK3BpzPjFNGxh3B80IE16g
         YPOd01Eftd1TrS4xQnP/SXF2Xv9QU7IabLt00iaQod2u+3XtKRwR3FhlDqe94yRhNuNW
         BfeYTfH+ZIA76T2Xrrp5W68E4J5z5yM8fDcWII+7xiXCto4otvsPq9VXUxdFSXY1DwQh
         ZR4vj8BaeEdCeBv9VVJok9wlq+xm68u2Vd7YbQ7dhjiH4lClkP9SXviCPZzfyYlAK3Kk
         erDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736016605; x=1736621405;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4xbqskmVl9LMF5WLmG6RtwR0GbsoUMiWmwvC3Jcln1s=;
        b=qOhYxzJxAWsZjqMwngmEMW77UZYCBN2VTH666WZfkC4+VarTnT195u0N+6WhKqaETA
         3t5erglK9oOg/21i3BWfwgko8ufIBNgAqvmd+sqtFOp/lMWxoK4PmGizKsNVtNQuPUe+
         9l2d2gFL10LA7yE3dlIanF9bTFTkUAXZXWFbjstHggQApvLcqmc0QumfcR+JlntlQZ9N
         JrL3d+NmpNdPzUkkMI2tsXQ9huajGLQqBPSdJNv3kMG9rrN/jJRHVGfXCL0bhA+OSCVc
         ssPe14tGmWFMV6r/LbMph+oOaTVsBzp/TxmtpOSIQPk66ExKzdH4yKpYeIipKcCm7NWS
         rU2w==
X-Forwarded-Encrypted: i=1; AJvYcCVDJR6z48eP9qflMp8kUz5HkF0dMDTg8/jlJU8ynwVmp1WYlmfGc5fzUPDUpkEFCn6RwNU5lfVzhRk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwANgspdR57FC+LpcR3savxdOVJt1nM4ajL5f6eKQm65FxfR2t
	s0efCP74lJMM30t0wGRcKBEWjsIAC99PGUBhwk7XgkfrLF8Dt2SJzOxmCMM0C0QqVx79TZptJQL
	HgWU=
X-Gm-Gg: ASbGncscopSE//zC8M1QEHbniz4bmWyAjiYKP3uMJnA9wujlQSxyK0iXqE2wclC0y1X
	bvJyhHid1nFdHbIcaoWmK5o9cDrflWxOhgpyr8d2aCzRoxN86CFcgSecFXevzZfGxsjoKwEVow3
	p2I9scugUyeTIMQA9d8wGIf2lm75nMYMTweYhYmyLuFkIQTLSaNAv4+3AhaZzKY17GO2BVj6jMY
	QgCEBvgpF/ekxO1gBAtG6O0zrvi5mveX+KyR+mVPKW8WVYzcnr1N1M1mz5SSqYKdecu+4gyfOy8
	kyXEZoZ8KRA+7ObkT1se/OLVto86CM+TKNjG4fwq0WtKHLtadjFoQsuFzsqDpY7jj2bReKFWqMk
	su8l1rA==
X-Google-Smtp-Source: AGHT+IH6JqlEdi4eLZUiMOVkc2LD7qe+olNkIH27IhakMmYwimzE1m1ZagTWYMDIG85xxLcbUnZIYw==
X-Received: by 2002:a05:6402:4403:b0:5d0:d2ed:ebb with SMTP id 4fb4d7f45d1cf-5d81dd83a72mr134588379a12.3.1736016605025;
        Sat, 04 Jan 2025 10:50:05 -0800 (PST)
Message-ID: <28947d4f-ab32-4a57-8dbb-e37fa4183a69@suse.com>
Date: Sat, 4 Jan 2025 19:50:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen/mmu: Increase MAX_CONTIG_ORDER
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Thierry Escande <thierry.escande@vates.tech>
References: <20241204171346.458105-1-thierry.escande@vates.tech>
 <ccb28ccc-531c-4ead-9a27-76cc430f8c35@suse.com>
 <cc61bdce-47af-45ea-8ace-173adef9ae41@vates.tech>
 <cbc389e4-3b69-4681-ad66-6102b0ed0cae@suse.com>
 <8fb77778-b821-4e38-a835-54883ba14e4b@suse.com>
 <ed764807-a58b-473c-911d-b52f013f89b2@vates.tech>
 <733e95a6-dd33-422a-a25b-9f08cef5860e@suse.com>
 <781a2f80-9ca6-4875-9b4a-ecef7694ae2e@suse.com>
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
In-Reply-To: <781a2f80-9ca6-4875-9b4a-ecef7694ae2e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yAX3fS0apYGCcAvBCMjz1MzQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yAX3fS0apYGCcAvBCMjz1MzQ
Content-Type: multipart/mixed; boundary="------------nF0PLdcdO0lDs4cED1rJUuCH";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Thierry Escande <thierry.escande@vates.tech>
Message-ID: <28947d4f-ab32-4a57-8dbb-e37fa4183a69@suse.com>
Subject: Re: [PATCH] x86/xen/mmu: Increase MAX_CONTIG_ORDER
References: <20241204171346.458105-1-thierry.escande@vates.tech>
 <ccb28ccc-531c-4ead-9a27-76cc430f8c35@suse.com>
 <cc61bdce-47af-45ea-8ace-173adef9ae41@vates.tech>
 <cbc389e4-3b69-4681-ad66-6102b0ed0cae@suse.com>
 <8fb77778-b821-4e38-a835-54883ba14e4b@suse.com>
 <ed764807-a58b-473c-911d-b52f013f89b2@vates.tech>
 <733e95a6-dd33-422a-a25b-9f08cef5860e@suse.com>
 <781a2f80-9ca6-4875-9b4a-ecef7694ae2e@suse.com>
In-Reply-To: <781a2f80-9ca6-4875-9b4a-ecef7694ae2e@suse.com>
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

--------------nF0PLdcdO0lDs4cED1rJUuCH
Content-Type: multipart/mixed; boundary="------------F0xkLDiSGwSCfzoa0qysJ23k"

--------------F0xkLDiSGwSCfzoa0qysJ23k
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTIuMjQgMDg6MTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOC4xMi4yMDI0
IDEyOjI0LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMTguMTIuMjQgMTI6MTEsIFRo
aWVycnkgRXNjYW5kZSB3cm90ZToNCj4+Pg0KPj4+DQo+Pj4gT24gMTIvMTIvMjAyNCAxMjow
OSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gT24gMTIuMTIuMjQgMTE6MjIsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMTEuMTIuMjAyNCAxOToyMCwgVGhpZXJyeSBFc2Nh
bmRlIHdyb3RlOg0KPj4+Pj4+IEhpIEphbiwNCj4+Pj4+Pg0KPj4+Pj4+IE9uIDA5LzEyLzIw
MjQgMTE6MDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+PiBPbiAwNC4xMi4yMDI0IDE4
OjE0LCBUaGllcnJ5IEVzY2FuZGUgd3JvdGU6DQo+Pj4+Pj4+PiBXaXRoIGNoYW5nZSA5ZjQw
ZWM4NGE3OTcgKHhlbi9zd2lvdGxiOiBhZGQgYWxpZ25tZW50IGNoZWNrIGZvciBkbWENCj4+
Pj4+Pj4+IGJ1ZmZlcnMpLCB0aGUgZHJpdmVyIG1wdDNzYXMgZmFpbHMgdG8gbG9hZCBiZWNh
dXNlIGl0IGNhbm5vdCBhbGxvY2F0ZQ0KPj4+Pj4+Pj4gaXRzIERNQSBwb29sIGZvciBhbiBh
bGxvY2F0aW9uIHNpemUgb2YgfjIsMyBNQnl0ZXMuIFRoaXMgaXMgYmVjYXVzZQ0KPj4+Pj4+
Pj4gdGhlDQo+Pj4+Pj4+PiBhbGlnbmVtZW50IGNoZWNrIGFkZGVkIGJ5IDlmNDBlYzg0YTc5
NyBmYWlscyBhbmQNCj4+Pj4+Pj4+IHhlbl9zd2lvdGxiX2FsbG9jX2NvaGVyZW50KCkgZW5k
cyB1cCBjYWxsaW5nDQo+Pj4+Pj4+PiB4ZW5fY3JlYXRlX2NvbnRpZ3VvdXNfcmVnaW9uKCkg
d2l0aCBhIHNpemUgb3JkZXIgb2YgMTAgd2hpY2ggaXMgdG9vDQo+Pj4+Pj4+PiBoaWdoDQo+
Pj4+Pj4+PiBmb3IgdGhlIGN1cnJlbnQgbWF4IHZhbHVlLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+
IFRoaXMgcGF0Y2ggaW5jcmVhc2VzIHRoZSBNQVhfQ09OVElHX09SREVSIGZyb20gOSB0byAx
MCAoNE1CKSB0byBhbGxvdw0KPj4+Pj4+Pj4gc3VjaCBhbGxvY2F0aW9ucy4NCj4+Pj4+Pj4+
DQo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IEVzY2FuZGUgPHRoaWVycnkuZXNj
YW5kZUB2YXRlcy50ZWNoPg0KPj4+Pj4+Pj4gLS0tDQo+Pj4+Pj4+PiAgIMKgIGFyY2gveDg2
L3hlbi9tbXVfcHYuYyB8IDIgKy0NCj4+Pj4+Pj4+ICAgwqAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gveDg2L3hlbi9tbXVfcHYuYyBiL2FyY2gveDg2L3hlbi9tbXVfcHYuYw0K
Pj4+Pj4+Pj4gaW5kZXggNTVhNDk5NmQwYzA0Li43ZjExMDc0MGUxYTIgMTAwNjQ0DQo+Pj4+
Pj4+PiAtLS0gYS9hcmNoL3g4Ni94ZW4vbW11X3B2LmMNCj4+Pj4+Pj4+ICsrKyBiL2FyY2gv
eDg2L3hlbi9tbXVfcHYuYw0KPj4+Pj4+Pj4gQEAgLTIyMDAsNyArMjIwMCw3IEBAIHZvaWQg
X19pbml0IHhlbl9pbml0X21tdV9vcHModm9pZCkNCj4+Pj4+Pj4+ICAgwqAgfQ0KPj4+Pj4+
Pj4gICDCoCDCoCAvKiBQcm90ZWN0ZWQgYnkgeGVuX3Jlc2VydmF0aW9uX2xvY2suICovDQo+
Pj4+Pj4+PiAtI2RlZmluZSBNQVhfQ09OVElHX09SREVSIDkgLyogMk1CICovDQo+Pj4+Pj4+
PiArI2RlZmluZSBNQVhfQ09OVElHX09SREVSIDEwIC8qIDRNQiAqLw0KPj4+Pj4+Pj4gICDC
oCBzdGF0aWMgdW5zaWduZWQgbG9uZyBkaXNjb250aWdfZnJhbWVzWzE8PE1BWF9DT05USUdf
T1JERVJdOw0KPj4+Pj4+Pg0KPj4+Pj4+PiBXaGlsZSBsYWNraW5nIHJlc3BlY3RpdmUgY29t
bWVudGFyeSwgYnVtcGluZyB0aGlzIHZhbHVlIGltbyBhbHNvDQo+Pj4+Pj4+IG5lZWRzIHRv
DQo+Pj4+Pj4+IHRha2UgaW50byBhY2NvdW50IFhlbiBpdHNlbGYsIGF0IGxlYXN0IGNvbW1p
dC1tZXNzYWdlLXdpc2UuIFRoZQ0KPj4+Pj4+PiBidW1waW5nIGlzDQo+Pj4+Pj4+IGZpbmUg
Zm9yIERvbTAgaW4gYW55IGV2ZW50LiBJdCBpcyBhbHNvIGZpbmUgZm9yIERvbVUtcyB3aXRo
IHRoZQ0KPj4+Pj4+PiBkZWZhdWx0cw0KPj4+Pj4+PiBidWlsdCBpbnRvIHRoZSBoeXBlcnZp
c29yIChvcmRlcnMgMTIgYW5kIDEwIHJlc3BlY3RpdmVseSBmb3IgeDg2IGFuZA0KPj4+Pj4+
PiBBcm0pLA0KPj4+Pj4+PiB5ZXQgZXNwZWNpYWxseSBmb3IgQXJtIChhbmQgaW4gdGhlIGZ1
dHVyZSBQUEMgYW5kIFJJU0MtVikgYW55IGZ1cnRoZXINCj4+Pj4+Pj4gYnVtcGluZyB3b3Vs
ZCBiZSBsZXNzIHN0cmFpZ2h0Zm9yd2FyZC4NCj4+Pj4+Pg0KPj4+Pj4+IFRoYW5rcyBmb3Ig
cG9pbnRpbmcgdGhpcyBvdXQuIE9uIHRoZSBYZW4gc2lkZSwgQ09ORklHX0NUTERPTV9NQVhf
T1JERVINCj4+Pj4+PiBhbmQgQ09ORklHX0hXRE9NX01BWF9PUkRFUiBzZWVtIGJpZyBlbm91
Z2ggb24gYWxsIGFyY2hpdGVjdHVyZXMuIEJ1dCBJDQo+Pj4+Pj4gc2VlIENPTkZJR19ET01V
X01BWF9PUkRFUiBzZXQgdG8gOSAoYWxzbyBhbGwgYXJjaHMpLiBXb24ndCB0aGF0IGJlIGEN
Cj4+Pj4+PiBwcm9ibGVtIGZvciBkcml2ZXJzIHRyeWluZyB0byBhbGxvY2F0ZSBtb3JlIHRo
YW4gdGhhdCBmcm9tIGEgZG9tVSA/DQo+Pj4+Pg0KPj4+Pj4gQSBkcml2ZXIgYXNzdW1lcyBh
IChwaHlzaWNhbCkgZGV2aWNlIHRvIGJlIGluIHRoZSBEb21VLCBhdCB3aGljaCBwb2ludCBp
dA0KPj4+Pj4gaXMgQ09ORklHX1BURE9NX01BWF9PUkRFUiB3aGljaCBhcHBsaWVzIChQVCBz
dGFuZGluZyBmb3IgcGFzcy10aHJvdWdoKS4NCj4+Pj4+DQo+Pj4+Pj4+IEhvd2V2ZXIgLSBk
b2VzIHRoZSBkcml2ZXIgcmVhbGx5IG5lZWQgdGhpcyBiaWcgYSBjb250aWd1b3VzIGNodW5r
PyBJdA0KPj4+Pj4+PiB3b3VsZCBzZWVtIGZhciBtb3JlIGRlc2lyYWJsZSB0byBtZSB0byBi
cmVhayB0aGF0IHVwIHNvbWUsIGlmIHBvc3NpYmxlLg0KPj4+Pj4+DQo+Pj4+Pj4gU2luY2Ug
dGhpcyB3b3JrcyBvbiBiYXJlIG1ldGFsIEknbSBhZnJhaWQgdGhlIGRyaXZlciBtYWludGFp
bmVyIChtcHQNCj4+Pj4+PiBmdXNpb24gZHJpdmVyKSB3aWxsIGp1c3QgdGVsbCBtZSB0byBm
aXggWGVuLg0KPj4+Pj4NCj4+Pj4+IFdlbGwuIFRoZSBiaWdnZXIgc3VjaCBhbGxvY2F0aW9u
cywgdGhlIGxhcmdlciB0aGUgcmlzayB0aGF0IG9uIHN5c3RlbXMNCj4+Pj4+IHRoYXQgaGF2
ZSBiZWVuIHVwIGZvciBhIHdoaWxlIHN1Y2ggYWxsb2NhdGlvbnMgY2FuJ3QgYmUgZnVsZmls
bGVkIGFueW1vcmUNCj4+Pj4+IGV2ZW4gaW4gdGhlIGJhcmUgbWV0YWwgY2FzZS4NCj4+Pj4N
Cj4+Pj4gWWVzLiBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBqdXN0IHdvcmsgYXJvdW5kIHRo
aXMgaXNzdWUgd2l0aG91dCBoYXZpbmcNCj4+Pj4gZXZlbiB0cmllZCB0byBnZXQgdGhlIGRy
aXZlciBmaXhlZC4gSW4gY2FzZSB0aGV5IHJlZnVzZSB0byBjaGFuZ2UgaXQsIHdlDQo+Pj4+
IGNhbiBzdGlsbCBpbmNyZWFzZSBNQVhfQ09OVElHX09SREVSLg0KPj4+DQo+Pj4gVGhhbmtz
IGZvciB0aGUgZmVlZGJhY2suIEknbGwgdHJ5IHRvIGhhdmUgYSBsb29rIGF0IHRoZSBkcml2
ZXIgaWYgSSBoYXZlDQo+Pj4gdGltZSB0byBkbyBzby4NCj4+DQo+PiBBbm90aGVyIHRob3Vn
aHQgd291bGQgYmUgdG8gY2hhbmdlIHRoZSBnZW5lcmljIERNQSBhbGxvY2F0aW9uIHRvIG5v
dCByZXF1aXJlDQo+PiBhbGlnbm1lbnQgYmFzZWQgb24gdGhlIHJvdW5kZWQgdXAgc2l6ZSwg
YnV0IG9uIHRoZSBsYXJnZXN0IHBvd2VyLW9mLTIgY2h1bmsNCj4+IGZpdHRpbmcgaW50byB0
aGUgcmVxdWVzdGVkIHNpemUuDQo+Pg0KPj4gSSBkb24ndCBzZWUgd2h5IGEgMi4zIE1CIG1l
bW9yeSBhbGxvY2F0aW9uIHdvdWxkIG5lZWQgdG8gYmUgNCBNQiBhbGlnbmVkLiBJdA0KPj4g
c2hvdWxkIGJlIHBlcmZlY3RseSBmaW5lIHRvIGFsaWduIGl0IHRvIDIgTUIgb25seS4NCj4g
DQo+IFlldCB0aGF0IHdvdWxkbid0IG1ha2UgYSBkaWZmZXJlbmNlIGhlcmUsIHdvdWxkIGl0
PyBXZSdkIHN0aWxsIG5lZWQgYSA0TQ0KPiBjaHVuayBvZiBjb250aWd1b3VzIHNwYWNlLCBq
dXN0IHdpdGggbGVzcyBhbGlnbm1lbnQuDQoNClRoaWVycnkgc3RhdGVkIHRoYXQgdGhlIGRy
aXZlciBmYWlsZWQgdG8gbG9hZCBkdWUgdG8gdGhlIGFkZGVkIGFsaWdubWVudA0KY2hlY2sg
aW50cm9kdWNlZCB3aXRoIGNvbW1pdCA5ZjQwZWM4NGE3OTcuIEkgd2FzIHRhcmdldGluZyB0
aGlzIHJlYXNvbmluZw0Kd2l0aCBteSByZW1hcmsuDQoNCg0KSnVlcmdlbg0K
--------------F0xkLDiSGwSCfzoa0qysJ23k
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------F0xkLDiSGwSCfzoa0qysJ23k--

--------------nF0PLdcdO0lDs4cED1rJUuCH--

--------------yAX3fS0apYGCcAvBCMjz1MzQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmd5gtsFAwAAAAAACgkQsN6d1ii/Ey+x
vAf9EpuElybnNEEe9MbecnRp1rVysKEEOKEdT6yJK0gKIFkGQc8iinyH+wdQmf1hu1ptTgbLOnzh
jGPw3CpYCrtsXFe7e/lkLJ3ayyon2EOfExt/SH/v6jyqI8Fz1N0fip718VQe/qeVyrMjB+Bq3kTI
G1Ot3yeQOYYYQ3kSICfpbSnVfsPWexTaUWdbioIMmBBHOqbLs1NIsvWQV+B4aDoXtD5I7wVS4MwP
d8rp5NFN0oftNuJceYAWQBYugdNj/icH4BTn2CPXag3KmUYSY2YrrXurtxZ9VHzMJZwiYeZmkAnr
KFtQ+FLGxCtt3wk4lz8e6v6dqsXYCNeWmZmG0mTFzg==
=cyGI
-----END PGP SIGNATURE-----

--------------yAX3fS0apYGCcAvBCMjz1MzQ--

